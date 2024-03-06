Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF89873AD8
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 16:38:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D6791132BA;
	Wed,  6 Mar 2024 15:37:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="3z22kt0M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2053.outbound.protection.outlook.com [40.107.244.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E67451132B8;
 Wed,  6 Mar 2024 15:37:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wnbq0BrN9UC6M/5W+WijpV+f3xg/a/oO0ZklrNwvNow5Xto43es3hZFAsYmqq0Xlpmxfa2fnWmsRM8G8PwWDPs4FWJ9sFPQ1e1Rf+5dnk8G591KwZIk49OxaiSU81WOkyxSJ/HVMyuIhG4X/Kv7AU5ZHVU5geLqLzYwJHf/y4fbrtvuFeK4B2lFNyT9H6xgyRg9/QmzWuTHtwU9814f8W+XVjNzgiaVLmV0i8QgwY0Xpv1kliv6Xiu5/Bp6PunUluWl0MxOeHAHgBFo/zw+BjFjq1IFg+l1cJ1iBvUYvUoM01AhfTGxFavzOF8GFktAHq6osZrpIOYLFBhyp7sOuUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xsbk+quWOLIqAQC46eF/y4Qngy/d7KeIAoHORAfY5Z8=;
 b=ilGQy3eJQuA0QSyYp593OxEknQuDwvNpFsAIG8DE92VS7eM2pySkZg9Vc9zOLBf4oXQYqDSLsldkuNKXeImQuffk/UrobZCaUFuWBqfKU6PIqJ26MsmncoSNi1lOZgS4LX42fccBNdjXzL/VUOGQV5F7mIy4tNbskumpGiFYAr4KnpFpTkiL7Bcpn58jBNBGfDt/nZfghdAON6JpDWYiM3SK3b6VSsqylfZswyblwnzANdbLxJVrlCjQxyjjWYjHO9RVEhTpZxS+DKkJBA5zO3kBwjFOiBFQetfdnYZZDkM9iBXRiPK9W4rA6aLWY77dVT2cbFZLtMF37ynhxtbptg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xsbk+quWOLIqAQC46eF/y4Qngy/d7KeIAoHORAfY5Z8=;
 b=3z22kt0M0jS8kmxzC1TUaMDy3vDLLUCE7AkghXBEDBJMwxnbs8XoDTJW7B/kUxicbAvZXYnW7tOWVxc6W8/EYtGrbPfsCBGaiEJ4X3yRcgmVsIevlN1Uq3QWm1ZIiyry24Hkks6eC/OGtUfNFek8RG2OiYDaGh1Cq+nMyFZVTm0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CYYPR12MB8871.namprd12.prod.outlook.com (2603:10b6:930:c2::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.39; Wed, 6 Mar
 2024 15:37:54 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a%6]) with mapi id 15.20.7339.031; Wed, 6 Mar 2024
 15:37:54 +0000
