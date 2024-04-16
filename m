Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5070F8A69DD
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 13:44:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E2D5112BDB;
	Tue, 16 Apr 2024 11:44:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="KbFIC/D3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B31F3112BDB
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 11:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1713267880;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QZpT1KHN3Ra85iYsL9oCjeZNH/FA/S5mYHWG+FDh+RY=;
 b=KbFIC/D3vcA2ANY9hqOdvWY6+5DH1c9MgeR0/tw4IyKIu1EWzSWvUo5NYdVgIv3ESuwDH/
 qAqz8nT0wceQ/dLT3Y39MJYr+j8ZbY0kFUJnGGaBuIhQh+oo+ZuQutBbupj+Ozn+oRVrmF
 kYMfjtCvMxVQ0u0IDBb96qVWtQi2YW4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-199-Z8d5kmb1OIavGOvNJKaEcg-1; Tue, 16 Apr 2024 07:44:39 -0400
X-MC-Unique: Z8d5kmb1OIavGOvNJKaEcg-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-343e00c8979so2971184f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 04:44:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713267878; x=1713872678;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QZpT1KHN3Ra85iYsL9oCjeZNH/FA/S5mYHWG+FDh+RY=;
 b=u9RCJf9NjTfjBudrVlUxmcS2VJvcyPS3nHVErr0pWckmJrmqRI0dUW7f/5hBRDB+mG
 Wu3MVgYjngihgbmwiNBmjv5f/2RDB3/rGHY8af/fydhaBmpYaM4ON7ozUnVMLsy5vEoV
 mdIFaWXgYpBYXAzRmn3H9QUDSoAlwB8e+gwfHMcDrZ3Ul1SCW19Dz/oe6o8Kx9ZbnznI
 VgPJr8/xUOznwDLASke7qVIrGK/S9j590aqVG/BbehbQdJOUQTGpdyKSnEyx6rh+ZCmu
 mSyvGPJQx8KyMVnKl2PPPYwFQs/90nwD3I/T6Riiri8ZeSBizhDEtRoM1M3GuMMoR6nW
 7fQw==
X-Gm-Message-State: AOJu0Yw82WPYHny+oZ8fyix44QfeQzMjTRHTrUrp5dh/yS8VTNuOf9ph
 LmVtQDt/1Wobl/jeA84UdJldtkMwTox4M1WzVDh/1GJjrPi/MhWABv5Ymx53JNkOggFHqw9NzXS
 Ud/h0QP19GRcO67KHGbs3S3WgCakF7qgPzu/8vByfI/igpn7nzTJbm8dF+oiDhoHBYg==
X-Received: by 2002:a5d:630c:0:b0:343:7e98:e73e with SMTP id
 i12-20020a5d630c000000b003437e98e73emr7605339wru.40.1713267878351; 
 Tue, 16 Apr 2024 04:44:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGHv2uaDfVMQXt3r+gLl6LzXP3JoIZXKlb9D3CptY6IRFB5PAQrjI+yOFUxjeAqv9XQXa10LQ==
X-Received: by 2002:a5d:630c:0:b0:343:7e98:e73e with SMTP id
 i12-20020a5d630c000000b003437e98e73emr7605328wru.40.1713267877881; 
 Tue, 16 Apr 2024 04:44:37 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 s29-20020adfa29d000000b00348cd3e612esm1784260wra.53.2024.04.16.04.44.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Apr 2024 04:44:37 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de,
 airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, Thomas
 Zimmermann <tzimmermann@suse.de>, Rodrigo Siqueira
 <rodrigosiqueiramelo@gmail.com>, Melissa Wen <melissa.srw@gmail.com>,
 =?utf-8?Q?Ma=C3=ADra?= Canal <mairacanal@riseup.net>, Haneen Mohammed
 <hamohammed.sa@gmail.com>
Subject: Re: [PATCH v2 20/43] drm/vkms: Use fbdev-shmem
In-Reply-To: <20240410130557.31572-21-tzimmermann@suse.de>
References: <20240410130557.31572-1-tzimmermann@suse.de>
 <20240410130557.31572-21-tzimmermann@suse.de>
Date: Tue, 16 Apr 2024 13:44:36 +0200
Message-ID: <874jc17crf.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
> Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> Cc: Melissa Wen <melissa.srw@gmail.com>
> Cc: "Ma=C3=ADra Canal" <mairacanal@riseup.net>
> Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

