Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D61B9886296
	for <lists+dri-devel@lfdr.de>; Thu, 21 Mar 2024 22:36:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCD67112165;
	Thu, 21 Mar 2024 21:36:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="OsuQ1e9z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2067.outbound.protection.outlook.com [40.107.95.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F11E112165;
 Thu, 21 Mar 2024 21:36:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YzgID7c2W8CkFhjHFyMjsZEVBvAIo8PT+2KhvhyHuaz7gzgbHymHhA9+dzMtM3tll15GELA/EAiEvC5jHsIDAltZAms5DYJfs98r/O8wq7CR/TLpGisFd9TtikZ+Ws94dABHTaoRBpXQ+apR54JBRFy4K+128MqDVEPlzSTANbwOjhwAh3iHAWJ47JqEa1WmYhVHLEer/RxkQ3jmi8iDly8jyIZaltBR+a9/x+7AGYdfLe24POB3V4UEARCgD3Jvo7/sFf5nDmRAaaAxuz3quUAVmNDJfuYk2dGVD9txAFH88n9FuroTr4W7AeQTaxwejBTp+myBydXuEKYKV5gH/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y+YpKUnluJoCn1d7dtoFBJyD/U+BZp4DaPqeXrtDdNg=;
 b=UkRlFNCiMiziBj7Tcp6UF8IFUC0Yf/n4XtbC4uSfi7PdJHfOSD9qhExxQn+cdUbBcrY9v2Hj+dvhtNiNv+c7+WJlkMPIdB6DucCbUdBOpk30Wg4BkLHmwpVjg133rm2yV71avAqc79YkDagh5I2gV3Pe9rQq//2YMjWMcDouPQ8W5+Gjz0zpu4Jseng5WcnVJBq0d7RJpyuIyyW6cMRyt4AB/BvC0tHCQS17579Z9NlXK80WFH/dL6TmmAjz1WY7Q611xAv0vqhxDCg2UzXtUcTWCIscf/sNYzn8WijieJV1wFmOZhbmEtD5rrl6l91D4VhnOj+tPBj6yYCGtdMHQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y+YpKUnluJoCn1d7dtoFBJyD/U+BZp4DaPqeXrtDdNg=;
 b=OsuQ1e9zkuaDDu2xPvsK6mv1QdsqFpFzgvby/DsLAc3It7yxNPLu5pxCvarJFjH2FMFcy1TGjK9FavjsKeqI31I0L+YTyVsOzL+ElT5wrGNsv85/d5CpLvEK/xUZMMgHTgBNKdKpAoL2J3pw6+ZzQWkkUkuzTiZpMnKDVES0DBw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by DS0PR12MB8413.namprd12.prod.outlook.com (2603:10b6:8:f9::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7386.30; Thu, 21 Mar 2024 21:36:21 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::8d12:60ee:8dfb:daef]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::8d12:60ee:8dfb:daef%4]) with mapi id 15.20.7386.025; Thu, 21 Mar 2024
 21:36:20 +0000
Message-ID: <1b86dbd3-77c4-408d-ae85-6520784aea73@amd.com>
Date: Thu, 21 Mar 2024 17:36:15 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/amd/display: Move PRIMARY plane zpos higher
Content-Language: en-US
To: sunpeng.li@amd.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: Joshua Ashton <joshua@froggi.es>, =?UTF-8?Q?Michel_D=C3=A4nzer?=
 <mdaenzer@redhat.com>, Chao Guo <chao.guo@nxp.com>,
 Xaver Hugl <xaver.hugl@gmail.com>, Vikas Korjani <Vikas.Korjani@amd.com>,
 Robert Mader <robert.mader@posteo.de>,
 Pekka Paalanen <pekka.paalanen@collabora.com>, Sean Paul <sean@poorly.run>,
 Simon Ser <contact@emersion.fr>, Shashank Sharma <shashank.sharma@amd.com>,
 Sebastian Wick <sebastian.wick@redhat.com>
