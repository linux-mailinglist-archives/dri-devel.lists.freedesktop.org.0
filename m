Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F95AFB88C
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 18:24:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C000610E4E6;
	Mon,  7 Jul 2025 16:24:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eTbO17WG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF06D10E4E7;
 Mon,  7 Jul 2025 16:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751905470; x=1783441470;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=SielPml8KKFtcIoKWLl0JMkFRhxwcWtA7PpSmzIIPdY=;
 b=eTbO17WGXbIPErQ07xjile7h5FkbYIgiRvf97B3F5xNL1P7skimAYeVq
 xmTBNbDfiXemIABuIAtQaviGObzImWZNnPTScVJSlDq0Pu9ejgVV/xYHd
 SX/nR1kR3VZb421vud1cQSrVBtvOQbu9doMp5nTklall1urJknqsBDvW6
 WD32GSKdJ35V9yubGR+gW1IjYQBS0DglTNIRzXUnQZDjFmnI94DtLa1Qr
 qwV+5qzlbjLX1szx8c9BlCEe2VUwCPPQ4mM6Kkxdpz/ZrTp/d3tABAFva
 qpUfNTUv+2zWqllyK/c557FNbyHX4xj86oYXvRYKH3iJhrZV3kmEII+aI g==;
X-CSE-ConnectionGUID: olyM9kO5SKebeL8A2AiWYw==
X-CSE-MsgGUID: Xt3CtkW5S/GAE+Zb9m8R8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="54103936"
X-IronPort-AV: E=Sophos;i="6.16,294,1744095600"; d="scan'208";a="54103936"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 09:24:30 -0700
X-CSE-ConnectionGUID: uswtrBnnRXm5riYDhseacA==
X-CSE-MsgGUID: m4LXyBDOQIeHfvWU2flcWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,294,1744095600"; d="scan'208";a="192442046"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 09:24:30 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 7 Jul 2025 09:24:29 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 7 Jul 2025 09:24:29 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.53)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 7 Jul 2025 09:24:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZnkWy8zQTFP3WV7JWjqfbOLgthYff/Sdi4HE6caGmVp0LYC4PNdgj0Vuyy2sZaiAgkjX35sthWn8K6XDqIVeK7mi7KC/2icLRp+RHCjMNpOml8yx6hlxwWIk8LJILpOQqnqCyTCYI8CA9pwRDE4+zdcTXoQ1qLWTl5lJ++hkk5kSCuLL1TQY6M1r2002OnwDbsXh7+lhNgTmPvg62/Yg0qTzjMOKye+y6eJXR8f73Et8q1lYOLFTuclzbqo58o3qI2S38bhaAADLE2W/32Amv3w4DwL4bJtfMkuN/bmdwSqrGgUuxTyS/XZR6rXUrgDGwX2D0eLpFJyx04TuMUjmLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1FlE6AmmtMK8ZJJWPzYbyLAKKqUq9C7mJVA79wb9Kbo=;
 b=KIyPV2ANIHoHgMoe68XqTSU3D4Wq9mTRIbR+fJz4zLtcD4PuLQDnrQVvk+Qw35bqZ3973cmkQp2Ck34DWbOJqzWPv6tTbIVd6+qsR52litO67jQR3/UNUy1wFTo1Oc0s47zhcqaI+Bn5BsMJWgmqBI5gGuQvUOwL4ES8aBwUjAYpTTQTsgK7B+GylYJv6kaULfhzRfVkELDQ3uZn6DaEheiDhd94lCyjKYfWvhvhnGCOP/EIJ9YqqRrLybwnNbXHZ38/iCqLXAIlzH2c7s+0mcAjOoCSJVPDjsQA3e7ca/U/5NKm2tL6pQaOebxyLavBjjgBqR6B06ytZRxv+H/+eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH2PR11MB8835.namprd11.prod.outlook.com (2603:10b6:610:285::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Mon, 7 Jul
 2025 16:23:45 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8901.018; Mon, 7 Jul 2025
 16:23:45 +0000
Date: Mon, 7 Jul 2025 09:25:28 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
CC: <thomas.hellstrom@linux.intel.com>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/ttm: rename ttm_bo_put to _fini
Message-ID: <aGv0+LabWlFujT9w@lstrano-desk.jf.intel.com>
References: <20250702110028.2521-1-christian.koenig@amd.com>
 <20250702110028.2521-2-christian.koenig@amd.com>
 <aGWsVBA45EVO/yhM@lstrano-desk.jf.intel.com>
 <4a115c5b-8e91-4ce9-88c7-cf3f3f9d3aa4@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4a115c5b-8e91-4ce9-88c7-cf3f3f9d3aa4@amd.com>
X-ClientProxiedBy: MW4P223CA0023.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::28) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH2PR11MB8835:EE_
X-MS-Office365-Filtering-Correlation-Id: c678d1d9-3ce9-4901-109c-08ddbd72a52e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?Canlzp0IP0BXuKlu1ZGYy6c4MbQFaLGmhCHSW0WDJsUYizDTozqr4DTy6U?=
 =?iso-8859-1?Q?4csst/vvHGhRz8quMFZxsExOc/wNJqEKUPnRquNaIvB9JUhNDg1gGCgR/+?=
 =?iso-8859-1?Q?gfGeC3iwTqKLVl+FB6U/EtTfLIv/W6YR6yt+dWoArr3nxOdSaMFRWd1jjB?=
 =?iso-8859-1?Q?OLZM3ciqZcHavG5IP/DkNug3ShcjDciG2YSIDIQ0WDDdwzK+TXUHyyEQLh?=
 =?iso-8859-1?Q?5k81s/Seg3aCYx4iDBPV0VlJhG2udm2W2wE2s7nPCa16I+iET4/HP4uvbh?=
 =?iso-8859-1?Q?nrt/hGisMiDX4eObruvZ1ThR4pkH4xk1wy3uS+T7MhBCXEX8xm2uVI5aC0?=
 =?iso-8859-1?Q?jnD7eNvh9j0rhRuLDQuvG0Oj311jJlKE/fKM5yRdD9YlHBiT0c2a4oqhoL?=
 =?iso-8859-1?Q?i1/3+JV8igocnlCQj2YXhxziKggcssTXuGehhE5GIxwqW9yksROR7DOpAn?=
 =?iso-8859-1?Q?24sSz6alffhX6EoQ2AgWrDhvd/Ro+/t019PfoaBFfMkXTHWUG3ohUHIZq8?=
 =?iso-8859-1?Q?ZkmbkkGy/HXSeqUcSmT69z8Si6M5NdnR+a33MvImTofMIMBQjwq6kDZAKJ?=
 =?iso-8859-1?Q?OQMOjJ1YXpYhWTPR1K66gFqXO0QlM+JDgkSlyWQPOeSa/AiecyDPoUTPwc?=
 =?iso-8859-1?Q?sZnsQWzBqVSorlC7gxMvitNIyRQyb2JMd6iSNSofhki8iH2SfmfQBZvKUn?=
 =?iso-8859-1?Q?tR5hTle4sMrDLcFzInFsxJ38dhqj3Mr3QtTqmCyi15OvYucwYim7qC4ajs?=
 =?iso-8859-1?Q?Jhp/Ji9QgNv5IvaZcwVniVqsNQyD/XGB0MPyNjCmmUyBDmZoWcegKOorL6?=
 =?iso-8859-1?Q?4ZCMb9IayNPs6NVEh12guvPN1ivDEW/AyDyB4NgOz0Ny42ekDIW23cbL+f?=
 =?iso-8859-1?Q?2dWZKX+hQKW8UoLqmLurrJCglB+jS+YgAzHADU9hHFexGNrv9VVwkED1hT?=
 =?iso-8859-1?Q?kxkJ3qIoasAyS2OTDDDXQU7jFMxeGmhA3iSXfaEqy+nrbIioyh3bIGidMq?=
 =?iso-8859-1?Q?3su2ZhFs1Ap/ml2d76BXCLUfbhSj208GCymuZGddXW+R036HDgQxJm2qpk?=
 =?iso-8859-1?Q?P6ZtDObrtQ+2cJV7dEZVjcFWsJVmRPrSptYlyL0TKvLLFOZWkt5vhjvoGf?=
 =?iso-8859-1?Q?Gtuwy0saXTDDHuvS/UCt6cy3t1K0SbEN+3GRLnnlv+yz38zKrl2P1KlKtn?=
 =?iso-8859-1?Q?oOA82xrBMgaoajIZiMtb1A+bAdfcmYkwRU0GxBS4i2ufMk97cvfVkPdtD8?=
 =?iso-8859-1?Q?6JNL8169xWUCGOJLxfyzorBBaQ4iIFxeXj9zckgBh3uluE9zsd0vIlSmZp?=
 =?iso-8859-1?Q?cD1DefYyGX3hAYpmUHU8R2cUW/spK1KgkhUi935H1kJXn0EDIdk+FGULD9?=
 =?iso-8859-1?Q?1HCCG6iBhEpVWSjVSdnTjgIvayNrZZv+wIcUpqJDts/Ua6uFhCouEASjx7?=
 =?iso-8859-1?Q?wB2O4cuu//NZO+c6GpIBwbmb5N2IA4nxDPkm2rzAA1G7/Fzs7okZOguD/J?=
 =?iso-8859-1?Q?4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?qCsGiw4rUe8h+jIxf3rGerrgw8cdcNlQFTgUbMH7vQwdWm9vQjOt1a/WKA?=
 =?iso-8859-1?Q?LTNisCPqFJsH92rtiVi3SNr1YaIsDUZiO5QSvb8LkEs/NGBZzoZsXYH3bo?=
 =?iso-8859-1?Q?ZL2RjlQCkCTysWq2JcoFzCILu5wq2LKi4KOfld21iVRvJVNJwYVQvRGKo9?=
 =?iso-8859-1?Q?isbdAcG4nDyBZlVHdt1g9YIIDRozu9YtA3xK9oHDOKJBqfPtXhZxVQk4pp?=
 =?iso-8859-1?Q?fGl6EbPtqre2FeYjhZLsq4SHybTccnnJoYVtQ1p+TeS5yYEebFGp/Uvwt2?=
 =?iso-8859-1?Q?jelRzMdIZt7WGYsNeZHmtYodAwP/FBn0CvvNE3EN7qrsOoV9CEwz8Mukii?=
 =?iso-8859-1?Q?bcWhsARa4ny9k5Hht4kOXdr2uw3JKyPuyeQWld35Pk3Su1SoNKg2M9R790?=
 =?iso-8859-1?Q?vZG9i5RhzqMGRD5rBok8esVLMy8lbVxXRso3D5lte9WV8Kr8xPFrtaY2dM?=
 =?iso-8859-1?Q?13KAUIdqP5Bdzu2Ivy1TrgFAJy/EDr0FF/ZPP1re+sS9BUsN2OouiGpPh4?=
 =?iso-8859-1?Q?gVlWjyZ5eAyT6APMhSwvbdMvi9LS3HF6cUJi3Lmk1u1zFyrKcedpdc/m0H?=
 =?iso-8859-1?Q?NR8d50ATkv9v8xobZbBbyphja6goZWxEe+X4ptkiG1q3oGWfRvxIGnldA4?=
 =?iso-8859-1?Q?tU70fv3GoOCEMxtR6ny3uPKCgE4HAuVykQ15pE4nTZtA08RpxCFeGIZ50u?=
 =?iso-8859-1?Q?L5lCnnJGlSRAZlkdzsfpgZNGjry9x13L84WFMMnqb7vhI7VsawFU4ZE7Uq?=
 =?iso-8859-1?Q?apo7iVs+LAaB5omWtpp3YTMosT/YLTKYHZ/tYJCqAuyj1SOfwUktJSb8wX?=
 =?iso-8859-1?Q?7fbFDzXZyQrIwRYTC3YbArA6bOn3tKUik7c9uE69H8lyxlfXohRBG1erHq?=
 =?iso-8859-1?Q?I2iyPxohGA6yUvXrOsp6jlCM9Fp0W3N21ceLTHd/DXNavFjQuNEx6xXb4H?=
 =?iso-8859-1?Q?E7NdgOPw4Pg8XXmLrswEME9Zkbbno+OcjCNO4SyFczlgFmxAm+evdXbPDw?=
 =?iso-8859-1?Q?WTEReoHjr4/CUL6iJz78fOPsKc3FkbtpduDXzvg5lj7/XTmwT3Hs1FigCu?=
 =?iso-8859-1?Q?cAtFBCaYao0zJ0xsjNmiQItJrKTadTSHtLXIyaOvp09DLowhGoHIMKyhWC?=
 =?iso-8859-1?Q?lctHMLvYeqc3ElSfg4X+EdYEgcYTyB6TouJ8eneZO4+cf6ySeMXCB0+0PF?=
 =?iso-8859-1?Q?VuinBfFoR6eATYmo3mQFwqGh5/IVdNxv85+sRyyfUzqhnpT20xcQbqZgxV?=
 =?iso-8859-1?Q?EvEpOvHkTgqU6MDQXoqBddLaD7HNwhlQaLUzy2zgXn3l+6DSC5jEnCILSb?=
 =?iso-8859-1?Q?FBNJQf5pyNqr7nNe0MNc2FxZUj2JmJAk6MH6kqEY3DjL7Oi+7yJxzyZ74N?=
 =?iso-8859-1?Q?YBfjwjeKlq8IXnlJQx35M7+oFGbtzd0U2Hn8z+NUwD5Rra/Yogw/Vt8Y7e?=
 =?iso-8859-1?Q?v+RrCxYgYZI+ylWxCBoRR0whCdcl9EjtBJQyBr15szS8oOdlhQrn6e9Eym?=
 =?iso-8859-1?Q?fiaW9/mA/mfOJ4/OegD06wyw9I20ZFLXBFrjfzlV6Ytx/k90P7d/Ehxriq?=
 =?iso-8859-1?Q?yZ3raqaHsdyye8NxZsf3/x1LAehd6B+//AxdkkFfg5ONTxbVPDzu7APAkh?=
 =?iso-8859-1?Q?wGhJZ232lopYb6WvgVaoSmfeC90C390RHxrxhQtQ6yPwbQF8fDDUu9LA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c678d1d9-3ce9-4901-109c-08ddbd72a52e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 16:23:45.3088 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zLchofQWVRqejXhtqrOj/778H32lu2JdumEDfzQQRCqlCgoDA5KO3U1DOJbVdxtBJyIeIGaF8qDe/EiAwiAxKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB8835
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

