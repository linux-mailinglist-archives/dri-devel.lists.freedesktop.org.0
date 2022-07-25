Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EDAD5802FC
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jul 2022 18:41:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 615FB14B8F1;
	Mon, 25 Jul 2022 16:40:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2052.outbound.protection.outlook.com [40.107.95.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6358914B8F1;
 Mon, 25 Jul 2022 16:40:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PFYRtA867nIkk5R6fFryegp6QSoPPb264RZS5cFIiWOJ2NeNSver88i19pXy8qkTMwMQn8qcDamRsPNeczj5EK5bkRRkRpvjIq4/nBh2+uQRqT71kxULSv5myjmQqkK+iyLrqieETDELXqEgg3cOqdS2FQatK6puMnkTBdTtYH0XKW2XG77Uub6a+v+tRneiYfQAJgar8+CuuMKCspWlKpvdHThzDUlp+mwrUUM7R+WUDRR9m4HcoMLlypgIHmpuGT8Nzj+DzitB2ODhnWaEdBlU9Zd+sUe2KLebIM7nYmhSGVtY0ApoUjXkqfTSFuLwNWgm98mJKgaMwFJSlrSEEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ArP4ymkR5UeNgV9X82T4yyqAJi4sLDacDYTXo/Ys7/s=;
 b=ciGVeK5P60p2nniQWqqTKFa5sHg3GTbOEF7y30+Ts4CVsgjWvTvyTw6hasjKuOet6Gc3y7DE+DMMiMTaChPSNtJLFHJQea+Ggc4syqYhyOk4ZcGJVadktGHOMHc2iaISooEpsmI6vmMkNUerpIA/gWvE8mJ6WbK6BgkPdGg17YgE01SIgDU6JyFEMNznVhgZntwFbxm7ngg43/o0RQOVcvCcQTWRxt7+NlhMIYdTsB1QyEDR4SG9M6QLxwfYD83bUKvtivDMpVcYzNkdDWB2HiUr2acGTjphPf9llMNzH1ISntOSFIIqKM2Cx11XaLIylbDYb/kC6upUBjZGPLNhLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ArP4ymkR5UeNgV9X82T4yyqAJi4sLDacDYTXo/Ys7/s=;
 b=fq6M575iGMKLdVVFzvwAMW9UkGu/QxzmAqLYmyXbXR+NQ2747UHjQ3ap0upVsXtVh6tAhCysudgEe6T6q6/+RJStY59Th+E41Ipu+80xBkeuhqlZThaKjVRdZa2lQY5hIqAXUOfqMT/eM/VOQJ4jqfsPJoZx33YD+WP8Kchwllg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by PH8PR12MB6890.namprd12.prod.outlook.com (2603:10b6:510:1ca::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.20; Mon, 25 Jul
 2022 16:40:33 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::9da9:705a:18ae:5e91]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::9da9:705a:18ae:5e91%9]) with mapi id 15.20.5458.024; Mon, 25 Jul 2022
 16:40:32 +0000
Message-ID: <fac8ce6e-6f5f-598d-35cc-7bf01ac90f30@amd.com>
Date: Mon, 25 Jul 2022 12:40:28 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm/amdgpu: remove useless condition in
 amdgpu_job_stop_all_jobs_on_sched()
Content-Language: en-US
To: Andrey Strachuk <strochuk@ispras.ru>,
 Alex Deucher <alexander.deucher@amd.com>
