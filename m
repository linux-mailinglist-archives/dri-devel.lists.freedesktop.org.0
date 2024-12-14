Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5889F1CE0
	for <lists+dri-devel@lfdr.de>; Sat, 14 Dec 2024 06:58:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D72A410E287;
	Sat, 14 Dec 2024 05:58:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iVkwM0zN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7ED910E0CE;
 Sat, 14 Dec 2024 05:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734155930; x=1765691930;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=XJYQu8W2JUQGIpG5oSChECGMkSoqFUb+ANXa5fSNQAA=;
 b=iVkwM0zNAzfiaUqqwZtE2jUl03ag8JCz6632YNsg0sBtSN54ygyzqHOh
 kOkAjrBhTDIP0x9hovl1IQ6ncGc7+yHx4ZDSZhS3s2K8ffgicJFmfl/PG
 UZ5+CU49qJvWh43cx/tR1eqhYvGTyvZpKKx77um01oJNr0RC3DCs0+zjf
 MAg44ru56ZFYtmoC/KNJSa+aZGIjzQaHFaB5r9oADu26eIRgrpZBWysrc
 CHmlqDUdKYAJzWUbmMuyNQpOxKQepA6FylBKrcsRfb8f3Do9OEfPZ5i/4
 oXVOS0cWgjhSLtOZXXdtjJgc+UPL1yZxgxpIs3elhirmo1cEAswhQCDKC g==;
X-CSE-ConnectionGUID: RSgEDpZvQYylCJmq9SyXkQ==
X-CSE-MsgGUID: rJarSVucSEmXQmaAYmVvJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11285"; a="34529261"
X-IronPort-AV: E=Sophos;i="6.12,233,1728975600"; d="scan'208";a="34529261"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2024 21:58:50 -0800
X-CSE-ConnectionGUID: OaeVOK92TseY7tlsuXqR+Q==
X-CSE-MsgGUID: 0R9+S5jpTJOHdtSkGxhM2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,233,1728975600"; d="scan'208";a="96959674"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Dec 2024 21:58:50 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 13 Dec 2024 21:58:48 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 13 Dec 2024 21:58:48 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 13 Dec 2024 21:58:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F8NVZ66yqKUpxpNQkcy8tPSXbr+iLjwu/5rNff93YUDNJ/NxCTKpml2IURUtAuonEE6y6Ap3ACh3mNsFIH+Gpwio0n3rxd9EyS2FbSA8nE0UDkriWsYyGkY1aQCJ4E6/OfxEgm2PYXYvhnYSO1S6rdgNXve6FzBSJm38WRULNmj5udb+os5lCRqHdxgUHWcoqIA+8yg4ZAm0hFEHBfOSsd6dV0MNZ9Sw/oB1VqMERD/qExfQdMxFDaF4qvAhoijIdNO5fgXgfgad54jZDoYjOI+PtsDcJF+5aPAb93ZWlTA+HVsGv6o8mopXaJemGCNPPdUpwVREiioHKVd/pMmEAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ahdaTLMu1KYLH6QhbIhVHPnF1EfL+9PYRkHs1ODE8Lo=;
 b=d1i+JeuATDzvD9izhGRRnKNkMDd2PSuPBi9S6Bc5o0MBQDzWJT3ln/e8phejM8AWO83bBOen72COEmP6MIeUMcadVNLJO/dMtYvl11joK5av+5DrZDtMU6VWbReiROksRAkm660f9RPbtXTFCewxG3Ih7OF1Qhq2aOnFQ3SzlMvsHUA3NHreJCi4MXIhLhP8iE/sSxkMPlDwvTADao9cUz1zcu8GWe8vIe1aR+rzGHuKulDCUkoxuRxGjeeJh+o1d/Iy39+wzxJ+HGmxazx58KSzD+YJuy7T5QzEG3ryXWez7ahZdOX9vP8RgV+kLkdXXU/BGOAUk2+CVhy8gPqMQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB5232.namprd11.prod.outlook.com (2603:10b6:5:38b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.19; Sat, 14 Dec
 2024 05:58:19 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8251.015; Sat, 14 Dec 2024
 05:58:19 +0000
Date: Fri, 13 Dec 2024 21:59:02 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Alistair Popple <apopple@nvidia.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <christian.koenig@amd.com>,
 <thomas.hellstrom@linux.intel.com>, <simona.vetter@ffwll.ch>,
 <felix.kuehling@amd.com>, <dakr@kernel.org>
Subject: Re: [PATCH v2 03/29] mm/migrate: Trylock device page in do_swap_page
Message-ID: <Z10epvStB1P5BKwT@lstrano-desk.jf.intel.com>
References: <20241016032518.539495-1-matthew.brost@intel.com>
 <20241016032518.539495-4-matthew.brost@intel.com>
 <874j3rexik.fsf@nvdebian.thelocal>
 <Z1yyUyJViOIkRYTz@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z1yyUyJViOIkRYTz@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: BYAPR03CA0012.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::25) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB5232:EE_
