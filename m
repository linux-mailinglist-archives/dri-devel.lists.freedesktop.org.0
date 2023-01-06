Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B106602BE
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jan 2023 16:06:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAAFC10E2B5;
	Fri,  6 Jan 2023 15:06:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2057.outbound.protection.outlook.com [40.107.243.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01FC510E2B5;
 Fri,  6 Jan 2023 15:06:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XUK4B98HoDpeCmkriucxIfYXMLRUIOBF6bwzfZRaoSuCcTL8iIHAE5UBwMe4hJN1Kx8cBBqvXwWEStgvVyPWRX9ekaB/ngLg7UiAI8Zvi6AEFgnL5uBeu7Pj0MJMNSEgTfuvVGHnCrHGz4AmNjk5shb33zCfWT/r7oB8E4633mO5GO3OIbEc0v1gijH0GJpO9jsGKFUSvNYdenAcsdaIghOn/0aGWu3slYGOUpED29jTe72o8TVRdMMnDmdjbHP2kUwiV+k38VckAhTWgFUAvW0KLIjrpnA7S7FMSVh89V2Ii6VdhhHYdCJyKzeBtx00bJsYzgAcbenIUZdefZpYYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T975hn7cuHb3gzRMRuFhGIX5Aal29EIOSs7z1ceXR4E=;
 b=ngaUaOJUU31r2//4opfu4P/uEVFQxToL4uMsWgslFCIBBNgXPPEYud1oAJ9cq/SDdHqm6oIy9eJUUUl7iAm5KtwmwhR5nTHyHW2+o2kjE2cz+4gPL8W3xv6F6yKw+q1D++N6v2yhZvt8l1pZm5fKiBdcItyTrWVSzO4Y9RMc1ZQTQIfkUAFjMqzdcAMMxtDh+NhxgZ+xweQ05GLsUTBWeekjWvGAh4eonIUB1WcSopLPegVFN5Hw4iheJulW1offg4bNNlJIsHB3Ymj8n656jXDbVQxQAW+3GXBzUigZhMyM5d8ioMiXThEE0JVxt1E5LVHdDacdwVBt14RcVPWZlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T975hn7cuHb3gzRMRuFhGIX5Aal29EIOSs7z1ceXR4E=;
 b=jNjO4uXahUgEBytJIVQuzCfCra5Kq1Kc5uD69X+HFaomqu9qfbDDcyZWGH/qu4JWDYQhwUjzj8j+fCCS6iDpqxSsR248jRpwNFfX14B3xo3S2/u1MHXuWg9YIoJT4mN+O7qhFFHA68EmXMVX2QIqlRU9tWRPW/ouwxDXSP2LmJE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by BL1PR12MB5994.namprd12.prod.outlook.com (2603:10b6:208:39a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Fri, 6 Jan
 2023 15:06:23 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::152b:e615:3d60:2bf0]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::152b:e615:3d60:2bf0%4]) with mapi id 15.20.5944.019; Fri, 6 Jan 2023
 15:06:23 +0000
Message-ID: <35692927-8c48-20d2-589d-2fbff75c9e51@amd.com>
Date: Fri, 6 Jan 2023 10:06:18 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4] drm/amd/display: fix PSR-SU/DSC interoperability
 support
