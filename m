Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD306FB989
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 23:25:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10D0310E2F7;
	Mon,  8 May 2023 21:25:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20609.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e83::609])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2625D10E2F5;
 Mon,  8 May 2023 21:24:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W2ZC5PjqvP4KSj1QOVEVdTVqHEk8lQ63WU6JB7p9q3UE3TYy8K9peIwljcUSIbBbvj+lAuKjIZCYDamF0LW98ojnWigDzLBrwjc39euMNUC5D5nIwGfK5aHfbljNXfz6pexpAUPYg2y31CyM8/eaYQCGqkNcsp39rjRVVuitPJV0LNw+3ptmQixoeaQEZnZib9+9JiiMEgBgyt1Ev7vbGtrdNAqO91uWpxfegnruKd1Bhel0xCnHXuKtK3orLzDrtdfQWrP5JNwI7GaSJ+qB+lKqb1PAFs0EpLs9Y0gJLlK++3Mu+iPer06XDiFEmR+E3xRLq1lu4Al/lR6o/Nwdpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Et92VLpDY80CQ3FvmMor6d8lu2pthRP1WQ0u2pmeYKo=;
 b=LQOUM5gktNnsZWTYu4hurSU+03Lgi8YcBQGED8m7BrAndTdjb3matYrSyHvN9WZ/d0lS0suhqXtrknu/vxxWgmCjIRbRuMkIk12RJYgWOj/RZ3qjxHqXD0EAEh3Twxc1zYCvNXNRDf2djAbr4eRFPRgf/e643cwUMVIHTTMWWrzYwwnByW9qT2QDauxAJhOQCtNvH17+A0wOCzw2JuZIMxeOBKoMPCIrntctLWpMmOQjXEfVZDxMimiZfsdT4MbgDCDC3/gWH+KVPBKAeuxfhvFJKf2Wg6RhfxhslWyLOGUYF4mRZpsczp5SSle66W0FyjM+fQ8DLxfR2Emyh3QD7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Et92VLpDY80CQ3FvmMor6d8lu2pthRP1WQ0u2pmeYKo=;
 b=KGN8mc+SfTxbiat+2BJzVxYnvRxKW+Jz50zNlALcdagcX5mdXSHsMaPKhaVmlAhhy/pI/Y/lcfUq9XqK5VFQH1O6u5GxqCItmTfv3nAOstzMIIoiduaKK5H6bIZyZYySlJz3d/4i9/V+j+an+wW8H1RxlpGyZ63qFcQaX8yvSbk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by BL1PR12MB5269.namprd12.prod.outlook.com (2603:10b6:208:30b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 21:24:54 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::dd26:a6b5:1d41:ac27]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::dd26:a6b5:1d41:ac27%6]) with mapi id 15.20.6363.032; Mon, 8 May 2023
 21:24:54 +0000
Message-ID: <f8871b8f-af40-61df-7a77-a632015c9201@amd.com>
Date: Mon, 8 May 2023 17:24:49 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
From: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [RFC PATCH 09/40] drm/amd/display: move replace blob func to dm
 plane
To: Melissa Wen <mwen@igalia.com>, amd-gfx@lists.freedesktop.org,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
References: <20230423141051.702990-1-mwen@igalia.com>
 <20230423141051.702990-10-mwen@igalia.com>
Content-Language: en-US
In-Reply-To: <20230423141051.702990-10-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR01CA0025.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01::33)
 To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|BL1PR12MB5269:EE_
