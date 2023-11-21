Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 636137F25AA
	for <lists+dri-devel@lfdr.de>; Tue, 21 Nov 2023 07:15:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CBDF10E056;
	Tue, 21 Nov 2023 06:15:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A22A10E056;
 Tue, 21 Nov 2023 06:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700547352; x=1732083352;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9LhnAOxRySxrDgtrCQHw7WHtyMD7sw6RDdavUhgLvsw=;
 b=K7TYrrgGz7NCyqyoYF5NFl61Ax6cDtIylel1Mixz6bk9k249WLWYA2jk
 AGWQxAiOFo43zR24BhB75IJET/bCr4LG3nYKJa945iMCi5he9Qk4pglu3
 7G0KvqSBmyWIMgdgkwjdqwnyoyAbnlWmx7xFXPpN5cYIc6f60egpNPnLC
 UZjClTRu5Lf+HK7GI4zdPF0FOO94d7BL9Xj6MAmeJuuCaxFSt3JT5o5kX
 tkRXlY9fFhAu/aiv4StfxS/C8Yllb+o5aCw04PcEX8sTESxPoRU0QWwxu
 NK7WSkuaVE4aNf1+4Ti0aJef//vQsVbNokbiivew8DpZDAIoucUHOywaq w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="4895992"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="4895992"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2023 22:15:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="910356418"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; d="scan'208";a="910356418"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Nov 2023 22:15:51 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 20 Nov 2023 22:15:50 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 20 Nov 2023 22:15:50 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 20 Nov 2023 22:15:50 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 20 Nov 2023 22:15:49 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 20 Nov 2023 22:15:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VaBkB1wYYVKlluSjPjW+KMne8cW0uFNfNiC5c1yHVdreNhaST0rdrSUn/vTq8vIbZUoM9pZ5YfcM+WeNrg5JTvBFYouLWkgrwM/PPJvFkiZBoWKCI7JX7S4JvpxZ4LqK3seZDTiKpWNgtzVfMyAToMkVhmhZ7tVoG7CA+rlCdU1y2rgR7c7nRw9El1NNbkOIdQg8ioOBd5cgrTX5LkdQBTV0inPitMUrA+/Benp+980q6khJ9Qto8Ug/41U24vnIct3KkqkILS2s45m78UVOG/fFiJEbVSZgsjkuuybCspIh6C9cKx3AevLJTqraNWEQGTBEeMwHXti9zDWHlxYsfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6L/X/TUxc1y2KVoWE6c0TpYn1OpDvTWuicpfUPVZyyI=;
 b=fNeJ/S9xlQ6fYt7jULGYx5x95sRYwVXcqmn+6TPDK3KC/BqVjY4a5Ph3hizuq6ED0nzJSbnWDY5Gj5lOsKBjMU4nVmwTdpPRhobgMCmTRWuyerU5VGBW9AwZEDmBbp3n4VR1CZ3WVAPg0/IuUQ9twnkJ9FlwcJPzOYaJSN5Aj1OFsQRXwuceeMY+rkIHqQd4dpx7Yqrw7UQWft9B8QG6r5IKjwK2DF7Xx9SWUNRvcbcG09LpakpLj0cxi3ST7FLN1VJfyRantZjXcDyglGUd4H5V96PRIhnk2no4N8tMumy4WrtDZkvcND02ZZoLPXstH02+2Ezq8nn5HbklA9TRLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by PH0PR11MB5829.namprd11.prod.outlook.com (2603:10b6:510:140::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.26; Tue, 21 Nov
 2023 06:15:43 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::b5bf:a968:5f25:945]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::b5bf:a968:5f25:945%6]) with mapi id 15.20.7002.026; Tue, 21 Nov 2023
 06:15:43 +0000
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: =?iso-8859-1?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: RE: [PATCH 2/4] drm/i915: Adjust LUT rounding rules
Thread-Topic: [PATCH 2/4] drm/i915: Adjust LUT rounding rules
Thread-Index: AQHZ/ddLrsyoyDPVlE6Yho4Fu486/rCC9C1wgACLSQCAAQjH4A==
Date: Tue, 21 Nov 2023 06:15:42 +0000
Message-ID: <SJ1PR11MB61290C386437E6CC5130EF27B9BBA@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <20231013131402.24072-1-ville.syrjala@linux.intel.com>
 <20231013131402.24072-3-ville.syrjala@linux.intel.com>
 <SJ1PR11MB612921FEBAC75CFA6407F14CB9B4A@SJ1PR11MB6129.namprd11.prod.outlook.com>
 <ZVtsnsLQ22ImaiFz@intel.com>
