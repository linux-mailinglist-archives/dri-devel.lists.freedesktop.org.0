Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C25B688D996
	for <lists+dri-devel@lfdr.de>; Wed, 27 Mar 2024 09:54:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6805A10F96B;
	Wed, 27 Mar 2024 08:54:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NdxFEz+M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0188F10F96B;
 Wed, 27 Mar 2024 08:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711529658; x=1743065658;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=R1IMu8DMuq1KqEMKC+H/Im/UpxfAVE2PKjyrR4nKOio=;
 b=NdxFEz+MtPWUap6/bq/LLs7MtnPu6pOyiOiPmu20VS9TpU08x1Cl93Fr
 pGQ0EH6Q4zbF3c6kQ7FSTCrDEWagCMkCGFLsQL6rE+6zo7NB7/mopQ3we
 m/iSYoPAPsaoYm/K4zVJOoFTRby5I+0gH0ZRXW0ffkUMn7pJ4EsGrYThl
 Uj0m+B1c1AiWkD5FFWoTBQvsReonzJ1nJXAi3NJgtn4H0o6e9/NFN9Z46
 oL3UDxM9VGTvazn33er8Fb489zw8hb2fYa7AP65czXwnZQ2+YEwDxC/p9
 PxmM4Z4rwmdON2JH3vp356sS35Ypkh2NjYyTuBWaIdDD7t7G5DdmxNfkC w==;
X-CSE-ConnectionGUID: wO/5cQxISZ6nl1QGxcnscA==
X-CSE-MsgGUID: BmIPMHpWSKeQlyrAtQbCSA==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="29094205"
X-IronPort-AV: E=Sophos;i="6.07,158,1708416000"; d="scan'208";a="29094205"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 01:54:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,158,1708416000"; d="scan'208";a="16612459"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Mar 2024 01:54:18 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 27 Mar 2024 01:54:17 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 27 Mar 2024 01:54:17 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 27 Mar 2024 01:54:17 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 27 Mar 2024 01:54:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EPHIvIv2bd74DbI17KUKU2r0hM3yIzOvyae+3qHt+qjRp6EvIpdDE99KYW0pqKMEkwUzqD2uw74AiXWrDBcwiQCj6JYUBiKTPO7vcbw1hhp3eNxkZ4Ysu+Yiebe6eOEUr3TsV6zNMb/zyIRHU7/jAP2Li2NjVR452+j2+QrbVtpR1YSFomrHOXG9G+RXgZSfD7hXyOtA/xm59awtpjIqSkNtSxC03Je+Fr73eyMZ5jjbgs8cXLaBdVTV2mHFMalAa50jbsRqglQmAUAfdmK+wIcAklvO4L+4liffK+A5m8j1wH6+CIR0CZNq60AigvBQxOOKoxcQYzJCJF29cmLFhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pWxqqYrAWJScEWk3hRk2ahR+qK2y/8i00uBML0HvlIo=;
 b=Xp2TgTidie7zVbZ2EXJ03Nl+pJiTY8mOVLR2Xw1P/rT0qmHO/m+ySqm/gUrTqhyee2Bhmq00w4hmIAz5ajZnvT8OVPD9LoIW0Vk3MvcwGtVauuZ47SeE/q+8T4x7LRBRjpcjYj/PjLh9Owp3mXTpfdpRZUjHrLU37ldgr4XyZkuiA7TDHI+AqxMjIOz/itfqqfPjQknX0sjuKHjtuirt/GT5Jo0GUSxqe/Qq1DDjQW4KDuUcuCV6AnJswtYr7rel2xLW6cGh2RK0KQF5K2mCJc8S8Rp5szaTR9598f8ObHAVIRvtbYLRF063N2xkkw/phHZmFTwzp7VH+B+QPVxgew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by BL1PR11MB5317.namprd11.prod.outlook.com (2603:10b6:208:309::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Wed, 27 Mar
 2024 08:54:15 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::31a1:93ed:8501:f2c9]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::31a1:93ed:8501:f2c9%3]) with mapi id 15.20.7409.031; Wed, 27 Mar 2024
 08:54:15 +0000
Message-ID: <136ca076-ee48-4f44-892e-72a1d88ac85a@intel.com>
Date: Wed, 27 Mar 2024 14:24:08 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/11] drm/i915/dp_mst: Enable HBLANK expansion quirk for
 UHBR rates
To: Imre Deak <imre.deak@intel.com>, <intel-gfx@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>
References: <20240320201152.3487892-1-imre.deak@intel.com>
 <20240320201152.3487892-12-imre.deak@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20240320201152.3487892-12-imre.deak@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BMXPR01CA0087.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:54::27) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|BL1PR11MB5317:EE_
