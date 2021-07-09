Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD773C29BA
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jul 2021 21:31:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68E496EA77;
	Fri,  9 Jul 2021 19:31:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2060.outbound.protection.outlook.com [40.107.237.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77F386EA77;
 Fri,  9 Jul 2021 19:31:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Al89HXDTb1DULEmVOotTy6aVLwI6Mnie6Hl+vIc0co4CTGnHkJ35twtX0bTSKD4CRa+S7Dtqj1SDuXXb7MpouKvZgCKLiYAqL0NJ8yqJRsXvfyKqocD3IKf++KcYfdWrZqz2IqvDgCQoRlXn401noV3uMHCazsKdd55vQio9tpwUexITf3fqG+DDVdb95nhcXZ9e9HdR0lCGhi930rIvVtzNuT7q2A9F8WM/Djhy7/vfWlAqUzTbTOEbxCxoq3S86mPLlVojhuSM9EHV6zuDstAMU+sZP1k5S+H22T98B66dYJubV6tI4nbMJMaUNnTIhIP4ds1C//9vYMqreAxS1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s/N0CujEX41UOWFv0be8NcpOxV2QjLsIB84cRmEQet0=;
 b=RDdVC5aShcwZPiHg/JPqgz2sr7cVveHb2TkirMCXgW6cBPuliXJHSMAZKQyyTND+pe2X2HaaARfKKfXOh3fWEmgz40+Yr8n9syk49SvDq5P8pg9W3toyQmAFhqCr9XWT4vqOsjSHKo9C7YxEaYxEZlCD2h6dPiB8yngwGIPLkwkx4WCUM19SCgVyGhZZ1y3drKg/i4EnTln89NVYfi4k3vlYK3bMWeFMCz/rQwSxIIvwbNBgfJG1bK+pfLarsPeq0HPigyX46bupdDr2qVAlm06A26Lz+Z3k35IJZLoHFyarHUABwBM/rK3WeXHFU0XWVh/FmkSOp1bSlOJBv+QO9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s/N0CujEX41UOWFv0be8NcpOxV2QjLsIB84cRmEQet0=;
 b=LdVJi+W4D2Fyliqup9YidJB9eoWik4plJSh49e3SrGtRrX7XrhnaWarpaeLM/Ns3vKXDiGkGFvgXbEMQwJ8WGVRzC42assu2zUB6o8paUqJo39iQqJk3W6+3XUx4ivcNUlrYVsWMvVC/PkCpqo45foRfMuwk6c+4FibjMsm6oSc=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5129.namprd12.prod.outlook.com (2603:10b6:408:136::12)
 by BN9PR12MB5050.namprd12.prod.outlook.com (2603:10b6:408:133::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.21; Fri, 9 Jul
 2021 19:31:23 +0000
Received: from BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::b891:a906:28f0:fdb]) by BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::b891:a906:28f0:fdb%3]) with mapi id 15.20.4308.023; Fri, 9 Jul 2021
 19:31:23 +0000
Subject: Re: [PATCH 2/2] drm/ttm: Fix COW check
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20210708193621.2198733-1-alexander.deucher@amd.com>
 <20210708193621.2198733-2-alexander.deucher@amd.com>
 <a25f93e7-8c03-542c-f594-64a7c1fba292@gmail.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
Message-ID: <2fd0006e-f005-b11c-3918-a9d690a1831a@amd.com>
Date: Fri, 9 Jul 2021 15:31:21 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <a25f93e7-8c03-542c-f594-64a7c1fba292@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YT1PR01CA0128.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::7) To BN9PR12MB5129.namprd12.prod.outlook.com
 (2603:10b6:408:136::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.27.226.80] (165.204.55.251) by
 YT1PR01CA0128.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.20 via Frontend Transport; Fri, 9 Jul 2021 19:31:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b7434426-4085-43ed-97b8-08d9431022d7
