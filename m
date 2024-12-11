Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C21029ED6CD
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 20:51:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0F6A10EC0A;
	Wed, 11 Dec 2024 19:51:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VPL9suFI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 488CC10E62B;
 Wed, 11 Dec 2024 19:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733946679; x=1765482679;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=a3RmQdeVAVagyC9t6RAGkSrUXr4iKtw3ATqdbFtGVW0=;
 b=VPL9suFI6NigQPEoG8gbzV7nvpMyw6NK73lcIoS/5en+FvR88Ah0vkVF
 2rTmfZ0CIHRs5QRN+ZcURBYgxvQn28E2eVKPEEZmw1qvySy5OmBp9D/zg
 zGIXYYi0pROo5IvLt2DxNthWqtpkzs6iRRSM+Wgu5K2cqlAYVVTmlr/qK
 P9YtCPEFpgNG4m3nfhoLIHMiLpnPu5suNVRNQR06CAAyu1/8INjDBzUOg
 NaboqrtLdIBYz7FJDkojJfWChSvNEGlVt2JzVsG9P05TWc+PpMx6VbmGC
 +lQeMKfs8l5Dm3wf6shD5Rd6hJFKFepr+roH2R9QW9K9n23oFgWUPW3uE Q==;
X-CSE-ConnectionGUID: 3D655+d3Q32gpjFBl4WzdQ==
X-CSE-MsgGUID: oW4E4UTBTOyrLf3a4DPj6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="45353657"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="45353657"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 11:51:18 -0800
X-CSE-ConnectionGUID: bHfRJ52YTmOuVRD3VjkKYQ==
X-CSE-MsgGUID: 91ZgKsoSQWy8sZ9DXFtX1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="100873986"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2024 11:51:12 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Dec 2024 11:51:11 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 11 Dec 2024 11:51:11 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Dec 2024 11:51:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BcEjpvJHh6sVQwisD2ABDRV3ZaF1uyW0VcKXN0LeiasuOTFKwAP5NxRnggwMxdsLqJ0yrVGJmJoUQKM2AmMTROn/fBBUiA5SJmXgUwWMf0ocllkJpVKJ/fprxLjk54loX48sr9vyB1nELmhDb1F3D0t+A2IXJV0Eocv4VVc2IPVpkKs5ppXbRxWKSiyhLy2HdonTtPNzda3QPK5KuTRc5QuLA3XoUmP0qFRYkweD+X/IVJ4uNkK+SIp5nEPfD5yn0yR2x02Vxcgy3sWuScwn1F9jIXDZ/zfawNr7HCMWKfnUUxRAsrPV2/DNFGHoz595j9c2lFRNXc/yW37kQyFiUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oEsjzkVIffXGTaGMe2REwuj1GekmqgGV96vxbvaPcE8=;
 b=PQJJkVzzZWYrjd8Iwem5d/36pas39PONqAIXLtT0QEFbygV80dRw0Uq2aUYn7PbEUuKNFdhCqQF2XwVjJsnYQPVqaDd62eMfu7jTvmFBc7TjV1MJAOYK3zB8xADs4EQ6ibqpFdIDcS/1QLjbGgnp60NHCvfyq04nZToDnk5RNrG+imRiZx9lXwDdPfA9O7YneppH7IP3Zhj/dSWNMeVTiR1sIjqFnT0hFS0ZJ5mQ1iE/T3ixaUSLR5zmRbJwZLy7NG9WY1JDnD5xnNhNYTQdmBxx38V8SpiCBZJh5cy2sPBcyppRlGLL2zYXRvXFG2xlqwLrSowsPk4aqgoxm3XP9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA2PR11MB5004.namprd11.prod.outlook.com (2603:10b6:806:112::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Wed, 11 Dec
 2024 19:50:41 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8230.016; Wed, 11 Dec 2024
 19:50:41 +0000
Date: Wed, 11 Dec 2024 11:51:23 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <apopple@nvidia.com>, <airlied@gmail.com>, <christian.koenig@amd.com>,
 <simona.vetter@ffwll.ch>, <felix.kuehling@amd.com>, <dakr@kernel.org>
Subject: Re: [PATCH v2 28/29] drm/xe: Add always_migrate_to_vram modparam
Message-ID: <Z1ntO3HqTqErkpgF@lstrano-desk.jf.intel.com>
References: <20241016032518.539495-1-matthew.brost@intel.com>
 <20241016032518.539495-29-matthew.brost@intel.com>
 <e7734771f599c44b30f9883dab4089c1d7081e75.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e7734771f599c44b30f9883dab4089c1d7081e75.camel@linux.intel.com>
X-ClientProxiedBy: SJ0PR13CA0069.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::14) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA2PR11MB5004:EE_
X-MS-Office365-Filtering-Correlation-Id: 193d734a-8bf9-430d-5cfa-08dd1a1d17d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?Y5soIL4UNWt+QctzxPzka2HNMHM72x8wwtF2nOBRZLI4zXWTLufGIGpY0N?=
 =?iso-8859-1?Q?LVF2y7H3zOT2aiYsSNXhuOFuap6mb8Bg3e2J3MvMSoeWULF831hffqh8kf?=
 =?iso-8859-1?Q?dwcNUBkLWa85h6mBGDXfaV2dKBxWDDJDaRHklMKEcZDZHvYQxY0lLC3439?=
 =?iso-8859-1?Q?F5jFX5oc+duLXhBH+MUPQd66/gSEFn/JKthWzUTHYnhAM2ouWDl9ogRTyH?=
 =?iso-8859-1?Q?EHOY26CwvPq1WKwJ0p1ZqgYnsg1T6B22ceLoRIusRWFzGrjYVxUofO7In+?=
 =?iso-8859-1?Q?Ko6C0J+BRHs4pASVkhKCM2/SalvTcfmHY2IbrYWLa4x798yo7A/R7aiLyq?=
 =?iso-8859-1?Q?0EZ24nAxi+pFiotwBdNy2pgZHN/jHdN1Rf3PFj0IPxzE5lw+/KRLvIWXF7?=
 =?iso-8859-1?Q?jsllVASCiC8/Z6laWIi/qJzEUylYTU/o/CrOQhkGTRiUfxUmbm6vEPjllL?=
 =?iso-8859-1?Q?/qdrMag94NyTto49bPCqlMkpQ4kQSQetjt+qpTdiPNLC0qwHbO7UX/vPk4?=
 =?iso-8859-1?Q?JvL3cRQhsp9cLhxnK4JjMyrse9M9uTD2n66RCNIsMOhSQ7Pmdjo1wyXYY0?=
 =?iso-8859-1?Q?fLobV6yr6fCKhYNQ+TQeRj4y+QLjcY+13fz8ZrY47e1Wges6qIGuM8kcnD?=
 =?iso-8859-1?Q?nE9moxDE6OW9xfgSU5jaLf87W+KPr7bEQ52cWjoN3ttO2fUSaWgeyRYfaG?=
 =?iso-8859-1?Q?6exQTsAdGfnarX1Rm6aG9WnABOKWpTgCVp/oyCz3hFH8ntLPzHXeChmvSQ?=
 =?iso-8859-1?Q?GD+qZpxO64lUgNq47fFgb63fCVURZNXoAqxo69nh/GRO8t1GptP9VRFQNK?=
 =?iso-8859-1?Q?7A/l7onL3Dx0OywKtF/jOMwxrAFtu83NEzK0PXSt/Ffj2fxTPpVbS+n6v6?=
 =?iso-8859-1?Q?zka21hydAQ6iuXHTtLlbtbjKb/Y94VIeCMK2NxgOq8JV7EBZtmHmjVvpck?=
 =?iso-8859-1?Q?VHp+epC+uJfZWT0UBoEwwaHoxnjlBdmhWF3LeTF55sKgZYgvWOIVIIY4my?=
 =?iso-8859-1?Q?FmHEYspinoBu90jSCzh4SVlZHS6QUacACAXJp/xsZvxzGRqjNea7QtfNYa?=
 =?iso-8859-1?Q?pnfNCwdRF8hxpJEHx/M7DVyNaqVd02EkBB7jRty5rno2WUawyTJtZDTGR+?=
 =?iso-8859-1?Q?skI1NtdoMUmbEc1ax0cxEC/61hvTT5etecnO9V8h0+6sjOfPDoy4YqNL4a?=
 =?iso-8859-1?Q?bCADaQUk15ORdLaTIGqOiG23EJAR98l3F8a+pJQTr2JapfKFRwmLywaN5i?=
 =?iso-8859-1?Q?gqj96seWgEEDEOp1Fv+9TAD9ub5FugGP3/xgD78LnCIfujyIkZE1RxSr3y?=
 =?iso-8859-1?Q?Wp0me/te8eyJ3PpaPUPJngiiaJ5jB72sK0QfLfyIPV66cYWOgzqNAxwsWY?=
 =?iso-8859-1?Q?uKt1clrh5sDFDMl2xd59CDmzVyc9VMTQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?JKzsA9ips3Nv+zyuoQed4R5WZeShZtCoXfOZSpC9JLf38AYin8pb7EaHkA?=
 =?iso-8859-1?Q?gVXKiKDaq0FMGqPSBY9kMRne62o9BrdZYprI758lbY8WNzqePZxGnyWkSF?=
 =?iso-8859-1?Q?xipTnee4g6CsHmnSL7cVNESWcnz0jFi+g9y9Uqrw6WYQ8SMgY6AkUH+gUm?=
 =?iso-8859-1?Q?fxg1XUKquFK4ZCltqjSYWznwiGmcK+Rza48oyng8qNWqcIV3gdpfuGwvyU?=
 =?iso-8859-1?Q?dEbW1IRZ/g/oE2vAwPiA6wZtonQWv6QEbrMrFjx3L/S4jgsyPATzcVYkkT?=
 =?iso-8859-1?Q?9S1WGPavYhPLYp8DoKloMW8rYF3QgfiUI+ySTR9LsENxrSHxt2nAxyBmbP?=
 =?iso-8859-1?Q?cC8TZMBrjP/5SUxl1rNdbkQgBIAWnkjY5clh4R+karnhUWB7TvDAuVDg1h?=
 =?iso-8859-1?Q?Yd1f8M/75flgQgjVbjhIDf2tFtm31+Czl3ThMFo2L+qUQFxQ6mIuIpkblX?=
 =?iso-8859-1?Q?aFFH5NEneel1EnjYDw/1er0M+NaRYcIQXUacYgtTD3uqWtzmct6fjoh12H?=
 =?iso-8859-1?Q?fcvgWt02bAcIjl2qJTnyn4ShS4rMpyewEZcoyVf5zsPdqTmpTHEOo3ydU7?=
 =?iso-8859-1?Q?neaPoW2w0+GHrteAh9YuWraZlQmwKtEukJjnL51Bs8qkUCI3SUdj0VmbHt?=
 =?iso-8859-1?Q?7egzf+LE8srqZNbenOrTURxZF7qE6MjMbkFmNSAVcwj3JfWaiCb04UBFsr?=
 =?iso-8859-1?Q?4KwXnwSD1e6MFWUnYYG80YV2/zXvaCcodVc16yN9X+1TrAYDm8yz+2mnRs?=
 =?iso-8859-1?Q?Zlh/vicemhZKM14R2hr4wmYETcUIXmmc0fJHU875kRlREo0P3tDmkKWi8P?=
 =?iso-8859-1?Q?DnKE3+dSsD8bL/vXw3I4LAobafRIBXMzzE/iSgGSyRYv1zhVSRvK1ViHiz?=
 =?iso-8859-1?Q?jeyJX8q+EJ0sqGqnoBqh7Tc247r1IBMC1xOouyV7XDUHVTY4YwQozXGWst?=
 =?iso-8859-1?Q?S2d3TtJpmIpW39KvnYsXYFbGsa3ED6rkrVQQpBoBoNqv2BKyQVesMYxpDb?=
 =?iso-8859-1?Q?1un/xYJcUDhs4ecGwLCYXUukcQNd0Y+WIiTvNdd/EAqRkBgofYHPpYasg8?=
 =?iso-8859-1?Q?VsS8h+qCYtZAEEGlv3+SFYu+xa+X8HyOBLK7yEekBb2FFVmLq5oUz6oQI2?=
 =?iso-8859-1?Q?bx4cQDnxBegGIapS9W9WSdMBpS8ioljd4c0BoL7HdVUS0yqIHRiecN9Zrd?=
 =?iso-8859-1?Q?X4zUmDpj6R5I7RVbGHimqB59ds1siqEJEsBM1zY4lJ5UxMn/tdOgJWlpke?=
 =?iso-8859-1?Q?lSGKFn3nLGpV8Bw869K+IA3gkfLoL22/eDh/UcItV5jD63tUrsexScJxQW?=
 =?iso-8859-1?Q?k2DdE1OAtNbHaay1snnGz4f2WV5pcXj445gtEBpXEu/VfZkiiziAe+WsxA?=
 =?iso-8859-1?Q?PF4plBG0A3RzIehlnUxOeE7j5Eybk8QQWtR6Wjy8gK7w8MJtuyD/ZtQGJz?=
 =?iso-8859-1?Q?Ilc3N7EzgfsSihDLZQYdsDzDfwbPg54tS/RepOniI1I7CPHSrgWP0oGuQ+?=
 =?iso-8859-1?Q?F4xznLy0w8dVJ3e9UbDKu4Xt12oLKtHgP9AplGBNGgQ5ZHkwqjoNNIZf6k?=
 =?iso-8859-1?Q?Xrrka/K+HNAjF/bOul9DvtJWtaKsAxoCSBXwV8w89NeyL9YF8j/LtNPJRV?=
 =?iso-8859-1?Q?kPkN1mn+ucYmHp+0EWBB80bTCiNfV5lb2YiNtBMnl3rnFAI04GgFEelA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 193d734a-8bf9-430d-5cfa-08dd1a1d17d6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2024 19:50:41.4513 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZizuH9Ae82X29ig+egM1RUvAdRABK+LskEdO7XoL8XWPIXEWCKt2HV5YzP3/TjyARbCBGe1g/dVYGTl3g7KiFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5004
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

