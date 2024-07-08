Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F13BC92A57E
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2024 17:19:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F4FB10E386;
	Mon,  8 Jul 2024 15:18:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PQqoOVD+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6659510E242;
 Mon,  8 Jul 2024 15:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720451937; x=1751987937;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Fz+08veJ5pRq2qW3yUJ9Wn1jLNieD4MnLh+BCp/K2/Q=;
 b=PQqoOVD+onGXyYxufDaFO5nHVvujuQrhucSYXgSeio+GBi6eDINM19Ge
 nTtXT9JZxgjx4vL8dX6UtpMo8jYOlwsa0EE3He0ADyce8fJ2m7xJF23ON
 4/WD66bHVlQjOG9QmgCnXzahtXD5Rib9y/EyWjq90dM3CnV71Y+r7+Ele
 hm7YwE8UGXMlimI4P3v8x2EnOccnbK7SDlmvhZNYuySv9CVAHJ4K0LMz2
 zIoDMeBZ9KqFnnf7hbBEVd3zYrn1nG4/6l6KlykVfQh5rr1TYedza3IL7
 ldLBIg/j7O4nK7VuK0PEKIzUC1ssKOkOG7DCxy4DPMLhgW6msPDHlwOlc A==;
X-CSE-ConnectionGUID: n43kFc0/RCutm1Oe6aMRFA==
X-CSE-MsgGUID: 3kJ0+D0MSkq6K2lddOa/8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="20559397"
X-IronPort-AV: E=Sophos;i="6.09,192,1716274800"; d="scan'208";a="20559397"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2024 08:18:56 -0700
X-CSE-ConnectionGUID: iSpKQaFvRte93zXexMZM/g==
X-CSE-MsgGUID: +sc7EJubTma8PPNthIwMTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,192,1716274800"; d="scan'208";a="48271543"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Jul 2024 08:18:56 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 8 Jul 2024 08:18:56 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 8 Jul 2024 08:18:55 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 8 Jul 2024 08:18:55 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 8 Jul 2024 08:18:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mH4ZhbDKB8q/E8KKPHFHKaAkvATi6s1RULfCufkAu8bOo/seB9aAxG0n3dj6rro+2kC8oCdnKwARi+BpJkSEavihQVmPsJJGRRrIhkbxaaJ3dK1KSkvm6jJb+CIqbbiLiEwEqRe3GGZbeJThGlN6OeeQLtF126Y0h1MclIrLmtS97UgYCRomjvZfzFr1WAQt3QX3LFJwOQd4f4mo78Bq6RSgqeqRaMZpb5ftBMP/TfHHoZVWdtItvzxYTnDyfoM0/lSln9eo3w8VlO+THavt7LBMVlnYhiik6OeKzW4DMdh/aAMQyBV3ffqOPJFJmoxL0Oz0nwGPv0lv+5tCNXo41A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qb4iur8bGBL42rVEigwvkyzYftxOJroW5/+aDpGD8jM=;
 b=bs5Mi2hSsCpoqHZ5Z4Rp0KN77oY67kczYiz0G8DEHIMdPQnDc0/uxWjJSon60n5J8HAJCwhcHQWs13/mvF20IT5n0z89qSN65GpDW0d9Uvw3nl6rGgQjOL6wIo4azVVPn6fOl6xYkTLFuHL84r4ZVpAPPOEcn4SYRWKHVS5UDWTDfNGyaNeDPFnHYLn+g/JKaykeGbOKieX7ccE8dunbNUWKyE3aooTJsuP7QhZEyM8KkTxvFXK0k9Ut3VK7pz78RwgEq2+OV4GsR/8uNivbtCC5uIBX3DgR+j3NHufUO3tdncS4I6kJQ1KGVXpWqY6D6sfOZglp3b/mt4MfVUKgBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by DM4PR11MB8130.namprd11.prod.outlook.com (2603:10b6:8:181::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.29; Mon, 8 Jul
 2024 15:18:48 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.7741.017; Mon, 8 Jul 2024
 15:18:48 +0000
Date: Mon, 8 Jul 2024 15:18:03 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Somalapuram Amaranath
 <Amaranath.Somalapuram@amd.com>, Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v7 8/8] drm/ttm: Balance ttm_resource_cursor_init() and
 ttm_resource_cursor_fini()
