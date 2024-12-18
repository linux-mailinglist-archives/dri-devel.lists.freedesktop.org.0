Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4DD9F5E66
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 07:01:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E083010E228;
	Wed, 18 Dec 2024 06:01:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="kUSDoL2j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010069.outbound.protection.outlook.com [52.101.69.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3E4910E228
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 06:01:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FgUwaCuhmE4dQ/6yaWn+wMfjSsuLwCw5KMQRBsGNY/htaK+Efty/br7iE9tOPDOCAHpKo76dK23k+yGLIS+Dz5q1678/BNmyNA62sH+370wRXTIXpYeaO3xSD+X+5onJ6vO9Kxd50HqnIVL8dOdK50Okke/FAEdyCw/OukRFip8M2S0ifQ0p00Yi+Nu+aok0vZdOrxOX9NG82OH/3zJLaHpm6NGpezczgTWGSzb9MhY7/Br11XnWR5sWJZ52gGRnD/8OpgXldgue2x71dYv++f9HEgWcGz2oRD++qmguuH2O7t+46V7L3opgDYHUf/x50xh7e/Vq+6Zzm8GbCXv7JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W08ToNQ0HvFoRZ7bSM24X72uJIkIZCz0cIpKyuh5ALI=;
 b=KJJeDQXCBjOfzMyUUaqC+xE4H9DmehsnxL2h/qekYFO4T01F0mmRbqFX3P9UhLzVE2SvMuZsNmE6vicUi58IegFJ2/hLpL0MVV4AaihFU+KVIfYBneVPfv5Q6F5HrchIg3B2fgepbjgZ/ZcbDHi37/diJA3X467K4Fw5kgRLjNKA9/JvFPEnJMQc8pcs80jQaTt0wDuoHxu/TrzbZB8Ep6od4kYkpYQEfI3gdIJghu+3/s6kleEkmMUS/Pu3qSIAwRyx6nZRDGvb7gFaNni4QtytiizbG42bnlbzz4edL9rQ6/IdaBXjpIUh7B9z/By4306hOKS+UQDqcWBIXCFq7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W08ToNQ0HvFoRZ7bSM24X72uJIkIZCz0cIpKyuh5ALI=;
 b=kUSDoL2joMTxLjbcCr8JNMIriEs7a6XcngorzZ7afGSnBiqDKoyDC26ePYUKEprLXeHLnAWlwl7iVC+CcD351OGQEvSmcAzscf6GDfRVSLQg6axwwZgit/tvXFmdw1eIi6oS+9qv0xB1atj/EliNM7tFzdMCFOvXw4odsloW5kGfKXXl6yGy3CTo0z6tKVGTdJiYravVf8jaedRCZyOR5ywBgvcVqtHpR55sINl9TkpN+/M4fCQE7RtLJDb1M2e5RozEL9xaBF7DTIvEvGg0kOb5FfvBUscxvobDcm2grsC2VaInzkG4+U+IYv8n9o0tEEoZV/v3YYUvwQX2itNArw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA4PR04MB9296.eurprd04.prod.outlook.com (2603:10a6:102:2a7::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Wed, 18 Dec
 2024 06:01:43 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%6]) with mapi id 15.20.8272.005; Wed, 18 Dec 2024
 06:01:42 +0000
Message-ID: <aba80c42-1b48-426f-b29d-88bf18473602@nxp.com>
Date: Wed, 18 Dec 2024 14:02:18 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/7] Add ITE IT6263 LVDS to HDMI converter support
To: Maxime Ripard <mripard@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, catalin.marinas@arm.com, will@kernel.org,
 abelvesa@kernel.org, peng.fan@nxp.com, mturquette@baylibre.com,
 sboyd@kernel.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 quic_bjorande@quicinc.com, geert+renesas@glider.be,
 dmitry.baryshkov@linaro.org, arnd@arndb.de, nfraprado@collabora.com,
 marex@denx.de
