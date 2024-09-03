Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3642C969B7E
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 13:21:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A13D10E49B;
	Tue,  3 Sep 2024 11:21:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="e4qM8i0/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8895710E49A
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 11:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725362480;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IQTpGzPFQqB5gAShloE0zxFF7qqYRFvzMaH5N3OQkCs=;
 b=e4qM8i0/QDug9VCPJoIelXDgZF6XSvw9+/4VAy+1SjUN7NAyuH0yjXzVz+lanhWO2qo7WL
 uQPMPV+/YCMcFCib3IcsrOqflPQMZpBN/fPdW2M1zdQbUPc3y1Nl81ySZV5wsVnZBTU2X/
 mcV+1tz+D/lmQuoIQMuGW+zplNeVJNQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-46-njoPtPfPOSWP1ZEXJOnEwg-1; Tue, 03 Sep 2024 07:21:19 -0400
X-MC-Unique: njoPtPfPOSWP1ZEXJOnEwg-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-42c7936e564so27660455e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2024 04:21:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725362478; x=1725967278;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IQTpGzPFQqB5gAShloE0zxFF7qqYRFvzMaH5N3OQkCs=;
 b=YEZ5IuSScscrwfg9Hwv27JXjlG8Ig6I2WyFzBUlVDmir+AbfowVkT9zCISQ4m+jaAh
 nr5mlYf7MuaV07dGi5UH+1gdmFu97QkZxzBTSlAe5YxK9KLhVZ20oh7LUgo+b+NIA3zS
 AlzTJFXY/QpIBqr7lT7YLEM+NTxknETNaTy22nHDwujJnrrvaFfTjTD7Gyue04OSk4h4
 PpjR6JaqoztrB+q2+cZRQOcvrDrrNYOj0CEobCVmX04oZw3fOzM3M8cJNNhUS254A/1u
 oDSZCkA3eZdKnM1k4jKu4DWbDvZxTgVAI9tu9PcVsJoTRCeYCzzQErJ3ZfbCbB1tH7FS
 0SxQ==
X-Gm-Message-State: AOJu0YybgHVUuas/6Gofufcr0iHeR6tu+7Ad0tOsrPuS5aQxSCrFmaNl
 I89/MpRO5YsXiplOnT4PtZG67Vl8cGZy0G1ToFwIYOC06i9LhUeuvc5xSH0aSGGwMj0ZzgpQz6R
 7hZc7oSvH2wmcgDLnoLzlf7hVOtaSA/d7niyC0ctQviauRNsRqASky5JoqqLugPMapA==
X-Received: by 2002:adf:a30c:0:b0:374:baf1:41cb with SMTP id
 ffacd0b85a97d-374ecc67bacmr2268357f8f.4.1725362478469; 
 Tue, 03 Sep 2024 04:21:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHbXnmNinNKcxIoQZ/xbsrsLu5CSXkPJ8NSjds5BWMTJG6QY5z6avZlP02srMBnOR8Wv7uPgg==
X-Received: by 2002:adf:a30c:0:b0:374:baf1:41cb with SMTP id
 ffacd0b85a97d-374ecc67bacmr2268340f8f.4.1725362478084; 
 Tue, 03 Sep 2024 04:21:18 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-374be2edf08sm9391463f8f.6.2024.09.03.04.21.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 04:21:17 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 15/81] drm/ili9163: Run DRM default client setup
In-Reply-To: <20240830084456.77630-16-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-16-tzimmermann@suse.de>
Date: Tue, 03 Sep 2024 13:21:17 +0200
Message-ID: <87zfopf0eq.fsf@minerva.mail-host-address-is-not-set>
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
> ---
>  drivers/gpu/drm/tiny/ili9163.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

