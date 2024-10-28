Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E72B9B22D5
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 03:38:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1BF010E313;
	Mon, 28 Oct 2024 02:38:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="QwlTV6aC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2055.outbound.protection.outlook.com [40.107.104.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F30B10E313
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 02:38:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=plsLCHPd8gNMg5HOIjSLqn3BG5lyxYimWFrCP78yIy1Q1nTEbBT2Wf424tyS9JB4iG8KmGAQGMMyX4vEhg2DEJHRVy/12xXZWtdOnzWVfJyC9O4H9AEFEh0rqxFyWBHle3Zfa8fKt1XPzHS9qqkeb7IJYTiX1xIcaVWavazbCCms3qx23OWrZqG2Cc8HklSoG5YZj5sTLUP1Ji+RgCd2V9bSY5957tuEYPVdbY21baJI9fjJxz0nN61ysx9hfQ4R3DO/PjukKPSRdFJCisBPBRN5qLijkTy5upYtupGBjxA2VBPZZdJEMNbf4n4zfFHTHJGiCPtrAJ8Vh0KXbHnHEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gsHYWnqsqCYo2zUAlKCSCDTGJk3v3JgbNMR2isutsQI=;
 b=KL8lvf9AeHuzP23/VwHYQaJAfs4Itd8yX+NTN/z2S1I2escCDyWcpeC6b5Ta3hMTpGNPPUvpGPcDVpT37wRZ0VEoTBAUx4KJPfcypo6CH4TK4Ce7QROUX/T26wdUSBXjpcOI+CnnZd+vuBvQPcJw12kn5TqyPO3O1YsV6aejiF4+lHB5El2OnPzQsKgOY5hHcv3M0t9TBC8SLKKYUiACzsCLAmuk92JaADaWdTb86sjlLW4BkWqVmfotilIvz9tgBibcgxeKf1r1rPr270hotzQDHW56rBb8mJ81U9PHgqBYhY+Kvk3Q1Il5dZ9LFXWIKnSl6VFuGI9AlBYW14xRDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gsHYWnqsqCYo2zUAlKCSCDTGJk3v3JgbNMR2isutsQI=;
 b=QwlTV6aCRP+FB2S94zI2+x3eYokS9RETGSGsowyeSgbTHekaaSMhdCAUaNSzqLlBLwfW09JnTFPeTbIaZ8EGBNDVkZ8nAqxtROWQ8Th0WgTt0wh0t2DSYikwyEFOMNqdkafxTBveTxRjeP3xajNvW0UN3Ow4D5HQNuTyPZflw8BUV3OjF7AhCehzmb0kGFQZzkvXvN/bDB2hlD1DBCM2U0jhH3IgF2okzXMNA3jermB9J3kn1KCO9toAFod5M4skWdzrybkn4QHNYy5NK42frSiRNg7Vrt0Bi0yIt9ODUWfo7gh9/WrlYjHP9/tLB9i2nkK5WJrI1sgt0A0jnM3Qzw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DU2PR04MB8709.eurprd04.prod.outlook.com (2603:10a6:10:2dc::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Mon, 28 Oct
 2024 02:38:29 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8093.021; Mon, 28 Oct 2024
 02:38:28 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 quic_jesszhan@quicinc.com, mchehab@kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 catalin.marinas@arm.com, will@kernel.org, sakari.ailus@linux.intel.com,
 hverkuil@xs4all.nl, tomi.valkeinen@ideasonboard.com,
 quic_bjorande@quicinc.com, geert+renesas@glider.be,
 dmitry.baryshkov@linaro.org, arnd@arndb.de, nfraprado@collabora.com,
 thierry.reding@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 sam@ravnborg.org, marex@denx.de, biju.das.jz@bp.renesas.com
Subject: [PATCH v4 04/13] media: uapi: Add MEDIA_BUS_FMT_RGB101010_1X7X5_{SPWG, JEIDA}
Date: Mon, 28 Oct 2024 10:37:31 +0800
Message-Id: <20241028023740.19732-5-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241028023740.19732-1-victor.liu@nxp.com>
References: <20241028023740.19732-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0002.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::16) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DU2PR04MB8709:EE_
X-MS-Office365-Filtering-Correlation-Id: 88aaa3af-ee95-481e-d5c7-08dcf6f99aed
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|366016|376014|7416014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ExaN8Tqeq0OWXZ0K+DOaYEWXQbESiA7uNwYG+w4fotvfIT2y5fzrdc6r1Ftz?=
 =?us-ascii?Q?0xp6xE9ZJVQkhbCAmv33wjMrc6dkuNxTaUq8fbjfiTyA/qxzn1soIo2hBZiW?=
 =?us-ascii?Q?+EPcSGS5c7nxwPD7tqNCwk1L7xc5r/WRVEQPDSK0qX50ctUvVRMwugBYVtDQ?=
 =?us-ascii?Q?OyVk7j2B9To5/3rFWo2HAk4FBFvLGZr6yakwp1QIXBTDsRj+qx7AZZcdPbK1?=
 =?us-ascii?Q?9GTK/VSqjZVVopKv/89SGQWz+OS5e8DsDKrpt5zWvAA1QYUswDXLuEoeRarS?=
 =?us-ascii?Q?lA0p9qySreOg9xZgh+efXhxjMwkw1vOiYyVQ3pqpFtN2WQk2hiz9qTX5D43X?=
 =?us-ascii?Q?WIo4dBRjKMoJgYVZFtBRCzx8NJ5W7ZrWORm1f72cjeY7LLTdlAV/u+iPMc35?=
 =?us-ascii?Q?gnRf2xt1snpzCHuv1eHshUgVl3hk2gav7iKkWyY9nvW4G/goC3YmNmON5NLI?=
 =?us-ascii?Q?7VJSi4vfKh9lkqm2WIb/GL0g2YMox0e/u2AePFeu3Opv+cSpDw0/Q8B6fiSl?=
 =?us-ascii?Q?v7KbKf9pj9OeuCgMrVWa0yp7S0kgqL3GpLIKzOibIW/bLObD2bA1cwy8hgQ6?=
 =?us-ascii?Q?stX/mzIXd/jJsNgshwIFl4/E/25/PqCVeKf12L1znsGAowrVxYOQM2pakOCw?=
 =?us-ascii?Q?hb6dYtJ6MA+6hDZu3w9gH/Bh6DCaa2GNPVJ1IudukAPPcoWuzz34ppQ617oz?=
 =?us-ascii?Q?v5Hkwc15Zf3t/EdkHMvVnNe1PXkoUCDbIKBsb0t6jIpVeKKSk3AmCwebtfqo?=
 =?us-ascii?Q?0Gy3Pg2es3xLfdKKxrG4TtqmjAt5o0+HPbfwgjZ3oNPAroyk+ljl95FICFkS?=
 =?us-ascii?Q?PNRsoiM7cZF1VlFwFWT085o4TYqkINLn7WzzFrd7+ZhlztS92z8F7AU6NrHt?=
 =?us-ascii?Q?13Rd4e1wW3AAYDgEwddn70JCrzkytXzj2lz1AsJlty/w619qoalDXWxmiD8Z?=
 =?us-ascii?Q?12ldGOdyz0F2q3NcoEYMLOJ09diafhd5FMi4kBNKRXdy60Qt9XpvBuyka6XR?=
 =?us-ascii?Q?6sh579GRWLXoHt7IrqnX4CGxteAHa6Trm2sUg3SN48+Kp9Ns5duXJ70YgLHK?=
 =?us-ascii?Q?9m7gqsmbJtQVjKioPiGCqZ0kx+rnl38vkyP4L/fDD7dcPqhIw9OBq/dvOvKQ?=
 =?us-ascii?Q?m+OVqVn81PLubhmYrUMNbdePdQJpYAmpc2KJMeFwfgF8ZzB1oXGa8DwGtcKo?=
 =?us-ascii?Q?DPmx+1NdX2a9i8Xd3uC/xo65fKGRwdlt6yF++loEw/lheT44rQz0vi7lCA5Z?=
 =?us-ascii?Q?chGuoGdFrfu2Dn9dt6EUW8KMsmPHXOnr43j9taIoD2Vk5soKY4Ta157GKlzV?=
 =?us-ascii?Q?w48wxlHdRaTJfcNDyn7rJAkwgGmnnYSkzPFobruyfdttnmgRhR/j1e5hmaEj?=
 =?us-ascii?Q?Q6rZTUs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(366016)(376014)(7416014)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0TNWN9m45/z4xmS74AhvTtkCzC+cf4pG+PG3dhUFAhRrkfjm7VaF/DnWsxg0?=
 =?us-ascii?Q?4aZ/h0MQPLa2eLwCSYrThOtPSyMsfLuQoUYl0ZzFsAab0qFgbGb7XOrIk/po?=
 =?us-ascii?Q?jhdFsTjHwwkLk5x6Eq4LbUA5LzlN7lDBnGo1o0JYbgViMVFpW7V5mdiD5ovC?=
 =?us-ascii?Q?Lb6elrfKdp0cyiGkKW9MZve1YzxYXXD79/1WaN86yj68g0LCKOeVxY622xS1?=
 =?us-ascii?Q?ndQUF+DZxkI1a5xZi6Yxi866zEfCG0Wsv1oj6ydc9zyPtbV6zqcJ0yNYPoXA?=
 =?us-ascii?Q?4XILoHBICY7h0tgoFv4cgbynXLWj3EEDTyQFV9lC1CvyzOlxQMr3jMq4TQSc?=
 =?us-ascii?Q?Sh7JqArB8yJs291jfdrHbki4K/u8WhNef9hxBbUNIdCH0Q2ThcCTB0+P3r7C?=
 =?us-ascii?Q?6fCncrrkVSoDQzOwQ9Au+gQxqB80AyM6xb0TdSftwUxFTe0fEvqPYeKYhmXY?=
 =?us-ascii?Q?SjhFnCDp/mWxKP9Rl5gsuwQFDc6nJ2TXr1FsLgVI4wHuyuSBLviEYJRI6nGr?=
 =?us-ascii?Q?1bGwsD93pCQla6/H14KYDM/ZBDS76mRPXFO9xpo0WM8Uu+lGZETC1yErMXw5?=
 =?us-ascii?Q?S3PR1ukc8F7FCu4pmRtH6GGAxSOy8Cp/JzG1NfZ/5xMrrTqrJtJeHbRFeqpm?=
 =?us-ascii?Q?kZbaSooKkpxwA3Glx9IprkVaKBB1Jp07kUmqOrPOWTVQvJY+o7oYcK+vQZKV?=
 =?us-ascii?Q?j/tcncsT7oaHGpt9uUYttZFvnxgWtzulT049mwq8jQg8gVfx3eJaYaEgfoBP?=
 =?us-ascii?Q?lB7i1qsYckTCXolkW9G/q6n+XF6jAA+aGvEb+DRKL5148t8uB90oqsD63txu?=
 =?us-ascii?Q?kLKoAuYo3DTtYuCLSUeGDG0hGSl6LPE0LgAFAlpqxTytb4EtodwpqLlnlPA9?=
 =?us-ascii?Q?eKvhLUnCQFcDKuQlHf6MbNnOl95gr3Yi2BY2oipWB6QAfNDqFWAQyBCqbL4i?=
 =?us-ascii?Q?LkfX//TypvmkZBWVrHt9RdkaWqtRQnPOVMF3MxGDLIQwwHKW+vJaov+JynZ+?=
 =?us-ascii?Q?Y/ZJKvXhZGPm2bQMNv3futm6PaNhrT3MyJbQ6MUruXwmg3bz5wyrfmmrpzLe?=
 =?us-ascii?Q?SgrZmviqaXBmLGcr+tpZtfSk6EhMEiKx1YGpyUJg5H4bWckrQ5oCSge9jall?=
 =?us-ascii?Q?66c/QLLRnb2R9V451yLekUjh9PHhX9fJqy0afB27xjS9rWc4I9/LLAMfEq2H?=
 =?us-ascii?Q?6RwSLNkOFjM5xJRu58rwFuNULBuaGRLGq3ZOEEKrs8JXUsnsd/MlBrYv7jGR?=
 =?us-ascii?Q?qMUH0B2EXDVp1pFAgsbffg4/Y4t5/SE8XNr5HPNeS00pYQqbp7XN8ifHkgZT?=
 =?us-ascii?Q?hatTHXMIsUPRBaENrdjSLA5asCp9g9sMI+utQQXiz1s1togyGKEoYMy4NjgJ?=
 =?us-ascii?Q?B0cSeT5pWOZHuPvi9UZv8JRgTERoFROoOtrUx6o/4PUG+g79guCILeKOr6xV?=
 =?us-ascii?Q?2ACJLF1T38T0BfiBvOgG+wZXGiV6+rOvIfaEvTX/BvB21miGA3Jfxc9qhTnA?=
 =?us-ascii?Q?LXqWq0QjKCyIrOzcfcbvcvVTyz5COKPG/SQcXWlFADfD1jAk5AFOnICWwZ2x?=
 =?us-ascii?Q?rLpq5X0IfsutfyBjHPq4f/AO1Hakrgmd6hbxXEsT?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88aaa3af-ee95-481e-d5c7-08dcf6f99aed
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 02:38:28.8840 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9ZmyM1497oX4cVTfitf6HF4JJ44HJ1FB1P8oSYS9zgl6BrOH11eZs/skRr6l3tySL+FjE/Fh5+G3+Uh8gCixtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8709
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