X-MS-Office365-Filtering-Correlation-Id: 50ce6270-89d6-48fa-89f7-08dc4e3b7ac4
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jVRhIDWeLeOIxbO1zSmz0HPC3C6cFpa5vAhgj+A+a+I25npW8GCI8ML2E0TtmZOaAcx3wFsmXRooKaNxvS/CnQpD3+5285mm8duIu8hLXj8c3szm7TICP1UvK8DZj40TnMW05PC/65hEVRYHlGad/k1c59NQ7xYBe5gT0u47M+/GiMQxRLCpkBnxxa7+F1CM6x/0vEZnlhiOsthwmm4aFW4DRjg5uLP8ZOxMkGO0AEeVyI5+A15EVbed7O/WQgCkLF9r/GRrONGcZwp9b08KEkmgGW4U1pyJjpiD7aGxkD45bXanLCStecgYcoH2oPvQoFaNANzs+Lf8MGG8z557A1Zr8/bRYEUg3NQxjvAgg2jsELu6o7MoNVP3y4u5kyUSq4Z1wYqp+QIGlL+nFIiOfLQwcCG8q5YXHHoi7hgog1Y1UUxvTflyK31f/nU3EUhG2DTafU92LX9VCora/ZTqSvvicYF3qHSSgRv1Xlo+sk6d/OAcjm9JJGFzfuquDP0hYd5R1xJYGP7P7Rb4pE8Vu2vGu8tne1VxFzRlHvgAgGlIzdbtj3WRfYrgqgLYhTqYgdsIXCeYXivuxi3jvy1uUBe8tBURT7Aw2TNMG3M5Vgwa4HOGnhCpwBqu7PsB0c5HFfGNaAiTZG4yJq7YCMDNMc6haqK47MRch+301SDcRSU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Uk9WNXBjanhCR1NVUTZmZlIxeTlUaEFIOVFLWk9wUUNuRjNWcUpUWWdTUVhL?=
 =?utf-8?B?UGZ0Rlp6R3JCU1R0ZjdSZXI5NWtKcTJPMk1FNStaaWtVdU5UeDNRU2ZKeUxR?=
 =?utf-8?B?dnNQb2ZlMFFkOUN1MzdlemEzb3c2UUNtcUdoNUQvU21KamFWMGo3Yng4emRO?=
 =?utf-8?B?blV5bU00VUx1cSt4Nm4vRU9MVWh2cEFOSnhleTJaTExTbjlLUXlGZjB6Nnc1?=
 =?utf-8?B?dDRLZDVFeUo0Z0NSOTd0T21LaUh4YnZQNHh5WUVpU1VkOCtXem83Q2MwSytX?=
 =?utf-8?B?Z2V5eFJtZ0xXTCtDVjJKbDVCMEhsZ0VSZjEyT0RGbnRzN0xIRHhmd2xvSFlp?=
 =?utf-8?B?WXVRdFViWU9sOXcvNlZSYUJla1F6R3dhSGN0OU1objdpNGQxTk85VHh5MkZj?=
 =?utf-8?B?cGpONnl5WHhjSnl1MGVyV21zNUtpZU1Wa3hlSE1IajdDbHQyVGhHWjBFTGV3?=
 =?utf-8?B?QU4zOFpGTElLc3RDa3VhZmpQdHIzVFZ3d1Nyb2JaMnd2ckFuNnN1d2w4Y3ZN?=
 =?utf-8?B?WUJIQW5SN3orK29XRWZvaUtMTEFobWFmaisvdGYwaW9ocC9BbjFEYkdqT3k5?=
 =?utf-8?B?d21Ea01VRlFSWFMySmtPVDlTTHdGSUFXQlEvOG1sYnhZcENrNVZNcHJsRS9J?=
 =?utf-8?B?eWlqNU1wcHExSExLQlpjSVJRTUZTOFlZU1RjK3BuWVMvanJDK3AvaGNEV0cx?=
 =?utf-8?B?amhvVGMvc2ZwT0JWUCtkMXBURXpUMXpiMExkenpwMDRRVjRFRVFyRDgxLzBJ?=
 =?utf-8?B?eDBZcW5ZT2MrajNRYUhXV2xwWUtxRjgwQ09jbUJoazliOEdEZHZvMXkvV3hC?=
 =?utf-8?B?RHh4R3FtbXRWRGR4YkRYeWFNR1ZXdXdOZHdjalZOTCtWK1VwNVdFbFI1c1Bo?=
 =?utf-8?B?L0JJV0pkUXMwSXB3M3ZSR0cvSUtXRkdNbjFrbEdzeUJSNUZMQ0g4aDhPZTJz?=
 =?utf-8?B?SHRTZDlTMW9Rektvak1yUGlXSS84cCtkOW5DVThJQy9qQTlvVkU1N1NiVzVG?=
 =?utf-8?B?QnBGWVFDWWZEeHIwV3ltQlc4QTRaRjhHMm4rY3lrSzVtWjV0Zk1zNkppUFVJ?=
 =?utf-8?B?eitaZ1g3c2xVM1JoRmhmYTJpUUhGVzNESjNqM2kxR3ZnZEpVTXU5elZOWlMx?=
 =?utf-8?B?NHRHME14VkwrSFdmNVFvUlNOVVZMbEdCKytpYUhobDAyKzc2ODA5b1F4VE0x?=
 =?utf-8?B?ZlZ3NVdIMXhOSzlZK0MvTzZwYkV3S2UrU1R0bnZ1M0Q0ajVDZkw1MXR3SVp5?=
 =?utf-8?B?UEN1eEdkc25xWlIwVERGTjI1NkNINCtCMHRWaDhYRjR5VDJOYUkyek0ybmJ0?=
 =?utf-8?B?Njd4TlBlVWhrQ3FmTDdqRFBsb2F1ODBOMWt4UEsyMTgwQklyMHNpVW9FVUlw?=
 =?utf-8?B?bXE0Y3YyeTJjUHNFMmNTSURqdkZiQms0VGRwK3gzYmI1TjNhZ21QRVFsS0VD?=
 =?utf-8?B?ZGFicEZaVkJBTFVMbndjekpqUEFXV2pQN1lQSG1Kc2h2ZlQzSlc5d21MSWkx?=
 =?utf-8?B?ZHduVWJIbTZBSGxCWkpZcm5INi83U0p3ZC91V0dIZ2tCRTZabzhrUk9STzN3?=
 =?utf-8?B?NGloMGR0NmFWS09vcUplbkdOeE05RmM2OTFYZ3RuWlkvT1FqNEhoWWdwZ2x5?=
 =?utf-8?B?c1BscG1DK3psVkQydzAybCszV0ZOZlk2amI4ajFCTVBDd052and5dzVNbmtN?=
 =?utf-8?B?R3NYTXJ4QlRjK0hndXRHSEEzci9veFRabzM2STZrM3R6dDdWaG1OUXFSZnk4?=
 =?utf-8?B?U3B6Tm96cDNJQ1J3anpJNUprbmQvNFhCSEhpQldnb2V4djVQZ05idDZYb21F?=
 =?utf-8?B?UFh5UUhjRlN1djArRXpScGFOZW1tWnpTdnFKcEU4U0JaVnRFMEFhSDRWTjdB?=
 =?utf-8?B?b1ZLb0NBZm5mM3QrcGxLNHNDRXlQT2wzLzZZaU5PQUs1YmlCSGpkdXNpRjVH?=
 =?utf-8?B?NE02dXBBZllpSjhIYlQ4akpzN1dvS1dDZ3hZeWlkdWxiSmJBaHJDaE51ZWx2?=
 =?utf-8?B?WUx0eUtsM0NoVG9VMjFsR21HQnRMZ3pwY0pBajBPM1RTSXBPZlAxQ0pVK0c1?=
 =?utf-8?B?ajEyN0RLTDBVN3ZLZ2FXNFhJWko5OThxQTZPWk5WWjhuZlQ1UFhyb1RNUHVQ?=
 =?utf-8?B?Tmd6UUEzWEtpMk9WOUpUMXB1OXVQQUtxRG1sUTVJSEpUeitwQTVPSWNXSSt0?=
 =?utf-8?B?V3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 50ce6270-89d6-48fa-89f7-08dc4e3b7ac4
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2024 08:54:15.0718 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YI3GCDMPC46VrbGyoBi60BpsMxkV4LZwkVgLhiBozf0+/zWfYnaTPgiXMU8kEsHqn1jvhSPRcsEfgobBgSbU7FwlElxZkcIwHTO7Iq2D8uE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5317
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
> Enabling the 5k@60Hz uncompressed mode on the MediaTek/Dell U3224KBA
> monitor results in a blank screen, at least on MTL platforms on UHBR
> link rates with some (<30) uncompressed bpp values. Enabling compression
> fixes the problem, so do that for now. Windows enables DSC always if the
> sink supports it and forcing it to enable the mode without compression
> leads to the same problem above (which suggests a panel issue with
> uncompressed mode).
>
> The same 5k mode on non-UHBR link rates is not affected and lower
> resolution modes are not affected either. The problem is similar to the
> one fixed by the HBLANK expansion quirk on Synaptics hubs, with the
> difference that the problematic mode has a longer HBLANK duration. Also
> the monitor doesn't report supporting HBLANK expansion; either its
> internal MST hub does the expansion internally - similarly to the
> Synaptics hub - or the issue has another root cause, but still related
> to the mode's short HBLANK duration. Enable the quirk for the monitor
> adjusting the detection for the above differences.
>
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Imre Deak <imre.deak@intel.com>

