Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E522AE7187
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 23:26:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21D4D10E625;
	Tue, 24 Jun 2025 21:26:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k5V5G8zs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 806CE10E157;
 Tue, 24 Jun 2025 21:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750800377; x=1782336377;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=xJ62gADsTh435dfUGolhy/rwgVA5LoyUo5DHoDA4Pm8=;
 b=k5V5G8zs+NgBh5b2Qe6snmPGM0pypqxIYglHWJ4L07rUSHo2r6OkcRDm
 HxOutvmKWflBLmnS6e7mfPX6MzjS5yBzGHAdZS8Vd3XhtnGBAiG7Iq7yM
 Ii4Y5QBaafMlyLe+GKWV9i3B5s9NNAHvJPJKePnNAptzs8MIEJohXEUAM
 UWUDTudCmil3YTGz9VxE4DlBFzCkEDv4ECAj/H2AHKi1r56DtHkg/xXlI
 DiZizgk2YfLzxkWhp1WQvBdO6NHxzVSWe30Mg5J/h87D3IZd3p43HlK9X
 Lfmzs9+oN+y0xDuzCAdApOXiHBQSbswoVgaNoIVbAosGKxLRP4VoPavAa Q==;
X-CSE-ConnectionGUID: ZRFxaJtYSNqCfirPASs7UQ==
X-CSE-MsgGUID: UpXiAIT0TBu72QCQsjFdVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="53192570"
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; d="scan'208";a="53192570"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 14:26:11 -0700
X-CSE-ConnectionGUID: AA/eTGYpQFGPGtumpX79mA==
X-CSE-MsgGUID: 5KzBbv4ARlKpF8KzjBSD7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; d="scan'208";a="157523566"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 14:26:10 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 14:26:09 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 24 Jun 2025 14:26:09 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.56)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 14:26:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E+DX6l683Ir1YO9Liv1cXVb8VsFmeP5QLAOj0Svfzho2x1SwSD/Ae0HBhaS0nZ3T9uopM5pHqjBNdfm8DhhUcXBF3FPpaeO82lD6qVrTW1JazA/wTD8lqdX6jXxFkHdHpy3ZqCvk+ZlSfpw9Eyuj9gJ6XBTY+DQmPptOkyfV1GK8Qd95Y1nFM8z0KA2+OnBu8Qf663ptiFkr27F7OAyQ6Kq3b661+C4S4c8Kb3XOW92Nd30S+JuIWnebFTev0EevuIccVopYcIHAOyy5Styik9XbMyzPn6F8UobSjejEbuKCoogC3pG6CeE7hQjnaEtBa4szZWhAXFzK6aN04XFrQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=peo3Au8w10DKVa7lbgB9qPGgcuNjHaFo9iphGTaa3CQ=;
 b=twAgwPCy0FMuFRNipKIw8e9WGJNhmkomUyJ7p78nCiZqlCmy10jZgVRJYLd6724i7n0m1WVzwqMOXGsKqDbJtLUxa+qXjFGpm8PjMViSPNaQTy2359NH8UeLlUqMJ5B3CWhlIz9tCby8/vU4Gkv52nup3I3DHvQ1cqyKUosrFaXquQ6C42s9l4o/Un1rY8UyLfA1yoXYcCPAHbVloHPb+hFJ/cwgfQn3bWW2o5EvcEQi6TbmhvTR/E5sHqRIiOnovwuOfRl3SkdmOGGcun6l0lvyep87f7zRv+4OnJtVRWLdpwX7GQ7CVBNzQTT5QjqDwO5HwKWvLI0bVGPoXtL+hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SA3PR11MB7977.namprd11.prod.outlook.com (2603:10b6:806:2f3::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Tue, 24 Jun
 2025 21:26:07 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8880.015; Tue, 24 Jun 2025
 21:26:07 +0000
Date: Tue, 24 Jun 2025 17:26:02 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Arnd Bergmann <arnd@kernel.org>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Arnd
 Bergmann" <arnd@arndb.de>, Nitin Gote <nitin.r.gote@intel.com>, "Chaitanya
 Kumar Borah" <chaitanya.kumar.borah@intel.com>, Krzysztof Niemiec
 <krzysztof.niemiec@intel.com>, Ville =?iso-8859-1?Q?Syrj=E4l=E4?=
 <ville.syrjala@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 renjun wang <renjunw0@foxmail.com>, <intel-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/i915: reduce stack usage in igt_vma_pin1()
Message-ID: <aFsX6qKE_xdgG293@intel.com>
References: <20250620113644.3844552-1-arnd@kernel.org>
 <aFsVMcb79rp8kMpF@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aFsVMcb79rp8kMpF@intel.com>
X-ClientProxiedBy: BY3PR05CA0038.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::13) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SA3PR11MB7977:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c2f9f82-bc16-4f51-ee50-08ddb365bb39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ohxXXp+kcLWgvem29I/btVbNQuxouHutiqdF7Gf4tAyk8ePeJO7AW90eFO/o?=
 =?us-ascii?Q?PioG8BN6G3ESstcHiYkThs5Lg9Od5SE7T0VmKN1kqaZQF9jJ7AzN0uxNB2Jj?=
 =?us-ascii?Q?tAzM5zf6rcV2UB5vgFLwNQaZcBOYRazdAQcGQWlAn2DK5y7bOrx4iplaQxj3?=
 =?us-ascii?Q?0LZCUad088x3s/bQF0RA3wancFTwGI6wDdcwCqyfckSdTSh5Ki33lOKg08cw?=
 =?us-ascii?Q?i8pfgB1nCShAp56i8WSTSHz3Q/lZfngC0hk2+HPqMDWp6CC7rSFmbA1Jldw5?=
 =?us-ascii?Q?7DsmsrkNSfdlz+DSI66/pp5RPovs0kisMp3cJ5l6Qm5doxR9EfRi8xaB7oS6?=
 =?us-ascii?Q?qppZxbvIS/TsO8p1zy+gakHGkFJqkUDz2Rk8pQE4upv8htNdCPR4+1KAy+Ps?=
 =?us-ascii?Q?RpWTLaf30UFmrDdrTz0AmnGRlbhCHbUuL2GeZt2vcZzQd2KfVUZvV+wlQL1p?=
 =?us-ascii?Q?cWN4WMUUe0KWjoa1v+XxcVY+17iyB2sbGiVJHPj+s42UtJ3TjDpeo/11Cd0u?=
 =?us-ascii?Q?unuw7YftfEzDj4Eh4yjB0ledL+rK7EvZ5vPCzK0psNJEp57AaWC8NkDj0O5F?=
 =?us-ascii?Q?J8hUfMbridqqHj8p1Orb7X5auiOPVzUF+kgKmA6E7SDyjTypLlJR1Yf8684y?=
 =?us-ascii?Q?CM9jbnL3DfR+7zSya0ySurvbyXMMsMn6d+RfP+6lYXwJsvYuspVK9VDpw1wD?=
 =?us-ascii?Q?FQbiedmCm0E5qDOYKKwZlx3gpT/MeThledeWELFyEEWrUAlMLcR7pRbCUxeC?=
 =?us-ascii?Q?Ih8l4YAog3oSZ8pK/vU400CzP3FtSydGIeKIyL6uCiQQf/6n5xsspTtfO42d?=
 =?us-ascii?Q?6VqxCfh9eGbfaRKRQxNaqDEWIq6H85t95pe0JmQo8UE60Lh2woVcx8kQWI4v?=
 =?us-ascii?Q?kDOwjm1Dufj0d2D4KONktmDhDyk+VBON/JMHfQfzul2GjZQ7nScW1D1VHHLF?=
 =?us-ascii?Q?O4lvoS2ZQOfKdbE5CjzBp7+UwtTKS/ImdNlevVGbHDAmlT2pcOrRyDnqJvGo?=
 =?us-ascii?Q?iNOX2NeKLF6QOQK8DsCUhSXZp9cv0VpNYvSiEEwquAdLut6UIf7H3PkvXxZq?=
 =?us-ascii?Q?342FdmK8o5levU7SrleS1A5P3CgmKx/jzlYhATs80jqFwIi+UGYFy7QLRsis?=
 =?us-ascii?Q?Org8Kh7Qhu3029kU3pDiDcN3fYZLn3O+CyYawzQ7zgT2+9cjcvKZZbordzbU?=
 =?us-ascii?Q?Pmn5lPxHbTSaqNb0nTE3VU0zmzyLe9gnG745Z7YJZxEEUR9480JNIqjN9TgH?=
 =?us-ascii?Q?mPkK1JlvOaQuTd4uTPwokT5CfYqmelbOpAdwOy9ie9NtI/pe4V8DDdfLNBWA?=
 =?us-ascii?Q?UDbZYSar/H6M4iFUpNZCOOTtz/k7NhQbUe4DnjWBsvylNe4anPBCNvN1gcAF?=
 =?us-ascii?Q?B5LDpdKQB0HNElXO6Fe7y5Lwu3I9CzAG5uGy8kjr2FK6uxXe3zcLhwGhW2Lh?=
 =?us-ascii?Q?amr29kKHKEk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Qx/Gxf+/lyKKLaxBpcI3Dg8+wHWTKhvYs3clOatRwS42/HTShaOQigXw0UYM?=
 =?us-ascii?Q?1eGwyHQl5o3X2lm55zHsX1UuujTbS15tO4ZI0B3Bpu+ON/mGuxzXXuGdWEOP?=
 =?us-ascii?Q?tC2VydR9cSJaTrf8Ct1d7J/ewzYxEH2PmV+REFwqNkOZpF93B8ltXRF8G2tk?=
 =?us-ascii?Q?l2N/Ll7NBKPHKWG8F2ex8wFfhdPDywriu+5v1NKKUQmOo46wDZIWLrDZ+McF?=
 =?us-ascii?Q?HmX6tXZ+jom5P3L1pfxf7JUZ0yeb1YCm4Th80ZIzgmgYQehRE3RmvPoZo8Ra?=
 =?us-ascii?Q?OEep2UIAH4CLn+frgZRib3hKxzvdwvKzYUwhqsrhp4JfnOM8Gb/uLNN/heEj?=
 =?us-ascii?Q?RN3ZH+fFZAqsCml8qAitKUmjsWuPZaC5GBw2fmnCIT9mRp2sL5cz2v8G1xWO?=
 =?us-ascii?Q?JuwkBTt6RmPtmqiwZHotSn2XLJ+6KkEwK3GQzJiEaHV5Ep7B+r0CMLBgpmnG?=
 =?us-ascii?Q?QvuEnIS7Ty5/9fYyE/5v67PgNw+DsqJEGu2rguDuYOFMeF+7wj+XxYaicpS1?=
 =?us-ascii?Q?QKXPrQipDSXUWKZBkGYzO7l0fLRaHvD4i7cnHp5hvt9C4WxbZsYBxqKLx7EC?=
 =?us-ascii?Q?BjtrBViugONR+bfvI/n+EXYrwLGGdiej7Cs8sM3FpSo+HtnyqomW8MOPHOdW?=
 =?us-ascii?Q?ExlNaqTo7QF8CvoZrzT09wFwC7oXSJ+YliUs5zrpjeJllCornJyuXgWyclz5?=
 =?us-ascii?Q?+0mIJytf7dR+eavooEnLigQxoLL1F21ZXzwFlHJGv/bjN+9LKhrb4jqgtd0m?=
 =?us-ascii?Q?TkX2AQvfF16EdWB9fJq6QU/ZghW+wX0YPQEmz+97XIVkVbol7JlFZZ5JC08B?=
 =?us-ascii?Q?eKICPc61NdSJh9xs1adw5dikHZx9zlV4h5xjbQb5GIKMnlPQNNYdgaZtroCI?=
 =?us-ascii?Q?OaHdfejqUdoaQJWi44DIdzTN0drMC4Iw7w4+neMckE0m3jS0+7lEGp8A1Ah2?=
 =?us-ascii?Q?cdYCRnpRkEDsWJt/rVV45V5pq2MLrC7YAYeb0b/IPFDTdIktzXM3ygplU070?=
 =?us-ascii?Q?DyQa6c7J1kxZCkyiUwKLfLfz/3pN/OLlONW9HwoPb+qobYBJNSeclVjmcFJL?=
 =?us-ascii?Q?xfyu+rHc4liLZY9x2tWgDoFY1gD/OTPk0zzOdQaCMO6didfnnQBISPVM9D6L?=
 =?us-ascii?Q?LnSKFP/G2CM+h3AyTy0haKAxuYaHFJU6Gkxdjv2ckdnedpupqRMlYawUSsJ4?=
 =?us-ascii?Q?AlM5KfCvN32ldhG3yEzCxW7osL9ezFPWfGoZxBDc1MJT3bIwVp38aLpXpgRn?=
 =?us-ascii?Q?XF1LInLGxV+NrMw7vvGto8m+hxMSlOE8KwfSSaXtvaDqKMWpWUEXVJpWsJAn?=
 =?us-ascii?Q?vVf388UFZoKcyGWX7wZDuQ63SQ6j88YzTdNn71uCGQ1buoqsvEinkQgMfxrE?=
 =?us-ascii?Q?G5kKIOlId2kSMfiZFnaP534aGVu+BdX+XKW7VI/rCmG99dpqE/c7o9fmWDw2?=
 =?us-ascii?Q?PNRj93z9b6CHfgoGftYakiOKKrfk5jt2w4+d8Hw6OXGEIpOot0dbxxkVwJrN?=
 =?us-ascii?Q?L5NxpQiSp/z+19fOoydUA0NXOju2HlkCT9pXODGgu0R/xC870JW3sj71u8pH?=
 =?us-ascii?Q?XzDZ5mbMBoLYLh18SScpJrUywWZC6TycK6dW/a0X?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c2f9f82-bc16-4f51-ee50-08ddb365bb39
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 21:26:07.2416 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jbXpXnOKp7475A3C0aXyLQiJ+BoPlob+Lz9uhaKSfUYrJphtfIi4gm9PRWrD6xaJXVF060UwWWXJ1j3OeoZyzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7977
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

