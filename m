Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0CCBAE960
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 23:03:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A558410E63D;
	Tue, 30 Sep 2025 21:03:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fGDi5SRR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DDBE10E63A;
 Tue, 30 Sep 2025 21:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759266225; x=1790802225;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=/inrCBytU+0a2SPUquzb6L+ku4AbbxqxamfsAsYfuuE=;
 b=fGDi5SRRJ4ERFjfqQxE6+T1IcG6agwnOM0HpSYvtwiFm50GgKbrWpGYx
 3ZGtWDzd92c6CQKzD/MMYNpcFeI+pcFu1QfPo9bUX79IW5XfBcXKOpMHk
 MhO0wzPMQReDeJOYPjFOUGQ/tIozCue2g4TPnR5hcyN5ZS/vcjtws+WEt
 jckxkQAkFF0V2yXtmPNm/16iCt9poYo5C6EVJRveQvskNNLYHHnXucNJS
 t+9nROJIbytFuA7WXb3XQn4b/OBzMFHRWUG7LyH3EIHuijokKLqN34QcL
 guz2U3s9rN1kZ5luoFpt2Gm0Hlgp8Mea8Xrr/Wo7oGHK01uRGhVRPy4/3 A==;
X-CSE-ConnectionGUID: +v8EHsiXS6qOzwSvzAIrKg==
X-CSE-MsgGUID: ZG+dW9z3QlCH9IXYT7di+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="61575001"
X-IronPort-AV: E=Sophos;i="6.18,305,1751266800"; d="scan'208";a="61575001"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 14:03:45 -0700
X-CSE-ConnectionGUID: oe/FRZi2QE+ZdWlSXqDtZA==
X-CSE-MsgGUID: ldFTLV5TQDOLGobtH2mWkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,305,1751266800"; d="scan'208";a="182640731"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 14:03:44 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 30 Sep 2025 14:03:43 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 30 Sep 2025 14:03:43 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.63) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 30 Sep 2025 14:03:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RlFGmm8m0WoVF6lPBFOfhcRX57n46Nkv+GzgU+MBGgsG81oWvpO5SwZNuhO2ULDGCzCiM1FxRD4GfKLjlUKK37b8kYT2iwdFnPuqvz8jIuKM32X/r9KvI2aOUuWqvJ8Z3qYGtqRCKWAzoKahlvrTdbbVpblhsrqdtLFc1KGbORAdv6YK8enYa5f1FBx6x3eDyYyKgNqG1HQPsWB08W+gzPle1oiePUE6h2U3OhdvwTF+s+g5QZBzU+81eZOHlApPtZkBQ6QPJSWWMgbeKcfbMguXpCx04fn2LShyojtVU284u/wjmxE7vG+3KDHQgE55G9zmkj43gH7HhXe1M7lICA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XgvG/ibt5SvgFD4K0qYBB2IpuBs2hPctmSFP82LeW8c=;
 b=PZbSdaROhBWFblYC+JcAdhqUTe6g0AQDbf0B4ObGzibluenjf963G/Kiy7xeXBQ4ZE+pLhiDa+diBI/O/1zFmDhlV02h8xdcVDVJ3Nctv8VgdS6FZVR2cckDURETcxk1wK1zisS/07qnh1fQKUznMeGIZkqeSCWRbD0GgFYBWAp0RAxfaO0EYohrYEfYvzPCZNWUP3G3cNhHmNIa8TtXdrLYJuUISXUZoGvt1jXRUzvy4YgX87uc5UQYScVGDY8gfQaQ8rEBuI4C1Sawwwku3/p2BQTEiJl/FhQjq1Kp66aQDmmaz7cedm8Cx/0yN2iXoew+PnO32orRq8O1oREiuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by SA1PR11MB8256.namprd11.prod.outlook.com (2603:10b6:806:253::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Tue, 30 Sep
 2025 21:03:40 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%3]) with mapi id 15.20.9160.015; Tue, 30 Sep 2025
 21:03:40 +0000
