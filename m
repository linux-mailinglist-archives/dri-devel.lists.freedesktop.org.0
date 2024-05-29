Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF5C8D2E64
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 09:39:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E3421133FE;
	Wed, 29 May 2024 07:39:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="gbYPmQrV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E8AC10E7FB
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 07:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1716968337;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JnkCGFPfhuNEaifGjl6Wu5/aJpK3is1mn/NKpIiOtjo=;
 b=gbYPmQrVNOOsRJipMfJvKv6RjDRmTNsQ5i+1njJMrHi87z46A9tsTH88IjexrnQj0SJbdz
 CJ2dFaq95BtEOQf8WCIuxkVtTW47NGxvjwDqqelLNyDJf2E5HUWNWEB3howhOkm1ZgJO09
 jRT3GpSoCX6nMV4OiXyNonVFpe6eYR4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-551-r6xvJwCpPQ-8Up_UELCv7A-1; Wed, 29 May 2024 03:38:52 -0400
X-MC-Unique: r6xvJwCpPQ-8Up_UELCv7A-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-354fa62abd7so1361603f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 00:38:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716968331; x=1717573131;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JnkCGFPfhuNEaifGjl6Wu5/aJpK3is1mn/NKpIiOtjo=;
 b=EMD/qkxUeH2hhiR9F5Rmih2kDR6ISl5V32bb6ltqEMyl9ZCvVyqO0t3FJaiS5b1BmD
 UQlIlMvv8wf8rt1vPLkjFiow68Qg86tcxhiCYMIcDZaYRCEaTACOLS4XcvHxZE3rJOm9
 1xBEzNJU9dH7dvrzZMo3AOZ870ovZinhix+55QqV1A76oppB8cg2SwTvYv2cbPipkcHa
 l+auDlVAczWAZd9WA77WiwYLZirD7Ubr0goq42C7kx61ZNRYGCT6WJ/rd621HdeRgCP5
 lrAHQzhJPYq01tQFb8CmNKDqHQxuE+/y9Hda3egDOZ+jXLXanN0nzm6Dr8BuNXnCL4DO
 BecA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZk97M8C9mrdXr1QByseThcte8by8OMPwziU98TRQfNbGGCXVlq5ouiDWjIoo9Elqd2xAkGHZSFmcyeln7Vmh6lTfBya5NOjwZBDcPS8LA
X-Gm-Message-State: AOJu0Yxi8pDRV0sua8sVdL8ndPhDymjq0Aegpjku5Aw7DCucgBAfCLwX
 eWoyGkhlFR3UQwQ5LQLw7g97lEIMvvMGr8KFcd42OqYv8Fn4lLHK4MmR0PIvgvy9+i2iR1CmbIl
 KuzqkmJQwkLlEXDD9SLXHUB8W8qYLhd1RtGsODuhpCZGnHT2AG8TyDQfxMnk0+aEWNw==
X-Received: by 2002:a05:6000:1541:b0:359:733c:c8d6 with SMTP id
 ffacd0b85a97d-359733cc9fbmr7064240f8f.67.1716968331072; 
 Wed, 29 May 2024 00:38:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErLallLH/zYnic/TMGFq7yP1g8Tm0V8eifkv+49sPriMHIZkLYfV85qlv0c9QhOqX5rV6Jyg==
X-Received: by 2002:a05:6000:1541:b0:359:733c:c8d6 with SMTP id
 ffacd0b85a97d-359733cc9fbmr7064219f8f.67.1716968330471; 
 Wed, 29 May 2024 00:38:50 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3557a1c930esm13833012f8f.84.2024.05.29.00.38.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 00:38:50 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland
 <samuel@sholland.org>, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] drm/sun4i: Fix compilation error
In-Reply-To: <20240528151056.2104153-1-mripard@kernel.org>
References: <20240528151056.2104153-1-mripard@kernel.org>
Date: Wed, 29 May 2024 09:38:49 +0200
Message-ID: <87sey11306.fsf@minerva.mail-host-address-is-not-set>
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

Maxime Ripard <mripard@kernel.org> writes:

Hello Maxime,

> Commit ea64761a54a2 ("drm/sun4i: hdmi: Switch to HDMI connector")
> introduced a dependency that got renamed in a previous version, but
> wasn't properly updated in that driver. Fix the name of the function.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202405282205.EU7NUoeQ-lkp@intel.com/
> Closes: https://lore.kernel.org/oe-kbuild-all/202405282248.U2lhPvCK-lkp@intel.com/
> Fixes: ea64761a54a2 ("drm/sun4i: hdmi: Switch to HDMI connector")
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

