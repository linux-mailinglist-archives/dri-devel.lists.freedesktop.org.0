Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F1D7942F7
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 20:19:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B46810E6F2;
	Wed,  6 Sep 2023 18:19:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2056.outbound.protection.outlook.com [40.107.237.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FD1310E6F0;
 Wed,  6 Sep 2023 18:19:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BqD6dlV6x3gGzDsXM0A39z2nuQjkLdvFCpPcRPfWmpIe6si+zt9a8g7pkHMVzEu4ykaQA5EORMHaheR93xuN2cJ65zsycMB2nPQEzg91sxUwOmL6+QExGFfc5EHL6teUKsFhQpHhjWva6Q/Yk+BI7NyJCtnQXt9YuF0R3k9uPT37BYzPDoEE66wEHupzhGfeTQoT2RPOdozLRrL+DJzhDsVxb6Avo06KnZhdXU+fic++c5J4mZvNMny91zIwXRW7fx8etDMvnyNnFD5WW6hxo+eGTDPttSwpJF0+2wsfc/S/nnsx+ga93iY6KVxN91hC/xI2yVjfxGquCctLp96JRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RppE6gSYEpkc7FYjdQuAVBoQgFxyzNmPTkCa/CcikZM=;
 b=Xf7MsRNnvE9NVBrcsgLqCCrqe8gVYiCrTgKcxWiBru2fp3DNcyoUCDdcVJOufM98W7dDiCaAYUnVNEMfU/6olVXfcN8+bjxRT/iFisXxt/wHkS5W7Va0tTtUR1kNnsMBANEnZAN7muDixRzIb7R23JvU8WtwxRjaYE51zpRHa/oIKm+1MZ+qSJolVCVrfmLooBehNp+dLsAVMBfEgbwwYgv6c+cXz88wMxzEGWl+W2vssGbrO06Nyj7mpxn8IB6RI+MZQlXMbakAVgYnlBSAi8wkR0IxaHctB5+pk9ypyHSxFelS02NWdR3YCoZIa6wRtyA5tjc9FjIlR75LpOj4Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RppE6gSYEpkc7FYjdQuAVBoQgFxyzNmPTkCa/CcikZM=;
 b=2EOiLmgBmZkc0fkDjbvJ8z+7ot4KjYdEE6UXnqH25EBsPEj42KY/tnVKIzY4t6mI5fgWCSkhKOJwHiotys1zCxfMBaZlUoafuCaraOMxJ9hMu5GJ6PTXG1iVOqCBVKPVUDjkWhoixcYwNlYneGceQJ0HjreY0ENP/cJm8i5HKdw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by PH7PR12MB7968.namprd12.prod.outlook.com (2603:10b6:510:272::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.30; Wed, 6 Sep
 2023 18:19:04 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::121e:5e68:c78a:1f2f]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::121e:5e68:c78a:1f2f%3]) with mapi id 15.20.6745.030; Wed, 6 Sep 2023
 18:19:03 +0000
