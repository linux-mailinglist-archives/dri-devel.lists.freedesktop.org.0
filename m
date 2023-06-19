Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B85734F84
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jun 2023 11:20:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04D8F10E127;
	Mon, 19 Jun 2023 09:20:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20613.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::613])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C934410E113;
 Mon, 19 Jun 2023 09:20:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e+UbyqgCxkOhQqlxK+xyzvqz8y5sc9o7LvdeNkdNwhoA8iSXtsG5g4P0YIe4wG013mghDp7BB0o5zCxOn6oRA1+u0jFKaPhch2BY99UJsX0OyaZ3D308aoFE8YxNxoYZlNATohR47O80ebnVyzLE6Mm2mJzct7/i4FoUFKsQETzjWZenIIjm2aWWRSO3VBazIzztleBTOL6MqbxSQ1OO4XJ54ngWI6lG3XFIiLjp/dBerIugx3+qwHtCdpQtfu17LRocbiYZPAm5HZRgvx0MNDSTGsY3+luomGZX45Q1IYqh4x4wL5Nvdhmkd55hUO2OsuFgC3hvfdQd4W2+oN3xcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IEOeGEy3JVieyT+1fbUwnEz7JnUR7qb00XdhspVHfsc=;
 b=oODlmLLJXKd+3US50OugzKqe65qTXDWvZWkEdCo8ApkL+GmV6bsce//J2ZSTVEj6OCGwYeinef+7cry6ts7qF6+C5qGqARCt07LCngATvJE6OpYGNeG6ys5hyx+e6wlU39RXv74ivSKib7vp2f6FvsHC2wEm30/DhdqMSBBiFKXxQuYlDzY5z7gJOLOfHrP7i6CDWXuzwIG1QLysjujpqguKXxiGF/+L0gbuLu6WQHiz5w1Oh1krRat5/4Db9gIK/PDl9/Y5ZwMevEd4VuyIsXXIy04/uxmHXsjUR3WQf1bC8gjdnxJz7QmcKkid9xSTM3floQKkjjH+jB1SeCUvFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IEOeGEy3JVieyT+1fbUwnEz7JnUR7qb00XdhspVHfsc=;
 b=ML78pAtw1GpcJLUULks3AyhWm8iGeqo4CuJiFjWsDOGUBjDEtt3xWagTvqA/RXS4Ew3gy2f2Z7dygmqjwxJPOi7amq8bZ5iSo1fO4tuYL7+hrpjqnCvh2/s3D8umW9jzyQvKHs7Ko7yP2dO0Kk3qSs0c/cTh3Z+GfKh9SrwdV2M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BN9PR12MB5306.namprd12.prod.outlook.com (2603:10b6:408:103::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Mon, 19 Jun
 2023 09:20:13 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::384a:95a4:8819:ee84]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::384a:95a4:8819:ee84%7]) with mapi id 15.20.6500.036; Mon, 19 Jun 2023
 09:20:12 +0000
Message-ID: <94f9393a-17fe-321d-c4e1-e12663dc3106@amd.com>
Date: Mon, 19 Jun 2023 11:20:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 01/13] drm: execution context for GEM buffers v4
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>,
 Boris Brezillon <boris.brezillon@collabora.com>
References: <20230504115159.2245-1-christian.koenig@amd.com>
 <20230504115159.2245-2-christian.koenig@amd.com>
 <20230614142339.04df5111@collabora.com>
 <299e0ff6-bd0a-fa8d-acda-8b3ce22d6ab6@amd.com>
 <20230614150252.6ceb42fd@collabora.com>
 <20230617135434.7dd3a25d@collabora.com>
 <5058c4dd-da1b-9495-5ced-c4d5a5749194@shipmail.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <5058c4dd-da1b-9495-5ced-c4d5a5749194@shipmail.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0212.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::11) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|BN9PR12MB5306:EE_
