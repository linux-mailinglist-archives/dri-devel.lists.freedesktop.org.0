Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 409A1AAC800
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 16:31:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D02C410E097;
	Tue,  6 May 2025 14:31:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EomkgtJi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1E4310E097;
 Tue,  6 May 2025 14:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746541906; x=1778077906;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=9a/M3C8GAXylGjzYXJ0S3d1kwn9Aw8K5Ee3uPwSp6KU=;
 b=EomkgtJil5IkFrxypbYZZh0H+5fgJi8jt9BUWawdfWp3ad+5uLs1B6u+
 SLFK2Tona+vl8eQJkzlzPP3AK1ds8aCpG/iDUpE2yQAUB3RCDSFPZhvhZ
 5j5dnn+lY1Z81qFq7NmzvyjUoObbeV0M7kIOHV5MYnhe/eBZD4nm7Zr8f
 Abs8FjTOo4Qv8my46VxHMEIqJl9iFdHkjO7H3+F8O96fuSUhgjNp8dc9g
 ar1+dALM9bGHWbGSuLHMJXdD+lsfHYGcqJniEcJcCDDnDynnGXjBrhMFw
 E0cY6F8MhqSzK/Wdn1dXJr+066C7Vg5q4ZFin34rjR1PhUYq5qxg50v8R A==;
X-CSE-ConnectionGUID: cPC3SRKJRWeaGtm+vEz2gQ==
X-CSE-MsgGUID: CkdzFS+VQJaeEY0R8UwPFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="48225726"
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; d="scan'208";a="48225726"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 07:31:41 -0700
X-CSE-ConnectionGUID: 9B4MHVthSUaEiay/bzwVNw==
X-CSE-MsgGUID: 5ClRBuwXTlOqI5HopAl8Ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; d="scan'208";a="136036134"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 07:31:40 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 6 May 2025 07:31:38 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 6 May 2025 07:31:38 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 6 May 2025 07:31:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p5071iEiHxqbzeSiBvqTpplFEQ+UshLWaTmxA8hnjITkmD6gXABV7lqLMq2ws9uJyt3FpqstjH15DQVpDjLHHrmsver9AItjE0+toaDSKcxAWo75RzPrFWq4W30L4vhrG5WIllbOfqqBk88wyTVqMbGTrKA98kf+zJ9akMUPZ/M1aIw0ZfULT3/TImqwTVYhu7CN/ZZr6Bl8So5Jq1QqmDd6keaeinJnKgN2esjWxTn98mZiw8ERE35fhQw0lVYKMuKsag6Phv8beg+PkBCCtvqCCZuqryAew7P35qULt6l3wkSy1n01pGpMtc139CBD+vwvPC4/montahKejnfr/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qJXM7O4WsAw6+h34cw4OcDwBqzWy+i2xle8VIlVXpQs=;
 b=EaHHY87G0NSd4Nc8xhCdobLGpPuY3R96xsobcrY4AS9/ctPSKd4ba3BBO6eQDBErJaGL9il99j+U0yExVVJVOIYfcrw+bXLahHpXEf2y4myOwF9E9j4H9ZS/NFObBb1NQhvCcoEXhUONwbu/f2tGh1mJJDrhQWq1vdNkL+mC0dK85VFXOI9H4AEIEN4M7tjZmIw8XmjpYlil/6HBOQbkDSq10PgehQy2TfJ6mTK7PQzI/0wpjmUGquoD4hT3hh0YYse2ATM6TyrYgK5hg90G7Qwa6OY6lXH9hQ7WhuTuinLB3kpSZodt5CFNZmDk/rDwSo9pjKwEBLp2bX80DI5A9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB4797.namprd11.prod.outlook.com (2603:10b6:a03:2d4::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Tue, 6 May
 2025 14:30:49 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8699.026; Tue, 6 May 2025
 14:30:49 +0000
Date: Tue, 6 May 2025 07:32:13 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>
CC: Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>, Simona Vetter
 <simona@ffwll.ch>, "Melissa Wen" <mwen@igalia.com>, Lucas Stach
 <l.stach@pengutronix.de>, Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, Rob Herring
 <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 <kernel-dev@igalia.com>, <dri-devel@lists.freedesktop.org>,
 <etnaviv@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/8] drm/sched: Allow drivers to skip the reset and keep
 on running