Add two media bus formats that identify 30-bit RGB pixels transmitted
by a LVDS link with five differential data pairs, serialized into 7
time slots, using standard SPWG/VESA or JEIDA data mapping.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v4:
* No change.

v3:
* New patch.

 .../media/v4l/subdev-formats.rst              | 156 +++++++++++++++++-
 include/uapi/linux/media-bus-format.h         |   4 +-
 2 files changed, 157 insertions(+), 3 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
index d2a6cd2e1eb2..2a94371448dc 100644
--- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
+++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
@@ -2225,7 +2225,7 @@ The following table list existing packed 48bit wide RGB formats.
     \endgroup
 
 On LVDS buses, usually each sample is transferred serialized in seven
-time slots per pixel clock, on three (18-bit) or four (24-bit)
+time slots per pixel clock, on three (18-bit) or four (24-bit) or five (30-bit)
 differential data pairs at the same time. The remaining bits are used
 for control signals as defined by SPWG/PSWG/VESA or JEIDA standards. The
 24-bit RGB format serialized in seven time slots on four lanes using
@@ -2246,11 +2246,12 @@ JEIDA defined bit mapping will be named
       - Code
       -
       -
-      - :cspan:`3` Data organization
+      - :cspan:`4` Data organization
     * -
       -
       - Timeslot
       - Lane
