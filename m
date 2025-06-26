Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B11DAEA464
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jun 2025 19:24:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70BBF10E8C8;
	Thu, 26 Jun 2025 17:24:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QJHNciTi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 997CF10E8D4;
 Thu, 26 Jun 2025 17:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750958678; x=1782494678;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=JpmuvZSlnITVIjCB9V5WcWqTpT+yZtlF7bOMRTrAxqQ=;
 b=QJHNciTixWwGbEIKxNg+baVei1KK4cM3LV1D6FWD9wTGUvZMsCk3cjLV
 cxHAX11P8wh+IluG6szCrjh+GTB2h55HUqF6JFJgDPgZuZ7kdjgh1YHDT
 bF6fI/cJ+Co2VJATadcPJWhwrKQsa2IWqw+iZ4hmsqQedfP2EmZPnygG9
 07Gp1e39dZ9RVSB2k+6RaQrD+l+P00TohkMy4jRGr2hifwcjB26rtuASG
 wv2PS7X082PvTU0hvUQKqV8j3ITzNtlzhBVeHMjzLyAsiDPZnXjIWcO+o
 gq3jq/8oVa6Mi5UMCumKPWK0HX0LuYebKJf3iaDDB3U4jZnAdCDc2Rvmq Q==;
X-CSE-ConnectionGUID: +sBkHqEjQ36S/wgckKaDPw==
X-CSE-MsgGUID: UQYeLMMGTRWcj5HLtsuHxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="53231265"
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; d="scan'208";a="53231265"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 10:24:28 -0700
X-CSE-ConnectionGUID: Nl3DJFKmRVWLzH0rE7AEig==
X-CSE-MsgGUID: u7imMsh4SICy7FgPi4ps+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; d="scan'208";a="152863828"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 10:24:26 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 10:24:25 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 26 Jun 2025 10:24:25 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.54) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 10:24:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iQeu8BzOq4TMIQDEWJy+QuVVCGoeALTMxZ5rDI3ndao0r7lNE/hPo5nTAed56fVe/MpDGoYHVt9woKwffjWu/AoCBfq4Lm5tdX+V5XQsJ5tK6Te6Gt/qJdG2nTHvQjjFlPxwf4+iGhVAb25YXF08CcZOCOA5N2UkW5UY0eSJW8Ovz3JUx2H2Xg0sLe2bhpa0HBG+No2qpvf9qfJKhIEsQvtWVynJtBDieModpAo9Wh/0APk4EoCfCQyDCkNvtMsX6WSB8vEnH33Ikw/z7azxOIsXl9MA0QENA1Chr3ASARYPN1KgLH/cTmKiazydH2lI5dG4qSd3lViq7LCLoMOUHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fqAIi8DWHpZixwtGziD03lf4FGUlH3CgCQXcin6PRNs=;
 b=Z9rRwChfSZZGl401w7/e+NAuFyQ0VgfkzubwHqaBGDDxA2reGbjVZPoFTvTyQnJFWYxJKc1P1QahPtydbfMhvqvxtxlGRsZFSu2tLUdCuxMD2apSrr8KV86iVd/bdIlSsXI/uLcxGPsHEZgszR7SKodVEWBIgkFKUuyi9H/M+Hg3axn6HJ1NgYXzDBOMuCc9KovQI2d3/EkhJtj0V6s4PvgCzDAQo2Ae3zngn1rwCvhpaZDRkX6jN0rhrcM0KLLKAJwTvzX80mabKj3aiuDGekkG3HcdEd400LRvsiR9Fv5sZT+BGvo8hdpzNig0DhlMGlxB6jc5k97i5FfsHWLDRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SA1PR11MB5779.namprd11.prod.outlook.com (2603:10b6:806:22b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Thu, 26 Jun
 2025 17:24:23 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8880.015; Thu, 26 Jun 2025
 17:24:23 +0000
Date: Thu, 26 Jun 2025 13:24:19 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <anshuman.gupta@intel.com>,
 <alexander.usyskin@intel.com>, <gregkh@linuxfoundation.org>,
 <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH v4 05/10] drm/xe/xe_late_bind_fw: Load late binding
 firmware
Message-ID: <aF2CQ_VAT6PSh9Lk@intel.com>
References: <20250625170015.33912-1-badal.nilawar@intel.com>
 <20250625170015.33912-6-badal.nilawar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250625170015.33912-6-badal.nilawar@intel.com>
