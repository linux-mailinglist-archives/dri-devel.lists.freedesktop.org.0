Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3629093ECB2
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2024 06:47:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43A7410E2EF;
	Mon, 29 Jul 2024 04:47:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="HdVZnDxc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010053.outbound.protection.outlook.com [52.101.69.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F07B10E060
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2024 04:47:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RFLlnYhzdaqHu0XPbW15ncIHkYq/4ffBie9c4kWDVHzxZJl5Vz5qh1QGb4/u9yMqBEFJImMiQGWC7/lVEHkqcgFAcOade1fkVDqJYBVJzphd+tVNYLpASAoq2awZalvAd+v2rFleyWgUaxg5G1rGpUC1f6W5Ekf9pw3hRUx8FmefUX51Rfe6YtzXjew/QQbaNkJkOKB3Wb6zElKtHTykesy/KkyqTjJH1rJIdNf3H86Z1FePxjn1zV1LlzM6Ldd5cMgutcW5/G8QEeT9E+ML8Vesw2yK+GTBxCyKTGa4g1TPlbQnJP3omITe/oiV5uelK1svtznG9/+tF9yNABGeog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3o7UgIfZEvf+MOTgbkWNJ/IzTOCN7xLwGatTi0C3wOg=;
 b=MSLdzvUSUNzZXR/59BFUBpdCxSYfCGIrng2O8lKz2EWAtiV2rzmWvm1jkbENySGn4/QZxaXhiyrHlTFCYSL5rp1xdAJHb+jS7SYfKvuobjCLDwF4H930a7O4kiOHZkcjsX8veqx1ScfnqE2TuP17tdzzC+ZLASiTt5JqZclGgSw5TfyfMEwxYyPBZAscBn3PQJa8eZ84KM8i0L2v9DA3jopZ/SyEt/laAycOHAT5W6PXXxRtdiODek/7CLaZbFrtQzr3BL4wJABlrHhP35huQ4PtnLcgAuKGiFVWgVsuDNZmpz5KhFxKMztRXjWIptQro1p7kLaAfBUkER59ZNR5NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3o7UgIfZEvf+MOTgbkWNJ/IzTOCN7xLwGatTi0C3wOg=;
 b=HdVZnDxcdPpw1D4flIf7VUEmzYfwnBhH3RXnUJhCDLg4yzeI2IPPn7IV394fC+D6gl9Q0MJqHK7o75ijaNldIpD+SKjuffqiTEip3cj1pCVEEBNIN6N+go0/44vCPguPBZkM6qAVFEeHHUJMaJTQ27ePSAb/1NorscTv2Ul6lGhVGMsOqMGW9a1t5G0Hav30oNeoVDgXAamGz77qRaDSf0CMc52tmsw4lrvr5kpUkhbwF/NlShSB+QBUT+qOmmaBrnnXtxoklphJzW5YOyYt5nAvmfYT7CHR6UKmX0ogyjXMtmM0YvVEQr9ch4ecnZPyhYtUGUngWf88/f2p/B1eoQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS5PR04MB9875.eurprd04.prod.outlook.com (2603:10a6:20b:652::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Mon, 29 Jul
 2024 04:47:28 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%2]) with mapi id 15.20.7807.026; Mon, 29 Jul 2024
 04:47:28 +0000
Message-ID: <2488314e-7a0f-406c-acec-ee106038f238@nxp.com>
Date: Mon, 29 Jul 2024 12:47:58 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] ARM: dts: imx53-qsb: Add MCIMX-LVDS1 display module
 support
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, saravanak@google.com
References: <20240726065012.618606-1-victor.liu@nxp.com>
 <xoj4sypxndql62k64ztmco5ufddeysp26fyc46prwr4ezik223@sssy5zmefwtg>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <xoj4sypxndql62k64ztmco5ufddeysp26fyc46prwr4ezik223@sssy5zmefwtg>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SI2PR02CA0034.apcprd02.prod.outlook.com
 (2603:1096:4:195::9) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS5PR04MB9875:EE_
