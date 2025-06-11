Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67015AD4A35
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 07:05:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C14910E301;
	Wed, 11 Jun 2025 05:05:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M4qv8vQJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D51A10E322
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 05:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749618338; x=1781154338;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xepYi6r152hpJ353JKs8aJNHnKyyW/iPHnCoeE38HCE=;
 b=M4qv8vQJsupUqtfrm4WjlEqMwSIB7gVGj5WBewRqsQ1kZ0FZYAutC+Gb
 kmDPm79TmEAbWkxk8j87fwvcMw8Uv1HB6wl4scLRkRRnpQyI4m95vMQln
 p8IZN81fhEn2ydFzuJxYdnnSQE9aKFRJTxS/DHrZo7r1vH9iNJL3pdc/G
 AoPvBee3Wrx0kWs9enf5U1ZaG+TKaFzZpAXykh3+6YEceeDroPD9IEFxU
 dw/mhRlXQpPkxVDDyR9bARva6vqrrK83OII25wx5jK4kyl54URKnvCjII
 wjeqsQM5Ed7kxxJPjZn/xiRdlTbPxmZgvw7/RUnLJNlYpyKa4xOFCFGMD g==;
X-CSE-ConnectionGUID: Z+lDcU2vTuKjPhTBrTtrsQ==
X-CSE-MsgGUID: RNwf1Jm+QXGED7R8h7Pf1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="54376960"
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; d="scan'208";a="54376960"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 22:05:37 -0700
X-CSE-ConnectionGUID: oa4Vbu7aSo+09gn/qGmibw==
X-CSE-MsgGUID: sl2wdFSCT5uFzjrF/9IwtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; d="scan'208";a="147558992"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 22:05:37 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 10 Jun 2025 22:05:36 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 10 Jun 2025 22:05:36 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.45) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 10 Jun 2025 22:05:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NP2mWO6NDVsfT3LDPsLoGRJng5eN60PxgxBDe/zk4xlHZfaYLIAprVJKKPgfK6Ap4YaEtyP4fkMPl3e8M0DSy+uhR+nWTuosgPXhIqfdSOt4LelvsetD0aWoehLoEo9Yv8+OxQVsm/vULUmh5MU/Q94YErCqdKtZOU4SVt31wuXP5F53OgTBWT/4KjoQNCdA3LtDwzbLeJJa5ElArM+7djr+UK1DZDGgNXkei1z699oZYeI2Cao14ROijJ/lNWuCce6DR1YJJt5/ZpGnCmsGdYCOwD92a3b34qNA/dufmOmiHQ3pnehcqxKI4HzZVNggZVDvT48ZM+sNm3lxPz1CsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s67Fcc+Z7dyBQq5kEGFnNu6njStWp/zg1y78sWX5FKs=;
 b=SEV+OFzKSFz20G9uTmEg/IiLDSAiilbA9AoZt+ZGMj67mI0D0TKvas5BMLStp+81rkP21vxb/pdfbysIJc80/qEJbOgdMNWvtWd6lx/m4AMUsNKyODA0SXTJeUTl64Rlvv7WYG2MWSNIWJaFnCR3chwetW2yzaA60BqWSMl3XjCTEq7VwojqxepQOkMUo4w2FbGK+8t9+XhpWhq/R15nsCTVj+fU3kmQym+nkU5DxcdbZnlkxMTHBIumRRv/19oO+ZiI3kgg+bYuF7dUtVUljCOKrLjj6wcjXguFZkb91fEsZFN5hJq5rtLsjm3DUbEBbvBiMCyKbEyjvbbFOxIunQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by MW4PR11MB6714.namprd11.prod.outlook.com (2603:10b6:303:20f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Wed, 11 Jun
 2025 05:05:14 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%3]) with mapi id 15.20.8813.024; Wed, 11 Jun 2025
 05:05:14 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Steve Sistare
 <steven.sistare@oracle.com>, Muchun Song <muchun.song@linux.dev>, "David
 Hildenbrand" <david@redhat.com>
Subject: RE: [PATCH v3 1/3] mm/hugetlb: Make hugetlb_reserve_pages() return nr
 of entries updated
