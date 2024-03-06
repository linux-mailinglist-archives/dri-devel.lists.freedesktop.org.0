Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 369EA8736CA
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 13:42:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CA0B11313F;
	Wed,  6 Mar 2024 12:42:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="2G+hm+jj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2062.outbound.protection.outlook.com [40.107.94.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 275A011313F;
 Wed,  6 Mar 2024 12:42:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CKCdMPaHQsR00wj8L5vR68IhKxm4LpHqrn+yBu6RQeA8UuXGXPOA/yqKTwb7lKOCSKHnJlR6x9ymbjfp+O12Y2Hys7LKKK8oEA7kmmvuVDSj5TFw34jV9ZrvYRilBfmKIyf2u/LFLKFt6eK+eLhHxIoeDvUjSALvPI8JImiSQFNLj3wphoo9y82YDNiFx0Cz3JbmrI7tjXhsinupMeMYRiz9vBh6xZ6zeCI+5BPaj4ccGi4L9X4e4skQg/Gwcs/rq58br8HkqJaLwXatLpWuyrrli8uU2BK/axjS8LwLrYBfOjN0F1xtghrpUoo0ghP8SC770+AA6WTjZPfC5s+1lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F8u215UfrGbBiJ45pbvBZ0WTkv5oVETt5ZO0AGOuC9k=;
 b=PSRy/ShlKCJWMJhTchk026s18mUSk5iHHy8aQaW47THHjYk103WuORbY4Ie8TG7lmW9fgeIY1o5GOHy5T2wec1qbmmA3UCKhr0w1u//DOa3ppo0fHh25KMBY4YKxh+/SzlOPYcSx2LfHewZAAkZebyvfoq36HkYbfZzmIb+D4I15cnPfsuy0qtgBnRqzFxx5uFYZd29HM1JtSt3z/dRNg697I5y9OnQsY8OGV3Fs/qI8cRZyxBtt/m6TSoZVvk8al0dYxCIOxmesiCpsuYlfJIYIdkB0FjrUfd5UYf2pIeHeT9ijn2JUB6XwauFY4xXSImNJugejHWRpBu5S/sPbMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F8u215UfrGbBiJ45pbvBZ0WTkv5oVETt5ZO0AGOuC9k=;
 b=2G+hm+jjns9c6VgE/urC7CLriem1A79vfko6NzV6GPjIetNvw7eW4+IgVpRn+ZWFTry8Fch/QdxhZd5jfLPxyBm/k6sX/jmNUAobxb9Ge/nvYPpYm6uUS1r/wLdJWiS/ONhUam65I+tfFJLwomb8t6eicBslBMAyoTA9DwgR6U4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY5PR12MB6153.namprd12.prod.outlook.com (2603:10b6:930:27::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.24; Wed, 6 Mar
 2024 12:42:31 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a%6]) with mapi id 15.20.7339.031; Wed, 6 Mar 2024
 12:42:25 +0000
Message-ID: <66815303-bd9c-4dfc-ae1a-bbdc5d1bb47c@amd.com>
Date: Wed, 6 Mar 2024 13:42:19 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: cache in more vm fault information
Content-Language: en-US
To: "Khatri, Sunil" <sukhatri@amd.com>, Sunil Khatri <sunil.khatri@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>
Cc: amd-gfx@lists.freedesktop.org, Pan@rtg-sunil-navi33.amd.com,
 Xinhui <Xinhui.Pan@amd.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Mukul Joshi <mukul.joshi@amd.com>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
References: <20240306090408.3453152-1-sunil.khatri@amd.com>
 <2f792620-fd8a-412e-9130-e276ba36d5a0@amd.com>
 <5e2899cd-75b4-4ddd-97ff-4e10a2e67fbb@amd.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <5e2899cd-75b4-4ddd-97ff-4e10a2e67fbb@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0134.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::18) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY5PR12MB6153:EE_
