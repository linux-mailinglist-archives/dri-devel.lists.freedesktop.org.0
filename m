Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4BE40F7A3
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 14:35:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 924C76EC57;
	Fri, 17 Sep 2021 12:35:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B77196EC48;
 Fri, 17 Sep 2021 12:35:28 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id q26so14926051wrc.7;
 Fri, 17 Sep 2021 05:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BrbXMO1uME+f7mLVpMCcy22kq2yF+JjSyltoWjwipSg=;
 b=bviXeXeCrAWZNOqQCBhHL015HD9zANiiD1Ju1cCP+d9sUE83p67saA0OHqEGKzTam7
 HdV54+gh2VmKuE40uOPj4Mf/xEl0M6s5KMpSN3xlzeRcYhJ4ckTPYjpgrzuSRTt4+0Hl
 RXD2oc23kLoXKDqDohUeLEIEWIWrhtqY627SP2iBr4l4lhB0k90vuQ549nrdMQrtdAD/
 cR4vAFJX1Nx1vEZY+Luy7W7qMZ3NHm6LXN3TIz1tcdlz+4mBCwAh0YlfdOvyes6GpVnh
 0IDr45hLwzmFtrnRsRWpKxoUXGATG5bN4+ndE8B/CKSububs2FOS2ENs951hQNB/3Uw/
 B81w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BrbXMO1uME+f7mLVpMCcy22kq2yF+JjSyltoWjwipSg=;
 b=xFuWP/9gB14l/t44mUnY5+3p7Tj1jnSb6ZT+caWI5rMwnOvrxuIX0STyo+D4+0AQ12
 UOm9DKNty7WSePUPXyz6r3mOLfmNbkze+5D5LP31x1KsudWs5SW+yWm3W/6uWvt7ke7J
 S88fux8Z65bho0DjpO8TcIMeobbjZQaI1h7Bp+3fEF/VJHoYSSN/K6k9lpyW0EQgReqV
 qMJdGGgVHBiTL5PVWPiRrgTP1dfUS5D57MwGCmEEOcWoHcGZPf0MShBzX+Aer/ML4niz
 2lhgo5hiRCrKmJnH9l85rdXlysyy1yqiBTTtW7C+wMuC7BtDXYdAiif5F9xaeR7d/i0W
 SD/A==
X-Gm-Message-State: AOAM532mo4stYpFeU31KRw3gSIbVjoJwEMSm/bEHAxJJ6q9q/eWKA/fT
 FQqAxwdHdXvHyx+9eeyVqp0NWEF08CM=
X-Google-Smtp-Source: ABdhPJx8Hxqa3VDTaoBwL3jmEPhMic46DgkUgKS4VuJlO4HQI4pbqyIWl+bnYxJEX+ODY9LowQLqTw==
X-Received: by 2002:adf:f101:: with SMTP id r1mr11239973wro.355.1631882127339; 
 Fri, 17 Sep 2021 05:35:27 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 l21sm6122049wmh.31.2021.09.17.05.35.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Sep 2021 05:35:27 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch
Subject: [PATCH 13/26] drm/i915: use the new iterator in i915_gem_busy_ioctl
Date: Fri, 17 Sep 2021 14:35:00 +0200
Message-Id: <20210917123513.1106-14-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210917123513.1106-1-christian.koenig@amd.com>
References: <20210917123513.1106-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This makes the function much simpler since the complex
retry logic is now handled else where.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_busy.c | 32 ++++++++----------------
 1 file changed, 11 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_busy.c b/drivers/gpu/drm/i915/gem/i915_gem_busy.c
index 6234e17259c1..b1cb7ba688da 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_busy.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_busy.c
@@ -82,8 +82,8 @@ i915_gem_busy_ioctl(struct drm_device *dev, void *data,
 {
 	struct drm_i915_gem_busy *args = data;
 	struct drm_i915_gem_object *obj;
-	struct dma_resv_list *list;
-	unsigned int seq;
+	struct dma_resv_iter cursor;
+	struct dma_fence *fence;
 	int err;
 
 	err = -ENOENT;
@@ -109,27 +109,17 @@ i915_gem_busy_ioctl(struct drm_device *dev, void *data,
 	 * to report the overall busyness. This is what the wait-ioctl does.
 	 *
 	 */
-retry:
-	seq = raw_read_seqcount(&obj->base.resv->seq);
-
-	/* Translate the exclusive fence to the READ *and* WRITE engine */
-	args->busy = busy_check_writer(dma_resv_excl_fence(obj->base.resv));
-
-	/* Translate shared fences to READ set of engines */
-	list = dma_resv_shared_list(obj->base.resv);
-	if (list) {
-		unsigned int shared_count = list->shared_count, i;
-
-		for (i = 0; i < shared_count; ++i) {
-			struct dma_fence *fence =
-				rcu_dereference(list->shared[i]);
-
+	args->busy = false;
+	dma_resv_iter_begin(&cursor, obj->base.resv, true);
+	dma_resv_for_each_fence_unlocked(&cursor, fence) {
+		if (dma_resv_iter_is_exclusive(&cursor))
+			/* Translate the exclusive fence to the READ *and* WRITE engine */
+			args->busy = busy_check_writer(fence);
+		else
+			/* Translate shared fences to READ set of engines */
 			args->busy |= busy_check_reader(fence);
-		}
 	}
-
-	if (args->busy && read_seqcount_retry(&obj->base.resv->seq, seq))
-		goto retry;
+	dma_resv_iter_end(&cursor);
 
 	err = 0;
 out:
-- 
2.25.1

