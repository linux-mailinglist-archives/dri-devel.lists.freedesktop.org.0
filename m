Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB6C94747D
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2024 07:01:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13BB010E107;
	Mon,  5 Aug 2024 05:01:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="Wa2lvfEg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11011068.outbound.protection.outlook.com [52.101.65.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEA0910E0F3
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2024 05:01:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D0OasLHACCxWXDyxFYyqXXfpMxbG+Ev25utv7xvGZEit/cgxrVKvaRHbZSWrRhQUiteWzpLxi885Y7G91XL5BdbdK0N74ou3fSiwg5aRSPVZZ7wejSK1SR5ogfsPtwHobkzcO8iuJOwAcYau+yXaSH+kr3VypOyShzXPbI6+9gYdiOt3tNc/5OE/sdjlPvq3Y3MHZziwsHFyRyI41hMQEfDgTwSrCoSCOR/RUKZAX7hMe7pD4ON3wwoVqw6b7rECBFC5EuOPcD+06mX9m63VDnDGYjP4I7BkpC/l+2p6LZkneYGo7eUU9L6lXjLL2ZPiQN/kwLPxcQgxQa+BrCevPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A9/Y7X8ijbcgMzS7P+Jfu5Xpm9dUImg9BwE5fP8av7U=;
 b=WDT9R4hYwVnYdaizowQiAk/5nkYDsLxYrxLpXIVu6k9ETBZpnaWvkQXIhYObpM6NZLTCPR6pGXHTn0ngNUmhiEoBYQg8P5FJZ1zmcwMAYBRQ0o8a4js2FisylnPLKoj286TWGzygMegGAAYfxAZ6Sq9RSTUB4qTM+djAZ59FE6o2T3/Vg5eUYiGE8z+aQ+VIWsyuMgkeMbNSbR0wcpUL48UauZKZYdTGDy5lXctgejIAGPwiX+UIDmg8PhO4tsLe4hINl8ilpkrPioTb0f2/vCytr/+5LzmGGr4n4iB2p0444j4yasw3v3Tepm1NoYzpPh/FKUQoalj2Bvt/93WUag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A9/Y7X8ijbcgMzS7P+Jfu5Xpm9dUImg9BwE5fP8av7U=;
 b=Wa2lvfEgCI2bTc0jxHpxVQitdNfhcoK8baCLMn9NRewTokRCbLiw78Qcv58Fa+shngbBdxv4ilg+0VWT1MFpw73Qf1VRxqT8BxOJpjDqpR9Hl7zFF5Le0RbwZPbxzi7FTyq6R3WMl7P2cNFaqAdy70vyXDTk6Zt9HTdXAnHqHiUP5utYeK58dpNR/oyiBGiNbbOf2KsTogrfe/fHJ6xoGNmMgQl3rAFJpECJWkxpHut+qJpR3ZexSAoLx+BDdj6Zs7ca4ni/xmutEH3LkciOTCjTLqLPEGfkYfxV9T0JRoXQxWooWKSrpylmM8qfjmfua9HAp70rnqcOEEob0QdQWg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM0PR04MB6835.eurprd04.prod.outlook.com (2603:10a6:208:180::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Mon, 5 Aug
 2024 05:00:57 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%2]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 05:00:57 +0000
Message-ID: <722ea510-3d69-4c75-99a5-62f52c86082a@nxp.com>
Date: Mon, 5 Aug 2024 13:01:25 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/16] drm/imx: Add i.MX8qxp Display Controller KMS
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, tglx@linutronix.de, vkoul@kernel.org, kishon@kernel.org,
 aisheng.dong@nxp.com, agx@sigxcpu.org, francesco@dolcini.it, frank.li@nxp.com
