Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACFE486FE5F
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 11:07:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFCB510FF23;
	Mon,  4 Mar 2024 10:07:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dR/Ch4H/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE92410FF20;
 Mon,  4 Mar 2024 10:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709546852; x=1741082852;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jIzDNmV9naetbnGyYgoecmxLktKNQVz1YSFPeDmFBCI=;
 b=dR/Ch4H/A4uJypnIeinzjSaViBKG7D4ZSByNfRZhke5I+KXAivDo9Qiv
 6mj5jbmzWJjHjv4Eldf2TJfE07ScD24OcF7sNCBARYf2twztWc9Y06dNW
 IkYgiv/q3ikd0uiqITkvKgIlvJ9RpqmjZ7tenutjV9/wdiPaftXqVz4UN
 BWX09LRwYmidk0jXmgFvHEanKCXh0Olo8obEr4l0UNSRPwdldXhPyF6ds
 gz5zruSvsMZTwyHBqaunQDSujZcjsUQXIDa0l3sU+626NbyQzx3JH9Z0h
 fjhSxZgOD1ij7FZGlkAEODaG9wRbvBZ5UznmoDbCdW/e5HRgXvXZi0NeC w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="4192380"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="4192380"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 02:07:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; d="scan'208";a="13608270"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Mar 2024 02:07:30 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Mar 2024 02:07:30 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 4 Mar 2024 02:07:30 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 4 Mar 2024 02:07:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cBA2zjtuLwsy/h+ZRmc9jdwlOlyKZea1sos8aRH0BDL2V8y90ollrJ26EFJC9+uI96DoCl6MCtUoMMCzIezMFAmLqD1c/37k3Lu1xG20rUgNwXv/ceSGzm20+tEnOITVRdcU+aKl599UM6YT4fYWglwA5Dh8476mXSPSung1CaziYTAMuU8Aje7zpu2WCq86gDoYW6gJ0uv+Lyj8uwc1k630/+eqUqOkAVeTC1K4ZwQjAanG86Q2dha/p7gnBJzfQkJEfyePOy1TTNX0Q+7kK15w7h7NXne+QrHgamBwUmdfoAl+OfF+mF6h+YUcHGLxhh8yFTr7Fi62+zcWP8vWHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ai5dbExSKpMztJqrrnK7/xfYainef87DFhgTYXNVW9I=;
 b=YTDxMEKLnYneLKheW3UBajergKf8xPNcd2PG1m82ZlJUziGlBdeMs84cNYAnj2oFBlrrOpIeazxoTofr1ZWhrPy5LHZRpcbcXOf7JH/uofC2Gabgg1MZTb2a8IEEZwf7Y9fVQdyPvqYbtxa2lvKQsWlL9g3dhEBIJt4CWUfP89zaULI/ESewwRmn+K7EpcO92sAYiOTvLEvYtelVNZBaZMBq9E47+BDjhQ6TEAtgMY9hfDHKMr/4vu9wA08pP5u2KgIiP7Xtvnt7+yf3oz2hjtXy6TVfckKLMIU3VQnTWmD0pjx92dVDmRaYNLRj+12hfDQrB1CUBCpL+u/6O8Aefw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by CY8PR11MB6868.namprd11.prod.outlook.com (2603:10b6:930:5c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.22; Mon, 4 Mar
 2024 10:07:28 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::12b:4490:b758:75c2]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::12b:4490:b758:75c2%7]) with mapi id 15.20.7362.019; Mon, 4 Mar 2024
 10:07:28 +0000
Message-ID: <e42ab36d-5cfb-439c-8f30-61f4fad747e5@intel.com>
Date: Mon, 4 Mar 2024 15:37:20 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 4/9] drm/i915/dp: Add Read/Write support for Adaptive
 Sync SDP
