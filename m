Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8BC8546B95
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 19:20:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEE7E10E8C0;
	Fri, 10 Jun 2022 17:20:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9574410E8C0;
 Fri, 10 Jun 2022 17:20:48 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id 15so24404124pfy.3;
 Fri, 10 Jun 2022 10:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1d1YjfsXHCfwVyos+52ZHT3Tu2EerzuEGkO0mh/Nu6Q=;
 b=au0Vt2lCWbjQNYZBsc6w0sdUHlRzG7uateyoAZJeIopej7HCGHyqu+76/Rnll8Kobe
 LnSqI0l4RLNjNN1RqjkTPWsuC2pUadgMzbln/NMia8AXkV62gHRQHgUIrCFa60oNNYj4
 rZr3pubnLU3Ky7IE0bQ0vzoBrqL1+I7FHMTUDSoF6yuMop2I/2dsfYY1TLc+bLG/5vjK
 NKH6LkbnoGcNYD2GSens2DUeXqu1kOu21DyOPwFmSPEmZZDiVlOptKZBQthxfKey6BnP
 P0zX80/6ZIYFT9yqJwio6fPIKHJvHbA/xaFQXfxtOZzpDZKuSbpCKZYaSvKhpl6tYtWD
 PBLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1d1YjfsXHCfwVyos+52ZHT3Tu2EerzuEGkO0mh/Nu6Q=;
 b=BGYOf/rCVT4CqtKk5w33tn0zEUnf05Kpnm18MsuxX+y8n5l3f4L2O4DJJqdRD5KJXQ
 oj4fWkuork4reQPDP7YjaFmEx15uElV4nQM4lCyHF8CgKOLRJbfHAy9m10YyeAnIGM/T
 uTPTDjf1J3kjtnmD5X1nCaJUhXl2dSMw/d1TjYePhDAW7hA9GZqZhGg6s80iToHBRLN8
 7uu9bPp5YrQFlBflAaXguL4wVrZEpo4fHeh8GkY2DWAqaxZhiUDSrFIUuZHKVxjfQiRi
 FKv6YkcKa7DXFMT0QrEUf+b1R4mkZ+lWGfndATCJA3dt8KO+osVyPPkyHxOfAH+rFteJ
 NYXA==
X-Gm-Message-State: AOAM533AWTkifodp2Sr2l+aRXnW5CJGADWacyO3Aj6aA5OPpx67vcsmD
 4nvF+XIA6SeD11YaFldeeszxWT1hjmo=
X-Google-Smtp-Source: ABdhPJzv1bPE/Sdfur21MebWfhL8/IUFnAi8/MuTCkTO+62g950KjYPUDnGxHW6lox+gRfj2JlppCQ==
X-Received: by 2002:a05:6a00:98b:b0:51b:d730:c58 with SMTP id
 u11-20020a056a00098b00b0051bd7300c58mr43227873pfg.23.1654881647554; 
 Fri, 10 Jun 2022 10:20:47 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 b9-20020a639309000000b00405111cd999sm34273pge.36.2022.06.10.10.20.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 10:20:46 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm/gem: Drop early returns in close/purge vma
Date: Fri, 10 Jun 2022 10:20:55 -0700
Message-Id: <20220610172055.2337977-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.36.1
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

Keep the warn, but drop the early return.  If we do manage to hit this
sort of issue, skipping the cleanup just makes things worse (dangling
drm_mm_nodes when the msm_gem_vma is freed, etc).  Whereas the worst
that happens if we tear down a mapping the GPU is accessing is that we
get GPU iova faults, but otherwise the world keeps spinning.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem_vma.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 3c1dc9241831..c471aebcdbab 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -62,8 +62,7 @@ void msm_gem_purge_vma(struct msm_gem_address_space *aspace,
 	unsigned size = vma->node.size;
 
 	/* Print a message if we try to purge a vma in use */
-	if (GEM_WARN_ON(msm_gem_vma_inuse(vma)))
-		return;
+	GEM_WARN_ON(msm_gem_vma_inuse(vma));
 
 	/* Don't do anything if the memory isn't mapped */
 	if (!vma->mapped)
@@ -128,8 +127,7 @@ msm_gem_map_vma(struct msm_gem_address_space *aspace,
 void msm_gem_close_vma(struct msm_gem_address_space *aspace,
 		struct msm_gem_vma *vma)
 {
-	if (GEM_WARN_ON(msm_gem_vma_inuse(vma) || vma->mapped))
-		return;
+	GEM_WARN_ON(msm_gem_vma_inuse(vma) || vma->mapped);
 
 	spin_lock(&aspace->lock);
 	if (vma->iova)
-- 
2.36.1

