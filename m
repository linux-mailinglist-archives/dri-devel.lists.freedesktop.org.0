Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15BF98AF8D0
	for <lists+dri-devel@lfdr.de>; Tue, 23 Apr 2024 23:17:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FB11112648;
	Tue, 23 Apr 2024 21:17:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hxBLBA0j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51E9D11238C;
 Tue, 23 Apr 2024 21:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713907029; x=1745443029;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yYwhBy8oMa6a6RDLEHPZuvQfGdiGdpe74fonkCuPrbI=;
 b=hxBLBA0je5W/vQwJFg2ATqPg2N9q3JhjObXlkjh4GHW/2/0sKzb9kHlV
 VQCCukfBJuhBTbQ3G13d7mggHS0+zeNBluJsr4pYZ3nrDMzFD8FN20ktk
 TspgqXyxAvgJn7RnBj1y0Yhn5tkgIlUu9Eydbi4wpTRoJnIURpl1S+hnf
 T+MhAMUBIKucPeJ0sLkT2PQLm6esfTigC1exeOdU/paHN7IhSYhUa10Hf
 MalUsyzDe2hrMxp6buUuq4iRcnDD/5QBiCvGBPV/D4xSuvubfisI8S6Nf
 qTajRzkPAmtam1AETIe7CP7MKN0I7jFiyV2dk+bvBKaoXaAmom6bRKLnU Q==;
X-CSE-ConnectionGUID: O8jbKtdIR7iyBzcrHk2HOw==
X-CSE-MsgGUID: 4bJ6ZFflT2is6pY5IzS3aA==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="13305306"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="13305306"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 14:17:08 -0700
X-CSE-ConnectionGUID: F+5A6XerTL2aLPZp0BKnzA==
X-CSE-MsgGUID: b+NW22pfTI+hG/M3ELHDzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="24496834"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Apr 2024 14:17:08 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Apr 2024 14:17:07 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Apr 2024 14:17:07 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 23 Apr 2024 14:17:07 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 23 Apr 2024 14:17:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mrsJ+RLMLHbvVSkk0yfd0i64cm/bnYVmdErqatOgstpvB/FjYVpROhQM3Bbew1C0VRpBVoBqBNCK9k+6FBFn5Bm51LL3sBC0XoL+ETdSS9Ou0kUpgfDIGPZz6ecgIaWKy8/cdNdLIk6Csp7I2s9fXgg1dqY6jffQK9t+Pc9LQhGOHYnS1Zm7Vx4ZSsw8jl2w5RU/3lvAXesy3lvn63ur+a+J66EIwR8SAENnbS/RrH5vkDwQjr6fWMWpsqmI85ieAK6DdXnhwMEyw4C6OBrORAFa4hgLhZIl8+USkeaH2/Kgz5YH8GrA/mmuJUHZSAImvzi2oIxZgHNblR53pTwOAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yYwhBy8oMa6a6RDLEHPZuvQfGdiGdpe74fonkCuPrbI=;
 b=i4piHAadphC0eCRQewPp/V5ITacbMRvGi4Cqdpf2KdbXr8Zv8Z1f0Pd8PsRYx3TaQBAo2YCw3ez0YdjGS3+tNkWCcm9aI+OzcKOpYbO7/CWXpFfnfbTv8YjnScxYrsJDno5lcX6OYDsjjtIJfbAmVdRsC44YGsnahl72/a33275TLybYjT64Itg8W48B/Tae6FrSvGEQPkttv+3wiBDeIhvjJNa+gMDrKsIBtdxw2v4YFnZKsZXJ0I3GKK1FOJAs4eborWFbgtKO3+sw4rWdxPmsAhXHleSrK18TfNJVCq7nOyBqs8mZ1dbKU8oQkWl+X1/+t8bHEOcWgUTIuhebPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by IA1PR11MB7174.namprd11.prod.outlook.com (2603:10b6:208:41a::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.20; Tue, 23 Apr
 2024 21:17:03 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d%5]) with mapi id 15.20.7519.018; Tue, 23 Apr 2024
 21:17:03 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost,
 Matthew" <matthew.brost@intel.com>, "Thomas.Hellstrom@linux.intel.com"
 <Thomas.Hellstrom@linux.intel.com>, "Welty, Brian" <brian.welty@intel.com>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Bommu,
 Krishnaiah" <krishnaiah.bommu@intel.com>, "Vishwanathapura, Niranjana"
 <niranjana.vishwanathapura@intel.com>, Leon Romanovsky <leon@kernel.org>
