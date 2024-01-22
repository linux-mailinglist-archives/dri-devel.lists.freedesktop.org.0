Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9308368F3
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 16:51:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9DDD10F3FC;
	Mon, 22 Jan 2024 15:51:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2056.outbound.protection.outlook.com [40.107.92.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABFD710E111;
 Mon, 22 Jan 2024 15:51:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yncd9T9hz+sDSlrr5cByKM6+4bVY/E57EWblaY9BtkAZ2JVlqsJXF9Pqf4DYOfXWYHr4TR7fTwzy+tK5ZTeUsCkt8j1CGm+MEeJlcSSWymi0KwQunBWiaFMScl0ytzNYoSLyLX92CYD21ANN0rZj2W2PJnUcHIwzrTtqY+FpAanMxwuxpv96ThZETkBn+n0ZeVizVXIcsFGyHBCNzZSG/idIs2BhaKK2ZQVoJrlHIqMI4XJ43pZO4FT/UajSvaTgWqGD8u47IKixWrACYyZENSkRPIifd+AnAXJzhHtxH6zGVwfZIBqnyEi1poJ/9IR93NPXLNDzZEtocaYNPWcMYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J2XVi3eSZ5D8q1eTjepiXFv2aPbkAy7Twd66eqao4qg=;
 b=FCocUNFrT8rhowLY3YNyQNCcysamtA5y2IkBgX+dzFf1cHTo4/grRZtfznteA6YKn1PEHAlhXL5Jxrzn8KCwMmI5j03oLHWm3D1O3G6y01dut5r5HK23PusVBYkuzUwByNAhfN5fM5g+KrEJev5ty7sIZcTMq1lpDbthFeXLRpArsSOghDkZH/7+V8sYzii/Q4t/SXOxvXti8Gy8qQfYixa/jipfStZdU8DwHMuQLUFGjfqYgV0lFyfKoClAciEV4WHU9vS9MkVArRXIzYyPO+qOey6gf6SUn5HRE4kNYk7U6vZDJUXBa5y5MT/eWXl/YEICkU5tSzufsaEUZnNfPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J2XVi3eSZ5D8q1eTjepiXFv2aPbkAy7Twd66eqao4qg=;
 b=Rw8SPQRij3/COkVi5gfSU43eX2vBfNzE5FPxpoVquc9bwtEd5CFVPtDw1BanZdVaaDDMl9oau99fXoTIeqK8NhaxkrT5MoNQdlBQVjDj4tVS5Kwupq0hPeFQo+wfKnstvrAIFBz1DQuMcpzyJAGMoeV7USDLKAUkj8x8JVmjpQw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by DM4PR12MB6159.namprd12.prod.outlook.com (2603:10b6:8:a8::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7202.32; Mon, 22 Jan 2024 15:50:52 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::3f6b:792d:4233:f994]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::3f6b:792d:4233:f994%6]) with mapi id 15.20.7202.034; Mon, 22 Jan 2024
 15:50:52 +0000
Message-ID: <ca1faaec-461b-401c-a86a-e0929d282b51@amd.com>
Date: Mon, 22 Jan 2024 10:50:48 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/amdgpu: Implement check_async_props for planes
Content-Language: en-US
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
References: <20240119181235.255060-1-andrealmeid@igalia.com>
 <20240119181235.255060-3-andrealmeid@igalia.com> <Zaq-r7UZpEy7_Rrn@intel.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <Zaq-r7UZpEy7_Rrn@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0035.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00::48) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|DM4PR12MB6159:EE_
