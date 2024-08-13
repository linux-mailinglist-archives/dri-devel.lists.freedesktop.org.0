Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC47C95082F
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 16:50:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 494F310E376;
	Tue, 13 Aug 2024 14:50:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="jX3vFTsM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011008.outbound.protection.outlook.com [52.101.70.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A674510E379
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 14:50:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PIJ9mI/UuIzG5gRP89x9vyLJ1ojTwjJoy6n+MYDqoKJBEjadxRbh9jdPklSFcJr2FoBE1b8VlItbFF+Pul3C3BhvC0p7IwMYEH0md5wYIQKxv7zxJvCDCCNa2S1uHQcgfO+ktTqeShc1CNvXqFokal5o/fIinuhgupsNQLVJ2bQj0bpir2xP9IiSG2yWkdU8GYOhS11Lzyoj5lFcsiH860NSepebU9TS3xoNRn8f7+TSy48hh1D9rvqTQBZKRswntzGoHZ1ODBQK0BSp/bAFCOzjpXp/KNT4x6CYAakVizVtBTuxWd6ZZCljozevBMZEa3ogHHNsOcUB1zhndOHCLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=quSaVmA784AZMBq4K1AbnmfZaD1KL5gSIxt84tBLQFc=;
 b=kuRMYEasHDNcx30flsU7E1jZtLqc48efZuzc/rqlzi71MWtyg+IIiBMQi20zoTQv5qd/Sxe8MjCBHdi/9+A1QkwuokXoYAwaBAyotNiiPCLcgJVbtMAtNWy7yxmNAHylxj7Y3Mn7ohPZsKDOqfgHlFmkXZ29VS4DaK3BcyGPxfDZTgHKYvZY8WgGVWxYDPSeY090jhszZBAPrxKHBTSdUMJUPNXgki92GpBKZBj4HEZ3xgjt9AishHCkmcgsHmtvLHqd/FJKNAcSGhP9RrWaRIuzdOYp7RgAZM5i+c7eRddlSG3wzFVeKEq35/JtyrcmBYZO9nP2l0b3Dv+FSnfbBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=quSaVmA784AZMBq4K1AbnmfZaD1KL5gSIxt84tBLQFc=;
 b=jX3vFTsMgZoREGC/yivr5IUB7kYlF5xOUN2xxwGPULh2AnN//H1SKjHx/unHGvupXy+IJT2+QW+z9Y6akkI6ah0+UYUBUAQeYU5udD8BI+7K9LXA7mR7ibcCkhIdTCwjluJx+NT2AR0v7FUQVUN8fhXm3sD2S8DbM73ff93jELoG8Ej/nZ7pkMeHfVcZfmET4Epfwym5nUUk9YQsk8DurJBPkV6/ulgKsgq2JwIa4DvpB1YrLDlTsEHES2o7BZM30JHRvlGw3lk27LIMcxx4k6uPHpGzOZFFh6J2PFITwkvprcxwyw5+Sp9vm/SYmZDvcifehq+ZBfN6xwNgBd6NSA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA1PR04MB10296.eurprd04.prod.outlook.com (2603:10a6:102:44a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.20; Tue, 13 Aug
 2024 14:50:39 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%3]) with mapi id 15.20.7849.019; Tue, 13 Aug 2024
 14:50:39 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Liu Ying <victor.liu@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org (open list:DRM PANEL DRIVERS),
 devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE
 BINDINGS), linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH v2 1/1] dt-bindings: display: panel-simple-lvds-dual-ports:
 add panel-timing: true
