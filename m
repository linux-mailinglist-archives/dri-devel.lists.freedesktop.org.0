Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 238253CF5EA
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 10:17:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0C026E1A3;
	Tue, 20 Jul 2021 08:17:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2050.outbound.protection.outlook.com [40.107.220.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 172546E1A3;
 Tue, 20 Jul 2021 08:17:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k1Devk/YlflaqzAShY0e7GmhycddVVY92fMD303rpp/2TBEdtrZ3ngkm8YTElq0GJN2ueZUuwZUPwKPWB7J+jQFG11QHrvUeWBGLcui7Wg69fomiA0OAnNHlDugq+C1WPeNCRTAWYsaEQk/NrujuQl9Qn1FH3uFgSpiMUzN8iKc/CQ4vPsrqIecAiYOo05RiPWhQt/9wB9+4nz3YmFvLEFqiadNRjbXX+hs5EnUEuFOpxDH5ugz/yWyv8BigPaBOZd7Nsbb2VgZOZrvwhBbJ0fHwdasyF6oZvYZsjWcZ+JVRs0H5R7FtfMzqKg6htdfvV85FSdd9urpiNY5i1pV1sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/wk82qEYdky3qaTaDmXcKebA8AXYNofaorVIl6qrbkk=;
 b=MLxRhaxoJq3Zp3vA0UJJVA8MpmHlnS5zSm0rEXaYsGSpW3F+s7uWDtsO5nv/49YVyJ+DPaq05G51r9yL5v5fsIctfi5SZQZhX1p44s/pPNJimtQFRsz/3juu+9nNUMuUtFBRdi/hEt/k2zE40Y57eleN1lrSATqGwTtJgA+bdIeHh8PVwGAaie6LQvjPoAGA7QMFNGpSM/3Q7RmNJ3I2KAFDkKUORZrJRTuT1M1l2tqLXLFD/wpuZM3vYCW1NEq449q+xp5rrciVoxqld9PpWFY9Qm/Fysq+J+3wmUuDE/hz11Vo6WgBpH6HMpVatmrlPhTAen3zq+PmSC8HoiyyXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/wk82qEYdky3qaTaDmXcKebA8AXYNofaorVIl6qrbkk=;
 b=3j0D4MeoTFsG28kOjq9q4RppGvX93nXYjPQd1BuVNYtLYi0KiEV1efqVmh3X2Oh+DAraM/kD9+G/DmmWssixC+i3HMiCd2W67zKXZB/Ci4WWYBGgrd839318WBDjfU+hkZNXJlJAO0h4wBRHMBziBzpJUdqD4EYH01npaR4uO5E=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3998.namprd12.prod.outlook.com (2603:10b6:208:16d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Tue, 20 Jul
 2021 08:17:30 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4331.034; Tue, 20 Jul 2021
 08:17:30 +0000
Subject: Re: [PATCH v3 3/4] drm/amd/display: Add control mechanism for FPU
 utilization
To: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Peter Zijlstra <peterz@infradead.org>, Daniel Vetter <daniel@ffwll.ch>,
 roman.li@amd.com, sunpeng.li@amd.com
References: <20210720004914.3060879-1-Rodrigo.Siqueira@amd.com>
 <20210720004914.3060879-4-Rodrigo.Siqueira@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <27570b32-87ec-730c-31f7-e12fab277756@amd.com>
Date: Tue, 20 Jul 2021 10:17:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210720004914.3060879-4-Rodrigo.Siqueira@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: PR0P264CA0162.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1b::30) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:8651:5b5e:8648:2fd0]
 (2a02:908:1252:fb60:8651:5b5e:8648:2fd0) by
 PR0P264CA0162.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1b::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.31 via Frontend Transport; Tue, 20 Jul 2021 08:17:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d65b53f2-4d8c-4956-edee-08d94b56d13c
