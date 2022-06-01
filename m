Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02DD653A000
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 11:01:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A090010E1DB;
	Wed,  1 Jun 2022 09:01:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2073.outbound.protection.outlook.com [40.107.243.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0849110E1DB
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 09:01:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=El0RwAfA/cfera25CBsH6uQ8lja27yJv2Kii48DXZVPZ/tyJKKNZ2SLvMHO+F5BV1yAzm6oQdAuFcy2HSzSbLu2M7F/S6MrR9EzBom4Ib8hlT7tdHffACXdru7wcHqzII4VOkd+Ny6F4BJlc15rE01z5dXT3WIqDNWC5vAPnFq1eEgoYdfHMTKQRpnsVUgpiNjwFPgbKQ5Dbivv0T0uDPx4h1zZIjzHRHAERG7R+S5HlLnGQkHXuJNhNigX+XEFbMo8QegnfwJvBh81gdwvt8dz/ZwjM22iAwtvKtUsvZlW4Ke2Rn2ygwxucknn0iK4tfRt5rBLx5l3gWzfmFIe81Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RRqvo6V6orXPZ3zVoYkVBFX5PFA6bCd91NKyq40QNYc=;
 b=Tg3Fh6tG6P+/EfZia8YGk6MF8zkw1kjKuXftTh+b2jg5k7C6SnmCfVV0inOhQGdnkhMTbl2cQnppi6PSfN0a/pI93NPsPHhlx3AdR0U1RAg21vede/kSIxT163oNggsgXdYi4cDDFaooinlPZVmnRPy6qOevUu4B5xcgdeViu6OeEMV3A5ofr5QkqFbwakBJyCo1pv1Z3XR3yzsCICYvSVHchD2fPf2TzzRE2PfWt+WL4ufkaIpePkdWUYrbU75Sxv6zL3DWzIS59Cjdhb41ZPwh3RtrO18/DHZw61qTbSKzF67oBY3qq/MH39MMn0yuvxKD2ircQnEz7oM9SzTodA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RRqvo6V6orXPZ3zVoYkVBFX5PFA6bCd91NKyq40QNYc=;
 b=Y2UAZMNCUezXBNCZJo9RW6BQFtVLBx5ptSesYLxKYtQsHOe1WW/4a/BeJRWghe+9w9LkuhSXRSYJjj6XjVbU8M7yz41e7VLUSujhh+a8+GIqUmxlZQ7fUpB+ZSaa5GFbGC+B0Dd7R+y6qGWXMwi2qFz7O72gx9s4q2BpKRlYB8c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BN6PR12MB1620.namprd12.prod.outlook.com (2603:10b6:405:10::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12; Wed, 1 Jun
 2022 09:01:46 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7146:65ee:8fd3:dd03]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7146:65ee:8fd3:dd03%4]) with mapi id 15.20.5314.013; Wed, 1 Jun 2022
 09:01:46 +0000
Message-ID: <bd850268-8324-79cb-854f-b0c843f9581b@amd.com>
Date: Wed, 1 Jun 2022 11:01:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RFC PATCH 3/5] drm/amdgpu: Allow explicit sync for VM ops.
Content-Language: en-US
To: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
References: <20220601004014.158247-1-bas@basnieuwenhuizen.nl>
 <20220601004014.158247-4-bas@basnieuwenhuizen.nl>
 <e4d8ea99-ceb5-b0dc-362f-94e37b9ddc6b@amd.com>
 <CAP+8YyEy8R3nbJVFkqHnh=3VsmfWKsQyY45tcWTQhm3hujBRbg@mail.gmail.com>
 <e502a4b7-e927-2abf-9014-0b23d15d401b@amd.com>
 <CAP+8YyHdbrvA-sJ=VZccmLkyZ9WCO7CnOp5K0pMoXA=MrHLCsw@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAP+8YyHdbrvA-sJ=VZccmLkyZ9WCO7CnOp5K0pMoXA=MrHLCsw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM7PR04CA0020.eurprd04.prod.outlook.com
 (2603:10a6:20b:110::30) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0b5f2269-3a6d-4d58-14c7-08da43ad5ae0
