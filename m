Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F68ACF0AF
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 15:33:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EC7E10EAB3;
	Thu,  5 Jun 2025 13:33:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OWW+MuRt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 077F110EA32;
 Thu,  5 Jun 2025 13:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749130413; x=1780666413;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Heq2u4OlCNs92oozjun4ZpqF0/FeN0Ayfi1ouQUAkvw=;
 b=OWW+MuRtd+ioOEpb/8fqdw/rhOOvzSf2PLyjw5jprMaSfgStILsafuW+
 hLhGvmnairig7HnTNQL6DC09Yr94vVwiKfsHCd4RMenk2bBWCyr6Zyib5
 vw69myaQNuZyKgRM4VRAzYErdv0ZS2cuBdHIpuu5FgCM2ycQC6+Pm+eMF
 jHepJ8HYO/Q3SSbpqqtiqTS3Jq8AzRfMQZF/KUz2sRB6R4I8n8XLhY38r
 qviw2GNTQNzUPF3qe4RYBJd6kzhKtDxIk08LSUbopITXUw+QFKNNcD49r
 r6gwpa7t/vbzUbNVZHYTvWsUjuEh4GMS68YNQ8/PCI/59jytbmWXWJPIR g==;
X-CSE-ConnectionGUID: WscUuZaRQaWOlTFYgsQSpw==
X-CSE-MsgGUID: Plm78ChTT1OArX80pvORrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="51394180"
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="51394180"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 06:33:32 -0700
X-CSE-ConnectionGUID: SxypbtKTTVKS0iWtHlvKvQ==
X-CSE-MsgGUID: DSpdGy02RKWQrY5I3++AHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="150775526"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 06:33:32 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 5 Jun 2025 06:33:31 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 5 Jun 2025 06:33:31 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.64)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 5 Jun 2025 06:33:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NXWxIXCj3Md1LeTMS9ZZUVE1wBUx2Iswbt6Ur0cjG6AKJ+s4EZhX5jpa2A1aQ886QYU1sL73tVsnjCtQc53ssl9DMalsTr6feoik2vbjIOciHFWYi78QjYOqyBAKyLzXe6Q39s/4iz5JQD+Ac0L9g76nLvUp2xLptrhHUubz6/D+iGl+q2ApxiPtpgZkV8O6V0V5OAuOjHygtXUNheQ4w6WYqIuw1W6NqeUJcn8xhu0kX/v2WMfr//mK+97uKSplqYh4Z3OHWMwTBfEuG6PZWBaiRPKfo665WspnbF2AyWj2x+sGoTUXG179z7sSGNezjbFB4RUZIkNFqbefV+9C/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KMg3+TKUadTUEAT+6K2Rx/KWYySSCx/c1/YLIE8flcs=;
 b=c/BvUWJHJz577NIT6j0TMb8scHGsDnTfYtQG9rFsm8/gTpys+Y8t1bMqT/GN/R3RCAcJ9CM9rSgHlVGW/0EyYdo538YEpx/oRySsoeGBWaFqHFn3iiCBcNoXC9xDYZ8qOHYMhO8hcI7HgHitlLTyrZwrZxtHlDVBzcQ+D5CTs1FOtxzfAZ4fP2COCrISknvL1GgY2A2H/c9emyCy+kOxDZTWOb060vUbLH5qUYqAkWzkaUP4U/gft7lEC4MuKsykzzQGJ0yC28fPQJewB+qvw43FdL3pfp5euoEOvlBF2rsRbe8QXUIinZMjlqk0PA2H3qGooOmpo6Pzzw9+/E2+Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by SJ1PR11MB6297.namprd11.prod.outlook.com (2603:10b6:a03:458::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.19; Thu, 5 Jun
 2025 13:33:28 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%2]) with mapi id 15.20.8813.020; Thu, 5 Jun 2025
 13:33:28 +0000
Date: Thu, 5 Jun 2025 16:33:23 +0300
From: Imre Deak <imre.deak@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, Ville =?iso-8859-1?Q?Syrj=E4l=E4?=
 <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v3 4/5] drm/dp: Add an EDID quirk for the DPCD register
 access probe
Message-ID: <aEGco-TsZ2QjjZyh@ideak-desk>
References: <20250605082850.65136-1-imre.deak@intel.com>
 <20250605082850.65136-5-imre.deak@intel.com>
 <8316fe4e8ffd9e96a04dc0976bb13200d526daec@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8316fe4e8ffd9e96a04dc0976bb13200d526daec@intel.com>
