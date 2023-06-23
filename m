Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8AA773BBBC
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 17:34:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9878E10E663;
	Fri, 23 Jun 2023 15:34:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2069.outbound.protection.outlook.com [40.107.223.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1E6110E06A;
 Fri, 23 Jun 2023 15:34:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YIUzYay/GKVxQQXAxTeO/X6SJvKHXzA29L9Yx9Kn3tyu97ZGBpkA8LrZL0/EWIWlx92ftebdL18jc0jfzKokLYBQCR8iKkIAdXpNTRrDjzGrexFOjjrCxs7lqvMMDOgSi7O2rqwiPm7MyGxFUsYTufgUfk9vHxoX+GLLoazF/gMrIWHcpf/2BXzl3eI2aqh5X/vs1Nu/K0hPqguBcVGAGGzjhxZxdZD1woODy9Pd0RIDuSNq54nNzRtTnJTnN8/cYAt4+b37Uwp27CtblA/CC8Wdi6DzASUsJ9TAvicWBKOMWZs3UDkYjBekF/JnA2Bd4GjXCEBR3rZijxWJI2OKog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W+BR+/nLCdTyl5VngNr0JKFVqxzAMgJ64L4+KNW//ms=;
 b=GH4Uu2rlxJzm976XqVNPJPKNHafiLJzSTJqc01ewb/DgCEPFvcbrKErSrhNaXoGP57FVUxQIYhecmYjqTe+Ergcus8V4qPpU2lIGDFKEY7Kk9k5dSRMFrP5Q9v93TVa6S/ZDz03rhzRHIy8ZNradjHSKuZdsZGtcn2sUO4dlSZyqcxqclRitPVo85rNOjGYQC7+ATGOxmZP+9FK5o2Ibq6BRnb/eVEFE42FOpoyq4K7zPVetx9lR4nU0xNv5jLI2iVFRD5sdg4RcYoGNRkXSA9PFIoup2fnaEWHI5kGuQmocBlRi+Doo0G5gNtNEUFXvM7vx452Cy/lT8PbMjrWr1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W+BR+/nLCdTyl5VngNr0JKFVqxzAMgJ64L4+KNW//ms=;
 b=iB0dNGDNwUFUCY+UIzcT9iLTyCHb/HU9CnDKE/i0Z+NNE95gF7ODu5C9s6+zTLXSrSGxPl3U5JX+GnG5qgOKiLzj6rSv6xpbo4avO7UkwEsuMoLlLJyCbOANcEDZQOiMjEFXXhWszOOiTR2kNa6fxH5ldO2zH8pVR3jWxSgp1Iw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH7PR12MB9176.namprd12.prod.outlook.com (2603:10b6:510:2e9::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Fri, 23 Jun
 2023 15:34:26 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::384a:95a4:8819:ee84]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::384a:95a4:8819:ee84%7]) with mapi id 15.20.6521.026; Fri, 23 Jun 2023
 15:34:26 +0000
Message-ID: <923e914f-d367-2f74-9774-f0024d946bdd@amd.com>
Date: Fri, 23 Jun 2023 17:34:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH drm-next v5 03/14] drm: manager to keep track of GPUs VA
 mappings
Content-Language: en-US
To: Danilo Krummrich <dakr@redhat.com>, airlied@gmail.com, daniel@ffwll.ch,
 tzimmermann@suse.de, mripard@kernel.org, corbet@lwn.net, bskeggs@redhat.com,
 Liam.Howlett@oracle.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexdeucher@gmail.com, ogabbay@kernel.org,
 bagasdotme@gmail.com, willy@infradead.org, jason@jlekstrand.net
References: <20230620004217.4700-1-dakr@redhat.com>
 <20230620004217.4700-4-dakr@redhat.com>
 <cf6846ea-5bd0-0b41-b7e6-901c70701751@amd.com>
 <a8edf75b-e0f7-a6c7-7d29-f0d39923549b@redhat.com>
 <41aecd10-9956-0752-2838-34c97834f0c8@amd.com>
 <bcde7ea3-fbab-3a18-e810-64b6589ddb18@redhat.com>
 <86ef9898-c4b6-f4c0-7ad3-3ffe5358365a@amd.com>
 <c1f05169-dec0-22ee-52fa-c8070678394e@redhat.com>
 <2f502150-c1f8-615c-66d9-c3fb59b8c409@redhat.com>
 <4a52ac7c-19ba-8906-5902-fbf75673bf59@amd.com>
 <d18a4ea5-4e8e-be69-84c3-ca658f5cfd24@redhat.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <d18a4ea5-4e8e-be69-84c3-ca658f5cfd24@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0061.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::9) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|PH7PR12MB9176:EE_
