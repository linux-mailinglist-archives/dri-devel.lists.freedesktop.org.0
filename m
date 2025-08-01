Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B739B17B9E
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 06:04:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AC0510E397;
	Fri,  1 Aug 2025 04:04:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bEAbPFWK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36CAD10E2ED;
 Fri,  1 Aug 2025 04:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754021092; x=1785557092;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=I7QQToGxHL+7PFMYFb/Kg/kkNwD5HEe51k7rbQED1Xc=;
 b=bEAbPFWKq9rSg6x8B1y+yPimmIKlUsM5XFnzIlkv3cUl4Qy3X8If7FmV
 ZrOUhaSAylZ98Dl6BxtnMbN9XNUaMxq6qMLMvFn8oC/rCZFkjOREB9NoX
 fQ8AWYiDQpgXJKHnZsaB32DZJkGB+DJ83sMiFt7G2cXP+siPX9ZhswvRB
 Em9y/n9meBbvHWZQKJgd2kXXCRl87sVVRK+X2mbSlG/TkQhZ4POevmbgw
 G5FJlUPEs0tjosfpWIFc2Dpk0oBxkZVItdW4fKska9ztx/cLN88gEkCSv
 Z7lLfqIaQ2WAH3DcLYpI0uiQg409yBFGd1UzBRTh+u3BgVSvLXBFsoNXq w==;
X-CSE-ConnectionGUID: 0pwD6Kx9TkyBs6ommOZwrg==
X-CSE-MsgGUID: srug+3mgRoCpZ26kPBE4iQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="56229484"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="56229484"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 21:04:48 -0700
X-CSE-ConnectionGUID: JsoJbc/dSnu3EmatA9dbUA==
X-CSE-MsgGUID: yKYZ3uQ5RDiSrRhTiDqJQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="194280561"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 21:04:47 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 31 Jul 2025 21:04:47 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 31 Jul 2025 21:04:47 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.47)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 31 Jul 2025 21:04:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iQpF06IGYTqy87W2D1sZXCuXAsA2AZTsyKgJiqXSmHwWOi303LDZ1jiszL5Ddmjh4ZwfYaXcaYJ9Hu99m44aM5Oz7cHpMEUk4r7vhy+G+HhmCn1Lno744W1UfKDmexm5KlVTdCA8V+pPNvIm/U9wrHomJ+s0p9BEuiJUVTPBpBQ1JjgpFEtsG6FtHI4as8zjQeOe/Ur/etNdSVWIq8ConnD//BrnDG8ceQxjCOOdUIuE6BBLImCEBYgATBiC4BuNy/gAR2sQ5RoX6ZeK06CCILkn32yc0V/CTbi16LXduWuTj+j7tFZojUrBwCrdIppHXvMdfAH+dSSWv/4+Jx1kmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sT9dRzIJ8LlVMbtuIIWecv0vY3QoFFMm5HlIQPI0Yi8=;
 b=Hxb6oBlqAG6myTruELPWUMACUox54xYsuEgPci9Mq/M1vNK+MQy2oO6+Br/Mw/IiGGdyJ4O9EZ+9q7wNjCY+B5njKgk4yDR3iWeKZEzsoMYpv3QFV1nHcAnxfzVpEVFqJmJpxyzM7uzjkvSJQbVu0caQ7MAl3LQUblDTkoSDzgDpRKvvrNxOFnPhRPnvhW+3eg020f01H9KNv9Tyi1c287AOE92yvyKJv1ISHPKm4v46F9ZzmIE1tl6v9lSjBOTynzVO8Oqq7dmiV8Ouk87OJOdehqUdlAp/4BBET8TdjoHpfBxEnw9/b1hZNNrcCbYBTPMTiLbFIAeLEm4V2cwy6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by CH3PR11MB8209.namprd11.prod.outlook.com
 (2603:10b6:610:15d::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.14; Fri, 1 Aug
 2025 04:04:17 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::76e3:aa2a:a205:819f]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::76e3:aa2a:a205:819f%7]) with mapi id 15.20.8989.013; Fri, 1 Aug 2025
 04:04:17 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>, "Murthy, Arun R"
 <arun.r.murthy@intel.com>, "Shankar, Uma" <uma.shankar@intel.com>
Subject: RE: [PATCH 02/28] drm/writeback: Add a helper function to get
 writeback connector
Thread-Topic: [PATCH 02/28] drm/writeback: Add a helper function to get
 writeback connector