Date: Tue, 13 Aug 2024 10:50:21 -0400
Message-Id: <20240813145021.3864787-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0011.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::16) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA1PR04MB10296:EE_
X-MS-Office365-Filtering-Correlation-Id: 229d24e1-0370-4984-cde2-08dcbba74c01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|52116014|7416014|366016|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?x2KPC8wwdK220qcBg0kJaTScEWmAp0TIvBts7PBknXPxLav3qsHnsUdJS3H9?=
 =?us-ascii?Q?n+3sNHT1ihIttVlAx2bjxNsMN5IYjLjRI+KwDze5BfypQH8WkWGQYN/Jw7wr?=
 =?us-ascii?Q?91QCfFH49vYXGMtZOpuzNsI05eUB3zWpw2tYk1uK0RTcxT9dDHHLW5Z+/KFv?=
 =?us-ascii?Q?NbtoIAZ5McydMFMmh8NM3iz6/faiqH8k5lpwRdaHP3RoIIRdl6I7WSSDfzW3?=
 =?us-ascii?Q?n+TOVAd8k+eoi5P3iP3+AzTbGAhC81+H5+i8tWuT3SZJg7B/YkuMTFwfGgjZ?=
 =?us-ascii?Q?cgVAwMsyaLFf+hce0fCHrOPUnPiN362baHU0th9ZRyhLqzeNYsXOD4qk0B22?=
 =?us-ascii?Q?k2K1/QxVweGzuPhpX5BVmF0VvC6BxGbuMhM5/4VJHPXEv9ko7aXysgBbNy6O?=
 =?us-ascii?Q?COStnUiKrr8jRXbtdCktIwn9k+htewKmwLDPrmIN9dF2It/XhM4PF4ypGSe+?=
 =?us-ascii?Q?v46LwbMye4048uRnw6OKtPOAhvKyLfcFB5vM7mIUoQOrDfyb+CQ/A7/SL8yQ?=
 =?us-ascii?Q?XyvMSWqI9MtwC4C86Ll/1TgxcdySXy5PKVAWOR1MOSDK7vlwuxp7aN4/YihP?=
 =?us-ascii?Q?U2x2m6N6Q8K6gfVtz8wvLZeSQWetGsPxSDjQjktxLjR1gnmCRERJtOH+tI3L?=
 =?us-ascii?Q?MnKyt+a2FhUJyKcDlXoQVSkRnYfb930BpEbiFCCdmh04B9Z//O/KZlh/cH7c?=
 =?us-ascii?Q?8NmJGLUqQF9ETT5PX3I+lzdOjRFnPEtp1HWG+MX3L6wQp26xAw1YYVGUzwFR?=
 =?us-ascii?Q?y61WV8kZ2fxOqpMx69gqK2kw+MhSIow+UpeRTt00Ryy3iXgzjLsXL1VRu2ff?=
 =?us-ascii?Q?Ia86Jvd2JhJmeVyZz+h8u49gpq/jlJEuYocKdUrVo45Oi2Qk8kZKRl1mBKy/?=
 =?us-ascii?Q?6kRm+VkjsU4TE7IMZcV+6EyFgs7wpvk5K9mgYtBOdGVHupzrcy82pLr6LXEh?=
 =?us-ascii?Q?wWHMr++zQQS1R+iZr+vK3STl4umEiawIwuJIMMyhiVRRkTkI5om3oSoIyDk7?=
 =?us-ascii?Q?DftLQNcBTNB1NnyhdZgl6mdFOM9I+iezAAhd+X1W0Y63fAxL7GgQdhNPhoTZ?=
 =?us-ascii?Q?VhdaVEuAUF/UuXzFc/qVutBxl7fvyLtrvCu4cm48m/tz4w67fvM40pb7s0sG?=
 =?us-ascii?Q?I2nQbYlZyPZODFViQh84TVgUWC0AC5Y/jcL9s0mcATcq1elMZVcG/F+MQOXl?=
 =?us-ascii?Q?VI0t1Ln6LAvY4SboQG+nOJLLMTAzfRoQCU1pwnX26fIfXD7Y1iIWSYvvcS1z?=
 =?us-ascii?Q?19mtFyAZqMjZsHlImDiJwJk3/xgfFTAJRQrmHLb9/t2NTABH0KLnvtEmuSvj?=
 =?us-ascii?Q?TnKnQdQjAq9mdXKT8qtJ3v5OZMw785Km1kbMjFcOLmUxv4VhPuXDH2GIYa7R?=
 =?us-ascii?Q?ILLngCG9kUYQ7whe2PMbx7Io9vxm?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9642.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(52116014)(7416014)(366016)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?v+7a7eumrjCBG0Y63Uy9rgjdDfZ11eqBnBKGhtEuvAhzHeUGOCO9s7zOHgil?=
 =?us-ascii?Q?tn3cwErQIJugFKSwUOgpZf/dPLJ0jhFQYObiVoWgmj54xXAumIJceMT7g9Kq?=
 =?us-ascii?Q?zxH9WLSiSbq85+NYhuFPgCX/R1jI3xzOixNGJ3iP9sW6Y6JDNYGS/iflGpQH?=
 =?us-ascii?Q?VxVUDj1RjLbFdgvTI2NnSrV4HFpnG92WH6p26IyeefWhf37O77VVX8Cm8Xa6?=
 =?us-ascii?Q?QnckJlTfEigkwglpaVwWGzP2/6hhQxWkL9TWiYd9mZ/2VuORq5iGuGXGe96F?=
 =?us-ascii?Q?1ijWDoC9WvG5b3MTIk09tAV5hFo14KAtN0H69jO4cD7aMWD/+7rT2zdfyYr0?=
 =?us-ascii?Q?gCeQZJcO3R1jvGtiHqujMAP1pKdFxWj0CZOGB7AVxsR9WVaA8i6EYKPfZmZQ?=
 =?us-ascii?Q?A96XRnAYBK+A90VT4iASgDw2JPRfcrpu/POxOnpp0tIuwOoWjQtSZFLxgat+?=
 =?us-ascii?Q?jCd3TMD3CRDN3a2jDp+w6jNcCCj+l3JhuD4bLJshytzuw2vQaJQ/lnniOpKY?=
 =?us-ascii?Q?C35A9hM5M+hEiTIJnvwCdBIe0yEEfScJQNgyN51YrYJz9eCQIMLa6Mv3pKGh?=
 =?us-ascii?Q?qc5zItymPesK7z07SJJhewxZAdAbcF+qad2gWan7UbbbZuwKF9dh5MfRcRre?=
 =?us-ascii?Q?E11FgmIBz93O1c9ra0CBjRHczKJTr07+qHOXyVVaTB54zASI4VD5M9YUzePX?=
 =?us-ascii?Q?U07gg82dXAsG8/nwblnTDF8aG5/i2GduvAAV+HLTPCds2bR6PcGrqWrQLa7O?=
 =?us-ascii?Q?x7aUbmrW5MDnZEUKU3Ixasfp/SgCSNTrM/Mn4lxHskm3xK3ZeOmZhZjanj1Z?=
 =?us-ascii?Q?KXN1qHpQ9pBALSFhkat0+4XXTBOHvvm+3tD8CA3/Trau7ytkNuNoEeVN7NZ6?=
 =?us-ascii?Q?gesL2I0OoO+7Ciyyp8EioZE8QTG4oXA9a/JRl+IagLdsjjuU8IDmYHSJ87FE?=
 =?us-ascii?Q?Kpwzyk3WjOs6c6GCpeye4De0Y4PB+WumNeQeaoWHMy47kS7XUpaWzD7EXHkK?=
 =?us-ascii?Q?ggrhVL86AseJbrt06kY8NlmBWC+TyN3te6YqUyx4F6b6xCBLKLEHee3lk9Ve?=
 =?us-ascii?Q?PAXYkSf4HUpk0OaJ3KNvldHEt8tpGZS78md9WQJhuPaB3o8sg6IAYPUfVJvW?=
 =?us-ascii?Q?vMiqS6mBIgM29+eNhGF32Jzy5Tg1MLvLCQCcVfEgpLIgCOIQ4UR2QjZUa11j?=
 =?us-ascii?Q?tput0CgIA7VPaIUUsIk0lYpL7SS1ts8LZK2V/n0lwNfc6eJd7mmvIpMd02VF?=
 =?us-ascii?Q?7jvRiUugBpf5IG6FamN/20VCe4v4aobKCJOtGDXfLZOYvuTI/r0wqn35DKRQ?=
 =?us-ascii?Q?ReOzf2vj7wpJ95z6YqlcYWg2kaDESyhHt3lP5lcNXGYWwxwttNbXhib1sjcR?=
 =?us-ascii?Q?HxRSZkQi5SYtxnpuxlrlwq8sKMlGZ3bDcbMl9EbV/AVTWXEDYAnej8lGY0Au?=
 =?us-ascii?Q?ga5LLT9MB2hJzh5YLbuexuiyGGOoM/7f+29QdRDEfLVCMjC5XgnB4Z+L0iAE?=
 =?us-ascii?Q?qDxIcKbntXcx0njdLeGhpXLk05U+OsYBFsOe5CBLUiy1009ilnvpTeeS+Khm?=
 =?us-ascii?Q?Yt3L5FICrMxo22nKhyY=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 229d24e1-0370-4984-cde2-08dcbba74c01
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2024 14:50:39.2100 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PIKXKu8A2AgZfATv2pdAM6R3E/XEzEZJ5GmhNgbZXDnZvhP/+V4uZyzuTtMmuMy1ML9CgdhSO3xWWC/UKdhPbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10296
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

Add property panel-timing: true to allow use 'panel-timing', which defined
in panel-common.yaml.

Fix below warning:
arch/arm64/boot/dts/freescale/imx8mp-evk-mx8-dlvds-lcd1.dtb: panel-lvds: 'panel-timing' does not match any of the regexes: 'pinctrl-[0-9]+'
        from schema $id: http://devicetree.org/schemas/display/panel/panel-simple-lvds-dual-ports.yaml#

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Change from v1 to v2
- add panel-timing instead of change to unevaluatedProperties
---
 .../bindings/display/panel/panel-simple-lvds-dual-ports.yaml     | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml
index e78160d1aa24c..1f3222d532787 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml
@@ -87,6 +87,7 @@ properties:
   backlight: true
   enable-gpios: true
   power-supply: true
+  panel-timing: true
 
 additionalProperties: false
 
-- 
2.34.1

