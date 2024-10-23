Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A559D9ACA89
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2024 14:50:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0FA910E7C9;
	Wed, 23 Oct 2024 12:50:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="mOzvynGB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2057.outbound.protection.outlook.com [40.107.223.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BFF010E7C9
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 12:50:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=acjCpcY5V1dMrztEwoqKbQhrngtkkQw7TV/SwDiambBHDbspBFtK0kHztAeTvciusLwkDEfiLJ+nIOFpOd6ooEPWFHJs4ThlWBspdB3nHSPn05xiWNhO2fzz0I4j7oIx3z45HxNTDuFptm2HCHDLVmB0XS3+WunVhV5Idl0LAqqTJD+RyFA7+GVbM+VGNHwwv4tsdYhf6LahPbcIJbvd44BTVPJUpmieMLFJMvy7xOisCsXBlvf96Md/yUFSra4V8GjW3pWJPo6Bre0AXpk+N85CZNujUluQ5zuH8rmAThXfeaFEOjnhDLFs21iUwQTrf2pgMS7EswXD/M9IZXJMhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p+h0hHzNR5jn8jjKGnXTgh87um3+JK4hADNO/mSEv0Q=;
 b=bZ5Wjo1XgoArNIeDg4IHQzxIutxeVndAYyQC2n3lal1J9DTsixRXEwFihozlheLwyitF3UVy0sQcBDclFFVjTyET+13DCcwtdR77mLvuRPTHHR23M2sXMOQTTa86QlyDfcTnwfZd3TNNFQ8TCWTaS1x6+AiZ0KpE0jPMEs2VfoGLKxXl4MzZGaFE216C0p1GpyQ4jT8iOD/X7Lxi6v4gvdcj47emgpZNB9Xc53U1Te6cMC3/t42kO2SnXZ+Zd3RVo2RqIl2et3UigmvwD8y8a6H3o0TItzawRHB3vpJHx37N7WlFSxiF0UJ9OxSc7OD8VZj6SUNMR/Tns64l9fasAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p+h0hHzNR5jn8jjKGnXTgh87um3+JK4hADNO/mSEv0Q=;
 b=mOzvynGBzauBY3uc1uos2JOvrywQj0EfziTAlu54k6a8ZqdtmjXwrxOKY0RyRHPUqksc29odb2wrrM4/Bjd13g8GmYsnujj/WbybNgYhz08mjCgYj+VVBW1+kjnvQyhc88FgwRwS1n0p3S1OLo3SijArPo6y7ZrWrxhfAIzFAh4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com (2603:10b6:a03:4f5::8)
 by SA1PR12MB8597.namprd12.prod.outlook.com (2603:10b6:806:251::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Wed, 23 Oct
 2024 12:50:36 +0000
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30]) by SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30%6]) with mapi id 15.20.8069.027; Wed, 23 Oct 2024
 12:50:36 +0000
Message-ID: <c1d30ad1-868a-480a-9601-32106e8d2baf@amd.com>
Date: Wed, 23 Oct 2024 14:50:15 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] arm64: dts: zynqmp: Add DMA for DP audio
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Vishal Sagar <vishal.sagar@amd.com>,
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>,
 =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
References: <20240910-xilinx-dp-audio-v3-0-75560793f4d0@ideasonboard.com>
 <20240910-xilinx-dp-audio-v3-2-75560793f4d0@ideasonboard.com>
 <123f770f-ceb6-4c8c-a065-ace2e02dc65f@amd.com>
 <9f7f0fd7-bca9-4c92-9590-ce621dce7f5f@ideasonboard.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 3i3l5DA=