On Mon, Jul 07, 2025 at 02:38:07PM +0200, Christian König wrote:
> On 03.07.25 00:01, Matthew Brost wrote:
> >> diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
> >> index 6c77550c51af..5426b435f702 100644
> >> --- a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
> >> +++ b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
> >> @@ -379,7 +379,7 @@ static void ttm_bo_unreserve_bulk(struct kunit *test)
> >>  	dma_resv_fini(resv);
> >>  }
> >>  
> >> -static void ttm_bo_put_basic(struct kunit *test)
> >> +static void ttm_bo_fini_basic(struct kunit *test)
> >>  {
> >>  	struct ttm_test_devices *priv = test->priv;
> >>  	struct ttm_buffer_object *bo;
> >> @@ -410,7 +410,7 @@ static void ttm_bo_put_basic(struct kunit *test)
> >>  	dma_resv_unlock(bo->base.resv);
> >>  	KUNIT_EXPECT_EQ(test, err, 0);
> >>  
> >> -	ttm_bo_put(bo);
> >> +	ttm_bo_fini(bo);
> > 
> > Intel's CI [1], see Kunit tab, is indicating an issue with the
> > selftests.
> 
> Even without any change the ttm_bo_validate subtest is crashing for me and I was about to disable those crashing tests.
> 
> My guess is that the test never worked 100% reliable and relies on some incorrect assumptions.
> 

Hmm, this seems to work in our CI pretty reliably but in general I am
not a fan of selftests, particularly ones so fragile that any small
change of behavior breaks the tests. If this is indeed one of cases
(testing really specific behavior), fine with disabling it.

> > Unsure if this suggestion would fix the kunit failure, but
> > would it not be better to just ref count gem BOs in the kunit tests and
> > create a mock drm_gem_object_funcs ops in in which free calls
> > ttm_bo_fini? Then in selftests replace ttm_bo_fini with
> > drm_gem_object_put?
> 
> Yeah that is one possible solution I had in mind as well, but I thought about disabling the failed test first and then discussion with Thomas what to do about it.
>

See above. Yea it Intel's main (IGTs) CI work, I'd say there is about
99% confidence that the changes you are making haven't broke anything.

Matt
 
> Christian.
> 
> > 
> > Matt 
