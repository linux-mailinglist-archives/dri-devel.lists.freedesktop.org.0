Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCDD292C28F
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2024 19:33:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4839310E60B;
	Tue,  9 Jul 2024 17:33:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GuA+1q8f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 894B110E083
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2024 17:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720546399; x=1752082399;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=+nbXIzY309qLeW5sCNxaIKlA4h++0Lx4eB7fBSQE1+E=;
 b=GuA+1q8fgLMLTDQ5S5G9t0iOn+bvIGbPM8gVVE+I1Ru1M9Qmzq6LDllY
 wbP469Mi6Iqfr2INvoNzpUUl+voeJXGs9NiSrYCWPocusyttoZfDtrKRV
 WZBlSvyRCurDrq/3TsOiNEut76tsxkziEh9zoyHj23R44CnSXQXQQcKuj
 6GDCehe4ySYVk+3xqBl2rEeDV5BjjlPwGAnEm9eRVSukVSDXRSpjcHerJ
 /219s1PiRcyHOUjADcb/Vh6SCGmSI3dHOUsg58UCNKcUZ+COsiMQvhpuF
 KgaT2JKTNDkVhvRrPDM2FgT5dKcSsXBQzrCbscnXzfLYeJ5H9JwmenR7F A==;
X-CSE-ConnectionGUID: 4yX05CR3STezvhwpdOfwEg==
X-CSE-MsgGUID: DGSqapEOR26vKjD3bdedqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="12457981"
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; d="scan'208";a="12457981"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 10:33:19 -0700
X-CSE-ConnectionGUID: oDBRA+0ITo+GXUIPyJpsXw==
X-CSE-MsgGUID: EIywkZ93Q4CQ3ZOE26Awvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; d="scan'208";a="53107161"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Jul 2024 10:33:19 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 9 Jul 2024 10:33:18 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 9 Jul 2024 10:33:18 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 9 Jul 2024 10:33:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H6DRc6ZIiMZ/VaG5pGmwKYoOeCeEyi1HnHo1T4MXavSK48T8ll46E5VQ3lnGFUv/wzjbfB9NC8azwdiDxNo7upogBd3Zf6vq0ISE2H7RHsiS4qIuAm5dHL0pEb6K7KM2FULkttFTo2bb4Bkowga94Uzl+gpc1l0yweUKAy8Axn7q7Jun53KIKQwlidwr2QJUHssGpvkS+VoZ0QMDKAUs0rO3oXBJB2oBdDsX1Y2qMX5Ko0hcETEuPKPIgL6QWlZQemOUf7g4zYzAnLuA4Co1ThxzdGCDkt8SjpOWtZxVtQTIjhqf7r1jkvMpc8Qa5HIyyb2SZ8KIk+fRRjQUhEYoSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XS8nn6hFl40j4X7z/MwmoZ2rr+23onOy9vOcfjOwHac=;
 b=aDGvdT2MWS7MIw5YPSHTrh3MBuHxIiqQ1xi0grqK6fkijNWeeIjN6uWBaBhNp9pxYIQRbHc3XUSvRKdTIEc8geGpvR3uhQrVTLZaIJBZZpf5nkEyh9YS1XphkXfHchBJv6kglqvaUz+cp24B/mRq48TE1l45B6x4ABR+Dz0+Cwmgig/aF7Qsu19dfSPXaVxjOUfukiuNnmexp3Mzopi2rWEQTMyOgAOO78xsMhe7WPYgX6FhLXFl+6FImL33iTDy9qWfoRAb2hG+5EgEzSEOn1SvyR0GXtJoy6BnXgeYGwAvtkHUmgABzC9p9qEwxZRJB5sRv1thAtcWBvh7aPCV6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by BN9PR11MB5306.namprd11.prod.outlook.com (2603:10b6:408:137::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.20; Tue, 9 Jul
 2024 17:33:15 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.7741.033; Tue, 9 Jul 2024
 17:33:15 +0000
Date: Tue, 9 Jul 2024 17:32:21 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
CC: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: The TTM LRU-walk cherry-pick series
Message-ID: <Zo10JX5GlNWDKou4@DUT025-TGLU.fm.intel.com>
References: <0db8246a59e67c8e740110c6cfdd8339bec97f32.camel@linux.intel.com>
 <ZowEX6tlXJJafTDZ@DUT025-TGLU.fm.intel.com>
 <e356d7e2-33db-4aed-bfee-8e0828372527@amd.com>
 <ZowG//hThxa4zDPc@DUT025-TGLU.fm.intel.com>
 <b56aa968-011f-4b6c-b28b-564378bb5e68@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b56aa968-011f-4b6c-b28b-564378bb5e68@amd.com>
X-ClientProxiedBy: SJ0PR13CA0230.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::25) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|BN9PR11MB5306:EE_
X-MS-Office365-Filtering-Correlation-Id: 32c94b2f-05be-4241-2c7e-08dca03d3709
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?JMFIewpqslFiPFl9Uhk1S/kL6kZEpFNKan64eTj/uT4fXWJFpMQxDGMS/J?=
 =?iso-8859-1?Q?4cvE/lWc4lVA808iq5vMeTje0PBk52+i7EerjHS3bnYZUt97l+fvyFjbMC?=
 =?iso-8859-1?Q?8IV9I/8fickUGR8naWNRzI+r+rzc6mQgQOZFYbneSKprK5nmluG9X6z72m?=
 =?iso-8859-1?Q?F9MBydQX2V0Nd1v7Lkj6bwem42gDmk5cmcxPAgjAeFIKDxGdT0Q1uoC72L?=
 =?iso-8859-1?Q?MTas3avYFjli++c8aM+KC+LTLId2ZradtnuL8fmi7YL+S7I9bpr0UqjTJf?=
 =?iso-8859-1?Q?T2PB0xCDMlUP58BMu5LRweceSnf87fY+xqkCS0W0EscN0LIfHp9sb3t2TX?=
 =?iso-8859-1?Q?yM8o9651KvFXb+GgF7LHIf53Jf4AS5NavqUKp8Su6WySUYpdZx3XckIOzU?=
 =?iso-8859-1?Q?IcyhpWiA8DWz43bjobOrls1e5HzYnMILP0t6ArbQtmT4A9h9Z3JbPAb5Of?=
 =?iso-8859-1?Q?ymBZPhZwYEEziDemiymq1W97Ns4GNz0lAG8RICIk0DNkkecxoHj7oZYG3R?=
 =?iso-8859-1?Q?wbG/eVRskq+aBVHZn9lhz7vomD/5FnUSU0PffigbMq4ZKxuz/u1x2WK9NM?=
 =?iso-8859-1?Q?FFI+d/P8+KLKzeFrsr3LbKBtzVx2VINvnGtQ0Wdn9uqXYKN2P0b2JbLSU1?=
 =?iso-8859-1?Q?d9tovMrOaRrz+5SAnpohxrS3WT7qY9MjHVAlwpOC9RUag3kYX+9NUnkT3W?=
 =?iso-8859-1?Q?/2nIdkd7SSlLDdOT02ZhOACGh29cILwCj5ElHL8Fvi15r74Ugj/HFx4Yp6?=
 =?iso-8859-1?Q?3L0lnAN2mVQZvgjjq4gYkzB4VMjZU2LAS/MVlEeBJuUJENPRHtyPaYPiGE?=
 =?iso-8859-1?Q?GYJ4MxPG75BDVB9TfPjaz9mD5dXqPmvHkUwWFKy18kS87VaD7clZrhB7VS?=
 =?iso-8859-1?Q?5/bWlQA2LfbP1htG2E8GbBeNwX3FvvzhVubJWM49j5TB29Fk+vAROlQoJr?=
 =?iso-8859-1?Q?sc55T82X4Pqz2BLJYdnWqt5h1GhGw2aELTiC9Q+udWSUyMn4+gdxQqj98p?=
 =?iso-8859-1?Q?qv4vsAFnKLfNHp+D4Z+L2mSeFdVO8MSvOBvj4LhGZigsE/sBlKxtSmHo2f?=
 =?iso-8859-1?Q?THvwMLP8OOZ/jL+bY03mjcJxaGCv9iq0J7ViXX62FPIIKgjT1XNUQ+Lfr5?=
 =?iso-8859-1?Q?2VYbRX1P6KDTLREJWp4LC4NomvFrnm+/9UZ1cuFgeFTTlZSyYgK9QGDbKB?=
 =?iso-8859-1?Q?H+CM8tmA6SIJrwgpqK1m8BhflbKvVLyuodqz9UnS8q4+r7vJMO6SHlg1kK?=
 =?iso-8859-1?Q?6XNVsNWXDtXurc1Bj3bAIZAJ10HLoWjfr9Hn91e2+TcVWz/KeESEzMb/nE?=
 =?iso-8859-1?Q?Xfd9QfP8hGaq22lHLGt++8r2LR/5xQpwlqcoSNgly7m4Kbw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?O8IMLcvu/oTvANeXGewJyzEKtYYbvO+9wZ2noRJMj7qJ+UlKWTYZ6MivLe?=
 =?iso-8859-1?Q?Cys0cGi3OjWtXM6Na1XeKL6dpORVhbnhhAgQQ46WR1fSxb2EAwX021mwj8?=
 =?iso-8859-1?Q?eobBTsFc40a4ziBL5+LWLCUIdqiYE6Ma4u9QV7lL1QklhIWZ62Lp7CuQZd?=
 =?iso-8859-1?Q?02LVIWRC4cUUC2oNsk+nR7u+wOLqoQLjWglLvKX3HxmCOWfZ0NuvxBvgbk?=
 =?iso-8859-1?Q?ZBDs1N2/D9UprD0KILo/KQALarCZogvZ1j2gZO96ogPhwWsRCascd9jdw8?=
 =?iso-8859-1?Q?EfHC8uqq2pYNpIgQezWQe/fS0ULClOE0p6VvpzK+EybVoDYfWd38Pk7zmr?=
 =?iso-8859-1?Q?4yQDsMPgN0CGgvo7b7nFiEtUIEjlYU3L5R5blRXQbwDiPBs04wc+2HPfQn?=
 =?iso-8859-1?Q?mooTezviJiZXSGgV5kYm4JvrAcul/CzDr6/1TmOi1+qSawe5bZVISuhOW3?=
 =?iso-8859-1?Q?5y3XbRW0Hg+DD8F29vJy7z8AdMshyk2xO7+LyN0tR2AgURTJgjIlRjsCSV?=
 =?iso-8859-1?Q?T2JJFMw5jmFQecwlMDyaWSF9+5ij9eC0+5OCdyYGX51ZoGvZ5VxAhva4gM?=
 =?iso-8859-1?Q?W6SE8jXJKXoNolBOpMBAJyW5UQvJ4EaqRFeg5e0DLVyqzTcST3bU/WiOFe?=
 =?iso-8859-1?Q?84xY4D05I8W0VlDr5z+Sen1DmDiA2M01GpAtvXoOAiMEBpp76tmY0WVUif?=
 =?iso-8859-1?Q?SMU1HgvJqDRKrBsEzZ0BIhReHHZ+xmvOByKrpZBh6+q4qJclq61STqvA+X?=
 =?iso-8859-1?Q?/+Ksjj34aUNGr261IzIbUxctQavjF4Bs/2IqKVC0aGu4Ixsb4pAzc5j6hW?=
 =?iso-8859-1?Q?nhiznokKdAcRhLaGhoM48eo6loniG6SXRqr52du6TL98KrsCJOZjXoqQeo?=
 =?iso-8859-1?Q?QC4pug4AsbU5egA/0qIfoiwyxgBQYzoYKWLJTA+I3py/fO8sYaycVNcAiR?=
 =?iso-8859-1?Q?EXMGzqkA5X+pfRbI1pQ6UpH/H6dSwgi6008STg7wBMNfu/HemH7KkMdq56?=
 =?iso-8859-1?Q?GvKyPViYOmDcD8YOgW1cINmCkSBH62+oGxgTTzmaXd8/sKy0rpfE28PSZ7?=
 =?iso-8859-1?Q?1+X5YJ2gcG1aUiQg+OOAq54e/Pq2p2JfBuloGVpn3VybqfC2v/G1Z3dLzX?=
 =?iso-8859-1?Q?tUsH/KVaPY5bDjTQ1A91tCzamqD3NA06ACnZ2Q6WIx3+y9fs39u4lcAeS7?=
 =?iso-8859-1?Q?ODpC4q8Q2JVFEV11y3zdK8tS0Mv1steEa7GchCvUSWsV8FxGL9MJVQif3V?=
 =?iso-8859-1?Q?fmYh0eIHcIu6a0G+PaKVDOjtzJ1lu/JtiJARtKcByA+1adQprOfU4vPkFm?=
 =?iso-8859-1?Q?KIHWL1wmgaH/H5pQ3G7WKsjk/nsmfEmV8+ldHg5L9ZPWYsJwD6S/CQCd8K?=
 =?iso-8859-1?Q?7wpB7Q+HJSPmfmOIOnYjaIY+Wasr5pkXmlDzh0jbkdQ6LrC6ZZdUIIzJdn?=
 =?iso-8859-1?Q?GTbPyU0tKfnRzCm1O4+4Rzx2Y6BCwDW5IbuTS/hR7f4A6ibAcw6ACYRmeF?=
 =?iso-8859-1?Q?eaJBRcGRzt7RdycInZRqo9tIpF8zcMteVEiY+7BDXyHptLrDcYCZYN+O5C?=
 =?iso-8859-1?Q?+bc5tiSZ489Asy7EvGTPp/hW79Kbr27q9/AOF733VJ3Elpr/DRLrdzhdog?=
 =?iso-8859-1?Q?4HvspaU+LNS7kQzhlamuYckR0Po+FWsdqHWfwC1wq1qF5iZIAIku0hKA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 32c94b2f-05be-4241-2c7e-08dca03d3709
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 17:33:15.8238 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5rSBBKHMit6Cir0jJpuoWosaal+FEkOdhjJcKeuWrH2TOsA/QuEAJ6XiFTYF7D7+WKEh+h++OwY9lDMrbvW28A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5306
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