Message-ID: <aBodbVPeVtAWK6OX@lstrano-desk.jf.intel.com>
References: <20250503-sched-skip-reset-v1-0-ed0d6701a3fe@igalia.com>
 <20250503-sched-skip-reset-v1-1-ed0d6701a3fe@igalia.com>
 <aBl2xaVBlYYyBt2o@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aBl2xaVBlYYyBt2o@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: MW4PR03CA0273.namprd03.prod.outlook.com
 (2603:10b6:303:b5::8) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB4797:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d7420a3-ee3c-4a98-8f96-08dd8caa9901
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?e+oBN1Ptf35HSDZEywRsooMrfxNmRqTEuPmcjAs3kL0b5HcrJXJWlTCsmw?=
 =?iso-8859-1?Q?rDqL8JRk/DSUmq7ZZdse0yELSWrC4j3RUdM786v+n4blc2rmR/m65v9cwY?=
 =?iso-8859-1?Q?hrwbngxkf2Wpi8vJhwjWb9LdcrW0Oh1XM7Ri9vFl0NTCkECgIP51Vy67T8?=
 =?iso-8859-1?Q?och21+N3vFNbAgjgFmfGf2iIxAglsrxESdPT8/5Q8Ev0i0JzSsrwoyqGiO?=
 =?iso-8859-1?Q?+qyr1uqiUu5Ulp5isstikqJd8sX+CwXZwMpujh8tVEqeykSU559vaFqjeG?=
 =?iso-8859-1?Q?w5CHKgox1stNtwGXUYfNAFqC0o3CXJVP1CUejmwVl45ZG+SuUaHAvWZbFP?=
 =?iso-8859-1?Q?3CNC3CzSdle2ZF+OvMkbhL5laWgBJKyT9qhrsMaWwuLv7xM7VSHbxfXXtQ?=
 =?iso-8859-1?Q?PXDj2P89QPlkgKo2DsjAvnMIHzJ5MHtEPd6Kzf+RpGcryHBgt7dvCSYS6K?=
 =?iso-8859-1?Q?0BhX8w1OOBIvnRtytkcdxQU5tb000M6zZSsOj3h3CtrIqZvqJIQYJEmuTQ?=
 =?iso-8859-1?Q?fnp8tfr3lktxajA6lwi3Q708u8wlRfkWJECSZtoN6xRFgTwq3SkoBPZGW4?=
 =?iso-8859-1?Q?QGSpKKrpT4SzHedvbDF36bL9CD1aPFOQmpTRqwol3qWFWNrFqoT28ACCYe?=
 =?iso-8859-1?Q?bEsjc7Wd3Zylmn9VeI5EHgvzKZWw4H61n8UkucOlUSY4GKLF+rGaKq4ppu?=
 =?iso-8859-1?Q?QrukvksukhvqVvqFKjMuARGPqYSB5pDWt1YyCvZJF5/nQB4lIrfs2nlO9g?=
 =?iso-8859-1?Q?2qR/B1eGEU4FGBEmITy7zjUcJzU2SssrjsVKUvcfTN/ddueGvFUtHMD84h?=
 =?iso-8859-1?Q?W0i3DOBbLX6xrI7MlklqEGq7IfA3LDTPJCjyT/IxeEET8Hew82BH59Eg4X?=
 =?iso-8859-1?Q?sOUjsSsHrMlNX0mZR2vpCTZ09qo2czAeYIveBXKe1JXLA54o73ug/4ZUeD?=
 =?iso-8859-1?Q?1MqySfCUV5gK9RunM2KAtgLH/HoFpcx6+PojH9NYai8Q+mVd3wyuh3re23?=
 =?iso-8859-1?Q?WJfzWnQ4aQeTUsCJnZ+KHudfX99JPn+8ENPqCc7ofDnjrsmYnOJTzToh1i?=
 =?iso-8859-1?Q?r/L7v1AZuWQZauZWX0wkSRo+oAqBu8JIiuNoUWW7NjfPk4MVVCaAOxa7Jt?=
 =?iso-8859-1?Q?IUthGgutxrhkxQz1aWAPeRCWfBDXqu8qJXamcb0zjmkZVirTtgHJtjVLHl?=
 =?iso-8859-1?Q?xr6pDbji4iICFt0ZjXtrhfXVPramYcWGmXqEdMeJ2aENHNY+uVhW1zEQ9g?=
 =?iso-8859-1?Q?lJ3ZEmV1abbmFW919eBgJnbTQyzVvGdZRPnTZ4udJtsVc6GqX0qZqMuuBg?=
 =?iso-8859-1?Q?j05fRw5NGezZ8F6HUb2acA2FswcP5jChU3iVlCtm18Wh300QH3i8blq5pO?=
 =?iso-8859-1?Q?oYoXhS3CZPPdxw/DYQ2OF3/nxUx7JROMqB8trNlu0Fs4iw5LjjWJTK9JiN?=
 =?iso-8859-1?Q?S0xoFYyl3ZV4KKU2f+6aa4nJSXrgeju/hSztYfQcN4N9iIpApdHk0vrSHQ?=
 =?iso-8859-1?Q?w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?GYtgv/Qj8cvC9pGzpJPu1dNSnzFXRfBW+fIfnxdva2Qw4VU2wjN31ZhmOF?=
 =?iso-8859-1?Q?H1W22qJFvBoEkKQAq7PT4Dsttw9XtM88oZG1A3ZDk6qgbR6d7wxmkkBOoq?=
 =?iso-8859-1?Q?yaOj6WyXNGzvgSjHNhNGbPvlZKp5U5mQyCW3lUpBE2loGAW+elEgqwj+j2?=
 =?iso-8859-1?Q?PD/ZzPDqhZ7Y5uVrn9FmDnbUHgPbWQ6ZKSBWBvaFgOv0Qs5KiyrcWrcQXD?=
 =?iso-8859-1?Q?fwoDf8r5Q4FbfLB6U1O4PIzKhrjNo9bvPhPxZlCkeWSgpTIgzqScG9Wh0R?=
 =?iso-8859-1?Q?hn/SLKL8C4zZTssZ5+THWXUhpk/z8QxL3Iwswgh0la4wKcbLHn+J4dB9As?=
 =?iso-8859-1?Q?ifOLcVRmQw2gNz3T1N/BxwhgHFM36/ISmKVyFDaEg26oRNd6TpGfCY/2Q0?=
 =?iso-8859-1?Q?m3vW2oJiNwBMh+ZfsX+WOiYiczepKO1yUhNo7F8rYV67idpxJgU7Ei5FOk?=
 =?iso-8859-1?Q?PwXYfeVp1JIHENA0VQGcv3D4em+oie3o6duXQCxhEu/Z9yAtYcKOcdiSbj?=
 =?iso-8859-1?Q?70OF/amROCWSlm7/2aHt7WcSu8Wx2DDSm46Detf03URFmSwLKAS832E5DP?=
 =?iso-8859-1?Q?lbSjm+cDs2fvVOtFwitNjbetta5U4eDNF8bsDbsY0y5V69RtNcWSF12w/a?=
 =?iso-8859-1?Q?FG4WGHd6Bh0MuP+bk2C2Lh7WA9pDFnqE1mKDnHJph9hLSqB7uxqG8tlIGm?=
 =?iso-8859-1?Q?UC4FV4YlqUl7oPGL8f63LDbnFY7VjRE1+r4JTg/4nzDgUYCGbY9QgZrI1A?=
 =?iso-8859-1?Q?3cQcrA1QCQAsyd/prGGwmSl8JgZnC06myN3Phr5pFHad9HJ8F3LHVvrBuS?=
 =?iso-8859-1?Q?X4hk0HO+zjM3LMYXKRzx2C78txVHwnw3hTtDIOiOVqdtn6v6pKv06te/wH?=
 =?iso-8859-1?Q?IGUSDuZmCzeDKm2Woh2voj0NflPJhjQWZmwFwAyLC1MAD2MNNWDc+Jvsxj?=
 =?iso-8859-1?Q?pjqgvxctjT2JCouQujGz4zE6qWUqXF8gMZRaQ5V5P8ZCCD3EHVZTprMnPD?=
 =?iso-8859-1?Q?KZ/UHfbdVYLoU4ss5PwsI4xr53dNWCGS9D+GhBfmzEU6Xe4+/9wXfCSAFq?=
 =?iso-8859-1?Q?4FXc01UWwDxy/5pmh57eycVb4HqmxuRkVHl8VvmmWbJuvwNGbNV1H0qPsb?=
 =?iso-8859-1?Q?ti0Y5IPiFwC4NhH5iXDV5nhdwM3pfitseM31tvMBx64di6h3mENT1orJXy?=
 =?iso-8859-1?Q?35WqXD/fXTfyDqCEjUswC/N4KGQLlBzjzaA7Z5RZSBsU9/hqi4pTgoU2tl?=
 =?iso-8859-1?Q?3FUf+9G9FmNm9N8mXVv8nW2Q1Tsq+/rvcivqYh3LmX3RSwuIl4OQxa7iRO?=
 =?iso-8859-1?Q?kOU/aSgKFpPne+Xim2pri55fSz7i8B09gM+GA8ixZZpufbUEnCSMC2KCtn?=
 =?iso-8859-1?Q?7OY5fThFryQW6BHLGecJ0QCPL8ZbharoVqzscZnJNHbWqPVYTwycTJOHdv?=
 =?iso-8859-1?Q?flKfxxsqPE/Q3t7xYPZwaVn3Tkx+ltQ3UWRqvIRWOEwgoSY+McvUbijIqK?=
 =?iso-8859-1?Q?CyRDGCM5slzUMRJl6EKY0SUmDEJscswhdjv/6BTI4kzCPPK+ZzPWOnIrOi?=
 =?iso-8859-1?Q?ZWnA1j1U44dRchIziH6CkZ3iasF6O0+Q2bPffvtJCjBNc2Fi5IlrRZJcy1?=
 =?iso-8859-1?Q?E4XYEyLnwd59RC1zVbBR8nRQeynpSnMmhhAEmgXgdwLGlyNoCf3fyiWw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d7420a3-ee3c-4a98-8f96-08dd8caa9901
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 14:30:49.8117 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1AZnALL01P9i7ABtajMJWCPT3QLPnJXrL74+zWwHL1armjkgoag8BbA1tTDef6qOkgs74i0jJ1tXTsyCFVK2eA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4797
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

