Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D01A4989E33
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 11:29:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C92289950;
	Mon, 30 Sep 2024 09:29:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="LZBs62Wa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11013019.outbound.protection.outlook.com [52.101.67.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FE6E89950
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 09:29:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m9XGbNqpacKymu7NW4OAywJvfZfw8KUrPErk2BYD7jO9Aq+LVnlP0BOoJe5rX7zOzmF18Kw0jjaYGeT7FlmHaLDa1FOx6/R/ulUviUzoVoo+y1SLSIINZUAiFTcJdn7k0GvSyPYr/8CczC2x6+E1fB0UWYg3ORiqMNfVAZztTGHRZgTo8orIX7GAKo1GoGyN4qUlpnaWkh9L1YvpgzjmRz0UfeihUXGfQHfaLWZ8DJe8EfVuSVRr/ppjN2eep8n2TuDIhsK6yxdh+wL2Bfm1Pl2eZUQKy/caNvZuzd/KcCLdADxpqnx1jxO1M5zOyqcl/rt5h067Ja/OSG0WEq0tGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4vTUOBJgzAlXs719RJnyvnZInYvsTAv4trJwDAreKgo=;
 b=A0NoasdtgvTL18RqtL0r6+kdsc6gmH07UfsCJmLq0CUwfPVmLh9DEm7aadcqTujlYTGar+GiX2HlOkjJMQJyHKt2ShGVDeOAraCh67RDt4jecXeHfrG5BDfUxSg9dZAlO2gfoNGznuPIrUhxHjToTlcQkYFuERcBwnjNILRpfxQU3EaPV6S7QOgzqW8ti4Sk5wwnqxR/QJHKwedbhmgOjMI+guQy7IyvnsOn9YuZw7qRfLEiZ+erhlskOjM81Mg950T0gPtBleEOsTSXYFINMUJ6oxCIEQMf/sMzhEJZBa5QnJKUmCvINiYERrV9dp6hz4+c5+8Pi916eyiM5S7C9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4vTUOBJgzAlXs719RJnyvnZInYvsTAv4trJwDAreKgo=;
 b=LZBs62WaTIlfVFd/JPepHsrk3M6ACpqzB4j8o3A+AT6bZ2W6wboCtaVxF0vxh49Oc0W5iKm8xU5OqCEYSS5CDz734FpwRSr/lJnbQsYJGji3KDHsZYdH+dd/pxNsN/BfANe+MqJZyKfIUQSIDWVPwp/zuGdDaXurpt5RrB9m5CEusTC6UJePqiJP+jfBQz+ZWwB9rIYGz0KAwM9ucOOYwGMftbSZ+seH+9e1neYjKMQ0aADDXJbCeWo7j0W7U0Km5Q5glwL3bjSCCxanJBJQUcZA6GRikD0aRCpU4eo1G+Hck6p0cvYK4SqZATvx/De+zzGmvmD+ogn8yy4TSdW0cA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by GV1PR04MB10966.eurprd04.prod.outlook.com (2603:10a6:150:204::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Mon, 30 Sep
 2024 09:29:39 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8005.024; Mon, 30 Sep 2024
 09:29:39 +0000
Message-ID: <720548c9-bed8-4792-a323-90e472fd7404@nxp.com>
Date: Mon, 30 Sep 2024 17:30:00 +0800
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
 <b5ad1ace-4a0e-4a17-91f3-6b374ef168c7@nxp.com>
 <TYWPR01MB1134310A59DF5B26D97954FAC86762@TYWPR01MB11343.jpnprd01.prod.outlook.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <TYWPR01MB1134310A59DF5B26D97954FAC86762@TYWPR01MB11343.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SI1PR02CA0003.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::20) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|GV1PR04MB10966:EE_