X-MS-Office365-Filtering-Correlation-Id: 41e5811d-6aff-490a-260a-08db73ff53c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4pJagz8hribPq1gv36P3eKvRkwgn0ss0Kds3ixbu/1Fk6en+3bExYHvdawO+YKBpQsqXGbiMDcKh/w7Fdx/fCbUcF0v34pxecl2j7mSzGeF25GttcT0HBvW9xxBDrt7f5rHYDu6MyQrhtwZRXDqEm2X+3oesjbi0YpNlG3aYaI33L9Jo7AOx8mUxX75Fr6sRyXY3rhASIhxWNGTq0qW0p4vmgqArN78vKHrRWvltWWTP7dEPAMf0Hxmpnbve1HttqTL3EuxkIRpscmlEzojDCrNwgoRL7RHTpQaPZgEgGLWB9506yCViZoqvYNzuCE4kIQk8QP7Z4uWtD3w/Yg5cbcL871kyt4yyn3F7CZ/+DQaQy+yXHU/v4PmNLGCoPdg3f1ACK0pcFVdsc5WKZI1JgkE/BGuKAvjj48PhZr4ry1La1NlX9sFpo1WsNzf2UwAU2utAvRIUdS1sVI6rdCLjl3tryaTpRexQcKTx2XVBFIxkdrT4niz/QcOZzEmZsboRSpiHZVbQVsSUnxm/+QWCvkWBHnA8/ANtbUbdYKdgkFncDBXVftY2YYE7/ObMGe4asfDugMmLhCTC96UEyCkqpmvQsz/jyj2kPUvFjZIgBSNaEEvFQClJBPH6pV+hOHvmt0PuvFKkUyhgl/0VzZPgRhL3c+vZszUoX8TFFc2q5yM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(39860400002)(136003)(376002)(396003)(346002)(451199021)(6506007)(8676002)(8936002)(31686004)(66476007)(36756003)(66556008)(66946007)(4326008)(478600001)(316002)(5660300002)(66899021)(7416002)(2906002)(41300700001)(54906003)(86362001)(31696002)(6486002)(38100700002)(6512007)(186003)(921005)(83380400001)(6666004)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?LzQxaUx3bHBEd2V1eFRZR004cFpiLzZXN3k2MExVZk1ueWdLWDZkZktIVnkv?=
 =?utf-8?B?YXErL1dLU2FMQ210WFBqakE3TU5LMUZIZ3k0VCtMdVlvOWtiOEFTSUVTL091?=
 =?utf-8?B?cWlDby8vSVFPWGl6TGczTzZ6YWFCK2ZUUzNrSjBlc1poN0ZBQlBNL2gwL0Y5?=
 =?utf-8?B?OEptN0xnZitVWW1Ud2ZUU1YvN1N3WEphVFd5bkhCVmRzSWdlL3ZzY0E4eTZt?=
 =?utf-8?B?aWxKV2hSaGp3NFdLYmptMzAzOHUwRVk1bHBpTGIrbXIzZHFlUjQ3SUozZWM4?=
 =?utf-8?B?ZWg2eW1samh6OUZBaFQ4Z0twaDdRd0NpTFEwTWgra0VYeHpiNlJndnQrdWhZ?=
 =?utf-8?B?UlY5TkJOcTA4ZUVGbGRQNEdaUTdSQm0wWUt5N25VK2lnckt3V2hFVXpabENL?=
 =?utf-8?B?dldpb2RwZ3dQeGdtNlZBN3FJNXJITmx2a21WL1d4c1Q0cW9KOHNzSEUza0po?=
 =?utf-8?B?dXBhNzFaT2xoTzNSS2hZMUNmVGtCVmZXc0RUc2NhSDZDNWF2VEtCUFpibG9x?=
 =?utf-8?B?RFRpWEZMSXpKRWlLNHRpWURkUFFJcWdWQWcwcUJ0TWY0V0NpQjJtNWlFMkRv?=
 =?utf-8?B?YjhEdE5LaFRaaXA1YkVTM1k5YmZzZGJrZndEV2ZkNjA3aGdUUTQ5VWhRWWlr?=
 =?utf-8?B?alhIT2h5OXY1MjZkcldadnpkL1pzY1VWdUladFA5cjFGSVE0T0VRZXMyMmZP?=
 =?utf-8?B?a1JHZTBPdW16c0o5UU1NcTZNNmlTTFp6cHBhUlFZbG1oWkYrZTVJOUJhd3RH?=
 =?utf-8?B?ZFFLdkF0T3YvbFdxK3VVZlc1ZWVNSitlMVNBd3h3MnprOFZ2ajcwRHlxQVYv?=
 =?utf-8?B?UnhqRGFwSWZ3MElrai9GN2ZsMEhpWDQ3d25oaG83WG4vWEpNNS9ENmtab2cy?=
 =?utf-8?B?THZFRE93TC9wZ1k4OGJQWGc3TFhKMlgyNVgvRUtSc0FTa1JYSEtLdTVpSThy?=
 =?utf-8?B?V2lXN1dqeVRpd1hOTzRtUFdiVC82amV3ckg1REZRcVhWTGtqVFBVZ3dvSnhy?=
 =?utf-8?B?aUx3WVppcDBUWURTV2wyU216aVozZlJCWk9mUGlrVU5VNTQ3bEcxaVpHcUNQ?=
 =?utf-8?B?Ky9BY0Y5cUMvK3pNYXpGcFBCZkw0WXh5dGcySzM0RjVQMmh1WExIYm5oYUVS?=
 =?utf-8?B?bjdqdldXaUdJK2xaQVVJNHh0bHZqT3dmdFRzRDhkSmZrTE5TNTNoYnovRTl0?=
 =?utf-8?B?OXVZbW9TZUs5a0JheE9iTU9FbjhWUEpPeUxmQ05aQ1Z5L3ZsT2FZMUJHdGpD?=
 =?utf-8?B?NjJHY28vMllBbER2Z2tqRGZFdUJBS3UrU1ptSU1XdEYyMy9IRlc2SENMbUxw?=
 =?utf-8?B?bGZDV3pLdFV6YXYrdzF3YS94VnhKTnBVZVRiZXgwNkhPWUZtWVdWQ0pMenAr?=
 =?utf-8?B?R3FzVUQydGtvYW9VZnhVbTdZSGROSDA3NENQZEYrSi9mNVVOL0NsWGRPYU1J?=
 =?utf-8?B?VVZuN0pVUnorWkVtKzg2TUNFMGlmVmFlWVZqT1F2ZTNzV2xWb3NuMk1BU2d3?=
 =?utf-8?B?SHo5WjY5bkZic3VXdE9Xc2xLZGpENS90SXVmc05EdFJsaVA2eFBBNWlOMnhF?=
 =?utf-8?B?SndhMU1pRHNqNnE0VVBzUmNEVjZHQzE3dXQ1aGNSY1pOVGRyek80Nlp2NFVr?=
 =?utf-8?B?Ym9Vd0hyQmczbU5zL2UxSkdlZE9CWkR1cjBRdzhnZGxjZno5Zy9qUFQvRlVF?=
 =?utf-8?B?Zi92VjJ5TXNzYTI5Y3pBcmFjbzhmRUx1YWgxN3lsWll4QXhaZ3hhbkhha2Fo?=
 =?utf-8?B?Q3BQYVhZQ1FwMXlHWHovRFZqSVFUTkdrNGRVQlpaa2RuQnhqbFlUT1VGdDBw?=
 =?utf-8?B?bDdDbUdkRDBIcTROTnBJUmc2djNUclQ1dGt0ZGxYR2tLKy80emtqUExxTjJy?=
 =?utf-8?B?VTRlekwxM3oxd3gvMVdEbWZBWmFuRU5mclNUZDNYeUVRSkkzM1cyZ0dWZHh5?=
 =?utf-8?B?WnRxNlVvMEN1Y05SM2ljSEtiMlhYTkpTT3FnT0xMQm5nZUVTVzdiTHk4MUVX?=
 =?utf-8?B?cysyM21uc3hUeDhjZVdvenFDUEQwblAwbXZMQkx5Q1BYeU9jaDV4M25WNGd6?=
 =?utf-8?B?ZnBZeWh1YkVLb1B4MWQ2UFYwNndFR0w3bGZqRTJ4c2tRclJ1VUNmUEc1SEFu?=
 =?utf-8?B?RHlJbCtOOXdMNHhjMnZyZzNXZjlGQlFIQnBGWWcxazR2dDVCNzd1cVNQVWF5?=
 =?utf-8?Q?mPza21kACHVwc8JV9WPoQJJ1oXgkKQeGkZ3MhRM4Rh7d?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41e5811d-6aff-490a-260a-08db73ff53c0
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2023 15:34:26.4166 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cHnF45eJ+195HB/5TVixGA9/cfo9lydwsW7mIQ6gLWVWsqYq2nkY0Hg6EB40qwkj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9176
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
Cc: linux-doc@vger.kernel.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Donald Robson <donald.robson@imgtec.com>,
 Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 23.06.23 um 15:55 schrieb Danilo Krummrich:
> [SNIP]
>>>>> How do you efficiently find only the mappings of a BO in one VM?
>>>>
>>>> Actually, I think this case should even be more efficient than with 
>>>> a BO having a list of GPUVAs (or mappings):
>>>
>>> *than with a BO having a list of VMs:
>>>
>>>>
>>>> Having a list of GPUVAs per GEM, each GPUVA has a pointer to it's 
>>>> VM. Hence, you'd only need to iterate the list of mappings for a 
>>>> given BO and check the mappings VM pointer.
>>
>> Yeah, and that is extremely time consuming if you have tons of 
>> mappings in different VMs.
>>
>>>>
>>>> Having a list of VMs per BO, you'd have to iterate the whole VM to 
>>>> find the mappings having a pointer to the given BO, right?
>>
>> No, you don't seem to understand what I'm suggesting.
>>
>> Currently you have a list of mappings attached to the BO, so when you 
>> need to make sure that a specific BO is up to date in a specific VM 
>> you either need to iterate over the VM or the BO. Neither of that is 
>> a good idea.
>>
>> What you need is a representation of the data used for each BO+VM 
>> combination. In other words another indirection which allows you to 
>> handle all the mappings of a BO inside a VM at once.
>
> Ok, after having a quick look at amdgpu, I can see what you mean.
>
> The missing piece for me was that the BO+VM abstraction itself keeps a 
> list of mappings for this specific BO and VM.
>
> Just to make it obvious for other people following the discussion, let 
> me quickly sketch up how this approach would look like for the GPUVA 
> manager:
>
> 1. We would need a new structure to represent the BO+VM combination, 
> something like:
>
>     struct drm_gpuva_mgr_gem {
>             struct drm_gpuva_manager *mgr;
>         struct drm_gem_object *obj;
>         struct list_head gpuva_list;
>     };
>
> with a less horrible name, hopefully.
>
> 2. Create an instance of struct drm_gpuva_mgr_gem once a GEM becomes 
> associated with a GPUVA manager (VM) and attach it to the GEMs, as by 
> now, "gpuva" list.
>
> In amdgpu, for example, this seems to be the case once a GEM object is 
> opened, since there is one VM per file_priv.
>
> However, for other drivers this could be different, hence drivers 
> would need to take care about this.

