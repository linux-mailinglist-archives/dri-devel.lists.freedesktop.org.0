Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D03F97D1956
	for <lists+dri-devel@lfdr.de>; Sat, 21 Oct 2023 00:54:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7816310E609;
	Fri, 20 Oct 2023 22:54:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D371010E609
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Oct 2023 22:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697842442;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=qFRLhmS2CQCqNG3Gndm1rIdWDDyvH+OTofhMbIHOAf0=;
 b=H2KHvoOv4dz2kSS5dd5hOPGIifuDDrXZAHEUzbYLdJkFxEABPCNriFGNKx4UdCO34WeevQ
 Am2o1jb8nqGgFBIsKWt/SpIaRp10cbmKEK/vulK4bxwH1lo4CYjCR9BZIJFRYgjOaIW9O9
 fYStawIl/E46VkLxelc5aKREq7Ro3+A=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-249-fAEBrhqNOKmNPmNnbcLMvA-1; Fri, 20 Oct 2023 18:54:01 -0400
X-MC-Unique: fAEBrhqNOKmNPmNnbcLMvA-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-32db43129c6so647494f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Oct 2023 15:54:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697842440; x=1698447240;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qFRLhmS2CQCqNG3Gndm1rIdWDDyvH+OTofhMbIHOAf0=;
 b=Xvg80UsV5RKF6EcpOSVAiyeBoankE6h4CarDfQXLCh7sn3gwytGx9wrepvnP44WSZl
 AoSTYuAr6gdFpjk8h2QDV/ZUS2qcr0Dtye7e/SO8t0aZj52vyinmVvNiRdMAVQljO4cc
 8f0GmJkgjwJDWtysyQoOWBb5tGZ0DS0lBvPaNFoo37ea+QOXlpZnyax2SrL2hiEp7WF0
 S9NyOpUTpP6k21BDFC3gl3a0WcfBo40CZePPDUBgDLD9i7r/OdUFWeEv+wj9Ds3gWAzn
 FkCx38PVxuNWabhVM7fJviLaj4cqlIzQ1ZXSMW+/2rJDRhU0r237kgFvHRI4sPoOfbu7
 1vwA==
X-Gm-Message-State: AOJu0YyfoGQetC4qMpEBKm35DMAZsPETVJ6LXiaheP+pj9WEMYxpW8oH
 yy8VymQY6tSvihwqzcQBLP6Iy2r7m/ctjp3W/8f+BlzuvNKt7XlU1pou0pcwS60WPfVvHnguPnh
 DvW/7bzStGvzsuEL9KEZdgYcWZHbl
X-Received: by 2002:a5d:58ea:0:b0:32d:819d:ec75 with SMTP id
 f10-20020a5d58ea000000b0032d819dec75mr2386181wrd.60.1697842440519; 
 Fri, 20 Oct 2023 15:54:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEokgbV7EOSbvHnFRW97a9AjS0odPg33+dhDQZB4Y/IUzZKrmGCj6yiNFw5I1rWq8uRWtpElQ==
X-Received: by 2002:a5d:58ea:0:b0:32d:819d:ec75 with SMTP id
 f10-20020a5d58ea000000b0032d819dec75mr2386176wrd.60.1697842440162; 
 Fri, 20 Oct 2023 15:54:00 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 b16-20020a5d5510000000b0032d2489a399sm2530010wrv.49.2023.10.20.15.53.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Oct 2023 15:53:59 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm/ssd130x: Fix possible uninitialized usage of crtc_state
 variable
Date: Sat, 21 Oct 2023 00:52:57 +0200
Message-ID: <20231020225338.1686974-1-javierm@redhat.com>
X-Mailer: git-send-email 2.41.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Dan Carpenter <dan.carpenter@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Avoid a possible uninitialized use of the crtc_state variable in function
ssd132x_primary_plane_atomic_check() and avoid the following Smatch warn:

    drivers/gpu/drm/solomon/ssd130x.c:921 ssd132x_primary_plane_atomic_check()
    error: uninitialized symbol 'crtc_state'.

Fixes: fdd591e00a9c ("drm/ssd130x: Add support for the SSD132x OLED controller family")
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/dri-devel/7dd6ca45-8263-44fe-a318-2fd9d761425d@moroto.mountain/
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/gpu/drm/solomon/ssd130x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index 32f0857aec9f..e0174f82e353 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -910,7 +910,7 @@ static int ssd132x_primary_plane_atomic_check(struct drm_plane *plane,
 	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
 	struct ssd130x_plane_state *ssd130x_state = to_ssd130x_plane_state(plane_state);
 	struct drm_crtc *crtc = plane_state->crtc;
-	struct drm_crtc_state *crtc_state;
+	struct drm_crtc_state *crtc_state = NULL;
 	const struct drm_format_info *fi;
 	unsigned int pitch;
 	int ret;
-- 
2.41.0

