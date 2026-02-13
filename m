Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0KIAFPSCj2lTRQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 21:00:52 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C151394C7
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 21:00:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3332210E273;
	Fri, 13 Feb 2026 20:00:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GjQvovSJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E61510E1B7;
 Fri, 13 Feb 2026 20:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771012847; x=1802548847;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=SdnJKGIiMzBs4MREXNEnnytzyv3HcKEWQr+UyQ7efSI=;
 b=GjQvovSJ121gEYhOptHSGIDsfCDIq9s62PA2oJfsK28e86Ars1l1h3+f
 5H5pgY/jiHIXu6TuvOqqupjlvUxZMnCpLVgCxyBEJqKEPwkDU3+KUUSmj
 4kucpdC4F0Ud1oCgUB7ZOeB1RTj9C3qY0nYwEkznsaK81h6196R6oDvHR
 FDMo0IcBVHVDjXc3zVfmnHlp9kM4d/l9BcU42dli8o9XmEVcCaOzXh4r8
 LYab+rCduJDUDKh9oAL1jPu5RVYcqEFzYjywg0+qsC2ZS3LOjV71rnC1X
 wyaiVoNBTm7zjP1iWjtEIHHJoWEbwbYskOQWLp/rrCI4IBOEgw5kO8Pgl g==;
X-CSE-ConnectionGUID: gjckeMRgRxqLGdskgRGfYw==
X-CSE-MsgGUID: 5Ul7lqRdT8uY0mVQ8pjf1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="72105126"
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; d="scan'208";a="72105126"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 12:00:47 -0800
X-CSE-ConnectionGUID: 6CTBOoxEQLiXS5P2XMBvew==
X-CSE-MsgGUID: OcGl/YEsRfKnDgryOaiePQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; d="scan'208";a="211901269"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 12:00:46 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 13 Feb 2026 12:00:46 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 13 Feb 2026 12:00:46 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.21) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 13 Feb 2026 12:00:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ObPQgcr5M/7bngPiA0m+ZBkMqqdBylMrbwrOcupL+14VHH3jTLMaBu2xel6Yxa+0atOH6gDP/xFqnhg3eaYbYzxXhBPqqF9kP2WwGsK4IVFJubsjAm1KdhkuKUWTAgkJNEXw9KVUSqjvRMnqwJDVzQ0ex0PWdWc9amsSfEuv3y7zBqWB4H/WCLYBoE03UKXeGD33ezm42bx3S8Us59FVWrzFkWojKzrfgBgLx4SEKxTHUirMg0vDtm5qOkptDxrF3lMioXVWXq/8Te912tKSHyjAcZJYOK7Y/O2r3TWjiBPd3bzXDstLif+ReDgmNdeSo/hvb++Rk3ACL4xNxOp/kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5mdgFFVkblVACWAIKaRt1FbadNyxagToKjNI3y6Jj9Y=;
 b=EvCt1gA+ft6OkWSm13ZQ5czFw58AFgmP3f8uEtXqtuFJA2K644FzMh8LWvSCWICS1J8oK6yd5yGLmm0s+CWpZWBkqathYDDpvSplzlUtl+LeJDvBW+QbHc7MFebrQ3kpr+/XCmuBGcHQor1CL5MFlI+UFmQoHpEF+AeQ1JUgwf91onu24cu9mCvBlpL9NzmCuJ1fsr9Yc3TWUVRcE/HAbl5Ae+0bx3aJSFujBHSksn0CfE72zzTHV6/P5D1ButqSBYY9MyeYQORgfmqRkpKtEa5fyviixMEeVe5P4LOjFj1+vveWbRCdEXIcWUXPgUIFhg2yZEbGR7IRrI6U0D+oQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by IA3PR11MB9207.namprd11.prod.outlook.com (2603:10b6:208:578::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.8; Fri, 13 Feb
 2026 20:00:41 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%7]) with mapi id 15.20.9611.012; Fri, 13 Feb 2026
 20:00:41 +0000
Date: Fri, 13 Feb 2026 12:00:37 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
CC: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <leonro@nvidia.com>, <francois.dugast@intel.com>,
 <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v4 4/4] drm/pagemap: Use dma-map IOVA alloc, link, and
 sync API for DRM pagemap
