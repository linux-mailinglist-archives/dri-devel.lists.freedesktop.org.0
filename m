Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F92E917B52
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 10:49:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED2C010E7F4;
	Wed, 26 Jun 2024 08:49:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="AOdzkz9k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2057.outbound.protection.outlook.com [40.107.243.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91E8B10E7CF;
 Wed, 26 Jun 2024 08:49:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kmDEH3/r+Ipba9Rq0o+IBwBsxNRpUPs+6ba27bfZ7BG3aD42xcFwZkZdBIE2AW77n9TRDzkO3jSe8Z9ftFtpxcc7yFmdL2l416RHgZFWCc9RknqDxZsGw4EVa3dKHPuwNlh42TYTuCABS7rWCR/OzEoTP+HNPFoLDGG7fXsZ1SIxNPFmXYsxKOaIeHTpoahrW/4VrV2HeNPRLYMMnW3lFJNdhcKwrZqj7CQ/r11u2b08vxo3gEseSt+h2/ihoNB23MEftzY0nHLiBHLiALdJpDfZ+6UTbQY7QSX8qlx/eWepCRrMXE+Lg0DSq7W5err9GAF1OqoY88QQ54iR4e6swQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=41IlAKu+Kfg44K7rp6Quje4MpL4vWSW9IUJx3TveHsw=;
 b=SZKoJ2uOMwy9aHFLDo83EX3QlnAO6W/crPkOhXFHAkxS4JMKvl7m0U2/Sx6J5z/JLM/N8Fstg3/1LCvvif7XY+OjS9rl3SQLRN/XW/83bAXul8PUFrHnW6dbc6AJdHIjIIVt9BzPzana74sFPPB4MpJixvFTLSwfC79vB0u4XWdv31UJkrGLA9Xme96ewt3O818eZRH1evcN4h9w+R9KmXk1JniQhteGr/KCx6c30O2rySRmGs3N5MZtGossQcPLI4YL/thG5LdZmkPbqGjHJzo116h3SWYjqob6VxEUgkZYOVR0/A8Hdq8f3HxVFGcv9eOLDfqU3RWPvKa9218lpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=41IlAKu+Kfg44K7rp6Quje4MpL4vWSW9IUJx3TveHsw=;
 b=AOdzkz9kKFIH2iZJqy5IqLHAPLPabr4axhW0UJi1BA0EhYrqHHEqSKnTnoQEVZfSb8NFH7ywkagCc2t9ze2pAJgztW9MVQEEGWxXnOZXj+aSETxqHY0scObqanW292INZG+JCdbpq02YZdp+zTh0GYii7Pv40yd5z2MhTT/8Vh8=
