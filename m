Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC5A879193
	for <lists+dri-devel@lfdr.de>; Tue, 12 Mar 2024 11:00:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21B6B1125EA;
	Tue, 12 Mar 2024 10:00:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eEHhXNuc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 680FB11257C;
 Tue, 12 Mar 2024 10:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710237644; x=1741773644;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=p03s2Df+w8IZfunUvjkRu4tyxV0k1sh3W1idxwa1HWQ=;
 b=eEHhXNucTLBINzNfQcPKS1rg4LeRjr65j3Br37XHms/gae/XTq10HURD
 gwAI2olXnTJCQFWNK0XqZMLYZvI/pefzRcpKXezMd4d0hLKe72ykKu2df
 159E5vAbt0y/aEosA5zHUfSmV+g+jg18DJAjNslOUm5RTBE829n8wLFPt
 tSAZxkmgRf6SLKr4fWTkcbLUj1jB0Gv223DtEkei7M+ddvjBOAj65o6+0
 tNlBVuGZlNSLTcOTAgzBGNqN68S3owOFN5ol8IO4hGHG06snDEabGeyeD
 FYWIcguT7V2Vu89Ly4LKDTahfWoL5BvGoZO1BVNGzl+br61TqarYWUanK g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="7882396"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="7882396"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 03:00:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="16080089"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Mar 2024 03:00:41 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Mar 2024 03:00:40 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 12 Mar 2024 03:00:40 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 12 Mar 2024 03:00:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h/A8OD36Pua0iJxTP7/WbvxxWSObdLz1W8WfR8w2NRkwhojkXocmG5i1K4pZqldgv5PvSwfFpyk9rP7sCmHYogMDshsThiBQImY9bwrHxbdxCu8O1KXwqYHVl/gnN1msRU3A8tG7dxRwjGllFpaveaSejoB5uzmp7UZLWKVM1JpGFG0S/5gVrgYSSF1n81Ios85ySY9I5YIozedvLHi78sY1zEpAjUQ5S1LyQqPR6/cl1jTbJb/e9YirPVeMrZCtar6lcPYM4dYMnR9P4mEjrohKZX1qe6vJtYs/YinP5dmDjL8+WV0LO2Y0Wt9m0EEy9kuy9KTlMyu9GCYClkX9CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tiCj79mmsqMVe8b2n02L9sReX9l583obDyYOitPkSc8=;
 b=ATrp/GQqoW24QI5i888D4PK/D0B0Z6Co/GhVScaiYgBKWLJLt1M4IjT9l2fMEGx2gctGMWuvWQX3JlGMifWf8lW9CdkXxpae4Zq1zViUuEhhamD573Ivtw+Au7o+ZkjrLoyIPprNHg9T885A9bUrm110tsj9MRe99BTW4mJpJ+f2WB4eQTL0Os3G9AhhPqKdS2+5xSBZy5QczDFrUnjlp37cyY4bhcqmMx6XltiiMXM+uxXaAQ3TvEsszAbBkfDcrOumWfH70TU+ETvFiMNp8sBaaT6SDsKM1S0nnC9xg2XgYMhwgVoTOvpf5l5r8B0vzY7p6eVU47BHHAjTBdQulA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6467.namprd11.prod.outlook.com (2603:10b6:208:3a5::18)
 by MW4PR11MB7054.namprd11.prod.outlook.com (2603:10b6:303:219::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.17; Tue, 12 Mar
 2024 10:00:38 +0000
Received: from IA1PR11MB6467.namprd11.prod.outlook.com
 ([fe80::f2d1:b0e6:5f04:5733]) by IA1PR11MB6467.namprd11.prod.outlook.com
 ([fe80::f2d1:b0e6:5f04:5733%5]) with mapi id 15.20.7386.016; Tue, 12 Mar 2024
 10:00:38 +0000
From: "Garg, Nemesa" <nemesa.garg@intel.com>
To: Pekka Paalanen <pekka.paalanen@collabora.com>
CC: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH 1/5] drm: Introduce sharpness mode property
Thread-Topic: [PATCH 1/5] drm: Introduce sharpness mode property
Thread-Index: AQHacGp5UiDXawhBlEeFI76TmL96M7EtieQAgAZGKLA=
Date: Tue, 12 Mar 2024 10:00:37 +0000
Message-ID: <IA1PR11MB6467BD415527EDC4C15625DFE32B2@IA1PR11MB6467.namprd11.prod.outlook.com>
References: <20240307083237.576177-1-nemesa.garg@intel.com>
 <20240307083237.576177-2-nemesa.garg@intel.com>
 <20240308104816.4cc72e02.pekka.paalanen@collabora.com>
