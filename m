Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DFF4B45D2F
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 17:56:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9099310E28D;
	Fri,  5 Sep 2025 15:56:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H00Qdhef";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 240A410EBFC;
 Fri,  5 Sep 2025 15:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757087792; x=1788623792;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 in-reply-to:mime-version;
 bh=R0cIVo03K9II5OI57bhGBltriXFNCDv4tURvKH93gFk=;
 b=H00QdhefTHcOU6CqMcyf9Cd/1bWo4cmOByPqWhmaAn5iBOsiVjsN0Soy
 FuaoChMCmTv0s6gl13Dq1ee3vqJX2ZTcPL9st91szy6jO0BBaYbKZB9Gc
 QfiMK3OUAP+qHR+yAKT3OLLJAt3gq4Nj/RCQE4/K1j1XGVJQee0TGbe9R
 e92gtOx8z4Q1rbGAi3gKJ/x+oYozEUXg9s7T+X/uJOnew6WITqQ95Rhcv
 XZKsZf0BnRa8O5MtcbbC1xz1GdBjC673V2x14bh78AkHYfnZm5O/DcHN+
 kJ1AqueQZugq0xS3Kd5x2PRTZ0spdZejDA4XBV/TuzsqJkxMDL46JeflD w==;
X-CSE-ConnectionGUID: wiSkz07+QaKMjmB/HVmIUw==
X-CSE-MsgGUID: 57q5Zj3vSKqjUXlkTux+gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11544"; a="59514923"
X-IronPort-AV: E=Sophos;i="6.18,241,1751266800"; d="scan'208";a="59514923"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 08:56:32 -0700
X-CSE-ConnectionGUID: oKKtGlI1RMSNsuBHqkRuvw==
X-CSE-MsgGUID: +IktRkt+Q5Sw/fGOgrXgyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,241,1751266800"; d="scan'208";a="176533171"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 08:56:32 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 5 Sep 2025 08:56:31 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 5 Sep 2025 08:56:31 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.76)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 5 Sep 2025 08:56:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rm/cLHj/7/3jtefm232Mmbgh2Gq8ianf6fA8qaT1NCLkHWz4cVpz83lz3pDnQBJhFrndB+xD8zfgNQ7C5A/X7B0AQAVz1fjnFVo6zL+c66skmf5KQybvxpkdoFUUrftO2j5vKyb5xz+2jU0y5DCkx6lYSLXLoH609YyjOkmGny9YwMAVsRB/sDzOX0r+3IVFGp0jBh8G7yxb5zoQU6Av317lqOwIjWTHyApXzsTHNKrUBsHKIvDA3uEw8y8imsGd6gHUJUALvSKkDrvzT9k0SXEXInhFc5ohy1AVbEzx0k/PZTHuF1O1O1LUSjYCzM50G2WCtnOSdmWmXs6nUaelwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fZBovdVwnQrf+pCot+EGMWQc5cjb+tHyQcz/lMp3hLA=;
 b=MenEYFS3nF2TJ1XGHvASqCn2DMZkZlp9VxFyOylW1iwPV/ZRlKiR8zB5BIG80LHzza+mJeZ2UIPUjO8FFymyrhibYKJm5zKHqC1A+nHvE7Ji2hHikF7Ucca6m5oOUDQkzyz1X+ZulrutWraVBCkvro0T+imvdX8QcMrricLZX8iuvwBXJYDpqgMnEfwRFcRhzkT5ibD0wKsPuWWRqk7+psli5VFlWcYQEyxuaqJi7Iq8b757SxPnAhuGlmWBlpI98w2a3GJL6rPnCHhYsIXRUwqWNpcTXqD3tjq0mZLo3j48d20VGNdPXG7jOaBI+9SWOvqTMDDDXMBMpY45/AmJ6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by SA0PR11MB4751.namprd11.prod.outlook.com (2603:10b6:806:73::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Fri, 5 Sep
 2025 15:56:28 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%3]) with mapi id 15.20.9073.026; Fri, 5 Sep 2025
 15:56:27 +0000
Date: Fri, 5 Sep 2025 18:56:22 +0300
From: Imre Deak <imre.deak@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: <stable@vger.kernel.org>, <patches@lists.linux.dev>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, "Sasha
 Levin" <sashal@kernel.org>
Subject: Re: [PATCH 6.16 139/142] Revert "drm/dp: Change AUX DPCD probe
 address from DPCD_REV to LANE0_1_STATUS"
