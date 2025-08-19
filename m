Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C758AB2BDA8
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 11:41:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D140310E57C;
	Tue, 19 Aug 2025 09:41:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="cq6bb0fQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011014.outbound.protection.outlook.com [52.101.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 031E910E57C;
 Tue, 19 Aug 2025 09:41:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ymgvOJwvEoZExC4zIwL4pnFAohRpJAvzGNUL1+LvahPkKzelkB6ocr0AVd7oMpRC6xgb+5jnj/wTa5OoLSQs5sjhnt9IDUPTp9YMDgMtaB0HJOmQMWrlv0uIiqV3Egl2ucN9Rhy1wTafEHOdLvAHISs+Edhu02UxWlGnI87NVJce1KIoTcnMlcXerO2Xi2uUvGG6Y6JZ3epQi202Vaom+bkWZdHw3ZWSN1IrsIl+JdtJnrMJfC9mcH+ohliaIEhT71vn/0oL9lEji2eB6rwCBj9sdV69fzThBr3roNjrPwZ4RBGp6hNg/FCEoxPWwFoO/eyCo0GdYedhV0YjpAM4RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zd4S4Oyj7LzsY4k5ljBsjV9vJhP6PpWiL3MzNxBuDQ4=;
 b=i37keZWmbRJijvIJrw+ne21HG49VogUiSPAl94F1yVKtVRO0VYfZaWDXIB8F/Wjnf+DO7BIJA/P/pGdxPA6dVhzmhsze7EBmUcPSibBP36uyLBfR4QKFNVm97XDKdKm2U3p/D5poL4bM/YaydV1JrzoUjMbPGMyZ21OvKZLYPuzXc4GbSdlWtAvriiud3VpYb4mUm8CrHzul61G7MaFVDYnMFKVNrItkIOSZzCiexCTMRzkDaW490ML5mjFp28GwCvImn6kvBBSiATB/Lo/ogc2385CFSioOTVY3wcjpZwrr5oc2sFua0B7QOVqB+V25X67TJjgWgW61DOBJJoTlVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zd4S4Oyj7LzsY4k5ljBsjV9vJhP6PpWiL3MzNxBuDQ4=;
 b=cq6bb0fQkNwoOCxCpcKsFC70tv8SLT+XzHEU1QEs83/28VW8GRrr80Yg5eVwFPVZ3nmsYE/V/eFGV2I7OXe0mb0SszcHay+8x8Mzq1mwPTufVLVr2I8uui9PDh7+GO1weWDkk9HqCUUb9zETK6jog/HS8Xh365NT+X3hjhr+EcthtfOEf9VjxDEKe+dlOVJn5F9PQiLXZVXvtJ0KmAU+d4U/M8Pxp1n3kCp2tXfqDCW35IT5bFM7UlJVv7+jJroH97WrIETxQVB2IyG4rtZTSH2Dwy6ynsMD6fDvSoPf3Zv1S5VntOzAKhVIn7VYE0HghsVrLDQTussBX4I8UnM7yw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PAXPR04MB9059.eurprd04.prod.outlook.com (2603:10a6:102:220::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.12; Tue, 19 Aug
 2025 09:41:09 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%5]) with mapi id 15.20.9052.011; Tue, 19 Aug 2025
 09:41:09 +0000
Message-ID: <e9f2c06d-07ee-4f69-887c-caf5efb59f7f@nxp.com>
Date: Tue, 19 Aug 2025 17:42:39 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] drm/connector: let drivers declare infoframes as
 unsupported
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
References: <20250816-drm-limit-infoframes-v1-0-6dc17d5f07e9@oss.qualcomm.com>
 <20250816-drm-limit-infoframes-v1-1-6dc17d5f07e9@oss.qualcomm.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20250816-drm-limit-infoframes-v1-1-6dc17d5f07e9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0008.apcprd02.prod.outlook.com
 (2603:1096:4:194::12) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PAXPR04MB9059:EE_