References: <20240712093243.2108456-1-victor.liu@nxp.com>
 <20240712093243.2108456-10-victor.liu@nxp.com>
 <reuwtcszfrh5vtkuckkng5zejbj3nh7ahgf2igy2kpyskxrgox@oigld6uy55aw>
 <93485a85-65d6-4c49-9869-19248efefae7@nxp.com>
 <3qmhbkx63hhncn3dl35tkhqcdo5bh2jypsfck656ylqrzfy4va@6xkgo32eg5du>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <3qmhbkx63hhncn3dl35tkhqcdo5bh2jypsfck656ylqrzfy4va@6xkgo32eg5du>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR04CA0200.apcprd04.prod.outlook.com
 (2603:1096:4:187::15) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM0PR04MB6835:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b9db343-41ce-43ef-65e0-08dcb50b9774
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eW1pYVpjM1hTYkpOQmJIQ1JtK1hSUHduWGtKWGg3NmxEZVJxTHF2MW1QbmNL?=
 =?utf-8?B?WUFQMDFPbjNFaFZxYmhoeWpTMjRtWnEyeFBORGRjWUtLSkgyOVlNNEZhNnJr?=
 =?utf-8?B?YzJaVGFnK1R3L2NQbG9PSlQ4MW1FYm1pQTdoTmRaRFdRQ1JPZDh5QlVXSzdV?=
 =?utf-8?B?OVh3VGR4K0hMR0NZZk1mWEZGZkhTVXQ4azgrQ3grMUZubE5hQUh0dVlscTZF?=
 =?utf-8?B?NGJUYTh3ek5RdHllOHhwZStPaVRzVzZETmZvNWRkbDNSUEVjOHh1UXJOd0Ro?=
 =?utf-8?B?VndEZ2JPSnI0VWpwc1AxWlhuU0dHVXN6MVBYbUlDbmhHeVcyS2VqSzRUR3dz?=
 =?utf-8?B?a1N0N0VPTnRDQVNvUWhkREFEOGg4bS8rVitvOXlpc0xpeElZSCtCUERGUG4v?=
 =?utf-8?B?M1VHeERBRnI1dnFIeEg5K0IwdTJvQ05iS2g1d0wydGFNc2trZE52WDhMUWsv?=
 =?utf-8?B?T2lVcUJrMGdVM1oxbFBtRk8rWHlKbk1NaUgreWFBVW1oRlZZWnl0dkpRVHpM?=
 =?utf-8?B?QmQ0M2NvSzB4ZEZFZ2QzTUhjZ09LODNxQ0lyMVdoZml2MitCRExxN01Bc1ZS?=
 =?utf-8?B?SzJabFBnZVZpZExwZkNJSzJoWEl1QjFWaHQwQUNKdjYzLys1T2E5VGU5SDd5?=
 =?utf-8?B?QmkzallUTExpMlBYdUpFWittY2dERFJGQVJTOTBxck9SdThvZzF3dVRRaExM?=
 =?utf-8?B?azhZWkNIbVdiUUIyc2JWQWdSR0Q1ZmszUzEzV1RTOG5GdEhpMDBRUm1VOFg1?=
 =?utf-8?B?REJTMVR1MG0xUkkvU2pJNTVhVTRnN2RZbGg1bXd1bXpkdENhYk9kNm9YM2lu?=
 =?utf-8?B?UkFITmZNdTVGUjhzcVR1VlFoSzNvVTFsYnZhZ0x0OU1ac0loYjUwajJ6c2Rq?=
 =?utf-8?B?QWVTRFpjSGtFMmRxdHJzQldIQjNTSS9LRHZwdjBtVUpQeGhmWWpkclE5a0Za?=
 =?utf-8?B?eFFuR1B6K2xJK205UHltdW5LaXVLNDhDUU1QZHNLMUE3YldIWTdZNmtFMXlQ?=
 =?utf-8?B?T0xHRDZYS2s5c2IxNVd1ZFMwZFYranBjUlVDcWtJRzdyNkJkZEVpTXYvUUhL?=
 =?utf-8?B?ZTRzcHBpSzNkcHQyOTkxcGRlb3RkdmF4NUtSL1MycFZuVGNXeHZBNzg4elND?=
 =?utf-8?B?WThqWVNNYVFRWEthd3lSdnluYmwvdjJzMVY0Y2x1eVBobGIyRWxkbkFXMDN3?=
 =?utf-8?B?RjRUVnc0RVM5cjJTSXcvVGFwTUhQcWNpODkzazQ3RzVLcXB6MStWY0dxSFpJ?=
 =?utf-8?B?MlRZNEh5ejFGL0RlWnZkNy9QblA1RWxzdWl6dWMraEFaNFJRQ3BCRkJqSzdz?=
 =?utf-8?B?NFNmZ2ZmR1ZtQWtKTXFTK3IxbzRiMHRaUzJtYlRnWEdSOUFPWEt4MW03cS82?=
 =?utf-8?B?Z3l2ZVBIaU1TVmhaaG5QVTBGQlAvbEt0MGNCclQ1Z2dTMmkvUnc0anN6M3h6?=
 =?utf-8?B?RUF5czU4U1NVNkFjWnA5S0g4aDhWSG5vRzlpZVR2OWk4NXgwZklBOE9wMjhx?=
 =?utf-8?B?M2R6SmZIMzIvb0x3bjdKZmxkaE5sZHgySlM5VHlBb2owL0RuMW9wRlZRTE5Q?=
 =?utf-8?B?YVo4V2NCU2hCNmVIRXlhL3djTG52MGduVDhmT05VaUlCWUhjU1N6eU9Fa0M5?=
 =?utf-8?B?cjdjSVh3dTlVTTNHMkNyMzAvcHkwQ2VvTkRlSi9XU3E5cUxnMGY2S2NQMTZ0?=
 =?utf-8?B?TzJ2QjZDdXIvRmJSNU1iZEVPRXZCTDA3NHF4QUwzTzdEVmdqR1F4dGJxZGFi?=
 =?utf-8?B?VkEzQVc0OElkQXA3YzBFK0VFYWdROVdOS3UyMFdCeHlVOWdLYk9CRVBOejRE?=
 =?utf-8?B?Q1ordm9UcFFnQ1M0M0F1UT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?LzN6SmRCLzlFSE4weEd6bzJuVWVUckpXR1hWdWc3YUEwSjVaakxEZWF2NENr?=
 =?utf-8?B?YUdwWEtQQkNhcElEVUs1SlFaWWw1QjNnN1hObzNQVCtjQ25WdmI4UTRyTHRa?=
 =?utf-8?B?UnZXcGI4T2FFdlB5bWZ0VnVRWGlvcFp2UFlkMjNGNVBaMEpML0c1NW9LZkhC?=
 =?utf-8?B?Q2MwUHJXbFhJbU1qZzg1c3Q2cThoRVlJck5aZWpYTHJCMlllMUxBK283VURZ?=
 =?utf-8?B?TUM5QURweGJTUE9rT1h5bjFxN0F2WkFhRnU5V2lqN2pvR3RsdVhRSllmT1Bu?=
 =?utf-8?B?TERSQ1hvZG1nVGRnN3JjWEZTTm42MStneHBTRDBkTmJaaDJ0NGs5OVRPN25X?=
 =?utf-8?B?RjIvNU5GcFhpQWg1ckUwRll1dXkxdnVMbEltU1JIT3czK2RuMGRNOWZDa0Fs?=
 =?utf-8?B?QWI5MlJJdlZLSlJtRHZjc29wSDZiSy9kN0JmYUdBNVI4YXp0WGNTQXdjM3B2?=
 =?utf-8?B?TFkyUUxSUXpiWU5LdXZJM1ZZWk95WlpnKzdLRzV4SXc3aDRiT2F1ZGhBWmFL?=
 =?utf-8?B?eGhTY0hWZCt2Qm1wRnhKVVozUlZBekM1aExIOWZwcXhLVW4zV3hFUXJYN0tE?=
 =?utf-8?B?ZGk0eVRFYU84d0hVaXNDcFpmWWVJZFVaR0pRZkFEZGpxWllYU29JczlURlQv?=
 =?utf-8?B?Y1VNdy8xTVpWSDIxaW5zaGhNS0hRdFpQVjU1K0hBNTFiOUJ2d2VLa1RpZGV5?=
 =?utf-8?B?cTkxSDB3S2F6dk4rN2kySnV4aDVjQ3czT3ZWZno1Y1g0QjdKeGZ3QjAraC9Y?=
 =?utf-8?B?SHBFRnNCMVRoNHlCZndESzZVQVY5Nm5MbmN3SnlmQlBiRGNnaVBwdW9xWE9P?=
 =?utf-8?B?WkFHMWdnSVFoQ1BVVm1SQU84NnQ2T0tBdVdZNlJac0IrWWt5aHdYTnFLR0Mv?=
 =?utf-8?B?K3hLMDUxa1hHUXJqVGNnRVUxcHpZSzVVWkdCU1VmRTlkdTFzaUVUbE9vSVli?=
 =?utf-8?B?SnQ3bTdDRTBwVThpYk00OUthYUdaaTg2V3BjenVzOVpvMmVQUWU1dmFGSlYv?=
 =?utf-8?B?azdmUXVFZHVIbkYxQlpwY1dmWlRRVGk5Y1l4aitSd3lXRldUNXlEUk9xbUZq?=
 =?utf-8?B?eUVsR29Qb1QveTRFdGRYVWNVbGV4VGdFL2p4VWl1VzJIckZKV1NWZGZpamZl?=
 =?utf-8?B?VFJ5RnAwaUM4cXdTWHhzWDRRWURWWVlLd1JQQXdTaXg2SUVqbDV4UUFWbmk2?=
 =?utf-8?B?dkRWdGRnUkw0VU5VbUt1S1hUOGVDL1l5RmI4TXJzeEVFczVld2FvejA2dGNn?=
 =?utf-8?B?ZVpaYUp1UEJBTEpQSzB2Uko0ZEFvS05JTm5yUXN2Qk1XVGJ2ZXZjWkk3SVJ1?=
 =?utf-8?B?S0pKc3I3UmQ4K08wQjRCUVhuRjV6UEVtMWsyWDhFK3FsWXlDS0lzS3RXWXEw?=
 =?utf-8?B?SVZmUXQrTm5OR1hCRDRkSjVZb3BBUWdENXZTbWFjR3oxQWxTTjFSbEQzZU1M?=
 =?utf-8?B?Z0V1ZUFOOU8wbXZKS0JmdkJzYWtISEtOaktRNDU2Sklza3VGNTdWSjF0aVlq?=
 =?utf-8?B?L2w0NWNXRFVZYlZ5QjY2b3ZpUUt6ckxYK3JkdEJZcE1ITVF3M3dlSDZQaHo1?=
 =?utf-8?B?cW11UjU2cnQzaVJqQWlxem5yQXBnODdsSzh5QU50ZVFjekpZbjc0bzNmejRP?=
 =?utf-8?B?dmdEVnhlOHJIV0VQdEZ4ZWFhckxPOURJU1pPK3E3N1V5elpPSUpVTGJUMGhk?=
 =?utf-8?B?cCtEanc4ajN1UUJERnR4RTlMaGhFaEt1bzBJNkVwQ3NYTHBVczZQM0tJWTBV?=
 =?utf-8?B?aUxLQjNyaklrenhFQnBlUEVwbTFMWXp6UXprSW05RmNoZmZ2MUFiTk96b094?=
 =?utf-8?B?ajJtelA2emFPZkNkaklNbXZNcmF5UGgwM0o3ckFpdHlQR2JOTVM1OTdJVGpu?=
 =?utf-8?B?WUUwV282L05CSU1uWXllRGlUMHpRbjI3aXhBUmJHbDlyMEZma3Q5Skd5N25m?=
 =?utf-8?B?NTNoL0lmM0RiZmJWL2h5UTlHamxZamFDbWtaekx3dHMwRlV2ZFA5MGtQTHZQ?=
 =?utf-8?B?amxabzhQYVFCdFZXTlVpQkNBZUtobEFSRDJEWWlNQ1UwZU9DVGdwRjhDRTNE?=
 =?utf-8?B?K05XQzFXMi81eS9yZFhMVGt3SXhpYmV0WDlqanJFTWZMbzB1clhXZzU3Y1l4?=
 =?utf-8?Q?aDH5ugIp/MIr7dufW/mgEfAl+?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b9db343-41ce-43ef-65e0-08dcb50b9774
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 05:00:57.2713 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iUJi4C8Fh2YrczQ02Nu4wdb9QFDx9pOTDndD/nfz8x9d0pRJjtf9HRIFRazoWikxL8+uWBlSR180WcWXZdBo7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6835
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

