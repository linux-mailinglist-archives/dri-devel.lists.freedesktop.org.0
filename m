Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64ACD9A00E2
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 07:42:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C56C10E678;
	Wed, 16 Oct 2024 05:42:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UAwU9p6n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E170D10E162;
 Wed, 16 Oct 2024 05:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729057366; x=1760593366;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2O9d30RREqh8MQfut9i25d/eswLuCMH2nyYJCZQc29U=;
 b=UAwU9p6nqlHxNVko13mHtmP10uOquqwD/OFMSSH1ON2uar8Yy2rxSbw4
 E2MuNCDiMq66Hl8Fv/nxg47SsrUdkOagCks67QQxZrAUW2e2f7ZBFQJXb
 d3TwpIj0COMxV2DO7+HV1FsfvcliRSQFkwLWdYFxoQTreL5erYOr7lysa
 KLU1z+GJjzWOPpoyHzHDQrJGV+0ds8LQGRhoxl30hQaGK1zpN8rUIbpS1
 ZPh1B3hLriWhiQxChGUdgjWRIB1vgBgkDrCZ3wt1DRH+8OKXDAXJoSNEH
 yQm/aSnPcUIXIDODzvLG/ipqEwYMPVok8jIrnDiRq7S/wIpHRUgSkMmKn g==;
X-CSE-ConnectionGUID: Awx+wB5wR1moLgA3IVljoQ==
X-CSE-MsgGUID: sLg+8M8lQTWxQPic0xmnAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="51024454"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="51024454"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 22:42:45 -0700
X-CSE-ConnectionGUID: ItUuOGGdRrGmPWrp5b2yHw==
X-CSE-MsgGUID: /l3jXOlkQJ271Z0eMXebKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; d="scan'208";a="82676128"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Oct 2024 22:41:59 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 15 Oct 2024 22:41:59 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 15 Oct 2024 22:41:58 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 15 Oct 2024 22:41:58 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.49) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 15 Oct 2024 22:41:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uHagkRc1aj5CswEkmKGFKlv4GH664rojKbDvad4ihjgr0JqjiaQTa2p1wmRXWbk2208P0n8QCD25mSeScd6/WbCnBf7g3LKxbOIpNJ15/cqT6RiugeZOx8CJ2w24+lSsVjk4xQSulnq6wJcY9q2hsKw/lHWOUQeY4TzoFODsPsL9TghHhOiU0cEWj+bNG/VZ+irQNePN0ysi6wKczPa/hO/HMEYZfChyO/J4W7dhG3EalWPtPjv8s4OAZxaLmFKtF4mP46W00BA8RQhhDaXSs7fW2/COE/Dnq5qDb+JAHduZTxY5lJD0wAIt1IQ2J6Ws0+rmXMRa3VdyHanjIuY7yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v++bmupf9T3R/3eWrY+7D1OqVNLV4NoeqSLba2SuL2g=;
 b=DI8igx4BCLQQLovtgRZTP1rDAx91ggwVhkyW0wwF0jIl0srvQhnkH0XLf5R4JwH91mh2ELOQSOJ2OEFvGjJEnANnJl+S9echm8golithsaFhRYIaft97e8kQmNhXAy4+NJvUe+phNNIkGznzkEoTFSjuDd0rwc4cN5vkMBDJVEo3FrWw/Q+/TH9jJowHAt4U597MYXAElPh3mXNEf+nE74OyI2zc1mOEMVjMqiEBxwV6J8YyuFWFw40SC3KF1pN/nyQiDm5yXwDsYhjBuUYyPfzNM2vWQB1hdwC9d7SkG1d80OKX9oi5f+cgjQYvLcDYuJwAzbcVCBvJRtLglYJkvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by IA1PR11MB7247.namprd11.prod.outlook.com (2603:10b6:208:42d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Wed, 16 Oct
 2024 05:41:56 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%5]) with mapi id 15.20.8048.020; Wed, 16 Oct 2024
 05:41:56 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v1 4/5] drm/xe/bo: Create a new sg for dmabuf BOs that are
 associated with a VF
Thread-Topic: [PATCH v1 4/5] drm/xe/bo: Create a new sg for dmabuf BOs that
 are associated with a VF