X-MS-Office365-Filtering-Correlation-Id: 31259253-21df-4e5e-9782-08dcaf898c7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RDNBeDYxWnduU0ZmNWtRYlZkMy8zU05FeDRpdWlYMW5XKzFDaFNiOW9nS1BW?=
 =?utf-8?B?UHl4LzJPcnFlZ1QyVDBaT1RjMDBJWXRRNGRHT0lJUGhCM0tFYWgrY0tlNGNQ?=
 =?utf-8?B?L01ZV0FES1p6ODcwaG1KalY1TzZmcHkvR2FXKzJ3VlhvQnAwZlkzMnRMV2Jz?=
 =?utf-8?B?dGt6Wk9hRzZDN05QdVhvemhRNFlvZnFvMTF5S3dNcEplcmNvbE1Fa09pZFM2?=
 =?utf-8?B?WXdxdm4rSmc2bHc0b3VIbDZ5UmVqTHhvcEVybkdCZTk4MHBFOTVub3RUT0hp?=
 =?utf-8?B?TGxOVm9yckhUdS91SGlvMTV1WmxtK1FsZk1WUTMxUHJLOHdSeVkvY0htZGFE?=
 =?utf-8?B?UGx5RHN6SzZmS2tZQU40VzhzZHRjSS8wRE4vaFBDM05ZS3VjalRkOFdqVTll?=
 =?utf-8?B?ZHV3SUlqdXpvdnFXNDhxV0lOS0lXWEtOclJhZlcwRUpQZ3VKK21VZWtSN3E0?=
 =?utf-8?B?dnUrLzhpendFVkVNNURGeE53dTlqWXFFTE5BNkg2L2ZwWXNZNmJ5OEZEaWpp?=
 =?utf-8?B?M21yL0JZSmNPbUR1VmN5Y0d2eFJCclhqTkpnZEdVTi9PdmxCNVB4MDhodCtZ?=
 =?utf-8?B?MnQ5ejAwNHhycG5LazYrby9ENlFLaXVVcVFPWm90S0pCWDRSbVdpTHVmd2JO?=
 =?utf-8?B?V3hTYmRYYVV3TlU1alpIU0lmYnBBTGJRTU9sb0d0ZVUzemhrbTh0enVLWWxx?=
 =?utf-8?B?dFhHNGxmamRHWUpaYlhMd3A1dnVhSTBsdDEvZHVDb05KRFpTMzJiazYwK094?=
 =?utf-8?B?cUxjTHJQREFTOTB1cGh0bG1ETzNybHlOdmtYdFFPMWxTanhTeFpadzllRnlY?=
 =?utf-8?B?bGVJcUNRTGRnTVFHYW5NNjlCRzhmWm9vWlV5WXRyYjRrQlFoSGNGSW9KWmV6?=
 =?utf-8?B?S3Q3aGVkMWZzdE1uWGxnbDgwR0FHMmFnQTMxZnVIZnNqc3kzd21lT0ROWERQ?=
 =?utf-8?B?WVd1MHBkM3krOStFWTdzMmhaRTdWQXVOMGtIbjZKMnpVSi9BdGNaNUcvNDhW?=
 =?utf-8?B?L2k0OGhjNHo3Q2lTQzdpUFlXcHlDQm4xSlBLN0lhNFJXMVd6blhqZSt3R0tJ?=
 =?utf-8?B?NnNkaFI3M3VMYkxlNERLcngydkFxNnFhYlNqV2huaVBkMWJSZEhqL3NHaTZX?=
 =?utf-8?B?NG5YMGYrWnhkUms0YVdEWWlPaFhYdnpBZE1hUk9QU21oeVZOZ0J2YmpNbjJR?=
 =?utf-8?B?L3MxRHVFVHloTkhBRlU3WVFaMmxBQUdCNE1YYWZhOXlrMGNPclRiTGpnajAr?=
 =?utf-8?B?Q3dQRDNRNVpKNGsra2ZkbmNCMTg0NkJERjZERzZEMmY1Yy8zbUFnR1RxeE55?=
 =?utf-8?B?L1orc1dwSWZVclJFeDkvYmFveVN5dzdvSStYQmgxa2thNXovVEdvd0lRdDRC?=
 =?utf-8?B?UjBQaTg0ZXM1OXI2VjRWRnRPMFNOaTU2ei8yNnpmVlJVYjNrMnBTS2lJK2hi?=
 =?utf-8?B?dUtGODY3d25waEVkVURPeHpoL3R2QnNRR1BMeUlHYnFVVmZjU2ZHRGRaK29N?=
 =?utf-8?B?WlNVa0lXTU9Rb09Fa2l2R3g4YjJTSlVMOGV4Vml1MzVIRGZNRWNFeXdFUkd1?=
 =?utf-8?B?Y3VHanZvMzVuTTZ5dmdINW1HWHlnRnVsYndNUDQ5cFVsdWQ1NnlDQzU2ZVRC?=
 =?utf-8?B?cFVFeU9qbFU0QVhEQmNSeHVRcDZIOWtEMDBYOEJrSDZmWm9HWlMyc0RCenFT?=
 =?utf-8?B?QTg0ZjJKbkxoUElYb0Ywa0pnWDdwYis3VGxzempXMktHaVloN0MvbjdWbS9m?=
 =?utf-8?B?czJSNFZmUXBaNFd4NmlwK254Uk5uREdqWDZ1QTlnRGYrWDhXT1hyZDE4WGtZ?=
 =?utf-8?B?alQ0Uk4vS0dCdlh5RVJMdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dUlhRC9Pd2E1Nzc0YzZhRGFjc1VxVzhWekJ0TWxIK2grRXpuclJ5Y1BxOE9i?=
 =?utf-8?B?Y2l0OTRaM01xODRJTGRMelhFcUE2Wm55UFg2dURuVmpYeHJMa3Y3SCtUb0Jr?=
 =?utf-8?B?aDVJOVphdzllMitpbjFNY1NoT1V5cnRYOTYrb2dwdXBBWmVRUkl4bEhzZ2pr?=
 =?utf-8?B?dUZIRjlOZzUvMDM5UXh1dmZqMU5GcHFDa2hGd09VWnd6UzhUNkN2VytSQzg3?=
 =?utf-8?B?Rm1aVkZGMU42SXUxdld3TGpTU1FnSnBFdFNydzB1TFluczVINW5va0RGeUh3?=
 =?utf-8?B?WXlzZk5LWlJxZ3JldEJaa3dnUmdUdDM1QlZ4ZjVpWlh4RGNBL2R5Y0YrVHVI?=
 =?utf-8?B?Q0dGTVJPU3lXTFQvQU9lNVl2ZG03Slo3SlpuU2MwTGw2dUhHNUVXVFpxalNx?=
 =?utf-8?B?S2FJUWNDMk1XWWp1eEFDNFVOdTF0WEdxSlRXc3ErZENwcUZmNFhNc2wwQW9X?=
 =?utf-8?B?N01DN3gxeWdmSGMvaXIvS1pDOW1ZZFZhV3VEbTZGTkNtaWJ6ZlloQS9OTk15?=
 =?utf-8?B?YytTWFZFeFB5NEZLT2wzb1luOWpWWVVZN2tYQkJER3VsVzJrYWYyUVl5d3dR?=
 =?utf-8?B?UVRmcEViZnBJM202R1l3NlZPQXZ0OEhZOTJrVlZ0OXZQSDZIZ2RFeVVPNlhK?=
 =?utf-8?B?WUhwOVFTUC9wYzlDZ2w5VWIwOUljTDJGaWpYTVZPRURybTB6cU53Y0RTQTZU?=
 =?utf-8?B?K0F2RXlaZ011TE9IeFNIdC9zZ3krMmhEM004WE5nRlBGWTV5SjU2dlNtOHpy?=
 =?utf-8?B?WmJoRUZUZHNoNFdnTlJoK0xEeDd0cTJlQzR2K0ZDTysrQXd3RmZ0VVVnN05T?=
 =?utf-8?B?WG42cHNhaTJDaDVIUmtMOVg0T3krdG1wc3VVUitwQmhERkhsdVJ6UlRXcTFR?=
 =?utf-8?B?SVZ2YzEzeG1YLzZrbWoyNk1zeVFvempwZnFtaDIrQW1pSi9PZjgzeEU2ejFY?=
 =?utf-8?B?L1luNzRyQ3lIYUpXU2dsMnR3bVdya1ZHdUdLbkdPL0dwUUNIZjhDZ3RWSGxB?=
 =?utf-8?B?MGpYcWl5VjlmaDc1L2t1MkVZamxOQWs3WnArOWVWbllhRjN3TjNTKzdYT1Zr?=
 =?utf-8?B?aHVueXo1T256bXNwYXBsYkw0STg1Q0VmSjlXYmhDd3dlNFYwR094Ky81V1VL?=
 =?utf-8?B?YTFYQ0V3bEVZQ25mdTFiekNGSTRPRW1MTnZNWlJ0WDFOVnlwZmdDYm92QWxh?=
 =?utf-8?B?YkI2M21paUpnY0FsV043NjFaOUhwbjBpcHFvSDc1TUJVVVVYVDJXMW1uVzBM?=
 =?utf-8?B?b21IWFcwTHhrVUZ4YXI3Q1lxVXI0UlZhMEZPV1YwR0N2RHJSandUa05zUEVI?=
 =?utf-8?B?N28zNXRITHBGcTgyc1V0OU5UWGovSHhJckZxR0NMdm92SGQ5ZFNFWHU3cndW?=
 =?utf-8?B?T21mMThzUm1OUmxBZU5IV3VCbDNaSVlva2dNRXhrdWQ3TGI0c2dqN2NuR2Ix?=
 =?utf-8?B?ZmZtVlV6OVp6WlBsNVVmYk81Y3A1bE1kZm0rd2ZQNXFmcEJJYjJlaVVjVTcr?=
 =?utf-8?B?dEROMUxEWXpqYzVjeWRNKytRcFB3SG0wdVRNQWZQRnFoTEo0N3FjcUxVWWFy?=
 =?utf-8?B?QUUyV1p1SFB2cUFvVW9rUFo3M1JmVGc1dlBRZjh5bFlKaHZnN05lK2g2RGpq?=
 =?utf-8?B?OEl6Yk9mN3N5ekZqWDhNVFIzditQYll3Ykc1YWxMMGxaaVk4Q2VndnM4MW9V?=
 =?utf-8?B?U0xZandlQnZ6NWxLUE5EUHBxOE1WSDR6TGJocktPQWY1VUd0Y0t0OU9pNUVQ?=
 =?utf-8?B?a3hSWVlpRmk0b3pQZzh2QkdzZ1JSTUd1NTIxSUU0QnFIS0s3QTZHRk43SWRi?=
 =?utf-8?B?Tmd0TGlhWUQwOUVzaFMwMi9jVk9LcnFwM3RleGZIVDR1UGlmWTZhMUlOVGsz?=
 =?utf-8?B?SjhQV2xwT0wyU212bzNmYWpZUnRldncwN3J4NjN5ck43cm5pQjVkSmdaQ0RD?=
 =?utf-8?B?djhtcWZOWTdrTDY2UGJaMTVhQnVYNHVBNlZLaWQ1R1RxNWlEWEQwUzBGcDM3?=
 =?utf-8?B?bnFIWDJJZnNyUFJBbFl1TW53VU5WK284M3RuVWgzcEZ5QUVDNFFISTJrZGM3?=
 =?utf-8?B?MDgvZ2l2T2dCWThSNUlGOWNsZzRmcXM5TW5wb1VQQW1zZDMvTDljTk84b3l4?=
 =?utf-8?Q?nV/5k1WrrE6gmmgB6lDzEJJiO?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31259253-21df-4e5e-9782-08dcaf898c7e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2024 04:47:28.3147 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zzp1FC1wCFLqPeVRJhXOmyTDm0X+a4x3vrffPrsGsIakmG9W65ygunYd1ACORjbgZb5R9fWDOWKfgLxefUS9EA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9875
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

