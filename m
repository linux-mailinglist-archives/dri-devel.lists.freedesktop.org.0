Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 995233409DC
	for <lists+dri-devel@lfdr.de>; Thu, 18 Mar 2021 17:16:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F34A26E91A;
	Thu, 18 Mar 2021 16:16:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2053.outbound.protection.outlook.com [40.107.100.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 686166E917;
 Thu, 18 Mar 2021 16:16:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LMAxEm0cjG0hrafdbIhAjRz2Cw0qOHqxDgECOYVMeLNB6M5oOsNhmDC5XsN7it+rHMYQunr3RgDFGFp/oMAfWJTUNBcbANw3kNI/5hmoqMfZ6zxYwAz6KqfHMeVc45dmriaJ2vbEy/F4Kl1fTxgUd/X6X8ZuQl3gkq2AcPUC58Lmqe/YbkRkMLxQClXTTbm2sKpKtiZ7/ccn7xnYEo8JmzXbD2KbftUC0Cl0CzKC+wa6u3V5xDinSLp9KyGAVeqNmR4X/0n7AxkKwmjskhnTEZT83MBRuRaNV379p+oYhblVZrrZpkkcf0UZrqT8oqhc43Gg0Z5kUCv5n/s7NrYGIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1zlnh/Z1MiMd9pkK/4CEtdeBLy4gy4R6PO/kZGSKXvw=;
 b=gLlT/xMNiwJ6elnV9TAhjHAhEwLPIEmkjJWZSbMV6KQ/xiJ+CwxhtdFi4fysf7iaBD1fUtxX3XQsg9FtSonRWjY14gbOWdP9hBcafzCT30P206pmuyUQ7OpawOopRNSeq66bkyOdba4xhWlUTPtgHM9FGFoqVtENu1eotqJpAvH5W6mrVOiKW/+H5e0NkSkziYN8ZGM0D5176zFxMAXilPixg0Ac9qPeL/5k7O6jctXbBa3449JxLzK4AlKXpeXT5A3ERFCnlNX2NjtHA4E5ih4HGi2xq5s/WhuLRSB9xcsnFSSF+J6ZvByDm+pk4lML2rwPYi0JO1HT7Msq5/li3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1zlnh/Z1MiMd9pkK/4CEtdeBLy4gy4R6PO/kZGSKXvw=;
 b=wezgpEHWg18A65y++7J/WqcI8ccqoBqNzk8opgoXGe+TljQeiCCDdCeva4EJKgxadSVsjD6lJ2tSjhFYW14v99IKRRJqqLV4R7EqHV0edem8+gLn82IwrPG/Pej9jPwVEIsVoTtxqg40zHu2No/uFjgNK3qxBwG+Bm0oF0regQ8=
Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SA0PR12MB4447.namprd12.prod.outlook.com (2603:10b6:806:9b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Thu, 18 Mar
 2021 16:16:48 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::29cb:752d:a8a7:24a8]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::29cb:752d:a8a7:24a8%6]) with mapi id 15.20.3955.018; Thu, 18 Mar 2021
 16:16:48 +0000
Subject: Re: [PATCH v3] drm/scheduler re-insert Bailing job to avoid memleak
To: "Zhang, Jack (Jian)" <Jack.Zhang1@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "Koenig, Christian" <Christian.Koenig@amd.com>, "Liu, Monk"
 <Monk.Liu@amd.com>, "Deng, Emily" <Emily.Deng@amd.com>,
 Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>
References: <20210315052036.1113638-1-Jack.Zhang1@amd.com>
 <DM5PR1201MB020453AA9A2A5C5173AF4D84BB6C9@DM5PR1201MB0204.namprd12.prod.outlook.com>
 <DM5PR1201MB020461EEDC275748389BB631BB6B9@DM5PR1201MB0204.namprd12.prod.outlook.com>
 <DM5PR1201MB020459FE1FFA08DD3A32F7B5BB6A9@DM5PR1201MB0204.namprd12.prod.outlook.com>
 <9b48b715-52dd-e435-2873-2472427dffda@gmail.com>
 <64583ef0-d19c-1906-91f2-70fd649fa46e@amd.com>
 <DM5PR1201MB0204ED9D2E367D2D4FE2D1DCBB6A9@DM5PR1201MB0204.namprd12.prod.outlook.com>
 <DM5PR1201MB02041495067BD0C46A8840B0BB699@DM5PR1201MB0204.namprd12.prod.outlook.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <b3125bab-a304-600b-21e9-9c3d0686e5a2@amd.com>
Date: Thu, 18 Mar 2021 12:16:43 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <DM5PR1201MB02041495067BD0C46A8840B0BB699@DM5PR1201MB0204.namprd12.prod.outlook.com>
Content-Language: en-US
X-Originating-IP: [2607:fea8:3edf:49b0:1c3b:54cf:fde7:cbb6]
X-ClientProxiedBy: YT2PR01CA0001.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::6) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:1c3b:54cf:fde7:cbb6]
 (2607:fea8:3edf:49b0:1c3b:54cf:fde7:cbb6) by
 YT2PR01CA0001.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:38::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.32 via Frontend Transport; Thu, 18 Mar 2021 16:16:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: cd840467-a4f0-4a50-6f5c-08d8ea293b12