X-ClientProxiedBy: SJ0PR13CA0114.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::29) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SA1PR11MB5779:EE_
X-MS-Office365-Filtering-Correlation-Id: eb3906ea-27b4-4e52-75cb-08ddb4d64b1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WksLf3pI4WS7H2BWe9VXvPWQL5/eRrIFiZI+DOtIfQzw6qWQpJ2Rv6YynZ+H?=
 =?us-ascii?Q?OHhwaVE6SBaetAjFQ+BAiWUMpiiSb+NnYrvNqhxMJcj8O17dMMwkTMqZCvQy?=
 =?us-ascii?Q?vGYwJ/fqR7HSQhvf4mmTxytT3hDbT0elmd7FFKmgE2piNcastLUT9xIvspFh?=
 =?us-ascii?Q?MSgogX9vFsjRgl+uHoIlquxMvtI9eszXLZGd28DQF4W9OJuEqRxvd7v96Yn7?=
 =?us-ascii?Q?EM/Bib7o8ZoXjCLWG2YDZS0mm+KCCUr4VEbTxBMBcpLA1tsGO1Db1zT1YgFM?=
 =?us-ascii?Q?eRVPsczo9RCldMz1V0MJ+2ieTLQicL6+uZGNTyVsznJvRwmA01mDnJWiEVY+?=
 =?us-ascii?Q?KZys/ofsIrS9zwIniwXcUfd9cfxVpzZ9RTWj8m+LybutdXYvq5/Y970lG/JG?=
 =?us-ascii?Q?CcVDr3wORg/q0kdF4tj2eb2YOYRLrJTtylPLn9tHpSSb0WeBJ2gWP/+XuSHr?=
 =?us-ascii?Q?1L2O5GT+hkDZtdZzxcavKSBZI7IYzaw86T7vSw5ovU2zsqCHryxWHV3pc7BP?=
 =?us-ascii?Q?Er9vUClKiAXHHXgfAkmpOGyNxh6VoT4ptm2nyGDl1W9S2+zxk6+Rhoo8xMZa?=
 =?us-ascii?Q?oDk/tyB3moZoRS1xbNNwe2JQDhozfo0TfgWBfnOn0A+9c8tg4x966cuZg6GB?=
 =?us-ascii?Q?B3231hO0TYvA55AlDq5BJKbl2MxXn9LDGKmo/tq9EiIEbIRIOv2VhxGlGqLf?=
 =?us-ascii?Q?44IEnQEcJFZbsn561l+FGP/lXP+ZjoLhVNSlzi8gQLoKk+CULUIaS0rIsuB6?=
 =?us-ascii?Q?v7XVNAT2tzV5qeJVA5Dk0o7XpdpAKET/x45URn2AxEqph5Z1OJWUUp9VDRJw?=
 =?us-ascii?Q?MhOasCJ5w9PVv3kW/pclD1PL4seLWCEYBATU6NH4KFVclwivZln6jKp4Ahs2?=
 =?us-ascii?Q?b8SrOtv1jhkH+gMRhAGvQ0Dn+b/yB2VcqWtF/keNQqqaYCkHDCrwrhICsyjd?=
 =?us-ascii?Q?PPnFoa9iYyIGDW2TIiHCCbh/Bgpndu8VmafqBF68iaaEInLPpKrntkGxqhNE?=
 =?us-ascii?Q?dM3/d4pU1/0tEDi4r+Rkds2tmdZ0tVnWAHMcWTNxAL9rRx6DkHnzyjZxP+UH?=
 =?us-ascii?Q?yEgk3pBAIdUsdWN65oHkgdYLHv5zkgy50+k1/llAPII0EHuvjT/LKz4BRXOW?=
 =?us-ascii?Q?Ukl3aJcu8e/bz1k9pigZsFJVupGHWUVtfCbbbvGqGwv8f1oDA0ym+eyI4m2+?=
 =?us-ascii?Q?tlUHqc1YRVwhrxiCj29T1B7x2geR9RzHOFu55RjHVSARAItlar26sNh3FUjC?=
 =?us-ascii?Q?We0HXFUw9qmfjeTLD3Kh7X8w7miZyPJve294EVL8PpQqOs+Ea91ZyfpJfsaE?=
 =?us-ascii?Q?8xUM0Hi/r7KmUnNo+5nxnZx/sm+T/dLCHO+jKav9SVwniDZAePw06LqnPTlF?=
 =?us-ascii?Q?p3aFupp9+x/2Jf2kpLLdYq7wHhpz7DOUaEa7+tn6D9Q5BVdcgDR0tg3WDAdq?=
 =?us-ascii?Q?uCb7UgTXdTs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jgJtPxL4phgDHU7T10+V77XmPlwg5pJ4k6b4LnznTtjwi70bTtc8ZxZDSx7K?=
 =?us-ascii?Q?OMj3zsuPOvYtwipsyNisXqYV1gx05x6S5veeL62+/uYW699EhyuWIaKD+32v?=
 =?us-ascii?Q?u62ohpTTvHIo2UZaKllCSk6u3CEtbWsm6E8+9kj5rxG2uVVNJrnY3F7AxoSZ?=
 =?us-ascii?Q?5pJz3Hjv7ge3+1wqJbHvhoJ3tC9SgP6yGLbjsKiwnpqH7MEz/NtCd14t+ZSh?=
 =?us-ascii?Q?cNIHpPve2OFXIw4g88RmoFPccDL00mvl9p0B85VXJzJ9qBs0Xpl9Ny3RbC9n?=
 =?us-ascii?Q?xnikektTXFXb7Hfe0Xql5E0+IkLxIiJbNWtQo889qOwGdL9jcAXJ5ysfSvNn?=
 =?us-ascii?Q?820xwRxX1j7khLXUQdB2DOKR3rGX8gk3tb808ccDMEImESjtSLfKulKpF1WV?=
 =?us-ascii?Q?sN5jxmoSNT+gCVb4H3oWF/4xC9AagRKnwDLzVfRlzMgHadJf0Ujh9jHNAkFn?=
 =?us-ascii?Q?9OA8Y3D/jIsrW0PolUdunWb0YSprHHTlu+PyhIfmLtYzOTHI3cb6FfCUkWRe?=
 =?us-ascii?Q?+ZK6nKMgWdq13nRU0yCXTtjS/M5Z5dYQ+BkOjOpSES2XZgubMmLUX2N2Y4K3?=
 =?us-ascii?Q?f6EixM9R+GCfPWrZE2v8RdOcoG1GdZjqKp2j9fesn2qGP/ZwmYI9Urg0vxqS?=
 =?us-ascii?Q?LLpSQ2YBg42o1QkdNcXDXOEJRzwLsd8UGnU0+iJh7fEBkblwuRmV3TpzbL/B?=
 =?us-ascii?Q?SuTLycOVPhQSCCOi4IGjow0w5I1Vc49n+g/jAopFeKKiJl87AItJ0kHBul5u?=
 =?us-ascii?Q?i8eBiSkEWTSYF44xQFXq8JF2URZmEGgphSCRL3+sIne7jW2ve1aGNAhgBME3?=
 =?us-ascii?Q?mllHOHk0aSz3zYXtH0lmZlWKRRGbnDdbdscLgEHxLK1d7kV5N00Btm2kOWE3?=
 =?us-ascii?Q?PrR/3OgQvdBRsSlPkCrY2/S4InUcu0u7m9GZMlqqUGSCoVVkdzEAZJdI2+DN?=
 =?us-ascii?Q?bD9cHKFyiCC8tf24nTft7TnRm0CKlkv87qwetkuVaAx6aWuD2qj0s1z+BR+H?=
 =?us-ascii?Q?DppcyNfbkryyxxTKWtCeeSqbgR9dxkn8bZOQDGxE6gDKBVSxigFtENcU9jse?=
 =?us-ascii?Q?NwRK63qFFT5VqAjnRwPPkXyZpf6JU2y4df5Nb5iHDjcpTy08F6Uv6aO1y37w?=
 =?us-ascii?Q?agd4sldc3IejVIh8Bna12v+g4SClW1Tqhasei7lFNm4w5NwWsYQBBNSG85DF?=
 =?us-ascii?Q?TBVDDxHtQUnQ5Uv68mESSQyhJGBBwEZm6h81p1xO80dIraLE8tyckPbsk0U1?=
 =?us-ascii?Q?ZL6GVvn5Xaa746Wq/ut2JkWQQwDAMXDpkPFXE2BObS/wQ91bY/RuOVoitzqM?=
 =?us-ascii?Q?68F5Bxy9aG0a3Oxrs4NMF4VmxQL+t+ijKdf3KlVSH4V4Cx7YcQpx8X2oM88n?=
 =?us-ascii?Q?J/BlYov0GjRMa/wVgoaWElMJ0fIcDINw36WNR8RqZix2/0dlF6Y0VzPTKc6m?=
 =?us-ascii?Q?GDeglAi2d+4EEX+ceARO/z6V6v9KTVaezlBo4hUvDs/k4/YTbafvxiXTgwFk?=
 =?us-ascii?Q?dI8frqiNZXDZ1fR0vl66XQ2Uw24d+H1OBHtU3S5FqunXOwbejzlhgCTCWjnS?=
 =?us-ascii?Q?VdvDDboe8Opi6muk1JZIzo/1q/czDJw2kbZl5Q69?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eb3906ea-27b4-4e52-75cb-08ddb4d64b1a
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 17:24:23.5551 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bLYOIAQQTpj7D1qnoChhdKwbj+gxkFwOxU6KsSbkuh9CTrTzJXgxeQPIZjyrNn1yevfPlI/kUavxjUfSX5tVjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5779
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