X-MS-Office365-Filtering-Correlation-Id: 6036ecbd-7071-4c5d-6fc3-08dce13267d9
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bmdEKzlWeUp0dHEyNDJlSjJrbjQ1TDNWbmlockhNV1NvdjF2K0FrakJLSjg3?=
 =?utf-8?B?NmJmMU13QkkyMVBCN3ErWjB2NnlwS1g1bG8rVUxxNk9WSU1rMklFdmpFME9M?=
 =?utf-8?B?TWdLbVM2VTAybkNHWDFnbkxMTXpLTzVRT1habnB4UmFGQjUrNk9EWmlzSytu?=
 =?utf-8?B?eEJybXBVdFpRSm5wckRncnVrdHEzNXFreTBIRXZjcjV2bVM1MldMUWNBMnFP?=
 =?utf-8?B?cnBGYjlUK1JnY2IraWJXWU5GY20vY0VwMUlwR2JIVXIvVk9ZWHBxQy9aL1Vi?=
 =?utf-8?B?dlJjeFZ3eWo2V2lkUjYvdXpIcnJDRW1vMzI2UVpCY2NpVFJJZmlxQUxySnBk?=
 =?utf-8?B?V1dLcWRBNWs3OUVYUzI3OEZQVWg1Qi9lWXVVaHVjWENoTXB3OVBFS0V3QTZp?=
 =?utf-8?B?M1lTcWcyTHJMOTFvS3JRMlAzQW1oZGpmT2lyYTlRK0QwWFAvRWZPV0phYjc5?=
 =?utf-8?B?KzZMYi8xYy8xM1E3N2Y5MWgxaXdFTVlLNEVUYmdDRHZZMXNGUlRYbjNvSU5a?=
 =?utf-8?B?UzZyZDRFdVVMcUVKTWJSNkx4NnUvb0pCTzZ5VEJuS0hNL3lHSTBtTSt3S2ow?=
 =?utf-8?B?RlNYdFhFd0VQdUo0R1VJTTNLR1dxb25HdEt2R1JUUzBNTG91K1pVVzlyMGx5?=
 =?utf-8?B?QmlQN3E4clVPbk1ZSHhOb1FBNlpvdzhUMi9vS1YzRm9ZUVROcFdjWUdMWkxx?=
 =?utf-8?B?VURVcS9mQ0wwVXp0R2xpOThwSmVIQ3phNW8zMW4xMC80bE4rQnNSeklZcmpS?=
 =?utf-8?B?Y0Y5cGdUWjhxa0phK0RMQlo5SXhISEtrcFRHYndTZDIzRnpsbEUyY0ZFaHp3?=
 =?utf-8?B?UFFSSEtUUlpQb1RmYmxVOHhIek1CRnVrZDJIT1lTVDhlS01qY0Q2MjZtc1Vv?=
 =?utf-8?B?ZG9lQnJmV2tOMFhsc3lCNSsvcVcvc05heTEvV1I1Q0FtNDlqMzcwKzBNR2ZP?=
 =?utf-8?B?MWZOdmpqMkhHQmUxN0RFMDlZZDRYZVdhWTNMNURTMEhNQjgvdVdzTEpMbWl4?=
 =?utf-8?B?TUI0ZVFnVjZJbDhUVTRsdDVVNG1LY0x4SVJlNEVrWTh6UDJKZkVNSG9qSWEr?=
 =?utf-8?B?SXArZFZuMFRUcmNUQ3pSd0M2dWFmZG1qZkhpV0E3dWpHQnBwY3h1ZlN2b1g5?=
 =?utf-8?B?YXF0S0FCOVlWR3IwcW1ONGh3bmQ4THRybGVDbWpaMVdZRzBGYk14QXVJUHF4?=
 =?utf-8?B?SVVrZDUyVmVlbEpLNTJlekJxcldKbTBQY3ZzSFc4ZTh0V1JzV0p4VUJOZ1Y5?=
 =?utf-8?B?b2oyS1pHSy9rVkRsYTdrTlhJR0RaWTJ6ZnptdmlFNzRGWDZ3aHRQcjl2WlV4?=
 =?utf-8?B?M2Jtc2xZTXFWem1KSTQ2enJuYjlDNy9pakFGcUI1TFpxV3JaVytMUGkyYjd4?=
 =?utf-8?B?T0dFYm81Y2pMeHBZbW1nZ250MXp5eDI0NkdVVm5XSTllMG9FZUFEa1V0NjdN?=
 =?utf-8?B?ZnRYTDF6VEhSMDRyS1ZMOER2eEdJRlQreWtEYWpCZkNjUCtLQVZlNUQ5RVpQ?=
 =?utf-8?B?Lzl6TnNHdVFkVXlKTXAwSGtnbll2cHJsZUVFRGJxK3VnMU9VdzdNWDRvOEtJ?=
 =?utf-8?B?V3kvVVM2dy81MStEN3hEd0VkbVdvTzY1VjB2RklieEFDN0UrRjY5QzBRZFhK?=
 =?utf-8?Q?ExJe66zVhf76Xv8vbKZ5IJJwmhSrMwKZmvm4LyT3Z+Hc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M3dtRlA2QmJ2N3RCdDBvSmhDemhxMnBySUxqNGJjL0lDTmQrR285NDJYVVFB?=
 =?utf-8?B?ZVJ0S1VROWwrTDBlbExWOVZSZHJhekcyMnp6Z1ZvV2c3aXZTeHZMakN4dDlm?=
 =?utf-8?B?VXh5N3dtQzNXQjVPOERSOEFnODByK2x3U1dsVWthMjFrQjZ3cUt5OUMzT090?=
 =?utf-8?B?clNqZkFLaDUrUFBtVVozSDVxdXpVYUpPUDd0c1VUcTVqOC85WHgrbmtSb0lp?=
 =?utf-8?B?YmRCdUZ3R1Byb3RLZXpWbHhCK1lZSWowWkNvUmM0Yk4xM2JOL3ZYMmFPZk1H?=
 =?utf-8?B?MWI4ZlB3Q216c1dTaWdxeXJYTXFLQVNtbGNpOGJsWkxyYWVGbm4yM0k5YThW?=
 =?utf-8?B?V2trM2FOQzMvS1N5STlmMUYxdzB2aUtpSmlOMDhqVFAwbTJTd0kwZUgxZk94?=
 =?utf-8?B?eGl5VHN6N1dkQVZpc0N4bGttbVRzWC9UVlgrM05vZzNCelNwT0h2eU8rTGZR?=
 =?utf-8?B?RU5HK2dqS0hhTUZNQUtEV2V3NUJMYzNzYU92NzJEZlR6L2pWS1pRdWxBcWQ4?=
 =?utf-8?B?WHVsM0hBZ252dGNHS3gyUytKMnVKc2VJOHZhMENLVUdvRzY4ZW05OU52UEJ1?=
 =?utf-8?B?T0g3VzZpUFkybENONzF4ZThKMGRRZk9NRTdKY1FaS0NRc05pSnpycksrVUsv?=
 =?utf-8?B?TnFqalZRU3VuY0lwRlNLSExiNU9rSjBQOWg5RVJCN2pHQjdtdUE3YXdSK0xE?=
 =?utf-8?B?bGJGWGJNNVcrYVZXbld2VnkrYXFUWGtXdlBzMFZGNEtKdWd1VW1NYzMzVlZW?=
 =?utf-8?B?U3pEUVFCbm1idFNucFRvOFNSc3hCT2dNWlI2UXpTTTNrSWRINExNRkROTk9j?=
 =?utf-8?B?aDhkVExYV3Yya2kwU2NHUUlZYnl4eHM2Uy90UnJyUk9vTDdIMnFDaE9HRkpV?=
 =?utf-8?B?ZFh4cTZjOXZiUmVzVk9XV2JFMHU4KzhrandLdzloME9CNlJrUU9pcXJWWHRG?=
 =?utf-8?B?NVhTTEpyb2NKKzBSdXN1aXlnSHV2UGVJbUVscVR2T2g2UXl0V0Q4NUh6Nk5F?=
 =?utf-8?B?cHFkTmxGa3BkMjRzOEJDNkZGandnMGtTTVJLN0lWRHVuZjIzeXFpUy8yQXVh?=
 =?utf-8?B?UkV0MGt0R1UrVEkxbmpmeEo0OWJ2dXVrZlhtR0d1TnZiRDVvQVhmSTc3Vlky?=
 =?utf-8?B?QmJyZmFMV01TSnNGWEEyVEYrNldxWkNCMi9HQWVCVzBuY3I1SkFIelFyYWMy?=
 =?utf-8?B?ZE1NRmkwQUFnem5weEtGMkJhNkc1ZUhDQ3hwQWZsc2lsY0NuajNHenZpVFJY?=
 =?utf-8?B?YmIySnVheFpGZEZyN1lKT20rWElDcU40T2ZHd3FFdkJOWG5sSGtreENIRE0x?=
 =?utf-8?B?MHM3ZTVFZmRFV0FXeFZOMkp0SVpQWENISTBoV2VPcGFuS2hjWHM4STlHWEpL?=
 =?utf-8?B?K0lBdFQ5UTVzZ0RlbTJCUXZhWDk1cjJaK01sZ1lYbTFMNGh1NERBVDhJaVN5?=
 =?utf-8?B?MTAxOWlCRTdsU2R6dUlvUmc5dXRIWGJRL0VYNy93alExcm16dlhwa3lZY0Ux?=
 =?utf-8?B?eGJjZWp4VlpDdXVubExMVWRubGJjbE5hMUpINFdmdjBTcUlQN0ZxZnd4ZVk4?=
 =?utf-8?B?RXJ3RjU5VlV1WjZpVFlEemlOUGF3Zyt2K0pNOWZPcTZTQ2gxZjZlcEhHeDJS?=
 =?utf-8?B?TXBsdUg2VVlWdS8rS0s0dFFhSGVkV29hU281a0tCMGgyMkEwOXlPVkFUbk9o?=
 =?utf-8?B?T0NrTmxOeTZ5UEZBMmpNNDFoZDk1RTdOcmdkWGJoRHR6QjNHeVBUb0NMVThq?=
 =?utf-8?B?Z21vMnJZck80Z2FJSWMvYllKOHNZMXZxMEhyeEhmbWpEU0UweEZjNFVPZEU2?=
 =?utf-8?B?REwrOGxZd0hlRVptNkVMWG9YcnBIajl3bXBKcStMZEV0dVdjbnN4MjJZTWF3?=
 =?utf-8?B?NGpycmh4YWtFSVp2Z2U5Y2twYU8rZm4rYXBJTnUxQWZFanpUWDhyeWdpRjQv?=
 =?utf-8?B?eEY3OVhtVnhLMXFlQi9aNVJYaDh2YUpxNU95dHJQS0ZHd2EzZHBSVW5DdmRk?=
 =?utf-8?B?OXNMN3Y0WTRaODRialBrZmVPYWhBVmlrbG9ndFhBcmVvb3BrTU9GbnRCai9y?=
 =?utf-8?B?cEFuR05CNy9iZjNxOFFJOHdRU2dtMlBnSXZvcHpxcDRWeXdtaEM1NnFPQmZH?=
 =?utf-8?Q?QstrgDduL1YpgQgLfbSWubjYw?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6036ecbd-7071-4c5d-6fc3-08dce13267d9
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2024 09:29:38.9577 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pbzzSBSUZ9rrZBIwBgxKUFSqCtes5TleV7BF6xW+v+PncCTC9QzDHFbZwoteTLi4naufDCEyp/FPDiiwULO80A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10966
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
>> From: Liu Ying <victor.liu@nxp.com>
>> Sent: Monday, September 30, 2024 10:16 AM
>> Subject: Re: [PATCH 5/8] dt-bindings: display: bridge: Add ITE IT6263 LVDS to HDMI converter
>>
>> On 09/30/2024, Biju Das wrote:
>>> Hi Liu,
>>
>> Hi Biju,
>>
>>>
>>> thanks for the patch.
>>>
>>>> -----Original Message-----
>>>> From: linux-arm-kernel <linux-arm-kernel-bounces@lists.infradead.org>
>>>> On Behalf Of Liu Ying
>>>> Sent: Monday, September 30, 2024 6:29 AM
>>>> Subject: [PATCH 5/8] dt-bindings: display: bridge: Add ITE IT6263
>>>> LVDS to HDMI converter
>>>>
>>>> Document ITE IT6263 LVDS to HDMI converter.
>>>>
>>>> Product link:
>>>> https://www.ite.com.tw/en/product/cate1/IT6263
>>>>
>>>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
>>>> ---
>>>>  .../bindings/display/bridge/ite,it6263.yaml   | 310 ++++++++++++++++++
>>>>  1 file changed, 310 insertions(+)
>>>>  create mode 100644
>>>> Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml
>>>>
>>>> diff --git
>>>> a/Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml
>>>> b/Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml
>>>> new file mode 100644
>>>> index 000000000000..97fb81e5bc4a
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/display/bridge/ite,it6263.yam
>>>> +++ l
>>>> @@ -0,0 +1,310 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/display/bridge/ite,it6263.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: ITE IT6263 LVDS to HDMI converter
>>>> +
>>>> +maintainers:
>>>> +  - Liu Ying <victor.liu@nxp.com>
>>>> +
>>>> +description: |
>>>> +  The IT6263 is a high-performance single-chip De-SSC(De-Spread
>>>> +Spectrum) LVDS
>>>> +  to HDMI converter.  Combined with LVDS receiver and HDMI 1.4a
>>>> +transmitter,
>>>> +  the IT6263 supports LVDS input and HDMI 1.4 output by conversion function.
>>>> +  The built-in LVDS receiver can support single-link and dual-link
>>>> +LVDS inputs,
>>>> +  and the built-in HDMI transmitter is fully compliant with HDMI
>>>> +1.4a/3D, HDCP
>>>> +  1.2 and backward compatible with DVI 1.0 specification.
>>>> +
>>>> +  The IT6263 also encodes and transmits up to 8 channels of I2S
>>>> + digital audio,  with sampling rate up to 192KHz and sample size up to 24 bits.
>>>> + In addition,  an S/PDIF input port takes in compressed audio of up to 192KHz frame rate.
>>>> +
>>>> +  The newly supported High-Bit Rate(HBR) audio by HDMI
>>>> + specifications
>>>> + v1.3 is  provided by the IT6263 in two interfaces: the four I2S
>>>> + input ports or the  S/PDIF input port.  With both interfaces the
>>>> + highest possible HBR frame rate  is supported at up to 768KHz.
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    const: ite,it6263
>>>> +
>>>> +  reg:
>>>> +    maxItems: 1
>>>> +
>>>> +  clocks:
>>>> +    maxItems: 1
>>>> +    description: audio master clock
>>>> +
>>>> +  clock-names:
>>>> +    const: mclk
>>>> +
>>>> +  reset-gpios:
>>>> +    maxItems: 1
>>>> +
>>>> +  ivdd-supply:
>>>> +    description: 1.8V digital logic power
>>>> +
>>>> +  ovdd-supply:
>>>> +    description: 3.3V I/O pin power
>>>> +
>>>> +  txavcc18-supply:
>>>> +    description: 1.8V HDMI analog frontend power
>>>> +
>>>> +  txavcc33-supply:
>>>> +    description: 3.3V HDMI analog frontend power
>>>> +
>>>> +  pvcc1-supply:
>>>> +    description: 1.8V HDMI frontend core PLL power
>>>> +
>>>> +  pvcc2-supply:
>>>> +    description: 1.8V HDMI frontend filter PLL power
>>>> +
>>>> +  avcc-supply:
>>>> +    description: 3.3V LVDS frontend power
>>>> +
>>>> +  anvdd-supply:
>>>> +    description: 1.8V LVDS frontend analog power
>>>> +
>>>> +  apvdd-supply:
>>>> +    description: 1.8V LVDS frontend PLL power
>>>> +
>>>> +  "#sound-dai-cells":
>>>> +    const: 0
>>>> +
>>>> +  ite,i2s-audio-fifo-sources:
>>>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>>>> +    minItems: 1
>>>> +    maxItems: 4
>>>> +    items:
>>>> +      enum: [0, 1, 2, 3]
>>>> +    description:
>>>> +      Each array element indicates the pin number of an I2S serial data input
>>>> +      line which is connected to an audio FIFO, from audio FIFO0 to FIFO3.
>>>> +
>>>> +  ite,rl-channel-swap-audio-sources:
>>>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>>>> +    minItems: 1
>>>> +    maxItems: 4
>>>> +    uniqueItems: true
>>>> +    items:
>>>> +      enum: [0, 1, 2, 3]
>>>> +    description:
>>>> +      Each array element indicates an audio source whose right channel and left
>>>> +      channel are swapped by this converter. For I2S, the element is the pin
>>>> +      number of an I2S serial data input line. For S/PDIF, the element is always
>>>> +      0.
>>>> +
>>>> +  ports:
>>>> +    $ref: /schemas/graph.yaml#/properties/ports
>>>> +
>>>> +    oneOf:
>>>> +      - properties:
>>>> +          port@0:
>>>> +            $ref: /schemas/graph.yaml#/properties/port
>>>> +            description: the first LVDS input link
>>>> +
>>>> +          port@1: false
>>>> +
>>>> +          port@2:
>>>> +            $ref: /schemas/graph.yaml#/properties/port
>>>> +            description: video port for the HDMI output
>>>> +
>>>> +          port@3:
>>>> +            $ref: /schemas/graph.yaml#/properties/port
>>>> +            description: sound input port
>>>> +
>>>> +        required:
>>>> +          - port@0
>>>> +          - port@2
>>>> +
>>>> +      - properties:
>>>> +          port@0:
>>>> +            $ref: /schemas/graph.yaml#/$defs/port-base
>>>> +            unevaluatedProperties: false
>>>> +            description: the first LVDS input link
>>>> +
>>>> +            properties:
>>>> +              dual-lvds-odd-pixels:
>>>> +                type: boolean
>>>> +                description: the first sink port for odd pixels
>>>> +
>>>> +              dual-lvds-even-pixels:
>>>> +                type: boolean
>>>> +                description: the first sink port for even pixels
>>>> +
>>>> +            oneOf:
>>>> +              - required: [dual-lvds-odd-pixels]
>>>> +              - required: [dual-lvds-even-pixels]
>>>> +
>>>> +          port@1:
>>>> +            $ref: /schemas/graph.yaml#/$defs/port-base
>>>> +            unevaluatedProperties: false
>>>> +            description: the second LVDS input link
>>>> +
>>>> +            properties:
>>>> +              dual-lvds-even-pixels:
>>>> +                type: boolean
>>>> +                description: the second sink port for even pixels
>>>> +
>>>> +              dual-lvds-odd-pixels:
>>>> +                type: boolean
>>>> +                description: the second sink port for odd pixels
>>>> +
>>>> +            oneOf:
>>>> +              - required: [dual-lvds-even-pixels]
>>>> +              - required: [dual-lvds-odd-pixels]
>>>
>>>
>>>> +
>>>> +          port@2:
>>>> +            $ref: /schemas/graph.yaml#/properties/port
>>>> +            description: video port for the HDMI output
>>>> +
>>>> +          port@3:
>>>> +            $ref: /schemas/graph.yaml#/properties/port
>>>> +            description: sound input port
>>>
>>> What about single lvds as device support it?
>>
>> The single LVDS link has already been documented in this binding doc.
>> Please find the "properties" above where only "port@0" and "port@2"
>> are required.
> 
> Maybe "the first LVDS input link"-->"Single LVDS input link" for single LVDS block??