X-ClientProxiedBy: WA1P291CA0017.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::17) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|SJ1PR11MB6297:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f3c5ab1-2fa7-4f4d-364d-08dda4358e60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?3JPrjkuKSKoTLEfMzL02wnBHwqZxMIuKsqdM2d01KnqHM+B3X6nw7CJWQn?=
 =?iso-8859-1?Q?MEp8Aoll/YnMbDCqhrkabM8AWTuLoKBsDSvSKQWXG7ABZxhnlvTFove+Pp?=
 =?iso-8859-1?Q?gillX27RWAQoY3kqkPTXKlrXi/G+S8sHQGssmmXflCz1nXvtmzEPtdrvhx?=
 =?iso-8859-1?Q?suFt+Lhx8l/XMAlpASU8H9mntflPlFmw5yxSR6sT+j74EfyCWvBtPnnGiC?=
 =?iso-8859-1?Q?sTfinafbi0sWOAYLpnYSH1DBUHXNZWQBNhPEFvgyF0xZCSdNY5j5vziSCa?=
 =?iso-8859-1?Q?irg4g7zohk3wH/7amza8QFFWqynqoY6P5ZnyHOWoGvc9/H7ab2IZvBsWB9?=
 =?iso-8859-1?Q?xWcgGn2YKsrJ0CJwBiFlwBXSAVsJsdjw7w3EQ6i2WkuMzQMMAhkmqZm30Y?=
 =?iso-8859-1?Q?jobnm/xZs8Vatc+xWyxNXFaz/L/IU78GhxGc6gONBbFEovaUgoc+5DIQ4x?=
 =?iso-8859-1?Q?Mn3lRKcV+GT9kSaJ2/A3jJtR7eqhYt29jxsKQvfklEF7lg6LEYKIFHi18U?=
 =?iso-8859-1?Q?Sz4qCR4zdiQY3Dzvm+L44SiRVB3uOHSFqoUUZu1nHTjneSVaCZXyk1+G1R?=
 =?iso-8859-1?Q?5eEpoh6L46c9qw7hj/wIYxSUiBUE3wMq/e8q7uznEfnLULXNVMtr14nPhQ?=
 =?iso-8859-1?Q?Zlf46TUzQfN4qTNIFjWnIwyd2Kta4W2nXw/aNzvwPAJLcn0SCBrZF1TAVu?=
 =?iso-8859-1?Q?2o29WC0mkglhlJxjFTbaLgU5sWMzzylPUKgfXB2GLv94byvs055n3ec2ey?=
 =?iso-8859-1?Q?fehDUWfbIjGaemNCyhPhIasUKJVFPQ25PTHc+D7WfE0nhRMvha1gUkYm17?=
 =?iso-8859-1?Q?Rbs+c66LLKtiDROFNZeZY1Sr97tXshTzyKVgyAP+Cr4cxqf6RX/ssMEAJo?=
 =?iso-8859-1?Q?tnW3WCG2NMqN2ymh00W7+m1x46EZ3ShDem2lGLMxe+KDJsbSooMEgP0beO?=
 =?iso-8859-1?Q?+OVImE9Eb1eeDksJlUt+JpzQshcu75ZKnAZotKoCxcVYUT0i3vHM3W0S/E?=
 =?iso-8859-1?Q?hZj8eyhJG1sNGwwO+vwOBlD185Z9CIwQIP2IqCz1xDLo4+VdVJYOeM09Mw?=
 =?iso-8859-1?Q?FRH7MMxlQZlHo9N3XV19T/GW0IONS7q1++LyqTFeLIruXokpVBEbtlikCm?=
 =?iso-8859-1?Q?bI/+8llkALmlIZSwTu1VGhLKmrEC8GyO9/Q1C5/bTfbCc0t02baaYEIefy?=
 =?iso-8859-1?Q?Q48aMwHfynRXpghgvgYaMzVXRF4vlvyd37QI1lCxreLTgs+jYjFLLA+Gui?=
 =?iso-8859-1?Q?/Z5TEMPYdRv9n+KXw4Gv08Qpno87yKdAwbKNM5QTrxa8U+mW1y/bXFPLdh?=
 =?iso-8859-1?Q?THu/UxJn9W58cmvuCPZecatsQHE/xe4H6/+1jV1WRPwaZCJQkRM2meSW2A?=
 =?iso-8859-1?Q?hHHzbUed61rayZDbsDd+ZiP6rqAU5NN77m3kimsl4z6OE8H9mnx56bkIib?=
 =?iso-8859-1?Q?Hz9BzPEBxDCOzxYyEQpuRXzN57Qk/P1gTpNNp2hGVCmjZ2I4G2rcBA/4HU?=
 =?iso-8859-1?Q?g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?KKVlXAtPFonAy9ezBd2LCFWIZyhXMwSPDxPx9BXW7b58ekvsQ0cIjEwpN7?=
 =?iso-8859-1?Q?gCS+gyGf4fYtNJJ6LwQJTBBlvinmlEE1Z2hP03dHOa1N3m21EY7j0693ox?=
 =?iso-8859-1?Q?2/kNJ8Z9szlZzxUGsATUFu4pmVv06Qs4K3xRZ4k9fFYnsfxuxMqgskDsX1?=
 =?iso-8859-1?Q?Ej8SApoiDj/25krAC98TcaD/lQF5QrEA2l0NP05ioZG1mUFB6yKdg6JDbd?=
 =?iso-8859-1?Q?QrznfZpqT9brs5V+yeOr/KueTtZNyWoY1sxXh2FPUtmFybrdExnHbcMXaV?=
 =?iso-8859-1?Q?k4bxvW0u7CG/7mCUvD6vnZKdRRfyP1pVFbXIS9x4Y+xUh6o51TXxGc6Hkv?=
 =?iso-8859-1?Q?0NuYoqMm2DA5Z7UO6LOBXwBYD0IMap8xurTN4l+Yex51grUUAmyveqmbam?=
 =?iso-8859-1?Q?1y3FKVPJMApjXT/z0+QqXqF+wN+DChfJX9YFHTNy15sWK8Vi1HI9Z6Phkg?=
 =?iso-8859-1?Q?ukZtoq5WZD+CSYsm6fXT50QeJEtQPpNWBzkIqwhNiI7FcU5KKtOt1f/IGR?=
 =?iso-8859-1?Q?3zdBjEnoX52OtmF2wJ3UoIW7Z7Cnt8mqxU3c16CzkZKMZMQmVMBt2H+OKg?=
 =?iso-8859-1?Q?n4bHk2ZD3fXUUG8YDIJ6QItCXLMRFmQiFluTjyoAkcYo3ctmuAA7wKWGlU?=
 =?iso-8859-1?Q?8c8R8i2KFPGoCLejarqAzG024dChTyNHUUs7dC4/cjYUBCG4PouvHIOTzy?=
 =?iso-8859-1?Q?+ckyzhIpWNZbVPTpNyKBtz6pDewzqziyT+adJu+OaqI/hw5bk3KDTKd4Ce?=
 =?iso-8859-1?Q?whCc3WB2e0xTRfQUIMMq5uYFEgXW2i128WlkL0ayt2V1jVSV1eg57Fjlj1?=
 =?iso-8859-1?Q?U9Nu5Li1xX/oGDiJ5WM+6dKIJDRPaf60oK9MkhIVRBwuh/+WXttZLmbLOF?=
 =?iso-8859-1?Q?fdAbeAoozyrP3YTZnAnIaa+3Un1Y3Gmfd0moy+++jcneeWFiTGmMAnO5LU?=
 =?iso-8859-1?Q?OtiW3bFdrefWBXMI2lRbVKn7G13V72j0GsLmeReWwwIIDdPSwcc+AZtq5f?=
 =?iso-8859-1?Q?gPeJdGGZR0beWNYf2YkPK4Zhhk3lNd6wXAuTM7OO0MWx9NdFPCOLAFohSh?=
 =?iso-8859-1?Q?kH6k1eZFiGpyKGDGWiDxmPvvFdVTHsaGDEkdvAhcfnkUHm3MzHrX4R8DlH?=
 =?iso-8859-1?Q?gGWM8MoAUE+7a2ypqkX3W4HSynZAE4KRopXnemNYKsyYUPWPuACnvJRKBf?=
 =?iso-8859-1?Q?LLJjtOpE3fm86foyF2VPJ0vYdRPkZlfxdCG8fgnKIovauikIGd9HBJjv1I?=
 =?iso-8859-1?Q?mRpMK+g7ODKGz/bSrQFuoT66ii8MSALyZbLUgfmM3Cn6M4QL6jtyikNtcM?=
 =?iso-8859-1?Q?+5XDXpRDfqvtRxhz3ydptAQvnG6H3I5d7tujMa7Pcfg2XcE/s/DK4mFfaj?=
 =?iso-8859-1?Q?S6dDJBFlGJMFDLqg+j3VTksHO2wUWd9XOcmOztj5MAZXZ7x+o/Aob0tRi3?=
 =?iso-8859-1?Q?ObaUgroto5FehgtsKf0CZ1xb3we2Qs1xd1d5fxMHIydpJ8OzDgqCka5Q/7?=
 =?iso-8859-1?Q?9EMRDiWPL6+7Kkc4wThValyKZYEnnraWkXxlJ3xKaRKyPH3mKh5yKA3p07?=
 =?iso-8859-1?Q?jRJoFlOFOxguc2pXGQn6/uiCQFPMpX3rOUi48xnnpMqVeiCgG++DsGROve?=
 =?iso-8859-1?Q?jMD0XijH32cb7Nv6M9F+tUtJrLdkPPkAcU?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f3c5ab1-2fa7-4f4d-364d-08dda4358e60
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 13:33:28.7098 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mvM1Guwu5ahwrGZ8RPVRY3xMKTOT3WIu1Ed/fz/F1OWr753w1qesOUN00RJevR3APY/VtQbu0HLimTSkjLBLhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6297
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

