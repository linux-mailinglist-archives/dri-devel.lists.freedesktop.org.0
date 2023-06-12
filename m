Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86CBF72C3AC
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jun 2023 14:07:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F4DA10E21A;
	Mon, 12 Jun 2023 12:07:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B37810E21E
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 12:07:43 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F0DAC6155B;
 Mon, 12 Jun 2023 12:07:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F57BC433D2;
 Mon, 12 Jun 2023 12:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686571661;
 bh=1HArObuFGQRPZl7sq94/064FEUcyqgBoXZSL7Itf610=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Rl5sSE+yFp2wIJrAFY+hJdd7r2Al39f0vbNkq/S0u26+RtTIuDt+7h+lsYwOaGgwP
 YWwH2t1jX1wVQ4nGb26KFq3Z+Iy/Gc6iGe46TVzrtsT+cCr0c2SWr2XDK05ZvCBXsn
 aay3VxTzn+T0YKIqJEfKF8smf/MnLzV14nZpngTe8SjOrz1zqyTRY/UlZQlgQ61koE
 CXvdn3SnrbIBd8lpleqxa+CQiembxzUS4yhcIeiN9KCsOqkRnS9IZniQC9gaOZfD+h
 ovuzY2rYJToHXGgPQP7X+423/J7qHQ+AQZO4NCMRlnqWOVGbK5b3zUX8ezAYBAj4Z1
 dFh0hDpo2yr6A==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] accel/habanalabs: dump temperature threshold boot error
Date: Mon, 12 Jun 2023 15:07:33 +0300
Message-Id: <20230612120733.3079507-3-ogabbay@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230612120733.3079507-1-ogabbay@kernel.org>
References: <20230612120733.3079507-1-ogabbay@kernel.org>
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
Cc: Ofir Bitton <obitton@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ofir Bitton <obitton@habana.ai>

Add dump of an error reported from f/w during boot time.
This error indicates a failure with setting temperature threshold.

Signed-off-by: Ofir Bitton <obitton@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/firmware_if.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/accel/habanalabs/common/firmware_if.c b/drivers/accel/habanalabs/common/firmware_if.c
index 370508e98854..c7da69dbfa0a 100644
--- a/drivers/accel/habanalabs/common/firmware_if.c
+++ b/drivers/accel/habanalabs/common/firmware_if.c
@@ -724,6 +724,11 @@ static bool fw_report_boot_dev0(struct hl_device *hdev, u32 err_val,
 		err_exists = true;
 	}
 
+	if (err_val & CPU_BOOT_ERR0_TMP_THRESH_INIT_FAIL) {
+		dev_err(hdev->dev, "Device boot error - Failed to set threshold for temperature sensor\n");
+		err_exists = true;
+	}
+
 	if (err_val & CPU_BOOT_ERR0_DEVICE_UNUSABLE_FAIL) {
 		/* Ignore this bit, don't prevent driver loading */
 		dev_dbg(hdev->dev, "device unusable status is set\n");
-- 
2.40.1

