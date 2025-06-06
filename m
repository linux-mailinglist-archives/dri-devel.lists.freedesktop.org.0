Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E977EAD037E
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jun 2025 15:50:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31C2E10EAC1;
	Fri,  6 Jun 2025 13:50:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R+pnxk+h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EE6B10EABF;
 Fri,  6 Jun 2025 13:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749217837; x=1780753837;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=i/sudmvIa+xUKC3j0ysxQNaoXS6dHWxagHO2lOABoJE=;
 b=R+pnxk+hzDGGz5k3Ewq+TiGsuyGB0kBOn8kozClTvLk4m3GemcHk3b54
 QLH8LrMn0WBx/92fO8RRhWmgBxk/tndKOuFVpJZMrFZA5uNfJ1pabP5YV
 6wd8d17EBJbs3btkjeE56Wc7DqzQHbwLQKyR9THclok8gXImtHgTRSogR
 SQCPeHRmxBTrew2CcaQx6i1Wzt8ul1ZCXSQFqxr9CvL6OuPNHkSoyH3RW
 ipFaxMlRNbdojrYBTdf3gyx6zaiydjDj3iNSQxYM/pesNip+Hhbezmj5l
 nDbn81z7lJwUdgl/WfYYyEwFtA9k3iYVT03fB3QTdy5puho/OX3iSQByI w==;
X-CSE-ConnectionGUID: 6J4tA8IhSI+3HfAWf6eMLQ==
X-CSE-MsgGUID: maCw5F0bT4e7CmsBEuXs8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="55173907"
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; d="scan'208";a="55173907"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 06:50:15 -0700
X-CSE-ConnectionGUID: O45Gt67dRNq6IhcDzMmIBQ==
X-CSE-MsgGUID: 6HjtQGZVSlGLobQ7W/lZyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; d="scan'208";a="150842411"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 06:50:14 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 6 Jun 2025 06:50:13 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 6 Jun 2025 06:50:13 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.69)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Fri, 6 Jun 2025 06:50:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rsk0u+J5TYEwrT24KP0jGiKeS467RPoO30ZGgx9XyrKihy9P0Hm7/N64Jr6n90qK6U/bgyxb3zTQsXwno4Q+8hHz2A7f/ldg2ryTwqGmaWj9/UYlTLBmleY+8P3Edw5vkQQUVtLOIMysltyoN3dPuJ+lZZrQfzHs2y3iFFZ5k9DCEflzcgZ9au0xp/59V0KeOd+GQeLp8G84Oudx8aFxnbo/vNmi1XXhS30mlUOXCQ3PX6zUeRfDWmINxxtSIvQDAUv9O9rtmYuWVV55BTuw4ViRe3RkAZmTQhbPBkTz+YlLFE3XOKq1xrmxf7ZF8jy38q3AsOBg8WPye7HKp6YFQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g4NeYOWNOASLIbuc7Hh6kYhgHOZyRG8KUsUyHiskCog=;
 b=QIWo7q5wopxTJwC0QqRfwZVtXJz4iubTUbozl2Ivs8TcYh1pDtRDI4dvaAEwKHzW+aAnjVKm+xq6273AzTOyozZ3toc7xdwhe4W8iiN3AF2kwcZxUiF1fVtvDd4Y77TQIZnNbh78dvXKulnbfBgWV3EThUUsoVWxDmQJFunDpBBQa0Nwt1+hq0ovgaYKLQuTVdEVki7JbIgZ00mfEjQlUiftypGuUcA6NWC1uTinFxWVoKiHbEde9bfatIV4msgRRBJx4IFIsFVuFv6Cxw3wJ4lX7R2bX4OJxliZCyqTb8iVdlCMUi113PVc6QzsTixWNjPXAxlYpBiNiKUhEyiyhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by MN6PR11MB8241.namprd11.prod.outlook.com (2603:10b6:208:473::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.21; Fri, 6 Jun
 2025 13:50:10 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%2]) with mapi id 15.20.8813.020; Fri, 6 Jun 2025
 13:50:10 +0000
Date: Fri, 6 Jun 2025 16:50:03 +0300
From: Imre Deak <imre.deak@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, Ville =?iso-8859-1?Q?Syrj=E4l=E4?=
 <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v3 5/5] drm/i915/dp: Disable the AUX DPCD probe quirk if
 it's not required