Thread-Index: AQHbHFQ0CwkUX5HJJUOXCRB2saY+p7KCgqMAgAYGc5A=
Date: Wed, 16 Oct 2024 05:41:56 +0000
Message-ID: <IA0PR11MB71853C7F2EB0A6677892FC3FF8462@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20241012024524.1377836-1-vivek.kasireddy@intel.com>
 <20241012024524.1377836-5-vivek.kasireddy@intel.com>
 <Zwn4WOBAzhAs9wIW@DUT025-TGLU.fm.intel.com>
In-Reply-To: <Zwn4WOBAzhAs9wIW@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|IA1PR11MB7247:EE_
x-ms-office365-filtering-correlation-id: 851fb817-e4a8-4847-1b25-08dceda53efa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?BQtcNRSB33AhlsGPqrmZeZkftKeQ8yiOj+ZR+oPoiyl7XbM0XnP3tfY5PUC1?=
 =?us-ascii?Q?wAlMu5pYKbf6BWv6lSr4e4IIfsluI/Nrcp039yX8oCXA3aETMFX/jsY5u5Lv?=
 =?us-ascii?Q?3ITWx2viy7X6uUUVVwVboxlGxDTnRurda/nPF1BBM96OTHki4U9BJAT2ouNv?=
 =?us-ascii?Q?2fm8j2OBf+Foo+C1cytHu5tPZo8uuTfTOvvsdoCDRK7cdnvPHhmJeHYO0yvf?=
 =?us-ascii?Q?4sAsfyk9C76UCscD54o967O+2dp5Efl1isqxDC7XGDYRyXnB/cWvc5OzEMlP?=
 =?us-ascii?Q?YHOvhUDQdXWZM9l7c5gVEfknEdr4HlVCFX7MY5aDk6ySRpE+8NM6OHF4leuh?=
 =?us-ascii?Q?FMhgfTQJpp1rGFteZpB7nb/R96Ly0PGEjOLUIHynd3qt3lY9iKTyjUnft58e?=
 =?us-ascii?Q?tUqGD+wDv6DREI84uvar5LrDqhy4sm30sD0Xkd/1+fPFR4l1O2cvau6YuAE8?=
 =?us-ascii?Q?Jh82NlwY5GmLcB6XSb9u514vzkjuEWCV0p/nBtaOzt8Dd0/Z5OvsaAgUd5WK?=
 =?us-ascii?Q?3I4Z1wO8EsoHdiAacvO1y2rOhhxpiTVK+HPt/5NVmF0kXvm0AoFWMlkUtCOa?=
 =?us-ascii?Q?YtgtxUeQ21owTbseZN6g++ObyVuJ/Hs7Y2hh8LAALPdDMCjILgCV2aY4DZ2u?=
 =?us-ascii?Q?z/RwOl8AcnO3nZvlIhCjaajbuNMjtxDtwsezeyeD4/EmOgn12q/Mc8w61D58?=
 =?us-ascii?Q?XCUXH9J2Y92y6eFpSjOBP+Rx8WEfrJ8oH6gBDpsvLjjvXHVA/6oww1tXEk9X?=
 =?us-ascii?Q?I1P60yvvEZFJ7B2NwB070WLj+0jaVaKbgu2bgZcn245rxS4GCZ8FFq8Rswha?=
 =?us-ascii?Q?kwEBZMb/2ViyjT2Yf/GXPi1zgs5ZAfVVlZ9FGwDfz+MqCBab9oq6K2hzf8m5?=
 =?us-ascii?Q?/feRGusLFI/rI10dU991F2F2CHICjltBaYMrul4bI9U+NIsTS8q0wujJUvOG?=
 =?us-ascii?Q?KME0NLo5bW+eObnMK65CXiFys/knJNxrqZWPm6H5H+hRH6tNqfGGeKzHUpUy?=
 =?us-ascii?Q?7pl4M3A6w/UQGI5N1ilVxGELuF1x/U8tGfVLkGCoaJCivoBm71pIMJAF121k?=
 =?us-ascii?Q?cGXeMB65+y/ZoBAC4ls2pt37ifJCXfNqKRkMLRrXiFJZzGAb2Mc2Dx8TkP6Y?=
 =?us-ascii?Q?UEA8dyuMeKSd1c5eea0mxN9tYVUFuTbOBkS0oFUSEBGriR0hPfzqor62q5jz?=
 =?us-ascii?Q?qAYNNFMFH4c/R3znw5Z+EgM/rkIDNXyFmCcyRgTvq5JrmHKO+hH0i5wFABq0?=
 =?us-ascii?Q?UJnyguiMoY4HHo8HaAOSzlEE5C7wWoto3hvY9WOHlWRGIlLJEmRniZX73S1P?=
 =?us-ascii?Q?BtQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?aoRK8dqRTlVnCAr2ZzhNGtdFwmcJ0z5enSaJ26HEd03I5SOI8LNPNzHVLthl?=
 =?us-ascii?Q?WBr+ZqhvV+yvBc5qlp66EyzZEEB+1n1W1LEpCaNeMwOpQQ1oktGk2/bvahMC?=
 =?us-ascii?Q?VpWy1qJtbatdtxf9FfiIZL2I3DvwEMQPufnLDNOQg4oCm2umzKPZRUglk/DK?=
 =?us-ascii?Q?zNwtWH4HLq70whw9TLd+03ZkKZDS69uEKJWTXweV58euxaErInFmv9VDiJMV?=
 =?us-ascii?Q?QNgpBhB3Xl/K4A92G9LFN5tFtEPOKmKuVx2IXsJM/HtH3M3eD+uTD4q63NQx?=
 =?us-ascii?Q?ICAvbajrGtOfqfrUm0zLUQDR2jvZCQJKs7Yrni598kV6YLND+Iv7JPld2DnL?=
 =?us-ascii?Q?o8bqyRVe+k5C0FmP5ehtvR22vNiThld8ibSa1k6YNIE3bidQgi12Y7wnNKlQ?=
 =?us-ascii?Q?VpJbZVsK6KikKzO7oJIfVtsS/QnpaUM91y/S3mvlxEyhVs+kU2TOXqsAT+ak?=
 =?us-ascii?Q?kq5Vua4a6sBXrw7qdbhqjjK4PrySIkvfu35FGwUNLdxL91Z3PlCINaRNTSZk?=
 =?us-ascii?Q?UWCkUviDbNwD5IgFvi1Crl2ZbalmTnVeo8cbn+wvDX1Q7kQ8dedIa/4T6kaB?=
 =?us-ascii?Q?pakCAhKjJSIETv6wPMoO8YoZmKE0YFsWN9BDv3XUqPKHZbrQu5XpCL2d2KFg?=
 =?us-ascii?Q?KQj3uvWF++B8mLkBR5Nw0LHnmhPPucLi1DYqoU4agrGJpyrHhHtfIuJL5lYW?=
 =?us-ascii?Q?UiBDgz5ioDuHrYfphwejOp1ydgCnRKg6ORYq45ZosAlCPLBu+i7Vn0APMznj?=
 =?us-ascii?Q?JQkBu97GVgHifDK7zMqEtWZLt1Js1uR3o0kVS8U/ZznEhzwnjzC9rqvnSPtm?=
 =?us-ascii?Q?oxmDm1rCdbMAqKjpLLlu70MX5gFtv4vt96Of9U0v8HKkTRb53DOD2p59n+v8?=
 =?us-ascii?Q?HxtaWaZxjtcu0/Eqmi3Ni2CXSSwEsuuXDXFZNP9/2sYEw59wy/iG0/knZ16P?=
 =?us-ascii?Q?Dv2inKzp+txrDnC31ZBlPOPOFL6m34HMNpGwVAiatEHZ536y55Ijbn/+3X+P?=
 =?us-ascii?Q?QlrR9SI9dLqRevZRce3icNo7yl+9D4OBUD+T2Wyk1yqPnK6q1UUb4e26xiNV?=
 =?us-ascii?Q?9yWwSbTODuR2+5gOXw/bTgbOE1NoXWheYmYQ8QtDbI9zbIloR58bqotSSIIh?=
 =?us-ascii?Q?t/pIuzZCHqUSd+wXj8d5S4IZ+pGJwIT9sZWpYT1QCPeQZ0jLgNvFPT+iCheT?=
 =?us-ascii?Q?FmzsZ8sMtax/DUlXoS/fT7dzSHFWgzNfLkPxU0F0z+d4sqMcBYTumenKGZ2a?=
 =?us-ascii?Q?L/q9JeYVA36Piw+HieFlf0lu8rI4fEzymqYRcDF5fU5u+zJfYz0xK+YDFG9C?=
 =?us-ascii?Q?uZuxVseukgE16NgUuH+YTzpdLUjqQaVjGUPZ1OBCWKJ1gdO7hHiVV3k8mOCU?=
 =?us-ascii?Q?P/p9eKIbK3cfIxZXWnWcWxCSE5d+gSdSrrx/YqawhQ1PwgPjWctvUFWTY/Zp?=
 =?us-ascii?Q?y4wnkdK9THqU72XwAoHG3WAA1sAEV0+Wq5TXzrNRc39cEsMCdiavXmPsUe+F?=
 =?us-ascii?Q?OtsENLbYQFhjgDJilVVjPPmkYagj8pHIWTMEnQLF7LSkBPoubfVQqLjuAyNN?=
 =?us-ascii?Q?lMbKgYw6qNMHXQS0Lzq204gMIEPgzYUY4vw//cic?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 851fb817-e4a8-4847-1b25-08dceda53efa
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2024 05:41:56.1352 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3dweiCGGAoogEagJKiNmHg4yBwev2/n5A100DGZo94LABaZKXmBHv5J6+/FJYwr+KC8Q3HKhvwGWeOs8DZKiHVGBx7YIDvOx2wysA4T4UGo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7247
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

