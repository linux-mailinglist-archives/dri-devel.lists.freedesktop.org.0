Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F72DA0806A
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 20:07:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 415BC10EF09;
	Thu,  9 Jan 2025 19:07:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="AX1J+20v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2084.outbound.protection.outlook.com [40.107.102.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD47310EF09
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 19:07:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=If13jbK3meie4npLHH64SjQmU8TAc16D/AI83Q31xJctqhtCzxAkybR86ASzLwjciE79aG9j9uMHBcHHh5BF5vcGXXd5EWM5tx3ZC1wt/yt6oMju9EVdHrcR9xZ46Tb8McP/N3MpAZ45KmYH6CjfBqAVrle6ijieqLW/qf19PdV12ye2c4JU4i7vyJshMiktz0x4NXaa12fHjuXVVsQy809QKbET5Wwo877BpS2h4yJ4byiXRX05HnOrBMknGnDnpMuskm+XB2ZnikChI/Yux+moaPB+LzHljMZjGYcDrCOf/lOcBNQgthrD2GE+RkxMGz6wXx+7qqAgqvRuPN2Xwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ib8qpe42YlFoHhXt77aefmaoQqmJ7GL6pvkmxp+xl8Q=;
 b=Yi9ValQQEQX1XoL0mSlWNQbynSaLH7SeDd4bNvLIOLXlfnXk7w85lbrJAkR0lnHUVGK3JzBqYQViq534rYxY8+qsRYeooX3DOmcUnVmegITYeKZoKHZ/RWOjLk4j+0qNoTsdFUViciCvUm1aAqxc65Wc+3q9tEu6tqG/G4VtMe0/xMiG9fAyqx11olAtAbiQIRUWCupCWE2kz8CfOxJc+fuf9Vny2c867IharRGm0B6opPiF/+cHQgli4fTF2GFASt5LejZQSY2SqiKZc7dHT++P11qCLtfhSfstcHVGCLhVbQQn69mGUWXjr+CoEC59+icPZT6ea9WuT1QbGqIDvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ib8qpe42YlFoHhXt77aefmaoQqmJ7GL6pvkmxp+xl8Q=;
 b=AX1J+20vhAJ3WFIZmgoDnSkmjWOUyfcqomkcDCo4rQ5h+7evu8FnKhkZkOqyeuQqMr38qUk1VGnonif5kwOnSM/cEe1k+dKbCdL2kotTtwkRu1vY9YAcPk1SJPecXHg6wNy4z5uAJTVCpEIxwfM4C6tY9keuldIhcnt6Z9wfi5o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DS7PR12MB6286.namprd12.prod.outlook.com (2603:10b6:8:95::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Thu, 9 Jan
 2025 19:07:01 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8335.012; Thu, 9 Jan 2025
 19:07:01 +0000
Message-ID: <e9926668-1fe7-47e0-ae7f-ab5c816b310e@amd.com>
Date: Thu, 9 Jan 2025 13:07:07 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/amdxdna: Return error when setting clock failed for
 npu1
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, min.ma@amd.com, max.zhen@amd.com,
 sonal.santan@amd.com, king.tam@amd.com,
 Dan Carpenter <dan.carpenter@linaro.org>
References: <20250108234150.354703-1-lizhi.hou@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20250108234150.354703-1-lizhi.hou@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9P221CA0005.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:25::10) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DS7PR12MB6286:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e31877c-6f1e-49aa-5c2e-08dd30e0cbfc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NFNraWYrYytjUm9QdVZudEllcGR1UDRWNW04MElWTXJMdVBEMll3WXpsWm91?=
 =?utf-8?B?WE42Z0huNDJVbENYdVlxWldJdUl5SStPNytSYm5DdzJDNDVJYzMrdUF3K0hv?=
 =?utf-8?B?bXF1cFlsbzQ5TUZoMlg2b0s5cGs2Vm83VDg1OFhGaXJ1NmZ5TFJoQzdESVNt?=
 =?utf-8?B?OTB1VUc2TmdWaWovSFV4a3RwWDJOZHF6Wkx0T2tHNDcweW52K0t6Vi9KaExj?=
 =?utf-8?B?b29IcklQeFQ0RHE2NHlYeHY3UkRBejBFK0FySnZrajJMT1RnQVlGQlNwckFC?=
 =?utf-8?B?bkxNT25XeFpWWWNtNW1nelFMSXpYTTRQbmNvaktSV1FDOUgyWjh2dzREaGFG?=
 =?utf-8?B?M1F0TklSa1UzRUNRVmxnWHEvZVZjNDJ4SnR3UFpCam5lMlFRNDBza0tMY2FQ?=
 =?utf-8?B?WjdQQmNoeVZtdEFML1A3RzA0OWs3Qi9lNGhVOVROd0E4a3FtRGpVOHc3MUR3?=
 =?utf-8?B?NU1EMFY4WElzZnUzMy91UEV4U3liUEVZU0ZnWnY3V3Uyeld6ZWZHY2p2WndP?=
 =?utf-8?B?bTJCd3RTYmJmMHlYdC9EVDEzTE01c2RLTW1QMzU0UnhhVUgrcG5wNCtUL2ZI?=
 =?utf-8?B?OXNCVTBPQkk0Z2RvUnFNV0JFUTRUOVkyNXJWa2dsVWt6QWQwdWFlcndHTWpD?=
 =?utf-8?B?NVYycDJRZmNPOXlDYXNNblFrWlYwOWdlcXFBVW51dkM4b3BzNEdMRTRGMjlK?=
 =?utf-8?B?WkNZUEwwWkJOd2NFWiszcTdtMWMvZlZBaWlsY0tVZ3lWS0FxeW1pZGkzTUh6?=
 =?utf-8?B?TWN6RlZjaHArazlmL0NKaExSejZHeTN1Vk83T1hLNTBpZkZCNlh0UnNFUk9C?=
 =?utf-8?B?eEpOa3hGM2lnTklNZm5yM0lxM3hNZFU5U09jc1REUU9VUElOcDdYRDA5MVUz?=
 =?utf-8?B?b3Z1ODlVd0dvL1g4OWdHRHdXWVRtMitJanhiWVp0MXBKbmVHRkZXV2F4amRv?=
 =?utf-8?B?V2tFVUltbnJ2cHlFcHRyaFdiU3E3eFUyY3FCeHdJNmxOZ2xrY0c4TlRvK1ow?=
 =?utf-8?B?SkJodzdsSUlEc2JlVi9PYVBrWkUvZ3NJTzlVaDFoU2RVaGZjVjZKTmdXcE54?=
 =?utf-8?B?c0ZCKzFDRk9QOEZXWEtrdFMraWQwU0ZuVy9mazE4OU02Yys1RTgwbmYxT01q?=
 =?utf-8?B?R3NSZXVqL2tocG1Rd1FRWmdXN2JqbzBmTzZuVHdSQ09wdjc4Z3dUbXdqUVFk?=
 =?utf-8?B?VExaUnh1aXZPVTBlaXpoYnllcVl5a2RPa1hsV3QxWDZqTEQzdzRHYUprRUtE?=
 =?utf-8?B?SGtMajcrZlVMSmo1c3k5QnNzK0ExL3M2Y1N5aFRMZnJld3JtSE1OYVVWZ2hq?=
 =?utf-8?B?WnVtQnJMOWxrajY1QVJrRUsvNDRJdU9YVzBHNk9mdS9pdFNBQTVQZmEwL1FD?=
 =?utf-8?B?enl1ZjQ1R014NDE5c3IwV0I5MWZ0QnhCZmtMcG5tRlZsbmViKzRRSis5V3VE?=
 =?utf-8?B?bFp3UXFlWENxU1dTSHZtZmYvdjZzUklkZUwvT3hVSk1Eb2RRckI4bGRqSU1N?=
 =?utf-8?B?OG1NdHB1TVAwSHlXYmVYK2ZZZFQ4K2V2Zk9MZi9VQ3pJYVViUEpTUm5xS0E0?=
 =?utf-8?B?STRzSWI1TFpjRE00bXMvUGZEYTNhL0F6dnVjQTVGWG5SdStPRHNWOXI4RlR4?=
 =?utf-8?B?NEFvUFRkSEhTUEhaZTd6SFU0LzdVbXh2dGJUZzVFRGZXMjd0VS9aaG5hak1M?=
 =?utf-8?B?TVhKUExUVmpnVEl6NTY2bUZFWFVLc1ZyOGZQTTJCVmpwd3VSVldQbUtQRWxt?=
 =?utf-8?B?eTFaMmFReEJVV2pCTlo3djVVekVBUExiTjgyb1J5YktaalFjNDZaZm9PaEhS?=
 =?utf-8?B?dGs4bGF5SWtPSzFBN0tmZVl2OHdZYVM1ZVBSRHR5aS9aVm4rMnB1MkxDRXRD?=
 =?utf-8?Q?m+upE8Xut6unF?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d2FkSGZFR3RWdkhBZTBoT3ZmalVVczRNc01UZ0tUdERjdE55a1BZNFduVm9R?=
 =?utf-8?B?NUhuVWdHeFJ2L0ovc250OVVBSERtR1VCemdEQmJFMUk2UTFVTHRMY2l3SE9B?=
 =?utf-8?B?SXh1S01ZVnhFMG5JcUhhR09Fd1c4SW5tdUMxZFF5T1MrVUlpQlpWb1pWMGl0?=
 =?utf-8?B?Q1BDV29IaDVIMmpJSy9CVk5nUXZnbEp3bTBJUzNoWENPQzZnVU5ZWG0vN0VE?=
 =?utf-8?B?VWVsRGFFVnVVSnppWEtaRzA5WHhpM2ZrdUxUR0d4MXcvZUlIOS9iRkt0eEpF?=
 =?utf-8?B?S05Zb3BEcDdTM3AwWVVrWVNadUlPWFZyeGNrTVpYSE9QUjR2dHQ1d1RLYXVn?=
 =?utf-8?B?QnJ3S0tmd2tlaUYwQXo4QUZ4OEpzZE5mSkdHd3FhU3ArZUxhOVpsMmNTZWNt?=
 =?utf-8?B?cVc0UTZjRGdjMVRiR05DK3FHcjMwUUVEdE53dktERXdkMk5tenY2SGFhZmJ6?=
 =?utf-8?B?dnhPT1hBblJGM09xSDYrWUR5cTRpb1JlOVVSTmNHVWpzc3FZOVZLSXVpUzVv?=
 =?utf-8?B?U1U1T04zYUVhdmFtWjdVaFNIc3B6bVAzTVV5ZU0zQWFqdGpPNmVEbzFMYjJB?=
 =?utf-8?B?b1MyVmpndkszTXZJU29nY0VibFVZbVZNd2Vnd0JUL0VIL09NQzNYQnkvdFRI?=
 =?utf-8?B?Lzh2ZkpZWUdWN3FNZ2ZjczRjdWhoRU5qUXVYZitDR203K3hSNExONklaMzEy?=
 =?utf-8?B?VndRSTFvVXI0VzF3ckdqM3llbGNjMzl4SjRkMmFzUTZ4clBqaHFlR3IyMEY5?=
 =?utf-8?B?RDVSYUJVRVAxVTRUdXNDbWo0ajJTejZCUklMRng2ajYwY2JFSEZUVFQ5NzdJ?=
 =?utf-8?B?UzR4QXV5ZkpVcFZnQWsrVU9zSlFzUW5HbW1PZ01FS1FSbXJOcjZheGdKMTI3?=
 =?utf-8?B?UFAzUFB3ZVE1ZU1Wa1VKRHlQZFRGMXpuNG1mOG5qVzdaUVVYb1NLKzkxU0ty?=
 =?utf-8?B?dm4vSGUyMTFoZ1hmd25kQkEzblh0TDhzVEV5R09LTExBamVhVm1NbjNWR2M3?=
 =?utf-8?B?RUg5d25lWllmeW9UMXJvd25uS3pzNExOaWlLcVIrMEwvWGpaY01KM0k4Zncx?=
 =?utf-8?B?dUExRGVmckZackdYekRXR3ZxbXBFME9pQ2JBVmpwRGh6d0huYWZ0Rm5TeGlW?=
 =?utf-8?B?WWx4WFV5cm5lYjFJdG1KeSszSjNSNzQ3TW5QbWN4MU12NTZuaDltNzFRSWVm?=
 =?utf-8?B?QUFjU0RCSkxxeWpZMUZDaTdMYXFkQUF3alN6VE9KZGdzc25NVkwwYUswbkdS?=
 =?utf-8?B?b0tJK1RReTU1eGdrRXRIWW5ZclRGdjMzRjF2Y0h5OGVPMVJuMDVBQS9mUGdY?=
 =?utf-8?B?V05ZNkJBbjg2VXhnV2hsS3FuWGNRdkFGOEpvNi9PNVNKTVBLWmp6RjZONzZP?=
 =?utf-8?B?WFN3d0dldVZuQktrMEsveHFwZGdnclRBMmdBQ09TNHhZM01XRktZaWFZWVJX?=
 =?utf-8?B?Q1lnTFZHcnVibU1xdnZxSG9yc2E4V3d1Yy9hQnpLTjNDb2tZeThFR1FNR1B3?=
 =?utf-8?B?MUtSMWI1K05uaUVhVkFiRmdvY0xnYXVzd29VUVo4UnI3ZThodk5PQ1Y5Q2ZJ?=
 =?utf-8?B?ZUgvNTFnVFd5SU16eUVXaFF3Qjg1dXFPK0tRMHdiNEJTc2FTb1huUzRUZmp1?=
 =?utf-8?B?ZkMzRlJUWWpZYUtSRCtwVHJHMmQ5eE82dktUczdtclRpUmQrMU5abHc0bmNC?=
 =?utf-8?B?cEpYZHlsRU9iWWFrRFA2YXVFMXZXWnkrT0w5cmJlV3hYNHA1aUpUVnZPYzJV?=
 =?utf-8?B?bnJjc213M2dDaDA3d0x1aVBpbHh0Lys5alVqNnVmYkd5MWtZL3pnSnBnd3dr?=
 =?utf-8?B?MklscE9tWGJSZkkxM3h3KzQrMkJYSzFweTdwOG9vbGFLTUhpNUZVQjB0N3VX?=
 =?utf-8?B?cy9uYW5BRHMyMlBJVGdwYkpoYnlCTTZhcDRJM3hhbi9kS2pYb2hZSXA3OWtT?=
 =?utf-8?B?bjdJREhWK0h6VEdlZ2xvZWJEWThmSklueGV3QitBa2JDdXpOR1BqSFVQcUp4?=
 =?utf-8?B?Y3hRMm1BSlNqYVRZZ1F4cDQ3TWNOOWtVcGZwcGNkSTdWcFZScXIyNGtwMUUx?=
 =?utf-8?B?QjBvNlpFbkhOS0RudURxTWNSekE3WWY5UEJhVWZHUHY3QlcweEVNRjlJU0dj?=
 =?utf-8?Q?GKPVseIT4t2YcbFNgcfwUk01P?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e31877c-6f1e-49aa-5c2e-08dd30e0cbfc
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2025 19:07:01.0937 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NeeuvvOLpG2fPnxobdgeP4cYaB8+K/dphQvjmAbuV3YJKUQWfEnhbshFIKULxcCpL5iVZs0Mlv4ApVAtzM5J+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6286
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

