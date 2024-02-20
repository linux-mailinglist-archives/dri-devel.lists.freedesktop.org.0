Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F2185C08B
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 17:02:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68C6E10E4D5;
	Tue, 20 Feb 2024 16:02:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JBoVchCP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EB9510E4D5
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 16:01:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A16CF611C5;
 Tue, 20 Feb 2024 16:01:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44A9AC43609;
 Tue, 20 Feb 2024 16:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708444909;
 bh=k9i5CDXCj2jRiO0gg1dwwa6YKSVNtiS35vfagBcjp8Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JBoVchCP4MT6g4IfPN3bwyot5hifA7r5ccdXoHkhwBFTpB9P2oDIElVyJIWtADYHh
 35X/e3UzPDJK+OrY0YJFkUBlYMvvxMKWpXplfMTZP4smcUaHVxiIMle0uD+uod513a
 HliA1XITBmBfh2Py7PfczK3TPTcIruohxXqoFiyJ1IrFSLSrd223DJCUfWEzQS+Szd
 yFIrOL6SBq/1aEWViZYzKFY1ge2/jmfq+qFC8ZeVLFkKZKDf72YiNGUP3nQ+Ivqc7F
 yfQnIpLqeIaWIwbPvETHhOTzw0Wd9hhIrcnbwRkDE+AFyw2746NzfXuHmLrSVVAMNs
 pkyT6jlQpZlyA==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: Ofir Bitton <obitton@habana.ai>
Subject: [PATCH 10/13] accel/habanalabs/hwmon: rate limit errors user can
 generate
Date: Tue, 20 Feb 2024 18:01:26 +0200
Message-Id: <20240220160129.909714-10-ogabbay@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240220160129.909714-1-ogabbay@kernel.org>
References: <20240220160129.909714-1-ogabbay@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ofir Bitton <obitton@habana.ai>

Fetching sensor data can fail due to various reasons. In order
not to pollute the kernel log, those error prints must be
rate limited.

Signed-off-by: Ofir Bitton <obitton@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/hwmon.c | 29 +++++++++++++------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/accel/habanalabs/common/hwmon.c b/drivers/accel/habanalabs/common/hwmon.c
index 1ee2ee07e9ed..36b951b5f503 100644
--- a/drivers/accel/habanalabs/common/hwmon.c
+++ b/drivers/accel/habanalabs/common/hwmon.c
@@ -46,7 +46,7 @@ static u32 fixup_flags_legacy_fw(struct hl_device *hdev, enum hwmon_sensor_types
 		break;
 
 	default:
-		dev_err(hdev->dev, "unsupported h/w sensor type %d\n", type);
+		dev_err_ratelimited(hdev->dev, "unsupported h/w sensor type %d\n", type);
 		flags = cpucp_flags;
 		break;
 	}
@@ -134,7 +134,7 @@ static u32 adjust_hwmon_flags(struct hl_device *hdev, enum hwmon_sensor_types ty
 			break;
 
 		default:
-			dev_err(hdev->dev, "unsupported h/w sensor type %d\n", type);
+			dev_err_ratelimited(hdev->dev, "unsupported h/w sensor type %d\n", type);
 			flags = cpucp_flags;
 			break;
 		}
@@ -162,7 +162,8 @@ int hl_build_hwmon_channel_info(struct hl_device *hdev, struct cpucp_sensor *sen
 			break;
 
 		if (type >= HWMON_NR_SENSOR_TYPES) {
-			dev_err(hdev->dev, "Got wrong sensor type %d from device\n", type);
+			dev_err_ratelimited(hdev->dev,
+				"Got wrong sensor type %d from device\n", type);
 			return -EINVAL;
 		}
 
@@ -584,7 +585,7 @@ int hl_get_temperature(struct hl_device *hdev,
 	*value = (long) result;
 
 	if (rc) {
-		dev_err(hdev->dev,
+		dev_err_ratelimited(hdev->dev,
 			"Failed to get temperature from sensor %d, error %d\n",
 			sensor_index, rc);
 		*value = 0;
@@ -611,7 +612,7 @@ int hl_set_temperature(struct hl_device *hdev,
 						0, NULL);
 
 	if (rc)
-		dev_err(hdev->dev,
+		dev_err_ratelimited(hdev->dev,
 			"Failed to set temperature of sensor %d, error %d\n",
 			sensor_index, rc);
 
@@ -638,7 +639,7 @@ int hl_get_voltage(struct hl_device *hdev,
 	*value = (long) result;
 
 	if (rc) {
-		dev_err(hdev->dev,
+		dev_err_ratelimited(hdev->dev,
 			"Failed to get voltage from sensor %d, error %d\n",
 			sensor_index, rc);
 		*value = 0;
@@ -667,7 +668,7 @@ int hl_get_current(struct hl_device *hdev,
 	*value = (long) result;
 
 	if (rc) {
-		dev_err(hdev->dev,
+		dev_err_ratelimited(hdev->dev,
 			"Failed to get current from sensor %d, error %d\n",
 			sensor_index, rc);
 		*value = 0;
@@ -696,7 +697,7 @@ int hl_get_fan_speed(struct hl_device *hdev,
 	*value = (long) result;
 
 	if (rc) {
-		dev_err(hdev->dev,
+		dev_err_ratelimited(hdev->dev,
 			"Failed to get fan speed from sensor %d, error %d\n",
 			sensor_index, rc);
 		*value = 0;
@@ -725,7 +726,7 @@ int hl_get_pwm_info(struct hl_device *hdev,
 	*value = (long) result;
 
 	if (rc) {
-		dev_err(hdev->dev,
+		dev_err_ratelimited(hdev->dev,
 			"Failed to get pwm info from sensor %d, error %d\n",
 			sensor_index, rc);
 		*value = 0;
@@ -752,7 +753,7 @@ void hl_set_pwm_info(struct hl_device *hdev, int sensor_index, u32 attr,
 						0, NULL);
 
 	if (rc)
-		dev_err(hdev->dev,
+		dev_err_ratelimited(hdev->dev,
 			"Failed to set pwm info to sensor %d, error %d\n",
 			sensor_index, rc);
 }
@@ -775,7 +776,7 @@ int hl_set_voltage(struct hl_device *hdev,
 						0, NULL);
 
 	if (rc)
-		dev_err(hdev->dev,
+		dev_err_ratelimited(hdev->dev,
 			"Failed to set voltage of sensor %d, error %d\n",
 			sensor_index, rc);
 
@@ -800,7 +801,7 @@ int hl_set_current(struct hl_device *hdev,
 						0, NULL);
 
 	if (rc)
-		dev_err(hdev->dev,
+		dev_err_ratelimited(hdev->dev,
 			"Failed to set current of sensor %d, error %d\n",
 			sensor_index, rc);
 
@@ -831,7 +832,7 @@ int hl_set_power(struct hl_device *hdev,
 						0, NULL);
 
 	if (rc)
-		dev_err(hdev->dev,
+		dev_err_ratelimited(hdev->dev,
 			"Failed to set power of sensor %d, error %d\n",
 			sensor_index, rc);
 
@@ -858,7 +859,7 @@ int hl_get_power(struct hl_device *hdev,
 	*value = (long) result;
 
 	if (rc) {
-		dev_err(hdev->dev,
+		dev_err_ratelimited(hdev->dev,
 			"Failed to get power of sensor %d, error %d\n",
 			sensor_index, rc);
 		*value = 0;
-- 
2.34.1

