Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 467939DF8DA
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 03:15:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E71A10E0C1;
	Mon,  2 Dec 2024 02:15:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="KDtEb64d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2049.outbound.protection.outlook.com [40.107.20.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DF0A10E0C1
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2024 02:15:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vxQ2uvYblL22kNj1veUTedMIZRNdFUxNArXjxDDLpmev3C49ZOXKLWqgyJv3vxilueZOlhXJPkxRiykpRsgSgSqcFNnqs0WSAGcFrePqls3dOLpaWl+FilzPadcQTLSJ75BsOmYgqn+TB5fF/Ak/wth0yP0fXPlNYN+kncefir7wKNv3BcjQWI5eKP1Qe0VJcNmkE/q/Rb7dh8TAZnf49p7kdhuqa+sMcBNFs9smlsAoHCrmeIKce2UwVl1D8dv28uvSkfoE7uUxq7zBO/hehp4y1fkKQxCUyfMPf3hzuRnVJ/vCchfGwKnRKS2x0gOBz1an/AgtSwexyFcKUTFgQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nu0CpZII95RP6/7PhK64vB7kn6oma/uCdYoxZbs1JXo=;
 b=nnYP/7YQ8HxnKodBpSkVyGoDCzAa2g0T728mT9i2uUjQRxxHOj1lbbhWkA6nTF4ghqa4ljdFDtoYWxgyG33WiLtTVyejzWwxC0LOh+DJYBvJMjl0S3fz+HoeZC6VNKTQY2Wzp+PZbPRGE2MSGU9HWYKnl0wQL7EE/HqociyLmcgE+6B1ZKnaiUI6NyfygKhSMqPpc//kdB2FQWO9P8PXXPNBjdx2ESX1RSYJnQzt1zoJx6GLNocBQ9QU7Up5T58z9rIZd7l2bLmGeIhCuPox3e1EO4LiuKWOOyAbCJaTsfubpsV3dBE58mPSID+xSK4MkBS78sUPYH8ZKh5VX3wjQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nu0CpZII95RP6/7PhK64vB7kn6oma/uCdYoxZbs1JXo=;
 b=KDtEb64d+sduPyB5rSctGCkTEhTLl8SLOGpMBWRLTe0za6xJWt8T/YwWW7XE50vyO7WIeOtLhhh+GAvNAJz7RqlP1/sy8pPYRIBcj7O1J0HzR2zz4/6l3E/TYmGOOuZgAb+FY8qx/xsJ3oOoVQJcZSCgybPxrPowdi3HIOJ1QE4pYHFXTDa7xHNj9sLOQ3CfOdbr3x88JKvTQyyRB6/a7mkQENuaI7BjLu603tLcgp/5Z0S13P9IBSzT78C1vOONCFujW1bJB+qyJtiEpaRjIh+clXneFsFPqiHhbrz/W51YhwAfVjBBg7B4iv5FftjzcX8nvvNz73AM1dfiQ3gp8w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM9PR04MB7618.eurprd04.prod.outlook.com (2603:10a6:20b:2dc::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Mon, 2 Dec
 2024 02:15:33 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%6]) with mapi id 15.20.8207.017; Mon, 2 Dec 2024
 02:15:33 +0000
Message-ID: <73540c67-4d4e-4deb-b5c1-2caac50edf2d@nxp.com>
Date: Mon, 2 Dec 2024 10:16:05 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/19] drm/imx: Add i.MX8qxp Display Controller display
 engine
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 p.zabel@pengutronix.de, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, glx@linutronix.de, vkoul@kernel.org, kishon@kernel.org,
 aisheng.dong@nxp.com, agx@sigxcpu.org, francesco@dolcini.it,
 frank.li@nxp.com, dmitry.baryshkov@linaro.org
References: <20241125093316.2357162-1-victor.liu@nxp.com>
 <20241125093316.2357162-10-victor.liu@nxp.com>
 <gyt3z6jisr4cea4wwk32hgzbatbczibppgrv6copcl4qo2chlx@w5kcqulhoe2p>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <gyt3z6jisr4cea4wwk32hgzbatbczibppgrv6copcl4qo2chlx@w5kcqulhoe2p>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR06CA0230.apcprd06.prod.outlook.com
 (2603:1096:4:ac::14) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM9PR04MB7618:EE_