+      - 4
       - 3
       - 2
       - 1
@@ -2262,6 +2263,7 @@ JEIDA defined bit mapping will be named
       - 0
       -
       -
+      -
       - d
       - b\ :sub:`1`
       - g\ :sub:`0`
@@ -2270,6 +2272,7 @@ JEIDA defined bit mapping will be named
       - 1
       -
       -
+      -
       - d
       - b\ :sub:`0`
       - r\ :sub:`5`
@@ -2278,6 +2281,7 @@ JEIDA defined bit mapping will be named
       - 2
       -
       -
+      -
       - d
       - g\ :sub:`5`
       - r\ :sub:`4`
@@ -2286,6 +2290,7 @@ JEIDA defined bit mapping will be named
       - 3
       -
       -
+      -
       - b\ :sub:`5`
       - g\ :sub:`4`
       - r\ :sub:`3`
@@ -2294,6 +2299,7 @@ JEIDA defined bit mapping will be named
       - 4
       -
       -
+      -
       - b\ :sub:`4`
       - g\ :sub:`3`
       - r\ :sub:`2`
@@ -2302,6 +2308,7 @@ JEIDA defined bit mapping will be named
       - 5
       -
       -
+      -
       - b\ :sub:`3`
       - g\ :sub:`2`
       - r\ :sub:`1`