Hi Dmitry,

On 07/27/2024, Dmitry Baryshkov wrote:
> On Fri, Jul 26, 2024 at 02:50:12PM GMT, Liu Ying wrote:
>> MCIMX-LVDS1[1] display module integrates a HannStar HSD100PXN1 LVDS
>> display panel and a touch IC.  Add an overlay to support the LVDS
>> panel on i.MX53 QSB / QSRB platforms.
>>
>> [1] https://www.nxp.com/part/MCIMX-LVDS1
>>
>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
>> ---
>> I mark RFC in patch subject prefix because if the DT overlay is used, both ldb
>> and panel devices end up as devices deferred.  However, if the DT overlay is
>> not used and the devices are defined in imx53-qsb-common.dtsi, then they can be
>> probed ok.
>>
>> With a dev_err_probe() added to imx_ldb_probe() in imx-ldb.c, devices_deferred
>> indicates 53fa8008.ldb and panel-lvds kind of depend on each other.
>>
>> root@imx53qsb:~# cat /sys/kernel/debug/devices_deferred
>> 53fa8008.ldb    imx-ldb: failed to find panel or bridge for channel0
>> panel-lvds      platform: wait for supplier /soc/bus@50000000/ldb@53fa8008/lvds-channel@0
>>
>> It looks like the issue is related to fw_devlink, because if "fw_devlink=off"
>> is added to kernel bootup command line, then the issue doesn't happen.
> 
> Could you please fdtdump /sys/firmware/fdt (or just generated DTB files)
> in both cases and compare the dumps for sensible differences?

