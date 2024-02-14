Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD8B85437E
	for <lists+dri-devel@lfdr.de>; Wed, 14 Feb 2024 08:34:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F8AD10E116;
	Wed, 14 Feb 2024 07:34:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bqW5RAFr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAF4C10E148;
 Wed, 14 Feb 2024 07:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707896078; x=1739432078;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=AUJSbxQl/dwaqmI2bPnTgrhBPKty6DeExzAe4d2HXqY=;
 b=bqW5RAFrxXbkY527JaZOSsGDpQedo0z6qHteIJxrw9SJMQWFyu9yGVqp
 9zEg5ZLB6wgGaxzZoXGdH7kKJlGUZXUp/2UlTJ5LQ7v9Dl66u41HDca9X
 pHAkrgfdh+N2h6EYn2XIkzXq/YB5HOWGgWsbePh07GXb8DJL2Oi/htaDk
 2yiQ1BJrlodCUdeZA4H+6PmjRM6TYQeisOKW79LlMrAmEVvrXdpxYcqMa
 BCQgGHamxY3hjG+kAJ40K44uwV+mx1B6EnZYLuHYqOrM6Oz4KbEjR6ROu
 ZKZ5ebVivDCeylIwJAifm6ngf5qMvsHH3Y0tawuo2kTmPWc2oD98T/3v/ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="5762115"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="5762115"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 23:34:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; d="scan'208";a="34178565"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Feb 2024 23:34:37 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 13 Feb 2024 23:34:37 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 13 Feb 2024 23:34:37 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 13 Feb 2024 23:34:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WU7r6Vj4bRmC7T1XIyXaMNj6dXaU/iaMOo0AkxqAPNAxu6z/9p1NR275YgQGFSYVwhpgHQEZPYPQR9MVf24310poSrcXd8Co/dBHrBAH89IwMN2Dv09RDbn5XqI3bHnqAGmwUjplX0Jg/08gpfJDKjz33N3J+lIbEgUfHqvzfIWxhibG0/WJkD3vxgSopkLo0eIwKvM1njRa41jgwCOO9pBuEqkHUTeD6OSaKy0sVNNKs+HnYW7kUvisCISNqvDQ5JD7oN8LgNKbqjvQ871znB0RApbyRmn7pzFil6FnZCfBk4/2mt7u5l10Tytye0gshtCD4z062et37skLLMVaqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j368k2kNxFcA5rzoStJxCCYghhFidBKSCiaqUtz/nG0=;
 b=mYhi3Ec1rTR0BcPWmOMmow4o0x4WcWm7lju9uwCuzHDTyU3LzD68vjU9FOkVsI0t/SdUWC9XOf0xIyenTnrD3Ik5T0SLgCZ+Mf6SQwmG2yojKVi6L5Q98hW7lbhI+SSpfXrnEaBcsuMvT+JWcr1BYR1RCKNkgMhl8FPYKmH4JTXBkaEXz10M5ANwYKFkkhr7VIIRGuMZ5hFzELWwIMW9LGTwdK/9/0TO5kYvC0590pIBsDLo1eMG10lo3zdvgfsuHUH6zOrZZePZPgoRPbX19DlGm121cI9oGppYkZqeOOYnEkL6xBidJXilzMS2F1MtnwLiRsItHyX3VP6fQ2Mdfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 CH0PR11MB5284.namprd11.prod.outlook.com (2603:10b6:610:bf::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7292.25; Wed, 14 Feb 2024 07:34:35 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::590:38d5:5c7c:3e4d]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::590:38d5:5c7c:3e4d%7]) with mapi id 15.20.7292.022; Wed, 14 Feb 2024
 07:34:35 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: Sebastian Wick <sebastian.wick@redhat.com>