X-MS-TrafficTypeDiagnostic: BN6PR12MB1620:EE_
X-Microsoft-Antispam-PRVS: <BN6PR12MB162010B370307786D4B30F2A83DF9@BN6PR12MB1620.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4/NPQrOD9JMPK9OM/BB8yK990R95s9YfBlPzIyVPutX3oSui9kp8zsV+LBwGggF+IxXjMDSQNCyT1cS5n+1CUt+OvIkbN067A41IyCf7ZTmwN9yWod3b6yuE626DWGud2gCBT5y9h9s3WWEWTyCeRi03ijLQLDMSvYhTKmA27ExgF+0NLGqZc9Tg++53xA4mGE/opWTptvno6c1LxQaTNqhWBcDlj5d5EXv4B3MMZIn1UN29XlbYHqkLZHifHiEdy+zBZMYIM6rwG0CdRsTqY6k9rjxHllN5KzdBke8hny7lYQKkXSI1lLYhGROhWf5m0FgMJWhVyuDdZPsEQDTKI7GiP2ZPvLcJjHN3+dXuJ4Wiqfygq6EpitRM7ioskDuBu4wfdGF/gcep/Ob/fP76Ikyux4h3PyGboqoCMnFADLp2+xmk3PvGFuntDWNrfqYK+ggEs5nnvZoa8zryIXpeu+c4eWGnMZ/lN5T49pBCOUfQEJSQgrlsbfyeBjnM0wA7tBp9Ll3W+QfFPTWw3O7udYISyE/sYSWLJKW8AxXvh6H3NYHfeOiC9t1Hk6sW/UdF+BSCzfvG3isM6qWfF8IqjQkJt+L4nCkiw/AtJTMKpWAANa1gIMJu5l3G9URVIliuQFez5X3GNkmOCgloEfDCA1m4U4Vp/DC2WeN6neBFwVzhR0hz854Pgn5k6EzPHMqbinSoX973vdz22/SxwqYH4MjnXrk0BB5IVW6L2+m0h78ZMAW3oepI9PGXSpcHvrS/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(4326008)(8676002)(66556008)(316002)(66946007)(66476007)(508600001)(6666004)(6486002)(83380400001)(31686004)(31696002)(36756003)(86362001)(186003)(66574015)(8936002)(26005)(6512007)(54906003)(6916009)(2616005)(6506007)(53546011)(2906002)(38100700002)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Zzhwa2JoVCtXMUtQa05CQjd4RGk1UnRsdnptanJCUFhmS0lha2xGNWQ2Q0hD?=
 =?utf-8?B?dkJUckV5VXduWDVHd2YrZU9TQlpMeDV0YS80cmUra2x4WU01blVSR2Z4bW1S?=
 =?utf-8?B?U2s5UjNOZktSdDl6Ym15R1hxMzJWVFp1cG1zd1YyS1VGblBsUUM2eEd3NjM1?=
 =?utf-8?B?blN1UHM3OGlWT2xUaFNVQm5JbDBoQm5SSWt3R0lUTm0wbWZQc21kSGZhVGJ2?=
 =?utf-8?B?RXFyQjFjT3JvYU85RjVRYTA0OFdMZ3NTcGxaTVVmSHdISTk0cXhBdVJBR0xi?=
 =?utf-8?B?Qjh4MXk1VGtBMVUzV2FNUVQzUmI5dFlVelVRclgvbE95cGo4RGRpQm9FdS80?=
 =?utf-8?B?QmtFY1M4TFhtQTRVVTQyYndia1dMNzdtM0JiNDNYMHBrODZGYlBYdk03VXhV?=
 =?utf-8?B?VVFhS1N4RFAzVzBmUDJ6bEpzVUhlY1RHY0VyVm5rREdIOE1WQUw0NmFoT0Ni?=
 =?utf-8?B?SURyKy84VUFURzdBU0FQWnJYUjhUbE5sT2w0T29oOGhYRUVoTG1QNm0yNHJh?=
 =?utf-8?B?SWkweWVsdkJNUHJhWUszUDBMMXRBT3daR0hFY2ozTTBTUzVma1g4R0QxVjh5?=
 =?utf-8?B?aDJnMG1GS1lqVWx5TGVmdDVvU1NJRVIvTVRSYlVodTJsTEhLT3YwSm9MS3U1?=
 =?utf-8?B?Zk5sNmlCTHYzaXJsZ1RzcUNOUVhlbUJ3WTc3TjdTNTIzamdmTFVLZk9BUG5J?=
 =?utf-8?B?NFlkTFA4M1ppQXNVRkdlTGhlRnFpb2dtZWtMSHZaMklOdmpQMW1zVVR0Lysz?=
 =?utf-8?B?UlBWdG9sQVlHZTBOQVJueTg3ZHhtSktQUDY3OGxMMnBYK21FcVBoS1lDa3B3?=
 =?utf-8?B?NFhIalU2eEREU3BMMFJtRUQvVTZIMERPMnd2WVpMVURsdW1sQ1JPd3FZTC9q?=
 =?utf-8?B?Yk13czFEL0FBQ0syOFlNWVphS0tQLzh0a2FQNDhsNG01R281OFJSWVJDakti?=
 =?utf-8?B?bkxQZHFTNnJBeC9RQndRUjZEUzBiZmVtbGtoZXlyOGtLZXU5bHpubHpRaWlH?=
 =?utf-8?B?Z21TQ3NGQW1oN2UxdkFzUnBEbGZLWVBaZ2s5dlBjY3Aza3k2bXJWYW56VlNi?=
 =?utf-8?B?eEJLaE5zcGtkK01LVm52VUdvaWJOVzd3R0EzNDB2Q2dxREp6bTdQREIrWlB6?=
 =?utf-8?B?dTZ6V2N6aVVEZlFFUEhQcko3QVRNMHRuUWZKdkNtUXJFMW94U2VPRlN3Vm5W?=
 =?utf-8?B?YTJndlMvbjBqTzRZbzhrSUFPMklHOXRlQ2hGdVBha0xTVmo3TFlMV2tjdE9O?=
 =?utf-8?B?MnY5M0xhZnZPRnB2d1p5OUxEQzM2UUtaSStSeko2d1UxcHBiS1QyWWx5d21Q?=
 =?utf-8?B?QlMzVlozaThvR1QxSkVRblRjU3k3TTZ1bTlDb05kS1VYWkUyZ1E2RVlWZ0hE?=
 =?utf-8?B?OEl0T2VMaE92Z3J5bGxGK3QzTkhlcmUyUXh0Q3F2VmdyQmR5T0d5djV0R3RZ?=
 =?utf-8?B?TEJkSk5tbko5eEJYcnQ0aVYyQmNybjhNN0RzNEdoMlR0RmFUYzJTMExoVUxH?=
 =?utf-8?B?Nm1lT0liUGREdVFhRVZvMlBJN1lka0pPcjNsdklicHZjTVQvT1FjKzQraFpl?=
 =?utf-8?B?azZmTWJSbURqRVlWbkNablBBbHM5VzZSU1BRQVBKQStsLy9QYk0yNlpkcTZt?=
 =?utf-8?B?dUIvUVAwdzFNWWh3NzV1ZlFOVUJlK1lRRUdVZ2hWZGdZQ0h2bjJUNnVtVU93?=
 =?utf-8?B?dDFrMy9wcy9LWThxM1R1QVFnUWw1bUxJZnFyT2ora2RETGFZL0l1N2xwYmVR?=
 =?utf-8?B?eVZpNEMzNmV6REJQNGxiNittTzdYM3pudkkvOEs0UlJTTGxHVUxKMDg2cnNI?=
 =?utf-8?B?bVVWMnFJM3Ftc3dJUGcxV2NtZ3JEdnpqR2FJVnlOWFlMdWdZMllsNFY4YnZ6?=
 =?utf-8?B?UW1veTFOaE53TVE2aGcrZ1JNblJocE9VU1Q2eXcwTURzTGM3YmQ2d0o4d2lk?=
 =?utf-8?B?ZlBNbEFmdm9OUU9IejdVZFVLZ1JqOW82V01TOU12WHljeFpwVTI4YUhIeTNv?=
 =?utf-8?B?UFdQY3d5ZENFSWdMMjNFUFBCdzBPaHpaKzZKV2ZjVStXbUh3SWxpZUtIeWVT?=
 =?utf-8?B?SWZZczdyeGx6THZWcjZ4MDY4eElQRTkzWklYYnp2bE9rbVFKSk1Zc2x5ekU2?=
 =?utf-8?B?UkRJUlNhaUI3QmJGcld3bmVuNXEyVnVucmNMbUx3RjNwUHNkbHFqeU5GQ3FC?=
 =?utf-8?B?dmw4S3ZEbC9kKzVWc2ZvUzNYaEl6YmVmazNCWlFpZzlQaFJGNTFXSFdiekhh?=
 =?utf-8?B?NzFQL3o3NFVCaCtrVWNXd2R2MFR0eWh0THlndDltQXVyM29lMnE4cEhrMEty?=
 =?utf-8?B?WHVDTnJxNXlSaW54emtzZFdsb2d5cEw3NEhNUUZtbHpCeEVMdENzUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b5f2269-3a6d-4d58-14c7-08da43ad5ae0
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2022 09:01:46.0790 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: czQG5yxy5Bn4hKvzRodO0vyNu/ZMyzzGGyKxeouyicfBkJKIc9gCu7QKZ9X2RhLv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1620
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
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 01.06.22 um 10:48 schrieb Bas Nieuwenhuizen:
> On Wed, Jun 1, 2022 at 10:40 AM Christian König
> <christian.koenig@amd.com> wrote:
>> Am 01.06.22 um 10:16 schrieb Bas Nieuwenhuizen:
>>> On Wed, Jun 1, 2022 at 10:03 AM Christian König
>>> <christian.koenig@amd.com> wrote:
>>>> Am 01.06.22 um 02:40 schrieb Bas Nieuwenhuizen:
>>>>> This should be okay because moves themselves use KERNEL usage and
>>>>> hence still sync with BOOKKEEP usage. Then any later submits still
>>>>> wait on any pending VM operations.
>>>>>
>>>>> (i.e. we only made VM ops not wait on BOOKKEEP submits, not the other
>>>>>     way around)
>>>> Well NAK again. This allows access to freed up memory and is a complete
>>>> no-go.
>>> How does this allow access to freed memory? Worst I can see is that
>>> the unmap happens earlier if the app/drivers gets the waits wrong,
>>> which wouldn't give access after the underlying BO is freed?
>> To free up memory we need to update the PTEs and then flush those out by
>> invalidating the TLB.
>>
>> On gfx6, gfx7 and gfx8 and some broken gfx10 hw invalidating the TLB can
>> only be done while the VMID is idle.
>>
>> Only gfx9 can reliable invalidate the TLB while it is in use and even
>> there it comes with quite some performance penalty (at TLB invalidation
>> can take multiple seconds).
>>
>> Because of this what we do in the kernel driver is to sync to everything
>> when we unmap entries:
>>
>>           if (!(flags & AMDGPU_PTE_VALID))
>>                   sync_mode = AMDGPU_SYNC_EQ_OWNER;
>>           else
>>                   sync_mode = AMDGPU_SYNC_EXPLICIT;
>>
>> This acts as a barrier for freeing the memory. In other words we
>> intentionally add a bubble which syncs everything.
>>
>> I'm working for month on a concept how to do all this without causing
>> the stalls you observer, but so far didn't came to much of a conclusion.
> That might cause an unmap operation too early, but for freeing up the
> actual backing memory we still wait for all fences on the BO to finish
> first, no? In that case, since BOOKKEEP fences are still added for
> explicit sync, that should not be a problem, no?
>
> (If not, that sounds like the obvious fix for making this work?)

