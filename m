Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBC272058C
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jun 2023 17:10:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D06E610E0A7;
	Fri,  2 Jun 2023 15:10:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2074.outbound.protection.outlook.com [40.107.101.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EECD710E0A1;
 Fri,  2 Jun 2023 15:10:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bzgMTcEsA7xIhNIzJPqyyehfHWqiQKmp/vNyfsMmNySFH9YrRvptrYsjX6iYJaAcuePnEWCGb5WZ4ooYdzPMz9QQzpGR7Xg3WypmC8pobQcdHpG89Acq2tJ19xKfQXyYnYdjq9YgVtlsuISMWNCNLV8cyhuiqVlV7HTvHywhXxlwWTDLzsiDiouQST6Ih3iMPUqAjbVbL1TCzLxmdgyDgVhDmhdUB1PUeyn0wKrR+XdhQfJTOGCWht8nKHI3RGXEsPUT7iKxBDKOO8xaggjdIQescgRAQ//OfCXp0WcYIVaDz9IdiESbTzipQZ2VXEZDjKRSOEyXnTmDjOLGjw1VJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=75vtvqDnUazxrR8SG2YuCh9L4KEm8HnfO56GrNDTw4M=;
 b=Vzsjv6Ca7aXUj5KN9qbo8HhcHKw9PCmDK+XjGzFtDJOVDQEkef9OnToeQmWE848Y+9jK0LqqhHV8AE8q0OEBLDX6vzmnam2WWDHZAmxCHOr+D/CNzz+fD2X6b9YnajvswLcefZYftKBF6YGTiPB/VJLYsviQsL1QzZEdDbHhW3omYjL8R4H9d5PEQLkfJgwP2UcAQ7sa7tg72NNIvKydxczviKKTu5foNZYEgjli2TvNanbbykSiaojbUgBeg9OKVVvRPCLZVakrBuQiJlRmB7mHIcKTpwi2A4cBFPoE4Pigp3m+HkLjSXmUq1Joe0+MCOaHKwmBINrGtyrLi0My5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=75vtvqDnUazxrR8SG2YuCh9L4KEm8HnfO56GrNDTw4M=;
 b=48NGs2IT23AA7o+gl+VTi3vkgm1b4/Tigj9k3O3fsZOe7Josw/O2bsQglE4SL8mA5N/C5niBnfm0TKs1KuLTNIStuRUWawBTzGhNPenT5eewIM4+VSkeX8uiQJD6MkAzCUdYUDLAH4b54oOMKqPeqOscDDSHZEdTWKbQnr/wpTY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by IA1PR12MB6627.namprd12.prod.outlook.com (2603:10b6:208:3a1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.22; Fri, 2 Jun
 2023 15:10:18 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::4666:2db3:db1e:810c]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::4666:2db3:db1e:810c%7]) with mapi id 15.20.6455.024; Fri, 2 Jun 2023
 15:10:18 +0000
Message-ID: <f2ac71b5-9b2a-4318-1b3a-863285ae05fd@amd.com>
Date: Fri, 2 Jun 2023 11:10:12 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 36/36] drm/amd/display: allow newer DC hardware to use
 degamma ROM for PQ/HLG
Content-Language: en-US
To: Melissa Wen <mwen@igalia.com>, amd-gfx@lists.freedesktop.org,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
References: <20230523221520.3115570-1-mwen@igalia.com>
 <20230523221520.3115570-37-mwen@igalia.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20230523221520.3115570-37-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0111.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:5::14) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|IA1PR12MB6627:EE_
