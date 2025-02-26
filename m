Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA033A46CC3
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 21:53:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E77710E241;
	Wed, 26 Feb 2025 20:53:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="4lh3PpB7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2088.outbound.protection.outlook.com [40.107.236.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6D2410E241;
 Wed, 26 Feb 2025 20:53:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c5tx9fnGjkLcd/uiLnbIPoTuKwuObPUZP1G5zXlyB3z+LSXEi7UwPJ1rSbfOE66sKamzLfJNI5pkOD0E7bhbS3w9bYbJTFNqvtcNUOc0VNurItk4pBN5t77qKWgIHEeU/1mg95WWToNN0OuVHO1Bwg1ivBejTbXQ4ohHlwr3lfJ2ftiKIte71XtEcIK6TL4qTDmZVX2kaXjKIhOg3pRCLT7pLD5NZykgy4yutv7NfwOhnC8YEBZvL6W7PuktwLObhQnEZEWskZCQbfA4hWmDBVLO2s9qoKRUjK0GQ3lqZ5/awgTwcMH0ViMA1Aj2wgp2iFAjkBIlQ5IJZhLS/ke+Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JBMpTm1rC4GOWHCxCg8IYC7jc66BaTMyppaKAqqoz6w=;
 b=EoED9kU9ZjOM0+0lTrX+0rBffWQCp2RzqZc2m6hF8n46dsFKVou+KW1dMjaeZp+ZyreWkNqjqelY/xxKlOOYgIyap0sdQqTDMdsMOG1XaxNReHlmqNTHE6O4dY7mJS1HY49knvszMkrW4ki1cQQgBKLiuQwREMmMq+y4tCxd421gkI+LgNoTRZkzNJml1iVm3P3oGIZQPk5sPvP+v0Vjf+5t5/cU70wK9AqPNvRw8n7WrEXmvQK3juBj5XGvugAptvCtHS38vJdfyWNZTSrskMfYhZ/BW03zpOVty28koHxaxVcXllIb/BgvL4NW1gRkkZHGo93Y33ziaLksluxH3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JBMpTm1rC4GOWHCxCg8IYC7jc66BaTMyppaKAqqoz6w=;
 b=4lh3PpB7CF95hY4XWksMueCluViwk5+ewjUYBffi+L6GSN+KXDoIr8Aw+xXSSd7WRjAK3QZkV+9y3wh7xwQufSjSZ4buUATi6UJUA6symgthMy1GeASglJYCO7sjkDZfyVjeg5T0TaSpwLkh6EONxmRFY8ylOFNXn4pg5CnhBIw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by MW4PR12MB6875.namprd12.prod.outlook.com (2603:10b6:303:209::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.15; Wed, 26 Feb
 2025 20:53:11 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%4]) with mapi id 15.20.8489.019; Wed, 26 Feb 2025
 20:53:11 +0000
Message-ID: <a9b791c7-2aa3-4cfe-a3b7-1ebbf7ab1d7b@amd.com>
Date: Wed, 26 Feb 2025 13:53:06 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/amd/display: fix type mismatch in
 CalculateDynamicMetadataParameters()
To: Vitaliy Shevtsov <v.shevtsov@mt-integration.ru>,
 Chaitanya Dhere <chaitanya.dhere@amd.com>
Cc: Jun Lei <jun.lei@amd.com>, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Fangzhi Zuo <jerry.zuo@amd.com>,
 Aric Cyr <aric.cyr@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 lvc-project@linuxtesting.org