Message-ID: <ZowDKzXuIhungIuB@DUT025-TGLU.fm.intel.com>
References: <20240705153206.68526-1-thomas.hellstrom@linux.intel.com>
 <20240705153206.68526-9-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240705153206.68526-9-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: BYAPR05CA0086.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::27) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|DM4PR11MB8130:EE_
X-MS-Office365-Filtering-Correlation-Id: a4258775-9f54-4cff-16c1-08dc9f614404
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?lnspvFpxsEp0zGzkmFqhPJwuTgYj2gQHmOK4yTD8fd4qwhlnUOpqaMI1Fc?=
 =?iso-8859-1?Q?A6GT3TB3930fQFvoy2F/kfdvmwHl8V+9a1gb+/PsnIC5t1rHAk7ubGAsPT?=
 =?iso-8859-1?Q?367SHDn8E5y8j+5wXD7Fcmn8Xm+SLnkjrGzMpJod5Y7nYshhAYT8Dd0mDr?=
 =?iso-8859-1?Q?CO+UAj4rB0K9syqgF2qQR7I8pwNRjceGvhCY0oftolf3Yfaj1s/tA7KFsq?=
 =?iso-8859-1?Q?8aKYMENf6oJU3ajfAqs7SRce5ouejoS4QqVpkP6MJNRWR0z8I29jBwtvPr?=
 =?iso-8859-1?Q?+dNLpR7sx4qmFYqx54/nLGc6JQgoDXRjHMdBqffLJcRS9w8KfdXb8yYhwm?=
 =?iso-8859-1?Q?Ktt+2uC5hGwBnhUmPyI3zdYCQ3h8ebdGv/jCVoOYHF7YYD+ClhkrlATx+Q?=
 =?iso-8859-1?Q?9n9Q6P2lyI5VfwUZT88RnwMYHVPKiMCLa9ON57JYdxs0WtIlBjh9lIK1/y?=
 =?iso-8859-1?Q?T0CzkPta6+vZNCR9aGwsQuw5rCJwwkMA9SxU4KcwqUXDJNcQyK818/EAmA?=
 =?iso-8859-1?Q?Gh0A8Wn5NdhTV8UNHqvG42ACrw4Vfe7mm4IsRQTZz0v43enLV+4vdC/R3j?=
 =?iso-8859-1?Q?rcilWv9zuMmwmc/3kTM/oj/9PEArJcbPce3ajPeLhr7J4lwQlPuK46X9mS?=
 =?iso-8859-1?Q?u3uaaXtNCLk7yr2SGDn1Yp2oJQNdDcg4o4/KWY6LyfiEQS73mnCQ7bNLg6?=
 =?iso-8859-1?Q?LDAED2zfxIKTdOwdkLCxafq2TK1DcZLmtSlU645+ChvjMsIaGb729reXEs?=
 =?iso-8859-1?Q?agDUnUcIoZcfC7XFeOreiD85e1333LJBo/guquTnzyj2YrsoYjvRPmzNjc?=
 =?iso-8859-1?Q?bOasIICZYdE5IowhYGfKsSU8kyK3krhriIqMzmmTKYL3bgsDKuO34dcCem?=
 =?iso-8859-1?Q?xq94d8M4POwv+1ZUdVpWz/FpFvHPyWelQq9FkB3pUGt7RWwussoZew8m6s?=
 =?iso-8859-1?Q?ylMfEeTudg0dWlh1zeeTvfQQOqIyC77CpuPIO+6GDQTDFK008rKcpWbmFu?=
 =?iso-8859-1?Q?8cp+9Bgx0g12My/P78eFugO/wVpE5SurPG58MEc8ayJiUo5q2nQurWVM1x?=
 =?iso-8859-1?Q?9rgPaE+SXN99tAEz4czx17EePDUCPWqXmekRd0KWEZKlKBPlPrCDRP1WDW?=
 =?iso-8859-1?Q?sBLD+WoCo1cfy0BrhPDYC6IADQXs82JV3OZUuUNY0OVkyIsTvnGaOC3Sr8?=
 =?iso-8859-1?Q?8iiETuzbZXpWriMUZaJ4EKbospirE8D95yEhCzXLNHmF5CZiml0klbgweX?=
 =?iso-8859-1?Q?OFlr84uZI2XbEqHz2ibfKLCdLWRRX+3aCVd9GdAUJnWdSwY4uVK+zGQTp4?=
 =?iso-8859-1?Q?oAUU4yIRX6h2rgTAomZNrqVlNUvMeKUfM1r+S2utsGb/EYpO8td1L7fGLN?=
 =?iso-8859-1?Q?pt7q8VGb/F6uX4YCjFVjKo4ZblPI44fw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?l7MXS7uqAOj4BlNk4FsmR3kbwdRdcRlD8ZoxMNTMr/AGPH5JfNuZR+EKab?=
 =?iso-8859-1?Q?PSyDSqAj1HJxLYLWE+8kW3YZZ2Q7HHtYSDvVwUF5CqHouathw3uNSRHVoo?=
 =?iso-8859-1?Q?u/FVoiOkKty7Es67Ol6tX6mx07rF3t57Nk01d9DcOJx3wpOgTM36MMGXX/?=
 =?iso-8859-1?Q?XV1Y09SlQCEg2i+XprP20FrhQrVHLiosz6qP11pTud65s6zBciwhYW6Ugc?=
 =?iso-8859-1?Q?lpNLlZo+uJ8umRPN+5/KIdY4Jd5PG+aLPGoDHhVL6djTNDQyTiciTieGUB?=
 =?iso-8859-1?Q?lbtafo4SxU/KIVkqVVxJa+IJPu8XmwxaGVn62oKhjqA5FdtbEMtCOMF7sW?=
 =?iso-8859-1?Q?sIVBQnvatz3OG08T1pXWZoH0hDeFHmXodAennf0FYWTzznvXs54UtZC/El?=
 =?iso-8859-1?Q?nR6ngHNla0b9regLbqLsIYIsluyRG5aHCWsQ1ojLtOdYuBPT3pem3Z9mGG?=
 =?iso-8859-1?Q?eRVHAA5Y8xj+B45f0u12SqlWuxeVAfGgco13trI1DmGu0i+BXoXhLYHdq4?=
 =?iso-8859-1?Q?EoYLMD119093+AFLO6M0glc/CV9D1zRU4/ytm8itUHgyN9/Ei06w1sxLVj?=
 =?iso-8859-1?Q?8T5ewTCBVzvepSk3hK0WA5Tx90+mFLYrZDUtplylSpMkjqczKbYx0wn6wS?=
 =?iso-8859-1?Q?R2gB0r8zt966RLywHuUcF/6G0ylqbHBcPeLTeTIuD3i75+1uectubAJVuT?=
 =?iso-8859-1?Q?mNrCBARppwCEgvK0yRwnqWU/RHTDhuAffE10pCvLTuMyxV47D+8m9oj2iB?=
 =?iso-8859-1?Q?cxbPo9dJVc0Y0Acx3xNhB4Om/l4SAZfP6CTfB/QFg2ovtvwhqHt7M9KlGT?=
 =?iso-8859-1?Q?+m+q0eIZb9qDTPUEdEAQrcrL9YEmiOKi7Y+KGmLcGlEqSvfGqmELjJbylY?=
 =?iso-8859-1?Q?vZlrWPY+OE0IAygdi34fQQA2/ECdMV/IRIjXtLYwyfeAGy7HBIixM+IaAZ?=
 =?iso-8859-1?Q?RDgX4UNxub1fUpdYnGQULtTNGv+on852Nzj3lv/rnMBiCpC8tUloZc8B6/?=
 =?iso-8859-1?Q?xJRwCEB4PUpQ9zgpzt0ZQSYnVHQfS+tUFh1vpQhKCMXr0O1/xtKzmD41Ln?=
 =?iso-8859-1?Q?zmknvtbxPeaBiEg/7jh1exHm4S9vzrfRPfqEAddY5wjBmnu264Wz9Fe9xX?=
 =?iso-8859-1?Q?cuD/GcFK2SzQ5/5kwI9pIu9F3gLv4TdOYyq8QtM3Ynzo8Ak1NoEt9MyTha?=
 =?iso-8859-1?Q?tnA0h5TuzDbsIUtV1AZrkxUYdvCdSDJhI7t6a6+4h9IjlyV7fC7kUqjB0u?=
 =?iso-8859-1?Q?9tnE97Mb7ri7VFtaGNt2QDUEUA7YccF9DnlSxLEQrYMBVzM7qLneXncln2?=
 =?iso-8859-1?Q?RcIUU90qLn9tix+nYzfnqYHRjLlvChrt8yLxi8K8tDJ5E9R8LjoJTZvwoz?=
 =?iso-8859-1?Q?GTg8wy3EndIpqatHCYMmTPfPAGAymuSiwSVaj3G0H4Da5hH2UVHtINfSf+?=
 =?iso-8859-1?Q?fsFEwyiCl+O82QRyJzrOkgtK2gJQGuUvdp/IxHMC5vR+peiLH3Cxdf9KAr?=
 =?iso-8859-1?Q?C7tZU4H47YvDQC8TOkKbspHEoH8pr07l1oqaxKFf4xFI7NFS6Xdyyv4nlM?=
 =?iso-8859-1?Q?8oDC42YAzt+pnwudC0LhZkM9tvB3IOF4IAj+pqgxyin/KDMvbcAbmq8PmL?=
 =?iso-8859-1?Q?OXnxiotpR+7wUUGpSWsIwaPtou4DqrKYpelT1jb5ez2RTM/UOfRsX+oA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a4258775-9f54-4cff-16c1-08dc9f614404
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2024 15:18:48.2908 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 96oFYcIK/DTQmqkdfAUVXPUAikZA50xUOeKBVPuFZBYAhQusuVPG6RHaGmtQpIawtUK00SJ8ZxcRIQsEidLPoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8130
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

