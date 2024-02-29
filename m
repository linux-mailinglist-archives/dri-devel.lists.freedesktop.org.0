Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6AA86C881
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 12:52:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D338210E148;
	Thu, 29 Feb 2024 11:52:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nUYhRL99";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49B5610E148;
 Thu, 29 Feb 2024 11:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709207547; x=1740743547;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mRBYt14pHohHQ2xuMivsqjgGoxI3RM5CIjLLg6NrgEk=;
 b=nUYhRL996DtVIxc+UktOFlykC7hiv50ZbO3Y4Il4UXuYB1qr8osCXQr0
 x1h4aR2Ieie/QHRT2aciBmfPlTTunRIKoIegJQWfQdRVh3V1TzbBz+z7k
 W1VOYyytrrl9vS7Ndx0iUNkDhcpAJCsvAfnb0POil4m0XBhlDoh0qI/cp
 p3BA1COmACsFPrYoRch0lTON8t1u82gQEZAma0n0YZwiRhCd6mn3ioUWj
 rZsXljlRnwuwF2thxZ6xSvJXiojzsrM5MgTn9dkcSScZ/mf5djwOnoLn4
 4K1pg3J542EWRS+tG1y8JChJjflSTRJXpFJEf97y2o38blhUIX3fYSMGs Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="7492471"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="7492471"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 03:52:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; d="scan'208";a="45318906"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Feb 2024 03:52:26 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 29 Feb 2024 03:52:24 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 29 Feb 2024 03:52:24 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 29 Feb 2024 03:52:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D8NhceB4jm1lu6cq5cYry9pkfPB1vj8aQ8wGLqWqlDihOgohJmioQRK0w3vmqP59pXwtxi0hzvI0CduqJOpiV6fcpDyQSvLtWUWBIRBaP3AtCaywS9ElVxMiaPSpbFcOhPNf5xgBA8zRwiTWCP6yYB6HVfWB840CNyttxasZBzwpKnVfm53xm/p23MyNhZDCJFsAVvUQ8EkGOcyiUzQsDXVQBk4R82Xq+7uUNj7kzpGjS38SkfaNsWESMf+vQlHvIkPXf0p5aERCM9jnUI8XO8jgS8OG2asYAuOaz2JRylmkqWhgEG4MBMxLBe3UXmKntX7JfymB3d67w0w7DtnegA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tmr/qszQIIeJV/LLkAgak78lcHolZzwTq/ctIqpmo4Q=;
 b=CujlvwagweC4jtPNAFTIlOdxzg8y/L33btF+uOKZeVKIpLjxEr5My0sbBC0wm5syMtGc9iPA3cKZdd78WPF/3qtvxhSLa1KzW1IT3Qx3ya8jnH2qW7ZILaBdeF1KmdrlhweFI7awQk4Pg+u5Nims6qjzu4zSOPKlA97LtFNx6UotgEkZ0zIfXmULXvgoaRm9jOSG3ZvSITy5o7XNNvx5H+oUd8bMWso52yXlr5z976NPUUz08kbAEibdai3vfRbWbqvg2d7Oiopr0eqtjYGeswNwsWs8m2xh4Fr0lk+kWIcwWHXbhSa5y8En7qJUk/cNhajPF+49I/8uSIYvuvfGqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by SA2PR11MB4873.namprd11.prod.outlook.com (2603:10b6:806:113::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.25; Thu, 29 Feb
 2024 11:52:22 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::12b:4490:b758:75c2]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::12b:4490:b758:75c2%7]) with mapi id 15.20.7339.024; Thu, 29 Feb 2024
 11:52:22 +0000
Message-ID: <89331cc5-c4f4-4d45-a40c-6e3271f6d1e1@intel.com>
Date: Thu, 29 Feb 2024 17:22:15 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 6/8] drm/i915/display: Add state checker for Adaptive
 Sync SDP
Content-Language: en-US
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>, <jani.nikula@intel.com>
References: <20240228143823.2762595-1-mitulkumar.ajitkumar.golani@intel.com>
 <20240228143823.2762595-7-mitulkumar.ajitkumar.golani@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20240228143823.2762595-7-mitulkumar.ajitkumar.golani@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0094.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:27::9) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|SA2PR11MB4873:EE_