Message-ID: <bfaaad63-a5d7-4ceb-8e1c-d541f76f4037@amd.com>
Date: Wed, 6 Mar 2024 16:37:48 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: cache in more vm fault information
Content-Language: en-US
To: "Khatri, Sunil" <sukhatri@amd.com>,
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
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <0df75ff4-ece5-4eaa-93bd-6f03ec31ecfa@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0047.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::10) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CYYPR12MB8871:EE_
X-MS-Office365-Filtering-Correlation-Id: 78234f6a-710d-4702-3eba-08dc3df363fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4JuunwlJMpx315aG7NU4BhvEWfJQ4ks5oWtV1RlP3lTkYOmgHigupkLd+iQ2xp/2Vw9SWsF0sCGfec14qcRg8B1s0yvEEsyn12sLKnsIhjRjHxMzpiwCqZpTbWq87+B760REAXM/WtDBbL9B/ya1zuXvqbEIiRW0URyetyeFLmGLZ3PJtBlf14tOfsf5nbs8lG0G/mqk6s9t+A9/mEo1RGOM02ujb+hUhyqzFpOc12kcu6DSa9BMuMBT+DTkiAgOiEYXaMXbT9p/obI4VWilME3McnmasQdMtYM9mRvfkWNQCObAJCcz7gvTvCXEqZLJKdTk3fBcgIqwEibzqJH03gBKSkumbFzFKUbuyE+W3GOeyi0de+evf49aH50F6ZKkL/Nd+Xk6ojBmTipXsTdA1qoY+tzX3M8ZoPKzcuLewBeKyaRO2/l6016I6tBugmPcdNuetDETeTOnJ88foO1pliMKCwFbKaaPqi8sH92pJCs9jT+tg28S7eGmO05M4UGeDyAdUSF5FSy+sxM/PhtclxT3qoRj3Sc4iGpPBqpv0TdSqkyhPbElXwg+P7npN0DDDNcw/uNPwG0ONZkl8UbHb/UhCZ99uuY8s1eM9GD0PRWmQGBvNjZ2xmDvEzNPSnEW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MEEwZi8xeEROZkRNSkEyemU1em1tNXBpdXc2VjNZYUFSei92SXdHbHY5alo0?=
 =?utf-8?B?dm1FaHd2M3J1a3JMQXFGMHBzR0VmandRRFNXMUNTTlQ3TnRUNjJOY1ZBMmp6?=
 =?utf-8?B?MFpOWVNZTmFyZXlkVVl2L2pYbTdPcEdYaU1Jb2xHaDVFT3pUQzVndGc0VS96?=
 =?utf-8?B?Q1FsazVGT0llQzhGNTM0TDNGak1UaFVjbWhKSmQ4T0I0NXllVEgxM050ajR5?=
 =?utf-8?B?bGlZZVBtZ0RwR3JTREphV0JvcDBmVUt2NXNiWVN4c09MSDVtdHlTZUNzMXlz?=
 =?utf-8?B?cGV0aWRvNkl5S1RlMFgwSUJ0aGl5dTV1alJZOVBKbnpjeVIvZXlrRGFNdGg2?=
 =?utf-8?B?bUFTN3FCeldld2xjR0w3RFF2Y1BqZkVISjl4V3JTNnp3cks0VDZ1bkpxUkNZ?=
 =?utf-8?B?cG5Ybys0Q0k0QW9hYThMaFVTRW5qUkJuSndqemlDU29UWnFSUHRkV29zSk9K?=
 =?utf-8?B?dnlDendTaWd1bTRrSVhqQ21QQUUxaGhvbDc1UnFNd0FTb2Y3WGNqN3pNQmxy?=
 =?utf-8?B?RjJFV2gwV1hzZEwzNVU4M3BSTGxlQWNvTklYL3lGUFBtRi94WW4waG9uZEl3?=
 =?utf-8?B?V3h2RmJodTU1UEkzNHhJdUVSN00xWXA1ZWFNQmcrb3pKcnY5dUJDc093WXBS?=
 =?utf-8?B?MHFQZTIzb253cGhCZlV5clA1T1ZBQVlFbG43UnFyK2VxSDRua3dGbEVteENN?=
 =?utf-8?B?eEpJTXQvdXlTODlNa2s4aUFiQmFlU01xMWxTRjlGMmk3NHd2TUJGYXhxcXJK?=
 =?utf-8?B?bUNFdGcwdy9wOFlDTXdxbnNoM2hTTHM2U2JpY3BVWm9nN2FNL1Nnd3RzMTEr?=
 =?utf-8?B?OE92bTBRK2taaFVVa3NwdXIrc2phT3BKMXQ5dndNKzFlWEtYcldtajdVcVBt?=
 =?utf-8?B?K2J2Q2pVdFIwNitiTDhOcWc2T1RIYTBsc3FCTkdzeHZRSTk1dWorRTBoQ3ZK?=
 =?utf-8?B?MjJyVUduaGdqTXMxbWhVb0w0ZWxPK3NLTlBxM29kUlZGKy83R0RIQUdGQzJH?=
 =?utf-8?B?bWV1Rk5Zd3loeHlJemxFUTNEU0p6eFpocFhjbkdOc0xGR3pTVG0vUEVNWHVz?=
 =?utf-8?B?a1Z2b0dTMXZCbTREWUVFZDNNRFpIZHIvU1AvZS9YTVNLQjlaVzdHNExMdkx5?=
 =?utf-8?B?M2plem55RkdxNWowVW5MenVUeHYzMUtybzJCbHFGa2NOYlNReFFHU2J6Tkc2?=
 =?utf-8?B?R255SzVQK2xVZ0dJZnJub2xCV1pvS1VoWWFwZ2lkSmxMRWpXUWt5LzZ1cnZo?=
 =?utf-8?B?bWVlRkp3NU1VdHdUYVBTaHViYklwTjZycDhnVm4vVGtEZ0dvR0dBUW52cmQz?=
 =?utf-8?B?UElnb3NCTGc2c1VBVDdRV3FNZnVOU2syRWlSamh5cmd4T0RZN0dWeU5wUlBI?=
 =?utf-8?B?cjFMZE1paDE2SDZOUDQwWCtNc1A2bmJVQkpvaFVLSFBKamdQRnozT3orODlT?=
 =?utf-8?B?TWVCaFl3ZDVqczA0TWJFd0hJVXZWa1dWYkNOOWZmSFVXTjI3emlIY05uc3cx?=
 =?utf-8?B?SmpMRFhhU3ljTGRKNDVxNVRsbG9pMjI2REdyaVRJSU9GVWFieU5VSnd1S0Rk?=
 =?utf-8?B?RVZqU251S3haMWlia28vU2dxcG52Sld4YVpOMWUwUXhxYVFQbUxtNHNOUkxC?=
 =?utf-8?B?U1VDRkZua3VGQ3cwM2hxV1BJeHlLcmJPYXFSeHo5RmtjUXZER1lLRDBiQlpo?=
 =?utf-8?B?M1NnajNPc1V0bm9wUW8zVDdwKy9sMldRWE4rc2o5Sy9XdkI2Wm1zcHEyTldC?=
 =?utf-8?B?cWpQd3g4emVaajZFTGNmK2owcEhSYUpjclA5UlpKUWc1Sjl1dnMrUU1XMVlZ?=
 =?utf-8?B?RHRiOU1vV3FNK0g5S1Q1SGZnU1BmYlpzd1RjU2FCeE81WmdqSk1FODc2RHlz?=
 =?utf-8?B?QzVhRkZ5Z093UFpwYkRoVDVWRzlsRFpmZHZONCtUZVRCWmtyeC9TU0lOVVVm?=
 =?utf-8?B?TmoyYjVLdG9oOFU0cmVKd2xTNjQzQWpPeVo1dWV0SXN5djk1Y0lnU3NLZ3I2?=
 =?utf-8?B?ZGtlamhaajBuaWpyRi81ZjJnK1FBWlo2Q2lLMnpXTkJaZlNCaEVaQUZqeFdQ?=
 =?utf-8?B?c1BNVVNCOUxyOVJraWwzdkpoNkpJUkNDeUwvUVpBNFpiUmRscExWR2p1YjJl?=
 =?utf-8?Q?SkEQ=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78234f6a-710d-4702-3eba-08dc3df363fd
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2024 15:37:54.6606 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iXmEBDRXGghkWWPJtQSPHAPs72iYN59JuAgKBAyZxeFAcWyo83lzR/TjTbgvM35p
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8871
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