@@ -2310,6 +2317,7 @@ JEIDA defined bit mapping will be named
       - 6
       -
       -
+      -
       - b\ :sub:`2`
       - g\ :sub:`1`
       - r\ :sub:`0`
@@ -2319,6 +2327,7 @@ JEIDA defined bit mapping will be named
       - 0x1011
       - 0
       -
+      -
       - d
       - d
       - b\ :sub:`1`
@@ -2327,6 +2336,7 @@ JEIDA defined bit mapping will be named
       -
       - 1
       -
+      -
       - b\ :sub:`7`
       - d
       - b\ :sub:`0`
@@ -2335,6 +2345,7 @@ JEIDA defined bit mapping will be named
       -
       - 2
       -
+      -
       - b\ :sub:`6`
       - d
       - g\ :sub:`5`
@@ -2343,6 +2354,7 @@ JEIDA defined bit mapping will be named
       -
       - 3
       -
+      -
       - g\ :sub:`7`
       - b\ :sub:`5`
       - g\ :sub:`4`
@@ -2351,6 +2363,7 @@ JEIDA defined bit mapping will be named
       -
       - 4
       -
+      -
       - g\ :sub:`6`
       - b\ :sub:`4`
       - g\ :sub:`3`
@@ -2359,6 +2372,7 @@ JEIDA defined bit mapping will be named
       -
       - 5
       -