Nope.

I tested single LVDS link with the second LVDS link.  It didn't work.
The single LVDS link only works with the first LVDS link.

> 
>>
>> imx8mp-evk-lvds0-imx-lvds-hdmi.dtso and imx8mp-evk-lvds1-imx-lvds-hdmi.dtso
>> added in patch 7 support the NXP adapter card with single LVDS link.
>>
>>>
>>> Cheers,
>>> Biju
>>>
>>>> +
>>>> +        required:
>>>> +          - port@0
>>>> +          - port@1
>>>> +          - port@2
>>>> +
>>>> +        allOf:
>>>> +          - if:
>>>> +              properties:
>>>> +                port@0:
>>>> +                  required:
>>>> +                    - dual-lvds-odd-pixels
>>>> +            then:
>>>> +              properties:
>>>> +                port@1:
>>>> +                  properties:
>>>> +                    dual-lvds-odd-pixels: false
>>>> +
>>>> +          - if:
>>>> +              properties:
>>>> +                port@0:
>>>> +                  required:
>>>> +                    - dual-lvds-even-pixels
>>>> +            then:
>>>> +              properties:
>>>> +                port@1:
>>>> +                  properties:
>>>> +                    dual-lvds-even-pixels: false
>>>> +
>>>> +required:
>>>> +  - compatible
>>>> +  - reg
>>>> +  - ivdd-supply
>>>> +  - ovdd-supply
>>>> +  - txavcc18-supply
>>>> +  - txavcc33-supply
>>>> +  - pvcc1-supply
>>>> +  - pvcc2-supply
>>>> +  - avcc-supply
>>>> +  - anvdd-supply
>>>> +  - apvdd-supply
>>>> +  - ports
>>>> +
>>>> +additionalProperties: false
>>>> +
>>>> +examples:
>>>> +  - |
>>>> +    /* single-link LVDS input */
>>>> +    #include <dt-bindings/gpio/gpio.h>
>>>> +
>>>> +    i2c {
>>>> +        #address-cells = <1>;
>>>> +        #size-cells = <0>;
>>>> +
>>>> +        hdmi@4c {
>>>> +            compatible = "ite,it6263";
>>>> +            reg = <0x4c>;
>>>> +            reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
>>>> +            ivdd-supply = <&reg_buck5>;
>>>> +            ovdd-supply = <&reg_vext_3v3>;
>>>> +            txavcc18-supply = <&reg_buck5>;
>>>> +            txavcc33-supply = <&reg_vext_3v3>;
>>>> +            pvcc1-supply = <&reg_buck5>;
>>>> +            pvcc2-supply = <&reg_buck5>;
>>>> +            avcc-supply = <&reg_vext_3v3>;
>>>> +            anvdd-supply = <&reg_buck5>;
>>>> +            apvdd-supply = <&reg_buck5>;
>>>> +
>>>> +            ports {
>>>> +                #address-cells = <1>;
>>>> +                #size-cells = <0>;
>>>> +
>>>> +                port@0 {
>>>> +                    reg = <0>;
>>>> +
>>>> +                    it6263_lvds_link1: endpoint {
>>>> +                        remote-endpoint = <&ldb_lvds_ch0>;
>>>> +                    };
>>>> +                };
>>>> +
>>>> +                port@2 {
>>>> +                    reg = <2>;
>>>> +
>>>> +                    it6263_out: endpoint {
>>>> +                        remote-endpoint = <&hdmi_in>;
>>>> +                    };
>>>> +                };
>>>> +            };
>>>> +        };
>>>> +    };
>>>> +
>>>> +  - |
>>>> +    /* dual-link LVDS input */
>>>> +    #include <dt-bindings/gpio/gpio.h>
>>>> +
>>>> +    i2c {
>>>> +        #address-cells = <1>;
>>>> +        #size-cells = <0>;
>>>> +
>>>> +        hdmi@4c {
>>>> +            compatible = "ite,it6263";
>>>> +            reg = <0x4c>;
>>>> +            reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
>>>> +            ivdd-supply = <&reg_buck5>;
>>>> +            ovdd-supply = <&reg_vext_3v3>;
>>>> +            txavcc18-supply = <&reg_buck5>;
>>>> +            txavcc33-supply = <&reg_vext_3v3>;
>>>> +            pvcc1-supply = <&reg_buck5>;
>>>> +            pvcc2-supply = <&reg_buck5>;
>>>> +            avcc-supply = <&reg_vext_3v3>;
>>>> +            anvdd-supply = <&reg_buck5>;
>>>> +            apvdd-supply = <&reg_buck5>;
>>>> +
>>>> +            ports {
>>>> +                #address-cells = <1>;
>>>> +                #size-cells = <0>;
>>>> +
>>>> +                port@0 {
>>>> +                    reg = <0>;
>>>> +                    dual-lvds-odd-pixels;
>>>> +
>>>> +                    it6263_lvds_link1_dual: endpoint {
>>>> +                        remote-endpoint = <&ldb_lvds_ch0>;
>>>> +                    };
>>>> +                };
>>>> +
>>>> +                port@1 {
>>>> +                    reg = <1>;
>>>> +                    dual-lvds-even-pixels;
>>>> +
>>>> +                    it6263_lvds_link2_dual: endpoint {
>>>> +                        remote-endpoint = <&ldb_lvds_ch1>;
>>>> +                    };
>>>> +                };
>>>> +
>>>> +                port@2 {
>>>> +                    reg = <2>;
>>>> +
>>>> +                    it6263_out_dual: endpoint {
>>>> +                        remote-endpoint = <&hdmi_in>;
>>>> +                    };
>>>> +                };
>>>> +            };
>>>> +        };
>>>> +    };
>>>> --
>>>> 2.34.1
>>>>
>>>
>>
>> --
>> Regards,
>> Liu Ying
> 

-- 
Regards,
Liu Ying