X-MS-Office365-Filtering-Correlation-Id: 65d9591d-bf36-43c4-9dc9-08dd1c044f68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?j8W4WDTOIFtvyq6eIl/8e1S8XPuontkKO5sWtYf2M6ZDdFuztMIWk8ng3Z?=
 =?iso-8859-1?Q?gC46ihQEzZEbPhZ5SbxdpKgFBD0oeBM+aHElTAQC+DDXB9LaXpP8MHv/a2?=
 =?iso-8859-1?Q?/I1pRjl17C8ljUt+QHUWXjPALVSW/obKD5MXhxqROiujUk3KH4TRbunIB2?=
 =?iso-8859-1?Q?6e9+137cAM9K5pmbob00a1tYVlw5dVmXkVgJ2I6AwKHcnCGOv4DAxAMr9A?=
 =?iso-8859-1?Q?stooJBi4brSFYKYisEcpE+xR6GmPJSkv5IsMUJpututLQBTqvMDp6zjPx2?=
 =?iso-8859-1?Q?toWAz9ac8G40yZasvx3bCiGEBKCcNgTWAkgC4yO4xhrsaDwFfo7fVRETRK?=
 =?iso-8859-1?Q?RLimeJFgJtGAPHelrkXhTsRAJnUvGG7GKz9a7oXk7uUjUK7xb0/lgG6oJz?=
 =?iso-8859-1?Q?zaxfBV5zfRApasFJ1DucO4II/dw7AAtCddQfNBwUaFL617gfmoBO+JJia3?=
 =?iso-8859-1?Q?WkvgzteM02hsLPlmEMbsjca6AVUj2lJ7TC/B0l+TKX1ehz2HDFx9mVlevk?=
 =?iso-8859-1?Q?vaRKte/2iw7sKgeHnqOogyzoYxaChO9YZT7QRUkfr5Cl4sYhrLpaKeFt7U?=
 =?iso-8859-1?Q?DZ4YRNTi3awMJzp7FNv3x6oV5vr75MIZDDf1SM63VcJz4SeI0r3qDa7zub?=
 =?iso-8859-1?Q?07O3qTkC1M9y6WZ8oYIUtdeOYIET9nNDIgN+d/Oe2VzCUxdkXL5AIHDHzK?=
 =?iso-8859-1?Q?zpPDtmU1ABopNHn9rIN9F1bq6nzNizBAGpK/Yj8RM4aUhbIiG+uLFGTKq+?=
 =?iso-8859-1?Q?8sxDanLDwIqZVW2fa0WyJ/HeSrNejKGSD+MvdptN1Mj9hCxOjMNE/j3GL1?=
 =?iso-8859-1?Q?otTF7ZNHnvnM+kzAFjQByVp2KNEGQBbH8GQ20A0ivs9XHIeVCMf8VWtC/e?=
 =?iso-8859-1?Q?I/23v8FsIPjP3FMH5vX2JdjB31f5SYfRZfcVhMXt0oLFSFfn8NXrC2Jjtv?=
 =?iso-8859-1?Q?8iPrNXpGFOD49Q0ZMEBzD3q3G6uKDASjKlPbr4HCAQMMpP5pE6UHBggW1W?=
 =?iso-8859-1?Q?fd0XnPRCq7Dgpio8SS/jbWtO+MvhJRDxN/6xfRU5wDvz7b7XNTBb6tOxEq?=
 =?iso-8859-1?Q?0L7iJ0Hfe11o41VmqoL9L5ulswSiMkXrRHY8ipUzImh0jq2qI97QJR2cSn?=
 =?iso-8859-1?Q?6S37HB6KX+bBxMNCkUY579l2xzBL+/Yj8sujXOgkMgVMjnR9/COexesqNg?=
 =?iso-8859-1?Q?WPFOQyJa1bi/2zMKfRbQz34X0dLoBtFkENtvfY9sY6dfyVfgYDXoQPvHXj?=
 =?iso-8859-1?Q?Fnz8HYeGXD2eZqPd5WzXuk6w+alWubEG2w4tr5u0cmKMd24wj3mr7B7/B9?=
 =?iso-8859-1?Q?zKNKhQdbfY5PPQlKgpFSP6IFCkoUQZe3HKEq6R4tJENVf5bxszcyNmVsLc?=
 =?iso-8859-1?Q?aIA2U3tAM18kmdHyya01rJSGMqR3Gertzz4RLwVpcY5+ZIg5C6hKky4IGE?=
 =?iso-8859-1?Q?uHKb8utFeRjn0esO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?PpOc58LohcxwHfpcEGIEb87LVdAfPDuLgCkVOzB92dxe00/4IQOjHyDm1N?=
 =?iso-8859-1?Q?0krCB/a5v4PyQHPZHLVgEGCzGxtkLQj7/vCGYXG9Yvl0cEDTVzXTM0+4HG?=
 =?iso-8859-1?Q?fgljOgFQHtJI6oPM7MHojb/Zm+4It4mOBkSH8Q5+HpooqOzZtLOtxEOs7n?=
 =?iso-8859-1?Q?jWx7tHNPOQxswSZXvlxUxMZ1+/eHhADu7SUTkh/Mc5lEqM/+uomKM8rnOU?=
 =?iso-8859-1?Q?RJGYXUIGz7AidKiL4L/iB5k6cH3BOQ9QjhY3WyH4KbxVaghwa9BOldb8oq?=
 =?iso-8859-1?Q?Xp791wL5bUJ7XWW8uKaB4D0xrRjqFSfqMZd4YGVc+Q//UZ3vdDH0uRNJP/?=
 =?iso-8859-1?Q?ktpoatdqbp7srNR/8Gu6zs2SWOqkj/QY+R0k5nFPFg22fn56mCs4i+AUcS?=
 =?iso-8859-1?Q?zCLuCzJO6h/oXla836ELcXblD/0UYFJVHlyFwohZxI9wZCL72ze1q7dDTN?=
 =?iso-8859-1?Q?AmTYq0hV4zDOw5ybHX19ih58AgpTWb/zi+jbo/ejkxlG5VBRHSjtZpxfzx?=
 =?iso-8859-1?Q?pMuzrq2Q6SfFGprEfeJh4/ecJpmUNsLamvAph7Ghj8t5LC7OD32yukPElW?=
 =?iso-8859-1?Q?K8p07rCor9C/ASr+6j+MqmcsjR9huTQOgI30eyUDCfVHQINjR0OHkigvOh?=
 =?iso-8859-1?Q?V5bSgu8MsNZfDhFe+34IdivHQS7AByoabEfnNKMlwz5LK1eaV337+FPs0D?=
 =?iso-8859-1?Q?XQD0ZhfKozeMcACRGrlSNBRSt0QjUdOlf4VQWELn22eRMafeP5pZwplrJg?=
 =?iso-8859-1?Q?QcZJPNtL35a/m0NJP6J9rPPXnxcjIoQtzHJxZUF0PBNc0qsCFfRnrs4M45?=
 =?iso-8859-1?Q?RuIBB5mJ1ePsfEEasPLzNHEiPlOjtM+qwfXKuM7ETfk3N1A7r6bhixCI/F?=
 =?iso-8859-1?Q?bJ9dCqE7rw+KXZS91OO2iZX9EPZ5b4nidx7jWEQNy4p+OljCVuu0llodGs?=
 =?iso-8859-1?Q?SYsS4Px6Uh5o078FD50lYTC+KasTCnj/5YLe7653kOOaX3HZi0xZPfYxrs?=
 =?iso-8859-1?Q?/iwKtOgUUTnQlUlevU0rCdEuMyOdq8oT6cpqNDpR9AaKXK3goFJwc7Krxs?=
 =?iso-8859-1?Q?4ugxCrKp/mMgf15DpTck4djwl/lMrLMLepcrQdXFWlvDq/J3lqfXFM2VDv?=
 =?iso-8859-1?Q?zflJVYPGD4fjTbRSwIaoNfb3tmf/Rj59X1ag1OXfZct9C3Vm4Lh/0fElRl?=
 =?iso-8859-1?Q?iZjPJyx7WBt8qAsRhXAJGRFPwIN2qP0d5o6kb+o/5OHjueQvF4jLZrAe2B?=
 =?iso-8859-1?Q?/TBUF+1v1O6zlSI+LYQ/v0bndpN2eMgZ6JYldFaYiBDOv5Nzj9j/xAR34/?=
 =?iso-8859-1?Q?+KleokH/rGh/C/FYLucHXIhAEmuvebBFRlHh/dVcb+Qa/TsKDK5vNHZqvT?=
 =?iso-8859-1?Q?2AQLBQuzRS5AyLz8DYHVcndvptuHHsTeqPvQja1FsurNcMuDlg5NOjFpk2?=
 =?iso-8859-1?Q?GfkQKOTO/dl0pD7j5oiU0pDL0S3BPax3NFaaKxYRE32YCJ7QP2bJUW0DG/?=
 =?iso-8859-1?Q?dm2QmPuZhhOVKArCFiF30ipfPU93icj7ydb5oSo8g/a1IazG05nJGUHmHp?=
 =?iso-8859-1?Q?pb7RbDmNqCZG1ghybl5x4xpvYaLn20Zhx/sGhahBtxxL3NyirEWP4x4rJc?=
 =?iso-8859-1?Q?pW/khHF/FwatPVgJbImtQ0OgB4JY6ylJa4q8Fq9CvrJfuzSWT3+0iTGQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 65d9591d-bf36-43c4-9dc9-08dd1c044f68
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2024 05:58:19.6223 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /A9ibTZs2LFJl2gGkRvTJDNMIleEc74XnddQWXij0/ujPheJZwH5KjDykktb8Co3mNGGltdx/IGzlTJC8nro7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5232
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