Message-ID: <aELyC0YxLiIgxIj5@ideak-desk>
References: <20250605082850.65136-1-imre.deak@intel.com>
 <20250605082850.65136-6-imre.deak@intel.com>
 <99b831c92a446eb5e33d8d9536f6750d4a6e3ae8@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <99b831c92a446eb5e33d8d9536f6750d4a6e3ae8@intel.com>
X-ClientProxiedBy: VI1PR06CA0189.eurprd06.prod.outlook.com
 (2603:10a6:803:c8::46) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|MN6PR11MB8241:EE_
X-MS-Office365-Filtering-Correlation-Id: 264d64f8-a914-4b8f-2fce-08dda5010dd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?IJz2ZayZ6hZ/mkxcwxcguKa3JFCcbviKtSNthQwSJmaJDkN5rBMvqp8ry5?=
 =?iso-8859-1?Q?GucUGXb4hYD5lOR5uxAZ47a5nxhTaseVuMJqh1pMvaC2k4gxKH5sY4QJag?=
 =?iso-8859-1?Q?nSX7ANPhSmQYpfVJ7uxkcyu+HoCCOQ96JrX/U8EAy0mpTn3XDF7XorTJA5?=
 =?iso-8859-1?Q?Dkp0MdOxsRAK20ADrx+1lW7y85ItSErZy9F5aiORQwYQzygW5CcwSNjfA2?=
 =?iso-8859-1?Q?pkxsZTVz0TawxwmGF1UOjMlD2MOCxlTtgbvWbj1Em8NhJIQq8IfJDN/9BK?=
 =?iso-8859-1?Q?3g1kW1/E4wK45rLDj3y0S8/E6B4posAdQiw4NjIPCAwyg+XUpL7RhKD+cS?=
 =?iso-8859-1?Q?4Y0KfCi4hwGfLQ5FGiGfnWUdjppUHQVLXnJ9/3KPzOGH1M7+RE3AiaYope?=
 =?iso-8859-1?Q?y2KxWJsi5ZtxGb6Zyd+NHa2CDvtgZpOfiWsTJX5VX6m/OAD/Oy34TXMr3Z?=
 =?iso-8859-1?Q?Ho9tz01nV2BSSvhJEdEf6h31R79qiXJ8OE//ByTcbJT/xIKPWe1BFn/uov?=
 =?iso-8859-1?Q?kW+7viIRnn8L3F6EC0U9TIIr5xbkw79FcVoRlB35gZB5OF3gr2WmK9ezRA?=
 =?iso-8859-1?Q?CdeFXCbDep6WkeSOqR15F3zdr7Ohh/8KEVnrRwDV1bfw6OH+eGLQev5yeQ?=
 =?iso-8859-1?Q?hjj2hP1B2X/6g6C7tkgPM6oY1q8MO5wKdd46wxppSG1ayhuppf/1L2H+rh?=
 =?iso-8859-1?Q?VNY7SCpT3Hk9CFkM5mJupqJZP+GCTZNRiOmbVZiitgfWzybsunPIl0OSTN?=
 =?iso-8859-1?Q?lwhEzqjllpDlRMwnnSTorASeV5EL06ywv76JUhvzC+PNw6EI1nUcUyY/+J?=
 =?iso-8859-1?Q?IlfiqDHDN7fZ8tJpt6kSQtm3SXQrHduo816ZSg02s5qG8OutI0E8VPwJVM?=
 =?iso-8859-1?Q?NlCPCCUsy/fBIEpset+PT+Xq+A08lCRhvYx4IRYAd4H3YpqFMEVltLA3+M?=
 =?iso-8859-1?Q?rG/3PY5olAOZ3prhJuzHTjF0NkV9HjyO5tcQTbqLcbM/jrSRgwpXagqIWU?=
 =?iso-8859-1?Q?qWlimY14Yy8OqV1JZ3cQIH+3nh+rZUpyJvid7Px6MNhbG+oUSMN8/wtyFO?=
 =?iso-8859-1?Q?OInGE9NPcuaSvEc/4UeBCM63QJPH5P/nL4SEj/Xng26KoZE7MykPkM6JRL?=
 =?iso-8859-1?Q?Yfp0pLFuKmCTdnG7o5e2qIHUVW1Pv/N1moz/N2l2mkZyyGRtGafcwFk6oU?=
 =?iso-8859-1?Q?oacuZPSxJ0DeGg/66LImTqC02zo9IPSsfw3daB6dN4f1Ddoeja9UgHagPE?=
 =?iso-8859-1?Q?qw8jC/3I8Ks7j8pjaYuJSltP7LLQf+lJo6hYq2oQBwcMSL9fBTCmxMQtKX?=
 =?iso-8859-1?Q?Z541mogWJ1GdiKAMwIRjvq3ZWbtH02U+d8pB5O0xlFaH3UsPUSpVhMKMSg?=
 =?iso-8859-1?Q?bMuVRUpvYAveg6M5VEA8LafNDo5nhgR/yPM8aBYlcu6Y6OXSod+EEpx5Sp?=
 =?iso-8859-1?Q?n80SuGJwXC3ybspgzhOZIwp5ffdq7eG0IQZ0HP3CyYIfYtN6c9bMIDgMPp?=
 =?iso-8859-1?Q?w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?mjFKWmybk2f9SYndysKFHm2alClYiGEvUO5YyWMK4MtEYQPVxZYUI+sr+z?=
 =?iso-8859-1?Q?FpvQ9nZmSu583uZXpPnD8FXp0ze6psbEXVrX1huIvq12l8FzXVqA0O+Zo9?=
 =?iso-8859-1?Q?Qn+ls59XVUJ0+0Qx4Iig8Q/BkJYkxJx7HQqzoqV7DCu8G1ImkSg1kPe6CN?=
 =?iso-8859-1?Q?0hQIZHBdp9+Q84vQxu/wlHaLH7OWrQHL6VQHY71p8WzsT4T+Pfu7gtduhK?=
 =?iso-8859-1?Q?tE9Smyg//YFGC/0m0/V9GATHZh8lvQj81KAbngIXxC0vdv+jQg6RTiXpQP?=
 =?iso-8859-1?Q?WnwJnaEBn3hdAzhx7VyI8E2xsoYfpVHmgPFbo79QrfMCxXDkfQMbqHgJTW?=
 =?iso-8859-1?Q?TMlpssHTPzMfz1UiMrLZlKOf//pi9PBxB5h8NZO4a4P9ndRL6gvFap/eno?=
 =?iso-8859-1?Q?Xaf3PPPVQcTgZe8G2oHc9cbyTlyh3okOmVQFpvppcfquJ5vMuIuaLmIBBP?=
 =?iso-8859-1?Q?yqNnNyj/3WNzyHPYj387fktjN6CS38aytJpeju5+CiFEKSIgrOPdqKVa50?=
 =?iso-8859-1?Q?RbMq0Kr6sYy3qcZlvTFF1MJwEKkSWg+vzOVzm0o1xahC8aveCwT/jWioWL?=
 =?iso-8859-1?Q?fvS2o4c6lQ+ueOc6EpUQfgsIaZldWky5QaD5DDjbfIlqPAQM7UXEkfbGKZ?=
 =?iso-8859-1?Q?mD4eBZXzKIEq88K1yOt+G0ybU9HC1nn5O8Faqmtfzjn98orc42DtL8ZWy/?=
 =?iso-8859-1?Q?L6oPQugHZK5hpOsWdhQMc2ugqFb5YqSSMAd6D7/LT6KiO0xTSQsO2wUKRr?=
 =?iso-8859-1?Q?WFvyz8MNCTVMJISkZwP830qisXDgPUBZaWIFRN1zlKposyIu9vQmqIEfB7?=
 =?iso-8859-1?Q?mmcSd5bdprH240XZivkPhXoLF3YI1602dwyzNvbmOt49+ZiqI17omLKWLp?=
 =?iso-8859-1?Q?w8XZEdR9ljuXXRakAn11rab5GqFmrBYDSoXoHRdVUHQd7KY+bci8qKs9RE?=
 =?iso-8859-1?Q?cgQ/t9Z25NcUAG6CmhWMDPj3Ytc5QZlcVzqNR8yHjVkzIYG3pKAbppE9iE?=
 =?iso-8859-1?Q?Ca8uYDHL2j9hzYyGXnw0pPLKTfe8gWwx4unxFAYUzXjQpA1eQh3NUqqPfE?=
 =?iso-8859-1?Q?8WiOoo3XQfvHfJOwjKJwWq4viDp0+NGUPfm4uBIJSGeuCRHZmE+eM/BtXA?=
 =?iso-8859-1?Q?mV+i2jf1n2H7FT0IwLGkNOpjFtrgr3HhoS02En+vLb8CUUgH4TOAzORiZy?=
 =?iso-8859-1?Q?krMV4CjqfPtkDSOy652CeIo4svQWEQ5ASXhw1C+JSHyTrzn3Oqo3WvbGUF?=
 =?iso-8859-1?Q?Yd98NHmNN9UxoDO3SU12CnC0xPQYMyTKKgzUyxwjhOkMWaDGu7MnT3I/0W?=
 =?iso-8859-1?Q?M4aenarFbD2aS+A1ug/kKCNgbwxUrxaaaYkobMtSQ6p5K44NivoqF2+OuW?=
 =?iso-8859-1?Q?Ieu9AHSfApmE+PyZVbHjokSF1uKTH7ndD0XXDGXx45JYGQ5PtSm5RHJnu7?=
 =?iso-8859-1?Q?bWU62aJngPARkREQEsRY04Plsze5H9Fzw6vyTJLh5ceMsIqPoAEBcsKqk1?=
 =?iso-8859-1?Q?wch4St6wsxa4DJRPwqSpQ+EY1I6V7yU3sr2p2UpBi4Xnjmui2/DASVO6DZ?=
 =?iso-8859-1?Q?u27VoQSvNj1sX4FeMeZ9wJFYjPmXdOiMCHwKoTdI7AzjnH1KTV3p0t6Fef?=
 =?iso-8859-1?Q?UiG0jZZIT+rQhRpGTsfccA+SBveZD7Dv3O?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 264d64f8-a914-4b8f-2fce-08dda5010dd9
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 13:50:10.3554 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xqQm+Vxg3Wb/z187mqz0bI/vD8i3W6ogoDkXQqLMXEet/zb0bjlQP/5uoLhGEB2YTJ10zimCf3d5qVNUPfPm+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8241
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

