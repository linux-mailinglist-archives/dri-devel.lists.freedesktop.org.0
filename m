Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E0D7A4B14
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 16:32:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D84610E2A8;
	Mon, 18 Sep 2023 14:32:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9288A10E289
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 14:32:23 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id ED1C5CE0FEA;
 Mon, 18 Sep 2023 14:32:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3692FC32789;
 Mon, 18 Sep 2023 14:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695047538;
 bh=YMXU418eyrpH/EuRlc9SrcB0SbdT9/4ds3DNyrVCxH4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=n3rAifWa3IozPiJUk6DWlVyF2Uk+kX9bmM7Z8JPQq7BAN9Z2Qz+e2+j7/wNWoNRro
 m/tyfGkNQwcE56GkS+0IcJGRxon2PM0maScIMN0cEb3tCVy24nsDCLLLf+KikrujAP
 +GFz9Z/VXv4/IOVMSB8Wju5gtpQ7BP6+9jHrKK/5EEB5fablCjkexGNwtJQnv8B0jK
 qyF+wmtofCMVsV8ZqqWyt87CNrNzBNzPGu8nkvx4lZdb/6yJdwIW2EvKfSA4g9laF8
 G0l59CEupBxbSgjih043d1FbsDEFXHCVp8G/MlDCWwR9cfTtMbkxEWIFCRHk6NDrLP
 bop/6PQ3PN60A==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 10/10] accel/habanalabs: update boot status print
Date: Mon, 18 Sep 2023 17:31:58 +0300
Message-Id: <20230918143158.903207-10-ogabbay@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230918143158.903207-1-ogabbay@kernel.org>
References: <20230918143158.903207-1-ogabbay@kernel.org>
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
Cc: Ariel Suller <asuller@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ariel Suller <asuller@habana.ai>

FW shutdown preparation status was added to spec.

Signed-off-by: Ariel Suller <asuller@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/firmware_if.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/accel/habanalabs/common/firmware_if.c b/drivers/accel/habanalabs/common/firmware_if.c
index 0fb360cca9cc..47e8384134aa 100644
--- a/drivers/accel/habanalabs/common/firmware_if.c
+++ b/drivers/accel/habanalabs/common/firmware_if.c
@@ -1464,6 +1464,10 @@ static void detect_cpu_boot_status(struct hl_device *hdev, u32 status)
 		dev_err(hdev->dev,
 			"Device boot progress - Stuck in preboot after security initialization\n");
 		break;
+	case CPU_BOOT_STATUS_FW_SHUTDOWN_PREP:
+		dev_err(hdev->dev,
+			"Device boot progress - Stuck in preparation for shutdown\n");
+		break;
 	default:
 		dev_err(hdev->dev,
 			"Device boot progress - Invalid or unexpected status code %d\n", status);
-- 
2.34.1

