Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E47D249283
	for <lists+dri-devel@lfdr.de>; Wed, 19 Aug 2020 03:47:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2F1889C86;
	Wed, 19 Aug 2020 01:47:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A5A689C86;
 Wed, 19 Aug 2020 01:47:04 +0000 (UTC)
IronPort-SDR: 1VHj2ybRwHByVBvOMSBuD4ILLwhSyawNVGr81oJqEfdYebG9bkmdM5oP4O6x1y6Q22mGxi0+HR
 jtyoEM71ClUQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9717"; a="155000838"
X-IronPort-AV: E=Sophos;i="5.76,329,1592895600"; d="scan'208";a="155000838"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2020 18:47:03 -0700
IronPort-SDR: KH2RVdt2iejNy3AkyJlTirjLf9hab7EpKGcIRsDYG+coLBThDXMsZ3dqvURZzHVYtRLXCgL65y
 O307qM0Tb5XQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,329,1592895600"; d="scan'208";a="441433311"
Received: from orsmsx606-2.jf.intel.com (HELO ORSMSX606.amr.corp.intel.com)
 ([10.22.229.86])
 by orsmga004.jf.intel.com with ESMTP; 18 Aug 2020 18:47:03 -0700
Received: from orsmsx606.amr.corp.intel.com (10.22.229.19) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 18 Aug 2020 18:47:03 -0700
Received: from orsmsx112.amr.corp.intel.com (10.22.240.13) by
 orsmsx606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 18 Aug 2020 18:47:03 -0700
Received: from ORSEDG001.ED.cps.intel.com (10.7.248.4) by
 ORSMSX112.amr.corp.intel.com (10.22.240.13) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 18 Aug 2020 18:47:02 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.102)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 18 Aug 2020 18:47:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GuuXFhEOPOOr1uSbrsszRa5wn6tSy9Wgd9qvEkZ9awDkDYX9XhR8CGstFyQg7Zw7gVc+AlLQ1mPfh0rQGvwe+VpKPBmZzDAFLALYu5SbYHDzRMEN5yAIOn06Q/MnDlegfEF4tzZCzpqhqQXrYZWvOwA5CqOClL+OkLhUelCbfJ/Urw+fVpOHYt2y2H4bvgeMLKaOg6jYShB0saVdRqYXbtQ94rRD7oTAfu1UJgeIEg9KG34fXWVKGMT89cqvG11jiF4RuTwtaUFm8NDL/xG7XYA5P7kptu6gHYGV5DxdV8f3Am2lGenunqpG6oom4jxXy1DfvgwFp8p0LNinBpDXSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cAbqQwwEHypudrERzB4STJZh7Ygufy6zfWlwGhX1jDY=;
 b=Ykg6OlIrUsv2VShBo0CYQY8bJ9FEsK9X5IvrU3A08rCVr3mBA611y4OP3SRL6FetIU49eaZlEHFu663ZpYJ98HWMdvhV8mvT1rjspAl+Me1B9gIhwpTexIYz9C5/vuU5WBM4hOowsz8+mDitcJcJsr+ePdwoWYaDevpZc+KnhmxVvCUNApUX+IuUWJeEuDjicOVkm9eMAL1/VXWDju+Ur3/Wb9xh3/wi17EnrDvcSQrN/U4DJu8TrCl4sFCvWijCuJ5+zR7M4+8iZj6xSb6NzK4gXY7xPBAFvolDGU+yflQ0rlgKp9zXl9oDkKHTLBxpfVx21Sn9gNE8e0VIS5R96A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cAbqQwwEHypudrERzB4STJZh7Ygufy6zfWlwGhX1jDY=;
 b=g/HO2w1OERxUETcfHIfdIKx9OkiniNWEPBAAT6axp+J4GzFwemiu6ZBcpgtsupCchuRDI2R3xLGzyBnCjmzDHw1pGT8NYVOhy+dOS0Zp8E6a46Or6gybaiWV/lviLjBpP0WvCCNm/JbGV8tBMKJ8FjIMFPhHwaZKbyvtnKQYrps=
