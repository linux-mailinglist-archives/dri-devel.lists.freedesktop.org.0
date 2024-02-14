Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 938AC854367
	for <lists+dri-devel@lfdr.de>; Wed, 14 Feb 2024 08:28:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8675F10E41D;
	Wed, 14 Feb 2024 07:28:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RIwz+uI6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D587C10E1F3;
 Wed, 14 Feb 2024 07:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707895722; x=1739431722;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6ABLV22GR6DHGF8gfsDDtGJ+wqz2kIin7s1QPKbbkAI=;
 b=RIwz+uI6VJ/fdYQBHq0E6FsCrbR9Da8BQy86L/X+F4xvcM76tpMEw3xr
 9VAffW9eP3CeoEygV5evzYDwbKwPcbprYo/fdLB+UhHIIILzhULT5hxl4
 TLX+Xceu8iHdFeXe4N6TgmLLuAm3zgRfC6IkofIuOmGHD87DS895FS14d
 p7VyxW/UUf0e3LUqX5J096Wjfh+gwGg/0ArFpP06dv1n526BPmfLs0ns6
 /RWc+S1fCoDLo4ZmtElZYV0G7EOtiWCQOmXyGdEbshTXGHhzxsqfk8rpE
 46yrNsHskSTDJfDvYQKyTqnWOc0RJ4wKm6sg7QOMloK/2/SVKAWMZVCjF g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="19343412"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; d="scan'208";a="19343412"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 23:28:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="3470842"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Feb 2024 23:28:40 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 13 Feb 2024 23:28:39 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 13 Feb 2024 23:28:39 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 13 Feb 2024 23:28:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M45ZtLCRNGyNOen1UyptfQs8KitUEJnAsXkJwx9rAbeCs41knWF9d7kzs4kSNDXjuhFo75LZjWknqG7gddC4d0KOqxxJr4gakeJPifTUvd85OBK9qF60LeMfwjBC5MAlX8+Y64zCA0p09PkXcirCnWyFG6gZC67kC15k9iyw35iycOkQJ+BHQOmf+/T6anoG7+SYI+XDcbk6BGPzY/XHPQ8cJeh5u2RWQLF7wqoiuW/vRHVdEwH0e5sEm10r93KNBoo4FU2EmBSOorzU8ixwbfOoENzLPJgkvvWjHufeUTIJaGlUc94PFQegw5ib17pjGQ0rTmuBwSCHzGzl7aggQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cj2nY41/zItNwXVMKRK+OZWVffAX2SC9KtqLVvXtzwM=;
 b=lUFRVTQ9jw3rnKp5VEgqRQliFMT7cGS3DdT/r6U+XQJdJcUq54OuP0jxhUQovTJdaLo2Lc0E6XwlDVJ+vq2j1dgUIVZFm1cDNzoQX536blwk8jtBhdgEcwyNvmtr9E/nbbZPFMqp6fns6BT4m9I9ziWhnuSwUaQ6gaSgRfAuqURBBkv9r9NGxcHn14CFnVcrOb/mu0JKnEen4GgXjU7mcgXKZS/97ja0DB5JH6Cj9PsV8dOzvLv8LCuoyIUxWv8cjLF9mYo4oQP65KOoWlbs4bCh2csFpjiQaWjaqKvNqACmtvqGpl5/bMooQ1KedF8bUciQeW7aFfA01V0anqaHSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 CH0PR11MB5284.namprd11.prod.outlook.com (2603:10b6:610:bf::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7292.25; Wed, 14 Feb 2024 07:28:37 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::590:38d5:5c7c:3e4d]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::590:38d5:5c7c:3e4d%7]) with mapi id 15.20.7292.022; Wed, 14 Feb 2024
 07:28:37 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: Pekka Paalanen <pekka.paalanen@haloniitty.fi>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>
CC: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "contact@emersion.fr" <contact@emersion.fr>, "harry.wentland@amd.com"
 <harry.wentland@amd.com>, "mwen@igalia.com" <mwen@igalia.com>,
 "jadahl@redhat.com" <jadahl@redhat.com>, "sebastian.wick@redhat.com"
 <sebastian.wick@redhat.com>, "shashank.sharma@amd.com"
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
Subject: RE: [PATCH 17/28] drm/i915: Define segmented Lut and add capabilities
 to colorop
Thread-Topic: [PATCH 17/28] drm/i915: Define segmented Lut and add
 capabilities to colorop
