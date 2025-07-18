Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35002B0A84C
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 18:19:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44DFD10EA02;
	Fri, 18 Jul 2025 16:19:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JvQ1GhOi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC9D810EA02;
 Fri, 18 Jul 2025 16:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752855590; x=1784391590;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=pv0X73Je8BAEc4/kWpA8/1kVk9vNOSVy7NMzO7R3Y0E=;
 b=JvQ1GhOiXlUY6TgHAiekmYmOBZStMxZLKGZLQ0VGt1DVwPTAb3aEMzHs
 7SrcjvM/1weJJDlei46S4iY0ouvCLDYkXkrC7EaTeKFVp/m5rz5lyRd1B
 mySLGblPFbQcSJHxBi80AYdlko1K+1UG6OJOfpLw+3AGkba1an0lZ8DaX
 TL9BmOx/O5I6QeFpBI0Yy3LQ0d1VRCJDbrxg5GA2kj0t0cQghQRzFBmay
 JbSR5OobD+eoYTtHtniSvS9/yvVmOkjhWsNIwtM82xvjGx9T3TvGWFQVL
 D8/XjIOdNjpxFrgU/Y/OY5CGQym0hv4ZbuDQDF8V1N1CHbL8HxSDJX531 A==;
X-CSE-ConnectionGUID: Id4xuwB/QtyiCX0F/l/6vQ==
X-CSE-MsgGUID: DSnDPEeAT1ueynS1tuCE5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11496"; a="57768361"
X-IronPort-AV: E=Sophos;i="6.16,322,1744095600"; d="scan'208";a="57768361"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2025 09:19:49 -0700
X-CSE-ConnectionGUID: BwyPbnjhSsq2tuOO1Kya/w==
X-CSE-MsgGUID: HfGl4fR7QjuzjwsYZwWjjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,322,1744095600"; d="scan'208";a="158657594"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2025 09:19:49 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 18 Jul 2025 09:19:48 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 18 Jul 2025 09:19:48 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.83)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 18 Jul 2025 09:19:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m1Q7cY3onFGOLYPW9sP0gCJeNYNZeBWY4EOTenkvYdxFe7CnGMr4fTyjq0yhGkTYk7gS4CK/NhItc2+zd2DLrcygA6rQD5hRmmC7bgMZ9VPZTUazG2pZZpFkikk0uOecLHknj3rxi48x8HU7c7dz3tedL+fZ8lE6n20n+OIfibSUSlakLdAf8VFdmu4idanlkkAuvIkoLEuf1mlBxfWcIvPetsKRd3NDR1FwXLvvwyi7YJyE82hdPuwdY2vioaiezgi+YW7CmLam655+EuK/+RBmYqwmIf66MGYOGCq+5gT/JgXp1tJmoUFYhsZNdZ+dVuFz08BNjIEgTCqbtXtiDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9MaCziTrcfR4I+Groby4DHeLPDsHly05O+c8yWgMJro=;
 b=GxOGdmwtX8XeAmCdBSen8dPfTTDpx4fjeYXFvedb6N7nAgxTpA1B4Vvh+p7VHD4OCrTJiJpFDFwRnyWbMCW4JdIcOgqzepElO/2qsJ+wUfRE0bhT6nm5WHg20IBMbF9WRcK/4UTxNog+bYC5VXD7oLl50K+cFP4BuDddhbChpydOYKnupP2iKqAkB5XkMm5+4DJw0kfF6kvP8uRN5bPvOr2OgD6gev8jjCjsVPmXUypxePSdmQuAVijP+kpsISYH/91AWv3u3i/lpRT9du66iYZZljRk881z0Mt71L7R5+Q2ftAP5NOQVnIuuvwu/46UvvsY+5JCnRUtCN9Ey7Ybug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by PH7PR11MB7720.namprd11.prod.outlook.com (2603:10b6:510:2b3::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Fri, 18 Jul
 2025 16:19:46 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8922.037; Fri, 18 Jul 2025
 16:19:45 +0000
Date: Fri, 18 Jul 2025 12:19:41 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Ruben Wauters <rubenru09@aol.com>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH v2] drm/i915: replace DRM_DEBUG_SELFTEST with
 DRM_KUNIT_TEST
