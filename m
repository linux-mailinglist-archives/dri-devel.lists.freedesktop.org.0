Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2AD7873747
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 14:04:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D09BA113171;
	Wed,  6 Mar 2024 13:04:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="n+3kKKdf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2087.outbound.protection.outlook.com [40.107.237.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F3C2113171;
 Wed,  6 Mar 2024 13:04:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c0oiE8px5M8sBbKe9Ao66UO26+ncAl2/4ZbKLKIE0bf3Yb3/Zj//txSz20fZ31ZI9oIbmOb8RqW0NNZ9HlxGBzfV36/yJdePOE2FXmeqRx2FWdeBHSTa/AZeKjPvBe/BKKVQ4XBz1Uj0QkasjGX4KUf9f6sMYgkRA9xhssYSOj2JG1m93fJjZBFsOGZfsyngqOZDp5eV0k7qyenIdrlVP39vsJOJgJ9w7mwMNghbiZfLt/r4AA/6bHzOPF4Z2tRz/g8pMs2BSpCIgWw/Uk1NDLNNU7EKD02gMoEglDMuQbJclzzo12xS2isyCzzx6ihKt0yWi2A5bP3+JxMT3eDwaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+8ZvxiDDF2ushAf3pXIh0WAnMis2+xn3ScgLtbWeN6g=;
 b=Zd6I4dz1uyEEvzLbG2ybziYyAgORNJAXEb/iU47pWFgTWH13mx3eChDt9KbREoEl1exbh3pmoHqVzOkhG8MOsrAHhd3jT5O7AdHVn0UJdbTd/GBXatkAkWtdQ77csQ6hbaY74e6uGBfk6ALUnhgnYkvAmKiDetWXevjY+vsB5z23ydCE45nBU9ug4RkYQ+XN+uGs7yDxZMFJvYcF0MM8S100IuFQPn7zUD2MpEm6kD7C1y0BNlYlmR7Oo2Ntl5KhirYDu8yQVm9NBkBesLW0hVWXcgJtfwvnNbGNRHlJeplz9ac/f1JBhUyAC/OaOsB9SWWN5sAjRCVGNYe5fzHeKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+8ZvxiDDF2ushAf3pXIh0WAnMis2+xn3ScgLtbWeN6g=;
 b=n+3kKKdf0jX+u6dpSV6dXtHd+N0yKQI1Unrdh6asyRN0KUUmbotJ2HPWul3yyDeog7h2MVqZh1BG+bn3dH6SlXgGrhsMRjJHTFPisCvrnsBXkIjQQvZX4YOf2uUFXF2oWWjo1EgHzzS8o4zWWdm/tF8offc3ftzFRupfKhT6U8M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5596.namprd12.prod.outlook.com (2603:10b6:510:136::13)
 by SA1PR12MB7294.namprd12.prod.outlook.com (2603:10b6:806:2b8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.38; Wed, 6 Mar
 2024 13:04:35 +0000
Received: from PH7PR12MB5596.namprd12.prod.outlook.com
 ([fe80::6f48:e3f1:6ff9:75bd]) by PH7PR12MB5596.namprd12.prod.outlook.com
 ([fe80::6f48:e3f1:6ff9:75bd%4]) with mapi id 15.20.7362.019; Wed, 6 Mar 2024
 13:04:35 +0000
Message-ID: <17e12147-79dd-44ba-b8ae-b96fb72dcfbd@amd.com>
Date: Wed, 6 Mar 2024 18:34:25 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: cache in more vm fault information
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Sunil Khatri <sunil.khatri@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Shashank Sharma <shashank.sharma@amd.com>
Cc: amd-gfx@lists.freedesktop.org, Pan@rtg-sunil-navi33.amd.com,
 Xinhui <Xinhui.Pan@amd.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Mukul Joshi <mukul.joshi@amd.com>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
References: <20240306090408.3453152-1-sunil.khatri@amd.com>
 <2f792620-fd8a-412e-9130-e276ba36d5a0@amd.com>
 <5e2899cd-75b4-4ddd-97ff-4e10a2e67fbb@amd.com>
 <66815303-bd9c-4dfc-ae1a-bbdc5d1bb47c@amd.com>
Content-Language: en-US
From: "Khatri, Sunil" <sukhatri@amd.com>
In-Reply-To: <66815303-bd9c-4dfc-ae1a-bbdc5d1bb47c@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0236.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:eb::20) To PH7PR12MB5596.namprd12.prod.outlook.com
 (2603:10b6:510:136::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5596:EE_|SA1PR12MB7294:EE_
X-MS-Office365-Filtering-Correlation-Id: 019a838e-8ac9-418d-5cf3-08dc3dddf8fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mdYAYBzLBDdTw6C20ZCuoyRd379DNU6S76rHk36GU2w42lLau3wv797VrH2bIC3R+WJsOMA9O3pxUqHEBDQympD2ZiA/hHrbyYXZ09WE2fS2Ngv35v9Ogcrof5aG5rQnUPDl4MUTTcSB6op5VrDVD3EMoBniVLFmJUb+12pNI8woxydUO62NiNAZfQe2zGE6Bmv445sI27381tD9M9aSr4pPVdvOJAgu5iTZF6gRCwz5342+gSPYBZgPAUNTvilV5OePCq9ZREfJmM6GfOcL+1qBQWRDiQkByCvFKzyq/3+bFq0Q78sysy/Z0a5nwyE3AMV2N/IPI7GeVToqxnWcwDX0+FhGEbJa7eXOEXJ4eysGUEZzC1vFWYWmlHEV8bfEy1mP1c3ok3wQ91kxHGL2Wx18f0UDTa98+SIasqrlwQQP2bUWdRjwghk38hpp5hNlUiTRgk5QBlmI1SlCidfUtqHbBfoKijG8QwcZYvJoPB01Y2EuOS36qJ8CL5HlA5Ct0irEkiJS2DhMIFqmQKuGySrJr7fIBMmjKlaP2OAM5f5f21hZXqS50etwntTTy20fvkoOZDoa9dB07NkvTSeHepqmrarygLbp1KSm2jENSDIP/LdzEyXqTt4QzQoLUyaKk8miO7126X1lCnluB+ea++nPq84HEcsjerUMtF704ow=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5596.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a2hZVTNpQmNrSjdaVkNaUVV4ak1CMEZueTFEN04xQk0xQlZyVDFQS1BrN0l6?=
 =?utf-8?B?WFdIOFdjOFFra2YydmZveklqWkJGRGI5dTBsY0pERHFsR1B3TFowSG5CemtQ?=
 =?utf-8?B?YnkzTTlPbXBwY29yNlhaeXNyT2E3b1VMR3E0WDZvV1kzUXhiTGRLQmxPbFUv?=
 =?utf-8?B?QlQ5RHhpeWVlMVIwdkZXVk41SVZaTlVFTC94Tm9RWHR4a2w4TjMxd1lyeVJI?=
 =?utf-8?B?YWF4cXhpMSs5SVQzbk13NUtzUEhQOWhJemZoWjJGTDZYdTBCTjRKb25EMEUx?=
 =?utf-8?B?WTlKOVUwbzM1dkpZRlhVQnh2c0RoaEFneTRrRUwzV083Z0tBU29Kb0kycUtB?=
 =?utf-8?B?Q3hkbnRtQlBVei91SXZKV1paS2VFeGhnNEZxTGEyU045enZSRXllbVNJQnpx?=
 =?utf-8?B?M3R6eFdsMVlKdy92VmxCWjJQZmd1NCtnNWNFRHNPNWVjUS9yWmlqRG9JN0hR?=
 =?utf-8?B?a0RSc3hYQWlIU1pQcGVQUTlBaGI4MXltN2EyVEp6WmtraTVNMXprRzEzN1pO?=
 =?utf-8?B?QkI2cGpCM0tBVFNYYTlFb0NTdHBBSDNFWXFIQktmNlNLZVdPNm11UU5QREEy?=
 =?utf-8?B?S2dGbTRWWUFZYVIzd1VVY0Y5cmczSTRwK3VPNUYzd01jejFOczExQXd4RTZC?=
 =?utf-8?B?TnlwZzBXUHROZ1o5endUUzdUY3JleFp1dFhqblFRQnNwUURVNU1LRFZQWVNl?=
 =?utf-8?B?cmlUNVNCZFJwcWV0VGNLVVJJODZLelhuRlRzR01tMCtBSDcySUprS1E0WjJu?=
 =?utf-8?B?SjhYd2dSZmVMMGI4NmlPNXF1bUZCZW5hRlRqVXNVVkZKWHZZU2VibXZ4ZWIv?=
 =?utf-8?B?VSt2TEQ5c21QTkl1K2lsenRDdWs0UUlDUUk5TVZKT1ZEQ2pKMklKU004ZzJl?=
 =?utf-8?B?MkVMS2sramtKcU5JTXJ3ZjZIbXR2c2w1MVlGeWFmYTZiaDdVSXVOVXpmOExP?=
 =?utf-8?B?aHAydlFRWmF0TVRnSG4wTnRjc0RxWW9rcjZHSlhvZ25GcEtjYVVMN0tOa2V1?=
 =?utf-8?B?VTZzMzdrZEFDV08xT1ZYMXNJa0tVTTVuc3orbHpKOFY3N016OHpkTm54OHZ3?=
 =?utf-8?B?MkU5ZWpLdytsMkhTWUtMTHJUY2hSVE9MRkphZm5JeDNYU1hVT1lSbjBuNzVs?=
 =?utf-8?B?ZTRONGRWWS8yTy90bnBESk16WjlKZjBHNXJBTGE4c1drWTRRSlVMcUtZeVBz?=
 =?utf-8?B?L3dKUTVleUFvd0MrbnlJZERjWHB4ZWc4WGNLdG5JTGhveFpVeUNHVWR6YTVk?=
 =?utf-8?B?dlZWNkp0NGsyZ2k4eGIya0Z4SUsvTWZYUFlWRGlXRmhSbXZTUnRkeFluZVVp?=
 =?utf-8?B?NFNScmp3cW1Ib1B0b1Y2UEZGaWxGZGFSeWpCU2xyMGNpaWZkclhKT0lQT0tD?=
 =?utf-8?B?M3gyb213ei9QYjZUZ2Jya3RPN0tFS2dPc3dJdHdiRDBGNjl0MEVudWxOUTBX?=
 =?utf-8?B?NW4wOGNjdXM4eXRMd0Z0dHlWZXBpWnIwa242Z0pkN1VTcWgxc2djNlZmR0gx?=
 =?utf-8?B?ZWZWNWtnK1I2WnMvNjRsMkpjZmFHeWZHWmIrWlRPQlVSQmpUVno5Mis1cHVU?=
 =?utf-8?B?d213MDd2ZUwxajBpZitvRXd6WEdDUzltb3AvcUg4UFVnZWdibGhMbTNaZ3Fk?=
 =?utf-8?B?UWw3bVNsdXhVZlBRaVpwL3d1ZDFCZXF6aXN6WWw4aURBV3owZ1dCeG4wRy9P?=
 =?utf-8?B?Nmw5K0lQMzVYUjd1VlNaMjBYWkVtbmI2NzhsaXVHeWZLcytQaWo2aVJCeGlk?=
 =?utf-8?B?N1hTZ1BCb3BDVDZGUUp1em1pYWpaUjNJVDl6SnBwWEtwME1oeFloYkhqeE1w?=
 =?utf-8?B?QTBrYW5LVWdyWnFhSVlaUjdOK0JxeUhxUFRHN2dGSytiTXpSYTE4OTduN3Jv?=
 =?utf-8?B?L0JMQjJXeHZ2TENEUklaanZocnZtdFROUjg2ZElWM0tMUVFaQ05QUE9MSkNr?=
 =?utf-8?B?czdtVFQ4VXZ5TFBGMjVXTi9QZEdtUWZ1Q2VWb2VZcXJQYnBYK0JUNzZudy91?=
 =?utf-8?B?SXpBY09IcU1WaXBYTFdTbFlnaHhON2RpUmlPeHJaS1Bia3hnOWc3dmlub01E?=
 =?utf-8?B?dzkrMXZDZ1RXbXp4ZThkZWJTT3kwZmttUmZsVjRyUmpGQjNHdmEwelI0REJo?=
 =?utf-8?Q?lV9g+rP7ayaQtCtDSUbPGpD9f?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 019a838e-8ac9-418d-5cf3-08dc3dddf8fd
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5596.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2024 13:04:35.5399 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TRw1xtC9bcSc/3MjPF1pKmyI+TewqpZJerE2/yIfIENNfMTw2PpxUc34uq/HLRQyV2xEI8K71pOmUEW21eihpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7294
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


On 3/6/2024 6:12 PM, Christian König wrote:
> Am 06.03.24 um 11:40 schrieb Khatri, Sunil:
>>
>> On 3/6/2024 3:37 PM, Christian König wrote:
>>> Am 06.03.24 um 10:04 schrieb Sunil Khatri:
>>>> When an  page fault interrupt is raised there
>>>> is a lot more information that is useful for
>>>> developers to analyse the pagefault.
>>>
>>> Well actually those information are not that interesting because 
>>> they are hw generation specific.
>>>
>>> You should probably rather use the decoded strings here, e.g. hub, 
>>> client, xcc_id, node_id etc...
>>>
>>> See gmc_v9_0_process_interrupt() an example.
>>> I saw this v9 does provide more information than what v10 and v11 
>>> provide like node_id and fault from which die but thats again very 
>>> specific to IP_VERSION(9, 4, 3)) i dont know why thats information 
>>> is not there in v10 and v11.
>>
>> I agree to your point but, as of now during a pagefault we are 
>> dumping this information which is useful like which client
>> has generated an interrupt and for which src and other information 
>> like address. So i think to provide the similar information in the 
>> devcoredump.
>>
>> Currently we do not have all this information from either job or vm 
>> being derived from the job during a reset. We surely could add more 
>> relevant information later on as per request but this information is 
>> useful as
>> eventually its developers only who would use the dump file provided 
>> by customer to debug.
>>
>> Below is the information that i dump in devcore and i feel that is 
>> good information but new information could be added which could be 
>> picked later.
>>
>>> Page fault information
>>> [gfxhub] page fault (src_id:0 ring:24 vmid:3 pasid:32773)
>>> in page starting at address 0x0000000000000000 from client 0x1b (UTCL2)
>
> This is a perfect example what I mean. You record in the patch is the 
> client_id, but this is is basically meaningless unless you have access 
> to the AMD internal hw documentation.
>
> What you really need is the client in decoded form, in this case 
> UTCL2. You can keep the client_id additionally, but the decoded client 
> string is mandatory to have I think.
>
> Sure i am capturing that information as i am trying to minimise the 
> memory interaction to minimum as we are still in interrupt context 
> here that why i recorded the integer information compared to decoding
and writing strings there itself but to postpone till we dump.

