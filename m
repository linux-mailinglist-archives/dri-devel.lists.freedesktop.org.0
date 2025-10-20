Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B78EBEF5CF
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 07:37:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62DF610E255;
	Mon, 20 Oct 2025 05:36:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="FRq0JhFA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013059.outbound.protection.outlook.com [40.107.159.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FF6C10E255
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 05:36:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GG68on0cT9nhZ6NHf43U9ZIcnUXwIsh7c2PmK0LJKnFQAzwuOB7hni3d+F3IcIo8bGvaC1WxlMynIPnE1xYao64BH+E2RWzsCux9kFZXoSpuInoGv5g0eR6MMhUTksVrqDYNg/RfY0vVuehyeoc/rFnyQ9CYg6ci/3Dfzh4WQ+dW/M6ueIqysGdmY3gcMAUf1bw7np3ajC9/dY+hUMWj8YFY89hUqpVXa+4zzExM+9yEK+S8eI8zFdze0QPt0KcS8BWsDjqbXQT8DGRvzCQKjXRMB2CFdNV98NHG/3TwwMLj5SjF1uuXDQWeaF7e/Kcqgj0wB0H/aFv61vZLUKAfQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NdUaAlI5OkxI7HJVnWxsXPZ1CIqiw0vwrwxKUZuTh5Y=;
 b=L4/dXT8Tk7Gb26+fm/sntrmIbFuTnwD2Cwu+QJ8KERmTRGbb4aBNO78tDcpeNnf4X3AB2NQnfmev+qMumqQ6nh2kzzgefC6lJG/3pg077mSFpdcq6oV7TVAQOODevyw43G1vrTy9YMxdPVwyid+qiv8GFc1wb+D6Q0mfmB/EoM0xHyoFjGZ+42zboN6Rr0yPTa57wO8KxGKdEG5NOLzkv0H9CDe3fMZndy7LNj/j1r9sgtwwmZ80vyRDFdADZpydSUY6StutBoE2EOsdi7B9QQwKM1itqGN7a/BBFkEKvu+Dm/qU10VIKBN5ZnD+BKSCQeC8e+9NRAI5KM4q7HRSEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NdUaAlI5OkxI7HJVnWxsXPZ1CIqiw0vwrwxKUZuTh5Y=;
 b=FRq0JhFA1mc7FB+4kFvdqy3ArVSUiB+I0qmPkiOFZeEd+JFIawhF3YCn+351A28alnDxxcmUMNxsYy/RMGLwVIO/TvKPIvqVmXSMvih1lwvd9Df5Fvn8c//P0yQx4HyVLvUCKrFBWLEuHoQ5BuI0FZx+oQzH1w2zkmTQijKOKRHDgCibIojy1CkmLoo3wlJ2c/XZnEulcQ63eDxpUARsKuwoG5dEVpqQ5Zv4CYVr7otc7AJXTenWJxC69M9xgSFPDysr3FUHOVlu1qTjWajDTUMedieH+3APblrfr2bPtKKE4pmd6dTGBKx8Nl8lpD13Um/VJEOcemM1VECTygisLg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM0PR04MB6883.eurprd04.prod.outlook.com (2603:10a6:208:17f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Mon, 20 Oct
 2025 05:36:53 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9228.015; Mon, 20 Oct 2025
 05:36:52 +0000
Message-ID: <c0ebafa0-403b-4576-965d-50f3db259fa1@nxp.com>
Date: Mon, 20 Oct 2025 13:37:16 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/imx: Add more RGB swizzling options
To: Marek Vasut <marek.vasut@mailbox.org>, dri-devel@lists.freedesktop.org
Cc: Abel Vesa <abelvesa@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lucas Stach <l.stach@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
References: <20251017144626.66918-1-marek.vasut@mailbox.org>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20251017144626.66918-1-marek.vasut@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR06CA0008.apcprd06.prod.outlook.com
 (2603:1096:4:186::23) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM0PR04MB6883:EE_
