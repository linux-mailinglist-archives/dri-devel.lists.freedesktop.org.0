Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0256DDD11
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 15:59:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB37610E2B3;
	Tue, 11 Apr 2023 13:59:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2048.outbound.protection.outlook.com [40.107.212.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18E9910E2B3;
 Tue, 11 Apr 2023 13:59:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ASFpLqmSOht2HeBeeaLG2Fxftjh2cMeH3Exbgc2dBhfarnVHtoqD+ttfHqtLmh6MW4l6qecVIo7xTmx669Jz2xtUQAwzH1MSTWoq1DPcEg74PMyG8DJg6J+kJLzWePRXsWzBpwK6pmg3YwjEeiteQO+1/1P+wj38zjpsAP9i18mGPkoYwbmjlK2b0s0tNjuKi0NQhjW8RfhkfeMuqahS6uHPPVqyWUlTSa0moDIiEdlCJY+5+vPqJBp6n2nf8hiKvtsp7nm04BiiLgEh87VVwnGDfhRXofeJBkn0fEfPlUvzP23pdi5UyWwLA/UGMj3JD5bQBnVSeBrZHA5Q/TJ0Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/XX3IadskVX6rlJgCDkyY3k0bCPL1gJ1GMIxZCoW3bk=;
 b=N0G7CDuzw5ujl0VN1KUQl6Qw9MP9i0KgIKhIftltYTNNlHlMO6ucpYz8XuH/yAZZr7k7H0QEbt/fjFmwBsOlVda5oZIl30+/ABEclhV+g8Vztw9/H23z+/71HBXilWf7N4Cb01zGTYiRtdo64P5O43jsvDxEt6S0uBKbMe0UjAonVnILoiWjVstWvID4np5DFYgIySZvGtFacZ+C7iirquJ9UBneCm20pT8VTyxyiIXIDK4yyz3XdO9f9ZZo6WxHQcqeNkXMl3ll10vE5zFXaHBxrJBi/XjEH4FKWl21hIB/+3AtnEPNWXlhsT/3aFUMDi4xngOkiW/oLJn0Glyl8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/XX3IadskVX6rlJgCDkyY3k0bCPL1gJ1GMIxZCoW3bk=;
 b=NQq8nomlE8eB1/1hssxH8CU+DbvS3zK4WoznKGDrH1/gy8lwm/xPiJ2+MmgIBtaYnjQJ4iq5GkuN6dYTLxbihohqI5vkBiFU0DXo9LrNMH6tmpi575v9nGe9lWIDIh6yCIwDC5Io1JKhNfvCOOuvYXKT52h6Xpgqmyw+GPg34Ps=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by DM6PR12MB4075.namprd12.prod.outlook.com (2603:10b6:5:21d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Tue, 11 Apr
 2023 13:59:19 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::f170:8d72:ca64:bb26]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::f170:8d72:ca64:bb26%5]) with mapi id 15.20.6277.034; Tue, 11 Apr 2023
 13:59:19 +0000
Message-ID: <c265e914-4ba4-1af8-a504-21dd859f0226@amd.com>
Date: Tue, 11 Apr 2023 09:59:16 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/5] drm/amdgpu: Move a variable assignment behind a null
 pointer check in amdgpu_ras_interrupt_dispatch()
Content-Language: en-US
To: Markus Elfring <Markus.Elfring@web.de>, kernel-janitors@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alan Liu <HaoPing.Liu@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Alex Hung <alex.hung@amd.com>, Alexey Kodanev <aleksei.kodanev@bell-sw.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Candice Li <candice.li@amd.com>, Charlene Liu <charlene.liu@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 David Tadokoro <davidbtadokoro@usp.br>, Eryk Brol <eryk.brol@amd.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>, hersen wu <hersenxs.wu@amd.com>,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, Jun Lei <jun.lei@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Mikita Lipski <mikita.lipski@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Stanley Yang <Stanley.Yang@amd.com>, Tao Zhou <tao.zhou1@amd.com>,
 Tom Rix <trix@redhat.com>, Victor Zhao <Victor.Zhao@amd.com>,
 Wayne Lin <Wayne.Lin@amd.com>, Wenjing Liu <wenjing.liu@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, YiPeng Chai <YiPeng.Chai@amd.com>,
 Zhan Liu <zhan.liu@amd.com>
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de>
 <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
 <2258ce64-2a14-6778-8319-b342b06a1f33@web.de>
 <0d4b92ab-f7c2-4f18-f3c3-c0f82ba47fc8@web.de>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <0d4b92ab-f7c2-4f18-f3c3-c0f82ba47fc8@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4P288CA0015.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d4::15) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|DM6PR12MB4075:EE_
