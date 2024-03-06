Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 851E9873BFA
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 17:20:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC12A10E6CB;
	Wed,  6 Mar 2024 16:20:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Q5pnNGQm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2055.outbound.protection.outlook.com [40.107.93.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 755F210E2CB;
 Wed,  6 Mar 2024 16:20:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I5zwv4S4zbgj9rkgCUmYxyIj8WGj0TbNS0bLRMkKNbLepxKwbHJImOG2lNzoxhrmCraTPawQmHqqv9NaSFe17GHzOFTldgS5WbfoqbEPIEvvmn4Y+A8Y+mvUvwF6+yPiI9CXapEMoW01e6b44LOHkdDyQPwAh4cKoCthIRvd4Bf9OA4hk6N+1MTEvnnzf7XMvXQoEZ1u294uphUTVamr1AhwDZnmFG1VMAREikmGOPbYlxz8yvpV2Zn4qrzMqSOl43QEM2RVPzdRgpeXwFeZqiFy44d4UtiqBUKzQjKtxtNxV18qRvrPTVKAc8kcuyZA8pZL20vHNluDH50Al8/cwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hvlFsDXTP2fmSEyBOVOTsjLNPOEZ3QVTSTjmJMViFdU=;
 b=C8FjhJEN3BdmFoeg9Bkl++wlYbGTWCRnn5s05vRlgXptuwhS5M+JCRoTvAxCeovlTBqXoEhqB8z1XL4pDxOBbV9hkUMkMPvdrY0jawzbqu8+3CwBxuAsVSsr6Xr/mIagiPR2UYdazp6ssPEiiUzJiZSB6lfTb71AV+m+bpTXZHIewXIe56egOYlCahCpNKW9ZAqpLF7qBDMIVsnAive7rzdS4k4R6dUg3gNjkm/sXyA9r+//Yqw/z7UAPmS13+LyIkftaZYyA2rZzBdrwbpQoq5lhK5iye0lrAwebI1IXW2To7RTJzv25bQBocAMkuSZrX1iTqLZEgz7SdPe/wcO1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hvlFsDXTP2fmSEyBOVOTsjLNPOEZ3QVTSTjmJMViFdU=;
 b=Q5pnNGQm6WqSe3bC88r3Zin3otx8wbxQ1wt+FeW/HEOA9jp8KDICq7fdCI9rBfAiBJB+PYz/oiQfV+SE3hzH+2WxAFys4x6wiN0TmvI8mnQqgS/ePgiLjtU1C1iLe4o3jPsqOV8Ion7cu22V8/sInNf5hpQBZagt4wWj6BN5aX8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH0PR12MB8050.namprd12.prod.outlook.com (2603:10b6:510:26e::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.39; Wed, 6 Mar
 2024 16:20:05 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a%6]) with mapi id 15.20.7339.031; Wed, 6 Mar 2024
 16:20:05 +0000
Message-ID: <0be0df75-9794-4b7a-a975-a5ea86b7d3f3@amd.com>
Date: Wed, 6 Mar 2024 17:19:59 +0100
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
 <bfaaad63-a5d7-4ceb-8e1c-d541f76f4037@amd.com>
 <852e4f0e-c743-44c2-a2bb-59f0e8e25e1b@amd.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <852e4f0e-c743-44c2-a2bb-59f0e8e25e1b@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ZR0P278CA0077.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:22::10) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH0PR12MB8050:EE_
