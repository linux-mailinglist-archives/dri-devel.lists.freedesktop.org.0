Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D9B8AA8D8
	for <lists+dri-devel@lfdr.de>; Fri, 19 Apr 2024 09:04:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0502E10E281;
	Fri, 19 Apr 2024 07:04:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="fGXCCNpA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8872F10E281
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Apr 2024 07:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1713510243;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sHuEH/8T8ho9ggnTIrjh4+mWTVgr/tS94Z/G4jbQNR0=;
 b=fGXCCNpAkSMFFXrYVC5bu9ZtNiFn1q8+LKoJklaZNRgLtC8HXl4wZ9fagcZ35p98raw84C
 2KxA5HkFAlxXpFFCfhBqN5/6ODk0S0/yRbHqvRUitmofVVZdJ52svKmPo3jBgi2yrGrCRX
 7AtJ7gaAy8iEc/ne6/lDKe/Z4SiCe2g=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-433-PLXZoDXHNiqCI_vxALpZTQ-1; Fri, 19 Apr 2024 03:03:59 -0400
X-MC-Unique: PLXZoDXHNiqCI_vxALpZTQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-347ddb973dcso1036038f8f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Apr 2024 00:03:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713510238; x=1714115038;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sHuEH/8T8ho9ggnTIrjh4+mWTVgr/tS94Z/G4jbQNR0=;
 b=wVso0SEgiB7WkBce+FMwkdlBWsVO3hgE8bP6LvJz7wRxIGQCVBaSTZhu6mhdNALQ34
 Qur344D2rxgJ87nulL9wbRa0VMmmGQ/ba5ugt0UssAdjQsWg4vEeqpqv3GkMnHwc97jI
 Sj+oSAgUozC1v9XsDO1U03Vfb5BBbL7mDsJMEk3+BGvG2+8Bp/nNRlWfExogbGa0npPP
 MRRuXuN+uyQFe3lIKoAOd3pFrVUgN8g3t/eXi6uM1wM/ZnxCCMrjO4zPBSUrm+foZLY2
 7SpAgqe6y/IW+q5WNauKxLV9l6fQEFvKwYkpmwLXOieFCn5FSBY/5iTftnKMHuB+vRTe
 n63Q==
X-Gm-Message-State: AOJu0Yyb3x+5xQ0xIN6D/r+Jb18DJrUx9v/NrU1wosmNH8nFvRxUYyLM
 rBq45ExIy0UkOf0ArWBBW4FjXI9KKl/Dqk5uRF/avrWzsODFTmuHqUZSRuY8MsKt1moM64ZV4lz
 7he5uC6s68k06AHbnXGjeoKWxAuE3nzDmCjZ9CDxOR53VJ4qRFQaOEolAFHcVSNMo5g==
X-Received: by 2002:adf:eed0:0:b0:33e:c410:a1cd with SMTP id
 a16-20020adfeed0000000b0033ec410a1cdmr607074wrp.69.1713510238210; 
 Fri, 19 Apr 2024 00:03:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhqZub95bPXvsIY1tEqRueopWbhOus1raU6vUAD6cUmDrmcejh0jPcsNh/gyKe2VFyuLRWsA==
X-Received: by 2002:adf:eed0:0:b0:33e:c410:a1cd with SMTP id
 a16-20020adfeed0000000b0033ec410a1cdmr607052wrp.69.1713510237664; 
 Fri, 19 Apr 2024 00:03:57 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 cp37-20020a056000402500b00341de3abb0esm3703659wrb.20.2024.04.19.00.03.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Apr 2024 00:03:57 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de,
 airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, Thomas
 Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@redhat.com>, Gerd
 Hoffmann <kraxel@redhat.com>, Gurchetan Singh
 <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, Dmitry
 Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v2 19/43] drm/virtio: Use fbdev-shmem
In-Reply-To: <20240410130557.31572-20-tzimmermann@suse.de>
References: <20240410130557.31572-1-tzimmermann@suse.de>
 <20240410130557.31572-20-tzimmermann@suse.de>
Date: Fri, 19 Apr 2024 09:03:56 +0200
Message-ID: <878r19esv7.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Implement fbdev emulation with fbdev-shmem. Avoids the overhead of
> fbdev-generic's additional shadow buffering. No functional changes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@redhat.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Gurchetan Singh <gurchetansingh@chromium.org>
> Cc: Chia-I Wu <olvaffe@gmail.com>
> Tested-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

