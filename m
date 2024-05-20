Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD068C9840
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2024 05:29:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BEFC10E05F;
	Mon, 20 May 2024 03:29:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="LAA4dx2O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2072.outbound.protection.outlook.com [40.107.13.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 515A810E05F
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 03:29:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a0bvo+ri2BYk48LC2JkIrODjXeY/zGd+ilL/yTITYBcsHeZIy3Sw7W4eBKhacBXdaJ+cp7LoQcJ1Gc8a/hFv7GaP9Bb7XsAAXnjlFwKJEACAQ8Voi2DyYllKW6bYmizgj9MpevheecvC2y84x0Nd0djP6rsueRuGE1vZ5VMTw7IKQ+3Jl4y1eBsU9uF84tRlYXC7Xsr42j7ixRnrJRJ1IXFlY0WDNKR7jEW7xmurc2tkypCJMN2PZpWeKmshVK86rcrSGg+f6Phbb7wtgU/3LA4alqVcP7X2nPibTjxZx0vIphXzmCWTIj9Uwa0CeRLWFzt3vu8xS5EHek9TMwrJsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DNjgC4d9auDv7660uuSxcI3hhwe+7wjNRReUrLharvQ=;
 b=FEjuw8L+qwt+arIo29p1IQxGOeTEHIbcxsnJ324s532fwTUNMRrx3DFdAlDHN0QbqlybuoXr5zswjuLaDE0iH2VgKqJaRTzVUDY831ipE8ze9gdFsJB68XluyXYpYGViLNWqjUZDUwmORnUx2ovceI9EkmUKFA4f70kh3ZVtVMYAzfu6y5X20AhNZm10QlGY7Y6P1aOXu96oZvJoaolMJQ8k7CesAPkzsjpWWD6SDdLhVAg4f+22OjgOn0+eWoU90sIEoKzftgiwC9bkMgbJYFPU3B4uvKT6BdfV/WtLbL09+n1ttqfXRg8K7D7BgLRM1R9Ao4MUbR+OfrQ+wXg4Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DNjgC4d9auDv7660uuSxcI3hhwe+7wjNRReUrLharvQ=;
 b=LAA4dx2OjO0Ckhpi8/eewdJbgrOQdhwPo1QJb9sYyO0Q+id4uJPg5B2epacBLPYr4r6MZSUxTdaLHcAu8egRNdC5c2RlZwtahJqBbalMH2g6H72YkDLVf8SjQNUKZfv7bT59glDi+Z6NvUeoZoc/6kzUZRl2P0MCI2OkkaDBI60=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB8151.eurprd04.prod.outlook.com (2603:10a6:20b:3f3::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Mon, 20 May
 2024 03:29:25 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%3]) with mapi id 15.20.7587.030; Mon, 20 May 2024
 03:29:25 +0000
Message-ID: <5efe29a7-441f-4d70-b17c-5327c0a9f600@nxp.com>
Date: Mon, 20 May 2024 11:29:42 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/bridge: adv7511: Exit interrupt handling when
 necessary
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 biju.das.jz@bp.renesas.com, u.kleine-koenig@pengutronix.de,
 aford173@gmail.com, jani.nikula@intel.com, bli@bang-olufsen.dk,
 sui.jingfeng@linux.dev
References: <20240516101006.2388767-1-victor.liu@nxp.com>
 <evnxopqt5be56vxuxqdj4l3mcd5nrrvucio7jhwgg4emraai3t@gherubdynyip>
Content-Language: en-US
From: Liu Ying <victor.liu@nxp.com>
In-Reply-To: <evnxopqt5be56vxuxqdj4l3mcd5nrrvucio7jhwgg4emraai3t@gherubdynyip>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0048.apcprd02.prod.outlook.com
 (2603:1096:4:196::23) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS8PR04MB8151:EE_
