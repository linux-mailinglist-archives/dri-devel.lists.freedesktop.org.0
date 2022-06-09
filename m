Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2924F544403
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 08:48:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA605113D56;
	Thu,  9 Jun 2022 06:48:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60049.outbound.protection.outlook.com [40.107.6.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E03EF113D56
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jun 2022 06:48:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gFpaaDdze9dFo5fuDjU89sO92r0z8eV53c6Hhdto5mpHSiP/exAuH/peHv4wRXBw+Pgh7LplcBN7xNGsLe3REXs/TofI+eCZGse6msGkotjUEbzxVOXAWgSvYBdrZSWp2vrHnZkeLcVFgGM5bGhxXTpnhuE7l8RVbXyljZUcCGipT8sMso8YBI6VkCLR2lefNnImIs18bHg4/wol2sitK+cGdXfcVpfWSNvOhvzCiv2f6eVuWKP2D28dPZo2+ow1WusuYU4o3gKVPn8AlR6m7SSYgjx9ALLzIbwJ3z1XXNzAAcJcqkWGRLNwohuH05hRk4j6hHT8NSzMT1AyaI6PpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e9Ja4iHzUwlTLzjSz+dZ8PwOqCidA1YxM5QtwoElsig=;
 b=mXdMGCVogwW4elcEFV0aL2wGXDIJMpFOIIg1T7PUECDQgqScrSR3zd4wHXPhVyPWNa6rTtln1ZXMAV8CVpNUx0zNQCPBQHPMDWzMzqj38d7YfWqaBVw64p/T13Ia4+0H+uM6dqxE6VD7WM0r0suRFMzTj33r38WTz+orV+CSKcTGez0vuIj6jZunx6+PrlFQkpaIo57ruFj6wdsM6mH+bU6sWEbZe0F2TFbKSlF0YRkM43mqPs6IzI77eg8JO3KOiR25jiXUc2SkTlBsIL5aRY+tYtwW5LGTNX1hbnxHraR8VMhSA4Sk3Npd+R7w27EajWSfVlygG+IakbI0wQ99fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e9Ja4iHzUwlTLzjSz+dZ8PwOqCidA1YxM5QtwoElsig=;
 b=cIRQqZXWZBGEkO6jeVstc5yTxbUwJj/6QYQ37/QV3cWai4c3i01XbMaBsx9DZ4TJiyceNKMU5IQZU7cwRQVDhdGn2B41Q3VuOG45437VNMHMciIgtjLzu52boR2vZYmAGhZFSzRzRD9vYMSsbl+qde1I/DvMWkX78cNHDg9OoW8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DB7PR04MB4041.eurprd04.prod.outlook.com (2603:10a6:5:1e::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Thu, 9 Jun
 2022 06:48:04 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::3c82:f63b:711a:502]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::3c82:f63b:711a:502%7]) with mapi id 15.20.5332.013; Thu, 9 Jun 2022
 06:48:04 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH v8 00/14] Add some DRM bridge drivers support for i.MX8qm/qxp
 SoCs