Content-Language: en-US
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>, <jani.nikula@intel.com>
References: <20240301084503.2971826-1-mitulkumar.ajitkumar.golani@intel.com>
 <20240301084503.2971826-5-mitulkumar.ajitkumar.golani@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20240301084503.2971826-5-mitulkumar.ajitkumar.golani@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0045.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:22::20) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|CY8PR11MB6868:EE_
X-MS-Office365-Filtering-Correlation-Id: 64ebf65d-204e-4bff-463c-08dc3c32e5af
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /hOeDUuIYCSuhC/L2ad340X+bSPQ6+UNznETTTwUyLcuSCgTRjYG/Py7gz0nM6o7pDtkitbaSg35y9jvi3EckwoJwIVehytz1WwYl/Gke8pfP5HOVZdQCni3lR/SEMjKg4wxIovBte7oQU9RY9yT6KBKI1Hz7kQAXJjLWfLZMVWjboFzJzuynHVbTwYu0pp4gzKoqfSjn5y61CXupQEQY2aDcLFy6SCmPrGUfiP26l17ib00isGidOaimS44etz0K8IYzEtRqnQxzdoz7u+tayrxskFVPudO1PuKuunjEzlst0TlzYZ3pulqCwD+4wIcwW55uUG7oM65O4/VZC8DtE+WcsduydmNi2YnIxznYNDk0d5Xnb4QiGUoYgZhNevzZFzBypJ1knF5XD3ujmKcWrB9gdGVrNbS6qu7eMblSrkVaV4yaNquZnriVXXn4b4/WGb26tI0R6EyyX2a909L88IZS9FiWa84g1rCHTKUAevTqT01S0+QwgJCrnFQMntIlyjZlaiX7W+W0F9FOQ8cNXQyHVT+4tvxvUkC/Bp+kt6yUfqccQBa+P9x4B9TerTlMiC3t6phLucgNmjG4c68oGg8MXWa97GkP2eygxBktVWJhm192LNXkPR46mTU35WJa81XqqhuHvPxSpUELlzCCul9iEW6+Y+M4NF6PRgoOn0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TzdvZVY1ckJlMHNpZ3dYZDMwTUcwOE95cVpyMjMxMmFBeFhYTlRGb0lHU3V1?=
 =?utf-8?B?QkdoTkVvYnRxTWtRaFdyWXE3RlhoWm0rSVkxbGtFWVhiMmNrcmZNTm5ETSto?=
 =?utf-8?B?eFU5S0c2TGNPSU4xZ2M0aTdlV1lidmROODRaK2dIckdDVUZvVXFFNjdYSFdV?=
 =?utf-8?B?Z0NJWStDd2p0WmVIWWNVU1FGTVYzOW15MUF1cHJkZ20xVmxPL2UxZXZBNlZX?=
 =?utf-8?B?djNNMTdIcG1SNjJ1bTdTcmt2cjRnQXBnYVY0aVNkdmtrWnM2Mkp5RmVUcmVv?=
 =?utf-8?B?bkFWS0JhN2poR0xaTXBBb2FZWGpjZy9hUHd4WWw0bjB6WDRTZjFKNVJKb0lH?=
 =?utf-8?B?MTE1d3lWdFhISHBiUkJQYnBHVjhmeDFsRU0yWVE2WE9MQkZBY0lEWmpHWEND?=
 =?utf-8?B?T2N4cHlOZHN3Tmt1eW5vYWduWVp2Q2U3a3FIenlBWXJ6YkRkY2l1ajBTYlAw?=
 =?utf-8?B?QkdvbTRaRFJmam9iaUhscDJYMmM1MVViNVlZaHZOTGY4MURBdGcvU251U2ZK?=
 =?utf-8?B?MnErbGdWV2dsWktRcitkM3hCNXBJMEYzRTVKMEdnOERoZVVOcDkxL04rT05i?=
 =?utf-8?B?ZmthSS9WZXBGdEx2ZzdMbXNoRWJyd0lEOHY2Um0wVGx4KzViRktDSEVtcHpu?=
 =?utf-8?B?S012dDNTeHF4MENVQ3kxaDBJSWtaVTE1b0hMKzF0RmZHSitWZ3lwTTRWZnFS?=
 =?utf-8?B?dmRKc08reGpsaVBNYjhxWVFGUFlSTDFRdkRlQnVlR2RlWWRCWU1QUG55NHdR?=
 =?utf-8?B?VytRYTJPV3hWWGpPMVdHbnZoUmI2OWwwNUVDSXczNlUzZWIxdVJnVTRNOVlx?=
 =?utf-8?B?UUhsQTlRNkRQZkJ5OVVHYW1ubXJ1cGt4K0dNUHpta3NHaE44N1hYQURSd0pt?=
 =?utf-8?B?eWtGSzBoNVBEZU4zalFuMkZqaEFKQkh6dGxYa0ppVkRudnliU0tjcWJLdHZr?=
 =?utf-8?B?Mk50ZHhZZ2R5RUtOUmZwRTZNQUVoSk42T2hsckEzRTBjbm5Va2h2eGdZZkFr?=
 =?utf-8?B?WXlqL2VldlVxYmlXS2Y0eVRBV0M5YjBySDB4bTdpM1hyTlJCRGI3VzBGempM?=
 =?utf-8?B?NzV2MmpiSGp5Umg2TklsYkpsVzF3K2pqSGdYems5S2thRzNtaTR0SFhTenFH?=
 =?utf-8?B?Rnk4alJoUWRmSjQ4R2FVaXp4aU51QUdOV29KaDE3cXN4eWsydDNQRWtrSzV5?=
 =?utf-8?B?NWh0djJ3aHV1WXFCUFNrYm9RSmhmTWJjT0JyRWM5aVZQOGZlVUs5akJ2YTBR?=
 =?utf-8?B?dkMwdml4bndmUWEvM243emExV0NadUIzbDdaZUxBUWJRRS9jK1U5RmtWRlAw?=
 =?utf-8?B?K3BYM0IzK0ZOTnJtRE1GNWI2VFJRVTNYVEpaNzRHZGNKcWZ3TnBDczBnb0tH?=
 =?utf-8?B?TzZaaXU3NHNuOVNlbEhteXM5OEFKdzVNWEoxSEphMStiOVNNM2lid20wam83?=
 =?utf-8?B?aVFKT1NmejBLWU9XS0RHNFNFRXJLMXpyMi9rVWdvRS9CT0tra2hZKzJwck54?=
 =?utf-8?B?QzYwc3V6clFmNzI0eXYxRXlkMXBrUnZQcDZrZmdOWU1LWnQ4MTV5ZTY3RlU2?=
 =?utf-8?B?QXE4L0lldVJtWExZbSthaWlwQWlyNkgwbW50V0k5NnRMTUF5a2JKdkxxQm9F?=
 =?utf-8?B?MU9tNU43SFl6Y2hUY25GNzJTM3cxS3ZtaE5XRVFCMms4Z3RvaStFK3g5OE4z?=
 =?utf-8?B?YUZ1RlljYmtGYmVzVFdPa3VKZ0RZa2RQVnlRcmdDZ2lyT3FTREZHTzN5ZlNo?=
 =?utf-8?B?TVZyTUlkOU5CRVhyb0thNVlYelFWNXpnSTFZY24yTGI2NjFxaUNtNFRvRkh6?=
 =?utf-8?B?V3BsaDV6V0Qvdm1KTmt2N084bmJVN0dxdzNhQ1ViU3d4Q05IUWRCS2lid3p1?=
 =?utf-8?B?NEVoNjM1Qkk0NUcvdlJCZUUxWXVmTENVK2VWeUZ4MlB0d0hrQ3JsL2FZajNI?=
 =?utf-8?B?VEd3Vldra1lXTWx6V3Vjc3ZiZEFvVWZ2RGZHMkRSaWZlcXVGOGpTTzNsWUpj?=
 =?utf-8?B?NnJ5ODZuSzlrdG0ySDFJb2wwQWFyK1kvSkRVMFdqL3RCTU41a2FpeW83aXlr?=
 =?utf-8?B?RFZITFB4OElWUXovVElJT1k3NERWSTNHWm56QnFwejR5TmhtaUludTZicTd5?=
 =?utf-8?B?U3BvSkl5NTY4QUVrbWJyaUM5aGlIM3ZrWmdHZlFHa09zQ3N1cmxweHl2THlV?=
 =?utf-8?B?UVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 64ebf65d-204e-4bff-463c-08dc3c32e5af
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2024 10:07:28.0020 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xaeYZR0vD66Fcc03w04cqy2ZvJ/P4hWMTZgJkGD6wJPSW+GDgD8DoYnUEpoMQRo2R0BXwLXis3yGl21ZpPUMbBRy4YzxSv/rBGWBzE2uyUE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6868
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