References: <20241114065759.3341908-1-victor.liu@nxp.com>
 <20241217-uppish-sapphire-dinosaur-4c40a2@houat>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20241217-uppish-sapphire-dinosaur-4c40a2@houat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR06CA0194.apcprd06.prod.outlook.com (2603:1096:4:1::26)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PA4PR04MB9296:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f953622-1aa4-4c44-55d2-08dd1f297205
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VmdPMU5leWJPSnBMaG0zQzgveDllVVNaeUNHcDB0YzlMOTMwRUQySG54d1dx?=
 =?utf-8?B?ZFBNSFNzYUZkeU5TM0FRcW1QMHFBM1p5TllUOGtYTDNhUFNxYVcwMlRSOHZH?=
 =?utf-8?B?T3VNaDhsRkpXc0E4VXZYTFVOYXRqRkdHbFFGL2tKWkoxZUtRN21jQjRnZUhO?=
 =?utf-8?B?NlllQVlaVkl0dFErbkQyNDJMVi9VSU1xUEhRQWhwbFloTThEWEdLekloTUVp?=
 =?utf-8?B?UWgxYStUc2VnSkZXMXhkVUlJTHlERlZZT3RaY01NY0ZCVlJOaHZqYVlVeDcw?=
 =?utf-8?B?S3BHUFlicWp4ZWdCSjhSRytnTng2TkJpVVVwQ1ljeEtMeWdyeDhXTGpYWE5C?=
 =?utf-8?B?TUNXdEkrYURIUXRUREVNQlhBNG50SUtnSmRwSzdEVW9VQWZSUFFCWEM3dEth?=
 =?utf-8?B?SWtWQWczUkJlMFJmSXRxQ05NTzZmOXc2M3FadWc3OXZMdWFWT2FVNGh0U0Vz?=
 =?utf-8?B?UC9MV0hEdlFveHZTSGErOThZMWNVSDZreElScklCbXRCbGk4Y2N5NEIwV0RH?=
 =?utf-8?B?ZXpVYjV2ejNOSVgyL3pKY0FpSFRSL2lzVisrbURjbzhBUmhXYnlQWktkbzcz?=
 =?utf-8?B?YmorcXZFcVQwUmVnYUQrMkVOdzlkWU4zOTdFVkxncE4yalZrQk9YaWo1TmJM?=
 =?utf-8?B?WkNDZEkyK0xTUFlWMmc4V1p6bUtrbXVIM25aT1NmaHQ5dzRQYy95U2pydG92?=
 =?utf-8?B?NEgvMkI3SHBybmVVWDYrNGVBOVQ5TXg1ZnZTc040YWlxM1pWY2tiWEd3a1pX?=
 =?utf-8?B?SnZGM0Yra0hlNHlpdWR4TU10eU8yZFd6YUtpcWhRUVN5N0ZMcklKaGpEejQz?=
 =?utf-8?B?OFVjMXNsODYzaGM1cXJwcDAzV0lvamp5eDZOZWgvd1JBZWQrcFdpYlRhYUVq?=
 =?utf-8?B?SjlBY3VWRi9NYTJ0dU44ak1SZFlGTHJ2WTltOGxCN3g0RWtvMjNNRGJ0Nmdo?=
 =?utf-8?B?TzZoL3pQMGpicmoxWlpPTUJkaXNsVmlsOGR4NjFjekR6SzFTS2pPSGJSQjlP?=
 =?utf-8?B?dG5qTGF6RmZxMm9wenYza0VhRGdadFZLN1pDb0lQbDFTSms2VndPYU9HTGJ5?=
 =?utf-8?B?ZEdqMUk4TXdPMTk5T0Q2MS9XV21YUXhJUFZ4MldrSjZMOVdJN0ZFZFNPMkRi?=
 =?utf-8?B?eUw1ZkNtS2hhR28vdERSSXdDN0FRRkdWOFVIR0NuS29JSldPRWlVSFFzbEdE?=
 =?utf-8?B?dS9icGRURGlKTUdyL05rZ1RjNXZlenpPbU5NY2FETDFMNmRteHErZ0dpRW40?=
 =?utf-8?B?QWU0UHRHcmQrcjBXZ2NmbzRCYUJCOEwwQXpETzRPbGJkV2RmWE1nay9sRUNH?=
 =?utf-8?B?cTZ5KzF0NUpkNXhya0RWdTNzT0wzakFzNDBOaktQem5Da1hBNGM2di9hWDdq?=
 =?utf-8?B?eHBGeWJOOWZlYXI5Y2NnZjNadXUzbk9KTlBOakxiZUlZcmFlSytuemxnTWx2?=
 =?utf-8?B?bmtnVk0xcHpHeFd4OGtDL0w2TFpVUWQ3YUdQa2VmMlVLaGJnd1prQWFXZFYy?=
 =?utf-8?B?U3hXTnpzQUZRMlM2T1FYeThweUxjdWYxTEN6bDVrNVgzODBnRWlMRGVDRDlN?=
 =?utf-8?B?a0FYblM3R1E4TEFWNVlXRHk5NUwvTXpHQTJDL2JTSEhrYUtQN1RlSVBkNFdk?=
 =?utf-8?B?dWVYdVJ5YXd1OU5GYWlwRnZKUWFsODJEVnY5UmxOUHhjUVViZVJkVGo2ckwv?=
 =?utf-8?B?Q0hRdC9wdy9XUVhuRng0R3ltaUZ0aXBRN3NnR0xWWE92OGJyV2Z0KzlIdFdR?=
 =?utf-8?B?UGpyNWNuYlJtWUtoZlpJMTlOcG45YXd0N0lSK0pZSWsvbGdsa1pQNmhmTUpT?=
 =?utf-8?B?cXpRZ2tpdS9KSWJjaGxvNGUwMmNXZGxLdkFRNEhWaWdTZ250dWxYbEJVMmNS?=
 =?utf-8?B?anJQTkRlQWZtM2pwVU9RbnFXM21JbmVCSUt0TnJvL2tpSUE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N3h1aDg2c3V3TWROOUtTVEVHUDk3MHFVTm05WFZ4ZE1KcGw5NkVqY3g3QUE1?=
 =?utf-8?B?UkdQUTFrdmxZV0R0cHR6R3Q1Z0w1c1BHM0VieEc3M2E2dWRDVzhSbXl2VmFG?=
 =?utf-8?B?ZmRjbTh3Um9hRVBsT1FpMjdMMUVaVzdYaEZhTS9CRzc0dmJBWjIwL28zOG93?=
 =?utf-8?B?TmppM1V3YlgzaW9qQjdwY2NnZDZtQ3RUaFdSN3NVUEFpd3MraE5lTXZ0TkJC?=
 =?utf-8?B?QTR0RHcxY0lBMXVlNjRYVno1NlJQeUVpUjN6d3BCNkhjcWN1eFFNT2dnOGxm?=
 =?utf-8?B?VXc5SFh4RE5Ud0thNTFzY3lDbm9lZW1vamF3cnFTVHdkRm9MQjRFWHVuM1VD?=
 =?utf-8?B?NElWa3NiWi9PSDQzNDVhRy83bjZrdnFUUHM4SzJ2SGMxcG9MTnYzckZzdW5q?=
 =?utf-8?B?SXBHOGJKaDB5N0tqLzFVWFNBbWtmbFYwdUVKVmE4UFRUSFlqRk1Yeit5V1RW?=
 =?utf-8?B?d2FIVmd0T1p3eCs1NmMwWFd6QmtEVUErUmp6MTlWV2lXWkxDemlVaFphbHNC?=
 =?utf-8?B?dEJoUkFZWFZFYXBBUXRYdTd4K3d5TVp5dml1NnFNZkRqSlo0NDBUTG40VVdQ?=
 =?utf-8?B?Q2xQR1NQRlNHdlp1TzBOcVdkc3BkTVFSek96cGY1ZjI3djlvYklsd3NkOXBY?=
 =?utf-8?B?NiszbUJOV3dmd0RnTFoyQUFuS2gwMW1FV0xqTGtRa0R4UCt6YnUxS21tOFV6?=
 =?utf-8?B?U3BPNVZDenQ5OGhQUFhrdUZHV0F0bTYwQ2o4bFQxdk9qUkZUckZmODYyTmJZ?=
 =?utf-8?B?QmtwUFZ6N05tU01QRmFmOVFRWFRvcHJlcThCU0VEdTYzN2E1RFdyRVV0M1BS?=
 =?utf-8?B?K09HZnZCMGRVUzYyNnc2QzlOTEVta1RqT25lbXRjSDVSRllmdGhCMjNQRWVu?=
 =?utf-8?B?TVhCMVF0RkZUS2JzUlo3WEkwSllvcHVxd0Q5QnVTaEZITVlLOS9vYnFidndM?=
 =?utf-8?B?azF6RVE2M1BlNkg0bThTRUJKdVZsYnpUa1ErWThIR0RsZXB0QkRuMU45ZEtS?=
 =?utf-8?B?bHh3Qk4vQWE4NWxYdnNmQ09URVZqUFlpZnRtelphTHhLQ3U0cFRUZld5L0py?=
 =?utf-8?B?RXBaZ2grZDFZSnE2eUFzTVNDUnJIejNSV3Z3WDBKbXVORlhKMXRseEViOGl2?=
 =?utf-8?B?Y01pZWRzNU5ybjJlc2VuK3phVDBuZG52ZlFXVVJiVW1ualJvaHJ2SU8vN2Fa?=
 =?utf-8?B?ZlFCa2JGeXJKRWN6WGxhSjhFTzN4cTRFQlREQzVQd1ArTVRTYTA3VXFFRGc2?=
 =?utf-8?B?Z014OGx3eTQ4STZBNWhOaXJobEREeWprRG9RRk03UW5MeDhsSkcwbjNDaEsr?=
 =?utf-8?B?ZHdRYVNXUkdBM0c2YndwMDhneXlVWVZkMHdlNml5Z3Jjc0plYnZhU2lHWVUx?=
 =?utf-8?B?SURkcWo0VGd0Qnk0SHEvRjgwRUxydnNXaGZSQlRoMWtzVlZNUlY4YS9iZ2NQ?=
 =?utf-8?B?TTFBT3Zwa0JuSDY1bzVzWForSk9vNzEvQ1BOS21zYUtHVUoxZVpwNDQvWXpG?=
 =?utf-8?B?b0F0S3JzL1RNdVFTQlNhRFAvMzJxNHVJMUR2RDA0VGZhWHJoenAvYkZkZ0RW?=
 =?utf-8?B?UGNUUFBvTUFFK3ROcDZQd0EvRjJ1OTA1dHVDUTZUa3Q4WUNaWXkya2laeVBp?=
 =?utf-8?B?WUhPcTNXWkJPRFJ3d0VDekZGRzhkYVdzSURWWFBjZ1p2ZjNGMUk0YnpWQzFK?=
 =?utf-8?B?UmV5bkMweG5YY3JCNEwzMERHVmk4aFhySUt5RzNmeU0wUXdvSXpTRkRJb1Vi?=
 =?utf-8?B?NzUvQ2lsZGM3QnFxaStDeHRkMHppcmx4dWNsN1dlaGN6ZDA5TDdmTkJyb1Vy?=
 =?utf-8?B?Z1Bkb0Qvc1lYWVNETXcxUlp4ek4wVEQ1VHBxaTlFUnJKWGt4eWRBRllsOHNk?=
 =?utf-8?B?c2RJVm45WVBlTFZ6YnlmSjY1UldXNlNSN0t0VGMzOWV2bFpTSENyVy94bGk5?=
 =?utf-8?B?clFrd3VOQWo4SWxsd3h2VXNWOFZ0N3RGaXM2RXdGa3hwMVlrMWZuWElVZUpn?=
 =?utf-8?B?RE9SS3VlcVVaV3BqVVhUUWl3MTFlWm42dTg0VU1WYk9CRVR4VmI4alpQcVUy?=
 =?utf-8?B?ZHJGelc4MzdvMm1OSGUvUndMbUhza0RtZWFPOERCV091RTQydHFkS1JCUUVy?=
 =?utf-8?Q?pydI4rf1O1iFgDKgcZ4zQveAU?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f953622-1aa4-4c44-55d2-08dd1f297205
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 06:01:42.7649 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HIPpIcbL3kI9ixF4A9AR69lLigUyqloGHBB4TYk5uVlb9GHqhVod76CLbW8QuMIh7g1aXn8z55InzWuEGh44Dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9296
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

