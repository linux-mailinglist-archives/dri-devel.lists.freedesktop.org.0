Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E00873A71
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 16:13:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27F3710F0DA;
	Wed,  6 Mar 2024 15:13:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="lwlD27tS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2051.outbound.protection.outlook.com [40.107.244.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D42EB10F090;
 Wed,  6 Mar 2024 15:13:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RKFSH+8b/lK75VtwaIhpIFDByElpM/o0zkuyI9nGsgbNFVdrtP8ALzMSMhegzwFnPr1LejgqgmLGvzhrmmZcZHG+OnUx9kXBEzgl7x5kuaybK542lGWqNLWVCPqqqKHQdRyDEL8K93cH1yzCjI9H7PiWyHhmrWX1u0t8kqMEDIutEL1o958Mtc6xzAp9rdDwhlOayaUnORmk4PSaw/kyWZZ8AxK8QTGng0WBmSc62BjUwIq1lxQvLJEzVmo9ahIykgFGqL4jISxw73aeQ3GDPf5cDn2a+G66BfI+S0E23pEzlFmTZnAAHYy3p7ALCrOAK3wBPWtbML6XiI0g3j6R5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rwPx9PClsIc5hFGe6aktz0wIDrKCnHWI29G47Zkmgn0=;
 b=chWLFpjEu7zrCkKft0vck1LsCZnVcrZiCNPXMvfTwi8VG0NYiWOdN4q0K6qT/crjA7DD/oKtmT60hTDXBOku+pVXukgeu43cfJwxmEgprTPhtYXNB6A0MsvdzR6QOAqoZPfI1olZd3oPIW4vRBNgaShA3+6KE1mGibc+r+q/2XU3o6oqgY60XTHYRib9SFmdDsYdukpxmanR88cHb9EG5GMs3IevTcSb9c5/u79T5ox+pBEqguuj59ab8s+2N9VCgFx0O2OOWdcaI2v60Ps1xNuRz/rEvPeGXd3DZ2nrcjiZk3Vmj6qfueNCp7P8xEwOgzbXXM0XYvBNGzmW13SSKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rwPx9PClsIc5hFGe6aktz0wIDrKCnHWI29G47Zkmgn0=;
 b=lwlD27tSgpb8mzkwUk6Z0ymXX/Sfuw1VvdSE/a5ZgMl5H+0GusooXFInFFvGzC+IKvrsKo8j7oK+c7m616zf6kbvpQujnEOcctPR6VP1zcYnEtRildje5II/EcMdSvwHHIXrmE9594BpFPJhSjG9wjwYcvyFvfsrH3iHDlT8wTk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5596.namprd12.prod.outlook.com (2603:10b6:510:136::13)
 by SA0PR12MB7461.namprd12.prod.outlook.com (2603:10b6:806:24b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.39; Wed, 6 Mar
 2024 15:13:35 +0000
Received: from PH7PR12MB5596.namprd12.prod.outlook.com
 ([fe80::6f48:e3f1:6ff9:75bd]) by PH7PR12MB5596.namprd12.prod.outlook.com
 ([fe80::6f48:e3f1:6ff9:75bd%4]) with mapi id 15.20.7362.019; Wed, 6 Mar 2024
 15:13:35 +0000
Message-ID: <0df75ff4-ece5-4eaa-93bd-6f03ec31ecfa@amd.com>
Date: Wed, 6 Mar 2024 20:43:25 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: cache in more vm fault information
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Alex Deucher <alexdeucher@gmail.com>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
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
From: "Khatri, Sunil" <sukhatri@amd.com>
In-Reply-To: <e5781df5-5244-465e-b986-c1802e1262db@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0198.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e9::7) To PH7PR12MB5596.namprd12.prod.outlook.com
 (2603:10b6:510:136::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5596:EE_|SA0PR12MB7461:EE_
X-MS-Office365-Filtering-Correlation-Id: 11c4a783-65f4-413b-76e9-08dc3deffdf3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x7z0GAnIueqHe2cronWKt6Jw7yYH5VYmFSW8rh3qXYqXRsxGrDrF0/NXrryMeo56G3JkmjMTSKJpsk+AEun+leDO9bXZ04TvB1n0bnY1F+FwyADwzQI+mtl7huuKd6BV9JaEjxm6qYJ5PW2B9JiO7cFq8OC1puGq+CtxKB7png8f5IxhZUHXC4LHYX8rCna+uxlXTWsHGBJ6rp/ZkSHa0W/QTvyFycqBcitTHQhtQYkpNnrw0lQY6W/04zKB7h26n4rtwqI1v5LhhrCkaJ4kuJmoCDwEUmPl36Glb3fNkC3PoAwL8XErSB2BPp0gv6CbJlnURIj43dih8S00m6rMMmEnaCw7Ueiifpo88ssfBUhRkUacgMwMEkutA+bnUZYohmnQpfHW+eyz4Ba6ROzNfwuiDbJZR1OWcy3yhTm46OVRKJwJ5lkZXm0Yckmerg0HFBC7uEX1q0SNMa4R8w76x4IOpNGgyJp6PFQ/rFGudqIVE7zfpas2MYvA1TmgYYDvUJ4WFOKq2sJSdKHfUJ1/vKPz/oLECI+13jzjb7e7oZFnfoHARsmTMIoHAopnyIuuguNFB6IbwpZ8FVNIm9pVMXVWlJO3qkdAHhAbWdNqLqvCmy35HrLj2OUjRodcdCf9SseeJRYetx7+/45gjF0EYa66qxontX92/L8960dIeE4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5596.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Rjkrcm85SisvMTZhQVJxOWhpZExta0lETURNd2lVK2N2a2szY1FRMjZObGta?=
 =?utf-8?B?bk9KU3I0cnluWHJRZmlWK01HQmJxd3dOODltK25jazZ2NSsvYXRESitMYVBH?=
 =?utf-8?B?SjM0bkc0aFJQb1BTaENQckR1YU0zekhlc3VkNjNTK0ltbk5uVkZ1YnN1cVRh?=
 =?utf-8?B?eGFWQ1ZYbnNYWmJDejhQUXY0WG92eUtFUyszbEJHV29FK1dLWFRURmZNdnNr?=
 =?utf-8?B?TkQ4VTdGekpzbEk2cFRzQnp3N1dMNkVqd2pkVVZCQm4wWi95Ui9VVDVYTk9C?=
 =?utf-8?B?aGp1WWpEb3F1eUZEUkdHdmlmeDkrS1hvV0dyQkRvWmVuZEVnQ2krelZwU0hX?=
 =?utf-8?B?ZW1ER0JTN1NHNmFvdVEvRmlpcUFGdURQVzA0WUhrL0w2SzdTWG5UbVpISU9U?=
 =?utf-8?B?L3ZDYjJQUFlCVTJHZU1rTWNKVzdCSDJlbDVzbjdUZVVrVzJVNVB4d2FPL1pC?=
 =?utf-8?B?TjY1TkJuN2hhRWw0WUwyVFk0WjBBT0QyYmIrbXFTYUxtNVpoeVI2MnQ4dTgr?=
 =?utf-8?B?c1M0SHBmc1E3Mm0rSWNlVHg4YWRva1FKOS9ubmdOTlV5SDFTVitpdW9MMGhv?=
 =?utf-8?B?aTFtd2dpN0svM3gwWEdwWWxpMWkweWsxeHZVeGFWanI3TytpMm5YR3NQdHFy?=
 =?utf-8?B?TkpweUlLY2N4Q0tvZm9SZmlEdmUxK2xlQldTd280aDRUVkJBSUJiZHpSc0gw?=
 =?utf-8?B?d1I3NTh6Mk1HVDdJYlMxTndFeWdHN3F3Snpza2xBV0pTR0xXZ1pHbG1NM2l5?=
 =?utf-8?B?WFN2NllUdkMzYmlVelh5WDJkWXB5ZHF5ay9veG9HaFNXeFdRTTFvWUc3bnov?=
 =?utf-8?B?TzJjNjZxcmIvMC9oSU9IcUpYZTJqL2V4YkxJaWEwVE96OERiRFNFbHpFWWgy?=
 =?utf-8?B?VkVsRFFPV2hJMmxwZ25NRnR3UTRXV2pDajRDQ0JGL2VnZjdCa1lxWmhjYVVI?=
 =?utf-8?B?M29lSjNJb2xzcVNBbjhPSVJpZmNaMzBub1ZiUWYwMGRZM250aUJNVXE3bnNz?=
 =?utf-8?B?U3hnSDBJNDJjYysyUHAzYUg3dDBhVTB6WHRzYVpzUmk3YWh1QzFVdmU0TXJt?=
 =?utf-8?B?dkZZdzA4L3NNQVhWaXBVS3FKNGZ2R1RIYkRlSnllbklBR1NvQ2VqYlAxUHRv?=
 =?utf-8?B?T1BBcUk4bm9xNDE5NjJ1eFNvTHA1dWVVNEVpRDhuTmtDQ3FFMm5WR1BIZmdm?=
 =?utf-8?B?QmtsWmk1VmJuSVpUVWhuK1JLZlBSVXdpZmVQNURoMHBsOFhwNmd5VXFBRXVy?=
 =?utf-8?B?ZGhoVGwwclV2TDR2MDlnZlExanY2RkZOZjErb0lHNWI4VU1Fb2lLelNTNnpo?=
 =?utf-8?B?ZllReldlNTZOZThzVlBuWHpXU25ya3JYS1BvYlF1Zjl3M3VXbWpKaDFVQWZU?=
 =?utf-8?B?Z3hBZm9wVU1nM2hoblhiSkRrYkx1ZEtlZ3JZMjF4UE9VWWhUbW9pSU9oU0xu?=
 =?utf-8?B?dlZMalNpMVVrNG5idDR5ZzVEY3JmRzJheGVlU1poMzljZnA1dzVsTThJdnFo?=
 =?utf-8?B?SWg4Y0lpanVFck1Mb1haWEwxZW9BNXNrUzRKQkhFV3dRR25Rdi8yOEwwbklG?=
 =?utf-8?B?Wmc3WU5ybGpKR1BlanZaK2dhNU9UTWRoS1ExWUZTWDhaTzVUOGd3UkhYakNZ?=
 =?utf-8?B?ZE0vMmZ6cENKRWlpaXI2NGZ1bllZNzRZd29jU2N6bHBIbEpERUdQMzM5TUY5?=
 =?utf-8?B?N0xvTDhZRDJYaFY3ZWFOa3VsZFM1OXk4QkV0Uk5oV2ZpQ1kxWFRybVBiS2Zm?=
 =?utf-8?B?aGpGSWx6MG4xV2VaY0kvRVBkZWFCY0VNTUdvUWpEd0puUnhEK3c5ZTFPblNH?=
 =?utf-8?B?NXk2Mkg2RWd3d2F1WGE2N1A3YzRtc3Ntbko4L3hNdWJwN3JGRUROOFQrNlJU?=
 =?utf-8?B?RnpvcGc2K0FEMWtsWGxXTStqd1dDdFoweFpNbkw2RmdTRllBSWljeUprOSt0?=
 =?utf-8?B?eWhyMkhiUFpkNmdVZjE4cjc2ZGMrUW4yd2FYT2o5VnpKNzloVXJmMjk3VVRr?=
 =?utf-8?B?eGV4U2diZ2tmcW5GVHFHcUVnVHM0eng0eXUvbUdmWXYxQkwxRUFKRHY0MHNO?=
 =?utf-8?B?djNEejBuZEg4d2tlRmNhTWpvTHRBT3ZpN2dQWkp1SHVRR21hTE5GaXBZM1ZV?=
 =?utf-8?Q?vVtMBAIju7NAg31b60FonF/g+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11c4a783-65f4-413b-76e9-08dc3deffdf3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5596.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2024 15:13:35.0222 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PFJZIyctRGUKCSXZK6KqEYeMx9Ke14J2QJUbr7U07an1d+DS6w2yyRJfviPlACK3DXmf8JMubj43RPguE/xOBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7461
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


On 3/6/2024 8:34 PM, Christian König wrote:
> Am 06.03.24 um 15:29 schrieb Alex Deucher:
>> On Wed, Mar 6, 2024 at 8:04 AM Khatri, Sunil <sukhatri@amd.com> wrote:
>>>
>>> On 3/6/2024 6:12 PM, Christian König wrote:
>>>> Am 06.03.24 um 11:40 schrieb Khatri, Sunil:
>>>>> On 3/6/2024 3:37 PM, Christian König wrote:
>>>>>> Am 06.03.24 um 10:04 schrieb Sunil Khatri:
>>>>>>> When an  page fault interrupt is raised there
>>>>>>> is a lot more information that is useful for
>>>>>>> developers to analyse the pagefault.
>>>>>> Well actually those information are not that interesting because
>>>>>> they are hw generation specific.
>>>>>>
>>>>>> You should probably rather use the decoded strings here, e.g. hub,
>>>>>> client, xcc_id, node_id etc...
>>>>>>
>>>>>> See gmc_v9_0_process_interrupt() an example.
>>>>>> I saw this v9 does provide more information than what v10 and v11
>>>>>> provide like node_id and fault from which die but thats again very
>>>>>> specific to IP_VERSION(9, 4, 3)) i dont know why thats information
>>>>>> is not there in v10 and v11.
>>>>> I agree to your point but, as of now during a pagefault we are
>>>>> dumping this information which is useful like which client
>>>>> has generated an interrupt and for which src and other information
>>>>> like address. So i think to provide the similar information in the
>>>>> devcoredump.
>>>>>
>>>>> Currently we do not have all this information from either job or vm
>>>>> being derived from the job during a reset. We surely could add more
>>>>> relevant information later on as per request but this information is
>>>>> useful as
>>>>> eventually its developers only who would use the dump file provided
>>>>> by customer to debug.
>>>>>
>>>>> Below is the information that i dump in devcore and i feel that is
>>>>> good information but new information could be added which could be
>>>>> picked later.
>>>>>
>>>>>> Page fault information
>>>>>> [gfxhub] page fault (src_id:0 ring:24 vmid:3 pasid:32773)
>>>>>> in page starting at address 0x0000000000000000 from client 0x1b 
>>>>>> (UTCL2)
>>>> This is a perfect example what I mean. You record in the patch is the
>>>> client_id, but this is is basically meaningless unless you have access
>>>> to the AMD internal hw documentation.
>>>>
>>>> What you really need is the client in decoded form, in this case
>>>> UTCL2. You can keep the client_id additionally, but the decoded client
>>>> string is mandatory to have I think.
>>>>
>>>> Sure i am capturing that information as i am trying to minimise the
>>>> memory interaction to minimum as we are still in interrupt context
>>>> here that why i recorded the integer information compared to decoding
>>> and writing strings there itself but to postpone till we dump.
>>>
>>> Like decoding to the gfxhub/mmhub based on vmhub/vmid_src and client
>>> string from client id. So are we good to go with the information with
>>> the above information of sharing details in devcoredump using the
>>> additional information from pagefault cached.
>> I think amdgpu_vm_fault_info() has everything you need already (vmhub,
>> status, and addr).  client_id and src_id are just tokens in the
>> interrupt cookie so we know which IP to route the interrupt to. We
>> know what they will be because otherwise we'd be in the interrupt
>> handler for a different IP.  I don't think ring_id has any useful
>> information in this context and vmid and pasid are probably not too
>> useful because they are just tokens to associate the fault with a
>> process.  It would be better to have the process name.

