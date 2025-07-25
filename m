Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E508DB12006
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 16:23:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C00B910E37F;
	Fri, 25 Jul 2025 14:23:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FBGSmpRT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFAF510E37F;
 Fri, 25 Jul 2025 14:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753453431; x=1784989431;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=pJS9EnL3d92hS4WSOgY4EK7AkOeVdq3c6PnH6FvncxQ=;
 b=FBGSmpRTR3PUT2Z+GSMNzKZx2xb1KRyHS8yzX29c9Qk4ZuF1KK9lT0B6
 5pwVY7ZS9XjpQVLKvXPQAp19g2DrwbcYcI+72b8YSnjF7Ux8DPDpBxVCH
 jQdXCMsBa77+qxHynd4uvJ15T+h+oDn03i4ERBPuT82CQD7/l20cUamfw
 7Q/Wm17IqREks9oLbcZVG2tEdZrI4W0MYAPcrsC+B2JK/ZTZNezGqz/gP
 S81CgIA46zEDSzG1qy1vmH7cywlEM2Lok2gpD2GPqjdqsoclYcqtAR0ER
 V7tNVzZHOtkOnlaaFsZxI3G3MsBIQDq70tyLV/U1kLNDRE62/RaQzXIIU A==;
X-CSE-ConnectionGUID: ngZNoIUiRkGXu8RFh0IOVw==
X-CSE-MsgGUID: oJOqoHNFQ0STvUZyETeJhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11503"; a="55887931"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="55887931"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2025 07:23:50 -0700
X-CSE-ConnectionGUID: 2/L05S5VS/CeehQwgjXSjw==
X-CSE-MsgGUID: BY1q4eY2RDG30s+F71ngBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="165234227"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2025 07:23:49 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 25 Jul 2025 07:23:49 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 25 Jul 2025 07:23:49 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.88)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 25 Jul 2025 07:23:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B6PguuWGup5fRSOK9uxACAH3Q6N+3hDHb366nvLKWxWynIakrovnHgt3C68g5lLKXXYk73IgyPjleE7UCxbaVjLfOGprZNaJWZyxETyCgk+MXOZ9Lg6jB8TghDq9oqg9RGtWGl80sT0+PsHiDf4rZi0S4Z94BkCkVSOV0Yns2CR5kKzbYBVadOAhxK5UsgeUTbLG7GhWxTdvw0DuhbMu9ge6Q6kd5YigXdylBqHeud5sxHclRWUzp/uX0ixrQjLg92agCiF9+4wnDuioOuiXmVBvRExhp1P8W256ppWgZ1HtgYOKvnCYZqTLdN+fWdHupdljtBk/HGwNhi5bWcb3qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x8OjaswH5WuBydHgvxrorZ6RAY87QQ9jp9iL6+Nzmjw=;
 b=raTap2LIfcAWDfR8Cln9jVthkPaiouLQoPmuTTfHpwHleekgXToVPrPTOZPMtavF1f6rFw1lyrvSnUVpHJhWMMqLfBQ/NB7fCigTQWSIKuEVQqGOOAdjAEgJxC0UHHkGUyaLkK/IUBQxWrhiD2Ciwv/2ZgnnGiLEXoC5vxPho/1Erlm1+2DLV17IYeXYWgT7ZemCpggZL3nBPjVOTRUSOIr4zvMAe/QpyRaDIx/cZc1S9OtFs6tAS2O5UvXb4tHcMgZC9fm/gZa0Tvns4HE6TEBBRbRrenfhmEMaSmIHwD+RNVYy1QwY1JJh+hUQgr6zfKZJCpDdn+XQ83uT7rDCIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by PH7PR11MB7100.namprd11.prod.outlook.com (2603:10b6:510:20f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Fri, 25 Jul
 2025 14:23:47 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%7]) with mapi id 15.20.8964.019; Fri, 25 Jul 2025
 14:23:46 +0000
Date: Fri, 25 Jul 2025 17:23:36 +0300
From: Imre Deak <imre.deak@intel.com>
To: Mark Brown <broonie@kernel.org>
CC: Ville Syrjala <ville.syrjala@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v2 19/19] drm: Make passing of format info to
 drm_helper_mode_fill_fb_struct() mandatory
