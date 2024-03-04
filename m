Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8813C86FDEF
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 10:48:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A96A810FEE1;
	Mon,  4 Mar 2024 09:48:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ItHBInAg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B43DB10FEDE;
 Mon,  4 Mar 2024 09:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709545680; x=1741081680;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vavoZ2lLKWJSsqEy8QfxNT/2IkrJRBzjSenl+0N800k=;
 b=ItHBInAgxtxCoAjoxHnkPgK04HpJ6EKyHefYzRAWPq/EDk3ryxUKg0Am
 9ZTsPaKgiKW8qan3g48mxa5oITgA62jaG5SFOXKT2o8n2310XSIWt3/TF
 y2InA8EgFk/g3Rr9c6SCziJHYLh7xQYXcG/ohtUO5bOqSW5+ap3/YjfX2
 IoaehPC1uOxctw2T49WmLAQorlbyJ3BkB/IrG59rIJXAATZaRZZ9fFpcw
 1lWtPAgOubCPWCu8XfUpPHjHrCXd62Y59kpH2EtIrUV8gLJTcMkDmLKdQ
 QNu/O9I6mPWiEQh6chp/Uib9diSgItdBIEvcnA+wyA7sL9JwXQF5qcMcf w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="14737246"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; d="scan'208";a="14737246"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 01:48:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="9075960"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Mar 2024 01:48:00 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Mar 2024 01:47:59 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 4 Mar 2024 01:47:59 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 4 Mar 2024 01:47:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oYDeQ425F3UPzvs2wnxPAEEZAPfjCqXNL3qyaOYbz60WpJwyAvw7nlzRT3PysltIZiThsJ7U/m6U8c2WTofHRyeQ6b5iM51Bu5NUXEFraFjEutvFy2SWS0nihlpTfi0Fk+pI22fLnsYOUWALPG3/txO+b7vF0zRTUv4/uxH+0Qy1lfdBKD7ZQtzppNrQXc5V4ef1OjATncN2plCi0Rbs78Dqm5+VWMKXdP8RHWyE1ELUPUqBrUqX7trR3O1Jzj5fQDxrXBVVd0oE4XcOKEntQCA8sOgUh56wAfrcz+U9mOi79qPUh4RfSWXdSBYyvJN+17Pifj/U7oBrfgPrHlUddw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mu7Jhw8sBRkehhPAorQ5GythSdygcNO435XBgTNPwzs=;
 b=HRQBonfH+Y44zLSDXkbqcq5RjUzbNdCK5qTSHuhMYAUnvjDP3gK1xmAQyasUUTKBonqx1VuDfNnQa/jo+dCg8+XLvaG8/+gNV4y3iHGu7ij91TLougpwaeIDDPzNxMyU2svfNJ7osbnThFTeMC6n5i2F05sr7QQ8SmHdNKGkbFLZDUo34ZJPQmCHf6SkhVlUJPElwLEXEk2FHDwxIiiRFoffonHQP7ScmTewM/+YZRaWkVkIMfRYEKM3lCdLGB6hpZRtYPF0fZFstzpk3bhyLpBminuM2VHjqqQpN8+f9n8Dhz+NUHM6UNTljRgzb22SUtF+l2GRqAruD1m6rvX8aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by CH3PR11MB7841.namprd11.prod.outlook.com (2603:10b6:610:121::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.23; Mon, 4 Mar
 2024 09:47:57 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::12b:4490:b758:75c2]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::12b:4490:b758:75c2%7]) with mapi id 15.20.7362.019; Mon, 4 Mar 2024
 09:47:57 +0000
Message-ID: <272334fc-a2f8-4d9d-a6ee-7607f284d72b@intel.com>
Date: Mon, 4 Mar 2024 15:17:50 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 3/9] drm: Add crtc state dump for Adaptive Sync SDP
Content-Language: en-US
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>, <jani.nikula@intel.com>
References: <20240301084503.2971826-1-mitulkumar.ajitkumar.golani@intel.com>
 <20240301084503.2971826-4-mitulkumar.ajitkumar.golani@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20240301084503.2971826-4-mitulkumar.ajitkumar.golani@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0187.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:be::10) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|CH3PR11MB7841:EE_
