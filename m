Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E50F696DE7
	for <lists+dri-devel@lfdr.de>; Tue, 14 Feb 2023 20:27:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D3BF10E975;
	Tue, 14 Feb 2023 19:27:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2F9210E027;
 Tue, 14 Feb 2023 19:27:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g33EbnIaK9f5jUpfv/5buclNbWEedpZvEd/VsAxn/OycfppdogFp6hpv4B+sVRt+LtTwNLdvv6dUnr8Uoy+0aw1lJzEIda+7HGsixF1y+yldmhiT+5ThH1TEW48ANBEgQHHuceJccnzqvqKkeYErBD9hr11d42ekmnnpt/qhFNCz4O2/FjDMEFs6/5YF4sBX5m4iCc3BctJDYlANkru9q2Ivwu0kPWe2G2q4EqybaE/B4RgV2zjvdjKfBPFoV+rrmA46gekmYKT2L+NnuTiIyZly51pB5k2aVxb6EEoSIzrAvV+sxpoZzmFzeQmWvWf7XOPRpEjpl7YcoiouxBtX6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mgt8XjPhAk6u6v1TuZpApac/alg2weo7h0xUECsJu5o=;
 b=LxgsrpVd8zeCfI8uKneTpPBo0QoNEKzpMrRVG8Dezn+KKqF1HhiqSWH0OoEyTsmyGAQ/nzRdqI7x7Z2WOs1yeh5TYl5HMW4XVsZKY4CJ6DjUSZzQ+juYqkWV1iz39uHpGmE1NbNci8R1t2EM2FekKCvaUxopOwpvUTbCOD2bQ6rOEyxYwkuOW2B8pBMmim9k9ANho8xMMu/axJE6SpWwM5Z2P4s87pQX1zv6atW44hC1ll5znLHHJ42XwNOV1d+q0qH+fSI4g5vCpZLxYCsA2HbUSKQLkserWl/na+MTaXNi3S5NTX23GquodLqXxsBcrHz7vqp9hcoQflL+0SlpwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mgt8XjPhAk6u6v1TuZpApac/alg2weo7h0xUECsJu5o=;
 b=szlZgxULAZXY8WbbCxKqKlselwJ56ltuuTAFWENasKufxmuQtBYlGCEqSM54L4cgQwFxN/Uy29rPGNzbFeX6bFgWUa2tmBbbmqCFMkJ5W/QPckfOwWhJzdxRqskS0qhz0X3ZI/JE572YQbwCAZl4IlU3ZMebqkNYD2h+KeUCvaI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by BY5PR12MB4274.namprd12.prod.outlook.com (2603:10b6:a03:206::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Tue, 14 Feb
 2023 19:27:26 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::aa28:9378:593:868a]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::aa28:9378:593:868a%9]) with mapi id 15.20.6086.024; Tue, 14 Feb 2023
 19:27:25 +0000
Message-ID: <ac915deb-99f9-4ba4-7c34-e0af6bcccbb7@amd.com>
Date: Tue, 14 Feb 2023 14:27:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v2 1/2] drm: Introduce plane SIZE_HINTS property
Content-Language: en-US
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 =?UTF-8?Q?Jonas_=c3=85dahl?= <jadahl@redhat.com>
References: <20230208040911.12590-2-ville.syrjala@linux.intel.com>
 <20230208211016.7034-1-ville.syrjala@linux.intel.com>
 <Y+UAN7V+kA58yMfn@redhat.com> <Y+tTpH1nfHIG/Dxg@intel.com>
 <Y+taU+zDiTO9aA0U@redhat.com> <Y+tiXJglfpzgUEFD@intel.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <Y+tiXJglfpzgUEFD@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0252.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:66::11) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|BY5PR12MB4274:EE_