Thread-Topic: [PATCH v3 1/3] mm/hugetlb: Make hugetlb_reserve_pages() return
 nr of entries updated
Thread-Index: AQHbyhCB85ggCz+4Lk6TetDGBu1SWbPzvqWAgAFQFOCAA3TJgIAE5oNg
Date: Wed, 11 Jun 2025 05:05:14 +0000
Message-ID: <IA0PR11MB718514BA896208C95AC8AB2EF875A@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20250521052119.1105530-1-vivek.kasireddy@intel.com>
 <20250521052119.1105530-2-vivek.kasireddy@intel.com>
 <20250604163543.62d543d7ecce5afb835aae98@linux-foundation.org>
 <IA0PR11MB7185D6156828CB310CDBEB41F86EA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <20250607172521.605b6094b442386b4014613e@linux-foundation.org>
In-Reply-To: <20250607172521.605b6094b442386b4014613e@linux-foundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|MW4PR11MB6714:EE_
x-ms-office365-filtering-correlation-id: 85c79501-ce4b-4c40-0e77-08dda8a58cd3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?5NtlUXAl9nhadFRy8ay8PuU1H+v7b8aOpnFPVtjNatIkJuBnIPlB1pQUF1kx?=
 =?us-ascii?Q?4a8DwvaQeGnAZP/WSs4qCeOXR1tRAOsSgo0fL9pST8lrl/Py+4TsP+NAL8Se?=
 =?us-ascii?Q?n0wUa8W8YaNmCOGEhspeeoO3ktaoGvXenN7wefXaPdTSoCFFzkKDAcrwCg1C?=
 =?us-ascii?Q?aQsJ6s4MQXnC6uc/u060UX16OT/Mas4RCIMjGz3d3Vah4GxW2emS1Dasvx2O?=
 =?us-ascii?Q?5J7ah8cewh09xVh2/1XapZU351nI4EvMOlMNLWYjItEmKGstdfuCdcf1Lu0d?=
 =?us-ascii?Q?PMqYCPLNfusZRLXYJFr/2UM7XcjE2oPJiO0jfF97NLvE09k3M54coxfabgdf?=
 =?us-ascii?Q?8xTDqgKpsOpP4ZwQGeP59eQOXpScievUkVfB07GUJw9KDej4zbiJkq1OSUWR?=
 =?us-ascii?Q?n1HmRyjNpK+m4czTiUc/3qoc9fTogWqhXc1tIcs5JiLjiyRiw8j83RaNbxj1?=
 =?us-ascii?Q?OTDJhIjJsmNKlrv2DvaiJ98OJAavWKWVzuJRjJH2liTY7IFwK8FzRTC3yTaE?=
 =?us-ascii?Q?v8Ixw9JvVHG1NTAVgTAyZWiDLyIICE6SU0+C7vWVRpqL2keYz9siJFwizyrM?=
 =?us-ascii?Q?fW1pNAOUv/7zF565oCAldzMSSNR47r1+wakWkxMIWCLK2TDJcYs5/naYomQt?=
 =?us-ascii?Q?+2Z1q5U4sT5Ia8mhmgl/T9X6wdio19LIdI0oYVWaCXEuycleJ7pMt3QmMvJr?=
 =?us-ascii?Q?BHNidzDL+yzivGIOdUwVUYBVVEidPiN4VE8EtL6gb4Xpnz02K5lf2t6G3giC?=
 =?us-ascii?Q?XQahYXV1swoBdkn6KuH/IbcJQkY8GXe6jwPNyP8R3ub388SQOQQ+ouisphyn?=
 =?us-ascii?Q?qVTIZ9UG4I8227GDzXht6HVNYuzNHUfti187dOg5g2dFmnebkOsrtXxbX0/8?=
 =?us-ascii?Q?J5LXqgvdpsldxrlKQ5tfRsV5TNrKIKM7/rDXshmVP6Ydl/9WOq88GyZ/pmgp?=
 =?us-ascii?Q?Jl0fYPUSxuplH4Fl5C8vLgOpCiYpttOSHmUagR0NScVfEqQfnGZQ1dyCVz4e?=
 =?us-ascii?Q?2o4olQwxyVIuxvQtAMpdM1ib5ik9Kl0OzXHBQt/OhgkKXTqPNkpSycyeg7FK?=
 =?us-ascii?Q?mmNwUNYtcZl+6GOh9IxddnBjGDM2iMd5CxfMIoTlAr3vQaCt71u794yGTZuW?=
 =?us-ascii?Q?vxqlKe6GxgDpHwoJEwfC08jDbk+dKoLeKNoBkaPTuGw1norqrZioL1W9OCvC?=
 =?us-ascii?Q?TSbAv14LjVqOGki6Am1EUdUuUZ3pDnYkOwKx2sVMwvXJHBYyYwtpwNVkdFA3?=
 =?us-ascii?Q?16xOCOJOoOqYfAtrl3LrAeg2rRVZgGry2wMm97GbXEL3n6d+jzRejW7YyjUg?=
 =?us-ascii?Q?UHRjndGc2WaZV6rFh8TYaSoTdk+3b48+944QOWcIubxQbq9dnfl0zDgZDV/N?=
 =?us-ascii?Q?P1ODALW9VElvkIG617sYn4LYJJtxbC3L1owM92aCVbkqWjFqCnm8BlkhPbym?=
 =?us-ascii?Q?q4X/MpjJ4ymweRi14bTKGdm6zNh1Fl9JjjUTf59hdTrvEQQnJHP22uVmcxGX?=
 =?us-ascii?Q?qqErsexz6ZaZ+oY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?jz/wD39bAa/e4w7/hh1oRSK17CwBKgTf+1JWQCFZR+3n5e0zonf8M7a5OE4I?=
 =?us-ascii?Q?6l3DAsuUeduS2nCLq4U+PlL7QyBa3U3c/OWgUvmWumwkiGxZ/RtSI94+xge6?=
 =?us-ascii?Q?dFUlRMIcEXpvyop8q51dD+metjXiq7gHnl/nT9CvONPSGmqv4sBjaESxzjV1?=
 =?us-ascii?Q?Tnj1XhvPkxA/egfxAei9L7K49ysBXHpgyNAayLY/iXXd/77RXI3N/U2QNRW9?=
 =?us-ascii?Q?G8Wh2nHxc7eN22C3GfyUh5+iWKxhH7kNjg9jefQ51889KPNdoOmOfFQVOGb3?=
 =?us-ascii?Q?j9xWGhUlULbERTfkL6xTrAkppyJSIXdbLi9jxUVj6TqQ1xbN3UIxIWCgz/F+?=
 =?us-ascii?Q?wYlS+KUF+m8G4IlnqcwwMcR5HJlaUADRyQmOF/ayH4bPsU/L/g5cpkRZ53gR?=
 =?us-ascii?Q?YrRZorDSknU3wMZKCx9c506+NoUbR3inC71J/DwDFu8kYgVB8jbXuM5BgWl8?=
 =?us-ascii?Q?H8t1H8yajXa3F3CRsumZlT9tfKdZ6RimIV54hWZH0kWp0Fq4pv4tJqjQEyTB?=
 =?us-ascii?Q?oP8tVGuwym42Z4QywsdMZd6lQ0cYoDb7wp2PbcPRIWaVI4KMkTjyzjXPnEFH?=
 =?us-ascii?Q?qvWvMJRmM6dyF4FhQ93qp5INC6WWYaPTjs2kJ90Lj8Y1Cky+8I/cRsT4fDmd?=
 =?us-ascii?Q?8CQiimbULJC7Otng0AHDJsyIQ/ssDyA/N5cjo64Rddchn4hPYf964al9ub6b?=
 =?us-ascii?Q?vkGLj2DzT/by3p7Od3cO6bTCXDKJ/0bJWQlYqB+WsvEt/lnp7fpQsH0rO6/d?=
 =?us-ascii?Q?2BYPR1tJ4pf1ts9hR7614T92324CTRrh1Drgf2fiUTWHt5hkoDigtvBPWLST?=
 =?us-ascii?Q?Gm/xoSNALLPb8iISxtES9YaeiQlPBCezcf4i+H7KG86r+wNyZL93GwrRPeIK?=
 =?us-ascii?Q?+6F4gjHunr3/KCSgVmqALq+RVju5lR1H2qaf+qVoYR4Adkf94JX/66Mkar3d?=
 =?us-ascii?Q?ywy9V88KWxof6VUanKch2LauDBRrs7xb8hvJXlwGwojZJ6FFPG09FsrND8kw?=
 =?us-ascii?Q?/bTszKWQ5uCirulr4PrWcVAOwgcoRP0lFuhlZE1BMeb3n45M08cAa+ip0oyv?=
 =?us-ascii?Q?DVC94FWlEaQSES3psZmulkjgKvs4zsmQid1BFORDvh9JQphzKPrN/Cq7PEaw?=
 =?us-ascii?Q?sOrjiv4zJD6jNaZtZR0qyjaswUXRKwtjGGlJGMDSmW/9G/6OoGJF0cN0RRi1?=
 =?us-ascii?Q?/pKg9YKjsF0mu7mbLlgRKq++Iw0QsXkv3LhgS8Z38NQgTKZ2kXFcBuYnrJca?=
 =?us-ascii?Q?OTFygkhby7k+FIyvHfw4FPfQQ/3Utihiq25T0jb46Dv9tg9FXA6sWXH/ViwJ?=
 =?us-ascii?Q?lYhIaxSHBv0+4YXXYlcmjBUxyNy8kk2A6wp37va9glrMtzjy554rTb9A/iCm?=
 =?us-ascii?Q?c0KL8j7ZAIuMmxhJsrMxZCCpvpbPQS1LPBnp+RLnJRKH59kzqBndPn+iZ7R7?=
 =?us-ascii?Q?E9NkMYNUK5J42fwe0d+2LBMYXRfxgsZrjqLGDRE09cEBPtTomA4K9TWJ/zip?=
 =?us-ascii?Q?nG/CDbWuTD1jPfu9j5Bk7c/uy4fx2dcJtvacm+43fiZQnYeIpMjNYb8qMzzr?=
 =?us-ascii?Q?SbLsdsvLlYMNr4A3KqGYtYugwqYGIj+IeqV/7BBO?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85c79501-ce4b-4c40-0e77-08dda8a58cd3
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2025 05:05:14.1652 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uqO8tgllKwczOTOAEQHfYDWyUEchejubqoewkujch2xMuaKwdJ2wQPoY7s7XsQh4w5r86McJThsz/+zQgRykadV+QDVVc685eAvNhUbURWg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6714
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

