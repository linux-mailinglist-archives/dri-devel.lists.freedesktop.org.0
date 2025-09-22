Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D9EB91D58
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 17:01:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B761110E1CB;
	Mon, 22 Sep 2025 15:01:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="bjJ+w64l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11013040.outbound.protection.outlook.com
 [52.101.83.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C49CE10E1CB
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 15:01:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jwZ7cnJpALFA8LjlShnYPEfiOeuKYlyNLVeHolZizd60c4ZUpzelmMqBv08YaTU+YBpaUgb/T7vnY+DfRB16iokchzFnaOf8Pit6OBsSmSrcAZIES6JmnwBteVK0OoDPIEb6b0QQ+p5u8gdR382DWF+YECSztDOUi8Xt7exFPQp9bgsyFHYBFHtDd7OvyvXRNuDDSq9kGeR8qphp4521snRtOW1w8cU9aNj8boh84SrbbHwFOThISOhk9mI9NRNo3YIKscd8ri3F9hMLoMUdlF/Z/JbGLb2r1rCcm75ymr1BthUUxXia2yEMeDV7RDLiE2dzurDBBbuDMGjwvneVDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hbeyaNKKzQhv9YCeQh/bQ980aTC2P2Mt6VEFDWyAhCo=;
 b=nw+2eAPtsSMTBdb3n1F5z2cN8CDezIhjt3v02UbiTP38tfytcOClO9WRhC4nAhTedP9L0dh4tuyUu10bqc5D6Rqt5wqLr1ZcfFb4SFzIv9ChYia8S5ol/V7pfGVMXeXSKzumWB4eEQBtPbxuxd5ApC4u1XjyHvq2SfUvMw8x6IgO1431C9x+GJkHiXKXGeQTnRw1GKzrWxy2CraiVeEDSGK/Rx/hBN5v3sl4farV1Rcj+DzUnjDs2EkeIkFPldH11YeG08M3qEE3FL+GAADwdCfnTd/Y1nB247IsBrrgRnVWFjGMKfVPNxaspmPGtyT1HWTHgyJxQpGFY24nvIeTeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hbeyaNKKzQhv9YCeQh/bQ980aTC2P2Mt6VEFDWyAhCo=;
 b=bjJ+w64liRKWdSenJpVQVjMYqb6/aaRsl2XXobd7heg+nEs8o4uq/3U462w3QroNOBqLyQCbBVy7nznsPLEpwHwUjt/E4mYIrwFSZDpFy+jYrRq++G8Gz4BqLWvcGUI8wJlQGOtHWuUPyPyeEEQ/Yh7Sn4tj2OYu2btHcsswYCRjULNb1X8aIH0AGKNB75L4lDs3nneFTGKVFVjCAHMTqs6kpZGU70y1+fBU4g4064P840kubwGp98PsShbiezooQxu4RwzASQ0+OtOPaoS3hyYbjl5pehmlvU5zFdXdM0wI8CfiUWcNjGJhXHsbI+ovvcJHoen2Q827kCucr/4Ubg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by GV2PR04MB11639.eurprd04.prod.outlook.com (2603:10a6:150:2a7::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Mon, 22 Sep
 2025 15:00:56 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%5]) with mapi id 15.20.9160.008; Mon, 22 Sep 2025
 15:00:56 +0000
Date: Mon, 22 Sep 2025 11:00:47 -0400
From: Frank Li <Frank.li@nxp.com>
To: Liu Ying <victor.liu@nxp.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 08/14] drm/imx: dc: Use TCON operation mode
Message-ID: <aNFkn0zXFJQE0r5C@lizhi-Precision-Tower-5810>
References: <20250704-imx8-dc-prefetch-v1-0-784c03fd645f@nxp.com>
 <20250704-imx8-dc-prefetch-v1-8-784c03fd645f@nxp.com>
 <aM11kCDCGaAFO7cv@lizhi-Precision-Tower-5810>
 <a4a75e87-ffe4-4660-a1a9-19ab06521a6e@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a4a75e87-ffe4-4660-a1a9-19ab06521a6e@nxp.com>
