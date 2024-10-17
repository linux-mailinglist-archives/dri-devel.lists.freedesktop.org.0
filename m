Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 466029A29AF
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2024 18:54:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAB3610E886;
	Thu, 17 Oct 2024 16:54:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LOLGTH73";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80BC710E886;
 Thu, 17 Oct 2024 16:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729184061; x=1760720061;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2hD5vKJ7kP3EhjoKLVntxDJVBBKFDbi017ag8sxWd7o=;
 b=LOLGTH73WebCeeZ57g4AseMqiDlAYPfrFpzrijd1ritTEFnUg1Um87fJ
 anKNIVcWTCsUufjO3gKEMH5GGasM0KVdmULyEc4mo+L1TGpe+OElq1Svj
 Ph03QiVJD4jMIP+uMfzeCxO9exIM6C+zUGOfpg3AU7881QLRG8HOaYw8J
 8o9gflpy3l6qd8uHDhwMrm85v2W2kReqGmTxBnZPGNvAlyjafVr+zHb26
 KsXKjRvI0Pvcr7bm8fanGhW3xoRuQ+Rt3e4qRJZWzjB4XXKf6J6kSiezM
 x9c5C4Ina7cbRLUAjOVPooECX0OsXdhekqHzfhRxIVhL5umqiYlFDf73n Q==;
X-CSE-ConnectionGUID: j4PWf3b2Q+CZJ7CcC9D9jQ==
X-CSE-MsgGUID: l3Sc+wLRQk6wbTuQwULQww==
X-IronPort-AV: E=McAfee;i="6700,10204,11228"; a="39272196"
X-IronPort-AV: E=Sophos;i="6.11,211,1725346800"; d="scan'208";a="39272196"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 09:54:20 -0700
X-CSE-ConnectionGUID: /fUVgReER1mkeTzTHc4FnQ==
X-CSE-MsgGUID: cpN2I8A/QWu/iAjaI+jWkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,211,1725346800"; d="scan'208";a="78756275"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Oct 2024 09:54:20 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 17 Oct 2024 09:54:19 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 17 Oct 2024 09:54:19 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 17 Oct 2024 09:54:19 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 17 Oct 2024 09:54:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Aa2/HHI27MuK2b9A70tXLkeUI7T4MyLaTjMJcQSKG6SAVFBsHbfYNs2+c0GGSnGJJLt3llegk7bPDWOCWAofhEXZVuIvKwGauO0ZVCPo/XBTL71tJe7rNBldeVEBdteoMMI2tAEmOnKMbTt6Ng55xLKPxMxpbsZW8PXBPqb6PpNJQdZjDe63WIQ7l4WD7mn7GivW3mcs2RVo7DHJ+EfiUuMU9RZmCcONxkbntI9I26dV85Cj72nxGL4OWkOBoUK8JV+4dadqTHhorgmzrwfibDz5CLeAGRzjf+IWwJwPrO5UABdKTJ0W3cYWDySizBghUZVwDduD3Ttll913jtMS4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2AQNHJrW6kClxm3kQFkvd7CLtlMl6OEKnfxYuLvRkNM=;
 b=Bc03DxDsFM5hgawSOqZrP/KwEKc38SfHlcoebpFjzkZDQg4kYwPNwepQ5v2rcoPZoJGtCHxijrHK/m7jx2SiXnK7p6a8XD5fWFBGJbq7ked71F+xKG0uoly8il1DsVyos6eerwC5wpL3UpaFWEMSZIlxz38i/dO7tgIk27w9EZ0uAN7biYHNuQQQex4Bq/Hmzmtm7dXiehW2tDpBPrLFC767LIJjJhL34R4SCZlAoz8I4u811IHz0GuSOsHi9boHssQPvzVcVvxAPYCIL25oeY9JW6PomnSeVPtNK+lm4lAOKv4B1vcVZC7QaGeDWaQQTEakr7xaARIgQezf26pkzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by DM6PR11MB4754.namprd11.prod.outlook.com (2603:10b6:5:2ad::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.23; Thu, 17 Oct
 2024 16:54:15 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%7]) with mapi id 15.20.8069.018; Thu, 17 Oct 2024
 16:54:13 +0000
