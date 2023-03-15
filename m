Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB7B6BB45E
	for <lists+dri-devel@lfdr.de>; Wed, 15 Mar 2023 14:19:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8A7910E198;
	Wed, 15 Mar 2023 13:19:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2074.outbound.protection.outlook.com [40.107.223.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14DA610E184;
 Wed, 15 Mar 2023 13:19:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SnKyVjPNSE5dTg5E2IIBNcVeMGdVDm4QY/dUwWYl/FwI71mEBBJDayevfJMULjSBRHGinmScUnIEehac9GFvYbQN7+07HqhTdQH5J+iEO6mQQP1KpkDqcMjN3sHKeQF/69pagFQrSZOjfRaD8FDZ+pu7qaoPzX14eWraWfpdvicMGrCcLHkN4s6DjNpKj8nHu+OEm+uLspZcqN+/LYME3w0SjL70AVHEdpSFDXrdJ2TPjMdC34tyCyoO33/Gjy0UuHfUPAgUW3XIRHVfFb+ns6Ib/Idyc08pjpReoZ6+u4IXndaE1/BvtwNUsw6uO8jNQhndX9aT349he9Tdd1K2GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jisZkeZsvgO4eaA5IgvhCOBQ7zFs0BKboOmhofHbQQs=;
 b=i8jbqjszjr6Uv6bvbqYsoOq6QKtdy1/ijlwMuPpMngBinHEFzYB2JcSPuVeqYX30CaLUhS3/tmLJVnZUFaHCkOBXoBMohhM9CXaQFb5AHye1uV2lzy5uYlbTshcPuF435DpQyqtG9rSZtQ2CFvB3/rxofhyD7tOjpUcnbqDbkYfxUx38e8yipmIy3J51AVdYShF1vzckc0JR5EFKtgzXuM4LXtpXR7hyVPM9sZgfdFx+kHdJ7IJd5gmy/Y3BfJ8WaRWFGaAw9od+MekytpfuUhpW7hnKscWF/wi6LMOkfsUdYwmWAlrG9hos8sn2JPDkCUw2lEJ4JK1cW8PeDesILg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jisZkeZsvgO4eaA5IgvhCOBQ7zFs0BKboOmhofHbQQs=;
 b=eqUGMazZFm9UPY4OVC8pMLzBFMnOStUPcV3q2XW/iT3Gxo/gi9Om4i+8It0tyKUI8CTOsApAlq+1dbbCt6WfudWlorm0W+W0A+LkGLa4KyGOwdO84EkOymnr5qcNac2mkXcmUFmgCby07Nf/rXFIse0TcWt4YsC+/MCqQ0YRz7A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by IA0PR12MB8352.namprd12.prod.outlook.com (2603:10b6:208:3dd::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Wed, 15 Mar
 2023 13:19:24 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918%4]) with mapi id 15.20.6178.024; Wed, 15 Mar 2023
 13:19:24 +0000
Message-ID: <4213d6df-08ef-dd9e-180b-944981f1427e@amd.com>
Date: Wed, 15 Mar 2023 14:19:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC 01/10] drm: Track clients by tgid and not tid
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20230314141904.1210824-1-tvrtko.ursulin@linux.intel.com>
 <20230314141904.1210824-2-tvrtko.ursulin@linux.intel.com>
 <2d4c10c7-6406-7458-4f52-4260b415874e@amd.com>
 <b3b63d6e-438e-1b5a-6d01-6164c2160f75@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <b3b63d6e-438e-1b5a-6d01-6164c2160f75@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0171.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::16) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|IA0PR12MB8352:EE_
