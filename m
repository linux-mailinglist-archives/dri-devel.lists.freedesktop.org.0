Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D79359AD85F
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2024 01:24:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA33010E241;
	Wed, 23 Oct 2024 23:24:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="iob5VUbL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazon11011042.outbound.protection.outlook.com [40.107.74.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA1E310E241
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 23:24:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QOV5JzdkKomkuq0kGKLg473T0WS7efiH0uprWhaGwu2SC2oNSgkktswajRkVquMmeboOs+k8vccAU9vuLWWJb7kef5r/7OlfGU6zndGKrxUOusVQtj7Qn8hIOdnc5km1lH6OVZ28Yi2avMvYV8x10GcEwlSk4lWgPa7nvFg1gMliex6BJ/iEgmiQsZDW/SoEEignfgBwVsHGuqjvDAsCC7Rk8jpHksxXt25IOJNZZ1hMecYU9Mh7dSW/7lV8rDKxcZnHg4FDsZzFPDcOn4qlDy+6VL7h8b/WXlB8XFpOWaYFrr/H7AuCWnrKM/Vmlggx2dlDhr3SSDl06FR3kTKovg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eQbtT0EoLi2XJldMq9hJV8PBzOo+xjgIFlwOVqGopok=;
 b=uynHEIcAI8rZ4/QBQFG1rNOyYgsZ/u0JvSYj9ZY5X6O9k3k86mAiTIN0gKfitXLdZHb+/iNc4Dz0f9FwEcD59vqlmnsUMFjo6Txg++Zo3k6mH4hS8Re2qbhn/inPYXC5dc8z+lWB2HogzDby/Zb80YqPMJ49KsR1YHv0S+DeS3lv2VuLrxWBwgWtADQcrzT5fT+09DlPLRM3A3zOVNHEPGiAcE2Oj/ZOmlZ4EqbLFLlv5GCzn+krAr95jHTInCBrMhPedz62v0bU+jRmFHlPBJc+SZJMxMT1GJSYyfrOqRK8+P2Ph9CZUbI45ksmm/o0m5p7iq5042h9nkEQi/UzpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eQbtT0EoLi2XJldMq9hJV8PBzOo+xjgIFlwOVqGopok=;
 b=iob5VUbLI21n+q+Mczy/dWKVqaxMbwxqeqBs99sQ3SS0aPFP6dSPLX/g+zt+dwEk53Apb2f1gisoXLJuPBFa+BtO8vGtjasyPhb45Vb5b+kipotP62z62CUEDoRUJZD7lRhz/cmsmFvEOQkh+9KjEriAKOsKTbcW2QfMM3TJmd8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB6917.jpnprd01.prod.outlook.com
 (2603:1096:604:12c::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.17; Wed, 23 Oct
 2024 23:24:06 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8093.014; Wed, 23 Oct 2024
 23:24:01 +0000
Message-ID: <87cyjqcsjg.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
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
 linux-sound@vger.kernel.org
Subject: Re: [PATCH v7 1/9] of: property: add of_graph_get_next_port()
In-Reply-To: <Zxin_DeoTPjZ0enu@valkosipuli.retiisi.eu>
References: <87wmiirqwy.wl-kuninori.morimoto.gx@renesas.com>
 <87v7y2rqwf.wl-kuninori.morimoto.gx@renesas.com>
 <ZxYiD5CCzcrwbD1o@valkosipuli.retiisi.eu>
 <87y12fwhwy.wl-kuninori.morimoto.gx@renesas.com>
 <Zxin_DeoTPjZ0enu@valkosipuli.retiisi.eu>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 23 Oct 2024 23:24:00 +0000
X-ClientProxiedBy: TYCP286CA0307.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38b::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB6917:EE_
X-MS-Office365-Filtering-Correlation-Id: 42f2e4c7-e2db-47d6-585a-08dcf3b9c6ba
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|7416014|1800799024|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NfVk69mMPgvrHzDe6f6AwEBqS771D8dzPdKKRP8c1IHLX7AZTdesWf7EQ/Gs?=
 =?us-ascii?Q?X4J2tC3jeAU9cHPoFBMQuVUkEThRaifBed7SZSHPr27Rb3i9llgKfB2cfqzf?=
 =?us-ascii?Q?cWhfqtoM3XIkcrHwltJf9z8qpejHuRghUqeavpHbujmd0VAmZZAFQHg0udYA?=
 =?us-ascii?Q?XsFyN1mvTNmyLZDB7+9mwgc9sxsuPsolNOIO46FaxBo9HkB2fAO58J00fUcq?=
 =?us-ascii?Q?JOmpzd844IlYOq+2nQs57Adq4Q9stlouey31p/Frd7t0QOyVre+a625sL9TW?=
 =?us-ascii?Q?2nmYGISZ1wpTHb7LfEee9h90DKH69u958lJrgFaKqcY+PhUC4rjUoXd8ncAp?=
 =?us-ascii?Q?/zmZbXFufDiLCCYHDGsVxDdYKBtW6sPsj/JhS2XAqm2mUQZA+EDexiut2o8O?=
 =?us-ascii?Q?23qU+CJtdMb789UuVwRAM/3B3WIllsFJR/SYY8wzCMMcWJaksf9S0XusAGCq?=
 =?us-ascii?Q?EP+frxbnDbpkNAu2ppWtZB2LxETttGWuu17r3bgTA2Y5W8bKy7v26R86FpZr?=
 =?us-ascii?Q?QfbIcYFJeGrWkI+4AnethD39Sqi3+ZZevIomEr+CqFRqvFRx+G8Uc9LhAa9i?=
 =?us-ascii?Q?yewS0LtJliFDlQGIoIx+rDHTsm8/MmjbnoqNdP/EGdtL8oruv8SkBkluHQ2I?=
 =?us-ascii?Q?KEr1wwTyDIlbL9tbVLlEf3ObHZnK8WWgC00F/jBz3a86pD2AE9II3oHTAwuB?=
 =?us-ascii?Q?teWfPJCuHkzIu+KDeAWbgrS6BBOyklnasnBMTgEXsa8ZhDO1iGeR2wP6sqo5?=
 =?us-ascii?Q?a4tAY7SQ75aaOWRSBgPNxUgMzuyZ0YVpHt35m2BgrgjPX3OjasTM5LsXr0HP?=
 =?us-ascii?Q?Dbhf7Z0Gp/EBxe+IiGo3FNeiViT5U651ClHRsN2DGxc9WAL0sK7r/mqSNUpa?=
 =?us-ascii?Q?ywN7ICHZh8RxdCQWxHquSg2wq5PMrrvq+6YVqEd7MfNGfBeANcI6q1mlIKww?=
 =?us-ascii?Q?rnpTHSnZEz3OlmeFMv1Fslnucfn4JhbyEc3DRQyIKZ9MiWJuIZmXPOrYG/Wq?=
 =?us-ascii?Q?xMAzRdUDcUyiVhqpcoWnKxOlRVk9KzCZ0Qc97siqNTtLkgcTuGqwt5UMYnKU?=
 =?us-ascii?Q?44hwKh61KqwCv4+m7CY3lCWzyRM8lR0SlELF4FbtparXaKMVR6pdP5rrIM69?=
 =?us-ascii?Q?nmttz1mYUVskIqTaOnJHHD6KXyJ7i3EMfEnJmE4BMWUELcz4Ct+Xws3XwZzp?=
 =?us-ascii?Q?BYANIFt1eNPrCDlra9oJUVioZ9Rs5LtZftqPsq3JIjLB87UOjemycvjBDgFK?=
 =?us-ascii?Q?/sbFgX6kSBepBOyn76DIHkBsRtnFOf0d0FxrHQMLZQAOddSkaOegOxjrjPAK?=
 =?us-ascii?Q?as3aoyXL3GcXJKQgOCXbv5f9OvS7yWTgC4KLblwvaUE5RDJc6OhXLRLQRn56?=
 =?us-ascii?Q?AoCX+PQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wafsU+Bpr/nNBegEDMbz+h2N8EqBl0RO2Iyn3E/SP4YfLzs1s23Bn5K4uXJ+?=
 =?us-ascii?Q?HmwzK8W2+xAJ0kigGI8XhZRA2aObf8Aa+hbv9CG1/QDnzf53+ddBE1RHMvo2?=
 =?us-ascii?Q?pvM3RbeyccyM3MUF1Zroh99FLol5uVGFHuDA5DoLCb5QkPbsNrKSU85r1n7P?=
 =?us-ascii?Q?/s4GWbSHKAlc7ohk64hE3KTLpnGZ7Grip0i2l0YrcJG4H/DxBQRaahElA3t3?=
 =?us-ascii?Q?lL04v3IMDVniBw6VIJGdE9avoppjnyMyGQgJzCU98pKFluSxlpspe1/Ux4L8?=
 =?us-ascii?Q?kiyZrKaT6R1avLHRDzGMdOVLQw44Uwb3F5EC9qk2IbjxYZq9gp11h6ElWbG9?=
 =?us-ascii?Q?ANA93WXvf7VT0yT5SSbfhLur4jA9/x1Jq+r9+hZ1A8roNHrZevT+pvNu+eUE?=
 =?us-ascii?Q?swWHOd2YVhtO8sAOPXXFU9bOMPU+danwdiRwq5Vpd4X7X1Nd1OaFfDFYyeXF?=
 =?us-ascii?Q?LDhuv1ZbEwkDopv0ApnZGYJ8CoFaXY/vnqu8zwDlnQiWXLXSvOr+FxZBmJB9?=
 =?us-ascii?Q?vGRZhV/TN2RD3CnR5qDSCpzKdSZtpiHlRknAWiQ4/8JH0Bx+rIvr+vTg20qN?=
 =?us-ascii?Q?lOrrTSUY3YxKoU7gqouAO+SU3d+hzMAi3U1Bq6b3GsV8KdtKGFPqzRyjhfF4?=
 =?us-ascii?Q?ePqllBUQYSqiXgCcgFiIZTUNH8eP25OjDlKXC8aodCnXQopCOXPE884fU6C1?=
 =?us-ascii?Q?Phyt0J3a/BOn3yPhtAbjLIl9+xLOaZDGv5lD+WUkUNlvFhzrthC43oWt1dTu?=
 =?us-ascii?Q?Tpuk3OmfIzdGjQPuWeXe0Sahl117we+U01U43WfAqsxaOGk0yQGlffTRq0xJ?=
 =?us-ascii?Q?mCYUKiNq3nhpCll1ccTHb7NXFMIOKj2WkN5Hfsz7wZoPX479TbikPP91hVX4?=
 =?us-ascii?Q?R+PxudABz9tu8LUlOtd27Mgbe8bFZBvgvIA1tRe/SvUk0JOF1u36kfHzRwhn?=
 =?us-ascii?Q?604h7HcDAIEQbKYrks+tnudmJCa9snfe+v4LnF3e7ImkZ4Ecs6+2jHVWtNYW?=
 =?us-ascii?Q?2BmgvtuXu3i3gSQ4wGVlcVW7DGd6OvopnqyJAKKwXdPvPvfpgmyIbYpwLZtP?=
 =?us-ascii?Q?vHfinWG/Ueu5SYLLHEjRZFJT07bU1zZ+KcnOESbFvey+dsg0uheY90st4ZQL?=
 =?us-ascii?Q?FT2TvIo1WY+3RTDoDnol9+u9LLtttAwHvRQy9sFy+rVqdPZciG8RGbmTWDkz?=
 =?us-ascii?Q?UCX1n0VZv2ys3tKhkU3xtr9RUv++X7t7Ew2iim1PMMGNyQgSs1TTgDjXxgzk?=
 =?us-ascii?Q?2/oWaHETlX5Pgh1WPPNj5uFjGUQCIq44PLVlSaqT8J+s5ONEYbfHc8z/qB0d?=
 =?us-ascii?Q?7wKaOSCVPIF7UAkemLRg3d5fgeRjUYq94wLQeTEK1kX88Tmdm2U5XrrJkUW0?=
 =?us-ascii?Q?x3gCnEqv5xYb4J7pF17lEWPUuaAAiPcoexckSTJWxwJ7AT89AlhKSMtKPrIE?=
 =?us-ascii?Q?AeyIiQJ+x4vbiQVJjEoVC60mVY+Le9j/8sct4Jx7y153Qx8lfPE2jZnXKGwi?=
 =?us-ascii?Q?TfnAbPf54eeeEe7PFs+BGWDkaDPeV4TYp+7XJ0YbrY2xca81UlWyhqX8GkKx?=
 =?us-ascii?Q?FIShKmwFQlFhUChKaE1/1VXZFCYn4g8ylpcKkpeJwlX3u4meHhGxOUcanAZa?=
 =?us-ascii?Q?2j8vV/jPqSvVxiGXGNmKXzc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42f2e4c7-e2db-47d6-585a-08dcf3b9c6ba
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 23:24:00.9845 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gmaIwznAItV4Ygq4aiOZ7Og5r2qa+YcevP4FN3aB219BOBRQnZmNJaux1AuqD/uwe6Ll3VA0iXfI7UF044Xkku+C719p4ULRN47I5V8Fby5Rvbx+Ch6tPkRC3q8wGef8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6917
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


Hi Sakari

> > > > + * Parent device node can be used as @parent whether device node has ports node or not.
> > > 
> > > This line should be wrapped, no reason to have it longer than 80 chars.
> > 
> > We can use 100 char now on upstream ?
> > 
> > 	commit bdc48fa11e46f867ea4d75fa59ee87a7f48be144
> > 	("checkpatch/coding-style: deprecate 80-column warning")
> 
> It's the checkpatch.pl warning that's gone, not the preference to have
> lines shorter than that. This is reflected in
> Documentation/process/coding-style.rst as well as the commit message of the
> patch removing the warning.

OK, I will update it and post v8 patch
Thank you for your help !!

Best regards
---
Kuninori Morimoto