X-MS-Office365-Filtering-Correlation-Id: d1bfc886-80a6-45df-0f12-08db0ec1809f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uOdST+YvmEUiuJ6BBgOrmfKAGVVezBAnhEMVagRq+ls9A4XD4gzvS/OS6Vj/0VGLxb96dvvmdiN/EGFq1LixnnWB912C+CGMYwH4ULp7Q6gEOJfnzkjjHxI1Bzad4Mvkyl9IpISpA94tS+EtWQX67m58q1og8V0/Hm63aUoWgP3uhCVRoJlWgf8Z5ZsoHOEkyq+SRKHzH8QYDhw4g/Qn5orO8YwHVb8MBDJniH17yyuMuzROPYBKohaUCSpZFwSJFxCLBof7ooe9EHL+J9GJ1Id4KOn2FfyLgiIWTErCG+XwSs98g7SReMQMU7Br13E0+WSUWqx6DASxFA2p2+PCZ3jMkJUXKC/bqKC4vDYb3CXA+O566KGFGCW4nQy9EQSDJ8+osNDL0Zz6VVGTgDPbDmiEyhIVQOArAgT3RRAevGT7qG6kfaAbownv7fetBjXQ6j+DKAm+U6HSw5QCptvZgZZRpcA81wG7PNpPKW9vMbnU02iJR0e3UfNYoGELyAumv6dAj6rbUkAOdKHnXReC7qaNs7+0DvjQE1yZuOvMPZ4F8r4L3tL3soyNCot8HZ5dcxkpDql7UcsUUp/xqAZXFQXg8foBv5hlZrV46Wm5MvDg8BB0eBETgBimMLcpZgVirVlNzvOiLHaDJEsBUlRdDauxIXNoo7hNjz+0XVXzqtHEk/cSwFZu/F4FqzknaA2h
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(346002)(136003)(396003)(366004)(39860400002)(451199018)(36756003)(31696002)(86362001)(110136005)(186003)(26005)(54906003)(66574015)(83380400001)(316002)(6512007)(478600001)(2616005)(6666004)(31686004)(6486002)(966005)(6506007)(53546011)(44832011)(66899018)(2906002)(8676002)(41300700001)(66476007)(66946007)(66556008)(5660300002)(4326008)(38100700002)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?azFZaG9wNjkrSVhiQ0sxaHlOMThRcE5YVm1Fam5pd3Z4d1JYRHJNVHRJNGkw?=
 =?utf-8?B?KytvaStia3ZsT3h4MEdtbFZJUWlzRmlyWmdmZ1A0aWlwK0IwbU9uVi83SGJk?=
 =?utf-8?B?ei9QdTd0Zm1VQ1JVaWpSNGUrRVFLaGd0dS92V3V3Nk11WTN2QWJqWW1oYmRM?=
 =?utf-8?B?SytrV1FST2hRKzIzN0FIaXJMVGZ5UEVIRHNDOHdMSjA0cEs0MGhadUc5eGtN?=
 =?utf-8?B?UlhXRHQxajJVejhnYjZ5ekpnWGtRMUV0OWJleEhYSmpXeGtsZVFpeWhVZHBZ?=
 =?utf-8?B?OFdqNGRCRFczSUdkUnd2MmdkQUpZRlZOcTVXL0RlY2FvZzdqNlFiRXZzSThH?=
 =?utf-8?B?SkR3eWtrVGpZS1grZ2ZWakpqd0xoZlBvbnRib3U5eGtTV1hNVGlaNndpR0Z4?=
 =?utf-8?B?WktMWXZCWlBtWStzaS80S21TclVKa0NlaDRrZVo3NVJzRGJ0N29reHlHcGhU?=
 =?utf-8?B?aDJTeTRYUjJqMnFuMm53WkVXVk4vbFI3L3JNQ3dJcmVkN1FPMHBKTUZRdE1N?=
 =?utf-8?B?cExYQ0VwR2FRM1A3T293Z2gvdU5qRDEwdEhJOHgycDREdWs5aEhjSUkvUUo0?=
 =?utf-8?B?MW4wWEVWMkoyWXFkM0hTMGZpektnUGJLT2RFRzMzcHdnNVB1SHQxbkNEY3Ra?=
 =?utf-8?B?UHlteDhpbTZsUGh4eWZKOW0rVktndVkrYXlab2trL3g0b0orYW9nWCt1Qmxo?=
 =?utf-8?B?NURhV3JKdDhnNDZoU2k0WnBsK0VLOGxKTlhwR21oaVZSbk1ZYlpXaDBPZ2tZ?=
 =?utf-8?B?TnVrZnBhRXBQRlgvb1A5M3prTVZId01zVmwwc0pUN1pPNHpwYWZLNWgwV1I2?=
 =?utf-8?B?VFNmenNUa3JzQUVKZXN1QXBMS3dkbGkwQ2FuV2g5N3JsTG5SWlZNZ0tpUkZ5?=
 =?utf-8?B?Mnc1K1FhcEI4R09IQjdPMGZvWW0rdlRFdEk2MDlmbXludEt0dkRiSUZrK0Z0?=
 =?utf-8?B?Wlh2bFdrV0dYVmtBYUsxWTVrN3pCalN3TVZZNFBVMllsSjF1aEJocXZsU0tZ?=
 =?utf-8?B?R1FxdjdwLzdoQzNEVkZrNHZ0UmhYOG1TV2JraElxMEgvRzB2V0NndjlDVXhs?=
 =?utf-8?B?ekdpQ2xNaXRSY2JKT1FlSDA2LzRjR1NPUU5WSHdpNWZhTkxWTnlJdVR2U1RG?=
 =?utf-8?B?UmRLSnMrM0pHNUYxejU1Vkt6QUtNTzZLZjdTMWZJZHcrTStQSFBhbU5zVjJ4?=
 =?utf-8?B?ZDBmUjQ2MVlZNGh4YW5CaG1NbElEd2VESE5Ga1FFdGpBSHRoS29ZOEl0MzFN?=
 =?utf-8?B?TUdtT2xna0QyYm9KREM3Mzhia2hhVTY4ZGVsalBjWjdvbWorUmJuZ0hjQkVp?=
 =?utf-8?B?ZUJmUCtDVmFNNWtmNXRhMUt0ZXFJZDNmamJ4cVZPcWN3L1ZQOEdBVU9zYWhx?=
 =?utf-8?B?czk1cWVuUC9aYVNUZmZsLzJxSXNTazJQNElVRUlnVWFUNm96MmtJM2V3d3BL?=
 =?utf-8?B?cWtVVDZRNCtzWnVzVStaTGg3Y2VJdk8zVVBZdmpLRmNUbmx2MTFZSzZLbk5Q?=
 =?utf-8?B?QmJoOGcxZnhvbDJYMkt1SjdGV1JmNUVOYlhMRkZrbW53b3poVlRwUDgxQUNq?=
 =?utf-8?B?bmE2amFSbURCdUVBNE9GdnRmbDFNd3cvOHFUMTZRVTRmMzVoemNnNFlZYldV?=
 =?utf-8?B?aGw5UEsxOXdkb09WR3V6dlpQc3d4SjJWdW1QR082cnN0MXRzcGl3YUtpaUhQ?=
 =?utf-8?B?QlRZdXhIVGNoMlROOHFWREZONmExR2NYYi9kM1RJeHBtOU5qZlR2elg1REM1?=
 =?utf-8?B?SFFSTklneEx2YTFnTnN2L1ZZTG1tY2JnWEJ3ZnRJQkdFNzNTT0NIWXJGUUh1?=
 =?utf-8?B?MGhwSkh4TXZJM2VJRVkzamtCSnRDRU16cFR4Q1J1eGE0TlFlbUtIM2NJdmNi?=
 =?utf-8?B?WUNIOVEzaXZURHhWTEhyNXoweEFPQjgrSFpNaWZNWVFlb0duT2Q2MmhFN3lK?=
 =?utf-8?B?QzZZb1FVeG93UjJZMEx2OXduNCt5WU9LV3RVKzNxdjFxVlN1N00xYkZzMjJj?=
 =?utf-8?B?czE2dDhyUm9iazQ3YW9mcTZpU1pqbC81eU9Sc2dQK25VTkxIUGt5QjZ2RTlp?=
 =?utf-8?B?ZUJrY2RmWHB2enpaQ3NHV2dQbWR5S1ZtbkFmdE1jbklJZlNJWDVObWZ4endm?=
 =?utf-8?Q?Nzpw0bzN2XnTIhfJnjtMM+AM4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1bfc886-80a6-45df-0f12-08db0ec1809f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2023 19:27:25.7284 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w/zxpKPblGi/XOf/WBpEfxrN94gkrbvSPLdDesxyBzvsrqHWmG35HRzOd8s6zRU+vIQ5Cr2xTjevztT/Z0u28w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4274
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
Cc: intel-gfx@lists.freedesktop.org,
 Pekka Paalanen <pekka.paalanen@collabora.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2/14/23 05:28, Ville Syrjälä wrote:
> On Tue, Feb 14, 2023 at 10:54:27AM +0100, Jonas Ådahl wrote:
>> On Tue, Feb 14, 2023 at 11:25:56AM +0200, Ville Syrjälä wrote:
>>> On Thu, Feb 09, 2023 at 03:16:23PM +0100, Jonas Ådahl wrote:
>>>> On Wed, Feb 08, 2023 at 11:10:16PM +0200, Ville Syrjala wrote:
>>>>> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>>>>>
>>>>> Add a new immutable plane property by which a plane can advertise
>>>>> a handful of recommended plane sizes. This would be mostly exposed
>>>>> by cursor planes as a slightly more capable replacement for
>>>>> the DRM_CAP_CURSOR_WIDTH/HEIGHT caps, which can only declare
>>>>> a one size fits all limit for the whole device.
>>>>>
>>>>> Currently eg. amdgpu/i915/nouveau just advertize the max cursor
>>>>> size via the cursor size caps. But always using the max sized
>>>>> cursor can waste a surprising amount of power, so a better
>>>>> stragey is desirable.
>>>>>
>>>>> Most other drivers don't specify any cursor size at all, in
>>>>> which case the ioctl code just claims that 64x64 is a great
>>>>> choice. Whether that is actually true is debatable.
>>>>>
>>>>> A poll of various compositor developers informs us that
>>>>> blindly probing with setcursor/atomic ioctl to determine
>>>>> suitable cursor sizes is not acceptable, thus the
>>>>> introduction of the new property to supplant the cursor
>>>>> size caps. The compositor will now be free to select a
>>>>> more optimal cursor size from the short list of options.
>>>>>
>>>>> Note that the reported sizes (either via the property or the
>>>>> caps) make no claims about things such as plane scaling. So
>>>>> these things should only really be consulted for simple
>>>>> "cursor like" use cases.
>>>>>
>>>>> v2: Try to add some docs
>>>>>
>>>>> Cc: Simon Ser <contact@emersion.fr>
>>>>> Cc: Jonas Ådahl <jadahl@redhat.com>
>>>>> Cc: Daniel Stone <daniel@fooishbar.org>
>>>>> Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
>>>>> Acked-by: Harry Wentland <harry.wentland@amd.com>
>>>>> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
>>>>> ---
>>>>>   drivers/gpu/drm/drm_mode_config.c |  7 +++++
>>>>>   drivers/gpu/drm/drm_plane.c       | 48 +++++++++++++++++++++++++++++++
>>>>>   include/drm/drm_mode_config.h     |  5 ++++
>>>>>   include/drm/drm_plane.h           |  4 +++
>>>>>   include/uapi/drm/drm_mode.h       | 11 +++++++
>>>>>   5 files changed, 75 insertions(+)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
>>>>> index 87eb591fe9b5..21860f94a18c 100644
>>>>> --- a/drivers/gpu/drm/drm_mode_config.c
>>>>> +++ b/drivers/gpu/drm/drm_mode_config.c
>>>>> @@ -374,6 +374,13 @@ static int drm_mode_create_standard_properties(struct drm_device *dev)
>>>>>   		return -ENOMEM;
>>>>>   	dev->mode_config.modifiers_property = prop;
>>>>>   
>>>>> +	prop = drm_property_create(dev,
>>>>> +				   DRM_MODE_PROP_IMMUTABLE | DRM_MODE_PROP_BLOB,
>>>>> +				   "SIZE_HINTS", 0);
>>>>> +	if (!prop)
>>>>> +		return -ENOMEM;
>>>>> +	dev->mode_config.size_hints_property = prop;
>>>>> +
>>>>>   	return 0;
>>>>>   }
>>>>>   
>>>>> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
>>>>> index 24e7998d1731..ae51b1f83755 100644
>>>>> --- a/drivers/gpu/drm/drm_plane.c
>>>>> +++ b/drivers/gpu/drm/drm_plane.c
>>>>> @@ -140,6 +140,21 @@
>>>>>    *     DRM_FORMAT_MOD_LINEAR. Before linux kernel release v5.1 there have been
>>>>>    *     various bugs in this area with inconsistencies between the capability
>>>>>    *     flag and per-plane properties.
>>>>> + *
>>>>> + * SIZE_HINTS:
>>>>> + *     Blob property which contains the set of recommended plane size
>>>>> + *     which can used for simple "cursor like" use cases (eg. no scaling).
>>>>> + *     Using these hints frees userspace from extensive probing of
>>>>> + *     supported plane sizes through atomic/setcursor ioctls.
>>>>> + *
>>>>> + *     For optimal usage userspace should pick the smallest size
>>>>> + *     that satisfies its own requirements.
>>>>> + *
>>>>> + *     The blob contains an array of struct drm_plane_size_hint.
>>>>> + *
>>>>> + *     Drivers should only attach this property to planes that
>>>>> + *     support a very limited set of sizes (eg. cursor planes
>>>>> + *     on typical hardware).
>>>>
>>>> This is a bit awkward since problematic drivers would only expose
>>>> this property if they are new enough.
>>>>
>>>> A way to avoid this is for all new drivers expose this property, but
>>>> special case the size 0x0 as "everything below the max limit goes". Then
>>>> userspace can do (ignoring the missing cap fallback).
>>>
>>> I don't think there are any drivers that need that.
>>> So I'm thinking we can just ignore that for now.
>>
>> None the less, userspace not seeing SIZE_HINTS will be required to
>> indefinitely use the existing "old" behavior using the size cap as the
>> buffer size with a fallback, and drivers without any size limitations
>> that, i.e. details that are hard to express with a set of accepted
>> sizes, will still use the inoptimal buffer sizes.
>>
>> If I read [1] correctly, AMD has no particular size limitations other
>> than a size limit, but without a SIZE_HINTS, userspace still needs to
>> use the maximum size.
> 
> Simon pointed out they have pretty much the same exact limits as i915.
> Ie. only a few power of two sizes, and stride must match width.
> 