I fdtdump imx53-qsrb-mcimx-lvds1.dtb and imx53-qsrb.dtb.

I see three sensible differences.
1) panel-lvds node position.
   For imx53-qsrb-mcimx-lvds1.dtb, it comes very early and is next to
   'compatible = "fsl,imx53-qsrb", "fsl,imx53";'.
   For imx53-qsrb.dtb, it comes later and is next to panel node in '/' node.

2) properties order in panel-lvds node.
   For imx53-qsrb-mcimx-lvds1.dtb, it shows
   panel-lvds {                                                                 
        power-supply = <0x0000001c>;                                             
        backlight = <0x00000030>;                                                
        compatible = "hannstar,hsd100pxn1";                                      
        port {                                                                   
            endpoint {                                                           
                phandle = <0x0000007d>;                                          
                remote-endpoint = <0x0000007c>;                                  
            };                                                                   
        };                                                                       
    };
    For imx53-qsrb.dtb, it shows
    panel-lvds {                                                                 
        compatible = "hannstar,hsd100pxn1";                                      
        backlight = <0x00000031>;                                                
        power-supply = <0x0000001d>;                                             
        port {                                                                   
            endpoint {                                                           
                remote-endpoint = <0x00000033>;                                      
                phandle = <0x00000017>;                                              
            };                                                                   
        };                                                                       
    };         

