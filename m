Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E7C999C7E
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 08:18:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BEAA10E142;
	Fri, 11 Oct 2024 06:18:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="f7Ss+ks/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2040.outbound.protection.outlook.com [40.107.21.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15DFE10E142
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 06:18:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=baF+TirXiJhhJE9gR7v4edwwJvAbaYLemppXPlh6zZGSqyXK7AQNpJDQYFppJ7lLDPwTyx9SWa7RQK0yY6i7sWnkhbcgr60I90onwdG2w52+vX/xVKTkKoP9AZe3avxCd5qwSJSG96yL/OyPsJiHtfqwNT99tbU/EWtvLTlwwHYrrKKrOLpytfS9+d2gJG0x4T6Yl1o0f1v2fH2Cezb1sZ/38JnGVxE+/8Hk9waExyisI1y7CBhfRx5+Kdc1TN/w7lKUjkrV3avzSA8GCmpWtV+8Jdm9pwkY/f3KR3o0rvuthzar8+LBEMgtzWj7644X/BdAO55Y8NQTqD0qz1rp4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q5Xa7pVl4mYsLMQjWrd2/xdQ5/mWgAPO4b0I0FxcbSE=;
 b=JLf12+dF0xnD08LIrJG4oZkVM48yRrNVwjF173ooIJwBY8j9yL0QqVwxvnhPXd9gSY4ke6WbbQ9ELVV6XxuRaeZH33X5O5UdTUoIVpsSLBC1UEm10BJnT5vPSLqovOTfeTKrobpSaZTOIQAitw6wfxiB16n4ZKWKp2vN8/Yy7UyiAerYEPFtkdVB9/JWfAZ+rwjb8nDyepLWv23TIW1DF67agyIuVXl0h3c6o+cs6pEsKbwuMNZO11i8GSOCht6Whw39hf38Xvj8T1pIvW+zEKCLAVBpuCUjsIEzC3YtUxCtW46IaIWFEkQIHZkq1SxzMBW7UtE19JQCn1B5aH3PrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q5Xa7pVl4mYsLMQjWrd2/xdQ5/mWgAPO4b0I0FxcbSE=;
 b=f7Ss+ks/ymTZfsJ0WM3iXxrGHW5JRKTSt9/zOWGaegIlxi/xx0NHn9KsopL4jHW2el7M19eE3R5KeDGilmbmPBx7NuCteUA5sr9s5xxrAOF8g2ObKJ6dUVo7G2nMTLX5VRpREn/ARnLvt7zbx1//QZBJ6pFGcZJPATaljRpwfpOBGZL5x5+mozYcSiz0En/JUu3WpxyGJV1yITgPtAmVyxlj3iLIdQ7mT2FI+OCJ/C28D3F9F+uO73JWTDcwAnsM6y1gz1R4wZVb79dAgEmeXdv1txQIORMAFD4lXSHoe9Dl8TFM2cjXnCkp42PvLaMD4jOWKn6r6dikJHtVNpHzvg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by GV1PR04MB9198.eurprd04.prod.outlook.com (2603:10a6:150:29::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Fri, 11 Oct
 2024 06:18:24 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8048.017; Fri, 11 Oct 2024
 06:18:24 +0000
Message-ID: <819380c3-d13f-4989-b305-388fc60d30e4@nxp.com>
Date: Fri, 11 Oct 2024 14:18:49 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: imx: clk-imx8mp: Allow LDB serializer clock
 reconfigure parent rate
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
Cc: Abel Vesa <abelvesa@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Isaac Scott <isaac.scott@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Robert Foss <rfoss@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Stephen Boyd <sboyd@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 imx@lists.linux.dev, kernel@dh-electronics.com,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
References: <20241008223846.337162-1-marex@denx.de>
 <dbede671-c97b-4ad7-8a54-f1b381fea082@nxp.com>
 <00ffd38c-b01a-40cd-9130-19c35a387ca0@denx.de>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <00ffd38c-b01a-40cd-9130-19c35a387ca0@denx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0021.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::14) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|GV1PR04MB9198:EE_