Thread-Index: AQHb/SGY84ptMKITWU2hbXUI8JyJfLREVPoAgABJOQCAAX9CAIAHGrJA
Date: Fri, 1 Aug 2025 04:04:16 +0000
Message-ID: <DM3PPF208195D8D157122E54651824E2290E326A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20250725050409.2687242-1-suraj.kandpal@intel.com>
 <20250725050409.2687242-3-suraj.kandpal@intel.com>
 <wntb2pbszt3aavfuztv4wvr3dxwvpuk673d45xefmp6arb5qu3@s22k7yw5ykjm>
 <DM3PPF208195D8D93CFB788A26D027CF5CEE358A@DM3PPF208195D8D.namprd11.prod.outlook.com>
 <xfg7pvilhcbtyh5rtdbve4yjxab5wfsd3zmxffwp5j2pbjtcgw@x2ebzfw3tx2w>
In-Reply-To: <xfg7pvilhcbtyh5rtdbve4yjxab5wfsd3zmxffwp5j2pbjtcgw@x2ebzfw3tx2w>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|CH3PR11MB8209:EE_
x-ms-office365-filtering-correlation-id: 40f335a8-0ac9-4987-e309-08ddd0b07c03
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?DP1hDbzCv61DfLe2+tP9zr1KG1N/qCY5Mp75D3dLfUQaTqj6wawRfEYwwP1b?=
 =?us-ascii?Q?Su0Wu78E1cYLVZT9tmdXYshXRIJs1K6YPHWGLU/SMoxzwuGbW+mNO6lEGjO+?=
 =?us-ascii?Q?yi3WFKpVxTNtiCAX/wiGxbVTsghrqq+TanDum9Y50bxe1kMvKMPg942n1BN1?=
 =?us-ascii?Q?iQbzw12xS1BBlzp0tksu0++zK7L7lzoeFXtfmKFYSgqNnrz4UB6PbdHMdRyE?=
 =?us-ascii?Q?kjIrrTHsraaCpix7dliwCaX3GDrnUw6fmztCxOiWu/9ptjKVM5wYA3yRtxHQ?=
 =?us-ascii?Q?fqWBQwNhi9bYJZSjtSN5xmRGmvQSAL9xC1DktcKVOBzvhoEdHVyiW2E4NcgU?=
 =?us-ascii?Q?OY3MdymvYvB3sJBZm82G5Z1Bf4x9c2gybnwlV6RXNBe1PXcSOl1V/4EkkTQm?=
 =?us-ascii?Q?ewtPGwVDPKp1evBX/TJX6ztNx8nhLo/zmXax0CJLr2b/NyLqV+fTM3hleb8g?=
 =?us-ascii?Q?1iOqpNltcdpkfUKmHPtyjwAPZ31mgN1KH70sKgkJUlyBsn4JtAdxQGRxUig2?=
 =?us-ascii?Q?riV4AqrSxVIUA7bKMkHzDp1mcc8rJYbl1wzfLFgkQYhh1GLTXJYqvY9fIX97?=
 =?us-ascii?Q?/fpKgZJ9+b7SPnHWsaZwB03FIn6c+XSCOu0BTBYkeQcEYnflQLDdmu6qDGCT?=
 =?us-ascii?Q?ny8rh3+2wQQXm1h8kNTaxgXVo7nLbrg0Kek8cmF6NivYQ9uX7ZXQ/p9Emgq/?=
 =?us-ascii?Q?trJNrE73jqNtBGUqI/6a35Q83HZQA2Zfm6ybMtQOv4CHp8iAE9Lrdh6cMLi/?=
 =?us-ascii?Q?sldcvzrSqLmqNu2ulH9Lp+Y45EGJbWXs5IxHPyrLpFOTVd2FhN5GbwjNjMrJ?=
 =?us-ascii?Q?BIH57m58zzJsbs+gx4gE0PklwCfQGsi+kIIB5qGauozkf9xK2iqpEagDWN40?=
 =?us-ascii?Q?YI1oWgW/CuBPjSOjhjrdfTG58l/AJkrGY4+bdE4+x3sh+7Ay8FDbUf4EW+fy?=
 =?us-ascii?Q?BdFT1a2Sey7/RcAQhonMpiQUuTS7ZY9Yrd9JPmRaHWJh4iBy9Qoib0/BC5TY?=
 =?us-ascii?Q?jDSazk1LPxUZW1BC5qgBgf44appXiwRwzDITrZwoTQs8I80Zg+l3okDLW++t?=
 =?us-ascii?Q?l3f1YAulDc/X1lm1m1hbuyszK62HZqrGRgRT9sV9OQwPE0thi76erlwEQ6Iw?=
 =?us-ascii?Q?XAbu4zFt67719LDRW8BrODgpp+b59oEUfjBwzkk5WvL10idk9bvxEIG1gX+T?=
 =?us-ascii?Q?EFJSqAjarEVCAOV3fbBex5jf633eN98AV2lClTEg32Iy0fUE6XR5dg5RXdAm?=
 =?us-ascii?Q?NwneuLlGgW8ogyZhdEkoWserioSxDP3OjUHsFIxsqCF05LW2ebQPTlXbyJIg?=
 =?us-ascii?Q?EO1TdVCAcIDnztfgkbnqafvPK/nlGoqD3y0KyxJGCXMR/sVEC31pIHlpScag?=
 =?us-ascii?Q?vxoSdGbKKz3cGq+9UR/T5NMHazjo/n7gGVTK7lQKYHIDiIYhPWSAte2Selv1?=
 =?us-ascii?Q?Lk1ChEoaOXAz5JCvTqazlzmh+75SfwElFPq4AAtnwnLGxAywe+tDTw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?lm+ro4n5cyGZOfGHi4yCUJ2qPu0etCWeSIftVwuj+h0ZiK7WqhXX+yayFHa3?=
 =?us-ascii?Q?c0tVtpCCEMjzrLgTwaBVJcy4d4LkOBedQCqqufA32S/WFrxcOBYERLHEsK1Z?=
 =?us-ascii?Q?KmpFzjqkeGaikSonrmjKCNm4IrXgR4VUgAwVDdLxgCLvIVdFDkmHcUo6oi1u?=
 =?us-ascii?Q?esZyJHpDoD0vr0WtNHllma4LvVrH5vOBTqbImyns1bTNga443//cksR46MuN?=
 =?us-ascii?Q?TKKXQHuxjdVNdSf2JA5Bg9ltSNMo31pZ3hbGBZ4vrorVMJv8HGJwWaW9jQvq?=
 =?us-ascii?Q?M+L/Q1rBXuvU99H8KoyDLa9pYpGoOOBA1cxltwzAKBa3DhvG3yfTbLjxXhGw?=
 =?us-ascii?Q?qu5C9kn0vuispnuUrhZlJXGIhpC/DhmedU0oeRe92AMcr3SV4WVpzap6kg6R?=
 =?us-ascii?Q?VwNBHg9iOUVK4I+d8u8O8HbhNdWqjLqeeCkZP+b58oxO6qGNTzqma5r0fJxH?=
 =?us-ascii?Q?tsrrzHED28T+ltHgVfSX4Ilp1v9tIn6qxNhMg4OrusJ0OjMXwVvTn1fuzR04?=
 =?us-ascii?Q?joUmqHyIeXRqU9PDiZHYy9s9YQalAEC+9tXjE7Lxk/VKChebWVbwq/udYCtT?=
 =?us-ascii?Q?P+JNC/Bz3Yzkc5Cl1OIJrLObm/cUWJ8e6clZO2fv14vWFWDBFgJp9a9YCP5k?=
 =?us-ascii?Q?9L15qOYCyjDPMp3bcAgBrsyLWeVXYEvkAaW/Nn5+xVpZOky1o16tFTA563XJ?=
 =?us-ascii?Q?jRROg+/7GmkNxCHMvyqRnVZYtPpTOZo9aIc4lgR1lIDMd9fOraxYCKcirTo1?=
 =?us-ascii?Q?mPUCrT6ee7SqB0CRi2UYr3RgkTm2QUx7gIJY10GS0DSl/7cMCEkg0zYzjdFw?=
 =?us-ascii?Q?U/CYY9OAlhobbDubcgDIEK9BH7z2PwbqmWejLM57kf5GYsqiFHVmXEc1J/ka?=
 =?us-ascii?Q?fsai83Kv6WRyBbKXj657+4Xt9IKwz2dtzHFAf/2lIFA34eFMDZrWd+SiRync?=
 =?us-ascii?Q?PU5Zh+DVbTaGfzkNCC8KDG4lTVYVaEYtD4ru74KJ4tJv7J6tTulYDh4Ljbam?=
 =?us-ascii?Q?10XW++oUCnfU9U2PEzhPeTOAnkBB02NErSHLPkOd22i25RtdluIBLlW08Cg6?=
 =?us-ascii?Q?T52VJWTdiNVlCRH/8MwDO/HLNwsSnNMEYxghNR7c5lRdJrOr/el8FmsLRaJc?=
 =?us-ascii?Q?qguCEY70zKI5n6VzU4QSmSWCp/NHPgXMgDMt7hsppjG9DdzIqspGgzJ8ZH7n?=
 =?us-ascii?Q?WnAFgspM41rdbM+gZQ23N24UE8h7JJqZD5mcqJ+LcGGnHgooM28xtIJyAsc0?=
 =?us-ascii?Q?7s5fI3PvI4RBp7y3WmcdDRJIzMCLdh0OiQjgcZaev0s/08QfO7mVtvKFufOu?=
 =?us-ascii?Q?N7GnS5YQtsXgWJM1HRKa2253YLuMyCCu8hB4cPeIeI9NdjyqejcSaSv6+fbO?=
 =?us-ascii?Q?2YTXNsm53jft4XYqx+/jYwZpxIu+G2mG00hq0BpYkHNM3/a6nMlxRUij/jrk?=
 =?us-ascii?Q?tRWE1dV1XeZwWJ3SJU0B7WZRrwhSJtpADZXrcSnPhA4r9Y9O1pFQB9i7URhC?=
 =?us-ascii?Q?rROiLjyObpLeh70sF+SWMmair+zfEkKGrjxhK25fJPJrtLnYEonSAB/3Q3R0?=
 =?us-ascii?Q?Abo4d/7rh40tSd8nzwt19k7nrZ5CypRg70s/tL3r?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40f335a8-0ac9-4987-e309-08ddd0b07c03
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2025 04:04:16.9305 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nCwIyuCBGlaiX9285dKGV/zK8OqhA6sds5KKB8E4TvkioOnzV41/btakOfQcxoYNmfQUWprUXKC6cwo5lcGXYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8209
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