Date: Thu,  9 Jun 2022 14:49:17 +0800
Message-Id: <20220609064931.3068601-1-victor.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SGXP274CA0008.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::20)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2695af9e-7389-491c-4a5c-08da49e400a4
X-MS-TrafficTypeDiagnostic: DB7PR04MB4041:EE_
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-Microsoft-Antispam-PRVS: <DB7PR04MB40411AC6AE01B6AFCB746CB598A79@DB7PR04MB4041.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DR+Y/zpeifBDI5UIoQ+jW8SHU937nNICFuPtstqEVcTM5VRfAZklncQYPsvLBUF/KaHfvboqBCPk11OGQREI+Xf2zpKWpkUNdJKVLfPA4nGpjK4Rio7uOvFEJUEWdHFDZLTAWM5Gsu9WPqm27HuLvf0Be76/atz/UCSmHPwr5SWej/EtO+uJkDFYmgUuCeGO9dq4tqY6uN/72K9P7aKWSp+V+/yCsO+flLOqX9ZCB+4O1wbYTZn3cNtvCCXUwti3SGn7h9YPnYl0b0W/z+mqvdt6y1TRqPCvHEIOvH77MB11KeK2WIa2CZ1sEhfTCIjHctf8TU/WYUIlbFoTLugN/qizRY2C83mGgZYW+IkaHAB38DMrTS1jXRs+5ULvm+WKhgD7u0TbJDRGLlUEFlwXjCJIlBuXNTpv9eMROlg1pyQZ4rdJW5fMdxU78uyugkxuz14MlsFXoRS3CWzV4bGaYKfT2BQPKWFbTSQcShUqRpO1KfWgnl3+KRndsIUFhgYoCaDfuUvS/dxZ1+MttMyz3v0N3gTQmtSVYOC1uAJGPmM1R+uThg37XCnPWLhcKqRig+cYiSE/kVb0kPgjlfG/95ZanpVRM0T43+/H0rDu6iKpx61p61FWHhk5yxQrzrR33souFgemWAiqAhYxaDE0pVsXSwAhoTBB3vVUK0W2LF8LUsXyoElSoc2FDKVhan4GZ2DYbQwzTlmPOWCw0uHgWercP9PTdjFcvZdJ98OW2B7LvkUmxOabOSHEMTwBhzVKdEG+czXD0qJuUjjt2J+FOtbkNOfYVBxIBL3d9TnNB3s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(6029001)(4636009)(366004)(316002)(83380400001)(6486002)(966005)(2906002)(66946007)(66556008)(66476007)(8676002)(5660300002)(7416002)(4326008)(36756003)(6666004)(26005)(86362001)(6506007)(52116002)(6512007)(508600001)(2616005)(186003)(1076003)(38100700002)(8936002)(38350700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QkNrbGdKdmVWdnRqSldac1hmb0pMaTltWm9vWk12U2Y1bElkM2p3aWRVWG52?=
 =?utf-8?B?ZUpDUEZ6WEJDZWp5clpDbnNac3lhcHVRbmV2Rlhoc0MwbVdRbjFrWWpaZjlJ?=
 =?utf-8?B?ZXhwNkNkL205anJLdzlqaU8rcEhlcDZyMGNpeUJNSjBWcjJaMXFhUkFoRkpF?=
 =?utf-8?B?b2xyTDc4WlVsVHIxekxYeUMvQXBpQUpMZkJETW9GckNneU5KTVpHWEFBMS8y?=
 =?utf-8?B?K1g4RUJqZEpuRXVPWVlwdGs2aVU2YlBzTXNmdUh2UGlpZ1JCVjZuQm13U1dS?=
 =?utf-8?B?MUxJdzZyMUVHYldDMlFRdWdxMzIwYUxmRVdPeVptOE5uZXdWUk1sdkVVQklB?=
 =?utf-8?B?Lzh0cHB2eEtIYnJZNE5JVWYvcmNGalhwNXAvckJkekE5WE9vdmNpMk9wTW05?=
 =?utf-8?B?MmJpYWEwNWdkM3A4OTN6NmVKc0R1dFJ3OUM0ajZUWjU0WVhwWlc4MlJSYk1Q?=
 =?utf-8?B?dXpjU1p1bWtFK0F6QnJDeS80ZHdTN0pjV0JsZ3VaN1VDK1p6SkJYS0hqNzEr?=
 =?utf-8?B?OGVVSUNqeFVDQVlwc0JWRTJ5R0RnTUtmVzlWVmZ3ek5JY2c5NkYxYzAzVlZS?=
 =?utf-8?B?Q2pDV2tMQlBDeCtORU1HTitrNVlCMkdKU0NWbHJLcmlMdkRTN3ZUaFI2QkdF?=
 =?utf-8?B?N2ZleTE0Q2JrS1RSR3o4Kzd1YWtuSEtOK1FWb2V1cy8wbkVVYTFvODNubHUw?=
 =?utf-8?B?Uld3dzZ2OHIvY21ZT1dCOGQrTkhQT2czdytwYVVNSHpTeDYrVHc5R3hoYlYr?=
 =?utf-8?B?dm1JT1NLcVFEazJ0TDNIVXgwemhJMTcxQVM4N0QrRmUybUx2bHJVbmZoVlZ6?=
 =?utf-8?B?Y1J2VjZIZk1mR0dyM2w2RzlwV2dyeGJ2SGVjSkhqczNtMUVFamMyS0JxSGlW?=
 =?utf-8?B?bDBLQ0s1dyt6RDJXcTNYTWFibE1Id0l0TCtKRVMzNDNnSCtXZ21Za0p3d21O?=
 =?utf-8?B?b1kxT0Q0UEVIWkc5NU1XY1hVMjdzdTEwTUJmbEtZcmFGa0FwWkJnQnBtNGM0?=
 =?utf-8?B?TEhXcytTd0Z2T3kvcmQ5aEpwYmhqcnVoa1VsTWNsb21JZ05URHBxV0VLTnBi?=
 =?utf-8?B?VGw1dGliN25jS250V1pqR3dHNEtVTWg1QlJkRzZoc2o0dHpqem16M0kvbGV5?=
 =?utf-8?B?WHdURGljMUN5Z2hvRzJLOC9za3hRcFhnQ1I4SDQ0WitMMGJ2cmpVWks3dVFJ?=
 =?utf-8?B?Zmt0ekJmRittNWtiV2tHNCsrMnMrZThKUHpPRjA1dG5vYko0bmUrbkU4UVlw?=
 =?utf-8?B?bUx6Um8zTU44bE9Ga25iNlhyV25sdTVRT013NzdncGlZcnZqaHhKOHZGcC93?=
 =?utf-8?B?a3pYZTM3d3dQUVZ4bVlSajlaMHJNTUQ1Q1pQZXh3T25MR2gxVlQzOWlFUmdz?=
 =?utf-8?B?dklScnVjV3dOYWpZV1FzVmpKYklTNEJoZytEaEZkSHF1RjZqNXFGU2JCZ01l?=
 =?utf-8?B?V2hhTStWTlJhaGZ5UkNxa1liRmx4Y3QxemMxWnFwaFRSb2R5bjRwSnlNbm9L?=
 =?utf-8?B?a05UcnI4N1ltbTVBaDJ4b0ZLQTNOWmJTT3daaU9LVGQwbnJYTWhxbEFkdlla?=
 =?utf-8?B?aVZHSi9DaDI0U3Z5bnIyQWtNenR5OG9lOWhVc3Q0VTZ2RytvR1pGNmxmOTB6?=
 =?utf-8?B?OXIrMEpuZTZucHdkbEVoTlQ4SnlXdHByT1B4M1Y4MnZMam5KZVpuWGhxYy8x?=
 =?utf-8?B?ODdrR29yblRZREdlaE8wWnJldGREdjJJS25jK3JUQzBsZ21yekpFci9uTEdR?=
 =?utf-8?B?MldBeE1QemlzOWFrWFdsQkNsYllBazZXWTgwMHVKNktmcEtPQ2pRUWZmTTZl?=
 =?utf-8?B?Zk1NUWdKTGhwSS9qazJWZjNSWStTdFpURXQ4UTBCNXBEd1ZyV3lIUjI3THRW?=
 =?utf-8?B?eE1kY2V0Q0V2aGNYTm9YbjM2eVlmMzZRaHhGZ1VnUzYvNDlGd3dWSTFsS3kx?=
 =?utf-8?B?VTRlZHZOTmptZTJoa203MVBZbTl0emRQc1RjY1FNTXpVeFZjN001RmNWQWx5?=
 =?utf-8?B?c1FJWDNQWlAxRUhUcHBoVFUweWlEcmdjUnFwck56Vm1WVGxRa3FkcGU0NWE4?=
 =?utf-8?B?OGdEL3JrVWhxNmxsZVErdXFFaVlVK1JjYndDYlJJT1g5bElzZU9KTUVMRDhY?=
 =?utf-8?B?ZkpwbTBxVkhuN21oWlhmWnkxZm84YnZSSk50eTdmMHZIUEVaUUkyYnJ5K3BK?=
 =?utf-8?B?cG54dFRiUjRYY0ZZcmRUclJ1R1hUV2ZPTUNVZ25qdGl6Z3FoVklkZHNBTFRi?=
 =?utf-8?B?ZGtMdE1QS3pURHlXajhKdzZLTEZWVnd5TUc4aTJlVGFTMzNaODVGZVZyR2Vj?=
 =?utf-8?B?TWptLy9TeGY2ZmJSZjBKVjVrbzRXOG9lZk5WSHJ0eFVqNG45NUF4UT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2695af9e-7389-491c-4a5c-08da49e400a4
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2022 06:48:04.1609 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ePkJ2gsQse8Bp15ADiC6wRQ/jtqi3ocsSzrfA0HD18NLl+8dea/nmzFTATptXbdAhlnAIA72oGsTcMhEakG99Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4041
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
Cc: krzysztof.kozlowski+dt@linaro.org, jonas@kwiboo.se, airlied@linux.ie,
 robert.foss@linaro.org, s.hauer@pengutronix.de, narmstrong@baylibre.com,
 jernej.skrabec@gmail.com, marcel.ziswiler@toradex.com, robh+dt@kernel.org,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 lee.jones@linaro.org, mchehab@kernel.org, shawnguo@kernel.org,
 kernel@pengutronix.de, linux-imx@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

This is the v8 series to add some DRM bridge drivers support
for i.MX8qm/qxp SoCs.

The bridges may chain one by one to form display pipes to support
LVDS displays.  The relevant display controller is DPU embedded in
i.MX8qm/qxp SoCs.

The DPU KMS driver can be found at:
https://patchwork.kernel.org/project/dri-devel/list/?series=629908&state=%2A&archive=both

This series supports the following display pipes:
1) i.MX8qxp:
prefetch eng -> DPU -> pixel combiner -> pixel link ->
pixel link to DPI(PXL2DPI) -> LVDS display bridge(LDB)

