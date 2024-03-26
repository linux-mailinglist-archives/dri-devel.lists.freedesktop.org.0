Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D00C288C29F
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 13:53:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 593D910E8A0;
	Tue, 26 Mar 2024 12:52:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IUx4yDf4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37F4710E8A0;
 Tue, 26 Mar 2024 12:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711457575; x=1742993575;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TCsdmQjSHu99LvWlKPVm8BflvtpgLcsi8/8JZ/y/XP8=;
 b=IUx4yDf4uZ09qfPtLtD1k12Ag1DMiOPsRQPjbxT4dHs55PPz6JSeqyWd
 BVDma7ic71DafrxJLB3xJIylgTC0Dj+FDhzm7+JTXzvFVI8RqCv1b5UIm
 n1hDcSChAOEtOkpZOmpuJdQ8ZRsq2O+vv52Ri4rPz6POL6VB8i9v+IHwY
 XbdGfPTeciqe049ly2qwANIJz/3YkgClEbcrowfQ7H9COgnbwf+MFVBo0
 uQL64StQoVYOPVJ/m01JB/vKdoF2WLHm9QFq1WWEWSsExt5LhtfC5ryJD
 IAQKwRkt04QuvozLbVWEA+dVU7rIZakbi0ar50+SbWKRcYIgcme3/ePKW A==;
X-CSE-ConnectionGUID: rjAzsJDkQkOrMpvw70sIqw==
X-CSE-MsgGUID: UR/E9k8/Q0WN/ApuQNo0PA==
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="17232928"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; d="scan'208";a="17232928"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 05:52:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; d="scan'208";a="39061082"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Mar 2024 05:52:56 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 26 Mar 2024 05:52:53 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 26 Mar 2024 05:52:53 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 26 Mar 2024 05:52:53 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 26 Mar 2024 05:52:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dq6qA+j3LHtr3pqGaqRFKIdmnCYu5ONtfUoAR35NENqEeeYMockOkzUOJrDVv6szfL5gvRYQ6oYoeaDlS/ruNyKu8KP1GcIpQLwZndCLEdWcY76VfrscZ+qYe20EXdw+11bFzJyHWB5ACWFWKwmRtQOyIcoMyuCDPMu/I7KiDbyINPCIQaidTJgFUCh5vUf+FMR4DczEn0x/SztDZ0QLldJ+ErJfAHyCOwQ4uaRzuH9f3eGyQr0+PfcLlheU6eXE0iqlIqbNGCFg2kn/qRgalabSUqldSeLv90s2Ci0kpvDSJ8e0opcaL5XzNOFaTrjAjEUO4a7DZmpQDdc821OtkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QKE6hhRDzc4WxlhrQ12oDot790m2gkDfSfaKQVUPGxc=;
 b=BU5behLIb+iX7L7x9d0UjDTa4lfUjOWFVThuLAPLlSBriBwV0uAKwwglWgb/95KL0mpClWUcqJba1ScNWWvpsVaURoGpnZvJfxeGKSsdhoV88dnRyyJAya3+2B4OMX0zuOc62pK9D7Ud23ho2WJQF2qJlQF1Ul1Gku+Fyajfkt8eEO8R0GFyS/mSFE11yXMzGhUZscNWrM2ORpfvoOSKVTrLr8mT0MqVVKGjkB4iufKG2CHz9oKpigKbnVrIXY1hQqLzRhVkH1l11QP4BAc+Wai0FXePgt/CavpmiVgu7EJP6wT3NOsL3hOOpnWrC2zJgvoX9ZE3axtPNPTuCuJjlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by PH0PR11MB5951.namprd11.prod.outlook.com (2603:10b6:510:145::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.11; Tue, 26 Mar
 2024 12:52:51 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::31a1:93ed:8501:f2c9]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::31a1:93ed:8501:f2c9%3]) with mapi id 15.20.7409.031; Tue, 26 Mar 2024
 12:52:51 +0000