The problem is we need to wait on fences *not* added to the buffer object.

E.g. what we currently do here while freeing memory is:
1. Update the PTEs and make that update wait for everything!
2. Add the fence of that update to the freed up BO so that this BO isn't 
freed before the next CS.

We might be able to fix this by adding the fences to the BO before 
freeing it manually, but I'm not 100% sure we can actually allocate 
memory for the fences in that moment.

Regards,
Christian.


>> Regards,
>> Christian.
>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>> Signed-off-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
>>>>> ---
>>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c  | 2 +-
>>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c | 2 +-
>>>>>     2 files changed, 2 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c
>>>>> index f10332e1c6c0..31bc73fd1fae 100644
>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c
>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c
>>>>> @@ -51,7 +51,7 @@ static int amdgpu_vm_cpu_prepare(struct amdgpu_vm_update_params *p,
>>>>>         if (!resv)
>>>>>                 return 0;
>>>>>
>>>>> -     return amdgpu_bo_sync_wait_resv(p->adev, resv, sync_mode, sync_mode, p->vm, true);
>>>>> +     return amdgpu_bo_sync_wait_resv(p->adev, resv, sync_mode, AMDGPU_SYNC_EXPLICIT, p->vm, true);
>>>>>     }
>>>>>
>>>>>     /**
>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
>>>>> index 63b484dc76c5..c8d5898bea11 100644
>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
>>>>> @@ -75,7 +75,7 @@ static int amdgpu_vm_sdma_prepare(struct amdgpu_vm_update_params *p,
>>>>>         if (!resv)
>>>>>                 return 0;
>>>>>
>>>>> -     return amdgpu_sync_resv(p->adev, &p->job->sync, resv, sync_mode, sync_mode, p->vm);
>>>>> +     return amdgpu_sync_resv(p->adev, &p->job->sync, resv, sync_mode, AMDGPU_SYNC_EXPLICIT, p->vm);
>>>>>     }
>>>>>
>>>>>     /**

