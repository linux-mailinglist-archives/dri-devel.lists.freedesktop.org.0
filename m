Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8E9C11ED7
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 00:03:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AF6510E1A2;
	Mon, 27 Oct 2025 23:03:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H0mANO9/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C63610E13B;
 Mon, 27 Oct 2025 23:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761606190; x=1793142190;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=bIpResPJ/4kKRBL5OOZdCZmtAQ9Ckl4XaP1LTDLWqWA=;
 b=H0mANO9/ZB3Ip1Z7HbElGOrJFc8Vp0iCEYECV5wjt5tHoz7m93AdI3/O
 3kd129Wna0qp651zTk3KJOVeqANm1a6YbDvMs0WJnrVUOVT0xbMh8Nb4R
 8uOikKmuYkYmIZAshiXqwqZi3pHgy5mhUOIYVv8vNxkarUXOdM/ciIce2
 LazvyynGXHnA3VYE+tyU1CHcE8CnKendDmvoLRskLFMJG5kcSUvFt8qzz
 Kww7by6PzCdq1nxWeTaqO0p3Mg+E/JLSCIidXxLePVMi0CMt3UOxbVVXf
 yl3oerjC3g4fh/c0Uysg3nHqxrvRA/J8m1wnKVOXxhe6WTrw3KUb6sI2e w==;
