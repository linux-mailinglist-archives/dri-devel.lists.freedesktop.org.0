Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4209F164A
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 20:38:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C86310E448;
	Fri, 13 Dec 2024 19:38:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m58Nghcb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45F8B10E14A;
 Fri, 13 Dec 2024 19:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734118728; x=1765654728;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=1d0oLUX/fe/b9ME1nrvSUfVn1aVu/NzYtiR7cxMw8k8=;
 b=m58Nghcb3PdPfuSwe3O7hWm/dCtxOOyqHKHrtlrQ/3/XLCFUMgJxPwsi
 uCc2eLqXKhaTPCJRFEoBicxfdLHVfrPZx6hjZpSKA4M1tA3xhfAe6PVkp
 4AA+qXEezyJgdc0oNpjLMWMIS+CkFMuI7oKjDs8CJN2qmW+Rn8dMgLffQ
 kRhy/AtJUyjO0kYHtBaBqvyWPPvyS0o8uMNBuyVuf7PYEtPh4F92j4vaW
 ztQSbO//9Jk6BUu2SaRpt/kOLJ9rrq1Mig5965qMdWYANFViFOeDV6NOd
 K29SAwT41LFPfFZci5E6ALtNPS8DBma1vUuczmoT6/7miEUHLF+hEBThs A==;
