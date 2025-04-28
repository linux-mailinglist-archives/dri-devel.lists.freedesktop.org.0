Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE38A9E62A
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 04:15:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05EAC10E2F1;
	Mon, 28 Apr 2025 02:15:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e7JBdxUo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAD1C10E2F1;
 Mon, 28 Apr 2025 02:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745806526; x=1777342526;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=QdW4WAq4KklVKn8QZninb6RwUzk5Zs6JoWRDQzEZQuM=;
 b=e7JBdxUoBOHun2zUeYwjmhdiLwwd52XkotVCR2HzDtGPtF9Zy4ZFkWBH
 Fa2rjxL9sXpdiwyKWYwfpFs3Sa2Df5qlq8UpxpXj25LgJCIjGiHdQXSF2
 XaNFiQjD9S2yS1I4VXRghvSO+e7eYoKUMDotBdNQYxqeYMarhYU9Q3jrr
 7z5LN0L70CQP6i4q7muQHHFt4SSY4W6UxGhmMZZp3w1EvhudyxifwJfTB
 /6DFsMvNVri3aBsqnUDyN3mcCPwD5+pPEVOlaVLua9tAP0fKpBHAWeB45
 5bQWCw3LXDOZStTwe60o/SrijEb9ZKiNjjkujticahP0z9wATiE6hq8SJ g==;