X-MS-Office365-Filtering-Correlation-Id: 730a98ef-be57-4cc4-afc0-08dd12773367
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZkJSOFB3bjFDZXJDYTBhbUI3c3BUc1AyRi9HNzBsVjdnSnVjOFAwc2hLd1hm?=
 =?utf-8?B?alNZNEZncTEwN3R5aWxWaFpEZlhXdTJ6em5Xa2l3VkVVQlNJRVVJcEs4b2ll?=
 =?utf-8?B?RVZ1bkR2RlZqdklYUkpZYysxcnU0cU1SOVFzRjJVREN3QjdweC9YbXNWY3l3?=
 =?utf-8?B?aXZpazJWMDdrTkM5ZEwwZ2JXMEl2RUhmREtwTVE0SjBoTjE1WjBDWEJ4b2NY?=
 =?utf-8?B?Z2t3Nk5QQWNEOElEekl6dlFDUnhTZzRsSWpFcWFtRkJKRjluSjlYZ1hCVUFB?=
 =?utf-8?B?MlZIUGtHYWs3WXFrSGNhaDRBeUdWejdRSGNvWEdpcGVDb2FNM2d1OFVBV2Fl?=
 =?utf-8?B?WTlURHZsUkR6OEtYZXNCcitMVTVhc1M3UEFVOTdyZWJBNmU0VDF0TjZGQ2gy?=
 =?utf-8?B?YjFOUnBhSWN1czMzcWNDenVFMllMSktBMDlGOXNuZWtZVHpXNDdvVHJCdUJC?=
 =?utf-8?B?L3RGV0ZvTEdUMGZudUduaXdDdlJBVGl5ZkNLZ2Y5bVJEZjlrWlpBeEZFekdO?=
 =?utf-8?B?blRrU1pPSGcrckFPNTAwdkNlMS90d1Vvdk5vWFo0MGJuZmxJWUFhbEhQckxp?=
 =?utf-8?B?WGhWaXRsYStHWlUrYVA3VG0waVdOL1VKaWFVSGhXZXRpN0MwNm5jazZXaUZ6?=
 =?utf-8?B?UmM2RUtocjQ0N2tQdUtxZW5KMmExanpmdWMzNmpYOW5VQXZWNkt2SHJXK3RB?=
 =?utf-8?B?SENqV3pzOHN3dWpUOUhaVVRWc2lJVWgxWUFFY204L1B0Wnp2azd5QkxWaENw?=
 =?utf-8?B?OVZHQjdMYU54dXFKSXRXZVdsK2tUSkdpRjJhWVJTRjhkVkR5cmtEZkJGNHUz?=
 =?utf-8?B?WnppQ1hTKysxSCt1cmk0MnhwVytSNnlTdWxpL0ErRTdXZE1MZU1oRFJTSXpT?=
 =?utf-8?B?eDdPdjNoS2tub01XelhwNGFGeVVqdnRQUVFwMWhNTGNmR0FyQkI1WjFzamZR?=
 =?utf-8?B?bXZFWEdKN2RZQ0drT1FHYS83OEZXVGJETkJYcHdSWDRCcTlsOW5aSTRUK0hT?=
 =?utf-8?B?NGpsaEVRNGRFSkJpbVBUT1NreVFDbm9FZ1BkMFF6eEovcVYwODdPUnk4WEhF?=
 =?utf-8?B?Z2xjL0xLbFFNdlIzNHNQenUxU0JrOXdheTkwNVVUY1BEVkQ2dDU2bGtVSy9F?=
 =?utf-8?B?RWdmUDdCZUgvRDVkS0Zra0hydjFBUmMzd29zUnk0d3RPdjl2YXo0UXJRUmJh?=
 =?utf-8?B?UndlVXVUNi8yd3hDT3BlYm5CVFBLZ3pkZHlaVVI5cWtwa3RVNVBKdjMyZG5j?=
 =?utf-8?B?UUN2WDgzUDlpWXRUaTBnY3Q0UDM0UFhFMWdUTVNsejNHQ2IzUzdEUEJ0SzlO?=
 =?utf-8?B?WnNxWUMyNzdMSUg0ODlvSkl3L3hXMC8xbUNsRUtiMnU0T1Y0NGdxdWxCTU9q?=
 =?utf-8?B?emtlWXZUZ2ZCRDdmWGg4dmQvWHZJL2EyZktGRFA4N2lYSWNRdmtSSXdGK1p4?=
 =?utf-8?B?ZEwvTWxlNHdBMUp5UVMyOW14SkpscElvcG9FRm5JRkkvUDJ3M0IrYXg2VmdM?=
 =?utf-8?B?RURiZy9XRm1zSG1LZ01WYlRNZEtRdHdsQTFoUm8wU1VKQWN3b3phbjZhWldT?=
 =?utf-8?B?SncrYXlZanByazJXb2R0M1R1UEcybnVvcGo4SDZFaTN3cm9MekFTenB3b2FT?=
 =?utf-8?B?MVJuQjhScFhBdHo2aGhCL1NwZnN5SFJPMjVucDF3WHEwUi94NHkxUkhCczZB?=
 =?utf-8?B?S3YvcmYreGltU1FuM1VhL0dad25TeVZaMkJMOUtLOEdzT0t5KzdrTE5BdGhO?=
 =?utf-8?B?WFgzdE10YjJ1akdZZ2tSeC9qcC9YZnBpUVoxSkVnWVhvL2M4QWpSVitTRis2?=
 =?utf-8?B?QXM4cWZwdXZzaDZnNXJVZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SkVjZy9MWFU2V0p2c1dsdnRrVTBYaDBaNHdyWjFRYUk5bjFOS09YUVR4WE5m?=
 =?utf-8?B?RUVKMVprbHlVTmhjZ0hZcjRiWEs4RmQ0eG9XQkxuZDc1ek5zT0FmNlE1YWZB?=
 =?utf-8?B?cFM5MmVYM1JrYlhRTmQ2OGd1b1FkSXZkODBkcnJ5VG5XUVpzeU9EMi9sV05F?=
 =?utf-8?B?VXZzZ05mb0hmYzlmTWVnZ0FINXlYWTJSMG9VbVlGRjh6Yk9IREFTeWtneitB?=
 =?utf-8?B?Nmc1SDR6WmRkMG93dDJXQWhqR2IrRDRPSjlBUzdKZDdiSW1nMFRyRU5NbnNv?=
 =?utf-8?B?ZUR4MStDeFZsV0ZSL0RJZnRXQXpnNVUzWjg0cGwvWEJYRFVkMXVpS1ZBc3Ir?=
 =?utf-8?B?Q3pwaENROE5VcENzaGRWZmJUbC9keTFFVW90ZG14R0R3Y3ZON280empXWExZ?=
 =?utf-8?B?Ykk1cnJxOUJiRlp6QUkvc3VHZk1vSWk1RVk4a1hrdmZGUUNnb2x1TlF5UUZS?=
 =?utf-8?B?cWFmdVo1RkZEUUNRYWRFN2JmM3pkd3U0WTRlYXhmdjBYRVJpWUduSHZuNk1I?=
 =?utf-8?B?Um9mRTZCVUZFTHJkZmYyRVJaVXo3NU11bSs0ZWQ4WldkZjY3SXJjWjNwRy9L?=
 =?utf-8?B?RlZMNHJPUzV6V2I3RFZhNUFJR0xnVFIyNXFBZCt5ckZjRXB6NmlEKzErSE50?=
 =?utf-8?B?cjdsT2VhWURVNnhpR01BbGlVRTlqZm1lLzhRTDhrREpsSTk4YnFxWkpxaDhJ?=
 =?utf-8?B?aENhT2hTQlVCUFc2WmFKcDB2T1I3eU5HeUNibzBLdFVGTVRTRDZZbnl1bHpY?=
 =?utf-8?B?ZDNEWjArNk5XdW5RUHFSTG9jdUlZckg5K1UrenVacng0U0lzRkZDSUZHVlJn?=
 =?utf-8?B?WnVnVEh0TU5mZTRmYnlQQjVUTGNKeGFabHhwc1BteDdUN2g5RnBMcXVIbWhl?=
 =?utf-8?B?V3NXdkFlR1dxSDhYdFhNZUN3ejVBTEVLVWk3VVcrOUkxaStmM2tIUHdaY0No?=
 =?utf-8?B?bHduS0tqQmlrZXZBekd3UXFhTTJSTDgrcW5vR0t1c2YwRVdNQXc3aGppYXBa?=
 =?utf-8?B?dFdlRE9XdlFuZkNjKzdnUU1zZkR2aFpYR1o0VU15TXpJZGhmNU5pWVZQUVJC?=
 =?utf-8?B?ODdTVjE4RU4yMnNYNnJBa3I5clRLVkRaLy9NT1gzaW5TUG9yczY1UVdsVlVO?=
 =?utf-8?B?SEUyWFV5ODFwSkszZGJTWXUyekpZNkxKVzZncVFST081TTF4WTlKejFiZGY5?=
 =?utf-8?B?bUNWVndZaHNFUGRWZkJJN3RHbnIvUmtDOGNMa3kyL3p5SGtTTUpRZVRZdHha?=
 =?utf-8?B?cXRJVjVXcmViNEJxbFJhL0duQU03UGwvaUhaR08raHl2Z0dodmd0RHlKaDM0?=
 =?utf-8?B?ZGFxY0p4a09HNGFndlkyUTQwU0tHc2tjaFUxYzNXZG05SEhPVUlrcVhsT1Ba?=
 =?utf-8?B?dmdWN3FqK0creTQxaWwwZVE3LzlPYytUK2hYUTB6NjV4dnhaSStnQStTWDl0?=
 =?utf-8?B?UTYvTUF5K0lLbVo2M21yRkNNYy9kR1pPY2dQT1ZkZWFLU3d0Uks3WWROT3kv?=
 =?utf-8?B?YjVhK0k4MWlrSVp3YTR4eXBXcDAwbS9hUjRXV0Q1V0tvdE1DN3NVOEFjekM3?=
 =?utf-8?B?aUZwbWdkVThwajdkVWV5NkMraVF5RFVxb0poNUc0cU1iOENjWVdTMW84Yldq?=
 =?utf-8?B?bUxmajBtZGxOTWp4VmtGOGt1bzZVTE5HdXRnVURFdkw4d0NJcGNZVkptb2pa?=
 =?utf-8?B?amVyOGxycVNUeDk3eEpremZiTWF0YmlyOVFNdFJQMzdNNWR3RTJ3NE00bTl4?=
 =?utf-8?B?MkpTS21XalcrMmNoT1c1cjNyb2x4SW9LUGpOMEFEeDVUdEN6WGx4YXhWUzQv?=
 =?utf-8?B?YVp6MWFWTk1zUUZmWmRjTTNjSE5PTjY1VnV4ZC9SUGVyVS9Hc3B2QVM1Q1ZQ?=
 =?utf-8?B?TlY3SENLV3NJSEE5NXdUVDgrRjZ6bmhxL1c5THd2Q1FjYVdIMEZTTHh3OTAy?=
 =?utf-8?B?T0FGZ21SY0NXdzMzOEMvMk55b3g0c3BWekJQNU1PSUhGNE1XSlB3eUlaK1Er?=
 =?utf-8?B?VnVpUHlVdjgxUy9RbkRHWWFWdVE2SUxDZHJGdjVQdzVRL05WbHFDdjFmYzc2?=
 =?utf-8?B?MTRmNmlQeFcrNkhqN2VMMnhZYmR2T2c3QVJTVGtLdElrVVVPMmhVK3A5VEtG?=
 =?utf-8?Q?T5PBkOiTZhhyzkQSNMsqiSkKP?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 730a98ef-be57-4cc4-afc0-08dd12773367
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2024 02:15:33.2663 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gc4ScTC/Lp4wuuI1V3nQdiOYXiLDhpdJs2wEXj6FOWzIwUaQDbUZ/xP03vDUWu11HXbpnhPx6l+F1wBIqaOyrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7618
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

On 12/01/2024, Uwe Kleine-König wrote:
> Hello,

Hello,

> 
> On Mon, Nov 25, 2024 at 05:33:06PM +0800, Liu Ying wrote:
>> +struct platform_driver dc_de_driver = {
>> +	.probe = dc_de_probe,
>> +	.remove_new = dc_de_remove,
> 
> Please use .remove here. Also in a few other patches of this series.

Will use .remove in next version.  Thanks.

> 
> Best regards
> Uwe
> 
>> +	.driver = {
>> +		.name = "imx8-dc-display-engine",
>> +		.suppress_bind_attrs = true,
>> +		.of_match_table = dc_de_dt_ids,
>> +		.pm = pm_sleep_ptr(&dc_de_pm_ops),
>> +	},
>> +};

-- 
Regards,
Liu Ying

