Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A3A4E8E7A
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 08:55:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43E8310E275;
	Mon, 28 Mar 2022 06:55:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2059.outbound.protection.outlook.com [40.107.220.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D43B10E275;
 Mon, 28 Mar 2022 06:55:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DZ69kZW+k9DzTECHXYU8AQEIvkVrTh5hRH98GHc4Ahi4pirlszE8t1ZzaevR6jtiV2+b3wf1GhgBo/aDFDfd25qnphwIzMwy5iDJAm7QjlI6kZRxnhhTOtTeLCuDNB+y/7EzzJ/A+JNKYx9Tp7tL4uoVNzDRungCegVLr+AYCbj3u5BhJ8DhU5V1kdhtg0Qr9OfOuSrhOePlPhzLaTxaQlQW4rlgWqwlcMr+tG2LiONBFMtI6HhSnTtMvSajhahjzjvamfHGvYqDpPfeJdUjreTCqbmfH7tXaoSUQvz31gTcqQQY6vREbJLKJsQNdGiGtLx3kZDRIl+OfLWpJOOrOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vzrzmxKtrcSGCnbISxHryzCz1Kt0XHsPo2srJG+Obtk=;
 b=SiXXfiVKnUpdirWFuzswQdnYyNtZwG7b/9DrGC5LNa69+xcdH5nwH8QxI6061ILIV0IpGS+ezhB3PCsMon5okL6tfRtvli11JtQogRoBwlz4Zexj3oRzEX4F6iQcKN/BBdM5ebgIhmX+uOt2Yvz9xEw+h+WeZO1Hws1D/US3eg8aTApZq3sYZUfJcipTMVevec92XWRFVkNPM1NYP73M5RMM4Ti7vlJfF3KtjWKbJZ9S/wV3VlhseD4ST92HgLicDHxqivxN2VZLjaXAWcvTFqYjgxisiJhGZ+HRKQclX3+1DVoz1I/TwzjYMq0k4FZibeSUl7RpFeT6ElRWN9mAVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vzrzmxKtrcSGCnbISxHryzCz1Kt0XHsPo2srJG+Obtk=;
 b=euiPl+wG68gy4Cf/0ibLD677vH6etiwrC0nk7ANav8MQuWCD8paX+FqcDPc3Bm5Oa/CQqI9ejMWaq0x25vY0UvUzPPZiw9ZEMkZQPTtFiTNG8C3oTOGo18C5iraJuVyysmDGDKn0BxQVQY/XZ0/pzJph87LTtvN7i64688dg3WA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CY4PR12MB1142.namprd12.prod.outlook.com (2603:10b6:903:40::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.21; Mon, 28 Mar
 2022 06:55:19 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185%6]) with mapi id 15.20.5102.022; Mon, 28 Mar 2022
 06:55:17 +0000
Message-ID: <1586f68e-c635-482f-9399-2b027b766543@amd.com>
Date: Mon, 28 Mar 2022 08:55:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/2] drm/amd/display: detach fpu operations from
 dcn10_validate_bandwidth in calcs
Content-Language: en-US
To: Melissa Wen <mwen@igalia.com>, amd-gfx@lists.freedesktop.org,
 harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, Xinhui.Pan@amd.com, airlied@linux.ie,
 daniel@ffwll.ch
References: <20220326202448.2046077-1-mwen@igalia.com>
 <20220326202448.2046077-2-mwen@igalia.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220326202448.2046077-2-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0096.eurprd06.prod.outlook.com
 (2603:10a6:20b:465::25) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3dab5765-c61f-4063-9546-08da1087eaed
