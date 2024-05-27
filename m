Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FEB88D0003
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2024 14:28:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EA5410E04D;
	Mon, 27 May 2024 12:28:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="n0aAFAhX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2079.outbound.protection.outlook.com [40.107.95.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3087210EACF
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 12:28:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WozWHkG3MNUUUOfU4yIchwLOS0rOTSZ1vcjQWFBD5sPhodxok+SbANal/6A0vWq9f14JWq81QQ01D76waCl5t1NYT1R+ZkrttXe7vv0ekIUDsl2vlpakFiZF3wmK5scsaVWbydpf0QhU+1Z3qks/qx2XH4fvgrKJr+4RuDX7e0jKuGZAu18Gp6ejdr6Pl9SEQBMsykefDwkUmBmoQPj8IxC0BKfciut2OAyZPJ0eGh/Q9QF2EbOI+JEgvtF18vs3VE4yoysRDjTwNvNHZZfZEuLTgBYPlL4cmd0/ZA/EWBbAC3fx2UYGjVLt7vlVQ6Gy+dn70k2nnx1pFRIUs1g4+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=spMpB184Nw7mrpFhsvyKOv1V1/q23aFE72jh1rKcHY0=;
 b=oR+mRD4DPd6DlVmFOt7tYneZqpii8HTPqnJ3i0jLGEv0l0PTdSleezLJgZ6dSzbbhclDiE+0t569z5FUUgEPj8zMThQe3tBPok929kZMAP6ngKCRTNrNWYXN3N00esh7tiE5l8LWHpoIvV2lbN/A2tl/Y7o6mMO/4qq/LtImYyIQTnUFXlcc1vwpd5hu2cSxQacrrWraj12EXOffvXxbqJvXxQn0A4b8BYjxuehjtQeohJ0eA7LPlyHUg1jgQlWdUSA43OfiJZ36Yx89bGwlEelSUalg9l0qAi7TgokgYcDf8f6uKREqXRq+YhtTniPnM/1D0tH5FreYE7l26YXAMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=spMpB184Nw7mrpFhsvyKOv1V1/q23aFE72jh1rKcHY0=;
 b=n0aAFAhXTQ9jc7l9LrjQR4sF19lnMM99e1CWlm+HY0v2QBqtHyTpWXHMDbAzNRV10XtztR1HFmOT0nv2YoITE0qt+APu1AD1teKlZ7Fq71vTWwROCs+x3bRnmaXGlsgNBytL1nHEkQOdwjo6FR/wrGicVmgk3HJpqdXuU5G/qQs=