Just to share context here Alex, i am preparing this for devcoredump, my 
intention was to replicate the information which in KMD we are sharing 
in Dmesg for page faults. If assuming we do not add client id specially 
we would not be able to share enough information in devcoredump.
It would be just address and hub(gfxhub/mmhub) and i think that is 
partial information as src id and client id and ip block shares good 
information.

For process related information we are capturing that information part 
of dump from existing functionality.
**** AMDGPU Device Coredump ****
version: 1
kernel: 6.7.0-amd-staging-drm-next
module: amdgpu
time: 45.084775181
process_name: soft_recovery_p PID: 1780

Ring timed out details
IP Type: 0 Ring Name: gfx_0.0.0

Page fault information
[gfxhub] page fault (src_id:0 ring:24 vmid:3 pasid:32773)
in page starting at address 0x0000000000000000 from client 0x1b (UTCL2)
VRAM is lost due to GPU reset!

Regards
Sunil

>
> The decoded client name would be really useful I think since the fault 
> handled is a catch all and handles a whole bunch of different clients.
>
> But that should be ideally passed in as const string instead of the hw 
> generation specific client_id.
>
> As long as it's only a pointer we also don't run into the trouble that 
> we need to allocate memory for it.

I agree but i prefer adding the client id and decoding it in devcorecump 
using soc15_ih_clientid_name[fault_info->client_id]) is better else we 
have to do an sprintf this string to fault_info in irq context which is 
writing more bytes to memory i guess compared to an integer:)