X-MS-Office365-Filtering-Correlation-Id: 596f2055-0951-4182-02c9-08dc3df948b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u8n7QFRJ6Ng8JbTfs8B/aZvZCVpO3OCw3GAdm4MhbYu3Nazggh6aEzyH04APFAngItLUdLFu3BFVjBAfdS1ojeRXlpz0hOaCfWuQMyOB+Wzh/3xoef9UsGxVN9rdPpidkT6+EXTPj40nf4XIbDwvrjSACTH+KlGzJwK+4yta2j4exHrDbWDfTiVwrzTBJQTbMKZMMyG2dOOaNCQPw65taL0QY2j0vOxHdU9BzDrb02blBXJco4yme1CqOvtLydfbZPpbR7VzFa7GIvPgW8o4C62Fl4gseLzUHVNpUAO7+AswGeQRh7dgfmdGAPRZI+zO1x+xJAEpusei16278HFQ5XCB0QI8Mvig1lJkaq/muI/LrF/h6jeMQnFCwKsAqOZ9ofFoc7hFOPRrztJNDc656hlchHsHK5tkj84WQx+FRb+rIpCuuH54P8biz+NSgux5cx3tavuCeArHgQDiXJFBHwWh1RyY2i+co6/vtBJsgIF6FHLcA1B3jPPevSR0xJeRMQEI3b202StWZDU0+lKmXQn3PfYsofRDEVDCsE9RJdMtOp7LHI50ul9GRKGMbm/8k5U0nnmdiA6etM6lVPwpAk57vJB60X81Of1D78vbLmvl7OWPQF9aWaHlbAtfcoYj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a01oVEdQREhkUE9oUTI3RHFCZGk2UzNaODQ3OXBRSG9BdWRwVmJSd2VGeVhK?=
 =?utf-8?B?WmNzMFlHNTdmNGNhbDIrUzBFdlpuYjk1NzB3VmQzSmQ1dDJNbXpXNExFTWM1?=
 =?utf-8?B?VUl5NHBQZEE3TTRieDllbjZoRDM2MTRuczhyc2NKQVBxRitsZ1BkV3ExU0wy?=
 =?utf-8?B?cWpqVElZbHRrTXFtYSs5MUJSdjVDaTgwWVU5QWVzcTF3ZmdIZG5hcnVITU5v?=
 =?utf-8?B?WUZBQlVYbmI2ZnYySTZIdXZhK3lTaGYxK2pvWFphNU53Wmk3TVRBZlR1OUVp?=
 =?utf-8?B?cjBWTXNueXcxYlkweURzVi90NGFkUDZZcWRsRndkNVF1RjdVQTgxU2ZpRG14?=
 =?utf-8?B?VXpvQUZZand5V3Y3ZnhXQU41a0lFdTNtYnZUZ0N4Umw2ZFdRR1hGWUMwTHpL?=
 =?utf-8?B?RG5vb053cWhFUkhRVldBbXZzRW92K3V6NDRCbUp5KzBQeW1jcDBoakNaOXJk?=
 =?utf-8?B?NG1wRDJTeC9uSG9yTlFWUngvWlVqSEFIeCttNTRrV1prcERmTXlKckNGbHZD?=
 =?utf-8?B?eVlyWlRUUDJ4UmNydE40TmpYbEI3bmRTQ3ZQTllGM2VHMjFZYjRGYitqUTU4?=
 =?utf-8?B?eWkrNW9ncXNVSWdPU1J5V2RqeWRWd050STRCY1JOaTJaRWJkOHFqTHJiVWhp?=
 =?utf-8?B?QXk1Mm1oWlRTZjdBeGJYRjExR1E5SU5zWFJqMVkxVmdtQWVYajZuUnU3Z3Vx?=
 =?utf-8?B?M2YwSE5BZHdUbTVGbExhalpDMGlZUzQ3ZEVtVFExRC8zOGF1ekJKM3c4Q0Jo?=
 =?utf-8?B?Zy9wam52YjZzakhjc0k3U1E5emhIVGMxS0w1NXRCRFd3WGhGNHlWQjJxemor?=
 =?utf-8?B?aHRqVW90di9aYkpxS3lSakYreFl5eEdkRFFvV1dVNzZJOTRlME01ZVR2Q2Fa?=
 =?utf-8?B?VmJPRllXZkhvc3Fka2grS1dhdDVETCtJdE0wWUxGQkk3eDVkbEpFRFhDWTk5?=
 =?utf-8?B?T1UxeGpubFppTHVYc0czTndJMHViakUzMDlJa0xHZ3FQK2NMQlpnWHhvLzhZ?=
 =?utf-8?B?TlNxNHowR0h5aGFlVmR4dXRDblZ5MkcvSTRGcWVUMFZGajdsUWU1dmlqWTY5?=
 =?utf-8?B?S3V2cldLZzdReWhtZzF6ZzJHd3psZ2NzV2MyV0NwSkV5QzBLTGEvRjBDdi9R?=
 =?utf-8?B?RExHZkZCNVE0ckR3NllHYW1mUXBDcGJqZmhLVEllRUVhVlZGS24xSXlYdEFR?=
 =?utf-8?B?MjVPUE1JMnBuS0poejE0bHhzYzFDaWdiNW1MUEhkUVgvTFRxajFvM256dHU3?=
 =?utf-8?B?eUV5SUJmTzFoRFlCQzUyNThRZ1M4WFNuK1doNEFnRnBCMU5nN2FXaWZ2bi9u?=
 =?utf-8?B?dVZueU4zNStVOS9HNm9qcllnblBUdERnQzh2dnJLaFR2eE1vS3cwTmNoOExx?=
 =?utf-8?B?WFVaaVNiSXpkSUE3TkxyWlM5TTlmZS83cjVqN0paV0hKVVNmNEN4TCt3R0Jj?=
 =?utf-8?B?RWNESnZHMjlXZ2tEalFTTGNRUkVSNlRCUytsOGkrVzRjK2dNZFJTdlIzWEJq?=
 =?utf-8?B?S093U2RsMTQydkVNekJqaUliU0FTUFlLYXdsZVhpaTg3d2dyaXVVMDhndUxI?=
 =?utf-8?B?MS80engxSDh2ODVxclpvYlB1NGJDdldUSndWRVhTRUZXRjYxTml6WVd6Y1pC?=
 =?utf-8?B?VW9xaTVDOVNXQUYwbGg3Sk5BT2NJNWtpRVZXWkNUZkU0Y0tYMTVFdVBYSjRy?=
 =?utf-8?B?YVhOUXZ3KzVXUE04LzlnU3ZyMXRtK2ZYRXkyWGFJVXYwbm44RGZjOHgzRThF?=
 =?utf-8?B?UStuTms4QmdtdUpnNUhlQlA3bEd3QzFKWmdidHpYRnRMWmU5dkg1ZERvZzJ2?=
 =?utf-8?B?NW9jSmtzNGtSZ3RzWDBjWE1pQk51WXd5WHJ4Y0RGdEpsV0c2WHpRb3M1ZmRn?=
 =?utf-8?B?a1lGWkZoVEhacUg1M3N3emROcG85dUNta29oN2V1VThhbllNZ0RiTEYvMXRo?=
 =?utf-8?B?Q0ZoTjd6NndjbGJRN0paTFp6aVhMVWdyRkF3L2NMZUV5MFVJZ3JNeUdlVHRL?=
 =?utf-8?B?a21IUVJJeVJPWFRYNjVOaW9WVjRTNnIxRE5ubTl0SXZmMWdVQnZVNXJRUFpj?=
 =?utf-8?B?WlVXalcweTUxR0ZvQWI0T3pVSm5YRVMrUzBuanFIckF3aHlOT0psYytzWS9W?=
 =?utf-8?Q?B7/gKaOzIeYxNepI61I2FsIVw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 596f2055-0951-4182-02c9-08dc3df948b0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2024 16:20:05.7158 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xth096icjD3+pIsrIr5KvTwpj+gKN26BGh5kq//17Cb1X1dultIZq8qVFf5KDM70
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8050
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

