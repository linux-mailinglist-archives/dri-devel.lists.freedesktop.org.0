Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8F596B3A6
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 09:56:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E713610E6AF;
	Wed,  4 Sep 2024 07:56:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="k02JmGhQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010055.outbound.protection.outlook.com [52.101.229.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A217D10E6AF
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2024 07:56:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vpBNg53XIGI7yyxscfwyn/t0HCbwSM0NLwYGvrDQzga3ieSkV0C6XOvUaxaTZYK86HJKHmoWF40vrpHWIWZICsug0CIEHGlxTS9j+AjIM20o5ZAoC1TnVAofJ3IV8D9j9mn5eaJQafoZThU2lJ6PIEzUTUw2O68PDlyOZ7RA0MJd9CSuoRfTKd5FWDReLAHla6VI1TbK8OqI3sUQKbm565O351fIWu8IdfmXqqempPfx/UvPDRp1vg1NWQ9gUzTD7ikGsRw5yYvZWEJYW1Y49p1eC0v/qZkrpwj9Jc1fgFHX2ZmyHtGQARVLubiV4eph4v1Nk+dR9LYPYQ9pEBBYBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nslbi92JKKycB48b/45jHVi+nurh2rJJ7nCi7nhcMDg=;
 b=Y7rTfviT91sLTGai6+h+Qm/2sBzqlikxTx5BiEtqdSweDp6ITIfpU1CPa9WWnY9BIDEOYx7rc0DAfW+0p942wcA7g/Q7lUAcH73fLjnvPtFMSJKLTnHWmIBWdZTv6TLIyR1J5lFylBJ6SV0TWH84SqelKe4wwLmZ/23dW3b63GagBSPafnQris11xXDqHCzGowpw99Ba9fJFIySWQGXFAo8R7BX19JD6F1QkttpcihIffCf4WFm3YIq8xbgQbeW4R+RP7CuCn1RqHRNvis3zJp7jvqW4m6ppW4cWhV1zG36nUlSvlS9U7bMX86Rp8EAug6Q/5SCUpf5tnznQTQKjgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nslbi92JKKycB48b/45jHVi+nurh2rJJ7nCi7nhcMDg=;
 b=k02JmGhQZWP8GkKWNslwAYH+u09BaNM6H0MKUemOWGi3Pot50y2kKWGIclX9FC/eldrqsQGl2Nhoo/6Es4Ktn3zUS86OJGTLp02KvIa5DQHM4WYiFyLn4ozzTAjQ6WUfLRFE6nZk7XY33ElNwDOdyX0epRI2UL8E3zE4Sa5avoE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS7PR01MB11759.jpnprd01.prod.outlook.com
 (2603:1096:604:23d::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Wed, 4 Sep
 2024 07:56:30 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7918.024; Wed, 4 Sep 2024
 07:56:30 +0000
Message-ID: <878qw77sya.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Helge Deller <deller@gmx.de>, Jaroslav Kysela <perex@perex.cz>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
 Takashi Iwai <tiwai@suse.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
 linux-media@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-sound@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH v5 9/9] media: xilinx-tpg: use new of_graph functions
In-Reply-To: <87ed606j88.wl-kuninori.morimoto.gx@renesas.com>
References: <87r0a06ja1.wl-kuninori.morimoto.gx@renesas.com>
 <87ed606j88.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 4 Sep 2024 07:56:30 +0000
