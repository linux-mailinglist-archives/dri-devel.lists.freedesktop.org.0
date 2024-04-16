Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E0C8A6640
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 10:36:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F16710E053;
	Tue, 16 Apr 2024 08:36:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E3JgSc4o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ABB810E053;
 Tue, 16 Apr 2024 08:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713256578; x=1744792578;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=aMl2V/5rG0Zn5MlW3zIatFA2HU8N6pDiGcJwrd990FY=;
 b=E3JgSc4odiiNZ54NvI+vbOjaw+fEq45z8M5ARHzbMQhquQ9GdnBB9xK/
 2zjrQZn8mVoDkyUV7lWx89VkT+/mPYZVaoU0PTfu5NLJJVTna+g9AaM/4
 oT+XZJOX/MT4/ACOJIm90uU+vUIRozqf5LaC11sj4t0NUNB3dAs5cNGxm
 Mr2wVnUuGsp1NgbXHvOyRw4+jP9gSshywGmfGviGj34iOnRj3O3n+0Fpu
 bX+s8pVmtfFW7jvF4+nX6WqOToMRQpFvP1m5YRZiXZAUoL7p4tvgL3fHf
 gYoVH/rs7nwipZ5vsO6REN+gr27BSkZKRMXowfAmzSaYuGsjxIo2HCdPu w==;
X-CSE-ConnectionGUID: 39zHHumrR8a4241xuYEMrQ==
X-CSE-MsgGUID: f+Aq48vyTJCmK/Ttg59PDQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="8844953"
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; 
   d="scan'208";a="8844953"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 01:36:18 -0700