On Wed, Jun 25, 2025 at 10:30:10PM +0530, Badal Nilawar wrote:
> Load late binding firmware
> 
> v2:
>  - s/EAGAIN/EBUSY/
>  - Flush worker in suspend and driver unload (Daniele)
> v3:
>  - Use retry interval of 6s, in steps of 200ms, to allow
>    other OS components release MEI CL handle (Sasha)
> v4:
>  - return -ENODEV if component not added (Daniele)
>  - parse and print status returned by csc
>  - Use xe_pm_get_if_in_active (Daniele)

The worker is considered outer bound and it is safe
to use xe_pm_runtime_get which takes the reference
and resume synchronously.

Otherwise, if using get_if_active you need to reschedule
the work or you lose your job.


> 
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_late_bind_fw.c       | 149 ++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_late_bind_fw.h       |   1 +
>  drivers/gpu/drm/xe/xe_late_bind_fw_types.h |   7 +
>  3 files changed, 156 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> index 32d1436e7191..52243063d98a 100644
> --- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> @@ -16,6 +16,20 @@
>  #include "xe_late_bind_fw.h"
>  #include "xe_pcode.h"
>  #include "xe_pcode_api.h"
> +#include "xe_pm.h"
> +
> +/*
> + * The component should load quite quickly in most cases, but it could take
> + * a bit. Using a very big timeout just to cover the worst case scenario
> + */
> +#define LB_INIT_TIMEOUT_MS 20000
> +
> +/*
> + * Retry interval set to 6 seconds, in steps of 200 ms, to allow time for
> + * other OS components to release the MEI CL handle
> + */
> +#define LB_FW_LOAD_RETRY_MAXCOUNT 30
> +#define LB_FW_LOAD_RETRY_PAUSE_MS 200
>  
>  static const u32 fw_id_to_type[] = {
>  		[XE_LB_FW_FAN_CONTROL] = CSC_LATE_BINDING_TYPE_FAN_CONTROL,
> @@ -31,6 +45,30 @@ late_bind_to_xe(struct xe_late_bind *late_bind)
>  	return container_of(late_bind, struct xe_device, late_bind);
>  }
>  
> +static const char *xe_late_bind_parse_status(uint32_t status)
> +{
> +	switch (status) {
> +	case CSC_LATE_BINDING_STATUS_SUCCESS:
> +		return "success";
> +	case CSC_LATE_BINDING_STATUS_4ID_MISMATCH:
> +		return "4Id Mismatch";
> +	case CSC_LATE_BINDING_STATUS_ARB_FAILURE:
> +		return "ARB Failure";
> +	case CSC_LATE_BINDING_STATUS_GENERAL_ERROR:
> +		return "General Error";
> +	case CSC_LATE_BINDING_STATUS_INVALID_PARAMS:
> +		return "Invalid Params";
> +	case CSC_LATE_BINDING_STATUS_INVALID_SIGNATURE:
> +		return "Invalid Signature";
> +	case CSC_LATE_BINDING_STATUS_INVALID_PAYLOAD:
> +		return "Invalid Payload";
> +	case CSC_LATE_BINDING_STATUS_TIMEOUT:
> +		return "Timeout";
> +	default:
> +		return "Unknown error";
> +	}
> +}
> +
>  static int xe_late_bind_fw_num_fans(struct xe_late_bind *late_bind)
>  {
>  	struct xe_device *xe = late_bind_to_xe(late_bind);
> @@ -44,6 +82,93 @@ static int xe_late_bind_fw_num_fans(struct xe_late_bind *late_bind)
>  		return 0;
>  }
>  
> +static void xe_late_bind_wait_for_worker_completion(struct xe_late_bind *late_bind)
> +{
> +	struct xe_device *xe = late_bind_to_xe(late_bind);
> +	struct xe_late_bind_fw *lbfw;
> +	int fw_id;
> +
> +	for (fw_id = 0; fw_id < XE_LB_FW_MAX_ID; fw_id++) {
> +		lbfw = &late_bind->late_bind_fw[fw_id];
> +		if (lbfw->valid && late_bind->wq) {
> +			drm_dbg(&xe->drm, "Flush work: load %s firmware\n",
> +				fw_id_to_name[lbfw->id]);
> +			flush_work(&lbfw->work);
> +		}
> +	}
> +}
> +
> +static void xe_late_bind_work(struct work_struct *work)
> +{
> +	struct xe_late_bind_fw *lbfw = container_of(work, struct xe_late_bind_fw, work);
> +	struct xe_late_bind *late_bind = container_of(lbfw, struct xe_late_bind,
> +						      late_bind_fw[lbfw->id]);
> +	struct xe_device *xe = late_bind_to_xe(late_bind);
> +	int retry = LB_FW_LOAD_RETRY_MAXCOUNT;
> +	int ret;
> +	int slept;
> +
> +	/* we can queue this before the component is bound */
> +	for (slept = 0; slept < LB_INIT_TIMEOUT_MS; slept += 100) {
> +		if (late_bind->component.ops)
> +			break;
> +		msleep(100);
> +	}
> +
> +	if (!xe_pm_runtime_get_if_active(xe))
> +		return;
> +
> +	mutex_lock(&late_bind->mutex);
> +
> +	if (!late_bind->component.ops) {
> +		drm_err(&xe->drm, "Late bind component not bound\n");
> +		goto out;
> +	}
> +
> +	drm_dbg(&xe->drm, "Load %s firmware\n", fw_id_to_name[lbfw->id]);
> +
> +	do {
> +		ret = late_bind->component.ops->push_config(late_bind->component.mei_dev,
> +							    lbfw->type, lbfw->flags,
> +							    lbfw->payload, lbfw->payload_size);
> +		if (!ret)
> +			break;
> +		msleep(LB_FW_LOAD_RETRY_PAUSE_MS);
> +	} while (--retry && ret == -EBUSY);
> +
> +	if (!ret) {
> +		drm_dbg(&xe->drm, "Load %s firmware successful\n",
> +			fw_id_to_name[lbfw->id]);
> +		goto out;
> +	}
> +
> +	if (ret > 0)
> +		drm_err(&xe->drm, "Load %s firmware failed with err %d, %s\n",
> +			fw_id_to_name[lbfw->id], ret, xe_late_bind_parse_status(ret));
> +	else
> +		drm_err(&xe->drm, "Load %s firmware failed with err %d",
> +			fw_id_to_name[lbfw->id], ret);
> +out:
> +	mutex_unlock(&late_bind->mutex);
> +	xe_pm_runtime_put(xe);
> +}
> +
> +int xe_late_bind_fw_load(struct xe_late_bind *late_bind)
> +{
> +	struct xe_late_bind_fw *lbfw;
> +	int fw_id;
> +
> +	if (!late_bind->component_added)
> +		return -ENODEV;
> +
> +	for (fw_id = 0; fw_id < XE_LB_FW_MAX_ID; fw_id++) {
> +		lbfw = &late_bind->late_bind_fw[fw_id];
> +		if (lbfw->valid)
> +			queue_work(late_bind->wq, &lbfw->work);
> +	}
> +	return 0;
> +}
> +
>  static int __xe_late_bind_fw_init(struct xe_late_bind *late_bind, u32 fw_id)
>  {
>  	struct xe_device *xe = late_bind_to_xe(late_bind);
> @@ -99,6 +224,7 @@ static int __xe_late_bind_fw_init(struct xe_late_bind *late_bind, u32 fw_id)
>  
>  	memcpy(lb_fw->payload, fw->data, lb_fw->payload_size);
>  	release_firmware(fw);
> +	INIT_WORK(&lb_fw->work, xe_late_bind_work);
>  	lb_fw->valid = true;
>  
>  	return 0;
> @@ -109,11 +235,16 @@ static int xe_late_bind_fw_init(struct xe_late_bind *late_bind)
>  	int ret;
>  	int fw_id;
>  
> +	late_bind->wq = alloc_ordered_workqueue("late-bind-ordered-wq", 0);
> +	if (!late_bind->wq)
> +		return -ENOMEM;
> +
>  	for (fw_id = 0; fw_id < XE_LB_FW_MAX_ID; fw_id++) {
>  		ret = __xe_late_bind_fw_init(late_bind, fw_id);
>  		if (ret)
>  			return ret;
>  	}
> +
>  	return 0;
>  }
>  
> @@ -137,6 +268,8 @@ static void xe_late_bind_component_unbind(struct device *xe_kdev,
>  	struct xe_device *xe = kdev_to_xe_device(xe_kdev);
>  	struct xe_late_bind *late_bind = &xe->late_bind;
>  
> +	xe_late_bind_wait_for_worker_completion(late_bind);
> +
>  	mutex_lock(&late_bind->mutex);
>  	late_bind->component.ops = NULL;
>  	mutex_unlock(&late_bind->mutex);
> @@ -152,7 +285,15 @@ static void xe_late_bind_remove(void *arg)
>  	struct xe_late_bind *late_bind = arg;
>  	struct xe_device *xe = late_bind_to_xe(late_bind);
>  
> +	xe_late_bind_wait_for_worker_completion(late_bind);
> +
> +	late_bind->component_added = false;
> +
>  	component_del(xe->drm.dev, &xe_late_bind_component_ops);
> +	if (late_bind->wq) {
> +		destroy_workqueue(late_bind->wq);
> +		late_bind->wq = NULL;
> +	}
>  	mutex_destroy(&late_bind->mutex);
>  }
>  
> @@ -183,9 +324,15 @@ int xe_late_bind_init(struct xe_late_bind *late_bind)
>  		return err;
>  	}
>  
> +	late_bind->component_added = true;
> +
>  	err = devm_add_action_or_reset(xe->drm.dev, xe_late_bind_remove, late_bind);
>  	if (err)
>  		return err;
>  
> -	return xe_late_bind_fw_init(late_bind);
> +	err = xe_late_bind_fw_init(late_bind);
> +	if (err)
> +		return err;
> +
> +	return xe_late_bind_fw_load(late_bind);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.h b/drivers/gpu/drm/xe/xe_late_bind_fw.h
> index 4c73571c3e62..28d56ed2bfdc 100644
> --- a/drivers/gpu/drm/xe/xe_late_bind_fw.h
> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.h
> @@ -11,5 +11,6 @@
>  struct xe_late_bind;
>  
>  int xe_late_bind_init(struct xe_late_bind *late_bind);
> +int xe_late_bind_fw_load(struct xe_late_bind *late_bind);
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
> index 93abf4c51789..f119a75f4c9c 100644
> --- a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
> @@ -9,6 +9,7 @@
>  #include <linux/iosys-map.h>
>  #include <linux/mutex.h>
>  #include <linux/types.h>
> +#include <linux/workqueue.h>
>  
>  #define MAX_PAYLOAD_SIZE SZ_4K
>  
> @@ -38,6 +39,8 @@ struct xe_late_bind_fw {
>  	u8  *payload;
>  	/** @late_bind_fw.payload_size: late binding blob payload_size */
>  	size_t payload_size;
> +	/** @late_bind_fw.work: worker to upload latebind blob */
> +	struct work_struct work;
>  };
>  
>  /**
> @@ -64,6 +67,10 @@ struct xe_late_bind {
>  	struct mutex mutex;
>  	/** @late_bind.late_bind_fw: late binding firmware array */
>  	struct xe_late_bind_fw late_bind_fw[XE_LB_FW_MAX_ID];
> +	/** @late_bind.wq: workqueue to submit request to download late bind blob */
> +	struct workqueue_struct *wq;
> +	/** @late_bind.component_added: whether the component has been added */
> +	bool component_added;
>  };
>  
>  #endif
> -- 
> 2.34.1
> 