We can argue on values like pasid and vmid and ring id to be taken off 
if they are totally not useful.

Regards
Sunil

>
> Christian.
>
>>
>> Alex
>>
>>> regards
>>> sunil
>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>> Regards
>>>>> Sunil Khatri
>>>>>
>>>>>> Regards,
>>>>>> Christian.
>>>>>>
>>>>>>> Add all such information in the last cached
>>>>>>> pagefault from an interrupt handler.
>>>>>>>
>>>>>>> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
>>>>>>> ---
>>>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 9 +++++++--
>>>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h | 7 ++++++-
>>>>>>>    drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c | 2 +-
>>>>>>>    drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c | 2 +-
>>>>>>>    drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c  | 2 +-
>>>>>>>    drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c  | 2 +-
>>>>>>>    drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c  | 2 +-
>>>>>>>    7 files changed, 18 insertions(+), 8 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>>>>>> index 4299ce386322..b77e8e28769d 100644
>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>>>>>> @@ -2905,7 +2905,7 @@ void amdgpu_debugfs_vm_bo_info(struct
>>>>>>> amdgpu_vm *vm, struct seq_file *m)
>>>>>>>     * Cache the fault info for later use by userspace in debugging.
>>>>>>>     */
>>>>>>>    void amdgpu_vm_update_fault_cache(struct amdgpu_device *adev,
>>>>>>> -                  unsigned int pasid,
>>>>>>> +                  struct amdgpu_iv_entry *entry,
>>>>>>>                      uint64_t addr,
>>>>>>>                      uint32_t status,
>>>>>>>                      unsigned int vmhub)
>>>>>>> @@ -2915,7 +2915,7 @@ void amdgpu_vm_update_fault_cache(struct
>>>>>>> amdgpu_device *adev,
>>>>>>> xa_lock_irqsave(&adev->vm_manager.pasids, flags);
>>>>>>>    -    vm = xa_load(&adev->vm_manager.pasids, pasid);
>>>>>>> +    vm = xa_load(&adev->vm_manager.pasids, entry->pasid);
>>>>>>>        /* Don't update the fault cache if status is 0.  In the 
>>>>>>> multiple
>>>>>>>         * fault case, subsequent faults will return a 0 status 
>>>>>>> which is
>>>>>>>         * useless for userspace and replaces the useful fault
>>>>>>> status, so
>>>>>>> @@ -2924,6 +2924,11 @@ void amdgpu_vm_update_fault_cache(struct
>>>>>>> amdgpu_device *adev,
>>>>>>>        if (vm && status) {
>>>>>>>            vm->fault_info.addr = addr;
>>>>>>>            vm->fault_info.status = status;
>>>>>>> +        vm->fault_info.client_id = entry->client_id;
>>>>>>> +        vm->fault_info.src_id = entry->src_id;
>>>>>>> +        vm->fault_info.vmid = entry->vmid;
>>>>>>> +        vm->fault_info.pasid = entry->pasid;
>>>>>>> +        vm->fault_info.ring_id = entry->ring_id;
>>>>>>>            if (AMDGPU_IS_GFXHUB(vmhub)) {
>>>>>>>                vm->fault_info.vmhub = AMDGPU_VMHUB_TYPE_GFX;
>>>>>>>                vm->fault_info.vmhub |=
>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>>>>>>> index 047ec1930d12..c7782a89bdb5 100644
>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>>>>>>> @@ -286,6 +286,11 @@ struct amdgpu_vm_fault_info {
>>>>>>>        uint32_t    status;
>>>>>>>        /* which vmhub? gfxhub, mmhub, etc. */
>>>>>>>        unsigned int    vmhub;
>>>>>>> +    unsigned int    client_id;
>>>>>>> +    unsigned int    src_id;
>>>>>>> +    unsigned int    ring_id;
>>>>>>> +    unsigned int    pasid;
>>>>>>> +    unsigned int    vmid;
>>>>>>>    };
>>>>>>>      struct amdgpu_vm {
>>>>>>> @@ -605,7 +610,7 @@ static inline void
>>>>>>> amdgpu_vm_eviction_unlock(struct amdgpu_vm *vm)
>>>>>>>    }
>>>>>>>      void amdgpu_vm_update_fault_cache(struct amdgpu_device *adev,
>>>>>>> -                  unsigned int pasid,
>>>>>>> +                  struct amdgpu_iv_entry *entry,
>>>>>>>                      uint64_t addr,
>>>>>>>                      uint32_t status,
>>>>>>>                      unsigned int vmhub);
>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
>>>>>>> b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
>>>>>>> index d933e19e0cf5..6b177ce8db0e 100644
>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
>>>>>>> @@ -150,7 +150,7 @@ static int gmc_v10_0_process_interrupt(struct
>>>>>>> amdgpu_device *adev,
>>>>>>>            status = RREG32(hub->vm_l2_pro_fault_status);
>>>>>>>            WREG32_P(hub->vm_l2_pro_fault_cntl, 1, ~1);
>>>>>>>    -        amdgpu_vm_update_fault_cache(adev, entry->pasid, addr,
>>>>>>> status,
>>>>>>> +        amdgpu_vm_update_fault_cache(adev, entry, addr, status,
>>>>>>>                             entry->vmid_src ? AMDGPU_MMHUB0(0) :
>>>>>>> AMDGPU_GFXHUB(0));
>>>>>>>        }
>>>>>>>    diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
>>>>>>> b/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
>>>>>>> index 527dc917e049..bcf254856a3e 100644
>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
>>>>>>> @@ -121,7 +121,7 @@ static int gmc_v11_0_process_interrupt(struct
>>>>>>> amdgpu_device *adev,
>>>>>>>            status = RREG32(hub->vm_l2_pro_fault_status);
>>>>>>>            WREG32_P(hub->vm_l2_pro_fault_cntl, 1, ~1);
>>>>>>>    -        amdgpu_vm_update_fault_cache(adev, entry->pasid, addr,
>>>>>>> status,
>>>>>>> +        amdgpu_vm_update_fault_cache(adev, entry, addr, status,
>>>>>>>                             entry->vmid_src ? AMDGPU_MMHUB0(0) :
>>>>>>> AMDGPU_GFXHUB(0));
>>>>>>>        }
>>>>>>>    diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
>>>>>>> b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
>>>>>>> index 3da7b6a2b00d..e9517ebbe1fd 100644
>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
>>>>>>> @@ -1270,7 +1270,7 @@ static int gmc_v7_0_process_interrupt(struct
>>>>>>> amdgpu_device *adev,
>>>>>>>        if (!addr && !status)
>>>>>>>            return 0;
>>>>>>>    -    amdgpu_vm_update_fault_cache(adev, entry->pasid,
>>>>>>> +    amdgpu_vm_update_fault_cache(adev, entry,
>>>>>>>                         ((u64)addr) << AMDGPU_GPU_PAGE_SHIFT,
>>>>>>> status, AMDGPU_GFXHUB(0));
>>>>>>>          if (amdgpu_vm_fault_stop == AMDGPU_VM_FAULT_STOP_FIRST)
>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
>>>>>>> b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
>>>>>>> index d20e5f20ee31..a271bf832312 100644
>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
>>>>>>> @@ -1438,7 +1438,7 @@ static int gmc_v8_0_process_interrupt(struct
>>>>>>> amdgpu_device *adev,
>>>>>>>        if (!addr && !status)
>>>>>>>            return 0;
>>>>>>>    -    amdgpu_vm_update_fault_cache(adev, entry->pasid,
>>>>>>> +    amdgpu_vm_update_fault_cache(adev, entry,
>>>>>>>                         ((u64)addr) << AMDGPU_GPU_PAGE_SHIFT,
>>>>>>> status, AMDGPU_GFXHUB(0));
>>>>>>>          if (amdgpu_vm_fault_stop == AMDGPU_VM_FAULT_STOP_FIRST)
>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
>>>>>>> b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
>>>>>>> index 47b63a4ce68b..dc9fb1fb9540 100644
>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
>>>>>>> @@ -666,7 +666,7 @@ static int gmc_v9_0_process_interrupt(struct
>>>>>>> amdgpu_device *adev,
>>>>>>>        rw = REG_GET_FIELD(status, VM_L2_PROTECTION_FAULT_STATUS, 
>>>>>>> RW);
>>>>>>>        WREG32_P(hub->vm_l2_pro_fault_cntl, 1, ~1);
>>>>>>>    -    amdgpu_vm_update_fault_cache(adev, entry->pasid, addr,
>>>>>>> status, vmhub);
>>>>>>> +    amdgpu_vm_update_fault_cache(adev, entry, addr, status, 
>>>>>>> vmhub);
>>>>>>>          dev_err(adev->dev,
>>>>>>>            "VM_L2_PROTECTION_FAULT_STATUS:0x%08X\n",
>