LGTM.

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


> ---
>   drivers/gpu/drm/display/drm_dp_helper.c     |  2 ++
>   drivers/gpu/drm/i915/display/intel_dp_mst.c | 22 +++++++++++++++++----
>   2 files changed, 20 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> index f5d4be8978660..3e8e1bb59dea3 100644
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -2281,6 +2281,8 @@ static const struct dpcd_quirk dpcd_quirk_list[] = {
>   	{ OUI(0x90, 0xCC, 0x24), DEVICE_ID_ANY, true, BIT(DP_DPCD_QUIRK_DSC_WITHOUT_VIRTUAL_DPCD) },
>   	/* Synaptics DP1.4 MST hubs require DSC for some modes on which it applies HBLANK expansion. */
>   	{ OUI(0x90, 0xCC, 0x24), DEVICE_ID_ANY, true, BIT(DP_DPCD_QUIRK_HBLANK_EXPANSION_REQUIRES_DSC) },
> +	/* MediaTek panels (at least in U3224KBA) require DSC for modes with a short HBLANK on UHBR links. */
> +	{ OUI(0x00, 0x0C, 0xE7), DEVICE_ID_ANY, false, BIT(DP_DPCD_QUIRK_HBLANK_EXPANSION_REQUIRES_DSC) },
>   	/* Apple MacBookPro 2017 15 inch eDP Retina panel reports too low DP_MAX_LINK_RATE */
>   	{ OUI(0x00, 0x10, 0xfa), DEVICE_ID(101, 68, 21, 101, 98, 97), false, BIT(DP_DPCD_QUIRK_CAN_DO_MAX_LINK_RATE_3_24_GBPS) },
>   };
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> index 76a8fb21b8e52..b5224fe6cc16b 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -407,15 +407,22 @@ static int mode_hblank_period_ns(const struct drm_display_mode *mode)
>   
>   static bool
>   hblank_expansion_quirk_needs_dsc(const struct intel_connector *connector,
> -				 const struct intel_crtc_state *crtc_state)
> +				 const struct intel_crtc_state *crtc_state,
> +				 const struct link_config_limits *limits)
>   {
>   	const struct drm_display_mode *adjusted_mode =
>   		&crtc_state->hw.adjusted_mode;
> +	bool is_uhbr_sink = connector->mst_port &&
> +			    drm_dp_uhbr_channel_coding_supported(connector->mst_port->dpcd);
> +	int hblank_limit = is_uhbr_sink ? 500 : 300;
>   
>   	if (!connector->dp.dsc_hblank_expansion_quirk)
>   		return false;
>   
> -	if (mode_hblank_period_ns(adjusted_mode) > 300)
> +	if (is_uhbr_sink && !drm_dp_is_uhbr_rate(limits->max_rate))
> +		return false;
> +
> +	if (mode_hblank_period_ns(adjusted_mode) > hblank_limit)
>   		return false;
>   
>   	return true;
> @@ -431,7 +438,7 @@ adjust_limits_for_dsc_hblank_expansion_quirk(const struct intel_connector *conne
>   	const struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
>   	int min_bpp_x16 = limits->link.min_bpp_x16;
>   
> -	if (!hblank_expansion_quirk_needs_dsc(connector, crtc_state))
> +	if (!hblank_expansion_quirk_needs_dsc(connector, crtc_state, limits))
>   		return true;
>   
>   	if (!dsc) {
> @@ -1539,7 +1546,14 @@ static bool detect_dsc_hblank_expansion_quirk(const struct intel_connector *conn
>   			      DP_DPCD_QUIRK_HBLANK_EXPANSION_REQUIRES_DSC))
>   		return false;
>   
> -	if (!(dpcd[DP_RECEIVE_PORT_0_CAP_0] & DP_HBLANK_EXPANSION_CAPABLE))
> +	/*
> +	 * UHBR (MST sink) devices requiring this quirk doesn't advertise the
> +	 * HBLANK expansion support. Presuming that they perform HBLANK
> +	 * expansion internally, or are affected by this issue on modes with a
> +	 * short HBLANK for other reasons.
> +	 */
> +	if (!drm_dp_uhbr_channel_coding_supported(dpcd) &&
> +	    !(dpcd[DP_RECEIVE_PORT_0_CAP_0] & DP_HBLANK_EXPANSION_CAPABLE))
>   		return false;
>   
>   	drm_dbg_kms(&i915->drm,
