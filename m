Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QGvPDMZgi2nDUAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 17:45:58 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6987611D641
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 17:45:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B41910E199;
	Tue, 10 Feb 2026 16:45:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="1Wlh1bjg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010028.outbound.protection.outlook.com [52.101.46.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8854610E199
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 16:45:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FeVCIpnlSZsAD3vdGRZ0PCHgJYlqvfHbkgAl9BhZf4+dbNlUMEKY/gLUdfioc/ZC78C3QNTtRf7UzfzY0hGt01VOmnOd5md7+CvAcMBWJN2ulV7bSP6uk3rNtEq1n/CQ7G9v9ZSYWAnhojaQTDAql9REHx/BruK70L3jIgDFPiP0wMGcX33xUpyEIXA3+p2u4yr2263JNjrbQ5XMo4uoKuyp3+piWyPq1/GsLV9pBr5RXShkSaPyGj4YBm/ORtDVkVOPe6l1n9FF4RogbOMwJC7fZhk+2UqiSKPiOgTE0YKHsBZ8GiBCVxKUVMMtSEwXa3B883eo1CUAgIIdDxNXzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F1XHsjJQwShIG9KqmYLg0b2usJicI2wGUDQW7xitSxI=;
 b=H39hlfBTpXA3x6t2jisdwzZ9GdAnJ7HiLNqY40zzSOV7FOTnvT7tgXNUvz+MnWoTKPZc05tGRhc7AObHkXrPFsLsuD16zCuCqbWDZ2Kau/PUUczKCp5DO4e0Oj9LOLHMojg7JFFo5rXd5jBPl575WzbqPxHPncJmskS+1k3o/9vuqWZBCzREbTOJzA3Mg2SBd3HKftO56ROzcgb8jINIm5fbcIhs8wqT3wPEX6yRXvYVYfq+A28KPMDyBeB70WKcCtTQXWpYbyb9f80xIQqPkB5x0Zf9jV3QQVuCOjWO73zrQKDA4v4iB6Awl+eYJenMw8+fPHG7KGMWOLdY/w07aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F1XHsjJQwShIG9KqmYLg0b2usJicI2wGUDQW7xitSxI=;
 b=1Wlh1bjgdGbLd5YShcASZDsF8EOM/jIjotgSC2qCTH30pHR/GRpo3YfArQg3zKuV4J5TAwCeNyb7VMxocje7Do9x5Rk7xvSkVnpHI7N0JaA1ucvLxj2dfnnh7GPnsJKCwR98Fk1GWXpaO5NmVuxpI+pddl1mgVVc3Ov6pleFUfw=
