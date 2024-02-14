Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55637854381
	for <lists+dri-devel@lfdr.de>; Wed, 14 Feb 2024 08:36:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C801710E148;
	Wed, 14 Feb 2024 07:36:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fn/dS0md";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ED2210E0C9;
 Wed, 14 Feb 2024 07:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707896206; x=1739432206;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uUhp5lSFJSsBpubfGlrYtt4tno8fC9bWCnhXbWQAh+s=;
 b=fn/dS0mdxqTCnHDrt2GB6z7EYNIBFrYwEHOT4FzVulcjkwI2fQbpo/rf
 xsYnsbl5APdX+Iswuuo5TwqnwsrXoEqLV97Qr4sfbANPE9C/IO+Piq/Gd
 0CRZ+SvKCoLvt3OUCkmMimiRK2gY6HUz47fLXlzaM66/QOoXEbGdCHCx5
 wIj+QPOwaxDIPkf07Whi2elharFF9LRBLcgqfBevXJQOGtftrzQC3rXAP
 WtCKAYHYcE09liOLyluzcXPy51mVU/jPj+iqrzQkyfVsHJdXA0gguwT0J
 92v1VT83cBaaLUd7AMZbrGR61KF3Z2Yn91y4wJqSDNzw2duspLi+0dFk5 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="12476723"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; d="scan'208";a="12476723"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 23:36:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="7717145"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Feb 2024 23:36:45 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 13 Feb 2024 23:36:44 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 13 Feb 2024 23:36:44 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 13 Feb 2024 23:36:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PaYlXfMVdE/LveTA2G5aDaw/ppJ+xoNykgRqZ5q0OtjXfT7hbQsBK02Db9UmhVGDVS+I9zm4xrs4ctthH9lbnKFGkPOC+aFe7du5ybsmMkhjykmyV9kTAAclCvOuspACRW3OkuiTfIuDakcIu56qOKkvbzA7ExDpvMkac0XQ5pfSJvPM/1HhDf9hXhTdRHRPFy4Ficzn6qGNSAzvOM5xQO7EZ4nXcFp4Dl+ouoh68XxctpD2upRA1ic9OXuIvBCvu5FN+zarshFY0nFxn7u/97/UxpfTybCaq1meK8HtIjWnt1vFpeLC1P7SJY0H73qnDRy8d4R4zWUK9RFkopOtsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j9hVLyqOfCm913Zh+RViGqGZkZ4FxSsDbmCnGVtH1CQ=;
 b=XhmjaRh/YiUP85wupFXxSBcDvKmIieBE8jpSX6Non+5UY74WyZhz12eZFhE+wwmA34Ekl0OYT9NnfmucnX0OKBK9PDRY0L/nB83qt6Omhx7DLKPVfzVb2QsKLiH8IOm037EYNjihpR6g3miP1oEIfgL7dkVmc8qjdOXdJp7KkQUoMiiQ+JSaLO5JwA2DvnDnr29FHWPGcmETAfOL5zBI+bu3IyJYvShPXPdJ4aSCOhfeW9mdy2YosLL6QN5X8NHGcI0OZ8m6vFzufxbW9cTs9ChWJO+Jo7xw+WpK+QUNUI4iwTucMxbE3rJGOh3rnjaIOZj0+9hg1o0sDOHQ/H1U4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 CH0PR11MB5284.namprd11.prod.outlook.com (2603:10b6:610:bf::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7292.25; Wed, 14 Feb 2024 07:36:42 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::590:38d5:5c7c:3e4d]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::590:38d5:5c7c:3e4d%7]) with mapi id 15.20.7292.022; Wed, 14 Feb 2024
 07:36:42 +0000
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
Subject: RE: [PATCH 09/28] drm: Add Color ops capability property
Thread-Topic: [PATCH 09/28] drm: Add Color ops capability property
Thread-Index: AQHaXkexJ9UNQ2Kd0EiAps+C64td4LEILRGAgAFG67A=
Date: Wed, 14 Feb 2024 07:36:42 +0000
Message-ID: <DM4PR11MB6360F1E36B43C1C926D8B693F44E2@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20240213064835.139464-1-uma.shankar@intel.com>
 <20240213064835.139464-10-uma.shankar@intel.com>
 <20240213120437.GC1372043@toolbox>