X-CSE-ConnectionGUID: KS+N0SkURLaWFAscIUB3dw==
X-CSE-MsgGUID: xai3dijyRySbUSdOwMq++g==
X-IronPort-AV: E=McAfee;i="6700,10204,11416"; a="51205073"
X-IronPort-AV: E=Sophos;i="6.15,245,1739865600"; d="scan'208";a="51205073"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2025 19:15:25 -0700
X-CSE-ConnectionGUID: kANnGfqnQY2N8yC2qpgfgg==
X-CSE-MsgGUID: NnvjmEToQnSsdZ6vJ0/Q2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,245,1739865600"; d="scan'208";a="133695796"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2025 19:15:25 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 27 Apr 2025 19:13:55 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sun, 27 Apr 2025 19:13:55 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 27 Apr 2025 19:13:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wp8nwYeTcHFxXTmpZ0TmrbR9dcFuGK2iu5L2/A66lvJHRxVhHYf9m/YLH0u0ujd9jEOVik7Ns/b+DAt5DlLmbj9KJfWG8XDXAKs22KIwaZi5ZoHWFPl02IBq8cmgBjhSxBwvS3tzb0IVIPyatxXpIgZ5H5XYBKjjuHphjUlmkXDLzbtuLUs2HHjT9+ogk75fCyElElwEALkvGFdI8AgFKEJ18bgbzHOVUVJ1T8EEd7xmuIeuhFY1LOLRMF17JzwAQzRIKcMA1Q1qwOodXlAYBw2yB2zNTrj+IyPKBYHE75bgqp+bZoGKT0Nbp2Fzv4O9U/VkEzPaIaqveVAKdihfmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PYugqqvSdRaXwygctQRKoSpaiJi25+QigVJ4Pp3nMDo=;
 b=u591o9vQ2hbE8tl8hvFSSW97qhq7GTye44mwR/5swKWOSYeXnkTzhE/rJLyMltFB+UjnI5yHjS4fsv8qvDj3vxf7P2glqAFs7UAm/Mjb+6wRjAlAknx/eOdD32xeuCM796vNaWg1vVoUogSgsFJl7y1+GoCkTe4X4rm2QStvDx+afkso+iZDYwqbqE0DYoVrGE2oy83ZUGQp7Rafy7S0q0o3h0N74vhK37Blg86NXAP2de5Pt8fU/+u5AdgVCokr5d8RPFKdc5BHiIoQZaI6oQ0bHujrPIqbAe5CmNkJUXv5Q5PGZ1Jmv2EkDgItD5jYNM0GYJzeZdDIbdhOWvDEBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB5879.namprd11.prod.outlook.com (2603:10b6:510:142::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Mon, 28 Apr
 2025 02:13:08 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 02:13:08 +0000
Date: Sun, 27 Apr 2025 19:14:29 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Dafna Hirschfeld <dafna.hirschfeld@intel.com>
CC: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 <intel-xe@lists.freedesktop.org>, <saurabhg.gupta@intel.com>,
 <alex.zuo@intel.com>, <joonas.lahtinen@linux.intel.com>,
 <jianxun.zhang@intel.com>, <shuicheng.lin@intel.com>,
 <dri-devel@lists.freedesktop.org>, <Michal.Wajdeczko@intel.com>,
 <michal.mrozek@intel.com>, <raag.jadav@intel.com>,
 <john.c.harrison@intel.com>, <ivan.briano@intel.com>,
 <matthew.auld@intel.com>
Subject: Re: [PATCH v23 2/5] drm/xe/xe_gt_pagefault: Move pagefault struct to
 header
Message-ID: <aA7kheFw0scQzQCN@lstrano-desk.jf.intel.com>
References: <20250424204917.172708-1-jonathan.cavitt@intel.com>
 <20250424204917.172708-3-jonathan.cavitt@intel.com>
 <7jwsm2mc6nb5khkhgql6tdb2nb6tlmutprs2x4fjboqoiqxne3@fayagpsyc4a6>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7jwsm2mc6nb5khkhgql6tdb2nb6tlmutprs2x4fjboqoiqxne3@fayagpsyc4a6>
X-ClientProxiedBy: MW4PR04CA0130.namprd04.prod.outlook.com
 (2603:10b6:303:84::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB5879:EE_
X-MS-Office365-Filtering-Correlation-Id: ac32c417-36aa-4a55-aa00-08dd85fa3792
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?kqbHyZQjTJvdMMOvvcAHc/0O9ZVJV9EkE1m0cj1wyRJsoeKTns42wDMEGi?=
 =?iso-8859-1?Q?nLlXaCIYY9cz0BaCSSp+iae8+UrVIFHqYBDn8NhE9PGOPcfb/7cq9mU2vN?=
 =?iso-8859-1?Q?Rz8/NIhJkk/zfhsVM/x7zA2hohirGXrIDQIkKDhZgC5y/Z7Su1XmOtkbzK?=
 =?iso-8859-1?Q?vgRrargj4m6AdDJ3aJVS29E40o5Je03jn7/jAUSyfOCefhnhmiQooEFm/w?=
 =?iso-8859-1?Q?ebsMMcx0d5v7bMGIBG5YWkqp12MC4ohtdFYv6xFPwjHcoWyaME5b+7HxNm?=
 =?iso-8859-1?Q?lPc2+XYQV1lziWbwcupSiMV4eK3gNfu3aF+ot0ZMwzRzyzf3CDDWFhOCQx?=
 =?iso-8859-1?Q?Mp3PwoEdNoZexWo9/CCNB5CFe6bPaNzCeaGWDOl3dQxIxrS69RlKYrU7l4?=
 =?iso-8859-1?Q?lqSPenbR8MX/3Q90SnVl30FimHOWm7usskHOo13AENitXQ6M+8h0u3Pqj1?=
 =?iso-8859-1?Q?HSw5VJ3r2QfemKsG4qVDC+aOsfCTe8waoCDcgWhXvSi11A6O5USM2ZGaKh?=
 =?iso-8859-1?Q?68P2hYYTzaAJG48LozUbLdBXoMYA9+mNjuPyjkdpjoNSV/lQCPhs7pBDGT?=
 =?iso-8859-1?Q?+289ANaHDAFRQDceIdiJzgQ8XZPP2um9TsPv2DvIbFVPTC1+dSeygIATB3?=
 =?iso-8859-1?Q?TInhaPSf4BVUBCB32yJkbHe8zxc2lRfOrzqywVLrBtqu5weF7p/6obMJPq?=
 =?iso-8859-1?Q?Ns9JiN3egAleit3YVYswfkpwuW/8+Kb7XOmBpiR/nxSZobYuak2MDm4z4O?=
 =?iso-8859-1?Q?PriXkrzwC8vhntNPoaACPpGNuWJVAD1b/1iQemWyrk8hZXyKdv1Au8//8r?=
 =?iso-8859-1?Q?LRHeMUHqGLZktiBx32Iw3R13D4xpLFqSnJGGpuDFDLbixfALsgf+JXW0n/?=
 =?iso-8859-1?Q?6JmRxd03ZxYNK05L0BKRiWZALUWWDsSAfKbQveKY/M08d4Dn1cO34UCPHW?=
 =?iso-8859-1?Q?iRamRE/53kpUN9zC/7osPANys0Ri+0QQT2I8DHlOpDUCSjUMII7jTlX5ce?=
 =?iso-8859-1?Q?a/qwfdamh2qyzCRimHfSIDY12AMhnxI/NZMcrzsUjWwE2dPFCPuxARrjIO?=
 =?iso-8859-1?Q?gmTBL0Kk6y7O2EqE00AXvh5ttatC3fjrhBmlXb2l6kEzbjh27PhWuh0er/?=
 =?iso-8859-1?Q?ZSM1OxWLVDviolZUmcCU47y+qaJXdYerSVUp9D4uPCJLQ0NnOVqtErLZfP?=
 =?iso-8859-1?Q?4FDbaX9B3ByiN7icm+9l1Hvjh+19RIvXVU4xI05CkuzMToTGV0PuNYbjrj?=
 =?iso-8859-1?Q?IntLcfWnhYgSShdRNonc6wJMTbCPa4XHjsnghJbIWfD1nP7qyKsaSJdtRh?=
 =?iso-8859-1?Q?l1I/vFdFjlDwtGLbTLcUdXjjG84D6TBvxTzPgputY3mDzwagoVYjb8buCT?=
 =?iso-8859-1?Q?HS5el0enYjTJORWw3/AKZeHOaW6xy3e6W6psQl7J9DlDaosYn8ObFUBnhh?=
 =?iso-8859-1?Q?ZMr25ML4A7Q8Fb7G0mnIWUGNpNxrK+JMiGW4c6SMxrRhA8VcSRlGHfN+XA?=
 =?iso-8859-1?Q?8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?wynJm8AQec3nvwANChAxG53Vlzvvdq44+M0KNsFe+PFLa+I8RyABfKLIBy?=
 =?iso-8859-1?Q?xR2Vyxa+8KJqMy4yyMwDxsTdga3KLt/Ro8wsUF2gum+cfQhhWzoNTxpO4d?=
 =?iso-8859-1?Q?/0lXyOe6VBvZwl66I6/Pt7BygVr1insDNsc2MpJ8T6eVKYb1vxqdbseSxM?=
 =?iso-8859-1?Q?qPtfQMGO8ghupq+LKyv+gxQGQeT2kjyJjlgD7Du4ekEE06PV8zNcPqMDDH?=
 =?iso-8859-1?Q?VP980hPkDIWLY441IAK7g42QQMXeT8RdRafuDYwAslTiXOdwvEK/cBUOQR?=
 =?iso-8859-1?Q?wLZQeGLpRGqE/xtuCsA6/bpEL15lmsLePRD9gWC6ZLDSbT3om4K0izaegP?=
 =?iso-8859-1?Q?7Z1TCyHuYNBW5seQIS5Q1zCmCKMb3srF+LLqB5vKNnhjT/gOKpnBeA3Fh9?=
 =?iso-8859-1?Q?6XUE/1nRWWibBewY6rJFWe+J7mu6gCB53NBEhv3yU2pjtvIJuCd40nB4Z1?=
 =?iso-8859-1?Q?qSntRuelMgT9rvDtvfXiO6uwBKVr5QI7VcEPHwb29FCCPHDxE7qbR8Eu/j?=
 =?iso-8859-1?Q?2h7JrBU1xANR1Nm2hCfK/JIOTO8LhWd6pyb0GQPziwDYFuD4rpknYIhc0x?=
 =?iso-8859-1?Q?l6Dk8u7cS1xuk6M8O+BJLXmnwxnlPz8qdmc/NC5x7DgOe+XyUjXRgvHFKC?=
 =?iso-8859-1?Q?toFB4qbCgNI9xIHAhQsH4oUQA888gM+13pxzW+YOAE7u/98Qu6vMYmPIOm?=
 =?iso-8859-1?Q?GCnUgxJgwRdn2ZRYUystA8/r3MbftCZ+79Bc6oJrbBmAG1PSrx2xs6HO1j?=
 =?iso-8859-1?Q?iHEZVlBNAvpO6+wZx33381/Hr4+rjZXwuLFTSmGRtzS+SKFyW4zhjhDlyn?=
 =?iso-8859-1?Q?jLhZiI3klMbt+tyD8/Gf0dMV8cCA47kbmSiyfl+xxd5LAndjbeiHi8SPAZ?=
 =?iso-8859-1?Q?ZQeDPiGGOWMew6YnLgEexayEkDerH7SXGIrW5gC79JSFC4APc3WXF6lsN8?=
 =?iso-8859-1?Q?Re5Sta2NISJLnM6QjH+kUVYBiMzHuRQGOYCD7yJ/66ezmPp/SP2X7wkHuW?=
 =?iso-8859-1?Q?ZpdQRTEbn/TKaqSQYeLQ3wnLVCVqWP1Zri732KXJb1hWt8HgoV9S+k0DHS?=
 =?iso-8859-1?Q?0S6zm3ZXnlimmzvrA68vk12XgsiEAUpV6Ed5z+N6SXauLo2XoEiuyM6zlF?=
 =?iso-8859-1?Q?7+1a4N601rtC4ozZllf2vZN8Aqw3IxGxjZuoe675br6AO9AGnzI395oaS1?=
 =?iso-8859-1?Q?nTYhfTe+M7buKIeE5DMmK9qUUTHp5SnmssvYPr2TrfaM09wfmB3JcrObQq?=
 =?iso-8859-1?Q?X7M2jT4sd3myvv6nXsMAoKGkDs8UP6z+iiDHwBp/hN48Ku4EbzDj+Xikcw?=
 =?iso-8859-1?Q?E4YjYKUwqfYQMqRYtiytOwcnJrGir6SPreKs0G7l8qFJZmEIy1fQk4t/Sx?=
 =?iso-8859-1?Q?UtcrMfx8oQRPw5ZDoNtCME+0yq5/lJlQ1RioXOZW1RjAxdB5haOAkheugy?=
 =?iso-8859-1?Q?uWOJ1swe7p4rdVrzig7IR/Re80V5iM79I7JDBcZSDOW/KsURLbb43w/5p5?=
 =?iso-8859-1?Q?mcBKVDGLeWZoonXWUV1i2zXu48VuwfbCVexdSYIldhwMJGYSs9i7V3hkUG?=
 =?iso-8859-1?Q?w5egOMT0IVke5e07JrU33+Fzfk6pEMQvNwA2UWrVLqlfuC++dwQBcRNzM7?=
 =?iso-8859-1?Q?aR6oxF1J/Put+PE8HEPg2q6fK5bLBCrm2bAFutUwpJc3Bojyk1vl3xPw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ac32c417-36aa-4a55-aa00-08dd85fa3792
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 02:13:07.8972 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vHm6gyllcPZ4EsyzURyrDixy7yTXqiTyCc/zz+M7yF/jCn3cLAsNUKxSTJkSY/LBqfZv3mPzOCsx4+l4XIhEeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5879
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

On Sun, Apr 27, 2025 at 02:57:22PM +0300, Dafna Hirschfeld wrote:
> On 24.04.2025 20:49, Jonathan Cavitt wrote:
> > Move the pagefault struct from xe_gt_pagefault.c to the
> > xe_gt_pagefault_types.h header file, and move the associated enum values
> > into the regs folder under xe_pagefault_desc.h
> > 
> > Since xe_pagefault_desc.h is being initialized here, also move the
> > xe_guc_pagefault_desc hardware formats to the new file.
> 
> Hi, currently page fault is assumed to be handled by guc only.

Yea, this is layered incorrectly - this is my bad. So in our TLB
invalidation code, also my bad.

> In order to make the descriptor more general, I sent two patches moving
> the descriptor to xe_uc_fw_types.h. [1]
> Maybe my patches could be used instead of this one?
> [1] https://lore.kernel.org/intel-xe/20250209121217.1604458-1-dafna.hirschfeld@intel.com/
>

I think this patch is merged, or will be very shortly. I don't this is
worth holding up, but in general I think the flow should be adjusted to
roughly...

- GuC (or any other PF client) parses PF into HW agnostic format and
  passes it to GT page fault component - I think we drop any fields from
  the current GuC format that are unused by the GT page fault component
- A vfunc is attached too the HW agnostic format which is used to signal
  PF done, in the case of the GuC this issues H2G
- All GuC specific code is removed from GT page fault component

This should allow other firmwares to hook into the generic page fault
code.

Matt
 
> Thanks,
> Dafna
> 
> 
> > 
> > v2:
> > - Normalize names for common header (Matt Brost)
> > 
> > v3:
> > - s/Migrate/Move (Michal W)
> > - s/xe_pagefault/xe_gt_pagefault (Michal W)
> > - Create new header file, xe_gt_pagefault_types.h (Michal W)
> > - Add kernel docs (Michal W)
> > 
> > v4:
> > - Fix includes usage (Michal W)
> > - Reference Bspec (Michal W)
> > 
> > v5:
> > - Convert enums to defines in regs folder (Michal W)
> > - Move xe_guc_pagefault_desc to regs folder (Michal W)
> > 
> > Bspec: 77412
> > Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > Reviewed-by: Shuicheng Lin <shuicheng.lin@intel.com>
> > Acked-by: Matthew Brost <matthew.brost@intel.com>
> > Cc: Michal Wajdeczko <Michal.Wajdeczko@intel.com>
> > ---
> > drivers/gpu/drm/xe/regs/xe_pagefault_desc.h | 49 +++++++++++++++++++++
> > drivers/gpu/drm/xe/xe_gt_pagefault.c        | 43 ++++--------------
> > drivers/gpu/drm/xe/xe_gt_pagefault_types.h  | 42 ++++++++++++++++++
> > drivers/gpu/drm/xe/xe_guc_fwif.h            | 28 ------------
> > 4 files changed, 100 insertions(+), 62 deletions(-)
> > create mode 100644 drivers/gpu/drm/xe/regs/xe_pagefault_desc.h
> > create mode 100644 drivers/gpu/drm/xe/xe_gt_pagefault_types.h
> > 
> > diff --git a/drivers/gpu/drm/xe/regs/xe_pagefault_desc.h b/drivers/gpu/drm/xe/regs/xe_pagefault_desc.h
> > new file mode 100644
> > index 000000000000..a169ac274e14
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/regs/xe_pagefault_desc.h
> > @@ -0,0 +1,49 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright © 2025 Intel Corporation
> > + */
> > +
> > +#ifndef _XE_PAGEFAULT_DESC_H_
> > +#define _XE_PAGEFAULT_DESC_H_
> > +
> > +#include <linux/bits.h>
> > +#include <linux/types.h>
> > +
> > +struct xe_guc_pagefault_desc {
> > +	u32 dw0;
> > +#define PFD_FAULT_LEVEL		GENMASK(2, 0)
> > +#define PFD_SRC_ID		GENMASK(10, 3)
> > +#define PFD_RSVD_0		GENMASK(17, 11)
> > +#define XE2_PFD_TRVA_FAULT	BIT(18)
> > +#define PFD_ENG_INSTANCE	GENMASK(24, 19)
> > +#define PFD_ENG_CLASS		GENMASK(27, 25)
> > +#define PFD_PDATA_LO		GENMASK(31, 28)
> > +
> > +	u32 dw1;
> > +#define PFD_PDATA_HI		GENMASK(11, 0)
> > +#define PFD_PDATA_HI_SHIFT	4
> > +#define PFD_ASID		GENMASK(31, 12)
> > +
> > +	u32 dw2;
> > +#define PFD_ACCESS_TYPE		GENMASK(1, 0)
> > +#define PFD_FAULT_TYPE		GENMASK(3, 2)
> > +#define PFD_VFID		GENMASK(9, 4)
> > +#define PFD_RSVD_1		GENMASK(11, 10)
> > +#define PFD_VIRTUAL_ADDR_LO	GENMASK(31, 12)
> > +#define PFD_VIRTUAL_ADDR_LO_SHIFT 12
> > +
> > +	u32 dw3;
> > +#define PFD_VIRTUAL_ADDR_HI	GENMASK(31, 0)
> > +#define PFD_VIRTUAL_ADDR_HI_SHIFT 32
> > +} __packed;
> > +
> > +#define FLT_ACCESS_TYPE_READ		0u
> > +#define FLT_ACCESS_TYPE_WRITE		1u
> > +#define FLT_ACCESS_TYPE_ATOMIC		2u
> > +#define FLT_ACCESS_TYPE_RESERVED	3u
> > +
> > +#define FLT_TYPE_NOT_PRESENT_FAULT		0u
> > +#define FLT_TYPE_WRITE_ACCESS_VIOLATION		1u
> > +#define FLT_TYPE_ATOMIC_ACCESS_VIOLATION	2u
> > +
> > +#endif
> > diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > index d4e3b7eb165a..93afa54c8780 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > @@ -12,8 +12,10 @@
> > #include <drm/drm_managed.h>
> > 
> > #include "abi/guc_actions_abi.h"
> > +#include "regs/xe_pagefault_desc.h"
> > #include "xe_bo.h"
> > #include "xe_gt.h"
> > +#include "xe_gt_pagefault_types.h"
> > #include "xe_gt_stats.h"
> > #include "xe_gt_tlb_invalidation.h"
> > #include "xe_guc.h"
> > @@ -23,33 +25,6 @@
> > #include "xe_trace_bo.h"
> > #include "xe_vm.h"
> > 
> > -struct pagefault {
> > -	u64 page_addr;
> > -	u32 asid;
> > -	u16 pdata;
> > -	u8 vfid;
> > -	u8 access_type;
> > -	u8 fault_type;
> > -	u8 fault_level;
> > -	u8 engine_class;
> > -	u8 engine_instance;
> > -	u8 fault_unsuccessful;
> > -	bool trva_fault;
> > -};
> > -
> > -enum access_type {
> > -	ACCESS_TYPE_READ = 0,
> > -	ACCESS_TYPE_WRITE = 1,
> > -	ACCESS_TYPE_ATOMIC = 2,
> > -	ACCESS_TYPE_RESERVED = 3,
> > -};
> > -
> > -enum fault_type {
> > -	NOT_PRESENT = 0,
> > -	WRITE_ACCESS_VIOLATION = 1,
> > -	ATOMIC_ACCESS_VIOLATION = 2,
> > -};
> > -
> > struct acc {
> > 	u64 va_range_base;
> > 	u32 asid;
> > @@ -61,9 +36,9 @@ struct acc {
> > 	u8 engine_instance;
> > };
> > 
> > -static bool access_is_atomic(enum access_type access_type)
> > +static bool access_is_atomic(u32 access_type)
> > {
> > -	return access_type == ACCESS_TYPE_ATOMIC;
> > +	return access_type == FLT_ACCESS_TYPE_ATOMIC;
> > }
> > 
> > static bool vma_is_valid(struct xe_tile *tile, struct xe_vma *vma)
> > @@ -205,7 +180,7 @@ static struct xe_vm *asid_to_vm(struct xe_device *xe, u32 asid)
> > 	return vm;
> > }
> > 
> > -static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
> > +static int handle_pagefault(struct xe_gt *gt, struct xe_gt_pagefault *pf)
> > {
> > 	struct xe_device *xe = gt_to_xe(gt);
> > 	struct xe_vm *vm;
> > @@ -237,7 +212,7 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
> > 		goto unlock_vm;
> > 	}
> > 
> > -	if (xe_vma_read_only(vma) && pf->access_type != ACCESS_TYPE_READ) {
> > +	if (xe_vma_read_only(vma) && pf->access_type != FLT_ACCESS_TYPE_READ) {
> > 		err = -EPERM;
> > 		goto unlock_vm;
> > 	}
> > @@ -271,7 +246,7 @@ static int send_pagefault_reply(struct xe_guc *guc,
> > 	return xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
> > }
> > 
> > -static void print_pagefault(struct xe_device *xe, struct pagefault *pf)
> > +static void print_pagefault(struct xe_device *xe, struct xe_gt_pagefault *pf)
> > {
> > 	drm_dbg(&xe->drm, "\n\tASID: %d\n"
> > 		 "\tVFID: %d\n"
> > @@ -291,7 +266,7 @@ static void print_pagefault(struct xe_device *xe, struct pagefault *pf)
> > 
> > #define PF_MSG_LEN_DW	4
> > 
> > -static bool get_pagefault(struct pf_queue *pf_queue, struct pagefault *pf)
> > +static bool get_pagefault(struct pf_queue *pf_queue, struct xe_gt_pagefault *pf)
> > {
> > 	const struct xe_guc_pagefault_desc *desc;
> > 	bool ret = false;
> > @@ -378,7 +353,7 @@ static void pf_queue_work_func(struct work_struct *w)
> > 	struct xe_gt *gt = pf_queue->gt;
> > 	struct xe_device *xe = gt_to_xe(gt);
> > 	struct xe_guc_pagefault_reply reply = {};
> > -	struct pagefault pf = {};
> > +	struct xe_gt_pagefault pf = {};
> > 	unsigned long threshold;
> > 	int ret;
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault_types.h b/drivers/gpu/drm/xe/xe_gt_pagefault_types.h
> > new file mode 100644
> > index 000000000000..b7d41b558de3
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_gt_pagefault_types.h
> > @@ -0,0 +1,42 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright © 2022-2025 Intel Corporation
> > + */
> > +
> > +#ifndef _XE_GT_PAGEFAULT_TYPES_H_
> > +#define _XE_GT_PAGEFAULT_TYPES_H_
> > +
> > +#include <linux/types.h>
> > +
> > +/**
> > + * struct xe_gt_pagefault - Structure of pagefaults returned by the
> > + * pagefault handler
> > + */
> > +struct xe_gt_pagefault {
> > +	/** @page_addr: faulted address of this pagefault */
> > +	u64 page_addr;
> > +	/** @asid: ASID of this pagefault */
> > +	u32 asid;
> > +	/** @pdata: PDATA of this pagefault */
> > +	u16 pdata;
> > +	/** @vfid: VFID of this pagefault */
> > +	u8 vfid;
> > +	/** @access_type: access type of this pagefault */
> > +	u8 access_type;
> > +	/** @fault_type: fault type of this pagefault */
> > +	u8 fault_type;
> > +	/** @fault_level: fault level of this pagefault */
> > +	u8 fault_level;
> > +	/** @engine_class: engine class this pagefault was reported on */
> > +	u8 engine_class;
> > +	/** @engine_instance: engine instance this pagefault was reported on */
> > +	u8 engine_instance;
> > +	/** @fault_unsuccessful: flag for if the pagefault recovered or not */
> > +	u8 fault_unsuccessful;
> > +	/** @prefetch: unused */
> > +	bool prefetch;
> > +	/** @trva_fault: is set if this is a TRTT fault */
> > +	bool trva_fault;
> > +};
> > +
> > +#endif
> > diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
> > index 6f57578b07cb..30ac21bb4f15 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
> > +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
> > @@ -290,34 +290,6 @@ enum xe_guc_response_desc_type {
> > 	FAULT_RESPONSE_DESC
> > };
> > 
> > -struct xe_guc_pagefault_desc {
> > -	u32 dw0;
> > -#define PFD_FAULT_LEVEL		GENMASK(2, 0)
> > -#define PFD_SRC_ID		GENMASK(10, 3)
> > -#define PFD_RSVD_0		GENMASK(17, 11)
> > -#define XE2_PFD_TRVA_FAULT	BIT(18)
> > -#define PFD_ENG_INSTANCE	GENMASK(24, 19)
> > -#define PFD_ENG_CLASS		GENMASK(27, 25)
> > -#define PFD_PDATA_LO		GENMASK(31, 28)
> > -
> > -	u32 dw1;
> > -#define PFD_PDATA_HI		GENMASK(11, 0)
> > -#define PFD_PDATA_HI_SHIFT	4
> > -#define PFD_ASID		GENMASK(31, 12)
> > -
> > -	u32 dw2;
> > -#define PFD_ACCESS_TYPE		GENMASK(1, 0)
> > -#define PFD_FAULT_TYPE		GENMASK(3, 2)
> > -#define PFD_VFID		GENMASK(9, 4)
> > -#define PFD_RSVD_1		GENMASK(11, 10)
> > -#define PFD_VIRTUAL_ADDR_LO	GENMASK(31, 12)
> > -#define PFD_VIRTUAL_ADDR_LO_SHIFT 12
> > -
> > -	u32 dw3;
> > -#define PFD_VIRTUAL_ADDR_HI	GENMASK(31, 0)
> > -#define PFD_VIRTUAL_ADDR_HI_SHIFT 32
> > -} __packed;
> > -
> > struct xe_guc_pagefault_reply {
> > 	u32 dw0;
> > #define PFR_VALID		BIT(0)
> > -- 
> > 2.43.0
> > 
