Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1138A9A5A9F
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 08:45:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7817110E16F;
	Mon, 21 Oct 2024 06:45:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="l6ZT3RVM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2076.outbound.protection.outlook.com [40.107.241.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8044C10E16F
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 06:45:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X5x9yKY8uVylWs9uni2MpIup1q8pnZGEGWa7YWoxliQkauFjVjtxhuxpiiJ3/KQiLIxKTLXd2CNezgf9EiMrtcxId2DPC8xYY769RH3T6GvV8plU25E7ZcG5VdZevsQ4sQ1W2piHYAccV9vd6KZpyiZ23Ds5ThQKS4j4GFYoN0GpLgzwhzuJrusQ8tPlWsGs9GFzSmA7PYKE0XxWxWg2a00EEQVC996GTBeaU7z0WGAQ98kQw6fxs/pQnTmXOA6qnYF/b+tWzxK3Kk8r8/vKppOZOsr9KQvwtfpjHDmCRsQKw1A/PzP0Bze90jjipzWWLFlz/TbPTLi6ZjQPzFWBMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WAfBL0l33Dq84zoaNWNXyTfrvxRZ8jzvmch1quz4PSM=;
 b=vxOnFxUaAf5Bd1sDOaGcad+uyaNUkHiNH8mef7cIhiMVeICsahHayGX9XCOVYXi/dqo34+LM1kCqjbs3vxs4IZmh/ouxu2QYTRURciKqL3mSha1eNC8zAAXd2ICfoQJdAIWGxXO4ygrP4+c/b1c3t5Gslf657cSd3wzFEkVWqOLQsC6KWswEkRAZ22OqLNywZBLcuJlvFIRygoklg+Ic4G+vTbRhBMVsSTEhIIZ4YPlTKRq1U4MozKnuXpEHasj0G+VcasMsior9mdBvWBui9oPz1uzb3MbHeUXTSjFBFw1dEwsFNGy3+FAq5F2V0bTtnMxxeHczCiJ6D58VLR1oOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WAfBL0l33Dq84zoaNWNXyTfrvxRZ8jzvmch1quz4PSM=;
 b=l6ZT3RVMSUd9Wq2UZ0k4as0mnGuCLY+FUnYqNm7+sPAVQ9CiI1bqScGpYlOCqmm1E52M9NGE151epUF/QODBrhLr7ohuacgrPQEOrbIdEAOrLEJyXu+7mZTJHy1oS8sSFdvoJASr4PW5mMZS2dhChJ+sOve2gUiarQnhjWhEuDouPi5YWCvOVLPRFxBuJC378s7Y8j9DFCogZbjuR/4xbDXZdDJPzHkIIMMIfNecYKEPZrF7y3SvIgrUO4Cd1d/VIQF4u+xMFLkwJ+SzX8qjbOPvCqOHS6LQgShkHxddrAvdIDoGMLD874c0f0AmiC/B7CRgDkneRXCDESiKM/2RVg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM9PR04MB8440.eurprd04.prod.outlook.com (2603:10a6:20b:3df::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.21; Mon, 21 Oct
 2024 06:45:18 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8069.027; Mon, 21 Oct 2024
 06:45:18 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 quic_jesszhan@quicinc.com, mchehab@kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 catalin.marinas@arm.com, will@kernel.org, sakari.ailus@linux.intel.com,
 hverkuil@xs4all.nl, tomi.valkeinen@ideasonboard.com,
 quic_bjorande@quicinc.com, geert+renesas@glider.be,
 dmitry.baryshkov@linaro.org, arnd@arndb.de, nfraprado@collabora.com,
 thierry.reding@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 sam@ravnborg.org, marex@denx.de, biju.das.jz@bp.renesas.com
Subject: [PATCH v3 00/15] Add ITE IT6263 LVDS to HDMI converter support
Date: Mon, 21 Oct 2024 14:44:31 +0800
Message-Id: <20241021064446.263619-1-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0111.apcprd03.prod.outlook.com
 (2603:1096:4:91::15) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM9PR04MB8440:EE_
X-MS-Office365-Filtering-Correlation-Id: cae83db9-a753-4fb6-1fa6-08dcf19becf3
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|1800799024|366016|7416014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6tBjzE6myQHLQPTCYY+VVzvo+WWackGQwERFHkS7zkY92E8ZhgGawwUlxsKp?=
 =?us-ascii?Q?SHwgOCHi+o9Bn9HZblBAQ87OifWaTRRXBi7xi2p6j+QM2v+/ZtVbBVRMtuKj?=
 =?us-ascii?Q?t0y1kuZsuizQJniA+0F96lfqnsEth1dZjvK2wgZZRQWMarTG9mVo1b40HuPd?=
 =?us-ascii?Q?87jAlhaC61hxfhx4D7kSmqWDTylyt6bx8T5A0kafJtuKhUMXvG7lfftGXayJ?=
 =?us-ascii?Q?Fj1v4llJUXGbG/b931GmuNOKrgPvI7AQHpBxZSRoaT/D0NTkA2/Qs9wWVdJO?=
 =?us-ascii?Q?X9JhqS8PtXBNeZXDzvtHEZyRmiNIiou55XUPi0WqTgP9kx8dugWv7kO5JURg?=
 =?us-ascii?Q?u+MZWLANMq0X2Mpmi3w+RAtdfJmrt9A5NjK2UC0RbhfX4dIay7PSQPfH5bsp?=
 =?us-ascii?Q?s16gxo+bN3BqHcZGw0Tc+wkmcFb2fkz/dJjayRR+nftHwazJixJxLmwj/FZS?=
 =?us-ascii?Q?Heot3Q3cPZFGbF0A2oy/LhEIl7O+HGQENqTNWLM7fLKOWjYSMfGQHqZmFtTI?=
 =?us-ascii?Q?jVx7g//iNpMfXaFp0TvFNadEdLfo1weZUpmPB6A0bnMtTZGWVGEr3X0Vz2OM?=
 =?us-ascii?Q?nEpFZX6P2OVagnicbYq4tgU2wfQogWR6c/DgycAZxNi5iNdp47F/vRoaBPae?=
 =?us-ascii?Q?aTchPg6npgYHdJ7KN/+3UbM/82RmJZO7ziXTHi2H9aGKiEwmSV9zB0rD7n2/?=
 =?us-ascii?Q?Ogzv9hlGaRgrEQQbU14YTcHxIgedBGC/plVIc37lc1yNTcDnqyfQcpW5IgLt?=
 =?us-ascii?Q?FhaVoPiYrVVA9kXP+66gPtY0pMr4/h1TO91vjflfB01D24If1SHLUMIT/R7H?=
 =?us-ascii?Q?ZWOclyWldXitfSYFKgc5aCkuSY8rKM7UZvnsonUneO/SPuicJ8CbKM1rqXPm?=
 =?us-ascii?Q?4mjsANZrc7xmH+ryNIuU79+/h3t9DYT4QDsIawWytDo9hmm6BPlVenjkJIwS?=
 =?us-ascii?Q?dpb4o8BTPgYxOsnOZqsU9HadabSXwA5qFc/pw3BA+qsjKO7c02LVa3h6lRfB?=
 =?us-ascii?Q?3zLVf0Dk7GFGTqynLQgMVKfKdwVZwmj78UWDNIgUqct6deofZ/HaKBbJD5CF?=
 =?us-ascii?Q?L7ahwkiLxDctxHFh8Zy1FGXH67lVIniVYni+qPvQjksM0ZHnO+tS2+6AjFvx?=
 =?us-ascii?Q?JgQG2dJqZrX/5AQ0/mbBmXyVxQ764JIaRL3GzwuBtPVVHw3LMJESWoR+Px3H?=
 =?us-ascii?Q?vTAJMojCafdx3BVicF5MMnP4eUIZ1wxKB/wJAmWd8vwqeiHVuEyaON9M2MgW?=
 =?us-ascii?Q?ucF/FQ9gtKBCPxtD4M2m778oP8CDdtONDQ3bHvlLQWZgASosbuDi1rr8J/6u?=
 =?us-ascii?Q?wqp1jxLDk047FQbeORabIoDENlyZOTuqrBbGFVsKWDtLYs9joxfIZXiwJLJx?=
 =?us-ascii?Q?L/pXfm09uGWTkQ7SYEEzhJJYwly/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(1800799024)(366016)(7416014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?74AyLm/d6y6uOwqpycSBOOZeawkZzJU9D/dv2lL96H4ECCuIkkYuPAONUK5i?=
 =?us-ascii?Q?zBJNcXrj3LByYHfL4BzHEZuPNeayXnxAZ5V5QRRUBkzCbbUPsYsUB2TrnpK3?=
 =?us-ascii?Q?Qdjk0Mz7pSSaqo73uGDrkfhlpKUnAqzyyiVyP1Jt44cN4WLz/fftoKvS+0Pl?=
 =?us-ascii?Q?xT67mUjdqJKbDYsRDL3QvnYYRBjsQ2Re/wRtJdzNEd5jlEXPiaGJ4wrd8e/6?=
 =?us-ascii?Q?W2E87L0IGkJ0xRjBCOXW7gWGGg5lEsmOrUI0HSEf8tvp1ZniBb4Go/DD8D8S?=
 =?us-ascii?Q?hbM6EB4kwh92CKssrXNXxcZxkBG1OKivmxKa3cHI3Zavow9QZyksjmhDwSbd?=
 =?us-ascii?Q?Mi7KcNMJERR/1gpkZEHM7lfB0SA9EcJo4/KjrKJqtJEAWH4fleaFPUkTq8jE?=
 =?us-ascii?Q?sVr8KmoZKfJ8DNtrcpcSl8875xvplD1zGN7ox79m5WZiT1I+/fmeIO3BwaiF?=
 =?us-ascii?Q?zzocqRN7TqckZ+5Et6/IKevqgCiPuch58b74LOBCwwc4N68lOzkd17RTd+af?=
 =?us-ascii?Q?D4nZVZL1LAPU7zH6NS8yrwZCLH9U9aneFd978tuBgSc4Ubx7WP7BbFcgjubM?=
 =?us-ascii?Q?m0CA7ZZFCsibNQPkD6Ixl3f3p0gtDj174MP5vfasdMDwp9Ahurf0oqeUK4OG?=
 =?us-ascii?Q?kxq42mGvGG90vVGrBcBD+FetH6ujjhh/7siVabiZfnavuM5k464HOV7yDmtQ?=
 =?us-ascii?Q?yqFVBeXo7DtsS8v+ZgmTOFUYzk7NKw92PqB+STXsi/P9NLzhy0SWlkAji7Fc?=
 =?us-ascii?Q?8Y+B0WXAOG3dNfJiYbDDi+eYd/h5rxhMCzvNJ9e7c1nnIDc+hAQd6wm7UGkG?=
 =?us-ascii?Q?QXj8NhLyrw7G99N5jvPdn9wTD7NmcAkIUCPXEMsw40jExb3y+e5fH64tLgRQ?=
 =?us-ascii?Q?BkCZ3ZjmtJp8iAHPYKFWlJKnvHtF/sjPLXozcei5Ct6yBQBvLED8cFmt3pao?=
 =?us-ascii?Q?ifM3AgGEEot1YlQHm3TNMEa5eMIh6+CP7Aqq6ycgf4sc8jalkjFsCD18nnc+?=
 =?us-ascii?Q?g2leiZ0AG37DPKSGsjSyhhLrgTv6dhaiGCYemeP1QbkzbUKBojTnE5lQgz0Q?=
 =?us-ascii?Q?R6luR7GEFsjmBTiURrXm3beJ7nMDRj/oswFrBMXW6kekwOawSV4hEuIMQqJw?=
 =?us-ascii?Q?apWHDo6PFUbQHVjktoww6/op+WrTj7mP8N4rFbR3v317tlIAsiQWDVy/T8wx?=
 =?us-ascii?Q?GfSWeNu1DhYlxG6AFRJZNW2dezanyoOmC5/BB3wziryO2LDNwcFO2kIpZ93O?=
 =?us-ascii?Q?t4kuJroJLSdGyrBnNnGa+dT+2C8HGyKF2mfwpAIcLJ6iugP6dsnpOoQe22Et?=
 =?us-ascii?Q?i8FjswdNlJ8deM1OvRl+GPXk6S7UxCSfkcPXVOJDy8SnQ+qeVrzkh1oDhkJS?=
 =?us-ascii?Q?h/gO37pkxR36nSvl3jGI9AMUf85LIrVoTOPJnv30w+FJBhbI/d/V+mQqpWKu?=
 =?us-ascii?Q?lopDTljcGzMXFgEUxrmtOsY+23BD3/HBkQnAKWMUOWBjo82yToGd/A/12jK5?=
 =?us-ascii?Q?pdsTREAxKH1AVrDMMWgy/L70OClgatcMpc3irVgU+JRzKU0sZ2G3OwNaTnLY?=
 =?us-ascii?Q?nulk7zNxeAfiqTKXNVwJV12r3eJ2kh1elQrD761B?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cae83db9-a753-4fb6-1fa6-08dcf19becf3
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2024 06:45:18.0171 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DeIMYyOBRHdOeEPi6X/N1/tIr6gKPEWIZfZsrypSorDLETReCj3PEoELoKRatBwinLOg7/D5Vk/7vMPk41GenA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8440
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

Hi,

This patch series aims to add ITE IT6263 LVDS to HDMI converter on
i.MX8MP EVK.  Combined with LVDS receiver and HDMI 1.4a transmitter,
the IT6263 supports LVDS input and HDMI 1.4 output by conversion
function.  IT6263 product link can be found at [1].

Patch 1 is a preparation patch to allow display mode of an existing
panel to pass the added mode validation logic in patch 3.

Patch 2 allows i.MX8MP LVDS Display Bridge(LDB) bridge driver to find
the next non-panel bridge, that is the IT6263 in this case.

Patch 3 adds mode validation logic to i.MX8MP LDB bridge driver against
"ldb" clock so that it can filter out unsupported display modes read
from EDID.

Patch 4 adds MEDIA_BUS_FMT_RGB101010_1X7X5_{SPWG,JEIDA} support, as they
are supported by IT6263(with LVDS data bit reversed order).

Patch 5 makes drm_of.c use MEDIA_BUS_FMT_RGB101010_1X7X5_{JEIDA,SPWG}.

Patch 6 supports getting dual-link LVDS pixel order for the sink side as
needed by IT6263 driver.

Patch 7 documents jeida-30 and vesa-30 data mappings in lvds-data-mapping.yaml,
as needed by IT6263 DT binding.

Patch 8-10 extract common dual-link LVDS display properties into new
lvds-dual-ports.yaml so that IT6263 DT binding can reference it.

Patch 11 adds DT binding for IT6263.

Patch 12 adds IT6263 bridge driver.  Only video output is supported.

Patch 13 adds DT overlays to support NXP adapter cards[2][3] with IT6263
populated.

Patch 14 enables the IT6263 bridge driver in defconfig.

Patch 15 updates MAINTAINERS to add maintainer for IT6263 driver.

Note that patch 3 depends on an in-flight patch[4].

[1] https://www.ite.com.tw/en/product/cate1/IT6263
[2] https://www.nxp.com/part/IMX-LVDS-HDMI
[3] https://www.nxp.com/part/IMX-DLVDS-HDMI
[4] https://patchwork.kernel.org/project/linux-arm-kernel/patch/20241017031146.157996-1-marex@denx.de/

v3:
* Use assigned-clock-rates DT property to set pixel clock rate for
  "multi-inno,mi1010ait-1cp" LVDS panel in patch 1 instead of using
  panel-timing node.  (Marek)
* Drop the patch for fixing pixel clock rate for "edt,etml1010g3dra"
  LVDS panel because there is already another better patch[4].
* Collect Dmitry's R-b tag for patch 2.
* Define MEDIA_BUS_FMT_RGB101010_1X7X5_{SPWG,JEIDA} in patch 4.
* Use MEDIA_BUS_FMT_RGB101010_1X7X5_{JEIDA,SPWG} in drm_of.c in patch 5.
* Add drm_of_lvds_get_dual_link_pixel_order_sink() in patch 6.  (Dmitry)
* Document jeida-30 and vesa-30 in lvds-data-mapping.yaml in patch 7.
* Extract dual-link LVDS display common properties(patch 8-10).  (Dmitry)
* Reference lvds-dual-ports.yaml in ite,it6263.yaml in patch 11.  (Dmitry)
* Add data-mapping DT property in ite,it6263.yaml in patch 11.  (Dmitry, Biju)
* Allow data-mirror in ite,it6263.yaml in patch 11.
* Drop ite,lvds-link-num-data-lanes DT property from ite,it6263.yaml
  in patch 11.  (Dmitry, Biju)
* Use HDMI connector framework in IT6263 driver in patch 12.  (Maxime)
* Control the missing HDMI_REG_AVI_INFOFRM_CTRL register in IT6263 driver
  in patch 12.
* Validate the maximal HDMI TMDS character rate in IT6263 driver in patch 12.
  (Dmitry)
* Get LVDS data mapping from data-mapping DT property in IT6263 driver
  in patch 12.  (Dmitry, Biju)
* Validate 30bit LVDS data bit order by checking data-mirror DT property
  in IT6263 driver in patch 12.
* Use drm_of_lvds_get_dual_link_pixel_order_sink() in IT6263 driver
  in patch 12.  (Dmitry)
* Initialize a bridge connector instead of open coding in IT6263 driver
  in patch 12.  (Dmitry)
* Add a comment that IT6263 chip has no HPD IRQ support in IT6263 driver
  in patch 12.  (Dmitry)
* Use devm_drm_bridge_add() instead of drm_bridge_add() in IT6263 driver
  in patch 12.  (Dmitry)
* Fix a minor build warning reported by kernel test robot in IT6263 driver
  in patch 12.
* Use data-mapping DT property instead of ite,lvds-link-num-data-lanes
  in i.MX8MP evk DT files in patch 13.  (Dmitry, Biju)

v2:
* Add more comments in fsl-ldb.c and commit message about pixel clock
  rate validation for patch 4.  (Maxime)
* Document number of LVDS link data lanes in patch 5.  (Biju)
* Simplify ports property by dropping "oneOf" in patch 5.  (Rob)
* Add AVI inforframe support in patch 6.  (Maxime)
* Add DRM_MODE_CONNECTOR_HDMIA in patch 6.  (Biju)
* Rename it6263_reset() to it6263_hw_reset() in patch 6.  (Biju)
* Check number of LVDS link data lanes in patch 6.  (Biju)
* Add ite,lvds-link-num-data-lanes properties in patch 7.
* Update MAINTAINERS.  (Maxime)

Liu Ying (15):
  arm64: dts: imx8mp-skov-revb-mi1010ait-1cp1: Set "media_disp2_pix"
    clock rate to 70MHz
  drm/bridge: fsl-ldb: Get the next non-panel bridge
  drm/bridge: fsl-ldb: Use clk_round_rate() to validate "ldb" clock rate
  media: uapi: Add MEDIA_BUS_FMT_RGB101010_1X7X5_{SPWG,JEIDA}
  drm: of: Get MEDIA_BUS_FMT_RGB101010_1X7X5_{JEIDA,SPWG} LVDS data
    mappings
  drm: of: Add drm_of_lvds_get_dual_link_pixel_order_sink()
  dt-bindings: display: lvds-data-mapping: Add 30-bit RGB pixel data
    mappings
  dt-bindings: display: Document dual-link LVDS display common
    properties
  dt-bindings: display: panel-simple-lvds-dual-ports: Reference
    lvds-dual-ports.yaml
  dt-bindings: display: advantech,idk-2121wr: Reference
    lvds-dual-ports.yaml
  dt-bindings: display: bridge: Add ITE IT6263 LVDS to HDMI converter
  drm/bridge: Add ITE IT6263 LVDS to HDMI converter
  arm64: dts: imx8mp-evk: Add NXP LVDS to HDMI adapter cards
  arm64: defconfig: Enable ITE IT6263 driver
  MAINTAINERS: Add maintainer for ITE IT6263 driver

 .../bindings/display/bridge/ite,it6263.yaml   | 249 +++++
 .../bindings/display/lvds-data-mapping.yaml   |  31 +
 .../bindings/display/lvds-dual-ports.yaml     |  76 ++
 .../display/panel/advantech,idk-2121wr.yaml   |  14 +-
 .../panel/panel-simple-lvds-dual-ports.yaml   |  20 +-
 .../media/v4l/subdev-formats.rst              | 156 ++-
 MAINTAINERS                                   |   8 +
 arch/arm64/boot/dts/freescale/Makefile        |   8 +
 .../imx8mp-evk-imx-lvds-hdmi-common.dtsi      |  29 +
 ...8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtso |  44 +
 ...imx8mp-evk-lvds0-imx-lvds-hdmi-common.dtsi |  43 +
 .../imx8mp-evk-lvds0-imx-lvds-hdmi.dtso       |  28 +
 ...8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtso |  44 +
 ...imx8mp-evk-lvds1-imx-lvds-hdmi-common.dtsi |  43 +
 .../imx8mp-evk-lvds1-imx-lvds-hdmi.dtso       |  28 +
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts  |   6 +
 .../imx8mp-skov-revb-mi1010ait-1cp1.dts       |   8 +-
 arch/arm64/configs/defconfig                  |   1 +
 drivers/gpu/drm/bridge/Kconfig                |  11 +
 drivers/gpu/drm/bridge/Makefile               |   1 +
 drivers/gpu/drm/bridge/fsl-ldb.c              |  55 +-
 drivers/gpu/drm/bridge/ite-it6263.c           | 906 ++++++++++++++++++
 drivers/gpu/drm/drm_of.c                      |  82 +-
 include/drm/drm_of.h                          |   9 +
 include/uapi/linux/media-bus-format.h         |   4 +-
 25 files changed, 1834 insertions(+), 70 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml
 create mode 100644 Documentation/devicetree/bindings/display/lvds-dual-ports.yaml
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-evk-imx-lvds-hdmi-common.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-lvds-hdmi-common.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-lvds-hdmi.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-lvds-hdmi-common.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-lvds-hdmi.dtso
 create mode 100644 drivers/gpu/drm/bridge/ite-it6263.c

-- 
2.34.1

