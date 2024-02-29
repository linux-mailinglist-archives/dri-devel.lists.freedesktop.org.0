Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2D086C7B2
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 12:07:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E14610E45C;
	Thu, 29 Feb 2024 11:07:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="REA8ADS2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3D0910E45D;
 Thu, 29 Feb 2024 11:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709204852; x=1740740852;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BD2DZ3wUIvg0DXihk+V7lkqTRGz8EU83CzbnlAKgxE0=;
 b=REA8ADS2k4Hx2aNbo0X5cV2Vl0cTHQxK2VUNuqfnKjuUvB4Hi+VXShom
 g1u3+sV094p25lLRePJXmnObt7zaQmZz/S8f+Z25+awxm28v1ZnJt8XbE
 +6EOfhX6qcpowH1c6AQ2TIujsKAc5DS/gP68/KqbpOqVA1CLqIfBDJJlH
 DmqbWtGTBX4r+8cSRfPso8W5TMEgjRXLh6/tMHoGQyTcV9fMLLBMorTIM
 kIJJmYJGXal4y63DrHAZZ661lcNIzCD7i2QpKZRBGp/zzfNnooEbUgjJp
 /AiaplQhAuHp3Vosn25u/WNJLxuz+ILj5Q010KXwVB+Tpf6iqz/KDQyJh A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="14818903"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; d="scan'208";a="14818903"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 03:07:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="7701423"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Feb 2024 03:07:31 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 29 Feb 2024 03:07:30 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 29 Feb 2024 03:07:29 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 29 Feb 2024 03:07:29 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 29 Feb 2024 03:07:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cisuwyU6CcmLOf2NK+oV0UlqhJ2KMbiw/yqEqMKpcZuaswtgfBH7Xg2/yP2HkGgRxDcAsJ45k1n4eDi1H6VxFms9bjlfsuFwZyEymgG2eaFXWiTGtaJng1wniDkWShlm4Yrpubk2maYkxbAuisb4XAPt0NkAe8oMqVXqOswg7uM0LoTRCt9EBxvDE0meMmWzqtk7GnKI9x4YnJ9RsnCLkYFUHuuTk/88C1quugZruLzQcoShKzKzBAWM1lvIEHRwdENOpfz9xgTAZlxIAy4rtd4Zhj4/f/28ETyO6ZcUuPzJzfEhKS0rFT9WO5ZKRyPTddX5Ot2nBuUo0DBOLAXvcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XZvRd+C3Tvb5MVX165ga/fBppiXbUsAI75hRQZe3q0A=;
 b=EG4WoU3SPSVfZAlzXBx5pN+YdznspDIOhgWI3fEnpv6CgyEEvfXJy+o1s3V3coUrW0vezE4o1T6901lgxOmveY949PA5X53rE0aoqci7acVQBomOPbaNtMwPO/9xSNg+U/nILx2qKYPkU8po52kLFDPIxJ66ScQKXncYDMLDBplxf+SJuEKoF78lWcj2fqFBjA5m9HbtTjkeDz7lGwNtwLygwl8S+mYVdItQCnlZrcI0zJoB4KiqBr5iaSWl34cPUOUSXgufQN71PzB+dN3rw/vw1sYbLQ3Kr/XZYL0UaJ7Zfm7wGWYlv0Cgo0FpHoIVc+7NcdxwJ5nVQefEMu0A6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by LV3PR11MB8457.namprd11.prod.outlook.com (2603:10b6:408:1b7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.26; Thu, 29 Feb
 2024 11:07:27 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::12b:4490:b758:75c2]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::12b:4490:b758:75c2%7]) with mapi id 15.20.7339.024; Thu, 29 Feb 2024
 11:07:27 +0000
Message-ID: <bcaf5768-a85a-4a39-8e05-f4211d2457b9@intel.com>
Date: Thu, 29 Feb 2024 16:37:20 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 5/8] drm/i915/display: Compute AS SDP parameters.
Content-Language: en-US
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>, <jani.nikula@intel.com>
References: <20240228143823.2762595-1-mitulkumar.ajitkumar.golani@intel.com>
 <20240228143823.2762595-6-mitulkumar.ajitkumar.golani@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20240228143823.2762595-6-mitulkumar.ajitkumar.golani@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0191.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e8::18) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|LV3PR11MB8457:EE_
