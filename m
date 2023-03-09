Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E8B6B31F4
	for <lists+dri-devel@lfdr.de>; Fri, 10 Mar 2023 00:10:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B91BE10E22A;
	Thu,  9 Mar 2023 23:10:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 254EE10E22A
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 23:10:50 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id u5so3700700plq.7
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Mar 2023 15:10:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=schmorgal.com; s=google; t=1678403449;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ORhYy+5RsRhtN/r0n/8d8XGwBuq0gn/E8Gc2XsetIZQ=;
 b=MYlmGSKR0fu4RUBhHPKYc4JAfB3mgBHrXjyqCxoggmcOBpmoOul7lAJVGL7fTULSzq
 r8nGyTs2xdMPqO0SASUjfiKmmUuQWMPT1Rl69KaYxjIpTC0VV6pqQ63XsvRVCn55+mGA
 He8bieyQIVX5aerGCxl4Q8LUx9R+kzNhkao+k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678403449;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ORhYy+5RsRhtN/r0n/8d8XGwBuq0gn/E8Gc2XsetIZQ=;
 b=OeWCT4Lv+0Z74dXfjOvya/hk5y5Sz6dRCYgzT83mPmLKJxEKziGnJR5DbzpSd+s7aS
 F+fYrOydJBk45NDLP7HYbAF0c7ts1hSdZIjQmFAEqo8LBcZmCMj8VDW61dsck1E7tL7Y
 UizZnzr0Rinn9pYkiNVjMCk6Ihfq3148jXjRxSJBTBvJt6I6pGeNsLAmKvHD/JYwHaLP
 mB2I8lCe61vOj1Na7ZagcJrVIBSakAQPYLtgxpicQQPffDcTET5SxWIxAwkSoG0DEn1y
 uA0Qc255DUxUzFDbkVEwS3G5JaYLJzt4+PRlDEDlXVnQf3gHB/UAdN1Fvwn5K7Mde6cp
 PAuA==
X-Gm-Message-State: AO0yUKXZMwo8fdlyHNvhqWvQAVyYqFZp8rqSjeITe1saSkUgzkz5D4zz
 eENHO2kjsnQQ/v/HMoRtbYdRCg==
X-Google-Smtp-Source: AK7set/LeA4HO8TXoszMNGrtGMo+UAbY/eiJTT4SejED/oao2bTtQ5gks4sig2lTQ/MVWSYrwQkgCQ==
X-Received: by 2002:a05:6a20:3d24:b0:cd:c79:50d9 with SMTP id
 y36-20020a056a203d2400b000cd0c7950d9mr690154pzi.2.1678403449511; 
 Thu, 09 Mar 2023 15:10:49 -0800 (PST)
Received: from doug-ryzen-5700G.. ([192.183.213.136])
 by smtp.gmail.com with ESMTPSA id
 e16-20020a62ee10000000b0059085684b54sm105684pfi.140.2023.03.09.15.10.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 15:10:49 -0800 (PST)
From: Doug Brown <doug@schmorgal.com>
To: Russell King <linux@armlinux.org.uk>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH RESEND] drm/armada: Fill in GEM object for each color plane
Date: Thu,  9 Mar 2023 15:09:30 -0800
Message-Id: <20230309230930.43142-1-doug@schmorgal.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Doug Brown <doug@schmorgal.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This driver uses a single GEM object even when there are multiple
planes. Starting with commit 746b9c62cc86 ("drm/gem: Ignore color planes
that are unused by framebuffer format"), multiple plane support was
broken on armada because the object pointers for the additional planes
were empty and drm_gem_plane_helper_prepare_fb was returning -EINVAL.

Restore functionality by pointing to the same GEM object on all planes.

Signed-off-by: Doug Brown <doug@schmorgal.com>
---
 drivers/gpu/drm/armada/armada_fb.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/armada/armada_fb.c b/drivers/gpu/drm/armada/armada_fb.c
index b87c71703c85..341ad4d422de 100644
--- a/drivers/gpu/drm/armada/armada_fb.c
+++ b/drivers/gpu/drm/armada/armada_fb.c
@@ -21,9 +21,10 @@ static const struct drm_framebuffer_funcs armada_fb_funcs = {
 struct armada_framebuffer *armada_framebuffer_create(struct drm_device *dev,
 	const struct drm_mode_fb_cmd2 *mode, struct armada_gem_object *obj)
 {
+	const struct drm_format_info *info = drm_get_format_info(dev, mode);
 	struct armada_framebuffer *dfb;
 	uint8_t format, config;
-	int ret;
+	int ret, i;
 
 	switch (mode->pixel_format) {
 #define FMT(drm, fmt, mod)		\
@@ -63,7 +64,8 @@ struct armada_framebuffer *armada_framebuffer_create(struct drm_device *dev,
 
 	dfb->fmt = format;
 	dfb->mod = config;
-	dfb->fb.obj[0] = &obj->obj;
+	for (i = 0; i < info->num_planes; i++)
+		dfb->fb.obj[i] = &obj->obj;
 
 	drm_helper_mode_fill_fb_struct(dev, &dfb->fb, mode);
 
@@ -79,7 +81,8 @@ struct armada_framebuffer *armada_framebuffer_create(struct drm_device *dev,
 	 * the above call, but the caller will drop their reference
 	 * to it.  Hence we need to take our own reference.
 	 */
-	drm_gem_object_get(&obj->obj);
+	for (i = 0; i < info->num_planes; i++)
+		drm_gem_object_get(&obj->obj);
 
 	return dfb;
 }
-- 
2.34.1

