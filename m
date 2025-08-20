Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B657DB2D32F
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 06:50:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EF4C10E34A;
	Wed, 20 Aug 2025 04:50:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="QnmpgfHY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013021.outbound.protection.outlook.com
 [40.107.162.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5DF910E345;
 Wed, 20 Aug 2025 04:50:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iiFREIB7m/5LCcZV1dOjln1VnSy8ixrjpLcUAqDFLi9LcAx12cK+ZaII3tufIyToohUcvCqKpSng0asSprTHYPY9m36Bj7JT0Vi05PbMrBD1/DLQTUA80cW5bLgGr7wT8iV+87DdpGsMa3ktGu8VvR2u9v6gbJl2jzDfab/jSOO74FnlWJUZgIPYULpcQ6uXjCjJgO3V+ADlNtxuJguveVnqnDP83YUBdH3qBcQALRnD62nZuBtxRbNB88dpukQu6835hG/U7KiI1X9BkL5L0bNa4MkSrLlyaUrEDdT374gUfxTOCglgGEQ6fjlLVL5cHUnwv5Lbye0eiK9d5Vf9Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oDTyzmKLRP19QSnyD3qgjdEt+ug9umXJbMbI2INBiL4=;
 b=qvL1L59X0P5KMyCnSKtiRwL8w53/tUQ9ya+nuu5Eit14wXo5CD+sVSLZAWEgRWZZR0vg23lLMdh/rqrF3f5nX1xXVwn1q4yjhqvsoHYkLhJC/u358g0zjFXfNwQZn1wxmOUKYhDKAmV1aDdN+X0aM5A2fGopRTb2AbTi0Ua2GcBBNGyN7BdxB4JSDYbLj9GFBTs11XyD5NSMdK7sZMwI8K9AgdqB3Y6U+BlOGK8FYInJE1ixCwjEYwVk6nAu4Ssg5VWLxbbGjcwtZxwGC+aYxwz5cX/nv7VvMXN1AhbeIiWeMe4ifsCSILTdRy5/DHSy8nRYvRFdNVdAUeq2gqbpvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oDTyzmKLRP19QSnyD3qgjdEt+ug9umXJbMbI2INBiL4=;
 b=QnmpgfHYZIG3rCofyYIOIEShAweLEhXtZ/rQ2yJYNsqYl4jo+IVwkkVt4KitHYv8dbmC+Pa834lU98d+41jkkRlk/+NB7LO1d5QbjnsHf7HVp7ofl8FFWxe6AgiGInpX5jtTmiy0N8ioBajXNLfOB2ku729DXj+EwugCmKcXmI+kn7Pp7aowVsqCain+xHBXGzRZaHW8pIUDaLKyUWn4cq7VPDgwXFEDcYJ9N0bTKFMOgMWYklJ3Dg1/K2AxzwKXrP/iOpOghyS9scPdob7IL93Ch3xeDq0E+DkzxwWQDizp7GRWWw4CVGxq1Ib05NI/+p4bBsjiWOjw4SaiuPPeFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA4PR04MB7645.eurprd04.prod.outlook.com (2603:10a6:102:eb::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Wed, 20 Aug
 2025 04:50:32 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%5]) with mapi id 15.20.9052.012; Wed, 20 Aug 2025
 04:50:32 +0000
Message-ID: <dc635aae-b8c1-419f-94d8-0cda95a7e980@nxp.com>
Date: Wed, 20 Aug 2025 12:52:03 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] drm/connector: let drivers declare infoframes as
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
References: <20250819-drm-limit-infoframes-v2-0-7595dda24fbd@oss.qualcomm.com>
 <20250819-drm-limit-infoframes-v2-1-7595dda24fbd@oss.qualcomm.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20250819-drm-limit-infoframes-v2-1-7595dda24fbd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0018.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::7) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PA4PR04MB7645:EE_