X-MS-TrafficTypeDiagnostic: MN2PR12MB3998:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB39981C01908C234440A7B92D83E29@MN2PR12MB3998.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:161;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0Js6pNrKtfxMMOtNlEYvTiAnW4bOqawQdz8Q5hLTWJqFioAJoaKRRyNWXgCf4I4huy5hnKtZwF0/f3YSrZUNKB/oMyKNFhehniN9OOprS/M7qYrLewmo6Y7/rxqcF7jiI6sWpKjetYzrYLEDqnm9KX45be4TDLSMb0i/9WBFWtd8/+5A5bi6pSKHbR48fRR75urRDnbcmYQH6FMyqLgtWTMb7HdZ86MJMevaIlETgKZXr8+0oSVtroZttoQnkxMRfz2A1h2/jFVxACk4xQgf2J7JDuV5u0dOhWs7GflgxOhF8sv9j1dy7Ie0bPhUoaIbfr+iBqBsKNXhsVmpEciGs/2cv+HkkEeHw/sz6rQoVRXT8W9frK0a8gblG5Ca8XyZjdGb6/SSDAg+i7unS35rY/lB2wJO/TIXn2xE6jr/lr8RMYG3ksZQ/PFU7UFNTvyN3ZhUDpuQGLB3sIv+YF+28jd+/D8x1gilgzW7cRDMxo1SE7SIwAIS37LTexBRjgO4w/p/g7RZCTVvQ42Mf+h0RUnBN+jzsifQAfqmBoOwhsVmeIA5L/Fd/XdnA/MZC+4aiU55SB1nwTEX6ZlWNJDCO5gXQ5M44UNR9tXp5GAI6M4M9XhNFZuJq3EB1pPPFt99+7RlcmmKu1wug4YQXRdRz2oUR6fS4mMF3zN3SLWxVB8sWZwqQ4PQty7G07E81SCk29bR8dcbybkZ92F7uFOU2t3Qw40WHDj/t36+1YMAyzQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(346002)(136003)(376002)(39860400002)(186003)(31696002)(36756003)(83380400001)(8936002)(38100700002)(66476007)(66556008)(6636002)(2906002)(66946007)(6486002)(86362001)(8676002)(2616005)(316002)(54906003)(110136005)(6666004)(4326008)(478600001)(31686004)(66574015)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vzh5VGxFVUdnaThFak0ycjUvSEZZZVJqNkQxLzVXM3pMYitMblphbkN1UzJR?=
 =?utf-8?B?bG1lTmlHWjQwa08rRXNSV1lrcFpDYTRpcGNMRDM5d2duTUZ5YlM5Q1JvVGhq?=
 =?utf-8?B?MUl5V0pFTDFQa0ErTTZpdkVKY0VjOUJZOWtZOEcxaDVZYzV1TzFDUFJqRHVw?=
 =?utf-8?B?R1V2ZTdGNnE0dVdjSVVXMjd5QVlLM201QXYzMERjQm54S2tZWnBPczh5ZG9S?=
 =?utf-8?B?SnFoSG1SRnMxMklzK29BcTN3TTNiY0puMnVWK3BVNmJEQ1llTU1xVTZGUXJn?=
 =?utf-8?B?djRCVlkwOWdtRisyQjVOMlBaWHlQRTdHT1dHU3l0Z09OMFJpeEVWYndncW12?=
 =?utf-8?B?NmRXd3hTVGVsWFNYdmNlR04wOUNSL05sbG9iLzFlejZXczRoS0swd080WW5n?=
 =?utf-8?B?RjArTjJkeXVybGJRcUZFQk9TbWVkazdCbWdQaUVFNGJ5KzNMa2dkVVdtVWlS?=
 =?utf-8?B?K2tZb0JETm1jUWJUZWtyc1REY1RKOXYxbGhlb2RFSFROVS9BQThvWnlEM2FQ?=
 =?utf-8?B?L0FTYkpUY3hPMitqQW1WR000akNocFNiWmtwdmIra2F0QUhpUlhlWWpwZGkz?=
 =?utf-8?B?d3lQUTZiODJ4U05PL3FUOE12WUtUMGozQ0hKZk5MUVduSUJaRFlvTHRHT1F0?=
 =?utf-8?B?NEhIbXNvRG1sYzYwa290K1JQdjJoSk80MmNsNTJ0UEFSUnNYOS9abXNtWE5Z?=
 =?utf-8?B?eVRER1NKWXRHOURNdHdpWm1talNURmhJb2hTV3dBbEZJTUpYUkNGeTZGeDlL?=
 =?utf-8?B?cys1dTVGQkJXS3hFS2w5Mm5KREdXUzFPMEUrVUJXdnlpSDV5VkE1NGdYVWJu?=
 =?utf-8?B?cXpBaDhvUGFIbjZBOFJ0NmIwN01NeC8yTXZ3aHp1NEVKaGZEdGZNOFRGMC9T?=
 =?utf-8?B?T1BCTmdIZnJXNmFtQkFPa1pxQ3FSdEp4V2xXN1REc2x2elArdkhtd3JDSVFQ?=
 =?utf-8?B?MldWTjRKU3Vla2xTMk5wRTNPWDdSczUrSnllWXdZSzZ3T3E4OEl0M0pyWjlL?=
 =?utf-8?B?U09vd0N6bTZRN1VFcEJXZlI4OVEwMmN2VlhPbm1XUnJibzR0VEhydElhRzlB?=
 =?utf-8?B?OGZDMmxjT3JYRzRnWWZXUVNNM1MxMjBrZkFhdkhSaFlNMFZpZHBhQWM1ck1W?=
 =?utf-8?B?dGFObk1TMW80c0syUmh6MFAyalJjMHZabUhwSkROQUIxWi8yQVNVQklSRDZ4?=
 =?utf-8?B?b0I1N3I1MC9SanF0cFF0R0t2bkViV21SZkQ4V0kwNW4wYTJ1MXRMYUtpZjlO?=
 =?utf-8?B?YW5hV09WZWl2UUlGTmFlVUt4cTFSd3phcXpNYllxbWhOUVNJSk1vNE5iYkp4?=
 =?utf-8?B?dDRsOXc1Y2tZSURkS0g5SmpLSHpUUDU2UmRWTWxxRjNSQXViWkJUdCs1SHNx?=
 =?utf-8?B?SGhtcklTc3lEOE5oZjV3blNNQlVPay9SaUtTRC9FSFl1T3ZOY2N3eWh2eUdl?=
 =?utf-8?B?bDVscG9YOGpGY29zZGRkQ3FvcHhIV29DUzVENUlhbldPNmVVclV6SUJCWDYz?=
 =?utf-8?B?dzA2Slo3TjZBZmF1ZEVXT25TT1J2UHQzZENGWmNmUWxKN1hCbmNkbkRxZ0Zk?=
 =?utf-8?B?K0xUZThNN2xqYUgycVptWm5XSmdmSlg5M25uNzFFck9WQlN1c2F3MGVOL0tr?=
 =?utf-8?B?aldxbHJJMGR4WHBOakhrY3cvbUFMNVpKdVV0SktVZDc4eWZoaVc0NkF3Qm1Q?=
 =?utf-8?B?MWxZNTcxZVNuN09oM2JQOVhBSGFjNlpJZVFKZVZjUC83c1JxRk9oNjFqVWZK?=
 =?utf-8?B?b2xWUVRLOVROclpIRjFQZmF4cGVLQ28rZ2tvNGRWazkvSUhkcG91eHpqSXFh?=
 =?utf-8?B?YmIwWFlNaEdBTDQrQTVWb0MvYm1EQ3lUUnFuNXpoNmRyUkJ4MDlwMTNPdVdq?=
 =?utf-8?Q?n6CFG6sRcmYjf?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d65b53f2-4d8c-4956-edee-08d94b56d13c
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 08:17:30.0886 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BDUHgzUAciZH4pfxv58ykVeC66EsWhSHEjCjLZIm1zXH6ZkibbEVE4HjpIgp0XyE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3998
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
Cc: Anson Jacob <Anson.Jacob@amd.com>, dri-devel@lists.freedesktop.org,
 Hersen Wu <hersenxs.wu@amd.com>, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 20.07.21 um 02:49 schrieb Rodrigo Siqueira:
> DC invokes DC_FPU_START/END in multiple parts of the code; this can
> create a situation where we invoke this FPU operation in a nested way or
> exit too early. For avoiding this situation, this commit adds a
> mechanism where dc_fpu_begin/end manages the access to
> kernel_fpu_begin/end.
>
> Change since V2:
> - Christian: Do not use this_cpu_* between get/put_cpu_ptr().
>
> Change since V1:
> - Use a better variable names
> - Use get_cpu_ptr and put_cpu_ptr to better balance preemption enable
> and disable
>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Anson Jacob <Anson.Jacob@amd.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Hersen Wu <hersenxs.wu@amd.com>
> Cc: Aric Cyr <aric.cyr@amd.com>
> Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> ---
>   .../amd/display/amdgpu_dm/amdgpu_dm_trace.h   | 13 ++++---
>   .../gpu/drm/amd/display/amdgpu_dm/dc_fpu.c    | 36 ++++++++++++++++---
>   drivers/gpu/drm/amd/display/dc/dc_trace.h     |  4 +--
>   3 files changed, 42 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h
> index 230bb12c405e..fdcaea22b456 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h
> @@ -638,23 +638,26 @@ TRACE_EVENT(amdgpu_refresh_rate_track,
>   );
>   
>   TRACE_EVENT(dcn_fpu,
> -	    TP_PROTO(bool begin, const char *function, const int line),
> -	    TP_ARGS(begin, function, line),
> +	    TP_PROTO(bool begin, const char *function, const int line, const int recursion_depth),
> +	    TP_ARGS(begin, function, line, recursion_depth),
>   
>   	    TP_STRUCT__entry(
>   			     __field(bool, begin)
>   			     __field(const char *, function)
>   			     __field(int, line)
> +			     __field(int, recursion_depth)
>   	    ),
>   	    TP_fast_assign(
>   			   __entry->begin = begin;
>   			   __entry->function = function;
>   			   __entry->line = line;
> +			   __entry->recursion_depth = recursion_depth;
>   	    ),
> -	    TP_printk("%s()+%d: %s",
> +	    TP_printk("%s: recursion_depth: %d: %s()+%d:",
> +		      __entry->begin ? "begin" : "end",
> +		      __entry->recursion_depth,
>   		      __entry->function,
> -		      __entry->line,
> -		      __entry->begin ? "begin" : "end"
> +		      __entry->line
>   	    )
>   );
>   
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
> index d5d156a4517e..d0d3e8a34db5 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
> @@ -28,6 +28,19 @@
>   
>   #include <asm/fpu/api.h>
>   
> +/**
> + * DOC: DC FPU manipulation overview
> + *
> + * DC core uses FPU operations in multiple parts of the code, which requires a
> + * more specialized way to manage these areas' entrance. To fulfill this
> + * requirement, we created some wrapper functions that encapsulate
> + * kernel_fpu_begin/end to better fit our need in the display component. In
> + * summary, in this file, you can find functions related to FPU operation
> + * management.
> + */
> +
> +static DEFINE_PER_CPU(int, fpu_recursion_depth);
> +
>   /**
>    * dc_fpu_begin - Enables FPU protection
>    * @function_name: A string containing the function name for debug purposes
> @@ -43,8 +56,16 @@
>    */
>   void dc_fpu_begin(const char *function_name, const int line)
>   {
> -	TRACE_DCN_FPU(true, function_name, line);
> -	kernel_fpu_begin();
> +	int *pcpu;
> +
> +	pcpu = get_cpu_ptr(&fpu_recursion_depth);
> +	*pcpu += 1;
> +

This needs:

#if defined(CONFIG_X86)

> +	if (*pcpu == 1)
> +		kernel_fpu_begin();

#elif defined(CONFIG_PPC64)
....


Should I pick up the patches and help a bit with the non x86 support?

Regards,
Christian.

> +
> +	TRACE_DCN_FPU(true, function_name, line, *pcpu);
> +	put_cpu_ptr(&fpu_recursion_depth);
>   }
>   
>   /**
> @@ -59,6 +80,13 @@ void dc_fpu_begin(const char *function_name, const int line)
>    */
>   void dc_fpu_end(const char *function_name, const int line)
>   {
> -	TRACE_DCN_FPU(false, function_name, line);
> -	kernel_fpu_end();
> +	int *pcpu;
> +
> +	pcpu = get_cpu_ptr(&fpu_recursion_depth);
> +	*pcpu -= 1;
> +	if (*pcpu <= 0)
> +		kernel_fpu_end();
> +
> +	TRACE_DCN_FPU(false, function_name, line, *pcpu);
> +	put_cpu_ptr(&fpu_recursion_depth);
>   }
> diff --git a/drivers/gpu/drm/amd/display/dc/dc_trace.h b/drivers/gpu/drm/amd/display/dc/dc_trace.h
> index d598ba697e45..c711797e5c9e 100644
> --- a/drivers/gpu/drm/amd/display/dc/dc_trace.h
> +++ b/drivers/gpu/drm/amd/display/dc/dc_trace.h
> @@ -38,5 +38,5 @@
>   #define TRACE_DCN_CLOCK_STATE(dcn_clocks) \
>   	trace_amdgpu_dm_dc_clocks_state(dcn_clocks)
>   
> -#define TRACE_DCN_FPU(begin, function, line) \
> -	trace_dcn_fpu(begin, function, line)
> +#define TRACE_DCN_FPU(begin, function, line, ref_count) \
> +	trace_dcn_fpu(begin, function, line, ref_count)

