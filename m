Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F79DA45414
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 04:39:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3218F10E0F5;
	Wed, 26 Feb 2025 03:39:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ipyhk/Ls";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97D0E10E1F0;
 Wed, 26 Feb 2025 03:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740541162; x=1772077162;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=lqCL90qbwCXf/ZG+coSqmo6Vf06x0JE7IIyeY6JzOO8=;
 b=ipyhk/LsCI1sP8eNVZmDaHYvdjoyAaRiToKzL9QI7Ccohn7hfEbSCMTt
 rSsSkFuJqBzz7I5dgVBTRJeCMCLZOXP+GGQyYbE007a1oWIxp5mJ4UIsF
 PitKtSLjBqZMuKMuJVaq+s+NqquyY3mxGv63tHYePutnfUpKy4uBVfD9f
 +cN9F8VldJA4ByJYs4NTLIBlkP7LUKkn/CBvYV0DoP+nSvXzWDTU3tCd3
 /Vvky+6nCPK115pEGNljv0tFw0B8VkGleNKxtx8BKTE7Tp55RtNoJyn8V
 H/JIVUoh8GmiBZeWlWYYE7e+mglSYzMUUMdl35QvIG6+HYKbj8fBQNipS Q==;
X-CSE-ConnectionGUID: mBEQFjfXSUyAMbIzLyyBMQ==
X-CSE-MsgGUID: 5wLCdX+OSiKP4eGBS+BkDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="52009176"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; d="scan'208";a="52009176"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 19:39:21 -0800
X-CSE-ConnectionGUID: aHwqv7d7TQS3GJhlzj7o1w==
X-CSE-MsgGUID: W7AffQ0uTz+QtKxxyS4Ybg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; d="scan'208";a="139810400"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Feb 2025 19:39:20 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 25 Feb 2025 19:39:20 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 25 Feb 2025 19:39:20 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Feb 2025 19:39:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XMTKRUUamtQmm5UUb2hCcKshL6yQMlEC5C/VL9dJ7tgGysCgSSRtquTL0P6jQDhGUs3A5ezKhR3ZpQuJEL9sEkb2oQzGNLl66lZM13P1ucvHW1hnA+Oy2yt0fCUAz1XpH0SKTt26cMpiUNcGeJNaBFF4f1QE0LoDmYPbSFug+9OaYsp2h8+EsvD5Hm5T2LrL4lY1j0BcyqdyFZ4zJYAsrWvZl6rYHfqZ+t075FpjSocT+d5rjvab28+KddqYfVKV8eYogjyQ5NCw9kqxYb55yl/mbDOPVlXgz+gZJPuhP3AcnlcSnlFBvU8OW+2XGmx7Hz1M1aXl39F6oLqmBLEyBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kW0iNTlFTqM/xqv/qdZfu1cMDhVfK+Fbe2KxPV8nhqY=;
 b=CzmHFILc+5IReF/eC1AgONUJjN0pVyfkzb7X2QDgoUQrt5sldOmD+Yd4rYfKYexipRf7kX4m8gMefPTQABFfa8JJLyb9ysKsqo94YebRnVpRabKcqjiLP1o5tfNDBTSlHWCuDOdFju9bIhScQlphLyCTaGoWdhNHYfdbFNSOB+oPX1mT6jLfL3UuCWuFF1N1ABEhb5fYU8KM7HLzx2eMD4VuGD0LoVuJi6kESQ60T30UW9qc4S0r6Ne5bodnsryi9/A0yEiFYL2G0Lp/nBROFo62tcx/SIKeVLmt05k4+IvywlzUoaK6Y+g/DKP+jn5wnhAue83zUHO5iRwtliUKwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB8185.namprd11.prod.outlook.com (2603:10b6:610:159::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Wed, 26 Feb
 2025 03:38:44 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8466.016; Wed, 26 Feb 2025
 03:38:44 +0000
Date: Tue, 25 Feb 2025 19:39:47 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <jeffbai@aosc.io>
CC: Lucas De Marchi <lucas.demarchi@intel.com>, Thomas
 =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, =?iso-8859-1?Q?Jos=E9?= Roberto de Souza
 <jose.souza@intel.com>, Francois Dugast <francois.dugast@intel.com>, "Alan
 Previn" <alan.previn.teres.alexis@intel.com>, Zhanjun Dong
 <zhanjun.dong@intel.com>, Matt Roper <matthew.d.roper@intel.com>, "Mateusz
 Naklicki" <mateusz.naklicki@intel.com>, Mauro Carvalho Chehab
 <mauro.chehab@linux.intel.com>, Zbigniew =?utf-8?Q?Kempczy=C5=84ski?=
 <zbigniew.kempczynski@intel.com>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Kexy
 Biscuit" <kexybiscuit@aosc.io>, Shang Yatsen <429839446@qq.com>,
 <stable@vger.kernel.org>, Haien Liang <27873200@qq.com>, Shirong Liu
 <lsr1024@qq.com>, Haofeng Wu <s2600cw2@126.com>
Subject: Re: [PATCH 3/5] drm/xe/regs: fix RING_CTL_SIZE(size) calculation
Message-ID: <Z76NAyPR6sDVQWfo@lstrano-desk.jf.intel.com>
References: <20250226-xe-non-4k-fix-v1-0-80f23b5ee40e@aosc.io>
 <20250226-xe-non-4k-fix-v1-3-80f23b5ee40e@aosc.io>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250226-xe-non-4k-fix-v1-3-80f23b5ee40e@aosc.io>
X-ClientProxiedBy: MW4PR02CA0025.namprd02.prod.outlook.com
 (2603:10b6:303:16d::11) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB8185:EE_
X-MS-Office365-Filtering-Correlation-Id: 81e9ab70-6a06-4de7-e067-08dd561711ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?U8JO1ZhppFj1tKm482AjVAgDBirPqkYokYi/CI1dPxRgfo0CmU6XREmn3UEs?=
 =?us-ascii?Q?loqmBD9uwE0gr7terYxLo1Ar8KyNOzWRwqSfza0ZXVxi4MKgRzWBfwqDUQLP?=
 =?us-ascii?Q?xjYdy9ldcOgFftmrxtFXU+epa1bLtauwt5n6FEjGEinPlfvfZ7HgOnChO+F4?=
 =?us-ascii?Q?YM28QgdLt/CY+uUO/YK6nCCZiDP7zlXU9lmTj8ehfXtmb9iBWK7u6xx6mKf1?=
 =?us-ascii?Q?cKMuvVVR9n+wgt+u+4VygPDC+j6dcYVHju5Q9YXqo/jZ2S0kaMGUbMJ/EyV3?=
 =?us-ascii?Q?t8Nr+UDel/aSTke6W3c0kMQ/USeAhua8CG1vOYnRM21ZRpfeqfMFEVPb+T1W?=
 =?us-ascii?Q?0oXUO2lH+TxbShGkGQKIZN5X6f71xJtqryuXX66+Gtd2Ouf1UhFHN0cz3NTF?=
 =?us-ascii?Q?yHVWS1VwqjUrsrT/G2tY5Z707ZOxVDCCPCqcuSWWOdYt4hZTuNLaJwJMhbJt?=
 =?us-ascii?Q?lJi5DKGXixpXFssQz41rErgRlDSNgJpzhvQbS8EGYeNeZ+2Qd6kX7g9TBFy3?=
 =?us-ascii?Q?HtzFV524jA6BaHk8SSqEwTgTrc0k7kqDhwkNddIadK81BoAeCNe5AwMqS3d1?=
 =?us-ascii?Q?nVisr4UFaGD9Kn57g8Kg6tN+U5/IsId6J5hZLsOKkyTn0DcDuDOcZHpa1RuC?=
 =?us-ascii?Q?fam2lXSWxnCgfh7RlQF+0v7+WHzTLKrBqf4eqosyuo3Yqqy8sV/snjnvHjv6?=
 =?us-ascii?Q?eS/ymZ7PbJInK3ww5CqjxLxUlmb8MyYZ7uE8v45CevTNvewU0ONuDTIlGrri?=
 =?us-ascii?Q?ePh9ROPTDRrpKpmhN2bPrqMiRfPzdWrENN/lNxFBS98CtfkhgDiP7PNrhWWi?=
 =?us-ascii?Q?t0lIGrhEiZLU2NRSd717aX6wl/5sv93zGHZ83YqmssNAy6tIRcnqapvpbtNf?=
 =?us-ascii?Q?15lH4S0f7lLgHURggIM5C94JBPTIjUsntavRS9W4JdAdOhByZbdjJAxLdtRb?=
 =?us-ascii?Q?X8XKGbOAC4FNCb1jww/xwljwWTyBxKnvDssApU/umBdjQH7o96RTK41cxh9U?=
 =?us-ascii?Q?JFuoxwdENTm2IjPFpg3+wokJvors5uOIqKbo53fKS4JtKIsRCumYgAHbXK4B?=
 =?us-ascii?Q?CvGmfJfDPVK9HUJM+8AQ4HtPZQYDltYTroo2VyYX4BiE8qiQGECb0dTOiR3i?=
 =?us-ascii?Q?lV21A9i6BXigmBaico3CvOkzHjEa0Vu0Zn1VdalGcG4Bvdh9E8GV3hDexjeL?=
 =?us-ascii?Q?4ugHJOyiapbC4zI29zjTT3N3jUqEFuUyJKG4ciqI5B0har7dFU4nupya6mRc?=
 =?us-ascii?Q?CZQHtgF4W0k2t5UCkz/UpTOQKs4XkNkguz0KZcvzfi4mMiblnxZInAs9ePtE?=
 =?us-ascii?Q?ha0pBOxv1Par8aDhWSbfKtql9w+gSHdiOrxwnjrlLq3i9zXrMELryeSRYJoA?=
 =?us-ascii?Q?zbmeYsh8PP99qNZycuYA7a6Z9s2h?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?k0UGBdTNz+sfhwqZawY7/+NSvnMe9umZ3T+u+zpT43jxi+0Kc6gUev/zPutv?=
 =?us-ascii?Q?bsWcXYq9NilnnbWBBHzE8YlzyZz63XZYMtCLjH1skfmenfoUIqLutpVpOXRY?=
 =?us-ascii?Q?yXrX7SOueei4nehuelWj+lGihNC+JzOX0Y/m5eDRranvjrD4LP3SoJuetx7W?=
 =?us-ascii?Q?nWKLysNTIANY4lCIez7NFmbnlJgkG2OA9vzCS2FD9Q5sDIRsQeD4Xgwu81vV?=
 =?us-ascii?Q?AvmtRRPxmSM5CapJw/vUqFVAoEWd8XxQj00y6GS8CEaWLcZQH29eAWzZXBKG?=
 =?us-ascii?Q?YSHHTAqXmvnuVMCzzKjXKe8Wzz6K3tBIaSirdrsVPRZwiCA6zF8WvWl2GMhO?=
 =?us-ascii?Q?q27nFAP9Kdih6l7mv4KzxZDvnSt+grjH559JJlsEHirB3nI4/i2XvFqoNlWg?=
 =?us-ascii?Q?zPQL+lnj4UKwG2pjSDfWh4JJPU8h5Thetbeyb1waGBUenx2EqrjQsLo8/C5z?=
 =?us-ascii?Q?9u7gmiPaFjz/bHHJ652/uR1+dMtpWYWbqzoyhAw+r+DafezoxYEIwonvKIUw?=
 =?us-ascii?Q?k7VGfAbiUCSkSCBeF5J3DoinBUxQIdz1ln5Zu48oGuuMISFPEB1Hq9Cwxlt+?=
 =?us-ascii?Q?3L4AWXEtzjvxK/8NIYq/6CWz+BeVyG/GoBA+/vHXYy6Jmuk6dONemNP0VWjg?=
 =?us-ascii?Q?AecBJyME7jMBWFLKTA1C+BhuRLQtBYdyIwp4njxqLgbiM+1ahiw77bD/9Z0H?=
 =?us-ascii?Q?+K6IAdIuagAL1miK6o+xZRialTpJ9yExniNrB7x8pd8lAqVS6EozXNNE/jDm?=
 =?us-ascii?Q?lLrJYx/hIQWobPfOOf7RhVbhwn0IDKbWMYCcNZRw5y4ko//f1LPXXzG9F4h4?=
 =?us-ascii?Q?9B0lK60yKC5GhGK23BS7IvF2wdoReW5mHJKB7fSwjdUw4XqqUlt63RludO7H?=
 =?us-ascii?Q?zY44tQ4DgLeBt2qo/s67uCHxRhdLikCeeykYfh3zZe6CkyDUrXhyOAnWKH96?=
 =?us-ascii?Q?Fp81jfPQX651susJgINI5EO8aNFa4ovD9j4tadnO9rrSIZXgQI8nKByNH+bh?=
 =?us-ascii?Q?vKJxz9kN2R3t2PBU293IQZqzFWW2v6eJ0MVCFCMnm0wAmLPtr/q2PfraYrsn?=
 =?us-ascii?Q?8esLxa4PidPis6PmOXQM1E9/EWJR/GKLuzFlkhoiXyAAXMVzk+cNtpkAaclh?=
 =?us-ascii?Q?eUKUFl1Lca3B6SFvApHY/+OGv/crT9J1H/4NdrUBH8iDAYxfENOPT+ZpUmNI?=
 =?us-ascii?Q?MErbrC1d2BHs/UzPD6zXDohSMNPumflHjoIwXqZRvzzzljFIbZsH3Iu+2ZQG?=
 =?us-ascii?Q?NXlSn9c5j/zLG6NGBXjsvMgj/YLNZl9nkH0qAepFv6OM/RuUulDJySBkGahQ?=
 =?us-ascii?Q?9a6cQ9X9NG0ZxiMa3wjHP19h+eG5vzWRkmTKDO66UItwvgW3v5mxGBK8Qqt3?=
 =?us-ascii?Q?naRJvNGwXJXUtQowODogO7cC5lPxvPxgYqVdhgeiySb1DK1nS6HCdfW3xCnC?=
 =?us-ascii?Q?HHwbYNApbq1GuwCqiogaUaRZmz+61Rg5BTaHnbQ+Z/43iVhW4t/Z5MWiA4sN?=
 =?us-ascii?Q?KcIbbgiYa5J+QiiIpeCy3p+3TY8SKqbM+zmhouRQ91GoxGpYW+SeSqpfcNaH?=
 =?us-ascii?Q?5gxrPqf4OmN6PoB1L4yhbNiqzxflfs3eAYzeOsel78ohJHXReFxyp41UJpCa?=
 =?us-ascii?Q?UA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 81e9ab70-6a06-4de7-e067-08dd561711ca
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 03:38:44.0920 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lMpjN1lA10TRSzd30C7yjltnAL6X7nN3hik7LsjWpPTlVCxsavNT1kIwXUpR6ntaL15JxZHVUUUowu6S7kGG9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8185
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

On Wed, Feb 26, 2025 at 10:00:20AM +0800, Mingcong Bai via B4 Relay wrote:
> From: Mingcong Bai <jeffbai@aosc.io>
>=20
> Similar to the preceding patch for GuC (and with the same references),
> Intel DG1 and DG2 GPUs expects command buffers to align to 4K boundaries.
>=20
> Current code uses `PAGE_SIZE' as an assumed alignment reference but 4K
> kernel page sizes is by no means a guarantee. On 16K-paged kernels, this
> causes driver failures during boot up:
>=20
> [   14.018975] ------------[ cut here ]------------
> [   14.023562] xe 0000:09:00.0: [drm] GT0: Kernel-submitted job timed out
> [   14.030084] WARNING: CPU: 3 PID: 564 at drivers/gpu/drm/xe/xe_guc_subm=
it.c:1181 guc_exec_queue_timedout_job+0x1c0/0xacc [xe]
> [   14.041300] Modules linked in: nf_conntrack_netbios_ns(E) nf_conntrack=
_broadcast(E) nft_fib_inet(E) nft_fib_ipv4(E) nft_fib_ipv6(E) nft_fib(E) nf=
t_reject_inet(E) nf_reject_ipv4(E) nf_reject_ipv6(E) nft_reject(E) nft_ct(E=
) nft_chain_nat(E) ip6table_nat(E) ip6table_mangle(E) ip6table_raw(E) ip6ta=
ble_security(E) iptable_nat(E) nf_nat(E) nf_conntrack(E) nf_defrag_ipv6(E) =
nf_defrag_ipv4(E) rfkill(E) iptable_mangle(E) iptable_raw(E) iptable_securi=
ty(E) ip_set(E) nf_tables(E) ip6table_filter(E) ip6_tables(E) iptable_filte=
r(E) snd_hda_codec_conexant(E) snd_hda_codec_generic(E) snd_hda_codec_hdmi(=
E) nls_iso8859_1(E) snd_hda_intel(E) snd_intel_dspcfg(E) qrtr(E) nls_cp437(=
E) snd_hda_codec(E) spi_loongson_pci(E) rtc_efi(E) snd_hda_core(E) loongson=
3_cpufreq(E) spi_loongson_core(E) snd_hwdep(E) snd_pcm(E) snd_timer(E) snd(=
E) soundcore(E) gpio_loongson_64bit(E) input_leds(E) rtc_loongson(E) i2c_ls=
2x(E) mousedev(E) sch_fq_codel(E) fuse(E) nfnetlink(E) dmi_sysfs(E) ip_tabl=
es(E) x_tables(E) xe(E) d
>  rm_gpuvm(E) drm_buddy(E) gpu_sched(E)
> [   14.041369]  drm_exec(E) drm_suballoc_helper(E) drm_display_helper(E) =
cec(E) rc_core(E) hid_generic(E) tpm_tis_spi(E) r8169(E) realtek(E) led_cla=
ss(E) loongson(E) i2c_algo_bit(E) drm_ttm_helper(E) ttm(E) drm_client_lib(E=
) drm_kms_helper(E) sunrpc(E) i2c_dev(E)
> [   14.153910] CPU: 3 UID: 0 PID: 564 Comm: kworker/u32:2 Tainted: G     =
       E      6.14.0-rc4-aosc-main-gbad70b1cd8b0-dirty #7
> [   14.165325] Tainted: [E]=3DUNSIGNED_MODULE
> [   14.169220] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-=
EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.0575=
6-prestab
> [   14.182970] Workqueue: gt-ordered-wq drm_sched_job_timedout [gpu_sched=
]
> [   14.189549] pc ffff8000024f3760 ra ffff8000024f3760 tp 900000012f15000=
0 sp 900000012f153ca0
> [   14.197853] a0 0000000000000000 a1 0000000000000000 a2 000000000000000=
0 a3 0000000000000000
> [   14.206156] a4 0000000000000000 a5 0000000000000000 a6 000000000000000=
0 a7 0000000000000000
> [   14.214458] t0 0000000000000000 t1 0000000000000000 t2 000000000000000=
0 t3 0000000000000000
> [   14.222761] t4 0000000000000000 t5 0000000000000000 t6 000000000000000=
0 t7 0000000000000000
> [   14.231064] t8 0000000000000000 u0 900000000195c0c8 s9 900000012e4dcf4=
8 s0 90000001285f3640
> [   14.239368] s1 90000001004f8000 s2 ffff8000026ec000 s3 000000000000000=
0 s4 900000012e4dc028
> [   14.247672] s5 90000001009f5e00 s6 000000000000137e s7 000000000000000=
1 s8 900000012f153ce8
> [   14.255975]    ra: ffff8000024f3760 guc_exec_queue_timedout_job+0x1c0/=
0xacc [xe]
> [   14.263379]   ERA: ffff8000024f3760 guc_exec_queue_timedout_job+0x1c0/=
0xacc [xe]
> [   14.270777]  CRMD: 000000b0 (PLV0 -IE -DA +PG DACF=3DCC DACM=3DCC -WE)
> [   14.276927]  PRMD: 00000004 (PPLV0 +PIE -PWE)
> [   14.281258]  EUEN: 00000000 (-FPE -SXE -ASXE -BTE)
> [   14.286024]  ECFG: 00071c1d (LIE=3D0,2-4,10-12 VS=3D7)
> [   14.290790] ESTAT: 000c0000 [BRK] (IS=3D ECode=3D12 EsubCode=3D0)
> [   14.296329]  PRID: 0014d000 (Loongson-64bit, Loongson-3A6000-HV)
> [   14.302299] CPU: 3 UID: 0 PID: 564 Comm: kworker/u32:2 Tainted: G     =
       E      6.14.0-rc4-aosc-main-gbad70b1cd8b0-dirty #7
> [   14.302302] Tainted: [E]=3DUNSIGNED_MODULE
> [   14.302302] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-=
EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.0575=
6-prestab
> [   14.302304] Workqueue: gt-ordered-wq drm_sched_job_timedout [gpu_sched=
]
> [   14.302307] Stack : 900000012f153928 d84a6232d48f1ac7 900000000023eb34=
 900000012f150000
> [   14.302310]         900000012f153900 0000000000000000 900000012f153908=
 9000000001c31c70
> [   14.302313]         0000000000000000 0000000000000000 0000000000000000=
 0000000000000000
> [   14.302315]         0000000000000000 d84a6232d48f1ac7 0000000000000000=
 0000000000000000
> [   14.302318]         0000000000000000 0000000000000000 0000000000000000=
 0000000000000000
> [   14.302320]         0000000000000000 0000000000000000 00000000072b4000=
 900000012e4dcf48
> [   14.302323]         9000000001eb8000 0000000000000000 9000000001c31c70=
 0000000000000004
> [   14.302325]         0000000000000004 0000000000000000 000000000000137e=
 0000000000000001
> [   14.302328]         900000012f153ce8 9000000001c31c70 9000000000244174=
 0000555581840b98
> [   14.302331]         00000000000000b0 0000000000000004 0000000000000000=
 0000000000071c1d
> [   14.302333]         ...
> [   14.302335] Call Trace:
> [   14.302336] [<9000000000244174>] show_stack+0x3c/0x16c
> [   14.302341] [<900000000023eb30>] dump_stack_lvl+0x84/0xe0
> [   14.302346] [<9000000000288208>] __warn+0x8c/0x174
> [   14.302350] [<90000000017c1918>] report_bug+0x1c0/0x22c
> [   14.302354] [<90000000017f66e8>] do_bp+0x280/0x344
> [   14.302359]
> [   14.302360] ---[ end trace 0000000000000000 ]---
>=20
> Revise calculation of `RING_CTL_SIZE(size)' to use `SZ_4K' to fix the
> aforementioned issue.
>=20
> Cc: stable@vger.kernel.org
> Fixes: b79e8fd954c4 ("drm/xe: Remove dependency on intel_engine_regs.h")
> Tested-by: Mingcong Bai <jeffbai@aosc.io>
> Tested-by: Haien Liang <27873200@qq.com>
> Tested-by: Shirong Liu <lsr1024@qq.com>
> Tested-by: Haofeng Wu <s2600cw2@126.com>
> Link: https://github.com/FanFansfan/loongson-linux/commit/22c55ab3931c324=
10a077b3ddb6dca3f28223360
> Co-developed-by: Shang Yatsen <429839446@qq.com>
> Signed-off-by: Shang Yatsen <429839446@qq.com>
> Signed-off-by: Mingcong Bai <jeffbai@aosc.io>

This conflict with previously submited patch [1] but this one LGTM too,
with that:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/regs/xe_engine_regs.h | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/x=
e/regs/xe_engine_regs.h
> index d86219dedde2a6dcd8701c7bf2e90d95ec7244e2..e48bf80d144a1a954f6d9f5d4=
05e1d759b86134f 100644
> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> @@ -52,8 +52,7 @@
>  #define RING_START(base)			XE_REG((base) + 0x38)
> =20
>  #define RING_CTL(base)				XE_REG((base) + 0x3c)
> -#define   RING_CTL_SIZE(size)			((size) - PAGE_SIZE) /* in bytes -> page=
s */
> -#define   RING_CTL_SIZE(size)			((size) - PAGE_SIZE) /* in bytes -> page=
s */
> +#define   RING_CTL_SIZE(size)			((size) - SZ_4K) /* in bytes -> pages */
> =20
>  #define RING_START_UDW(base)			XE_REG((base) + 0x48)
> =20
>=20
> --=20
> 2.48.1
>=20
>=20
