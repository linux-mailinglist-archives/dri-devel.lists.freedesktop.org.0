Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA49C873B65
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 17:00:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 977AB10EC3F;
	Wed,  6 Mar 2024 16:00:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="dh7+wM4Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2075.outbound.protection.outlook.com [40.107.212.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3318A10EC3F;
 Wed,  6 Mar 2024 16:00:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fBmCxrLuA5iCyhJ3KekpBhDyjtGY07AfYZ9A/8Sl9pv/TIpQvZKyPzOYmJ0g/qCRxAVic7Fa3fhEOgYQov0ascy2L3sRarr17sbuUaGYf7/pGe3tUd3SHPT88i6VYswwLEYBK36/k9iTXznrIn7MfluOeGPdUwhXFYNFYYu+oWRRQ5Xhfx6+c3aPyWu+glI5gspNbd6GjzVpVNINr7xTqqEUDcKX76Tpb1CUBBSKzCmnMcP07os3yGh+skaTUIdy5TPYtPxO+/tZllZc5mpWyHq+gJjoQW6JBY9JxoL6wW5ptSWZWzCPGNP8ajvU+Bmjm+t7uJnAaW0wtVMOX9AN9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bUTTfg8udGygD3Cq3qUwR47qTeNceamnF/G8tfFZcOM=;
 b=mTEEA8geVw9jfK4l7T5qwSXLZap8INwCaRMeQ4mUTds70p8FgitSUrT5YOvqqUggXEc8k323jk97VpOZHhYeqwyWUkt/ojOSWO7IO4YK1ur4CpBvoumeN/p/3AGSLw0NUIL85fTEixv5FIkgttdts5bh5+6c3gn7nIdegfLCYQcdZz3z/9kdctP0bTiQvUOAxqaRLV2s4o2DpmZ2FhdT63lIjs2ztRpKQFcF0Xbg8N7UbV6shFCafYhBRQqZNam4fREOjJcAWwmv5WOaf6v78yAMR1Djearwk6QrQHYnyJhTATTZPYmlMb+iHHstnBOliWkbFbhZih/z/hj8xgLQsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bUTTfg8udGygD3Cq3qUwR47qTeNceamnF/G8tfFZcOM=;
 b=dh7+wM4YUGqAKPc1GyGMDhI2IPPxiQwjbvXr/iBnIBnVQ3CQSxRrDlb3xeuEJ+DCtTeBbwrqk5PcpZKyqx5UqlgbM0rn+N3MWVqj2pSu8lVxM+gtR8LRM/dsGBG/V+arkFP1dUv0Fjpui8/ZZt4uIQF9AHpQwDZ7C6+vvsJzBhs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5596.namprd12.prod.outlook.com (2603:10b6:510:136::13)
 by SN7PR12MB7130.namprd12.prod.outlook.com (2603:10b6:806:2a2::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.38; Wed, 6 Mar
 2024 16:00:06 +0000
Received: from PH7PR12MB5596.namprd12.prod.outlook.com
 ([fe80::6f48:e3f1:6ff9:75bd]) by PH7PR12MB5596.namprd12.prod.outlook.com
 ([fe80::6f48:e3f1:6ff9:75bd%4]) with mapi id 15.20.7362.019; Wed, 6 Mar 2024
 16:00:06 +0000
Message-ID: <6974b239-5f67-4eca-8371-5d28464072f9@amd.com>
Date: Wed, 6 Mar 2024 21:29:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: cache in more vm fault information
Content-Language: en-US
To: Alex Deucher <alexdeucher@gmail.com>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
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
 <CADnq5_PGn_a81HPAd5kO8yi8s_wizdJH-ZT2PC=qs02AFc_Atg@mail.gmail.com>
 <CADnq5_P45VbMZEhbE-hffJG5B519ejLLbXJxEAC17ecZ3TQs_g@mail.gmail.com>
From: "Khatri, Sunil" <sukhatri@amd.com>
In-Reply-To: <CADnq5_P45VbMZEhbE-hffJG5B519ejLLbXJxEAC17ecZ3TQs_g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0118.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:96::19) To PH7PR12MB5596.namprd12.prod.outlook.com
 (2603:10b6:510:136::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5596:EE_|SN7PR12MB7130:EE_
X-MS-Office365-Filtering-Correlation-Id: d978340d-cd4d-4368-0ffd-08dc3df67db0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w8HxC1uCaOd36hDxen8aetwibK9wFSk1uWa/7ZpdlKMH1EkeVlMikP8rFs6cf2diUbhhkoWHCaqUdLHJaAYWZlrv7FqTloAhL+Ke8iJdWEnZkD7a6IS6kKHpfnnXZP2L9IQC5aep6TOP3WZV+e8ubh0AkqGIVW0MPeTP7AqrJpKVj58moCqZCO8zFwMGejuTNMfdI3SgQ+x6MX16nUPDPp/JMRI2KRztaKacVBGkdFmHuluaKIgTJTng91g12yMOLLdRSgWJzlv+K8O3p7g5ab4/OzGJBu9AtjJXFx5WLuVFumeKOIBVT7OBPC/q77/opz5ihkr9JXtlNHPMoSmlznCO/ImBcf9bXeUhPEP6mnGiYK1wORgCqclIUtifRMN1xF8LIIZSHrj64Gjqh98/vK19yM4BGT6g+EFhjEXPddPl9UrkT2BXoarTeuIVbdZkz9taIVrWC3ogF6YMRGTauzcyLKo8jdZcfe26n/9iFaSZ6/HZtntQB2TxEnwpSzQdo/z2DkouTIDaZYyPTSuu4FEWeqdZWaBUZ2B9aSQU59F5B5weR+hDsbc8fBTovFLD2/AGbv1qUAoWmRsaoRsIsGMEFlQQ3gr+LUNOajb2A8tvhQH3t0wNtEvHnXVre+ueihWY45AbrGAh7L3wkcOK+eOrvyfUHM684w41z0e/Q94=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5596.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aTIzZG4yUEFjZHJTUktoWmdPOEZkcExVWUZNS2FaVnRYcFlkc0JuZjM3NDhY?=
 =?utf-8?B?QXF1QmZJc3Z1N25FU2pQbUlmUUx4UTgvM3haQ3lOdU9nemdCRlZtS2JYZFU2?=
 =?utf-8?B?YU8xU2VidUN5eWhicXpabmxNTzF0NytjUHJyd3hkTlhKaTVTRE5uOHdmajc4?=
 =?utf-8?B?YzMvQkZjbGF6b05pcnk4MWkyeGZhVHg1bGpTSkhoMnNvZzNvM0ZZaU9qaVBk?=
 =?utf-8?B?UEVWcjZpTmcybHJ1dnIxM25ScEliR2FTbGxxbDkxYnJmZlhOSDdOMXFjVktG?=
 =?utf-8?B?dmhJZVFYVURMa20xVEFjRlI1bHZGWDhPKzR5TlVXWjdFa2trckgraXB2c3Vl?=
 =?utf-8?B?WFIyaExnNmJycUpGaHZUdnZ2ZVVKcCtlWEtreEg4dnEvRjE3S1BDaHErN0dG?=
 =?utf-8?B?bzdac3Z1WTVwWkdCN0RXRU1IeW5vakQzMWhJTVBLUmpiTjdFa2FrQjhCQzZp?=
 =?utf-8?B?Z1l4MW9DYTFmWGJTU2J4RGErMTdubUlJR0QySDVsOUdTYXRuVGFuakJmNlps?=
 =?utf-8?B?U2xNUzBHS3o4b2xVTEcxOHFDY3NwNXMwdnkyY3g2YUpEUTIzRjBuNTYrSWVU?=
 =?utf-8?B?SUtibFVsMWJ5dnVtY09zUy81ZmlkQzQvYmhZak9udEtHTGU3emhqTEQ0cHhh?=
 =?utf-8?B?cXpGVzZpZGxYdk94VUhXeGp2ck82YWI4QjAwSlhTcWxKS3VzR2tzT0ljdjE4?=
 =?utf-8?B?UTdUeVBuODhNclI2KzFxb1V2ZjhHVXloRCtSQ3ZjalVqa0RaaGJZZ3RXRW16?=
 =?utf-8?B?U0pPVGJPZFMvSU5SaTFOWXdvQUlncHkxYW9Zd2dyMW85aWNyVUl1ZVBldkF3?=
 =?utf-8?B?eHJNbE5xZSs4SEpGbG5HTzFocEJ5WUF2VjFURmdJTG96Snp4Uks5THo2ZHVD?=
 =?utf-8?B?TkdFUkw3Wm4zTXp4Ui84NkNOaTZsWWpEY3cyMUlmaG1lOGttczJCQ1JYYVp0?=
 =?utf-8?B?UWxPTFk4a1JwN09VQW4yczlYWXFicXBpMDBZVUpZaVU0NjAvRDBZM1dUYVh0?=
 =?utf-8?B?L2pUblUyWDZUZXhIYlhDY2pzYWZ1NzBKZUY0ZEwvdVNkblZNWkczazRESmFT?=
 =?utf-8?B?a0x2bEF5eVZRN204RUNjalpsTjFTMnNwZWdvSHhjTm02VUp2bm4wVGllR095?=
 =?utf-8?B?dXhteU5jcE9PSllsNjRmZTA3bG41OGxkdy9OeTNNOVVITHBlMnkwdzNmQmZh?=
 =?utf-8?B?ckptNC95bDk3NUxyUm1iUkw4N0dYTjM5VnJDMU1KSldnREpXa0w4UG5JOHA4?=
 =?utf-8?B?TE1SVmxMSVBoMlBERjhpc3hiVVJucTFrRXkrRGFyQnJQM1A4Zk9RSDd5UVhu?=
 =?utf-8?B?S1Mwb2dmNkJQMWwreS95YXBVU3Z3NmpnVk50MWt5cDJLTXE1WTBCemdERXI5?=
 =?utf-8?B?SWZrNTcxRGdITjZLWWlxSk5qTmJlM29GaTZrb3JHZml2Z0Z3ZFloZWxYRVJm?=
 =?utf-8?B?T3hBKzd3MHZUZ251YnVQa3FGNExlRnJFT1JnaTdQeVNIVlVVYmxwNXR5NXRI?=
 =?utf-8?B?ZG5rUW1hUWpES0dOQ25DZHVKdnMrVGI5d3BWSWFKOWh4bkQ5alJ0cTFxeHk1?=
 =?utf-8?B?TkdYUjhZVi85NjdjLzkrSGh2dTNLOFhJYjZVek4rUEh1dGtDNHF6dUpMTmgx?=
 =?utf-8?B?MlhIQXN3NEhYeGJqMW1xOUhDNlMzQXNydXhOaGNQOVM0dHNLL0tzZVNtM1Zv?=
 =?utf-8?B?bm9VNCtpR2NiOVVBeGRNMjVJbHNxNGZnaVhzMkFRMk42RGE0RG1Pd3BIcS9W?=
 =?utf-8?B?V1BVUkoxbWh2RjZGZDVQL1p4dVd2REh2eitPeFozYXFLZkZVUG1yRlAzNGdy?=
 =?utf-8?B?UGkvU0dIM3FrbDhWRzF3MWJ5WE4rTWdraURqUXBabUFVMS9PSGY5NTFCcTFI?=
 =?utf-8?B?YmF6SE1WQnl5QTl3dUdCMWVIQitwQUtkR1RickhiV2R5bDl6WVZqQ21WUkJm?=
 =?utf-8?B?Q1N5aHZqQlh1S1d5dTFQYms3YVduZjhpMlg5MGlpR3QvSnpXOSsxdkF1YXhB?=
 =?utf-8?B?Sy9WTjZyTUNHNVRMbU5LNkR4d01mUitCbmdhR2E1UEpQaHJNRnA0U0pZcGdi?=
 =?utf-8?B?Skg4WkpUUXhlZnhOc2ZwSm8yT1BBUEJVNDkzTm00YjlBNmdXMFNJQUI5bXE1?=
 =?utf-8?Q?DaOWhyYqhVQAjqCKc2ry4weon?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d978340d-cd4d-4368-0ffd-08dc3df67db0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5596.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2024 16:00:06.3083 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 97G2g+us7luigi6fI97sJsRWvqqsqSv0hWkirDGURmAOICijWYGlsvfNeoBvUmfUQVEVeZeQhDy+1jvhbE5PdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7130
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


On 3/6/2024 9:19 PM, Alex Deucher wrote:
> On Wed, Mar 6, 2024 at 10:32 AM Alex Deucher <alexdeucher@gmail.com> wrote:
>> On Wed, Mar 6, 2024 at 10:13 AM Khatri, Sunil <sukhatri@amd.com> wrote:
>>>
>>> On 3/6/2024 8:34 PM, Christian König wrote:
>>>> Am 06.03.24 um 15:29 schrieb Alex Deucher:
>>>>> On Wed, Mar 6, 2024 at 8:04 AM Khatri, Sunil <sukhatri@amd.com> wrote:
>>>>>> On 3/6/2024 6:12 PM, Christian König wrote:
>>>>>>> Am 06.03.24 um 11:40 schrieb Khatri, Sunil:
>>>>>>>> On 3/6/2024 3:37 PM, Christian König wrote:
>>>>>>>>> Am 06.03.24 um 10:04 schrieb Sunil Khatri:
>>>>>>>>>> When an  page fault interrupt is raised there
>>>>>>>>>> is a lot more information that is useful for
>>>>>>>>>> developers to analyse the pagefault.
>>>>>>>>> Well actually those information are not that interesting because
>>>>>>>>> they are hw generation specific.
>>>>>>>>>
>>>>>>>>> You should probably rather use the decoded strings here, e.g. hub,
>>>>>>>>> client, xcc_id, node_id etc...
>>>>>>>>>
>>>>>>>>> See gmc_v9_0_process_interrupt() an example.
>>>>>>>>> I saw this v9 does provide more information than what v10 and v11
>>>>>>>>> provide like node_id and fault from which die but thats again very
>>>>>>>>> specific to IP_VERSION(9, 4, 3)) i dont know why thats information
>>>>>>>>> is not there in v10 and v11.
>>>>>>>> I agree to your point but, as of now during a pagefault we are
>>>>>>>> dumping this information which is useful like which client
>>>>>>>> has generated an interrupt and for which src and other information
>>>>>>>> like address. So i think to provide the similar information in the
>>>>>>>> devcoredump.
>>>>>>>>
>>>>>>>> Currently we do not have all this information from either job or vm
>>>>>>>> being derived from the job during a reset. We surely could add more
>>>>>>>> relevant information later on as per request but this information is
>>>>>>>> useful as
>>>>>>>> eventually its developers only who would use the dump file provided
>>>>>>>> by customer to debug.
>>>>>>>>
>>>>>>>> Below is the information that i dump in devcore and i feel that is
>>>>>>>> good information but new information could be added which could be
>>>>>>>> picked later.
>>>>>>>>
>>>>>>>>> Page fault information
>>>>>>>>> [gfxhub] page fault (src_id:0 ring:24 vmid:3 pasid:32773)
>>>>>>>>> in page starting at address 0x0000000000000000 from client 0x1b
>>>>>>>>> (UTCL2)
>>>>>>> This is a perfect example what I mean. You record in the patch is the
>>>>>>> client_id, but this is is basically meaningless unless you have access
>>>>>>> to the AMD internal hw documentation.
>>>>>>>
>>>>>>> What you really need is the client in decoded form, in this case
>>>>>>> UTCL2. You can keep the client_id additionally, but the decoded client
>>>>>>> string is mandatory to have I think.
>>>>>>>
>>>>>>> Sure i am capturing that information as i am trying to minimise the
>>>>>>> memory interaction to minimum as we are still in interrupt context
>>>>>>> here that why i recorded the integer information compared to decoding
>>>>>> and writing strings there itself but to postpone till we dump.
>>>>>>
>>>>>> Like decoding to the gfxhub/mmhub based on vmhub/vmid_src and client
>>>>>> string from client id. So are we good to go with the information with
>>>>>> the above information of sharing details in devcoredump using the
>>>>>> additional information from pagefault cached.
>>>>> I think amdgpu_vm_fault_info() has everything you need already (vmhub,
>>>>> status, and addr).  client_id and src_id are just tokens in the
>>>>> interrupt cookie so we know which IP to route the interrupt to. We
>>>>> know what they will be because otherwise we'd be in the interrupt
>>>>> handler for a different IP.  I don't think ring_id has any useful
>>>>> information in this context and vmid and pasid are probably not too
>>>>> useful because they are just tokens to associate the fault with a
>>>>> process.  It would be better to have the process name.
>>> Just to share context here Alex, i am preparing this for devcoredump, my
>>> intention was to replicate the information which in KMD we are sharing
>>> in Dmesg for page faults. If assuming we do not add client id specially
>>> we would not be able to share enough information in devcoredump.
>>> It would be just address and hub(gfxhub/mmhub) and i think that is
>>> partial information as src id and client id and ip block shares good
>>> information.
>> We also need to include the status register value.  That contains the
>> important information (type of access, fault type, client, etc.).
>> Client_id and src_id are only used to route the interrupt to the right
>> software code.  E.g., a different client_id and src_id would be a
>> completely different interrupt (e.g., vblank or fence, etc.).  For GPU
>> page faults the client_id and src_id will always be the same.
>>
>> The devcoredump should also include information about the GPU itself
>> as well (e.g., PCI DID/VID, maybe some of the relevant IP versions).
> We already have "status" which is register "GCVM_L2_PROTECTION_FAULT_STATUS". But the problem here is this all needs to be captured in interrupt context which i want to avoid and this is family specific calls.
>
> chip family would also be good.  And also vram size.
>
> If we have a way to identify the chip and we have the vm status
> register and vm fault address, we can decode all of the fault
> information.
>
> In this patch i am focusing on page fault specific information only[taking one at a time]. But eventually will be adding more information as per the devcoredump JIRA plan. will keep this in todo too for other information that you suggested.