X-MS-Office365-Filtering-Correlation-Id: bf197ca9-12e1-4c22-e1f8-08db70a6628f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3W8FrujrCCdLW2tNMtuF7QUSSmt7I1wo7moFcs2BeSZzT6+rJP91KOrbEI+91w3VJyh4K6t8jJz5c8S55fGHjb3Vn0xl0S2+Da7LBnKnTwg/ng/M7ZKOMFFBHgcL6PyEy7OxGzqQJj+FkkJnxMvb53LckcRvmgBOuVELnJI/symyGDjP6CJT0mH3cRaQDJm3nXBKPndVTRX/HGlfFUBWAIf7EHLCZ7S2MkbrHoSb549T6MC1fKE4jSsbrbTxCylus6Tt8mC1GxeryzO66Au2px0IMfPjdHmmrpMi87gTpBztGC1tq09X7QVT4kyHBhP3Git5zg9WfVRWA4Xzne1+yJ5wFNvP5KjzyBagDXj3BT+mWwu+bBCdFQtHuXoAOzefDzYtz3ap5GCrL9QqWrPBEaZwsR0eeUGjLmg6drHCEZSnQ3+A5DJZ2Amd/41S4vuLulj12t/V/HDfyjT/jA6U/x7NA3X1ICGqvQzuV1GD3Wo8+DxwjrfEg7ck4SUAWoqtP3MPdHALKAIJIWQ2lhmo0OBX6BXVoS+qG+txvQxjAtg6v6DVlzbzkbdKgJpKUZFgA3L8SkIg/P6OP0QPdtajZEEgnlzXau63o2+avnrNBlJVuEdWvy06o54txvc6aXsWFETNiLsvuvfcFWB3fmevQA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(366004)(396003)(376002)(39860400002)(346002)(451199021)(31696002)(66574015)(31686004)(86362001)(83380400001)(38100700002)(41300700001)(8936002)(8676002)(5660300002)(66556008)(66476007)(66946007)(316002)(2616005)(6506007)(6512007)(6486002)(6666004)(186003)(478600001)(110136005)(4326008)(2906002)(36756003)(30864003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V1pYdTlaRjB6dkNjNXVTUUM0dkFUenRrb2VxTDhMM3NTTWlBU3YxaGNLMzBR?=
 =?utf-8?B?REcxYXlROGhwVEhacWNDMGpyWXo2SlFBTmhYOGlycitBM080UlJhMDBrcXlh?=
 =?utf-8?B?NFc5dURJNjNZTjV5U0piRmR4ZktRZUdQTUsvNWNaMkNyK0RxNTlCY3J4RjFM?=
 =?utf-8?B?OUV5cUdTRDVHNGYrS2daVVpaVWNwbWNzeGNrK1ZIMEJOcmNuMVRSdWI4VjJD?=
 =?utf-8?B?OGFjdW05RXlUaE9CNXF5ak9Oak9xTitaK1FQWmRySUJDblpvR25LOTNPV2pZ?=
 =?utf-8?B?a3VWVmJWL2E4aklSdUVKV2NqQzM4SEJNamNMY3dJWVZNNDI1MlJwTGxYRklz?=
 =?utf-8?B?RUJWMVUvSWRtNUR4cWVOZUlPWWM5SU91ZEZJNEswanJBU1VuN0FOU3dBQmU4?=
 =?utf-8?B?RS8ySlFvMmdGU2h3dUwreSt5SDY5cHVGUlhnK2NnMEhzRjQrdU9adU1SSTk1?=
 =?utf-8?B?cmFkVFJlRnQ2b0NWV0dhRzQwazRXa2NoNmNzRWFWdk1UejJrS1VMRVN5WCtB?=
 =?utf-8?B?eVFNOHRzNnRxellZb0swV3p3V1FieGdpWWFSNHBSb3VkRVhpQXUyV002Y2No?=
 =?utf-8?B?Z3hienphSEFuMERLdlR6QzQzUkUxYVduY0tWd0NlbklSZk5nVGlZNXNPaC81?=
 =?utf-8?B?WTdncnJhYTBNUno2TlVXSzBIKy9Tamx1ak9kU3drUmY1MHZSQlRjVWRmbXR0?=
 =?utf-8?B?YkY4TzEwSzZpMXY0NGdsYVVPeEFETlZ1K2FhQ2JhS2lKM0dpSUFiUDdGTXpv?=
 =?utf-8?B?cTl1bWxleWI3cjdmZ3l2Wkh5UVV0L3lLbzZ2d1A5QjJuck1QTkRlT25vVmVw?=
 =?utf-8?B?bU8zZnluMHYyQzBIMjk1a3JSTDN4YjdmTFRQdk4zdFBxeHJjWFdKbzZOa0xK?=
 =?utf-8?B?d2MrZW5ucnZwL2p1cUtyNWh6bnhNK0VuVDdlWlo0eVl2Z3dkeWlTTlZWOVRB?=
 =?utf-8?B?UXFWNWltL1JCQTVzeGJJTGFwSUVYTTlzZzkvN0xQcGQvYVZmekxjRENMcHpS?=
 =?utf-8?B?c3RiODgvVXQwd2xlSkpaYUxtUkorcVR4MERNb2NlTG5jTTFPMUYwcFRtUU5G?=
 =?utf-8?B?T1BFa3ZtVXY2MHFrQ3UrNWxXSDlwZnlsY0krV3ViZkd4MDgzdGx5Q0NxYm54?=
 =?utf-8?B?Z2tTbUk5KzFha0NvdEE5N0IvZHdKeTN4YjR4MXNWQ3JNYjlCUExPZE5QU0Jo?=
 =?utf-8?B?emc2NVhtMTVOVDR5RWFHcnd1VGNxMWdRZXpiVGFjR2RQWFRocFZtR0t5SDNq?=
 =?utf-8?B?djY1RmFsclJNbnd5ZjRWemJpZVRQdWRsL0tPS0ZmNllFWFN3dTBVc1ZsejNF?=
 =?utf-8?B?eDhjbDFOR1RBN2orb3NmTldQeE9PM1kyc0hNWnpaRnNiZGwvYy9PaEZrZ2ZU?=
 =?utf-8?B?TUZadmxkK2VlMmtNS3J2cWZVSUZ6RDNON0NCNGlPNnBWY1JXa0VqVmZ4czVp?=
 =?utf-8?B?QVRGK2dsaHZjUHFoTjl6a01kZlNCOGRIZC93dWNnQllQN0lDem51aHRGQ2Nn?=
 =?utf-8?B?S3Irb1FrNkJrRUd6RmdxZ2R5TkFDQno5UFk1SkhXSkdTUDEweWJ0emdQN0Zz?=
 =?utf-8?B?MkFXN0MxSWhaLzRSM0JlYkVsT0RqalFlejcxelRKRFJqMGVSYittU2lEdmp2?=
 =?utf-8?B?Q2ZQVEh1SnNzOXRvVUxpOXBSa1FUYlk1RVE5eEsxbzVZTnY3eVVUZlNZMHpS?=
 =?utf-8?B?eWgrSTlTZm9DRysrQ0ZuY0hqVmtPUDZpK1N5OTVpcTNnVmlFb211UWczQmJP?=
 =?utf-8?B?VDNWeTZoRjFrcVJOUHVIZFFXQW84ZUFrdzlsZ05GRXVYVSttbk55VmlPK0F2?=
 =?utf-8?B?ZlVIN0RsVzg2WmFoRmhtNEFnbDJjeGl2bk5tWEJUZjVjeTRUWjFvYjQyOXp1?=
 =?utf-8?B?dUZ2Q2ZkRkNmTjZhZjBEMzRXS1pDb3dHbFZ2Q1dhblNXMUJTbUlqVTNjSk1n?=
 =?utf-8?B?N3BFQ2hpQThRQWdPV1RFVmgydFVXM0wvc25JQ3hkeDM0amhZbXR1VkhpRzFu?=
 =?utf-8?B?TVB2dUxUd0V2OHlwbm9xQ0JlbEMyenlxdnZORnh4Smtsb2puVjIrYzY4eFhK?=
 =?utf-8?B?WEV3UGNUY2JQRTNQRWxSdUpvRWU5VXp4U3FZVXJqUGZJYzBBQnFwSEtyT0dW?=
 =?utf-8?B?a08rRnY1QjRVSFZmZ0tOQ1pIVy95a2RzQ0FRQ3pPTHA4SlhBTEtkUWJzSDBx?=
 =?utf-8?Q?5wVXOR2i+AUlTnZPtXQglytu+IrGzda4CW1XH301HleY?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf197ca9-12e1-4c22-e1f8-08db70a6628f
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2023 09:20:12.5958 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JLCCcgJArC0HuPTdir5lwLcu7K93Y8nJ6IPHRoF1pAF5QxgoyE1B3jKPLDtBrXk4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5306
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
Cc: Matthew Brost <matthew.brost@intel.com>, arunpravin.paneerselvam@amd.com,
 felix.kuehling@amd.com, francois.dugast@intel.com,
 amd-gfx@lists.freedesktop.org, luben.tuikov@amd.com, dakr@redhat.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi guys,

Am 19.06.23 um 10:59 schrieb Thomas Hellström (Intel):
> [SNIP]
>>>>
>>>> I really need to find some time to work on that anyway.
>> I've been playing with drm_exec for a couple weeks now, and I wanted
>> to share something I hacked to try and make the API simpler and
>> more robust against misuse (see the below diff, which is a slightly
>> adjusted version of your work).
>
> It would be good if we could have someone taking charge of this series 
> and address all review comments, I see some of my comments getting 
> lost, we have multiple submitters and I can't find a dri-devel 
> patchwork entry for this. Anyway some comments below.

I can try to find some time for the series this week (As long as nobody 
comes along and has any burning roof).

>
>>
>> In this version, the user is no longer in control of the retry
>> loop. Instead, it provides an expression (a call to a
>> sub-function) to be re-evaluated each time a contention is
>> detected. IMHO, this makes the 'prepare-objs' functions easier to
>> apprehend, and avoids any mistake like calling
>> drm_exec_continue_on_contention() in an inner loop, or breaking
>> out of the drm_exec_while_all_locked() loop unintentionally.
>
> In i915 we've had a very similar helper to this, and while I agree 
> this newer version would probably help make code cleaner, but OTOH 
> there also are some places where the short drm_exec_while_all_locked() 
> -likeblock don't really motivate a separate function. Porting i915 to 
> the current version will take some work, For  the xe driver both 
> versions would work fine.

Yeah, this is actually what my first version of this looked like. But I 
abandoned that approach because we have a lot of cases were we just 
quickly want to lock a few GEM objects and don't want the extra overhead 
of putting all the state into some bag to forward it to a function.

>
> Some additional review comments not related to the interface change 
> below:
>
>>
>> It also makes the internal management a bit simpler, since we
>> no longer call drm_exec_cleanup() on the first attempt, and can
>> thus get rid of the DRM_EXEC_DUMMY trick.
>>
>> In the below diff, I also re-introduced native support for
>> duplicates as an opt-in, so we don't have to do things like:
>>
>>     ret = drm_exec_prepare_obj(exec, obj, num_fences);
>>     if (ret == -EALREADY)
>>         ret = dma_resv_reserve_fences(obj->resv, num_fences);
>>     if (ret)
>>         return ret;
>>
>> and can just do:
>>
>>     ret = drm_exec_prepare_obj(exec, obj, num_fences);
>>     if (ret)
>>         return;
>>
>> Of course drivers can open-code a wrapper doing the same thing, but
>> given at least pvr and radeon need this, it'd be nice if the core
>> could support it natively.
>>
>> That's mostly it. Just wanted to share what I had in case you're
>> interested. If not, that's fine too.
>>
>> Regards,
>>
>> Boris
>> ---
>>   Documentation/gpu/drm-mm.rst |  12 ++
>>   drivers/gpu/drm/Kconfig      |   6 +
>>   drivers/gpu/drm/Makefile     |   2 +
>>   drivers/gpu/drm/drm_exec.c   | 274 +++++++++++++++++++++++++++++++++++
>>   include/drm/drm_exec.h       | 130 +++++++++++++++++
>>   5 files changed, 424 insertions(+)
>>   create mode 100644 drivers/gpu/drm/drm_exec.c
>>   create mode 100644 include/drm/drm_exec.h
>>
>> diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
>> index fe40ee686f6e..c9f120cfe730 100644
>> --- a/Documentation/gpu/drm-mm.rst
>> +++ b/Documentation/gpu/drm-mm.rst
>> @@ -524,6 +524,18 @@ DRM Sync Objects
>>   .. kernel-doc:: drivers/gpu/drm/drm_syncobj.c
>>      :export:
>>   +DRM Execution context
>> +=====================
>> +
>> +.. kernel-doc:: drivers/gpu/drm/drm_exec.c
>> +   :doc: Overview
>> +
>> +.. kernel-doc:: include/drm/drm_exec.h
>> +   :internal:
>> +
>> +.. kernel-doc:: drivers/gpu/drm/drm_exec.c
>> +   :export:
>> +
>>   GPU Scheduler
>>   =============
>>   diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
>> index 76991720637c..01a38fcdb1c4 100644
>> --- a/drivers/gpu/drm/Kconfig
>> +++ b/drivers/gpu/drm/Kconfig
>> @@ -194,6 +194,12 @@ config DRM_TTM
>>         GPU memory types. Will be enabled automatically if a device 
>> driver
>>         uses it.
>>   +config DRM_EXEC
>> +    tristate
>> +    depends on DRM
>> +    help
>> +      Execution context for command submissions
>> +
>>   config DRM_BUDDY
>>       tristate
>>       depends on DRM
>> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
>> index 1873f64db171..18a02eaf2d49 100644
>> --- a/drivers/gpu/drm/Makefile
>> +++ b/drivers/gpu/drm/Makefile
>> @@ -79,6 +79,8 @@ obj-$(CONFIG_DRM_PANEL_ORIENTATION_QUIRKS) += 
>> drm_panel_orientation_quirks.o
>>   #
>>   # Memory-management helpers
>>   #
>> +#
>> +obj-$(CONFIG_DRM_EXEC) += drm_exec.o
>>     obj-$(CONFIG_DRM_BUDDY) += drm_buddy.o
>>   diff --git a/drivers/gpu/drm/drm_exec.c b/drivers/gpu/drm/drm_exec.c
>> new file mode 100644
>> index 000000000000..e0ad1a3e1610
>> --- /dev/null
>> +++ b/drivers/gpu/drm/drm_exec.c
>> @@ -0,0 +1,274 @@
>> +/* SPDX-License-Identifier: GPL-2.0 OR MIT */
>> +
>> +#include <drm/drm_exec.h>
>> +#include <drm/drm_gem.h>
>> +#include <linux/dma-resv.h>
>> +
>> +/**
>> + * DOC: Overview
>> + *
>> + * This component mainly abstracts the retry loop necessary for locking
>> + * multiple GEM objects while preparing hardware operations (e.g. 
>> command
>> + * submissions, page table updates etc..).
>> + *
>> + * If a contention is detected while locking a GEM object the 
>> cleanup procedure
>> + * unlocks all previously locked GEM objects and locks the contended 
>> one first
>> + * before locking any further objects.
>> + *
>> + * After an object is locked fences slots can optionally be reserved 
>> on the
>> + * dma_resv object inside the GEM object.
>> + *
>> + * A typical usage pattern should look like this::
>> + *
>> + * int prepare_objs_func(struct drm_exec *exec, ...)
>> + * {
>> + *    struct drm_gem_object *boA, *boB;
>> + *     int ret;
>> + *
>> + *    <retrieve boA and boB here>
>> + *
>> + *    ret = drm_exec_prepare_obj(&exec, boA, 1);
>> + *    if (ret)
>> + *        return ret;
>> + *
>> + *    ret = drm_exec_prepare_obj(&exec, boB, 1);
>> + *    if (ret)
>> + *        return ret;
>> + *
>> + *     return 0;
>> + * }
>> + *
>> + * int some_func()
>> + * {
>> + *    struct drm_exec exec;
>> + *    unsigned long index;
>> + *    int ret;
>> + *
>> + *    drm_exec_init(&exec, true);
>> + *    ret = drm_exec_until_all_locked(&exec, 
>> prepare_objs_func(&exec, ...));
>> + *    if (ret)
>> + *        goto error;
>> + *
>> + *    drm_exec_for_each_locked_object(&exec, index, obj) {
>> + *        dma_resv_add_fence(obj->resv, fence, DMA_RESV_USAGE_READ);
>> + *        ...
>> + *    }
>> + *    drm_exec_fini(&exec);
>> + *
>> + * See struct dma_exec for more details.
>> + */
>> +
>> +/* Unlock all objects and drop references */
>> +static void drm_exec_unlock_all(struct drm_exec *exec)
>> +{
>> +    struct drm_gem_object *obj;
>> +    unsigned long index;
>> +
>> +    drm_exec_for_each_locked_object(exec, index, obj) {
>> +        dma_resv_unlock(obj->resv);
>> +        drm_gem_object_put(obj);
>> +    }
>> +
>> +    drm_gem_object_put(exec->prelocked);
>> +    exec->prelocked = NULL;
>> +}
>> +
>> +/**
>> + * drm_exec_init - initialize a drm_exec object
>> + * @exec: the drm_exec object to initialize
>> + * @interruptible: if locks should be acquired interruptible
>> + *
>> + * Initialize the object and make sure that we can track locked 
>> objects.
>> + */
>> +void drm_exec_init(struct drm_exec *exec, u32 flags)
>> +{
>> +    exec->flags = flags;
>> +    exec->objects = kmalloc(PAGE_SIZE, GFP_KERNEL);
>> +
>> +    /* If allocation here fails, just delay that till the first use */
>> +    exec->max_objects = exec->objects ? PAGE_SIZE / sizeof(void *) : 0;
>> +    exec->num_objects = 0;
>> +    exec->contended = NULL;
>> +    exec->prelocked = NULL;
>> +    ww_acquire_init(&exec->ticket, &reservation_ww_class);
>> +}
>> +EXPORT_SYMBOL(drm_exec_init);
>> +
>> +/**
>> + * drm_exec_fini - finalize a drm_exec object
>> + * @exec: the drm_exec object to finalize
>> + *
>> + * Unlock all locked objects, drop the references to objects and 
>> free all memory
>> + * used for tracking the state.
>> + */
>> +void drm_exec_fini(struct drm_exec *exec)
>> +{
>> +    drm_exec_unlock_all(exec);
>> +    kvfree(exec->objects);
>> +    if (exec->contended)
>> +        drm_gem_object_put(exec->contended);
>> +    ww_acquire_fini(&exec->ticket);
>> +}
>> +EXPORT_SYMBOL(drm_exec_fini);
>> +
>> +/**
>> + * drm_exec_reset - reset a drm_exec object after a contention
>> + * @exec: the drm_exec object to reset
>> + *
>> + * Unlock all locked objects and resets the number of objects locked.
>> + */
>> +void drm_exec_reset(struct drm_exec *exec)
>> +{
>> +    WARN_ON(!exec->contended);
>> +    drm_exec_unlock_all(exec);
>> +    exec->num_objects = 0;
>> +}
>> +EXPORT_SYMBOL(drm_exec_reset);
>> +
>> +/* Track the locked object in the array */
>> +static int drm_exec_obj_locked(struct drm_exec *exec,
>> +                   struct drm_gem_object *obj)
>> +{
>> +    if (unlikely(exec->num_objects == exec->max_objects)) {
>> +        size_t size = exec->max_objects * sizeof(void *);
>> +        void *tmp;
>> +
>> +        tmp = kvrealloc(exec->objects, size, size + PAGE_SIZE,
>> +                GFP_KERNEL);
>> +        if (!tmp)
>> +            return -ENOMEM;
>
> Sometimes you need to just temporarily lock an object and then unlock 
> it again if it goes out of scope before reaching the end of 
> _until_all_locked(). In that case you might need to remove a lock from 
> the array. I *think* for all use-cases in i915 it would suffice to 
> take a snapshot of num_objects, and unlock everything above that, 
> having exec->objects behave like a stack, but was ever a list 
> considered instead of a realloced array?

Yes, the problem is that linked lists really suck regarding their cache 
line locality. That's why I've came up with this approach here.

What we could maybe do is to allow unlocking objects, but with the cost 
of linear backward searching for them in the array.

>
>> +
>> +        exec->objects = tmp;
>> +        exec->max_objects += PAGE_SIZE / sizeof(void *);
>> +    }
>> +    drm_gem_object_get(obj);
>> +    exec->objects[exec->num_objects++] = obj;
>> +
>> +    return 0;
>> +}
>> +
>> +/* Make sure the contended object is locked first */
>> +static int drm_exec_lock_contended(struct drm_exec *exec)
>> +{
>> +    struct drm_gem_object *obj = exec->contended;
>> +    int ret;
>> +
>> +    if (likely(!obj))
>> +        return 0;
>> +
>> +    if (exec->flags & DRM_EXEC_FLAG_INTERRUPTIBLE) {
>> +        ret = dma_resv_lock_slow_interruptible(obj->resv,
>> +                               &exec->ticket);
>> +        if (unlikely(ret))
>> +            goto error_dropref;
>> +    } else {
>> +        dma_resv_lock_slow(obj->resv, &exec->ticket);
>> +    }
>> +
>
> Sometimes you want to just drop the contended lock after the above 
> relaxation. (Eviction would be one example), and not add as prelocked, 
> if the contended object goes out of scope. Eviction would in some 
> situations be one such example, -EDEADLOCK leading to an error path 
> where the object should otherwise be freed is another. Perhaps we 
> could add an argument to prepare_obj() as to whether the object should 
> be immediately put after relaxation.

I was considering a try_prepare version as well, that should cover this 
use case.

>
>> +    ret = drm_exec_obj_locked(exec, obj);
>> +    if (unlikely(ret)) {
>> +        dma_resv_unlock(obj->resv);
>> +        goto error_dropref;
>> +    }
>> +
>> +    swap(exec->prelocked, obj);
>> +
>> +error_dropref:
>> +    /* Always cleanup the contention so that error handling can kick 
>> in */
>> +    drm_gem_object_put(obj);
>> +    exec->contended = NULL;
>> +    return ret;
>> +}
>> +
>> +/**
>> + * drm_exec_prepare_obj - prepare a GEM object for use
>> + * @exec: the drm_exec object with the state
>> + * @obj: the GEM object to prepare
>> + * @num_fences: how many fences to reserve
>> + *
>> + * Prepare a GEM object for use by locking it and reserving fence 
>> slots. All
>> + * successfully locked objects are put into the locked container.
>> + *
>> + * Returns: -EDEADLK if a contention is detected, -EALREADY when 
>> object is
>> + * already locked, -ENOMEM when memory allocation failed and zero 
>> for success.
>> + */
>> +int drm_exec_prepare_obj(struct drm_exec *exec, struct 
>> drm_gem_object *obj,
>> +             unsigned int num_fences)
>> +{
>> +    int ret;
>> +
>> +    ret = drm_exec_lock_contended(exec);
>> +    if (unlikely(ret))
>> +        return ret;
>> +
>> +    if (exec->prelocked == obj) {
>> +        drm_gem_object_put(exec->prelocked);
>> +        exec->prelocked = NULL;
>> +
>> +        return dma_resv_reserve_fences(obj->resv, num_fences);
>> +    }
>> +
>> +    if (exec->flags & DRM_EXEC_FLAG_INTERRUPTIBLE)
>> +        ret = dma_resv_lock_interruptible(obj->resv, &exec->ticket);
>> +    else
>> +        ret = dma_resv_lock(obj->resv, &exec->ticket);
>> +
>> +    if (unlikely(ret == -EDEADLK)) {
>> +        drm_gem_object_get(obj);
>> +        exec->contended = obj;
>> +        return -EDEADLK;
>> +    }
>> +
>> +    if (unlikely(ret == -EALREADY &&
>> +        (exec->flags & DRM_EXEC_FLAG_ALLOW_DUPLICATES)))
>> +        goto reserve_fences;
>> +
>> +    if (unlikely(ret))
>> +        return ret;
>> +
>> +    ret = drm_exec_obj_locked(exec, obj);
>> +    if (ret)
>> +        goto error_unlock;
>> +
>> +reserve_fences:
>> +    /* Keep locked when reserving fences fails */
>> +    return dma_resv_reserve_fences(obj->resv, num_fences);
>
> Ugh, what is the use-case for keeping things locked here? How would a 
> caller tell the difference between an error where everything is locked 
> and nothing is locked? IMO, we should unlock on error here. If there 
> indeed is a use-case we should add a separate function for reserving 
> fences for all locked objects, rather than returning sometimes locked 
> on error sometime not.

We return the object locked here because it was to much churn to remove 
it again from the array and we are getting fully cleaned up at the end 
anyway.

Regards,
Christian.

>
> Thanks,
>
> Thomas
>
>
>> +
>> +error_unlock:
>> +    dma_resv_unlock(obj->resv);
>> +    return ret;
>> +}
>> +EXPORT_SYMBOL(drm_exec_prepare_obj);
>> +
>> +/**
>> + * drm_exec_prepare_array - helper to prepare an array of objects
>> + * @exec: the drm_exec object with the state
>> + * @objects: array of GEM object to prepare
>> + * @num_objects: number of GEM objects in the array
>> + * @num_fences: number of fences to reserve on each GEM object
>> + *
>> + * Prepares all GEM objects in an array, handles contention but 
>> aports on first
>> + * error otherwise. Reserves @num_fences on each GEM object after 
>> locking it.
>> + *
>> + * Returns: -EALREADY when object is already locked, -ENOMEM when 
>> memory
>> + * allocation failed and zero for success.
>> + */
>> +int drm_exec_prepare_array(struct drm_exec *exec,
>> +               struct drm_gem_object **objects,
>> +               unsigned int num_objects,
>> +               unsigned int num_fences)
>> +{
>> +    int ret;
>> +
>> +    for (unsigned int i = 0; i < num_objects; ++i) {
>> +        ret = drm_exec_prepare_obj(exec, objects[i], num_fences);
>> +        if (ret)
>> +            return ret;
>> +    }
>> +
>> +    return 0;
>> +}
>> +EXPORT_SYMBOL(drm_exec_prepare_array);
>> +
>> +MODULE_DESCRIPTION("DRM execution context");
>> +MODULE_LICENSE("Dual MIT/GPL");
>> diff --git a/include/drm/drm_exec.h b/include/drm/drm_exec.h
>> new file mode 100644
>> index 000000000000..b1a5da0509c1
>> --- /dev/null
>> +++ b/include/drm/drm_exec.h
>> @@ -0,0 +1,130 @@
>> +/* SPDX-License-Identifier: GPL-2.0 OR MIT */
>> +
>> +#ifndef __DRM_EXEC_H__
>> +#define __DRM_EXEC_H__
>> +
>> +#include <linux/ww_mutex.h>
>> +
>> +struct drm_gem_object;
>> +
>> +/**
>> + * enum drm_exec_flags - Execution context flags
>> + */
>> +enum drm_exec_flags {
>> +    /**
>> +     * DRM_EXEC_FLAG_INTERRUPTIBLE: Set to true to use interruptible 
>> locking
>> +     * functions.
>> +     */
>> +    DRM_EXEC_FLAG_INTERRUPTIBLE = BIT(0),
>> +
>> +    /**
>> +     * DRM_EXEC_FLAG_ALLOW_DUPLICATES: Set to true to allow EALREADY 
>> errors.
>> +     */
>> +    DRM_EXEC_FLAG_ALLOW_DUPLICATES = BIT(1),
>> +};
>> +
>> +/**
>> + * struct drm_exec - Execution context
>> + */
>> +struct drm_exec {
>> +    /**
>> +     * @flags: Combinations of DRM_EXEC_FLAG_* flags.
>> +     */
>> +    u32 flags;
>> +
>> +    /**
>> +     * @ticket: WW ticket used for acquiring locks
>> +     */
>> +    struct ww_acquire_ctx    ticket;
>> +
>> +    /**
>> +     * @num_objects: number of objects locked
>> +     */
>> +    unsigned int        num_objects;
>> +
>> +    /**
>> +     * @max_objects: maximum objects in array
>> +     */
>> +    unsigned int        max_objects;
>> +
>> +    /**
>> +     * @objects: array of the locked objects
>> +     */
>> +    struct drm_gem_object    **objects;
>> +
>> +    /**
>> +     * @contended: contended GEM object we backed off for
>> +     */
>> +    struct drm_gem_object    *contended;
>> +
>> +    /**
>> +     * @prelocked: already locked GEM object due to contention
>> +     */
>> +    struct drm_gem_object *prelocked;
>> +};
>> +
>> +/**
>> + * drm_exec_for_each_locked_object - iterate over all the locked 
>> objects
>> + * @exec: drm_exec object
>> + * @index: unsigned long index for the iteration
>> + * @obj: the current GEM object
>> + *
>> + * Iterate over all the locked GEM objects inside the drm_exec object.
>> + */
>> +#define drm_exec_for_each_locked_object(exec, index, obj)    \
>> +    for (index = 0, obj = (exec)->objects[0];        \
>> +         index < (exec)->num_objects;            \
>> +         ++index, obj = (exec)->objects[index])
>> +
>> +/**
>> + * drm_exec_until_all_locked - retry objects preparation until all 
>> objects
>> + * are locked
>> + * @exec: drm_exec object
>> + * @expr: expression to be evaluated on each attempt
>> + *
>> + * This helper tries to prepare objects and if a deadlock is detected,
>> + * rollbacks and retries.
>> + *
>> + * @expr is typically a function that tries to prepare objects using
>> + * drm_exec_prepare_obj().
>> + *
>> + * If we take drm_exec_prepare_array() as an example, you should do:
>> + *
>> + *    ret = drm_exec_until_all_locked(exec,
>> + *                    drm_exec_prepare_array(exec,
>> + *                                   objs,
>> + *                                   num_objs,
>> + *                                   num_fences));
>> + *    if (ret)
>> + *        goto error_path;
>> + *
>> + *    ...
>> + *
>> + * Returns: 0 on success, a negative error code on failure.
>> + */
>> +#define drm_exec_until_all_locked(exec, expr)        \
>> +    ({                        \
>> +        __label__ retry;            \
>> +        int __ret;                \
>> +retry:                            \
>> +        __ret = expr;                \
>> +        if ((exec)->contended) {        \
>> +            WARN_ON(__ret != -EDEADLK);    \
>> +            drm_exec_reset(exec);        \
>> +            goto retry;            \
>> +        }                    \
>> +        ww_acquire_done(&(exec)->ticket);    \
>> +        __ret;                    \
>> +    })
>> +
>> +void drm_exec_init(struct drm_exec *exec, u32 flags);
>> +void drm_exec_fini(struct drm_exec *exec);
>> +void drm_exec_reset(struct drm_exec *exec);
>> +int drm_exec_prepare_obj(struct drm_exec *exec, struct 
>> drm_gem_object *obj,
>> +             unsigned int num_fences);
>> +int drm_exec_prepare_array(struct drm_exec *exec,
>> +               struct drm_gem_object **objects,
>> +               unsigned int num_objects,
>> +               unsigned int num_fences);
>> +
>> +#endif