On Thu, Jun 05, 2025 at 04:11:55PM +0300, Jani Nikula wrote:
> On Thu, 05 Jun 2025, Imre Deak <imre.deak@intel.com> wrote:
> > Reading DPCD registers has side-effects and some of these can cause a
> > problem for instance during link training. Based on this it's better to
> > avoid the probing quirk done before each DPCD register read, limiting
> > this to the monitor which requires it. Add an EDID quirk for this. Leave
> > the quirk enabled by default, allowing it to be disabled after the
> > monitor is detected.
> >
> > v2: Fix lockdep wrt. drm_dp_aux::hw_mutex when calling
> >     drm_dp_dpcd_set_probe_quirk() with a dependent lock already held.
> > v3: Add a helper for determining if DPCD probing is needed. (Jani)
> >
> > Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > Cc: Jani Nikula <jani.nikula@linux.intel.com>
> > Signed-off-by: Imre Deak <imre.deak@intel.com>
> > ---
> >  drivers/gpu/drm/display/drm_dp_helper.c | 42 +++++++++++++++++--------
> >  drivers/gpu/drm/drm_edid.c              |  3 ++
> >  include/drm/display/drm_dp_helper.h     |  6 ++++
> >  include/drm/drm_edid.h                  |  3 ++
> >  4 files changed, 41 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> > index dc622c78db9d4..d0b9f672d743c 100644
> > --- a/drivers/gpu/drm/display/drm_dp_helper.c
> > +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> > @@ -691,6 +691,34 @@ void drm_dp_dpcd_set_powered(struct drm_dp_aux *aux, bool powered)
> >  }
> >  EXPORT_SYMBOL(drm_dp_dpcd_set_powered);
> >  
> > +/**
> > + * drm_dp_dpcd_set_dpcd_probe_quirk() - Set whether a probing before DPCD access is done
> 
> Musing, not sure if this needs to be called "quirk". This is just used
> to enable/disable the extra probe. aux->dpcd_probe_disabled doesn't
> mention the quirk either, and shouldn't.

Ok, makes sense, I can rename it also removing the repetition in the
name to drm_dp_dcpd_set_probe().

> Not a big deal.
> 
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
> 
> 
> > + * @aux: DisplayPort AUX channel
> > + * @enable: Enable the probing if required
> > + */
> > +void drm_dp_dpcd_set_probe_quirk(struct drm_dp_aux *aux, bool enable)
> > +{
> > +	WRITE_ONCE(aux->dpcd_probe_disabled, !enable);
> > +}
> > +EXPORT_SYMBOL(drm_dp_dpcd_set_probe_quirk);
> > +
> > +static bool dpcd_access_needs_probe(struct drm_dp_aux *aux)
> > +{
> > +	/*
> > +	 * HP ZR24w corrupts the first DPCD access after entering power save
> > +	 * mode. Eg. on a read, the entire buffer will be filled with the same
> > +	 * byte. Do a throw away read to avoid corrupting anything we care
> > +	 * about. Afterwards things will work correctly until the monitor
> > +	 * gets woken up and subsequently re-enters power save mode.
> > +	 *
> > +	 * The user pressing any button on the monitor is enough to wake it
> > +	 * up, so there is no particularly good place to do the workaround.
> > +	 * We just have to do it before any DPCD access and hope that the
> > +	 * monitor doesn't power down exactly after the throw away read.
> > +	 */
> > +	return !aux->is_remote && !READ_ONCE(aux->dpcd_probe_disabled);
> > +}
> > +
> >  /**
> >   * drm_dp_dpcd_read() - read a series of bytes from the DPCD
> >   * @aux: DisplayPort AUX channel (SST or MST)
> > @@ -712,19 +740,7 @@ ssize_t drm_dp_dpcd_read(struct drm_dp_aux *aux, unsigned int offset,
> >  {
> >  	int ret;
> >  
> > -	/*
> > -	 * HP ZR24w corrupts the first DPCD access after entering power save
> > -	 * mode. Eg. on a read, the entire buffer will be filled with the same
> > -	 * byte. Do a throw away read to avoid corrupting anything we care
> > -	 * about. Afterwards things will work correctly until the monitor
> > -	 * gets woken up and subsequently re-enters power save mode.
> > -	 *
> > -	 * The user pressing any button on the monitor is enough to wake it
> > -	 * up, so there is no particularly good place to do the workaround.
> > -	 * We just have to do it before any DPCD access and hope that the
> > -	 * monitor doesn't power down exactly after the throw away read.
> > -	 */
> > -	if (!aux->is_remote) {
> > +	if (dpcd_access_needs_probe(aux)) {
> >  		ret = drm_dp_dpcd_probe(aux, DP_LANE0_1_STATUS);
> >  		if (ret < 0)
> >  			return ret;
> > diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> > index 9cca1e6e4736c..5f45820ad62d5 100644
> > --- a/drivers/gpu/drm/drm_edid.c
> > +++ b/drivers/gpu/drm/drm_edid.c
> > @@ -248,6 +248,9 @@ static const struct edid_quirk {
> >  	/* OSVR HDK and HDK2 VR Headsets */
> >  	EDID_QUIRK('S', 'V', 'R', 0x1019, BIT(EDID_QUIRK_NON_DESKTOP)),
> >  	EDID_QUIRK('A', 'U', 'O', 0x1111, BIT(EDID_QUIRK_NON_DESKTOP)),
> > +
> > +	/* HP ZR24w DP AUX DPCD access requires probing to prevent corruption. */
> > +	EDID_QUIRK('H', 'W', 'P', 0x2869, BIT(DRM_EDID_QUIRK_DP_DPCD_PROBE)),
> >  };
> >  
> >  /*
> > diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
> > index e4ca35143ff96..75fa9548aefa0 100644
> > --- a/include/drm/display/drm_dp_helper.h
> > +++ b/include/drm/display/drm_dp_helper.h
> > @@ -523,10 +523,16 @@ struct drm_dp_aux {
> >  	 * @no_zero_sized: If the hw can't use zero sized transfers (NVIDIA)
> >  	 */
> >  	bool no_zero_sized;
> > +
> > +	/**
> > +	 * @dpcd_probe_disabled: If probing before a DPCD access is disabled.
> > +	 */
> > +	bool dpcd_probe_disabled;
> >  };
> >  
> >  int drm_dp_dpcd_probe(struct drm_dp_aux *aux, unsigned int offset);
> >  void drm_dp_dpcd_set_powered(struct drm_dp_aux *aux, bool powered);
> > +void drm_dp_dpcd_set_probe_quirk(struct drm_dp_aux *aux, bool enable);
> >  ssize_t drm_dp_dpcd_read(struct drm_dp_aux *aux, unsigned int offset,
> >  			 void *buffer, size_t size);
> >  ssize_t drm_dp_dpcd_write(struct drm_dp_aux *aux, unsigned int offset,
> > diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
> > index 77fd42608e706..3d1aecfec9b2a 100644
> > --- a/include/drm/drm_edid.h
> > +++ b/include/drm/drm_edid.h
> > @@ -110,6 +110,9 @@ struct detailed_data_string {
> >  #define DRM_EDID_CVT_FLAGS_REDUCED_BLANKING  (1 << 4)
> >  
> >  enum drm_edid_quirk {
> > +	/* Do a dummy read before DPCD accesses, to prevent corruption. */
> > +	DRM_EDID_QUIRK_DP_DPCD_PROBE,
> > +
> >  	DRM_EDID_QUIRK_NUM,
> >  };
> 
> -- 
> Jani Nikula, Intel
