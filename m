Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B84C1B34C
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 15:28:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 295E410E7BD;
	Wed, 29 Oct 2025 14:28:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="o/DE+Sv7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012024.outbound.protection.outlook.com [52.101.53.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE2F110E7BB
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 14:28:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SLyn/UU9syZgFUWwKqCdQuc/T82/giEY+JNM6MYg2qsUCSvISozhWMYlReajUmpBW5b9wPAZN1dH8378GfUBgLqvVpiiOPZYKw7+c7IMUMqogpZJuDFjwkoKUM4rOi/WPfu8fXcgJxr+yZkTC63Ggxko7tW6X9FUcCXuk5qAreGzm4C71i6PG7TqMNjzve6AvehB+Ngs8kjz+7+oQ74uQ/drpE1T/QTShQiHF0uNib9zv89NwB6cjO01ErSIl0a57gd99ENY9P83hb2R2P5ZMaFnjpHK5+R1sXz6P/vjZSb+MRUfMBTwzCIpc3x6+Wa6dlIamrEE1YIEJtQSv3qFDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qhlatm+/MRTVUJSrWHwhF0QmU8uDODbz0QPczJS2jhw=;
 b=blRPLB3+Fin4lPWW7A75GfZvDE42WPEQhSsSlHmUzf0KedU7lx4+zcXOWGKiZBhi2RvDH0YdUTS7VrY/S8jDy3lBTk2PmdjPbNo92f/e7B7WDPDnIV3Zkkx/rFn/8sZ188QvpLZFKTVjuh/RTzbEGqb8NPNM1D1aY4dgcUC0Y51HIbDAP0TEyKx3T0gI9a7UviXbvDQcOzR72r5hPWAafjGE0fmJAmMa4DFxUdDXA5r8WMibzSsCySwViHk0HV5WD8yoSHVLcTgRrmaQUQFOZYQDRs7XHilL8H6GIY2s3W79NSOfbEY+wk2RE146E/dJNcKbH7srk3q2tXJBxd+8bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qhlatm+/MRTVUJSrWHwhF0QmU8uDODbz0QPczJS2jhw=;
 b=o/DE+Sv79N446jwhzl76autzBmfEmlGtMdSi7aDcHg5vqudaNfFWUiOfjh6yU2IaTsAizfpIGGjKGdJ2EgxK03+q+mNB9yMLmQ5N+UeU6NKylv0y/BTYVhvN9+oQ+r6/DuitaDzJazZGFEtq+EIBPumF2RxUi0D96w1gEmMKGQM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by BY5PR12MB4275.namprd12.prod.outlook.com (2603:10b6:a03:20a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Wed, 29 Oct
 2025 14:28:46 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.9253.017; Wed, 29 Oct 2025
 14:28:46 +0000
Message-ID: <ecdd1f2d-7192-4fce-9fb7-854cdfe2ab88@amd.com>
Date: Wed, 29 Oct 2025 09:28:37 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/amdxdna: Fix incorrect command state for timed out
 job
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, maciej.falkowski@linux.intel.com,
 dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, max.zhen@amd.com, sonal.santan@amd.com
References: <20251028175452.2329497-1-lizhi.hou@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20251028175452.2329497-1-lizhi.hou@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1P222CA0063.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:2c1::12) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|BY5PR12MB4275:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c03a46e-392f-471f-1584-08de16f777da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cEJYdmV0YUlLRlYzWlR5a200SDlsVFd5TU5sU1FubFFaV3JRdGpQMU4wRzBD?=
 =?utf-8?B?ZTZuNkI4NWJMeUZ5cEVOOWloRjh6ZndpOXhoUGVldy90Wnd1OUduWlpUbjgz?=
 =?utf-8?B?aFR0NnBVeHZveGgxNUhxcFRFRXFibllUYjM5WEZLV2QzSllMUzVJaUI3dGU5?=
 =?utf-8?B?Nml3enNlelFBN1RNNTE4MzR4eEIxQ1IxUkwvRzN6Kzgva3NsRnZySUFYWlBy?=
 =?utf-8?B?dmMySWVXYkJ2REkyRjBjOElUSmE2N3pGcndCa1JsUjUyalVqT1cyRHErdnZw?=
 =?utf-8?B?MVIyY1hkY3U0ZlVsMjcxMmYwS0g2dktWd01TNU5CeDFGRU9Sb2NzMWI3MjJE?=
 =?utf-8?B?UzB0TnE1M2NybWMyL0JsRGZWNkZQOVhuRE5EUG5vdHRMOEwweUY3S3FQTk1v?=
 =?utf-8?B?WGc3VHpuRVJSQzdvLy9tWTNoZHRWWE9HZ09YYXhYU3oyL1VlWVljNlBQOGxV?=
 =?utf-8?B?cnNjME05Zk1RMHNLUWNEbjZpS2huWVRIOVpqak9kL2oxbTZ4SlpLSlBIUFhK?=
 =?utf-8?B?U3dQcnQ2cUNEM042dThwNGZoZWxDNnFrTHBjaUVJUWI3OXdjU3dqRVYwVmZK?=
 =?utf-8?B?U3Q3T1JDbGszTWwzMTR5aXBjSGRPdjUzYk1hdUVGblM1WEtVaGtLblkyV2t1?=
 =?utf-8?B?a1o5NVFtNTlDOGFFdXdqN2Z5SUx5UG54OWhORFI4TDJRcHQ4WER0MFNjVjVw?=
 =?utf-8?B?aUttQnVoVmFCaURSVGFZMWpoT25oWU9tL09vVmw0aWVtMmlzUFlHOEkyNVZG?=
 =?utf-8?B?TzZvemNUNmJXL1N5QWN0aERjek5JSGdvMGwvRGF2TFpoU1B0R1o1Z1Myb2Y5?=
 =?utf-8?B?dnhwcTExTFkwb2pObmlZWExqV3V0UzVlaDdTbXNzZ3FaRm55UEY5WjVCR1RX?=
 =?utf-8?B?SUg4MGJONktGN0szNXh3T3ZvRjc3WnlPamhCWjNmUUhKU2cvQnpKajhCRUdV?=
 =?utf-8?B?NW1YQXByYTlySktqMFpuS3lrZDk0VGtGeXdZVjVPbFB2SkN5aFZEekVtM1o4?=
 =?utf-8?B?QzNCNkJEUDBvV1lnMVlGL0tWYWs2cFRwYmFJTE5LTmNUUThSb1dkTk9GK0Qz?=
 =?utf-8?B?Sk5aTFdOcGNzWXF5SGRYSU1odzBvV3pPZWNtNXVZUDJxWFBXYlpwOGtmZHpp?=
 =?utf-8?B?OFFOSmxkTXpPS0ZkQXVhckxnUWF6M0paTGdaT1A2Um5ZMGtPOFdnSlhFRE9R?=
 =?utf-8?B?VURodFpKS3FBTUI3enJsKzlxcmVtMFZFTVAySjZybHZvcFpTQlpPQ2FHV2da?=
 =?utf-8?B?S0R0d2cyVVk5TVRhWVVMdlpDYUxyamY2cTE1S1FYcW5GQ0JaWC9IYkQxaXVR?=
 =?utf-8?B?WVdvQU4zR2VoeUh0dG9WeEZYd21hR1djQnNuaGl4eEdsMUl0UlhLV1dPSDE0?=
 =?utf-8?B?dVlraExzWUdsNjFTcGc4NlFkZzVsOVdIUEd2QVVYc2syMEFSWGo0NWp6NUVD?=
 =?utf-8?B?Q1VvNFp0amZad3BkUGE0L0hWNFBTTG02Ty9jZnBtSTZIQk9zZ1c4K1l0b3ZM?=
 =?utf-8?B?MnlTeXpMV3FUT0hONmtHZTFmUTZSTU1qQUliNEk4Z1QvM1hXN3NFVEFGTkN6?=
 =?utf-8?B?VEFqWjJyNUMxRG1HVDJISEtJU1hpMU1MQTJ0cytFMHppdlkzNE5BWkdVN1l2?=
 =?utf-8?B?dk5SKzF1SjE1TGdTdll3MVhUYU1odElJWWhtZjJqUXozUnowb3NZbHlhbFJJ?=
 =?utf-8?B?TUF0end4ZE04U2tmeEJETzNFREl4cnNoUmI0ZElWWWRlQ3NzOTJCTFozMDBT?=
 =?utf-8?B?ZFFWaXlFcTQ1NnpWMVZCdEQwMnZVeFF0eGdQRERXZmxXTkttRlBRT2RveG83?=
 =?utf-8?B?cXlHeEFuSVQvVElGeEdiQzd4bnpielV6MWdyc2o2NThTd1pvRzN4K1l2N3Jh?=
 =?utf-8?B?N2lBQjltQXpMVGc3OURCVVpwOThLeGNwc2NqQTN0YVBCZjQyVzQwcWRBTG9u?=
 =?utf-8?Q?gmAW5jr8AIjJKahJPsbV28RM1FKz0b2O?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cVp1UXc2UDNzdFlkb094eG1IMnpWVGc3M1piUmllYyt5bnVYL1F0azVsdlFW?=
 =?utf-8?B?RVByWExTeVpOMXIrTGh1dktwell2aWFhRUloQkhMV3lmYU9XdktpRkN0YVVJ?=
 =?utf-8?B?NUZJQmhMQ0d0NHlDWWpQeUxCVkNod1lUSHFSTDhWMlErRWgzS1dxeU93ZkhX?=
 =?utf-8?B?MFpyVnhoNzZuOFFRejZpL2E3WFAveTltNjVXTUNLNXU5cEFMTzdCYk4remdH?=
 =?utf-8?B?cGt2K1hWYk5lU2lLSmg4Y3M0ampFOCtldEM0MjlLNTVRNEVUQ2g1SHZaSVh0?=
 =?utf-8?B?MUNYNG1FUi9WZXlYeGJGcVAxSGxkcm1kQktWdXc3RTBwTXk0eVo4Z012cVYz?=
 =?utf-8?B?VWNpay9nS0loVXRUVWZhT3VRWmFIc1N1U2grcUlUUExtWU9vZ0M5WUx3b1pP?=
 =?utf-8?B?YUQraXA1SEllNVpyQ21KNzZoWFpQMnVvUE42Z0tVWHFFQ1NnTGl4ZktHSndi?=
 =?utf-8?B?WTBLWWo3elFKTkFTVEpBK3N0OEVKK09UMUhISk5RU0RkSUZqK2ZaMmlFZndy?=
 =?utf-8?B?UDM5MWZEblhsdXJkZkFsenNBRkJZTCtBdXM1TGhCQUk5OGFBRFk3anVyWnVx?=
 =?utf-8?B?MGFzUlY0U05OZlpqcERvN1VwNTMxQWpXbWdZNjhpZFVNZUtDNjFXc3VrQmVa?=
 =?utf-8?B?blhqRGdhZ2NiRXNZM1Erb0NBWmUzV0lMSE9scHdmL3BXbnhXcnpyVkNpTmlN?=
 =?utf-8?B?L215NU1EVnNIbHhNL1VEcUUxZkt4OWtwKzBZYTkxYmRkQ3hDTXNyMXhSTlNJ?=
 =?utf-8?B?ZnJhR1ZPK2c1eFFnemFRc1lFbGE1emVoOEZwMU8yRy9BallYb1d5M25VcHlW?=
 =?utf-8?B?bmNZM2UwYVptL2ZTcWNTTldEZTExejM0M0xRZVdOSm1MZHpRejBBSTdmWVdu?=
 =?utf-8?B?M0JHMEFBNC9XaHNKaTJrTitpUVBuQ2hPc2F5R01IU3p5RDBIQ2Vud2xFNHY2?=
 =?utf-8?B?ZlpESW5YL1VZVGdBSVJhdVFySTgrVEhKdjBILy9tbnRqak94dmcwM1YvNzVL?=
 =?utf-8?B?T2ZMWTJlanY4dTVZcWtUUHRZZHNFRE5scXpPZEtxaWU1UGtCc1pzS0hQSHpk?=
 =?utf-8?B?VGJoRkdvZVMyaXUySXVaSWorY2dBSTAvVjRYMjVMajNCWlMxZFp4UG50eVV2?=
 =?utf-8?B?VnhOTTYrcFJINFlhc0ZSN1Y3cmUvVGluQU5vMFAxY0NlL2ppNnZNc08xMHlx?=
 =?utf-8?B?eS91bjVkT1JsMjFjYklmNlJnU3pYeC9la2FBc3haTWp1ZDBYYlhVQ2Z0UXNG?=
 =?utf-8?B?cURUZTBDUFF4VmZmdWdmM2FGUXhqVXNFcmlmN1R5ejg1MmhIVndMQXB4Z09r?=
 =?utf-8?B?cHhGdDlWZzVqY0xwVDllalcxT3FQeDNxaVVidnlpdzRHVU9VZlkyYlo0dS9Q?=
 =?utf-8?B?eStDdHpLYUhSS3k1M3RzN3RwdlBsOWRlNUc3NWFhait3d2JMS2d5ekkzZStM?=
 =?utf-8?B?bjdabWJRV3NhQmVHVHRPUGtsQ2tBdGZrYVVlNis3SXVVTDd3QXVaVFUwM2Vm?=
 =?utf-8?B?SVNjZDVsNVJzWkc3YjRkWWNvdlMya2V3K0pKVkxRYVBOanJYalIxVm1QMXFu?=
 =?utf-8?B?S1RRSjl1VWNQdi9YNHFqdFhoWExRWWlhclVWMFROdGtjR0V0dnJ1TXdEbkor?=
 =?utf-8?B?N2xueng5THNlWXZxMWtERG9GVDYyL2VBaXNTZkJFT041elErKy9aZEZPaGN6?=
 =?utf-8?B?M3d5cXlsYzc5WGRJV1E0NlphRG1CVk5EYkZyQVdHZy9abHNMVmNNb0kzRkl2?=
 =?utf-8?B?MSt0dkpjZkxHY1MwUDlWZWZkZ3d2NG9pbUthMllCQW1hS0RXQnRGVHFpQ3pQ?=
 =?utf-8?B?U0swdXBDc1dHU1dIajJPdGdIU0VjOWJJdkpjY3NXa3d2VEE4THRkcXhJTzNt?=
 =?utf-8?B?UTlmQVcyeFpYTXI5MDc3V1NXVFhiQ1pDKzVITVlRTC9xMXBNVjBuTkRNdmgw?=
 =?utf-8?B?ekRyOXRkcEE0MVVuUFBGQ0ZxbjFockROTkgyWVR6OGkvc08rOGF6dWVOWVBk?=
 =?utf-8?B?Sk16ZGUrNmxPNndQdkNKZEtrK1FjQnRwTzcxSjdnbmU5eER6Skk4UmZ3VVhX?=
 =?utf-8?B?NUN4TzlGaUhhaUgxckllNHBaVSt4YVlFVUVSSkFkVjNXR3RjeHQrOHNaZXNS?=
 =?utf-8?Q?XZhQeN9kEqPed26bx4gG+lTR8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c03a46e-392f-471f-1584-08de16f777da
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 14:28:45.8951 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OjcNJQ5J8wNaLBT8q5DcKAePZasOr0LdjEpJBFGa3RO7TRdXi5K0ADG3lMODqljv62h7sMOHb+Y0cAUOikRKFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4275
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

