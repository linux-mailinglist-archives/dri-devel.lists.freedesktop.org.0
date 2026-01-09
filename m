Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6910BD0BF88
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 19:55:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7229F10E92F;
	Fri,  9 Jan 2026 18:54:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J9F2aZRS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68D3F10E92F;
 Fri,  9 Jan 2026 18:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767984891; x=1799520891;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Rhpu+72I2z43/n+UDPrVrqJx8Gv6IOzVdPTa1F8RtFM=;
 b=J9F2aZRSbKDBHdJcy3RBomD6N3gBXZfQy0t0GcPWotJVKj5Y0PfYQRIf
 ZJrCi0uDfVj0KEW+xbwBS5u8n+3Y0PabTJUleMUjhltMd9szwbKM4PxjB
 eXqZ6fFdqubcQoPoux1vtVmNbHbdDHWFscgNGswEvusMJEJfr7lKwbb6C
 NkHXl8JdYwCxg0xHkoXiNZlmS86Ch6XuxJFOAM5kO9KEtixj5LDkjkvtA
 6e2s54lDRO9RxoqTUzostAzo6bXpWAMkPn1FBBtAofbSwsDvtPkT6HF+r
 EZzKbXQ6OVII/YdS8/ACNJ51H2SlksXrUi8zCmyoVEU4ddMJnqCbv25Qr Q==;
X-CSE-ConnectionGUID: AapWu9CIRj2gZLDVS7yO4g==
X-CSE-MsgGUID: T0akxAJMRqmiGD1kIwVvsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="73226912"
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; d="scan'208";a="73226912"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 10:54:51 -0800
X-CSE-ConnectionGUID: tWMtKap+Toyfixx8hgWpag==
X-CSE-MsgGUID: HLixlasjQ7uK4Apn+h/8Fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; d="scan'208";a="203832576"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 10:54:50 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Jan 2026 10:54:50 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 9 Jan 2026 10:54:50 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.19) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Jan 2026 10:54:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HYXp6iZWCUu35XFdc1OCF3tM6ZfUKirq46fnysnsnoRfueFhxQemGEAts2PRoED9B1e/yvol/TUEfeiZuquKp70cJEJuWWeiKCisL3vVse0SdcUhrYb5tFKBW8bOC4MCbp2s9P16uDhvI03f8EdDdKR7icLG5cDf1ZS1j5AOfiXYyGqvBt/qOmuw+HgiRUG/C/PW1wBOw78+TA/UGVsepVZiLnFCs9O1d/wH5sFOi6Vqg8cVAvrEUztXOIKW7p7t0rYEC6h0LN0SOUu4Se7b+dkukh6FWCyo3HSDKsc7b+fGgfb0BhMho4DEL7I0+J1keO/OKI0MW5VUHXXpkbpMlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9cj7oHahLbswpfQYKcL/3q296D2+fuCEriUBpHrzfaw=;
 b=ZG4iJqKiL+g8W1YqMtsod73S7oIjYIh6ZCM+violTHhlAAZweV9qFvkELt1gP7GzQeHWQr0SmTNxHIYRD7wkY251ezwDNeS7/yV+FJiA2Sc2rN9fA5F2jSq9RxXsn+YaG53eubLuu/lKx3fzMoxEPzGo97ntboQeLnsooefttjXrBIFgInJlhjOtXYRhn8U4xCe0LVEB5jM9gBf4V14NU6YVhHEXWEubrByToAP7c9QmAu/0+R+PODXLBtHytv0CyK/TyDBcLiBqNrGQdKPmZ3Bjse1cfnvT1se4q7+C9dLwMU9v95U2QTilTPszVayQoRY+o93O4Ub2QqPUgOU1Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by DS0PR11MB7733.namprd11.prod.outlook.com (2603:10b6:8:dc::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Fri, 9 Jan
 2026 18:54:48 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277%3]) with mapi id 15.20.9499.004; Fri, 9 Jan 2026
 18:54:47 +0000
