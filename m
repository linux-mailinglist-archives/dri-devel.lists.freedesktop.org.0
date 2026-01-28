Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wO8VMCtXeWlIwgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 01:24:11 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5AA9BA37
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 01:24:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3221E10E0EB;
	Wed, 28 Jan 2026 00:24:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="maVcucA8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010022.outbound.protection.outlook.com
 [40.93.198.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0CC610E0EB
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 00:24:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b56PqMsj9se3lCWmPk0VqNJWR9KH8H6Z3wndRMiOch8oC3MEXHMdxHPxKSYZJRuE2V6rOVkeqH08lwSso0bgIdQm92ucjGZXJFZCohnxDvo/0N9FeOYGPs4sNZR5D6MvgBFxWlPMUfVwGmcMF8EAOUa6cYG2CJHRWrScfliSyT50khdwaESCsqmF3XH3hs3PJsNe2ymHwCwDNkpDhfk1GfRlr12EFYPC7xbmNLGegsnK0N8Y263XZUKPgn8n6/ivGwh36DyrMuYXTSOCURQ62M37TzCn6ijaMut/HUeJyF0Vuj3/4gx5FUo16LOhu4vnetY5907t2+08nL/XzbxQcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=37gDY//ploPVJ43mOdncxSIlqX4Uy+5EVZcvFX70XUE=;
 b=Rn9Tz/uYeipbCyafQCyo/xdxIjNJRrFHbHg/QmC5p2Zlh9G954hGTReiDtXeh00Z7BfqxukJ6pEBkNUtKc1QrPfJauQ1lwWEqQq97e6KfdVlOQ/C2EpQUHAgMOFSf92x3/zuZa3uJQn3tXmeFWK9BSq9jD5ePRZrG85t4uN2WOg7qHuRyv3/4uF/TEvzmG7C3R3pW8Gn02TrctMLEnbMgAQ8h8Zc/r+J0KfYiIUEh45BkcMFHwTG01c9VaVLR/8V0Xsj3XkfyG4Cm77vUkfxGXUjeqbN+WQ4x0LJh1AUVtAJ+RF/GSbBT/bvc+/BkPTAR09dsSm6nT6NJ+h40DZaXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=37gDY//ploPVJ43mOdncxSIlqX4Uy+5EVZcvFX70XUE=;
 b=maVcucA82LWuawGBOa/Y5S60USfmr41a3hGW34DUEtW7uw+E5gQNcwA6wJR8VU04X0f3cN8uqxsXAPuL2z+o4xoghEQ877mK6iX/GtA7gMtV6Ta+t/ShFcpCZrHkxIsUnmZGlSkZwodCYnmlv4bia7bvyAl7O9/il5yrxghQ6ms=
Received: from DS7PR06CA0021.namprd06.prod.outlook.com (2603:10b6:8:2a::23) by
 IA0PPFF4B476A86.namprd12.prod.outlook.com (2603:10b6:20f:fc04::bea)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Wed, 28 Jan
 2026 00:23:59 +0000
Received: from CH3PEPF00000016.namprd21.prod.outlook.com
 (2603:10b6:8:2a:cafe::2e) by DS7PR06CA0021.outlook.office365.com
 (2603:10b6:8:2a::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.8 via Frontend Transport; Wed,
 28 Jan 2026 00:23:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH3PEPF00000016.mail.protection.outlook.com (10.167.244.121) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.0 via Frontend Transport; Wed, 28 Jan 2026 00:23:59 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 27 Jan
 2026 18:23:59 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 27 Jan
 2026 18:23:59 -0600
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 27 Jan 2026 18:23:58 -0600
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <maciej.falkowski@linux.intel.com>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <max.zhen@amd.com>, <sonal.santan@amd.com>, <mario.limonciello@amd.com>
Subject: [PATCH V1] accel/amdxdna: Hold mm structure across
 iommu_sva_unbind_device()
Date: Tue, 27 Jan 2026 16:23:56 -0800
Message-ID: <20260128002356.1858122-1-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000016:EE_|IA0PPFF4B476A86:EE_
X-MS-Office365-Filtering-Correlation-Id: 391d42d9-cc52-4b1f-29ca-08de5e038839
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wuEM61dWEc1BuxDBVqQcVvG5RmM6pDmk/Tdi0wzkOudkq4xMmofl7lBdL7kU?=
 =?us-ascii?Q?WMOwD/vsd6JDNlvea+cTXjvhzDLy49m99hYwzQelA6HK/ceYxhxjOOaH5KrZ?=
 =?us-ascii?Q?cFX+pLR/t0xxDT7E+B88fwMcsqtfZxEUIU9F42TBmkesRCxMEb2gO3PeXxP9?=
 =?us-ascii?Q?MuSCX7rnyKDVL3P9PYuqgEPvuKIjMMq0P7zG65Av1xHp/1hr191Gnhk/5PWz?=
 =?us-ascii?Q?a3tSJ6O7O2u5Nd4DsODbsIQJuxaemOFCioNifuL6owPvZt+S8PvTxsYe6sQF?=
 =?us-ascii?Q?9SKGEsPY8Yy1Jrr5ZVhSb6Gyavy46HB9oZDiGh0ifaI0T8UW/rRi59ltjl87?=
 =?us-ascii?Q?erFhJfWN/MFCdlwMORuh6e5C5lhnj+wb0tn36osPVNfbswi7SgSRMawgTLEl?=
 =?us-ascii?Q?n6FRv+DQ5qTorpV3da2iHsJ33dMZU/8okRlHAWEmL8u1SWwB0cEEds3KJCbs?=
 =?us-ascii?Q?3t0HlPZsG1pK/n4684dauVVCxcyb1n4kI7ufb8y+aTDmaBx7/i5wyvAfeWuf?=
 =?us-ascii?Q?iKStzwqpnUc3/9hFf2bELIILQWFsIkge9qo6nzNuKy0fiz498QlkOOy/+rwp?=
 =?us-ascii?Q?+fmgmD/WKc+PjuYdLGCcp5R/k43riSzIXWv6KdUjdFtZfvPJuG4wii9092de?=
 =?us-ascii?Q?D7nW/BQ9Z+2wXR3QOPh5f2pXxlJlhHwToEQvUiiiPbxQoaDQYAUVW/EoFPaq?=
 =?us-ascii?Q?YZzFIBpP101nznwAlm/8Ns0ymcpSBQ6cyJU/swMyyUyXFhco8fjBttTRQ1Vg?=
 =?us-ascii?Q?vFz4oxQhmNDVV7dxLIis/ERrO6DbEKPJgvUbSF6+AWgjFEvejeDum7mc6REU?=
 =?us-ascii?Q?l8wKuoxU8orYx31RKgz4Zn+gCVEwCcMFiDxcCm5ONOSLGdROsiuhyOqZ6oXl?=
 =?us-ascii?Q?t/L+yFP8Tdk8f3PJytES+1bIqk/IcBKW5k0v2RyjbTMq9LbD+wSjFEnIhOni?=
 =?us-ascii?Q?wYjawEO4FF9EkNX9EiBkPkY5WYk19eyZFU1Jhn3ZOA/3oT+VZipFTMvzfJgc?=
 =?us-ascii?Q?C/G5j1KmYEhEV3SImO5MPGPAJttdmv72DuUFmYWdVpEyVHzcy+iG+5VtdOin?=
 =?us-ascii?Q?EiA9yIty+bN6qSOL0o06KKJVcHYV5W1kjoi5v0UdRd8gk9omymGj6LdmfUrt?=
 =?us-ascii?Q?wpoYLf+apWs8zwaMSJRvp9MMmMuHEcnw3zUsvr8V0HvnQK9dJsclLXlCpUjM?=
 =?us-ascii?Q?VhuoXMXRJzgNJqDV4i5YZfN0FcioQUij8wtG1DEjUyy0nnJ9wt28+BiEwFBM?=
 =?us-ascii?Q?+po4RNF7mDT9N2xfx/MglYqFIqpn+n/b2qluseG4g4Zo0vG7Xc1JAhxG+DZS?=
 =?us-ascii?Q?iy1IkW2gE6Rbr1oMv5TgHRMP3/xcLFN8o1IJ8kGcPaMyOq4fcjFNtPbj97G+?=
 =?us-ascii?Q?AONNOF/aYQWOdvws9ow+cVRkzkc6Zl5K3ZGE+5fCwIkJbs2I0+/nkPg91STH?=
 =?us-ascii?Q?l+LIGxZRAr1kjNEuUJn891IaNgL8BKmX3XLd16SXNqK8oVOq4r4ReFrG6yfd?=
 =?us-ascii?Q?9MvLmFvjSd1XeQDwLPlzcDqQxYnuBtVVc/AdVG696/aL1fDiJ+zYbxxl3BnP?=
 =?us-ascii?Q?TxaR3dv3bKcbOFfDQZel7YzQXmEZFh2n20/wO4UysRtcP/ex4H/JUWVohX/f?=
 =?us-ascii?Q?ehO2AAcWRhNkc7yfjtqZpYodSZltPaH4PFIl2Ws+g4Js87f6F5Luy4oW6z/1?=
 =?us-ascii?Q?wv7Leg=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 00:23:59.5996 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 391d42d9-cc52-4b1f-29ca-08de5e038839
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000016.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPFF4B476A86
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
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:ogabbay@kernel.org,m:quic_jhugo@quicinc.com,m:maciej.falkowski@linux.intel.com,m:lizhi.hou@amd.com,m:linux-kernel@vger.kernel.org,m:max.zhen@amd.com,m:sonal.santan@amd.com,m:mario.limonciello@amd.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[lizhi.hou@amd.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[lizhi.hou@amd.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 0E5AA9BA37
X-Rspamd-Action: no action

Some tests trigger a crash in iommu_sva_unbind_device() due to
accessing iommu_mm after the associated mm structure has been
freed.

Fix this by taking an explicit reference to the mm structure
after successfully binding the device, and releasing it only
after the device is unbound. This ensures the mm remains valid
for the entire SVA bind/unbind lifetime.

Fixes: be462c97b7df ("accel/amdxdna: Add hardware context")
Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/amdxdna_pci_drv.c | 3 +++
 drivers/accel/amdxdna/amdxdna_pci_drv.h | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.c b/drivers/accel/amdxdna/amdxdna_pci_drv.c
index 45f5c12fc67f..fdefd9ec2066 100644
--- a/drivers/accel/amdxdna/amdxdna_pci_drv.c
+++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
@@ -82,6 +82,8 @@ static int amdxdna_drm_open(struct drm_device *ddev, struct drm_file *filp)
 		ret = -ENODEV;
 		goto unbind_sva;
 	}
+	client->mm = current->mm;
+	mmgrab(client->mm);
 	init_srcu_struct(&client->hwctx_srcu);
 	xa_init_flags(&client->hwctx_xa, XA_FLAGS_ALLOC);
 	mutex_init(&client->mm_lock);
@@ -116,6 +118,7 @@ static void amdxdna_client_cleanup(struct amdxdna_client *client)
 		drm_gem_object_put(to_gobj(client->dev_heap));
 
 	iommu_sva_unbind_device(client->sva);
+	mmdrop(client->mm);
 
 	kfree(client);
 }
diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.h b/drivers/accel/amdxdna/amdxdna_pci_drv.h
index 6580cb5ec7e2..f08406b8fdf9 100644
--- a/drivers/accel/amdxdna/amdxdna_pci_drv.h
+++ b/drivers/accel/amdxdna/amdxdna_pci_drv.h
@@ -130,6 +130,7 @@ struct amdxdna_client {
 
 	struct iommu_sva		*sva;
 	int				pasid;
+	struct mm_struct		*mm;
 };
 
 #define amdxdna_for_each_hwctx(client, hwctx_id, entry)		\
-- 
2.34.1

