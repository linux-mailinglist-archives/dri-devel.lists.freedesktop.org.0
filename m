Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE9C94D4DE
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2024 18:42:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DEF010E99E;
	Fri,  9 Aug 2024 16:42:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fKOCoCV+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3290C10E995;
 Fri,  9 Aug 2024 16:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723221721; x=1754757721;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=EUAwS79JgtzvpjFCmSqvWHowlDmrfl/puXO7rFImo4A=;
 b=fKOCoCV+XpyP5wMk9aKJD5k7peUFbQB6bI1nV5OYhL0pWJVNn6fFAEIZ
 nQWN+8NV+AR9hVD5dZu3Rc1Hm04+DyZuOPf/I0sjntrbvubdd14MG2QW7
 GJq4LpQxMO3/3gmc2L+Lt6itVPxjAbmUBg11e9DRYY+Dx1ry9+GcLZRq4
 UWU2UHOm8vKx3TdPdPpUpdP+05RSSt1DGd4j45PIrNiI/8elabj20d10I
 5ZZTAYAU4nt4WiynPkCflgLltqylbyvnnlOpKkqoRYaSVoL4Jb+2sQJK2
 aOyizYf0NkLQSl8lkIuhjsil3tTJMKGsou+QVFCspboxVM/00R/MIwNoX Q==;
X-CSE-ConnectionGUID: jBZgsmKlTySAn6T1HL2/vA==
X-CSE-MsgGUID: FD4xSceoTAmTyt3gI2uzJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="32083456"
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="32083456"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 09:41:51 -0700
X-CSE-ConnectionGUID: 52+LIKwgRN2+QTJBdMCHVA==
X-CSE-MsgGUID: bvFoanu6TNevQdIeIuarvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="62018565"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Aug 2024 09:41:50 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 9 Aug 2024 09:41:50 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 9 Aug 2024 09:41:49 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 9 Aug 2024 09:41:49 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 9 Aug 2024 09:41:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EwEwSSUaCbEbsicSN4BcMDTNPocoWNBs00SPMoCEis9pRHpJ16LCRxl/+HOJ4tH+lKbJc9gRAJiVLFOr0JYp04WGAFoxRylmwjtzMMrc0FC8YtJPhd4g1ACqw77zvOYJTOQtSetWoPVT8wKsI9NtSVvogjsmCxy0gXnS+nRC+xlLkJEpXnzeZ1qRwMKWAWKsqEAnfWNYUIWWtoHtGjRTO16BRUSM5u0cz1FhKYz63xbdyUx+phBadadIrzZVEeUJ/lx8mu4eFIBaxwI0vefbCxX6OLQto/5JSoFHTY9vRL14CI33VLCkxuOgBHt6tXJPAOGtMr9AyNFDZT4kkgGPLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U8reSxUZLVKiKJDm/219A5kft8O3qjOJkzDt801wSR4=;
 b=F8GHOlOMfTTHYFkhJT0yeQB3rik2FuQyUavN1dht++WkPt3S/2ugT0o7Ml1zKMkVn08esWko8sqyG81gR89xCjfRTB0zi2L8myYPMGikf8vjLUR9p3DjE4xx0A8+hQsojUtWDs0MGItNo4gbQjSUwMl1H9d9dCfNM9STvJF4Dw5xMwwNtdSn8Zojr7r4IlVhs5NFZehF6U527lolykfB87tH12JKxT9wXa/jd/O7hv+lWYcug/M2YkOJlfnLPn6H0jk6rbJADcOwyRAGIbSOCOZxBJWAvGmaWr0bFlHyj/9HkK++mwnslSrBqPaWHa/Plz0RHvzX4XdI+K6GF+ILRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA2PR11MB5002.namprd11.prod.outlook.com (2603:10b6:806:fb::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.30; Fri, 9 Aug
 2024 16:41:47 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7828.031; Fri, 9 Aug 2024
 16:41:47 +0000
Date: Fri, 9 Aug 2024 16:40:22 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Somalapuram Amaranath
 <Amaranath.Somalapuram@amd.com>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v6 10/12] drm/ttm: Use fault-injection to test error paths