Date: Fri, 9 Jan 2026 19:54:05 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Zi Yan <ziy@nvidia.com>
CC: Andrew Morton <akpm@linux-foundation.org>, "David Hildenbrand (Red Hat)"
 <david@kernel.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>,
 Balbir Singh <balbirs@nvidia.com>, Lorenzo Stoakes
 <lorenzo.stoakes@oracle.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Nico Pache <npache@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song
 <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, <linux-mm@kvack.org>, 
 <linux-kernel@vger.kernel.org>, Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH v3 1/7] mm: Add folio_split_unref helper
Message-ID: <aWFOzcVijh5bw-R5@fdugast-desk>
References: <20260109085605.443316-1-francois.dugast@intel.com>
 <20260109085605.443316-2-francois.dugast@intel.com>
 <59fb1669-2908-4cab-b3c0-b97479da3fb9@kernel.org>
 <20260109103741.533c1b807f3ccf9a6f0264de@linux-foundation.org>
 <DEC8782F-CA9B-4F90-818F-FCDED4504D5E@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <DEC8782F-CA9B-4F90-818F-FCDED4504D5E@nvidia.com>
Organization: Intel Corporation
X-ClientProxiedBy: LO4P265CA0167.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:312::12) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|DS0PR11MB7733:EE_
X-MS-Office365-Filtering-Correlation-Id: 03463b1d-e126-47e1-cb49-08de4fb08fb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/jQNZgQcP5xdm746V8P6i3A6uIyClUPG1t5VTTyhS1f/MJq/Yr+iu5+P5+fX?=
 =?us-ascii?Q?xnIgdqwt3VVCqzmXQmI8tNp/O3Ua2f4ZRhMEVdsJR1M2LoF/7tChJV2qHTvA?=
 =?us-ascii?Q?nmkJNFDSXgNBeuQ3oARnxwKlF8CiOus7vUfyVqwelgvBIEdicoRZmAmKTmWU?=
 =?us-ascii?Q?dFTNduB2gC5hplse8hOhm5hIBx1S0qZFrvFFQPrNf7SrtlP+7FjCsQ2SJaHk?=
 =?us-ascii?Q?6yTCOY5jmQ9441s3KgGWXDXmbZ5qTh+JuQpCX2rasTuoYnz4/Pf14sfxJvLg?=
 =?us-ascii?Q?XkK+jbJsK89C6cep9Xqp9YtIof+J5OTFDrZXXPO3lxHwh1a8IElzXJRNyZ2O?=
 =?us-ascii?Q?LjuyxLVQMdZuB0XfGgVZwxmKxy0QodCBVKnVIq6E2qM0jAGYPuS6uVd2XazX?=
 =?us-ascii?Q?e6IPMwujRHzNYuOhZ4QQKPiUQgOhARkoRW43HvpQhiDf3dQasVZTz2QEFdqQ?=
 =?us-ascii?Q?uL1shDoH8DCBfTEI9f0ls01NfnrGUdINwayF8n9DHGE0/VWFtlJjoBP8Q0lb?=
 =?us-ascii?Q?mQphyaTFfS0dtBKQA1G7dF2344jUW1xaXGA0DdhqtwopHn/q/NtA5t7wi0BD?=
 =?us-ascii?Q?kFIKDBuIOoA6TM0K+23j+XiDb0tXOI+DFpPfJeUQCFoHU4O+ng0tJj7gw1qC?=
 =?us-ascii?Q?tzEDX+XY8rJPshyBUslDnJHv3VHgH9TouJVmJKAr0db+UWa6sbAfvd88tU6g?=
 =?us-ascii?Q?ChrQwquAO5rLW7+FqOrTLAR4IHMGorIgfKExRuiubtKoTl+buZeRogwgtNOW?=
 =?us-ascii?Q?WVANTL54GwJimb1hsY42bAlk6QXvkEG5WxRUDl8IKmYxnvIO3+ZLRHChHNVf?=
 =?us-ascii?Q?0CDHM7d52qTNz+TERSpoIW5VgPIKEXp1Qgap+GYavjGeyrGYLHBoSgWt2AIH?=
 =?us-ascii?Q?c+tG2czPFuiRnHHu/fOqwVWPfeyoxnCSPBf+7Go4l/Gu07LrzHG2wTFLuD7N?=
 =?us-ascii?Q?zc8IHhf8dg1oRgSNF3Si2lxSucybiBBhlvdQ+7Z5jda30ZKQDF1SnBqJ0wOK?=
 =?us-ascii?Q?htvT9V5Pv3olaiNHRSnvcBf1laNgWkYI1Evs7m17J0oD+EAUfx71a6eGbo2G?=
 =?us-ascii?Q?j0m8SPUu7TrFlvBkccnEUm2oJVM2eESHuKhkdcL37ilP9qqiwlP7cEKu/y5T?=
 =?us-ascii?Q?+MH3yDGDmicdyCnxTiIBuzkHEVnHGoVS1FbMHNaJSdxVahEvs2uGX8m4WLEp?=
 =?us-ascii?Q?Ecv0S87kT+qjxRPK3WOZl23BforyQ5e8n0psogUH1W5xCLrumxuJkIka9xHd?=
 =?us-ascii?Q?L4K4BcTAndFExvWNta9agrTF5O8EY43iofgV5QQVy8nWC88DIXZQntI0Qtcb?=
 =?us-ascii?Q?DpFZaD6x8LsYmVrMeV7/qPGa0nzecDtQjyesYyitNr45HPiaCSp8e+iNVSDx?=
 =?us-ascii?Q?SspXr3Qzd6GpWR55v5mhXVidF7Y6GrMwFEvDCw8n/SQ4FBHvX8X1cxjMoDfg?=
 =?us-ascii?Q?cDGoXmoy2C4mbbp74TJVgcrG7X8A+5v6Gu/H3LxpqzHYTT7D8RVBqg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?w0sDxPt0HflqghzzP5CovtV5Wx5vGZrjPh1K7b5Faf4CgXcmCJcjR3xzsIyo?=
 =?us-ascii?Q?aSSLmqrpDm677FFIYiw66kayyNhpO3FAhzdD5DM7DAOpH/d+UKxCgFhKNoF9?=
 =?us-ascii?Q?va19jDbNx3OK9rk2Fk1rjC2OEq9Dcl1R9BOeTx9AO3D26IUpJcHWRpdsE3h/?=
 =?us-ascii?Q?IX0ZWGTfgakEXWfPHDX5FjOIsvP+NKwBg3/meoVQMUUIRXUMTZK/A0t5fQhb?=
 =?us-ascii?Q?MYLY4/50rMpngYiNH9TW3kKpB8xOHO2zhMNWwQkJP4YR4BW8Vj46fkloI71d?=
 =?us-ascii?Q?WrN3gfB7NoNKkYWF7ixrnt2z/WO0+Zs/a8Rn3tduoZJ5yNqEQ1vjOrt3ejEz?=
 =?us-ascii?Q?8knME5OIgwAtHeHluzJ+7X9cImRlUxd9Ggt0E2nxRFtnl8V2Jw5fIzsKl0Ac?=
 =?us-ascii?Q?0H2zTVZojHQY8/EnHSaxFbzRv9fXGBRY/T+of1hWM4nY9ZehMOtkAcC3AJ5P?=
 =?us-ascii?Q?HGetFhFq22oxZZx5mc4izlMpIfpyWG/4fLC1YCD7rtduweeIVr0j+DGoKpuN?=
 =?us-ascii?Q?/4vcuLBRQ1x9LFoHUUljpVwB//1FC58UBZcEWCij/s5ZQFTtpZPO98Mwg7lH?=
 =?us-ascii?Q?n3lUVPkiMGzZcrL3a1M4rJ1BwQL78orYYmhGGrD0SlzqhMD2j7cN73iDlayb?=
 =?us-ascii?Q?1jLWogC14b/dMs2OPYaF/CSWPq2w/XlvDk5mgz8Tq5n1s1veu5yx7O/owhJh?=
 =?us-ascii?Q?gEZMg2bRcTM1v/sBfyeITu4m0Sdn3fx0TXrkWVkbJzumTPUDYY3y4OF5Bc2s?=
 =?us-ascii?Q?FOeS+f/R9DUNG0Cz/+Xu34898raQZiBV5g21kCKQkRzFVlzctn18D22vG2JA?=
 =?us-ascii?Q?1xQS23rkidFqslGJVBSFkN4pAdhfQmf8mhILKdSwebl3KsU03OJ3kWlu1Xnf?=
 =?us-ascii?Q?YwhfiX2JlyHR0VuCCuuI7y5m4vwJ0LZG5y18OQaghb0LgkDS1r8zmiYUfScj?=
 =?us-ascii?Q?PSE1rC6VphQ8sATlvhwfxYMyZqclLklkTmc3AFPEVZGl9x6QSKC2E8ip9PmZ?=
 =?us-ascii?Q?xnNmbdZY0uqIdq2nSgBntxFmAV/ZXkHT19m/scI/b11Z+EyubEaKKf3xVg5q?=
 =?us-ascii?Q?fic7jTxtNk/h6oaY9+OlRWceRHOYqrsvjBdOjYndPC93buLvQL7BzSx9u2HY?=
 =?us-ascii?Q?EihPm6xqQtm2dLXkylb+k1JcR8lwyvfakbNpVlIrr8yD+RmzZyLp3hBr0EXc?=
 =?us-ascii?Q?obugOfmgwSqIMpdzqeBSB36tVbKycT0503rPA21KlnNcvsG2aY+S+G7ssTbO?=
 =?us-ascii?Q?il+aastZcUOWT5k7v1DaAfaA7//GnWS6Gwkr9LXwQ/115vPHWec74N0oSJps?=
 =?us-ascii?Q?hs9El2wEaSZu73U4x6Z3+1GArimni0ivBihBYC4mbiVnkKloExQP+DHJv1v7?=
 =?us-ascii?Q?EwCE5kgioLn6LP03N2oGY7dR6Xx0aRmu7ACM47UZMU51kgEXVOCmvl44pi0C?=
 =?us-ascii?Q?WjlefB+JazhVYATJQw5ABS5iB/zaIvljVu4AtMay+7ISGlci8i4wdN4X9H4d?=
 =?us-ascii?Q?cRmPABQGK5JFjFV7EbFgI86YxPjroh/a8yx4LfAf7JNjrPb8WLbdODa0ZdyC?=
 =?us-ascii?Q?5YwTGGOpXGrUiFPK6JURTo0p0u0Hkf1SFo0dSLMCvJeLDcAXDV4kpvy+O97f?=
 =?us-ascii?Q?XfFRzHFpV6DYZK2lNMKfGW8YglGqcbR3g+XKl/o9gKK2CA/XsyVz+Tp+35xV?=
 =?us-ascii?Q?AdBzeWQe08apzJ/2BRK6JuVjqudjPklsnTLGw1JmriN2uQcKZova0NogSXVM?=
 =?us-ascii?Q?IiacL+0yO5AnKmFWulMfcOM3EG45bsw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 03463b1d-e126-47e1-cb49-08de4fb08fb5
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 18:54:47.8870 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qKUswBGhLzsUXJoCkS4SfVxrEzmpqURBithrEqWE2ZIvpIJy67RCMDYoiK6KCCZpMtTsiTBktj7WESOi5KH40TsQcK3jB03P9CukQKzeHgQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7733
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

On Fri, Jan 09, 2026 at 01:41:04PM -0500, Zi Yan wrote:
> On 9 Jan 2026, at 13:37, Andrew Morton wrote:
> 
> > On Fri, 9 Jan 2026 14:19:16 +0100 "David Hildenbrand (Red Hat)" <david@kernel.org> wrote:
> >
> >> I'm not CCed on the other patches in the series or the cover letter, so
> >> I don't see the context.
> >
> > Both linux-mm and I received a random subset of this series.  Something
> > went wrong.
> 
> Apparently, the whole series[1] was sent to intel-xe and dri-devel lists
> and only mm part was sent to linux-mm and related people.
> 
> Hi Francois,
> 
> Do you mind CCing linux-mm and MM people in the whole series next time?

Sure, will do to ensure context is provided. Sorry for the confusion.

Francois

> 
> Thanks.
> 
> [1] https://lore.kernel.org/all/20260109085605.443316-1-francois.dugast@intel.com/
> 
> Best Regards,
> Yan, Zi
