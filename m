Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C63A5EA75
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 05:13:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8E0710E7B5;
	Thu, 13 Mar 2025 04:13:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b1p+/cBt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2A7810E0FE;
 Thu, 13 Mar 2025 04:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741839220; x=1773375220;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=EE1ignC2JdWpFYzVG3KZgfqxfAhYNoJQxKGMtO0x3UU=;
 b=b1p+/cBtfs+X9Dg1cvhZCi7SS/rTzSGmoLUxmVRztsdyaIk/N9YhO8nL
 x3R6TgDn5etaUG8wuQdnedRNzHIniveZVzAgR5/VufVCiKODhGw31pVzi
 KUp+gKz/TQPDasxo7Tgjnc/q3+k48Yu+G4xQ2Lqqv+WmavLrP5Vcr7sdD
 YpSSGFf8X7nZx3TB6V9Ezhu/ynrUykGpQhQL0p/JBrGXQqtuHcaxoXj21
 CpLpeB3geb3NpEftMttD/2p3QuBAf8mUhzKwgeu5IDPfa/q7eNECjXLjE
 cbEUMT4XVRgWdchXs0bHh47QpPRp6pKxsYQ4RD5TXrKTmtOpYoFgQAIqx A==;
X-CSE-ConnectionGUID: /5BQWE+3Rq+bZWA0YNfPHA==
X-CSE-MsgGUID: eWCPMHrBSGeIn+1wgmeUjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="43073922"
X-IronPort-AV: E=Sophos;i="6.14,243,1736841600"; d="scan'208";a="43073922"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 21:13:39 -0700
X-CSE-ConnectionGUID: a8IPI7MGS5elGPNDCPw4ng==
X-CSE-MsgGUID: 3D2csPJWR3SfCLJ/Z2oq/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,243,1736841600"; d="scan'208";a="121326706"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 21:13:39 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 12 Mar 2025 21:13:38 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 12 Mar 2025 21:13:38 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 12 Mar 2025 21:13:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Az56iGtN4ceQGSe+81SErptuPomjm4X9pmVeODqasUDGmofYbX7IeoN56IxzwiDXqVdfoVs6u8orJUsVVL3Sfyk3Cvbny4sxlT/pGB0GSOa8HEqk0WC9vHBPNTQu+ddctdLy5k2ljuF/PVN97Ou5nsch4nbdYD9IMngLghikKZfwgohLjHKqNUHPNzzoVChkjndA7Y3SzNAdj4oW0KhkhAkDKP/zFNJLM2KcrB4xJZIXum5XvkNNI/S7QFxRTDTGViWqlO1s8ALRJ3DAQbgaIBwedjQQC5rQcRGXMSEsi0Ym2y+YeJ+Z/ibENCMKWUUHqyFEkaGYAOMm5/3A61U+Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TpAkacGFzIT0keL0VGiyjoyrkuHBXikt/0hpmt+/GfQ=;
 b=QCsm6JdsjqCpO6jNMG+Mlz2q+NYGwEA6BsS1qKG3yGi21xInh839Bj3Q/WUB+cE4lD+lJuwyXz1Wku/dOaUgnx2HYm7mcfHAvrByqc+sXF119wuTbTpC4W508Ei5q9H/1sHwORHOLujf6YcYAjfXfsCTsjUdwJiufLOrSUht7jhwqbijWrdxqCdvVptt/WLTjMvX/nDBHY3X/UP0yfnrfQZWBZiv0qcfEIgzIAHl1TT/zcKLMq2wfkKggqm4FO1JMktTqvPu4C6OvLdpOIE37mwINxDh1cG7RBOg5DT6L8TzM8auVUrXnXt3/ShF6ZL7r0s6O3bzLm2KLAraQ5DR5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by DS0PR11MB7925.namprd11.prod.outlook.com (2603:10b6:8:f8::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.28; Thu, 13 Mar
 2025 04:13:35 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%7]) with mapi id 15.20.8511.026; Thu, 13 Mar 2025
 04:13:35 +0000
Date: Wed, 12 Mar 2025 23:13:28 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <mailhol.vincent@wanadoo.fr>
CC: Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes
 <linux@rasmusvillemoes.dk>, Jani Nikula <jani.nikula@linux.intel.com>,
 "Joonas Lahtinen" <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Andrew Morton
 <akpm@linux-foundation.org>, <linux-kernel@vger.kernel.org>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, "Andi
 Shyti" <andi.shyti@linux.intel.com>, David Laight <David.Laight@aculab.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v5 5/7] test_bits: add tests for __GENMASK() and
 __GENMASK_ULL()
