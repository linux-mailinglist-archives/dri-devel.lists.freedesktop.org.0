Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A2D7A59A5
	for <lists+dri-devel@lfdr.de>; Tue, 19 Sep 2023 07:58:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C771610E3CC;
	Tue, 19 Sep 2023 05:58:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20608.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::608])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BD9210E3C8;
 Tue, 19 Sep 2023 05:58:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CdtaehkgPd0cokMfjw4x9Yn3+r0rGhCFV4h3AAsOLsYNAMIaeUvGSJUbsSS5wOgXvz7ynRCimGlq7QczJql8YmLZ+IZN3HyZ456U/0Biuu2VZwBxyawi+DBwfSMAPRMOFN60w74bUeDfAvkfJTckdCWKrzIqnydCTIDFyqenBTzWcstkDu8kO+pdBiSUTcKc3G3mlWwkzI+KAuDC2kb5G1gPfOAAxWzyn2v+N7Jk13EAypLNo0FRZwH/tVubVmy0Ulc0FL6hLwFKVXBGvmb+NQrrUxKwyKh8HQv44d2fTfrp5e1inNwI9EpfW5d/cfTy3v5YuvBMte9Epv8wDRERjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7tvTB/ezAKn6qotFXnc08Aot0VY27mOrA+hN2NgzQ0Q=;
 b=HrhN80Zd3rzgcEYuj55g7PsHvy59JgUCtoOs0egBJlFOLQNjRhnatvJnbBMYlSVC00Dehn/fb2y/Q7alZwzWJybeAeg5qy4JnGnQ8TQ/4TxQt2rz7VZpCKM7QYuVmBxwt8BbGEFTRSXtbTQWI3gZpuLsfTULSx0/ir10ErWmBKWavI/n562c8FzWoaWQBl6Uk2/e3bUkiILEs5qbY3Y89RQnXipjbjxNgT9zrqTvRedlwBLyExJ3c1N8aQdvr5ycafzZ/fhc5NhWiDWiNsxQy97YbkjHkWIvdczVjtbP17po/lDpmUlMZoHNSXebTP+AG426HxJOkH+QoZRYFm5mTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7tvTB/ezAKn6qotFXnc08Aot0VY27mOrA+hN2NgzQ0Q=;
 b=PS46E09GHM0UG2zIgnsY6nunOVvDyyJh1db3UXTacI9xAfOqbuAD/S0XVURs/CydybizOkrqC7FzSHEH1VVzRPnLvzl/UYJY0d4M2QLFMli9bTnIBA8m9g6xVcNuuYorUO1ShP5+ukjY61UnCcUGRlstv5JdiLeZrMwC9rspGjc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BY5PR12MB4322.namprd12.prod.outlook.com (2603:10b6:a03:20a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Tue, 19 Sep
 2023 05:58:33 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::55cb:215b:389e:eced]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::55cb:215b:389e:eced%5]) with mapi id 15.20.6792.026; Tue, 19 Sep 2023
 05:58:33 +0000
Message-ID: <8765a827-accf-2498-74a2-62fe561badb7@amd.com>
Date: Tue, 19 Sep 2023 07:58:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v4 01/10] drm/sched: Add drm_sched_submit_* helpers
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
References: <20230919050155.2647172-1-matthew.brost@intel.com>
 <20230919050155.2647172-2-matthew.brost@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230919050155.2647172-2-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0099.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::16) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|BY5PR12MB4322:EE_
