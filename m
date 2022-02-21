Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32AC24BD6BD
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 08:06:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4152F10F699;
	Mon, 21 Feb 2022 07:06:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2077.outbound.protection.outlook.com [40.107.237.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9AB210F5A3;
 Mon, 21 Feb 2022 07:06:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bkg1r7UDEji6AaS9C/iBTiSiouMNQE28FW20pGPKVxnDSfDHitONht36IC4Apkybl8GNBg4unbsYHg5zUzHHDUvnGVJ8V8nsGxF1VNmLwQGaBnOulJG4n8Ui+72p6y8ry+5Wns5H7vlfIIZfRNfFT1Q1rE2JdzIi/7LrVnhz0Xhk60RxvwS06mFXkNECPgjHiwtf5iKIG2u1LU65aMcwbRpL4ftskB2zq7jIgUIuI1t9pSzsJdABKlbHj77N+nli5uPJaiJIZQ0LjF68PLj34U+hi8W8Ehmz+ElSB9TLkQQPN/YBPM+IoIa18CqtJFmGBkB17pYVuEEhMGfngnAK5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=do3LuX3TJ1/HDGOPfJs/uwaDM7s7NiNEuP0VrVou9us=;
 b=AJkDkt2b/KwRCQgj2NwK4kSLd+FzAzRXKOW8Z6C4Dw7YB3Y1vrIHUsACd33vu9FJSkpiuZp40q0592G0Ng7cqIawyLkSa0q1c9o+z+bBiw9F1qtjNy1abSNC1KkgEBIen3pB8am9GeK0hZ1UOL7yZ3u24JMNle4p4jj5oXz/1nTz6006Ap+qOSP2XtU+CenIw9h2wGYFxwE/7e9ifz7qCl/vhFurjU8VeV9gonpg3XV8klOOqgj09eR+7j4ZwJ9RLmlQhhGOofkVpXkhxa8QzZ4GUA6sOuyYaxFFc4cYmn2cFzGtVyLClRzchx4Vu5CFB0XXtVAGVqT7L4XBrPHl+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=do3LuX3TJ1/HDGOPfJs/uwaDM7s7NiNEuP0VrVou9us=;
 b=LErmcy7QWezbkNUlLGSlH+lXUuNn8xb29wLN3wmJQjWAym5P/B242v9gzgJkvRceG9QGPXIBTo59ziWUTlclgCTsZGnYbTR42SSuqut/zGQtSUa4ZXsC5OT9+ilJB5YiEXwODbC1UVrA+ot8Y+yNr5YBWtDZgKn0Rp5Dwujkevs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BY5PR12MB5557.namprd12.prod.outlook.com (2603:10b6:a03:1d4::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Mon, 21 Feb
 2022 07:06:24 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e03f:901a:be6c:b581]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e03f:901a:be6c:b581%6]) with mapi id 15.20.4995.027; Mon, 21 Feb 2022
 07:06:24 +0000
Message-ID: <bf212dd3-c1d2-b0ea-0107-1f694e9f851e@amd.com>
Date: Mon, 21 Feb 2022 08:06:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/amdgpu: Initialize value of r in amdgpu_fill_buffer()
Content-Language: en-US
To: Souptick Joarder <jrdr.linux@gmail.com>, alexander.deucher@amd.com,
 Xinhui.Pan@amd.com, airlied@linux.ie, daniel@ffwll.ch, nathan@kernel.org,
 desaulniers@google.com, Felix.Kuehling@amd.com, Oak.Zeng@amd.com,
 nirmoy.das@amd.com, jonathan.kim@amd.com, kevin1.wang@amd.com,
 tzimmermann@suse.de, Philip.Yang@amd.com
References: <20220218185312.34464-1-jrdr.linux@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220218185312.34464-1-jrdr.linux@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR05CA0011.eurprd05.prod.outlook.com
 (2603:10a6:20b:2e::24) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ca7b1848-c415-4d4f-fcc1-08d9f508aba1
