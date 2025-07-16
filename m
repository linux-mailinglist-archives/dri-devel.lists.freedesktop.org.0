Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8376B07CEE
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 20:30:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FE9A10E2D7;
	Wed, 16 Jul 2025 18:30:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="Uo+QMVvu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013058.outbound.protection.outlook.com [40.107.159.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D5B510E2D2
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 18:30:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o0unkqkeUVKLszw6LxdLfLVrJjrAhiBWYkjCkO0Q1685w4pZdfJGriirlmsEZCVeyUTz9+iJcQ7qk1iaVIhVc0chwe48XcfFp8WW0zW708P+72OziQCSK3sVjUmhkAgevBD/ZxqTu2K1On2v0nJdmB4CKFFutwDHHR4OeFge/gampIrK8sfksHjrs2o8BPzVgQSCcsSdEApE/zMrOF/Yft+zJc7xmnDxR3ETJAu4orMpQkBqg/Q5jIgZfxEAEujti7fZZ7Ys/tRP+lqmKz3GA5IVVJePuWLFt7qdNX2dxqJQynyijC0fbt1/SMZEtU2WYIMokZO90vbR9qiwl11SdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=maqtuPi8Cq2tMj3PHhzBGX+/U1KQAsI4PcfGcgUpyNU=;
 b=nJKWt3IsQM1qLA+2NEuJGio7jbbFK5g48UbNyDED8zZhfA8cn47gFIzngdREQeIkwSjZol4T/yzeE2IneJbcDVGSDfBB+uoZyuV6DlHdFAh94y94R8q8b23XCjbO8jlmMZmTPi+tbNlChy8ii4O0mJh1COAYVBuYChY6PAKbUJiCh1oqjfb7s8sMghLRZ1ZJ/zfgQopTtE54BfF85x2FFqyCORsjj0OT4gYcY624ldbb2F4iLDJL7N8fkg3P+p4CJUm1pZHb/BCCVPesiAY5XUdEoWRFZ24CW9e8rLQXITl+toEFbO4pfDQg5E1PeUyUW9nNlb9QvstLbVieTPI6oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=maqtuPi8Cq2tMj3PHhzBGX+/U1KQAsI4PcfGcgUpyNU=;
 b=Uo+QMVvu7jr9wdcMkWbkZEH2yO8nWJlUcSYBLfn9457kVqWX4+7B/q43PHqbL1xGRppokHPkwXfzDB2bYPgU6VolbgTWutMae7/gBKndCA4/X/2MwkKOAjEt3rvA1Cfv32AITOb4HeD2M5VNHLMw+tSxvnTBSCpBHLyoa7ll/HQUnPkU8H7dYYfg6FH+QKCYhNjCM2bowsJX2rq7XzkDisv4oDe1/bCBivqTSK5JuyPNj/w3HTlzHDHF1EG0qqvWTry4NWuXdJ2jpT6DMiaB5rq2Dc3E0bFYLLqOoV5I8jpZmzwaEFfrqNTlHnq00vlf6pn06qlzEN9NavxwGNTRXg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DUZPR04MB9919.eurprd04.prod.outlook.com (2603:10a6:10:4d9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Wed, 16 Jul
 2025 18:29:59 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8922.028; Wed, 16 Jul 2025
 18:29:59 +0000
Date: Wed, 16 Jul 2025 14:29:53 -0400
From: Frank Li <Frank.li@nxp.com>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: imx@lists.linux.dev, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 03/10] dt-bindings: display: fsl,ldb: Add i.MX94 LDB
Message-ID: <aHfvoZ5ztt53yQZa@lizhi-Precision-Tower-5810>
References: <20250716081519.3400158-1-laurentiu.palcu@oss.nxp.com>
 <20250716081519.3400158-4-laurentiu.palcu@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250716081519.3400158-4-laurentiu.palcu@oss.nxp.com>
