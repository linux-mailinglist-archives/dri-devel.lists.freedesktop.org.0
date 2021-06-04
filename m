Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5199F39C11E
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 22:17:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F6E96E3AC;
	Fri,  4 Jun 2021 20:17:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2081.outbound.protection.outlook.com [40.107.244.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13DB66E3AC;
 Fri,  4 Jun 2021 20:17:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ftJE1R226BO5kTOYjZJ7QCEMJ3tUaLnOWcS6r6+/fnwmWsl9bvi2jnpfVlSlb8gNID6Fc+R47bTnGm9VyJDgGwqycF4f3rRhNxnW76tiR2m0uYGGGOawriHOhU45qDCnll0kuQEAr4CCaXb9SVqOTFlLIFGdTZQjfnlDQNCLepHy9aMUH1DAb5Xa966v4PHw1WHfDPSr7f+d1f7H4KC+MX07pGVzwpUEUbQzHbsh4hPKepHwzfFQ/umOrIIjVJ8qj4DGk+4N/vuC2FPHa+5cw4cI1ZLPd+EoYYVLdP816s+w6xkqp9AE2mMyo98YNtNOkwcwoXWsxlaAVABzz7i1iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5j/A1ZJm47BRL64ZUyCyb1MFYFnlqcFro0pn+OefEdk=;
 b=f9rN7IfKst9wy4WGQ47iS7vY3xDu6j+aGfOx+oBGOhcGn7RkULCFfUHvYF/bqHnHkMGTWl+tB3S9N7GwtRA9A99GgtEnTcVSNsm8Ts0NZlfYwRKA+V2TAOKQphbSbiPANa6PCNlZSD+QmedO/Tvs3FVHSp43gREmfLSGfFufEvMdOxfowe+iTTLt2pYGDrQUzyCNoOHdf/pJn49J6r76Svbch0Q1vE3zm7hnaFAQ61B1MTCkz6O5ddN1tGOby4zpI+FKJbUW5p4l1EZFSmbs1XmwLgrjqSAEIAsPpZeX2rQu6WmrBi2XXmbe3fbj47enKWwt/vAymrzwH0ggZXB2Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5j/A1ZJm47BRL64ZUyCyb1MFYFnlqcFro0pn+OefEdk=;
 b=abNWcofc/zeR1dTA7sON/D2cav35eGw0A5k50b3jGz4tmEkp3/y9qxHexP2lK+BCQf9s4KGYfXyM7q3QaWYHJiKqDe4NLquvizK8cp6v+oqYTuCgS+VPdz22hXavr09WfBJfQJGk0U82O6XySwRbr/8GlPO6MbLiY2CDhFBKP2k=
Authentication-Results: google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CO6PR12MB5441.namprd12.prod.outlook.com (2603:10b6:303:13b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.23; Fri, 4 Jun
 2021 20:17:11 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::f455:b0b4:439:2753]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::f455:b0b4:439:2753%3]) with mapi id 15.20.4195.025; Fri, 4 Jun 2021
 20:17:11 +0000
Subject: Re: [PATCH] drm/amd/display: Verify Gamma & Degamma LUT sizes in
 amdgpu_dm_atomic_check
To: Mark Yacoub <markyacoub@chromium.org>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20210604170107.2023162-1-markyacoub@chromium.org>
From: Harry Wentland <harry.wentland@amd.com>
Message-ID: <906d0ab3-ddca-8cb9-68f5-1b495cc4be5c@amd.com>
Date: Fri, 4 Jun 2021 16:17:08 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <20210604170107.2023162-1-markyacoub@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [198.200.67.154]
X-ClientProxiedBy: YQBPR0101CA0114.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:5::17) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.50.3] (198.200.67.154) by
 YQBPR0101CA0114.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.27 via Frontend
 Transport; Fri, 4 Jun 2021 20:17:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f9085670-6a92-4127-335a-08d92795bc7f