X-MS-TrafficTypeDiagnostic: CY4PR12MB1142:EE_
X-Microsoft-Antispam-PRVS: <CY4PR12MB1142924C170C8E1E803C9F9B831D9@CY4PR12MB1142.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8P3t9oOfTEK9XQFRaAI1+vBwnU97EIiqGnf4Ab8TxpuLXvcrS7vSJV+tGQh7l7DAV08Ax8dh+kR6GZp/s+zebcmIqeBePtvlQNM6W7u/2QRTz1GzvGOZvt1ApMzMuPeMiP0qLJs/civ5/DTDOnETRyNvGILE9ynZ4RZA0r8p166XM6XIolf8+XyapE9P51jP5TF7GVIpIMEvoYSs1QSHgZWn7plDhqeatiBaXUiw4MEMPxVo9zIIKumhMw6UpnOzPeMd4e7tX3ECwmOTlW2r7EjdAcf2lLEEu2h19u3bqUaDQd3YQn2fx8AdAwJjMjDAw5ioO9pdKbedvARCDmT0EIbqc5yvvkq72C21kAQfTHL7iUOnTl18pKSXv+hZCwdDPpHMDmLiNwwaNrQhsBueTX2uiRWAiEMTBlcCniAJZDvq4ss7/Mf5jg6b9zGvDJ3sMXCVD1uVXeUX9JWdZKfpyNwue+9ZvrCQp93EQ8KtADoPw9R+y8lsZkOaHixJrESd0sl+P2vzKdFqjqfL3aRWPQIDeQt8KrHtgLig0huwc9PxRv+QNjFWWzxnq+BH6dcrFtOrgBNxKXS4RRT4OW+R9brULwjCqDd9FHa6r3yhiqQ75+uHMjTE84eUEL2M6VMvdFzqrDfleYXXrjWYlTpLloBZt8R4QC/TtbFSAXRGY7BHvF2JthDNN1ipHxXrGvwWhboXt9mdMtMeEH72fpGzOSSSkrb4ZGoFI1IypDeYGnw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2906002)(66476007)(6506007)(8676002)(66556008)(54906003)(5660300002)(508600001)(38100700002)(316002)(6666004)(4326008)(66946007)(86362001)(31696002)(6512007)(31686004)(66574015)(6486002)(2616005)(36756003)(186003)(8936002)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHJuNDNia21BNlM1QU1GMHZmeWVZRW1JcXg0R3FmSlhtZzFtVS9hOFk5alht?=
 =?utf-8?B?Qi93UVRJK3hRaGV5VEVsd1RxWnUyTUgweGRXRXVwUDFtbHp0WVBPajlGZVFz?=
 =?utf-8?B?SzN3ZEEvVG5SUVJjNzM5L1VpYVJBd00weHVYMTZ1dTYvRWk4aVNRdmU4WG5N?=
 =?utf-8?B?bmFYUEw1YUhrM2p5aFNObG9DOFhFVFBxZ0ZhdXRBcWxlYnNhMzlwU013NWI5?=
 =?utf-8?B?a1hKbXpldXFJcFBuMWx1Vm0zWlV1VXJNT2Z0cllUb09WMW5EUUxQNVprcE9m?=
 =?utf-8?B?d2Z4Q0VDRE5QYVRjZVo1Q3ZwWDdCeHdhYTJHcUtVU1NTQlVCdStrRWRLbG9D?=
 =?utf-8?B?dHYrcUVTeFMzWnVNTHl0WlMxTm5GckN2MlR0bEU4ZDhYeTVkVmRiNlFtME8v?=
 =?utf-8?B?bmsrVnRwUVRVNHNiYVlNdU14K3dwZE8rakZwajNvZXpvR0FTRWZxeEEzdURy?=
 =?utf-8?B?SXVENDgyK2hpWVY0M3F6Uld3NStKb0R4dDBGcEZIUnBzdDJDdmROLzRUOUV4?=
 =?utf-8?B?T3hudEMzdE9ydE04Q2FJWlVoNkZlOGlsbUFuMjRtRXZac2xvVzFlOGJhSDRB?=
 =?utf-8?B?dHduc2Q4UlNDbE4xQTdjelBGbEhqc1o2c1VObXE2Tld6bmJqVnNiL2VIWGtZ?=
 =?utf-8?B?WUtiWGlyQmlYS2czWFMvbHVERE9pamNxcTJHaFU0SEhYYUs4NDNURkxkVHVR?=
 =?utf-8?B?cTNNbU9vWDU4cFAwdGdhWG5TRUthREFuRHVnQmE3dEZQN3NINHNsL2orWWIr?=
 =?utf-8?B?c3B4Ky8xbHBBYUppRVJsYnhJYk9mM2FWMCtPQi9idkdrdnBWVk1EeGhWS2Iy?=
 =?utf-8?B?cDhaaTRaMWIxaG8rZWFLek9KZUFhTHV5R0F5c2dmRmI2RDQvSElQQ3M4NVM0?=
 =?utf-8?B?ZHJIelpKcEdITFpaTjUwT0o2NkVPSld2UFVoYklwNk1uUjlxVTZucWZrSCt0?=
 =?utf-8?B?aitkVHlqWittQ1VVcVlzMzVNUGJ5NnluWEJVTG9RZmNNQm54QUFta3VKaHds?=
 =?utf-8?B?Y3BQOWZvOFNicENibzM2bG81d2I1V3llTjMwRmxtbVNlNTFld013K1FxQ2dE?=
 =?utf-8?B?bGVzeXpUM3FFaFpuRU9iS1R4b29KdjFYZkI5VVM4WkVIdnZ3OXBaVTVXcXZI?=
 =?utf-8?B?b2lsUWk4VXlWc2FjK0RINWFBUVhKQlBiU3IrS1BZWXFub3hPVTZqRXpMaktp?=
 =?utf-8?B?dTlvcUhyV1Zrc3R3akVETitMWDZDbWpTcVhCQkxwM0w0a2FSa3BXWWtwb0lp?=
 =?utf-8?B?bDhFZkIxYmNKZWdIcmQwRU5Pd3FFckQxM0RuVDBzenpxT2xJQzNPVHcxRVQ3?=
 =?utf-8?B?enp0WGpNSFlja0dPR0FkVmVZK0N1c0doVmFjdEV0VWlJTzl0eW1BRXk2YmZt?=
 =?utf-8?B?NmQ3YnY0aWJDdWpTV1l0bFpLQ2JGcFFsK0FWZVRPa2FManhwcVBLM09UQzNN?=
 =?utf-8?B?c0JWWkgrS3pyY3RadkkyWEM0REgweXNkUlN1QjNRT0orVm9jd2pVWlJzNWdW?=
 =?utf-8?B?WHhucGdhQ1dWL0d4RU03MGdwWGhJQmtvb2xLM1h2QXNzKzZ5LzJBRGNHTi9p?=
 =?utf-8?B?N3NYbXdXSmcxWjBrMUlaQnpUQ285M2h6NVNPWGFJMVRUUXFnaFE0YmVRSFN3?=
 =?utf-8?B?Z0FiYkl4MGdrc1FpdlhNbHFrNzlyaktza214WEYvMHl5L0t6RkorNnhFTjhH?=
 =?utf-8?B?UXR0TDkvVVJsekQ5M0FMYkJXSC9zVXpmRDNVQU5IWnZnZ1k0ZnlZWjZDbHdy?=
 =?utf-8?B?cmNHZVVsWnpaMTc5bXlPcGM0QUN0MHlFY0hBeWt2Q1JDQ1EvNFV1S0ZaT0RB?=
 =?utf-8?B?OW0vOEtKSXdnQ0VMZFN5b0xpRkx0UDM3Q1daYW1GaFZLdDR6VjVHWG5ENE9J?=
 =?utf-8?B?QndnT3dNS2U1dWJNRUVDUUtuQVdFVVN4aWpsMVFkbHlmTUF0VWcvbU5ZTW05?=
 =?utf-8?B?S1doL1hxbHczWjVJaDBxRDVwd2RSSXppT1Q5RktqRllGeVFnN3lNcm9BNU1M?=
 =?utf-8?B?TFQyVStENFVhVXhiamx0bmNBbFdadmZsUU9vQlVRTFVZdnQvK0JUNXovVkZt?=
 =?utf-8?B?ZXRDK3pXRFI2OGp3Zjh6U05FK3dEZmVNcFU1Q3lXeXZiWWN2N2doWGlrc2p6?=
 =?utf-8?B?MXNBdE4vSW92UVYwTGY2VEtoMERUS1RoNG9GazgxWUoxNTJTUjBnSlZUWU1O?=
 =?utf-8?B?Y0dSOUdsYlJXMmdmOHY4Q2twZk5EME9EYXl1ZUwyTS9qQlN3YnBNM1haMzV5?=
 =?utf-8?B?Q0lQa1VaN1VmK2p1VzhNRDhiSGtlUURiWExXb25sOEgzSmdSd1VXdGVVdlp5?=
 =?utf-8?B?dVVIZ1JMT3VwN0w2ZGUycmlZR0lhaXBXcVNVbkE1WFc1MnZadU53dFl2YVJK?=
 =?utf-8?Q?yyxCGdTohDnOK9x1GwkKj9hxsPCznL/pvOL7V0WpPz7UN?=
