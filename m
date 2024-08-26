Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC2195EC4E
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2024 10:46:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8ACE10E161;
	Mon, 26 Aug 2024 08:46:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VgTMn/EB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B73010E15D;
 Mon, 26 Aug 2024 08:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724662016; x=1756198016;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=VSV1kxCDZsaWMDOqAraLDCFckbHk3ehFx+6fiHZMfFg=;
 b=VgTMn/EBJiyvHsimAab+46TkX+oD7O48tGdnXs+mqXwv0uKUosYf5Pek
 oR7QDzDjMIdPxR/oxzPfBWpygEpYlqkXNM2V41FP3E+swf+pBrn2EX5lu
 GrxSIC3kd5wAA/BXoIqAAWC1pha3FYVmtw5oXbjhCDwkMbmOxICzZBIZf
 93QXT7h6J5dWZ8DlIpCu8Nvyn8T+5KGFC4uGncxayqF/cBdN2Bx1XkDIw
 OtxpNLfJuT+wV9chFXUiIDUvhAUMw7E0llL1UdDcCj8c/k5Zh3YuhUq1N
 rg+MVC1QXtXd5mYfAvXauNKK62zJANME/bfgKaFauIDHLqDa/lKzBmnBx Q==;
X-CSE-ConnectionGUID: ypKCuyvnQtykapR7JkkbrQ==
X-CSE-MsgGUID: gFBuywyQSuacfBeGEA0GrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11175"; a="26836499"
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; d="scan'208";a="26836499"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 01:46:56 -0700
X-CSE-ConnectionGUID: GGfPGDb4TPme5vSrCJmEfQ==
X-CSE-MsgGUID: 43gTcjjuRT2TFQyaYUrA1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; d="scan'208";a="66775685"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Aug 2024 01:46:55 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 26 Aug 2024 01:46:55 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 26 Aug 2024 01:46:54 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 26 Aug 2024 01:46:54 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 26 Aug 2024 01:46:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NRMmRdWzm8eVxY/FbeRmmonXm7CbsQ4LahTYBTnlXjUIdZCg08XrmahEHEddMiJvEspQhAnoGpln4vF6zLMAEtRmcX2eDE00QzUqyjFIcWTfnf7H250oRLiLjFhqOhyV9UHGKM8O/qOOauaRPt+DrDQKyVmoOP/Ebgy6yDvCa28V5An9SkLZqvMJvW2sh8nM/QLgIWCf551przO7dXm1Xjl42bMGVhZ2y/aEPPrN25dg9yqmNv3pxaJJnloF9/gwjCDliLJNPDsnNMH5mmLW3dR1MPltSq8kPngAxwdrMH1Ko2XBFlbMmUiyWUuKlLeFAEkx9RXir4UK3iXh8W/gDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S+vcd7vH/ApJ/HdaC/idnv0UVuSgiQtkmWWLWLBwQWU=;
 b=fHE9JxOXG2mQgFJkRZ6cBFEscw0w2uNCrKt8L/efcbSlnTkSlpgxrVrFWxHODtCZfwmj4pF+oO44uR73AokKst0lPpmqY+aSSs96g0qvFFbQ1KWP9x9pkDb74BOAYt6vDK9SrJRNcMav9DtRtgUwpn7T3qaUBboIpza+h35wRlZKbuyIlTDY4ybBzjP843DQK9DvO9nZqpAGgSQpvr9CT5+lvhrEOtJz7f15gLHpfAQ+IeZQ3SQZJBXbMwO5sx0MMy5UoZafj4w4RawzBupbHwbXoY6DidC+DznqEwATCN/Seetq1wvlw+E1MvK7j2EtXxBUXra5c4vlyHtj0BQldQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Mon, 26 Aug
 2024 08:46:52 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7875.018; Mon, 26 Aug 2024
 08:46:52 +0000
Date: Mon, 26 Aug 2024 08:45:38 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
CC: <intel-xe@lists.freedesktop.org>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>,
 <sumit.semwal@linaro.org>, <daniel@ffwll.ch>
Subject: Re: [PATCH v3 2/2] drm/xe: Use dma-fence array for media GT TLB
 invalidations in PT code
Message-ID: <ZsxAslCG6vJLNNcL@DUT025-TGLU.fm.intel.com>
References: <20240823045443.2132118-1-matthew.brost@intel.com>
 <20240823045443.2132118-3-matthew.brost@intel.com>
 <2657940b-90b3-4abc-9f56-f6c6b70563ec@amd.com>
 <ZsitDqXwHtIBC5ul@DUT025-TGLU.fm.intel.com>
 <1fdc3b61-6694-4d8a-9921-7b323219801f@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1fdc3b61-6694-4d8a-9921-7b323219801f@amd.com>
