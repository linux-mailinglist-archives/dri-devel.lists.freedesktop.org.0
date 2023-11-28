Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8449F7FC920
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 23:11:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8FA510E194;
	Tue, 28 Nov 2023 22:11:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32A8110E194;
 Tue, 28 Nov 2023 22:11:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fepQYE3K8pI8gHt1tQkPRp9L/ZsZcc+g66jvR+xbud5qBmi4pt//oRXIVXgCIR57SESAOCW5S6PHVFtHEIQxxDe4qNMQa11Jy2HvcCDuODLaRVeWlkqpTL8EUqIHNrUFyCxi6kcQAMZ9hHAZ9xQHXFILV3GqP63hdUIt8cANGPgNx2EGjsER4Z16w860JYSs+bLz0Dzye1KOcjHrYmV0mfEGuPZinV1KKBDh7hcW/pHciT4TEEZm1Pt2codpVKErn3PZudTef7afwb0rbxiByLBGxBoVyT/HHGZC8WxKNWmxr+IH63fEpNiEOXq8ltSME7vkqaUWXPRoB4FYq86Lsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1MXk5thXgvXcIQBRfKLowsZPRn9UeaerStxEYzzYDU0=;
 b=IFjytmkbouFOu2m4aFa/7/eWO7k9+3v1miYgIYvb64QzNAmtUZrc5Hbflq8Jqpi+HUt1TalLZ7V41obrVZYSREorooZUmvrabkdN/EoItCQkNrSmQfauDoIkNYJkWj2fKYv77/wrXWIL5JYejJFDqgI9g+HjFx1i2UE1DHIQO/Enb6aYkRvdGsg4AOush/gBBULG5jQZ4PWMHWKAt7ri8gy8rJABpsT0vgVwRkSweASTUlL3YdK8BzX6kWiMO21af/FSFnldo2BiigwEwTgY8mKJDV+L8tWZZLjqtFZSf8ry3JKoJwYsRehk0pENE1+Os8M2I5+tMHx+iRiunnOS8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1MXk5thXgvXcIQBRfKLowsZPRn9UeaerStxEYzzYDU0=;
 b=FwsZZB5XkbXYtQsIETG/QyPxSc85zs5lopaydRqU2rZn+e3UOb4yT4J9BHMcQ0QNCkAFdIYEkAZZmBvJYoKwo0701T0nZLA87Fm5z9NsDxmUb3bDVfcewA46EMAiIMJCDjd2E+JglBvDn89b2tCDkZCrf9I8YqJQFb0tXkV9fMU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by BL3PR12MB6546.namprd12.prod.outlook.com (2603:10b6:208:38d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Tue, 28 Nov
 2023 22:11:05 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::5e7e:d568:2bfd:a53a]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::5e7e:d568:2bfd:a53a%5]) with mapi id 15.20.7025.022; Tue, 28 Nov 2023
 22:11:04 +0000
Message-ID: <bc60a7fd-8de7-4856-b5ed-e1172b9b79f7@amd.com>
Date: Tue, 28 Nov 2023 17:10:58 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/32] drm/amd/display: add AMD driver-specific
 properties for color mgmt
Content-Language: en-US
To: Melissa Wen <mwen@igalia.com>, amd-gfx@lists.freedesktop.org,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, brian.starkey@arm.com, christian.koenig@amd.com,
 daniel@ffwll.ch, liviu.dudau@arm.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, Xinhui.Pan@amd.com
