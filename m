Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7F9839A50
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 21:33:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8417910E155;
	Tue, 23 Jan 2024 20:32:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2087.outbound.protection.outlook.com [40.107.100.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64D3010E155;
 Tue, 23 Jan 2024 20:32:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BA1GyZ2UGuuCvc9loCmx/VA9Njp0y0d/zGGYANaJ8NospvXHwzvB6gyqSpE8eXgsY0+q66o8CWzRt+8QF6Z5rVFNi7T8KQbxuLTIM4XeeNdtPsMUDEocInPZUdz4YQNGRXmN5BrTLftAoW+zGwELRK8+1XtMEMmbz25s2xUvbdluuQ8yPNZv0B9eOhrdEZ5nRJermK9H6YuewAWD9RptnMOV0B1V6Qg7zawPWOYbb7qiDWFg/ucbipoVlgHGe2dZ6iCHml0qguWP9bH7+15Nd9ABrMy7uEiWhMAvNFfcJnIrnHU7IIjjJNYPJq4fGJX4HjP+v7T4OnvS3cF8GKaMVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I0cEdqV6+JblL5JRVXdsZVDDY2f6j4q+eFovycfeHFM=;
 b=hPkzSvAOwHYmUac6m1/xNvv1o2kiOwkDsYyQYtkMNqDnNWakhVe7LXIGLmKQ5Qg7zaDmqxlnE3HiU6nUqrg5RvvK0H5Ra/oQYLTA5cUC7bDK1EJ+Zpe5Bz4DCPx4IM92yDx622IfcZq9XzhYyx7Vo3mQJCM5qXtiHDrNfoGD2GB++Sb/MgopRY8He7q7wA49zQt0XRSSWPPACBEw0Yc+pq3CPuEwTaVRW8efeeH+/Wom3D8G1Gs1DJC3orFwucf1NurGYWOKM5UGfQLoYl51cbJ4HHu+vp0eov+4k94LVq39MRrr6q37KMRLF3ipVqKczlYtFmjdObGNY+07k3MnsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I0cEdqV6+JblL5JRVXdsZVDDY2f6j4q+eFovycfeHFM=;
 b=ORFENkBNq9hCUP3MLOb7Cfhb25kszEoIgi63OUsQWwAiMw54lRvvwG5l0LTp+yPi+pj/y6obl61cYqz+F+kWa+G0FLZmNAMs5J1ThzcrgdjgWc9ZPEKJ1GFu8vxAJBN97ajL5bq0OQXyMFXTU3vBzERHXqDFEu9k7/v9HOjq3P8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CH2PR12MB4230.namprd12.prod.outlook.com (2603:10b6:610:aa::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.34; Tue, 23 Jan
 2024 20:32:25 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::3f6b:792d:4233:f994]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::3f6b:792d:4233:f994%6]) with mapi id 15.20.7228.022; Tue, 23 Jan 2024
 20:32:25 +0000
Message-ID: <386ba5e6-7f60-4b84-bd17-d712d8becf83@amd.com>
Date: Tue, 23 Jan 2024 15:32:21 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/amdgpu: Implement check_async_props for planes
Content-Language: en-US
To: Xaver Hugl <xaver.hugl@gmail.com>
References: <20240119181235.255060-1-andrealmeid@igalia.com>
 <20240119181235.255060-3-andrealmeid@igalia.com> <Zaq-r7UZpEy7_Rrn@intel.com>
 <ca1faaec-461b-401c-a86a-e0929d282b51@amd.com>
 <CAFZQkGyf5MxKeGgz09kgyYTp+g-Jk2uaiQkmzSX7BDGHpcz0CQ@mail.gmail.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <CAFZQkGyf5MxKeGgz09kgyYTp+g-Jk2uaiQkmzSX7BDGHpcz0CQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0121.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:5::24) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|CH2PR12MB4230:EE_
