Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80097873C09
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 17:21:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70A03113316;
	Wed,  6 Mar 2024 16:21:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="H0DqB9lh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2045.outbound.protection.outlook.com [40.107.101.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A365B113316;
 Wed,  6 Mar 2024 16:21:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WLEwOsawX3hVHOMi9iCMfv0yMjlSzpzwhRl4rZ7w2Vzmd3U0T/UHg+wz8HO03MMbY2nT1M3JtrXYh0Vg2ukBLDJioUD43rMGSGAu7/rPVHqNlann8AvlVsJJjPuDGU3MnTtd4DEcrgltLpmtfEFBjb73x2kfzv9N7Trmri22I58z/K7uUhN960J7OIUPEexEvivu3nvunVVQU1bGUp+Nqo75qWkyTsN18CIXaVNUoIkojc9tyTgumfBx367CQjUZqFRNFkuuiThrWb9BnUFULwCR+fLB0h0CFa+h+k/zMPB7TZrZZRSPCamaBJCHx0EgeWoRTtC+Yom+pKplRx1Kxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t+uymtSVO8iPCBZNpYeqK6Xl4WoxZLUlA/XI3Ek8v/Y=;
 b=anZIUU7wluXvo5x2En99AJnLC2SuBrFGQzyHhMO2rWRHxACs2gv4VFUcslVo980Xok+pbaEVUJanW+KAGcmuNkgeyWlcVaqNXWBNNhOtlNvgJCfz51ue3zWvCT4d3EaAQ64IpCl8T0guLjcnSwOLqSfDWaXYPgpErB/3d2NP8XZ0y2+ItYKng39VZOJOhi746dly8lt2RKf/JjPlffhTmxknrN/aVwU1GKvJ4tbyv+5oNCLCYqMhe7UfJ5Y1swj14EXmWYPsRLWfltW4ZFQmEuvh3O4okpQPYVf3FDnvy+v1axgKCkla2H068iSikv4EtFgd//NHP/ue435D+4bv2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t+uymtSVO8iPCBZNpYeqK6Xl4WoxZLUlA/XI3Ek8v/Y=;
 b=H0DqB9lhHKhvFAAln5swse9JJlBhntJkjor0FYbe6efEnUaxo1uwa9Yp2BBqTwh9sS2Qct8BEgQI4KVteEpT1sCaQtsJn4cloetFayRcLSa/zowOll+7CMbuKUeb5wX+J0N7fpeLXFy0OIch0L2udnyJNo6hNPT7nuuB1P+5qEc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5596.namprd12.prod.outlook.com (2603:10b6:510:136::13)
 by DS0PR12MB7746.namprd12.prod.outlook.com (2603:10b6:8:135::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.38; Wed, 6 Mar
 2024 16:21:21 +0000
Received: from PH7PR12MB5596.namprd12.prod.outlook.com
 ([fe80::6f48:e3f1:6ff9:75bd]) by PH7PR12MB5596.namprd12.prod.outlook.com
 ([fe80::6f48:e3f1:6ff9:75bd%4]) with mapi id 15.20.7362.019; Wed, 6 Mar 2024
 16:21:20 +0000
Message-ID: <81f2c1bf-6c44-4d7c-aab5-83fa097a21ff@amd.com>
Date: Wed, 6 Mar 2024 21:51:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: cache in more vm fault information
Content-Language: en-US
To: Alex Deucher <alexdeucher@gmail.com>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Sunil Khatri <sunil.khatri@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Shashank Sharma <shashank.sharma@amd.com>,
 amd-gfx@lists.freedesktop.org, Pan@rtg-sunil-navi33.amd.com,
 Xinhui <Xinhui.Pan@amd.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Mukul Joshi <mukul.joshi@amd.com>,
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
 <852e4f0e-c743-44c2-a2bb-59f0e8e25e1b@amd.com>
 <CADnq5_MzPxxGHEUuZBv9AWZ0cfdurPxf6jvXxuTPfTkJ5he3yQ@mail.gmail.com>
From: "Khatri, Sunil" <sukhatri@amd.com>
In-Reply-To: <CADnq5_MzPxxGHEUuZBv9AWZ0cfdurPxf6jvXxuTPfTkJ5he3yQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0148.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:6::33) To PH7PR12MB5596.namprd12.prod.outlook.com
 (2603:10b6:510:136::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5596:EE_|DS0PR12MB7746:EE_
X-MS-Office365-Filtering-Correlation-Id: 47d59726-bb05-43ad-64fc-08dc3df97567
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o8MANjD1dY2rvW5mXq038g03q3ynB+iB77xz8SWczdjiimp1mDDVF6d5OHdxoEtqc3GkpUAcfIVRJuy2W9MZjkV6lGydIWRkt06x0sQum3aQVHXCO+Jb9UXqZAmebGSyOXyrKjwYFDGQblLRYX4Q5JkO2apFpBhF4LDMgWJ612MOMWwQKctpVqAc4koQwa7eYwf2Iuv7t4lRFFsXE2DWopR9baYfibZTbNHUyZVaRfYJ9XU9KF5gtaK2EPzVT6LrEoRoNCFqgOEPcLOJwyNJKg12M62Dk+LO+KXPED281jBRmW0aC0bFCkvXqqSEB5Juo/zh/3lzl0wqvyeTHi7fLIB+uJMh1CzGcyq2bcN15K8mydCBcNT//6to4LcW10A3oEPr4PwNSmZdEEEQVXYlhBXMLQ/DaCtFmmVBE9YaoGlYj2I6PEk0Mi3RMv78WJy7QGPigs/SHXLLMzfzLO1EHkDDz+yy55Ijr47me213QdwuU/P/BmnFOPLZg/ZpH4b7OlSCE/hUV4aV/mcwzjd5LdwR3Yg770FoDbT1zJzI7kGQ1d37hpp40+miyvkfGxYi2qw/eDR0Pr6LRD2BPtz/j4xn788F1t+Q9+OTk6mssK7hJSOj4NhjeXCbYI0RKjjX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5596.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UVVsQ0hJUVNPQVRaaGxEL1NIcmpxUXJyYW5QNDZRQlBrS0tGU1VPbm9DNzV6?=
 =?utf-8?B?TmdldldSaXdnV0tsTkdUMHphWVlNc01xNURCd3pJRzFvUE9uY09oZkk0ZE9v?=
 =?utf-8?B?VkZLRk5iNUZQWDlkTTN2RDNrd1ZhU2YzSE1yOEovTmlxNThlSmJvckNjWkRG?=
 =?utf-8?B?SW9PU3Vjcm9FRHEwdzhMOUF3UDN1RFJTVVM4VGp3N1hpR3dOc3NJSk01Wk1I?=
 =?utf-8?B?Q2NMUUd1YzlRQkhtSHdYeFlhN0cxYnRVN2ZEc1VpNXV5SHNrWWdYdmxoeDcr?=
 =?utf-8?B?dFFGS1R4SE9sSVFyZnNwSEp4NXhwYXhSbHp0bGYzK2YvM3QrYWxjN3NVcFly?=
 =?utf-8?B?ZXp2N25scXd4bmJaUTEvbUw1YmJPVDkvTGtXdnVrUml0MkpOcHVRWkJzcTBS?=
 =?utf-8?B?cDJJNUdwOEgvZEJTUmZxbFJwZGhBMGpYRm5UVlF2bnk1K0dFT2dLd2lFZit5?=
 =?utf-8?B?REtOQmxxb2M2b09CYk5UVlZJWGVmK0t4NWEvQnljcDB1dmhVZHYxSGU0Z1hB?=
 =?utf-8?B?WnphRE9YSlpZSStPdGt1b3lENko3SzlmdmRSZ1RlcEc1dklzVzJsaGJGSFQy?=
 =?utf-8?B?b3BrZGxGRFoyS1VHWlRMdlZ5aVJ2T2g3a1RvbjNzb0xQM1JHbXZNKzFBaExt?=
 =?utf-8?B?bGhRWXBYTFJnbGFNakRWY1d5NDQ3dWlDOXV4L1lmS3RWNEpKa2dGTDl6OVAv?=
 =?utf-8?B?QmNBcGcwK0tydDBqTzVFYnZPVm5TVUltN2I2Q0hGR1luaW90OFp4M21tSWZL?=
 =?utf-8?B?dVAyclpvTGtQR2tOeEdVVEdpVG5mdFU0czlNaXBrY2hwbHpFU2Rxb3J3WGw2?=
 =?utf-8?B?ZzNSOUdqSjh6aDhYR083U3BHMHRRNnB5aEhacDhvYmxXenpYdU4yMVNIWjhr?=
 =?utf-8?B?NTBpOVlMb2pKbisyWENDcHNuMHZZOHhIN1ozY3FBQXV0TnJmUkFBNSsyUExN?=
 =?utf-8?B?azQ0YmVqU2RGRjFjS0ErOHBRWEtTZ3NJUkpwSjdmWmpESVlHdktCcDJyWDZj?=
 =?utf-8?B?R0JYVFZiNy9Jd0JNcGhwS2JkbHpFVm9JaVlsM1BHaE5KdWVUbkptRzA2blRW?=
 =?utf-8?B?c0FiVkE4TjRlTTBRdmw2eGZoK24wTjdnODBDZDJEVmpmV1lxTE82WW9ZZmw5?=
 =?utf-8?B?VXd1U3BndUROK2Y5MlhJMy83UXpwLzNPYVBWK0NRcHdrVzRsREdrUU9PZkpZ?=
 =?utf-8?B?RlRXTW5FZVBCYkJIVjFodUNIS09VUkpER1V2c2drQytVK1pFWGtSbG5IT09P?=
 =?utf-8?B?VlhKelpyaUd4N0MxcDh1WWdTQXh3MmY2VzU5cWsrcGgrZjE3RFhhMDROZi9Y?=
 =?utf-8?B?TGk3RWk4b0llQnpKcUhPak1NcjJxUWRMdFNscSt4YTBoV3NQcGZ0MUZSOEtj?=
 =?utf-8?B?aGZiWXR0UnVuR1BUN09vaDFWbFF5ZW40QldVK2dmSitJN01sVE1vdGdJMXdI?=
 =?utf-8?B?Tk9Bemt3YUExeWNqK1FKZE5jM2NEZ0c1L0lKSmJNWEtOaUZvTkZhWndWNVRJ?=
 =?utf-8?B?SUQwbVR3MnBmSEVxSENrN2xBdERSTXJMNkVYWVI4VFFkUVA4a3hVS1loRG9i?=
 =?utf-8?B?aVR3dlVRQ0xHaDBtY2daaElGakJpS1B2SHRWVC9Kb2tSWlZUTitIY1oyY2hS?=
 =?utf-8?B?TElOTUx1OUNkaUVVbVcwRThQbm9wY0ZCRkJ2Y0dKU2d4dkhrQ1JOejZuNGNG?=
 =?utf-8?B?OVhNUzJHS005YTdnWDZaM0h3UW4vY0tHQXlOUVU4bFJtVm1NUDlNM0RpOGM4?=
 =?utf-8?B?U2w5dFBmZm5sWkRwcEpKOXMvYWhzVFR4bnFjSnNOSzhTYWVCSG45S0s4dUJU?=
 =?utf-8?B?Y0ZMNlV2ekpZWkY4M1FPVVRBUlpiUzAzZm9maVJIOCtqYTJPbVE0K0JoOG90?=
 =?utf-8?B?N2NtUkQreXQxYzRXa01mOE42YVZRdS94cXNIczVOQlVBWm1uWGFnQm9PYzJU?=
 =?utf-8?B?ZVJUN2xSTGhjVUM2NmVOSU1QMWRSdnpBWUtlWlk5ektGWmhXWHFuZW9pK2N4?=
 =?utf-8?B?dE5HVXcvalBLM3hlWmdzd3g2SEdHTmZTNFlxZ0d1cE1MNHR4TVg3OVhzaE12?=
 =?utf-8?B?dW9saDhZeDJxZmE0dXVxZzB2ajhDZWI5ZytrbnBMQTk3MjlhaWxGcFhZQTlo?=
 =?utf-8?Q?fTDsweRe7mNh8G870XhR+wOA6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47d59726-bb05-43ad-64fc-08dc3df97567
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5596.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2024 16:21:20.7149 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: loPr+qvDbauLS1hhviwKSzpqVSX5T+WopKskBjbWAH3SLjJKrvHFDWTqmFdLBowMG2YPOLFyvOLKxmQyu75uUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7746
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


On 3/6/2024 9:45 PM, Alex Deucher wrote:
> On Wed, Mar 6, 2024 at 11:06 AM Khatri, Sunil <sukhatri@amd.com> wrote:
>>
>> On 3/6/2024 9:07 PM, Christian König wrote:
>>> Am 06.03.24 um 16:13 schrieb Khatri, Sunil:
>>>> On 3/6/2024 8:34 PM, Christian König wrote:
>>>>> Am 06.03.24 um 15:29 schrieb Alex Deucher:
>>>>>> On Wed, Mar 6, 2024 at 8:04 AM Khatri, Sunil <sukhatri@amd.com> wrote:
>>>>>>> On 3/6/2024 6:12 PM, Christian König wrote:
>>>>>>>> Am 06.03.24 um 11:40 schrieb Khatri, Sunil:
>>>>>>>>> On 3/6/2024 3:37 PM, Christian König wrote:
>>>>>>>>>> Am 06.03.24 um 10:04 schrieb Sunil Khatri:
>>>>>>>>>>> When an  page fault interrupt is raised there
>>>>>>>>>>> is a lot more information that is useful for
>>>>>>>>>>> developers to analyse the pagefault.
>>>>>>>>>> Well actually those information are not that interesting because
>>>>>>>>>> they are hw generation specific.
>>>>>>>>>>
>>>>>>>>>> You should probably rather use the decoded strings here, e.g. hub,
>>>>>>>>>> client, xcc_id, node_id etc...
>>>>>>>>>>
>>>>>>>>>> See gmc_v9_0_process_interrupt() an example.
>>>>>>>>>> I saw this v9 does provide more information than what v10 and v11
>>>>>>>>>> provide like node_id and fault from which die but thats again very
>>>>>>>>>> specific to IP_VERSION(9, 4, 3)) i dont know why thats information
>>>>>>>>>> is not there in v10 and v11.
>>>>>>>>> I agree to your point but, as of now during a pagefault we are
>>>>>>>>> dumping this information which is useful like which client
>>>>>>>>> has generated an interrupt and for which src and other information
>>>>>>>>> like address. So i think to provide the similar information in the
>>>>>>>>> devcoredump.
>>>>>>>>>
>>>>>>>>> Currently we do not have all this information from either job or vm
>>>>>>>>> being derived from the job during a reset. We surely could add more
>>>>>>>>> relevant information later on as per request but this
>>>>>>>>> information is
>>>>>>>>> useful as
>>>>>>>>> eventually its developers only who would use the dump file provided
>>>>>>>>> by customer to debug.
>>>>>>>>>
>>>>>>>>> Below is the information that i dump in devcore and i feel that is
>>>>>>>>> good information but new information could be added which could be
>>>>>>>>> picked later.
>>>>>>>>>
>>>>>>>>>> Page fault information
>>>>>>>>>> [gfxhub] page fault (src_id:0 ring:24 vmid:3 pasid:32773)
>>>>>>>>>> in page starting at address 0x0000000000000000 from client 0x1b
>>>>>>>>>> (UTCL2)
>>>>>>>> This is a perfect example what I mean. You record in the patch is
>>>>>>>> the
>>>>>>>> client_id, but this is is basically meaningless unless you have
>>>>>>>> access
>>>>>>>> to the AMD internal hw documentation.
>>>>>>>>
>>>>>>>> What you really need is the client in decoded form, in this case
>>>>>>>> UTCL2. You can keep the client_id additionally, but the decoded
>>>>>>>> client
>>>>>>>> string is mandatory to have I think.
>>>>>>>>
>>>>>>>> Sure i am capturing that information as i am trying to minimise the
>>>>>>>> memory interaction to minimum as we are still in interrupt context
>>>>>>>> here that why i recorded the integer information compared to
>>>>>>>> decoding
>>>>>>> and writing strings there itself but to postpone till we dump.
>>>>>>>
>>>>>>> Like decoding to the gfxhub/mmhub based on vmhub/vmid_src and client
>>>>>>> string from client id. So are we good to go with the information with
>>>>>>> the above information of sharing details in devcoredump using the
>>>>>>> additional information from pagefault cached.
>>>>>> I think amdgpu_vm_fault_info() has everything you need already (vmhub,
>>>>>> status, and addr).  client_id and src_id are just tokens in the
>>>>>> interrupt cookie so we know which IP to route the interrupt to. We
>>>>>> know what they will be because otherwise we'd be in the interrupt
>>>>>> handler for a different IP.  I don't think ring_id has any useful
>>>>>> information in this context and vmid and pasid are probably not too
>>>>>> useful because they are just tokens to associate the fault with a
>>>>>> process.  It would be better to have the process name.
>>>> Just to share context here Alex, i am preparing this for devcoredump,
>>>> my intention was to replicate the information which in KMD we are
>>>> sharing in Dmesg for page faults. If assuming we do not add client id
>>>> specially we would not be able to share enough information in
>>>> devcoredump.
>>>> It would be just address and hub(gfxhub/mmhub) and i think that is
>>>> partial information as src id and client id and ip block shares good
>>>> information.
>>>>
>>>> For process related information we are capturing that information
>>>> part of dump from existing functionality.
>>>> **** AMDGPU Device Coredump ****
>>>> version: 1
>>>> kernel: 6.7.0-amd-staging-drm-next
>>>> module: amdgpu
>>>> time: 45.084775181
>>>> process_name: soft_recovery_p PID: 1780
>>>>
>>>> Ring timed out details
>>>> IP Type: 0 Ring Name: gfx_0.0.0
>>>>
>>>> Page fault information
>>>> [gfxhub] page fault (src_id:0 ring:24 vmid:3 pasid:32773)
>>>> in page starting at address 0x0000000000000000 from client 0x1b (UTCL2)
>>>> VRAM is lost due to GPU reset!
>>>>
>>>> Regards
>>>> Sunil
>>>>
>>>>> The decoded client name would be really useful I think since the
>>>>> fault handled is a catch all and handles a whole bunch of different
>>>>> clients.
>>>>>
>>>>> But that should be ideally passed in as const string instead of the
>>>>> hw generation specific client_id.
>>>>>
>>>>> As long as it's only a pointer we also don't run into the trouble
>>>>> that we need to allocate memory for it.
>>>> I agree but i prefer adding the client id and decoding it in
>>>> devcorecump using soc15_ih_clientid_name[fault_info->client_id]) is
>>>> better else we have to do an sprintf this string to fault_info in irq
>>>> context which is writing more bytes to memory i guess compared to an
>>>> integer:)
>>> Well I totally agree that we shouldn't fiddle to much in the interrupt
>>> handler, but exactly what you suggest here won't work.
>>>
>>> The client_id is hw generation specific, so the only one who has that
>>> is the hw generation specific fault handler. Just compare the defines
>>> here:
>>>
>>> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c#L83
>>>
>>>
>>> and here:
>>>
>>> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/amd/amdgpu/gfxhub_v11_5_0.c#L38
>>>
>>>
>> Got your point. Let me see but this is a lot of work in irq context.
>> Either we can drop totally the client id thing as alex is suggesting
>> here as its always be same client and src id or let me come up with a
>> patch and see if its acceptable.
>>
>> Also as Alex pointed we need to decode from status register which kind
>> of page fault it is (permission, read, write etc) this all is again
>> family specific and thats all in IRQ context. Not feeling good about it
>> but let me try to share all that in a new patch.
>>
> I don't think you need to decode it.  As long as you have a way to
> identify the chip, we can just include the raw status register and the
> developer can decode it when they look at the devcoredump.

