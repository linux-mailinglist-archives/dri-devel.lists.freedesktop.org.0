Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B465798FB4
	for <lists+dri-devel@lfdr.de>; Fri,  8 Sep 2023 21:34:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4544B10E929;
	Fri,  8 Sep 2023 19:34:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F5EB10E929
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Sep 2023 19:34:16 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E993FB821DC;
 Fri,  8 Sep 2023 19:34:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C42DC07616;
 Fri,  8 Sep 2023 19:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694201653;
 bh=0TbeIvtzj9zzPwh9x21YhebZsluboujewOIxsRHabnM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NAs3Ot6c5de24tPaX6QMzztNGFS1o1R5UOi5JSInfJcGb/8VjUk2TjNpT0qA7JfZB
 GGgzvc41VkZMIsO4iPD5WzcvVr+L6YPllznKy6Yhe9IWmxGQowjhpyopNhpi7XNTFx
 sM4Q6bG6xa5UI51GmB1GYcCYJPZCbrdbCyFmqJ8/+35zvTAs+NhhoGihA3eL8SASqc
 eutFmY4/uk3NGAHOpcwqV6xz1EVz4kBl21Je0ElIWz3ikkNutTdNbRobVEPrztwC4b
 1CE7HBTd5gnTEgrpyi2jNl6/TULN6D6j1KzMtV0l3IPb5Tkxn1wAc8vkmMwABu74ZW
 kd1skgu+3PRpg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 02/22] drm/edid: Add quirk for OSVR HDK 2.0
Date: Fri,  8 Sep 2023 15:33:46 -0400
Message-Id: <20230908193407.3463368-2-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230908193407.3463368-1-sashal@kernel.org>
References: <20230908193407.3463368-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.52
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
Cc: Sasha Levin <sashal@kernel.org>, Ralph Campbell <rcampbell@nvidia.com>,
 Jani Nikula <jani.nikula@intel.com>, mripard@kernel.org,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ralph Campbell <rcampbell@nvidia.com>

[ Upstream commit 98d4cb705bc00afd4a9a71cc1e84f7111682639a ]

The OSVR virtual reality headset HDK 2.0 uses a different EDID
vendor and device identifier than the HDK 1.1 - 1.4 headsets.
Add the HDK 2.0 vendor and device identifier to the quirks table so
that window managers do not try to display the desktop screen on the
headset display.

Closes: https://gitlab.freedesktop.org/drm/misc/-/issues/30
Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
Tested-by: Ralph Campbell <rcampbell@nvidia.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20230621061903.3422648-1-rcampbell@nvidia.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/drm_edid.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 739e0d40cca61..5ed77e3361fd7 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -231,6 +231,7 @@ static const struct edid_quirk {
 
 	/* OSVR HDK and HDK2 VR Headsets */
 	EDID_QUIRK('S', 'V', 'R', 0x1019, EDID_QUIRK_NON_DESKTOP),
+	EDID_QUIRK('A', 'U', 'O', 0x1111, EDID_QUIRK_NON_DESKTOP),
 };
 
 /*
-- 
2.40.1

