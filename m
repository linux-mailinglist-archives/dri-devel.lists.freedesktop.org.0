Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F32456402CA
	for <lists+dri-devel@lfdr.de>; Fri,  2 Dec 2022 10:01:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED89910E6B8;
	Fri,  2 Dec 2022 09:01:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2082.outbound.protection.outlook.com [40.107.100.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF7AA10E1AC
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Dec 2022 09:01:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ANGChGou+SJobWsBKngfKBk5P5UFNgfzJDMYcdE1gOjWcqVbmXDQIDe8/dppyiUDgFVWjGP2p/kLQkxUOtwG3a94QBoGcnnW6TNX2z+mmCcTh2HiaRYpMG8I0yM8eIcoP8j0Bs2BVl0u95reA1JefyAw0GyeWdfHxlYGPYTc/9ps2DJirQxf6d3SvTuvj5n1l6ZVRE/pU+RbUB/czk5wAssOrirGrc0yrUd7XaCZX5MY9T2kVUjbqqOWvGHjhsWWbLj7NJAiK8zdqKTu1GvVVxyU68oE0W6kXfjIT6HlByBKEaUKgTW5PZmYf7oozGBkrXbwveXEGUhsfPW1VC3QUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3aIzHNDnY2z0Pku/hg7uaO/vcNm5g5zZTR8y1VFA8/c=;
 b=HnlaGuvxKJmEha4EuAf6YyESYFu8hNaTJZfY6MRPlBuNf03niGv+tbSkgyA0Dkl9jJMra2J/5ahnKWOeqF/hy8RKFUalF0kxUdkHulZt11ricvixskjD51MxDYcFnGhg3u6pWCKrGyF0L40mttMo2SdHrwvJlLzRoZyMvAjnd+8j7ELCayvXobzcKspqZpqdEwWb0DOopjuH6VjzHdbLIwgpjQFyLZYEPKGYLPmmpEUoQhiHiT8SKwcKZVdnZokP41uOqTCSVlHTMPPdCbeymcYkA8FDu4QK+9oHuJllXOGGW29sdluDlRvgv9iEsa5Xs8PaFBrbwUvuRMTzj5LGUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3aIzHNDnY2z0Pku/hg7uaO/vcNm5g5zZTR8y1VFA8/c=;
 b=muRJ+M3ODeRey+QUqMdnT1PDFFTXXtMFbijlH4EVoy4BTl0SZS/uoVdXMUYIZ5M3sJ/e7lmVzh0woX0UF2zxDl2LrbE3t125ltPDvQndr7Rnak4q5tkXmJPsHYch/Os9j/W9lhRNsli2safKFmBsPq14MacY2SqSzxQYiDhAp88=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SA0PR12MB4350.namprd12.prod.outlook.com (2603:10b6:806:92::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.10; Fri, 2 Dec
 2022 09:01:06 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7d43:3f30:4caf:7421]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7d43:3f30:4caf:7421%7]) with mapi id 15.20.5880.010; Fri, 2 Dec 2022
 09:01:06 +0000