X-MS-Office365-Filtering-Correlation-Id: d68314d1-6738-438a-4ad3-08dc3c302be8
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TydK776yWpZR7MDFYf3cspgf/ESzw3a4NWgTFNe//M9eeVNwLsG0/lKYlbHxHmZu3XPHkGYTFm9wHuiOq7gs6xOlXhiSUoeP6TxV5Bdjl7B66OxOMtmse8KLEOTlwN2AKO9mzOtovs3igxqMb83hXVHSdHiP46E6RgRMuUvcKeUkvIWC3Vf6MioEHO46ZCauXxErFJ4KR8l5HHQVQvy8a0tM1GHUSYIqS4HwSzNU13B/gNXwl39AsDIrXQt5loyT84I/JmWkJOf1vQ5BLi4SQIEy/CjpPGzddlLb0OBgalzwwTEvypbptE0MYPJgiln7CF6eiVy5MyEY9Vj2kY5owJIUHpkzTRcpH3FJrZ/943n4pFlr07/77eU0ThJRBkHyzq/rHrc26eCTO9H07YDRdiSm4lg9qoY/hsyoicxGXYnLYk6Y8U+RJ0MJaYZlCAGyvyMi3kjo0Fg7/XNGKNrMObd0Z5Q2vW2UZsZPF4vwnARbHSt6vEHem+Np6aiwtmbXL5h1UJYT0BlpjZs84RHwlZEtQekwuqlKTBATV4yc1STVRd1nM6FgBD9G/GeAL1N697ap/NiYAn/vH9VhVzG/AQwJayFOmK315Xi4CmvoMEQJg3qzIc02Qzvoc723FlE8MnZf2572jlxwQkPVlhAxn3jjhAfSC6v/cfYrUI2DHT8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VWNEN3AvaDVlZ2tTTkFVQTlvT2wydmJFVDRxMHduTmorWVdMMlgrZWNWRGNM?=
 =?utf-8?B?S09xN0VlNkRSa1JBRE5jRlczMnNUY0FaYkNKd3QzNk9MYU9SNFdRaWZIQmFN?=
 =?utf-8?B?aG5JdThEUWZ5dXZuZ2gxOEtIVllZUEFzelhEaEl5RWlPb09PbXJlcmhHTENU?=
 =?utf-8?B?eWRMTjFqR04zcXJoVHJ6dWorNGJObFhEczVQcENvQmFTWWJUVzhrVkIyL1lN?=
 =?utf-8?B?Vm16czd5Q2duNHIzSS9kUnNhMFJmSUhsemZGZHVsVDk4SHBKYUdwL00yWHRa?=
 =?utf-8?B?bE5QT0g2cWJrNmYwMHpmKzJoZlc5alo4anFiZlRCT0ZvZjhPSVF0VWlJMHEv?=
 =?utf-8?B?ZTNlRHgzVnB5WHRXc3dIR2hIY2J5cmtaUzJDVHNVRHZ1UUhwbTJjWmdERXg0?=
 =?utf-8?B?Sk4wQy9BZ05QSUx1elp0dURNcDhYcUdEa1NqVHZ4WFhEQ3cxcGN6ZnpmcEhZ?=
 =?utf-8?B?MHFrczB2WDZBcnA4c2RzMkQ0bzJZenFPa2F5M1Y2RVJvY3YxWUo3Zno5eHYv?=
 =?utf-8?B?YjBOU2h4ZjRwc0pVb2JncEJDMVdPSFNpU0RsZkRueStqZVFsNjBCYWJLM3Vh?=
 =?utf-8?B?VVlmR2pMdEZCTy8wTnE5ellrNmhUZ05wZE1ySDVYb1pRaDhxMWl6bHdRMlJt?=
 =?utf-8?B?RzdaK3ZWazlZSUczMVNFRUhNMTZVb1BUSEprSnZVNUtyamo1eFdqRjY2UlBD?=
 =?utf-8?B?Z0ZpVXhSRWNVWGNSejE5ZEZvQkFZMnhMb2hZMW9ubUtNV24remUxL0k5T29s?=
 =?utf-8?B?SnpGbC9IZER2VWc4S2Rmb2VJU2NmNjFjMlBtbmNJTzZSeFhqVE1KaExLRk9D?=
 =?utf-8?B?a21JMmpMVHhvZ2doTTZIY0dnU1pQMlRvRVhweWZoQk1Uck5TajJNMDF1QllM?=
 =?utf-8?B?QTUzMlJuYVJPUDd2VzRlWndhcHhFRDlWc3hQbFdqU0k3RG9rb3dBL05jcU1z?=
 =?utf-8?B?dUpKNnBBa2tOTkd5dlR6NEgyQ2k5OFpIcVZIZThaQk1oYXYydlpBNGhtNzUr?=
 =?utf-8?B?VmZmVlY4ZGx0Q1hrUHZaTFJUT3gvbTNHUERkYjJpQmJMUE1IME9ocUZCb2gr?=
 =?utf-8?B?WmwzUEtPaWdsZ0hiTDN4UWxwaHlJOTYwQnU4OSt3d0FNZ0lSc1NEZlE0Wkw1?=
 =?utf-8?B?Q3JNRVJOcmRVd0JZTW9yOGxjc0o5dW5jTngrdTRWeG0waVF3eWQyS3FweDNS?=
 =?utf-8?B?TVc0ajZUZi9zZ3hNTTd1MG1vRjhhdGkvb1F5ckZkY3FBbjk2bUx0bVhSSzls?=
 =?utf-8?B?dnZaQm5vYVFvNmoxYzFKVlNpYVM4bzFZZmM5TndzMHArMzQ5K1ZxT1N1U2Zu?=
 =?utf-8?B?QUp4SUpOaGtOQU51WHpNaWNsOGUvSXI5Y3VUTVYxNUlzK29OZEErUVhFYndw?=
 =?utf-8?B?OE9YQTI1ZW05cUhsTGxPNjRVZHZXbStUWGd5OXJBUWVQOG4vSzk3S0JxdU9P?=
 =?utf-8?B?dnB0ZmRQUTF3dE1vNVN2b0t6eUdmMFRWUHF6SWRYOVhDZC9kUk5QZzEydGJR?=
 =?utf-8?B?SFdvL2drdW4rdC9lYmpRMTlyVlRLMGNmMitvbjMxaS84VHNySHJac29lNUFP?=
 =?utf-8?B?QlpJVkFmWWZEbzdYWDFjVXNXdUZGejlDeTd2RW5PVEE0Mk1sN2d3RitXNEEz?=
 =?utf-8?B?R2hxRkNzcGNZSnpleU9sSjdhN1BpdWxhRks5WEQ1N0R4TDFSRGU2ZmFoYk1o?=
 =?utf-8?B?WEdvWjAydlMwRXJGVVBRSWZGSkt4RFI4bmRJamw0S0hnQWRpbk5zQXBhKzZJ?=
 =?utf-8?B?THFDK2c3NzUwd3dEUCtLTExleTVIYlE2TzBxazhTdVBKdFE4bFphSzFSNDhZ?=
 =?utf-8?B?dEFrV0pURnR5NXg1MDcybXZuSGkybFc5aCs0YVlxTStvWk1LbllUc2diVWNB?=
 =?utf-8?B?ckFMMU9vT0trem5KL3ZmdVFsTUp0czR0VDI2dzc4S3VxamhOMlVjSUFSSjFO?=
 =?utf-8?B?eXh3c0NlNnU4MDNGK1ZCRkR5N3VLeXFWdWNZSG40alhRQWdheSt1SGJHY0Rk?=
 =?utf-8?B?RllzQWkrQjhWTkdCcVlLcGRTcUkzbDE0ZHQ2NHkyMllKemZ2OUt6OWJJcEJS?=
 =?utf-8?B?WTBlQ04xY09oRW5EWHk4emlvQ0MxZnlldGU1NWw2MFpGdFVrSGkwb25QL056?=
 =?utf-8?B?S2tPOG1jSEM0ODRSLzhVbnlrYkFNT0NMRHhac1ozMHdjTUtIdml4MFpUc2Fw?=
 =?utf-8?B?Q2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d68314d1-6738-438a-4ad3-08dc3c302be8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2024 09:47:57.6150 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ADZKrrUpZRDozCe/TE0TB1bprH9D3vGJVHT/vJoG/pxHnVqoRm8LC7236wBUiYmRXMfj9dN7EqPj3/kMSmEbHhpYeXxbz/LXyG6bDC3YSJI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7841
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