In-Reply-To: <20240213120437.GC1372043@toolbox>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|CH0PR11MB5284:EE_
x-ms-office365-filtering-correlation-id: 95d603bf-0001-4ac1-73a7-08dc2d2fb03e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qx2RbBwH0BAPK0WFwV7LZwuCyYKdGiB0C72fTO6miCNpoz9fUd+SjRX1IO7l3eopyOS0LMkTpgXwHu76I8PcH7BMOYTU39nPrqmTanU7EaWt6lHjeg2TVScr/qZsNRFurdg6qDJD2ScV4QIs8fDxD9X+kZ0Gytl8wljrNKjmTJME7d0GvQb6J58licYkDV/C2MEJ5ALN7xNG5H6CVAfsjb2zMv718cWKU/MAyRksht8WdhW1oR7QSQT6VlPoYdwtIjl8M4fCb2YfY8GS0Vxsp2ekOz6eJZ/9WL6SoevRfYzS8NzsyA87FHDeWyM9oPVoNB1mk6jXBlsmW5J1+abWADct8DM0aMoSY0M3QYfFXSooe+YAiGaUMUtrGi3vKl9IsFt72zmYGHwovFeQE6ic4HGwwiASshbBtGpb9Gtm1xJs58JaK33IhZAN22cpGrxDPgVdwCHAEzrR7p8RwGd7+CQXy4P22RQiUdL4UGfWi63O0MyvElv1hcOCtkkRPXq4egfZ5GbUUohFc//G6DV8VLD9sClV/K2H4viCN3d5m1m+hSeZy5zgKGqrV3+L5p/9wt8pjrGGhScrP7p0yP1GZkCLTK7FqZkjXnqn44TjwcQrAsF0ArX4HlBp5eq8S+sB
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(136003)(346002)(366004)(376002)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(9686003)(478600001)(55016003)(41300700001)(7696005)(8936002)(8676002)(5660300002)(4326008)(7416002)(2906002)(52536014)(6506007)(38070700009)(66556008)(316002)(71200400001)(53546011)(6916009)(76116006)(66946007)(66476007)(64756008)(54906003)(66446008)(83380400001)(86362001)(122000001)(82960400001)(26005)(38100700002)(33656002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/YtmcRaRWgd1qFRSfj2QBPEvPiX8fAYcerCUvJS1umBb/1kz2T4QjNjxowUv?=
 =?us-ascii?Q?pl/h01ZJY/wtPuDwlngt7BfvaF0v8ZSiy8WljIty/MlRqz30iAvWu1oBJydF?=
 =?us-ascii?Q?88vR05aivpRu+0dvcynpHvKjOWfeBQulgnFUSJO37M6j4zpOV9PjRJ3QBSJ7?=
 =?us-ascii?Q?0I8i013/SJ+uUSz1SmFm+UdBYR49Pj46zq2aSA4oxmmg+rtNlB4FB8rSLZJj?=
 =?us-ascii?Q?0lkDVvWq+DB27jwlOoqPU9rMeYBTU6odjlHyUxWKj9BMpa9xCed36oLgIQ+U?=
 =?us-ascii?Q?lx4XLGfDWz6JBRZHR8iBQxvT17oqjkhFQfR72QgYh7LNAR4u+ypbIxVEGAIu?=
 =?us-ascii?Q?hF41/0XAOmn5tvpzo0qXofpb7ltmfBq/4ISYI05C5I0U8iezt+JYrVbYOx4w?=
 =?us-ascii?Q?MEY35Rkv5Vs1kSVvGEPOyBRMguQi5nRnq4GxTRNcg6OJQOouDGtavoMmXFh8?=
 =?us-ascii?Q?wpq5at0qK5ojOL0zDdHcZa2WqeLnwIfvPrg2fgduAo+Lj/vcXo4XN0LwZePo?=
 =?us-ascii?Q?ZBIn7w14qL5VCC+qjlkWyrrTyU50g+dKeLTr3T9VBhv4fPdgCEi7K3fdauQz?=
 =?us-ascii?Q?39zt3dLrAhyaQ4bd/nJqsZHD8WpDf7c0LQhnKJYx+DLZwQhYxUxi/22rEbGj?=
 =?us-ascii?Q?npKuRDOf7wydoKynvMw7jQOcbZmjXV66d7lqOUlK3zJikjNrMSx+jKo1u9LZ?=
 =?us-ascii?Q?v7pSo08y6yYzYJfsKWXvW7WwO/BaUjuvfhdRTDyxKQxi1S7+7rS4kR2QJx9N?=
 =?us-ascii?Q?uuepNCgmJGbkqFAAZBWwujtA4W4ACDy0q9pHmfj/fXD7PL7Ml6BJWF1WtERL?=
 =?us-ascii?Q?J0cTqyXTFASLYYd03rUZJiabvP/UIG6RcntG48beGSzF0TkK5M7yeE2rwp5c?=
 =?us-ascii?Q?Qc8msbUJiEvr+Xgt5vLMHiAIbgCCJbnFVpf1Iav46zS+3ZKPOol2lkJVopMP?=
 =?us-ascii?Q?ft2ozAcBKqOfnUU+edZoHGU8nL8ztH77wdy8jH+GL8kn31aNoj1r/LkhriZG?=
 =?us-ascii?Q?WUffnlb/OlJv321hrDRDG9m2xFHAYnij7xEWdswJEyuFNFXSOL+ccwEcGXB0?=
 =?us-ascii?Q?BQKB/ojcKpNxu0VPHHLmNCqQTznMnVsqHJjtQ0DCbGT72O4loyVEI5YCsbHi?=
 =?us-ascii?Q?YUcl2qOpEoGVdMpTMGLdOwdLvJOu+FjcCPL66zzu826VK5JCs/l+pos+4a0b?=
 =?us-ascii?Q?aH6PEB5ClSLQi1nMtezlj19Bjlzrp4zWQCALiiH+N6kOAsvslVIInZtymNQn?=
 =?us-ascii?Q?4hHzaXfCRhDbgMZ1xiyqNxgyloQh24Q2/NchHs5yiBqG6Tor2eGbiQUV6Dyx?=
 =?us-ascii?Q?3JfvPytxdVNmoNkMLM96deypuzsVWQsNfenjnvx9mecMTo0ZDR9SGU01ym/S?=
 =?us-ascii?Q?qshaK5FzHlgLh0nu/R3hGbytNHDFAEM2SaOMsgORKGoQQUVZnAgsuTqtu5c6?=
 =?us-ascii?Q?tkxGJw71Ui02YLd8UZzDdBfzkmxEUWTSE2+skEMWs2l0M2Z6WSFleJSecXH2?=
 =?us-ascii?Q?DXPHrH0ilRjeGHdoNUrbJuLqm0Wpea6E1cRXGwxPCQte2Ev0+DUEF7RuMrsa?=
 =?us-ascii?Q?mSPAydLEu2+mmVIde5K0ZWDlA71rxR9RRTOiPmRo?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95d603bf-0001-4ac1-73a7-08dc2d2fb03e
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2024 07:36:42.3254 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w8XdJpIraPXcJXOu51UmxDNd7USku5dlqCV6/KMIgBkmxR/cEwTREoWH5hvF9zSXErUUddm7F0RH556yY4zmlw==
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
> Sent: Tuesday, February 13, 2024 5:35 PM
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
> Subject: Re: [PATCH 09/28] drm: Add Color ops capability property
>=20
> On Tue, Feb 13, 2024 at 12:18:16PM +0530, Uma Shankar wrote:
> > Add capability property which a colorop can expose it's hardware's
> > abilities. It's a blob property that can be filled with respective
> > data structures depending on the colorop. The user space is expected
> > to read this property and program the colorop accordingly.
> >
> > Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> > Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> > ---
> >  drivers/gpu/drm/drm_atomic_uapi.c |  3 +++
> >  include/drm/drm_colorop.h         | 13 +++++++++++++
> >  2 files changed, 16 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/drm_atomic_uapi.c
> > b/drivers/gpu/drm/drm_atomic_uapi.c
> > index 9f6a3a1c8020..95f1df73209c 100644
> > --- a/drivers/gpu/drm/drm_atomic_uapi.c
> > +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> > @@ -770,6 +770,9 @@ drm_atomic_colorop_get_property(struct drm_colorop
> *colorop,
> >  		*val =3D state->curve_1d_type;
> >  	} else if (property =3D=3D colorop->data_property) {
> >  		*val =3D (state->data) ? state->data->base.id : 0;
> > +	} else if (property =3D=3D colorop->hw_caps_property) {
> > +		*val =3D state->hw_caps ?
> > +			state->hw_caps->base.id : 0;
> >  	} else {
> >  		return -EINVAL;
> >  	}
> > diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
> > index 5b8c36538491..f417e109c40a 100644
> > --- a/include/drm/drm_colorop.h
> > +++ b/include/drm/drm_colorop.h
> > @@ -59,6 +59,12 @@ struct drm_colorop_state {
> >  	 */
> >  	enum drm_colorop_curve_1d_type curve_1d_type;
> >
> > +	/**
> > +	 * @hw_caps:
> > +	 *
> > +	 */
> > +	struct drm_property_blob *hw_caps;
> > +
>=20
> Is this supposed to be generic for any colorop or specifically for
> DRM_COLOROP_1D_LUT?

We have intentionally kept it generic so that it can be used for any kind
of hardware color block (1D LUT, 3D LUT etc.). Differentiation can be done
by using the Color op type.

Regards,
Uma Shankar

> >  	/**
> >  	 * @data:
> >  	 *
> > @@ -167,6 +173,13 @@ struct drm_colorop {
> >  	 */
> >  	struct drm_property *bypass_property;
> >
> > +	/**
> > +	 * @hwlut_caps_property:
> > +	 *
> > +	 * Property to expose hardware lut capbilities.
> > +	 */
> > +	struct drm_property *hw_caps_property;
> > +
> >  	/**
> >  	 * @curve_1d_type:
> >  	 *
> > --
> > 2.42.0
> >