On Tue, Jun 24, 2025 at 05:14:25PM -0400, Rodrigo Vivi wrote:
> On Fri, Jun 20, 2025 at 01:36:38PM +0200, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> > 
> > The igt_vma_pin1() function has a rather high stack usage, which gets
> > in the way of reducing the default warning limit:
> > 
> > In file included from drivers/gpu/drm/i915/i915_vma.c:2285:
> > drivers/gpu/drm/i915/selftests/i915_vma.c:257:12: error: stack frame size (1288) exceeds limit (1280) in 'igt_vma_pin1' [-Werror,-Wframe-larger-than]
> > 
> > There are two things going on here:
> > 
> >  - The on-stack modes[] array is really large itself and gets constructed
> >    for every call, using around 1000 bytes itself depending on the configuration.
> > 
> >  - The call to i915_vma_pin() gets inlined and adds another 200 bytes for
> >    the i915_gem_ww_ctx structure since commit 7d1c2618eac5 ("drm/i915: Take
> >    reservation lock around i915_vma_pin.")
> > 
> > The second one is easy enough to change, by moving the function into the
> > appropriate .c file. Since it is already large enough to not always be
> > inlined, this seems like a good idea regardless, reducing both the code size
> > and the internal stack usage of each of its 67 callers.
> 
> indeed way to much for the inline.
> 
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> Also pushing to drm-intel-next right now...

I also pushed this to drm-intel-gt-next...

> 
> > 
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > ---
> >  drivers/gpu/drm/i915/i915_vma.c | 20 ++++++++++++++++++++
> >  drivers/gpu/drm/i915/i915_vma.h | 22 ++--------------------
> >  2 files changed, 22 insertions(+), 20 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
> > index 632e316f8b05..25e97031d76e 100644
> > --- a/drivers/gpu/drm/i915/i915_vma.c
> > +++ b/drivers/gpu/drm/i915/i915_vma.c
> > @@ -1607,6 +1607,26 @@ int i915_vma_pin_ww(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
> >  	return err;
> >  }
> >  
> > +int i915_vma_pin(struct i915_vma *vma, u64 size, u64 alignment, u64 flags)
> > +{
> > +	struct i915_gem_ww_ctx ww;
> > +	int err;
> > +
> > +	i915_gem_ww_ctx_init(&ww, true);
> > +retry:
> > +	err = i915_gem_object_lock(vma->obj, &ww);
> > +	if (!err)
> > +		err = i915_vma_pin_ww(vma, &ww, size, alignment, flags);
> > +	if (err == -EDEADLK) {
> > +		err = i915_gem_ww_ctx_backoff(&ww);
> > +		if (!err)
> > +			goto retry;
> > +	}
> > +	i915_gem_ww_ctx_fini(&ww);
> > +
> > +	return err;
> > +}
> > +
> >  static void flush_idle_contexts(struct intel_gt *gt)
> >  {
> >  	struct intel_engine_cs *engine;
> > diff --git a/drivers/gpu/drm/i915/i915_vma.h b/drivers/gpu/drm/i915/i915_vma.h
> > index 6a6be8048aa8..14ccbd0636bb 100644
> > --- a/drivers/gpu/drm/i915/i915_vma.h
> > +++ b/drivers/gpu/drm/i915/i915_vma.h
> > @@ -289,26 +289,8 @@ int __must_check
> >  i915_vma_pin_ww(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
> >  		u64 size, u64 alignment, u64 flags);
> >  
> > -static inline int __must_check
> > -i915_vma_pin(struct i915_vma *vma, u64 size, u64 alignment, u64 flags)
> > -{
> > -	struct i915_gem_ww_ctx ww;
> > -	int err;
> > -
> > -	i915_gem_ww_ctx_init(&ww, true);
> > -retry:
> > -	err = i915_gem_object_lock(vma->obj, &ww);
> > -	if (!err)
> > -		err = i915_vma_pin_ww(vma, &ww, size, alignment, flags);
> > -	if (err == -EDEADLK) {
> > -		err = i915_gem_ww_ctx_backoff(&ww);
> > -		if (!err)
> > -			goto retry;
> > -	}
> > -	i915_gem_ww_ctx_fini(&ww);
> > -
> > -	return err;
> > -}
> > +int __must_check
> > +i915_vma_pin(struct i915_vma *vma, u64 size, u64 alignment, u64 flags);
> >  
> >  int i915_ggtt_pin(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
> >  		  u32 align, unsigned int flags);
> > -- 
> > 2.39.5
> > 
