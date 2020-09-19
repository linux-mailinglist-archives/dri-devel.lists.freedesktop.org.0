Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D389F271052
	for <lists+dri-devel@lfdr.de>; Sat, 19 Sep 2020 21:36:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB4A26E492;
	Sat, 19 Sep 2020 19:36:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57ECE6E04B
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Sep 2020 19:36:41 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id t14so5528558pgl.10
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Sep 2020 12:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZcEhH3LkJwJxm1/YqfDogAmQdhcYfaMPXbiNt/rTvIg=;
 b=lg7Ubyu9WAKxfdBXsHIE0fpkFazRYiZBfqd7ekL+E3pANQ48iJwjSskg8Eb9/Ipxum
 vvea2HDVe246HhZnx09J5sw/zvLq+X/chYapub84dru4tTYVy5R6QlX8GixKSFMagOqr
 SiDjzfINE3Gr2AYrazENBJHXI+Xn+YIRbwOlharJlTl5xZXu9vm38MHB1s4zUFuB4X4w
 sskrIy020y6bFI7vAwFVJ1MBDQ8yjM9uudCvs1Vou9g4OTbf5XR0romkoa4Qu00sItUw
 Bs/0LoQsCfY349hIqWWmcPkKqQYRpNNjg2x6zMmr1m78mxkQkWqa7pQQL9OI+pbzk/bc
 iXcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZcEhH3LkJwJxm1/YqfDogAmQdhcYfaMPXbiNt/rTvIg=;
 b=d4TOEM9d+x52wY2vVaeH5pUFSMEzFTRGvxY3tLZu0Ok/2pBwNsryV4ttwoHb0Nc0F/
 rtcQQGPNQYrBxvjDXmSzEWN+O0dghLojzbLjwUcQqqSUOjykg8gpD4SJaQ0Lx4MH6QHb
 AyGyoiyv61ZPk0US5YssRgrLZfreUxbR+kx2QdOK5qk0DX7I1FQ+/roRN8fpOCEPcxi+
 zbAyhw8yOXFePAkP+RE5v4A1DXGytIQM4SCIHt7mwMYebMRcVQl8gRpzTGQWFsfOu5GB
 rpCN5EtcI8W6svvSLWTVK0Z0zuCWMkV1y60mSEmPLhyBer8QbBW5saEiVIroOBJce7Gc
 TeUA==
X-Gm-Message-State: AOAM533miv3Km9f34Tc/B3qTDHfzU9X2nXkhIyrf+FxkzZ/D3f2k52bD
 Y5Q7/5nUZa/8apfx4LFCasYj7L2FNE0=
X-Google-Smtp-Source: ABdhPJw1pkeptMx0qD+T+XhkQAyHm1sDInLhYFcOAYQh5gmEsV+WcdgYPL5u/76isoo3XZIVFAt6Xg==
X-Received: by 2002:a65:6088:: with SMTP id t8mr26953418pgu.404.1600544200308; 
 Sat, 19 Sep 2020 12:36:40 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id q5sm7477198pfn.172.2020.09.19.12.36.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Sep 2020 12:36:39 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] drm/atomic: Use kthread worker for nonblocking commits
Date: Sat, 19 Sep 2020 12:37:25 -0700
Message-Id: <20200919193727.2093945-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200919193727.2093945-1-robdclark@gmail.com>
References: <20200919193727.2093945-1-robdclark@gmail.com>
MIME-Version: 1.0
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
Cc: Rob Clark <robdclark@chromium.org>, Peter Zijlstra <peterz@infradead.org>,
 linux-arm-msm@vger.kernel.org, open list <linux-kernel@vger.kernel.org>,
 timmurray@google.com, David Airlie <airlied@linux.ie>,
 Thomas Zimmermann <tzimmermann@suse.de>, Tejun Heo <tj@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

This will allow us to more easily switch scheduling rules based on what
userspace wants.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/drm_atomic_helper.c | 13 ++++++++----
 include/drm/drm_atomic.h            | 31 +++++++++++++++++++++++++++++
 2 files changed, 40 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 9e1ad493e689..75eeec5e7b10 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -1659,11 +1659,11 @@ static void commit_tail(struct drm_atomic_state *old_state)
 	drm_atomic_state_put(old_state);
 }
 
-static void commit_work(struct work_struct *work)
+static void commit_work(struct kthread_work *work)
 {
 	struct drm_atomic_state *state = container_of(work,
 						      struct drm_atomic_state,
-						      commit_work);
+						      commit_kwork);
 	commit_tail(state);
 }
 
@@ -1797,6 +1797,7 @@ int drm_atomic_helper_commit(struct drm_device *dev,
 			     struct drm_atomic_state *state,
 			     bool nonblock)
 {
+	struct kthread_worker *worker = NULL;
 	int ret;
 
 	if (state->async_update) {
@@ -1814,7 +1815,7 @@ int drm_atomic_helper_commit(struct drm_device *dev,
 	if (ret)
 		return ret;
 
-	INIT_WORK(&state->commit_work, commit_work);
+	kthread_init_work(&state->commit_kwork, commit_work);
 
 	ret = drm_atomic_helper_prepare_planes(dev, state);
 	if (ret)
@@ -1857,8 +1858,12 @@ int drm_atomic_helper_commit(struct drm_device *dev,
 	 */
 
 	drm_atomic_state_get(state);
+
 	if (nonblock)
-		queue_work(system_unbound_wq, &state->commit_work);
+		worker = drm_atomic_pick_worker(state);
+
+	if (worker)
+		kthread_queue_work(worker, &state->commit_kwork);
 	else
 		commit_tail(state);
 
diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index d07c851d255b..8d0ee19953df 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -373,8 +373,18 @@ struct drm_atomic_state {
 	 *
 	 * Work item which can be used by the driver or helpers to execute the
 	 * commit without blocking.
+	 *
+	 * This is deprecated, use commit_kwork.
 	 */
 	struct work_struct commit_work;
+
+	/**
+	 * @commit_kwork:
+	 *
+	 * Work item which can be used by the driver or helpers to execute the
+	 * commit without blocking.
+	 */
+	struct kthread_work commit_kwork;
 };
 
 void __drm_crtc_commit_free(struct kref *kref);
@@ -954,6 +964,27 @@ void drm_state_dump(struct drm_device *dev, struct drm_printer *p);
 		      (new_obj_state) = (__state)->private_objs[__i].new_state, 1); \
 	     (__i)++)
 
+/**
+ * drm_atomic_pick_worker - helper to get kworker to use for nonblocking commit
+ * @state: the &drm_atomic_state for the commit
+ *
+ * Pick an appropriate worker for a given atomic update.  The first CRTC
+ * invovled in the atomic update is used to pick the worker, to prevent
+ * serializing multiple pageflips / atomic-updates on indenpendent CRTCs.
+ */
+static inline struct kthread_worker *
+drm_atomic_pick_worker(const struct drm_atomic_state *state)
+{
+	struct drm_crtc_state *crtc_state;
+	struct drm_crtc *crtc;
+	unsigned i;
+
+	for_each_new_crtc_in_state(state, crtc, crtc_state, i)
+		return crtc->worker;
+
+	return NULL;
+}
+
 /**
  * drm_atomic_crtc_needs_modeset - compute combined modeset need
  * @state: &drm_crtc_state for the CRTC
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