References: <20250226202853.13319-1-v.shevtsov@mt-integration.ru>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20250226202853.13319-1-v.shevtsov@mt-integration.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0074.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:4::7) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|MW4PR12MB6875:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b792c16-710e-4d62-9129-08dd56a79484
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OWUyK0gwUWF1bUlZMFBjeTFVelJlY25zSURSZ2tCWUR1NUlYQlB4aEViTm5I?=
 =?utf-8?B?UVlOVlJTNGZJMnR1SHlydmcyaVZOY0hZb2RiVG93ejZkaUkzblYvYTlXSUpD?=
 =?utf-8?B?S29PVXRzamJ5cHFSWVdlMnh4MVFOQlFrcGYzcURORURJNmlTeTdyc2VoNlZi?=
 =?utf-8?B?a0xOT29TUGQyV0ZJSWxYYm1BSk4waUNZeklQVlBvR2cvUklsOG1TR0dFYVMv?=
 =?utf-8?B?bCtLdE5GYUZ3dHREdmsrdzRUakdVRFdJeFVhRDVPZllhaGpiUU5DMEpzYjJF?=
 =?utf-8?B?ZkdoY3V2aGlZZkdJOWh5UGxlMjdXMXhSSGxPSzJZaG96TkcwRGZOeVJKUG42?=
 =?utf-8?B?cngyQlpDNlhYaHgwNDU1MUQrZmVGdHpZMldNZ0U5RURaWSt5ZFN1eHAyTUdo?=
 =?utf-8?B?ZDlmUlcybEZ2LzN1TE1iclBKVDdFcHdUUEduQzRPRWdJc3hBM1BJMFpjZ3JI?=
 =?utf-8?B?a3pKUkhyclFpR0lidEVDc24zaERMM3M2MUM1YjZOWFM1VEU4MUppNFZ1SVVH?=
 =?utf-8?B?OTR1V2JpTnZiUEllRFpQNklITlI0dVE1TFhOVW5PV3J0bnUwZEZZZk92TW13?=
 =?utf-8?B?N0I3clp6NStWR3BHa3Uybm5SRGJKNWFDb2wrMTRZVnA5cEhrWUVhVjF6aEIy?=
 =?utf-8?B?cHZlcXRwRStqZGIrazhFSVJGcDRYR3BTNWlzNlNxY3JWZEZucWhQUTVaOUJm?=
 =?utf-8?B?dmpveHIyNXhqR0RLLzdvZTN5b1dmajVEenVNaHhORXhwTkFqY1ZQWitSeHV6?=
 =?utf-8?B?YjRzK3lOdnUrcTE4OTYzajhVS3A1WUFoUmR6NTZFaXFTNVhhR0dOajhwT3h1?=
 =?utf-8?B?OTgzZ002MjdVOWo2dGRsZUFOR1ZPS2FnajdTQjJBTGpiWE5lWGpBaEhsWXBy?=
 =?utf-8?B?c0dxWFV6d3J3NEcxOFRiRFZTM1FzMldvTTREcXVIeVZsdk1aS2JFSVRnZmpR?=
 =?utf-8?B?V3ZkNXRkS3BsWDE5UGk3SjdtcWUvVWpvWDZCZGlCYjZ5Tkt2OTNvRFRzZzB3?=
 =?utf-8?B?MkY1WUZnWTdSWEdWZEZ3YmhxbVQvOW96NkkrL0oweFU2Q0dJOHVzN2QxcHov?=
 =?utf-8?B?UlRrMmdUOFpIbFVQYjhxVWs4b3M4YTZhU0ZWMlB3N1NMWTQzRCtCKzkzS0hG?=
 =?utf-8?B?WllRN1BVVFFpRG9jR2RqVlhaNWowNCtLOFZxOXF2T0c5TXprZVRxNkxRMGZa?=
 =?utf-8?B?TG5pZklJb0pmSnQzdU1CMnZTdm1XdFpTRksvSE02RUZBVGtxeEJjWmNuOS9v?=
 =?utf-8?B?eTNJbk9zWUlSV3dISDBGVmYzYlJVcmh2MXFLUWh4alhjbWFNUEJKUkUzNkZG?=
 =?utf-8?B?M2dUOS9HTzQ5OThvT0xOQS9ydVdGa2pBVnBxcW9GSkhYZG1xMkszMFZTMklW?=
 =?utf-8?B?U3lFK29IUWJNZGdCb1VmSmJOK1lORUNvaUhSc3pGNXo4WTJkSFhBdkh5NzRG?=
 =?utf-8?B?WEV1MDIrbXhDaVhmUFZkOFRWdUVyNndZWENkSEpGdDlYeXlMa0RqTlU1ek1z?=
 =?utf-8?B?NGlmUTBJVmlsMG0yNU40a0p1MHRRdVFXczZ2MXB3OElXZUJVNWpHWENCa2dl?=
 =?utf-8?B?aHVwY3kvdTduTEk1YndlOEliZjAzOUloTDFVckpEL0orcURCcWovL25hOU5O?=
 =?utf-8?B?TTM1V0YvNWZuUlZEU3pENk0zUDlEcGp6bm1COHArdzd2T3FoZDIxREdqaE9R?=
 =?utf-8?B?dW9lVWFvejRpZXg1M2M5UlNTZ2tGQkFtWGVyOUhCRVlUQUlOL05HRTR1Q1Qr?=
 =?utf-8?B?S0RVbUd1bHJ1UXFBRjNkSU5vRUtTUk10elkvaVA5YTQwMTdYN01IUEp4NXpi?=
 =?utf-8?B?WmRyeVRCMjhXR3dBNGJMMVhQKzlqN2NyTWQ5UG9FbllnM0pSY3RWLzlxR3Jx?=
 =?utf-8?Q?YfS9o/avTh1MQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OUx5MDdCbkE4SWozRUVWYXEyZTFUK1J6ZU94c0pJblFVamlhMFZCZUZUdXpx?=
 =?utf-8?B?Lyt5akt4bWdDbkhyWjlpRVovYW9tdCtZZ0dJREZqeWFSRzZhSXBCbUV4Wmxt?=
 =?utf-8?B?Rk5qeEhxaktSUEpiaUFuSm43UEdySjFSbmp0TGJQdCtKTmRVaXdxalN1b29H?=
 =?utf-8?B?Lzl4dVVQbkhHTUEydkdjTFlGclRHYjhNdC9wUUovWmkxbHN3dmFPWTVhU084?=
 =?utf-8?B?cEFKRFNya2xoNWZFRVNJTHhlZEFlbng4K0xOelA5NGpna2VvcDVWT0RIdE5h?=
 =?utf-8?B?cVBxYVJjY0xac0FVTCtHQWFHbGQ2RVFwZTFoQ2hmUlVxTStEU3E5MHltOWh1?=
 =?utf-8?B?S3hVdlpyWThNRjlUakNlbFVLbHRxeDh4WnRBL0k5SzlLcDF6MjI5ZTBZdmM4?=
 =?utf-8?B?cnQyZkhmZ2p4TGN4NHpYdTNtS1Z1L2xIcUN0ZngzZnJvMjJmYWl0bEg5ZFJa?=
 =?utf-8?B?OVN5OCttMDFUTVM2UVFPa014NkZxSGhkSTRTV01GaUIyWXRaM3R3QTN6bG9M?=
 =?utf-8?B?MW9KVUpBaVpEdHFvYXhnMXFISFppNFpTTHEvNkJWczlsVGlDSWEycjB5Zkt4?=
 =?utf-8?B?emZLaW9kbjkvZG41LzBFMVJIYTduY2VHTFdXbnZ5S1puMVc5RzVTb0ltUWYx?=
 =?utf-8?B?cms0eTI0TFY4VnhkeVNnMS9VY0MvQ2sydUdrOEZYcG5jUmh5SGZQUUJZSWpH?=
 =?utf-8?B?Vmt1Y2NYUkJLbmIvUEdkVXJ2UTlPMUJoaWRxZmpsQnNpSHlUSkNvNkx0YkVF?=
 =?utf-8?B?ZzhGOUFrTFBZNXlIZ3p3eUg3dzdEZkh1M3d2Mmp4OUdPS1VzSDN4YWx5MXRm?=
 =?utf-8?B?UXc5aWx4dHB0VjN6ZHhLZFBjT0JyQjhBRTFNM2tFUWtRRVhoOGVRSWQ1NkIz?=
 =?utf-8?B?blBoZjAzNWxIMWJpUTdCU1haLzRWRVo5eHprcnFzT2hPYWV6ZXZNVk8zcjBU?=
 =?utf-8?B?VkxDSk96SThlT3Z6M2tYSXFMczRRYjEva0hGV1hsclZpelZSUVBvY1lJZ0xq?=
 =?utf-8?B?UzgzT25SeU1NVXZ6MHNHT01rRFYwUFNHRTQ1ajU0Q3V5bFUrWDhrZFZQNm1t?=
 =?utf-8?B?b1ozWHhCR1E2OTA2QzZaSkNEY1NsU2N3QTIyd1p5djI5TVRiNUNxenE0VGxq?=
 =?utf-8?B?MXlDMUpROVZZS2x4MEpUMlNwUXFQV203NTc5YVE4enc3ZFBuVjhjT2MrMWlL?=
 =?utf-8?B?Y0dhRXhYYlZNVGlIQkEvQ3RxRFVLMnoyVVR4d25ZQmVxREUrdmxNdTBUUDYw?=
 =?utf-8?B?bUVUUjNPODlPMUpPaHJCV1dHZ2paTDNUTjBEWWM1Z1hlb2RVOUF5TGZET1o5?=
 =?utf-8?B?MWJML0hQUk9TcDlkMWtuVEc0dU15UVZ0RSs4aTd6eEpoSWU2SkFrOXFHOFVu?=
 =?utf-8?B?QVdtR1pMSVlvKy9tbUJvR1RlYzF3ZEtxVmpDbTdYVzhtaUpyVms5WEJYRmJD?=
 =?utf-8?B?MlNMQWtPVC9uamZsbDgyNTJVYTc4bmNVcHhUR1cxU05kUTY1OVdFS1Q1eWRp?=
 =?utf-8?B?SWloNXM5dUFNTlJPNVlTRG1GeUQyWmoxcHUwemxoNzJ2eHBVTEFUalVsdVBW?=
 =?utf-8?B?SVpXclphZThDT0dwOW9LcnMxR04vUDlBaXpKZVAwUy9BeWUwb1plSytDbzJW?=
 =?utf-8?B?QWxQWUtjajRMakFOZUF4d3lUNDV2WHI0S2QvKzh0b2JZWjBEWGNTbDlraHdu?=
 =?utf-8?B?VTJyVlUwNVFrNzBvNzg1K3p1VFhBK1B0SXI1M2YzTmcxa0x6UjJNVG5MSHFB?=
 =?utf-8?B?QnFjTVJmVm9HLzV5QlprWUlOaXdqZjZBdXhqa05yNDBIbFdCTmx0ZmhhYzJh?=
 =?utf-8?B?MlZlUHJmVnpxNVkwOENDWk9lVVVBRlFhazU3UWF6aCtwWHpPV0NSUzZldzFm?=
 =?utf-8?B?b1p2amFYQS9CM2N0djFJMVBqOG1CK2Z2RTk3STBYMGVPMGVvekh4aUlEc3Bm?=
 =?utf-8?B?Vnh1YW9EamRFcC9wMjkwd0ZLUkhGNEdwU0Fxa2hkSW1sRnRyVUdVb05EaHdF?=
 =?utf-8?B?eTVwazdoWmhMdE9oazBITHI0Q21YSWg5UlRmQnh4ZWtBNHZZUStVZ1loVnBO?=
 =?utf-8?B?Q0FEQmdpK01jQ1pUdVhXU1d3UFFjVFNIdTRNWmlaR081WWpvaDYwOGtYakZm?=
 =?utf-8?Q?yWw+C13Og0JgNfVhz923IkyKv?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b792c16-710e-4d62-9129-08dd56a79484
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 20:53:10.9197 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U+B4XhM2NMQxvx0pEFMe69aVQcFSFxxVwJXuHqZ5+U98fNoSemoTWYNa6yo8Neq8DOiu1LtI+3r+CSD9VkJikg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6875
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

