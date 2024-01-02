Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0689B821E4F
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jan 2024 16:07:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F037E10E1D7;
	Tue,  2 Jan 2024 15:07:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBD5810E1D8
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jan 2024 15:07:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id A2058B80DD8;
 Tue,  2 Jan 2024 15:07:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38FA2C433C9;
 Tue,  2 Jan 2024 15:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1704208029;
 bh=8W1aookR1BcvR/0gXIR7y7VRCd9tBn4MkxLxXyNZgJs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KP1U0QKObEFiNMkX3FGzm2UxsHn/uU05/ePalYvzSZ7YucStUmiOsGh7gw8A03mp+
 i4Y2X9Qto03hggabk2/UiA0RgME3yeAcVm8wnGRpcPz+kpBEubtP6tqdcaQunpbgZx
 V1KYlAZPDom3hrgQgvUPfa693RmUuKE5fYXtUcY1F4AdaW5axCtiIq/F5g3wsoHgaB
 H1GoMJglQ2SRVUSKU+7g5w5NvKJIPu0il6f6Qeg5t6LWLY8OFlK3ucyG2jUJDyArZ/
 c2aKJR7qN5RdpwYyA/dIDawiXjPKgOBui7Pff4DxBMXS4fraILosRSV2jPzIitf/E5
 SoOWo5BeBfa7w==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/6] accel/habanalabs: abort device reset for consecutive
 heartbeat failures
Date: Tue,  2 Jan 2024 17:06:54 +0200
Message-Id: <20240102150654.522555-6-ogabbay@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240102150654.522555-1-ogabbay@kernel.org>
References: <20240102150654.522555-1-ogabbay@kernel.org>
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
Cc: Tomer Tayar <ttayar@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tomer Tayar <ttayar@habana.ai>

The mechanism of aborting device reset for consecutive fatal errors is
currently only for fatal errors that are reported by FW.
A non-responsive FW and consecutive heartbeat failures is also
considered fatal, so add them as well to this mechanism to avoid
recurring device reset in such a case.

Signed-off-by: Tomer Tayar <ttayar@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/device.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/accel/habanalabs/common/device.c b/drivers/accel/habanalabs/common/device.c
index 15891de6cf39..581fc99ad89b 100644
--- a/drivers/accel/habanalabs/common/device.c
+++ b/drivers/accel/habanalabs/common/device.c
@@ -1769,14 +1769,16 @@ int hl_device_reset(struct hl_device *hdev, u32 flags)
 		hdev->device_cpu_disabled = false;
 		hdev->reset_info.hard_reset_pending = false;
 
+		/*
+		 * Put the device in an unusable state if there are 2 back to back resets due to
+		 * fatal errors.
+		 */
 		if (hdev->reset_info.reset_trigger_repeated &&
-				(hdev->reset_info.prev_reset_trigger ==
-						HL_DRV_RESET_FW_FATAL_ERR)) {
-			/* if there 2 back to back resets from FW,
-			 * ensure driver puts the driver in a unusable state
-			 */
+				(hdev->reset_info.prev_reset_trigger == HL_DRV_RESET_FW_FATAL_ERR ||
+						hdev->reset_info.prev_reset_trigger ==
+								HL_DRV_RESET_HEARTBEAT)) {
 			dev_crit(hdev->dev,
-				"%s Consecutive FW fatal errors received, stopping hard reset\n",
+				"%s Consecutive fatal errors, stopping hard reset\n",
 				dev_name(&(hdev)->pdev->dev));
 			rc = -EIO;
 			goto out_err;
-- 
2.34.1

