Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 891F2996167
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 09:51:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A578E10E671;
	Wed,  9 Oct 2024 07:50:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="UDjn0MNI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11012034.outbound.protection.outlook.com [52.101.66.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 875F310E66E
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2024 07:50:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U5+/t7hJ5jNfwn5NeF/n8QUViaviEhv6g+2FU+7tNbiNsx0UtBkDsLOA4UWaEBnOGP+T2m24sLdR1Qc/rEkAt7GNx10UVM63LBUbYK1pLaTsHdeLogDxZ5fDmQklZ7oG7jPwPYCgIoXusQMbNHTHxegvoxcNE3ZatvDBBNiSwl0c+ys+qabm632Lv13cWrGdx5o+nR7CglmokuEAQll+ZNrW/C0YAnGK/62PL85OEa86+HtLpaSlSPMENUeUGuOZiGi1PUUQk/t49857ko3rR+wV9aZuroBcnwpm+pQ0R1PkPJyc7sDhlP9YB+a7Kz57BKHhzESlE6uXOW+f6baqiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GZNNjZQsw+agF6eeeZo3t8zXF9AsCdlCMeYBjT+DMcY=;
 b=QUsFBrhiBzov+0dmSdki0GS4A+ZXp5r5AKDijkFPiotiZldVCAxV6duGGf4Mj1VNE1HRwK9E6Ag2W+F0PR/G/Qn6pHnH89I9BALZg5dF2wH7Kegsa5NtdzJ07DTOe3uElJulBeGN7pwk5QQ+cB6GRBT7nFYGzMPG6E+HG+2fhSGnm485WnMWR9M2OE091DsJJ8Rkt8R6ecIGGGtA5r+Yg+eNeUYfh4Xt8tZngSkB5cc3trdL5OCTLeB08Fr68zklgzobC7Uu0EoEAPblEp0cwyD9xGTYnsgku4NSxAdiizjHazW3UEvFCSgU1kw7ci7pkZKcgjjg6vIfTSM6D1iSgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GZNNjZQsw+agF6eeeZo3t8zXF9AsCdlCMeYBjT+DMcY=;
 b=UDjn0MNI00vmY/SJa03LA5Zwo0ubS5+XHG9IOFWhlKLFU0Auw6B7jCqWlOLcxFV3+BgMCwgrzA97edD2iF4xJdOrde/oXFZ2YsSBiSVv9jOi+shrLFYxK+ewcyH8Xxq5/ey1Fy8Vik5Adkexab6GZl7PcQjN3uk/3o/vy38YcwUKR9h4hnAU2m3tvdTvqxKh9v5OmcLR23BAZziozFA0c41TOTR1Ahj97exnpjSQz2igdOCZ3lcdGNYRzs1fcTJG/RBPAU2y/Bsi2+G6KBAecQmGIudwSP0aQwpcC/IsRWpmiXL2DFc+SAWZDKcQBqnfUVyZkkP/OF1W+R5cGgPyrA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by GV1PR04MB10477.eurprd04.prod.outlook.com (2603:10a6:150:1cb::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Wed, 9 Oct
 2024 07:50:50 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8048.013; Wed, 9 Oct 2024
 07:50:50 +0000
Message-ID: <cd2afc86-b156-4cff-bb6e-4fdb6434ac0c@nxp.com>
Date: Wed, 9 Oct 2024 15:51:13 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] dt-bindings: display: bridge: Add ITE IT6263 LVDS to
 HDMI converter
To: Biju Das <biju.das.jz@bp.renesas.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Cc: "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "rfoss@kernel.org" <rfoss@kernel.org>,
 "laurent.pinchart" <laurent.pinchart@ideasonboard.com>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch"
 <simona@ffwll.ch>, "robh@kernel.org" <robh@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "will@kernel.org" <will@kernel.org>,
 "quic_bjorande@quicinc.com" <quic_bjorande@quicinc.com>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "arnd@arndb.de" <arnd@arndb.de>,
 "nfraprado@collabora.com" <nfraprado@collabora.com>,
 "o.rempel@pengutronix.de" <o.rempel@pengutronix.de>,
 "y.moog@phytec.de" <y.moog@phytec.de>
