Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4CECA8AA1
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 18:46:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F41310EB72;
	Fri,  5 Dec 2025 17:46:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KOpyIlur";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8F4C10EB72;
 Fri,  5 Dec 2025 17:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764956804; x=1796492804;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3TtNni5r1t9p+MN8hKnUFi9ZbUunjsNCcr9izZlzhgU=;
 b=KOpyIlurVCLKic+X6C6fHXNT+82I06uo0kT5H/V+F6QE15IwBIBRsTeU
 JUtonTFcDnBb/x+nI6YAl/k+zXmogoYM8j92062hDbXVkYpJhhHUwZ07e
 akTW5Jl0HYcPkliTihqi3hiMRFMmYmv4lWdaWygd8eKagdVwrXsa2xNFU
 VzuIH7K+mtVEd+FO7TVkpYFWdgvpbUPd1De+x4u1hBFP9dgfyGYfK1+Ym
 Z15Q3Tj7b85Bzh6Vlq9Ackzij0ZvbTy5JrqvzbiwjVAr5hIYfXRDmYyqF
 Nfrqmi1/RtUtQL5HFmGQmy1j/oqkuCrulsliKtFEk4Zgc0NMP4IYlpwuY g==;
X-CSE-ConnectionGUID: G2JZNS6QSQGfX8eXTbnb3A==
X-CSE-MsgGUID: +W4uz+kASUqbUiXTUhigOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="67031219"
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="67031219"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 09:46:40 -0800
X-CSE-ConnectionGUID: ZbMDxwX3Tyi+qrNIPvXRRQ==
X-CSE-MsgGUID: MRwnpUi8QTWqejgjd+QNDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="200482389"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 09:46:37 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 5 Dec 2025 09:46:36 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 5 Dec 2025 09:46:36 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.57) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 5 Dec 2025 09:46:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uFbWOsY/VGfsjl5SF9on0/xEUBF+IagSHFJ+Vpq4sBL4mVlD/c73s6W5Uv3EZD+0hHF2sDpLRIyfGnLEGb2v8sZrmlNp05YFrXDuxGG4AGOwhYKrkYH3GNXKL4oe6/RpfPIRWHEYlduDQFvGh0vGMOEuwzfsrVIki8rFq5mnUx1HOT76xqyd2s5Ayf7CPeq80CV0pXXqJ4Nod4vPnn7VFAYNsxULWv1pizHpTcRhM49a31F29Z5lFSvsf9Uf1eaLjNjk6T6dGLlWfxAVxXCbGYVIHNKMuk959QMEMzpMhoRpRTZsxqWQ1iUFvPO5aiHechY8b+urg0ANE6zFAMxb0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AP5tvpFbuBoVEwuX1CUHyi5L4X6jDolOxOsgCiGAkyk=;
 b=Gz/qR5rC5OsKMtRdWDHK7GsgmGLdk0ibPqdtoGtENqr+J2l8cq8rF+1Q8MYaaFMEEE0Rfx6/kqvZ6VekIEiCO/QH8DWjdIamHx9HIJ9+B1oAqkdGUYAp2VR5HOBawUP1X4de6tFpPg/r04h79YquOY+qklLETzdRwyN8WdAiUYkPqDMElN8Mixc3iipd74FZ126EbJp5fbSOmR98mwZRlACzj1Ls2QWn6sDCx9xq6Q1zh035LKD+zep1lD5ghSgT708DTnf4Q6kaAgCXhT/3qgwHF+O9pfIywX6KqzVA1o7ubND2vIKmMYpd+08QUMkP9Wo9BI/5BHC8h1Kmk9e4MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by DS0PR11MB6471.namprd11.prod.outlook.com (2603:10b6:8:c1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Fri, 5 Dec
 2025 17:46:34 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%5]) with mapi id 15.20.9388.011; Fri, 5 Dec 2025
 17:46:34 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>, Simon Richter
 <Simon.Richter@hogyros.de>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v3] drm/ttm: Avoid NULL pointer deref for evicted BOs
