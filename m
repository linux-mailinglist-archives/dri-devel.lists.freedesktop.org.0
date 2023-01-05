Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF1F65F3AE
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 19:29:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B65310E1B6;
	Thu,  5 Jan 2023 18:29:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2042.outbound.protection.outlook.com [40.107.92.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F92410E19A;
 Thu,  5 Jan 2023 18:29:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z351eYxPIvIUzoa1w5bBU44ZgD6plufKab/Ie+hv2BWe1HqNVZr7UgY7mjqCYdU+kyVYhqX9Hl6DGW1ypjqBcPm+z+H6ElAl/dWJDOMtvtqML54HNKw4AlUlh9xU3WIU9cFpKAOhdfVIqxULMoei5KlXdziRYmozO6H+4P5oF7up7ksd93QkBctlNLRfPLIDZKWNqYBoExlrFsLH2Rz1YK3EdnuZjHHUExD8zc7AzV3vBYztjNgpFproRItE1oFkzJmcolWcbcXBipqhI2gc8Bx+2UxgFzeg0MWFU0lnnJZwGMDlnVXcTM6Cz0c1DwaBEn/dpppOXTma8PvNJrKlng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GyhCRDSHuejSbcNchOFH0BUnJaSPQrVD1Q54Fro5kYI=;
 b=cBtna56Tb43J6Uypsdwo9NcpmXN0+CSetIDKFb0S1QRDSLrRHsmmru5ldD3EKnFyG2FA3oiwF0BdFtr4VbnGgyNXPSEBtc3GHFGjjm423WKW7fZVkP/WBouIFvNRs0F/PVqeIMrLhD99tAGQ2wSPH4FbES4mMkkw5Iup5s7HmB80nluZvtSqGFaggIcka/v4HtRiOObweeHjx+5pLBEBfu1WctFcYDNcSh4GUTkk3INiHkbhg1QzEH/GvobWDiYkBW5iCOcDH+HE6z/pxjl3uKtVyu+DHKmwckYztynPAcKtNnxsBnHgf6y9T30BPWKGHYdwhJ+iSv7Y+iVuRmrvJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GyhCRDSHuejSbcNchOFH0BUnJaSPQrVD1Q54Fro5kYI=;
 b=J46PF/LZA7flNEr5l0ZM5ejCBMcSAhKCT5OLYa/ZdczjpiIA2ob0WsqrhJSwp4Dedk2Ttu7gqn4NX/ilDQ4inJWhIKkZPQ+9AOlg9VvLcht9Vl+rQVsERPSLPLcliCVMduL1zQvQaWQN4E1VdptqXWpkDexPD2Il1p/GnxlSEds=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by PH0PR12MB7009.namprd12.prod.outlook.com (2603:10b6:510:21c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 18:29:24 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::152b:e615:3d60:2bf0]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::152b:e615:3d60:2bf0%4]) with mapi id 15.20.5944.019; Thu, 5 Jan 2023
 18:29:24 +0000
Message-ID: <161a2a64-6bdc-c896-1e3f-56da76f03b21@amd.com>
Date: Thu, 5 Jan 2023 13:29:18 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2] drm/amd/display: fix PSR-SU/DSC interoperability
 support
