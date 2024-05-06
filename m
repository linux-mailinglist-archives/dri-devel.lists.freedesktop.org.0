Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EFD28BD845
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 01:51:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42F3A1120E1;
	Mon,  6 May 2024 23:51:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eSIN4uXs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E60AA10FF02;
 Mon,  6 May 2024 23:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715039476; x=1746575476;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=P152k/LMykE1K1haoNZY6lvduKc43kfEvKrm9waqiNY=;
 b=eSIN4uXsZ1AmRTM32AgsL1LXQSoXAmB/yl6r6F9dM7rXtsCqK6huURWC
 zPIX7vgkq53VSRm1UGSVe9JrGLY17kV/6bI4Tj3Qm7VXDdAVA8JFKdUUJ
 edCVoKfNt+qkPVV6gRxgDFzB5P90qoes7J3oGOIleyzu+fmgxWCMtAypx
 diwaApMVkQR/ELZ73bNuD/3bcWIkqO2XDJBTD/2O/k6WK8qe3WcCSHuF9
 Dc5Da6l2IrY/vdl5Axa1P78EkbBpHfGix2P2VAMDS24FKkZWjbsAi0Dcp
 iqutcnOjJyec6WkSnsu/OcgZW/Wn06OXE2/7Lnccyp7re5LmwYRq8XzDv g==;