2) i.MX8qm:
prefetch eng -> DPU -> pixel combiner -> pixel link -> LVDS display bridge(LDB)


Patch 1/14 and 2/14 add bus formats used by pixel combiner.

Patch 9/14 adds a helper for LDB bridge drivers.

Patch 3/14 ~ 8/14 and 10/14 ~ 12/14 add drm bridge drivers and
dt-bindings support for the bridges.

Patch 13/14 adds dt-binding for Control and Status Registers module(a syscon
used by PXL2DPI and LDB), which references the PXL2DPI and LDB schemas.

Patch 14/14 updates MAINTAINERS.


I've tested this series with a koe,tx26d202vm0bwa dual link LVDS panel and
a LVDS to HDMI bridge(with a downstream drm bridge driver).

Marcel Ziswiler has tested v6 with two LVDS panels(single link LT170410-2WHC
and dual link LP156WF1) on Toradex Colibri iMX8X.


Welcome comments, thanks.


v7->v8:
* Rebase upon v5.19-rc1.
* Use devm_drm_of_get_bridge() in patch 9/14 due to the rebase.
* Reorder the patch for adding dt-binding for Control and Status Registers
  module as patch 13/14, as it references PXL2DPI and LDB schemas in this
  series.

v6->v7:
* Fix complaints from 'checkpatch.pl --strict' on the LDB DRM bridge helper
  driver(patch 10/14) and some DRM bridge drivers(patch 9/14, 12/14 and 13/14).
  (Robert)