X-MS-Office365-Filtering-Correlation-Id: 00aac185-6cc9-4f23-5b99-08dddf048684
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|19092799006|366016|7053199007|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NWoxcE05Rk1MbU4yaG9kOTZxaW91dWlpcHdpTnVNTUk0WnM2eVpSbWlNNXRp?=
 =?utf-8?B?SUU3Y2RwNHZlMlZVTTd0SHhpMnhlWFMxQXN5WWNTYmdLZmpRNWtmcTFhYUIz?=
 =?utf-8?B?OEhENlVvWm5HOGZYVWMwcjFRV1B2c3B4cS9NR1l1QTVHejNVTksvR3ZKQ1BL?=
 =?utf-8?B?amZtRlIrTGd5QkZ5WUl2OEhEQnVVU3pwRUJ5anFtQ1BOMzNhaFdudVZHampP?=
 =?utf-8?B?d0s3bUU1MlVUd3RwVjlZSDUrQjFKaXNIdENqeHJ2MzEwWXdMWWtTOG1nc2hn?=
 =?utf-8?B?RGhTWEd5bXRtNlE1SjVZU1NWTHFHZ1gycENGOHdpcEl4NUcxV3B2UmNXSCtT?=
 =?utf-8?B?aDBZVlhhVEZETXp4SXhDVXhDMEdmZ0t3OUwzT1ZQN2NiZmtreFdzakRDU0ll?=
 =?utf-8?B?SVpza2wyVzNNeWZoY0FnR3RYVHFVTjk2eUtxOUphWUQ5d0pUWWtjOXk0OHZS?=
 =?utf-8?B?WlJwVzg2YzR4YW5GSmxJQlNYa0dOa0FpVCtSWkNkbWdEY0ZmZWJkY0hKZ0p6?=
 =?utf-8?B?UmluYzExQUIwajh3bW9ES3pxU01RcXhQUjJjYTdnbWdJdDVES2hzMUxjZ0FR?=
 =?utf-8?B?TWxEVkpnMTNGN254OFNTS1Q5Z1huQlRIaDVEaWtKd1dsMnF0RjhyeXZsVlIx?=
 =?utf-8?B?Vi85RGQ5R1lwVkxCekFPci9oSzJTbEhuN0JlZ25xNTR2MFJ5aEEyTnZ5RzFu?=
 =?utf-8?B?dGgzVXAwVFFrR253aGZCQVBJYm05alJLRGp0V1U2OUgxaER0NWpZcEh6MU5y?=
 =?utf-8?B?YlhlYnl3RFpyK2xjbHgrcGN1VWczazRaT0d3RG5DY3pobkhzUWMrUHlrZld5?=
 =?utf-8?B?dkl4dlBZUGRPdEZRblA2eWw1WHZ6T3NMbWFEMDFyV3NwLzhrNUxPdVZ1WmNo?=
 =?utf-8?B?T0xpNE43WU5HR2pxQ1kwVEVSSXplTDhYNFZxQU9FQm0zcUZoVi92M1AvVG8r?=
 =?utf-8?B?QVJLVFVxRnBKNCtONUFQUjJxYTFlZ0gvNUxvZm1JTDlSanQ4cGc4YkZheWVO?=
 =?utf-8?B?eUQwMkFXbU11ZndlSGZoVzB0N0lRZFl6eldzeitlbTAwcSs4MEI0VExKVUpq?=
 =?utf-8?B?OERZNmRVRjNDOW9aVHFtYTE3Nit0Zkp5TnhhOWNYQS9wYzRSQnpvWWkvMHo0?=
 =?utf-8?B?TWdjaFRDc1VPamorK09hUzJJRy9mVWJLRkM5SnloR2VvblpyTkp0eEZoZmZw?=
 =?utf-8?B?TG15UzZmY2ZyUHdiK1kxb3dQUndkWS9LYklZbGJTQWNrZ25MZGwycVV4OFlj?=
 =?utf-8?B?eUNjYU9PV3p2ZVBQOE9BVFczWTBNelc1UzJYWlYrVW4vNWZ3Z3Y3Qi9NREU4?=
 =?utf-8?B?amlLd0lVVGNyeXE5QW1mZS9SMnZxb0o0Q2JPNXA4YThna05NQTg1VWNOV1pY?=
 =?utf-8?B?Mk0xZEttdzZweDF3cDVpWVdYQ2I3c0hBSjB3SnN3LzNZS1Z5VVpaenE1TWJ2?=
 =?utf-8?B?R250Q2tRSEovSER6UlI0bkhTMk40U0QzeS9Bbi9Uek4xN1RsTVdoWjI5cGl3?=
 =?utf-8?B?QU1ISXNrUnUySDNpaE44dk50Z1V5UG5QV0YvVzNZQXNZMkZDSjNBbXkwNEpI?=
 =?utf-8?B?L1BqaXZHbzdRTTNvcTdlOC95N1l5R0V5d3lzV3VhR05LdEVVNHdkdmVtcmdC?=
 =?utf-8?B?QW5kTUFLaTFkMmhDdjYrWWxsUnQxbXF1UW5EQnFrVkg0Z3R3ZCtoRHBDU0p2?=
 =?utf-8?B?L1FkSUYzbXJXYVZWYVNyeHY1MnVMMzdNYXZxVFF0eVcxeTEyNHhVTnpwRThU?=
 =?utf-8?B?RFBRbHJtYWpkTVZRTmJpZ3A5NHJTdG8vWkJYaUlNM0ZSTVVWckFrZkp3Q0cz?=
 =?utf-8?B?UW1UVjdibTA3Y3VjRndyR0ZyVWE5Q0kxNkl6dHR1K2ErVkR0UVhOalhQR09m?=
 =?utf-8?B?UUNGeGdRYzV4ZUhxQm1XMXB5eGp6S1dkWlgzWmMxQ2tZN1RoWkx2R2dVM2Iw?=
 =?utf-8?B?U21uVUJsVW9UNjVQR1RxQ0txY3cvelpFcDI4czdHVWZsa29PWUJBd1lGbmMx?=
 =?utf-8?B?UmJNWjQzU1NnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(19092799006)(366016)(7053199007)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dERyeStLVG5TMktrZVdWWnF4NkZzSnRrbS9rZDI3anZuR1dlQk1oekwvNXVo?=
 =?utf-8?B?RksycWpTZmsvaDlHaHFhNG9nY2c0WkFibXpGQXZtUGR1cVRva1RkdGkrWVJk?=
 =?utf-8?B?aXlpRkI3SjNQdHJWekpOMmJ4QTNTTXJUN0NJYzM0ZU81MkY1NzNqRHIvWUQ5?=
 =?utf-8?B?MURDY2p6MFdjMXRwalJqMmo1VXFzMHZnWnNUTkJnTUtkTzg1eVdrb3EvdlJH?=
 =?utf-8?B?QWlGTWNjMGt0cTFRbTZwKy8rdlNFVDJrRC9EVWowSXUydDJ2VzQ0MkZhbTVH?=
 =?utf-8?B?VFdNZlR4K0MrUE1LcGc4N1AreVR6WTJIekt6MnlsbnF0R0MyZkQ1czdnWTNR?=
 =?utf-8?B?ck1SWmN6dXBJYStNMm1QYjByWm9IdkF3ajRQM1BndUJuRzAwVTdObjEvbDUy?=
 =?utf-8?B?bHJaenUzaTJVQlgvbXNrTDhGZi9WSHNDeTFUbjBnMWRiTGt6R2ZQZ2hValNu?=
 =?utf-8?B?VklCbHNXL3FEbHZkbk13SkdzKzJyTXExS2dyOU0rcjZuVXBKYnM3bXE2ekdU?=
 =?utf-8?B?LzRjWUhNbXBsUWoxQWlCb1lwdGFkM1NUc05XTDBXNG5MdTBMRkh4TG1vTFpV?=
 =?utf-8?B?RTBVdFZjUU9DWTl3M0J0VHlvSEwxMWV5Nzg3OUxFcndDQkZ3WW5DYWF4aGp1?=
 =?utf-8?B?MFRQa1FzdVlHYkQrc0xQK1FEZ2VFUGh5cG04Vm9vQk1lUUF0VW5DS1YvVDM1?=
 =?utf-8?B?NkdjNVpCSC9HUnVxRHR1NFpmd1EzbkpFSXhRSWpTRDZkdHNLTHV0QzliQ1VL?=
 =?utf-8?B?VkQ1M2ZDcFNlOGJDeTBacVRIWEJkZ3RycHNHRW50enBXVUwxTGkzTXdJbDhu?=
 =?utf-8?B?RGExT3ZRS2RsSm90RytJOHUvNU9kb0xwTC9kSjkxQmJYemplczRKRnh2anJk?=
 =?utf-8?B?eG4xS050ckdjSUM0cHNMU0R6b3JOTXZsK3N5dnFwMzlDbGNSVHpWMnRtNTI5?=
 =?utf-8?B?dmJ3OWREM3VXb3l1Q2hpL3NBbFl3YjFOd01hMkZWOTdFL2FCNGxwUDlWRzJm?=
 =?utf-8?B?eEZrRW5rN05RSmZ6cllhcVZuU25BRXJJekFPMjBXS2NDUzlVbDdBRVhkZmIr?=
 =?utf-8?B?c01vWjdlVDMzNXpyb0dHcGIxMmhWMXZqNE1JUjZ0MmZJY1JUVGVrN0VxTEEw?=
 =?utf-8?B?NzZ2VW1ocFVZWmZDSFZiZFBjOTZ6S0JpZHZXNG52ZEdveGlDaW4xUlJxTlZR?=
 =?utf-8?B?S2VmU2lzdnUwbnRUYU1CV2hXOGMwZE1INW4xRGJmeTFXenBaTzhrRTJWRGc1?=
 =?utf-8?B?TklqUnNRb0dUQklQNDhWMG5SQnNpbFNHVVZyQWVYN1UvNTVjWHF3VEI2RzVH?=
 =?utf-8?B?ZHFzTUFocUp3RlZNS2cwS1FSR3N4U0xXYjhPY2VycWEwSHBNbVdOTExjdlNl?=
 =?utf-8?B?MTBuTUpnNi80SzB4MHVacGgvUFJKeG82aFA3M0FCb2h2YVY2VUlsM2MvSzhN?=
 =?utf-8?B?Uy9WTVpBTXFoOUk0bGEyV1JFcGpFaEtFZ3hCLzU5cGl1NGwyejVBZStCbHRj?=
 =?utf-8?B?YWE4MXUwSTNBaXM5T3JOZUpJWlBIMjFGb3gwcmFDVEl6STVlWlh4RVZYRnNP?=
 =?utf-8?B?emMxUHpsMTdMVkM3dTVqWm1oalhwOUxmcEpNWXo5TlNSMDExNnNNWVQ5cjhD?=
 =?utf-8?B?N2RRTk5tTTMzVnR6NzNtY0F1dVg5MmFTbkdEY3FBRVN1aS9wMVZOQ3BuOGRi?=
 =?utf-8?B?YUo0b2RaVjNRVk01ZUFUV1g4V24yT1QyR2tQQzUvY0x0MytzOG13NkZkSEla?=
 =?utf-8?B?SUFmbVNldHhCanpvTnNBaHZscUVUWThmZmQ5dkoxd05MNkhOTjJaVWJFMi9t?=
 =?utf-8?B?Vm9EckpiUGo2V1pLQThEWVU1cDJlck44Z2NqZXU0Umc3YXZtRVp1cWRsaXdo?=
 =?utf-8?B?MVVYa1hFMnhIcWRaTkV0WVU1dWozL2t2d1l2TUsycFNhNW45b2RYZDMzVTFQ?=
 =?utf-8?B?RWdIVEwwdk9JY1A5dDlTam9MYXE2TkRTemxyWlM2UjBSSmcxaXRiR1ltd1pm?=
 =?utf-8?B?Yjg2MUtUamNxSFhMUktvS0VPMVNmcEpQUlpZdnI4bnZoc0VzeDVpQXZjb1lr?=
 =?utf-8?B?SFFqS3hoMW0zZFRmTHFoaDJpSlNwN3g4UlVCRnNTRlpQTUkrcFdFUVhyRGFy?=
 =?utf-8?Q?TXJ0OnlIYRqp33MvBSwBrPGPx?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00aac185-6cc9-4f23-5b99-08dddf048684
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2025 09:41:09.0393 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7zctb+XMUc2OInlSemQJ1jtRSEbDhC+eqK/608MFQyEPWXXomrdLrAzs+ByRS8KwzZsI0VPCSV8/a4xm/5qAuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9059
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

