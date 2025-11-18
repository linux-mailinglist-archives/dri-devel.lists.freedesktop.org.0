Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1A1C69332
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 12:53:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90EA910E488;
	Tue, 18 Nov 2025 11:53:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="FcZVe8pt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011062.outbound.protection.outlook.com
 [40.93.194.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6E6D10E490
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 11:53:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o75W5UzKfepq/0LrnPuiFH3OvMeDzIvGvFQS4lQOEXmnKniDDLw0VehjKfPrBkWBvzHQyWtbE2JoWn0to4BkpGJNwfhEVOV7l9wBg//2DPwiEMDSpQWral13OMvw39k0ZVpsDZ+fw0ddqh0x0YCOQiOABs2DcvcxnWEhl2sFlpkMg67JmVkJP79rzvJcF+31aumXhGMxOnGOCJemnYj6NxZ+zHq7gTa0X6UB6E86ZIqp+ROozTh0JFLFb/2CXTyaG+W2AoO7YixObR/JQcQwhpu2rW5Hj17XKMJBzexX+hJtWicPcVfuKc8Gi6E/Qlm8Bo+vjSWrn5wdc/E55ZcHCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R9RKSW2tkIdVNl3aQlVV2LJDJIMefAA2+OlrMbK9dSo=;
 b=UkNQbxMyppfpvrKswLTw338b8DJtpZ5vvK+q7b60PQQLNgq+x0JVBq35MDNTw2OO1L5vsh1IIXacdlScpOM3gVnBn+xiucA6b8udqbHl7aRO8VGFJh6bQBRH+K1BoRtc9WTXh/VLCRtCLdXxwvqjk4ybuXyAY9tong/WquKrQd0zqrdqmijGw0w2EiLUdmgojyVEi/uov8Q1fXDBxdPxsDbds8Z1cPnzxUQxKGU8eNgHd52ZOp257K2kM4Msx4cZhKetFiMv/AvieQzrmXlo9IdqETKVKu4iU1yni8A5U2mZP73k+omegGoWQf+XNMZ78t52Z5qx7d3h2g6RltTVwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=suse.de smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R9RKSW2tkIdVNl3aQlVV2LJDJIMefAA2+OlrMbK9dSo=;
 b=FcZVe8pt2tbCZEdMatisV/1rglT/ZzdiSeJRI0zzG1fREXB5eWdRmfZbIjG09kqLGxKbhd6znNGw0DGLP7baMK9NZk4pclZeJb6Nhq4PDa+16848s7dAwXzKIV4KWPqVg995bX7HUSd2c7t5QDsJEPi1Hs/UA6Ut8Zn9Fivhpr0=
Received: from BL0PR1501CA0028.namprd15.prod.outlook.com
 (2603:10b6:207:17::41) by CY5PR10MB6024.namprd10.prod.outlook.com
 (2603:10b6:930:3c::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Tue, 18 Nov
 2025 11:53:09 +0000
Received: from MN1PEPF0000F0E3.namprd04.prod.outlook.com
 (2603:10b6:207:17:cafe::a4) by BL0PR1501CA0028.outlook.office365.com
 (2603:10b6:207:17::41) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Tue,
 18 Nov 2025 11:53:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 MN1PEPF0000F0E3.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Tue, 18 Nov 2025 11:53:07 +0000
Received: from DFLE206.ent.ti.com (10.64.6.64) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 18 Nov
 2025 05:53:03 -0600
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 18 Nov
 2025 05:53:03 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 18 Nov 2025 05:53:03 -0600
Received: from hkshenoy.dhcp.ti.com (hkshenoy.dhcp.ti.com [172.24.235.208])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AIBqulN006869;
 Tue, 18 Nov 2025 05:52:56 -0600
From: Harikrishna Shenoy <h-shenoy@ti.com>
To: <Laurent.pinchart@ideasonboard.com>, <airlied@gmail.com>,
 <andrzej.hajda@intel.com>, <andy.yan@rock-chips.com>,
 <aradhya.bhatia@linux.dev>, <devarsht@ti.com>, <dianders@chromium.org>,
 <dri-devel@lists.freedesktop.org>, <javierm@redhat.com>,
 <jernej.skrabec@gmail.com>, <jonas@kwiboo.se>,
 <linux-kernel@vger.kernel.org>, <linux@treblig.org>,
 <luca.ceresoli@bootlin.com>, <lumag@kernel.org>, <lyude@redhat.com>,
 <maarten.lankhorst@linux.intel.com>, <mordan@ispras.ru>,
 <mripard@kernel.org>, <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <s-jain1@ti.com>, <simona@ffwll.ch>, <tomi.valkeinen@ideasonboard.com>,
 <tzimmermann@suse.de>, <u-kumar1@ti.com>
Subject: [PATCH v9 0/6]  MHDP8546 fixes related to DBANC usecase
Date: Tue, 18 Nov 2025 17:22:49 +0530
Message-ID: <20251118115255.108225-1-h-shenoy@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E3:EE_|CY5PR10MB6024:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ebb609d-83cc-413c-bd63-08de26990a23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LAEdZ/69CSiFXnuvOXBDryqNSkHDFSDEGrp8RMP0maIqXhjsSOiTsRbvh1/I?=
 =?us-ascii?Q?2SZbwoTukGa9boIw2Hs4QBR2r+jJwqSjsYQW5TNTOyeW2KEvjkvv6E9Wv9/G?=
 =?us-ascii?Q?66SAn935BFdX8pw1BiAzKgF5GKIaHYLUsrfaF3YY1aS7aSfM9JFfERs5nJkT?=
 =?us-ascii?Q?0lIdn35sfY9TlGTn0sAci3YIDuNS/7SfRApjznYdj+RTBY1Z1UmVvIphL1hp?=
 =?us-ascii?Q?miA/sF0nvxhGDNk549yMklIOSppnpXZ8LKvOC6Nz+iwh0m7mA6hbwu+gBKPg?=
 =?us-ascii?Q?K6l324wBDFyay952w1qwNBUqQ6MmGtKhWxlG2Za6V2Z1byxp8vQOYuleJ2jI?=
 =?us-ascii?Q?Ah6DGaomVZ3QDC6GsqJ3hALu08MCt+ZKVkvLRpbkHQm11nDMe6vzy4apJAAi?=
 =?us-ascii?Q?nfU+wn+lmoF0vkba2g7LYCta+6560PSvQFRWpWf8ASLChWIZdm6qdBY3V7H/?=
 =?us-ascii?Q?GV7RyyYPVaFfi+V+g9QBHv5p7NwGCLclFid10Vqun+nZ5OjmVHSwWTgUbJ6+?=
 =?us-ascii?Q?/MKUOVwa8+A1KvhMhUYdcTOhJvMd17qcmP0ZuDrNx3ZIyzDVHAWlAUVwO3dI?=
 =?us-ascii?Q?aVqGJF0whePhXQe1uuOZo603TfRvE1revzYEvabjS0+f26Y+WhfYjb4du6Z6?=
 =?us-ascii?Q?oh220Z3T48Q4RcHZ5A6pVGKMoF/PtR4c63x5SpD7FkwRACw45Sdm2XaNkKyo?=
 =?us-ascii?Q?IKsqX3jBJx+w566FPsK9Q6gOQkbSrx9B1szsofYXUW4hBFsZZGSPS7ewVrIo?=
 =?us-ascii?Q?Mq8nNyVT0RaDM5w664naP7s/kPESgbH2EofjC5LxXkFgVPURT2VxZMFGO5J8?=
 =?us-ascii?Q?GyWLou73Bt9E6s2t8S2iVuQcJ2nKG15WnEjYka4UzVmUuDNxV1ZSA3jIeh3H?=
 =?us-ascii?Q?SI5h/cZpi9gTsY+7Zvrd6PmRX3ptcS74bdrXJDbt15HEf9revvVqyI1iKQ+y?=
 =?us-ascii?Q?UwgqeWlttrS8f3JIhgqgw9JCpIH5tgqfcAHfWOfzo2JaG35Z1omntaZULeH0?=
 =?us-ascii?Q?QiWceoqIBTR+yXeyjg1Wzb18sbC90R79Jzr5lfgDvYhj2eA4tq4MCHy5rUUl?=
 =?us-ascii?Q?/7VNRxzLhO/4vYMWYahpIf/8XoFMBh595NnXac7ARxKsNbtq3nZzpZKfbEa4?=
 =?us-ascii?Q?nLR4I1Lsjs6vMoEKjk+lRAIbWvMtDRrwqAyndVGPQ/kB17ocCVG6ZpvWy/aw?=
 =?us-ascii?Q?L3sVJQsCWXG/dF6TnXaLDCAzleJuNTFrDar9iwck0JEdw1V8Lae6VocKCgZ5?=
 =?us-ascii?Q?U6odT5BOn1OVas0uRx2DHd+JwC3DrAnESIBYiAC+uR/xBxLuJSR8obCBK9sx?=
 =?us-ascii?Q?Mu3EHoUTF+cAwnu5tnc6yaHmRL3+BnlExuvPs71oQgpns1s8906It4eDZx+h?=
 =?us-ascii?Q?OMPytnlzzvEtzGd+9RcnHPA6a39+ueEQdkrYiWAwygmeIoenJPrcyQmO8LEw?=
 =?us-ascii?Q?PJDBKoWiRIxleP6L8/5D2pRX2JyLXoKtZ+2zsFtzXo5G4x83oU+PosdwxxVt?=
 =?us-ascii?Q?lvgyfcZZp/cEJ4yTPIlIdXsdRtB80jeLdRnfMarhrgo4bEZO+Et3rXGUcBSU?=
 =?us-ascii?Q?UR//k125HVxLavEBj++iUZPARd0DIgnVXq1k9ZjZ?=
X-Forefront-Antispam-Report: CIP:198.47.21.194; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:flwvzet200.ext.ti.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 11:53:07.4148 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ebb609d-83cc-413c-bd63-08de26990a23
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.21.194];
 Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0E3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6024
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

With the DBANC framework, the connector is no longer initialized in 
bridge_attach() when the display controller sets the 
DRM_BRIDGE_ATTACH_NO_CONNECTOR flag. 
This causes a null pointer dereference in cdns_mhdp_modeset_retry_fn() 
when trying to access &conn->dev->mode_config.mutex. 
Observed on a board where EDID read failed. 
(log: https://gist.github.com/Jayesh2000/233f87f9becdf1e66f1da6fd53f77429)

Patch 1 adds a connector_ptr which takes care of both 
DBANC and !DBANC case by setting the pointer in appropriate hooks
and checking for pointer validity before accessing the connector.
Patch 2 adds mode validation hook to bridge fucntions.
Patch 3 fixes HDCP to work with both DBANC and !DBANC case by
moving HDCP state handling into the bridge atomic check in line with 
the DBANC model.
Patches 4,5 do necessary cleanup and alignment for using
connector pointer.

The rationale behind the sequence of commits is we can cleanly 
switch to drm_connector pointer after removal of connector helper 
code blocks, which are anyways not touch after DBANC has been 
enabled in driver.

The last patch make smaller adjustments: lowering the log level for
noisy DPCD transfer errors.

v8 patch link:
<https://lore.kernel.org/all/20251014094527.3916421-1-h-shenoy@ti.com/>

Changelog v8-v9:
-Move the patch 6 in v8 related to HDCP to patch 3 and add fixes tag.
-Update to connector_ptr in HDCP code in patch 1.
-Rebased on next-20251114.

v7 patch link:
<https://lore.kernel.org/all/20250929083936.1575685-1-h-shenoy@ti.com/>

Changelog v7-v8:
-Move patches with firxes tag to top of series with appropriate changes
to them.
-Add R/B tag to patch 
https://lore.kernel.org/all/ae3snoap64r252sbqhsshsadxfmlqdfn6b4o5fgfcmxppglkqf@2lsstfsghzwb/

v6 patch link:
<https://lore.kernel.org/all/20250909090824.1655537-1-h-shenoy@ti.com/>

Changelog v6-v7:
-Update cover letter to explain the series.
-Add R/B tag in PATCH 1 and drop fixes tag as suggested.
-Drop fixes tag in PATCH 2.
-Update the commit messages for clear understanding of changes done in patches.

v5 patch link:
<https://lore.kernel.org/all/20250811075904.1613519-1-h-shenoy@ti.com/>

Changelog v5 -> v6:
-Update cover letter to clarify the series in better way.
-Add Reviewed-by tag to relevant patches.
 
v4 patch link: 
<https://lore.kernel.org/all/20250624054448.192801-1-j-choudhary@ti.com>

Changelog v4->v5:
- Handle HDCP state in bridge atomic check instead of connector 
atomic check
 
v3 patch link:
<https://lore.kernel.org/all/20250529142517.188786-1-j-choudhary@ti.com/>

Changelog v3->v4:
- Fix kernel test robot build warning:
  <https://lore.kernel.org/all/202505300201.2s6r12yc-lkp@intel.com/>

v2 patch link:
<https://lore.kernel.org/all/20250521073237.366463-1-j-choudhary@ti.com/>

Changelog v2->v3:
- Add mode_valid in drm_bridge_funcs to a separate patch
- Remove "if (mhdp->connector.dev)" conditions that were missed in v2
- Split out the move of drm_atomic_get_new_connector_for_encoder()
  to a separate patch
- Drop "R-by" considering the changes in v2[1/3]
- Add Fixes tag to first 4 patches:
  commit c932ced6b585 ("drm/tidss: Update encoder/bridge chain connect model")
  This added DBANC flag in tidss while attaching bridge to the encoder
- Drop RFC prefix

v1 patch link:
<https://lore.kernel.org/all/20250116111636.157641-1-j-choudhary@ti.com/>

Changelog v1->v2:
- Remove !DRM_BRIDGE_ATTACH_NO_CONNECTOR entirely
- Add mode_valid in drm_bridge_funcs[0]
- Fix NULL POINTER differently since we cannot access atomic_state
- Reduce log level in cdns_mhdp_transfer call

[0]: https://lore.kernel.org/all/20240530091757.433106-1-j-choudhary@ti.com/

Harikrishna Shenoy (1):
  drm/bridge: cadence: cdns-mhdp8546-core: Handle HDCP state in bridge
    atomic check

Jayesh Choudhary (5):
  drm/bridge: cadence: cdns-mhdp8546-core: Set the mhdp connector
    earlier in atomic_enable()
  drm/bridge: cadence: cdns-mhdp8546-core: Add mode_valid hook to
    drm_bridge_funcs
  drm/bridge: cadence: cdns-mhdp8546-core: Remove legacy support for
    connector initialisation in bridge
  drm/bridge: cadence: cdns-mhdp8546*: Change drm_connector from
    structure to pointer
  drm/bridge: cadence: cdns-mhdp8546-core: Reduce log level for DPCD
    read/write

 .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 258 +++++-------------
 .../drm/bridge/cadence/cdns-mhdp8546-core.h   |   2 +-
 .../drm/bridge/cadence/cdns-mhdp8546-hdcp.c   |   8 +-
 3 files changed, 72 insertions(+), 196 deletions(-)

-- 
2.34.1