On Fri, Jul 05, 2024 at 05:32:06PM +0200, Thomas Hellström wrote:
> Make the interface more symmetric by providing and using a
> ttm_resource_cursor_init().
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/ttm/ttm_bo.c       |  3 ++-
>  drivers/gpu/drm/ttm/ttm_bo_util.c  |  4 +++-
>  drivers/gpu/drm/ttm/ttm_resource.c | 34 +++++++++++++++++++++---------
>  include/drm/ttm/ttm_resource.h     | 12 ++++++-----
>  4 files changed, 36 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 0131ec802066..7fcd9cb0478e 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -449,7 +449,8 @@ int ttm_bo_evict_first(struct ttm_device *bdev, struct ttm_resource_manager *man
>  	int ret = 0;
>  
>  	spin_lock(&bdev->lru_lock);
> -	res = ttm_resource_manager_first(man, &cursor);
> +	ttm_resource_cursor_init(&cursor, man);
> +	res = ttm_resource_manager_first(&cursor);
>  	ttm_resource_cursor_fini(&cursor);
>  	if (!res) {
>  		ret = -ENOENT;
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
> index 3c07f4712d5c..ec6a0482cd94 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -865,7 +865,8 @@ s64 ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct ttm_device *bdev,
>  	s64 lret;
>  
>  	spin_lock(&bdev->lru_lock);
> -	ttm_resource_manager_for_each_res(man, &cursor, res) {
> +	ttm_resource_cursor_init(&cursor, man);
> +	ttm_resource_manager_for_each_res(&cursor, res) {
>  		struct ttm_buffer_object *bo = res->bo;
>  		bool bo_needs_unlock = false;
>  		bool bo_locked = false;
> @@ -906,6 +907,7 @@ s64 ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct ttm_device *bdev,
>  
>  		ttm_lru_walk_unlock(bo, bo_needs_unlock);
>  		ttm_bo_put(bo);
> +

Nit: Extra new line.

>  		if (lret == -EBUSY || lret == -EALREADY)
>  			lret = 0;
>  		progress = (lret < 0) ? lret : progress + lret;
> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
> index 6d764ba88aab..b300d615e196 100644
> --- a/drivers/gpu/drm/ttm/ttm_resource.c
> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> @@ -80,6 +80,23 @@ static void ttm_bulk_move_drop_cursors(struct ttm_lru_bulk_move *bulk)
>  		ttm_resource_cursor_clear_bulk(cursor);
>  }
>  
> +/**
> + * ttm_resource_cursor_init() - Initialize a struct ttm_resource_cursor
> + * @cursor: The cursor to initialize.
> + * @man: The resource manager.
> + *
> + * Initialize the cursor before using it for iteration.
> + */
> +void ttm_resource_cursor_init(struct ttm_resource_cursor *cursor,
> +			      struct ttm_resource_manager *man)
> +{
> +	cursor->priority = 0;
> +	cursor->man = man;
> +	ttm_lru_item_init(&cursor->hitch, TTM_LRU_HITCH);
> +	INIT_LIST_HEAD(&cursor->bulk_link);
> +	INIT_LIST_HEAD(&cursor->hitch.link);
> +}
> +
>  /**
>   * ttm_resource_cursor_fini() - Finalize the LRU list cursor usage
>   * @cursor: The struct ttm_resource_cursor to finalize.
> @@ -586,17 +603,16 @@ ttm_resource_cursor_check_bulk(struct ttm_resource_cursor *cursor,
>   * Return: The first resource from the resource manager.
>   */
>  struct ttm_resource *
> -ttm_resource_manager_first(struct ttm_resource_manager *man,

The kernel doc here needs to be updated.

> -			   struct ttm_resource_cursor *cursor)
> +ttm_resource_manager_first(struct ttm_resource_cursor *cursor)
>  {
> -	lockdep_assert_held(&man->bdev->lru_lock);
> +	struct ttm_resource_manager *man = cursor->man;
>  
> -	cursor->priority = 0;
> -	cursor->man = man;
> -	ttm_lru_item_init(&cursor->hitch, TTM_LRU_HITCH);
> -	INIT_LIST_HEAD(&cursor->bulk_link);
> -	list_add(&cursor->hitch.link, &man->lru[cursor->priority]);
> +	if (WARN_ON_ONCE(!man))
> +		return NULL;
> +
> +	lockdep_assert_held(&man->bdev->lru_lock);
>  
> +	list_move(&cursor->hitch.link, &man->lru[cursor->priority]);
>  	return ttm_resource_manager_next(cursor);
>  }
>  
> @@ -632,8 +648,6 @@ ttm_resource_manager_next(struct ttm_resource_cursor *cursor)
>  		ttm_resource_cursor_clear_bulk(cursor);
>  	}
>  
> -	ttm_resource_cursor_fini(cursor);
> -
>  	return NULL;
>  }
>  
> diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
> index be034be56ba1..ee0e652328b3 100644
> --- a/include/drm/ttm/ttm_resource.h
> +++ b/include/drm/ttm/ttm_resource.h
> @@ -30,6 +30,7 @@
>  #include <linux/mutex.h>
>  #include <linux/iosys-map.h>
>  #include <linux/dma-fence.h>
> +#include <linux/cleanup.h>

I don't think this needs to be included.

With the above nits fixed:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

>  
>  #include <drm/drm_print.h>
>  #include <drm/ttm/ttm_caching.h>
> @@ -325,6 +326,9 @@ struct ttm_resource_cursor {
>  	unsigned int priority;
>  };
>  
> +void ttm_resource_cursor_init(struct ttm_resource_cursor *cursor,
> +			      struct ttm_resource_manager *man);
> +
>  void ttm_resource_cursor_fini(struct ttm_resource_cursor *cursor);
>  
>  /**
> @@ -456,8 +460,7 @@ void ttm_resource_manager_debug(struct ttm_resource_manager *man,
>  				struct drm_printer *p);
>  
>  struct ttm_resource *
> -ttm_resource_manager_first(struct ttm_resource_manager *man,
> -			   struct ttm_resource_cursor *cursor);
> +ttm_resource_manager_first(struct ttm_resource_cursor *cursor);
>  struct ttm_resource *
>  ttm_resource_manager_next(struct ttm_resource_cursor *cursor);
>  
> @@ -466,14 +469,13 @@ ttm_lru_first_res_or_null(struct list_head *head);
>  
>  /**
>   * ttm_resource_manager_for_each_res - iterate over all resources
> - * @man: the resource manager
>   * @cursor: struct ttm_resource_cursor for the current position
>   * @res: the current resource
>   *
>   * Iterate over all the evictable resources in a resource manager.
>   */
> -#define ttm_resource_manager_for_each_res(man, cursor, res)		\
> -	for (res = ttm_resource_manager_first(man, cursor); res;	\
> +#define ttm_resource_manager_for_each_res(cursor, res)	\
> +	for (res = ttm_resource_manager_first(cursor); res;	\
>  	     res = ttm_resource_manager_next(cursor))
>  
>  struct ttm_kmap_iter *
> -- 
> 2.44.0
> 