X-MS-Office365-Filtering-Correlation-Id: 85444088-5448-47f9-2240-08db500aaa65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qZZmsaHzn+/e+R563VtLiH6EiRii0Fkz6b/Vx2s1f/KsiSRS6klsRAEpHp/nn8utTXjcTPuSZd+fK0/lVKi1OJO/z/aVx0VkzEYxPJsQlOy4T6imJ7cOixYOJ+c+qklhv2CA2wfOH87oCeQeDI+yJMwEWZ+nRIYT7GPU5IpBnemzHNskvVOm3EnRi+Fq8mo1TTwzR6+AiydzaZoqJ3oNVuHzl8oGg1fKz+ElbZzGPel8kR5ExSN/4nY5ZRjr4+tYIM+QVRmaLAjg+U+E0fQzu9McWMxhDGb5aL4wkIdPgy1ZJm4g9ZyNQxDGRRBrNEUqRDds7Qgal/HgWEEWaagUXffOdUCVir2txfCRGdgxNIXw59GSQQsrzCGTv+mpG7uesnJ4wFRIpw5a3ZQ0cUIvYZiV/kIUvrqOdTjmdvzVOAtwZpNIxo/CKJSeszl8WvW2PoLG5oBn09PuBLbtSesApIqcjKCN6+8z3MEVVCvtqQW3oXKjnIs3sAKBlv6bG8wbLfTQvKZIie/rdbdL2F/BajoA0z91w4hezDj3tC3sqHPerRAeeXMZe44SjeWjFMK2nL6S//GbrNCKmCX9/lD0pr7sB9azb6u9BUorCe52NYMJP9baL8+B/yJPPGcA6VzdWYQ4dEl2ByLroTrmn8oIhFlPqXDynOBZAlw85LiuWiM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(136003)(346002)(366004)(376002)(39860400002)(451199021)(83380400001)(2616005)(478600001)(6666004)(110136005)(54906003)(6486002)(6506007)(26005)(53546011)(186003)(6512007)(44832011)(2906002)(38100700002)(36756003)(66476007)(66946007)(41300700001)(66556008)(4326008)(8936002)(921005)(5660300002)(31696002)(86362001)(8676002)(316002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?djlZSldENjV2ZlZZWjFVZTVsYzZ4c1BiVnpVTWNMWXJsNlphakxRYm1wMCt6?=
 =?utf-8?B?Z0dCS2U2T3djSk9uSW41OVhiZ1VXbkpIWjJlVkc5dDdQWk54MS9uYnV0QnNP?=
 =?utf-8?B?TDV3OTdJd05xbStra3l5T0Z3VU5QWWVoWlhTTmhGOE1jMDcxR2s1Um1vSGgy?=
 =?utf-8?B?QXRFczFQZzlQeTBCVVNLWTZaUmtSYmd4aVNkOFBsL05nbWVwM1lHWmIrNlEr?=
 =?utf-8?B?UXo0T3BJeXI4aU1lOVpHbEFLbzdVbTMrLzhFK1hzT2RoQjliNmV6K1lxUUFq?=
 =?utf-8?B?c2hsZTkxYVU0RWdLZEttMkpNMWVBUnloNGFGM0d0WE1VSXh4dHJYZDVRTVpN?=
 =?utf-8?B?NVhjSjEwWXkzWUhpcmN2Y3BpbWZtcGtRYVRra1BKcm5JaTlMTG1oVEpscm9D?=
 =?utf-8?B?UndnWmpwQ25BRUVqZjdIazd2RVFrODlzWnYxdngraTl2ZGV0cGNhTkFySVIz?=
 =?utf-8?B?YVg1ZUlkZXNCQ0Rta2dla2dqZmM3amJJSEUrM3VXN1p3Q1h6TzhacW5Rdi81?=
 =?utf-8?B?V1dxbVlSN2ZGMk01NXAvMUxWV2dWMFB4UFhsWHVWay8wMXM0ZmJvMDRpQzVV?=
 =?utf-8?B?R3NpWmthaU5oU2JWME40cWNtdm9IbkVONGlZN25YODhyS09PdzRtWFNzbHFN?=
 =?utf-8?B?ZXFPQ0QrZDRFMUJTVGJrRGhpMnBKRURTUlRJd0ZNUGpCeWZlVytZZDZpVEZu?=
 =?utf-8?B?UVhKUFZXZjRHdFFXWjBZdldmNUw3cTZvWnQ4bUlWSGtsSmNnbmpXbXBOeEI0?=
 =?utf-8?B?S1RkbkloTVdyREk0TUtPWGx0UGZxNzFSbzh1YXN1a2hIK1JPRURsM1JnWkFF?=
 =?utf-8?B?QmdCVDBmeWVPMSs4MitpTDhDRERWYW9uZ3BKUmV6dVJtM0FnL291NzdUQzF2?=
 =?utf-8?B?K1RSRzZkb29haktXbHZCMFkvZ3EyOFd0anEyOEsrd0NyZWhTRzN4bEJiT2RS?=
 =?utf-8?B?WFJCYUdNelhyN1gxTVFMM3JxcUVvWEl5THR3eTBzbVJnSzFuaVNBSm9QMW8v?=
 =?utf-8?B?c2UzSldYWm5HZElPMWVkZEl4N29zdmVYcFBhZG5ZQy9lVDFoWFNhL0JvN29h?=
 =?utf-8?B?NVNUNGxoRGxHaUdGSWYxMldGdHJNeEFmdEdLNGNiSVZWTzc5UjZBUndFazdL?=
 =?utf-8?B?UmVrZ2d2aHQrSHZuekIyUFQrV1d1dGJ2b0ExeGVVbDNxc2R1dWZlcHlhRHN5?=
 =?utf-8?B?NmcyakpJR2o5SURjVGswTmdMdDdyR2NyQkRNYjNaVTQ4bXJ4OFVvL0hRUzRt?=
 =?utf-8?B?emtEanpjZmNwRURkTCt0djJLWVNGYzJxZmpNdVR3YjhYZFJ5R3ArQ1ZOOUg3?=
 =?utf-8?B?eisvU1VvM21hRXVUUmhlYkp4Y3IvdUJhbGMvaE1FQ281UEtOTEQ0N2czaTd1?=
 =?utf-8?B?VzBrTXU2c1pvekJUb0hPR3NTaThjL05tbFA4ZVdEdzZHM0RxdklxVllwUWFY?=
 =?utf-8?B?eVU1bkFHdXU1Y0FNU1pUNXh2U0JKaFA2WWNSZGE4Y292emhWdjd1ZmJoREc0?=
 =?utf-8?B?V0czaGRCSk5tL04zQXIvblhaUWluQ09YNlc3eTZtV0NiWlZZRHBsVkJBc3ZG?=
 =?utf-8?B?dEV2cmJwTW9hMWlMdTNHOUNncGpBYzE0MThPRm9EcnJJOTNVNWp0U0ZYY3hN?=
 =?utf-8?B?VXRwWXBpVzRsTElneFlEd2xZY2tJSTNZVnZYQlA3Sk90eVEwaVZ6QXRsNGQr?=
 =?utf-8?B?b2tEMGJvaUwzeTduaUNLUldMdHFVMWErUmZhTU5DSTJ5L0lsVk9ESStHQWc3?=
 =?utf-8?B?dGkzbTBxd01NMkdHWlovOTdBaGp1aVVHNkdSeGpyTm15TVJUL0ZXck8rbTBM?=
 =?utf-8?B?MUJDb0Y3QkxKQ2RlQ2dHdytPZUZFUnl3dlFsc2x5MkppQkRyQlk0RWY1NFlz?=
 =?utf-8?B?MUptMlRlVHljdi9NYzdpUFRXVjVjd2ZjRmV4SlRFcUlrcWNrMVFhMnpkRkcr?=
 =?utf-8?B?TUoxWTN4OVljTE1USUNOSVBrTElNR3M5TWVVd3RzM1JqYlBsN29aeHZRa2s0?=
 =?utf-8?B?b291czhWMXVJWG1JMmkvajl0NU1BWGNTbkV6Qld4MFFTcjJBMTBUdUZMTlVD?=
 =?utf-8?B?NUJUKzF1YTliK0xZcFppamI4VUphYmxWR1pYSWFEUHIzTmowSHZyUnhlZ3JV?=
 =?utf-8?Q?+zkuOQVBrDu5FpJt805pQhZBa?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85444088-5448-47f9-2240-08db500aaa65
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 21:24:54.3745 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S4xSWn8vSqYCyVZbI3GKnREy76bIqTCGjTQi7Cz1OoHg9TyoRUiUoSN1lAoqy8h+THBivvzz9YWfZkcM179C1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5269
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
 Shashank Sharma <Shashank.Sharma@amd.com>, Alex Hung <alex.hung@amd.com>,
 Xaver Hugl <xaver.hugl@gmail.com>, linux-kernel@vger.kernel.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Joshua Ashton <joshua@froggi.es>, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/23/23 10:10, Melissa Wen wrote:
> From amdgpu_dm_plane we can get it for both CRTC and plane color
> properties. We are adding new plane properties for AMD driver-private
> color mgmt.
> 
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>  .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    | 37 +------------------
>  .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 35 ++++++++++++++++++
>  .../amd/display/amdgpu_dm/amdgpu_dm_plane.h   |  7 ++++
>  3 files changed, 44 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> index 79324fbab1f1..27d7a8b18013 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> @@ -344,39 +344,6 @@ dm_crtc_additional_color_mgmt(struct drm_crtc *crtc)
>  					   DRM_TRANSFER_FUNCTION_DEFAULT);
>  }
>  
> -static int
> -atomic_replace_property_blob_from_id(struct drm_device *dev,
> -					 struct drm_property_blob **blob,
> -					 uint64_t blob_id,
> -					 ssize_t expected_size,
> -					 ssize_t expected_elem_size,
> -					 bool *replaced)
> -{
> -	struct drm_property_blob *new_blob = NULL;
> -
> -	if (blob_id != 0) {
> -		new_blob = drm_property_lookup_blob(dev, blob_id);
> -		if (new_blob == NULL)
> -			return -EINVAL;
> -
> -		if (expected_size > 0 &&
> -		    new_blob->length != expected_size) {
> -			drm_property_blob_put(new_blob);
> -			return -EINVAL;
> -		}
> -		if (expected_elem_size > 0 &&
> -		    new_blob->length % expected_elem_size != 0) {
> -			drm_property_blob_put(new_blob);
> -			return -EINVAL;
> -		}
> -	}
> -
> -	*replaced |= drm_property_replace_blob(blob, new_blob);
> -	drm_property_blob_put(new_blob);
> -
> -	return 0;
> -}
> -
>  static int
>  amdgpu_dm_atomic_crtc_set_property(struct drm_crtc *crtc,
>  				   struct drm_crtc_state *state,
> @@ -389,7 +356,7 @@ amdgpu_dm_atomic_crtc_set_property(struct drm_crtc *crtc,
>  	int ret;
>  
>  	if (property == adev->mode_info.shaper_lut_property) {
> -		ret = atomic_replace_property_blob_from_id(crtc->dev,
> +		ret = amdgpu_dm_replace_property_blob_from_id(crtc->dev,
>  					&acrtc_state->shaper_lut,
>  					val,
>  					-1, sizeof(struct drm_color_lut),
> @@ -397,7 +364,7 @@ amdgpu_dm_atomic_crtc_set_property(struct drm_crtc *crtc,
>  		acrtc_state->base.color_mgmt_changed |= replaced;
>  		return ret;
>  	} else if (property == adev->mode_info.lut3d_property) {
> -		ret = atomic_replace_property_blob_from_id(crtc->dev,
> +		ret = amdgpu_dm_replace_property_blob_from_id(crtc->dev,
>  					&acrtc_state->lut3d,
>  					val,
>  					-1, sizeof(struct drm_color_lut),
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> index 322668973747..4e5498153be2 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> @@ -1411,6 +1411,41 @@ static void dm_drm_plane_destroy_state(struct drm_plane *plane,
>  	drm_atomic_helper_plane_destroy_state(plane, state);
>  }
>  
> +#ifdef CONFIG_STEAM_DECK
> +int
> +amdgpu_dm_replace_property_blob_from_id(struct drm_device *dev,
> +					       struct drm_property_blob **blob,
> +					       uint64_t blob_id,
> +					       ssize_t expected_size,
> +					       ssize_t expected_elem_size,
> +					       bool *replaced)
> +{
> +	struct drm_property_blob *new_blob = NULL;
> +
> +	if (blob_id != 0) {
> +		new_blob = drm_property_lookup_blob(dev, blob_id);
> +		if (new_blob == NULL)
> +			return -EINVAL;
> +
> +		if (expected_size > 0 &&
> +		    new_blob->length != expected_size) {
> +			drm_property_blob_put(new_blob);
> +			return -EINVAL;
> +		}
> +		if (expected_elem_size > 0 &&
> +		    new_blob->length % expected_elem_size != 0) {
> +			drm_property_blob_put(new_blob);
> +			return -EINVAL;
> +		}
> +	}
> +
> +	*replaced |= drm_property_replace_blob(blob, new_blob);
> +	drm_property_blob_put(new_blob);
> +
> +	return 0;
> +}

amdgpu_dm_plane doesn't seem the right place for it either. Maybe a new
amdgpu_dm_helper.c/h?

Alternatively would this make sense to live in DRM core as a helper?

Harry

> +#endif
> +
>  static const struct drm_plane_funcs dm_plane_funcs = {
>  	.update_plane	= drm_atomic_helper_update_plane,
>  	.disable_plane	= drm_atomic_helper_disable_plane,
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.h
> index 930f1572f898..1b05ac4c15f6 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.h
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.h
> @@ -51,6 +51,13 @@ int amdgpu_dm_plane_fill_plane_buffer_attributes(struct amdgpu_device *adev,
>  				 bool tmz_surface,
>  				 bool force_disable_dcc);
>  
> +int amdgpu_dm_replace_property_blob_from_id(struct drm_device *dev,
> +					    struct drm_property_blob **blob,
> +					    uint64_t blob_id,
> +					    ssize_t expected_size,
> +					    ssize_t expected_elem_size,
> +					    bool *replaced);
> +
>  int amdgpu_dm_plane_init(struct amdgpu_display_manager *dm,
>  			 struct drm_plane *plane,
>  			 unsigned long possible_crtcs,