X-CSE-ConnectionGUID: hBH/dxdqTPqQH8k8zpaxSw==
X-CSE-MsgGUID: FaZqRI2uRXyhMGhBsHkCRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11285"; a="34483452"
X-IronPort-AV: E=Sophos;i="6.12,232,1728975600"; d="scan'208";a="34483452"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2024 11:38:29 -0800
X-CSE-ConnectionGUID: RlzQhfK+SYGxBtueOlbw8g==
X-CSE-MsgGUID: gBFzAntuRBqi0PbMk01nLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="96489450"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Dec 2024 11:38:30 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 13 Dec 2024 11:38:29 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 13 Dec 2024 11:38:29 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 13 Dec 2024 11:38:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lHjU8TCB9nOwMHVTG5fQmwOuaCorAlNOdYOt2RX6EPd+4xxHq56yPRijI2kuUF8U+RlnWKR4klM/Gqy/GjLwNG3NWrRt+AamYR6V2sL2l/iZ6h1r0s2hoH3qSCXNqkPXf4i47tfBJGqN1Rizipu5mSncF3glju/DTWjfhbtxonsYhOtaMTtGo4VbhlHDoGOlPXOD4WA58gHULii16hKXgS0E5m8YpBR+5BIe0SGVHRq1yLNWtdoNjBzkXtATcjU0hhnVQWZzliFssEOqe88hGeZ8w2Plrt6M9DO8VW+ZQAax+0PwaetqvmOI8PHaugppluR5NHZ2EVZY/UMeAOgjYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZgFY0c/v+y2hLIsFy/B2gg0bIgxKjWo2tBe6J4zpe88=;
 b=cFkJpWGCHVRZ6OtGFvPA04jAQexVe0faJn6abbgkBrn9gpy1ABdyf1xQeOybHwkh75V5BdOH3z9OrLCzM8ofbjGCzNZvPZMFrEAf7X79RnUflwV7asKuGclyuyUBgxZR7JRpI42gDizBZiiVP7uqtRExS/Ii2Q/TuCtPulgrpwuoFdRrgvQEM1WtngnbKFhan482xoLH2pmLRYV8j2gUxdPuYzYNyScneSpnEXwMY20+bcIZMJARS7dnCa1Obu5PFBVpEcr7f1hKaU/TUs2RSE9oguXitrDpLfI1qz+xGFQfonj49zSpk0a9MhOyy+rvxoPPwuKtYAVb6Oz4ucj7cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS7PR11MB7740.namprd11.prod.outlook.com (2603:10b6:8:e0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.16; Fri, 13 Dec
 2024 19:38:26 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8251.015; Fri, 13 Dec 2024
 19:38:26 +0000
Date: Fri, 13 Dec 2024 11:39:08 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Simona Vetter <simona.vetter@ffwll.ch>
CC: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Mika Kuoppala
 <mika.kuoppala@linux.intel.com>, <intel-xe@lists.freedesktop.org>, lkml
 <linux-kernel@vger.kernel.org>, Linux MM <linux-mm@kvack.org>,
 <dri-devel@lists.freedesktop.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>, Jonathan Cavitt
 <jonathan.cavitt@intel.com>
Subject: Re: [PATCH 14/26] drm/xe/eudebug: implement userptr_vma access
Message-ID: <Z1yNXPgAomYoilvc@lstrano-desk.jf.intel.com>
References: <20241209133318.1806472-1-mika.kuoppala@linux.intel.com>
 <20241209133318.1806472-15-mika.kuoppala@linux.intel.com>
 <ec42fe8b-9be0-41cc-96f4-f1869c6bb7e6@amd.com>
 <Z1cNQTvGdAUPp4Y-@phenom.ffwll.local>
 <3c1cc9403eb50bc8c532d180f766eb7a429e8913.camel@linux.intel.com>
 <Z1q3F81k2TkUzKW7@phenom.ffwll.local>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z1q3F81k2TkUzKW7@phenom.ffwll.local>
X-ClientProxiedBy: BYAPR05CA0087.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::28) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS7PR11MB7740:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d648fa7-4c3f-47f2-3bb1-08dd1badb667
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?Dz7gFdUQOUS3YzXj4d0ajsdLJZj211cBStLQJLJpGX2jBB0Uc7y/Nvydy2?=
 =?iso-8859-1?Q?ePeNzzIAzEMDyzhV2d8LYmDVLzD0wx8dXJ+ydvp3u3hflbnr0brspVAJbS?=
 =?iso-8859-1?Q?OHakjfmPPKVFrUdFlyHpEUQT8MaEfHrWd4u6k+AxSv8Ct4ws/F20mY75bP?=
 =?iso-8859-1?Q?jkmb2Is05FqWvk/H0i7624gTeGO8MN23fwe2QCivdGmVXQQwl61birRUlr?=
 =?iso-8859-1?Q?uBd2AIWfvF/jqOMQZITafKX2acFsBAXqdsRmj60qJTIPjgojoa8LknPcUJ?=
 =?iso-8859-1?Q?FFTj6turNMtK80TxFu8h64V5Vy1LD4SgTJy9ufDsaJ6kBySKqzbSbZUaZg?=
 =?iso-8859-1?Q?RKXI7LeBPuM61pDTST+kb3UkntQ7aNbuMrhthaY5xAJGy4FJRAHCoIGF7j?=
 =?iso-8859-1?Q?l5BPD2LwilszjOkNFt06sJoGAP23pKWTy+1AYn4TjKf36jrWzvk/2tldsh?=
 =?iso-8859-1?Q?BGmU3Oe8s09CFXHV8QdmqrPJW2NAW2GUYC9Xsq93qDD2NpkMEaRhM2bUyJ?=
 =?iso-8859-1?Q?nC3R7AGmnYlKWcLQ6qARD+/e3mOz0GIknWHvwMwECes2euk3HpUmOr0jYo?=
 =?iso-8859-1?Q?wNUk/uLptnTiMVFVBujETNpBSjaI3oFMh/eUvsTY07tk0iuDofUEDpZPx3?=
 =?iso-8859-1?Q?w2v8kh6rtfXHYwf6/ukEf8lAtWQrlD4GlXxaNZjEhmbJPoemc4y8aFi9W5?=
 =?iso-8859-1?Q?1q7Ig+ZGSL6UMsvR4iST1VIsapIYFGVMgdo90vrxdMh778YlFlM6RqQNT/?=
 =?iso-8859-1?Q?7tSQmZ1UY3gZ6mrVuXUKysOYkpRhWJW+PoyLRfj+zw9B2kejAd47r4xeIK?=
 =?iso-8859-1?Q?cxUaWglR4L6tXEhqdTQ5a4s7UB/uiklnJPWuRQd0xasNKE2F2kLeHj1OtW?=
 =?iso-8859-1?Q?2wlwLuo5T77imSBuh1pWZWUw7e9WGpuY9A0b7X46cuGX3j4yrYuGBIIvwV?=
 =?iso-8859-1?Q?Y++CIG+BbmmutKQjJ9PgyDlmyrhoGET1ZR8w0ABe4Ogh1OnNUr9os5zR0o?=
 =?iso-8859-1?Q?SfeM3qr029iayUkK/FphPQMKLyWqGBHVuMfFmJm6y0CYHaZ6nSXuKZm6ig?=
 =?iso-8859-1?Q?nGf+LkVUAv6EywuOpHyPpBAM39oF5eslxVr+BlveiFkBW5XjddVL2FhK3F?=
 =?iso-8859-1?Q?HMR81Y3xZzq/KqgA4Df45rSAX22OIYWbuURNszAuusguJ425jDnsWUfzK3?=
 =?iso-8859-1?Q?s/dVTugluP3oxKANHeD0V0kCPrVZxFc2pPAYUGAUJ5hSqtDoby0BwfXL/z?=
 =?iso-8859-1?Q?ZANPQrpJszvrYHlkoFlEV7uZ8VkyKhYIptf9/mYkkgEneRP82RyqU/RcaT?=
 =?iso-8859-1?Q?OkdWVRvE30rDCK327c4xhcWKKbR6x+t5cgVc4dB7NHFc54c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?yyaeGrDSkBIoQt4j9niPz26EWgA+xPEmFFQNQIAe4r7z31TV47Uq1dGlrK?=
 =?iso-8859-1?Q?eLAdZ4eh20KZXaIcxyX0whSmX/CXEwre10xNyGBiZIxXMF7VH3pWOe5IdD?=
 =?iso-8859-1?Q?uuHEouRIOEWyb4/BNj1nGmeHyvqbREn9gJ7BCpG7ziLHrnVCShaMh2c10t?=
 =?iso-8859-1?Q?g0Ccq5jvmyK2i+xPhUn9UQVYtFxwyqpQUQSCy7dB1qm8GrjEgawAQFYBK5?=
 =?iso-8859-1?Q?cnW+e0LkaHDXP0CKrccPyATO0cXQ3U+aJRi4+zaDRfZycukdOFpLL/3VRZ?=
 =?iso-8859-1?Q?fERH3XtjadAgjl0KstHkK9N7hJJciIEfvM9VVeTz4ojgvlfKI5Vh87QB45?=
 =?iso-8859-1?Q?h61e3lQKRX46ehmxTptS+j15m3PJddo5x/Q+UNHXgcZx4vRo6mAEjKBTbt?=
 =?iso-8859-1?Q?iBPMSnnq+ZctbJRAT2dX6eceWxFkcLaO39CTsZ0g5nQHn6+R40Gcgl2cdI?=
 =?iso-8859-1?Q?TIQeRzsyfbLC0GkzJvY0pTS+TIu60UD/gRl3vtV08pquwuQUGE50niCSDg?=
 =?iso-8859-1?Q?YqIbsgcpD8yG+pujc0FxMaHrLaYK3XnsG6pxH0X9RhOMIb8GcGMfeP+wcr?=
 =?iso-8859-1?Q?RaIlkte6W0F7REWaBvOAUhMeVEKjKiuJIlEOk3drEVP89e/O6v4y3t5xER?=
 =?iso-8859-1?Q?HfKDFW3fg9i8BKgnJdQ2FB/g2Fns9tc4b00+FP3LWE5DlbTyXBy2QxxiDq?=
 =?iso-8859-1?Q?gOmj3ZoM7wsGwOaoJp4YVAeWLWwKD5E48ye/j+01l2q/T+zEoVKkIPrJEH?=
 =?iso-8859-1?Q?z3irsyOhSYf8U0GtPFq1kAy4UEZD30rvFd5pOwnxv/HsNE7UjEyUNGLyr9?=
 =?iso-8859-1?Q?Kw/9dhyk6ofmZqMrzjkV2DzZeNaYtX5aB8WW3s/P1eJj65rmsgew6ulj0Z?=
 =?iso-8859-1?Q?yFfTVJbEUmQEHAvWECPmjutI4hQYoiG9wgSY0xChgjatHuXMpVxR5RlHzF?=
 =?iso-8859-1?Q?4Ei4VIfaCwTLUtg8K8px7kP4WMpFDTYqMlYlKDbVBhYdI9qRPFhH0eWQES?=
 =?iso-8859-1?Q?ElvAg9IjuwLh3r7NTU18A45d1cJeAmWe2egsyr/uTbrVoveZFkb2PKDoZd?=
 =?iso-8859-1?Q?4pC/fzlE5WjTtFXHEvPwCvvXcDPXynhIBujfjn9L8diTVU5YFUArpifd4R?=
 =?iso-8859-1?Q?SwFD7/e6wHUJeQdn6wK/dJnO9WCRe0Mir2PDGoIpB1xLRBuHONJsEDAy2G?=
 =?iso-8859-1?Q?mvBAx/e+zEbMsejnYsPc6PyRQQjFU2YO1z6IhTKtfBWrv79qzZUOGkZr/j?=
 =?iso-8859-1?Q?X50BUj8NqIVM2jYrFaMrbFaqIoO5lYrfVOqu74GFl/lvCU3UFJ4iZSfGyp?=
 =?iso-8859-1?Q?QhCpJtixbLZpOJZgorTFg+vjw256h8siDsis7/hRmUcfPjyBW/JSa8bdiB?=
 =?iso-8859-1?Q?rC3P8GpORTbqqfIXMb5vQfvwyHa+ljFzq8qk8xEt0mUh21RrkwryjfhTQe?=
 =?iso-8859-1?Q?DOxmIMby8/Z66Am87JLyEEtLt813Ii5XZI0DEYVX46O+VAaB6CWgYEAVqB?=
 =?iso-8859-1?Q?02qzOPTyav0AazK6dGV0wE4nfDMec7nk7CbXXkd59kesGcZ3tteh9OQDKP?=
 =?iso-8859-1?Q?UIZ9k1o9LSQBmEMRFKjFVDjqlgjt6Y1Kj+kJ+EiS0Ww/Q08b/OfK8t02d8?=
 =?iso-8859-1?Q?P5mT7ABCderEKf6giQRwyJBtMtyumWE7dkSyg5Xjr95NRf6He5PBUVbA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d648fa7-4c3f-47f2-3bb1-08dd1badb667
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2024 19:38:26.2302 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UieUgyZsPtOTgWLXvPlZDV9qd2peEfcaLI/yJUmx7SdBrC2/Smjv2fKCHxpd2gi7iqMDXCMnP5I4sHf7DDKp+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7740
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

