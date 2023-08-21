Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD95782ACA
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 15:47:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32EE410E260;
	Mon, 21 Aug 2023 13:47:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2051.outbound.protection.outlook.com [40.107.94.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16B7B10E0CA;
 Mon, 21 Aug 2023 13:47:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NDc4IgbnWXz3lqrX/ryOsyZxE6xLyt98DLLhglu7cpkmhCCj3Kt4aUmY3cpEb8N1O3vmBnPcLgt0vjrBYpIUyu/RnXAMotV38HfkdBkDaC/CzbLEgJH7e2Nzxgr7Y4ISFa5lhM/FZ3glY2BNamYrwcit8sJAdBohT0N56+qwqbUH5ZmYlVg42e5kCdTIj/n4sfSz1qIN4TUsyjwTFQ2/5fLbOiNSGx/pcOB2tyK9YcJXpacT/7vyS2GvHdZStZJOqIpfT4P8x52IVuu3Q4Eob1K0VpZcsqKlE8PKYlFBrwOeva52eZvt0j1uNZzgXaK8tAY5gWPMEJlAUjqWKy6HKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pReeiqeWi4XwDUuX4Wkf2m/IOLphe1c5QasVXm6c6Aw=;
 b=hrstMUwfOHZMlqP/M8Rlc9HRdrXqUTBbLWtzby0gXf6xFx6M97HTRBJdVyJs6MjsqV2EBGNhouMS+ndVQXNKqU9e/3Mj3XZ6fHfNGzKrHxGbcoI4rNfaSoXKg+3rpOxWLRggM1O5Cn5ASwdg+PgNLUkg+Cp/ZV+yM9mYY1Vlbnv17rrxcyZDalGVFyYTbaKXSFXtcQWHU/h+oq99QRMGxCPK20NxjtP5Grvc6949Xwu/Qv4kAvY21RG+pc3vVnXTSkMzO1yFtxrJ791WYYf4Q38IecFcq307c1dGH07XFs95x0XLIJhFJFheoVJ6o7Sx4THGr+J8m4QWe8C+eGLtIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pReeiqeWi4XwDUuX4Wkf2m/IOLphe1c5QasVXm6c6Aw=;
 b=d+rMDUBdzehccjbgnVbxrAK25WmLCmBim3Qap3R+Q9P6FpgODlm6IeE/CJXvhzznwqy/JWqj3JthWMFiTf+zaLzgmBkVqpkoWWmyqAV5RmmmcJW9PMSStDHihDYHz7xrtmUD0t4QikqECMzl+ZRWHh3CcVl8UQspfvENMEty7Zs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW4PR12MB5667.namprd12.prod.outlook.com (2603:10b6:303:18a::10)
 by PH7PR12MB9255.namprd12.prod.outlook.com (2603:10b6:510:30c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Mon, 21 Aug
 2023 13:46:54 +0000
Received: from MW4PR12MB5667.namprd12.prod.outlook.com
 ([fe80::dc06:ffb3:46ec:6b86]) by MW4PR12MB5667.namprd12.prod.outlook.com
 ([fe80::dc06:ffb3:46ec:6b86%3]) with mapi id 15.20.6699.022; Mon, 21 Aug 2023
 13:46:54 +0000
Message-ID: <5436e99a-fb23-29cb-d20f-48fb91d57950@amd.com>
Date: Mon, 21 Aug 2023 15:46:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 5/7] drm/amdgpu: Switch on/off GPU workload profile
Content-Language: en-US
To: Arvind Yadav <Arvind.Yadav@amd.com>, Christian.Koenig@amd.com,
 alexander.deucher@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, Felix.Kuehling@amd.com, amd-gfx@lists.freedesktop.org
References: <20230821064759.94223-1-Arvind.Yadav@amd.com>
 <20230821064759.94223-6-Arvind.Yadav@amd.com>
From: Shashank Sharma <shashank.sharma@amd.com>
In-Reply-To: <20230821064759.94223-6-Arvind.Yadav@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0492.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7e::11) To MW4PR12MB5667.namprd12.prod.outlook.com
 (2603:10b6:303:18a::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB5667:EE_|PH7PR12MB9255:EE_
X-MS-Office365-Filtering-Correlation-Id: d9887afa-849d-41f2-61bc-08dba24d143a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fODYD7LlNX0/Fl2f2yNheCLt0FBxDKZpC/5JVWkZgAEFeehxThVgIJEVy+P7VhgsBHiG8mj2UvWyO7A52CidowRCBpvgUYR5dHWAmbUmmelMUYKG7NL5U6RETnivvereK98aNNDDoJnykpx/gDAXMhF7Ma+tI3+4B/0OF5dkro4ZXFcbOS+Ykmz/0Fe2fBDTMwF21rsIiOxK65d6Uh+OmHrKww/sh7p+25o+YODWol3sYZVGg9wD92ofCUqMr68JY0bRZf8zpu8O5hX7ZVO1rbyJPhKCXkUs2YOhA2FsxEzyj2n9KeYLQyCzf33YgGRkNvVSrs2OEcSAt9PjXB560zOr4U4vZRXr91lENfRU+4SLVdRezIYXb9jUTYZ6Pp3ulTbNe7qJYucwpx2ZvQYsuN2YHoIQwKKuqQvm3UlMRAqttVnzohUrHgn4Twp4t46dCfLh0eEYpCHrx+R3Z6D5q9YnzUWzVbHt5QT6z/r+Yw0hm2kex8nbBery+JCLbQoRgEbgPt5KZD031DWOhJHM04yvARrjBEeUCKBVRf3Tfq02aWZdDeq0a5M4juktyLuKl3Ob0G+vwHh+mMLZqIQa+zIG6d4h9wMXvLKDgR6MGJZA48iG/NJlEtcM8c+KrKR+dx819Ael/Y6hooDAKVwpKA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR12MB5667.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(39860400002)(376002)(366004)(346002)(186009)(1800799009)(451199024)(66556008)(66946007)(66476007)(316002)(6512007)(8936002)(8676002)(2616005)(4326008)(41300700001)(36756003)(478600001)(6666004)(38100700002)(53546011)(6506007)(6486002)(2906002)(86362001)(31696002)(31686004)(44832011)(5660300002)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cHJuVnhjTHo0Q0x0SzhIeXpUaExReGpwcGdqeHRHUFljVVNmUWpwRGMva0Zs?=
 =?utf-8?B?NWtWYWh0UXNURTFuK3k3em9WR2o4VXJVZWxoQjh5YkV0aVhUd1FQTDR3eDJF?=
 =?utf-8?B?Z2kwaWRYQkJnSXUzRTB6V1VBRUxUZUlHb0IyQU9WMmdzL1JoRGJkLzJrNXE5?=
 =?utf-8?B?YnZFaWw1eXloRlN2NHdocFRMeUtIeXZFaUgvcWJHcUE5UjhBZ1UrYkV6N1hV?=
 =?utf-8?B?VFBEbXR0SVlIc0NFclgyV2RjSFd2SjluRktrUUhmalR0VVJXejNDMlM3RHB4?=
 =?utf-8?B?T2MyN3NTMmVvQUpFRHNzU25vSlJKYndWV05KekZoU0VVc3l4MlNYY2RtWEla?=
 =?utf-8?B?Q2swTkxWS1FDQyt2RWdHemZ4RjlPcnpydFlyT0M3ZXFkYTFDRTRBT0lTSHpR?=
 =?utf-8?B?b1Voa3QzS3Q0UUFLQUEvbWJZUU1JYW9OS3k5bngwTW8vUTNIenovTC9UR25N?=
 =?utf-8?B?STl2M2EzTnMrdnN0UTExWG1xcmFhbmVzdE9YM2J3N2EyZHU0UWdKZmViSXJq?=
 =?utf-8?B?dWVnSlJXRXFFS1d4aHo1aXpkVklpcUptN1k5VHU5N3dGc3E5bWpWYUVUanJZ?=
 =?utf-8?B?Yjl3RU1nQUMxTFdzTFIydGE2bnN2clpzVHJKNUFGeTNvNXdMTXNLdFNpRC96?=
 =?utf-8?B?dmtkd1doZGM1ZVFySTg5aUg4ZEhob0NhRzZWV1R4UWZEN1A2d1lmRHJtMDFW?=
 =?utf-8?B?T0tUSzlUQ1dRYmVDNElBdTFSblZaK3k2Z2M3elN6VGU5RTUveTR5L3YwWFVF?=
 =?utf-8?B?dUk1RW81ZWxhZVgwd3hramMvV01kZ3dMS0hZSG1CY29EYWp1QzAwVEJEQXIz?=
 =?utf-8?B?YW5TRU4xTUFaUU1QZTZlcFFPVnNNcUkxUjBYczNCS3hRaXpPTnZvRVRZNTgw?=
 =?utf-8?B?YmRwUHF5OEg3ampiWWZuZm1JcmtSK0d0dll3OHE0Ny90VTRIL0x1Q25OZzBJ?=
 =?utf-8?B?Q0IwdENES2NSQTRVTzUzdmhxVGR2am1IRkF6WWhZVjZCQTlhM1Z0LzR4RDJM?=
 =?utf-8?B?Yk1JbzRQQWlEQnVPRk8wNGNnd2V0ZEd5dkdyNHpwZjRtcU1vbXczVkVSL3J2?=
 =?utf-8?B?bm0xZzdma213dEFaMVRvZlZZN0EwL3dHdTYwUWx3QjdEQkx2b3FNakJmMU5s?=
 =?utf-8?B?bTIra2xpV2xUV2VUMG9RRUppMlIwWWRUV1dOa0NFaG1uc0FuaDQyVkZ0NWZl?=
 =?utf-8?B?TkdUcmFnWUFCOWhOY0ZvMG1jOXRtWUg4QTJUM1JDZUh0SjQ4UDBhOXRBMklk?=
 =?utf-8?B?RVZXQkw3MVdqU0o3aGVIYUZxODU0YjR5QkRUVUxKRmpsRm9idHNYOHpKMjM0?=
 =?utf-8?B?VVk4Y3lPK2pZY2w2VVNQUzQzT2tTOXhoK1JSaTNtVGI2dUcvNEdSbUxBN1Fx?=
 =?utf-8?B?R1crYlVlYW1qRUZlZGcvNmlNSlk4Z3dOOUJMUGFPamJUZ3hDZVRUQnNpaGVT?=
 =?utf-8?B?ZGVOV0pFTWJTcHNuNWdLdjJBSXNNdDRaak1YUnRPRDJZelY4RmtyL2V6by9t?=
 =?utf-8?B?UGJCSS9SOVY4bjRqUmpyUlc4M1E2Y0lRaFdGeTJLQUdrb2FyMUg1K0RYanRl?=
 =?utf-8?B?aFhnMWJpV3cvZXd5Tm13c2pKYy9GcTl1VHl1eFFqU2l6K2F0aTdHOGZGSWpy?=
 =?utf-8?B?ZzZqUStYV2krZ3hGSHZpZTUrQlFCTW5UbkZ0RXlDcDU0TjVRSHJRdnk4aFpn?=
 =?utf-8?B?czFHMUk4NGMvREFBaUVObmFzZkQwbmNzUk9PaWQ0KyttcUpBV2t3Vm52dkpI?=
 =?utf-8?B?WWx1bkE1d1U3dFhja0psM3pyMnFlWEppNzQ2MmtlOXJ6d2dFTzczdDF3ellt?=
 =?utf-8?B?dXJncnFLbmNZNDZabmpiUitLN2pYMEcrdkVqbjJuU1BVaXA2dGd5VENnVk9l?=
 =?utf-8?B?VlF6RS95RE85TTBsUHpXUEdOYm1JY2ppQ3MwclUycUlXcStNRitDYk55a1Q5?=
 =?utf-8?B?Tk95UUI5VnNoRWNPRE9IMlFuMFNCMWk5b2JobmxsNW9qOXRhdTJ2ZDJ1SGlv?=
 =?utf-8?B?RkdlR1dRd3FCUVEzNGpvUXRvN29qT2liTzg0c1RkdEFwTE43dFpxTmNqaDlX?=
 =?utf-8?B?dVc3ZmZnZ0VIa1pMQ1RjRUNKb3I3dDF6dnFqQlhJNlNLMUhZclY3WDR0dkth?=
 =?utf-8?Q?8Lr1QRX8ysmyTdlMTol7Xb2vw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9887afa-849d-41f2-61bc-08dba24d143a
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB5667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 13:46:54.1464 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ap/MWQsKnPBwkanPiBjWLTm2TyA5vQ3VNzIffGqmRFSJ6mZNgZsGNE6M5lpebfKQjNMvQbL/Ji668S7IIZ6HgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9255
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 21/08/2023 08:47, Arvind Yadav wrote:
> This patch is to switch the GPU workload profile based
> on the submitted job. The workload profile is reset to
> default when the job is done.
>
> Cc: Shashank Sharma <shashank.sharma@amd.com>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> index c3d9d75143f4..c2b0fda6ba26 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> @@ -176,6 +176,9 @@ void amdgpu_job_free_resources(struct amdgpu_job *job)
>   static void amdgpu_job_free_cb(struct drm_sched_job *s_job)
>   {
>   	struct amdgpu_job *job = to_amdgpu_job(s_job);
> +	struct amdgpu_ring *ring = to_amdgpu_ring(s_job->sched);
> +
> +	amdgpu_workload_profile_put(ring->adev, ring->funcs->type);
>   
>   	drm_sched_job_cleanup(s_job);
>   
> @@ -295,6 +298,8 @@ static struct dma_fence *amdgpu_job_run(struct drm_sched_job *sched_job)
>   			DRM_ERROR("Error scheduling IBs (%d)\n", r);
>   	}
>   
> +	amdgpu_workload_profile_set(adev, ring->funcs->type);
> +
>   	job->job_run_counter++;
>   	amdgpu_job_free_resources(job);
>   

Instead of calling switch on/off in title, may we call it set/reset GPU 
workload profile ?

With that minor nitpick handled, please feel free to use:

Reviewed-by: Shashank Sharma <shashank.sharma@amd.com>

- Shashank