* Fix complaints from 'checkpatch --strict' on the rest DRM bridge
  drivers(patch 4/14 and 6/14).
* A trivial indentation fix for patch 9/14. (Robert)
* Add Robert's R-b tags on patch 9/14, 10/14, 12/14, 13/14 and 14/14.
* Add Marcel's T-b tags on all DRM bridge drivers.
* Add Rob's R-b tag on patch 7/14 for CSR module dt-binding.

v5->v6:
* Fix data organizations in documentation(patch 2/14) for
  MEDIA_BUS_FMT_RGB{666,888}_1X30-CPADLO. (Laurent)
* Add Laurent's R-b tags on patch 1/14 and 2/14.
* Drop 'select' schema from the CSR dt-binding documentation(patch 7/14). (Rob)
* Add Rob's R-b tag on patch 8/14.

v4->v5:
* Drop the patch 'phy: Add LVDS configuration options'. (Robert)
* Add Robert's R-b tags on patch 1/14, 2/14, 4/14 and 6/14.
* Drop the 'PC_BUF_PARA_REG' register definition from the pixel combiner bridge
  driver(patch 4/14). (Robert)
* Make a comment occupy a line in the pixel link bridge driver(patch 6/14).
  (Robert)
* Introduce a new patch(patch 7/14) to add dt-binding for Control and Status
  Registers module. (Rob)