On Fri, Jun 06, 2025 at 04:44:37PM +0300, Jani Nikula wrote:
> On Thu, 05 Jun 2025, Imre Deak <imre.deak@intel.com> wrote:
> > Reading DPCD registers has side-effects and some of these can cause a
> > problem for instance during link training. Based on this it's better to
> > avoid the probing quirk done before each DPCD register read, limiting
> > this to the monitor which requires it. The only known problematic
> > monitor is an external SST sink, so keep the quirk disabled always for
> > eDP and MST sinks. Reenable the quirk after a hotplug event and after
> > resuming from a power state without hotplug support, until the
> > subsequent EDID based detection.
> >
> > Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > Cc: Jani Nikula <jani.nikula@linux.intel.com>
> > Signed-off-by: Imre Deak <imre.deak@intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_dp.c      | 11 +++++++++--
> >  drivers/gpu/drm/i915/display/intel_dp_aux.c  |  2 ++
> >  drivers/gpu/drm/i915/display/intel_hotplug.c | 10 ++++++++++
> >  3 files changed, 21 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> > index 208a953b04a2f..d65a18fc1aeb9 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> > @@ -5747,6 +5747,11 @@ intel_dp_set_edid(struct intel_dp *intel_dp)
> >  	/* Below we depend on display info having been updated */
> >  	drm_edid_connector_update(&connector->base, drm_edid);
> >  
> > +	if (!intel_dp_is_edp(intel_dp))
> 
> Why does this depend on !edp?
> 
> Feels like unnecessary optimization based on your knowledge of that one
> specific display.