X-ClientProxiedBy: SJ0PR13CA0238.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::33) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA0PR11MB7307:EE_
X-MS-Office365-Filtering-Correlation-Id: f1c6ecd4-46a1-4599-e09f-08dcc5aba1b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?JIFkMA1zTznC192s+TroYpVdJChz23E695YVs0gLm9pkK/xnP+kDcYv6Yf?=
 =?iso-8859-1?Q?5Z25ifLccn6xPxL2EoyH1Js7i3veBdQ4K8XxUY8dqeUWMo8RsHKrGnMxmJ?=
 =?iso-8859-1?Q?xN9nwQ3dK6uUHOnFQw28bwQdtXYfFso4MCSzYpJAY0oxydCrQZ4B7BARUB?=
 =?iso-8859-1?Q?fnNWkYMDImJIgV6hfm8IiOrwGKfk13mx5ciy5dbztTVSW+G+XSmXd945sN?=
 =?iso-8859-1?Q?fg9ZwXhF7JdJwUxu6c5n80gJA0Ldy/fFRydQg/tF2ykbctlXXrvgoKRro4?=
 =?iso-8859-1?Q?ksYY0ZUpHBBEH36K6G7io0Sw4fKchZM/QZid07MsN4moj4Jo4vRdcRbPft?=
 =?iso-8859-1?Q?E3oCDMGqx6AC3jtvqr1PxvOq2Lfe1e5zoXmlX3NixMP1kU7cZsACOlfbjt?=
 =?iso-8859-1?Q?FYdp5m/iOOVWRa3UEuJwbO1XDQkE+8Z+YO+TtG6dn4yPoPj86BBA0thFbH?=
 =?iso-8859-1?Q?bXlTlz56J+NbN0aWl0Y98becRtedJ4r84g8fJJoyhK+cmjoP7TLvm+oOyj?=
 =?iso-8859-1?Q?OO/5eVex7jkEC0DDGRySDYYDq29UTrweuRpLRgk4h36GJhhKGRbm1j6uBt?=
 =?iso-8859-1?Q?kvYeT3zfLn3bZuwhu8eCUSZfhPNb7UqS1Rhk4huXOfECVjUhqqiF13azT7?=
 =?iso-8859-1?Q?fM0jAE20yGscKKm0BlsNUZHzXAFYjchtslbk58lOIO2kYrt1PzlBvhrCZV?=
 =?iso-8859-1?Q?NC0bCVJLAlCI0AWgMCcWxL2gmtY2A3nFmofgrp6DeMaugkm+j9wdnPmIZs?=
 =?iso-8859-1?Q?sjvchlpjZdlA1OkNT8j1UrK3gq378JGT5iKasjxV8pK+6+m+pMAHSB/9sm?=
 =?iso-8859-1?Q?YJxqYJDwoQNCmLdO3zSBHEwsMUu4RIp4wrEWHy/CvknaterwrByjUDn+Gs?=
 =?iso-8859-1?Q?Zcu22CyQ4IarCR5obw0bC6E8xibOzrSfCMyc+3+NDgcGIE0sEc2og0lRSa?=
 =?iso-8859-1?Q?93BbahHnXubrkQ6yTM3UZHwY72Lw9RPFCx1heFlxcIRW8fGI6xHqlQ3s06?=
 =?iso-8859-1?Q?6X0HQxms8qT4nEsCo6p1nZemaxRw3MF/w3bMro9JqObP1dKFILMnzcjC/0?=
 =?iso-8859-1?Q?uER3BKBGIAH7DvVATdXBg/ClkpyurXWrpA+tvUxxMrGwQZ2Uf4AP3FgMq3?=
 =?iso-8859-1?Q?cUmoScwDnkWlZs+BE5Ka+IK6+sGSMDtZxGNRQftP/TYRHrmK95FAMnWnDV?=
 =?iso-8859-1?Q?eogafQSx5sNPzSwztIp54b11NVdQwEm9vYjClre/uUqAQoeFYHngX00/fp?=
 =?iso-8859-1?Q?xMNFm6KMrpcQdOXG68ZGPi5iSo36QElrXdwns41a0ucm+gyRgTjHDyxpDF?=
 =?iso-8859-1?Q?TbDPpH0YIxwU5HINk+OxH7yG46zrvtlqHcxRLOZ60Hpb1OVJepn5MubWtp?=
 =?iso-8859-1?Q?TLLZsn2aHe?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?op2cTCahncHwrtBf5i7AeRRzqNIuomNtVWKPIRp0fOkkUIJ1NO5fG6kuS8?=
 =?iso-8859-1?Q?zQSgJjfJCL1DP5S52u3jD04vYheBcKIxJOGLFFs8ORQ0QbTgrvokdop/EE?=
 =?iso-8859-1?Q?9jIL+r8yIPfQTzWSOW/GB9eT2frrWoZLBAGJfMHwiiua7QHAllPHaljLXm?=
 =?iso-8859-1?Q?o3dhvmJGvXL/Dq5EfsBvE/b7UDHBXeFN8ROg/0p1e23FxJXEjzlfGu13+7?=
 =?iso-8859-1?Q?Q4PCbg1ODqAymFtR4FVNL2ICcKx93kxGUzQlnPV+EjDTukUeLucxtluLVM?=
 =?iso-8859-1?Q?y69kDwUrKyR/TeB/qN6cjmGzJGOyeUJa7Bmu8cGjbP1Pid7c5ytvKXzvdk?=
 =?iso-8859-1?Q?6elVDjUemBRL+C1x4ace+HVvxQJRIUOzlOHyFim2Bs9yB0+GAO2IV7RNSm?=
 =?iso-8859-1?Q?w2uUAYpY3kDXmiT5cCDlDm3Xm3nC3LRHwwIe1eE4x55S7ZpeyqY03DNpiY?=
 =?iso-8859-1?Q?Mez/mc1yCALcyZh7XuyZ36DCtCvjEbFaKRBH3Ntn5LR4Y/FvEFAnNyRMgN?=
 =?iso-8859-1?Q?Wm0PO+EB1VtCTBZFwd//MZWlhPKoK+NasGEV8FRKB4oZ+jgbjnkA+zNYpF?=
 =?iso-8859-1?Q?gCl7jeHLEJTS6IcNRct6lQb82sX1IktyiTsGqMA2mPNHT9jnOmaiBRgR+W?=
 =?iso-8859-1?Q?yzAVAViul4rA9SbBClqdgUxohN/y/VFSmz8zmW7PADTFr9nzrFbjGihSye?=
 =?iso-8859-1?Q?HSruz3669UZAyt0qOQt6cbY5Winx5g9FIglsL8Sg51J+gVCmt/SV/HugQY?=
 =?iso-8859-1?Q?UhV1twYl3dDJy/iVBDKMXkXHFwxbJ7AqsmM+rELi2Y2SGSCnkc6SXLD7JI?=
 =?iso-8859-1?Q?oZQKy2P6X3nKkoVJnfepqGf5x27g+yKIK6jQS61nmenYgekdSVS7kcSblx?=
 =?iso-8859-1?Q?FdmIoRH8HRBQbZCyyaii0JEwAq/TccdsNMXRb/k2SVGKOEZs7xr4vzy7F3?=
 =?iso-8859-1?Q?7e1mdTUWEz9/dnyENrD2rsn/pwrS3rpmQ9Txp5q4WAtvmYzUZWfyLQux/i?=
 =?iso-8859-1?Q?cWOJT94eVwpSh6IEmiuOKAksJlMRN9FOHWsUFXCg7UXpdGCRAD4kft80lR?=
 =?iso-8859-1?Q?15Yl0raS8IsoFiULb8hRXM0U0ysTvGJJbhAM6Nud0crVfTBSdyxxWlMbTq?=
 =?iso-8859-1?Q?hjsST2jV8feA50vSrwobvztvSulvamMM72tfKHyLW+e2ksEhcFYRUUGqiz?=
 =?iso-8859-1?Q?D32qveqC9xz/6NrJ37X06VOxegDYK6k2oY0Y+hUHqJfclpzht3vFS0A1uC?=
 =?iso-8859-1?Q?lHmAuR7ZaMx/OiS2KL843cNwJBbOwW9s56aqJkYPT85h3CCM/xR5f+TZNx?=
 =?iso-8859-1?Q?OieAF2T6Hk5H/bVcVNf8rnA8sGV1j0LLmOnNN3GGwD8lJqeliRo9qHS5dL?=
 =?iso-8859-1?Q?/HZ0BuosRpEioSRlf//mGEHGK6Mlh0SEyuaVg79cY25th+n+8o514Nq1WP?=
 =?iso-8859-1?Q?HUeCfk/zPYcOdeVhU3zw22bO6wJP80g66u5gTZfv8IXce71PZ9b2wO64QW?=
 =?iso-8859-1?Q?tfg//qBgMD8lzda98Dh3ntjJVRaolQukTe2mnesfWCzmxLip/ssqdybln1?=
 =?iso-8859-1?Q?B7WoVAdpSB068hggux/uzcn+3ioY3kteL+NVP1eOrGSqGeY5vELq4ywi3V?=
 =?iso-8859-1?Q?uW2xNObeowLL2xtGdnk4eNoVepX8K516r+lBy8VjScOxWPtcYhyW9R0A?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f1c6ecd4-46a1-4599-e09f-08dcc5aba1b4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 08:46:52.3768 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RM0pPsANEqA8Ntx7ELqWpt9w3ONLlLvxaTfDset++WrfbRIRzr1LjA9LpLcXj5OCGt0UtEuU9VSGvsu5mN6r2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7307
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

