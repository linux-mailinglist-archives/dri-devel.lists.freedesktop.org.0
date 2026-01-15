Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD5CD22B8D
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 08:08:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C496B10E6B6;
	Thu, 15 Jan 2026 07:08:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ezPfBKje";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010050.outbound.protection.outlook.com [52.101.201.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 020F410E6B6
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 07:08:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pQ3OKmTWd/x6TltNXMpgbudXkH1li53INQZb/PLfnHgrI/btcvIh8DLRsTHEsuTTD4/vnfq4RsIDfIhGjNLhvPnUT18Y7iSzzjATTVnsyV/mJmgDXyxKNUbh9cRu+0NSm1WSF7Enr4yiCam7sVfnS7Fa61EHvhoXKSj86RqbYHZNard9Fi+OaiF6QSDCkrGUPVPFPSqrFZxze3GWUWwE6M8bxu5DivzaD3OyoyWjHdx/Olj0VtVX6sOMWiU+JoKUWYEL57CGOR4gYXAyLVzJtryojSaMrx7C7KKyD0KoElDKbN7FUjM9La017eozOhqNupX0+Sg8umJPcid2eh1UGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K1YOekC+8dkuihDwwOG/GaiCZk97xgJd1kTNzvzXrWo=;
 b=EbbdSfIaNg3Z5eKBwWtAHfX0ry+FgbQ2cF1GqRcB/NInTVtHR4PMwbqKVoZxjC5gC+qwr60zQqhFUT1UHB6nRMs9ESdy0IeTr78GdF72EeMQ+u4rDPyzol5c8mw1U6e1KYK29TJACrGhF2GDNpH+P5pmrzUltB+SwTNSg0nF5f8ZcZ3VCAtMGytJyRZEqVpRT95/PjI90nKdLC5ZUiFtToHJVXldVeS8mVaVLzsMq2j3JY/EUd8wBv21PtckZ1mqwcm6YgZYDV0v316/tszDgpCspQZ/hkqrq6X3Z4JHYLyfXWAwYKR8p/1OR1on6euIo0KV8Papbr/HuiAaANrDhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K1YOekC+8dkuihDwwOG/GaiCZk97xgJd1kTNzvzXrWo=;
 b=ezPfBKje8qvEp9vQ7q0iixBxXEYuFlXjnUrEINhhT2lU/R28T5jUmZk3ggBXFwYrq8YTxA1yFeST9+PuYYYqDmRP1bCxJYuqngr3Epc4uz0lzzEXlSwpWkRj1QK/9IlUSifprGWTikjjI49uT3A32XRr/aHZa1ODFv74Ukg4m3M6UWBZ33aQKH/pOv3p1d9CeZe89fSZzH9/FxW3ARko6CN5LqLapSumycboeixV3Gf+64hH8/F9ansQRtCj34RhQslx8gFUx6o8iZH+xghPehFCrIYFfGlrZDPtp86d9M/RHqTg2yEkOL1LtAlyEiqwi6Oif6p8CuS/C2iVXE49qQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by BL3PR12MB9049.namprd12.prod.outlook.com (2603:10b6:208:3b8::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Thu, 15 Jan
 2026 07:06:26 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::1f16:244a:2a9d:2c93]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::1f16:244a:2a9d:2c93%3]) with mapi id 15.20.9499.002; Thu, 15 Jan 2026
 07:06:26 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Dmitry Osipenko <digetx@gmail.com>,
 Charan Pedumuru <charan.pedumuru@gmail.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 4/4 RESEND] ARM: tegra: adjust DSI nodes for
 Tegra20/Tegra30