On 12/17/2024, Maxime Ripard wrote:
> Hi,

Hi,

> 
> Thanks for the description, I have several questions here.

Thanks for the feedback!

> 
> On Thu, Nov 14, 2024 at 02:57:52PM +0800, Liu Ying wrote:
>> This patch series aims to add ITE IT6263 LVDS to HDMI converter on
>> i.MX8MP EVK.
>>
>> Since IT6263 DT binding and driver were picked up from v5 and landed
>> in drm-misc, this patch series contains patches almost all i.MX8MP
>> SoC/platform specific.
>>
>> Patch 1 is a preparation patch to allow display mode of an existing
>> panel to pass the added mode validation logic in patch 3.
>>
>> Patch 2 is a preparation patch to drop CLK_SET_RATE_PARENT flag for
>> media_disp{1,2}_pix clocks.  Patch 5 depends on patch 2.
>>
>> Patch 3 allows i.MX8MP LVDS Display Bridge(LDB) bridge driver to find
>> the next non-panel bridge, that is the IT6263 in this case.
>>
>> Patch 4 adds mode validation logic to i.MX8MP LDB bridge driver against
>> "ldb" clock so that it can filter out unsupported display modes read
>> from EDID.
>>
>> Patch 5 adds mode validation logic to i.MX8MP LDB bridge driver against
>> "pix" clock so that it can filter out display modes which are not
>> supported by pixel clock tree.
>>
>> Patch 6 adds DT overlays to support NXP adapter cards[1][2] with IT6263
>> populated.
>>
>> Patch 7 enables the IT6263 bridge driver in defconfig.
>>
>> Note that patch 3 and 4 depend on patch[3] in shawnguo/imx/fixes.
>>
>> Since this patch series is related to another one[4] authored by Marek,
>> Maxime asked for a proper description[5] about the exact problem.
>>
>> Admittedly, it's a bit complicated.  Here, I'm trying to do so and explain
>> a bit more.
>>
>> [ Description ]
>> It's a clock problem about shared i.MX8MP video PLL between MIPI DSI and
>> LVDS display pipelines.  The pipelines are driven by separate DRM driver
>> instances, hence there is no way to negotiate a dynamically changeable
>> PLL rate to satisfy both of them.  The only solution is to assign a
>> sensible/unchangeable clock rate for the PLL in DT.
>>
>> Admittedly, sys_pll3_out can be another clock source to derive pixel clock
>> for i.MX8MP MIPI DSI display pipeline if a particalur i.MX8MP platform
>> doesn't use audio(sys_pll3_out is supposed to derive audio AXI clock running
>> at nominal 600MHz).  However, for i.MX8MP platforms with audio features,
>> the shared video PLL case has to be handled and it determines that the above
>> solution(unchangeable PLL rate assigned in DT) has to be used no matter
>> sys_pll3_out is for display or audio, because the separate DRM driver
>> instances really don't know if they are sharing the video PLL or not.
>>
>> [[ i.MX8MP Display Hardware ]]
>> i.MX8MP SoC supports three display pipelines:
>>
>>  -----------------------------           ------------------------
>> | imx8mp_media_disp_pix_sels  |         | imx8mp_media_ldb_sels  |
>>  -----------------------------           ------------------------
>> |  osc_24m (fixed 24MHz)      |         |  osc_24m (fixed 24MHz) |
>> |*-video_pll1_out (video)     |         |  sys_pll2_333m (sys)   |
>> |  audio_pll2_out (audio)     |         |  sys_pll2_100m (sys)   |
>> |  audio_pll1_out (audio)     |         | -sys_pll1_800m (sys)   |
>> | -sys_pll1_800m (sys)        |         | -sys_pll2_1000m (sys)  |
>> | -sys_pll2_1000m (sys)       |         |  clk_ext2 (external)   |
>> |  sys_pll3_out (audio ?)     |         |  audio_pll2_out (audio)|
>> |  clk_ext4 (external)        |         |*-video_pll1_out (video)|
>>  -----------------------------           ------------------------
>>              ||                                     |
>>  -----------------------------           ------------------------
>> |   media_disp{1,2}_pix       |         |        media_ldb       |
>>  ----------------------------- mux+div   ------------------------ mux+div
>>              ||                                     |
>>  -----------------------------           ------------------------
>> | media_disp{1,2}_pix_root_clk|         |   media_ldb_root_clk   |
>>  ----------------------------- gate      ------------------------ gate
>>              ||                                     | (LVDS serial clock)
>>              ||                                     V
>> 	     || (Disp2 Pclk)  --------      ------------------
>> 	     | ------------> | LCDIF2 | -> |       LDB        | -> panel/bridge
>> 	     |                --------      ------------------
>> 	     |  (Disp1 Pclk)  --------      ------------------
>> 	      -------------> | LCDIF1 | -> | Samsung MIPI DSI | -> panel/bridge
>> 	                      --------      ------------------
>>                               --------      ------------------      ----------
>>                              | LCDIF3 | -> | Synopsys HDMI TX | -> | HDMI PHY |
>>                               --------      ------------------     |     +    |
>>                                  ^                                 |    PLL   |
>>                                  |                                  ----------
>>                                  | (Disp3 pclk)                         | |
>>                                   --------------------------------------  |
>>                                                                           V
>>                                                                     panel/bridge
>>
>> * video_pll1_out is supposed to be used by video outputs.
>>
>> - LCDIF2 + LDB can only use the *same* video_pll1_out, sys_pll1_800m or
>>   sys_pll2_1000m.
>>
>> [[ i.MX8MP Display Drivers ]]
>> LCDIF: drivers/gpu/drm/mxsfb/lcdif_*.c
>> Three LCDIFv3 display controllers are driven by three imx-lcdif DRM instances
>> separately.
>>
>> LDB: drivers/gpu/drm/bridge/fsl-ldb.c
>>
>> Samsung MIPI DSI: drivers/gpu/drm/bridge/samsung-dsim.c
>>
>> Synopsys HDMI TX: drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
>>
>> [[ Problem - Shared Video PLL Between Samsung MIPI DSI and LDB ]]
>> osc_24m, audio_pll*, sys_pll* and clk_ext* are not for video outputs,
>> because:
>> a. Aparently, osc_24m runs at fixed 24MHz which is too low for most displays.
>> b. Audio subsystem may consume all audio_pll*.
>> c. sys_pll* are system clocks which are supposed to run at fixed typical
>>    rates, e.g., sys_pll2_1000m runs at 1000MHz.
>> d. sys_pll3_out is supposed to derive audio AXI clock running at nominal
>>    600MHz(i.MX8MP data sheet specifies the rate), see NXP downstream kernel:
>>    https://github.com/nxp-imx/linux-imx/blob/lf-6.6.y/arch/arm64/boot/dts/freescale/imx8mp-evk-ndm.dts#L19
>>    https://github.com/nxp-imx/linux-imx/blob/lf-6.6.y/arch/arm64/boot/dts/freescale/imx8mp-ddr4-evk.dts#L25
> 
> Is there any downside to using any of these clocks, aside from the fact
> that their rate must not change?