X-CSE-ConnectionGUID: de4Xs0bxSZa3FR7PDiW5PQ==
X-CSE-MsgGUID: ncmYv4b/SQejAspRHXEOXA==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="10644325"
X-IronPort-AV: E=Sophos;i="6.07,259,1708416000"; d="scan'208";a="10644325"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 16:51:15 -0700
X-CSE-ConnectionGUID: BQSXbEs4R4ykD11qXj65LA==
X-CSE-MsgGUID: 170nrSr/QWuHmjWnSEkKWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,259,1708416000"; d="scan'208";a="33127558"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 May 2024 16:51:15 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 6 May 2024 16:51:02 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 6 May 2024 16:51:02 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 6 May 2024 16:51:02 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 6 May 2024 16:50:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MwDW1gWPoDPyMonZQ67ni77GNunCe3w4radkchDuPOWStWC9g1EJtUxRUpjux+1uhPx2HkEA0CbgLU09NK8e95movV3WSaTX3JBRzOj/ZX7O5HyFbFObgwO8xvlaS4SC3fExKD1sbifaA8XPIX4KMCTBRQeZfrFF2DFPSlmnPNtImGhuOF19mGaxsaJWaAVoSpEz1gpXiecSK4QdYTIO519PSKyuPAg6IEjiHveMtifUl+PAeHSikqXx2VLbtmwTdMPwbXShGsWldH4st5/TovIjd5mb6SgbdBGO46q5x4U6thukhiDIK6kBRWGaj/tH5e5zsMwNHO7fB6PVIt287Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6jXiAlhd6lge5T0IuAPayw8lGLHsJbtSrr9ExIjllV0=;
 b=ig6ibOuGyGIE0+XmvPWOWXlPkGcV7X4gY68SqHqJnyyo+2m5qaaOwMc/36I/onaDBVeDeEApb+qspc7cJFMqVPpW9qBjvXwiY8dbRyE1/x923URRNKgW9N12NfFNia9SvaKYcQPvzzhi3JS5MNrR8fQl4GguAT/1Ds+GZ5rPkluLVwI3pfMNTGA3Ir2Zc3fj057SM34/PFotVctmKfBqzPhuf8ScB60iGUvIDqd/5WJjYuBw+r9/9aNJI2oihEOXcwLx7B+HU33cBovchfyqVHlGmlvMqPEIRzzHhCMA+/af9WK/fTnUaWqGlUs7yC7SJhRFP+nZ+PdIXqXGfvgV5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7192.namprd11.prod.outlook.com (2603:10b6:8:13a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42; Mon, 6 May
 2024 23:50:48 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.7544.041; Mon, 6 May 2024
 23:50:48 +0000
Date: Mon, 6 May 2024 23:50:36 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
CC: Dave Airlie <airlied@gmail.com>, "Zeng, Oak" <oak.zeng@intel.com>, "Jason
 Gunthorpe" <jgg@nvidia.com>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "Welty, Brian" <brian.welty@intel.com>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Bommu,
 Krishnaiah" <krishnaiah.bommu@intel.com>, "Vishwanathapura, Niranjana"
 <niranjana.vishwanathapura@intel.com>, Leon Romanovsky <leon@kernel.org>
Subject: Re: [PATCH 06/23] drm/xe/svm: Introduce a helper to build sg table
 from hmm range
Message-ID: <ZjlszJcn95Ke9e9o@DUT025-TGLU.fm.intel.com>
References: <93fca752517f0120baa770992fd0f9160b0c14d1.camel@linux.intel.com>
 <20240502124632.GB3341011@nvidia.com>
 <0b700baf6fc3d41b4adf6301b1b4dbc4ff7078fa.camel@linux.intel.com>
 <SA1PR11MB6991945628597BCD9D111ECD92182@SA1PR11MB6991.namprd11.prod.outlook.com>
 <20240503133732.GD3341011@nvidia.com>
 <SA1PR11MB699156AB3B2603DF1762BEA7921F2@SA1PR11MB6991.namprd11.prod.outlook.com>
 <20240503162812.GF3341011@nvidia.com>
 <SA1PR11MB69911B3E675B1072A17A3E49921F2@SA1PR11MB6991.namprd11.prod.outlook.com>
 <CAPM=9tw0w4fY3+fHV4kx8oGUvSM3vzH4KXKFDxg_aqBq4duSsA@mail.gmail.com>
 <ZjjVT-iZvsKrmoaW@phenom.ffwll.local>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZjjVT-iZvsKrmoaW@phenom.ffwll.local>
X-ClientProxiedBy: SJ0PR03CA0177.namprd03.prod.outlook.com
 (2603:10b6:a03:338::32) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7192:EE_
X-MS-Office365-Filtering-Correlation-Id: 0efe2418-d444-48ae-39f6-08dc6e275a6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OayAF+NgzNneVxeyny1IuWvAGuZVxkyrllWY8vFdsLsxGvhixBwJg0N24wDl?=
 =?us-ascii?Q?Zxn2Y5g9rvDYQ7ARNsue6xTEHDAL9GF7P1QoFTXDbVC7jQu6RxaEQsxrNXXL?=
 =?us-ascii?Q?N/st43KLZH2w+vlppLhWrpAZYoYTlbPQZpdjhKUQeirNiV+fta3npveFU9BV?=
 =?us-ascii?Q?UZaU09eqbiuMEh0neZ66EtHJlNhIsJOn0gfVK3VmVxaRYm8SDWyibLJp3W8o?=
 =?us-ascii?Q?17pJT0gINTNq+TOP9scYyfOSONMpy/15rRKczi6BXck/gka7rei8Pc3uCWR+?=
 =?us-ascii?Q?7auatQOOm93WB0nsbs/6Ih2QoszOR49iQsPwuF/DwFQNiFQy3RIEdfD2PLmq?=
 =?us-ascii?Q?hgDfchXxqb2/9cX5h/nA5B+I4egvKLUFW6BItzbmVzWsMZslT78/VnIXQYoB?=
 =?us-ascii?Q?Pli1ggCOy2KCurkAl9PeMS55f95yzVNLtHMJH8/s7B66lOTRFmEjuAymb5EB?=
 =?us-ascii?Q?WE9Fp79dkq8Hpijq8Phi0csDkz01dFONOEg6g1f8CK2C6jXmRt/aaaZSx444?=
 =?us-ascii?Q?008DhBJ+rCOHVhwf4eG+ZppBiLRgDoHDpCdycZMVAKPSCs4KIQrkSy9/xxNS?=
 =?us-ascii?Q?ET+VyGkxdn4O+Q5RqAEtH3JfuDH2J+kj6exugDtY+Q+VXEjrrLGA5Yvx10JP?=
 =?us-ascii?Q?3dmRsnW1lOFLIhFcgoyIHJN7SxK6tnWEqs8kwdvnQ0Diw1Hb7z2YI3jVP6sr?=
 =?us-ascii?Q?ZR+8rWUptCiXn7jC5cSMhUWPj156wtAiBg5SOcCWEPJ1FfpoZywsXVyZaEZD?=
 =?us-ascii?Q?lPEgkkpxcSR5w/F1FfAzF166tTyMWDPjkB5ZOK0lXbvnK7Ue6Z3Czc/O9ufA?=
 =?us-ascii?Q?JxXtcG/ZOiq/hngOnDCl7j2VX99yvxCk2cR/zEcJ8nNfUCSBGJleCAIg7cgn?=
 =?us-ascii?Q?ms1pa1FI27rY1zQ6R1FHiLrcAuwUrwLANAtA5Y1YZy9TL0vLD6TccpQrMnKp?=
 =?us-ascii?Q?Uh3YSVVfBRLY1Ig0LWKP9m4ZtMq4l54MaMGe6lU0/ayOlHt7k242T2pHs4N7?=
 =?us-ascii?Q?sQJU2TzIIY4qmqypm8MCTO0Q0r4/LMhCKmIGgzls5Cx2/JPk1QAEdT2O2sO9?=
 =?us-ascii?Q?8KeEqcE0BIhYru2ZF6/T2e2zt/mJ7H7qmW8lxondGcBvN9s9bx9bwSznZgnu?=
 =?us-ascii?Q?NAEOaZgO3x95qjN4bYg7wyufqFUY7f4n8MDRTE+ZaxTEZGcLYS/hnADtuVKH?=
 =?us-ascii?Q?0azoQ3eHuky7BHduRO1IHnIqDnm/CPM8HArJsv+/DQlmXCrzkD40zb0vlCc?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?o+ly7fgdxbaHpSR4L1VyyDGkhRWE0VRbB7IP68mkG8G1TTmZXUwqIG+CqBs9?=
 =?us-ascii?Q?Cs81hNXpp/YDkhNNwjPFYDikuf1qnyd4RM/AcLhr6L7ZaHQmGFepqyGEsI9S?=
 =?us-ascii?Q?wkvdvjbs8hQj/IVwa6RzTmeMoWmp8m/Q1GOmdWQF5MByqtzXlBR0c6egiWRe?=
 =?us-ascii?Q?BmaXbjWb3jTzssHZ6QQ/KojwT17uDPRbEsPjZAA+GJHo6MIPUZtQyovNZPB+?=
 =?us-ascii?Q?xO1xIbVmHUphXGVOwVczYRYEVRDP3CWKQ0jH+g+u+GZPEqV8L9/iXRva/1qS?=
 =?us-ascii?Q?NhPIlaWFIZ9YsnybeEW8fmtLDXoD11L/GdqmQlysojsKDhQjEW+f7EQdhCDj?=
 =?us-ascii?Q?1d58591vhu+TfotzKkWRtDrM6L8YuuwD8pLjrhNnnAZnWYwk2xPcVGTJEbei?=
 =?us-ascii?Q?LXNb/iwJwvmUv/9Yw7fbSz3SlXSM1J/Pi/Nd1YYBWO82/OHbk/7NZEC34qmg?=
 =?us-ascii?Q?rkdJwwhxQ0KmLTO9SFcqOI9JbLhErx+JONr1IVddao/ycsF9YbucLy/rvV9Z?=
 =?us-ascii?Q?QcDBA6MnnKTVW1fYAyAXa0rmKu3Wh1v6hkM0HFPq8Hf8ylpM/becXSqYGehl?=
 =?us-ascii?Q?/fw3bj/xvChSx1B/VgmAMIHXWp92jssIxtL4MDBQxMAVggtcNPruamwv/hcz?=
 =?us-ascii?Q?c39Pi+rI5AhRrhYw6Rb2qqr+craDJEalp4jV4IgOPrt1402goEUkdJ/T7igt?=
 =?us-ascii?Q?q9VK2nN9dNbSXkUICJiQxnA4nGHh1fKa3nClm+Ab7oQVX/LVuG1L03FBTiOk?=
 =?us-ascii?Q?EWwgAWTAadcG+my0LVVhGcKSlxdD/z8k0sL5S0+BejWST5qZ1Z5ifC0cQHOU?=
 =?us-ascii?Q?oOcYpPbY2nzBQKgE2msJI+jC8U6m/lCpJTsfJw++Ph8vEotRAFV+5CDsacUH?=
 =?us-ascii?Q?VpZJ3m9uwfJtofq3BzCROg8vina3fwbpENs1cNpjM7Sbk+fQcr4VUQQBR5Xa?=
 =?us-ascii?Q?GqFd/mDBdymLghefOmLVdJThiPbg1p6XZRtamuThm2198xgI8xteYEQCPAY6?=
 =?us-ascii?Q?5W7V3JdYD69ai9cm18HvMO5ZcryN24KZU9ipC95ECw3o8+xeD73tRJHfFWfd?=
 =?us-ascii?Q?8yaNI+/0Y59xUB1zrIbFTRUiIwAan8D3vaD9cQqyJ6Zqr1Th+jLTWCyZkNo3?=
 =?us-ascii?Q?Wl7W+xrV//vLeVLUP4jhS0KsanyB1c1Xl6ilPUwjT8vTmzP79eFkGrTf9/Oi?=
 =?us-ascii?Q?kaFJ5FIou+WmrKVd+asB1VFlAzclcaMOJH2LiqLqWfYGUl15Syl0TgRuw5c1?=
 =?us-ascii?Q?O0axSnmJWaoatOfxm5XfkQ9xkhBe5cDn/zXKg3Wi7PhQAZEjIvrhIsAIuwMr?=
 =?us-ascii?Q?tHq39QS2R6fuXU5amuAenP1c8/zBj5UNDBBrZwlXAgg1F0X0F5fWbYusyuvW?=
 =?us-ascii?Q?sykkivXMRMeVbOSnq0o/z5cNch0bG1MMWTNUGOtkx8P6U7SDS1DJC9AOffcE?=
 =?us-ascii?Q?uyWqYmGhwS9HWw+vShuQNxIwB/VfHfP2akUKqb7FFal3aiKAZ0YLQhmmB6uU?=
 =?us-ascii?Q?IeEFPBKbGCgu7LJxW8TCc6MtYh7xNnQ3xp50MBl7+QuFOem6BydACnA+6Fka?=
 =?us-ascii?Q?3aUqOZtI/Rg6dGXr0pNf1nhSzYHkqHfB+rs92B7v/vknSeL3dbxNStvfCIbK?=
 =?us-ascii?Q?zg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0efe2418-d444-48ae-39f6-08dc6e275a6e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2024 23:50:48.1867 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TocUXH70VdosUTJF2E1nIzTyVO+2Q+m943kvSSHefpqVhxvpGlHRK7cvZPAhhBsKgqMoTIkWGd0XPVqCZzp1rQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7192
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

On Mon, May 06, 2024 at 03:04:15PM +0200, Daniel Vetter wrote:
> On Sat, May 04, 2024 at 11:03:03AM +1000, Dave Airlie wrote:
> > > Let me know if this understanding is correct.
> > >
> > > Or what would you like to do in such situation?
> > >
> > > >
> > > > Not sure how it is really a good idea.
> > > >
> > > > Adaptive locality of memory is still an unsolved problem in Linux,
> > > > sadly.
> > > >
> > > > > > However, the migration stuff should really not be in the driver
> > > > > > either. That should be core DRM logic to manage that. It is so
> > > > > > convoluted and full of policy that all the drivers should be working
> > > > > > in the same way.
> > > > >
> > > > > Completely agreed. Moving migration infrastructures to DRM is part
> > > > > of our plan. We want to first prove of concept with xekmd driver,
> > > > > then move helpers, infrastructures to DRM. Driver should be as easy
> > > > > as implementation a few callback functions for device specific page
> > > > > table programming and device migration, and calling some DRM common
> > > > > functions during gpu page fault.
> > > >
> > > > You'd be better to start out this way so people can look at and
> > > > understand the core code on its own merits.
> > >
> > > The two steps way were agreed with DRM maintainers, see here:  https://lore.kernel.org/dri-devel/SA1PR11MB6991045CC69EC8E1C576A715925F2@SA1PR11MB6991.namprd11.prod.outlook.com/, bullet 4)
> > 
> > After this discussion and the other cross-device HMM stuff I think we
> > should probably push more for common up-front, I think doing this in a
> > driver without considering the bigger picture might not end up
> > extractable, and then I fear the developers will just move onto other
> > things due to management pressure to land features over correctness.
> > 
> > I think we have enough people on the list that can review this stuff,
> > and even if the common code ends up being a little xe specific,
> > iterating it will be easier outside the driver, as we can clearly
> > demark what is inside and outside.
> 
> tldr; Yeah concurring.
> 
> I think like with the gpu vma stuff we should at least aim for the core
> data structures, and more importantly, the locking design and how it
> interacts with core mm services to be common code.
> 

I believe this is a reasonable request and hopefully, it should end up
being a pretty thin layer. drm_gpusvm? Have some ideas. Let's see what
we come up with.

Matt

> I read through amdkfd and I think that one is warning enough that this
> area is one of these cases where going with common code aggressively is
> much better. Because it will be buggy in terribly "how do we get out of
> this design corner again ever?" ways no matter what. But with common code
> there will at least be all of dri-devel and hopefully some mm folks
> involved in sorting things out.
> 
> Most other areas it's indeed better to explore the design space with a few
> drivers before going with common code, at the cost of having some really
> terrible driver code in upstream. But here the cost of some really bad
> design in drivers is just too expensive imo.
> -Sima
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