Received: from MN2PR08CA0017.namprd08.prod.outlook.com (2603:10b6:208:239::22)
 by IA1PR12MB8585.namprd12.prod.outlook.com (2603:10b6:208:451::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.30; Wed, 26 Jun
 2024 08:49:11 +0000
Received: from BL02EPF0001A103.namprd05.prod.outlook.com
 (2603:10b6:208:239:cafe::b3) by MN2PR08CA0017.outlook.office365.com
 (2603:10b6:208:239::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.38 via Frontend
 Transport; Wed, 26 Jun 2024 08:49:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A103.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Wed, 26 Jun 2024 08:49:11 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Jun
 2024 03:49:05 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Jun
 2024 03:49:04 -0500
Received: from wayne-dev-lnx.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 26 Jun 2024 03:49:00 -0500
From: Wayne Lin <Wayne.Lin@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <lyude@redhat.com>, <jani.nikula@intel.com>, <imre.deak@intel.com>,
 <daniel@ffwll.ch>, <Harry.Wentland@amd.com>, <jerry.zuo@amd.com>, Wayne Lin
 <Wayne.Lin@amd.com>, Harry Wentland <hwentlan@amd.com>,
 <stable@vger.kernel.org>
Subject: [PATCH 1/3] drm/dp_mst: Fix all mstb marked as not probed after
 suspend/resume
Date: Wed, 26 Jun 2024 16:48:23 +0800
Message-ID: <20240626084825.878565-2-Wayne.Lin@amd.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20240626084825.878565-1-Wayne.Lin@amd.com>
References: <20240626084825.878565-1-Wayne.Lin@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: Wayne.Lin@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A103:EE_|IA1PR12MB8585:EE_
X-MS-Office365-Filtering-Correlation-Id: 57367f96-9260-4b6c-968a-08dc95bcd966
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230038|1800799022|82310400024|36860700011|376012; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?50MVwXbhYcH+mMOtlraF+U+NS1Tps8c8h1wibMrrteti/QW0P0orfYunyECk?=
 =?us-ascii?Q?bdnOo0oEzTDfwyYgSI44jzbuaJRbi/KZ/njqk1T0ZsYEidAL8F86IdVYHDYf?=
 =?us-ascii?Q?JUDaT94UMc3qLLRcpMhnGjdYuQx8H9dtZJrVfmByuXlMBxhXxQmRt+CD72ta?=
 =?us-ascii?Q?kk5uFXNRKyU0VRrG9MZxe6XiPRphgIW+u73EJXkJQDOyost4pcAfq3RSnmJ+?=
 =?us-ascii?Q?6rc912vEJT2bPDHHeyB7sk1abiqUg698xV09WH8VE1gr7v+J5KkchoqRebC4?=
 =?us-ascii?Q?ExWsuQKLqI8u9CxwZh171YwgTXlcMRiP8QBO4k3KKtkSjFuaP5gu0WB2Zc6/?=
 =?us-ascii?Q?irigEK7WiWxqg4bX5yPXSC3CoLi1xvOkph8MkvVSg0w4TMALV2BjJWzPjGSR?=
 =?us-ascii?Q?VhWGO5YcjS4mhH3hoRCcP1eDY5VcpCyjxBswEv+kM1zP1Ez8X7sIuJxgh1s0?=
 =?us-ascii?Q?pB5S4PNOyK+ljg5Y8BiN/F+qAUoRR/J7dO1YB0LyN3i0nB5cr1RWsFQUx5UW?=
 =?us-ascii?Q?dlDd1+KdFAx2dKD2Wp90a02NGjhYTbLSSg8WsjMSb5cVn9Ml/ciRuLPUS28Q?=
 =?us-ascii?Q?+5PL8UPxA7unerVf8Vx7NHBTS1pqG38SS+2Dxy5kaU5zjeY2KXXSDtXqY8gP?=
 =?us-ascii?Q?3zoo6PrhcbQUd/RAdKsgPqMNbYYFIVPEbejhnvurlM/60vecxl0eftLFiuyN?=
 =?us-ascii?Q?QYvH0w1NHEXTJonIhyM/aYyjEYyKFlmsYUo5Vo/a3nQYtZZSTNKatTu27b+A?=
 =?us-ascii?Q?AQTgufNoyjCxHHVmHTkKGSvMjqtTKu4N1duZDcHirep3yQxeduJ7I0D3hNvE?=
 =?us-ascii?Q?iNMw5rpTuz88lZxZaluS4rEpBEZzgGturi1Vzh9hn3tGbokAIkAvRJQks8eE?=
 =?us-ascii?Q?AKOa6rQOlYj74OlW2ySv/WhZ2/bh8jlUeWN6w8M7vAHTSks2FdM1pnrRd1bL?=
 =?us-ascii?Q?EtjoFtNXQTdwNy091jiMuH87fpdWuTxAPflrBakbV5kOPiYX+mttSE02IItj?=
 =?us-ascii?Q?W9JIWtmgGczxEK+bHsAYaX+Nu4Fm55xOhBEQmGA6oE8KYNyu2HbDdeNlOsP9?=
 =?us-ascii?Q?0PR/DkWYd4hX7XuEHrGOwBBOf7TTTykp5CQFHdQXQQlk80vc0IRFl1Lv/KTt?=
 =?us-ascii?Q?3d5A/9IPlYqpF+VvyKYt3S5sHDYK9nswcBdyihqlWmrBtIFzbQVZxqhSSUiL?=
 =?us-ascii?Q?uFg61UJJtqUAsJPTDexM8zsP0Ksj4fQFX5Hqe7H6bjYYsHjHBWcxNMqDqe6J?=
 =?us-ascii?Q?p9bEldBM+n534njADSaCyx9jex5IEwB30IqV8HfbXv3q2jBxzyNJ3rSx2WFb?=
 =?us-ascii?Q?Wcl7/hQUMT1PVM+zr2xYCDtOFnTIxBnCxLXW3CaXjf+W8JMvZX6v+5sCwoJM?=
 =?us-ascii?Q?++D/fSz1Q+gl6P5EaXtdUfz3S5kgLdcIlSNv0ykJ9Uy5Atdgvw=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230038)(1800799022)(82310400024)(36860700011)(376012); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2024 08:49:11.2755 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 57367f96-9260-4b6c-968a-08dc95bcd966
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A103.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8585
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
Cc: Imre Deak <imre.deak@intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
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