X-MS-Office365-Filtering-Correlation-Id: 05ab3252-c5a2-4017-c86a-08db2557e54d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BkeW/2CMJb8CyzX4ggRvkJIn23he4K7wwTscwgCIPj2kF6wh4urvcqbDZt+bbcQ2wYgbVBbqGI2BD1p0R/lkSiVFm6DQxE1bhcMJHZRcpG/IbaY+svTMnW/DE7iEUMpZGLioO5+IAm3ZnZ42V+qnEjV1bxAnDjzfPR3oXcKowLC2hU1X8YXK32AhwhW60bF7wQ0IF7SE0pwBzY5NnbALe24y5i3thGWF0V7S7NAHgxmVt7RSR/mZ40i4IUu5Nl9SPKxS8ukvS3wP62pMhWhfjcgM3SU3wV3261I0g7m+xp5EcogSZFl2qZWHaFEzJwvi00MXet0doI94X7BmMonJEFktXrgDFFB65jOihOMLA69a7Yrlp9s/JjMp63GMFaTQqGefi7I0K+v+fuE6K84oJPojyosmho3mM1oXd8aJJMdn86xg52r2ZqYFAOyZ8fCUh2KpKAweFwPkWSdHQYCLlokbA476OZwyYNzUlPQhVnCyvwMaiRvmt/iQLwiXNMYBO0cQdh2q852Ff8qetsNXKigMraOQAnnifFyktjDTKUvdyygQRCTOWeOMNXsqRDRspV5Yxfx13BENbmel5O6v1TSqYNiu0K+/vwuw1MxMtEHym04ym+E3oBqH23TwcoBoIWPiG/6O1lRLGazNDDnXQwoVwbGhmwE7lryo65U1Wu/ZQGiy5tzilftRlsVOdIf55vaMEUltHT3d87Z14rBuV7wvytbIej1ek2S3iybDcxY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(39860400002)(396003)(376002)(346002)(136003)(451199018)(2906002)(316002)(66556008)(4326008)(41300700001)(31696002)(36756003)(478600001)(54906003)(66946007)(86362001)(66476007)(38100700002)(6486002)(5660300002)(8676002)(66574015)(6512007)(53546011)(6506007)(186003)(7416002)(31686004)(2616005)(6666004)(8936002)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VjdZZ0ZITERzVUVtUHNZRVlZVW16S2xoWjVRa1lqMElLNE5qVHJqNjVLTlJl?=
 =?utf-8?B?NGY0Zy8zcWdYY0pid3B2MzhZSzVXZkxVbXREa0NuQ3FpekMxdlpCOExDcTIw?=
 =?utf-8?B?M1Z6bjU3TE8vamU4cTBBTlVOWkM2QlJlYUFzeW45NXBjVFZGNHp4Tno0V2c2?=
 =?utf-8?B?VW44RGViU3kxQUhoTlJtclJIWE12ZWV5MmJ3T0lRbFZZcSszNnIxdEl2dThD?=
 =?utf-8?B?QXFIL0RGSlZoWHlNNzNOMUtISjFISzk4SUhDYlI5bDFueExaUHpHcjhHc1ZF?=
 =?utf-8?B?NGF0bzZLM0ppa1RteFppYkM2YXhoT1Z2bnFWZVp4SWRLVDRVVHBPbUN5UnhU?=
 =?utf-8?B?YVlCS2EzS0RyVUJRWGpnNFBLQ3ZVMC9oWmI2NlBOR1Nsa2VvWmliWGV6MlpZ?=
 =?utf-8?B?b3puY1VlejRVUUMvU1pwQ3BhSzN2OVU0d21iQlF5UFJPcUE4bzRVdTY5a2NV?=
 =?utf-8?B?d3ZrYTR2TVBHOXZrU0U1TWtPc1MxZnpCQjd6b0RvcXJqZFpra1UyZitPYmM1?=
 =?utf-8?B?S0k0dHZabkw2MFFiMnN1b3FzRnBFTjV2RmRzRXVnenQ5NmV1ZTB2cEhKR0Ur?=
 =?utf-8?B?SHRlbU4rREQ2N0ZFV2tGYytON0RvOTlkb0RzM0tUK0laekIrc3NtL1pLRUd1?=
 =?utf-8?B?c0gyd2IrSGlpMlBhaDQzQkJXT3lvZG9rRmgxZ2d2UWU3M0V2V0JjY1l6eWZ4?=
 =?utf-8?B?ZUhaclBnZC9xa1VLQk02VDRzTkkwazRHNkpCcVE5MVFVbUR6emdkc0J1dExm?=
 =?utf-8?B?a09ZanU1QlFLcU9BTjF4a3UwMmdpYUlWU0xQQjVDeEVyM3JpTERtM3ArR0l5?=
 =?utf-8?B?U2dlY0tTUFNRcGk2QXJXTjlzVnA5TEpBWmpVUENmcVp3REZDRkpvcTZ4MmdQ?=
 =?utf-8?B?QXJlVzRCRS9CRXQ2U1QzN0plclNoeXBzYUtKWGZhY3hJY04zRVp4Z3pvdGhK?=
 =?utf-8?B?Uml3WnVJYXJIUDNTWjAwcXhtdmR0WDExS3hybUsrWE5rQ095YnIrVDFqcDJN?=
 =?utf-8?B?R3Bld2RjZTByKzR1SXZJMlZWaUg1TVNQYk0zNk9ZdHY1MlJobzdrZXBkRnNl?=
 =?utf-8?B?dmg1L2lCcytHdDNQUnQyditLTUZsb1daVDM2SGliemRmb2tHci9Qd0RtYk5a?=
 =?utf-8?B?ZWdBL3pUN3hDejVlY0dPRlVsQ1VWSThxQzJSSGF5Z2xWRkdVQTZqSjBQVVkv?=
 =?utf-8?B?T0E0QnVsaUZDU0kzOVpjMmY1d3kvbGpUaE1teVFGWVJIMWYzVHJISHdNanEr?=
 =?utf-8?B?MzRRaUFtT1lNQzlDZzEzbHZEM2hpT0RPSnZuNnRhNnd6ME9NOTlVOEhGVWU4?=
 =?utf-8?B?K3dSZEdha1J3Y2pRTWVGNHoyOXlhR0w0dEZOSE9FR1RPV01XdjZFMnptOEJ4?=
 =?utf-8?B?cCtKK25yMjYzZDBHTjBlMm9Tek5nMXlLemgvbTdoR24xdFVtbFdGbEs4SjB6?=
 =?utf-8?B?cHNHUjM5VHpTWjJ1L3V0MUExcGd1cURsUDdqMTU3b0xWL0JXRGpEa3lPMEtC?=
 =?utf-8?B?MHhyd3I1a2pLZEJ4M0JVTEFNejVzUTFZczU3N3pncUZKR0N6Q0k1OU1wbGRE?=
 =?utf-8?B?RDVMVDNDS1VCTm9VTi8xcTE1ZCt1OTBHaHVGNmpobjJtVUxDV2VmdlBzSHE0?=
 =?utf-8?B?SncyV0F3V0ZKYXdnYllmdjhEYTliaEZoeTVtUE92ZndTYnhtL2pkSnczZ2Iw?=
 =?utf-8?B?UW0ycWFNMmJRbnVtZmluSmlRZjBxdlZWQnNkNVV0cXRRUXh5Ylh2NWRLZHda?=
 =?utf-8?B?dWpHSDUxSkxzTnN4Vk9Rb2JmVkE2b1lJRFN4M01xUzVEdVl0SGxtbVo2OW9H?=
 =?utf-8?B?RVplaTZiSWlMcXFIalZieWtTTks4Wm8rV1ltNWg3U285SnVoMVNlZFRQaVN2?=
 =?utf-8?B?ZHpvWGpwYnpTZHcyaFlidVZaemxpUjN6Mkthd0tOZmsvSC9jclZiR3Z2b21n?=
 =?utf-8?B?b0M4bWc1dTk5N0p0aUdZV3BFMHdOR20vOFM0MUNYVm1Jdk9hWUhVQitsbTJJ?=
 =?utf-8?B?OVZ6Zjk2OGRjazZaM0Y3b3pUMExGQXZSNlVmd3VmUzhtSXJmL2ZRblJ5WmN2?=
 =?utf-8?B?VlM3QnFvbjFTTFJxNGFIa3NrdmN3ckEwdjhLS0JyUlZJekdLZjkrYnRLOEVM?=
 =?utf-8?B?Smk5Y051WGRZUmlnV2ZwcFdJS3ZGT1pBYjJpdjVCcENGQWZtTEFHWGN6U0wx?=
 =?utf-8?Q?+tq5hKw+BNZw0YoBalSXY0cCTTO/sVNbUUIrH5pIQTSZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05ab3252-c5a2-4017-c86a-08db2557e54d
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2023 13:19:24.5800 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZJX8aOFunvZLFD4AF+qple/2jEDLlbC2042t4OFbgVjkpEjC5oLqqgO+1glbpyP8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8352
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
Cc: Rob Clark <robdclark@chromium.org>, Brian Welty <brian.welty@intel.com>,
 Kenny.Ho@amd.com, Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Johannes Weiner <hannes@cmpxchg.org>,
 linux-kernel@vger.kernel.org,
 =?UTF-8?Q?St=c3=a9phane_Marchesin?= <marcheu@chromium.org>,
 Alex Deucher <alexander.deucher@amd.com>, linux-graphics-maintainer@vmware.com,
 Zefan Li <lizefan.x@bytedance.com>, Dave Airlie <airlied@redhat.com>,
 Tejun Heo <tj@kernel.org>, cgroups@vger.kernel.org,
 "T . J . Mercier" <tjmercier@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 15.03.23 um 10:52 schrieb Tvrtko Ursulin:
>
> Hi,
>
> On 14/03/2023 15:33, Christian König wrote:
>> Am 14.03.23 um 15:18 schrieb Tvrtko Ursulin:
>>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>
>>> Thread group id (aka pid from userspace point of view) is a more
>>> interesting thing to show as an owner of a DRM fd, so track and show 
>>> that
>>> instead of the thread id.
>>>
>>> In the next patch we will make the owner updated post file descriptor
>>> handover, which will also be tgid based to avoid ping-pong when 
>>> multiple
>>> threads access the fd.
>>>
>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>> Cc: Zack Rusin <zackr@vmware.com>
>>> Cc: linux-graphics-maintainer@vmware.com
>>> Cc: Alex Deucher <alexander.deucher@amd.com>
>>> Cc: "Christian König" <christian.koenig@amd.com>
>>> Reviewed-by: Zack Rusin <zackr@vmware.com>
>>
>> Reviewed-by: Christian König <christian.koenig@amd.com>
>>
>> Should we push the already reviewed cleanups like this one to 
>> drm-misc-next? That makes sense even without the rest of the 
>> functionality and reduce the amount of patches re-send.
>
> I don't have the commit rights so if you could do that I certainly 
> would not mind, thanks!

I've just pushed this patch here to drm-misc-next. As soon as Daniel or 
Dave gives his ok as well I'm going to also push the second one.