X-ClientProxiedBy: TYWPR01CA0044.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::11) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS7PR01MB11759:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a071dae-5385-40fe-b17a-08dcccb71669
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|52116014|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?21FyEdtMuOiKVjv8eWgBiziWmGto/bT9P5NAWKtcCu8DfCbTmbWyojexukk7?=
 =?us-ascii?Q?esaSR+cLQF7ms2aUyjy/qT1KiAnfpjtTJEo+tx2bYhazIeZsba9BIpuakuzR?=
 =?us-ascii?Q?De2Db5mrZqBOtfeO34b0NwnyIu5yrK8w8LZUxK8MHUfxhpGBKRoBEkj0Kn+M?=
 =?us-ascii?Q?r0smqCUzNkur2GR55fOTFc+7APFV0rlIfn1z/O93tZmGVdUQaJF/dQ3RPVN8?=
 =?us-ascii?Q?RxJ/WHo2g7gLg94wNZJoYq9ouKKDG6fyGP4+UoUWTflJLlF+4rRn1F56cDwP?=
 =?us-ascii?Q?B74ugBnYi9lzqj3dc8Gfk1lpOzC2HR/jLdCAb1qeSTDmcgoElXYs5xw0rpYe?=
 =?us-ascii?Q?9jRY0rWGDr/mom8/x7R7v5tXCH6HVN/o7UdvHuMdLcQ7g4VaoLeE6Y//XPdG?=
 =?us-ascii?Q?gMe2nu1OwscE9eulPaJg4wqIy0u/GtsKLhslZVPC11bsIu/PpYQ+VnRFL4h5?=
 =?us-ascii?Q?oCiWIhvodIIWyG6hOSaAKcx09yn/AWxwFDm8UFPqT07KvHcj9lN8UCLu8vZT?=
 =?us-ascii?Q?qc+yxq0jokfGBdwOU3flcXdExrR8QkgIft5Koub67CNLYjoE9FwZzVWtwIBx?=
 =?us-ascii?Q?vbsWH5a1CxRBRROX0SGHDELjsIxSulZT44BN3CdcLB9PS6RP7XMSMdY+VCyO?=
 =?us-ascii?Q?BOzQestgtbQAfmLE38lAgh6uRWyMNo40208LKxXHpwg82AJ94HUCEVDPHs/9?=
 =?us-ascii?Q?3SjoDPDtbAwuVHMnMnFkI9wyB6+H5LCOUiC2W86cUZzVScBwb0wg4Z8XWVvQ?=
 =?us-ascii?Q?CQMzRWTVIYHyNuVOT0rjXYcTkUSieU99ReI/PCKP7PJmkFrj8KQ4srpPrOT9?=
 =?us-ascii?Q?ZBqUAn+H9NiUAs+PJpQhk9DExYn02UrAjhUhtdLuFrM59dLcVQcChyuaLJkx?=
 =?us-ascii?Q?gv6t+KhWaQXAAC+UNaLeqRO3Jr+81HdDbemgpVoEgkq5CyUbaC5/YScR86zK?=
 =?us-ascii?Q?2b4bWi3dF3rLwCTMxAJ5w5Wgcw3/VcE9Q8ttBtWLskl9kcFmJLM5hUKg7NSZ?=
 =?us-ascii?Q?0kkLl8Deww+ZAezIEc/KuQPFd4Qc/+XQr3pQS53o3KBymtbgmH+A7/pnHDNz?=
 =?us-ascii?Q?Gtz5gqCtECEoGGSqlIvJpgNa29Q61UoCfRIquDaBDJHh03l1wGse+92JEfkO?=
 =?us-ascii?Q?ri2xmHgUS6K3omGfLJIO/WQCGRaqscaTBrBUVP3hcM5xKvoajyVGvRd1ykPl?=
 =?us-ascii?Q?iTSyR7HAbTrnGw9H0q0Gcp1LbMZFekgM6a+X8x3Uw1yRbYG7km3UQQMqA+hp?=
 =?us-ascii?Q?XE0bpLTkkrARLcruX6VP1PohGcR5wRy+y4JKkA3+BU/oS4p+cpQGgCsF1Tgd?=
 =?us-ascii?Q?pbde8pvLBxQqkYVFqCubfmyj2dhWAdbBkj17w4tP45jKTx95WgQn7jOU2vWs?=
 =?us-ascii?Q?4OL71sjqiuCaYgwiiEsCwkA2vUEI+bGkTk7Yrlb5TXypv/4+fQwcrCBJIao0?=
 =?us-ascii?Q?KA5QSv7dm+E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(52116014)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HmxVQWItBEPmDkffc2HLhK3AZkvi1vyG30nZfxeeuFNAai7kkez5wujepvIt?=
 =?us-ascii?Q?UAJMbwVhWdpXs5jlJuIc5cbQoOcydw5rClrg7hHcrnJEpZohTOw8fMZLAUvT?=
 =?us-ascii?Q?j7DxWJXf08En9YqLvadlFTRLoSSll1MT+8CL4gsnWGRJEq1AJy8mKMjhcJo6?=
 =?us-ascii?Q?FUKJNhzszyF50tIfhc25B0hfRsVQXBX0NCE83JXz4chJPETu2bTFs4zLrYL+?=
 =?us-ascii?Q?NnyyuMHstFZEKcYAFNchswz3KgxxXve5dS+ZnYxwOsggUOVrERHATFZpDB1Y?=
 =?us-ascii?Q?0NbENFfHpxjEUeIDa2OCXQdiebNr058H2J4UB+EJL9ACr1N7dvw/YYgtwJrT?=
 =?us-ascii?Q?iMuLcyqLAlKnnPsM44FcDATl8WCr+MN+zvFQLtbogVGX/Cf6Hp+R88TlVQlu?=
 =?us-ascii?Q?49D7Hji/4YkeRbvXk6Oiw1Led3lD2OCXETGXVglpPe94cEw9f0o6UiV6OTOg?=
 =?us-ascii?Q?wW3Vm/55XW8NpIbNueqi0xnpHFFR40KFPPRmD7iHZKWo16YlgnLG9aI8oWiZ?=
 =?us-ascii?Q?XymG9uE0R9Ffnd6PsUMhUmrkRRdIb/c1OnNEkJ656lxITCZDaWGO18fQCTc6?=
 =?us-ascii?Q?ZfXXuvg+0L3pYf4J0XMiap1R3FIAu0b6eLNqajPNZIeSMvsZCo6PeBmC05Fv?=
 =?us-ascii?Q?fYBhhLVijxqfVauU3AFYVSoYMXISFwfeCH/bret46Nf4yxmrpz9FU0tuDw23?=
 =?us-ascii?Q?UOJYiEsU4duh8DC5mLjPhOsbuj0YNsAwUmjjiqYM78x2yzbRTlbKcZhH9J5Z?=
 =?us-ascii?Q?F+cMbd/+avC2OAlROgGCxbuOIEBmxti/B55SGCSym1DVjUlMUbyCvtTDHpmB?=
 =?us-ascii?Q?sFLpY3mV2sdbq2H6Fgji+uE2ISalSecKrgunu3/ejyTr7e4aVBFjfhgFAALA?=
 =?us-ascii?Q?mf6imvvTCF1vmUlrW70BBfFEtkLDmZhYp8HP2YetINBYif4PbRJBOfGqO6GC?=
 =?us-ascii?Q?1V88i+Xw31bYEE3qpw4x+MyRUigu8a8vGCoULRnLq8w9JzHP5xUDHZOjXfIg?=
 =?us-ascii?Q?r1JqPjqpYWhhuuJ0Nxuk+pLu9vUhu1LyRQkhUmSUq2GD+ZWJTgK0aBPM4F7s?=
 =?us-ascii?Q?nwjb2aQEpWbAk/8ykqVZngAowzWua8rvu5sQ4Jb0QhVN1bj9u4nfQmJpbVFx?=
 =?us-ascii?Q?87rv2MMaFu6s7ksoUnxK/AYmxWEFmnMsWaWLDD0nACu55/Wlrs+2LfZflKYv?=
 =?us-ascii?Q?BMLbbagD/qey75eTQ+sTXklCMoTSw4rqpyUhKn4Py+fZ0sgKfB5KmB4iGS6z?=
 =?us-ascii?Q?oggmEVBRaYJc4s7Q1yeIDr4m+5qK8LOGk8jPyBsxmzDKYShTHBSPTy/SNRsQ?=
 =?us-ascii?Q?DPa1APp8EYzyaYWn+XTCTgdJhaeGneNbeV3tsUBkpzUKv5/ZCkI3ostw8ycV?=
 =?us-ascii?Q?e2tjX2DA0/Pu/gFJfsTUz8THtwiLtMu820M/cR0L63b7TY1S2SE+2b6pwHRd?=
 =?us-ascii?Q?aUxpukIQFqPc3GaAB5TpOLnBqwFVFcDaG8MoMJ8130C0Jae8R2fmvPBWilyh?=
 =?us-ascii?Q?4c8mUt/6ewg3h5+U4xKW1M6uFYgDAIW4S7Igxt2MRJWjxi/K8YfYNHp6+mX+?=
 =?us-ascii?Q?5vG4RBBJdVxpjP2xGrd2/Hioqmm14yK8Ud/99w91wR8ehwh7z3SmpMXHJF4G?=
 =?us-ascii?Q?MhGg+jjeL1MLnJUdKto8Nxw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a071dae-5385-40fe-b17a-08dcccb71669
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2024 07:56:30.8028 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yR78lnPVRXpd2K3+GWceYQFq1sL5En284tZEHkz49OaTXU3eHsBV3dD/4J2SPWZc6qZNDQhm+oEox7VkdAQEkg32iKEfVjTiqDiYof3og2Cw9YkpwPNm3s9fxdfBb1gE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11759
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


Hi

> Now we can use new port related functions for port parsing. Use it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---

I'm sorry, but this patch will get below warning

   drivers/media/platform/xilinx/xilinx-tpg.c: In function 'xtpg_parse_of':
>> drivers/media/platform/xilinx/xilinx-tpg.c:715:29: warning: unused variable 'port' [-Wunused-variable]

I will post v6 after review

Thank you for your help !!

Best regards
---
Kuninori Morimoto