In-Reply-To: <20240308104816.4cc72e02.pekka.paalanen@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6467:EE_|MW4PR11MB7054:EE_
x-ms-office365-filtering-correlation-id: c7b1551d-287b-4136-e2df-08dc427b44a4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oUIHQ8AgHdsH+X9nbreWgplDjZl0KpogmNF2JYtPdDA2NaBu5vw+BK8c9rW3+cz6y+6AHOuesEZckKIOFT9Hl0+MO+gdM0ETOkw4QgOuR/xMqHKc3zabowEyZ8OLtqi023v1O3IYEj8hNe3wCTSZEwpLjHuoqogAOw7vLDEu5nvfNtPuSO229ulN068EtpIwtPKYYr/sL52MB7Zksrc/HjVSeuBPIiWwPd2TYZMsKKE3Ybnenc8BWC0N/17JIgfW9MH4kDpSt8GxHVILe8lmqB28YyPwRFn7AKtYqDMmETyTewM65kVdDl1rD4njbrFBIv0r6Usfjqwn0+1b+fa2yKPYcyinP4iSQ8Otvy2lWkF+1eH8ettaug3geJmEhU0hrXSftDsasrCzU6ck1vNy2Kb9SlUUNNFmeSWd5Rau5cIKQz53mfOncKDe5Eo7A+5sqJRb+M4rX3AQp7yNLu5F+nzmWHUc1+hbugoIa5KAYaoNgLss1aD1Kgs6z71sTsm5MltG67cCgPIUIHTqk0PE8TrPjKIC68DD7CPU2G/n4dNyYqkJSxpklEKBEJPzyRsMY9V6umtwGeGnj704xaMyTShRRPUuHwqt9do50dQLzIw2rETqBDG4ON9F1OW+Ew3c5bMUeKdJv3/J9XrJOchghnYbzPvA4o9DHVQUdRHwJ5Y=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6467.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/uYPJ7PdiWCccLt2TrQibDHJsIJaxZF2Nk9Af5lxx5NNQfvTCpGh9/LyRPPg?=
 =?us-ascii?Q?Uoz0yty9pfDqDWT435+IC5vEC4vHvJRBZJk/kgU7JB6V85GOQ5WZ43V6YeEi?=
 =?us-ascii?Q?o74QjqySivftSPMdl8z8XYk+d2irVsiLM4fOTbJOnA0NrlC2in/CneHwU3kd?=
 =?us-ascii?Q?LGpUSH64wvxMvAcm0WfT8QnluFVgOQENnFYGnEnGTxGsdaKBOb6GSr539DnU?=
 =?us-ascii?Q?+epQ/7F5IEv3W2IUJQgvYu2mlIEvOewTVwUtIJwUqaolqGTnH4ndVVbhfsNA?=
 =?us-ascii?Q?ki+djFLJar26ZiyQEdXUzjsFCPg+i89TSrrRSvH5AXODTgVO1YswpAE4JbCW?=
 =?us-ascii?Q?xtPL6FcI3eIRUKjXngQRS3CCHZgCMjl7u0GUHi2Vfyf1iDuNA9nfIDSy4G1B?=
 =?us-ascii?Q?5fTl3ij+ZowZN7zZsNjNhovC71hyGUFnk2Us6u3oxZLhdsMtFsRQ+0B335OU?=
 =?us-ascii?Q?000zK8O918H6qoYr+ph5L0y+IucI7ra4LYaqip1lJtPGrDP+PB+1Gm1wCzvO?=
 =?us-ascii?Q?d97CCFp3JTEkRNj9TOw8hoIPR1DphE0J5v04EYb6fKZ4eJnFGpW6hdbESCJz?=
 =?us-ascii?Q?Q1yjbpqgVP1I73DwAyWBIKb3bPjeOLuf1NiXImZhjtoGYOar9QoF0Q5F7giz?=
 =?us-ascii?Q?Jo65jbgsZHCS/Si2gTgIJcVlTYdEFX8iPnp2D0SWFDeyz1PDqE5WnzaaWTTu?=
 =?us-ascii?Q?P1AYY+AR/QXyzV8R7rBj4QFM6eMmq4BDSlNDTCuV9HbhL7i2BOEW2+l5IrVV?=
 =?us-ascii?Q?WAEhG+zhkr4UlJZRzdvcTCFAGemBZD9bsAODoCePe2Zovk8zkLX+90DOx2L7?=
 =?us-ascii?Q?C5Ei/Oksl4zsXoLbcOvQT2dDLvIqkzggn1lkGwxmNIFqUKBPNN7gDGu2DUyA?=
 =?us-ascii?Q?+RErxNY8NBFxAjXZfzniRJkT807c/i1m/WYUnVbeg8VeO6BAt/ElagtLOZt+?=
 =?us-ascii?Q?kS/2PxOza9kpgJ2DZkjIZEjMD/WeXwtI0mzyoipT0CSK+C/DDHzTP5T7AJ1d?=
 =?us-ascii?Q?PHGtoXqB6KSWNOUXP3aETkarj4caRzEVM5HKz3GaHnjzKis3BdPV6aRJ11cE?=
 =?us-ascii?Q?CMlG1ZTSXsMce0D9Evla9XDNhdfGfChGBHheuobR083xcmDRNWxBC38HGcif?=
 =?us-ascii?Q?rMmEPgcE+p/HwGi2I+xE9E287qPORQcFIv50VAu2eyJ+GKKkmz3kpNg4CXwO?=
 =?us-ascii?Q?QiTA+165TNvpBGa3KSy2wBNCnqt7GR+enjcVBiEbR7JE5rlkSis9NIm58t0y?=
 =?us-ascii?Q?D0+cgySKBfgOtGPPrPEUKXHAzTGV+s/8xx4SP8iHTh3VR9tVH6U0a5PCJaTi?=
 =?us-ascii?Q?n1YCW3L46qHyQXUPS7XZwBSVPofst1mHb0Fk8gHmqTHPWimRew4V3nVcAaZ+?=
 =?us-ascii?Q?UcwIcfDb7LV7t0nlER742vF9vrylpgZLgNz69TVEg28fhnkL11ZNpBh8/lJp?=
 =?us-ascii?Q?QAcYSI0yJXRmmzRQloSUaJpVyCUM1Bva1/DAdsvBkZfUHK1dDZNyXdzzlKPy?=
 =?us-ascii?Q?zcnQPA15vha94jpQIQsAwL/qm5Fmtiieft4Hvlj30XPd0PQ4Oy+IOfHIojdJ?=
 =?us-ascii?Q?p82gTnwu4AuJNWbL9nVytYdQNFZMI1e/XhJTW3uv?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6467.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7b1551d-287b-4136-e2df-08dc427b44a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2024 10:00:37.9502 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EstCV+/qUTt3RgT5lNRmwJbmB7Qz0N59QcxfTkD1jiFcnFrAoHHzRv84/Pm1EDgPQ2vruVdIw5h+ylKwhCatZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7054
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
> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of Pe=
kka
> Paalanen
> Sent: Friday, March 8, 2024 2:18 PM
> To: Garg, Nemesa <nemesa.garg@intel.com>
> Cc: intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> Subject: Re: [PATCH 1/5] drm: Introduce sharpness mode property
>=20
> On Thu,  7 Mar 2024 14:02:33 +0530
> Nemesa Garg <nemesa.garg@intel.com> wrote:
>=20
> > This allows the user to set the intensity so as to get the sharpness
> > effect.
> >
> > It is useful in scenario when the output is blurry and user want to
> > sharpen the pixels.
> >
> > Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
> > ---
> >  drivers/gpu/drm/drm_atomic_uapi.c |  4 ++++
> >  drivers/gpu/drm/drm_crtc.c        | 17 +++++++++++++++++
> >  include/drm/drm_crtc.h            | 17 +++++++++++++++++
> >  3 files changed, 38 insertions(+)
>=20
> Hi,
>=20
> the UAPI documentation is completely missing. This cannot be discussed un=
til the
> UAPI contract is drafted. It needs to end up in the appropriate "Properti=
es"
> section under https://dri.freedesktop.org/docs/drm/gpu/drm-kms.html#kms-
> properties
> when documentation is built.
>=20
> I also do not see any of the previous review comments being addressed tha=
t I
> recall.
>=20
> The typo "sharpeness" is very common in these patches, and it is even in =
the UAPI
> as the property name. Also doc comments use different spelling than actua=
l code.
> And sometimes you use even "sharpening"
> instead of "sharpness". Which one is it?

