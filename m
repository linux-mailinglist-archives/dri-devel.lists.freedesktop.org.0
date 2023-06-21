Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92850738757
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 16:41:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FE8F10E49B;
	Wed, 21 Jun 2023 14:41:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1A6E10E499
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 14:41:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=evMCKtBpichv9CJEKPxlsFsQSVs3GZ0AvSgg5NUTHMlkMX9gWMR/+CK2KuL4iyY2jxO2RQex+0lxBqZ3C7sMp7Z+5cWzsgHJmVKyOBczvM0rkp8/7DhIWypXX5ugGqpQP1S3r3KVmyj5+/ehhqBm5NatNXom2CD5oiplR6zxQh/SmjOdWISIXbKziwEslvvYyuIGE3PXphRRNlYOvuXFTCZDw4ME3U6UjlHtz8pEnM/7A+8uca0JsRNFtrxvhsXW07SgUY0PqJ5LskPScgi1JejOjcdz636hB5wjFpkc820OlePago4Mhc/pLqPAHOPX4G2rkTpnHLXdzzBgf/HeuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/bLCzIWc1ZOvJQhQDcW6LeQ8DWFUXdG45UmoLpZ2VFs=;
 b=NJuFUAhHfvvu5h8WFbPihMQz9mCFm3o0iqxOv+1DeEOzWTvRqHmCz7nDRH0cBcf4uE1Qayf/pSUq+rc78mC2EVE9bjLWETWq2H+zamGnk6TYw37Voel3gOYofDYg7IXsPxGA6bLDO6JcD78cSGxoCdYvZVZAWfuCOBbTygnt5/uxYsq85Xa7l62rkRgVNFKW0FTYX24dFM7evtPzxC7PXpG9ms0pJKDWhVsvEL5hUsZeAeyaTINvaoCD//nA53ErYbPtec5hFGdEiF8vxaFEIZWLCJXdwb3r5a7ukVSsX8NKGRSMDZ0nOCDZ9gOi3IVy48Kcp5cRH8EIrT/607IePg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/bLCzIWc1ZOvJQhQDcW6LeQ8DWFUXdG45UmoLpZ2VFs=;
 b=TZ77hiItSZSX1GfToop/ffcpBRqBeYIaKTyW7iOBFAXVRj8LwB4QZQCCWiAndtXFyVxcPB+wrgKcDK2zRnevBMSdw3JJTYmk+vrkgpPR2rrzMt25EDuH1cgRg+nfTcIGz8hUrEE+I5SK6jDtIso0NdLMNVM6rdMt5M+gbXz64Ag=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 MN6PR12MB8489.namprd12.prod.outlook.com (2603:10b6:208:474::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Wed, 21 Jun
 2023 14:41:25 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b59e:105c:f546:4310]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b59e:105c:f546:4310%7]) with mapi id 15.20.6521.020; Wed, 21 Jun 2023
 14:41:25 +0000
Message-ID: <3d269410-e9ee-6cf5-8c22-5fb916ff75b2@amd.com>
Date: Wed, 21 Jun 2023 10:41:22 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-CA, en-US
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20230619071921.3465992-1-boris.brezillon@collabora.com>
 <dca9af00-271b-168d-c5f5-e6a662be38dc@amd.com>
 <20230621161808.24262cdd@collabora.com>
From: Luben Tuikov <luben.tuikov@amd.com>
Subject: Re: [PATCH v6] drm/sched: Make sure we wait for all dependencies in
 kill_jobs_cb()
