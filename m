Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C90B499603D
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 09:00:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F29310E662;
	Wed,  9 Oct 2024 07:00:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="av4bVo/G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11011039.outbound.protection.outlook.com [52.101.65.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F34EA10E660
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2024 07:00:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ymp1ERfUXl4sTIYzUdGZChZwttQZO2Pj0uzXCz1MRFuTzvent8rGJif7oBiyHRY5mYN9OkJ7MKIwRF3ijugO7sLGISl2RbdQY4fdVEKet5SBXHJXFE1sEJ5+ODlegx09GJ/5+R1Vk4JcekCBAZ8Pww7Qzm8Fuyaksn8PVgHFU15OAeFlRi0ErwxPoFeysIqYJRczlkoGVpeM5nLOJrCo8Mi5RlPXNhCiRgNYsqfSnPTPZJJF0AWsQUfmlRpZns0oVdW8wXQbCJ5vUlmVtriKXNhcGRzTjMlPmDMHxvCIqk+NcscFlOtLWVsLHV0Fv4nZJLgNKiqHuGhkeGOA5WUlSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ProUcwi3/vmBAzaPAdhB+CzicJ7XJkMywnO836JuzC8=;
 b=MCSVwDnc0TknGSwqs2TRMvbnEByjrrv6HBSllxr1P49jY3vaVpy27lcSfGM9J4+vvVUNopUqkWZLtZud3svtbNV581gOfTFG1nxRps/y/EylcR8TBX7MqdnlMzH1/YyZINMcic1J9Igj4dU3tnN2H+gc895Ukj2u9sKogutDPtN65etFTgFoYuuxemt4BY2dM8XVJY4kcJiPPJp4GixH0s1CMF2mCmgQFmlXeNJDllIIOHP18sU6UjbCOaunZ6pgH6HlA9Hn5cnPHaqFug+o02qgHQ82YX0nlw/EU0KzkH1CEhBQ6zu/NWbP6aXTEx5bvgiK9csK6/o7HGHEpRTD4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ProUcwi3/vmBAzaPAdhB+CzicJ7XJkMywnO836JuzC8=;
 b=av4bVo/GS3FkhypCs4vwW/1mGgDJZrEtLIQ47mn4HwrLfGTQkalrqH69GOUPGM7K8PcCW8UQ0v09sMLrvlr/kKsjGM1RfEmx34pmIn2XRF+/eaR+VU1AV6jnjRdOAHysOo6r0fdGcqv/BMkm0hDlNhqlMPWcNzNHL6lTG3ufqa9TX7yYfs8zgkS4/3g9SAohFAOmy+cW0bIa60VUukp5BuT05biUokUL+ZKmqbPQUxBzZV2D2SXHACb8jORTRDeoKfYvE8Z58k+kwdl8KGMMe+HWH4RW1vEEm5jzB19XSJWLuyZlMKm2ZBEcMKkOnHg9i3DMbSXTjfi6VtQuSIIpqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PAXPR04MB8373.eurprd04.prod.outlook.com (2603:10a6:102:1bc::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Wed, 9 Oct
 2024 07:00:12 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8048.013; Wed, 9 Oct 2024
 07:00:12 +0000
Message-ID: <5e838003-34c0-4d30-be62-2aa4b1efaae4@nxp.com>
Date: Wed, 9 Oct 2024 15:00:35 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] dt-bindings: display: bridge: Add ITE IT6263 LVDS to
 HDMI converter
To: Rob Herring <robh@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 catalin.marinas@arm.com, will@kernel.org, quic_bjorande@quicinc.com,
 geert+renesas@glider.be, dmitry.baryshkov@linaro.org, arnd@arndb.de,
 nfraprado@collabora.com, o.rempel@pengutronix.de, y.moog@phytec.de
