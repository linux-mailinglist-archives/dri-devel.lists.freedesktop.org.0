Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A2C3D6A42
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 01:34:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F30936EA3F;
	Mon, 26 Jul 2021 23:34:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 841BB6EA3F
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 23:34:52 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 m10-20020a17090a34cab0290176b52c60ddso2308712pjf.4
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 16:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E+66KfoweN1Ee2V/z8f+apJdNLDFgl8859mlwwnYsf8=;
 b=bfhY6VwKlj+C3dibhtf+6FCziD4F30M0czf6J4IRYrHfmUOuY9+D+9m+J8afHMwrHp
 uaToPQMdviXDDvnQSs2HOIaOkldYqGRKFaN2idV1tmuk6Qb19xj/RancvYxD47v/H5+t
 ehvvRfrandEFu66JzyYprwJKr7jPchYza/+lMDxscdb33M+RN2FZnU5pIBqA1GqDaJzo
 NFwVtJq/L9vwUjpq2I9s7wAjoAvJ3UKqBSHLb0XcZQqCuCjJYDQ/kLU8RzQ5lvh7WGkQ
 y0qCqw28sz5urBKttycjjqnUP9tXKccGSqpSKZM1uZZ6bUhZAUPWl547KCCtWOIs2A6Z
 EJ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E+66KfoweN1Ee2V/z8f+apJdNLDFgl8859mlwwnYsf8=;
 b=mikw7Lq2BSPv61lE2WBP89R7MGdXKb56t9qHLmGCH2VBJxg16nHkl/AkLP8OWmQJXd
 nMY4qs5SBLOjEgwU6Bs+Q3IkJuNXnEBsO0z03PTUXHl8LZU+dQh+5+adNxdKjsWdP0mF
 9NXImOTIcOOHIJpmEa7tojcyv+jtXSd5airykmPoHa0nutqr2nahr1Ez+qw0y3lm3zy4
 gjQIUe25apXW04nxklnaMRHvw1kEs3HbYXAwjeOwVDW2kv9nsjIQtRHzrkutkqxEH6sx
 4xtLG+rNVSWVW3fwc2x988j2qiaFpa7jKKh6klBfPAuW2fEHf1HZWzODMTTH6Vfa+nxJ
 XrMg==
X-Gm-Message-State: AOAM530ctofk2wf7kI3KoXrO0lWQRJ4Qa8CaBKKRnxoj/oXdwq+CG84N
 c6BjI/9aSoRUkRAO4rLadLGjG0uKZic4kA==
X-Google-Smtp-Source: ABdhPJwhCMg1vxAUIgBpCE4SBwS5qWyulr+AZ6krJy2fdCYh/e6aJXgSEQEuwjqmqVRzGiLIeX4Plw==
X-Received: by 2002:a17:90a:6a86:: with SMTP id
 u6mr1319647pjj.207.1627342491492; 
 Mon, 26 Jul 2021 16:34:51 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id u6sm1152304pfn.31.2021.07.26.16.34.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 16:34:50 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC 3/4] drm/atomic-helper: Set fence deadline for vblank
Date: Mon, 26 Jul 2021 16:38:50 -0700
Message-Id: <20210726233854.2453899-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210726233854.2453899-1-robdclark@gmail.com>
References: <20210726233854.2453899-1-robdclark@gmail.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>, Rob Clark <robdclark@chromium.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

For an atomic commit updating a single CRTC (ie. a pageflip) calculate
the next vblank time, and inform the fence(s) of that deadline.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/drm_atomic_helper.c | 36 +++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index bc3487964fb5..f81b20775b15 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -1406,6 +1406,40 @@ void drm_atomic_helper_commit_modeset_enables(struct drm_device *dev,
 }
 EXPORT_SYMBOL(drm_atomic_helper_commit_modeset_enables);
 
+/*
+ * For atomic updates which touch just a single CRTC, calculate the time of the
+ * next vblank, and inform all the fences of the of the deadline.
+ */
+static void set_fence_deadline(struct drm_device *dev,
+			       struct drm_atomic_state *state)
+{
+	struct drm_crtc *crtc, *wait_crtc = NULL;
+	struct drm_crtc_state *new_crtc_state;
+	struct drm_plane *plane;
+	struct drm_plane_state *new_plane_state;
+	ktime_t vbltime;
+	int i;
+
+	for_each_new_crtc_in_state (state, crtc, new_crtc_state, i) {
+		if (!wait_crtc)
+			return;
+		wait_crtc = crtc;
+	}
+
+	/* If no CRTCs updated, then nothing to do: */
+	if (!wait_crtc)
+		return;
+
+	if (drm_crtc_next_vblank_time(wait_crtc, &vbltime))
+		return;
+
+	for_each_new_plane_in_state (state, plane, new_plane_state, i) {
+		if (!new_plane_state->fence)
+			continue;
+		dma_fence_set_deadline(new_plane_state->fence, vbltime);
+	}
+}
+
 /**
  * drm_atomic_helper_wait_for_fences - wait for fences stashed in plane state
  * @dev: DRM device
@@ -1435,6 +1469,8 @@ int drm_atomic_helper_wait_for_fences(struct drm_device *dev,
 	struct drm_plane_state *new_plane_state;
 	int i, ret;
 
+	set_fence_deadline(dev, state);
+
 	for_each_new_plane_in_state(state, plane, new_plane_state, i) {
 		if (!new_plane_state->fence)
 			continue;
-- 
2.31.1

