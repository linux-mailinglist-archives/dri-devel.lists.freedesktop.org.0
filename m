Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89ADC8548EA
	for <lists+dri-devel@lfdr.de>; Wed, 14 Feb 2024 13:09:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CA6A10E10F;
	Wed, 14 Feb 2024 12:09:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="KoX0BjQA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2047.outbound.protection.outlook.com [40.107.94.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B609A10E10F;
 Wed, 14 Feb 2024 12:09:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tr/W5ssMuhBk6ZrB0HMm5N640ucYIWl1L8SspMVizd4qW00uiJ5zM8p9kk+uOlNidQkGtDyD2+dYc5Pzd3njpJU3iBLlKfmRc+ENiRGXLmYghb1t7sCBIOD2obh1w+KKQDgAPYoSYhjL8Ev3O/EqQistE6NNxUuJo7q65x2n98WYTwhNtptBZqLUIoEmZAQg+4YNW4pokS3NTohE0MB05kGPK0nx3U63/3O3MFoPkyPIP14dY+dVwQV7TlWhP5pY95XW+ams6i+OK19zeeUVNqiFmTC/XnC69p7QYsHdpA78k7qiHU11DOXZfyS/tAp161+QjYt4GMfnWAyu+0PDGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9LiUkhC99HGLYqj7C3Ot8p3BppqAQaUbXMOX5wV+vkw=;
 b=PiYK2G0hk0cJ4Mv1CYyvfVY9GopJF5bzwfcGekxJqSYY+VuEl8LCokBjyMyMUdvJhRftjqSRk6G/ZjQq8fpY55msdz8GNi6lKGKMZcbD4gFbw3otxEK89Vn4Hb8V30L7rCA9Lv6uDlpfJ53HrWVVP2aGXU65QZeLv62r70TsyOJ/pKiM3ZWy89BgGrUgLnFvzOaXitPd0J+XGQF1fPE1bK6CimRy5mPQ34czj5A0cfTJz7fUV7an36Uqcc68wCFDgEQFpajWqsEzRHUM7SIL6/DaMvLlWTuxbBXHlXLZ2mUK7xJh2uvmhJqOiwxTH7SgrZskfGxNdks8AAFdgpKOJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9LiUkhC99HGLYqj7C3Ot8p3BppqAQaUbXMOX5wV+vkw=;
 b=KoX0BjQANfqe3xvl0/I0PGps+5T65bnC9VwOdlFGhV7mDeDd1D7XovYq45gyR4hZAyYggbE8AlcgHl5dSjB9rnwu3u6YELv8X5VN5RB+6LcUFGmguJQlAFvXmTHL7/+POgR+dteZc0NUET/i4suuTdWx/Q0VhZger6AYBIIsDvg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN0PR12MB6247.namprd12.prod.outlook.com (2603:10b6:208:3c1::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.25; Wed, 14 Feb
 2024 12:09:23 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653%4]) with mapi id 15.20.7292.022; Wed, 14 Feb 2024
 12:09:22 +0000
Message-ID: <2a6a473a-3e87-4838-83eb-400bde712e91@amd.com>
Date: Wed, 14 Feb 2024 13:09:16 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] drm/amdgpu: add a amdgpu_cs_ioctl2 event
Content-Language: en-US
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Gustavo Padovan
 <gustavo@padovan.org>, Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, Alex Deucher
 <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org
