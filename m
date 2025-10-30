Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 994FCC21AA7
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 19:07:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D8A110E31F;
	Thu, 30 Oct 2025 18:07:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="pmGL/rWz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010010.outbound.protection.outlook.com [52.101.201.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0B9310E31E;
 Thu, 30 Oct 2025 18:07:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UCptpTgw3fIC/DHpPjPpa0f3eZnsiyGHUTcoVY4ZS4gQFzLScRyTaOHOE9jn32OQhink8vL72XNtaDdtiT5rItDLa1hz3cwpBD9jaiqoEs2gxw0CVYz+6Q72AZlDBmMgR2oZG/ewhDrTfqFeaRnSlvriEYoMwUlXxNHOCCIdaUFj7YctI8qlK49nxi49q9eZ+dycIdRz4rlZlwZJpS/u9otyEANG3rpWM7sJsrCpHU1ePQBon+u1PnTV6U4DVyB/sENuGHJcXms+CQsRTiLyFE5NFnyZ5R0qclOqWNyCHV7qEU0LifXgA/zlReGUsFuS9rSEdq7ycLZPMKWLFNXC6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uJv1UijARcdKBjpxhUcNE26+pzDafd3yaPEhS5/1FBw=;
 b=Nq4wpb+ZatsDoPaMfoc1dB6zYVipKzV4RgYHZZbts5/Pvl/jEADtalLO/46JqbOzHrB1XxKVDomLSPoxYfhq21TtaiB1fXpVWzz19cFAtTswmxfKewAnDcq4Co9jcceSOCBpPMtG8F1zYg8Q2RC+psaov3os/cDt0ITw5rMDq039iiy0/6EScOcWWJpu3GZzIkUJ9qKUKrV5C3V61zlgg0bOWYR/roD4nQ35cucxuOJO2FmB86Ca0Y+8FIsoWIK5NXJsZOcd6ynzbJL0OAW6rmNKUrCh4vT+thybEjBUDHsiCyzUTYnJOKDY3Bxc5bjDmUtMV1E0zljOpDbuJt6sSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uJv1UijARcdKBjpxhUcNE26+pzDafd3yaPEhS5/1FBw=;
 b=pmGL/rWzzuseK3ub3OjLUCtLs1Ilq58WKFaGh+NhhMAmaelZTOfWQw6KPc1pl/LyuAic60mYwBrDdSJllXkTQMnqpN7XZAM54QIYtC/xfbdy8hrn96LM7TslLcBaK/inCTQqEBCyymY7G5MvAIa2PmVcDI38lR+vGEh+3XbkN/mO1fB4fPOhbdroNrhhV/rKMFZF3iLObY7Gl+P11X2uXr//zIeJBCGLQsw3bNThkKp65XMSI8HdK5YkUM+eykvSQZlTlDE5+VnsGxP0Nb3CURR9wDEWZHgoZiv8CFphwGJyjMk0xf35TwcRpSXXx8fBxmlFPjgJpFTGl+zi2O8jJg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SA1PR12MB6701.namprd12.prod.outlook.com (2603:10b6:806:251::18)
 by SA0PR12MB7479.namprd12.prod.outlook.com (2603:10b6:806:24b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Thu, 30 Oct
 2025 18:07:14 +0000
Received: from SA1PR12MB6701.namprd12.prod.outlook.com
 ([fe80::2be0:c316:443d:da3a]) by SA1PR12MB6701.namprd12.prod.outlook.com
 ([fe80::2be0:c316:443d:da3a%5]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 18:07:13 +0000
From: James Jones <jajones@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Joel Fernandes <joelagnelf@nvidia.com>,
 James Jones <jajones@nvidia.com>
Subject: [PATCH v2 1/2] drm: define NVIDIA DRM format modifiers for GB20x
Date: Thu, 30 Oct 2025 11:11:52 -0700
Message-ID: <20251030181153.1208-2-jajones@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251030181153.1208-1-jajones@nvidia.com>
References: <20251030181153.1208-1-jajones@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0016.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::21) To SA1PR12MB6701.namprd12.prod.outlook.com
 (2603:10b6:806:251::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR12MB6701:EE_|SA0PR12MB7479:EE_
X-MS-Office365-Filtering-Correlation-Id: 98e8a264-1005-4790-c6bf-08de17df2752
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Vh6fmNO0LPrImkQI6SYFHTIj4uvU78/UOnRf7ikMw6XpcYULrKZVJuc/5/tS?=
 =?us-ascii?Q?+NHZ155xVZmoeNbuFvP6r7EKYR+D4nnvjqC56oljmHKfWAGd/trMkBCmE11p?=
 =?us-ascii?Q?WiRzvuOJxARCLrhtLVQr7/sY5r1TpDibk6qY+ucjhKBYLPvYnd3moOa0Lp33?=
 =?us-ascii?Q?yRMvfOlaB6n0Wg02kB1RPRJbIdfA/djD6FVL9TVykV/hhAYYF0haj8vXtoUR?=
 =?us-ascii?Q?mzI8nRrFEc+TJQoB4uAL7WFIX9UJGy44vd6YTocLJHHKwYMLY+pbALoUL5lP?=
 =?us-ascii?Q?L/upP5ZrDjl7SHH8ar0dNinqgJysHkGBrCCRFr/ydVO02Ml9hYNjmpAoociU?=
 =?us-ascii?Q?PLxo4HPAQg1fW2DUa1Ek4SOQxoqcyRyruTmHX10GVjF0YZ3pRMzjGZ/ZYXlm?=
 =?us-ascii?Q?ji3lDsAsh77ZQcUN+xoRzXSXMIMF1lq2/Pr2fT1tUPp0zZknMe0FkkvPivCT?=
 =?us-ascii?Q?u9UT84lX6sn2sxrwPjlZhOJ2NymSyt0BMIImOzaEmXzVePXDf/VkPWuQOz47?=
 =?us-ascii?Q?brm5R6WRMEo6xC6+Do/2zMBI0oWuY0xEF5fNEjAcOgc4xcPQoad5XbjXad/F?=
 =?us-ascii?Q?nx2jCbzx5cMkoZkKG4wMBPqdhb8/nByQ8fJ6SdhHdqNB2QEZWEAZstnrxAX3?=
 =?us-ascii?Q?dlq7a5s6BnSStP6lL8dgV/gjOEgZkvzjM6riRegi2skH0zKCR/FM5tqYVMsl?=
 =?us-ascii?Q?EzfaPG82QhOoSsww34DRzmgTXGMR14nYDqB/dQ42q8mZbM+Pl7M4pEVP9m8M?=
 =?us-ascii?Q?rJcozpYzdmA2u61zXicPM1O5s/Fb27qOSGYDev/dR5l7YZPYNnKen6K86teE?=
 =?us-ascii?Q?hICNpwsqsC45NWwApETC2cgUNermCUHUjJokqKJ6PIKl7yCtjubZjdBMq5wn?=
 =?us-ascii?Q?yac6qnlPUjGDu7PCm48PxVvz3EvRE5FkSyrLkDF4Fok3yKcZbjEkMeJhSS5T?=
 =?us-ascii?Q?W7Z6MSQ/+Y0AnXyNfjDy2kFhpbUaDVvN/uTU6W0uHxjTSsG2enRUbeGSsIPf?=
 =?us-ascii?Q?OZGvds/ZL6ys8jkuw7Ln2Iqq7YrL8Rxz1yztczZyJ/TDfKOFxXOAvN3Ig9vK?=
 =?us-ascii?Q?2/bXwHzSSxu5dMpFLhJwE3FuirMUPRV8pqOHH7SCaxGQsNMu4AZ9WoA7ETfY?=
 =?us-ascii?Q?BUtO9gt1OAWj0W9tMaWEINYWHyfOO7Gc7DYRdDEUwQVv5ElqhXTDjV53Pgiu?=
 =?us-ascii?Q?2BRjHCvoIFW4yoirEk9GbtCif0InfroRKGf2eqa6wzCwW12/LnBKB58htWuE?=
 =?us-ascii?Q?SjTvc8ydpwMPFbVtN2U5qcimEhYJOORP94Myjiz9z/MVyJgjV//rItRfK1La?=
 =?us-ascii?Q?7bJ9Y3RD6+vH6Lxfc+pd4pXtkkOOksyIGu+GTfCA1/f4oM7QuP9SVhfoy9Ch?=
 =?us-ascii?Q?/77x0e2hu9CkRhOndA6pu++831+5zGDl6FjA6F4+rC/4cHhY2Bjnl5uG9/wV?=
 =?us-ascii?Q?Uegp0Wl50/rD0xLpErIW/aMy4j+JYlfw?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB6701.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6Wc46ojl6AaGLf/m0gbs4avV0R8h0k2HX3M2w93P04b7iEHaPdQx+XvN6QIM?=
 =?us-ascii?Q?S23fJuqMz8YthEfB91TveoPv59j1HpIl6QLIrJIqMVg8NQ3CMNOmTj2ezELX?=
 =?us-ascii?Q?LD4Hfm+lZyyCqOOGeSjc2YhKXRtpEjPU4NbJ4xG01VMa/MQYvhyc/d3vX6Fp?=
 =?us-ascii?Q?vHck/boom0IsUrcxhPpinPRWmHJbJD6RSFHyaFSKtlwce2WW3gzQUU19C9lc?=
 =?us-ascii?Q?5woMItDzDWH9Tm2y2g6fsDXXG9VBfNs15senI0+XqNEeDtndSAanMLIY0pLJ?=
 =?us-ascii?Q?j//gcpz+1y7xSL95bkXE31JRuVN0itPK7krc11dPS2Gebhogwkj9i/2xQgLn?=
 =?us-ascii?Q?ztYiVEir45R1sW2DwI1iWie5PDUe8LMMfFCU6trfprvolvi6eZSrJzOvl4QT?=
 =?us-ascii?Q?NmoRuiwvo8Hq8OEsWe+AkQrBAgDwNSU8eqm1UCAhclkq4nE/CJsGXECuqErC?=
 =?us-ascii?Q?SJYV5snjXQhhZ4S4ogtSpLlp7kCR5t6BWdlnyNLDW0h0jferYPD9SH98RjJN?=
 =?us-ascii?Q?1u4yTJSSKs5mGBl9WhxSrP48dfIrtDlYJ2NvDUpzMvfyFlzJnk//yRkyCWbS?=
 =?us-ascii?Q?ymj4q7SM9JUy1raspKbF48F+0RlMILGaNc1Wvw95ZPlZoK267VKwfUUQRpfV?=
 =?us-ascii?Q?CK/MmwSI8QNV0tus/tjCvD2FmEeZt16fjl5SOs4Be33MxgB6KQ+cGfU243qk?=
 =?us-ascii?Q?mZ2ZfhtY0DQ6o3EXBBDZjtFt+xg2KtJKJX0ik16qCXsEk/59qwUoMbGqmcKU?=
 =?us-ascii?Q?ZDcinNLX5qeMj3CU3qyY9Z8TqCIybS/76Jg6l03eLhrgwDhOkwk7eeztOthy?=
 =?us-ascii?Q?3/ustgNxWCenvMbO2/JdFHbpwG+5Ga9Eb4ZOBj+eEVDc9XNKiqoRW63DQ6iz?=
 =?us-ascii?Q?gu3s6ETRLDkAujyaqTrgd/1LUEIaNdUa3+vuCLCt047HlILXYrVunQK6KMNu?=
 =?us-ascii?Q?/biFM+Nd67bFU2M3yKwUbQO/PBXbL786nrxnVM/CM3SWatL2kNCFZSfBMMIq?=
 =?us-ascii?Q?GPlt+o4fAC0USLGkgJsDOXLcC3jAftxL3fffrDhlL1F7an+GRUJoQs3eG/kZ?=
 =?us-ascii?Q?zsG5Pm5AKSJJ1X2z73GY2wH02oe9+FHZvscqbT63yXQQoDemHiOu+EMbM5ug?=
 =?us-ascii?Q?mqSzt7weBSCeROMijmiadUicofAUxC2B2odLvOJuoYaNN2xrjMLxH4UZgfio?=
 =?us-ascii?Q?oRo2sQ7vO0VKeaZ8s7YHlQFH6eqkMCK0nXeA7KUOe5A8QIbLvCA9vAiw45uP?=
 =?us-ascii?Q?xe1zIhh9x9dTH827ziSE3LFoUlA3iDolDuIcMAaVQeGfcF1RttpKDZmhvrgd?=
 =?us-ascii?Q?yiEyB1YxJjiAU2YCqv4FLPrQWkjtL/b378+GIZM7Yvvww1RM7kohNi3p36a/?=
 =?us-ascii?Q?/+25VYf864eGcQrcPtW232bAz+TWTRI75ZBfZ4pV9m1aTRGMg3HM7+c9Etco?=
 =?us-ascii?Q?ony80gqAYcSooCXaN7l6aRP8crtD8wNIZg777AeGfmgZ5pByd/pmA441Udph?=
 =?us-ascii?Q?A/5uiCNr23YCCx4xtIeIzq5nxK6/Hz12oSk3manQTUe70upirxLjxcekVfET?=
 =?us-ascii?Q?iXTnwy16fLyl81maPdCHcliz/agt0LMcb0j49Gpt?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98e8a264-1005-4790-c6bf-08de17df2752
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB6701.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 18:07:13.9091 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7vGe9Z3XF5s4AlesOip40Qlg3Irl4el1Uo5/XjLca5NTXuClKGCMk4DVQfNCB+mMuN7KbOUGBdypjUoymDZ60w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7479
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

The layout of bits within the individual tiles
(referred to as sectors in the
DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D() macro)
changed for 8 and 16-bit surfaces starting in
Blackwell 2 GPUs (With the exception of GB10).
To denote the difference, extend the sector field
in the parametric format modifier definition used
to generate modifier values for NVIDIA hardware.

Without this change, it would be impossible to
differentiate the two layouts based on modifiers,
and as a result software could attempt to share
surfaces directly between pre-GB20x and GB20x
cards, resulting in corruption when the surface
was accessed on one of the GPUs after being
populated with content by the other.

Of note: This change causes the
DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D() macro to
evaluate its "s" parameter twice, with the side
effects that entails. I surveyed all usage of the
modifier in the kernel and Mesa code, and that
does not appear to be problematic in any current
usage, but I thought it was worth calling out.

Fixes: 6cc6e08d4542 ("drm/nouveau/kms: add support for GB20x")
Signed-off-by: James Jones <jajones@nvidia.com>
Reviewed-by: Faith Ekstrand <faith.ekstrand@collabora.com>
---

(no changes since v1)

 include/uapi/drm/drm_fourcc.h | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index ea91aa8afde9..e527b24bd824 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -979,14 +979,20 @@ extern "C" {
  *               2 = Gob Height 8, Turing+ Page Kind mapping
  *               3 = Reserved for future use.
  *
- * 22:22 s     Sector layout.  On Tegra GPUs prior to Xavier, there is a further
- *             bit remapping step that occurs at an even lower level than the
- *             page kind and block linear swizzles.  This causes the layout of
- *             surfaces mapped in those SOC's GPUs to be incompatible with the
- *             equivalent mapping on other GPUs in the same system.
- *
- *               0 = Tegra K1 - Tegra Parker/TX2 Layout.
- *               1 = Desktop GPU and Tegra Xavier+ Layout
+ * 22:22 s     Sector layout.  There is a further bit remapping step that occurs
+ * 26:27       at an even lower level than the page kind and block linear
+ *             swizzles.  This causes the bit arrangement of surfaces in memory
+ *             to differ subtly, and prevents direct sharing of surfaces between
+ *             GPUs with different layouts.
+ *
+ *               0 = Tegra K1 - Tegra Parker/TX2 Layout
+ *               1 = Pre-GB20x, GB20x 32+ bpp, GB10, Tegra Xavier-Orin Layout
+ *               2 = GB20x(Blackwell 2)+ 8 bpp surface layout
+ *               3 = GB20x(Blackwell 2)+ 16 bpp surface layout
+ *               4 = Reserved for future use.
+ *               5 = Reserved for future use.
+ *               6 = Reserved for future use.
+ *               7 = Reserved for future use.
  *
  * 25:23 c     Lossless Framebuffer Compression type.
  *
@@ -1001,7 +1007,7 @@ extern "C" {
  *               6 = Reserved for future use
  *               7 = Reserved for future use
  *
- * 55:25 -     Reserved for future use.  Must be zero.
+ * 55:28 -     Reserved for future use.  Must be zero.
  */
 #define DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(c, s, g, k, h) \
 	fourcc_mod_code(NVIDIA, (0x10 | \
@@ -1009,6 +1015,7 @@ extern "C" {
 				 (((k) & 0xff) << 12) | \
 				 (((g) & 0x3) << 20) | \
 				 (((s) & 0x1) << 22) | \
+				 (((s) & 0x6) << 25) | \
 				 (((c) & 0x7) << 23)))
 
 /* To grandfather in prior block linear format modifiers to the above layout,
-- 
2.50.1