References: <20240930052903.168881-1-victor.liu@nxp.com>
 <20240930052903.168881-6-victor.liu@nxp.com>
 <TY3PR01MB11346CF2BE6F838A718E64F5586762@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <TY3PR01MB113466D86F0CA0FA8FB9B866D86762@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <TY3PR01MB113466D86F0CA0FA8FB9B866D86762@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SG2PR01CA0177.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::33) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|GV1PR04MB10477:EE_
X-MS-Office365-Filtering-Correlation-Id: 67ddcc3c-9bce-49b2-241c-08dce83717e4
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NWxDMFZsbW5kU0V1cmlXa1d5R3ZmN3ErMEtydjByc1IzSkdmdlVCeDFMSzFw?=
 =?utf-8?B?RlBFSTFXcjN3UERRS2s2S1hhTGozSlE2OTFsa1h1K2ZwWnlxa042YzdpY1po?=
 =?utf-8?B?VXpNRVRhNit6UDVOd0R0ck1Gai94RS9sRGlTUG04bWwrRTJ2cEtEY2hmeVA0?=
 =?utf-8?B?L3Y1NmRrWm9WUjlSRFZXZThZVllEVzQ5ZmRobnp4aHVFVWJGMGpYY1hrdFk5?=
 =?utf-8?B?N0xlUml1dDRvMHhjSkwxWWExSC9MNFl4Q1VOMVFQWmxmVHFpenlTbU5Xd3U2?=
 =?utf-8?B?eU5BRG9ZMjVFY01OUEVxc0hwZE52a3ptbTlLclFtcTdoeGhic3dyZ1dhbkpN?=
 =?utf-8?B?QlptVkgzVlZ0M3FqZUgyVUhzSU1ESVhJYXZ4cVlyVTMxN05OVTBnK0VQOWRO?=
 =?utf-8?B?T0Ewa2xzU3h5QXc2S01IWHJDUldjM1gva3MyZ2lsN1g1UkI5bFhnL2Q0UXlF?=
 =?utf-8?B?MWtaSWJmeWlVWXVXaUMxWVo1WWp0d0pKS241dnNWWWFkSVJxNE9raTBldEt2?=
 =?utf-8?B?clpZYlVoR3FuQ0pNVTY1Y1lsUEE1Y2poK0tNYUpvb3Fyckl0U0dVVERvdlVU?=
 =?utf-8?B?UGViRFFtY0FHVGJlb0tUMFl3anRQNFBJbzE0eldQSW1LRmZEdmVWNnVIOWNU?=
 =?utf-8?B?MVZkZ2dya1pYaXhJdlArLytEODIzaUdnendUdjFhTTFLOW9GakJRM1VQUith?=
 =?utf-8?B?ekZzNE9ORVkxNUZsdFhTUGNqVjhwSEMvQ1NHbHlVTHhoQmdvMG5BMEFMUVht?=
 =?utf-8?B?MnBDZEhYR29kM0hRcEg3ZWx0emhtbFE3WjE0WUZJNVFEaHY1a0JlODA2aXdy?=
 =?utf-8?B?S0VUL0ZoTlQyenIyWUw1ZEdHZ2d0SkpYWFA1VERlME8zdTFZa2ljeXZvK0gz?=
 =?utf-8?B?Q1Vjd3ZiaXdVZEpMM1QxM0NHZys3UFRSSEcyK1AyaTA4enY4eThzd0pheGg0?=
 =?utf-8?B?Mk8yajY2aXVZSzdyZUpaMmk3OUU5eG82K0w4NVpZSkdZVTYyREpZV2RkbmlD?=
 =?utf-8?B?cEk0ZHJ4bFl5NTZnUm9Ib2cyeGtWUHZpT3JXOGVpL2RldVJJbTJXN2VMYXJO?=
 =?utf-8?B?cmxJKzBaa1pJZkg0TVBEc1VyZmRsWi9janBtYllrNVZVTCtKZW1TdDJWZjJ5?=
 =?utf-8?B?QklwYVZIVkdKK3ZPWE42Nlp4QTdDM3hZU1o1OHdvTjhzNExYL1ZuMjIyWE56?=
 =?utf-8?B?em04SjNJWWhaUlRLUjlLMCtFV2JmdWdGRElOZVhsYktBTWp6WHNMSHc4Z3kr?=
 =?utf-8?B?NThMQmpOMWdEN1Vyc0ZhSEZzZ2tZV3lJbkdsOXBuZzk0OFZ0Y3dMeVNqNkgz?=
 =?utf-8?B?Z0RIRjM3Z0N6R3ZjelpOQkMwSnFHaDAvVEJlWVYySVd5VFljb1FSWS9iVFBB?=
 =?utf-8?B?dUhObTcxSS9Jdm93MG8wSWhxd3pZYUoybng4TEp0LzdEQXp6bnpVL1JKN0p6?=
 =?utf-8?B?V2t1L1h3WHZvRjNiMk1MRHUwM1JhUG5nSkxCdWFnTVFtaFd1QjhwVDdiREsv?=
 =?utf-8?B?L3YvNnZzNWhtUk1jbGhCVkZYMStWWnBvUEppM3hmNXBaZjZERWowcWhxTFgv?=
 =?utf-8?B?ZGJHNHBVZ2RDNTkreGxTNzl2OXh5ZWg2cjdlR1hMd3FqN29vdS9XMXhnUWlQ?=
 =?utf-8?Q?jvQtKg6TH1FRJ9fC2Pn2/XQSn9EPMx8+6dX+5Kspv8EM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cE5SM1RHVEdkZDlGVmtTMXliZGR0MWdnaGpCWC9rK2dtK2VRTG42bG0rYzhY?=
 =?utf-8?B?V0x1ZjBJY3k2MkRrMVZZd2pwaUpsclRmOU1sNERRZGZMQ09laExNQ1dicVAy?=
 =?utf-8?B?eDFhdE5ORHcyd002YjYzODFSMjJRSzVRSUJaWmdhN1RxL0ZocjhKRTVnRTlp?=
 =?utf-8?B?NlFtdXJEZ3FCdkVpcGorOFdHWHdQWkNkOVNhYjB3SmxQYkF3WjNTSGRPdFpj?=
 =?utf-8?B?cXcwM0ZzSWwwSEFoZUZ1T1l3c0FmTFFGOWZLNFNUQk9VaWZVSTJ1UE9UNkt4?=
 =?utf-8?B?cnpwYjc1dXBSZHpneEFGdWdjMzZUTm0vVDlCNE5aZHdGdFd0VnhiQXQvK2Fk?=
 =?utf-8?B?Nk9xaTg5bGJlODVhREh1UFA5a2o1TEc5blVvVkRJbytJTkZOYUMvMHZsNFFa?=
 =?utf-8?B?empULzd2OXYrbnloMEo2aDBkd0YwVS9Jc1gxb2kyMm1PWTNDWmtsQnhYTFcv?=
 =?utf-8?B?OE1Qei9nMDNmcStTLzh6M3dTUVlVRU1jMFBCcmY1VzBGOXh2VFJraDdLekxt?=
 =?utf-8?B?OG9vRlpUM3MxbThIZUVDK0N0a3RzbVB2QlZsLzhxQlI1TEhnekNUeVBhQzN3?=
 =?utf-8?B?TS9JcHgzY0VHdzRFRll3eGtXWnVWbXlYR0U0ZGlqaEFqZENHZWhBbERDVW5n?=
 =?utf-8?B?WGxGam9OZkRlT1BSY1FHRDZ3ak0ya3BVZE8zTnIvUjh2MWdGVW1JbDhUYmRF?=
 =?utf-8?B?Vzk2eGNPbDh2R3MyM2lmOXJ0Z1BwT2JIREk3V0tnSlhnS3h2cU5FQkUyMHk0?=
 =?utf-8?B?ZUxadlpyYjRTQ1Y4ZHR2MzJtMlREM1d6dmxWeGtJWVlxdTlDaFpDQi9BdmJ1?=
 =?utf-8?B?R1JVSkFJK2xjbFZ4Y1BFTW1qTXljL2pOcFFTSXdvSmVWSXNwS1JMa1hoWmtU?=
 =?utf-8?B?QVY3dUdZKytHVTg0c3FWSmk4bmF4REM5WHN0alR6YVdtR3FxRjZLaDQrME5z?=
 =?utf-8?B?Vmk1cXBsN1VQMktiYjRLOUR0ekdiY21qV2VDYmtraGJEblM4dXpjY2ZIRTB0?=
 =?utf-8?B?enprbFdQaG10Ly9tTXdvZVVNUXJaT21LbUt5MHlpWlpBM2gwTDVRU20yckVh?=
 =?utf-8?B?L3pkWkw5elZkNmdIVWI2ZStjZEt1NU9CTWNXVXdFbzJsMC9lanVsVXVEK2Jw?=
 =?utf-8?B?WTlqTTdtWG5XZ0NGNmM4RWZZVStSay9tZjNKSGNWNEZBZ1NORWRNazhQZnp0?=
 =?utf-8?B?WUcyUEkrWGZTSnU0ODFtNVYveVk5dVJpN0hVK05JWitXd09mYTlYNlFiMTdx?=
 =?utf-8?B?WlJSWU9VeG1pbnBPbE11dXFqTXd6NndML2gxWWpieHZxeUJERWY4MHBVZFMw?=
 =?utf-8?B?Sld6TitvNWJEdXVXZkpReEpBcjUrVnBaZWdmREYwQmxoQjJzc1JmRUdFS1Ra?=
 =?utf-8?B?SmR2YWNDMzA0OW9aNDkwZk1hQ2hDa3N0RzBBUHFONXpjNGJXU0hVaE9OZmc1?=
 =?utf-8?B?Wm9EUWViQ2dQaUh6Q09zTzVQYnNyb3c0WUxBMStSMnNGWXFONEQ0MU90TCs3?=
 =?utf-8?B?TkFyaks2TWc2Y0tLU2hhUVFSRDZ3bExuZnA1dmdNMGVoZXo3OE56d3ZraVhw?=
 =?utf-8?B?aFlxTnBaTDVVdzNwNldCWllkTy82bEJmQm8vOTRsYkplN3dSc3dxVG5vbERG?=
 =?utf-8?B?ZU9mZzB5VzE0Y3ZxcGpocTE0SDA3K0dhTG9RT0o1Y2xrUThXSEFiMC9CLzJK?=
 =?utf-8?B?QXgwOWxzRHdqNUxDVjQrZUVEQ2JWSHlSWjY1RzJiNk5WckVFNGRMNzZWLytU?=
 =?utf-8?B?WWFNZWFFeEpJa01BVGdPY3FqUlVqaTZOMGRlZ3NnVHFiTEludTNMeGFoN1Zi?=
 =?utf-8?B?L282SWIxck9KeFdvVzF0LzdtT0tSR3lDNlkxMnE5SExIVjkremFtYzh4S2NU?=
 =?utf-8?B?VHJTSHgyenlTNjArUUFidzZSclpGSkVHSEo1Z1Vnak9TYnJHUSt1TFAxdkN5?=
 =?utf-8?B?MUxoV2hSM3NvRlpUUUNvK204Mm1iSUc5RDZveFI4SHc0WXRQN3BxdUFuclA3?=
 =?utf-8?B?WHVhdTNva2FEVkFyZHpaaVFBMDI0eGg2Y2YzWXdUc3dKeXM2VEk2RUd5ZXJX?=
 =?utf-8?B?L1dsZ0gvVStsOGY4b3plelk5MHJocjF3UW51RDVVYmVGTVlrY3NuZEFHeWdq?=
 =?utf-8?Q?KJAF0GDL0f/wvwUcqYxsHZxPa?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67ddcc3c-9bce-49b2-241c-08dce83717e4
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2024 07:50:50.4471 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M3jwgRCIytHR4TuZqgsGeVZzVlK4OD7XvHJYixOhK458U7xxKmomwwXtiWZCLAj6UlSTKj2GOpm4Gh75JPFP1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10477
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