X-MS-TrafficTypeDiagnostic: BN9PR12MB5050:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN9PR12MB505044E1607199D610C2E4B192189@BN9PR12MB5050.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zCT1Jz5OHJ6R2zdBw0vgBCRpHDQJfSMLYDPetzMqCa6PD+gnHfmvchwZMn2mlp7pXfmy+ulA6fdA/eE/yw3qdRz9lYEFVqqGZDA2e2gficCOGR24+ZYEm5BYxMliYiEyCyuqDkCRFv8jAqVeoDldeUTOx+MNTqeiClEjEimR+LO2Q/VeR43VXAb0NIg6jG/kdmb8VzMihcSEvzXdnn2e+GxMX8X1dthRw662v8xqyK5WEf9Ihh4jlRui/QX0CEs4hawUlKMqUBSqvWBUD23U8O1MR+PSBtpDlV92p7BKaY7vitX0P7YRoXulqeG1WvasQ0uRtOTtL2XzPLbmRfLkmDVel1m/9KrkVlCdlXAwW7p0dRJLALtDQsU7uzbTbhiTxc5I8zij4Ms6HRET6xWM8MYEelQV00t+e7xYbSyfw4ANFCY8T7YQwulOmDj/YTp5H8lXu+oHtukIKk62yWrCQIhJKGSNzarrYx0QgOqXALrIJdiHB5okRzg+pYMNqYbrpGDNdjzIa0tV+Wn0sKXEh8nfNwjgmneXml2HU17wwEAvaGSsp7JZrXLcOHXAuBTDlGTdwIM/9h0IweNsFsf9tt+N0mgQ4IFopcGKFjwoTgwn2IGnSydYtjL6O6bL1RcMYW+DYQFFjWriRfoPoPKRXOSUb0mMkaxxjvuVpuLxvsrkCBDquCh/1VJfTGw4tcHRKJsAsQ0ofXkf5avQVtE/1A0t7tSbDT2Q3EQc6T49R7mFOZgvMB+srt8+5Mqs/yOV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5129.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(376002)(136003)(39860400002)(366004)(956004)(16576012)(110136005)(86362001)(31686004)(2906002)(478600001)(2616005)(316002)(66556008)(83380400001)(31696002)(66574015)(38100700002)(66946007)(8936002)(5660300002)(53546011)(36756003)(44832011)(186003)(6486002)(8676002)(66476007)(26005)(36916002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NVUxeDFuc1FhMno3YlNqd1dtZUJUZkYyc21DekRPdVpSdTRKcHVud1EvemJV?=
 =?utf-8?B?WnNrZm82UWo4dGJSSVVxTE1pbkMyN3V1TXZZUStOZ1lmOVp0SXJMVVR4aWJD?=
 =?utf-8?B?U0pNUzZBUWh6TmVIKzBMTSt1UnpKT1NvVXlnT05UM1hXUEV6cENrU2pBYmVt?=
 =?utf-8?B?T1VMei9ZcmhraWlGcUNRdktrS0FqRlI0bGZCQkpLTWphRG55TEhZWldjT0ZG?=
 =?utf-8?B?dDE3U0N0SFdUcENlZUFkN0Joa0o2Q3VVU1FmVzVXMU83dzFjdFhKNGI0RitT?=
 =?utf-8?B?UWc4NEgybDNoSlJXYXdGZTM2cmRTNzlPSnZtODBtMUlTbGNIT3FZeDhadW1H?=
 =?utf-8?B?SkNoL1UwODJmOWJ4Wm4zY3IyNHIvTi8yUEo0aGhzdGZOdmdZdU0xY3grUFJi?=
 =?utf-8?B?eVU2clhwK1pmY3Q1VnFITFB5V0g4YldrVUVhZmZOQ1BIQnR1YlVjSmNzblRl?=
 =?utf-8?B?TFVVRnVrUFNmRVArenBxNS9jY0NNVlY2Wjl6RGhPaXdNSXcyYTArb3VRL3ln?=
 =?utf-8?B?aUowbzhrMmNmeGNYQW1aaWVKLzhzSVd1V2pNZUdJaDdNYllTUzlUNTFFZ3Ew?=
 =?utf-8?B?SmNpT0xDWk0rK28zelNNa25hMUhvRTJuYVFkaGwwa3lJbmNQN3dlcitnbWta?=
 =?utf-8?B?dVFmU212cUFoWWx5a0NnZE0vMUdLRitvQ25IaVl1bXNjZ1daZ0hrSGZsZjhF?=
 =?utf-8?B?OG9vTmxYcE1yMnlPMEt0bXRRbnQ5OGxxQ0lGK2tYUk5rdEJoQlAwK0JCK0t6?=
 =?utf-8?B?NmIrMWtOYjdaOFBNSjBYTGRlWmVuSVFCbFMwai81WXFJNjcvY2o0QW90L3BK?=
 =?utf-8?B?UnJDZitIb0ZrdWNpTTdGRE9UbFBsbGRWMkxMc3hxc29Pb25kK1g0YzlHNUJh?=
 =?utf-8?B?eDY1SEpkVCs5dTNHYitjcGhLdWNmMXN1dm1QdE1keHNyUVNvNXhDelNuUjB6?=
 =?utf-8?B?Y0cva2lwS3g4ODhacGJnUk1oaDNVb0JreSt6V3k1UkozdDRMb25pVjdSaVpG?=
 =?utf-8?B?QVZqRDJIMklMc1puR2pvYUpKQ21qK0RGYzB2KzRDNVkvbkJVMW1FTUpHZlRl?=
 =?utf-8?B?M0I3QmxvNFZiTnNMamlyMGlvUHRhd3A5Um43WkYwNTVHd2ZYOEVDUjU4cStL?=
 =?utf-8?B?bWRuV29URElDYmJzK01KWTM1Nk9XK0psalphR3JBWStIUmhHZ01jeXJvSllm?=
 =?utf-8?B?QU9hSDQ0UnhqRmt4VCtmMFJCTlNJUktqZEZ4MC9kaVJKSGs1RGN6NHJtWGx1?=
 =?utf-8?B?THpwaWJXbVNGc3cyanNxYWJTNjN4R0x6b2cvRnNHbUtPc1Z5L1ZjYzYyYzlm?=
 =?utf-8?B?YlZ6bjdUNmNyeEZWV1N0ZkV6bm5kSVh4TVFCeTFmVGVndHBVTGthaStzZU5H?=
 =?utf-8?B?Mlk3VGJJZjFHMVpsQ09OU2REeStoamd4VlNFNDcvNWVuVG95bHN1dUFKZWtm?=
 =?utf-8?B?T25xQW81VlV2emM4K3A5aDNRRDVUZFdDR2lSQW1HL2k4d29Xd2hZdG1malJT?=
 =?utf-8?B?R0xwK2tIaEo5VEYyMllHY0RSRzVsZ1JKbEtZcHd6bzAvTUdmVFQwV3UzTDRm?=
 =?utf-8?B?eHg4VEJ6U0MvcXBYNzlPNldITDJLeW5vdzQzbDlic3Q2bFZUZ3c4M3F0eWpX?=
 =?utf-8?B?TURndnhlVmZ3bktGcEdXZkVpRWJzTmZsN2dYU2Zla0tHNDRwdDFhVUJEM2NS?=
 =?utf-8?B?SndkeFQyS0FqamZ1d1drc3dnVkxPcU0zMzBtVjZHL0JFZlJGRERlSjcwbDNn?=
 =?utf-8?Q?bh2fbukKEdfdsNcetf3TCvvoB87p8OTsDFsu2fE?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7434426-4085-43ed-97b8-08d9431022d7
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5129.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2021 19:31:23.3713 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hcDSbunX4Oday+rm26nS7gCZv+YP65VxNNyjkTAijNQsiAOD41Gn/eb1PokcPp9im1qK5EOUGFnqPTA9oinA+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5050
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

On 2021-07-09 2:38 a.m., Christian König wrote:
>
>
> Am 08.07.21 um 21:36 schrieb Alex Deucher:
>> From: Felix Kuehling <Felix.Kuehling@amd.com>
>>
>> KFD Thunk maps invisible VRAM BOs with PROT_NONE, MAP_PRIVATE.
>> is_cow_mapping returns true for these mappings. Add a check for
>> vm_flags & VM_WRITE to avoid mmap failures on private read-only or
>> PROT_NONE mappings.
>
> I'm pretty sure that this is not working as expected.

Not sure what you mean. Debugger access to the memory through the 
PROT_NONE VMAs is definitely working, with both ptrace and /proc/<pid>/mem.


>
>>
>> Fixes: f91142c62161 ("drm/ttm: nuke VM_MIXEDMAP on BO mappings v3")
>> Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
>> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
>> ---
>> drivers/gpu/drm/ttm/ttm_bo_vm.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c 
>> b/drivers/gpu/drm/ttm/ttm_bo_vm.c
>> index f56be5bc0861..a75e90c7d4aa 100644
>> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
>> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
>> @@ -552,7 +552,7 @@ static const struct vm_operations_struct 
>> ttm_bo_vm_ops = {
>>   int ttm_bo_mmap_obj(struct vm_area_struct *vma, struct 
>> ttm_buffer_object *bo)
>>   {
>>       /* Enforce no COW since would have really strange behavior with 
>> it. */
>> -    if (is_cow_mapping(vma->vm_flags))
>> +    if (is_cow_mapping(vma->vm_flags) && (vma->vm_flags & VM_WRITE))
>
> is_cow_mapping() already checks for VM_MAYWRITE, so this here 
> shouldn't be necessary.

AFAICT, VM_MAYWRITE is not based on the PROT_... bits used to create the 
VMA, but based on the permissions of the file. So as long as the render 
node is writable, VM_MAYWRITE is set for all VMAs that map it.

I would agree that it's probably a bad idea for the Thunk to map these 
VMAs with MAP_PRIVATE. We can try changing the Thunk to use MAP_SHARED 
for these PROT_NONE mappings. But that doesn't change the fact that this 
kernel patch broke existing usermode.

Regards,
   Felix


>
> Christian.
>
>>           return -EINVAL;
>>         ttm_bo_get(bo);
>