Date: Thu, 15 Jan 2026 16:06:22 +0900
Message-ID: <3118353.iZASKD2KPV@senjougahara>
In-Reply-To: <20251204061703.5579-5-clamor95@gmail.com>
References: <20251204061703.5579-1-clamor95@gmail.com>
 <20251204061703.5579-5-clamor95@gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYWPR01CA0038.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::8) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|BL3PR12MB9049:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a5b44d4-f68d-4aee-ffe0-08de5404993b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VWlFbG5jL0pMNjVTNnhRcjNmRytFWjhwUVJZM1U0Z01JdGV6THExU2hiZ3FK?=
 =?utf-8?B?dFA3MHRqam1TYXhRenBhbXZnRVk0OW9qZHlpL0djUDFmTEFuV2g2V2hwUUFt?=
 =?utf-8?B?d3FLRWhMWDE2V2JDR29BNnA4cjBuS0VxWTl0RFZhR2hiRUpZKzFTZzJoNklB?=
 =?utf-8?B?Zk01VXpVMWFac0F5ZmkzZUEvQXM1OWJUd1JNaTVka210blhaVTFDem4vRE5J?=
 =?utf-8?B?RFA3VnRoK1BXeUxxTjVGUmpoUnM0YVVXYmtZditHbGlTYkxBVG1qMXUwNU9m?=
 =?utf-8?B?UmtBOXUrbStWUFB1bWFLazBLbzF1b1NnUFgzdHB4bU8zK3RtcXJQYWNESVRa?=
 =?utf-8?B?ZmMvQnRSc2FCN1NReUo3Z2xoN3hOaXZ3RHNvaTRldGpzNk40Vm5lZkVMd0Jo?=
 =?utf-8?B?K3Vac3JjWnFFVDhRSy9DTkdNUTlMNjVCYjhpc0hoTms5VFJ0KzJXYXo2SHY0?=
 =?utf-8?B?NWtlVVNaUkVHWkdnVXNBRkYyNkpSVmF1SmM4ZitwclJXYUZqWWNTMFNUT0RO?=
 =?utf-8?B?b3JtOGQ0S0liVFlBOHMrK1owQUx2MXV1RjFsQVRZQTlwcU9wck9MWWxjcytP?=
 =?utf-8?B?Tm1lamtBemtxZ1V0OG9KSzNxYUR6QjBpeXNhQXNqSVg5QkdVdWNVZHdoUTRH?=
 =?utf-8?B?MWZXM0tMT0QxcGFuTjBqR2wwYTZzeXczYS9KSTlYWFNaMkJBNVBFZVVIbHNR?=
 =?utf-8?B?N3hGT3dvLzJRaUUweUNGeUJER01EWUJqQkM5VXFMWWlDNm5uMGprVXJEZy8y?=
 =?utf-8?B?cWl3TkpjYmhBNlVQQVNoM1A4cnJDWE4xYjJxU003SHdleExTRGxrem1JZzZS?=
 =?utf-8?B?NTF4ODltYTZ6bVlGNnpRMlNuMmM0OS9IVmxZV2MremZkcEFIY2RMT084VnZr?=
 =?utf-8?B?c1FxNDcyQ21qVEFLM2E5dFh2d2NzOWtqVDN2VnlDenY3VHIrVXJ4L1dlVEFS?=
 =?utf-8?B?RXlQYmZSQU51VGtLdFIvUUhVdTBFRGhCcmVGSDNsZG95TEdab1NnSk90QUUw?=
 =?utf-8?B?UEwxWGdxcEZDSHdkYVVnY3M1WVlTVjI3eUNPUjJHbEZvZnU5Uk1vL2hnVHdi?=
 =?utf-8?B?U2lyd1p0clBNMS9wS2EvbkJnVFVsY2ZzQ1pCN3hkTERCUk4wQi92QWx0b2sx?=
 =?utf-8?B?eE85UDdsaGNFdzBUYVI4T1BCTDd4NG85dlYyWk9jeVZtbmQrYW51WFFYUWd2?=
 =?utf-8?B?NWZ4Yno3L2VXV21uV1dzdHFDZEd3OTNNZXlpNi9DTk9tenZ1dUZ3THg2STJk?=
 =?utf-8?B?TnI3bEErbG4xYnZJVnRNSmFKY1BZNW9ZVHlLNVVlRVRIbFU1SnZYQmZvZll0?=
 =?utf-8?B?V2NGQ0hIbFUyL3VneGlEbUF6Ly82OW4xTExzVm0wUWV6TW4xUTJyVUlma0Vz?=
 =?utf-8?B?VXBhMW4yM3kzR2xDMk13cTlOdlNDWmVYTFFNc1RpWlRmM21aRitxMmM5WFFV?=
 =?utf-8?B?U3VSTnVRL0MyUlZ1ZnQwRWVpZUZXUlhaVjlUNys2K1piam5BSE4vTTBkOVo3?=
 =?utf-8?B?ZzdqRmZkZkVGT2g1T3hJU1B5UHZubVhtQ1doMUNsMjFQZVNheklLZjB1YkQ0?=
 =?utf-8?B?YzFxb0F1LzlQbG1lWEVza1JZaTRUSFBIWXlxa2Vpc05ITzFldyt5V2FoLy9J?=
 =?utf-8?B?ZWRwa3liSjZpRE5FVzBMNWtUMW1iQVNLSmgwVmJrajJSQzdiQS9MRTh5Z3No?=
 =?utf-8?B?dGZORE1DM0xSRHhTSkpqYXJSQ09wYXIvOE15WENiamFEM0dwZUNnTklQSWZI?=
 =?utf-8?B?N3M4cldMTzI4Z3pheWVkYkRiZUh6QnlRSXR2a2dpdTBxanZxMjdPeGRldWJS?=
 =?utf-8?B?RElFQ24wMFRlL08xTWJ1d0plaHAxdndXQ2dIOVNha0N2VVdyejFvVWcyUnNm?=
 =?utf-8?B?RmZOSmdhUC9JdW5wS09RcVdQc3FrVGRWWnkxVGZkcWFzN2ZDRlZGU3I0bE1Q?=
 =?utf-8?B?UGkxUCtHQ2FpR3V0Y3QxWkxHVUxySlhucVVKQjlLU3ovQ1N6U3JkcFU1eGEy?=
 =?utf-8?B?Njg0QVcySk1vQUFheWY3TVZGU0tOV3ZJYnp6a2FVWkdjYUpiR1I0TGZiVVBp?=
 =?utf-8?B?Qkx6dUhXeGVKTkpaVGQvMXZlVm4wR3VIbmxyOHF2V2RQRHBMOXk0K2dpRmVy?=
 =?utf-8?B?cXRjMjdPbUFHTFY0YTlrRjdDYzEzOHJMMEhZaWFOZWxmM2ViV09lU3ZWeTFN?=
 =?utf-8?B?ZGc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR12MB9161.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y1NNcW9QQlRkRkh0UEFsZDduM0lhK2I4VzVlY0YrejVHZmVITDNINWJ2TStk?=
 =?utf-8?B?cnJLN0c4eXU2UlUxMUl0cFdTdFJHeWhpVHRwSExMRnNsR0N2SlE3V2NYQms4?=
 =?utf-8?B?T2VtSEhpdkFncmpDWVhSbnJPVitRKzA4QVFwYi9Sc1Fvby9QME5kUzY4YnpV?=
 =?utf-8?B?aUN0eTVTUHNmSUpHZ1ByZTRYbEJ5RGYwV2hNTERHdmQwTFMyOGlwNDZWd0h1?=
 =?utf-8?B?bUkrNjQ1c25KNytabDYyYVIwVUFzVnpOUTZ2VkJ5a1NwOFZmaUI3NzRpbTdo?=
 =?utf-8?B?R1hiUzYxY1lHbytXMHhLYjg4aEMwSmtmSTF2QTlRNzRMMG0vaXkrNGpkM0kr?=
 =?utf-8?B?b3dEeEhuL05qZ1FjWmFVajFhSFNpWmlMekJwcnlWRGFUM0tFZmZZTjZvc2s5?=
 =?utf-8?B?N0swT29vYTdadjgwMVUzdUFJWHdzUUpVY2xZRnF4UWxhQ1RxU2NKbjdGOFR6?=
 =?utf-8?B?SkNST3EzcEdweGp1bUNWMFZNa2VKaGpveWtHeDNBUy9rUDN6UDNCMTFjenNT?=
 =?utf-8?B?bHNtVENEdkRhTkdBSDR1U0FEdGhRRzE5WHIrZXY5ek44ZWJlM1J4ZWtkeEc1?=
 =?utf-8?B?bkEyRWp5Y2dxSWpJTno5WnV2clpHUEtmRVZrWDNlV2tGMGx6VnVTUU11b3R2?=
 =?utf-8?B?cXJDV3JjQndHZzF1OWFnY3pYOGlvSG5rWVllcUVQUEErRnMvcXA2WDNvWVdZ?=
 =?utf-8?B?a2I3ZVBBY3pjMzJGL0YzY3EzY1RzeHZQa28xbEhlSm1pUGJ3QjNwbWdGeXJV?=
 =?utf-8?B?QzlSbE9lY0tjdHBsLzZaeEV6Q3V2N2JNb0VRWjQ3WjRSRkwxR1JFQUhJVzdE?=
 =?utf-8?B?UnpRZUVVVnNERFphWUZ2QU5XdmVSa2dyUm9tSFJsSVJ5T3Fra2FraTZuWDhL?=
 =?utf-8?B?K083cVBZb0Q3bUdnVHF3ckgxNFZHc3JUc1l6aHZMcnM3eGJZRzdJeTg3SGZn?=
 =?utf-8?B?SStUR21PbU00cXc4VXVwMVppYURJUFJMNWplRHpneHp4TlR4T2tvUjBWMUdh?=
 =?utf-8?B?enlsc1NYRzlBN0lTazhlbXRuanFKcFRPd2RxVlhYQXVycFU1M000WEV3eDdx?=
 =?utf-8?B?VDJzZVNuTHZSb1dTT2MzSXZhd1g5amlCdk91eVdmVjFxYXVmVmF4RHAvVjhO?=
 =?utf-8?B?L0dpWW9hdnNhWHpJV2RDSEdqTnF1Q2dXRGtzZnlUQ3YxdDJ1bDR5UDcyWFI4?=
 =?utf-8?B?Z01SL3VQYUdUTjA3RVhidDJtMkhmNjVLUUdnUjY2NHpnM2xXU3VmUTltZUxB?=
 =?utf-8?B?WWEyYXFVYzgrMHRSM1ZWeVVZQ3dPbmxZd0lxVnJwcWFTT3ZoYUsyNHRTaE5H?=
 =?utf-8?B?VklMRDdQUGJaelcxZzAxQmFsSFBLQldjcEJ3TVVtMlZrMUFHbzdsT1lIQVF4?=
 =?utf-8?B?M2IrWEkxeFVkTFZETHk2Rk9FV25reUpMb1dNNlBhYUxJakJzSmRoYVVIVVZV?=
 =?utf-8?B?cmgwelp4eW5kSVl3a3lFd0RDTUJ6K1M3cVlNV1kyVDJiUDBwUWRwdXI5YnV4?=
 =?utf-8?B?M3daOHBZUGVpdDF2MlkzUCtheldqN2s5cEZ6eU1FaElaeEJqMCtaTFQxZWho?=
 =?utf-8?B?Yk5KQit3VkpNREF2NkFhWW5oSnh2V1ZrNGJJRGd6dUN2WlpGQXRvN0kwR3Np?=
 =?utf-8?B?MzlkejlGRTY2STA4K1VvTG1kZDAxekpNc2x4aDY2NWVHN2o4MTFLUXN2NUxR?=
 =?utf-8?B?V09vaHJxM2NLZ0xPeG9KaFViOFF2RDFoUlVoRHFvSEpuMmEwbnhsaUpmOURB?=
 =?utf-8?B?THBqMk1QdVREQmNQWFhkZ09tOWVyektUVzlnaUt5Sk16Tm16cEtDUUE2VW0y?=
 =?utf-8?B?Tlk0WDc5bzd5a3daK3JyQ2ZmUmpYYktOUTFia09kZEw4b2tXalBnbElYTzU4?=
 =?utf-8?B?R0NsUUQzUTBEVXJQS2owYXYzbTYrTGcyZTNPNDloR21BdDZyU2lXSEhLcXoz?=
 =?utf-8?B?V1hnaFdpOWxEWGJROFlpVXdmdWxrTEFnaEJ5TXNHRmJzZUI4KzIzYTRsdUI2?=
 =?utf-8?B?RVBpT1AxVno1MzIrUVgyNFBKQnNFUlI1Yi9iak9yS1pXNHdGZVc3ODZlWERK?=
 =?utf-8?B?YnpDSWYxTFVFdWJzb21kcW1VMTFhNWpVeVA1cENvUWpvcDdiT0N6MTlzN2tB?=
 =?utf-8?B?bXBnMkloazVPWTVOdmo1NWxmSUFhNmZKSm5wR2RJbzl0bUxSOUQ4bUY4czdk?=
 =?utf-8?B?aTExVTJYSW1NeE9FZlpkQXd4bTgrWFc0dHZNenlxZzM0WFBZd2plWmg0Znhq?=
 =?utf-8?B?aDI4V1BlQTI1bHRqZWxqbWEyZ0l3U2N2SGI1anovUW95SHREWDczL3FEY2tU?=
 =?utf-8?B?QzJZdEdzcUxDaVJSVVh6RmhHQ3dlN3ZJbjNTTENQZm5YZld1MVovUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a5b44d4-f68d-4aee-ffe0-08de5404993b
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 07:06:26.1552 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: omdPQviBLXhSGSriHaVgaCpKKa0uXj8cKHFA2nErqgWVEUwEZzkGVCnwwR91yCeE7F2zCpScLkCVbFqq+x14hQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB9049
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

