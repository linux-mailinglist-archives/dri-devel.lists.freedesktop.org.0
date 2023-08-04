Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB36770719
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 19:29:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 831D310E73F;
	Fri,  4 Aug 2023 17:29:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2089.outbound.protection.outlook.com [40.107.93.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A60D10E73E;
 Fri,  4 Aug 2023 17:29:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tyd6UftbNxuwg8tGzuLcuT7AnHZw7G5sYhxNX1HkizbMfPQFtMVNey3QzyDzWb7ZvwWzEGIrvRwFQ5su52IwHIrsqOJZItE0hcP+b+Qy4nUgz90ckuz3aWrGZlHcz6LNw/IF/EgBy+tINSKLU7cF7u3L6SDV+rffC3UjzSxu295C00ukcJLdAaL4fOYSXHlzJzsygRIqcgUDBuNWVguSYV19BXPldHRyrNHsTWwkMPGBcLhtUCIkGWhW/a/+C4hTCwR0T7yBzRRiLmW5cQE7GDVNa3BIDLRSZvC+bI/2DmTX57UIGv9+pkTCpctZAO6cvTEUG1Qnj+6YlfY1faSVHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9UeRA0V/IUjHtKcSqukMXqoPmIiycka/e1phoSv0vBI=;
 b=LEPbH5DTxvoqA+QQKlSJUd7Anjd/x0ltrsJtSNmA1meXUYL45SnQLO6Uav+J5nOFlQuwXZjsovtm74tGWGAjPj7XxBIF5LaqgQ7fiqe49awhfhz2PzXQPwfqFxohnl5MOYo0sG3qloIf49JLCf8DXTONxks37rYBqh15nGwZdJC32+Rd3JeeHDdm85OfjXkv68Pk64MC3lHswvdkwF9m7gLHe2slvYJ/Ip94/TtEpG2BbBGyq7RtLCYlsNLi3ODeUMSb3iyCl+MJGBjT9G+tCxLotUfb27st1cgE6cTuzsY42LhGG/T4F9MT6Q8Ab1uFaiD1ZFssfYpyxJUKphL8sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9UeRA0V/IUjHtKcSqukMXqoPmIiycka/e1phoSv0vBI=;
 b=HgdvEp9OK7NMaRv/2AZTv0CUEFE2XF4cgmGBfffMGTqXw33X15sxNs+xVxSBRdWKpdJMpSt3ltJ4Dp43W+5Sl86Gjr0FwETqnD10G3ZHZ0D8hd1WrrW7kFaru7OcjYAXGS5qBHaxvadUbZummj4qxpR43qO6CQpTuyrcJ4luDo0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by DM4PR12MB5843.namprd12.prod.outlook.com (2603:10b6:8:66::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.21; Fri, 4 Aug
 2023 17:29:27 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::236b:d4e2:6fbf:6c2b]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::236b:d4e2:6fbf:6c2b%5]) with mapi id 15.20.6652.021; Fri, 4 Aug 2023
 17:29:27 +0000
Message-ID: <047be9da-5757-4793-a288-90e51fd0d899@amd.com>
Date: Fri, 4 Aug 2023 13:29:08 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: ensure async flips are only accepted for
 fast updates
