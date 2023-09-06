Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7216B7942A0
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 20:01:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4708D10E6DB;
	Wed,  6 Sep 2023 18:01:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2088.outbound.protection.outlook.com [40.107.243.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64E9E10E6D8;
 Wed,  6 Sep 2023 18:01:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EW2WME8B3hovsxlJtpD/IaTfUgVZzsx1yj1cBP7MhUsM9LWSbJlM9Yn1FV1onqIKtlT+FveCJnEOvdAbOrOYqA/TZ1/w5bGebv7k7e+hjnntZjihDd/yd9bYOGJ9kM2IA7NAs/d+5p6xKpO7DhXfv3ZM7zfn++boOVIa8EUhvp+v0hZJqhPObs9bQrYUeEhZRrbJbmqXWg94l/mC3RPsmAjKhquGDUbGvuS/AiQQhDWn6MJ8llwh3ItiDpOHd+snm5aaL0/cjzz42k/fMpL7n17oLXJywCl5PeT/1cnD7KnnwB31DEyiqIuDZgIfRI4sZFk0SBLNBzfGGWKuGA8vWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=01ZjELhBgAlBGabB30a4Kk9NpeXyWDXYUG3S5fUer7A=;
 b=jEKkEbTGbG8qMMQ3NXVLM8+z5oFEsrXQXCQmOvjJDyCvXyuqYedLxJqVzhpzsRdJlaL/nMX2jbFxx4/eGqp3D7XuqRR6besAmMrUodDeIgmkvlL+gV5cYFXx9Q1A2fudSGoazwS/m2lQ9iBtUodV+l+RmmPDte67P/tm2BhMgVtT/78pNWQJFssdZmmdZDjyCW39dxiqYm332uYJ/No1cGHAiXbTIErbzUYWDf0hBjqhwwSexrkGKugxeZ0rfG7VWs9Jeo3tP/rJRCG/SSCnPs7QN3uh5aziFE+jocWx+yiVZ9ozr/eSIFVjh097ReQKvT+sGNbIboKc03lfMIroHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=01ZjELhBgAlBGabB30a4Kk9NpeXyWDXYUG3S5fUer7A=;
 b=0YRlwr6Z+p8h3UTjAi67WlMhRGVRh8brF3Z7tZeKKJUtfXo1tOD9Z765jkrUWxNm4T77pJly9fb3mzw5afPpUw6mricElWgcpY8264PTF+mlHvZeBXJBpV0lDmO555liETgrwTKoVZq3VRyl+rjujoJaff7j5mBKe2w1me9rnh0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by SJ2PR12MB8718.namprd12.prod.outlook.com (2603:10b6:a03:540::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.30; Wed, 6 Sep
 2023 18:01:22 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::121e:5e68:c78a:1f2f]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::121e:5e68:c78a:1f2f%3]) with mapi id 15.20.6745.030; Wed, 6 Sep 2023
 18:01:22 +0000
Message-ID: <75118b7b-5753-41b0-a9f1-8047d79fa4ad@amd.com>
Date: Wed, 6 Sep 2023 14:01:15 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 29/34] drm/amd/display: allow newer DC hardware to use
 degamma ROM for PQ/HLG
Content-Language: en-US
To: Melissa Wen <mwen@igalia.com>, amd-gfx@lists.freedesktop.org,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
References: <20230810160314.48225-1-mwen@igalia.com>
 <20230810160314.48225-30-mwen@igalia.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20230810160314.48225-30-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0245.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:66::17) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|SJ2PR12MB8718:EE_
