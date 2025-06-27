Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C4BAEBE7A
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 19:32:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B33C10EA79;
	Fri, 27 Jun 2025 17:32:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H0PqGnqk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8884B10EA70;
 Fri, 27 Jun 2025 17:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751045526; x=1782581526;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=QnhIcRsCEWTtHoWEO0aQP3gMkEVE34lW3Rf854aVJD0=;
 b=H0PqGnqkngcRJGYzXxt9Y1HjwGU/wqhmzGGy4VdH8aEcgsu+6+acj28X
 UnamY06g+ZM4fl48yKy3C5run08UbD+2+dZqbasXt9CpBShRHpqzHVMcU
 oPWkBDaEuL6laiVDiyl7WhBXaIx1tq0iFrdclJfSq9/dP0rcfaVFRE1fQ
 ohKcg/yrMmhIa9lKswgcKxHw22mzl+A0YrNKs+7Cj+L/I/eNZkcpSeHN0
 hDFulbrXdOy6DCSV+SW2dpnpFbkeuhPIYZrU1OaYyJLaD3zom7ttPTG+q
 rFqJtnZBL38vNGcaN44e7pjF+YD4yuYbpQWMZDYL5DUFcMj6AGu6SVTxs Q==;
X-CSE-ConnectionGUID: bvDKMUZAR8miQpmkNNYaYw==
X-CSE-MsgGUID: k6ylhGPjQ2etZ5UFO+pdkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="70936537"
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; d="scan'208";a="70936537"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 10:32:05 -0700
X-CSE-ConnectionGUID: m43awmGTRseOFCzaS33suA==
X-CSE-MsgGUID: UHE1TT2tR0CS86v2xU+gnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; d="scan'208";a="176531325"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 10:32:02 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 27 Jun 2025 10:32:00 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 27 Jun 2025 10:32:00 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.84)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 27 Jun 2025 10:32:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ioue22hamemG8u5+IvpMkrtcH+LtOy72q4Z7ZlgWFhSXbMIFy1Fjoyx/7AeUm2mgigT7xsZ0Frp9TPzwraTHKL+5bdbTmp1ZBzwwYigksxm9L8hYl9/5/QfdB/glAMPN8a8iY8KKDL8OjiPEC8Jxist+j9qTnV5s/xeX9Y62SA2PT7ayxPkSiXjiJ0vPyfryvx0Zyq7x/tyUFo3zegu2f1pIXolFoQ6q+RwBfWKvDYzQvCVvc4A7ln2pIyCaAeaF6bwKxk4s7745PJcb3FgLuwhuwOtpKZh+V9vo6IxemvgoEIkdIaBAbjjrdHjZv6MMn0Pum5ggE00Eg2HMjdqO3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QnhIcRsCEWTtHoWEO0aQP3gMkEVE34lW3Rf854aVJD0=;
 b=wp+7DN3wr3pdLRY9S8dwkHJd1cXnsWPEEid6E2HeyUqJE3BDVDLKC3xqWv8jUOuhqI6ntNuUctZijbpKN6y9iNz1HKrNjyjju9EdyFk8QqJJTUbqPXIZM/pZcJKh262OQNDA40zDA0+gLkvtTB+ViwDa/jiHbQyYv6xOSwfeTf2kBnmV6S/S2eGutEOEAUOZd4ibRJD51glKvmTxgbvSySMHYTIfS5O7UAqIYH+e1KVidzZ4tYZXy3g2efLJSyNXQzR1OpxT2qkiDJbu7tgS3nHGszM48LdloI6K3r4vWKH3AVdh3DimmiJexNXwLDNuTGM1sDuQS3xg2r99fsgWsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB7660.namprd11.prod.outlook.com (2603:10b6:510:26f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.21; Fri, 27 Jun
 2025 17:31:57 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8857.022; Fri, 27 Jun 2025
 17:31:57 +0000
Date: Fri, 27 Jun 2025 12:31:54 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Dave Airlie <airlied@gmail.com>
CC: <dri-devel@lists.freedesktop.org>, <tzimmermann@suse.de>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: iosys-map: refactor to reduce struct size
Message-ID: <atymrskfqxr2rt2qittipf7lgohynge2p6yxlwcph3megmlraa@vjbrnsck2qb5>
References: <20250522065519.318013-1-airlied@gmail.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250522065519.318013-1-airlied@gmail.com>
X-ClientProxiedBy: BYAPR07CA0072.namprd07.prod.outlook.com
 (2603:10b6:a03:60::49) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB7660:EE_
X-MS-Office365-Filtering-Correlation-Id: 19c85ac3-fc48-4841-c74d-08ddb5a08455
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3nf2RFkEOMCSesDF76qSqOhdcmIW8w1IZU/uuiIg/0zpr6QJAvvzk/hF8xfV?=
 =?us-ascii?Q?F4cO0DF6M4TCI9qSBk+0jMelyw05cHiePUXwWgKkCyWNeWVr86JBdozVKCHH?=
 =?us-ascii?Q?urbdgnFTFBtxCpiRhXr3/DMifbmGcn7YFsTWqsnSf3y9FoAT2EbHQuh8gtyu?=
 =?us-ascii?Q?HQvYOFKWwIV9jNLzGHWKJi5vWRbU8Wro6NDm6/ITOCl6Ri6XA7eOI6HDgTgn?=
 =?us-ascii?Q?3RJ5LH8xQThUZWEZcW4cE9yQ2MuQZcdrjzFA989HQkorirkg6NXb4qKHsHga?=
 =?us-ascii?Q?wchW2k3NIuRltKpFmuANync9TuDJ5/reOeadjIXG3UOB8UsKC84nAwyyL3Va?=
 =?us-ascii?Q?3R7Ev4SDEjceaTTTe9DQgc5trvOmbSzQn5Svf4v9Ly2a721ZwQ0LN0NqRP2X?=
 =?us-ascii?Q?0Fc2op48x/+L7vJMuC+bI8Nduo4cqe1z04ngmNTp5sTYqLvRlx+WpaFamArc?=
 =?us-ascii?Q?wSzYpGhGM2cGWp8EIcXx0QADzJE4DvJNEv34y3mGJJP/I3xKr5pDBeT47gjx?=
 =?us-ascii?Q?jph23POmpx2spLxWmMLbGR/BLaceLDVgRW1ItfB+RC3LG67aAdYXFPtfj4Fs?=
 =?us-ascii?Q?Ec4CNH1zcUgrVblqpCqtihgpWCbmZ03Vm657wKOuJNwv4tlSYAOfGnxpOHn7?=
 =?us-ascii?Q?Al+/Qsq35jL6WFoyG9q9guRrYD8Yi/YlHVUqgz0CAAYGyGxGyRSF1pmVycdO?=
 =?us-ascii?Q?kNL3AWNUn6OS3xx3vvalrJaQ29D8F2wnqCqdiRrf3psAW2PobwS12Xe+kd0n?=
 =?us-ascii?Q?8X59sYt26YEdP0Bh7/6Ha75o/yxRK8IoSVBXOZe6K/6NvNnJeMt4auaimeKN?=
 =?us-ascii?Q?rzC0sirAe+tg55oq2gyXNDg666BcW1+AOszMiF29vOG3UkCx7YN+8C1OT3p4?=
 =?us-ascii?Q?ijfIsldFl/jYmUpboHCDdWT+XFy1dyEWd043TXZG20dm1lXBw6G8bcrAr+lQ?=
 =?us-ascii?Q?XWvFBOaomaxgmS9NU/JGmTExuyJ5n6Pnvom05Aq4tt7+/nq29UkySs8A5gKO?=
 =?us-ascii?Q?ws6a5MkoMQww9P18Sq+ILNN3/c091pzcu378/bEAXRhedZ/A4DsJhFWn5ure?=
 =?us-ascii?Q?SvXnc+lX1fnytLLCyogth/NBz6wXf4ZYuLkjGxrBqKQJZ5lD9bRBmW/cdrmi?=
 =?us-ascii?Q?MmGMtpAYKnwRfvTAHLkfpHXZaMmbSqc/DmyCXJk1Mch7ggnHawNHmxzBQcS7?=
 =?us-ascii?Q?+fEdHQ+pYUp9KIHa5IChSVt0aqWWuVOmUDJMEnYmBeF9P+tqK5lNqXt92AbW?=
 =?us-ascii?Q?wVuS9jTfBDO6fQlzPcoOZ/c8YGq5adZYIRi01qYGjcypHK1pPBT6tnJwo4RY?=
 =?us-ascii?Q?tiFwPxKt80fWfT8xA1Uu9OeMRlLTLSa/FCO1+JPsp6LcEjFyOuc9+uKrUU4O?=
 =?us-ascii?Q?ShfG+ALQohB5lqNiCJNZ7/DBNGpVl0v+JrVihufk5banQpvq4/4Fr7sFU2hD?=
 =?us-ascii?Q?2kaTGAo+1XI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PUa3CcVkYj+i98+2clE97mFPVD+eAcY6ZHvyoGQ39ecY21R1u4Vf0sIvIUZ8?=
 =?us-ascii?Q?vzhZ0zkGtA68o8H7RRb7b4j0U5f5Z+iufrG9o5MxAELu+AVKm9iYpIH49GjZ?=
 =?us-ascii?Q?FJ4lQ+BpaXNnWAXLAdk+gUHjae6oj9mSUiisncv+ItnGLhdvfxlfuqfON/Xd?=
 =?us-ascii?Q?B5GHrCLbZPHN8tVZmCyFi0Ta43zFrZ9MlIU2SkETXk2STK2+xOWhN41HtSea?=
 =?us-ascii?Q?97zi8/Qu8jEzBMfzL+u40eGD3vd/byZAxWjyW49FqeNB/iq4/QzN721zpjJ8?=
 =?us-ascii?Q?fVZmB9FM3OkSkxmYgRG5h1KrmmHJYHFwnYoNC3ekFgN9Jwh8t4qF0hVpbPo+?=
 =?us-ascii?Q?XY2vKN9Pfw/kGHLOIqyS76FxPfcoaoBuZudUQ/hdNgFbLtBKVnsmGRwLgBDz?=
 =?us-ascii?Q?WJywIHATk/IeUZrGodQpZ2Qm7NbLjyvRONIFzVIkuwiKw4q4Hfnonc/x3Du9?=
 =?us-ascii?Q?v/qIHEiQ4yMTSGaabQyUDv7FXOdDFj2uODqiSWMNA4Bs05HX2LIFv93LSjX5?=
 =?us-ascii?Q?LvqzJ65xmDUER9CULOCde7A/yVJi2K+Trw3zTPxPCLcorpe5hMIMIkrAIyTs?=
 =?us-ascii?Q?C1bu1T9qadQ6VjKtvLY1Wk9EkHKHfrT7Aw/kPtvKStS+086OyCVzQKMypc7/?=
 =?us-ascii?Q?8pV6YgA7W8AgQF6Tzcg7mWf2PajhywW+RjlHDCl+WADx5c0PeCy0tx0776/M?=
 =?us-ascii?Q?azDmH++dMkYJmJh6HCnBOm1FyhsCOJYjzsU4xloc4WKyQzwyIS22UO/WCL8Z?=
 =?us-ascii?Q?PcA+ql1YCliyZUMuKThahpMeDLZ2V/tUAHQsIZSNiDWRHxdKc6MrrIqqIeKn?=
 =?us-ascii?Q?L6qezon/RZ1PLoVdZDD9dVa0W1DxR3n2Fryst2Np0W0qEOMcEz223cA3PkFB?=
 =?us-ascii?Q?9aIfS2F5mzo4uL6JBQlOvBGlqJkX5t8srjjjL3EwMLfZfK9m3pwb+RA/+9sJ?=
 =?us-ascii?Q?4k3NxfirAE+pbQAsS++z5Pq7OeAUWlW829G+HFCTHcuH/FE7r3Ncy6qInZ8W?=
 =?us-ascii?Q?bmlVeO2sFZ4qiLpzkBc/UgmwwtpvY8JIVlsF6YUdT98aCM4geyQC7aQs1D83?=
 =?us-ascii?Q?LAbxDHaeIGAE3fa8jbRjIEENWXjLL391XM20leG8xgkKi46qqO9yQrBB28Ek?=
 =?us-ascii?Q?juRdzN1RGWTOhV4p1RtbXxIv41CbnEch2Xc3264ZmkUGbPYSsTz8VCgqWLJE?=
 =?us-ascii?Q?ssjGIo/NzaVYE0I0LzU/x6johYB9XvKevdYEcpgsTX4YbYwosMJ2aZmKMpAD?=
 =?us-ascii?Q?pDC6sFaHefGqamDWirjLFhwLwDdAlBWQniWqJEITu8NErCgCnzIkAESZO+t9?=
 =?us-ascii?Q?fYvkuGfx16OhEzdb0uN68rcO9871aNNP6ltSQS473k1/29Z2RiuukJC5pv0L?=
 =?us-ascii?Q?6W0VU5PeE8xQwmh+0mL8kJKCVGCwbcH4KIf6BTQC3dy4bcv0qYYjF/ao2R/N?=
 =?us-ascii?Q?ack3tIZZifFAS6lLYrMOUa3xhyLzFAr75MRr0Mn9G868WltgAK1o+aCYV1ID?=
 =?us-ascii?Q?VWAxGSC5qxmHTH7QJwXXdmvHye/9wiJQ4QQSgbsVu6diFDS0oDFUX6d2QjdP?=
 =?us-ascii?Q?1VwZXSaDM++u13+R+FP26EtnSJLU78vEuv1mxceGv5rH5VuWgbtJM8wFZURY?=
 =?us-ascii?Q?Dw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 19c85ac3-fc48-4841-c74d-08ddb5a08455
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 17:31:57.8218 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nV3Zl3lH2LEEo85+FcMeL++4ACCtoTh8okOKOb+2iNG+1v94q10v1bnxo9COCJyCuA85xzw0q8mQxXhZRJ4Z9zEj6mJYmBH/nrDtYpfAs4U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7660
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

On Thu, May 22, 2025 at 04:52:09PM +1000, Dave Airlie wrote:
>Hey iosys_map users :)
>
>I fell down a bit of a refactor hole today, it was just random and
>sometimes you just have to let these things run their course.
>
>I noticed iosys_map has a 7-byte hole in a 16-byte structure, and
>it gets embedded into a bunch of other structs and it offended my
>sensibilities.
>
>This series makes iosys_map be 8-bytes, using the bottom bit of
>the void * to store the is_iomem.
>
>Patch 1: adds new accessors to start hiding internals
>Patches 2-7: refactor all users in-tree to use new internals
>(hopefully got them all)
>Patch8: moves the internals around to catch anything not in-tree.
>Patch9: reimplements iosys_map as 8-bytes by hiding the is_iomem
>inside the pointer.

Even if not being able to use patch 9, I think there's a value in the
previous patches to hide the internals. Is this something you're going
to re-submit without the last one?

thanks
Lucas De Marchi

>
>Dave.
>
