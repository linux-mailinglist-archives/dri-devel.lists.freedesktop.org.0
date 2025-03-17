Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43DB5A6546B
	for <lists+dri-devel@lfdr.de>; Mon, 17 Mar 2025 15:55:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81B3310E41A;
	Mon, 17 Mar 2025 14:55:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="Rj74kfnk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F70C10E41A
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 14:55:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1742223291; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=RYUaiD3Mz4k5fvw1by0Na+O2at92VulAtv2M8E1AP9TCnvG/psP3kXFbVtbrBu+t0jcCoLu7jek26UGHQj7s0LANPJHpgke8PZ+m/C7rrNGk98mTctdf2uYvvwSkAoBpbjZCksxIgjrPIGk7VNF7qloGRsdluYwrJfqYUSn9Z2Q=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1742223291;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=8ko5u8UGR6vLGK2T6EY0xPz43YUrrXiIQoaCjRcfxpk=; 
 b=kcsPQ9VRO5anAuRiLwAYx05gNxFK0zDpC6Qj27bPet9BCraT0dl9QoAp9TMdypSi5ZmMz+hHNwm4DVWNKr41w0ItYjiR0HpVMGLLANpJZ3SAQIbxLkFLRmN6A4mwukSMVssz3qhiq7b17g1hpO2K2SfoMTGy6n+UMQ6iV/v+9Jc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
 dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1742223291; 
 s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=8ko5u8UGR6vLGK2T6EY0xPz43YUrrXiIQoaCjRcfxpk=;
 b=Rj74kfnkc3JDkMjGsoxDnqVJKqVZbQg3AXKVvcCcXu/iKktkyr1olTjSV+sqWuZE
 ZGBOlDdoI3wg339dsO7AWR8lhHDccK7QYbE2D4xiSjyg1X5eEfJ0rqeW55elpSz0Vd3
 KOe1idT3Joe3+eFVji6hhxujYqVxfz8M4xP3+oVA=
Received: by mx.zohomail.com with SMTPS id 1742223290652601.8281280971676;
 Mon, 17 Mar 2025 07:54:50 -0700 (PDT)
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: boris.brezillon@collabora.com, robh@kernel.org, steven.price@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, kernel@collabora.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 sjoerd@collabora.com, angelogioacchino.delregno@collabora.com,
 Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Subject: [PATCH v4 3/6] drm/panfrost: Set HW_FEATURE_AARCH64_MMU feature flag
 on Bifrost models
Date: Mon, 17 Mar 2025 11:52:42 -0300
Message-ID: <20250317145245.910566-4-ariel.dalessandro@collabora.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250317145245.910566-1-ariel.dalessandro@collabora.com>
References: <20250317145245.910566-1-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
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

Set this feature flag on all Mali Bifrost platforms as the MMU supports
AARCH64 4K page table format.

Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_features.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_features.h b/drivers/gpu/drm/panfrost/panfrost_features.h
index 7ed0cd3ea2d4c..52f9d69f6db9d 100644
--- a/drivers/gpu/drm/panfrost/panfrost_features.h
+++ b/drivers/gpu/drm/panfrost/panfrost_features.h
@@ -54,6 +54,7 @@ enum panfrost_hw_feature {
 	BIT_ULL(HW_FEATURE_THREAD_GROUP_SPLIT) | \
 	BIT_ULL(HW_FEATURE_FLUSH_REDUCTION) | \
 	BIT_ULL(HW_FEATURE_PROTECTED_MODE) | \
+	BIT_ULL(HW_FEATURE_AARCH64_MMU) | \
 	BIT_ULL(HW_FEATURE_COHERENCY_REG))
 
 #define hw_features_g72 (\
@@ -64,6 +65,7 @@ enum panfrost_hw_feature {
 	BIT_ULL(HW_FEATURE_FLUSH_REDUCTION) | \
 	BIT_ULL(HW_FEATURE_PROTECTED_MODE) | \
 	BIT_ULL(HW_FEATURE_PROTECTED_DEBUG_MODE) | \
+	BIT_ULL(HW_FEATURE_AARCH64_MMU) | \
 	BIT_ULL(HW_FEATURE_COHERENCY_REG))
 
 #define hw_features_g51 hw_features_g72
@@ -77,6 +79,7 @@ enum panfrost_hw_feature {
 	BIT_ULL(HW_FEATURE_PROTECTED_MODE) | \
 	BIT_ULL(HW_FEATURE_PROTECTED_DEBUG_MODE) | \
 	BIT_ULL(HW_FEATURE_IDVS_GROUP_SIZE) | \
+	BIT_ULL(HW_FEATURE_AARCH64_MMU) | \
 	BIT_ULL(HW_FEATURE_COHERENCY_REG))
 
 #define hw_features_g76 (\
-- 
2.47.2

