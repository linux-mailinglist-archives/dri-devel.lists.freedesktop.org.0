Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7316D54754C
	for <lists+dri-devel@lfdr.de>; Sat, 11 Jun 2022 16:13:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5A6010E2DA;
	Sat, 11 Jun 2022 14:12:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70084.outbound.protection.outlook.com [40.107.7.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF9B210E3E2
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Jun 2022 14:12:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iv0mSe3FumFRlieH1Ob8yOZXLKIRUy2r9RKz5kp1MG/BEOBvFSbXe5CMCHr2dQcV05u61+0tZkSideM+ieu0SyslkUVmGzc5/jOJOP7/AuhBhzKG3lKW8yH+lG5NdpocFETfIIluJ1DVpbIAxKb7OWO9lG2buBDbMXPXYkoTQrlyuOUnryLAquMrWxSN+b61u4HOZ3vNCITk+0SCkCsOLQBprPwi8gsODe1/HQ5F89vKpArIu78rNcoNelc//viXCth7myHoESno8DwMrgqDjOJH4PbB1A+Z8nwspvHWen2u9Te013XyPUD9JUfjvFfx4ttpGM+qEWWjlfNgLnXT3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RnlzKRHUkUE4JvWslm540tgOSycmb2nil7cSmiDk6Xc=;
 b=aTI24uPv/c9UHTFuUOPhrbb5j1o18wki7MOd6BRKjeEWB1+WpFx+TXn/5wPeBychmrqrFfFj15wrkcpqc29pprEtpA5FqB3HmZBA7pTB6Om+yXC5TYUsSB7a0CFsyUOSyA1tukwGV3HQxS1L52MVHz84b+DdNXZWxhL74xfzLcvj5pQyuBwybbJzOwMd1uZ9d0kdaeL8a4fvy15IkPj5gjiCBBN4DuUow3JLowk9URirG8VSxckmqIbylJevqbmNM0G7cKSUQYWmPxRqPecmFvwQxdA59YI+cmxLZByZNQ4znysg16ta9nKiWSwNxIW1kQiEW3Ohdwe2COi/kgWMgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RnlzKRHUkUE4JvWslm540tgOSycmb2nil7cSmiDk6Xc=;
 b=jHxXJVIogihWiXIUeC+V5S4DHFYqB1/F5Q0FLp1Y7SkmcTpfisWTpljYkvI7E1h3tMXpohGuOFAWZnpLoIVChklrUQmbRSa18XCdgxAUkgYpq6YgW04cdvJG5S433d8oZrZ8l5DJ5lYBeizveKZXYf3ZiydmyEnPUPe24gTIPA0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DB8PR04MB6347.eurprd04.prod.outlook.com (2603:10a6:10:107::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Sat, 11 Jun
 2022 14:12:53 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::3c82:f63b:711a:502]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::3c82:f63b:711a:502%7]) with mapi id 15.20.5332.016; Sat, 11 Jun 2022
 14:12:53 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH v9 00/14] Add some DRM bridge drivers support for i.MX8qm/qxp
 SoCs
Date: Sat, 11 Jun 2022 22:14:07 +0800
Message-Id: <20220611141421.718743-1-victor.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR03CA0118.apcprd03.prod.outlook.com
 (2603:1096:4:91::22) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 72867d51-4576-4cd7-3cf9-08da4bb47969