Content-Language: en-US
To: Hamza Mahfooz <hamza.mahfooz@amd.com>, amd-gfx@lists.freedesktop.org
References: <20230105222345.451217-1-hamza.mahfooz@amd.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20230105222345.451217-1-hamza.mahfooz@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT3PR01CA0092.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:85::8) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|BL1PR12MB5994:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ea5a649-9eb3-4b44-95ea-08daeff7931a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zpKjxM4to4J4dDkoAiRV0k3BvBFDtFMx3VJaDWmYCCHbfcKmwY6pO0W+eO5PJjN61RnHUZ6vagqMlxVsM7Pno/0aY64lU3Su/LvWPrdS+b03dbYznN6IF2rictPArZwBQikXa+pqTdZCCPuN+RoYaUJeCpoO+oJn75H3pYXkdlyzHvHkeCyyDdcLP4vDA0A67lQHs0NR01TnbeOokZRAZ+22799pD7QGgwaOYMf62DVayxDqNuhte3v2rk12QEAVlqSyoIADuctIYqAJL/+3logY+G3snJFQ/FQLKyCDyFF8jK+7LvVOIhAL3nqbMlL4xauc/1G+PyGtxuIRdRW+UZyqJsK6ye8+ifqI5DMRrrvOVGcWcJhalE04X3JKL2tAiP4voeX9JY/WUzRAezTojujQYhM2slGnw8hRdQnSCwqfaPS1HQ80lozniGLFlidTMQ0Gg5sk59u5WOybC20eK9crZrs81ZWHQBisio8gc/3sMzk4etPScNDWIrVOGT9x+TN1FK3DHFvobkg+5VtpFsSpoAbpzNZMwZbwyE6yZNCMVqpb7FGKmo7cGTLWNCewbztDQ2p47MQq6TnxNPTt3kXP8fmzQyZttc52nlWzUzJ/UuJRSYPabmEHsY0QkisNUCq0TDNrdGBlrXFoc2rXqYQyfM7DIagR0dbY47AV3EJcQwuXnOLgdpwjACDA/Z2W9l2cqvWMiKDl62cnvAdGfB942xGaVR+fbiUixDNWqLQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(396003)(136003)(39860400002)(346002)(376002)(451199015)(5660300002)(4326008)(66476007)(44832011)(8676002)(31686004)(2906002)(41300700001)(8936002)(66946007)(66556008)(54906003)(316002)(6486002)(478600001)(6512007)(6506007)(186003)(2616005)(6666004)(83380400001)(26005)(53546011)(38100700002)(86362001)(31696002)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WDFmdlhtRktGVmExTG0wWmhvYTI3T1hDcWNkRVJ5OEJ4U3FPamdoVExtWEwv?=
 =?utf-8?B?R01vSDkxc1pZK0JTMFBnY256N1o4eVp5YlF1Z0VzSDE4SmROMnI4YWd1Wnpl?=
 =?utf-8?B?RlZvS1U5MWJVcTB6SDJseFgzMmdPS0RIdERqN0VaZTFaTjhLTFpBcFZnTFlh?=
 =?utf-8?B?NmZIbTNVcDVQQW1jQUIwOGpiWjI3bnFmdXkvQ2ZrTk1TV0kyYW1EV0hFZGo1?=
 =?utf-8?B?dEdaZ1hRa2w0K3laakNwMnRvV3BKZ1lzQXhDT0lQOUhReFdsdjh1ekRRck5K?=
 =?utf-8?B?cmRVSnlVandOeExhRVF3bml4WUFnV3YzT1BuQTBUYlFCMStyMlNCSU0zY2w2?=
 =?utf-8?B?UGt4N3pkVGFTOFloRWZSMHl2UmVvejdwLy9JeUlmbDFWMDgwR2FvNGpSYVdm?=
 =?utf-8?B?Ny9Tbk96OHZRclJOYUdVRzVReklpUEVPY1QzTll4SkphT3VFdVZucEF1Q3ZR?=
 =?utf-8?B?Y2M1aDBYSHFNaURCSmxBaHFkMXB6OHU2SmJpYW1pMnFvQk9Za0wxOEFhYXRM?=
 =?utf-8?B?VFJHR3VoeDhIdXZYaFBCVytGZzJmMU8zdmxzMXRzWVUyazAwZ045blBSNEl3?=
 =?utf-8?B?UGlibThQYmJZclR2Q0p5MVBQclJFbHRhNkNrSlZGa2V6cmU3WUxyY2NMOE5L?=
 =?utf-8?B?TGxCdXVtV1gwOEtjUEFnVUlIMHB6NzB2aUkvNFJTdGkzbTRlMHlFVWd6c0FB?=
 =?utf-8?B?RmxncUpXcnkrOFVIV2doRjVUaFRKbW8zZUFCU05SNUx4ak5STTROcm5haDUy?=
 =?utf-8?B?MVNMaDU1blcyQkVjMHduQWszTjJQUVhBSC9MZlJEbU5DdmdRb0w0ZjJIQkNq?=
 =?utf-8?B?OTdnVG1HWFlURndsdWdCOHh2cFZCZ1JZNXV0U0lvVnV4Rnc4U1BiUzN5VU1G?=
 =?utf-8?B?eW9EdUJVVWFxYzM1RGhNcnpyNFk0R1RJNWhlWm5uTUVUZnl2TXZzZEVrZTQw?=
 =?utf-8?B?dzR3c1g0UDNFMVZmVm1XMjQ1Q092MTdldlZhajRWb3g5NmUya3RqVTVoRkJu?=
 =?utf-8?B?eW52eUE2TTMwTG5pbjVvNjVGMy9GVUtwVWZBc3FQSW9NaVN3VHUxM2N2THl0?=
 =?utf-8?B?WW5WYkxYaWlHQndML2RWRFkzdnVXK0hpMkR3RGVuQ1RyQU5HL29iUU1SYTk0?=
 =?utf-8?B?T1Z0NzF4cDB1cXBaSGxZR0tockE5OUp5alg5QzYwblJNS0poeExwNTVPMXNG?=
 =?utf-8?B?ZEowMW5FS2VxdkNaTDZmazBRcGtUakI4dEFVQkU4L1ArM090VXZ1VDdZRHpr?=
 =?utf-8?B?VzRLQTF6K3h5M0dIZGdhdC9BbStuRmlxSWFobDhzbEQvTzIvczZtUHJsRWh6?=
 =?utf-8?B?U3NEN3UxaEtkMm8xZmFxeFpoRTd5cUVPQmRrQ2VCdS9mK1pRRHpYK3RtNTFV?=
 =?utf-8?B?ZGh1ZVgva1hDNGtPUWR2dXhjZWQ0T2RHMHFTSFdWRUlmbXlPVlRrR09yVHNV?=
 =?utf-8?B?K0Z2OUlUYktxNHdMMDEzQ3RIZnRUMVpmdjRScjJjS2dpQS8vOFVDUEltWXBU?=
 =?utf-8?B?TXFvL2M0OTJmdXhXeSsrUTQ2M3FyV1BOZHFCb3FqUWZVcVlVbVpxdG1MeCsz?=
 =?utf-8?B?QlVBZ3lKQjFmczMwVkJkVWJGMW05Um5xUVh0QmJZZ1V6Ni9aUDI3aFdySDVJ?=
 =?utf-8?B?eUpEU1JDdHhDeUp0L3pNQTZrSFYvakdORjVlbExIN2laM2F0NUJUSmdrczdC?=
 =?utf-8?B?dk1hNVlsRHhuZXVBNDBRczVMeG9pd3ZPeDA3Wjg5TUpqd1g4Z0ZQUkpJWU5z?=
 =?utf-8?B?WVBBd3pHMnZRZVdaRFdIcklWUXZPZEp1MzFBVW8rbUlnNmZad1NoVlBCdXUv?=
 =?utf-8?B?NEFFUWNRODNSRlNoM2s0azlsNmhZWW1HMlhXcTlaVGNqNHlic3hZL3BVaS8z?=
 =?utf-8?B?a2t6cHpoR3Jyb0xTVUdhTE1Pd1Z1bjVBeVpHdUlsQlpCNnJqVWZQS0tnZUFz?=
 =?utf-8?B?S0RPVlp3TjQ1OHhVbUZLbmRNRWIweTRiTTY2NHlZak1wYmFpWXJHUEtmYU5x?=
 =?utf-8?B?cnBYWVZOMHd6U3VYZkVMK0Q5S2FCNTlOVnRRdkh1SGxCaTArVHNSZUN6WXNr?=
 =?utf-8?B?SkllYlgyTUhoTldpZS8wYnJ5alc2Z2RzNVM1TW1yU243TGJ4NzhoTSs2eGla?=
 =?utf-8?Q?6xN0AfOqZdbOAVlnmJ+Icezwc?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ea5a649-9eb3-4b44-95ea-08daeff7931a
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2023 15:06:23.2643 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OQZRjRqVvg6xhE+79hwkBWj+vNgWEnyW0ex81AoTt8zkQ8Rj/GzwZZ35D76u81EU+rnYlKGT/vwP1Iv8yjoQGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5994
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
Cc: Brian Chang <Brian.Chang@amd.com>, Robin Chen <po-tchen@amd.com>,
 David Zhang <dingchen.zhang@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Anthony Koo <Anthony.Koo@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Shirish S <shirish.s@amd.com>, Alex Hung <alex.hung@amd.com>,
 Camille Cho <Camille.Cho@amd.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Po Ting Chen <robin.chen@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Tom Chung <chiahsuan.chung@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/5/23 17:23, Hamza Mahfooz wrote:
> Currently, there are issues with enabling PSR-SU + DSC. This stems from
> the fact that DSC imposes a slice height on transmitted video data and
> we are not conforming to that slice height in PSR-SU regions. So, pass
> slice_height into su_y_granularity to feed the DSC slice height into
> PSR-SU code.
> 
> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>

Acked-by: Harry Wentland <harry.wentland@amd.com>

Would be good if you can get Leo's review.

Harry

> ---
> v2: move code to modules/power.
> v3: use ASSERT() instead of WARN() and add a condition that clarifies
>     that PSR-SU + DSC can only be enabled on an eDP connection.
> v4: change the logic again to allow non-eDP links to pass the first
>     filter in psr_su_set_y_granularity() (this allows us to maintain
>     the v1/v2 behaviour, while still being clear as to the fact that we
>     only care about eDP connections).
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
> index 9b5d9b2c9a6a..cf4fa87c7db6 100644
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
> +	if ((link->connector_signal & SIGNAL_TYPE_EDP) &&
> +	    (!dc->caps.edp_dsc_support ||
> +	    link->panel_config.dsc.disable_dsc_edp ||
> +	    !link->dpcd_caps.dsc_caps.dsc_basic_caps.fields.dsc_support.DSC_SUPPORT ||
> +	    !stream->timing.dsc_cfg.num_slices_v))
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

