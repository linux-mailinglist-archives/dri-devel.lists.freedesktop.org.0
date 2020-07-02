Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0482117D2
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jul 2020 03:26:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3951D6EA47;
	Thu,  2 Jul 2020 01:26:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FBC86EA46
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jul 2020 01:26:33 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 70CFE20884;
 Thu,  2 Jul 2020 01:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593653193;
 bh=98pMvrajOhsYk1Q0QIM9Xgjzsao1llACBREviGeiU08=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=drckTU4/7NGwYdcbgJgtCvrDLYzCyb/bS0/e7QQz2OQDtJ5mtJUy9V05CG0Ug90Hc
 zTmI++ak49xiBL7HFRKcd0h/D7mJ5pcvBCNmQeift3E0ri4vOfAZ+wIDKbm6OGv8CW
 P8uXLePT6pKAzIG9vvFSiwX0wWQG2NVe7wb6vY8w=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 14/27] drm: panel-orientation-quirks: Add quirk
 for Asus T101HA panel
Date: Wed,  1 Jul 2020 21:26:02 -0400
Message-Id: <20200702012615.2701532-14-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200702012615.2701532-1-sashal@kernel.org>
References: <20200702012615.2701532-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 Emil Velikov <emil.l.velikov@gmail.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Hans de Goede <hdegoede@redhat.com>

[ Upstream commit 6c22bc18a3b93a38018844636557ad02e588e055 ]

Like the Asus T100HA the Asus T101HA also uses a panel which has been
mounted 90 degrees rotated, albeit in the opposite direction.
Add a quirk for this.

Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20200531093025.28050-1-hdegoede@redhat.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/drm_panel_orientation_quirks.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index cc354b4917742..de7837efbbfce 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -107,6 +107,12 @@ static const struct dmi_system_id orientation_data[] = {
 		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "T100HAN"),
 		},
 		.driver_data = (void *)&asus_t100ha,
+	}, {	/* Asus T101HA */
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "T101HA"),
+		},
+		.driver_data = (void *)&lcd800x1280_rightside_up,
 	}, {	/* GPD MicroPC (generic strings, also match on bios date) */
 		.matches = {
 		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Default string"),
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
