Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 209F8694003
	for <lists+dri-devel@lfdr.de>; Mon, 13 Feb 2023 09:55:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C37A810E053;
	Mon, 13 Feb 2023 08:55:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2079.outbound.protection.outlook.com [40.107.241.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60B6110E053
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 08:55:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RalFhc2LssZ3kb+u4s62QIHaOXTdLHPDRYnd2kuA7RjuYnkxYOFUyO14GN+DLx2w+tqRoH25DZCO3cBWcDhvHFkihs5ArqFH6uSeZOmz8K+zqnxwcg0rYUSzDf3wucBZS5p78IUz1YCEUybhtcb5C8G0Tuy65Gv7ywlcUKg+vfa56tDN5Oxq5AcMcQcAu88a4boUfocQSTzjPW0cXphw+l1Y4bk1TTW+Fafm8s9FCK95U9KG1q5T6mNos4+V3Tt0i9lWCdBwLS7dfwNBKT4pSksxn5DBPN049LuS3gcnJIZI/B2QkygE5yoaXWbfpk2r1Nbh3zcCVOGr1zN7oDXMOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QJMm3IOd1DDNx9oNhC8B5KvhlUiTeQv8H4vh3lJzxAY=;
 b=hokUwqrEhMd+05jw7nF9v8Ws8903JwmbNC0Ym3EpOoJPtmEfsO0wcEwgEvOX861JFQVHBfWyIF/V5btTqbZRpcBl/UK7yj/BOgIyYFj1+klMbQNgvMap9VojGWDTUgRb82yTAagdOsKwjSbmWFhl2eapkI5MxtbDtIUYYHH7rkYy855CT72L9vIJMXxu6TWghKeoyvbCVsiQn4zzgcS2uxJQrk74PN85e/bSgJZOfbnAeATy5o65wq7SSMEvDeiXJpXblMBRIq7KoTOouiRM5DMWgVT+SIXHDrExWlZdzgI/OL/GGyjxKe9PJZvUS+1ySb0ltjP+6hpCuuNYQyyrsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QJMm3IOd1DDNx9oNhC8B5KvhlUiTeQv8H4vh3lJzxAY=;
 b=B/ok7L7eWPIRQPJ98ToElotqhRWL7AvnJGo4AO1V677wFnFu0NkefYzTo3o6oph2nrznqVrRmycCzpg8nRdrE/zSi1KDfVeO02eHTeJrua+5sd8A8slvyu+sl+FiuRmLC+kp2QOmyDWKxx1parDrxoRHpGLvgOLh72ez+4i2aZ8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by GV1PR04MB9135.eurprd04.prod.outlook.com (2603:10a6:150:26::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Mon, 13 Feb
 2023 08:55:06 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5725:92ec:f43e:f5fc]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5725:92ec:f43e:f5fc%9]) with mapi id 15.20.6086.023; Mon, 13 Feb 2023
 08:55:06 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 0/6] drm: lcdif: Add i.MX93 LCDIF support