In-Reply-To: <20230621161808.24262cdd@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0178.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:110::22) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|MN6PR12MB8489:EE_
X-MS-Office365-Filtering-Correlation-Id: cd952a1c-e8e0-48e9-3f65-08db726596b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: se4fRxH5vsKdD4dNbJg+hNlUZ+2jhncgFeipEvmG7gaBHNBFGWLtMAl5DyQCd2M7a7ONPm8esdKF8v7dV2kncG/SNvlKqC99qY1o0ugiOzIOsFSboSHh90ntr+qLZaGTGM3Z4DVHcEdRBIwQimhWv/fxGYiUM2jswmcpudedktplpI45/pVK93bw8tS8N7mGl/x3TqMtH/cbLnl0ollH8aPOKAWIa+hJ9CkhP0eL23v3Mj9gbhsPcS47bU9yJ9iBpFUW/01rcmhUqbb6GvUWlztoW6VTSEQn88uHTKjbY+8a08PMwq6YJFhR8MngqvQeKp0mmSMk/l9q9VB7k3fRRQvVR3uDkcvg3CgUTEgB+x2dqUK04NiGvT2n6bXgCzDiiFoyA9CB0+Itz0dVQRUIuKspOYcafGunok8HZmdV7BfpIB3JGyhBzmfhOaBwpS125I9whMz9134hbkCZ206nGdfGlrkNnXz06IVVzDuU6M/91hljgureXIZArH35XfSKXLfkmdfDM1BbN1AVs+fTklWYo/lrutggvlZ/I5tQaQ6KuIWWxiGw0PSF5tdPnuhHAL0+46543aJhANucqMH/zKWCOUYA1fwPrLh0JYLbxMFyIxZGxY94pCLmeE6RdbEi3PBRm78CqsGAXhgKH/eYOrD3b+p7xUpG04J3J4BKSHLhpq4t4R/CuVTL8Gs9Z7kx
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(136003)(396003)(39860400002)(376002)(346002)(451199021)(54906003)(6666004)(66946007)(66476007)(66556008)(478600001)(26005)(186003)(6512007)(53546011)(6506007)(2616005)(6486002)(4326008)(5660300002)(6916009)(316002)(8676002)(41300700001)(8936002)(44832011)(2906002)(38100700002)(36756003)(31696002)(31686004)(86362001)(66574015)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TllSVWlFQnNTSitzQXNUcDR6V1owVy9QeTFMVHFKVkREdHM0M3dSblhKNjgr?=
 =?utf-8?B?am8wbGVRUys5VkRVVy9PcTUwUGNvRmNFQlBrSVB2WXplYWsyd1lxRklGOEhF?=
 =?utf-8?B?cWxERENSYnRFZDZib0VhM1poK0txNnhuYU50eEtpeDZERkYvQ1NmZ3R5U1Vk?=
 =?utf-8?B?ZlFHdDBqNHNYS3Rta0Q2MlFBTGlmQVZHeVl1STBMUHlEOUgxRXpxVjdHSG95?=
 =?utf-8?B?Y0M3c2FBNWFCNHlHaFQ5VGtGS1FTNUppQnliR0M2U0ZwMVlZUzdiVm1jUytT?=
 =?utf-8?B?cTJIVGwwQ0NhNWNhTEk2VFU5aVlSa24remxYQjFuQ2tiUEptZWJPeFVOSFVw?=
 =?utf-8?B?ZFNVNC9qa0p3NS95Q2JUaWJxaFAyTE1oRDdyc1hxQlNzeW4reWttcDI3OGQw?=
 =?utf-8?B?RjFlNXEwT0pyMTNONUxXRnJWK3Z5SUI3N3FzYllOb05TbFNqOUEvVzhYUWQ4?=
 =?utf-8?B?Z1Z2UDFuT2xON3k2WWYrU2pRais1NzRrbGNDcUhQZjZDWklHVVN0NFFvUzRB?=
 =?utf-8?B?Tmt6L3l5TXpHMGdadnBaR25TNnpJQll1OXhTczF4MUJGR25DRnBBeUZHeE13?=
 =?utf-8?B?TUhpSWloRUozcnZwWXVzT1pHM2RsY3IxUVk1UEo0TXlTaDNCTndjS1MyV1I0?=
 =?utf-8?B?QlhWSFdiV3pJWGFqR1NZOTArZCtpQVByOEMzQ3hrNlZKZWsrQ2xoU0lZTW1p?=
 =?utf-8?B?di9lYmJheFdyblNMc0FqNTU2OVRYZU53WitGeTVaZEpBL2hiWW5hTE90dXNm?=
 =?utf-8?B?TWlWNG1IU3FRajFGQUgydGxOOGxteE1TYkpJV3J5NHdHeU1EdTZ1Z3N5L2Ju?=
 =?utf-8?B?MDhOeTI3QU5LelVISnYrM3RxbGozVERRRVVVd3JWUG9xZkpaZkpBWHVyQVFi?=
 =?utf-8?B?UTdvUGVCaTA1a29YY3p2V1BESUd0ODA3Y0JPd05QTG05RytvcXpWYVdsdTEz?=
 =?utf-8?B?VkpLckpSMkJQWEhRdzI2L2swVmxZbnR1YU1QQ2F0MU9JVmdpMXdXOU9EWTZi?=
 =?utf-8?B?R2ZpbWRsUmMyT2hoTGgrdGZOTEp3WE5qQzVMRXo2Tld5UnRzQzhaNHVyMExG?=
 =?utf-8?B?b3BtK3NSeklaSkM5bmFXWVpmQjhYTC9IZHZDUXVXQUpjMzlFSTZaTXJTcURH?=
 =?utf-8?B?dEpUUXNINmtzc0JjS0RYcjhyNmg4ZXN2dVZpcTBEK05CTmRhUkphVGgxbzA4?=
 =?utf-8?B?V3BNOG1xbEl4bmt1V2dXeGRVSVpkMXFMUzRPSGlubXkvM0pCcHBBekJ0RzVB?=
 =?utf-8?B?UG1QN25jdlBOM2NGdXJVcXJMNi85N251c0UyaFppT2xPVjRGM2hkRUl6M29W?=
 =?utf-8?B?bEg4Z1VLckh5alFldVowYXVmZkxJY0JDdzBkbDQ3aHVOclc2QjdOZnNVdy9G?=
 =?utf-8?B?cEdVN1BPWWVIZE93RUhsektSWDgvcUxHRnZQb3Nud3Q0RXVUZC9MUkdCY29W?=
 =?utf-8?B?T3V0QTl0bjRQVWNGMnNKRDlaVEdCaXZnMlBBQ0VHS21UajJNd3pOalp2U3kx?=
 =?utf-8?B?ZytSdXE4VFIxTkd3UUtYcld0S2hhV0gyNnRzK3l4OGJ5NVQ3QnZ6eEptMVFK?=
 =?utf-8?B?Z1lnQXFxdzZITklZRjZaNGRaeEUvY3haVTY5Sk42aDd0aUtKcnlYVGpyb3gw?=
 =?utf-8?B?QjE3OXV2c1NwTjdOZXFPckZ1KzZXdVpUdWxPQlFwUVQ2b3EyeC9kaGNvbDhp?=
 =?utf-8?B?OGFtcEJEMGlhaTlBcmw3NWZaSE9JNUxqZTNjSDVQN2h5Mm9jbTZZZWFqOVpP?=
 =?utf-8?B?SHZJaHVJTHdzMjNnODUrZGM3VERRV1NKK2tpcGpiUmE4S093ZzU1U2JIUTl4?=
 =?utf-8?B?cmdxUlozdDZyckI1NGZMRVFjelNCZnFtY1lNQ21rZHk4aDZVT04vZ2ZzY2th?=
 =?utf-8?B?OC9YZzRxOXJWYkVSUW5DNmJlMlBjU2dXM1RWQjZ2SGpqVkU4eTk2R2RmQ1I4?=
 =?utf-8?B?YnJITWRWMHdYQXpMblpuT25hMnhJdmN5ZzdZNS96SWtzV2JDbUtlVVBuSm5w?=
 =?utf-8?B?RzdlNUF4MXpFLzdzTHFCTzBrSC84R2o3My9oWlRpOTgyWTdIL21DUWx4eWJt?=
 =?utf-8?B?NlN6enBFTjI3RTdGblRYbytjQmdkSWNxQnhEdi8vaWF4eEI3K3Qva3g0Q0h3?=
 =?utf-8?Q?YTsQkD/QXGN/jsRnDVRz/A7ie?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd952a1c-e8e0-48e9-3f65-08db726596b8
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2023 14:41:25.0718 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ul+FI/i2Fkx60COqbYrCJK65BK+z9KFF5yCALJLxGdC+GGQi56gEUyVemyD0+sU/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8489
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
Cc: Sarah Walker <sarah.walker@imgtec.com>, dri-devel@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Donald Robson <donald.robson@imgtec.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-06-21 10:18, Boris Brezillon wrote:
> Hello Luben,
> 
> On Wed, 21 Jun 2023 09:56:40 -0400
> Luben Tuikov <luben.tuikov@amd.com> wrote:
> 
>> On 2023-06-19 03:19, Boris Brezillon wrote:
>>> drm_sched_entity_kill_jobs_cb() logic is omitting the last fence popped
>>> from the dependency array that was waited upon before
>>> drm_sched_entity_kill() was called (drm_sched_entity::dependency field),
>>> so we're basically waiting for all dependencies except one.
>>>
>>> In theory, this wait shouldn't be needed because resources should have
>>> their users registered to the dma_resv object, thus guaranteeing that
>>> future jobs wanting to access these resources wait on all the previous
>>> users (depending on the access type, of course). But we want to keep
>>> these explicit waits in the kill entity path just in case.
>>>
>>> Let's make sure we keep all dependencies in the array in
>>> drm_sched_job_dependency(), so we can iterate over the array and wait
>>> in drm_sched_entity_kill_jobs_cb().
>>>
>>> We also make sure we wait on drm_sched_fence::finished if we were
>>> originally asked to wait on drm_sched_fence::scheduled. In that case,
>>> we assume the intent was to delegate the wait to the firmware/GPU or
>>> rely on the pipelining done at the entity/scheduler level, but when
>>> killing jobs, we really want to wait for completion not just scheduling.
>>>
>>> v6:
>>> - Back to v4 implementation
>>> - Add Christian's R-b
>>>
>>> v5:
>>> - Flag deps on which we should only wait for the scheduled event
>>>   at insertion time
>>>
>>> v4:
>>> - Fix commit message
>>> - Fix a use-after-free bug
>>>
>>> v3:
>>> - Always wait for drm_sched_fence::finished fences in
>>>   drm_sched_entity_kill_jobs_cb() when we see a sched_fence
>>>
>>> v2:
>>> - Don't evict deps in drm_sched_job_dependency()  
>>
>> Hmm, why is this in reverse chronological order?
>> It's very confusing.
> 
> Dunno, that's how I've always ordered things, and quick look at some
> dri-devel patches [1][2] makes me think I'm not the only one to start
> from the latest submission.
> 
> [1]https://lkml.org/lkml/2023/6/19/941
> [2]https://lore.kernel.org/dri-devel/cover.1686729444.git.Sandor.yu@nxp.com/T/#t
> 
>>
>>>
>>> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
>>> Suggested-by: "Christian König" <christian.koenig@amd.com>
>>> Reviewed-by: "Christian König" <christian.koenig@amd.com>  
>>
>> These three lines would usually come after the CCs.
> 
> Again, I think I've always inserted those tags before the Cc, but I can
> re-order things if you prefer. Let me know if you want me to send a v7
> addressing the Cc+changelog ordering.

No, it's not necessary for this patch, but in the future I'd rather follow
chronological ordering for the versions, and in the Cc list. It's similar
to how the patch description follows (narrative text) and to how we reply
back to emails, and prevalently in the kernel log in drm ("git log" should
suffice).

Reading in chronological progression builds a narrative, a picture, in one's
mind and makes it easy to see justifications for said narrative, or see reasons
to change the narrative.

That is, one can make a better decision knowing the full history, rather than
only the latest change.

(And in fact when I read the version revision list, my eyes skip over v[X]
and just read down, so I was wondering why and how Christian R-B the patch
in v2, and it wasn't until I actually saw that they were ordered in reverse
chronological order, which was in fact v6--listed first, which I'd assumed
was listed last.)

Do you have access or do you know who is pushing this patch to drm-misc-fixes?
-- 
Regards,
Luben