On Thu, Dec 12, 2024 at 11:12:39AM +0100, Simona Vetter wrote:
> On Thu, Dec 12, 2024 at 09:49:24AM +0100, Thomas Hellström wrote:
> > On Mon, 2024-12-09 at 16:31 +0100, Simona Vetter wrote:
> > > On Mon, Dec 09, 2024 at 03:03:04PM +0100, Christian König wrote:
> > > > Am 09.12.24 um 14:33 schrieb Mika Kuoppala:
> > > > > From: Andrzej Hajda <andrzej.hajda@intel.com>
> > > > > 
> > > > > Debugger needs to read/write program's vmas including
> > > > > userptr_vma.
> > > > > Since hmm_range_fault is used to pin userptr vmas, it is possible
> > > > > to map those vmas from debugger context.
> > > > 
> > > > Oh, this implementation is extremely questionable as well. Adding
> > > > the LKML
> > > > and the MM list as well.
> > > > 
> > > > First of all hmm_range_fault() does *not* pin anything!
> > > > 
> > > > In other words you don't have a page reference when the function
> > > > returns,
> > > > but rather just a sequence number you can check for modifications.
> > > 
> > > I think it's all there, holds the invalidation lock during the
> > > critical
> > > access/section, drops it when reacquiring pages, retries until it
> > > works.
> > > 
> > > I think the issue is more that everyone hand-rolls userptr. Probably
> > > time
> > > we standardize that and put it into gpuvm as an optional part, with
> > > consistent locking, naming (like not calling it _pin_pages when it's
> > > unpinnged userptr), kerneldoc and all the nice things so that we
> > > stop consistently getting confused by other driver's userptr code.
> > > 
> > > I think that was on the plan originally as an eventual step, I guess
> > > time
> > > to pump that up. Matt/Thomas, thoughts?
> > 
> > It looks like we have this planned and ongoing but there are some
> > complications and thoughts.
> > 
> > 1) A drm_gpuvm implementation would be based on vma userptrs, and would
> > be pretty straightforward based on xe's current implementation and, as
> > you say, renaming.
> > 

