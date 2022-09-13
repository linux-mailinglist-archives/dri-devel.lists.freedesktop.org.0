Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4A55B6E96
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 15:49:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 738B210E5C0;
	Tue, 13 Sep 2022 13:49:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2046.outbound.protection.outlook.com [40.107.92.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54B2510E5C0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Sep 2022 13:49:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fu44M1J0NMAMIHI7qkQZ6lfN47xLuaXTxmoSAiuF03BW1/SGXG4S1UXT9DpqgWoZBVtskBIdpnIuutgFDOUnoWanmHqAy3tnOXcxjG+GQ2UVAWIG1o0/Os+L4QbP56qoI/nn9J97gvQ1eN/vMRcDEe8SYqNFj2cmY2tt0n9j3KqV8fnDFSzMciCd06o/PfyBTLUdcOSnDTXENzpQQmAEnSr7osGkjGhDmqxV8lJsWvr+nIV3E3cSnqzgK/pWRJht0pxzFORWM2VRYOfOmQaL0pz2K4T+HuYVLSEN3H/alELNc2GxcA2MbGBPi9lT5JanHtotecST0L56R6t3xqo2Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G3ZL/IIYgpm2UuqNKcNWjCagp8yKWdcEYHtEadsd5To=;
 b=hX3v2ParVJwjVHkBq1IqquMzSH7w5ndxULcEhJlvMKJbQMCw3dizvLIlS1Ltuc7ISD43kmiHKhUU0j7ZGusZmh+pyFx4hE7Dpw1kbozchVT52vK7OnfIsErdJEaL+hWuL+OOO9mPLICOM02Z7dlnXUf7CMKdZnu9IVu37jdxb5rLeEJbnPzKuEumhPLMA+2qJh+uc5IU8PLMH8zCqJtY4uhDNJzsffFfttBhISV6gFzh0sgCaHoQcu9yqqqArmyRWWh8O60Og/sNkiomQupj6B0/PIBXBu5t3fPAhoHS2od8fi6nJQlIyqvT7HnkHZDBeXismiqTzC3vwlQnhoMMzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G3ZL/IIYgpm2UuqNKcNWjCagp8yKWdcEYHtEadsd5To=;
 b=3Ue0BPH6u4tdKWqZ2ufD9oLi54ks0crLyGce4CRgrhvi89O1l3mdZkgy/wshhvvrh+lxKHSzfZoCbGH4YYdrXSyDnQN2G9qV6u3P1HDohlt2/G3LUE0m6GOkMeNO221gXSg7EC/HXQIHvKA2GOgW8qZxvQTlat75pFq5DwGKhkg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Tue, 13 Sep
 2022 13:49:10 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::9033:772f:1339:75f6]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::9033:772f:1339:75f6%4]) with mapi id 15.20.5612.022; Tue, 13 Sep 2022
 13:49:10 +0000