X-MS-Office365-Filtering-Correlation-Id: b1d7a761-3754-4711-3a4d-08dbaf034732
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wt/w5i9w/emmyJ3BFOHyvMkv+LRCUiPNCTbODpHNqHzCNYKF3lxSJaiL8QSBJm0ZgDyxUrUwj/jNebgKPQDQfQlH7c1RPKiHV1t3UO0K/GyfIImspYUxmNJ4YFzMghhfUnsHo+V7M0CunETRxweNSM5jp+knMIoepOrb8MEuZydRiNPh3mfrpyBV7grbqi27lVAY/KneCG1RC3/pYt3kL6kaP3yH27fEfcaMIEnlHvqnRYjOcPA/UeT5w2pmwzqzwW49UUNxmqCD90CI88Tsrp4vgKzGpGNN/r9EAntewgeIzd/DtUvGY+NLi/CM6WKyqbJer4Y2AWBUMgsfEXn3LhCQ3QEeKO+mflwNs4G4yWvL9MNbXX0fBQ5M6jAp6YWPcWKakcARqlwVCdO/8NQYqZ5TM9teB9BADjvVhNNznNnWxlShR93Bw80HQQSppo9oKC/Y5aJ3VHbP6lBhcPBMglNL8zts79migruF2LGZzFguNLK7KNiLUwT9cd4ni3wozmKVYkMQnIsU1D2NauidCAjoHUtwfpYUk4t0I4MC6ZVB8h/9R9ykti8kkD4Py/0dMgjHKC0QMn9OkNQ2ZyH+oWu6UCYwA3msXPZdVOUczHptzSHVsshnD8tnpYyHMONG+rAfnUAHXXsR/mGK4E357g+L0anGk1WvKGIjWBDlgAA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(376002)(366004)(396003)(136003)(186009)(451199024)(1800799009)(31686004)(86362001)(921005)(83380400001)(7416002)(36756003)(44832011)(5660300002)(31696002)(6486002)(41300700001)(38100700002)(66946007)(66556008)(478600001)(26005)(66476007)(6666004)(2616005)(110136005)(53546011)(4326008)(8936002)(8676002)(6512007)(6506007)(2906002)(316002)(54906003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YmZnL2lRTzQ1dGo0TFFGd1lSLzZoSVd4UU5xaGFyTDBWSUtvRTEzWC9lR29Q?=
 =?utf-8?B?SlNrZHRiaUd0cVFZa3RVTHRpVS82SFFNdjAxVjNXSUpqblQ4YXN2R2lGV09I?=
 =?utf-8?B?dnEzL1Urb0FYRVpHYzY1NGsxRUhmdFZkSWtiY0lUZ2RuY2d5emRFaVdXQ3pF?=
 =?utf-8?B?RlJlMUp1SzY4ZllRTDlRSVc3Nkc0TVl5QUpvWmJTcUhFUnpEeGlTSkY1YzFt?=
 =?utf-8?B?c09RVHlYYUNoM2QwcWl0UUMzUGdHeTlmeURxUkUvMkJJdzR0UkVtOEI1Y2J0?=
 =?utf-8?B?K3BJWWZmZnVId1A2VEFXcHUrbEEzK09JMWNicTVzRW8rSXlGR1UyKzM4SmJ0?=
 =?utf-8?B?QTYvM01wZmJsMjVQdWh0b1dPcEVUQSs2UUVZTVRjdTF2NFdmQnJ3L01VOHVL?=
 =?utf-8?B?V0gxcU50TkxNWUxRWTl1bFpwb0tNUU82RzJCQytGUTVxbEIrY0NLam83N2dQ?=
 =?utf-8?B?bnZudHpTNEZjLzlNRnB0S2ZFNzNqQURwNGl4SDRZZHUxMWZTNTBpK0RIeEhT?=
 =?utf-8?B?Zm5LZWtueGd6dzVsTFlWUWhuZjRscTdvL3BuNnZqdlFnbS9LdFFkNk9ZMHJJ?=
 =?utf-8?B?Y2dZcEJkMFhDT0ZFcFFmTmY4V09oM3l5UFgycGsvb0EvNXZycTdtaTVHYnlL?=
 =?utf-8?B?d0xVVWJQc21NY2tWMzZYdHlEUm1jWVZITmhaaGdKZmJSVlJLai9UUm1EdldY?=
 =?utf-8?B?WmVnaXVCRXdVU005L0Y5QVdTWVl0ZG42WExxUDlJSmsweFVSdmJpaXNNSmRC?=
 =?utf-8?B?UHk3Qzd1N0tDVnZ1aGJjQXhlc0hQUjg3LzhsZmFXQVFTaEFyR3ZGYmRabi90?=
 =?utf-8?B?WGljamNYMXZJRFlGY2xSeklxcDVMaUlnSUtQSDJPTDBrdkhzWWhxWlpveWxV?=
 =?utf-8?B?U0w1UmR0UXA5RlBWVk9PWVFRRUlkblB2RGZrRFYzMjZML0VLRGdZQUNhMnl3?=
 =?utf-8?B?M2ZNczNUWDRTUzZUOUxVMjFrQ0NGUlcvRWI4anNMQW1sWHBkb09qMll5L1g5?=
 =?utf-8?B?NUNqWklockt5cHJNMkxpMlUwZkZHWktkTU84S01Fa2pWZGJUYUtqSUlTbEly?=
 =?utf-8?B?azVRYkpHdFk1RGpZbjNSSnV3Ui9tVWlMdlhvQjYxNlRVbUQ5SEVIWU1RT0pz?=
 =?utf-8?B?NnEyeGNzWWE5RDBUcGdYNzlxUk8zQWwvbEVrUEttMFZUN2dhUmNYOVJld3ZK?=
 =?utf-8?B?MVZYWDQ4OVRIbnB4S0VJeXpkUlVjL3Uvb1JLWi9KVmQ0UVMvMG8rVW9nZXlx?=
 =?utf-8?B?LzMvZTlvakR2VVUxTXExbER6MDg3UFBxcFdGTGJJVlIzTU9OZVI0ZmVwNytB?=
 =?utf-8?B?U1ZyS2YxcFpnSnZ3Z0R2QkhKWGZWUzV5amxyWEh0dDZZRGkyWk5IanVUQWV0?=
 =?utf-8?B?cS9tM0h1ZjVRSzg2QmlZRysyS0NqNnNqTkphSm1adXgzTXJCR0Y1dDRZazBx?=
 =?utf-8?B?UVZKU1RIZS9IYWQvbFcyaTBUOUIvOCtlQkFoNGk5VlRvUCtoQ253TUkvT1hj?=
 =?utf-8?B?L0o1NGlzNkZQMktWdXA2QkcvR0RvclcxWlhZQ0FRQUdKYXFtVmRrZDR1YzVx?=
 =?utf-8?B?MkZSbnNndXpFc2pIeHFtRW4rd1BkSUF0MlBPVzMrNStYNVB2TE1HVENsaXlY?=
 =?utf-8?B?QW9FZ3pEQWR2ZEsva3ZjZ01WMW5MSndSVmxjRmJra2dVRjBPOTgzdWxqZjgr?=
 =?utf-8?B?UTZhK05LVWcxcjZ6azNQVjhOYmxyMEJ6ZGMrQkFCeVZDU1RvbVhnT1ZSYjlK?=
 =?utf-8?B?WVZRRnVmdDdpQUF1SjF3LzhWM2NjZjF5TmV5aFZkV2V5UjVVdWhibzhvZUtq?=
 =?utf-8?B?aWRIOU1zTDBKNGRhM2NqMDRPK2pTeE9mbW5JMmVpS0orSDdMbVBjUmhqZDU1?=
 =?utf-8?B?aS9RbUNoTUtxeWtqcCsvZVNFaUZVUFFBdnpWU3BNdHlVYnVDNWtPV2tNR25m?=
 =?utf-8?B?UnR5MWM1dkF3aGV0Z2FPWDdLdlR4cFNSWjZrQ3V5YlRQK05mWmphSlpnTjcw?=
 =?utf-8?B?UzVDQXF4Z3dRU2piaHNnMlFhZ24yYmgwUnkyMVZnWGdhbFA3Rll1bDFydjhl?=
 =?utf-8?B?c2czMHpEQ0VhcGhWYmlzVmMwbjdocC9US0w3VEd2emhQTTc4RTVLZUI0VUlt?=
 =?utf-8?Q?b65CgcUYasKtLRvAkKPOJVCJ0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1d7a761-3754-4711-3a4d-08dbaf034732
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 18:01:21.9488 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oLaH8s1VWMgyshC3mSb4jbXO9rI6u+iIc6lhDXE4LB0WaCWhKUCkSWn8+dm8mz1GPAxBvx4EuPVRw4ka+ivbFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8718
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
> From: Joshua Ashton <joshua@froggi.es>
> 
> Need to funnel the color caps through to these functions so it can check
> that the hardware is capable.
> 
> v2:
> - remove redundant color caps assignment on plane degamma map (Harry)
> - pass color caps to degamma params
> 
> Signed-off-by: Joshua Ashton <joshua@froggi.es>
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>  .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 35 ++++++++++++-------
>  1 file changed, 22 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> index f638e5b3a70b..4356846a2bce 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> @@ -538,6 +538,7 @@ static int amdgpu_dm_set_atomic_regamma(struct dc_stream_state *stream,
>  /**
>   * __set_input_tf - calculates the input transfer function based on expected
>   * input space.
> + * @caps: dc color capabilities
>   * @func: transfer function
>   * @lut: lookup table that defines the color space
>   * @lut_size: size of respective lut.
> @@ -545,7 +546,7 @@ static int amdgpu_dm_set_atomic_regamma(struct dc_stream_state *stream,
>   * Returns:
>   * 0 in case of success. -ENOMEM if fails.
>   */
> -static int __set_input_tf(struct dc_transfer_func *func,
> +static int __set_input_tf(struct dc_color_caps *caps, struct dc_transfer_func *func,
>  			  const struct drm_color_lut *lut, uint32_t lut_size)
>  {
>  	struct dc_gamma *gamma = NULL;
> @@ -562,7 +563,7 @@ static int __set_input_tf(struct dc_transfer_func *func,
>  		__drm_lut_to_dc_gamma(lut, gamma, false);
>  	}
>  
> -	res = mod_color_calculate_degamma_params(NULL, func, gamma, gamma != NULL);
> +	res = mod_color_calculate_degamma_params(caps, func, gamma, gamma != NULL);
>  
>  	if (gamma)
>  		dc_gamma_release(&gamma);
> @@ -725,7 +726,7 @@ static int amdgpu_dm_atomic_blend_lut(const struct drm_color_lut *blend_lut,
>  		func_blend->tf = tf;
>  		func_blend->sdr_ref_white_level = SDR_WHITE_LEVEL_INIT_VALUE;
>  
> -		ret = __set_input_tf(func_blend, blend_lut, blend_size);
> +		ret = __set_input_tf(NULL, func_blend, blend_lut, blend_size);
>  	} else {
>  		func_blend->type = TF_TYPE_BYPASS;
>  		func_blend->tf = TRANSFER_FUNCTION_LINEAR;
> @@ -950,7 +951,8 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc)
>  
>  static int
>  map_crtc_degamma_to_dc_plane(struct dm_crtc_state *crtc,
> -			     struct dc_plane_state *dc_plane_state)
> +			     struct dc_plane_state *dc_plane_state,
> +			     struct dc_color_caps *caps)
>  {
>  	const struct drm_color_lut *degamma_lut;
>  	enum dc_transfer_func_predefined tf = TRANSFER_FUNCTION_SRGB;
> @@ -1005,7 +1007,7 @@ map_crtc_degamma_to_dc_plane(struct dm_crtc_state *crtc,
>  			dc_plane_state->in_transfer_func->tf =
>  				TRANSFER_FUNCTION_LINEAR;
>  
> -		r = __set_input_tf(dc_plane_state->in_transfer_func,
> +		r = __set_input_tf(caps, dc_plane_state->in_transfer_func,
>  				   degamma_lut, degamma_size);
>  		if (r)
>  			return r;
> @@ -1018,7 +1020,7 @@ map_crtc_degamma_to_dc_plane(struct dm_crtc_state *crtc,
>  		dc_plane_state->in_transfer_func->tf = tf;
>  
>  		if (tf != TRANSFER_FUNCTION_SRGB &&
> -		    !mod_color_calculate_degamma_params(NULL,
> +		    !mod_color_calculate_degamma_params(caps,
>  							dc_plane_state->in_transfer_func,
>  							NULL, false))
>  			return -ENOMEM;
> @@ -1029,7 +1031,8 @@ map_crtc_degamma_to_dc_plane(struct dm_crtc_state *crtc,
>  
>  static int
>  __set_dm_plane_degamma(struct drm_plane_state *plane_state,
> -		       struct dc_plane_state *dc_plane_state)
> +		       struct dc_plane_state *dc_plane_state,
> +		       struct dc_color_caps *color_caps)
>  {
>  	struct dm_plane_state *dm_plane_state = to_dm_plane_state(plane_state);
>  	const struct drm_color_lut *degamma_lut;
> @@ -1060,7 +1063,7 @@ __set_dm_plane_degamma(struct drm_plane_state *plane_state,
>  		dc_plane_state->in_transfer_func->type =
>  			TF_TYPE_DISTRIBUTED_POINTS;
>  
> -		ret = __set_input_tf(dc_plane_state->in_transfer_func,
> +		ret = __set_input_tf(color_caps, dc_plane_state->in_transfer_func,
>  				     degamma_lut, degamma_size);
>  		if (ret)
>  			return ret;
> @@ -1068,7 +1071,7 @@ __set_dm_plane_degamma(struct drm_plane_state *plane_state,
>  		dc_plane_state->in_transfer_func->type =
>  			TF_TYPE_PREDEFINED;
>  
> -		if (!mod_color_calculate_degamma_params(NULL,
> +		if (!mod_color_calculate_degamma_params(color_caps,
>  		    dc_plane_state->in_transfer_func, NULL, false))
>  			return -ENOMEM;
>  	}
> @@ -1077,7 +1080,8 @@ __set_dm_plane_degamma(struct drm_plane_state *plane_state,
>  
>  static int
>  amdgpu_dm_plane_set_color_properties(struct drm_plane_state *plane_state,
> -				     struct dc_plane_state *dc_plane_state)
> +				     struct dc_plane_state *dc_plane_state,
> +				     struct dc_color_caps *color_caps)

This seems unused.

Harry

>  {
>  	struct dm_plane_state *dm_plane_state = to_dm_plane_state(plane_state);
>  	enum amdgpu_transfer_function shaper_tf = AMDGPU_TRANSFER_FUNCTION_DEFAULT;
> @@ -1147,6 +1151,7 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
>  				      struct dc_plane_state *dc_plane_state)
>  {
>  	struct amdgpu_device *adev = drm_to_adev(crtc->base.state->dev);
> +	struct dc_color_caps *color_caps = NULL;
>  	bool has_crtc_cm_degamma;
>  	int ret;
>  
> @@ -1156,6 +1161,9 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
>  		return ret;
>  	}
>  
> +	if (dc_plane_state->ctx && dc_plane_state->ctx->dc)
> +		color_caps = &dc_plane_state->ctx->dc->caps.color;
> +
>  	/* Initially, we can just bypass the DGM block. */
>  	dc_plane_state->in_transfer_func->type = TF_TYPE_BYPASS;
>  	dc_plane_state->in_transfer_func->tf = TRANSFER_FUNCTION_LINEAR;
> @@ -1163,7 +1171,7 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
>  	/* After, we start to update values according to color props */
>  	has_crtc_cm_degamma = (crtc->cm_has_degamma || crtc->cm_is_degamma_srgb);
>  
> -	ret = __set_dm_plane_degamma(plane_state, dc_plane_state);
> +	ret = __set_dm_plane_degamma(plane_state, dc_plane_state, color_caps);
>  	if (ret == -ENOMEM)
>  		return ret;
>  
> @@ -1189,10 +1197,11 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
>  		 * linearize (implicit degamma) from sRGB/BT709 according to
>  		 * the input space.
>  		 */
> -		ret = map_crtc_degamma_to_dc_plane(crtc, dc_plane_state);
> +		ret = map_crtc_degamma_to_dc_plane(crtc, dc_plane_state, color_caps);
>  		if (ret)
>  			return ret;
>  	}
>  
> -	return amdgpu_dm_plane_set_color_properties(plane_state, dc_plane_state);
> +	return amdgpu_dm_plane_set_color_properties(plane_state,
> +						    dc_plane_state, color_caps);
>  }