On Mon, Dec 02, 2024 at 01:40:20PM +0100, Thomas Hellström wrote:
> On Tue, 2024-10-15 at 20:25 -0700, Matthew Brost wrote:
> > Used to show we can bounce memory multiple times.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_module.c | 7 +++++++
> >  drivers/gpu/drm/xe/xe_module.h | 1 +
> >  drivers/gpu/drm/xe/xe_svm.c    | 3 +++
> >  3 files changed, 11 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_module.c
> > b/drivers/gpu/drm/xe/xe_module.c
> > index 77ce9f9ca7a5..088f6caea307 100644
> > --- a/drivers/gpu/drm/xe/xe_module.c
> > +++ b/drivers/gpu/drm/xe/xe_module.c
> > @@ -25,9 +25,16 @@ struct xe_modparam xe_modparam = {
> >  	.max_vfs = IS_ENABLED(CONFIG_DRM_XE_DEBUG) ? ~0 : 0,
> >  #endif
> >  	.wedged_mode = 1,
> > +	.svm_notifier_size = 512,
> >  	/* the rest are 0 by default */
> >  };
> >  
> > +module_param_named(svm_notifier_size, xe_modparam.svm_notifier_size,
> > uint, 0600);
> > +MODULE_PARM_DESC(svm_notifier_size, "Set the svm notifier size(in
> > MiB), must be pow2");
> 
> Ah, this should probably have been in the previous patch?