X-MS-TrafficTypeDiagnostic: DB8PR04MB6347:EE_
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-Microsoft-Antispam-PRVS: <DB8PR04MB6347A2D59B14C23611AF9CE798A99@DB8PR04MB6347.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o4dqroBK0Q4Ya0Sr+WhHZ2ARnt5+/le8ZqGQ2lN/keAws6mUNXf17UCcKHlbO3dI4suDFvQ8Jl/VR8sbcelgt65SUpBbD/xXAeumLzTckWuzzRvkU++522pQbjgkh7HRh+bRrUSYUKsNrx3wf4ZD0DT4fNin8Wh7R91ucFR6xjFahmSNzmH0A0DwUUplTqj6GuFbJreFaXb0uCCsgXZvlr+U3Q7ONKycaeKoSHFAKyeddRwC0jLr7j+/1dJUb8f4gky+KnlW3VHGt99W5gUt8mctqMVUbNkhjIIecd40KyJAe+JpvMEw8VLxqfTWzbtkr4+zuJ7tQetkcxvO12AUYSqs6hIsLzzWMw0uEyFzy9bhF87P/UrHGmVkdEz8dD4xOWlliloVgtfh4va3oXdD8QmUHZ7gBzT09knH9/Ao0UC9j77I0dex879JtDy9ifWFr5nJB1FRRc9dPO8RG7bXTc/xp65LUbuyM5JcYRIUFc8ON7Azx6Kbw+DAPJbUxiGMIakywpUh2VrZ3WApRJMRBUboQEOTMOQrx2Zkk1VrilvkzNFW40Ho3vgriOgO9gZ1UPUvT3c0MGbk9VuQnqnOtIujo2KBKUzAQXj/FrqeMk5sBx5Gp+adlQI+Tbpf6InailOXPt0QkeUAun51LaMJzCXvqwABhm0jcZgDwirHcRbA/hZqE5oTav0TqXcvErsfPX1IRU2j1ZdO1q3cfkTnQZ0VF/pU6XsHiuXX8mPd4FoGfoTHnBw/dOHkcY5shKmDEhfNAA/Gh3JR1/9+lkEwRO09EaJMmduer2AJ58vxHXY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(6029001)(4636009)(366004)(5660300002)(66556008)(66476007)(66946007)(1076003)(4326008)(8676002)(86362001)(316002)(186003)(8936002)(2616005)(7416002)(36756003)(83380400001)(52116002)(38350700002)(38100700002)(6512007)(26005)(966005)(6506007)(6666004)(508600001)(6486002)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SFZZWTlNL3hnQ2FIVkNSQXFrUXNtMVFqRkU5T0VHOTkrYTJicWdlL01WTFNQ?=
 =?utf-8?B?dFVzN2g2Mkczbmp0S0tzREJ1Y0JNVWlMajJldWtNVjhUNlVhRzcxRGlGSTg5?=
 =?utf-8?B?ZVVQSFFTV2lFYWdFSks5REF0VXNnWW5RYk9DQlZBbFNwcjVROW9qRE1Mdnh1?=
 =?utf-8?B?SnVEdHIrNHVqRE1uanNOTW5OQndKYWRIUEUwZVVwdDFwU09YQ2xKNzlPZlFP?=
 =?utf-8?B?V2pYRnNqaDZ6U21QZXgzaXhGR2tseCtXV3FhOFh3cGtaSks2WGdoeVZ0b1pJ?=
 =?utf-8?B?UE83QVh1R2EwaTZKMHVqandpWnI3YjFRUWFjK3RwVTRFYkNNOWc4ZEpBMEtj?=
 =?utf-8?B?VmV0NENuODgzWnZpSzlWOTJHWkJMSGZoaUVNQ2xOcGF4RFRibE83c1JOODk2?=
 =?utf-8?B?Rmx3VFc1YkUrM3h0bTdSamFQajN1TU82U05Fa1VaNCs5akxtRTdMbWI2UG4z?=
 =?utf-8?B?eTBOeWMyejlxZk9CMjF3UG9QMEFYdUtoNkE4eW8wVWdsUVFSbDdsMjFhL1RS?=
 =?utf-8?B?c1Y2TCtZSDJWOWJMUTJiV1BHektOOXBLeTZPZm1IblI4V3ZSS2EvVWpmOUpv?=
 =?utf-8?B?THQzTDZJVEpteWZoREdSc29KM2dydk9IYVdtUTlBRXR3MzBOUHVINENYQU56?=
 =?utf-8?B?MitBSit0cjU5T1hOTGhLZHVod3owYktIaVY5V0hodk9zWkJxWEE2OXkxZk10?=
 =?utf-8?B?WGF2WnlTNVlqa2NRbDk1U3MzTWppRUJyRnNWSmRlUEdLZTlFcWpqYTdFcTkx?=
 =?utf-8?B?UVgyVWQ5MVJkNmNOREZJUk1kZ0JrTWU4bGZCRXhFNE9FaXFuUW9iVU5pL0gz?=
 =?utf-8?B?MEdRLzBoWkVVcGVtVmd1MlJNdi82T1dJaUsxbTVVeUtpS0p2YnRvemhmemo2?=
 =?utf-8?B?c09KUWdVYWtZU0tDZnhxYUltamttSEk5bGw1UUVCRW82ZlpYQlZsd04wNEJY?=
 =?utf-8?B?aE55d1oySjhlc3Z6aFQyeVE1M3A0T0ZSY3ExdUU3UnJZT3lFUm1tYU9BT3Bt?=
 =?utf-8?B?N2l3V0J3WXR6d3Z1VjZjSUQ2Qk1COWtORGJpUldMTU1zTDh3K1U0WFhxNldB?=
 =?utf-8?B?UGJKN1QvcnBiRFE5MG5YdjFuMWFRc2RndmlKenprUzNWc3pYRGZaYnMrNldo?=
 =?utf-8?B?bFRUSmlXWDQ0QkQvKzViL3AzOVYybkV4Zlc3OVpUZkNJelNIcjRsRVRkeUZY?=
 =?utf-8?B?THNDdW1NS083MTJvYllEc1puUWtRbGtVcWN6c1hRNi9XOVRtQ0hoamlyL05S?=
 =?utf-8?B?Z1d5bmZUTkJ0TFZacFoxTEFXdEFXVTdTZ1NwaWhacWsrTWdZd3Y2dmNnMzlx?=
 =?utf-8?B?ZS9BRE1yTllpSnJwNFlEb3RSWnFPajczZmlIS3dVRTlwQjN4UDdWVEhWV1dM?=
 =?utf-8?B?dzNONjgrT2k3YUQwRWpqelpjMXdwWkwrRjU3SmwzeEtDRGpPUmZIK0UvbS9V?=
 =?utf-8?B?YTdZZ0hWTTRQT3RielJEb2ljMTRTeFFRTkluaDd4MFNBZlJ4WGJ5SHRjcWYv?=
 =?utf-8?B?WlZIUXlleTdNb2ZwazM3bng1ell3M0FWNTg4cVdGcFRYdGNadmRSeVcraVJS?=
 =?utf-8?B?ajNSYW5Zai9yYTFQU2l1RGl0Qkg1WGtJek9ka1NJQ3VuNHNuZHVoVWpXVXc5?=
 =?utf-8?B?M2I2c29FVUxycEh3RkFxdDlsdWtFa1VBWDlWTXdvS1JldUhJK04xRng3SzYy?=
 =?utf-8?B?Y0RyS3ZZR2ZCSnRzMFBJWkVDQWlFSnhxNExYSlZSeE56VUVoVFpjZThRb2JO?=
 =?utf-8?B?OW9OTGYyWG1QU2E2ajd1cjZ1Q1hkVkdXZ0w4dHArYTY1QjVpMjZaaXA5RXdr?=
 =?utf-8?B?UUMxcmtjYjhBM2hmUjZaOEY3WndVNU5XNVY1RFN1Y3JpNXZLdWtFMXF4RWxY?=
 =?utf-8?B?alRiU3RWLytsMDVRVHZwMHJtOGtrckVGV0N2VmpHNjU1dUIrRXFqcDRvdWJN?=
 =?utf-8?B?dVlQODhVSmhnK0FwVTJjWjhrR1FwUEtoUTV1SWxMSzZMbUN4cERBRktTZDlB?=
 =?utf-8?B?ekRrKzVRc2FTa1hJMGhVenlaUW5hRnpVTkVQMmVSSDNWeHVOVDhrS215amV2?=
 =?utf-8?B?RlVYZXRlcXpCcDdObXQrT1VkaE5obTFUOTBxZHVrZmtBeG1lTUtOMzFMcm1z?=
 =?utf-8?B?KzFBdnJyM0lWQmY0VlAyS1FaZFdSVGU3ODNlSGk1YWxwYk9INk9INU9RajE5?=
 =?utf-8?B?MENqT01PVWFYRmdtSHpyYUYxODZJRGc2TGlNVk5IYXNDTDRFN3JveVJQK01V?=
 =?utf-8?B?Y3QzaUJWOS80ZHBXRzBFdWVBQ2xLM3VuOHRTNVJoblpNL01PcDRDQmZhMkhN?=
 =?utf-8?B?NENaU1ZoK0IzMm91bzF4bHNmcmwwcXF4UDdsdm5vdTNWNHcxTVBqUT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72867d51-4576-4cd7-3cf9-08da4bb47969
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2022 14:12:53.1513 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cQz9OJaPd4BQEEvuggy8o9FabxZJ2MnRp2IOPvG3McZHfXiDFyt/il13HkQc4X4MuE1mqhFJWrgBJO5OzvKH+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6347
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