Like decoding to the gfxhub/mmhub based on vmhub/vmid_src and client 
string from client id. So are we good to go with the information with 
the above information of sharing details in devcoredump using the 
additional information from pagefault cached.

regards
sunil

>
> Regards,
> Christian.
>
>>
>> Regards
>> Sunil Khatri
>>
>>>
>>> Regards,
>>> Christian.
>>>
>>>>
>>>> Add all such information in the last cached
>>>> pagefault from an interrupt handler.
>>>>
>>>> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
>>>> ---
>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 9 +++++++--
>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h | 7 ++++++-
>>>>   drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c | 2 +-
>>>>   drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c | 2 +-
>>>>   drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c  | 2 +-
>>>>   drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c  | 2 +-
>>>>   drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c  | 2 +-
>>>>   7 files changed, 18 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c 
>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>>> index 4299ce386322..b77e8e28769d 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>>> @@ -2905,7 +2905,7 @@ void amdgpu_debugfs_vm_bo_info(struct 
>>>> amdgpu_vm *vm, struct seq_file *m)
>>>>    * Cache the fault info for later use by userspace in debugging.
>>>>    */
>>>>   void amdgpu_vm_update_fault_cache(struct amdgpu_device *adev,
>>>> -                  unsigned int pasid,
>>>> +                  struct amdgpu_iv_entry *entry,
>>>>                     uint64_t addr,
>>>>                     uint32_t status,
>>>>                     unsigned int vmhub)
>>>> @@ -2915,7 +2915,7 @@ void amdgpu_vm_update_fault_cache(struct 
>>>> amdgpu_device *adev,
>>>>         xa_lock_irqsave(&adev->vm_manager.pasids, flags);
>>>>   -    vm = xa_load(&adev->vm_manager.pasids, pasid);
>>>> +    vm = xa_load(&adev->vm_manager.pasids, entry->pasid);
>>>>       /* Don't update the fault cache if status is 0.  In the multiple
>>>>        * fault case, subsequent faults will return a 0 status which is
>>>>        * useless for userspace and replaces the useful fault 
>>>> status, so
>>>> @@ -2924,6 +2924,11 @@ void amdgpu_vm_update_fault_cache(struct 
>>>> amdgpu_device *adev,
>>>>       if (vm && status) {
>>>>           vm->fault_info.addr = addr;
>>>>           vm->fault_info.status = status;
>>>> +        vm->fault_info.client_id = entry->client_id;
>>>> +        vm->fault_info.src_id = entry->src_id;
>>>> +        vm->fault_info.vmid = entry->vmid;
>>>> +        vm->fault_info.pasid = entry->pasid;
>>>> +        vm->fault_info.ring_id = entry->ring_id;
>>>>           if (AMDGPU_IS_GFXHUB(vmhub)) {
>>>>               vm->fault_info.vmhub = AMDGPU_VMHUB_TYPE_GFX;
>>>>               vm->fault_info.vmhub |=
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h 
>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>>>> index 047ec1930d12..c7782a89bdb5 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>>>> @@ -286,6 +286,11 @@ struct amdgpu_vm_fault_info {
>>>>       uint32_t    status;
>>>>       /* which vmhub? gfxhub, mmhub, etc. */
>>>>       unsigned int    vmhub;
>>>> +    unsigned int    client_id;
>>>> +    unsigned int    src_id;
>>>> +    unsigned int    ring_id;
>>>> +    unsigned int    pasid;
>>>> +    unsigned int    vmid;
>>>>   };
>>>>     struct amdgpu_vm {
>>>> @@ -605,7 +610,7 @@ static inline void 
>>>> amdgpu_vm_eviction_unlock(struct amdgpu_vm *vm)
>>>>   }
>>>>     void amdgpu_vm_update_fault_cache(struct amdgpu_device *adev,
>>>> -                  unsigned int pasid,
>>>> +                  struct amdgpu_iv_entry *entry,
>>>>                     uint64_t addr,
>>>>                     uint32_t status,
>>>>                     unsigned int vmhub);
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c 
>>>> b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
>>>> index d933e19e0cf5..6b177ce8db0e 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
>>>> @@ -150,7 +150,7 @@ static int gmc_v10_0_process_interrupt(struct 
>>>> amdgpu_device *adev,
>>>>           status = RREG32(hub->vm_l2_pro_fault_status);
>>>>           WREG32_P(hub->vm_l2_pro_fault_cntl, 1, ~1);
>>>>   -        amdgpu_vm_update_fault_cache(adev, entry->pasid, addr, 
>>>> status,
>>>> +        amdgpu_vm_update_fault_cache(adev, entry, addr, status,
>>>>                            entry->vmid_src ? AMDGPU_MMHUB0(0) : 
>>>> AMDGPU_GFXHUB(0));
>>>>       }
>>>>   diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c 
>>>> b/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
>>>> index 527dc917e049..bcf254856a3e 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
>>>> @@ -121,7 +121,7 @@ static int gmc_v11_0_process_interrupt(struct 
>>>> amdgpu_device *adev,
>>>>           status = RREG32(hub->vm_l2_pro_fault_status);
>>>>           WREG32_P(hub->vm_l2_pro_fault_cntl, 1, ~1);
>>>>   -        amdgpu_vm_update_fault_cache(adev, entry->pasid, addr, 
>>>> status,
>>>> +        amdgpu_vm_update_fault_cache(adev, entry, addr, status,
>>>>                            entry->vmid_src ? AMDGPU_MMHUB0(0) : 
>>>> AMDGPU_GFXHUB(0));
>>>>       }
>>>>   diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c 
>>>> b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
>>>> index 3da7b6a2b00d..e9517ebbe1fd 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
>>>> @@ -1270,7 +1270,7 @@ static int gmc_v7_0_process_interrupt(struct 
>>>> amdgpu_device *adev,
>>>>       if (!addr && !status)
>>>>           return 0;
>>>>   -    amdgpu_vm_update_fault_cache(adev, entry->pasid,
>>>> +    amdgpu_vm_update_fault_cache(adev, entry,
>>>>                        ((u64)addr) << AMDGPU_GPU_PAGE_SHIFT, 
>>>> status, AMDGPU_GFXHUB(0));
>>>>         if (amdgpu_vm_fault_stop == AMDGPU_VM_FAULT_STOP_FIRST)
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c 
>>>> b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
>>>> index d20e5f20ee31..a271bf832312 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
>>>> @@ -1438,7 +1438,7 @@ static int gmc_v8_0_process_interrupt(struct 
>>>> amdgpu_device *adev,
>>>>       if (!addr && !status)
>>>>           return 0;
>>>>   -    amdgpu_vm_update_fault_cache(adev, entry->pasid,
>>>> +    amdgpu_vm_update_fault_cache(adev, entry,
>>>>                        ((u64)addr) << AMDGPU_GPU_PAGE_SHIFT, 
>>>> status, AMDGPU_GFXHUB(0));
>>>>         if (amdgpu_vm_fault_stop == AMDGPU_VM_FAULT_STOP_FIRST)
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c 
>>>> b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
>>>> index 47b63a4ce68b..dc9fb1fb9540 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
>>>> @@ -666,7 +666,7 @@ static int gmc_v9_0_process_interrupt(struct 
>>>> amdgpu_device *adev,
>>>>       rw = REG_GET_FIELD(status, VM_L2_PROTECTION_FAULT_STATUS, RW);
>>>>       WREG32_P(hub->vm_l2_pro_fault_cntl, 1, ~1);
>>>>   -    amdgpu_vm_update_fault_cache(adev, entry->pasid, addr, 
>>>> status, vmhub);
>>>> +    amdgpu_vm_update_fault_cache(adev, entry, addr, status, vmhub);
>>>>         dev_err(adev->dev,
>>>>           "VM_L2_PROTECTION_FAULT_STATUS:0x%08X\n",
>>>
>