My thoughts...

Standardize gpuvm userptrs gpuvmas a bit. In Xe I think we basically set
the BO to NULL in the gpuvmas then have some helpers in Xe to determine
if gpuvma is a userptr. I think some this code could be moved into gpuvm
so drivers are doing this in a standard way.

I think NULL bindings also set te BO to NULL too, perhaps we standardize
that too in gpuvm. 

> > 2) Current Intel work to land this on the drm level is based on
> > drm_gpusvm (minus migration to VRAM). I'm not fully sure yet how this
> > will integrate with drm_gpuvm.
> > 

Implement the userptr locking / page collection (i.e. hmm_range_fault
call) on top of gpusvm. Perhaps decouple the current page collection
from drm_gpusvm_range into an embedded struct like drm_gpusvm_devmem.
The plan was to more or less land gpusvm which in on the list addressing
Thomas's feedback before doing the userptr rework on top. 

As of now, different engineer will own this rework. Ofc, with Thomas and
myself providing guidance and welcoming community input. Xe will likely
be the first user of this so if we have to tweak this as more drivers
start to use this, ofc that is fine and will be open to any changes.

> > 3) Christian mentioned a plan to have a common userptr implementation
> > based off drm_exec. I figure that would be bo-based like the amdgpu
> > implemeentation still is. Possibly i915 would be interested in this but
> > I think any VM_BIND based driver would want to use drm_gpuvm /
> > drm_gpusvm implementation, which is also typically O(1), since userptrs
> > are considered vm-local.