Date: Thu, 17 Oct 2024 12:54:08 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
CC: Sean Christopherson <seanjc@google.com>, Arnd Bergmann <arnd@kernel.org>, 
 Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Dave Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Paolo
 Bonzini" <pbonzini@redhat.com>, Maxime Ripard <mripard@kernel.org>, "Geert
 Uytterhoeven" <geert+renesas@glider.be>, Imre Deak <imre.deak@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] i915: fix DRM_I915_GVT_KVMGT dependencies
Message-ID: <ZxFBMBRh3X-znBYB@intel.com>
References: <20241015152157.2955229-1-arnd@kernel.org>
 <ZxBZx5EUhJFjTcXP@google.com>
 <6201c467-e5f2-4aa1-967c-8d9116c5367a@app.fastmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <6201c467-e5f2-4aa1-967c-8d9116c5367a@app.fastmail.com>
X-ClientProxiedBy: MW4PR04CA0112.namprd04.prod.outlook.com
 (2603:10b6:303:83::27) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|DM6PR11MB4754:EE_
X-MS-Office365-Filtering-Correlation-Id: e9336628-b5f4-4787-4688-08dceecc545b
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?S00QwSGBctDuoR39KvOZ8kW9YV87KHM8iZ25RvIssyDDHklErf4Owh4rl8SZ?=
 =?us-ascii?Q?MHl/2RAmugemSiecw8GgWc4ry1KN80mj7ezagsUGM7nJUYJogQkrQGqNdH+Y?=
 =?us-ascii?Q?k1SCrdtdi2p1zsp6KFVP5DLRukvhwryUFT1gRyQjCbQud6fLFRHvmSoK5dLF?=
 =?us-ascii?Q?teUSFWBfjW9PPKEA8k2zsqHv0zRWfBPaPiZz/q2XZ4LXwLTV8oxvqN/CLX/z?=
 =?us-ascii?Q?+Pt3StveYGx4zSXJVvIv33meSyQ6wmfTzYy8w2emKqjl1mb8OB9iN0OhqY/w?=
 =?us-ascii?Q?zkzk6vh5KtejzhqQGOPSr24Lxyb/USXMCOcDXbLUcldSS43/lOaMdXD/xhtE?=
 =?us-ascii?Q?zFyIyLnC52ZQtGpPj02TM+OuHV3aAGWCuhMDLJcwTEjiFbQkjfNL5gqUg/AU?=
 =?us-ascii?Q?64u+0pGwg6bvAouPwjqrkCrkHEL8bxWqQvkpnM0/gMy2e6/Q/RclJaSSmXSk?=
 =?us-ascii?Q?u0f2tZugZzBV3QwnHbtto1VaBcL9EuDJwaRSoN1hC2mtkUa9hAKQkc2C12gu?=
 =?us-ascii?Q?/jB/G/L2yWu2diHrE18puBv2drsZbcMU2N/7kSMlTavkMutY5r03FiKrfhHY?=
 =?us-ascii?Q?BjKhNLSDR0GUfPc4OdZeyaUHL9lNPMu0sTml7cEB+gOI1ey/69NFzAiYRXQx?=
 =?us-ascii?Q?EyOekNFAuqolidKFOVZRI1OPFyV/O4hWdYK+D+rOIZjG1BkcKvMNavRaM8B+?=
 =?us-ascii?Q?YO2C/OVIPen70HdYgM7uec/GkpzbDauWxbNPoqL/3fwY/l5xwB2FDw4DaWar?=
 =?us-ascii?Q?jPtRUv2PwH0PL0fHvKyr1VDN93uu4LEq0Oqd7+rTL+13EUSMKck07hhakLkr?=
 =?us-ascii?Q?QlCE0I5+fme0Yf9Y2/h0B3oNp3rvWSPiXErmAxsjKFielwFekm45VtdIGP/6?=
 =?us-ascii?Q?Lg5fw3E9IdX/T8KRCqRkFGHOg3kn46XGrl5R22r1oCn+sdy+ZqZT05uue5uE?=
 =?us-ascii?Q?BlI65vboGpYmvou2uXIWxRcUA7EQDUxoa06szwt5Zsx9Dv6B1ZEASw9iOdhO?=
 =?us-ascii?Q?K8czqd0CWWTTorSdvnbcAfcqvo3kbYLsuJdnr+vEa1s1MmYWphtKPwZ2Uimc?=
 =?us-ascii?Q?n2LnvweLpBGznRF2+OLDTEe42LaDZ2EfQtbImLuUz8U3Yzfz8OWkLMYyPwne?=
 =?us-ascii?Q?z1Fw2OKsUGZwXADEgDdCPrU69f/pwO656JAUXWEfc2dBYeel17UA/NIAnoYt?=
 =?us-ascii?Q?8iHox+X0gBvR2NwaR2aP8+t9bk7+008rJy0W0zbSPh3ls/8eaPNyiTnG6VHU?=
 =?us-ascii?Q?df9DXXbH09fxokRn60Yji8RRYGwsbRS9AYdO9rPG/XH1zIFIL3mf5Ak0t9ic?=
 =?us-ascii?Q?Uu1NXwFF3+4RlmX9l0gzrXYs?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?l3kzql7+GlQg5jr+bV57qFmr2Arco29h92xVz1cD9c5nMFYgb3n4cDKmiuv1?=
 =?us-ascii?Q?uizyfK4p4Xu7rbVpelE8c0AxutmTLBWMo7j4uapLnu/vPdddtDlwp+2tL/Jj?=
 =?us-ascii?Q?NY2O+9alsSTNqkZlMeFG1ol0zQ+wXTrV2O2RLr0V4l0bd5ESlKfvoez7+F5a?=
 =?us-ascii?Q?3fhEcj988KOnsHG5JfunmCAzolGnCmDQYH8bm/XGn1dF63ODWOIUrgLHZtlo?=
 =?us-ascii?Q?cgBDjIDp983L+EIESjQDXqIUm57aJ3XsIlgQ8PAnbg7cgIlMr8MTFkohpfMo?=
 =?us-ascii?Q?dkOscUHhvtUxUBAg4Li0qF8CoaCw9JZRtDKGKALvNGq0zS6LmYBsl1TUvQle?=
 =?us-ascii?Q?bGbT67+hMHjHjCKb1LnY15YuLV24GgIr4dkmghp2IUd3ReijbUzK1A8E2xi9?=
 =?us-ascii?Q?W0zpbzt2lXWJgJfInNoUrTZnlY2uwtn44pgZQvNcLwyLNJkeU8p1DdDn8NcF?=
 =?us-ascii?Q?xYj+OGDvhkpg3ZsypZI+lrFXHEYj9UZnL+GIEvcIngxNMoaS0RhPvShA8ZDC?=
 =?us-ascii?Q?7I0EdNwMiGyDuM67HC/0Uq7z109hwRcByL6RpAjKzzcj75rvlJpy8VxmQlrK?=
 =?us-ascii?Q?vhDDKTTqKcR3Vst7MnZ/rtgIjv7ro3K66VU+wPP6BxXQ2TTHm+rfqHTiM7BN?=
 =?us-ascii?Q?ZCeyvhU5p9gvDIThsgulv3ms/PyqJi4LZbbto9xvlOu/GrMmk9HiTPVUVZ9g?=
 =?us-ascii?Q?jjj+buHjPNnIZRD7t+XZHB5jgSDu+Qa/ivth5KR3W5dHLUXFrSz9GZiAlC6r?=
 =?us-ascii?Q?B2m5kb3BYn40VqtmumbGFqb4I+opT4AZGNdfUq1GhGBOL3wqQXYOizi+AQGg?=
 =?us-ascii?Q?0Rz7rdZRqWwkVX4v9JJkxiy9M/Ly6G3UX7/0D1+pZXzZjfgCWXJnds2LQt0L?=
 =?us-ascii?Q?QcqPAi2Pw7gMBn08tzfUq38StUaqkYRUueinstx5ICUqyrzd9RNLHzARy41E?=
 =?us-ascii?Q?DuC1EH1O2M9rJtHH6gtHH5DhRm6cd8AGdNfTHTgcsrE2+56YfbP+NVpBS8jO?=
 =?us-ascii?Q?lfe41Yww0qZpPZwvDLdLX5iPrcffC46HQ3kyXD8KW0PL6RD6xkzkCcPNz8pD?=
 =?us-ascii?Q?8FodJPvGy/UZ9MY7UoMkR+Nl3NXhrFhhtlNceH85bm1qfY/vO+AdriVMyso3?=
 =?us-ascii?Q?bpN/Kr4/PsnIVVRpEdNUyccYBIBU6pjJmC2BMzy6E9c7iLZjRf1bOcu5zRAp?=
 =?us-ascii?Q?/ymTNU+gS8xpy9OqkET0H32glU+o6+OUWJujEaq+8VEvKwm6l46XCxSQIBoH?=
 =?us-ascii?Q?xcPvmtLSOpRk4Xue59q9RZz9hl1tQgOTz/Xx96hcIstn4GuinYM12yxpj8YI?=
 =?us-ascii?Q?peINxBi21a0HXwxWDCySvKwFcUo29YQ6nX+nsQY6LyXG7X7DwN14Bh2oK8Cw?=
 =?us-ascii?Q?IKixRwIE1WsblnQ6dc1e8tu+/NULQDRpNgT7S6gLrWm0DFNXU/bHWfdlZsUQ?=
 =?us-ascii?Q?OD36KK5sziMU2+BymQemXCVk6T4etjvrvdf1Z4gyW3s0Cc78Q5hbylRn/wOT?=
 =?us-ascii?Q?7dQBhrAyyY2gkfDcvMZ8j7L7ysX6xXyeCPr2pzV8D4YiEkfH37lznhiUut7c?=
 =?us-ascii?Q?v0XvvpOraGkk3RbDo4zMxPCbJKPF+GDrRw1WCM/AxXkcvRx86ncPDevBvtNQ?=
 =?us-ascii?Q?rA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e9336628-b5f4-4787-4688-08dceecc545b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2024 16:54:13.8127 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z70xkwnezPeFxcRUjr6LwbxyLkFAP1ygHYbiVDOZKFlm3Tcvy0qvTcAWXMCfsvam0oEJJh3FJZukIsWihX62yQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4754
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

On Thu, Oct 17, 2024 at 05:11:37AM +0000, Arnd Bergmann wrote:
> On Thu, Oct 17, 2024, at 00:26, Sean Christopherson wrote:
> > On Tue, Oct 15, 2024, Arnd Bergmann wrote:
> >> diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
> >> index 46301c06d18a..985cb78d8256 100644
> >> --- a/drivers/gpu/drm/i915/Kconfig
> >> +++ b/drivers/gpu/drm/i915/Kconfig
> >> @@ -118,9 +118,8 @@ config DRM_I915_USERPTR
> >>  config DRM_I915_GVT_KVMGT
> >>  	tristate "Enable KVM host support Intel GVT-g graphics virtualization"
> >>  	depends on DRM_I915
> >> -	depends on X86
> >> +	depends on KVM_X86
> >
> > Can GVT-g even work on non-Intel CPUs?  I.e. would it make sense to take a
> > dependency on KVM_INTEL?
> >
> 
> Yes, I think that should work, but I'm not sure if it needs a dependency
> on both KVM_INTEL and KVM_X86 in that case, to handle the link-time
> dependency in all configurations.

not sure as well, but let's take the safest approach. pushed this patch.
Thanks

> 
>     Arnd
