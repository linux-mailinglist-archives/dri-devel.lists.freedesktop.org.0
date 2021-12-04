Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA8146936A
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 11:21:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1964C73EDB;
	Mon,  6 Dec 2021 10:19:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79F606E8A0;
 Sat,  4 Dec 2021 10:55:37 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id d11so11142216ljg.8;
 Sat, 04 Dec 2021 02:55:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jMWhXajJiO5/ngjUzSyRmg7Q56WNQVKtCHyObQxH9Wg=;
 b=cIym/fh9aHVFDhGAj0hvUz+OG75vxQxF2mMByqcvJk603QAr9P5yDTOIY17tko55Dp
 03rxl8fgbhQSebhWCp+fayAWUnbM3PSB/KhTnawZjO9msrffBLMcb8d6yQ328A5Ydl4F
 m+FpG3ce6TUa5a00X2v9BvqdPLZu1+Ng/tZ+rzs9gtbeWgwzkVsfgUB06dPqCN3y2eMH
 WKHIQzKFzQcL5GJ1UhDTzX7OJvhAaYlnfyFNZCDdQ2G53ohQCrSyqu7S+5LWWu4sQdHY
 y/eQbrMBgreF0AE/LfpVuUY4CtYEx3F/hP2Z/XlYbdUBNXaXkMPob/lhfi5R2E3YKRhV
 OTIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jMWhXajJiO5/ngjUzSyRmg7Q56WNQVKtCHyObQxH9Wg=;
 b=2f8yc478RnCdeXieNloGs3PMkb7BK55Rwuo8Vkf9GNl3nc3vRfegr/QP/f2NSg5nDv
 qx/bJCdbdaQBO9kIcezukZ7a2zloK2Bkqcba+NTBSOaVG2NyervXShpisxP+D3XeuHNN
 OUWEmxouyaZ25Jd/B2zazJB9ecWNMjl2cqExY3jJsXAmYLPsFCVvWT4y9YsC2plgcK+g
 0CyK1PIje1zVGqOg35YRMasCr9DMR8gFCarSc893nbKwxhJjEadM5ZuVU1LX4hf1IgVE
 vjJZ7+aFofdOv3LxOTMmKN8P7YmdsTlE0/jdlLAL9pDlU137jtuAoYO6/+NGHfqX7Jab
 fxFw==
X-Gm-Message-State: AOAM531g3LD3ASAuLLxj6rd7PPbdDgLxpktJW9J6hTFvdDB+dGIzX9JF
 Z+5yBT5m3ze6nAH9tAV+crTbxOFo9v3c2A==
X-Google-Smtp-Source: ABdhPJzAvK3lM4MuYvqgdryJD+si4iT6GqCmZFbOMDBg7ckgsqI2GdDZzUmpmowYddV/Bb34pDqc1Q==
X-Received: by 2002:a2e:9bc9:: with SMTP id w9mr23107843ljj.27.1638615335817; 
 Sat, 04 Dec 2021 02:55:35 -0800 (PST)
Received: from localhost.localdomain (h-155-4-221-129.NA.cust.bahnhof.se.
 [155.4.221.129])
 by smtp.gmail.com with ESMTPSA id d23sm723918lfm.107.2021.12.04.02.55.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Dec 2021 02:55:35 -0800 (PST)
From: Rikard Falkeborn <rikard.falkeborn@gmail.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 1/9] drm/i915/gvt: Constify intel_gvt_gtt_pte_ops
Date: Sat,  4 Dec 2021 11:55:19 +0100
Message-Id: <20211204105527.15741-2-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211204105527.15741-1-rikard.falkeborn@gmail.com>
References: <20211204105527.15741-1-rikard.falkeborn@gmail.com>
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
Cc: Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These are never modified, so make them const to allow the compiler to
put them in read-only memory.

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 drivers/gpu/drm/i915/gvt/gtt.c | 4 ++--
 drivers/gpu/drm/i915/gvt/gtt.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gtt.c
index 53d0cb327539..6efa48727052 100644
--- a/drivers/gpu/drm/i915/gvt/gtt.c
+++ b/drivers/gpu/drm/i915/gvt/gtt.c
@@ -516,7 +516,7 @@ static struct intel_gvt_gtt_pte_ops gen8_gtt_pte_ops = {
 	.set_pfn = gen8_gtt_set_pfn,
 };
 
-static struct intel_gvt_gtt_gma_ops gen8_gtt_gma_ops = {
+static const struct intel_gvt_gtt_gma_ops gen8_gtt_gma_ops = {
 	.gma_to_ggtt_pte_index = gma_to_ggtt_pte_index,
 	.gma_to_pte_index = gen8_gma_to_pte_index,
 	.gma_to_pde_index = gen8_gma_to_pde_index,
@@ -2097,7 +2097,7 @@ unsigned long intel_vgpu_gma_to_gpa(struct intel_vgpu_mm *mm, unsigned long gma)
 	struct intel_vgpu *vgpu = mm->vgpu;
 	struct intel_gvt *gvt = vgpu->gvt;
 	struct intel_gvt_gtt_pte_ops *pte_ops = gvt->gtt.pte_ops;
-	struct intel_gvt_gtt_gma_ops *gma_ops = gvt->gtt.gma_ops;
+	const struct intel_gvt_gtt_gma_ops *gma_ops = gvt->gtt.gma_ops;
 	unsigned long gpa = INTEL_GVT_INVALID_ADDR;
 	unsigned long gma_index[4];
 	struct intel_gvt_gtt_entry e;
diff --git a/drivers/gpu/drm/i915/gvt/gtt.h b/drivers/gpu/drm/i915/gvt/gtt.h
index 3bf45672ef98..d0d598322404 100644
--- a/drivers/gpu/drm/i915/gvt/gtt.h
+++ b/drivers/gpu/drm/i915/gvt/gtt.h
@@ -92,7 +92,7 @@ struct intel_gvt_gtt_gma_ops {
 
 struct intel_gvt_gtt {
 	struct intel_gvt_gtt_pte_ops *pte_ops;
-	struct intel_gvt_gtt_gma_ops *gma_ops;
+	const struct intel_gvt_gtt_gma_ops *gma_ops;
 	int (*mm_alloc_page_table)(struct intel_vgpu_mm *mm);
 	void (*mm_free_page_table)(struct intel_vgpu_mm *mm);
 	struct list_head oos_page_use_list_head;
-- 
2.34.1