On 08/16/2025, Dmitry Baryshkov wrote:
> Currently DRM framework expects that the HDMI connector driver supports
> all infoframe types: it generates the data as required and calls into
> the driver to program all of them, letting the driver to soft-fail if
> the infoframe is unsupported. This has a major drawback on userspace
> API: the framework also registers debugfs files for all Infoframe types,
> possibly surprising the users when infoframe is visible in the debugfs
> file, but it is not visible on the wire.
> 
> Let drivers declare that they support only a subset of infoframes,
> creating a more consistent interface.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/display/drm_bridge_connector.c     |  6 +++
>  drivers/gpu/drm/display/drm_hdmi_state_helper.c    | 43 +++++++++++++++++++++-
>  drivers/gpu/drm/drm_connector.c                    |  4 ++
>  drivers/gpu/drm/drm_debugfs.c                      | 16 +++++---
>  drivers/gpu/drm/rockchip/inno_hdmi.c               |  1 +
>  drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c             |  1 +
>  drivers/gpu/drm/tests/drm_connector_test.c         | 28 ++++++++++++++
>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c |  8 ++++
>  drivers/gpu/drm/vc4/vc4_hdmi.c                     |  4 ++
>  include/drm/drm_bridge.h                           |  7 ++++
>  include/drm/drm_connector.h                        | 23 ++++++++++++
>  11 files changed, 134 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
> index 8c915427d0538435661d771940efe38b462027a1..b94458d5faa9ae283889fc79496ae323bb4dc88c 100644
> --- a/drivers/gpu/drm/display/drm_bridge_connector.c
> +++ b/drivers/gpu/drm/display/drm_bridge_connector.c
> @@ -781,6 +781,12 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>  					       &drm_bridge_connector_hdmi_funcs,
>  					       connector_type, ddc,
>  					       supported_formats,
> +					       bridge->supported_infoframes ? :
> +					       DRM_CONNECTOR_INFOFRAME_AUDIO |
> +					       DRM_CONNECTOR_INFOFRAME_AVI |
> +					       DRM_CONNECTOR_INFOFRAME_DRM |
> +					       DRM_CONNECTOR_INFOFRAME_SPD |
> +					       DRM_CONNECTOR_INFOFRAME_VENDOR,

