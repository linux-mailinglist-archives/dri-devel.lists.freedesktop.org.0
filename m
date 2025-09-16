Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E498CB59CE2
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 18:05:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CEA810E398;
	Tue, 16 Sep 2025 16:05:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UUcMeCMX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C73D10E15B;
 Tue, 16 Sep 2025 16:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758038715; x=1789574715;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=i2lp2Y0lVxgYsk0nYwe4Pbai0Tiiu7LdKG+dR+dcEyc=;
 b=UUcMeCMXJooMRYhJzPDFp3Y6RgBybzPkMsjy6jksw+UzUWv7Vng0p8ij
 vmBLTQva9xC214hADI9FLt/Xvdl5WEmL9mVcd8mVSHFFr0z59U28q6Hn7
 RM6DOHZRqZB7cU4vvNKJ0zZ/BwCgEpwA5xLzkOItEkOblLyzCxg+zufdL
 sb1sPNte5m53Yn44dmW0Dud7OHqQm02dw0oXzrlCXX1OVXKp9jNY09cBg
 XVJLAoTxvGE/5cAcx8gtKsk5fzVeCKMV3vwjyvsWDrZPJ5PBJz5KbM8FY
 nSxQ/6FBsI+/llYW67Z4UUQJlaAFhnTQpyJiAwsz9FDQSCWP7xD5m9MTf A==;
X-CSE-ConnectionGUID: UXxyPZGATnyPcYWuP99UyA==
X-CSE-MsgGUID: 8+vceYRNTL+13jllkfdymA==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="71424105"
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; d="scan'208";a="71424105"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 09:05:14 -0700
X-CSE-ConnectionGUID: 6/WxsuqtQPezFZXXkx+Ktw==
X-CSE-MsgGUID: doPem68oS2+wQyPU17/JXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; d="scan'208";a="174545667"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 09:05:14 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 16 Sep 2025 09:05:13 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 16 Sep 2025 09:05:12 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.21) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 16 Sep 2025 09:05:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LC2eyAdj/1ViemBevsA3lZ9CKEoUmOG8KjtIH8/RvnZhVoQ+84y/wg8ei78t6J3Ius6FRsnCGmmUmr+Io8Dapv/PsTgznWilR5wJ5vhuzZExJ1Lo85BayUFWD1Y4O2zIKPq+Ph0LncRkl2lxqb+0TxkkN/MzOx6WmKcC0RdsDlWfkCrz4/qp4mZrPF5GbjYrhNmSmGVCj41fSskDYNZkDH6vEljzYxG4lHFx6/xk7NdVX5c8xLulnMsZFeJyqDo3NVP7rKm5VAlAliiupsuq38dWrKMyhi3pTn4WbfXhPIW4tGOXNq5SqLvWvezjQi2XKQbM6fbNMBS8hQtlBJu+0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z8xk0/CCowLriTR9R1lMWO/SwsJR6Elci0qKL58SNiQ=;
 b=Gs7fjjhnOE7BqCPSlNPJQmspSFO55zfeZpNm7XYHfJWuwmF4Kgl76FSmlmaW0bopflbgc2agu9lqTcRdJkstghiJX8B4PQDCecFe2DB5SgmC3UKgBPIwxkymCb1xWcFM0T2xHr4xzF5yMd2PEXUQM4m4VW4PBm4rRuig7UFVmJyv+0T8dECmOa1l60Yis6RvbM03b1SHxumVJ19FzNOZDO9ZjIg90Su46xun3zA+Jh2NAy1BSVDVr6kcO/C+ljOfyPkOZQP/jd0mH5ZPPG2cEh9XiQasWNKU0GA0sA3E+HYjxRtf7YogtJPcJprQu2HcTvu5S+i91ZA2+dE3t/wbRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by LV3PR11MB8693.namprd11.prod.outlook.com (2603:10b6:408:215::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Tue, 16 Sep
 2025 16:05:10 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9115.020; Tue, 16 Sep 2025
 16:05:10 +0000
Date: Tue, 16 Sep 2025 12:05:04 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Andi Shyti
 <andi.shyti@kernel.org>, Ilpo =?iso-8859-1?Q?J=E4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, <linux-pci@vger.kernel.org>, Bjorn Helgaas
 <bhelgaas@google.com>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
 =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>, Alex Deucher
 <alexander.deucher@amd.com>, <amd-gfx@lists.freedesktop.org>, David Airlie
 <airlied@gmail.com>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>, "Joonas
 Lahtinen" <joonas.lahtinen@linux.intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Simona Vetter <simona@ffwll.ch>, Tvrtko Ursulin
 <tursulin@ursulin.net>, ?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, "Michael J . Ruhl" <mjruhl@habana.ai>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v2 06/11] drm/i915/gt: Use pci_rebar_size_supported()