Thread-Topic: [PATCH v3] drm/ttm: Avoid NULL pointer deref for evicted BOs
Thread-Index: AQHcPFxDkaZBic7DYkWcAtqRX891ULTAQ7cAgFNgX0A=
Date: Fri, 5 Dec 2025 17:46:34 +0000
Message-ID: <DM4PR11MB5456F9CEB1B89BC3187E9B55EAA7A@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20251013160311.548207-1-Simon.Richter@hogyros.de>
 <20251013161241.709916-1-Simon.Richter@hogyros.de>
 <aO0oXPwaRa3RfmCU@lstrano-desk.jf.intel.com>
In-Reply-To: <aO0oXPwaRa3RfmCU@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|DS0PR11MB6471:EE_
x-ms-office365-filtering-correlation-id: 9e70bcde-a6a0-4b2e-b260-08de34263b59
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?uqqgQ4IRqluh7zTcDdFF5fyJ/r9IDw1u6pwyOK4yeDGAnPlRSQQqTfLCnmoI?=
 =?us-ascii?Q?ZG2wm0FGE7DRCwqClNWRKbhYkX8RYdCRvcXUv92ZxPgJfTbBpxNvvqn1x+Xa?=
 =?us-ascii?Q?5AECsu5q2q2eMGIiLBGiD5kr3xT5pzRpCblyIE0Dw3bx7XL7UNpeoB7vpXNH?=
 =?us-ascii?Q?wtg41sE1kG4m2/4EtSzqUggOIhJrjEmwwqpVfasv3jxeCA1MSnD0UR8grlkG?=
 =?us-ascii?Q?owTfltX6+FYKOpq0ZxXHDgITNlJnRTVMZVRIxu/p1cFMJCKKTbWNL4nlLIZH?=
 =?us-ascii?Q?TgckYAZ60uZI7O8HJgQxwPMd3/f9cE+c8yPfJiAe4Frs908BOAZEZGfmOUJq?=
 =?us-ascii?Q?uEI04UYvGxgy1luZtY4mIUAThdEMEMTjntPCcZlqWLo1sYdDMNqkqHinxvwO?=
 =?us-ascii?Q?69L9kXWYf2COO4lYcq8wbLSrPaKI1zGBIv/4ke2BR8bgZKj66gQjVRE+OciJ?=
 =?us-ascii?Q?zitmRQ26a4k1Gl9e4PeaAoJhuqQXxaZqTv3nxt73rnti2H6mT1uZSRpMOd/C?=
 =?us-ascii?Q?czr5a3IZT454soVF9lSs7O+B9iBYt9TcB9s+nlmE4KSx3hrAQ0A4hljk72+w?=
 =?us-ascii?Q?v+DMz+UCk3JRAc7wyTCrwQEhe/zL4MQrMOzzL4M7Sp9qGMFgOcT07UIIfEys?=
 =?us-ascii?Q?ysPbo81YbvzKzDtd/GouSQCkLz4i2vJQB+rmSyQwSWpWWeAR7dnMbo+JJGro?=
 =?us-ascii?Q?y4tAiQ65Pmk5823Nf4BaU/8ezVJabtJOiGOm+IatKZrgLvpHrQCcF41Uxoa+?=
 =?us-ascii?Q?aKfoThtU9B4gBD4tqB2Y5xI+raLMhmNwohYFL1y0NG1CImFNecyJjtdOw2+Y?=
 =?us-ascii?Q?p4xnWk4hf8rkdrD3ot5Z7K1roT7tL1Qt9vbcvdWIOYqsAhufigxh/yyfuf/D?=
 =?us-ascii?Q?oUQvmu5Fks4NM5CI3djnO1qQ2wyeKnFELoJKKI188th9mkSLq18tkG2Gx5xE?=
 =?us-ascii?Q?nPbubb7mgkj8CMgFUC/KRQiey7fmFLUQe6z4h2TL9NyWkkpPA41AKWluCms9?=
 =?us-ascii?Q?zZTjVSoAgGyNbR+3HziQIqNycpmTMVI7EphvZsXEZYcUAHfqRZj2kci+rf0J?=
 =?us-ascii?Q?82Ts0uE2BaWUyP2TtYZ53UXT8jRv+/F+B+xftYpCx+5YImC5k3h85oIgErVz?=
 =?us-ascii?Q?8Ka3GkOOeoanDGqnC+Z4Dpt/ldJq/uEJNKo2BW3g6nROwqOcH2ijBdrZDdUh?=
 =?us-ascii?Q?DXjbgCvNLQuBBw2XDzLbGLYqg6+I+h/0xCaIdGkk57O9qffBxDgs7w9+pe4u?=
 =?us-ascii?Q?nImbVVb+so78fiYRZLtOxvfQqH0c5uO1W+PAzHFisqIpAG6wOmjWLOLzIzd8?=
 =?us-ascii?Q?xM8wg8VCrJVPSN407QKzEawqac3XM5D0UD+mj9LKMO6N6fBTLXqyfI5JknRu?=
 =?us-ascii?Q?H/QxpOm1U5sUiPg4ub+LNim+RciWqtVIFdX8c2umUxI243oX1eYJHg2Ty56l?=
 =?us-ascii?Q?G/Jw5xsfgHlZ0FitWswCDf0jX79sEeNG6mrMTNHoYf1FgfxGYKQJmlqGYGqA?=
 =?us-ascii?Q?efqrLZ1WIbCDuO5SJKjmZuOP54sMfDZV6ev+?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?rmhO1X/IgDyPNDGH1YL+Hen5hJsLwMUIaoBsF3rShd3m5wTkR6Lq2CkBagi5?=
 =?us-ascii?Q?mP5ngOVKjF1jK1RpWUsCwUZKQ1xaxYT4upM+YUs47BfTUxND4bHa5Sce38ur?=
 =?us-ascii?Q?LqFDOB5pOJfWHlw44CN9BVFm1yt6ogSJCssE3feaPM2I7f1rrBRwwjBAciVo?=
 =?us-ascii?Q?a3KfSnT7WC5RmQxrNUx9el11Tdnvt1Y96n2xNxlJFgRIu3cxj8hET+Gc6a1k?=
 =?us-ascii?Q?6cQ+rRYsFA8FOchg2/JFwrHnTKrGdinAk/wv7+wEI1pORdRapwAhFQVbdplR?=
 =?us-ascii?Q?uCs4kvWlRQtBZWJT4ysZFBD6/Miwhh/poyqwlXgpxZRqNaxGYH37EMnc/CHg?=
 =?us-ascii?Q?mpr7fGx81TvtcMjnyxnUofkiQ7sWUoy6Z4CB3xYVLLiA0Ppq/ni49lVr/hKw?=
 =?us-ascii?Q?BjKLO/bIIttpI4ZIjx0WGnyNqJhAneDbVxQXji+3jSA7EDO9c8d1co01oljk?=
 =?us-ascii?Q?MzNABf/J6BDVzufOehxBxrqeZoQ6noMwW0I5/+hQUch56rhkcjNAFLqQyBPS?=
 =?us-ascii?Q?GkpNJZgAM7qm23AnLp+cFuRfAsM/0hLuahtoEMwhbrike/H7OGSqMkvXN7Kr?=
 =?us-ascii?Q?rB3rvjk4p5nnORhzqj7uz+gHS8+qAwWMrUZDO1BPFX4lf74Welcr3SlX+ykp?=
 =?us-ascii?Q?QrdE3L3n1mPIk9t++aOY2sOS91Gnd0zteII7ztJGOgIJriwiBEgYKHmpcl3m?=
 =?us-ascii?Q?QGMdysHrhCCUOcTo2EGbFDY23HHU0VilWl2MIQ3rR69msjm+z5xQxL3Ld+Wp?=
 =?us-ascii?Q?E/jIDUF5UD0Iw2L49k0cakZOAT3kdAZ5c3jZTtFDhPdhbOtN/T11Xlmjtyq+?=
 =?us-ascii?Q?aHEMcXsNSPSEtgdFsNWkDMqnPmmi6DpXNKeUdeo5eoU8m6kGg8Q/9v1Sx4Vf?=
 =?us-ascii?Q?+vsnt7GEi7moBct/XUJXbagGEKvYFyS1tB8fKlp5MStpycTIOkYfNE5BvZPP?=
 =?us-ascii?Q?AQ95Uo4cdXyeJfEsLJVpx8OCMi1jKYsz6w8B6XolP38EFitMl3ycQmYha5Lz?=
 =?us-ascii?Q?kOuDOrTQylPuJTdIs/4O3acs36RfIE2sBJP1yEEPzJTyabswEB0Vd3JtduY3?=
 =?us-ascii?Q?40RpvRbLk+5HioLf8n1SrKJqtqKyy7bolKoekAlD1qhNFdBQ2xXFKwssWf7b?=
 =?us-ascii?Q?YyTZtU5HkRFLU5cc6g2vUhtzAmFycOVZ/W0zE26RRhewfXdRX9hfPV/abQkB?=
 =?us-ascii?Q?trXeQ1onA/4AS2rqQH2iQFJk7bSlVSUzGWiE9lG7JeB3tdB74ZYvoq4k05Rv?=
 =?us-ascii?Q?MKISujAvaMbJY7twKx3QZUkjrxZuu7u3mfnwNfh5FUQSfw/v+Nmp53G+lZJA?=
 =?us-ascii?Q?HgLH0V5asPvgpCqvDiUg6oNqwQhQis+Hvu5K73ltlCj3XfTZG2xa1LIwvIB1?=
 =?us-ascii?Q?AEylOLHoRdIAxp7ajSp2Il9UF9Djx66kG3CWJDEOkrk2QuVtPJEAj/hfcShu?=
 =?us-ascii?Q?OSaMmntTDkP4zZqMSZi7PQq5j9B4n+MhWgpQNf0T1CugCgjX7jPnS+l+teg9?=
 =?us-ascii?Q?kAdcBZzfMpEVfaBtO5TmMJ2n73/VMaGG62w/WdTYSV2FpqxMF4qv9hA6TPtQ?=
 =?us-ascii?Q?k2RHX5MWkRjRs6vHIv34CkOPlQtLxkvOZPWO1Qkx?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e70bcde-a6a0-4b2e-b260-08de34263b59
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2025 17:46:34.1966 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XPVzeXIibdKIhFqsczpucneMalpcZvAEQLBKAMrJ6syil5mGvW1+XPp04zafsvN99SKa6QyzjXDs5D21d2g+qQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6471
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

