Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22765873D59
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 18:20:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13916113378;
	Wed,  6 Mar 2024 17:20:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="5Q3xafnc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2059.outbound.protection.outlook.com [40.107.237.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85749113378;
 Wed,  6 Mar 2024 17:20:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aBiB6GZ6BEcWuEizE/e7jiPxI/hb5RwQz1DMuewOB8cLku4+WGBf6Z/6qiik9TiWTalUFn/ejQyIeMeK8qQuxOmzCNke+tWsRaW4XHl83pzyQ2g8HAqgANJP3/U82ycm5rsiovncja8bBekosFTADEX8y1MqAbW12NSZUqSv2ksbcnKvrwL+AF7Y65Ckoh+Pofx+dQ2HeNEhKmFWIFPD+oNi+a7rNOFuIemAXSNo587B0pQ9ITLIvVvluk/m5veo6dQKjK0QFMMdcNowxkI5SU0gqNdrkYH3rgLx87YgcWaGORV03sOKf21BSUlKMyz0vCSsC0ZvHC4ZOskVgtKevw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/auw1ppbkhNKwQLQJxlmajbw1zETBdLCnP9oCUOYkR8=;
 b=ROzVuWkLk0cmkH+4k8T1jjPP66Bg77H3hOSlx8Ez5VAmbpQw5dNGsKQFoQ29HK6si1WOW/CodSvcrDol2ytdhi2s8y1gug5NR9rjMNU6EvuLqTcHvEZdnKQSDgT0/IF3GnOCHAAtqWfItRVgIZm7S5xD1o/OVPtXCWi0N8LGSSNYu8ydCyLKDSBEjlBDJ0vs8KyPm/tnvGJlNeWXo5QZpWHcIHqEni9ux9fSjl2rjcXB4inWE7BKpxg/iYMOdy+SUl0D6NkFeTigZsOoywiV4ENHKvLZfdrr7Kyqnp7YC7CHVASWa6AmX8wYdJA1TzPPD0d2MRQUBJ+ZYv+Mtd6g/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/auw1ppbkhNKwQLQJxlmajbw1zETBdLCnP9oCUOYkR8=;
 b=5Q3xafnc+QSZgiqg7VBvWpKZ/62nF6Sl3oULLq5nrPPEG8ALTbYN1qBpCcwUjKVXhuykMZ5exXQNXAGUyjghmfqapZjdMebJSjBz5RAQ/OGZ2tqmyOJCC6SAaH2HhUnEgocfBS2yVXm1herlTif4ksfAzoHvYH7Oc97x/oZ4Adk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5596.namprd12.prod.outlook.com (2603:10b6:510:136::13)
 by CYYPR12MB8892.namprd12.prod.outlook.com (2603:10b6:930:be::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.39; Wed, 6 Mar
 2024 17:20:18 +0000
Received: from PH7PR12MB5596.namprd12.prod.outlook.com
 ([fe80::6f48:e3f1:6ff9:75bd]) by PH7PR12MB5596.namprd12.prod.outlook.com
 ([fe80::6f48:e3f1:6ff9:75bd%4]) with mapi id 15.20.7362.019; Wed, 6 Mar 2024
 17:20:17 +0000
Message-ID: <a30f0a98-f9b3-4524-9059-aa6ac2007700@amd.com>
Date: Wed, 6 Mar 2024 22:50:08 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: cache in more vm fault information
Content-Language: en-US
From: "Khatri, Sunil" <sukhatri@amd.com>
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
 <852e4f0e-c743-44c2-a2bb-59f0e8e25e1b@amd.com>
 <0be0df75-9794-4b7a-a975-a5ea86b7d3f3@amd.com>
 <32f94f5c-88c6-4e18-8ac3-ff1b80cbd5d0@amd.com>
In-Reply-To: <32f94f5c-88c6-4e18-8ac3-ff1b80cbd5d0@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0020.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:97::16) To PH7PR12MB5596.namprd12.prod.outlook.com
 (2603:10b6:510:136::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5596:EE_|CYYPR12MB8892:EE_
X-MS-Office365-Filtering-Correlation-Id: ac3ef16e-607b-4354-5b6b-08dc3e01b1a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ugeUbUa+Re/xumX37/YzZ4yuHN8NPDIU9Sr4OCtXjmWafDZuOKTjqY5Er1kq5+enRu6s4snmHZKZRxae4+fKQdAYc7tvATQds93I9R7bHnAgWUXBJ9YNXuOboIGWrO3tryY/iEfrcYu9W75+CgKEXkldDrolXl2GdfojnxC8IGnD0J81rljjbiC25yysD7Gw7qon8Kkei8UQbOWUfPvmGcZ2nruNZ3dXQK9LMo0UEe2I9ST33xt2jryW9RU0qpfOK4xSySF19T2lazARsz9v9NbV+EiG1VCLTVd9gXa1IDCwTBAyavO0RomTmgabGfqjBBOsNemTK/pitOLn8u3yEAibl8c9QZp33KNWEbOYMQ1DPTR6PkkPiz4pn8/9o0Dd3fwUlxPujgoFdXGx7eP1AdZdHXCdvDxCTZJkB+PKoZFxFQcUvoGoZ6Ey/4v5pCTiToqdzAl4F+LZhJdDu6CMNCdJ6TI5UjPec/AIbs3SBfIlAJEJHYQsdqxhE4fx8l5HGYqBZ88v8USbFWsqaT6YwDL4QQy9tXthgPPS6q7rRpP0wediXads3Vc2jksqVlOxUkmp8C5YzNwcIcf/vqhDglcGG53SYlPW1FjNdHVADJ6aTzXgpR0M8LiGFdj5XfwQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5596.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SU5yS2F3b0hhQWxYSUdUckhQWFdFRDQ2Nlc3ZzhSS0lmL2dWZHJSS21KVWg4?=
 =?utf-8?B?OVA3SEw1YTE5OHgzNjhMa2xMek8yZnpjcFBLMngxV2cycTZQbmpNRnFGZ0hE?=
 =?utf-8?B?b2FPdzN3OFJtWnE1NWt3MWJ4aU4yZVJYd2JiQVpvUk9LSS9xNWdxRTJBOGZT?=
 =?utf-8?B?VjJ2ZzZUdUFxaWtuaVZKR2c0Ym5Tak52a2NoZ25UOFF0NkVDQm44MWV2enRx?=
 =?utf-8?B?UHluK1VRUWVSZGJ5aTJlOUF2YzkybFh6SjZLTVBiTWF6L0ZBOThyNmxVQ1lu?=
 =?utf-8?B?Vk1pd0EwcHhnV0xJZ0JxcElDSkV1OUtnRVFEZDBHR1p1dVBYb1JwVnMvZW85?=
 =?utf-8?B?Y3lvbnhwL2RkSDIrelVsNXhpWTJpWDBEdlVzNUd6Q2pZbWF6TGxGNDBoSnVt?=
 =?utf-8?B?dEJyYXJrT3d4b21tQktQeGZpZURWSWFwWnFVclRSZzNhekZ2OWlxejY5QkhF?=
 =?utf-8?B?TFF0eWRPRmVUNzJVanZNczBGTUZaR0VzOHdjMmFDNkM2YXFuQmhobTAxeVBU?=
 =?utf-8?B?eDFBYXlPUFRXQzFVMkxjeVVwTnRMa0Fia0dFaUNwWDBCZ3VaWFBwd2k0Uzh5?=
 =?utf-8?B?NGFsVTdNMFdXeFVhNDBxKzNKZUdBV2NUZUt3WmhpMkJVMXkwUk4raS9SUlVK?=
 =?utf-8?B?Z3h6am1oTzZER1l6RTRNN0xROVhDYWpzdlpaZC8vOGN0d0IzRDgzVFVIVWtx?=
 =?utf-8?B?NHJsSzlFQVFsS0FwYWhIYTE1cHBmL0E1UkN5c2tqYjVCZEFyNlBwcFdDM3lM?=
 =?utf-8?B?SmVQNlRqM3JYejQrcmxqQUFGV3FzZXJiaDl1QmM5U0I3TFY4NFlDaFZwV0JU?=
 =?utf-8?B?VzB4dUFMS3NIN2t0aDNpM1lWNWgyYkdYbnA1K2FoYlJLejJEYVNFK1dLMm1p?=
 =?utf-8?B?dEd6L2hDa24rZHhVa1FxMlp0dnZkNDVzUi9lZHVBQ0ZQUUZLQmVDRks4amhS?=
 =?utf-8?B?Uk5mMGdweHZSMFN0KzNGTW5FUi9wQ1Q3U2wvemZ0UFo5QnRGeUFSUXNTY2Vh?=
 =?utf-8?B?K0gvVEUzN0V5d2NPRXFFSjhvZ0lkN2xnRE1nZXQ0dTB4SGtQUnk4UzJIN2FO?=
 =?utf-8?B?SFppdU1sZHJnUG5ZcWQzTkc0c0g5c0tPTFc0S2JGR3VROUwxVm1lVmhkbjhz?=
 =?utf-8?B?SnpCU1hROUw4NGNYRk5OVmtSRTdFdmg4QnNKUXpod3BXUVdtZ09Kam9rd3Ro?=
 =?utf-8?B?RzVyZ1N0c2themR3cnB6RWxJMTJ5R1pJSXk2b0M2UGtNdG9NN1dLZWxBTEJF?=
 =?utf-8?B?VWRIVEFiRTZHb21qWjZ0Q1ovQmYwOUt1aDJpTUJmQkZ4V1VYUXRvYmRYeHVU?=
 =?utf-8?B?MnFUUkh6QmVxaVk3dDVLZUVZRTM1MWpuWW11Y013VXVlVWVqTnhNcEdScVZ0?=
 =?utf-8?B?am9EZnJhcU9BYWZIMDBmTE9qSmxQZzNzOUhrS01aNlhRSEFoSWtqcnZKNG1w?=
 =?utf-8?B?akFZLytSSkNKL2JlTXlIODhYaHdoMTVtdnVPQitkbnJPcS8zTVlpbWw2SDJC?=
 =?utf-8?B?QU96bTNhSnhYKzNwcnFvREJHaFlCMG9zeDNUVEJOaW9kY21Tb050S2E1S3N2?=
 =?utf-8?B?TFVOR0xreFNQT241cnBZYWtaR0RjL3FFekpPanFZaVRGUVdSa1NiTi8ycGY2?=
 =?utf-8?B?UnB6K3FCMURWbjdJYjFMNFdCTjB1MFM5YjdzZjlaclhjNlQ1cENuUVZRdGtX?=
 =?utf-8?B?dURQd0tyc3BYVW5tOU5CblV6eERUU0R3TUE0VnhtZU41d2Ftbkc1WjdOSWlp?=
 =?utf-8?B?V2RsWjJKUGpZZlZvdmxFcnMvcFYvQXAwK3dLTnR4YTNvYUJ2VU9CK3ZLNE1E?=
 =?utf-8?B?aEF2QnhzTitCWDZzVjdSRDRMbTIxMy9YOEdHMTdoZkdqOEJHNU5nLzMvWjNm?=
 =?utf-8?B?K1JBd1ExMlZlSjNJdUhEMXp2OHlOT2RqWjU1a1cwTDkvZ2x5WEtHQ255d2tO?=
 =?utf-8?B?VnNNSTA4N21EaFBNQ05TaVJmbVBYRkNDTWt0TjYvYUFKRHRpQ0NvSitiYUdl?=
 =?utf-8?B?U3BTUVhvZjNMN3F4YUh5ZTZNSlFxT2FhSlFIMWcvVmJXaXF5K2lHUkJ2TlM4?=
 =?utf-8?B?NHhVWGxSSkI3aU15MFhVWGZLSDJhb0RtQTBadmNTQktGVlRpSU9wZEREc25Z?=
 =?utf-8?Q?Sv93DeqZkdEup/xJNMSjRJlvq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac3ef16e-607b-4354-5b6b-08dc3e01b1a7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5596.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2024 17:20:17.7522 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: efuz8bpgRtVxYfyIsbCCYTQYEA357Um1K0UI1b10sKou1VnCHbiM3eH423IzBvRlxrYjJNuqESUtK7LFfu2OvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8892
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

As discussion we decided that we dont need the client id, srcid, pasid 
etc in page fault information dump. So this patch isnt needed anymore. 
So dropping this patch and will add the new information in the 
devcoredump for pagefault which is all available in existing structures.

As discussed, we just need to provide faulting address, Fault status 
register with gpu family to decode the fault along with process information.

Regards
Sunil Khatri

On 3/6/2024 9:56 PM, Khatri, Sunil wrote:
>
> On 3/6/2024 9:49 PM, Christian König wrote:
>> Am 06.03.24 um 17:06 schrieb Khatri, Sunil:
>>>
>>> On 3/6/2024 9:07 PM, Christian König wrote:
>>>> Am 06.03.24 um 16:13 schrieb Khatri, Sunil:
>>>>>
>>>>> On 3/6/2024 8:34 PM, Christian König wrote:
>>>>>> Am 06.03.24 um 15:29 schrieb Alex Deucher:
>>>>>>> On Wed, Mar 6, 2024 at 8:04 AM Khatri, Sunil <sukhatri@amd.com> 
>>>>>>> wrote:
>>>>>>>>
>>>>>>>> On 3/6/2024 6:12 PM, Christian König wrote:
>>>>>>>>> Am 06.03.24 um 11:40 schrieb Khatri, Sunil:
>>>>>>>>>> On 3/6/2024 3:37 PM, Christian König wrote:
>>>>>>>>>>> Am 06.03.24 um 10:04 schrieb Sunil Khatri:
>>>>>>>>>>>> When an  page fault interrupt is raised there
>>>>>>>>>>>> is a lot more information that is useful for
>>>>>>>>>>>> developers to analyse the pagefault.
>>>>>>>>>>> Well actually those information are not that interesting 
>>>>>>>>>>> because
>>>>>>>>>>> they are hw generation specific.
>>>>>>>>>>>
>>>>>>>>>>> You should probably rather use the decoded strings here, 
>>>>>>>>>>> e.g. hub,
>>>>>>>>>>> client, xcc_id, node_id etc...
>>>>>>>>>>>
>>>>>>>>>>> See gmc_v9_0_process_interrupt() an example.
>>>>>>>>>>> I saw this v9 does provide more information than what v10 
>>>>>>>>>>> and v11
>>>>>>>>>>> provide like node_id and fault from which die but thats 
>>>>>>>>>>> again very
>>>>>>>>>>> specific to IP_VERSION(9, 4, 3)) i dont know why thats 
>>>>>>>>>>> information
>>>>>>>>>>> is not there in v10 and v11.
>>>>>>>>>> I agree to your point but, as of now during a pagefault we are
>>>>>>>>>> dumping this information which is useful like which client
>>>>>>>>>> has generated an interrupt and for which src and other 
>>>>>>>>>> information
>>>>>>>>>> like address. So i think to provide the similar information 
>>>>>>>>>> in the
>>>>>>>>>> devcoredump.
>>>>>>>>>>
>>>>>>>>>> Currently we do not have all this information from either job 
>>>>>>>>>> or vm
>>>>>>>>>> being derived from the job during a reset. We surely could 
>>>>>>>>>> add more
>>>>>>>>>> relevant information later on as per request but this 
>>>>>>>>>> information is
>>>>>>>>>> useful as
>>>>>>>>>> eventually its developers only who would use the dump file 
>>>>>>>>>> provided
>>>>>>>>>> by customer to debug.
>>>>>>>>>>
>>>>>>>>>> Below is the information that i dump in devcore and i feel 
>>>>>>>>>> that is
>>>>>>>>>> good information but new information could be added which 
>>>>>>>>>> could be
>>>>>>>>>> picked later.
>>>>>>>>>>
>>>>>>>>>>> Page fault information
>>>>>>>>>>> [gfxhub] page fault (src_id:0 ring:24 vmid:3 pasid:32773)
>>>>>>>>>>> in page starting at address 0x0000000000000000 from client 
>>>>>>>>>>> 0x1b (UTCL2)
>>>>>>>>> This is a perfect example what I mean. You record in the patch 
>>>>>>>>> is the
>>>>>>>>> client_id, but this is is basically meaningless unless you 
>>>>>>>>> have access
>>>>>>>>> to the AMD internal hw documentation.
>>>>>>>>>
>>>>>>>>> What you really need is the client in decoded form, in this case
>>>>>>>>> UTCL2. You can keep the client_id additionally, but the 
>>>>>>>>> decoded client
>>>>>>>>> string is mandatory to have I think.
>>>>>>>>>
>>>>>>>>> Sure i am capturing that information as i am trying to 
>>>>>>>>> minimise the
>>>>>>>>> memory interaction to minimum as we are still in interrupt 
>>>>>>>>> context
>>>>>>>>> here that why i recorded the integer information compared to 
>>>>>>>>> decoding
>>>>>>>> and writing strings there itself but to postpone till we dump.
>>>>>>>>
>>>>>>>> Like decoding to the gfxhub/mmhub based on vmhub/vmid_src and 
>>>>>>>> client
>>>>>>>> string from client id. So are we good to go with the 
>>>>>>>> information with
>>>>>>>> the above information of sharing details in devcoredump using the
>>>>>>>> additional information from pagefault cached.
>>>>>>> I think amdgpu_vm_fault_info() has everything you need already 
>>>>>>> (vmhub,
>>>>>>> status, and addr).  client_id and src_id are just tokens in the
>>>>>>> interrupt cookie so we know which IP to route the interrupt to. We
>>>>>>> know what they will be because otherwise we'd be in the interrupt
>>>>>>> handler for a different IP.  I don't think ring_id has any useful
>>>>>>> information in this context and vmid and pasid are probably not too
>>>>>>> useful because they are just tokens to associate the fault with a
>>>>>>> process.  It would be better to have the process name.
>>>>>
>>>>> Just to share context here Alex, i am preparing this for 
>>>>> devcoredump, my intention was to replicate the information which 
>>>>> in KMD we are sharing in Dmesg for page faults. If assuming we do 
>>>>> not add client id specially we would not be able to share enough 
>>>>> information in devcoredump.
>>>>> It would be just address and hub(gfxhub/mmhub) and i think that is 
>>>>> partial information as src id and client id and ip block shares 
>>>>> good information.
>>>>>
>>>>> For process related information we are capturing that information 
>>>>> part of dump from existing functionality.
>>>>> **** AMDGPU Device Coredump ****
>>>>> version: 1
>>>>> kernel: 6.7.0-amd-staging-drm-next
>>>>> module: amdgpu
>>>>> time: 45.084775181
>>>>> process_name: soft_recovery_p PID: 1780
>>>>>
>>>>> Ring timed out details
>>>>> IP Type: 0 Ring Name: gfx_0.0.0
>>>>>
>>>>> Page fault information
>>>>> [gfxhub] page fault (src_id:0 ring:24 vmid:3 pasid:32773)
>>>>> in page starting at address 0x0000000000000000 from client 0x1b 
>>>>> (UTCL2)
>>>>> VRAM is lost due to GPU reset!
>>>>>
>>>>> Regards
>>>>> Sunil
>>>>>
>>>>>>
>>>>>> The decoded client name would be really useful I think since the 
>>>>>> fault handled is a catch all and handles a whole bunch of 
>>>>>> different clients.
>>>>>>
>>>>>> But that should be ideally passed in as const string instead of 
>>>>>> the hw generation specific client_id.
>>>>>>
>>>>>> As long as it's only a pointer we also don't run into the trouble 
>>>>>> that we need to allocate memory for it.
>>>>>
>>>>> I agree but i prefer adding the client id and decoding it in 
>>>>> devcorecump using soc15_ih_clientid_name[fault_info->client_id]) 
>>>>> is better else we have to do an sprintf this string to fault_info 
>>>>> in irq context which is writing more bytes to memory i guess 
>>>>> compared to an integer:)
>>>>
>>>> Well I totally agree that we shouldn't fiddle to much in the 
>>>> interrupt handler, but exactly what you suggest here won't work.
>>>>
>>>> The client_id is hw generation specific, so the only one who has 
>>>> that is the hw generation specific fault handler. Just compare the 
>>>> defines here:
>>>>
>>>> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c#L83 
>>>>
>>>>
>>>> and here:
>>>>
>>>> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/amd/amdgpu/gfxhub_v11_5_0.c#L38 
>>>>
>>>>
>>> Got your point. Let me see but this is a lot of work in irq context. 
>>> Either we can drop totally the client id thing as alex is suggesting 
>>> here as its always be same client and src id or let me come up with 
>>> a patch and see if its acceptable.
>>
>> Wait a second, I now realized that you are mixing something up here. 
>> As Alex said the src_id and client_id in the IV are always the same, 
>> e.g. the VMC or the UTCL2.
>>
>> This is the client_id which send the IV to IH so that the IH can 
>> write it into the ring buffer and we end up in the fault handler.
>>
>> But additional to that we also have a client_id inside the fault and 
>> that is the value printed in the logs. This is the client which 
>> caused the fault inside the VMC or UTCL2.
>>
> Yes the value remains the same irrespective of the family. Client 
> always will be VMC/UTCL2 so i think as Alex suggested we can drop this 
> information or just add a hardcoded string for information purposes only.
>>>
>>> Also as Alex pointed we need to decode from status register which 
>>> kind of page fault it is (permission, read, write etc) this all is 
>>> again family specific and thats all in IRQ context. Not feeling good 
>>> about it but let me try to share all that in a new patch.
>>
>> Yeah, but that is all hw specific. I'm not sure how best to put it 
>> into a devcoredump.
>>
>> Maybe just record the 32bit value and re-design the GMC code to have 
>> that decoded into a string for both the system log and the devcoredump.
>>
>> Alex suggested a good way to just share the value of status register 
>> and add family information and let developer use the family/asic id 
>> to check the register value and decode it manually.
>>
> Regards
>
> Sunil.
>
>>
>>
>>>
>>> Regards
>>> Sunil.
>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>>
>>>>> We can argue on values like pasid and vmid and ring id to be taken 
>>>>> off if they are totally not useful.
>>>>>
>>>>> Regards
>>>>> Sunil
>>>>>
>>>>>>
>>>>>> Christian.
>>>>>>
>>>>>>>
>>>>>>> Alex
>>>>>>>
>>>>>>>> regards
>>>>>>>> sunil
>>>>>>>>
>>>>>>>>> Regards,
>>>>>>>>> Christian.
>>>>>>>>>
>>>>>>>>>> Regards
>>>>>>>>>> Sunil Khatri
>>>>>>>>>>
>>>>>>>>>>> Regards,
>>>>>>>>>>> Christian.
>>>>>>>>>>>
>>>>>>>>>>>> Add all such information in the last cached
>>>>>>>>>>>> pagefault from an interrupt handler.
>>>>>>>>>>>>
>>>>>>>>>>>> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
>>>>>>>>>>>> ---
>>>>>>>>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 9 +++++++--
>>>>>>>>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h | 7 ++++++-
>>>>>>>>>>>>    drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c | 2 +-
>>>>>>>>>>>>    drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c | 2 +-
>>>>>>>>>>>>    drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c  | 2 +-
>>>>>>>>>>>>    drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c  | 2 +-
>>>>>>>>>>>>    drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c  | 2 +-
>>>>>>>>>>>>    7 files changed, 18 insertions(+), 8 deletions(-)
>>>>>>>>>>>>
>>>>>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>>>>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>>>>>>>>>>> index 4299ce386322..b77e8e28769d 100644
>>>>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>>>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>>>>>>>>>>> @@ -2905,7 +2905,7 @@ void amdgpu_debugfs_vm_bo_info(struct
>>>>>>>>>>>> amdgpu_vm *vm, struct seq_file *m)
>>>>>>>>>>>>     * Cache the fault info for later use by userspace in 
>>>>>>>>>>>> debugging.
>>>>>>>>>>>>     */
>>>>>>>>>>>>    void amdgpu_vm_update_fault_cache(struct amdgpu_device 
>>>>>>>>>>>> *adev,
>>>>>>>>>>>> -                  unsigned int pasid,
>>>>>>>>>>>> +                  struct amdgpu_iv_entry *entry,
>>>>>>>>>>>>                      uint64_t addr,
>>>>>>>>>>>>                      uint32_t status,
>>>>>>>>>>>>                      unsigned int vmhub)
>>>>>>>>>>>> @@ -2915,7 +2915,7 @@ void amdgpu_vm_update_fault_cache(struct
>>>>>>>>>>>> amdgpu_device *adev,
>>>>>>>>>>>> xa_lock_irqsave(&adev->vm_manager.pasids, flags);
>>>>>>>>>>>>    -    vm = xa_load(&adev->vm_manager.pasids, pasid);
>>>>>>>>>>>> +    vm = xa_load(&adev->vm_manager.pasids, entry->pasid);
>>>>>>>>>>>>        /* Don't update the fault cache if status is 0.  In 
>>>>>>>>>>>> the multiple
>>>>>>>>>>>>         * fault case, subsequent faults will return a 0 
>>>>>>>>>>>> status which is
>>>>>>>>>>>>         * useless for userspace and replaces the useful fault
>>>>>>>>>>>> status, so
>>>>>>>>>>>> @@ -2924,6 +2924,11 @@ void 
>>>>>>>>>>>> amdgpu_vm_update_fault_cache(struct
>>>>>>>>>>>> amdgpu_device *adev,
>>>>>>>>>>>>        if (vm && status) {
>>>>>>>>>>>>            vm->fault_info.addr = addr;
>>>>>>>>>>>>            vm->fault_info.status = status;
>>>>>>>>>>>> +        vm->fault_info.client_id = entry->client_id;
>>>>>>>>>>>> +        vm->fault_info.src_id = entry->src_id;
>>>>>>>>>>>> +        vm->fault_info.vmid = entry->vmid;
>>>>>>>>>>>> +        vm->fault_info.pasid = entry->pasid;
>>>>>>>>>>>> +        vm->fault_info.ring_id = entry->ring_id;
>>>>>>>>>>>>            if (AMDGPU_IS_GFXHUB(vmhub)) {
>>>>>>>>>>>>                vm->fault_info.vmhub = AMDGPU_VMHUB_TYPE_GFX;
>>>>>>>>>>>>                vm->fault_info.vmhub |=
>>>>>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>>>>>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>>>>>>>>>>>> index 047ec1930d12..c7782a89bdb5 100644
>>>>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>>>>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>>>>>>>>>>>> @@ -286,6 +286,11 @@ struct amdgpu_vm_fault_info {
>>>>>>>>>>>>        uint32_t    status;
>>>>>>>>>>>>        /* which vmhub? gfxhub, mmhub, etc. */
>>>>>>>>>>>>        unsigned int    vmhub;
>>>>>>>>>>>> +    unsigned int    client_id;
>>>>>>>>>>>> +    unsigned int    src_id;
>>>>>>>>>>>> +    unsigned int    ring_id;
>>>>>>>>>>>> +    unsigned int    pasid;
>>>>>>>>>>>> +    unsigned int    vmid;
>>>>>>>>>>>>    };
>>>>>>>>>>>>      struct amdgpu_vm {
>>>>>>>>>>>> @@ -605,7 +610,7 @@ static inline void
>>>>>>>>>>>> amdgpu_vm_eviction_unlock(struct amdgpu_vm *vm)
>>>>>>>>>>>>    }
>>>>>>>>>>>>      void amdgpu_vm_update_fault_cache(struct amdgpu_device 
>>>>>>>>>>>> *adev,
>>>>>>>>>>>> -                  unsigned int pasid,
>>>>>>>>>>>> +                  struct amdgpu_iv_entry *entry,
>>>>>>>>>>>>                      uint64_t addr,
>>>>>>>>>>>>                      uint32_t status,
>>>>>>>>>>>>                      unsigned int vmhub);
>>>>>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
>>>>>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
>>>>>>>>>>>> index d933e19e0cf5..6b177ce8db0e 100644
>>>>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
>>>>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
>>>>>>>>>>>> @@ -150,7 +150,7 @@ static int 
>>>>>>>>>>>> gmc_v10_0_process_interrupt(struct
>>>>>>>>>>>> amdgpu_device *adev,
>>>>>>>>>>>>            status = RREG32(hub->vm_l2_pro_fault_status);
>>>>>>>>>>>> WREG32_P(hub->vm_l2_pro_fault_cntl, 1, ~1);
>>>>>>>>>>>>    - amdgpu_vm_update_fault_cache(adev, entry->pasid, addr,
>>>>>>>>>>>> status,
>>>>>>>>>>>> +        amdgpu_vm_update_fault_cache(adev, entry, addr, 
>>>>>>>>>>>> status,
>>>>>>>>>>>> entry->vmid_src ? AMDGPU_MMHUB0(0) :
>>>>>>>>>>>> AMDGPU_GFXHUB(0));
>>>>>>>>>>>>        }
>>>>>>>>>>>>    diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
>>>>>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
>>>>>>>>>>>> index 527dc917e049..bcf254856a3e 100644
>>>>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
>>>>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
>>>>>>>>>>>> @@ -121,7 +121,7 @@ static int 
>>>>>>>>>>>> gmc_v11_0_process_interrupt(struct
>>>>>>>>>>>> amdgpu_device *adev,
>>>>>>>>>>>>            status = RREG32(hub->vm_l2_pro_fault_status);
>>>>>>>>>>>> WREG32_P(hub->vm_l2_pro_fault_cntl, 1, ~1);
>>>>>>>>>>>>    - amdgpu_vm_update_fault_cache(adev, entry->pasid, addr,
>>>>>>>>>>>> status,
>>>>>>>>>>>> +        amdgpu_vm_update_fault_cache(adev, entry, addr, 
>>>>>>>>>>>> status,
>>>>>>>>>>>> entry->vmid_src ? AMDGPU_MMHUB0(0) :
>>>>>>>>>>>> AMDGPU_GFXHUB(0));
>>>>>>>>>>>>        }
>>>>>>>>>>>>    diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
>>>>>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
>>>>>>>>>>>> index 3da7b6a2b00d..e9517ebbe1fd 100644
>>>>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
>>>>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
>>>>>>>>>>>> @@ -1270,7 +1270,7 @@ static int 
>>>>>>>>>>>> gmc_v7_0_process_interrupt(struct
>>>>>>>>>>>> amdgpu_device *adev,
>>>>>>>>>>>>        if (!addr && !status)
>>>>>>>>>>>>            return 0;
>>>>>>>>>>>>    -    amdgpu_vm_update_fault_cache(adev, entry->pasid,
>>>>>>>>>>>> +    amdgpu_vm_update_fault_cache(adev, entry,
>>>>>>>>>>>>                         ((u64)addr) << AMDGPU_GPU_PAGE_SHIFT,
>>>>>>>>>>>> status, AMDGPU_GFXHUB(0));
>>>>>>>>>>>>          if (amdgpu_vm_fault_stop == 
>>>>>>>>>>>> AMDGPU_VM_FAULT_STOP_FIRST)
>>>>>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
>>>>>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
>>>>>>>>>>>> index d20e5f20ee31..a271bf832312 100644
>>>>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
>>>>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
>>>>>>>>>>>> @@ -1438,7 +1438,7 @@ static int 
>>>>>>>>>>>> gmc_v8_0_process_interrupt(struct
>>>>>>>>>>>> amdgpu_device *adev,
>>>>>>>>>>>>        if (!addr && !status)
>>>>>>>>>>>>            return 0;
>>>>>>>>>>>>    -    amdgpu_vm_update_fault_cache(adev, entry->pasid,
>>>>>>>>>>>> +    amdgpu_vm_update_fault_cache(adev, entry,
>>>>>>>>>>>>                         ((u64)addr) << AMDGPU_GPU_PAGE_SHIFT,
>>>>>>>>>>>> status, AMDGPU_GFXHUB(0));
>>>>>>>>>>>>          if (amdgpu_vm_fault_stop == 
>>>>>>>>>>>> AMDGPU_VM_FAULT_STOP_FIRST)
>>>>>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
>>>>>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
>>>>>>>>>>>> index 47b63a4ce68b..dc9fb1fb9540 100644
>>>>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
>>>>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
>>>>>>>>>>>> @@ -666,7 +666,7 @@ static int 
>>>>>>>>>>>> gmc_v9_0_process_interrupt(struct
>>>>>>>>>>>> amdgpu_device *adev,
>>>>>>>>>>>>        rw = REG_GET_FIELD(status, 
>>>>>>>>>>>> VM_L2_PROTECTION_FAULT_STATUS, RW);
>>>>>>>>>>>> WREG32_P(hub->vm_l2_pro_fault_cntl, 1, ~1);
>>>>>>>>>>>>    -    amdgpu_vm_update_fault_cache(adev, entry->pasid, addr,
>>>>>>>>>>>> status, vmhub);
>>>>>>>>>>>> +    amdgpu_vm_update_fault_cache(adev, entry, addr, 
>>>>>>>>>>>> status, vmhub);
>>>>>>>>>>>>          dev_err(adev->dev,
>>>>>>>>>>>> "VM_L2_PROTECTION_FAULT_STATUS:0x%08X\n",
>>>>>>
>>>>
>>