X-MS-Office365-Filtering-Correlation-Id: 81fcfd95-8e40-4c7c-51ec-08dddfa517ff
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|19092799006|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c1lJTm1lN3pjQmFaREhHKzhXYWZ0Tm1DdHNpaEhRbVNwdVVDcWluSXJDUHhw?=
 =?utf-8?B?V0RaZitZbXhyRXduS2Ryc0VlNjRRM2RFZzV5T3hVcXNNZ0UvdUpYQVlFaWp1?=
 =?utf-8?B?L3I1dnZTUHFRZzIzcGQ5U2hYR1NnekpCWURsNGtTVCtUZy9lNlYxd2loYWdF?=
 =?utf-8?B?L2tPK0U2QWpqdzl5a2RJSG9yNFlDSytHaVBtVk5HSm5ldGpMMDlHN2lyVEw4?=
 =?utf-8?B?S0NvaDlLL3VTMUEvTDFSSW1PbS9oUEFObERRd2VJZUZENkdZTVBXbDBXaTZt?=
 =?utf-8?B?eXRndkhZNHNxd3dvL1dYay8vM2lSMENCejRBWlYrd3U3SHhxd0pJbjM0YW1r?=
 =?utf-8?B?enBWRDh3bk53bDFaODhJWnpFM1BQbFlodENBSEdXaWVZZnFDS0t3bE5Odits?=
 =?utf-8?B?K1c2UElDWkVPYXl0cGR6U3pmejB0VzNoSE53NUFBVXM0bVZVazlXc28yc3dN?=
 =?utf-8?B?STZYMTdaSHZoQ2JpTWRadlpUK3JHTlppcGVWQWhIZk15SjkxZVFXL2dHa3Y2?=
 =?utf-8?B?bExvaG91YUNkOUI0Vll6SHFMVTJmT0lkbVZRK2N6ZHFReURSRmEwaW9RNkli?=
 =?utf-8?B?YVcvZjZMTTVWZXpMekpjTk94RG52clB3SzdwTDdxQ1ZobHpMSnE4emQ1RmJx?=
 =?utf-8?B?VzRyeUVzeUN5SStPSTA0eG93aExnMW1WWng2UmdnMGRNY0JnYWluUkwwNStX?=
 =?utf-8?B?T2RYVzhSbkxibStXL3lFME4yQ3pnU2dlZ2huRzQydUg3MFdDSHVaUi9uNkV4?=
 =?utf-8?B?dkhVTEx0amFpaWdDcDd3UzNTUktmYnp0Wnc3TjRtVCt5UHhyQ2ZNQVAvTnFL?=
 =?utf-8?B?cjduWDNiTTRkSlphNlUxaEVVV0pia2lWQzlxSkRwMk1Nc00zN1RGNG5YQTlM?=
 =?utf-8?B?ZWQ2UFpFVnRvNUVDNWxibnF3aVVGMWQ1aUE5RTQyNmVmelhoczZKQkkxaDFI?=
 =?utf-8?B?K3ZFS212NHBDMHcvMEpTbEhrK29icnRPOW9KOCtxZlNyK1hZNzVQSmlOWE5k?=
 =?utf-8?B?K205VEhpUnhBSGEwMjllOXNXaitsYmtWQnZPSksrdERiL2VjNDBJaVdYTlZP?=
 =?utf-8?B?c3VLbTh5RVpqUGdrYzg3Vk9VRUtjMFUxYS8rMnd0OUxWV0xkd0pGNG5qdDQx?=
 =?utf-8?B?T1NHNGV3RE95Z3NyTXdoWWFMZU5hVVVXN0pER3pYbTdCaU5SdGJaeU4vM2l6?=
 =?utf-8?B?OTRMeFgyalV2UFhlc2dOS1RVYTJFUW5LN1BmMG8zd0V3TkhpMzFaQjVBdnM1?=
 =?utf-8?B?MEsrRVZPY2tBQnBKVHF4YktNdDcxclVvM1VKMkZxNmZSbTJSeGZlT0Q5YS9t?=
 =?utf-8?B?d3RFRERrMzRib2xIWFlMU200VG9FdDBnQW0yNEo3N2pic3pOaE5BcVpvdHJQ?=
 =?utf-8?B?WHpyOEFvQjd0YjFuWkhJSWVoMHBaK1p2VjhhYnczUFIzTWRwSyt5ZFdWU3da?=
 =?utf-8?B?YVZTUHcydDVEQUVVeXdRN3pDRnRxNlNjanBpSUU3R2VJUFIwZ2JhRDQzUm1o?=
 =?utf-8?B?aHpWclBDckdwTG0vMXdCNEVqU0luZlRnMm5VK1R5ZnpCbDNvYlFtZWtrdUxa?=
 =?utf-8?B?VjJ5N1F1YnhqSVh4cVR2a24wN011TXZBandxc3BHWnZpTUFvcTNmUS8rTnUz?=
 =?utf-8?B?NVAzUm9PQWF0dXRpbExodER6Q1A2M0Y4YlZpdHhTZ1poMnkvS3YxQ2RBS09K?=
 =?utf-8?B?cVdtbjlnZEF4QndvNkVQSkxuUFFoWnRjZVVhMUtPa2lXenE2UG5CTmhTSnRZ?=
 =?utf-8?B?MHR6V3EyM1oxcll5OVgvVnRhb3hLT0tYakdhcWt4amhZa3FxZnREQjBib2NG?=
 =?utf-8?B?aXd5SFQrOWwrUUtYdHdHb1BvMzNTSjl0ZFNxd1RZcnV1cXhIWlFZYjcrRzJB?=
 =?utf-8?B?MENGT21KL083ZDJad0ZxQytLRWZEaDVwOUNXdUxhWEdtWmJ5N0c3ZXJXVHNt?=
 =?utf-8?B?dU5TS3RMbTQxOHVZc01YRStZQ2xleXVvU0JGVHdWUThxU3V3Q250dHRLVHhE?=
 =?utf-8?B?QUhYaG5tdjZ3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(19092799006)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dGNvOERJMkNMakMrYkxoc3dNZ1pBVnY4MG0wZ0ppVVJxMzBBMzcrdklYSXJo?=
 =?utf-8?B?M2NWVlhOQ01MZFhrb0h4NXhNY25Fc2VQMERNN0l1QlZZMWh6WUNyQkc4dzhQ?=
 =?utf-8?B?NXNMbjErM1V1WmhzUUtodUQ5c3FMQTZMYVU2c0ljVTFnWU1ZNEVFdk5BTjd0?=
 =?utf-8?B?d01wcFFvNElZWTgvdkd5Z09UVWFnWUo1a29meVJMS0F4dy8zTE11RzNPZkIz?=
 =?utf-8?B?U1FlelVDR0RIQjNFZjYrVzhFQXNTanljVjVFOHQvbkFuWTE5MmhFUEthQVNV?=
 =?utf-8?B?KzNZSnZHOG1nRDk4NEppWEpSTW1LcDNhcXk0Q2dyMUJnZlc3OFFhMm4xODZZ?=
 =?utf-8?B?ZUJlUUQvNEluWlB4d0ZuN3gzUE5XY3ExQ1lMMzBSUm1mZElCUWl1dnpRTHMr?=
 =?utf-8?B?a0U0K2Z0Q1lmN3l0Ync4b0dTenBBdXhIRnViYzdianFrNGc1Zmx4dFZ0d3lu?=
 =?utf-8?B?aHEvUUxsb1BQSXNwL1BhSDV1bDJwT2J3U0liZUg1MGtiZnlRbVk1dmIyc3hl?=
 =?utf-8?B?M3JzZXYyeXRqdEQ0K08xWGFHNkl5ZWcycmhNTmtYcUhIOGN0L2V2QkZ5Mllk?=
 =?utf-8?B?REc3TlRBVDVPWGhud1JTNW9kYmtCKy9QNDNLZ1VDTDFnM1VnSnppSjJ1U0E4?=
 =?utf-8?B?b1hDTlMyb1hOVHc0eVBZTlRsaHBuelNjb1lkK2NvZmtyMUtTdzFxbUN3RUtW?=
 =?utf-8?B?RDZXOHcwbUkyUFducmlBa1ZCbWJTZStiT01aMzFsTnlINllTTk0wMWlGdWg0?=
 =?utf-8?B?bHovRDYvSm10NCtXdUdhK0N4Y3NOekhYQlovbmpjWEo3dFpMM1p6elVNWHpO?=
 =?utf-8?B?Z2c1L29tdXlWQXBjTmFPQ0duZUNzc0lDaGxac2t5S08vYjRjU2gwK0h3bUI0?=
 =?utf-8?B?RWhxL1c5bEtxbWdaM2luZ2dEMElRV1lxRGxYbFZ6dUo5MEtxV2ZKTzhud2tM?=
 =?utf-8?B?SWFmbFNvaG5TUERaUG9UMzhCTHJUNFM5ekV0Z3VBSXZ1dk1ZRXZyeWhnNTlB?=
 =?utf-8?B?OS9EVHBxUEU5eG9BaHBLUi96dnVMZTlWM1duRVh5ZmpyUXBmOXFDbXVna2cx?=
 =?utf-8?B?M21HL0xEK2EycTR1QWNrSG5wVlI4SnhFS1ZqMEtXSEl4dEZWSElucThpdjNo?=
 =?utf-8?B?NVppdXU0cmZzNkpTWjRuWE5DSVdNUUpqUXl3L1lSVFp1RCtJWEZHbWZBZ0h0?=
 =?utf-8?B?OE1ieUlaMG9VdVZmN0FXb2I5YVM5WkxNZndKSTQ3emJ2d0hkblpaMlNSd09P?=
 =?utf-8?B?ZjYvQ0VaZU9wWHRYWEx0WkY4cmU4c2dLVkxBNXlNc29KeTVDRDB4bFlmc2V1?=
 =?utf-8?B?QkJ0KzJXUjRLMVN4cnkyTk9zQ01uWjVmRUdSbll1cUJwc1lHUUtGN2REZld6?=
 =?utf-8?B?dGkvemtYWXhyZzBVSkwrSzRtaXowRmUvY1l6ckUzTzRtdnpqWVJvRW0xOU15?=
 =?utf-8?B?V0poUHZQY05STko3dGM2amtOT2FYbnFDUEVRa0NnZ0pXTTcrbU9zbDB5bWVR?=
 =?utf-8?B?YWFFbTZmOTBlSHdRVmJQamV1Z09SVFRqcndDQkFIYlFlVHMyTENBcGhyU0dZ?=
 =?utf-8?B?QWhZWDI0YmtIeU91UE9Hd1dkK0lqc1U2NFNoQ2VKK2hobkUrMXpxZWNSeWpV?=
 =?utf-8?B?SHluMi85RDg3U1ZESzlhQmhqV1RmczRTdFdYak8yNWUvVERIYm9KMUc2T1Bq?=
 =?utf-8?B?K3liRVhSWWk4ZHFCRU1oOVo3OTd6dWZBdU1IZTZ1S04yZmtobzljU2xCT1lU?=
 =?utf-8?B?eGVjT0daMFBrTnFoMDBtRmpPZDFQZUxnZHU1d1o1RDU3aVcxMVUxSnd1dFJL?=
 =?utf-8?B?eDd5cmU1RkhFZkxZN3dvQ2hwckJpRVl1MThIMUJuRVFpaTRoSmsrTEVkNGla?=
 =?utf-8?B?QzZnV2tSYktnMW9xY3NzR3AwZHJWTlUrSklRbExPclVhUUtxZG9TMVEvR2hj?=
 =?utf-8?B?VmV4OFZwVFhzck0zWVl1OHg0MGJ4a0ZrSlNkS0RxektmbUpkYm14ZlYrNE5V?=
 =?utf-8?B?eTJqanRpUUtzdlNDbno3WGt3eTVyYnF0akd0ei9McHZvY1BhSE1xUWtiMm0r?=
 =?utf-8?B?UWI4dXB3SWk5dVNFTVROQ2xSbWxSQyt2NG0wYzdIN1NBSWl4dTVFbDcwak15?=
 =?utf-8?Q?cS5Yk+zstKgu9kVrjHCu36K3q?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81fcfd95-8e40-4c7c-51ec-08dddfa517ff
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 04:50:32.3776 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /LwD7nk6YiD2U1F15QSvlRRwQGhfbtcXaVDWtzy8J7Oxtk55iqZ54VZR7CaSU70LQh3VN6t5voR76A0BdD5f8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7645
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

[...]

> @@ -930,23 +947,29 @@ static int write_device_infoframe(struct drm_connector *connector,
>  				  union hdmi_infoframe *frame)
>  {
>  	const struct drm_connector_hdmi_funcs *funcs = connector->hdmi.funcs;
> +	enum hdmi_infoframe_type type = frame->any.type;
>  	struct drm_device *dev = connector->dev;
>  	u8 buffer[HDMI_INFOFRAME_SIZE(MAX)];
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

This '%d' should also be replaced with '0x%02x'.

> +		return 0;
> +	}

[...]

-- 
Regards,
Liu Ying