Date: Mon, 13 Feb 2023 16:56:06 +0800
Message-Id: <20230213085612.1026538-1-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0009.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::18) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|GV1PR04MB9135:EE_
X-MS-Office365-Filtering-Correlation-Id: ec7c285b-248e-4faa-e76d-08db0da000e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0g3pMP7ZLkoZidsGlSi0rAMYcqTGcUYLGyXDANIVprbl3NH2078MO3y4q3LpJiVq5g2sRb7udwHjCbTJlR9W3SkCVmUcDuisg6CS/e6GVtTuM4NopG/lVDEt9olLwLGUTBvfwXB1srlJHtRtP3pXLxaiOchu2ITqJE8Aw31jGPyVzwl/5aGPmryKHW1sh3o0HrpE6eXdGhPZW4LOfWChZ/DfgG00g/yHW58N2jfyUoSNWVHeKgJp/1UNAzRRCAZw3AHp+dRA+gEZ/0FqFxZE5b+0ymf9KqHbn8saOBJQazY9lRiFerjZ2hfC4xLDoTkxlBJqkvkZVQS0NUtsMShLV/zUMlJzrsknbxkBEsKsRT049mYPNYMeqR9inQxQVJFl0OYTcZK0BV6UhMPIuxaKENX0yjf4nwEgHXGBSfYlkYjK093B8TPgi+bRehvy3WHTnAb/Kkajz81o2B3VHBdSmQeUwjIeJhptjgWgIkjtzQG6auoBOROlcSs5VrF/QMnm9y2cxzIMB7fWwuSSkBUhlSiPIvbqw8xDFcDPMhkV3tblryFJ5bPiQ1HI9hICZBRoYK1hc406vQBK5e8nLrLZ2hzirwm397qqqkY9GvNYBmFAA3llimxYtCGnIXzav+/6BJ44tVHoXDdAkwuNcCZukIcJzKSh/aP0/F7/vbYRY8pTifAJWOpw7cUl/wH2pkdb82WPNVU22oXGEPOkSzqgpA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(376002)(346002)(396003)(39860400002)(136003)(451199018)(26005)(186003)(86362001)(83380400001)(36756003)(52116002)(6486002)(316002)(6512007)(1076003)(6506007)(2906002)(38100700002)(5660300002)(38350700002)(478600001)(2616005)(8936002)(8676002)(7416002)(66556008)(66946007)(66476007)(4326008)(41300700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?C0wp2T5nOEkyXDYXPqkt9AFp51GB/KcJ2KCLkKowJinRMy4n908saPRin1cr?=
 =?us-ascii?Q?AxcuQwoyH52z7O4/9ujlVfUa7UhFfhdpbwiItQgUfOQHT0ulCn7RF/1ns5ad?=
 =?us-ascii?Q?uPkeqjTeCvEoANeRKoHh/HOKwedtJadI15jmitvgumutZJMlnQdat7aJRgtQ?=
 =?us-ascii?Q?Kak9jbvZbXQ9RHul/cMkwqioBesEHrmYLw5XRNZJ/paPFylJWGVse/ljgsqP?=
 =?us-ascii?Q?8dL+xiWYF17PG6HujEDMb7F/l0bts0TjwgB1UAoJ1644XuZDcJhn6J5Hgc0a?=
 =?us-ascii?Q?FuQ3bzjeUBlfnkRo/WH1d25YZNIL9c5SpSUzhWnnbcN40Xi2Vu7LTJtW9/Z6?=
 =?us-ascii?Q?tKVrrZUHntq12l8lobLfvzv8oqc/MZ7Wt7faVqwarTuKoyufLLieRGzBlcsR?=
 =?us-ascii?Q?Tt4c5V1LV1li8VN7W7TL3W3/Z95jpvhevCJDH3f+woHyZJcadWl7e7dFdWW2?=
 =?us-ascii?Q?Zf94KX70R+v5GNhJzU921IMwbjq+icANz06UClpEPLm34WaHFyno3lSPOEo2?=
 =?us-ascii?Q?ySiiYIKyBh3uTipqzxK8LAQ2PbFF8RqC5jxE0f3Bys8Xq6l/RgLM+QZuuHGc?=
 =?us-ascii?Q?9jzqU+jcltIOCYLhFGMQHZPvjIC6w0BfFhdJx0WYdCtAGX4HKrDdlHQPriUb?=
 =?us-ascii?Q?pGYBZ1WWJN74JeALFFGapDKrR2eW9kUsJN1f54SG/XGU2YNXO4s7fwudp38q?=
 =?us-ascii?Q?xCKmvGSIqTS/OBHaV7EAjIZL32m7CO/wafVwnoGT1aJqBw60A2cbgzsqEXnO?=
 =?us-ascii?Q?38I5Ww2dnSGyRRGS9RbQ7zTxYv0ZWfLvfP1QLWbLq3gVLIpmlbJPxo98Z9iY?=
 =?us-ascii?Q?Vc+5TPU/EjCHP1PTIvHwLrSIviJueRw6MMlcer4stowytoB+wUXbp5sa+EJ7?=
 =?us-ascii?Q?NwvtqpzSMwag/xAUoH93DhNMb7UhgYIWjv2jO1V0dxNRYQITz+3N0/e218YX?=
 =?us-ascii?Q?TwWaCgCMya0Jdy+ORIw0d8zF9mSebR1EAe99DmwpmfgXVSXIXltcqNbb//4d?=
 =?us-ascii?Q?UIl0XD2w2PeXeQOGCmBexEA1jmRut6r9NVas7txwzkPkW0CeB9WaQ3so6UzL?=
 =?us-ascii?Q?TpGbGRdZYn+PAgWwaM/l4IimR5d93iUS7G0C4YbhU2jTCj327Fd3OWjZlzyR?=
 =?us-ascii?Q?6JcWtcs8Exsv9f9/q0Ih2J5uWBi2JuP7c8onU/0a8HiqkbkPuzAAnUGr6OBW?=
 =?us-ascii?Q?exmwVsAGDyiUI974pirgOj5uRq3QC1G2FLz9nxk1WtBPO7x24GSDAxxsOgkx?=
 =?us-ascii?Q?KmJgIheCr9AONcfa/67yj+9ECmhBfufV0rpv6QQ8TBBMbwLoVCnLKFE/TyN+?=
 =?us-ascii?Q?unmGc7bsGbwzlvBg3K8UC5ndumuKNIwkIZlwotvfBZFuccW1LYo9pu/ZkTZk?=
 =?us-ascii?Q?WsI98f38aCHuKRWQdLenI7aH39t/OdDA/5xF5fZh1QZlvsym66EnjHMT8E70?=
 =?us-ascii?Q?ytYXl7c9hWdJkeA0ziJWezcyuBAlRXDHRM/k8PSh5SlM2QXvInH/w4J9Js/a?=
 =?us-ascii?Q?68ktHVE+6St5dhTFsq67Trs47v5qt6ylWA8PVzWJPUIfkGZYwzbiR6pyRXlD?=
 =?us-ascii?Q?K/8mWh5865r5A9uIgSQasZyxrlAYl7uNBnF13FZC?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec7c285b-248e-4faa-e76d-08db0da000e4
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2023 08:55:06.6642 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T5yeg+CCOZI3Ggq8w+tiV9NHVHHH0EH9c5AN/jLNgoR+ugVmeKYGg/ySgfCMC69gIIxd+VZ9I4Jh3UOMJWODKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9135
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
Cc: marex@denx.de, alexander.stein@ew.tq-group.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de, krzysztof.kozlowski@linaro.org, robh+dt@kernel.org,
 linux-imx@nxp.com, krzysztof.kozlowski+dt@linaro.org, kernel@pengutronix.de,
 LW@KARO-electronics.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

This patch set aims to add i.MX93 LCDIF display controller support
in the existing LCDIF DRM driver.  The LCDIF embedded in i.MX93 SoC
is essentially the same to those embedded in i.MX8mp SoC.  Through
internal bridges, i.MX93 LCDIF may drive a MIPI DSI display or a LVDS
display or a parallel display.

Patch 1/6 adds device tree binding support for i.MX93 LCDIF in the
existing fsl,lcdif.yaml.

Patch 2/6 drops lcdif->bridge NULL pointer check as a cleanup patch.

Patch 3/6~5/6 prepare for adding i.MX93 LCDIF support step by step.

Patch 6/6 adds i.MX93 LCDIF compatible string as the last step of
adding i.MX93 LCDIF support.

v2->v3:
* Fix a trivial typo in patch 6/6's commit message.

v1->v2:
* Add Krzysztof's A-b and Marek's R-b tags on patch 1/6.
* Split patch 2/2 in v1 into patch 2/6~6/6 in v2. (Marek, Alexander)
* Drop '!remote ||' from lcdif_attach_bridge(). (Lothar)
* Add comment on the 'base' member of lcdif_crtc_state structure to
  note it should always be the first member. (Lothar)
* Drop unneeded 'bridges' member from lcdif_drm_private structure.
* Drop a comment about bridge input bus format from lcdif_crtc_atomic_check().

Liu Ying (6):
  dt-bindings: lcdif: Add i.MX93 LCDIF support
  drm: lcdif: Drop unnecessary NULL pointer check on lcdif->bridge
  drm: lcdif: Determine bus format and flags in ->atomic_check()
  drm: lcdif: Check consistent bus format and flags across first bridges
  drm: lcdif: Add multiple encoders and first bridges support
  drm: lcdif: Add i.MX93 LCDIF compatible string

 .../bindings/display/fsl,lcdif.yaml           |   7 +-
 drivers/gpu/drm/mxsfb/lcdif_drv.c             |  71 +++++-
 drivers/gpu/drm/mxsfb/lcdif_drv.h             |   5 +-
 drivers/gpu/drm/mxsfb/lcdif_kms.c             | 202 ++++++++++++------
 4 files changed, 207 insertions(+), 78 deletions(-)

-- 
2.37.1

