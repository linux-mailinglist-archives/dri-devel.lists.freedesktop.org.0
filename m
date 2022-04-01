Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC244EEF54
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 16:25:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B89E10E3C0;
	Fri,  1 Apr 2022 14:25:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E66810E3C0
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Apr 2022 14:25:45 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BEAACB82402;
 Fri,  1 Apr 2022 14:25:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19983C2BBE4;
 Fri,  1 Apr 2022 14:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648823140;
 bh=NS4ep+ynH/MO4fqollxIkLZFOHEpGJ6529DTMzlgoz4=;
 h=From:To:Cc:Subject:Date:From;
 b=uDKkOYFZ6/DMhrGMOL15AJyWn9twrqsTOniHxJPacl3NvKK1Ulg3R8Y2G1P07zp98
 FwAMTlN8wjGq5Iy4Gd2RfdQkbkCIviEedDtbGTK0wvXha3eDp/Ey5qqbk9LNfghmns
 CZMUdhrPsZOpccza7iSaiE1Qbt+E35T+tFJyfqqsqHylhkeKcXwz+M4dENSv5j8hmD
 1nUXq3dEssQTNB95yQsoHGD1I7kofCw0MY/HRg0mBvd7LsDyo1zcCh+j/Op81M8maN
 Lg2R7RwzcHWxrfepkmfdkhwHnft9/N86GTf0iXbybNBR5IQzNQp0AfFnVnxnwWt7wN
 NntZ82C5dSUKg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.17 001/149] drm: Add orientation quirk for GPD Win
 Max
Date: Fri,  1 Apr 2022 10:23:08 -0400
Message-Id: <20220401142536.1948161-1-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Jani Nikula <jani.nikula@intel.com>,
 airlied@linux.ie, Anisse Astier <anisse@astier.eu>,
 Hans de Goede <hdegoede@redhat.com>, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Anisse Astier <anisse@astier.eu>

[ Upstream commit 0b464ca3e0dd3cec65f28bc6d396d82f19080f69 ]

Panel is 800x1280, but mounted on a laptop form factor, sideways.

Signed-off-by: Anisse Astier <anisse@astier.eu>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20211229222200.53128-3-anisse@astier.eu
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/drm_panel_orientation_quirks.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index b910978d3e48..4e853acfd1e8 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -180,6 +180,12 @@ static const struct dmi_system_id orientation_data[] = {
 		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "MicroPC"),
 		},
 		.driver_data = (void *)&lcd720x1280_rightside_up,
+	}, {	/* GPD Win Max */
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "GPD"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "G1619-01"),
+		},
+		.driver_data = (void *)&lcd800x1280_rightside_up,
 	}, {	/*
 		 * GPD Pocket, note that the the DMI data is less generic then
 		 * it seems, devices with a board-vendor of "AMI Corporation"
-- 
2.34.1

