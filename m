Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B851055AD36
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jun 2022 00:55:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9701F10F001;
	Sat, 25 Jun 2022 22:55:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 607EA10ED0F;
 Sat, 25 Jun 2022 22:55:34 +0000 (UTC)
Received: by mail-pg1-x529.google.com with SMTP id q140so5667164pgq.6;
 Sat, 25 Jun 2022 15:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FzvQD1BdX2RVx+fHXlbnajcgEgfcaBeelT02bqIAfkE=;
 b=KOon/w2LGkob1wGHBBHJ89ou2eb0xLTun9FBY+3NZx1eWwTZfXTXIZMhvRPRLmKDF8
 Dwcda1Jw30GegUsGq5yykO+9LaY0RQMTKOnYMfyANn2a3+wdtlv9dtjcONuRm0GcVBgA
 3NtzNN7r099vZD9WVBGppQ5Lg4tknfuXe6UWFAk00weyuLfuLdo3YKh3dsJwT5jnH9hz
 gsgkoC0W0L+kjPHRjXkc+EzynBBIR4R0S+Rp8DRGu6WKIfxLtVnuRk06VDkwWsV9R1q1
 0mxtU8/2yxnVxUA8PrhSm4XyZX9ZDNMbykvOViY/ldaB3UAeRLHbSYMkhzp8lGDDsH2A
 yftQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FzvQD1BdX2RVx+fHXlbnajcgEgfcaBeelT02bqIAfkE=;
 b=j5I+YtuC0Pej8QQls4tKh/YLuNq59dkbQUDboLRB3BLCxV3oLCVe08LHGCHHjhztst
 X9QvzF43IkCTyO3FzMfLctlBfAlhkjIjyY9ZutoOD5UbyUs0WlN6/BttqkIZ+wKslzul
 uEqdqRMn1luEYOqX7F2bv0gzqDE0Y97yib2AMYt45JSgupM2Cnc2Smc+QjFXhYQn+5gh
 hmmFF6I0C2vf8cInuEpdVB/Vtjwf7xqHRPcP/+/+gVy6JXTl3Qx/WBKTNeYuEWfSC1VW
 BNmV85rrCXSIFRz8qbk2uwvr/v9xzpd0FB0dH/zxez7ZIKcSGVluWsFG5+1Cw+6jzJOB
 K1CA==
X-Gm-Message-State: AJIora+Wdiu6usyGib2FS903uY4KSLZScjMsWb6NIWbbiRk18zfpaU/I
 Oo1tK1fgPl8Yq4o8sojVnF3R0VRdXYU=
X-Google-Smtp-Source: AGRyM1vj3PKBYedlufVclRfXmk3uILPeCT+e1vBK/3Ya1177jHlJLFqiGL7Ag79Bl3wRNNifT2aS0g==
X-Received: by 2002:a63:b94a:0:b0:40c:e843:a1dc with SMTP id
 v10-20020a63b94a000000b0040ce843a1dcmr5370006pgo.441.1656197733393; 
 Sat, 25 Jun 2022 15:55:33 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id
 jb20-20020a170903259400b0016a11b9aeb2sm4171689plb.187.2022.06.25.15.55.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Jun 2022 15:55:32 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 13/15] drm/msm/gem: Unpin buffers earlier
Date: Sat, 25 Jun 2022 15:54:48 -0700
Message-Id: <20220625225454.81039-14-robdclark@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220625225454.81039-1-robdclark@gmail.com>
References: <20220625225454.81039-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

We've already attached the fences, so obj->resv (which shrinker checks)
tells us whether they are still active.  So we can unpin sooner, before
we drop the queue lock.

This also avoids the need to grab the obj lock in the retire path,
avoiding potential for lock contention between submit and retire.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index adf358fb8e9d..5599d93ec0d2 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -501,11 +501,11 @@ static int submit_reloc(struct msm_gem_submit *submit, struct msm_gem_object *ob
  */
 static void submit_cleanup(struct msm_gem_submit *submit, bool error)
 {
-	unsigned cleanup_flags = BO_LOCKED;
+	unsigned cleanup_flags = BO_LOCKED | BO_OBJ_PINNED;
 	unsigned i;
 
 	if (error)
-		cleanup_flags |= BO_VMA_PINNED | BO_OBJ_PINNED;
+		cleanup_flags |= BO_VMA_PINNED;
 
 	for (i = 0; i < submit->nr_bos; i++) {
 		struct msm_gem_object *msm_obj = submit->bos[i].obj;
@@ -522,10 +522,6 @@ void msm_submit_retire(struct msm_gem_submit *submit)
 	for (i = 0; i < submit->nr_bos; i++) {
 		struct drm_gem_object *obj = &submit->bos[i].obj->base;
 
-		msm_gem_lock(obj);
-		/* Note, VMA already fence-unpinned before submit: */
-		submit_cleanup_bo(submit, i, BO_OBJ_PINNED);
-		msm_gem_unlock(obj);
 		drm_gem_object_put(obj);
 	}
 }
-- 
2.36.1

