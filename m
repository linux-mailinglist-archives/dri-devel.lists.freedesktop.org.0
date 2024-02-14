Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1EA854915
	for <lists+dri-devel@lfdr.de>; Wed, 14 Feb 2024 13:21:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB70F10E095;
	Wed, 14 Feb 2024 12:21:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=kapsi.fi header.i=@kapsi.fi header.b="sMkVIARR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2414 seconds by postgrey-1.36 at gabe;
 Wed, 14 Feb 2024 12:21:37 UTC
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92CF610E095
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Feb 2024 12:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RzxRRhtdAnPm0aM2h8vavNmIk+E7Tg9BqH5yNtCHY5Y=; b=sMkVIARRDo2Z0YF97eLEIbunGL
 g6UAVfZQ6BOec6wHg5lB95LiExD63s4N9kht2mbKrHL0dxX8a432fZT7ivNNx8+CQJIE88YI9uYB8
 bGXG9HrJM4YAuFLE+ljdsoHyyg2CH12sZQELBtj/wCsvc0EVIdT+DTAMVMD0nhKahDz8XKoFDLsW+
 WQBzgu0ktcPg5LRgBdq1oDu0F2Xc7LPSffhAknnFbJ6xkBleOwggnvh5vUvgSAt41u8nJinLiOyQr
 roUmsbQTFHUYVR3uxMW2hwo59d0nfwUShJVwPs3e62YJSqW1EU/fxtFpDkmjXpjpjOvH+LDBKP/wT
 CR+j+wzA==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70]
 helo=toshino.localdomain) by mail.kapsi.fi with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <cyndis@kapsi.fi>) id 1raDdd-00ChIO-0X;
 Wed, 14 Feb 2024 13:41:17 +0200
From: Mikko Perttunen <cyndis@kapsi.fi>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Mikko Perttunen <mperttunen@nvidia.com>, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org
Subject: [PATCH] gpu: host1x: Skip reset assert on Tegra186
Date: Wed, 14 Feb 2024 13:40:49 +0200
Message-ID: <20240214114049.1421463-1-cyndis@kapsi.fi>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 91.158.25.70
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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

From: Mikko Perttunen <mperttunen@nvidia.com>

On Tegra186, other software components may rely on the kernel to
keep Host1x operational even during suspend. As such, as a quirk,
skip asserting Host1x's reset on Tegra186.

We don't need to keep the clocks enabled, as BPMP ensures the clock
stays on while Host1x is being used. On newer SoC's, the reset line
is inaccessible, so there is no need for the quirk.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/host1x/dev.c | 15 +++++++++------
 drivers/gpu/host1x/dev.h |  1 +
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
index 42fd504abbcd..89983d7d73ca 100644
--- a/drivers/gpu/host1x/dev.c
+++ b/drivers/gpu/host1x/dev.c
@@ -169,6 +169,7 @@ static const struct host1x_info host1x06_info = {
 	.num_sid_entries = ARRAY_SIZE(tegra186_sid_table),
 	.sid_table = tegra186_sid_table,
 	.reserve_vblank_syncpts = false,
+	.skip_reset_assert = true,
 };
 
 static const struct host1x_sid_entry tegra194_sid_table[] = {
@@ -680,13 +681,15 @@ static int __maybe_unused host1x_runtime_suspend(struct device *dev)
 	host1x_intr_stop(host);
 	host1x_syncpt_save(host);
 
-	err = reset_control_bulk_assert(host->nresets, host->resets);
-	if (err) {
-		dev_err(dev, "failed to assert reset: %d\n", err);
-		goto resume_host1x;
-	}
+	if (!host->info->skip_reset_assert) {
+		err = reset_control_bulk_assert(host->nresets, host->resets);
+		if (err) {
+			dev_err(dev, "failed to assert reset: %d\n", err);
+			goto resume_host1x;
+		}
 
-	usleep_range(1000, 2000);
+		usleep_range(1000, 2000);
+	}
 
 	clk_disable_unprepare(host->clk);
 	reset_control_bulk_release(host->nresets, host->resets);
diff --git a/drivers/gpu/host1x/dev.h b/drivers/gpu/host1x/dev.h
index c8e302de7625..9c13e71a31ff 100644
--- a/drivers/gpu/host1x/dev.h
+++ b/drivers/gpu/host1x/dev.h
@@ -116,6 +116,7 @@ struct host1x_info {
 	 * the display driver disables VBLANK increments.
 	 */
 	bool reserve_vblank_syncpts;
+	bool skip_reset_assert;
 };
 
 struct host1x {
-- 
2.42.0

