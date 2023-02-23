Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48AFA6A032A
	for <lists+dri-devel@lfdr.de>; Thu, 23 Feb 2023 08:06:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1545010EADC;
	Thu, 23 Feb 2023 07:06:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20624.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::624])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3838010E4B6;
 Thu, 23 Feb 2023 07:06:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iaBVVkVmKbIs1YhkIo2Pit1GaQ+/43X5vo/wTD+Yh/PJMTQyekGNERnygshj5B+LOvsQslC2jRPxcXuCHskHcFxs5XjAnciHJiEjQjAVFhDXGxP6pWIallic13cQOIHiNv4usJtGnMCbvzReuJZlkzq6v1nxd+Tc2VIUAXQ6xTf8+kvXQVGxeU5p7DnmDOoLLYlUvTR1q3iafSHxcu254X6OWrXJ2kSF6r+qWmn7HF8nVUVzf/mN4G56kDwfUSaiftfKIH+i/jvucZRTXmXd6wfSoDV7H3ebdS769ssSAvJ7smngC26AutVyTM8b8Jhvv6S74j0E2hVyMkBwvaDn/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=12hp1L0CE5xXc/fbwY6OdlqjOQE8NxQBiHNdhdTm8RY=;
 b=g6ZI7qY9z5OqldCzeqtiefoRpFas8REW28yx/q5JbF/1URMZRf/4373Ajgl0d04PRNkZM1qGiJXosE1aZDPCltm465E/2ueIRmFyTgdNDiJXgfx17n/0ejed3vBBQ0PqSykStb+iiNsr1d8SUAlh3cUQAQFc300RaHs9L5tRSZDDBKELNWjovXf36sfjzUcbB7z4HvM05eFfgmpdmOuTAvxR01PFYbrLVJu/OyaTVoXK/2MDxeAkXhlqwbytTpjT9dT1+s9ZmHvUR5MiRUNViy0k8wDEIgl3XNe26IaKhQO7L+jgXlsBYvhDeVAB5nG5B2RGzufPym/QIAuzHDFMWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=12hp1L0CE5xXc/fbwY6OdlqjOQE8NxQBiHNdhdTm8RY=;
 b=26w41dGRXRwS+oJrSryf0kurwbOPlFL8CvbebtJXiD7y1YWUuE0Cr9PG2S10vbT436yMbct5knDnnUzNrPdDpRxoiirs+yqiTO9vwb82EILKzBOX3IpR9hjENpA2/GpwkbhkNDLnhI4IcSBUwmH+actyWDuSn+rnJ83RS9J77ps=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by IA1PR12MB6113.namprd12.prod.outlook.com (2603:10b6:208:3eb::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.19; Thu, 23 Feb
 2023 07:06:21 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a%6]) with mapi id 15.20.6134.021; Thu, 23 Feb 2023
 07:06:19 +0000
Message-ID: <7780a9b9-d6bd-6f3f-9c31-aafacb09db1f@amd.com>
Date: Thu, 23 Feb 2023 08:06:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH drm-next v2 05/16] drm: manager to keep track of GPUs VA
 mappings
Content-Language: en-US
To: Danilo Krummrich <dakr@redhat.com>
References: <20230217134422.14116-1-dakr@redhat.com>
 <20230217134422.14116-6-dakr@redhat.com>
 <70ba382f-1559-289a-4922-ca9c371aaf59@amd.com>
 <cc8eeaf4-31e7-98e4-a712-012fc604e985@redhat.com>
 <29ea3705-5634-c204-c1da-d356b6dfbafc@amd.com>
 <83755119-083d-7d66-fca0-ca306c841d9c@redhat.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <83755119-083d-7d66-fca0-ca306c841d9c@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0016.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::26) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|IA1PR12MB6113:EE_