X-MS-Exchange-AntiSpam-MessageData-1: Prl+VtOFgYHMig==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dab5765-c61f-4063-9546-08da1087eaed
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2022 06:55:17.7070 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kwJbSNHVqMqypYJV1a4yvPhR13lNFyUZY3Jt2xWzQO7qWU5BdkgojObRVPnbzTwM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1142
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
Cc: Qingqing Zhuo <qingqing.zhuo@amd.com>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jasdeep Dhillon <jdhillon@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 26.03.22 um 21:24 schrieb Melissa Wen:
> dcn10_validate_bandwidth is only used on dcn10 files, but is declared in
> dcn_calcs files. Rename dcn10_* to dcn_* in calcs, remove DC_FP_* wrapper
> inside DML folder and create an specific dcn10_validate_bandwidth in
> dcn10_resources that calls dcn_validate_bandwidth and properly wraps that
> FPU function with DC_FP_* macro.
>
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>   .../gpu/drm/amd/display/dc/dcn10/dcn10_resource.c  | 14 ++++++++++++++
>   .../gpu/drm/amd/display/dc/dml/calcs/dcn_calcs.c   |  5 +----
>   drivers/gpu/drm/amd/display/dc/inc/dcn_calcs.h     |  2 +-
>   3 files changed, 16 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c
> index 4048908dd265..1587a060b55a 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c
> @@ -1141,6 +1141,20 @@ static void dcn10_destroy_resource_pool(struct resource_pool **pool)
>   	*pool = NULL;
>   }
>   
> +static bool dcn10_validate_bandwidth(
> +		struct dc *dc,
> +		struct dc_state *context,
> +		bool fast_validate)
> +{
> +	bool voltage_supported;
> +
> +	DC_FP_START();
> +	voltage_supported = dcn_validate_bandwidth(dc, context, fast_validate);
> +	DC_FP_END();
> +
> +	return voltage_supported;
> +}
> +
>   static enum dc_status dcn10_validate_plane(const struct dc_plane_state *plane_state, struct dc_caps *caps)
>   {
>   	if (plane_state->format >= SURFACE_PIXEL_FORMAT_VIDEO_BEGIN
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/calcs/dcn_calcs.c b/drivers/gpu/drm/amd/display/dc/dml/calcs/dcn_calcs.c
> index e447c74be713..c25023f7d604 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/calcs/dcn_calcs.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/calcs/dcn_calcs.c
> @@ -764,7 +764,7 @@ static unsigned int get_highest_allowed_voltage_level(uint32_t chip_family,
>   	return 4;
>   }
>   
> -bool dcn10_validate_bandwidth(
> +bool dcn_validate_bandwidth(
>   		struct dc *dc,
>   		struct dc_state *context,
>   		bool fast_validate)
> @@ -790,7 +790,6 @@ bool dcn10_validate_bandwidth(
>   		dcn_bw_sync_calcs_and_dml(dc);
>   
>   	memset(v, 0, sizeof(*v));
> -	DC_FP_START();
>   
>   	v->sr_exit_time = dc->dcn_soc->sr_exit_time;
>   	v->sr_enter_plus_exit_time = dc->dcn_soc->sr_enter_plus_exit_time;
> @@ -1323,8 +1322,6 @@ bool dcn10_validate_bandwidth(
>   	bw_limit = dc->dcn_soc->percent_disp_bw_limit * v->fabric_and_dram_bandwidth_vmax0p9;
>   	bw_limit_pass = (v->total_data_read_bandwidth / 1000.0) < bw_limit;
>   
> -	DC_FP_END();
> -
>   	PERFORMANCE_TRACE_END();
>   	BW_VAL_TRACE_FINISH();
>   
> diff --git a/drivers/gpu/drm/amd/display/dc/inc/dcn_calcs.h b/drivers/gpu/drm/amd/display/dc/inc/dcn_calcs.h
> index 337c0161e72d..806f3041db14 100644
> --- a/drivers/gpu/drm/amd/display/dc/inc/dcn_calcs.h
> +++ b/drivers/gpu/drm/amd/display/dc/inc/dcn_calcs.h
> @@ -619,7 +619,7 @@ struct dcn_ip_params {
>   };
>   extern const struct dcn_ip_params dcn10_ip_defaults;
>   
> -bool dcn10_validate_bandwidth(
> +bool dcn_validate_bandwidth(
>   		struct dc *dc,
>   		struct dc_state *context,
>   		bool fast_validate);

Just for the record: That's not really usual kernel coding style, but 
that's not topic of this patch set.

The series is Acked-by: Christian König <christian.koenig@amd.com>

And it would be really nice if we could make the DC_FP_* macros somehow 
fail in the dml folder.

Thanks,
Christian.