Message-ID: <6efc94fa-585d-4e2b-8bde-6e54182ad649@intel.com>
Date: Tue, 26 Mar 2024 18:22:45 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/11] drm/dp_mst: Factor out drm_dp_mst_port_is_logical()
To: Imre Deak <imre.deak@intel.com>, <intel-gfx@lists.freedesktop.org>
CC: Lyude Paul <lyude@redhat.com>, <dri-devel@lists.freedesktop.org>
References: <20240320201152.3487892-1-imre.deak@intel.com>
 <20240320201152.3487892-9-imre.deak@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20240320201152.3487892-9-imre.deak@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0048.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:98::23) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|PH0PR11MB5951:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OsJWPjqkXeukLm6BbdX+EwXG5KGsvSnpwFuzGuLvgNZiv19edjT5/y15ks4OVtikV26eNw+Uz4ObXUOHdYW4NEejKtk6ljVIYeqW61OvvIeo8C00n3MJmJNrRhkPhCKp5RUAEvJHaxiNrHPm/71Srw+Lxop87/xurT1cgB5V0rQ4Iy/sa3sHmSc8gHI0leXBfqx18wCaKNF2HqKsUdayS98PqEmLLhl59wShyLVX94MdXBSTSbm/4Opo79RtQWGZ+5x4yjNmMl1j9DjzKdEcDr8hWuZCqQghkC7pPHnDBISUxeGj+EDErp94FtgiRrA+Acr44udlQlrLicC139myWW2fHLzwXQb31h0oNjGlJseu8/Paakx/TmEog4YZjghkhqTl81S7H1Fq89vnkFA6A+14GZM2G7aOGnz8N3c8OLl8UXHvR/YpO1F+YzZef8jXO3jvYXbKglFO8iJixIN5oT3JUwRJCX1m4N2s1TR6EoLwtW+ncrnFCJ4i7X3Sm5qlb4X4gp5ZgR26RdWWDs2ObAJGrqVusJbBywxpUZJSfiflWpFNnWuKvcGxZ9xtSwR0lo4rCaQLr1SKxhg/cy5Z8wQ0R+cZTspYCzg2MmpJtkPXJiuEmDm0w7PRjgSb89/+lDWx+p994Zgul18gDdu/lKr8+fXCB3CCdU3d0yQ7FmI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QkNieVBuNjZsM1lMOUlaRWpFbHlmSzJlTjFUUGpJQjFUeVlYaGFxSlFyWlhl?=
 =?utf-8?B?YXgzcXZJNjk2ZXhPRjBKNXVqSWJvaXRMUUYzanBHV25DSTJUOUhUNlByRHd5?=
 =?utf-8?B?eFhBWVFvYXBmOXFyQUZWeHNYb0tIUFJGNWlJKzhSTWh5cGY3bE5YK3dUV0dL?=
 =?utf-8?B?UFFpTEU2TkFBajdmbUVDOTk3aE9FeWZQMDhGQ0gvNjF5MkNYUGt3UERxbjVZ?=
 =?utf-8?B?N1dTTFJEcEpabExGZUdqaXlwSmNzQXYyOGQ5Vngva1VBeFh0b095Qk1ib3Ur?=
 =?utf-8?B?VVlxUzQvOWhKRmtvT01hdDlUK0lKc0wwMDRDLzhRS2ZxMUZNMWR6ZG5zcld5?=
 =?utf-8?B?aTZOek1Ba3NBWVdFTzAwenl5c0lhc1BIZEMxUmpkeGQvSlhPQjZWS2V6Qzcz?=
 =?utf-8?B?YVQ2ZndyQlMvY0pHTkM5RjNOTU1ETnVmeDJLaWRINExwTldQV1VtZDFscUVx?=
 =?utf-8?B?NUlZTFozM00rTEtzTVBJb3M0c3I1WSsxNGRWSXZlcTJDWE1VYmFzYmU0cHpl?=
 =?utf-8?B?OGZwaW81K00xUFlEd0sza3JhWWcyS1dOYjN4QXdiSnIwUzJtWkludVoveURE?=
 =?utf-8?B?SDVEdzc1d1dqdHozVGljbDNxc3RKQUFGOFNNTnQyWCswdzZVa2RNZEFhbEV6?=
 =?utf-8?B?Q21PYThhekZjTGp6R1k1WG9scTJUQlJ3M0lhRm9WSjNlcTV4aG5mOWovWnpV?=
 =?utf-8?B?WitnazY5SGJveFk5QzFPYWRvazR6NW9LcXh5SXkydEt3eGhJY09NVjczNUNN?=
 =?utf-8?B?QXJFZVFqelFSUUhnZEhlYWpaYXgvZWRIaVRSMDFFS2hnNk93Q2FwQWZXWkJD?=
 =?utf-8?B?d2VleWxSRjhkT0thb3FqRFJqWCtCVStKWW5HY3AzYlUrZjg3d0pMN3FCSnIy?=
 =?utf-8?B?em92MXZmOExwOEVNK05vZTdVM0Fra3lxUTFWaEZFaitlR0pGZXMrVGRtWHdP?=
 =?utf-8?B?UjdQT3VRQ25WVkhwaWxXVk9aNjFjMFN5OGlQRTZhMzlzeFVvakFWNXYvd0M1?=
 =?utf-8?B?eEdXakhrMEhqYzZVTDRLY0V4N3FKTmxvNVkxd1NrTDIwTGM3OTMzaC90Qm8y?=
 =?utf-8?B?Rlp0M3FXWkhxcVhnMEo4RmZuUCtwNE5UUmFVbzN2WmQ1cW9oNnI3aUk5TnpY?=
 =?utf-8?B?d3VqK3hUTFV3V053anJRVlNsQmZaVUMzelU2Tzh6aVdMdmErRzB3V3U3MEQw?=
 =?utf-8?B?UENUZUxKbndjekQyS0xBUWNrUHpWRFRGRURiYTVCaThGWnJWcFB4T3dEUTFV?=
 =?utf-8?B?OFRkRlhPSFE4eFd2VjFlTVh3aGxNdXM1MVpveVJxSlRMTmd3SGRFVytid29x?=
 =?utf-8?B?VU44bWlhaGZnTWtNdWdGN3NzenRHKzVMdC96bWFlYzd1bzFvUlROT0FvSlEw?=
 =?utf-8?B?dEEwUGZLMWlvK1BBRGQ0dDZBdlZwVnJIUkRMWWtVTmE0MFJpWmkzclpJZTJJ?=
 =?utf-8?B?U1FVSWYzeFovWjVrNE1mRTNLV2c3M1BxMVdjWGVpcjJtUHI1Z0VabS81WHdW?=
 =?utf-8?B?NiswSFZ5QlpJTkFUS0tjV1AvR25UQnJ5RldqZjM3a2EwNWlxL3JYYnNkc2c3?=
 =?utf-8?B?SVFsZmFHZ2pDcHdKY3VKejVSRVN5Wmw3clJKaE9EWElRUkVDcHIwY2duMTc4?=
 =?utf-8?B?Wnlyd2RORXFmZkZ4czErOGQrNVRNdGJlaW5RSTJyMVFuSmRtS1lza1ZiWXJ6?=
 =?utf-8?B?RHQrSUJnMWxycFRnbmNXR29EYmU0bDduYndEYmROOExJL0dNY2FUVUwzMXRK?=
 =?utf-8?B?b001UnpUZHdYdkkvUlpKTFBYZ05HMk5GRWVBU0w0a1dHYm9zWmpXdkE0Q1JY?=
 =?utf-8?B?djlvY3NWQ2ZSeDFqWEx6SzBacDR2OUloOEpuZVBZc3B3MU1aVkQvK3RORzFJ?=
 =?utf-8?B?ejU4dkxHZ1hhSkhqYkpGcy9WVGtWbEp5RitBYklLaTlra2NYOGxvVExrbDYv?=
 =?utf-8?B?VWV1RlRXNEVEQXAveEhOcG4zOWltK2RVZnlkN2lVK2c0bVNhb0FTRDk2Vktx?=
 =?utf-8?B?bEUyeEkxaDNhUGIxOUpiUWV5dWdlczJrT1RsUTdNWEQvRlg3L2oza0NTeThQ?=
 =?utf-8?B?VzVINnRDRThkcjJJUDgvWDVKbHJFQ2lzRk1XbWhxNGRCOE5kZTYvbHhoaXNl?=
 =?utf-8?B?TUUrS1AyaEgyazhzeThuNTF2ZkhQOFRRQlNMOERUZlFSL3V2bE9tOS9yelJ0?=
 =?utf-8?B?TFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 713ed852-b995-4fc9-4376-08dc4d93a557
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2024 12:52:51.2684 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Oq2zjEMkRKkWxuD/miJqfOAZGHPWMq2MlJTNhHUj4ugGZxxuD6POH6pUr1Z/Bt5kRSZOLtUtu/RuF5SIEkVhyIsbcVymsBTcqbwfETT1Zk0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5951
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


