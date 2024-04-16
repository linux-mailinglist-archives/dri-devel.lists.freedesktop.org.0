Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D86C88A6B2D
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 14:37:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D71F112C3E;
	Tue, 16 Apr 2024 12:37:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="hA2IZvnD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67696112C3E
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 12:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1713271029;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=r7M4lJbOMB+MaRK2MWiYqIYz+E+U1SfQnC1Ii35vu+o=;
 b=hA2IZvnDpsO6M1JundYLGlpRj0+oYFhIGw8vKKzkCI2Jgbd05lSIHd0t3OSg7R65Dhvt1p
 47bV3G2vkkm1SSsRHl0xKlTnUrIdB0dv53XlvOa2GBebvgZvylDFRgrKQS/XUZKabx/IBo
 DT96avbcFGCzgJRMbip/bxHuWJVIxQI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-121-wjKZnz88M4Ow4d1JMgUnBA-1; Tue, 16 Apr 2024 08:37:08 -0400
X-MC-Unique: wjKZnz88M4Ow4d1JMgUnBA-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-346b9be0a66so3185555f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 05:37:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713271027; x=1713875827;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=r7M4lJbOMB+MaRK2MWiYqIYz+E+U1SfQnC1Ii35vu+o=;
 b=QsIh5CuMPANXCVrnfEy2ACIdOVJgWJoIoMluPoVsdjirGA4GTSetZH17qacJdEqs1L
 AY55vSWCS1SFIUyEtCB1A8Lk9SfDPsx8zMRhl7MUdMW6PEwUts7FvPx1T1WDo+mWqYvM
 rCI9EzhYpHENMUa91Xq5u4JP1WkUrtxB00NKbBPaWqwRiaGjd8otQhgseP5Yl9JMBYjA
 E55buCelRzpH1FJN3vG45LtozNvJ4WWAhw8HpSPyjju35D7NtoNwCv4L4A7BqY/bZ/F/
 Mwdo0KZYf0uOstzZzPI5ryZzZqYSv7jNwNt3FUYsI8RlfyX+Rf7eGV6LU2zmgeK/6qys
 QrkA==
X-Gm-Message-State: AOJu0YyRdpS6/+HqOJbUAU42Q9VA/9ucqiebipjmFiudTbRbNoAZFLjd
 D5rS48d9aVK8LXQKUy6t9F+jPvL1t+zifalKv9iaHpjb+a3OcTpiIqSBR4bcokiENLGTy4SUtcA
 MUhqNyS6IK0LbOKflMukjg+XJZG691W4AhnXLo6VhmLtFtby+CUREYRL/nCyw7OAy1g==
X-Received: by 2002:a5d:4490:0:b0:343:ad7e:5bc5 with SMTP id
 j16-20020a5d4490000000b00343ad7e5bc5mr8830985wrq.57.1713271027321; 
 Tue, 16 Apr 2024 05:37:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHISOalX7TmxUo1ne2GIazBgoTXrzK9kZ/08C/F1XYqJbsMOd9NIlUm/mAKh3lYaCY7WVFnJA==
X-Received: by 2002:a5d:4490:0:b0:343:ad7e:5bc5 with SMTP id
 j16-20020a5d4490000000b00343ad7e5bc5mr8830975wrq.57.1713271027057; 
 Tue, 16 Apr 2024 05:37:07 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 i2-20020adfe482000000b00343bd6716b3sm14753026wrm.99.2024.04.16.05.37.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Apr 2024 05:37:06 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de,
 airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, Thomas
 Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 32/43] drm/tiny/hx8357d: Use fbdev-dma
In-Reply-To: <20240410130557.31572-33-tzimmermann@suse.de>
References: <20240410130557.31572-1-tzimmermann@suse.de>
 <20240410130557.31572-33-tzimmermann@suse.de>
Date: Tue, 16 Apr 2024 14:37:05 +0200
Message-ID: <87h6g15vri.fsf@minerva.mail-host-address-is-not-set>
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

> Implement fbdev emulation with fbdev-dma. Fbdev-dma now supports
> damage handling, which is required by hx8357d. Avoids the overhead of
> fbdev-generic's additional shadow buffering. No functional changes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

