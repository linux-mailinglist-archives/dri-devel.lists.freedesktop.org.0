Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 184BCC8A6A9
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 15:46:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB0EF89E59;
	Wed, 26 Nov 2025 14:46:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="tcDfxIjX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00F3789E59
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 14:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1764168394; x=1795704394;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=mZKG+/eS2G9qULlqROzuv2ztJH/K/0BpzfBbfPbnMYQ=;
 b=tcDfxIjX7ld3UxJ2Wvz2cLGF4xmi8zES0bJgjrYCw8eMlRx2/f/nb6Pv
 hJUswBPrAjXPkkZFcP1Kaf/ycH+aP9/5su7QO9sihhs8KfWbUw51bCrWo
 LziC3BzPjzeISNUjb+o8naBzP1k08UuryeLKcSB5zD7tR9M9z9J4fQsMC
 BK7ltYioLmu5938baquCG0WkbLSgILS7zm7WmCgBzk1224Cuu5znPGAD1
 PtTjxmsZ+9X7jGbmu8B4dzd5FT/AWVcbJVLDSdptSslmQ8OoWAsNyjlA7
 H1gONrKanfMGxQODwlSRAGFCKNTlPfiDUXgFfxpaamnetqJDbwvXncQjk A==;
X-CSE-ConnectionGUID: E0+1SGJ4QVKpwD0EtjIQkQ==
X-CSE-MsgGUID: DdX36EvCQT2LOq9szWOdOg==
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="56295470"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Nov 2025 07:46:33 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Wed, 26 Nov 2025 07:46:12 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Wed, 26 Nov 2025 07:46:10 -0700
From: Ludovic Desroches <ludovic.desroches@microchip.com>
Date: Wed, 26 Nov 2025 15:44:45 +0100
Subject: [PATCH 2/3] drm/gem-shmem: revert the 8-byte alignment constraint
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20251126-lcd_pitch_alignment-v1-2-991610a1e369@microchip.com>
References: <20251126-lcd_pitch_alignment-v1-0-991610a1e369@microchip.com>
In-Reply-To: <20251126-lcd_pitch_alignment-v1-0-991610a1e369@microchip.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 "Ludovic Desroches" <ludovic.desroches@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=991;
 i=ludovic.desroches@microchip.com; h=from:subject:message-id;
 bh=mZKG+/eS2G9qULlqROzuv2ztJH/K/0BpzfBbfPbnMYQ=;
 b=owEBbQKS/ZANAwAKAT455hP3e2QtAcsmYgBpJxKv119tSwX4wxvnRjRVST7eCb3x4zwxivfzQ
 FudU8CaPdqJAjMEAAEKAB0WIQQAMEvJiWmsW41tNU0+OeYT93tkLQUCaScSrwAKCRA+OeYT93tk
 LUIoD/0b08HK6m4MVer5nCcnjIMqlPdzwUT9MLbaAWSoODuzsOZrkQXg67Xthyfb9NhaMVIlP+I
 u8aH2Zqts6H8lnBBUn1BZXmPixiCnmOk0bWleEE2+Ik0rEEOp58PhD8AK/oxOzBDy7p9sI5WPeQ
 1HAMsTfTXKd7vOIvXX0YQphQolwruMDsPYimeHn3LhtuGDS2+JK//eknay3zx3OiCCZqrTUiLyG
 /IVSDFfacsXQtx8+SGs18/MB9kstPxu3MZZtg8+c/qLIld86WSusY8mQ3YC7I85xGS1/wa2Bxg/
 l7wX+f4RVdKdZZ5mTRLxyD5de0DvjyNdaRehLwvX9izuxYRGFcw/NU/oCYELeAXzp0RcNVFgYtv
 Qg6jrpjTfQ90CIYDLd2McHdy9Mc7AsoeT7m23iVp9RCK2Qi+Xx+rEXysoyJcJMWgsL9c+ZmzmEl
 1H68Bsv4L/p2e3+8qhspDW+h+oUEww/cUM0vNDESQqy+ggouRYB2zhgAyEJmOoJ7Nr1ZZFKp8si
 Ku/F/MawlPYatE6fDAVhuXonVEpKbwwN9nKMrXBtqB/4RAKX2ZsswJj5s8uFjCIDi2xPGsbH6Nv
 y6FjlG52VcEL1jWVEtODWp42TxzuLwbtFCR8PoaOLsH3+9fNAWYcljWpTaSSlIXynWmarVZ58In
 GLpjGVAeGrdq/rg==
X-Developer-Key: i=ludovic.desroches@microchip.com; a=openpgp;
 fpr=665BAA7297BE089A28B77696E332995F09DCC11A
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

Using drm_mode_size_dumb() to compute the size of dumb buffers introduced
an 8-byte alignment constraint on the pitch that wasn’t present before.
Let’s remove this constraint, which isn’t necessarily required and may
cause buffers to be allocated larger than needed.

Signed-off-by: Ludovic Desroches <ludovic.desroches@microchip.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index dc94a27710e5f48839a5d2e9e9ea5152ff22e438..93b9cff89080f94e5d6e4663ef642b4c36e93c71 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -559,7 +559,7 @@ int drm_gem_shmem_dumb_create(struct drm_file *file, struct drm_device *dev,
 {
 	int ret;
 
-	ret = drm_mode_size_dumb(dev, args, SZ_8, 0);
+	ret = drm_mode_size_dumb(dev, args, 0, 0);
 	if (ret)
 		return ret;
 

-- 
2.51.0