Got it Alex.
I will try to add chip information along with status register value 
only. We have below two values in adev, i think this along with status 
register should suffice.
enum amd_asic_type        asic_type;
uint32_t            family;

Regards
Sunil Khatri

>
> Alex
>
>
>> Regards
>> Sunil.
>>
>>> Regards,
>>> Christian.
>>>
>>>> We can argue on values like pasid and vmid and ring id to be taken
>>>> off if they are totally not useful.
>>>>
>>>> Regards
>>>> Sunil
>>>>
>>>>> Christian.
>>>>>
>>>>>> Alex
>>>>>>
>>>>>>> regards
>>>>>>> sunil
>>>>>>>
>>>>>>>> Regards,
>>>>>>>> Christian.
>>>>>>>>
>>>>>>>>> Regards
>>>>>>>>> Sunil Khatri
>>>>>>>>>
>>>>>>>>>> Regards,
>>>>>>>>>> Christian.
>>>>>>>>>>
>>>>>>>>>>> Add all such information in the last cached
>>>>>>>>>>> pagefault from an interrupt handler.
>>>>>>>>>>>
>>>>>>>>>>> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
>>>>>>>>>>> ---
>>>>>>>>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 9 +++++++--
>>>>>>>>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h | 7 ++++++-
>>>>>>>>>>>     drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c | 2 +-
>>>>>>>>>>>     drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c | 2 +-
>>>>>>>>>>>     drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c  | 2 +-
>>>>>>>>>>>     drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c  | 2 +-
>>>>>>>>>>>     drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c  | 2 +-
>>>>>>>>>>>     7 files changed, 18 insertions(+), 8 deletions(-)
>>>>>>>>>>>
>>>>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>>>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>>>>>>>>>> index 4299ce386322..b77e8e28769d 100644
>>>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>>>>>>>>>> @@ -2905,7 +2905,7 @@ void amdgpu_debugfs_vm_bo_info(struct
>>>>>>>>>>> amdgpu_vm *vm, struct seq_file *m)
>>>>>>>>>>>      * Cache the fault info for later use by userspace in
>>>>>>>>>>> debugging.
>>>>>>>>>>>      */
>>>>>>>>>>>     void amdgpu_vm_update_fault_cache(struct amdgpu_device *adev,
>>>>>>>>>>> -                  unsigned int pasid,
>>>>>>>>>>> +                  struct amdgpu_iv_entry *entry,
>>>>>>>>>>>                       uint64_t addr,
>>>>>>>>>>>                       uint32_t status,
>>>>>>>>>>>                       unsigned int vmhub)
>>>>>>>>>>> @@ -2915,7 +2915,7 @@ void amdgpu_vm_update_fault_cache(struct
>>>>>>>>>>> amdgpu_device *adev,
>>>>>>>>>>> xa_lock_irqsave(&adev->vm_manager.pasids, flags);
>>>>>>>>>>>     -    vm = xa_load(&adev->vm_manager.pasids, pasid);
>>>>>>>>>>> +    vm = xa_load(&adev->vm_manager.pasids, entry->pasid);
>>>>>>>>>>>         /* Don't update the fault cache if status is 0.  In the
>>>>>>>>>>> multiple
>>>>>>>>>>>          * fault case, subsequent faults will return a 0 status
>>>>>>>>>>> which is
>>>>>>>>>>>          * useless for userspace and replaces the useful fault
>>>>>>>>>>> status, so
>>>>>>>>>>> @@ -2924,6 +2924,11 @@ void amdgpu_vm_update_fault_cache(struct
>>>>>>>>>>> amdgpu_device *adev,
>>>>>>>>>>>         if (vm && status) {
>>>>>>>>>>>             vm->fault_info.addr = addr;
>>>>>>>>>>>             vm->fault_info.status = status;
>>>>>>>>>>> +        vm->fault_info.client_id = entry->client_id;
>>>>>>>>>>> +        vm->fault_info.src_id = entry->src_id;
>>>>>>>>>>> +        vm->fault_info.vmid = entry->vmid;
>>>>>>>>>>> +        vm->fault_info.pasid = entry->pasid;
>>>>>>>>>>> +        vm->fault_info.ring_id = entry->ring_id;
>>>>>>>>>>>             if (AMDGPU_IS_GFXHUB(vmhub)) {
>>>>>>>>>>>                 vm->fault_info.vmhub = AMDGPU_VMHUB_TYPE_GFX;
>>>>>>>>>>>                 vm->fault_info.vmhub |=
>>>>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>>>>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>>>>>>>>>>> index 047ec1930d12..c7782a89bdb5 100644
>>>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>>>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>>>>>>>>>>> @@ -286,6 +286,11 @@ struct amdgpu_vm_fault_info {
>>>>>>>>>>>         uint32_t    status;
>>>>>>>>>>>         /* which vmhub? gfxhub, mmhub, etc. */
>>>>>>>>>>>         unsigned int    vmhub;
>>>>>>>>>>> +    unsigned int    client_id;
>>>>>>>>>>> +    unsigned int    src_id;
>>>>>>>>>>> +    unsigned int    ring_id;
>>>>>>>>>>> +    unsigned int    pasid;
>>>>>>>>>>> +    unsigned int    vmid;
>>>>>>>>>>>     };
>>>>>>>>>>>       struct amdgpu_vm {
>>>>>>>>>>> @@ -605,7 +610,7 @@ static inline void
>>>>>>>>>>> amdgpu_vm_eviction_unlock(struct amdgpu_vm *vm)
>>>>>>>>>>>     }
>>>>>>>>>>>       void amdgpu_vm_update_fault_cache(struct amdgpu_device
>>>>>>>>>>> *adev,
>>>>>>>>>>> -                  unsigned int pasid,
>>>>>>>>>>> +                  struct amdgpu_iv_entry *entry,
>>>>>>>>>>>                       uint64_t addr,
>>>>>>>>>>>                       uint32_t status,
>>>>>>>>>>>                       unsigned int vmhub);
>>>>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
>>>>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
>>>>>>>>>>> index d933e19e0cf5..6b177ce8db0e 100644
>>>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
>>>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
>>>>>>>>>>> @@ -150,7 +150,7 @@ static int gmc_v10_0_process_interrupt(struct
>>>>>>>>>>> amdgpu_device *adev,
>>>>>>>>>>>             status = RREG32(hub->vm_l2_pro_fault_status);
>>>>>>>>>>>             WREG32_P(hub->vm_l2_pro_fault_cntl, 1, ~1);
>>>>>>>>>>>     -        amdgpu_vm_update_fault_cache(adev, entry->pasid,
>>>>>>>>>>> addr,
>>>>>>>>>>> status,
>>>>>>>>>>> +        amdgpu_vm_update_fault_cache(adev, entry, addr, status,
>>>>>>>>>>>                              entry->vmid_src ? AMDGPU_MMHUB0(0) :
>>>>>>>>>>> AMDGPU_GFXHUB(0));
>>>>>>>>>>>         }
>>>>>>>>>>>     diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
>>>>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
>>>>>>>>>>> index 527dc917e049..bcf254856a3e 100644
>>>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
>>>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
>>>>>>>>>>> @@ -121,7 +121,7 @@ static int gmc_v11_0_process_interrupt(struct
>>>>>>>>>>> amdgpu_device *adev,
>>>>>>>>>>>             status = RREG32(hub->vm_l2_pro_fault_status);
>>>>>>>>>>>             WREG32_P(hub->vm_l2_pro_fault_cntl, 1, ~1);
>>>>>>>>>>>     -        amdgpu_vm_update_fault_cache(adev, entry->pasid,
>>>>>>>>>>> addr,
>>>>>>>>>>> status,
>>>>>>>>>>> +        amdgpu_vm_update_fault_cache(adev, entry, addr, status,
>>>>>>>>>>>                              entry->vmid_src ? AMDGPU_MMHUB0(0) :
>>>>>>>>>>> AMDGPU_GFXHUB(0));
>>>>>>>>>>>         }
>>>>>>>>>>>     diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
>>>>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
>>>>>>>>>>> index 3da7b6a2b00d..e9517ebbe1fd 100644
>>>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
>>>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
>>>>>>>>>>> @@ -1270,7 +1270,7 @@ static int
>>>>>>>>>>> gmc_v7_0_process_interrupt(struct
>>>>>>>>>>> amdgpu_device *adev,
>>>>>>>>>>>         if (!addr && !status)
>>>>>>>>>>>             return 0;
>>>>>>>>>>>     -    amdgpu_vm_update_fault_cache(adev, entry->pasid,
>>>>>>>>>>> +    amdgpu_vm_update_fault_cache(adev, entry,
>>>>>>>>>>>                          ((u64)addr) << AMDGPU_GPU_PAGE_SHIFT,
>>>>>>>>>>> status, AMDGPU_GFXHUB(0));
>>>>>>>>>>>           if (amdgpu_vm_fault_stop == AMDGPU_VM_FAULT_STOP_FIRST)
>>>>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
>>>>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
>>>>>>>>>>> index d20e5f20ee31..a271bf832312 100644
>>>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
>>>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
>>>>>>>>>>> @@ -1438,7 +1438,7 @@ static int
>>>>>>>>>>> gmc_v8_0_process_interrupt(struct
>>>>>>>>>>> amdgpu_device *adev,
>>>>>>>>>>>         if (!addr && !status)
>>>>>>>>>>>             return 0;
>>>>>>>>>>>     -    amdgpu_vm_update_fault_cache(adev, entry->pasid,
>>>>>>>>>>> +    amdgpu_vm_update_fault_cache(adev, entry,
>>>>>>>>>>>                          ((u64)addr) << AMDGPU_GPU_PAGE_SHIFT,
>>>>>>>>>>> status, AMDGPU_GFXHUB(0));
>>>>>>>>>>>           if (amdgpu_vm_fault_stop == AMDGPU_VM_FAULT_STOP_FIRST)
>>>>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
>>>>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
>>>>>>>>>>> index 47b63a4ce68b..dc9fb1fb9540 100644
>>>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
>>>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
>>>>>>>>>>> @@ -666,7 +666,7 @@ static int gmc_v9_0_process_interrupt(struct
>>>>>>>>>>> amdgpu_device *adev,
>>>>>>>>>>>         rw = REG_GET_FIELD(status,
>>>>>>>>>>> VM_L2_PROTECTION_FAULT_STATUS, RW);
>>>>>>>>>>>         WREG32_P(hub->vm_l2_pro_fault_cntl, 1, ~1);
>>>>>>>>>>>     -    amdgpu_vm_update_fault_cache(adev, entry->pasid, addr,
>>>>>>>>>>> status, vmhub);
>>>>>>>>>>> +    amdgpu_vm_update_fault_cache(adev, entry, addr, status,
>>>>>>>>>>> vmhub);
>>>>>>>>>>>           dev_err(adev->dev,
>>>>>>>>>>> "VM_L2_PROTECTION_FAULT_STATUS:0x%08X\n",
