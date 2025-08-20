Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C857B2D290
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 05:26:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 691F310E0E6;
	Wed, 20 Aug 2025 03:26:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="WEVgsAbS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010005.outbound.protection.outlook.com [52.101.69.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FC1310E0E6;
 Wed, 20 Aug 2025 03:26:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rSM6iPE15TsJAPpiP6pxd+pOPZeIDya8crWsKGN5LMEnrJhkFKJUStdFBZIrChNT1ISLCIcnyYKQ0/7/0HDGl1SHoIGqkvxtYQtrU1Ki7bB9oz0mcS+rfHHmSn8mD/SQPVS0t8E1QGJNaewgMz4iFPGgZtRabqxa4mp2SUXFH6U9tuMmaC4Z5GzI6bOYxgp60iUJsLL1Wop9kKwv/V+a/VWs/IC5g+HbUfxI2OtX/Zpu5IlO82kb9yCi6WQZiD/Wq9FbkPO/z+OJOUSe4PcLgv9vnFADLzFz4yjRNYlIb8DnWZeAxsYqU2883/znF1xYWRmOXEfpTQ14SCCQEpe/gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=odRY6BcYZ+8QVhNaKNFyX2Y8DrKA/CHzt8DcPqI5UoM=;
 b=ErNRavjxEhF8cCtPQy1elvsDrSYReH+FvKMqr1OOP5phvr2cYXfoHucRIQe6Wxg+TGwECZqvG4+pqo3FZknzVzKkz1mdI+Fga8pHB1hEAtVc70gzIP8QLwZlhZiwz3pIqtauTYMN8QQjWOlSSTrVKyF4RMKblV9HARjgAraLNtvtRRS3gsdYhPLt9biiIkooA23MXM7P+CQZWo97zUHikJrNawBZC2uDIW4DnsqLB6mnLih9X+Ub8Q8tSc26cdqjAn9tzXAReL6qMZd1NRxAUaHf0AU0gmSadZhLeWdYjEbCbWlTpH7nosW1w7IFK1XmXtg21kAoRrm1Qy7ZJSiMKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=odRY6BcYZ+8QVhNaKNFyX2Y8DrKA/CHzt8DcPqI5UoM=;
 b=WEVgsAbSFRV+cjPtNNRf8PuCDUF1L/CUuJ0d+dJWQjDCXzTuPYaQOgrwVkikMlFD1vzVvkxZaTD5RkF7MI2c921+T77tCUg18dXuPuvFmSDgpPyrqixrHIl417tQYN485/pAsTXJBmzYarLN+UkAYqOFXKLU3szzEUZKZFdtgGyKK7tZzgNzhI6usPN6L3lo7j7u6L3095mhrlhOpPsVp8cu/rUvqmHfOEs5D845VobD79L3K/GZAKThXbIB5C4pWC/rbSmmowL14VjrO9zghwobgpfX9REQxplb4CaqChIsT5jsbqg3TNyBUvx+28NgDcCVawWiFRp6sITp8K5DYw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA1PR04MB11384.eurprd04.prod.outlook.com (2603:10a6:102:4f5::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.12; Wed, 20 Aug
 2025 03:26:44 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%5]) with mapi id 15.20.9052.012; Wed, 20 Aug 2025
 03:26:43 +0000