That's an artificial limitation in the driver. The HW has no such
limitation and it would be nice to drop that from our driver as
well.

Harry

>>
>> [1] https://gitlab.freedesktop.org/drm/intel/-/issues/7687#note_1760865
>>
>>
>> Jonas
>>
>>>
>>>>
>>>>      if (has(SIZE_HINTS))
>>>>          size = figure_out_size(SIZE_HINTS,
>>>> 	                       DRM_CAP_CURSOR_WIDTH,
>>>> 			       DRM_CAP_CURSOR_HEIGHT,
>>>> 			       preferred_size);
>>>>      else
>>>>          size = DRM_CAP_CURSOR_WIDTH x DRM_CAP_CURSOR_WIDTH;
>>>>
>>>> With `figure_out_size()` knowing how to deal with 0x0 in the size hints
>>>> to use `preferred_size` directly.
>>>>
>>>>
>>>> Jonas
>>>>
>>>>>    */
>>>>>   
>>>>>   static unsigned int drm_num_planes(struct drm_device *dev)
>>>>> @@ -1582,3 +1597,36 @@ int drm_plane_create_scaling_filter_property(struct drm_plane *plane,
>>>>>   	return 0;
>>>>>   }
>>>>>   EXPORT_SYMBOL(drm_plane_create_scaling_filter_property);
>>>>> +
>>>>> +/**
>>>>> + * drm_plane_add_size_hint_property - create a size hint property
>>>>> + *
>>>>> + * @plane: drm plane
>>>>> + * @hints: size hints
>>>>> + * @num_hints: number of size hints
>>>>> + *
>>>>> + * Create a size hints property for the plane.
>>>>> + *
>>>>> + * RETURNS:
>>>>> + * Zero for success or -errno
>>>>> + */
>>>>> +int drm_plane_add_size_hints_property(struct drm_plane *plane,
>>>>> +				      const struct drm_plane_size_hint *hints,
>>>>> +				      int num_hints)
>>>>> +{
>>>>> +	struct drm_device *dev = plane->dev;
>>>>> +	struct drm_mode_config *config = &dev->mode_config;
>>>>> +	struct drm_property_blob *blob;
>>>>> +
>>>>> +	blob = drm_property_create_blob(dev,
>>>>> +					array_size(sizeof(hints[0]), num_hints),
>>>>> +					hints);
>>>>> +	if (IS_ERR(blob))
>>>>> +		return PTR_ERR(blob);
>>>>> +
>>>>> +	drm_object_attach_property(&plane->base, config->size_hints_property,
>>>>> +				   blob->base.id);
>>>>> +
>>>>> +	return 0;
>>>>> +}
>>>>> +EXPORT_SYMBOL(drm_plane_add_size_hints_property);
>>>>> diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
>>>>> index e5b053001d22..5bc8aed9b445 100644
>>>>> --- a/include/drm/drm_mode_config.h
>>>>> +++ b/include/drm/drm_mode_config.h
>>>>> @@ -949,6 +949,11 @@ struct drm_mode_config {
>>>>>   	 */
>>>>>   	struct drm_property *modifiers_property;
>>>>>   
>>>>> +	/**
>>>>> +	 * @size_hints_propertty: Plane SIZE_HINTS property.
>>>>> +	 */
>>>>> +	struct drm_property *size_hints_property;
>>>>> +
>>>>>   	/* cursor size */
>>>>>   	uint32_t cursor_width, cursor_height;
>>>>>   
>>>>> diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
>>>>> index 51291983ea44..1997d7d64b69 100644
>>>>> --- a/include/drm/drm_plane.h
>>>>> +++ b/include/drm/drm_plane.h
>>>>> @@ -32,6 +32,7 @@
>>>>>   #include <drm/drm_util.h>
>>>>>   
>>>>>   struct drm_crtc;
>>>>> +struct drm_plane_size_hint;
>>>>>   struct drm_printer;
>>>>>   struct drm_modeset_acquire_ctx;
>>>>>   
>>>>> @@ -945,5 +946,8 @@ drm_plane_get_damage_clips(const struct drm_plane_state *state);
>>>>>   
>>>>>   int drm_plane_create_scaling_filter_property(struct drm_plane *plane,
>>>>>   					     unsigned int supported_filters);
>>>>> +int drm_plane_add_size_hints_property(struct drm_plane *plane,
>>>>> +				      const struct drm_plane_size_hint *hints,
>>>>> +				      int num_hints);
>>>>>   
>>>>>   #endif
>>>>> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
>>>>> index 46becedf5b2f..9d7c5967264f 100644
>>>>> --- a/include/uapi/drm/drm_mode.h
>>>>> +++ b/include/uapi/drm/drm_mode.h
>>>>> @@ -849,6 +849,17 @@ struct drm_color_lut {
>>>>>   	__u16 reserved;
>>>>>   };
>>>>>   
>>>>> +/**
>>>>> + * struct drm_plane_size_hint - Plane size hints
>>>>> + *
>>>>> + * The plane SIZE_HINTS property blob contains an
>>>>> + * array of struct drm_plane_size_hint.
>>>>> + */
>>>>> +struct drm_plane_size_hint {
>>>>> +	__u16 width;
>>>>> +	__u16 height;
>>>>> +};
>>>>> +
>>>>>   /**
>>>>>    * struct hdr_metadata_infoframe - HDR Metadata Infoframe Data.
>>>>>    *
>>>>> -- 
>>>>> 2.39.1
>>>>>
>>>
>>> -- 
>>> Ville Syrjälä
>>> Intel
>>>
> 
