Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD27873BAD
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 17:06:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 500A81132FA;
	Wed,  6 Mar 2024 16:06:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="VKiril35";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2046.outbound.protection.outlook.com [40.107.93.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BCAB1132FC;
 Wed,  6 Mar 2024 16:06:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nw94KQQdGwz5rSB6h7V/SRxUKjY0CjJOqodOfkopEh3gU1FxRkUbcZsOfLHQo03m+4E7baG5rO1YaDBSGae21KFiCFLIvGhh3lbu7UDCEw9ndMO/va3Q/tanYWtJVHbIYLXVai++P3MawUnP54Z1ldaCqzBm7hYvzUOiWNAyS1XULfFJYFLDXWQ8UI3GdnEFlz2L3IqLKXiRHENeRoh5vz2VY0b6N5WPQz7DNIqtqcty83OoK1CkFKminbk/bu4xBfE/XRO4Pa5UtthJyeDNCYrqjfHie1ibabLo5ZkXHIwMMRkIGVmDfacJH/DauC7K333iO7L2SEGs/aAdxe1C0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D9hQauP96nLI8qwYuGge191mfbSGxZDO+WJJRfRtpN4=;
 b=Yb2eosDGfgh+OjOdgN+CQCeCgwlHxxRzRBiAXWyOdWTN+Cb8Qh7hsDOLBHJJ6m4voFTzV4rj96Z3Who7dMh0kuqc7bWnz8scaRBuBq/WqgBHBLhT55Ho8wOJVO37A24Z0IbBmkL1BFcPMstHVpKTYn+5KptAn1+BZygmEzxD1Mo9solVP54TzN8pAs2saFpKdaIbPg/SfayVKvGFd6n2Xt/ISo6GW/5z2l7VAbOv/SlYMqxUPYm/usYrnKRmwLMg1vA1ozfyoOfpsOqAce9Sbr1UhNniukqAng3751sE6G5j4C+I2pQR4ojK8554Zl1DZGnIsNe1elSmR/7EFTffUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D9hQauP96nLI8qwYuGge191mfbSGxZDO+WJJRfRtpN4=;
 b=VKiril35rZpafpLq4dgcrziASzOkp6HsPmP9eSMkPeS399e8bGI/23wwzDnwahlZkxycll6ICiQJr7QbcA+96TlOvbgDr+BFdkWOBSbS0xq5m2eaYpby8eEBnTBH39olm5Bufzb3YWmJ2m3YUD8jtRNBcrPHRhh+DmuAxOjCcGQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5596.namprd12.prod.outlook.com (2603:10b6:510:136::13)
 by SN7PR12MB8170.namprd12.prod.outlook.com (2603:10b6:806:32c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.24; Wed, 6 Mar
 2024 16:06:50 +0000
Received: from PH7PR12MB5596.namprd12.prod.outlook.com
 ([fe80::6f48:e3f1:6ff9:75bd]) by PH7PR12MB5596.namprd12.prod.outlook.com
 ([fe80::6f48:e3f1:6ff9:75bd%4]) with mapi id 15.20.7362.019; Wed, 6 Mar 2024
 16:06:50 +0000
Message-ID: <852e4f0e-c743-44c2-a2bb-59f0e8e25e1b@amd.com>
Date: Wed, 6 Mar 2024 21:36:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: cache in more vm fault information
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Alex Deucher <alexdeucher@gmail.com>
Cc: Sunil Khatri <sunil.khatri@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>, amd-gfx@lists.freedesktop.org,
 Pan@rtg-sunil-navi33.amd.com, Xinhui <Xinhui.Pan@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Mukul Joshi <mukul.joshi@amd.com>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
References: <20240306090408.3453152-1-sunil.khatri@amd.com>
 <2f792620-fd8a-412e-9130-e276ba36d5a0@amd.com>
 <5e2899cd-75b4-4ddd-97ff-4e10a2e67fbb@amd.com>
 <66815303-bd9c-4dfc-ae1a-bbdc5d1bb47c@amd.com>
 <17e12147-79dd-44ba-b8ae-b96fb72dcfbd@amd.com>
 <CADnq5_OkeH1x4YgSv6uw0HLb5c-5NOXnzQPJHsDvb=NmEePB-A@mail.gmail.com>
 <e5781df5-5244-465e-b986-c1802e1262db@gmail.com>
 <0df75ff4-ece5-4eaa-93bd-6f03ec31ecfa@amd.com>
 <bfaaad63-a5d7-4ceb-8e1c-d541f76f4037@amd.com>
From: "Khatri, Sunil" <sukhatri@amd.com>
In-Reply-To: <bfaaad63-a5d7-4ceb-8e1c-d541f76f4037@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2P287CA0015.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:21b::14) To PH7PR12MB5596.namprd12.prod.outlook.com
 (2603:10b6:510:136::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5596:EE_|SN7PR12MB8170:EE_
X-MS-Office365-Filtering-Correlation-Id: 150473e8-8a15-4bfe-6eb0-08dc3df76e43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qNZmEXSAruoZsTqQ2FCi9evosCb7PIYUaDT1wg4rOEsCttO7RjRe0XXmYEKBnTLBqKA08/zk/X7iyA67/2JuefJ6tUfW/5/ugj6Z35moFTKAaMRSdIIrC9JmpIExRPYiBSHCPYO0XBBAmLcpMHMgIpsEeqYEsK97/wM7EQBBkHBKamW6ATsegJdc23tufUbC2tYpABZRztEP4hfSc2cPxC9TLs5HrNU80+kbuRdjnnG7Xp1UpWbmBl83vRj3anu+wZ83xnoz/yI1qCNrrUI9hViIEiKHlvyBJBln4FCb3x0bWAukQ/Alo6IhkUg1t+pw3OvirQLgHBug0M6rzcSUatILVgSBHfCzxow4mQA0/yHv7DUvol2OM49KxnaLkb1JnvqiPYQUz/4xT9t4vtIZ650ElEDU0Akq30PbLnxceGKEyVM08l9erBAwgY89HmoEzljGwPGuFiFXuXJ23ZQ6HBIehjrTiD4KMzU12ZBLyMZMZc06TaE8yt8XeahKjqtJnkQeCpz7x5eUYKVa1CAv7E2aN84X+FwE9dBHsDdhTYvl8X+fOuPz0QruvxxPmjMC1QHx3+R0bih2C1jYbcSRUCMXoqVOvZJemsbM8b7noDz+bEflKfWpTZ6+CpLVGji1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5596.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aXk5TUNDZGtUWEdMOCs1SjF4L3Z1empEMk9wSVpqV0Fza01VcVNmcllMeFph?=
 =?utf-8?B?cEZtdDBJT0V4RmROc3MvbHBCREhZT1FzUVp6N1FRZTZGcmpZSnZ5MkpJVGp0?=
 =?utf-8?B?cjdQYzllcWNVREp6YkVwWHJFU2ZFQjNzY2NSNlN2SWhZVjNSSlBrK0ErT3hn?=
 =?utf-8?B?WkdwNGNGaEhKVnB4UUtGZFhCOEw4WVFYTnMvemx1dFFFSzAvaGVVRFZ2cmRp?=
 =?utf-8?B?bnVIR0dsVVg5Q1hFSlNlRnZrVTZnZUIwWUxJTjNTRVRHRmZMRjRvUy9raUJH?=
 =?utf-8?B?d2ZRKzA3N1VFWE5WZEJNWGR3K0tRa1RNZWlvUVgzWU9ZdlVuUUhSZFozV2l3?=
 =?utf-8?B?UmpIQmwwRnhNcTRQK2lUazFpTDV2UUlkaVl3cmhsQ29YdVJ2NDhuNnhjK0pn?=
 =?utf-8?B?ZVhEdWNuRG4rSFF6dGVTb0UvMTVtM2l2Q0JlUGVHL1hGQnhmdEkyWE9kdG53?=
 =?utf-8?B?RjNzQnRmL3BRUFZUV1F3RUlhK011YVhkcDVIZFYxMzhyVW0rZmNMTEdjaGhk?=
 =?utf-8?B?MWZ6QUNWUU53RTNEYjRUMUJzV2IvQ254MmF0TmJVSm5qeExkUTZQREt1L1Jj?=
 =?utf-8?B?cnVPS2FFRWo2TmZmUVkvR2tVVzZyOEI2bnVYZ1JYdVp1dHk4amcvNmpqeita?=
 =?utf-8?B?bHpQcUtvWWUvd2dmWGYwem9TWVRQNVlwd2hKaFB5RFpYYW1MLzQ1WXBMZkRj?=
 =?utf-8?B?dWMvU00xcmRPZHQyYll1NmVWZ3hLY1hJZjRwT0lwdjJNOTJ0NjJMKzA1U3Jy?=
 =?utf-8?B?L2VqV0R2aUFTcUhhbFRaRklmU2paUndzZEQxTlZkTy84bUhRTjdzb3JocDBE?=
 =?utf-8?B?Sjk4MEJyaTZMamJuS2ZGS2tpeEhhRFRjMXJpWUk2UFhJaFpyT0lLNlltU0sv?=
 =?utf-8?B?THRkTllKUzJXVXRVU24xeDBVd21sSExzRThDNjNwZmRKNVl1OFIzS3FMYzFH?=
 =?utf-8?B?SDhMR2w2WkkwZGdDNkFOdCt2dkhpTVozZEVBa1BkYzc1SDRzdXYzU2VDL3Jz?=
 =?utf-8?B?M0cwenMvNGNXdFA5anQ3NkVhU2ppMkFYbklYT1pmWUJkZXRmZ3NpQit2UVNE?=
 =?utf-8?B?dDUvZXV5OUxyKytoNmdVdUtoWEI4Q3ZxbDUxYldwY1hjV1c3amc0c3h5a21h?=
 =?utf-8?B?VG4vZHZkNm92WUgwbVl5ZXBpdVE2RCtLTUhPUjhJSHdEUlFZWFJvQ0NjeTBP?=
 =?utf-8?B?TTFsQXBNSzlHeDNUQmlTaE5TcmU1Z1VNV2VmWFZ3YXdRSW9CTXdIaWNLZmhQ?=
 =?utf-8?B?cnVVSXFML3EzaVZtakFYRWs0dkZrTjY0TEFsSXZIOExiYzhXY000Mmd4QjE5?=
 =?utf-8?B?KzZxbjNNUmxyRlZ0c0pmRUhhaWR0WnhGMkdLSVExdkxMMG5kV1hzNFU3cFNJ?=
 =?utf-8?B?NThHYnBWUlIwUTlzZzRlZlpXemowQmErT0lZaC9zTjBmRE5JS3JkanE5d1Bm?=
 =?utf-8?B?OURnNDhLUmtaaSt4aDVBSEpLQUoxUTd2VjVoNEU2d2QxYUExR0krcnFQcXFQ?=
 =?utf-8?B?MWJvWGhhNnVVWVNMSkxxMEhHZUQxS2szSlhsWU9pYjRQVHhRUjVwcUMrWExs?=
 =?utf-8?B?Sm42Z3ZUbTRqVlJKbU5Ld3FiMlhnWWhGRmVGcVpnV21IczdjK2hRVTRmSmha?=
 =?utf-8?B?Z3lDN2FpQlE5OVd1cXhsdWlLeC82UW5uTnJ5TzJpeExGSEo4OFZtanNEWUo3?=
 =?utf-8?B?MG1HdmxnZEVvR0xZeGNucXVWVWFEeEVCZ3J6WHpjb2xYbG40T1pqMlg5RDhJ?=
 =?utf-8?B?V3UxbnJPNGRnMGxmYzFkT2FvWVBjVDdpOU4xM3J6OTd6N1VHYUFFc1FDYmJN?=
 =?utf-8?B?aDFOeS9JZnRVNnd4UkRUZ1ZXNHF6MGlWR21NalI0T1dMcnpVVXNpSHhtV3V2?=
 =?utf-8?B?Y0RBaTd2aVE2Q2pmMUFDWFpFVUlZSWZSWFpBZWdpL0poL1MwNUhneGdYamg3?=
 =?utf-8?B?U3NOajI0YzRJa1dpNDZKamg3TVpOUUZ0YjBxUk11U0Yra1c4UTY5Y2hmbk5k?=
 =?utf-8?B?NHFhWXcwUWFjc2w2YkpZZ2lXb1JZN09EV2p6dnppeU8yZXh4bWZNc0NSN3Q1?=
 =?utf-8?B?aEtNVXhJeU5FOHJsTVBZUUlkQk9USllXODRQL2FwRkhLL0daYTRxZjFYYlFm?=
 =?utf-8?Q?QqMxPOId3QWbM1jcXxgNtA0Dd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 150473e8-8a15-4bfe-6eb0-08dc3df76e43
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5596.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2024 16:06:49.9358 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jyXjhl85zk3t2ypzHcTOK8kBFPJT1Dkj/5P+RzRxpZcOfeLWwR+O3ocVOC57Ky11srEgdTv+GGLfzlOMJ48EOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8170
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


On 3/6/2024 9:07 PM, Christian König wrote:
> Am 06.03.24 um 16:13 schrieb Khatri, Sunil:
>>
>> On 3/6/2024 8:34 PM, Christian König wrote:
>>> Am 06.03.24 um 15:29 schrieb Alex Deucher:
>>>> On Wed, Mar 6, 2024 at 8:04 AM Khatri, Sunil <sukhatri@amd.com> wrote:
>>>>>
>>>>> On 3/6/2024 6:12 PM, Christian König wrote:
>>>>>> Am 06.03.24 um 11:40 schrieb Khatri, Sunil:
>>>>>>> On 3/6/2024 3:37 PM, Christian König wrote:
>>>>>>>> Am 06.03.24 um 10:04 schrieb Sunil Khatri:
>>>>>>>>> When an  page fault interrupt is raised there
>>>>>>>>> is a lot more information that is useful for
>>>>>>>>> developers to analyse the pagefault.
>>>>>>>> Well actually those information are not that interesting because
>>>>>>>> they are hw generation specific.
>>>>>>>>
>>>>>>>> You should probably rather use the decoded strings here, e.g. hub,
>>>>>>>> client, xcc_id, node_id etc...
>>>>>>>>
>>>>>>>> See gmc_v9_0_process_interrupt() an example.
>>>>>>>> I saw this v9 does provide more information than what v10 and v11
>>>>>>>> provide like node_id and fault from which die but thats again very
>>>>>>>> specific to IP_VERSION(9, 4, 3)) i dont know why thats information
>>>>>>>> is not there in v10 and v11.
>>>>>>> I agree to your point but, as of now during a pagefault we are
>>>>>>> dumping this information which is useful like which client
>>>>>>> has generated an interrupt and for which src and other information
>>>>>>> like address. So i think to provide the similar information in the
>>>>>>> devcoredump.
>>>>>>>
>>>>>>> Currently we do not have all this information from either job or vm
>>>>>>> being derived from the job during a reset. We surely could add more
>>>>>>> relevant information later on as per request but this 
>>>>>>> information is
>>>>>>> useful as
>>>>>>> eventually its developers only who would use the dump file provided
>>>>>>> by customer to debug.
>>>>>>>
>>>>>>> Below is the information that i dump in devcore and i feel that is
>>>>>>> good information but new information could be added which could be
>>>>>>> picked later.
>>>>>>>
>>>>>>>> Page fault information
>>>>>>>> [gfxhub] page fault (src_id:0 ring:24 vmid:3 pasid:32773)
>>>>>>>> in page starting at address 0x0000000000000000 from client 0x1b 
>>>>>>>> (UTCL2)
>>>>>> This is a perfect example what I mean. You record in the patch is 
>>>>>> the
>>>>>> client_id, but this is is basically meaningless unless you have 
>>>>>> access
>>>>>> to the AMD internal hw documentation.
>>>>>>
>>>>>> What you really need is the client in decoded form, in this case
>>>>>> UTCL2. You can keep the client_id additionally, but the decoded 
>>>>>> client
>>>>>> string is mandatory to have I think.
>>>>>>
>>>>>> Sure i am capturing that information as i am trying to minimise the
>>>>>> memory interaction to minimum as we are still in interrupt context
>>>>>> here that why i recorded the integer information compared to 
>>>>>> decoding
>>>>> and writing strings there itself but to postpone till we dump.
>>>>>
>>>>> Like decoding to the gfxhub/mmhub based on vmhub/vmid_src and client
>>>>> string from client id. So are we good to go with the information with
>>>>> the above information of sharing details in devcoredump using the
>>>>> additional information from pagefault cached.
>>>> I think amdgpu_vm_fault_info() has everything you need already (vmhub,
>>>> status, and addr).  client_id and src_id are just tokens in the
>>>> interrupt cookie so we know which IP to route the interrupt to. We
>>>> know what they will be because otherwise we'd be in the interrupt
>>>> handler for a different IP.  I don't think ring_id has any useful
>>>> information in this context and vmid and pasid are probably not too
>>>> useful because they are just tokens to associate the fault with a
>>>> process.  It would be better to have the process name.
>>
>> Just to share context here Alex, i am preparing this for devcoredump, 
>> my intention was to replicate the information which in KMD we are 
>> sharing in Dmesg for page faults. If assuming we do not add client id 
>> specially we would not be able to share enough information in 
>> devcoredump.
>> It would be just address and hub(gfxhub/mmhub) and i think that is 
>> partial information as src id and client id and ip block shares good 
>> information.
>>
>> For process related information we are capturing that information 
>> part of dump from existing functionality.
>> **** AMDGPU Device Coredump ****
>> version: 1
>> kernel: 6.7.0-amd-staging-drm-next
>> module: amdgpu
>> time: 45.084775181
>> process_name: soft_recovery_p PID: 1780
>>
>> Ring timed out details
>> IP Type: 0 Ring Name: gfx_0.0.0
>>
>> Page fault information
>> [gfxhub] page fault (src_id:0 ring:24 vmid:3 pasid:32773)
>> in page starting at address 0x0000000000000000 from client 0x1b (UTCL2)
>> VRAM is lost due to GPU reset!
>>
>> Regards
>> Sunil
>>
>>>
>>> The decoded client name would be really useful I think since the 
>>> fault handled is a catch all and handles a whole bunch of different 
>>> clients.
>>>
>>> But that should be ideally passed in as const string instead of the 
>>> hw generation specific client_id.
>>>
>>> As long as it's only a pointer we also don't run into the trouble 
>>> that we need to allocate memory for it.
>>
>> I agree but i prefer adding the client id and decoding it in 
>> devcorecump using soc15_ih_clientid_name[fault_info->client_id]) is 
>> better else we have to do an sprintf this string to fault_info in irq 
>> context which is writing more bytes to memory i guess compared to an 
>> integer:)
>
> Well I totally agree that we shouldn't fiddle to much in the interrupt 
> handler, but exactly what you suggest here won't work.
>
> The client_id is hw generation specific, so the only one who has that 
> is the hw generation specific fault handler. Just compare the defines 
> here:
>
> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c#L83 
>
>
> and here:
>
> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/amd/amdgpu/gfxhub_v11_5_0.c#L38 
>
>
Got your point. Let me see but this is a lot of work in irq context. 
Either we can drop totally the client id thing as alex is suggesting 
here as its always be same client and src id or let me come up with a 
patch and see if its acceptable.