CC: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "pekka.paalanen@collabora.com" <pekka.paalanen@collabora.com>,
 "contact@emersion.fr" <contact@emersion.fr>, "harry.wentland@amd.com"
 <harry.wentland@amd.com>, "mwen@igalia.com" <mwen@igalia.com>,
 "jadahl@redhat.com" <jadahl@redhat.com>, "shashank.sharma@amd.com"
 <shashank.sharma@amd.com>, "agoins@nvidia.com" <agoins@nvidia.com>,
 "joshua@froggi.es" <joshua@froggi.es>, "mdaenzer@redhat.com"
 <mdaenzer@redhat.com>, "aleixpol@kde.org" <aleixpol@kde.org>,
 "xaver.hugl@gmail.com" <xaver.hugl@gmail.com>, "victoria@system76.com"
 <victoria@system76.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "quic_naseer@quicinc.com" <quic_naseer@quicinc.com>,
 "quic_cbraga@quicinc.com" <quic_cbraga@quicinc.com>,
 "quic_abhinavk@quicinc.com" <quic_abhinavk@quicinc.com>,
 "arthurgrillo@riseup.net" <arthurgrillo@riseup.net>, "marcan@marcan.st"
 <marcan@marcan.st>, "Liviu.Dudau@arm.com" <Liviu.Dudau@arm.com>,
 "sashamcintosh@google.com" <sashamcintosh@google.com>, "sean@poorly.run"
 <sean@poorly.run>
Subject: RE: [PATCH 08/28] drm: Add Color lut range attributes
Thread-Topic: [PATCH 08/28] drm: Add Color lut range attributes
Thread-Index: AQHaXkeuYL82CuXAtk6wMt0hcqbj/bEILOoAgAFGxiA=
Date: Wed, 14 Feb 2024 07:34:35 +0000
Message-ID: <DM4PR11MB63601F7AC6CF0FFBBFDC2559F44E2@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20240213064835.139464-1-uma.shankar@intel.com>
 <20240213064835.139464-9-uma.shankar@intel.com>
 <20240213120404.GB1372043@toolbox>