Subject: RE: [PATCH 06/23] drm/xe/svm: Introduce a helper to build sg table
 from hmm range
Thread-Topic: [PATCH 06/23] drm/xe/svm: Introduce a helper to build sg table
 from hmm range
Thread-Index: AQHaSZDNP3fdwvIgF0K88ldd8EilIrFZUEuAgAAW4fCAALG4gIAAI09QgAA3bwCABhSRIIAAKiwAgAGpRnA=
Date: Tue, 23 Apr 2024 21:17:03 +0000
Message-ID: <SA1PR11MB6991EDB4351D99B4E76EBC2992112@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240117221223.18540-1-oak.zeng@intel.com>
 <20240117221223.18540-7-oak.zeng@intel.com>
 <20240405003927.GA11940@nvidia.com>
 <SA1PR11MB6991E4CDCD61A5D1909BB4EF92032@SA1PR11MB6991.namprd11.prod.outlook.com>
 <20240405123725.GD5383@nvidia.com>
 <SA1PR11MB699170C0F6FFFA231985718092032@SA1PR11MB6991.namprd11.prod.outlook.com>
 <20240405180212.GG5383@nvidia.com>
 <SA1PR11MB6991A4BD0EDDDF051A9A2C5C92072@SA1PR11MB6991.namprd11.prod.outlook.com>
 <20240409172418.GA5383@nvidia.com>
