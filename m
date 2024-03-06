Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5A4873477
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 11:40:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33BAD10EC7F;
	Wed,  6 Mar 2024 10:40:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="j9BFIrRl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2041.outbound.protection.outlook.com [40.107.223.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29EEE10EC7F;
 Wed,  6 Mar 2024 10:40:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NnHLHlXASLV3IdrVX+D16JT2nQHzEQnWlTJPs3/Py5ej/84Hg6NRfP4HMZbhKSI5sLbTSGwQvpzlZZAhFLNSYhZIdJLDYjXb5tirZ7AfooGwqKWNjRfHEPR8huCwUOEmiA10mpSNAxBkVw9ub9WvYMDJ5jQxK4rLZIxToEauEbWCZaYCR9dxF8VD+U+vzz9BVJm3fMrLY4/jmzm7d651M+JokPyAnflRMuyfoEzfpAB5FZlC8iBdduELaKRyZqOrADBL3NlUn3M7WFvUo8HwM44/0eDP70VrP9LBJfVM+iwnUAef8fNNHiPenigflMUJ6UwIEHBml+aqRSJn48DRFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JJAEt4RW8kbGxW4kDRKmEttcA5OsGwcy7D0RJj4zSac=;
 b=RJ2IAjRl6FSty6Q/ILt2PqlDkWPWz2xYzInu/kQ1Hig8BLQH27pX5MVB8u/2/N2cfX3Acb9MmgmDAXEAgxfjrDc4+oMvGC5d9eQnc7o9iI2iDcwTrzIzP4CLxtsmDHXZ7qzP+15Ry8CKKSutuyirisW3ADCQaMmlejE/SR97oxj+v6KhjP+BndtCQmDe6cSHn2eLv5/xE+VMvayw2NWv+WBrTwQhda7FzefM1xPL4FaCC1wjnrXgnbSkvQWzavg7aibyPafFtX+8QkoTw0mKG7kZ+sw+0FomnFBk/ScA3Pi5Z4A4O/vrhcLwAXkOPuEr1C0AltLZQKmPmDrmELkx6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JJAEt4RW8kbGxW4kDRKmEttcA5OsGwcy7D0RJj4zSac=;
 b=j9BFIrRlSySg+FhTLmX8ji4NKuEQu2aCyAkejK2u5eTUS56yjtEI7z8LAZD0bERQdiO5GpAhC752l8VW0iU6UlsJGSpm5OeDq6Pw87OJRaof1WPT/xwZCwCRIdVabK4lXPilCV+9/Pg0jlO/XQyJiz+143i5ACHLMcOuYsg/zGg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5596.namprd12.prod.outlook.com (2603:10b6:510:136::13)
 by SJ2PR12MB8183.namprd12.prod.outlook.com (2603:10b6:a03:4f4::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.24; Wed, 6 Mar
 2024 10:40:11 +0000
Received: from PH7PR12MB5596.namprd12.prod.outlook.com
 ([fe80::6f48:e3f1:6ff9:75bd]) by PH7PR12MB5596.namprd12.prod.outlook.com
 ([fe80::6f48:e3f1:6ff9:75bd%4]) with mapi id 15.20.7362.019; Wed, 6 Mar 2024
 10:40:11 +0000
Message-ID: <5e2899cd-75b4-4ddd-97ff-4e10a2e67fbb@amd.com>
Date: Wed, 6 Mar 2024 16:10:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: cache in more vm fault information
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Sunil Khatri <sunil.khatri@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Shashank Sharma <shashank.sharma@amd.com>
Cc: amd-gfx@lists.freedesktop.org, Pan@rtg-sunil-navi33.amd.com,
 Xinhui <Xinhui.Pan@amd.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Mukul Joshi <mukul.joshi@amd.com>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
References: <20240306090408.3453152-1-sunil.khatri@amd.com>
 <2f792620-fd8a-412e-9130-e276ba36d5a0@amd.com>
From: "Khatri, Sunil" <sukhatri@amd.com>
In-Reply-To: <2f792620-fd8a-412e-9130-e276ba36d5a0@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0162.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26::17) To PH7PR12MB5596.namprd12.prod.outlook.com
 (2603:10b6:510:136::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5596:EE_|SJ2PR12MB8183:EE_
X-MS-Office365-Filtering-Correlation-Id: afb969da-0f6c-41ef-37ad-08dc3dc9cc60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oBQrlc0WsZvNpWCvpfTzHR7j8VU4Jr2dS9r1bMIWFpiSSkLbTUY4CCjgqM3C0bw6T0FPwJuIQ1xWZdwCn/4SWHD8nquKJRVueVQBKtFL/WJW45UZ/xReVF0b/TKFilPAVEh079EGHPgcaikAxVyDVoPK1jWmPD5PD0Hi7WK3x4oFnfOYCIC8dHK42Lx+Kw0VU1ejQzYVuxnOMViLhdOnqRfxcBkxc6RNx/ftvyAvHEV37UHhk4jv6NjYfivyXcc47kBqaDr2LQ0EpHPUBI7vnoYPfTdwoYsiHMpUK2p27YxfJEnjYBXu3My542B95stX9+yPykFDyj7tdOJ1EckKAT9mWnLdp1xlSAyHtHyzaKp6R7/VAo1SMSVNgTC0lHSB+JcviFCPK9pzigFEzPYbKItIdya108Q+BHg+ejkOBN4e2i6Iens2KhfSDAv+fqWBx8dWKMIw4D/wOAp1PAVOce3MzDkMegyCgquLB2EiA1c/nHGaD/EPUlYftyN3ZqeqQZU9/kRpaC2KcljucDQl1VaYQODQ+j1qUH1SWLXhSmvyIryhN+C/pjVNhQ4RIugd96VeuBjRNqo1MEcN/zRxh+E2BfkWgqcQutEwpEPBxy3eUu2i7OL4bqWIeCUe/qaEzxrkC1yy7ZUv9JfJ+pP7d0u1LufPyA1u9QEAoWd2hCw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5596.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aURCTFhFMk9NQjVsdVZFcC9wdlB2SzNYbFBWaG1CaTNGQWpKajBiZnhnTkJy?=
 =?utf-8?B?bTNyWTZheHpWcDZ5aWhKaGIrS0dSeEJ5UHh3bEVDang3OVovbjU2MFBxWkVC?=
 =?utf-8?B?NXJaUllBYjJXQUdOMWJybGJKQWRLalh4U1hmOVFPYTVnN2NGRHFtM2I0V2lm?=
 =?utf-8?B?OWtNMC9FM3hGVHRnSUU4dUxkYWI3VUVUYTI3KzN1aFZDOFl4RWpNSHBpVk5j?=
 =?utf-8?B?YTlGbzIwRWtBMEJYc1k0Q1AzaXJSYWVORE8wOGV5S0VKTmp4aTJlczdtNGtD?=
 =?utf-8?B?cFh3RDFOZE9JaXI0RGdWTWU0dmJTMjlhWWh3dDNJZ2FBSmNzd1lHWWVocHZr?=
 =?utf-8?B?aVMyRGw0MElsS2pzVkQ0RTRZYlczeWdvT3E4Q2R1VWFPUjRIR1ZmUUROQlRw?=
 =?utf-8?B?MVg5RHFIRDNYNDhoNUN1QzlkZ3FTN2hDSnhVcUE2NnVKVkFoazRlT1cxeVBQ?=
 =?utf-8?B?WE5MUmpWRVlzY0dXd2xJMWFpYVVHNHB6dWhVWHdqRDdCRUIwTEdKTXpha2p6?=
 =?utf-8?B?dG1Qa2F3WGgzNkltbGNORUtpOVo0OCtrRHNkKzQ2YUpKM3JucHl5Uk1MY0Qv?=
 =?utf-8?B?TDd3ODFjWmIyMzFsR295L3o5NkkzWmhDSXVFSHJIY1V3OWtXK0hyZDZ6OEtU?=
 =?utf-8?B?ZXppZGd5VHM1dzdPczZrNkVHUzl6enR4UVJNZkRpazhIS3JBZXl3SEZtNzAr?=
 =?utf-8?B?eEFOZGw0cWNOU20xcWR3NDBYK1dVTEpmUjkwRUhRUlVRSjhPd0ZQWGJ0Tndj?=
 =?utf-8?B?dHQyNWJSRllQbWV6NlUxdVdnWU9yRWpEQ0s5R0x2OFc5dGhFL1cyaUcrRmFp?=
 =?utf-8?B?d09oUmQyakJZTTFvZi8vNi9qclZoc0ZXL0NpVTZJSHdWUGZJN1laWkwxWGFB?=
 =?utf-8?B?bmZaQXRnQm13NHpBdFQ4NFg5dUhjQnhXRkNUdWNHaStQY3lNc2xXcTR5bFdy?=
 =?utf-8?B?SzV5ZC9nL25YUmViUWZ6K29vb2E4VFJuYzE1V09EeEpyWDlDSk9FYkFOZE95?=
 =?utf-8?B?STl0aUJpbklpNEVTbWUrMi9DcWtPRHc0ajM4WEVJWG52c2FjNnZUcXRNTXlD?=
 =?utf-8?B?VzlRYjZXaGROY0NyalpvYjVuYTd6WTRuT1RqdzArVlhHRE9PdjEwZGFya1My?=
 =?utf-8?B?ZDEyQUJzSnhETW9kUitDc1l2M3B4VldUQ0xpdUlUKzVHWlJHMnpCczR5c1dl?=
 =?utf-8?B?NDJJOE1Tdmpva3pnTVZ1UzMvQ2VEWmp4dDBqSzFJSHlHblppYy9XMXB6UDlS?=
 =?utf-8?B?c2svS3dRcDZDWTFVSjB5a2NjbVIwMkNVUElvb0RsS1BZaXJOYVk0U0NrL01x?=
 =?utf-8?B?MFI0VG9zbVBMKzVGdU5MT3RFYldzQ3lrZ3lxQU1TbUtiMm16UmxLb0NLQXFD?=
 =?utf-8?B?MWJwRXUwWVV2Uk00dXNoYXVML0NkcFZLYW5VN0xwOE5WN3c1NXFTRFN5bWVn?=
 =?utf-8?B?TCtLam5VdmlkdzdEWVAwRVdRVFRMNjZMajQvZ3V5SmJ4dTgvRDBJbXhRK3Zo?=
 =?utf-8?B?OUw0QmtURERXbU1FVnF1SExQMysyZHNoRHFYd2kwU3RVR2libDFUQWQ5c2JC?=
 =?utf-8?B?c3hBUWlJbzg5M0xUZWkxYnBqbzFwVTkrS3pYbWRaUnVNQzd2MGQ5SkIybkNY?=
 =?utf-8?B?UitpMkRvSncvbWRkNnA3cXlyNTBaajFCNFFXVWtaN0MyUUtWem81V3ExU0xH?=
 =?utf-8?B?VmltUjE3RTJ4SHIrNGJLeVdtN2hYL29UTnNJaGw1bmpaV1J5L2VZYmxuczd6?=
 =?utf-8?B?ZWV5VmN4S0laeXVlT0s2KzRLNnZmQWlMMXJtb1ZpVFBpMDg3ZWhwazE4ZC9P?=
 =?utf-8?B?Z2FyWU9JbE9hSDZsWUtvRmNmTTZGdkIzeUQ2bjRCYXJqUyt2ME9tS0U3Rk5X?=
 =?utf-8?B?Z1NpQ2VKOGIrQW9keGo5UWZqL0xrV0llK0ROcFlHVm9WbC9EcUcvalBGQlhy?=
 =?utf-8?B?cnA5aEpZUTBNcEw0cW1VeW5iajZEbjV4SFlIYVVKWTUvRVBBbUVVVXg4RzZY?=
 =?utf-8?B?MWMyRnppWHV5c2JJUHFLMmE0VkltNXo5U25xWjV2Zkk0a3Z5ZnAzK2pOODNJ?=
 =?utf-8?B?akhRcUhsbGE2OGRraTRaM3BaZy9iRCtNWkV3bHhiVEZFRjd6aHVocFJXcFF4?=
 =?utf-8?Q?VeFIGwSXiTMrSnudQvX3j0WGG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afb969da-0f6c-41ef-37ad-08dc3dc9cc60
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5596.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2024 10:40:10.9745 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f0a5bDsbB+tv5qcaa6a0bVGn+8TtclF9gsEEnorc6a4Py/sW+NPm3vJMQh3O6dRZzip1tmFt+B7STZPA1bUcuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8183
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


On 3/6/2024 3:37 PM, Christian König wrote:
> Am 06.03.24 um 10:04 schrieb Sunil Khatri:
>> When an  page fault interrupt is raised there
>> is a lot more information that is useful for
>> developers to analyse the pagefault.
>
> Well actually those information are not that interesting  because they 
> are hw generation specific.
>
> You should probably rather use the decoded strings here, e.g. hub, 
> client, xcc_id, node_id etc...
>
> See gmc_v9_0_process_interrupt() an example.
> I saw this v9 does provide more information than what v10 and v11 
> provide like node_id and fault from which die but thats again very 
> specific to IP_VERSION(9, 4, 3)) i dont know why thats information is 
> not there in v10 and v11.

