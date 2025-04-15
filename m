Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CFA3A89DDA
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 14:23:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C232310E762;
	Tue, 15 Apr 2025 12:23:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G9sOKNbR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DE0A10E75E;
 Tue, 15 Apr 2025 12:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744719803; x=1776255803;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 in-reply-to:mime-version;
 bh=yw67uAxcuCj/HPwNKLqPZ4TcJ0tXGes+l9YVRvKFSv4=;
 b=G9sOKNbR36wO86hcBXjHRUabQ7uRA930OMjzWvifCO5fwktDw46+VQ6p
 cDgAaQp8rZ/WCmWaiU72Ww8eWbN+KV5U9jUHwbQZKKvkgZrhio3wUMZzq
 Ws9APsbplQr2NCNRAM8+UI/2nL3hHAGIbiXGO5ODFLXvMVfm2Wa9tXlfv
 ZDqcZvWPlU9BTliVwQDA4QHqvAdh5E2Tkxhuk5Ojzfi8FHyZ61FGT5AIt
 GAAQ2h/MEz6r7IahpTQmsymT2BxpgYi0E4xCmPcqlTnZ+4TUWlXTF3T6z
 q+DtsqyoTPsXZ7bK1FFQ76JA8QoyjaWTu4KZ0lvHbMixl6TFs5a/aQ4EO g==;
X-CSE-ConnectionGUID: nXxJCU3fQvq769Awivvvgg==
X-CSE-MsgGUID: zPf6IiumTrSnK6jPEvB0Nw==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="71619302"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="71619302"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 05:23:21 -0700
X-CSE-ConnectionGUID: jM6/JJTdTV+46KtqW0lPFQ==
X-CSE-MsgGUID: +zU6vWSwTdinQh31ZaCtIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="134891756"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 05:23:21 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 15 Apr 2025 05:23:20 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 15 Apr 2025 05:23:20 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 15 Apr 2025 05:23:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tv8xi2h49prQFfKUIurQbr8g4JEGOJ+R+3d7Q/Dc1YQvfKXi7zhVZkQ+7t+h8WVrjtLbL3p//BT7/lm0oqcaWVEiv4srI+ePvlxq3AXq16yiREpWQXVi8a9gWv4oN7cU9VEiP31ChHsrxc28J5QfNOI2plwoAWocOPFpiPfwo+i6clYP4jBxhuNBCnnMvEAoTUFW6pwdBVlS1ycZuShiDwt4wXdlm0IYMFV1vaN+7UVNzTmqRj+uQEsJ9EVD5c4rfl6mzkQfNZYENyMYVAj8NOb0JntxSOcTEJQxcp+jXhNqTJ3vrugOKm1DpnAGp2DIO+Wep4+nodZW+0+9de/LSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rG43O5IMNI9p6FSQNetDZ0w2oTgqlSEePdcWHpt8Os8=;
 b=jBX/UKkLfZrN3sZz7kIYbGbAeLluDe+L/RcwCOotXi60/YeswJEk/Y20WOck650VTVHHpTlNzv64FVnishxEOIQIT4CcTcdio9lNmDorSdi9WEMzMRIwaTJyhEMqc9zWQ2n9mbB14HbUROylOjFPg/OpCqXgKqEd/EJf8+5/Q+dfVkygjBBbI028vOqn1rV/zPkc9GIlpxjNKh9dmcHH5g689Zg3RySSQwBlXpwQEcQKfwOBhQXXkyugj07tox4Oj8o0qaMU5TiEhjebTtiFaEOYK8SCa6Ub602RthxlroDbZF6IKdni/mpAH87TdnREBMK6UueDoGY7lGwbHSsExA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Tue, 15 Apr
 2025 12:23:18 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%5]) with mapi id 15.20.8632.036; Tue, 15 Apr 2025
 12:23:17 +0000
Date: Tue, 15 Apr 2025 15:23:20 +0300
From: Imre Deak <imre.deak@intel.com>
To: Arun R Murthy <arun.r.murthy@intel.com>
CC: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <vinod.govindapillai@intel.com>
Subject: Re: [PATCH v2 3/3] drm/i915/display: move min_hblank from dp_mst.c
 to dp.c