Am 06.03.24 um 16:13 schrieb Khatri, Sunil:
>
> On 3/6/2024 8:34 PM, Christian König wrote:
>> Am 06.03.24 um 15:29 schrieb Alex Deucher:
>>> On Wed, Mar 6, 2024 at 8:04 AM Khatri, Sunil <sukhatri@amd.com> wrote:
>>>>
>>>> On 3/6/2024 6:12 PM, Christian König wrote:
>>>>> Am 06.03.24 um 11:40 schrieb Khatri, Sunil:
>>>>>> On 3/6/2024 3:37 PM, Christian König wrote:
>>>>>>> Am 06.03.24 um 10:04 schrieb Sunil Khatri:
>>>>>>>> When an  page fault interrupt is raised there
>>>>>>>> is a lot more information that is useful for
>>>>>>>> developers to analyse the pagefault.
>>>>>>> Well actually those information are not that interesting because
>>>>>>> they are hw generation specific.
>>>>>>>
>>>>>>> You should probably rather use the decoded strings here, e.g. hub,
>>>>>>> client, xcc_id, node_id etc...
>>>>>>>
>>>>>>> See gmc_v9_0_process_interrupt() an example.
>>>>>>> I saw this v9 does provide more information than what v10 and v11
>>>>>>> provide like node_id and fault from which die but thats again very
>>>>>>> specific to IP_VERSION(9, 4, 3)) i dont know why thats information
>>>>>>> is not there in v10 and v11.
>>>>>> I agree to your point but, as of now during a pagefault we are
>>>>>> dumping this information which is useful like which client
>>>>>> has generated an interrupt and for which src and other information
>>>>>> like address. So i think to provide the similar information in the
>>>>>> devcoredump.
>>>>>>
>>>>>> Currently we do not have all this information from either job or vm
>>>>>> being derived from the job during a reset. We surely could add more
>>>>>> relevant information later on as per request but this information is
>>>>>> useful as
>>>>>> eventually its developers only who would use the dump file provided
>>>>>> by customer to debug.
>>>>>>
>>>>>> Below is the information that i dump in devcore and i feel that is
>>>>>> good information but new information could be added which could be
>>>>>> picked later.
>>>>>>
>>>>>>> Page fault information
>>>>>>> [gfxhub] page fault (src_id:0 ring:24 vmid:3 pasid:32773)
>>>>>>> in page starting at address 0x0000000000000000 from client 0x1b 
>>>>>>> (UTCL2)
>>>>> This is a perfect example what I mean. You record in the patch is the
>>>>> client_id, but this is is basically meaningless unless you have 
>>>>> access
>>>>> to the AMD internal hw documentation.
>>>>>
>>>>> What you really need is the client in decoded form, in this case
>>>>> UTCL2. You can keep the client_id additionally, but the decoded 
>>>>> client
>>>>> string is mandatory to have I think.
>>>>>
>>>>> Sure i am capturing that information as i am trying to minimise the
>>>>> memory interaction to minimum as we are still in interrupt context
>>>>> here that why i recorded the integer information compared to decoding
>>>> and writing strings there itself but to postpone till we dump.
>>>>
>>>> Like decoding to the gfxhub/mmhub based on vmhub/vmid_src and client
>>>> string from client id. So are we good to go with the information with
>>>> the above information of sharing details in devcoredump using the
>>>> additional information from pagefault cached.
>>> I think amdgpu_vm_fault_info() has everything you need already (vmhub,
>>> status, and addr).  client_id and src_id are just tokens in the
>>> interrupt cookie so we know which IP to route the interrupt to. We
>>> know what they will be because otherwise we'd be in the interrupt
>>> handler for a different IP.  I don't think ring_id has any useful
>>> information in this context and vmid and pasid are probably not too
>>> useful because they are just tokens to associate the fault with a
>>> process.  It would be better to have the process name.
>
> Just to share context here Alex, i am preparing this for devcoredump, 
> my intention was to replicate the information which in KMD we are 
> sharing in Dmesg for page faults. If assuming we do not add client id 
> specially we would not be able to share enough information in 
> devcoredump.
> It would be just address and hub(gfxhub/mmhub) and i think that is 
> partial information as src id and client id and ip block shares good 
> information.
>
> For process related information we are capturing that information part 
> of dump from existing functionality.
> **** AMDGPU Device Coredump ****
> version: 1
> kernel: 6.7.0-amd-staging-drm-next
> module: amdgpu
> time: 45.084775181
> process_name: soft_recovery_p PID: 1780
>
> Ring timed out details
> IP Type: 0 Ring Name: gfx_0.0.0
>
> Page fault information
> [gfxhub] page fault (src_id:0 ring:24 vmid:3 pasid:32773)
> in page starting at address 0x0000000000000000 from client 0x1b (UTCL2)
> VRAM is lost due to GPU reset!
>
> Regards
> Sunil
>
>>
>> The decoded client name would be really useful I think since the 
>> fault handled is a catch all and handles a whole bunch of different 
>> clients.
>>
>> But that should be ideally passed in as const string instead of the 
>> hw generation specific client_id.
>>
>> As long as it's only a pointer we also don't run into the trouble 
>> that we need to allocate memory for it.
>
> I agree but i prefer adding the client id and decoding it in 
> devcorecump using soc15_ih_clientid_name[fault_info->client_id]) is 
> better else we have to do an sprintf this string to fault_info in irq 
> context which is writing more bytes to memory i guess compared to an 
> integer:)