X-MS-Office365-Filtering-Correlation-Id: ff3d78db-caa6-4aba-326c-08db637b79e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RULkl8CHIv7pF7wdLRH7AhJtaouHzJApHDFhzwPuwNwv/wzybxVk9UWMHN0NVC3ggB4TrqmD1tsGkMOydCZx56ksEefEqtdz8KURCSggDI56xqllzzXyV85cOjxYmFSHfZtBeTp3exUR4cKBQxHjTcJS7sPu4r2Jg1bd/a0goUP4BdTaixqSLN+IKpEUNEdGbIyMUPu3xXhF3kFKY3OabEg26E/2Y563mEpq2zQPSys0d0UvhByOfb9WsWcNVae9KbQ/wTtwMUSpLEF67uQgrpFt8zgW1IUE9f2K3KEPtrMeAnEWsoZXBbGaG9j0mUuFT5rowcmwTPjUYUZzzzyRjOLz9vVksPYZJ0MEA5RqZ1baWevhkdXuPim9aLQTINNwC+DeExAD5EGgcDRx2mEPRMyOf/AlYUELur2QQXsb2PV86RitwF3v9k0Og0pNYZUF5gDMCmfB0r053Q1RInNAzb6hCpwslmAF8CmhcPVBc6XCKLW1qiEpxL2aooJXDTSUl4b4wfG+t5OIwQzNog/+GS4HpAvS3P2mbS0R9FgNprFOWd/bewn7M1Ngzidn/w2sk8vLauSAgfwJw5/WLVD6CU2QUdEwRKFUtooPaJOcktJ2Suz2GZ/B+1ZEkxgzwyo5A/32qQir6f50vrDsIlTjACi2fIQWB36+V8FeGwwi4LQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(376002)(366004)(396003)(346002)(136003)(451199021)(41300700001)(6486002)(5660300002)(6666004)(186003)(8936002)(8676002)(53546011)(36756003)(26005)(38100700002)(6512007)(6506007)(4326008)(66476007)(66556008)(44832011)(110136005)(66946007)(316002)(2906002)(54906003)(83380400001)(921005)(31686004)(2616005)(478600001)(7416002)(31696002)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a09QSytNcWF5UUx6MHd0cDByTi9pT3R5RjlKNU5oSzRVOGo0cHU5NUpGbUZ4?=
 =?utf-8?B?N3Y5N3ZKeWx1Vk40b3VmMXRZaWd4V2VBb3J1b1Z0OGdyL0ZOZHlpaUFrSGE3?=
 =?utf-8?B?czE2V2ZyeTFVTElkbExGc2diUkFzTVRlM09Ga0ZaWDVBWGJRWUlxNDZDMlVS?=
 =?utf-8?B?bWRweEViNDBZRHJ0cldRODZOZnIramM1Qm4xRWV2dEpCYi9OZUZpeEZhNzhO?=
 =?utf-8?B?YnNlMy9ZUGNzRmowSkR3TE8rbzRNYTkyQ09DVm53bHdaTStXbWRJTG40NnhR?=
 =?utf-8?B?R09FOVRxTlBZQm5zbVJLNHNMSkUxN1E4NmNteWxxb24wVEtEWDV5Y2hiaUo3?=
 =?utf-8?B?ekp4dFdqYms0cHEwa1NuQnVmc29KR1E0YjNiNVVPREIxVFVRUkY5TFJVYVdk?=
 =?utf-8?B?Q0lES2FsK1kvNXB0K0c4YkNGQUpyK1I1YUUvZkJvMjF6K0p2OUJnYlJmemp3?=
 =?utf-8?B?ZXJ1TDdJcVlLNmpCOU1saFNOV3BCME5TVFB6NjZ3Wk5GTVJVcnpmYUFOOTVr?=
 =?utf-8?B?MDZZelVUMkdkMnU5TVVZbW1pWUkvcjd2ODRPOXozemQxSzlXaWk0UDdoaU8r?=
 =?utf-8?B?N2hlMnVkRDgrQmIyY2FzYTU3aG1MaU4ybEUvdjdsTGpXNHZHRlU2SDg2cndy?=
 =?utf-8?B?QmFEdTRDUVJZeUp3bU9NYnYyYzZycXZEeC91Qjd5TTEvKzIrc3N6OHRhT0RE?=
 =?utf-8?B?VlR3Mml0c2xRS0JjQTkvUDk3YkZxbzVLNkxpRXNzR2Y3VXBxU3JRUENkaUlX?=
 =?utf-8?B?dmkvRzY3a05ZOWtkbW1PZFFDdXZlanozazhmN3N6M0RpbWJGT3pPZ3Bxbmtt?=
 =?utf-8?B?OHc2Y0Y3eTB1Sm9vREF0WENHbTV0emRpU1QwZUk1ajRIN01HUHZNWTBmV1lC?=
 =?utf-8?B?LzJERmRtTmcwZ1RtQlpWRjkvck9KVWZYVzk5T21jN1M3NXZJY2VhbFk0NjFn?=
 =?utf-8?B?eThtTlRiMEVRa2kxZmFacXlRT0w1VjE0UU8ycEs1ZnBBNHVYbDZFemlEMmFk?=
 =?utf-8?B?ak5GUVo3WnhROGNNbXF0RFBCNEpTMmh5azVncDZ4eWt4UEtPNDBySnhrRGFx?=
 =?utf-8?B?UGI1SlBhWklhb3B2ekVhZ2NCaWpjRnlaUlBOaFlOYTZhcGtveTBFTUhnUkNs?=
 =?utf-8?B?c0EvSm1WcXJhTjhoa0hIUHlKRk1ZcDdTM0l4c1ZkQ2g5UEY2UHhpMTNOM2pk?=
 =?utf-8?B?ZVBMeW5XSnVZY0N2WU81YUxDUm45VXp6bThBZEcvUjRIS0J1VE5DaFE3cUJC?=
 =?utf-8?B?ajBmVVEzcVZCbFo2aU9MTXQ3Z1dmYXB1R01NYmZPbGttNUdXSUU5cFA1emE2?=
 =?utf-8?B?Ujd2eGR2NjFrOFlhaVNzb3BUSkdaYm1TOWZzTWtLZDI4SnE4MFpPZkdyQkZN?=
 =?utf-8?B?TlJpSlVPcVZnQnJ5cXlGNWRKMTI5VjZuN3lLbFpOb2t4TUJIblVTVjlBckhS?=
 =?utf-8?B?Snl2aGIwS09SMlVXdnlHdEE5ZnFBUDF1Q0Nscmpydlc2WHVaYXErQmFNbnVK?=
 =?utf-8?B?NURuQVkwWEVDc2tRdmlxTjRidDBtVlMxUVR6TElsYnJ6aFovOTluaW41WENO?=
 =?utf-8?B?YmIwNHFRa0tWeDhPRXFhc3pqc2JUWHhwSTVJdk9sMUpTYmxSRnBrSDVoUC8x?=
 =?utf-8?B?WjFndHVIT1dKRWFXcEtoQktVSXEyR2hzdXU1bk1zZlU0bUxTcTk3dmdYL3JO?=
 =?utf-8?B?dXI2c0xKTGJQLy9RZ0VMMldHOFhUSEg0U2k4Wnd6ajhtaldVaHliblVZSUd1?=
 =?utf-8?B?Z3lqNVk2VU16a3QvV213S25TN044NEE1YlFUb3loakcrL1l6TXlxRGdpcC9l?=
 =?utf-8?B?YUt4VFNReFFjTjFCU1dMOE1SS3kyTWFyOHZzcG9FZVY0bGlQK2M1czZxWXNR?=
 =?utf-8?B?TzV5eHhSMUY0NzU2Q3JJTTR6UFQxeXA5RWpWZ2JaUEc2WXYvclJyRHN5eEhD?=
 =?utf-8?B?NnowdUkvdUJ2d3FoYmx1Rys4ZDhNRWozblRteFdvclVKdXFZSGJoazZtU3Ez?=
 =?utf-8?B?ZlYvSUk2aElua0JzbDlaZEdOVnRNcmRZYklXL0tDd1lYaXZYOWsrTmd4Yy8x?=
 =?utf-8?B?SVVXeW01dVZXODhQVy9uOUR4NW9qQVJnTUtpTVkyb2RmR1BudVZaK0RhSDBi?=
 =?utf-8?Q?SAuIN9hoFUot2vF48s9KbWXQy?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff3d78db-caa6-4aba-326c-08db637b79e7
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2023 15:10:18.2680 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UT60bvuVenATr+fYg911Uz8wCC4k2sXZ6UBFkxqCbGGjSLnwHwH8jl2ObusF4VrPnuWGsK87RYzrFjbsdUknCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6627
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



