Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82AEC251B10
	for <lists+dri-devel@lfdr.de>; Tue, 25 Aug 2020 16:43:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F1A06E04B;
	Tue, 25 Aug 2020 14:43:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14A0E6E04B
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Aug 2020 14:43:03 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id m34so6959869pgl.11
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Aug 2020 07:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=QbtdkMQ2OQK8ma+2g5/vN4Ht1Ck+Q+wWJoRTIeRkMdI=;
 b=YHjNDM1AlN+oZrQkZvw00RplLB7+Wy/qmjndtc60SzaHIG1/qt6VUHpyBmOv7pXSVz
 ihuUoNZxgsTMBdx/zsiLr3hq/24i5ZjE0x//qVmbhFFnI23QPcAZjS+SL0bwRfDjn9dr
 uGt81xBEqZYgR/5TMMI4pgjcEsu19YRwVA0yNoKBh4g992wvAGv6HfyAgLAbSyDmhgkS
 GuRZc+BjP7lzXdIwpYkYK8x48e7CSKXYsSLHno9yOjzQND2+l8lvLFUlYK3OiEb7V7Me
 yb8l+FjeyVeXR4I3lwqWZczvqYcC07/OCegqsY5p/P8OLrlxXS8PWbLCzwVKZP/A1rvv
 YvlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=QbtdkMQ2OQK8ma+2g5/vN4Ht1Ck+Q+wWJoRTIeRkMdI=;
 b=V0gaCcvSv8lfefm5LJpoEVPHtrZeR6JUFAB9VM0rMgIlJ9l043WMnW5A6s+8J2XINP
 QNXBW0u9vgCBD8f8fxEOrVxs3laZ3znvEGlRYPV+1neFVVVLoyLHW53Quc57yJ/LZ/K6
 HrHCHwsgUTosSwrM9h3Qa63EF3fdbjx4LQ309dNJb6lqTF+rlR5zLzXiQAPgnSww+XF4
 HKduGdwN369UPwoZNA/m9q1XSsCXwcaYzhKG06zYfLaCD/x3i+sDSQisX4RsDusVmTcl
 87B3k6IQmcm4y+NOOViIGGTAm1pqiMTWwDsrwdMd16cUr3IKzc2xE7d2YMjz+5IifJl+
 yLAQ==
X-Gm-Message-State: AOAM5325fjxJ+F/AjU2bfSV0q8JtrGw5y2e9YXWASNrik5wLGc1CxwCs
 cQAsLPcugt3o7t8erZWRsZo=
X-Google-Smtp-Source: ABdhPJwmFySP9vkbH3EZ1nzMfACkyEkiDEGzdcqk37zRMfzRs+srjVE3+pFgnFFRPpMX1rzaiWMYQw==
X-Received: by 2002:a63:f44b:: with SMTP id p11mr6831402pgk.324.1598366581203; 
 Tue, 25 Aug 2020 07:43:01 -0700 (PDT)
Received: from realwakka.navercorp.com ([61.83.141.80])
 by smtp.gmail.com with ESMTPSA id f13sm15087959pfd.215.2020.08.25.07.42.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2020 07:43:00 -0700 (PDT)
From: Sidong Yang <realwakka@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Subject: [PATCH] drm/vkms: fix warning in vkms_get_vblank_timestamp
Date: Tue, 25 Aug 2020 14:42:48 +0000
Message-Id: <20200825144248.1751-1-realwakka@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Emil Velikov <emil.l.velikov@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, melissa.srw@gmail.com,
 Sidong Yang <realwakka@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sidong Yang <realwakka@gmail.com>, Haneen Mohammed <hamohammed.sa@gmail.com>

When vkms_get_vblank_timestamp() is called very first time without
enabling vblank before, vblank time has just intial value and it makes
warning message. this patch prevents warning message by setting vblank
time to current time.

Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
Cc: Melissa Wen <melissa.srw@gmail.com>

Signed-off-by: Sidong Yang <realwakka@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_crtc.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
index ac85e17428f8..09c012d54d58 100644
--- a/drivers/gpu/drm/vkms/vkms_crtc.c
+++ b/drivers/gpu/drm/vkms/vkms_crtc.c
@@ -86,6 +86,11 @@ static bool vkms_get_vblank_timestamp(struct drm_crtc *crtc,
 	struct vkms_output *output = &vkmsdev->output;
 	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
 
+	if (!READ_ONCE(vblank->enabled)) {
+		*vblank_time = ktime_get();
+		return true;
+	}
+
 	*vblank_time = READ_ONCE(output->vblank_hrtimer.node.expires);
 
 	if (WARN_ON(*vblank_time == vblank->time))
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
