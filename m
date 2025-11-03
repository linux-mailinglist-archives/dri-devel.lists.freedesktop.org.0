Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F89CC2C64D
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 15:24:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A694010E054;
	Mon,  3 Nov 2025 14:24:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="Z2OnA3/C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 604 seconds by postgrey-1.36 at gabe;
 Mon, 03 Nov 2025 14:24:37 UTC
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt
 [193.136.128.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48FE110E053
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 14:24:37 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 2111D60022F4;
 Mon,  3 Nov 2025 14:14:31 +0000 (WET)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id T9LFM5EGhtVI; Mon,  3 Nov 2025 14:14:28 +0000 (WET)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt
 [IPv6:2001:690:2100:1::b3dd:b9ac])
 by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 866BF60020FD;
 Mon,  3 Nov 2025 14:14:28 +0000 (WET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
 s=mail2; t=1762179268;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=HpWfodvFZQWizAOLu01/8g3LpgwphXqOOP+S+mC1n0c=;
 b=Z2OnA3/C3BrZ19sW30AE/Hnp5yLP4aNBmtHqEbpMO36mxMcw1ZQE4GwZ8VKhFDiCuGq4Jr
 rWpt4knwf4pNSiVNrEvSyezTwAwtZ8oXnXf3s8mJ3Nl1HSe2ybd2byJqpy5KlEIQ535AJf
 2gEquadJ1CI0+lFLjTPeTvgoGVGXq3HAb70FFtNyxsT+kNzxCXF0qqZ+BeBgZ2fUoW8BLk
 ZIios0Tll0wdEhP9vRD7K5hBXOWT/w3vnGkzaPWCRHGo6zW+QqtRzCU7JK2hpMIqAxhqLn
 uyAsFNTjPmI7fdJMKIQlqGJxd3iaspyTjRUvnl2Qp3HTSzcXvao3O8rvPpgmYg==
Received: from [192.168.1.72] (unknown
 [IPv6:2001:8a0:fbec:a900:2c09:2fb0:9be7:36e0])
 (Authenticated sender: ist187313)
 by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id EBAA93600BA;
 Mon,  3 Nov 2025 14:14:27 +0000 (WET)
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Date: Mon, 03 Nov 2025 14:14:15 +0000
Subject: [PATCH] Revert "drm/tegra: dsi: Clear enable register if powered
 by bootloader"
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251103-diogo-smaug_ec_typec-v1-1-be656ccda391@tecnico.ulisboa.pt>
X-B4-Tracking: v=1; b=H4sIALa4CGkC/x3MQQ5AMBBA0avIrDUxLYKriEjVqFlQaREi7q6xf
 Iv/HwjkmQI0yQOeTg7s1ghMEzCzXi0JHqNBZrJAzJQY2VknwqIP25Pp93sjI+qhrFSJUtc5Qkw
 3TxNf/7bt3vcDaD6mLGYAAAA=
X-Change-ID: 20251103-diogo-smaug_ec_typec-9b683612a941
To: Thierry Reding <thierry.reding@gmail.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762179267; l=2211;
 i=diogo.ivo@tecnico.ulisboa.pt; s=20240529; h=from:subject:message-id;
 bh=0UtHJ93CApdPj4/jZyrUpu+KC3Q7dMZ8xBWk98XEaZs=;
 b=TWbqZCaqz4UEzGh4OnzeR9/4/HeOBL5Y16MX7PhCB07v2Ag8xF226bE+5WZgAoZOumgKEoAWm
 35d6fXUKtEgAhjPMBh3NHTLye/3Thg6DvrvVbUOui0Spqc5fqe+8Yep
X-Developer-Key: i=diogo.ivo@tecnico.ulisboa.pt; a=ed25519;
 pk=BRGXhMh1q5KDlZ9y2B8SodFFY8FGupal+NMtJPwRpUQ=
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

This reverts commit b22fd0b9639ed61e379b3b9bba00629ebf8e6946.

Commit b6bcbce3359619d ("soc/tegra: pmc: Ensure power-domains are in a
known state") was introduced so that all power domains get initialized
to a known working state when booting and it does this by shutting them
down (including asserting resets and disabling clocks) before registering
each power domain with the genpd framework, leaving it to each driver to
later on power its needed domains.

This caused the Google Pixel C to hang when booting due to a workaround
in the DSI driver introduced in commit b22fd0b9639ed61 ("drm/tegra: dsi:
Clear enable register if powered by bootloader") meant to handle the case
where the bootloader enabled the DSI hardware module. The workaround relies
on reading a hardware register to determine the current status and after
b6bcbce3359619d that now happens in a powered down state thus leading to
the boot hang.

Fix this by reverting b22fd0b9639ed61 since currently we are guaranteed
that the hardware will be fully reset by the time we start enabling the DSI
module.

Fixes: b6bcbce3359619d ("soc/tegra: pmc: Ensure power-domains are in a known state")
Cc: stable@vger.kernel.org
Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
---
 drivers/gpu/drm/tegra/dsi.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
index b5089b772267..ddfb2858acbf 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -913,15 +913,6 @@ static void tegra_dsi_encoder_enable(struct drm_encoder *encoder)
 	u32 value;
 	int err;
 
-	/* If the bootloader enabled DSI it needs to be disabled
-	 * in order for the panel initialization commands to be
-	 * properly sent.
-	 */
-	value = tegra_dsi_readl(dsi, DSI_POWER_CONTROL);
-
-	if (value & DSI_POWER_CONTROL_ENABLE)
-		tegra_dsi_disable(dsi);
-
 	err = tegra_dsi_prepare(dsi);
 	if (err < 0) {
 		dev_err(dsi->dev, "failed to prepare: %d\n", err);

---
base-commit: 6146a0f1dfae5d37442a9ddcba012add260bceb0
change-id: 20251103-diogo-smaug_ec_typec-9b683612a941

Best regards,
-- 
Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>