References: <20240930052903.168881-1-victor.liu@nxp.com>
 <20240930052903.168881-6-victor.liu@nxp.com>
 <20241002000214.GA49657-robh@kernel.org>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20241002000214.GA49657-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SI1PR02CA0004.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::12) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PAXPR04MB8373:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ee69436-667e-45bf-877b-08dce830050d
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VFJrL2JNd3JqNnB4bDJVVDU3VU53MzdXZGlpRWxYS3VXbnpGTEZEekVBbFdW?=
 =?utf-8?B?bWxXMjFoSGNYTUVNRkRYS0xhMFN5cm5NRnVLbXB2QVpiK0hPWXlQRFczTW1D?=
 =?utf-8?B?YWxmVzRQSWZxMjhNendLOWlZR0hrUU4xWjdRMURSdTFudDVSUytFV1kvVkE2?=
 =?utf-8?B?T050R0lnOUFyUkY4dWVlMWRJWlB5REN4cWR0WFVDU1RqcUpDc29xT2RXZjdC?=
 =?utf-8?B?V1ZpRWlIZ2o4Y2hTaUF2Nm5saU5NQkFsTE1wZGF6YmF1ZWNPa0YrYzR6QzFm?=
 =?utf-8?B?MnNPMFROYUxUT2ZLSmQ5cmV1T2dlUWRDakJOOFRZU0RhMGU5SUt2clp6MlQz?=
 =?utf-8?B?bjFwTER3ZDZZeUF1aGwvRUljQ0VFUjdlWDBVZElBcmZwN0tZMUtJOVJnaTlB?=
 =?utf-8?B?WXZweUdNSEZNaWVDTFZLa3gzajh5Rys3UlZvT2w4bjlLa3dteTJ1RHVnSGpQ?=
 =?utf-8?B?MW1OVzRrOEx3MU5PLzRnZWxDaXJPMFg2Sld3UmN2R0F2NjBmanJLZm5HZDla?=
 =?utf-8?B?OXF5TlZEcmQ5NmhYaTRhLy9ESWlFUU9QZTVQM3NsQUtJS2UxVnNMckU2UnZu?=
 =?utf-8?B?R3ZXeE4vckhQcnN6WUtFMElEQmFodDRpYVJOQWRxQnhCWHBQdElkWTdGalBK?=
 =?utf-8?B?SXN1bEhhZEoya01nM2dsRmxMUEZ5Y2lRUzlkSzByU2MxVXo2VjdHdm9RRHVu?=
 =?utf-8?B?VFNWWW9hTUJtbkg2N1Mzd3JjMW5wV2owN2VhUW4zaVFIdnFkaWc2RGNlSXhG?=
 =?utf-8?B?V1RRUGtsR1g4d3g3QkNyVWpjWmRmWDd4WTdsRWc4T0tlYWRiZVpQZ2pMa0Jj?=
 =?utf-8?B?c2IrMTJlVGZMelNqRFRmNEp4SmJHSU9jbnRuaUp5SDdNR3Bic1NwMWQxZ3FN?=
 =?utf-8?B?aDZDZVpQNk5CTFhLRTFxV3dpSzdJd3MxRnRsaFBYYXBvWXgvVDFQc09JdGtF?=
 =?utf-8?B?SUo4VkIzTFpMQm1mSm1ibHZ2NzlFNTNPU284NEdZZXk4dDZaciswUnpsOTJZ?=
 =?utf-8?B?dTRXOW0zTEszRFVseXJ4WkFuZnR1ZkxLMWFDbERNZVRBZTNydWIrUkJkNHFQ?=
 =?utf-8?B?d2tWNnNwWTRUMFZlWmVVNm5pSXZBNlM5S3loM096TnZWQUxjdkhCTnFvTTJJ?=
 =?utf-8?B?OXBVSWxOS3ZqaG5EUEVBWW5uQjcyYkpKU0lUbzRUaUtwLzNsMXF1SmlJS3Av?=
 =?utf-8?B?ZTRuY3dwL2grSEduRzFiM0lWcWljelNqMStvYktCbmdIMEQ1K0pQUEV2UStv?=
 =?utf-8?B?QjZVRjNDQjdmbkFJQTZtOWJ6OVdVZ0dRZ09seXBHSEc1SXVBbjlWTW14bGNj?=
 =?utf-8?B?TGNCV2Z5SW1TZmVjTjFGYXFTQ3EzUGpyRHZTVERCTUxZZ2E2dlJSUDUyRitX?=
 =?utf-8?B?REpWN1pFaHZaV1laaVVydWxranFxVHEyc3hMSVpYN0dnUXdYU3ZxUEJOekMx?=
 =?utf-8?B?MDNUQWROTlFoZDlrd2xKSkQ4eFJWallEUHl4c3lkeWcxVlM5TnRQZUIrQWJt?=
 =?utf-8?B?c3l5OWVpb1BBNWtXWGFkYjVnK0htZjFiT2k2VnFiTWJxTTllNEdGVjZUaXhq?=
 =?utf-8?B?UlRnRjZTZDV2ZFpiNU5udU8xTUY3VEU2ZVJGN0UzbW9Xcnd3bDdVbkl1K0x4?=
 =?utf-8?Q?UzdJ+EytsB3hDrsVbiSWJPXKHUtnkZGyQG2NmoQ5qBoM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cTlrMENWVXZNcU9RQ21DdGlIcW1wNWQ5R1NDSGpCYklmakFNN3FXMFhxWUtL?=
 =?utf-8?B?R3pjdkE4UjZWblhqYTBoelF6Mk9sVmhtb0ZJMmFOZ2syeEF3aHU4YkFneVR0?=
 =?utf-8?B?YkcxbjdVWEY3NWZBTkVyYXEzVWlBUnJ3SlhqdXpUeEVLOTVaTVBSZEp1VW9Q?=
 =?utf-8?B?M3kvSTZQMDVhZjliSnl1ZExGazM0SXY3UXdsY2lqTGN1QWNNK2p5RXpzblZ5?=
 =?utf-8?B?K3JFcXp2LzFPS3BYRWlrdjlFQXQwKzMweWdBRWh4RS9jeS91cHlRUmx5aXM5?=
 =?utf-8?B?Rm1SeTRjUHdSQVZ6MmtadDA2RXZjMTljdUdGZXluRE42enp0S2NqVE5oc2cr?=
 =?utf-8?B?MEE4L2FWbVAxYnRPbkplMndhS3A2blE5a2FmR3JyUnlVblFqa1ZLQWs2amVI?=
 =?utf-8?B?SjhzbXF6MXI0QmpTRkZjejlONFlkOWF5dTVia1d1N1VGQTJtU0xzVWgrMUhR?=
 =?utf-8?B?cnBHT3I0czRrc3N4V0M3UVplOTF5aUtyU0hKUFZUTkI5cE5sdlAxWlNCbXN5?=
 =?utf-8?B?SjlGSmRYVG92NUpnRWlaK3R0OGhEc2U3cXQ5NU4xUWZ3YjcyWFpXN0k4b2Nw?=
 =?utf-8?B?aG1JWnNML1lDd25BbHU4MXliZ29kMFBlMnJCc2NLS3BaOEJyK3p6YTRtMmt4?=
 =?utf-8?B?WDh1OUMyQk5QWWFZcnRZbW4wQ0czTW9Ub01HNkJBQWlKaUlKL3hQRndkZmp3?=
 =?utf-8?B?VnFMa0tCeFJUSEF5TTQwNkd6Vm1FTlp0RzJYTy80ZllMeVU5Z2tWNHRsWDZQ?=
 =?utf-8?B?Y2lSN0NFOU9qWDU0dHN3TDNUekp3anh6OTVRaEwrUGlQcUNQTVp6Ky94L0Nw?=
 =?utf-8?B?UWM3R2EzY1FDa01YSWY1ZGVxMUVMVlFYbHpBWDJEczF0M1dZaHdISFhSOEw3?=
 =?utf-8?B?YlVyNEFwd3g3RTdVSWpPTnoyazBvbG5YNGxjd2JQOWU5M3R5c0lDdkxSbGJU?=
 =?utf-8?B?UUFyRWU3UmQ0S2JzZ3BJQmNoQXprZHdxemdpQkNqY3BlVTNhYlBMb2pwZnQ5?=
 =?utf-8?B?dENVU29HTldqRkpobFZvS3ZaVXU3ZHZXS3EvbUlmTitFbkZuTStoTWoyYndp?=
 =?utf-8?B?UUJZZzNmd3BOQ3JMWDBVZ0Y3UHQ0VHRwV2tMRkRmN1ByZGwxRGZWaTZWTCt0?=
 =?utf-8?B?RW9SRE9GLzNiS0dkRWc3ZjI5MFByQXZwRnRJR3NIYUlyUDllWmEwa0V1aFAz?=
 =?utf-8?B?TW1MNkxHRFZyMHZ3MXVGam5BVnlqM2l1elhUU1RwY1VPN2Y1enhwVXdTQlhu?=
 =?utf-8?B?UDNZVG1ZMzVKdDdabFlnRnBMeXNkVktEZVd4U1BzU0d3SzNjSjNTSjVBSmNo?=
 =?utf-8?B?K2MyeExlZVU3WGpzUjNuTTdyUEplT0Zlc0x2bnlzZnhJK2FzUHJXVkQrNkl2?=
 =?utf-8?B?Rm9yM250bVJpSWN0RmhYeTFUVlRhK2tBRkU2VXBQMk9TdkVuNmYzNU1Fam50?=
 =?utf-8?B?UUc5UWlNc0NKTTFtRjFwOS83Sml3TGFoN1R4eC85QllhZDA4aDQ4Mzh6T3Jj?=
 =?utf-8?B?b2c0b3BNUjhyVVpENXNldkRZYStXcXl1WHRyTStiOHVseXZBci9JeW1JdEN3?=
 =?utf-8?B?akt2cWhORzVNREJ5dHJMYkdnUmdFZ3FJcXJ0aWwyWVR0clBKZXVERXV0RHJo?=
 =?utf-8?B?dmU1bks3ZnhTV01xd1RIWC9vdmtTdVYvWVlLdllkcmtKeWU1eUJESXZMZ2pI?=
 =?utf-8?B?Q2lkb0VYSGpVTWJXUW1QUUlXVll6WWM4V1ozNmpyRkRBR0ViMGg3aE9iVXFz?=
 =?utf-8?B?ODBFd0tOSEh5SjZOQnJOclhJWW9lMlRheDQ4WHd1MkprNUFYL1lKdHYydzE0?=
 =?utf-8?B?Yms5YmcrdVBqZng0aXAvVWRBVUJTWkRneWxXWkVGT0xIK2VFUVRDZFNOUFYy?=
 =?utf-8?B?WERFREprUC85M1MwVnRQR1oyU2pVaytTZ1BqVnA4Y1gyNlNudDNRbWtZeEQ2?=
 =?utf-8?B?eGs2a2F2OFJtZ2JWNHhFcFZwdHIyelVPMWhjSEJxaDdhWkpuYUk3OHk1Z1VB?=
 =?utf-8?B?NW94R1d4RUtCNlViSlFnQ0hSOGp4SUhFSndGZ2VlMU5IQmh3dys2blhHcW1K?=
 =?utf-8?B?ZlZaeWZjWlp6Tlk4Zkk0YmhrQmVWNTdWc3E5RWppS0hXTS9KL0FOdXp3QWE0?=
 =?utf-8?Q?M1r+MD/I8M33tlEvigfnO66JN?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ee69436-667e-45bf-877b-08dce830050d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2024 07:00:12.3990 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PE3ih2pvicWS5Ad4ryEsAAMLXUbdaa8MbUtiLRQkN4Arh2Snjjq7/HomQv9yCTHxrqXTaHt23zfVvYeSsGOftQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8373
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