Message-ID: <185e3a1f-0d84-460f-a9b3-bc4bdc13e543@nxp.com>
Date: Wed, 20 Aug 2025 11:28:14 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] drm/bridge: ite-it6232: declare supported infoframes
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
 <20250816-drm-limit-infoframes-v1-3-6dc17d5f07e9@oss.qualcomm.com>
 <9e77615a-9d5b-4971-b1db-74d6bed39533@nxp.com>
 <24392da1-02f4-4d57-a145-6285d46d3bad@oss.qualcomm.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <24392da1-02f4-4d57-a145-6285d46d3bad@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR01CA0197.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::8) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PA1PR04MB11384:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d67fbb1-cff5-46f2-d518-08dddf9962bd
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|19092799006|7416014|376014|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TzlnR2ptVFlLR2tVc1VuYTd0OXkyb284dXlGZDVxbUlEWDFqemlJQnUrYWkw?=
 =?utf-8?B?QjZmRHAxb3NiVklML01JZjBLVVBuQXNCWFI0bG5GZ1pXenpVWldWZFRmd3pR?=
 =?utf-8?B?RS8weEp2VXpOUDNYci9YQ294QjNxZ0dxZFVlYUxKbktUeExrYVdPWThhV0xL?=
 =?utf-8?B?Z3l1NnlJWVpWL2VSTXA3VHlXbHRsNVJhWjFTclFRdFBFYWJZNmxOaVZCUGJo?=
 =?utf-8?B?dHVSaFBZNWlCQjdQTDZXWmdNWE9hajdDWE83ZDVHVGtxL1d1ZDZQYlZhaFA3?=
 =?utf-8?B?M3Bkd2l3NkFIVUhSdEpYZDJ1NG9hQzFtTS9aNjlTbVBXblBHSERROUMxV0pz?=
 =?utf-8?B?SlhCY0o2UnVKa0wrWUFBNFpZbVkzVzB5OVh6bS9DaWF4VG1WRW5rd1dRR09Q?=
 =?utf-8?B?Qlp1RDVscENFRnVzT3dTVy9aellRcStvcjhpT1k1TVNUYkl5V2MybVZSeVk0?=
 =?utf-8?B?VFVzdVZiaElXZE81bjRnYzZ3SlJxL29ncFZQM1Q3RlZXREl6akk4bTZiQ2Nh?=
 =?utf-8?B?T1lvMWJjM1lVRFA2azBHVW5oTnQ4Vk1CdnkxcmgzaWVWMHZFcHNzYWY1Mk5D?=
 =?utf-8?B?SW1TZFB4bEdYTlNzUmh1T2MxT1Q1SEI1cktWck5DZWEvNjJ2Z2Zwd3llZGxa?=
 =?utf-8?B?Ym9OdWNIYWVkdmd1ZnhzWm5LRkhDYUVaRmc1TS9WaUFsb1FwRVhlV3hHTXFG?=
 =?utf-8?B?QncyYnEyVFhVZEFmSk5qMmo3R0RoKzV3YjlvcnFJdEttZkdUaDkwYXhKQnRJ?=
 =?utf-8?B?V3BBUk1Bb2crMkJBbzVQcWVsQ1ZyTE1LNHFMZmc1RDdzRXYwK0FsVUlQWXZT?=
 =?utf-8?B?YTJVcmtVeXJ5Y3FOTUVBM1dyb3RKZkpKeEhFTTZKUFh1UnFPYnk4eUUwK1Iz?=
 =?utf-8?B?REFMMWtaMDc1ZlZ4OVVJR3dkS3h1aGFoSmJ6OExKTjRrN0x3OWgvbmpyRUJY?=
 =?utf-8?B?Sjg2Q210WEQ3UHVBR3E2c3V6ZFdQa0NCZUFFci8wL3lRTiswNDAwUGYyOVl2?=
 =?utf-8?B?akU3Qnl4VHNuTXZUdUN2N1VEYjJiZnZTa01LSTlOMFRhU2QwcGZ5VlZYRXR4?=
 =?utf-8?B?OWd3cTg5cHlkQWFIOVVYRHFMZklDYVk3OXlhb3owOUVYUnl6NWhDK0ZEZjVn?=
 =?utf-8?B?YjF5d0J3Y0IwcUJEY3hNdHppbThVRGtkdUt6OUhKbldTNGFVSjgxN3RRNGZU?=
 =?utf-8?B?dk1oMjZlTTlJdGRGTVJ1WktrcEJFWmN6emdJMDQ1TDlKNXZGeFovb3ZpUTBy?=
 =?utf-8?B?SWQ4dTU5elNEd0Y0WlhMUFZZb0ZPK3VWNkZVdUVCc0RPRzdIOWtmV01SeHJ2?=
 =?utf-8?B?bjNZNEp3NWt6R3NOQ2JvUzZjbEtGYmpJTUpwRVVsQVpCcW53Q3NaL29CaHlX?=
 =?utf-8?B?eG1SRVlQeXlBZkcxSWV4aHJ6K0NvM3RIOHdrZnAvR200NFZzWXNrNURrWjdC?=
 =?utf-8?B?RGFSR1JUNGJLdVpjdUJQOCtLWnZiTWE2Q3duM0FOcnkrZjVoOGZnSjBNc2t3?=
 =?utf-8?B?WVkrbmN2TzZXQm1IaDh3SzFyUjU1Rm9DRGs4UjdyWUpKZXVJMDF1ZGdmQTZq?=
 =?utf-8?B?eHUrNlVUZGlUUEtnK3V6VG42dEltMWU0ZGZHNHAwbUwvME5xWmhlRFRHTWpj?=
 =?utf-8?B?WjlHVVBxOGpEakZJdWVsZGRUbmRQL1g5UVRUY3ROaHRGMXJtMVpyOGtxd3Mw?=
 =?utf-8?B?bU8zR3VrU3VFbFhrYUNpYTgyeG9yWE9mZVBiZkdOdVBDdW51UldwaHg5cEly?=
 =?utf-8?B?NHlLVHdkQXVlU0RJdjJvTld6N0RFZDJUREdlNEhMYmlxanhzUktUWnVmNTBu?=
 =?utf-8?B?ZmkvaUg4Y21RZ1NyUkQvREdrTURZNjZVK3gyWC9vbWtueEdaMWhiQ1FFK2py?=
 =?utf-8?B?OVZqdXpMVEU2eFNBekI2S2diTHV6cVUxUG1VeDNwaytSelJzRUU3emZBQ3RT?=
 =?utf-8?B?RVRSbzVWMU1oY0E1SmhSUVM1eDUwdkxOcXZyTm5qOUxwOVdtOFFTQmIrQWc3?=
 =?utf-8?B?NlNOemFWVjVnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(19092799006)(7416014)(376014)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZE9EUURGUFhCMnQ1cDdCR3hGTGRVU0N5YlZjNVY3Rkh3MHNDN1d0KzRWUFdv?=
 =?utf-8?B?MzRhV3g2RVlrY3ZtdXVZaGd5bkVuc3o0Ykw1SWhYZFc0WWtPRUJOTEtjbUZX?=
 =?utf-8?B?Z1E2M0Qwc1NQdXp2WVVub0pnMnIvdnhuakx3VStlemhiM1lOL3VQcy9vMEtW?=
 =?utf-8?B?UmR3ZjArNjlueVVCbmRGRklBck0vZWVnYUt6bzR1ZDB5QTQ3SHlXdGg0dU5q?=
 =?utf-8?B?Nmxrd3RWTkVkNWd3NFJ6VFlwVHFYK3ZNSXFET01mS0pMcTNxMDhTbnB2emZT?=
 =?utf-8?B?WjdpTVU2blZ4cm9OMkVNNUhtREEvaXBWSUdnMHllSGdPUVBHQ01maW5UQ3BX?=
 =?utf-8?B?RHNybEsybHRLeGI0clp3blV1NTd3M3gxQ3FaaGxONjlQVEFlcnFKckx6ZTZr?=
 =?utf-8?B?UDEzU3ZhamgrQ0FyUzZpN2F6N0dNNnRGYm8rSHgzRitwYjUyb2g4K0gvWi9X?=
 =?utf-8?B?NXBRMkZOeUIyZDdSTVY5eDBOTTNxenA0c0taUFhWNXBRMHpxQU5vRjB0d1Vy?=
 =?utf-8?B?cUROM3RzZmI1RGpBVGpQelZZQ3lPTlFHTnQwdTVML21LN0FDdHROMWdQaUdN?=
 =?utf-8?B?amZBbm8yTXF5WHc0b2tPYmVZRGhqSlh0bWRxOVkxSkR3d3NMMlpGY3hKZEdN?=
 =?utf-8?B?aWpMVDAycmRtM0lqRWRrb0dGV05HVldkbG9uOUVTTTBFQkVkalk1cm1MTzJi?=
 =?utf-8?B?RVBZQXk5czRHbUNYc052ejVtM2RsV0hYbEJkOFNtdHpZaUE4emQ1blNwSnMx?=
 =?utf-8?B?OXlhWDdUMTVRUEpqVVNVUFNORDFoSXU4WWNmUGdqbEhFVlZadEtGelZEbm5w?=
 =?utf-8?B?UisxbGs4dVpxQnkxdDdTOGhJMEZlMFRtTG5YTXpIUHQ0TG5aZEZxdDNHMW5q?=
 =?utf-8?B?Y21XQnZTb1VQQUFyUXZyUG9tVDFqUGZFMFpqOVJyTlVLME5ESGN6RFhmWFlO?=
 =?utf-8?B?ZWt0Y2JZOW1wZUNkZFlSQTlMaGxtQVRXK3kwTnZsV2hNc3FITUVlZzFZRjNF?=
 =?utf-8?B?WUd6SitvOHNjTSt0VGJaaC9uS2YzMkZhQjFUT1RsbHJpZm5RYkEzeFdkelFH?=
 =?utf-8?B?VXg3bEx4WXNoaHp6OTdGZFBqUmIvRVB3ZGMyeUFocG1lbjVWL0JuZGlNUGV0?=
 =?utf-8?B?YXdHN3dsUU10cTgxYzlKNyt6R2lUMHJyMzN1SnNzeld0NDFzbCtMcFk0dE5k?=
 =?utf-8?B?YTNrSVFNMXRPQWxlWVF3N01aUUIyRVcwakc0Y1ZjNjh5UHFZT1FjWGlDUUJy?=
 =?utf-8?B?UGhEbnBKK1BFcGwxOWVZWW0rYkxTQUJ2ODJwcTI3NC8zSmo4ZGFDY2xqcEdB?=
 =?utf-8?B?SEExdEpTVm5kRXF2VlEzanJGWGlqVitNWCt3cXluWEJlYXNsUEp2VWxEdDYz?=
 =?utf-8?B?WCtRQnVXZm1LTVRYNUFnem5nU1BUZ0Rhc3hGUEpLb1dCTUZwbDB4QTJ0VkxC?=
 =?utf-8?B?c1VVVGp0a1pBQlo0L2tubzV0MFJaa1UyMnlLTVFNdWtPUnR1b0llQU4xckVU?=
 =?utf-8?B?YXE3SHoxNlprc2trdjNtK0phTnlhRFh2bmdZcnpwMU5wOGQrcGNxWmF2cU1P?=
 =?utf-8?B?V21sdVdpU1Jjb3p2S1NDTHJZN0Vtb1RveEZxbUFCYUJlZW9CeVpyMDMvamYz?=
 =?utf-8?B?RzBEaDk5VFZFa3ZVT0Z3dWRuRm1mejRuSEpNdjZoMG54SGdWMEFrQ3FDMkYx?=
 =?utf-8?B?RW5ZWm03Y3p5WWxhY0dBdHdNVjNpR3JGcFVScjhpS3EwY1RnTUV3UlQwYXY3?=
 =?utf-8?B?T0pzSGFVS01nMkFRNmF3SHAwQXRUS0gyN1ZsaGllRjU1dU5wZmJBOG9reHdp?=
 =?utf-8?B?WkEwVXFXeWdmTktRUllCN1dUcFNnWlFFYjhpLzNSTjRsdmJtNWtkajZQcnpa?=
 =?utf-8?B?by91M0xCbldWNkRDMThMejFwSEVxLzA1b2Naam9laHlXVXFBRUFtdGR6RFNV?=
 =?utf-8?B?RmJVUVlYQ2JiV0xsQ00xNUJlclNPK0REQ2xQQ3JHdkpKd09sTnBFQlRUMSsx?=
 =?utf-8?B?alN6MnI2ekpMMldpMzFWb3NFUTUzU2F1dCtzcHRqKy9wMVNyRmNScG1YR1o4?=
 =?utf-8?B?YXAvRFJKdzlHM1JnUVM5Zk1FUmNaN040aFNTTHhwMjJkaENXeHZDZFU4QlRo?=
 =?utf-8?Q?Ltt0GnM8CDIUPU3fdZIgRKfzc?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d67fbb1-cff5-46f2-d518-08dddf9962bd
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 03:26:43.8346 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qYBBkyvJ42WqfGFdFzXhdp+XKW0hdXFj+kQa5iP9VjXLiKAoDXuA7NLbaQ2t0LyzLMtsswtMBFSuY5hFmx3vqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11384
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