X-MS-Office365-Filtering-Correlation-Id: df327978-2ec0-4428-1c33-08dc391ce37c
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ON+qWmQwwIg+WUlL5g+HpcHV3WcWaaG549Ggv47DcbUBV7B4t9BPTnyPwoQzgODtLUF516h+DUCLL4d2Lw+b0iHdvWMPz/QpiHsbKKJCEIzzyOFUUMaLrrs9U1wkFQsjpLcc7p5Q8llmYQuH7zzwb1l+apPKf6MglOqtZvh4K1fJXDlZ8qOdhRiMH4VjbrsWSPmT99piqjb6vX7M6Q/Z1Xec2kcDLYDTKJ0oC+buWHgSxyfd0NCwkdoDpxNiQg6FGKamG8cAOAl5gYEjGO1DYc3Ev77U8BPN/uGT7yOqjh085t8tSF92J/UHVEeBom3OjHHPLi6Bv2mE7Mcvli0aXZNO1fOpgkOR68bQGvuYukuB05uKRnSBhCBwzckQy5XBbSFuvaQr540dLZEAaKDwoCZoU/05atlXkqGMHVH7O2YcWq5uK/NSS67sU5wBzOjskc61TCgl33ohGqAjbVVjhFAon5bKbOw/p1KHjKeNg/JmTogpZhc89BtL7qLAeR93iwbk3u17DY4iPftQNv9qHrVnUMTP7sYIwI9d7wqg9TQExqD8ALhRABAtvEUchWWJYIvi64adnpRL3iWzTemu3Lypq4I+Eruu0R8Xln8y+D0MaxH5Moqnn3VnkbzB1l2X
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S01lbk83T0pCR0t4dWZMeXkrLzlBalJBQ2dyZU1QeEtTUFRzWTl2eklNQlNL?=
 =?utf-8?B?dGtzeGl0SlQxbVZCUFFuQWZZUk5Hc2lsRWlXaXkyeDNvOEdPOEdaWVg5M3Nh?=
 =?utf-8?B?Zk9UZHZ2MzFLUUVJb1FxRkVTdlVkNzQwa05mKzJ6QU9HTm8yMHFwdFE2Rmdo?=
 =?utf-8?B?NWFZT1BBZitQVVA0OUFGVmtHMDJZVkNtM2VhV2lISjBvSGU4QnFMSVlyUEhO?=
 =?utf-8?B?WDBWZmlrZFRhaW5ERjVtSUNRVDBNSElqN0Q2Y0pMMmMvckhZN01PNHlhYkpO?=
 =?utf-8?B?ZmRhNTVaSFFSRUFVVGJTdm9WZGdleW5CbjZCQWlhYzQrdTFUc1ZUb00rSmhs?=
 =?utf-8?B?NTZ4Q1dseDhIWEtMeHA2VEdGbmhNNWIwd2pKb2gydzExeHYrZGJ5aWwwNUd1?=
 =?utf-8?B?dTUwelcvbm55OHA4NWhidEgvMVdIVyt6dGxkMUpuQWN5S0prNGVteVMvUXJt?=
 =?utf-8?B?d3N5VCtUR2RuSC9oSXNoL3hzU1g3MVNVZ3Q2Njg1VSs4NU9KZ3g0SEx1aWYr?=
 =?utf-8?B?L3dFVGY5T3VMV2NNYjhUSmcvTmw1QjUyTEQ5L1NMR3lIUVdQYmpxTFgvOVo1?=
 =?utf-8?B?Zk1uc1ZxejdsSHI4MFAzNmNIeUxyVTVobTBmQ2FFdGEvNFc0K04rcmt4b3NP?=
 =?utf-8?B?U0kxbXpiZmhjb01vbkxYQ2JNcjB0cW4wdlowV082QjY1LzYzY3FuOGxHREtS?=
 =?utf-8?B?UG1HcWx3a0VIT2UzY2s3TEp2V3lWc2N2djhXS3U2bTVQeFlxeENXUmxjWEJ2?=
 =?utf-8?B?eEl4YzdNa3lLYWs4L0Y0SXhDS3p4ZUJWR2U4OGdXTE9pNkNJMnNFMVI5M25q?=
 =?utf-8?B?VHlXV0s2ejgrYy9RTWFrZFc1ZnNMbHUrckFSREJZR01ld2QzcnJHb0pOL3h6?=
 =?utf-8?B?L2lIeUFDSHJBK0lZQUgzY2Zja0F0cFRUZHRRTmw3OE93bGw5ZnVyMG5GejRl?=
 =?utf-8?B?bW1wZEgrYlJ2RGJMR2plK0JoNlh4N2dzSmpvU3NXVGU2b080Z0JWYnkrN2FS?=
 =?utf-8?B?VDI3MXRzUW5CRUNVS0J4WURISVZhOXNsT0l6YVB6ZHJYRm1JSFFuczN3WlRm?=
 =?utf-8?B?S3NXY0RIaDhkNmF2YzAxb1FFZDJ2bHBUc09mNUpkZ1FxWU5Wc3FuK0tHbm95?=
 =?utf-8?B?aU1taFJsM1puWmVJZThIc3Z1cjRiVEQyMmI0MXVzZEhIamlnNmdRbk9XdXho?=
 =?utf-8?B?S0xiWkpLQnBmeDMzZC9OWnFCSTRXVDJNQ0xzRXBGVW4xM2JRNkxuRW83TkdN?=
 =?utf-8?B?VlVSMnlRWUVxN29YWERYU2VuRjBJK3Z2TFhPYThqKy9ZWFRBcStaSUtxR2Zu?=
 =?utf-8?B?MWJuMWF6RFlnSmNLeGdSY1pYL1NhTmpMb2tjcldiOXVHdlVHZmpKYVVwV2hE?=
 =?utf-8?B?NHVoMUFmeEZwTE4rZi9jMEVCUi9jQ0dHbE8xajdnNS90Q0FGZ2x5ME55UTlB?=
 =?utf-8?B?VW9LaGZSOFNrVHRxK1hLOWpSVHI2SzlMTFliaWdGdmNvaUlCdTNsNFM1bFh4?=
 =?utf-8?B?UlR5RkJndWhmVXV5OXFaUmNqcUhkSkQvY2VmZW9uTk9lTHFCUjB0dTIzd0hs?=
 =?utf-8?B?bmozSzBCN0Z4aG16TnAzOURPWUVJRmJhTGhabHBaYThKSGZTbGp5NVJQMUYr?=
 =?utf-8?B?TkpJWVlDYUdYaVVIeng4Q3duNFNmVjBudlRaRzhwREtkdDRuY3o2cHFFVXFa?=
 =?utf-8?B?YXNFNXQ3R1l0UUEra0NuU0FvT0hXWVBEOGtWWTZXdVBEVVlZTStuM21vVVFF?=
 =?utf-8?B?OTZtY25DdmxSVHBDUVUzTnl0TTBTejdaTEtOYldXTC9YZXpjcVMrWHpSWW0y?=
 =?utf-8?B?eWVNUUlDbnI5anJsMk41Z1hqT29hOFJlSXFqNnpnZE1LWFpwRHBvSEIvSWl4?=
 =?utf-8?B?RjUyY3N2cFdpMnNjeXBWTkxEZnp6cTh0Uzg5cTU3TnFwT3VsVXcrSHYyUFNn?=
 =?utf-8?B?OUJVb1lycnlBZm5tQmd0Sk5Sby9lRmVGc1RwSlM5WThhTktlejhnQ2tsZVA5?=
 =?utf-8?B?dGlXTUhFRm95UjduTW9HK1BoY015em1QQUxCMmlGaWZDd01ua0EvZDlkOUV1?=
 =?utf-8?B?UktBUFF2cEdQYVk1ZnFyaUxWNlFYdFc4OC95K1lNMDd4ekVndXZscGRYY1Vt?=
 =?utf-8?B?VHVveExUTGlTRnVOTEZFblpMRWVLVDJJZUo1SHdpRy9MaVAxM1ZVUmFsbjRY?=
 =?utf-8?B?elE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: df327978-2ec0-4428-1c33-08dc391ce37c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Feb 2024 11:52:22.1959 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PyrEpE44FSd7Mis+uhBHfJ9gf8mf9esxN7wSTZ0mV0o4/QBe4xTrBZWG3UFwaF1kQ8BSZF8UjZvjNKQrZjSlEDbjZV2lpqsKLehkCPw4QwQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4873