Hi Rob,

On 10/02/2024, Rob Herring wrote:
> On Mon, Sep 30, 2024 at 01:29:00PM +0800, Liu Ying wrote:
>> Document ITE IT6263 LVDS to HDMI converter.
>>
>> Product link:
>> https://www.ite.com.tw/en/product/cate1/IT6263
>>
>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
>> ---
>>  .../bindings/display/bridge/ite,it6263.yaml   | 310 ++++++++++++++++++
>>  1 file changed, 310 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml b/Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml
>> new file mode 100644
>> index 000000000000..97fb81e5bc4a
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml
>> @@ -0,0 +1,310 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/bridge/ite,it6263.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: ITE IT6263 LVDS to HDMI converter
>> +
>> +maintainers:
>> +  - Liu Ying <victor.liu@nxp.com>
>> +
>> +description: |
>> +  The IT6263 is a high-performance single-chip De-SSC(De-Spread Spectrum) LVDS
>> +  to HDMI converter.  Combined with LVDS receiver and HDMI 1.4a transmitter,
>> +  the IT6263 supports LVDS input and HDMI 1.4 output by conversion function.
>> +  The built-in LVDS receiver can support single-link and dual-link LVDS inputs,
>> +  and the built-in HDMI transmitter is fully compliant with HDMI 1.4a/3D, HDCP
>> +  1.2 and backward compatible with DVI 1.0 specification.
>> +
>> +  The IT6263 also encodes and transmits up to 8 channels of I2S digital audio,
>> +  with sampling rate up to 192KHz and sample size up to 24 bits. In addition,
>> +  an S/PDIF input port takes in compressed audio of up to 192KHz frame rate.
>> +
>> +  The newly supported High-Bit Rate(HBR) audio by HDMI specifications v1.3 is
>> +  provided by the IT6263 in two interfaces: the four I2S input ports or the
>> +  S/PDIF input port.  With both interfaces the highest possible HBR frame rate
>> +  is supported at up to 768KHz.
>> +
>> +properties:
>> +  compatible:
>> +    const: ite,it6263
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 1
>> +    description: audio master clock
>> +
>> +  clock-names:
>> +    const: mclk
>> +
>> +  reset-gpios:
>> +    maxItems: 1
>> +
>> +  ivdd-supply:
>> +    description: 1.8V digital logic power
>> +
>> +  ovdd-supply:
>> +    description: 3.3V I/O pin power
>> +
>> +  txavcc18-supply:
>> +    description: 1.8V HDMI analog frontend power
>> +
>> +  txavcc33-supply:
>> +    description: 3.3V HDMI analog frontend power
>> +
>> +  pvcc1-supply:
>> +    description: 1.8V HDMI frontend core PLL power
>> +
>> +  pvcc2-supply:
>> +    description: 1.8V HDMI frontend filter PLL power
>> +
>> +  avcc-supply:
>> +    description: 3.3V LVDS frontend power
>> +
>> +  anvdd-supply:
>> +    description: 1.8V LVDS frontend analog power
>> +
>> +  apvdd-supply:
>> +    description: 1.8V LVDS frontend PLL power
>> +
>> +  "#sound-dai-cells":
>> +    const: 0
>> +
>> +  ite,i2s-audio-fifo-sources:
>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>> +    minItems: 1
>> +    maxItems: 4
>> +    items:
>> +      enum: [0, 1, 2, 3]
>> +    description:
>> +      Each array element indicates the pin number of an I2S serial data input
>> +      line which is connected to an audio FIFO, from audio FIFO0 to FIFO3.
>> +
>> +  ite,rl-channel-swap-audio-sources:
>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>> +    minItems: 1
>> +    maxItems: 4
>> +    uniqueItems: true
>> +    items:
>> +      enum: [0, 1, 2, 3]
>> +    description:
>> +      Each array element indicates an audio source whose right channel and left
>> +      channel are swapped by this converter. For I2S, the element is the pin
>> +      number of an I2S serial data input line. For S/PDIF, the element is always
>> +      0.
>> +
>> +  ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
> 
> Test your bindings. You need 'additionalProperties: false' here. Though 
> I can't remember if that can 'see' properties under the oneOf. So it may 
> have to be unevaluatedProperties instead.

