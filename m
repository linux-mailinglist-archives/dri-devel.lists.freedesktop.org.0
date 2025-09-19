Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0E9B87C62
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 05:05:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA0A710E925;
	Fri, 19 Sep 2025 03:05:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="bY3YJ5du";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013064.outbound.protection.outlook.com
 [40.107.162.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DE4B10E925
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 03:05:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oGM/wluU21McHgJCzKIiSmudC4bjm0jYyXYF7bmaIQRs9tUYplP4dce9xNxqq25C2sravtEY260UPOKWJ4da/sXwcp5XIFc1qiSx6KjZkPkIBJPkm0T1HXBzfa3WAEVn95r3wjZ0h6Cf02gsVR/Ex26MmLQDadV3SCCtwbuk9l4hKLqN8w602UDOEiIwHyvBsq7UNCe8UEgdM9z8QdDCZVRagecKDLT18RNkDP2GKii2Z/RIbBSPQNel6DCyvzSU66z689zAuiyXWltJfkclBF6ATQgzWW8yfdENgXbpWa+6tS5br/CMaevE6ffzKuiQsvZCQVbxx1lgHoK4CfqxMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=auSN4DbDmJ7DuMzkGuwVQHMty1BHob51Uz2lGLbxNY8=;
 b=bU/FyLX2FttXH++VtigsYLXjV1Ko8Fme0CnI6Hf6YFdHX6J1r3KNwHXJbQJsZue3lIs2AsLrX51jb9jWsh1gjgU1Pw5X5Z2XdhBZ7PUW/w0TgVSlPJcv+nMrVWSIb/O1PJ0UaCPR4c/4HimIJqroi73zVBEEZOgPv4tzq9xrQPk0FXNxIQAqgQmwzph8p9jMTdMWvo4CZw73CqXAjut7ZbSms6V89zmh0BZN2/TN+TF/Iu8NCdmO7gi1R0iLgckU5jZfXxtt8C4Pe4CRLCYqaJQ3qwLuRzTYzdqAZNp7YY4PrIGOSWf/en6OoTRnR365KfB+L6BXJbxj3wHvIZzb7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=auSN4DbDmJ7DuMzkGuwVQHMty1BHob51Uz2lGLbxNY8=;
 b=bY3YJ5duLhpJm6a2cZFnx4JmNfOVISqyGOFIVTGDzclg2J9oBa8GycRuQpXuZEJUenF360DCKlREZEmyz8MT7qVucNgfjjhG7C4g4sTIDBorPfrBH3AXRJ+q+iEt5a1mpJb9FMyXUZ0cnlXPLAWMGMbXEAKzL7zyKnnNWWKvoFTtmkR1PdmSK13sBGQgvzMQVNIMOgmq/dUxIla8YfohgrFIj6j0qd5h1IVosOOi8HAupwX3QUrvz4T+lTBJZIRyI38xQmkkFGjUzL6Y76tFL9bHNSXrxzWxk3QexlkksQnjO0ouyjnzThZFfazaGSCx1eduhYAwskoRPKg/kp6D4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DU2PR04MB8615.eurprd04.prod.outlook.com (2603:10a6:10:2da::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Fri, 19 Sep
 2025 03:05:24 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9137.012; Fri, 19 Sep 2025
 03:05:24 +0000
Message-ID: <cb1b78f5-7b27-4905-be73-c41fa6d1a9d3@nxp.com>
Date: Fri, 19 Sep 2025 11:06:56 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/bridge: waveshare-dsi: Fix bailout for
 devm_drm_bridge_alloc()
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 qijian.guo@nxp.com
References: <20250806084121.510207-1-victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20250806084121.510207-1-victor.liu@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2P153CA0002.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::16) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DU2PR04MB8615:EE_
X-MS-Office365-Filtering-Correlation-Id: c6433546-2234-4e4f-4c1f-08ddf729606c
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|19092799006|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VmxpSHNEQ0NIdmtCdHdxUE1BamJYQkF3OGIyczB6WTE4SWI0MzlLdWhCMFQy?=
 =?utf-8?B?N1B4MWNMRk5TZ1FZdU9pUU8vME1hbmZob1ROeG5rWk8rcy84SHdDRmxnQ2Vp?=
 =?utf-8?B?ZXpVQ2hBQ0xRZlZPanBnNXZJdjVBTEhVLytLeHQrSE15VTc4cnlsbTczVjVp?=
 =?utf-8?B?eHNjZEg5SXhXdXpXQVNWNlR1ZUprRE01V2lTS3VRN3BRU1lkZmZ6bEoySUZl?=
 =?utf-8?B?NUVFUVA3aVRkSFBDSk9Wbnd4RVd3V3hSaHN5bmdMRmEzQTB3bzczeVY1U2py?=
 =?utf-8?B?alZ0Tm9rT2gzNytNN2lMSWFRbm8xdExMUkpuSVEwQ2E1Q2dxdHlOU0l6bkZ5?=
 =?utf-8?B?dkxIRXFtQ3preTVTTkhkZFZRN0lPeDN4ZHU5T2sxckZJNFpSVldoa1o5L0Rj?=
 =?utf-8?B?Vlg5WTdFMytqc0NsSG9WQ3FnUzJlLzcrdjBYV1lPeTREVG9JSEtHaGMzZkNE?=
 =?utf-8?B?TVQrTlBBUVFNR1dMeWExR0I5Z1JuUmRpVU5KSUJ3MmNCdzFlK2U3Q0F4b1Fn?=
 =?utf-8?B?TUJZcC9MdklwQjQ3UTJ0bWRQRU85ZTBNekpNbDI3eVBUVmtNd0RhTUU3UU4v?=
 =?utf-8?B?Tm5ISmU5RDFvbjBsL1hRcithc1FxcytrbEZtRm1TYUpvY2ZFc1gza3Z1ZTJj?=
 =?utf-8?B?b1hnN1Rib3JxZThEcGdmMVpJN25EVUROeGt2elpZK3VnYjI5dE1aOW42bGth?=
 =?utf-8?B?NDUzYUhNckFoWFA0bGF2QUppS000VEUwUUlkNnZDaExuQnpsNlBaT0Z0VW94?=
 =?utf-8?B?SjFNRlg1ZXRaNmREb2tzb0lnc2RseXI3WXluTTZFalZqQUorUXZ3SVVjSGRK?=
 =?utf-8?B?ZDBhVlZkYSt2UFFwblp6cHFQRDdVc0ZWb00wL3ZBOXM4Z0tRM0JCb0lQNXM4?=
 =?utf-8?B?ODVwMGZQV29ML3RtaHpOalVMY3RKOExuMHFQM3BHNlU5TktmdndqTEtGS3o4?=
 =?utf-8?B?MHI0VXFTNnY4WVFrNUwxajlsbWhCQ2ZBT2d1TDYxeHR1VXZCaHBVd0t4QTdJ?=
 =?utf-8?B?TWwzbEdmeHJXM21vNlpxKzdsLzlRUTZSNDgyeTlndzVZTysySkMxRE0rRTlO?=
 =?utf-8?B?OG9IR2dUbGtYZFZveng0czFnbUF2RFpINnFPd1YzVDhBdGZWWndKUlpzVXp6?=
 =?utf-8?B?L0d3UC9NYlRzTXU3UHoraHdZOUNwRWhFMjcwKzlFTGpNTVJSdWVoWjdOTUl3?=
 =?utf-8?B?cXpaL3ZnMnVpZnhSaFk4K09uQ09CdklUTUpWOXkyMnFFaFd6dW8vbGE3UUlK?=
 =?utf-8?B?aEY4VU94bkFaQVdBTGFJY1dXTFRvdVRsaythbWNkTG14bHd1aEdwTUd3WGRz?=
 =?utf-8?B?eHRPQW9abVJMWTVybm1wUm4zM2tKUlV6cjNIa2ZzMVB3bTRNUVRQN2NPMjNq?=
 =?utf-8?B?bDFiUU13RVdGV2hCb21CK0E2T25CbnVONXg4VXFocW9NZFVaaE51c3hwZWZZ?=
 =?utf-8?B?QXB6K0k5N2o1ZDRqZ28xNDhueWdvVzZhN0lNTWkyWFFlM0lJOVJMaEtIRE5i?=
 =?utf-8?B?bVhnWEFoSlRpWlltSDZBL3BNYUlsUEdqemY0cGVqdVoyTk1nbFpoWnR6VUFH?=
 =?utf-8?B?OGhrcDJpcjBDNlAvbnFXY2J0Q05MOVUyREJqZ0luOFhxRkdvK1hOZ2hDODg3?=
 =?utf-8?B?SGNXbXNubjNldmZCbUxIYUU4cjBlU01vZ0d5QlFISFBCVldZK3FBV1ZSekh6?=
 =?utf-8?B?Ykh4RUdiZThDMFVzVXZVSjBXWEpXeVd5N0wrNDB3blkxQkdXb0MwNldFSE1s?=
 =?utf-8?B?REc4N21kWWZCSGtVdjNBY2Q5VDRRTFVUMkIrcjNjSndudW0vNkZuNGNLSGFn?=
 =?utf-8?B?WC9haERUN2pWcWRBS1h3b2FXSzh1a01UNDVUNjA5NG9KNmRtN3ZSWXlhVFVF?=
 =?utf-8?B?MzhxOW1yU2RoNnZmbTRDNFlOQzlSdEh2cUNPcnFqQmphRGpGL3cxUVVJb1pP?=
 =?utf-8?Q?IRDPDMnBMGc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(19092799006)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z1YweG13cEdVbHFoVzhDcUloZVlQRW1RaStYNFJsY0ZHTlpVTnc4eTRwZ2pW?=
 =?utf-8?B?bUQ5bFBFcWNJSUlHRkk0N1FNSDREdW5jdXV3Q1dLeXVwQWN2eDlpcTBidlFq?=
 =?utf-8?B?ZWJDRjRPU3lnZVk5TFh6QjJacndEN1ovMGZqclVyZ2VqQ1pIdlY1cll5Vk02?=
 =?utf-8?B?Tjd0T1RVWkpnL3FBbUhnVHhocUNBbnU0UG5vK1dwZ00xT1dWQVNpWkU1QlIw?=
 =?utf-8?B?SU56UzRETXNucW91WElTWHl1RXk2cmlvZ3grWmpXUXova3JXVmZuL1NrVkhr?=
 =?utf-8?B?ZldvQ3BmZFEyZXRoWFIxUTc3Z3FhTTBBc245K1lqZEpPZTJodng4WEdWZXBl?=
 =?utf-8?B?eXp6eGFiVStlTVByVzZMODBTbUNWaStEOWE2U2dtNG5TVXZFNFdPUjJ2b2g0?=
 =?utf-8?B?bWpCRkdYamp4TzVnS1RoajNObVNoaUNWTkpaT2RmKzJONGdkcm1kYXh5Vnkx?=
 =?utf-8?B?MW9DUytzWmE1QkZZSUpaTDBVVlhLWlBGb0t2dnlnRE5Samp5WFBCV2JwUWYr?=
 =?utf-8?B?YmJqUEhxbG5QNlZtV2t5RjBpcjROOXB5SHc1d0M4V09nYWhyQjFndzRGOHN1?=
 =?utf-8?B?UmxyWEhPc1dORHNZKzlkT09JTmpkVzg0MkNjdHVZNFkyR1htd3ZjZEsrRnhh?=
 =?utf-8?B?dU9DNXRYWkFKWVZ4N1ZSVE45YVZHcmhjd09jUVNPKzJoeEJXMlNPTXJISXU0?=
 =?utf-8?B?RG9Ka241UmtuUnVPODJzREllb1Zvc2lIWWZZRXpwd0tmQlJoNHZNTmVVM1V3?=
 =?utf-8?B?QS96bjE2Qld0VnFjaEJRWlZMekRQVU5Gb0p2L0k2VHMzN2lxZnZ6WDhVb2s4?=
 =?utf-8?B?dmhvMTFEUjArNzY0YXVpd1ZhZUZQSHlsKytXanlwaThBVWs0VEVOTkVTY3hw?=
 =?utf-8?B?VG45TG1IZVBrbDVYcFNaMEpYTGhPRlNnUENQNUVEWHlpeE1lVmVPNi85R0sz?=
 =?utf-8?B?VDVJYUh0bEZaZTNZOWUzSGoxRHNVb045bUV4WFFjOVQwVjRxb2gyck5YaDd0?=
 =?utf-8?B?d2V0cFhXUTA1YzdLekxCN1VjSEtJSEpvLyt2b2F5UzdoUmNLVHlLbmJNTnIx?=
 =?utf-8?B?bEw3K3FYL0FRSmpIaCtGN3JyaGlHMzU5TnJXSkNJWUJqcGMzUmtmV0pkaWNY?=
 =?utf-8?B?RzNhMEIwdm5uQmt3MDJ1TnVsaTJ3S1h0bXl2OXNRUHA0cm93SjVUVGphQnJs?=
 =?utf-8?B?Z2Y5NmJ2TGpmZXdUd2J3dXRFNU5qUWlZQXM3ZWRaUThTVGxyL1owRHpBeHFZ?=
 =?utf-8?B?Nzk1M3lESDZBekZuUEIxeDdxQ2drWjlxejFUdCthci9neHo2cEg3VUhHZHJ6?=
 =?utf-8?B?Q1RmL3IvMFczV1J4bldUUUMxRmRXQkZlT3lEalh3YkhWTW9wcHo2OWtCaUJs?=
 =?utf-8?B?K0JnbVZoOFBlODBsZ3VMbWRCRk5mWGFKNnBCRU1sZS9rQ2c3QzVyeG5ERTlH?=
 =?utf-8?B?dVJVR2ZPcjZQUHFrcGhQc0pkNUNKRGk3SkI2YjYzU1JPeWRqajBBd2g1TGp3?=
 =?utf-8?B?UXN6QUxNZVRtNU1RYWVqVDBSSmo5enlVVHdaQzFqL3ZCY21WeFZjSlh4VnRs?=
 =?utf-8?B?bUgwNkYvUFUrM1FtVno5NktXdDlvbkV0ZTBNaDBqTU5rRjVjbGYrQnZ1ZC9P?=
 =?utf-8?B?eVozMG04Q21YU3NEdkkwMVp5OStMMGRjYWE2ZjQyTTNOVWxEbHJ0Y2ZFY3FZ?=
 =?utf-8?B?WElBSSs1WXhxUHYwTmhqVVlFbjYwci9ld2ZVREtKbjJZUXpvRmpMT0ZLMGh6?=
 =?utf-8?B?bncvdEJzT3hTRVVpRzI4S0lrUHIxeTBVMXE1bHJvc09ZV1hJcUNOZFlOekhP?=
 =?utf-8?B?TFZKN3lZeDNpcmRHWENIYVFWSUhMVXl1dEE3RGNzd3M0eUlQSnk2UlZNUW9E?=
 =?utf-8?B?Q284WU1aSUFqL2FuQmpjZTcxenlscXdVRkNmVFZxMHVzanROSkV4ekJtWmRH?=
 =?utf-8?B?VFBuVkh0RnpudERybXJMdXcwS1NYZ1BwMkwrSVcrYVlrdUx6ZFdNSkhHaHhC?=
 =?utf-8?B?eEx6eldoUjJxK0I3azRlVjljaDVFanl4b1p0OXJJOXRkRWxZcXZhNVRheDA5?=
 =?utf-8?B?WVUwZkFXdjhNOUpSVWE1VnZpYmtyVEFMb0tHNFp5L05oV3MzcExNTytUNzRs?=
 =?utf-8?Q?wYG2lPCGWKgJl+cVsaefgUGgc?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6433546-2234-4e4f-4c1f-08ddf729606c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 03:05:24.2788 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bNm2amLnZaRtbbx0CWIL47AE8Joan+zMgrUDGk5FX9wJctOIxSGoe/eKNKUqoeUAfixXRQz04RRuDWGkJZniDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8615
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

On 8/6/25 16:41, Liu Ying wrote:
> devm_drm_bridge_alloc() returns ERR_PTR on failure instead of a
> NULL pointer, so use IS_ERR() to check the returned pointer and
> turn proper error code on failure by using PTR_ERR().
> 
> Fixes: dbdea37add13 ("drm: bridge: Add waveshare DSI2DPI unit driver")
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
>  drivers/gpu/drm/bridge/waveshare-dsi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to misc/kernel.git (drm-misc-next-fixes).

-- 
Regards,
Liu Ying
