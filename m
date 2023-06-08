Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D47728188
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 15:39:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15EB110E5C4;
	Thu,  8 Jun 2023 13:39:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABA3A10E5C1
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jun 2023 13:39:03 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 317B4615C6;
 Thu,  8 Jun 2023 13:39:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BE1DC4339B;
 Thu,  8 Jun 2023 13:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686231542;
 bh=7o/jqd3nYTliX8pgqNtbexstuTkFQBMWs/7P4HxDNOU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iuna0RxBdUBRq45+ePC27905+GSw57mf24Darnrp8DTNgZG03iKVeCa8c8XlpJTc+
 rRLw1LtUDLzS7+zPGRe/wtc4oIJj2Q48Glx4SAOXhZsdNY86buZR+bViZEpL2MmmVV
 1HbBM0DRV5mDpoTaCF+LhY+DHvUvknMlT5yYNObmwXG2iv0nKrwiaUciPhl2JKMwEG
 7D0qDPanM5hlhc2e4SsFFWVKE/21ycMFP/31w05p7lNX6HLtZY9z1YJw/t0l1JAosn
 mrIXA9ehQr3gvwkMvPmnYUQF8kSyHLojwKikquwmmJoMmxoqCiaubpBpzSh3mTfU/a
 /Dwla0kyGrZvg==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 06/12] accel/habanalabs: set device status 'malfunction' while
 in rmmod
Date: Thu,  8 Jun 2023 16:38:43 +0300
Message-Id: <20230608133849.2739411-6-ogabbay@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230608133849.2739411-1-ogabbay@kernel.org>
References: <20230608133849.2739411-1-ogabbay@kernel.org>
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
Cc: Koby Elbaz <kelbaz@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Koby Elbaz <kelbaz@habana.ai>

hl_device_status() returns the status of an acquired device.
If a device is going down (following an rmmod cmd),
it should be marked as an unusable/malfunctioning device, and
hence should not be acquired.
However, since this was not the case so far (i.e., a device going
down would inaccurately return 'in reset' status allowing the user
to acquire the device) it introduced a bug where as part of a reset
flow, the driver could not kill processes that have not run yet, and
since those processes aren't blocked from reacquiring a device,
we get eventually a new flow of a driver attempting to kill all
processes in a list that can't be ever really empty.

Signed-off-by: Koby Elbaz <kelbaz@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/device.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/habanalabs/common/device.c b/drivers/accel/habanalabs/common/device.c
index 993305871292..5973e4d64e19 100644
--- a/drivers/accel/habanalabs/common/device.c
+++ b/drivers/accel/habanalabs/common/device.c
@@ -315,7 +315,9 @@ enum hl_device_status hl_device_status(struct hl_device *hdev)
 {
 	enum hl_device_status status;
 
-	if (hdev->reset_info.in_reset) {
+	if (hdev->device_fini_pending) {
+		status = HL_DEVICE_STATUS_MALFUNCTION;
+	} else if (hdev->reset_info.in_reset) {
 		if (hdev->reset_info.in_compute_reset)
 			status = HL_DEVICE_STATUS_IN_RESET_AFTER_DEVICE_RELEASE;
 		else
@@ -343,9 +345,9 @@ bool hl_device_operational(struct hl_device *hdev,
 		*status = current_status;
 
 	switch (current_status) {
+	case HL_DEVICE_STATUS_MALFUNCTION:
 	case HL_DEVICE_STATUS_IN_RESET:
 	case HL_DEVICE_STATUS_IN_RESET_AFTER_DEVICE_RELEASE:
-	case HL_DEVICE_STATUS_MALFUNCTION:
 	case HL_DEVICE_STATUS_NEEDS_RESET:
 		return false;
 	case HL_DEVICE_STATUS_OPERATIONAL:
-- 
2.40.1

