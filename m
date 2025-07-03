Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD8DAF801D
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 20:35:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDB4F10E8C0;
	Thu,  3 Jul 2025 18:34:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dh14DThc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6581810E8C2
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jul 2025 18:34:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 7B3A561454;
 Thu,  3 Jul 2025 18:34:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FC2AC4CEF1;
 Thu,  3 Jul 2025 18:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751567697;
 bh=ddJR3g0DV3NYq/GCtOKJsDzPchINn9NuvOh3PYb40VM=;
 h=From:To:Cc:Subject:Date:From;
 b=dh14DThcxzPcGCkaUf/KmJZB8nPRrBPA7/kM3zkQJMKWNyixu+r1jcOs+pTvad3Cd
 qAKBclM5ak3+ocK4oVw65IrfQY7+s98z1blgQs/fMaGtdTogNbs/dYmsrCqam0JJpZ
 Nb736EZUdJWeWPS6VRdLx85iPM+ZuoxcIUxCs0511FByEaWAau8MPswTCFWPo/47rL
 vRRGEVXlHAPdcsCFCucHfcDJk6sPvVtH4ddQaXwRi+E6MvGPqRtZzoiNRC3pZRKtSH
 DjuYtBKVmigvW857+yeU1VTRbAroOFHC7Rhu9dcupXw7tYolbaZHSh/aHZqAl6sHlR
 7a1h5ulglWS5w==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>,
 Amol Maheshwari <amahesh@qti.qualcomm.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] misc: fastrpc: Use of_reserved_mem_region_to_resource() for
 "memory-region"
Date: Thu,  3 Jul 2025 13:34:54 -0500
Message-ID: <20250703183455.2074215-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
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

Use the newly added of_reserved_mem_region_to_resource() function to
handle "memory-region" properties.

The error handling is a bit different. "memory-region" is optional, so
failed lookup is not an error. But then an error in
of_reserved_mem_lookup() is treated as an error. However, that
distinction is not really important. Either the region is available
and usable or it is not. So now, it is just
of_reserved_mem_region_to_resource() which is checked for an error.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/misc/fastrpc.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 378923594f02..53e88a1bc430 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -2262,8 +2262,6 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 	int i, err, domain_id = -1, vmcount;
 	const char *domain;
 	bool secure_dsp;
-	struct device_node *rmem_node;
-	struct reserved_mem *rmem;
 	unsigned int vmids[FASTRPC_MAX_VMIDS];
 
 	err = of_property_read_string(rdev->of_node, "label", &domain);
@@ -2306,20 +2304,17 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 		}
 	}
 
-	rmem_node = of_parse_phandle(rdev->of_node, "memory-region", 0);
-	if (domain_id == SDSP_DOMAIN_ID && rmem_node) {
+	if (domain_id == SDSP_DOMAIN_ID) {
+		struct resource res;
 		u64 src_perms;
 
-		rmem = of_reserved_mem_lookup(rmem_node);
-		if (!rmem) {
-			err = -EINVAL;
-			goto err_free_data;
-		}
+		err = of_reserved_mem_region_to_resource(rdev->of_node, 0, &res);
+		if (!err) {
+			src_perms = BIT(QCOM_SCM_VMID_HLOS);
 
-		src_perms = BIT(QCOM_SCM_VMID_HLOS);
-
-		qcom_scm_assign_mem(rmem->base, rmem->size, &src_perms,
+			qcom_scm_assign_mem(res.start, resource_size(&res), &src_perms,
 				    data->vmperms, data->vmcount);
+		}
 
 	}
 
-- 
2.47.2