X-MS-Office365-Filtering-Correlation-Id: f4a4bbed-5395-4988-485c-08dc3ddae064
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sjcFQetWfXc72OQv4XI5nzx8JQldchNNub+8HFxWVv6FoGDhoy5Qfsffjh99IfIQJRc4Y59/8KJOMFRS83zG6/78mCYNMpZEy9uyzBaY/EuiDIBfPs2VCq1Ca6OVgH+1ptuOF6ee4Lzt1UCqyE70OsV0IYwtys5wJVfBv6zxa0jo/MWhUCz6fZunaNIh7iHrOSEv5M7ZzUb1KSXkG0Mke99fe5G4ghjhU4fqsZFM4P3dM+hYoVEBuANpHNy3ldKRXP6jogfKDAio/FT4iqOlW6FbMX7PZZjRfitJbWHEGKXvWhKhI0qWZXwItGuPhZa7fm7Imx6NS5QJ4fvMcyPS9JNtRzbqo6imf09vkdZ6e5OCpLs1kaslEIou460NNa4J5K4lMVjCr/DlYkF680/v7N+1GxjyyUYcli9WuJMW5gYH+ew9zSaRJEbNJDEWEdKMKB0hW9fC+bvkxCUU56X+FUBDofvJTJfUR4+0d3KAi+4hieSswfhvRSrENNaa4ak2DPd+3VcVzspba4Vd8uRrtIzhr3ZpALbXrL/zGEMaOxI+8JlLPDYKt4TtOVyrKAspRr++sShrvINq9DtlJ9ceP9HDNZpUHktlopt9eEYJgzznVl605qFVVnjViuXpVK2/i8gJ4kIim48kLXePrh6k40vPfaJBhoZCmTNHDFJFfmE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?elRTUVUrRW5HRGg0SXdvVUV6WmduTXJCTG8xMi9hZ3NUdUVpejBGN2Q0K1FO?=
 =?utf-8?B?bDNTRGlJbGUvaDljS2JNYmYwZm9JRGtTekZmRFZHOGJVU0RqYVB2T2llL04v?=
 =?utf-8?B?M05Jcy9NSE1XZi9ybEtDZjMxd2xDWWsrZnhSUFluSFpPVkc2alJZUGI2U3dp?=
 =?utf-8?B?OFNRdVFWMFZsZm5zVGVLQ2FiNlhFY21YLy9uQ0NWYWFtUnFudmpWOXVmWlUv?=
 =?utf-8?B?NzlVU3JvdlpXVFZadWg2UDFjK25TZW5YMWF1Y3NGVGRoWDhkWkRkM0NBb01V?=
 =?utf-8?B?eWg4WU0xNnl0My9ieFEyaHhmMXBSQnRSc0djT3lRZDR2VjBvcDRoMDB1S2xY?=
 =?utf-8?B?eHdRVmpORGdYOFJrdVA1UUlNWkU2V1pocEtBclptN00xbEUxQTc0SFErK2J6?=
 =?utf-8?B?SkhZaFQ5bDg2c0FYbC83VTV6VkdCeUtsZXZYL0lwZ3pnZ04ydXNZd3FZZXNk?=
 =?utf-8?B?Y1E0UlZ4Zm8vekx1UmdNeEljU1kzSlhrZXVlV25ZdWxnOEx5WmgrdEpjV2o1?=
 =?utf-8?B?ejRHT21YKy9yOWRWTWpjbG92REI2ZTkyRGJ0aDFZRnZsR0RuZG1rOHg2SWhQ?=
 =?utf-8?B?djlIaTliNlRuQlgrU1VZMkl0eGluZ1A3MGhnb2xXckF5Tk5nekdIcjFKUW0y?=
 =?utf-8?B?Tng0WmJ2YllXVDExR0FrYzVtWDIyTWpRYlhFMUFJeDVqYWtQWitzeUkvOFBj?=
 =?utf-8?B?bkhndkQ4bngvWUFkRnppSVJVSzRaa3JlV3prYUhKcEoreGdaSlNhV2EybVBm?=
 =?utf-8?B?U1ZPQmplUGVrNC9LM3hBT2k0SGtOWEN5alFicHFTQlcycjkzaWFSTzdxc1RN?=
 =?utf-8?B?T1pzQ3R6Zzd5ejZ0VHhOUVJuUkY3ZGxWTS8vdE5JSUpoaC9vTXlUcDRWaHJi?=
 =?utf-8?B?Q3JvYWZ4ZGRTeStNZVQ4bkFLeHNJdVp2cnBiQ2dRR0pEZGRXckl3M05reXZi?=
 =?utf-8?B?VWhGQ245UmtPVjZCSEg3QkQzU2YwK0V5di9LMklXRnN1eUhqZE9hV0drQnVO?=
 =?utf-8?B?U3VmWUhEM2QxOFEyM1BSQi9qVDNVR0hKbmFtQ09KWW16d2IwMGJTeUVldnJF?=
 =?utf-8?B?bmdYSTVGdHpBQ0VlYS9lS2hFbU4zeURCcmZMMGVGcENBT2d6ZVlybXFMZDVv?=
 =?utf-8?B?Ui8wcjZHOWNkZmdjZnFoMkVkZlVSRE5BMXZhVFpFNUx3aUJqd2hkZkI4ZFFv?=
 =?utf-8?B?MFZjVEJsZW12akxZRFBBU1JINmVVL090SUNpQ3MyYWNCNUZGMkFleE5OOTht?=
 =?utf-8?B?b0tyU29GZ1RQNDBPblFFYVdrZWVxQTA5V1Z2ZEZsSUdkSHRxVHFHazV1NEgz?=
 =?utf-8?B?ZnBaeFJROGJmTlRqTFBHRzhXb1paOVorS29Ca3Z2UEN0TVlua1VZbGsrTlRX?=
 =?utf-8?B?d2hKMVdyMGFGT25uNDhmcE1CVHNkajdoNnZZRzdDL1NqN05RZ0VYbkI5ZkNS?=
 =?utf-8?B?NFUwaXJ1aGswVUxPRk9YMlZGclhiUTZkdDdINkFLMjJ2SmpHdmtJcVVyVitt?=
 =?utf-8?B?dlZDOXVsSHl6TENQOER0MGhNV1BhdzZoSFdmYXBENjFmaWlkUThrQmlVMWVn?=
 =?utf-8?B?c0pFMUpaN05xTlFkc1ZSU20zWTcvUFpnRXdEbWk2SnBvclQxb0EwUlVXZ1Bj?=
 =?utf-8?B?MEdjeXVYaWxCU0QwR0hpSXJoNGo2dzlkVGVibUJIZFVtZGRiUzFoSWNvZlJY?=
 =?utf-8?B?ZFdNVDdSQXdCZW5DenNvVGl3b01NUnM4Ky9CSFlYSkpMQnIrYmRpZW5INUtT?=
 =?utf-8?B?ZS9NWmRNc3YxMHEwSTFVSkdsVm1NMDZCRStDZG4xVThtbm54N2pzbHIzTHd2?=
 =?utf-8?B?YlozVXcvbTVoZVpYWU12S1YycjF0V3VsZ2ZOZ1RFN3lDYkJhVTdlYnpQSjV0?=
 =?utf-8?B?ZFZwTmpwU0NIaWRwbGJYYjVoYjVJYU51RTJ2WnJIakVpWUU0NFJnWlF2cnFu?=
 =?utf-8?B?ODFTT05wVlJVdzk2dU4rVVdlT0MzQ0loZlEvRTdHUnd5c29OeVc5a2VvSFRU?=
 =?utf-8?B?QmRzeTZaYzFVRmRWaGt6UVdrbXAxUzZ2dGNkNjA5aEtBUEQwWGFRUmZkak52?=
 =?utf-8?B?aTdTdUpQeGNaR3JGTXRka3hQNWNYSy9wbnRCRnFjYnJwZ1JGQ0RacHVOclBm?=
 =?utf-8?Q?oY/LTwX8f4c130U3XMa4Tmtsq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4a4bbed-5395-4988-485c-08dc3ddae064
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2024 12:42:25.8402 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cVKvJHYr+0xZGHXl4Gd8FXhlioXl8oI0qL2jvRZpdabphzIf30x3A/eLVr5ytHzq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6153
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 06.03.24 um 11:40 schrieb Khatri, Sunil:
>
> On 3/6/2024 3:37 PM, Christian König wrote:
>> Am 06.03.24 um 10:04 schrieb Sunil Khatri:
>>> When an  page fault interrupt is raised there
>>> is a lot more information that is useful for
>>> developers to analyse the pagefault.
>>
>> Well actually those information are not that interesting because they 
>> are hw generation specific.
>>
>> You should probably rather use the decoded strings here, e.g. hub, 
>> client, xcc_id, node_id etc...
>>
>> See gmc_v9_0_process_interrupt() an example.
>> I saw this v9 does provide more information than what v10 and v11 
>> provide like node_id and fault from which die but thats again very 
>> specific to IP_VERSION(9, 4, 3)) i dont know why thats information is 
>> not there in v10 and v11.
>
> I agree to your point but, as of now during a pagefault we are dumping 
> this information which is useful like which client
> has generated an interrupt and for which src and other information 
> like address. So i think to provide the similar information in the 
> devcoredump.
>
> Currently we do not have all this information from either job or vm 
> being derived from the job during a reset. We surely could add more 
> relevant information later on as per request but this information is 
> useful as
> eventually its developers only who would use the dump file provided by 
> customer to debug.
>
> Below is the information that i dump in devcore and i feel that is 
> good information but new information could be added which could be 
> picked later.
>
>> Page fault information
>> [gfxhub] page fault (src_id:0 ring:24 vmid:3 pasid:32773)
>> in page starting at address 0x0000000000000000 from client 0x1b (UTCL2)