X-MS-TrafficTypeDiagnostic: SA0PR12MB4447:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB44472118312578A1833FC95BEA699@SA0PR12MB4447.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2e3CcErd+sxPfPiX7NzcxvvPlHWIVR6TAke+lg61iDsctQQWdgVXhc8Fuo3vgyg8g5jq3xpkXR1DLs9CBjS7WMSq+HcH1aHkRgCfhCXSqHuLQpcZtT2wbRkrF5ZpCVBO9hitOLJZI4XOpmxe0ed2rvuXf0ojuGgRBKsKbLNPwPR29EHt7jr240YguFjKnqYv5x2aNJZPb1yMJiM/NpFSwyOg7Agk10VWxySDqiCzAwaDlKS7tAPjjgsKCZVe3TgjDMnagjTE8WNXfuSBl0OnZOUHG/1XqTav6SL5KSs9Y432yUWLdO5CEtgw+MRQgsnpnmeNfEK3RXdo5oESxhdUiS0eYctoG3kHssuIaHHIhFP3+fMBvnDKut89yLfx5UbQ6rGD8chRI1S4QlYxo9XJ2P8/wtImHznP/f69RjqFr8W+YbG6LdLbac1NhX5qQRZ6ClB++BqYST4CtSS9Z1/DP1VzZDbS7c6OncNsSHkQxNyZtKh2QUBwkh1N0U3+wjpVZaRDRVr5IXj+lXATu1lmzZXcyIR/+hViNxXlA12DGO0x6eGITklJhbWGIPra9HXOPE913UqJ7r4cTZKhC9SEXiBic2q1C63AkhVlRF6MFpaaz2nHoRJIesYTNFatQDMHI6niId41HBJ8otxflP2g4W+2Q7loNQ7XU87gWnms67xe+DZYjDovqkhYX0tulYVUEtnAlRYUyZShafJiQDDO+0eALLWTsbFT8DIKUoQ9eto=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(376002)(39860400002)(346002)(366004)(36756003)(44832011)(316002)(966005)(31686004)(66574015)(6486002)(52116002)(478600001)(38100700001)(166002)(2906002)(2616005)(110136005)(31696002)(66476007)(921005)(66556008)(66946007)(5660300002)(30864003)(83380400001)(33964004)(8676002)(16526019)(86362001)(186003)(8936002)(45080400002)(53546011)(45980500001)(43740500002)(579004)(559001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Q3NLUXdIQSs4a0VobG5nK0VBc3lDKzFwS3c5T245dDc3Z1ErYUNkbTJadUN6?=
 =?utf-8?B?Y1VyL1hLNXNBTzIzRmk4OUVHWG13MGZONFBFVk1XbVVpZjVnNXJUakN1TmJv?=
 =?utf-8?B?WU4zVFZqRkZ5SERSd0UwK01HMjZSR2l4T3Y5bGU1WDU1RHU2QnJmcmNrd1hJ?=
 =?utf-8?B?b1UxQVBTdXhMcEZVYmQwRWVjTnI5QUxVT1Z3RlloTWV1T3prTDZnOFE4SjFF?=
 =?utf-8?B?UldCekE1UWN6dnJqWitadmY3N1YxNDk1K24ySHBya0trc1pLOUpZOTRRS2xN?=
 =?utf-8?B?VVFvbzZOVyswMG45YTNkUFdrQis5azk3QmVvNGUxNnkxSkM5SHYzb0tEWVRO?=
 =?utf-8?B?SC9tRklpOVB4L1k3eUtnZVREMTcxblpyV3MzS0pFU0d0TmpFOXdmS3FycHVM?=
 =?utf-8?B?YWFtNE9hS1Ixb092Y0RNbGVPWHpNVy9rRkZOOGxneVJWaTZzdzFoNnhqaThq?=
 =?utf-8?B?YS9VbC9JL2pIQlZVRGpRK2xKNWJ4dk1KdENvTzdVbkZLdXlTSElVeTFrZmJa?=
 =?utf-8?B?bXVNNXJ0MVRKYVJQSlFpQVpaOUNvSHdxNVZ0bkxVMmJkMFhYck1SR1lGY3hY?=
 =?utf-8?B?VExVMnVTQ1BmTW05UXN1emNrNTVqWFpZQi9ic21mYWhiZUFvb0RaQzhaMXZN?=
 =?utf-8?B?aXRGWkVGRDZxWjFTalJIVXM0ZWJzY09mNUJWZnRNNXNPeVFqT2NjdHd2Qnln?=
 =?utf-8?B?LzRJWi9MUWVZZ2k1T2FMa3ZtK09Wdm1BMEVTa3N2SlhHTFA2SGIvekwwWXRq?=
 =?utf-8?B?NmRsNzZiSy9SMEVGM1NCTWJZRlA1S3N1NW9xeGNGVy83d0RTbk9LVjhuckRT?=
 =?utf-8?B?Qzc5cGtaRkhvTzUrUExGQmFoenRnMDVsV1NacTVqWUlnNHpaYms4aFpPSkVr?=
 =?utf-8?B?ejRQUkRvaWFhVU9vQXNHWk56QWVwK0dXMGNiMjl4NjJGWHVkRkNCWnR5VUFL?=
 =?utf-8?B?aXMwNGVnN3d3QzNHZkFnQittcWNtUXdPZE5kbklLWXVydXExY1JhWk5lRUJh?=
 =?utf-8?B?UmhNaDJ4cVcyVXlHSW5GZjVRcDY2N3k0eWdiMTNRSmtSY1VUS3RaYjkzeFpW?=
 =?utf-8?B?TCtYSm5YeGxSdFB5SWpyQlFiSG9nVjNyNUV0c1lneHd0cnZ0Tys2Z0FRUzQ0?=
 =?utf-8?B?L1RsdytvTFo3NTM3RHNGRkNqSjRiR0k0Nm5jajRCdndSeUR0ZE9RYmRzZFc2?=
 =?utf-8?B?bUxTUHJEbWhyekkrVnVHd2djSUtFeTI4SXhyd0FaSnBodFJ4L1BuaGNGVnRk?=
 =?utf-8?B?WnJzbkZJRlQ4b0l5S2FSb0hYakJRbXdQanVBN1g4UlBWb1FiQmUycVMySTNB?=
 =?utf-8?B?QWNuMjh5YTlmZS9jbWorZ1ErZ2QzZDlIdkErdjJIdnZTNW0vRWxLc0NtV2Fy?=
 =?utf-8?B?NUFhVy9EYlY1MDlmcmQzWCtXZHpRQks5UjhuSlVDdWdaa1BxU1BMRFhVRGVl?=
 =?utf-8?B?QkNReFdRL3J4NHdPRUJuOVp0SitxUEdqUzZxOHhIckk2ODZnNDBmM3JtcUpV?=
 =?utf-8?B?bU5sUTVZVlpRMG8yRzBCYkl2MVZZZG5wR2U2Qml3am03eFcvV0V4eWNpMVBM?=
 =?utf-8?B?QStQV2JJYmRjTnY5S3ZVVWZjd0cwOU80QnloNXhPbnBUZUxXZTBlemo5L2gz?=
 =?utf-8?B?ZDYrWFJpTTZkdWJXcm9YM3lUTGxGQ055MlphdFdXMDJBTkZHUDZZNENOZHZB?=
 =?utf-8?B?UDVzL2t3aURwUHJreVMvRjZPNHlVOFlId0grS2pvRzJNTkN0WVJseDVtNWpL?=
 =?utf-8?B?VGZBTTRjR0tDNStwQ1ZsdEdCY0ZSOFNKOEZXWCtGd3BPVkxWaDVWRCtucE9J?=
 =?utf-8?B?eWlBMWV2blBMbkU3Q0VVMW1hZzRYQWNJd0tuMVJGS0xEcHl1YSs2ajZvTlJk?=
 =?utf-8?Q?zqf5g+KuoG/tS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd840467-a4f0-4a50-6f5c-08d8ea293b12
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2021 16:16:48.5693 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6wXW+X7EdHKKydR6r+K7o8qaP1MdQeWKNknSkySJ6q1TydreFtcZ7ApTJymj2HhRxcUSbFBdjTENhcubF3/RtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4447
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
Content-Type: multipart/mixed; boundary="===============0923773291=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0923773291==
Content-Type: multipart/alternative;
 boundary="------------C116BE7F8D01D76004381426"
Content-Language: en-US

--------------C116BE7F8D01D76004381426
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2021-03-18 6:41 a.m., Zhang, Jack (Jian) wrote:
>
> [AMD Official Use Only - Internal Distribution Only]
>
>
> Hi, Andrey
>
> Let me summarize the background of this patch:
>
> In TDR resubmit step “amdgpu_device_recheck_guilty_jobs,
>
> It will submit first jobs of each ring and do guilty job re-check.
>
> At that point, We had to make sure each job is in the mirror list(or 
> re-inserted back already).
>
> But we found the current code never re-insert the job to mirror list 
> in the 2^nd , 3^rd job_timeout thread(Bailing TDR thread).
>
> This not only will cause memleak of the bailing jobs. What’s more 
> important, the 1^st tdr thread can never iterate the bailing job and 
> set its guilty status to a correct status.
>
> Therefore, we had to re-insert the job(or even not delete node) for 
> bailing job.
>
> For the above V3 patch, the racing condition in my mind is:
>
> we cannot make sure all bailing jobs are finished before we do 
> amdgpu_device_recheck_guilty_jobs.
>

Yes,that race i missed - so you say that for 2nd, baling thread who 
extracted the job, even if he reinsert it right away back after driver 
callback return DRM_GPU_SCHED_STAT_BAILING, there is small time slot 
where the job is not in mirror list and so the 1st TDR might miss it and 
not find that  2nd job is the actual guilty job, right ? But, still this 
job will get back into mirror list, and since it's really the bad job, 
it will never signal completion and so on the next timeout cycle it will 
be caught (of course there is a starvation scenario here if more TDRs 
kick in and it bails out again but this is really unlikely).


> Based on this insight, I think we have two options to solve this issue:
>
>  1. Skip delete node in tdr thread2, thread3, 4 … (using mutex or
>     atomic variable)
>  2. Re-insert back bailing job, and meanwhile use semaphore in each
>     tdr thread to keep the sequence as expected and ensure each job is
>     in the mirror list when do resubmit step.
>
> For Option1, logic is simpler and we need only one global atomic variable:
>
> What do you think about this plan?
>
> Option1 should look like the following logic:
>
> +static atomic_t in_reset; //a global atomic var for synchronization
>
> static void drm_sched_process_job(struct dma_fence *f, struct 
> dma_fence_cb *cb);
>
>  /**
>
> @@ -295,6 +296,12 @@ static void drm_sched_job_timedout(struct 
> work_struct *work)
>
>                  * drm_sched_cleanup_jobs. It will be reinserted back 
> after sched->thread
>
>                  * is parked at which point it's safe.
>
>                  */
>
> +               if (atomic_cmpxchg(&in_reset, 0, 1) != 0) {  //skip 
> delete node if it’s thead1,2,3,….
>
> + spin_unlock(&sched->job_list_lock);
>
> + drm_sched_start_timeout(sched);
>
> +                       return;
>
> +               }
>
> +
>
> list_del_init(&job->node);
>
> spin_unlock(&sched->job_list_lock);
>
> @@ -320,6 +327,7 @@ static void drm_sched_job_timedout(struct 
> work_struct *work)
>
> spin_lock(&sched->job_list_lock);
>
>         drm_sched_start_timeout(sched);
>
> spin_unlock(&sched->job_list_lock);
>
> +       atomic_set(&in_reset, 0); //reset in_reset when the first 
> thread finished tdr
>
> }
>

Technically looks like it should work as you don't access the job 
pointer any longer and so no risk that if signaled it will be freed by 
drm_sched_get_cleanup_job but,you can't just use one global variable an 
by this bailing from TDR when different drivers run their TDR threads in 
parallel, and even for amdgpu, if devices in different XGMI hives or 2 
independent devices in non XGMI setup. There should be defined some kind 
of GPU reset group structure on drm_scheduler level for which this 
variable would be used.

