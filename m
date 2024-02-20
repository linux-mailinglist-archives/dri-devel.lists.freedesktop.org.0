Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1693485B792
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 10:32:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DA3610E2B7;
	Tue, 20 Feb 2024 09:32:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="eTJWUx68";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83A8D10E2B7
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 09:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1708421552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=obRxtLx6rLeO3YU/rqnXda0xS0dHIkiSbzya77n1Jfs=;
 b=eTJWUx68mJ8THyuYL5dSQExrcaIQbf20XOrFec9SW1owGm6Fm6vmNFKhtj8pABDBrvTkIl
 u4UDvkTjF5sCuVfQLqZOuzihxwUGDS14zNn4xDwbVUwk9rqElNz2PBglCPS4z2J43mxzpe
 CZrWB58oVxnmBwvXEgwKxbSJ3tGOzIs=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-426-XoNzJr-YOgK6yOY-hRaesw-1; Tue, 20 Feb 2024 04:32:31 -0500
X-MC-Unique: XoNzJr-YOgK6yOY-hRaesw-1
Received: by mail-lf1-f69.google.com with SMTP id
 2adb3069b0e04-512a6bff00dso2692866e87.3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 01:32:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708421550; x=1709026350;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=obRxtLx6rLeO3YU/rqnXda0xS0dHIkiSbzya77n1Jfs=;
 b=KFM1pNX2s1iY6fMI1sSJQfO7IE9Twp+01lHCr+H1518dgBXleJC2XSuwjlEofYlL16
 5lMkuM5mxCea9RROeKAIQSYPrWJf6ryX5QroTZxn915F654FoLxl5JDRn4v0MgFa6wde
 FgqKEWFWOvY3u1aY/FFY4jWR7mHjzVX7r8R8i6bgjqYBM7cXGiMb5Tt1gdfv3v02S4pN
 gndk9i+UxQSrW9SN6WyVCixMMQscevaZ9IlYZGbGf6cTfgHBvy/kislITc7KijK5DzAJ
 H9SVaf2pUOvMfjZjC/OQUXBPXsXTrZwao5/VxUpuVF1vatR25I9MTyAushmF8iTXnhRQ
 cYNQ==
X-Gm-Message-State: AOJu0YxnG0DkDOlF3IfqRvCVBq2FpliiOu5G97k0Th49fq9UMU+nl6+i
 ckBjRLmOg0D2IvWSXS2zUS0UHy1imCBu0eWBkNyaM+kSZsiyj3Ez27hiGmhjpCNEWTnN0lRveAh
 c+OxdX1ZhxBFBdtRTpAjaH8JrrwKMg53FJw8j7bD8tYVmz1XqsgVHlNGN74m14F6a1w==
X-Received: by 2002:a05:6512:239c:b0:512:ae18:7492 with SMTP id
 c28-20020a056512239c00b00512ae187492mr5795445lfv.11.1708421550175; 
 Tue, 20 Feb 2024 01:32:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFFK1ISvscWSiC+8duilezYgsz5C5byx70dEu3G6Io79efRQOyltpTKPLus1FsPEKi437suJg==
X-Received: by 2002:a05:6512:239c:b0:512:ae18:7492 with SMTP id
 c28-20020a056512239c00b00512ae187492mr5795423lfv.11.1708421549884; 
 Tue, 20 Feb 2024 01:32:29 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 l20-20020a05600c1d1400b0041256ab5becsm11246103wms.26.2024.02.20.01.32.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Feb 2024 01:32:29 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, lee@kernel.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com, deller@gmx.de
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-input@vger.kernel.org, linux-pwm@vger.kernel.org, Thomas Zimmermann
 <tzimmermann@suse.de>
Subject: Re: [PATCH 09/10] fbdev/ssd1307fb: Remove struct
 backlight_ops.check_fb
In-Reply-To: <20240212162645.5661-10-tzimmermann@suse.de>
References: <20240212162645.5661-1-tzimmermann@suse.de>
 <20240212162645.5661-10-tzimmermann@suse.de>
Date: Tue, 20 Feb 2024 10:32:29 +0100
Message-ID: <87o7cbiiqa.fsf@minerva.mail-host-address-is-not-set>
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

> The driver sets struct fb_info.bl_dev to the correct backlight
> device. Thus rely on the backlight core code to match backlight
> and framebuffer devices, and remove the extra check_fb function
> from struct backlight_ops.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