The detection itself requires probing before each DPCD access. I want to
avoid it whenever possible and since the quirk is relevant only the
particular HP external display, we can avoid the probing on eDP
completely.

> > +		drm_dp_dpcd_set_probe_quirk(&intel_dp->aux,
> > +					    drm_edid_has_quirk(&connector->base,
> > +							       DRM_EDID_QUIRK_DP_DPCD_PROBE));
> > +
> >  	vrr_capable = intel_vrr_is_capable(connector);
> >  	drm_dbg_kms(display->drm, "[CONNECTOR:%d:%s] VRR capable: %s\n",
> >  		    connector->base.base.id, connector->base.name, str_yes_no(vrr_capable));
> > @@ -5881,6 +5886,7 @@ intel_dp_detect(struct drm_connector *_connector,
> >  	intel_dp_print_rates(intel_dp);
> >  
> >  	if (intel_dp->is_mst) {
> > +		drm_dp_dpcd_set_probe_quirk(&intel_dp->aux, false);
> 
> Isn't this excessive? Haven't we already set the quirk state?

No, this is the MST root connector's detection and we don't read the EDID
for it (we read it for MST non-root connectors, but those are not
relavant in any case). So this should be set here explicitly, with the
same justification as above for eDP (on MST the probing is never needed,
so we can avoid it on such links completely).

> 
> >  		/*
> >  		 * If we are in MST mode then this connector
> >  		 * won't appear connected or have anything
> > @@ -6321,10 +6327,11 @@ intel_dp_hpd_pulse(struct intel_digital_port *dig_port, bool long_hpd)
> >  	 * complete the DP tunnel BW request for the latter connector/encoder
> >  	 * waiting for this encoder's DPRX read, perform a dummy read here.
> >  	 */
> > -	if (long_hpd)
> > +	if (long_hpd) {
> > +		drm_dp_dpcd_set_probe_quirk(&intel_dp->aux, true);
> > +
> >  		intel_dp_read_dprx_caps(intel_dp, dpcd);
> >  
> > -	if (long_hpd) {
> >  		intel_dp->reset_link_params = true;
> >  		intel_dp_invalidate_source_oui(intel_dp);
> >  
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux.c b/drivers/gpu/drm/i915/display/intel_dp_aux.c
> > index bf8e8e0cc19c9..410252ba6fd16 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp_aux.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp_aux.c
> > @@ -835,6 +835,8 @@ void intel_dp_aux_init(struct intel_dp *intel_dp)
> >  
> >  	intel_dp->aux.transfer = intel_dp_aux_transfer;
> >  	cpu_latency_qos_add_request(&intel_dp->pm_qos, PM_QOS_DEFAULT_VALUE);
> > +
> > +	drm_dp_dpcd_set_probe_quirk(&intel_dp->aux, !intel_dp_is_edp(intel_dp));
> >  }
> >  
> >  static enum aux_ch default_aux_ch(struct intel_encoder *encoder)
> > diff --git a/drivers/gpu/drm/i915/display/intel_hotplug.c b/drivers/gpu/drm/i915/display/intel_hotplug.c
> > index 74fe398663d63..1093c6c3714c0 100644
> > --- a/drivers/gpu/drm/i915/display/intel_hotplug.c
> > +++ b/drivers/gpu/drm/i915/display/intel_hotplug.c
> > @@ -33,6 +33,7 @@
> >  #include "intel_display_core.h"
> >  #include "intel_display_rpm.h"
> >  #include "intel_display_types.h"
> > +#include "intel_dp.h"
> >  #include "intel_hdcp.h"
> >  #include "intel_hotplug.h"
> >  #include "intel_hotplug_irq.h"
> > @@ -906,9 +907,18 @@ void intel_hpd_poll_enable(struct intel_display *display)
> >   */
> >  void intel_hpd_poll_disable(struct intel_display *display)
> >  {
> > +	struct intel_encoder *encoder;
> > +
> >  	if (!HAS_DISPLAY(display))
> >  		return;
> >  
> > +	for_each_intel_dp(display->drm, encoder) {
> > +		struct intel_dp *intel_dp = enc_to_intel_dp(encoder);
> > +
> > +		if (!intel_dp_is_edp(intel_dp))
> > +			drm_dp_dpcd_set_probe_quirk(&intel_dp->aux, true);
> > +	}
> > +
> >  	WRITE_ONCE(display->hotplug.poll_enabled, false);
> >  
> >  	spin_lock_irq(&display->irq.lock);
> 
> -- 
> Jani Nikula, Intel