On Mon, May 05, 2025 at 07:41:09PM -0700, Matthew Brost wrote:
> On Sat, May 03, 2025 at 05:59:52PM -0300, Maíra Canal wrote:
> > When the DRM scheduler times out, it's possible that the GPU isn't hung;
> > instead, a job may still be running, and there may be no valid reason to
> > reset the hardware. This can occur in two situations:
> > 
> >   1. The GPU exposes some mechanism that ensures the GPU is still making
> >      progress. By checking this mechanism, we can safely skip the reset,
> >      rearm the timeout, and allow the job to continue running until
> >      completion. This is the case for v3d and Etnaviv.
> >   2. TDR has fired before the IRQ that signals the fence. Consequently,
> >      the job actually finishes, but it triggers a timeout before signaling
> >      the completion fence.
> > 
> 
> We have both of these cases in Xe too. We implement the requeuing in Xe
> via driver side function - xe_sched_add_pending_job but this looks
> better and will make use of this.
> 
> > These two scenarios are problematic because we remove the job from the
> > `sched->pending_list` before calling `sched->ops->timedout_job()`. This
> > means that when the job finally signals completion (e.g. in the IRQ
> > handler), the scheduler won't call `sched->ops->free_job()`. As a result,
> > the job and its resources won't be freed, leading to a memory leak.
> > 
> > To resolve this issue, we create a new `drm_gpu_sched_stat` that allows a
> > driver to skip the reset. This new status will indicate that the job
> > should be reinserted into the pending list, and the driver will still
> > signal its completion.
> > 
> > Signed-off-by: Maíra Canal <mcanal@igalia.com>
> 
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> 