Message-ID: <aIOTaOA6bUelUtBm@ideak-desk>
References: <20250701090722.13645-1-ville.syrjala@linux.intel.com>
 <20250701090722.13645-20-ville.syrjala@linux.intel.com>
 <98b3a62c-91ff-4f91-a58b-e1265f84180b@sirena.org.uk>
 <aIOIX8W6olY8ryTN@finisterre.sirena.org.uk>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aIOIX8W6olY8ryTN@finisterre.sirena.org.uk>
X-ClientProxiedBy: LO4P123CA0125.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::22) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|PH7PR11MB7100:EE_
X-MS-Office365-Filtering-Correlation-Id: ab42a50d-fc78-4cd2-4d11-08ddcb86dddd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|10070799003|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?0IuMa94ALR9ZGop9WkSoU2JWYxbBTKRdfR5dP5Tbzi8uVnm1224TL5OWAV?=
 =?iso-8859-1?Q?EdGjuL9JFXMkg8DDh/kVvX8FU6uHXMSSM5fVrS7oRrGtZve/r5IjRt8Ffg?=
 =?iso-8859-1?Q?brZSjpRDeMBENrN63pqc8QhfEQ8Zun1nfbX60VKwx0nodAWoVwwObGdyP0?=
 =?iso-8859-1?Q?SzU+VvtzzL7ttUAut0N0FZoFtIqehJbORrgr4fnTn4SiWQQ4cWlZJXAK2g?=
 =?iso-8859-1?Q?ZaxdqiNcZsJ0EzJeXkZev1ZpYvv7h3QDTiX6zq/JUjNA/1+yNIndeEjRzf?=
 =?iso-8859-1?Q?2aVnDqBDXt0WWIFhTeJETFiC6h6f40RvVXSenSXuOlZZaCcWp5jmezxzK3?=
 =?iso-8859-1?Q?vaZH+sTQlGgJiDcsm3LCrfR+PLECqerVI6Z7/W/qyo3mV1dg1Rh8rcchei?=
 =?iso-8859-1?Q?YjNzq3dlI3CDXcjKr8AyBHa+ZeAJalQIZpdoOcJU+n4ve0pMsCVSoJSSeS?=
 =?iso-8859-1?Q?TycmLkAf8ne5CEjLtcD0J5zQrx76IEQCaQlWCV1eVIXfD1bV9s63SxJli2?=
 =?iso-8859-1?Q?CVeI1XM81ScC+DXP0MPpz08gm81VrKhefVuEL/bMMxxaMEjexsJLe/s1qG?=
 =?iso-8859-1?Q?tXaABDyUgIUI71yicBwX262y+iWiryPMUiFHsmycWdmkiwnxismhn2NWkS?=
 =?iso-8859-1?Q?X/qq7wEiPlwwDPvhZrjOlwj5R61hIqpfpzgKbub06Lb9IK34JKaVwfrJmD?=
 =?iso-8859-1?Q?8swk0XRnHhTOHYIKDxoC7UA6ZgeJ5VS8WOeepmGpYXjSOV+URMrqjPmyX5?=
 =?iso-8859-1?Q?rwSHbCySDMcVfAV4LM6Fcm6y96aENGWE1Yaqe8rvDiwEbHI8iEJ0TGRTQ5?=
 =?iso-8859-1?Q?xhTCftNi9/sgihzjLFULTfleVui5/FAOft7I+YY43XAHJ9JES2SK1SSOj0?=
 =?iso-8859-1?Q?5zmrbNHLv+iGXWNZ1L0NBjQgoPUC1JL9C/LFUOtqYSfcneiUsZYtiP/lTq?=
 =?iso-8859-1?Q?E04IhreEvPdtBs+FihMXc2vArncEGtXkeFDrij0k3H0PBiP8AC0eSmtn8W?=
 =?iso-8859-1?Q?ovKCeVHwTbB1pnw3dX+/9moRujclb6bx5gylSvir88uw6l8xb6AnwNZ0Rg?=
 =?iso-8859-1?Q?ZsgHs58u66l1lAZhhwULwnpWHHbNzl/uwwhCVW2cieTTSx1iSuJDBFJyYo?=
 =?iso-8859-1?Q?fvg0SsSiS0Z8r5A4cwK1LgTUfxXQqbgavMLth7vdsD6k6eTCSowlYSZEi3?=
 =?iso-8859-1?Q?fPfk1c2KGBdtCdX09O7LlRE7N3+VxjiMzFOnTqGMUDccrufuK68otk3SrW?=
 =?iso-8859-1?Q?WvU8DDKHTrB/fS3gFlPmidgdpY3SZ4+TtsITSpHqhWQZ5M80Lcxvp58h9U?=
 =?iso-8859-1?Q?rD9mKnemVLAkwpc6etbTP/KXBgoLC3nKmj9fO8O9bUNe5rfzBBQ6Izpu/T?=
 =?iso-8859-1?Q?AC+WZrWhcOn8XpGyw47U8LrlZJn2cmdjtT0PDDTRSeyKDbXMewngWViZoe?=
 =?iso-8859-1?Q?nnzxylnezip3pUXlj6oJG+qV/es70AMmBuMp2LBLaK2+jWFMZ8rU872DPb?=
 =?iso-8859-1?Q?I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Eo8veYjFHgZPTfyN2AqyQwu+H4DFOn4KN60EusGeIgdN2nD0rFlHtQS2Pa?=
 =?iso-8859-1?Q?1gkvzO/7VCEDYiH7w8W6bEZOvQvj1+dbZn4UXOyi58IKj5+GNtR2ehhipr?=
 =?iso-8859-1?Q?RElf5jIDvfcGO2xKDoC1BRHO7xx2mA6DHxPUGxZzFBh9YU1QqM346lqWZJ?=
 =?iso-8859-1?Q?vl6cfMTp9UoLMSUMlPtQR1bk2/3oR42rLY6X2HruVQTUdBByKmvbpzi0KS?=
 =?iso-8859-1?Q?Lbty2xu3t1OalgzqKVeaDOrWK91IcO7znpOJLLZpqYAifpA12QXzPI5DW3?=
 =?iso-8859-1?Q?uIn2WeVMmmO0HsmnRGEn3rBPNBVw5FtYq790V+721I8ZSQrlfGneVZv4Jp?=
 =?iso-8859-1?Q?RXTwc2FRxBdcm7TUvMztG4ChP7peCxSvR6Z+D4Zqpw5fRX/5TK2+AckgVg?=
 =?iso-8859-1?Q?mC64UvWu86QG78FfUbrB01lrnKxRiIeHzcz58WjnSRHV6NdDmrAP2+TQdb?=
 =?iso-8859-1?Q?aILnwQahlfgos12NKZX6FjCWagJcBYw4AX6/Jre5mgx5aUr6iKrsRWCXcD?=
 =?iso-8859-1?Q?QYBoDh3DzD8HMTq9vhOAjr9a6a3rNelRuTnB9cFnim0OKmOXNn0eEpHw+z?=
 =?iso-8859-1?Q?7pxHlIYF9XSYRCRFbfTbjJFLj08cervngtbYAV366AWFq5xfVrzMk6NdtE?=
 =?iso-8859-1?Q?hSzR1uoKGoWeovflD86u5afoRyWcfIXjXUk1EagjvlOOO8yfMuweD+wGeu?=
 =?iso-8859-1?Q?dm6fQl6wgxkq2NPMADRXGeeoGJOcxvswh3EaJvb6k/pDugAvWTZzdUMSxE?=
 =?iso-8859-1?Q?Lpcro6ruWkmV42Y+fsJ7Ui4KFtkgcGkmt5uqKh4ExT4eQdk+GiOq0U3/90?=
 =?iso-8859-1?Q?tXaYOS/ZbGOLwlb3Gw4MS7gLonyQzgfGwVS/qrjfxNJM8BXtf5Cbi6pHbU?=
 =?iso-8859-1?Q?URd1eY2XdyONCLJppXAIUzrzb+VBymLl/r8Mv6Ku1wovmln3XBGX25+yd6?=
 =?iso-8859-1?Q?imkCHtNmktwKXzOK5QEnsOmwVSCFAVC8uvvcS7HFrzo3d+yrH3fuFF29Fc?=
 =?iso-8859-1?Q?D3jCIyu80FWOyRElj63ucnXDlLdY5JzTNYEHFlDVuFvf72KPS5QA5KariH?=
 =?iso-8859-1?Q?IMlZOaw7y7xhhiSVobllLJdAQvYqSlD+A+/DUUOsrwOpISzV4WOjVEE4gT?=
 =?iso-8859-1?Q?yO3fgCkc2xyqC+HmK1Q42O7UWot9ic4nKBhcCUv3tlFYrP/u1uFmhvtuwK?=
 =?iso-8859-1?Q?bmFh5dLzL1uofQQ+igUx3Zo6xfGBs6rD3qJfkvlcBH7b0ZINV5zkpH5ZWg?=
 =?iso-8859-1?Q?SKAHW+PNn64KTN3GYT+u0T7lCIJgMne8Ua0BodliYKVg+Xag3+l07IgY/y?=
 =?iso-8859-1?Q?+oO1dzlHRkFbsXTpamA5zdUMWyoc4D+Qz6tmMG/oTIclX5lFEBbwvizr8A?=
 =?iso-8859-1?Q?gHCjwgXXpJuHlDvg+XOAsQgVyHQQSHU8J9n4iJ6G5Bt8Y+v7d5ixEVTDWI?=
 =?iso-8859-1?Q?cc2hu7LM1OH5443/JZLi+51e0sraMwfhjKv9XFQ2fS/iCl3kwVzoqxmVFr?=
 =?iso-8859-1?Q?gMU12MUch6Vqsnfr7R4zfCZZ1VXAs4pUhQjRyGs6I1IgsWb3PBV/GgdVEu?=
 =?iso-8859-1?Q?kEC4eLfZDsl590cqqf4WD0+/u/8rYBGyl8g+BQCCtSuHAGedQV32UiscnP?=
 =?iso-8859-1?Q?44Q80gh5Y/RnnbradVE7haSsEn/e0oS+7o9nYZmunbikascBKdo+xrQkee?=
 =?iso-8859-1?Q?3n44WHK4CRpCtzi5G3Y3pIdXN+ReQKsNUN0wwK6Q?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ab42a50d-fc78-4cd2-4d11-08ddcb86dddd
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 14:23:46.6918 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P2mXsrXZkgsmGo1F3uO+dd5kJRQUcfj/Ne7i430Xl/W1ofxAL1gT4FaIL9Wqn8ZXklHioH9V9X84qcLNaDuQUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7100
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