I don't think any new driver would want a userptr implementation based
on drm_exec because of having to use BO's and this isn't required if
drm_gpuvm / drm_gpusvm is used which I suspect all new drivers will use.
Sure could be useful for amdgpu / i915 but for Xe we certainly wouldn't
want this nor would a VM bind only driver.

> > 
> > Ideas / suggestions welcome
> 
> So just discussed this a bit with Joonas, and if we use access_remote_vm
> for the userptr access instead of hand-rolling then we really only need
> bare-bones data structure changes in gpuvm, and nothing more. So
> 
> - add the mm pointer to struct drm_gpuvm
> - add a flag indicating that it's a userptr + userspace address to struct
>   drm_gpuva
> - since we already have userptr in drivers I guess there should be any
>   need to adjust the actual drm_gpuvm code to cope with these
> 
> Then with this you can write the access helper using access_remote_vm
> since that does the entire remote mm walking internally, and so there's
> no need to also have all the mmu notifier and locking lifted to gpuvm. But
> it does already give us some great places to put relevant kerneldocs (not
> just for debugging architecture, but userptr stuff in general), which is
> already a solid step forward.
> 
> Plus I think it'd would also be a solid first step that we need no matter
> what for figuring out the questions/options you have above.
> 
> Thoughts?

This seems like it could work with everything I've written above. Maybe
this lives in gpusvm though so we have clear divide where gpuvm is GPU
address space, and gpusvm is CPU address space. Kinda a bikeshed, but
agree in general if we need to access / modify userptrs this lives in
common code.

Do we view this userptr rework as a blocker for EuDebug? My thinking was
we don't as we (Intel) have fully committed to a common userptr
implementation.

FWIW, I really don't think the implementation in this patch and I stated
this may times but that feedback seems to have been ignored yet again.
I'd prefer an open code hmm_range_fault loop for now rather than a new
xe_res_cursor concept that will get thrown away.

Matt