On Thursday, December 4, 2025 3:17=E2=80=AFPM Svyatoslav Ryhel wrote:
> Add missing nvidia,mipi-calibrate and cells properties to DSI nodes.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  arch/arm/boot/dts/nvidia/tegra20.dtsi | 4 ++++
>  arch/arm/boot/dts/nvidia/tegra30.dtsi | 8 ++++++++
>  2 files changed, 12 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/nvidia/tegra20.dtsi b/arch/arm/boot/dts/nv=
idia/tegra20.dtsi
> index 5cdbf1246cf8..39c0f791c7ee 100644
> --- a/arch/arm/boot/dts/nvidia/tegra20.dtsi
> +++ b/arch/arm/boot/dts/nvidia/tegra20.dtsi
> @@ -238,7 +238,11 @@ dsi@54300000 {
>  			reset-names =3D "dsi";
>  			power-domains =3D <&pd_core>;
>  			operating-points-v2 =3D <&dsi_dvfs_opp_table>;
> +			nvidia,mipi-calibrate =3D <&csi 3>; /* DSI pad */
>  			status =3D "disabled";
> +
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
>  		};
>  	};
> =20
> diff --git a/arch/arm/boot/dts/nvidia/tegra30.dtsi b/arch/arm/boot/dts/nv=
idia/tegra30.dtsi
> index be752a245a55..fecd4891e751 100644
> --- a/arch/arm/boot/dts/nvidia/tegra30.dtsi
> +++ b/arch/arm/boot/dts/nvidia/tegra30.dtsi
> @@ -343,7 +343,11 @@ dsi@54300000 {
>  			reset-names =3D "dsi";
>  			power-domains =3D <&pd_core>;
>  			operating-points-v2 =3D <&dsia_dvfs_opp_table>;
> +			nvidia,mipi-calibrate =3D <&csi 3>; /* DSIA pad */
>  			status =3D "disabled";
> +
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
>  		};
> =20
>  		dsi@54400000 {
> @@ -356,7 +360,11 @@ dsi@54400000 {
>  			reset-names =3D "dsi";
>  			power-domains =3D <&pd_core>;
>  			operating-points-v2 =3D <&dsib_dvfs_opp_table>;
> +			nvidia,mipi-calibrate =3D <&csi 4>; /* DSIB pad */
>  			status =3D "disabled";
> +
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
>  		};
>  	};
> =20
>=20

Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>