Message-ID: <e5afhg75ry6km3hjmzbimonxc6qfl4vzma7ucv55h6iohrbmbn@xqmxfuvoinp6>
References: <20250306-fixed-type-genmasks-v5-0-b443e9dcba63@wanadoo.fr>
 <20250306-fixed-type-genmasks-v5-5-b443e9dcba63@wanadoo.fr>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250306-fixed-type-genmasks-v5-5-b443e9dcba63@wanadoo.fr>
X-ClientProxiedBy: MW4PR04CA0078.namprd04.prod.outlook.com
 (2603:10b6:303:6b::23) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|DS0PR11MB7925:EE_
X-MS-Office365-Filtering-Correlation-Id: ecbb2bbc-e29b-41e7-60ec-08dd61e56cbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JrgZ7bVuoKlb5Abv8oxxvo2s71YC/VrVjxqUyA77iRZGkt1r5lyAfTFVS2re?=
 =?us-ascii?Q?rLoQKS5HqI0h17WvpHkj6Td+oRT7C5cdsuYS85OT/6um67hrFrAi9hFMagGP?=
 =?us-ascii?Q?4CvZ2T+c4Ychbq5BnW14GzGRTSxn1F4DIHUfUh6d2k+1Qy6qf3IG8aNhTnYQ?=
 =?us-ascii?Q?8Q9sfAiTQl5AU5P+XfJ0TUBzqi7iMXVkm2Z3F6tLP8sSv0QJcfHj4eparqAt?=
 =?us-ascii?Q?9Ko7d2S1kKt+0gm0t1VS8h3qeJaRffuBGos7zLnDv8J8tPgWGJm9LzW++wYe?=
 =?us-ascii?Q?iewDUGQOZ35cQRKOucFUgOC2WOVFNDBBSJTuu5CnBGSARdp8Tx765gXn+PzB?=
 =?us-ascii?Q?02Q0cwpzIhV6Qe4PccnoJTDPEqMREGDCWKwJWRcmhOt0/t6Jywq9jTXbeKun?=
 =?us-ascii?Q?UHMkYQ7e5KJ3yeeezL9whqE7JkTdeceN8bTOuiKF5YJ+H5uFCiUbKxf1Kkew?=
 =?us-ascii?Q?EDdHhSjlUpP8jfpH9/T4aIybPGio29g/N1JWjhY6HZghChw8WeCLqUWfLRGv?=
 =?us-ascii?Q?5TZw5ZMx7QSHo3lKD5/VfhEGF76LfYPVototG6Xvv3OvIEUcut+M16jqLaaC?=
 =?us-ascii?Q?7uCMsLPmUEPTvtTJGvLyLKfrTVmjjUiZPOgc8Y1fUO8WscJReQbjFB39PpyV?=
 =?us-ascii?Q?mKekT5ZOP5U92fcqGt/myF2UmirAX0hxmtTmHvjGPzzj9j5Pg5NyW2YWCeOv?=
 =?us-ascii?Q?ysZsiU3hHctYuaImuyKEOpKS6sw26+ClDD42JGVT/SD/VFBC3WU68ru3kbzK?=
 =?us-ascii?Q?dabeBbbu9VjUO4y3Xo70A0nxrYziE0IPcNy/o7JoZPaaQt19V0l6Oo95GMBn?=
 =?us-ascii?Q?kci8NcH+jfDJ15PoIRmcO5dAHyVC+yB87PBcbk/gy03ks3TgTpuxN8IeqKoX?=
 =?us-ascii?Q?H6GHc0zOfTKdjO+wqvtBKzneC4m6tUukfI7gFeBWRQrI5UjHhzyY5LfdXN8G?=
 =?us-ascii?Q?KEtGTWDq6Qqz9ymh0qkzIBSAQ46CLva04poFzoGwmb/ht2vwngm2ho9PsACZ?=
 =?us-ascii?Q?09QpoEDy5t5extCq6upsGxJzI5UraH/4c+q3ZddthHMhu+Hb8+a7DvV/NvaK?=
 =?us-ascii?Q?TNlnjqqkRD7SCdFyT9HnsNF9KO9vtTE948DQxMcQBKwYiO0IJmDNAup/vpF+?=
 =?us-ascii?Q?umC4ojxjKmQZQgW6twCZBwKSWQcVu/2Y+W+ZHuCpOjPdmGTz3oAQWpm3wCWz?=
 =?us-ascii?Q?RuzUVEQirTL0SmjBiTh5AGE8qRhqe6SKYfECCNBOx2cJ2PTNxMl63+9y3WS2?=
 =?us-ascii?Q?o2HSo33ZnX2mE2rd+Ua7nIBJtcxfJqYqjV2GyZT+7E35QGsyja94jeuJr3E/?=
 =?us-ascii?Q?dLUQkFLEssn5bq9s9GGk9GZ7CilP010UgTm6Xp+KofLRVwUhsSfGJ728jzim?=
 =?us-ascii?Q?2WOK1sQ/JEnMlrMY9BueAXWOIltt?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YACuBYRgOCn+2PvDwPcx1XQHMxYaUXDCuMJXcRMYdDHwgnQ2btlJlvMBE0wV?=
 =?us-ascii?Q?4quUAwPo1BAIv/az79DBYNhxu2Bpu4re8DdvIYgekjEg/aLiXJDtuvU+VfqM?=
 =?us-ascii?Q?/taW/yY4dmpk8bNGLUO9jZWRR1Jj9ISfpHi9NHsZ38kMx5oMLL3MQpfJXJnt?=
 =?us-ascii?Q?LyvMYeo3uPP2z/iwh+2ezX+vOsG04rIzMTu1/gOnhPStaadAdDFrJx1HqZtp?=
 =?us-ascii?Q?55Cbf0Dycl0DP5ZSZiz/apcqLnfW1hO3anbfHpRmb33fSNe5d/F9Zn/lckY+?=
 =?us-ascii?Q?2Bv4UUM9GcuvPv+V9ncBo+kJCpB/DEvSBk1lOh/wR+zn/t+KizZewuNsWWlk?=
 =?us-ascii?Q?PGl0BlDp4Va+zkpMPH2l6HIQwWEMh595VU6cVX4rxsUiE7vz9Ndwm9uHSCVF?=
 =?us-ascii?Q?7mSepx2CPnkgsXBf/8W1JmyT6ubnIdM/hBhZi9W9U86LvPWNZxIBCM5HD0y2?=
 =?us-ascii?Q?0mpd/FadZIM3pcqgC+uQYPMZ9Oy/9YXKUNtuadcv5eiYoQ+0NBb24wH2HAHb?=
 =?us-ascii?Q?AnhKvSDR1cn/VFeCJbbyhmMcR7cj9jxmkqv4e7xVKWrEq9K06Vl5dXk7aZow?=
 =?us-ascii?Q?4YbTU73W2wDOL6ON1xOQbnUhascadXgwSbyoHSzD0q+Q3WqJhSz0v61CL4cR?=
 =?us-ascii?Q?uRLwg7hvFbSZM5J+jTwTI0KHdUe2G8gM1cMWBgp59Yls9ga01QkPdCOvV6NK?=
 =?us-ascii?Q?XwQkToF9i+BwHL/rF7XsNxn42BLUPfnWQM6yc+o4YyHipjyRE2PB/KwnSZHa?=
 =?us-ascii?Q?BXxOUFTSIStacNpuO6GN1zVcEFGnSBaSvJamvPU/8NY5M0I2vPrQ25e7lMqC?=
 =?us-ascii?Q?AvWrSgBwAD+6tGLSWwY5KcIdZR4CM/Che86s90JXiuM/8z0r4ZgZz20ICG2p?=
 =?us-ascii?Q?7whmP0kd/gA1MmbGTosqkfaQkoU33lznv7bPsdZsopkK9rusYRhErnbT4aPL?=
 =?us-ascii?Q?aDqn/cBGaZFLsxPtXQ4STwWeQ+LLuW2smcw2KX9iolzm+EowgwO6g/XMuRJp?=
 =?us-ascii?Q?h1XST2odxMSc/trNutbo+s6JaOQj7mo+f/gdVrdIjW15jzDzP35FAs/paPmj?=
 =?us-ascii?Q?CTLDdCtXEXDNEWgzHCrt50bKahzdDIL78GKyX/+EkL9Gk+XTPDjNeRc0fSWf?=
 =?us-ascii?Q?3mcPMvffU/hZWotA8FKNB5FLRVAqL2M/xl9wH1bMEdL5zHPKiXJwlq3htACW?=
 =?us-ascii?Q?NR907Eygx2TZxTOtgriuv7D9MyBXwkws8Pn1+dOwGgXLl+jsPYxW66H4EBZW?=
 =?us-ascii?Q?/7wgqv58YGjaQUWgF5EDAdUgAPosA3jy/zToNnPA4q2lUINSigMPIKf0V7Q9?=
 =?us-ascii?Q?ZDzXbghAejLYywOxsNWINEEXtIjYJREbfv4I4p21ki8HtHz9BaX/wEYm6JI+?=
 =?us-ascii?Q?OkaP4MvZpLrqliYNHgQzIlH3UzDQrpwOeWkPsn+56D+x+iQqltcRIvXacaIG?=
 =?us-ascii?Q?p/XUthy5XYgyfUwuG4xl7oN1qeKxrIIjAO+ru6m8xY7JHkdtMSItHXgCzxzd?=
 =?us-ascii?Q?7kj5G4NEx7WXL410gjA/eICBQJ3Q8BT4filDmVUTv5JkGNU9+bqqwL6jq68J?=
 =?us-ascii?Q?AxPW0BlpytzbtREzB0IzL6JapiDvc2V3kL5tonelKt9RnlWPhiZQm0/GJ6u1?=
 =?us-ascii?Q?Vg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ecbb2bbc-e29b-41e7-60ec-08dd61e56cbb
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2025 04:13:35.7617 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A9gg8HJybf7TzrRZQ10mYxcxMCPiEr+6AiV03WGhpOt6+uFc5a1V/wplzocoIXRlFm+5rsz7EvMjH90qbG06lFxqca1NHQsC1QW3hY/lkEg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7925
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

