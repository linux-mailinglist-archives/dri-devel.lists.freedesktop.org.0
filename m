Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D69E28ABB5
	for <lists+dri-devel@lfdr.de>; Mon, 12 Oct 2020 04:09:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 796316E220;
	Mon, 12 Oct 2020 02:09:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A06216E220;
 Mon, 12 Oct 2020 02:09:12 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id 1so1908772ple.2;
 Sun, 11 Oct 2020 19:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wkKO6gE/6KJG3tJnrM8NMN9Fo3JxBHm6Yh5bWEF2DRw=;
 b=MYI0Ly5EzyTuj4BMLUbYhrlVJJqPXLF/i9xH5If4hAi0yXUSNMD+OTvpRjNCoRQHii
 VBg4F9mxPyqkWf6/oDvdA473nQFhgd8nnNoMjs2roHv0tfkEATgMrAMqQ2vDEabMbWrd
 h5bK15LAp8a/HKaWMHt+KNyXFofASY5i+BqSl6SiSz9xY4KFSA8UW1pKSx2d/i5w3UMk
 TvWEnW3YFzGpDbaIXJT2yy9/UchcGdMIIkWSOGFQj/VrUfg5SnWuWXgIFBCD3iU21egT
 x7jb8ZSiyhlBG6JGnEsMVzKITzKWHLgUGATjwFs+wbzNPlDVD15gmpF+wDC194TK3XiF
 IwtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wkKO6gE/6KJG3tJnrM8NMN9Fo3JxBHm6Yh5bWEF2DRw=;
 b=m5qGOGiAP7YQqRGdzwGaadp7rtwVWQzYuwjuCOZxAOxKXVfUJ6ER8LMKnfIKDm80KJ
 Kv3TDgu5adFPnOVzd8GVBSAn8RPLepsEsRv0YnPZA346SpO/js4mMj4AYxb8NkLdtepg
 Xe1TLIvev22BjbFU7DPxUkwfrnVk76LKx/gU8uQjJho0FkGC0GMeGcHxL8A9lv/4A2Zn
 01x+Xugn5U/3HPIWiXZ/CKZ4Ejq1CAH6ZwwjH/tbjKnxKCjyC9Ztu3CWo1QIeNFuoP7D
 PtxJSheem0j46fJB5CSuBcKAuMToK+K7e8wi4dQJM2G0n3GsoHH1MpkB6JcrLShwh1we
 JrOg==
X-Gm-Message-State: AOAM5308dsImO0aVC+dbky0b3Jprh1UDXtv2vl1x0yY1iECRu9asWbe2
 2V+j+HeqqjGeg0sIkOIlc0lYEJlup0+bVD5Z
X-Google-Smtp-Source: ABdhPJz8PFPRUJXoh1vK+0F0u53LCMifZs8ilkAAIk7Rc54/1QJo+KiCddguw4OAOhsB7F9ZxB9ypg==
X-Received: by 2002:a17:902:9349:b029:d4:df10:353c with SMTP id
 g9-20020a1709029349b02900d4df10353cmr2467354plp.20.1602468551695; 
 Sun, 11 Oct 2020 19:09:11 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 na9sm12662085pjb.45.2020.10.11.19.09.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Oct 2020 19:09:10 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 11/22] drm/msm: Move update_fences()
Date: Sun, 11 Oct 2020 19:09:38 -0700
Message-Id: <20201012020958.229288-12-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201012020958.229288-1-robdclark@gmail.com>
References: <20201012020958.229288-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Small cleanup, update_fences() is used in the hangcheck path, but also
in the normal retire path.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>
---
 drivers/gpu/drm/msm/msm_gpu.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 677b11c5a151..e5b7c8a77c99 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -265,6 +265,20 @@ int msm_gpu_hw_init(struct msm_gpu *gpu)
 	return ret;
 }
 
+static void update_fences(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
+		uint32_t fence)
+{
+	struct msm_gem_submit *submit;
+
+	list_for_each_entry(submit, &ring->submits, node) {
+		if (submit->seqno > fence)
+			break;
+
+		msm_update_fence(submit->ring->fctx,
+			submit->fence->seqno);
+	}
+}
+
 #ifdef CONFIG_DEV_COREDUMP
 static ssize_t msm_gpu_devcoredump_read(char *buffer, loff_t offset,
 		size_t count, void *data, size_t datalen)
@@ -411,20 +425,6 @@ static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
  * Hangcheck detection for locked gpu:
  */
 
-static void update_fences(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
-		uint32_t fence)
-{
-	struct msm_gem_submit *submit;
-
-	list_for_each_entry(submit, &ring->submits, node) {
-		if (submit->seqno > fence)
-			break;
-
-		msm_update_fence(submit->ring->fctx,
-			submit->fence->seqno);
-	}
-}
-
 static struct msm_gem_submit *
 find_submit(struct msm_ringbuffer *ring, uint32_t fence)
 {
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