Add drm/i915/display in subject line.

With that fixed this is:

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

On 3/1/2024 2:14 PM, Mitul Golani wrote:
> Add crtc state dump for Adaptive Sync SDP to know which
> crtc specifically caused the failure.
>
> Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> ---
>   .../gpu/drm/i915/display/intel_crtc_state_dump.c    | 13 +++++++++++++
>   drivers/gpu/drm/i915/display/intel_display_types.h  |  1 +
>   2 files changed, 14 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
> index 4bcf446c75f4..1e4618271156 100644
> --- a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
> +++ b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
> @@ -51,6 +51,15 @@ intel_dump_infoframe(struct drm_i915_private *i915,
>   	hdmi_infoframe_log(KERN_DEBUG, i915->drm.dev, frame);
>   }
>   
> +static void
> +intel_dump_dp_as_sdp(struct drm_i915_private *i915,
> +		     const struct drm_dp_as_sdp *as_sdp)
> +{
> +	struct drm_printer p = drm_dbg_printer(&i915->drm, DRM_UT_KMS, "AS_SDP");
> +
> +	drm_dp_as_sdp_log(&p, as_sdp);
> +}
> +
>   static void
>   intel_dump_dp_vsc_sdp(struct drm_i915_private *i915,
>   		      const struct drm_dp_vsc_sdp *vsc)
> @@ -302,6 +311,10 @@ void intel_crtc_state_dump(const struct intel_crtc_state *pipe_config,
>   	if (pipe_config->infoframes.enable &
>   	    intel_hdmi_infoframe_enable(DP_SDP_VSC))
>   		intel_dump_dp_vsc_sdp(i915, &pipe_config->infoframes.vsc);
> +	if (pipe_config->infoframes.enable &
> +	    intel_hdmi_infoframe_enable(DP_SDP_ADAPTIVE_SYNC))
> +		intel_dump_dp_as_sdp(i915, &pipe_config->infoframes.as_sdp);
> +
>   
>   	if (pipe_config->has_audio)
>   		intel_dump_buffer(i915, "ELD: ", pipe_config->eld,
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
> index 860e867586f4..098957cea25b 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -1338,6 +1338,7 @@ struct intel_crtc_state {
>   		union hdmi_infoframe hdmi;
>   		union hdmi_infoframe drm;
>   		struct drm_dp_vsc_sdp vsc;
> +		struct drm_dp_as_sdp as_sdp;
>   	} infoframes;
>   
>   	u8 eld[MAX_ELD_BYTES];