Thread-Index: AQHaXkfVkkDkY662rUmdCzLQ2yntRrEIA/OAgAFlVTA=
Date: Wed, 14 Feb 2024 07:28:37 +0000
Message-ID: <DM4PR11MB636037556D1EF1ACC2A70629F44E2@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20240213064835.139464-1-uma.shankar@intel.com>
 <20240213064835.139464-18-uma.shankar@intel.com>
 <20240213113727.22f9c8e5@eldfell>
In-Reply-To: <20240213113727.22f9c8e5@eldfell>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: ville.syrjala@linux.intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|CH0PR11MB5284:EE_
x-ms-office365-filtering-correlation-id: 014362c5-c6ea-450e-fda9-08dc2d2e8f06
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RuPW6QVdAoaKup1yajpnRoejxzBzfTqhM8b/XnOjFbqkqEqquC3JJgmFYSnomQ/Xp4Yjy1RLl4RD4IUuMt99cjYQR81MkUn7+Dgup26g9txM2FeN4n+hcFUd4r2WYSHdwOFdMzzTOB/fhbexPdgROWkVd9t0P+KwyFoBvlfGAF+8RDJOk2wQuVAyleWiMt6ayAzP9BxuFT40RTMyZ8Ci0WAqJoaBIe3cobCP9Hw5p81FNgZ44ImbCNJc+OingO0d8xYgTlebW7hATexIP2cuwbYwRhpgR7lgBtuQJ9F61p1xHPyd+aPI3Pomj5F1Tj3zOtftD9sRlA6WKcEYm58qR4bZp0ceVF7lTm/Dkx5OW8kw3F9PXr4WV+rn4x7LZNjscanAMcgdKWISVTFmWQ8yDQLBDs4Kyh3ASru384RdavsRO3LYwoZsWCfgqISOiP2tZ6auIqafP5PkN6LbdNNKq18VUBkO0SPa8a7DeIjSjiK4W1ip9uSoMMHPyY3lTI9dWVcNEqv4pdfxupxK2dVoP3mxR8iew3Wo9elsy2zMA3bAP1qDMPDLmMCu0EuV6TKuX6qWb9gshI0RlwWA5Jxk78WV94BqaTnhKUEClPu+NYaNuMdRqwfiaDYHgq5NKMMX
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(136003)(346002)(366004)(376002)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(9686003)(478600001)(55016003)(41300700001)(66899024)(7696005)(8936002)(8676002)(5660300002)(4326008)(7416002)(2906002)(52536014)(110136005)(6506007)(38070700009)(66556008)(316002)(71200400001)(53546011)(76116006)(66946007)(66476007)(64756008)(54906003)(66446008)(83380400001)(86362001)(122000001)(82960400001)(26005)(38100700002)(33656002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?k7uVvtH+h7oJrFU66cs8TPxe8Zh46a8I4uWY4Qwb2orl6SuhrM/uNplni4Zr?=
 =?us-ascii?Q?+NRmtsVScQLgzTbWmFcbdgb9ySkEpNsrENUwoJOVDu7gpGYKWlULsPjzOgSr?=
 =?us-ascii?Q?zvbimwp+Y91uvenegmZZcM0AIsrzS+0+ppzzteHu1t1NblCySq56fFQE2CZf?=
 =?us-ascii?Q?GRIk/zO36opcQIAZpIskOJ9JztEVw6x86jMCuN5xDJtfz2rKfik2Oeejtv2J?=
 =?us-ascii?Q?mPa1aAMjdKz9/EeYb2c90B1Nz5svAmbvvg0vlWB1JVYlZ+h7io5GqL/XQdzY?=
 =?us-ascii?Q?sxsWxQqMFzFqUVzany07/9d4lC8gIAGZaLtx73J7KjO7PMSbslvJl6dMfuuH?=
 =?us-ascii?Q?j2vSDCS0TlyQ29CFcJyn0mWTIxfOBgDT+nQvJwpqvjb31C9rIEK1HSu+dn1M?=
 =?us-ascii?Q?HKAl0WE/6l54OqsYy1UfUCr8wbH9Oa5zVhGStPD6PLpy+mTBr6/JZdlMzCpD?=
 =?us-ascii?Q?4yKIJtSTlo11M1LFdVhaoX8Azh6+y5IpverM7T/BkisLo8z9cJbwfRGDCB12?=
 =?us-ascii?Q?TtN9JyOwssSC2jNb3YH39W7jkpfXiMvV1dZ7s420rnSBkdRnob/7qU3e0GMM?=
 =?us-ascii?Q?TuaIqyQNFbRmlxU7O4ppRyiunhi9oe2ojZjoBQayC2osll2BzOV6dN9zUU0V?=
 =?us-ascii?Q?cvrltXGHv2hSoVQdn/YIrojys58xWkNhxAVk6N037LlR66EmF1kudzj4/3pZ?=
 =?us-ascii?Q?LiLPxbYof5g6dnRXAxzBmxPXzepaOvEseEjc+hzNPD162qJxbV26xFr5hHNy?=
 =?us-ascii?Q?fC6264L91jWRs9X9C0Bz883cHNGqds+VfcxlF9oUGpdOiLXQXxpRQ6mp6had?=
 =?us-ascii?Q?jJe2aD9uZvwJEgfkkQLWgLCsVLuqtQ1XBxxyyR3X2kMyhOPconBiRHknppZM?=
 =?us-ascii?Q?Pj6lPWEZp1WhOHsEmJ34l71nZX4WWGTkSEMzlgFoDEcMkLCb1FcFZ0yjly3E?=
 =?us-ascii?Q?4qMuh8bm2/Emm0TU6YuDs9lBWzHMFdOK+Jz/D0UU4ng4BLZpI9RZ4OsbSVcq?=
 =?us-ascii?Q?hB2sYsSfLMkUoGmPE+/kkqLxa4RWX79OHNqfesR2i0nihWe0DOZvL1XsYEyh?=
 =?us-ascii?Q?G/yvsaJrBYNaQBkCx1lTrA8rIInHiQzROgOKcFo/GeMUNWlxuu9DeHwqXIfE?=
 =?us-ascii?Q?IeaGRigbSZKGSCEjl4ZSkCF0OvMCKPaW4mjjAv0dR5pt3QulddVGPav/xSGi?=
 =?us-ascii?Q?qrITP/9AFH+TxJu7N/rj4aVDvGHL7U4FayHXt/U0d9/9vaDBWDKoLdQhKNLQ?=
 =?us-ascii?Q?/UpA4TQOlbdgAtk3gdh3T+CAQ3kpdv8dbT7gAoV/6QiSAEXDtt1X0cNsfnu9?=
 =?us-ascii?Q?m8SNmz8a8JST3Zw68P7CZQDCPBQ4QbbFuyg683hOLeaHnV/VzGfrGGRDY/WH?=
 =?us-ascii?Q?4+tyUP8siUzhZM5FyxIzDC9X4oQ4gDS75Tf90g5VMYzHYLHbQpmQbXYwlFQn?=
 =?us-ascii?Q?hTGNuaDK0w9TSeLvnIaKPuToOkqmwXC79SZx6GfPGHrsg2OvQjeV2UQamo7N?=
 =?us-ascii?Q?dRmOI642f54eJK6W+8SYGVEenwsGrBHi3ryK01C2azmMhL9sNg87ZVMFLATv?=
 =?us-ascii?Q?DEEJdL3b9a26KcGjNCfIAubcQScJyfotiN8Shgfq?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 014362c5-c6ea-450e-fda9-08dc2d2e8f06
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2024 07:28:37.0885 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F08gaXSkq91L1ssBZMJx747KOPhNL2dyEQViYwL+DywpylNkFBTBr3U/6Q1Xze/pAJ3iOf+Ln5vORD09Ed08YA==
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
> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of Pe=
kka
> Paalanen
> Sent: Tuesday, February 13, 2024 3:07 PM
> To: Shankar, Uma <uma.shankar@intel.com>
> Cc: intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org;
> ville.syrjala@linux.intel.com; contact@emersion.fr; harry.wentland@amd.co=
m;
> mwen@igalia.com; jadahl@redhat.com; sebastian.wick@redhat.com;
> shashank.sharma@amd.com; agoins@nvidia.com; joshua@froggi.es;
> mdaenzer@redhat.com; aleixpol@kde.org; xaver.hugl@gmail.com;
> victoria@system76.com; daniel@ffwll.ch; quic_naseer@quicinc.com;
> quic_cbraga@quicinc.com; quic_abhinavk@quicinc.com; arthurgrillo@riseup.n=
et;
> marcan@marcan.st; Liviu.Dudau@arm.com; sashamcintosh@google.com;
> sean@poorly.run
> Subject: Re: [PATCH 17/28] drm/i915: Define segmented Lut and add capabil=
ities
> to colorop
>=20
> On Tue, 13 Feb 2024 12:18:24 +0530
> Uma Shankar <uma.shankar@intel.com> wrote:
>=20
> > This defines the lut segments and create the color pipeline
> >
> > Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> > Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_color.c | 109
> > +++++++++++++++++++++
> >  1 file changed, 109 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_color.c
> > b/drivers/gpu/drm/i915/display/intel_color.c
> > index e223edbe4c13..223cd1ff7291 100644
> > --- a/drivers/gpu/drm/i915/display/intel_color.c
> > +++ b/drivers/gpu/drm/i915/display/intel_color.c
> > @@ -3811,6 +3811,105 @@ static const struct intel_color_funcs
> ilk_color_funcs =3D {
> >  	.get_config =3D ilk_get_config,
> >  };
> >
> > +static const struct drm_color_lut_range xelpd_degamma_hdr[] =3D {
> > +	/* segment 1 */
> > +	{
> > +		.flags =3D (DRM_MODE_LUT_REFLECT_NEGATIVE |
> > +				DRM_MODE_LUT_INTERPOLATE |
> > +				DRM_MODE_LUT_NON_DECREASING),
>=20
> Hi Uma,
>=20
> is it a good idea to have these flags per-segment?
>=20
> I would find it very strange, unusable really, if REFLECT_NEGATIVE applie=
d on
> some but not all segments, for example. Is such flexibility really necess=
ary in the
> hardware description?

Hi Pekka,
Idea to have these flags is to just have some option in case there are some=
 differences
across segments. Most cases this should not be the case, just helps to futu=
re proof
the implementation.

Based on how the community feels on the usability of it, we can take a call=
 on the flags
and the expected interpretation for the same. We are open for suggestions o=
n the same.

>=20
> > +		.count =3D 128,
> > +		.input_bpc =3D 24, .output_bpc =3D 16,
>=20
> The same question about input_bpc and output_bpc.

Same for these as well, userspace can just ignore these if no usage. Howeve=
r, for some clients
it may help in Lut computations.
The original idea for the structure came from Ville (missed to mention that=
 in cover letter, will get that
updated in next version).

@ville.syrjala@linux.intel.com Please share your inputs on the usability of=
 these attributes.


> > +		.start =3D 0, .end =3D (1 << 24) - 1,
> > +		.min =3D 0, .max =3D (1 << 24) - 1,
> > +	},
> > +	/* segment 2 */
> > +	{
> > +		.flags =3D (DRM_MODE_LUT_REFLECT_NEGATIVE |
> > +				DRM_MODE_LUT_INTERPOLATE |
> > +				DRM_MODE_LUT_REUSE_LAST |
> > +				DRM_MODE_LUT_NON_DECREASING),
> > +		.count =3D 1,
> > +		.input_bpc =3D 24, .output_bpc =3D 16,
> > +		.start =3D (1 << 24) - 1, .end =3D 1 << 24,
>=20
> What if there is a gap or overlap between the previous segment .end and t=
he next
> segment .start? Is it forbidden? Will the kernel common code verify that =
drivers
> don't make mistakes? Or IGT?

This is just to help give some reference to userspace.  As of now, driver t=
rusts the values
coming from userspace if it sends wrong values its on him and driver can't =
help much.
However, we surely can have some sanity check like non decreasing luts etc.=
 to driver.

Ideally LUT values should not overlap, but we can indicate this explicitly =
with flag to
hint the userspace (for overlap or otherwise) and also get a check in drive=
r for the same.

Regards,
Uma Shankar

>=20
> Thanks,
> pq
>=20
> > +		.min =3D 0, .max =3D (1 << 27) - 1,
> > +	},
> > +	/* Segment 3 */
> > +	{
> > +		.flags =3D (DRM_MODE_LUT_REFLECT_NEGATIVE |
> > +				DRM_MODE_LUT_INTERPOLATE |
> > +				DRM_MODE_LUT_REUSE_LAST |
> > +				DRM_MODE_LUT_NON_DECREASING),
> > +		.count =3D 1,
> > +		.input_bpc =3D 24, .output_bpc =3D 16,
> > +		.start =3D 1 << 24, .end =3D 3 << 24,
> > +		.min =3D 0, .max =3D (1 << 27) - 1,
> > +	},
> > +	/* Segment 4 */
> > +	{
> > +		.flags =3D (DRM_MODE_LUT_REFLECT_NEGATIVE |
> > +				DRM_MODE_LUT_INTERPOLATE |
> > +				DRM_MODE_LUT_REUSE_LAST |
> > +				DRM_MODE_LUT_NON_DECREASING),
> > +		.count =3D 1,
> > +		.input_bpc =3D 24, .output_bpc =3D 16,
> > +		.start =3D 3 << 24, .end =3D 7 << 24,
> > +		.min =3D 0, .max =3D (1 << 27) - 1,
> > +	}
> > +};
> > +
> > +/* FIXME input bpc? */
> > +static const struct drm_color_lut_range xelpd_gamma_hdr[] =3D {
> > +	/*
> > +	 * ToDo: Add Segment 1
> > +	 * There is an optional fine segment added with 9 lut values
> > +	 * Will be added later
> > +	 */
> > +
> > +	/* segment 2 */
> > +	{
> > +		.flags =3D (DRM_MODE_LUT_REFLECT_NEGATIVE |
> > +				DRM_MODE_LUT_INTERPOLATE |
> > +				DRM_MODE_LUT_NON_DECREASING),
> > +		.count =3D 32,
> > +		.input_bpc =3D 24, .output_bpc =3D 16,
> > +		.start =3D 0, .end =3D (1 << 24) - 1,
> > +		.min =3D 0, .max =3D (1 << 24) - 1,
> > +	},
> > +	/* segment 3 */
> > +	{
> > +		.flags =3D (DRM_MODE_LUT_REFLECT_NEGATIVE |
> > +				DRM_MODE_LUT_INTERPOLATE |
> > +				DRM_MODE_LUT_REUSE_LAST |
> > +				DRM_MODE_LUT_NON_DECREASING),
> > +		.count =3D 1,
> > +		.input_bpc =3D 24, .output_bpc =3D 16,
> > +		.start =3D (1 << 24) - 1, .end =3D 1 << 24,
> > +		.min =3D 0, .max =3D 1 << 24,
> > +	},
> > +	/* Segment 4 */
> > +	{
> > +		.flags =3D (DRM_MODE_LUT_REFLECT_NEGATIVE |
> > +				DRM_MODE_LUT_INTERPOLATE |
> > +				DRM_MODE_LUT_REUSE_LAST |
> > +				DRM_MODE_LUT_NON_DECREASING),
> > +		.count =3D 1,
> > +		.input_bpc =3D 24, .output_bpc =3D 16,
> > +		.start =3D 1 << 24, .end =3D 3 << 24,
> > +		.min =3D 0, .max =3D (3 << 24),
> > +	},
> > +	/* Segment 5 */
> > +	{
> > +		.flags =3D (DRM_MODE_LUT_REFLECT_NEGATIVE |
> > +				DRM_MODE_LUT_INTERPOLATE |
> > +				DRM_MODE_LUT_REUSE_LAST |
> > +				DRM_MODE_LUT_NON_DECREASING),
> > +		.count =3D 1,
> > +		.input_bpc =3D 24, .output_bpc =3D 16,
> > +		.start =3D 3 << 24, .end =3D 7 << 24,
> > +		.min =3D 0, .max =3D (7 << 24),
> > +	},
> > +};
> > +
> >  /* TODO: Move to another file */
> >  struct intel_plane_colorop *intel_colorop_alloc(void)  { @@ -3865,6
> > +3964,11 @@ int intel_plane_tf_pipeline_init(struct drm_plane *plane, s=
truct
> drm_prop_enum_l
> >  	if (ret)
> >  		return ret;
> >
> > +	if (icl_is_hdr_plane(i915, to_intel_plane(plane)->id)) {
> > +		drm_colorop_lutcaps_init(&colorop->base, plane,
> xelpd_degamma_hdr,
> > +					 sizeof(xelpd_degamma_hdr));
> > +	}
> > +
> >  	list->type =3D colorop->base.base.id;
> >  	list->name =3D kasprintf(GFP_KERNEL, "Color Pipeline %d",
> > colorop->base.base.id);
> >
> > @@ -3886,6 +3990,11 @@ int intel_plane_tf_pipeline_init(struct drm_plan=
e
> *plane, struct drm_prop_enum_l
> >  	if (ret)
> >  		return ret;
> >
> > +	if (icl_is_hdr_plane(i915, to_intel_plane(plane)->id)) {
> > +		drm_colorop_lutcaps_init(&colorop->base, plane,
> xelpd_gamma_hdr,
> > +					 sizeof(xelpd_gamma_hdr));
> > +	}
> > +
> >  	drm_colorop_set_next_property(prev_op, &colorop->base);
> >
> >  	return 0;

