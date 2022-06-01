Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F087539FB3
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 10:40:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 812C110E68F;
	Wed,  1 Jun 2022 08:40:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2067.outbound.protection.outlook.com [40.107.220.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E123C10E139
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 08:40:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XWLKQxAEHcCKe1Sg2dga78sHfBQIuc3zAgYPlZyrdMn2s19Z+hAqQp8fHBZZ6iZXk5BhzLxeTktI6pHQF4e6GRpfbNy+tZ2+gCKbHeBpLI4TTOxRSWzdqXOUsCqZGT6gihxc0EvxsNrjKwP8PnhgIOZ6dEm+v2iX0IiTKPkjQqCLc5ug5tBBxkpLQx5lvNUiZKfcfBj4mi076eALyvDUUrbKm9+X+vmNMfXURVEWvTuxVd/srBBblFePxWl14twCSSsmPGnYOWisnIdmVN38jAkbX6Ij87Hv90uPFJnzIuh9CzQ5q1kMeW67YBUX9NINWcgfRCgvwYjT94q+rvmB8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QsrCld3Y4awp3GkNySw/3IdQsI0AYU/sZCmrO67xoD4=;
 b=NBmO7YRCUFqci46A9/w70c0F8Dc8xh/wJvsz7szuaCH8KkX/s+8fxTwnQyXNanre9A0zbndRse1f1auEriwHzHIRvdJkGNvx/yHdKSd4kslsXjw1UX1ffnDHlPh9MDaFXoNLIom4hTQC4HDZt4hEoTSR1L4ZaJE2esV6v97yLMF65dEz4kMoEnYtD1+n0s/cjxr0ObbYFOdgtCYGjBAn99JdA8EFI8pZ55OI/azKlLHD2NDOiCzuRF7s96GS+Z1rNhV6UWLZcCl34M0Ag7Fctu2663At43Na8L+YLAjq+9+IUrPm2IAdVFiuRP+kCSNuniqrCZYNZrMWTOjlegTtKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QsrCld3Y4awp3GkNySw/3IdQsI0AYU/sZCmrO67xoD4=;
 b=4rGxZOHQ4tSJKYgwPuoxb8j8KLejf4zv1pVFnvSrVOx4/z8uZlaKVd6cdBcl2lImhLvIEQWMYgRhiW2iHmR65jhi794yo4r+sYTPreRCrEgCU6OrsCf2pwN+IBfuufXHPCUdmVeuB+FrAGpGipauhXrwIqjnaWrfYqlsxB4balE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BN8PR12MB3508.namprd12.prod.outlook.com (2603:10b6:408:6b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Wed, 1 Jun
 2022 08:40:48 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7146:65ee:8fd3:dd03]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7146:65ee:8fd3:dd03%4]) with mapi id 15.20.5314.013; Wed, 1 Jun 2022
 08:40:48 +0000
Message-ID: <e502a4b7-e927-2abf-9014-0b23d15d401b@amd.com>
Date: Wed, 1 Jun 2022 10:40:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RFC PATCH 3/5] drm/amdgpu: Allow explicit sync for VM ops.
Content-Language: en-US
To: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
References: <20220601004014.158247-1-bas@basnieuwenhuizen.nl>
 <20220601004014.158247-4-bas@basnieuwenhuizen.nl>
 <e4d8ea99-ceb5-b0dc-362f-94e37b9ddc6b@amd.com>
 <CAP+8YyEy8R3nbJVFkqHnh=3VsmfWKsQyY45tcWTQhm3hujBRbg@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAP+8YyEy8R3nbJVFkqHnh=3VsmfWKsQyY45tcWTQhm3hujBRbg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9P194CA0030.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:20b:46d::26) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 38991533-0757-49ea-f198-08da43aa6d03
