Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qDiMEKR9g2mHnwMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 18:11:00 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D72EEADD6
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 18:10:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7264510E713;
	Wed,  4 Feb 2026 17:10:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="QwUuJqsd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010061.outbound.protection.outlook.com
 [40.93.198.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E61D10E71E
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Feb 2026 17:10:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pI9v81ar2L6Hf0P8zHZczxlFYyTHfNGn5pvMEzgWcsFpXU/CrbfhUf4odr3bUYmggDUBDwgBJXXj4e+EjUgqHRvp2JX+/zoqz8jt2Fofym9DrjhHDSgg2osx4V8U4jmFX8+kh6B7tqxmgNQZJhsdo9oq8vS2ZpetWE6DTV6PuRXfavs5KOkrIz1yvCWAmGzpYO7QIvXOBXKIc91P507mGGsCvwcuiLv6uJ+4w1MPF9bu7etkkASGZ+ORHNvCA2UU6YnTPetLV3utjj3+6hqFLXkqtLO2yi1kPvzkFjilZxvebnRst2SgxBVSumoRR87bMuHHgoPEMYYsLCGsKBHTKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4pJREqB+63Za3qsmRYMaahD/1GRokzxoXNV3GY6830o=;
 b=NpHGMcrTsxV/VIb6Swaw2ICwkT3rVreEEa9Wsn2CAFqAHDg5Di/J/W5smK6dMDmb3G73wnGRYevlmzqW0VGhMzaJz4u5WaIPx/EQoErCCKfsa1k3p8+Clx2hh2HhRLbph16ylfRoIkZtTZQwdHcgt1K+IegPlRuEmEdK1dI4VOZVKCpAUPYOP16nN32BLDHTfEEomQmwtns0bn6nA5dgvrjoPObdTL0kAxcCHlbaN0mzzRe95X9uQXQ0sfKhDD0SG9y0os7igdTuPlbFSUdBfX4vzVpevI/dpNnbKpz66h/GN13L5hBNP3KpcuToJxUC2P/NBI2jgYnyoFvDli7QoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4pJREqB+63Za3qsmRYMaahD/1GRokzxoXNV3GY6830o=;
 b=QwUuJqsd7k8KWrVUPHc3+S7O+uUb630jXYFWazyG1hAWshK47i7Cb1AzGZPS1Vqs5591ErJ7xlnDC4KmpXTn+T/PBWFjXPZkmR0zcFzbTGO44egCI/aDPqybQ/5cg8g/TRj4bfem5wZQtIhk8bsQmPknvOgDw33LhmEyaiCCJgU=
Received: from BN0PR02CA0024.namprd02.prod.outlook.com (2603:10b6:408:e4::29)
 by SN7PR12MB6888.namprd12.prod.outlook.com (2603:10b6:806:260::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Wed, 4 Feb
 2026 17:10:50 +0000
Received: from BN1PEPF00004681.namprd03.prod.outlook.com
 (2603:10b6:408:e4:cafe::8e) by BN0PR02CA0024.outlook.office365.com
 (2603:10b6:408:e4::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.13 via Frontend Transport; Wed,
 4 Feb 2026 17:10:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00004681.mail.protection.outlook.com (10.167.243.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Wed, 4 Feb 2026 17:10:50 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Wed, 4 Feb
 2026 11:10:49 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 4 Feb
 2026 11:10:49 -0600
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 4 Feb 2026 09:10:48 -0800
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <maciej.falkowski@linux.intel.com>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <max.zhen@amd.com>, <sonal.santan@amd.com>, <mario.limonciello@amd.com>
Subject: [PATCH V1] accel/amdxdna: Fix incorrect DPM level after suspend/resume
Date: Wed, 4 Feb 2026 09:10:48 -0800
Message-ID: <20260204171048.3165580-1-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004681:EE_|SN7PR12MB6888:EE_
X-MS-Office365-Filtering-Correlation-Id: ed109d19-4bb3-468b-284b-08de6410589b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?o+Xuxo7Ox48CRGZdAGFCkgrhy3QcHj7/GjAEFgeie4jGJAF3/7yam0BogZNC?=
 =?us-ascii?Q?R3Lb6mA4Q7VRBlcRJAVFifhyoG+GpWdJiThjH8Fs6iq5kTxMj1XpXKg1f7uo?=
 =?us-ascii?Q?mEVo7uErjtfgdUH3/z7nK8tUpF5CcsmtKZIoFFWL9L+x8XsScqZ8Yk1iluei?=
 =?us-ascii?Q?7enL7tKWhWyYiEMjkob0DsqA/egf0kMpIWDAlOn7yiTPwK4kGGp41dw5hfxi?=
 =?us-ascii?Q?o85UmHmOt2zsfQIwUpPol1auliSXmAjK9da2zZWj6AjFOMZ2RXlwpy5Hz8Mx?=
 =?us-ascii?Q?4PVSU9WUncithe/0nsZNUT3wdLdDMOgSTY5mOrRHTu79/FepsApwH/CsSn7L?=
 =?us-ascii?Q?sGZG68nEtg5wMrs6apjoOT8JNCASmk0Uau/ClNU6SxGJ51Osihj2wzO9dSBP?=
 =?us-ascii?Q?QU9WYJUIysBsFWi++vkFh0M5gcO9i8s4FyDVv64px2bduZWtN3nIoCmaWQn2?=
 =?us-ascii?Q?uuLNgK0aJeEUJCPYJo7SBNQHtKp6Y6E9VVd1/jSiqPmn+CLg46GK12Die0i9?=
 =?us-ascii?Q?P9+I0K6aYCiIl6pMUmlhsug+Fvb++HIO/B9oS1kMcChINiZWJQhZOgm07Bzz?=
 =?us-ascii?Q?VgSX7nzt9U8qLoQ6rh3SA6QK6MKRpqeCYtzmbi64BaxWepzprMRC+WVBo6E9?=
 =?us-ascii?Q?8FuhWccc/Wfft5poVuK0YH6MXgGFKNHiw6QrOxiGgB8n4ju6bxc06Echrxhf?=
 =?us-ascii?Q?bJ3UlAat7nTAmcYYpOnCoR2kZPiXscbTA7CHhQuWb1MeaWzF+qRADUWGZOxs?=
 =?us-ascii?Q?xaPm7WS7az/62EeSm5tp/CMsOnqqxIn6qybEHdZcsL1bIKkjHmvSTzDKaq0N?=
 =?us-ascii?Q?cWZJ4W1wdLZVc9Yl8zunMqvDLD8Luxe5X3NGYYgO+wGgEIJO+AnSLpVeNdVs?=
 =?us-ascii?Q?+dWjYvZJRZY8dzehR0LbBtdRTO67Whse8hBUeJ6LAr73Zmu8MdgioqFbNMXz?=
 =?us-ascii?Q?JM35itEyqWck3rpYhPVdne/qSx09oRqyzRKTKoYz8rcqtjGs+50gfaAV2Atj?=
 =?us-ascii?Q?SW23yowi7o5XFxVDfdO7+3iNUZDl9xQxmgYwPK3XPyIVk0LMw7et1OXogt6j?=
 =?us-ascii?Q?OXB6YM4hAnFc+/LFJnLv91A88vQdSNit4B7KKht5qEvgXfnCJ4RW6RzFShmq?=
 =?us-ascii?Q?kBsCsTOJ9ybOOoCrkf0K1s8VERWmcQQCl7KeUOH2pi3sBhM1p8EaTQ1DiGkX?=
 =?us-ascii?Q?A4iJdQs+wmqORcT2IjgK2F4v5EdoOOIKALiNOs9TEZZivPp1YjYqQ6m46JDq?=
 =?us-ascii?Q?eBwte1qSo3Kq71uOv5ROSyhXXmU5y5v6Z2IaWX2EEUK0RHt0Q7Tmv5CcIYI1?=
 =?us-ascii?Q?4YXH1FJzdbVVNorigJpIyEF395Gpbl5H7F+BtnewtcPNWariWbESZ3UoQCGG?=
 =?us-ascii?Q?horiefF/LdVVBDCWzyk+yJWLH/oAibJNhhpxzCFST9HkGs/aCK+/m0W+7DQ7?=
 =?us-ascii?Q?wYOZ6R6SLzyf+/xIbkqcPveWd6EXOTUwByDywmJXjll91YMFae/s/+G6kq45?=
 =?us-ascii?Q?iBHrOfM2KFXf8I+sQ8EgdEUBtJVWD6mv07z5zH/rg4qCq+Qi/5AmKaAPOVrD?=
 =?us-ascii?Q?u5GwWOLMeqZ8DdS2QXdCcQ3BVdCCG/9Y6euDtcVFOp4euv590IEmJB9j6A24?=
 =?us-ascii?Q?eIuE2abqGyrKR81nHI/O7QMpoSxnNBmlpZySVX8cWGSFZMBTBvgpcNRIT4GO?=
 =?us-ascii?Q?rATibw=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 7P1wu+sZWTA0KbBWUJyQg8CLyuSkFgOyCT7qsbaSjMoHWWFXwOj4p/I8cmsgtmHQTB1MtxUQ9WhTMlRxIldaEvPhWD2zmbvfd/Mbb0cTYct3YOYZ/zQZ39iRT1mvMlgti+OWIrRHjU/dZYELwsH9l2bhrPh+M9rFQ2BWgljyAHg4Ra1rNRKb06FXY47YMPdq8SsnfEuJNPApLk/HtCPNR9UQmJn05uQTi6moESodlmTZ1S+s9Gb3L+cyUX2vu3Qv4iUVzfz/iOTjytHnO9FhHTiZpbmWCM9mv70hzBMkLv5TJ5T+JLzV87amcdAWLBRKwH4UnWp2NDb/eqiAIVDbV/FOqJn0VXHwgswFkTAeKCnk/8mUF6QoRWiIjvO3QMverMxhb0nuMXQsjsmHndGKFexqndgRs6wmSLxo9zYqZ/11xEEewUZD/BB4T3F96wM1
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 17:10:50.1603 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed109d19-4bb3-468b-284b-08de6410589b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00004681.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6888
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
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[lizhi.hou@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ogabbay@kernel.org,m:quic_jhugo@quicinc.com,m:maciej.falkowski@linux.intel.com,m:lizhi.hou@amd.com,m:linux-kernel@vger.kernel.org,m:max.zhen@amd.com,m:sonal.santan@amd.com,m:mario.limonciello@amd.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lizhi.hou@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 7D72EEADD6
X-Rspamd-Action: no action

The suspend routine sets the DPM level to 0, which unintentionally
overwrites the previously saved DPM level. As a result, the device always
resumes with DPM level 0 instead of restoring the original value.

Fix this by ensuring the suspend path does not overwrite the saved DPM
level, allowing the correct DPM level to be restored during resume.

Fixes: f4d7b8a6bc8c ("accel/amdxdna: Enhance power management settings")
Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/aie2_pm.c  | 3 +++
 drivers/accel/amdxdna/aie2_smu.c | 2 --
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/amdxdna/aie2_pm.c b/drivers/accel/amdxdna/aie2_pm.c
index afcd6d4683e5..579b8be13b18 100644
--- a/drivers/accel/amdxdna/aie2_pm.c
+++ b/drivers/accel/amdxdna/aie2_pm.c
@@ -36,6 +36,8 @@ int aie2_pm_set_dpm(struct amdxdna_dev_hdl *ndev, u32 dpm_level)
 		return ret;
 
 	ret = ndev->priv->hw_ops.set_dpm(ndev, dpm_level);
+	if (!ret)
+		ndev->dpm_level = dpm_level;
 	amdxdna_pm_suspend_put(ndev->xdna);
 
 	return ret;
@@ -65,6 +67,7 @@ int aie2_pm_init(struct amdxdna_dev_hdl *ndev)
 	ret = ndev->priv->hw_ops.set_dpm(ndev, ndev->max_dpm_level);
 	if (ret)
 		return ret;
+	ndev->dpm_level = ndev->max_dpm_level;
 
 	ret = aie2_pm_set_clk_gating(ndev, AIE2_CLK_GATING_ENABLE);
 	if (ret)
diff --git a/drivers/accel/amdxdna/aie2_smu.c b/drivers/accel/amdxdna/aie2_smu.c
index 2d195e41f83d..d8c31924e501 100644
--- a/drivers/accel/amdxdna/aie2_smu.c
+++ b/drivers/accel/amdxdna/aie2_smu.c
@@ -84,7 +84,6 @@ int npu1_set_dpm(struct amdxdna_dev_hdl *ndev, u32 dpm_level)
 	}
 
 	ndev->hclk_freq = freq;
-	ndev->dpm_level = dpm_level;
 	ndev->max_tops = 2 * ndev->total_col;
 	ndev->curr_tops = ndev->max_tops * freq / 1028;
 
@@ -114,7 +113,6 @@ int npu4_set_dpm(struct amdxdna_dev_hdl *ndev, u32 dpm_level)
 
 	ndev->npuclk_freq = ndev->priv->dpm_clk_tbl[dpm_level].npuclk;
 	ndev->hclk_freq = ndev->priv->dpm_clk_tbl[dpm_level].hclk;
-	ndev->dpm_level = dpm_level;
 	ndev->max_tops = NPU4_DPM_TOPS(ndev, ndev->max_dpm_level);
 	ndev->curr_tops = NPU4_DPM_TOPS(ndev, dpm_level);
 
-- 
2.34.1

