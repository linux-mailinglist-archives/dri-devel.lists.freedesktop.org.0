Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A53451447D
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 10:43:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BA6710FC69;
	Fri, 29 Apr 2022 08:43:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC91210FC88
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 08:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651221793;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fRMcUIWA7sdzgB28q5eAL1IlJEzmKZ6fC0UlacasRt0=;
 b=PQ9sVSG6TKaw8QoiltlxGrxmTtr4tIrhlFJ5xguxy5/FEeJ0IPrhYCpBL591NSvGqc5+pQ
 nyoz/nhZ7sTNwyZSFeBJsFFWl3bTHcc9Pu3wlnuE6EyZ5i2CxHfYPP/7oVdRTdiRKplUSl
 WYkFnSa3dodJL1migcu0KnouIzNwFpc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-15-DnKtUxF8NjC4C1ZcaNZ6Pw-1; Fri, 29 Apr 2022 04:43:10 -0400
X-MC-Unique: DnKtUxF8NjC4C1ZcaNZ6Pw-1
Received: by mail-wr1-f72.google.com with SMTP id
 j27-20020adfb31b000000b0020c4ca11566so155175wrd.14
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 01:43:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fRMcUIWA7sdzgB28q5eAL1IlJEzmKZ6fC0UlacasRt0=;
 b=lS2g+4CJJbuUpL8BRBV9lCpupjlZyj3fC4tlhGdnjO3vaUZp3abHEMU9ZUFO7EadKR
 KRd8iotMpp7rfiLaU7o7nueKaKYNcaV8pIpuee2o6H+aR6GwJFZ6kHNfWeetsjUzHleq
 zfkC9LEU5sLMd97wh9+YMJ6aHr6HrmkykY6GsnV0mQ7iXQm8OXEy0125QXRQhT3hg7gU
 DY6BfiuokNq7kl5bQxveOdmimzH2u7kBTn6t6WpGTn7t07GIjdDt9qeJLz/o5Dj+OzDd
 xtY/z3kzyHWEs7wWLIOVyapsJtkiLpdn3TMJ1pO7ygTV338/XKWxva8gwPjswp2tc9Ts
 dF+Q==
X-Gm-Message-State: AOAM530bR9qkE97kebWG14AueK201B4v8AK2qZZzyZHnV54imKipO4QP
 wGqwcemCJnm1gGzAdmpWATJbZbYcBbldg6jSdPZFlJMRXA9eCSXmtAgrbsIzpQz8mjdDp4EM+r8
 4uvct6uYqUK/GCGUad8tEZ24Ngkl5
X-Received: by 2002:adf:decb:0:b0:20a:c975:8eec with SMTP id
 i11-20020adfdecb000000b0020ac9758eecmr28945540wrn.438.1651221789467; 
 Fri, 29 Apr 2022 01:43:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwtZEVR1B2SxYUlJMQTPPXV31wb/4bFJp+yeoC7Nu0Cucm9c+snWTdOciLZN/4zm1HB6AokFA==
X-Received: by 2002:adf:decb:0:b0:20a:c975:8eec with SMTP id
 i11-20020adfdecb000000b0020ac9758eecmr28945524wrn.438.1651221789280; 
 Fri, 29 Apr 2022 01:43:09 -0700 (PDT)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 f7-20020a05600c4e8700b00393f1393abfsm7199256wmq.41.2022.04.29.01.43.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 01:43:08 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [RFC PATCH v4 02/11] drm/fb-helper: Set FBINFO_MISC_FIRMWARE flag for
 DRIVER_FIRMWARE fb
Date: Fri, 29 Apr 2022 10:42:44 +0200
Message-Id: <20220429084253.1085911-3-javierm@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429084253.1085911-1-javierm@redhat.com>
References: <20220429084253.1085911-1-javierm@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The DRIVER_FIRMWARE flag denotes that a DRM driver uses a framebuffer
that was initialized and provided by the system firmware for scanout.

Indicate to the fbdev subsystem that the registered framebuffer is a
FBINFO_MISC_FIRMWARE, so that it can handle accordingly. For example,
wold hot-unplug the associated device if asked to remove conflicting
framebuffers.

Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

(no changes since v1)

 drivers/gpu/drm/drm_fb_helper.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index d265a73313c9..76dd11888621 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -1891,6 +1891,10 @@ __drm_fb_helper_initial_config_and_unlock(struct drm_fb_helper *fb_helper,
 		/* don't leak any physical addresses to userspace */
 		info->flags |= FBINFO_HIDE_SMEM_START;
 
+	/* Indicate that the framebuffer is provided by the firmware */
+	if (drm_core_check_feature(dev, DRIVER_FIRMWARE))
+		info->flags |= FBINFO_MISC_FIRMWARE;
+
 	/* Need to drop locks to avoid recursive deadlock in
 	 * register_framebuffer. This is ok because the only thing left to do is
 	 * register the fbdev emulation instance in kernel_fb_helper_list. */
-- 
2.35.1