On Thu, Mar 06, 2025 at 08:29:56PM +0900, Vincent Mailhol via B4 Relay wrote:
>From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
>
>The definitions of GENMASK() and GENMASK_ULL() do not depend any more
>on __GENMASK() and __GENMASK_ULL(). Duplicate the existing unit tests
>so that __GENMASK{,ULL}() is still covered.
>
>Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
>---
> lib/test_bits.c | 18 ++++++++++++++++++
> 1 file changed, 18 insertions(+)
>
>diff --git a/lib/test_bits.c b/lib/test_bits.c
>index c7b38d91e1f16d42b7ca92e62fbd6c19b37e76a0..dc93ded9fdb201e0d44b3c1cd71e233fd62258a5 100644
>--- a/lib/test_bits.c
>+++ b/lib/test_bits.c
>@@ -7,6 +7,22 @@
> #include <linux/bits.h>
>
>
>+static void __genmask_test(struct kunit *test)
>+{
>+	KUNIT_EXPECT_EQ(test, 1ul, __GENMASK(0, 0));
>+	KUNIT_EXPECT_EQ(test, 3ul, __GENMASK(1, 0));
>+	KUNIT_EXPECT_EQ(test, 6ul, __GENMASK(2, 1));
>+	KUNIT_EXPECT_EQ(test, 0xFFFFFFFFul, __GENMASK(31, 0));

why are you dropping the ones for TEST_GENMASK_FAILURES ?

>+}
>+
>+static void __genmask_ull_test(struct kunit *test)
>+{
>+	KUNIT_EXPECT_EQ(test, 1ull, __GENMASK_ULL(0, 0));
>+	KUNIT_EXPECT_EQ(test, 3ull, __GENMASK_ULL(1, 0));
>+	KUNIT_EXPECT_EQ(test, 0x000000ffffe00000ull, __GENMASK_ULL(39, 21));

ditto

thanks
Lucas De Marchi

>+	KUNIT_EXPECT_EQ(test, 0xffffffffffffffffull, __GENMASK_ULL(63, 0));
>+}
>+
> static void genmask_test(struct kunit *test)
> {
> 	KUNIT_EXPECT_EQ(test, 1ul, GENMASK(0, 0));
>@@ -93,6 +109,8 @@ static void genmask_input_check_test(struct kunit *test)
>
>
> static struct kunit_case bits_test_cases[] = {
>+	KUNIT_CASE(__genmask_test),
>+	KUNIT_CASE(__genmask_ull_test),
> 	KUNIT_CASE(genmask_test),
> 	KUNIT_CASE(genmask_ull_test),
> 	KUNIT_CASE(genmask_u128_test),
>
>-- 
>2.45.3
>
>