This is a perfect example what I mean. You record in the patch is the 
client_id, but this is is basically meaningless unless you have access 
to the AMD internal hw documentation.

What you really need is the client in decoded form, in this case UTCL2. 
You can keep the client_id additionally, but the decoded client string 
is mandatory to have I think.

Regards,
Christian.

>
> Regards
> Sunil Khatri
>
>>
>> Regards,
>> Christian.
>>
>>>
>>> Add all such information in the last cached
>>> pagefault from an interrupt handler.
>>>
>>> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
>>> ---
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 9 +++++++--
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h | 7 ++++++-
>>>   drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c | 2 +-
>>>   drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c | 2 +-
>>>   drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c  | 2 +-
>>>   drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c  | 2 +-
>>>   drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c  | 2 +-
>>>   7 files changed, 18 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>> index 4299ce386322..b77e8e28769d 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>> @@ -2905,7 +2905,7 @@ void amdgpu_debugfs_vm_bo_info(struct 
>>> amdgpu_vm *vm, struct seq_file *m)
>>>    * Cache the fault info for later use by userspace in debugging.
>>>    */
>>>   void amdgpu_vm_update_fault_cache(struct amdgpu_device *adev,
>>> -                  unsigned int pasid,
>>> +                  struct amdgpu_iv_entry *entry,
>>>                     uint64_t addr,
>>>                     uint32_t status,
>>>                     unsigned int vmhub)
>>> @@ -2915,7 +2915,7 @@ void amdgpu_vm_update_fault_cache(struct 
>>> amdgpu_device *adev,
>>>         xa_lock_irqsave(&adev->vm_manager.pasids, flags);
>>>   -    vm = xa_load(&adev->vm_manager.pasids, pasid);
>>> +    vm = xa_load(&adev->vm_manager.pasids, entry->pasid);
>>>       /* Don't update the fault cache if status is 0.  In the multiple
>>>        * fault case, subsequent faults will return a 0 status which is
>>>        * useless for userspace and replaces the useful fault status, so
>>> @@ -2924,6 +2924,11 @@ void amdgpu_vm_update_fault_cache(struct 
>>> amdgpu_device *adev,
>>>       if (vm && status) {
>>>           vm->fault_info.addr = addr;
>>>           vm->fault_info.status = status;
>>> +        vm->fault_info.client_id = entry->client_id;
>>> +        vm->fault_info.src_id = entry->src_id;
>>> +        vm->fault_info.vmid = entry->vmid;
>>> +        vm->fault_info.pasid = entry->pasid;
>>> +        vm->fault_info.ring_id = entry->ring_id;
>>>           if (AMDGPU_IS_GFXHUB(vmhub)) {
>>>               vm->fault_info.vmhub = AMDGPU_VMHUB_TYPE_GFX;
>>>               vm->fault_info.vmhub |=
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>>> index 047ec1930d12..c7782a89bdb5 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>>> @@ -286,6 +286,11 @@ struct amdgpu_vm_fault_info {
>>>       uint32_t    status;
>>>       /* which vmhub? gfxhub, mmhub, etc. */
>>>       unsigned int    vmhub;
>>> +    unsigned int    client_id;
>>> +    unsigned int    src_id;
>>> +    unsigned int    ring_id;
>>> +    unsigned int    pasid;
>>> +    unsigned int    vmid;
>>>   };
>>>     struct amdgpu_vm {
>>> @@ -605,7 +610,7 @@ static inline void 
>>> amdgpu_vm_eviction_unlock(struct amdgpu_vm *vm)
>>>   }
>>>     void amdgpu_vm_update_fault_cache(struct amdgpu_device *adev,
>>> -                  unsigned int pasid,
>>> +                  struct amdgpu_iv_entry *entry,
>>>                     uint64_t addr,
>>>                     uint32_t status,
>>>                     unsigned int vmhub);
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c 
>>> b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
>>> index d933e19e0cf5..6b177ce8db0e 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
>>> @@ -150,7 +150,7 @@ static int gmc_v10_0_process_interrupt(struct 
>>> amdgpu_device *adev,
>>>           status = RREG32(hub->vm_l2_pro_fault_status);
>>>           WREG32_P(hub->vm_l2_pro_fault_cntl, 1, ~1);
>>>   -        amdgpu_vm_update_fault_cache(adev, entry->pasid, addr, 
>>> status,
>>> +        amdgpu_vm_update_fault_cache(adev, entry, addr, status,
>>>                            entry->vmid_src ? AMDGPU_MMHUB0(0) : 
>>> AMDGPU_GFXHUB(0));
>>>       }
>>>   diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c 
>>> b/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
>>> index 527dc917e049..bcf254856a3e 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
>>> @@ -121,7 +121,7 @@ static int gmc_v11_0_process_interrupt(struct 
>>> amdgpu_device *adev,
>>>           status = RREG32(hub->vm_l2_pro_fault_status);
>>>           WREG32_P(hub->vm_l2_pro_fault_cntl, 1, ~1);
>>>   -        amdgpu_vm_update_fault_cache(adev, entry->pasid, addr, 
>>> status,
>>> +        amdgpu_vm_update_fault_cache(adev, entry, addr, status,
>>>                            entry->vmid_src ? AMDGPU_MMHUB0(0) : 
>>> AMDGPU_GFXHUB(0));
>>>       }
>>>   diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c 
>>> b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
>>> index 3da7b6a2b00d..e9517ebbe1fd 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
>>> @@ -1270,7 +1270,7 @@ static int gmc_v7_0_process_interrupt(struct 
>>> amdgpu_device *adev,
>>>       if (!addr && !status)
>>>           return 0;
>>>   -    amdgpu_vm_update_fault_cache(adev, entry->pasid,
>>> +    amdgpu_vm_update_fault_cache(adev, entry,
>>>                        ((u64)addr) << AMDGPU_GPU_PAGE_SHIFT, status, 
>>> AMDGPU_GFXHUB(0));
>>>         if (amdgpu_vm_fault_stop == AMDGPU_VM_FAULT_STOP_FIRST)
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c 
>>> b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
>>> index d20e5f20ee31..a271bf832312 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
>>> @@ -1438,7 +1438,7 @@ static int gmc_v8_0_process_interrupt(struct 
>>> amdgpu_device *adev,
>>>       if (!addr && !status)
>>>           return 0;
>>>   -    amdgpu_vm_update_fault_cache(adev, entry->pasid,
>>> +    amdgpu_vm_update_fault_cache(adev, entry,
>>>                        ((u64)addr) << AMDGPU_GPU_PAGE_SHIFT, status, 
>>> AMDGPU_GFXHUB(0));
>>>         if (amdgpu_vm_fault_stop == AMDGPU_VM_FAULT_STOP_FIRST)
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c 
>>> b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
>>> index 47b63a4ce68b..dc9fb1fb9540 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
>>> @@ -666,7 +666,7 @@ static int gmc_v9_0_process_interrupt(struct 
>>> amdgpu_device *adev,
>>>       rw = REG_GET_FIELD(status, VM_L2_PROTECTION_FAULT_STATUS, RW);
>>>       WREG32_P(hub->vm_l2_pro_fault_cntl, 1, ~1);
>>>   -    amdgpu_vm_update_fault_cache(adev, entry->pasid, addr, 
>>> status, vmhub);
>>> +    amdgpu_vm_update_fault_cache(adev, entry, addr, status, vmhub);
>>>         dev_err(adev->dev,
>>>           "VM_L2_PROTECTION_FAULT_STATUS:0x%08X\n",
>>