X-MS-TrafficTypeDiagnostic: CO6PR12MB5441:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR12MB54411690CC0BC13EBD7554BD8C3B9@CO6PR12MB5441.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V0jdM54f3DfxRgKQYKEERW6zVc5daBL+uPmdKxMvdEZZTtJHQqvstLkt4FgH+cTVIE6I0gM/9O8ZFoSJZnHGLqCNfTyKjkuRN+shRLzILWMqCYxYbUSbV8LJ0w+ievU7S5mN3aIdfD15McstxPpHyTIZQNBNW2QKog6Nd6B0T/G+xdgDQdcZbAgpWVAmlzlU9wP0Sz11IiTeHFExMcKJ1LqsrHhVQr+5qGDNtSyyTV1rHPKRf4Rjxe9qB5puTTOFedVX0awZe/vkIsYr6P2IHff5UFKxE4tIFQ91wqXr4nbS8TCGArx1UJMKrcw7FJuOt1cziWFzKheg9DAzlkUBLM/1oe68t9/zGgYgLBy3jDAD2r5MefW9jv8KVeO+n+wajao5ksJ1K4xyGaQYpLArDZ6RRYcuEAPNWRkbtfv2hnfcyCp5yROlqRQYDPqYL3/XhQ8Q1/zJ/trHHJjepgIm81Hs4dFxqrwrze6iyFeQZAKhvm6/vteRrcf+bzF0Sby2IkYpj7M/gCZ3S03gwuDE2U5EWPRqmKWdFQ8Qy1xM/HM8yMGGBRrMUAjV7JztyX/CgvsLTGG7Pd0U9VPpJZ3e40qKfIqac+SdYsMV+nZMQeHL9Gr/+oUMuy4y8/4Ca+t5uSV/0rf5zLD8VWpRXUKTfy68GlaK2YV+xr9dYx1iNH/bUgnZ8Vt19ET+sZ1SLO2n
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(136003)(346002)(376002)(39860400002)(478600001)(38100700002)(2906002)(5660300002)(4326008)(83380400001)(36756003)(53546011)(186003)(26005)(16576012)(316002)(66476007)(66946007)(66556008)(31686004)(2616005)(956004)(8676002)(86362001)(16526019)(44832011)(31696002)(6486002)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?L211bVErbTlwUlBNUGhkMXlRNWk3dENvL0srNVgrNnZzcE1PN3B3dWZvZGZN?=
 =?utf-8?B?eit4aUxmam9aWlN2Z2J6dGk1UmNIazU2d1RCL2xVeVhVV3lSeDF0UTJ0dmRU?=
 =?utf-8?B?dzh4L08wOWI0T0RRbldFYlB3ejhqSmdvK0JwVS81YzRxY1NRWVhiOExrd2dm?=
 =?utf-8?B?TWxXVUpQVWR6VDluSWJ1cCtsR0pOWlhCR09iK0pRaUUyTENPSHZwejJPYUM2?=
 =?utf-8?B?Zm1sZFZUSitGMkZFdzFSL0xUWWVMVEloNVZOblBZZWhEbXV1TXgxQzQ0REcx?=
 =?utf-8?B?b3lLbGlTTmxDY3h3NmRFTllNWHMzZHFsYTliT1hid0dvajRqTEZMN2hUbERl?=
 =?utf-8?B?Wlc4VEw4REtwUHQ1ZktEYUdKcUNaWUxLNlNuT3d2eVUycGJpVFllY0dlUHNn?=
 =?utf-8?B?Y2Nnb1NZSk40U0s5cW05Zlk2ak8vcWFQc3p3b0ZJMTdzRkxzT204VWg0WXM3?=
 =?utf-8?B?bTJHK1pGMmRDNnNmVVNDWXF3RFhSVk9XSUFaZXgrck51U2xLdVJDUjZKWXpZ?=
 =?utf-8?B?eU9QcjRBVWVwTXhmVi8vSjAxZ1NZdWNsb0VGcjFoQUZlVlNiSnpobWVaOHds?=
 =?utf-8?B?aEkzSStzUEd5aE5SZGhiV3dEYW5nYWFuU3paMjdKc20zOHhPLzg3ZDhNamJM?=
 =?utf-8?B?RVVuWCtYaDlwaGlHcUtLK3gzR0Z0d0c2Q0RBRnhTSkllcDJXMFdHbnYvMUF1?=
 =?utf-8?B?TzArTE42UThsOFovcG55cHNBM0pxK3d5Y25iSm9mRTdKMUhjSUhRVW14bll1?=
 =?utf-8?B?enNXOFNFT3J2dm83SWVWcnQ0Yms4dmlZdGt0bnNVT0NicUc0MTd4WUlpRUFx?=
 =?utf-8?B?elBVV2RQT0ZMN1pmY0xkakk0Z203Y3pPUTBVRlBHOTBvdjduUHNJdSt1bUFU?=
 =?utf-8?B?bzRrVVFLdHBoaEVEN24rcHBvNVhKYk0wSmh2N0MwRHdDcjhuTUZFR2duVU5l?=
 =?utf-8?B?MlFhN28yTUJEZ044SFRvOHRQT2JVSHl2dzliSFlhZGRHRXJ3ckJhYnBVWitr?=
 =?utf-8?B?a1doNGJDNzdZY1ppQk9zUzJpbEo0Y3NlRUt1dmVEb0ppdU5DT3IwZ2Zmb2ZB?=
 =?utf-8?B?a0ludlNTd1hBVk1aSEd5a2ZPMmJ5TnlRN3owZDQ2NlhURzlnd1JNQUk2NUxI?=
 =?utf-8?B?cGloT0h0RmdhR2lGNlRuU1B5cjNFb2N2KzVoejRKcmZPWmJvVkVPTDZOOUxP?=
 =?utf-8?B?b0RJYWovTUd1V2l6a0FRT0Iwa1Y1ejZmNHRkaFlTTXI0VTh2KzJPRGY2QTd1?=
 =?utf-8?B?a1cybVVSSm14MVVsQnRzdVltWkcyVFNhell1aVRJRFNzcmhZSlFMa1p1UzJz?=
 =?utf-8?B?OHVtRm80blFNRHBuRU04MXZSNCtlSnlDVURjSEtXS0F3ZWJhbGh4eDYzUlIx?=
 =?utf-8?B?eUFZZGRmRVRmSVNRQmV6cDBMNlNLSDhTOVZpUkhXS1NEQU5FZk5IVURMN2Zk?=
 =?utf-8?B?SGpKWkxicmx1RHhxR1dJekJyRFluTncrYmVqZTdvcFhucERWVVdzbVkrcTlL?=
 =?utf-8?B?RkdKQmVjMU9DVXE3SEZhS250T25EZVFyVmI0aTdMMGpkWVJoSGdoN0N3Vnkv?=
 =?utf-8?B?eHlnZ3VkMkNadjNoSEN2SWVoQ2F4NlJMYjhlTVl3Ky9IOHAyWVVSZWpKcENv?=
 =?utf-8?B?anRkK1JIQ01aUlZyT2ZsVEZpQWo4Z1o1NUk1ZHlJQ3RTSWhLT2hESFpLODk4?=
 =?utf-8?B?QzV6cm1nZ0d6ZUliM2RlYnprNmM2OU5sa2JPT0Y0WHN6TG1Jbm1ONkEzTVUr?=
 =?utf-8?Q?PBMUeZbr5f8QexH+SXRwajqCcjfKN+9zMR/AAbf?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9085670-6a92-4127-335a-08d92795bc7f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2021 20:17:11.7939 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IG8PlTjv/PfcBOzd+sNdsBlktM1/0IWo57R3zcgYOuTDcUxBVOP+gIZB6gNVPkHhwAiraJ/DcXGl4gvJK3lZvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5441
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
Cc: alexander.deucher@amd.com, seanpaul@chromium.org, rodrigo.siqueira@amd.com,
 Mark Yacoub <markyacoub@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2021-06-04 1:01 p.m., Mark Yacoub wrote:
> From: Mark Yacoub <markyacoub@google.com>
> 
> For each CRTC state, check the size of Gamma and Degamma LUTs  so
> unexpected and larger sizes wouldn't slip through.
> 
> TEST: IGT:kms_color::pipe-invalid-gamma-lut-sizes
> 
> Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
> Change-Id: I9d513a38e8ac2af1b4bf802e1feb1a4d726fba4c
> ---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  3 ++
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  1 +
>  .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 40 ++++++++++++++++---
>  3 files changed, 38 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 38d497d30dba8..f6cd522b42a80 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -9402,6 +9402,9 @@ static int amdgpu_dm_atomic_check(struct drm_device *dev,
>  			dm_old_crtc_state->dsc_force_changed == false)
>  			continue;
>  
> +		if ((ret = amdgpu_dm_verify_lut_sizes(new_crtc_state)))
> +			goto fail;
> +
>  		if (!new_crtc_state->enable)
>  			continue;
>  
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> index 8bfe901cf2374..1b77cd2612691 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> @@ -541,6 +541,7 @@ void amdgpu_dm_trigger_timing_sync(struct drm_device *dev);
>  #define MAX_COLOR_LEGACY_LUT_ENTRIES 256
>  
>  void amdgpu_dm_init_color_mod(void);
> +int amdgpu_dm_verify_lut_sizes(const struct drm_crtc_state *crtc_state);
>  int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc);
>  int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
>  				      struct dc_plane_state *dc_plane_state);
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> index 157fe4efbb599..da6f9fcc0b415 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> @@ -284,6 +284,37 @@ static int __set_input_tf(struct dc_transfer_func *func,
>  	return res ? 0 : -ENOMEM;
>  }
>  
> +/**
> + * Verifies that the Degamma and Gamma LUTs attached to the |crtc_state| are of
> + * the expected size.
> + * Returns 0 on success.
> + */
> +int amdgpu_dm_verify_lut_sizes(const struct drm_crtc_state *crtc_state)
> +{
> +	const struct drm_color_lut *lut = NULL;
> +	uint32_t size = 0;
> +
> +	lut = __extract_blob_lut(crtc_state->degamma_lut, &size);
> +	if (lut && size != MAX_COLOR_LUT_ENTRIES) {

Isn't the point of the LUT size that it can be variable? Did you observe any
problems with LUTs that are not of size 4096?

Legacy X-based userspace will give us 256 size LUTs. We can't break support for
that. See MAX_COLOR_LEGACY_LUT_ENTRIES.

Harry

> +		DRM_DEBUG_DRIVER(
> +			"Invalid Degamma LUT size. Should be %u but got %u.\n",
> +			MAX_COLOR_LUT_ENTRIES, size);
> +		return -EINVAL;
> +	}
> +
> +	lut = __extract_blob_lut(crtc_state->gamma_lut, &size);
> +	if (lut && size != MAX_COLOR_LUT_ENTRIES &&
> +	    size != MAX_COLOR_LEGACY_LUT_ENTRIES) {
> +		DRM_DEBUG_DRIVER(
> +			"Invalid Gamma LUT size. Should be %u (or %u for legacy) but got %u.\n",
> +			MAX_COLOR_LUT_ENTRIES, MAX_COLOR_LEGACY_LUT_ENTRIES,
> +			size);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
>  /**
>   * amdgpu_dm_update_crtc_color_mgmt: Maps DRM color management to DC stream.
>   * @crtc: amdgpu_dm crtc state
> @@ -317,14 +348,11 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc)
>  	bool is_legacy;
>  	int r;
>  
> -	degamma_lut = __extract_blob_lut(crtc->base.degamma_lut, &degamma_size);
> -	if (degamma_lut && degamma_size != MAX_COLOR_LUT_ENTRIES)
> -		return -EINVAL;
> +	if ((r = amdgpu_dm_verify_lut_sizes(&crtc->base)))
> +		return r;
>  
> +	degamma_lut = __extract_blob_lut(crtc->base.degamma_lut, &degamma_size);
>  	regamma_lut = __extract_blob_lut(crtc->base.gamma_lut, &regamma_size);
> -	if (regamma_lut && regamma_size != MAX_COLOR_LUT_ENTRIES &&
> -	    regamma_size != MAX_COLOR_LEGACY_LUT_ENTRIES)
> -		return -EINVAL;
>  
>  	has_degamma =
>  		degamma_lut && !__is_lut_linear(degamma_lut, degamma_size);
> 