X-ClientProxiedBy: PH7PR03CA0019.namprd03.prod.outlook.com
 (2603:10b6:510:339::22) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|GV2PR04MB11639:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c0a0ce1-1e6c-4501-f9c6-08ddf9e8d51e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|52116014|19092799006|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Kz3BCIIO5vQ/z014JtnsXwuhQ06OSuQlPwFimnuVfRErJwBlpZeaUVPIdGRf?=
 =?us-ascii?Q?lk/etCWvYz1tJ/yt996l23/V1xIFqkKhlsEIdEybmYUteU3/LuR2vUvGBVC2?=
 =?us-ascii?Q?euDLNcFc4cj6YYt6guNQ/tLMpY7GmoHos5VMY9dya54Pj8OrkKPLOwr2QNsy?=
 =?us-ascii?Q?/UkQlLf+nnUNhjFH1OKhK2shAryUMvSQ98fLHnBKEOfEXuF5CAlXWHw3Beph?=
 =?us-ascii?Q?4n81hvaVWwTrqZV7mmVEJIVeP5s8J79wi2JDRFuiOtI35wbzHpAvJLE26IJe?=
 =?us-ascii?Q?NxF245MbP8JJ/9kSzVZTdMw9UwTTwopq2OsmBBng3oj/Hh/gSqOLX9gep1pb?=
 =?us-ascii?Q?LfIhgiOWn0UpPDQAzq+ToHc8GMBjbFYodttVwPRPwAdja6TP3hz3KhQbcqsf?=
 =?us-ascii?Q?dhn7MSRl9n/JCiFvizfeKBVcasFQNYqA/NMTdJHG9v+sHlS4Wqhp6YN8GXwE?=
 =?us-ascii?Q?e1pQSstDLwUhHv9cEdlD1gSZ0yX6+P0tHjW6zffLqBnfuq3VKdjlwYumi2hU?=
 =?us-ascii?Q?f1ZyCbp4Y3JP0TT5oUq1Yn31ePOrjM4ncQm54HRD3/h1+BxY7oGotwEg329Z?=
 =?us-ascii?Q?mWKOX8iRFozFVbroEc9VYXb5jb26n97BcSB6MxdsBBvyLwKGgSABJways0em?=
 =?us-ascii?Q?g+yfJSLEktS3hYRAHpmoOvDO1pH4lRfY4OU/2pM6/fjPTX2nhDLjum0BmwRz?=
 =?us-ascii?Q?lTLenQ+so6lWpn2mQ3b/bYfpEquy2o/Y24YSM4Ea8LDqFUQucZdSkUlZ50da?=
 =?us-ascii?Q?bGh+aRh9qBmR+DAYJac13CNhltrqBNG0tZJmb1ILN50dsTclShBaNgunQ+1D?=
 =?us-ascii?Q?kTypq7Z32W90KThBT7cfqfEcTmhRbV1eSbOmpcMnGBY9Lg/INuKYR8xbhRTe?=
 =?us-ascii?Q?wUXhpehyu8r8nejwsIfoPvKgQRZ1OpeAqVnQMWrxpI4heB0CqxmUfP7AY0Ui?=
 =?us-ascii?Q?vAf9b4U8kqhfxv1SjbAGGQuUORcUqzUQj7qN/S390CBgzUPQnYyMweLIonEc?=
 =?us-ascii?Q?I4HcqcYjrbPVTwgWLkfuD3PXMkdMHneewtSLE7woRnJcyVu7OPxE/koV9iYm?=
 =?us-ascii?Q?NCtr4r3X4xRgg/bmLnnZwu7b26PSGasK6w0ti1TmjnplHv6Pil42AphJMeTq?=
 =?us-ascii?Q?nyDYoLP8MYO4r9TXHzf3b18dHYhU3rsahZbDUAgLdVlWs7GTYpK7JawEQAUu?=
 =?us-ascii?Q?qfJyX8+xICWdgRJDnqje847JIt+PyibEKZnXryRYVMpzqQdefEeXMwOLCsfk?=
 =?us-ascii?Q?7GXeW1KLblcHLli1Ru6WO+7Vg7ghIuKxOgKg1cwg9JJSY6xu91u+TfiHfxw1?=
 =?us-ascii?Q?jAmryBl3pkFEfkuCwl/RYS9wQifFgzEkfS3ngRn0G+lT+db4PiVnxIDpoJ7x?=
 =?us-ascii?Q?OM99+pNdctrw1kl54rZRF2HH7YZsbNwYdqliCAY8zgA0v+9GZzizNGtC9n33?=
 =?us-ascii?Q?8XxTcizX2phpxF1JrODZfmZnGbvZzcMx4UAnizbMXQZjhHN7hv3Wbg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR04MB9626.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(52116014)(19092799006)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Xk7vrK7ww7XmyD/zWZP1wUAcI8aSHHBuSLnfzGRnIUguDtcjtC5KXOi8fzOD?=
 =?us-ascii?Q?k8yUt4mM/Xp72Rq/yGbcJFPhkScL8NhLmyeNrYx+eKtqT88bNGGcHsMf6qE7?=
 =?us-ascii?Q?93ARBe1sxvIEcK5gt8503Ri1lYqBx6S7W8gFz7+pi7LswTrS8yVwbJGVHWCB?=
 =?us-ascii?Q?loqMM5I/CpqO/8jp5IpjD9iIlQzMby5vp6LCVEEmP3aeGvMpZj5OEjP2MJMo?=
 =?us-ascii?Q?56riJQFsjl+8RCVoa7BZ/g06FYIV9v8DJWRSkHYSFdIVWnVRIKanwGrLVSDl?=
 =?us-ascii?Q?Iga8QKVavUJYj8mKVFKfAM0jacX2W0txeb7j/tkTYykzprnAyiMmh1bRqTNQ?=
 =?us-ascii?Q?J9vFgNnd37qB0WWrgtZxZJUEskwhREGx035EiCSqEmSzphVL3lPp/jkuShfq?=
 =?us-ascii?Q?D4tLlurEWquOtMHwDBb64DbiAMuJfWAAco+IOKGQygzpeEuQm6KNHqFyd996?=
 =?us-ascii?Q?dFoaZlxTuEYJmxVxNnonyXevMxBV7CGjamtPbBJiZBCw/HxKaW5devzXA+wB?=
 =?us-ascii?Q?/9j9bs1qgPAQLFElYzAkxEeKr5K1ReEX+eDh0Vc1o1fg9W5AMdzYh7X1H67M?=
 =?us-ascii?Q?PHOY3oRFhp5mudb8neVvmigtBvEj6EMiGwy0Zeg9uKjaJwkO58WlfCvF1nAU?=
 =?us-ascii?Q?/JHIr2XmkBaKrtRky898kBevwiVmvmCxvp4eowE+VRxUqBeNZvN2sDoTWE0+?=
 =?us-ascii?Q?rSsh86ayoxKTrhE/aR/WrzqtgPuTtGy8QjcbS4NhKzCt97Mhcekv+kWXVPQO?=
 =?us-ascii?Q?Q4JQwBubF3O47OES4MC/JQZrj8HE5XrP8tHSH+zpClD7LWzaB+Kn0Gy+8IGF?=
 =?us-ascii?Q?x/bSM8sI30hziCvEiOT4AZgVKMS+EMVYu9BmeBpu4bZsqMfExFImTgCU1J6K?=
 =?us-ascii?Q?RC8H2KAKU5abGAyK/WtMGKpsRFuVxKS2cjs60WJqf/V1uOyGwK1NlKUZBl8r?=
 =?us-ascii?Q?8/Io0RGPncBkU49+alC7vgP/rmLPC/EUfzTtWiN30op25FAcMk21l5zZz6h3?=
 =?us-ascii?Q?tl7yiu4LyVnCVcaCfq881ierSuHVWB5N0uXqOHEZy0t/Q0gvYylwtWiBG4zV?=
 =?us-ascii?Q?f2BK7FFX0hKUA0+UHmsr/4CGFRfV/Idhv4w0wlaJvBsBDnSSVqQrkBGF2iJq?=
 =?us-ascii?Q?dTQwapekJ3eZhXLKdEbj5TNjP48jHaLlhzaXorn7eZWzVqlTAputvXsD+hnn?=
 =?us-ascii?Q?7b2kXLWcvfasqWjaSCD018Yp3kCki505KP8xOJCDzM7NQd2swSnscchp+Abd?=
 =?us-ascii?Q?6egOsSem/bgMyglB864HuGjCsP/bdLJ/nMmgj2tLuvZMkuHU6e6kdSdc0N22?=
 =?us-ascii?Q?yHr0mhCCai6NbCDbFgIweORtvuOuu22sqR4/D1UblLTRdnlJvJC2yDZPuqrY?=
 =?us-ascii?Q?dsH98zSI/Z8OCRDpsoD1WNWPOQUc1ykeht4xB/Ayqc7+GAHkdQeqyCxjLRej?=
 =?us-ascii?Q?HhkdFAjTOLlIOuDO/MhRIovku598gH0IJ7Hu7UioRlj3eFIED9RD2Ho/fmac?=
 =?us-ascii?Q?NqWz2eGw/5RWeEbXyB2XL8dxvr2T9iZ4rKW3JWfSVyDZ8h/UhjdIatBXVsU0?=
 =?us-ascii?Q?JaxFbPe+n2EpegGyhuY=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c0a0ce1-1e6c-4501-f9c6-08ddf9e8d51e
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 15:00:56.1906 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jSHImmc7FeN1i4eN8ONM8FOKberLkrc+J/CHVyVG7L001kSciewqGUiot3m6x3czvSUd1ryZfP4zBAFgj30zoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11639
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