> > > > Now that we can initialize a drm_writeback_connector without
> > > > having to initialize the drm_connector within it and leaving the
> > > > responsibility of initialising the drm_connector and maintaining
> > > > the association with drm_writeback_connector to it. This helper
> > > > hooks lets drivers return the drm_writeback_connector associated wi=
th
> the give drm_connector.
> > > >
> > > > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/drm_writeback.c          | 14 ++++++
> > > >  include/drm/drm_modeset_helper_vtables.h | 59
> > > ++++++++++++++++++++++++
> > > >  include/drm/drm_writeback.h              | 14 ++++--
> > > >  3 files changed, 82 insertions(+), 5 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/drm_writeback.c
> > > > b/drivers/gpu/drm/drm_writeback.c index fa58eb0dc7bf..e9f7123270d6
> > > > 100644
> > > > --- a/drivers/gpu/drm/drm_writeback.c
> > > > +++ b/drivers/gpu/drm/drm_writeback.c
> > > > @@ -107,6 +107,19 @@ static const struct dma_fence_ops
> > > drm_writeback_fence_ops =3D {
> > > >  	.get_timeline_name =3D drm_writeback_fence_get_timeline_name,
> > > >  };
> > > >
> > > > +struct drm_writeback_connector *
> > > > +drm_connector_to_writeback(struct drm_connector *connector) {
> > > > +	const struct drm_connector_helper_funcs *funcs =3D
> > > > +		connector->helper_private;
> > > > +
> > > > +	if (funcs->get_writeback_connector)
> > > > +		return funcs->get_writeback_connector(connector);
> > > > +
> > > > +	return container_of(connector, struct drm_writeback_connector,
> > > > +base); } EXPORT_SYMBOL(drm_connector_to_writeback);
> > > > +
> > > >  static int create_writeback_properties(struct drm_device *dev)  {
> > > >  	struct drm_property *prop;
> > > > @@ -443,6 +456,7 @@ drm_writeback_connector_init_with_conn(struct
> > > drm_device *dev, struct drm_connec
> > > >  				       struct drm_writeback_connector
> > > *wb_connector,
> > > >  				       struct drm_encoder *enc,
> > > >  				       const struct drm_connector_funcs
> > > *con_funcs,
> > > > +				       const struct
> > > drm_writeback_connector_helper_funcs
> > > > +*wb_funcs,
> > > >  				       const u32 *formats, int n_formats)  {
> > > >  	struct drm_property_blob *blob;
> > > > diff --git a/include/drm/drm_modeset_helper_vtables.h
> > > > b/include/drm/drm_modeset_helper_vtables.h
> > > > index ce7c7aeac887..6b89b33d2304 100644
> > > > --- a/include/drm/drm_modeset_helper_vtables.h
> > > > +++ b/include/drm/drm_modeset_helper_vtables.h
> > > > @@ -31,6 +31,7 @@
> > > >
> > > >  #include <drm/drm_crtc.h>
> > > >  #include <drm/drm_encoder.h>
> > > > +#include <drm/drm_writeback.h>
> > > >
> > > >  /**
> > > >   * DOC: overview
> > > > @@ -1179,6 +1180,25 @@ struct drm_connector_helper_funcs {
> > > >  	 *
> > > >  	 */
> > > >  	void (*disable_hpd)(struct drm_connector *connector);
> > > > +
> > > > +	/**
> > > > +	 * @get_writeback_connector:
> > > > +	 *
> > > > +	 * This callback is used by drivers to get the writeback connecto=
r in
> > > > +	 * case the init is done via drm_writeback_init_with_conn. Which
> > > means
> > > > +	 * the drivers don't have drm_connector embedded in
> > > drm_writeback_connector
> > > > +	 * so they need to send the associated writeback connector with t=
his
> > > > +	 * function.
> > > > +	 *
> > > > +	 * This operation is optional.
> > > > +	 *
> > > > +	 * This is mainly called from drm_writeback_set_gb.
> > > > +	 *
> > > > +	 * RETURNS:
> > > > +	 *
> > > > +	 * drm_writeback_connector assoiciated with the drm connector.
> > > > +	 */
> > > > +	struct drm_writeback_connector
> > > > +*(*get_writeback_connector)(struct
> > > > +drm_connector *connector);
> > > >  };
> > > >
> > > >  /**
> > > > @@ -1192,6 +1212,45 @@ static inline void
> > > drm_connector_helper_add(struct drm_connector *connector,
> > > >  	connector->helper_private =3D funcs;  }
> > > >
> > > > +/**
> > > > + * struct drm_writeback_connector_helper_funcs - helper
> > > > +operations for writeback
> > > > + * connectors.
> > > > + *
> > > > + * These functions are used by the atomic and legacy modeset
> > > > +helpers and by the
> > > > + * probe helpers.
> > > > + */
> > > > +struct drm_writeback_connector_helper_funcs {
> > > > +	/**
> > > > +	 * @get_connector_from_writeback:
> > > > +	 *
> > > > +	 * This callback is used by drivers to get the drm_connector in
> > > > +	 * case the init is done via drm_writeback_init_with_conn. Which
> > > means
> > > > +	 * the drivers don't have drm_connector embedded in
> > > drm_writeback_connector
> > > > +	 * so they need to send the associated drm_connector with this
> > > > +	 * function.
> > > > +	 *
> > > > +	 * This operation is optional.
> > > > +	 *
> > > > +	 * RETURNS:
> > > > +	 *
> > > > +	 * drm_connector assoiciated with the drm_writeback_connector.
> > > > +	 */
> > > > +	struct drm_connector
> > > > +	*(*get_connector_from_writeback)(struct drm_writeback_connector
> > > > +*wbconnector); };
> > > > +
> > > > +/**
> > > > + * drm_writeback_connector_helper_add - sets the helper vtable
> > > > +for a connector
> > > > + * @wb_connector: DRM writeback connector
> > > > + * @funcs: helper vtable to set for @wb_connector  */ static
> > > > +inline void drm_writeback_connector_helper_add(struct
> > > > +drm_writeback_connector *wb_connector,
> > > > +				   const struct
> > > drm_writeback_connector_helper_funcs *funcs) {
> > > > +	wb_connector->helper_private =3D funcs; }
> > > > +
> > > >  /**
> > > >   * struct drm_plane_helper_funcs - helper operations for planes
> > > >   *
> > > > diff --git a/include/drm/drm_writeback.h
> > > > b/include/drm/drm_writeback.h index 149744dbeef0..77c3c64c132d
> > > > 100644
> > > > --- a/include/drm/drm_writeback.h
> > > > +++ b/include/drm/drm_writeback.h
> > > > @@ -84,6 +84,13 @@ struct drm_writeback_connector {
> > > >  	 * The name of the connector's fence timeline.
> > > >  	 */
> > > >  	char timeline_name[32];
> > > > +
> > > > +	/**
> > > > +	 * @helper_private:
> > > > +	 *
> > > > +	 * helper private funcs for writeback_connector
> > > > +	 */
> > > > +	const struct drm_writeback_connector_helper_funcs
> > > *helper_private;
> > > >  };
> > >
> > > Unrelate to the commit? Also, where is this defined?
> >
> > This is very much related to this commit and defined on top right here =
in this
> commit.
>=20
> Then please split this patch into two.

Sure will do=20

Regards,
Suraj Kandpal

>=20
>=20
> --
> With best wishes
> Dmitry