osc_24m and sys_pll* don't support spread spectrum while audio_pll* and
video_pll1_out support it. Other than that, I don't see any downside to
use any of these clocks, if their clock rates happen to meet the clock
rate requirements of the MIPI DSI and LDB display pipelines.

> 
> Also, if they can't change their rate, why do they have
> CLK_SET_RATE_PARENT (sys_pll* in particular) ?

If media_disp{1,2}_pix and media_ldb clocks have no CLK_SET_RATE_PARENT,
it doesn't mattter whether their parent clocks(these clocks) have it or not.
Note that patch 2 drops CLK_SET_RATE_PARENT for media_disp{1,2}_pix clocks.

Anyway, why have sys_pll* clocks got CLK_SET_RATE_PARENT? The reason I can
think of is that it makes some potential i.MX8MP platforms possible to set
the sys_pll* rates with the parent clock rates(sys_pll1/2/3) updated
accordingly, e.g., if sys_pll2_1000m is the only active child of sys_pll2_out,
sys_pll2_1000m's rate can be assigned to 800MHz(not typical 1000MHz) in DT.
Or, maybe, the sys_pll* rates can be assigned to some particular values to
support nominal/overdrive modes of various i.MX8MP clock roots(some are
derived from the sys_pll* clocks).

> 
>> e. clk_ext* are external clocks without known capabilities.
>>
>> So, the only eligible video_pll1_out is supposed to be shared between LDB
>> and Samsung MIPI DSI in the two separate display pipelines if sys_pll3_out
>> is already used to derive the audio AXI clock.
>>
>> With the shared video_pll1_out, drivers for the two display pipelines cannot
>> change the PLL clock rate in runtime, since the pipelines are driven by two
>> DRM driver instances.
> 
> What is the typicall frequency on those pipelines? Could setting the PLL