This is the v9 series to add some DRM bridge drivers support
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


v8->v9:
* Make the pixel link bridge driver(6/14) depend on IMX_SCU. (Laurent)
* Add and use 'fsl,dc-id' and 'fsl,dc-stream-id' properties in pixel link
  binding. (Laurent)

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
 .../bridge/fsl,imx8qxp-pixel-link.yaml        | 144 ++++
 .../display/bridge/fsl,imx8qxp-pxl2dpi.yaml   | 108 +++
 .../bindings/mfd/fsl,imx8qxp-csr.yaml         | 192 +++++
 .../media/v4l/subdev-formats.rst              | 156 ++++
 MAINTAINERS                                   |  10 +
 drivers/gpu/drm/bridge/Kconfig                |   2 +
 drivers/gpu/drm/bridge/Makefile               |   1 +
 drivers/gpu/drm/bridge/imx/Kconfig            |  43 ++
 drivers/gpu/drm/bridge/imx/Makefile           |   9 +
 drivers/gpu/drm/bridge/imx/imx-ldb-helper.c   | 220 ++++++
 drivers/gpu/drm/bridge/imx/imx-ldb-helper.h   |  96 +++
 drivers/gpu/drm/bridge/imx/imx8qm-ldb-drv.c   | 587 ++++++++++++++
 drivers/gpu/drm/bridge/imx/imx8qxp-ldb-drv.c  | 722 ++++++++++++++++++
 .../drm/bridge/imx/imx8qxp-pixel-combiner.c   | 448 +++++++++++
 .../gpu/drm/bridge/imx/imx8qxp-pixel-link.c   | 429 +++++++++++
 drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c  | 487 ++++++++++++
 include/uapi/linux/media-bus-format.h         |   6 +-
 19 files changed, 3976 insertions(+), 1 deletion(-)
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

