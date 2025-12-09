Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9880ECAFDA4
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 13:03:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45BA510E0D1;
	Tue,  9 Dec 2025 12:03:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="PFIDd01q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012065.outbound.protection.outlook.com
 [40.107.200.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2382310E0D1
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Dec 2025 12:03:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rTsAOhEnfkwcxTa2jAhUMwcrxFO5wcROXxM3OLQGyMDmcgTYGLvfkPea6XkfqMUYtUzqu4cP69ZbIlWvEeCYwjQci733v83aimTBUHap8xHublBcijtn3WoW9mrMWSsG6+ezbA+7Ub4x8uYPDB28K5MCCBgqmH03KWLtDW/I7219k5N8jFcYXJonRqzw4DS7cwFhEl8fzjE69SESy0Qwlavz7p6wK369XrdG2t9Igp6pRYxJqO9XqXEguidun91tfJpoM/LX4+U+SlNu3dwVCuTGNcJ1FXPrq/GT0NfgonDekh35ISacGe6KYREiTSmq6JSNGxK87F5bd+h25Ovqcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=53OJ44h4UUNd3ZOXo2XPRtagvsNHFpVM8whXfuEX2FI=;
 b=bGuRBGWsHbIfqC65zRSVlbPn3Vq/ExWmpcw27P1YUf84zUS5dv6XrsLuThxclGhKxUGtj81nNzR5yC1sovp93uVaLm5vDdNjkk26JXYkEVuzSBxHeGz4myptMxOR+NCyqKczUVi+BFq+0qkb4FZdLC1wOGMgQTpPMVibtwxZ5Xrg/EWINAP0bbomSP63G7hcHuGXQa18O1I7tgHy+6EjWxMGyOQVDEXfS2td8Ti2oS4AV1xHuXrwlj/qms9xcVTw07peeM5gsemHEJbs+ZpSuJ8CSB7WVjp5NNao7/TR12rfmyCaKYmIzl+3lgutbQWOWSq8YUwHtJqvMUWfw3TyQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=suse.de smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=53OJ44h4UUNd3ZOXo2XPRtagvsNHFpVM8whXfuEX2FI=;
 b=PFIDd01q4IQzOOtjMJWZw8SDMNt39RQlNae5x3c7giS/x44R84hmDww4eR+qv6huBFqBr5XDcvszuXtLrzWsUeR3UZGWqa92ZSVhyHFalzu4v3oSall9Udzj8y2wfNl9CCAs3rhwvkjvA2a1XJjEiAFoR3iSpi0eEGDmTOYH4Gs=
Received: from BY5PR03CA0028.namprd03.prod.outlook.com (2603:10b6:a03:1e0::38)
 by DM6PR10MB4218.namprd10.prod.outlook.com (2603:10b6:5:222::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Tue, 9 Dec
 2025 12:03:42 +0000
Received: from CO1PEPF000042AD.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0:cafe::96) by BY5PR03CA0028.outlook.office365.com
 (2603:10b6:a03:1e0::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.14 via Frontend Transport; Tue,
 9 Dec 2025 12:03:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CO1PEPF000042AD.mail.protection.outlook.com (10.167.243.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Tue, 9 Dec 2025 12:03:40 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 9 Dec
 2025 06:03:40 -0600
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 9 Dec
 2025 06:03:39 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 9 Dec 2025 06:03:39 -0600
Received: from hkshenoy.dhcp.ti.com (hkshenoy.dhcp.ti.com [172.24.235.208])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5B9C3XBL1165975;
 Tue, 9 Dec 2025 06:03:33 -0600
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
Subject: [PATCH v10 0/6] MHDP8546 fixes related to
 DRM_BRIDGE_ATTACH_NO_CONNECTOR usecase
Date: Tue, 9 Dec 2025 17:33:26 +0530
Message-ID: <20251209120332.3559893-1-h-shenoy@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AD:EE_|DM6PR10MB4218:EE_
X-MS-Office365-Filtering-Correlation-Id: b4e555cb-e501-4fda-f87d-08de371afe6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|7416014|36860700013|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PNhp8jjWJDpPdbIebttyBeDpLYS7/ei7MnkSfzADrEixaDiQyBLzwoRzIRln?=
 =?us-ascii?Q?GQ4SMgZ7E5SLidujPntFtX7vjDNfmK/FiYWeyusav6w690Lu3FUZnC9hoyhD?=
 =?us-ascii?Q?BNWpuq1Gdg6TVMu/lFl6XpmM+z8+il0pDp/9hHhiL1Cn2ozCYTIZXoqo2KDJ?=
 =?us-ascii?Q?ijJV+rzLTbyqi9PQq+esGdBBW+5ON00buwq+K8cGx/8sbYtFopAviH+gQ1JL?=
 =?us-ascii?Q?nk9CdIGFBQCyWBHmy3M519v22Fdy0O6EiQQaj1rbWFlKLwS7eYV3C5cQhFhq?=
 =?us-ascii?Q?6hdO78PQRem37KqI1t0H/DFwn7zBANvMIP+hlfAsNIGpraBP78L+PrNcWaSN?=
 =?us-ascii?Q?bULUJQihKUCl5gpz1wegRZPy0cZbQ5pZ2BJ8NSyu1Wr0CI0iF8tPwzU1+OVX?=
 =?us-ascii?Q?8eTY347yvPABO8Vw3LT8DLUib+/m1JriahgMEIXmOpdgeegbyzZlWTknrOeu?=
 =?us-ascii?Q?XKH3oGk0PF3AXgIi3EgjOvv0qNqu4MtnY2LtlhFEYOBaeeMWxLiUxVJWcjRh?=
 =?us-ascii?Q?poPU7YFQUpMjpjMJNz/3R9Spe6OX0bbz1a/c33HqNeBC5i5lWUptYTf9LzLe?=
 =?us-ascii?Q?5GcppZuuDz0Ryl5ulCcVCiUnAur5oAQ0qS0RVtyFzdDx1FDQHmpb//xl30pS?=
 =?us-ascii?Q?A6Rth89wLo4HPvVgWUyxnQXYRo8os0uDWxbfAA9Ybio7An+F2+y7q/HShghd?=
 =?us-ascii?Q?0DVJ1+Vvxq4yqy90362jl44hWJj06XBz1VaN7kSkz4HKgPN0W1i0LGY+glIV?=
 =?us-ascii?Q?CHLbxBQNXB0BfaED7j4f99C9TDnQNcEHdgn6mqNmbtUoXIIXhVFkTrYXoDGu?=
 =?us-ascii?Q?7Lh+6AFTuv29CmdQ1x7aVGDx5eqfCrQAm5RGrSu8Cvb8sQT3m+ygITFxwDuc?=
 =?us-ascii?Q?4PBX8E7LkqBtahzndefu+CvtxeJSQOVcE+Bxeni2tLRlwxiUW4mwlUD3Pmpc?=
 =?us-ascii?Q?33e2nDtyYhhrtnDgVZnI7zs49Y38TljbhDPSH2OsfHNlDBuAjoSHFNPD0ztA?=
 =?us-ascii?Q?CbCfm4bpDjDAK2ZWJZwbyIjqfXU3rTBii5mH8nHAjCjlTBerA7OK29qH8Zaf?=
 =?us-ascii?Q?6yx4eFkOo7ERg4y4Sq8P/Kusvy/aBXA1CaNEt4/Wcy8Xl2RWFJ/M2LveaqwR?=
 =?us-ascii?Q?BpO4DQ+lxJufe2U6Ikx4LubuXIQNhhrmW/9+oHvJRp75cHdv6cjsQNo7xZ17?=
 =?us-ascii?Q?eLogRPwfvwOzYi2xUqLw+46mIEl9WHUOHbVnhKik6wGHbFXl7TN7CMqG3tsG?=
 =?us-ascii?Q?6XbmhYhvbtmaOr4E7VoNTIyYuG/5PGAYTOuxDb5Y7TN7pO655NOKh2h+awLW?=
 =?us-ascii?Q?sHfoqhlcpum4a/LpjvHwhpYYunIYr72QI3TlpxF9B7mi76eGhou8Zzrn1wDx?=
 =?us-ascii?Q?qAIFi9wYJtXBCURd5qZJFgScgU3RbQtfVoPwA3heFx0J3yvgU4enGH5CfVQI?=
 =?us-ascii?Q?WllJdnpmy8mHw5khnafvqmlo7pk/X0i+LC6vrGPedygYkd6EipPT51Su1mDW?=
 =?us-ascii?Q?Vk3NZUSYnvkVJyUJqQfKi2FJo+Y7NXL07V8Dq0N61A32Rl7PevD7YVG7RkTO?=
 =?us-ascii?Q?VcQaXaFLd0K4dZgEHDRJIv5r/TrwSYEB2Z6DFuKt?=
X-Forefront-Antispam-Report: CIP:198.47.21.195; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:flwvzet201.ext.ti.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(7416014)(36860700013)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 12:03:40.9821 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b4e555cb-e501-4fda-f87d-08de371afe6d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.21.195];
 Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042AD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4218
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


v9 patch link: 
<https://lore.kernel.org/all/20251120121416.660781-1-h-shenoy@ti.com/>

Changelog v9-v10:
-Rebased on drm-misc-next.
-Removed redundant checks on connector_ptr in Patch 1 as pointed out in 
<https://lore.kernel.org/all/9a041a93-c004-40a9-b94e-ae3fce339145@ideasonboard.com/>
<https://lore.kernel.org/all/6a696e33-b855-4fc7-8325-304a009ed001@ideasonboard.com/>
-Update commit message for patch 2,3,4,5 addresing
<https://lore.kernel.org/all/8c97c5e9-7705-4368-a3a9-45e209582c3f@ideasonboard.com/>
<https://lore.kernel.org/all/b6e44d61-7704-48fa-ba03-ba1a75e8a4f8@ideasonboard.com/>
<https://lore.kernel.org/all/add3532c-610f-4d41-92e1-1f440495f1d2@ideasonboard.com/>
<https://lore.kernel.org/all/082379e2-2d00-4f2f-82dd-cff93d2867af@ideasonboard.com/>

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
  cadence: cdns-mhdp8546*: Change drm_connector from structure to
    pointer
  drm/bridge: cadence: cdns-mhdp8546-core: Reduce log level for DPCD
    read/write

 .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 257 +++++-------------
 .../drm/bridge/cadence/cdns-mhdp8546-core.h   |   2 +-
 .../drm/bridge/cadence/cdns-mhdp8546-hdcp.c   |  18 +-
 3 files changed, 81 insertions(+), 196 deletions(-)

-- 
2.34.1