Date: Wed, 1 Oct 2025 00:03:35 +0300
From: Imre Deak <imre.deak@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, Ville =?iso-8859-1?Q?Syrj=E4l=E4?=
 <ville.syrjala@linux.intel.com>, Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v5 2/6] drm/dp: Add helpers to query the branch DSC max
 throughput/line-width
Message-ID: <aNxFp-XXG7HBqJMG@ideak-desk>
References: <20250926211236.474043-3-imre.deak@intel.com>
 <20250929063644.533890-1-imre.deak@intel.com>
 <agzmuyty22gxtm7cwpdl7ynmrubot45e65tfavbq5muamn6qnj@2wsbjqlc3pye>
 <aNpbCWlluJfsjSE6@ideak-desk>
 <6qj46wruaj5k2ywepsrkzfyyq4bsvcfmg7jhvrk4w2jkhcyorg@llo7bzmlarre>
 <aNvBIdJbaCBzKVt_@ideak-desk>
 <2krnfl46ozmjt6ekr3p5gzdcvehadzwbyjow72mqi52ciunioz@oqdgqjt4tpeo>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2krnfl46ozmjt6ekr3p5gzdcvehadzwbyjow72mqi52ciunioz@oqdgqjt4tpeo>
X-ClientProxiedBy: LO2P265CA0258.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8a::30) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|SA1PR11MB8256:EE_
X-MS-Office365-Filtering-Correlation-Id: 5adbf625-24b1-4713-f9f9-08de0064d4ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|10070799003|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?AY7fSq40j1MKrdzrVc+xK4YrrDUR5D+Yyi+4t08iEbdwm112CivAxZ17Sr?=
 =?iso-8859-1?Q?dqANZNIac7aVO3kPKlFv4MEgnniicEDGyPqv2gDmoNVOLGXXQUP6K90pcT?=
 =?iso-8859-1?Q?VZLNLATzCtNQyczKUL82YD/f5Iu16aiVOXDg8l+RImvAsuifwC0jXIniS5?=
 =?iso-8859-1?Q?SwO2MPSZiQGk6SRYrEK4ZYWuJppsJcFbIxPT+nP5VeEoHtzLxAj8FWo+QD?=
 =?iso-8859-1?Q?WBvllK21+B2ClBimyTdl3vBBAslF3KiqW/DgnEVDRu3tt/DQuxNVKGtnic?=
 =?iso-8859-1?Q?CzIZbNxvz6lWYL1Wa5v6m9aluvkRK69UEsdp9kqqr0AiXlJvSI7oZ/iT67?=
 =?iso-8859-1?Q?gJgbvbcc2SR+73HcBWznoNGTSX1STBWpISgD5ehwwAY+mbTtkhjyZXIubu?=
 =?iso-8859-1?Q?7IVA8u7fjcKKMy26HlxoCbpNfcv9wDGBTXkvHkIMvz/mfMq9add9ag0BxT?=
 =?iso-8859-1?Q?ss6aHf5zePcxElEPV17jILpeuM251fR73MwXMlXzTRdY3CsDLQ6wSb6Q51?=
 =?iso-8859-1?Q?uLPddJ0gSxscDJIKAz2ubyFgvHO/Rjjcx8oHt067ryj2dEttSddkaQmXBs?=
 =?iso-8859-1?Q?Pp7Dq9mu9VmDx83i+fwqs43bXIWdXvli8J2CwvBrBrC6CfJrmYRAQ6+t69?=
 =?iso-8859-1?Q?4UhmD3Q2U0kGt1hZh/1qvz5QVT+YMerH9nvlvkJchiZMPvM79KNTLQcxFr?=
 =?iso-8859-1?Q?xSMJAMWbvlOaQmuzAANvYaXx2VfKMqvjze4mNit7LuuZ44mRXcdJXEp8ls?=
 =?iso-8859-1?Q?JRgScTANo6yuJKquB6QEhGeI4JzVt/iM7lodfv2dbNxd5M3YP3I0QYGWti?=
 =?iso-8859-1?Q?NhMCT68cxbFp5teE7UByUeDyXODxqfKpC/nIjxBa+61PBu9zaeXKn0xHE7?=
 =?iso-8859-1?Q?22YYwWUjAgTcTok96Ox7DEGyf0cpBKqxVo4zH/znQswtd1fQyKZQi+x7zb?=
 =?iso-8859-1?Q?OAaMTHL2XfhtNty7kQeXS/6pIsYt0EdgnSpbQrWMmbciHn0oyicdg883f7?=
 =?iso-8859-1?Q?/91FAitjH5nhQJfkvM3ScbbBaDhkHWOYPifXICIsDkRnUhTCqC6ZaVwPI5?=
 =?iso-8859-1?Q?s2zEJwzfQeO0189HTAbIqhQS/K9eubFMugre2NKK3fcCGiRklw/WKxcgDx?=
 =?iso-8859-1?Q?hxMMtjT0dL4BCVgn1Htaq6vTErqZqlPY0R1lOvs7HnEvOK8xfAfbwhHvGp?=
 =?iso-8859-1?Q?fgxuPSpMtv8lnEAPMXvctw6sDi6YT5AkH8MkcWEet2lA0vsRN4uz1MpJHV?=
 =?iso-8859-1?Q?C1SUldUMO7GGArpn4SBZxPVfTlBQz6ztt1zQJMRL2484LQbpAxX/J2wqOc?=
 =?iso-8859-1?Q?yv7/eQCTo8EQNAJzuQDnKp9K1JdcTF6y0Lxkbig6jPKPyI3udTR7ejE1Zs?=
 =?iso-8859-1?Q?REOi+SlfLWvtNuxeO3PQagUkGMyAiIyG8yvj2FBHfWZDbqE6+glpV53eMG?=
 =?iso-8859-1?Q?IIVdUQFSzYYWpW3MdYli5GJiA+MtBkBySDRWxXrkoP9zQP7BMD4ApueVa2?=
 =?iso-8859-1?Q?PDqK34lF3ubM4aP4iWjMHCaMTKg/wWhPGkojj8DCkixQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?nv0UNiP+1mQCrIy2Qvdnhjh3teircc8AP9Fc5Lac6lhdu01JMFP/JEvpRz?=
 =?iso-8859-1?Q?vcH6YYc53vVHdweo+/TpjfsXe9QMAxqLwGvP3kxYxn4qXn+t50gq24BLaX?=
 =?iso-8859-1?Q?MaenPUqvKeKg1ZBXy6L++gGhD/qJM7sBgsSnFRwiLUe6/XU1i/XkSUHnA+?=
 =?iso-8859-1?Q?SphTgwhBqDUKXXaGqX6WubigLwTOF+K8OdgeoHCy3m/MHpdPJuDKZvdW0Z?=
 =?iso-8859-1?Q?9WxuVQSqMlmXqiQwf2tD5ao+QfJSvJlhJkIxWURndS3AReWsStIf1FzTJS?=
 =?iso-8859-1?Q?oOFIkpUkFk++u9SGL4MpTdh+P4WHmPLtLB3TK0qZRCAEXkYOBHzDiPDnF4?=
 =?iso-8859-1?Q?mIFkPiAZd1laLLP7M7RsmtGzjoKe3WrgLvMbfo9xWtfXJatvLqGVdGoqgm?=
 =?iso-8859-1?Q?PjYnfqctGPC63sptE2g1Mk7D2sLSuE9GDBj+87J9MFiG/BA6uzN/dRjvvG?=
 =?iso-8859-1?Q?0VLd3TvRqHxJUEM+w/nZkwINpHLubtNW6DftMiRJSeu/xd6lVZIrZN7Mi1?=
 =?iso-8859-1?Q?RWLBPCnA35UZBtH7sVjw6ra30Aoi3LmRYonz+Gvd95vA9ZhEQZU+5r/DUW?=
 =?iso-8859-1?Q?6kXckN79NHIPe8wc7eVJ82pIBXzXlNQgoxY183V38QS3bikWmel5qyGK97?=
 =?iso-8859-1?Q?uXlwhPc3hFOkUiyKTNDR5fCt4qq4Zx5MJNxywoZCPDUhK7E3Enk8gf8L2/?=
 =?iso-8859-1?Q?+0HoindstlmHe13Mq0JcqUlFgj7ugsuglOLSGZO03va511FW/+lRxmslW4?=
 =?iso-8859-1?Q?/pEFaOkCr7vAy0hOOoZxMQ6lVU3WcvcB8TjhE5Pd9zCZiVtUtmoG4L+XsG?=
 =?iso-8859-1?Q?Mg9TsoM4ipBzTCF6ELnAW2WmF+QwfHONj79PmHJAEma740xDyhES36+b0X?=
 =?iso-8859-1?Q?WstWyPDqqIx0yMqC0JN1lPya5ICtQVJhAPOwBVGXhTRpb82/QiyXr5rOk0?=
 =?iso-8859-1?Q?095NerkBjXtewHU9d0SVBeiOdH11rF0ZwaZQwzUb0ZaNFCW7OibfOuitXR?=
 =?iso-8859-1?Q?XjwwRCFIwaCN6X8pvI1jwIGi0lViFEt+pXmb4jt4FlZ5uBKBKREa6bQTh1?=
 =?iso-8859-1?Q?P8fIJJzCno/kGj799MwpC4xu0QGg9l2MfouvMeY8XvuKLRv+DfledRX1Gh?=
 =?iso-8859-1?Q?eSzrt/F0xbgYui/46nB496eNgC1iTm+2YBPIF6zaHV1EsSYGED9ouQdzbA?=
 =?iso-8859-1?Q?t/kwlgS/+YgIuKJOKb6KT9mWLPmjIS/JySNjs65Gh+nTmwmQDuh/lFQVw6?=
 =?iso-8859-1?Q?K2/dLhHyPjgatW4a3MgRzJXw0R8ELJekYbqUkecDWaKmdhhibswM1umWNC?=
 =?iso-8859-1?Q?EUJfiIQfdw6iR75VhsxI0SNnA3duc60TbdQHrGwEhN+gEXlG9DJpnyh9G2?=
 =?iso-8859-1?Q?Nq3ctMGokJO7xZ8dC0jReOyLduWa1EfIWRm43d8b+Tj+9afKojdoE7SkTr?=
 =?iso-8859-1?Q?zsMUhbZQYk9xOLUf0CuamUOUXkwrErK8pbqXsWahu3E7522bz56880++ZC?=
 =?iso-8859-1?Q?9/AtkWzjJkKAk0sjATtVp04NfwDpQYOf8Twlj6lxIod5jKdeWqFA5Oo4PB?=
 =?iso-8859-1?Q?f6zc/RWyt3ORRG42fGowHAcPkN0epqk/+/rcCokNVPdFCo9LWXfCtWQLBY?=
 =?iso-8859-1?Q?1LuExwtTPkw0z0YqVHJygxWJlTi7qqWRC1zjhstVDdqN/f6xV+EcPzHGKd?=
 =?iso-8859-1?Q?nW9fFssLNgOrZ5AxfIJnpXxpMsjKUwcfY7ez5gXD?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5adbf625-24b1-4713-f9f9-08de0064d4ba
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 21:03:40.0173 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bpRlUhG6DmacZ8eMhveasjlxyfiAkTDn64zJAlvI/HmuWu8V6Wh/l9UKaab1e+uqLWCXLwd739ENlKneNi7Z9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8256
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
Reply-To: imre.deak@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 30, 2025 at 11:04:47PM +0300, Dmitry Baryshkov wrote:
> On Tue, Sep 30, 2025 at 02:38:09PM +0300, Imre Deak wrote:
> > On Tue, Sep 30, 2025 at 08:30:10AM +0300, Dmitry Baryshkov wrote:
> > > On Mon, Sep 29, 2025 at 01:10:17PM +0300, Imre Deak wrote:
> > > > On Mon, Sep 29, 2025 at 12:00:03PM +0300, Dmitry Baryshkov wrote:
> > > > > On Mon, Sep 29, 2025 at 09:36:44AM +0300, Imre Deak wrote:
> > > > > > Add helpers to query the DP DSC sink device's per-slice throughput as
> > > > > > well as a DSC branch device's overall throughput and line-width
> > > > > > capabilities.
> > > > > > 
> > > > > > v2 (Ville):
> > > > > > - Rename pixel_clock to peak_pixel_rate, document what the value means
> > > > > >   in case of MST tiled displays.
> > > > > > - Fix name of drm_dp_dsc_branch_max_slice_throughput() to
> > > > > >   drm_dp_dsc_sink_max_slice_throughput().
> > > > > > v3:
> > > > > > - Fix the DSC branch device minimum valid line width value from 2560
> > > > > >   to 5120 pixels.
> > > > > > - Fix drm_dp_dsc_sink_max_slice_throughput()'s pixel_clock parameter
> > > > > >   name to peak_pixel_rate in header file.
> > > > > > - Add handling for throughput mode 0 granular delta, defined by DP
> > > > > >   Standard v2.1a.
> > > > > 
> > > > > This one got sent as a separate V5, without a proper changelog. What has
> > > > > changed?
> > > > 
> > > > This is v3 of the patch, the changes are listed under v3. The patchset's
> > > > version is v5.
> > >
> > > Ugh. How one does relate this v3 (which is not mentioned anywhere) and
> > > v5 of the series? This is totally counterintuitive. A usual
> > > recommendation is to send the full series and to send it as a new
> > > thread, sending all the patches in one go.
> > 
> > It's a common practice on intel-gfx to send a new version of one patch
> > on top of the last patchset version in that patchset's thread. For
> 
> I don't want to step on intel-gfx ways of working, but how would that
> work with e.g. 'b4 shazam'?

