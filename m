Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 642CB87038C
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 15:04:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5644E1121C0;
	Mon,  4 Mar 2024 14:04:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LkRNz4Xm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A32101121C4;
 Mon,  4 Mar 2024 14:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709561077; x=1741097077;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QkREKO4szv7N6sK/4cxOmyUk0Gyf8RKGoB7fHvHUx/Y=;
 b=LkRNz4Xm3dQg9Nt8Ah6xlD3j3CzUzXByv+brpdp8fC26+bkw2m2vD7Bu
 GegixFRBM37vvI/w0580G7jsW4Q3Q+dRrQ+20n8zD9myg54unA7oo8S7I
 rAK8LqnwRJctSq9mY2BhtevMuIK7xLR58SW69A2wWNPnbO3njGxpF/dGu
 /6/liWPL0IsddsJSVBjjsxpGmCUh+b1GLQYioqzxHWHt87sifrTiEhQ/n
 PQSOtPZeWqE0PTNssaFSEnKuoM9k/T7SZCBb1na/eJ8uLdIObOgUuCp/T
 +RnR1ud6w6en6et4dR8lD9sDxgmVg7jlGnkF3qY90JaKU8l88mOWN8x8j g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="14763438"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; d="scan'208";a="14763438"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 06:04:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; d="scan'208";a="13658020"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Mar 2024 06:04:35 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Mar 2024 06:04:31 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Mar 2024 06:04:31 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 4 Mar 2024 06:04:31 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 4 Mar 2024 06:04:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UJF35+nALJD3K5gJsdHxnTfuHIa9QKK/UkvenBOaHO1J/md5U+k+k3JS/BZex+06RD+L2Lp6DMFfB9022Pb+nWVdwRSxEIyaaHMs8wb1ZF/tU5w6g6KV00EbuhnsaklZXGd2Y6bkUd1HdgWo9OXcrgAgrC/Z7FXeM3452UfJ2zkTar+I95ca4oxnCrEmbWC3lVe41g9buCCh5KamUW0BUVpj75EfmzSF5poz1ayDRHGe73Vv/uTgL8W4LfgzUJRJj/Xc3kIGPxpPDhPtK0QKWTjdxyI7cHoldZbEYU+fR4hu46H2tzVED4W9lNg3Ekx9pHEXjgUDAZgOujEUShtsyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CuMeGD/VYflhy1Lm/IsjcSGx+UlBwfFJheoMNrX5xic=;
 b=ZtbE79G5KWt79fHK5Ow7ENo+8jbwRqWyRNYmmDkQVZVFlddXu5v/BlXawx/j17T2THA65WTxAwrynh0f0Ne5zZrM+HlCETv9kKr0MM8ehmtitV7mhFUb4czsnTrqo9G5CaDSE5uRQ/UlS4+9d9XE6kTX1i97kPHU9vaSK/BNjqsHI5kPPObHSXFLztC7d2eAQOec1s3/vBdHRW6BUa/omchLODq02gxhOZiZ+NrzFt/DRqEECLNoPZhoFoW9M9w0o4qKnD0bBf0pVOX7uMi3++9gcsL1LqXmOWmlBat88R7zX4UOcHyR8WtauhaImEXbFLteKnR7XS8U1kju31R90A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6467.namprd11.prod.outlook.com (2603:10b6:208:3a5::18)
 by SN7PR11MB6969.namprd11.prod.outlook.com (2603:10b6:806:2a9::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.22; Mon, 4 Mar
 2024 14:04:27 +0000
Received: from IA1PR11MB6467.namprd11.prod.outlook.com
 ([fe80::2397:93ca:29e3:378e]) by IA1PR11MB6467.namprd11.prod.outlook.com
 ([fe80::2397:93ca:29e3:378e%4]) with mapi id 15.20.7362.019; Mon, 4 Mar 2024
 14:04:27 +0000
From: "Garg, Nemesa" <nemesa.garg@intel.com>
To: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
CC: Simon Ser <contact@emersion.fr>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "G M, Adarsh" <adarsh.g.m@intel.com>
Subject: RE: [RFC 0/5]  Introduce drm sharpening property
Thread-Topic: [RFC 0/5]  Introduce drm sharpening property
Thread-Index: AQHaXzje+hY9B6aMtUSnlRX/VsGgnrELFMOAgAFLpoCAAEeTAIAbEMyA
Date: Mon, 4 Mar 2024 14:04:27 +0000
Message-ID: <IA1PR11MB6467F801FFB564769E357EA9E3232@IA1PR11MB6467.namprd11.prod.outlook.com>
References: <20240214112457.3734871-1-nemesa.garg@intel.com>
 <8Ma-GlU3bFAuSPpFhGbYYuXQ8OeeDjMK9WiWO6KP-4pPO41fLnLrgABkRfhjHY6XlIh5u67vcEbD8ejDq7-zo5BXf-too0Pt7oTDhWCOPlU=@emersion.fr>
 <IA1PR11MB6467A91412978DE0FFCAB50FE34C2@IA1PR11MB6467.namprd11.prod.outlook.com>
 <20240216103620.33deabb1@eldfell>
In-Reply-To: <20240216103620.33deabb1@eldfell>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6467:EE_|SN7PR11MB6969:EE_
x-ms-office365-filtering-correlation-id: bded9b25-2924-4fda-4ccd-08dc3c540141
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NNVNG0X3g6XQuTHoKdR7g2jjS8pbvR3KajR429KIakCR3FPsks9xvKZnREL9ziG9SqeiAmS+HAjMI26sBoAB0VUG0D/oBKnonDuDXOdXJmkrVS3oJOTlzIgK+1Pd1h+KG2WvypFdFHOgykXRAf9shlgXhtKxZYA7RlC+NjH67Bny01qmvpX3Fp1V121b9FRa91H6cXIC9TNuHSuXIBiLkuExhq2pWby/V+erazuj3/jjv3G6d1TXjdwMwQei8i3WboMZm80HcBdtUNl5Xz7/jRBQSqnH366yGIXHuzl9eiOyqeVtZ/ZS79THwg4Ft3VI9sNIeMNaINGHDwf5o7XoIftjumCv2hB9OTaATBL88CS6lV6VYRoGjsUC7nucEGrFcooO2SxeWdkeMoTYP5NJvMTEZaRuwgLHYtJjhN3bNGxPynngl0C3KFqsUsIxTSe1QXDSGZjYijtE///MwR4Ig6BCErifKsri4XFs9wV2cYQbSt/KLHKWquGuddNbP+kEUKa0Dd3phOe1IDgDR4+idH8/jd7z3Bh2f7R0/jUOnr6+eIGsBsTKs8hR/p8Ro/5j5E1CUYMQKySgk4ATXBZNtoZTmVRzgKo4fJs19HvJCS904+0Q9jhi9k7MXI7Zu9VSe0ZerzfqgrKNksrDFYJ1gWYqL1xSpjCFPH3EbKtKwiA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6467.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?zysKOamnC9o+/JmAV15QxQW2rwqe4sUC8faPR9xuJ57EPIyt2d9JnRtQas1R?=
 =?us-ascii?Q?63gJYVNWVxRx7tTjLGW/E8YHQoijI9o28liehT1AsfANa2hHbRXN4ZFiAtWi?=
 =?us-ascii?Q?UGOPfU4YrqZHZH/gIf9/A8ZD2PZlDzafUrdm3qQLFYO4DF/B7BV/mTtQ29rQ?=
 =?us-ascii?Q?0/OJ0MH/CmFrwbV+M/M7xP4U00uvyW42O3EBoZrQN+TT+PMUVoCfzCFEK9AB?=
 =?us-ascii?Q?nuCASySwowAcdIVSM6Ho92VX+cZaxRMxJ5+FUQz8+HfaTRXwkjVkD7KgqUDc?=
 =?us-ascii?Q?qj9xNBJT7Hy452ZtXhu9W64SqTUh4r5OcUrYzW7bJIDwj8HodGygd2EvZSnh?=
 =?us-ascii?Q?W9x2F0Z6v3P/E0mF4pG+Rosj564DDXDOy3pJPR71XRz/FjlPsN6x/p4J/oo4?=
 =?us-ascii?Q?rbBlb1eRfmjuXA/uktM85LHReLUk7xyGATT41rpnayhtFZpNYF6zYMe5RgBv?=
 =?us-ascii?Q?PH9X/jwljUz+GG8XOrF+x1YaKe58CATK/3v5Oei5Y4L+YMH8HL+qRR/67DD/?=
 =?us-ascii?Q?qBkNCioq3zAjfsGeKK/C6Yk6Z0DG0lQro1IguGNbA4iANUfv+N5DULLSMzip?=
 =?us-ascii?Q?Z5Z/eO+U1Hz+woN5FzQSkG3V8W+jLE42C+sqvRjzKq4Vg60rlCGPYmONcNRv?=
 =?us-ascii?Q?EQPDtnKdRDTb4vB3Ew6NkpB8NPiGn1xcVasK7ZE5Ez56ASbJ4FyknQlp3MGB?=
 =?us-ascii?Q?lkSJ9oY+AmmJoC4g/rovTAp1TQkZVO19KaXBJFFXpltnw1x1x2Q7yzxLvCB3?=
 =?us-ascii?Q?jY7x0CBvGzVTuNpjMreYjslGbgF2hpd90Doz4E23FBot9ulhsANGEHUjB8xo?=
 =?us-ascii?Q?K6ntt1ZkBXdarfJOxLmDUajKsNETFnWIyZXsIK9ZMWmgR/HJTOncWwh6RDV4?=
 =?us-ascii?Q?37VcM989qkZ/w19yBqyomCTE4c2S2CMFf8v387qIxQOX5SFUZk7DW4gDDJio?=
 =?us-ascii?Q?Ya4HaBss26Qoev4Jq+GnCHRgLd1jILPUoaCICfzEQZT/uMmB3aGrcC9PrezF?=
 =?us-ascii?Q?bUPBdMX2CMxoeDxxem/sKsIK69ecCvaormEkrJiOy/1EDurjQknmoegYeSge?=
 =?us-ascii?Q?A3EEceGjOuK7pu24IYQ70M292F/fffKad7ewkFZUg7wvCuU/mP9UZCnPLrHw?=
 =?us-ascii?Q?1owWkrsY28fvHX30W/9SeykP/FyGDknNmpHYdOfF8RwyOd+59e0CV6bmvXV6?=
 =?us-ascii?Q?dnK/8LmMxTslGLv1IUTAZ6g8Oeo8J3AeGj6WcG1zF1/ubuGAZUTK07eIBPm6?=
 =?us-ascii?Q?IKrUywLOndYghv1CDFW+bJLp2837HkAhKq6dKf3I1AWEq8jZEOVihBzef6uc?=
 =?us-ascii?Q?NEg4wvnaCOCYsHIP4o7VSraQ/ehL/r40khgC/aB/+BNWEJ1+NFCnLiP1Cmce?=
 =?us-ascii?Q?e46JwGia0FqIZv0l/SjmViKPWoVgKs5+ntYAI8AdVZa5p00rZ8nmlkB2XNPr?=
 =?us-ascii?Q?Y9jf8L+sqoE/hL3uam1evKz0ax0FMPGfjnk9rjm3CC9I4llJ7tq0BnUyq2Oh?=
 =?us-ascii?Q?62euTd+Qqtg8avA0wIISFEQ0NYGGx0kie4tMrh9HAgB+SUi31OaEbwdID2k/?=
 =?us-ascii?Q?Cwz0zBZgs9kuROJyIvxS2grRZU7YzVUNTNPogOsM?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6467.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bded9b25-2924-4fda-4ccd-08dc3c540141
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2024 14:04:27.5214 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u5uvkF51EMY7t9zITeo2IsQJKsdPibz1JIgKsSUwztcjg4Vzpss7XosSeJ6vSEN1G0S5gyBGL/v7UXJjlrjb4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6969
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

This is generic as sharpness effect is applied post blending. Depending on =
the color gamut, pixel format and other inputs the image gets blended and o=
nce we get blended output it can be sharpened based on strength value provi=
ded by the user.

On intel platform it is implemented through pipe scaler. Pipe scaler can be=
 used as either scaler or sharpness filter.  As mentioned earlier the clien=
t can provide any strength value  between 0-255 or any other scale based on=
 discussions.  Perhaps userspace can have provide options like low-med-high=
 sharpness or in percentage form or steps which is mapped to 0-255.

I will add the documentation regarding property.

> -----Original Message-----
> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of Pe=
kka
> Paalanen
> Sent: Friday, February 16, 2024 2:06 PM
> To: Garg, Nemesa <nemesa.garg@intel.com>
> Cc: Simon Ser <contact@emersion.fr>; intel-gfx@lists.freedesktop.org; dri=
-
> devel@lists.freedesktop.org; G M, Adarsh <adarsh.g.m@intel.com>
> Subject: Re: [RFC 0/5] Introduce drm sharpening property
>=20
> On Fri, 16 Feb 2024 04:28:41 +0000
> "Garg, Nemesa" <nemesa.garg@intel.com> wrote:
>=20
> > It is not intel specific and the goal is to have a generic API for
> > configuring Sharpness, accessible to various vendors. Intel currently
> > offers sharpness support through the Display Engine, while other
> > vendors seem to support Sharpness through the GPU using GL shaders
> > (Vulcan/Open GL based).
>=20
> Do you mean that all vendors use the exact same mathematical algorithm (w=
ith
> only differences in operation precision at most)?
>=20
> If yes, good.
>=20
> If not, then we need to know where exactly in the virtual KMS color pipel=
ine the
> operation happens, whether this can be generic or not.
>=20
> Does this also work the same regardless of pixel formats, dynamic range, =
color
> gamut, transfer functions etc. on both plane input and connector output
> configurations?
>=20
> > In terms of sharpness intensity adjustment, the plan is to provide
> > users with the ability to customize and regulate sharpness levels. We
> > suggest setting a minimum and maximum strength range from 1 to 255,
> > where a value of 0 signifies that the sharpness feature is disabled,
> > indicated by a u8 data type. For now we have mapped the strength value
> > 0.0 to 14.9375 to 0-239 but as the datatype is u8 user can give value
> > upto 255 which is gets clamped to 239.
>=20
> Naturally you will need to document all that, so that all drivers and ven=
dors do the
> exact same thing.
>=20
> I did not see any actual documentation in the patch series yet, e.g. a re=
ference to
> a specific algorithm.
>=20
> As Ville pointed out, there was also no specification at which point of t=
he virtual
> color pipeline this operation will apply. Before/after
> DEGAMMA/CTM/GAMMA/scaling in plane/blending/CRTC?
>=20
> Is the property being added to the list in
> https://dri.freedesktop.org/docs/drm/gpu/drm-kms.html#standard-crtc-
> properties
> or where-ever it belongs?
>=20
>=20
> Thanks,
> pq
>=20
> > We are also open to have alternative scales, such as 1-100 or 1-10, as
> > long as a general consensus is reached within the community comprising
> > OEMs and vendors.
> >
> > > -----Original Message-----
> > > From: Simon Ser <contact@emersion.fr>
> > > Sent: Thursday, February 15, 2024 2:03 PM
> > > To: Garg, Nemesa <nemesa.garg@intel.com>
> > > Cc: intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> > > Subject: Re: [RFC 0/5] Introduce drm sharpening property
> > >
> > > How much of this is Intel-specific? Are there any hardware vendors
> > > with a similar feature? How much is the "sharpness" knob tied to
> > > Intel hardware?