Well I totally agree that we shouldn't fiddle to much in the interrupt 
handler, but exactly what you suggest here won't work.

The client_id is hw generation specific, so the only one who has that is 
the hw generation specific fault handler. Just compare the defines here:

https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c#L83

and here:

https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/amd/amdgpu/gfxhub_v11_5_0.c#L38

Regards,
Christian.

>
> We can argue on values like pasid and vmid and ring id to be taken off 
> if they are totally not useful.
>
> Regards
> Sunil
>
>>
>> Christian.
>>
>>>
>>> Alex
>>>
>>>> regards
>>>> sunil
>>>>
>>>>> Regards,
>>>>> Christian.
>>>>>
>>>>>> Regards
>>>>>> Sunil Khatri
>>>>>>
>>>>>>> Regards,
>>>>>>> Christian.
>>>>>>>
>>>>>>>> Add all such information in the last cached
>>>>>>>> pagefault from an interrupt handler.
>>>>>>>>
>>>>>>>> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
>>>>>>>> ---
>>>>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 9 +++++++--
>>>>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h | 7 ++++++-
>>>>>>>>    drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c | 2 +-
>>>>>>>>    drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c | 2 +-
>>>>>>>>    drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c  | 2 +-
>>>>>>>>    drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c  | 2 +-
>>>>>>>>    drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c  | 2 +-
>>>>>>>>    7 files changed, 18 insertions(+), 8 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>>>>>>> index 4299ce386322..b77e8e28769d 100644
>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>>>>>>> @@ -2905,7 +2905,7 @@ void amdgpu_debugfs_vm_bo_info(struct
>>>>>>>> amdgpu_vm *vm, struct seq_file *m)
>>>>>>>>     * Cache the fault info for later use by userspace in 
>>>>>>>> debugging.
>>>>>>>>     */
>>>>>>>>    void amdgpu_vm_update_fault_cache(struct amdgpu_device *adev,
>>>>>>>> -                  unsigned int pasid,
>>>>>>>> +                  struct amdgpu_iv_entry *entry,
>>>>>>>>                      uint64_t addr,
>>>>>>>>                      uint32_t status,
>>>>>>>>                      unsigned int vmhub)
>>>>>>>> @@ -2915,7 +2915,7 @@ void amdgpu_vm_update_fault_cache(struct
>>>>>>>> amdgpu_device *adev,
>>>>>>>> xa_lock_irqsave(&adev->vm_manager.pasids, flags);
>>>>>>>>    -    vm = xa_load(&adev->vm_manager.pasids, pasid);
>>>>>>>> +    vm = xa_load(&adev->vm_manager.pasids, entry->pasid);
>>>>>>>>        /* Don't update the fault cache if status is 0.  In the 
>>>>>>>> multiple
>>>>>>>>         * fault case, subsequent faults will return a 0 status 
>>>>>>>> which is
>>>>>>>>         * useless for userspace and replaces the useful fault
>>>>>>>> status, so
>>>>>>>> @@ -2924,6 +2924,11 @@ void amdgpu_vm_update_fault_cache(struct
>>>>>>>> amdgpu_device *adev,
>>>>>>>>        if (vm && status) {
>>>>>>>>            vm->fault_info.addr = addr;
>>>>>>>>            vm->fault_info.status = status;
>>>>>>>> +        vm->fault_info.client_id = entry->client_id;
>>>>>>>> +        vm->fault_info.src_id = entry->src_id;
>>>>>>>> +        vm->fault_info.vmid = entry->vmid;
>>>>>>>> +        vm->fault_info.pasid = entry->pasid;
>>>>>>>> +        vm->fault_info.ring_id = entry->ring_id;
>>>>>>>>            if (AMDGPU_IS_GFXHUB(vmhub)) {
>>>>>>>>                vm->fault_info.vmhub = AMDGPU_VMHUB_TYPE_GFX;
>>>>>>>>                vm->fault_info.vmhub |=
>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>>>>>>>> index 047ec1930d12..c7782a89bdb5 100644
>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>>>>>>>> @@ -286,6 +286,11 @@ struct amdgpu_vm_fault_info {
>>>>>>>>        uint32_t    status;
>>>>>>>>        /* which vmhub? gfxhub, mmhub, etc. */
>>>>>>>>        unsigned int    vmhub;
>>>>>>>> +    unsigned int    client_id;
>>>>>>>> +    unsigned int    src_id;
>>>>>>>> +    unsigned int    ring_id;
>>>>>>>> +    unsigned int    pasid;
>>>>>>>> +    unsigned int    vmid;
>>>>>>>>    };
>>>>>>>>      struct amdgpu_vm {
>>>>>>>> @@ -605,7 +610,7 @@ static inline void
>>>>>>>> amdgpu_vm_eviction_unlock(struct amdgpu_vm *vm)
>>>>>>>>    }
>>>>>>>>      void amdgpu_vm_update_fault_cache(struct amdgpu_device *adev,
>>>>>>>> -                  unsigned int pasid,
>>>>>>>> +                  struct amdgpu_iv_entry *entry,
>>>>>>>>                      uint64_t addr,
>>>>>>>>                      uint32_t status,
>>>>>>>>                      unsigned int vmhub);
>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
>>>>>>>> index d933e19e0cf5..6b177ce8db0e 100644
>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
>>>>>>>> @@ -150,7 +150,7 @@ static int gmc_v10_0_process_interrupt(struct
>>>>>>>> amdgpu_device *adev,
>>>>>>>>            status = RREG32(hub->vm_l2_pro_fault_status);
>>>>>>>>            WREG32_P(hub->vm_l2_pro_fault_cntl, 1, ~1);
>>>>>>>>    -        amdgpu_vm_update_fault_cache(adev, entry->pasid, addr,
>>>>>>>> status,
>>>>>>>> +        amdgpu_vm_update_fault_cache(adev, entry, addr, status,
>>>>>>>>                             entry->vmid_src ? AMDGPU_MMHUB0(0) :
>>>>>>>> AMDGPU_GFXHUB(0));
>>>>>>>>        }
>>>>>>>>    diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
>>>>>>>> index 527dc917e049..bcf254856a3e 100644
>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
>>>>>>>> @@ -121,7 +121,7 @@ static int gmc_v11_0_process_interrupt(struct
>>>>>>>> amdgpu_device *adev,
>>>>>>>>            status = RREG32(hub->vm_l2_pro_fault_status);
>>>>>>>>            WREG32_P(hub->vm_l2_pro_fault_cntl, 1, ~1);
>>>>>>>>    -        amdgpu_vm_update_fault_cache(adev, entry->pasid, addr,
>>>>>>>> status,
>>>>>>>> +        amdgpu_vm_update_fault_cache(adev, entry, addr, status,
>>>>>>>>                             entry->vmid_src ? AMDGPU_MMHUB0(0) :
>>>>>>>> AMDGPU_GFXHUB(0));
>>>>>>>>        }
>>>>>>>>    diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
>>>>>>>> index 3da7b6a2b00d..e9517ebbe1fd 100644
>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
>>>>>>>> @@ -1270,7 +1270,7 @@ static int gmc_v7_0_process_interrupt(struct
>>>>>>>> amdgpu_device *adev,
>>>>>>>>        if (!addr && !status)
>>>>>>>>            return 0;
>>>>>>>>    -    amdgpu_vm_update_fault_cache(adev, entry->pasid,
>>>>>>>> +    amdgpu_vm_update_fault_cache(adev, entry,
>>>>>>>>                         ((u64)addr) << AMDGPU_GPU_PAGE_SHIFT,
>>>>>>>> status, AMDGPU_GFXHUB(0));
>>>>>>>>          if (amdgpu_vm_fault_stop == AMDGPU_VM_FAULT_STOP_FIRST)
>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
>>>>>>>> index d20e5f20ee31..a271bf832312 100644
>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
>>>>>>>> @@ -1438,7 +1438,7 @@ static int gmc_v8_0_process_interrupt(struct
>>>>>>>> amdgpu_device *adev,
>>>>>>>>        if (!addr && !status)
>>>>>>>>            return 0;
>>>>>>>>    -    amdgpu_vm_update_fault_cache(adev, entry->pasid,
>>>>>>>> +    amdgpu_vm_update_fault_cache(adev, entry,
>>>>>>>>                         ((u64)addr) << AMDGPU_GPU_PAGE_SHIFT,
>>>>>>>> status, AMDGPU_GFXHUB(0));
>>>>>>>>          if (amdgpu_vm_fault_stop == AMDGPU_VM_FAULT_STOP_FIRST)
>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
>>>>>>>> index 47b63a4ce68b..dc9fb1fb9540 100644
>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
>>>>>>>> @@ -666,7 +666,7 @@ static int gmc_v9_0_process_interrupt(struct
>>>>>>>> amdgpu_device *adev,
>>>>>>>>        rw = REG_GET_FIELD(status, 
>>>>>>>> VM_L2_PROTECTION_FAULT_STATUS, RW);
>>>>>>>>        WREG32_P(hub->vm_l2_pro_fault_cntl, 1, ~1);
>>>>>>>>    -    amdgpu_vm_update_fault_cache(adev, entry->pasid, addr,
>>>>>>>> status, vmhub);
>>>>>>>> +    amdgpu_vm_update_fault_cache(adev, entry, addr, status, 
>>>>>>>> vmhub);
>>>>>>>>          dev_err(adev->dev,
>>>>>>>>            "VM_L2_PROTECTION_FAULT_STATUS:0x%08X\n",
>>