X-MS-Office365-Filtering-Correlation-Id: 081c5afb-bdeb-411a-8acc-08dce9bc8309
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NjVpKzFxZmthMkFJenZSSkZ6OXU3cnUxZS83ZUJHTnFGaHM5dnlqL3MreW82?=
 =?utf-8?B?OWVEanhWQ1BLYlBhalVCOGQvQU1aZDJJdDNvTDdKdjdBWlB4SWlKYnhpcHRG?=
 =?utf-8?B?NE4rcHhESG5lVVMrRGU5OEt1MDEwUXFQUVlnRHg0ektrejQyaEYwQm9DMnM5?=
 =?utf-8?B?RmNVZkppLyt6a0FuY3BjSnVIRGhDQWZ6R2tKVlRvUHJid2FPRm1haHl2Qk80?=
 =?utf-8?B?aUxlTnpUQ3hxWktUYzVnOUt1bXBHcmtnMVdYV3lWNUZWbEt5cUcvUngrRTRa?=
 =?utf-8?B?TnJqclhTTkhERnJXZ1k2d3lqWUlISHpnL2J2OVZJM2xkdzcwak1rSnVxR1RJ?=
 =?utf-8?B?cGZyUzg2RmVZSFlhb2lEWG0rUEk2OUU2d3FUdFh1akZFVUszYW4xeWpDayti?=
 =?utf-8?B?bGpMMFo3ckhYZ1JIQUtOL2tVa3RUaWllR1htSTMwQnhPWW53bTM0d3o5VklL?=
 =?utf-8?B?c1E3dmNXVHRWN1VjN1kyWXF2ZHhyc0J2cEQ0RGJpSGhKRVVkcGNBc1lwUlhy?=
 =?utf-8?B?YmQ1MVdoaGpTY3pOcnYzbUpmTkZHaUc2T0Nhb3RYcVc2NmRqSzBIdzh6Nks3?=
 =?utf-8?B?RVkydVhnUGd5dGhuZktmOFNEd2YxVEViYlQvejg1MEdUdmpib0JvZzllUk05?=
 =?utf-8?B?Z3RUZlhlTW9lUStDMGErQTVQeDlGeHpkRGJHQjZBTXNNbkVER0hrSXp2WWdh?=
 =?utf-8?B?WkYrUk5YR2NBT0ZETmd0S1NNd1NnKzdIVy83ZDlrTUxyN2J0bFZvUXRwQmMv?=
 =?utf-8?B?REc5TjBpOHA4RUFjLzYvdDJabHhrRDBpUFlIUkxCM25XWERmd3hmV0w0dkw3?=
 =?utf-8?B?Zm04S0R5WllBei9EMmk5dTJrYnNQUUFadTVDRk8wZndNNjZzZEx0dDZmQUln?=
 =?utf-8?B?aUg3bmJNeG5JbXB5Y0JVNVJvU1NYWUZmcVg1emxXQzY3c1plS2x6d2hrMTd4?=
 =?utf-8?B?b2ZEQTRNT1BZNmxBTzBxdUtlY2s1cFRZekhPN0FMQXF5U25HQVFaZy81SDdN?=
 =?utf-8?B?L3hzVHJCM1VtOE5lL05YMyt1RHc5dXlrZUVENTNxVkxSV3Z4S1JOVmFIZVhZ?=
 =?utf-8?B?NFY0ZkY3RTRLSVQ5SHRUOVR0bERtbjBtbTRNVVlWWTE0L2VxRzhSOFRNTmd2?=
 =?utf-8?B?WnE3QU9lUitCdHFsM0JydklyMUV4VGM3Q3FkWmx4ZTlqcDlxY1RaRjVSNzd4?=
 =?utf-8?B?WVVvUmM2MTRheVRUZjZnVjdKUE1pbiszZVRxNXYxZjlGQk5SaG1meVl2QWZh?=
 =?utf-8?B?ZzhvVGVJVUlMOVJMTEk3RDAza1QwWG9mUEQ4djBxZG5hUitjVHVTVktxSWxl?=
 =?utf-8?B?U2JMbmorQXVIQmtEWWs1eGh6Vk9PM3NidVdTTU9KYW5aZ2xPTzBhRFVGVVFH?=
 =?utf-8?B?SFhkc29GZURiYzNSYWZVdGJ1ckVrMndIQzhpT1lHSURYalZsQVBubmthL2tR?=
 =?utf-8?B?VjhVd2JRSmRrOVN0OTc1NzJIUnBISzZBeDZCSUc2WFJMNllMOUNSM3JJUTE0?=
 =?utf-8?B?MUtwczBweERublFsby9nM2hzMGJBdW1GVnNMVmNGQXZ2VFJYbkhYdlBDUzVu?=
 =?utf-8?B?OTg5ajUxTWlnTjM1WTE2UDNqMWJ5czF3SDcveHpaZ0pjNnlVS3QwbVJvL2Qx?=
 =?utf-8?B?VCs5cGFiVHN6Mkk5SVQxN1crZXNsL3lmdXhWUCtKZDVhNkFMSGU0Vm1GU25T?=
 =?utf-8?B?V1FkcXQ0QmREZE9vekpHMWFnY3U5Y3RNeFZabEw0WCtQdU1CejZ0NHVnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGFUVTRUMldQVEhDeGNXQmtsbCsxZjdOR2I1WGVJWlhGRW9TSERhRUI1UGY2?=
 =?utf-8?B?K0tzWmp6R0tuRHFFRzM4RFFNM2ZDUGJXSkxlWG9aSEVNTzZrdll4SDUvYUsx?=
 =?utf-8?B?RnJwZ0hFQWFzWE5ucTBrSzdqaGkxbExvdHlsVUNOa3J4WUx0emRQZEtLV2xX?=
 =?utf-8?B?RDhhNHVjdHE1cE5FZXRjSFFHK2lMRXRtY2FGcEQrTkFuR2dMY3dGbzV1Y2pX?=
 =?utf-8?B?VG5Uc2xZZUo4ZXliM0xPTC84QTBQSHpiN2dwTGRpYml2ZXhLeFJqQ3c2YjN0?=
 =?utf-8?B?MFhBYlM0aDI2cCtQWC9lY0ptdGFFaCttbWxhZmdHMUdLQmZlTHpwSmoxVkw1?=
 =?utf-8?B?WTl0RDJwc1NVNkZoYlk0TWEvdkVqMlF6OE1QWks5L1VSWjdWKzlqWHdXUGRL?=
 =?utf-8?B?bitCc2d0dW9QNGFIZnBDTDdoTDZhVHVEdDlvQUVLZ1NLNnhHYzdFWllYOS9S?=
 =?utf-8?B?YW1hN1AxL09WSGVtMENWSXhIUFJVTWRab2RFVEV3L0lYajdIZ05OdFV6US94?=
 =?utf-8?B?aC9ubUNOWUZJUVkxK1FDUGlscnE1ODVaS1ZFcWo5dUhrQVZyMDZySnR0ZlM3?=
 =?utf-8?B?VU5wdjc4LzZ5WjlKV3EydElnOUtERFE3bUZlKzhTTzljckxHczRCcm84Z0dS?=
 =?utf-8?B?dzRBNC9MMEIyODhHSFFoZlBsRStkZ2JsVlJVKzc5NENvZU5EV3FWR2kvVUZ1?=
 =?utf-8?B?N3VNMU04VkFZT2NkU1dicDI3dUVqSjA0Sm5ITDMxSXMzRjJSaGpHVWUrT2dM?=
 =?utf-8?B?NWZhelE1ZVZ4ckNsclczaWxwQXloM1FGQW9pN21UTjAwZkZKdGRubDRJUmJD?=
 =?utf-8?B?cmR0MzdVWE5MRlphUDNma3BaYVhacjVrOFRObmhmeHF3cU9TN09mZExURGhE?=
 =?utf-8?B?N2VCZUZKTytWbDFJNDhTOEk3SWl4TEkvc0FrNGtOWWEwV1doU3Q0dzVnYkU5?=
 =?utf-8?B?Yk5iWnVobE1hQnQxVFAxVVBxL0Q5ZUZEU2VSSlk4M3djNnM4WXovdVZSM1dU?=
 =?utf-8?B?UlhPZ0l2NmY2VHFSWlRUK0xLYjlOck5sTThTWUVzazVTdG9paVNUOUNiVUtN?=
 =?utf-8?B?SXZ4MTRCYVBCcDNBVTNENzdocDdlYTA0c25kZFpqU1JWV0VvL0FJN0E3QVZ3?=
 =?utf-8?B?cVV1c3NIOHZrUWNHaU5HM3FqLytRaVhiMFhISjJTS29KaUZsd0lrR2RQb1dl?=
 =?utf-8?B?azhKVGZUVzVXS0lJekQ0d2VIaHU2Y0JLV1JETjNwNlJFOVcvR2Z3c0RMdTlX?=
 =?utf-8?B?TjVDWjlMWEpLV2x1Ny9SSEdOYUpYTmxYODJCL1JpNEdkQ0owVkpSbTBETHJF?=
 =?utf-8?B?bmZhK1Q4VHNEWHlSZWNybldld2FMK0VsU0NDVnpMVlh2QSt3ZjhIdk1KenB3?=
 =?utf-8?B?OTZqZFdvRGRUcWIzVE4wMlBwajNib3Z4bWFpNHl0dHdLZjNmL3VVZ3lHOE11?=
 =?utf-8?B?cnkxUEV3VTFueXgvTzErZjdOQ3NpZ1hCdU9zSEVpdElsbS9lcFFKYitjMWJa?=
 =?utf-8?B?RkFhdjd1Z1REd3cyTGNxS1U4T1RvR2VVZmp5cjBnbXkyRWU4MUt2NlhqUDM4?=
 =?utf-8?B?ekNhekhxTHpURDNUVU54NXlhZWpnczZCYjF6emtNQkxpcE5wOEt5d2pUNWJX?=
 =?utf-8?B?Y2E0YUhpWnR2clNRaW9VWnFkbGVwTXhuN0lPQ1ZkUDBBcDNtWHVKMlpkYXdt?=
 =?utf-8?B?NUlCay9lcTdiajdqOC9jZHpTTGdjWWhzOHE4ZWFmeGZiSHlzZXNSd1RacHNS?=
 =?utf-8?B?OGpuR2daZ1RtdzJ2QWFTRE9PaFdNeTNhRjU1T0g4bUVaRGljVnhoRjMvNDNi?=
 =?utf-8?B?SDdqRkVoc2Z6UjdWREw2emh0S3FlVzhnRGp2NDhvSHdQQjZqc2xicDVrMzZi?=
 =?utf-8?B?Umc3M3RwaW9UenB0bHBBMHo3aUNSalVIN3NrdEZqa21ZSThzVGJIVmhKODJS?=
 =?utf-8?B?YzVva01XdUlDUFAvWDA5VDIrNC92M0tWbExiVlJIaUVNZU5ZMTY0dTc2NTN3?=
 =?utf-8?B?V0IrbWJsV0VvWm5Zb2p1bWZWTHFlcDI2bmdFanNPN0hpRDA1a2dremJrUFFE?=
 =?utf-8?B?bVFpT2dLVnVyQjBrWFFMRlBHZTYxd1gxOFJTTUl3dSs4RFRKOEJHcWtwU3lB?=
 =?utf-8?Q?HhAGCBvMMnALeJcjCCHIulC05?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 081c5afb-bdeb-411a-8acc-08dce9bc8309
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2024 06:18:24.2688 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S7yTXFglk1DEeG/jBUvovOiyoPs3So7bcbRYBJb8QFsiJyvwwblxjiNI8IsKe38i94Vi0YPhZW6RCpy698m7GQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9198
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