Message-ID: <aLsIJnuSf_gYv7Zt@ideak-desk>
References: <20250902131948.154194162@linuxfoundation.org>
 <20250902131953.603872091@linuxfoundation.org>
 <aLoJG4Tq4nNwFLu6@ideak-desk>
 <2025090551-setup-crescent-a670@gregkh>
 <aLrpfoemc6jCFNVO@ideak-desk>
 <2025090530-germicide-protozoan-8d0b@gregkh>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <2025090530-germicide-protozoan-8d0b@gregkh>
X-ClientProxiedBy: DUZPR01CA0334.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b8::25) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|SA0PR11MB4751:EE_
X-MS-Office365-Filtering-Correlation-Id: 8db41e16-085a-4926-c26e-08ddec94c5de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|366016|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?anBBIYZ4Kxl4hjc1EgB4eqE6Z3X4Xxk0c9/T26+fZaZIZUpZWZTr5TxGkdr/?=
 =?us-ascii?Q?hQqkLhFSeOt1i8vYDCK/f/sR9od6Xf3D81Yr19lvI8qGQhsow+KVBKvyDBVQ?=
 =?us-ascii?Q?uGCYmOSaKR5R0MMrxKIcRheGg3Ga8c4b5aRpgfDk2ZJCVxk9AXI7vX1tHdDP?=
 =?us-ascii?Q?fUVQc0aBbf9pfnXuuILkOupQKMZUD6/EqQjyNy4GCaTEvO0/NUy94+RRL+tF?=
 =?us-ascii?Q?1v7xpZqDwahXaei3FZ99yuTAQIosxuyyhxWGQqusN8WNyvXXu+vN/SNgY/st?=
 =?us-ascii?Q?Fc6tcn80jOWRmc4Ohtp5EzI+ov4iJ7jTBfSgkJwwUGwk1zKtbgOSRRvZskds?=
 =?us-ascii?Q?7HTTp7/Y/xsl0EhRUl9JhqK8+I/A0B4Yd/LH78+r2GEw+1vNqhOr5SbJt03y?=
 =?us-ascii?Q?dG4BwAR2F4o1h2rcPsqdZc72lcnhUiYpuzaFn0+RkBJk3KUM2dtlzfPp/FiD?=
 =?us-ascii?Q?sLyVobe5mbOoD8/ZEAiaOeY93COQtZ/LX+kjMvfPiOqdY77caCeHT4Is6cXT?=
 =?us-ascii?Q?0VkuBqI2uQ35FGR5MAwX+xzfDV/Na+nNgCpn0w7Xmn0qv3iTxywsehhX2FIq?=
 =?us-ascii?Q?0pixvWl8yOKZ/M12BXXLBbCDRhmn6B7rtd4EOXi6/UQ7S7t9xfSkRpRJgy9W?=
 =?us-ascii?Q?FwSG7YqVWIeLXq6tl7OQtqWmvHycRcstv6RVpAu+pc1TnAw0PvvBL2Zl7MbA?=
 =?us-ascii?Q?NU2oN1Vxn4UGzQKWAfBvJ0H4Vqz+A4A9CoYxkzjHaYDQvGdtfNt4/Ecr28vi?=
 =?us-ascii?Q?IRpSrIMUalFMcB1EWPtJr98kK4Z4Xp2WMGDV9xpprGNDYLt6/Jlt92sBTeHo?=
 =?us-ascii?Q?o5cy3Lr4IBhJidOo/aM+uP16bu7Fe+1cT/9MSwGaK/TsrAeIGiSvd6MzfuKx?=
 =?us-ascii?Q?1xP7eGaSHJTMDQPyPwGI3AUnrrbAgbm89mCUhy5rGEjBMcxknkTVgEQ2jf0e?=
 =?us-ascii?Q?9OixjUonK8ZRsevO7Jv5gMlBOsq1EGW2en4G2J6WDh8Wxq7vvOgLFMVGyAvX?=
 =?us-ascii?Q?fQ0gcio9jr4QIHC2WCNoY125knMUKMCTFNv/+n6xPn7Wy+pvFHmTiLgjw07b?=
 =?us-ascii?Q?+dsCOfia1oQa341vDLkTD/3fresRX+9sf4YszYpfEufrigX814LFIh9L7cau?=
 =?us-ascii?Q?UU/ymOexMcSCoaoD3bbIQKuvhEJKLyUlO5mfQv2MUUZjvpdptfNJj2F3jRTn?=
 =?us-ascii?Q?4ZcM3N2hbzLzJB4f1yzcBdNJLFL2vhBS49DqK9A5dor1YQevjoyB7t5yQq4G?=
 =?us-ascii?Q?on0y7imRW1QNK3cie2nyU1Mi71MTkEhQvtY0MrZ5PXC73Y730Jaa0GYx5fkC?=
 =?us-ascii?Q?5+jR3rV5E98Eo/9BRb9UtOKRz28/fdHmQjVxR83EeDF0GdCwfNmA7XoWjJul?=
 =?us-ascii?Q?4ztoBLtQIm3dHxcyV15p0C1GBerhlpuIdCH+KqFdiDE1p34Kqjo72W25Tn8s?=
 =?us-ascii?Q?/RUUyWNZ/Dc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(10070799003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wKLTdmuQ/hMie/KT14I9vywRubbTVrDBywrMNPb5/+EvpPaNEeLR+DJ9mXjZ?=
 =?us-ascii?Q?Ae0NcSLxsoytumeAfuFA0PytGbgnWr3mlYBFhPngFfszWZYnv1Ag+QQfQmyl?=
 =?us-ascii?Q?L61pHrNryoUtygRjrG9YZB1cvH94TYd1FNq3fojC9tYSzi0OYeKGxMzwSHYz?=
 =?us-ascii?Q?c3YWJ6RA3hIqNx0yggXxEh8T/4+qN1i6hETysEQZnzXFE0he+usTp8u8wThN?=
 =?us-ascii?Q?+RMELl39Cr7pjATHPVigeJj99BUYtvgCjvrD01r6xT7gKrIn81qsazGrT3pe?=
 =?us-ascii?Q?3ifujf9K/KqO3JAww2Xo8B5ocCKFNAxj+lt4ioBWkIlKHWyfZswfG+3qKeXE?=
 =?us-ascii?Q?1flygjCEY9Lgji3TNhb2R+ukc4x+Hkbz6sgoBCL1sYoQd/c628jus4K8jh1n?=
 =?us-ascii?Q?BAnenZm1jLfS+GsNFSVVSnNOO5S+XyeicwNCCuGdZrgqT/CdXvCkOnLx3k5t?=
 =?us-ascii?Q?VC2R0vX+uNKCcMDMEbNXMDCqwBXdoKAZkfj+kUmdh962nsYV0CO9C8WUrgBi?=
 =?us-ascii?Q?oYDGGUtPacYoILZvg1piGLAOL5+3aal+IIWu5uPVOaAfV1R+GTM+EYc1WxCK?=
 =?us-ascii?Q?pVhqoeGHe3c5h4LLPob0QG5Y8NRYVptbOJXhBXT8ZbPIh0jpqYEbID8KX6pp?=
 =?us-ascii?Q?8MxfL+8RFWObZ9YsfCtRUACS1J5LPEwaaaZoHHvVuM4CmbWCBETM8JtbrkOT?=
 =?us-ascii?Q?k43rW4pgF00y4rrV2woUwYsH2z0eOxNcx5JIYjTsFNHZKI6bnfhYjkDvE5ab?=
 =?us-ascii?Q?qyk2ed8COXwbsZ5V3HHkhUEw/uEu/PwfvaEoZDVAynxEBtUsE5nKPyFZqa/u?=
 =?us-ascii?Q?+Z24jarRyxJzzf0hXOi+4FYgr36yuUv8zvUssJ9TQO8Graa7PSsorkH4YXOW?=
 =?us-ascii?Q?gQg4KqzmR/8CprF3FLn3Al7i8OLXGTRUp2/C2oJfgMQ+UxUwpzPzXLZgr4uP?=
 =?us-ascii?Q?IVdusRaavjz+Gq0wwir7WKNPa4Z/Tg3htAuBZxGNBA/KSY+DhrwBkZrycgru?=
 =?us-ascii?Q?zn3JPN4TX/rigXHqWRRdqLoqgbfAjUlz3qDxDJ4cpEl8Dyr/GzlS4vaI2hK5?=
 =?us-ascii?Q?RQuhK2+skaPIuhc96Bz4bvK/q4+Pi1+0QiVRP25bzUU60xhuUhZvuXbVUgwm?=
 =?us-ascii?Q?JKbJqnFWrMpCdZrbtLZgwV95q7Pz0znt1tBoEmHN5gCYXR406KdnOOOrgC+3?=
 =?us-ascii?Q?uoEw8NgffVb2FpiAvKA5WbXv/FEUc9IW1ECeBI5xz36MWyC52CRPjcBieIrm?=
 =?us-ascii?Q?JIi/ukVicNiFijXo5kSjr7RsxhjDT9pJY8o0KxdrmZMR0z2p0B1N6yTccnjD?=
 =?us-ascii?Q?dmGLeIHGCZs2LAb+mzHTIJxKQzeiAq53GTnKrebC41kzoqCwuLZw0CkFddCp?=
 =?us-ascii?Q?ERkMiZ1Zrunq+GJ+0wtdhIUnC408oxLX3axJDvYg99uAoc750N2imm/03gle?=
 =?us-ascii?Q?K9bv21qqA0ADipl2JloPWpGFmsK7Xx0XTnNDEV0YZemly5M+Ql648T3uMKXg?=
 =?us-ascii?Q?LPxmyyRgTZf6yCe4FT73JGnxG3wWIdD1FRutv6ZcIZntFwOdLPOlrEzXEmq2?=
 =?us-ascii?Q?171bhKAYz3fN+IFPab9TBhbAW8yI5v/egDZSxnW1ga3Y8C4gGoCApPMCNQaU?=
 =?us-ascii?Q?zymfu2DpQBYOh3p4yg8UC9aa+/b+/oIDyHDNvE1shMT8?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8db41e16-085a-4926-c26e-08ddec94c5de
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 15:56:27.9111 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yXd4BpLvPhp2aS2Qm0d2IebduSYtsXpbKSmr5ZErQWIpJvpIVJDqxENK0l9QPCid4un70z39XmgRtM1ey6VKzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4751
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

On Fri, Sep 05, 2025 at 04:55:50PM +0200, Greg Kroah-Hartman wrote:
> On Fri, Sep 05, 2025 at 04:45:34PM +0300, Imre Deak wrote:
> > On Fri, Sep 05, 2025 at 07:07:40AM +0200, Greg Kroah-Hartman wrote:
> > > On Fri, Sep 05, 2025 at 12:48:11AM +0300, Imre Deak wrote:
> > > > Hi Greg,
> > > > 
> > > > On Tue, Sep 02, 2025 at 03:20:41PM +0200, Greg Kroah-Hartman wrote:
> > > > > 6.16-stable review patch.  If anyone has any objections, please let me know.
> > > > 
> > > > Thanks for queuing this and the corresponding reverts for the other
> > > > stable trees. This one patch doesn't match what I sent, the address
> > > > should be changed to DP_TRAINING_PATTERN_SET not to DP_DPCD_REV, see
> > > > [1]. I still think that's the correct thing to do here conforming to the
> > > > DP Standard and matching what the upstream kernel does, also solving a
> > > > link training issue for a DP2.0 docking station.
> > > > 
> > > > The reverts queued for the other stable trees are correct, since for
> > > > now I do not want to change the behavior in those (i.e. those trees
> > > > should continue to use the DP_DPCD_REV register matching what's been the
> > > > case since the DPCD probing was introduced).
> > > 
> > > Ick, why were the values different for different branches? That feels
> > > wrong, and is why I missed that.
> > 
> > The requirement for changing the DPCD probe address was only
> > introduced/clarified by a recent DP Standard version (with the
> > introducation of LTTPR / UHBR link rates), so in the DRM code this got
> > changed only in v6.16.0. However, this change revealed a bug in the
> > firmwares of an eDP panel and Thunderbolt host, which also had to be
> > fixed/worked around. The only such remaining issue is the latter one
> > tracked at [1], which is now fixed by [2].
> > 
> > Based on all the above I still would like to keep the change only in the
> > v6.16 tree and not backport it to earlier stable trees, until having
> > more confidence that the change doesn't cause an issue for any sink
> > device.
> > 
> > > Can you just send a fix-up patch for the one I got wrong?
> > 
> > Ok, I can send a patch for v6.16.y on top of what is already queued
> > there.
> 
> It's already in a release :)

Ok, missed that. The fix would be only for the next release then, with
the above justification.

> thanks,
> 
> greg k-h