In-Reply-To: <20240409172418.GA5383@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|IA1PR11MB7174:EE_
x-ms-office365-filtering-correlation-id: b3c2e62b-f268-4e3f-bde7-08dc63dab8b7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|366007|376005|1800799015|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?M48hUT6l3eUzcOrrZKjteYyDYmKrHNgCVVDWgFVcz5Jw06GFLKs5AaPwKD7+?=
 =?us-ascii?Q?Td83UVEQa19DG23p2DruF+bzRvv4Eo6ykhDjdLo5Yoi2rgZa0KpE/Gf0KzYj?=
 =?us-ascii?Q?urA7lw3WtujYE9u759ZaWOmBvgeCGDG5Hx5tZGLrtmPXKWFPPLVtw0j9dIwA?=
 =?us-ascii?Q?/qtisOMH6JPHnPOd4EHjteO42HEGHNzO5Yc6c23aWQedWe7/EuYHLe3S2FPz?=
 =?us-ascii?Q?GQ19ZDPNOyFEwVQuXlBuldEsS5lyxBN4fCMQmX8YoDAhh3nx6RBT6nvih0Bm?=
 =?us-ascii?Q?3yagrpl0RmZkZfP+DHpoRXW6ZuVGD1drx/UxGNyZWGYpDvX4lBI8lZ72ALzR?=
 =?us-ascii?Q?yES/vh+7ad9SLOIJkBfLgt2TGICja/mSM0mYSDeQEmBSditequV7ELUJuDhM?=
 =?us-ascii?Q?aYppzF2IU/1y/mlWwIv8jbfzTK2vPsZyGpSokoHvWwDIoirn8w0Sqxp4bgvu?=
 =?us-ascii?Q?9FCW96dz3wIhIHxhuDfVBP1ExYMonWUnmiwtuYpnHfL505Qv61lUlE2uRUdp?=
 =?us-ascii?Q?VPJglaNMHlj6dCqmbFZNyhLS5QfyM1eUZaP9sAzp6fstFY2VvUFxndGWLKHD?=
 =?us-ascii?Q?4QQnnq2Sd4qn7UAxKWqRCx0tx8PN18zXARX/3sbTfVa7Wfh5/UAMQzZTkEsH?=
 =?us-ascii?Q?OTuxRRwPoBJRhJdq4EyFZvibWfDRgvaq02WaxdwaRQXz+ANKKOa+dl2WXzYJ?=
 =?us-ascii?Q?Wa7+dbxapRLPYQylRsYk2AoDvICY/Y0Gmv6AXncxRu2rExmRgV7kHpdvHd9Z?=
 =?us-ascii?Q?FMeGu4r+z8X+POScDQRMC6SwpONjPerVg7wrnQfRLvMJ+PpkJrMJ1Gd53G4d?=
 =?us-ascii?Q?4LgTq7iobhphj8wPiECG3aSSUGuGQnb0W9ut8MyvRgAzsR4/zyDR1aMfeq/s?=
 =?us-ascii?Q?V9gyBAuNjBvVbCYG74jjQxR4Dj+ivrGffJiYo5HAPgtqyLxpIg7rguAncDmR?=
 =?us-ascii?Q?RE7X0Az0G/4xDa6Rkj/eulQDZoc23YUmMyc4/JTLXwzgYXMW1Uib99i4dPYi?=
 =?us-ascii?Q?27IrwhInXESYoS4EDUwLfMeTDFLstHOskaPEJEuEWYvBQOpVdOC8qMaPbuQ1?=
 =?us-ascii?Q?Zt058LZ9DNjDEOpQJhmhnfgOlSyCdn7lzhoIveM1nriS54mGan0Rss66sh/S?=
 =?us-ascii?Q?RIMG7nx5YKzSnXIBetsMy6Idxggmb9X/Zb30wwB/palZyR5a4hMwbupug0ye?=
 =?us-ascii?Q?AlFfNnu9nbQ5PQIJcfUAecvYS4VDapIM+KLR+KbimmRBPFO9ZrZbIOKlZVRX?=
 =?us-ascii?Q?xJIBK+ZrpT+DgfljXmQnC3kie0zgJaBCUGkD0V+Djg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?x9lmLg5ysoO3VURfvL7zmbh9s6zz94fwJsFWvFCsiD94HKxer9+eP4FnFp90?=
 =?us-ascii?Q?+cKAF1uHzkQ/z6K5esF6nRChl3mJwnkZutihpkXBympGeUttSsZ6fmT+aX0d?=
 =?us-ascii?Q?sB8MMYL1KGAzEFw4RSncQf7cs+YyjtegUSHoCdmiyR/iBeZsq9cWFyE887rx?=
 =?us-ascii?Q?0NhD+Fwd0wjh1MwhpgXVS/e0j3j/UWGEGoyKf3q3hfv6/NgFljDkP3Z0v845?=
 =?us-ascii?Q?0yIWTMndArMW+s8EAdPK8fAQqfDrMgWO88yy6x6+TXga6GZHN5CM+oAv0h1d?=
 =?us-ascii?Q?FWaoiOVfJHWz7l4O9kmQTe4AG9cuGspOVgVdL0OcbcEZ2uRzboxIPZrDYjMS?=
 =?us-ascii?Q?SBunJZtjVgDCiTLcILcLIuRmnZIiziUCsAhDXDnHYILMhZ8uNOS3l78VAm84?=
 =?us-ascii?Q?YD1lXgpJMYzaw3fGfNtRzqeJHpkDg7q1CvSCSQQM/7rGQIuIOpLrKcZ4W79i?=
 =?us-ascii?Q?Ns0eZs+zGsQ6XgaDDLOpsg/qYOFVp+uvYLcGSE0g5Y6Dshg14rESrW1roLal?=
 =?us-ascii?Q?ppeIX3SbXnzOCFVQ8RVj7jI0/+bD96aJYtJS3M5dF5mRnXw1ObZpSbJ7qBx6?=
 =?us-ascii?Q?+sl+AFuZKKVVc7E0JogrqKKBrDK9PJ0jzxv2ShroDzTcM6sObgaJ3uvvRRnn?=
 =?us-ascii?Q?3s/PiwXfZXOhqP1RxAqGL3f134GJrrnoElu055LNo0AFJROOhrJvPF4YIo74?=
 =?us-ascii?Q?3QMlB3faAthhWpbGLlfZJ4zjnaX1fU0zVoFBLaCLI3npSqY2OkljMTe3qRmV?=
 =?us-ascii?Q?UQb79vjY3D+HKcOVu1ZcgyvpWnM/csL6/a4BWlU6ZFiVB8f47eEwWj+jOM9R?=
 =?us-ascii?Q?D1UQUaikipyAaT3EDbqY/Qh5FC+99yqbcstdCeBjMZ64q6Hu7mx2dMJ8JMn0?=
 =?us-ascii?Q?sD2sTiHCx7upOsdrSCv415t+sybW4yex6BtHrIsnR7BvMhE9IqMzyKqYRIdw?=
 =?us-ascii?Q?2U65kxOZKeKJgOQ8ji2A2YoyicLg8JYXGx0ygRUoywG6m++vLVla9HXn2nVg?=
 =?us-ascii?Q?S0USA3r9Cf/SD1IILJdJlx+WzR3vagiXiJs1YPs5tlYyCcsrv6VJMym9eY+t?=
 =?us-ascii?Q?hwflZFWciToTsphfMBXYwPR25KP5wuySkbbSgXVo4KCU5EtUsJsmQJx0rLu6?=
 =?us-ascii?Q?Jem6j1ZpRLEwjzveL3xY1iIGxrLqGl1CVS9RehIJVg7oB6m6KruTH6khyYKx?=
 =?us-ascii?Q?7An39fx5rneGuwTrVKst9JNWMqoL/KV/yx8raEwtS+LuwhoLt90lcF+P3ate?=
 =?us-ascii?Q?nRCvdxeqUaJd+0HpwzpYwfdPtgblaoB9LI8qPwiHt6e9t7wKlaSfYbAb4Ed3?=
 =?us-ascii?Q?gU0lWdGj3iAWOXCu+JbOQCRXH6zOxUPuzFzGrtjtTiDhjUNBGSesLxP1Y2X7?=
 =?us-ascii?Q?dnMEC9kAKVX7ktFyvD3FmbJWuSL7UOBtJIEkCy31pXl7NBcFG9a8u/0hALkX?=
 =?us-ascii?Q?3eJwiIfULdcpQuMLM0D9dnEcNyai+2LP75w7tcsV3QEmN7HQAOZlX5/An8Li?=
 =?us-ascii?Q?uzHu8A6nkzGvVNEDQ1kqm260CnFTafp18WQTxt3tTwZeC+aXkCuTVZJErd9O?=
 =?us-ascii?Q?91igUJSBJMYHf4yjvdo=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3c2e62b-f268-4e3f-bde7-08dc63dab8b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2024 21:17:03.2785 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BlBssWA/nFGJdSz2qfcJJFUjGHKK/6YtdH/egZ80ZW1RUcl791wBkoYl3EVEcq4X0FcGvsSIe0EzrVklw20WSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7174
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