Message-ID: <ZrZGdm46+6/sUAwc@DUT025-TGLU.fm.intel.com>
References: <20240703153813.182001-1-thomas.hellstrom@linux.intel.com>
 <20240703153813.182001-11-thomas.hellstrom@linux.intel.com>
 <ZrQGoAzeOsQvH4s2@DUT025-TGLU.fm.intel.com>
 <283acf5a6a3b99a5f3448edbdc00d7cc2bdda17a.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <283acf5a6a3b99a5f3448edbdc00d7cc2bdda17a.camel@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0215.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::10) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA2PR11MB5002:EE_
X-MS-Office365-Filtering-Correlation-Id: 12524291-1163-41af-feb3-08dcb89228b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?TfzlPRkWZvYo3Of45RZKdtNFykCBrCUy+5TsaDXBFCrC2yeHoMOWWNEw7Q?=
 =?iso-8859-1?Q?1NkI/U2ZKZDFQpEagSh0rJgu/TfNbnZTI9XB4RF4cEB07xHAckET5jMygK?=
 =?iso-8859-1?Q?Yx5wXXjiORzTKULBFotKjRmSn0GzBTbEQQkPZps8u7bpDn6hfnxCpbnrgO?=
 =?iso-8859-1?Q?1K0UQffVnrsxdhSZ80N9ekCNmduyQM0RXp8/cC31a45GBbhtxmqxg4ovZr?=
 =?iso-8859-1?Q?JYZ1vw0bS9q43I0JbPOyXpYgW/C9HE481dCHOsITJhRkWWn+bi7Z2aJWWl?=
 =?iso-8859-1?Q?TONcNHqq3SizB9Gaj0ZW1yj8+MuFYq2Bxew1+p4yDEw8aNdKNk0IKyL90r?=
 =?iso-8859-1?Q?FnzGUqyQW2KT3Xe3O2GH3uXK7u+wD3z+VvCynKBM4sTQ0XChyzxjKu7qRO?=
 =?iso-8859-1?Q?QS457GA/lwlOVKNsQnKoVo4E47X0TMwj7XM0/dj6/51vG8DVWy7WpwK1y9?=
 =?iso-8859-1?Q?iIaYRWJ/M1jGxp9EsOJQZQNnQm0cfB88CL/FzYpK6iLXpoZnGGPBazwfBJ?=
 =?iso-8859-1?Q?to8y1NBxnDe6Ch/Z1+a0QhXfvfdblnIVgQUhQRbzlFSYk5VumtcIJIsLoI?=
 =?iso-8859-1?Q?AauEH4sZriOIE77LdukJNo6zjGqzt0JrlRQsoXxhFoPmMj7XqSArvYN/de?=
 =?iso-8859-1?Q?e/3nY2ftMRET0tJkcFXhfT2LPPyhlOzQG5DvTksSW7+MI4SkJ7IzuTrkTu?=
 =?iso-8859-1?Q?n0781IgAJ2EPTi9qFUIgCq5YpLNaYHV+jclnqKGHJLfzgjoSpt3+xGeppv?=
 =?iso-8859-1?Q?LkENTJJK5CigYzseACIBNhleTxg1wMopEX1qXAedgtm7X3CiMZYmeqsQ1U?=
 =?iso-8859-1?Q?qTxdZVABqWqMvlJEkYKm+yBulZGVBd4gHp6rhDlB0NF+TY9/5eJqxvd+sT?=
 =?iso-8859-1?Q?MDfLdwpS2ohXXb0ib5+3y8weSLl5jOvS7a1zVTDjQCWtCbUTsAeIula/NN?=
 =?iso-8859-1?Q?6cSe4OgJ4RQmow9CipLIitMP3PGnqJI/ypmKsuGq9gNIXWT1PwbnMU1+Gn?=
 =?iso-8859-1?Q?jnWObCnE+Yk2Tp+7Owfvw35gk0eQujs29gsDw0t7QNED56REaEd1SyNDt4?=
 =?iso-8859-1?Q?WjELiDX/4PKrFJRbv/1fmVzWawn+wU03plEYT4GKyofQ2fcskpHxJQjZpD?=
 =?iso-8859-1?Q?GqTAmJiAkbcB90jJOZMWHFoSjt4OmmXC0XwlqRvAUPs2n6BZWazzF2YfJr?=
 =?iso-8859-1?Q?jFJRj3riFFguw0WYHN+yd+VuFwoZyEbz/suGLgfN9aDW9Umnhvve+TkaSK?=
 =?iso-8859-1?Q?Mf7dZvX4mPtC1snE4lJ6OPF5hjLX3E6RUhJVzcx3rZWzorpjAPZ50LXRnk?=
 =?iso-8859-1?Q?utJUmhB9jqPizWxigidNi98UtO/t5EQffTRNPOCUpekiZuAgOjY9cg68f+?=
 =?iso-8859-1?Q?q/Q7ZKEapDJr+Hc09EOUnryF7TkQMpPg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?UKlWIX8Wg0ZgjOcVVVZULHNu+345YZbMHE2ez/+i9juyLnUz5lY51U6zP0?=
 =?iso-8859-1?Q?4WKd1VZ/oPhrnKLgnjKYkRtOnGOepMwV4KR+sUOpY2xQ5dUmH1eArweYrw?=
 =?iso-8859-1?Q?Qmh2EXQ7ABjMnNIpKgqa2F8D9v7FNviwgsh8RvQUP4gKP4Env2yUsKVf/D?=
 =?iso-8859-1?Q?LbB98MmtRA/UJTwvVXgjlRFZnNA4/1Dr7hpsT0a9ouzb2Kisk7BiOPZU4V?=
 =?iso-8859-1?Q?0JoUqp23WdI2B/zp6KFWeEeJIW2I+lU3UlHyNramCEakq4spoLklFvLS/o?=
 =?iso-8859-1?Q?AZSTl1+vwblG3YwEpoSBUlwEDnJ7wK5Vkzcy4GUXICRoRVchl76SXw4E0r?=
 =?iso-8859-1?Q?ueuRmyTZs/KsbNVOdKKAKeSuePkfVv89/A3u7gEHWhetr1tz2tnFDmNzRs?=
 =?iso-8859-1?Q?xGq53iz9DNztMcNKBmlvLyYKTPW4CvdWCQ+vLQbhrbnDfZSyye9UVy8lcC?=
 =?iso-8859-1?Q?PYpA+SKQSyfkzoA+ya5Hc/f7cvmmt8CaMYP2nAWcpaZn1kg+013Kqffpig?=
 =?iso-8859-1?Q?uTcToU9tKNvcNSOehMSINjIG2oX3Xul80v1BwR/Rsn4OqalepfJsZeXqxG?=
 =?iso-8859-1?Q?ZvQg06GDkogSbP1NSqN45pMaEGQyaXRvqpqdkcvMXH1zvLXDvsJ6mLoTOL?=
 =?iso-8859-1?Q?xwWBojlaZhOQmt6s+NpMURXJ0yrl9IkHFA5hQOF3AyBLfGnEI6rCTSJML+?=
 =?iso-8859-1?Q?wRYbTQgBjmbsxiz3buMiYFYfeymccDvMHlSraXrZHHE9KutGiXHu+HsxDq?=
 =?iso-8859-1?Q?bCFlVcpfixIoNcjhOMCICgX7ZSKSQ/DIjAt5rYYTtBFa/wzpyJ600A5xK7?=
 =?iso-8859-1?Q?AhonnoODnMPvYTe5Pn0eDTN/VdrAm1Mg0HX4hcibvMT3r4HjTrOAwdSQyi?=
 =?iso-8859-1?Q?TWltsCKT04kRidt81n9cN49Z+GD3sdNHdmhsr2s3BBPUwb7PbVBHlS2rF5?=
 =?iso-8859-1?Q?NIG+Q8hjpPaU9ieixVuKPQs7Fepzie7ZD5VCcFD+mD3XVNNTVp109tRvEI?=
 =?iso-8859-1?Q?L16+2ssE7EpUE+oKHNmmCK1XfBl0udHRIMrK1pI8kn72vvjkBi3HkcBnZe?=
 =?iso-8859-1?Q?1Y0n9GPhAndk5QXfI49GTLfTo7IAvzp8dn2MdHOQ0zveooSNWP4jzz2anG?=
 =?iso-8859-1?Q?Mmz0ZONUp4T3H97oIcWUn3HyL9czJLBJftyJiCBGP/wSMlOScJl0hrB+uQ?=
 =?iso-8859-1?Q?yRoXSoZKZPIhLEzYJN0AfNjtZiPnbUNCP5htEkKI8eScc2nHqeu/12nq+x?=
 =?iso-8859-1?Q?pVnLQl6t+mLBupixK1tAwzNhX35YMNWzmCWIvc7E4g6/m0Yc7MMMOKCojQ?=
 =?iso-8859-1?Q?1a9SHuJ0iDDpfJDUeLSVJjLtNvWsu5UWx0g/42DnHMdpHl4SyQRVpwrJij?=
 =?iso-8859-1?Q?d/3xlf3cGCoCxtDXS6SYzASmD2KgNFs8ebpPunFKH0gSpIEus1vFt1ewMl?=
 =?iso-8859-1?Q?f8TcqEaa/sYoWxOqUEVLVsjGKS2GkzdUIPMHESeMofaxLBEbqNA8Rl3CRD?=
 =?iso-8859-1?Q?hzFbvGFrRBemt3SxMjtQ+4yZsrbJ1H7N7BIZ/WaHLDQkhWQpvjo/lLaoBB?=
 =?iso-8859-1?Q?gfFaNnt048HdHcHosDxgPUbd2HjQjfbUYmuCXIh7hnTlyzKYqCP3KS1TJB?=
 =?iso-8859-1?Q?0jk0fC/qZQM8ZeqWC+RUo24VZEWCLpBqA5Q3fqy2xZjAgYGz0eUwaQfw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 12524291-1163-41af-feb3-08dcb89228b4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2024 16:41:46.9933 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1y9pwyz+iG5DrjQJsnzm9XUO+ML8qNo8d/FpeRJM3xHTtiTjlBYqyZwUvzo9/DlKuCj6C05nmB7ilGmWf5FREw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5002
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

