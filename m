Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8753B5B3E01
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 19:33:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A421710E0E7;
	Fri,  9 Sep 2022 17:33:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2057.outbound.protection.outlook.com [40.107.220.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A62D10E0E7
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Sep 2022 17:32:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ei4akZUCkSOMnopBqy8cJnwJLaw3IFIzTdgJKRLra1rLh2LwL7pVM+PvSLgyDRfITQoMTXEpAR/BEYCSW6/umjM1L7QClwgUa+IiuZT+L0nxyxzac/On0sT1NDpl58b8Mo/VC5Wa326C0uLB7uOg9K565MANO/rhX/mqqqqeUngClWg40M1NCTCD68cTcPey8briwPpQpaB8JIpU4hYCR/fAZwwCw9AT7zO0De5Verw9Lkw79qLH1Oc8KI1B2DZ4pqfWsyobjW6yakw6wf7Vd9lpo19AnddLBZaGCZSfuqV2kELiBL8Hy1dJXxSyl9zH2mqCp8/7c2Jj5t34Ov622A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GGXpud9UCNw3G7+HiXOSZncEj92fpilV7WnD5W5XGZw=;
 b=VMentbY/WWdNIDf4VsK55rLideSXaMnGL2Py4fiN2eGC0sXulgsXAGyuPS5/rRkEsvXeyDPUjyPEDNIr9XRZqR1OV/suCdkG6iNUtUO7VhNQsGgCB0vJFkop+wCmOsKBDIsRjpJ1an0yVzcSUM/UsZrzNov0SzGXAo2HnBlTWZqBwMR9tWtIfEVasrCvprLSNcNe0afzpH9Zo9V7yo9bIm1ybA6NqSCD62yD6v/loHE7Bcxf2YS5+s78RPYsX7ISl2N5AKU+DPvNHr12XIkklU15ovVyOxSc2iMugaoYxYcnJTs/9fjqwJZjSXFb1KlKEBmOV2vEg7yBFqkzm+Lt8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GGXpud9UCNw3G7+HiXOSZncEj92fpilV7WnD5W5XGZw=;
 b=krGxL0zMt4JfiGQ7WXx+CjbgHnn9bHW2tlisNk6TGUqVlhzon7B/78hHdL1J1Sssf/qmjYe4D48e8K4v5NzjxNK2y6r74YHkpUthY+tREhzWATxxNHaTwiOVESJTCs8jFn2nlWBFTR/hZegSN3jTf0EzpMxlXFjsbCOhsdVFPrQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by MN2PR12MB4375.namprd12.prod.outlook.com (2603:10b6:208:24f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.20; Fri, 9 Sep
 2022 17:32:53 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::80ca:c97:d395:1acf]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::80ca:c97:d395:1acf%6]) with mapi id 15.20.5612.016; Fri, 9 Sep 2022
 17:32:53 +0000
Message-ID: <2937dc45-0b62-7c71-b846-942fa91cbb4e@amd.com>
Date: Fri, 9 Sep 2022 13:32:51 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 5/6] drm/sched: Use parent fence instead of finished
Content-Language: en-US
To: Arvind Yadav <Arvind.Yadav@amd.com>, Christian.Koenig@amd.com,
 shashank.sharma@amd.com, amaranath.somalapuram@amd.com,
 Arunpravin.PaneerSelvam@amd.com, sumit.semwal@linaro.org,
 gustavo@padovan.org, airlied@linux.ie, daniel@ffwll.ch,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
References: <20220909170845.4946-1-Arvind.Yadav@amd.com>
 <20220909170845.4946-6-Arvind.Yadav@amd.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