Message-ID: <3eccd500-9e69-111d-54bd-90e6292b2b98@amd.com>
Date: Fri, 2 Dec 2022 10:01:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC 3/3] drm: Update file owner during use
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20221130133407.2689864-1-tvrtko.ursulin@linux.intel.com>
 <20221130133407.2689864-4-tvrtko.ursulin@linux.intel.com>
 <Y4dmKgn8X4yPUnqk@phenom.ffwll.local>
 <157dcd11-ea4d-b22a-b10f-0934451d3c1d@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <157dcd11-ea4d-b22a-b10f-0934451d3c1d@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0121.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::12) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SA0PR12MB4350:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e5a0c71-7e5f-444e-c969-08dad443bf33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ajnP/V8DucRj1ZTQk95nHAEbTN33eIE4dTdwhBcS6L2QdTAvzlFk90djSP+DgrdjBm3EFfLqYVPoEXEQkLRYL4GKo3YVjdq7utUj8slCaYN1PCsZerLSCNMDKIcwgrMnzjx2uXHxrIjV3QzBqZxSYsHMgObk2oFv5M3ImgoFFjK8L62uvxeZ2YHyichIdS3RyKZEV+Eye4F6Ajlbwm+AStJfC4hjLQlzPqaZAckcAcbGSXyRcgu53lStNluaFVw8mf5wlavDjPPI1W+uW+LsqfcjFVQgoKvMboU7qVkcM7ub2JmaykuGi2q9ix/Mlz3ramQRvqjxF1g+btyZ2b7H2R2K/V5gNMb3aLGtwr1f1E4ZLCLxq6b9RQKaWeNzTM2LnswGOWyQvL2ivJvL/rqoqiqqJvXYy7VLpFW+oNPfz0xvTfRdcIpNOC+RFfVrcDtIH1MnzrVcJatHSxVkRVGH6RzCpIDy3kSNyXLFm3jgNjJFIV+PbVBhtbaOQsjpwMqFmgxfGQfqAJMd8gPfHtCSOf0ZKvdt4u7I8UgP9GeDzxpLYnNd2vmae54UR7Ab6F62Ojh4MlILGWOUw20+73H60dqVaRxcgILk/1t6azqICdqBSYOyNt6vkHJtoHyC2+bij+AMZznycFJRg9JUOO9Uee8maeUPmaQhgFpn7Zw7uVFZV54YwKTL1P8o4aSmbfOiTT8hxG8Eg30tWvoCLKfcJCWN0t4E6yvBsrOHbU7eD9k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(346002)(396003)(376002)(136003)(39860400002)(451199015)(2616005)(6486002)(6666004)(6506007)(53546011)(6512007)(110136005)(36756003)(478600001)(38100700002)(86362001)(31696002)(186003)(66574015)(83380400001)(5660300002)(66946007)(66476007)(66556008)(4326008)(30864003)(8676002)(41300700001)(8936002)(31686004)(15650500001)(316002)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZE5SZFVVZk9uN3VlZFluM0Y4S1Z5TDZpTFg2QSt6YVNmME1QMWVsdDFUc1Zs?=
 =?utf-8?B?Mm9FM2xPTWczaWdoVDdTRUkxRmxsRThCR0UzMVpkbEUwWkhhdHk1ZEFqQTFl?=
 =?utf-8?B?a2VZNzV4cldQUXV4UjgrOWVhMnRTeXRkVEZmL0hrQmxpY1hrc2VmYXFnOWp1?=
 =?utf-8?B?RDYwV2RjTFBUak5Sd3BvRWVocU8yV0o4d1ZqWk5LZGJVQWlWV09oWXZ2dGl0?=
 =?utf-8?B?UC80c1VMYlV2b3k3RWwrL3FjbmE2K2c1a0dPZTZCODNXaFMzVFJBVmlPWmdP?=
 =?utf-8?B?N3NTQ1V4OGdaSFF0MWVTOFdTSjg1WkV0bkVrbVZjbGhmVGt6SGg3djRPZTJu?=
 =?utf-8?B?eisyUjlTVnFmWFZQZldLNUFxdFRtckhzNlhlTy9UcVdhVDNKZmhoZFdCWFNv?=
 =?utf-8?B?bnhZNEdPTkFVOW5wYzBHd3ZaaDIyaEppdEFIRElmeEZPTVNQV0ttUS9WaXpE?=
 =?utf-8?B?NU9xYjJDOGxrRVVYbzNnWmhUUEZSM3VtekZUTExlZ3NRMnpPRmlUeFZuSDZ2?=
 =?utf-8?B?Tm9xVWhlcjYwZzY4KzFqQ1ZaMFBhSXF3RUdVdHFsL1l5RURlWmM0QXZkRWZk?=
 =?utf-8?B?QU5SY1lPVzRNaHp0bm05cEQyL2Q1QXg4VksrU0Nhc29pQk04Y1p4bkR6eVJr?=
 =?utf-8?B?QW9yRW5Ta0pSK08ybk1TTk9pNitscVVGbVRqeElKZUgxbThZeG1teVRPM1pF?=
 =?utf-8?B?Um1rem1PR20vNVVMcGxzWUdUTGRTMnVXbmxJYmU3UkQ1eit6bXNsODNYUTgr?=
 =?utf-8?B?bHZUNWZjMmp6d0l5NlNVVlJOcXptZlNSRlFwTHZFUUFVQmczekluOFZyM2dt?=
 =?utf-8?B?dllKbVBYWkl2bWo2WmMrb3lDbkN6VkszNWxHbCtEVlpmTG8xWVlRL0p1Zm5Z?=
 =?utf-8?B?K2ZmMU1WQ1lQWDJmejREM3B0QTB3NStaeVlaYmdYcTFsU0Rkb1dwUlBvcVg5?=
 =?utf-8?B?WGRJenFKL3dqbE41TW1JRjBqUndydVg4bzlDL1JadmM1TVA2MGs1RUUwR1Bx?=
 =?utf-8?B?dkRQU3kwYmswVTFWK2EzekF3MHpRL0FRdnZZeW5qdWZ1VGc5dzJoTk5rNytW?=
 =?utf-8?B?c3hjTnF4VEhSYlppVVNnVklHZFZweDBBbkU5Z3JGU0piL0QrR0prdUI4WXcw?=
 =?utf-8?B?UWNzNmxBL1R2TUQxbEYwYitkbk1jREQ1MXh6MkJHU0R3VlZiNm9XMjdhQjlT?=
 =?utf-8?B?TFhGa3EvcVRSSXE1RzUzWmFkc2RoK3FJNExZbXNwdnFJZTAzZE9hYWprOU83?=
 =?utf-8?B?MkJUQlNQM3NDbjV1RXoxemdVZm9zMmZYREVudHRTK2hhSi9DODZ2SHBsS2pB?=
 =?utf-8?B?ZWphVTM4clVRQTUycEQwSWZGRFZlamZBbGFPTWNmam1CNU1RdU15QkhONHZx?=
 =?utf-8?B?ZDg2b3BUMXFlaVFkLzByOTFOY1pGV0R6Vm1IL0F0elNma0FKTWN0VitUOVh2?=
 =?utf-8?B?NG42OWxyMXN2dkpwS0tDUXppdUJqTXdhYVJJRSt3N3o5Qk5JNXFPeGJxdXQv?=
 =?utf-8?B?WVRGSmVYdWxBNWJIdXdOSzM0K2JxdkRVMGNxTnpzM0ZSaFM5R2k5eHVRclBz?=
 =?utf-8?B?NEZFYU05MmZnOXc2QTNKaEd6SzRHWUd3OEVSSGpzQit0ZkdBTjRBZnVmL0lE?=
 =?utf-8?B?Rmc3cjF5a3h2U0JpSzNhUFl5YmJicFZQTnkxNW9MMnNBUnlkNml5RVdyS3A1?=
 =?utf-8?B?QnZ5TnlTU1BOVk51UGp2b083bGw0ekNNNTRkaGk5ZjhrZVJZR3FvNTJPZ1pi?=
 =?utf-8?B?Tk0rM3dSWTFITHJ5MmFrZDFQdWpaUVY0U3k3bWMyN1BUdjFmYThscTZYQ2p0?=
 =?utf-8?B?VHNlQ1pmNkNqM1l1VUcwak9YQnFTQTl1NGM5YnJCRnNpbEo5U0hlKzFFdDJa?=
 =?utf-8?B?ckJTR2QwNmR6dkh3VmQ0UnBlbmIra1pydCtjbjdTcTNwMGlzWFRnajNGaHdj?=
 =?utf-8?B?WnNNeDNiUDJaSzVvQUlQeWRHRHh0MlRJSkNpQnBlUzJiandTQjJFeWlqSlV0?=
 =?utf-8?B?cU9SbDlIZXU4eDVRTzIxSkxHU2ltMU5BVTlmQmlUbHg3cG8xUFl3RnJOQXU1?=
 =?utf-8?B?akI4Uy9wUkxESVBLaTFKbDNpTFVyUkJSdUE4R0JXL0ZPU3Rqd3NGYkNIU3Vs?=
 =?utf-8?B?SWs2TEZLZVBlVWhTbkJCeXRsWENDVHUvdkUvR1VSWW1STWdZRVdGeGRBSG5s?=
 =?utf-8?Q?MEwA/DJLqagod3YCXn7IpXMfUcXbMd2HgR9neoqMSM7X?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e5a0c71-7e5f-444e-c969-08dad443bf33
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2022 09:01:06.4742 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6BqhiFN7wGrxsmFv8MKyyX5LyNxY7btooMxpBhZ4ziglNyiupyXmste/Vy/HWm8w
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4350
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
Cc: dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 01.12.22 um 12:09 schrieb Tvrtko Ursulin:
>
> On 30/11/2022 14:18, Daniel Vetter wrote:
>> On Wed, Nov 30, 2022 at 01:34:07PM +0000, Tvrtko Ursulin wrote:
>>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>
>>> With the typical model where the display server opends the file 
>>> descriptor
>>> and then hands it over to the client we were showing stale data in
>>> debugfs.
>>>
>>> Fix it by updating the drm_file->pid on ioctl access from a different
>>> process.
>>>
>>> The field is also made RCU protected to allow for lockless readers. 
>>> Update
>>> side is protected with dev->filelist_mutex.
>>>
>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>> Cc: "Christian König" <christian.koenig@amd.com>
>>> ---
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c |  6 +++--
>>>   drivers/gpu/drm/drm_auth.c              |  3 ++-
>>>   drivers/gpu/drm/drm_debugfs.c           | 10 ++++----
>>>   drivers/gpu/drm/drm_file.c              | 32 
>>> ++++++++++++++++++++++++-
>>>   drivers/gpu/drm/drm_ioctl.c             |  3 +++
>>>   drivers/gpu/drm/nouveau/nouveau_drm.c   |  5 +++-
>>>   drivers/gpu/drm/vmwgfx/vmwgfx_gem.c     |  6 +++--
>>>   include/drm/drm_file.h                  | 13 ++++++++--
>>>   8 files changed, 65 insertions(+), 13 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>> index 30e24da1f398..385deb044058 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>> @@ -959,6 +959,7 @@ static int amdgpu_debugfs_gem_info_show(struct 
>>> seq_file *m, void *unused)
>>>       list_for_each_entry(file, &dev->filelist, lhead) {
>>>           struct task_struct *task;
>>>           struct drm_gem_object *gobj;
>>> +        struct pid *pid;
>>>           int id;
>>>             /*
>>> @@ -968,8 +969,9 @@ static int amdgpu_debugfs_gem_info_show(struct 
>>> seq_file *m, void *unused)
>>>            * Therefore, we need to protect this ->comm access using 
>>> RCU.
>>>            */
>>>           rcu_read_lock();
>>> -        task = pid_task(file->pid, PIDTYPE_TGID);
>>> -        seq_printf(m, "pid %8d command %s:\n", pid_nr(file->pid),
>>> +        pid = rcu_dereference(file->pid);
>>> +        task = pid_task(pid, PIDTYPE_TGID);
>>> +        seq_printf(m, "pid %8d command %s:\n", pid_nr(pid),
>>>                  task ? task->comm : "<unknown>");
>>>           rcu_read_unlock();
>>>   diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
>>> index cf92a9ae8034..2ed2585ded37 100644
>>> --- a/drivers/gpu/drm/drm_auth.c
>>> +++ b/drivers/gpu/drm/drm_auth.c
>>> @@ -235,7 +235,8 @@ static int drm_new_set_master(struct drm_device 
>>> *dev, struct drm_file *fpriv)
>>>   static int
>>>   drm_master_check_perm(struct drm_device *dev, struct drm_file 
>>> *file_priv)
>>>   {
>>> -    if (file_priv->pid == task_pid(current) && file_priv->was_master)
>>> +    if (file_priv->was_master &&
>>> +        rcu_access_pointer(file_priv->pid) == task_pid(current))
>>
>> This scares me, and also makes me wonder whether we really want to
>> conflate the original owner with the rendering owner. And also, 
>> whether we
>> really want to keep updating that, because for some of the "bind an 
>> fd to
>> a pid" use-cases like svm we really do not want to ever again allow a
>> change.
>>
>> So sligthly different idea:
>> - we have a separate render pid/drm_file owner frome the open() owner 
>> that
>>    we track in drm_auth.c
>> - that one is set the first time a driver specific ioctl is called 
>> (which
>>    for the "pass me the fd" dri3 mode should never be the compositor)
>> - we start out with nothing and only set it once, which further 
>> simplifies
>>    the model (still need the mutex for concurrent first ioctl ofc)
>
> Simpler solution sounds plausible and mostly works for me. Certainly 
> is attractive to simplify things. And as the disclaimer I put in the 
> cover letter - I wasn't really sure at all if passing a master fd is a 
> thing or not. Happy to implement your version if that will be the 
> decision.
>
> The only downside I can think of right now with having two owners is 
> if someone is "naughty" and actually uses the fd for rendering from 
> two sides. That wouldn't conceptually work for what I am doing in the 
> cgroup controller, where I need to attribute GPU usage to a process, 
> which is a lookup from struct pid -> list of drm_files -> etc. So in 
> the two owners scheme I would just need to ignore the "open owner" and 
> rely that "render ownder" truly is the only one doing the rendering. 
> Or maybe I'd need to add support for multiple owners as well.. would 
> be a bit annoying probably.
>
> Hm now that I think about more.. the one shot nature of this scheme 
> would have another downside. One could just send the fd back to itself 
> via a throway forked helper, which only does one ioctl before sending 
> it back, and then the "render owner" is forever lost. The proposal as 
> I had it would be immune to this problem at least.
>
>> Eventually we could then use that to enforce static binding to a pid,
>> which is what we want for svm style models, i.e. if the pid changes, the
>> fd does an -EACCESS or similar.
>>
>> Thoughts?
>
> This use case I am not familiar with at all so can't comment. Only 
> intuitively I would ask - why is it something that needs to be solved 
> at the DRM level? Because essentially it sounds like there is a want 
> to disallow sending fds via sockets.

I think we should only disallow binding an fd to a different process 
when there is a reason to do so.

For SVM it's an rather obvious security problem when we allow accessing 
the address space of another process. But this should probably be 
handled in the SVM code, not here. E.g. we check during CS if the 
mm_struct is still the same. Which pid or tgid this fd has last or 
initially used it completely irrelevant to this.

For the case of an master fd I actually don't see the reason why we 
should limit that? And fd can become master if it either was master 
before or has CAP_SYS_ADMIN. Why would we want an extra check for the 
pid/tgid here?

Regards,
Christian.

>
> Regards,
>
> Tvrtko
>
>> -Daniel
>>
>>
>>>           return 0;
>>>         if (!capable(CAP_SYS_ADMIN))
>>> diff --git a/drivers/gpu/drm/drm_debugfs.c 
>>> b/drivers/gpu/drm/drm_debugfs.c
>>> index 42f657772025..9d4e3146a2b8 100644
>>> --- a/drivers/gpu/drm/drm_debugfs.c
>>> +++ b/drivers/gpu/drm/drm_debugfs.c
>>> @@ -90,15 +90,17 @@ static int drm_clients_info(struct seq_file *m, 
>>> void *data)
>>>        */
>>>       mutex_lock(&dev->filelist_mutex);
>>>       list_for_each_entry_reverse(priv, &dev->filelist, lhead) {
>>> -        struct task_struct *task;
>>>           bool is_current_master = drm_is_current_master(priv);
>>> +        struct task_struct *task;
>>> +        struct pid *pid;
>>>   -        rcu_read_lock(); /* locks pid_task()->comm */
>>> -        task = pid_task(priv->pid, PIDTYPE_TGID);
>>> +        rcu_read_lock(); /* Locks priv->pid and pid_task()->comm! */
>>> +        pid = rcu_dereference(priv->pid);
>>> +        task = pid_task(pid, PIDTYPE_TGID);
>>>           uid = task ? __task_cred(task)->euid : GLOBAL_ROOT_UID;
>>>           seq_printf(m, "%20s %5d %3d   %c    %c %5d %10u\n",
>>>                  task ? task->comm : "<unknown>",
>>> -               pid_vnr(priv->pid),
>>> +               pid_vnr(pid),
>>>                  priv->minor->index,
>>>                  is_current_master ? 'y' : 'n',
>>>                  priv->authenticated ? 'y' : 'n',
>>> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
>>> index 20a9aef2b398..3433f9610dba 100644
>>> --- a/drivers/gpu/drm/drm_file.c
>>> +++ b/drivers/gpu/drm/drm_file.c
>>> @@ -156,7 +156,7 @@ struct drm_file *drm_file_alloc(struct drm_minor 
>>> *minor)
>>>       if (!file)
>>>           return ERR_PTR(-ENOMEM);
>>>   -    file->pid = get_pid(task_tgid(current));
>>> +    rcu_assign_pointer(file->pid, get_pid(task_tgid(current)));
>>>       file->minor = minor;
>>>         /* for compatibility root is always authenticated */
>>> @@ -502,6 +502,36 @@ int drm_release(struct inode *inode, struct 
>>> file *filp)
>>>   }
>>>   EXPORT_SYMBOL(drm_release);
>>>   +void drm_file_update_pid(struct drm_file *filp)
>>> +{
>>> +    struct drm_device *dev;
>>> +    struct pid *pid, *old;
>>> +
>>> +    /* Master nodes are not expected to be passed between 
>>> processes. */
>>> +    if (filp->was_master)
>>> +        return;
>>> +
>>> +    pid = task_tgid(current);
>>> +
>>> +    /*
>>> +     * Quick unlocked check since the model is a single handover 
>>> followed by
>>> +     * exclusive repeated use.
>>> +     */
>>> +    if (pid == rcu_access_pointer(filp->pid))
>>> +        return;
>>> +
>>> +    dev = filp->minor->dev;
>>> +    mutex_lock(&dev->filelist_mutex);
>>> +    old = rcu_replace_pointer(filp->pid, pid, 1);
>>> +    mutex_unlock(&dev->filelist_mutex);
>>> +
>>> +    if (pid != old) {
>>> +        get_pid(pid);
>>> +        synchronize_rcu();
>>> +        put_pid(old);
>>> +    }
>>> +}
>>> +
>>>   /**
>>>    * drm_release_noglobal - release method for DRM file
>>>    * @inode: device inode
>>> diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
>>> index 7c9d66ee917d..305b18d9d7b6 100644
>>> --- a/drivers/gpu/drm/drm_ioctl.c
>>> +++ b/drivers/gpu/drm/drm_ioctl.c
>>> @@ -775,6 +775,9 @@ long drm_ioctl_kernel(struct file *file, 
>>> drm_ioctl_t *func, void *kdata,
>>>       struct drm_device *dev = file_priv->minor->dev;
>>>       int retcode;
>>>   +    /* Update drm_file owner if fd was passed along. */
>>> +    drm_file_update_pid(file_priv);
>>> +
>>>       if (drm_dev_is_unplugged(dev))
>>>           return -ENODEV;
>>>   diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c 
>>> b/drivers/gpu/drm/nouveau/nouveau_drm.c
>>> index 80f154b6adab..a763d3ee61fb 100644
>>> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
>>> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
>>> @@ -1097,7 +1097,10 @@ nouveau_drm_open(struct drm_device *dev, 
>>> struct drm_file *fpriv)
>>>       }
>>>         get_task_comm(tmpname, current);
>>> -    snprintf(name, sizeof(name), "%s[%d]", tmpname, 
>>> pid_nr(fpriv->pid));
>>> +    rcu_read_lock();
>>> +    snprintf(name, sizeof(name), "%s[%d]",
>>> +         tmpname, pid_nr(rcu_dereference(fpriv->pid)));
>>> +    rcu_read_unlock();
>>>         if (!(cli = kzalloc(sizeof(*cli), GFP_KERNEL))) {
>>>           ret = -ENOMEM;
>>> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c 
>>> b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
>>> index f2985337aa53..3853d9bb9ab8 100644
>>> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
>>> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
>>> @@ -251,6 +251,7 @@ static int vmw_debugfs_gem_info_show(struct 
>>> seq_file *m, void *unused)
>>>       list_for_each_entry(file, &dev->filelist, lhead) {
>>>           struct task_struct *task;
>>>           struct drm_gem_object *gobj;
>>> +        struct pid *pid;
>>>           int id;
>>>             /*
>>> @@ -260,8 +261,9 @@ static int vmw_debugfs_gem_info_show(struct 
>>> seq_file *m, void *unused)
>>>            * Therefore, we need to protect this ->comm access using 
>>> RCU.
>>>            */
>>>           rcu_read_lock();
>>> -        task = pid_task(file->pid, PIDTYPE_TGID);
>>> -        seq_printf(m, "pid %8d command %s:\n", pid_nr(file->pid),
>>> +        pid = rcu_dereference(file->pid);
>>> +        task = pid_task(pid, PIDTYPE_TGID);
>>> +        seq_printf(m, "pid %8d command %s:\n", pid_nr(pid),
>>>                  task ? task->comm : "<unknown>");
>>>           rcu_read_unlock();
>>>   diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
>>> index 0d1f853092ab..27d545131d4a 100644
>>> --- a/include/drm/drm_file.h
>>> +++ b/include/drm/drm_file.h
>>> @@ -255,8 +255,15 @@ struct drm_file {
>>>       /** @master_lookup_lock: Serializes @master. */
>>>       spinlock_t master_lookup_lock;
>>>   -    /** @pid: Process that opened this file. */
>>> -    struct pid *pid;
>>> +    /**
>>> +     * @pid: Process that is using this file.
>>> +     *
>>> +     * Must only be dereferenced under a rcu_read_lock or equivalent.
>>> +     *
>>> +     * Updates are guarded with dev->filelist_mutex and reference 
>>> must be
>>> +     * dropped after a RCU grace period to accommodate lockless 
>>> readers.
>>> +     */
>>> +    struct pid __rcu *pid;
>>>         /** @magic: Authentication magic, see @authenticated. */
>>>       drm_magic_t magic;
>>> @@ -415,6 +422,8 @@ static inline bool drm_is_accel_client(const 
>>> struct drm_file *file_priv)
>>>       return file_priv->minor->type == DRM_MINOR_ACCEL;
>>>   }
>>>   +void drm_file_update_pid(struct drm_file *);
>>> +
>>>   int drm_open(struct inode *inode, struct file *filp);
>>>   int drm_open_helper(struct file *filp, struct drm_minor *minor);
>>>   ssize_t drm_read(struct file *filp, char __user *buffer,
>>> -- 
>>> 2.34.1
>>>
>>