To: Hamza Mahfooz <hamza.mahfooz@amd.com>, amd-gfx@lists.freedesktop.org
References: <20230804155613.117310-1-hamza.mahfooz@amd.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20230804155613.117310-1-hamza.mahfooz@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT1PR01CA0146.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::25) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|DM4PR12MB5843:EE_
X-MS-Office365-Filtering-Correlation-Id: 36b18842-0fd4-44b5-0ac7-08db95105a39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v3QE5C9Ww0oLmm2AFn/vUKhPkp5+3zWBwvbuLVTdk6noyGaK7WADAD8L+HQoU7IAmmLrqim2qhDajZcnHnfsW+Lymyki1MKt+j+u8Aqsr0uiOh2NMKpgkHDQcWx2rHkP1H9uTEoGIQJCgGx9c6jFkDtMrjzGFv6bQIKCSglT8zCVRpiby4OwGIW6GVQwlKmhPryZkROmBLlY/D60ajjYrOeuY5jH1LEiONRB+Ntc49cGV6oCx/nKvUrC9b3ZsfT2dz90OZQQCsYwm+aoYaJckJAySpH7/llgmuMOC3KZ++iHqzp4mks4NjbWmQTmel4qfswdhryJXsjRA8tqYvZYwV+iRZzY3+6/SwRRl7dgVE7Hvjm8dLnk2ko2nlpD6qRG5XU1YtpOmYJO0JUOWOQP2JWPkkYEZTtJYYJbSe12xbHYrrfS5+KGHMEMbeo963ZQY6JXLr9HD5NuU6TnLkG0FWbpK885zsi/RpDrzoC6JNYP9h8ZsTnpDFXhe46W6PEAekQLrfSpFANcTxPhkZG/xrbpL7jfyOLaKLJaINC700DUV+HVv9NFye1EzK7ZBl26ZyuCUMG6etmIGgttmDn4YK31tdV+S5NK/eO9XxNlD4QX7WdDSg/sTrOiY0je7j6nE7TykNhAcBWNW3ZFHBCcsg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(376002)(136003)(366004)(396003)(39860400002)(186006)(451199021)(1800799003)(44832011)(66476007)(66946007)(66556008)(4326008)(2906002)(38100700002)(2616005)(53546011)(6506007)(7416002)(83380400001)(54906003)(86362001)(6512007)(31696002)(26005)(478600001)(36756003)(6486002)(6666004)(8936002)(8676002)(5660300002)(15650500001)(41300700001)(316002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVJwL05nMFlHaENrTVNWaE9wUTZ0blkwc1NhRmEvWW5rUXdvbVlnY1pMYlVl?=
 =?utf-8?B?NkpCMFBXTlNMQU1xN0RDZFVMc0s3S0t5clpJZXJqRGNxUWN3T1VKeTIvOUVS?=
 =?utf-8?B?UFVGY2s1NUlIMk40anROa216aklGVUcxdGNTS1N5RVJnMVBwQVJnM240alVh?=
 =?utf-8?B?NnYwRW16dC9tT1d4SUNubWNjRllGaXhmNmJwWDJmQkF2NU54RGtJakNiSWY3?=
 =?utf-8?B?Tktza2JIVFdmdHhVTVZCMlFLdTEvby9zL3NDRTVNOENuR0tmeDhFeU9SYXM1?=
 =?utf-8?B?YkRPTkY5Rmhxb01PbXhod1BwZHpJVjhrU2pRUElSVGZzWGd3YTlnVS83SHhi?=
 =?utf-8?B?UU1hQ29GVU5uS3cxRnJ2OHZUVlQ0dUM4ZEhDd2hSejJKaTA4WmlBcmthWFkx?=
 =?utf-8?B?R1BSdStzVmlZeU9PZlNmN3VBVUFqMkQ5elhHQzFGdXZkN1BvZ0htY3NaUmw1?=
 =?utf-8?B?a250eCtZaFNGMHBFZExtZXpRR3VXRUxOWjNLWjdLd1ZHd1NGZFhnRWVseWcv?=
 =?utf-8?B?SGgvVXNEc1gzeTBVMHlFZWx0RW1YNnJ0dDdhWHhRemxQRGd5VVFSUE1FTXNk?=
 =?utf-8?B?K3hzWURqUUI4N0d6TkRiSStWV0FLYlpZWFFOdlUyb0RoMS9SK29ZN3NmM09T?=
 =?utf-8?B?SjI2WFZmblVTUFJQZTR1MzZkN2VLRllDQXlFNFNMRmQ0aEkwY3ViOVU0K2V5?=
 =?utf-8?B?dTFXQzVHaGhvTERqM05kVjRNSmtuZ0JyYVZlZjVBRWVCTFFKT2krNm5SMjBI?=
 =?utf-8?B?T3dGSXZYQjVpL3FhczNUQmNWRjNzYmhSa1B5Um9RM3pCejNIajIzZjMzVXpn?=
 =?utf-8?B?aFhJalVzTnV2QjdmN04wUWRicHdtOWV4NGNodWVaZHp1OVl2ZTl2WjY4Rjll?=
 =?utf-8?B?V0tSRGkrcHlKblovSkhxcGlHTjZqbU9tcFpOeENMTExBMlBsQUpSOFIxa05O?=
 =?utf-8?B?N3JOdlJSdzRwWE5pRHdsZ2JvQUY1SVpvMHJ1U2NGbmNaelY4SHArN0dzQnN6?=
 =?utf-8?B?SUl2ZTNMRUswS2ovSGpzMTUvQlZobEZCTlEzaWdhL0FlbXo3Wko2SFZDbzdy?=
 =?utf-8?B?L0JZaVQrbUlKRUtzcWRSbkE1aTZwK3ZEYUlBT2FYKytUQWhka29jZVNuSjJS?=
 =?utf-8?B?RlNBR2RoVWVhZjdBVVkxNGp3RStHRnBaYkxEUXFxZTBvZERzYnpiZ1RKYlJ2?=
 =?utf-8?B?RGxyODJwTkJqOVlUL2h6cWhLQ2ZONDJHTWxHalBGc1MzMXBnd0kyRXlkVUtv?=
 =?utf-8?B?ei9uaVZ1K1JWMmVxc0xFTkllYzNSUFZVVUdUVHFWemd4MkxNZEpxRDNSRW5T?=
 =?utf-8?B?aDZvQXZCUXJEVjQva3VxSHVNRFVNQm44QnNOd3BGUG4zTitPcGpDdmxmVmlm?=
 =?utf-8?B?SW42dkF1M2VmZ1V5VE0xMTl6NE5GbS9LeVNIN1ZMbFVlYnNPalhqTS94UHBI?=
 =?utf-8?B?aDdjNlp5bTF1dys5cUszdm1jY3hJYkFXaWlIM244QnBpMUhZSDFUMkpVZm5r?=
 =?utf-8?B?UnNEdE8yOEdqdVFXSDhpSjVTRnZ2dWNsUWpwc2NRelJ3M0x4MVBzYW9TN0Zp?=
 =?utf-8?B?M2M4OVhqZjU4N0RuRFMxSzl5cHVoVXE2alIyVHppVkp3RWtGYkZjaDNQSENz?=
 =?utf-8?B?U1IwdGxVUVc2ODFjVC8rNitPWkxjMnNWY3NsOXQyNVNZamlwYWFNMDZYS1Bk?=
 =?utf-8?B?Qmh5clJOSXQ2eTVRVS8xUkhzUEN3SWpxckhidll1UFRtY3NKbDY3Rnp1aXYx?=
 =?utf-8?B?N2hjMkhTZjJ4YWN0NHUxVXNoZWptRmI3WGlvV0hQV3Z2Slo3VjQ1b1Z0Ynpr?=
 =?utf-8?B?QmE5UVZycUczTGUzMVFyOGZXSTk5SFNFUzdveExTWnpJTDFySStkUEtBSXpO?=
 =?utf-8?B?OHQvTnVCakRzYUl5MklnVW9rMnphT2VGVlB3d3VQd3RieWVWQjBhTEFEMm13?=
 =?utf-8?B?WUdLUnQ5bmxjMmwyMndncTN5RGdFMlJxYkZzNnl0NmZSOE52L1ROM3FwK0dJ?=
 =?utf-8?B?VG4ydGNnbXA1a0dieWlRaGN1bERpWTgzTEtNelZGcml5M0JzaG1aV09IQXlp?=
 =?utf-8?B?dWpwZ08xUnpETk5HUVNSTWh3S0pjcjZ3bDNzSk9iWlFaWWpWbDlRL2xHODBG?=
 =?utf-8?Q?pwFmDRxM0PkiuTWPGdvvG1s1o?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36b18842-0fd4-44b5-0ac7-08db95105a39
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2023 17:29:27.1093 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c6GvBynyZ/dWiO/8wcEbL+OoXAskdAyNKhynI/dAIrCfVieOIcLk5YMq7xymS1trF3ntXpJ0GuCXPtqzM1/6BQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5843
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
Cc: Alan Liu <haoping.liu@amd.com>, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Stylon Wang <stylon.wang@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Melissa Wen <mwen@igalia.com>,
 Hersen Wu <hersenxs.wu@amd.com>, Marcus Seyfarth <m.seyfarth@gmail.com>,
 David Tadokoro <davidbtadokoro@usp.br>, Qingqing Zhuo <qingqing.zhuo@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Wayne Lin <wayne.lin@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2023-08-04 11:56, Hamza Mahfooz wrote:
> We should be checking to see if async flips are supported in
> amdgpu_dm_atomic_check() (i.e. not dm_crtc_helper_atomic_check()). Also,
> async flipping isn't supported if a plane's framebuffer changes memory
> domains during an atomic commit. So, move the check from
> dm_crtc_helper_atomic_check() to amdgpu_dm_atomic_check() and check if
> the memory domain has changed in amdgpu_dm_atomic_check().
> 
> Cc: stable@vger.kernel.org
> Fixes: 3f86b60691e6 ("drm/amd/display: only accept async flips for fast updates")
> Tested-by: Marcus Seyfarth <m.seyfarth@gmail.com>
> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
> ---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 25 ++++++++++++++++---
>  .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    | 12 ---------
>  2 files changed, 21 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 32fb551862b0..e561d99b3f40 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -8086,7 +8086,8 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
>  		 * fast updates.
>  		 */
>  		if (crtc->state->async_flip &&
> -		    acrtc_state->update_type != UPDATE_TYPE_FAST)
> +		    (acrtc_state->update_type != UPDATE_TYPE_FAST ||
> +		     get_mem_type(old_plane_state->fb) != get_mem_type(fb)))
>  			drm_warn_once(state->dev,
>  				      "[PLANE:%d:%s] async flip with non-fast update\n",
>  				      plane->base.id, plane->name);
> @@ -10050,12 +10051,18 @@ static int amdgpu_dm_atomic_check(struct drm_device *dev,
>  
>  	/* Remove exiting planes if they are modified */
>  	for_each_oldnew_plane_in_state_reverse(state, plane, old_plane_state, new_plane_state, i) {
> +		if (old_plane_state->fb && new_plane_state->fb &&
> +		    get_mem_type(old_plane_state->fb) !=
> +		    get_mem_type(new_plane_state->fb))
> +			lock_and_validation_needed = true;
> +
>  		ret = dm_update_plane_state(dc, state, plane,
>  					    old_plane_state,
>  					    new_plane_state,
>  					    false,
>  					    &lock_and_validation_needed,
>  					    &is_top_most_overlay);
> +

nit: extraneous newline

>  		if (ret) {
>  			DRM_DEBUG_DRIVER("dm_update_plane_state() failed\n");
>  			goto fail;
> @@ -10069,6 +10076,7 @@ static int amdgpu_dm_atomic_check(struct drm_device *dev,
>  					   new_crtc_state,
>  					   false,
>  					   &lock_and_validation_needed);
> +

nit: extraneous newline

>  		if (ret) {
>  			DRM_DEBUG_DRIVER("DISABLE: dm_update_crtc_state() failed\n");
>  			goto fail;
> @@ -10297,9 +10305,18 @@ static int amdgpu_dm_atomic_check(struct drm_device *dev,
>  		struct dm_crtc_state *dm_new_crtc_state =
>  			to_dm_crtc_state(new_crtc_state);
>  
> -		dm_new_crtc_state->update_type = lock_and_validation_needed ?
> -							 UPDATE_TYPE_FULL :
> -							 UPDATE_TYPE_FAST;
> +		/*
> +		 * Only allow async flips for fast updates that don't change
> +		 * the FB pitch, the DCC state, rotation, etc.
> +		 */
> +		if (new_crtc_state->async_flip && lock_and_validation_needed) {
> +			drm_dbg_atomic(crtc->dev,
> +				       "[CRTC:%d:%s] async flips are only supported for fast updates\n",
> +				       crtc->base.id, crtc->name);
> +			ret = -EINVAL;
> +			goto fail;
> +		} else

nit: Add braces here as well

> +			dm_new_crtc_state->update_type = UPDATE_TYPE_FAST;

If async_flip is false you'll be setting update_type to FAST here
uncoditionally.

You'll still need the lock_and_validation check here, i.e. this:

> 		dm_new_crtc_state->update_type = lock_and_validation_needed ?
> 							 UPDATE_TYPE_FULL :
> 							 UPDATE_TYPE_FAST;

Harry

>  	}
>  
>  	/* Must be success */
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> index 30d4c6fd95f5..440fc0869a34 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> @@ -398,18 +398,6 @@ static int dm_crtc_helper_atomic_check(struct drm_crtc *crtc,
>  		return -EINVAL;
>  	}
>  
> -	/*
> -	 * Only allow async flips for fast updates that don't change the FB
> -	 * pitch, the DCC state, rotation, etc.
> -	 */
> -	if (crtc_state->async_flip &&
> -	    dm_crtc_state->update_type != UPDATE_TYPE_FAST) {
> -		drm_dbg_atomic(crtc->dev,
> -			       "[CRTC:%d:%s] async flips are only supported for fast updates\n",
> -			       crtc->base.id, crtc->name);
> -		return -EINVAL;
> -	}
> -
>  	/* In some use cases, like reset, no stream is attached */
>  	if (!dm_crtc_state->stream)
>  		return 0;