On 10/28/25 12:54 PM, Lizhi Hou wrote:
> When a command times out, mark it as ERT_CMD_STATE_TIMEOUT. Any other
> commands that are canceled due to this timeout should be marked as
> ERT_CMD_STATE_ABORT.
> 
> Fixes: aac243092b70 ("accel/amdxdna: Add command execution")
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
> ---
>   drivers/accel/amdxdna/aie2_ctx.c    | 12 ++++++++++--
>   drivers/accel/amdxdna/amdxdna_ctx.h |  1 +
>   2 files changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
> index c6c473c78352..958a64bb5251 100644
> --- a/drivers/accel/amdxdna/aie2_ctx.c
> +++ b/drivers/accel/amdxdna/aie2_ctx.c
> @@ -204,10 +204,12 @@ aie2_sched_resp_handler(void *handle, void __iomem *data, size_t size)
>   
>   	cmd_abo = job->cmd_bo;
>   
> -	if (unlikely(!data))
> +	if (unlikely(job->job_timeout)) {
> +		amdxdna_cmd_set_state(cmd_abo, ERT_CMD_STATE_TIMEOUT);
>   		goto out;
> +	}
>   
> -	if (unlikely(size != sizeof(u32))) {
> +	if (unlikely(!data) || unlikely(size != sizeof(u32))) {
>   		amdxdna_cmd_set_state(cmd_abo, ERT_CMD_STATE_ABORT);
>   		ret = -EINVAL;
>   		goto out;
> @@ -258,6 +260,11 @@ aie2_sched_cmdlist_resp_handler(void *handle, void __iomem *data, size_t size)
>   	int ret = 0;
>   
>   	cmd_abo = job->cmd_bo;
> +	if (unlikely(job->job_timeout)) {
> +		amdxdna_cmd_set_state(cmd_abo, ERT_CMD_STATE_TIMEOUT);

Don't you need to set ret here?

> +		goto out;
> +	}
> +
>   	if (unlikely(!data) || unlikely(size != sizeof(u32) * 3)) {
>   		amdxdna_cmd_set_state(cmd_abo, ERT_CMD_STATE_ABORT);
>   		ret = -EINVAL;
> @@ -370,6 +377,7 @@ aie2_sched_job_timedout(struct drm_sched_job *sched_job)
>   
>   	xdna = hwctx->client->xdna;
>   	trace_xdna_job(sched_job, hwctx->name, "job timedout", job->seq);
> +	job->job_timeout = true;
>   	mutex_lock(&xdna->dev_lock);
>   	aie2_hwctx_stop(xdna, hwctx, sched_job);
>   
> diff --git a/drivers/accel/amdxdna/amdxdna_ctx.h b/drivers/accel/amdxdna/amdxdna_ctx.h
> index cbe60efbe60b..919c654dfea6 100644
> --- a/drivers/accel/amdxdna/amdxdna_ctx.h
> +++ b/drivers/accel/amdxdna/amdxdna_ctx.h
> @@ -116,6 +116,7 @@ struct amdxdna_sched_job {
>   	/* user can wait on this fence */
>   	struct dma_fence	*out_fence;
>   	bool			job_done;
> +	bool			job_timeout;
>   	u64			seq;
>   	struct amdxdna_drv_cmd	*drv_cmd;
>   	struct amdxdna_gem_obj	*cmd_bo;

