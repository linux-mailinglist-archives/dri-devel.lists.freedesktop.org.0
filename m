Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA767AE7A4
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 10:14:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9061B10E369;
	Tue, 26 Sep 2023 08:14:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C83A910E0D0
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Sep 2023 08:13:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2FDE661337
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Sep 2023 08:13:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55A11C433C8;
 Tue, 26 Sep 2023 08:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695716037;
 bh=c2byi9VLht35+07GvYDKXq5iwgVqSZPYJVjeHGyVh5I=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=t29FIkWIvtQkJlTnlokSQ+55bAIH6AKaaMbKlt71yrSEBsjX10+d4hpCCv8/pnIXU
 gkYXDtOceKN9Cs0ijf5ILs+jgT0+TIUM2HTqbcvBtIAjmsRK83g6PwRxMX5OYa9qh3
 mp9LdYSGGPJP2TLncpK/Snzb3n6kajL2C29tgSxh3SZ90MT4eNZ7RfC7TQ/T0zsddR
 hW56SNlnH6awedCxgRk+Ei/pX+ZUVZuuU6HwujS74bmDaiGtKoekWrtkk+fqQm83gf
 V5IN1497w3iy/cR28F6BnSRWz+DbVVumTosI97g32/nkg5PGnJWNa5vEys1KdsZ96+
 ok6eilu97NOYA==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/9] accel/habanalabs: print device name when it is removed
Date: Tue, 26 Sep 2023 11:13:42 +0300
Message-Id: <20230926081345.240927-6-ogabbay@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230926081345.240927-1-ogabbay@kernel.org>
References: <20230926081345.240927-1-ogabbay@kernel.org>
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

Notifies the user which device was removed. It is important in
a server with multiple devices.

Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/habanalabs/common/device.c b/drivers/accel/habanalabs/common/device.c
index b1d330cd2537..9711e8fc979d 100644
--- a/drivers/accel/habanalabs/common/device.c
+++ b/drivers/accel/habanalabs/common/device.c
@@ -2420,7 +2420,7 @@ void hl_device_fini(struct hl_device *hdev)
 	u64 reset_sec;
 	int i, rc;
 
-	dev_info(hdev->dev, "Removing device\n");
+	dev_info(hdev->dev, "Removing device %s\n", dev_name(&(hdev)->pdev->dev));
 
 	hdev->device_fini_pending = 1;
 	flush_delayed_work(&hdev->device_reset_work.reset_work);
-- 
2.34.1