On 10/11/2024, Marek Vasut wrote:
> On 10/10/24 7:22 AM, Liu Ying wrote:
>> On 10/09/2024, Marek Vasut wrote:
>>> The media_ldb_root_clk supply LDB serializer. These clock are usually
>>> shared with the LCDIFv3 pixel clock and supplied by the Video PLL on
>>> i.MX8MP, but the LDB clock run at either x7 or x14 rate of the LCDIFv3
>>> pixel clock. Allow the LDB to reconfigure Video PLL as needed, as that
>>> results in accurate serializer clock.
>>>
>>> Signed-off-by: Marek Vasut <marex@denx.de>
>>> ---
>>> Cc: Abel Vesa <abelvesa@kernel.org>
>>> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
>>> Cc: David Airlie <airlied@gmail.com>
>>> Cc: Fabio Estevam <festevam@gmail.com>
>>> Cc: Isaac Scott <isaac.scott@ideasonboard.com>
>>> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
>>> Cc: Jonas Karlman <jonas@kwiboo.se>
>>> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>> Cc: Maxime Ripard <mripard@kernel.org>
>>> Cc: Michael Turquette <mturquette@baylibre.com>
>>> Cc: Neil Armstrong <neil.armstrong@linaro.org>
>>> Cc: Peng Fan <peng.fan@nxp.com>
>>> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
>>> Cc: Robert Foss <rfoss@kernel.org>
>>> Cc: Sascha Hauer <s.hauer@pengutronix.de>
>>> Cc: Shawn Guo <shawnguo@kernel.org>
>>> Cc: Simona Vetter <simona@ffwll.ch>
>>> Cc: Stephen Boyd <sboyd@kernel.org>
>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>>> Cc: dri-devel@lists.freedesktop.org
>>> Cc: imx@lists.linux.dev
>>> Cc: kernel@dh-electronics.com
>>> Cc: linux-arm-kernel@lists.infradead.org
>>> Cc: linux-clk@vger.kernel.org
>>> ---
>>>   drivers/clk/imx/clk-imx8mp.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/clk/imx/clk-imx8mp.c b/drivers/clk/imx/clk-imx8mp.c
>>> index 516dbd170c8a3..2e61d340b8ab7 100644
>>> --- a/drivers/clk/imx/clk-imx8mp.c
>>> +++ b/drivers/clk/imx/clk-imx8mp.c
>>> @@ -611,7 +611,7 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
>>>       hws[IMX8MP_CLK_MEDIA_MIPI_PHY1_REF] = imx8m_clk_hw_composite("media_mipi_phy1_ref", imx8mp_media_mipi_phy1_ref_sels, ccm_base + 0xbd80);
>>>       hws[IMX8MP_CLK_MEDIA_DISP1_PIX] = imx8m_clk_hw_composite_bus_flags("media_disp1_pix", imx8mp_media_disp_pix_sels, ccm_base + 0xbe00, CLK_SET_RATE_PARENT);
>>>       hws[IMX8MP_CLK_MEDIA_CAM2_PIX] = imx8m_clk_hw_composite("media_cam2_pix", imx8mp_media_cam2_pix_sels, ccm_base + 0xbe80);
>>> -    hws[IMX8MP_CLK_MEDIA_LDB] = imx8m_clk_hw_composite("media_ldb", imx8mp_media_ldb_sels, ccm_base + 0xbf00);
>>> +    hws[IMX8MP_CLK_MEDIA_LDB] = imx8m_clk_hw_composite_bus_flags("media_ldb", imx8mp_media_ldb_sels, ccm_base + 0xbf00, CLK_SET_RATE_PARENT);
>>
>> This patch would cause the below in-flight LDB bridge driver
>> patch[1] fail to do display mode validation upon display modes
>> read from LVDS to HDMI converter IT6263's DDC I2C bus.
> 
> Why ?