Am 06.03.24 um 17:06 schrieb Khatri, Sunil:
>
> On 3/6/2024 9:07 PM, Christian König wrote:
>> Am 06.03.24 um 16:13 schrieb Khatri, Sunil:
>>>
>>> On 3/6/2024 8:34 PM, Christian König wrote:
>>>> Am 06.03.24 um 15:29 schrieb Alex Deucher:
>>>>> On Wed, Mar 6, 2024 at 8:04 AM Khatri, Sunil <sukhatri@amd.com> 
>>>>> wrote:
>>>>>>
>>>>>> On 3/6/2024 6:12 PM, Christian König wrote:
>>>>>>> Am 06.03.24 um 11:40 schrieb Khatri, Sunil:
>>>>>>>> On 3/6/2024 3:37 PM, Christian König wrote:
>>>>>>>>> Am 06.03.24 um 10:04 schrieb Sunil Khatri:
>>>>>>>>>> When an  page fault interrupt is raised there
>>>>>>>>>> is a lot more information that is useful for
>>>>>>>>>> developers to analyse the pagefault.
>>>>>>>>> Well actually those information are not that interesting because
>>>>>>>>> they are hw generation specific.
>>>>>>>>>
>>>>>>>>> You should probably rather use the decoded strings here, e.g. 
>>>>>>>>> hub,
>>>>>>>>> client, xcc_id, node_id etc...
>>>>>>>>>
>>>>>>>>> See gmc_v9_0_process_interrupt() an example.
>>>>>>>>> I saw this v9 does provide more information than what v10 and v11
>>>>>>>>> provide like node_id and fault from which die but thats again 
>>>>>>>>> very
>>>>>>>>> specific to IP_VERSION(9, 4, 3)) i dont know why thats 
>>>>>>>>> information
>>>>>>>>> is not there in v10 and v11.
>>>>>>>> I agree to your point but, as of now during a pagefault we are
>>>>>>>> dumping this information which is useful like which client
>>>>>>>> has generated an interrupt and for which src and other information
>>>>>>>> like address. So i think to provide the similar information in the
>>>>>>>> devcoredump.
>>>>>>>>
>>>>>>>> Currently we do not have all this information from either job 
>>>>>>>> or vm
>>>>>>>> being derived from the job during a reset. We surely could add 
>>>>>>>> more
>>>>>>>> relevant information later on as per request but this 
>>>>>>>> information is
>>>>>>>> useful as
>>>>>>>> eventually its developers only who would use the dump file 
>>>>>>>> provided
>>>>>>>> by customer to debug.
>>>>>>>>
>>>>>>>> Below is the information that i dump in devcore and i feel that is
>>>>>>>> good information but new information could be added which could be
>>>>>>>> picked later.
>>>>>>>>
>>>>>>>>> Page fault information
>>>>>>>>> [gfxhub] page fault (src_id:0 ring:24 vmid:3 pasid:32773)
>>>>>>>>> in page starting at address 0x0000000000000000 from client 
>>>>>>>>> 0x1b (UTCL2)
>>>>>>> This is a perfect example what I mean. You record in the patch 
>>>>>>> is the
>>>>>>> client_id, but this is is basically meaningless unless you have 
>>>>>>> access
>>>>>>> to the AMD internal hw documentation.
>>>>>>>
>>>>>>> What you really need is the client in decoded form, in this case
>>>>>>> UTCL2. You can keep the client_id additionally, but the decoded 
>>>>>>> client
>>>>>>> string is mandatory to have I think.
>>>>>>>
>>>>>>> Sure i am capturing that information as i am trying to minimise the
>>>>>>> memory interaction to minimum as we are still in interrupt context
>>>>>>> here that why i recorded the integer information compared to 
>>>>>>> decoding
>>>>>> and writing strings there itself but to postpone till we dump.
>>>>>>
>>>>>> Like decoding to the gfxhub/mmhub based on vmhub/vmid_src and client
>>>>>> string from client id. So are we good to go with the information 
>>>>>> with
>>>>>> the above information of sharing details in devcoredump using the
>>>>>> additional information from pagefault cached.
>>>>> I think amdgpu_vm_fault_info() has everything you need already 
>>>>> (vmhub,
>>>>> status, and addr).  client_id and src_id are just tokens in the
>>>>> interrupt cookie so we know which IP to route the interrupt to. We
>>>>> know what they will be because otherwise we'd be in the interrupt
>>>>> handler for a different IP.  I don't think ring_id has any useful
>>>>> information in this context and vmid and pasid are probably not too
>>>>> useful because they are just tokens to associate the fault with a
>>>>> process.  It would be better to have the process name.
>>>
>>> Just to share context here Alex, i am preparing this for 
>>> devcoredump, my intention was to replicate the information which in 
>>> KMD we are sharing in Dmesg for page faults. If assuming we do not 
>>> add client id specially we would not be able to share enough 
>>> information in devcoredump.
>>> It would be just address and hub(gfxhub/mmhub) and i think that is 
>>> partial information as src id and client id and ip block shares good 
>>> information.
>>>
>>> For process related information we are capturing that information 
>>> part of dump from existing functionality.
>>> **** AMDGPU Device Coredump ****
>>> version: 1
>>> kernel: 6.7.0-amd-staging-drm-next
>>> module: amdgpu
>>> time: 45.084775181
>>> process_name: soft_recovery_p PID: 1780
>>>
>>> Ring timed out details
>>> IP Type: 0 Ring Name: gfx_0.0.0
>>>
>>> Page fault information
>>> [gfxhub] page fault (src_id:0 ring:24 vmid:3 pasid:32773)
>>> in page starting at address 0x0000000000000000 from client 0x1b (UTCL2)
>>> VRAM is lost due to GPU reset!
>>>
>>> Regards
>>> Sunil
>>>
>>>>
>>>> The decoded client name would be really useful I think since the 
>>>> fault handled is a catch all and handles a whole bunch of different 
>>>> clients.
>>>>
>>>> But that should be ideally passed in as const string instead of the 
>>>> hw generation specific client_id.
>>>>
>>>> As long as it's only a pointer we also don't run into the trouble 
>>>> that we need to allocate memory for it.
>>>
>>> I agree but i prefer adding the client id and decoding it in 
>>> devcorecump using soc15_ih_clientid_name[fault_info->client_id]) is 
>>> better else we have to do an sprintf this string to fault_info in 
>>> irq context which is writing more bytes to memory i guess compared 
>>> to an integer:)
>>
>> Well I totally agree that we shouldn't fiddle to much in the 
>> interrupt handler, but exactly what you suggest here won't work.
>>
>> The client_id is hw generation specific, so the only one who has that 
>> is the hw generation specific fault handler. Just compare the defines 
>> here:
>>
>> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c#L83 
>>
>>
>> and here:
>>
>> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/amd/amdgpu/gfxhub_v11_5_0.c#L38 
>>
>>
> Got your point. Let me see but this is a lot of work in irq context. 
> Either we can drop totally the client id thing as alex is suggesting 
> here as its always be same client and src id or let me come up with a 
> patch and see if its acceptable.

