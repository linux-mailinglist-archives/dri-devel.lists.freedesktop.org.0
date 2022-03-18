Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E28484DDD9A
	for <lists+dri-devel@lfdr.de>; Fri, 18 Mar 2022 17:04:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A95710E27C;
	Fri, 18 Mar 2022 16:04:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2086.outbound.protection.outlook.com [40.107.220.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38B1510E0E6;
 Fri, 18 Mar 2022 16:04:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MfAqL80DBGXKoUlKh1v4w+3TzdL1B8o776UaTqWOAcKajNuHvBBn2+YJTURIr8fLDSyLUY/MDXA7WVWpBMyXgP4lRtFqQlaDSJmNzhWOv65cP7j7dx3dApl3QE6BArY0LjYcjqvVEblBJAJrA04fL4eLqztD5CB6IEAJQBlm2FEMiseU/UDo+YTcILUF74Y9dkIW9/rSBzdZlHTsHX1XfEaVsUSFXJxurxGo1UjztSEXyFjkuEnOVbaOO+1TAM5YvjwKPlqFcTjQrAL5WFnyMH5dXKZJBKmzA8UcQJA4+SNUb+RpZgvlyl74nldMfLCPqzTA2FWV4WfCxZoSXdSaqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z7lsuGrL8lK6NstLjmwDyqp4+fKWPjZb+tB53mAXwMg=;
 b=JgV08op537GZ2KfCqqocG9Pb/RfdG9AaGllBD9RADzz6u438TMDnJgRGoPY5OgVSzCK4GIYVi/DKsDW0I9W8MnJcEWYi69h6UkGYVPXxzZ2Vn4nGh8jtnYp9z+xcQl5sTEXdqogiQmnt7CMPzmx66aMiBazUkD34p+7IitG/IRzDv6WdTEtGgpRDHTNFbVP4Y8a4v1Poh2/SRyZCH+va5IN7g+hDHcYqkK+gbZwVZd8x1kqZn1XmpvnHPLtBRGWKqIQcAompJ/W9eOlgtEO8Gl1k+BLmui+fcVXLfjItfmVk5/MXv/gYQQ3j4jXPt3Xcxwu5BQNVxhf6ZtfzeyprHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z7lsuGrL8lK6NstLjmwDyqp4+fKWPjZb+tB53mAXwMg=;
 b=lL3R0+JeKT6mH9aJpsMzf4+Mab8b0v9+29ZLdW9rqtrBjd3z+8phyCwXSgeqdwnnjyb9GxFR+8fOesqIvHsNSZiupKQKX6hNMdU9Ou1WYC/tuonlVFW/y7gxPl2shdC+RHZK7i/CH8pI45ddObB+li1X7G8+J3jzSL4CxXCaW4Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by DM6PR12MB4041.namprd12.prod.outlook.com (2603:10b6:5:210::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.18; Fri, 18 Mar
 2022 16:04:46 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::90bd:5b12:918d:5703]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::90bd:5b12:918d:5703%6]) with mapi id 15.20.5081.017; Fri, 18 Mar 2022
 16:04:46 +0000
Message-ID: <dd7d3f20-8288-3a7c-a368-a08282746ff1@amd.com>
Date: Fri, 18 Mar 2022 12:04:42 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/3] drm/msm/gpu: Park scheduler threads for system suspend
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>
References: <20220310234611.424743-1-robdclark@gmail.com>
 <20220310234611.424743-3-robdclark@gmail.com>
 <YjMGac4Hnjmg1wE8@phenom.ffwll.local>
 <3945551d-47d2-1974-f637-1dbc61e14702@amd.com>
 <CAF6AEGv36V8bLoDn5O1SW3iTUtzd3O1XeuT5gJxyLMxd1E-o3Q@mail.gmail.com>
 <865abcff-9f52-dca4-df38-b11189c739ff@amd.com>
 <CAF6AEGuoBeYoMTR6-KM9xGZ05XSSnSJWMDciawczi7qtiLN9Vw@mail.gmail.com>
 <915537e2-ac5b-ab0e-3697-2b16a9ec8f91@amd.com>
 <CAF6AEGsyFAOPmHqT7YX1wsukP4-gYAstCukr89r9w28V0YSCUw@mail.gmail.com>
 <3a475e5a-1090-e2f4-779c-6915fc8524b1@amd.com>
 <CAF6AEGtPrSdj=7AP1_puR+OgmL-qro0mWZDNngtaVPxpaCM76A@mail.gmail.com>
 <1c847474-8ee1-cc7e-3d4d-261a4e92fb2d@amd.com>
 <CAF6AEGuw45gi4f+mVs7cVyjCHY9O4N1O8OfuGHv-wAkzP3UpMA@mail.gmail.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