X-MS-Office365-Filtering-Correlation-Id: 184d9532-dd3a-45d9-6c14-08dc39169d3f
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4iFRZQVLnwb5Er6GTkdQ7uIRQXLF/AGPaoHvUTYUjEj+v/rLgrhrdXLcz1VvpG9e2aHgxkGOz5CMkxrqfbZk7yAEPP12pihIpTyD+MGCxU2PLC0aOU4ZC6qK9L+HLB9A7VZTvQ3LGhOhR9Uvg99SUpWuC9yeEWwInR5o5xjdeccpNQEGhi0FQ2cZGyIA7Z8AeGRMBDN2wD3HVMfD49dpKIzGQ4/YZennS7UoqOD/hJrksNX2SFJFEAwGAv09jWk4iQ4L9uv7vnpju3aA1Oc+xK/b4cELC0EU5Q6IrDR/Y2cD6d0IXNrOJYRrI4C8V1ra3LxY4ErPh+ueK+mxqoz/fgFQTZah0dXqkEw4G2BaliKLr7fNsJEXWg92fqjQVndURLYhwH4CxJDOqBOo2v1b4FM5n0PKHJNJIMZF1ct8jqDPLzB2Tti880+de0DwuVDRegu6zDvOon3qWn0ISINMQ/ptB6AtgxYPlty/MiCnV0Y2tDTWnZALlVNqNGAiGH9a0mMmQ21vntq+SeW0SkI2I1ZaboqkwSlEDL4MmRPiRmcBqMO+Mo5jp3VzSCSyXTczTsOt75AZyJAkMhKw+cNG9ozjHXwoxkKz5iJOL2YeJuX979nCYe6qiJvGIMVgnepehTyUpaKyFGZGmFaLGOsUxw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aklac1Vabm5BSjE2R3pzTDhhdnJFUUNaUmJSWFdWakVXbnJzM2JNTmtWWFFF?=
 =?utf-8?B?VjZtZ3U2TGtoNHlaemNpWEJwMHBBUkFsZkFIVDZNbjRjazNxTFJ4WGdkZC9o?=
 =?utf-8?B?SFhSeXNQazVVbVJ4VWhEOXo3MWduVjZuaFhFRlhWSzRnSkxzQ2JTNzR1a0w5?=
 =?utf-8?B?aW56Qm01QVIxcmg5ZDNmMDBobkFiWFhGZzA5eUg3eGNudURHRVlzcHJQZzkv?=
 =?utf-8?B?STVIMm5FaURkaGJ3V0ZDMnc5UW90cFBLYk1McENsaUZucGovRHJMRjJ5VWZt?=
 =?utf-8?B?KzhSYlFWTE1Hd1JmNGhQRklOQS83bzJodGxkTjV5TGVkbGNVdEpVT21TN0lL?=
 =?utf-8?B?eDBJazNCMGxpVGU2eFJRRjJXNE1RaCs2djlLeTF1YVRtMStEN0xwVlN6ZzBI?=
 =?utf-8?B?OWVjcjRuU05yNEtYTlFHcmYzSkN2Z2xYWTkwMlFZVFFyVnRSSE1BQzRmSTUv?=
 =?utf-8?B?S2ZyaU9hQWpwKzZYMkJRVHV2K3YxcWZtWlpya2M2ajIrc1FoeUpaMDk1VHR5?=
 =?utf-8?B?aWpsZTFid0o2bHMybDFJQkRPSHVhSUkvSlNEa05aeUdseXZSY3VTRG5RUXNm?=
 =?utf-8?B?eGpXbGI1cXpRNDJHQWFkYk5JQmVxd2FRTEdUL250SEVBZlRrcnZ0a05UVHND?=
 =?utf-8?B?RitmbEZ6b2ZFbGowYU1GYzBTelJEY0dSM0xCSTRmSnF6M3E5N1N4Yml6bFRB?=
 =?utf-8?B?dlUxWmlCWWo0ZVh5V2d5ZmFKWloxVWlZZWJHMW04ellib1p6M3RRMjdja3hL?=
 =?utf-8?B?QXhTakZyRXlTVUx2TTc0TXRiNEhCNmRvdlZ2dkROWnRzOHExMnNicXhxVGFC?=
 =?utf-8?B?Vy9aOUtkV0VENzU3RFJCL2NZZnVOcXMvVjBnRG5CT0xkNkg5ajRUVXhPQWMx?=
 =?utf-8?B?clBsNWM5RFFCMFhrc0J1aUhKanNwYkxmQlZwOGZJUGRKUFVCQ29mbXRjckpL?=
 =?utf-8?B?TCtGY3Exa3pCVE8yMDFpVlczMjZ4eDR5a2RMWStESjAvYUhwMWFhQ0RlNHN4?=
 =?utf-8?B?OU9sWHVwS0Z5cStzUisxcGtsdUNvNXRLR3ZCcE5aYk9QUmU5K2FtQlhhZFhS?=
 =?utf-8?B?cndQS3J2Skp4K2l6bHJKNUg4bmkrdnJNYTk0OGllTkFsNmhKTjJNdXBKY1FO?=
 =?utf-8?B?MndoQkRHcDREbnd4S3pJNXlvbHhFZlZwT0JveXB6SDg1VnZuN3hseVg0SSsx?=
 =?utf-8?B?UGJ5K0UzK3ZucG5Ja1E2NUtSdVlVRTBUQTdhazJndGh4enZ1bzZ0QTVCSE1R?=
 =?utf-8?B?VjhUS3grcFA5UWI2R2xkYXA4MHZReDYvYmpZUE84amNVSHNRY0Q2R2FPV2Vr?=
 =?utf-8?B?bm85TSt1QytNU2VTSHJ4emkwajNtdXZVck1JVHlHbmJCVGhpVFFwRjBpVm83?=
 =?utf-8?B?Rno5T0hFMVR2blpBRUwyWER6VFF5Q1RzSmtwa0lVOW5qRW1JeFpoYTM4YzFu?=
 =?utf-8?B?bThnRkNVOFVVeEk3VFB0V2ZMdGhSQXArcWFFcjE3Rk1NUnUvR1hxNmxPU21X?=
 =?utf-8?B?K25WOFRra3JJdm1Oc245RzBCajRjY1FkSWVDNGdkRkdCL2thOUx6Mk8zVm9v?=
 =?utf-8?B?WFdTTlZ3VkZHWmZ0d2tmOUpHQzhGU2lhYVg2b2lEblgzN0QzaEYxSnhHREpk?=
 =?utf-8?B?Y1FadEpWa1FBWjVEQ083NWc5TFJRdm9TVTcvSUw2bCs0TlFTbHpoQ09ZT2Vj?=
 =?utf-8?B?SXBSWVBSaTcvTm92QUdaT01MNkJDYXExek54dURDOWtmeWVTRUtrVm1FamRF?=
 =?utf-8?B?WndRR3VFZlY2a0ZPalZaNk5VS1VFTy9tdlNYRjViTm4rK1diakRaWkxHNTJn?=
 =?utf-8?B?ZzBGV2dscUtsMHE4Sy9JTGdIcWR2cGltcWUvY0poSUZjQU1ITGFCbFpoL3Ur?=
 =?utf-8?B?TUg2T3N2dnFUSnR5dFdHaWtpbkJ2THJkRk5yU2FYS2crWFBXdWtGbGljdUpW?=
 =?utf-8?B?OWNjNmNQSnBDdndOS2UvZFZNMVFoYzBwRWo3YzE1SlNhOGVLbzhNa29oc0Zq?=
 =?utf-8?B?dkhFMHdDNlVtNldQT0ZZN1U0TzBKdHdSVzVaM2ZwcUdtcENkUGNweDhFUWJu?=
 =?utf-8?B?WG5qTVAycW1OS01ONzcrOWNtT0lkNmRlWnVBM3J2ckxya0krWWdibzNwMzhL?=
 =?utf-8?B?SEh5aVh3cWxsVU9rQXFEcFU3WnkxVGtuRWJGVDVyQ2RWVmVqOXFCUVFmWm91?=
 =?utf-8?B?anc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 184d9532-dd3a-45d9-6c14-08dc39169d3f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Feb 2024 11:07:27.3452 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ob9zHMijhHqsLvQex9a672KQT2DV5STO7k8yNa9TNBOTrzEqYKmIlJP8BbOpyvSTlGsTPW1Rpz03aYtPFrlL2iRUAPyyhXlh3rT2fBQIf+A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8457
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
> Add necessary function definitions to compute AS SDP data.
> The new intel_dp_compute_as_sdp function computes AS SDP
> values based on the display configuration, ensuring proper
> handling of Variable Refresh Rate (VRR).
>
> --v2:
> - Added DP_SDP_ADAPTIVE_SYNC to infoframe_type_to_idx(). [Ankit]
> - Separated patch for intel_read/write_dp_sdp. [Ankit]
> - _HSW_VIDEO_DIP_ASYNC_DATA_A should be from ADL onward. [Ankit]
> - Fixed indentation issues. [Ankit]
>
> --v3:
> - Added VIDEO_DIP_ENABLE_AS_HSW flag to intel_dp_set_infoframes.
>
> --v4:
> - Added HAS_VRR check before writing AS SDP.
>
> --v5:
> Added missed HAS_VRR check before reading AS SDP.
>
> --v6:
> - Used Adaptive Sync sink status as a check for read/write SDP. (Ankit)
>
> --v7:
> - Remove as_sdp_enable from crtc_state.
> - Add a comment mentioning current support of
>    DP_AS_SDP_AVT_FIXED_VTOTAL.
> - Add state checker for AS_SDP infoframe enable.
>
> Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_dp.c | 25 +++++++++++++++++++++++++
>   1 file changed, 25 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index 7eb83924f3fe..1cd3cc0d0c0b 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -2626,6 +2626,30 @@ static void intel_dp_compute_vsc_colorimetry(const struct intel_crtc_state *crtc
>   	vsc->content_type = DP_CONTENT_TYPE_NOT_DEFINED;
>   }
>   
> +static void intel_dp_compute_as_sdp(struct intel_dp *intel_dp,
> +				    struct intel_crtc_state *crtc_state,
> +				    const struct drm_connector_state *conn_state)