X-MS-Office365-Filtering-Correlation-Id: ff48230f-8fc3-4796-9918-08de0f9aac63
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|366016|376014|19092799006|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dEJKajJvYTd1WCtkYjRyY0JnUWVrNDJnbHowT3FJTkU4dWgxZzV1VE5IZitv?=
 =?utf-8?B?aFZHM0lJdVBRMHBRQnpaa29Fc3pEd3hSL056MjdsVlZaaWNDbWlzZ1BWcDE1?=
 =?utf-8?B?QkQvWE5JNDE0ekVvaHU2eWx0b2lieFJDMVR3b3ZabktuekhGSzBCQ044eVVR?=
 =?utf-8?B?STVCZ0Q0b2xQNGZSOS9EMkxQOUQvOW9scTFyZVVWL1djQ2VkaDVveHBZaEpD?=
 =?utf-8?B?enBNQjZ6Q0xXV2xLYktYOTV4VkZDZHhDNzJleUJPYW9pQ3lGSUk4QmhmZFNt?=
 =?utf-8?B?WjcxL0F1cTB1TW9QbWNIN1h2S3hFWG5NcTBvdlpma0hlUWJTVUtUNU11NVN6?=
 =?utf-8?B?VytLSUNXdWlmcVI0UXpMeDJhdStJZGRBS2JVcVBQNzBvWVRkWjU1WjhGcXQ1?=
 =?utf-8?B?aUdSWUpXZHlCWW9xYmt5VVNwVHJ0MlRlMTNXQnU1QjRQUlJZNFZ2S21Xcm9i?=
 =?utf-8?B?djl2eDJSbDkxeWh4bEJNcmk5ZDFTYnczdHByTXJTbFdXL240NitBMTBoME5t?=
 =?utf-8?B?NS8yWUJyM1ZBUUdYOHNHaC9GM0IxWXdHdnFxT1d0ZW5ITHZzam5WekdCTkFU?=
 =?utf-8?B?ZURyeGgvN3RPYUZVL3Q1MDZiRVI4WkU1Rjc3Y2Iwd3hkWVFsUWdFc0tEbXc5?=
 =?utf-8?B?U1JZRWYzR2pFUDJJUTN0NFluTWZCb3ViMlNVZURaVkZ0WnpQcGhUQVJCT3ov?=
 =?utf-8?B?ei9XN2NpeGVjMFlTbFJzdFR1TGFFRE9ueG04M0lIbS9DVm8zRDIyNU9NTlRO?=
 =?utf-8?B?VG9Hbi9acEgrWXVIWjNuK0l1UVRyWTJHWTlZdkdBQXYvY2pUZXF1eTRTaWZN?=
 =?utf-8?B?SkNXRm5ucDNpMTdtYVJBQm9CelUyQVhsOXpxR25EK0FKZk5yWDRRbTJOaGpo?=
 =?utf-8?B?WklUc3ZUdHFhcmprNUk2Uk1uRTltcHFyWnNTUllBbFBlY3NtYnBPSUlTbUNr?=
 =?utf-8?B?M2d3aTJOandoRktGSFR3VnV2alFIT2NNYnNhNE5KOFFwVTNSajRXdmczRlor?=
 =?utf-8?B?YUQ2MCtLZnEzR253T1BtOFpaMDVudnMwYURQa2xZKzNHWGRaY1EwZ1MxM0c1?=
 =?utf-8?B?MnJNSDNZeDdEMHpEZng0TXJib3o3OUlqVEFqR3AwNG9tbnRXTFd0UXBvRktU?=
 =?utf-8?B?RUd1d0ttWHJ1eGRGU29MeEFtTForVjNUcUhlTytwa3VXcDBuSjJQQ2djeWdX?=
 =?utf-8?B?YVROQ01lbGZKYlU2ajBWZDdwZndzbDJ6YStBYVIzVkhMcEw2NXVXMXJSamVh?=
 =?utf-8?B?WUtTM01WM3VhSytRbnp2RmV3NkdNRnJYVWFsQ3NuOGFnUzN4MWVHOUlPR05t?=
 =?utf-8?B?VWVWaHVXYnZMVHJla0FoRHJTckVMbHZFUkRFMkhJcUVNK3hUakl3U1pwQUxu?=
 =?utf-8?B?SDRDWjNsMkZBb2I3TjlIc1dJTjRqN1NPV211bFhkTnhZNVFjLzc1UkFUQi81?=
 =?utf-8?B?V3FOVy9VYnZCSnZnNHNOTWVRQmQzYkQ2RFAwM2VyVFNRS3VvalFzWXM0MWtO?=
 =?utf-8?B?aE5yQWNlNmpzbVpKQ0dTYXd5L1RDT2VuYWxBemx3WThzWWJZblU0STF0WGhS?=
 =?utf-8?B?Yjk2eG1USUE2eng4TG9pRjlGU0ZqVDFsSU5hMzhqTU5relFyQnc0SG82MmRn?=
 =?utf-8?B?NUxNWmtFTkZ5V2VlTXRhS2NBZW0yR3J3VjVoQy9wSG1RN05IRU9LUk85N0Nt?=
 =?utf-8?B?Nys3MjZkSU0vclNtN2Jra0YrNTlDWWNzaXZVOTBncVVZMXhseTZrbitNT2hH?=
 =?utf-8?B?UXpldEV1UEoyVjh0bEVwc3FrSmlNUTNCcS9BVHM1SXNHV0NWWktZeDRKZXlR?=
 =?utf-8?B?ckZYQzZJWG84V09kcStORk5MTzNjcGVDRnoyMWFVQlVqd3BwYzNZNlZLZzBF?=
 =?utf-8?B?a2g4VUtxRG1kUFJNdXZKRmpBQStYZVJKR01UeG92cVgveDdVWG5vMWlsYWJD?=
 =?utf-8?Q?XitmhvyulLEm/nEDqv2mrgfQTfSc6Ysx?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(366016)(376014)(19092799006)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T0hIYVZFK0NZcUpmWEJLbXBTRzJFMXRHWnZjVTIvRUhBcGN1WXBRaUlISFpN?=
 =?utf-8?B?UlF3NnR1c3ZDSEFTVFZSN2dIQ0I2SVkxY1JnVTFXem8zSmNpQTk5eXRnTDk4?=
 =?utf-8?B?L29Bc0RQcUE5MXB3VWphQ3pXRmRsS1hxMlZUNURzenR6emRqalp5eEhvYjg5?=
 =?utf-8?B?dnRCbEhiMCtXNW9EOFBVSkNwMVk2bUN0N2l5SFNza2ZVSS9GVU9aWWoxUkNa?=
 =?utf-8?B?aHNRdlVpdUVBYjVtUHp6elJTcWdJV3RoVlQ2ZDZSTjgwTktsTUhFb0dQMlFJ?=
 =?utf-8?B?OTRPUVo3Qll3dEJsRzdiRmtCYWx3MFRyWVkyWCtFNTF4d0s3WWd0NlVwakNl?=
 =?utf-8?B?ek92elRNU0s0STBrZU5xdUJPUWtFcGkvRFpKWTVTUkZNbU0yZW80K0g0ZC9x?=
 =?utf-8?B?Q2RkQ3diM2hmSlhPRTBrMkR3MXZ6YkVzc2JaVU1ORjNHVXRjak5VcnQzaDFj?=
 =?utf-8?B?TjJjeDQ3Qnl3VUtWZFpoQmI5WHFJYnlpNWgydERmWURsUE8zRVJNZmYvSkNK?=
 =?utf-8?B?MXpKUjNaNmlranM4ditJSUM1cm14bjZsaTJGWUpYaVFYRVFmWXFuSWJGT0R3?=
 =?utf-8?B?d0NCVWZCbEUvWG1jUTNFc05yeXp6OG9Md1QzYlpVTnRMeFJheHVIRmVjRllp?=
 =?utf-8?B?VHdZaUIwZ1RSb0VLRVBMbnlOYUhMWndvaEhZTGZvSk9rMW5hMzFmNkFkeEN5?=
 =?utf-8?B?SFQveHA3N1REc0VPblZuVXNIOUp4K0NqZ2hpS2Z6R0dBNlQ5aWYzMWNYRWFW?=
 =?utf-8?B?dXUzblAxaWttNm9SbmFIYW5ZczMxWEt4L0NpTWhMdEp4V05oL0ljeWhWM1k4?=
 =?utf-8?B?NkN2a0xOK3h4c2NJNFRLTEhIMXVrQm1ZWmpPcHlhNHYwc1c3Rm9wdnYyNEFL?=
 =?utf-8?B?MmYwUlIxVnRmUVlQaHROWHpZVjNtaWh6d3h3cVhSSThCZzkxSnJ6ZnBieG9H?=
 =?utf-8?B?RWVFNDE3NEhubFBBQlJjS3Q5WTNuSG5GaUJCU1lGUjRRd3lwVzFWVjMzNWYy?=
 =?utf-8?B?V1pzMWFtbXRFOFRlbytrZzlLaHhpbVV1blYvL1E2ZVFucUZhRThXUlNVNFh1?=
 =?utf-8?B?MndXSDJ1Ym1Wd015ME5kWVRRY3FKYUhjNFpNaldRdlVpcFF4d3BxWFh6cFlI?=
 =?utf-8?B?ckNxMDNQT2ZkemsvSUsrVG55NC8zNVVnd2J1Y0V5NTlGRTNoQW0xdmtIUFll?=
 =?utf-8?B?UDZhZTRnL3dhTS81NDFBbnVPbWR5WEJXNkl6WUpNR3k3Ly8zZmVqWjZYbS91?=
 =?utf-8?B?WW9tMVg2SzNqVXlrOUhjMzIxenJtNEVYTDlzdkQ5b3o4TC8vUEtqbEdKam9t?=
 =?utf-8?B?NHBUVXRINEE1SU40eThpUDB0bE9qcVhOanV3eXQ1VmdXdjNleGZpay9ibWFV?=
 =?utf-8?B?eVlkVDRSckRZT3VJTDF1eXNsTHBaaDlzUlJORndFekthTjVycURuYjljcHBp?=
 =?utf-8?B?elRLNFJYTkJpdDZmMWtkenI5bUZRNXo3VEE4MzRZUUdmTEJvenRXTlpDdUtE?=
 =?utf-8?B?cE5Yam5UbmlOVnlHdHBPR29rUytCM3ZVS2xrbE5KaWhFVmt2bHVmUUhybGVv?=
 =?utf-8?B?U0x2a2lZV1M5c05IUDYyUHJvMUxrRzhXRGtEWk5ORjc1Y0c0a1E2cW5Md0Jx?=
 =?utf-8?B?aXBwOFlSaDcxODRySXBQaGRqdnk4Q1J3WUF5aytsL0w3LzN4UC8rQ2JvSVY1?=
 =?utf-8?B?VTRmTndPZ1lRMjViOXhMUlJ1ZmtRRDhrMldlRTlxOEI0cHF6ZGtNUXNMRDFB?=
 =?utf-8?B?MGJTeHIxR3J6UXM4eFFIWEJzRDMrUEtWNDAxWU1DeE5vak5xRXFWKzFmNGMv?=
 =?utf-8?B?VFVhMGlxZUoydE1sUC9GTlR6TGkveTFDTFU1QVpWd3VkQW0xV25Cc1VpbnJo?=
 =?utf-8?B?UUNFYVVKd3BYdWxVdlc5dkkySk1TckhLOElyWHE0SkdXb3hweDcybXptTVpm?=
 =?utf-8?B?ZjhINW9YcjRDSk9hUlNzY3ZPUGlhbnpPUVpHNE5NMDRPR25Cb0dGQTcxcFdJ?=
 =?utf-8?B?QkN0d1pzV0VXdDAxakhLc0EvTVdFdTE0OFg0MVVjaVRyTW0reVBJamFWeUdM?=
 =?utf-8?B?TGNWbUEwSjQ3cjQ3R0o3OFRUVEc4bFhMM01idCtheWcyRGw3bVdDTDFvek14?=
 =?utf-8?Q?imSUt0mqTuUkb4xmOF5a52WZw?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff48230f-8fc3-4796-9918-08de0f9aac63
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 05:36:52.7482 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cT1WMmVsSHvdwbKBXyQMU16SFmtPdBw3vTTUa6tg3CJztHVffNWASvB7RP2x7byf/YNcMhAEt2MP4SiVJLtgbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6883
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