On Mon, Oct 13, 2025 9:27 AM Matthew Brost wrote:
> On Tue, Oct 14, 2025 at 01:11:33AM +0900, Simon Richter wrote:
> > It is possible for a BO to exist that is not currently associated with
> > a resource, e.g. because it has been evicted.
> >
> > When devcoredump tries to read the contents of all BOs for dumping, we
> > need to expect this as well -- in this case, ENODATA is recorded
> > instead of the buffer contents.
> >
> > Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6271
>=20
> I think we need a fixes / cc stable but I can add that for you when mergi=
ng.
>=20
> Anyways patch LGTM:
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>=20
> > Signed-off-by: Simon Richter <Simon.Richter@hogyros.de>

It seems this patch is not merged yet.

LGTM.
Reviewed-by: Shuicheng Lin <shuicheng.lin@intel.com>

> > ---
> >  drivers/gpu/drm/ttm/ttm_bo_vm.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> > b/drivers/gpu/drm/ttm/ttm_bo_vm.c index b47020fca199..a101ff95b234
> > 100644
> > --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> > +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> > @@ -434,6 +434,11 @@ int ttm_bo_access(struct ttm_buffer_object *bo,
> unsigned long offset,
> >  	if (ret)
> >  		return ret;
> >
> > +	if (!bo->resource) {
> > +		ret =3D -ENODATA;
> > +		goto unlock;
> > +	}
> > +
> >  	switch (bo->resource->mem_type) {
> >  	case TTM_PL_SYSTEM:
> >  		fallthrough;
> > @@ -448,6 +453,7 @@ int ttm_bo_access(struct ttm_buffer_object *bo,
> unsigned long offset,
> >  			ret =3D -EIO;
> >  	}
> >
> > +unlock:
> >  	ttm_bo_unreserve(bo);
> >
> >  	return ret;
> > --
> > 2.47.3
> >