On 09/30/2024, Biju Das wrote:
> Hi Liu,

Hi Biju,

> 
>> -----Original Message-----
>> From: Biju Das
>> Sent: Monday, September 30, 2024 10:04 AM
>> Subject: RE: [PATCH 5/8] dt-bindings: display: bridge: Add ITE IT6263 LVDS to HDMI converter
>>
>> Hi Liu,
>>
>> thanks for the patch.
>>
>>> -----Original Message-----
>>> From: linux-arm-kernel <linux-arm-kernel-bounces@lists.infradead.org>
>>> On Behalf Of Liu Ying
>>> Sent: Monday, September 30, 2024 6:29 AM
>>> Subject: [PATCH 5/8] dt-bindings: display: bridge: Add ITE IT6263 LVDS
>>> to HDMI converter
>>>
>>> Document ITE IT6263 LVDS to HDMI converter.
>>>
>>> Product link:
>>> https://www.ite.com.tw/en/product/cate1/IT6263
>>>
>>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
>>> ---
>>>  .../bindings/display/bridge/ite,it6263.yaml   | 310 ++++++++++++++++++
>>>  1 file changed, 310 insertions(+)
>>>  create mode 100644
>>> Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml
>>>
>>> diff --git
>>> a/Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml
>>> b/Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml
>>> new file mode 100644
>>> index 000000000000..97fb81e5bc4a
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml
>>> @@ -0,0 +1,310 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/display/bridge/ite,it6263.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: ITE IT6263 LVDS to HDMI converter
>>> +
>>> +maintainers:
>>> +  - Liu Ying <victor.liu@nxp.com>
>>> +
>>> +description: |
>>> +  The IT6263 is a high-performance single-chip De-SSC(De-Spread
>>> +Spectrum) LVDS
>>> +  to HDMI converter.  Combined with LVDS receiver and HDMI 1.4a
>>> +transmitter,
>>> +  the IT6263 supports LVDS input and HDMI 1.4 output by conversion function.
>>> +  The built-in LVDS receiver can support single-link and dual-link
>>> +LVDS inputs,
>>> +  and the built-in HDMI transmitter is fully compliant with HDMI
>>> +1.4a/3D, HDCP
>>> +  1.2 and backward compatible with DVI 1.0 specification.
>>> +
>>> +  The IT6263 also encodes and transmits up to 8 channels of I2S
>>> + digital audio,  with sampling rate up to 192KHz and sample size up to 24 bits.
>>> + In addition,  an S/PDIF input port takes in compressed audio of up to 192KHz frame rate.
>>> +
>>> +  The newly supported High-Bit Rate(HBR) audio by HDMI specifications
>>> + v1.3 is  provided by the IT6263 in two interfaces: the four I2S
>>> + input ports or the  S/PDIF input port.  With both interfaces the
>>> + highest possible HBR frame rate  is supported at up to 768KHz.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: ite,it6263
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  clocks:
>>> +    maxItems: 1
>>> +    description: audio master clock
>>> +
>>> +  clock-names:
>>> +    const: mclk
>>> +
>>> +  reset-gpios:
>>> +    maxItems: 1
>>> +
>>> +  ivdd-supply:
>>> +    description: 1.8V digital logic power
>>> +
>>> +  ovdd-supply:
>>> +    description: 3.3V I/O pin power
>>> +
>>> +  txavcc18-supply:
>>> +    description: 1.8V HDMI analog frontend power
>>> +
>>> +  txavcc33-supply:
>>> +    description: 3.3V HDMI analog frontend power
>>> +
>>> +  pvcc1-supply:
>>> +    description: 1.8V HDMI frontend core PLL power
>>> +
>>> +  pvcc2-supply:
>>> +    description: 1.8V HDMI frontend filter PLL power
>>> +
>>> +  avcc-supply:
>>> +    description: 3.3V LVDS frontend power
>>> +
>>> +  anvdd-supply:
>>> +    description: 1.8V LVDS frontend analog power
>>> +
>>> +  apvdd-supply:
>>> +    description: 1.8V LVDS frontend PLL power
>>> +
>>> +  "#sound-dai-cells":
>>> +    const: 0
>>> +
>>> +  ite,i2s-audio-fifo-sources:
>>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>>> +    minItems: 1
>>> +    maxItems: 4
>>> +    items:
>>> +      enum: [0, 1, 2, 3]
>>> +    description:
>>> +      Each array element indicates the pin number of an I2S serial data input
>>> +      line which is connected to an audio FIFO, from audio FIFO0 to FIFO3.
>>> +
>>> +  ite,rl-channel-swap-audio-sources:
>>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>>> +    minItems: 1
>>> +    maxItems: 4
>>> +    uniqueItems: true
>>> +    items:
>>> +      enum: [0, 1, 2, 3]
>>> +    description:
>>> +      Each array element indicates an audio source whose right channel and left
>>> +      channel are swapped by this converter. For I2S, the element is the pin
>>> +      number of an I2S serial data input line. For S/PDIF, the element is always
>>> +      0.
>>> +
>>> +  ports:
>>> +    $ref: /schemas/graph.yaml#/properties/ports
>>> +
>>> +    oneOf:
>>> +      - properties:
>>> +          port@0:
>>> +            $ref: /schemas/graph.yaml#/properties/port
>>> +            description: the first LVDS input link
>>> +
>>> +          port@1: false
>>> +
>>> +          port@2:
>>> +            $ref: /schemas/graph.yaml#/properties/port
>>> +            description: video port for the HDMI output
>>> +
>>> +          port@3:
>>> +            $ref: /schemas/graph.yaml#/properties/port
>>> +            description: sound input port
>>> +
>>> +        required:
>>> +          - port@0
>>> +          - port@2
>>> +
>>> +      - properties:
>>> +          port@0:
>>> +            $ref: /schemas/graph.yaml#/$defs/port-base
>>> +            unevaluatedProperties: false
>>> +            description: the first LVDS input link
>>> +
>>> +            properties:
>>> +              dual-lvds-odd-pixels:
>>> +                type: boolean
>>> +                description: the first sink port for odd pixels
>>> +
>>> +              dual-lvds-even-pixels:
>>> +                type: boolean
>>> +                description: the first sink port for even pixels
>>> +
>>> +            oneOf:
>>> +              - required: [dual-lvds-odd-pixels]
>>> +              - required: [dual-lvds-even-pixels]
>>> +
>>> +          port@1:
>>> +            $ref: /schemas/graph.yaml#/$defs/port-base
>>> +            unevaluatedProperties: false
>>> +            description: the second LVDS input link
>>> +
>>> +            properties:
>>> +              dual-lvds-even-pixels:
>>> +                type: boolean
>>> +                description: the second sink port for even pixels
>>> +
>>> +              dual-lvds-odd-pixels:
>>> +                type: boolean
>>> +                description: the second sink port for odd pixels
>>> +
>>> +            oneOf:
>>> +              - required: [dual-lvds-even-pixels]
>>> +              - required: [dual-lvds-odd-pixels]
>>
>>
>>> +
>>> +          port@2:
>>> +            $ref: /schemas/graph.yaml#/properties/port
>>> +            description: video port for the HDMI output
>>> +
>>> +          port@3:
>>> +            $ref: /schemas/graph.yaml#/properties/port
>>> +            description: sound input port
>>
>> What about single lvds as device support it?
>>
>> Cheers,
>> Biju
>>
>>> +
>>> +        required:
>>> +          - port@0
>>> +          - port@1
>>> +          - port@2
>>> +
>>> +        allOf:
>>> +          - if:
>>> +              properties:
>>> +                port@0:
>>> +                  required:
>>> +                    - dual-lvds-odd-pixels
>>> +            then:
>>> +              properties:
>>> +                port@1:
>>> +                  properties:
>>> +                    dual-lvds-odd-pixels: false
>>> +
>>> +          - if:
>>> +              properties:
>>> +                port@0:
>>> +                  required:
>>> +                    - dual-lvds-even-pixels
>>> +            then:
>>> +              properties:
>>> +                port@1:
>>> +                  properties:
>>> +                    dual-lvds-even-pixels: false
> 
> Do we need to document ite,data-mapping to support both VESA and JEIDA formats??
> 
> Or
> 
> Is there any run time info available to get this info? Currently,
> I see it is hardcoded in driver.