On Mon, Aug 26, 2024 at 09:43:40AM +0200, Christian König wrote:
> Am 23.08.24 um 17:38 schrieb Matthew Brost:
> > On Fri, Aug 23, 2024 at 08:40:40AM +0200, Christian König wrote:
> > > Am 23.08.24 um 06:54 schrieb Matthew Brost:
> > > > Using a chain fence is problematic as these cannot be installed in
> > > > timeout drm sync objects. Use a dma-fence-array instead at the cost of
> > > > an extra failure point.
> > > Mhm, IIRC we converted chain objects into dma-fence-arrays while installing
> > > them into a timeline.
> > > 
> > > Doesn't that work any more?
> > > 
> > Thanks for the quick feedback.
> > 
> > As is, installing a dma-fence-chain into a timeline sync doesn't work.
> > 
> > The 'fence' returned from 'xe_pt_update_ops_run' is installed here [1]
> > as the 'fence' argument. This blows up here [2] [3]. It does suggest in
> > [3] to use a dma-fence-array which is what I'm doing.
> 
> Ah, that makes it more clear. You are not using some IOCTL to install the
> fences into a timeline but rather want to do this at the end of your
> submission IOCTL, right?
> 

Bind IOCTL, but correct. Submission and bind IOCTLs in Xe are
conceptually the same wrt to syncs.

