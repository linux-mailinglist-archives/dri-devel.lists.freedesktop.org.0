Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A87A469C7
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 19:31:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 094CB10E9AC;
	Wed, 26 Feb 2025 18:31:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="aCkMFOAD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BED0210E9AC
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 18:31:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1740594670; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=UfqdIUbD87c+2aSgp3POmh2n5CDc8YAs4cWidwB5gI1Xpake3xl8pUJEbOiGE3by7fUsImKXixxylZsm+xZ2uNfHr+6PbgBgWLxjdmZitVkwPoNqUQ0/eYk+Z+ad/bEFda47P1eBHnC2rR0OjaWxI1HeoOkMAAd0PLWqXBXAb/Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1740594670;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=hIkp+NnTJPxQcX2Rdgo+vdaGlwKLBcPZ5PRXpnJscic=; 
 b=CelpxNQM/bvC8RQSCMgl//1krTGtg0WP7yMt6QgsmqpD1RuMfHROE82kFOPnoayqX9cEzqFpcHkvwjNcq1ZdVvJQoTW9VWyAY6yzVQw8K61uwychMrUU0UmxxnF7XnVm6+CXTs7M7+PBfnVFBwF0oLvNxr4W9TsiBSR0AXdluwg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
 dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1740594670; 
 s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=hIkp+NnTJPxQcX2Rdgo+vdaGlwKLBcPZ5PRXpnJscic=;
 b=aCkMFOAD+KcvdKOxRNiKB9myydk1CLwklPIhBNBaKu7p0rF7qqz/MIcWXm9aTVVP
 3N7uTc1aGY1sQEqAOrM6AIHjDBbtbuSbVezwXpiS3q8CI9s5SaACf5gYjG4lajmlEPh
 2hfVPwNxSz9fGl1EOicGVDF0Lq7Kr1dFdK1cNxwM=
Received: by mx.zohomail.com with SMTPS id 1740594668431951.5175651775419;
 Wed, 26 Feb 2025 10:31:08 -0800 (PST)
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: boris.brezillon@collabora.com, robh@kernel.org, steven.price@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch,
 Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Subject: [RFC PATCH 4/4] drm/panfrost: Set HW_FEATURE_AARCH64_MMU feature flag
 on Bifrost models
Date: Wed, 26 Feb 2025 15:30:43 -0300
Message-ID: <20250226183043.140773-5-ariel.dalessandro@collabora.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250226183043.140773-1-ariel.dalessandro@collabora.com>
References: <20250226183043.140773-1-ariel.dalessandro@collabora.com>
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

Mali Bifrost MMU support AArch64 4kB page tables. This feature is in
panfrost based the HW_FEATURE_AARCH64_MMU feature flag.

Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_features.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_features.h b/drivers/gpu/drm/panfrost/panfrost_features.h
index 7ed0cd3ea2d4..52f9d69f6db9 100644
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