Ah, I see the same warnings with your bot after upgrading my local dtschema
to dtschema-2024.9. I should have upgraded it earlier, sorry. Before sending
this patch, I tested it with dtschema-2024.2 and there is no warning.

However, there are still the warnings after adding additionalProperties or 
unevaluatedProperties constraint here. With additionalProperties, there are
even some additional errors.  Thoughts?

> 
>> +
>> +    oneOf:
> 
> I think you can get rid of this. If port@1 requires the dual link 
> properties and then properties on port@0, then the only way you can have 
> a single link is removing port@1 from the DT. 

If I get rid of this with the below snippet, I see warnings against
the single-link LVDS input example. It looks like the conditions in
"allOf" are still true even if "port@1" is not in that example.

And it seems difficult to disallow people to add "dual-lvds-odd-pixels"
and/or "dual-lvds-even-pixels" properties to "port@0" when there is no
"port@1". This is not an issue if we use the "oneOf" to separate the
single/dual link cases. Any ideas?

-----------------------------8<-----------------------------
  ports:                                                                         
    $ref: /schemas/graph.yaml#/properties/ports                                  
                                                                                 
    properties:                                                                  
      port@0:                                                                    
        $ref: /schemas/graph.yaml#/$defs/port-base                               
        unevaluatedProperties: false                                             
        description: the first LVDS input link                                   
                                                                                 
        properties:                                                              
          dual-lvds-odd-pixels:                                                  
            type: boolean                                                        
            description: the first sink port for odd pixels                      
                                                                                 
          dual-lvds-even-pixels:                                                 
            type: boolean                                                        
            description: the first sink port for even pixels                     
                                                                                 
      port@1:                                                                    
        $ref: /schemas/graph.yaml#/$defs/port-base                               
        unevaluatedProperties: false                                             
        description: the second LVDS input link                                  
                                                                                 
        properties:                                                              
          dual-lvds-even-pixels:                                                 
            type: boolean                                                        
            description: the second sink port for even pixels                    
                                                                                 
          dual-lvds-odd-pixels:                                                  
            type: boolean                                                        
            description: the second sink port for odd pixels                     
                                                                                 
        oneOf:                                                                   
          - required: [dual-lvds-even-pixels]                                    
          - required: [dual-lvds-odd-pixels]                                     
                                                                                 
      port@2:                                                                    
        $ref: /schemas/graph.yaml#/properties/port                               
        description: video port for the HDMI output                              
                                                                                 
      port@3:                                                                    
        $ref: /schemas/graph.yaml#/properties/port                               
        description: sound input port                                            
                                                                                 
    required:                                                                    
      - port@0                                                                   
      - port@2

    allOf:                                                                       
      - if:                                                                      
          properties:                                                            
            port@1:                                                              
              required:                                                          
                - dual-lvds-odd-pixels                                           
        then:                                                                    
          properties:                                                            
            port@0:                                                              
              required:                                                          
                - dual-lvds-even-pixels                                          
                                                                                 
      - if:                                                                      
          properties:                                                            
            port@1:                                                              
              required:                                                          
                - dual-lvds-even-pixels                                          
        then:                                                                    
          properties:                                                            
            port@0:                                                              
              required:                                                          
                - dual-lvds-odd-pixels                        
