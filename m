Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C02E2969B92
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 13:24:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CBD110E4A2;
	Tue,  3 Sep 2024 11:24:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="BrOCpz8l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B748010E4A2
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 11:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725362654;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2pSNCLSbIMoFviNER5g8TfLmLnq+IvKF9riHz/S803E=;
 b=BrOCpz8lZquVzVXMXqjUKbte4FB0jrvJInA2XW7VnpPvmmkzqKy8oj03/MELb4AQcSrshi
 buDYsAIxJsH8+jofzSYKvI64/C024ykLic5kM9TxlPayUUxjwojplOgC9hYHgfzcPwCM4x
 l+1ryAmVJvNWtkia/QBSpTFaO+CViVY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-62-8mVi6X4OPT6JLqdo3lgXAQ-1; Tue, 03 Sep 2024 07:24:13 -0400
X-MC-Unique: 8mVi6X4OPT6JLqdo3lgXAQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-37496a7daf2so3525399f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2024 04:24:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725362652; x=1725967452;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2pSNCLSbIMoFviNER5g8TfLmLnq+IvKF9riHz/S803E=;
 b=aK2HfZO2wen3otPSwrQg2XamUlkUc1ripJrwdMYuW4Ui+atJqg/DjhyLUxCJQI2MRB
 kkrmHzWgVPVD02+WXTnD4+JZGuG5McNJAXDhbX9ByuMxl96HQsRNzmdOwjmHu7EfFggw
 DuAQSwI5hbffNvAmx5TnVOnNggARRW9iP8exL5N9m/y6dgKf5VOHoXLDlSqL0PuXnD/Z
 m0Ek3fnNkoFlzVIwvsKAXVhkXB0cJKX4sPxVZbSZ7/r2IMHvxhxTFKBByepsoVTMLoH4
 PG8+yD3XejzdhyOGHLAbObZYwPJ5awoRLyG7ZQOIiEeN6svtrOKfLCL3V1FpZ8xCey5g
 8U9g==
X-Gm-Message-State: AOJu0YxJPRIkmvsQVouzRvgaGtihRiFP0nrHC8NvWyJACD/HX/W0V+sX
 k6edH8/8kYwq2urGjMGiivZOFT8e74ot5aSeRDPsntoQC+HyXXVE2R90gYh26ssG/0ragtc5oS/
 OjZYyWfrvacGHsM94PoR7Q3pSLTZK7FhqUAhwFmE+7FH8muEq10Z1+2a5WFYBCeMjaQ==
X-Received: by 2002:a5d:66ce:0:b0:374:b960:facf with SMTP id
 ffacd0b85a97d-376df005691mr261401f8f.58.1725362652530; 
 Tue, 03 Sep 2024 04:24:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFfMTx0LxlS9Vbxx5qqNkZNnc83gbfH8tZBpkVQ/eip0g3zytayB3JyreNf5DmRURM4ZJWCVA==
X-Received: by 2002:a5d:66ce:0:b0:374:b960:facf with SMTP id
 ffacd0b85a97d-376df005691mr261378f8f.58.1725362652054; 
 Tue, 03 Sep 2024 04:24:12 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-374c554f0c2sm7431928f8f.43.2024.09.03.04.24.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 04:24:11 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
Subject: Re: [PATCH v3 18/81] drm/ili9486: Run DRM default client setup
In-Reply-To: <20240830084456.77630-19-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-19-tzimmermann@suse.de>
Date: Tue, 03 Sep 2024 13:24:10 +0200
Message-ID: <87ttexf09x.fsf@minerva.mail-host-address-is-not-set>
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

> Call drm_client_setup() to run the kernel's default client setup
> for DRM. Set fbdev_probe in struct drm_driver, so that the client
> setup can start the common fbdev client.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
> ---
>  drivers/gpu/drm/tiny/ili9486.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