References: <20240315170959.165505-1-sunpeng.li@amd.com>
 <20240315170959.165505-3-sunpeng.li@amd.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20240315170959.165505-3-sunpeng.li@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0398.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:108::19) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|DS0PR12MB8413:EE_
X-MS-Office365-Filtering-Correlation-Id: 84f223f5-a85b-435f-e1e7-08dc49eef2a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Xngnhyyem6U0te6HZKxfPXtYA+Ce5uh8UtymqPoUtebFaS6+gO54Hj/Z6xCQ5TOTiJ5d/FVHHE3zzkg1FbwmR9pP1JFfBtbryLZG+1sjZqzd71Yl9oxOASz1zgGr0ARci4pLI1ri7CR1UYxY8CxY1/CrKpVcYOf6BEMp4QOxpyp/F3fZ4Ag99HxWTGPUfvvee2wdLNCkBawaBtaK0IOCLQoDdSRQP9p/jt7IUdz7+Hnp7AbZ3bER0THvCByV+WFtpM+p7UpNBlk5jGapS9KqL4xd9qiIvYYkQuXx4ExiFa/1iWsIMAKa+OCx+3L9OENeZpzy6rP0+C2yrVa7ASkBZPRuua0xaKIRtf1AzAAtaxCRLJXsJl4JnUA6ocKhujK+fUeu/RWopANhaK0x4dDZ3Fu4LNqFIqjJX2dmQB5uNs69QD7RqQPxiVz6bjfXmXsP3tXOkCGzOBwfs0/Rx9aJSpfgj5XKgzJsaFGDCp4ePYO4m/28idwqYTgGnJC6F4UfTD6a5f3CnnQxbN7w+IxXSGRi7jXDOeiKsI6S87wV3hTHHanwQYBmHat173jprhlOpM0PPaYY2dBw+P9gppVpWZEkoEgl633k3EWfgFBDFHVFNrzaYzi8B3qvO4RqZrH5JoWmY2dpxFi/q6b9K+zi0DOHB5gQw1AjIjfWHHPpyfA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(7416005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z1Q2QnVGK1pHcDdFc21wZkplRlo4M3ZPMkJMamhWT2UvUG9LdlhtRW1heTRk?=
 =?utf-8?B?UzhOVFNZaG9VY1E5NCtvaW9SbEkwQ3hmNjVFR1kyRkdSMnpscE4wUEpYUXph?=
 =?utf-8?B?MVRROHJTT3JnNkE5ZUErWFI1WDd1ZTh5K0Q3NVJCWFV4RkcwZHJHY3hYYWhO?=
 =?utf-8?B?RWVZNjJOR2ZyY2VVakVUQ3ZvU21ycXR6SW1rYVc3SHpEb3dtNlFXaE9zRzc0?=
 =?utf-8?B?cHczZzZLYUZqdFpKYjNMUkpaSHVFL1l3eGpCUG9BLzI3THo1QUUrVjd0MkJt?=
 =?utf-8?B?TXZqUGNZYlJTOVliZjRJRDVNRXF6bmNjOFJFejN1c3g1Rmw0QVc3bjRhMzZQ?=
 =?utf-8?B?OUlwc2IrRWExVURRRzMxQWtpbWhOaDZPdzRDNGFOYU00SVFIeGhTR29lTEZa?=
 =?utf-8?B?dlpVa1N2b2xCYkRyaU5JMU8wa0kzanNFRVZtbVdpK0RWMVhaSWFFVGNzdjhp?=
 =?utf-8?B?OHdVdXd0cWR6V1NneTdGOWFNcU9ldUxYR0lPeE95VGlPdm9ETzA2TTVPWktx?=
 =?utf-8?B?VXRHYWx1cWRiZ1NyU2h3N2s4RVZWTDIxOGNlcUU4enRadmpYb3NvaHBIdHhL?=
 =?utf-8?B?bXJlUlpSZFRZVG1kQTliakpBeHJOUkpjUk9ibldJcEpCc25vczFWSFRVSUQ5?=
 =?utf-8?B?UUZQZ0pHQkNpaEpsNFVlVjVKSzR0VkQ4MXA0WjU3RlpreWdHOHM4OHFMUlgw?=
 =?utf-8?B?U2xWUGRkR1R5Z0U3ZnAyWkZhakRHMTRXcWl0TURDeHpIVzBCMVVvV0ZodFh3?=
 =?utf-8?B?bmx6QWdiSWI1dVhsWnMzWGlPMnRxLzJmWmhCLzNmZlpiTjh6c2JES3lNc2lK?=
 =?utf-8?B?RnVacGplS2kyYVR5eFRielk3SGtXRmcya25IYmdwR0xiWWdjYmhlU0ZHZjgw?=
 =?utf-8?B?cDQ0Rjhha0kzZndjbGhmTTdUWGQ1RTBwYUNMNkExTzNqWkN5N2lQOHNtaThy?=
 =?utf-8?B?cTVwcHM2c0s1K3RBSDAweVIrK0lwdmREYW9idzBKeTJ0VTJndlphekhyRHVV?=
 =?utf-8?B?d1g0cm5nZ3ZBSnNWemxwQy9KaHh0UGlhU0JQNGIwRzZxcnk5bC9aVEd0bS84?=
 =?utf-8?B?VVgzVWNwazdoTFpCZndua1k3clpaRmVDUnlnL3kxYXZpYjdQc3ZpbFlBSFVN?=
 =?utf-8?B?VzRTL3g2L2pwU3BNZStDWTMyRmo1ZnU3T3RZTUdlSy8rNFRMS0ZYQ3NiKzcw?=
 =?utf-8?B?L0xpckFSNkpKVGUxZjBHZlBZaG00VVIydnM2dWZJNko3WUFCQ0ZhMEUyWGYw?=
 =?utf-8?B?RzJ3cHhyanVFL2xOVUFOOXEzUTI5eVpCdE8xbGtScU5PRjczWkdlTWtXWXk2?=
 =?utf-8?B?NzZFUzdpZ1d0R085Y0o4Zmk1bmNRYTNlUjZCR3k2aTlHZjBpeElRRmhOdldF?=
 =?utf-8?B?MFhGRGx4RjJPSERPUG1wTm41SnBXZVVqc1VkSk9ZbWt6ODlMQ2tmd0I5NkZu?=
 =?utf-8?B?Si9QcnVxQUVsTDJuU0FaWUhsbmtlaU1iT3UxMkd1cjRoWlpmOUFwVzhwR29z?=
 =?utf-8?B?ak9MUmludUtoWnA5dXlYY0hzdVBuZUcyRHlPdVJuc0daNjlaYXNqWUFxWVhM?=
 =?utf-8?B?Rk8yMkFFOXkyNFhzZ2hFSm9QSUdaRHl3TFM3WEw0cmxxdlNHUnMzZXBnSFl0?=
 =?utf-8?B?aEcya0FudWxNZHBPL2NxbEl6MVhlazdmaStJRjJGcHVkOEF6UFJCRG9Nc21p?=
 =?utf-8?B?QklBdkZtQ1RLdFM3M29FR0JnS1M4bWpEUnlIcFArYWxDSjI3U1lzR2ZuVWdC?=
 =?utf-8?B?SDlWU1VOVCtGYlBYTjBvZHpQU081eUUrVnF2VGRCeFRzUTA3YWUxeU9JVWpX?=
 =?utf-8?B?YWRlbldDNDJXWFR1cHN3dStKZXhjQnQwSVdWU3VmTU9uamVxVTdNaFl2TVFO?=
 =?utf-8?B?cHRVcHMvRkp6R1RUMU1hcDF2MzlnbXQ3RFdvQ0tteHRoa2YrYUtkS3JvWDI2?=
 =?utf-8?B?OVBpbkZja1RidWF3QS9CSmF5bXhKRWxmVUNBTk9HVkpINUJkYi81Mkt4ak5R?=
 =?utf-8?B?NzNlMS95ZWhMQVRPTlZtQWd5azFUS2pFSFVwYmx4enlMVTZSblVJWURpWmhU?=
 =?utf-8?B?WTMxdE9CWndpTlNpZVFhZzhKSDl1Tnc3Y09Lc2dXaTlRNjZIOERWMmNhcmxJ?=
 =?utf-8?Q?VTBphYqEpf0/8pq/Tg/5PoFtD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84f223f5-a85b-435f-e1e7-08dc49eef2a7
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2024 21:36:20.3640 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wWUlA5psy8e6pecb+rGV+6MAoymbQ3NMw+0YgU3KXfE5egiSvyAC0R+Ix05PK8In++yIAt684727isqbQmTAeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8413
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2024-03-15 13:09, sunpeng.li@amd.com wrote:
> From: Leo Li <sunpeng.li@amd.com>
> 
> [Why]
> 
> Compositors have different ways of assigning surfaces to DRM planes for
> render offloading. It may decide between various strategies: overlay,
> underlay, or a mix of both
> 
> One way for compositors to implement the underlay strategy is to assign
> a higher zpos to the DRM_PRIMARY plane than the DRM_OVERLAY planes,
> effectively turning the DRM_OVERLAY plane into an underlay plane.
> 
> Today, amdgpu attaches an immutable zpos of 0 to the DRM_PRIMARY plane.
> This however, is an arbitrary restriction. DCN pipes are general
> purpose, and can be arranged in any z-order. To support compositors
> using this allocation scheme, we can set a non-zero immutable zpos for
> the PRIMARY, allowing the placement of OVERLAYS (mutable zpos range
> 0-254) beneath the PRIMARY.
> 
> [How]
> 
> Assign a zpos = #no of OVERLAY planes to the PRIMARY plane. Then, clean
> up any assumptions in the driver of PRIMARY plane having the lowest
> zpos.
> 
> Signed-off-by: Leo Li <sunpeng.li@amd.com>

With the typo mentioned below fixes this is
Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Before merging we should run a full promotion test (especially the IGT
tests) on it as this could break things in subtle ways.

Harry

> ---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 96 ++++++++++++++++++-
>  .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 17 +++-
>  2 files changed, 104 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 09ab330aed17..01b00f587701 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -80,6 +80,7 @@
>  #include <linux/firmware.h>
>  #include <linux/component.h>
>  #include <linux/dmi.h>
> +#include <linux/sort.h>
>  
>  #include <drm/display/drm_dp_mst_helper.h>
>  #include <drm/display/drm_hdmi_helper.h>
> @@ -369,6 +370,20 @@ static inline void reverse_planes_order(struct dc_surface_update *array_of_surfa
>  		swap(array_of_surface_update[i], array_of_surface_update[j]);
>  }
>  
> +/*
> + * DC will program planes with their z-order determined by their ordering
> + * in the dc_surface_updates array. This comparator is used to sort them
> + * by descending zpos.
> + */
> +static int dm_plane_layer_index_cmp(const void *a, const void *b)
> +{
> +	const struct dc_surface_update *sa = (struct dc_surface_update *)a;
> +	const struct dc_surface_update *sb = (struct dc_surface_update *)b;
> +
> +	/* Sort by descending dc_plane layer_index (i.e. normalized_zpos) */
> +	return sb->surface->layer_index - sa->surface->layer_index;
> +}
> +
>  /**
>   * update_planes_and_stream_adapter() - Send planes to be updated in DC
>   *
> @@ -393,7 +408,8 @@ static inline bool update_planes_and_stream_adapter(struct dc *dc,
>  						    struct dc_stream_update *stream_update,
>  						    struct dc_surface_update *array_of_surface_update)
>  {
> -	reverse_planes_order(array_of_surface_update, planes_count);
> +	sort(array_of_surface_update, planes_count,
> +	     sizeof(*array_of_surface_update), dm_plane_layer_index_cmp, NULL);
>  
>  	/*
>  	 * Previous frame finished and HW is ready for optimization.
> @@ -9363,6 +9379,8 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
>  		for (j = 0; j < status->plane_count; j++)
>  			dummy_updates[j].surface = status->plane_states[0];
>  
> +		sort(dummy_updates, status->plane_count,
> +		     sizeof(*dummy_updates), dm_plane_layer_index_cmp, NULL);
>  
>  		mutex_lock(&dm->dc_lock);
>  		dc_update_planes_and_stream(dm->dc,
> @@ -10097,6 +10115,17 @@ static bool should_reset_plane(struct drm_atomic_state *state,
>  	if (new_crtc_state->color_mgmt_changed)
>  		return true;
>  
> +	/*
> +	 * On zpos change, planes need to be reordered by removing and re-adding
> +	 * them one by one to the dc state, in order of descending zpos.
> +	 *
> +	 * TODO: We can likely skip bandwidth validation if the only thing that
> +	 * changed about the plane was it'z z-ordering.
> +	 */
> +	if (new_crtc_state->zpos_changed) {
> +		return true;
> +	}
> +
>  	if (drm_atomic_crtc_needs_modeset(new_crtc_state))
>  		return true;
>  
> @@ -10509,6 +10538,65 @@ dm_get_plane_scale(struct drm_plane_state *plane_state,
>  	*out_plane_scale_h = plane_state->crtc_h * 1000 / plane_src_h;
>  }
>  
> +/*
> + * The normalized_zpos value cannot be used by this iterator directly. It's only
> + * calculated for enabled planes, potentially causing normalized_zpos collisions
> + * between enabled/disabled planes in the atomic state. We need a unique value
> + * so that the iterator will not generate the same object twice, or loop
> + * indefinitely.
> + */
> +static inline struct __drm_planes_state *__get_next_zpos(
> +	struct drm_atomic_state *state,
> +	struct __drm_planes_state *prev)
> +{
> +	unsigned int highest_zpos = 0, prev_zpos = 256;
> +	uint32_t highest_id = 0, prev_id = UINT_MAX;
> +	struct drm_plane_state *new_plane_state;
> +	struct drm_plane *plane;
> +	int i, highest_i = -1;
> +
> +	if (prev != NULL) {
> +		prev_zpos = prev->new_state->zpos;
> +		prev_id = prev->ptr->base.id;
> +	}
> +
> +	for_each_new_plane_in_state(state, plane, new_plane_state, i) {
> +		/* Skip planes with higher zpos than the previously returned */
> +		if (new_plane_state->zpos > prev_zpos ||
> +		    (new_plane_state->zpos == prev_zpos &&
> +		     plane->base.id >= prev_id))
> +			continue;
> +
> +		/* Save the index of the plane with highest zpos */
> +		if (new_plane_state->zpos > highest_zpos ||
> +		    (new_plane_state->zpos == highest_zpos &&
> +		     plane->base.id > highest_id)) {
> +			highest_zpos = new_plane_state->zpos;
> +			highest_id = plane->base.id;
> +			highest_i = i;
> +		}
> +	}
> +
> +	if (highest_i < 0)
> +		return NULL;
> +
> +	return &state->planes[highest_i];
> +}
> +
> +/*
> + * Use the uniqueness of the plane's (zpos, drm obj ID) combination to iterate
> + * by descending zpos, as read from the new plane state. This is the same
> + * ordering as defined by drm_atomic_normalize_zpos().
> + */
> +#define for_each_oldnew_plane_in_decending_zpos(__state, plane, old_plane_state, new_plane_state) \

"decending" > "descending"

Harry

> +	for (struct __drm_planes_state *__i = __get_next_zpos((__state), NULL); \
> +	     __i != NULL; __i = __get_next_zpos((__state), __i))		\
> +		for_each_if (((plane) = __i->ptr,			\
> +			      (void)(plane) /* Only to avoid unused-but-set-variable warning */, \
> +			      (old_plane_state) = __i->old_state,	\
> +			      (new_plane_state) = __i->new_state, 1))
> +
> +
>  static int dm_check_crtc_cursor(struct drm_atomic_state *state,
>  				struct drm_crtc *crtc,
>  				struct drm_crtc_state *new_crtc_state)
> @@ -10571,7 +10659,7 @@ static int dm_check_crtc_cursor(struct drm_atomic_state *state,
>  	if (i)
>  		return i;
>  
> -	for_each_new_plane_in_state_reverse(state, underlying, new_underlying_state, i) {
> +	for_each_oldnew_plane_in_decending_zpos(state, underlying, old_plane_state, new_underlying_state) {
>  		/* Narrow down to non-cursor planes on the same CRTC as the cursor */
>  		if (new_underlying_state->crtc != crtc || underlying == crtc->cursor)
>  			continue;
> @@ -10936,7 +11024,7 @@ static int amdgpu_dm_atomic_check(struct drm_device *dev,
>  	}
>  
>  	/* Remove exiting planes if they are modified */
> -	for_each_oldnew_plane_in_state_reverse(state, plane, old_plane_state, new_plane_state, i) {
> +	for_each_oldnew_plane_in_decending_zpos(state, plane, old_plane_state, new_plane_state) {
>  		if (old_plane_state->fb && new_plane_state->fb &&
>  		    get_mem_type(old_plane_state->fb) !=
>  		    get_mem_type(new_plane_state->fb))
> @@ -10981,7 +11069,7 @@ static int amdgpu_dm_atomic_check(struct drm_device *dev,
>  	}
>  
>  	/* Add new/modified planes */
> -	for_each_oldnew_plane_in_state_reverse(state, plane, old_plane_state, new_plane_state, i) {
> +	for_each_oldnew_plane_in_decending_zpos(state, plane, old_plane_state, new_plane_state) {
>  		ret = dm_update_plane_state(dc, state, plane,
>  					    old_plane_state,
>  					    new_plane_state,
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> index ed1fc01f1649..787c0dcdd1ea 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> @@ -104,8 +104,6 @@ void amdgpu_dm_plane_fill_blending_from_plane_state(const struct drm_plane_state
>  	*global_alpha = false;
>  	*global_alpha_value = 0xff;
>  
> -	if (plane_state->plane->type == DRM_PLANE_TYPE_PRIMARY)
> -		return;
>  
>  	if (plane_state->pixel_blend_mode == DRM_MODE_BLEND_PREMULTI ||
>  		plane_state->pixel_blend_mode == DRM_MODE_BLEND_COVERAGE) {
> @@ -1686,6 +1684,7 @@ int amdgpu_dm_plane_init(struct amdgpu_display_manager *dm,
>  	int res = -EPERM;
>  	unsigned int supported_rotations;
>  	uint64_t *modifiers = NULL;
> +	unsigned int primary_zpos = dm->dc->caps.max_slave_planes;
>  
>  	num_formats = amdgpu_dm_plane_get_plane_formats(plane, plane_cap, formats,
>  							ARRAY_SIZE(formats));
> @@ -1715,10 +1714,18 @@ int amdgpu_dm_plane_init(struct amdgpu_display_manager *dm,
>  	}
>  
>  	if (plane->type == DRM_PLANE_TYPE_PRIMARY) {
> -		drm_plane_create_zpos_immutable_property(plane, 0);
> +		/*
> +		 * Allow OVERLAY planes to be used as underlays by assigning an
> +		 * immutable zpos = # of OVERLAY planes to the PRIMARY plane.
> +		 */
> +		drm_plane_create_zpos_immutable_property(plane, primary_zpos);
>  	} else if (plane->type == DRM_PLANE_TYPE_OVERLAY) {
> -		unsigned int zpos = 1 + drm_plane_index(plane);
> -		drm_plane_create_zpos_property(plane, zpos, 1, 254);
> +		/*
> +		 * OVERLAY planes can be below or above the PRIMARY, but cannot
> +		 * be above the CURSOR plane.
> +		 */
> +		unsigned int zpos = primary_zpos + 1 + drm_plane_index(plane);
> +		drm_plane_create_zpos_property(plane, zpos, 0, 254);
>  	} else if (plane->type == DRM_PLANE_TYPE_CURSOR) {
>  		drm_plane_create_zpos_immutable_property(plane, 255);
>  	}

