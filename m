Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4627B0C35
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 20:52:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83A8F10E596;
	Wed, 27 Sep 2023 18:52:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2071.outbound.protection.outlook.com [40.107.94.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9086210E596;
 Wed, 27 Sep 2023 18:52:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JZZk7/SWEemA2wqutJ2T8JPfGB+cpXhQVUIe1OG+R4VM3lKI76MTKhVMXyWC89KzVSZlEs61fiOQbFkdpPUccfNidkufunbgLzyl/07OkYVAB8a2wVAdDBWwva6pBlWlp+U43/qL5H7pe4hTyFBHQzYsMFYH+N7HoQehFt7xI/BGquM/OWEGaddfrYNyurv4r0qKyptvGfdlcRazXeEAczEZ3O984N9E1Tko4bAJhrhGn1P5z/77lMBpa4lbnDCxwSlXRZKTnKoVMOc5I4hkaSI7MKmMUExNB4hCORSNH314HSw6+IYW1vrACq3eGKFOZAzaovGv699gkZdmSM+qxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K+oTX6mfg8wODe52e59AXzTwalTYMNoKJEsUvLBG+74=;
 b=lT4vbcpiPdz5mShQxvE7H1N0WBHAAsUIQ4HG4B/nndbiMfk8Q5w3Tc2dvnuqDi9BS1y73UBTWkdASR/kU5u6BuJLdZrSe/YhgZBeF89Lh83nhw/m9O9X9vLtjwBHd8vYompp+Z7LwEUn6X1adltKbD11SJe+mTe9rx4QwSH6v6PQHVwksGiUlo1iusixlzv3WdHrpfG8D89otmHo5iRQbT0Um4vT7AzBRybYgk2gF10IVwPaG1L6Vmuv9neXE/KhhZJE3rYpdaV9omlwghj2rn84JbiAX00UBUqrKoEjzKMCS+/79vI5JkLgokxG3Z4R4BO1JM5PgX4PnsXrtDr4xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K+oTX6mfg8wODe52e59AXzTwalTYMNoKJEsUvLBG+74=;
 b=pn3MIYlBdJjBIReXz+X/Y0ibPJ8PV9ThBfhOA9PDdGCyVUl1ZHFNVS1WtR9YVVRKJmxlRXEDowX2QCHXmVDxnKXcSP+UntfJIaBWARkSYB6i0ZgzQpZ7M7O66dFL0j8VmuNeNAQqj2W5VHlF129yaOmuRqKMmPprFw4+uyZAJTc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CH3PR12MB9395.namprd12.prod.outlook.com (2603:10b6:610:1ce::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Wed, 27 Sep
 2023 18:52:40 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::121e:5e68:c78a:1f2f]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::121e:5e68:c78a:1f2f%3]) with mapi id 15.20.6813.018; Wed, 27 Sep 2023
 18:52:40 +0000
Message-ID: <d0048dde-6100-4d28-b3d8-35847a6be933@amd.com>
Date: Wed, 27 Sep 2023 14:52:34 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 31/32] drm/amd/display: add plane CTM support
Content-Language: en-US
To: Melissa Wen <mwen@igalia.com>, amd-gfx@lists.freedesktop.org,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
References: <20230925194932.1329483-1-mwen@igalia.com>
 <20230925194932.1329483-32-mwen@igalia.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20230925194932.1329483-32-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQXP288CA0003.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c00:41::14) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|CH3PR12MB9395:EE_