References: <20240117184329.479554-1-pierre-eric.pelloux-prayer@amd.com>
 <20240213155112.156537-1-pierre-eric.pelloux-prayer@amd.com>
 <20240213155112.156537-6-pierre-eric.pelloux-prayer@amd.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240213155112.156537-6-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0102.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cb::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN0PR12MB6247:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fdbea89-0185-4e80-373e-08dc2d55c7cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Dem5JpcRRs29EHswFjDPS0odScyERjw+8dRS4OI8Swf9M7Wi6DGr8uGMc3V5jgytJr4qKrAyLUVoXWnZdjnXXIgmbd0rwJEfgB7KApvGfQYUeKkrI+tOHP255hIcYaYr1UPHYpDff0XgqcoE/gBK7Eq39QjHDevsuh3iilGkgNeyNPV2mys1kuDvZzdaRxJORpHrAgydwUDy3PJjFkBxTOKY6Paem/r4MdQVQjgGEzH3uf5gGAVzNidbuSVpn9ZuZR8ueKgQcNjYx1N6F3dEMJPk/JU1Bv7TtD75/d1QkMGvuYTcmYBOLU7X2ZukW+2Yj9CaI2tCgsQBDFe0/0pkkF0+OkIraNl0yXzZ/lvIs+BIab5SoeHucixPLDnxHTxDATxSiTP39yxfuefcgYGjNsi4679NKMnEcer0+hRyj1xBHXsr8ua0T8rn3cSPRE6w7nk1KxHBOKtY63Xgb2hZuFJZKV3ZDSPH7/mor205neN3C6kkqVlWdmB26nxWjjekeZDvwVbGC0NUYLSiQ+NkukXka7EwNTsB6Qk6dzbtgG7ak4McufhVZmAi8NbOYj7hguV3S1ZsbDRpLj2bOTuWw2sT+HuT1CnjmeZkEDpysbk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(366004)(376002)(136003)(396003)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(86362001)(31696002)(110136005)(316002)(6506007)(38100700002)(6486002)(478600001)(26005)(2616005)(66946007)(66476007)(6666004)(66556008)(6512007)(921011)(36756003)(31686004)(2906002)(8936002)(5660300002)(41300700001)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c2RnQ0s2anRvM05sdWI3ZDNJcWVQUWJoLzNKa0hWaFZKUG1sSDFjK1NGQWZh?=
 =?utf-8?B?Y1ZmYk95cGVRUERJSDNVd0EvTEhWb1ZUY2pWdUI3clZwS1VucmNnbTV0RHc2?=
 =?utf-8?B?ZFprOE5MTjVMTm9BSGhvcUxXalE4WTRRWGNFUERrQnBObXZkbzJFZzIyd2xV?=
 =?utf-8?B?dUhZQlF5WFNkTEI1Zzd6MVNsSm0xbXpBS2kzLzdhQmx4VTBLS2ptOW1ncktN?=
 =?utf-8?B?UWxmUTBxQml1b05SS25BckNTaklUR1hRdzllMGQzR2RJZUFkV1NIRk1GRGxZ?=
 =?utf-8?B?WnNkdTlwclovNmsvZzVac2lvcEhIVVVwcE1lWXdBWFIyUGdQbEYvdGdsM1dG?=
 =?utf-8?B?dTBmbEVIcE80M21LRlJ0b0lLUTNuVS9LcmxoQ2FGQS9RYW9PWEk4Q3lwZTNt?=
 =?utf-8?B?bVIvakZ0Qk1wREc0akJBY0dCVVY4dWtuY1YzNFVOQmQ3VWFzT09yVjI4VTV2?=
 =?utf-8?B?WFJBS3h1b0RhSmVjVXdpV2xpbTVyMmtnUDRadktLV1hFckhZc0YybytEMXl5?=
 =?utf-8?B?V24zaTJtNTVYd3lZLzVBTldCVmU3VWZvbUlWdmpWNXRVNFJrZDkvMWZXaHZP?=
 =?utf-8?B?ekpkWFhKUzdwOEZOcUlabVpBcXhrMWxERmJHYWg0SWlzQkNFUjdVbGhIUE9O?=
 =?utf-8?B?UFBQVlNsdUduY3VUVWUrRnVBRzFOWVN2M1MyUEZjZlFaU1FROThPRHk2Tml6?=
 =?utf-8?B?K01BblV3c0ZYOFhCWFRTZ2ZycWJKYlZiTVc5QVRyaVQxZmpvbHlmMjlBL1Fk?=
 =?utf-8?B?blkybEQrVU1PdU1HZkFLSlpRWTlzM2NUdmxFOUs5VjBHU2UybXdjQXR2TlF5?=
 =?utf-8?B?YnF6T2svT0E4aUh5Y2ZHNGxwb1FuTkl3MGs3RUFOck5mZmY2NzBJbW5lbVBh?=
 =?utf-8?B?WG83dUVYeFdqQm1aWmVsZ0UyUC9taWVZK3dGZUpucWEwaDFzaFBLWFRLTElD?=
 =?utf-8?B?SGhORmFRRmROeHE5cDFKVkkwemtnZHR4K1h2cWxEWWxpKzZRV3ErOFBSaktl?=
 =?utf-8?B?Z2lCTWpzVHV1MmdKbkxvTk1KQWh6VXVUcGpTWktPU255YzRhNEFDdjN5NjJG?=
 =?utf-8?B?ZGVBK013a3IybG8ycDN0RHhDSlUxeElva1VaSEkyWU5EQ1VQOWc0d25WdWUr?=
 =?utf-8?B?M2ZiR3phUGhJY0VPMGdOTkhNNDhZS2ROYXpocmRNTFRrV0FtTHlOaHZFUXRZ?=
 =?utf-8?B?U3ZZVXFpaWRWL0p3L3FoK0pCRjE0YkdDU0hyL3BlTzNIQkRaSnk0bzc1WWF2?=
 =?utf-8?B?Q202QXpva1c4YVNkSEx3cUpWc2FRelNkTHpndTVXaFdaaHNFUmZsTEJBT05W?=
 =?utf-8?B?alYwT2F6a2theFczWlFZSlZLeXd5NkxjN0d4MjMrVlNKRlJLdWM4Z2JuNnZy?=
 =?utf-8?B?aGIrTnZUMTJBNDh2alpOQ3FZZkJDTU4yY1RqTFFucVgzV3JoSHNpS1BUNGxZ?=
 =?utf-8?B?ZUJVUVI2bE1UeTNYTUZvdlJCbVNHcUZQQXhiS2lvWVo2R0dwYlBCQVdXSHNt?=
 =?utf-8?B?ZzdIWXhYZDJVS0l5bkJ3UXBQMkhKdVFuQjBEMnBIaGsxRGUyMnNpOXhYWXpH?=
 =?utf-8?B?STk1M1pJSmlWWStvL293RFBONTAvbmZ1OCttemxydnZaSW55RXhnR1ppWWZW?=
 =?utf-8?B?VFBhSy9DM3psUWdhVnFuT3lZNlFmYTNTT3lkSWtsQlFSRHpPTDZQakI0YnY3?=
 =?utf-8?B?TnJ3b21GbjhNWERvVjNFcldKWEpLYVM2aU1nZWtuanBscnRjTnhrL1Z0YzdS?=
 =?utf-8?B?bjJLWjM5NU1rbGFUQVlybG5lY2VsbmlFVHFyYTluVnJtNDNhaFlhOGJiQmYw?=
 =?utf-8?B?RWJYT2VOa2VZem1sTHZueVpOZ0J5Sm5aMEZzbWNxZGczRGtTUzVqRDNZaTVU?=
 =?utf-8?B?eDk1ODZmUGlaSGZpeENsaFhvQjVTQlhvUXora3FrSFM0anRaTTVpaEFjUy9y?=
 =?utf-8?B?OXM4ellwSkFUa3FhQ21FSHQwWVhJWDVMNHNOWkNLUUlzdVdMYmZ5enJ2WXZp?=
 =?utf-8?B?ZWZFd2VKb0p5V1g0QTNpbVkxRlZBNjQxVkJKNnIxZWhmRWxUQTREaVZoN3pK?=
 =?utf-8?B?WlJiZFlwUS9lRCtYdXJjRjZzamtjSDZBV0FFdEFrV1REVDRJVnJlOGhOaDJH?=
 =?utf-8?Q?z78r+qMpnrNpQ46cCkCqGYOfr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fdbea89-0185-4e80-373e-08dc2d55c7cb
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2024 12:09:22.8424 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VA0hR3O5HJ3N2aXap197ycAvdOfOHIDOAcyPXIRHEx7QJ5ShSXxsEGuUZm4/6DdG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6247
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