I don't - yet - use b4, but I suppose it must work because CI/patchwork
uses it and it does manage to assemble the new patchset for its test run
based on the In-reply-to header I think.

> > matching the patch version to the patchset version I can change the
> > patch version log above to be like:
> > 
> > v2 (Ville):
> > - Rename pixel_clock to peak_pixel_rate ...
> > v3-v4:
> > - No changes
> > v5:
> > - Fix the DSC branch device minimum valid line width value ...
> 
> Yes, I think that's more obvious, thanks!

I've been brooding over how to send the next version and then decided to
stick with the current practice and sent it as [1]. That is, increment
the patchset version to the next version of the patchset which is 6 and
increment the version of the patch with a change to the next version of
the patch itself which is 4.

Not sure if introducing the above "No changes" revisions is a good idea
after all. When the patchset is merged, this notation would lose its
meaning: you see then only the individual patches, not patchsets, so the
only interesting thing in that case is the versions the patch itself
went through. Keeping the version of the patchset and the patches within
it in sync could be also too tedious, especially if you wanted the
version of a patch without any changes to be brought up to the patchset
version.

One view is that the version of the patchset is simply different than
that of the patches within it. If an individual patch is sent in-reply
to a previous patchset, then it should be clear that this patch has a
change on top of the previous patchset and the changes are described
under the last revision log of the patch. Otherwise, when the whole
patchset is resent, the changes in that patchset version must be anyway
described in the cover letter.

I'm open to ideas, but this is my stance atm, also based on past
discussions about it with Ville and Jani.

--Imre

[1] https://lore.kernel.org/all/20250930182450.563016-1-imre.deak@intel.com

> > > > > > Cc: dri-devel@lists.freedesktop.org
> > > > > > Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > > > > > Signed-off-by: Imre Deak <imre.deak@intel.com>
> > > > > > ---
> > > > > >  drivers/gpu/drm/display/drm_dp_helper.c | 156 ++++++++++++++++++++++++
> > > > > >  include/drm/display/drm_dp.h            |   3 +
> > > > > >  include/drm/display/drm_dp_helper.h     |   5 +
> > > > > >  3 files changed, 164 insertions(+)
> > > > > > 
> > > > > 
> > > > > -- 
> > > > > With best wishes
> > > > > Dmitry
> > > 
> > > -- 
> > > With best wishes
> > > Dmitry
> 
> -- 
> With best wishes
> Dmitry