For MIPI DSI to HDMI(ADV7535) and LVDS to HDMI(IT6263), the typical pixel
rates are 148.5MHz(1080p60Hz) and 74.25MHz(720p60Hz) and the typical LDB
clock rate is 519.75MHz.

For MIPI DSI panel and LVDS panel, there no typical pixel rates. It depends
on individual panels. However, it's possible to override panel's pixel clock
rate in DT to use a fixed PLL clock rate if the pixel clock rate deviation
is still acceptable by the panel.

> high enough that any frequency required by any of these pipelines can be
> accomodated through a divider work?

Yes, that's why media_blk_ctrl node in imx8mp.dtsi assigns video_pll1 clock
rate to 1.0395GHz. That rate supports the typical 148.5MHz and 74.25MHz
pixel clock rates. With this patch series applied, i.MX8MP EVK would use
this fixed 1.0395GHz video_pll1 clock to drive both MIPI DSI to HDMI and
LVDS to HDMI simultaneously.

> 
> Something like you run the PLL at 594MHz, and then most HDMI frequencies
> can be reached by a 1, 2 or 4 divider.

PLL running at 594MHz does support the typical pixel clock rates for MIPI
DSI to HDMI, but not for LVDS to HDMI due to the 7x(single-LVDS link) or
3.5x(dual-LVDS link) folder between LDB clock rate and pixel clock rate.
PLL running at 1.0395GHz is the one chosen to support both MIPI DSI to
HDMI and LVDS to HDMI, e.g., with dual-LVDS link, 148.5MHz pixel clock rate
= 1.0395GHz / 7 and 519.75MHz LDB clock rate(148.5MHz * 3.5) = 1.0395GHz / 2.

