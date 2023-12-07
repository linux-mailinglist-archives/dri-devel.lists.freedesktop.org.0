Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2308087A1
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 13:25:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D93810E885;
	Thu,  7 Dec 2023 12:24:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9832010E1BB
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 12:24:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id BAA13B82721;
 Thu,  7 Dec 2023 12:24:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DF1EC433C9;
 Thu,  7 Dec 2023 12:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701951891;
 bh=2ZR+kigljAxSl58nJM12epcTWpUT3EwzyZmGVK5BV0Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qgCn5Q3VA3LT1K6iXAET4r2lgCmTVbPKIgpsN5m7PXaAUE9G4hYeTM+yPGLxb/Gqh
 Y82JJg8TTayqXcZuAkUmmKr1H52LHNawylDl1lsx3yg/wAFxQX6aS72ksJ12QvGDd9
 bwRkogLyA4gczF6i4/JF0iIFQhkQyxlwjSaWIVBHfrwzTBcLoNt5RigCS4OlGryW52
 9vCOoVVStP4YTHZFRwUsV/FfzYqutXQop4oGH1YcY4sR/ozD3lKll667ShU/dvIUoa
 yL7Atea3P2aNtfvOzLcLQz5010Moto/bkqI9dU7VE/36L7/q7D0D19ISrL9QkEpk1a
 BhOyj+G4EpuHw==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] accel/habanalabs/gaudi2: add zero padding when printing
 QM CP instruction
Date: Thu,  7 Dec 2023 14:24:41 +0200
Message-Id: <20231207122444.50512-2-ogabbay@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231207122444.50512-1-ogabbay@kernel.org>
References: <20231207122444.50512-1-ogabbay@kernel.org>
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

QM instructions are in multiples of 64 bits and the command type is in
the upper bits of first QWORD.
To make it clearer that an undefined command is due to a type of 0x0,
always print all 64 bits and add a zero padding if needed.

Signed-off-by: Tomer Tayar <ttayar@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/gaudi2/gaudi2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2.c b/drivers/accel/habanalabs/gaudi2/gaudi2.c
index bf537c2082cd..f81b57649b00 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2.c
@@ -7884,7 +7884,7 @@ static void handle_lower_qman_data_on_err(struct hl_device *hdev, u64 qman_base,
 	cp_current_inst = ((u64) hi) << 32 | lo;
 
 	dev_info(hdev->dev,
-		"LowerQM. %sCQ: {ptr %#llx, size %u}, CP: {instruction %#llx}\n",
+		"LowerQM. %sCQ: {ptr %#llx, size %u}, CP: {instruction %#018llx}\n",
 		is_arc_cq ? "ARC_" : "", cq_ptr, cq_ptr_size, cp_current_inst);
 
 	if (event_mask & HL_NOTIFIER_EVENT_UNDEFINED_OPCODE) {
-- 
2.34.1

