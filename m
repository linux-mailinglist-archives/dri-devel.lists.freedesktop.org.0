Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7075A8A5FB
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 19:48:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD26110E135;
	Tue, 15 Apr 2025 17:48:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m04FR/3Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C39110E027;
 Tue, 15 Apr 2025 17:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744739289; x=1776275289;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lndjNCWXWn/VNrbFuiIGDv9bNfvU+SaN3ubn3HMEeYw=;
 b=m04FR/3QgkoKY+/C/S9b48EYLRG5r4QtbrsYq0Xlkpar/1HEuvAdPUQD
 U1wMBAqWl8Vad7Ez84a3o5NB1xSGo4Vioe5U6FojNGsmRh9fevC7kXSV8
 Q4m8bEH/+Ebvhni/lCPP2fGKjc5PjKhAtGHVKch6CTpXdCgtpk48UNIgo
 z3L+97hVbkaWjMP6TolpC7Rmvfr8d1VqLRYix9Ul4UuLF5mCg6dm7188B
 /8E9qtT7odtP8ilDKKw+FM3B1YCW/A3eZ6shz50QryYaSd6IR6RR5pPnB
 Mzq23HHeIpsZFK50VnWWKBsfFv1ln0PnzKJXN4kabnW4YLGS/hm+9+mfQ A==;
X-CSE-ConnectionGUID: YLrGG89fSj+2TLNXZMi0GA==
X-CSE-MsgGUID: gb+Dmn98Tjq8WvFQVwH8fg==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="56899845"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="56899845"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 10:48:09 -0700
X-CSE-ConnectionGUID: Usj9nwouQ/GsBOKN12QQbg==
X-CSE-MsgGUID: X4Pdo+k6S4ytWlxjWBXrmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="131086776"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 10:48:09 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 15 Apr 2025 10:48:08 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 15 Apr 2025 10:48:08 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 15 Apr 2025 10:48:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LRdrtj7u6diXo4GkkiUbYNS1aYJcgU4HZLbKkCcM0+bR8dnXvAxnEFYIeUPvMZxD518gTDwQvczwX3nrYWLqNR2q3BsYL/Z93bD+a/+T34O6BxL0iGVqS8+4KKK+SUmGGBQYhnFpAnkXhU/dqq2B+n7cdiNkuVzi1VWpXzHQ7ugawvC/5PCs10UzFXrub0aPIDY7iK8SD89OifMb5IB8Z0+2Eofeu2JEU/XcsFz+m/RE5+qdScrqEvcl2aXdzuCXUlEO5W8QX8807/G8zCYtSH1yHcWybqQ0UzkpW2TJRddSsWeXJnfcmNxupJQpXZcOU0GhoW2Gqkj9tpZzJx0dqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2M/9TfJJ8jXtWSOYkPRvZpRS29UaDfYXdKaanqtNXjI=;
 b=odtv/Dsz4Q6XyqaDE7ADTyLnN0/CNteFmLDrUoApmzmQIMy2ysIyUrsMiXo7pGwMEcrJ8nLslbi+JePeiU4wevNWfnS9JvOgjorRl7lyPxoIeMOqziR9e+6EGIVevDwhIBnE/5UGVOkOQA/QRIF7nF8TyE9xatvoWLLXXgLxnOgNSbhE10qapzSu0Hx5SIQin3PnWfIwATJWGRiVgfU9czk7137lSocJ3pfav2iOw9M+WQxovFOev/wuhkFiSIe6QPydj8PCGaSKiWEm3YrwKaLNHUkh6Ei8SAA8MTfCtH/CrFKlSugL335Mv9zRKXhGNqnFJ+IWdyt/WMl8AG/lKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6278.namprd11.prod.outlook.com (2603:10b6:208:3c2::8)
 by MW4PR11MB6569.namprd11.prod.outlook.com (2603:10b6:303:1e1::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Tue, 15 Apr
 2025 17:47:52 +0000
Received: from MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2]) by MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2%3]) with mapi id 15.20.8632.030; Tue, 15 Apr 2025
 17:47:52 +0000