X-MS-Office365-Filtering-Correlation-Id: 344cb1b5-7a48-4a7b-683a-08dc1c5268ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ig6fFt9siG833N3mvgY+OLEdAZHy7UjQnTDmNUniYvZrDi7jDTEXVO5lUwtsjLYQmVxq64bqy9MHfUd7Lqdpfgvmxf7PZqJ2ZqmQmtK48tmItrEfTd/iI92y2TaRrR4QeGPpOY66YW7PnJcXAtCjPN/Oj+K5JQ+EV3RXLcUt/W5/Mc4B99DwiSRZy6spKOg1mVydxwn9WRfjcyV+H/Qfe1G22rcLloRvd7mkRLZxF0YS8lRBG/WbERQ9tgREHTmFxr5fyVHo0gJrJJT8x1K0kIyu4eS07OgAAgrSXkjGXtICp7/T/fADDAzgngsH3C8+V3nX1/EFiAQbzgMHt/wwnRKU3mO22ipjFizEOQWXclYHu8CsAza9/MO8eU0CjPSaluvTogyWy6yuqvTVrjDrodbo/BTTDtsjMLxOPbj7VnqxxG+iFiTk+ugIc9whlBBPFQYD2S6SLYNX9ZPRZoraTuadQJjHQK4b1apyagEAkVWFU/7pCXZzPcH6UD/iesBQHHxBtRo7hzL0qgoVPwo4nziG22ZpBji1m0UR/SaKA4Y4f07NvgBWa+vakyNawFmetDhjHrm+OnapjSnJIRJgsKvaahHcLKERnPgMs/zKpeQduLUevyOx08IZ1eNJKLbUi3zSpy2K6OdmQz1V49xM7g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(366004)(346002)(136003)(39860400002)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(66556008)(66946007)(316002)(6916009)(54906003)(66476007)(6486002)(8676002)(4326008)(44832011)(8936002)(36756003)(31696002)(86362001)(38100700002)(53546011)(26005)(6512007)(6506007)(6666004)(478600001)(2616005)(66574015)(83380400001)(41300700001)(5660300002)(2906002)(7416002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d2ZuVHFtUm5EYUh1N3pmN2FVYTZDQ0hIQSsvQWYwR3ZuNkI1Wmw3bkdoUWZx?=
 =?utf-8?B?RndoV2s3NnM3RVpkL0xTWXZ3SDF0dGxrbEJQM2FsMytHZHQxMGNFczRQWVd6?=
 =?utf-8?B?NXVJb1lpSTZoZnMra2F0L1M1KzIxcG90VWhxck1Mcm9VMUhIZFVMNS9kdCt2?=
 =?utf-8?B?cTJRR0JPMHV2OEdHYlpMWVVuUEtQYW53RUFQSVhZUGJScVg5eEZmVS9FbENM?=
 =?utf-8?B?TkU1SXo4UWs3M3FDMHNHWWJ2WDVycDVRUU5NbU5URkRrV1JzbnlPL3N5c1ll?=
 =?utf-8?B?Qk9kMEFZT0kyTU40dUgzNVU1Rm5YNjA3cTExZTlNTkpja0g4cTVrekJadnJ1?=
 =?utf-8?B?OUwvS293cm5iZzgySkg3VUF1MW43dHlwb2JGa3JZNGFia2czK216TmNUUGlY?=
 =?utf-8?B?aEhkNEMzWmlHQ2xqTlJmVlZ0UDN1cHhhUlExWXZnbStJSjB0RVVIZ2hKMFli?=
 =?utf-8?B?RDdTSjM1U2NFSWg5L0NIZDdaZzZiUVYzblFFYWFZai9iK0VlUFV5b0VPT2xa?=
 =?utf-8?B?Vjd6R3BVQ3c0cmZhV2NraExrdHRlWVA4elNITjJaSUo1TzNUdGZ3ajdIR3cv?=
 =?utf-8?B?QUNLN210K1NrV29RaUxaNDZUNm1HTkcxMk5GanVldUJNN3FRS0JYOXA1Q05u?=
 =?utf-8?B?cXh3eUFFaFZmNlFUeHlZOWhnZHR2UXpwTzdWREM3WkpGRUwrTUFBbHF5UEpx?=
 =?utf-8?B?TmRRRVNpbzRYbHM1RjNoR2c3cHZxV0tmUkJyUjJVMWQ5MVRxTStZY3pmVGMx?=
 =?utf-8?B?cHNObnpVYzhrRVVmTlJseDM3N2sxSW1zTEM2TWZ6d0xESE9McC9kU3JWVDlw?=
 =?utf-8?B?NFRpTUpKbHloQ1pmaWUySGhycHJGaDM3ZE14MSt3d1VKMUhENndDVStlUk4r?=
 =?utf-8?B?SUh5bE8yZ05jbHRPWi9OVW1OaWFnS1pZaWNRNVVQekxtaSs3UGJTSjI2TXFY?=
 =?utf-8?B?cjdYblhjR1lBWVNSaHQ4U1Zqb3lUeFBKc25WRnVkUXl5TUxlSzVCSzF1TmZw?=
 =?utf-8?B?Uk5ZZDN2RjRDTVNoMktyUnYxRVY0dzYydjl3TnRZRHhiUWM0OW5za0hmaVU5?=
 =?utf-8?B?TDJSZDVDLzVPY3gxbjhsMDY0SGlZVkUrSlF3U0VQVW9EVEk2UUN0MVNnRXVM?=
 =?utf-8?B?bWk0S09TVWhXUDJ6YUQ1bUJFeWErTDBzVUZrb0JiTWE4NTNDTTFOMXlRaFVR?=
 =?utf-8?B?TnlEZWhtUFZpemRuN0pURjJCVE0wR3BVUnIyQ2dJTUN6WG9LMW45UXFJVWc4?=
 =?utf-8?B?RnNpeU5UQ2g1MUt2NGE2bEUzWTFxYVdvb2ZSK3BLd0xmQzcyYm9pd3Bmam4r?=
 =?utf-8?B?Z3BwN1FUdXgzcExpMjdwSmhmbytQOWpzNjZFdHBncGdmaUVPV21xNGt2UzZ3?=
 =?utf-8?B?OC9OZHBTa09XNHpSbnFkU1kzcFN1c1E4SG1lVWI3WXhETG9acUdkWDhnQXBQ?=
 =?utf-8?B?NTEyRHViZC9uN3BWQjl4bEZLcHNrUWZMWjdaLzg5aGxGYjFBaG00SXNPTzdV?=
 =?utf-8?B?dHRRdDNzTjlvclhpdEVFVWdRWUsrTEptZHpoeW1lTGxYamRnMmFWZ2hIZW5x?=
 =?utf-8?B?eHVwelFuRjdaVFJQQldWajNsbmNyVi9WQkhlS0FibHdMOHFLYm9naTJDaytN?=
 =?utf-8?B?MG9FbDh6U2g1bmo4QUhIMjM5OW1lN2VObzJTYytCd3BQSnFDdnorRDZRMWhC?=
 =?utf-8?B?K05PSVlvRXAwcmk2TnVXaVNzcDVZRVhyaThqSzFYUmlsWTd2VzI4SVgxVU5W?=
 =?utf-8?B?ZXNrNDF3QWhtdUY2ZW9qdTVrVnE2RzhnQm9HTXZjRllieTcwalhib0c2RFZR?=
 =?utf-8?B?c3g5M05rWmVlRmx2Q3JJWUxOSlErWVg5SXpDdFdpODhHNElkbDJnTi9VSmYw?=
 =?utf-8?B?eTZQQ2pIV3R5VG9RZWJMT055eExtekRGQ3BHMTBqRXdoemViQWZmRmdBVjA5?=
 =?utf-8?B?QlNSc3RPSmNtWFMvcGtRTHd6NUlOUGtaSUx4UWx5MXppc0ZpYVNIbWVEMkxj?=
 =?utf-8?B?cThPVG9hZTlnYzJvN1diY0RKU0I4c0lIc0FzYmROcFdKOFhMSU9tNFFPaUF6?=
 =?utf-8?B?MW5sRUI5OUhtSWtTczNsVnlKd09YUHBoYm1XVUNOMjF0R1BJL2dmdVFTWk41?=
 =?utf-8?Q?Z7OGTAu3XIo6ABlC6woxJfSB9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 344cb1b5-7a48-4a7b-683a-08dc1c5268ec
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2024 20:32:25.6867 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rt/AQ+UbfPEvC7PTO/AMCiF5Cz/uE39EaGxQLVEZdAKVQ8EXmEsBdyOdjryXhcm9tNfjg2unHq/jSkpCbXx5Ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4230
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
Cc: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 kernel-dev@igalia.com, =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Pekka Paalanen <ppaalanen@gmail.com>, dri-devel@lists.freedesktop.org,
 daniel@ffwll.ch, alexander.deucher@amd.com, Joshua Ashton <joshua@froggi.es>,
 Dave Airlie <airlied@gmail.com>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2024-01-23 13:02, Xaver Hugl wrote:
> Am Mo., 22. Jan. 2024 um 16:50 Uhr schrieb Harry Wentland
> <harry.wentland@amd.com>:
>>
>>
>>
>> On 2024-01-19 13:25, Ville Syrjälä wrote:
>>> On Fri, Jan 19, 2024 at 03:12:35PM -0300, André Almeida wrote:
>>>> AMD GPUs can do async flips with changes on more properties than just
>>>> the FB ID, so implement a custom check_async_props for AMD planes.
>>>>
>>>> Allow amdgpu to do async flips with IN_FENCE_ID and FB_DAMAGE_CLIPS
>>>> properties. For userspace to check if a driver support this two
>>>> properties, the strategy for now is to use TEST_ONLY commits.
>>>>
>>>> Signed-off-by: André Almeida <andrealmeid@igalia.com>
>>>> ---
>>>> v2: Drop overlay plane option for now
>>>>
>>>>   .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 29 +++++++++++++++++++
>>>>   1 file changed, 29 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
>>>> index 116121e647ca..7afe8c1b62d4 100644
>>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
>>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
>>>> @@ -25,6 +25,7 @@
>>>>    */
>>>>
>>>>   #include <drm/drm_atomic_helper.h>
>>>> +#include <drm/drm_atomic_uapi.h>
>>>>   #include <drm/drm_blend.h>
>>>>   #include <drm/drm_gem_atomic_helper.h>
>>>>   #include <drm/drm_plane_helper.h>
>>>> @@ -1430,6 +1431,33 @@ static void amdgpu_dm_plane_drm_plane_destroy_state(struct drm_plane *plane,
>>>>      drm_atomic_helper_plane_destroy_state(plane, state);
>>>>   }
>>>>
>>>> +static int amdgpu_dm_plane_check_async_props(struct drm_property *prop,
>>>> +                                      struct drm_plane *plane,
>>>> +                                      struct drm_plane_state *plane_state,
>>>> +                                      struct drm_mode_object *obj,
>>>> +                                      u64 prop_value, u64 old_val)
>>>> +{
>>>> +    struct drm_mode_config *config = &plane->dev->mode_config;
>>>> +    int ret;
>>>> +
>>>> +    if (prop != config->prop_fb_id &&
>>>> +        prop != config->prop_in_fence_fd &&
>>>
>>> IN_FENCE should just be allowed always.
>>>
>>>> +        prop != config->prop_fb_damage_clips) {
>>>
>>> This seems a bit dubious to me. How is amdgpu using the damage
>>> information during async flips?
>>
>> Yeah, I'm also not sure this is right. Has anyone tested this
>> with a PSR SU panel?
>>
>> Harry
> 
> I attempted to, but according to
> /sys/kernel/debug/dri/1/eDP-1/psr_state, PSR never kicks in on my
> laptop at all. The only reason I wanted this property though is to
> reduce the number of special cases for async pageflips compositors
> have to implement; as it's not necessary for any functionality I think
> it's also fine to leave it out.
> 

Yeah, PSR panels aren't super common. PSR SU (Selective Update) panels
even less so.

I'd prefer to keep the damage clips out of async for now unless we
can actually test it with a PSR SU panel.

Harry

>>>> +            ret = drm_atomic_plane_get_property(plane, plane_state,
>>>> +                                                prop, &old_val);
>>>> +            return drm_atomic_check_prop_changes(ret, old_val, prop_value, prop);
>>>> +    }
>>>> +
>>>> +    if (plane_state->plane->type != DRM_PLANE_TYPE_PRIMARY) {
>>>> +            drm_dbg_atomic(prop->dev,
>>>> +                           "[OBJECT:%d] Only primary planes can be changed during async flip\n",
>>>> +                           obj->id);
>>>> +            return -EINVAL;
>>>> +    }
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>>   static const struct drm_plane_funcs dm_plane_funcs = {
>>>>      .update_plane   = drm_atomic_helper_update_plane,
>>>>      .disable_plane  = drm_atomic_helper_disable_plane,
>>>> @@ -1438,6 +1466,7 @@ static const struct drm_plane_funcs dm_plane_funcs = {
>>>>      .atomic_duplicate_state = amdgpu_dm_plane_drm_plane_duplicate_state,
>>>>      .atomic_destroy_state = amdgpu_dm_plane_drm_plane_destroy_state,
>>>>      .format_mod_supported = amdgpu_dm_plane_format_mod_supported,
>>>> +    .check_async_props = amdgpu_dm_plane_check_async_props,
>>>>   };
>>>>
>>>>   int amdgpu_dm_plane_init(struct amdgpu_display_manager *dm,
>>>> --
>>>> 2.43.0
>>>

