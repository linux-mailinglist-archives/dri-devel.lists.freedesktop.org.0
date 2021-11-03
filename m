Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B017444458
	for <lists+dri-devel@lfdr.de>; Wed,  3 Nov 2021 16:10:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BA31735CC;
	Wed,  3 Nov 2021 15:10:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2070.outbound.protection.outlook.com [40.107.237.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E600735CC;
 Wed,  3 Nov 2021 15:10:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ir5JGiNdffLqy1TRe9ahwbjd07yrvJ9SnQbsFS6shnd0ZCHfUUFNpLhEGmJqCYsDktkJZ+Fw2UUM4P2pnRpYi5kWPeIxmEHc9IMIF7/1fq4wmP7R1vrO05OuG2wvRzJDCrsneO9hyw6TdnKxpqxCB4KUQE0ZLIrP/ZCx5UwWy/cpStmmNeckEv6zOz4KEOLmmop+uN3J1TNKjVbgYY2Lz3eYimClC1kojO9utfiW+Ryr4BBCMJ3og/6Qoar8pmdaaqeEonOKARotilTRZq/Tl0R50xeRQ9VYjrTg+YCZw90gK443AXQvdvhV+V4C8g5OuiNHmoABNDglzoq26po0Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eqfiSIglLUl5RPBC3ZM4pgqMPwhKKIUkTZI+P57e0Qc=;
 b=PVa6V+SSRXZ490+R+aim5xpcs+jLFO4lj1KnjNtUnYgC2XgE1sDd3+ryJqQZWm0eQBV1JfSZzM5KzGwegfd+agj+Vqs1pSa0YGl35746AYiwX2oviN4wfVMiHN/D4/ujhFfZrQcbKdhyp9MTuNgvmEtCjic8pRbPnHuzqgvkcU8gMu+nGylVBUlCNjowmgOntCACdIhSJpZfPVrUlJXy/vjE6oLyHlFwD0PAgZ9nPDfFaQeakJ/q/nXXW6L2SxcIcxZshwT64MSlo45rM9eLVN+lm09dIiX1XdaCGAD3+V6EkKO22gBtRuwng/2kGojXc5MusS7lvhAsbCYTYHlXJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eqfiSIglLUl5RPBC3ZM4pgqMPwhKKIUkTZI+P57e0Qc=;
 b=R88EeFCwJ4aq72Tw5HiwkgRRWB/lGidFfauoFh5BQpsDyGJZFZgTTR8dZSvP4ZJtZjW0+KywlcX5AWAXtxxBafHY7WTwUx592L39pFxuADzg1xDt8T3pM7WlOibNhHzNWJLkiTkERmfY0RHw0mzl2+yzTtcBX+Xk1lpoluzKo/A=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CO6PR12MB5411.namprd12.prod.outlook.com (2603:10b6:5:356::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Wed, 3 Nov
 2021 15:10:42 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::d095:131a:b99a:9975]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::d095:131a:b99a:9975%3]) with mapi id 15.20.4649.019; Wed, 3 Nov 2021
 15:10:42 +0000
Message-ID: <bc7e37d4-e8be-73ce-5478-02a0d5474a15@amd.com>
Date: Wed, 3 Nov 2021 11:10:37 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [RFC v2 05/22] drm/i915/xelpd: Define Degamma Lut range struct
 for HDR planes
Content-Language: en-US
To: Uma Shankar <uma.shankar@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20210906213904.27918-1-uma.shankar@intel.com>
 <20210906213904.27918-6-uma.shankar@intel.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20210906213904.27918-6-uma.shankar@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0252.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:66::11) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
Received: from [192.168.50.4] (198.200.67.104) by
 YQBPR0101CA0252.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:66::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11 via Frontend
 Transport; Wed, 3 Nov 2021 15:10:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2956fa7e-fdce-4eb4-93de-08d99edc1a11