Message-ID: <f6903055-5abc-4a1f-9a23-3f9bb9c31c4a@amd.com>
Date: Wed, 6 Sep 2023 14:18:58 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 33/34] drm/amd/display: add plane CTM support
Content-Language: en-US
To: Melissa Wen <mwen@igalia.com>, amd-gfx@lists.freedesktop.org,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
References: <20230810160314.48225-1-mwen@igalia.com>
 <20230810160314.48225-34-mwen@igalia.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20230810160314.48225-34-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQZPR01CA0096.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:84::29) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|PH7PR12MB7968:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c058a28-f310-4cf7-00ff-08dbaf05c039
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gRc8Nc7GDNOAw6YKluidoIxCWNClkNrYGplgOknyHaQ97iYC3Tei7kqsltbYTYq7FjIUAELot3Q7wfHFyUG70fWmpEzt+EKyCETmlUykURwPx8ednFScUWHIld58HZtegCrF+O9DxED4kulRzJnm7DL7V43NgwMjeFyKiqLH5jKLNOFBjxTJhmcoFDvxulSNTBYGqybWY78mjId/aNpOTLMROFfEe4InO0xvRWrGedVdo96AYYrO8bwYYDUB88XDF+zrZI8NrywoapoQXmd1uhc/y83MOBs1Ve+NZmtA6Z3iYzboYv/oExSW3i3SJNSYWzqCbRAQdaJD9mcCZR3tzxWSEvubeDurgd+0zfyWwc3ClhjDB6knc0XpwQyoIf/K03We3AEC5sTuHfHHFlg8a9U5krpESgUsf0o3ZbYXAVUjtuvbjxk/RbxtIz543HCVlQO8MWNCfyt00qwW8AABFageED9nNYmrGKr5IE5VoHqwRN3h8IUakCrey9K9O4dCoJQGeBkKkhBGtxq6vM4+ion1rixYM1rTX/dWgm+RawufyUNhHtqUy6H3tC04ln6V1C5AefDILQJv7MNJ0JvLjrdxsJgbW93O5r1ZX5Q+/nWXmzd/w6UCchHxS755htL+SdbZ4um2L4AZf/HO2VUAmr5jEN3RhW0VrSToS8pYYbE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(366004)(136003)(376002)(346002)(1800799009)(451199024)(186009)(31686004)(66556008)(66946007)(54906003)(36756003)(31696002)(86362001)(66476007)(316002)(110136005)(2906002)(4326008)(8936002)(44832011)(5660300002)(8676002)(41300700001)(6512007)(2616005)(26005)(38100700002)(7416002)(83380400001)(921005)(478600001)(53546011)(6486002)(6506007)(6666004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cFhWTTBjRWp6WVV0d2FaenlQR21LczZKRUw4aERySTgzNnQzYVBaRzhHRlUx?=
 =?utf-8?B?OFUvN2xVYWpEd25lZzN1RWNnd2QvMkxIdFQ2QThaZnJDN1RXYzlTWFVGQWV2?=
 =?utf-8?B?djN1V2wzb0JVUDlhWUVVNjEvQ29NdVRJQ2hUTlZ3TnhVVWdsdEhHNkZMMnJr?=
 =?utf-8?B?bE15WXZ0UjV5QmFCWVVqcHdBNnlhUEtwaGZvRElhQi8xcFRBdVd2bGRpMlVL?=
 =?utf-8?B?eEhCZ2pUUXdtdS93Zi9DblM0cHRBaXUwbmlkOGZHb1NRbzRveFk2aUl5Y1A3?=
 =?utf-8?B?RjZhQm51K1FZc1puTXVLRWorbzRVL0wxZlZ2SVhiWU5TV2syaHhJSzBiRFB3?=
 =?utf-8?B?QTBoLzlQR0RUTTJoUVpJcjNVK1RSaVcvUW5mUEMxeCtsYUFublU5U2ZpR0Ri?=
 =?utf-8?B?VXFiYnNyMnVHUUdwNnE5by9xNDVkbVlFOEtmSXJFZ2N1TGJLYUZyYnN4akN3?=
 =?utf-8?B?NHE4aUFzMWxyZkdPVDhNOWRSbU5HR1ZKcERCd2c5ak1FSW9JMkd5Rkx6RlhL?=
 =?utf-8?B?bnVnYlVXVGlEN1ROQlNzV29QcUpSSHJxRU1EelhiVXAxM3hCVmpVTm1GQlAv?=
 =?utf-8?B?Y2VPT0wxNHo4UysybTZ3SHR5RElVdWV3amdkQVFPR2VXdFRHYnZQMlNWWlkw?=
 =?utf-8?B?ZjRYYTdSN2cxMUJQMEtrMkZlNmRNU2FxNHBHOTlHTnNIOXpJTitGYTVuSC95?=
 =?utf-8?B?ZjVjclY2YkczSkN0Rk1QR0lQZ01lUFlkbmtockFzSHVMMUM4Qi9zTDBYcm1p?=
 =?utf-8?B?cHVRdlZVSnFTSFNQeDlqd08rRXZxeGlIUHdWS0VCUTM1dVlESTlocGR2bHZW?=
 =?utf-8?B?bHB6dDYxVjlsazhJS1VTNVBycmN4bHRxMmM3M2RhQkRCaWI5VWxNaEVTZWJi?=
 =?utf-8?B?MHROU1Nqd3pVQnBXOGJOZDhFblVjUEJ3Z3EzU1NCU0FDSVZoWndkbklIeFhn?=
 =?utf-8?B?bi9ybnVyOWQvUmlrQW1pT1RtTDZlT1BxcVNRVU9NQm53ZjdhVWN2NXpXa3hm?=
 =?utf-8?B?SitQMEVQSEQ4WDRYZkI0dTRremJYRHM5ck5XMXNiTk5lK1JNRjBZanpuNWJN?=
 =?utf-8?B?NW9SY2N4cE9IWUZjMnlocnAzRzhFUjM2MHluRDJOSXc0b0c5UTF2T2thT25s?=
 =?utf-8?B?bUNlamdnR2tabUZYU2J1VWJyUlZHUXR5a1BkaTBta1ZUT1U3WERucEw3dXhl?=
 =?utf-8?B?R01mNG1KZG4xUHgzOUZ1Ukw3djVLYkFaWEZIMGlSWXVTVEV6UDlWR3M3TWpB?=
 =?utf-8?B?WjB2SEttMlBMcHZ0TXhmZmRnRnpEMi92K3J4WDVoVngyaDhlNW45TEhKZC9i?=
 =?utf-8?B?eGFmV2Y0WS9GYlhHVWt1Q210cmpzbkdmN09RRkhMbnliRnkxR08yMXdlSzRh?=
 =?utf-8?B?aGF4OUJXYk1ZanZHd0RiNTVmc09Tdm1wOVJ6dFUzRVNtMTRNYU9OYVNpS2Fp?=
 =?utf-8?B?UjZUc2pPWlhWWjBiaEs1QWpqa05HcGV4RVJTclBobEl0aG1TS3NVRFI3REc3?=
 =?utf-8?B?c2p0UXBCYWxqaHorbythdndTL0FkY1U5WEh2eGNsdmVWUFlWaGlkN0NQWUNE?=
 =?utf-8?B?QnNSMFRPRkZKdmxVSllRTzFjK2M0M0VvSi9NUk5LS0FsSGpYaVdyN0JLNnhR?=
 =?utf-8?B?YVpDWWZ5T1lUQVoxR1hmandWT3VHa3Y4MEZXUWtqbGpzcFhPd3kxTGN4amFx?=
 =?utf-8?B?eXpObHprZEs2bVBQcjdZTGFuMzJQSmdEa29ucFl1ckQyYXloVmxZWThUcmZ4?=
 =?utf-8?B?WXFXUVNwbFloOTNUeVRwbUVVN0RZMjA5cUtaZEZ0MDJKR2dtUHRuOG56TzVK?=
 =?utf-8?B?WkNxYmdRcnZtL211Z3RTQXBwNERNREFHNHlhd0lib2ttaWlibkpoZkY4a1pE?=
 =?utf-8?B?SzRLeG4zWnFrSzYweE1aSlM2WEhCT3pmWWJUN3pSS0hsTGw4NHJoZXhKekR4?=
 =?utf-8?B?c3ZHYTRwM1VSOG5seFFpVnQyZXVGUS9qaFJnRVBhMHZDUzU1WnVsV0N3amI1?=
 =?utf-8?B?Mlk1UlVWQkRXajZiSHkxMkNIeFh5WkZJZituSDJBbm9Qc0FYdGl6SW5CeEYw?=
 =?utf-8?B?WmJDM3NlRUFNVjNQSkMwbERYcXpvTHp5VEUzZE9VQkpYemdydTlLUy9IaU5M?=
 =?utf-8?Q?8hOkdQtLwXA8by/h6SwtfwE2H?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c058a28-f310-4cf7-00ff-08dbaf05c039
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 18:19:03.9427 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E+Lyxua7cq9bJPW4E5/45RZ6KH7NIu1AtpXKAZ02za44LITse/sAy8PQ6ws1QEvhVgKuxegouzHk7TFXMkWGGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7968
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
 Xaver Hugl <xaver.hugl@gmail.com>, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com, Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Joshua Ashton <joshua@froggi.es>, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2023-08-10 12:03, Melissa Wen wrote:
> Map the plane CTM driver-specific property to DC plane, instead of DC
> stream. The remaining steps to program DPP block are already implemented
> on DC shared-code.
> 
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  1 +
>  .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 25 +++++++++++++++++++
>  2 files changed, 26 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index dfe61c5ed49e..f239410234b3 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -9578,6 +9578,7 @@ static bool should_reset_plane(struct drm_atomic_state *state,
>  		if (dm_old_other_state->degamma_tf != dm_new_other_state->degamma_tf ||
>  		    dm_old_other_state->degamma_lut != dm_new_other_state->degamma_lut ||
>  		    dm_old_other_state->hdr_mult != dm_new_other_state->hdr_mult ||
> +		    dm_old_other_state->ctm != dm_new_other_state->ctm ||
>  		    dm_old_other_state->shaper_lut != dm_new_other_state->shaper_lut ||
>  		    dm_old_other_state->shaper_tf != dm_new_other_state->shaper_tf ||
>  		    dm_old_other_state->lut3d != dm_new_other_state->lut3d ||
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> index 86a918ab82be..7ff329101fd4 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> @@ -1158,6 +1158,8 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
>  				      struct dc_plane_state *dc_plane_state)
>  {
>  	struct amdgpu_device *adev = drm_to_adev(crtc->base.state->dev);
> +	struct dm_plane_state *dm_plane_state = to_dm_plane_state(plane_state);
> +	struct drm_color_ctm *ctm = NULL;
>  	struct dc_color_caps *color_caps = NULL;
>  	bool has_crtc_cm_degamma;
>  	int ret;
> @@ -1209,6 +1211,29 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
>  			return ret;
>  	}
>  
> +	/* Setup CRTC CTM. */
> +	if (dm_plane_state->ctm) {
> +		ctm = (struct drm_color_ctm *)dm_plane_state->ctm->data;
> +
> +		/*
> +		 * So far, if we have both plane and CRTC CTM, plane CTM takes
> +		 * the priority and we discard data for CRTC CTM, as
> +		 * implemented in dcn10_program_gamut_remap().  However, we

Isn't it the opposite? If stream (crtc) has a CTM we program that, only if
stream doesn't have a CTM we program the plane one?

Harry

> +		 * have MPC gamut_remap_matrix from DCN3 family, therefore we
> +		 * can remap MPC programing of the matrix to MPC block and
> +		 * provide support for both DPP and MPC matrix at the same
> +		 * time.
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
>  	return amdgpu_dm_plane_set_color_properties(plane_state,
>  						    dc_plane_state, color_caps);
>  }

