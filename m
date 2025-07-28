Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D71B132A1
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jul 2025 02:15:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BE2510E323;
	Mon, 28 Jul 2025 00:15:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=iitb.ac.in header.i=@iitb.ac.in header.b="RPbTfdr5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp1.iitb.ac.in (smtpd7.iitb.ac.in [103.21.126.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DE4410E323
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 00:15:31 +0000 (UTC)
Received: from ldns2.iitb.ac.in (ldns2.iitb.ac.in [10.200.12.2])
 by smtp1.iitb.ac.in (Postfix) with SMTP id 5C8F5104C1CA
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 05:45:28 +0530 (IST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.iitb.ac.in 5C8F5104C1CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=iitb.ac.in; s=mail;
 t=1753661728; bh=5k8JYmHT2cWOWtGfELADGc92fbkTdz1tEljYzoDyHO0=;
 h=Date:From:To:Cc:Subject:From;
 b=RPbTfdr5ubQ/Ie0C5V9yg/krhtrN1zu2JngvovCUqM54zyAyv3uxoXkeQAfDD6hsX
 09w6G31zxeqAlxBucisd1MD8NCzSJyyC1b7PYQu0CgeO74OvG/AiTgiwa5sz0BVfPR
 fNfwKQ8TweWe07lsfBrtC0uOjEttlJoM17jhtWTU=
Received: (qmail 23478 invoked by uid 510); 28 Jul 2025 05:45:28 +0530
X-Qmail-Scanner-Diagnostics: from 10.200.1.25 by ldns2 (envelope-from
 <akhilesh@ee.iitb.ac.in>, uid 501) with qmail-scanner-2.11
 spamassassin: 3.4.1. mhr: 1.0. {clamdscan: 0.100.0/26337} 
 Clear:RC:1(10.200.1.25):SA:0(0.0/7.0):. Processed in 3.875186 secs;
 28 Jul 2025 05:45:28 +0530
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on ldns2.iitb.ac.in
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=7.0 tests=IITB_ORIG,PROPER_IITB_MSGID,
 URIBL_BLOCKED autolearn=disabled version=3.4.1
X-Spam-Pyzor: Reported 0 times.
X-Envelope-From: akhilesh@ee.iitb.ac.in
X-Qmail-Scanner-Mime-Attachments: |
X-Qmail-Scanner-Zip-Files: |
Received: from unknown (HELO ldns2.iitb.ac.in) (10.200.1.25)
 by ldns2.iitb.ac.in with SMTP; 28 Jul 2025 05:45:24 +0530
Received: from bhairav.ee.iitb.ac.in (bhairav.ee.iitb.ac.in [10.107.1.1])
 by ldns2.iitb.ac.in (Postfix) with ESMTP id D4A563414DD;
 Mon, 28 Jul 2025 05:45:23 +0530 (IST)
Received: from bhairav-test.ee.iitb.ac.in (bhairav.ee.iitb.ac.in [10.107.1.1])
 (Authenticated sender: akhilesh)
 by bhairav.ee.iitb.ac.in (Postfix) with ESMTPSA id AA8EA1E8128E;
 Mon, 28 Jul 2025 05:45:23 +0530 (IST)
Date: Mon, 28 Jul 2025 05:45:17 +0530
From: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
To: thierry.reding@gmail.com, mperttunen@nvidia.com, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, akhileshpatilvnit@gmail.com,
 skhan@linuxfoundation.org
Subject: [PATCH] gpu: host1x: use dev_err_probe() in probe path
Message-ID: <aIbBFQqgZalOMc6r@bhairav-test.ee.iitb.ac.in>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Use dev_err_probe() helper as recommended by core driver model in
drivers/base/core.c to handle deferred probe error. Improve code
consistency and debuggability using standard helper.

Signed-off-by: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
---
 drivers/gpu/host1x/dev.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
index 1f93e5e276c0..e6f3cbeb9ae5 100644
--- a/drivers/gpu/host1x/dev.c
+++ b/drivers/gpu/host1x/dev.c
@@ -587,11 +587,7 @@ static int host1x_probe(struct platform_device *pdev)
 	host->clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(host->clk)) {
 		err = PTR_ERR(host->clk);
-
-		if (err != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "failed to get clock: %d\n", err);
-
-		return err;
+		return dev_err_probe(&pdev->dev, err, "failed to get clock: %d\n", err);
 	}
 
 	err = host1x_get_resets(host);
-- 
2.34.1