X-MS-Office365-Filtering-Correlation-Id: 02945968-323a-4ae8-3a13-08dc1b61e9ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9H0e4L2/+RgP3TH7a0Z0aLxSaISeuY/eBWXk1gRwDdJ0prR/Z187tvlfr8ODfV8Ts/ijWwLYjkaAy8Me9rkRIdtleUIZtvcis8juWCsJJ6Ud6VQvQKsjArSr9eoIBd7WuO7T2ws+YSkWgplguhhDepRTzqVcIDbN8e/zyCL3c1VYUw/U1HwqIxM57JGbSx76SfpVeF6WdaQmY3sC+Y53Ht/ec2y2BrEvswVLe2AOZcm88C5nllSMZZh2FgDfn4kqsIRJ7YfSdEgoq6kGgo7OwspOCveEs4eyuVAzM4OcSuFKUJSR7YnYoDbQY8yZW8NK5k3OHGHDuzCIXgl5ouOTExPGZiV9yfyqU/5dPR0Z8v/LnYSJk+7TfnxYDzZZNrh3E6jxV88vbw0UHgzdc8BKIXcmllrPtOgrugmCAd6gdI9TC1U0zmaHQfNfxKfwYtRdQO13v42ijS9boNpctIjBSNOqgFYYCcRC4mVdM6u1Ug0Qdme5fOYZZxnoFc/1viIkNNjofjBBzI7loqvL0RhMYsKZ7xHQkVBePYm6DoGPs9F7xdC8735Do2w+x0SpGHilAbqHEdz1fyimYQDzmmYiUbHODx0jjiJwe4hRzAvrUhMpscpHyrli6FUXNnNF16OV5jMm8w3UXjeNZeLfdwo9EA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(396003)(346002)(136003)(366004)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(31686004)(2616005)(6666004)(26005)(6512007)(53546011)(6506007)(86362001)(31696002)(36756003)(66574015)(38100700002)(2906002)(41300700001)(8936002)(44832011)(4326008)(6486002)(83380400001)(5660300002)(7416002)(316002)(8676002)(66946007)(478600001)(110136005)(54906003)(66556008)(66476007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VUxGQTNXUm05UmRUSFFCdzhaZEg2ZHdYWkErRkMvRzBKZXZKdjdaK0dJMlhL?=
 =?utf-8?B?Mk85Mnkva1FtS21yK3UrSU5KRFEwblhQMUljQ2tkWmREVzJyZS92dGE0TUU4?=
 =?utf-8?B?UmdMNzVETDJuTFVUR3BuZlRWbnFtWVBBNkd5M09YZE9nQ0p5VW1wYWl1elhi?=
 =?utf-8?B?NW5nZlYvYW5rbUNjcldlNWYydCszNHVta1RqUEpWN1YwNmtwWjNVVVJ2UXNC?=
 =?utf-8?B?dXRsSEM5TFJ3V3A5RFZ1eFlJOWdGb3NZL01SbzVicXR5c1VBSk5CdjNQdUY4?=
 =?utf-8?B?ZVZoYVNhd084NVFtcCtqZ0NVZ2FtLzIrMXgvQ0Q1MXJrYUtTcjE0aElzR2VS?=
 =?utf-8?B?UVdKL1pwSW1KY2FSSGhvS2VaR0gwelJSUFMrcjR0cU1QM0ExMHRHUnA2VjRV?=
 =?utf-8?B?NFcwUTZKK1JOZXBoVUc0YktXV2RUa2RuUzlseGk1QUl3WmRjLzZQeWNGOUJ5?=
 =?utf-8?B?dWROYkgycEFZNmlUTm1GVGYzNGpsZ0hxS2ZLSlgydXJKek10S056VW5kbDkw?=
 =?utf-8?B?Yjc4V2NLKyswVDU0cXFUZElVQ3VrMVA3aFYwM1RmcVpDazJtNXFRQVU5aU81?=
 =?utf-8?B?R3h5Tk9VeUJqOG0rNmZWK3dKdXFrVWlFRTJHV0N0RGovUnJ4VEJYS1VNVitS?=
 =?utf-8?B?c29Jb09xRE1HUWczb1ZFeWFYZXM1aTEyYldxRjRzRWRJRml3bXdzTlAyVmJJ?=
 =?utf-8?B?R3hBd3VoSHJxenRUbCtaV2cwZW8vYzVVaFFsdXlUa25hZHJXSllndldOT1o0?=
 =?utf-8?B?dnBtRStQQkJTU2I2eEZsK2JOam5pb0VTaWkySURTOWUrOEdyOXUxY0JOYWpj?=
 =?utf-8?B?YTQrZHNYMnRLTjRqdkpKZDVkTnJnS2c0WkFJWkRXUmFsSmEwSUhDTENnckFW?=
 =?utf-8?B?dExBZmlsbStldTEzUDBCQU0wbzVlVGtBOEs5UHF1RC9OcFR4OHNZQTFVTnhp?=
 =?utf-8?B?SkFteXN3ZCtzdXBFQW55OFd1RUx3d3RMajF6Q0pxeDM1YzZYcWdkSHNxbE9X?=
 =?utf-8?B?M09FdXhOeHRXTW9PUG1sem1WcHkxNFJXNmNKVWFaVEk2VDhEYU5EMWhxWkJv?=
 =?utf-8?B?cXhpY29SVTJtcDg0bXo5R256ckZhSW1PZHZzL3llVVZhUi92UTZoWi9hRkpS?=
 =?utf-8?B?ZGtUaytvc2luaDFKcHBYM2xOMWtxcUpZQ3NGb05kNUcxdkMzdnBzb2V1c2pj?=
 =?utf-8?B?VnBaOVRDZFhWSjM0Z2V2RlAwK0xsS1RTQXdlRHFnZjliYUY5RzNrY1hGd3Mz?=
 =?utf-8?B?akJTZ3JiYitjWU9tM1ZSU0cyckowazljdFJXU2RZcEpLZStzWlQ1S3JwV0xl?=
 =?utf-8?B?WHdKd2ZkWDgvVVE5UUdDaUNmRjB6OWtDMmI4ckZOVUtQeGQ0endMMEpMaVZl?=
 =?utf-8?B?dHhmelRLME9Mdkw5S3hCVVBtTXFEZHRBaDE2QlhkNEJ6U2xrQkRpQWxQakhn?=
 =?utf-8?B?UGd3WWd4ODgxb1V6TDYyaU54YUNwT3BUMExZVkh1Q2tGaFJ4T1ArMDZ2NE9V?=
 =?utf-8?B?blJXMDMyaXM3KzdBd0hOUURXYU9OMmk3ZmpOeDFGQlZETGZ2dmkyUkdFTGR1?=
 =?utf-8?B?dDU3ckU5R0ViTCtQdklwYkVINFl4M0tNL212SEIvMXJmbi9WVHJIYkdubVlY?=
 =?utf-8?B?K294Y2VKdUM1K0RScjNOUmJjSGEvbFlmb0lZRkFZaUFLNWRnOHVsKzNkdmVS?=
 =?utf-8?B?MXFGeXdZSm5ZTmZwbjVJVDZqczNNdlJLY1NlV3pjeGIvem01RmlQQ3YrbG1w?=
 =?utf-8?B?ZStxSG1SYisxU2R3enhLMHRscHpyQmF4QUErYjg4aEdkelFYY2VpK2diVlo2?=
 =?utf-8?B?R0tMeCtwaXJGdThLbmhIaGo3aks5aXYrSGdvbUo3MHlXcFVyVmd1Z1ZFaGJF?=
 =?utf-8?B?WUNIeXBqcHhpZVpEbGdxeU15VEtrM29SQXdKem1kZlBaNnNHZ0YrQ1RINld6?=
 =?utf-8?B?QjlFTkhoNWtSczZXVVJHOUl1eSswVzBqaWJKOU1jN1VmTkJzNC85ODRsck5R?=
 =?utf-8?B?elk4eUlCdkI2ZWw4OU5GSFNoWDMwaXdYWjdacTIyS2ZpL0dXclVDSmNqcWdW?=
 =?utf-8?B?YlJwMStNSWVOckVodWRIL0w5UncvbmpJZURhOU5waUgxMzRmZXJZaklWMXFI?=
 =?utf-8?Q?ai2j853y8rKiTIhQxdwwxVZwt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02945968-323a-4ae8-3a13-08dc1b61e9ac
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2024 15:50:52.8208 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0ns06GYIKmBbXZDnwUOrjkoWcFcUXRg+VsTGHIELWaf/dXADvGwcmrcM8CNjaXrfKxtSNVeyAvzFn61v5uYE8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6159
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
Cc: kernel-dev@igalia.com, =?UTF-8?B?J01hcmVrIE9sxaHDoWsn?= <maraeo@gmail.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 Xaver Hugl <xaver.hugl@gmail.com>, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Pekka Paalanen <ppaalanen@gmail.com>,
 dri-devel@lists.freedesktop.org, daniel@ffwll.ch, alexander.deucher@amd.com,
 Dave Airlie <airlied@gmail.com>, christian.koenig@amd.com,
 Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2024-01-19 13:25, Ville Syrjälä wrote:
> On Fri, Jan 19, 2024 at 03:12:35PM -0300, André Almeida wrote:
>> AMD GPUs can do async flips with changes on more properties than just
>> the FB ID, so implement a custom check_async_props for AMD planes.
>>
>> Allow amdgpu to do async flips with IN_FENCE_ID and FB_DAMAGE_CLIPS
>> properties. For userspace to check if a driver support this two
>> properties, the strategy for now is to use TEST_ONLY commits.
>>
>> Signed-off-by: André Almeida <andrealmeid@igalia.com>
>> ---
>> v2: Drop overlay plane option for now
>>
>>   .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 29 +++++++++++++++++++
>>   1 file changed, 29 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
>> index 116121e647ca..7afe8c1b62d4 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
>> @@ -25,6 +25,7 @@
>>    */
>>   
>>   #include <drm/drm_atomic_helper.h>
>> +#include <drm/drm_atomic_uapi.h>
>>   #include <drm/drm_blend.h>
>>   #include <drm/drm_gem_atomic_helper.h>
>>   #include <drm/drm_plane_helper.h>
>> @@ -1430,6 +1431,33 @@ static void amdgpu_dm_plane_drm_plane_destroy_state(struct drm_plane *plane,
>>   	drm_atomic_helper_plane_destroy_state(plane, state);
>>   }
>>   
>> +static int amdgpu_dm_plane_check_async_props(struct drm_property *prop,
>> +					  struct drm_plane *plane,
>> +					  struct drm_plane_state *plane_state,
>> +					  struct drm_mode_object *obj,
>> +					  u64 prop_value, u64 old_val)
>> +{
>> +	struct drm_mode_config *config = &plane->dev->mode_config;
>> +	int ret;
>> +
>> +	if (prop != config->prop_fb_id &&
>> +	    prop != config->prop_in_fence_fd &&
> 
> IN_FENCE should just be allowed always.
> 
>> +	    prop != config->prop_fb_damage_clips) {
> 
> This seems a bit dubious to me. How is amdgpu using the damage
> information during async flips?

Yeah, I'm also not sure this is right. Has anyone tested this
with a PSR SU panel?

Harry

> 
>> +		ret = drm_atomic_plane_get_property(plane, plane_state,
>> +						    prop, &old_val);
>> +		return drm_atomic_check_prop_changes(ret, old_val, prop_value, prop);
>> +	}
>> +
>> +	if (plane_state->plane->type != DRM_PLANE_TYPE_PRIMARY) {
>> +		drm_dbg_atomic(prop->dev,
>> +			       "[OBJECT:%d] Only primary planes can be changed during async flip\n",
>> +			       obj->id);
>> +		return -EINVAL;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>   static const struct drm_plane_funcs dm_plane_funcs = {
>>   	.update_plane	= drm_atomic_helper_update_plane,
>>   	.disable_plane	= drm_atomic_helper_disable_plane,
>> @@ -1438,6 +1466,7 @@ static const struct drm_plane_funcs dm_plane_funcs = {
>>   	.atomic_duplicate_state = amdgpu_dm_plane_drm_plane_duplicate_state,
>>   	.atomic_destroy_state = amdgpu_dm_plane_drm_plane_destroy_state,
>>   	.format_mod_supported = amdgpu_dm_plane_format_mod_supported,
>> +	.check_async_props = amdgpu_dm_plane_check_async_props,
>>   };
>>   
>>   int amdgpu_dm_plane_init(struct amdgpu_display_manager *dm,
>> -- 
>> 2.43.0
> 