+      -
       - r\ :sub:`7`
       - b\ :sub:`3`
       - g\ :sub:`2`
@@ -2367,6 +2381,7 @@ JEIDA defined bit mapping will be named
       -
       - 6
       -
+      -
       - r\ :sub:`6`
       - b\ :sub:`2`
       - g\ :sub:`1`
@@ -2377,6 +2392,7 @@ JEIDA defined bit mapping will be named
       - 0x1012
       - 0
       -
+      -
       - d
       - d
       - b\ :sub:`3`
@@ -2385,6 +2401,7 @@ JEIDA defined bit mapping will be named
       -
       - 1
       -
+      -
       - b\ :sub:`1`
       - d
       - b\ :sub:`2`
@@ -2393,6 +2410,7 @@ JEIDA defined bit mapping will be named
       -
       - 2
       -
+      -
       - b\ :sub:`0`
       - d
       - g\ :sub:`7`
@@ -2401,6 +2419,7 @@ JEIDA defined bit mapping will be named
       -
       - 3
       -
+      -
       - g\ :sub:`1`
       - b\ :sub:`7`
       - g\ :sub:`6`
@@ -2409,6 +2428,7 @@ JEIDA defined bit mapping will be named
       -
       - 4
       -
+      -
       - g\ :sub:`0`
       - b\ :sub:`6`
       - g\ :sub:`5`
@@ -2417,6 +2437,7 @@ JEIDA defined bit mapping will be named
       -
       - 5
       -
+      -
       - r\ :sub:`1`
       - b\ :sub:`5`
       - g\ :sub:`4`
@@ -2425,10 +2446,141 @@ JEIDA defined bit mapping will be named
       -
       - 6
       -