Hi Matt,

>=20
> On Fri, Oct 11, 2024 at 07:40:26PM -0700, Vivek Kasireddy wrote:
> > For BOs of type ttm_bo_type_sg, that are backed by PCI BAR addresses
> > associated with a VF, we need to adjust and translate these addresses
> > to LMEM addresses to make the BOs usable by the PF. Otherwise, the BOs
> > (i.e, PCI BAR addresses) are only accessible by the CPU and not by
> > the GPU.
> >
> > In order to do the above, we first need to identify if the DMA addresse=
s
> > associated with an imported BO (type ttm_bo_type_sg) belong to System
> > RAM or a VF or other PCI device. After we confirm that they belong to
> > a VF, we convert the DMA addresses (IOVAs in this case) to DPAs and
> > create a new sg and populate it with the new addresses.
>=20
> I think using a SG list is a no-go. We have received pushback before [1]
> about using a SG list as structure to hold DPA rather than dma-address.
> The consensus was a SG list is not a generic structure to hold any
> address [2], rather a specific structure for dma addressess.
AFAIU, that would make sense if the SG list was exposed outside of the Xe
driver but the SG list that is created by this patch is only used internall=
y by
the Xe driver. Would this still not be acceptable?

>=20
> I'm pretty sure we will have define a new BO type (ttm_bo_type_devmem?)
> and structure that can iterated on if we want to do something like this
> unless we want to ignore the above feedback.
Right, if using SG list is a no-go, then using some form of xe_res_cursor t=
o
iterate seems like the only other option.

