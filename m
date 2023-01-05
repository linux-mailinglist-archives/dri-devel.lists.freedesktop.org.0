Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E35BC65F603
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 22:44:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7DAB10E7F4;
	Thu,  5 Jan 2023 21:44:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2043.outbound.protection.outlook.com [40.107.243.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0BD010E2A3;
 Thu,  5 Jan 2023 21:44:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DI5sJwG8l+HdKXKpfRkAGRrFK0uH6gQ0V1LNtxUib+sKXdW3zzZas9f5yA6uRdWwGsNmAvDIdiOjk2Xk4hMzoXBhrcFxWk0HqLzcNy40b5pbYkE4RfhVGog/1lSPSqYICtl9X5aqAyNWBKXPsbvStDN0iTqWbGgljlfPOjDhoDsnWI16Qx3yRtNpvvYZUhCRtCOuMcpYiCSIzqJ0bzNog9tLVOTVAYb7HyxL4RME0hVu0gVQOr8HqtJzWIWs1uFHhzKAAt6E/aEvtAhUAFpbHYV5LeyhgzP3+CCMQRVslbK4lpiBzjjjmNLHvADBc/qbKlzKBb7fosgxw8qzzVOdsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9G6gc9MV4XqcYJFit0uXK/zIPREaR1Ngqad22v/NZM0=;
 b=TsUqJv0TTO1lMsM3Ek/mNP+m7u70tbzJjs8KRzKyANse2YPrqyxkac0smAwTrmp2Lm7mc6kZXKQ12Mv10SHAQe/L/tWHB9kpQEFDDieZfrdTuYRQE+aRLRwTcg4Img6Wr9u9RwJl0rmbTbnOfza9tfzVaHQbrySHnE1AXg+OMcSQUtMQVjImk41Hc5GCgZ+i/nPoO40JE3NeQOIE7bcJOsb/Kva/wVG/kKxQe7CJ/pIcUPPLQAdcpQHElLzpwmv/ITJZ32gIExgANE2tsklr00XI1F0KuGC8TB0GBcGgg2vdUs1/zHA+pcKtYPZt6k9RcfsaKHCBuGp07HtAZhImgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9G6gc9MV4XqcYJFit0uXK/zIPREaR1Ngqad22v/NZM0=;
 b=3As7RyN5q4lExC1TW1gvFGc9B3urCVBi6gRr5htNVk0iCfjsaP0FE7wUPtqd0GEIJViWTNrP1dNwibzIeAOfIjFVci0Qbaas6iQggKy1uxaUOzOBDjia+hPx5Gz00RO7F5yyve5a2kzUDta1DxppYXMVSPGt9vcU9llc5iTCAek=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by PH8PR12MB6674.namprd12.prod.outlook.com (2603:10b6:510:1c1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 21:44:21 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::152b:e615:3d60:2bf0]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::152b:e615:3d60:2bf0%4]) with mapi id 15.20.5944.019; Thu, 5 Jan 2023
 21:44:21 +0000
Message-ID: <0ff6e8f7-5dd4-a81f-9328-9e6d87837439@amd.com>
Date: Thu, 5 Jan 2023 16:44:15 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3] drm/amd/display: fix PSR-SU/DSC interoperability
 support