Received: from SN6PR16CA0042.namprd16.prod.outlook.com (2603:10b6:805:ca::19)
 by DM6PR12MB4268.namprd12.prod.outlook.com (2603:10b6:5:223::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.8; Tue, 10 Feb
 2026 16:45:51 +0000
Received: from SA2PEPF00003F62.namprd04.prod.outlook.com
 (2603:10b6:805:ca:cafe::37) by SN6PR16CA0042.outlook.office365.com
 (2603:10b6:805:ca::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.8 via Frontend Transport; Tue,
 10 Feb 2026 16:45:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF00003F62.mail.protection.outlook.com (10.167.248.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Tue, 10 Feb 2026 16:45:51 +0000
Received: from dogwood-dvt-marlim.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 10 Feb 2026 10:45:46 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: <mario.limonciello@amd.com>, <lizhi.hou@amd.com>, <mamin506@gmail.com>,
 <ogabbay@kernel.org>, <superm1@kernel.org>
CC: <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/2] accel/amdxdna: Fix NULL pointer dereference in mailbox
 channel cleanup
Date: Tue, 10 Feb 2026 10:42:50 -0600
Message-ID: <20260210164521.1094274-2-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260210164521.1094274-1-mario.limonciello@amd.com>
References: <20260210164521.1094274-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F62:EE_|DM6PR12MB4268:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f3f654f-ad10-4ff2-01fc-08de68c3d9b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RlHORof+nHnqJ7iS5EiRMYia2OlEwEXH3xYn9Fa1EFY/9B7CwGTrvGJ/Cg17?=
 =?us-ascii?Q?yvQxVQrErGbCjne9TXzZ0PNppVMALzYY0wQbnbnr11d2Z8kLsVRO0sHrIi5e?=
 =?us-ascii?Q?e+FCvbQKsD+uk6rjLY4/UEHZBuC8HzhiHt9zZ2amEUkdvBuuSlfU60DeSjSQ?=
 =?us-ascii?Q?YZauue78JDFRmRK3eJht7QpkZ2Wp+gP2GKd2OY+WItTT1Smi/bnRCVVFWALg?=
 =?us-ascii?Q?soIF3Sj2c+LrYbm+G2EB0dZDKLnPiHT8c6ilv1fHGQd3lsA6BjVHCCCA3p2E?=
 =?us-ascii?Q?8VAilDLVtFvQqW/6EBMNW5uSC6Z/0FL5ObPAtTSEiuq+HTOozp5N5fQYxmcd?=
 =?us-ascii?Q?7EhsnMtgFgKfSEaNH6citBrIPMrWZPFwCBnfDyBTr78Y1lXQEPh0zeRg2d0X?=
 =?us-ascii?Q?OAgoEirFg5Nj82o3fQ0mR7IJus38KaC05USEnOUP4U8/Ih0r2IrnV+4HHVGI?=
 =?us-ascii?Q?AQkgCmvpVUSVg3Bm7FWhip/9ABGgmWMDouZwXxK0hDzzUoXUcJrdLAdE3lP9?=
 =?us-ascii?Q?WjLLYFVWooELmMauAKfvLmmcxgjDMkDKHNHVIuygN/F6yM+nsvFT/rwpnUyr?=
 =?us-ascii?Q?97uMAjfIjc0OAWrrBAoMBQZ9kDihG8EuhBr7h7243I5ELAQmh+E/lAvvuVAn?=
 =?us-ascii?Q?SzE8ZqmdgDxHjMdxBRXYkWqDFkK9GS+Tz3+vqRLKxuFOKObB/92qqW4Vwc3o?=
 =?us-ascii?Q?0V7tvxDBnxD4H96q6XoQyu/9LhQj2vgkqGU7GiglX1ZE/a75vBF+UnvOtFep?=
 =?us-ascii?Q?2ldlRHoHR7BOn/3H+oxsiVJsNq8bY9/UZmJZTzwo2x1N465UBbBkxGXzJxxV?=
 =?us-ascii?Q?YH0vqXjbSDNh4aV50ZcY/chtBC878OtPz5mtEunF6IkKb25/geE1hIeS4/Td?=
 =?us-ascii?Q?nkXsq9Ng+Uti1M85ewVPG8ASU3mlKm37JyarxGym0k/yebsygsp9Vm9bNme7?=
 =?us-ascii?Q?/P3dwkCapQxtlGS0ju5H8GmOaYhPP0fSr2q+bd2v28wlriTT924OqEXa6Mi3?=
 =?us-ascii?Q?wr25pTHsLzXK3HKRExlXzllz6ROOeu7Ed7fhOLR2nkxUlTUNi2QzaLn5bG9d?=
 =?us-ascii?Q?dR/PbtMEirzQRlSIH/VYUKCVtCi+aOOwyxjhXtc2LkSlaNyPNRfyKmHKcmeY?=
 =?us-ascii?Q?MgLWWkm6r+UEUg9l3L8s1cFM6qbSYEBMCQOAOIdeqnZ0gqbs4lk5gUXKPkjt?=
 =?us-ascii?Q?RUIslU5xqlWUDTg/JTl3znLvTvE3l5RFSjiuiar16sGEIj9cPV4wGDL6TbNX?=
 =?us-ascii?Q?vB3KIpW1wSaYFRsC8a2HmzHjxmronDbNNibDf8bk4VcthbIBGUKxytzeIFb+?=
 =?us-ascii?Q?BS2o52llzliGcp4m+0VU538Id4jqiY6CBCsgPnXFsXqyDDHNOAuMciomNDCt?=
 =?us-ascii?Q?usBIGoHp2MwyfLerAvsiffDLjkUC5tJvwRsRdtp4qIVABSDcrA7wzfFCOd0q?=
 =?us-ascii?Q?OrevutVgm+FRHwoy2ZG7makerzezK+UpO4a9eTWQkvipMm4qpBU+U3G+oDqV?=
 =?us-ascii?Q?arMKXeZupsfYF+znOczrn8wbmcyYqvcEGbUG5nGY43fVTuAUA1Lo02neXvRZ?=
 =?us-ascii?Q?4aUucHpEt4oZdLtL/bcJE7I37pR+tbd/QLZaAK455gwaE6oGEFr4tv8kr5o6?=
 =?us-ascii?Q?QFnqlmpaujdewPnuWpTxKhKVPb7HHOAW1c527DnlOLDVeYsaObYfDqbzFYg/?=
 =?us-ascii?Q?cwj/ng=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 4I39pKKVNQ0csBtXZhhBTIXKZ5iixMLR/TW8G31Ag9KsIjb61v3IB89NkxuBFAtqBUowPNPx6F11fw9lcwy2Iyzd46Ao2HSXgNSTPUclfumUrRTdWNsB34YmSIs6nmh3EGQZQE/szyNnMw3zM9HxYWBVEKeKm7zgmTZT0aKC2R4fZkrOD8wCk5B0Zaeu9XkK1Fob2oH0wHP/NqkmkeTwWbPnouhQH9NlUkJhAlpUWOi+oe6tD5QAcyyukPDpJ0/g38QEcRCioarWMafVvKMXcJ8j3PgAwiw6tnjGNmj8LugDweuMy12FxxdCh24tLaUFsVk6RUfa0v8oJOiYM5808M+ZRNXmBorvAit7zW3oq9ZCDMtZF7kKJkW3gm3yDOX7L7gJjs3V71yYXn3DM/o/TCOx794zlGQGQN5dvdgSGkAM/iHb4P71Du2V4HFPcWtD
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 16:45:51.2947 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f3f654f-ad10-4ff2-01fc-08de68c3d9b4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003F62.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4268
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mario.limonciello@amd.com,m:lizhi.hou@amd.com,m:mamin506@gmail.com,m:ogabbay@kernel.org,m:superm1@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,kernel.org];
	FORGED_SENDER(0.00)[mario.limonciello@amd.com,dri-devel-bounces@lists.freedesktop.org];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[mario.limonciello@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	TO_DN_NONE(0.00)[];
	HAS_XOIP(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:mid,amd.com:dkim,amd.com:email]
X-Rspamd-Queue-Id: 6987611D641
X-Rspamd-Action: no action

aie2_destroy_context() is called during various cleanup paths, including
when context creation fails partially. If xdna_mailbox_create_channel()
fails during aie2_create_context(), the hwctx->priv->mbox_chann pointer
remains NULL. When cleanup occurs (e.g., during process termination via
amdxdna_hwctx_remove_all), aie2_destroy_context() is invoked and attempts
to stop and destroy the NULL mailbox channel, leading to a NULL pointer
dereference.

The issue was observed in the following call path:
  amdxdna_drm_close
    amdxdna_hwctx_remove_all
      aie2_hwctx_fini
        aie2_release_resource
          aie2_destroy_context
            xdna_mailbox_stop_channel <- NULL dereference

Add NULL checks in aie2_destroy_context() before calling mailbox channel
operations. Also add defensive NULL checks in aie2_hw_stop() for both
mgmt_chann and mbox to prevent similar issues during device shutdown.

Fixes: 97f27573837e ("accel/amdxdna: Fix potential NULL pointer dereference in context cleanup")
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/accel/amdxdna/aie2_message.c | 14 +++++++++-----
 drivers/accel/amdxdna/aie2_pci.c     | 14 +++++++++-----
 2 files changed, 18 insertions(+), 10 deletions(-)

diff --git a/drivers/accel/amdxdna/aie2_message.c b/drivers/accel/amdxdna/aie2_message.c
index 7d7dcfeaf7942..77e3cdf18658b 100644
--- a/drivers/accel/amdxdna/aie2_message.c
+++ b/drivers/accel/amdxdna/aie2_message.c
@@ -318,11 +318,15 @@ int aie2_destroy_context(struct amdxdna_dev_hdl *ndev, struct amdxdna_hwctx *hwc
 	struct amdxdna_dev *xdna = ndev->xdna;
 	int ret;
 
-	xdna_mailbox_stop_channel(hwctx->priv->mbox_chann);
-	ret = aie2_destroy_context_req(ndev, hwctx->fw_ctx_id);
-	xdna_mailbox_destroy_channel(hwctx->priv->mbox_chann);
-	XDNA_DBG(xdna, "Destroyed fw ctx %d", hwctx->fw_ctx_id);
-	hwctx->priv->mbox_chann = NULL;
+	if (hwctx->priv->mbox_chann) {
+		xdna_mailbox_stop_channel(hwctx->priv->mbox_chann);
+		ret = aie2_destroy_context_req(ndev, hwctx->fw_ctx_id);
+		xdna_mailbox_destroy_channel(hwctx->priv->mbox_chann);
+		XDNA_DBG(xdna, "Destroyed fw ctx %d", hwctx->fw_ctx_id);
+		hwctx->priv->mbox_chann = NULL;
+	} else {
+		ret = aie2_destroy_context_req(ndev, hwctx->fw_ctx_id);
+	}
 	hwctx->fw_ctx_id = -1;
 	ndev->hwctx_num--;
 
diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/aie2_pci.c
index f70ccf0f3c019..9c2572706bf53 100644
--- a/drivers/accel/amdxdna/aie2_pci.c
+++ b/drivers/accel/amdxdna/aie2_pci.c
@@ -324,11 +324,15 @@ static void aie2_hw_stop(struct amdxdna_dev *xdna)
 	}
 
 	aie2_mgmt_fw_fini(ndev);
-	xdna_mailbox_stop_channel(ndev->mgmt_chann);
-	xdna_mailbox_destroy_channel(ndev->mgmt_chann);
-	ndev->mgmt_chann = NULL;
-	drmm_kfree(&xdna->ddev, ndev->mbox);
-	ndev->mbox = NULL;
+	if (ndev->mgmt_chann) {
+		xdna_mailbox_stop_channel(ndev->mgmt_chann);
+		xdna_mailbox_destroy_channel(ndev->mgmt_chann);
+		ndev->mgmt_chann = NULL;
+	}
+	if (ndev->mbox) {
+		drmm_kfree(&xdna->ddev, ndev->mbox);
+		ndev->mbox = NULL;
+	}
 	aie2_psp_stop(ndev->psp_hdl);
 	aie2_smu_fini(ndev);
 	aie2_error_async_events_free(ndev);
-- 
2.53.0

