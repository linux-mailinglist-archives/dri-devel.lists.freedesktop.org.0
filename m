Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 971F35AD61C
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 17:19:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 916BE10E973;
	Mon,  5 Sep 2022 15:19:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0F2F10E411
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 15:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662391166;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qabemuj06WeoMtZf9HrAveZ66zZ44DWBaH/ByyW71MM=;
 b=WzfgLsRL3Tx0NwiMPAPa0Rg4goexlOWqNcWJSobA8GE2z7U4C+tAqq0n9rXV0a3cZ+S5aF
 4jeBbPAuLkXzezfSOz1ZvMLfVOg+ef4Izk4MGvK3YWAEs+hso7pzZDT2eBXy8z9mE3IihU
 oLiUu4Ehae0+mO82vZJbcsjePxbsaxU=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-594-CGZn8M5dNEGHpRp4YsfeuA-1; Mon, 05 Sep 2022 11:19:24 -0400
X-MC-Unique: CGZn8M5dNEGHpRp4YsfeuA-1
Received: by mail-ed1-f71.google.com with SMTP id
 y12-20020a056402358c00b00448898f1c33so5916701edc.7
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Sep 2022 08:19:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=qabemuj06WeoMtZf9HrAveZ66zZ44DWBaH/ByyW71MM=;
 b=MQKRHTOgTTcui/ZhqLVjGHKIw7q6ol9UwqpMUaZDH/uaa6zQMhNciJo7Hrz6Ga8gf2
 EAAu6TstXez7QavAox1O6ekRkZT3E29eI9s86alMU86TznoYGpvTonM44JXbUNW2gKKy
 avxRl3ZAiIG/Skw3Y+/bMUtyRhwZesGfmp5BsYUBFUdOx09zlw26gqTXL9TuxE8bd9dK
 n+xVQGFNy3wfAdQXyFhevQtr5sw+ZnwADp7eKOYKkuxzis4iKcirMcF009/cx+82y6Ac
 k48/rP7t5bVLzahKvdXmjOus3FR5IW5ywV1TFO8zs3RWhxsaBaUnAnoUzymqzlolLh1Y
 Bbew==
X-Gm-Message-State: ACgBeo0pnLsMN1yyqEoNLMXMOZ1ZYEvX90IlJmBr5OYbluoAQOEXWa+R
 MK6bIhhwa8o0SbUNQ26bcJOLdB5mgBrza1KdiGV/H9RRx8YNwJ/wdzHgjvwloHRDzgmBQuUP5fz
 6ghSsF+cj+90AA3R2byQ+TLj6keVI
X-Received: by 2002:a05:6402:1514:b0:448:312:368 with SMTP id
 f20-20020a056402151400b0044803120368mr39817456edw.263.1662391163637; 
 Mon, 05 Sep 2022 08:19:23 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7hAlooCdjVZ738aZDpf606K1bTFeilkcuJNs5qFARVCKKuEfZylLyTwJUVtjZG/kd1JMorOw==
X-Received: by 2002:a05:6402:1514:b0:448:312:368 with SMTP id
 f20-20020a056402151400b0044803120368mr39817438edw.263.1662391163491; 
 Mon, 05 Sep 2022 08:19:23 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 c16-20020a170906925000b0073d9d887eddsm5177440ejx.56.2022.09.05.08.19.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 08:19:22 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@linux.ie, tzimmermann@suse.de, mripard@kernel.org,
 liviu.dudau@arm.com, brian.starkey@arm.com
Subject: [PATCH RESEND drm-misc-next 3/8] drm/arm/malidp: crtc: use
 drmm_crtc_init_with_planes()
Date: Mon,  5 Sep 2022 17:19:05 +0200
Message-Id: <20220905151910.98279-4-dakr@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220905151910.98279-1-dakr@redhat.com>
References: <20220905151910.98279-1-dakr@redhat.com>
MIME-Version: 1.0
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
Cc: Danilo Krummrich <dakr@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use drmm_crtc_init_with_planes() instead of drm_crtc_init_with_planes()
to get rid of the explicit destroy hook in struct drm_plane_funcs.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/arm/malidp_crtc.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/arm/malidp_crtc.c b/drivers/gpu/drm/arm/malidp_crtc.c
index 34ad7e1cd2b8..dc01c43f6193 100644
--- a/drivers/gpu/drm/arm/malidp_crtc.c
+++ b/drivers/gpu/drm/arm/malidp_crtc.c
@@ -514,7 +514,6 @@ static void malidp_crtc_disable_vblank(struct drm_crtc *crtc)
 }
 
 static const struct drm_crtc_funcs malidp_crtc_funcs = {
-	.destroy = drm_crtc_cleanup,
 	.set_config = drm_atomic_helper_set_config,
 	.page_flip = drm_atomic_helper_page_flip,
 	.reset = malidp_crtc_reset,
@@ -548,8 +547,8 @@ int malidp_crtc_init(struct drm_device *drm)
 		return -EINVAL;
 	}
 
-	ret = drm_crtc_init_with_planes(drm, &malidp->crtc, primary, NULL,
-					&malidp_crtc_funcs, NULL);
+	ret = drmm_crtc_init_with_planes(drm, &malidp->crtc, primary, NULL,
+					 &malidp_crtc_funcs, NULL);
 	if (ret)
 		return ret;
 
-- 
2.37.2