Yes.

> pow2 could be spelled out "a power of 2"?

And yes.

> 
> 
> > +
> > +module_param_named(always_migrate_to_vram,
> > xe_modparam.always_migrate_to_vram, bool, 0444);
> > +MODULE_PARM_DESC(always_migrate_to_vram, "Always migrate to VRAM on
> > GPU fault");
> > +
> >  module_param_named_unsafe(force_execlist,
> > xe_modparam.force_execlist, bool, 0444);
> >  MODULE_PARM_DESC(force_execlist, "Force Execlist submission");
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_module.h
> > b/drivers/gpu/drm/xe/xe_module.h
> > index 5a3bfea8b7b4..84339e509c80 100644
> > --- a/drivers/gpu/drm/xe/xe_module.h
> > +++ b/drivers/gpu/drm/xe/xe_module.h
> > @@ -12,6 +12,7 @@
> >  struct xe_modparam {
> >  	bool force_execlist;
> >  	bool probe_display;
> > +	bool always_migrate_to_vram;
> 
> Kerneldoc
>

Will add.

Matt
 
> Thanks,
> Thomas
> 
> 
> >  	u32 force_vram_bar_size;
> >  	int guc_log_level;
> >  	char *guc_firmware_path;
> > diff --git a/drivers/gpu/drm/xe/xe_svm.c
> > b/drivers/gpu/drm/xe/xe_svm.c
> > index 16e34aaead79..bb386f56a189 100644
> > --- a/drivers/gpu/drm/xe/xe_svm.c
> > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > @@ -767,6 +767,9 @@ int xe_svm_handle_pagefault(struct xe_vm *vm,
> > struct xe_vma *vma,
> >  	}
> >  	drm_exec_fini(&exec);
> >  
> > +	if (xe_modparam.always_migrate_to_vram)
> > +		range->migrated = false;
> > +
> >  	dma_fence_wait(fence, false);
> >  	dma_fence_put(fence);
> >  
> 