> -Sima
> 
> > 
> > > -Sima
> > > 
> > > > 
> > > > > v2: pin pages vs notifier, move to vm.c (Matthew)
> > > > > v3: - iterate over system pages instead of DMA, fixes iommu
> > > > > enabled
> > > > >      - s/xe_uvma_access/xe_vm_uvma_access/ (Matt)
> > > > > 
> > > > > Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> > > > > Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
> > > > > Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> > > > > Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com> #v1
> > > > > ---
> > > > >   drivers/gpu/drm/xe/xe_eudebug.c |  3 ++-
> > > > >   drivers/gpu/drm/xe/xe_vm.c      | 47
> > > > > +++++++++++++++++++++++++++++++++
> > > > >   drivers/gpu/drm/xe/xe_vm.h      |  3 +++
> > > > >   3 files changed, 52 insertions(+), 1 deletion(-)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/xe/xe_eudebug.c
> > > > > b/drivers/gpu/drm/xe/xe_eudebug.c
> > > > > index 9d87df75348b..e5949e4dcad8 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_eudebug.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_eudebug.c
> > > > > @@ -3076,7 +3076,8 @@ static int xe_eudebug_vma_access(struct
> > > > > xe_vma *vma, u64 offset_in_vma,
> > > > >   		return ret;
> > > > >   	}
> > > > > -	return -EINVAL;
> > > > > +	return xe_vm_userptr_access(to_userptr_vma(vma),
> > > > > offset_in_vma,
> > > > > +				    buf, bytes, write);
> > > > >   }
> > > > >   static int xe_eudebug_vm_access(struct xe_vm *vm, u64 offset,
> > > > > diff --git a/drivers/gpu/drm/xe/xe_vm.c
> > > > > b/drivers/gpu/drm/xe/xe_vm.c
> > > > > index 0f17bc8b627b..224ff9e16941 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > > > @@ -3414,3 +3414,50 @@ void xe_vm_snapshot_free(struct
> > > > > xe_vm_snapshot *snap)
> > > > >   	}
> > > > >   	kvfree(snap);
> > > > >   }
> > > > > +
> > > > > +int xe_vm_userptr_access(struct xe_userptr_vma *uvma, u64
> > > > > offset,
> > > > > +			 void *buf, u64 len, bool write)
> > > > > +{
> > > > > +	struct xe_vm *vm = xe_vma_vm(&uvma->vma);
> > > > > +	struct xe_userptr *up = &uvma->userptr;
> > > > > +	struct xe_res_cursor cur = {};
> > > > > +	int cur_len, ret = 0;
> > > > > +
> > > > > +	while (true) {
> > > > > +		down_read(&vm->userptr.notifier_lock);
> > > > > +		if (!xe_vma_userptr_check_repin(uvma))
> > > > > +			break;
> > > > > +
> > > > > +		spin_lock(&vm->userptr.invalidated_lock);
> > > > > +		list_del_init(&uvma->userptr.invalidate_link);
> > > > > +		spin_unlock(&vm->userptr.invalidated_lock);
> > > > > +
> > > > > +		up_read(&vm->userptr.notifier_lock);
> > > > > +		ret = xe_vma_userptr_pin_pages(uvma);
> > > > > +		if (ret)
> > > > > +			return ret;
> > > > > +	}
> > > > > +
> > > > > +	if (!up->sg) {
> > > > > +		ret = -EINVAL;
> > > > > +		goto out_unlock_notifier;
> > > > > +	}
> > > > > +
> > > > > +	for (xe_res_first_sg_system(up->sg, offset, len, &cur);
> > > > > cur.remaining;
> > > > > +	     xe_res_next(&cur, cur_len)) {
> > > > > +		void *ptr = kmap_local_page(sg_page(cur.sgl)) +
> > > > > cur.start;
> > > > 
> > > > The interface basically creates a side channel to access userptrs
> > > > in the way
> > > > an userspace application would do without actually going through
> > > > userspace.
> > > > 
> > > > That is generally not something a device driver should ever do as
> > > > far as I
> > > > can see.
> > > > 
> > > > > +
> > > > > +		cur_len = min(cur.size, cur.remaining);
> > > > > +		if (write)
> > > > > +			memcpy(ptr, buf, cur_len);
> > > > > +		else
> > > > > +			memcpy(buf, ptr, cur_len);
> > > > > +		kunmap_local(ptr);
> > > > > +		buf += cur_len;
> > > > > +	}
> > > > > +	ret = len;
> > > > > +
> > > > > +out_unlock_notifier:
> > > > > +	up_read(&vm->userptr.notifier_lock);
> > > > 
> > > > I just strongly hope that this will prevent the mapping from
> > > > changing.
> > > > 
> > > > Regards,
> > > > Christian.
> > > > 
> > > > > +	return ret;
> > > > > +}
> > > > > diff --git a/drivers/gpu/drm/xe/xe_vm.h
> > > > > b/drivers/gpu/drm/xe/xe_vm.h
> > > > > index 23adb7442881..372ad40ad67f 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_vm.h
> > > > > +++ b/drivers/gpu/drm/xe/xe_vm.h
> > > > > @@ -280,3 +280,6 @@ struct xe_vm_snapshot
> > > > > *xe_vm_snapshot_capture(struct xe_vm *vm);
> > > > >   void xe_vm_snapshot_capture_delayed(struct xe_vm_snapshot
> > > > > *snap);
> > > > >   void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct
> > > > > drm_printer *p);
> > > > >   void xe_vm_snapshot_free(struct xe_vm_snapshot *snap);
> > > > > +
> > > > > +int xe_vm_userptr_access(struct xe_userptr_vma *uvma, u64
> > > > > offset,
> > > > > +			 void *buf, u64 len, bool write);
> > > > 
> > > 
> > 
> 
> -- 
> Simona Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