On Fri, Dec 13, 2024 at 02:16:51PM -0800, Matthew Brost wrote:
> On Fri, Nov 29, 2024 at 10:31:32AM +1100, Alistair Popple wrote:
> > 
> > Matthew Brost <matthew.brost@intel.com> writes:
> > 
> > > Avoid multiple CPU page faults to the same device page racing by trying
> > > to lock the page in do_swap_page before taking an extra reference to the
> > > page. This prevents scenarios where multiple CPU page faults each take
> > > an extra reference to a device page, which could abort migration in
> > > folio_migrate_mapping. With the device page being locked in
> > > do_swap_page, the migrate_vma_* functions need to be updated to avoid
> > > locking the fault_page argument.
> > >
> > > Prior to this change, a livelock scenario could occur in Xe's (Intel GPU
> > > DRM driver) SVM implementation if enough threads faulted the same device
> > > page.
> > >
> > > Cc: Philip Yang <Philip.Yang@amd.com>
> > > Cc: Felix Kuehling <felix.kuehling@amd.com>
> > > Cc: Christian König <christian.koenig@amd.com>
> > > Cc: Andrew Morton <akpm@linux-foundation.org>
> > > Suggessted-by: Simona Vetter <simona.vetter@ffwll.ch>
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > >  mm/memory.c         | 13 ++++++---
> > >  mm/migrate_device.c | 69 ++++++++++++++++++++++++++++++---------------
> > >  2 files changed, 56 insertions(+), 26 deletions(-)
> > >
> > > diff --git a/mm/memory.c b/mm/memory.c
> > > index 2366578015ad..b72bde782611 100644
> > > --- a/mm/memory.c
> > > +++ b/mm/memory.c
> > > @@ -4252,10 +4252,15 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
> > >  			 * Get a page reference while we know the page can't be
> > >  			 * freed.
> > >  			 */
> > > -			get_page(vmf->page);
> > > -			pte_unmap_unlock(vmf->pte, vmf->ptl);
> > > -			ret = vmf->page->pgmap->ops->migrate_to_ram(vmf);
> > > -			put_page(vmf->page);
> > > +			if (trylock_page(vmf->page)) {
> > > +				get_page(vmf->page);
> > > +				pte_unmap_unlock(vmf->pte, vmf->ptl);
> > > +				ret = vmf->page->pgmap->ops->migrate_to_ram(vmf);
> > > +				put_page(vmf->page);
> > > +				unlock_page(vmf->page);
> > 
> > Isn't the order wrong here? In the common case put_page() will have just
> > dropped the last reference on the page and freed it so the unlock_page()
> > needs to happen first.
> > 
> 
> Yes, this appears wrong. I haven't seen this show up as a problem but
> certainly a put should be done after dropping the lock. 
> 
> > > +			} else {
> > > +				pte_unmap_unlock(vmf->pte, vmf->ptl);
> > > +			}
> > >  		} else if (is_hwpoison_entry(entry)) {
> > >  			ret = VM_FAULT_HWPOISON;
> > >  		} else if (is_pte_marker_entry(entry)) {
> > > diff --git a/mm/migrate_device.c b/mm/migrate_device.c
> > > index f163c2131022..2477d39f57be 100644
> > > --- a/mm/migrate_device.c
> > > +++ b/mm/migrate_device.c
> > > @@ -60,6 +60,8 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
> > >  				   struct mm_walk *walk)
> > >  {
> > >  	struct migrate_vma *migrate = walk->private;
> > > +	struct folio *fault_folio = migrate->fault_page ?
> > > +		page_folio(migrate->fault_page) : NULL;
> > >  	struct vm_area_struct *vma = walk->vma;
> > >  	struct mm_struct *mm = vma->vm_mm;
> > >  	unsigned long addr = start, unmapped = 0;
> > > @@ -88,11 +90,13 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
> > >  
> > >  			folio_get(folio);
> > >  			spin_unlock(ptl);
> > > -			if (unlikely(!folio_trylock(folio)))
> > > +			if (unlikely(fault_folio != folio &&
> > 
> > We don't currently support large ZONE_DEVICE pages so we should never
> > get here. I think a WARN_ON_ONCE(fault_folio == folio) and bail would be
> > better.
> > 
> 
> Sure will fix.
> 
> > > +				     !folio_trylock(folio)))
> > >  				return migrate_vma_collect_skip(start, end,
> > >  								walk);
> > >  			ret = split_folio(folio);
> > > -			folio_unlock(folio);
> > > +			if (fault_folio != folio)
> > > +				folio_unlock(folio);
> > >  			folio_put(folio);
> > >  			if (ret)
> > >  				return migrate_vma_collect_skip(start, end,
> > > @@ -192,7 +196,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
> > >  		 * optimisation to avoid walking the rmap later with
> > >  		 * try_to_migrate().
> > >  		 */
> > > -		if (folio_trylock(folio)) {
> > > +		if (fault_folio == folio || folio_trylock(folio)) {
> > >  			bool anon_exclusive;
> > >  			pte_t swp_pte;
> > >  
> > > @@ -204,7 +208,8 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
> > >  
> > >  				if (folio_try_share_anon_rmap_pte(folio, page)) {
> > >  					set_pte_at(mm, addr, ptep, pte);
> > > -					folio_unlock(folio);
> > > +					if (fault_folio != folio)
> > > +						folio_unlock(folio);
> > >  					folio_put(folio);
> > >  					mpfn = 0;
> > >  					goto next;
> > > @@ -363,6 +368,8 @@ static unsigned long migrate_device_unmap(unsigned long *src_pfns,
> > >  					  unsigned long npages,
> > >  					  struct page *fault_page)
> > >  {
> > > +	struct folio *fault_folio = fault_page ?
> > > +		page_folio(fault_page) : NULL;
> > >  	unsigned long i, restore = 0;
> > >  	bool allow_drain = true;
> > >  	unsigned long unmapped = 0;
> > > @@ -427,7 +434,8 @@ static unsigned long migrate_device_unmap(unsigned long *src_pfns,
> > >  		remove_migration_ptes(folio, folio, 0);
> > >  
> > >  		src_pfns[i] = 0;
> > > -		folio_unlock(folio);
> > > +		if (fault_folio != folio)
> > > +			folio_unlock(folio);
> > >  		folio_put(folio);
> > >  		restore--;
> > >  	}
> > > @@ -536,6 +544,8 @@ int migrate_vma_setup(struct migrate_vma *args)
> > >  		return -EINVAL;
> > >  	if (args->fault_page && !is_device_private_page(args->fault_page))
> > >  		return -EINVAL;
> > > +	if (args->fault_page && !PageLocked(args->fault_page))
> > > +		return -EINVAL;
> > >  
> > >  	memset(args->src, 0, sizeof(*args->src) * nr_pages);
> > >  	args->cpages = 0;
> > > @@ -799,19 +809,13 @@ void migrate_vma_pages(struct migrate_vma *migrate)
> > >  }
> > >  EXPORT_SYMBOL(migrate_vma_pages);
> > >  
> > > -/*
> > > - * migrate_device_finalize() - complete page migration
> > > - * @src_pfns: src_pfns returned from migrate_device_range()
> > > - * @dst_pfns: array of pfns allocated by the driver to migrate memory to
> > > - * @npages: number of pages in the range
> > > - *
> > > - * Completes migration of the page by removing special migration entries.
> > > - * Drivers must ensure copying of page data is complete and visible to the CPU
> > > - * before calling this.
> > > - */
> > > -void migrate_device_finalize(unsigned long *src_pfns,
> > > -			unsigned long *dst_pfns, unsigned long npages)
> > > +static void __migrate_device_finalize(unsigned long *src_pfns,
> > > +				      unsigned long *dst_pfns,
> > > +				      unsigned long npages,
> > > +				      struct page *fault_page)
> > >  {
> > > +	struct folio *fault_folio = fault_page ?
> > > +		page_folio(fault_page) : NULL;
> > >  	unsigned long i;
> > >  
> > >  	for (i = 0; i < npages; i++) {
> > > @@ -824,7 +828,8 @@ void migrate_device_finalize(unsigned long *src_pfns,
> > >  
> > >  		if (!page) {
> > >  			if (dst) {
> > > -				folio_unlock(dst);
> > > +				if (fault_folio != dst)
> > > +					folio_unlock(dst);
> > 
> > How could the destination page be the faulting page? I think we can drop
> > this check.
> > 
> 
> Yea, will drop.
> 

Actually landing on a WARN_ON_ONCE(fault_folio == dst) to catch
potentail bugs. Will include that in my next rev. If you disagree let me
know and can discuss ahead of next rev.

Matt

> > >  				folio_put(dst);
> > >  			}
> > >  			continue;
> > > @@ -834,14 +839,16 @@ void migrate_device_finalize(unsigned long *src_pfns,
> > >  
> > >  		if (!(src_pfns[i] & MIGRATE_PFN_MIGRATE) || !dst) {
> > >  			if (dst) {
> > > -				folio_unlock(dst);
> > > +				if (fault_folio != dst)
> > > +					folio_unlock(dst);
> > 
> > Likewise.
> > 
> 
> Same here.
> 
> > >  				folio_put(dst);
> > >  			}
> > >  			dst = src;
> > >  		}
> > >  
> > >  		remove_migration_ptes(src, dst, 0);
> > > -		folio_unlock(src);
> > > +		if (fault_folio != src)
> > > +			folio_unlock(src);
> > >  
> > >  		if (folio_is_zone_device(src))
> > >  			folio_put(src);
> > > @@ -849,7 +856,8 @@ void migrate_device_finalize(unsigned long *src_pfns,
> > >  			folio_putback_lru(src);
> > >  
> > >  		if (dst != src) {
> > > -			folio_unlock(dst);
> > > +			if (fault_folio != dst)
> > > +				folio_unlock(dst);
> > 
> > This one also seems unnecessary.
> >
> 
> Same here.
> 
> Thanks - Matt
>  
> >  - Alistair
> > 
> > >  			if (folio_is_zone_device(dst))
> > >  				folio_put(dst);
> > >  			else
> > > @@ -857,6 +865,22 @@ void migrate_device_finalize(unsigned long *src_pfns,
> > >  		}
> > >  	}
> > >  }
> > > +
> > > +/*
> > > + * migrate_device_finalize() - complete page migration
> > > + * @src_pfns: src_pfns returned from migrate_device_range()
> > > + * @dst_pfns: array of pfns allocated by the driver to migrate memory to
> > > + * @npages: number of pages in the range
> > > + *
> > > + * Completes migration of the page by removing special migration entries.
> > > + * Drivers must ensure copying of page data is complete and visible to the CPU
> > > + * before calling this.
> > > + */
> > > +void migrate_device_finalize(unsigned long *src_pfns,
> > > +			unsigned long *dst_pfns, unsigned long npages)
> > > +{
> > > +	return __migrate_device_finalize(src_pfns, dst_pfns, npages, NULL);
> > > +}
> > >  EXPORT_SYMBOL(migrate_device_finalize);
> > >  
> > >  /**
> > > @@ -872,7 +896,8 @@ EXPORT_SYMBOL(migrate_device_finalize);
> > >   */
> > >  void migrate_vma_finalize(struct migrate_vma *migrate)
> > >  {
> > > -	migrate_device_finalize(migrate->src, migrate->dst, migrate->npages);
> > > +	__migrate_device_finalize(migrate->src, migrate->dst, migrate->npages,
> > > +				  migrate->fault_page);
> > >  }
> > >  EXPORT_SYMBOL(migrate_vma_finalize);
> > 
