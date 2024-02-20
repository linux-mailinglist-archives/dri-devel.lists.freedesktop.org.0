Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F13685C49D
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 20:23:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67C0A10E3A2;
	Tue, 20 Feb 2024 19:23:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SnmKwdQR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B893E10E3A2;
 Tue, 20 Feb 2024 19:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708457017; x=1739993017;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=BPKiowD53g6fP/2ZP4SuNbb9Rpodol1T4XHdf//RQBI=;
 b=SnmKwdQRhc2bsEcYNTj5XZCVNDHe+LB344CAdY4ReQtWLR2w4gigCMp7
 cTRjDMNSRHWpQL5EMHtqmDUBXriMc2M7reOqMyyTbWIB2BIBok6M1IiNS
 unmQyMUNoQhHVHkzmcf0sxqM3xacvNYjQ9elWnZlJTmCGtCk1PVT3CfVf
 9z9Bs6XPbS6U5CZwO1rCNuWHyv2gGynGSKm57X/uKUaCvSh4IpWZ6zHRk
 HaowyzJpurBGYz+W9VvJDALlGrBI8TcZiPmfaLirlZ1V6x/xRKesLHQv0
 U1d23QslVQMsBTnbMhiW02wEXfZomE0eopIorJN4zPgSD0/pD8+c3CUks Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="6356962"
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="6356962"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 11:23:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="5222494"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Feb 2024 11:23:36 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 20 Feb 2024 11:23:35 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 20 Feb 2024 11:23:35 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 20 Feb 2024 11:23:35 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 20 Feb 2024 11:23:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oo/4+q+Jyf7Q2zriHCxwSEmak97zpQdG4kwQongs0UgeTMW+EEkhNxXKioGnb5zXnRXZiJVSuuemLk8qgEY2UXtI2ljyYLeccr8Y97C2+fgdkpQpHht1s2m70AWr2wu+uyt2fdSXtMZ3NN03r6VOu//tOhKE6+Z5PSRoMCEzpa7lB6NrvI5RKnUib9M3xyotFYzkyZB4xX7lt3sLaP3bh6+91yKrry6WwPwmCmddJ3YaQXZDAqrB/rrU4wXBrVDaNYQZrygy1BuXU0u13dF+uM7GbjjnwPscUl5B+QHwj1VUPmiw7tYHB840/MnQFC8Ry8I/HVaJpX+Um4EqHCEXNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ui1bJKL9QItsaMFofPiCafbVq3WMBB/b/t18MEKOBI=;
 b=WxK7u5V8JIy5bzy4Zu1xRfTBPp6Fz9826wCKyxMapv886bb9h/d9yEhrwADLkArphGkVp0cWe6jkX46QKS7BA2rPJDtOsa1SWeEyjAlakJWJ2WWxmg4UMPnaZYVYrfqgcfPzVEnQjG2N1OfojRCRpNR2aVCpzfOREhn5CPVK6vYZhv9lZ1FjUynGGMqd9eeblQBTHUitR5E/rjbIe8kXJA5B0Y5yuipz+H97RwYhCf3KnLnkl/g9HHiNC4/EJfZP3BSMUiEumyGkzM1OPsDxEcRkDx/tkxWzDcnkZt1bsWoJ3elVz4uJTWCNrBn1VbI024cSJpSNO0odt0kr7VEK6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CO1PR11MB4772.namprd11.prod.outlook.com (2603:10b6:303:97::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.29; Tue, 20 Feb
 2024 19:23:21 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7292.036; Tue, 20 Feb 2024
 19:23:21 +0000
Date: Tue, 20 Feb 2024 14:23:16 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
CC: Maxime Ripard <mripard@kernel.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tvrtko.ursulin@linux.intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 David Airlie <airlied@gmail.com>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/i915/tv: Fix TV mode
Message-ID: <ZdT8JAZ_IvaBiEeH@intel.com>
References: <20240220131251.453060-1-mripard@kernel.org>
 <ZdTm1bFgR8x2IJhN@intel.com> <ZdTn8oy1bs1rIqmL@intel.com>
 <ZdTqCWPSL4jJO3yf@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZdTqCWPSL4jJO3yf@intel.com>
X-ClientProxiedBy: SJ0PR13CA0240.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::35) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CO1PR11MB4772:EE_
X-MS-Office365-Filtering-Correlation-Id: cf100161-d3df-44ba-9134-08dc32496656
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KgkTNLCHLs8uObuHudi0cG5Um5KZnwMfWcp9dG6IBIox0TC1oWqKkmhjzAOgyOufjYxGL4nppF151b2X6B+OIzFQBcwygpMM8BCmg/GoLKnYpSnFpZhCOW+HQQH5BtjpfK4UkbIa9SHtxOFDHpsH7of3oMu33C7Ry8Xkgs12hIEL0+4V83YXJ2pu2uRvwJOnxaMubxE3h+V8tzUtyaVsyboKU9Tdmt0OE9Mj3tLtDXlLKy6Z9Ou9i4V3BYgkj4/q9E10nAxqLbtpMKBEWR4jf4ibDJwHNsgjq2LaB/i3KrF/LTMiKLztYeP8Ba5VN/m3uURWHPPcFT8wIe+URBoxd2MNkSt2eXE96huiDz79V0SoKxsgIVnksvEwD/I7zoI2mIjbnVmkbuWKiQexwA1n4V8Tx3KZOTQDuBtt31lCWNwEMqyeOnTGzubUP9AiBYMNq1gLxqUwv8S/SKOvnRrnN5jCxOdmq0Qxt/VY6hiY14z3Bgiq2kz8vDxcwLdizyBWx49TdkevefR8uoH9KMVrLvHzlrX1KIvFxthlnVtIJlk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?6i/Kmt+LQI1zcji3+kWPgLXMtBREWlbPa5DeEZZIs+uK1Og6WKD+VPnb5N?=
 =?iso-8859-1?Q?oIXdn6PU5W9YSdo6zXRiPdLw2Z0mi3F5p2aRPwOQCWsP16Mj9PjWjLa1FK?=
 =?iso-8859-1?Q?t5DvN8sXMFXhfoL1L/q/E6raQ52iTiF9U0wobarNoqu//5+9nTY7OTx8PN?=
 =?iso-8859-1?Q?QvGA0DaUiOyMjk7MGjYBR/nhV6c175ixFMYq2P7xy0XzgJW2YEX6wgw+F3?=
 =?iso-8859-1?Q?7sX1bN2771uYMSouoqaU9rMskgb0JftDZnUCiHgsso+ncXQc8HsTiH2tuv?=
 =?iso-8859-1?Q?YL5VITRiEaIEgj7QpzQIHH3Lakg5Oh667VMDXhs6dOrqMboF7mEGSiT+wn?=
 =?iso-8859-1?Q?M3KlUG7KZZaTG9ltNmDjJpy6nTeM0fcEzMaXGiKhhjEn3XznW/LUoTJJ0i?=
 =?iso-8859-1?Q?h/i/7nPRb2DE76azIREDI7Kg/nZQwL/pPR772Dtd9f2tVOMJrXEKH6LW0F?=
 =?iso-8859-1?Q?LVJfbBlZEMYi/Q3Rp38gar0YlOStMoTM8iwu9FZj7ORTWm6DJP9whkVv0/?=
 =?iso-8859-1?Q?w6zcSkgFt0nvgTHOOvMGgb04UYfznOgrO6JNycQBuaqR0bv3NQrr8/OTSo?=
 =?iso-8859-1?Q?K18mtPbg0Ja/DgCvMZFiKXg8vWg4LQhIi9/72Z4jAF2YpW47RWMiirpi3T?=
 =?iso-8859-1?Q?XyFuq0dUq2SjLQqg9jt/vMyZD2UnNrRERahtRAE0ZRgGcLG4IQVpPdAW+A?=
 =?iso-8859-1?Q?ydURdlgQJahcoeqMJ2V5smqFzJ31YFsyzPAzKVtJW4tyFR8MK6rX3l2wPj?=
 =?iso-8859-1?Q?XN0Hw+q7GgPT4Ku9uNBMfVaewwzvjP6OsNNmnQmxqbO8R+8rbkKRlJoczg?=
 =?iso-8859-1?Q?YVrSb5+hNFtrRX0dtLVV9VFntys7EbsWsjfvEoTaZlUWUi9pC2MeEuM/pb?=
 =?iso-8859-1?Q?+E/lm+j82LbHqzwOzirU0uaD7apmCg4DfhWiClaKbeWqLAjx1tRLwWP9EK?=
 =?iso-8859-1?Q?JbUtsWWAYIG6c0WKKXAsqnWZlwKrbjsQ64pRETFXQ2m1HtaWlUeYICfZWK?=
 =?iso-8859-1?Q?3n0s69KfHHTC34CzEv9NmiBPiGnkvtyB3BHf++Wf2E3ppOR3qbFuFrNrfW?=
 =?iso-8859-1?Q?f6503TcVT63M6/s+e50bDlsdB9Rpcvu4A8ji0TWjbMg5OLuXOcA2BO6XsA?=
 =?iso-8859-1?Q?zRCeh9ccEtlH6vsprNP7U36q9c4F2SlhkshTo4OIb0vHxnZnPSKSkjIuzd?=
 =?iso-8859-1?Q?+KWHLeQsQI0LO5FD0q4e0uPYGX3Oo36X9xaz5KihDKYjeo0tCWmobS4SxR?=
 =?iso-8859-1?Q?njO5DkiopE9K9Y7WDcYkdJkOiE5Kl+67Cq+7gFjuHmE9SCTSqpZAJrQASk?=
 =?iso-8859-1?Q?/mrGehOZ5dVReE9KYQv2lVjjcbtgQq3xtIorfk4LH7DhCbvU2boKsR2f68?=
 =?iso-8859-1?Q?u/RxIcnP+CfQMsw0ZN4H69kpLtBj/sCaZhhEtW3cTgBd6IjFHSpgfbRwFq?=
 =?iso-8859-1?Q?lyRvT7QOxCoTRTPneKLb/kA2TMcRVb8GbapaQzpJFgNiTO5M3WB6OIzJd5?=
 =?iso-8859-1?Q?Vg3clqFryffvEXVDVhu470D36TRo+dRNEuOz6iq0VqADYTqygFnwFikJUb?=
 =?iso-8859-1?Q?35zTQVckVjggQL8usFtn8GLpWTcmQLw0JME3jmiYdmaQM2PUGhv/9zt+CT?=
 =?iso-8859-1?Q?6OXZVT2oZIXfgdglZJWSoF0DQ3uLv0fMih?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cf100161-d3df-44ba-9134-08dc32496656
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2024 19:23:21.3978 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tTmAsxXk80Uen72pAYP+TyEUdNMBh5g12LX6/II/ypBkca0NcZD4UJX6Fn0Yw7onD3ByeAT8KIBLzObnG1rYHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4772
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

