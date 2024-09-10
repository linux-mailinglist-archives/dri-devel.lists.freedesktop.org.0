Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3677972B7E
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2024 10:07:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C31E410E73E;
	Tue, 10 Sep 2024 08:07:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PIgmMoJd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F64B10E73E
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2024 08:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725955623; x=1757491623;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 in-reply-to:mime-version;
 bh=ltHTIRYHi47aDcrZnfF5PLWScWeTz9fX8+EKviT1YbE=;
 b=PIgmMoJdRqCTeZ8x27ngSg8Lg4UmUWKSqIlCu/HOeSf9CshvdQ3Swt+Z
 /kIUyobV01T9xNjU9pPhpseqi7OkmYH7Q7y8OKqvYZlHwnZcbRBmHjBXN
 iQXmpgGKRWOHKmAw8Enqa+IipC8FjPxqZs6kTVmQ0YHBom01ASmC8WbLC
 /1kk0ibXTEnjpEYx57TxxZNfY4iL+QRCPz6B5Zc+GSjSkotDkZtakaeP2
 hHsMRp8kiwum5LT4NbjRFKb1SnzVj1QsSFVEHhHkHWtoA0WUK0mC6iapN
 QT6G0Lu2pDcLjWvoGNDLKDyT4oA8j+vE3inP4IUzjIhkdwdn5O7wfKqGG g==;