On 1/8/2025 17:41, Lizhi Hou wrote:
> Due to miss returning error when setting clock, the smatch static
> checker reports warning:
>    drivers/accel/amdxdna/aie2_smu.c:68 npu1_set_dpm()
>    error: uninitialized symbol 'freq'.
> 
> Fixes: f4d7b8a6bc8c ("accel/amdxdna: Enhance power management settings")
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/dri-devel/202267d0-882e-4593-b58d-be9274592f9b@stanley.mountain/
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
> ---
>   drivers/accel/amdxdna/aie2_smu.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/accel/amdxdna/aie2_smu.c b/drivers/accel/amdxdna/aie2_smu.c
> index 73388443c676..e68aaf7cd9f2 100644
> --- a/drivers/accel/amdxdna/aie2_smu.c
> +++ b/drivers/accel/amdxdna/aie2_smu.c
> @@ -1,6 +1,6 @@
>   // SPDX-License-Identifier: GPL-2.0
>   /*
> - * Copyright (C) 2022-2024, Advanced Micro Devices, Inc.
> + * Copyright (C) 2022-2025, Advanced Micro Devices, Inc.

Can you please refrain from updating the copyright in unrelated patches. 
  This should be it's own patch.  And that being said, why even have 
years in this copyright?  It's just one more thing to update all the 
time.  Maybe just drop the year entirely?

After removing that from this patch, the remaining change is obviously 
correct so you can include this for v2.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>

>    */
>   
>   #include <drm/drm_device.h>
> @@ -64,6 +64,7 @@ int npu1_set_dpm(struct amdxdna_dev_hdl *ndev, u32 dpm_level)
>   	if (ret) {
>   		XDNA_ERR(ndev->xdna, "Set npu clock to %d failed, ret %d\n",
>   			 ndev->priv->dpm_clk_tbl[dpm_level].npuclk, ret);
> +		return ret;
>   	}
>   	ndev->npuclk_freq = freq;
>   
> @@ -72,6 +73,7 @@ int npu1_set_dpm(struct amdxdna_dev_hdl *ndev, u32 dpm_level)
>   	if (ret) {
>   		XDNA_ERR(ndev->xdna, "Set h clock to %d failed, ret %d\n",
>   			 ndev->priv->dpm_clk_tbl[dpm_level].hclk, ret);
> +		return ret;
>   	}
>   	ndev->hclk_freq = freq;
>   	ndev->dpm_level = dpm_level;