On Fri, Aug 09, 2024 at 03:53:20PM +0200, Thomas Hellström wrote:
> On Wed, 2024-08-07 at 23:43 +0000, Matthew Brost wrote:
> > On Wed, Jul 03, 2024 at 05:38:11PM +0200, Thomas Hellström wrote:
> > > Use fault-injection to test partial TTM swapout and interrupted
> > > swapin.
> > > Return -EINTR for swapin to test the callers ability to handle and
> > > restart the swapin, and on swapout perform a partial swapout to
> > > test that
> > > the swapin and release_shrunken functionality.
> > > 
> > > Cc: Christian König <christian.koenig@amd.com>
> > > Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Cc: <dri-devel@lists.freedesktop.org>
> > > Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > ---
> > >  drivers/gpu/drm/Kconfig        | 10 ++++++++++
> > >  drivers/gpu/drm/ttm/ttm_pool.c | 17 ++++++++++++++++-
> > >  2 files changed, 26 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> > > index fd0749c0c630..9f27271bfab8 100644
> > > --- a/drivers/gpu/drm/Kconfig
> > > +++ b/drivers/gpu/drm/Kconfig
> > > @@ -272,6 +272,16 @@ config DRM_GPUVM
> > >  	  GPU-VM representation providing helpers to manage a GPUs
> > > virtual
> > >  	  address space
> > >  
> > > +config DRM_TTM_BACKUP_FAULT_INJECT
> > > +	bool "Enable fault injection during TTM backup"
> > > +	depends on DRM_TTM
> > > +	default n
> > > +	help
> > > +	  Inject recoverable failures during TTM backup and
> > > recovery of
> > > +	  backed-up objects. For DRM driver developers only.
> > > +
> > > +	  If in doubt, choose N.
> > > +
> > >  config DRM_BUDDY
> > >  	tristate
> > >  	depends on DRM
> > > diff --git a/drivers/gpu/drm/ttm/ttm_pool.c
> > > b/drivers/gpu/drm/ttm/ttm_pool.c
> > > index 38e50cf81b0a..d32a1f2e5e50 100644
> > > --- a/drivers/gpu/drm/ttm/ttm_pool.c
> > > +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> > > @@ -431,6 +431,7 @@ static int ttm_pool_restore_tt(struct
> > > ttm_pool_tt_restore *restore,
> > >  			       struct ttm_backup *backup,
> > >  			       struct ttm_operation_ctx *ctx)
> > >  {
> > > +	static unsigned long __maybe_unused swappedin;
> > >  	unsigned int i, nr = 1 << restore->order;
> > >  	int ret = 0;
> > >  
> > > @@ -446,6 +447,13 @@ static int ttm_pool_restore_tt(struct
> > > ttm_pool_tt_restore *restore,
> > >  			if (handle == 0)
> > >  				continue;
> > >  
> > > +			if
> > > (IS_ENABLED(CONFIG_DRM_TTM_BACKUP_FAULT_INJECT) &&
> > > +			    ctx->interruptible &&
> > > +			    ++swappedin % 100 == 0) {
> > > +				ret = -EINTR;
> > > +				break;
> > > +			}
> > 
> > So here this -EINTR would be kicked to the user IOCTL which triggered
> > the BO validate and retry? The restore then should be able to
> > successfully pick up where it left off?
> 
> Yes, that's the point. For the direct swap-cache backend I initially
> used (before concluding that the shmem one actually seemed to work
> fine), we had an interruptible wait here.
> 
> Supporting interrupts is generally a good thing but for the pool code,
> this makes the code considerably more complicated. However, this is a
> good way to ensure drivers actually support -EINTR for the call chain.
> If not, adding interrupt capability "later" will most likely be a PITA.
> 
> > 
> > > +
> > >  			ret = backup->ops->copy_backed_up_page
> > >  				(backup, restore->first_page[i],
> > >  				 handle, ctx->interruptible);
> > > @@ -892,7 +900,14 @@ long ttm_pool_backup_tt(struct ttm_pool *pool,
> > > struct ttm_tt *ttm, bool purge,
> > >  
> > >  	alloc_gfp = GFP_KERNEL | __GFP_HIGH | __GFP_NOWARN |
> > > __GFP_RETRY_MAYFAIL;
> > >  
> > > -	for (i = 0; i < ttm->num_pages; ++i) {
> > > +	num_pages = ttm->num_pages;
> > > +
> > > +	/* Pretend doing fault injection by shrinking only half of
> > > the pages. */
> > > +
> > > +	if (IS_ENABLED(CONFIG_DRM_TTM_BACKUP_FAULT_INJECT))
> > > +		num_pages = DIV_ROUND_UP(num_pages, 2);
> > 
> > So what happens here? Half the pages swapped out, then upon restore
> > half
> > swapped back in? The shrinker continues to walk until enough pages
> > swapped out?
> 
> Yes, exactly. Ideally we'd want some intermediate state here so that a
> partially swapped out bo is still eligible for further shrinking.
> 

Cool, glad my understanding is correct. Having error injection is always
a good idea to ensure error paths / corner cases work rather than
finding they blow up much later when these cases somehow get triggered.

With that:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> /Thomas
> 
> 
> > 
> > Matt
> > 
> > > +
> > > +	for (i = 0; i < num_pages; ++i) {
> > >  		page = ttm->pages[i];
> > >  		if (unlikely(!page))
> > >  			continue;
> > > -- 
> > > 2.44.0
> > > 
> 