On Tue, Feb 20, 2024 at 08:06:01PM +0200, Ville Syrjälä wrote:
> On Tue, Feb 20, 2024 at 12:57:06PM -0500, Rodrigo Vivi wrote:
> > On Tue, Feb 20, 2024 at 07:52:21PM +0200, Ville Syrjälä wrote:
> > > On Tue, Feb 20, 2024 at 02:12:51PM +0100, Maxime Ripard wrote:
> > > > Commit 1fd4a5a36f9f ("drm/connector: Rename legacy TV property") failed
> > > > to update all the users of the struct drm_tv_connector_state mode field,
> > > > which resulted in a build failure in i915.
> > > > 
> > > > However, a subsequent commit in the same series reintroduced a mode
> > > > field in that structure, with a different semantic but the same type,
> > > > with the assumption that all previous users were updated.
> > > > 
> > > > Since that didn't happen, the i915 driver now compiles, but mixes
> > > > accesses to the legacy_mode field and the newer mode field, but with the
> > > > previous semantics.
> > > > 
> > > > This obviously doesn't work very well, so we need to update the accesses
> > > > that weren't in the legacy renaming commit.
> > > > 
> > > > Fixes: 1fd4a5a36f9f ("drm/connector: Rename legacy TV property")
> > > > Reported-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > > > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > > > ---
> > > >  drivers/gpu/drm/i915/display/intel_sdvo.c | 10 +++++-----
> > > >  drivers/gpu/drm/i915/display/intel_tv.c   | 10 +++++-----
> > > >  2 files changed, 10 insertions(+), 10 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/i915/display/intel_sdvo.c b/drivers/gpu/drm/i915/display/intel_sdvo.c
> > > > index 825638702ac1..5f9e748adc89 100644
> > > > --- a/drivers/gpu/drm/i915/display/intel_sdvo.c
> > > > +++ b/drivers/gpu/drm/i915/display/intel_sdvo.c
> > > > @@ -1220,7 +1220,7 @@ static bool intel_sdvo_set_tv_format(struct intel_sdvo *intel_sdvo,
> > > >  	struct intel_sdvo_tv_format format;
> > > >  	u32 format_map;
> > > >  
> > > > -	format_map = 1 << conn_state->tv.mode;
> > > > +	format_map = 1 << conn_state->tv.legacy_mode;
> > > >  	memset(&format, 0, sizeof(format));
> > > >  	memcpy(&format, &format_map, min(sizeof(format), sizeof(format_map)));
> > > >  
> > > > @@ -2323,7 +2323,7 @@ static int intel_sdvo_get_tv_modes(struct drm_connector *connector)
> > > >  	 * Read the list of supported input resolutions for the selected TV
> > > >  	 * format.
> > > >  	 */
> > > > -	format_map = 1 << conn_state->tv.mode;
> > > > +	format_map = 1 << conn_state->tv.legacy_mode;
> > > >  	memcpy(&tv_res, &format_map,
> > > >  	       min(sizeof(format_map), sizeof(struct intel_sdvo_sdtv_resolution_request)));
> > > >  
> > > > @@ -2388,7 +2388,7 @@ intel_sdvo_connector_atomic_get_property(struct drm_connector *connector,
> > > >  		int i;
> > > >  
> > > >  		for (i = 0; i < intel_sdvo_connector->format_supported_num; i++)
> > > > -			if (state->tv.mode == intel_sdvo_connector->tv_format_supported[i]) {
> > > > +			if (state->tv.legacy_mode == intel_sdvo_connector->tv_format_supported[i]) {
> > > >  				*val = i;
> > > >  
> > > >  				return 0;
> > > > @@ -2444,7 +2444,7 @@ intel_sdvo_connector_atomic_set_property(struct drm_connector *connector,
> > > >  	struct intel_sdvo_connector_state *sdvo_state = to_intel_sdvo_connector_state(state);
> > > >  
> > > >  	if (property == intel_sdvo_connector->tv_format) {
> > > > -		state->tv.mode = intel_sdvo_connector->tv_format_supported[val];
> > > > +		state->tv.legacy_mode = intel_sdvo_connector->tv_format_supported[val];
> > > >  
> > > >  		if (state->crtc) {
> > > >  			struct drm_crtc_state *crtc_state =
> > > > @@ -3108,7 +3108,7 @@ static bool intel_sdvo_tv_create_property(struct intel_sdvo *intel_sdvo,
> > > >  		drm_property_add_enum(intel_sdvo_connector->tv_format, i,
> > > >  				      tv_format_names[intel_sdvo_connector->tv_format_supported[i]]);
> > > >  
> > > > -	intel_sdvo_connector->base.base.state->tv.mode = intel_sdvo_connector->tv_format_supported[0];
> > > > +	intel_sdvo_connector->base.base.state->tv.legacy_mode = intel_sdvo_connector->tv_format_supported[0];
> > > >  	drm_object_attach_property(&intel_sdvo_connector->base.base.base,
> > > >  				   intel_sdvo_connector->tv_format, 0);
> > > >  	return true;
> > > 
> > > Hmm. I didn't realize we are using this in the SDVO code as well.
> > > I don't *think* that one is actually broken since it has its own
> > > .{set,get}_property() hooks. But I suppose doing the rename
> > > there as well is a good idea anyway.
> > > 
> > > Can you split the SDVO vs. TV into separate patches? We need to
> > > backport at least the TV part, and a smaller patch means less
> > > chance of conflicts. Or if you prefer I can chunk it up while
> > > pushing.
> > 
> > hmm ouch... I shouldn't had rushed with it, I'm sorry.
> > But I already merged this as is.
> 
> Did you at least slap a cc:stable on it? Or maybe the Fixes: tag is
> enough these days...

I should have but I missed that as well. The Fixes tag should do the
trick, and I can follow-up to see if that propagated later or
I later send the backport to cc-stable.

> 
> > 
> > > 
> > > Both parts are
> > > Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > > 
> > > Thanks.
> > > 
> > > > diff --git a/drivers/gpu/drm/i915/display/intel_tv.c b/drivers/gpu/drm/i915/display/intel_tv.c
> > > > index a96bcfcf90a3..2b77d399f1a1 100644
> > > > --- a/drivers/gpu/drm/i915/display/intel_tv.c
> > > > +++ b/drivers/gpu/drm/i915/display/intel_tv.c
> > > > @@ -950,7 +950,7 @@ intel_disable_tv(struct intel_atomic_state *state,
> > > >  
> > > >  static const struct tv_mode *intel_tv_mode_find(const struct drm_connector_state *conn_state)
> > > >  {
> > > > -	int format = conn_state->tv.mode;
> > > > +	int format = conn_state->tv.legacy_mode;
> > > >  
> > > >  	return &tv_modes[format];
> > > >  }
> > > > @@ -1705,7 +1705,7 @@ static void intel_tv_find_better_format(struct drm_connector *connector)
> > > >  			break;
> > > >  	}
> > > >  
> > > > -	connector->state->tv.mode = i;
> > > > +	connector->state->tv.legacy_mode = i;
> > > >  }
> > > >  
> > > >  static int
> > > > @@ -1863,7 +1863,7 @@ static int intel_tv_atomic_check(struct drm_connector *connector,
> > > >  	old_state = drm_atomic_get_old_connector_state(state, connector);
> > > >  	new_crtc_state = drm_atomic_get_new_crtc_state(state, new_state->crtc);
> > > >  
> > > > -	if (old_state->tv.mode != new_state->tv.mode ||
> > > > +	if (old_state->tv.legacy_mode != new_state->tv.legacy_mode ||
> > > >  	    old_state->tv.margins.left != new_state->tv.margins.left ||
> > > >  	    old_state->tv.margins.right != new_state->tv.margins.right ||
> > > >  	    old_state->tv.margins.top != new_state->tv.margins.top ||
> > > > @@ -1900,7 +1900,7 @@ static void intel_tv_add_properties(struct drm_connector *connector)
> > > >  	conn_state->tv.margins.right = 46;
> > > >  	conn_state->tv.margins.bottom = 37;
> > > >  
> > > > -	conn_state->tv.mode = 0;
> > > > +	conn_state->tv.legacy_mode = 0;
> > > >  
> > > >  	/* Create TV properties then attach current values */
> > > >  	for (i = 0; i < ARRAY_SIZE(tv_modes); i++) {
> > > > @@ -1914,7 +1914,7 @@ static void intel_tv_add_properties(struct drm_connector *connector)
> > > >  
> > > >  	drm_object_attach_property(&connector->base,
> > > >  				   i915->drm.mode_config.legacy_tv_mode_property,
> > > > -				   conn_state->tv.mode);
> > > > +				   conn_state->tv.legacy_mode);
> > > >  	drm_object_attach_property(&connector->base,
> > > >  				   i915->drm.mode_config.tv_left_margin_property,
> > > >  				   conn_state->tv.margins.left);
> > > > -- 
> > > > 2.43.2
> > > 
> > > -- 
> > > Ville Syrjälä
> > > Intel
> 
> -- 
> Ville Syrjälä
> Intel