Also as Alex pointed we need to decode from status register which kind 
of page fault it is (permission, read, write etc) this all is again 
family specific and thats all in IRQ context. Not feeling good about it 
but let me try to share all that in a new patch.

Regards
Sunil.

> Regards,
> Christian.
>
>>
>> We can argue on values like pasid and vmid and ring id to be taken 
>> off if they are totally not useful.
>>
>> Regards
>> Sunil
>>
>>>
>>> Christian.
>>>
>>>>
>>>> Alex
>>>>
>>>>> regards
>>>>> sunil
>>>>>
>>>>>> Regards,
>>>>>> Christian.
>>>>>>
>>>>>>> Regards
>>>>>>> Sunil Khatri
>>>>>>>
>>>>>>>> Regards,
>>>>>>>> Christian.
>>>>>>>>
>>>>>>>>> Add all such information in the last cached
>>>>>>>>> pagefault from an interrupt handler.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
>>>>>>>>> ---
>>>>>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 9 +++++++--
>>>>>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h | 7 ++++++-
>>>>>>>>>    drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c | 2 +-
>>>>>>>>>    drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c | 2 +-
>>>>>>>>>    drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c  | 2 +-
>>>>>>>>>    drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c  | 2 +-
>>>>>>>>>    drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c  | 2 +-
>>>>>>>>>    7 files changed, 18 insertions(+), 8 deletions(-)
>>>>>>>>>
>>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>>>>>>>> index 4299ce386322..b77e8e28769d 100644
>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>>>>>>>> @@ -2905,7 +2905,7 @@ void amdgpu_debugfs_vm_bo_info(struct
>>>>>>>>> amdgpu_vm *vm, struct seq_file *m)
>>>>>>>>>     * Cache the fault info for later use by userspace in 
>>>>>>>>> debugging.
>>>>>>>>>     */
>>>>>>>>>    void amdgpu_vm_update_fault_cache(struct amdgpu_device *adev,
>>>>>>>>> -                  unsigned int pasid,
>>>>>>>>> +                  struct amdgpu_iv_entry *entry,
>>>>>>>>>                      uint64_t addr,
>>>>>>>>>                      uint32_t status,
>>>>>>>>>                      unsigned int vmhub)
>>>>>>>>> @@ -2915,7 +2915,7 @@ void amdgpu_vm_update_fault_cache(struct
>>>>>>>>> amdgpu_device *adev,
>>>>>>>>> xa_lock_irqsave(&adev->vm_manager.pasids, flags);
>>>>>>>>>    -    vm = xa_load(&adev->vm_manager.pasids, pasid);
>>>>>>>>> +    vm = xa_load(&adev->vm_manager.pasids, entry->pasid);
>>>>>>>>>        /* Don't update the fault cache if status is 0.  In the 
>>>>>>>>> multiple
>>>>>>>>>         * fault case, subsequent faults will return a 0 status 
>>>>>>>>> which is
>>>>>>>>>         * useless for userspace and replaces the useful fault
>>>>>>>>> status, so
>>>>>>>>> @@ -2924,6 +2924,11 @@ void amdgpu_vm_update_fault_cache(struct
>>>>>>>>> amdgpu_device *adev,
>>>>>>>>>        if (vm && status) {
>>>>>>>>>            vm->fault_info.addr = addr;
>>>>>>>>>            vm->fault_info.status = status;
>>>>>>>>> +        vm->fault_info.client_id = entry->client_id;
>>>>>>>>> +        vm->fault_info.src_id = entry->src_id;
>>>>>>>>> +        vm->fault_info.vmid = entry->vmid;
>>>>>>>>> +        vm->fault_info.pasid = entry->pasid;
>>>>>>>>> +        vm->fault_info.ring_id = entry->ring_id;
>>>>>>>>>            if (AMDGPU_IS_GFXHUB(vmhub)) {
>>>>>>>>>                vm->fault_info.vmhub = AMDGPU_VMHUB_TYPE_GFX;
>>>>>>>>>                vm->fault_info.vmhub |=
>>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>>>>>>>>> index 047ec1930d12..c7782a89bdb5 100644
>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>>>>>>>>> @@ -286,6 +286,11 @@ struct amdgpu_vm_fault_info {
>>>>>>>>>        uint32_t    status;
>>>>>>>>>        /* which vmhub? gfxhub, mmhub, etc. */
>>>>>>>>>        unsigned int    vmhub;
>>>>>>>>> +    unsigned int    client_id;
>>>>>>>>> +    unsigned int    src_id;
>>>>>>>>> +    unsigned int    ring_id;
>>>>>>>>> +    unsigned int    pasid;
>>>>>>>>> +    unsigned int    vmid;
>>>>>>>>>    };
>>>>>>>>>      struct amdgpu_vm {
>>>>>>>>> @@ -605,7 +610,7 @@ static inline void
>>>>>>>>> amdgpu_vm_eviction_unlock(struct amdgpu_vm *vm)
>>>>>>>>>    }
>>>>>>>>>      void amdgpu_vm_update_fault_cache(struct amdgpu_device 
>>>>>>>>> *adev,
>>>>>>>>> -                  unsigned int pasid,
>>>>>>>>> +                  struct amdgpu_iv_entry *entry,
>>>>>>>>>                      uint64_t addr,
>>>>>>>>>                      uint32_t status,
>>>>>>>>>                      unsigned int vmhub);
>>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
>>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
>>>>>>>>> index d933e19e0cf5..6b177ce8db0e 100644
>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
>>>>>>>>> @@ -150,7 +150,7 @@ static int gmc_v10_0_process_interrupt(struct
>>>>>>>>> amdgpu_device *adev,
>>>>>>>>>            status = RREG32(hub->vm_l2_pro_fault_status);
>>>>>>>>>            WREG32_P(hub->vm_l2_pro_fault_cntl, 1, ~1);
>>>>>>>>>    -        amdgpu_vm_update_fault_cache(adev, entry->pasid, 
>>>>>>>>> addr,
>>>>>>>>> status,
>>>>>>>>> +        amdgpu_vm_update_fault_cache(adev, entry, addr, status,
>>>>>>>>>                             entry->vmid_src ? AMDGPU_MMHUB0(0) :
>>>>>>>>> AMDGPU_GFXHUB(0));
>>>>>>>>>        }
>>>>>>>>>    diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
>>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
>>>>>>>>> index 527dc917e049..bcf254856a3e 100644
>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
>>>>>>>>> @@ -121,7 +121,7 @@ static int gmc_v11_0_process_interrupt(struct
>>>>>>>>> amdgpu_device *adev,
>>>>>>>>>            status = RREG32(hub->vm_l2_pro_fault_status);
>>>>>>>>>            WREG32_P(hub->vm_l2_pro_fault_cntl, 1, ~1);
>>>>>>>>>    -        amdgpu_vm_update_fault_cache(adev, entry->pasid, 
>>>>>>>>> addr,
>>>>>>>>> status,
>>>>>>>>> +        amdgpu_vm_update_fault_cache(adev, entry, addr, status,
>>>>>>>>>                             entry->vmid_src ? AMDGPU_MMHUB0(0) :
>>>>>>>>> AMDGPU_GFXHUB(0));
>>>>>>>>>        }
>>>>>>>>>    diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
>>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
>>>>>>>>> index 3da7b6a2b00d..e9517ebbe1fd 100644
>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
>>>>>>>>> @@ -1270,7 +1270,7 @@ static int 
>>>>>>>>> gmc_v7_0_process_interrupt(struct
>>>>>>>>> amdgpu_device *adev,
>>>>>>>>>        if (!addr && !status)
>>>>>>>>>            return 0;
>>>>>>>>>    -    amdgpu_vm_update_fault_cache(adev, entry->pasid,
>>>>>>>>> +    amdgpu_vm_update_fault_cache(adev, entry,
>>>>>>>>>                         ((u64)addr) << AMDGPU_GPU_PAGE_SHIFT,
>>>>>>>>> status, AMDGPU_GFXHUB(0));
>>>>>>>>>          if (amdgpu_vm_fault_stop == AMDGPU_VM_FAULT_STOP_FIRST)
>>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
>>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
>>>>>>>>> index d20e5f20ee31..a271bf832312 100644
>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
>>>>>>>>> @@ -1438,7 +1438,7 @@ static int 
>>>>>>>>> gmc_v8_0_process_interrupt(struct
>>>>>>>>> amdgpu_device *adev,
>>>>>>>>>        if (!addr && !status)
>>>>>>>>>            return 0;
>>>>>>>>>    -    amdgpu_vm_update_fault_cache(adev, entry->pasid,
>>>>>>>>> +    amdgpu_vm_update_fault_cache(adev, entry,
>>>>>>>>>                         ((u64)addr) << AMDGPU_GPU_PAGE_SHIFT,
>>>>>>>>> status, AMDGPU_GFXHUB(0));
>>>>>>>>>          if (amdgpu_vm_fault_stop == AMDGPU_VM_FAULT_STOP_FIRST)
>>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
>>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
>>>>>>>>> index 47b63a4ce68b..dc9fb1fb9540 100644
>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
>>>>>>>>> @@ -666,7 +666,7 @@ static int gmc_v9_0_process_interrupt(struct
>>>>>>>>> amdgpu_device *adev,
>>>>>>>>>        rw = REG_GET_FIELD(status, 
>>>>>>>>> VM_L2_PROTECTION_FAULT_STATUS, RW);
>>>>>>>>>        WREG32_P(hub->vm_l2_pro_fault_cntl, 1, ~1);
>>>>>>>>>    -    amdgpu_vm_update_fault_cache(adev, entry->pasid, addr,
>>>>>>>>> status, vmhub);
>>>>>>>>> +    amdgpu_vm_update_fault_cache(adev, entry, addr, status, 
>>>>>>>>> vmhub);
>>>>>>>>>          dev_err(adev->dev,
>>>>>>>>> "VM_L2_PROTECTION_FAULT_STATUS:0x%08X\n",
>>>
>