X-MS-Office365-Filtering-Correlation-Id: be385331-f943-4846-2721-08dbb8d574d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zDjFRJosSb5AtPOJ5AQyuQMEZjmvla9u2aqEMj0ukPmffAt2eVoilZxOqMyEw2V7IH/R3SEVLnTrujJ+T4J43AMgZkJsAUGSaXq5uY2ROZrFOgHuSRypdV/scDyP7+1oYT7MpJ+1oTuNQI6HHhPIcHCdoZsM65naL9L6/+CnBRkUR1hvEEiIntMsH/8/5IHLRvtaZPj2dZIiDSFod5Y5Ev+sfwpAj3IgUL/AdeAW4PwjHyN7j6IOa8JdLNeMuzZR2UX8gg01ysU11Dzk39KWqtIYZqmw2zLgXxARnlqvcvJuUNsmIsenkI1oWYHpMHq4T4YPt+aQl2qdHuVT5dHALYkAFz2VixH9wtwRfjKNiwPNY0bjPQIUqMFqY0l9qXufw2AWsEwDeatbHAMqpiQP3hHXC9HN6g1d9mG0fxVff0UDbqevsyZ1lm6/6G2YlxKIN8ByoUsBm6iojfZFCHwZnWrRLXbHd9/HdvcZtI8WZvHrBGTyfJbPhjXUPYllGXRyLvdGlEGxF2FHWQr6/aP9KY+0QynMOys6Yhb5NYtLf+GatgcgM7I5wXMxNa0djZmKyqhfBJVTSTEU2p5Hlt41L1trk9VHoLDBuWxhSPg2bJ0JbA03bfnXrEMnurbk6aq4XtVgvUExMFFY62gdFpkXifaHQqzeFFP6MIuFRDxoIoeaofQDsDTnXq0Zp0Upgti+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(346002)(376002)(39860400002)(136003)(1800799009)(186009)(451199024)(6486002)(66574015)(83380400001)(6512007)(316002)(2616005)(26005)(41300700001)(7416002)(66556008)(66476007)(8936002)(5660300002)(8676002)(4326008)(6666004)(66946007)(6506007)(2906002)(478600001)(31696002)(86362001)(36756003)(38100700002)(31686004)(45980500001)(43740500002)(309714004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXphT0VDd2hhVWJ5RTNleldWdjE1ZEZMUHlVbHJKMGRyckErN2RwbXVHZUNS?=
 =?utf-8?B?YldFenFHSnlzSmhpVWZFZ1ZBU0RjTWREdU42M0N3ZFhRMTFyWWl0WitiUzFw?=
 =?utf-8?B?WkpISXRhQUtaZm1IOVR4aVZ5eDBkTWNjQzFkR2s0MGg5WFdhdUxIaVlCWmE4?=
 =?utf-8?B?clg3WTF1RXd0bnJOclJ2NVRsTjZNbld0WDV1QVduWVlMWmF2MlQ3SStBaWxu?=
 =?utf-8?B?MFdkbDU5VUxlOGpDeGFMa3h0RTQ1RGZka3MvVWhEN09ERDc5UlJiUVI2RVdU?=
 =?utf-8?B?OXMvaTkxQ0JkSHZlM0o2K2I1dHorRkE2R0x6dDRIcVFtT0g3ZEpYZHlYSjRT?=
 =?utf-8?B?L2xqRkJjVjh5S3Z6d3RabTFTU21YM1NBL01OVDc5cHd2VWdvT2RmQVphaXB1?=
 =?utf-8?B?SEc1MFJuOHJhWEplQXVSendwdGFza3NjbmFya25XckNwUnJPbVAyRTE3OHdz?=
 =?utf-8?B?V2NVMUEvdkVOOHNXclRsSnlNNU1aZ3lmWmFYUnkzZGVCUC9iYkh2VVV3MWJN?=
 =?utf-8?B?bWhCNjR1Mm5OU0duM1lnZHltZEdoUmZCVmdnbUhNNTc1RHUxaTJURzJCRzNi?=
 =?utf-8?B?TUVMcDZaZ0cyYmN2T3p1bzF0Sk1nN0dKaER2MGFybWg2Mi93OFQzUnRqbnRK?=
 =?utf-8?B?Q2F0QTZqdFJLZDFFVUdydElSTDBBZm00NlRnYWlQQndBNFU3Z0prOTVUdDRv?=
 =?utf-8?B?RUIrK2NMUSttWXZ3ZGxKM0s4UjlibUU2dGNoVkhtaE9GM292MlQrZDdzZ09B?=
 =?utf-8?B?eGh3bk9YSlZBbmEvK0dPdmVMZFlMdkVLMkVac1I1cUljQzNEUTE0R0RtRnNl?=
 =?utf-8?B?VjFXMUFucExKVnc3OHlsaFRWTnpDWThHU2NaeFphQ3BXTjFKdzAwdnZBOXFo?=
 =?utf-8?B?TldPMzVXaDNvMTRJbjMvTUttWTNnQ1dkMlhDNVIvTk5QTFBxcUJmbm9VMHo2?=
 =?utf-8?B?Z3RZOHdHcUx2V0ZjUEtUOUhtSG1wL21RMmV6L3NaMkhDUWpybk8zallWY2Za?=
 =?utf-8?B?NzVnYjFBcGNGZmx5bFczb0tSMHBOdE50eU82dUhNN0FrcS9jRWNiVGJhRm9r?=
 =?utf-8?B?YzNPOGdUdWd1NzJ5VjdLNmRzRXVLWldVZXg0TThrR3Jld1h0QjhZem5JMVZU?=
 =?utf-8?B?RlFKUmMrb0NTSE9odlVSNTkwV3pNTUE3cVBVbm9GN0ZIQkd1YVlIb1FWN2Nx?=
 =?utf-8?B?d3ZsTi9kN0cxZzNSWWZ1VGk3S1hGVW85bnVlYUxHVU5aN3phWndVbVRIMWtQ?=
 =?utf-8?B?Qmp2NkVCcUF0RW9CS3hrZHBkb3BXQ0I1Z0pqLzQ5ZjVHUFBXbDNQUm1BVDRK?=
 =?utf-8?B?MW5tZWdTTDFSalNOZWFUWEhEczRzU3NheS9YQVpCWTR3SXcrNEgxc2JPNFlY?=
 =?utf-8?B?U1lhcFNCSHRLKzdISkVDM205ejZYVXBiZU9TVG9mME50aElzSW9oazQyd3c4?=
 =?utf-8?B?cVBOdUVQdmdsNzNjbW9vZWd1SEcxOXJEenFUZFR6ZWtaL0Fac1RmQnRicEor?=
 =?utf-8?B?SmQyREwrWCtRNVRMaGVaQmdlUWtENXBUSzc1czIxTzlOOHlxQzI1Y3Vydlp2?=
 =?utf-8?B?UTl4am5odHZ0TUpGempYVDlnWEZSTFVPcU5kVGM5ZDNpRTJEVFZXT3FKVWMv?=
 =?utf-8?B?VFZYR0tJSFBCSnh2MkdqbFljZHQ3RWpWRk9BMDduZWVucTN0WnhqaGFqZ2pw?=
 =?utf-8?B?NWVsbjlTSmlUbVdVL2ZVcWNoT0RFQU9mb2Q5cHIwZ3BDK3Bxd0E0Yk9OVy9F?=
 =?utf-8?B?RkRQYUg3ZDVta3U1dm5PRTdyQnMyS0xNU2xXZVpKclQxalVMSFpwbTRBQjkv?=
 =?utf-8?B?UjduOGhpZ3liNWVmN1Y1amtTc0pPdVkxOXBCNDY1QzZSR2lLRHM2WTlLMUU3?=
 =?utf-8?B?VFRZSEYwS1hSUHVaZnBEN09tMlIrTzgxQkQwejlDV0JiVzVJOHBZenNka2ZW?=
 =?utf-8?B?Z1o0MENqcUVlNk1BKzgzeUJhUnhLcXBwSTB6N1gxRnhlaGE2MEJJdm01RVF3?=
 =?utf-8?B?eUIwa1VYM1NWNjlKRHgyeXpjUVhkQTdVRC9KL044T3FvWlFSUHpySjA5VnU4?=
 =?utf-8?B?ZHduWTRzZ05yRTl2NFdWOFRUTlRiQ0JIQlhrSHUvd09Da1AycG82T09uazR5?=
 =?utf-8?Q?vRSOrbtz9N/k+Vn1VdKGZlfo+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be385331-f943-4846-2721-08dbb8d574d3
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 05:58:33.2270 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DMHKB6ZdGpHAE/WpG4I48usVrHhSaf9bQRz0qK3fCk6qR6ru/jMZWh45BGOwdV6r
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4322
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
Cc: robdclark@chromium.org, thomas.hellstrom@linux.intel.com,
 lina@asahilina.net, sarah.walker@imgtec.com, ketil.johnsen@arm.com,
 Liviu.Dudau@arm.com, mcanal@igalia.com, luben.tuikov@amd.com, dakr@redhat.com,
 donald.robson@imgtec.com, boris.brezillon@collabora.com,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 19.09.23 um 07:01 schrieb Matthew Brost:
> Add scheduler submit ready, stop, and start helpers to hide the
> implementation details of the scheduler from the drivers.
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Christian König <christian.koenig@amd.com> for this one.

No idea when I have time to look into the rest :( But Luben should take 
a look.

Regards,
Christian

> ---
>   .../drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c   |  2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c   | 15 +++----
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    | 12 +++---
>   drivers/gpu/drm/msm/adreno/adreno_device.c    |  6 ++-
>   drivers/gpu/drm/scheduler/sched_main.c        | 40 ++++++++++++++++++-
>   include/drm/gpu_scheduler.h                   |  3 ++
>   6 files changed, 60 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
> index 625db444df1c..36a1accbc846 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
> @@ -290,7 +290,7 @@ static int suspend_resume_compute_scheduler(struct amdgpu_device *adev, bool sus
>   	for (i = 0; i < adev->gfx.num_compute_rings; i++) {
>   		struct amdgpu_ring *ring = &adev->gfx.compute_ring[i];
>   
> -		if (!(ring && ring->sched.thread))
> +		if (!(ring && drm_sched_submit_ready(&ring->sched)))
>   			continue;
>   
>   		/* stop secheduler and drain ring. */
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> index a4faea4fa0b5..fb5dad687168 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> @@ -1659,9 +1659,9 @@ static int amdgpu_debugfs_test_ib_show(struct seq_file *m, void *unused)
>   	for (i = 0; i < AMDGPU_MAX_RINGS; i++) {
>   		struct amdgpu_ring *ring = adev->rings[i];
>   
> -		if (!ring || !ring->sched.thread)
> +		if (!ring || !drm_sched_submit_ready(&ring->sched))
>   			continue;
> -		kthread_park(ring->sched.thread);
> +		drm_sched_submit_stop(&ring->sched);
>   	}
>   
>   	seq_puts(m, "run ib test:\n");
> @@ -1675,9 +1675,9 @@ static int amdgpu_debugfs_test_ib_show(struct seq_file *m, void *unused)
>   	for (i = 0; i < AMDGPU_MAX_RINGS; i++) {
>   		struct amdgpu_ring *ring = adev->rings[i];
>   
> -		if (!ring || !ring->sched.thread)
> +		if (!ring || !drm_sched_submit_ready(&ring->sched))
>   			continue;
> -		kthread_unpark(ring->sched.thread);
> +		drm_sched_submit_start(&ring->sched);
>   	}
>   
>   	up_write(&adev->reset_domain->sem);
> @@ -1897,7 +1897,8 @@ static int amdgpu_debugfs_ib_preempt(void *data, u64 val)
>   
>   	ring = adev->rings[val];
>   
> -	if (!ring || !ring->funcs->preempt_ib || !ring->sched.thread)
> +	if (!ring || !ring->funcs->preempt_ib ||
> +	    !drm_sched_submit_ready(&ring->sched))
>   		return -EINVAL;
>   
>   	/* the last preemption failed */
> @@ -1915,7 +1916,7 @@ static int amdgpu_debugfs_ib_preempt(void *data, u64 val)
>   		goto pro_end;
>   
>   	/* stop the scheduler */
> -	kthread_park(ring->sched.thread);
> +	drm_sched_submit_stop(&ring->sched);
>   
>   	/* preempt the IB */
>   	r = amdgpu_ring_preempt_ib(ring);
> @@ -1949,7 +1950,7 @@ static int amdgpu_debugfs_ib_preempt(void *data, u64 val)
>   
>   failure:
>   	/* restart the scheduler */
> -	kthread_unpark(ring->sched.thread);
> +	drm_sched_submit_start(&ring->sched);
>   
>   	up_read(&adev->reset_domain->sem);
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 30c4f5cca02c..e366f61c3aed 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -4588,7 +4588,7 @@ bool amdgpu_device_has_job_running(struct amdgpu_device *adev)
>   	for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
>   		struct amdgpu_ring *ring = adev->rings[i];
>   
> -		if (!ring || !ring->sched.thread)
> +		if (!ring || !drm_sched_submit_ready(&ring->sched))
>   			continue;
>   
>   		spin_lock(&ring->sched.job_list_lock);
> @@ -4727,7 +4727,7 @@ int amdgpu_device_pre_asic_reset(struct amdgpu_device *adev,
>   	for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
>   		struct amdgpu_ring *ring = adev->rings[i];
>   
> -		if (!ring || !ring->sched.thread)
> +		if (!ring || !drm_sched_submit_ready(&ring->sched))
>   			continue;
>   
>   		/* Clear job fence from fence drv to avoid force_completion
> @@ -5266,7 +5266,7 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
>   		for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
>   			struct amdgpu_ring *ring = tmp_adev->rings[i];
>   
> -			if (!ring || !ring->sched.thread)
> +			if (!ring || !drm_sched_submit_ready(&ring->sched))
>   				continue;
>   
>   			drm_sched_stop(&ring->sched, job ? &job->base : NULL);
> @@ -5341,7 +5341,7 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
>   		for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
>   			struct amdgpu_ring *ring = tmp_adev->rings[i];
>   
> -			if (!ring || !ring->sched.thread)
> +			if (!ring || !drm_sched_submit_ready(&ring->sched))
>   				continue;
>   
>   			drm_sched_start(&ring->sched, true);
> @@ -5667,7 +5667,7 @@ pci_ers_result_t amdgpu_pci_error_detected(struct pci_dev *pdev, pci_channel_sta
>   		for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
>   			struct amdgpu_ring *ring = adev->rings[i];
>   
> -			if (!ring || !ring->sched.thread)
> +			if (!ring || !drm_sched_submit_ready(&ring->sched))
>   				continue;
>   
>   			drm_sched_stop(&ring->sched, NULL);
> @@ -5795,7 +5795,7 @@ void amdgpu_pci_resume(struct pci_dev *pdev)
>   	for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
>   		struct amdgpu_ring *ring = adev->rings[i];
>   
> -		if (!ring || !ring->sched.thread)
> +		if (!ring || !drm_sched_submit_ready(&ring->sched))
>   			continue;
>   
>   		drm_sched_start(&ring->sched, true);
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> index fa527935ffd4..e046dc5ff72a 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -809,7 +809,8 @@ static void suspend_scheduler(struct msm_gpu *gpu)
>   	 */
>   	for (i = 0; i < gpu->nr_rings; i++) {
>   		struct drm_gpu_scheduler *sched = &gpu->rb[i]->sched;
> -		kthread_park(sched->thread);
> +
> +		drm_sched_submit_stop(sched);
>   	}
>   }
>   
> @@ -819,7 +820,8 @@ static void resume_scheduler(struct msm_gpu *gpu)
>   
>   	for (i = 0; i < gpu->nr_rings; i++) {
>   		struct drm_gpu_scheduler *sched = &gpu->rb[i]->sched;
> -		kthread_unpark(sched->thread);
> +
> +		drm_sched_submit_start(sched);
>   	}
>   }
>   
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 506371c42745..e4fa62abca41 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -439,7 +439,7 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
>   {
>   	struct drm_sched_job *s_job, *tmp;
>   
> -	kthread_park(sched->thread);
> +	drm_sched_submit_stop(sched);
>   
>   	/*
>   	 * Reinsert back the bad job here - now it's safe as
> @@ -552,7 +552,7 @@ void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery)
>   		spin_unlock(&sched->job_list_lock);
>   	}
>   
> -	kthread_unpark(sched->thread);
> +	drm_sched_submit_start(sched);
>   }
>   EXPORT_SYMBOL(drm_sched_start);
>   
> @@ -1206,3 +1206,39 @@ void drm_sched_increase_karma(struct drm_sched_job *bad)
>   	}
>   }
>   EXPORT_SYMBOL(drm_sched_increase_karma);
> +
> +/**
> + * drm_sched_submit_ready - scheduler ready for submission
> + *
> + * @sched: scheduler instance
> + *
> + * Returns true if submission is ready
> + */
> +bool drm_sched_submit_ready(struct drm_gpu_scheduler *sched)
> +{
> +	return !!sched->thread;
> +
> +}
> +EXPORT_SYMBOL(drm_sched_submit_ready);
> +
> +/**
> + * drm_sched_submit_stop - stop scheduler submission
> + *
> + * @sched: scheduler instance
> + */
> +void drm_sched_submit_stop(struct drm_gpu_scheduler *sched)
> +{
> +	kthread_park(sched->thread);
> +}
> +EXPORT_SYMBOL(drm_sched_submit_stop);
> +
> +/**
> + * drm_sched_submit_start - start scheduler submission
> + *
> + * @sched: scheduler instance
> + */
> +void drm_sched_submit_start(struct drm_gpu_scheduler *sched)
> +{
> +	kthread_unpark(sched->thread);
> +}
> +EXPORT_SYMBOL(drm_sched_submit_start);
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index f9544d9b670d..f12c5aea5294 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -550,6 +550,9 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
>   
>   void drm_sched_job_cleanup(struct drm_sched_job *job);
>   void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched);
> +bool drm_sched_submit_ready(struct drm_gpu_scheduler *sched);
> +void drm_sched_submit_stop(struct drm_gpu_scheduler *sched);
> +void drm_sched_submit_start(struct drm_gpu_scheduler *sched);
>   void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad);
>   void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery);
>   void drm_sched_resubmit_jobs(struct drm_gpu_scheduler *sched);