X-MS-TrafficTypeDiagnostic: CO6PR12MB5411:
X-Microsoft-Antispam-PRVS: <CO6PR12MB541149DE86CED0DB0461A0738C8C9@CO6PR12MB5411.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2rFREuadXwQtf4h6ty/jT/FEz+Ou9Tax3JSMWbl/hT5VQcOc/+icunNsq6ec4/usqyk4RABPixvOWoUHz1BkevCq65ShhtU9cWrCVtSGr8K3b6T4a8wydMQOb90sZ4dTQT9dKcsQ+I2qgcukHnDzfyGu68v39F9Wj/KTS4AKfKrGPb38ZTSV2P6mR/88VYnvXd6frg/aU+sBeAF+xIWzzDXRakHK0SORioS0HZ/tbQB9XYo03vcO0y/GjVMLa1RMn1S9mTkIQNsK8Jps2xqiIhXGZRdK3+Ras2DMYz901qJbZF9UQNhSxo3um89wFTT/JpDLhF2Zi0IrCYLbQo4CW/kLeyV1pCqSX8kRwH92iDLP8PeCcx5V68vVA9LDXNJ/xmSIz54LKj3ji82vlkPkfQYG6HuBO76UEJWcToDyc+nX1CiElxs+I9PNbHJFOdPOjSQwpTn6eUWcncNEFKVRJcznPGHVmAn4J4Xyz0i8/7T2NUFo0VunOn29bSRqqG8vSsqFNgfHs6e+joXfN8QDPENhwuCHWcgMrLLOWOTvAqM7mvtrghg1yhe3YSFRvG/R4QBb9pl+qcaV1jpMFQtt5UvlY2XFOHiHKE1KTfcfawOyhjqzniZa45molymKVBQzdKI69i175wo/gT/9eS0gkasc0lOBWnXS5nKMu355mWRQx3LPCeezhuZkwv/IJuUkx+nR2R3JcLHeEA1mPqepGQP9SmDn1nLNN7+5J+oYCD9MrU5qSXmdUogy2KGmOk5r
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2906002)(8936002)(8676002)(53546011)(508600001)(86362001)(44832011)(6486002)(16576012)(5660300002)(26005)(4326008)(36756003)(2616005)(66556008)(6666004)(38100700002)(186003)(31686004)(31696002)(956004)(66476007)(316002)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?akVycmlFajM0QTdEakNmWmVSTjQvUDZSbXhtZkh6WUhiS0dNSTllMXd3QVRB?=
 =?utf-8?B?OUhWUkFNNzVJTEZ3Y2V3VkF0a25tK3NjUlZxdDBlR0s2QnZTOUJHWU1OZEVi?=
 =?utf-8?B?MmFlWFBOOHptTlgzeXdLVXMwYkdRUDdWZ1VDUHVjMVhyVzRhTkZZQjVOeHl0?=
 =?utf-8?B?WEdoaEJjUkVDeWlHcWxOOEhCbk8zcHZnSlp3Wk5XdDlmVk1pTmR1ZjRwRFRx?=
 =?utf-8?B?VUI3T2ZIU3hEN0xxTU83YjY0NFVkdlU2SFlnclZ0UTNYM05vbks1MndsSEh3?=
 =?utf-8?B?dGZaMHVGMCtvR2pIY1NZUGRZb3ZNUEpEazNHVXZxVVlidUYva05HUXo3TWRW?=
 =?utf-8?B?V2xaS2s2K2RpRk5BKzkrV09Nb1dHb3JwVUlodHhWMjIvLzc2U1IzaHNzUjBQ?=
 =?utf-8?B?b3hNRHRHVEFWVm5GanZJb056N0lUSS9DY01UYk1SUUlhaG16TXpXTDBLMC9V?=
 =?utf-8?B?SXJnbUFaczdIY3pVeGgrWFcxTFdQMGFvWFVLN1h1WkdDSzV0L3NFZU5sOGJx?=
 =?utf-8?B?THAxN3NGQXM4ZlB1VXNUV1UzN2FxRit5d3lWUXU5NDhTcXo3blpialhwTHZu?=
 =?utf-8?B?NjhHYlZtQ1M3SXN5UHJ4cjdYWUxPS3ZoTWJkaGMxVTk3Y1hyUW9ESnJ6NE5Z?=
 =?utf-8?B?QW9FSEhieHlKckptZkFLcGhaSUdQN1FtTXFxYlJqOXlZQnk0RHVOajBYdHhP?=
 =?utf-8?B?bWRtL044dDF6TzByVWRPOXlRQjRSMUJhdXZnY1V0dHVzQjlkbWE2d0o5aTRu?=
 =?utf-8?B?U25zMFJBMjhTclZoeDBRbnVmSFZJRVJZU1FLeXc5OXozR1g2dmw4SUdNakla?=
 =?utf-8?B?VEcxTytCcHJvYjlQa08zeDZGMUtJYnVIRnVuRnJtaUsrV3FkbEhKUjlXUG5B?=
 =?utf-8?B?NU5IVWNtR3pKUWJiWFRQTVVCeVc4ZUQ4eE9IWmpuWUtpNnM3bVNCRDEvUFE2?=
 =?utf-8?B?QU0veXVlM1pDWkprdjZONFloS1ZsQkNIaFNxMGVyUzlicUJWL05UWGVabEFv?=
 =?utf-8?B?a0VQWk1ZL2xacWNFem9JQnQ4cTFUeDNGNXVvQUI5aU92SGk4M0kvdThPcEEv?=
 =?utf-8?B?OWUxeXhuM3IrMkxYOXFwWW9FcDhOcXVpcUgxakUwS2tuTkVYVURwY1M4QlNi?=
 =?utf-8?B?amVnd1JTRkZueHJ2WU13cTRlYkhhSURLTGgrMkFjOW9FQm9SZjhDUVpxSXB5?=
 =?utf-8?B?NXVXVm80SEI4V2h6RDBTcUNIUXp5Sm5OZnZVeENtNGtEdVlVRS85SS85YTdo?=
 =?utf-8?B?WW5LT2dRNDVmNjUwTDNmRTlZU0w3cUkvb1ZLWjJXTDhsM1M1OUpPZG5UaEsx?=
 =?utf-8?B?eHZCd00yQlZpaW5mVWFaNTF5UWNLUzJJcWJZN1pzVzB6ajF1YVBOWlYycWd6?=
 =?utf-8?B?Uk5CN3EzS29ZSEkyc1BPUFlQQTlGL0h5Qkd6ZnpiK1BMZEZpOXhyWERTakM1?=
 =?utf-8?B?SkMyNHhJL0ZLd2RZNWs1aDZoMEloNDcyRG1GZVVLblZKVVRNWlpjZHdGcWRv?=
 =?utf-8?B?K00vZHV6RzFmVFBROTNBQjVYM2hwcWNacHpLOEVJK29nZHRiTUVUSEhVTE5I?=
 =?utf-8?B?K1JQRHJBTWlDQWlOR2R4NzVaNE5xcytzQ1R5YWlWTjJtZlc4bHlLSTIvL0sy?=
 =?utf-8?B?M3hROVUrNy9DZVFJVUFQQ1UyMExPajh3ZWVWd0NkZmpaS1YrV0FzL3liTWNK?=
 =?utf-8?B?Q05ra29OaEVSUkNFWVptYmZTQTBIanBSV25UTVdrQ3FCb0tQUlJTVTk2b29p?=
 =?utf-8?B?eHdYOWd2RWpQdTM1T3lnK3ZsSkQ4VDc0TGFEdlhxRXloc0E5aTYvWEo0RXFy?=
 =?utf-8?B?eE1YLzZYYjFuMnRqcC8zVkdqcHo2ZTNLcEQ4NEZMSzdOMGdYTnp4aHIrdFBi?=
 =?utf-8?B?UUd3WVU3VUJjay8wb3NWOG91ODhIektPeFZRUElvRGk0czAzdDFHSk9xakFR?=
 =?utf-8?B?eVdzY0czTVR1MWJhcHR0ekRmaGVoRDJiS25waUphakcvVkRBTHVoYkRXSkJr?=
 =?utf-8?B?cDRGYitkdzZVd29wRS9NQXlZRWtXbmx1RVlKL1RMaXFUVFhSY1hDeHZJOVhX?=
 =?utf-8?B?OUpiMlM4aEdUKzErSUNtWUgxS1hFV1paaS9ScEZXVWZKRmZoSk9RYys1enZR?=
 =?utf-8?B?SHo2b3ZlVEhYVjZTN0JGa05OSExUNTdNRGJUYmpFNDJkWGtLMTUzeGhxOTRI?=
 =?utf-8?Q?iyL5BY03AAvOSJFi+VprCBI=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2956fa7e-fdce-4eb4-93de-08d99edc1a11
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2021 15:10:41.9747 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZQIn1Ly5Z4ZrVr+FePnPXH5a1JuA3bhdeo8c8+p/r/eCV4dMx6AyKsIP63ADHgEdCcy2o1sHU0V0/Xy1xmlkNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5411
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
Cc: sebastian@sebastianwick.net, Shashank.Sharma@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2021-09-06 17:38, Uma Shankar wrote:
> Define the structure with XE_LPD degamma lut ranges. HDR and SDR
> planes have different capabilities, implemented respective
> structure for the HDR planes.
> 
> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_color.c | 52 ++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
> index afcb4bf3826c..6403bd74324b 100644
> --- a/drivers/gpu/drm/i915/display/intel_color.c
> +++ b/drivers/gpu/drm/i915/display/intel_color.c
> @@ -2092,6 +2092,58 @@ static void icl_read_luts(struct intel_crtc_state *crtc_state)
>  	}
>  }
>  
> + /* FIXME input bpc? */
> +__maybe_unused
> +static const struct drm_color_lut_range d13_degamma_hdr[] = {
> +	/* segment 1 */
> +	{
> +		.flags = (DRM_MODE_LUT_GAMMA |
> +			  DRM_MODE_LUT_REFLECT_NEGATIVE |
> +			  DRM_MODE_LUT_INTERPOLATE |
> +			  DRM_MODE_LUT_NON_DECREASING),
> +		.count = 128,

Is the distribution of the 128 entries uniform? If so, is a
uniform distribution of 128 points across most of the LUT
good enough for HDR with 128 entries?

> +		.input_bpc = 24, .output_bpc = 16,
> +		.start = 0, .end = (1 << 24) - 1,
> +		.min = 0, .max = (1 << 24) - 1,
> +	},
> +	/* segment 2 */
> +	{
> +		.flags = (DRM_MODE_LUT_GAMMA |
> +			  DRM_MODE_LUT_REFLECT_NEGATIVE |
> +			  DRM_MODE_LUT_INTERPOLATE |
> +			  DRM_MODE_LUT_REUSE_LAST |
> +			  DRM_MODE_LUT_NON_DECREASING),
> +		.count = 1,
> +		.input_bpc = 24, .output_bpc = 16,
> +		.start = (1 << 24) - 1, .end = 1 << 24,

.start and .end are only a single entry apart. Is this correct?

Harry

> +		.min = 0, .max = (1 << 27) - 1,
> +	},
> +	/* Segment 3 */
> +	{
> +		.flags = (DRM_MODE_LUT_GAMMA |
> +			  DRM_MODE_LUT_REFLECT_NEGATIVE |
> +			  DRM_MODE_LUT_INTERPOLATE |
> +			  DRM_MODE_LUT_REUSE_LAST |
> +			  DRM_MODE_LUT_NON_DECREASING),
> +		.count = 1,
> +		.input_bpc = 24, .output_bpc = 16,
> +		.start = 1 << 24, .end = 3 << 24,
> +		.min = 0, .max = (1 << 27) - 1,
> +	},
> +	/* Segment 4 */
> +	{
> +		.flags = (DRM_MODE_LUT_GAMMA |
> +			  DRM_MODE_LUT_REFLECT_NEGATIVE |
> +			  DRM_MODE_LUT_INTERPOLATE |
> +			  DRM_MODE_LUT_REUSE_LAST |
> +			  DRM_MODE_LUT_NON_DECREASING),
> +		.count = 1,
> +		.input_bpc = 24, .output_bpc = 16,
> +		.start = 3 << 24, .end = 7 << 24,
> +		.min = 0, .max = (1 << 27) - 1,
> +	},
> +};
> +
>  void intel_color_init(struct intel_crtc *crtc)
>  {
>  	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
> 