X-MS-Office365-Filtering-Correlation-Id: ba43ba4c-fd41-40dc-2c87-08dc787d0c3f
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|7416005|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M2wrdkVWTFA0TUxQeTg1SGR3eGFoN1hVS2J1WTE1cjdiVHliaEdFV3BUUzdo?=
 =?utf-8?B?NTF2N1BhVG1WNm1oQ2VMYmNiWGpnay9sTEl0KzI4eTNGRjgyRldzMHJRK0Vn?=
 =?utf-8?B?MEkrT0x0YUZLQ01HQ0JPMDkrMmRoZGJwK255azVPM3M5R083M1lZMUlwd1Rk?=
 =?utf-8?B?d3VBRnBsOUdwcmdSKytMQ2ZXTCtpYVFtbUwwaEpuVEd2dmEzdHU2Vk1xdC8z?=
 =?utf-8?B?VUZWMnhIUjVJSk5wS3FJbUNsaTdtMnhrZTB3T0V6eDRkakhPN2ZtOUZjNU9K?=
 =?utf-8?B?WkZBVnBlSm91dEoxSzc0S0JkMUdvdDVxS0U3TFZmenpmSld2YkRkWHZsdERQ?=
 =?utf-8?B?d3BWN1A3c1lrWlBYMDdDendvTS9teERWNldpTU5wekhxUC9SV1BPajV0WWg4?=
 =?utf-8?B?Z2kwTHo1U0gzeVhUanlwL3dYWDFUNFE1dEFVdStSek1IaHY3T2pIdWZQdGpJ?=
 =?utf-8?B?SkVnc0dxWDhuVy9pTGQrWVBlU29LR3FaMVFGYkcyMU9zY2Z5TXp3NEtveVRs?=
 =?utf-8?B?czBsVXAxVU5lWUFWdXQwZVZ2Y3hTUU5MUzkwSU56em9USHNzL3MzOFRUUjl6?=
 =?utf-8?B?MlYxaVcxeUVhcFdwcVYyemg0WTl6T2t5MTc3N0lYNElPOFdsQ2hHWkk1ZmtZ?=
 =?utf-8?B?UzRZcVRKM1hBT1BObFBDeDVRNVhBcWFnSURxVG1oQlB5OHVxa2NYbVNJWWR1?=
 =?utf-8?B?eTdvTzVvK3ZPZjYraWlUWm9iT296dk1FYTRHZ3d1UmVtU2pyL3duYzNJVzhh?=
 =?utf-8?B?b2ZKRlN2QnVJUVM1ZU9URXBmUVlRT3AwdnpWVFVXMVlGTmd5Zzhlb0Fxbito?=
 =?utf-8?B?OTI4WlFVRkxsaDkybS9MTUNGaFhkTENTb2J4TTFCZmpaUmhVbXoyVy83TUFr?=
 =?utf-8?B?aGZtUEFacnpRK2syaktValUzamp6N21WWUE4bjU4L1JCM2FZcXBNc2YzczRq?=
 =?utf-8?B?d2VjTm1qN0lVYUczNHRDZzlheFZGelI5QWx2VDl3N1JMU2hCZEZXZXBnZERl?=
 =?utf-8?B?Q0d4ekdvTDE5TUI3MW80K0NUcGFlRUhvUVdaaXlQM1Z2dWxDaGk4ZFlJSEN0?=
 =?utf-8?B?emhJVnU4eU83Yk00MEt0MGJwS1JQeU9RY0IyNVlXclpPVFN5ZVJnT1N1ZFJy?=
 =?utf-8?B?cDBFKzZ3K3IvUHJ1WFNiOWZxRG5QeUFDbkRldmVreXYrVmpIRE1jc1VZY2l3?=
 =?utf-8?B?UVBpSjBDV1NwdUNVbkFKcW9DZ0YwR1ZhNHJ4bjkyZzdXc0NkUlhrZkErTTIr?=
 =?utf-8?B?b29sWXMweDNuVDR1QkVKenEya0VFTzMxQWkxZnd3Rm9lYU5Kd3VKdHZVSmN4?=
 =?utf-8?B?eTZDOTZEa3Q0ekpibGMrbGJTbUFoMWg5SHRwM1NtK3lURzduSGM1V1V2Vy9y?=
 =?utf-8?B?VUs0RDg4QU04NlArT0drZTBienVWWlJQRWJKcmVOV1hKMmtpUG5kV3lkTnB4?=
 =?utf-8?B?amx4UWR2djg1MXdHZjAxVHRVdVNIVnRIM0FpK2QrdzU0d1loUTg4NUliVzhT?=
 =?utf-8?B?TGxwWGRNbDlVRmVVZjBoVXM3RkxKNlF2ZFFlcUg0dW5FTG1XMHBoQzAyUmYy?=
 =?utf-8?B?K2pMRlF1eElKaXhEQzkzWGJHL1FYM1NIT0gzQmc4dkcxTGwrbXJkc2FCUU9D?=
 =?utf-8?B?dElKWWFiWUhuRkkyMXM3ZHloLy9ubVAzdUFvZnpQNU5WRkp4U1A3YUl0Y2hC?=
 =?utf-8?B?VjJjLzBaYjUrQTVsUnlLaXFRUGNKT3BobjNPbmVvNzJWSnJPR3pqeGJRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(7416005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VEZPaDBwMnAyNWIzV3FYQzdJeGVPWVRJeEVTd3h1NFpsMkxUd3FYdk9jeEFm?=
 =?utf-8?B?MWxhcDlZZmFRZU5QWWNXOStYa2xZN1lLaHptY2czNnFiQldvdm5DeVRYcHRT?=
 =?utf-8?B?N0ZkQnZEcEpMcDFzR1MrTE1yeHNFemRBczdJYmtGNEFhOFB3MnNaL1c5RU1B?=
 =?utf-8?B?Mkx6UUZNSjNsZzVRWlg1a1pVVnc2eExTQUR2K1g2UUVibG1TWGQ0VmJpUnpa?=
 =?utf-8?B?czhXeFdDRUR3d2p4c0hxRUZuazlhSHBpZ2lxOTczZFlucm9ZdlpneFdFdXYv?=
 =?utf-8?B?S3dBWGZGZTZMd0hjT2JIcGdmNDFyTjdUdUZla1VFNXdPMFlzbjlkQjY4ek5r?=
 =?utf-8?B?bXdKQlBGZ1B2N215cmRKWVlNQ0U2R1N2Z0EzdzQwN2xNaXFySStGNTdBSDFp?=
 =?utf-8?B?dW5Pdk1EZE5GQWpVQncrTVJkZVFuZ0ppakJDcFFqaU9PWmdqNnZIYTBjd2RN?=
 =?utf-8?B?WC9jTnhaU1A2UkNWMGs1ZW04K3hzOVlicGZWaTd0bTNISkFrWnFNcjlkSWtE?=
 =?utf-8?B?WWJ0WDR5QnBkbklZN3E2dWJoRnFVL09RRUxXeVhNNjkxRDRvZnZNRkY4QktZ?=
 =?utf-8?B?RFg1MC9MK1FIRVZwV3Z1RS9qeEFkaGZjWmdVQXpYR1lLT0xFVjlsdmxBQmJS?=
 =?utf-8?B?WndMNjdTTXFLbTZoTGw4QjE3RGowT3h6Y3VjeUZDYllnMGl3M29udFk0SFN1?=
 =?utf-8?B?OEd2UytrK0pLR0o4aGhuY2FYNWhKbnkrcjNHY2RxRnZqYTdRYU9MSHRQc2cz?=
 =?utf-8?B?YlRFeGNLRkVGR0pGUHlHa3d2cjNpSjlsZ3lrelU2cjc0UEYyU2RlRnNlaFEv?=
 =?utf-8?B?d1hHUDNaZ0s0ZmhsZ2FONzNLc2kxZEN3andtNnVrSDQzeWNkMGtQeTBXZlNB?=
 =?utf-8?B?SVV3M0ZJb2Z0OUV3MWw1TmVsZUNUTnpSTU54dkJyRGhJTWZIUE1sajV4MmFQ?=
 =?utf-8?B?c3dNYUhYTXpDTnVSck80cCtrTTZyZmpXb3lWeVpndERTUEI5emU1MUljVjhx?=
 =?utf-8?B?TWxCTGNIMVhQOStwNWdGLzNLTm1MMGNvYmdRbUhnZ3lFckpxYUNSQ3ljOG5r?=
 =?utf-8?B?cVlmT3k4aDIzWkJLWjE1c3lVMDVtc01TTjYvL2NZN3FiNUF4dVYvajdmSk9k?=
 =?utf-8?B?Q2NXeDJVby9sQzIzZk9ud2MwbkFmWDZEcGp3MGpBckk5NXZRcXQzNExsZTlN?=
 =?utf-8?B?aG5HY0NKRGdnL2RZMElMckJyV05tN0dWU2IzWlJBYXpOV1lUeklkZGJwSXo3?=
 =?utf-8?B?RFR1aWNhTWxIdHFRazRYZmxabmltNHBlOENmdkRXQlRMM1V6QnpYVk01alVk?=
 =?utf-8?B?bGFORGNmZDdhTUFTYTMya0xUclZUOWFLcGZSa1lCT21vYTNxVGw5SVR1M01Z?=
 =?utf-8?B?elBJWEFtWW5PQkl3cEdsZHp4V282Vm4yVkhvNnRtT0FENUtDTzNwamJ2aTkv?=
 =?utf-8?B?SGdxV0FuUUR1WGN3L290TnhKZlh3NFYwT3dCWVJtSllTTXpYUmw3U0ZHTFNI?=
 =?utf-8?B?U1NqcVAzMk1pVno0UkEyaTVJQitCNncwUUxYUkEvRXltTlBNeVJCbGwxRlcw?=
 =?utf-8?B?VThnMmdTMnN2Vk93OEowV3BheFhpcDBnc1hoQnAwclc1TWNQaGlBNldjZlNT?=
 =?utf-8?B?cDdBWG1vN2hDV3RRY050bUFJSDFRRFdqTFN4VDduK2tXMDNUUGhFSnRLT0gw?=
 =?utf-8?B?MGZhZldZTmV2WXM4N2loU1dvMEh5WlFrSUcyUjJReG0yOFZnTG5QWGpERzBL?=
 =?utf-8?B?enpKdDY5M1NRN0dOSlFsOS96UU9ZU2JlLzVmUXdHK25vVGZRb1VaMVVHbklo?=
 =?utf-8?B?WGFYRkFzK0VRK2ZSa29KSWhXOTdpcmtHRS96UDYzbzJvTGJxYXVkWFNySjZy?=
 =?utf-8?B?UFNlZ2oxRFc4dmtKeFpXS0ZCWmVZejdwSVZNbVV2MFUvZFRDMDFJSTV2b0s1?=
 =?utf-8?B?RVo3VEV2UjV3TEJGdHJqb2RJZ2h3azBaY1A4cXE3SzJHUExZN2g4bnhyRFNV?=
 =?utf-8?B?cEpLb1FEek5kbnBHVGg2OFBCV21HL1pzYUZkSGtGQWY0L0xvUEVXWExXd3M1?=
 =?utf-8?B?OEZkaTRpUlZ1ZDgrOFBKSDNnTkE4ek04bWJYZnpoN20zajlpZVQrUmk5bll4?=
 =?utf-8?Q?DyaEQVhKTeo58zjZ59EPqLxcu?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba43ba4c-fd41-40dc-2c87-08dc787d0c3f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2024 03:29:25.2561 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DC2I6FCBFt4UMof/WzbnPkcO/A4KaZ8MrBTpzlLPijiab8lKtDQ0qK+TviO2YZ1XVs1itZNR7e0roBvY72+UKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8151
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

On 5/20/24 06:11, Dmitry Baryshkov wrote:
> On Thu, May 16, 2024 at 06:10:06PM +0800, Liu Ying wrote:
>> Commit f3d9683346d6 ("drm/bridge: adv7511: Allow IRQ to share GPIO pins")
>> fails to consider the case where adv7511->i2c_main->irq is zero, i.e.,
>> no interrupt requested at all.
>>
>> Without interrupt, adv7511_wait_for_edid() could return -EIO sometimes,
>> because it polls adv7511->edid_read flag by calling adv7511_irq_process()
>> a few times, but adv7511_irq_process() happens to refuse to handle
>> interrupt by returning -ENODATA.  Hence, EDID retrieval fails randomly.
>>
>> Fix the issue by checking adv7511->i2c_main->irq before exiting interrupt
>> handling from adv7511_irq_process().
>>
>> Fixes: f3d9683346d6 ("drm/bridge: adv7511: Allow IRQ to share GPIO pins")
>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
>> ---
>>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
>> index 6089b0bb9321..2074fa3c1b7b 100644
>> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
>> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
>> @@ -479,7 +479,8 @@ static int adv7511_irq_process(struct adv7511 *adv7511, bool process_hpd)
>>  		return ret;
>>  
>>  	/* If there is no IRQ to handle, exit indicating no IRQ data */
>> -	if (!(irq0 & (ADV7511_INT0_HPD | ADV7511_INT0_EDID_READY)) &&
>> +	if (adv7511->i2c_main->irq &&
>> +	    !(irq0 & (ADV7511_INT0_HPD | ADV7511_INT0_EDID_READY)) &&
>>  	    !(irq1 & ADV7511_INT1_DDC_ERROR))
>>  		return -ENODATA;
> 
> I think it might be better to handle -ENODATA in adv7511_wait_for_edid()
> instead. WDYT?

Then, adv7511_cec_irq_process() will have less chance to be called from
adv7511_irq_process() (assuming CONFIG_DRM_I2C_ADV7511_CEC is defined)
if adv7511->i2c_main->irq is zero.

But, anyway, it seems that commit f3d9683346d6 ("drm/bridge: adv7511:
Allow IRQ to share GPIO pins") is even more broken to handle the CEC case,
as adv7511_cec_adap_enable() may enable some interrupts for CEC.

This is a bit complicated.  Thoughts?

Regards,
Liu Ying