Message-ID: <b81591c4-934c-4b70-fbf0-b0f4663a6d1c@amd.com>
Date: Tue, 13 Sep 2022 09:49:07 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2] drm/plane-helper: Add a
 drm_plane_helper_atomic_check() helper
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
References: <20220913093339.106625-1-javierm@redhat.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20220913093339.106625-1-javierm@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT3PR01CA0131.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:83::7) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|BL0PR12MB5506:EE_
X-MS-Office365-Filtering-Correlation-Id: 00f68b08-710c-4b97-6691-08da958ebc3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FmGUrhlHSy0Nc/m8hIj9pZP8Nx+NxcngU+THlIXwXxWOxdyBruJ+F1i7RhH5l+hSziC7iGQypjypBxxadi8CFnPS7OZ/1NHHQqKKeJLuMCBMY4x3rVH03vMHCvkuJJQxJ5cTnOC2JB4UhDLo7PCD75UNMSwKmcMQwZo/RYp4GOaBHtfwVJdp3ULYFEUjjn9ASEPgOEIpcX64xh7wzvqozJC8OIc/jXbaCTElGMLFRtB9qcBxic/peuscCe0dwBWvTT8vyf9Pi1+IZTh+K/D8w9b3BV0BgQS6/s1H825bEOT7Q6BBZQDB3axCRdk9vuj4QqIvyVIV228KuPAD06sVKS+11RDqU7Y8rqc2uQRta1wWHw7HCDr9uebrRpK0LqiHflZTZ8787IiXoowzhdHUCYsYA/YtCsWjiJMo/5K1Takb7K/Tq+m4QcS5RfhMIr2NkfYqqgvuhaVuYdz+DYy00EyB4ZwDKhyuMJ7s//pL4XMOSJLNRlBlpQXETo9IyXEqaj0RZkvY/FjWKBrdwBuw9GgyRaYOxgzKmqexPraBuoEAfAGotrRZl8qDdr8DRmfsWx58W2/W4dbx4ehe1N8p9Q1DOpTKl1RAvQ9eTGH3ir0flWYUm1Bb4+Jypcjk7STx5UKiTxlgbejJCosPTcQ0YLJH4OhkgeRgjcvNVXP/8JYPFgo2p6Y/RizaHO6Ep7DwxV3V+OpMaFl94dPfZHJNW+xmM07WaV9Gpzoc2zMsZBS0JEYCMPoHZvmUa1F7GGHaukc1JCcb/6VnFRJRio+h9NgtSrJGQVKm90qTVhXO3Kg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(136003)(376002)(366004)(39860400002)(346002)(451199015)(8936002)(44832011)(6512007)(83380400001)(38100700002)(66574015)(26005)(31696002)(8676002)(6506007)(66476007)(186003)(86362001)(66556008)(4326008)(66946007)(53546011)(6486002)(5660300002)(6666004)(2616005)(54906003)(316002)(31686004)(2906002)(36756003)(478600001)(41300700001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUFQME1ma3poc3lYMUpOeDVLU1c0K0ZLNzlFdDRzRUp5SzlMendQcFlWMjI4?=
 =?utf-8?B?RVVKbitIbXRVV2g0RzNuMGdobWd1Y0lFSUVEakVLMEpqNzlRM1hXOXI4L0o4?=
 =?utf-8?B?YTBiYktBM0JHZTQ1LzBVVWhUVkhKRElPS0IvVURyVDNhVVBuT1VQTy8xMjVS?=
 =?utf-8?B?MGI5c2NvbTduL2JHVHEzYVFOTE8zd1B1RzhDOUdnaGRBYjN5VmovZ3M1bHUr?=
 =?utf-8?B?TFVwVS9FMlNpMWJhYThkWUxZS1dYQmk0NkZwWWE3TlNoQXR4OFNoYUo2UGww?=
 =?utf-8?B?V3p5SkVFeHc1a2IvUTErSEVORHA4SkJldzF6bm93N1lvSldQRUdSenU4L1Jt?=
 =?utf-8?B?STJTUnpNTS9DL2ttd2pXZldseHlCaEluYWVIbG04NEJ5RmdTdGtwUUtWSzhB?=
 =?utf-8?B?SWxSaUgwbzBaZHdJbXNTdGdmYzFZYkt1QXRTVTZkSGZvenJsM3hmZFRBQXp2?=
 =?utf-8?B?WFdVQ1VOQXZUSHRBaXp1UW9qcnlkK2g5UFZEakJjTVM1VWNuL1V2a1l3RmxO?=
 =?utf-8?B?NnRIb2lFK1I2WVZNU0g1cFZaKzROS2NISkxhNmZrVHdXMHY1UDRLQTR5WTRO?=
 =?utf-8?B?Q2JYNGVMaWMyYmpDcmxLbW1hTmI5ckRrMzQ0SW9HZTdWTFljelNYS3VOVS9j?=
 =?utf-8?B?cVZ3T1VHcHpTY1RtZk9qNXRvTzhBZzMvUXgxWW54TnczbVpZamZSY1VVYVd2?=
 =?utf-8?B?YkZaazU5eGc4cjhuNm9TN0lndnV1YlJjVGZUMDExTU9CbWRaQzdtcWJld3ZE?=
 =?utf-8?B?bGtnQjRpZmdzM0lKNXRpZGN3N0NHRCtudnNQUDFsbld5L3V6UEZMUWJQd01y?=
 =?utf-8?B?bFNlUW9laHFUZXo0YlZKczc2aE1zbU9jcytKdmFnNlRNSzBOQkN4bE1icW9F?=
 =?utf-8?B?SHJWalZHcHZqa2h1QnFhenBvM1BhaGZuWkF4OTdLMzgxZUFkaUhxZjFqbU9N?=
 =?utf-8?B?cmNiTGFCWjFPOHpDTmhSMk1EL3N5eVJwT0dZS0VIc1B0eGVYU1dTYVBZSVpX?=
 =?utf-8?B?SEdWbVQ4YUpVd2NnclRiLzFlZzkrM2NLdEVCVUdmTDlObE1ZQk9QWUJPYlIx?=
 =?utf-8?B?MlB0blhFL0UvOGlENXhzL2JMcnZ4enZYbnlCTFFVekxHemVBU1NlREN0R2Fq?=
 =?utf-8?B?UUFTZ25nUENmWUdwamdVenZtYktRMDJxRmRtaHVpTUdYQUhvcGFZbVdWZnFF?=
 =?utf-8?B?c3RRelBFOGszOXJkUXFnTkpBZFExM0Q4VFBWeVprZjNzU2Q5QjU0T25rUTFF?=
 =?utf-8?B?RmN1QmdmcG5KMG5jQ1ZxQ0lqSUhHMGVvWElXVkdKNFB1OGhCbFRlK1YwTFJO?=
 =?utf-8?B?aWxvUFFvTGU5R3RVc0hNL0FmUFE3Rk5OMDdUWE9McFhHeFM3bE8rYkNhTTVZ?=
 =?utf-8?B?UVVKRDlBY2ZTTXEzVjUwNVhjWVlkL09ST3lWUDQyeGlDVkxwbDVxODF0dUph?=
 =?utf-8?B?WlZCcFFKT2JMeXUveVczakIrZDVzeERVWUdzZi9Jcy8wcmZ6M0syYTZmOGNa?=
 =?utf-8?B?bm0zenhodTd3ZVhJdzg1M1dmcUM1Q3g5RWdQTU1yWmQvWllmWXdaM1Q4VllQ?=
 =?utf-8?B?aUlDNTNSKzhnK1BJcVkyaXF0SWtCN1lxN203czdPODhpRFdKNzlzWHdFeVUw?=
 =?utf-8?B?ZDlrbXozaUlMUzJVSFhzang0VVFzK1pqdGRoK1ozYXV1RjZDb0RnMyt3eWQ0?=
 =?utf-8?B?TXJpWnBadUdJQzU0TGUreFhIZmZmb3Zsdi9VSTR1NzdVOHM2VFRuTHY0cWRi?=
 =?utf-8?B?VlMrZzRlaUxqdktudmwrcXAyWjFLTFMyc3NzRHcwczNReldjN3RPdkluZnBo?=
 =?utf-8?B?TzcwOUYwSHU5UEZiWHdMV1AxQS9tZFdzcHl5T1ErWHRsT2NINnJKa3BSR0U4?=
 =?utf-8?B?VGV2YVFqTEFrVjhZNWp1NmM5dytUYy9YNlRPOEpCL0RNYldMM2JUcHF6eEVB?=
 =?utf-8?B?YytnT2JFNjdyejlLVXhqMk11c0FIT3FMTVp5Tit2RDl0bTJHMHQzb0VFNzVj?=
 =?utf-8?B?alZKWVh0eitia2Z2MG5JT01ROGhUdEVQNVhCeWZZeDJPdnZlWTdtZ2JVRE1R?=
 =?utf-8?B?V2RyQXR6TXhMYk5TQjdzZDhVdHd2d1B0U0dXamoxTXpYMXRNNFFSWFRYME4w?=
 =?utf-8?Q?snLRK8EnETImu+NAguS5qJcwR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00f68b08-710c-4b97-6691-08da958ebc3d
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2022 13:49:10.4415 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZN/3QBRb5ZePA+4m19F++BTYca4KLNXJgvdZtjtQzjbn0ksf8CQPjk7VY3EX0uhJp9scHvb1H2g5mQ4PUt0iUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB5506
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2022-09-13 05:33, Javier Martinez Canillas wrote:
> Provides a default plane state check handler for primary planes that are a
> fullscreen scanout buffer and whose state scale and position can't change.
> 