On Mon, Sep 22, 2025 at 11:48:26AM +0800, Liu Ying wrote:
> On 09/19/2025, Frank Li wrote:
> > On Fri, Jul 04, 2025 at 05:03:55PM +0800, Liu Ying wrote:
> >> In TCON operation mode, sync signals from FrameGen are ignored, but
> >> a much more customized output timing can be generated by the TCON
> >> module.  By using TCON operaton mode, generate KACHUNK signal along
> >> with HSYNC/VSYNC/data enable signals.  The KACHUNK signal is used as
> >> a synchronization signal inside the prefetch engine(DPRC + PRG(s),
> >> attached to FetchUnit(s)).  Carefully switch TCON bypass mode to TCON
> >> operation mode when CRTC is being enabled so that the prefetch engine
> >> may evade the first dumb frame generated by the display controller.
> >>
> >> Since TCON BYPASS bit is controlled by KMS driver when doing atomic
> >> commits, drop the bit setting when initializing TCON.  This also
> >> avoids accidentally initializing TCON BYPASS bit to 1 when driver
> >> module removing and re-installing where an upcoming patch would
> >> disable a CRTC at boot in TCON operation mode if needed.
> >>
> >> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> >> ---
> >>  drivers/gpu/drm/imx/dc/dc-crtc.c |  28 ++++++++++
> >>  drivers/gpu/drm/imx/dc/dc-de.h   |   2 +
> >>  drivers/gpu/drm/imx/dc/dc-kms.h  |   2 +
> >>  drivers/gpu/drm/imx/dc/dc-tc.c   | 114 +++++++++++++++++++++++++++++++++++++--
> >>  4 files changed, 142 insertions(+), 4 deletions(-)
> >>
> > ...
> >> @@ -249,6 +260,7 @@ dc_crtc_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_state *state)
> >>  	enable_irq(dc_crtc->irq_ed_safe_shdload);
> >>
> >>  	dc_fg_cfg_videomode(dc_crtc->fg, adj);
> >> +	dc_tc_cfg_videomode(dc_crtc->tc, adj);
> >>
> >>  	dc_cf_framedimensions(dc_crtc->cf_cont,
> >>  			      adj->crtc_hdisplay, adj->crtc_vdisplay);
> >> @@ -273,7 +285,22 @@ dc_crtc_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_state *state)
> >>  	dc_ed_pec_sync_trigger(dc_crtc->ed_cont);
> >>  	dc_ed_pec_sync_trigger(dc_crtc->ed_safe);
> >>  	dc_fg_shdtokgen(dc_crtc->fg);
> >> +
> >> +	/* Don't relinquish CPU until TCON is set to operation mode. */
> >> +	local_irq_save(flags);
> >> +	preempt_disable();
> >> +
> >>  	dc_fg_enable(dc_crtc->fg);
> >> +	/*
> >> +	 * Turn TCON into operation mode as soon as the first dumb
> >> +	 * frame is generated by DC(we don't relinquish CPU to ensure
> >> +	 * this).  This makes DPR/PRG be able to evade the frame.
> >> +	 */
> >> +	DC_CRTC_WAIT_FOR_FRAMEGEN_FRAME_INDEX_MOVING(dc_crtc->fg);
> >> +	dc_tc_set_operation_mode(dc_crtc->tc);
> >> +
> >> +	local_irq_restore(flags);
> >> +	preempt_enable();
> >
> > Does it need reverised order?
>
> I'm referring to __raw_spin_lock_irqsave() and __raw_spin_unlock_irqrestore()
> to do this right, where local IRQ is saved/restored prior to preemption
> disablement/enablement.  Am I missing anything?