>=20
> [1] https://patchwork.freedesktop.org/patch/574894/?series=3D128910&rev=
=3D1
> [2]
> https://patchwork.freedesktop.org/patch/574894/?series=3D128910&rev=3D1#c=
o
> mment_1070889
>=20
> >
> > Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_bo.c       | 108
> ++++++++++++++++++++++++++++++-
> >  drivers/gpu/drm/xe/xe_bo_types.h |   6 ++
> >  2 files changed, 113 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > index c74c121ea7bb..64efe1b21f19 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -6,6 +6,7 @@
> >  #include "xe_bo.h"
> >
> >  #include <linux/dma-buf.h>
> > +#include <linux/iommu.h>
> >
> >  #include <drm/drm_drv.h>
> >  #include <drm/drm_gem_ttm_helper.h>
> > @@ -15,16 +16,19 @@
> >  #include <drm/ttm/ttm_tt.h>
> >  #include <uapi/drm/xe_drm.h>
> >
> > +#include "regs/xe_bars.h"
> >  #include "xe_device.h"
> >  #include "xe_dma_buf.h"
> >  #include "xe_drm_client.h"
> >  #include "xe_ggtt.h"
> >  #include "xe_gt.h"
> > +#include "xe_gt_sriov_pf_config.h"
> >  #include "xe_map.h"
> >  #include "xe_migrate.h"
> >  #include "xe_pm.h"
> >  #include "xe_preempt_fence.h"
> >  #include "xe_res_cursor.h"
> > +#include "xe_sriov_pf_helpers.h"
> >  #include "xe_trace_bo.h"
> >  #include "xe_ttm_stolen_mgr.h"
> >  #include "xe_vm.h"
> > @@ -543,6 +547,102 @@ static int xe_bo_trigger_rebind(struct xe_device
> *xe, struct xe_bo *bo,
> >  	return ret;
> >  }
> >
> > +static struct pci_dev *xe_find_vf_dev(struct xe_device *xe,
> > +				      phys_addr_t phys)
> > +{
> > +	struct pci_dev *pdev, *pf_pdev =3D to_pci_dev(xe->drm.dev);
> > +	resource_size_t io_start, io_size;
> > +
> > +	list_for_each_entry(pdev, &pf_pdev->bus->devices, bus_list) {
> > +		if (pdev->is_physfn)
> > +			continue;
> > +
> > +		io_start =3D pci_resource_start(pdev, LMEM_BAR);
> > +		io_size =3D pci_resource_len(pdev, LMEM_BAR);
> > +
> > +		if (phys >=3D io_start &&
> > +		    phys < (io_start + io_size - PAGE_SIZE))
> > +			return pdev;
> > +	}
> > +	return NULL;
> > +}
> > +
> > +
> > +static void xe_bo_translate_iova_to_dpa(struct xe_device *xe,
> > +					struct sg_table *sg,
> > +					struct sg_table *new_sg,
> > +					struct pci_dev *pdev)
> > +{
> > +	resource_size_t io_start =3D pci_resource_start(pdev, LMEM_BAR);
> > +	struct xe_gt *gt =3D xe_root_mmio_gt(xe);
> > +	struct scatterlist *sgl, *new_sgl;
> > +	int i, vfid =3D pci_iov_vf_id(pdev);
> > +	dma_addr_t new_addr, bo_addr;
> > +	struct iommu_domain *domain;
> > +	phys_addr_t phys;
> > +	u64 offset;
> > +
> > +	bo_addr =3D xe_gt_sriov_pf_config_get_lmem_addr(gt, ++vfid);
> > +	domain =3D iommu_get_domain_for_dev(xe->drm.dev);
> > +
> > +	new_sgl =3D new_sg->sgl;
> > +	for_each_sgtable_dma_sg(sg, sgl, i) {
>=20
> I'm pretty sure this doesn't work if a single dma address of the input
> 'sg' resolves to a non-contiguous physical DPA. In most cases this is
> going to be contiguous though unless there is memory pressure or
> unaligned allocations sizes. Assuming your testing didn't blow up, you
> may not have hit a memory pressure situation where VRAM gets
> fragmented.
Yeah, I did not test exhaustively and also did not realize that that the BO
(config->lmem_obj) backing the VF's lmem quota may not be contiguous.
I'll try to figure out a way to test this scenario. However, for each SG en=
try,
if I do something like:

offset =3D phys - io_start;
new_addr =3D xe_bo_addr(config->lmem_obj, offset, sg_dma_len(sgl));

instead of

bo_addr =3D xe_bo_addr(config->lmem_obj, 0, PAGE_SIZE);
offset =3D phys - io_start;
new_addr =3D bo_addr + offset;

I believe this would probably work as expected even when lmem_obj is not
contiguous (as it probes the buddy blocks) or if input SG has non-contiguou=
s
physical (DPA) ranges.

>=20
> I think only iommu_iova_to_phys is accurate for exactly 1 page unless
> I'm missing something. See [3].
IIUC, it seems to be valid for the segment of size sg_dma_len(sgl), for a g=
iven
SG entry.

Thanks,
Vivek

>=20
> [3]
> https://elixir.bootlin.com/linux/v6.11.3/source/drivers/iommu/iommu.c#L2
> 376
>=20
> Matt
>=20
> > +		phys =3D domain ? iommu_iova_to_phys(domain,
> sg_dma_address(sgl)) :
> > +			sg_dma_address(sgl);
> > +		offset =3D phys - io_start;
> > +		new_addr =3D bo_addr + offset;
> > +
> > +		sg_set_page(new_sgl, NULL, sg_dma_len(sgl), 0);
> > +		sg_dma_address(new_sgl) =3D new_addr;
> > +		sg_dma_len(new_sgl) =3D sg_dma_len(sgl);
> > +
> > +		new_sgl =3D sg_next(new_sgl);
> > +	}
> > +}
> > +
> > +static struct sg_table *xe_bo_create_new_sg(struct sg_table *sg,
> > +					    struct xe_bo *bo)
> > +{
> > +	struct xe_device *xe =3D xe_bo_device(bo);
> > +	struct iommu_domain *domain;
> > +	struct sg_table *new_sg;
> > +	struct pci_dev *pdev;
> > +	phys_addr_t phys;
> > +	int vfid;
> > +
> > +	if (!IS_SRIOV_PF(xe))
> > +		return sg;
> > +
> > +	domain =3D iommu_get_domain_for_dev(xe->drm.dev);
> > +	phys =3D domain ? iommu_iova_to_phys(domain, sg_dma_address(sg-
> >sgl)) :
> > +		sg_dma_address(sg->sgl);
> > +
> > +	if (page_is_ram(PFN_DOWN(phys)))
> > +		return sg;
> > +
> > +	pdev =3D xe_find_vf_dev(xe, phys);
> > +	if (!pdev)
> > +		return sg;
> > +
> > +	vfid =3D pci_iov_vf_id(pdev);
> > +	if (vfid < 0)
> > +		return sg;
> > +
> > +	new_sg =3D kzalloc(sizeof(*new_sg), GFP_KERNEL);
> > +	if (!new_sg)
> > +		return sg;
> > +
> > +	if (sg_alloc_table(new_sg, sg->nents, GFP_KERNEL)) {
> > +		kfree(new_sg);
> > +		return sg;
> > +	}
> > +
> > +	bo->is_devmem_external =3D true;
> > +	xe_bo_translate_iova_to_dpa(xe, sg, new_sg, pdev);
> > +
> > +	return new_sg;
> > +}
> > +
> >  /*
> >   * The dma-buf map_attachment() / unmap_attachment() is hooked up
> here.
> >   * Note that unmapping the attachment is deferred to the next
> > @@ -577,7 +677,7 @@ static int xe_bo_move_dmabuf(struct
> ttm_buffer_object *ttm_bo,
> >  		return PTR_ERR(sg);
> >
> >  	ttm_bo->sg =3D sg;
> > -	xe_tt->sg =3D sg;
> > +	xe_tt->sg =3D xe_bo_create_new_sg(sg, ttm_to_xe_bo(ttm_bo));
> >
> >  out:
> >  	ttm_bo_move_null(ttm_bo, new_res);
> > @@ -1066,6 +1166,8 @@ static void xe_ttm_bo_release_notify(struct
> ttm_buffer_object *ttm_bo)
> >
> >  static void xe_ttm_bo_delete_mem_notify(struct ttm_buffer_object
> *ttm_bo)
> >  {
> > +	struct xe_bo *bo =3D ttm_to_xe_bo(ttm_bo);
> > +
> >  	if (!xe_bo_is_xe_bo(ttm_bo))
> >  		return;
> >
> > @@ -1079,6 +1181,10 @@ static void
> xe_ttm_bo_delete_mem_notify(struct ttm_buffer_object *ttm_bo)
> >
> >  		dma_buf_unmap_attachment(ttm_bo->base.import_attach,
> ttm_bo->sg,
> >  					 DMA_BIDIRECTIONAL);
> > +		if (bo->is_devmem_external && xe_tt->sg !=3D ttm_bo->sg) {
> > +			sg_free_table(xe_tt->sg);
> > +			kfree(xe_tt->sg);
> > +		}
> >  		ttm_bo->sg =3D NULL;
> >  		xe_tt->sg =3D NULL;
> >  	}
> > diff --git a/drivers/gpu/drm/xe/xe_bo_types.h
> b/drivers/gpu/drm/xe/xe_bo_types.h
> > index 8b9201775081..0fe619bc436d 100644
> > --- a/drivers/gpu/drm/xe/xe_bo_types.h
> > +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> > @@ -67,6 +67,12 @@ struct xe_bo {
> >  	/** @ccs_cleared */
> >  	bool ccs_cleared;
> >
> > +	/**
> > +	 * @is_devmem_external: Whether this BO is an imported dma-buf
> that
> > +	 * has a backing store in VRAM.
> > +	 */
> > +	bool is_devmem_external;
> > +
> >  	/**
> >  	 * @cpu_caching: CPU caching mode. Currently only used for
> userspace
> >  	 * objects. Exceptions are system memory on DGFX, which is always
> > --
> > 2.45.1
> >