X-MS-TrafficTypeDiagnostic: BY5PR12MB5557:EE_
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-Microsoft-Antispam-PRVS: <BY5PR12MB5557FCEC46E727ED33E887C2833A9@BY5PR12MB5557.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WY14Q49b/j1J9PkVF3Z6o/h7r9ySCtRZGW4JzKs2JES9Z5rBXJtWBLhrFfP3W9+IvaE5XkeXz8wt7ml8mr0rP3KNAP67z3fITTIedPEOMzeNJe1lTMAXTj+C5kQ2ydkV98zbkmP6Hbhxe6HJxEQQ6aeJbTdoExYxEWtwBnJ7n7ZmRnJfGneS+pw7ifFpGBYXoSnvMI+qpCJHrGidn+C+oLZhSzwI3n0Ki5uJ3O6bgcFAzVmGNfah1q96at5RwbhftM/Y/yJKoh+jjbSNShwjSpbiS87kilcnOyWh3W0C8jw/3p5l7/w8LHobHxvxvsA2nMWbKuTcvBWEZqR43IZO62kl+JWCZBTqIU30HWsv9GezNRW4RSxiv1ZtVpZ0y5udAq992eurAZ+/xFr/vSVWUlgnupGZuV++FH96zxrIRYzSw0sVCpmOx0jjsMT0b64Kiae3XJI9luq1zzKt0Jus5SRI3iaDtdyPLJbz3mqfU4ezzSrcBzj9EI7T2zjJLH/mfbJQIzwUB8RW4ISOljA5dcfg8oT2xnxwT0cPfnfDMCd1hWWsnoe+txQstydnKAekmktiawSzPp6/xL76QHkj7mz+j4o9bu84aywPBryWZ7WhBvmsatTI6n+wwjiTNtzehWUwTj+E2deBJKkqCIgdrN9rPlu+wIOxWmncUXl5pZiG9xnNROaV3kNTIkctk+H6PfYmc9b0Nwu5UxTX/WkpeiN/4bh24tXdUISEPeaCYP2oaDVL60IU7/8mpX554YJ3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(186003)(8676002)(6506007)(66476007)(4326008)(36756003)(66556008)(66946007)(31686004)(38100700002)(6666004)(26005)(7416002)(6486002)(6512007)(508600001)(921005)(5660300002)(316002)(2616005)(31696002)(6636002)(86362001)(83380400001)(2906002)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TThuMVpKcWRyQ0NkMURsL2xranJkd1VuejNhQW1QWCtJN0hSa3FtZUY2aUto?=
 =?utf-8?B?d3JZRlV6Vi9md3RhMXVMMzFIQWxwdm85STFaV1lCbzdoaitMQjc4MFczdk5s?=
 =?utf-8?B?VE5wOVVZZFFPVzZ3dklCcUR5UnVMeTZJVHgwUWFiakk4dTFxYVBIcHJ6eXZV?=
 =?utf-8?B?N3hEYmRDbS9mWUtjQXRDSGRWeU1DQ1doajIyOXlmSjFqdUFYK242V2Y2TmZm?=
 =?utf-8?B?Q1pqZ0VxUmNWNWFWeVRta2Q2cXZ4QkpKNDRHeWloTTJUaFJZSHhuZDVKT3d4?=
 =?utf-8?B?UXhVelFHQXd6blRMeDJXOXJOYkszM0JjVE1NTmgxbmN6Um01L1NobEk1RjNo?=
 =?utf-8?B?T2Nobi9pWmdMSXpYYlV6Y1JTclNIQmZKaUs1akdOdll6Sk1ZN0dtTG5SMGV6?=
 =?utf-8?B?Y245UC9SbWZ0dlNIbmhtSG81bkdnOERVbjk3T2xweEliY3RnU0l2T3A5eFdn?=
 =?utf-8?B?alZTcXNtOVJkV1NkRUluWTkxbmdQMUxsUkp4Rmo2dTM2K2o1TXdldEZoN09R?=
 =?utf-8?B?U3F5Q01DOHFNZWtSWTlZRWg2bVRvUlM4cXowSFBlbmlVSnAxR0tXcnBIYUZV?=
 =?utf-8?B?Z1FFRlVjYkI0MEI1RDhueUlyQjV6blpnK2xTZm5VbmhyZmIyNzM5cjZsNlBX?=
 =?utf-8?B?MjI5V2pYVElrYXplbDY1cEJ1Z0ZWMFJzSTkyZGl6bkRvU1RYNzYxWWMxQVMy?=
 =?utf-8?B?Tzc4cHR0S05QcWZkWGtQb0FYVWIzUGRaN2hqU3Fpd3I1dzdaWjkvUC91NmFl?=
 =?utf-8?B?NjF5a25XbE1JYmVCRnVQbUZNS0FtRDJMTEVWd1VYQVprUU43NUtxb1Vxc1J4?=
 =?utf-8?B?SEN4cFBSa3dKRk1mY0kwMFYxTFBIYWtrSU5zdC9WNXhaRkpNTGhTSVBiK0Fj?=
 =?utf-8?B?QVRyM1RkSVc2VG40VFFVSThnQ3lSbjZGMFBTa3dRTk1DSXhGbjNvdGhLakds?=
 =?utf-8?B?Q0tJOVlMcDg2dFFvZUk0UWR1Y3Q4eGx6ZDRFYUMyYUZua1JGRkpWcEc3YkE1?=
 =?utf-8?B?dlkyYThrN1NPN3lHbTJWZHlESFZEM1FPMUlua2pjZTdCOWpUejUvbUFUUFcz?=
 =?utf-8?B?TXJBWFQvOW9kS0YzalF5b3l2dFAzY2gxaWdUT0ZUV2FWM1VDZzY1MEZwZk9L?=
 =?utf-8?B?SGcyY29raG5kVmt1R05jTm1ZTUVkNzlLcmJ6bU91WFQyMSswNHNqdHc3UkxH?=
 =?utf-8?B?enQwRkEvUElpd09MVDFjK2ppM2lFUkExUWNEMG1mQ0NCVG1uNE9udzBLTmNh?=
 =?utf-8?B?ZXVVeXY3N2NlSmw2Y1ZCMFRpdnNCd2phb3Q1YVlpMlV5dWZ0U296Um4zNVcx?=
 =?utf-8?B?NGQyZFNWSTlZRWJxdk9KN0UxZ0F2bkRybUlUMGxadWkwYmhKb25JUmFCRGdx?=
 =?utf-8?B?aCtNT3RJd1c4cXhRd2xFbUVmd3cyZ0VwUUVhT3N4aEVXUXJMTUdnbTFZM1JD?=
 =?utf-8?B?OHh4QXBvZGJPaGZrSEhWNE9PMEhrMExpUmpsWktRZlZnUjlmRXduOXg3QjE1?=
 =?utf-8?B?MVZ2WkJpQjFPeXl4N3F0K0pUVDhkOFNZRGpXeGp3K2FjS1dnR2dUNzJyY2t2?=
 =?utf-8?B?N1JBcENFaHE3SlNVdzdTUDYxazUxYW8yS1dPZnIxbzVWRDIxZU1GWVdTY1NK?=
 =?utf-8?B?MTEvbE1MR3lBMEdFelRXVEQ3N2t4TnpDSGVIeXBhNTVQSFBUZkVyY1BhanNE?=
 =?utf-8?B?Z1FMN1FXd1hDYzFwcXY5RXY5QldNUm5IZkg0NWhvY1d0WUxOU3NOYVBJRERr?=
 =?utf-8?B?anYvMjZPT2VXZTBIMG1ZZkYxSUZMdHdVMk1WT2hOelRLRWtZWmk5YXAvajAw?=
 =?utf-8?B?RUxMbytQNkR0enVsWFRKaUZiV1Z1dWxCTHl2bXlLWllVVEVhclZIMFlYbkZX?=
 =?utf-8?B?ZHdESld2azFvWENXZ3EyMHh2YVVBVXlCbFBhbXJ0SXBZM3RRNmNlMHBCc3Z4?=
 =?utf-8?B?bThqSXNqK2hrL1AzUFNnQVJwdWJwcFJob1BYTmtSVzJqM2pwSjczZFFUc1JT?=
 =?utf-8?B?QnRiUXRtMkFLbUlFMjNBWXVmY2xxaHMxQlBRY2pjeTRsUU1jZ3EwekVNSC9r?=
 =?utf-8?B?SGkydGY5R3VWeU1QQ0p0Y1EyY2tnTVV2bHl0NjNBZXVFNEQ2RGdMelFKN2JX?=
 =?utf-8?Q?2ImY=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca7b1848-c415-4d4f-fcc1-08d9f508aba1
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2022 07:06:23.9886 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mln2DZKMqd9C8iCGAnLXS9FttDsr6JLpQIKj5BaGKCaNLUS8AfAZr2YPlCQ58WDF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB5557
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
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 18.02.22 um 19:53 schrieb Souptick Joarder:
> From: "Souptick Joarder (HPE)" <jrdr.linux@gmail.com>
>
> Kernel test robot reported warning ->
> drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2129:2: warning: Undefined
> or garbage value returned to caller [clang-analyzer-core.
> uninitialized.UndefReturn]

Good catch, but that fix is usually seen as bad practice.

The warning is a false positive because the code path which would lead 
to returning an undefined value can never happen. There is just no way 
the compiler could know that.

I suggest to better initialize the return value directly before the 
error handling to indicate that when we have reached this point we can 
return success safely.

Regards,
Christian.

>
> Initialize r inside amdgpu_fill_buffer().
>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Souptick Joarder (HPE) <jrdr.linux@gmail.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index 414a22dddc78..5fafb223177f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -2089,7 +2089,7 @@ int amdgpu_fill_buffer(struct amdgpu_bo *bo,
>   	struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
>   	struct dma_fence *fence = NULL;
>   	struct amdgpu_res_cursor dst;
> -	int r;
> +	int r = 0;
>   
>   	if (!adev->mman.buffer_funcs_enabled) {
>   		DRM_ERROR("Trying to clear memory with ring turned off.\n");