Message-ID: <aHp0HYR0pfZ-qArI@intel.com>
References: <20250701115511.5445-1-rubenru09.ref@aol.com>
 <20250701115511.5445-1-rubenru09@aol.com>
 <ea5ac37cfae72d312c47ab1983dd1fcb59edec28.camel@aol.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ea5ac37cfae72d312c47ab1983dd1fcb59edec28.camel@aol.com>
X-ClientProxiedBy: SJ0PR03CA0239.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::34) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|PH7PR11MB7720:EE_
X-MS-Office365-Filtering-Correlation-Id: 51be96f0-513b-401c-a302-08ddc616e8dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|7416014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?9eKNXyJBlhmQz8RV5ggCANgz07ZfGT9qGmsNAK1aCnOBlN+y0WRv/6fzBc?=
 =?iso-8859-1?Q?c198ZN8P1zhN4fn+++Db8CAlguW3gxcMHn0EI0a/Vsizsa6JoNL6vAibmw?=
 =?iso-8859-1?Q?e0cdo/QtVAmlNV0kr5zDy9k/g5+xR6gqMnuILxQqkLgbeh7o/GGY+vYlNX?=
 =?iso-8859-1?Q?jcx3XElyeBeSsyjPOZx3UmCiW9R8Hi5aW3q/ehS6ionuDh0aL2Q8belJI0?=
 =?iso-8859-1?Q?I2GiiJL3I8i2glr6F1QE7J8F96+bv0Y4kqJdsdILceI/OvaWLfszl4MW6p?=
 =?iso-8859-1?Q?RYHOnFXFf4ZNUa6B3D/GWOyBx3Ki1XrGuHxn+Nx1ixSfyn/r/m6/PBAwET?=
 =?iso-8859-1?Q?KtP3JWGpJwHeGxMVHZEQjTMAQ5JYyXXQeB/nVRMS3NNf3IbPQCCOdhtdAG?=
 =?iso-8859-1?Q?eZAnLCAZVW3GDO4j21z5Jn5eLyAEHmk9EHWm9Lwjpg2tLNd+oWuo3sz+/B?=
 =?iso-8859-1?Q?hYP5oMKrzKlQFunzj5wVq33iBRNJwwd5ffdKFL8Ox3pGX5tjfIp/t7w4uq?=
 =?iso-8859-1?Q?BVopxXe+YhPsktzdUcF5vVUFdxYZz96ZgvUm6DwvUD1zPbsCLyFdUIA7ST?=
 =?iso-8859-1?Q?+V5irb5vFP9Gb3NVmdAFMawZyOLyKyNg/4BoRwxvVNQEOsxaAFLT/b3kiK?=
 =?iso-8859-1?Q?+aMLWTdah5W0A5kAWHGqy8bta4G5i0fMM1WAQs3D6p+ni8MUQryKm3Qog9?=
 =?iso-8859-1?Q?eulEaNVFRoY1MJWClLjZFjwcwMLywCD0rccFfBKkTLsJxv+Wq2h97CYpjf?=
 =?iso-8859-1?Q?slHlc3w324wzsNYZ4evBygzD1BqbJIxfp5KD7eB89xGavFlVyzyZRrvLt3?=
 =?iso-8859-1?Q?wX6pWwKq2I7/KewO+X8CP9jXcDMbJ7DFeYok5jspQeoYN52x0VXc4cyV0U?=
 =?iso-8859-1?Q?jHw/8mSeVC/Sub7kfxgWaTDo60X1eUyxwoVRl/GxGUhaha2YzGMy3BbNmQ?=
 =?iso-8859-1?Q?JN/UJnp5LOABKmu9OH8oPg9Fpc5VPx20lAKYAUISZ4hQm/HtfBKFTgfE8h?=
 =?iso-8859-1?Q?JeOnRLDkR68LyQd1aOgwNzW3fY4It2wLxKqrd4x2rkW1aPYwiKHfwwT5s8?=
 =?iso-8859-1?Q?vaF4VXiEKzwljpcR0Dh+tWvA/6WDyQHYIQyNhcZbqMsTwVY+h8g/Rc7zeF?=
 =?iso-8859-1?Q?aUXnCGkJ0OL9r/PgruXo6gREdyLuFFj5tHBTPron7q235K60uULwWNeo3c?=
 =?iso-8859-1?Q?de6KYiawBMKv6WCuVBCpSFjwr4CBHvNSV9Fp9PjIsvQ3LaGG0sOwNQv/TU?=
 =?iso-8859-1?Q?32dgj80jzKwnRywOmE0YX4KdXlyp/cg/j4duXoLn1MR9RzLq6qAsFZtd5q?=
 =?iso-8859-1?Q?X07K3Ara0kA+TjZ235+OUNwudpdWi5zJpitWLqqCDCX57Dlf3nWP3cq6aI?=
 =?iso-8859-1?Q?1J9jzLU5B7g1iYX1Br9FUEOITPsPlZl4nLMjkMPS4pQ3nfkXxNyfUikP/J?=
 =?iso-8859-1?Q?dQM4iWX6nFm7zBEj+uFPhYtAiZ9qX+jEyw0//6hYjva3n6CqEwPOofCVf3?=
 =?iso-8859-1?Q?Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(7416014)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?YLTDIqWpPSHCvAF34TgsE6ppoCs7tbhwS94dOyPBSpFIKxkiheFV7GU2j1?=
 =?iso-8859-1?Q?9XSL0CN9ctJRGk/tLXSBgXcPM/N8o0vq/8+1JpNflYt5idP9lG4XmKmq94?=
 =?iso-8859-1?Q?B+T5kejf9MpJAulyvi/wzUdHcQ3QxTz9ZPWxMS3W/Ye6M/rLXZUaO5ey26?=
 =?iso-8859-1?Q?ySFb2usSQ+THjVDQ5eV+RSQ7a4npcH0ybRN6Nl0kYJ5+nmvOeqq76nQ7Kg?=
 =?iso-8859-1?Q?eEK3HYoiJASWN45RBJ6sWdfuey2hfQT11LSGPzGzzxQVHcTKAgijkjJHvZ?=
 =?iso-8859-1?Q?LAlAOcS0K2Gxa46jfDBek7Wd+43Bx5+WRShEtBClOR535YkDB1eov0IR94?=
 =?iso-8859-1?Q?Uwx1cXhdb1jlKWit+8ZbrazcS1CZ0TNnsWx198ac13I/GOEUgxcRrlirnE?=
 =?iso-8859-1?Q?dS/cNmiVkS37SApFo2ryFDoe0X91NEI9mjujWdsJhimW+OvqQyi/J3Y9qr?=
 =?iso-8859-1?Q?cLszIljFFDkHGiLEj114gIo3XSRuFlGkyEC8yrLBzuQY3jNmDpEBk3I/QI?=
 =?iso-8859-1?Q?sGcdUS0myA+V9FLZVLvPOdNn4gE+v8myu10MlfP2KSm5mGEGvzC34g8Esu?=
 =?iso-8859-1?Q?E448JmvScH075ydFSu8yh+BWxqEh+edHITSxjwhCLGjBG2uBGjiyK9bMBr?=
 =?iso-8859-1?Q?VxI97zxxLVSBj2itsHhwHz9yBh7j2c4k5piPJvq9VpiYY13bmTg85ikpjf?=
 =?iso-8859-1?Q?U+JDO+IdY/BuK6es1sydM0UuoPo4/WS3+cH+cBcqSXOa6ej0hDdu3GlW4l?=
 =?iso-8859-1?Q?MUVhDaYzYtF9ZntujVZfy2il64v7KWIWandiGwPhYrBLSY9eWhGPkWxvaQ?=
 =?iso-8859-1?Q?bVKLwUOKIfEgWc7P5fDZHLBs4bkktSX+8blPf5Qg6bcOfwRvE8JQmRNbZR?=
 =?iso-8859-1?Q?xlKjzJujDEMvsV2WdAGzw4Yzpewed2KWi3x/sIFPihm5bwQuNmLQSCSH6a?=
 =?iso-8859-1?Q?F3gUJHGdoPe0Ad9B4HELCJEjhBn/4Xhpvb4d9KHGhwIlbkjRcfHSsfbxtM?=
 =?iso-8859-1?Q?7xoHtZ5um4ylo8hq+dXBkfTDUI4N+zm2HZ53hwAhsdbmy6L4wcDCtlU0gr?=
 =?iso-8859-1?Q?F6P9v3NvUC+e2x+itwJeK2NEDdiqf+vouGpK6bJaUM4KWuLoSrZbGwfHKH?=
 =?iso-8859-1?Q?2Jqe092OZurhgu0sJ07Qow590laZSZJwh1xhB+bGOj9z2nZiIcDV0J6gau?=
 =?iso-8859-1?Q?YJ/wHPnZ/pATmhAKBQJg2vIjiNBNZlozGmp5dCI5IN8YePWKp/hlgS3u6W?=
 =?iso-8859-1?Q?fayVAB1cgH4bSrKV5LiU6Jj0J89znittHaaA0D9IL8qiTXYJaUD/z2qZEH?=
 =?iso-8859-1?Q?Gr64cG+LB0ruQQDpqS0OIg+9zJUugvV2Z40rmqBa9fHa3Mm2uxcqarYj2/?=
 =?iso-8859-1?Q?P5R1KCjGAB073mraMScfJNUKZsyeCzUI1jPs1A58c9T0dCQewTe6JjWRPW?=
 =?iso-8859-1?Q?w8pByirAmmm7GZkMvWSxiiqXecsZuXAykifFwEgpRuPfW6FntrJeIg1gIi?=
 =?iso-8859-1?Q?/bgB5C6GRA/jDhM5Us5brPFRL6RWc0rYBA95Dm8xiJj2SYXROmUgyZiGTB?=
 =?iso-8859-1?Q?jBqVaR+LiSSuMHSx3xcnVlzbrp5KSjn3i3flZ+XXIICDzXx50AbEx4hqA4?=
 =?iso-8859-1?Q?4xpsbkvC9r8ipppTsV4yCVHVce9mZJ8Fvj?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 51be96f0-513b-401c-a302-08ddc616e8dd
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 16:19:45.6751 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7PF3A098WwbabGjgE5HHtkC+Fjy57RFhOOnj0tbtUoZyt/3Cv2uOWPXZuPJhNL1xdzvtPnqCMgOxG0GQgLUlTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7720
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