On 5/23/23 18:15, Melissa Wen wrote:
> From: Joshua Ashton <joshua@froggi.es>
> 
> Need to funnel the color caps through to these functions so it can check
> that the hardware is capable.
> 
> Signed-off-by: Joshua Ashton <joshua@froggi.es>
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>  .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 35 ++++++++++++-------
>  1 file changed, 23 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> index 4a2b66568451..714f07bb9c9c 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> @@ -338,6 +338,7 @@ static int amdgpu_dm_set_atomic_regamma(struct dc_stream_state *stream,
>  /**
>   * __set_input_tf - calculates the input transfer function based on expected
>   * input space.
> + * @caps: dc color capabilities
>   * @func: transfer function
>   * @lut: lookup table that defines the color space
>   * @lut_size: size of respective lut.
> @@ -345,7 +346,7 @@ static int amdgpu_dm_set_atomic_regamma(struct dc_stream_state *stream,
>   * Returns:
>   * 0 in case of success. -ENOMEM if fails.
>   */
> -static int __set_input_tf(struct dc_transfer_func *func,
> +static int __set_input_tf(struct dc_color_caps *caps, struct dc_transfer_func *func,
>  			  const struct drm_color_lut *lut, uint32_t lut_size)
>  {
>  	struct dc_gamma *gamma = NULL;
> @@ -362,7 +363,7 @@ static int __set_input_tf(struct dc_transfer_func *func,
>  		__drm_lut_to_dc_gamma(lut, gamma, false);
>  	}
>  
> -	res = mod_color_calculate_degamma_params(NULL, func, gamma, gamma != NULL);
> +	res = mod_color_calculate_degamma_params(caps, func, gamma, gamma != NULL);
>  
>  	if (gamma)
>  		dc_gamma_release(&gamma);
> @@ -511,7 +512,7 @@ static int amdgpu_dm_atomic_blend_lut(const struct drm_color_lut *blend_lut,
>  		func_blend->tf = tf;
>  		func_blend->sdr_ref_white_level = SDR_WHITE_LEVEL_INIT_VALUE;
>  
> -		ret = __set_input_tf(func_blend, blend_lut, blend_size);
> +		ret = __set_input_tf(NULL, func_blend, blend_lut, blend_size);
>  	} else {
>  		func_blend->type = TF_TYPE_BYPASS;
>  		func_blend->tf = TRANSFER_FUNCTION_LINEAR;
> @@ -818,7 +819,8 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc,
>  
>  static int
>  map_crtc_degamma_to_dc_plane(struct dm_crtc_state *crtc,
> -			     struct dc_plane_state *dc_plane_state)
> +			     struct dc_plane_state *dc_plane_state,
> +			     struct dc_color_caps *caps)
>  {
>  	const struct drm_color_lut *degamma_lut;
>  	enum dc_transfer_func_predefined tf = TRANSFER_FUNCTION_SRGB;
> @@ -873,7 +875,7 @@ map_crtc_degamma_to_dc_plane(struct dm_crtc_state *crtc,
>  			dc_plane_state->in_transfer_func->tf =
>  				TRANSFER_FUNCTION_LINEAR;
>  
> -		r = __set_input_tf(dc_plane_state->in_transfer_func,
> +		r = __set_input_tf(caps, dc_plane_state->in_transfer_func,
>  				   degamma_lut, degamma_size);
>  		if (r)
>  			return r;
> @@ -886,7 +888,7 @@ map_crtc_degamma_to_dc_plane(struct dm_crtc_state *crtc,
>  		dc_plane_state->in_transfer_func->tf = tf;
>  
>  		if (tf != TRANSFER_FUNCTION_SRGB &&
> -		    !mod_color_calculate_degamma_params(NULL,
> +		    !mod_color_calculate_degamma_params(caps,
>  							dc_plane_state->in_transfer_func,
>  							NULL, false))
>  			return -ENOMEM;
> @@ -897,7 +899,8 @@ map_crtc_degamma_to_dc_plane(struct dm_crtc_state *crtc,
>  
>  static int
>  __set_dm_plane_degamma(struct drm_plane_state *plane_state,
> -		       struct dc_plane_state *dc_plane_state)
> +		       struct dc_plane_state *dc_plane_state,
> +		       struct dc_color_caps *color_caps)
>  {
>  	struct dm_plane_state *dm_plane_state = to_dm_plane_state(plane_state);
>  	const struct drm_color_lut *degamma_lut;
> @@ -906,6 +909,9 @@ __set_dm_plane_degamma(struct drm_plane_state *plane_state,
>  	bool has_degamma_lut;
>  	int ret;
>  
> +	if (dc_plane_state->ctx && dc_plane_state->ctx->dc)
> +		color_caps = &dc_plane_state->ctx->dc->caps.color;
> +

We already do this in amdgpu_dm_update_plane_color_mgmt and pass color_caps
into this function. We shouldn't need to do this here again.

Harry

>  	degamma_lut = __extract_blob_lut(dm_plane_state->degamma_lut,
>  					 &degamma_size);
>  
> @@ -928,7 +934,7 @@ __set_dm_plane_degamma(struct drm_plane_state *plane_state,
>  		dc_plane_state->in_transfer_func->type =
>  			TF_TYPE_DISTRIBUTED_POINTS;
>  
> -		ret = __set_input_tf(dc_plane_state->in_transfer_func,
> +		ret = __set_input_tf(color_caps, dc_plane_state->in_transfer_func,
>  				     degamma_lut, degamma_size);
>  		if (ret)
>  			return ret;
> @@ -945,7 +951,8 @@ __set_dm_plane_degamma(struct drm_plane_state *plane_state,
>  
>  static int
>  amdgpu_dm_plane_set_color_properties(struct drm_plane_state *plane_state,
> -				     struct dc_plane_state *dc_plane_state)
> +				     struct dc_plane_state *dc_plane_state,
> +				     struct dc_color_caps *color_caps)
>  {
>  	struct dm_plane_state *dm_plane_state = to_dm_plane_state(plane_state);
>  	enum drm_transfer_function shaper_tf = DRM_TRANSFER_FUNCTION_DEFAULT;
> @@ -1013,9 +1020,13 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
>  				      struct drm_plane_state *plane_state,
>  				      struct dc_plane_state *dc_plane_state)
>  {
> +	struct dc_color_caps *color_caps = NULL;
>  	bool has_crtc_cm_degamma;
>  	int ret;
>  
> +	if (dc_plane_state->ctx && dc_plane_state->ctx->dc)
> +		color_caps = &dc_plane_state->ctx->dc->caps.color;
> +
>  	/* Initially, we can just bypass the DGM block. */
>  	dc_plane_state->in_transfer_func->type = TF_TYPE_BYPASS;
>  	dc_plane_state->in_transfer_func->tf = TRANSFER_FUNCTION_LINEAR;
> @@ -1023,7 +1034,7 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
>  	/* After, we start to update values according to color props */
>  	has_crtc_cm_degamma = (crtc->cm_has_degamma || crtc->cm_is_degamma_srgb);
>  
> -	ret = __set_dm_plane_degamma(plane_state, dc_plane_state);
> +	ret = __set_dm_plane_degamma(plane_state, dc_plane_state, color_caps);
>  	if (ret == -ENOMEM)
>  		return ret;
>  
> @@ -1049,11 +1060,11 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
>  		 * linearize (implicit degamma) from sRGB/BT709 according to
>  		 * the input space.
>  		 */
> -		ret = map_crtc_degamma_to_dc_plane(crtc, dc_plane_state);
> +		ret = map_crtc_degamma_to_dc_plane(crtc, dc_plane_state, color_caps);
>  		if (ret)
>  			return ret;
>  	}
>  
>  	return amdgpu_dm_plane_set_color_properties(plane_state,
> -						    dc_plane_state);
> +						    dc_plane_state, color_caps);
>  }