In-Reply-To: <ZVtsnsLQ22ImaiFz@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|PH0PR11MB5829:EE_
x-ms-office365-filtering-correlation-id: 4f7fbe06-58b3-4317-0fa6-08dbea594aba
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /pWFobQ21ujUfATUZJGIqpqTFf+1veI5C5VfVf76SspUkgi6fLSMV40SfLspmR92ZHmIzW2c1w0/SpaAA+Qla8sxN5PTkA4Bb7atU+j8gVmxKswMUpz4XL8N8wIQm3VFQ3sQw1w6ko9K5/MzLJEC9X9fWSf5JImKyk7u+VXWN9h/NSdLLiPNt6s8yUSoHHqjxOkXYsFS3AgpO2JHLU8e9LJE9HIlwR5g5A/nnuKj2AYt/JkIe6punt/H2nzVcrI66p/S39yYSPYGvtx7Nxi45ZGoLG9CXOZ+hRGhqbmIhl7xilU10mXHb3HdvHhjQ2pcvevjHTiyZRuaPuvgSJZ9iyFPgWrm87nUJ3B+VIjVnmSXnlhqRI2TWSo8YIwFbPq2KBNcNOSKCoWx4BrnmivlI/mxEhBNAwhIJkKxDMfutpg1PtLuTDC4CQeRGPVWmkJW+++RqOGph9SPDR4KddSntAxqHY/WiYwHyzp8z64+m9StGMihYq59o2oNy1DlGgv/6pVwRPYoO4fqvryhtU+ZIRPlthBBCfx/jekkHn2IXsndQ4ShwIRI/8OUP8Nx6T61hW3aEoklVH5ZG2hoo4QBz92gN+uTU4FR2Uk3HDuTI1RBTBpRDLjbs6Lqb1ZZJPwK
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(376002)(396003)(366004)(136003)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(86362001)(5660300002)(2906002)(6916009)(76116006)(66476007)(64756008)(316002)(66446008)(54906003)(66946007)(66556008)(8676002)(8936002)(4326008)(52536014)(38070700009)(33656002)(41300700001)(478600001)(122000001)(26005)(82960400001)(53546011)(6506007)(7696005)(83380400001)(71200400001)(55016003)(38100700002)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?A8XUA5HGgkjk0ENN/unnNFfNaY3xNXERhQm/85nuoROyZaF6Bb0yECXi0J?=
 =?iso-8859-1?Q?3xQaUV7pmqacLqS86t6MmD7ZgW4LUee2+xhmUCnfpwYzE3UCdGMevTEbQ0?=
 =?iso-8859-1?Q?ZKwhgMSPuQau1azwLgYsg+WLiF6fXJ+zyph0GQG6TheRZvGjtLUsQEJgPY?=
 =?iso-8859-1?Q?V3ZFUx/rl+pXz4Lvrl+Ya4nzqRYxp9XZJRY7R+Ujl8/Wqt4ms14GFl4CWq?=
 =?iso-8859-1?Q?xrFLwL6ItXpMbKqjt+BYITsQuZYZZF5OM3qNBBPwGMo3N3lZmjcrSNHGfD?=
 =?iso-8859-1?Q?divrqaJGRnXMzhsJKCuSHwrQvYCy73nwffUtFvTut0Ej8Z4ZCmaknEOaJz?=
 =?iso-8859-1?Q?Ukq9JNOdmgiicBXqk20+0vIazRaFAw1KW1TXMWwcgM8qdQJPnd1xz8Utrx?=
 =?iso-8859-1?Q?gFti8puLLLditC1pmTol+qzD4OjGfncHwLViAQ2FCb2xgUVXFQtQuBwDgd?=
 =?iso-8859-1?Q?NF12e0bZrYz3EWO1ZfzIiYusWeoiuSXlSGN1LbxiOhKuOFIA4iyfmV6A48?=
 =?iso-8859-1?Q?lNKy3nDrNEiI/SaZN46Mk344BGTXmGc1DPO1kUpCTQXtlhGfVWdDtd5LkC?=
 =?iso-8859-1?Q?XQk4FlhSuYtiNmoMgg/m7yAvuJh5CPEXdKGlTo812akl9YogLL7Snsbsab?=
 =?iso-8859-1?Q?L4PTH1p4TvnMpqF2CavwodkI78GCasnO2fENhPMtjjX50A/tG+B3DDW1og?=
 =?iso-8859-1?Q?RGFnxSI4OhL6HLOmW+bBCtxEVjXZpvVB3OzR/i60KbScE1pNOCZKw9UXWZ?=
 =?iso-8859-1?Q?KmcXGBODqxEwFCPwUfLnR1FNN7L8JrFVlvTneRoVdqao7mlI5AhCMyYicD?=
 =?iso-8859-1?Q?nJanqE1joPCZrMnned/EDtfQ1D8F2CdvY1c4VVa+hdHlGY9ljIQ7CXmcSE?=
 =?iso-8859-1?Q?2O+/9j7A4y9Pmh3bgGgObmwrSdEE4r0IpLb5qGbzSg5ANowbBrTWWIL/3P?=
 =?iso-8859-1?Q?jb3CCqv8YDpvHTmR/F4K6KClOph0a88/H2mPH8jdAnsiQFzE+pxpHyBeNg?=
 =?iso-8859-1?Q?KK5j9NJnsPDvKHfMTGmgSWwM6/Arr4pEPFkSPAxTCVGacXDZVCgOs3braE?=
 =?iso-8859-1?Q?ckN42wZyOo+Ia9uokgf2CLEWY9h+XdUBLu/3FamdqNvhHpM/IBAQ5q1XNU?=
 =?iso-8859-1?Q?r0WIWkbRhJ+oRzBom1Wx9/MkbRzzEAQ+Hn+bqFDdgHy5LLJ80Iqgct/jpj?=
 =?iso-8859-1?Q?+EQYgPgsarm+lylN9beRmp7HP19wkCRoS5XAVSvP7e314BxGlIoDbA4Nte?=
 =?iso-8859-1?Q?tcpLhaBqihc4S18T6hY3rBxtXia+7yjgAHRRxITj0Jpc/g9jiQnTRzQ+dh?=
 =?iso-8859-1?Q?wyEA7EMcnIY4W9+WmVTG6Vf3NqT8fuDLtD7QWtJrE3pyK2Tonp1WcfrhNa?=
 =?iso-8859-1?Q?ltfsvOwC0DOYOQpDoIxLFo9Kt+0vp/IIRxpDeKA9TMKv/ZzH82aoFINges?=
 =?iso-8859-1?Q?2s0EJvl2KrlpgBP0wtBmIyeaKlNEo6VaKT6DCa9Xg39sLZnAaXf/kemwLm?=
 =?iso-8859-1?Q?vvryDKENa/jcYeihyJbNDvsvbJfKnVi2TFUezAAEDkbTb+3eDQnWAKAKkC?=
 =?iso-8859-1?Q?HrJHn/lPIEuYhDLuUeOKE3z1PXmqJnI1btFX4mCAv7bF40uhh0yrnCgPkB?=
 =?iso-8859-1?Q?iHAAR3ZWyXDyqg1F02J9nTcYTIEZMU8zXWailZro62dBpHfpKJJfBHrQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f7fbe06-58b3-4317-0fa6-08dbea594aba
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2023 06:15:42.9383 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TUuaC/FGFxhPUmr7kucCjKGAu9V6FqjkMCyjlHHlHwChlzgSQ5VO7T45/SSl6kCYV9o6MHaHC22VTI4kZLtOiDXg5Jx2e3nzVQnSwuFx0Ok=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5829
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