Okay! That should be fine.

Frank

>
> >
> >>
> >>  	DC_CRTC_WAIT_FOR_COMPLETION_TIMEOUT(ed_safe_shdload_done);
> >>  	DC_CRTC_WAIT_FOR_COMPLETION_TIMEOUT(ed_cont_shdload_done);
> >> @@ -561,6 +588,7 @@ int dc_crtc_init(struct dc_drm_device *dc_drm, int crtc_index)
> >>  	dc_crtc->ed_cont = pe->ed_cont[crtc_index];
> >>  	dc_crtc->ed_safe = pe->ed_safe[crtc_index];
> >>  	dc_crtc->fg = de->fg;
> >> +	dc_crtc->tc = de->tc;
> >>
> >>  	dc_crtc->irq_dec_framecomplete = de->irq_framecomplete;
> >>  	dc_crtc->irq_dec_seqcomplete = de->irq_seqcomplete;
> >> diff --git a/drivers/gpu/drm/imx/dc/dc-de.h b/drivers/gpu/drm/imx/dc/dc-de.h
> >> index 211f3fcc1a9ad642617d3b22e35ea923f75e645b..c39f2ef5eea98c3eb6ae9b5392f9bf9f7e33e7c5 100644
> >> --- a/drivers/gpu/drm/imx/dc/dc-de.h
> >> +++ b/drivers/gpu/drm/imx/dc/dc-de.h
> >> @@ -54,6 +54,8 @@ enum drm_mode_status dc_fg_check_clock(struct dc_fg *fg, int clk_khz);
> >>  void dc_fg_init(struct dc_fg *fg);
> >>
> > ...
> >
> >>
> >> --
> >> 2.34.1
> >>
>
>
> --
> Regards,
> Liu Ying