Hi Andrew,

> Subject: Re: [PATCH v3 1/3] mm/hugetlb: Make hugetlb_reserve_pages()
> return nr of entries updated
>=20
> On Fri, 6 Jun 2025 06:14:06 +0000 "Kasireddy, Vivek"
> <vivek.kasireddy@intel.com> wrote:
>=20
> > > Also, patch [2/3] addresses a BUG which was introduced into 6.12.
> > > Presumably we want to backport the fix into -stable?  If so, it's
> > > better to present this as a standalone patch, including the cc:stable
> > > tag.  This is because I'd be looking to fast-track the fix into the
> > > 6.16-rcX cycle whereas less urgent things would be routed into
> > > 6.17-rc1.
> > Unless I merge patches #1 and #2, I don't think I can come up with a
> > standalone fix to address the BUG. So, I don't mind having this short
> > series deferred until 6.17-rc1.
>=20
> If I understand correctly, we have a way in which unprivileged
> userspace can trigger a BUG.  Unless we're very lucky, this wrecks the
> running kernel.  So fixing this in shipped kernels is very important.
>=20
> So if I indeed understand correctly, please try to find a minimal fix
> which is suitable for backporting and then, as a separate series,
> propose any changes which you think would improve things going forward.
Ok, I'll try to come up with a standalone patch to fix the reported BUG=20
and separate out other changes into different patches.

Thanks,
Vivek

>=20
> Thanks.