Message-ID: <aMmKsOD5erCHLAY3@intel.com>
References: <20250915091358.9203-1-ilpo.jarvinen@linux.intel.com>
 <20250915091358.9203-7-ilpo.jarvinen@linux.intel.com>
 <b918053f6ac7b4a27148a1cbf10eb8402572c6c9@intel.com>
 <ewypjj64siaswcfvfzgxihwrflb6k6pz2mrfuu4ursdldwnqlm@ignlhd73keck>
 <aMhzougLzpfw2wWw@intel.com>
 <58fb988207c4d5c5ba25338c1281189e12c009c3@intel.com>
 <77b76efa-60fe-4629-8828-5a56b254a92b@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <77b76efa-60fe-4629-8828-5a56b254a92b@amd.com>
X-ClientProxiedBy: BYAPR06CA0023.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::36) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|LV3PR11MB8693:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f28b6a7-f7ac-454e-0b9d-08ddf53acfdc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?QEyNksrHxxtt3JCBx0UQk6qlsC4hOChc1xWVf+l1prYE2d7aPQZjVwI4x7?=
 =?iso-8859-1?Q?uc6JTfEF4PET+cNYEsjw7/yySq1KCzh0e0ilSdL6nMFFj9Apw9DowTSKt9?=
 =?iso-8859-1?Q?Dryp2SlmEIX3QP49d8+GgYfPbQdvwwlPhql/YJwKo+2SR0oWD/B9ymoata?=
 =?iso-8859-1?Q?isdQdXuM6xUuDendX8p5DVho/QcqoapM7yUN0hVPbaLAB7GaY3ZqX0MBht?=
 =?iso-8859-1?Q?cA8y8vGkDa9bljrUFdzJ1p7p1d+Tq5M48VcCVyS0Gk5S3WwP16rlF+wKBw?=
 =?iso-8859-1?Q?//RLEYSKMf3i/0nTbklO4eUmUGDc5pbNgiU6ediA5fgRLiApCnr++Ynmmw?=
 =?iso-8859-1?Q?58UhveU6A6wx4vnLELet/1/kw1ZirPlgJ3ICSsKnHCfN8Has73XK7IhqQw?=
 =?iso-8859-1?Q?vFrHuelExtlbWaVlTCqR0sDFPDSYSrq67IUwBMIcqXMiurqlwYyQ+OFLl+?=
 =?iso-8859-1?Q?WqTX3TNvt9qdicZqNPaIRm3G9HTfHLL4ppKceMBexrUAExu1SiyG/TnG9w?=
 =?iso-8859-1?Q?lGqLI5eYIC0CWwxXG3CfdVFW0hxHLPobaf5Vr5MzdcTxi4USOycJYdoVMm?=
 =?iso-8859-1?Q?Ars3jCQQHpRKExEW4qizH2G4AN03a6dQa7qjSDWs/pEK+9FNvza4mg14Hg?=
 =?iso-8859-1?Q?WteRbKGCZlqf7fZ49zLmTxbW8x5jl0VZslfAQAbmTOD9gpqlwwCQj+1fRi?=
 =?iso-8859-1?Q?0BaVdlp4lrRrl3RMVqzfX+U0/nspMYGqr+Cdt9Uoo5rnUiw0hOsq4e/NOU?=
 =?iso-8859-1?Q?TViruRrhS/QA3ubVY1bOUVxqNPjL8A2tregaLrLGaHcIcInqBj+oGO8xBc?=
 =?iso-8859-1?Q?N2eAbzMjGqFkhbAj6jHOO4QQq69rT7qG86gDPHflr10Fki6s+NVVra9n8M?=
 =?iso-8859-1?Q?PHcaO2HfJAamo24o7pbqtytsbD5cfxp2nNCUakPNSMbGKooGGyUDMtKWnA?=
 =?iso-8859-1?Q?V/5x7Jt5H8YKZCdElCq8YrvDGLdXVZHp53kZaQsvCor7DTiK+q4woRIGyz?=
 =?iso-8859-1?Q?pG1FzzqJaIjA5fWCg4+MT8AzP//loy5IKbBk6UKlGfp07i0XIuRzz6lYe2?=
 =?iso-8859-1?Q?CvyiEN+nhsOoXa2CaC+2JB6u43NLSLtNr71OiIVMBatccJTKCrC48syKSw?=
 =?iso-8859-1?Q?3uWcQGaZGSPBnk3obqQq0P0x10dZQ8B3HMzIvYNAbMWJNzzpTwF417Tlo4?=
 =?iso-8859-1?Q?8Gmi629zBErrQt8aWxp4fV8LGhDSriy+JoUmY9VZ4L/0JUJIaETGXri6Ds?=
 =?iso-8859-1?Q?YATAq9BgGo8GX9tVx2WjWqINqichIKNULxZwojFPmEt/whaztL3V6WAqV9?=
 =?iso-8859-1?Q?FAEYlCqRDAB6J5oVU2g5LJvvXJsGeTuUEyo4S+tQqTS1B31sqNCWpzXrRG?=
 =?iso-8859-1?Q?uz+aWYHOWqXrRx2PKzPA1Ut4dP7SxfJSgKrPtbL1w8iXBFmgIZr1VOYzSa?=
 =?iso-8859-1?Q?3D7Oj4bByeBq2YeCBVWlgPBcrztNbD8mJNF3+5T+Fc+eX0NkZLeGzld1Vk?=
 =?iso-8859-1?Q?g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?OmqX18BX5dUlSY1CRn1otmsPS0/RloG8lRMBaus6w1zlHbPWbQUSn9Qp82?=
 =?iso-8859-1?Q?DkKDh3xlCAmpkjRbaIYw8U+7tMLrk/h7IvVT13n2RHAr4ln3jeTaAYvU9A?=
 =?iso-8859-1?Q?qEfAz3fPxXTk1sWQBpp5LJ9/EvpWbOf8y6JYSTCzweupbqo+wAGk6fgOJJ?=
 =?iso-8859-1?Q?dQx9HqeSlJJ+hvcO5w0pmN4IrQ1yrnKvbqketeHI5eLpESGnlmqrwuxH/1?=
 =?iso-8859-1?Q?gmtd48boXLd29mIHhqjD1G+xiKWYAWYU+453nz1itbis+f3a7ltzE94SPY?=
 =?iso-8859-1?Q?jRf+PAX3n1JdE4snCCK6D8jN+oMhiIO9mHLgxsEHdWjHOKowZkSNCM27gk?=
 =?iso-8859-1?Q?OuKs5moED6Ha/IiG2uePs4NZiaFq65vNVs49BOWK3M6rbdCIRndU0a3xtd?=
 =?iso-8859-1?Q?Ac9Jd+N8tvrUGg9kCsm9mjS/NynYfbHYXLuSjiINZ3zJtwcxgDTNpi9Z69?=
 =?iso-8859-1?Q?xEmiKjgAbappgpzhjbOXLfZofMWduqnkeaAebOTSZdBbo/8PZDxLa3KmqA?=
 =?iso-8859-1?Q?C/UdRj8ZlQ26lx3vYFknlkRu5CQXExEuGM+bIvBiPDoA9iDI+OPbGLgSLt?=
 =?iso-8859-1?Q?Akav8bbcQI4KG8r3Q+wc51pOEJXxJt/9hVQ348Nv53thymBe4mPGwSGqTO?=
 =?iso-8859-1?Q?vDKOe6DPoxxqOcyze5zmgxhMCQjM7nCV1be7Rm9FRTnlU98EGUP6Bw02qI?=
 =?iso-8859-1?Q?5SljzApCnWhfzTTDAZc8rx42K9JaWtS7bxxn5mhbe1eEg/vKmao1yGcxnC?=
 =?iso-8859-1?Q?CKahkIl4V1NzWgELkNU+u7EJ2Nd+H+ilw8xoESpKJu5e5SMmUWRxJsYCrH?=
 =?iso-8859-1?Q?HfqVHUSPaNc6T8DNH23iV3tvS4ofrrXbjvnscvdMb3nL3N7JgWI3e63EyN?=
 =?iso-8859-1?Q?fj+z0da0WRN3TQev4cniUSmCea11SY7AgBJgAqBwYn0UrsrCvQWYT7Us9H?=
 =?iso-8859-1?Q?gz9+4TO318qSpH6Zn1fE812HvWQT89G3XH+ruNFwd2reOOZPejO3E92zr4?=
 =?iso-8859-1?Q?ncCsmbTaIpXhqDlnfr0OopGqHYm5/SN9o1QYWQE+Ql1HU5sSa1V2L71zOw?=
 =?iso-8859-1?Q?uHxCOo+++T17+9co3eBXPfE/PFUSCMPpurCWTFGvbfaZ7V4A4NJCwuy1oy?=
 =?iso-8859-1?Q?tbN0+Md6hoQZqYHrIVdYZf+D1EK2RO5/KVSeWxeUgOBoywVIvjpd7m2jJx?=
 =?iso-8859-1?Q?/l+IbpJh9lUv5sP4lQpJJ+9emIlfRWFhvaLxuxzBopDUUfjHrtSP28e93l?=
 =?iso-8859-1?Q?eht1gzlfDbO9zy6441fX/aUBSNUFKnw3zngGmXnkujR5iE4/No5He62Ab5?=
 =?iso-8859-1?Q?IwD8u970qungLwIZuFqb8M82rIP9dzOrAJpH9/B4OqlptfGVVbUWJAxKM6?=
 =?iso-8859-1?Q?nZ57htDCyEQ172hlXdFqBaXN0jxtXfRjfiLAClwXpP76Y9VAwFd6Mn6NQr?=
 =?iso-8859-1?Q?qLyJZdegbZz61a3azXV1mfOq5CiZnsWwXRw5Kis7WBxsHVP5yObMyIN25I?=
 =?iso-8859-1?Q?fkyYxpBLOO/9ntl6FPUFflgDdY+8VpoB7KUjuiZr7ssr4vX3PBw+JfDYB2?=
 =?iso-8859-1?Q?MfjFyqJ6Vs11yHac2D53DYY7Yum3rXkdjotzkqWoyElJC/Ott1kbhcaN12?=
 =?iso-8859-1?Q?DGFa/rGZTFwPdrDqLz39+MCs2HZHutxh1OFT5LB0q+6mBim5e4Y+LzJg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f28b6a7-f7ac-454e-0b9d-08ddf53acfdc
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 16:05:10.3484 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GNKRqn8hpCpznVqjAn+SWZsZfnFipjNwZykU2LVvcK0PKBkFt4l6B8buiF7UD3OwdkCKlICIOQa9+XhUH6p++w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8693
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

