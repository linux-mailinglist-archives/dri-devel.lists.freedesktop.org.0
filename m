Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2CE5CBA598
	for <lists+dri-devel@lfdr.de>; Sat, 13 Dec 2025 06:45:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F82610E38C;
	Sat, 13 Dec 2025 05:45:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="puCa1Q7e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0B7F10E38C
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Dec 2025 05:45:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9D600600AA;
 Sat, 13 Dec 2025 05:45:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8849AC4CEF7;
 Sat, 13 Dec 2025 05:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765604719;
 bh=kJBvIJcMrvNA2tAiGawV0nPHf9vSeMDTSaRAA4uWsrM=;
 h=From:To:Cc:Subject:Date:From;
 b=puCa1Q7e+iYSvuQQC2wOOvxDISE1buTbD1+Y49VrI6IeTcLpYpLCKizg4/KjKYl+e
 9+Uds0mnJnMPcQznNmnPt+SgGmORhjaZYWOyhPPpzYz1aDNV2g1GuGDN4C7dsUyt2G
 f6MxPWZehtfcKfpz7pNIXTTV791eFQ/xEnOP6Aq3Nes/2loa+YADz2ubp8OMriEVMq
 GIJFdQMmyYyvFS9GBGKVX54N+4EdpvdqCNYPt+UoT6K15ooIjPK2ygIwOZqclkZkXW
 GQ1pkkfQ8U2k7x4bA+hM5jD3PexR6FRterRFMoQzUZvtNfWzwwhQ2tI7oZ7/VOF3sm
 GNQPe/DXEaCYA==
From: "Mario Limonciello (AMD)" <superm1@kernel.org>
To: mario.limonciello@amd.com, mamin506@gmail.com, lizhi.hou@amd.com,
 ogabbay@kernel.org
Cc: "Mario Limonciello (AMD)" <superm1@kernel.org>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] accel/amdxdna: Block running under a hypervisor
Date: Fri, 12 Dec 2025 23:44:47 -0600
Message-ID: <20251213054513.87925-1-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
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

SVA support is required, which isn't configured by hypervisor
solutions.

Closes: https://github.com/QubesOS/qubes-issues/issues/10275
Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4656
Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
---
 drivers/accel/amdxdna/aie2_pci.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/aie2_pci.c
index ceef1c502e9e2..d892b412e4c0e 100644
--- a/drivers/accel/amdxdna/aie2_pci.c
+++ b/drivers/accel/amdxdna/aie2_pci.c
@@ -17,6 +17,7 @@
 #include <linux/iopoll.h>
 #include <linux/pci.h>
 #include <linux/xarray.h>
+#include <asm/hypervisor.h>
 
 #include "aie2_msg_priv.h"
 #include "aie2_pci.h"
@@ -508,6 +509,11 @@ static int aie2_init(struct amdxdna_dev *xdna)
 	unsigned long bars = 0;
 	int i, nvec, ret;
 
+	if (!hypervisor_is_type(X86_HYPER_NATIVE)) {
+		XDNA_ERR(xdna, "Running under hypervisor not supported");
+		return -EINVAL;
+	}
+
 	ndev = drmm_kzalloc(&xdna->ddev, sizeof(*ndev), GFP_KERNEL);
 	if (!ndev)
 		return -ENOMEM;
-- 
2.43.0