Yes, exactly that.

>
>
> 3. Attach GPUVAs to the new gpuva_list of the corresponding instance of
> struct drm_gpuva_mgr_gem.
>
> 4. Drivers would need to clean up the instance of struct 
> drm_gpuva_mgr_gem, once the GEM is not associated with the GPUVA 
> manager anymore.
>
> As pointed out by Christian, this would optimize the "get all mappings 
> backed by a specific BO from a given VM" use case.
>
> The question for me is, do other drivers than amdgpu commonly need this?

I have no idea.

>
> And what does amdgpu need this for? Maybe amdgpu does something we're 
> not doing (yet)?

Basically when we do a CS we need to make sure that the VM used by this 
CS is up to date. For this we walk over the relocation list of BOs and 
check the status of each BO+VM structure.

This is done because we don't want to update all VMs at the same time, 
but rather just those who needs the update.

>
> Christian - I know you didn't ask for "do it the way amdgpu does", 
> instead you voted for keeping it entirely driver specific. But I think 
> everyone is pretty close and I'm still optimistic that we could just 
> generalize this.

Well, you should *not* necessarily do it like amdgpu does! Basically the 
implementation in amdgpu was driven by requirements, e.g. we need that, 
let's do it like this.

It's perfectly possible that other requirements (e.g. focus on Vulkan) 
lead to a completely different implementation.

It's just that ideally I would like to have an implementation where I 
can apply at least the basics to amdgpu as well.

Regards,
Christian.

>
> - Danilo
>
>>
>>>>
>>>> I'd think that a single VM potentially has more mapping entries 
>>>> than a single BO was mapped in multiple VMs.
>>>>
>>>> Another case to consider is the case I originally had in mind 
>>>> choosing this relationship: finding all mappings for a given BO, 
>>>> which I guess all drivers need to do in order to invalidate 
>>>> mappings on BO eviction.
>>>>
>>>> Having a list of VMs per BO, wouldn't you need to iterate all of 
>>>> the VMs entirely?
>>
>> No, see how amdgpu works.
>>
>> Regards,
>> Christian.
>>
>

