Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB9D69D4CE
	for <lists+dri-devel@lfdr.de>; Mon, 20 Feb 2023 21:20:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F17710E7B2;
	Mon, 20 Feb 2023 20:19:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 455FF10E7A1;
 Mon, 20 Feb 2023 20:19:33 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 d1-20020a17090a3b0100b00229ca6a4636so2764905pjc.0; 
 Mon, 20 Feb 2023 12:19:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5Jl0bAAXIZTjQ7NsDAeqTzIEhvjQzgg5/X7BsK4u81Y=;
 b=VWGYtfqNhp7B6nf1c5rcB1hn1/aTMiBMh/TisbyUXTPDYchTD7dH8S55BhZKeSEIr+
 03hj8zQYZMESK/6c4d3fRxa/w4WooAzdJBPJ8/VWpaF06G1aHxdlKB29U3aBoRxl8pG9
 lhz4VFqMYDjNn7utqgYjWHabzq8ZYsRn9/jLbtpnATAFjeV84tvNiTTmjW21dkGa87Bo
 BCdG0VIoPT5IG6WL3vCWR5Cs/9pu+OSNC6ytsz3L6iomug5Ys/ZXtW1WbgYfoiPaWtwy
 eRK2/hsZTxMfAbRSugzRZV+8A5OAWYdt0Dxwq8bO0x5KyZMagHwy/xs0lWT9bszYL27m
 w8bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5Jl0bAAXIZTjQ7NsDAeqTzIEhvjQzgg5/X7BsK4u81Y=;
 b=Gof+ZQOCcVQFPsd0TiAP/4KcrdtlunnDHm1PeNsNCyxdBju+YnPF/18W1nX6X9ZWOP
 GJkqQcu8axn1km9KNYxWeBFPMs7EEd63lw1U9T8cgtDNtTZZSbKjK5HwJp2eaBu7hVC+
 rgFA/tYwyxKv+Z0j+PIpocqZpjb8HkbvoymhtmDwqcsY504pmULv5kfg7ABKwJb7vEsJ
 O0iIGptHvYnHHOjivGqIiPnUgtKBPtDAZrPUGxdbLm5rQJ/ip8zkQeEbEa1ISpZm6Fjb
 c4iwraD1hsqimcbSaO49YVWTIzhbtP7R61qJUIo0+/kiUm/cETFadxWzT790K/A4dCt+
 4j0g==
X-Gm-Message-State: AO0yUKWwGvDJs0V+tjUgiFKxYzLh1tSRnHwERNxB1ruWOEjkr2gM3Ng8
 FCP0yYe7ioHQJfsO+ridNrFIw5D9oxE=
X-Google-Smtp-Source: AK7set+q3MKo5iZVfbDma9lHblnO0T/NKkpxdHihd2LIe6SBmUPSnRLrjIdwXidmbST3DQEMqrXm3A==
X-Received: by 2002:a17:902:d4c3:b0:19c:17d1:28a4 with SMTP id
 o3-20020a170902d4c300b0019c17d128a4mr3168962plg.67.1676924372594; 
 Mon, 20 Feb 2023 12:19:32 -0800 (PST)
Received: from localhost (c-73-67-135-195.hsd1.or.comcast.net. [73.67.135.195])
 by smtp.gmail.com with ESMTPSA id
 x5-20020a170902ea8500b0019c32968271sm1910780plb.11.2023.02.20.12.19.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 12:19:32 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 10/14] drm/vblank: Add helper to get next vblank time
Date: Mon, 20 Feb 2023 12:18:57 -0800
Message-Id: <20230220201916.1822214-11-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230220201916.1822214-1-robdclark@gmail.com>
References: <20230220201916.1822214-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>,
 open list <linux-kernel@vger.kernel.org>, Pekka Paalanen <ppaalanen@gmail.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Will be used in the next commit to set a deadline on fences that an
atomic update is waiting on.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/drm_vblank.c | 32 ++++++++++++++++++++++++++++++++
 include/drm/drm_vblank.h     |  1 +
 2 files changed, 33 insertions(+)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index 2ff31717a3de..caf25ebb34c5 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -980,6 +980,38 @@ u64 drm_crtc_vblank_count_and_time(struct drm_crtc *crtc,
 }
 EXPORT_SYMBOL(drm_crtc_vblank_count_and_time);
 
+/**
+ * drm_crtc_next_vblank_time - calculate the time of the next vblank
+ * @crtc: the crtc for which to calculate next vblank time
+ * @vblanktime: pointer to time to receive the next vblank timestamp.
+ *
+ * Calculate the expected time of the next vblank based on time of previous
+ * vblank and frame duration
+ */
+int drm_crtc_next_vblank_time(struct drm_crtc *crtc, ktime_t *vblanktime)
+{
+	unsigned int pipe = drm_crtc_index(crtc);
+	struct drm_vblank_crtc *vblank = &crtc->dev->vblank[pipe];
+	u64 count;
+
+	if (!vblank->framedur_ns)
+		return -EINVAL;
+
+	count = drm_vblank_count_and_time(crtc->dev, pipe, vblanktime);
+
+	/*
+	 * If we don't get a valid count, then we probably also don't
+	 * have a valid time:
+	 */
+	if (!count)
+		return -EINVAL;
+
+	*vblanktime = ktime_add(*vblanktime, ns_to_ktime(vblank->framedur_ns));
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_crtc_next_vblank_time);
+
 static void send_vblank_event(struct drm_device *dev,
 		struct drm_pending_vblank_event *e,
 		u64 seq, ktime_t now)
diff --git a/include/drm/drm_vblank.h b/include/drm/drm_vblank.h
index 733a3e2d1d10..a63bc2c92f3c 100644
--- a/include/drm/drm_vblank.h
+++ b/include/drm/drm_vblank.h
@@ -230,6 +230,7 @@ bool drm_dev_has_vblank(const struct drm_device *dev);
 u64 drm_crtc_vblank_count(struct drm_crtc *crtc);
 u64 drm_crtc_vblank_count_and_time(struct drm_crtc *crtc,
 				   ktime_t *vblanktime);
+int drm_crtc_next_vblank_time(struct drm_crtc *crtc, ktime_t *vblanktime);
 void drm_crtc_send_vblank_event(struct drm_crtc *crtc,
 			       struct drm_pending_vblank_event *e);
 void drm_crtc_arm_vblank_event(struct drm_crtc *crtc,
-- 
2.39.1