On Tue, Jul 09, 2024 at 12:54:13PM +0200, Christian König wrote:
> Am 08.07.24 um 17:34 schrieb Matthew Brost:
> > On Mon, Jul 08, 2024 at 05:29:30PM +0200, Christian König wrote:
> > > Am 08.07.24 um 17:23 schrieb Matthew Brost:
> > > > On Sun, Jul 07, 2024 at 05:49:16PM +0200, Thomas Hellström wrote:
> > > > > Christian, Matthew,
> > > > > 
> > > > > I think I addressed all review comments and a couple of anticipated
> > > > > ones (s/long/s64/) in the swapout- and eviction patches.
> > > > > 
> > > > > I'm heading off on vacation today, (4 weeks) so if something becomes
> > > > > urgent in-between feel free to pick up, modify and merge.
> > > > > 
> > > > I found a couple of nits in last patch of [1] but gave an RB as the nits
> > > > can be fixed on upon merge.
> > > > 
> > > > The series [1] is fully RB'd and CI looks good. I'm thinking we should
> > > > merge this. If any bugs pop after merging feel confident that I can
> > > > quickly fix them while Thomas is out. Also fine for waiting for Thomas
> > > > to return too.
> > > > 
> > > > What do you think Christian?
> > > I'm currently working on testing patches 1-7 and if that doesn't show any
> > > immediate problems will push them to drm-misc-next.
> > > 
> > +1
> 
> And pushed.
> 

Great.

> > 
> > > The kernel build bot also complained about something in #8 additionally to
> > > your nit picks so I think we should investigate that first.
> > > 
> > > > drivers/gpu/drm/ttm/ttm_resource.c:607: warning: Excess function parameter 'man' description in 'ttm_resource_manager_first'
> > That is the kernel doc nit I raised.
> 
> Ah, yeah ok. For that minor cleanup we can wait for Thomas to be back from
> vacation.
> 
> Important point is I can now rebase my drm_exec work on top of it.
>

Sounds good. Will keep an eye out for drm_exec changes.

Matt
 
> Regards,
> Christian.
> 
> > 
> > Matt
> > 
> > > Christian.
> > > 
> > > > Matt
> > > > 
> > > > [1] https://patchwork.freedesktop.org/series/135801/
> > > > 
> > > > > Regarding the drm_exec trylock functionality I'm for as much as
> > > > > possible that it should look like any other locking primitive trylock.
> > > > > i.e. no additional tricks needed.
> > > > > 
> > > > > Thanks,
> > > > > Thomas
> > > > > 
> > > > > 
> 