References: <20231116195812.906115-1-mwen@igalia.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20231116195812.906115-1-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YTBP288CA0036.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::49) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|BL3PR12MB6546:EE_
X-MS-Office365-Filtering-Correlation-Id: 98810037-98fc-45e6-4669-08dbf05ee994
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RHj9E8FkFvq4HLjYTHqAPPiIW/a0fpSnhqXOSubPZwtaz0gHu9KMnSoWDtxmjb8DJG8xcx4OoBdXwztlsAbcHYaSPCTWxkOhIUaqUZR7Uxy2veHcba4yZ2qF3VCiNRBXFzqVZIl0tfSzDOjA6RYRBOJH4l09z72oihVX2/NGa1vvPpdbnyyt3OLPnZOV7x7C9ft4OwwsMwVgU20cGtCyqHKXOdDvyp1MLBNergHr8AZ1hG4YY5eBZLGjBTwj/UXXuAptIv0kx6uFZ8LRa8+tgSID5MV52uS2/E6gCisPUVSomeaRQFyldAoVnc7L05lXcOHx8gd38YWTtVFkIiSIjLzcBYTCq96wx0lKV1K5eMRaVqsLZBT3b12NpxeBuX3jBu0F8wUnigGZ1zS3k1qNxqyqds/hLFpg3fvIzlbGuiOAll4MpjJlsyePumYzbszjHKRq1IgSqTPBVPRObzp/tebhcso07yqN95GxauMXQPfnwN7DytBNjh8NBYXZxpVtXH2ztBxoDEgnIH+WxNUss/L3PbDTiwuoS/OH4ieGnXMqqUk/up16TnJeiQu9RmFlU0TkGM6ETpqAjhDGK7f40rrESI0HaevUFkEwTi3O9brpZZuIEwFspsakNcQHxVR7clahAymv4h3Ewqo0MB0wGz6YsPxy8BI9RcICiMkZrdU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(136003)(39860400002)(396003)(346002)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(83380400001)(38100700002)(31686004)(8676002)(7416002)(31696002)(8936002)(6666004)(6512007)(6636002)(66946007)(110136005)(66556008)(66476007)(54906003)(53546011)(44832011)(86362001)(4326008)(5660300002)(478600001)(316002)(6486002)(2906002)(4001150100001)(41300700001)(36756003)(921008)(2616005)(26005)(6506007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VE1DM2pCWVpWNW9vYlM4bzc2S0o5aEVCVTRJSnFkWHZOYWVkK0ZUdGFkcHF5?=
 =?utf-8?B?Y3lNQnRCQmRVNXUyK3J5cE1XZVFVRDM0OEFEb3kydi9uVk5ZcDVWS2diWitQ?=
 =?utf-8?B?WUFxYXVhNk5kUTNEdDhPSDJ0YzdtUEFTL2o3aTRFT0xyUEU2ajhxeWo0TWxv?=
 =?utf-8?B?dlRsZlBxVHRDMyszSjU2cm9aUk9zdFJOMjU3SGNxenBOWFdUd28rRmp1WFZN?=
 =?utf-8?B?RzhUa1N0Qk9BTFFkRGc2Ry9HL0lBRmVRT0lpS2NRK2V2Zm1ncmpOVHRlLzJH?=
 =?utf-8?B?SnBvZkgxYllVSStrNWdCQ2JvNGFTNERLOG1sOHpiVGxJbHo0NVhhSHVJSUhx?=
 =?utf-8?B?SEVlemY2dW9mRUlxNko0V1duZm5pNFo4QVEyemViMEV3UnUzNHMwdVRHSXBr?=
 =?utf-8?B?dEg4cnhYeWNxUGVYVldzb25jWXZ5RFpETlI0S0hYYi9RcHlMOTRsRUlQTHhK?=
 =?utf-8?B?OUs0NDZlSzJIYWx0QzlQMHpyZ2hRVy9MZkttZWphcEk4QWl5ODRJWnhXV3VB?=
 =?utf-8?B?Y3hBejJlT0QvSDhQMEJQVHNlUXpTRWp0aWZLdEhXMC9HZlMwOGVsaURWdlBW?=
 =?utf-8?B?cW1ITGZNOVN5NHpILzhldjBPcHRtYm1EYXp0SHo3aG9FMkhvdUh3b3Y1ZUI5?=
 =?utf-8?B?ZmZBK3AzRUlPekNEYmlyMi8zV2tVQ1ZWZUQvQStib1RQYnY3NG9VK3lLd25J?=
 =?utf-8?B?ZWlXbGdxMUtaSUlyT1BvVmVCZGhvRUUvUCt6cU1jbStYMHpTYnp6MTlzaXFM?=
 =?utf-8?B?RWRSQ0lrMk5JVEpxYmlVTFJkeEgvOUpMQWpXMklNNTVJOTYwbEJrWXRUMlpD?=
 =?utf-8?B?a2h2c0dxVUROcU5jZHlSdVZKZDA2d05iSjZycmpnOXR4UlNGazFxN2JaZFFm?=
 =?utf-8?B?b2RXaVBrb3k3ODRMbXF3MG96S0xyS29aaWdBTFdMbGx0RU9ybTBsTUtXUkxv?=
 =?utf-8?B?Qk10RCtJdm9tNUg2NXRjY2JUOGoxSEJNL2N2Wkp4bXExS2E0U2dDOGhuaEl2?=
 =?utf-8?B?K0FNamR6dnlqZzcxU2pYWmNOdFZYVEVrTzhNcU5HU1RWNFpiWThyNUxML2xI?=
 =?utf-8?B?azBiM2I0cEphc21WeWNJV0JMTUVzckFtSG90TGJXRUlSNm9oU3QxRzk1emlq?=
 =?utf-8?B?OERvRGRUa0hVZHRzMFVxamx6K1BBaWFJNUNibktzcVlRYURmdXdBc1pqRS81?=
 =?utf-8?B?RHRIOW9UL1FxSDJzVEIxNUxOcTlsVzlYVDJZdThBdER6S0wraC8yUDlkZjZT?=
 =?utf-8?B?ay9zd2xvYkJJTWdCakNnUjV2K1BaZjkxT3habFNXSlVxcGtObkpETEN2QnBp?=
 =?utf-8?B?Ym5TSU5abEJyejVNVnI2eUZROXh0M1dXS2h4dk5tcHlwUnBHcTJBWHdiM0V2?=
 =?utf-8?B?OTB3S3BDeFJZYjRCSTRoQnlIdDZWQnVIWTIzTFg5eldzcDJWYmhFTHplS1RC?=
 =?utf-8?B?R3ZXTk9nVTBpWHlUK2E0MnRNUUhuOUNIZHA4blJYbGlZbUd0ZVFkSm5XU09j?=
 =?utf-8?B?S2xPaXhmUDFTV3FYR0NMTU96K1h4Z21SYm92UGVpN21zaURxcnVjMC9sUnMr?=
 =?utf-8?B?YWdSQ3Jpeno0WjNva0Q5L3Rzelp6ZlNXL1NvK0htVWdSY1ZxM0pIejB4WWEr?=
 =?utf-8?B?Vjc3dXVGVEU2MW1NRmlGcTRyZUV1MzJNck9Ua0YvKzU5UHpHekhSWCtOcnpq?=
 =?utf-8?B?UzFtN0d4Q056bW1xNHFiWEs1dmtMWFRnSUlsV29aN2kyeTEwV3cxOU5XR1hk?=
 =?utf-8?B?MWF4dEFNOFB3Vk1LaDZ3V1dGcXBRU1RSZTNJL2p3Ykdad1NJZW55Q0tmY0d2?=
 =?utf-8?B?TkVYak9oY0xVRUlrdngxRmdmd0gyMUVLTHJCbDBralZrVmQ1TkNuZjdkVUw4?=
 =?utf-8?B?bDgrRk1CbmdJRVVhMU9rSFZ5MXdYTUJ1VEUxQWhqditLWHAvTmdybTdJU0NE?=
 =?utf-8?B?dzRLRHlKeWRuNVRFYnJjRVpGUHdzZElvYXliNmxKNi91RDN3QTlTR0VNZGk4?=
 =?utf-8?B?RC96Wm10SEk2R3p6T2lVNnFKcFNzQ2ZUOTU4S3FkWXhXRDNEVXpnbnQzUEd0?=
 =?utf-8?B?S2t4OFBTais0Ym04MHk4eVR3MGZRanhJQVZ2ckFXakpBaHFSS1ZoQi80RHJX?=
 =?utf-8?Q?VD7md3+r0rEnomkhAepR5bCRz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98810037-98fc-45e6-4669-08dbf05ee994
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2023 22:11:04.0906 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nHaCwBYFpxXts7mJYDeXt3HnjVIa4AYXB5STq5pgyL+f9WWHhh3UKHBzOSg52WIbEpjxnDI0ReZVdbCoVUpR1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6546
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Shashank Sharma <Shashank.Sharma@amd.com>, Alex Hung <alex.hung@amd.com>,
 Xaver Hugl <xaver.hugl@gmail.com>, kernel-dev@igalia.com,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Joshua Ashton <joshua@froggi.es>, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-11-16 14:57, Melissa Wen wrote:
> Hello,
> 
> This series extends the current KMS color management API with AMD
> driver-specific properties to enhance the color management support on
> AMD Steam Deck. The key additions to the color pipeline include:
> 

snip

> Melissa Wen (18):
>   drm/drm_mode_object: increase max objects to accommodate new color
>     props
>   drm/drm_property: make replace_property_blob_from_id a DRM helper
>   drm/drm_plane: track color mgmt changes per plane

If all patches are merged through amd-staging-drm-next I worry that
conflicts creep in if any code around replace_property_blob_from_id
changes in DRM.

My plan is to merge DRM patches through drm-misc-next, as well
as include them in the amd-staging-drm-next merge. They should then
fall out at the next amd-staging-drm-next pull and (hopefully)
ensure that there is no conflict.

If no objections I'll go ahead with that later this week.

Harry

>   drm/amd/display: add driver-specific property for plane degamma LUT
>   drm/amd/display: explicitly define EOTF and inverse EOTF
>   drm/amd/display: document AMDGPU pre-defined transfer functions
>   drm/amd/display: add plane 3D LUT driver-specific properties
>   drm/amd/display: add plane shaper LUT and TF driver-specific
>     properties
>   drm/amd/display: add CRTC gamma TF driver-specific property
>   drm/amd/display: add comments to describe DM crtc color mgmt behavior
>   drm/amd/display: encapsulate atomic regamma operation
>   drm/amd/display: decouple steps for mapping CRTC degamma to DC plane
>   drm/amd/display: reject atomic commit if setting both plane and CRTC
>     degamma
>   drm/amd/display: add plane shaper LUT support
>   drm/amd/display: add plane shaper TF support
>   drm/amd/display: add plane 3D LUT support
>   drm/amd/display: add plane CTM driver-specific property
>   drm/amd/display: add plane CTM support
> 
>  drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h      |  91 ++
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  34 +-
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h | 108 +++
>  .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 818 ++++++++++++++++--
>  .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    |  72 ++
>  .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 232 ++++-
>  .../gpu/drm/amd/display/include/fixed31_32.h  |  12 +
>  drivers/gpu/drm/arm/malidp_crtc.c             |   2 +-
>  drivers/gpu/drm/drm_atomic.c                  |   1 +
>  drivers/gpu/drm/drm_atomic_state_helper.c     |   1 +
>  drivers/gpu/drm/drm_atomic_uapi.c             |  43 +-
>  drivers/gpu/drm/drm_property.c                |  49 ++
>  include/drm/drm_mode_object.h                 |   2 +-
>  include/drm/drm_plane.h                       |   7 +
>  include/drm/drm_property.h                    |   6 +
>  include/uapi/drm/drm_mode.h                   |   8 +
>  16 files changed, 1377 insertions(+), 109 deletions(-)
> 

