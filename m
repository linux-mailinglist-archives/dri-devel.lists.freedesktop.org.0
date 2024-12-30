Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37EE49FE32C
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2024 08:18:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B45F410E0D3;
	Mon, 30 Dec 2024 07:18:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="dMdzxkeI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11011000.outbound.protection.outlook.com [52.101.65.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1361A10E0D3
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 07:18:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ojc08q6K0lShNZASRCgFYTMSHAxLtQ98rymeTQl+6hKUQVwvN5KMhN9FtLSNlAFoqogTEHgXkWAkt9w5VKw0uijCi3vjlk1D/d/1wI2Zb+XxvMeuJUE2z9t5n0EixEo3pO4dOzHxNgvIYhVaF5twYA2gfxmQ3Tu4EkwZYCbl/CZh9zx48WExtAZUrdG0yW1Kog0R33dwitiAJwmkd3JwH+11hDUf//nnLwyZq2ko3ENbbkHJcfo2cLZOhJFn1NmlThEfEo3OsNLxLLRlSzBp9K+V6KAI4QNk82eZNKgiHutwbDc04KjNApycE85+3YTkkgDmrUtvr3+MYMqPgmb1ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Y2GsyRiprrihvZwmrEFo5ZxYPLzOQhShxg1Pe8YDzk=;
 b=pzMXdWEyE21AafQ1NbV7ms5HreZrzmwLfP46czF/q6XhGV1w/6MQeA4XMeMrCQB+dU211+GbbPCW2AfXt03Kpkbb/9UzFg7P5+OliKIcGfAM5E60QsN+o3I2C0QxQ6gsYXNen1Z2klScSB/kb9Y9z+u9NbMoXLbgU9l2Lwe4VSVvXh7kjFCO9CuBnsvQZgJWkxh6GT5wQq5mDg9Dv/7/NyT6fbZWvIM2ttUAI+4bZFsgYgPzaA1E4nK4pJhlFBqBOZfd0+43uEl4fEPa8F0v3KJYqDA7aHpDXN1p5KbIxWwFTig7YM7z5K+Vwgf5jDgrsP8T2RGbzWeqm/MSGIUxSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Y2GsyRiprrihvZwmrEFo5ZxYPLzOQhShxg1Pe8YDzk=;
 b=dMdzxkeIjia30GXHuYpa2fyOF0+pfTGwEyoZUhuzV82vvt9Rvk6DFI9azuynFL+iLfuu4fF/gF+QU3hB5AxjmDmK0gH6hEa3pfU3HzH97X5aMmh0YBsg5XSyK1if03OdpSPjg5Yc6NRMW9KKbh63rTipSelkqAM2F+elzWa1kmnK/oqDmSJRJpThP+EQ9KbqnLnsg4E6zcj1aIZYTcZoLUJ5mixiJImKmporQZpJgdYi+6P5Kma60Hf/rmIh+bgrldb+ZAV9UQbmocy1/hS2IagFPJJuGRfBgavZPulGkQ0ucQ8SygLvvNPXvdFPdTpdWifd1q2daQuoVRkglMVjDQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by GV1PR04MB10480.eurprd04.prod.outlook.com (2603:10a6:150:1c8::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.19; Mon, 30 Dec
 2024 07:18:13 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8293.000; Mon, 30 Dec 2024
 07:18:13 +0000
Message-ID: <a543e24a-1333-42ef-b940-fec01353db5b@nxp.com>
Date: Mon, 30 Dec 2024 15:18:59 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] drm/lcdif: add DRM_BRIDGE_ATTACH_NO_CONNECTOR flag
 to drm_bridge_attach
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Robert Foss <rfoss@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Stefan Agner <stefan@agner.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20241224014701.253490-1-marex@denx.de>
 <20241224014701.253490-2-marex@denx.de>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20241224014701.253490-2-marex@denx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR04CA0001.apcprd04.prod.outlook.com
 (2603:1096:4:197::12) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|GV1PR04MB10480:EE_