X-MS-Office365-Filtering-Correlation-Id: 75f42b95-04c6-464f-186e-08db3a94f19d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4dYSFSsUxDf4Xj3j+OtAN93ClZ8pDoSIizUpRx/csEqtB7myh17+N/UIrYPSjO/M4nv6RIsvofLeZAzUImZ1oqtB+j54mO09td4kHiq5iGZ1OkeriTfBRPlWTVaNtWKvBj+jT+KNBBtmptXYwoHw07GEJEEh1kmZQGeqf3+pIhY7+AXWsPCZ+EiFk6dfTmgHaIC8+k/yGhQCaHKGvDGv08xvnCsshSrFUwRlNmdGK8oOJAD9XWVZJA4suqV1+YqNf/vUKWqhwcTBvc2IkZvfE9i/rMxhclqTmbF6hAd7xR3unVq2/niOpFaw2XEUQOdJVT7q+/5Lj/QU4Vh/cjxCKjjs52mVJaX5bP+HToGfkc4hNvN4ul5ZkeDjHdEcoOs/3BN9ACS90yy1txm8cf2efj4Ke1z26+JToh5NIgiasCyJMhq0KFfJIiIfviwEbpNrDk2/Tv9und9NAp3+cvXO8fvpEOHDJ/o8h2I2q0WAxop/gwl2343lT8f9fQXjrwZAGhsi2PpB3SRKsfkkaRb5edZ/IpFWLcpotQ5vRPvttc8t7OG5n0P45KwYp08Wo3qesc5buvCer683lspiemlBEo9r5l9f1CyJOkwK5psmNmLY6Nkshik3MByyX3l9i473LP4ECpba6i7uRh15MDg1gvjTDLzMxYShj8gOdC5yw70=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(376002)(366004)(136003)(39860400002)(396003)(451199021)(36756003)(31696002)(86362001)(41300700001)(110136005)(316002)(478600001)(6486002)(6636002)(4326008)(66556008)(66946007)(8676002)(66476007)(5660300002)(7416002)(2906002)(44832011)(8936002)(921005)(38100700002)(186003)(6666004)(26005)(6512007)(6506007)(2616005)(83380400001)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y3A5cGNUbUtWT1FrNUtlOXlqd2toNkUrRFNJSExiVlQzbzVjcXV3TXVZRVNx?=
 =?utf-8?B?NVdSc0xZK3JEQlJnTVBROEEyVzMxMWhoZ1dmNVRuc2J4NExuR2Y3UEJHM0Vn?=
 =?utf-8?B?d2lzUjJjME82bTlKQk8veXgxUUl1Uy9nVnd2WWRyWHREWVRQY3NWY2tsN3o3?=
 =?utf-8?B?eFExNDJFUUQ0UVZVSFhsR2VwYVZ1eW1mOW1LUEd4TjUrSlU4VlRKdUYvUmR4?=
 =?utf-8?B?dGFsejlLK1A0RlBud0MwZ0JTQ1ZHNWdCQTk1cFB3VFlteVdFNENUSUVLSUgx?=
 =?utf-8?B?KzlGN3E4NGFwWWJjR2pqZVlqQURlZnVHa2IvRFpDS3FyTjhKelN3aDYxRldh?=
 =?utf-8?B?dU9oVGlWdHNjQ1diRjhPQXhnVlp4dHpBK21FOUF1dHNOVFltS09tVnBWZDEv?=
 =?utf-8?B?YXczLzlBa2p2KzUvNjBBSStpdmNqUkV3ZUc3T3NGc3ZCYTR5VFR4QlZyYzVr?=
 =?utf-8?B?QUlPVTJ2VmUzemhQQXZWMHo1SWFvRHZlYlB3TDBOQ3hvc0NUUVJyUEMwVGQ0?=
 =?utf-8?B?cTVpSFhjTHkxNDdWRHpWdExzQWtKanV4TUgwWHU5L0gwcm55dnFVSjExYnpr?=
 =?utf-8?B?NlpUSXZQamVyc1F2UVFjSjNUZUVLSE9DbXZGOTlqZjl1cjg4NHJ2UGV5S0xm?=
 =?utf-8?B?SlJUUG9qZ0dNa1JEWS9RaHZKVll4c1drUXFwWTJXZFZ6aVBTeEozeGhESCtl?=
 =?utf-8?B?QlplNE9wL3VYUjdacHdTL1Y3clpJRHorZ3c2YUYrSGVjWDdBUDRORFdnQVhT?=
 =?utf-8?B?Sk1FREJNdWZlYVdZRUdJN0Y1OGpJK0VXNGgzYWxKN2V6L0lySTgwQWFPUHp4?=
 =?utf-8?B?dnFWNVZ5WHYvRU1qRk5remxsWnhmc0hZcWJ2cit5RTdlV1dVNXJKWDR6ZVU3?=
 =?utf-8?B?S2FXak9MNkFJd1k2V3hjRzBka0VITllISmlnRGc1MzdUeVVodEZvV3MrSlFV?=
 =?utf-8?B?YlJZY2Z5WFRCZlRQTjBiRDVNVGRkdDBUck1zdW00NWZJZncxOVc2R0lkZEo4?=
 =?utf-8?B?S3lZSzY5STByeEIzanZnRlEvaWRVQmtLR0Z5RHFhSmdJc29CQWNZT2V4bDZF?=
 =?utf-8?B?V1ZPejhxZzFsU2NvYXpMbEoxbkk0VU1BbEhtOUZIQjQyOUN1UURHZlNiUEV3?=
 =?utf-8?B?dlBxSUp5a3VxU0g1dVU5Wld6ZEZ2NC9ZSnJ0ZzNuUGpleWZ5QVh2SjY3WTFR?=
 =?utf-8?B?L2c5K1RMcTlSengwYk4wTWVNTUJCS2FseXJLSityZ1NzZnJIRUdhRDZodnpw?=
 =?utf-8?B?RUlaQUl3dTI3dHczdXg5amVkS3lQeEt5WldMejRtb25NYWhzTWo0dVhielhi?=
 =?utf-8?B?VUlLMFFPMTdkTm1RdWxRVU9NYzY5V1NYcFI5aXhBUjNRVVRZVUZWWm9NN3Zs?=
 =?utf-8?B?K3lpWk9sNFZVaEFHcUFuK3dsOTZLdk4zL1hyOHloYzcrVTR1ODNFSUMyZVBx?=
 =?utf-8?B?SWkrM0pBTFBXdjhpczhCVjMvWjlTSVI3SGJGN0UycUpObmJpcWZ1YnZxaWp2?=
 =?utf-8?B?NHNESE9pcWhSYmZqMGVVeVBOcWZjNjhNbk0yZnQ0ZDZtQ3p1MXc5dmUxckxW?=
 =?utf-8?B?WWJaKzdDSXl1MlhwWXBPSm5jb293dVBObUEwUlBXZWxEOUprZUxZOGN0b1pv?=
 =?utf-8?B?M3JDNm0wZUFpTWxRZzM0MHZuRWF6dWswamZ5Y0FNaEpHTTBudUZRZXVDOXN3?=
 =?utf-8?B?MTFhNmU3RHNWR2JjcHFBRXpOU3cvNFcwZmwvNWZxMktyeWg3djFONW93eldJ?=
 =?utf-8?B?VW9aV2JEakZZRDJIc3hzajZmWUlZcDhlNklOZ1NjdjJiUURZaEFGdE9oVUJ4?=
 =?utf-8?B?UUdwR24zOTFEWWQ0amJUUXh1N3ZtQTJWTFFYQnY3dGRib0hsbk5lNXlVVVlq?=
 =?utf-8?B?QzRYOTJ0RVg1SDdwZWFrZmRTclVrUTJJUUdTRDJqOTI0K05UaHhCVjhMaWZ3?=
 =?utf-8?B?YkJNSlJYWXhtcXFkQjJwaFN1Z2JORnE5cWhDY28wUTc2aFBHZUF4SDdOUG9B?=
 =?utf-8?B?eDgzUmNrSlJNTjVkaVFoZGV2ZklpR3MxMTZQZVpzZ0tobFhnTFdMdjh6ZzFw?=
 =?utf-8?B?bys5V1E1S1hqMkhXRGlvVHhyWnJlSTlzOVAyZkxlazZjb2J2SDdSQXZiMXdS?=
 =?utf-8?Q?WDGIp6cqnwpv4ONmJJa6yYPNU?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75f42b95-04c6-464f-186e-08db3a94f19d
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2023 13:59:18.8865 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hb3X7szGtJac5soYjJDYvbSPUvEtWKD209kWTMMYBBxk5cPPwpQxUO/7jOepesJVqaynhjU7obk/L7KinIdNtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4075
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
Cc: LKML <linux-kernel@vger.kernel.org>, cocci@inria.fr
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 2023-04-11 um 09:42 schrieb Markus Elfring:
> Date: Tue, 11 Apr 2023 10:52:48 +0200
>
> The address of a data structure member was determined before
> a corresponding null pointer check in the implementation of
> the function “amdgpu_ras_interrupt_dispatch”.
>
> Thus avoid the risk for undefined behaviour by moving the assignment
> for the variable “data” behind the null pointer check.
>
> This issue was detected by using the Coccinelle software.
>
> Fixes: c030f2e4166c3f5597c7e7a70bcd9ab383695de4 ("drm/amdgpu: add amdgpu_ras.c to support ras (v2)")
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
> index 4069bce9479f..a920c7888d07 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
> @@ -1730,11 +1730,12 @@ int amdgpu_ras_interrupt_dispatch(struct amdgpu_device *adev,
>   		struct ras_dispatch_if *info)
>   {
>   	struct ras_manager *obj = amdgpu_ras_find_obj(adev, &info->head);
> -	struct ras_ih_data *data = &obj->ih_data;
> +	struct ras_ih_data *data;
I'm curious, this only takes the address of obj->ih_data. It doesn't 
dereference the pointer until after the !obj check below. How is this 
undefined behaviour? Is this about the compiler being free to reorder 
stuff for optimization, unaware of the dependency? Is there a link to an 
explanation that could be added to the commit description?

Thanks,
   Felix


>
>   	if (!obj)
>   		return -EINVAL;
>
> +	data = &obj->ih_data;
>   	if (data->inuse == 0)
>   		return 0;
>
> --
> 2.40.0
>