In-Reply-To: <20220909170845.4946-6-Arvind.Yadav@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT1PR01CA0059.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::28) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR12MB1947:EE_|MN2PR12MB4375:EE_
X-MS-Office365-Filtering-Correlation-Id: 61905350-805d-4f56-bc69-08da92895398
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p6diCgmJCOBNpO4+ed2ZNyh6JZ0WthnDBinATnhuZ7OmHyfIYK9HBj7AU2Bh77u94ia414y47xgb66k6uWYYN1KpuNGyd1BaLkQXplE5IHqBps6fNl2YFNAZmdTHcF+wa+EKd/jIgm5NtZJUmTyZEYsLI6t2s7kzE2YTOY/1V5bzludvjIk8S16oUPkWvmwuSmFk0lpzp2VMeWzJsW0ZD93IGS6jlUVXFjakkEV2FJOuXpWuMtSnfnxwWC0SkLjpA/b1dcMfzwA2zgiMmfL5t4AZfKQlce/LC8eEXQm5ZEhfKWroGtqIq11f0wfP8DMRx3QKjuyaBvjm6MPUEZJFwJ6kwCBGSM/78r4kzLmmKzUssjUh6kmek5+Wtf7WyX7UVG4BriyD2/uH0PPGmLe5DTjejYOTZ6Ydt1ywhnh6XMd0Y0QxWX3jUTohxc4oCJp0KE6xwiThxi6fRwtKGHpZYy62RxY99G3sO+Z11eOXbePmG9NP5XiFc/2yG31K79ivcVvv4OMOAwEFXjOpLUf2bdxCoof8w9JVV4zyw+u3HNxezQJppL92w+sAI3F1EHZJPWTGM67yWURnyGxQeoOk3nMM5qyPZlN8iYsK4AUq2iur9+oDtpTOUh6ixAW/IVuxYGZ+gxh1K6suZGI4UEQlau1bEeD2lZPJZlz/ZLlY6Gwrqw6bjSNKlr5DbYyMvvtLyal2/9dZrMrcjAxTfuEDGoeTE2E6XyBuVFo+FUe+oGizLf8ToUAWkP1Y2jhGM9mV+FE6jLfLtz/n6AvxewT3xrW+iYyJc4YqJbQdvZldzcIsnl+wOVCXM/S4c9JcZ7y2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(346002)(376002)(39860400002)(136003)(366004)(31696002)(5660300002)(66556008)(66476007)(31686004)(38100700002)(86362001)(921005)(83380400001)(2616005)(186003)(53546011)(6506007)(6486002)(6512007)(41300700001)(478600001)(8936002)(36756003)(66946007)(316002)(44832011)(8676002)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RlloTjgrS25NRnNOOVFDMWdtUjM5SG1PS1A2L2w0WWN0UHVpVlVDKzlIZWZz?=
 =?utf-8?B?UGlrWXlWWGlUbnhpSGhuMU1YQ0paV1pVYXNQUkluWDJNUEk5elFYT2tZNG9E?=
 =?utf-8?B?RlNxQjlOVlIyNTBReDZCS1lYb05HcHBEbjl1UFZTZFFqYWJENlRiMEZvVGp3?=
 =?utf-8?B?MkU4MkRCUHR1aWw0aCtteXNvS1VLMXIvVXArZVFicHJMNTRhYTYvdTZOSkda?=
 =?utf-8?B?YWxZWktJR3Z1NTJSeDBPMVBUNXptUFJDY1BzVzVkYVdFUG0wRE5xRHdCb3F2?=
 =?utf-8?B?TUVvbkljZ3d3cE9iRzkrSGwrNGhvYksrQnpMTFVJYW4zMlJQbDFucys2N2hX?=
 =?utf-8?B?UEIxOVVEc0NDSlF6WFZmVEh0MnJidXRHSnh3UVNOVTd6Vms1YmVVZnp3NEVF?=
 =?utf-8?B?U1lZQ1MyQklicDFWLzdFK2k1bTJEZUtVbFlxQWtVcmdMRGtzODM2eWtvVFZ2?=
 =?utf-8?B?blkzSXVvTVo4bVBCOU9paUV5SDlabFJCOGNGT2RFNXFMa3V0TUsyTE16MDRl?=
 =?utf-8?B?WTh3RUR5RFVPMXZsZ0JXelgxOGVUQmhGZW1DbUROYW5HcEgrRVFmVzV5SHA1?=
 =?utf-8?B?T0V1RmpzTVNhV253d1R5QU43QkRHTUsvNitCTDltSTVmUExQU3NyN0NjZ0tJ?=
 =?utf-8?B?QWpOQlVhODRkMmNheXBQSGpWajk5TisreGl0ZGNKWVBIa0c0bnhLQzFzdkhz?=
 =?utf-8?B?WXEydlR1VzBTWFBndFluRkg3TkVIcFZscStsQ09CMDlzdElQTlBIS0hISys2?=
 =?utf-8?B?ZjVJRHkvdlNVU0R4NjNlY1UwZVlTRCt3UlU0YlIrNkdxbmNVYStmc0c5dnFR?=
 =?utf-8?B?QytHY3VicWFqUjVXa3NNZ3RPV1RVUlFQaXU2TFZEUTN2VFY3RkxlWjVJOHN4?=
 =?utf-8?B?byt0Q2FsbW5GQVNsQlJKdC9VRm10bjg2NWo4V0tYTEswR2EvUkFVNlRLaWdY?=
 =?utf-8?B?RHpJNU5qZVF3WWNVb0tDRFNmV00yUEtRb3psYzRrRDE5Y3UzN1J1Ry91SkRL?=
 =?utf-8?B?OUZVQXlRSVJvd0x6dDhDSE9hTGdlNlgrZkx0cVM4K3psSmdCc3hhb3hkcHM4?=
 =?utf-8?B?RlVTTTRyZjh5TU1tcUh4U1hRbWRMOXhrSW1mV2lmRzYzdnUrZ3d3b2Z4anAr?=
 =?utf-8?B?NE1CbXhTaXFDTERnSG9yUUVuVzRmTC9SdFovUWNTeHZQNXQrSFQ0R0NVS3hn?=
 =?utf-8?B?aFRTMUVtK0svQzkyKzh6WHRhYmZMMnVQTUVPUy9lT0lWMjBvRDM4bFMyRTJ5?=
 =?utf-8?B?WlRyVVFvd21KVzhSc2N6bHNnelA1c2lYM3dFTDMvTHlIb0VUb3U1TzVGODkx?=
 =?utf-8?B?TE1JODNtL0lFNGlsWEFJZE1jUk9uMEloZi92M3dqayt2MEc3aE8vaVJ6WmRX?=
 =?utf-8?B?WjZvYW1IeFhXdVMvUFQrRGRZZHZFU0dWS2p2dDVzR0NENm9CcndHdlpPNHBh?=
 =?utf-8?B?Y29HdkF0SlNZZEZ2U3VPcExBOExDMHlzV0NqdnlNNTBjYzErVVc2Q3J1NU84?=
 =?utf-8?B?OXQ5aDhKaFVveG5IaHpYZ1gvUE1CQnp1TjE4SVF6Z1UvNjk0Q0dxVkZaMmJD?=
 =?utf-8?B?RmlhMkpaeFBNOHAzdnlJT3hhYzZ0YTBYSnZ5WE5MNG1nU043TkR5YWxzSzRu?=
 =?utf-8?B?eEszMGJrWnZ0LzFhRmEyTHNUUTNscFF2VWl3SW0wY2w2cVVVS3lLNlV3Y1px?=
 =?utf-8?B?SlhhaUkrK0pudzNkZ2d0c09lVVdIdTVkU3NYbDFzQTRpcStLckdSVnVCaFRM?=
 =?utf-8?B?Q05FWGxxWHFVMVF6WkpiVzRObjZwL1BaQUkvQTJtMVIzUEZLcklsYVBQN2t0?=
 =?utf-8?B?bzVLUEtucDJOQmJSSEoySEFaTWo5bUN3YUdHUG5CNExnU2pnRGNUbHRXaXdw?=
 =?utf-8?B?WmpJcTVyYjgwUWdXeFc5UEFlS3pUMU43NWtIVm42TDRDSnpUeGQ1M1dLMms4?=
 =?utf-8?B?eWZGZUlZbGI5OFJHOTZReDhtVVJCbHFJQ3E2bTJFOTVEQjdNcGlNOGVyempk?=
 =?utf-8?B?Umk4bm0rWHFkWEIxazVIUjlnY1pCNE4xU1lPaUhpaXNoY2pXZjI5Z0gxRld4?=
 =?utf-8?B?QmFQUm9ycVN0REZyZ09odmw0SnRrd09wWEZVeHNPNzJLVHljaVJRcGRwMDJZ?=
 =?utf-8?B?NDQzRStzT1lPMWFINml0NnhHRzVnQ2JQb2FDeW9OUEdIT3h0Z3JFWkpBVnBY?=
 =?utf-8?Q?zxM8cj5PvJIsB/SR41H+d9lPkJhn7kB0cwK4oPtTnjXR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61905350-805d-4f56-bc69-08da92895398
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2022 17:32:53.8602 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yeeEc/KHxXSBua6SMtPfnOxbHCV0fD5uldYIKQopCHpASCsQgiBPv38a1EubwXtMAg8dGFNHwnuTGb5y0a/5xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4375
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