X-MS-Office365-Filtering-Correlation-Id: fcea4320-ffd7-46d4-19c5-08dd28a21f90
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VDZBbkRyS0ZiQ0NzRVZDeHcwaXBVcDVRR0dtQjN1WnZSUXpITnFEaFI0WGtn?=
 =?utf-8?B?MENyMlYrS1JQQXg0d2l5dVpzMW16NjErUXhvdHZZVEt2aVRrYUtrN2VqVWNI?=
 =?utf-8?B?QkdwVURmTkUxdWVKdm9sOFFJenVLYkl3U2txK3dxbzhKbVBnMFMzK3VUMnhH?=
 =?utf-8?B?WUhzbnloaERlMnZ2ejE2SXlGYzQxbUJKeFJWOUsyNjZHNjBUQ2c4ZjVRekJF?=
 =?utf-8?B?RjAxbjhiRlR2MWpKNXQ1QjZOR1Azc1pocHRkRWtmbVdSSTFaNk54N3BpOGhv?=
 =?utf-8?B?cW9TUG9aRGtqbGlyRWlsZTlSd0JSTnpvMzJZb3ZsampUWXJGVUR3VVM1K3Bh?=
 =?utf-8?B?ZUVSWlh1OFY0dlMyMlVVZXYyNXBiQ3FleW9ubDQxcmxKeXZoM1JmTHAwL3hl?=
 =?utf-8?B?UVNBM29xUXRYVTU2RlZCc0NuVVJKNGlTRjhCVi9wUnB3RnNCQmRUbmFHUGRh?=
 =?utf-8?B?S0RsOFVNUXFwSlNobDhPemJYR2R6RW5ISm0vazNjQVZUS0VNdENib0JQLzUr?=
 =?utf-8?B?L1lINkFRaFUvMEgzdUhnckpTNlRCSUM4TndZdWRkWGdoTTlQbHYyazFzZ2Nz?=
 =?utf-8?B?eUllVlN4U0lqNlcvbXhLS0JwZUZpVEZRMDFUNEVnNldLNW1PVHVyczNXSVJR?=
 =?utf-8?B?eWUvRzAwdEdvK3RQYUl2aEtlenFPRDJiU1M2VUVoczF0M0NzcHJlNjE0UWdB?=
 =?utf-8?B?ZHBoYkJPWlBKdHJYZHdJY1JnRm5WdnhlV3dyYWt4SXhURzdPMjVVcDllUStL?=
 =?utf-8?B?WjBqbnJIRit6M2l0S09qY3NNWmhrVEdBcWFOQ2pJWm9mWmV4R2FCVmthVXg5?=
 =?utf-8?B?ekhQWjNHQkVtNG82T0t4Qm1DdUp5TW5CWGNxSEp1Z1lYVUgyVVZZRXJaSSts?=
 =?utf-8?B?b3lzQ2svRHVjZEVSZXVpMUFUOEVBRkJockFscHBIN0N1WnIzdzN3Z0Y5eVAr?=
 =?utf-8?B?OE00NDk4L2ZGb05BNkFFS3ppSW9LY1RXOUdxaWFZaUp1QXdMY1crVzVPaVNB?=
 =?utf-8?B?amYzNm9tajdmejJEdUxaSjNvM3F4T1JvUldLWWl4WlFTUG9EcG1XMCtqNndt?=
 =?utf-8?B?NXkxK0ltNmlLeDFNMHNsMXBMbjNhaHNqejcxV1k2TUZmUXVpQjJYbGFsRkEx?=
 =?utf-8?B?dHFBV25vcG96azl5RFJVRXNuaCs4TnFUa0JKV2JVRG9haS8vMWtqbmYwdlFL?=
 =?utf-8?B?Qkx2ZTQrZVp3N05mSFZCTVZVOWRBMmNiM0JOK1dCWnpNeUJLOVQ4UDRNRmZX?=
 =?utf-8?B?dXNpVm5Ubzl4VXVxNlBZeEswdG9UbFkySEhaWnY1SnV1dmZzUnVCNjk1MkVS?=
 =?utf-8?B?S3c2aTVML2RHWDJBYjJNWlpjYkNlUkN6cTRndlVvYW9BTlBtYmMxL2dUNitD?=
 =?utf-8?B?ekVHdmxuV2RuYnN3dGx2SEF0Q2RHZStMdnFiVmlzdGhkdTJIR1gyRk1jWEw5?=
 =?utf-8?B?OUxwaWJGejErL2NiQ1JBeGl5Zm5scTZKeExVcEdNZ0l6SlV3QTZ5KzV2d0Js?=
 =?utf-8?B?Mzh5aXZTS2pnNEVyV3kxbjZwMm1ENDNEOTlmMmxVSnRFVFlyaGpoMXRmSkR6?=
 =?utf-8?B?L3p2ZnYrVzlmeW44bzQyZFBRVmNhTXJNTnBvUEp1NEdvRlF1dFZDRUNwaDFO?=
 =?utf-8?B?VEwrMFIvZkhIaTBzV1JzUFA4dng2SUVqUmFRYnhCQU53aVp6S3pFc004WTlz?=
 =?utf-8?B?bEVQcEgxRkRjSytpZVpVdmQrRGMzRW9WWTBaRk44VDZuemxCNnpCU0sxVGR3?=
 =?utf-8?B?bllpTGt1d3RTK0tKYlk3UTlKOWJFN2tndDdQbWU2ckp5RU40RkhVZkhIai82?=
 =?utf-8?B?T2F2anZmTmtoOG1ReDhIcktRNlJuTFRuZ2czWHgvR3hEYW9RcFlRRXJvYnpP?=
 =?utf-8?Q?N/v3wSJoeMnOc?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VExOakZXMUNGMDNuWk40NjE3QlZZTzlpSFZrM2ZOenN3V3pTSlNCd2N1VlM3?=
 =?utf-8?B?MmxBcGtWdnhXTitJTTJZRHl4dnpaa01JU0RyT2drbVYwcFhBNGpObUFqekRv?=
 =?utf-8?B?REtBYmlrL2NMeFpEYXN3c3VOMmdKRjdQM1c1akJiR0syRlNuNTIzVWwvcnBi?=
 =?utf-8?B?NnpyOUpyM2crUW9maDl5ejR0RnZybERWckd0V2JYU0NWd1FUL2NvdnA3Tnh1?=
 =?utf-8?B?MDZzS1JVdjhHdGhQRXVURWUyUnBRTndWbGFvOFlwZTFXRDVuaXJEUnRMTGtn?=
 =?utf-8?B?QVpXenQyckFjQUExWEtQdkF0dG11aldOTExTZmhRYU5yanBLSnRtbU9VRlBZ?=
 =?utf-8?B?eXhQaUV6NUxLRHVvWndIcmh2UkV6NVRYZHdUOWYybWoyL2FtZHZLc3YvckR6?=
 =?utf-8?B?MFlMZU1tOEovaTQzRzZVUUdCeEU1RFFRMzRiT1RhbkJkVTZjbXNsemVDVmxh?=
 =?utf-8?B?RGM2bXZ1MlpjOG9uaDhMNkgydnVtR1FtRFp4Vnp1Z05tdHJWa0xrSW9aUm1E?=
 =?utf-8?B?WXFPSFdFb3VOWkthWUZuSkhPMTlhOURtVEI2SDQ0V3RqVklXZG9hYnd5ZldK?=
 =?utf-8?B?c1NwUWgzTmtpb25YeW4rNUZoNEFKT00yUC9JaUFtOStMVVMwc2l0bW5NZHNM?=
 =?utf-8?B?N3VHSDlmdHRLMUFyN3NERzF6YkUwZlIveTZBbmJhZHFITXJaL2xTa2FOdkYz?=
 =?utf-8?B?OVpOWElzMDlhcjQzT1dqM2YwMFgvNzZkeFNiNzZvM3ZQLzRzVVJVbms1amQ5?=
 =?utf-8?B?V0lhWldLUWNYN1Z6ZlN3MXhlRjF4YllPYm9SQkxLdVhtR3RuTjk0enU2Q3dM?=
 =?utf-8?B?eGs2SUdXclZxNVBVYkdyRktseVRRN090U1Y2YWkreEMyUzB1d2FIdjhNeWdM?=
 =?utf-8?B?TkE5NTZsV3Zxd0ZERDZmZ2tuYzY2ZFZJNzdkL1FJS2FjQTRJZ0s0NEVlTFpJ?=
 =?utf-8?B?RWVQbDNuV0g5ZUpGbjIyOWtiYWNzTzlVMXF0TXRCdjRLaEdEQ3Q2K1dubG9W?=
 =?utf-8?B?YWMwQXFpdTU3UFNJWmZ4ZWk2VnNjeTltK0RnNzlrNEIyMGhGQjNJMGNHREIr?=
 =?utf-8?B?aldIc0VwTWNldCtjbDJCNHhZWGpCK1phM0VrTVdZVElyT0pwZjV4dFIzWFNk?=
 =?utf-8?B?KzQ2NFgvK3piblhBTGVUL1RCQlB0K0hyS3c0RjdmdnFTd3dESFVmMk5saUE3?=
 =?utf-8?B?eldFUG9kWU0yZWplMWoyT1JyZDNzc0l0bC9MRVVNd2NDeUJ0QTFYWXh3ZWpV?=
 =?utf-8?B?ZENBUktDYytqWUhTbTdjOHArbHZCRjM5dW1xemw5QjNpYzZvbU5Yb2krckVn?=
 =?utf-8?B?Y2U5WGJxU21XQSsrbUc1OFh3K1VoYUV3cEcycXo4TGo0VFlMaXg0aXZDejdQ?=
 =?utf-8?B?QVdsNEpOTkVJdjErRFF0MmZtV0pMdUIzdVBRVnZ5VlBjYjlsalNZV3p5Kzdx?=
 =?utf-8?B?bnVIUTlmSjFBUnVFSVZEM0ZzbUVyZ09pZU1BSUZURGM0Q0ttME5GbzkrUnRD?=
 =?utf-8?B?dkgyYVo1UjdIc3VGWCtZR2YzYXdLMXhsZXQ5SWhYb0xSRWljekVianhOWTlB?=
 =?utf-8?B?T05WWlpoZVhFbDlHenYyUUNlWjFoYTAwQUliK3hIUDBnMENIdDdPdTZjN0JI?=
 =?utf-8?B?ajVuUi9JL1FLWGpUMDJadmdMNTloVUtTUTQxL2tYY01MTW5PT1k2OXEzMkpZ?=
 =?utf-8?B?c0ExRjhrTXhUbUJCWGIzbmw3UjUyTFdLSDJuYTFrVXI1R0xBZlFqZlBxNUdm?=
 =?utf-8?B?SFdxdXk5bGcyYUd2dU1SMkZja2ZQTkVWVXF1TzdlY2o4cFJObkRjT3NVb2xs?=
 =?utf-8?B?RWhwSUY3OGJjZWtCMUdNZ2k4QWMxY01pdVJZVWRWbXgzOUtaQm1HYjJYVld1?=
 =?utf-8?B?MDZwekl2MTlEZ2c4UEFST1doclZKSHBYcDU2dlI0bTZ6TEd5TEZIcTVXVHJJ?=
 =?utf-8?B?Q1E4UTNMdktiRmZiZERyckhEWWFWU0twbjJFQ1QrOC9weXhWd0xSamwvbXhU?=
 =?utf-8?B?bzVoWTYyVHRmaWxsZDFhOFJZTEJEVERBNUtibkQyVVpSTmsrWjVxTGxISXIr?=
 =?utf-8?B?RDVCZVFoWlg0R0VjS3Fxcyt6SEVoSzd2VHUxQS9tYXd4bEgySEV4UFZ0bmd6?=
 =?utf-8?Q?0wZmiCNsnn4bpoMnOiBKC1Gr8?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcea4320-ffd7-46d4-19c5-08dd28a21f90
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2024 07:18:13.6803 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4hXxUyZuclWcf3Dv8xMZgUbbtddVhboRsBsQ8RoQgBwamN7Jq/xsuIBw+dl0MIV3uzzlHnWf4TTfX9iyBq/ycA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10480
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