Hi Jason,

Sorry for a late reply. I have been working on a v2 of this series: https:/=
/patchwork.freedesktop.org/series/132229/. This version addressed some of y=
our concerns, such as removing the global character device, removing svm pr=
ocess concept (need further clean up per Matt's feedback).

But the main concern you raised is not addressed yet. I need to further mak=
e sure I understand your concerns, See inline.



> -----Original Message-----
> From: Jason Gunthorpe <jgg@nvidia.com>
> Sent: Tuesday, April 9, 2024 1:24 PM
> To: Zeng, Oak <oak.zeng@intel.com>
> Cc: dri-devel@lists.freedesktop.org; intel-xe@lists.freedesktop.org; Bros=
t, Matthew
> <matthew.brost@intel.com>; Thomas.Hellstrom@linux.intel.com; Welty, Brian
> <brian.welty@intel.com>; Ghimiray, Himal Prasad
> <himal.prasad.ghimiray@intel.com>; Bommu, Krishnaiah
> <krishnaiah.bommu@intel.com>; Vishwanathapura, Niranjana
> <niranjana.vishwanathapura@intel.com>; Leon Romanovsky <leon@kernel.org>
> Subject: Re: [PATCH 06/23] drm/xe/svm: Introduce a helper to build sg tab=
le from
> hmm range
>=20
> On Tue, Apr 09, 2024 at 04:45:22PM +0000, Zeng, Oak wrote:
>=20
> > > I saw, I am saying this should not be done. You cannot unmap bits of
> > > a sgl mapping if an invalidation comes in.
> >
> > You are right, if we register a huge mmu interval notifier to cover
> > the whole address space, then we should use dma map/unmap pages to
> > map bits of the address space. We will explore this approach.
> >
> > Right now, in xe driver, mmu interval notifier is dynamically
> > registered with small address range. We map/unmap the whole small
> > address ranges each time. So functionally it still works. But it
> > might not be as performant as the method you said.
>=20
> Please don't do this, it is not how hmm_range_fault() should be
> used.
>=20
> It is intended to be page by page and there is no API surface
> available to safely try to construct covering ranges. Drivers
> definately should not try to invent such a thing.

I need your help to understand this comment. Our gpu mirrors the whole CPU =
virtual address space. It is the first design pattern in your previous repl=
y (entire exclusive owner of a single device private page table and fully m=
irrors the mm page table into the device table.)=20

What do you mean by "page by page"/" no API surface available to safely try=
 to construct covering ranges"? As I understand it, hmm_range_fault take a =
virtual address range (defined in hmm_range struct), and walk cpu page tabl=
e in this range. It is a range based API.

From your previous reply ("So I find it a quite strange that this RFC is cr=
eating VMA's, notifiers and ranges on the fly "), it seems you are concerni=
ng why we are creating vma and register mmu interval notifier on the fly. L=
et me try to explain it. Xe_vma is a very fundamental concept in xe driver.=
 The gpu page table update, invalidation are all vma-based. This concept ex=
ists before this svm work. For svm, we create a 2M (the size is user config=
urable) vma during gpu page fault handler and register this 2M range to mmu=
 interval notifier.

Now I try to figure out if we don't create vma, what can we do? We can map =
one page (which contains the gpu fault address) to gpu page table. But that=
 doesn't work for us because the GPU cache and TLB would not be performant =
for 4K page each time. One way to think of the vma is a chunk size which is=
 good for GPU HW performance.

And the mmu notifier... if we don't register the mmu notifier on the fly, d=
o we register one mmu notifier to cover the whole CPU virtual address space=
 (which would be huge, e.g., 0~2^56 on a 57 bit machine, if we have half ha=
lf user space kernel space split)? That won't be performant as well because=
 for any address range that is unmapped from cpu program, but even if they =
are never touched by GPU, gpu driver still got a invalidation callback. In =
our approach, we only register a mmu notifier for address range that we kno=
w gpu would touch it.=20

>=20
> > > Please don't use sg list at all for this.
> >
> > As explained, we use sg list for device private pages so we can
> > re-used the gpu page table update codes.
>=20
> I'm asking you not to use SGL lists for that too. SGL lists are not
> generic data structures to hold DMA lists.

Matt mentioned to use drm_buddy_block. I will see how that works out.

>=20
> > > This is not what I'm talking about. The GPU VMA is bound to a specifi=
c
> > > MM VA, it should not be created on demand.
> >
> > Today we have two places where we create gpu vma: 1) create gpu vma
> > during a vm_bind ioctl 2) create gpu vma during a page fault of the
> > system allocator range (this will be in v2 of this series).
>=20
> Don't do 2.