Regards,
Christian.

>
> Regards,
>
> Tvrtko
>
>>> ---
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c | 2 +-
>>>   drivers/gpu/drm/drm_debugfs.c           | 4 ++--
>>>   drivers/gpu/drm/drm_file.c              | 2 +-
>>>   drivers/gpu/drm/vmwgfx/vmwgfx_gem.c     | 2 +-
>>>   4 files changed, 5 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>> index d8e683688daa..863cb668e000 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>> @@ -969,7 +969,7 @@ static int amdgpu_debugfs_gem_info_show(struct 
>>> seq_file *m, void *unused)
>>>            * Therefore, we need to protect this ->comm access using 
>>> RCU.
>>>            */
>>>           rcu_read_lock();
>>> -        task = pid_task(file->pid, PIDTYPE_PID);
>>> +        task = pid_task(file->pid, PIDTYPE_TGID);
>>>           seq_printf(m, "pid %8d command %s:\n", pid_nr(file->pid),
>>>                  task ? task->comm : "<unknown>");
>>>           rcu_read_unlock();
>>> diff --git a/drivers/gpu/drm/drm_debugfs.c 
>>> b/drivers/gpu/drm/drm_debugfs.c
>>> index 4f643a490dc3..4855230ba2c6 100644
>>> --- a/drivers/gpu/drm/drm_debugfs.c
>>> +++ b/drivers/gpu/drm/drm_debugfs.c
>>> @@ -80,7 +80,7 @@ static int drm_clients_info(struct seq_file *m, 
>>> void *data)
>>>       seq_printf(m,
>>>              "%20s %5s %3s master a %5s %10s\n",
>>>              "command",
>>> -           "pid",
>>> +           "tgid",
>>>              "dev",
>>>              "uid",
>>>              "magic");
>>> @@ -94,7 +94,7 @@ static int drm_clients_info(struct seq_file *m, 
>>> void *data)
>>>           bool is_current_master = drm_is_current_master(priv);
>>>           rcu_read_lock(); /* locks pid_task()->comm */
>>> -        task = pid_task(priv->pid, PIDTYPE_PID);
>>> +        task = pid_task(priv->pid, PIDTYPE_TGID);
>>>           uid = task ? __task_cred(task)->euid : GLOBAL_ROOT_UID;
>>>           seq_printf(m, "%20s %5d %3d   %c    %c %5d %10u\n",
>>>                  task ? task->comm : "<unknown>",
>>> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
>>> index a51ff8cee049..c1018c470047 100644
>>> --- a/drivers/gpu/drm/drm_file.c
>>> +++ b/drivers/gpu/drm/drm_file.c
>>> @@ -156,7 +156,7 @@ struct drm_file *drm_file_alloc(struct drm_minor 
>>> *minor)
>>>       if (!file)
>>>           return ERR_PTR(-ENOMEM);
>>> -    file->pid = get_pid(task_pid(current));
>>> +    file->pid = get_pid(task_tgid(current));
>>>       file->minor = minor;
>>>       /* for compatibility root is always authenticated */
>>> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c 
>>> b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
>>> index d6baf73a6458..c0da89e16e6f 100644
>>> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
>>> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
>>> @@ -241,7 +241,7 @@ static int vmw_debugfs_gem_info_show(struct 
>>> seq_file *m, void *unused)
>>>            * Therefore, we need to protect this ->comm access using 
>>> RCU.
>>>            */
>>>           rcu_read_lock();
>>> -        task = pid_task(file->pid, PIDTYPE_PID);
>>> +        task = pid_task(file->pid, PIDTYPE_TGID);
>>>           seq_printf(m, "pid %8d command %s:\n", pid_nr(file->pid),
>>>                  task ? task->comm : "<unknown>");
>>>           rcu_read_unlock();
>>