In-Reply-To: <9f7f0fd7-bca9-4c92-9590-ce621dce7f5f@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P189CA0017.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:802:2a::30) To SJ2PR12MB8109.namprd12.prod.outlook.com
 (2603:10b6:a03:4f5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8109:EE_|SA1PR12MB8597:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bf9c49a-bfe8-4fbd-d0ff-08dcf3614a0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L0pjZDNVMVJ3bWhSNFdTVmxYaHpRQ3dRaEdZVllPTFJiRS9uU0dkaUIxb09w?=
 =?utf-8?B?bGlQNCtDaE9IeUR4OTBtOGJBTzNWVzYwUHdjNFNGVFRoOVc4Wk9Sd2pHcSsw?=
 =?utf-8?B?Z1F5S1U4bG1TUVRFZ1ZlL2xrUEtOekhCdkQ5dXBIOFlHQUgrWVU3bEhhQks1?=
 =?utf-8?B?OFp5Wm5mOHVjRGJna2VqZ1FWb2JNLzFCbTdzQjg4VWp0TzRJY3RjN2w5M2Vn?=
 =?utf-8?B?U3RYNmZLQzIwTkg1c1lFYVJ2SjVMeVJMczZzNCsvVTcxNkRLOXZEZUZwVWJk?=
 =?utf-8?B?NndCOTY4c1pwYVVvd3Q4NUc2RVRJT2hxT2I5bnlWWHp4eTAzQS9Mek84a2pM?=
 =?utf-8?B?MkpJNnp5ZGpZMWd1dGdJNk9CQzBscmw4QVR4WVZSZjhWSlhWRlB3QkRBTHZJ?=
 =?utf-8?B?cVJLZ3VVWkRjbERxS1JSYjhWTlpYSjJxdFIzZ0s1RUovaTRGZ3FzQVEyUGdy?=
 =?utf-8?B?cjJmeEw3Ui9FanFqVEc0Y3dqUXdTOFJTSmVpN2c4ZjFoU1QrZzBjZnhHdWpt?=
 =?utf-8?B?YWIxU09JSTlKVGNicnhRN0dCZnh5Rmd1RThsU291TGxmZ1JCV1JUQU9teXVx?=
 =?utf-8?B?dldqS2dzQnkwa1RGbEpGcG9QYWhXOHlCNmRnRzV6cVRlUU5Td1pJelpKYnoy?=
 =?utf-8?B?S1FqWUlKRzFVS3RVbG1mbTErTGgwdnpXay9WRlF5RlJRVDI1TE5EQjVER1NO?=
 =?utf-8?B?QTRkMk9nanYwdW1nL0tyNWxzQ3BvaFdyUm52SHA0SE9LL1kzVVVjeGoyZEVl?=
 =?utf-8?B?L1ZxcHNCbnlENXBQS0cvTGdHRC9LdnNPMElvV0R2ckdQZUtMZVlvRzdiWmw3?=
 =?utf-8?B?QTFYOHJuNjMwdUcyOU9ZdzUrWnN2U0psajRhSEJOc0d2emZFemlKdnNjbE84?=
 =?utf-8?B?OSt2MXhaN29DS2VOYjU4bXY1V1VuemNnTTBNK3hZMS92ZENJSGFOa3ZNRXhF?=
 =?utf-8?B?U0tod3BKY3gzU01vVmJSYUxPRm50anlRdlhyUkdwZksrM09XVk9Ga3ZoQ051?=
 =?utf-8?B?VjZld2oydXJlMERqUUs4WFViU0lkRnJJejVDSzlNbXJqaUEvbG1zMTJoeUlF?=
 =?utf-8?B?cndUZENncHk3cGFIWVVwUytaaXk2WjAyR1RXV2ZwZDNRbDRuZWE5RVYrTXNz?=
 =?utf-8?B?TGNWTndPdVo2eEhvNFJiSWZqRWp2eWhpVWRSczFDUUprK3ZTNTg3OWg3Y0lO?=
 =?utf-8?B?MXo2bFAxZkpmaCtNWENYRlZ0MDRhWTc0cVJZZmszaDRuT2F2YzFCR2FzZkF2?=
 =?utf-8?B?TWVycnpSSjg1SzlVY29lbTZ1LzBQWk1hUzlWclhKKzlUV3dzOTJEOHJ1UkV5?=
 =?utf-8?B?eGFCakM1TURYYUJ3QmkyNUR2WlhHN2gxUGFuSDBuNFVMZkluTGJMMVpWdEhq?=
 =?utf-8?B?QlNEay9GNGZVUlprWmJ1aGRsTVB4bkJsU1hWTzZPN09MVThieUxQNk5sWEVK?=
 =?utf-8?B?U0NZMUZ2WTZraGdReTFaTjF3bWp4MWhwZUI2ZmZVZlN3VUdxcHlNZEVZa1ZQ?=
 =?utf-8?B?OFNOeTJiekNEelpvZWZvbFEvTUd5UmI3NUZualhuRnRuWkhmR1UxUkIwTjJr?=
 =?utf-8?B?SEl0NExveU1KOFFrMWcwL0lKSEhpSGdURUxEd3grL3JZemtmOS83bHc5YkJZ?=
 =?utf-8?B?SFIvM3FpYVlZdXViK3pGUzh0RktRZHdhT1RMdksxMUxTb1MzWkNyY3F0RDh3?=
 =?utf-8?B?ZTRmNU1BakhVbjk2SEdFeUZoUENqVmlZVXFVOUtWTEVkQnhMUTdTUnNPMGhO?=
 =?utf-8?B?enRyaHY4T3NERHd3ZGJxSG9OM25NNDZjR0pWWGx0RFZHY3NqYUkxa2dCOFpT?=
 =?utf-8?Q?iEM1rHnPJwu/PTqwBai1XjBE5qwqt/ejsAzXQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR12MB8109.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UEtaRjVQT1hkcVhkZzhzUjVzeG1Fa2I1UTl0Q1F4TjlvVjY0Z1FYd25IcDZZ?=
 =?utf-8?B?ZjlLRkFWSHEwV3drK2hxTDc5STZXYkVFSFRKaUJwdHd4aHpzQi9acHN6eFQ1?=
 =?utf-8?B?K1ZZOHRrNWFuQTF2aU1lbE9jVmpwdEtPZVh0Zyt5NUxZa1JCdnVTQzFiWThH?=
 =?utf-8?B?MXA5N25hWjV3L05sa09pQTJ2T01abUhVWFNuaUR0dll3YWFGQlNGYk0wenNo?=
 =?utf-8?B?S2NMMkpTUkNsS0Y0bU9IczRyR2FaejVaRW0wdlMyRkIxd2FWNHpLV1JUS1VH?=
 =?utf-8?B?enBrckVHdkNvTzZmSHJMZ1hwZmhBU2lmcGtyZVhIWTRRMkNaaWVYdWh6eVdH?=
 =?utf-8?B?SGludkMwYlRQUUdsZXN5VmdBMXczWHJ0OXlHcW9tMDBBTUp2TmxBdU1UdjJL?=
 =?utf-8?B?ZXo0WXdZMVU4R3dQWjFyU0Y0TmtseW9JNFMwcHZyVW01ZEhvWXdic0FwTmJB?=
 =?utf-8?B?eTIvZUFqOWZnQXM4bXpoWTJqQWFnWVZ2bnhtN3paWFA5eGkrT2RUYldwSDFL?=
 =?utf-8?B?d25DV0d4aEJQcGh2RG44ZTI4REhJc2lkTWJhNXlWbGQrRVV2c1VYNVREdk83?=
 =?utf-8?B?NEQwcVJRNThTNFpKNk9CR0EvMDB5K1pudlh1Nys4NFpGMkh0ODROakVpT1Zr?=
 =?utf-8?B?b21kR0FDcUlnL3UvZlV4VXA2dTR5aFBmcjR6dE9GaHJ4c3JDSmRINi80cXlu?=
 =?utf-8?B?dk9aSlJUZWVvWHgrRnZjQjdISVdsRE9JMlNIRXFaMjRKZmcvTE9Cajl0a2p0?=
 =?utf-8?B?Y0taU21xN1VQUzRub0pQL210bzNodGNkVFdiaXYrSjlPRkdCNzZnVTlsN0hU?=
 =?utf-8?B?bWUzdWx4S25HY0lBanErelBuLzZ2MjdzelNFN2U4MnFrNUVwNTVDOUFUbFFt?=
 =?utf-8?B?RCtCU2hCK0JLcTZleUlxbXB5K3hVSUlwS3JUZmx0NSt2Lzd1bUhNdTE5Q0dm?=
 =?utf-8?B?Z3hheFpLK3ZXTm5NOHBOL3JQakFqUjVqQTFnNkpmbmsvMXZKL2gzNUUxWE1a?=
 =?utf-8?B?SlVPdktPbElHTjRaQzVLdjRlTlFMRlA3UEI4bng2NVM0aUlHUDFvQ2pRZnBB?=
 =?utf-8?B?M25DK1VtcmxVYXdOaEhDNWVaT3FNT2FhbldSVlpZdEhucHZsbUJvSmFsdkta?=
 =?utf-8?B?OFAzR1UvSEEwVmhucS9zV3ZZVU5nMHkwMzVDczFTTWRTSHk3eHk1MmJSRk4z?=
 =?utf-8?B?V3hscU9ad0tpdTd6RWRtaFpacFV5SmRFaHJ1TFFEZFN5VTM1VVRiaVZPd0ho?=
 =?utf-8?B?bko2RnV4dWVsSkR5bURLWDdHM2F4ZUZDOEFKQnlpRnVZb3N5Q1FkVzdQWVA3?=
 =?utf-8?B?ekJTSzdZem9tc1Y4a2thbTZTanYrbnh2MytVUTUxZys4WGJSRE42WDlqdnpK?=
 =?utf-8?B?TkcvdjdlUUVHeWwwek5GWENscm15TDZEa3lzY3FIM0hZNWYwUmNvaVJaVHRi?=
 =?utf-8?B?S0x2Qzg2aVE0a0xjOXppbCtDM2w5b1czNW4rbm43VjI3bFAxNGxPdjc4djJv?=
 =?utf-8?B?TCtSdUJyMDFQZlNtV2JyVUtjNjlBMlZ2SGt0VHZqNU9ZMlNNTkk1UWZxWnR5?=
 =?utf-8?B?YUVkSjdtOEg0UmQ4VzNLbDhlWXpVSmsvVktrZS9XUk5IN0ZoN3pRWUVDR01h?=
 =?utf-8?B?VStvcHg4VmhtbmhYRHR0eXdMZFI2UHFsUXQ5UmphazFycXBRZnhMNzdwK0Jz?=
 =?utf-8?B?V0xBS0RBeU5aaGtQTG10YUNBQThGOWZNeUVSMjRYTlZYUWFlYXhzUGtWcU9l?=
 =?utf-8?B?MU52TVhqc2hNZnBZSWV0TmpUUFVwWFdJNkZwQ1JvM0MyeC9jZnQ4aWxxY0pn?=
 =?utf-8?B?aE5zUzhKNENVYStDK3VjTXJsc2NvbE9mWjJ2UWhNWXJWa3VaUnhNS3NyYVlC?=
 =?utf-8?B?Wk1PTm0vTURLTDM2LzBUVUc1SkZOVVMrc28zMm9ueXpXK2ZPejdxeXZuQmJF?=
 =?utf-8?B?VElML1lDTDVEWXNDQU9hUGdFOGRIcEpmQWFMeTBtc1VKdWx3c2NnbGJNSUZ1?=
 =?utf-8?B?QVg4R1BXdklqc2JNcEUzcytrYkxvODN2aDdoa0hXVUFkMXNZdWpZNkxkb1Y5?=
 =?utf-8?B?UWdENWpUQTRkd2dFWnYrelpydmM0Y0IvMHNod2VrbWpIUzBpZTBKRkhRUVhn?=
 =?utf-8?Q?HMJPJGBKVCigvsrkiq7t+9tZW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bf9c49a-bfe8-4fbd-d0ff-08dcf3614a0c
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8109.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 12:50:36.2372 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sfo7EvvNJAHyh663D4vSz+BAObJTjcyMO9uAPb8fgjlr2ywgmgj087kMc0AQ0xf4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8597
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

Hi Tomi,

On 10/23/24 14:00, Tomi Valkeinen wrote:
> Hi Michal,
> 
> On 08/10/2024 11:22, Michal Simek wrote:
>>
>>
>> On 9/10/24 13:19, Tomi Valkeinen wrote:
>>> Add the two DMA channels used for the DisplayPort audio to the
>>> zynqmp_dpsub node.
>>>
>>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>>> ---
>>>   arch/arm64/boot/dts/xilinx/zynqmp.dtsi | 7 +++++--
>>>   1 file changed, 5 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi b/arch/arm64/boot/ dts/ 
>>> xilinx/zynqmp.dtsi
>>> index b1b31dcf6291..673ca8422e6b 100644
>>> --- a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
>>> +++ b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
>>> @@ -1207,11 +1207,14 @@ zynqmp_dpsub: display@fd4a0000 {
>>>                         "dp_vtc_pixel_clk_in";
>>>               power-domains = <&zynqmp_firmware PD_DP>;
>>>               resets = <&zynqmp_reset ZYNQMP_RESET_DP>;
>>> -            dma-names = "vid0", "vid1", "vid2", "gfx0";
>>> +            dma-names = "vid0", "vid1", "vid2", "gfx0",
>>> +                    "aud0", "aud1";
>>>               dmas = <&zynqmp_dpdma ZYNQMP_DPDMA_VIDEO0>,
>>>                      <&zynqmp_dpdma ZYNQMP_DPDMA_VIDEO1>,
>>>                      <&zynqmp_dpdma ZYNQMP_DPDMA_VIDEO2>,
>>> -                   <&zynqmp_dpdma ZYNQMP_DPDMA_GRAPHICS>;
>>> +                   <&zynqmp_dpdma ZYNQMP_DPDMA_GRAPHICS>,
>>> +                   <&zynqmp_dpdma ZYNQMP_DPDMA_AUDIO0>,
>>> +                   <&zynqmp_dpdma ZYNQMP_DPDMA_AUDIO1>;
>>>               ports {
>>>                   #address-cells = <1>;
>>>
>>
>> Acked-by: Michal Simek <michal.simek@amd.com>
>>
>> If you want me to take this patch via my tree please let me know.
> 
> Thanks. I've sent a v4, but no changes to this patch.
> 
> I'm not sure what is the custom with xilinx dts changes. With the other 
> platforms dts changes have always gone through a single tree, not via driver trees.
> 
> I don't have a preference either way, so if there's no clear rule here, I can 
> take this one with the other patches.

I have seen it both ways. If this is done with patches it is easier because I 
can't really send it before dt binding patch reaches upstream. It means there is 
going to be delay.
Normally it should be enough that I gave you my tag that you can also change the 
DT files too.

Thanks,
Michal