Wait a second, I now realized that you are mixing something up here. As 
Alex said the src_id and client_id in the IV are always the same, e.g. 
the VMC or the UTCL2.

This is the client_id which send the IV to IH so that the IH can write 
it into the ring buffer and we end up in the fault handler.

But additional to that we also have a client_id inside the fault and 
that is the value printed in the logs. This is the client which caused 
the fault inside the VMC or UTCL2.

>
> Also as Alex pointed we need to decode from status register which kind 
> of page fault it is (permission, read, write etc) this all is again 
> family specific and thats all in IRQ context. Not feeling good about 
> it but let me try to share all that in a new patch.

Yeah, but that is all hw specific. I'm not sure how best to put it into 
a devcoredump.

Maybe just record the 32bit value and re-design the GMC code to have 
that decoded into a string for both the system log and the devcoredump.



>
> Regards
> Sunil.
>
>> Regards,
>> Christian.
>>
>>>
>>> We can argue on values like pasid and vmid and ring id to be taken 
>>> off if they are totally not useful.
>>>
>>> Regards
>>> Sunil
>>>
>>>>
>>>> Christian.
>>>>
>>>>>
>>>>> Alex
>>>>>
>>>>>> regards
>>>>>> sunil
>>>>>>
>>>>>>> Regards,
>>>>>>> Christian.
>>>>>>>
>>>>>>>> Regards
>>>>>>>> Sunil Khatri
>>>>>>>>
>>>>>>>>> Regards,
>>>>>>>>> Christian.
>>>>>>>>>
>>>>>>>>>> Add all such information in the last cached
>>>>>>>>>> pagefault from an interrupt handler.
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
>>>>>>>>>> ---
>>>>>>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 9 +++++++--
>>>>>>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h | 7 ++++++-
>>>>>>>>>>    drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c | 2 +-
>>>>>>>>>>    drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c | 2 +-
>>>>>>>>>>    drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c  | 2 +-
>>>>>>>>>>    drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c  | 2 +-
>>>>>>>>>>    drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c  | 2 +-
>>>>>>>>>>    7 files changed, 18 insertions(+), 8 deletions(-)
>>>>>>>>>>
>>>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>>>>>>>>> index 4299ce386322..b77e8e28769d 100644
>>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>>>>>>>>> @@ -2905,7 +2905,7 @@ void amdgpu_debugfs_vm_bo_info(struct
>>>>>>>>>> amdgpu_vm *vm, struct seq_file *m)
>>>>>>>>>>     * Cache the fault info for later use by userspace in 
>>>>>>>>>> debugging.
>>>>>>>>>>     */
>>>>>>>>>>    void amdgpu_vm_update_fault_cache(struct amdgpu_device *adev,
>>>>>>>>>> -                  unsigned int pasid,
>>>>>>>>>> +                  struct amdgpu_iv_entry *entry,
>>>>>>>>>>                      uint64_t addr,
>>>>>>>>>>                      uint32_t status,
>>>>>>>>>>                      unsigned int vmhub)
>>>>>>>>>> @@ -2915,7 +2915,7 @@ void amdgpu_vm_update_fault_cache(struct
>>>>>>>>>> amdgpu_device *adev,
>>>>>>>>>> xa_lock_irqsave(&adev->vm_manager.pasids, flags);
>>>>>>>>>>    -    vm = xa_load(&adev->vm_manager.pasids, pasid);
>>>>>>>>>> +    vm = xa_load(&adev->vm_manager.pasids, entry->pasid);
>>>>>>>>>>        /* Don't update the fault cache if status is 0.  In 
>>>>>>>>>> the multiple
>>>>>>>>>>         * fault case, subsequent faults will return a 0 
>>>>>>>>>> status which is
>>>>>>>>>>         * useless for userspace and replaces the useful fault
>>>>>>>>>> status, so
>>>>>>>>>> @@ -2924,6 +2924,11 @@ void amdgpu_vm_update_fault_cache(struct
>>>>>>>>>> amdgpu_device *adev,
>>>>>>>>>>        if (vm && status) {
>>>>>>>>>>            vm->fault_info.addr = addr;
>>>>>>>>>>            vm->fault_info.status = status;
>>>>>>>>>> +        vm->fault_info.client_id = entry->client_id;
>>>>>>>>>> +        vm->fault_info.src_id = entry->src_id;
>>>>>>>>>> +        vm->fault_info.vmid = entry->vmid;
>>>>>>>>>> +        vm->fault_info.pasid = entry->pasid;
>>>>>>>>>> +        vm->fault_info.ring_id = entry->ring_id;
>>>>>>>>>>            if (AMDGPU_IS_GFXHUB(vmhub)) {
>>>>>>>>>>                vm->fault_info.vmhub = AMDGPU_VMHUB_TYPE_GFX;
>>>>>>>>>>                vm->fault_info.vmhub |=
>>>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>>>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>>>>>>>>>> index 047ec1930d12..c7782a89bdb5 100644
>>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>>>>>>>>>> @@ -286,6 +286,11 @@ struct amdgpu_vm_fault_info {
>>>>>>>>>>        uint32_t    status;
>>>>>>>>>>        /* which vmhub? gfxhub, mmhub, etc. */
>>>>>>>>>>        unsigned int    vmhub;
>>>>>>>>>> +    unsigned int    client_id;
>>>>>>>>>> +    unsigned int    src_id;
>>>>>>>>>> +    unsigned int    ring_id;
>>>>>>>>>> +    unsigned int    pasid;
>>>>>>>>>> +    unsigned int    vmid;
>>>>>>>>>>    };
>>>>>>>>>>      struct amdgpu_vm {
>>>>>>>>>> @@ -605,7 +610,7 @@ static inline void
>>>>>>>>>> amdgpu_vm_eviction_unlock(struct amdgpu_vm *vm)
>>>>>>>>>>    }
>>>>>>>>>>      void amdgpu_vm_update_fault_cache(struct amdgpu_device 
>>>>>>>>>> *adev,
>>>>>>>>>> -                  unsigned int pasid,
>>>>>>>>>> +                  struct amdgpu_iv_entry *entry,
>>>>>>>>>>                      uint64_t addr,
>>>>>>>>>>                      uint32_t status,
>>>>>>>>>>                      unsigned int vmhub);
>>>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
>>>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
>>>>>>>>>> index d933e19e0cf5..6b177ce8db0e 100644
>>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
>>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
>>>>>>>>>> @@ -150,7 +150,7 @@ static int 
>>>>>>>>>> gmc_v10_0_process_interrupt(struct
>>>>>>>>>> amdgpu_device *adev,
>>>>>>>>>>            status = RREG32(hub->vm_l2_pro_fault_status);
>>>>>>>>>> WREG32_P(hub->vm_l2_pro_fault_cntl, 1, ~1);
>>>>>>>>>>    -        amdgpu_vm_update_fault_cache(adev, entry->pasid, 
>>>>>>>>>> addr,
>>>>>>>>>> status,
>>>>>>>>>> +        amdgpu_vm_update_fault_cache(adev, entry, addr, status,
>>>>>>>>>>                             entry->vmid_src ? AMDGPU_MMHUB0(0) :
>>>>>>>>>> AMDGPU_GFXHUB(0));
>>>>>>>>>>        }
>>>>>>>>>>    diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
>>>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
>>>>>>>>>> index 527dc917e049..bcf254856a3e 100644
>>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
>>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
>>>>>>>>>> @@ -121,7 +121,7 @@ static int 
>>>>>>>>>> gmc_v11_0_process_interrupt(struct
>>>>>>>>>> amdgpu_device *adev,
>>>>>>>>>>            status = RREG32(hub->vm_l2_pro_fault_status);
>>>>>>>>>> WREG32_P(hub->vm_l2_pro_fault_cntl, 1, ~1);
>>>>>>>>>>    -        amdgpu_vm_update_fault_cache(adev, entry->pasid, 
>>>>>>>>>> addr,
>>>>>>>>>> status,
>>>>>>>>>> +        amdgpu_vm_update_fault_cache(adev, entry, addr, status,
>>>>>>>>>>                             entry->vmid_src ? AMDGPU_MMHUB0(0) :
>>>>>>>>>> AMDGPU_GFXHUB(0));
>>>>>>>>>>        }
>>>>>>>>>>    diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
>>>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
>>>>>>>>>> index 3da7b6a2b00d..e9517ebbe1fd 100644
>>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
>>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
>>>>>>>>>> @@ -1270,7 +1270,7 @@ static int 
>>>>>>>>>> gmc_v7_0_process_interrupt(struct
>>>>>>>>>> amdgpu_device *adev,
>>>>>>>>>>        if (!addr && !status)
>>>>>>>>>>            return 0;
>>>>>>>>>>    -    amdgpu_vm_update_fault_cache(adev, entry->pasid,
>>>>>>>>>> +    amdgpu_vm_update_fault_cache(adev, entry,
>>>>>>>>>>                         ((u64)addr) << AMDGPU_GPU_PAGE_SHIFT,
>>>>>>>>>> status, AMDGPU_GFXHUB(0));
>>>>>>>>>>          if (amdgpu_vm_fault_stop == AMDGPU_VM_FAULT_STOP_FIRST)
>>>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
>>>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
>>>>>>>>>> index d20e5f20ee31..a271bf832312 100644
>>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
>>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
>>>>>>>>>> @@ -1438,7 +1438,7 @@ static int 
>>>>>>>>>> gmc_v8_0_process_interrupt(struct
>>>>>>>>>> amdgpu_device *adev,
>>>>>>>>>>        if (!addr && !status)
>>>>>>>>>>            return 0;
>>>>>>>>>>    -    amdgpu_vm_update_fault_cache(adev, entry->pasid,
>>>>>>>>>> +    amdgpu_vm_update_fault_cache(adev, entry,
>>>>>>>>>>                         ((u64)addr) << AMDGPU_GPU_PAGE_SHIFT,
>>>>>>>>>> status, AMDGPU_GFXHUB(0));
>>>>>>>>>>          if (amdgpu_vm_fault_stop == AMDGPU_VM_FAULT_STOP_FIRST)
>>>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
>>>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
>>>>>>>>>> index 47b63a4ce68b..dc9fb1fb9540 100644
>>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
>>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
>>>>>>>>>> @@ -666,7 +666,7 @@ static int gmc_v9_0_process_interrupt(struct
>>>>>>>>>> amdgpu_device *adev,
>>>>>>>>>>        rw = REG_GET_FIELD(status, 
>>>>>>>>>> VM_L2_PROTECTION_FAULT_STATUS, RW);
>>>>>>>>>>        WREG32_P(hub->vm_l2_pro_fault_cntl, 1, ~1);
>>>>>>>>>>    -    amdgpu_vm_update_fault_cache(adev, entry->pasid, addr,
>>>>>>>>>> status, vmhub);
>>>>>>>>>> +    amdgpu_vm_update_fault_cache(adev, entry, addr, status, 
>>>>>>>>>> vmhub);
>>>>>>>>>>          dev_err(adev->dev,
>>>>>>>>>> "VM_L2_PROTECTION_FAULT_STATUS:0x%08X\n",
>>>>
>>

