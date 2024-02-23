Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1DB886189E
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 18:01:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2C9510EC6A;
	Fri, 23 Feb 2024 17:01:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U+BwtgFb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF3FE10EC6A;
 Fri, 23 Feb 2024 17:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708707666; x=1740243666;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=rEO/uy8/JDchK0X/e8FL6QpSy80lROhWNrB22lq57mY=;
 b=U+BwtgFbfoo4rcGV7EFzSYgNdDqa4mabgzKp/i9qJGwRp+Royn0swwzA
 tH6kZcckb2+Tw4gjzg7XDwcmYQ1Lq4BWCulKAhT06XsBDl3LzA5cN1SXl
 NLA+JiEC0aMuARFooHaDD2cE4Dff0RZYjx4HoQ2t2DRIWk3EtgC82/yiC
 vQwsPP39u/8oh4wqJNYWKuTzWNWXZbG1mBGhBA54U2BaomYN1LQu+HTOF
 sxX95XCrSCrZv5xPmZjmqHRAsFmMj+dMPlAZgop5WgjMugm/dQLq9YuI4
 7wlZROYgDuaH12fZ0wuA1kzbachN3B7TYS+qg2Pr/MW6EtqUETxgQ6Y7L g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="2916222"
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="2916222"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2024 09:01:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="6439115"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Feb 2024 09:01:05 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 23 Feb 2024 09:01:03 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 23 Feb 2024 09:01:03 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 23 Feb 2024 09:01:03 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 23 Feb 2024 09:01:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TaBoK9TbRCiyvrjbHaps897SyvH58cY5UsUl/xzxRTwaPgaohJ8oFJRCm/0Vfdv+jhUsEUJTvvZ+QeCiRU3bzrFZStg5PRf3PncIYm5AeGszxDrxhDrIoUE0lvrt5TxXQ92EGV3ZEBVB8uOuDJPKB+wQZsSocSZkVgRrsJpmXKHKZ8gB+82tLqHJOBwCxCwHRe5nezZIGX9M+ww6vCtptuRwQ/JM9QrTm0UD9KwkdFvaug9gDgFGJbCU3tAxcCCTymXmRgWzxs810VxIUpgUzDAPyi4vwJG7yYTrmHhy0vedShkUDMxy3dfpS/r2lz0okBgdgckrKjltstSBBNo1gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xKZaVEEaZzXEStuYWxVfhFAAneaAnF6wwO+O5DTlfo4=;
 b=Zs8cEDsU+7oH6RBd3WQ/t8jy28mZv0B/pWkOPYm0o8SfOMuKipRNK5oKUtxNbx6vGk58yT2iHaWqjAxHdpGttb3NTMoMFWVUTSyFpg4e8QT+HjFGSMDV0zJ6Bd3WsQLFZYMrdu0YaHtDv/I8vxtME2+S+oNocwygjDhd14lcWJoJjcMJdRCC1w7SK2FB6y678g4cFI10N0rSJ4/md7KTT5afEjr6vklTykthe+9iLUv3HGnU6OXwGbjssZQoZAt8tajohhoLR/cF10kZCEjF7TpKFovrJIrz5ldhV4Tb0aIis3LAQ06fTKaYOyXSbpgOaQ46oqi9/imSh93fFJs2uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY8PR11MB6841.namprd11.prod.outlook.com (2603:10b6:930:62::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.38; Fri, 23 Feb
 2024 17:01:00 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7339.009; Fri, 23 Feb 2024
 17:01:00 +0000
Date: Fri, 23 Feb 2024 12:00:55 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, Jouni =?iso-8859-1?Q?H=F6gander?=
 <jouni.hogander@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
CC: Jani Nikula <jani.nikula@linux.intel.com>,
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tvrtko.ursulin@linux.intel.com>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, "open list:DRM PANEL DRIVERS"
 <dri-devel@lists.freedesktop.org>
Subject: Re: i915 build error on drm-misc-next
Message-ID: <ZdjPRzGLfV7RAEYu@intel.com>
References: <fe8b2841-cbf0-775e-6e74-50476b652f9f@quicinc.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fe8b2841-cbf0-775e-6e74-50476b652f9f@quicinc.com>
X-ClientProxiedBy: SJ0PR13CA0134.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::19) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CY8PR11MB6841:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e3db972-4b53-4ce6-9141-08dc349102fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: raCZFwb5WnJ137+mc9uXKxDQMOnD8fXGOm28tvAYT+H0+xnJA7r0dgpg0UiU8hMTHRVzOpDFOnd+Ey0vQRCiWSO1I+zVtvO2YEu1D+2QFETt0cxJKw2c/gz5KIcrvuL+YCfVsYmsVOi/h0CsXaBthVyZh+vunlcd4x7/2cbcsjLLPIjrZTcabDrnovDtrIumcXWy+sYDvglqU4qGaV+M9BuiR5KNZ+gStoLQOCynOufjx5PcwEL6F7U/RoecF8uu3OQRfXoW60we880L0Bby9HnlrB5xrIfxJM19M9BFttdGOipcHtdBwB2pMlof4HrUIP2yHIFtC73e7tuVkUUPo3eIOYZ74tOQRnWD184s1igZ7m6txjUqMbuTih47n2dpO4HJltIEfZ9G761kNyBlLotqUrLRVqJ/7o+Y/Zs9zJx2EfuPrdZ8oM4lzyCFRk4H09n5W5m9wC8cqp79Sc0ttRmW6vY4wHsQz3xRFFhwJd/jnnzne5Vm7cs+RPqMXW5r3jPRG/mVwrdKx9gCZqQ0oU8R8RMxHt+K7B2BICr4BZg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cVBQcGQ5NTJKY3hybVBYTmN2SGJFcFRuMzdEazdTekZQZlhyWFBZd2crZlBm?=
 =?utf-8?B?cmN1MUlCOFRxRTk5elQ1N0ZCcGo5Ui9rY2xnak1mdkk2QTVDM2MrSktYdWE3?=
 =?utf-8?B?d0VCZ1JBMWQ3UmNYQ21vdHA1TVkwQlZkVnpUR24zU2JrU3BOb1hoNWt6M1Jr?=
 =?utf-8?B?SmhDczhGeTBBVEE3TlE3bjVFZUEzSU5DZG1INTJMeklQNWFYMmsreGhZV3oz?=
 =?utf-8?B?NTVSbjhaVXRod1pORWQxUEt6SXBlTzdtSnoxZDFZRGZwWXFiWE1nKzVCcTJ1?=
 =?utf-8?B?RlpvQU1iNGF2L2t6TmZUV21Eb2FNeGlHdDduanZYMWRuVFcrdWQwWFJoSVhX?=
 =?utf-8?B?L2dHczhwbXRzRzJyNURRRWJzcDZLWkx5L1AvVTJZZVozTnNJdUtIUVZjUjgr?=
 =?utf-8?B?YkllWlB5OUNrbGpWaUZCdGF3emJGWGlPL2JvQnRvdW41ZXVaTjJxSTZocnhQ?=
 =?utf-8?B?VWExanFhVlBScGN5cnJuNGM2YVZQY1NrNDhjYWhMaWJrUlZCdkZ5dmxkN3dW?=
 =?utf-8?B?L0dxNFZlY3BKYlRta2NHRHZjVzVOMHA1cnpRQ0dXVkgvc2xiQkFsN09ISk1W?=
 =?utf-8?B?TzRET3F1Y2ZGczhkVTYyY0RldG10WlRVSHcwVjl6VXV5eUtzUjJJRTJxZ0k2?=
 =?utf-8?B?NXYyU0hPOElrUDNzVTB1WGYwbUUxd0tRZVZJV0JkQ3JuMkM0dDhnUVB5dW5o?=
 =?utf-8?B?RXFGN1dDZGdwcm0wZndBUkxKQnRHa3RtNXlmSHVENlVmYnNWM0xtZ2hxc04x?=
 =?utf-8?B?UUt5b3lremlmRHEwMkVtdnFDWjA3ZEFRcVFsR2ZqbFBsdFhsaFdpRDVoUHhO?=
 =?utf-8?B?bmtyVEE4U3FENzBITU83c2k1OHR1ak5tNkFSU25XMlI3ZDlPdGFvOEd1VDZI?=
 =?utf-8?B?NSsvZjV2Vm1JemgzRGVGb0Fzd2ZoUktCZTlkR1RhUE50NmY0UWNxYjdGWlg0?=
 =?utf-8?B?bTQwRTNibkl5QjRRa3d6d3Jic24xNnhCcS9ZNTVHYTZ3NVNjUVF5SnZZUGkx?=
 =?utf-8?B?OVFHUklKNjJnK0dTUFpoaERhV05Qc2d3WTVFU2hTNThCVTRrajZSbzkxU1dU?=
 =?utf-8?B?WVJNYlBLemREVDR6THA3OFhMQUcydGNGM2pqb2xESzVMdlhuUFN2NUN1WHYx?=
 =?utf-8?B?NzB2eVh1aU5aaWpIQWl3NUZyRzJzT2RkN21uOGwvV00vZU9XUlY0SlY5ZzlN?=
 =?utf-8?B?SHZMamFzekVMYVVubk1qbUhSam1sLzFNYUQvbm10aXhMTXBMYWZSUzBuK05V?=
 =?utf-8?B?a3N0WmhVWjJNek02RHh5U1YrSUFKZ0RKekN6a2R4cm1kaU5VTy9VV3BxMnJB?=
 =?utf-8?B?dHBpRlc0SklzQndybkRLVTNUWXFES2I4N3FLbTJkOStjSTZnNzhkRERQR2pJ?=
 =?utf-8?B?ZXNWZjE0Zy9tdW02T0FKRktDK21kK00xWC9TYUdHZ1FIdFNLZ2NldDZNTkk5?=
 =?utf-8?B?UkRRZzFjSXlubUJocVNwNTdScXl1Nmo1SUxkWjIrSXUyQXpleXFpY0R0d1Vp?=
 =?utf-8?B?VGxmVWpQR0ZYYTVhVzdSdExuamVOOHBxcW9EOUxLNVBJbjgyZzR4Rzl5RjI5?=
 =?utf-8?B?a1V5WnpNd0M3MzdHL0VjNVkxZmRlT1pMbS9uQUt6aVk1SjZzQWZWUWJra0FL?=
 =?utf-8?B?enRQTThkNmwyUjB6M0FZRGh5Z2ZJaENQaysxTU5KR1FhU28raXl4QU4wSVky?=
 =?utf-8?B?SFY3czlSQ1k1NkdtT3pNZkZyMDFib0tBeG1lUU1Pa01GdjY1a0xUUEhBMnQv?=
 =?utf-8?B?aU1BUERyZ3NvSnV0cmJWd3NESjNQYWY3Mzc2T1JxbzRkMUMxaHZIczd2RW9z?=
 =?utf-8?B?dW1xR3JOZTZtUFZsZ0JpNHhHQ0FQMGszS1lhcGpiSjNhWGxuTVJ4aFNZRnNl?=
 =?utf-8?B?d0tRQ1RZMEhhUk1tQ0o3L0NDNFFpMTdQd1J1VFBXaWhXQ1M5a1lVZzZUak1a?=
 =?utf-8?B?Nk0xUmNmWmplQnJTV24xdzY5cVc5eUJnR0RmblB6SktkdlFGcG9LdDBRdCto?=
 =?utf-8?B?aGRHOWFwSFNNL0ZGTjhTQzBLQmduUWMwU2NTSGhiWm1CYysvYmU1UEVTZVdB?=
 =?utf-8?B?L1dkaklOYXA4ajA0TmZaTXR4dkRTK1pKTHBoUmJ3blVuRVVRZXdpdkJCT215?=
 =?utf-8?Q?WsBrTupvJ/QSResFmqkoWRP/a?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e3db972-4b53-4ce6-9141-08dc349102fc
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2024 17:01:00.6707 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UHIdYAEQW0A2dEscMmoB07u5ZIPTqYByuloWxAwF8VbLfXqoAHo/bGc0hvpGSd9Jcz8+3+LUmEtS9I1QqMt8zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6841
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