Mode validation is affected only for dual LVDS link mode.
For single LVDS link mode, this patch does open more display
modes read from the DDC I2C bus.  The reason behind is that
LVDS serial clock rate/pixel clock rate = 3.5 for dual LVDS
link mode, while it's 7 for single LVDS link mode.

In my system, "video_pll1" clock rate is assigned to 1.0395GHz
in imx8mp.dtsi.  For 1920x1080-60.00Hz with 148.5MHz pixel
clock rate, "media_ldb" clock rate is 519.75MHz and
"media_disp2_pix" clock rate is 148.5MHz, which is fine for
dual LVDS link mode(x3.5).  For newly opened up 1920x1080-59.94Hz
with 148.352MHz pixel clock rate, "video_pll1" clock rate will
be changed to 519.232MHz, "media_ldb" clock rate is 519.232MHz
and "media_disp2_pix" clock rate is wrongly set to 519.232MHz
too because "media_disp2_pix" clock cannot handle the 3.5
division ratio from "video_pll1_out" clock running at
519.232MHz.  See the below clk_summary.

    video_pll1_ref_sel               1       1        0        24000000    0          0     50000      Y      deviceless                      no_connection_id         
       video_pll1                    1       1        0        519232000   0          0     50000      Y         deviceless                      no_connection_id         
          video_pll1_bypass          1       1        0        519232000   0          0     50000      Y            deviceless                      no_connection_id         
             video_pll1_out          2       2        0        519232000   0          0     50000      Y               deviceless                      no_connection_id         
                media_ldb            1       1        0        519232000   0          0     50000      Y                  deviceless                      no_connection_id         
                   media_ldb_root_clk 1       1        0        519232000   0          0     50000      Y                     32ec0000.blk-ctrl:bridge@5c     ldb                      
                                                                                                                             deviceless                      no_connection_id         
                media_disp1_pix      0       0        0        129808000   0          0     50000      N                  deviceless                      no_connection_id         
                   media_disp1_pix_root_clk 0       0        0        129808000   0          0     50000      N                     32e80000.display-controller     pix                      
                                                                                                                             32ec0000.blk-ctrl               disp1                    
                                                                                                                             deviceless                      no_connection_id         
                media_disp2_pix      1       1        0        519232000   0          0     50000      Y                  deviceless                      no_connection_id         
                   media_disp2_pix_root_clk 1       1        0        519232000   0          0     50000      Y                     32e90000.display-controller     pix                      
                                                                                                                             32ec0000.blk-ctrl               disp2                    
                                                                                                                             deviceless                      no_connection_id         