On Tue, Sep 16, 2025 at 10:57:24AM +0200, Christian König wrote:
> On 16.09.25 10:12, Jani Nikula wrote:
> > On Mon, 15 Sep 2025, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
> >> On Mon, Sep 15, 2025 at 07:24:10PM +0200, Andi Shyti wrote:
> >>> Hi,
> >>>
> >>> On Mon, Sep 15, 2025 at 03:42:23PM +0300, Jani Nikula wrote:
> >>>> On Mon, 15 Sep 2025, Ilpo Järvinen <ilpo.jarvinen@linux.intel.com> wrote:
> >>>>> PCI core provides pci_rebar_size_supported() that helps in checking if
> >>>>> a BAR Size is supported for the BAR or not. Use it in
> >>>>> i915_resize_lmem_bar() to simplify code.
> >>>>>
> >>>>> Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> >>>>> Acked-by: Christian König <christian.koenig@amd.com>
> >>>>
> >>>> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
> >>>>
> >>>> and
> >>>>
> >>>> Acked-by: Jani Nikula <jani.nikula@intel.com>
> >>>
> >>> Just for some random noise on commit log's bureaucracy: why do we
> >>> need both Ack and R-b? I think R-b covers Ack making it
> >>> redundant. Right?
> >>
> >> reviewed-by is a more formal attestation of the entries in the
> >> submitting-patches doc, saying that he carefully reviewed the work.
> >>
> >> acked by is to state that from the maintainer perspective of that file
> >> the file can be merged through any tree.
> >>
> >> in the drm trees nowdays our tooling is enforcing acked-by tag if
> >> the patch is touching domains outside that drm branch itself.
> >>
> >> if a committer tries to push a patch without ack from the maintainer
> >> of that domain it will be blocked.
> >>
> >> So I believe it is a good idea to keep a separation of the meaning.
> >> Carrying a technical review of the patch in question doesn't necessarily
> >> mean that you, as maintainer, is okay of getting that patch merged
> >> through other trees.
> > 
> > Yes, all of the above. I just wanted to be explicit to avoid the
> > follow-up questions "thanks for the review, but is it okay to merge via
> > pci" or "thanks for the ack, but does this need review also", and move
> > on from this whole thread. (Which is a nice cleanup, btw, thanks.)
> 
> Mhm, that's a really good point.
> 
> My understanding of an Acked-by by a maintainer is also "go a head and merge it through your tree", but I think we never formally documented that.
> 
> At least I can't find any reference to that in the "When to use Acked-by:, Cc:, and Co-developed-by:" section of Documentation/process/submitting-patches.rst.

"Acked-by: is also less formal than Reviewed-by:. For instance, maintainers may
use it to signify that they are OK with a patch landing, but they may not have reviewed it..."

perhaps we should simply

s/patch landing/patch landing through any other tree/

> 
> Regards,
> Christian.
> 
> > 
> > BR,
> > Jani.
> > 
> 
