Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2826EC8797D
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 01:31:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FFB610E4BE;
	Wed, 26 Nov 2025 00:31:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KKi+e1Jt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0A1510E4BB;
 Wed, 26 Nov 2025 00:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764117098; x=1795653098;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=mIYjLZTh1yEHKhP+oaNc16VVXy1Tb3Qo7Def7vPqBfE=;
 b=KKi+e1JtFA584CSBR7fBuyFCYQTwNFp9l5mG87CrdgNf4sa2p2NQfm/K
 x0wlj2JlNJ8BKBru3lrmXo0ZXPOosxtg/cVxKpHDGB5vO8wV+hXyQbnhZ
 ROymYnXTDfW5qrEB2UMTQMvblk55YFeecq2h4If4S77+MGjX+5yGPpxaM
 qAPM7n354EZT9hJghlgLbPuTinhl07DXtxwxEg/aTH8BmHXQ5hTjiXTY9
 Gph7JFNLGS/1pGve2p0I4dvMzwOdjtApRM2FYPmlikxstcOPgLhtWTzlW
 jVpkVzvbK2wdkZJzcelt2MmoIEX3g+lZv7Ds72yDaKetS2expk4I+mioF A==;
X-CSE-ConnectionGUID: LojMMmmWS5Kl0/PrLFLS6Q==
X-CSE-MsgGUID: 41HgCI4RTMuEXX2P81gHDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="83757381"
X-IronPort-AV: E=Sophos;i="6.20,227,1758610800"; d="scan'208";a="83757381"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 16:31:37 -0800
X-CSE-ConnectionGUID: 4FAt8cCqQ+WaaC0pYKejnQ==
X-CSE-MsgGUID: aWn1v0FnQ5Wf5dyvkYXAmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,227,1758610800"; d="scan'208";a="193229930"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 16:31:37 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 16:31:36 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 25 Nov 2025 16:31:36 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.46) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 16:31:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L8okXA5mBwENWC/ekHtyicco8ir3HHmvoO6m4QvsKkGQ4MWYkHlRQdX65mTaou+1l1XwnTNhxBaZqjnKyhfQtbMZQoqT5H5PF2dGgNAyVZF8AQ9MzOjzjK/a/pXnLuFR4M/dX1DoRVAue8TNXeQo47OL3Be0Ic06kz45/KP+2/+23eVu2aEKWVooMoISords4eHsbdfZLMZatWTNvrsNBUazkPSR+WkQI5YC6SrVUJDlrmlR1/Vi/6i0Zm3IgTexo/5aoBy5Az6qVjOjRhBngbGTz2MCciaMx9n/vx0zW9Ixd1mdYbEAm5d7zyuauNuK7D9YZ2HBjQR3Kh5gtUXOGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r/FtrLKzXh3vxhzqQ5rEVPNFGjiIEosj6bzYeY5KTQQ=;
 b=s6Jk+Ej7DYb3mvoL/h/C4MLFOOdIPCX+i/iPxlQidtfY8PAxu73XG4M7hzAoa4X7vnZnOkVR4sWAGJWoH2GL0Ktc5tdCL4qjaQnLnlEd3OX4rzGKH1gwIw8BwqPOL6MCrO9Qd3r0R/2V6DhSjylb1NQ4Qj+APNOa+FBI1GN8L2Yo6pDFrzNDItS2KI8yzwrI2UZF/+ddF68Pm6q2tBpta76In9XWukB66KrCV+DoWNm/MPmdy19SgtfV+0r6N4ThYeJa5lp8XP3cmLoXToorjYXdWHsXTzIFtuFQPMjv4Z6RzpbxXY9zXmTb+JkhfUqKnabUNs0w+dIC8oRpCYmPew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB7667.namprd11.prod.outlook.com (2603:10b6:806:32a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Wed, 26 Nov
 2025 00:31:33 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9343.016; Wed, 26 Nov 2025
 00:31:33 +0000
Date: Tue, 25 Nov 2025 16:31:30 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <himal.prasad.ghimiray@intel.com>, <apopple@nvidia.com>, <airlied@gmail.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>, <felix.kuehling@amd.com>, Christian
 =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, <dakr@kernel.org>,
 "Mrozek, Michal" <michal.mrozek@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>
Subject: Re: [PATCH 09/15] drm/xe: Pass a drm_pagemap pointer around with the
 memory advise attributes
Message-ID: <aSZKYt7mDNM+4AS9@lstrano-desk.jf.intel.com>
References: <20251025120412.12262-1-thomas.hellstrom@linux.intel.com>
 <20251025120412.12262-10-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251025120412.12262-10-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: MW3PR06CA0017.namprd06.prod.outlook.com
 (2603:10b6:303:2a::22) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB7667:EE_
X-MS-Office365-Filtering-Correlation-Id: 75cde294-8763-4626-60b0-08de2c83266b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?HZ118uybrIAhf1sYuVUfeGaJ8HxWvyIis7yiE1WQWiryQENvVJ+sXqv2FM?=
 =?iso-8859-1?Q?y0TLdqzSXxXlCNDzIlHMBT+D/l1nGAkhrCrk0jkI+2sQUujYeon6/1jp3U?=
 =?iso-8859-1?Q?WqltkR4uOIt9oma2NnhGcQ8iGMswFrmCbqBc92aDZ4Tz3BAx2jWUggbba4?=
 =?iso-8859-1?Q?o0Ud8/8tmqSmsGUI3koiTpzbl060rDcXecHckG9ex3NZo2DMiF48D1QfFO?=
 =?iso-8859-1?Q?hWSKqGJw35aWH4xsOc01P1HOVZgP9xGIN08fJqBOWWGtHRBC2sCPMMQiEQ?=
 =?iso-8859-1?Q?+UPXGUO+NcTS8/rnJQ/YD/vrszVzgls4d6ltL8Soszq1h2Pe+FqzZPsOkv?=
 =?iso-8859-1?Q?dNL9aiRPvfZ4LrPKgT++bMkgrp2aUMhr8BKzccD/ff8fTf9lUhHrvSg0O6?=
 =?iso-8859-1?Q?5a1YC84qV2hanpJlTkoV4pSX+/M8I+LQ2R33pG81/lKf4NJcNWXKgYDn4q?=
 =?iso-8859-1?Q?L+LSeVJoR7E6jvg3p/h0z9e7QqdCG8xbx5t02DzJRbhha4xSJM6cydByrg?=
 =?iso-8859-1?Q?3bKKtWjfcJqrEKUq6v/VKDvu9JbTtUDhdoII5oa2UPcddpHuLc8M+xg96m?=
 =?iso-8859-1?Q?rYg0Rzc46XGSNUuBMWAnsuGgBec5wimmOMbOqVVkK6laLcXk76mRDSLHmm?=
 =?iso-8859-1?Q?kzqlpBColn6M+4uOFMsWg5bBPJHtXMyFRKmrTD4bpNpoDMajgufa1M/Rax?=
 =?iso-8859-1?Q?4QDWZZXfrTum3BMSAn6sAeofJtccLZmlrTJXofr9zfXQwaTGkYiYu1sXNT?=
 =?iso-8859-1?Q?H2iO4don3/jZnYVrSPKNSd0GnaJL0Pgk4CckmVbC8j2qyeYopkoT779lzz?=
 =?iso-8859-1?Q?eYdKPf2j9An846/nFyp1FT5LWIchf/J+Ez0hHujkNrImK6YZQgK23I2ujP?=
 =?iso-8859-1?Q?NUvv/V4w9jA9Ntkfxvi+0Ti+IoP7fPDKWTBItalxHHJgrmTBeXQTtxlAuT?=
 =?iso-8859-1?Q?hoC6ddPPEQyOnpzbitNSR7MUU3zSm4oLJ/xmh9YAZwdOwLg5MFvpFYudBx?=
 =?iso-8859-1?Q?b92TDD1gwUAcajt2x2SHDXc44fSGn4YgunbYG6ZybvIWkK0IjEX8Rhl3X1?=
 =?iso-8859-1?Q?91eiISCIyGlHwJPibBcW2DgVWBC9EtSOofIjGk5lMcZOaBDCT0zywcqjhm?=
 =?iso-8859-1?Q?cA+d+82XLpbCZakNOJCnpm8PHzm2q2KWi3A9JC4nFNAUKtEHNo3Xbb6NtY?=
 =?iso-8859-1?Q?LmYa6Dnk8hw9hFPBvtpxSpT223S/U5vq1vZZMHTh6bFQMn1583hjZjZYSm?=
 =?iso-8859-1?Q?iypKdm/gd+E5JsMDMd+g6pCOpKFYrUFyUywLlgwTDYEE6HWL2JJnnKNDEC?=
 =?iso-8859-1?Q?cvG+BVGZR5TUbMahQEQyFeoJYK0xe/+Nxs1txzwI2zVEjrJPkGt3g7O7mW?=
 =?iso-8859-1?Q?fd25lK/tx3F7Ti7kS4HdfpbcOSXwTjygN+GDWG4fIycfSGRtJ49uwb9aab?=
 =?iso-8859-1?Q?UXV3FyfaqtBdzZikRJDjGsE1UX2LL0CIeLsB30WvvQ2z5VbTzqeMkbE5Hj?=
 =?iso-8859-1?Q?tP9lZ6vaM8YfAgDWBSXJaA?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?WRPK8wzW/i6Txb1lWKqPAZ+fiom7T5B5xayVX1ERQpcIEyrQiCdbf0tWRh?=
 =?iso-8859-1?Q?sq97qPtinw0eXk3UL1zS8QqWwtZTxT2/kRSI/CCrsOu+iUwQdR9JIaMY9Y?=
 =?iso-8859-1?Q?awuit/QeTDwZcAQ5gIQBeX0ho8pZNasbLdWyesFzxBIynWtKpwn5XfOm6B?=
 =?iso-8859-1?Q?791DLZmvbOEUNg25N/CziJ/QrJ0Ruvi2N6ATMLEDVUFIZwkMTgVgSiNDSG?=
 =?iso-8859-1?Q?r5XDryPY/8zMm/vmh1zir4mNK0OyPhbMoINYhRkbveAIjpN7s4k2UDtTcy?=
 =?iso-8859-1?Q?i3E4+at+E2eCnvlBFowEqHSOEs9NaVUVjhBlJ/w8j93uKeZklFkMMOM491?=
 =?iso-8859-1?Q?agrld9MQg8olKQMJDZSBOCFvag+HKTdakZL91IXsJl/d59T1VRn0300Dvn?=
 =?iso-8859-1?Q?/d5yLqbbq612wENHFfi/DF7Zvc2hg2LTDpgUkRGgRTE7WJEGi0PskfMGqP?=
 =?iso-8859-1?Q?aE5b2g5a7moSVbKC8br0jg/S+kFxRTzHP/DqYZKQ4L/JOWA1y00CLJWPUW?=
 =?iso-8859-1?Q?ZmkExCNm2pvaAOY+/WaePBTg9yxcFg20/SMDxE82RNp2aPFN32wVrdKZrq?=
 =?iso-8859-1?Q?uOHCpELQRSHenK4u7ZQT+KIOSntaer1q01s0yTzLOeTiP+TKJ2Kw9SebdY?=
 =?iso-8859-1?Q?ANQYdNHUxSWpPEJhYPnUZqfGwy4A/6r3wAX9AHtoc6rf1wt+ktg6ZKKBsJ?=
 =?iso-8859-1?Q?woR4wSqz+HCmZ/z1YaaSl8mbWpPfec9qr4F/RWiBF1grRiVDgcqdK1S11A?=
 =?iso-8859-1?Q?Fgapc2LxaFpHMPN7NgvANQuzZ7I9kvkmUfz4UjYWouETdmpFnY+0njZlbO?=
 =?iso-8859-1?Q?vqwES6DEVnTd2+Pfirve8/lKvURn57DxJJWYv1lzaSFAGo6W70S5V1kYqB?=
 =?iso-8859-1?Q?oqi+gEyRenDsV25EJ2Rrk63EYHcDiIIjYHD6mVxSxZK9GqK5XXBtuH1nBY?=
 =?iso-8859-1?Q?/Th+BD2CQZMs30Uheb79IGk/SNSY/WjCpRTHgwph1pVBOe4LCdJmQ3w4/V?=
 =?iso-8859-1?Q?6Yjq29oJSj6rlJhe1hFwxTqqD86G66jKtZ5xDl3usASf03shh6TV2k15Iv?=
 =?iso-8859-1?Q?J0wHcFTDlNxXFzmC86q8TVUMiM8dUXODEOqb/vQaI4CW3V2qRMBV5avOOT?=
 =?iso-8859-1?Q?dLd2OGQX9ITP4iPiM1lT1cSKSRACZHKYMlw01WHLkU2gCDAv5cCVdTDzW3?=
 =?iso-8859-1?Q?7FP4J393mFvO1kqr54uoquc5fxGCJGbY/Vxwt76vVoNkV8LzdYP4ZPlpba?=
 =?iso-8859-1?Q?XzaLdLfYTlyxVq2JleAP12edGXP7WwxkGhXf7PhmiKldu7lN/609xHmJGy?=
 =?iso-8859-1?Q?HulWKInNuhmyujNY7+bQeePf+N/19uE3OsNWPL1oKYx6eiOH+/bN3R5x1Z?=
 =?iso-8859-1?Q?2IvhJ+zjKfRqoUmZyAYYVjohZ2dB2D7pUcL+9c/BcfWAsdCsFJ8NjAMpXa?=
 =?iso-8859-1?Q?gv91jqYjGOfbu9HHvS7YGacrvSipLHAv7NZTxOaaOM8pc62Scq/fPk92cA?=
 =?iso-8859-1?Q?ZWBM17+DtOwVmPVUyfenhvlUPpuptEXwRLLrKeSFa1545DO9jMYaQPnqfN?=
 =?iso-8859-1?Q?EyU4tg4q6jpt4hvxiqKb17gdhC1N9OiMEMxHS1lEcYWTIhT89647XBtLAr?=
 =?iso-8859-1?Q?5GHUUEKpMCn2zYNiuvf0/w48w9//pBl+wUcMP8xFeeDGn1h0JldwyN4Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 75cde294-8763-4626-60b0-08de2c83266b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 00:31:33.2070 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hmczqE6+pwu6bUi75Erbr7WHaXfk/G4yLxPKvtYnVlbLlG35/zbbPkQ9X+uK3Z/Y/bueCQ0Th5qfUkNUcCndBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7667
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

On Sat, Oct 25, 2025 at 02:04:06PM +0200, Thomas Hellström wrote:
> As a consequence, struct xe_vma_mem_attr() can't simply be assigned
> or freed without taking the reference count of individual members
> into account. Also add helpers to do that.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_svm.c        |  2 +-
>  drivers/gpu/drm/xe/xe_vm.c         | 36 +++++++++++++++++++++++++-----
>  drivers/gpu/drm/xe/xe_vm.h         |  1 +
>  drivers/gpu/drm/xe/xe_vm_madvise.c |  1 +
>  drivers/gpu/drm/xe/xe_vm_types.h   |  9 ++++++++
>  5 files changed, 43 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index d27e366f8e14..d27cedeaf70c 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -330,7 +330,7 @@ static int xe_svm_range_set_default_attr(struct xe_vm *vm, u64 range_start, u64
>  	if (xe_vma_start(vma) == range_start && xe_vma_end(vma) == range_end) {
>  		default_attr.pat_index = vma->attr.default_pat_index;
>  		default_attr.default_pat_index  = vma->attr.default_pat_index;
> -		vma->attr = default_attr;
> +		xe_vma_mem_attr_copy(&vma->attr, &default_attr);
>  	} else {
>  		vm_dbg(&vm->xe->drm, "Split VMA start=0x%016llx, vma_end=0x%016llx",
>  		       range_start, range_end);
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 1dffcd9ab61b..3c3dc1b1ace9 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -964,6 +964,27 @@ static void xe_vma_free(struct xe_vma *vma)
>  		kfree(vma);
>  }
>  
> +static void xe_vma_mem_attr_fini(struct xe_vma_mem_attr *attr)
> +{
> +	drm_pagemap_put(attr->preferred_loc.dpagemap);
> +}
> +
> +/**
> + * xe_vma_mem_attr_copy() - copy an xe_vma_mem_attr structure.
> + * @to: Destination.
> + * @from: Source.
> + *
> + * Copies an xe_vma_mem_attr structure taking care to get reference
> + * counting of individual members right.
> + */
> +void xe_vma_mem_attr_copy(struct xe_vma_mem_attr *to, struct xe_vma_mem_attr *from)
> +{
> +	xe_vma_mem_attr_fini(to);
> +	*to = *from;
> +	if (to->preferred_loc.dpagemap)
> +		drm_pagemap_get(to->preferred_loc.dpagemap);
> +}
> +
>  static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>  				    struct xe_bo *bo,
>  				    u64 bo_offset_or_userptr,
> @@ -1014,8 +1035,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>  	if (vm->xe->info.has_atomic_enable_pte_bit)
>  		vma->gpuva.flags |= XE_VMA_ATOMIC_PTE_BIT;
>  
> -	vma->attr = *attr;
> -
> +	xe_vma_mem_attr_copy(&vma->attr, attr);
>  	if (bo) {
>  		struct drm_gpuvm_bo *vm_bo;
>  
> @@ -1023,6 +1043,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>  
>  		vm_bo = drm_gpuvm_bo_obtain(vma->gpuva.vm, &bo->ttm.base);
>  		if (IS_ERR(vm_bo)) {
> +			xe_vma_mem_attr_fini(&vma->attr);
>  			xe_vma_free(vma);
>  			return ERR_CAST(vm_bo);
>  		}
> @@ -1042,6 +1063,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>  
>  			err = xe_userptr_setup(uvma, xe_vma_userptr(vma), size);
>  			if (err) {
> +				xe_vma_mem_attr_fini(&vma->attr);
>  				xe_vma_free(vma);
>  				return ERR_PTR(err);
>  			}
> @@ -1057,6 +1079,8 @@ static void xe_vma_destroy_late(struct xe_vma *vma)
>  {
>  	struct xe_vm *vm = xe_vma_vm(vma);
>  
> +	xe_vma_mem_attr_fini(&vma->attr);
> +
>  	if (vma->ufence) {
>  		xe_sync_ufence_put(vma->ufence);
>  		vma->ufence = NULL;
> @@ -4221,7 +4245,7 @@ static int xe_vm_alloc_vma(struct xe_vm *vm,
>  	struct drm_gpuva_op *__op;
>  	unsigned int vma_flags = 0;
>  	bool remap_op = false;
> -	struct xe_vma_mem_attr tmp_attr;
> +	struct xe_vma_mem_attr tmp_attr = {};
>  	u16 default_pat;
>  	int err;
>  
> @@ -4314,7 +4338,7 @@ static int xe_vm_alloc_vma(struct xe_vm *vm,
>  			 * VMA, so they can be assigned to newly MAP created vma.
>  			 */
>  			if (is_madvise)
> -				tmp_attr = vma->attr;
> +				xe_vma_mem_attr_copy(&tmp_attr, &vma->attr);
>  
>  			xe_vma_destroy(gpuva_to_vma(op->base.remap.unmap->va), NULL);
>  		} else if (__op->op == DRM_GPUVA_OP_MAP) {
> @@ -4324,12 +4348,13 @@ static int xe_vm_alloc_vma(struct xe_vm *vm,
>  			 * copy them to new vma.
>  			 */
>  			if (is_madvise)
> -				vma->attr = tmp_attr;
> +				xe_vma_mem_attr_copy(&vma->attr, &tmp_attr);
>  		}
>  	}
>  
>  	xe_vm_unlock(vm);
>  	drm_gpuva_ops_free(&vm->gpuvm, ops);
> +	xe_vma_mem_attr_fini(&tmp_attr);
>  	return 0;
>  
>  unwind_ops:
> @@ -4387,3 +4412,4 @@ int xe_vm_alloc_cpu_addr_mirror_vma(struct xe_vm *vm, uint64_t start, uint64_t r
>  
>  	return xe_vm_alloc_vma(vm, &map_req, false);
>  }
> +
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index ef8a5019574e..d328d31afe8e 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -411,4 +411,5 @@ static inline struct drm_exec *xe_vm_validation_exec(struct xe_vm *vm)
>  #define xe_vm_has_valid_gpu_mapping(tile, tile_present, tile_invalidated)	\
>  	((READ_ONCE(tile_present) & ~READ_ONCE(tile_invalidated)) & BIT((tile)->id))
>  
> +void xe_vma_mem_attr_copy(struct xe_vma_mem_attr *to, struct xe_vma_mem_attr *from);
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
> index cad3cf627c3f..9553008409d1 100644
> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> @@ -95,6 +95,7 @@ static void madvise_preferred_mem_loc(struct xe_device *xe, struct xe_vm *vm,
>  			 */
>  			vmas[i]->attr.preferred_loc.migration_policy =
>  						op->preferred_mem_loc.migration_policy;
> +			vmas[i]->attr.preferred_loc.dpagemap = NULL;
>  		}
>  	}
>  }
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index 4f9a6cdb5d02..70856d536047 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -20,6 +20,8 @@
>  #include "xe_range_fence.h"
>  #include "xe_userptr.h"
>  
> +struct drm_pagemap;
> +
>  struct xe_bo;
>  struct xe_svm_range;
>  struct xe_sync_entry;
> @@ -65,6 +67,13 @@ struct xe_vma_mem_attr {
>  		 * closest device memory respectively.
>  		 */
>  		u32 devmem_fd;
> +		/**
> +		 * @preferred_loc.dpagemap: Reference-counted pointer to the drm_pagemap preferred
> +		 * for migration on a SVM page-fault. The pointer is protected by the
> +		 * vm lock, and is %NULL if @devmem_fd should be consulted for special
> +		 * values.
> +		 */
> +		struct drm_pagemap *dpagemap;
>  	} preferred_loc;
>  
>  	/**
> -- 
> 2.51.0
> 