On 08/19/2025, Dmitry Baryshkov wrote:
> On 19/08/2025 12:49, Liu Ying wrote:
>> Hi Dmitry,
>>
>> On 08/16/2025, Dmitry Baryshkov wrote:
>>> Declare which infoframes are supported via the .hdmi_write_infoframe()
>>> interface.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> ---
>>>   drivers/gpu/drm/bridge/ite-it6263.c | 1 +
>>>   1 file changed, 1 insertion(+)
>>
>> For subject, s/it6232/it6263.
> 
> Ack
> 
>>
>>>
>>> diff --git a/drivers/gpu/drm/bridge/ite-it6263.c b/drivers/gpu/drm/bridge/ite-it6263.c
>>> index cf813672b4ffb8ab5c524c6414ee7b414cebc018..b1956891a8388401c13cd2fc5c78f0779063adf4 100644
>>> --- a/drivers/gpu/drm/bridge/ite-it6263.c
>>> +++ b/drivers/gpu/drm/bridge/ite-it6263.c
>>> @@ -875,6 +875,7 @@ static int it6263_probe(struct i2c_client *client)
>>>       it->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
>>>       it->bridge.vendor = "ITE";
>>>       it->bridge.product = "IT6263";
>>> +    it->bridge.supported_infoframes = DRM_CONNECTOR_INFOFRAME_AVI;
>>
>> With supported_infoframes set, the two lines setting vendor and product
>> are dead code.  I think it's worth dropping them and updating kerneldoc
>> for vendor and product members because they don't have to be required if
>> DRM_BRIDGE_OP_HDMI is set.  But, this could be done with future patch(not
>> in this patch series).
> 
> They are still required by the framework itself, see drmm_connector_hdmi_init().

Yes.  But it's a bit too strict since SPD infoframe is optional according
to CTA standard documentation.

> 
> BTW: I don't have ITE datasheet. Do you know if it really supports only the AVI frame?

AFAICS, it seems that ITE6263 supports inforframes from 0x81 to 0x85, so
including SPD inforframe.  Maybe, just keep those dead vendor&product
settings for now and add SPD inforframe in future.

> 
> 
>>
>> Reviewed-by: Liu Ying <victor.liu@nxp.com>
>>
>>>         return devm_drm_bridge_add(dev, &it->bridge);
>>>   }
>>>
>>
>>
> 
> 


-- 
Regards,
Liu Ying