Content-Language: en-US
To: Hamza Mahfooz <hamza.mahfooz@amd.com>, amd-gfx@lists.freedesktop.org
References: <20230105203353.378805-1-hamza.mahfooz@amd.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20230105203353.378805-1-hamza.mahfooz@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT1PR01CA0047.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::16) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|PH8PR12MB6674:EE_
X-MS-Office365-Filtering-Correlation-Id: e1864c02-3c3d-4818-6382-08daef660132
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Vk8umV4N4dOo1Ra+88es32k6Y+HM7WfVuS2z2zz/in9S3aI854Z7Rl9/4ViHhKW3PQdt571hJjgSpKwZZw8+9/r8hwr4MGv6Jasj+yVnNbmSPNrCEr65fJuPbXUZPUDvwOKT8Hk6lOZQR0pgLW+vdJlTPoFkiYJphQ26FvFJIQjeiapMZI/QumTPmD1B90Uhlfwo+sDRGc5AbVeumcNlUVWPcUvLCRgCyiYoLmRrMoNnl0ITxKg4xkNWERlbIOJhoBhxmGPZi0s31eY5D6uFLk77uOVRYx1BSRtWJocR7Xx85zEWE73kDA5ksOGzLt+7mIe0zEi0c0FXotoXluvLjBSCcz5aWgZZ6uk/eD1YX7tVUDxUr+3Z4taVunRvICRORjLL9KCI7RzHMOvidNnQHKmUGTPdl1vEsoWBgpv8ghLoJzTG/2f3LolOzalyRBxEAtaP+9H1L9A3xp+VVEYiNJnxAsVLG5gbP8mjuF4IGdvxQq/4zWYW0BHkCFDNJsCk23BZHSbu/TJ28Kjo3pIu53FBlDBPN3FsE+TCQJ1L+8HdSkpxXAP6Mx1OKWh7mQ8vCDqxouUWqR+NrHUnRz43SypCrArSRCeKlf8uW9bRMhoocpbGKBT/r/hXz/ASrkx6yWZdpEaBjhu4pXsfslhQx1booFL7E9qdGYotTLnJll17aHQ9suMbVftAs7BBTqRgEk8V4jcuzxIbdKoqOspLv0e1XhOMgRGAslpKsUUkXc0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(366004)(136003)(376002)(39860400002)(346002)(451199015)(26005)(2616005)(6666004)(6512007)(186003)(8936002)(6506007)(53546011)(478600001)(6486002)(66476007)(41300700001)(66556008)(83380400001)(4326008)(8676002)(66946007)(5660300002)(2906002)(44832011)(31686004)(38100700002)(31696002)(86362001)(54906003)(36756003)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2g2UmVvR1ltcGpwQUZ4d3NLMy9VUU41ZmtjMk05MTdPL0d0SDFLUThyQXl2?=
 =?utf-8?B?ZHZvbjJPWU1VNFpWZnVycFF1VkFIRjZWT2IzVEdvWE5qcitGdzlZVytDcWNh?=
 =?utf-8?B?RlRBdmdTdUdQNUVlbEExQW92eml2THNLRllmQzdIdWQ5alJQK1hobXN5d0VC?=
 =?utf-8?B?Y3RUdnpCc00rNk9lQTc2dHczYXFtZXJkb2RUSk1xU0hiVlVVUXNBci8zdEU2?=
 =?utf-8?B?bklZWXFWLzJxQzZGdFVHNXFQTWs1RnNOYmNGMFhWYU5VK2pWR3hrejJTKzNr?=
 =?utf-8?B?Ujh1d2ZBcFNRck05bkNuV2l1c2VEK2NWYTZHbnFBanJRL1AzamhrLzN1ZzZM?=
 =?utf-8?B?Skd1SVRnajY2VkJ2ejJRb1JOU2NZc1BVMnl2WHBJdEZtQ0crN1dHWFVETzVE?=
 =?utf-8?B?azZaZVpod0diZGxoNmNta0ttUG93MjRmWmVZV0lhOWpDVDZYMHJ4VXBzVlpY?=
 =?utf-8?B?cmJkRkN2K1daRWI5a3lDblV1YjRjQjBROE50WkEvSlNXS280N2dKL0ZEM1lr?=
 =?utf-8?B?akVUNUtQTjFKVjVBcFRYVU1aVzVycmtzbmpQNDAxSnc0SUp5NnZ6cG9VNGUv?=
 =?utf-8?B?RndyVitRejhndlp5QWlDT0JBY3VNOC82dXpEbVlUUzZIc3pZUTM2aktRNjlZ?=
 =?utf-8?B?S0dNM1dtZW5OdmN5dUsyakozZjhzWmJiSjYxbG8vU2wwd1lTWkZHSkcxYWl1?=
 =?utf-8?B?R1dmUVppdmRvMTArcVlaUDQrVDRaTWdHa2xiUHMyMkxZLzBvU29GSDloOVRD?=
 =?utf-8?B?NUpBTXBlMVczbWdvdTVydEIrWVZqM2dReUk5ejFtVVRzK2FhdEJhdEFPMVli?=
 =?utf-8?B?WWcyaGxaSlBadnRiNXJVYlVYTFpoMXBkT2pzc2pRWlFmNzludTZESVc4U1Fx?=
 =?utf-8?B?T090SG1kdTBhUHBVR0p0bXRFWW5yRllIRnMrT2pJb0kyVTZ4VEs1V3lsV2w3?=
 =?utf-8?B?NGZHYUlqTW9yTXZRdGFPUXpERFhqQ2dLUWVkL1kvMkNkU0xiTXkwaXRLWWhB?=
 =?utf-8?B?eStLMWwzbk1BdVQ4OWFBK2hRSUNEVEErNGtKNTlyek1OOTJuMVZUc2JRUCtu?=
 =?utf-8?B?Q05HN2h0a2ZTZzdWano0eG1IUmp3bzBzWWFRVXZsYnh3VnM4OVFINzZVb3kw?=
 =?utf-8?B?ZjNPOTlqT0hqcldXSGswbStOZnJUUmRrQ3BGbEdYY3BkRTFEa0ZIRFp4S2lP?=
 =?utf-8?B?M2QyRldhTHJRWm03M1IyWmcyYml1YVhIU3BHb1EwL1JLOUZSRDliNUUxTjBJ?=
 =?utf-8?B?R3F2cm00QWFJWDJoK1AwbS9uWVFscENQZU04MGNLeEp2b09aWjkrbEl6RGhk?=
 =?utf-8?B?elM1bkFkcjc0L1BYaFZCMk9JVFRaelgxV0VlUzJWQUlNVmlzZ0JDNzhwTzMx?=
 =?utf-8?B?ZWJWL256M0h3Qk56OTNrNmxqcnFMbFQ0MjgyZXZVNU9jVW9kaDBrd012eWsy?=
 =?utf-8?B?dTVmVjJNZUpLd29YaytrWmNHbmxwaTlkSWVpRjZwYlBSQmlWeWJFdy8rbWFv?=
 =?utf-8?B?SHAyUTRNeHlCN3FmMkdZRHRKRjcwdHZOSEVTeU5MK0tDVU9OalEwNFlBaGxl?=
 =?utf-8?B?QzREK09FMTVRSmJyVmY5U1paUFlvZEdpQkVlUW9hMkhpQ2w3a3c4NTg5L1Vu?=
 =?utf-8?B?WWN2YlZBL3hNVENvYmJFek5nVnQwOThMb0twK2l3SEVLaVBnRXJNRHB5T01H?=
 =?utf-8?B?cEdzaGJsZVY3ak9STkE4T0tTUWRVb2Njd2MxUm4wWExBNGdWa3ZoaThRL3Rq?=
 =?utf-8?B?bWMxR0lJaXhmYmVFZ3ZRWVZGdW5JTUFwMFliN2tDMGM4UXRIeXRDVGxxM2pp?=
 =?utf-8?B?TXZtRDFZT3ZrL2pucnYxUGdZWFJBWit4citVUGUwbmgwOHkybE9tcjRSa0RC?=
 =?utf-8?B?M1lZTVlUV2RXY1p3aDNvUDIzK3E3R1BiUWlIMEtlcmpPR245d2dNWEZJRFBz?=
 =?utf-8?B?a09yR2tWUEd3MktnTTR3R09CR1FSOFRYa3FXVVlmbk11cjVYMkdFVG9HWU96?=
 =?utf-8?B?S1B1Rzh4MDMzbDlQUDR6VXNiM2lwR0liNTZ0RlpIbE0yOThseVI4N3pob0dT?=
 =?utf-8?B?VElmVHJoU2Zxc0pDb2UxbE9mQVRteVNWZUpmTzZWaVJwd2RZOXExNW5ERmxT?=
 =?utf-8?Q?l7p58C0B00YK1IcsZsaFxLHAm?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1864c02-3c3d-4818-6382-08daef660132
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 21:44:21.3704 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +OC86wLjEvJpzlhXkTsXC31jxLdxVymKl6+dXrvGUWB4sNjv/D53PrzxOpBNlXhsSeO5hpGnjLT0VbEnoKYt5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6674
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
Cc: Robin Chen <po-tchen@amd.com>, David Zhang <dingchen.zhang@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Anthony Koo <Anthony.Koo@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Alex Hung <alex.hung@amd.com>, Camille Cho <Camille.Cho@amd.com>,
 Shirish S <shirish.s@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Po Ting Chen <robin.chen@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Pavle Kotarac <Pavle.Kotarac@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/5/23 15:33, Hamza Mahfooz wrote:
> Currently, there are issues with enabling PSR-SU + DSC. This stems from
> the fact that DSC imposes a slice height on transmitted video data and
> we are not conforming to that slice height in PSR-SU regions. So, pass
> slice_height into su_y_granularity to feed the DSC slice height into
> PSR-SU code.
> 
> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>

Acked-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
> v2: move code to modules/power.
> v3: use ASSERT() instead of WARN() and add a condition that clarifies
>     that PSR-SU + DSC can only be enabled on an eDP connection.
> ---
>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c |  3 ++
>  .../amd/display/modules/power/power_helpers.c | 31 +++++++++++++++++++
>  .../amd/display/modules/power/power_helpers.h |  3 ++
>  3 files changed, 37 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c
> index 26291db0a3cf..872d06fe1436 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c
> @@ -122,6 +122,9 @@ bool amdgpu_dm_link_setup_psr(struct dc_stream_state *stream)
>  		psr_config.allow_multi_disp_optimizations =
>  			(amdgpu_dc_feature_mask & DC_PSR_ALLOW_MULTI_DISP_OPT);
>  
> +		if (!psr_su_set_y_granularity(dc, link, stream, &psr_config))
> +			return false;
> +
>  		ret = dc_link_setup_psr(link, stream, &psr_config, &psr_context);
>  
>  	}
> diff --git a/drivers/gpu/drm/amd/display/modules/power/power_helpers.c b/drivers/gpu/drm/amd/display/modules/power/power_helpers.c
> index 9b5d9b2c9a6a..381f708ef756 100644
> --- a/drivers/gpu/drm/amd/display/modules/power/power_helpers.c
> +++ b/drivers/gpu/drm/amd/display/modules/power/power_helpers.c
> @@ -916,3 +916,34 @@ bool mod_power_only_edp(const struct dc_state *context, const struct dc_stream_s
>  {
>  	return context && context->stream_count == 1 && dc_is_embedded_signal(stream->signal);
>  }
> +
> +bool psr_su_set_y_granularity(struct dc *dc, struct dc_link *link,
> +			      struct dc_stream_state *stream,
> +			      struct psr_config *config)
> +{
> +	uint16_t pic_height;
> +	uint8_t slice_height;
> +
> +	if (!dc->caps.edp_dsc_support ||
> +	    link->panel_config.dsc.disable_dsc_edp ||
> +	    !link->dpcd_caps.dsc_caps.dsc_basic_caps.fields.dsc_support.DSC_SUPPORT ||
> +	    !(link->connector_signal & SIGNAL_TYPE_EDP) ||
> +	    !stream->timing.dsc_cfg.num_slices_v)
> +		return true;
> +
> +	pic_height = stream->timing.v_addressable +
> +		stream->timing.v_border_top + stream->timing.v_border_bottom;
> +	slice_height = pic_height / stream->timing.dsc_cfg.num_slices_v;
> +
> +	if (slice_height) {
> +		if (config->su_y_granularity &&
> +		    (slice_height % config->su_y_granularity)) {
> +			ASSERT(0);
> +			return false;
> +		}
> +
> +		config->su_y_granularity = slice_height;
> +	}
> +
> +	return true;
> +}
> diff --git a/drivers/gpu/drm/amd/display/modules/power/power_helpers.h b/drivers/gpu/drm/amd/display/modules/power/power_helpers.h
> index 316452e9dbc9..bb16b37b83da 100644
> --- a/drivers/gpu/drm/amd/display/modules/power/power_helpers.h
> +++ b/drivers/gpu/drm/amd/display/modules/power/power_helpers.h
> @@ -59,4 +59,7 @@ void mod_power_calc_psr_configs(struct psr_config *psr_config,
>  		const struct dc_stream_state *stream);
>  bool mod_power_only_edp(const struct dc_state *context,
>  		const struct dc_stream_state *stream);
> +bool psr_su_set_y_granularity(struct dc *dc, struct dc_link *link,
> +			      struct dc_stream_state *stream,
> +			      struct psr_config *config);
>  #endif /* MODULES_POWER_POWER_HELPERS_H_ */