X-CSE-ConnectionGUID: 0NWgc6UEQtmJsjxbwwi28Q==
X-CSE-MsgGUID: j3DBmej4SHKNhNL8RXqK9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; d="scan'208";a="45478568"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Apr 2024 01:36:18 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Apr 2024 01:36:17 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Apr 2024 01:36:17 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 16 Apr 2024 01:36:17 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 16 Apr 2024 01:36:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KN9Z2aLg2soJjTB1vmXnYyVLudjScFfMDx+Fh9lONHfeO2tzULBsaoXhrA2o5XtCFZnWbbOQ44x46X+1+xkdv2BYKk304arA3HjmlD8mIrFi/hQRXm3Xwv7aqKYk6+i7wU9yfxlSxcBbmu2GNCbi8mwK8v4/NH6R5j2wu8XWMy5MMLujIiK5z0pl05FS10xtoMip/0XgFYHP1gwm+vnlp0bW48D3VlEUl7DRtGfNsjLKlUkh4zvRLtMMTZXyTMDvBdD6XUUtT4hxmpuv7QSgsuqL20vZNpKlcjX5l2O7MBmD5LkhBLt5rtem157ECximQmBzrwhT0cY11t2XUki9RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U3J+NYPaSG/HFPRHnOGpIAHZsYbqMDo0pdhWp5v/qd4=;
 b=fNl/MoczBAUK7E7qbVYG7c+L03P0GKxBT1te3OGg1eH0JZ7evFNcUd49UtG4ndogFVDNxYQPJy/LAUafkDyE8hRcRZx+b5IS2NtcFmQxsDuZjmG4GGJfYmsAyVMVDOhR13hCAU+J3wNJeTsByET8+JFP9huWp8PecSuAQeTv0//qKnjkF337Jf9AXpTLlwezbiEs0kTiIYN20R573sHZ82xgBa81iaxwPvfUuf91DRUntS3CFeuT43FM54n10mRCxhjboe/00du/54gJaodonBl7xLtYpjLQC69f4joIBoXeQKXmVjJLKHKBJgV/BWSQoU5e588Zn9cVTDj74h/SXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB5981.namprd11.prod.outlook.com (2603:10b6:510:1e0::15)
 by PH7PR11MB7569.namprd11.prod.outlook.com (2603:10b6:510:273::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 08:36:15 +0000
Received: from PH7PR11MB5981.namprd11.prod.outlook.com
 ([fe80::8970:61a2:f00d:b23f]) by PH7PR11MB5981.namprd11.prod.outlook.com
 ([fe80::8970:61a2:f00d:b23f%4]) with mapi id 15.20.7472.025; Tue, 16 Apr 2024
 08:36:15 +0000
From: "Manna, Animesh" <animesh.manna@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Hogander, Jouni" <jouni.hogander@intel.com>, "Murthy, Arun R"
 <arun.r.murthy@intel.com>
Subject: RE: [PATCH v2 5/6] drm/i915/alpm: Enable lobf from source in ALPM_CTL
Thread-Topic: [PATCH v2 5/6] drm/i915/alpm: Enable lobf from source in ALPM_CTL
Thread-Index: AQHajPOx+kARdWocSEKjTgZ2m8uaKrFpO+AAgAFbthA=
Date: Tue, 16 Apr 2024 08:36:15 +0000
Message-ID: <PH7PR11MB5981CD30285955A189E153E5F9082@PH7PR11MB5981.namprd11.prod.outlook.com>
References: <20240412155243.2891996-1-animesh.manna@intel.com>
 <20240412155243.2891996-6-animesh.manna@intel.com> <87v84i3kyh.fsf@intel.com>
In-Reply-To: <87v84i3kyh.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB5981:EE_|PH7PR11MB7569:EE_
x-ms-office365-filtering-correlation-id: 28c6467d-1bd7-42a0-fc7c-08dc5df04784
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BOBWxjdM+yFHkyjJp7apL+xdrielG8O1eMk8NpKGrmPvYCZ/F2bVcfJ71FVeT1vrsyZdmjTlkhKmdeBJf5VNo85ciiSy99Aojn1mBUJIr3G1DDQGLrqMwStlP4aBA3yikP+hQRMIvt7wrFk4zTZUwFxgy+Yp+UVcG+uDBXrMdZMe1BqiFasO9RNLdZRm9jvmwatc+hhH4U8rnvIcEDtH5i6LlI9fzDq0oo/Zm+XFn10fyOxeVuBk2X7H8z0G9W50fHYelI2y4ARroG7qkkRoEamLFLvHZpUD8fk8uM74LgWkjqxLvU1fASV6QV7sEwdTzUc3cvGnRpBYFnjhxeSKnGm9pXGSB0Ra9ijWFVgfNEexwviewfetzyQ1B78uIg5YmTo4Cqi5oY87q2jKMefS9fZMn5h5/Jz64nbWRz6p8qq7RpKH9R4zfkPufKKzm0OK0NG2YG329Xj4KIoMMnNVbZG63MTRxJJ2vivKCqcmMnLW2PC4BExzLbwbVhs8m4MPPkchDEN7LaLauVi2OA7arfC68enx0SIXtI9n3n+oPdImTflq/jK2Am+XHQFk9E3z5OzgAAWGmnyzdGsK6YBcPgnWb+MMRItzdnpoaeVYlTUUZa1MIMIQwNRNpg06VMnI75De8dUXQKAJYDTzmZ27QYICJ35CsVKoN2Z5VcwlnGIr2ZLx+DXwE5nXf6NUv92ylZXJyYns0NvHR81bOJqJfRUyKZZX/YyZZTcEqfd/+Bc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB5981.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ALpQ/gOEDwDJW+36UYLV64P2Bg5Tu5ZzXfKfenlzTxFY+9yQmKCR2U0/6/69?=
 =?us-ascii?Q?zNdJBlIYIKsRumVv2ZQIawMxAqhjjvzszfDdW1fN2vWMUyMb7g8EiTBTFxTw?=
 =?us-ascii?Q?/ElXeFvCT97jdvpM2x1s14h0EZGJCmI4XDG2vxa/7my1I4ECECdP26kF647r?=
 =?us-ascii?Q?LbQmfu+FKGvCJeNmTKP0Uhv/O+DGw7BQ9wJh19uAUp6kwHCPr5z4tbih5b5r?=
 =?us-ascii?Q?OonL/R9tDpw0eGFoSKnvVNu65TO2ijkk8aekShBeRVs1mBle6JRuh93WwLR4?=
 =?us-ascii?Q?XX/Lp72T3Bj61ZHl8Jtspa8kYZDmELWdQcq1wmdbg87ipQBkhzn97yC070pT?=
 =?us-ascii?Q?3JmmvkTeT3g2yhGGg6zE86UvlGW/D3D+wLdusiCmsIv/N5QorEKuslS7zkHu?=
 =?us-ascii?Q?M4t9lp9RCdkfoRwxUK2do7DXTGo2mdKhOmmqOOWN3CCjNHZdIkThfLfCneVG?=
 =?us-ascii?Q?LNwdV5oGIUSzu20MrJDRtMY3kSUMmJ+Xl7/QdQ+2MOVnSCSG+pkjNPlEHdHS?=
 =?us-ascii?Q?v7itScUmzLCujCR3CaQpirRys1H7Eu+/l0Yci9wUQPu9eUc9qxgsoB0lrtXy?=
 =?us-ascii?Q?XfipBD6M9ydm1ChBdXuVd8tCr3d574xOWJrF9SbtXOntLs0AWk8qSIFmcxVo?=
 =?us-ascii?Q?431fHvXbEYt3bSAH2atLV2rJBUY72acOiyFOnTR7tHVdFMs3lTIgYL04dmhN?=
 =?us-ascii?Q?D0fEGRvkaGhLeGCU7eiDCZNE+ASdK/suMerMrKUG3I8ASLsKRfU8Ucv8lICv?=
 =?us-ascii?Q?uh3AQmKgA9eREdwQ0oUfvCBtkSO1ZRslCTpXWkOcbzk4wa4BgLGUN54xEuoU?=
 =?us-ascii?Q?Ifiggv6ysz+2+iNq30JpdM0tWyic4/WNSRTCNa5aZmHTG6YslrnD+rrbvhud?=
 =?us-ascii?Q?EBZK0+IDtlIJJeUrhYjhQo4CWjrg+A0+2jOOE/CunZb7gJqODZ1ciVnWWWmC?=
 =?us-ascii?Q?6EBQlm8BubAX8OIYvuq0jnFD402ZtH0RTroPCK42+Brbmwu5/nRYWjpwIAqu?=
 =?us-ascii?Q?9NMbWR8fgIWywrlmbSM2COfvrLqPw/zBhbzfFs7rkHHe7xgKddwO4rwM7Way?=
 =?us-ascii?Q?o5Vb3G0bmz+KJNKl+7bbfBcOnby5BKdQ+o9GVXf6Og+qv9EJGUJ5l36GIwkS?=
 =?us-ascii?Q?n1rzZr0awvixlQbIReoibkI5e6RrTKv13lmwJafG7z2peSaugDlDyyK6fOcH?=
 =?us-ascii?Q?PZAM7EumXrxG7+26/ljOIhgaljV9c3J5vjs78P1yLKEwhYiTZhSkuSyxf/t5?=
 =?us-ascii?Q?WUDCNlSrBtVpYdj3tAJXPzPsY4TgWMDHM4U/kGkpGPCWrbdpwmCU0E4B71GF?=
 =?us-ascii?Q?c/JkScKhYtYOze/bArQa81kAcvLL8/K+NP2cclgJkWw4BRN+/ZEb8t9vc/ak?=
 =?us-ascii?Q?JA4LeRH/ucJEFLrH+3jcaAkVEE+eACRj34kWEYJVhleFiLHr8Ieh2KmMF9Je?=
 =?us-ascii?Q?MNRybDIFpH0IQhE/vk25ejpBok1YEyGQwbbDMrKTEoL79ELcKoEPQ0PltmQH?=
 =?us-ascii?Q?DNp74P1KeKFt0DXZkL5p1bY6WJeW8COB5MaA0mXknanVXUnIy5QTL6q1Yf5d?=
 =?us-ascii?Q?mWc3y4sUDpQtC+Odr5zlb43RZ94OUuU8yXgCrazT?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB5981.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28c6467d-1bd7-42a0-fc7c-08dc5df04784
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2024 08:36:15.2688 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ObGf4Y1xTCHWi3TDtqTK5y8gbyBuhF/hmClYUS02G8Bm0xYwgBFW3xKMsAMQ3pDrd3bB8mrTNlaxkYjNoLOPVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7569
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



> -----Original Message-----
> From: Nikula, Jani <jani.nikula@intel.com>
> Sent: Monday, April 15, 2024 5:19 PM
> To: Manna, Animesh <animesh.manna@intel.com>; intel-
> gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org; Hogander, Jouni
> <jouni.hogander@intel.com>; Murthy, Arun R <arun.r.murthy@intel.com>;
> Manna, Animesh <animesh.manna@intel.com>
> Subject: Re: [PATCH v2 5/6] drm/i915/alpm: Enable lobf from source in
> ALPM_CTL
>=20
> On Fri, 12 Apr 2024, Animesh Manna <animesh.manna@intel.com> wrote:
> > Set the Link Off Between Frames Enable bit in ALPM_CTL register.
> >
> > Signed-off-by: Animesh Manna <animesh.manna@intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_alpm.c          | 5 +++++
> >  drivers/gpu/drm/i915/display/intel_display_types.h | 1 +
> >  2 files changed, 6 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c
> > b/drivers/gpu/drm/i915/display/intel_alpm.c
> > index 699f2f051766..ae894c85233c 100644
> > --- a/drivers/gpu/drm/i915/display/intel_alpm.c
> > +++ b/drivers/gpu/drm/i915/display/intel_alpm.c
> > @@ -325,6 +325,11 @@ static void lnl_alpm_configure(struct intel_dp
> *intel_dp)
> >  			   ALPM_CTL_EXTENDED_FAST_WAKE_TIME(intel_dp-
> >alpm_parameters.fast_wake_lines);
> >  	}
> >
> > +	if (intel_dp->lobf_supported) {
> > +		alpm_ctl |=3D ALPM_CTL_LOBF_ENABLE;
> > +		intel_dp->lobf_enabled =3D true;
>=20
> Gut feeling says this should not be part of intel_dp but rather crtc stat=
e.

Kept with the same place with alpm parameters, will think over again.

Regards,
Animesh

>=20
> BR,
> Jani.
>=20
> > +	}
> > +
> >  	alpm_ctl |=3D
> > ALPM_CTL_ALPM_ENTRY_CHECK(intel_dp-
> >alpm_parameters.check_entry_lines)
> > ;
> >
> >  	intel_de_write(dev_priv, ALPM_CTL(cpu_transcoder), alpm_ctl); diff
> > --git a/drivers/gpu/drm/i915/display/intel_display_types.h
> > b/drivers/gpu/drm/i915/display/intel_display_types.h
> > index 6116c383b543..f61ba582429b 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> > +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> > @@ -1884,6 +1884,7 @@ struct intel_dp {
> >
> >  	/* LOBF flags*/
> >  	bool lobf_supported;
> > +	bool lobf_enabled;
> >  };
> >
> >  enum lspcon_vendor {
>=20
> --
> Jani Nikula, Intel