X-MS-TrafficTypeDiagnostic: BN8PR12MB3508:EE_
X-Microsoft-Antispam-PRVS: <BN8PR12MB3508C90BE7E1500B94D7EA3783DF9@BN8PR12MB3508.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1F+PBe3bdFSysAuMEiIPK4y50NfLSEirm55I5eaxEHdAUynnaV9qWIolIGN9bAPGJJn8Tlv7dea7N9FQ/ioIcGsu7/NdCeaX116J4PQ3QHUSJr/WlwEEoqACtGDJLNs1Ihqb5HuBfV8rNqfowcsbzGD0+ej2+RKHIIJOyAv+kpJ5aPx4h/UwJMQpJPecN6qBMjrs8WrO3uaKd4z8J+Uo0tmZ5AzXx8O5ncn3/UCGNuBOqfuQDxMXWVBTDhv/girnEiHMUcQfwJCIuxAttu8wxkUuJdBS7Z9T+EQS5bq99AJ/IK4wmxQXz7qjG2IVyWIUKMz9gzxq4J/ou16RhfgNFH5eYUmOeHaNWfegZPjELJfd77p2NGbx/DWiczliLF5SrZq+lQE7VMjfaqrkQeNnlAkUdN/7fYqBg+owAsKcxiYXU/PbkpsTOXg6AG4ea52o2mD4eAd90YW1JSvtnjGXZ87FEOJBQE0zCc6sLUS9J1UYxVs/HULz73OQo8B+FHH/OvBlPN4VQSy7Qc7h5GRcV9qK+iVxsq3n/wWkm/DUUk0AIz/cThkmXLuh9b3BhrtTXYmJfsCdqkGPcvQt7bLOILq92UWnFnmxVoudVlNt85KrE3C5VX0eRLTl6alNvch5zK7ZrAJMbOGIB6TqRRFNJtlriiXg63GrAUnmDTc7+SsfuWL1RAuXU4tSm6iAmDLJx004ZKBgb/RSydvJedyucKeEE0MpYi+0Jv2b4DvSFxofTfwoaUrGzYLJgLrrtFp7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(508600001)(2616005)(31696002)(66556008)(5660300002)(31686004)(186003)(86362001)(66574015)(83380400001)(36756003)(6512007)(66476007)(316002)(54906003)(6916009)(8676002)(6506007)(66946007)(38100700002)(53546011)(8936002)(2906002)(26005)(4326008)(6486002)(6666004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U2MxT3FoaWFqcCtGVzU2K1NDOGdBaFB6alBPa0RTcERmb3ZRMGhSM3pheHhv?=
 =?utf-8?B?MGNyMURnaVdocW5VUUp1Ty9Zbm9IZDZnckxPbS92TS9aVlBBTFNnS3RHMUM1?=
 =?utf-8?B?UDZGZS9MalZGSHhBLzZRMHh2NFdxYnMyTi9KL0E0Nlk1ampHUnhDZ0lWVEhX?=
 =?utf-8?B?ak9yZm4rbGhCOExtZWV0TWJLVG53b3dqODV3cjZzS3lma0pZY3FtYUR5ZDBB?=
 =?utf-8?B?bTJNMjV3U1lESk1qZEZPcUI3VW9LNmI0UFQ3ekpqR0w5L3ZGUU5Qb0lkTXBo?=
 =?utf-8?B?cE1GekVPek1vOHpvcDhnOGRHZ1BuRWQ5d0grOStFYXc3TkdHdXNEWVBuYjBJ?=
 =?utf-8?B?SmFMd0NWQzNYQ0lDSUVPZUNQZnp5a2hQT1pZSjNScklJNmZkN3dUbHY3Y0ZP?=
 =?utf-8?B?Y21PSHVwdWtPWVdJN2dmVTBacm9vYVN2em91NUFPekU2SER1VDRJbVltaVlk?=
 =?utf-8?B?UnBNS1lnSTJYRWM2UlFKdjc0eUVhWER6dnRzZVAyMWk3bks2dmVXdTJnVXRF?=
 =?utf-8?B?QzhuY05RbXd4SU96UkJQbTB5bEFLalRNNnE3WnU1dWUzUDlKUEgyTHZDM0RO?=
 =?utf-8?B?aks1RG40UHR3MWhFUjJ1T1VDUlRDVTBkZit1S0Q2N2ZJdDF3N0FZM2ZCNTV2?=
 =?utf-8?B?TERRaHBKMndJZGk0TzFxa1hvUUkzeE1hK2tKS1RTZkg0c2ttdk1YeVluMXpm?=
 =?utf-8?B?d1hBdWk4eVNwOFJEcmlvZnA2dGxHSGlRbmFnWVVRTVFCNllKSmFqdXFpbHlj?=
 =?utf-8?B?ZGc0andXOTgrY1Y5NkNhRU5iZ0VCemwyY0ZqTFZWckI2NFlSQmU3VE44RkZu?=
 =?utf-8?B?S05NTWFIaFF0VklXOGVmQVU5amdtUGZGZ2d4WGpYMW0wbTlQU2NrMzlpOFpw?=
 =?utf-8?B?TVhldUpBNW8yS05MM1Bwa0FBUW5rWlNzU2w4dktuVVFleGtjWGpBd3VtL3ZC?=
 =?utf-8?B?UGQxamVqZzN5QUNmdDYwd2duZTNySXN6M01SalRPcFNtc3AwbHArOEg1RHp1?=
 =?utf-8?B?ZjdBa3MwVDlScDVvcjhMcTJzQ1U4aTZmaG4xSStkSzd4cHB6NlVzVnhEQWR4?=
 =?utf-8?B?aU9JWEU3SWg2QVEvRCtpK0hMU3VlVDZULzBzemJpd1J3K0FONHVqYlpMdGh4?=
 =?utf-8?B?aUxMQ2ZhRDRPTURoRjRKRGI1THVYYTJDd0tMT3doeC9Mb0NQWk10WWNQcDJy?=
 =?utf-8?B?MWdoK0Vsc25oTm0xQmdrTzRUa2h4Sk12TnBlWEFiQTF6Z1o2VU9MUXIyYnVy?=
 =?utf-8?B?L0djdmhiWHluOWRlZmRyMDZBeTZMc0FtbEVNWVdEdnp0VWhPZnd2bkgxd0tn?=
 =?utf-8?B?d25tR1k0ZWIrdXhjODkwZE1zTHEyaTNSbG5ERFd6M2hTUXJHOEd6Y21RL1ov?=
 =?utf-8?B?U2R1bStlKzlNOW5TS3pYUmFCYmc2WW1pWHlLUi9RT3VyWkp1QU9qNW41MCtk?=
 =?utf-8?B?bjkyRGFScFJCQmZ0bFJPL1ZndSs2WlAvMWlQaHZTZXA1YisrRDBUTmVVUUNG?=
 =?utf-8?B?dGJNbjZYN0dGZnY5b1BnSkhpUUh0blI2R0piRjZRdVFyMFdHUHpJcGpGVHRp?=
 =?utf-8?B?dzYrM1hJQm9Nb1RJUk0xK3lMN3FId1d0TzVvQXFxTG04NkhzRWFrNk9TdFVz?=
 =?utf-8?B?UVljS0FYYlBUUEE4Qi9WVnN5QmZFTDh2czNnTnF3Y0VTalRPQVZuT2VxZkZ4?=
 =?utf-8?B?VXZIQ2phVGk4Tzd4K3MrUXFrbngrVjRoRVFsSHVPYW5WdnFZbXVZWnVrSFRJ?=
 =?utf-8?B?MGl3L0xPazNlSTBDZ3d0QmsycXI1VENDK2NPVzZxN3lmblVVTjRlcFlibTVI?=
 =?utf-8?B?UnUwYVdYN1M0UXp5WUplTDZlZVljaERDeG1BaWNLTGxVVmt4U2ZwMXQxd0lZ?=
 =?utf-8?B?ZzE2TU5sbms2T2ZORVFzRENadGJTQ0lhd2JHbnJpSG5obitmUGxrdEYyVmhW?=
 =?utf-8?B?dlJJWUo1TU5yblBmWWc1Z1N5QUVhTEFVWlRUK3kwZGlzanRCcHQ4NnJvQlRV?=
 =?utf-8?B?dVpWa0FWRGsvY25uQ0pZeWd0bjB5TFRMNHpHSCszdmZ4Q3RDYWw3Mkd5WCtW?=
 =?utf-8?B?NDgvRkx2ZnI4SE5TUUpUQ1lydjVtcHRRb3NaNVpVN0lTRmpzOXY2OTU1ZWpn?=
 =?utf-8?B?ejNZKzNYbmZFY2ZzejMwUElNZW5XWHhyVGlEYm84ODlWdW93QXFsR2ZGYXlp?=
 =?utf-8?B?VU1wYU5KTGlEYzV6Y0U3RGl0MVU1Ri96NWwybDBxQ1l2c01Mcm0rMFFMcnBq?=
 =?utf-8?B?MHM5c0xYa0grazN1akpPbURXZHNOUHRXeHNLYVc0eGQ4dVgzQkptTENmNVFr?=
 =?utf-8?B?VDhoRDZqaEFrSVBwQlFLSmFablRrWlJOQXUrQjBha1dpRWF6UkFaUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38991533-0757-49ea-f198-08da43aa6d03
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2022 08:40:47.9760 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YgpWS4MdNC9O54klSc+3cG6SkyULXQrGjgMwOS/M0FHees5tEuQc8Z4t0iuJLnxP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3508
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

Am 01.06.22 um 10:16 schrieb Bas Nieuwenhuizen:
> On Wed, Jun 1, 2022 at 10:03 AM Christian König
> <christian.koenig@amd.com> wrote:
>> Am 01.06.22 um 02:40 schrieb Bas Nieuwenhuizen:
>>> This should be okay because moves themselves use KERNEL usage and
>>> hence still sync with BOOKKEEP usage. Then any later submits still
>>> wait on any pending VM operations.
>>>
>>> (i.e. we only made VM ops not wait on BOOKKEEP submits, not the other
>>>    way around)
>> Well NAK again. This allows access to freed up memory and is a complete
>> no-go.
> How does this allow access to freed memory? Worst I can see is that
> the unmap happens earlier if the app/drivers gets the waits wrong,
> which wouldn't give access after the underlying BO is freed?

To free up memory we need to update the PTEs and then flush those out by 
invalidating the TLB.

On gfx6, gfx7 and gfx8 and some broken gfx10 hw invalidating the TLB can 
only be done while the VMID is idle.

Only gfx9 can reliable invalidate the TLB while it is in use and even 
there it comes with quite some performance penalty (at TLB invalidation 
can take multiple seconds).

Because of this what we do in the kernel driver is to sync to everything 
when we unmap entries:

         if (!(flags & AMDGPU_PTE_VALID))
                 sync_mode = AMDGPU_SYNC_EQ_OWNER;
         else
                 sync_mode = AMDGPU_SYNC_EXPLICIT;

This acts as a barrier for freeing the memory. In other words we 
intentionally add a bubble which syncs everything.

I'm working for month on a concept how to do all this without causing 
the stalls you observer, but so far didn't came to much of a conclusion.

Regards,
Christian.

>
>> Regards,
>> Christian.
>>
>>> Signed-off-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
>>> ---
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c  | 2 +-
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c | 2 +-
>>>    2 files changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c
>>> index f10332e1c6c0..31bc73fd1fae 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c
>>> @@ -51,7 +51,7 @@ static int amdgpu_vm_cpu_prepare(struct amdgpu_vm_update_params *p,
>>>        if (!resv)
>>>                return 0;
>>>
>>> -     return amdgpu_bo_sync_wait_resv(p->adev, resv, sync_mode, sync_mode, p->vm, true);
>>> +     return amdgpu_bo_sync_wait_resv(p->adev, resv, sync_mode, AMDGPU_SYNC_EXPLICIT, p->vm, true);
>>>    }
>>>
>>>    /**
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
>>> index 63b484dc76c5..c8d5898bea11 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
>>> @@ -75,7 +75,7 @@ static int amdgpu_vm_sdma_prepare(struct amdgpu_vm_update_params *p,
>>>        if (!resv)
>>>                return 0;
>>>
>>> -     return amdgpu_sync_resv(p->adev, &p->job->sync, resv, sync_mode, sync_mode, p->vm);
>>> +     return amdgpu_sync_resv(p->adev, &p->job->sync, resv, sync_mode, AMDGPU_SYNC_EXPLICIT, p->vm);
>>>    }
>>>
>>>    /**