From: "Chegondi, Harish" <harish.chegondi@intel.com>
To: Kees Cook <kees@kernel.org>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Dixit, 
 Ashutosh" <ashutosh.dixit@intel.com>, "Ausmus, James"
 <james.ausmus@intel.com>, "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v12 2/8] drm/xe/uapi: Introduce API for EU stall sampling
Thread-Topic: [PATCH v12 2/8] drm/xe/uapi: Introduce API for EU stall sampling
Thread-Index: AQHbh/BlSQ7onnoAeU+W9llBPP5F+bOUBaMAgBFDPxA=
Date: Tue, 15 Apr 2025 17:47:52 +0000
Message-ID: <MN0PR11MB627872357EF6E75F135B580BEDB22@MN0PR11MB6278.namprd11.prod.outlook.com>
References: <cover.1740533885.git.harish.chegondi@intel.com>
 <bb707a27975c33e4a912b9839b023acb7a1f9c90.1740533885.git.harish.chegondi@intel.com>
 <202504041051.CF3111DD@keescook>
In-Reply-To: <202504041051.CF3111DD@keescook>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB6278:EE_|MW4PR11MB6569:EE_
x-ms-office365-filtering-correlation-id: 54731e5b-99d3-4742-379c-08dd7c45a546
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?MKF21HWQNFUIcdp6XTgKyW1BeqiosuAzLgN+1OY2z1pP8eOC5EsuPkCQQ0cK?=
 =?us-ascii?Q?hYHBMgW90ZV1rp/WVJCBkgqKWv9k8Mdj+PB2V01N7K5aqUpPfukttn5E4HhD?=
 =?us-ascii?Q?U0cXBvbuJTDvnxsgCBofU4XDfahUzvmwf85fX6wGW53hAj2j/JN0XGJqHHOD?=
 =?us-ascii?Q?MDLStEGWfpowwrC9oAsDETr6k1EwqcqysnE+0rvqws7V25oPohgL6OKd3HHT?=
 =?us-ascii?Q?egiCS1iwXfuYwZAHZGJYOG6qMGyayFb7uaGmEXGIM+AiCRTwpxdJgTHbdipb?=
 =?us-ascii?Q?IOYVBWKbZdprlJS3dyM8NDKFy7Gp/F6ODrGA2RS4aFGTGYeONJ8dfPzLFcdE?=
 =?us-ascii?Q?ajptfezdvQSQSVmiBtoWNcsFZIaus/hPsmXDNpFtuqgy2l7cb7B2CgMwDXky?=
 =?us-ascii?Q?+/U7nGeMpLmt3CcUjEkng+dGkdp72y7D7FzhEZhxo3ecOYpYd9HmI0tE18mm?=
 =?us-ascii?Q?3xBC5wScOaN9TJp8/ytPxahrizS7+HGSMvUZ4fQl0h8f8eL075u3k5pWz558?=
 =?us-ascii?Q?9H0hgaEnPbtqllLLv7vcdooGA//J/gKuEdpARPgEubAmeRn5vC+uqZP6wV/q?=
 =?us-ascii?Q?9JnRkd/X3s58kY/R3tI4K+ESj9sbb7Lhcy62tKJbAQ6sliHXTsTwidSGn0rU?=
 =?us-ascii?Q?lYqj6p26XHewXiNoCAIbHVjDOd3SMejB69kJbQP8f6NMb6v8v2aCiJkfE8k2?=
 =?us-ascii?Q?ZzE5GkP/MU5p/UFHk9Dvf3OdCb88JJoigrDaejwVyi8tiSq/8fYP1qApcOVH?=
 =?us-ascii?Q?ARE+yhBu2IXcqHqD46pgUUP6ZwFTnsfyd8nucGGX9d5KRFR+UVDbbcrc0ZTj?=
 =?us-ascii?Q?f47u/gofQWqoyoOnD/Ks6Vm72dzPXzItRqfBanPq4udSe1biJJYM5vjKaGRM?=
 =?us-ascii?Q?+STFUOEh8TXzmPIuiqhjXmX02cadbm4mxBUZ4QRnkTWm+5HnIDuNE2gMJE1h?=
 =?us-ascii?Q?IlzQ5eP+H2ixoDm4IqQxqMC9rPWFFhUsk90aIgTP63EQmsGvQDn572ZcJGC5?=
 =?us-ascii?Q?VkywZIYeI74DxtIh56zho/XN/YwvruCRDeV/jAQLxjAMKuHGYDl+52cWG/+9?=
 =?us-ascii?Q?7Gf4Gr7Eum690YoNbEWOaMsxTcqhk/+n/bJAbigBaGgeyLob8uA8dVK7+sNo?=
 =?us-ascii?Q?EtxhpadTWoI59K9CdiG1vn5q1jK0lO9HWto5MyChJtmxabG5rMzvPEtyRlYZ?=
 =?us-ascii?Q?4Qnuig13uL/tf9DVKuuHeRbNq2SbVZvsqCWIldGCD1E1Q1i9D63CXa769mYf?=
 =?us-ascii?Q?drDX6JiEtyOgw1orgY0B/4MGmXxZ+LcTHmgsjXtDE2r2okp5oOTUGa1TxuvD?=
 =?us-ascii?Q?5NWdYGTqzaaAnkJv5Eu9m+5sbe/ICK8c7V9/2yDZzN08nnzs3ZF+MR+Dz/tK?=
 =?us-ascii?Q?eoAvC47k4oEoe75k9lD51SsecohBttC28zLum6B7qMRrgh8n/BlsnDb/iUrT?=
 =?us-ascii?Q?a7MiOMzWy3bJm7QIlWz8AGqh1caV76dNk60LUg2M0TLzuekqGr25/Q=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6278.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?4uoDC/FAvdF7mGuGEMYHpVWuNLrGISWtDxvgMLGX0chL9TPpFur4Z3netsmM?=
 =?us-ascii?Q?ZEveTVT2i0MkX/INf0LFzPd0COLjypykmpxj6ZYsXmQXGAWAvx7xJ4Nzda0i?=
 =?us-ascii?Q?jELg842Zc5xbMdn69TTPTJU2GM9uJN9ZMXYqigeaQbpJ+7cHT8ePhMwgmYYQ?=
 =?us-ascii?Q?u53b2F1h9O45HJPzSWNk6W9Yu6ilMl9F6vfGa8iOD6otOZlnuZeShuXeSAhC?=
 =?us-ascii?Q?U531h881Cg2QVv2IQsTaWSIzGxrxElMlCiibWPcl3B+T7TqimSFJO7/mlJGx?=
 =?us-ascii?Q?gz+d5Srr3iWgDfuJyacDsmuodnWDwKEvH+4RMr09oMVQ48f7BOQD8kZmvwTd?=
 =?us-ascii?Q?NGqk7gRhrb9Mcbinw6qhgVMPWUb8LZzZmYrDDqPauezv3tO+NSaQGC5eqJbw?=
 =?us-ascii?Q?LzsOE62mSjlmpTrlVyNfR4vYnl4IpcDUNCUIlR7AiinxKkIRo6A4J1YmE5Az?=
 =?us-ascii?Q?uopP6b3vJetR/Y2R5oRPbzRcfcLUVzjhAcR93PRlMAVxSoApbsabz9ollK7h?=
 =?us-ascii?Q?MFSEKk3qQNdnayo5CgZQDqTmGzZq2/bV99+Gq7Vh/q8io9mfYs0wKySRvpEg?=
 =?us-ascii?Q?x3VddYyYTXK0WJOV3W9GuqwA7rQjRGuT9uHcSGBDwh8UJxZjLvqzUEP0nhge?=
 =?us-ascii?Q?2sIM0jKMDTWh7nub8sd3h9eonrj6pedXfyyI06/bdGd54XfEtPWa5XKaLuRr?=
 =?us-ascii?Q?k8SB0Sk5z23k1Tt0CIHRlGx7F16ElnJ79LyNz9Ag9qhAje9WaOGb8eHbdYgV?=
 =?us-ascii?Q?0JGS9FdD/dKtEUXcKTXvwampQEbmn58/wL/wrzJu7/XKHSYbcocp6gnBNXrP?=
 =?us-ascii?Q?cETOUiZ7CrOPGZJmtLd06btYizHWggIs/i/1Sj5PdDOmW7W5VUzDeua70VJK?=
 =?us-ascii?Q?b9exGvyHbYW9gvBf7IK2qEnTaxh9VKML5YDJnJ0/ez+M/nDQT8/cv5J8N1MW?=
 =?us-ascii?Q?Duj8f9tD5XCeGcz/TnobZRX2o54j6QX2ZFMnZx57SXKaV3VYwHsNbUoVMD5A?=
 =?us-ascii?Q?XDKaehZ+wMYABt8Yq76rlc7c+MQC03Q5OBtVCS/R0Pr0rg3OLkNqTmKKXnGJ?=
 =?us-ascii?Q?sOuxmBlOihbHPnapewvF4eWM6rkB1lpHl5J/9aPGDDN3DAVSEWNPj16zYx3N?=
 =?us-ascii?Q?IjiEe4JZcpi8614q9hi1sv3kmrK7BgWQspJx14Jhu9VQsOVNUeBSOkVF4b76?=
 =?us-ascii?Q?Y4hgzWiPj13d43L0CX5bBu0PUQ7JzaZEFiSidKIwHlkv1e0ZD1TJ1QxLppQr?=
 =?us-ascii?Q?t5XeUpMh7fVigTcOpnhw3TW8u52oP8bs4+vG/P6G7oZVpbzdEREMPW2hLauY?=
 =?us-ascii?Q?BQTGTuX3QJJDikFXxERHGJp6M7lnAWf+0j6IZIclCaSFDfkeHgf0qIFVXzUd?=
 =?us-ascii?Q?65lCgVo/zG5ZkOakD+Zr/HtYWj3vXu2PMM731NJDiFUmPG6TMNl2Fj0J4Fnh?=
 =?us-ascii?Q?xJ53qYqzk2vjd0CvNmfN9SUP/i5u1DjpXKM8qCOU9zncFA/Yi+u/n92i2xvf?=
 =?us-ascii?Q?lL7aqO+Aa3HQG6JkqUAwuNlrO7+AwSuzIngguPzXqWncB48kXE/QZ2k53TCN?=
 =?us-ascii?Q?7a9UJEn1FxYYrxsQZYLZc0BjSOMNSqG7SMbl5Ka7?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6278.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54731e5b-99d3-4742-379c-08dd7c45a546
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2025 17:47:52.3827 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F2i9iCUY08UzwDNZwrQr68t2NfdEPj0opzaV0b6h1MleRCvOCpdx/MQ7MqlnJ8oA+H7jQP9PEJfL/FrLdFaOlb7cWq1J9h3ZyxgZrQtM4ZE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6569
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