> -----Original Message-----
> From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Sent: Monday, November 20, 2023 7:57 PM
> To: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>
> Cc: intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> Subject: Re: [PATCH 2/4] drm/i915: Adjust LUT rounding rules
>=20
> On Mon, Nov 20, 2023 at 06:08:57AM +0000, Borah, Chaitanya Kumar wrote:
> > Hello Ville,
> >
> > > -----Original Message-----
> > > From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf
> > > Of Ville Syrjala
> > > Sent: Friday, October 13, 2023 6:44 PM
> > > To: intel-gfx@lists.freedesktop.org
> > > Cc: dri-devel@lists.freedesktop.org
> > > Subject: [PATCH 2/4] drm/i915: Adjust LUT rounding rules
> > >
> > > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > >
> > > drm_color_lut_extract() rounding was changed to follow the OpenGL
> > > int<-
> > > >float conversion rules. Adjust intel_color_lut_pack() to match.
> > >
> > > Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > > ---
> > >  drivers/gpu/drm/i915/display/intel_color.c | 14 ++++++--------
> > >  1 file changed, 6 insertions(+), 8 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/i915/display/intel_color.c
> > > b/drivers/gpu/drm/i915/display/intel_color.c
> > > index 2a2a163ea652..b01f463af861 100644
> > > --- a/drivers/gpu/drm/i915/display/intel_color.c
> > > +++ b/drivers/gpu/drm/i915/display/intel_color.c
> > > @@ -785,14 +785,12 @@ static void chv_assign_csc(struct
> > > intel_crtc_state
> > > *crtc_state)
> > >  /* convert hw value with given bit_precision to lut property val */
> > > static u32
> > > intel_color_lut_pack(u32 val, int bit_precision)  {
> >
> > Is this operation unique to Intel. Should there be a drm helper for thi=
s?
>=20
> If some other driver gains gamma readout support they could probably use
> something like this. The other option would be to rework the current help=
er
> to allow conversions both ways.
>=20

The function name could be a minor inconvenience but anyway until that time=
 arrives.

LGTM.

Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

> >
> > Regards
> >
> > Chaitanya
> >
> > > -	u32 max =3D 0xffff >> (16 - bit_precision);
> > > -
> > > -	val =3D clamp_val(val, 0, max);
> > > -
> > > -	if (bit_precision < 16)
> > > -		val <<=3D 16 - bit_precision;
> > > -
> > > -	return val;
> > > +	if (bit_precision > 16)
> > > +		return DIV_ROUND_CLOSEST_ULL(mul_u32_u32(val, (1 << 16)
> > > - 1),
> > > +					     (1 << bit_precision) - 1);
> > > +	else
> > > +		return DIV_ROUND_CLOSEST(val * ((1 << 16) - 1),
> > > +					 (1 << bit_precision) - 1);
> > >  }
> > >
> > >  static u32 i9xx_lut_8(const struct drm_color_lut *color)
> > > --
> > > 2.41.0
> >
>=20
> --
> Ville Syrj=E4l=E4
> Intel