X-MS-Office365-Filtering-Correlation-Id: 6afd23c3-edc4-434e-7e13-08db156c76b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hRzwlwtWXdobZWGkDUSjCk6sfYkX/LQBRC+lTwxTLbvvOTqf24cuZavVHGJbEJ2XCVx3OM0JSpH3aPw8IK1g5P37AZGW/Xblbz6ohxK+aC6VHEcs0nPPCW62VU6P2yNp9AmdbrpFmGsqm0rZwCD3PqbfG6rhsYKksEklPXb3H4DkmCUL+WmmsBZopvUySrDDwVfH0zR+pipZuP+yp62TT3cZs0iWw0N5i3V1SWdUm8FbAo3be7PF4B3H2UQPZAeM1XoTQCjgDKkjWhFTPjqL70QMya00FrvRGHOw8lat9UAUgnLBdsscuz/PrZJS03U6yHiNbmtdFfqqaqPsRzODIDBSjzj5Cm0LYudXzKK/nuiZOR9RsX+g/uHmO8BEjW682mqS7cnJCi3ytaUglrn3ECv4uPqEAkb531In232GLPeuLmXPFX4e+ZU5AXNMxN3k990/eNYuky6XbuPEmJEvSiEYncdKPlpR17xvePcgglSnuNSCS+rzZwoXlBalK2uX0mO51pT4mCkC8LFgj4R5FRRZrIuJtyZIFLvdv/88DzwRLro6Wow82Txthl+AKmlWY1eXgVvvzG0CJDrfiT/ERhHZzdssOfYMe4tw5LNBoJ5sx93Wqj35CuhqLFqadiEdjNe/gPR8YPql6XZByKI+X98baQPdYJZxryE687av0jxk1mMd8AT6Ou6Ng5Ivssv2yKNeIthmo8c7PlTjujp//ryqk+7gXYcUVWUNAX/UWLA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(396003)(39860400002)(376002)(136003)(346002)(451199018)(36756003)(83380400001)(66574015)(6506007)(6512007)(53546011)(6486002)(26005)(186003)(478600001)(4326008)(86362001)(2616005)(41300700001)(66556008)(31696002)(8676002)(66946007)(66476007)(6916009)(8936002)(2906002)(5660300002)(38100700002)(6666004)(7416002)(316002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aExpRFdXVUkrMlRIV2x5MzhBaU9Ob2kxU1orM2ZXN1RvUTU3a2ZqdHV2aFNF?=
 =?utf-8?B?T1FXOWFWU2RwUVNoZ25wV0J5c0RwU0x5VCtJQUg3MU52M2dLNUFJNW5hRHha?=
 =?utf-8?B?WTE0Q281aWdCTktjQnFpVmdhZ3NLVTBMY3JGMjltb01CMjBMV1ZsU0hEeC9V?=
 =?utf-8?B?dnQvTVFLbFpHaXhNZ0dLTXMrZWlXVmxXNy82QnQwR01LWHY0NnpVNzZoWUJI?=
 =?utf-8?B?dkNtZ0pWVUJ5UGZVcTRRSkR0TXhoQWdBRzdsU0ZiY0F5MG1iSWVhS2UyUlFP?=
 =?utf-8?B?RGJrakpOYTJpU3ZLSDFvUStkcGk3WnVucjJXK0V0VTVWejN4ZjhtUDlCdDhQ?=
 =?utf-8?B?MjlXZmxlMXJaSE5KYmVpT0t3azJ4MS95VlQzR3luaURhWjBNSElXaUkzVVdJ?=
 =?utf-8?B?STd0emRiaEJINjF6VThmQjRWRXF6T0JSNlk2NGJkVTJ4ZlR6T0k0SFhnYkR1?=
 =?utf-8?B?aXA1V0ExSHNmN29pNjg3L1FCTkthcTdxYkx1VVpxeC9MU09nY3dMd2srMjk5?=
 =?utf-8?B?ai9lbU9XNjJBTjdwYVFIWFIzMFZYWktFNzJlcml4UUxpMnVRUTZ1VlQxaTEz?=
 =?utf-8?B?ZFJGT1pyUGtOOGdENTduS3NjekVMOUx3bm53L2IxeDRhRUJocFVncjd4bURC?=
 =?utf-8?B?SUE5Qmc2WTZkL29icDZra1BsRk90a0ZWNDBnWnBkMlNERkdRckdZNm5GalI0?=
 =?utf-8?B?ek9zV2VyMUR1NjJWa0pOSlczbVd4bUlZT055Q3E1dXpySHA2S1o4SnpkYlRH?=
 =?utf-8?B?dkltYnFURjQzYzhSamUvYlM4dVZBV2lJZSs3dWlnVkJ2UzhpZDIrdDFISXRD?=
 =?utf-8?B?bU0zWHhKMUhkWW1IMkxWOThYb2FVYUk4eCtjSGZaZXByK3BIU00zNjltdThv?=
 =?utf-8?B?Z0dQZC9jS3FsUUxQOFJKTE9ZclRzRGp4Y21xNXExY1U0aG80dW9jMHVsK0li?=
 =?utf-8?B?NWxZTC9vcnYzSnRqSXYvaDZTTkdnOGlvNTRhVVY0N2dQWGd5WlkwanNKWnQ5?=
 =?utf-8?B?YytWNUI3bnVhUUlTV01kMlV5Y0lKUm43Z1Z4L3RVOVRYblJBemV6b2lnY1J5?=
 =?utf-8?B?WkswaDhwbDZGdkxDdzQ0aW12QWxwTkJ1T1ZZZGpwSDBDendDVEd6L3dvK2ND?=
 =?utf-8?B?cDBLK2IzdEllWW5jeUxqd1lMWUdTVlNwYTU4enFTSkU5cVpUbnVBZzhaYlYr?=
 =?utf-8?B?RFVUZGpsckh3THJPdkp5Vmc3WU9pUFpCZmlQSVJOdWhJNmd6cDhqV2pRdzIv?=
 =?utf-8?B?cTAxMlZ3bEs0WFRoZU50R0Uwb0FlODZCZnZSeGJaRi9RNGlxMXNmSWE5N0cv?=
 =?utf-8?B?bVVxbmpUd0loSDM3VTJHR3hMRmMrK2tlTlRTQzJBRzMySEp2QVBsakNjUTR6?=
 =?utf-8?B?eXUwSXgvZWVTbHpTelFOT1VmZjRBTUp0OWt6RUpsd3lTT0dXNlplU3hDZGM1?=
 =?utf-8?B?ampsTFRXK0p2UWpwamFDMnlNUVRrSXZzTzdySEtSOFE0ZWRYRkIrTkpEdkxJ?=
 =?utf-8?B?TGpHV2VCaHl1b2lRY250eTdaSU5SblVhNUR2bHBEVXdneTJQWFN2emh3SUZP?=
 =?utf-8?B?My9QbTNnT3JOTzZJZU9EbktlbHJ3K2daTkFFOWJtdDZZdFNQWWNmOWprb3Ev?=
 =?utf-8?B?LzFIajhkZVRJTU83Smw5VzFkUGFXV1RDQ3h0aEJqRnBNa053cEtTZlVLd2FE?=
 =?utf-8?B?K2xSUk1ZQjVrZlJXWVg2UmdqdVRyNUR2UUsyc1E5anpnNE1LWmpydk1pU2h6?=
 =?utf-8?B?T2xLN3VvcGszL1RKWlZ0bWZEcmY5SDZXTm5YN3cyM0FtdTd1N2d3cjNxL1hl?=
 =?utf-8?B?c3ZIMXlYV0UxTlRjcjB4SGJ3Ym1qNVV2b0dyTk9ValJFSUo0NGNpWnp6cTda?=
 =?utf-8?B?Q2QvbXVHRERxVmxKUDJtRG00eGZod1djUlpZUFdvdDBKRi9VZWQ3YU5adCtP?=
 =?utf-8?B?OFYxdDB2Yjl3K3plU0RHOE1Md1JqRHZBUmk0TnM4b2xkM0locFZ1Kzd4dksz?=
 =?utf-8?B?ZHA5T3FtSEVTSHpTb0hTQjZtV0RFeTlENWRMN3h6SnIydHRKOEw5MHgrOVUv?=
 =?utf-8?B?OXEybS9GRDlsM2szbVhZNXNMakJYRytJbHM1NUpPVU1UNUVpMmhXVExKUkM2?=
 =?utf-8?Q?HSIYvlWNbja73LoT7X3bXZlya?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6afd23c3-edc4-434e-7e13-08db156c76b6
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2023 07:06:19.6942 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F6px0+NpN9VG5b6rvdqS2zHy1+TU3vzyCPcH0f8t7OuZ7PP4ktrpeb9XbyVOU/+j
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6113
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
Cc: matthew.brost@intel.com, willy@infradead.org,
 dri-devel@lists.freedesktop.org, corbet@lwn.net, nouveau@lists.freedesktop.org,
 ogabbay@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, boris.brezillon@collabora.com, bskeggs@redhat.com,
 tzimmermann@suse.de, Liam.Howlett@oracle.com, Dave Airlie <airlied@redhat.com>,
 bagasdotme@gmail.com, jason@jlekstrand.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 22.02.23 um 17:40 schrieb Danilo Krummrich:
> On 2/22/23 16:14, Christian König wrote:
>> Am 22.02.23 um 16:07 schrieb Danilo Krummrich:
>>> On 2/22/23 11:25, Christian König wrote:
>>>> Am 17.02.23 um 14:44 schrieb Danilo Krummrich:
>>>
>>> <snip>
>>>
>>>>> +/**
>>>>> + * DOC: Overview
>>>>> + *
>>>>> + * The DRM GPU VA Manager, represented by struct 
>>>>> drm_gpuva_manager keeps track
>>>>> + * of a GPU's virtual address (VA) space and manages the 
>>>>> corresponding virtual
>>>>> + * mappings represented by &drm_gpuva objects. It also keeps 
>>>>> track of the
>>>>> + * mapping's backing &drm_gem_object buffers.
>>>>> + *
>>>>> + * &drm_gem_object buffers maintain a list (and a corresponding 
>>>>> list lock) of
>>>>> + * &drm_gpuva objects representing all existent GPU VA mappings 
>>>>> using this
>>>>> + * &drm_gem_object as backing buffer.
>>>>> + *
>>>>> + * If the &DRM_GPUVA_MANAGER_REGIONS feature is enabled, a GPU VA 
>>>>> mapping can
>>>>> + * only be created within a previously allocated 
>>>>> &drm_gpuva_region, which
>>>>> + * represents a reserved portion of the GPU VA space. GPU VA 
>>>>> mappings are not
>>>>> + * allowed to span over a &drm_gpuva_region's boundary.
>>>>> + *
>>>>> + * GPU VA regions can also be flagged as sparse, which allows 
>>>>> drivers to create
>>>>> + * sparse mappings for a whole GPU VA region in order to support 
>>>>> Vulkan
>>>>> + * 'Sparse Resources'.
>>>>
>>>> Well since we have now found that there is absolutely no technical 
>>>> reason for having those regions could we please drop them?
>>>
>>> I disagree this was the outcome of our previous discussion.
>>>
>>> In nouveau I still need them to track the separate sparse page 
>>> tables and, as you confirmed previously, Nvidia cards are not the 
>>> only cards supporting this feature.
>>>
>>> The second reason is that with regions we can avoid merging between 
>>> buffers, which saves some effort. However, I agree that this 
>>> argument by itself probably doesn't hold too much, since you've 
>>> pointed out in a previous mail that:
>>>
>>> <cite>
>>> 1) If we merge and decide to only do that inside certain boundaries 
>>> then those boundaries needs to be provided and checked against. This 
>>> burns quite some CPU cycles
>>>
>>> 2) If we just merge what we can we might have extra page table 
>>> updates which cost time and could result in undesired side effects.
>>>
>>> 3) If we don't merge at all we have additional housekeeping for the 
>>> mappings and maybe hw restrictions.
>>> </cite>
>>>
>>> However, if a driver uses regions to track its separate sparse page 
>>> tables anyway it gets 1) for free, which is a nice synergy.
>>>
>>> I totally agree that regions aren't for everyone though. Hence, I 
>>> made them an optional feature and by default regions are disabled. 
>>> In order to use them drm_gpuva_manager_init() must be called with 
>>> the DRM_GPUVA_MANAGER_REGIONS feature flag.
>>>
>>> I really would not want to open code regions or have two GPUVA 
>>> manager instances in nouveau to track sparse page tables. That would 
>>> be really messy, hence I hope we can agree on this to be an optional 
>>> feature.
>>
>> I absolutely don't think that this is a good idea then. This separate 
>> handling of sparse page tables is completely Nouveau specific.
>
> Actually, I rely on what you said in a previous mail when I say it's, 
> potentially, not specific to nouveau.
>
> <cite>
> This sounds similar to what AMD hw used to have up until gfx8 (I 
> think), basically sparse resources where defined through a separate 
> mechanism to the address resolution of the page tables. I won't rule 
> out that other hardware has similar approaches.
> </cite>

Ok, sounds like I didn't made my point here clear: AMD does have that 
same mechanism for older hw you try to implement here for Nouveau, but 
we have *abandoned* it because it is to much trouble and especially 
overhead to support! In other words we have said "Ok we would need two 
separate components to cleanly handle that, one for newer hw and one for 
older hw.".

What you now try to do is to write one component which works for both. 
We have already exercised this idea and came to the conclusion that it's 
not a good path to go down. So you're basically just repeating our mistake.

I mean if it's just for Nouveau then I would say feel free to do 
whatever you want, but since this component is supposed to be used by 
more drivers then I strongly think we need to tackle this from a 
different side.

>> Even when it's optional feature mixing this into the common handling 
>> is exactly what I pointed out as not properly separating between 
>> hardware specific and hardware agnostic functionality.
>
> Optionally having regions is *not* a hardware specific concept, 
> drivers might use it for a hardware specific purpose though. Which 
> potentially is is the case for almost every DRM helper.
>
> Drivers can use regions only for the sake of not merging between 
> buffer boundaries as well. Some drivers might prefer this over "never 
> merge" or "always merge", depending on the cost of re-organizing page 
> tables for unnecessary splits/merges, without having the need of 
> tracking separate sparse page tables.
>
> Its just that I think *if* a driver needs to track separate sparse 
> page tables anyways its a nice synergy since then there is no extra 
> cost for getting this optimization.

Well exactly that's the point: I really don't believe that this comes 
without extra costs.

What we could maybe do is to have an two separate functions, one for 
updating the data structures and one for merging. When you now call the 
merging function with a limit you don't get mappings merged over that 
limit and if you don't call the merging function at all you don't get 
merges.

But we should have definitely not have the tracking of the ranges inside 
the common component. This is something separated.

>> This is exactly the problem we ran into with TTM as well and I've 
>> spend a massive amount of time to clean that up again. >
>
> Admittedly, I don't know what problems you are referring to. However, 
> I don't see which kind of trouble it could cause by allowing drivers 
> to track regions optionally.

Take a look at my 2020 presentation about TTM on FOSDEM.

Regards,
Christian.

>
>> Regards,
>> Christian.
>>
>>>
>>>>
>>>> I don't really see a need for them any more.
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>
>>
>