* Make imx-ldb-helper be a pure object to be linked with i.MX8qxp LDB bridge
  driver and i.MX8qm LDB bridge driver, instead of a module.  Correspondingly,
  rename 'imx8{qm, qxp}-ldb.c' to 'imx8{qm, qxp}-ldb-drv.c'. (Robert)
* Move 'imx_ldb_helper.h' to 'drivers/gpu/drm/bridge/imx/imx-ldb-helper.h'.
  (Robert)
* s/__FSL_IMX_LDB__/__IMX_LDB_HELPER__/  for 'imx-ldb-helper.h'.

v3->v4:
* Use 'fsl,sc-resource' DT property to get the SCU resource ID associated with
  the PXL2DPI instance instead of using alias ID. (Rob)
* Add Rob's R-b tag on patch 11/14.

v2->v3:
* Drop 'fsl,syscon' DT properties from fsl,imx8qxp-ldb.yaml and
  fsl,imx8qxp-pxl2dpi.yaml. (Rob)
* Mention the CSR module controls LDB and PXL2DPI in fsl,imx8qxp-ldb.yaml and
  fsl,imx8qxp-pxl2dpi.yaml.
* Call syscon_node_to_regmap() to get regmaps from LDB bridge helper driver
  and PXL2DPI bridger driver instead of syscon_regmap_lookup_by_phandle().
* Drop two macros from pixel link bridge driver which help define functions
  and define them directly.
* Properly disable all pixel link controls to POR value by calling
  imx8qxp_pixel_link_disable_all_controls() from
  imx8qxp_pixel_link_bridge_probe().
* Add Rob's R-b tags on patch 4/14 and 6/14.

v1->v2:
* Rebase the series upon the latest drm-misc-next branch(5.11-rc2 based).
* Use graph schema in the dt-bindings of the bridges. (Laurent)
* Require all four pixel link output ports in fsl,imx8qxp-pixel-link.yaml.
  (Laurent)
* Side note i.MX8qm/qxp LDB official name 'pixel mapper' in fsl,imx8qxp-ldb.yaml.
  (Laurent)
* Mention pixel link is accessed via SCU firmware in fsl,imx8qxp-pixel-link.yaml.
  (Rob)
* Use enum instead of oneOf + const for the reg property of pixel combiner
  channels in fsl,imx8qxp-pixel-combiner.yaml. (Rob)
* Rewrite the function to find the next bridge in pixel link bridge driver
  by properly using OF APIs and dropping unnecessary DT validation. (Rob)
* Drop unnecessary port availability check in i.MX8qxp pixel link to DPI
  bridge driver.
* Drop unnecessary DT validation from i.MX8qxp LDB bridge driver.
* Use of_graph_get_endpoint_by_regs() and of_graph_get_remote_endpoint() to
  get the input remote endpoint in imx8qxp_ldb_set_di_id() of i.MX8qxp LDB
  bridge driver.
* Avoid using companion_port OF node after putting it in
  imx8qxp_ldb_parse_dt_companion() of i.MX8qxp LDB bridge driver.