X-OriginatorOrg: intel.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2/28/2024 8:08 PM, Mitul Golani wrote:
> Enable infoframe and add state checker for Adaptive Sync
> SDP enablement.
>
> Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_display.c | 46 ++++++++++++++++++++
>   drivers/gpu/drm/i915/display/intel_dp.c      |  2 +
>   2 files changed, 48 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index 00ac65a14029..be0a5fae4e58 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -4781,6 +4781,17 @@ intel_compare_dp_vsc_sdp(const struct drm_dp_vsc_sdp *a,
>   		a->content_type == b->content_type;
>   }
>   
> +static bool
> +intel_compare_dp_as_sdp(const struct drm_dp_as_sdp *a,
> +			const struct drm_dp_as_sdp *b)
> +{
> +	return a->vtotal == b->vtotal &&
> +		a->target_rr == b->target_rr &&
> +		a->duration_incr_ms == b->duration_incr_ms &&
> +		a->duration_decr_ms == b->duration_decr_ms &&
> +		a->mode == b->mode;
> +}
> +
>   static bool
>   intel_compare_buffer(const u8 *a, const u8 *b, size_t len)
>   {
> @@ -4836,6 +4847,30 @@ pipe_config_dp_vsc_sdp_mismatch(struct drm_i915_private *i915,
>   	drm_dp_vsc_sdp_log(&p, b);
>   }
>   
> +static void
> +pipe_config_dp_as_sdp_mismatch(struct drm_i915_private *i915,
> +			       bool fastset, const char *name,
> +			       const struct drm_dp_as_sdp *a,
> +			       const struct drm_dp_as_sdp *b)
> +{
> +	struct drm_printer p;
> +
> +	if (fastset) {
> +		p = drm_dbg_printer(&i915->drm, DRM_UT_KMS, NULL);
> +
> +		drm_printf(&p, "fastset requirement not met in %s dp sdp\n", name);
> +	} else {
> +		p = drm_err_printer(&i915->drm, NULL);
> +
> +		drm_printf(&p, "mismatch in %s dp sdp\n", name);
> +	}
> +
> +	drm_printf(&p, "expected:\n");
> +	drm_dp_as_sdp_log(&p, a);
> +	drm_printf(&p, "found:\n");
> +	drm_dp_as_sdp_log(&p, b);
> +}
> +
>   /* Returns the length up to and including the last differing byte */
>   static size_t
>   memcmp_diff_len(const u8 *a, const u8 *b, size_t len)
> @@ -5089,6 +5124,16 @@ intel_pipe_config_compare(const struct intel_crtc_state *current_config,
>   	} \
>   } while (0)
>   
> +#define PIPE_CONF_CHECK_DP_AS_SDP(name) do { \
> +	if (!intel_compare_dp_as_sdp(&current_config->infoframes.name, \
> +				      &pipe_config->infoframes.name)) { \
> +		pipe_config_dp_as_sdp_mismatch(dev_priv, fastset, __stringify(name), \
> +						&current_config->infoframes.name, \
> +						&pipe_config->infoframes.name); \
> +		ret = false; \
> +	} \
> +} while (0)
> +
>   #define PIPE_CONF_CHECK_BUFFER(name, len) do { \
>   	BUILD_BUG_ON(sizeof(current_config->name) != (len)); \
>   	BUILD_BUG_ON(sizeof(pipe_config->name) != (len)); \
> @@ -5270,6 +5315,7 @@ intel_pipe_config_compare(const struct intel_crtc_state *current_config,
>   	PIPE_CONF_CHECK_INFOFRAME(hdmi);
>   	PIPE_CONF_CHECK_INFOFRAME(drm);
>   	PIPE_CONF_CHECK_DP_VSC_SDP(vsc);
> +	PIPE_CONF_CHECK_DP_AS_SDP(as_sdp);
>   
>   	PIPE_CONF_CHECK_X(sync_mode_slaves_mask);
>   	PIPE_CONF_CHECK_I(master_transcoder);
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index 1cd3cc0d0c0b..2ec1f923a5a0 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -2648,6 +2648,8 @@ static void intel_dp_compute_as_sdp(struct intel_dp *intel_dp,
>   	as_sdp->target_rr = 0;
>   	as_sdp->duration_incr_ms = 0;
>   	as_sdp->duration_incr_ms = 0;
> +
> +	crtc_state->infoframes.enable |= intel_hdmi_infoframe_enable(DP_SDP_ADAPTIVE_SYNC);


This change does not seem to belong to this patch.

Regards,

Ankit

>   }
>   
>   static void intel_dp_compute_vsc_sdp(struct intel_dp *intel_dp,