As said, we will try the approach of one gigantic gpu vma with N page table=
 states. We will create page table states in page fault handling. But this =
is only planned for stage 2.=20

>=20
> > I suspect something dynamic is still necessary, either a vma or a
> > page table state (1 vma but many page table state created
> > dynamically, as planned in our stage 2).
>=20
> I'm expecting you'd populate the page table memory on demand.

We do populate gpu page table on demand. When gpu access a virtual address,=
 we populate the gpu page table.


>=20
> > The reason is, we still need some gpu corresponding structure to
> > match the cpu vm_area_struct.
>=20
> Definately not.

See explanation above.

>=20
> > For example, when gpu page fault happens, you look
> > up the cpu vm_area_struct for the fault address and create a
> > corresponding state/struct. And people can have as many cpu
> > vm_area_struct as they want.
>=20
> No you don't.

See explains above. I need your help to understand how we can do it without=
 a vma (or chunk). One thing GPU driver is different from RDMA driver is, R=
DMA doesn't have device private memory so no migration. It only need to dma=
-map the system memory pages and use them to fill RDMA page table. so RDMA =
don't need another memory manager such as our buddy. RDMA only deal with sy=
stem memory which is completely struct page based management. Page by page =
make 100 % sense for RDMA.=20

But for gpu, we need a way to use device local memory efficiently. This is =
the main reason we have vma/chunk concept.

Thanks,
Oak


>=20
> You call hmm_range_fault() and it does everything for you. A driver
> should never touch CPU VMAs and must not be aware of them in any away.
>=20
> Jason
