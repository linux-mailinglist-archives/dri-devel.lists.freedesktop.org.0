Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B40485EE68
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 02:05:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B40410E842;
	Thu, 22 Feb 2024 01:05:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=kapsi.fi header.i=@kapsi.fi header.b="b2VrQJjM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5669610E844
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 01:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jFf0u+hJrnn5Kjqs9MiLK+d7fXYO2IAajVrZzed6+3s=; b=b2VrQJjM5vT1/umqw8vahCnSnM
 +cHV6YFz3pWZwDj0na2LK3l44XqbeotNP4rBAC0A2cGJsv3GJ2OCQMZr/l7R/lpzsqzd+5pZ1d2t/
 84CnbvBIU+pAI1NyHqchomn7YfPe4j8L9XGcTdVaI9MjIL36ojHg943dRVJtiFjbY/KDSCxcP1qf+
 CTcwPnPC08iCaIp2m2PO1lGu0i8gJztlFNR1Y9SYL+mBBpMm1DEfXGwCHyL2hqyg8mVL5SBzNLNXa
 22DpfBH9wQ+jjXDegicLj+eGlM+quPZ/0vnf9khVaTQ5mwkjBcLurdqn98vT3bLEmvjayN4XikAvD
 GAY6efdg==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70]
 helo=toshino.localdomain) by mail.kapsi.fi with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <cyndis@kapsi.fi>) id 1rcxWj-00EL7a-0Q;
 Thu, 22 Feb 2024 03:05:29 +0200
From: Mikko Perttunen <cyndis@kapsi.fi>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Mikko Perttunen <mperttunen@nvidia.com>, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org
Subject: [PATCH] gpu: host1x: Skip reset assert on Tegra186
Date: Thu, 22 Feb 2024 03:05:16 +0200
Message-ID: <20240222010517.1573931-1-cyndis@kapsi.fi>
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

On Tegra186, secure world applications may need to access host1x
during suspend/resume, and rely on the kernel to keep Host1x out
of reset during the suspend cycle. As such, as a quirk,
skip asserting Host1x's reset on Tegra186.

We don't need to keep the clocks enabled, as BPMP ensures the clock
stays on while Host1x is being used. On newer SoC's, the reset line
is inaccessible, so there is no need for the quirk.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/host1x/dev.c | 15 +++++++++------
 drivers/gpu/host1x/dev.h |  6 ++++++
 2 files changed, 15 insertions(+), 6 deletions(-)

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
index c8e302de7625..6143c2a61d70 100644
--- a/drivers/gpu/host1x/dev.h
+++ b/drivers/gpu/host1x/dev.h
@@ -116,6 +116,12 @@ struct host1x_info {
 	 * the display driver disables VBLANK increments.
 	 */
 	bool reserve_vblank_syncpts;
+	/*
+	 * On T186, secure world applications may require access to host1x
+	 * during suspend/resume. To allow this, we need to leave host1x
+	 * not in reset.
+	 */
+	bool skip_reset_assert;
 };
 
 struct host1x {
-- 
2.42.0