On 10/17/2025, Marek Vasut wrote:
> Add additional buffer format swizzling options beyond XR24, the
> hardware is capable of sampling other formats, fill them in.

This would make me change my patch series of adding i.MX8qxp DC
prefetch engine support, because that patch series supports only XR24.
But, I don't mind doing that as long as this doesn't support RG24 and
BG24.

> 
> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>

The subject prefix should be specific to "drm/imx: dc-plane:".

> ---
> Cc: Abel Vesa <abelvesa@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Liu Ying <victor.liu@nxp.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-clk@vger.kernel.org
> ---
> Liu, please test on MX8qxp , I do not have that hardware.

I've tested XB24, RX24, BX24 and RG16 on i.MX8qxp MEK board.

> ---
>  drivers/gpu/drm/imx/dc/dc-fu.c    | 40 +++++++++++++++++++++++++++++++
>  drivers/gpu/drm/imx/dc/dc-plane.c |  8 +++++++
>  2 files changed, 48 insertions(+)
> 
> diff --git a/drivers/gpu/drm/imx/dc/dc-fu.c b/drivers/gpu/drm/imx/dc/dc-fu.c
> index 1d8f74babef8a..397af0e9b0236 100644
> --- a/drivers/gpu/drm/imx/dc/dc-fu.c
> +++ b/drivers/gpu/drm/imx/dc/dc-fu.c
> @@ -65,6 +65,46 @@ static const struct dc_fu_pixel_format pixel_formats[] = {
>  		DRM_FORMAT_XRGB8888,
>  		R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(0),
>  		R_SHIFT(16) | G_SHIFT(8)  | B_SHIFT(0)  | A_SHIFT(0),
> +	}, {
> +		DRM_FORMAT_ARGB8888,

Since we only support primary plane and this one contains alpha component,
I'd prefer to seeing it being supported when overlay plane is enabled in the
future, not now.

Same to the other formats with alpha component.

> +		R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(8),
> +		R_SHIFT(16) | G_SHIFT(8)  | B_SHIFT(0)  | A_SHIFT(24),
> +	}, {
> +		DRM_FORMAT_ABGR8888,
> +		R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(8),
> +		R_SHIFT(0)  | G_SHIFT(8)  | B_SHIFT(16) | A_SHIFT(24),
> +	}, {
> +		DRM_FORMAT_XBGR8888,
> +		R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(0),
> +		R_SHIFT(0)  | G_SHIFT(8)  | B_SHIFT(16) | A_SHIFT(0),
> +	}, {
> +		DRM_FORMAT_RGBA8888,
> +		R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(8),
> +		R_SHIFT(24) | G_SHIFT(16) | B_SHIFT(8)  | A_SHIFT(0),
> +	}, {
> +		DRM_FORMAT_RGBX8888,
> +		R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(0),
> +		R_SHIFT(24) | G_SHIFT(16) | B_SHIFT(8)  | A_SHIFT(0),
> +	}, {
> +		DRM_FORMAT_BGRA8888,
> +		R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(8),
> +		R_SHIFT(8)  | G_SHIFT(16) | B_SHIFT(24) | A_SHIFT(0),
> +	}, {
> +		DRM_FORMAT_BGRX8888,
> +		R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(0),
> +		R_SHIFT(8)  | G_SHIFT(16) | B_SHIFT(24) | A_SHIFT(0),
> +	}, {
> +		DRM_FORMAT_RGB888,

This is not in dc_plane_formats[] below.

Also, I don't think the prefetch engines(DPRC + PRG) of i.MX8qxp/qm DC
support this pixel format, though the DC itself seems to support it(but
NXP downstream kernel doesn't support it).  So, in order not to support
bypassing the prefetch engines in runtime(which makes the driver a lot
more complicated), I hope that we don't bother to support it(even forever).

> +		R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(0),
> +		R_SHIFT(16) | G_SHIFT(8)  | B_SHIFT(0)  | A_SHIFT(0),
> +	}, {
> +		DRM_FORMAT_BGR888,

Ditto.

> +		R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(0),
> +		R_SHIFT(0)  | G_SHIFT(8)  | B_SHIFT(16) | A_SHIFT(0),
> +	}, {
> +		DRM_FORMAT_RGB565,
> +		R_BITS(5)   | G_BITS(6)   | B_BITS(5)   | A_BITS(0),
> +		R_SHIFT(11) | G_SHIFT(5)  | B_SHIFT(0)  | A_SHIFT(0),
>  	},
>  };
>  
> diff --git a/drivers/gpu/drm/imx/dc/dc-plane.c b/drivers/gpu/drm/imx/dc/dc-plane.c
> index e40d5d66c5c1f..68d32b76fab95 100644
> --- a/drivers/gpu/drm/imx/dc/dc-plane.c
> +++ b/drivers/gpu/drm/imx/dc/dc-plane.c
> @@ -33,6 +33,14 @@ do {									\
>  
>  static const uint32_t dc_plane_formats[] = {
>  	DRM_FORMAT_XRGB8888,
> +	DRM_FORMAT_ARGB8888,
> +	DRM_FORMAT_ABGR8888,
> +	DRM_FORMAT_XBGR8888,
> +	DRM_FORMAT_RGBA8888,
> +	DRM_FORMAT_RGBX8888,
> +	DRM_FORMAT_BGRA8888,
> +	DRM_FORMAT_BGRX8888,
> +	DRM_FORMAT_RGB565,

I suppose that this patch may support only the below formats for now.

+	DRM_FORMAT_XBGR8888,
+	DRM_FORMAT_RGBX8888,
+	DRM_FORMAT_BGRX8888,
+	DRM_FORMAT_RGB565,

>  };
>  
>  static const struct drm_plane_funcs dc_plane_funcs = {


-- 
Regards,
Liu Ying