3) No 'lvds0_out' and 'panel_lvds_in' in __symbols__ node for
   imx53-qsrb-mcimx-lvds1.dtb, but for imx53-qsrb.dtb they are in it.
lvds0_out = "/soc/bus@50000000/ldb@53fa8008/lvds-channel@0/port@2/endpoint";
panel_lvds_in = "/panel-lvds/port/endpoint";

BTW, reverting Saravana's commits
7cb50f6c9fba ("of: property: fw_devlink: Fix stupid bug in remote-endpoint parsing")
and/or
7fddac12c382 ("driver core: Fix device_link_flag_is_sync_state_only()")
avoids the issue from happening.

> 
>>
>> Saravana, DT folks, any ideas?
>>
>> Thanks.
>>
>>  arch/arm/boot/dts/nxp/imx/Makefile            |  4 ++
>>  .../boot/dts/nxp/imx/imx53-qsb-common.dtsi    |  4 +-
>>  .../dts/nxp/imx/imx53-qsb-mcimx-lvds1.dtso    | 43 +++++++++++++++++++
>>  3 files changed, 49 insertions(+), 2 deletions(-)
>>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx53-qsb-mcimx-lvds1.dtso
>>
>> diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
>> index 92e291603ea1..7116889e1515 100644
>> --- a/arch/arm/boot/dts/nxp/imx/Makefile
>> +++ b/arch/arm/boot/dts/nxp/imx/Makefile
>> @@ -46,8 +46,10 @@ dtb-$(CONFIG_SOC_IMX53) += \
>>  	imx53-ppd.dtb \
>>  	imx53-qsb.dtb \
>>  	imx53-qsb-hdmi.dtb \
>> +	imx53-qsb-mcimx-lvds1.dtb \
>>  	imx53-qsrb.dtb \
>>  	imx53-qsrb-hdmi.dtb \
>> +	imx53-qsrb-mcimx-lvds1.dtb \
>>  	imx53-sk-imx53.dtb \
>>  	imx53-sk-imx53-atm0700d4-lvds.dtb \
>>  	imx53-sk-imx53-atm0700d4-rgb.dtb \
>> @@ -57,7 +59,9 @@ dtb-$(CONFIG_SOC_IMX53) += \
>>  	imx53-usbarmory.dtb \
>>  	imx53-voipac-bsb.dtb
>>  imx53-qsb-hdmi-dtbs := imx53-qsb.dtb imx53-qsb-hdmi.dtbo
>> +imx53-qsb-mcimx-lvds1-dtbs := imx53-qsb.dtb imx53-qsb-mcimx-lvds1.dtbo
>>  imx53-qsrb-hdmi-dtbs := imx53-qsrb.dtb imx53-qsb-hdmi.dtbo
>> +imx53-qsrb-mcimx-lvds1-dtbs := imx53-qsrb.dtb imx53-qsb-mcimx-lvds1.dtbo
>>  dtb-$(CONFIG_SOC_IMX6Q) += \
>>  	imx6dl-alti6p.dtb \
>>  	imx6dl-apf6dev.dtb \
>> diff --git a/arch/arm/boot/dts/nxp/imx/imx53-qsb-common.dtsi b/arch/arm/boot/dts/nxp/imx/imx53-qsb-common.dtsi
>> index 05d7a462ea25..430792a91ccf 100644
>> --- a/arch/arm/boot/dts/nxp/imx/imx53-qsb-common.dtsi
>> +++ b/arch/arm/boot/dts/nxp/imx/imx53-qsb-common.dtsi
>> @@ -16,7 +16,7 @@ memory@70000000 {
>>  		      <0xb0000000 0x20000000>;
>>  	};
>>  
>> -	backlight_parallel: backlight-parallel {
>> +	backlight: backlight {
> 
> Nit: this seems unrelated to the LVDS support

Do you suggest to do this in a separate patch?
If yes, is it worth adding a Fixes tag?

> 
>>  		compatible = "pwm-backlight";
>>  		pwms = <&pwm2 0 5000000 0>;
>>  		brightness-levels = <0 4 8 16 32 64 128 255>;
>> @@ -89,7 +89,7 @@ panel_dpi: panel {
>>  		compatible = "sii,43wvf1g";
>>  		pinctrl-names = "default";
>>  		pinctrl-0 = <&pinctrl_display_power>;
>> -		backlight = <&backlight_parallel>;
>> +		backlight = <&backlight>;
>>  		enable-gpios = <&gpio3 24 GPIO_ACTIVE_HIGH>;
>>  
>>  		port {
>> diff --git a/arch/arm/boot/dts/nxp/imx/imx53-qsb-mcimx-lvds1.dtso b/arch/arm/boot/dts/nxp/imx/imx53-qsb-mcimx-lvds1.dtso
>> new file mode 100644
>> index 000000000000..27f6bedf3d39
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/nxp/imx/imx53-qsb-mcimx-lvds1.dtso
>> @@ -0,0 +1,43 @@
>> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>> +/*
>> + * Copyright 2024 NXP
>> + */
>> +
>> +/dts-v1/;
>> +/plugin/;
>> +
>> +&{/} {
>> +	panel-lvds {
> 
> Nit: Just 'panel' should be enough.

Nope.

'panel-lvds' is needed to differentiate it from 'panel' in
imx53-qsb-common.dtsi which is a DPI panel.

Using 'panel-lvds', procfs lists exactly the properties needed.
root@imx53qsb:~# ls /proc/device-tree/panel-lvds/
backlight     compatible    name          port          power-supply

Using 'panel', more are listed.
root@imx53qsb:~# ls /proc/device-tree/panel/
backlight      compatible     enable-gpios   name           phandle        pinctrl-0      pinctrl-names  port           power-supply

> 
>> +		compatible = "hannstar,hsd100pxn1";
>> +		backlight = <&backlight>;
>> +		power-supply = <&reg_3p2v>;
>> +
>> +		port {
>> +			panel_lvds_in: endpoint {
>> +				remote-endpoint = <&lvds0_out>;
>> +			};
>> +		};
>> +	};
>> +};
>> +
>> +&ldb {
>> +	#address-cells = <1>;
>> +	#size-cells = <0>;
>> +	status = "okay";
>> +
>> +	lvds-channel@0 {
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +		fsl,data-mapping = "spwg";
>> +		fsl,data-width = <18>;
>> +		status = "okay";
>> +
>> +		port@2 {
>> +			reg = <2>;
>> +
>> +			lvds0_out: endpoint {
>> +				remote-endpoint = <&panel_lvds_in>;
>> +			};
>> +		};
>> +	};
>> +};
>> -- 
>> 2.34.1
>>
> 

-- 
Regards,
Liu Ying

