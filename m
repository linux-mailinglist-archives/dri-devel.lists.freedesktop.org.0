Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97BA2A9A108
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 08:10:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E844E10E72B;
	Thu, 24 Apr 2025 06:10:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DIxPvJme";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B2B010E72B
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 06:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745475050; x=1777011050;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=pcgp6UgECdoZVUDbToibnFN0vwooEdx4Ftn8BzSIby4=;
 b=DIxPvJmenhUaN5+3pvaQbWXHncdyW9hMc6tLGMg4ucOhATYZ2Ma7WMfP
 9A7aNvfLMgE0h7z2Z3g9JM1WXh/qLh/7wcBlcRX2XJlTsQc1zXC2SiLG1
 75SPezNoZussTAwMZ09BGIzjmRHfbUlb5c/B2pavEObtbxRsb3ctPBTLm
 9ozNo8Sf6oif1KfYmLSkzqVoYAUgl5OmwYw3K40yPNQ/GdkaJQNbMGqYt
 O41pyd0SFAbIGgNU7mVRtgLgdNT2/SScbac6/kkIEGbsNQj9zzpi+cVDo
 M+9U4xZO01OGaBkxNv3NB81HWQNbEX6m8TygYIVOcUPIkcvIyVgnHMHnD Q==;
X-CSE-ConnectionGUID: E2ALF9UsSFmbOhAHYAevng==
X-CSE-MsgGUID: 3ODka51eQn2IAahxdAMEfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="57733480"
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; d="scan'208";a="57733480"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 23:10:49 -0700
X-CSE-ConnectionGUID: nVLn37O/TkWJFL3RG7VWAw==
X-CSE-MsgGUID: BHhy5HVqREOTbmJUSSbVXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; d="scan'208";a="137376692"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 23:10:48 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 23 Apr 2025 23:10:48 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 23 Apr 2025 23:10:48 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 23 Apr 2025 23:10:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OX9v7Vm6/tHhqC8iDvI5AgtSpyhxVpE7F8S6ZRNPqQnxJcp60/vwh4qklL9087wFaR/OGb/6VW4x/PW7q0iKhUcS8uutqNRQWOZedduE9uGJa9Dta9DwtDQHRXJ1Zrfrwedfx5l9PHDm46PQ2obalP+250MGxSPL5hM1te0k/Gs6iDC6CqUqN8cgREF9cn/gn7f6eV69NVSesGNUz1Itpk5JFD824zGq9tQ4m7oneEJS+czVV4Ep3u0jnbnek1vQqshJS26Pfd+mhJ7F9Ew2rOrUpQ6u0yYZ3a6y4QZ1XdPR6xX9SwnHSHn+C2Y4rE8rqcV8IYZ/n16s2+7BWzyiyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hfcVOuePoFoinuL7Qmq0HX4Xhlz6UV3IwdrVFD6MVAA=;
 b=mdTrwM7iJ87KypHusfED3at4aHfhb9tPstGcwFJgEI8mmkvoZOu1RI+6LjUa4naMA9Cq5kXwgGq4NpH/nUCZ1tl8tzwufkFB9RL32q8ds2a2rN9gv5FvFJPhE8npqtF61eAcoVkglh3uAoHBQVyuNwK5FUBVqYzbQWvCaQy47+K9bcvSpFn24f7BL3bMCKoyxjp+2Hmyx9pjru/5GKlvgcBiNSlrSaj+sm1bPAaXGeTMy/+HIR1TSSQ9lcORASIbJ26js3HfHZjqVdIbBOiK/IgD1JKyDPXoRrjZRB3+wJxtCR1D6y+jgxcUJXzbYKPfGVQHytc/p18kMe3S8B9E6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB6840.namprd11.prod.outlook.com (2603:10b6:303:222::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Thu, 24 Apr
 2025 06:10:29 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8655.037; Thu, 24 Apr 2025
 06:10:28 +0000
Date: Wed, 23 Apr 2025 23:11:48 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
CC: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 <dri-devel@lists.freedesktop.org>, <kernel-dev@igalia.com>, Danilo Krummrich
 <dakr@kernel.org>, Lucas De Marchi <lucas.demarchi@intel.com>, "Philipp
 Stanner" <phasta@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [RFC 0/4] Some (drm_sched_|dma_)fence lifetime issues
Message-ID: <aAnWJOGjTD7fH/0B@lstrano-desk.jf.intel.com>
References: <20250418164246.72426-1-tvrtko.ursulin@igalia.com>
 <29b27ae3-de56-475d-ae85-fd593a011ea3@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <29b27ae3-de56-475d-ae85-fd593a011ea3@amd.com>
X-ClientProxiedBy: MW4PR03CA0280.namprd03.prod.outlook.com
 (2603:10b6:303:b5::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB6840:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a9f368a-691a-45e5-ac2e-08dd82f6b5b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?W61P3wK2T6DDhrdY/3NkGUGVGSfuABTJy6Hb8DEKIBy5u9gJukIVJ5VtOW?=
 =?iso-8859-1?Q?kn3DzaJLoCT+7L71fVLHnE9q4GyK/8ZWCHmWK37K9o+Cv6FzSNiXHyvxjx?=
 =?iso-8859-1?Q?KeNGrort7gcS4iV4bNNgKC3WGhzo6TR4WQP7GJvmEN+LdCWrO067XZqLJc?=
 =?iso-8859-1?Q?eDB4T8VihHXjaF2d/4ZGahaxLLX/ef1mrz32KIJoH2DKK/9Lfd8tLbGfj8?=
 =?iso-8859-1?Q?k2KSIhM8cnFX5g+ahhKXonWcUHY3q+ecD7aMdI51SAeIKZx58DLgf32SNh?=
 =?iso-8859-1?Q?LK9cZ8cDRjxG1beqN08jBJfMTleoHGGBk5xIy9CIBWFi93PML0IX5lxj8/?=
 =?iso-8859-1?Q?IFIxh/o5XvaZJXGLvfK00DMw9zOtpcqTDNf/XDx0W6aselcr0xWECZlXIA?=
 =?iso-8859-1?Q?N3zBvGJ3Quk5Ph1Fm6YYBLU6vYP9FpwA2SIXDi/YSmTXvAMjCR1nHq3/Ze?=
 =?iso-8859-1?Q?n8nNBgK4NWIyxf97u38boMBrUQKQ/twLaGaMA3BIf/qH3tcoJxL1536m0Z?=
 =?iso-8859-1?Q?FMdKzbSHODe7CpNSevVazznHHg2loOuKAAn63usPz1BSklzsomfTlr64bS?=
 =?iso-8859-1?Q?rx0bGTOf4KwN/jwzZC6WDdl40fQJhn87R3EP5zG2XTJNnnkTcLO+AX9coo?=
 =?iso-8859-1?Q?G2y5wSX0g2ux4s6qtH6ZX8rIooQwFHYqJ8IQpDbXVZ2tLjl3k6z0/mLoeR?=
 =?iso-8859-1?Q?YmFMbUr05MLhvyldidgXBFJNG69VsKfUDeXC/9GFkpcNQa4PXotRShgYfT?=
 =?iso-8859-1?Q?L8YkwmWO4jN9rNcEAdaukDXb1mFTN5awuaieKDtNoxDzuWCxw4aWzh9du7?=
 =?iso-8859-1?Q?ZPeg2UwMaY+TIshMFzSwTwm/db6wQDk7KdYRHm6VKzU+0FApCboM3LS/b0?=
 =?iso-8859-1?Q?+yZoUo9zsrg/+JloFXO6Agqye/cfEYTfm107FwB5FWu988ZAIgxaEHfYGG?=
 =?iso-8859-1?Q?Gl0eJbIuWlymps5QsXNlFUYrlkBjgu5+tD6agUR6C1wMcgYdr5KKmcOpA4?=
 =?iso-8859-1?Q?ajBibIh2VCCN57phbu0oXZLXsaPTGffxYciInDyE9wT7HAFSNrHA6tSceB?=
 =?iso-8859-1?Q?hRCAt3bAsg+yRQySYuWI3DX4QfZB2l/RwfrHbVjqs0jIk5UTROPig7RUgr?=
 =?iso-8859-1?Q?lUMBl3DK/hoJoBuBCDlKVcVViCX7wdDDa6+aS2wL1KYlOQOQ0zmVrHxMMn?=
 =?iso-8859-1?Q?3NH267/4yGCLhSn7Y1aYaUaErwxAG+cxuiwyO4DMQZ1J1L4JjU0NrZyCT5?=
 =?iso-8859-1?Q?dgzFmaQGw07WfAVuPbhsdQRrHzHqbJXF7s9aDMx+BJ7MBVgrLDMRyaKah2?=
 =?iso-8859-1?Q?cTyL0twZ8uzIlEguFmy7HJgdVMbcy8yfEAMPsqsWcVUp6jwX9juvQb0C0H?=
 =?iso-8859-1?Q?lHMrbU71sUNM44NQUwc6hRqnDKSt41mT1IpHiRiby6OOzKBMbIRCQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?s2omZlnb7C9r6mmRMWUEg20xmFo/MzDunF9OWoFYq+/EBJEiqG0wxCaWgl?=
 =?iso-8859-1?Q?MXxsu/evVRZPfKzIgtC2t64g13H7kVYLZZoqxLRBTfF1lZNxpM6tcMv4yn?=
 =?iso-8859-1?Q?DJytv4kgXUWkz0QPgeFLKij0ERAR34hbGx2j0gZwjlEPD+MMc+8sAjMWOp?=
 =?iso-8859-1?Q?KbdLECUBenjXSvzEpZ79ynQEod74t94Jvw/Ml6pzE5racWol5K2iHBrd5S?=
 =?iso-8859-1?Q?A+x5mCrDH12orIbizNXqnBPb4xqDT1XM7pc200PFzh4Vt/8krp2uwZjSEy?=
 =?iso-8859-1?Q?oVEMyIp4GpCZZIdSRK8tiX/i8okfRRTFoAMisQBOP25vkVtrkRNdqnRcRY?=
 =?iso-8859-1?Q?5+H4NNKsNBcBESQWnaFm2FoLZ0HiamF2/svlT0L8JQ/c0erHvRXhS6T52V?=
 =?iso-8859-1?Q?O2bnxc1TNW4aJ825UYwT6I9sQxhSbp99EKFXRmjcPyPHrUnSAT0JVYjCsG?=
 =?iso-8859-1?Q?N59lnNaSQWYdEwfTy3TwClvcI/ygKfMUGb6Tbi227Y/QfUdK18WHud512O?=
 =?iso-8859-1?Q?tohGQkF9JP/xpgROyylVJjoJai5Kc63i7sHeF7CKCUR/WhKnhKhiG66neP?=
 =?iso-8859-1?Q?LRMJW4RNAvwNNiHlWprDLPio9dv2vKCsR6qi3UScUn0zqhhenBjMw0FYdf?=
 =?iso-8859-1?Q?dRuHiBzlaM8DyulAZyc7SH2/Kww7OhLyttZx4y/1BHEV/4D3JYHYre7G+u?=
 =?iso-8859-1?Q?0kPBdPdIOtnRYw5aYTztxi7nh4qzsym4QSQrcmY2n2wwu9hd//7WMdDjqu?=
 =?iso-8859-1?Q?iw8TZ3IVcrj4EOAha/vGebJWs7j+Q7lZDWnb6az0w3oHDf73otV0arybHd?=
 =?iso-8859-1?Q?cCb9yiLfYs0C9X5/x53NYLa1my1rmF6AgC1wOzZP9WRxqDqeYmgsbqPmpO?=
 =?iso-8859-1?Q?q/yl0NqHMbH72Ttp82cJbSYWMRejUmIhJpKLMEKuQI6JNl8iQ9/DNSI1cv?=
 =?iso-8859-1?Q?jkpnqsLJHjntFxZnI4ZXyVa70e2ATfgO7G4Gzjc0LhxUkRDrKPQIuRmGgc?=
 =?iso-8859-1?Q?RjQ+dX7Cvca8aLsxSt8xTX7Q7ByDmENkSMDd9h8eyx6/M03dcpJUJlbqzA?=
 =?iso-8859-1?Q?eCdt0PaFX04J+awPjP/uGqY4Rtqb/sjFGcRbObYYBizYG6QvbEjcQrvju7?=
 =?iso-8859-1?Q?bL6Rrhywh8NWr04632dKfES3UgOPPkPkXJXaPRfYsTK1144KVw/ER7TI8I?=
 =?iso-8859-1?Q?RIIrrEOofZL59ANwAz5uzza/7t84qwOHPIdaKjwRGF44BvrR+2G4aj04Br?=
 =?iso-8859-1?Q?i5/KWbdrF/Q/QIxIMF+hqW/0n9Rk3670c0ruYRVZXR7eGGe17zTWWiOpb9?=
 =?iso-8859-1?Q?usvWMkomydvx3liM0ZHQ3W2m3fPseC3UxcEdWeXniKt0UHyVyFuixVDAct?=
 =?iso-8859-1?Q?+BGEqagq2vfM+IA+LBLVbbDENRMwoI+ls4g9EkiFzhu7J5CN+Fsreql4KA?=
 =?iso-8859-1?Q?Pzbk0cDNDvl6LIK1BwfjqdFUDoCPPAsEXmoKa0HKji4Yjns/rzja02AOTl?=
 =?iso-8859-1?Q?TnyNiN8kUE8agbFyaL9Ue3Zt+WsEgni7Y/BTtz58eLY9Lk4WUeYJNkdHpR?=
 =?iso-8859-1?Q?erXhdESQ6ZEOA+oFisVdSo1c4XfHyt0LnhYBNjJty/uGbt9RJ56ukP/0BG?=
 =?iso-8859-1?Q?m7zpa9hMFACcDjuwpWWpYYZumd81GcwJFcLkrbczFUhl+YCGccl+yKyQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a9f368a-691a-45e5-ac2e-08dd82f6b5b9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 06:10:28.0406 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Twqi6uV6GJJVVC9NzLT8GNlZKPLl5n3WEyNmzLNSXSr8+0nTbo+EboQiIgK5TZsT9Hw46eL06od+7+qRIrTKgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6840
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

On Wed, Apr 23, 2025 at 03:12:27PM +0200, Christian König wrote:
> On 4/18/25 18:42, Tvrtko Ursulin wrote:
> > Hi all,
> > 
> > Recently I mentioned to Danilo about some fence lifetime issues so here is a
> > rough series, more than anything intended to start the discussion.
> > 
> > Most of the problem statement can be found in the first patch but to briefly
> > summarise - because sched fence can outlive the scheduler, we can trivially
> > engineer an use after free with xe and possibly other drivers. All that is
> > needed is to convert a syncobj into a sync file behind drivers back, and I don't
> > see what the driver can do about it.
> 
> 
> Yeah that topic again :) The problem here is that this is not a bug, it is a feature!
>

Really more unforeseen design flaw IMO - it happens.

> IIRC it was Alex who pointed that issue out on the very first fence patch set, and we already discussed what to do back then.
> 
> The problem with grabbing module references for fences is that you get trivially into circle references and so basically always preventing the module from unloading.
> 

Yea, the Xe patch holding module ref is a no-go.

> The decision was made to postpone this and live with the potential use after free on module unload until somebody has time to fix it. Well that was +10 years ago :)
> 
> I discussed this with Sima again last year and we came to the conclusion that the easiest way forward would be to decouple the dma_fence implementation from the driver or component issuing the fence.
> 
> I then came up with the following steps to allow this:
> 1. Decouple the lock used for protecting the dma_fence callback list from the caller.
> 2. Stop calling enable_signaling with the lock held.
> 3. Nuke all those kmem_cache implementations and force drivers to always allocate fences using kvmalloc().

