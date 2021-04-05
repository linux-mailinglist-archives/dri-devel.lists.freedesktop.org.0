Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 631E1354622
	for <lists+dri-devel@lfdr.de>; Mon,  5 Apr 2021 19:42:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 231F789EA9;
	Mon,  5 Apr 2021 17:42:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F3C689EA3;
 Mon,  5 Apr 2021 17:42:10 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id x126so3618727pfc.13;
 Mon, 05 Apr 2021 10:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KzM5ykbDnSnt9IUX0aCvytu48YxBoDL+JwZURK1Yqus=;
 b=Z0xSUkgI/WnrPAodBPqs+x45wcrk9D0f0oyWOT/WBVmpPS2gFwzXSmuqpv9fgM+CCK
 bOBmmjpJteJ4x2fRDhs/jGyki8WpaRuMhQV5O2QwlCyETHmPgm/q6NaaM7t5nUl5oFP9
 QyEzWAsMLPd3i36askiG7v8AbWGkTHS16PKij6lgBQN6yXcLlcHnYZcZ5zGTucCKqtfq
 brZLla4UxnvNcmosZ1INhprIw8wlgvprJyzwcSWJdbushazMjhtWxHrlwZ1h4yrP12XX
 XNsOcF2N74c7FeyccETZN8JespLGqUPuPjE/K9I3Olf8fqEXlQQHi9SIYRFCYTWhbWuC
 GZgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KzM5ykbDnSnt9IUX0aCvytu48YxBoDL+JwZURK1Yqus=;
 b=ERIao5sRH5N81JCeAtpJI/3FSzZ8zGqk0tocLbfnsUECGxfr0eiDCVDEWk4UkLRu+b
 aCSX9tOyfKbWee+MPbDzgaKsGI0o/+gLs/CSKBGCsHuorqxu+3MK5kXAYIcS6KfMJmBj
 1Gzhlcu/8CkFi3bsuH/hnDIEDH49qNQZtcbT5eksoMbrhTWqMNGAG0OeozK7d3jQiKoQ
 TPlmb4KVc+F2flTqftZtKyc3tSRiIkG6ahnUMEmibvF1n1pFCwHR2wfLMjS9dKmFsf2Z
 W4i+SAxLi1GxWe77Y21P7hodJWqD/QZpoWrXiDaEtOFHhp6boUsjq8RwqJAIjckWJWSu
 nQHA==
X-Gm-Message-State: AOAM530zr0NzuAiPkz6WhgWgD6ulzR50aS/Qa8AIQuZOOPnTklKAguxh
 gmJFwk+iVu5Uvm7R9V+xf+/4/X5yHRO5Rw==
X-Google-Smtp-Source: ABdhPJzQJZ7Z8aP6IlzpwDtucp4npu08KOLRLatwk+FA1xci/wuxVncqz9GxQBRoFBJhqtMILWq4pA==
X-Received: by 2002:a65:5b47:: with SMTP id y7mr24029635pgr.119.1617644529404; 
 Mon, 05 Apr 2021 10:42:09 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 b84sm16959829pfb.162.2021.04.05.10.42.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Apr 2021 10:42:08 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/8] drm/msm: Clear msm_obj->sgt in put_pages()
Date: Mon,  5 Apr 2021 10:45:26 -0700
Message-Id: <20210405174532.1441497-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210405174532.1441497-1-robdclark@gmail.com>
References: <20210405174532.1441497-1-robdclark@gmail.com>
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
 open list <linux-kernel@vger.kernel.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Currently this doesn't matter since we keep the pages pinned until the
object is destroyed.  But when we start unpinning pages to allow objects
to be evicted to swap, it will.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index d5abe8aa9978..71530a89b675 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -162,6 +162,7 @@ static void put_pages(struct drm_gem_object *obj)
 
 			sg_free_table(msm_obj->sgt);
 			kfree(msm_obj->sgt);
+			msm_obj->sgt = NULL;
 		}
 
 		if (use_pages(obj))
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