X-ClientProxiedBy: AM0PR07CA0015.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::28) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DUZPR04MB9919:EE_
X-MS-Office365-Filtering-Correlation-Id: 3dfc79b5-7855-44d4-bb23-08ddc496c598
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|52116014|1800799024|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bbZKqAx6evvReI3oZfh2g39PuIJTVfzL3Iyzxfk71ooT5AkLjmIaxRyBf6EY?=
 =?us-ascii?Q?XIa84xmMlaO+15eZ3aAk/9Z9CYx4zEl9kOXH+H0OgyvTPSCYjmeBOL+JGUB+?=
 =?us-ascii?Q?gTVvRU07n07LF1NxRIkpRNYc+C/dTYdfIr9G2f7bLQwHlhCeq24BqmQOoGua?=
 =?us-ascii?Q?YGPGkeYBu1RfregWmIiSK0xQYLxW3exyvm6pqf4TPoGG5lx+N6aJyj1UJ6cB?=
 =?us-ascii?Q?LHyG58l7ilIBf7XTPu1gVpCbKgA/ER3qW0oys3eusWlMitxkoricyyFzJH/H?=
 =?us-ascii?Q?KniJvr7j/7gdcekdD2yzK8R6DftmCpHCNt7AW2pTiwLyTqsODuGcKu8Q2SyZ?=
 =?us-ascii?Q?NpHGILOJXMGUVANLHd5sLZuFUXYDmeLG/e5nD0Y0n2zM5uKB+FbtAOhz+4xh?=
 =?us-ascii?Q?g/DFyYejRLOS7fHaW3a06JQUHr1Cnqv1pqrJFtOIa4rVEh/GsJ0D62NCn2EH?=
 =?us-ascii?Q?aitj3mPxIyLpQlKIoFzCDlNS5V4AOPxWcodZ/6Hyt7IFmveetZlu0D/2l5SO?=
 =?us-ascii?Q?unY4dZFHSXLoXAroQ1w0phHDQU8Bc5UqMYo9gPiOYXDf1kS1W110Gf7zqsHg?=
 =?us-ascii?Q?//4Lfp2LRZkVZY0clxjKDlwcMopAOxCd/7CBAMwe5pZR3cN8hfBVQNrHVtst?=
 =?us-ascii?Q?zd4kkZn1x2NG94nhUV82Nmq0LkXr/GyO8I0Axs2vmejKv8GNgxTRePPOqAK+?=
 =?us-ascii?Q?NcoKyX+vSBvh7iv7gP8EHWEZpr4ue/MpWqUNO03/SEIpExyn28d7eL/WhMCR?=
 =?us-ascii?Q?xgoBxtWBR7kypLC8bb++hO6zD+xyNqOjaKwRFwMmWJmVnLKbOpN1OBJatqxZ?=
 =?us-ascii?Q?mr0i1oEcy14cXGyLsd5Z6grnCi2ledS2ij6aCKS3E74b5uCa1rllaRdVoNRg?=
 =?us-ascii?Q?myYfhGWtfo1gmtU6Ku/VQ4QqVf6vJQ4MRynaBbqETZT/wDFQk3VpAkbeX3fw?=
 =?us-ascii?Q?85joCceB2Tgnr0CjRJlj7QCPScy7YBeTE0+Hk6xTD2ujxlESbwNRm+63UlSl?=
 =?us-ascii?Q?iVYZJwEFlqQnwr/avT6DopBz1ajRK2nax7iMP3F0bpMrXf8ZI7Vfwi1z64EV?=
 =?us-ascii?Q?owYF6b2nVZ1PIdRWB7bM7aNeW0/laX1eA5Kd/2afRWzBB/6ImBHZIbxfmpqx?=
 =?us-ascii?Q?ibcKs6rwaVo7fJbwEt3twWx9mJ4xVuQ6sy4D/s1fBIQ7HDoEXVpHJTqZY1WZ?=
 =?us-ascii?Q?ZhF7aVn7cY9zNornhh81boUdiCxNDWFNH0MyHh4PE6dJIm77/FY4du7zqFGb?=
 =?us-ascii?Q?oUlg44O9yG552gbfM7aWGwN5EE5cVgiA6dYOMqOW5OlxENiePfHKb0qpMoXN?=
 =?us-ascii?Q?i9Yi3pv9yJYBpvFSfu3n90bEqaKPswaFzSdsMzH1UekWB5Zc1oYaBguH/bZl?=
 =?us-ascii?Q?Z4zIpXr97Ngfs4bgZFVb/457eckNBRzJRBYX/lqIIjzTDV+l34CT0FVX39dE?=
 =?us-ascii?Q?vk20pFwS3z0tjUnSh5owxy6QbPAnfV/nFTF3ETPGETcDoI/xKqMiYA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9642.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(52116014)(1800799024)(19092799006)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uDJpBtZYiA38byTiPonhDbnUxFjQLEr66dPDil2ZwtRPKYI2zk3GyjY6MDl7?=
 =?us-ascii?Q?s/Kv8jIqItCH5sdqrraFIGLRZOqzu8kLw+B0Jds0J5qAuOh80X91n9RUvWZN?=
 =?us-ascii?Q?4eYCnSYj92jRqQmRKU3GNpQNeVilf6agFACyCmPayDS2u4ccpOFNcftjG41t?=
 =?us-ascii?Q?VGYDuIKB0rZQKiJcL0jPEbnRxTb7pu0xkwJlTc/SB9l9U0vho49AVEwjET1G?=
 =?us-ascii?Q?dyrI0AhW9grFijl7OiIheFt79TIBDQyhWjTlOre2UX0Mx0mev8bmkqP0KMbw?=
 =?us-ascii?Q?EVYQOTes1MhWXb9p7IcamZcj7w7KsFaXACyWtQz0Y6UwRegV3XkxvINJQhEK?=
 =?us-ascii?Q?CRvBomeXcJi8ngnua+DWVn5zKx/0GVXV/1rCfrxad8oPsoKR3WTi3KWlhwav?=
 =?us-ascii?Q?IkM8E6GvNNg4TfExXgOVRCzvExu7lG395j6tNcc/IcUNCE4IXeixRcvNTb/5?=
 =?us-ascii?Q?F7BlPTGtmvuyJUaBhqDQAihGnmK/Au/2UmlVQNh6GRZke5YrDFWAmwLZVQZB?=
 =?us-ascii?Q?w9iZySnazrOlagBMIwW97fVSFMa0f6Sr86Aii5gcNI0JIsdRbTR6FRs9bEZJ?=
 =?us-ascii?Q?NW+RvYQzOfxEMfSFhTK7om9Et7okg61yVteQmikYoybJltoWjFFdVbNiImFq?=
 =?us-ascii?Q?DG6/GATK98fp9AEk0eHsM2DOyHddmp7I/DbtN/VHL99IpdQjm+37tyDsTja4?=
 =?us-ascii?Q?iT677AWuwk/DtFxhIX/dbvKPRiUoD/5c/cm8XY8fvV+OhAllzLSx6KWEinQa?=
 =?us-ascii?Q?GAwB4NB1HZBKTjtxzH4I4SiA/SxTAe5OcvrCEhb7HkNctLigBXun6/Uufdfv?=
 =?us-ascii?Q?cJ82hSdKSA8TvFTLA4NGdlYkOZnMjZd93wqYqPlHkJxcIMl3w3OawTK8M3UM?=
 =?us-ascii?Q?hrsia0eJjwX2DPjLfz9kF3qZoT3ayMuWdPMlGzveu9kq2nPyEJ86XNX7oka5?=
 =?us-ascii?Q?bGLOMrD7E1eppmDATIqfkzOmeTBeeMfLC+hdDgRV1b3gWbCJ7GzzszZRbqyK?=
 =?us-ascii?Q?kOibykY0vNThJb3rbYA0a4i6mcXRucTgb++7yOUBuLWEev3ryUo7HsCXpCwX?=
 =?us-ascii?Q?vKXkpPwkbBOgVJ+PNuVoBE4GOldMPEdjwMcO/utmgFHFkCe4GP1ggw79kUnR?=
 =?us-ascii?Q?WHdwm5f2m91qP317/q7Q7lMQSW76HguYIiW8mU2g+cmJCuLDy9FMQzzqbAih?=
 =?us-ascii?Q?wVOZzYuPRUIrwa/wK5jZknD6H+j/sCdqbtCzEL/NedUoYR7Qraa2+lVl1Q0V?=
 =?us-ascii?Q?s0ggIquGhclgutTMECDxDQKAoxPG6Qs+VxTj8GvUpQDAjigrr59oSeV+Tbb9?=
 =?us-ascii?Q?EDfotLSGb3ArtCLbvoCTHP9H+dOVDtfv/HttJV4rq35SwKvWJFaTWdtyHetq?=
 =?us-ascii?Q?QlzExGClnCI4d4m0OhG6vrlzZYrLcoc7gO9MhNxxnYPynrEqp2VSb6v6uIbr?=
 =?us-ascii?Q?O7vo+AFz5crP9bAyuvGMVaHC/rNOw1Ffu+G8LyH1gc0ay2EfsP5y4R1A0x5l?=
 =?us-ascii?Q?AuVxHhqQB+LEDQjCpCC8XVbzbIzdU6THImwoCi2WNIBUx35sFveB8a95QXOS?=
 =?us-ascii?Q?7VE288jk9DJ3fvAzNX0=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dfc79b5-7855-44d4-bb23-08ddc496c598
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 18:29:59.7953 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OePKXHk3yr5kJwnxgB0gsfen3X+ngO/lj22tiGbkTYmrqDhqe853++kbT8g+qApfpOwkuPE47CGV8joWOL+hFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9919
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

On Wed, Jul 16, 2025 at 11:15:07AM +0300, Laurentiu Palcu wrote:
> i.MX94 has a single LVDS port and share similar LDB and LVDS control
> registers as i.MX8MP and i.MX93.
>
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
> index 07388bf2b90df..a54b8f1478049 100644
> --- a/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
> @@ -20,6 +20,7 @@ properties:
>        - fsl,imx6sx-ldb
>        - fsl,imx8mp-ldb
>        - fsl,imx93-ldb
> +      - fsl,imx94-ldb
>
>    clocks:
>      maxItems: 1
> @@ -68,6 +69,7 @@ allOf:
>              enum:
>                - fsl,imx6sx-ldb
>                - fsl,imx93-ldb
> +              - fsl,imx94-ldb
>      then:
>        properties:
>          ports:
> --
> 2.34.1
>