On 3/21/2024 1:41 AM, Imre Deak wrote:
> Factor out a function to check if an MST port is logical, used by a
> follow-up i915 patch in the patchset.
>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>   drivers/gpu/drm/display/drm_dp_mst_topology.c | 6 +++---
>   include/drm/display/drm_dp_mst_helper.h       | 7 +++++++
>   2 files changed, 10 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> index 03d5282094262..6bd471a2266ce 100644
> --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> @@ -2274,7 +2274,7 @@ drm_dp_mst_port_add_connector(struct drm_dp_mst_branch *mstb,
>   
>   	if (port->pdt != DP_PEER_DEVICE_NONE &&
>   	    drm_dp_mst_is_end_device(port->pdt, port->mcs) &&
> -	    port->port_num >= DP_MST_LOGICAL_PORT_0)
> +	    drm_dp_mst_port_is_logical(port))
>   		port->cached_edid = drm_edid_read_ddc(port->connector,
>   						      &port->aux.ddc);
>   
> @@ -4213,7 +4213,7 @@ drm_dp_mst_detect_port(struct drm_connector *connector,
>   	case DP_PEER_DEVICE_SST_SINK:
>   		ret = connector_status_connected;
>   		/* for logical ports - cache the EDID */
> -		if (port->port_num >= DP_MST_LOGICAL_PORT_0 && !port->cached_edid)
> +		if (drm_dp_mst_port_is_logical(port) && !port->cached_edid)
>   			port->cached_edid = drm_edid_read_ddc(connector, &port->aux.ddc);
>   		break;
>   	case DP_PEER_DEVICE_DP_LEGACY_CONV:
> @@ -5977,7 +5977,7 @@ static bool drm_dp_mst_is_virtual_dpcd(struct drm_dp_mst_port *port)
>   		return false;
>   
>   	/* Virtual DP Sink (Internal Display Panel) */
> -	if (port->port_num >= 8)
> +	if (drm_dp_mst_port_is_logical(port))
>   		return true;
>   
>   	/* DP-to-HDMI Protocol Converter */
> diff --git a/include/drm/display/drm_dp_mst_helper.h b/include/drm/display/drm_dp_mst_helper.h
> index 3ae88a383a41f..c12f18b744d01 100644
> --- a/include/drm/display/drm_dp_mst_helper.h
> +++ b/include/drm/display/drm_dp_mst_helper.h
> @@ -927,6 +927,13 @@ int __must_check drm_dp_mst_root_conn_atomic_check(struct drm_connector_state *n
>   void drm_dp_mst_get_port_malloc(struct drm_dp_mst_port *port);
>   void drm_dp_mst_put_port_malloc(struct drm_dp_mst_port *port);
>   
> +static inline
> +bool drm_dp_mst_port_is_logical(struct drm_dp_mst_port *port)
> +{
> +	return port->port_num >= DP_MST_LOGICAL_PORT_0;
> +}
> +
> +struct drm_dp_aux *drm_dp_mst_aux_for_parent(struct drm_dp_mst_port *port);

This line should be part of next patch, where this helper is defined.

Otherwise LGTM.

With the above line removed, this is:

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


Regards,

Ankit

>   struct drm_dp_aux *drm_dp_mst_dsc_aux_for_port(struct drm_dp_mst_port *port);
>   
>   static inline struct drm_dp_mst_topology_state *