Received: from MW3PR11MB4620.namprd11.prod.outlook.com (2603:10b6:303:54::14)
 by MW3PR11MB4620.namprd11.prod.outlook.com (2603:10b6:303:54::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.22; Wed, 19 Aug
 2020 01:47:01 +0000
Received: from MW3PR11MB4620.namprd11.prod.outlook.com
 ([fe80::81a7:b692:72d5:a525]) by MW3PR11MB4620.namprd11.prod.outlook.com
 ([fe80::81a7:b692:72d5:a525%9]) with mapi id 15.20.3283.028; Wed, 19 Aug 2020
 01:47:01 +0000
From: "Almahallawy, Khaled" <khaled.almahallawy@intel.com>
To: "Navare, Manasi D" <manasi.d.navare@intel.com>
Subject: Re: [PATCH v2 2/2] drm/i915/dp: TPS4 PHY test pattern compliance
 support
Thread-Topic: [PATCH v2 2/2] drm/i915/dp: TPS4 PHY test pattern compliance
 support
Thread-Index: AQHWYIlZJYRPjqtGJ0ehh+C5crW4yqk+jCoAgABIBQA=
Date: Wed, 19 Aug 2020 01:47:01 +0000
Message-ID: <4c7022eba9c664e0c9597acfc4ba363434546be0.camel@intel.com>
References: <20200723003627.31198-1-khaled.almahallawy@intel.com>
 <20200723003627.31198-2-khaled.almahallawy@intel.com>
 <20200818212908.GA4908@labuser-Z97X-UD5H>
In-Reply-To: <20200818212908.GA4908@labuser-Z97X-UD5H>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [134.134.137.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 92899f58-d54e-4838-bead-08d843e1c4a9
x-ms-traffictypediagnostic: MW3PR11MB4620:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MW3PR11MB462003A386A80972C0021B29895D0@MW3PR11MB4620.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: e8RV/f+UPbVmM2B3ymk7kgaRKcS++kaJlr1o6SR7OWQiVzhfz4wz1hddNeqLpGrwP13xA+0Shd11HPSxPes03xOwA2HHM/UppA1UR3AW6UO8lPQIbizuicdLVhfph9Hz3owT22AErKJm7hAChVbqwY8V2I4CcrMUOnqgyvY/LuuaZWYxjfcXzJZ6WRCjaks3VwLSAA5NOcp/h9HMwNT6+vFolovOH7jdqiji4FtY3ViTWsCpnhBLbzpi/xT6TZWOvlv7wgSMee0uNdQfeZh6HOWifJXBJzkzSfmxHvLDtfPi0PDWGDr26Ci3PBpggOK4BVf9KLPXkAGiyswylQFmIw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4620.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(376002)(39860400002)(136003)(396003)(478600001)(76116006)(450100002)(64756008)(71200400001)(107886003)(66476007)(66446008)(6636002)(36756003)(66556008)(6512007)(6862004)(86362001)(2906002)(8676002)(5660300002)(26005)(2616005)(4326008)(83380400001)(54906003)(8936002)(6486002)(316002)(6506007)(37006003)(66946007)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: KnN2yIl4ZUtqRoU4c3e57mk32UdgKCBPetyQl6+H92OykwUzCKFbyrNLOqOna012JnyybjuncNoPhGxvRq8zU/OMk3u8B/F95HYVI+UYMeC6j/7v0cipJSRgq0AkYmI32DLME21WCo/9UTlWgQHHvPwkk1kgEJyp/q92KqtYuYJlH7+9z3IpgJmndBUq372LGNlvN0Q1dFNVkOM77rnfCAXteHBPf15BXeCh+kP9T4uQLro2nR+391whhFZ8a1rO9dirrrAEBi2zN6A7/Mue4eD+Mal4pnzHzhvo8mnYC5cjk7BNMEKNSRAeVcbslUYZUCE0QzDBNmBFWZWXjOJnJSrmM98c6oCKExvSeH9SatqzCp8LmUQeCduZqVmPaUfn9VPSvvWd4F7pGL1tIPICiOUCAS0/xR20cWEAAGlv9lCOoPWQFhF6v56SFWJW7tuAzEu07syXuaMCXDJhLpstKDEjtla1fSYnsrREGbp9EckUPVVtdvIYzVUL1TRKfR0dt31rKhKB6t84gJJI8Epb4pRwYYD+9aWdO/AzmungA3y7C89lXnzFzzv3Ax9u/PBbZtOCpvyDC1hnK/PiCB5Tlcq+gtJq6TtKe+JXmyvIdjOQw4RFoi2motFAA+jgOa1penefxHcatSr/FSUlp/BH8w==
Content-ID: <1F08503A5738BD429F37FD1666142E16@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4620.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92899f58-d54e-4838-bead-08d843e1c4a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2020 01:47:01.7762 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +/cgskUTGH71Smi4rKa+0TCMMRbWCgxCddhpzM4H+zQsT9iRoc3JWxTgqMd7jiqRN7K2UFPH4Ta41j5wAuylqWWebWVH9oFKGT/zPTchMfc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4620
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Manna,
 Animesh" <animesh.manna@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2020-08-18 at 14:29 -0700, Navare, Manasi wrote:
> On Wed, Jul 22, 2020 at 05:36:27PM -0700, Khaled Almahallawy wrote:
> > Adding support for TPS4 (CP2520 Pattern 3) PHY pattern source
> > tests.
> > 
> > v2: uniform bit names TP4a/b/c (Manasi)
> > 
> > Signed-off-by: Khaled Almahallawy <khaled.almahallawy@intel.com>
> 
> Looks good to me,
> 
> Reviewed-by: Manasi Navare <manasi.d.navare@intel.com>
> 
> Khaled, could you also give a tested by here?
> 
> Manasi

Passed all TPS4 tests on DP Compliance scope with DPoC1.4a test
specification 

Tested-by: Khaled Almahallawy <khaled.almahallawy@intel.com>
> 
> > ---
> >  drivers/gpu/drm/i915/display/intel_dp.c | 14 ++++++++++++--
> >  drivers/gpu/drm/i915/i915_reg.h         |  4 ++++
> >  2 files changed, 16 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> > b/drivers/gpu/drm/i915/display/intel_dp.c
> > index d6295eb20b63..4b74b2ec5665 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> > @@ -5371,7 +5371,7 @@ static void
> > intel_dp_phy_pattern_update(struct intel_dp *intel_dp)
> >  			&intel_dp->compliance.test_data.phytest;
> >  	struct intel_crtc *crtc = to_intel_crtc(dig_port-
> > >base.base.crtc);
> >  	enum pipe pipe = crtc->pipe;
> > -	u32 pattern_val;
> > +	u32 pattern_val, dp_tp_ctl;
> >  
> >  	switch (data->phy_pattern) {
> >  	case DP_PHY_TEST_PATTERN_NONE:
> > @@ -5411,7 +5411,7 @@ static void
> > intel_dp_phy_pattern_update(struct intel_dp *intel_dp)
> >  			       DDI_DP_COMP_CTL_ENABLE |
> >  			       DDI_DP_COMP_CTL_CUSTOM80);
> >  		break;
> > -	case DP_PHY_TEST_PATTERN_CP2520:
> > +	case DP_PHY_TEST_PATTERN_CP2520_PAT1:
> >  		/*
> >  		 * FIXME: Ideally pattern should come from DPCD 0x24A.
> > As
> >  		 * current firmware of DPR-100 could not set it, so
> > hardcoding
> > @@ -5423,6 +5423,16 @@ static void
> > intel_dp_phy_pattern_update(struct intel_dp *intel_dp)
> >  			       DDI_DP_COMP_CTL_ENABLE |
> > DDI_DP_COMP_CTL_HBR2 |
> >  			       pattern_val);
> >  		break;
> > +		case DP_PHY_TEST_PATTERN_CP2520_PAT3:
> > +			DRM_DEBUG_KMS("Set TPS4 Phy Test Pattern\n");
> > +			intel_de_write(dev_priv, DDI_DP_COMP_CTL(pipe),
> > 0x0);
> > +			dp_tp_ctl = intel_de_read(dev_priv,
> > TGL_DP_TP_CTL(pipe));
> > +			dp_tp_ctl &= ~DP_TP_CTL_TRAIN_PAT4_SEL_MASK;
> > +			dp_tp_ctl |= DP_TP_CTL_TRAIN_PAT4_SEL_TP4a;
> > +			dp_tp_ctl &= ~DP_TP_CTL_LINK_TRAIN_MASK;
> > +			dp_tp_ctl |= DP_TP_CTL_LINK_TRAIN_PAT4;
> > +			intel_de_write(dev_priv, TGL_DP_TP_CTL(pipe),
> > dp_tp_ctl);
> > +			break;
> >  	default:
> >  		WARN(1, "Invalid Phy Test Pattern\n");
> >  	}
> > diff --git a/drivers/gpu/drm/i915/i915_reg.h
> > b/drivers/gpu/drm/i915/i915_reg.h
> > index a0d31f3bf634..c586595b9e76 100644
> > --- a/drivers/gpu/drm/i915/i915_reg.h
> > +++ b/drivers/gpu/drm/i915/i915_reg.h
> > @@ -9982,6 +9982,10 @@ enum skl_power_gate {
> >  #define  DP_TP_CTL_MODE_SST			(0 << 27)
> >  #define  DP_TP_CTL_MODE_MST			(1 << 27)
> >  #define  DP_TP_CTL_FORCE_ACT			(1 << 25)
> > +#define  DP_TP_CTL_TRAIN_PAT4_SEL_MASK		(3 << 19)
> > +#define  DP_TP_CTL_TRAIN_PAT4_SEL_TP4a		(0 << 19)
> > +#define  DP_TP_CTL_TRAIN_PAT4_SEL_TP4b		(1 << 19)
> > +#define  DP_TP_CTL_TRAIN_PAT4_SEL_TP4c		(2 << 19)
> >  #define  DP_TP_CTL_ENHANCED_FRAME_ENABLE	(1 << 18)
> >  #define  DP_TP_CTL_FDI_AUTOTRAIN		(1 << 15)
> >  #define  DP_TP_CTL_LINK_TRAIN_MASK		(7 << 8)
> > -- 
> > 2.17.1
> > 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