Reviewed-by: Alex Hung <alex.hung@amd.com>

On 2/26/25 13:28, Vitaliy Shevtsov wrote:
> There is a type mismatch between what CalculateDynamicMetadataParameters()
> takes and what is passed to it. Currently this function accepts several
> args as signed long but it's called with unsigned integers and integer. On
> some systems where long is 32 bits and one of these unsigned int params is
> greater than INT_MAX it may cause passing input params as negative values.
> 
> Fix this by changing these argument types from long to unsigned int and to
> int respectively. Also this will align the function's definition with
> similar functions in other dcn* drivers.
> 
> Found by Linux Verification Center (linuxtesting.org) with Svace.
> 
> Fixes: 6725a88f88a7 ("drm/amd/display: Add DCN3 DML")
> Signed-off-by: Vitaliy Shevtsov <v.shevtsov@mt-integration.ru>
> ---
> v3: Update the description to include int in addition to unsigned int.
> v2: Change DynamicMetadataLinesBeforeActiveRequired type from unsigned int
>      to int as per Alex Hung's observation.
>      Add Fixes tag missed by chance.
> 
>   .../amd/display/dc/dml/dcn30/display_mode_vba_30.c   | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
> index cee1b351e105..f1fe49401bc0 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
> @@ -281,10 +281,10 @@ static void CalculateDynamicMetadataParameters(
>   		double DISPCLK,
>   		double DCFClkDeepSleep,
>   		double PixelClock,
> -		long HTotal,
> -		long VBlank,
> -		long DynamicMetadataTransmittedBytes,
> -		long DynamicMetadataLinesBeforeActiveRequired,
> +		unsigned int HTotal,
> +		unsigned int VBlank,
> +		unsigned int DynamicMetadataTransmittedBytes,
> +		int DynamicMetadataLinesBeforeActiveRequired,
>   		int InterlaceEnable,
>   		bool ProgressiveToInterlaceUnitInOPP,
>   		double *Tsetup,
> @@ -3265,8 +3265,8 @@ static double CalculateWriteBackDelay(
>   
>   
>   static void CalculateDynamicMetadataParameters(int MaxInterDCNTileRepeaters, double DPPCLK, double DISPCLK,
> -		double DCFClkDeepSleep, double PixelClock, long HTotal, long VBlank, long DynamicMetadataTransmittedBytes,
> -		long DynamicMetadataLinesBeforeActiveRequired, int InterlaceEnable, bool ProgressiveToInterlaceUnitInOPP,
> +		double DCFClkDeepSleep, double PixelClock, unsigned int HTotal, unsigned int VBlank, unsigned int DynamicMetadataTransmittedBytes,
> +		int DynamicMetadataLinesBeforeActiveRequired, int InterlaceEnable, bool ProgressiveToInterlaceUnitInOPP,
>   		double *Tsetup, double *Tdmbf, double *Tdmec, double *Tdmsks)
>   {
>   	double TotalRepeaterDelayTime = 0;