X-CSE-ConnectionGUID: ykcEoJS/T7iDjeKIDa9BXg==
X-CSE-MsgGUID: AaQfRmQBQSKtUFTemJ1GZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="35259706"
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; d="scan'208";a="35259706"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 01:07:02 -0700
X-CSE-ConnectionGUID: cMGEdunMTeOT33s65Sm2Cg==
X-CSE-MsgGUID: toa44bM0Qbqcw2kwN2PVHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; d="scan'208";a="67238436"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Sep 2024 01:07:01 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 01:07:00 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Sep 2024 01:07:00 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.49) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Sep 2024 01:06:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AFE5HWeBvctInLys4ZtCLXCmY3pEcgjsmNUwpPR+lMEGrjts3NQZ5KOb4iTrpGCHPQxHp9EllDWy9KAmvOjAFGOVMafWbQ5c6ZXBP9woMQlvIistRP9Vc0AK2ND8CqVKyVMOIgaNJvPMawMhxd5xN6ZVI3qn1UQMOO+hW2YRbQ7eDPGOaA/qLLRrHShpcbhyutzS6a/DEPJHR4pp+abQ8q4p5mkB/pCtRE4WMQEbtvU3uDKn1NJmzntbN4xbA6v/OYcDcCFTJmujnOofy6y+y1lyoPmzLp+zVGmcfSrtK3iuE7itatiOav4hs2atwwDpuYBWDjOEo1MHC9eiSkDwIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ltHTIRYHi47aDcrZnfF5PLWScWeTz9fX8+EKviT1YbE=;
 b=NP4sZqrvgqjj6JnUNBh2LCHU4bj2DMy4UPF/6MieWu/hWJBPdoTsOOZMmnJuIUJNgPGgXKFQ0cteGfPUetdAhZBord7ZfFjDKoHlUZc+Gwr8Ssz0VWHMXqHYf8l3LsvAif2cHLIOd1Z3Ck3rxEF4qfCrZ1LeS+BICoa6s20FLxFpiYbkDjbbQG+80+z5g4b8hcgbgxd9GY20/VmFG30DANvfZlbE9s2xfL1EzUFuXiyuY91nj3m43fN7vsPc/D3yFfll+LJx6q7Ve80EUGLd6e1OLXWq/3yCAJXhlj7Ri1EG5U/975fOkfyBDTT3OcLMSScUC0/eKM/X1naZtGGuaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB5966.namprd11.prod.outlook.com (2603:10b6:8:71::6) by
 CY8PR11MB7034.namprd11.prod.outlook.com (2603:10b6:930:52::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7939.24; Tue, 10 Sep 2024 08:06:58 +0000
Received: from DS7PR11MB5966.namprd11.prod.outlook.com
 ([fe80::e971:d8f4:66c4:12ca]) by DS7PR11MB5966.namprd11.prod.outlook.com
 ([fe80::e971:d8f4:66c4:12ca%5]) with mapi id 15.20.7939.017; Tue, 10 Sep 2024
 08:06:58 +0000
Date: Tue, 10 Sep 2024 16:05:00 +0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
CC: <kraxel@redhat.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <virtualization@lists.linux.dev>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <pbonzini@redhat.com>, <seanjc@google.com>,
 <kvm@vger.kernel.org>, Vitaly Kuznetsov <vkuznets@redhat.com>, Kevin Tian
 <kevin.tian@intel.com>
Subject: Re: [PATCH v2] drm/bochs: use devm_ioremap_wc() to map framebuffer
Message-ID: <Zt/9rKpi5IT5jwl5@yzhao56-desk.sh.intel.com>
References: <20240909131643.28915-1-yan.y.zhao@intel.com>
 <75c8c1f0-d774-4bc1-ba71-bce15db921c7@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <75c8c1f0-d774-4bc1-ba71-bce15db921c7@suse.de>
X-ClientProxiedBy: SI2PR02CA0024.apcprd02.prod.outlook.com
 (2603:1096:4:195::18) To DS7PR11MB5966.namprd11.prod.outlook.com
 (2603:10b6:8:71::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB5966:EE_|CY8PR11MB7034:EE_
X-MS-Office365-Filtering-Correlation-Id: 4062b5e1-f3fc-4c14-0978-08dcd16f8ac6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YYrSD/NdY2MMTk+T46pXugdCxZFFNBZ9hKuFhLfyc8QCo5kw+6ZgR73ePqw6?=
 =?us-ascii?Q?qXDDHl28G7VP5KVKoLjjXKNT476H21rWLTtgbws8M3REbCpBNSnqDRMRSilC?=
 =?us-ascii?Q?YM4SEKUEqjCUfK5ooeGof3b4bzcyFfqar1+wYFiBJU2McqKVhJL6fuJQexbT?=
 =?us-ascii?Q?2L2Qk9gjhk1yekCzZSPB3dEx9mDX4h+GS+m8e9TjDaEgpRqdHrV2uuDoaAD1?=
 =?us-ascii?Q?qRkdiiX8/08mL7ggmHKVVPtoDY3Q24J0QnYmOY98zi6+Sm1xDNheq9ZYlDR3?=
 =?us-ascii?Q?tpYQgxzyN1XWlolm089HY8WbVwOxTlk5hC6H/AOH3gSVSOiJ7bKytzwS9OzT?=
 =?us-ascii?Q?q19i1ZvBtbs8tqueW4rlun9a/ST9+8tGwI6T+vl3Iu9HJJO+Dzq6MiBsrk9r?=
 =?us-ascii?Q?Ra/nGt6OA9wmnJWbR5ObNsubXLS7dMIOISwv4UI3oVS3PtzTrMPnPo9sePTO?=
 =?us-ascii?Q?lLFx3QzVfoZHEsYKzrfpbPSgYK2A4wp93ySHoQQNTj1OX5VZZgk326CaBnR0?=
 =?us-ascii?Q?FN/E31DRuCPN0xgEWnhaCGIE/b7sjlUA0I1qMPtMp4UWdpi5v6rKwbJ8pcf/?=
 =?us-ascii?Q?oAM7LeytL5oqqBoA8ce7wY7YlBlBbPMyYl3jaUx5CxycTszgmpjvMFBPGAq0?=
 =?us-ascii?Q?qYO/SN4Lt7f/RqRMESpRXm5q1gXUvN+JqZEDC4lBOHjFDXrb+/6h96DTtnQZ?=
 =?us-ascii?Q?neTxEK7t3GzLhFZcxeT5GQgcjRoeAGYrOnYX4mPJSzmQBu1CjRUU1RC00d14?=
 =?us-ascii?Q?WLyg/pYNnf/5cBPuV7sakYhsclWwZCEH33gzWAz/fcvgh+aao5yTIkwqVsYX?=
 =?us-ascii?Q?CMmewz5/2e07cFy3U2lf13HLg+L4apMkHzcyspP6pMrtIo+1Ym4DsVo4UD+r?=
 =?us-ascii?Q?e2Up+iJXa5F3G/p/JwKTXUejAWe889o95xqalIehrTsHRT9zFoLAfRLld9dU?=
 =?us-ascii?Q?B1NIjryR3ehBkdX5RjqLlBUU0VfWmmLVsumkd+2dE5UhQIEA0Mv75kqu0cL3?=
 =?us-ascii?Q?aKGd4BXvUwMhGdTu3ZVeTtcfFNMfhh/DNde+0RB2VMEDwV9VXLdBXdd3jI0J?=
 =?us-ascii?Q?nKhB2+RU5MAn8+vWc6i4IP2poy55PJZhNOpslyxXdL1/EKzcl07JQQ0KMpIM?=
 =?us-ascii?Q?axq57ps44eSEtTEJHKmssxTqVSqKj3TaQnNWxDP7ZcEWCpFPe4uPyJsW1QiU?=
 =?us-ascii?Q?hJaRsLWQb6URFjanrzKPkMPow75SPhriwEev0s6LHByucwU4ezfPpO9pveS/?=
 =?us-ascii?Q?I1v64qR7R+yNFN4doEgeuX5tvd3eiiIW+91KKKmrLgFczz6I44PIAnV0miSo?=
 =?us-ascii?Q?w0bJaL+wcGBYcrDhpUu2fn91dQVodA4i0qz7i4MIzX7eDg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB5966.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mZ7a2kMBb37Fd+UJZDHCeLBHjFzfMl0W6ahOsPKhVEM+pFwoPVk7LW23m+br?=
 =?us-ascii?Q?I6xq3Itdm5opsOdYlsOktd3D5PFZmwTwuJa3xwG4eqA5mbi5Ym3aG2IcfbFo?=
 =?us-ascii?Q?cYVFnUxYJkOZgkjb+CBq5zkgS5G1qrTvHzktBXrRufAnR49Vk4aturewPogU?=
 =?us-ascii?Q?OGQ2SxIYBPsILimZ86UeLrrebH7aMsmY+sM1O1+w4BiqKtvIs/OFfHjGj0jE?=
 =?us-ascii?Q?4Myfv9FKoAF0i87IDOhwZ6Cq6QmFa/vpnherrhPqwRJdtcFc8bqOudfoONUl?=
 =?us-ascii?Q?kGianvFm9dYtu8wF4CftGeichlXqjH7iU3SFJhEvC5av8bre3WNPiJSRHzSp?=
 =?us-ascii?Q?wmDMwVsxShGkX8FTXCB9gD8FUPf0+3Oe8B9DTgBxvjT+t/bD2DVqIegvVl5N?=
 =?us-ascii?Q?xMJNSWyBEEmfmm1v7bD7LWiCFSgZOCzC3BVCB0dQbC0ywp82bnXoDEQ3LBq8?=
 =?us-ascii?Q?YHlksV2wOtyPbt0cvSr7q3xUi6EuNFo+xn8oENKypT0OvkUgY+r76fCsyChe?=
 =?us-ascii?Q?kHT2nBWG8A9+/H3PzEmmukbTizy9idRvi9bbDUwnMmQnvKvpt7QJwQmgrlvv?=
 =?us-ascii?Q?RZ7toKvxTzWVmaQZPoSmezwFL07SZ05+4fZQrWZWsjZTU0UhXzVyqRTYjED9?=
 =?us-ascii?Q?uJpZAvkpl9sG+c2PCosR5BKaZPlGd3w1iegeRIS9lgjkUh7xLnneNLmGXRQG?=
 =?us-ascii?Q?TEbj/68Q25sL5EK9VqRQTPJSSFncQd4HBe/bBYJPhSFhLh3BhtHHu/ZMotak?=
 =?us-ascii?Q?/5sUgef7Dv/ygd+ur68pOmXcD5EWCXQMbpYR0Z6e8BVqHZ4GHV/uM24WLeTJ?=
 =?us-ascii?Q?+myZyHBZymF9SCiHb0KDF48nB8gSm1krIV8P9UP7s5VARX18zcBS6MdaO0P6?=
 =?us-ascii?Q?9HZvh7EBoMLPsc211I22jH1yX5zCC1UMcw2QMH4Btf5lffYO1FY6kIuFpjBl?=
 =?us-ascii?Q?qwaPNaT3BL+d3V7F/sVLbQakN20W6gNQa5kIhoyboJYsM9WF8m2QaDHmGLbt?=
 =?us-ascii?Q?sBx/ZPIpYpBfUziubWg4p0kqsPLcE1riQyxaf/FATjRyBOC4IgqGhmkj7QSZ?=
 =?us-ascii?Q?FsDaNpwQ5Cq+Tpz2AOjB3r0hj+bKNqUT1Fh+Uwj9S/FeMhw8BiffF+cUHnI1?=
 =?us-ascii?Q?BV17ZEl13lWSH2cqNamXMZw11NY/GMENbzuWGCeYEe7MrXKDFmAhTEb6k96W?=
 =?us-ascii?Q?6CDYLJQ9E2IWMkq/6caL3X8P5dtSYdw9wqucNP7kGBsYYfjCv0zaEN0D5nex?=
 =?us-ascii?Q?EQYMmNlINC2tVQLf65R91YL9c2hxaiTmE8Yu417wAc/2yPrVsAeHAFF4jJX0?=
 =?us-ascii?Q?r8/kT8zdKMzHeA/Wo5nUUoR8087aMLzMq2gLjU/rrnqr5s09kiUh2gjHJukr?=
 =?us-ascii?Q?DXZObd+YXuDuVJwwWOgUu9ALs/x4jSS/Lzkn4k28FgfFM5dMH9XYAFS43Vmo?=
 =?us-ascii?Q?db8ikwtX6BcZL4cKQb4jbP3RXbMYO5vpIJtw2g7BMj9cdH/71CSHcej9/bCg?=
 =?us-ascii?Q?pF/UqL34dtb5kSHYxgBTsssfmr155e/eA1tW3V7oqNNlnYk6R31u7y5t+XGV?=
 =?us-ascii?Q?D/BM7w87/3/rhkkPPbJrpnLUcxfTBw9TlYKCdb0h?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4062b5e1-f3fc-4c14-0978-08dcd16f8ac6
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB5966.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 08:06:58.0518 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n8jyqKFSNz26NETLAEZM7PSaoEPXRy57Z86oFAMkLtl+Dd2jOlgAeIGKwARb/Y0Yg4w/S0Yg4SFWXgQqp6q2ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7034
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
Reply-To: Yan Zhao <yan.y.zhao@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 10, 2024 at 09:24:22AM +0200, Thomas Zimmermann wrote:
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> Texted-by: Thomas Zimmermann <tzimmermann@suse.de>
Thank you!
I suppose this is "Tested-by", right?