On 3/1/2024 2:14 PM, Mitul Golani wrote:
> Add the necessary structures and functions to handle reading and
> unpacking Adaptive Sync Secondary Data Packets. Also add support
> to write and pack AS SDP.
>
> --v2:
> - Correct use of REG_BIT and REG_GENMASK. [Jani]
> - Use as_sdp instead of async. [Jani]
> - Remove unrelated comments and changes. [Jani]
> - Correct code indent. [Jani]
>
> --v3:
> - Update definition names for AS SDP which are starting from
> HSW, as these defines are applicable for ADLP+.(Ankit)
>
> --v4:
> - Remove as_sdp_mode from crtc_state.
> - Drop metadata keyword.
> - For consistency, update ADL_ prefix or post fix as required.
>
> --v5:
> - Check if AS_SDP bit is set in crtc_state->infoframes.enable. If not
>    return.
> - Check for HAS_AS_SDP() before setting VIDEO_DIP_ENABLE_AS_ADL mask.
>
> --v6:
> - Rename intel_read_dp_infoframe_as_sdp to intel_read_dp_as_sdp.
> -
>
> Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> ---
>   .../drm/i915/display/intel_display_device.h   |  1 +
>   drivers/gpu/drm/i915/display/intel_dp.c       | 91 +++++++++++++++++++
>   drivers/gpu/drm/i915/display/intel_hdmi.c     | 14 ++-
>   drivers/gpu/drm/i915/i915_reg.h               |  8 ++
>   include/drm/display/drm_dp_helper.h           |  2 +-
>   5 files changed, 114 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display_device.h b/drivers/gpu/drm/i915/display/intel_display_device.h
> index fe4268813786..6399fbc6c738 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_device.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_device.h
> @@ -68,6 +68,7 @@ struct drm_printer;
>   #define HAS_TRANSCODER(i915, trans)	((DISPLAY_RUNTIME_INFO(i915)->cpu_transcoder_mask & \
>   					  BIT(trans)) != 0)
>   #define HAS_VRR(i915)			(DISPLAY_VER(i915) >= 11)
> +#define HAS_AS_SDP(i915)		(DISPLAY_VER(i915) >= 13)
>   #define INTEL_NUM_PIPES(i915)		(hweight8(DISPLAY_RUNTIME_INFO(i915)->pipe_mask))
>   #define I915_HAS_HOTPLUG(i915)		(DISPLAY_INFO(i915)->has_hotplug)
>   #define OVERLAY_NEEDS_PHYSICAL(i915)	(DISPLAY_INFO(i915)->overlay_needs_physical)
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index 6ece2c563c7a..99732ac1475d 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -4127,6 +4127,32 @@ intel_dp_needs_vsc_sdp(const struct intel_crtc_state *crtc_state,
>   	return false;
>   }
>   
> +static ssize_t intel_dp_as_sdp_pack(const struct drm_dp_as_sdp *as_sdp,
> +				    struct dp_sdp *sdp, size_t size)
> +{
> +	size_t length = sizeof(struct dp_sdp);
> +
> +	if (size < length)
> +		return -ENOSPC;
> +
> +	memset(sdp, 0, size);
> +
> +	/* Prepare AS (Adaptive Sync) SDP Header */
> +	sdp->sdp_header.HB0 = 0;
> +	sdp->sdp_header.HB1 = as_sdp->sdp_type;
> +	sdp->sdp_header.HB2 = 0x02;
> +	sdp->sdp_header.HB3 = as_sdp->length;
> +
> +	/* Fill AS (Adaptive Sync) SDP Payload */
> +	sdp->db[0] = as_sdp->mode;
> +	sdp->db[1] = as_sdp->vtotal & 0xFF;
> +	sdp->db[2] = (as_sdp->vtotal >> 8) & 0xFF;
> +	sdp->db[3] = as_sdp->target_rr;

Use as_sdp->target_rr & 0xFF;


> +	sdp->db[4] = (as_sdp->target_rr >> 8) & 0x3;
> +
> +	return length;
> +}
> +
>   static ssize_t
>   intel_dp_hdr_metadata_infoframe_sdp_pack(struct drm_i915_private *i915,
>   					 const struct hdmi_drm_infoframe *drm_infoframe,
> @@ -4226,6 +4252,10 @@ static void intel_write_dp_sdp(struct intel_encoder *encoder,
>   							       &crtc_state->infoframes.drm.drm,
>   							       &sdp, sizeof(sdp));
>   		break;
> +	case DP_SDP_ADAPTIVE_SYNC:
> +		len = intel_dp_as_sdp_pack(&crtc_state->infoframes.as_sdp, &sdp,
> +					   sizeof(sdp));
> +		break;
>   	default:
>   		MISSING_CASE(type);
>   		return;
> @@ -4247,6 +4277,10 @@ void intel_dp_set_infoframes(struct intel_encoder *encoder,
>   	u32 dip_enable = VIDEO_DIP_ENABLE_AVI_HSW | VIDEO_DIP_ENABLE_GCP_HSW |
>   			 VIDEO_DIP_ENABLE_VS_HSW | VIDEO_DIP_ENABLE_GMP_HSW |
>   			 VIDEO_DIP_ENABLE_SPD_HSW | VIDEO_DIP_ENABLE_DRM_GLK;
> +
> +	if (HAS_AS_SDP(dev_priv))
> +		dip_enable |= VIDEO_DIP_ENABLE_AS_ADL;
> +
>   	u32 val = intel_de_read(dev_priv, reg) & ~dip_enable;
>   
>   	/* TODO: Sanitize DSC enabling wrt. intel_dsc_dp_pps_write(). */
> @@ -4268,6 +4302,36 @@ void intel_dp_set_infoframes(struct intel_encoder *encoder,
>   	intel_write_dp_sdp(encoder, crtc_state, HDMI_PACKET_TYPE_GAMUT_METADATA);
>   }
>   
> +static
> +int intel_dp_as_sdp_unpack(struct drm_dp_as_sdp *as_sdp,
> +			   const void *buffer, size_t size)
> +{
> +	const struct dp_sdp *sdp = buffer;
> +
> +	if (size < sizeof(struct dp_sdp))
> +		return -EINVAL;
> +
> +	memset(as_sdp, 0, sizeof(*as_sdp));
> +
> +	if (sdp->sdp_header.HB0 != 0)
> +		return -EINVAL;
> +
> +	if (sdp->sdp_header.HB1 != DP_SDP_ADAPTIVE_SYNC)
> +		return -EINVAL;
> +
> +	if (sdp->sdp_header.HB2 != 0x02)
> +		return -EINVAL;
> +
> +	if ((sdp->sdp_header.HB3 & 0x3F) != 9)
> +		return -EINVAL;
> +
> +	as_sdp->mode = sdp->db[0] & DP_ADAPTIVE_SYNC_SDP_OPERATION_MODE;
> +	as_sdp->vtotal = ((u64)sdp->db[2] << 32) | (u64)sdp->db[1];


Should be left shifted by 8 instead of 32, and drop casting to u64.

> +	as_sdp->target_rr = (u64)sdp->db[3] | ((u64)sdp->db[4] & 0x3);
> +
> +	return 0;
> +}
> +
>   static int intel_dp_vsc_sdp_unpack(struct drm_dp_vsc_sdp *vsc,
>   				   const void *buffer, size_t size)
>   {
> @@ -4338,6 +4402,29 @@ static int intel_dp_vsc_sdp_unpack(struct drm_dp_vsc_sdp *vsc,
>   	return 0;
>   }
>   
> +static void
> +intel_read_dp_as_sdp(struct intel_encoder *encoder,
> +		     struct intel_crtc_state *crtc_state,
> +		     struct drm_dp_as_sdp *as_sdp)
> +{
> +	struct intel_digital_port *dig_port = enc_to_dig_port(encoder);
> +	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
> +	unsigned int type = DP_SDP_ADAPTIVE_SYNC;
> +	struct dp_sdp sdp = {};
> +	int ret;
> +
> +	if ((crtc_state->infoframes.enable &
> +	     intel_hdmi_infoframe_enable(type)) == 0)
> +		return;
> +
> +	dig_port->read_infoframe(encoder, crtc_state, type, &sdp,
> +				 sizeof(sdp));
> +
> +	ret = intel_dp_as_sdp_unpack(as_sdp, &sdp, sizeof(sdp));
> +	if (ret)
> +		drm_dbg_kms(&dev_priv->drm, "Failed to unpack DP AS SDP\n");
> +}
> +
>   static int
>   intel_dp_hdr_metadata_infoframe_sdp_unpack(struct hdmi_drm_infoframe *drm_infoframe,
>   					   const void *buffer, size_t size)
> @@ -4444,6 +4531,10 @@ void intel_read_dp_sdp(struct intel_encoder *encoder,
>   		intel_read_dp_hdr_metadata_infoframe_sdp(encoder, crtc_state,
>   							 &crtc_state->infoframes.drm.drm);
>   		break;
> +	case DP_SDP_ADAPTIVE_SYNC:
> +		intel_read_dp_as_sdp(encoder, crtc_state,
> +				     &crtc_state->infoframes.as_sdp);
> +		break;
>   	default:
>   		MISSING_CASE(type);
>   		break;
> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
> index 90d2236fede3..18c35dd43ecb 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
> @@ -114,6 +114,8 @@ static u32 g4x_infoframe_enable(unsigned int type)
>   		return VIDEO_DIP_ENABLE_GAMUT;
>   	case DP_SDP_VSC:
>   		return 0;
> +	case DP_SDP_ADAPTIVE_SYNC:
> +		return 0;
>   	case HDMI_INFOFRAME_TYPE_AVI:
>   		return VIDEO_DIP_ENABLE_AVI;
>   	case HDMI_INFOFRAME_TYPE_SPD:
> @@ -137,6 +139,8 @@ static u32 hsw_infoframe_enable(unsigned int type)
>   		return VIDEO_DIP_ENABLE_GMP_HSW;
>   	case DP_SDP_VSC:
>   		return VIDEO_DIP_ENABLE_VSC_HSW;
> +	case DP_SDP_ADAPTIVE_SYNC:
> +		return VIDEO_DIP_ENABLE_AS_ADL;
>   	case DP_SDP_PPS:
>   		return VDIP_ENABLE_PPS;
>   	case HDMI_INFOFRAME_TYPE_AVI:
> @@ -164,6 +168,8 @@ hsw_dip_data_reg(struct drm_i915_private *dev_priv,
>   		return HSW_TVIDEO_DIP_GMP_DATA(cpu_transcoder, i);
>   	case DP_SDP_VSC:
>   		return HSW_TVIDEO_DIP_VSC_DATA(cpu_transcoder, i);
> +	case DP_SDP_ADAPTIVE_SYNC:
> +		return ADL_TVIDEO_DIP_AS_SDP_DATA(cpu_transcoder, i);
>   	case DP_SDP_PPS:
>   		return ICL_VIDEO_DIP_PPS_DATA(cpu_transcoder, i);
>   	case HDMI_INFOFRAME_TYPE_AVI:
> @@ -186,6 +192,8 @@ static int hsw_dip_data_size(struct drm_i915_private *dev_priv,
>   	switch (type) {
>   	case DP_SDP_VSC:
>   		return VIDEO_DIP_VSC_DATA_SIZE;
> +	case DP_SDP_ADAPTIVE_SYNC:
> +		return VIDEO_DIP_ASYNC_DATA_SIZE;
>   	case DP_SDP_PPS:
>   		return VIDEO_DIP_PPS_DATA_SIZE;
>   	case HDMI_PACKET_TYPE_GAMUT_METADATA:
> @@ -563,6 +571,9 @@ static u32 hsw_infoframes_enabled(struct intel_encoder *encoder,
>   	if (DISPLAY_VER(dev_priv) >= 10)
>   		mask |= VIDEO_DIP_ENABLE_DRM_GLK;
>   
> +	if (HAS_AS_SDP(dev_priv))
> +		mask |= VIDEO_DIP_ENABLE_AS_ADL;
> +
>   	return val & mask;
>   }
>   
> @@ -570,6 +581,7 @@ static const u8 infoframe_type_to_idx[] = {
>   	HDMI_PACKET_TYPE_GENERAL_CONTROL,
>   	HDMI_PACKET_TYPE_GAMUT_METADATA,
>   	DP_SDP_VSC,
> +	DP_SDP_ADAPTIVE_SYNC,
>   	HDMI_INFOFRAME_TYPE_AVI,
>   	HDMI_INFOFRAME_TYPE_SPD,
>   	HDMI_INFOFRAME_TYPE_VENDOR,
> @@ -1212,7 +1224,7 @@ static void hsw_set_infoframes(struct intel_encoder *encoder,
>   	val &= ~(VIDEO_DIP_ENABLE_VSC_HSW | VIDEO_DIP_ENABLE_AVI_HSW |
>   		 VIDEO_DIP_ENABLE_GCP_HSW | VIDEO_DIP_ENABLE_VS_HSW |
>   		 VIDEO_DIP_ENABLE_GMP_HSW | VIDEO_DIP_ENABLE_SPD_HSW |
> -		 VIDEO_DIP_ENABLE_DRM_GLK);
> +		 VIDEO_DIP_ENABLE_DRM_GLK | VIDEO_DIP_ENABLE_AS_ADL);
>   
>   	if (!enable) {
>   		intel_de_write(dev_priv, reg, val);
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index e00557e1a57f..dce276236707 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -2312,6 +2312,7 @@
>    * (Haswell and newer) to see which VIDEO_DIP_DATA byte corresponds to each byte
>    * of the infoframe structure specified by CEA-861. */
>   #define   VIDEO_DIP_DATA_SIZE	32
> +#define   VIDEO_DIP_ASYNC_DATA_SIZE	36
>   #define   VIDEO_DIP_GMP_DATA_SIZE	36
>   #define   VIDEO_DIP_VSC_DATA_SIZE	36
>   #define   VIDEO_DIP_PPS_DATA_SIZE	132
> @@ -2350,6 +2351,8 @@
>   #define   VIDEO_DIP_ENABLE_VS_HSW	(1 << 8)
>   #define   VIDEO_DIP_ENABLE_GMP_HSW	(1 << 4)
>   #define   VIDEO_DIP_ENABLE_SPD_HSW	(1 << 0)
> +/* ADL and later: */
> +#define   VIDEO_DIP_ENABLE_AS_ADL	REG_BIT(23)
>   
>   /* Panel fitting */
>   #define PFIT_CONTROL	_MMIO(DISPLAY_MMIO_BASE(dev_priv) + 0x61230)
> @@ -5040,6 +5043,7 @@
>   #define _HSW_VIDEO_DIP_SPD_DATA_A	0x602A0
>   #define _HSW_VIDEO_DIP_GMP_DATA_A	0x602E0
>   #define _HSW_VIDEO_DIP_VSC_DATA_A	0x60320
> +#define	_ADL_VIDEO_DIP_AS_DATA_A	0x60484
>   #define _GLK_VIDEO_DIP_DRM_DATA_A	0x60440
>   #define _HSW_VIDEO_DIP_AVI_ECC_A	0x60240
>   #define _HSW_VIDEO_DIP_VS_ECC_A		0x60280
> @@ -5054,6 +5058,7 @@
>   #define _HSW_VIDEO_DIP_SPD_DATA_B	0x612A0
>   #define _HSW_VIDEO_DIP_GMP_DATA_B	0x612E0
>   #define _HSW_VIDEO_DIP_VSC_DATA_B	0x61320
> +#define _ADL_VIDEO_DIP_AS_DATA_B	0x61484
>   #define _GLK_VIDEO_DIP_DRM_DATA_B	0x61440
>   #define _HSW_VIDEO_DIP_BVI_ECC_B	0x61240
>   #define _HSW_VIDEO_DIP_VS_ECC_B		0x61280
> @@ -5083,6 +5088,9 @@
>   #define GLK_TVIDEO_DIP_DRM_DATA(trans, i)	_MMIO_TRANS2(trans, _GLK_VIDEO_DIP_DRM_DATA_A + (i) * 4)
>   #define ICL_VIDEO_DIP_PPS_DATA(trans, i)	_MMIO_TRANS2(trans, _ICL_VIDEO_DIP_PPS_DATA_A + (i) * 4)
>   #define ICL_VIDEO_DIP_PPS_ECC(trans, i)		_MMIO_TRANS2(trans, _ICL_VIDEO_DIP_PPS_ECC_A + (i) * 4)
> +/*ADLP and later: */
> +#define ADL_TVIDEO_DIP_AS_SDP_DATA(trans, i)	_MMIO_TRANS2(trans,\
> +							     _ADL_VIDEO_DIP_AS_DATA_A + (i) * 4)
>   
>   #define _HSW_STEREO_3D_CTL_A		0x70020
>   #define   S3D_ENABLE			(1 << 31)
> diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
> index 10147ae96326..fae2dbf86beb 100644
> --- a/include/drm/display/drm_dp_helper.h
> +++ b/include/drm/display/drm_dp_helper.h
> @@ -130,8 +130,8 @@ void drm_dp_as_sdp_log(struct drm_printer *p,
>   void drm_dp_vsc_sdp_log(struct drm_printer *p, const struct drm_dp_vsc_sdp *vsc);
>   
>   bool drm_dp_vsc_sdp_supported(struct drm_dp_aux *aux, const u8 dpcd[DP_RECEIVER_CAP_SIZE]);
> -bool drm_dp_as_sdp_supported(struct drm_dp_aux *aux, const u8 dpcd[DP_RECEIVER_CAP_SIZE]);
>   
> +bool drm_dp_as_sdp_supported(struct drm_dp_aux *aux, const u8 dpcd[DP_RECEIVER_CAP_SIZE]);

This change again does not belong to this patch.


Regards,

Ankit


>   int drm_dp_psr_setup_time(const u8 psr_cap[EDP_PSR_RECEIVER_CAP_SIZE]);
>   
>   static inline int