P.S I wonder why we can't just ref-count the job so that even if 
drm_sched_get_cleanup_job would delete it before we had a chance to stop 
the scheduler thread, we wouldn't crash. This would avoid all the dance 
with deletion and reinsertion.

Andrey


> Thanks,
>
> Jack
>
> *From:* amd-gfx <amd-gfx-bounces@lists.freedesktop.org> *On Behalf Of 
> *Zhang, Jack (Jian)
> *Sent:* Wednesday, March 17, 2021 11:11 PM
> *To:* Christian König <ckoenig.leichtzumerken@gmail.com>; 
> dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org; 
> Koenig, Christian <Christian.Koenig@amd.com>; Liu, Monk 
> <Monk.Liu@amd.com>; Deng, Emily <Emily.Deng@amd.com>; Rob Herring 
> <robh@kernel.org>; Tomeu Vizoso <tomeu.vizoso@collabora.com>; Steven 
> Price <steven.price@arm.com>; Grodzovsky, Andrey 
> <Andrey.Grodzovsky@amd.com>
> *Subject:* Re: [PATCH v3] drm/scheduler re-insert Bailing job to avoid 
> memleak
>
> [AMD Official Use Only - Internal Distribution Only]
>
> [AMD Official Use Only - Internal Distribution Only]
>
> Hi，Andrey，
>
> Good catch，I will expore this corner case and give feedback soon～
>
> Best，
>
> Jack
>
> ------------------------------------------------------------------------
>
> *From:*Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com 
> <mailto:Andrey.Grodzovsky@amd.com>>
> *Sent:* Wednesday, March 17, 2021 10:50:59 PM
> *To:* Christian König <ckoenig.leichtzumerken@gmail.com 
> <mailto:ckoenig.leichtzumerken@gmail.com>>; Zhang, Jack (Jian) 
> <Jack.Zhang1@amd.com <mailto:Jack.Zhang1@amd.com>>; 
> dri-devel@lists.freedesktop.org 
> <mailto:dri-devel@lists.freedesktop.org> 
> <dri-devel@lists.freedesktop.org 
> <mailto:dri-devel@lists.freedesktop.org>>; 
> amd-gfx@lists.freedesktop.org <mailto:amd-gfx@lists.freedesktop.org> 
> <amd-gfx@lists.freedesktop.org 
> <mailto:amd-gfx@lists.freedesktop.org>>; Koenig, Christian 
> <Christian.Koenig@amd.com <mailto:Christian.Koenig@amd.com>>; Liu, 
> Monk <Monk.Liu@amd.com <mailto:Monk.Liu@amd.com>>; Deng, Emily 
> <Emily.Deng@amd.com <mailto:Emily.Deng@amd.com>>; Rob Herring 
> <robh@kernel.org <mailto:robh@kernel.org>>; Tomeu Vizoso 
> <tomeu.vizoso@collabora.com <mailto:tomeu.vizoso@collabora.com>>; 
> Steven Price <steven.price@arm.com <mailto:steven.price@arm.com>>
> *Subject:* Re: [PATCH v3] drm/scheduler re-insert Bailing job to avoid 
> memleak
>
> I actually have a race condition concern here - see bellow -
>
> On 2021-03-17 3:43 a.m., Christian König wrote:
> > I was hoping Andrey would take a look since I'm really busy with other
> > work right now.
> >
> > Regards,
> > Christian.
> >
> > Am 17.03.21 um 07:46 schrieb Zhang, Jack (Jian):
> >> Hi, Andrey/Crhistian and Team,
> >>
> >> I didn't receive the reviewer's message from maintainers on panfrost
> >> driver for several days.
> >> Due to this patch is urgent for my current working project.
> >> Would you please help to give some review ideas?
> >>
> >> Many Thanks,
> >> Jack
> >> -----Original Message-----
> >> From: Zhang, Jack (Jian)
> >> Sent: Tuesday, March 16, 2021 3:20 PM
> >> To: dri-devel@lists.freedesktop.org 
> <mailto:dri-devel@lists.freedesktop.org>; 
> amd-gfx@lists.freedesktop.org <mailto:amd-gfx@lists.freedesktop.org>;
> >> Koenig, Christian <Christian.Koenig@amd.com 
> <mailto:Christian.Koenig@amd.com>>; Grodzovsky, Andrey
> >> <Andrey.Grodzovsky@amd.com <mailto:Andrey.Grodzovsky@amd.com>>; 
> Liu, Monk <Monk.Liu@amd.com <mailto:Monk.Liu@amd.com>>; Deng,
> >> Emily <Emily.Deng@amd.com <mailto:Emily.Deng@amd.com>>; Rob Herring 
> <robh@kernel.org <mailto:robh@kernel.org>>; Tomeu
> >> Vizoso <tomeu.vizoso@collabora.com 
> <mailto:tomeu.vizoso@collabora.com>>; Steven Price 
> <steven.price@arm.com <mailto:steven.price@arm.com>>
> >> Subject: RE: [PATCH v3] drm/scheduler re-insert Bailing job to avoid
> >> memleak
> >>
> >> [AMD Public Use]
> >>
> >> Ping
> >>
> >> -----Original Message-----
> >> From: Zhang, Jack (Jian)
> >> Sent: Monday, March 15, 2021 1:24 PM
> >> To: Jack Zhang <Jack.Zhang1@amd.com <mailto:Jack.Zhang1@amd.com>>;
> >> dri-devel@lists.freedesktop.org 
> <mailto:dri-devel@lists.freedesktop.org>; 
> amd-gfx@lists.freedesktop.org <mailto:amd-gfx@lists.freedesktop.org>;
> >> Koenig, Christian <Christian.Koenig@amd.com 
> <mailto:Christian.Koenig@amd.com>>; Grodzovsky, Andrey
> >> <Andrey.Grodzovsky@amd.com <mailto:Andrey.Grodzovsky@amd.com>>; 
> Liu, Monk <Monk.Liu@amd.com <mailto:Monk.Liu@amd.com>>; Deng,
> >> Emily <Emily.Deng@amd.com <mailto:Emily.Deng@amd.com>>; Rob Herring 
> <robh@kernel.org <mailto:robh@kernel.org>>; Tomeu
> >> Vizoso <tomeu.vizoso@collabora.com 
> <mailto:tomeu.vizoso@collabora.com>>; Steven Price 
> <steven.price@arm.com <mailto:steven.price@arm.com>>
> >> Subject: RE: [PATCH v3] drm/scheduler re-insert Bailing job to avoid
> >> memleak
> >>
> >> [AMD Public Use]
> >>
> >> Hi, Rob/Tomeu/Steven,
> >>
> >> Would you please help to review this patch for panfrost driver?
> >>
> >> Thanks,
> >> Jack Zhang
> >>
> >> -----Original Message-----
> >> From: Jack Zhang <Jack.Zhang1@amd.com <mailto:Jack.Zhang1@amd.com>>
> >> Sent: Monday, March 15, 2021 1:21 PM
> >> To: dri-devel@lists.freedesktop.org 
> <mailto:dri-devel@lists.freedesktop.org>; 
> amd-gfx@lists.freedesktop.org <mailto:amd-gfx@lists.freedesktop.org>;
> >> Koenig, Christian <Christian.Koenig@amd.com 
> <mailto:Christian.Koenig@amd.com>>; Grodzovsky, Andrey
> >> <Andrey.Grodzovsky@amd.com <mailto:Andrey.Grodzovsky@amd.com>>; 
> Liu, Monk <Monk.Liu@amd.com <mailto:Monk.Liu@amd.com>>; Deng,
> >> Emily <Emily.Deng@amd.com <mailto:Emily.Deng@amd.com>>
> >> Cc: Zhang, Jack (Jian) <Jack.Zhang1@amd.com 
> <mailto:Jack.Zhang1@amd.com>>
> >> Subject: [PATCH v3] drm/scheduler re-insert Bailing job to avoid 
> memleak
> >>
> >> re-insert Bailing jobs to avoid memory leak.
> >>
> >> V2: move re-insert step to drm/scheduler logic
> >> V3: add panfrost's return value for bailing jobs in case it hits the
> >> memleak issue.
> >>
> >> Signed-off-by: Jack Zhang <Jack.Zhang1@amd.com 
> <mailto:Jack.Zhang1@amd.com>>
> >> ---
> >> drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 4 +++-
> >> drivers/gpu/drm/amd/amdgpu/amdgpu_job.c    | 8 ++++++--
> >> drivers/gpu/drm/panfrost/panfrost_job.c    | 4 ++--
> >> drivers/gpu/drm/scheduler/sched_main.c     | 8 +++++++-
> >> include/drm/gpu_scheduler.h                | 1 +
> >>   5 files changed, 19 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> >> b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> >> index 79b9cc73763f..86463b0f936e 100644
> >> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> >> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> >> @@ -4815,8 +4815,10 @@ int amdgpu_device_gpu_recover(struct
> >> amdgpu_device *adev,
> >>                       job ? job->base.id : -1);
> >>             /* even we skipped this reset, still need to set the job
> >> to guilty */
> >> -        if (job)
> >> +        if (job) {
> >> drm_sched_increase_karma(&job->base);
> >> +            r = DRM_GPU_SCHED_STAT_BAILING;
> >> +        }
> >>           goto skip_recovery;
> >>       }
> >>   diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> >> b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> >> index 759b34799221..41390bdacd9e 100644
> >> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> >> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> >> @@ -34,6 +34,7 @@ static enum drm_gpu_sched_stat
> >> amdgpu_job_timedout(struct drm_sched_job *s_job)
> >>       struct amdgpu_job *job = to_amdgpu_job(s_job);
> >>       struct amdgpu_task_info ti;
> >>       struct amdgpu_device *adev = ring->adev;
> >> +    int ret;
> >>         memset(&ti, 0, sizeof(struct amdgpu_task_info));
> >>   @@ -52,8 +53,11 @@ static enum drm_gpu_sched_stat
> >> amdgpu_job_timedout(struct drm_sched_job *s_job)
> >>             ti.process_name, ti.tgid, ti.task_name, ti.pid);
> >>         if (amdgpu_device_should_recover_gpu(ring->adev)) {
> >> - amdgpu_device_gpu_recover(ring->adev, job);
> >> -        return DRM_GPU_SCHED_STAT_NOMINAL;
> >> +        ret = amdgpu_device_gpu_recover(ring->adev, job);
> >> +        if (ret == DRM_GPU_SCHED_STAT_BAILING)
> >> +            return DRM_GPU_SCHED_STAT_BAILING;
> >> +        else
> >> +            return DRM_GPU_SCHED_STAT_NOMINAL;
> >>       } else {
> >> drm_sched_suspend_timeout(&ring->sched);
> >>           if (amdgpu_sriov_vf(adev))
> >> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c
> >> b/drivers/gpu/drm/panfrost/panfrost_job.c
> >> index 6003cfeb1322..e2cb4f32dae1 100644
> >> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> >> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> >> @@ -444,7 +444,7 @@ static enum drm_gpu_sched_stat
> >> panfrost_job_timedout(struct drm_sched_job
> >>        * spurious. Bail out.
> >>        */
> >>       if (dma_fence_is_signaled(job->done_fence))
> >> -        return DRM_GPU_SCHED_STAT_NOMINAL;
> >> +        return DRM_GPU_SCHED_STAT_BAILING;
> >>         dev_err(pfdev->dev, "gpu sched timeout, js=%d, config=0x%x,
> >> status=0x%x, head=0x%x, tail=0x%x, sched_job=%p",
> >>           js,
> >> @@ -456,7 +456,7 @@ static enum drm_gpu_sched_stat
> >> panfrost_job_timedout(struct drm_sched_job
> >>         /* Scheduler is already stopped, nothing to do. */
> >>       if (!panfrost_scheduler_stop(&pfdev->js->queue[js], sched_job))
> >> -        return DRM_GPU_SCHED_STAT_NOMINAL;
> >> +        return DRM_GPU_SCHED_STAT_BAILING;
> >>         /* Schedule a reset if there's no reset in progress. */
> >>       if (!atomic_xchg(&pfdev->reset.pending, 1)) diff --git
> >> a/drivers/gpu/drm/scheduler/sched_main.c
> >> b/drivers/gpu/drm/scheduler/sched_main.c
> >> index 92d8de24d0a1..a44f621fb5c4 100644
> >> --- a/drivers/gpu/drm/scheduler/sched_main.c
> >> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> >> @@ -314,6 +314,7 @@ static void drm_sched_job_timedout(struct
> >> work_struct *work)  {
> >>       struct drm_gpu_scheduler *sched;
> >>       struct drm_sched_job *job;
> >> +    int ret;
> >>         sched = container_of(work, struct drm_gpu_scheduler,
> >> work_tdr.work);
> >>   @@ -331,8 +332,13 @@ static void drm_sched_job_timedout(struct
> >> work_struct *work)
> >>           list_del_init(&job->list);
> >> spin_unlock(&sched->job_list_lock);
> >>   - job->sched->ops->timedout_job(job);
> >> +        ret = job->sched->ops->timedout_job(job);
> >>   +        if (ret == DRM_GPU_SCHED_STAT_BAILING) {
> >> + spin_lock(&sched->job_list_lock);
> >> +            list_add(&job->node, &sched->ring_mirror_list);
> >> + spin_unlock(&sched->job_list_lock);
> >> +        }
>
>
> At this point we don't hold GPU reset locks anymore, and so we could
> be racing against another TDR thread from another scheduler ring of same
> device
> or another XGMI hive member. The other thread might be in the middle of
> luckless
> iteration of mirror list (drm_sched_stop, drm_sched_start and
> drm_sched_resubmit)
> and so locking job_list_lock will not help. Looks like it's required to
> take all GPU rest locks
> here.
>
> Andrey
>
>
> >>           /*
> >>            * Guilty job did complete and hence needs to be manually
> >> removed
> >>            * See drm_sched_stop doc.
> >> diff --git a/include/drm/gpu_scheduler.h
> >> b/include/drm/gpu_scheduler.h index 4ea8606d91fe..8093ac2427ef 100644
> >> --- a/include/drm/gpu_scheduler.h
> >> +++ b/include/drm/gpu_scheduler.h
> >> @@ -210,6 +210,7 @@ enum drm_gpu_sched_stat {
> >>       DRM_GPU_SCHED_STAT_NONE, /* Reserve 0 */
> >>       DRM_GPU_SCHED_STAT_NOMINAL,
> >>       DRM_GPU_SCHED_STAT_ENODEV,
> >> +    DRM_GPU_SCHED_STAT_BAILING,
> >>   };
> >>     /**
> >> --
> >> 2.25.1
> >> _______________________________________________
> >> amd-gfx mailing list
> >> amd-gfx@lists.freedesktop.org <mailto:amd-gfx@lists.freedesktop.org>
> >> 
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=04%7C01%7CAndrey.Grodzovsky%40amd.com%7Ce90f30af0f43444c6aea08d8e91860c4%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637515638213180413%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=NnLqtz%2BZ8%2BweYwCqRinrfkqmhzibNAF6CYSdVqL6xi0%3D&amp;reserved=0 
> <https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&data=04%7C01%7CJack.Zhang1%40amd.com%7C95b2ff206ee74bbe520a08d8e956f5dd%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637515907000888939%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C2000&sdata=BGoSfOYiDar8SrpMx%2BsOMWpaMr87bxB%2F9ycu0FhhipA%3D&reserved=0> 
>
> >>
> >
>

--------------C116BE7F8D01D76004381426
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-03-18 6:41 a.m., Zhang, Jack
      (Jian) wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:DM5PR1201MB02041495067BD0C46A8840B0BB699@DM5PR1201MB0204.namprd12.prod.outlook.com">
      
      <meta name="Generator" content="Microsoft Word 15 (filtered
        medium)">
      <!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]-->
      <style>@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}@font-face
	{font-family:"\@DengXian";
	panose-1:2 1 6 0 3 1 1 1 1 1;}@font-face
	{font-family:"Microsoft YaHei";
	panose-1:2 11 5 3 2 2 4 2 2 4;}@font-face
	{font-family:"\@Microsoft YaHei";}p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:.5in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}div.WordSection1
	{page:WordSection1;}ol
	{margin-bottom:0in;}ul
	{margin-bottom:0in;}</style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext="edit" spidmax="1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext="edit">
<o:idmap v:ext="edit" data="1" />
</o:shapelayout></xml><![endif]-->
      <p style="font-family:Arial;font-size:11pt;color:#0078D7;margin:5pt;" align="Left">
        [AMD Official Use Only - Internal Distribution Only]<br>
      </p>
      <br>
      <div>
        <div class="WordSection1">
          <p class="MsoNormal">Hi, Andrey<o:p></o:p></p>
          <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
          <p class="MsoNormal">Let me summarize the background of this
            patch:<o:p></o:p></p>
          <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
          <p class="MsoNormal">In TDR resubmit step
            “amdgpu_device_recheck_guilty_jobs,<o:p></o:p></p>
          <p class="MsoNormal">It will submit first jobs of each ring
            and do guilty job re-check.
            <o:p></o:p></p>
          <p class="MsoNormal">At that point, We had to make sure each
            job is in the mirror list(or re-inserted back already).<o:p></o:p></p>
          <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
          <p class="MsoNormal">But we found the current code never
            re-insert the job to mirror list in the 2<sup>nd</sup>, 3<sup>rd</sup>
            job_timeout thread(Bailing TDR thread).<o:p></o:p></p>
          <p class="MsoNormal">This not only will cause memleak of the
            bailing jobs. What’s more important, the 1<sup>st</sup> tdr
            thread can never iterate the bailing job and set its guilty
            status to a correct status.<o:p></o:p></p>
          <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
          <p class="MsoNormal">Therefore, we had to re-insert the job(or
            even not delete node) for bailing job.<o:p></o:p></p>
          <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
          <p class="MsoNormal">For the above V3 patch, the racing
            condition in my mind is:<o:p></o:p></p>
          <p class="MsoNormal">we cannot make sure all bailing jobs are
            finished before we do amdgpu_device_recheck_guilty_jobs.</p>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <p>Yes,that race i missed - so you say that for 2nd, baling thread
      who extracted the job, even if he reinsert it right away back
      after driver callback return DRM_GPU_SCHED_STAT_BAILING, there is
      small time slot where the job is not in mirror list and so the 1st
      TDR might miss it and not find that&nbsp; 2nd job is the actual guilty
      job, right ? But, still this job will get back into mirror list,
      and since it's really the bad job, it will never signal completion
      and so on the next timeout cycle it will be caught (of course
      there is a starvation scenario here if more TDRs kick in and it
      bails out again but this is really unlikely).<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:DM5PR1201MB02041495067BD0C46A8840B0BB699@DM5PR1201MB0204.namprd12.prod.outlook.com">
      <div>
        <div class="WordSection1">
          <p class="MsoNormal"><o:p></o:p></p>
          <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
          <p class="MsoNormal">Based on this insight, I think we have
            two options to solve this issue:<o:p></o:p></p>
          <ol style="margin-top:0in" type="1" start="1">
            <li class="MsoListParagraph" style="margin-left:0in;mso-list:l0 level1 lfo1">Skip
              delete node in tdr thread2, thread3, 4 … (using mutex or
              atomic variable)<o:p></o:p></li>
            <li class="MsoListParagraph" style="margin-left:0in;mso-list:l0 level1 lfo1">Re-insert
              back bailing job, and meanwhile use semaphore in each tdr
              thread to keep the sequence as expected and ensure each
              job is in the mirror list when do resubmit step.<o:p></o:p></li>
          </ol>
          <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
          <p class="MsoNormal">For Option1, logic is simpler and we need
            only one global atomic variable:<o:p></o:p></p>
          <p class="MsoNormal">What do you think about this plan?<o:p></o:p></p>
          <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
          <p class="MsoNormal">Option1 should look like the following
            logic:<o:p></o:p></p>
          <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
          <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
          <p class="MsoNormal">+static atomic_t in_reset;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            //a global atomic var for synchronization<o:p></o:p></p>
          <p class="MsoNormal">static void drm_sched_process_job(struct
            dma_fence *f, struct dma_fence_cb *cb);<o:p></o:p></p>
          <p class="MsoNormal"><o:p></o:p></p>
          <p class="MsoNormal">&nbsp;/**<o:p></o:p></p>
          <p class="MsoNormal">@@ -295,6 +296,12 @@ static void
            drm_sched_job_timedout(struct work_struct *work)<o:p></o:p></p>
          <p class="MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *
            drm_sched_cleanup_jobs. It will be reinserted back after
            sched-&gt;thread<o:p></o:p></p>
          <p class="MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * is parked at which
            point it's safe.<o:p></o:p></p>
          <p class="MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<o:p></o:p></p>
          <p class="MsoNormal">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if
            (atomic_cmpxchg(&amp;in_reset, 0, 1) != 0) {&nbsp; //skip delete
            node if it’s thead1,2,3,….<o:p></o:p></p>
          <p class="MsoNormal">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            spin_unlock(&amp;sched-&gt;job_list_lock);<o:p></o:p></p>
          <p class="MsoNormal">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            drm_sched_start_timeout(sched);<o:p></o:p></p>
          <p class="MsoNormal">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return;<o:p></o:p></p>
          <p class="MsoNormal">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<o:p></o:p></p>
          <p class="MsoNormal">+<o:p></o:p></p>
          <p class="MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            list_del_init(&amp;job-&gt;node);<o:p></o:p></p>
          <p class="MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            spin_unlock(&amp;sched-&gt;job_list_lock);<o:p></o:p></p>
          <p class="MsoNormal"><o:p></o:p></p>
          <p class="MsoNormal">@@ -320,6 +327,7 @@ static void
            drm_sched_job_timedout(struct work_struct *work)<o:p></o:p></p>
          <p class="MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            spin_lock(&amp;sched-&gt;job_list_lock);<o:p></o:p></p>
          <p class="MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_sched_start_timeout(sched);<o:p></o:p></p>
          <p class="MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            spin_unlock(&amp;sched-&gt;job_list_lock);<o:p></o:p></p>
          <p class="MsoNormal">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; atomic_set(&amp;in_reset, 0);
            //reset in_reset when the first thread finished tdr<o:p></o:p></p>
          <p class="MsoNormal">}</p>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <p>Technically looks like it should work as you don't access the job
      pointer any longer and so no risk that if signaled it will be
      freed by drm_sched_get_cleanup_job but,you can't just use one
      global variable an by this bailing from TDR when different drivers
      run their TDR threads in parallel, and even for amdgpu, if devices
      in different XGMI hives or 2 independent devices in non XGMI
      setup. There should be defined some kind of GPU reset group
      structure on drm_scheduler level for which this variable would be
      used.</p>
    <p>P.S I wonder why we can't just ref-count the job so that even if
      drm_sched_get_cleanup_job would delete it before we had a chance
      to stop the scheduler thread, we wouldn't crash. This would avoid
      all the dance with deletion and reinsertion.<br>
    </p>
    <p>Andrey</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:DM5PR1201MB02041495067BD0C46A8840B0BB699@DM5PR1201MB0204.namprd12.prod.outlook.com">
      <div>
        <div class="WordSection1">
          <p class="MsoNormal"><o:p></o:p></p>
          <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
          <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
          <p class="MsoNormal">Thanks,<o:p></o:p></p>
          <p class="MsoNormal">Jack<o:p></o:p></p>
          <div>
            <div style="border:none;border-top:solid #E1E1E1
              1.0pt;padding:3.0pt 0in 0in 0in">
              <p class="MsoNormal"><b>From:</b> amd-gfx
                <a class="moz-txt-link-rfc2396E" href="mailto:amd-gfx-bounces@lists.freedesktop.org">&lt;amd-gfx-bounces@lists.freedesktop.org&gt;</a>
                <b>On Behalf Of </b>Zhang, Jack (Jian)<br>
                <b>Sent:</b> Wednesday, March 17, 2021 11:11 PM<br>
                <b>To:</b> Christian König
                <a class="moz-txt-link-rfc2396E" href="mailto:ckoenig.leichtzumerken@gmail.com">&lt;ckoenig.leichtzumerken@gmail.com&gt;</a>;
                <a class="moz-txt-link-abbreviated" href="mailto:dri-devel@lists.freedesktop.org">dri-devel@lists.freedesktop.org</a>;
                <a class="moz-txt-link-abbreviated" href="mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.org</a>; Koenig, Christian
                <a class="moz-txt-link-rfc2396E" href="mailto:Christian.Koenig@amd.com">&lt;Christian.Koenig@amd.com&gt;</a>; Liu, Monk
                <a class="moz-txt-link-rfc2396E" href="mailto:Monk.Liu@amd.com">&lt;Monk.Liu@amd.com&gt;</a>; Deng, Emily
                <a class="moz-txt-link-rfc2396E" href="mailto:Emily.Deng@amd.com">&lt;Emily.Deng@amd.com&gt;</a>; Rob Herring
                <a class="moz-txt-link-rfc2396E" href="mailto:robh@kernel.org">&lt;robh@kernel.org&gt;</a>; Tomeu Vizoso
                <a class="moz-txt-link-rfc2396E" href="mailto:tomeu.vizoso@collabora.com">&lt;tomeu.vizoso@collabora.com&gt;</a>; Steven Price
                <a class="moz-txt-link-rfc2396E" href="mailto:steven.price@arm.com">&lt;steven.price@arm.com&gt;</a>; Grodzovsky, Andrey
                <a class="moz-txt-link-rfc2396E" href="mailto:Andrey.Grodzovsky@amd.com">&lt;Andrey.Grodzovsky@amd.com&gt;</a><br>
                <b>Subject:</b> Re: [PATCH v3] drm/scheduler re-insert
                Bailing job to avoid memleak<o:p></o:p></p>
            </div>
          </div>
          <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
          <p style="margin:5.0pt"><span style="font-family:&quot;Arial&quot;,sans-serif;color:#0078D7">[AMD
              Official Use Only - Internal Distribution Only]<o:p></o:p></span></p>
          <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
          <div>
            <p style="margin:5.0pt"><span style="font-family:&quot;Arial&quot;,sans-serif;color:#0078D7">[AMD
                Official Use Only - Internal Distribution Only]<o:p></o:p></span></p>
            <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
            <div>
              <p class="MsoNormal"><span style="font-family:&quot;Arial&quot;,sans-serif;color:black">Hi</span><span style="font-family:&quot;Microsoft
                  YaHei&quot;,sans-serif;color:black" lang="ZH-CN">，</span><span style="font-family:&quot;Arial&quot;,sans-serif;color:black">Andrey</span><span style="font-family:&quot;Microsoft
                  YaHei&quot;,sans-serif;color:black" lang="ZH-CN">，</span><span style="font-family:&quot;Arial&quot;,sans-serif;color:black"><o:p></o:p></span></p>
              <div>
                <p class="MsoNormal"><span style="font-family:&quot;Arial&quot;,sans-serif;color:black"><o:p>&nbsp;</o:p></span></p>
              </div>
              <div>
                <p class="MsoNormal" style="margin-bottom:12.0pt"><span style="font-family:&quot;Arial&quot;,sans-serif;color:black">Good catch</span><span style="font-family:&quot;Microsoft
                    YaHei&quot;,sans-serif;color:black" lang="ZH-CN">，</span><span style="font-family:&quot;Arial&quot;,sans-serif;color:black">I will
                    expore this corner case and give feedback soon</span><span style="font-family:&quot;Microsoft
                    YaHei&quot;,sans-serif;color:black" lang="ZH-CN">～</span><span style="font-family:&quot;Arial&quot;,sans-serif;color:black"><o:p></o:p></span></p>
              </div>
              <div>
                <p class="MsoNormal"><span style="font-family:&quot;Arial&quot;,sans-serif;color:black">Best</span><span style="font-family:&quot;Microsoft
                    YaHei&quot;,sans-serif;color:black" lang="ZH-CN">，</span><span style="font-family:&quot;Arial&quot;,sans-serif;color:black"><o:p></o:p></span></p>
              </div>
              <p class="MsoNormal"><span style="font-family:&quot;Arial&quot;,sans-serif;color:black">Jack<o:p></o:p></span></p>
              <div>
                <p class="MsoNormal"><span style="font-family:&quot;Arial&quot;,sans-serif;color:black"><o:p>&nbsp;</o:p></span></p>
              </div>
              <div class="MsoNormal" style="text-align:center" align="center">
                <hr width="98%" size="2" align="center">
              </div>
              <div id="divRplyFwdMsg">
                <p class="MsoNormal"><b><span style="color:black">From:</span></b><span style="color:black"> Grodzovsky, Andrey &lt;<a href="mailto:Andrey.Grodzovsky@amd.com" moz-do-not-send="true">Andrey.Grodzovsky@amd.com</a>&gt;<br>
                    <b>Sent:</b> Wednesday, March 17, 2021 10:50:59 PM<br>
                    <b>To:</b> Christian König &lt;<a href="mailto:ckoenig.leichtzumerken@gmail.com" moz-do-not-send="true">ckoenig.leichtzumerken@gmail.com</a>&gt;;
                    Zhang, Jack (Jian) &lt;<a href="mailto:Jack.Zhang1@amd.com" moz-do-not-send="true">Jack.Zhang1@amd.com</a>&gt;;
                    <a href="mailto:dri-devel@lists.freedesktop.org" moz-do-not-send="true">dri-devel@lists.freedesktop.org</a>
                    &lt;<a href="mailto:dri-devel@lists.freedesktop.org" moz-do-not-send="true">dri-devel@lists.freedesktop.org</a>&gt;;
                    <a href="mailto:amd-gfx@lists.freedesktop.org" moz-do-not-send="true">amd-gfx@lists.freedesktop.org</a>
                    &lt;<a href="mailto:amd-gfx@lists.freedesktop.org" moz-do-not-send="true">amd-gfx@lists.freedesktop.org</a>&gt;;
                    Koenig, Christian &lt;<a href="mailto:Christian.Koenig@amd.com" moz-do-not-send="true">Christian.Koenig@amd.com</a>&gt;;
                    Liu, Monk &lt;<a href="mailto:Monk.Liu@amd.com" moz-do-not-send="true">Monk.Liu@amd.com</a>&gt;;
                    Deng, Emily &lt;<a href="mailto:Emily.Deng@amd.com" moz-do-not-send="true">Emily.Deng@amd.com</a>&gt;;
                    Rob Herring &lt;<a href="mailto:robh@kernel.org" moz-do-not-send="true">robh@kernel.org</a>&gt;;
                    Tomeu Vizoso &lt;<a href="mailto:tomeu.vizoso@collabora.com" moz-do-not-send="true">tomeu.vizoso@collabora.com</a>&gt;;
                    Steven Price &lt;<a href="mailto:steven.price@arm.com" moz-do-not-send="true">steven.price@arm.com</a>&gt;<br>
                    <b>Subject:</b> Re: [PATCH v3] drm/scheduler
                    re-insert Bailing job to avoid memleak</span>
                  <o:p></o:p></p>
                <div>
                  <p class="MsoNormal">&nbsp;<o:p></o:p></p>
                </div>
              </div>
              <div>
                <div>
                  <p class="MsoNormal">I actually have a race condition
                    concern here - see bellow -<br>
                    <br>
                    On 2021-03-17 3:43 a.m., Christian König wrote:<br>
                    &gt; I was hoping Andrey would take a look since I'm
                    really busy with other <br>
                    &gt; work right now.<br>
                    &gt;<br>
                    &gt; Regards,<br>
                    &gt; Christian.<br>
                    &gt;<br>
                    &gt; Am 17.03.21 um 07:46 schrieb Zhang, Jack
                    (Jian):<br>
                    &gt;&gt; Hi, Andrey/Crhistian and Team,<br>
                    &gt;&gt;<br>
                    &gt;&gt; I didn't receive the reviewer's message
                    from maintainers on panfrost <br>
                    &gt;&gt; driver for several days.<br>
                    &gt;&gt; Due to this patch is urgent for my current
                    working project.<br>
                    &gt;&gt; Would you please help to give some review
                    ideas?<br>
                    &gt;&gt;<br>
                    &gt;&gt; Many Thanks,<br>
                    &gt;&gt; Jack<br>
                    &gt;&gt; -----Original Message-----<br>
                    &gt;&gt; From: Zhang, Jack (Jian)<br>
                    &gt;&gt; Sent: Tuesday, March 16, 2021 3:20 PM<br>
                    &gt;&gt; To: <a href="mailto:dri-devel@lists.freedesktop.org" moz-do-not-send="true">dri-devel@lists.freedesktop.org</a>;
                    <a href="mailto:amd-gfx@lists.freedesktop.org" moz-do-not-send="true">amd-gfx@lists.freedesktop.org</a>;
                    <br>
                    &gt;&gt; Koenig, Christian &lt;<a href="mailto:Christian.Koenig@amd.com" moz-do-not-send="true">Christian.Koenig@amd.com</a>&gt;;
                    Grodzovsky, Andrey
                    <br>
                    &gt;&gt; &lt;<a href="mailto:Andrey.Grodzovsky@amd.com" moz-do-not-send="true">Andrey.Grodzovsky@amd.com</a>&gt;;
                    Liu, Monk &lt;<a href="mailto:Monk.Liu@amd.com" moz-do-not-send="true">Monk.Liu@amd.com</a>&gt;;
                    Deng,
                    <br>
                    &gt;&gt; Emily &lt;<a href="mailto:Emily.Deng@amd.com" moz-do-not-send="true">Emily.Deng@amd.com</a>&gt;;
                    Rob Herring &lt;<a href="mailto:robh@kernel.org" moz-do-not-send="true">robh@kernel.org</a>&gt;;
                    Tomeu
                    <br>
                    &gt;&gt; Vizoso &lt;<a href="mailto:tomeu.vizoso@collabora.com" moz-do-not-send="true">tomeu.vizoso@collabora.com</a>&gt;;
                    Steven Price &lt;<a href="mailto:steven.price@arm.com" moz-do-not-send="true">steven.price@arm.com</a>&gt;<br>
                    &gt;&gt; Subject: RE: [PATCH v3] drm/scheduler
                    re-insert Bailing job to avoid <br>
                    &gt;&gt; memleak<br>
                    &gt;&gt;<br>
                    &gt;&gt; [AMD Public Use]<br>
                    &gt;&gt;<br>
                    &gt;&gt; Ping<br>
                    &gt;&gt;<br>
                    &gt;&gt; -----Original Message-----<br>
                    &gt;&gt; From: Zhang, Jack (Jian)<br>
                    &gt;&gt; Sent: Monday, March 15, 2021 1:24 PM<br>
                    &gt;&gt; To: Jack Zhang &lt;<a href="mailto:Jack.Zhang1@amd.com" moz-do-not-send="true">Jack.Zhang1@amd.com</a>&gt;;
                    <br>
                    &gt;&gt; <a href="mailto:dri-devel@lists.freedesktop.org" moz-do-not-send="true">dri-devel@lists.freedesktop.org</a>;
                    <a href="mailto:amd-gfx@lists.freedesktop.org" moz-do-not-send="true">amd-gfx@lists.freedesktop.org</a>;
                    <br>
                    &gt;&gt; Koenig, Christian &lt;<a href="mailto:Christian.Koenig@amd.com" moz-do-not-send="true">Christian.Koenig@amd.com</a>&gt;;
                    Grodzovsky, Andrey
                    <br>
                    &gt;&gt; &lt;<a href="mailto:Andrey.Grodzovsky@amd.com" moz-do-not-send="true">Andrey.Grodzovsky@amd.com</a>&gt;;
                    Liu, Monk &lt;<a href="mailto:Monk.Liu@amd.com" moz-do-not-send="true">Monk.Liu@amd.com</a>&gt;;
                    Deng,
                    <br>
                    &gt;&gt; Emily &lt;<a href="mailto:Emily.Deng@amd.com" moz-do-not-send="true">Emily.Deng@amd.com</a>&gt;;
                    Rob Herring &lt;<a href="mailto:robh@kernel.org" moz-do-not-send="true">robh@kernel.org</a>&gt;;
                    Tomeu
                    <br>
                    &gt;&gt; Vizoso &lt;<a href="mailto:tomeu.vizoso@collabora.com" moz-do-not-send="true">tomeu.vizoso@collabora.com</a>&gt;;
                    Steven Price &lt;<a href="mailto:steven.price@arm.com" moz-do-not-send="true">steven.price@arm.com</a>&gt;<br>
                    &gt;&gt; Subject: RE: [PATCH v3] drm/scheduler
                    re-insert Bailing job to avoid <br>
                    &gt;&gt; memleak<br>
                    &gt;&gt;<br>
                    &gt;&gt; [AMD Public Use]<br>
                    &gt;&gt;<br>
                    &gt;&gt; Hi, Rob/Tomeu/Steven,<br>
                    &gt;&gt;<br>
                    &gt;&gt; Would you please help to review this patch
                    for panfrost driver?<br>
                    &gt;&gt;<br>
                    &gt;&gt; Thanks,<br>
                    &gt;&gt; Jack Zhang<br>
                    &gt;&gt;<br>
                    &gt;&gt; -----Original Message-----<br>
                    &gt;&gt; From: Jack Zhang &lt;<a href="mailto:Jack.Zhang1@amd.com" moz-do-not-send="true">Jack.Zhang1@amd.com</a>&gt;<br>
                    &gt;&gt; Sent: Monday, March 15, 2021 1:21 PM<br>
                    &gt;&gt; To: <a href="mailto:dri-devel@lists.freedesktop.org" moz-do-not-send="true">dri-devel@lists.freedesktop.org</a>;
                    <a href="mailto:amd-gfx@lists.freedesktop.org" moz-do-not-send="true">amd-gfx@lists.freedesktop.org</a>;
                    <br>
                    &gt;&gt; Koenig, Christian &lt;<a href="mailto:Christian.Koenig@amd.com" moz-do-not-send="true">Christian.Koenig@amd.com</a>&gt;;
                    Grodzovsky, Andrey
                    <br>
                    &gt;&gt; &lt;<a href="mailto:Andrey.Grodzovsky@amd.com" moz-do-not-send="true">Andrey.Grodzovsky@amd.com</a>&gt;;
                    Liu, Monk &lt;<a href="mailto:Monk.Liu@amd.com" moz-do-not-send="true">Monk.Liu@amd.com</a>&gt;;
                    Deng,
                    <br>
                    &gt;&gt; Emily &lt;<a href="mailto:Emily.Deng@amd.com" moz-do-not-send="true">Emily.Deng@amd.com</a>&gt;<br>
                    &gt;&gt; Cc: Zhang, Jack (Jian) &lt;<a href="mailto:Jack.Zhang1@amd.com" moz-do-not-send="true">Jack.Zhang1@amd.com</a>&gt;<br>
                    &gt;&gt; Subject: [PATCH v3] drm/scheduler re-insert
                    Bailing job to avoid memleak<br>
                    &gt;&gt;<br>
                    &gt;&gt; re-insert Bailing jobs to avoid memory
                    leak.<br>
                    &gt;&gt;<br>
                    &gt;&gt; V2: move re-insert step to drm/scheduler
                    logic<br>
                    &gt;&gt; V3: add panfrost's return value for bailing
                    jobs in case it hits the <br>
                    &gt;&gt; memleak issue.<br>
                    &gt;&gt;<br>
                    &gt;&gt; Signed-off-by: Jack Zhang &lt;<a href="mailto:Jack.Zhang1@amd.com" moz-do-not-send="true">Jack.Zhang1@amd.com</a>&gt;<br>
                    &gt;&gt; ---<br>
                    &gt;&gt; &nbsp;
                    drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 4 +++-<br>
                    &gt;&gt; &nbsp;
                    drivers/gpu/drm/amd/amdgpu/amdgpu_job.c&nbsp;&nbsp;&nbsp; | 8
                    ++++++--<br>
                    &gt;&gt; &nbsp;
                    drivers/gpu/drm/panfrost/panfrost_job.c&nbsp;&nbsp;&nbsp; | 4 ++--<br>
                    &gt;&gt; &nbsp;
                    drivers/gpu/drm/scheduler/sched_main.c&nbsp;&nbsp;&nbsp;&nbsp; | 8
                    +++++++-<br>
                    &gt;&gt; &nbsp;
                    include/drm/gpu_scheduler.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 1 +<br>
                    &gt;&gt; &nbsp; 5 files changed, 19 insertions(+), 6
                    deletions(-)<br>
                    &gt;&gt;<br>
                    &gt;&gt; diff --git
                    a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c <br>
                    &gt;&gt;
                    b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c<br>
                    &gt;&gt; index 79b9cc73763f..86463b0f936e 100644<br>
                    &gt;&gt; ---
                    a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c<br>
                    &gt;&gt; +++
                    b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c<br>
                    &gt;&gt; @@ -4815,8 +4815,10 @@ int
                    amdgpu_device_gpu_recover(struct <br>
                    &gt;&gt; amdgpu_device *adev,<br>
                    &gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; job ? job-&gt;base.id
                    : -1);<br>
                    &gt;&gt; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* even we skipped this reset,
                    still need to set the job <br>
                    &gt;&gt; to guilty */<br>
                    &gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (job)<br>
                    &gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (job) {<br>
                    &gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    drm_sched_increase_karma(&amp;job-&gt;base);<br>
                    &gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r =
                    DRM_GPU_SCHED_STAT_BAILING;<br>
                    &gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
                    &gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto skip_recovery;<br>
                    &gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
                    &gt;&gt; &nbsp; diff --git
                    a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c <br>
                    &gt;&gt; b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c<br>
                    &gt;&gt; index 759b34799221..41390bdacd9e 100644<br>
                    &gt;&gt; ---
                    a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c<br>
                    &gt;&gt; +++
                    b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c<br>
                    &gt;&gt; @@ -34,6 +34,7 @@ static enum
                    drm_gpu_sched_stat <br>
                    &gt;&gt; amdgpu_job_timedout(struct drm_sched_job
                    *s_job)<br>
                    &gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_job *job =
                    to_amdgpu_job(s_job);<br>
                    &gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_task_info ti;<br>
                    &gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_device *adev =
                    ring-&gt;adev;<br>
                    &gt;&gt; +&nbsp;&nbsp;&nbsp; int ret;<br>
                    &gt;&gt; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memset(&amp;ti, 0, sizeof(struct
                    amdgpu_task_info));<br>
                    &gt;&gt; &nbsp; @@ -52,8 +53,11 @@ static enum
                    drm_gpu_sched_stat <br>
                    &gt;&gt; amdgpu_job_timedout(struct drm_sched_job
                    *s_job)<br>
                    &gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ti.process_name, ti.tgid,
                    ti.task_name, ti.pid);<br>
                    &gt;&gt; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if
                    (amdgpu_device_should_recover_gpu(ring-&gt;adev)) {<br>
                    &gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    amdgpu_device_gpu_recover(ring-&gt;adev, job);<br>
                    &gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return DRM_GPU_SCHED_STAT_NOMINAL;<br>
                    &gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =
                    amdgpu_device_gpu_recover(ring-&gt;adev, job);<br>
                    &gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret ==
                    DRM_GPU_SCHED_STAT_BAILING)<br>
                    &gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return
                    DRM_GPU_SCHED_STAT_BAILING;<br>
                    &gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
                    &gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return
                    DRM_GPU_SCHED_STAT_NOMINAL;<br>
                    &gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
                    &gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    drm_sched_suspend_timeout(&amp;ring-&gt;sched);<br>
                    &gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (amdgpu_sriov_vf(adev))<br>
                    &gt;&gt; diff --git
                    a/drivers/gpu/drm/panfrost/panfrost_job.c <br>
                    &gt;&gt; b/drivers/gpu/drm/panfrost/panfrost_job.c<br>
                    &gt;&gt; index 6003cfeb1322..e2cb4f32dae1 100644<br>
                    &gt;&gt; ---
                    a/drivers/gpu/drm/panfrost/panfrost_job.c<br>
                    &gt;&gt; +++
                    b/drivers/gpu/drm/panfrost/panfrost_job.c<br>
                    &gt;&gt; @@ -444,7 +444,7 @@ static enum
                    drm_gpu_sched_stat <br>
                    &gt;&gt; panfrost_job_timedout(struct drm_sched_job<br>
                    &gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * spurious. Bail out.<br>
                    &gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
                    &gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if
                    (dma_fence_is_signaled(job-&gt;done_fence))<br>
                    &gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return DRM_GPU_SCHED_STAT_NOMINAL;<br>
                    &gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return DRM_GPU_SCHED_STAT_BAILING;<br>
                    &gt;&gt; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_err(pfdev-&gt;dev, &quot;gpu sched
                    timeout, js=%d, config=0x%x, <br>
                    &gt;&gt; status=0x%x, head=0x%x, tail=0x%x,
                    sched_job=%p&quot;,<br>
                    &gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; js,<br>
                    &gt;&gt; @@ -456,7 +456,7 @@ static enum
                    drm_gpu_sched_stat <br>
                    &gt;&gt; panfrost_job_timedout(struct drm_sched_job<br>
                    &gt;&gt; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Scheduler is already stopped,
                    nothing to do. */<br>
                    &gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if
                    (!panfrost_scheduler_stop(&amp;pfdev-&gt;js-&gt;queue[js],
                    sched_job))<br>
                    &gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return DRM_GPU_SCHED_STAT_NOMINAL;<br>
                    &gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return DRM_GPU_SCHED_STAT_BAILING;<br>
                    &gt;&gt; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Schedule a reset if there's no
                    reset in progress. */<br>
                    &gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if
                    (!atomic_xchg(&amp;pfdev-&gt;reset.pending, 1)) diff
                    --git <br>
                    &gt;&gt; a/drivers/gpu/drm/scheduler/sched_main.c <br>
                    &gt;&gt; b/drivers/gpu/drm/scheduler/sched_main.c<br>
                    &gt;&gt; index 92d8de24d0a1..a44f621fb5c4 100644<br>
                    &gt;&gt; ---
                    a/drivers/gpu/drm/scheduler/sched_main.c<br>
                    &gt;&gt; +++
                    b/drivers/gpu/drm/scheduler/sched_main.c<br>
                    &gt;&gt; @@ -314,6 +314,7 @@ static void
                    drm_sched_job_timedout(struct <br>
                    &gt;&gt; work_struct *work)&nbsp; {<br>
                    &gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_gpu_scheduler *sched;<br>
                    &gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_sched_job *job;<br>
                    &gt;&gt; +&nbsp;&nbsp;&nbsp; int ret;<br>
                    &gt;&gt; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sched = container_of(work, struct
                    drm_gpu_scheduler, <br>
                    &gt;&gt; work_tdr.work);<br>
                    &gt;&gt; &nbsp; @@ -331,8 +332,13 @@ static void
                    drm_sched_job_timedout(struct <br>
                    &gt;&gt; work_struct *work)<br>
                    &gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; list_del_init(&amp;job-&gt;list);<br>
                    &gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    spin_unlock(&amp;sched-&gt;job_list_lock);<br>
                    &gt;&gt; &nbsp; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    job-&gt;sched-&gt;ops-&gt;timedout_job(job);<br>
                    &gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =
                    job-&gt;sched-&gt;ops-&gt;timedout_job(job);<br>
                    &gt;&gt; &nbsp; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret ==
                    DRM_GPU_SCHED_STAT_BAILING) {<br>
                    &gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    spin_lock(&amp;sched-&gt;job_list_lock);<br>
                    &gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; list_add(&amp;job-&gt;node,
                    &amp;sched-&gt;ring_mirror_list);<br>
                    &gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    spin_unlock(&amp;sched-&gt;job_list_lock);<br>
                    &gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
                    <br>
                    <br>
                    At this point we don't hold GPU reset locks anymore,
                    and so we could<br>
                    be racing against another TDR thread from another
                    scheduler ring of same <br>
                    device<br>
                    or another XGMI hive member. The other thread might
                    be in the middle of <br>
                    luckless<br>
                    iteration of mirror list (drm_sched_stop,
                    drm_sched_start and <br>
                    drm_sched_resubmit)<br>
                    and so locking job_list_lock will not help. Looks
                    like it's required to <br>
                    take all GPU rest locks<br>
                    here.<br>
                    <br>
                    Andrey<br>
                    <br>
                    <br>
                    &gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
                    &gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Guilty job did complete and
                    hence needs to be manually <br>
                    &gt;&gt; removed<br>
                    &gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * See drm_sched_stop doc.<br>
                    &gt;&gt; diff --git a/include/drm/gpu_scheduler.h <br>
                    &gt;&gt; b/include/drm/gpu_scheduler.h index
                    4ea8606d91fe..8093ac2427ef 100644<br>
                    &gt;&gt; --- a/include/drm/gpu_scheduler.h<br>
                    &gt;&gt; +++ b/include/drm/gpu_scheduler.h<br>
                    &gt;&gt; @@ -210,6 +210,7 @@ enum drm_gpu_sched_stat
                    {<br>
                    &gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_GPU_SCHED_STAT_NONE, /* Reserve 0
                    */<br>
                    &gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_GPU_SCHED_STAT_NOMINAL,<br>
                    &gt;&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_GPU_SCHED_STAT_ENODEV,<br>
                    &gt;&gt; +&nbsp;&nbsp;&nbsp; DRM_GPU_SCHED_STAT_BAILING,<br>
                    &gt;&gt; &nbsp; };<br>
                    &gt;&gt; &nbsp; &nbsp; /**<br>
                    &gt;&gt; -- <br>
                    &gt;&gt; 2.25.1<br>
                    &gt;&gt;
                    _______________________________________________<br>
                    &gt;&gt; amd-gfx mailing list<br>
                    &gt;&gt; <a href="mailto:amd-gfx@lists.freedesktop.org" moz-do-not-send="true">amd-gfx@lists.freedesktop.org</a><br>
                    &gt;&gt; <a href="https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=04%7C01%7CJack.Zhang1%40amd.com%7C95b2ff206ee74bbe520a08d8e956f5dd%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637515907000888939%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C2000&amp;sdata=BGoSfOYiDar8SrpMx%2BsOMWpaMr87bxB%2F9ycu0FhhipA%3D&amp;reserved=0" moz-do-not-send="true">
https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;amp;data=04%7C01%7CAndrey.Grodzovsky%40amd.com%7Ce90f30af0f43444c6aea08d8e91860c4%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637515638213180413%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=NnLqtz%2BZ8%2BweYwCqRinrfkqmhzibNAF6CYSdVqL6xi0%3D&amp;amp;reserved=0</a>
                    <br>
                    &gt;&gt;<br>
                    &gt;<o:p></o:p></p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------C116BE7F8D01D76004381426--

--===============0923773291==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0923773291==--