On 12/24/2024, Marek Vasut wrote:
> Commit a25b988ff83f ("drm/bridge: Extend bridge API to disable connector creation")
> added DRM_BRIDGE_ATTACH_NO_CONNECTOR bridge flag and all bridges handle
> this flag in some way since then.
> Newly added bridge drivers must no longer contain the connector creation and
> will fail probing if this flag isn't set.
> 
> In order to be able to connect to those newly added bridges as well,
> make use of drm_bridge_connector API and have the connector initialized
> by the display controller.
> 
> Based on 2e87bf389e13 ("drm/rockchip: add DRM_BRIDGE_ATTACH_NO_CONNECTOR flag to drm_bridge_attach")
> 
> This makes LT9611 work with i.MX8M Plus.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Liu Ying <victor.liu@nxp.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Stefan Agner <stefan@agner.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: dri-devel@lists.freedesktop.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> ---
> V2: Add RB from Dmitry
> ---
>  drivers/gpu/drm/mxsfb/Kconfig     |  1 +
>  drivers/gpu/drm/mxsfb/lcdif_drv.c | 23 ++++++++++++++++++++++-
>  2 files changed, 23 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mxsfb/Kconfig b/drivers/gpu/drm/mxsfb/Kconfig
> index 264e74f455547..07fb6901996ae 100644
> --- a/drivers/gpu/drm/mxsfb/Kconfig
> +++ b/drivers/gpu/drm/mxsfb/Kconfig
> @@ -30,6 +30,7 @@ config DRM_IMX_LCDIF
>  	select DRM_CLIENT_SELECTION
>  	select DRM_MXS
>  	select DRM_KMS_HELPER
> +	select DRM_BRIDGE_CONNECTOR