On Fri, Feb 23, 2024 at 08:50:06AM -0700, Jeffrey Hugo wrote:
> With the x86_64_defconfig I see the following when building drm-misc-next:
> 
>   CC      drivers/gpu/drm/i915/display/intel_crt.o
>   CC      drivers/gpu/drm/i915/display/intel_cx0_phy.o
>   CC      drivers/gpu/drm/i915/display/intel_ddi.o
>   CC      drivers/gpu/drm/i915/display/intel_ddi_buf_trans.o
>   CC      drivers/gpu/drm/i915/display/intel_display_device.o
>   CC      drivers/gpu/drm/i915/display/intel_display_trace.o
>   CC      drivers/gpu/drm/i915/display/intel_dkl_phy.o
>   CC      drivers/gpu/drm/i915/display/intel_dp.o
>   CC      drivers/gpu/drm/i915/display/intel_dp_aux.o
>   CC      drivers/gpu/drm/i915/display/intel_dp_aux_backlight.o
>   CC      drivers/gpu/drm/i915/display/intel_dp_hdcp.o
>   CC      drivers/gpu/drm/i915/display/intel_dp_link_training.o
>   CC      drivers/gpu/drm/i915/display/intel_dp_mst.o
>   CC      drivers/gpu/drm/i915/display/intel_dsi.o
>   CC      drivers/gpu/drm/i915/display/intel_dsi_dcs_backlight.o
>   CC      drivers/gpu/drm/i915/display/intel_dsi_vbt.o
>   CC      drivers/gpu/drm/i915/display/intel_dvo.o
>   CC      drivers/gpu/drm/i915/display/intel_gmbus.o
>   CC      drivers/gpu/drm/i915/display/intel_hdmi.o
>   CC      drivers/gpu/drm/i915/display/intel_lspcon.o
>   CC      drivers/gpu/drm/i915/display/intel_lvds.o
>   CC      drivers/gpu/drm/i915/display/intel_panel.o
>   CC      drivers/gpu/drm/i915/display/intel_pps.o
> drivers/gpu/drm/i915/display/intel_dp.c: In function
> ‘intel_write_dp_vsc_sdp’:
> drivers/gpu/drm/i915/display/intel_dp.c:4232:15: error: implicit declaration
> of function ‘intel_dp_vsc_sdp_pack’; did you mean ‘drm_dp_vsc_sdp_pack’?
> [-Werror=implicit-function-declaration]
>  4232 |         len = intel_dp_vsc_sdp_pack(vsc, &sdp, sizeof(sdp));
>       |               ^~~~~~~~~~~~~~~~~~~~~
>       |               drm_dp_vsc_sdp_pack
> 
> Is this a known issue?

o.O - what a mistery!

it looks that drm-misc-next has only part of the patch:
31a5b6ed88c7 ("drm/i915/display: Unify VSC SPD preparation")

without the patch itself...

I couldn't even trace back to understand how the declaration is
gone from the drm-misc-next...

> 
> -Jeff