-----------------------------8<-----------------------------

Documentation/devicetree/bindings/display/bridge/ite,it6263.example.dtb: hdmi@4c: ports:port@0: 'dual-lvds-even-pixels' is a required property
	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6263.yaml#
Documentation/devicetree/bindings/display/bridge/ite,it6263.example.dtb: hdmi@4c: ports:port@0: 'dual-lvds-odd-pixels' is a required property
	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6263.yaml#

> 
>> +      - properties:
>> +          port@0:
>> +            $ref: /schemas/graph.yaml#/properties/port
>> +            description: the first LVDS input link
>> +
>> +          port@1: false
>> +
>> +          port@2:
>> +            $ref: /schemas/graph.yaml#/properties/port
>> +            description: video port for the HDMI output
>> +
>> +          port@3:
>> +            $ref: /schemas/graph.yaml#/properties/port
>> +            description: sound input port
>> +
>> +        required:
>> +          - port@0
>> +          - port@2
>> +
>> +      - properties:
>> +          port@0:
>> +            $ref: /schemas/graph.yaml#/$defs/port-base
>> +            unevaluatedProperties: false
>> +            description: the first LVDS input link
>> +
>> +            properties:
>> +              dual-lvds-odd-pixels:
>> +                type: boolean
>> +                description: the first sink port for odd pixels
>> +
>> +              dual-lvds-even-pixels:
>> +                type: boolean
>> +                description: the first sink port for even pixels
>> +
>> +            oneOf:
>> +              - required: [dual-lvds-odd-pixels]
>> +              - required: [dual-lvds-even-pixels]
>> +
>> +          port@1:
>> +            $ref: /schemas/graph.yaml#/$defs/port-base
>> +            unevaluatedProperties: false
>> +            description: the second LVDS input link
>> +
>> +            properties:
>> +              dual-lvds-even-pixels:
>> +                type: boolean
>> +                description: the second sink port for even pixels
>> +
>> +              dual-lvds-odd-pixels:
>> +                type: boolean
>> +                description: the second sink port for odd pixels
>> +
>> +            oneOf:
>> +              - required: [dual-lvds-even-pixels]
>> +              - required: [dual-lvds-odd-pixels]
>> +
>> +          port@2:
>> +            $ref: /schemas/graph.yaml#/properties/port
>> +            description: video port for the HDMI output
>> +
>> +          port@3:
>> +            $ref: /schemas/graph.yaml#/properties/port
>> +            description: sound input port
>> +
>> +        required:
>> +          - port@0
>> +          - port@1
>> +          - port@2
>> +
>> +        allOf:
>> +          - if:
>> +              properties:
>> +                port@0:
>> +                  required:
>> +                    - dual-lvds-odd-pixels
>> +            then:
>> +              properties:
>> +                port@1:
>> +                  properties:
>> +                    dual-lvds-odd-pixels: false
>> +
>> +          - if:
>> +              properties:
>> +                port@0:
>> +                  required:
>> +                    - dual-lvds-even-pixels
>> +            then:
>> +              properties:
>> +                port@1:
>> +                  properties:
>> +                    dual-lvds-even-pixels: false
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - ivdd-supply
>> +  - ovdd-supply
>> +  - txavcc18-supply
>> +  - txavcc33-supply
>> +  - pvcc1-supply
>> +  - pvcc2-supply
>> +  - avcc-supply
>> +  - anvdd-supply
>> +  - apvdd-supply
>> +  - ports
>> +
>> +additionalProperties: false
>> +

-- 
Regards,
Liu Ying

