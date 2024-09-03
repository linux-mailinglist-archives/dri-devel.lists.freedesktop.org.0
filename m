Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF001969B54
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 13:15:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C60B10E486;
	Tue,  3 Sep 2024 11:15:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="RVm0TRaE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A62010E484
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 11:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725362102;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qPIaWn3XKTIUYS+fskj3MRFK24/VwACXAg9gDBEvo1Q=;
 b=RVm0TRaEbuKhsGY740Jz1XcERq637dAA865C5NqGloni+OFgcDarEmQlckuMcqybVCq4H0
 iGq/49FZ1mgikHluXEx9D3vxccAbzHJIcC7Bos33dhMEynGCCncr7Xn1DWE9lPftqqSEa0
 T9rr6EuUM6SqzZVL5d7wEa19AdQBOh4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-518-Q0KmMq-2OqSgR0exbRAt-w-1; Tue, 03 Sep 2024 07:15:01 -0400
X-MC-Unique: Q0KmMq-2OqSgR0exbRAt-w-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-374b385b146so1943785f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2024 04:15:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725362100; x=1725966900;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qPIaWn3XKTIUYS+fskj3MRFK24/VwACXAg9gDBEvo1Q=;
 b=Rq9e2SW9TaBRtvLML9WhIqIElI4EhleWOSXV6LS82QfcPU3oX96+JUb63AUJx+LNZJ
 bZDvWhzAoogyMQk+t48LIbfe1ommNOpXQF7iIVwsn89e94a+quVQbnLv+lFAAO/tW7Jq
 /SsR8q5bQVoknhgNhA2HvxsD8BU4D51EZol2AFVfm2DctH8RVgDUlrdJnVLbx09b2l2r
 47Us3d18bx8jmz+CA2xf9KAyb9jcJPK0mJAZvcmfmotOUaPvvROLXYhdUB8HAJWMBnlM
 JY89EnNEbXbXQCqHoK2NXmOnIsajdAXmvsxzjCgPHD0q/LgchRy6OImoyL5qMciTHrHR
 I75A==
X-Gm-Message-State: AOJu0YzmvQtVBPON0cuVWqZDVw8dMT3r0i4phVnzsUa+kjf1iXcnixfl
 5mXGqs/nz0hksyUAVMsoR03E6PN0foJ+LLQYvqv1FEXZE5qVKaVsRecD+fTk/hyvl+P4aq4CUST
 T2juzA8tYFQnn9Ak4vzhdM4D2q3wVrXTQxdt9Kx87xWk/4QN7E3TNhZXBGF+f0KeN8g==
X-Received: by 2002:adf:ffc6:0:b0:374:c075:ff34 with SMTP id
 ffacd0b85a97d-376dea47229mr253925f8f.38.1725362099846; 
 Tue, 03 Sep 2024 04:14:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEr9s7pVNolnOfMNcbdY8XHk0ufGy7cJsjGqLu3OjVig8fSkTk0+X4NyG6sNUsFTrkUHEkNUg==
X-Received: by 2002:adf:ffc6:0:b0:374:c075:ff34 with SMTP id
 ffacd0b85a97d-376dea47229mr253900f8f.38.1725362099279; 
 Tue, 03 Sep 2024 04:14:59 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-374ba3da654sm10294803f8f.89.2024.09.03.04.14.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 04:14:59 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>
Subject: Re: [PATCH v3 12/81] drm/fsl-dcu: Run DRM default client setup
In-Reply-To: <20240830084456.77630-13-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-13-tzimmermann@suse.de>
Date: Tue, 03 Sep 2024 13:14:58 +0200
Message-ID: <878qw9gf9p.fsf@minerva.mail-host-address-is-not-set>
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

> Call drm_client_setup_with_color_mode() to run the kernel's default
> client setup for DRM. Set fbdev_probe in struct drm_driver, so that
> the client setup can start the common fbdev client.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Stefan Agner <stefan@agner.ch>
> Cc: Alison Wang <alison.wang@nxp.com>
> ---
>  drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