What exactly is the scenario which this patch fixes in more detail please  ?

Andrey

On 2022-09-09 13:08, Arvind Yadav wrote:
> Using the parent fence instead of the finished fence
> to get the job status. This change is to avoid GPU
> scheduler timeout error which can cause GPU reset.
>
> Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
> ---
>
> changes in v1,v2 - Enable signaling for finished fence in sche_main()
> is removed
>
> ---
>   drivers/gpu/drm/scheduler/sched_main.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index e0ab14e0fb6b..2ac28ad11432 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -829,7 +829,7 @@ drm_sched_get_cleanup_job(struct drm_gpu_scheduler *sched)
>   	job = list_first_entry_or_null(&sched->pending_list,
>   				       struct drm_sched_job, list);
>   
> -	if (job && dma_fence_is_signaled(&job->s_fence->finished)) {
> +	if (job && dma_fence_is_signaled(job->s_fence->parent)) {
>   		/* remove job from pending_list */
>   		list_del_init(&job->list);
>   
> @@ -841,7 +841,7 @@ drm_sched_get_cleanup_job(struct drm_gpu_scheduler *sched)
>   
>   		if (next) {
>   			next->s_fence->scheduled.timestamp =
> -				job->s_fence->finished.timestamp;
> +				job->s_fence->parent->timestamp;
>   			/* start TO timer for next job */
>   			drm_sched_start_timeout(sched);
>   		}