Let's document this too.

Xe is an offender, I'll post a fix tomorrow.

> 4. Nuke the release callback (or maybe move it directly after signaling) and set fence->ops to NULL after signaling the fence.
> 
> I already send patches out for #1 and #2, but don't have enough time to actually finish the work.
>

Link? This has been lingering for a while perhaps the community can pick this up.

Matt

> If you want take a look at nuking all those kmem_cache implementations for allocating the fence memory. I think that can be completed completely separate to everything else.
> 
> Regards,
> Christian.
> 
> 
> > 
> > IGT that exploits the problem:
> > https://patchwork.freedesktop.org/patch/642709/?series=146211&rev=2
> > 
> > Different flavour of the problem space is if we had a close(drm_fd) in that test
> > before the sleep. In that case we can even unload xe.ko and gpu-sched.ko for
> > even more fun. Last two patches in the series close that gap.
> > 
> > But first two patches are just shrinking the race window. They are not proper
> > fixes. This is what I want to discuss since I understand reference counting all
> > the involved objects has been rejected in the past. And since the problem
> > probably expands to all dma fences it certainly isn't easy.
> > 
> > To be clear once more - lets not focus on how this does not fix it fully - I am
> > primarily trying to start the conversation.
> > 
> > Cc: Christian König <christian.koenig@amd.com>
> > Cc: Danilo Krummrich <dakr@kernel.org>
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Philipp Stanner <phasta@kernel.org>
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > 
> > Tvrtko Ursulin (4):
> >   sync_file: Weakly paper over one use-after-free resulting race
> >   dma-fence: Slightly safer dma_fence_set_deadline
> >   drm/sched: Keep module reference while there are active fences
> >   drm/xe: Keep module reference while there are active fences
> > 
> >  drivers/dma-buf/dma-fence.c             |  2 +-
> >  drivers/dma-buf/sync_file.c             | 29 ++++++++++++++++++++-----
> >  drivers/gpu/drm/scheduler/sched_fence.c | 12 ++++++++--
> >  drivers/gpu/drm/xe/xe_hw_fence.c        | 13 ++++++++++-
> >  4 files changed, 47 insertions(+), 9 deletions(-)
> > 
> 
