Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QTyDAymEi2neVAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 20:16:57 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 366C611E900
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 20:16:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85CE510E399;
	Tue, 10 Feb 2026 19:16:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="4L16V2Of";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010017.outbound.protection.outlook.com [52.101.201.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77E4110E23D
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 19:16:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wgNwQa9HBNyk4eK5iDEwVSsEJn6qUuIeCNNoX1oVm8CxuMY7O3d2tG4nYQjQkbRAWb/7/mqt9nYuaOizj1mrCL6+LaKe5k2mw+nW27Q5OR3rV86fRsW4WmnnYHy+uJvW2ll510QQVRIyfywUD+dB8N0UC4okmIxnLiSSRJkzJQM27Nip9GsjhmBE25IoaCoycna5XCEzEQGe+y1xRekMYYUXRbzRlxYWHnX+XqMO9O8odtFhAdvYAuLy9hdWusN/eNHDZDHzDEs8Hv793H6Z9QIVUADG4PZ5xIhr0BtF5yCr9zxRElObzGNWX02WWcmuV2TlV/DBOJVKTjzBUe+Y0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+RCCLfWectrPM/bwVb4ghwpdFB/ec6WgQbMnO8tzEmY=;
 b=LgUNEWkAONAVhDrcjsPUpm161TIA6DZZ/Eaoi89vsSlGM2xaH+w2lz7+11JSMf+MagvMKrOOSmqXyhlyiqoycMKOS25bq84GjU277qYZ+hvuFRKAJqi/a+oV0CWRC3LHVaJeovgT3VMg97OJb0I4csbwNlexSmgDYK0Lg1sxV107lR3IpzEGEHsVEOw4cVFVOhVdSuVDtXUBIpIOMaU0y7oDLxtoKXce4BSCOggC3fkzkx41fNP+/blVIsIxQ+lNUEwEX91KLYwMwjS92ktHZSTqpLWBImFT7NAJddXieQIdFl7gd0bgRJx+EMj7Ug+Nb6q0HLmG2G34j2gKo++6XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+RCCLfWectrPM/bwVb4ghwpdFB/ec6WgQbMnO8tzEmY=;
 b=4L16V2OfYJgqrmhvj9VuGe2DETU09SkX++ujUmmmTOmVXXjJSl6MOXOyfrgOo/ysCGnoMGvwDHqNtzLHHpGHiJdCMVR92zUUGbk1Ckmvz3vW0pKxxOuT/5U/jAV16xBkeAtVhj9KEtuUmOF745z/hcxsfpp4QuTQ44UwYN3rHRI=
Received: from SJ0PR03CA0094.namprd03.prod.outlook.com (2603:10b6:a03:333::9)
 by MN0PR12MB5812.namprd12.prod.outlook.com (2603:10b6:208:378::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 19:16:39 +0000
Received: from BY1PEPF0001AE1B.namprd04.prod.outlook.com
 (2603:10b6:a03:333:cafe::25) by SJ0PR03CA0094.outlook.office365.com
 (2603:10b6:a03:333::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.19 via Frontend Transport; Tue,
 10 Feb 2026 19:16:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF0001AE1B.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Tue, 10 Feb 2026 19:16:38 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 10 Feb
 2026 13:16:29 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 10 Feb
 2026 11:16:29 -0800
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 10 Feb 2026 13:16:28 -0600
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <maciej.falkowski@linux.intel.com>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <max.zhen@amd.com>, <sonal.santan@amd.com>, <mario.limonciello@amd.com>
Subject: [PATCH V1] accel/amdxdna: Fix dead lock for suspend and resume
Date: Tue, 10 Feb 2026 11:16:26 -0800
Message-ID: <20260210191626.311976-1-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1B:EE_|MN0PR12MB5812:EE_
X-MS-Office365-Filtering-Correlation-Id: 7be2d808-6546-47cf-3fe4-08de68d8ea68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hf95i1FSMEUiMmhXUjiBTTJDsprPJTVv8Vz1RYdsoZ2wHggCc0hyBmM95S6G?=
 =?us-ascii?Q?KKVP55fFX/EGUoh8cxnBvitjdZgSCBT1kRmBjleiG/vWkVg7dTlZaYUp80QJ?=
 =?us-ascii?Q?OlijBiw+2BSsUQH+Mms7blaPDBPghM5TMLKrlK0t86UNj2/kHo9Zzij2cRo4?=
 =?us-ascii?Q?M+m+Nm9Ev/cNQQ2RzsdZEZ7/ZyOX8Vowhvj5TCUbm3+93q5Usbuyh+cNhjYg?=
 =?us-ascii?Q?4W6dP5Stse6LytOCLySOxc3zKGSF5Un4vaxaNHmolQT06EQc01TG3iqaTi88?=
 =?us-ascii?Q?0Ws87O8XFDROAmXbyBXYO8sk1FMaPRpSVnavWVS/pZ2NrwQq0/Q3EWUUgBdc?=
 =?us-ascii?Q?HyRtmXj8UE8+OiFF0VQnCRLh16cT8bKfAfdUAa6k5vpN28JXcRgNtoPEQ7mI?=
 =?us-ascii?Q?mcro4h0fg8KMGGkqeOzsPKzLmJmrlX/lKO1iTbsOaELDSIrTwFlVQ70kl/Xk?=
 =?us-ascii?Q?3SJ82YupFzm7IkrDPGw9AcuhhQiyuXlDBt2c4Xj9h8Yk3lAJKQ25pxJoS0EV?=
 =?us-ascii?Q?k/jUeJNjT+Tgv4QvUKgZrfr1Q9iT2bOE/uM9mx0hQw+vEpAwojk9MDAjhAm/?=
 =?us-ascii?Q?VbH6IYwxC+ZH/a9WjuVpkRvqN3fhEZDMekTpLDcCOzCbYOhCqfy0oNOt8EQS?=
 =?us-ascii?Q?/V+04XehC7dOY8GedVCik3Sh0b1xX0TCDBSV+Zu7C4oEw0QYsiTmwA0UzWil?=
 =?us-ascii?Q?wR2WziCVDwg/rDOf6kHr44rrcx5BdhbhD/pjSMUjYqzUQkqnip0ZN9yX/ysW?=
 =?us-ascii?Q?sJTtaZWbLZF//CvA28EjmP0U4Y8NFSrOAp+YtvaHmr7UskJP+vebZ8oIULQE?=
 =?us-ascii?Q?EmkmjLW2vISRgA3WVMLUpmVuthLe9elzh22vG9w00dO+zezDjfdRZF/rrUY9?=
 =?us-ascii?Q?YjwVxEtH9H7Lr+DjbCDcxA1rY4Y/MjSm585jLAbXh7gTiPOjnb/McCLBrnZ2?=
 =?us-ascii?Q?YrGRiEnwHABNOA4Mkzd6hoiiA+s/s2A6pd/kJOyvgha7sWtFaYzWQ2oT16P9?=
 =?us-ascii?Q?RbC8GacWRLZZ9bERRCpUC3hqCnTelItOiANXiU60kxHWjEEQtyWIuvnvjoI6?=
 =?us-ascii?Q?1Zu8qFFyCPTnLBKNv0GQZUZP+GHWCkw2tcoZxbYxJ+wseidFuLTSHVOEJXpa?=
 =?us-ascii?Q?ppz8Jyn4528qz1/3zCxSCgT9NKxTbd4aa0AQUktrf6hfA4unuCbleZeCppRu?=
 =?us-ascii?Q?WogOXzv+WiucxZoRXgfgrpXinMae03OaGV5l2nFHJbBpDmbNF88zlXE9NzrE?=
 =?us-ascii?Q?8ovNeiDbFoQV695wCbnDF7XqLWfq17SkCQEdllmie5ZttDBmlbgKQpL9KJdE?=
 =?us-ascii?Q?IMf8ph030FYdTmMgjEah3iRQLf0yo/jgAcZ6UDj/zPBR8rbFPxGp7BlGkCGh?=
 =?us-ascii?Q?Je0bRAVVzxzV63iLlDImHiEtO58a1HEzRSQpV8h47B4znnZQ7OMBLeXMvhiP?=
 =?us-ascii?Q?LpSva82aHYBfVlh8iOKw+y1w5dKO4/Dbq3bqSVum1sKVEdVchyW1qGqyMiXP?=
 =?us-ascii?Q?VtZ2glkagd1yy7VFr4kjKMiJ1ah9s3hevZJk2RpzdGXfrISAzIzLWzl7Pe8b?=
 =?us-ascii?Q?TGRfJMny0U9b7MEnU5VxAftf6eYxbkf68F6dQjYh/79IifI/XVHEYRgAScQT?=
 =?us-ascii?Q?PqGBpMrD6jG5Aw/Vp0ACySd0g83ypV7UpfzH9eNPsTj8wJNhIyFqP/fg4pq1?=
 =?us-ascii?Q?v7mF4Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: uAVf1G57LHttUs5lpfBSIh2wexnF6+WSNg1khNufGsDBrI5OQAX9bPgXHXp+cHN5BLViBUF9ePd8168xqegFLw8MKZDcO+ORcIPC6sJsTlrzyormZs/4Mx4uf1Ger3RIh8/T1e/ryf1WsTD0Z/M2p7vdZVy5qxuzb2yt4cogrWnYQJqHYF1tqyYDIVhp8E5iwSgzk+8+yOWvJ+0kMBQ5FMuyCvTQ46FmixF7+31Y2s6tayC3ar63JPCmw57mOScN8l4DTNcEE2OHy21+eKeKKUg5jc1cpmPoosEMhepmU0bHafXacptGzvd5mpUSWvOnV0spKt4H5E9pn2QLxSeB9ZsHJvIyoXq0+YxpRGV0d4Qc+CZTWxYUEU7+/5sdktnduF7FDLtSTf9ofyMGQ4HyXQCWRFhnhb1IMzIs20xhFz+s9BrcG2czpH6mhhC3YiuJ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 19:16:38.7345 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7be2d808-6546-47cf-3fe4-08de68d8ea68
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE1B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5812
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ogabbay@kernel.org,m:quic_jhugo@quicinc.com,m:maciej.falkowski@linux.intel.com,m:lizhi.hou@amd.com,m:linux-kernel@vger.kernel.org,m:max.zhen@amd.com,m:sonal.santan@amd.com,m:mario.limonciello@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[lizhi.hou@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lizhi.hou@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:mid,amd.com:dkim,amd.com:email];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 366C611E900
X-Rspamd-Action: no action

When an application issues a query IOCTL while auto suspend is running,
a deadlock can occur. The query path holds dev_lock and then calls
pm_runtime_resume_and_get(), which waits for the ongoing suspend to
complete. Meanwhile, the suspend callback attempts to acquire dev_lock
and blocks, resulting in a deadlock.

Fix this by releasing dev_lock before calling pm_runtime_resume_and_get()
and reacquiring it after the call completes. Also acquire dev_lock in the
resume callback to keep the locking consistent.

Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/aie2_ctx.c    |  4 ++--
 drivers/accel/amdxdna/aie2_pci.c    |  7 +++----
 drivers/accel/amdxdna/aie2_pm.c     |  2 +-
 drivers/accel/amdxdna/amdxdna_ctx.c | 19 +++++++------------
 drivers/accel/amdxdna/amdxdna_pm.c  |  2 ++
 drivers/accel/amdxdna/amdxdna_pm.h  | 11 +++++++++++
 6 files changed, 26 insertions(+), 19 deletions(-)

diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
index 37d05f2e986f..58e146172b61 100644
--- a/drivers/accel/amdxdna/aie2_ctx.c
+++ b/drivers/accel/amdxdna/aie2_ctx.c
@@ -629,7 +629,7 @@ int aie2_hwctx_init(struct amdxdna_hwctx *hwctx)
 		goto free_entity;
 	}
 
-	ret = amdxdna_pm_resume_get(xdna);
+	ret = amdxdna_pm_resume_get_locked(xdna);
 	if (ret)
 		goto free_col_list;
 
@@ -760,7 +760,7 @@ static int aie2_hwctx_cu_config(struct amdxdna_hwctx *hwctx, void *buf, u32 size
 	if (!hwctx->cus)
 		return -ENOMEM;
 
-	ret = amdxdna_pm_resume_get(xdna);
+	ret = amdxdna_pm_resume_get_locked(xdna);
 	if (ret)
 		goto free_cus;
 
diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/aie2_pci.c
index f70ccf0f3c01..5b326e4610e6 100644
--- a/drivers/accel/amdxdna/aie2_pci.c
+++ b/drivers/accel/amdxdna/aie2_pci.c
@@ -451,7 +451,6 @@ static int aie2_hw_suspend(struct amdxdna_dev *xdna)
 {
 	struct amdxdna_client *client;
 
-	guard(mutex)(&xdna->dev_lock);
 	list_for_each_entry(client, &xdna->client_list, node)
 		aie2_hwctx_suspend(client);
 
@@ -951,7 +950,7 @@ static int aie2_get_info(struct amdxdna_client *client, struct amdxdna_drm_get_i
 	if (!drm_dev_enter(&xdna->ddev, &idx))
 		return -ENODEV;
 
-	ret = amdxdna_pm_resume_get(xdna);
+	ret = amdxdna_pm_resume_get_locked(xdna);
 	if (ret)
 		goto dev_exit;
 
@@ -1044,7 +1043,7 @@ static int aie2_get_array(struct amdxdna_client *client,
 	if (!drm_dev_enter(&xdna->ddev, &idx))
 		return -ENODEV;
 
-	ret = amdxdna_pm_resume_get(xdna);
+	ret = amdxdna_pm_resume_get_locked(xdna);
 	if (ret)
 		goto dev_exit;
 
@@ -1134,7 +1133,7 @@ static int aie2_set_state(struct amdxdna_client *client,
 	if (!drm_dev_enter(&xdna->ddev, &idx))
 		return -ENODEV;
 
-	ret = amdxdna_pm_resume_get(xdna);
+	ret = amdxdna_pm_resume_get_locked(xdna);
 	if (ret)
 		goto dev_exit;
 
diff --git a/drivers/accel/amdxdna/aie2_pm.c b/drivers/accel/amdxdna/aie2_pm.c
index 579b8be13b18..29bd4403a94d 100644
--- a/drivers/accel/amdxdna/aie2_pm.c
+++ b/drivers/accel/amdxdna/aie2_pm.c
@@ -31,7 +31,7 @@ int aie2_pm_set_dpm(struct amdxdna_dev_hdl *ndev, u32 dpm_level)
 {
 	int ret;
 
-	ret = amdxdna_pm_resume_get(ndev->xdna);
+	ret = amdxdna_pm_resume_get_locked(ndev->xdna);
 	if (ret)
 		return ret;
 
diff --git a/drivers/accel/amdxdna/amdxdna_ctx.c b/drivers/accel/amdxdna/amdxdna_ctx.c
index d17aef89a0ad..db3aa26fb55f 100644
--- a/drivers/accel/amdxdna/amdxdna_ctx.c
+++ b/drivers/accel/amdxdna/amdxdna_ctx.c
@@ -266,9 +266,9 @@ int amdxdna_drm_config_hwctx_ioctl(struct drm_device *dev, void *data, struct dr
 	struct amdxdna_drm_config_hwctx *args = data;
 	struct amdxdna_dev *xdna = to_xdna_dev(dev);
 	struct amdxdna_hwctx *hwctx;
-	int ret, idx;
 	u32 buf_size;
 	void *buf;
+	int ret;
 	u64 val;
 
 	if (XDNA_MBZ_DBG(xdna, &args->pad, sizeof(args->pad)))
@@ -310,20 +310,17 @@ int amdxdna_drm_config_hwctx_ioctl(struct drm_device *dev, void *data, struct dr
 		return -EINVAL;
 	}
 
-	mutex_lock(&xdna->dev_lock);
-	idx = srcu_read_lock(&client->hwctx_srcu);
+	guard(mutex)(&xdna->dev_lock);
 	hwctx = xa_load(&client->hwctx_xa, args->handle);
 	if (!hwctx) {
 		XDNA_DBG(xdna, "PID %d failed to get hwctx %d", client->pid, args->handle);
 		ret = -EINVAL;
-		goto unlock_srcu;
+		goto free_buf;
 	}
 
 	ret = xdna->dev_info->ops->hwctx_config(hwctx, args->param_type, val, buf, buf_size);
 
-unlock_srcu:
-	srcu_read_unlock(&client->hwctx_srcu, idx);
-	mutex_unlock(&xdna->dev_lock);
+free_buf:
 	kfree(buf);
 	return ret;
 }
@@ -334,7 +331,7 @@ int amdxdna_hwctx_sync_debug_bo(struct amdxdna_client *client, u32 debug_bo_hdl)
 	struct amdxdna_hwctx *hwctx;
 	struct amdxdna_gem_obj *abo;
 	struct drm_gem_object *gobj;
-	int ret, idx;
+	int ret;
 
 	if (!xdna->dev_info->ops->hwctx_sync_debug_bo)
 		return -EOPNOTSUPP;
@@ -345,17 +342,15 @@ int amdxdna_hwctx_sync_debug_bo(struct amdxdna_client *client, u32 debug_bo_hdl)
 
 	abo = to_xdna_obj(gobj);
 	guard(mutex)(&xdna->dev_lock);
-	idx = srcu_read_lock(&client->hwctx_srcu);
 	hwctx = xa_load(&client->hwctx_xa, abo->assigned_hwctx);
 	if (!hwctx) {
 		ret = -EINVAL;
-		goto unlock_srcu;
+		goto put_obj;
 	}
 
 	ret = xdna->dev_info->ops->hwctx_sync_debug_bo(hwctx, debug_bo_hdl);
 
-unlock_srcu:
-	srcu_read_unlock(&client->hwctx_srcu, idx);
+put_obj:
 	drm_gem_object_put(gobj);
 	return ret;
 }
diff --git a/drivers/accel/amdxdna/amdxdna_pm.c b/drivers/accel/amdxdna/amdxdna_pm.c
index d024d480521c..b1fafddd7ad5 100644
--- a/drivers/accel/amdxdna/amdxdna_pm.c
+++ b/drivers/accel/amdxdna/amdxdna_pm.c
@@ -16,6 +16,7 @@ int amdxdna_pm_suspend(struct device *dev)
 	struct amdxdna_dev *xdna = to_xdna_dev(dev_get_drvdata(dev));
 	int ret = -EOPNOTSUPP;
 
+	guard(mutex)(&xdna->dev_lock);
 	if (xdna->dev_info->ops->suspend)
 		ret = xdna->dev_info->ops->suspend(xdna);
 
@@ -28,6 +29,7 @@ int amdxdna_pm_resume(struct device *dev)
 	struct amdxdna_dev *xdna = to_xdna_dev(dev_get_drvdata(dev));
 	int ret = -EOPNOTSUPP;
 
+	guard(mutex)(&xdna->dev_lock);
 	if (xdna->dev_info->ops->resume)
 		ret = xdna->dev_info->ops->resume(xdna);
 
diff --git a/drivers/accel/amdxdna/amdxdna_pm.h b/drivers/accel/amdxdna/amdxdna_pm.h
index 77b2d6e45570..3d26b973e0e3 100644
--- a/drivers/accel/amdxdna/amdxdna_pm.h
+++ b/drivers/accel/amdxdna/amdxdna_pm.h
@@ -15,4 +15,15 @@ void amdxdna_pm_suspend_put(struct amdxdna_dev *xdna);
 void amdxdna_pm_init(struct amdxdna_dev *xdna);
 void amdxdna_pm_fini(struct amdxdna_dev *xdna);
 
+static inline int amdxdna_pm_resume_get_locked(struct amdxdna_dev *xdna)
+{
+	int ret;
+
+	mutex_unlock(&xdna->dev_lock);
+	ret = amdxdna_pm_resume_get(xdna);
+	mutex_lock(&xdna->dev_lock);
+
+	return ret;
+}
+
 #endif /* _AMDXDNA_PM_H_ */
-- 
2.34.1