Received: from BYAPR21CA0022.namprd21.prod.outlook.com (2603:10b6:a03:114::32)
 by CH3PR12MB9099.namprd12.prod.outlook.com (2603:10b6:610:1a5::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Mon, 27 May
 2024 12:28:06 +0000
Received: from CO1PEPF000044F3.namprd05.prod.outlook.com
 (2603:10b6:a03:114:cafe::48) by BYAPR21CA0022.outlook.office365.com
 (2603:10b6:a03:114::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.5 via Frontend
 Transport; Mon, 27 May 2024 12:28:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000044F3.mail.protection.outlook.com (10.167.241.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7633.15 via Frontend Transport; Mon, 27 May 2024 12:28:05 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 27 May
 2024 07:28:04 -0500
Received: from wayne-dev-lnx.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 27 May 2024 07:28:01 -0500
From: Wayne Lin <Wayne.Lin@amd.com>
To: <dri-devel@lists.freedesktop.org>
CC: <lyude@redhat.com>, <jani.nikula@intel.com>, <harry.wentland@amd.com>,
 <jerry.zuo@amd.com>, Wayne Lin <Wayne.Lin@amd.com>, Harry Wentland
 <hwentlan@amd.com>, <stable@vger.kernel.org>
Subject: [PATCH] drm/dp_mst: Fix all mstb marked as not probed after
 suspend/resume
Date: Mon, 27 May 2024 20:27:56 +0800
Message-ID: <20240527122756.3900099-1-Wayne.Lin@amd.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: Wayne.Lin@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F3:EE_|CH3PR12MB9099:EE_
X-MS-Office365-Filtering-Correlation-Id: 010200d8-475b-451a-af01-08dc7e4875db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|376005|1800799015|82310400017|36860700004; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9yd8prODUt7PAWbTWw9TykzbGLz6Mpe7uz6/RcMkLRA3gfxr/zixFKYIw0xL?=
 =?us-ascii?Q?bIykakClJb3ebnyMbB3o6CcLqYyl2ZPl8lYL79wUtVOuf7OWnz/nkLnAffcr?=
 =?us-ascii?Q?3TwyKtms6aNr9ImAz7YhajmieH3CiayBfG9f0/kyPlD9DAS0LKCLSZ2SLZ2+?=
 =?us-ascii?Q?Pj2ol8S5zxO6Yt22HQj1eXo5IYT014pgNV1a6VjHP9/YkUbrrYq0QMKQw8MU?=
 =?us-ascii?Q?ZWChWKFsbYpJHAuzHYNhz5rHiO3LhwmEELqDNPe6+mcen7DXrRZfaPzvcSOI?=
 =?us-ascii?Q?lxkbvx3wmx6/DdmOaArjDg9HYFuRgLQvs2btO0b1xP9z4FZGS5x28/y+BxUV?=
 =?us-ascii?Q?yBzIkbrsv5aJdSCIjvyOI7XYqC8tJO3IKSJHuSgy1+orSSMsjK7OoJ8ZtszJ?=
 =?us-ascii?Q?e/vfOh+zAG4EKlNiodapKVgZZWNy5dsKDMzjDFJPTMGGeRD97lqYpSGsBoyF?=
 =?us-ascii?Q?PpH5aRoqyeNBX08cCR+Ak0hVkH1ZcAXnI1OV63mDJ7y8TbM+z02R7B5+wCwI?=
 =?us-ascii?Q?Y8qom9O4E04WHNHQPYTLvd0B6uo2xHSpk3kWDre0OxjN5Ir6MVPqqN3f9dSg?=
 =?us-ascii?Q?RewsSDaRTOrPi/hOU30c6HXdTNNrpKt3c6veAxHRUbosG1XZMVo+VvIvO+t3?=
 =?us-ascii?Q?Mi6+Q5lQn58Qh80KB2c9lo7QzzgnbgtW6GSneMG2WuAoO3Aijv2bo2wNCcOH?=
 =?us-ascii?Q?b8ovwG+73ASLadJyGwQM24b2oNsPHXGUqCoWGVRMksZQ1yddVk7mEp5eS4XQ?=
 =?us-ascii?Q?H0IGHCF4nKQRvxzHjg4i1CinaieBR0nuxLwPfRTaAspM9ym2MSRxt6eQpT8K?=
 =?us-ascii?Q?h7CcQCVw250CA8vMg007E1N8i73po90hYjKgM/4oQZOD7D07C1ZiUhYWH/8E?=
 =?us-ascii?Q?5BAdhSje5ttXLgBPhpco68+uv3Yj+ug06wPNbLxRPXgrB+3qj/RjmDC902X1?=
 =?us-ascii?Q?l9ICopn5ZkS58cONwVlsL0BdaePYD5KhOUPPtNDfhy5SnOoqVxxRHE4K5jFR?=
 =?us-ascii?Q?OkLLqBqf8THuri2YMY6hhDuE24va23KwGqsPTsLRUh8PObQxy7y1Vn7xa3bB?=
 =?us-ascii?Q?6PcuehkK0Q1ZV1rffqHXkSPuVtzlTJFHY47cmHZSZVPTYjAoh74bKrCWGasO?=
 =?us-ascii?Q?MHKHj1px29WGitoCjp2gl8wOAkyD9q9InjsQ/hQzk80PNFbCtD5Aax6FLrng?=
 =?us-ascii?Q?qRUm7fOvVv0y19DhJhDQAvjBWgrrFnnC6SqXPAK0bI8tIAtyyBAkpZyuaD75?=
 =?us-ascii?Q?JhKiZz9dUiS6EZSpial7XOo0B4jfEaWabDorF1WdAcDgIVO/qh1VP2Tf3mKQ?=
 =?us-ascii?Q?F7tko8aerA9Izq9kNa1t+CFIadPP8kfUv/6xnXTBsSTsKwFbhJjEFIunvxdV?=
 =?us-ascii?Q?+Keuy1lPoisPvR5scIJ0NF5s98iZ?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(82310400017)(36860700004); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2024 12:28:05.8438 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 010200d8-475b-451a-af01-08dc7e4875db
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9099
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

[Why]
After supend/resume, with topology unchanged, observe that
link_address_sent of all mstb are marked as false even the topology probing
is done without any error.

It is caused by wrongly also include "ret == 0" case as a probing failure
case.

[How]
Remove inappropriate checking conditions.

Cc: Lyude Paul <lyude@redhat.com>
Cc: Harry Wentland <hwentlan@amd.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: stable@vger.kernel.org
Fixes: 37dfdc55ffeb ("drm/dp_mst: Cleanup drm_dp_send_link_address() a bit")
Signed-off-by: Wayne Lin <Wayne.Lin@amd.com>
---
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index 7f8e1cfbe19d..68831f4e502a 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -2929,7 +2929,7 @@ static int drm_dp_send_link_address(struct drm_dp_mst_topology_mgr *mgr,
 
 	/* FIXME: Actually do some real error handling here */
 	ret = drm_dp_mst_wait_tx_reply(mstb, txmsg);
-	if (ret <= 0) {
+	if (ret < 0) {
 		drm_err(mgr->dev, "Sending link address failed with %d\n", ret);
 		goto out;
 	}
@@ -2981,7 +2981,7 @@ static int drm_dp_send_link_address(struct drm_dp_mst_topology_mgr *mgr,
 	mutex_unlock(&mgr->lock);
 
 out:
-	if (ret <= 0)
+	if (ret < 0)
 		mstb->link_address_sent = false;
 	kfree(txmsg);
 	return ret < 0 ? ret : changed;
-- 
2.37.3