I think there are two options:
1) Reference the data-mapping property in lvds-data-mapping.yaml
   Question is that only jeida-18, jeida-24 and vesa-24 are
   enumerated, while IT6263 supports something like jeida-30 and
   vesa-30(not sure if they are standarized or not) with 5 data
   lanes(A-E) per LVDS link as the LVDS mapping table in IT6263
   datasheet mentions.

2) Document the number of data lanes per LVDS link
   This is enough. data-mapping is kind of too much information
   from DT point of view. Linux display bridge drivers support
   runtime bus format negotiation to determine the data mapping.
   So maybe a property like this is ok:

   ite,lvds-link-num-data-lanes:                                                  
    $ref: /schemas/types.yaml#/definitions/uint8                                 
    enum: [3, 4, 5]

   BTW, I only tested 4 data lanes. Not sure if the other 2 work
   or not.

Laurent, Rob, any thoughts?

> 
> Cheers,
> Biju
> 
>>> +
>>> +required:
>>> +  - compatible
>>> +  - reg
>>> +  - ivdd-supply
>>> +  - ovdd-supply
>>> +  - txavcc18-supply
>>> +  - txavcc33-supply
>>> +  - pvcc1-supply
>>> +  - pvcc2-supply
>>> +  - avcc-supply
>>> +  - anvdd-supply
>>> +  - apvdd-supply
>>> +  - ports
>>> +
>>> +additionalProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    /* single-link LVDS input */
>>> +    #include <dt-bindings/gpio/gpio.h>
>>> +
>>> +    i2c {
>>> +        #address-cells = <1>;
>>> +        #size-cells = <0>;
>>> +
>>> +        hdmi@4c {
>>> +            compatible = "ite,it6263";
>>> +            reg = <0x4c>;
>>> +            reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
>>> +            ivdd-supply = <&reg_buck5>;
>>> +            ovdd-supply = <&reg_vext_3v3>;
>>> +            txavcc18-supply = <&reg_buck5>;
>>> +            txavcc33-supply = <&reg_vext_3v3>;
>>> +            pvcc1-supply = <&reg_buck5>;
>>> +            pvcc2-supply = <&reg_buck5>;
>>> +            avcc-supply = <&reg_vext_3v3>;
>>> +            anvdd-supply = <&reg_buck5>;
>>> +            apvdd-supply = <&reg_buck5>;
>>> +
>>> +            ports {
>>> +                #address-cells = <1>;
>>> +                #size-cells = <0>;
>>> +
>>> +                port@0 {
>>> +                    reg = <0>;
>>> +
>>> +                    it6263_lvds_link1: endpoint {
>>> +                        remote-endpoint = <&ldb_lvds_ch0>;
>>> +                    };
>>> +                };
>>> +
>>> +                port@2 {
>>> +                    reg = <2>;
>>> +
>>> +                    it6263_out: endpoint {
>>> +                        remote-endpoint = <&hdmi_in>;
>>> +                    };
>>> +                };
>>> +            };
>>> +        };
>>> +    };
>>> +
>>> +  - |
>>> +    /* dual-link LVDS input */
>>> +    #include <dt-bindings/gpio/gpio.h>
>>> +
>>> +    i2c {
>>> +        #address-cells = <1>;
>>> +        #size-cells = <0>;
>>> +
>>> +        hdmi@4c {
>>> +            compatible = "ite,it6263";
>>> +            reg = <0x4c>;
>>> +            reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
>>> +            ivdd-supply = <&reg_buck5>;
>>> +            ovdd-supply = <&reg_vext_3v3>;
>>> +            txavcc18-supply = <&reg_buck5>;
>>> +            txavcc33-supply = <&reg_vext_3v3>;
>>> +            pvcc1-supply = <&reg_buck5>;
>>> +            pvcc2-supply = <&reg_buck5>;
>>> +            avcc-supply = <&reg_vext_3v3>;
>>> +            anvdd-supply = <&reg_buck5>;
>>> +            apvdd-supply = <&reg_buck5>;
>>> +
>>> +            ports {
>>> +                #address-cells = <1>;
>>> +                #size-cells = <0>;
>>> +
>>> +                port@0 {
>>> +                    reg = <0>;
>>> +                    dual-lvds-odd-pixels;
>>> +
>>> +                    it6263_lvds_link1_dual: endpoint {
>>> +                        remote-endpoint = <&ldb_lvds_ch0>;
>>> +                    };
>>> +                };
>>> +
>>> +                port@1 {
>>> +                    reg = <1>;
>>> +                    dual-lvds-even-pixels;
>>> +
>>> +                    it6263_lvds_link2_dual: endpoint {
>>> +                        remote-endpoint = <&ldb_lvds_ch1>;
>>> +                    };
>>> +                };
>>> +
>>> +                port@2 {
>>> +                    reg = <2>;
>>> +
>>> +                    it6263_out_dual: endpoint {
>>> +                        remote-endpoint = <&hdmi_in>;
>>> +                    };
>>> +                };
>>> +            };
>>> +        };
>>> +    };
>>> --
>>> 2.34.1
>>>
> 

-- 
Regards,
Liu Ying