References: <20220719103954.6737-1-strochuk@ispras.ru>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
In-Reply-To: <20220719103954.6737-1-strochuk@ispras.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT3PR01CA0091.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:85::27) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dfb9b0e7-14f4-4b22-4a1e-08da6e5c642f
X-MS-TrafficTypeDiagnostic: PH8PR12MB6890:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9X7uAsSxKYdFnfS16kV8P6RYGW+MZnwVXFFASxVO4P5+hwH//3OBgfThXsBma9JZM6qiTKV3Zr+BN9S7fK9eCK2yUFhpysDJV9aeyJIK1gIt7PhqQvdpRi+NqgPtOBw6n+UeiY7fWspJOCLJvmrB4dUHVmRfUCsYThu6bwqbW6QxANZ/COghaK3iVnetoqWAGAFjxShJRJqszRcW3AMx2bysFc9zNbHPVOc5BL0HcBSKQ6wzrXNckyqCwhMECZd6U9Jk7DzQJJ+lyBaIyjmzZUM7E6OvrBMnltfffREz0f8HErqw8I1LvOp1hUxjoK2ypAdbH2hW8YEJaZodOertiAcmcuQgkd6dZMY2HC70D5ijiJrtaratHRQvHHDu+qa4J9+NU07k7/t8+ngufcJit5wzXkY2fKi3GMUcauRETNQ7p1B0Fp6Is3hLXAM8IkuUEOqsLpnnK9lLmRg0mr628I0pynCnG+3qYV22MIZZhutuEy2U/IiIg4eDHskppC56R8MS3ByLMjwqMo7LBBI8QDY5AtEMB2ZmNHmBo5Xy2X98BnX9nDVwenEcGd274NqldGTH/p4913affowaiUZWsLq4gUJq6GqrP4VieNw3rudMcQXqTjne5A7jdeAMuw7oFJlEDuzeDtzROxEWq/IwjReigXQNwKGWwdgmiANLyfxr0PLcQRyTE0jB3W5YHsFMlQXjMdjoDpRmmEtvAupHgrfdpaCIEE4Ds0tGKb+O3w01wi6bB/dIj38FPu8lW1bsFf0njw92qoJ1o4NBzeoMtqTLy5X4pNkEogfrWiWCT7H1VjhyRAiVCxGdZyDGg/Re+fSguW5SPzC+BJ1I9XilcQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(376002)(346002)(396003)(136003)(39860400002)(54906003)(41300700001)(38100700002)(6636002)(316002)(2906002)(186003)(4326008)(110136005)(8676002)(66476007)(66556008)(66946007)(31686004)(36756003)(5660300002)(478600001)(53546011)(6512007)(8936002)(6486002)(83380400001)(6666004)(44832011)(31696002)(6506007)(86362001)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SEZrNDVySFZGdjdWamZtWmJ4RW9xY3lNcnNqNjFjVE00NVNneDRNR3VLQkVr?=
 =?utf-8?B?L3FvZHRhR0NIQU5CbW8zMGs5Y2V4V3I3Y2pjTHltTkV2NERyZjY5ZTlsTlZw?=
 =?utf-8?B?cTliM0dlMVpjOGFnYzYyRkd1eDVXNDE2UjF2aEYwWEdmenNKdGFZUmRzZWd2?=
 =?utf-8?B?OTQxRjJOWFhia3dIZVM2QVlwa3FQZ2dmOGxwNElEUElBMTRyMFdjRDJGTEtP?=
 =?utf-8?B?OXVOUEFaQ21peTNBSmVGbmRDTFd5dVR0K3FtL2JhWGk3WG51U1RPcVorRnlE?=
 =?utf-8?B?RzNmVWF3VUZlL0lHUUUxU21UdXpGRU9FYVNYY00zTm5hUkgwWlcwbHp5S0ky?=
 =?utf-8?B?WHEvUFY2bGI4azRNSUpxRi95bzI3K3ZLVHhsT2ZFNngrd2FEdE1PcjdhT2ZQ?=
 =?utf-8?B?alk3MTFCdzk1aHdBcDJLdUxIUitxMUFXK2h1Q3drL2ZqdmhwNTVQQXBlV2hw?=
 =?utf-8?B?NU9iRWNwSTV3ODJsTjZYRGtYelpxejcvRDl1VEVObW9zS3QycTFwOXpCNzQ4?=
 =?utf-8?B?V3pvN2s5czRScE1Rb2FxZmhHdDBWeUI3TVBvektlU05KZVhyU1dlbjB6b0p0?=
 =?utf-8?B?ZWhyYkVXajduaHFHOWpncU8vUFJlNXN3MFpkZVpVL2tvb1JXWVNpYlBtcXQ0?=
 =?utf-8?B?Rk9IYnBHbklxenVIYXg4cytCUWNLYjdudC9Qd25MWmJReWE3dHNFV2lPT0lj?=
 =?utf-8?B?dm52SXVOSjZFN0dQS084RGNnMlFBbklkeUs0Nk5PZG1IaWptYTFOMHRCT0Js?=
 =?utf-8?B?dk5jVGs3bUxnNkxYN241WWlrYks4ZGhSZGdiWUc2TUc5UWZBUitTUWYwOGFU?=
 =?utf-8?B?bVRLSzY5a3lET3FmMFBrT1o4Z2kwclFZR0JMUmx1djFPeitOYkNXMWdTRXA2?=
 =?utf-8?B?ZFVESFRvV0s4UVM4Vjk2MmMxYk5RejJva2FhaXI4VXRMVCsvYXhWQ1kvZ0N5?=
 =?utf-8?B?eVV1cTR5QXQxUGdvRVJSTzFWTkp5NStsNmJwWWlySEJpSkNOMlAwQ2ZoS2p5?=
 =?utf-8?B?SlJzak03ZGhiUnFvdFVTSFJPMTNJcEk0dHBhdVVPVjFJZlZUc2xCNi9UM1Jk?=
 =?utf-8?B?eTJuZ01DMnNTVXo3NE1XeFhyRmR0Unk5MGdNZGJUVXhvclN4d1JNWDQ2bmZZ?=
 =?utf-8?B?L3EvWFBtcDdXZVdkZUZ5QW5YdVlTdkR0VFZGbThHcElaU04vQjI3QVB0NEVq?=
 =?utf-8?B?M1k2YkFGRzllVkltdTlrRFpvLzBZbVBoZDhCY0ZocGZwVjI4eHZpUGJvZlk2?=
 =?utf-8?B?Skd1YllQRTMyT3ozZHQ1NWQ3c24wTkZQenJQT1hqclV1ZEh2akJzazVMMmMv?=
 =?utf-8?B?cDNocmV1K0prSW9qcC9idkJvRFRqbE90bDkybCtNY2c4VnA1eEJaR3NsbnJM?=
 =?utf-8?B?WjJhV3ZIZ0FBV2dQelZEOVVKUVVRRmpXVlN3YlNudU1qMVpQczYrY2hBcHNT?=
 =?utf-8?B?WGc1M2Mwc1lPa1F3dzczVFVnUEZpRm1rbDBYTENWYnluYytQWndJaE9IYWIv?=
 =?utf-8?B?STZ6aDZLZmtrakxwd0RSc21EWFBzMGZSWDY5RjdZTTBEOFoweTNyV0pUYlN6?=
 =?utf-8?B?LzZBcFV3dDVVWm1OUWRrTCtVYWhwU2U2a0tGeC8vYjVpZTZYeFdGbGdNcm11?=
 =?utf-8?B?ZFMvOE5RMTVtYVUvOTlxQWx1Q2tnS2RMSHNyUjZCVlM2WXdPdlgwdW52QjN0?=
 =?utf-8?B?eTBLc2JmcTVIcm1WYzN4dEVPZHNKWGRYKzNuNGc5UmlaYnNLYUQ1QU1nVGVl?=
 =?utf-8?B?djhSUmJVVkkwV0U5c2RMM0lnR3JlRVQweFpsMG1ITGVBWHFHUTF1UTF4Tmls?=
 =?utf-8?B?RGl5SVpHOGJvYThDM1NNUXRQaVRjQk1VZlR1cHV1ZkxCaER6OCs3YktDT0kw?=
 =?utf-8?B?clZpcTlPbDBxQTZWNFpCbjZndDNHU0xqNHJBYUxVTXIxc1R2d05LQ2t4Mkhj?=
 =?utf-8?B?OUVDUW5qWWNibmpBTHgyZms4ZkQrU0cyTjhiOFBYMk9mM0hOdkJhRHhCWU92?=
 =?utf-8?B?bTU3Q290UzlPa2ZaL2dGdFNZMXZSdlpucW15UHh5NmNPT0t1MFpXKzh3SUtX?=
 =?utf-8?B?aDMzRkxlYmloMkUySy9GZWllQ2NKZnZRRmZHKzRieXlkak81U0hnWTk1aXk1?=
 =?utf-8?B?SDEzYUFCa2VDN0FOdmlMcExMbmdzL0wzYjB2YUJUQzIwUEZSOUJzMGFyQS9r?=
 =?utf-8?Q?IQqJ6145RrDzHiRG9nXVo04b6G/AUNgNw4QBfEaI0wuu?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfb9b0e7-14f4-4b22-4a1e-08da6e5c642f
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2022 16:40:32.5869 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cqckq8GXtnR2lYIoPWER2Y7nxfd2pqa/Pa/xMKkaXJYM1kYh3iLnlwU9Dcj/ctmBYX+b49ZkYI/Al72lDipalQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6890
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
Cc: dri-devel@lists.freedesktop.org, ldv-project@linuxtesting.org,
 Jack Zhang <Jack.Zhang1@amd.com>, Guchun Chen <guchun.chen@amd.com>,
 Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Felix Kuehling <Felix.Kuehling@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, Surbhi Kakarya <surbhi.kakarya@amd.com>,
 Melissa Wen <mwen@igalia.com>, amd-gfx@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>

Andrey

On 2022-07-19 06:39, Andrey Strachuk wrote:
> Local variable 'rq' is initialized by an address
> of field of drm_sched_job, so it does not make
> sense to compare 'rq' with NULL.
>
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>
> Signed-off-by: Andrey Strachuk <strochuk@ispras.ru>
> Fixes: 7c6e68c777f1 ("drm/amdgpu: Avoid HW GPU reset for RAS.")
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c | 4 ----
>   1 file changed, 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> index 67f66f2f1809..600401f2a98f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> @@ -285,10 +285,6 @@ void amdgpu_job_stop_all_jobs_on_sched(struct drm_gpu_scheduler *sched)
>   	/* Signal all jobs not yet scheduled */
>   	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
>   		struct drm_sched_rq *rq = &sched->sched_rq[i];
> -
> -		if (!rq)
> -			continue;
> -
>   		spin_lock(&rq->lock);
>   		list_for_each_entry(s_entity, &rq->entities, list) {
>   			while ((s_job = to_drm_sched_job(spsc_queue_pop(&s_entity->job_queue)))) {