Message-ID: <aY+C5Qaik1XRZGwZ@lstrano-desk.jf.intel.com>
References: <20260205041921.3781292-1-matthew.brost@intel.com>
 <20260205041921.3781292-5-matthew.brost@intel.com>
 <6289525edef2a1dca5d9de325ad0efbc1cb79a38.camel@linux.intel.com>
 <aYyiHQ0avcRcti8l@lstrano-desk.jf.intel.com>
 <1215d2ec94ecf13944d01bd4de29bf29bd4f8bf7.camel@linux.intel.com>
 <aYzPtCisUdv6FPEC@lstrano-desk.jf.intel.com>
 <20260213145646.GO750753@ziepe.ca>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260213145646.GO750753@ziepe.ca>
X-ClientProxiedBy: SJ0PR03CA0040.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::15) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|IA3PR11MB9207:EE_
X-MS-Office365-Filtering-Correlation-Id: 280b1f65-e0ea-4091-5862-08de6b3a9095
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JpceybpmqbmaAYLI4GCxSdvjTV5SnFs+O52G0qed68l28ayVNOESrcAEP8qd?=
 =?us-ascii?Q?CeFOEOpBA+7RTpB9mbcV0raYJJfvdgRuBR9B2tph+brZcIXDFh58pHcwfWmU?=
 =?us-ascii?Q?RF9LFcZyKsWimeKQ4J/BYyxhWgDeS11xL/UxmZtM0r+xJmu27oPd2rHCr47v?=
 =?us-ascii?Q?ySDFYIEtuoPwTy86pRPLfZnqWdfcZ35ZwHXwLtgEmL9/0sSQ2ix27KyiQrut?=
 =?us-ascii?Q?vKWo0o7XtzzKmMKr+aUypRM0mi1SblilBozGGLMDhWULTDHfnxPzAR/ca42L?=
 =?us-ascii?Q?e7Stps48FVK+NJ8S90h8EeMXa6dvc8ECC3OX+Qn20rlDxxgguYHecnmEl7UI?=
 =?us-ascii?Q?X0w/rm9I70+ANh0lPddmoxVV/e8ocROX5myng4n/TdV6ZFV7PM0r8uwUfs7Y?=
 =?us-ascii?Q?QOS9mQv5Fp1uQ8EjfsE0heAuIgcMCT/REkVL+XOUkZDiDLuaffdVB5sIP5hD?=
 =?us-ascii?Q?B28hJliByyNx0vlBCdtFprLMXCoWIcalDClVroKokbV4Hl8JQJ/7TNFJAuI2?=
 =?us-ascii?Q?N4PFthS8+QMmlcswdSUvHr0J9YiOYqj/lIsbY19gvChvbVlnmayvZADNYScI?=
 =?us-ascii?Q?FMYZRWDa7JulVhau981wfbjvgugZffkDuc0p3xIAMWeSjz54RRenzXzHQdbD?=
 =?us-ascii?Q?LfSqmQNkyFcbVPcHyWs6Cyv+b1qJpIxL5GfhkVuVys3NT/pH9vzc8oTWR1SM?=
 =?us-ascii?Q?F6pNvuGkgA7HMA/jN0Ja0GOVWHrKCO8Mv6XeJg2JfcKjz00C1HTUEtpFOON+?=
 =?us-ascii?Q?UWS/848TfU2DSwCkjz29aL04ziJde4BPvZCEtvE59qLCIy6YiPD8BSwnaqtB?=
 =?us-ascii?Q?+QFdcSpcnQ3qIeLMnDO6eFcrQUzHXU1V7tSv7Ej0egn6InOOzf82hgGvlmVL?=
 =?us-ascii?Q?47jBmi9HgZvvuO1GFl1ngm4e/zdo6pIf8NDLCbqeCXYjvSNq9+gjq+YmbwS1?=
 =?us-ascii?Q?wIqZRvxF9tdPpxnNNZh5kiaCJBe4EgQYY1fg5VRdA+lZdiMNG/hlct2Lbm3/?=
 =?us-ascii?Q?bbJ6sGQLGw2x/pqiyJeiBQYvle/wgpqUJjMMKLnMmbKaYf9MgBCtroQYXJd5?=
 =?us-ascii?Q?8WwOq3FAT/tUB4MpatVU0zVUDU3YBjimYmI934z0f+3AvsqKpcKx5pn7/wtF?=
 =?us-ascii?Q?sSfQ25o1k4c8bmtKX5zjqUfp79iBAV9UIhW9/u6FfTlxokwWEhUqpz64jmn+?=
 =?us-ascii?Q?Lv8VMcUtNbiCIYEt3UFfzeCC/0rJm/KsyDd9MSQuTp4nzccpfb48wHiFguAd?=
 =?us-ascii?Q?mJdCmeFu1Li6E60duX+EUbMQLBQEFMQJ3BDkBoplpHOv/zH/pmCQb/9r0aOs?=
 =?us-ascii?Q?zhzBvVoqzXBjYRA4Td1TMfPAzVbQrbBDeZIy7KlzC7yhaurmJJuldL3x3MmD?=
 =?us-ascii?Q?975uEFFQ7vbaAaCWtp3GEXyCZTD12U/KryEbMWFrwat/tgbrrIiJTxZ4zjlq?=
 =?us-ascii?Q?ncx9QF2po7p1TkxaFy+Ha44S1Z2NUxDZM90KsyTwDiAF2MUMP1Hg7IXvznL0?=
 =?us-ascii?Q?kBStjTKLKBHStGj7oHYz27mRWWOPIj0tY1iPhoAdycCY2JT0OGoojnTrdYwQ?=
 =?us-ascii?Q?OJsxhp0AFFR8DonqTAA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bj3LjMnq764T27DVOShN2dZ1Fcw5dVPjLqtKl5gDtpHXbbM1Jal31k/1QxIg?=
 =?us-ascii?Q?guxZ3Gq88LSuyII0MS1JgO0oYlT2Fz7ff5UjQ+rTRJJk2yW/IrrJ1qMZxITT?=
 =?us-ascii?Q?gnDUkvDVEKSAHaXbeqSDlIzyUn7U1JWgTOlbben5RqbuNnJ/vx4pt9S/5uK7?=
 =?us-ascii?Q?P89fw+d6rSnen8Tx9TmaXi/t4KS5SgtI1hQ7MGSlARTGusHfInSbb5IN8xaB?=
 =?us-ascii?Q?W9XAKE1LNxZD4S2Vee4CEmIBjH9DQaSkKFOL9DNsVRFI3LEDVQGMVzYssfMB?=
 =?us-ascii?Q?GuYBaEIJSBTUEnZmL92JhnhEj5YDRqpAhUDsTr1pDRo5l3Zq+RbmHA3qG5Vf?=
 =?us-ascii?Q?gB+I56IZ5FcULnw4SRv57N/Qw6yqGqSCSZhKhwIukDfwhldX2WPpEtutjGzP?=
 =?us-ascii?Q?6rDuT2lSW+JQ9X1j1hKyUoEIovU8k3d/HAIUjrqCru9sTSopDheT3IUn2VrQ?=
 =?us-ascii?Q?eeJJ9VvE3mrUchpsHSuEv+ItUHMi2J/7iKwA+ZbD9Eg4X7jxR/svZeIvndlk?=
 =?us-ascii?Q?BPR4kzVnGBmjPJG6ZHwNPHsyRiX0FRG4POd067LDoIOasxst52jX/lAOvAcN?=
 =?us-ascii?Q?nUH+xpoxKvR5xrlnGIc5QIO9rBdW1BB7fTQ1QrPluLKeKJxNkwWDhmyX4AKd?=
 =?us-ascii?Q?0VTjhin0PaF9T+N60dga1nxeiB2Y7uj+WYv+qSAJGkgYI85+FX+3TUDAM4x+?=
 =?us-ascii?Q?cBCOGU1j93qCQ1AiyDkA7kYH8OthTURyPfUyclMYuqj83lrEqs0+wf13hL3b?=
 =?us-ascii?Q?PuJ39RNHCFTKJ2GAgz9AdAh1WyRqR74XS7AKqj0Y5NYgBt3qIupiPZZZUxOR?=
 =?us-ascii?Q?fih0kalP1+CGnZJigSH5tiTUVmhJP4K0/KpizeGzKq3otMadLTRlAg98wtui?=
 =?us-ascii?Q?PuaRCAKKOt8ZcmIJkTEKYWiufN+algu5oPu7NG8kLFXfpTCRDT/l5qJZsn7K?=
 =?us-ascii?Q?/PUpeZp9OH5aGmlsdFMJQTd+CLo+j/Opr009Bvazxscy9CWs4xN7gld6yGLn?=
 =?us-ascii?Q?MMYC8bLTlrwFfpk9tc0nSzmaDnpha/4ypiuTPn44/50qvliqLNQotuConfg3?=
 =?us-ascii?Q?Slc3OTlkrpSk8AOPzbq2a37KAod085mJ/uoVFZuDmSHB7nw2bSsYbFw01u4H?=
 =?us-ascii?Q?fgQSc8UN2S7seJWviV6RM1oV0pTiZOP9ZGBlb47f5wluuZlk9aZHiZeRyFM5?=
 =?us-ascii?Q?Z4hDNmwq9DDmeqJ2NRgXcQ2C8o/O7uLDPwzHVdy2vg+jzjLygjmf1aYjjdJ/?=
 =?us-ascii?Q?jDuyf85I8vXUrBxbt1ZCVJ9jZg7bYyi9oTA1qFM1ZCNqDEwV0aFBRbnEE3j6?=
 =?us-ascii?Q?lhwb/5aofJ+VpcSIYqc1COZDYtEdt7XCWUT5YGlfrOl7kBerD3SqB2W4td1X?=
 =?us-ascii?Q?+OeLvGSR5YyStmiGq561S23Xxz6CpH7IUrlrvglg+htc5d5/aceHbumSGPML?=
 =?us-ascii?Q?Fq6bMFGrTpA3FFpNiRsRIBmtfYO8F21xws0T0VpbX9Te1PwMu7Eq3WmBvFjn?=
 =?us-ascii?Q?SZLYtyLh1Q2rQ38zRIvfZIZBTp3sO6f+PYoVieziNu8xR9xL6/PhFyrIGzPL?=
 =?us-ascii?Q?bZ3Szf94UzgmvB0SRb4I4uJcdpGhS2y5m9D7lCeBfQhKFYqk9eSr1AWIvb4j?=
 =?us-ascii?Q?eKRBT+9jOgSGOCYpdp15VofZCQ+NkFByZfVY+lxEckd4WWY8lVC8Wzli5aDW?=
 =?us-ascii?Q?51XsAjGLQcVxyUtX3A6QXzO0BI1R8J19l483QwC9RIvJRJtq1jL/muzNl8Sk?=
 =?us-ascii?Q?k4bKK3QEFg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 280b1f65-e0ea-4091-5862-08de6b3a9095
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 20:00:41.3820 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pe5a813L2hbLZ8YChFle9aah3Th/PLqz/EihPYxMcg1iwME/r8jxjrpDK6ijTTj2vkRYDQEC3Kgr/nVmrwYFQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9207
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	RCVD_COUNT_SEVEN(0.00)[9];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FROM_NEQ_ENVFROM(0.00)[matthew.brost@intel.com,dri-devel-bounces@lists.freedesktop.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Queue-Id: A7C151394C7
X-Rspamd-Action: no action

On Fri, Feb 13, 2026 at 10:56:46AM -0400, Jason Gunthorpe wrote:
> On Wed, Feb 11, 2026 at 10:51:32AM -0800, Matthew Brost wrote:
> > > So to be a little nicer on the IOVA allocator we could use the below?
> > > 
> > > 		dma_iova_try_alloc(dev, &state->dma_state,
> > > 					   (npages - i) * PAGE_SIZE >=
> > > 					   HPAGE_PMD_SIZE ?
> > > 					   HPAGE_PMD_SIZE : 0,
> > > 					   (npages - i) * PAGE_SIZE);
> > > 
> > 
> > Yes, we can do that. No reason to force alignment if our copy code isn't
> > going to try to use 2M GPU pages.
> 
> When it comes to this I prefer we try to add alignment information
> down to the iova allocator because I have other use cases for this
> alignment optimization.

Trying to parse this - what exactly is your preference here in the
context of this patch?

i.e., Is original code ok, is Thomas's suggestion ok, or should we do
something entirely different?

Matt

> 
> Jason