Single LVDS link mode is not affected because "media_disp2_pix"
clock can handle the 7 division ratio.

To support the dual LVDS link mode, "video_pll1" clock rate needs
to be x2 "media_ldb" clock rate so that "media_disp2_pix" clock
can use 7 division ratio to achieve the /3.5 clock rate comparing
to "media_ldb" clock rate.  However, "video_pll1" is not seen by
LDB driver thus not directly controlled by it.  This is another
reason why assigning a reasonable "video_pll1" clock rate in DT
makes sense.

> 
> Also, please Cc me on fsl-ldb.c patches.

Ok, will do.  BTW, if MAINTAINERS is updated, then you'll always
receive fsl-ldb.c patches. 

> 
>> Unsupported display modes cannot be ruled out.  Note that
>> "media_ldb" is derived from "video_pll1_out" by default as the
>> parent is set in imx8mp.dtsi.  And, the only 4 rates supported
>> by "video_pll1" are listed in imx_pll1443x_tbl[] - 1.0395GHz,
>> 650MHz, 594MHz and 519.75MHz.
> I disagree with this part, since commit b09c68dc57c9 ("clk: imx: pll14xx: Support dynamic rates") the 1443x PLLs can be configured to arbitrary rates which for video PLL is desirable as those should produce accurate clock.

Kinda ack - that commit does open up many more clock rates.
But, the commit just says dynamic rates, not arbitrary rates or
any rate.

-- 
Regards,
Liu Ying