+      -
+      - r\ :sub:`0`
+      - b\ :sub:`4`
+      - g\ :sub:`3`
+      - r\ :sub:`2`
+    * .. _MEDIA-BUS-FMT-RGB101010-1X7X5-SPWG:
+
+      - MEDIA_BUS_FMT_RGB101010_1X7X5_SPWG
+      - 0x1026
+      - 0
+      -
+      - d
+      - d
+      - d
+      - b\ :sub:`1`
+      - g\ :sub:`0`
+    * -
+      -
+      - 1
+      -
+      - b\ :sub:`9`
+      - b\ :sub:`7`
+      - d
+      - b\ :sub:`0`
+      - r\ :sub:`5`
+    * -
+      -
+      - 2
+      -
+      - b\ :sub:`8`
+      - b\ :sub:`6`
+      - d
+      - g\ :sub:`5`
+      - r\ :sub:`4`
+    * -
+      -
+      - 3
+      -
+      - g\ :sub:`9`
+      - g\ :sub:`7`
+      - b\ :sub:`5`
+      - g\ :sub:`4`
+      - r\ :sub:`3`
+    * -
+      -
+      - 4
+      -
+      - g\ :sub:`8`
+      - g\ :sub:`6`
+      - b\ :sub:`4`
+      - g\ :sub:`3`
+      - r\ :sub:`2`
+    * -
+      -
+      - 5
+      -
+      - r\ :sub:`9`
+      - r\ :sub:`7`
+      - b\ :sub:`3`
+      - g\ :sub:`2`
+      - r\ :sub:`1`
+    * -
+      -
+      - 6
+      -
+      - r\ :sub:`8`
+      - r\ :sub:`6`
+      - b\ :sub:`2`
+      - g\ :sub:`1`
       - r\ :sub:`0`
+    * .. _MEDIA-BUS-FMT-RGB101010-1X7X5-JEIDA:
+
+      - MEDIA_BUS_FMT_RGB101010_1X7X5_JEIDA
+      - 0x1027
+      - 0
+      -
+      - d
+      - d
+      - d
+      - b\ :sub:`5`
+      - g\ :sub:`4`
+    * -
+      -
+      - 1
+      -
+      - b\ :sub:`1`
+      - b\ :sub:`3`
+      - d
       - b\ :sub:`4`
+      - r\ :sub:`9`
+    * -
+      -
+      - 2
+      -
+      - b\ :sub:`0`
+      - b\ :sub:`2`
+      - d
+      - g\ :sub:`9`
+      - r\ :sub:`8`
+    * -
+      -
+      - 3
+      -
+      - g\ :sub:`1`
       - g\ :sub:`3`
+      - b\ :sub:`9`
+      - g\ :sub:`8`
+      - r\ :sub:`7`
+    * -
+      -
+      - 4
+      -
+      - g\ :sub:`0`
+      - g\ :sub:`2`
+      - b\ :sub:`8`
+      - g\ :sub:`7`
+      - r\ :sub:`6`
+    * -
+      -
+      - 5
+      -
+      - r\ :sub:`1`
+      - r\ :sub:`3`
+      - b\ :sub:`7`
+      - g\ :sub:`6`
+      - r\ :sub:`5`
+    * -
+      -
+      - 6
+      -
+      - r\ :sub:`0`
       - r\ :sub:`2`
+      - b\ :sub:`6`
+      - g\ :sub:`5`
+      - r\ :sub:`4`
 
 .. raw:: latex
 
diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
index d4c1d991014b..ff62056feed5 100644
--- a/include/uapi/linux/media-bus-format.h
+++ b/include/uapi/linux/media-bus-format.h
@@ -34,7 +34,7 @@
 
 #define MEDIA_BUS_FMT_FIXED			0x0001
 
-/* RGB - next is	0x1026 */
+/* RGB - next is	0x1028 */
 #define MEDIA_BUS_FMT_RGB444_1X12		0x1016
 #define MEDIA_BUS_FMT_RGB444_2X8_PADHI_BE	0x1001
 #define MEDIA_BUS_FMT_RGB444_2X8_PADHI_LE	0x1002
@@ -68,6 +68,8 @@
 #define MEDIA_BUS_FMT_ARGB8888_1X32		0x100d
 #define MEDIA_BUS_FMT_RGB888_1X32_PADHI		0x100f
 #define MEDIA_BUS_FMT_RGB101010_1X30		0x1018
+#define MEDIA_BUS_FMT_RGB101010_1X7X5_SPWG	0x1026
+#define MEDIA_BUS_FMT_RGB101010_1X7X5_JEIDA	0x1027
 #define MEDIA_BUS_FMT_RGB666_1X36_CPADLO	0x1020
 #define MEDIA_BUS_FMT_RGB888_1X36_CPADLO	0x1021
 #define MEDIA_BUS_FMT_RGB121212_1X36		0x1019
-- 
2.34.1