> > The issue with using a dma-fence array as is it adds another failure
> > point if dma_fence_array_create is used as is after collecting multiple
> > fences from TLB invalidations. Also we have lock in xe_pt_update_ops_run
> > which is in the path reclaim so calling dma_fence_array_create isn't
> > allowed under that lock.
> 
> Ok that is a rather good argument for this.
> 
> Just tow comments I've seen on the code:
> 1. Please rename dma_fence_array_arm() into dma_fence_array_init()
> 2. Please drop WARN_ON(!array, a NULL array will result in a NULL pointer
> de-reference and crash anyway.
> 

Will do.

> > I suppose we could drop that lock and directly wait TLB invalidation
> > fences if dma_fence_array_create fails but to me it makes more sense to
> > prealloc the dma-fence-array and populate it later. Saw your response to
> > my first patch about how this could be problematic, a little confused on
> > that so responding there too.
> 
> Yeah people came up with the crazy idea to insert dma_fence_array objects
> into other dma_fence_array's resulting in overwriting the kernel stack when
> you free this construct finally.
> 
> Additional to that Sima pointed out during the initial review of this code
> that we should make sure that no circles can happen with a dma_fence.
>

Ah, yes. I could see how that could be an issue.
 
> But we now have a warning when somebody tries to add a container to a
> dma_fence_array object so that should probably be fine.
>

See the warn and agree this should protect against this type of problem
code.

Matt

> Regards,
> Christian.
> 
> > 
> > Matt
> > 
> > [1] https://elixir.bootlin.com/linux/v6.10.6/source/drivers/gpu/drm/xe/xe_sync.c#L233
> > [2] https://elixir.bootlin.com/linux/v6.10.6/source/drivers/gpu/drm/drm_syncobj.c#L349
> > [3] https://elixir.bootlin.com/linux/v6.10.6/source/drivers/dma-buf/dma-fence-chain.c#L275
> > 
> > > Regards,
> > > Christian.
> > > 
> > > > Also fixup reserve fence count to include media GT invalidation fence.
> > > > 
> > > > v2:
> > > >    - Fix reserve fence count (Casey Bowman)
> > > > v3:
> > > >    - Prealloc dma fence array (CI)
> > > > 
> > > > Fixes: 40520283e0fd ("drm/xe: Invalidate media_gt TLBs in PT code")
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > ---
> > > >    drivers/gpu/drm/xe/xe_pt.c | 34 ++++++++++++++++++++++++----------
> > > >    1 file changed, 24 insertions(+), 10 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> > > > index 6c6714af3d5d..2e35444a85b0 100644
> > > > --- a/drivers/gpu/drm/xe/xe_pt.c
> > > > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > > > @@ -3,7 +3,7 @@
> > > >     * Copyright © 2022 Intel Corporation
> > > >     */
> > > > -#include <linux/dma-fence-chain.h>
> > > > +#include <linux/dma-fence-array.h>
> > > >    #include "xe_pt.h"
> > > > @@ -1629,9 +1629,11 @@ xe_pt_update_ops_rfence_interval(struct xe_vm_pgtable_update_ops *pt_update_ops,
> > > >    static int vma_reserve_fences(struct xe_device *xe, struct xe_vma *vma)
> > > >    {
> > > > +	int shift = xe_device_get_root_tile(xe)->media_gt ? 1 : 0;
> > > > +
> > > >    	if (!xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm)
> > > >    		return dma_resv_reserve_fences(xe_vma_bo(vma)->ttm.base.resv,
> > > > -					       xe->info.tile_count);
> > > > +					       xe->info.tile_count << shift);
> > > >    	return 0;
> > > >    }
> > > > @@ -1818,6 +1820,7 @@ int xe_pt_update_ops_prepare(struct xe_tile *tile, struct xe_vma_ops *vops)
> > > >    	struct xe_vm_pgtable_update_ops *pt_update_ops =
> > > >    		&vops->pt_update_ops[tile->id];
> > > >    	struct xe_vma_op *op;
> > > > +	int shift = tile->media_gt ? 1 : 0;
> > > >    	int err;
> > > >    	lockdep_assert_held(&vops->vm->lock);
> > > > @@ -1826,7 +1829,7 @@ int xe_pt_update_ops_prepare(struct xe_tile *tile, struct xe_vma_ops *vops)
> > > >    	xe_pt_update_ops_init(pt_update_ops);
> > > >    	err = dma_resv_reserve_fences(xe_vm_resv(vops->vm),
> > > > -				      tile_to_xe(tile)->info.tile_count);
> > > > +				      tile_to_xe(tile)->info.tile_count << shift);
> > > >    	if (err)
> > > >    		return err;
> > > > @@ -1983,7 +1986,8 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
> > > >    		&vops->pt_update_ops[tile->id];
> > > >    	struct dma_fence *fence;
> > > >    	struct invalidation_fence *ifence = NULL, *mfence = NULL;
> > > > -	struct dma_fence_chain *chain_fence = NULL;
> > > > +	struct dma_fence **fences = NULL;
> > > > +	struct dma_fence_array *cf = NULL;
> > > >    	struct xe_range_fence *rfence;
> > > >    	struct xe_vma_op *op;
> > > >    	int err = 0, i;
> > > > @@ -2022,8 +2026,13 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
> > > >    				err = -ENOMEM;
> > > >    				goto free_ifence;
> > > >    			}
> > > > -			chain_fence = dma_fence_chain_alloc();
> > > > -			if (!chain_fence) {
> > > > +			fences = kmalloc_array(2, sizeof(*fences), GFP_KERNEL);
> > > > +			if (!fences) {
> > > > +				err = -ENOMEM;
> > > > +				goto free_ifence;
> > > > +			}
> > > > +			cf = dma_fence_array_alloc(2);
> > > > +			if (!cf) {
> > > >    				err = -ENOMEM;
> > > >    				goto free_ifence;
> > > >    			}
> > > > @@ -2068,9 +2077,13 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
> > > >    			invalidation_fence_init(tile->media_gt, mfence, fence,
> > > >    						pt_update_ops->start,
> > > >    						pt_update_ops->last, vm->usm.asid);
> > > > -			dma_fence_chain_init(chain_fence, &ifence->base.base,
> > > > -					     &mfence->base.base, 0);
> > > > -			fence = &chain_fence->base;
> > > > +			fences[0] = &ifence->base.base;
> > > > +			fences[1] = &mfence->base.base;
> > > > +			dma_fence_array_arm(cf, 2, fences,
> > > > +					    vm->composite_fence_ctx,
> > > > +					    vm->composite_fence_seqno++,
> > > > +					    false);
> > > > +			fence = &cf->base;
> > > >    		} else {
> > > >    			fence = &ifence->base.base;
> > > >    		}
> > > > @@ -2108,7 +2121,8 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
> > > >    free_rfence:
> > > >    	kfree(rfence);
> > > >    free_ifence:
> > > > -	dma_fence_chain_free(chain_fence);
> > > > +	kfree(cf);
> > > > +	kfree(fences);
> > > >    	kfree(mfence);
> > > >    	kfree(ifence);
> > > >    kill_vm_tile1:
> 