On Fri, Jul 25, 2025 at 02:36:31PM +0100, Mark Brown wrote:
> On Tue, Jul 22, 2025 at 02:41:53PM +0100, Mark Brown wrote:
> > On Tue, Jul 01, 2025 at 12:07:22PM +0300, Ville Syrjala wrote:
> > > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > > 
> > > Now that everyone passes along the format info to
> > > drm_helper_mode_fill_fb_struct() we can make this behaviour
> > > mandatory and drop the extra lookup.
> > 
> > This patch, which is in -next as 41ab92d35ccd2d66, appears to be
> > triggering warnings on TI x15 boards:
> 
> This regression is still present in today's -next, I've not seen any
> response to my report?

Looks like the following would fix it, could you give it a go?:

diff --git a/drivers/gpu/drm/omapdrm/omap_fb.c b/drivers/gpu/drm/omapdrm/omap_fb.c
index 30c81e2e5d6b..42da78bcb5a6 100644
--- a/drivers/gpu/drm/omapdrm/omap_fb.c
+++ b/drivers/gpu/drm/omapdrm/omap_fb.c
@@ -440,7 +440,7 @@ struct drm_framebuffer *omap_framebuffer_init(struct drm_device *dev,
                plane->dma_addr  = 0;
        }

-       drm_helper_mode_fill_fb_struct(dev, fb, NULL, mode_cmd);
+       drm_helper_mode_fill_fb_struct(dev, fb, format, mode_cmd);

        ret = drm_framebuffer_init(dev, fb, &omap_framebuffer_funcs);
        if (ret) {