On Fri, Jul 18, 2025 at 02:59:10PM +0100, Ruben Wauters wrote:
> On Tue, 2025-07-01 at 12:54 +0100, Ruben Wauters wrote:
> > DRM_DEBUG_SELFTEST was removed in commit fc8d29e298cf (drm: selftest:
> > convert drm_mm selftest to KUnit) and all functions under it were
> > converted to KUnit, under the DRM_KUNIT_TEST option
> > 
> > This conversion however did not occur in the Kconfig.debug file in
> > the
> > i915 directory.

I wonder if some deeper conversion is needed on the selftests.
But well, I couldn't spot anything and if CI is happy, let's go with ti.

> > 
> > This patch replaces the select for DRM_DEBUG_SELFTEST, an option that
> > no
> > longer exists, with the correct select, DRM_KUNIT_TEST.
> > 
> > Signed-off-by: Ruben Wauters <rubenru09@aol.com>
> > ---
> > v2 changes:
> > - update commit message to contain more detail about the background
> > of
> >   the change and why it is necessary
> > ---
> >  drivers/gpu/drm/i915/Kconfig.debug | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/Kconfig.debug
> > b/drivers/gpu/drm/i915/Kconfig.debug
> > index 1852e0804942..b15b1cecb3aa 100644
> > --- a/drivers/gpu/drm/i915/Kconfig.debug
> > +++ b/drivers/gpu/drm/i915/Kconfig.debug
> > @@ -50,7 +50,7 @@ config DRM_I915_DEBUG
> >  	select DRM_VGEM # used by igt/prime_vgem (dmabuf interop
> > checks)
> >  	select DRM_DEBUG_MM if DRM=y
> >  	select DRM_EXPORT_FOR_TESTS if m
> > -	select DRM_DEBUG_SELFTEST
> > +	select DRM_KUNIT_TEST
> >  	select DMABUF_SELFTESTS
> >  	select SW_SYNC # signaling validation framework
> > (igt/syncobj*)
> >  	select DRM_I915_WERROR
> 
> Hello, I was wondering if it'd be possible to have this patch reviewed.
> Having an incorrect Kconfig entry isn't ideal and it'd be good if this
> could be fixed if possible

I just resent for CI before we can merge.

Thanks for the patch...

> 
> Thanks
> 
> Ruben Wauters
