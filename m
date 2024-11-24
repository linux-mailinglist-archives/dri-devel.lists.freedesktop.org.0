Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C189D717C
	for <lists+dri-devel@lfdr.de>; Sun, 24 Nov 2024 14:50:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C2EC10E544;
	Sun, 24 Nov 2024 13:50:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="P6Epw7IE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52A5B10E544
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Nov 2024 13:49:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 28EF95C2FE4;
 Sun, 24 Nov 2024 13:49:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 029BAC4CECC;
 Sun, 24 Nov 2024 13:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732456198;
 bh=Zrg+opT7ANsezMOmV1lHm26HyDnl3ywVyPTPzMMuVpI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=P6Epw7IEh7Ecf4YyiEJLVeMtr6RAYpti8RsEEHZea5s3jwWfALKD1gi8DVLJu6a2z
 JYx23gE9m5P6BVRI2ljTsPG2r9Xtx3tCe9uGKP3tCEBiWCzY8j6gPdYgIbX/bPy/du
 nC5d7smel+9VtSLCwHmtxjaE1LxQ508NhwxNR/ngFOZzsE3k853CcnJpkBj65EVmVO
 YUoZXLnuEzjLrI4r/ap7Jsc8s2Rb39gjE4OtujQ5NFrZp4rragSyEPyQNWD/t3mTIZ
 t8nD23FQ70toFwqT887jGip/9Qr3nYO3efMu8X0fZk1ipzMQX8NfsLg2OoLtwhG6C6
 oDOzsJV1GVH1w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: =?UTF-8?q?Joaqu=C3=ADn=20Ignacio=20Aramend=C3=ADa?= <samsagax@gmail.com>, 
 Tobias Jakobi <tjakobi@math.uni-bielefeld.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Hans de Goede <hdegoede@redhat.com>, Sasha Levin <sashal@kernel.org>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.1 04/48] drm: panel-orientation-quirks: Add quirk
 for AYA NEO Founder edition
Date: Sun, 24 Nov 2024 08:48:27 -0500
Message-ID: <20241124134950.3348099-4-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241124134950.3348099-1-sashal@kernel.org>
References: <20241124134950.3348099-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.119
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Joaquín Ignacio Aramendía <samsagax@gmail.com>

[ Upstream commit d7972d735ca80a40a571bf753c138263981a5698 ]

Add quirk orientation for AYA NEO Founder. The name appears with spaces in
DMI strings as other devices of the brand. The panel is the same as the
NEXT and 2021 models. Those could not be reused as the former has VENDOR
name as "AYANEO" without spaces and the latter has "AYADEVICE".

Tested by the JELOS team that has been patching their own kernel for a
while now and confirmed by users in the AYA NEO and ChimeraOS discord
servers.

Signed-off-by: Joaquín Ignacio Aramendía <samsagax@gmail.com>
Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Link: https://patchwork.freedesktop.org/patch/msgid/f71889a0b39f13f4b78481bd030377ca15035680.1726492131.git.tjakobi@math.uni-bielefeld.de
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/drm_panel_orientation_quirks.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index 69a38e1034cad..87ab8009c8fd4 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -202,6 +202,12 @@ static const struct dmi_system_id orientation_data[] = {
 		  DMI_MATCH(DMI_PRODUCT_NAME, "AIR"),
 		},
 		.driver_data = (void *)&lcd1080x1920_leftside_up,
+	}, {	/* AYA NEO Founder */
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "AYA NEO"),
+		  DMI_MATCH(DMI_PRODUCT_NAME, "AYA NEO Founder"),
+		},
+		.driver_data = (void *)&lcd800x1280_rightside_up,
 	}, {	/* AYA NEO NEXT */
 		.matches = {
 		  DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
-- 
2.43.0

