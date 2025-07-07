Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2F9AFB9FD
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 19:37:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 475D510E165;
	Mon,  7 Jul 2025 17:37:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nVmmyqSK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F44410E165
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jul 2025 17:37:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 611266000A;
 Mon,  7 Jul 2025 17:37:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D438AC4CEE3;
 Mon,  7 Jul 2025 17:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751909845;
 bh=DqKcMIorC/sbLXH53847ITy45QbfQ/oNfAUkFfWyEOM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nVmmyqSKlvWBb28bZAs5DmiR9Vy4ptHDj/KWt6zdhntakT2lbMREeIfjrHP97rdvH
 mjb72JgHq1jEG9F0+S45GvVXqhYXfguRVayiMNXmgCbLoFFVYRTG/ZsnlZj7Q0AeK/
 8er7DH66Zuptvz6fTcyVeLddIYq58JFTve+T/vRkTe0V/fWO2tRieyZtp1peihimyP
 iDCvrYsqgq84sI9u3SjR9ai2zcEUsfsHxDU/ll00KT6vESxKvf79Rm1WpJOxDFyaZk
 xSb+myi80lp4xwLeJ4v0fobE7xZuGjJOLsm60uyzq6ZGKlfrboCsGslksJXzrhPGXp
 hfCxStpzy5krQ==
From: Hans de Goede <hansg@kernel.org>
To: David Airlie <airlied@linux.ie>
Cc: Hans de Goede <hansg@kernel.org>, Lukas Wunner <lukas@wunner.de>,
 Andi Kleen <ak@linux.intel.com>, dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] agp/amd64: Change agp_try_unsupported default to 0
Date: Mon,  7 Jul 2025 19:37:09 +0200
Message-ID: <20250707173710.313701-3-hansg@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250707173710.313701-1-hansg@kernel.org>
References: <20250707173710.313701-1-hansg@kernel.org>
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

AMD64 boards with AGP support are so old that the agp_amd64_pci_table
should be complete and there is no need to probe unlisted PCI devices
by default.

This also brings the driver inline with the global agp=try_unsupported
(agp_try_unsupported_boot) parameter which also default to 0 and brings
things inline with the Kconfig which says that agp_try_unsupported=1
should be passed to try unsupported bridges.

Suggested-by: Lukas Wunner <lukas@wunner.de>
Signed-off-by: Hans de Goede <hansg@kernel.org>
---
 drivers/char/agp/amd64-agp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/char/agp/amd64-agp.c b/drivers/char/agp/amd64-agp.c
index 2505df1f4e69..f883c06b538a 100644
--- a/drivers/char/agp/amd64-agp.c
+++ b/drivers/char/agp/amd64-agp.c
@@ -34,7 +34,7 @@
 #define ULI_X86_64_ENU_SCR_REG		0x54
 
 static struct resource *aperture_resource;
-static bool __initdata agp_try_unsupported = 1;
+static bool agp_try_unsupported __initdata;
 static int agp_bridges_found;
 
 static void amd64_tlbflush(struct agp_memory *temp)
-- 
2.49.0