Wait - nevermind I think one issue is below.

> > ---
> >  drivers/gpu/drm/scheduler/sched_main.c | 14 ++++++++++++++
> >  include/drm/gpu_scheduler.h            |  2 ++
> >  2 files changed, 16 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> > index 829579c41c6b5d8b2abce5ad373c7017469b7680..68ca827d77e32187a034309f881135dbc639a9b4 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -568,6 +568,17 @@ static void drm_sched_job_timedout(struct work_struct *work)
> >  			job->sched->ops->free_job(job);
> >  			sched->free_guilty = false;
> >  		}
> > +
> > +		/*
> > +		 * If the driver indicated that the GPU is still running and wants to skip
> > +		 * the reset, reinsert the job back into the pending list and realarm the
> > +		 * timeout.
> > +		 */
> > +		if (status == DRM_GPU_SCHED_STAT_RUNNING) {
> > +			spin_lock(&sched->job_list_lock);
> > +			list_add(&job->list, &sched->pending_list);
> > +			spin_unlock(&sched->job_list_lock);
> > +		}

I think you need to requeue free_job wq here. It is possible the
free_job wq ran, didn't find a job, goes to sleep, then we add a
signaled job here which will never get freed.

Matt

> >  	} else {
> >  		spin_unlock(&sched->job_list_lock);
> >  	}
> > @@ -590,6 +601,9 @@ static void drm_sched_job_timedout(struct work_struct *work)
> >   * This function is typically used for reset recovery (see the docu of
> >   * drm_sched_backend_ops.timedout_job() for details). Do not call it for
> >   * scheduler teardown, i.e., before calling drm_sched_fini().
> > + *
> > + * As it's used for reset recovery, drm_sched_stop() shouldn't be called
> > + * if the scheduler skipped the timeout (DRM_SCHED_STAT_RUNNING).
> >   */
> >  void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
> >  {
> > diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> > index 1a7e377d4cbb4fc12ed93c548b236970217945e8..fe9043b6d43141bee831b5fc16b927202a507d51 100644
> > --- a/include/drm/gpu_scheduler.h
> > +++ b/include/drm/gpu_scheduler.h
> > @@ -389,11 +389,13 @@ struct drm_sched_job {
> >   * @DRM_GPU_SCHED_STAT_NONE: Reserved. Do not use.
> >   * @DRM_GPU_SCHED_STAT_NOMINAL: Operation succeeded.
> >   * @DRM_GPU_SCHED_STAT_ENODEV: Error: Device is not available anymore.
> > + * @DRM_GPU_SCHED_STAT_RUNNING: GPU is still running, so skip the reset.
> >   */
> >  enum drm_gpu_sched_stat {
> >  	DRM_GPU_SCHED_STAT_NONE,
> >  	DRM_GPU_SCHED_STAT_NOMINAL,
> >  	DRM_GPU_SCHED_STAT_ENODEV,
> > +	DRM_GPU_SCHED_STAT_RUNNING,
> >  };
> >  
> >  /**
> > 
> > -- 
> > 2.49.0
> > 