Message-ID: <Z_5PuAJMB2fhlMeI@ideak-desk.fi.intel.com>
References: <20250415-hblank-v2-0-1a23e9d97360@intel.com>
 <20250415-hblank-v2-3-1a23e9d97360@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250415-hblank-v2-3-1a23e9d97360@intel.com>
X-ClientProxiedBy: DB7PR03CA0105.eurprd03.prod.outlook.com
 (2603:10a6:10:72::46) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|CY8PR11MB7828:EE_
X-MS-Office365-Filtering-Correlation-Id: 98a3276d-7605-42e5-257b-08dd7c184d2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|1800799024|366016|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7MSQVvRh2HIN3eZ5XQ121bJaSYajTP3b7bCb7fKc1bgbW+ROlwjQF7W4pBBM?=
 =?us-ascii?Q?ZyLA5Ko599lh+CCmcdZkVTGwGEJ/XeyfUs/HmG3V9FQ8a2b+zvZD9f3kBRy5?=
 =?us-ascii?Q?hOltKR4Q6We37anXRvmQjMZxpRHZi83kjAj1zp36SzkApmmnuJkCK6ab3NOp?=
 =?us-ascii?Q?/6IYmaRg3Ve7BmOON07O96uBzayGshoyVZAb5g8n3We8flpFFw5z4qRpkEEx?=
 =?us-ascii?Q?adq8Z9fPiFxjDdwfmqBeKbqJbdoxI4ToFFvevQrrqPfNQ0mluPVzyNQdAdRy?=
 =?us-ascii?Q?9E96qceRdZJ5wRNnzwygLc1557MCaqaenWpFHhmXAwF9FJ60LzU+Kr2bibZJ?=
 =?us-ascii?Q?nF6dPzd1Iw/px4CFSq1hKrL05pB5dFnE5FhaL/64qmMQ/wVZe+qEDbNuZlYc?=
 =?us-ascii?Q?aaaCVYDtURRSrsjqhO4R5ArgrA2a8ndh0Tx1XR6UjSBbMvnzWnb/w37kdH5a?=
 =?us-ascii?Q?oIjOYucKQLK9h9sKZiLAxdyamrrjeu8iWypkTY2/dK9J97/KyBDctLXJhPuj?=
 =?us-ascii?Q?GAjuCPbBxuiVW392FOqNKhkndTcJSqJq4J8TOE0I4P8mXO22MmZWEUsLXXws?=
 =?us-ascii?Q?zzKIYOfcEbhfEx+fUh+ngYapqdJm7iuFAqLcMvNkquu7V7l2q4sIDeZfcrkQ?=
 =?us-ascii?Q?WECboMUsKBOy/TApcfDJS5GnDbMLNPm3/hTqEhP33D+IiDVLq8cWNa8epws6?=
 =?us-ascii?Q?HS2n4bpfhhIEfNfMMm1QIebd184SAsVVcOVpaT5F/HWf8jdl5P1biIP4quq9?=
 =?us-ascii?Q?SzpI9pfQRk2Qn2dNe9XWqzN4pCKL7p3UvcHaZItEuiAktoJHswB2wvdxcv+v?=
 =?us-ascii?Q?TyORe7RtYiAn9mqHSn8vUx12ph9zSbO0orOC5QgxCUsr+GDPqu+u7CC3QocQ?=
 =?us-ascii?Q?tmhEAtOW03SbvSw1SVLm3We+eTc/2tYzcuqLfhZ+Vh4LTjGHDQ4/iRiHzqtw?=
 =?us-ascii?Q?J25ulm5w38YQVVBjXJMyrw4mth25uGUtJRCx94RNeTMJ+wvRhdW8GEPXfOsN?=
 =?us-ascii?Q?ujlN0w2N8Vu04NgDM4vN6Q+a7mgB0QEFV2hZ8I/D0yDjvmqZ1ZAg4/3KsIcU?=
 =?us-ascii?Q?MusgcBJ+lSqdtqpivmi4RXRvkvdq/Nr+Pp8CNOwHQL1hJhF5Gce0X7AnO6VC?=
 =?us-ascii?Q?xPGfg8EiUyjs48IUiJNOV4bzNckF/OeSSEVDiBPrhIATw1/H8gPXNyRs5L5f?=
 =?us-ascii?Q?U3/Y6PXvN9Tb5GH9sMuybnSE3D1rATHQe2VCNbLXXyC+55TIg6F/BJmmCj5D?=
 =?us-ascii?Q?olPbrsFN7ErqyCuYRWmM2YnW1NFdwX8RUqa119LuC53oYWIGasa/TTv3BtPF?=
 =?us-ascii?Q?BFB62Bx7U0IkXAoBNfy1ui/OCJ0KFbaHzTegtrwBYAAg0abnhiPg46TuZqCg?=
 =?us-ascii?Q?OPkeWkw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?R7SRTNAyy3sbvpn2BowK98vY287GX5hiLU0zZolOB+my7PQIeuQuT/96UfPl?=
 =?us-ascii?Q?WwnpqDBxF/9FN/uAEAtxcPqNbfJkK7cDnGsz5x7RRAQtQQn+Piyqu+FSaefV?=
 =?us-ascii?Q?ctQxUO5lgBhcUPInRBaoSmXQdtLcWXuNSgn930gyyYbb6zTpQdtbHwAYzbyv?=
 =?us-ascii?Q?koMzlPUlR94UHn9+oILrpxFEQoQ8iILrmYZKtW7r2GRdP8L+m/P9/keWVKY/?=
 =?us-ascii?Q?xB1I6H0UHg3PZv8a3IcxdknBL7N1Vzm2xNgqXa8lzL3N6VWfaA5PXqBPuTKh?=
 =?us-ascii?Q?fDhgWb+IFBrRiNYNWQGqt/LrDk+QjEw8SkHa5f+cGXbctCcxh9+VOm8pPKB2?=
 =?us-ascii?Q?wO5r8o4tntmgefgo/EanpCbzB3KuWykiSJN4DwqY2/4F90CdZMH0LhJdxbL/?=
 =?us-ascii?Q?yYCC0N1bl7smEJsVgf49mjetCAyT79eI6MC8DHnffhFqCBYg9nepThWpC4N7?=
 =?us-ascii?Q?pMDueCeznxQd1JJZ4hFltLLsI1k/OTeMAkgDv6dGI2ttOk9YaeRYiv/naZoI?=
 =?us-ascii?Q?cPD//VfqD3I3qVlwre/+6wpdYbxXyhRCw1O2qPpG3qPRtDjcB83hwlE+QJJs?=
 =?us-ascii?Q?GhUAASn41KZ19BlQcPAiwPsxADJHDSw7sVDb/G3SPCi4kcke3p9QmJuv8bHM?=
 =?us-ascii?Q?FM5DOmXkEnkAm87GnP3VkovdDdNLVxaAusmDbAMO5wU+TWc3XfmkbtabQfxo?=
 =?us-ascii?Q?+n8hREVmb+8ArAhuwyBrqSAt3rHRfQKjc9e0nDdjmrXLaGt1HAWrukZVIt+0?=
 =?us-ascii?Q?Qm6EAwENAaU6rrvYaX1PwL8PMWPYa8fPCCSGaKaxeFyvWtC8KcK3jsOQGqT+?=
 =?us-ascii?Q?bldpdEp6GD9/wJZ+cVckAzuJEURtVfYbQCvjW+/Ypt3NDEDFXpXpeARIUDUc?=
 =?us-ascii?Q?RVTgbityEtbUtiivbyV7T+UttwF5gU6wx6To8YaWb2PpHUKqWv/i8vOwooCp?=
 =?us-ascii?Q?aJoEpEH8fNUp88ktZGh+V1BKDkErwl0+wow1HCZQ+6SJzowJgNMqFqR2lwUx?=
 =?us-ascii?Q?bj7AjxnCSiL08siiV18kRWZEPpoCoeL38Kz73JSNWYCCrDzbEYXyFpEewfJb?=
 =?us-ascii?Q?vQ2SOtFnNVK/TSZ1EGaeLLg8SGtkgNnrgHpiBlE82z8RB+K8IlrY9qvLJHhJ?=
 =?us-ascii?Q?O8gjLegdc0jrekoGhuOtglGlb0Z/4lhWMAuB1RVTqs47DvTvZdufqEYu+Pqk?=
 =?us-ascii?Q?MNXTLxdA+mqCpcQvGaEzugbtDbVi3fzQGC7elqVwGhSIC0E+JyV3sdLXqlB1?=
 =?us-ascii?Q?X+gIBh9QgJYW+9pFn9iD+LGWUfDeCM6B0skF9AXTWjwIj+1XLbAm6WDP4a77?=
 =?us-ascii?Q?W626gAM04KrYtcCA3nZPvxI7MwjR5AVj4eKmQMpzjW4EDa+1D8WqUR6e6NzI?=
 =?us-ascii?Q?KzILzsN/7nTCdaBc5wXohizJe/3jfsewIio1we+RqilW7GdBsyV/onQ1B8/c?=
 =?us-ascii?Q?+FrY8sfq1AvD2g7AT9hnY3fywlQ202LmvS37uDCrJXY2XUHSln217EkB2BHN?=
 =?us-ascii?Q?asGUkEClhG1xILNVCOgYG2JgXYgyrjywNkaTb5w3PmgFC4nDhAbXCfmyJ+pH?=
 =?us-ascii?Q?1WR2/tn0djVkP2l0ouf4rT9QlqZO1aUPD0OTGfiJ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 98a3276d-7605-42e5-257b-08dd7c184d2a
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 12:23:17.7855 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +wMDGgyIYTwdM5yPdfV1jH6OMZMPUDEXB0b5sD2vTt8YOlIcMQ6HBMgbjaJgS76HPqfXjpzUp0K3B104Shb7dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7828
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
Reply-To: imre.deak@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 15, 2025 at 01:25:09PM +0530, Arun R Murthy wrote:
> Minimum HBlank is programmed to address jitter for high resolutions with
> high refresh rates that have small Hblank, specifically where Hblank is
> smaller than one MTP.
> 
> TODO: Add the min_hblank calculation for hdmi as well.
> 
> v2: move from intel_audio.c to intel_dp.c
>     some correction in link_bpp_x16 (Imre)
> 
> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_audio.c   |  7 ++++
>  drivers/gpu/drm/i915/display/intel_display.c | 19 +++++++++++
>  drivers/gpu/drm/i915/display/intel_dp.c      | 47 +++++++++++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_dp_mst.c  | 51 +---------------------------
>  4 files changed, 74 insertions(+), 50 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_audio.c b/drivers/gpu/drm/i915/display/intel_audio.c
> index ea935a5d94c87202a68f84b28b0152835f47fe73..76107d566d6d7d78c0faf59d049651e1efe2a76d 100644
> --- a/drivers/gpu/drm/i915/display/intel_audio.c
> +++ b/drivers/gpu/drm/i915/display/intel_audio.c
> @@ -27,9 +27,11 @@
>  #include <drm/drm_edid.h>
>  #include <drm/drm_eld.h>
>  #include <drm/drm_fixed.h>
> +#include <drm/display/drm_dp_helper.h>
>  #include <drm/intel/i915_component.h>
>  
>  #include "i915_drv.h"
> +#include "i915_reg.h"
>  #include "intel_atomic.h"
>  #include "intel_audio.h"
>  #include "intel_audio_regs.h"
> @@ -37,6 +39,8 @@
>  #include "intel_crtc.h"
>  #include "intel_de.h"
>  #include "intel_display_types.h"
> +#include "intel_dp.h"
> +#include "intel_dp_mst.h"
>  #include "intel_lpe_audio.h"
>  
>  /**
> @@ -715,6 +719,7 @@ bool intel_audio_compute_config(struct intel_encoder *encoder,
>  	memcpy(crtc_state->eld, connector->eld, sizeof(crtc_state->eld));
>  
>  	crtc_state->eld[6] = drm_av_sync_delay(connector, adjusted_mode) / 2;
> +

Extra w/s here and a few more places below.

>  	mutex_unlock(&connector->eld_mutex);
>  
>  	return true;
> @@ -778,6 +783,7 @@ void intel_audio_codec_enable(struct intel_encoder *encoder,
>  	intel_lpe_audio_notify(display, cpu_transcoder, port, crtc_state->eld,
>  			       crtc_state->port_clock,
>  			       intel_crtc_has_dp_encoder(crtc_state));
> +
>  }
>  
>  /**
> @@ -834,6 +840,7 @@ void intel_audio_codec_disable(struct intel_encoder *encoder,
>  	}
>  
>  	intel_lpe_audio_notify(display, cpu_transcoder, port, NULL, 0, false);
> +
>  }
>  
>  static void intel_acomp_get_config(struct intel_encoder *encoder,
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index dc7517da2ed5c75fb1715d43e6bfc792a8420f30..781b7ab1315730965d255cf14c0a193d226d7ac1 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -1782,6 +1782,7 @@ static void hsw_crtc_disable(struct intel_atomic_state *state,
>  	const struct intel_crtc_state *old_crtc_state =
>  		intel_atomic_get_old_crtc_state(state, crtc);
>  	struct intel_crtc *pipe_crtc;
> +	enum transcoder cpu_transcoder = old_crtc_state->cpu_transcoder;
>  	int i;
>  
>  	/*
> @@ -1797,6 +1798,9 @@ static void hsw_crtc_disable(struct intel_atomic_state *state,
>  
>  	for_each_pipe_crtc_modeset_disable(display, pipe_crtc, old_crtc_state, i)
>  		intel_dmc_disable_pipe(display, pipe_crtc->pipe);
> +
> +	if (DISPLAY_VER(display) >= 30)
> +		intel_de_write(display, DP_MIN_HBLANK_CTL(cpu_transcoder), 0);

It's an odd place to program a transcoder register, the transcoder being
disabled already. I think we could not zero the register here at all and
just program it to 0 or to the computed non-zero value during enabling.

>  }
>  
>  /* Prefer intel_encoder_is_combo() */
> @@ -2726,6 +2730,19 @@ static void intel_set_transcoder_timings(const struct intel_crtc_state *crtc_sta
>  		intel_de_write(display, TRANS_VTOTAL(display, pipe),
>  			       VACTIVE(crtc_vdisplay - 1) |
>  			       VTOTAL(crtc_vtotal - 1));
> +
> +	if (DISPLAY_VER(display) >= 30 && crtc_state->min_hblank) {

Following the above the register would be programmed here also if
crtc_state->min_hblank is 0.

> +		/*
> +		 * Address issues for resolutions with high refresh rate that
> +		 * have small Hblank, specifically where Hblank is smaller than
> +		 * one MTP. Simulations indicate this will address the
> +		 * jitter issues that currently causes BS to be immediately
> +		 * followed by BE which DPRX devices are unable to handle.
> +		 * https://groups.vesa.org/wg/DP/document/20494
> +		 */
> +		intel_de_write(display, DP_MIN_HBLANK_CTL(cpu_transcoder),
> +			       crtc_state->min_hblank);
> +	}
>  }
>  
>  static void intel_set_transcoder_timings_lrr(const struct intel_crtc_state *crtc_state)
> @@ -5221,6 +5238,8 @@ intel_pipe_config_compare(const struct intel_crtc_state *current_config,
>  	PIPE_CONF_CHECK_I(lane_count);
>  	PIPE_CONF_CHECK_X(lane_lat_optim_mask);
>  
> +	PIPE_CONF_CHECK_I(min_hblank);
> +
>  	if (HAS_DOUBLE_BUFFERED_M_N(display)) {
>  		if (!fastset || !pipe_config->update_m_n)
>  			PIPE_CONF_CHECK_M_N(dp_m_n);
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index 7b95d62730e6f0c27c07fb59f16476369c4762a4..03bcf0b891a72167cd6249f07802debbffdc78ef 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -3103,6 +3103,51 @@ intel_dp_queue_modeset_retry_for_link(struct intel_atomic_state *state,
>  	}
>  }
>  
> +static void intel_dp_compute_min_hblank(int link_bpp_x16,
> +					struct intel_crtc_state *crtc_state,
> +					struct drm_connector_state *conn_state)
> +{
> +	struct intel_display *display = to_intel_display(crtc_state);
> +	const struct drm_display_mode *adjusted_mode =
> +					&crtc_state->hw.adjusted_mode;
> +	struct intel_connector *connector = to_intel_connector(conn_state->connector);
> +	int symbol_size = intel_dp_is_uhbr(crtc_state) ? 32 : 8;
> +	int min_sym_cycles = intel_dp_is_uhbr(crtc_state) ? 3 : 5;

The clue for what 3 and 5 is still missing. In the 8b/10b case they
could be related to the VB-ID, Mvid, Maud symbols, but not sure. Would
be good to clarify this from the DP Standard (what symbols are sent in
the Hblank period?) or asking the HW people/filing a bspec ticket.

> +	bool is_mst = intel_crtc_has_type(crtc_state, INTEL_OUTPUT_DP_MST);
> +	int min_hblank;
> +	int max_lane_count = 4;
> +	int hactive_sym_cycles, htotal_sym_cycles;
> +	int dsc_slices = intel_dp_mst_dsc_get_slice_count(connector,
> +							  crtc_state);

It's better to handle the error return from
intel_dp_mst_dsc_get_slice_count().

> +
> +	if (DISPLAY_VER(display) < 30)
> +		return;

MIN_HBLANK should be set only for 8b/10b MST or for 128b/132b SST/MST.
Now it would be also set for 8b/10b SST.

> +
> +	/* Calculate min Hblank Link Layer Symbol Cycle Count for 8b/10b MST & 128b/132b */
> +	hactive_sym_cycles = drm_dp_link_symbol_cycles(max_lane_count,
> +						       adjusted_mode->hdisplay,
> +						       link_bpp_x16,
> +						       symbol_size,
> +						       is_mst,
> +						       dsc_slices);
> +	htotal_sym_cycles = adjusted_mode->htotal *
> +			    (hactive_sym_cycles / adjusted_mode->hdisplay);
> +
> +	min_hblank = htotal_sym_cycles - hactive_sym_cycles;
> +	/* minimum Hblank calculation: https://groups.vesa.org/wg/DP/document/20494 */
> +	min_hblank = max(min_hblank, min_sym_cycles);
> +
> +	/*
> +	 * adjust the BlankingStart/BlankingEnd framing control from
> +	 * the calculated value
> +	 */
> +	min_hblank = min_hblank - 2;
> +
> +	/* Maximum value to be programmed is limited to 10 */

No need for the above comment, it's clear already from the code.

> +	min_hblank = min(10, min_hblank);
> +	crtc_state->min_hblank = min_hblank;
> +}
> +
>  int
>  intel_dp_compute_config(struct intel_encoder *encoder,
>  			struct intel_crtc_state *pipe_config,
> @@ -3202,6 +3247,8 @@ intel_dp_compute_config(struct intel_encoder *encoder,
>  				       &pipe_config->dp_m_n);
>  	}
>  
> +	intel_dp_compute_min_hblank(link_bpp_x16, pipe_config, conn_state);

intel_dp_compute_conifig() is SST specific, so
intel_dp_compute_min_hblank() should be also called from the MST compute
config function.

> +
>  	/* FIXME: abstract this better */
>  	if (pipe_config->splitter.enable)
>  		pipe_config->dp_m_n.data_m *= pipe_config->splitter.link_count;
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> index af98a0d0e8376a79ce1ab6ff3c4f6af30f4d3e73..dae74c645c1a1d716504b7843fe1a5c8ace0d87d 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -211,26 +211,6 @@ int intel_dp_mst_dsc_get_slice_count(const struct intel_connector *connector,
>  					    num_joined_pipes);
>  }
>  
> -static void intel_dp_mst_compute_min_hblank(struct intel_crtc_state *crtc_state,
> -					    int bpp_x16)
> -{
> -	struct intel_display *display = to_intel_display(crtc_state);
> -	const struct drm_display_mode *adjusted_mode =
> -					&crtc_state->hw.adjusted_mode;
> -	int symbol_size = intel_dp_is_uhbr(crtc_state) ? 32 : 8;
> -	int hblank;
> -
> -	if (DISPLAY_VER(display) < 20)
> -		return;
> -
> -	/* Calculate min Hblank Link Layer Symbol Cycle Count for 8b/10b MST & 128b/132b */
> -	hblank = DIV_ROUND_UP((DIV_ROUND_UP
> -			       (adjusted_mode->htotal - adjusted_mode->hdisplay, 4) * bpp_x16),
> -			      symbol_size);
> -
> -	crtc_state->min_hblank = hblank;
> -}
> -
>  int intel_dp_mtp_tu_compute_config(struct intel_dp *intel_dp,
>  				   struct intel_crtc_state *crtc_state,
>  				   struct drm_connector_state *conn_state,
> @@ -301,8 +281,6 @@ int intel_dp_mtp_tu_compute_config(struct intel_dp *intel_dp,
>  		local_bw_overhead = intel_dp_mst_bw_overhead(crtc_state,
>  							     false, dsc_slice_count, link_bpp_x16);
>  
> -		intel_dp_mst_compute_min_hblank(crtc_state, link_bpp_x16);
> -
>  		intel_dp_mst_compute_m_n(crtc_state,
>  					 local_bw_overhead,
>  					 link_bpp_x16,
> @@ -998,7 +976,6 @@ static void mst_stream_disable(struct intel_atomic_state *state,
>  	struct intel_dp *intel_dp = to_primary_dp(encoder);
>  	struct intel_connector *connector =
>  		to_intel_connector(old_conn_state->connector);
> -	enum transcoder trans = old_crtc_state->cpu_transcoder;
>  
>  	drm_dbg_kms(display->drm, "active links %d\n",
>  		    intel_dp->mst.active_links);
> @@ -1009,9 +986,6 @@ static void mst_stream_disable(struct intel_atomic_state *state,
>  	intel_hdcp_disable(intel_mst->connector);
>  
>  	intel_dp_sink_disable_decompression(state, connector, old_crtc_state);
> -
> -	if (DISPLAY_VER(display) >= 20)
> -		intel_de_write(display, DP_MIN_HBLANK_CTL(trans), 0);
>  }
>  
>  static void mst_stream_post_disable(struct intel_atomic_state *state,
> @@ -1286,7 +1260,7 @@ static void mst_stream_enable(struct intel_atomic_state *state,
>  	enum transcoder trans = pipe_config->cpu_transcoder;
>  	bool first_mst_stream = intel_dp->mst.active_links == 1;
>  	struct intel_crtc *pipe_crtc;
> -	int ret, i, min_hblank;
> +	int ret, i;
>  
>  	drm_WARN_ON(display->drm, pipe_config->has_pch_encoder);
>  
> @@ -1301,29 +1275,6 @@ static void mst_stream_enable(struct intel_atomic_state *state,
>  			       TRANS_DP2_VFREQ_PIXEL_CLOCK(crtc_clock_hz & 0xffffff));
>  	}
>  
> -	if (DISPLAY_VER(display) >= 20) {
> -		/*
> -		 * adjust the BlankingStart/BlankingEnd framing control from
> -		 * the calculated value
> -		 */
> -		min_hblank = pipe_config->min_hblank - 2;
> -
> -		/* Maximum value to be programmed is limited to 0x10 */
> -		min_hblank = min(0x10, min_hblank);
> -
> -		/*
> -		 * Minimum hblank accepted for 128b/132b would be 5 and for
> -		 * 8b/10b would be 3 symbol count
> -		 */
> -		if (intel_dp_is_uhbr(pipe_config))
> -			min_hblank = max(min_hblank, 5);
> -		else
> -			min_hblank = max(min_hblank, 3);
> -
> -		intel_de_write(display, DP_MIN_HBLANK_CTL(trans),
> -			       min_hblank);
> -	}
> -
>  	enable_bs_jitter_was(pipe_config);
>  
>  	intel_ddi_enable_transcoder_func(encoder, pipe_config);
> 
> -- 
> 2.25.1
> 