Drop conn_state, it is not used in the function.

Also remove fullstop in subject line.

With the above addressed, this is:

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


> +{
> +	struct drm_dp_as_sdp *as_sdp = &crtc_state->infoframes.as_sdp;
> +	struct intel_connector *connector = intel_dp->attached_connector;
> +	const struct drm_display_mode *adjusted_mode =
> +		&crtc_state->hw.adjusted_mode;
> +	int vrefresh = drm_mode_vrefresh(adjusted_mode);
> +
> +	if (!intel_vrr_is_in_range(connector, vrefresh) ||
> +	    !intel_dp_as_sdp_supported(intel_dp))
> +		return;
> +
> +	/* Currently only DP_AS_SDP_AVT_FIXED_VTOTAL mode supported */
> +	as_sdp->sdp_type = DP_SDP_ADAPTIVE_SYNC;
> +	as_sdp->length = 0x9;
> +	as_sdp->mode = DP_AS_SDP_AVT_FIXED_VTOTAL;
> +	as_sdp->vtotal = adjusted_mode->vtotal;
> +	as_sdp->target_rr = 0;
> +	as_sdp->duration_incr_ms = 0;
> +	as_sdp->duration_incr_ms = 0;
> +}
> +
>   static void intel_dp_compute_vsc_sdp(struct intel_dp *intel_dp,
>   				     struct intel_crtc_state *crtc_state,
>   				     const struct drm_connector_state *conn_state)
> @@ -2951,6 +2975,7 @@ intel_dp_compute_config(struct intel_encoder *encoder,
>   		g4x_dp_set_clock(encoder, pipe_config);
>   
>   	intel_vrr_compute_config(pipe_config, conn_state);
> +	intel_dp_compute_as_sdp(intel_dp, pipe_config, conn_state);
>   	intel_psr_compute_config(intel_dp, pipe_config, conn_state);
>   	intel_dp_drrs_compute_config(connector, pipe_config, link_bpp_x16);
>   	intel_dp_compute_vsc_sdp(intel_dp, pipe_config, conn_state);