Content-Language: en-US
To: Hamza Mahfooz <hamza.mahfooz@amd.com>, amd-gfx@lists.freedesktop.org
References: <20230105173809.289367-1-hamza.mahfooz@amd.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20230105173809.289367-1-hamza.mahfooz@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT3PR01CA0023.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:86::28) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|PH0PR12MB7009:EE_
X-MS-Office365-Filtering-Correlation-Id: b88e54e1-7166-47c9-6d08-08daef4ac50f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DTb/EAqJriJwHiVER0lnMYZ29EXalFhyz3FXlDwNpS3LQJTD2OhzLOmmnnDkiatwwzgq5HRUdIObU/gW++T+1I3PNALZ016mJGFt4UrTeFuwmdmiyXU46hIEBfsr9niYZ2/OtLXipbl+Kins12jXk4jQaTOQABTpVEpah4O70h7Tb6MAy8O8Hr886b6bIadk4mH9iejHPuSoX4JqPMpejoiaihAMwL01+zLjXMDG+x/p8tckOYPZYuIUUQBpMMoufRwmiLcko1RWaLrbiJQWY2q0BInzcjrkHSi/ciR5UTeCXA3KyoKn+SpX7f48opXu6PC/YTCjGkgBDFzn1nFjMAtFl8/VXusG4HUME/UUxBdFNlK6NN6gvXzQ5QK+/0nKzbMA1AveRjzaBvzuWL2NU/7Qy6Hb/xp9DhJ8iLTnHZdK7hNdpFfQjPU1ao01fShbCWsM4F8vhyTDkV5RA/6dI+vK+peCnqA/HPaz1kXMa0c+R/LE/mNeqPe5SQGX3Nl91HsMS5NvkLSJbccSWuQOr2MVKGlzxPPotvyapdXI9NTbDuGB/uVHN+MFulgluPvbK16kWS7RQmIuvyAATCEJSKWb3t6T5G2e2ergFJt5lpZFwV68NMoZORSgT269gyOQpjzG5GmokslTdfTP98QvUDtGVU2xO7h61oEBtbbrR3OceAF0JphSzQwbSwl6wSPbxlFLqEJfdxJoV7DXgIj2xwbeIKB/kcMgL7fqk/pclP4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(396003)(136003)(39860400002)(376002)(366004)(451199015)(38100700002)(31696002)(8676002)(66946007)(41300700001)(66556008)(4326008)(54906003)(66476007)(316002)(6506007)(8936002)(2616005)(2906002)(44832011)(5660300002)(83380400001)(478600001)(6512007)(53546011)(6486002)(186003)(86362001)(26005)(6666004)(31686004)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QTNUODdXdGNQMWl1N1kxc3JyaXBEYTJOWW9VU2xoSnBQS2VZRDJ1RStxaHBT?=
 =?utf-8?B?UDVxWjk2RFE4bVA1WUlxS1BDYzdOOUFMdGcwTHNZakpTaE4wSk9HMnVmMEVJ?=
 =?utf-8?B?b1pxUGxLWXY0SG50OEwvb0dSU3NGR0k5Rkk5TG95SGJpaFRGc051L3R3ekpZ?=
 =?utf-8?B?VVV0VVhob2tnNkhFYWl4SURuUlBnM1p0eUVDdWlVMXhxYVFrbEQxand5bGY4?=
 =?utf-8?B?L0Z0YUl1UjJ2cFlRMnVTTUhnVHltc1JiaEQ0UnFzSmI1Z1BweFAzVVVZTkxa?=
 =?utf-8?B?WjdJMjlwK25vYU4xcW9KYy81a216YkMzS2FFR283VElnOGJRNUFwZVJidGM1?=
 =?utf-8?B?NUdJMUkrS3VyZEo3MDdMSWNHdGREV0ZOZHgzKzI5ZmhPVjBJUWNsWDJuU2lD?=
 =?utf-8?B?RUtLUnl1a3ExR0s2eE1RMFlqQzVMZGtYbnloVnZGWGcwMFRFN0hiOU9IVFlr?=
 =?utf-8?B?dHdYQkxlWFZiWFZnYi9YZ1hka0Q3SUFoanFETlRzb3IzWGk5VmlIQVF4U3hI?=
 =?utf-8?B?c3o0cUdNbkJtRzJLamZBRFo1NlYrNTA3aEdmS0k0c01LaVlMVlRjcGZOZUVI?=
 =?utf-8?B?ZTVMamFpMDNVM3JMVGxnRFhJVnRBVXozc3JaYmljM001K0ZoRmVSbzFJUXk1?=
 =?utf-8?B?bDVMVERJekszWkEvNVpzUm5aV0E3cEFRbDdKSFRaTUVaUEYwc2ZPWUorcVhL?=
 =?utf-8?B?S0g3WXhSUjVSVENNbi9uekhjRlJ2SldheFJCdmdONGd5VVBDSzlPQ2xObEM3?=
 =?utf-8?B?amlQd0gxSTliN0tJeVNtR3pXdlhKZzdZTVBNWWN0N2JqU2kzcFVaT29GanJr?=
 =?utf-8?B?S0xYODNSYjkzUXY1RmNBalYyMzA0K25DcWM2VitxVXdMbHgrL0R6S3pkQW1r?=
 =?utf-8?B?TXI5VFY5U2FESnZJZFRiOUNXRjlPY2QwV3Q1UUZOU1VndDY1VmYxNVVzby9h?=
 =?utf-8?B?RXBGTXg0dFdqQWI2a2M5VENHVEYyTlBwc0g3TENPeWtiQlJHdHprRXUyZFlz?=
 =?utf-8?B?OGE5YkltYWcvL0J6bUlnNU14Y01vQzRRZnJxQkhKSEs2K2NkaG5wZzNIRGxa?=
 =?utf-8?B?T3lVelh3aERacGp5VVkzeGNybjFBcSs3SjNHRFhXZ1JjeGNXVFJTRGhjSUVV?=
 =?utf-8?B?aFpreTN4YjNaOXJzY2dMZWNvTjQ3SFdZb2RtRkZueHRjSmlmaTVPN1lwWEJw?=
 =?utf-8?B?VlhncDdZT1NOUEFWa1hlaXJ6ZVU5YjlSZnNPSFhVb21RZ0tZTGVxRkxudlEx?=
 =?utf-8?B?a2xsQUh4U3VVUXg4WXZYUFRoRENGcHpnM1NLUDRVZTR5dnFkQWM0Tm9qSFJm?=
 =?utf-8?B?ckEvbVFDbFc2UDVpbis1N09NdDVBaUlzdm9rNXFDSUJWSXhPOHpjM2NrUGhQ?=
 =?utf-8?B?ZVRVcVR1bml3ZXp2R0I2dmhVOEsrOG9EZDUyQ2N5VnpTbEpYcUVkU0dxWjBa?=
 =?utf-8?B?ZXJ1RWc0VDJGTk5HVG5TTExGei9iVFpKcmZGdmk3Qk90cUNpdXc4TkJpTlh6?=
 =?utf-8?B?ZjBnMk1CTU5mM2tzbHFsTHV0Ry9uc2lvMi8zeWFBbEx2ZlQ4WThyMVNyRGFn?=
 =?utf-8?B?VXd6ZmVHdmlPYytna3R1YWFObHFpL2I3bTFyNmJqc29pakhFcm53Z0J1dFpn?=
 =?utf-8?B?cldEUHMxb1lQUUl2VG1zc2d2QjU0cEVhUmhQQWdlMm8vOXZpTmprS0hBK2Zx?=
 =?utf-8?B?SWxLUGNoOXpPWVVYemxFbUt2ditONVk0eG43Q1pZcGJWVFNleFp6OGRSTmFK?=
 =?utf-8?B?OWZDYWpneG4wQU04UmdIWmt5a2MxOTZKMkZ1cHEvVFN2ZlExMVk3Y0E3RDFj?=
 =?utf-8?B?VGt1S2UxN1U0Z1ZLcUVRSGhsZFNneXQyZzBYVGZNSHNhdEk4ZFpFM2xGL29m?=
 =?utf-8?B?ajRZUXVaZ09DRDJtVjIwcjVZMnpUVUxSVTRncU04OGhBQWcrMXUrMEt1eHhp?=
 =?utf-8?B?cnN3dHV0Q0tJWWxFUnFpMW5QMEk5LzZlazFYcll2WlJESUY1bFA0bENhU3Zn?=
 =?utf-8?B?eTFselU4TWNGQjh0Q0pjdUMrNERsYmpNRVI5eGFhalc3Q2hKM0gxdy80UmQ1?=
 =?utf-8?B?bHB4TjlEZXYrS01IZkYzc0p5T0ZNQ1ZxbEVEUit1MlBuNzZ6NG5YbDJobm1u?=
 =?utf-8?Q?e4hBWk/QjLibEzKLYGxVTKGDp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b88e54e1-7166-47c9-6d08-08daef4ac50f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 18:29:24.0961 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AgrFMHNr20uGemOehu4hnD2JfJnpYhJ+JI28/o9lusDGAOL6C7f3xjSZ/ZCJI8dnd/wmvhoJWz9iHBXQsazenA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7009
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
 David Zhang <dingchen.zhang@amd.com>, Leo Li <sunpeng.li@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Alex Hung <alex.hung@amd.com>, Camille Cho <Camille.Cho@amd.com>,
 Shirish S <shirish.s@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Po Ting Chen <robin.chen@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Tom Chung <chiahsuan.chung@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/5/23 12:38, Hamza Mahfooz wrote:
> Currently, there are issues with enabling PSR-SU + DSC. This stems from
> the fact that DSC imposes a slice height on transmitted video data and
> we are not conforming to that slice height in PSR-SU regions. So, pass
> slice_height into su_y_granularity to feed the DSC slice height into
> PSR-SU code.
> 
> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
> ---
> v2: move code to modules/power.
> ---
>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c |  3 ++
>  .../amd/display/modules/power/power_helpers.c | 35 +++++++++++++++++++
>  .../amd/display/modules/power/power_helpers.h |  3 ++
>  3 files changed, 41 insertions(+)
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
> index 9b5d9b2c9a6a..4d27ad9f7370 100644
> --- a/drivers/gpu/drm/amd/display/modules/power/power_helpers.c
> +++ b/drivers/gpu/drm/amd/display/modules/power/power_helpers.c
> @@ -916,3 +916,38 @@ bool mod_power_only_edp(const struct dc_state *context, const struct dc_stream_s
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
> +	    !stream->timing.dsc_cfg.num_slices_v)

I'm not sure this condition is correct. We can have DSC but not eDP DSC
support.

> +		return true;
> +
> +	pic_height = stream->timing.v_addressable +
> +		stream->timing.v_border_top + stream->timing.v_border_bottom;
> +	slice_height = pic_height / stream->timing.dsc_cfg.num_slices_v;
> +
> +	if (slice_height) {
> +		if (config->su_y_granularity &&
> +		    (slice_height % config->su_y_granularity)) {
> +			WARN(1,

We don't use WARN in display/dc or display/modules. DC_LOG_WARNING
might be better, or log it in the caller.

Harry

> +			     "%s: dsc: %d, slice_height: %d, num_slices_v: %d\n",
> +			     __func__,
> +			     stream->sink->dsc_caps.dsc_dec_caps.is_dsc_supported,
> +			     slice_height,
> +			     stream->timing.dsc_cfg.num_slices_v);
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