Select DRM_DISPLAY_HELPER.

>  	select DRM_GEM_DMA_HELPER
>  	select DRM_PANEL
>  	select DRM_PANEL_BRIDGE
> diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c b/drivers/gpu/drm/mxsfb/lcdif_drv.c
> index 8ee00f59ca821..40dfbc3e6118e 100644
> --- a/drivers/gpu/drm/mxsfb/lcdif_drv.c
> +++ b/drivers/gpu/drm/mxsfb/lcdif_drv.c
> @@ -17,6 +17,7 @@
>  #include <drm/clients/drm_client_setup.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_bridge.h>
> +#include <drm/drm_bridge_connector.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_encoder.h>
>  #include <drm/drm_fbdev_dma.h>
> @@ -48,6 +49,8 @@ static const struct drm_encoder_funcs lcdif_encoder_funcs = {
>  static int lcdif_attach_bridge(struct lcdif_drm_private *lcdif)
>  {
>  	struct device *dev = lcdif->drm->dev;
> +	struct drm_device *drm = lcdif->drm;
> +	struct drm_connector *connector;
>  	struct device_node *ep;
>  	struct drm_bridge *bridge;
>  	int ret;
> @@ -97,13 +100,31 @@ static int lcdif_attach_bridge(struct lcdif_drm_private *lcdif)
>  			return ret;
>  		}
>  
> -		ret = drm_bridge_attach(encoder, bridge, NULL, 0);
> +		ret = drm_bridge_attach(encoder, bridge, NULL,
> +					DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>  		if (ret) {
>  			of_node_put(ep);
>  			return dev_err_probe(dev, ret,
>  					     "Failed to attach bridge for endpoint%u\n",
>  					     of_ep.id);
>  		}
> +
> +		connector = drm_bridge_connector_init(drm, encoder);
> +		if (IS_ERR(connector)) {

of_node_put(ep);

> +			ret = PTR_ERR(connector);
> +			dev_err_probe(drm->dev, ret,
> +				      "Failed to initialize bridge connector: %pe\n",
> +				      connector);

return dev_err_probe(dev, PTR_ERR(connector),
"Failed to initialize bridge connector: %pe\n", connector);

> +			return ret;
> +		}
> +
> +		ret = drm_connector_attach_encoder(connector, encoder);
> +		if (ret < 0) {

of_node_put(ep);

> +			dev_err_probe(drm->dev, ret,
> +				      "Failed to attach encoder.\n");

It looks like no one else calls dev_err_probe() when
drm_connector_attach_encoder() fails, plus drm_connector_attach_encoder()
doesn't return -EPROBE_DEFER at all.

> +			drm_connector_cleanup(connector);
> +			return ret;
> +		}
>  	}
>  
>  	return 0;

-- 
Regards,
Liu Ying