Thank you for pointing it out. I'll change it to sharpness to make it consi=
stent everywhere and will add document in next revision. It seems I have mi=
ssed some queries I will try to address it.

Thanks,
Nemesa

>=20
>=20
> Thanks,
> pq
>=20
> >
> > diff --git a/drivers/gpu/drm/drm_atomic_uapi.c
> > b/drivers/gpu/drm/drm_atomic_uapi.c
> > index 29d4940188d4..773873726b87 100644
> > --- a/drivers/gpu/drm/drm_atomic_uapi.c
> > +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> > @@ -417,6 +417,8 @@ static int drm_atomic_crtc_set_property(struct
> drm_crtc *crtc,
> >  		set_out_fence_for_crtc(state->state, crtc, fence_ptr);
> >  	} else if (property =3D=3D crtc->scaling_filter_property) {
> >  		state->scaling_filter =3D val;
> > +	} else if (property =3D=3D crtc->sharpening_strength_prop) {
> > +		state->sharpeness_strength =3D val;
> >  	} else if (crtc->funcs->atomic_set_property) {
> >  		return crtc->funcs->atomic_set_property(crtc, state, property,
> val);
> >  	} else {
> > @@ -454,6 +456,8 @@ drm_atomic_crtc_get_property(struct drm_crtc *crtc,
> >  		*val =3D 0;
> >  	else if (property =3D=3D crtc->scaling_filter_property)
> >  		*val =3D state->scaling_filter;
> > +	else if (property =3D=3D crtc->sharpening_strength_prop)
> > +		*val =3D state->sharpeness_strength;
> >  	else if (crtc->funcs->atomic_get_property)
> >  		return crtc->funcs->atomic_get_property(crtc, state, property,
> val);
> >  	else {
> > diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
> > index cb90e70d85e8..d01ab76a719f 100644
> > --- a/drivers/gpu/drm/drm_crtc.c
> > +++ b/drivers/gpu/drm/drm_crtc.c
> > @@ -955,3 +955,20 @@ int drm_crtc_create_scaling_filter_property(struct
> drm_crtc *crtc,
> >  	return 0;
> >  }
> >  EXPORT_SYMBOL(drm_crtc_create_scaling_filter_property);
> > +
> > +int drm_crtc_create_sharpening_strength_property(struct drm_crtc
> > +*crtc) {
> > +	struct drm_device *dev =3D crtc->dev;
> > +
> > +	struct drm_property *prop =3D
> > +		drm_property_create_range(dev, 0, "SHARPENESS_STRENGTH",
> 0, 255);
> > +
> > +	if (!prop)
> > +		return -ENOMEM;
> > +
> > +	crtc->sharpening_strength_prop =3D prop;
> > +	drm_object_attach_property(&crtc->base, prop, 0);
> > +
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL(drm_crtc_create_sharpening_strength_property);
> > diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h index
> > 8b48a1974da3..241514fc3eea 100644
> > --- a/include/drm/drm_crtc.h
> > +++ b/include/drm/drm_crtc.h
> > @@ -317,6 +317,16 @@ struct drm_crtc_state {
> >  	 */
> >  	enum drm_scaling_filter scaling_filter;
> >
> > +	/**
> > +	 * @sharpness_strength
> > +	 *
> > +	 * Used by the user to set the sharpness intensity.
> > +	 * The value ranges from 0-255.
> > +	 * Any value greater than 0 means enabling the featuring
> > +	 * along with setting the value for sharpness.
> > +	 */
> > +	u8 sharpeness_strength;
> > +
> >  	/**
> >  	 * @event:
> >  	 *
> > @@ -1088,6 +1098,12 @@ struct drm_crtc {
> >  	 */
> >  	struct drm_property *scaling_filter_property;
> >
> > +	/**
> > +	 * @sharpening_strength_prop: property to apply
> > +	 * the intensity of the sharpness requested.
> > +	 */
> > +	struct drm_property *sharpening_strength_prop;
> > +
> >  	/**
> >  	 * @state:
> >  	 *
> > @@ -1324,4 +1340,5 @@ static inline struct drm_crtc
> > *drm_crtc_find(struct drm_device *dev,  int
> drm_crtc_create_scaling_filter_property(struct drm_crtc *crtc,
> >  					    unsigned int supported_filters);
> >
> > +int drm_crtc_create_sharpening_strength_property(struct drm_crtc
> > +*crtc);
> >  #endif /* __DRM_CRTC_H__ */

