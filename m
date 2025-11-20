Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0475AC73ECC
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 13:15:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B33410E73F;
	Thu, 20 Nov 2025 12:15:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="HdLCa7gx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012054.outbound.protection.outlook.com
 [40.107.200.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A3A710E73F
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 12:15:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DmxUPmp8A77l65P1xNvtItVjYuGIdBjnpzuYNHVKsjGlqO4f9tW8+g7IKLQWHy5LfG/aOiVlFucK4eDeibB07gycuflz8FRXdw5PRj/hi17VME9RWasaYx9U25ABshcvY2Cg52T13imvtHIWFElI4dYLpNpNqUCP0TPx2kGfudWpihq5VaRm5gisKN87Hph23UdG6vuFmaOiIde3BlHyp1pGAmdhE8xLR31nZ7ojasBbutXTX7pSuBX79NL5L9eiOp+pY/aPdAk/IJ3niZCfIjFTt/RTnB1lcGi6nxwL35K9sKxJFYYggw7EUKJgq2nxkJPihgIo7gE+SzheEO5rEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Yc4YFkoP3lP9Nx+SFTXAaYgOF2Sbh6D9PWkRApmxD4=;
 b=jNnqKogA6ulP8qqQ4bSVWY8wUM2su2/NzJ7Qnpk/9drsdrR5fl5N+LEv/0LaVEnfK3hqEacUBu34C1NHvchSDHw0/EU9ucjXJZq3tIM93azSEfnjFry0ir0S04hID81E0eya7f5+EqO2Ge24/VEx/fGhAgvoHTruuzVyK3qkRK7eBcr5F9CRvMdMhwu2KVgTrhTv6LouOBFWOgq0y/rs0APMsi5KRk1nio06iQZQDDdau76U9mhV/pk7dE9m+FL8EqYwN3uf+urih1Gjg6Q2DMhufja3w1UeJuhN/L2SyG6Xc1DXWSlF+b3WscSsU1+rLBx73phh5NstZKZLkerQYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=suse.de smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Yc4YFkoP3lP9Nx+SFTXAaYgOF2Sbh6D9PWkRApmxD4=;
 b=HdLCa7gxVuPBFNWISbdWKWamtG4iFzObo7VNUWjSfNCBi9g3wwZKVWlf8Lj5DaGiWK6Z8v3XDci+BSxxyyBc2uGQvhTpNqIFSWSDuarQgdrd/YdH3tzENS4Jtfec2VyuHSsZK5Pf+ifkEjrCMqMEr/opTLW6CW82k8U1j9TrJ54=
Received: from BYAPR05CA0104.namprd05.prod.outlook.com (2603:10b6:a03:e0::45)
 by SN7PR10MB7048.namprd10.prod.outlook.com (2603:10b6:806:347::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.20; Thu, 20 Nov
 2025 12:14:30 +0000
Received: from CO1PEPF000075F4.namprd03.prod.outlook.com
 (2603:10b6:a03:e0:cafe::bc) by BYAPR05CA0104.outlook.office365.com
 (2603:10b6:a03:e0::45) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.4 via Frontend Transport; Thu,
 20 Nov 2025 12:14:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CO1PEPF000075F4.mail.protection.outlook.com (10.167.249.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Thu, 20 Nov 2025 12:14:28 +0000
Received: from DFLE200.ent.ti.com (10.64.6.58) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 20 Nov
 2025 06:14:24 -0600
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 20 Nov
 2025 06:14:23 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 20 Nov 2025 06:14:23 -0600
Received: from hkshenoy.dhcp.ti.com (hkshenoy.dhcp.ti.com [172.24.235.208])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AKCEHDt3636470;
 Thu, 20 Nov 2025 06:14:17 -0600
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
Subject: [PATCH RESEND v9 0/6] MHDP8546 fixes related to
 DRM_BRIDGE_ATTACH_NO_CONNECTOR usecase
Date: Thu, 20 Nov 2025 17:44:10 +0530
Message-ID: <20251120121416.660781-1-h-shenoy@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F4:EE_|SN7PR10MB7048:EE_
X-MS-Office365-Filtering-Correlation-Id: eb613f9b-3e15-485a-8a8e-08de282e5aa5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|36860700013|82310400026|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NsY8At3P4AI6JUy7qs73n/Uu5efp2ujfao74DIE6L9hFxeQwOyegpQUrE+dI?=
 =?us-ascii?Q?ygGBwYBBD9GGOfpMgNMvBnB0DcqzzRqZNtDv1SszJfbDW9BIxqxYW2FKRXDU?=
 =?us-ascii?Q?UgT0R0BUpdWnjMs7TFHt7Dr5h3TzRzguPvP5/mAvs6FKMa5QUlNVzAimtWND?=
 =?us-ascii?Q?bG3yPfQgm0GGr86E/g/tM7LDNCCfln8e/XOlqywz1McMnLFJtHe8KXZ3brHR?=
 =?us-ascii?Q?V9npoi/osJVwtZ4yqr3NmnLc4aUoH4G2H1j3z/hMPvNA2sp9wEr7bMoGvgPN?=
 =?us-ascii?Q?dura1OgCxw889M0jah/lpmateYvSurt4jelOoeAqgOrXJFuHbP3pmnilChRP?=
 =?us-ascii?Q?c52c7FqjGrSKLXR4vraKuTg7MA5BwOLvgPUX4hy1xlpgxIL2t79zuj/Z14iB?=
 =?us-ascii?Q?+vJ9orPxCCB1dbTBYzjeewMvhOZSZwlg6Jge8WwtI55qyVWi4590KU9sIwFx?=
 =?us-ascii?Q?w2BhTkSYTwLSf6mgQY0OSOgm1vC6yTGp6UzENLw2ipk5yYcBmbnngLUUMfKg?=
 =?us-ascii?Q?Iw/g/fQXqZwaz5/6/AX+qc0WyIGrxoFcSn/pUXFu5IbhGe7+7PVLZ7mznv03?=
 =?us-ascii?Q?VOR1aMz9ZR38fxmaGWkCgdEZhz4deml7fQ6Gs3GX8imNdVsTBIrZznzlAMs9?=
 =?us-ascii?Q?G1p9cSWJ6w07y4bLQofSeDVh33gViFh2tDtZI50EjsjFNtFwytgeiePzDC9w?=
 =?us-ascii?Q?QHSytvhMNSvDqEiXSRd4Gx9+ox48Jn9YzJxpcguYGo8wpGRXD/7RXi9O+5n1?=
 =?us-ascii?Q?zUjhwAUSw5JH/4KtNjNClL/OlaUS0ypzj3W9SucZ8/sLXyUE4Qwi/6Pg3tA3?=
 =?us-ascii?Q?bRSdU+UZUEvFzpyNGX49CJ6no+vDedAhD/fMNIWD5yQvJVkXfyKk0DbVwkEo?=
 =?us-ascii?Q?Sbh4dgEkxFtExQeMi6afP6nxNVZPifa3pnBTA4AByvyxbiShP+IPxvw+T4QY?=
 =?us-ascii?Q?SrTxP+orInmA5XK0DItHTOCYN65P4zLy04Gwaolr8TqhidZTe4Zip2klVI4N?=
 =?us-ascii?Q?WORWUNjXFuPHoav81lNElwcfhePVVMHO+AO7F0rT8b2S5B1r7gmI7RLJh24m?=
 =?us-ascii?Q?hZh7a8mT07jEoZvQLQdHuizbW0VHuhhTx/7FZHM4X70TzFUKJX+UZ2dlGD4T?=
 =?us-ascii?Q?ZVlU+N0nkCXu7qickM/tePdEC4SeNvQceFfhLWQqj58LeRc9fYHbwaN6GM2x?=
 =?us-ascii?Q?z72LYkJxFkqEdLol3906CPC/1nJIf2iIjddpbkP6CFNZoBLYOFMEycHo9zzZ?=
 =?us-ascii?Q?AZ9IbyimmWcuqudxZGz7c12lWpqCkdFrURmo3q9BIFXDT4IUEBNMF0rmKErZ?=
 =?us-ascii?Q?zxi614SIbAxTq+F9I0kZAsDJ54wIb7lu8DxUUR5ZvSxd0xuPgwgMlAN65pS6?=
 =?us-ascii?Q?74I/OUl2O/5TaLpSw2zlrEjv22GKCMqx5ELqc99UyJgZjiyFFgblFUELW2Hs?=
 =?us-ascii?Q?yrXArguiE4E0X91ej+rwYWGHHT5JSUgiYLB0QTeMi+rsnM8lybpg8e2djnSJ?=
 =?us-ascii?Q?Brd+JMS0bkH3QTAVqR2pctaHvdV2TdW0+2/L56XzzUA0zSuFaNaDdjj6fO02?=
 =?us-ascii?Q?zXhvvNXvmuAu/1g9ngMzu2Y7qncRf7dt06fyvu8B?=
X-Forefront-Antispam-Report: CIP:198.47.21.194; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:flwvzet200.ext.ti.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(36860700013)(82310400026)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 12:14:28.6990 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb613f9b-3e15-485a-8a8e-08de282e5aa5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.21.194];
 Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000075F4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB7048
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

With the DRM_BRIDGE_ATTACH_NO_CONNECTOR framework, the connector is 
no longer initialized in  bridge_attach() when the display controller 
sets the DRM_BRIDGE_ATTACH_NO_CONNECTOR flag. 
This causes a null pointer dereference in cdns_mhdp_modeset_retry_fn() 
when trying to access &conn->dev->mode_config.mutex. 
Observed on a board where EDID read failed. 
(log: https://gist.github.com/Jayesh2000/233f87f9becdf1e66f1da6fd53f77429)

Patch 1 adds a connector_ptr which takes care of both 
DRM_BRIDGE_ATTACH_NO_CONNECTOR and !DRM_BRIDGE_ATTACH_NO_CONNECTOR 
case by setting the pointer in appropriate hooks and checking for pointer 
validity before accessing the connector.
Patch 2 adds mode validation hook to bridge fucntions.
Patch 3 fixes HDCP to work with both DRM_BRIDGE_ATTACH_NO_CONNECTOR 
and !DRM_BRIDGE_ATTACH_NO_CONNECTOR case by moving HDCP state handling 
into the bridge atomic check inline with the 
DRM_BRIDGE_ATTACH_NO_CONNECTOR model.
Patches 4,5 do necessary cleanup and alignment for using
connector pointer.

The rationale behind the sequence of commits is we can cleanly 
switch to drm_connector pointer after removal of connector helper 
code blocks, which are anyways not touch after 
DRM_BRIDGE_ATTACH_NO_CONNECTOR has been enabled in driver.

The last patch make smaller adjustment: lowering the log level for
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