> 
>> [[ Solution ]]
>> Assign the PLL clock source(s) and the PLL clock rate(s) in DT.  Disallow
>> display drivers to change the PLL clock source(s) or rate(s) in runtime
>> including LCDIF driver and bridge drivers.  With sensible PLL clock rate(s),
>> typical display modes like 1920x1080@60 can be supported if external HDMI
>> bridges are connected, and panel display modes can be too.  Also the unneeded
>> CLK_SET_RATE_PARENT flag can be dropped for media_disp{1,2}_pix clocks.
>> If needed, bridge drivers just call clk_round_rate() to validate clocks so
>> that unsupported display modes can be filtered out.  Although the
>> unchangeable PLL clock rate disallows more potential display modes, the
>> solution works for single/dual/triple display pipelines(OFC, hardware designers
>> should pick panel/bridge display devices carefully first by considering clock
>> resources).
> 
> I think it's a reasonable idea, if not for the hardcode-it it DT stuff.
> If we can manage to have a fixed setup work ok for all display use
> cases, why would it be in DT? The clock driver seems like a much better
> choice to me.

Different i.MX8MP platforms may have different display devices(panel(s)
and/or bridge(s)). It's flexible to allow each platform to assign the PLL
rate(s) in DT. It doesn't look doable with clock driver, does it?

> 
> Maxime

-- 
Regards,
Liu Ying