Even though this might be how some drivers are handling the primary
plane this assumption is not universal. For example, on ChromeOS when
the (default) underlay strategy is selected the compositor will
position the video plane as the bottom-most plane and mark it
as primary, while the desktop plane is marked as overlay and
will contain an alpha cutout to show the underlying video.

In this case the video plane (primary) won't span the screen
and is regularly panned and resized.

No objections to this change as it helps share code between drivers,
but maybe specify that this behavior is a unique requirement of
these drivers.

Harry

> There are some drivers that duplicate this logic in their helpers, such as
> simpledrm and ssd130x. Factor out this common code into a plane helper and
> make drivers use it.
> 
> Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
> 
> Changes in v2:
> - Fix `new_state` field comment (Ville Syrjälä).
> - Rename `new_state` to just `state` (Ville Syrjälä).
> 
>  drivers/gpu/drm/drm_plane_helper.c | 28 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/solomon/ssd130x.c  | 18 +-----------------
>  drivers/gpu/drm/tiny/simpledrm.c   | 25 +------------------------
>  include/drm/drm_plane_helper.h     |  1 +
>  4 files changed, 31 insertions(+), 41 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_plane_helper.c b/drivers/gpu/drm/drm_plane_helper.c
> index c7785967f5bf..2165390863f4 100644
> --- a/drivers/gpu/drm/drm_plane_helper.c
> +++ b/drivers/gpu/drm/drm_plane_helper.c
> @@ -278,3 +278,31 @@ void drm_plane_helper_destroy(struct drm_plane *plane)
>  	kfree(plane);
>  }
>  EXPORT_SYMBOL(drm_plane_helper_destroy);
> +
> +/**
> + * drm_plane_helper_atomic_check() - Helper to check primary planes states
> + * @plane: plane to check
> + * @state: atomic state object
> + *
> + * Provides a default plane state check handler for primary planes whose atomic
> + * state scale and position is not expected to change because the primary plane
> + * is always a fullscreen scanout buffer.
> + *
> + * RETURNS:
> + * Zero on success, or an errno code otherwise.
> + */
> +int drm_plane_helper_atomic_check(struct drm_plane *plane, struct drm_atomic_state *state)
> +{
> +	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state, plane);
> +	struct drm_crtc *new_crtc = new_plane_state->crtc;
> +	struct drm_crtc_state *new_crtc_state = NULL;
> +
> +	if (new_crtc)
> +		new_crtc_state = drm_atomic_get_new_crtc_state(state, new_crtc);
> +
> +	return drm_atomic_helper_check_plane_state(new_plane_state, new_crtc_state,
> +						   DRM_PLANE_NO_SCALING,
> +						   DRM_PLANE_NO_SCALING,
> +						   false, false);
> +}
> +EXPORT_SYMBOL(drm_plane_helper_atomic_check);
> diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
> index 79e8e2017c68..28cf9c87f86d 100644
> --- a/drivers/gpu/drm/solomon/ssd130x.c
> +++ b/drivers/gpu/drm/solomon/ssd130x.c
> @@ -565,22 +565,6 @@ static int ssd130x_fb_blit_rect(struct drm_framebuffer *fb, const struct iosys_m
>  	return ret;
>  }
>  
> -static int ssd130x_primary_plane_helper_atomic_check(struct drm_plane *plane,
> -						     struct drm_atomic_state *new_state)
> -{
> -	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(new_state, plane);
> -	struct drm_crtc *new_crtc = new_plane_state->crtc;
> -	struct drm_crtc_state *new_crtc_state = NULL;
> -
> -	if (new_crtc)
> -		new_crtc_state = drm_atomic_get_new_crtc_state(new_state, new_crtc);
> -
> -	return drm_atomic_helper_check_plane_state(new_plane_state, new_crtc_state,
> -						   DRM_PLANE_NO_SCALING,
> -						   DRM_PLANE_NO_SCALING,
> -						   false, false);
> -}
> -
>  static void ssd130x_primary_plane_helper_atomic_update(struct drm_plane *plane,
>  						       struct drm_atomic_state *old_state)
>  {
> @@ -623,7 +607,7 @@ static void ssd130x_primary_plane_helper_atomic_disable(struct drm_plane *plane,
>  
>  static const struct drm_plane_helper_funcs ssd130x_primary_plane_helper_funcs = {
>  	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
> -	.atomic_check = ssd130x_primary_plane_helper_atomic_check,
> +	.atomic_check = drm_plane_helper_atomic_check,
>  	.atomic_update = ssd130x_primary_plane_helper_atomic_update,
>  	.atomic_disable = ssd130x_primary_plane_helper_atomic_disable,
>  };
> diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
> index 777ccd250871..ea5b3239a659 100644
> --- a/drivers/gpu/drm/tiny/simpledrm.c
> +++ b/drivers/gpu/drm/tiny/simpledrm.c
> @@ -469,29 +469,6 @@ static const uint64_t simpledrm_primary_plane_format_modifiers[] = {
>  	DRM_FORMAT_MOD_INVALID
>  };
>  
> -static int simpledrm_primary_plane_helper_atomic_check(struct drm_plane *plane,
> -						       struct drm_atomic_state *new_state)
> -{
> -	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(new_state, plane);
> -	struct drm_crtc *new_crtc = new_plane_state->crtc;
> -	struct drm_crtc_state *new_crtc_state = NULL;
> -	int ret;
> -
> -	if (new_crtc)
> -		new_crtc_state = drm_atomic_get_new_crtc_state(new_state, new_crtc);
> -
> -	ret = drm_atomic_helper_check_plane_state(new_plane_state, new_crtc_state,
> -						  DRM_PLANE_NO_SCALING,
> -						  DRM_PLANE_NO_SCALING,
> -						  false, false);
> -	if (ret)
> -		return ret;
> -	else if (!new_plane_state->visible)
> -		return 0;
> -
> -	return 0;
> -}
> -
>  static void simpledrm_primary_plane_helper_atomic_update(struct drm_plane *plane,
>  							 struct drm_atomic_state *old_state)
>  {
> @@ -543,7 +520,7 @@ static void simpledrm_primary_plane_helper_atomic_disable(struct drm_plane *plan
>  
>  static const struct drm_plane_helper_funcs simpledrm_primary_plane_helper_funcs = {
>  	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
> -	.atomic_check = simpledrm_primary_plane_helper_atomic_check,
> +	.atomic_check = drm_plane_helper_atomic_check,
>  	.atomic_update = simpledrm_primary_plane_helper_atomic_update,
>  	.atomic_disable = simpledrm_primary_plane_helper_atomic_disable,
>  };
> diff --git a/include/drm/drm_plane_helper.h b/include/drm/drm_plane_helper.h
> index 1781fab24dd6..7760b27b0323 100644
> --- a/include/drm/drm_plane_helper.h
> +++ b/include/drm/drm_plane_helper.h
> @@ -41,5 +41,6 @@ int drm_plane_helper_update_primary(struct drm_plane *plane, struct drm_crtc *cr
>  int drm_plane_helper_disable_primary(struct drm_plane *plane,
>  				     struct drm_modeset_acquire_ctx *ctx);
>  void drm_plane_helper_destroy(struct drm_plane *plane);
> +int drm_plane_helper_atomic_check(struct drm_plane *plane, struct drm_atomic_state *state);
>  
>  #endif