I agree to your point but, as of now during a pagefault we are dumping 
this information which is useful like which client
has generated an interrupt and for which src and other information like 
address. So i think to provide the similar information in the devcoredump.

Currently we do not have all this information from either job or vm 
being derived from the job during a reset. We surely could add more 
relevant information later on as per request but this information is 
useful as
eventually its developers only who would use the dump file provided by 
customer to debug.

Below is the information that i dump in devcore and i feel that is good 
information but new information could be added which could be picked later.

> Page fault information
> [gfxhub] page fault (src_id:0 ring:24 vmid:3 pasid:32773)
> in page starting at address 0x0000000000000000 from client 0x1b (UTCL2)

Regards
Sunil Khatri

>
> Regards,
> Christian.
>
>>
>> Add all such information in the last cached
>> pagefault from an interrupt handler.
>>
>> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 9 +++++++--
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h | 7 ++++++-
>>   drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c | 2 +-
>>   drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c | 2 +-
>>   drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c  | 2 +-
>>   drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c  | 2 +-
>>   drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c  | 2 +-
>>   7 files changed, 18 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>> index 4299ce386322..b77e8e28769d 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>> @@ -2905,7 +2905,7 @@ void amdgpu_debugfs_vm_bo_info(struct amdgpu_vm 
>> *vm, struct seq_file *m)
>>    * Cache the fault info for later use by userspace in debugging.
>>    */
>>   void amdgpu_vm_update_fault_cache(struct amdgpu_device *adev,
>> -                  unsigned int pasid,
>> +                  struct amdgpu_iv_entry *entry,
>>                     uint64_t addr,
>>                     uint32_t status,
>>                     unsigned int vmhub)
>> @@ -2915,7 +2915,7 @@ void amdgpu_vm_update_fault_cache(struct 
>> amdgpu_device *adev,
>>         xa_lock_irqsave(&adev->vm_manager.pasids, flags);
>>   -    vm = xa_load(&adev->vm_manager.pasids, pasid);
>> +    vm = xa_load(&adev->vm_manager.pasids, entry->pasid);
>>       /* Don't update the fault cache if status is 0.  In the multiple
>>        * fault case, subsequent faults will return a 0 status which is
>>        * useless for userspace and replaces the useful fault status, so
>> @@ -2924,6 +2924,11 @@ void amdgpu_vm_update_fault_cache(struct 
>> amdgpu_device *adev,
>>       if (vm && status) {
>>           vm->fault_info.addr = addr;
>>           vm->fault_info.status = status;
>> +        vm->fault_info.client_id = entry->client_id;
>> +        vm->fault_info.src_id = entry->src_id;
>> +        vm->fault_info.vmid = entry->vmid;
>> +        vm->fault_info.pasid = entry->pasid;
>> +        vm->fault_info.ring_id = entry->ring_id;
>>           if (AMDGPU_IS_GFXHUB(vmhub)) {
>>               vm->fault_info.vmhub = AMDGPU_VMHUB_TYPE_GFX;
>>               vm->fault_info.vmhub |=
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>> index 047ec1930d12..c7782a89bdb5 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>> @@ -286,6 +286,11 @@ struct amdgpu_vm_fault_info {
>>       uint32_t    status;
>>       /* which vmhub? gfxhub, mmhub, etc. */
>>       unsigned int    vmhub;
>> +    unsigned int    client_id;
>> +    unsigned int    src_id;
>> +    unsigned int    ring_id;
>> +    unsigned int    pasid;
>> +    unsigned int    vmid;
>>   };
>>     struct amdgpu_vm {
>> @@ -605,7 +610,7 @@ static inline void 
>> amdgpu_vm_eviction_unlock(struct amdgpu_vm *vm)
>>   }
>>     void amdgpu_vm_update_fault_cache(struct amdgpu_device *adev,
>> -                  unsigned int pasid,
>> +                  struct amdgpu_iv_entry *entry,
>>                     uint64_t addr,
>>                     uint32_t status,
>>                     unsigned int vmhub);
>> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c 
>> b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
>> index d933e19e0cf5..6b177ce8db0e 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
>> @@ -150,7 +150,7 @@ static int gmc_v10_0_process_interrupt(struct 
>> amdgpu_device *adev,
>>           status = RREG32(hub->vm_l2_pro_fault_status);
>>           WREG32_P(hub->vm_l2_pro_fault_cntl, 1, ~1);
>>   -        amdgpu_vm_update_fault_cache(adev, entry->pasid, addr, 
>> status,
>> +        amdgpu_vm_update_fault_cache(adev, entry, addr, status,
>>                            entry->vmid_src ? AMDGPU_MMHUB0(0) : 
>> AMDGPU_GFXHUB(0));
>>       }
>>   diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c 
>> b/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
>> index 527dc917e049..bcf254856a3e 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
>> @@ -121,7 +121,7 @@ static int gmc_v11_0_process_interrupt(struct 
>> amdgpu_device *adev,
>>           status = RREG32(hub->vm_l2_pro_fault_status);
>>           WREG32_P(hub->vm_l2_pro_fault_cntl, 1, ~1);
>>   -        amdgpu_vm_update_fault_cache(adev, entry->pasid, addr, 
>> status,
>> +        amdgpu_vm_update_fault_cache(adev, entry, addr, status,
>>                            entry->vmid_src ? AMDGPU_MMHUB0(0) : 
>> AMDGPU_GFXHUB(0));
>>       }
>>   diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c 
>> b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
>> index 3da7b6a2b00d..e9517ebbe1fd 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
>> @@ -1270,7 +1270,7 @@ static int gmc_v7_0_process_interrupt(struct 
>> amdgpu_device *adev,
>>       if (!addr && !status)
>>           return 0;
>>   -    amdgpu_vm_update_fault_cache(adev, entry->pasid,
>> +    amdgpu_vm_update_fault_cache(adev, entry,
>>                        ((u64)addr) << AMDGPU_GPU_PAGE_SHIFT, status, 
>> AMDGPU_GFXHUB(0));
>>         if (amdgpu_vm_fault_stop == AMDGPU_VM_FAULT_STOP_FIRST)
>> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c 
>> b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
>> index d20e5f20ee31..a271bf832312 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
>> @@ -1438,7 +1438,7 @@ static int gmc_v8_0_process_interrupt(struct 
>> amdgpu_device *adev,
>>       if (!addr && !status)
>>           return 0;
>>   -    amdgpu_vm_update_fault_cache(adev, entry->pasid,
>> +    amdgpu_vm_update_fault_cache(adev, entry,
>>                        ((u64)addr) << AMDGPU_GPU_PAGE_SHIFT, status, 
>> AMDGPU_GFXHUB(0));
>>         if (amdgpu_vm_fault_stop == AMDGPU_VM_FAULT_STOP_FIRST)
>> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c 
>> b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
>> index 47b63a4ce68b..dc9fb1fb9540 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
>> @@ -666,7 +666,7 @@ static int gmc_v9_0_process_interrupt(struct 
>> amdgpu_device *adev,
>>       rw = REG_GET_FIELD(status, VM_L2_PROTECTION_FAULT_STATUS, RW);
>>       WREG32_P(hub->vm_l2_pro_fault_cntl, 1, ~1);
>>   -    amdgpu_vm_update_fault_cache(adev, entry->pasid, addr, status, 
>> vmhub);
>> +    amdgpu_vm_update_fault_cache(adev, entry, addr, status, vmhub);
>>         dev_err(adev->dev,
>>           "VM_L2_PROTECTION_FAULT_STATUS:0x%08X\n",
>