I will send out a patch to replace __copy_from_user() with copy_from_user()=
.

-Harish

PS: Having issues with mutt, hence replying from Outlook

-----Original Message-----
From: Kees Cook <kees@kernel.org>=20
Sent: Friday, April 4, 2025 10:56 AM
To: Chegondi, Harish <harish.chegondi@intel.com>
Cc: intel-xe@lists.freedesktop.org; Dixit, Ashutosh <ashutosh.dixit@intel.c=
om>; Ausmus, James <james.ausmus@intel.com>; Degrood, Felix J <felix.j.degr=
ood@intel.com>; Olson, Matthew <matthew.olson@intel.com>; Kumar, Shubham <s=
hubham.kumar@intel.com>; Ranjan, Joshua Santhosh <joshua.santosh.ranjan@int=
el.com>; De Marchi, Lucas <lucas.demarchi@intel.com>; David Airlie <airlied=
@gmail.com>; Simona Vetter <simona@ffwll.ch>; dri-devel@lists.freedesktop.o=
rg
Subject: Re: [PATCH v12 2/8] drm/xe/uapi: Introduce API for EU stall sampli=
ng

On Tue, Feb 25, 2025 at 05:47:06PM -0800, Harish Chegondi wrote:
> +static int xe_eu_stall_user_ext_set_property(struct xe_device *xe, u64 e=
xtension,
> +					     struct eu_stall_open_properties *props) {
> +	u64 __user *address =3D u64_to_user_ptr(extension);
> +	struct drm_xe_ext_set_property ext;
> +	int err;
> +	u32 idx;
> +
> +	err =3D __copy_from_user(&ext, address, sizeof(ext));

Why is this safe? (i.e. why is it not copy_from_user()?) I see no
access_ok() check anywhere in the ioctl call path to this function.

--
Kees Cook