On 07/31/2024, Dmitry Baryshkov wrote:
> On Tue, Jul 30, 2024 at 04:31:35PM GMT, Liu Ying wrote:
>> On 07/28/2024, Dmitry Baryshkov wrote:
>>> On Fri, Jul 12, 2024 at 05:32:36PM GMT, Liu Ying wrote:
>>>> i.MX8qxp Display Controller(DC) is comprised of three main components that
>>>> include a blit engine for 2D graphics accelerations, display controller for
>>>> display output processing, as well as a command sequencer.  Add kernel
>>>> mode setting support for the display controller part with two CRTCs and
>>>> two primary planes(backed by FetchLayer and FetchWarp respectively).  The
>>>> registers of the display controller are accessed without command sequencer
>>>> involved, instead just by using CPU.  The command sequencer is supposed to
>>>> be used by the blit engine.
>>>
>>> Generic comment: please consider moving dc_plane / dc_crtc defines to
>>> the source files and dropping the headers.
>>
>> struct dc_crtc is referenced from dc-drv.h and dc-kms.c.
>> struct dc_plane is referenced from dc-crtc.c and dc-drv.h.
>>
>> If no objections, I may drop dc-crtc.h and dc-plane.h,
>> and move necessary stuff to dc-kms.h.
>>
>>>
>>>>
>>>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
>>>> ---
>>>> v2:
>>>> * Find next bridge from TCon's port.
>>>> * Drop drm/drm_module.h include from dc-drv.c.
>>>>
>>>>  drivers/gpu/drm/imx/dc/Kconfig    |   2 +
>>>>  drivers/gpu/drm/imx/dc/Makefile   |   5 +-
>>>>  drivers/gpu/drm/imx/dc/dc-crtc.c  | 578 ++++++++++++++++++++++++++++++
>>>>  drivers/gpu/drm/imx/dc/dc-crtc.h  |  67 ++++
>>>>  drivers/gpu/drm/imx/dc/dc-de.h    |   3 +
>>>>  drivers/gpu/drm/imx/dc/dc-drv.c   | 236 ++++++++++++
>>>>  drivers/gpu/drm/imx/dc/dc-drv.h   |  21 ++
>>>>  drivers/gpu/drm/imx/dc/dc-kms.c   | 143 ++++++++
>>>>  drivers/gpu/drm/imx/dc/dc-kms.h   |  15 +
>>>>  drivers/gpu/drm/imx/dc/dc-plane.c | 227 ++++++++++++
>>>>  drivers/gpu/drm/imx/dc/dc-plane.h |  37 ++
>>>>  11 files changed, 1332 insertions(+), 2 deletions(-)
>>>>  create mode 100644 drivers/gpu/drm/imx/dc/dc-crtc.c
>>>>  create mode 100644 drivers/gpu/drm/imx/dc/dc-crtc.h
>>>>  create mode 100644 drivers/gpu/drm/imx/dc/dc-kms.c
>>>>  create mode 100644 drivers/gpu/drm/imx/dc/dc-kms.h
>>>>  create mode 100644 drivers/gpu/drm/imx/dc/dc-plane.c
>>>>  create mode 100644 drivers/gpu/drm/imx/dc/dc-plane.h
>>>>
>>>> diff --git a/drivers/gpu/drm/imx/dc/Kconfig b/drivers/gpu/drm/imx/dc/Kconfig
>>>> index b66b815fbdf1..dac0de009273 100644
>>>> --- a/drivers/gpu/drm/imx/dc/Kconfig
>>>> +++ b/drivers/gpu/drm/imx/dc/Kconfig
>>>> @@ -1,6 +1,8 @@
>>>>  config DRM_IMX8_DC
>>>>  	tristate "Freescale i.MX8 Display Controller Graphics"
>>>>  	depends on DRM && COMMON_CLK && OF && (ARCH_MXC || COMPILE_TEST)
>>>> +	select DRM_GEM_DMA_HELPER
>>>> +	select DRM_KMS_HELPER
>>>>  	select GENERIC_IRQ_CHIP
>>>>  	help
>>>>  	  enable Freescale i.MX8 Display Controller(DC) graphics support
>>>> diff --git a/drivers/gpu/drm/imx/dc/Makefile b/drivers/gpu/drm/imx/dc/Makefile
>>>> index 1ce3e8a8db22..b9d33c074984 100644
>>>> --- a/drivers/gpu/drm/imx/dc/Makefile
>>>> +++ b/drivers/gpu/drm/imx/dc/Makefile
>>>> @@ -1,6 +1,7 @@
>>>>  # SPDX-License-Identifier: GPL-2.0
>>>>  
>>>> -imx8-dc-drm-objs := dc-cf.o dc-de.o dc-drv.o dc-ed.o dc-fg.o dc-fl.o dc-fu.o \
>>>> -		    dc-fw.o dc-ic.o dc-lb.o dc-pe.o dc-tc.o
>>>> +imx8-dc-drm-objs := dc-cf.o dc-crtc.o dc-de.o dc-drv.o dc-ed.o dc-fg.o dc-fl.o \
>>>> +		    dc-fu.o dc-fw.o dc-ic.o dc-kms.o dc-lb.o dc-pe.o \
>>>> +		    dc-plane.o dc-tc.o
>>>>  
>>>>  obj-$(CONFIG_DRM_IMX8_DC) += imx8-dc-drm.o
>>>> diff --git a/drivers/gpu/drm/imx/dc/dc-crtc.c b/drivers/gpu/drm/imx/dc/dc-crtc.c
>>>> new file mode 100644
>>>> index 000000000000..e151e14a6677
>>>> --- /dev/null
>>>> +++ b/drivers/gpu/drm/imx/dc/dc-crtc.c
>>>> @@ -0,0 +1,578 @@
>>>> +// SPDX-License-Identifier: GPL-2.0+
>>>> +/*
>>>> + * Copyright 2024 NXP
>>>> + */
>>>> +
>>>> +#include <linux/completion.h>
>>>> +#include <linux/interrupt.h>
>>>> +#include <linux/irqreturn.h>
>>>> +#include <linux/pm_runtime.h>
>>>> +#include <linux/spinlock.h>
>>>> +
>>>> +#include <drm/drm_atomic.h>
>>>> +#include <drm/drm_atomic_helper.h>
>>>> +#include <drm/drm_atomic_state_helper.h>
>>>> +#include <drm/drm_crtc.h>
>>>> +#include <drm/drm_device.h>
>>>> +#include <drm/drm_drv.h>
>>>> +#include <drm/drm_managed.h>
>>>> +#include <drm/drm_modes.h>
>>>> +#include <drm/drm_modeset_helper_vtables.h>
>>>> +#include <drm/drm_plane.h>
>>>> +#include <drm/drm_vblank.h>
>>>> +
>>>> +#include "dc-crtc.h"
>>>> +#include "dc-de.h"
>>>> +#include "dc-drv.h"
>>>> +#include "dc-pe.h"
>>>> +#include "dc-plane.h"
>>>> +
>>>> +#define DC_CRTC_WAIT_FOR_COMPLETION_TIMEOUT(c)				\
>>>> +do {									\
>>>> +	unsigned long ret;						\
>>>> +	ret = wait_for_completion_timeout(&dc_crtc->c, HZ);		\
>>>> +	if (ret == 0)							\
>>>> +		dc_crtc_err(crtc, "%s: wait for " #c " timeout\n",	\
>>>> +							__func__);	\
>>>> +} while (0)
>>>> +
>>>> +#define DC_CRTC_CHECK_FRAMEGEN_FIFO(fg)					\
>>>> +do {									\
>>>> +	typeof(fg) _fg = (fg);						\
>>>> +	if (dc_fg_secondary_requests_to_read_empty_fifo(_fg)) {		\
>>>> +		dc_fg_secondary_clear_channel_status(_fg);		\
>>>> +		dc_crtc_err(crtc, "%s: FrameGen FIFO empty\n",		\
>>>> +							__func__);	\
>>>> +	}								\
>>>> +} while (0)
>>>> +
>>>> +#define DC_CRTC_WAIT_FOR_FRAMEGEN_SECONDARY_SYNCUP(fg)			\
>>>> +do {									\
>>>> +	if (dc_fg_wait_for_secondary_syncup(fg))			\
>>>> +		dc_crtc_err(crtc,					\
>>>> +			"%s: FrameGen secondary channel isn't syncup\n",\
>>>> +							__func__);	\
>>>> +} while (0)
>>>> +
>>>> +static u32 dc_crtc_get_vblank_counter(struct drm_crtc *crtc)
>>>> +{
>>>> +	struct dc_crtc *dc_crtc = to_dc_crtc(crtc);
>>>> +
>>>> +	return dc_fg_get_frame_index(dc_crtc->fg);
>>>> +}
>>>> +
>>>> +static int dc_crtc_enable_vblank(struct drm_crtc *crtc)
>>>> +{
>>>> +	struct dc_crtc *dc_crtc = to_dc_crtc(crtc);
>>>> +
>>>> +	enable_irq(dc_crtc->irq_dec_framecomplete);
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static void dc_crtc_disable_vblank(struct drm_crtc *crtc)
>>>> +{
>>>> +	struct dc_crtc *dc_crtc = to_dc_crtc(crtc);
>>>> +
>>>> +	disable_irq_nosync(dc_crtc->irq_dec_framecomplete);
>>>> +}
>>>> +
>>>> +static irqreturn_t
>>>> +dc_crtc_dec_framecomplete_irq_handler(int irq, void *dev_id)
>>>> +{
>>>> +	struct dc_crtc *dc_crtc = dev_id;
>>>> +	struct drm_crtc *crtc = &dc_crtc->base;
>>>> +	unsigned long flags;
>>>> +
>>>> +	drm_crtc_handle_vblank(crtc);
>>>> +
>>>> +	spin_lock_irqsave(&crtc->dev->event_lock, flags);
>>>> +	if (dc_crtc->event) {
>>>> +		drm_crtc_send_vblank_event(crtc, dc_crtc->event);
>>>> +		dc_crtc->event = NULL;
>>>> +		drm_crtc_vblank_put(crtc);
>>>> +	}
>>>> +	spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
>>>> +
>>>> +	return IRQ_HANDLED;
>>>> +}
>>>> +
>>>> +static irqreturn_t dc_crtc_common_irq_handler(int irq, void *dev_id)
>>>> +{
>>>> +	struct dc_crtc *dc_crtc = dev_id;
>>>> +	struct drm_crtc *crtc = &dc_crtc->base;
>>>> +
>>>> +	if (irq == dc_crtc->irq_dec_seqcomplete) {
>>>> +		complete(&dc_crtc->dec_seqcomplete_done);
>>>> +	} else if (irq == dc_crtc->irq_dec_shdld) {
>>>> +		complete(&dc_crtc->dec_shdld_done);
>>>> +	} else if (irq == dc_crtc->irq_ed_cont_shdld) {
>>>> +		complete(&dc_crtc->ed_cont_shdld_done);
>>>> +	} else if (irq == dc_crtc->irq_ed_safe_shdld) {
>>>> +		complete(&dc_crtc->ed_safe_shdld_done);
>>>> +	} else {
>>>> +		dc_crtc_err(crtc, "invalid CRTC irq(%u)\n", irq);
>>>> +		return IRQ_NONE;
>>>
>>> And this is a counter-example to my previous questions. If you had 4
>>> separate handlers, there would have been no need for the futile "invalid
>>> CRTC" error, because it would not be possible at all.
>>
>> Ok, will drop the else clause.  Thanks.
>>
>>>
>>>> +	}
>>>> +
>>>> +	return IRQ_HANDLED;
>>>> +}
>>>> +
>>>> +static const struct drm_crtc_funcs dc_crtc_funcs = {
>>>> +	.reset			= drm_atomic_helper_crtc_reset,
>>>> +	.destroy		= drm_crtc_cleanup,
>>>> +	.set_config		= drm_atomic_helper_set_config,
>>>> +	.page_flip		= drm_atomic_helper_page_flip,
>>>> +	.atomic_duplicate_state	= drm_atomic_helper_crtc_duplicate_state,
>>>> +	.atomic_destroy_state	= drm_atomic_helper_crtc_destroy_state,
>>>> +	.get_vblank_counter	= dc_crtc_get_vblank_counter,
>>>> +	.enable_vblank		= dc_crtc_enable_vblank,
>>>> +	.disable_vblank		= dc_crtc_disable_vblank,
>>>> +	.get_vblank_timestamp	= drm_crtc_vblank_helper_get_vblank_timestamp,
>>>> +};
>>>> +
>>>> +static void dc_crtc_queue_state_event(struct drm_crtc_state *crtc_state)
>>>> +{
>>>> +	struct drm_crtc *crtc = crtc_state->crtc;
>>>> +	struct dc_crtc *dc_crtc = to_dc_crtc(crtc);
>>>> +
>>>> +	spin_lock_irq(&crtc->dev->event_lock);
>>>> +	if (crtc_state->event) {
>>>> +		WARN_ON(drm_crtc_vblank_get(crtc));
>>>> +		WARN_ON(dc_crtc->event);
>>>> +		dc_crtc->event = crtc_state->event;
>>>> +		crtc_state->event = NULL;
>>>> +	}
>>>> +	spin_unlock_irq(&crtc->dev->event_lock);
>>>> +}
>>>> +
>>>> +static enum drm_mode_status
>>>> +dc_crtc_check_clock(struct dc_crtc *dc_crtc, int clk_khz)
>>>> +{
>>>> +	return dc_fg_check_clock(dc_crtc->fg, clk_khz);
>>>> +}
>>>> +
>>>> +static enum drm_mode_status
>>>> +dc_crtc_mode_valid(struct drm_crtc *crtc, const struct drm_display_mode *mode)
>>>> +{
>>>> +	struct dc_crtc *dc_crtc = to_dc_crtc(crtc);
>>>> +	enum drm_mode_status status;
>>>> +
>>>> +	status = dc_crtc_check_clock(dc_crtc, mode->clock);
>>>> +	if (status != MODE_OK)
>>>> +		return status;
>>>> +
>>>> +	if (mode->crtc_clock > DC_FRAMEGEN_MAX_CLOCK_KHZ)
>>>> +		return MODE_CLOCK_HIGH;
>>>> +
>>>> +	return MODE_OK;
>>>> +}
>>>> +
>>>> +static int
>>>> +dc_crtc_atomic_check(struct drm_crtc *crtc, struct drm_atomic_state *state)
>>>> +{
>>>> +	struct drm_crtc_state *new_crtc_state =
>>>> +				drm_atomic_get_new_crtc_state(state, crtc);
>>>> +	struct drm_display_mode *adj = &new_crtc_state->adjusted_mode;
>>>> +	struct dc_crtc *dc_crtc = to_dc_crtc(crtc);
>>>> +	enum drm_mode_status status;
>>>> +
>>>> +	status = dc_crtc_check_clock(dc_crtc, adj->clock);
>>>> +	if (status != MODE_OK)
>>>> +		return -EINVAL;
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static void
>>>> +dc_crtc_atomic_begin(struct drm_crtc *crtc, struct drm_atomic_state *state)
>>>> +{
>>>> +	struct drm_crtc_state *new_crtc_state =
>>>> +				drm_atomic_get_new_crtc_state(state, crtc);
>>>> +	struct dc_drm_device *dc_drm = to_dc_drm_device(crtc->dev);
>>>> +	struct dc_crtc *dc_crtc = to_dc_crtc(crtc);
>>>> +	int idx, ret;
>>>> +
>>>> +	if (!drm_atomic_crtc_needs_modeset(new_crtc_state) ||
>>>> +	    !new_crtc_state->active)
>>>> +		return;
>>>
>>> Why? Can it be called under such conditions?
>>
>> This is needed to make sure the balance of calling
>> pm_runtime_resume_and_get(dc_crtc->pe->dev)
>> from dc_crtc_atomic_begin() and calling
>> pm_runtime_put(dc_crtc->pe->dev)
>> from dc_crtc_atomic_disable().
>>
>> pm_runtime_resume_and_get(dc_crtc->pe->dev) is called
>> only when the CRTC is to be enabled with a modeset
>> commit.
>>
>>>
>>>> +
>>>> +	if (!drm_dev_enter(crtc->dev, &idx))
>>>> +		return;
>>>
>>> Can you please give an example of a driver using drm_dev_enter()/_exit()
>>> in DRM callbacks?
>>
>> vc4.
>>
>> BTW, this is required by Maxime, as noted in cover letter.
>>
>>>
>>>> +
>>>> +	/* request pixel engine power-on when CRTC starts to be active */
>>>> +	ret = pm_runtime_resume_and_get(dc_crtc->pe->dev);
>>>
>>> This function doesn't return an error. So if pm_runtime_resume_and_get()
>>
>> Kerneldoc of pm_runtime_resume_and_get() mentions error code.
>> '
>> or a negative error code otherwise
>> '
>> So, it may return an error.
>>
>>> didn't increment the counter, corresponding pm_runtime_put() might cause
>>> an underflow. Instead void functions should use pm_runtime_get_sync()
>>
>> pm_runtime_resume_and_get() is called from dc_crtc_atomic_begin(), which
>> is atomic considering the general DRM atomic KMS idea.  So, if the call
>> returns an error, the best we can do is to print the error out like
>> this driver does IMO.  The call should not fail in the first place due
>> to the "atomic" sense, though it can fail in theory.
>>
>> pm_runtime_get_sync() may also return an error. And it's Kerneldoc kinda
>> says pm_runtime_resume_and_get() is better.
>> '
>> Consider using pm_runtime_resume_and_get() instead of it, especially
>> if its return value is checked by the caller, as this is likely to result
>> in cleaner code.
>> '
>>
>>>
>>> Also can any of the code running afterwards result in the unclocked
>>> exception if resume fails?
>>
>> Yes.  But, it's all atomic anyway...
>>
>>>
>>>> +	if (ret)
>>>> +		dc_crtc_err(crtc, "failed to get DC pixel engine RPM: %d\n",
>>>> +			    ret);
>>>> +
>>>> +	atomic_inc(&dc_drm->pe_rpm_count);
>>>
>>> Why do you need a separate RPM count? RPM code already has one.
>>
>> If no objections, I will drop the count and call
>> pm_runtime_active(dc_crtc->pe->dev) from dc_crtc_disable_at_unbind().
> 
> Why do you need the disable_at_unbind() thing? Doesn't shutdown take
> care of disabling it for you?

It is used to balance PM runtime usage counter, because shutdown is
called after drm_dev_unplug() which means pm_runtime_put() function
calls in ->atomic_disable() are skipped due to drm_dev_enter().

> 
>>
>> Thanks.
>>
>>>
>>>> +
>>>> +	drm_dev_exit(idx);
>>>> +}
>>>> +
>>>
>>>
>>> [...]
>>>
>>>> +
>>>> +static int
>>>> +dc_crtc_request_irq(struct dc_crtc *dc_crtc, struct device *dev,
>>>> +		    unsigned int irq,
>>>> +		    irqreturn_t (*irq_handler)(int irq, void *dev_id))
>>>> +{
>>>> +	int ret;
>>>> +
>>>> +	ret = request_irq(irq, irq_handler, IRQF_NO_AUTOEN, dev_name(dev),
>>>> +			  dc_crtc);
>>>> +	if (ret < 0)
>>>> +		dev_err(dev, "failed to request irq(%u): %d\n", irq, ret);
>>>> +
>>>> +	return ret;
>>>> +}
>>>> +
>>>> +static int dc_crtc_request_irqs(struct drm_device *drm, struct dc_crtc *dc_crtc)
>>>> +{
>>>> +	struct {
>>>> +		struct device *dev;
>>>> +		unsigned int irq;
>>>> +		irqreturn_t (*irq_handler)(int irq, void *dev_id);
>>>> +	} irqs[] = {
>>>> +		{
>>>> +			dc_crtc->de->dev,
>>>> +			dc_crtc->irq_dec_framecomplete,
>>>> +			dc_crtc_dec_framecomplete_irq_handler,
>>>> +		}, {
>>>> +			dc_crtc->de->dev,
>>>> +			dc_crtc->irq_dec_seqcomplete,
>>>> +			dc_crtc_common_irq_handler,
>>>> +		}, {
>>>> +			dc_crtc->de->dev,
>>>> +			dc_crtc->irq_dec_shdld,
>>>> +			dc_crtc_common_irq_handler,
>>>> +		}, {
>>>> +			dc_crtc->ed_cont->dev,
>>>> +			dc_crtc->irq_ed_cont_shdld,
>>>> +			dc_crtc_common_irq_handler,
>>>> +		}, {
>>>> +			dc_crtc->ed_safe->dev,
>>>> +			dc_crtc->irq_ed_safe_shdld,
>>>> +			dc_crtc_common_irq_handler,
>>>> +		},
>>>> +	};
>>>> +	struct drm_crtc *crtc = &dc_crtc->base;
>>>> +	int i, ret;
>>>> +
>>>> +	dc_crtc->irqs = drmm_kcalloc(drm, ARRAY_SIZE(irqs),
>>>> +				     sizeof(*dc_crtc->irqs), GFP_KERNEL);
>>>
>>> Using array would remove the necessity to call drmm_kcalloc here().
>>
>> Ok, I may use a macro to define the array size instead.
>>
>> #define DC_CRTC_IRQS    5
> 
> Just embed the array into dc_crtc, no need for extra defines.

The array sizes of dc_crtc->irqs[] and the local irqs[] are the same.
Wouldn't it be straightforward to use macro DC_CRTC_IRQS to make
sure they are the same?

> 
>>
>>
>>>
>>>> +	if (!dc_crtc->irqs) {
>>>> +		dev_err(drm->dev, "failed to allocate CRTC%u irqs\n",
>>>> +			crtc->index);
>>>> +		return -ENOMEM;
>>>> +	}
>>>> +
>>>> +	for (i = 0; i < ARRAY_SIZE(irqs); i++) {
>>>> +		struct dc_crtc_irq *irq = &dc_crtc->irqs[i];
>>>> +
>>>> +		ret = dc_crtc_request_irq(dc_crtc, irqs[i].dev, irqs[i].irq,
>>>> +					  irqs[i].irq_handler);
>>>> +		if (ret)
>>>> +			return ret;
>>>> +
>>>> +		irq->dc_crtc = dc_crtc;
>>>> +		irq->irq = irqs[i].irq;
>>>> +
>>>> +		ret = drmm_add_action_or_reset(drm, dc_crtc_free_irq, irq);
>>>
>>> Can you use devm_request_irq() instead?
>>
>> No.
>>
>> The requested irqs would be freed too late as devm_of_platform_populate()
>> is called early from dc_probe().  They would be freed later than the time
>> point where irq domain is removed from dc_ic_unbind().  That would cause
>> a kernel Oops as I tried.
> 
> Ohh, you are using drmm here. Please don't use drmm for IRQ domains.

Can you please tell the reason?

Are you talking about the drmm_kzalloc() and drmm_kcalloc() function calls
in dc_ic_bind()?

> 
>>
>>>
>>>> +		if (ret)
>>>> +			return ret;
>>>> +	}
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>
>>> [...]
>>>
>>>> +
>>>> +static int dc_kms_init_encoder_per_crtc(struct dc_drm_device *dc_drm,
>>>> +					int crtc_index)
>>>> +{
>>>> +	struct dc_crtc *dc_crtc = &dc_drm->dc_crtc[crtc_index];
>>>> +	struct drm_device *drm = &dc_drm->base;
>>>> +	struct drm_crtc *crtc = &dc_crtc->base;
>>>> +	struct drm_connector *connector;
>>>> +	struct device *dev = drm->dev;
>>>> +	struct drm_encoder *encoder;
>>>> +	struct device_node *remote;
>>>> +	struct drm_bridge *bridge;
>>>> +	int ret = 0;
>>>> +
>>>> +	remote = of_graph_get_remote_node(dc_crtc->de->tc->dev->of_node, 0, -1);
>>>> +	if (!of_device_is_available(remote))
>>>> +		goto out;
>>>> +
>>>> +	bridge = of_drm_find_bridge(remote);
>>>
>>> drm_of_find_panel_or_bridge() instead.
>>
>> Nope.
>>
>> The first bridge is always pixel combiner according to SoC design.
>> It can't be a panel.
> 
> So pass NULL as a panel pointer. At least it saves you from calling
> of_graph_get_remote_node() manually.

Kerneldoc of drm_of_find_panel_or_bridge() says it's deprecated and should
not be used in new drivers.  I'll use devm_drm_of_get_bridge().

> 
>>>> +	if (!bridge) {
>>>> +		ret = -EPROBE_DEFER;
>>>> +		dev_err_probe(dev, ret, "failed to find bridge for CRTC%u\n",
>>>> +			      crtc->index);
>>>> +		goto out;
>>>> +	}
>>>> +
>>>> +	encoder = &dc_drm->encoder[crtc_index];
>>>> +	ret = drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_NONE);
>>>> +	if (ret) {
>>>> +		dev_err(dev, "failed to initialize encoder for CRTC%u: %d\n",
>>>> +			crtc->index, ret);
>>>> +		goto out;
>>>> +	}
>>>> +
>>>> +	encoder->possible_crtcs = drm_crtc_mask(crtc);
>>>> +
>>>> +	ret = drm_bridge_attach(encoder, bridge, NULL,
>>>> +				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>>>> +	if (ret) {
>>>> +		dev_err(dev,
>>>> +			"failed to attach bridge to encoder for CRTC%u: %d\n",
>>>> +			crtc->index, ret);
>>>> +		goto out;
>>>> +	}
>>>> +
>>>> +	connector = drm_bridge_connector_init(drm, encoder);
>>>> +	if (IS_ERR(connector)) {
>>>> +		ret = PTR_ERR(connector);
>>>> +		dev_err(dev, "failed to init bridge connector for CRTC%u: %d\n",
>>>> +			crtc->index, ret);
>>>> +		goto out;
>>>> +	}
>>>> +
>>>> +	ret = drm_connector_attach_encoder(connector, encoder);
>>>> +	if (ret)
>>>> +		dev_err(dev,
>>>> +			"failed to attach encoder to connector for CRTC%u: %d\n",
>>>> +			crtc->index, ret);
>>>> +
>>>> +out:
>>>> +	of_node_put(remote);
>>>> +	return ret;
>>>> +}
>>>> +
>>>> +int dc_kms_init(struct dc_drm_device *dc_drm)
>>>> +{
>>>> +	struct drm_device *drm = &dc_drm->base;
>>>> +	int ret, i;
>>>> +
>>>> +	ret = drmm_mode_config_init(drm);
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>> +	atomic_set(&dc_drm->pe_rpm_count, 0);
>>>> +
>>>> +	drm->mode_config.min_width = 60;
>>>> +	drm->mode_config.min_height = 60;
>>>> +	drm->mode_config.max_width = 8192;
>>>> +	drm->mode_config.max_height = 8192;
>>>> +	drm->mode_config.funcs = &dc_drm_mode_config_funcs;
>>>> +
>>>> +	drm->vblank_disable_immediate = true;
>>>> +	drm->max_vblank_count = DC_FRAMEGEN_MAX_FRAME_INDEX;
>>>> +
>>>> +	for (i = 0; i < DC_CRTCS; i++) {
>>>> +		ret = dc_crtc_init(dc_drm, i);
>>>> +		if (ret)
>>>> +			return ret;
>>>> +
>>>> +		ret = dc_kms_init_encoder_per_crtc(dc_drm, i);
>>>> +		if (ret)
>>>> +			return ret;
>>>> +	}
>>>> +
>>>> +	ret = drm_vblank_init(drm, DC_CRTCS);
>>>> +	if (ret) {
>>>> +		dev_err(drm->dev, "failed to init vblank support: %d\n", ret);
>>>> +		return ret;
>>>> +	}
>>>> +
>>>> +	drm_mode_config_reset(drm);
>>>> +
>>>> +	drm_kms_helper_poll_init(drm);
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +void dc_kms_uninit(struct dc_drm_device *dc_drm)
>>>> +{
>>>> +	drm_kms_helper_poll_fini(&dc_drm->base);
>>>> +}
>>>> diff --git a/drivers/gpu/drm/imx/dc/dc-kms.h b/drivers/gpu/drm/imx/dc/dc-kms.h
>>>> new file mode 100644
>>>> index 000000000000..4f66b11c106a
>>>> --- /dev/null
>>>> +++ b/drivers/gpu/drm/imx/dc/dc-kms.h
>>>> @@ -0,0 +1,15 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0+ */
>>>> +/*
>>>> + * Copyright 2024 NXP
>>>> + */
>>>> +
>>>> +#ifndef __DC_KMS_H__
>>>> +#define __DC_KMS_H__
>>>> +
>>>> +#include "dc-de.h"
>>>> +
>>>> +#define DC_CRTCS	DC_DISPLAYS
>>>> +#define DC_ENCODERS	DC_DISPLAYS
>>>> +#define DC_PRIMARYS	DC_DISPLAYS
>>>
>>> If they are all equal, why do you need separate defines?
>>
>> Hmm, just for meaningful macro names to make code easy to read.
> 
> From my POV it makes code harder to read, as the reviewer has to keep in
> mind that those values are all the same.

Will only use DC_DISPLAYS and drop the rest.

> 
>>
>>>
>>>> +
>>>> +#endif /* __DC_KMS_H__ */
>>>> diff --git a/drivers/gpu/drm/imx/dc/dc-plane.c b/drivers/gpu/drm/imx/dc/dc-plane.c
>>>> new file mode 100644
>>>> index 000000000000..a49b043ca167
>>>> --- /dev/null
>>>> +++ b/drivers/gpu/drm/imx/dc/dc-plane.c
>>>> @@ -0,0 +1,227 @@
>>>> +// SPDX-License-Identifier: GPL-2.0+
>>>> +/*
>>>> + * Copyright 2024 NXP
>>>> + */
>>>> +
>>>> +#include <drm/drm_atomic.h>
>>>> +#include <drm/drm_atomic_helper.h>
>>>> +#include <drm/drm_atomic_state_helper.h>
>>>> +#include <drm/drm_crtc.h>
>>>> +#include <drm/drm_drv.h>
>>>> +#include <drm/drm_fb_dma_helper.h>
>>>> +#include <drm/drm_fourcc.h>
>>>> +#include <drm/drm_framebuffer.h>
>>>> +#include <drm/drm_gem_atomic_helper.h>
>>>> +#include <drm/drm_plane_helper.h>
>>>> +
>>>> +#include "dc-drv.h"
>>>> +#include "dc-fu.h"
>>>> +#include "dc-plane.h"
>>>> +
>>>> +#define DC_PLANE_MAX_PITCH	0x10000
>>>> +#define DC_PLANE_MAX_PIX_CNT	8192
>>>> +
>>>> +static const uint32_t dc_plane_formats[] = {
>>>> +	DRM_FORMAT_XRGB8888,
>>>> +};
>>>> +
>>>> +static const struct drm_plane_funcs dc_plane_funcs = {
>>>> +	.update_plane		= drm_atomic_helper_update_plane,
>>>> +	.disable_plane		= drm_atomic_helper_disable_plane,
>>>> +	.destroy		= drm_plane_cleanup,
>>>> +	.reset			= drm_atomic_helper_plane_reset,
>>>> +	.atomic_duplicate_state	= drm_atomic_helper_plane_duplicate_state,
>>>> +	.atomic_destroy_state	= drm_atomic_helper_plane_destroy_state,
>>>> +};
>>>> +
>>>> +static int dc_plane_check_no_off_screen(struct drm_plane_state *state,
>>>> +					struct drm_crtc_state *crtc_state)
>>>> +{
>>>> +	if (state->dst.x1 < 0 || state->dst.y1 < 0 ||
>>>> +	    state->dst.x2 > crtc_state->adjusted_mode.hdisplay ||
>>>> +	    state->dst.y2 > crtc_state->adjusted_mode.vdisplay) {
>>>> +		dc_plane_dbg(state->plane, "no off screen\n");
>>>> +		return -EINVAL;
>>>> +	}
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static int dc_plane_check_max_source_resolution(struct drm_plane_state *state)
>>>> +{
>>>> +	int src_h = drm_rect_height(&state->src) >> 16;
>>>> +	int src_w = drm_rect_width(&state->src) >> 16;
>>>> +
>>>> +	if (src_w > DC_PLANE_MAX_PIX_CNT || src_h > DC_PLANE_MAX_PIX_CNT) {
>>>> +		dc_plane_dbg(state->plane, "invalid source resolution\n");
>>>> +		return -EINVAL;
>>>> +	}
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static int dc_plane_check_fb(struct drm_plane_state *state)
>>>> +{
>>>> +	struct drm_framebuffer *fb = state->fb;
>>>> +	dma_addr_t baseaddr = drm_fb_dma_get_gem_addr(fb, state, 0);
>>>> +
>>>> +	/* base address alignment */
>>>> +	if (baseaddr & 0x3) {
>>>> +		dc_plane_dbg(state->plane, "fb bad baddr alignment\n");
>>>> +		return -EINVAL;
>>>> +	}
>>>> +
>>>> +	/* pitches[0] range */
>>>> +	if (fb->pitches[0] > DC_PLANE_MAX_PITCH) {
>>>> +		dc_plane_dbg(state->plane, "fb pitches[0] is out of range\n");
>>>> +		return -EINVAL;
>>>> +	}
>>>> +
>>>> +	/* pitches[0] alignment */
>>>> +	if (fb->pitches[0] & 0x3) {
>>>> +		dc_plane_dbg(state->plane, "fb bad pitches[0] alignment\n");
>>>> +		return -EINVAL;
>>>> +	}
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static int
>>>> +dc_plane_atomic_check(struct drm_plane *plane, struct drm_atomic_state *state)
>>>> +{
>>>> +	struct drm_plane_state *plane_state =
>>>> +				drm_atomic_get_new_plane_state(state, plane);
>>>> +	struct drm_crtc_state *crtc_state;
>>>> +	int ret;
>>>> +
>>>> +	/* ok to disable */
>>>> +	if (!plane_state->fb)
>>>> +		return 0;
>>>> +
>>>> +	if (!plane_state->crtc) {
>>>> +		dc_plane_dbg(plane, "no CRTC in plane state\n");
>>>> +		return -EINVAL;
>>>> +	}
>>>> +
>>>> +	crtc_state =
>>>> +		drm_atomic_get_existing_crtc_state(state, plane_state->crtc);
>>>> +	if (WARN_ON(!crtc_state))
>>>> +		return -EINVAL;
>>>> +
>>>> +	ret = drm_atomic_helper_check_plane_state(plane_state, crtc_state,
>>>> +						  DRM_PLANE_NO_SCALING,
>>>> +						  DRM_PLANE_NO_SCALING,
>>>> +						  true, false);
>>>> +	if (ret) {
>>>> +		dc_plane_dbg(plane, "failed to check plane state: %d\n", ret);
>>>> +		return ret;
>>>> +	}
>>>> +
>>>> +	ret = dc_plane_check_no_off_screen(plane_state, crtc_state);
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>> +	ret = dc_plane_check_max_source_resolution(plane_state);
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>> +	return dc_plane_check_fb(plane_state);
>>>> +}
>>>> +
>>>> +static void
>>>> +dc_plane_atomic_update(struct drm_plane *plane, struct drm_atomic_state *state)
>>>> +{
>>>> +	struct drm_plane_state *new_state =
>>>> +				drm_atomic_get_new_plane_state(state, plane);
>>>> +	struct dc_plane *dplane = to_dc_plane(plane);
>>>> +	struct drm_framebuffer *fb = new_state->fb;
>>>> +	const struct dc_fu_ops *fu_ops;
>>>> +	struct dc_lb *lb = dplane->lb;
>>>> +	struct dc_fu *fu = dplane->fu;
>>>> +	dma_addr_t baseaddr;
>>>> +	int src_w, src_h;
>>>> +	int idx;
>>>> +
>>>> +	if (!drm_dev_enter(plane->dev, &idx))
>>>> +		return;
>>>> +
>>>> +	src_w = drm_rect_width(&new_state->src) >> 16;
>>>> +	src_h = drm_rect_height(&new_state->src) >> 16;
>>>> +
>>>> +	baseaddr = drm_fb_dma_get_gem_addr(fb, new_state, 0);
>>>> +
>>>> +	fu_ops = dc_fu_get_ops(dplane->fu);
>>>> +
>>>> +	fu_ops->set_layerblend(fu, lb);
>>>> +	fu_ops->set_burstlength(fu, baseaddr);
>>>> +	fu_ops->set_src_stride(fu, fb->pitches[0]);
>>>> +	fu_ops->set_src_buf_dimensions(fu, src_w, src_h);
>>>> +	fu_ops->set_fmt(fu, fb->format);
>>>> +	fu_ops->set_framedimensions(fu, src_w, src_h);
>>>> +	fu_ops->set_baseaddress(fu, baseaddr);
>>>> +	fu_ops->enable_src_buf(fu);
>>>
>>> Are you expecting that these ops might change? Can you call the function
>>> directly?
>>
>> Looking at struct dc_fl and struct dc_fw, you may find struct dc_fu
>> is the base class.  These function calls take struct dc_fu as
>> arguments so that derived instances may specify their implementations.
>>
>> So, I can't call their implementation functions directly.
> 
> Ack.

Thanks.

> 
>>
>>>
>>>> +
>>>> +	dc_plane_dbg(plane, "uses %s\n", fu_ops->get_name(fu));
>>>> +
>>>> +	dc_lb_pec_dynamic_prim_sel(lb, dc_cf_get_link_id(dplane->cf));
>>>> +	dc_lb_pec_dynamic_sec_sel(lb, fu_ops->get_link_id(fu));
>>>> +	dc_lb_mode(lb, LB_BLEND);
>>>> +	dc_lb_blendcontrol(lb);
>>>> +	dc_lb_position(lb, new_state->dst.x1, new_state->dst.y1);
>>>> +	dc_lb_pec_clken(lb, CLKEN_AUTOMATIC);
>>>> +
>>>> +	dc_plane_dbg(plane, "uses LayerBlend%u\n", dc_lb_get_id(lb));
>>>> +
>>>> +	/* set ExtDst's source to LayerBlend */
>>>> +	dc_ed_pec_src_sel(dplane->ed, dc_lb_get_link_id(lb));
>>>> +
>>>> +	drm_dev_exit(idx);
>>>> +}
>>>> +
>>>> +static void dc_plane_atomic_disable(struct drm_plane *plane,
>>>> +				    struct drm_atomic_state *state)
>>>> +{
>>>> +	struct dc_plane *dplane = to_dc_plane(plane);
>>>> +	const struct dc_fu_ops *fu_ops;
>>>> +	int idx;
>>>> +
>>>> +	if (!drm_dev_enter(plane->dev, &idx))
>>>> +		return;
>>>> +
>>>> +	/* disable fetchunit in shadow */
>>>> +	fu_ops = dc_fu_get_ops(dplane->fu);
>>>> +	fu_ops->disable_src_buf(dplane->fu);
>>>> +
>>>> +	/* set ExtDst's source to ConstFrame */
>>>> +	dc_ed_pec_src_sel(dplane->ed, dc_cf_get_link_id(dplane->cf));
>>>> +
>>>> +	drm_dev_exit(idx);
>>>> +}
>>>> +
>>>> +static const struct drm_plane_helper_funcs dc_plane_helper_funcs = {
>>>> +	.atomic_check = dc_plane_atomic_check,
>>>> +	.atomic_update = dc_plane_atomic_update,
>>>> +	.atomic_disable = dc_plane_atomic_disable,
>>>> +};
>>>> +
>>>> +int dc_plane_init(struct dc_drm_device *dc_drm, struct dc_plane *dc_plane)
>>>> +{
>>>> +	struct drm_plane *plane = &dc_plane->base;
>>>> +	int ret;
>>>> +
>>>> +	ret = drm_universal_plane_init(&dc_drm->base, plane, 0, &dc_plane_funcs,
>>>> +				       dc_plane_formats,
>>>> +				       ARRAY_SIZE(dc_plane_formats),
>>>> +				       NULL, DRM_PLANE_TYPE_PRIMARY, NULL);
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>> +	drm_plane_helper_add(plane, &dc_plane_helper_funcs);
>>>> +
>>>> +	dc_plane->fu = dc_drm->pe->fu_disp[plane->index];
>>>> +	dc_plane->cf = dc_drm->pe->cf_cont[plane->index];
>>>> +	dc_plane->lb = dc_drm->pe->lb[plane->index];
>>>> +	dc_plane->ed = dc_drm->pe->ed_cont[plane->index];
>>>> +
>>>> +	return 0;
>>>> +}
>>>> diff --git a/drivers/gpu/drm/imx/dc/dc-plane.h b/drivers/gpu/drm/imx/dc/dc-plane.h
>>>> new file mode 100644
>>>> index 000000000000..e72c3a7cb66f
>>>> --- /dev/null
>>>> +++ b/drivers/gpu/drm/imx/dc/dc-plane.h
>>>> @@ -0,0 +1,37 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0+ */
>>>> +/*
>>>> + * Copyright 2024 NXP
>>>> + */
>>>> +
>>>> +#ifndef __DC_PLANE_H__
>>>> +#define __DC_PLANE_H__
>>>> +
>>>> +#include <linux/container_of.h>
>>>> +
>>>> +#include <drm/drm_plane.h>
>>>> +#include <drm/drm_print.h>
>>>> +
>>>> +#include "dc-fu.h"
>>>> +#include "dc-pe.h"
>>>> +
>>>> +#define dc_plane_dbg(plane, fmt, ...)					\
>>>> +do {									\
>>>> +	typeof(plane) _plane = (plane);					\
>>>> +	drm_dbg_kms(_plane->dev, "[PLANE:%d:%s] " fmt,			\
>>>> +		    _plane->base.id, _plane->name, ##__VA_ARGS__);	\
>>>> +} while (0)
>>>> +
>>>> +struct dc_plane {
>>>> +	struct drm_plane base;
>>>> +	struct dc_fu *fu;
>>>> +	struct dc_cf *cf;
>>>> +	struct dc_lb *lb;
>>>> +	struct dc_ed *ed;
>>>> +};
>>>> +
>>>> +static inline struct dc_plane *to_dc_plane(struct drm_plane *plane)
>>>> +{
>>>> +	return container_of(plane, struct dc_plane, base);
>>>> +}
>>>> +
>>>> +#endif /* __DC_PLANE_H__ */
>>>> -- 
>>>> 2.34.1
>>>>
>>>
>>
>> -- 
>> Regards,
>> Liu Ying
>>
> 

-- 
Regards,
Liu Ying