X-CSE-ConnectionGUID: wRpkuICOTmqL3IJ0mLr6Aw==
X-CSE-MsgGUID: X3yx2qLRSWul4yvP1cI64A==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63849405"
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="63849405"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 16:03:10 -0700
X-CSE-ConnectionGUID: 7Hxn2n6JR2+7Rtk+LRJ1Lw==
X-CSE-MsgGUID: meJTm7jtSHmNVN5tfMf2dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="190305005"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 16:03:10 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 16:03:09 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 27 Oct 2025 16:03:09 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.12) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 16:03:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V2K5VOrFLRjGstUvdGt2zwO/a/YpILuUhziuVA7eq0vt63dhC4TSikh7h5gxQ4PZOs5fgyoeBl6qm7C1et97o2NwT8/9CtQiPfBBAvnYKbwZCDzlIhVD1FOi+sazBIlIoal6xKWVn5OcPguFf1SzQI/p1bstA/UU+eBxadrVbxQVbUrpYcQs7b/nUckU16Ib9rDnF1swit36f72A+4ibJ5lgVAWoXBG+VO8f9ywa2OCUMkfUay2Bf0Rdz8V4b6eQeMmXtCw2ADqTEb767Ka+h0Bjz/ASHgHFy1H/3+oJsXaSj0ucRNaDFyX55CpaA9Zpq6dnrE7GWoeQ9X+MqovLRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/fLXfWgXLEXgAWihdjfxvrHa/hVJgke3B5weCxNHCFk=;
 b=ScDFTAtVStNA/Mt8wZ+Q1FXAxWVX+m0hgF3RlzniSfA0WGVu8r56kafn4GvM9aSVL9cj3DEwlSH/GWqpH7uxmXJGe17Qita3F7EQj3mZRY3ZmQgu2Df6f/+cSXwY08BgriA3aXIw4C1UzGG/B6HW9mlpGgEBYHgaHLfYWvEA1z6GLddge5be4DQS0Xn1EIQO3FxihlWp7nYTK3BuCH6T6lAPUxq2pBa3qrxChbAXftAYcM2FM3HF0/a1KQKtwTrhA4Rj05L541yCzxY81vJW2r7zQQxuMWvBkMdwfFSOKHh6ApKMAUta8nphWE4dZBiWw0AFI4IofVHQax0RSaW2Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB5207.namprd11.prod.outlook.com (2603:10b6:510:32::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.15; Mon, 27 Oct
 2025 23:03:03 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 23:03:02 +0000
Date: Mon, 27 Oct 2025 16:02:59 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <himal.prasad.ghimiray@intel.com>, <apopple@nvidia.com>, <airlied@gmail.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>, <felix.kuehling@amd.com>, Christian
 =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, <dakr@kernel.org>,
 "Mrozek, Michal" <michal.mrozek@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>
Subject: Re: [PATCH 08/15] drm/xe: Use the drm_pagemap_util helper to get a
 svm pagemap owner
Message-ID: <aP/6I8o6tOTyQ/Qt@lstrano-desk.jf.intel.com>
References: <20251025120412.12262-1-thomas.hellstrom@linux.intel.com>
 <20251025120412.12262-9-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251025120412.12262-9-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: MW4PR04CA0345.namprd04.prod.outlook.com
 (2603:10b6:303:8a::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB5207:EE_
X-MS-Office365-Filtering-Correlation-Id: c66792de-cadb-4e66-86c6-08de15acfb3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?bRagRFUyQZzWnRmAJx24cdOwSHtzZ3F9/dCKR2mzFAhw03FV7ztjD2UwNH?=
 =?iso-8859-1?Q?q0gdDKVgVHb/2xRC8UofXxlnjehwrhWP/NSc7HInuG68lHHiyZrqWaFIHA?=
 =?iso-8859-1?Q?vujcNxpR85JrdvPCa0tGAdct1x1o1zIpaBTSBFl6aWwXmMyzuw/wSs9IAc?=
 =?iso-8859-1?Q?M+tT8Uw1j5WhHyr+l1xN5uFMtQ+LzaGI9LWWeUoSc/MqgsXi/4rW85kQd/?=
 =?iso-8859-1?Q?kmz6tEyDQI15BWnwrHqz+CswMiEMpLpuf3ZQjzjmTVTyjGNuc5H9X++FBA?=
 =?iso-8859-1?Q?9HgL39qkMU55OPOE4K7wpGMcXnn0e8j8cC5BzGQ/xiD8QbwFEuYmMeD1XL?=
 =?iso-8859-1?Q?JF7sWZDfvNr0bgtjzvgYw/0y0BGR0oUt+PAOLwLiQtKmr3gJxwKDCMq6jK?=
 =?iso-8859-1?Q?lUW3enqtRPQzFRtlGh3CmDzCC6pR0UMeCCm7AXeyLhdzVA+21FXvxY6oe9?=
 =?iso-8859-1?Q?uBgpTRyrCj1KuJsnq5T53cfYfOcOH/g49/4RZboXWcNDwDzYWI3rk389x6?=
 =?iso-8859-1?Q?0NhKdhWFhljAVioPHH4gsR1/tPZZO+HVdxXz3Y+tC0NZatBu13N4xRTtrT?=
 =?iso-8859-1?Q?dgvW2y6xva7LEkBDnyRUl3x0P3/Wzsil5VjXb/aazGySJNxzvNUgrurwlD?=
 =?iso-8859-1?Q?fQHoojeetj6kokDr57akZ1m2Y1Ml21n9FuBy6AI6UqVGAjVR0Co1wQcxN3?=
 =?iso-8859-1?Q?TLeYadb8ErOPwO5GkJRCtU6CdoAWnLv5X9J11eCMF3A2TJjC1SaFNWObi4?=
 =?iso-8859-1?Q?j7wt27uFhZqjMlw4bpcz0zV589Ca9ggN9Txr+Gxqvo9m7/X54r+bCTvSEw?=
 =?iso-8859-1?Q?WalKcR6A7UPARlaBCZD9oVbVGTCW0sthog2KVriXWmZWvvPmJWzxW5Pcvy?=
 =?iso-8859-1?Q?zFkvgZdTuDDclghHPaS1bkgkOT6M9GDqNS/phe6vMBiW3nsUNjSUa3AdPq?=
 =?iso-8859-1?Q?Gp7Qe1z6N3z61r9V7DhT8ImN+EKKS1lA6/0dJ4wlvMDloEC3VaA0LuKPHv?=
 =?iso-8859-1?Q?gLLsAEGc+mRF77t6k0z6/nNJO7zeWmqKwCSZDh5L8AlXigkn+4/9PEgh05?=
 =?iso-8859-1?Q?9KGv4zBz6cgARv5Zb57DEyD2UqBJPDKoZTznL5KnYBe3Y5xnqULzdd8APb?=
 =?iso-8859-1?Q?rZIZGXZo9BicEAt52zWXsQZrA46NF2CMd5tKAMye1AcikGa1zdlN3kAS5I?=
 =?iso-8859-1?Q?zb8+tI4IxCFgShXK5it9qxL9h32RqVSf+1SJRpQPdsfFxPGUREB4/CpIOS?=
 =?iso-8859-1?Q?pZbOEBq2DXFOi6YmHOKyOB8LbBckdlgnRnMykmWKnxrRDyWhxMMMEBCatp?=
 =?iso-8859-1?Q?1bi5/sSNu2ZqgBCUT5lpn7SWvUFuh2gnzexxJgd+ReOy9R0sA0Os+tzja1?=
 =?iso-8859-1?Q?G5JDj3o2CzI8uEcy2YveI/zX4IEnNSuUdg+/yukff+Y0BVBV1U0CRHHrOR?=
 =?iso-8859-1?Q?g1AqImmckG0zYFbMnZQ9zgeVDAjGSX/ZGNg+XGXYX9TdMiiKJS/jXMuz2G?=
 =?iso-8859-1?Q?F/VeH+5ds3W1umTgxCnPhj?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?/+XcI6docJ6HQXMh0GJ0O9HLMyMFvqZDiE5ywnZmoSXcrsFW3Gj5aKTOX8?=
 =?iso-8859-1?Q?8nAFX5+pJ4ZFtfWp5d7fob3hOkC8CzKi9TUFcMvvnq0YniCuDBFNFouO5Y?=
 =?iso-8859-1?Q?gosvhB0PlurYMadhTuwFegYyZswisksaPxmyju0zSWFWXgUhAErW2mH5bi?=
 =?iso-8859-1?Q?Bp8SGl5Ub2R82Dy2NamMozNMON2rBFfcEw9i/oemrK/5F5QctJRna7kttC?=
 =?iso-8859-1?Q?CfsWDvcHfO0IujhzM4VUhFETtn0vOneq2YQ3DB7EljQyMPWYdlIGBAxKZ5?=
 =?iso-8859-1?Q?9uigIJNbe536Bc29J5GZtzHi1wOKSwJQ+66cynVBi+sRfCj3l9iX7ahScB?=
 =?iso-8859-1?Q?SNxSCP8gDB7QdMAJLxVMVyfYBMgMldFocBizSWck+SSXRkk1mpib+YCAf3?=
 =?iso-8859-1?Q?PtwxZrO226mMKTCfawn/1vBUI1WBNIGLspS1GsgBj+FkwKO4fKMwdsR0FU?=
 =?iso-8859-1?Q?LRJQmFm66TAuH9kDFla5VL18aYpnWJXWIdE44yo/sLYaoqIPMgIGxkbhej?=
 =?iso-8859-1?Q?TyaxBleYONaPv9MREsIoit5dx2HrQRCnpu3B6pOqowy0w99QYeUefq0kU5?=
 =?iso-8859-1?Q?diSLpz6GZa9BpOIJvZ4VlqUwIfrkpEan7AXBjc+4wKOiTOlh19d1qLidZ/?=
 =?iso-8859-1?Q?Urb5fTm/gsVmK/LSXvtqkgfZjqSpxX0tVnFDVg9rw8bdo10xw2n+WECZWL?=
 =?iso-8859-1?Q?hrHJGUyW/DOQsb5+s0LYF/wHxQ/W2ZPzYbLt7sWMcWukHbaM26sz0He9Ys?=
 =?iso-8859-1?Q?6r4ytLEYCC0FnoeRuIhlmotEbosyWMzEdS5xCglwW0M4KJzAqLJnl2X/Sb?=
 =?iso-8859-1?Q?6VmMQBM5WlwUVIQHcdPjMP4ga0czJM0PdMq4Mc/R78Jqt6Mkm5Igxly/o5?=
 =?iso-8859-1?Q?o3cv+cqU5negISg5shqBOcXNCmpeWW1XugwAd1O3Wy1UDdchI6V3TkE6z0?=
 =?iso-8859-1?Q?EmTszu9A4dFAx70mK9YBBPehVcTBw3xty7VL2V34FXC1dAXITqKl3GxkOr?=
 =?iso-8859-1?Q?ymVrVxESeXp7krVfI/oditCRYyIwanAnhgMXDUbj/6XxUafYjHiMlpXTMD?=
 =?iso-8859-1?Q?cdS/wpo/cz5K24T2/TWm8PAKgH431wyFy2Sw+jgftEAo0Dlxg2ot5+yTC1?=
 =?iso-8859-1?Q?e76olGYeLV3ebWOX6drjMnoL+HQB6J3ltFl5xu2l8VJuHPlj1/T0q3rKZq?=
 =?iso-8859-1?Q?NrJw7kDs3rq1dzfAxTcUfXBN2Kx95fDgfiRtShogeTP4BxreTdBnFBibPm?=
 =?iso-8859-1?Q?3GO9oFjkABZVRrPzDnCdujI4vtZPuunlctO89I47fzp4asH87aV/N05Ed5?=
 =?iso-8859-1?Q?6mf3yanuGdbfiHZpGMmT/bXxUq7QCpa/Oi9wsTfQQtCZUT30rCLgdqzLOt?=
 =?iso-8859-1?Q?F39gxHAwgvdzVzWrF8IaXsA+nvE3+dqXCLGj2PUzn0HZ5z3LoXzljraI/s?=
 =?iso-8859-1?Q?hfMjCXROI7LltsZAW8JfamVX3dJaDuUn1B9eSnYmOykpZbvQRj9y8ASGOH?=
 =?iso-8859-1?Q?5z1GOjIN/quP8wVtyOKW9SMcg1mOzazNMT4Vo6UK9zu9dO5qaLV9iHby1s?=
 =?iso-8859-1?Q?avXjKc5MWMhVUc8u6m8m1AtyuQnkJWRA9LDsbsJ7a08vLbqyFOkGs2pX6v?=
 =?iso-8859-1?Q?+iaIcW6u2ZvsR/f/LBdttVjOvJRuxUeEA7t3OQmJekn6kRtLcP6JG9iA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c66792de-cadb-4e66-86c6-08de15acfb3b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 23:03:02.8736 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8ObWlvbYrFogP+NNOOT1eXq9kmxeQEPU3SYlSZNRa7WP1xlcZKhgcgq8u8hmRjMaJIodU0SWN0rV1ROFpUrxnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5207
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

On Sat, Oct 25, 2025 at 02:04:05PM +0200, Thomas Hellström wrote:
> Register a driver-wide owner list, provide a callback to identify
> fast interconnects and use the drm_pagemap_util helper to allocate
> or reuse a suitable owner struct. For now we consider pagemaps on
> different tiles on the same device as having fast interconnect and
> thus the same owner.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_svm.c      | 57 ++++++++++++++++++++++++++++----
>  drivers/gpu/drm/xe/xe_svm.h      | 24 ++++++--------
>  drivers/gpu/drm/xe/xe_userptr.c  |  2 +-
>  drivers/gpu/drm/xe/xe_vm.c       |  2 +-
>  drivers/gpu/drm/xe/xe_vm_types.h |  3 ++
>  5 files changed, 66 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 8aced064c83f..d27e366f8e14 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -22,8 +22,17 @@
>  #include "xe_vm_types.h"
>  #include "xe_vram_types.h"
>  
> +/* Identifies subclasses of struct drm_pagemap_peer */
> +#define XE_PEER_PAGEMAP ((void *)0ul)
> +#define XE_PEER_VM ((void *)1ul)
> +
>  static int xe_svm_get_pagemaps(struct xe_vm *vm);
>  
> +void *xe_svm_private_page_owner(struct xe_vm *vm, bool force_smem)
> +{
> +	return force_smem ? NULL : vm->svm.peer.owner;
> +}
> +
>  static bool xe_svm_range_in_vram(struct xe_svm_range *range)
>  {
>  	/*
> @@ -770,6 +779,25 @@ static void xe_svm_put_pagemaps(struct xe_vm *vm)
>  	}
>  }
>  
> +static struct device *xe_peer_to_dev(struct drm_pagemap_peer *peer)
> +{
> +	if (peer->private == XE_PEER_PAGEMAP)
> +		return container_of(peer, struct xe_pagemap, peer)->dpagemap.drm->dev;
> +
> +	return container_of(peer, struct xe_vm, svm.peer)->xe->drm.dev;
> +}
> +
> +static bool xe_has_interconnect(struct drm_pagemap_peer *peer1,
> +				struct drm_pagemap_peer *peer2)
> +{
> +	struct device *dev1 = xe_peer_to_dev(peer1);
> +	struct device *dev2 = xe_peer_to_dev(peer2);
> +
> +	return dev1 == dev2;
> +}
> +
> +static DRM_PAGEMAP_OWNER_LIST_DEFINE(xe_owner_list);
> +
>  /**
>   * xe_svm_init() - SVM initialize
>   * @vm: The VM.
> @@ -788,10 +816,18 @@ int xe_svm_init(struct xe_vm *vm)
>  		INIT_WORK(&vm->svm.garbage_collector.work,
>  			  xe_svm_garbage_collector_work_func);
>  
> -		err = xe_svm_get_pagemaps(vm);
> +		vm->svm.peer.private = XE_PEER_VM;
> +		err = drm_pagemap_acquire_owner(&vm->svm.peer, &xe_owner_list,
> +						xe_has_interconnect);
>  		if (err)
>  			return err;
>  
> +		err = xe_svm_get_pagemaps(vm);
> +		if (err) {
> +			drm_pagemap_release_owner(&vm->svm.peer);
> +			return err;
> +		}
> +
>  		err = drm_gpusvm_init(&vm->svm.gpusvm, "Xe SVM", &vm->xe->drm,
>  				      current->mm, 0, vm->size,
>  				      xe_modparam.svm_notifier_size * SZ_1M,
> @@ -801,6 +837,7 @@ int xe_svm_init(struct xe_vm *vm)
>  
>  		if (err) {
>  			xe_svm_put_pagemaps(vm);
> +			drm_pagemap_release_owner(&vm->svm.peer);
>  			return err;
>  		}
>  	} else {
> @@ -823,6 +860,7 @@ void xe_svm_close(struct xe_vm *vm)
>  	xe_assert(vm->xe, xe_vm_is_closed(vm));
>  	flush_work(&vm->svm.garbage_collector.work);
>  	xe_svm_put_pagemaps(vm);
> +	drm_pagemap_release_owner(&vm->svm.peer);
>  }
>  
>  /**
> @@ -957,7 +995,7 @@ static int xe_drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
>  		xe_pm_runtime_get_noresume(xe);
>  		err = drm_pagemap_migrate_to_devmem(&bo->devmem_allocation, mm,
>  						    start, end, timeslice_ms,
> -						    xe_svm_devm_owner(xe));
> +						    xpagemap->pagemap.owner);
>  		if (err)
>  			xe_svm_devmem_release(&bo->devmem_allocation);
>  		xe_bo_unlock(bo);
> @@ -1072,7 +1110,6 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>  		.devmem_only = need_vram && devmem_possible,
>  		.timeslice_ms = need_vram && devmem_possible ?
>  			vm->xe->atomic_svm_timeslice_ms : 0,
> -		.device_private_page_owner = xe_svm_devm_owner(vm->xe),
>  	};
>  	struct xe_validation_ctx vctx;
>  	struct drm_exec exec;
> @@ -1096,8 +1133,8 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>  		return err;
>  
>  	dpagemap = xe_vma_resolve_pagemap(vma, tile);
> -	if (!dpagemap && !ctx.devmem_only)
> -		ctx.device_private_page_owner = NULL;
> +	ctx.device_private_page_owner =
> +		xe_svm_private_page_owner(vm, !dpagemap && !ctx.devmem_only);
>  	range = xe_svm_range_find_or_insert(vm, fault_addr, vma, &ctx);
>  
>  	if (IS_ERR(range))
> @@ -1521,6 +1558,8 @@ static void xe_pagemap_destroy_work(struct work_struct *work)
>  					pagemap->range.end - pagemap->range.start + 1);
>  		drm_dev_exit(idx);
>  	}
> +
> +	drm_pagemap_release_owner(&xpagemap->peer);
>  	kfree(xpagemap);
>  }
>  
> @@ -1571,6 +1610,7 @@ static struct xe_pagemap *xe_pagemap_create(struct xe_device *xe, struct xe_vram
>  	dpagemap = &xpagemap->dpagemap;
>  	INIT_WORK(&xpagemap->destroy_work, xe_pagemap_destroy_work);
>  	xpagemap->vr = vr;
> +	xpagemap->peer.private = XE_PEER_PAGEMAP;
>  
>  	err = drm_pagemap_init(dpagemap, pagemap, &xe->drm, &xe_drm_pagemap_ops);
>  	if (err)
> @@ -1583,11 +1623,16 @@ static struct xe_pagemap *xe_pagemap_create(struct xe_device *xe, struct xe_vram
>  		goto out_err;
>  	}
>  
> +	err = drm_pagemap_acquire_owner(&xpagemap->peer, &xe_owner_list,
> +					xe_has_interconnect);
> +	if (err)
> +		goto out_err;

Not a complete review, but noticed this one when looking at the code
with the entire series applied - the error path here doesn't call
devm_release_mem_region whereas if devm_memremap_pages fails, that gets
called. Looks suspicious.

Also if devm_memremap_pages fails, should drm_pagemap_release_owner be
called? I haven't looked enough at series to know, so just asking for
now.

Matt

> +
>  	pagemap->type = MEMORY_DEVICE_PRIVATE;
>  	pagemap->range.start = res->start;
>  	pagemap->range.end = res->end;
>  	pagemap->nr_range = 1;
> -	pagemap->owner = xe_svm_devm_owner(xe);
> +	pagemap->owner = xpagemap->peer.owner;
>  	pagemap->ops = drm_pagemap_pagemap_ops_get();
>  	addr = devm_memremap_pages(dev, pagemap);
>  	if (IS_ERR(addr)) {
> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> index 8a49ff17ef0c..5adce108f7eb 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -6,24 +6,11 @@
>  #ifndef _XE_SVM_H_
>  #define _XE_SVM_H_
>  
> -struct xe_device;
> -
> -/**
> - * xe_svm_devm_owner() - Return the owner of device private memory
> - * @xe: The xe device.
> - *
> - * Return: The owner of this device's device private memory to use in
> - * hmm_range_fault()-
> - */
> -static inline void *xe_svm_devm_owner(struct xe_device *xe)
> -{
> -	return xe;
> -}
> -
>  #if IS_ENABLED(CONFIG_DRM_XE_GPUSVM)
>  
>  #include <drm/drm_pagemap.h>
>  #include <drm/drm_gpusvm.h>
> +#include <drm/drm_pagemap_util.h>
>  
>  #define XE_INTERCONNECT_VRAM DRM_INTERCONNECT_DRIVER
>  
> @@ -65,6 +52,7 @@ struct xe_svm_range {
>   * @pagemap: The struct dev_pagemap providing the struct pages.
>   * @dpagemap: The drm_pagemap managing allocation and migration.
>   * @destroy_work: Handles asnynchronous destruction and caching.
> + * @peer: Used for pagemap owner computation.
>   * @hpa_base: The host physical address base for the managemd memory.
>   * @vr: Backpointer to the xe_vram region.
>   */
> @@ -72,6 +60,7 @@ struct xe_pagemap {
>  	struct dev_pagemap pagemap;
>  	struct drm_pagemap dpagemap;
>  	struct work_struct destroy_work;
> +	struct drm_pagemap_peer peer;
>  	resource_size_t hpa_base;
>  	struct xe_vram_region *vr;
>  };
> @@ -131,6 +120,8 @@ u8 xe_svm_ranges_zap_ptes_in_range(struct xe_vm *vm, u64 start, u64 end);
>  
>  struct drm_pagemap *xe_vma_resolve_pagemap(struct xe_vma *vma, struct xe_tile *tile);
>  
> +void *xe_svm_private_page_owner(struct xe_vm *vm, bool force_smem);
> +
>  /**
>   * xe_svm_range_has_dma_mapping() - SVM range has DMA mapping
>   * @range: SVM range
> @@ -368,6 +359,11 @@ struct drm_pagemap *xe_vma_resolve_pagemap(struct xe_vma *vma, struct xe_tile *t
>  	return NULL;
>  }
>  
> +static inline void *xe_svm_private_page_owner(struct xe_vm *vm, bool force_smem)
> +{
> +	return NULL;
> +}
> +
>  static inline void xe_svm_flush(struct xe_vm *vm)
>  {
>  }
> diff --git a/drivers/gpu/drm/xe/xe_userptr.c b/drivers/gpu/drm/xe/xe_userptr.c
> index 0d9130b1958a..e120323c43bc 100644
> --- a/drivers/gpu/drm/xe/xe_userptr.c
> +++ b/drivers/gpu/drm/xe/xe_userptr.c
> @@ -55,7 +55,7 @@ int xe_vma_userptr_pin_pages(struct xe_userptr_vma *uvma)
>  	struct xe_device *xe = vm->xe;
>  	struct drm_gpusvm_ctx ctx = {
>  		.read_only = xe_vma_read_only(vma),
> -		.device_private_page_owner = xe_svm_devm_owner(xe),
> +		.device_private_page_owner = xe_svm_private_page_owner(vm, false),
>  		.allow_mixed = true,
>  	};
>  
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 10d77666a425..1dffcd9ab61b 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2886,7 +2886,7 @@ static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op *op)
>  	ctx.read_only = xe_vma_read_only(vma);
>  	ctx.devmem_possible = devmem_possible;
>  	ctx.check_pages_threshold = devmem_possible ? SZ_64K : 0;
> -	ctx.device_private_page_owner = xe_svm_devm_owner(vm->xe);
> +	ctx.device_private_page_owner = xe_svm_private_page_owner(vm, !tile);
>  
>  	/* TODO: Threading the migration */
>  	xa_for_each(&op->prefetch_range.range, i, svm_range) {
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index 9f0d8bf1af4f..4f9a6cdb5d02 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -8,6 +8,7 @@
>  
>  #include <drm/drm_gpusvm.h>
>  #include <drm/drm_gpuvm.h>
> +#include <drm/drm_pagemap_util.h>
>  
>  #include <linux/dma-resv.h>
>  #include <linux/kref.h>
> @@ -192,6 +193,8 @@ struct xe_vm {
>  			struct work_struct work;
>  		} garbage_collector;
>  		struct xe_pagemap *pagemaps[XE_MAX_TILES_PER_DEVICE];
> +		/** @svm.peer: Used for pagemap connectivity computations. */
> +		struct drm_pagemap_peer peer;
>  	} svm;
>  
>  	struct xe_device *xe;
> -- 
> 2.51.0
> 