X-MS-Office365-Filtering-Correlation-Id: edb03737-5316-481d-d86d-08dbbf8aecda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Yb7zH/r6celTi8S5J4CpBD4aVUqEYEECqgHf+DJUe8RFzgip/Tuzh2Vo5eyUqC1jMDInW/H/rKMUAnpbYvn1lm/8A2Fe5q3uQHM7sAOhnnVDNsmG5cMPOR2QH0t5j42w0q5P9yEMbBgf9FmdaoMxvFsDFT+4VMuUAm8BkbhPIltYM9SiPhT0lz49RVANRQBH89LK564RG40u/f17IATh8msZXX1dXtYCOVH4K6V5Xciv+1pwaMGL9X2kQBKeeyOFJVQ7fHauE+SzFg84JgsDfPoUaqwYmdI4FM8jB+TkXAgenVejHpDsbLj3gJgF/pb+0vpixcXTzjEx9pE7vtWREK5IOhpHHoQxkmD/WF0HN7PJo3BQMbKhmeQfAhBQ/w82d4gXZbsPegszAeuPMQgtv6IpFA5kwqUyeUxPo3LWOyaGiKN2hDzXPzKTMKL/4V+YGOC5RV0J2w6Jq2gfkfSwP9TFdOYesRpJJgs36R25x6f7829u1iBPX9WdsOS2omKxhldyNY0DAsLiAePb8G+jLcmIF/tTM+dpyullJcKB8YTwyEfPL5Sn6ypr9npI9M49rRGEctKQPbE2Eap86x1GlJ8uKDZlFp3OB2WLZ/9lMDz1bxaiDFvljeDYf+TNlgkT724zGAhW0nWZYxAPmh9J2grJwK5iwOsR4n99aydajTI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(366004)(39860400002)(136003)(346002)(230922051799003)(451199024)(186009)(1800799009)(86362001)(6506007)(31696002)(6486002)(6512007)(6666004)(53546011)(31686004)(2616005)(478600001)(921005)(316002)(38100700002)(66476007)(66556008)(7416002)(36756003)(54906003)(66946007)(26005)(83380400001)(44832011)(5660300002)(110136005)(4326008)(8676002)(2906002)(8936002)(41300700001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V3QralNha2c3dW1iNjk1M2F6ZlRMQUc2bzhOYXRReVZQVGpLay9OK0lsVE5p?=
 =?utf-8?B?aityUzROeTdkd1Uxa1h4dnhYTzRVTnQ1TGxTRnU1Rk13eWo5NHk5djMrZStD?=
 =?utf-8?B?aVFWMjlCL3RjTTlCeU9mVktMOTlCR28rMWRNSTd4OGFQVGtLalhScCtsa05k?=
 =?utf-8?B?cVlpcm52T2xlOS9jN254YXBadHdPdzNYK0h4N3J2S2hSNzFneEF0Mm9WWXQr?=
 =?utf-8?B?WllqdGg1TnNzblhPRkZNb1J5SDdKanUwdEw1SFZ3ZXJERXJZM2ljN2pRcVc4?=
 =?utf-8?B?Q2ovUGxJMVJNL3o0UFY4OENsTHptcDF4cHcyVnNKdms4MXZVZzRydllHci8y?=
 =?utf-8?B?TEU0MEdmNzJ5cThpMjlBRExwVDhWZW1sRjZFM3ZQWUNXMVRObHl5Z3lOM3pV?=
 =?utf-8?B?V2tVcGxrNVlxZDRkdmpKam85dmVMOU5iUDBJN2luMk82Q0ozQVJqRXA3ZlJW?=
 =?utf-8?B?KzB4VkpUSkhMdEg3NmtpMkJRbW5scXZLL2s3aTRiUnFjazVQTnBhK2JTR0FY?=
 =?utf-8?B?Tlk5b1NoaWpkY3hFMGU3TFZGZklZSTk0UUN4ekpyWUpsV1R3UEMva0JoV1J5?=
 =?utf-8?B?WVV1OVg4SlZ1NGVjcGdXeHpzY1RySit4eEhXdFQyQi9GOCtGUzRLdlVJa0I0?=
 =?utf-8?B?dEgzNkFJRW1NTUM0WDF3ZHNncUpVR0x6S3hNZ0xVRDVBRmhrUkhiTldJb09C?=
 =?utf-8?B?NFJuNmZkbGY3Qm5VWitYUEZ1T3RXbTU4TlRtcXNCbXdlV2dNL0NZdTRiM3cx?=
 =?utf-8?B?MmErNFRLQnlmRjFqL1dVYU1jZm1SalFSYk1MRVZyZDZYdjgxQklzM3JFQXE0?=
 =?utf-8?B?Q29OOU5ydE1PN0Q3NGx0VFN3QXd4TWUvdUVmc0tMZzJKY3ZHMkVrZjZ6N21Z?=
 =?utf-8?B?TnZVSzZqc3dnRnV0MDh5UHhOOWNQRDA1bEZ2cy9SaVRzZmx2TjZMY1AxMlBz?=
 =?utf-8?B?dktNeUFNRjlrZW5UWDl0ZDFyOGdiRWhTUTI5aVhRM1lmK0doWkZDeWliem5h?=
 =?utf-8?B?cUFLNmU0S3hGOVpHcGNEemRJQm1QWmZRQnVhN0hCM0I3Ykp3UEJ0cFYrZ3Q4?=
 =?utf-8?B?VXUwVlZ2cG1mTFcyZmpHb09NNzRLQS95VFNiNFVSazhGYlNkYTcxWnNWcXdn?=
 =?utf-8?B?TER6R0k5Zk9HWDBHNmVPRG9FNTNFaVdmTDdOS2MzT28zY0ZvelBEb3B2QnUr?=
 =?utf-8?B?NWIvRTlKanhQNGJiOXJoZjJycVJoYS8wMXp3ZUtTdnNvYm0rcTMvYmd1SlpR?=
 =?utf-8?B?SWFXNTkyM0R3STZ1eTlSVTVpZU9sbllYbGFpYzROeUl5SUtUbEdGaGFZNjVY?=
 =?utf-8?B?RDhlY01nWlZwa05YT2ZvTG1VWjFXQlFZQWRMc21UMVE4ZGZabExtTTlLVFdL?=
 =?utf-8?B?NzFRbGMxQ2J2RVN3elBqVHNpa2V4R0UzM2ZIbnlBd00wcDFhcmt5MUZMaStG?=
 =?utf-8?B?KzUvOVZoSEo4dHJOR3dsNTZQaGE0aythNVIxNzlycElHeTBLWDYwSVI1b00w?=
 =?utf-8?B?KzlYbGdJdjkwcFRSdEs5RFljYWdlQzhaaHFVOGZqR2NPaWp3RnJlNFgvRUdO?=
 =?utf-8?B?ZW1wZmJiUnNWWTRhaXdDY2pFY3poZWgyYjJwaXpldUd1Vk14eTJHQ2dpQzRX?=
 =?utf-8?B?ZGZMZVAvTCtObGRMVWNXdlErd1BYeWdCNGJJV0ptS3hIZ2ZUOW80S1AwQnFW?=
 =?utf-8?B?OE0xTHRMdTFGZmtKZUVNM2tyNWNpUmlIcS94Uk16WHk4aHFEbWUwMm1uUGov?=
 =?utf-8?B?Tlp5cHNrczRCL2hZNE15MkduZitkS1h6OTBZQWdsL0xNZjN0K2hYYXhWUFBk?=
 =?utf-8?B?UlFxNU5SY0FVbWpCdTgxeGxkS1kxUnppZWJOR0o5NEVoQWFZYVpjdEVvakRw?=
 =?utf-8?B?ODhJMnU5VXBldUtSbGdOZ0tNbm9jVEljZHdOdElxc1RMYlNqbW41NVRqSnNm?=
 =?utf-8?B?V1oyQXFoaVMwOHBad280RXlMV1JobTlsZEN2ajI0SS9iUHp2TUdkVDlUTTA2?=
 =?utf-8?B?SURzT0tXTEN6M2lXcVNmV3RzdkJKU2hON3NHQngrYkczUzd0RHBsNkhnWGFJ?=
 =?utf-8?B?aUsxeXhRMWYwaEUybUcxY3p4ZkJidE1GOWg1ZURJTlZmTk5GeksvWHhGL2Fw?=
 =?utf-8?Q?AJ4KBXrfPGVEhbgT74AxWukGC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edb03737-5316-481d-d86d-08dbbf8aecda
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 18:52:40.5350 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sz8y6/4Pb+wZ0xWc+x+ejuTUINMkD6RXptQDUbOx8W1FowBLREjLt7RzXQzlvBMa/XwrrHFVG4/i1OyD8i9gVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9395
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



On 2023-09-25 15:49, Melissa Wen wrote:
> Map the plane CTM driver-specific property to DC plane, instead of DC
> stream. The remaining steps to program DPP block are already implemented
> on DC shared-code.
> 
> v3:
> - fix comment about plane and CRTC CTMs priorities (Harry)
> 
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  1 +
>  .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 25 +++++++++++++++++++
>  2 files changed, 26 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 581afa7c5f8c..e4edd97982a6 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -9714,6 +9714,7 @@ static bool should_reset_plane(struct drm_atomic_state *state,
>  		if (dm_old_other_state->degamma_tf != dm_new_other_state->degamma_tf ||
>  		    dm_old_other_state->degamma_lut != dm_new_other_state->degamma_lut ||
>  		    dm_old_other_state->hdr_mult != dm_new_other_state->hdr_mult ||
> +		    dm_old_other_state->ctm != dm_new_other_state->ctm ||
>  		    dm_old_other_state->shaper_lut != dm_new_other_state->shaper_lut ||
>  		    dm_old_other_state->shaper_tf != dm_new_other_state->shaper_tf ||
>  		    dm_old_other_state->lut3d != dm_new_other_state->lut3d ||
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> index 26338f565574..944dccd483de 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> @@ -1153,6 +1153,8 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
>  				      struct dc_plane_state *dc_plane_state)
>  {
>  	struct amdgpu_device *adev = drm_to_adev(crtc->base.state->dev);
> +	struct dm_plane_state *dm_plane_state = to_dm_plane_state(plane_state);
> +	struct drm_color_ctm *ctm = NULL;
>  	struct dc_color_caps *color_caps = NULL;
>  	bool has_crtc_cm_degamma;
>  	int ret;
> @@ -1204,5 +1206,28 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
>  			return ret;
>  	}
>  
> +	/* Setup CRTC CTM. */
> +	if (dm_plane_state->ctm) {
> +		ctm = (struct drm_color_ctm *)dm_plane_state->ctm->data;
> +		/* DCN2 and older don't support both pre-blending and

nit: formatting this with a newline before the comment and then:

> +		/*
> +		 * DCN2 and older don't support both pre-blending and

would make this more readable.

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> +		 * post-blending gamut remap. For this HW family, if we have
> +		 * the plane and CRTC CTMs simultaneously, CRTC CTM takes
> +		 * priority, and we discard plane CTM, as implemented in
> +		 * dcn10_program_gamut_remap(). However, DCN3+ has DPP
> +		 * (pre-blending) and MPC (post-blending) `gamut remap` blocks;
> +		 * therefore, we can program plane and CRTC CTMs together by
> +		 * mapping CRTC CTM to MPC and keeping plane CTM setup at DPP,
> +		 * as it's done by dcn30_program_gamut_remap().
> +		 */
> +		__drm_ctm_to_dc_matrix(ctm, dc_plane_state->gamut_remap_matrix.matrix);
> +
> +		dc_plane_state->gamut_remap_matrix.enable_remap = true;
> +		dc_plane_state->input_csc_color_matrix.enable_adjustment = false;
> +	} else {
> +		/* Bypass CTM. */
> +		dc_plane_state->gamut_remap_matrix.enable_remap = false;
> +		dc_plane_state->input_csc_color_matrix.enable_adjustment = false;
> +	}
> +
>  	return amdgpu_dm_plane_set_color_properties(plane_state, dc_plane_state);
>  }