The mask is DRM_CONNECTOR_ALL_INFOFRAMES as defined in drm_connector_test.c
and drm_hdmi_state_helper_test.c.  Can it be defined in drm_connector.h and
used here?

>  					       max_bpc);
>  		if (ret)
>  			return ERR_PTR(ret);
> diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> index a561f124be99a0cd4259dbacf5f5f6651ff8a0ea..fb8b9e3769cb74345f9c6ef6f6ca441a373141c1 100644
> --- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> +++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> @@ -687,6 +687,10 @@ static int hdmi_generate_avi_infoframe(const struct drm_connector *connector,
>  
>  	infoframe->set = false;
>  
> +	if (!drm_hdmi_connector_supports_infoframe(connector,
> +						   HDMI_INFOFRAME_TYPE_AVI))

Nit: The above two lines fit into a single line.  The same applies to similar
lines added in this file.

> +		return 0;
> +
>  	ret = drm_hdmi_avi_infoframe_from_display_mode(frame, connector, mode);
>  	if (ret)
>  		return ret;
> @@ -718,6 +722,10 @@ static int hdmi_generate_spd_infoframe(const struct drm_connector *connector,
>  
>  	infoframe->set = false;
>  
> +	if (!drm_hdmi_connector_supports_infoframe(connector,
> +						   HDMI_INFOFRAME_TYPE_SPD))
> +		return 0;
> +
>  	ret = hdmi_spd_infoframe_init(frame,
>  				      connector->hdmi.vendor,
>  				      connector->hdmi.product);
> @@ -742,6 +750,10 @@ static int hdmi_generate_hdr_infoframe(const struct drm_connector *connector,
>  
>  	infoframe->set = false;
>  
> +	if (!drm_hdmi_connector_supports_infoframe(connector,
> +						   HDMI_INFOFRAME_TYPE_DRM))
> +		return 0;
> +
>  	if (connector->max_bpc < 10)
>  		return 0;
>  
> @@ -771,6 +783,10 @@ static int hdmi_generate_hdmi_vendor_infoframe(const struct drm_connector *conne
>  
>  	infoframe->set = false;
>  
> +	if (!drm_hdmi_connector_supports_infoframe(connector,
> +						   HDMI_INFOFRAME_TYPE_VENDOR))
> +		return 0;
> +
>  	if (!info->has_hdmi_infoframe)
>  		return 0;
>  
> @@ -905,6 +921,11 @@ static int clear_device_infoframe(struct drm_connector *connector,
>  		return 0;
>  	}
>  
> +	if (!drm_hdmi_connector_supports_infoframe(connector, type)) {
> +		drm_dbg_kms(dev, "Infoframe %d not supported, bailing.\n", type);

%d should be 0x%02x as type's value is 0x8*?

> +		return 0;
> +	}
> +
>  	ret = funcs->clear_infoframe(connector, type);
>  	if (ret) {
>  		drm_dbg_kms(dev, "Call failed: %d\n", ret);
> @@ -932,21 +953,27 @@ static int write_device_infoframe(struct drm_connector *connector,
>  	const struct drm_connector_hdmi_funcs *funcs = connector->hdmi.funcs;
>  	struct drm_device *dev = connector->dev;
>  	u8 buffer[HDMI_INFOFRAME_SIZE(MAX)];
> +	enum hdmi_infoframe_type type = frame->any.type;

Nit: follow reverse x'mas tree fashion.

>  	int ret;
>  	int len;
>  
> -	drm_dbg_kms(dev, "Writing infoframe type %x\n", frame->any.type);
> +	drm_dbg_kms(dev, "Writing infoframe type %x\n", type);
>  
>  	if (!funcs || !funcs->write_infoframe) {
>  		drm_dbg_kms(dev, "Function not implemented, bailing.\n");
>  		return -EINVAL;
>  	}
>  
> +	if (!drm_hdmi_connector_supports_infoframe(connector, type)) {
> +		drm_dbg_kms(dev, "Infoframe %d not supported, bailing.\n", type);
> +		return 0;
> +	}
> +
>  	len = hdmi_infoframe_pack(frame, buffer, sizeof(buffer));
>  	if (len < 0)
>  		return len;
>  
> -	ret = funcs->write_infoframe(connector, frame->any.type, buffer, len);
> +	ret = funcs->write_infoframe(connector, type, buffer, len);
>  	if (ret) {
>  		drm_dbg_kms(dev, "Call failed: %d\n", ret);
>  		return ret;
> @@ -1067,6 +1094,12 @@ drm_atomic_helper_connector_hdmi_update_audio_infoframe(struct drm_connector *co
>  	struct drm_display_info *info = &connector->display_info;
>  	int ret;
>  
> +	if (!drm_hdmi_connector_supports_infoframe(connector,
> +						   HDMI_INFOFRAME_TYPE_AUDIO)) {
> +		drm_dbg_kms(connector->dev, "Audio Infoframe not supported, bailing.\n");

Maybe, print out error message instead of using drm_dbg_kms() since bridge
should always set HDMI_INFOFRAME_TYPE_AUDIO if it calls this function?

> +		return -EOPNOTSUPP;
> +	}
> +
>  	if (!info->is_hdmi)
>  		return 0;
>  
> @@ -1102,6 +1135,12 @@ drm_atomic_helper_connector_hdmi_clear_audio_infoframe(struct drm_connector *con
>  	struct drm_display_info *info = &connector->display_info;
>  	int ret;
>  
> +	if (!drm_hdmi_connector_supports_infoframe(connector,
> +						   HDMI_INFOFRAME_TYPE_AUDIO)) {
> +		drm_dbg_kms(connector->dev, "Audio Infoframe not supported, bailing.\n");

Ditto.

> +		return -EOPNOTSUPP;
> +	}
> +
>  	if (!info->is_hdmi)
>  		return 0;
>  
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index 272d6254ea4784e97ca894ec4d463beebf9fdbf0..e753de9fc80a26c30b9674c96083328711f32960 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -553,6 +553,7 @@ EXPORT_SYMBOL(drmm_connector_init);
>   * @connector_type: user visible type of the connector
>   * @ddc: optional pointer to the associated ddc adapter
>   * @supported_formats: Bitmask of @hdmi_colorspace listing supported output formats
> + * @supported_infoframes: Bitmask of @DRM_CONNECTOR_INFOFRAME listing supported Infoframes
>   * @max_bpc: Maximum bits per char the HDMI connector supports
>   *
>   * Initialises a preallocated HDMI connector. Connectors can be
> @@ -576,6 +577,7 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
>  			     int connector_type,
>  			     struct i2c_adapter *ddc,
>  			     unsigned long supported_formats,
> +			     unsigned long supported_infoframes,
>  			     unsigned int max_bpc)
>  {
>  	int ret;
> @@ -623,6 +625,8 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
>  
>  	connector->hdmi.funcs = hdmi_funcs;
>  
> +	connector->hdmi.supported_infoframes = supported_infoframes;
> +
>  	return 0;
>  }
>  EXPORT_SYMBOL(drmm_connector_hdmi_init);
> diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
> index 365cf337529fa2a88b69516d57360d212419c126..248cb9ea1d8781674160cd8d454113c9422ec691 100644
> --- a/drivers/gpu/drm/drm_debugfs.c
> +++ b/drivers/gpu/drm/drm_debugfs.c
> @@ -672,6 +672,9 @@ static int create_hdmi_audio_infoframe_file(struct drm_connector *connector,
>  {
>  	struct dentry *file;
>  
> +	if (!drm_hdmi_connector_supports_infoframe(connector, HDMI_INFOFRAME_TYPE_AUDIO))
> +		return 0;
> +
>  	file = debugfs_create_file("audio", 0400, parent, connector, &audio_infoframe_fops);
>  	if (IS_ERR(file))
>  		return PTR_ERR(file);
> @@ -679,7 +682,7 @@ static int create_hdmi_audio_infoframe_file(struct drm_connector *connector,
>  	return 0;
>  }
>  
> -#define DEFINE_INFOFRAME_FILE(_f) \
> +#define DEFINE_INFOFRAME_FILE(_f, _F) \
>  static ssize_t _f##_read_infoframe(struct file *filp, \
>  				   char __user *ubuf, \
>  				   size_t count,      \
> @@ -726,6 +729,9 @@ static int create_hdmi_## _f ## _infoframe_file(struct drm_connector *connector,
>  { \
>  	struct dentry *file; \
>  	\
> +	if (!drm_hdmi_connector_supports_infoframe(connector, HDMI_INFOFRAME_TYPE_ ## _F)) \
> +		return 0; \
> +	\
>  	file = debugfs_create_file(#_f, 0400, parent, connector, &_f ## _infoframe_fops); \
>  	if (IS_ERR(file)) \
>  		return PTR_ERR(file); \
> @@ -733,10 +739,10 @@ static int create_hdmi_## _f ## _infoframe_file(struct drm_connector *connector,
>  	return 0; \
>  }
>  
> -DEFINE_INFOFRAME_FILE(avi);
> -DEFINE_INFOFRAME_FILE(hdmi);
> -DEFINE_INFOFRAME_FILE(hdr_drm);
> -DEFINE_INFOFRAME_FILE(spd);
> +DEFINE_INFOFRAME_FILE(avi, AVI);
> +DEFINE_INFOFRAME_FILE(hdmi, VENDOR);
> +DEFINE_INFOFRAME_FILE(hdr_drm, DRM);
> +DEFINE_INFOFRAME_FILE(spd, SPD);
>  
>  static int create_hdmi_infoframe_files(struct drm_connector *connector,
>  				       struct dentry *parent)
> diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
> index 1ab3ad4bde9ea7305021186ea221d2ff9057fdbb..65eed5ae23194200c145cb174acff4f252b3ef1f 100644
> --- a/drivers/gpu/drm/rockchip/inno_hdmi.c
> +++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
> @@ -1065,6 +1065,7 @@ static int inno_hdmi_register(struct drm_device *drm, struct inno_hdmi *hdmi)
>  				 DRM_MODE_CONNECTOR_HDMIA,
>  				 hdmi->ddc,
>  				 BIT(HDMI_COLORSPACE_RGB),
> +				 DRM_CONNECTOR_INFOFRAME_AVI,
>  				 8);
>  
>  	drm_connector_attach_encoder(&hdmi->connector, encoder);
> diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
> index ab0938ba61f7d75dd0bec473807a04a20e1cffbd..0b931da4ea2d4eb58a6224476059b9205e8626b4 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
> @@ -640,6 +640,7 @@ static int sun4i_hdmi_bind(struct device *dev, struct device *master,
>  				       DRM_MODE_CONNECTOR_HDMIA,
>  				       hdmi->ddc_i2c,
>  				       BIT(HDMI_COLORSPACE_RGB),
> +				       DRM_CONNECTOR_INFOFRAME_AVI,
>  				       8);
>  	if (ret) {
>  		dev_err(dev,
> diff --git a/drivers/gpu/drm/tests/drm_connector_test.c b/drivers/gpu/drm/tests/drm_connector_test.c
> index 22e2d959eb31459f9981fef488228904d67cb6f9..fd28ed2bf8bcecabaabc67f2f8f5ccc1f42525d3 100644
> --- a/drivers/gpu/drm/tests/drm_connector_test.c
> +++ b/drivers/gpu/drm/tests/drm_connector_test.c
> @@ -641,6 +641,13 @@ static struct kunit_suite drm_connector_dynamic_register_test_suite = {
>  	.test_cases = drm_connector_dynamic_register_tests,
>  };
>  
> +#define DRM_CONNECTOR_ALL_INFOFRAMES \
> +	(DRM_CONNECTOR_INFOFRAME_AUDIO | \
> +	 DRM_CONNECTOR_INFOFRAME_AVI | \
> +	 DRM_CONNECTOR_INFOFRAME_DRM | \
> +	 DRM_CONNECTOR_INFOFRAME_SPD | \
> +	 DRM_CONNECTOR_INFOFRAME_VENDOR)
> +
>  /*
>   * Test that the registration of a bog standard connector works as
>   * expected and doesn't report any error.
> @@ -657,6 +664,7 @@ static void drm_test_connector_hdmi_init_valid(struct kunit *test)
>  				       DRM_MODE_CONNECTOR_HDMIA,
>  				       &priv->ddc,
>  				       BIT(HDMI_COLORSPACE_RGB),
> +				       DRM_CONNECTOR_ALL_INFOFRAMES,
>  				       8);
>  	KUNIT_EXPECT_EQ(test, ret, 0);
>  }
> @@ -677,6 +685,7 @@ static void drm_test_connector_hdmi_init_null_ddc(struct kunit *test)
>  				       DRM_MODE_CONNECTOR_HDMIA,
>  				       NULL,
>  				       BIT(HDMI_COLORSPACE_RGB),
> +				       DRM_CONNECTOR_ALL_INFOFRAMES,
>  				       8);
>  	KUNIT_EXPECT_EQ(test, ret, 0);
>  }
> @@ -697,6 +706,7 @@ static void drm_test_connector_hdmi_init_null_vendor(struct kunit *test)
>  				       DRM_MODE_CONNECTOR_HDMIA,
>  				       &priv->ddc,
>  				       BIT(HDMI_COLORSPACE_RGB),
> +				       DRM_CONNECTOR_ALL_INFOFRAMES,
>  				       8);
>  	KUNIT_EXPECT_LT(test, ret, 0);
>  }
> @@ -717,6 +727,7 @@ static void drm_test_connector_hdmi_init_null_product(struct kunit *test)
>  				       DRM_MODE_CONNECTOR_HDMIA,
>  				       &priv->ddc,
>  				       BIT(HDMI_COLORSPACE_RGB),
> +				       DRM_CONNECTOR_ALL_INFOFRAMES,
>  				       8);
>  	KUNIT_EXPECT_LT(test, ret, 0);
>  }
> @@ -743,6 +754,7 @@ static void drm_test_connector_hdmi_init_product_valid(struct kunit *test)
>  				       DRM_MODE_CONNECTOR_HDMIA,
>  				       &priv->ddc,
>  				       BIT(HDMI_COLORSPACE_RGB),
> +				       DRM_CONNECTOR_ALL_INFOFRAMES,
>  				       8);
>  	KUNIT_EXPECT_EQ(test, ret, 0);
>  	KUNIT_EXPECT_MEMEQ(test,
> @@ -776,6 +788,7 @@ static void drm_test_connector_hdmi_init_product_length_exact(struct kunit *test
>  				       DRM_MODE_CONNECTOR_HDMIA,
>  				       &priv->ddc,
>  				       BIT(HDMI_COLORSPACE_RGB),
> +				       DRM_CONNECTOR_ALL_INFOFRAMES,
>  				       8);
>  	KUNIT_EXPECT_EQ(test, ret, 0);
>  	KUNIT_EXPECT_MEMEQ(test,
> @@ -803,6 +816,7 @@ static void drm_test_connector_hdmi_init_product_length_too_long(struct kunit *t
>  				       DRM_MODE_CONNECTOR_HDMIA,
>  				       &priv->ddc,
>  				       BIT(HDMI_COLORSPACE_RGB),
> +				       DRM_CONNECTOR_ALL_INFOFRAMES,
>  				       8);
>  	KUNIT_EXPECT_LT(test, ret, 0);
>  }
> @@ -829,6 +843,7 @@ static void drm_test_connector_hdmi_init_vendor_valid(struct kunit *test)
>  				       DRM_MODE_CONNECTOR_HDMIA,
>  				       &priv->ddc,
>  				       BIT(HDMI_COLORSPACE_RGB),
> +				       DRM_CONNECTOR_ALL_INFOFRAMES,
>  				       8);
>  	KUNIT_EXPECT_EQ(test, ret, 0);
>  	KUNIT_EXPECT_MEMEQ(test,
> @@ -861,6 +876,7 @@ static void drm_test_connector_hdmi_init_vendor_length_exact(struct kunit *test)
>  				       DRM_MODE_CONNECTOR_HDMIA,
>  				       &priv->ddc,
>  				       BIT(HDMI_COLORSPACE_RGB),
> +				       DRM_CONNECTOR_ALL_INFOFRAMES,
>  				       8);
>  	KUNIT_EXPECT_EQ(test, ret, 0);
>  	KUNIT_EXPECT_MEMEQ(test,
> @@ -888,6 +904,7 @@ static void drm_test_connector_hdmi_init_vendor_length_too_long(struct kunit *te
>  				       DRM_MODE_CONNECTOR_HDMIA,
>  				       &priv->ddc,
>  				       BIT(HDMI_COLORSPACE_RGB),
> +				       DRM_CONNECTOR_ALL_INFOFRAMES,
>  				       8);
>  	KUNIT_EXPECT_LT(test, ret, 0);
>  }
> @@ -908,6 +925,7 @@ static void drm_test_connector_hdmi_init_bpc_invalid(struct kunit *test)
>  				       DRM_MODE_CONNECTOR_HDMIA,
>  				       &priv->ddc,
>  				       BIT(HDMI_COLORSPACE_RGB),
> +				       DRM_CONNECTOR_ALL_INFOFRAMES,
>  				       9);
>  	KUNIT_EXPECT_LT(test, ret, 0);
>  }
> @@ -928,6 +946,7 @@ static void drm_test_connector_hdmi_init_bpc_null(struct kunit *test)
>  				       DRM_MODE_CONNECTOR_HDMIA,
>  				       &priv->ddc,
>  				       BIT(HDMI_COLORSPACE_RGB),
> +				       DRM_CONNECTOR_ALL_INFOFRAMES,
>  				       0);
>  	KUNIT_EXPECT_LT(test, ret, 0);
>  }
> @@ -953,6 +972,7 @@ static void drm_test_connector_hdmi_init_bpc_8(struct kunit *test)
>  				       DRM_MODE_CONNECTOR_HDMIA,
>  				       &priv->ddc,
>  				       BIT(HDMI_COLORSPACE_RGB),
> +				       DRM_CONNECTOR_ALL_INFOFRAMES,
>  				       8);
>  	KUNIT_EXPECT_EQ(test, ret, 0);
>  
> @@ -994,6 +1014,7 @@ static void drm_test_connector_hdmi_init_bpc_10(struct kunit *test)
>  				       DRM_MODE_CONNECTOR_HDMIA,
>  				       &priv->ddc,
>  				       BIT(HDMI_COLORSPACE_RGB),
> +				       DRM_CONNECTOR_ALL_INFOFRAMES,
>  				       10);
>  	KUNIT_EXPECT_EQ(test, ret, 0);
>  
> @@ -1035,6 +1056,7 @@ static void drm_test_connector_hdmi_init_bpc_12(struct kunit *test)
>  				       DRM_MODE_CONNECTOR_HDMIA,
>  				       &priv->ddc,
>  				       BIT(HDMI_COLORSPACE_RGB),
> +				       DRM_CONNECTOR_ALL_INFOFRAMES,
>  				       12);
>  	KUNIT_EXPECT_EQ(test, ret, 0);
>  
> @@ -1071,6 +1093,7 @@ static void drm_test_connector_hdmi_init_formats_empty(struct kunit *test)
>  				       DRM_MODE_CONNECTOR_HDMIA,
>  				       &priv->ddc,
>  				       0,
> +				       DRM_CONNECTOR_ALL_INFOFRAMES,
>  				       8);
>  	KUNIT_EXPECT_LT(test, ret, 0);
>  }
> @@ -1091,6 +1114,7 @@ static void drm_test_connector_hdmi_init_formats_no_rgb(struct kunit *test)
>  				       DRM_MODE_CONNECTOR_HDMIA,
>  				       &priv->ddc,
>  				       BIT(HDMI_COLORSPACE_YUV422),
> +				       DRM_CONNECTOR_ALL_INFOFRAMES,
>  				       8);
>  	KUNIT_EXPECT_LT(test, ret, 0);
>  }
> @@ -1149,6 +1173,7 @@ static void drm_test_connector_hdmi_init_formats_yuv420_allowed(struct kunit *te
>  				       DRM_MODE_CONNECTOR_HDMIA,
>  				       &priv->ddc,
>  				       params->supported_formats,
> +				       DRM_CONNECTOR_ALL_INFOFRAMES,
>  				       8);
>  	KUNIT_EXPECT_EQ(test, ret, params->expected_result);
>  }
> @@ -1170,6 +1195,7 @@ static void drm_test_connector_hdmi_init_type_valid(struct kunit *test)
>  				       connector_type,
>  				       &priv->ddc,
>  				       BIT(HDMI_COLORSPACE_RGB),
> +				       DRM_CONNECTOR_ALL_INFOFRAMES,
>  				       8);
>  	KUNIT_EXPECT_EQ(test, ret, 0);
>  }
> @@ -1205,6 +1231,7 @@ static void drm_test_connector_hdmi_init_type_invalid(struct kunit *test)
>  				       connector_type,
>  				       &priv->ddc,
>  				       BIT(HDMI_COLORSPACE_RGB),
> +				       DRM_CONNECTOR_ALL_INFOFRAMES,
>  				       8);
>  	KUNIT_EXPECT_LT(test, ret, 0);
>  }
> @@ -1482,6 +1509,7 @@ static void drm_test_drm_connector_attach_broadcast_rgb_property_hdmi_connector(
>  				       DRM_MODE_CONNECTOR_HDMIA,
>  				       &priv->ddc,
>  				       BIT(HDMI_COLORSPACE_RGB),
> +				       DRM_CONNECTOR_ALL_INFOFRAMES,
>  				       8);
>  	KUNIT_EXPECT_EQ(test, ret, 0);
>  
> diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> index 8bd412735000cb18e66aeca21433b2ebbefe2b44..2901fcb6b12ee318a4a9c727a62d5290d7c9aa84 100644
> --- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> +++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> @@ -138,6 +138,13 @@ static const struct drm_connector_funcs dummy_connector_funcs = {
>  	.reset			= dummy_hdmi_connector_reset,
>  };
>  
> +#define DRM_CONNECTOR_ALL_INFOFRAMES \
> +	(DRM_CONNECTOR_INFOFRAME_AUDIO | \
> +	 DRM_CONNECTOR_INFOFRAME_AVI | \
> +	 DRM_CONNECTOR_INFOFRAME_DRM | \
> +	 DRM_CONNECTOR_INFOFRAME_SPD | \
> +	 DRM_CONNECTOR_INFOFRAME_VENDOR)
> +
>  static
>  struct drm_atomic_helper_connector_hdmi_priv *
>  __connector_hdmi_init(struct kunit *test,
> @@ -192,6 +199,7 @@ __connector_hdmi_init(struct kunit *test,
>  				       DRM_MODE_CONNECTOR_HDMIA,
>  				       NULL,
>  				       formats,
> +				       DRM_CONNECTOR_ALL_INFOFRAMES,
>  				       max_bpc);
>  	KUNIT_ASSERT_EQ(test, ret, 0);
>  
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index 07c91b450f93ab9e795d040d6f60f485ac71cfe8..f7024fd554e04dbfa38d24f775ec5993ac8db335 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -556,6 +556,10 @@ static int vc4_hdmi_connector_init(struct drm_device *dev,
>  				       BIT(HDMI_COLORSPACE_RGB) |
>  				       BIT(HDMI_COLORSPACE_YUV422) |
>  				       BIT(HDMI_COLORSPACE_YUV444),
> +				       DRM_CONNECTOR_INFOFRAME_AVI |
> +				       DRM_CONNECTOR_INFOFRAME_DRM |
> +				       DRM_CONNECTOR_INFOFRAME_SPD |
> +				       DRM_CONNECTOR_INFOFRAME_VENDOR,

I see vc4_hdmi.c calls drm_connector_hdmi_audio_init() (though calls it
twice...) and hence drm_atomic_helper_connector_hdmi_update_audio_infoframe(),
so this mask should be DRM_CONNECTOR_ALL_INFOFRAMES as vc4 HDMI seems support
audio infoframe?

However, vc4_hdmi_audio_init() could return early with 0 before calling
drm_connector_hdmi_audio_init().

>  				       max_bpc);
>  	if (ret)
>  		return ret;
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index 620e119cc24c3491c2be5f08efaf51dfa8f708b3..529dcaca1d7924da12d9587170f96ec6a00ad126 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -1153,6 +1153,13 @@ struct drm_bridge {
>  	 */
>  	unsigned int max_bpc;
>  
> +	/**
> +	 * @supported_infoframes: Bitmask of DRM_CONNECTOR_INFOFRAME values,
> +	 * listing supported infoframes. This is only relevant if
> +	 * @DRM_BRIDGE_OP_HDMI is set.
> +	 */
> +	unsigned int supported_infoframes;
> +
>  	/**
>  	 * @hdmi_cec_dev: device to be used as a containing device for CEC
>  	 * functions.
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 8f34f4b8183d83dccd3e820a444fbf74fb6c16f2..5b4bc1d7d566d28f90f0aa342a1258685dda6bd0 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -1839,6 +1839,12 @@ struct drm_connector_hdmi {
>  	 */
>  	unsigned long supported_formats;
>  
> +	/**
> +	 * @supported_infoframes: Bitmask of infoframe types supported by the
> +	 * controller. See @DRM_CONNECTOR_INFOFRAME.
> +	 */
> +	unsigned long supported_infoframes;
> +
>  	/**
>  	 * @funcs: HDMI connector Control Functions
>  	 */
> @@ -2336,6 +2342,7 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
>  			     int connector_type,
>  			     struct i2c_adapter *ddc,
>  			     unsigned long supported_formats,
> +			     unsigned long supported_infoframes,
>  			     unsigned int max_bpc);
>  void drm_connector_attach_edid_property(struct drm_connector *connector);
>  int drm_connector_register(struct drm_connector *connector);
> @@ -2488,6 +2495,22 @@ void drm_connector_attach_privacy_screen_provider(
>  	struct drm_connector *connector, struct drm_privacy_screen *priv);
>  void drm_connector_update_privacy_screen(const struct drm_connector_state *connector_state);
>  
> +#define DRM_CONNECTOR_INFOFRAME(type)	\
> +	BIT(type - 0x80)

Nit: the above two lines fit into one single line.  I'd write:

#define DRM_CONNECTOR_INFOFRAME(type)  BIT((type) - 0x80)

> +
> +#define DRM_CONNECTOR_INFOFRAME_AUDIO DRM_CONNECTOR_INFOFRAME(HDMI_INFOFRAME_TYPE_AUDIO)
> +#define DRM_CONNECTOR_INFOFRAME_AVI DRM_CONNECTOR_INFOFRAME(HDMI_INFOFRAME_TYPE_AVI)
> +#define DRM_CONNECTOR_INFOFRAME_DRM DRM_CONNECTOR_INFOFRAME(HDMI_INFOFRAME_TYPE_DRM)
> +#define DRM_CONNECTOR_INFOFRAME_SPD DRM_CONNECTOR_INFOFRAME(HDMI_INFOFRAME_TYPE_SPD)
> +#define DRM_CONNECTOR_INFOFRAME_VENDOR DRM_CONNECTOR_INFOFRAME(HDMI_INFOFRAME_TYPE_VENDOR)

Can you align the above macro definitions vertically?

> +
> +static inline bool
> +drm_hdmi_connector_supports_infoframe(const struct drm_connector *connector,
> +				      enum hdmi_infoframe_type type)
> +{
> +	return connector->hdmi.supported_infoframes & DRM_CONNECTOR_INFOFRAME(type);
> +}
> +
>  /**
>   * struct drm_tile_group - Tile group metadata
>   * @refcount: reference count
> 


-- 
Regards,
Liu Ying