Am 13.02.24 um 16:50 schrieb Pierre-Eric Pelloux-Prayer:
> amdgpu_cs_ioctl already exists but serves a different
> purpose.
>
> amdgpu_cs_ioctl2 marks the beginning of the kernel processing of
> the ioctl which is useful for tools to map which events belong to
> the same submission (without this, the first event would be the
> amdgpu_bo_set_list ones).

That's not necessary a good justification for the naming. What exactly 
was the original trace_amdgpu_cs_ioctl() doing?

Regards,
Christian.

>
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c    |  2 ++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h | 12 ++++++++++++
>   2 files changed, 14 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> index 6830892383c3..29e43a66d0d6 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> @@ -1402,6 +1402,8 @@ int amdgpu_cs_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
>   		return r;
>   	}
>   
> +	trace_amdgpu_cs_ioctl2(data);
> +
>   	r = amdgpu_cs_pass1(&parser, data);
>   	if (r)
>   		goto error_fini;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
> index e8ea1cfe7027..24e95560ede5 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
> @@ -189,6 +189,18 @@ TRACE_EVENT(amdgpu_cs_ioctl,
>   		      __entry->seqno, __get_str(ring), __entry->num_ibs)
>   );
>   
> +TRACE_EVENT(amdgpu_cs_ioctl2,
> +	    TP_PROTO(union drm_amdgpu_cs *cs),
> +	    TP_ARGS(cs),
> +	    TP_STRUCT__entry(
> +			     __field(uint32_t, ctx_id)
> +	    ),
> +	    TP_fast_assign(
> +			   __entry->ctx_id = cs->in.ctx_id;
> +	    ),
> +	    TP_printk("context=%u", __entry->ctx_id)
> +);
> +
>   TRACE_EVENT(amdgpu_sched_run_job,
>   	    TP_PROTO(struct amdgpu_job *job),
>   	    TP_ARGS(job),

