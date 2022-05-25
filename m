Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD762533FAF
	for <lists+dri-devel@lfdr.de>; Wed, 25 May 2022 16:58:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD36210FA98;
	Wed, 25 May 2022 14:58:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C59310FA92
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 14:58:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alyssa) with ESMTPSA id 6D1E11F450F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1653490702;
 bh=iIq4Z4OE65fY1MUJxJmt36vci/mo0TrqzqbRmhmVVVQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ALVw3IlJ0zZ35sYa98XF05tNlJeyYalTzDhzbUAQ+yPCPe5EpdyligBS3ytbL5P2X
 ESgtBI6h821tZqo54pybiiWG7A6cFyHdgLOWrd9UmcT4ZDkv5KVg0qJ58FEXWKJVr2
 m2lXcGK++3Z5qX1eJ8WG6MMVDk6/Xm9UB+dyw7u4/zsrjlE3X2c7VqfGON92hnXtTs
 r0YYA62UPBZuDI3wrHNbQ5FUzkEtlily8FMHfNgKG4FrNyEIkykhig7v0EkcmALZNh
 bx3R8osuxeZYDkcBSReCZLDPWM+hDCTiHYkhfPSTl+QoAyjZh6x3DfWDd3MwYEhC1s
 XeHBXPsth+t6w==
From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 6/9] drm/panfrost: Add "clean only safe" feature bit
Date: Wed, 25 May 2022 10:57:51 -0400
Message-Id: <20220525145754.25866-7-alyssa.rosenzweig@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220525145754.25866-1-alyssa.rosenzweig@collabora.com>
References: <20220525145754.25866-1-alyssa.rosenzweig@collabora.com>
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
Cc: =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
 <nfraprado@collabora.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the HW_FEATURE_CLEAN_ONLY_SAFE bit based on kbase. When I actually
tried to port the logic from kbase, trivial jobs raised Data Invalid
Faults, so this may depend on other coherency details. It's still useful
to have the bit to record the feature bit when adding new models.

Signed-off-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/panfrost/panfrost_features.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_features.h b/drivers/gpu/drm/panfrost/panfrost_features.h
index 36fadcf9634e..1a8bdebc86a3 100644
--- a/drivers/gpu/drm/panfrost/panfrost_features.h
+++ b/drivers/gpu/drm/panfrost/panfrost_features.h
@@ -21,6 +21,7 @@ enum panfrost_hw_feature {
 	HW_FEATURE_TLS_HASHING,
 	HW_FEATURE_THREAD_GROUP_SPLIT,
 	HW_FEATURE_IDVS_GROUP_SIZE,
+	HW_FEATURE_CLEAN_ONLY_SAFE,
 	HW_FEATURE_3BIT_EXT_RW_L2_MMU_CONFIG,
 };
 
-- 
2.35.1