In-Reply-To: <CAF6AEGuw45gi4f+mVs7cVyjCHY9O4N1O8OfuGHv-wAkzP3UpMA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT1PR01CA0154.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::33) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 78995ad6-f97b-4504-a14e-08da08f90585
X-MS-TrafficTypeDiagnostic: DM6PR12MB4041:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB4041E36901858A4EE90DAB0DEA139@DM6PR12MB4041.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZEXniKETGhfF9P6FCfyINMU0zitNAK9HSwCkLH3+rBX12Pe1F1RofGixoIKGSXYjI2B5w1PzjV+ZvYIMEjf+iZ0JTyNk74f4VODTK5muKhj5MwTmy0XOkpzKiDVBACH2GoUwXhOsfA30yFuRtDEIB7ARUbdl1h1g9ZvtLqCEIicoxh+iyJ38VULZWa3CnADQN6wrjOecu3hUUFTmBBGRpxBXTXX0ZWqq2aJcT03EpFfjUa/TlyVRjKDyNEzJ/1dlM8pxG4Awm8cE5UYNVWmelR/Pd3GwSPUc8BKkCEoPH+Avbush0ilQYVPGAL+EipNuJ/343xmeD8oQwE8ilq0m2tX0j58bk2ZA8owAGJYe+91DVUWlpxhslTBPpF7GsijuqmYBRPc6GU67C62RK2S9ljH6t2iOJAjhsZQkSD2uMQ1ucTGt2uh4NVJaJAp87K/V5qr+EeALV0LuSG/ftkl3xnNvOcNjs54GHp5ipu+xSt2Oap1g4JfGjL1FU6QpRyjsufrVwr+JnBdmsv5wXW5aR/GyZOriHwVVtlHMjkVBdG+N5SVNmLF2MPx7OUF0fzgf/S4QPPaAofbpPFPBzmk8LNBpU69Cz3YfHP48xgc7QY7nJpJ60PCtdKOE1R6aYOk3FltNmuMxzST4EnIcx5BjeALoOntkc7zMr2BVJLDNCn8QZlt4LCpXztaXNk912hoL1yE9oRCu9u8KuoRcnXIC4JgYm8a+3DwmpeVKJ4M+ThU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38100700002)(15650500001)(186003)(66574015)(6506007)(53546011)(2616005)(6512007)(2906002)(83380400001)(66556008)(8676002)(66476007)(31696002)(86362001)(6916009)(54906003)(316002)(4326008)(8936002)(36756003)(31686004)(7416002)(5660300002)(66946007)(44832011)(508600001)(6486002)(6666004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YmlSMlJnUjdwMytRSForcmxmR2duVDFnY0dFOXQyV3ZIcXU4Zzl6RTh6UmVu?=
 =?utf-8?B?TkQrZzBZeUhWWndlMEVFSEFDWlZkNEFOd0lEQy8zMmVHV092TllYRHR6czVW?=
 =?utf-8?B?VGlxZG11bjNTbGJOdE8zZXpVTS9iRWppYlRTekN0MjdZaDVka2JST0FEZU5a?=
 =?utf-8?B?N203azgxcVRXVEpTTjVtcXF3TWwrY3ZJRXZudXlqdno4R2FaSFJPbS80QjRE?=
 =?utf-8?B?RlhwQVpmcWY1c2dZNFBIeGl4ZDJNR3JtWUNidGY3TW9RMGd4U056QjVLMDlj?=
 =?utf-8?B?aHMwOTdXcGZOVzlBZFpSSzBZTzYwSnYvRGY2RjY3OWdIZEllaVdtbm5LV1pU?=
 =?utf-8?B?Y21yTkJ0dWVYNG9uVWJGR0RXdFlGOXVXengrd3BuZTBkdEZ0eEIwWnVaajIy?=
 =?utf-8?B?NDZwb3RUOG8yZUlXa0JqYjROK1Z6SVFScVF3SkZ3UXM4R1N3YmZac3NUMkE4?=
 =?utf-8?B?MEYrTHpGb1Z2MjRNRXFJWGN5Qjc4QStwekhZOXhVaFR4VzVyVlNkT3RJaGc5?=
 =?utf-8?B?TFM3SVhZc0I5SlcweGlQd1F1Wi9CRmovZm5ZKzIvTUN5ZXh1Tjd6OUdISmpw?=
 =?utf-8?B?NEhNYzlDOUV0Z0FXUjRVSVNTRDFGbno3UjZ5LzJKQnNBcmt0a1ZWdSthZ0dM?=
 =?utf-8?B?ekE0c0NJa1VUVUE2Q29kL2FweEc3T3BXME90RXpnazMwbTNDNEtlVGgvSnZj?=
 =?utf-8?B?eUlCeXpnR3U5Z3V6RTdXWGhpd3FaL0tYbG9IRkxPZHBNR21ORGtYdWdkK1Vv?=
 =?utf-8?B?VzhqblgzelVDdnJUMDdKVGJHaUs3Y3IzTmtYV01jRHVvOWoyLzVNZjFUbVNv?=
 =?utf-8?B?QWs5Yy9hZ3M1aUpXbS80SW9YRnVpNXBjQkk0UjJjdDFOMllhd0JtbW4yeFhm?=
 =?utf-8?B?dktzQU9uNG9mOEdQT2xmOEwydUxkSFJLZkdOL1NNOU9lSCsyNUhMTzRTY3hG?=
 =?utf-8?B?NDlnSEI2YUp0anBncEppRTFNb09seFpIVGRxd01jZm5Xa2wvcC8vRzZES3Nm?=
 =?utf-8?B?eFhOMmE0MTJhZTFFL3NBeGxmeWpsdzlpamh3eEVoSmlpajF0RzdheWRZUDRw?=
 =?utf-8?B?bzZnaUNRMXlIbGxkK1Q2Q1ZId1daZU1ldEhidCtqOGhvaUFWM2dRNE1Gb3N5?=
 =?utf-8?B?ZG1UU3RaV1RNWHpMOTc1RjZxM2YxOTFidDRkbXQzSGljbzJjYW9OOTJWbUpa?=
 =?utf-8?B?Z2RSQ21zU3R0ZU5YSWt1czFuSU9TR0ZkV3NGTU5nQVcrSDlCVzBRMmRMc3Fp?=
 =?utf-8?B?RlgyWEhyNnlUelROaHhMbHV1bGdwUkFWY2wwOFJ1YXR3WmhtY0IzWkRmd1VQ?=
 =?utf-8?B?SFpUd016V2l1azd2c0Rrc0NGSkVyN2pnc044UFluTlhlT1hQN0gwdUtJbTkx?=
 =?utf-8?B?YnRSUUxHMUJTSGFZUjhUNHB0MWVpS0dURjk3L2dqd1ZndysyS0V6eVozWkNu?=
 =?utf-8?B?Q3NZSUI5cTNod3J3T2xkNVN2WFZTRHRPT2svcHQ2S0hha2dUVFQ0c0hLMzNK?=
 =?utf-8?B?Unk1VHZtRjRoWmlKd1JkWFcwemtSTU9ZakZvMVZVblFNSTY1RkZqcEdDYUVW?=
 =?utf-8?B?cFFPTUR5NytrdVV6T3Jwdm0vRFNFbWhndHBCcTdmblRtbnl4R3NKOE5XWU5y?=
 =?utf-8?B?U1UzUHdHNHhWMW1KZEd3UVNCQjVZWTZnZFZyaWR6Q0pCdDZpdmEwMEJpand2?=
 =?utf-8?B?LzVLb1Z0cHV4czF1Y3l2clB2ZmNZMXdJZU8ycUQ1NU92N3d3aEZTMnVFZTFE?=
 =?utf-8?B?MDNFUXVlRXI0UGlXVy9OY2w2K21NaGp5T0h6UHFXWTBqc2MrY2lPUVVMR1NQ?=
 =?utf-8?B?dnZQSkU2ODNuVjlpajlSY3I4L1JWaDE5SVp0S09NN0E3cjBPczNHdlpyKzVo?=
 =?utf-8?B?WVBhRUhKUEZhWDN3YVJQNkdpK3JSYm5zeWpXbG5iYlJvUnQrODRkZXcvWjlU?=
 =?utf-8?B?OUljRWVzV0tWRVBKMDlkZ0FGSUlZeE10alZMaC9aRDBpeGhDN2U0dnQzamRo?=
 =?utf-8?B?N0cvMktCVW1jb0ZxNmxyNjFuakpickN1SkUyMzVjbzk1Z2VZQURLNERRUlB4?=
 =?utf-8?Q?FMOzZ0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78995ad6-f97b-4504-a14e-08da08f90585
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2022 16:04:46.1368 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lFV03Y/EY1tXRKp4cnUoRJrYiATbw5eYPKCmzjQwlE0aq7uG+bEW9n2PrQ0tiVBG5Z541QnaBkZPTqtBBV/XHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4041
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
Cc: Rob Clark <robdclark@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 "Alexander.Deucher@amd.com" <Alexander.Deucher@amd.com>,
 Sean Paul <sean@poorly.run>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 open list <linux-kernel@vger.kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2022-03-17 16:35, Rob Clark wrote:
> On Thu, Mar 17, 2022 at 12:50 PM Andrey Grodzovsky
> <andrey.grodzovsky@amd.com> wrote:
>>
>> On 2022-03-17 14:25, Rob Clark wrote:
>>> On Thu, Mar 17, 2022 at 11:10 AM Andrey Grodzovsky
>>> <andrey.grodzovsky@amd.com> wrote:
>>>> On 2022-03-17 13:35, Rob Clark wrote:
>>>>> On Thu, Mar 17, 2022 at 9:45 AM Christian König
>>>>> <christian.koenig@amd.com> wrote:
>>>>>> Am 17.03.22 um 17:18 schrieb Rob Clark:
>>>>>>> On Thu, Mar 17, 2022 at 9:04 AM Christian König
>>>>>>> <christian.koenig@amd.com> wrote:
>>>>>>>> Am 17.03.22 um 16:10 schrieb Rob Clark:
>>>>>>>>> [SNIP]
>>>>>>>>> userspace frozen != kthread frozen .. that is what this patch is
>>>>>>>>> trying to address, so we aren't racing between shutting down the hw
>>>>>>>>> and the scheduler shoveling more jobs at us.
>>>>>>>> Well exactly that's the problem. The scheduler is supposed to shoveling
>>>>>>>> more jobs at us until it is empty.
>>>>>>>>
>>>>>>>> Thinking more about it we will then keep some dma_fence instance
>>>>>>>> unsignaled and that is and extremely bad idea since it can lead to
>>>>>>>> deadlocks during suspend.
>>>>>>> Hmm, perhaps that is true if you need to migrate things out of vram?
>>>>>>> It is at least not a problem when vram is not involved.
>>>>>> No, it's much wider than that.
>>>>>>
>>>>>> See what can happen is that the memory management shrinkers want to wait
>>>>>> for a dma_fence during suspend.
>>>>> we don't wait on fences in shrinker, only purging or evicting things
>>>>> that are already ready.  Actually, waiting on fences in shrinker path
>>>>> sounds like a pretty bad idea.
>>>>>
>>>>>> And if you stop the scheduler they will just wait forever.
>>>>>>
>>>>>> What you need to do instead is to drain the scheduler, e.g. call
>>>>>> drm_sched_entity_flush() with a proper timeout for each entity you have
>>>>>> created.
>>>>> yeah, it would work to drain the scheduler.. I guess that might be the
>>>>> more portable approach as far as generic solution for suspend.
>>>>>
>>>>> BR,
>>>>> -R
>>>> I am not sure how this drains the scheduler ? Suppose we done the
>>>> waiting in drm_sched_entity_flush,
>>>> what prevents someone to push right away another job into the same
>>>> entity's queue  right after that ?
>>>> Shouldn't we first disable further pushing of jobs into entity before we
>>>> wait for  sched->job_scheduled ?
>>>>
>>> In the system suspend path, userspace processes will have already been
>>> frozen, so there should be no way to push more jobs to the scheduler,
>>> unless they are pushed from the kernel itself.
>>> amdgpu_device_suspend
>>
>> It was my suspicion but I wasn't sure about it.
>>
>>
>>> We don't do that in
>>> drm/msm, but maybe you need to to move things btwn vram and system
>>> memory?
>>
>> Exactly, that was my main concern - if we use this method we have to use
>> it in a point in
>> suspend sequence when all the in kernel job submissions activity already
>> suspended
>>
>>> But even in that case, if the # of jobs you push is bounded I
>>> guess that is ok?
>> Submissions to scheduler entities are using unbounded queue, the bounded
>> part is when
>> you extract next job from entity to submit to HW ring and it rejects if
>> submission limit reached (drm_sched_ready)
>>
>> In general - It looks to me at least that what we what we want her is
>> more of a drain operation then flush (i.e.
>> we first want to disable any further job submission to entity's queue
>> and then flush all in flight ones). As example
>> for this i was looking at  flush_workqueue vs. drain_workqueue
> Would it be possible for amdgpu to, in the system suspend task,
>
> 1) first queue up all the jobs needed to migrate bos out of vram, and
> whatever other housekeeping jobs are needed
> 2) then drain gpu scheduler's queues
> 3) and then finally wait for jobs executing on GPU to complete


We already do most of it in amdgpu_device_suspend, 
amdgpu_device_ip_suspend_phase1
followed by amdgpu_device_evict_resources followed by 
amdgpu_fence_driver_hw_fini is
exactly steps 1 + 3. What we are missing is step 2). For this step I 
suggest adding a function
called drm_sched_entity_drain which basically sets entity->stopped = 
true and then calls drm_sched_entity_flush.
This will both reject any new insertions into entity's job queue and 
will flush all pending job submissions to HW from that entity.
One point is we need to make make drm_sched_entity_push_job return value 
so the caller knows about job enqueue
rejection.

What about runtime suspend ? I guess same issue with scheduler racing 
against HW susppend is relevant there ?

Also, could you point to a particular buggy scenario where the race 
between SW shceduler and suspend is causing a problem ?

Andrey


>
> BR,
> -R
>
>> Andrey
>>
>>
>>> BR,
>>> -R