In-Reply-To: <20240213120404.GB1372043@toolbox>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|CH0PR11MB5284:EE_
x-ms-office365-filtering-correlation-id: a6a4e350-2044-4e9f-634a-08dc2d2f6465
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 82D2FXbHGe9p2b7GAU3EjlrW23m3lkUSlKusTvu8INK7eK6b98ZFNFfj5a54gNoYvwGdRnbOLRypkHwNbZaKTJscVVECDt8zLFa81D5nU9S67EDqMaD3gvUjs15IqFFnnBmXH+O0lHI8Taos9867+GO7PGWQDA1dxnIXA+Omrv8GlBbbrIHKbMF3aEbnBYCPLq5sdibu28S6SpolaWRJt5pXRsNNRJUy0r4UgFZz7lMKf8Gz9z9mUV0GTl8i4kyywmZA8Jq86Kq6/ujhpWnjlSbDxvVro63PXWSe3kzNERxWMGBTUeAGqQgdk+gVhNSi95rs8Hrul47lFI9lTGfNSUgcT4ZZ+r2oCMexbyJPvHtFwStr7xTmONGjWb0uMUmTDBMAtIJHCy4CfAxZ9BVUllH1IEgJQJuGsNBYx34lQjaGNrtC2tsbxM+8ZDpzh0RQ5x16eCnkdvRSH6IKLiSUqv2Y986XDrq5tSZ9DbZlcSEYRlptWSA/tTmjSYnG0wfTTnBcRry43E9X749yZ6TU12hqeuaZ3UogNZn3ruCOr2EhIMzH3DUzH0n3Cb4GGnhzhqGI1Ur2RovIkKTy/GbJRardClpeCCQIQEsRQPUJi1T1NLPk991S6o8mLpNxEOgl
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(136003)(346002)(366004)(376002)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(9686003)(478600001)(55016003)(41300700001)(7696005)(8936002)(8676002)(5660300002)(4326008)(7416002)(2906002)(52536014)(6506007)(38070700009)(66556008)(316002)(71200400001)(53546011)(6916009)(76116006)(66946007)(66476007)(64756008)(54906003)(66446008)(83380400001)(86362001)(122000001)(82960400001)(26005)(38100700002)(33656002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Im5YHCRa8yE+X6Nrs+ydwa/K71TxqNXYu2wKy9Q1RX9E8Gg/gHG33hXeHH+J?=
 =?us-ascii?Q?OXUyoCmStUmF4eVUH0iS5U4iNVXEkJktuMOvFK43/EjzTLTABDqj5VR35L5y?=
 =?us-ascii?Q?swr02vVHVd+3oS8Iz1ln60xJ/6FfiHeCIyuc3kt9sDO8YJ9jSRRZad3baX6x?=
 =?us-ascii?Q?GqkEZhMNldXDE7o/+HyIBYrDOaLEVYghLqF0YQyyFX0oaZBI6/ZyxOEpA5WC?=
 =?us-ascii?Q?luOERV6k9w7I9j1PxbCWPE07mYafpplBLf8XoR1Ne+5CZKGoJ6nLN90L07im?=
 =?us-ascii?Q?CsOFpXEzZBFchqV0Myh1+qun3xKfm2zHIPfvOk/uKVlRaMNq/VbmF76P8BVB?=
 =?us-ascii?Q?WotxMjX2L/hwj52fSC3EkN8nsAWbs7zwIKdwYWcN1eJXRSWwgi/kidQzlVHv?=
 =?us-ascii?Q?R7qUG7qwk4MIkBW37eduI1jX0XCuzpMKZ0LcArYdWhH5LiNxIAguyCPCFMoH?=
 =?us-ascii?Q?/DPanFgYqDdRaZltPZhJKHMSrKB3WOyR1PWS+DlxtkQBNZEvXltTeBWaWyod?=
 =?us-ascii?Q?5mVlsoktHysrVCx0QBo17CQ7ao3l6Pa1y6WGgVGZMo9H/Gt2/6GPVyH9++/0?=
 =?us-ascii?Q?GGWAnMhd4eKjx05yzrITB69RyBvresK4QwEA/ksIdaTWhhiL7PcmX2F9Eutb?=
 =?us-ascii?Q?DXAsgZ2XSe70MyQPMmgN/eEDQXD9Ieva/13U2zSVJJxi/4+mz1J4VBMBheNt?=
 =?us-ascii?Q?mKHp/rTWHGGzRuwbvkII77nhHmtt2p14amJTGmbuKIi8qpIHq8C6MAv9yNBF?=
 =?us-ascii?Q?kuLLvYS/crrJr8bWglGvyeYYXaEI6/D6fd16LXhEssfnRHgj3fTW3iS6LXCl?=
 =?us-ascii?Q?IE939iymCegquhnZ/4CxiH0uYUBqLzGOcgWGCuyVAu29KQA+dr0TKlIZ6fku?=
 =?us-ascii?Q?H0mfTV5dCyYr8WMq1Lb+cPHQJ8sC9XvCydq4LitK7Xua0xqrGcVM47fL32O/?=
 =?us-ascii?Q?+pfb6jcZszfdxvr4X7H8/34agMzZK89vQS+Kfrbl/ht889Zr/ZeX6hyBwiuV?=
 =?us-ascii?Q?OvlVTgNg9UrGD1O/tmR8Yj2mTC4xkDb+VHFoXMSsUFtZUut5y8MnnILN3j3c?=
 =?us-ascii?Q?LaGe5EyWihv8STzZqeu6fZoQaimJvD9gquwpR9SWULzXtKfmzomB3f4F/+S7?=
 =?us-ascii?Q?ezn+Pwq2csxR+W0Xb55XJNSXig7Nd6tywASU7Zo1YKW9KCPKQAg2ciT9kbGP?=
 =?us-ascii?Q?lxfKvKcGbhX9lm+lBRzXRBUzM+VDbCnHkeqUMIg6P6D46BNd6iOH6DqezBI4?=
 =?us-ascii?Q?NuBp898QUgAxhSSofLXQ73dCGgk/8p8y9zrznJ2DSdR2sBuaZwf6/W7U7QCc?=
 =?us-ascii?Q?0I0LAnD5B+Y3aLQ7lpFJ2hG9ybV5YvjhdozdPtNaUkKDTqgspokbiZ21v2sn?=
 =?us-ascii?Q?Y7Q+9WlvZUeH9SXyhTOvUXc7yaNvs8fZls6AWU/JwlAMp3U37YEPGj0wOmDy?=
 =?us-ascii?Q?EuR1eLQ/QJCMX+0fIrrSRNG4vPEaHpOp8XR7HPIcDyqueGBWIRgGdYr4OZnI?=
 =?us-ascii?Q?dTGvMVyAtmGnAvvYNHho+FGMU3f44njPJmd2D6YIh941aRwBIgE2Zhwjo3Sh?=
 =?us-ascii?Q?T3Z8fwoM+d2Ik+bVJntb7nTXwHu12OS3QY3CQPNj?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6a4e350-2044-4e9f-634a-08dc2d2f6465
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2024 07:34:35.0599 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V6XvZje0viITJl2LK2Ts0de+ZQIOIGAjZTjWHcJlKwpo4jPXgqDQ+XI8bOj1k+I7odaF6c8L9vmskc4iKcThWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5284
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
> From: Sebastian Wick <sebastian.wick@redhat.com>
> Sent: Tuesday, February 13, 2024 5:34 PM
> To: Shankar, Uma <uma.shankar@intel.com>
> Cc: intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org;
> ville.syrjala@linux.intel.com; pekka.paalanen@collabora.com;
> contact@emersion.fr; harry.wentland@amd.com; mwen@igalia.com;
> jadahl@redhat.com; shashank.sharma@amd.com; agoins@nvidia.com;
> joshua@froggi.es; mdaenzer@redhat.com; aleixpol@kde.org;
> xaver.hugl@gmail.com; victoria@system76.com; daniel@ffwll.ch;
> quic_naseer@quicinc.com; quic_cbraga@quicinc.com;
> quic_abhinavk@quicinc.com; arthurgrillo@riseup.net; marcan@marcan.st;
> Liviu.Dudau@arm.com; sashamcintosh@google.com; sean@poorly.run
> Subject: Re: [PATCH 08/28] drm: Add Color lut range attributes
>=20
> On Tue, Feb 13, 2024 at 12:18:15PM +0530, Uma Shankar wrote:
> > This defines a new structure to define color lut ranges, along with
> > related macro definitions and enums. This will help describe segmented
> > lut ranges/PWL LUTs in the hardware.
> >
> > Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> > Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> > ---
> >  include/uapi/drm/drm_mode.h | 58
> > +++++++++++++++++++++++++++++++++++++
> >  1 file changed, 58 insertions(+)
> >
> > diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> > index af67f32e0087..376498715d0e 100644
> > --- a/include/uapi/drm/drm_mode.h
> > +++ b/include/uapi/drm/drm_mode.h
> > @@ -1014,6 +1014,64 @@ struct hdr_output_metadata {
> >  				  DRM_MODE_PAGE_FLIP_ASYNC | \
> >  				  DRM_MODE_PAGE_FLIP_TARGET)
> >
>=20
> All of this uses DRM_MODE_LUT namespace but it seems specifically for the=
 drm
> colorop of type DRM_COLOROP_1D_LUT. Let's be consistent with the naming.

Yeah Sebastian, we will update this and get it aligned.
Thanks for pointing out.

Regards,
Uma Shankar

> > +/**
> > + * DRM_MODE_LUT_INTERPOLATE
> > + *
> > + * linearly interpolate between the points  */ #define
> > +DRM_MODE_LUT_INTERPOLATE BIT(0)
> > +
> > +/**
> > + * DRM_MODE_LUT_REUSE_LAST
> > + *
> > + * the last value of the previous range is the
> > + * first value of the current range.
> > + */
> > +#define DRM_MODE_LUT_REUSE_LAST BIT(1)
> > +
> > +/**
> > + * DRM_MODE_LUT_NON_DECREASING
> > + *
> > + * the curve must be non-decreasing
> > + */
> > +#define DRM_MODE_LUT_NON_DECREASING BIT(2)
> > +
> > +/**
> > + * DRM_MODE_LUT_REFLECT_NEGATIVE
> > + *
> > + *  the curve is reflected across origin for negative inputs  */
> > +#define DRM_MODE_LUT_REFLECT_NEGATIVE BIT(3)
> > +
> > +/**
> > + * DRM_MODE_LUT_SINGLE_CHANNEL
> > + *
> > + * the same curve (red) is used for blue and green channels as well
> > +*/ #define DRM_MODE_LUT_SINGLE_CHANNEL BIT(4)
> > +
> > +/**
> > + * struct drm_color_lut_range
> > + *
> > + * structure to advertise capability of a color hardware
> > + * block that accepts LUT values.  It can represent LUTs with
> > + * varied number of entries and distributions
> > + * (Multi segmented, Logarithmic etc).
> > + */
> > +
> > +struct drm_color_lut_range {
> > +	/* DRM_MODE_LUT_* */
> > +	__u32 flags;
> > +	/* number of points on the curve */
> > +	__u16 count;
> > +	/* input/output bits per component */
> > +	__u8 input_bpc, output_bpc;
> > +	/* input start/end values */
> > +	__s32 start, end;
> > +	/* output min/max values */
> > +	__s32 min, max;
> > +};
> > +
> >  /*
> >   * Request a page flip on the specified crtc.
> >   *
> > --
> > 2.42.0
> >