* Drop unnecessary check for maximum available LDB channels from
  i.MX8qm LDB bridge driver.
* Mention i.MX8qm/qxp LDB official name 'pixel mapper' in i.MX8qm/qxp LDB
  bridge drivers and Kconfig help messages.

Liu Ying (14):
  media: uapi: Add some RGB bus formats for i.MX8qm/qxp pixel combiner
  media: docs: Add some RGB bus formats for i.MX8qm/qxp pixel combiner
  dt-bindings: display: bridge: Add i.MX8qm/qxp pixel combiner binding
  drm/bridge: imx: Add i.MX8qm/qxp pixel combiner support
  dt-bindings: display: bridge: Add i.MX8qm/qxp display pixel link
    binding
  drm/bridge: imx: Add i.MX8qm/qxp display pixel link support
  dt-bindings: display: bridge: Add i.MX8qxp pixel link to DPI binding
  drm/bridge: imx: Add i.MX8qxp pixel link to DPI support
  drm/bridge: imx: Add LDB driver helper support
  dt-bindings: display: bridge: Add i.MX8qm/qxp LVDS display bridge
    binding
  drm/bridge: imx: Add LDB support for i.MX8qxp
  drm/bridge: imx: Add LDB support for i.MX8qm
  dt-bindings: mfd: Add i.MX8qm/qxp Control and Status Registers module
    binding
  MAINTAINERS: add maintainer for DRM bridge drivers for i.MX SoCs

 .../display/bridge/fsl,imx8qxp-ldb.yaml       | 173 +++++
 .../bridge/fsl,imx8qxp-pixel-combiner.yaml    | 144 ++++
 .../bridge/fsl,imx8qxp-pixel-link.yaml        | 106 +++
 .../display/bridge/fsl,imx8qxp-pxl2dpi.yaml   | 108 +++
 .../bindings/mfd/fsl,imx8qxp-csr.yaml         | 192 +++++
 .../media/v4l/subdev-formats.rst              | 156 ++++
 MAINTAINERS                                   |  10 +
 drivers/gpu/drm/bridge/Kconfig                |   2 +
 drivers/gpu/drm/bridge/Makefile               |   1 +
 drivers/gpu/drm/bridge/imx/Kconfig            |  42 +
 drivers/gpu/drm/bridge/imx/Makefile           |   9 +
 drivers/gpu/drm/bridge/imx/imx-ldb-helper.c   | 220 ++++++
 drivers/gpu/drm/bridge/imx/imx-ldb-helper.h   |  96 +++
 drivers/gpu/drm/bridge/imx/imx8qm-ldb-drv.c   | 587 ++++++++++++++
 drivers/gpu/drm/bridge/imx/imx8qxp-ldb-drv.c  | 722 ++++++++++++++++++
 .../drm/bridge/imx/imx8qxp-pixel-combiner.c   | 448 +++++++++++
 .../gpu/drm/bridge/imx/imx8qxp-pixel-link.c   | 429 +++++++++++
 drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c  | 487 ++++++++++++
 include/uapi/linux/media-bus-format.h         |   6 +-
 19 files changed, 3937 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-ldb.yaml
 create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-combiner.yaml
 create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pixel-link.yaml
 create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx8qxp-pxl2dpi.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/fsl,imx8qxp-csr.yaml
 create mode 100644 drivers/gpu/drm/bridge/imx/Kconfig
 create mode 100644 drivers/gpu/drm/bridge/imx/Makefile
 create mode 100644 drivers/gpu/drm/bridge/imx/imx-ldb-helper.c
 create mode 100644 drivers/gpu/drm/bridge/imx/imx-ldb-helper.h
 create mode 100644 drivers/gpu/drm/bridge/imx/imx8qm-ldb-drv.c
 create mode 100644 drivers/gpu/drm/bridge/imx/imx8qxp-ldb-drv.c
 create mode 100644 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
 create mode 100644 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
 create mode 100644 drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c

-- 
2.25.1