Regards

Sunil

> Alex
>
>> Alex
>>
>>> For process related information we are capturing that information part
>>> of dump from existing functionality.
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
>>>> The decoded client name would be really useful I think since the fault
>>>> handled is a catch all and handles a whole bunch of different clients.
>>>>
>>>> But that should be ideally passed in as const string instead of the hw
>>>> generation specific client_id.
>>>>
>>>> As long as it's only a pointer we also don't run into the trouble that
>>>> we need to allocate memory for it.
>>> I agree but i prefer adding the client id and decoding it in devcorecump
>>> using soc15_ih_clientid_name[fault_info->client_id]) is better else we
>>> have to do an sprintf this string to fault_info in irq context which is
>>> writing more bytes to memory i guess compared to an integer:)
>>>
>>> We can argue on values like pasid and vmid and ring id to be taken off
>>> if they are totally not useful.
>>>
>>> Regards
>>> Sunil
>>>
>>>> Christian.
>>>>
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
>>>>>>>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 9 +++++++--
>>>>>>>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h | 7 ++++++-
>>>>>>>>>>     drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c | 2 +-
>>>>>>>>>>     drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c | 2 +-
>>>>>>>>>>     drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c  | 2 +-
>>>>>>>>>>     drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c  | 2 +-
>>>>>>>>>>     drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c  | 2 +-
>>>>>>>>>>     7 files changed, 18 insertions(+), 8 deletions(-)
>>>>>>>>>>
>>>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>>>>>>>>> index 4299ce386322..b77e8e28769d 100644
>>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>>>>>>>>> @@ -2905,7 +2905,7 @@ void amdgpu_debugfs_vm_bo_info(struct
>>>>>>>>>> amdgpu_vm *vm, struct seq_file *m)
>>>>>>>>>>      * Cache the fault info for later use by userspace in debugging.
>>>>>>>>>>      */
>>>>>>>>>>     void amdgpu_vm_update_fault_cache(struct amdgpu_device *adev,
>>>>>>>>>> -                  unsigned int pasid,
>>>>>>>>>> +                  struct amdgpu_iv_entry *entry,
>>>>>>>>>>                       uint64_t addr,
>>>>>>>>>>                       uint32_t status,
>>>>>>>>>>                       unsigned int vmhub)
>>>>>>>>>> @@ -2915,7 +2915,7 @@ void amdgpu_vm_update_fault_cache(struct
>>>>>>>>>> amdgpu_device *adev,
>>>>>>>>>> xa_lock_irqsave(&adev->vm_manager.pasids, flags);
>>>>>>>>>>     -    vm = xa_load(&adev->vm_manager.pasids, pasid);
>>>>>>>>>> +    vm = xa_load(&adev->vm_manager.pasids, entry->pasid);
>>>>>>>>>>         /* Don't update the fault cache if status is 0.  In the
>>>>>>>>>> multiple
>>>>>>>>>>          * fault case, subsequent faults will return a 0 status
>>>>>>>>>> which is
>>>>>>>>>>          * useless for userspace and replaces the useful fault
>>>>>>>>>> status, so
>>>>>>>>>> @@ -2924,6 +2924,11 @@ void amdgpu_vm_update_fault_cache(struct
>>>>>>>>>> amdgpu_device *adev,
>>>>>>>>>>         if (vm && status) {
>>>>>>>>>>             vm->fault_info.addr = addr;
>>>>>>>>>>             vm->fault_info.status = status;
>>>>>>>>>> +        vm->fault_info.client_id = entry->client_id;
>>>>>>>>>> +        vm->fault_info.src_id = entry->src_id;
>>>>>>>>>> +        vm->fault_info.vmid = entry->vmid;
>>>>>>>>>> +        vm->fault_info.pasid = entry->pasid;
>>>>>>>>>> +        vm->fault_info.ring_id = entry->ring_id;
>>>>>>>>>>             if (AMDGPU_IS_GFXHUB(vmhub)) {
>>>>>>>>>>                 vm->fault_info.vmhub = AMDGPU_VMHUB_TYPE_GFX;
>>>>>>>>>>                 vm->fault_info.vmhub |=
>>>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>>>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>>>>>>>>>> index 047ec1930d12..c7782a89bdb5 100644
>>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>>>>>>>>>> @@ -286,6 +286,11 @@ struct amdgpu_vm_fault_info {
>>>>>>>>>>         uint32_t    status;
>>>>>>>>>>         /* which vmhub? gfxhub, mmhub, etc. */
>>>>>>>>>>         unsigned int    vmhub;
>>>>>>>>>> +    unsigned int    client_id;
>>>>>>>>>> +    unsigned int    src_id;
>>>>>>>>>> +    unsigned int    ring_id;
>>>>>>>>>> +    unsigned int    pasid;
>>>>>>>>>> +    unsigned int    vmid;
>>>>>>>>>>     };
>>>>>>>>>>       struct amdgpu_vm {
>>>>>>>>>> @@ -605,7 +610,7 @@ static inline void
>>>>>>>>>> amdgpu_vm_eviction_unlock(struct amdgpu_vm *vm)
>>>>>>>>>>     }
>>>>>>>>>>       void amdgpu_vm_update_fault_cache(struct amdgpu_device *adev,
>>>>>>>>>> -                  unsigned int pasid,
>>>>>>>>>> +                  struct amdgpu_iv_entry *entry,
>>>>>>>>>>                       uint64_t addr,
>>>>>>>>>>                       uint32_t status,
>>>>>>>>>>                       unsigned int vmhub);
>>>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
>>>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
>>>>>>>>>> index d933e19e0cf5..6b177ce8db0e 100644
>>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
>>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
>>>>>>>>>> @@ -150,7 +150,7 @@ static int gmc_v10_0_process_interrupt(struct
>>>>>>>>>> amdgpu_device *adev,
>>>>>>>>>>             status = RREG32(hub->vm_l2_pro_fault_status);
>>>>>>>>>>             WREG32_P(hub->vm_l2_pro_fault_cntl, 1, ~1);
>>>>>>>>>>     -        amdgpu_vm_update_fault_cache(adev, entry->pasid, addr,
>>>>>>>>>> status,
>>>>>>>>>> +        amdgpu_vm_update_fault_cache(adev, entry, addr, status,
>>>>>>>>>>                              entry->vmid_src ? AMDGPU_MMHUB0(0) :
>>>>>>>>>> AMDGPU_GFXHUB(0));
>>>>>>>>>>         }
>>>>>>>>>>     diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
>>>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
>>>>>>>>>> index 527dc917e049..bcf254856a3e 100644
>>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
>>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
>>>>>>>>>> @@ -121,7 +121,7 @@ static int gmc_v11_0_process_interrupt(struct
>>>>>>>>>> amdgpu_device *adev,
>>>>>>>>>>             status = RREG32(hub->vm_l2_pro_fault_status);
>>>>>>>>>>             WREG32_P(hub->vm_l2_pro_fault_cntl, 1, ~1);
>>>>>>>>>>     -        amdgpu_vm_update_fault_cache(adev, entry->pasid, addr,
>>>>>>>>>> status,
>>>>>>>>>> +        amdgpu_vm_update_fault_cache(adev, entry, addr, status,
>>>>>>>>>>                              entry->vmid_src ? AMDGPU_MMHUB0(0) :
>>>>>>>>>> AMDGPU_GFXHUB(0));
>>>>>>>>>>         }
>>>>>>>>>>     diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
>>>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
>>>>>>>>>> index 3da7b6a2b00d..e9517ebbe1fd 100644
>>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
>>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
>>>>>>>>>> @@ -1270,7 +1270,7 @@ static int gmc_v7_0_process_interrupt(struct
>>>>>>>>>> amdgpu_device *adev,
>>>>>>>>>>         if (!addr && !status)
>>>>>>>>>>             return 0;
>>>>>>>>>>     -    amdgpu_vm_update_fault_cache(adev, entry->pasid,
>>>>>>>>>> +    amdgpu_vm_update_fault_cache(adev, entry,
>>>>>>>>>>                          ((u64)addr) << AMDGPU_GPU_PAGE_SHIFT,
>>>>>>>>>> status, AMDGPU_GFXHUB(0));
>>>>>>>>>>           if (amdgpu_vm_fault_stop == AMDGPU_VM_FAULT_STOP_FIRST)
>>>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
>>>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
>>>>>>>>>> index d20e5f20ee31..a271bf832312 100644
>>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
>>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
>>>>>>>>>> @@ -1438,7 +1438,7 @@ static int gmc_v8_0_process_interrupt(struct
>>>>>>>>>> amdgpu_device *adev,
>>>>>>>>>>         if (!addr && !status)
>>>>>>>>>>             return 0;
>>>>>>>>>>     -    amdgpu_vm_update_fault_cache(adev, entry->pasid,
>>>>>>>>>> +    amdgpu_vm_update_fault_cache(adev, entry,
>>>>>>>>>>                          ((u64)addr) << AMDGPU_GPU_PAGE_SHIFT,
>>>>>>>>>> status, AMDGPU_GFXHUB(0));
>>>>>>>>>>           if (amdgpu_vm_fault_stop == AMDGPU_VM_FAULT_STOP_FIRST)
>>>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
>>>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
>>>>>>>>>> index 47b63a4ce68b..dc9fb1fb9540 100644
>>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
>>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
>>>>>>>>>> @@ -666,7 +666,7 @@ static int gmc_v9_0_process_interrupt(struct
>>>>>>>>>> amdgpu_device *adev,
>>>>>>>>>>         rw = REG_GET_FIELD(status, VM_L2_PROTECTION_FAULT_STATUS,
>>>>>>>>>> RW);
>>>>>>>>>>         WREG32_P(hub->vm_l2_pro_fault_cntl, 1, ~1);
>>>>>>>>>>     -    amdgpu_vm_update_fault_cache(adev, entry->pasid, addr,
>>>>>>>>>> status, vmhub);
>>>>>>>>>> +    amdgpu_vm_update_fault_cache(adev, entry, addr, status,
>>>>>>>>>> vmhub);
>>>>>>>>>>           dev_err(adev->dev,
>>>>>>>>>>             "VM_L2_PROTECTION_FAULT_STATUS:0x%08X\n",
