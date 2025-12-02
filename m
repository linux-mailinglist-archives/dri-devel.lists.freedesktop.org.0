Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 700BCC9C625
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 18:28:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31E8D10E692;
	Tue,  2 Dec 2025 17:28:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pc8aZ4Ud";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12DC010E688;
 Tue,  2 Dec 2025 17:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764696506; x=1796232506;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=oXQGssmGby7yEzwopH8Ap0M7pQHSAMpCTm9wy4+liZM=;
 b=Pc8aZ4UdqA2sN4Q/nFuhOIZmT/z3S7+a5Lxuneofn0mkHr3o+c00YUrw
 GZ8jPunGy+ufw5AGrHS2tzizK0sCZn0+N/L6yefvrcWY+gWxiEfNZUWIO
 J+UM/Mjd3COsxFkQikzdf/EOO1PrPrcBH4z0yXnxigcFIUcUwvj40SqR+
 DhnIxLkJ+73rDw3SBHIW/+L7t/zICrKATtDY/TfgxaInA09c7T6UKC4Ja
 tVV5t/inMlTYYpnYPxG2PjqBs2xbocRg/1Fk9NWzoAd5v53g8St7609aJ
 WyrtOAzxVRnGtoZqdY3HzE1G7pNNpBBU5Vo2Wau6qtAwBFztIeNjTfeAA g==;
X-CSE-ConnectionGUID: TXE2V6MQQwSjgxYAVUOPLw==
X-CSE-MsgGUID: TYYnvtwaSBCbe1eUU0LSqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66566323"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="66566323"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 09:28:25 -0800
X-CSE-ConnectionGUID: TjjlZ6UARBe61a3hY0XgFQ==
X-CSE-MsgGUID: Fu66lK9NSaS70IP0n6C0GQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="194311282"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 09:28:25 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 09:28:24 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 09:28:24 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.10) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 09:28:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x3yVDCwj14OFjPqsSZoQfgi9aSVktnkzHObYW2CHu9vOZSiL8skgfYYSKUn1UYgawVWSrijMwE44OmFpg811bqT+CNPQU+huIrcivFVqNbEKW3uPLlfI0hLyp1US7VjX19yh6joVatOEL5Iz+I4wQpm8n2LTi7V7gp2eKfdn0JT5j+WCxUZkscxl3Csn2O9sdf/DbKWX0HjnAttsmdExeUr/q18Aq/WGP67BBtwNjJSvd1+3ACSP9fNn7RxzbEf4I11mp4osC8VuPBu864SN0FY2H1XLDcYVDF+1+2R7tH7EFtQSzpnN0dXX9NvHvMi4q/Cye5lv/U3GDfs06vrWNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vjxLLWPMvf30oMO0rZ0kaHZM7MOhpDqkv7dAc84Zg64=;
 b=q5n5gSX95AAwt/sEbqQLKd0EvDDkqEa+BLdwAV1g/lV9t4GanQfpqY3uWWl+reB1CCJGF+QKrRJ6hwmoaWW/wQzIF+2+4/3elZXpZ+u3ODowsTUscgA0eNRBuzPiCQ8DsfDz4r7WUs3YyPewzDX1dLDniy9bLUcKElB7mfPryhmCBQnlfTYxZYbJUoCc2Yy2M2WbE1C+LN8hgaAAO6ery3VUT5Fd2Wag8YyepUBkimgD2jU+DO7zdjnkoCwzNbw0dEvHIXkKB5O0zadko7AHSy/U/H7rjJEguTmonHGjG0l5TKgksX1B2ltsKTNTnPzirXgDTx0SwvpAl8G+LvPrig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB6465.namprd11.prod.outlook.com (2603:10b6:208:3a7::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 17:28:22 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9388.003; Tue, 2 Dec 2025
 17:28:21 +0000
Date: Tue, 2 Dec 2025 09:28:18 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <saurabhg.gupta@intel.com>,
 <alex.zuo@intel.com>, <joonas.lahtinen@linux.intel.com>,
 <jianxun.zhang@intel.com>, <shuicheng.lin@intel.com>,
 <dri-devel@lists.freedesktop.org>, <Michal.Wajdeczko@intel.com>,
 <michal.mrozek@intel.com>, <raag.jadav@intel.com>, <ivan.briano@intel.com>,
 <matthew.auld@intel.com>, <dafna.hirschfeld@intel.com>
Subject: Re: [PATCH v28 3/4] drm/xe/xe_vm: Add per VM fault info
Message-ID: <aS8hsmKCc18aGtM8@lstrano-desk.jf.intel.com>
References: <20251201235539.236686-6-jonathan.cavitt@intel.com>
 <20251201235539.236686-9-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251201235539.236686-9-jonathan.cavitt@intel.com>
X-ClientProxiedBy: SJ0PR13CA0002.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::7) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB6465:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cc2a6f2-0221-4c94-4ab5-08de31c83089
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qMTJ+QT99XOYhEV3Cmw7raV+H7mTAQlk3Ja7qzSfKGDU0PxLaKDx+7Afp2ka?=
 =?us-ascii?Q?j1ZH8vDYBCrbocyE+viaelnw5Lf97kBgL0Dnt2tGnT9spdlSSOKa54E51Y8C?=
 =?us-ascii?Q?ctZRwfL2zCuSKTZTzW1IaJehibxg10Mma0N6kFebtR2UXLVZM/yvzzH2fuVk?=
 =?us-ascii?Q?jkNJ4AxZfVVHz7jZl4sXXD13gHO9GPWDFzWxalsmGusRG9R4zkQ1U+cIo3FS?=
 =?us-ascii?Q?g/yAc2U19aiMWgiAgH5s67Q/hRqL6bDTgT7NsdC7baI8EIbERWgysSkkeqiw?=
 =?us-ascii?Q?7k8MO/bJ+SIY9Prqe0bGZzLFo9Nmmp+eytqtKeO7PjcNKU8ZTxXosEs7BMPd?=
 =?us-ascii?Q?BMoii6+oCaPqzqOiogTurr8D9WHvwOb90NobAF7Ox9re62BuqpRh5LrDZSBV?=
 =?us-ascii?Q?CDK3VytKx8iERMoeJxFJjwj6PUP8VW7zyWHaega7p439w63xYHMNAFKcKnO/?=
 =?us-ascii?Q?kkP1FbfnfeL3KTt3DOgQ+0GCUUNFwSKOhICD2hT9jB9fI5TW5Y2OJL579/mB?=
 =?us-ascii?Q?UAQtRG1as0OqSaXJAQY5T+/SJgsCnESw55Vc4IKFX1WhYLe2lvdnsuWu15Sz?=
 =?us-ascii?Q?DL588Uxn+hv0yDc1CMrF6EVD61yD1JcGVnB+KgOLPfYaS32usamciVz4U/M9?=
 =?us-ascii?Q?y1wg5V2M34fpMcY+dSXWn2bC77sC/AqO7/tLxuTTUxxLAy5VJmAzdkEqNGYF?=
 =?us-ascii?Q?oljTLnSBv0of7LXzmCFfZM9DMWCfQkgVK/RPdcrpdLRqMLERsoWsvvoB5J+s?=
 =?us-ascii?Q?YX41snsKDozgQ00JDPOk/HnrhLFgzcNNQBs8fBAPqaWxZutkm/jEJRqYTGVT?=
 =?us-ascii?Q?wTCzh9tjBfiSAQK8ABM3lRmKiL8i2YO1+jZX4xbGPrJhFgT764PEQj6jMImy?=
 =?us-ascii?Q?ovncQsa22aAwx5vT25yJjsFJVV49oLsepMigV5OeIzlQqxWcKF0Htp2R9rH2?=
 =?us-ascii?Q?m2QyHcsHW1Lev55/7hieee3BZeMjZt/osVPQkorj+bP3BsUa7FZQ+ijm/4OI?=
 =?us-ascii?Q?DaPynM10jT/lD7rPy7OFW/LzL8+HsoiVpWfxUnxuYGxgxHn/e1jEh4tpenN3?=
 =?us-ascii?Q?tu92lTHsQ9l9Ona8ig26mbNdT5Z67dxyiOwoeBNcyz5kRMV+hL8nWV6sTP3P?=
 =?us-ascii?Q?ZgjSTYB/kHTKprZzxQWNgEjwdMsJJ6D/oCQM3b57dZn6ep89HlBf8QG6ZuFa?=
 =?us-ascii?Q?mSPLavPQgL2JxDpAl0ZWWlqMUWq2O/uplmCp0+IKP5rGio+cM60btPQRrhfd?=
 =?us-ascii?Q?UPecURj2ksRSg5Nc59KYpIrzfFQHeC047twx76r167Tb2zavRJAnLJ4XCBqs?=
 =?us-ascii?Q?4lH6StwIGn8VaNsOHN7Xkis10U8NmWDqo1hoU6w4RgTjkNWIAugrjRudGJol?=
 =?us-ascii?Q?/mX1h2Gcy91v951Nqzxjssb57pg6YNoiQOIJtJhdxyoDDvSteVgsWNjj6wJK?=
 =?us-ascii?Q?7tsKYsqVXmm4KFvjvtDXrpXp2Tmxp0+y?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7kva2UiaKAn8zrvuN4eUbyCRjI2wIS8b/zvT2+LvrWgiDNsKT96Lv7JYZPUu?=
 =?us-ascii?Q?KeStyp9nUkYQEeKRvrjpsKL5ERQJRxxh7WhFvhW4bFtlU6lZR4Wc85FLMKWI?=
 =?us-ascii?Q?HMvknHk4Y8Zy/EOTZlTwW9vy55jhiuDlD+xiY32hSD2UV3l6M56fikhzdzTa?=
 =?us-ascii?Q?RZFVkEHdy4b5dPARprOeEEIPjzkcJNPSJZ4Odqu2zxuC4HXRhmZEWkz50hfs?=
 =?us-ascii?Q?Ojj6f4Ca7/QbOqZl2cl4lcO1xnhELgSh+A2DwFLWfE8SaY3DR8kbdiSovVf0?=
 =?us-ascii?Q?ejOi2FAE0H/K6aVQxuDBX3bf+xUM6VO1Ka6Atc5wHOYPONkexFfwuNTFetnW?=
 =?us-ascii?Q?0/dX6OzYcZGP7gH1XckUCVVrUSc8paySC0g8IQuAz0UO2b3TtEobwJf1j1JF?=
 =?us-ascii?Q?chtF5Y2EXCPZC77HlZLxZaWwJx9VGdotDzClMi6x4dulAvEfadrRWSbutltl?=
 =?us-ascii?Q?lbdx331nyuPLNQTL/wDVg6zmiQoyb0j5C/8qLTruxVwTySKZQRoqPzX/g6Af?=
 =?us-ascii?Q?9ECkV6PxsZg8N4KkHuvBZlhf6TNnzJyzQ2a3z2866FbM0gG6aTlBbmHmDZKV?=
 =?us-ascii?Q?zSJ9zeJ39ID+b2UYSDVY72hlJ+b2legFriJxN+zqVEg0jZW1oeLp+JcQpd2x?=
 =?us-ascii?Q?LFtHrEm07N2yv2IwMcEhIaH7gBOM3Ph7K5PcNSnUfnYD1j/ozNF//WZF3cbI?=
 =?us-ascii?Q?a/5slb2GuKf5FB850ZYF+lr0Nc1gP4o7BKnMadgsjgVIciQvq/EoCPqCnFul?=
 =?us-ascii?Q?Ij7pA+t9VNZSy56kiyeFIYCVd6DO/DzGFV7359l0MXUp1pjnh4eg9pBI9Q35?=
 =?us-ascii?Q?eOKpxjfjsJWGLrS7G2LQnmBjfG7PSCpciZWoLkczqOUlnSBlP/BAadVzcJmc?=
 =?us-ascii?Q?1aSMhXAaw/blFcIHxcN8Sm1c5g0hiPbEX3Hkd9OTotbq75jgoKW7kvE1WLaD?=
 =?us-ascii?Q?XqRHl6b55mT1Ze28EUq+ALaL/7Ws9yjoxfWlGlJjdOGJtwywalZLdydiNXqR?=
 =?us-ascii?Q?LNukSrLHDWsgV4SjvR8tPWWlFya2qhh8LIZGVSsTE9TbhkNuZ9Fdi8RD0jYd?=
 =?us-ascii?Q?DfbilOU0Mmtvwon8Vuyrnb2nMK9UBsUEHckTg8Lfohcd6yPaoUMDWZ9glnmR?=
 =?us-ascii?Q?7/ztydZIvln69583vQ1po/EMbfpuaZHfa6PrC5RH56rcWEhKbkbJL1wFLX0C?=
 =?us-ascii?Q?5+02B0V6HP4zc40ayvHg64Ia1S97Vd1HkI+53NfhqEFlTD324ht6iMbX5nV6?=
 =?us-ascii?Q?MYnb+f1NPimDky1hPBbZICrjSeehygkrOAW7Yf4c3xYKRdp2GKLa7pqak8RY?=
 =?us-ascii?Q?Sd+pvIUEaItuALuPamhCm2cSB7pqEUwasK6zJ1G9kHUPYwCERri8i7WPFvIl?=
 =?us-ascii?Q?EcVYCTUX+w1NYi3mqEjSkNbjvZCV1WdJdAvR8XBt958QYLRCvy6b6/DAtHbG?=
 =?us-ascii?Q?ysejWrl/tjnxmUyhYAhoD/0dm5SBqZGUxmLn9tBeP526n6UvZKkn2icwQXLb?=
 =?us-ascii?Q?mgsCNAqxDe3WaUNIIyFuTfeSb1ord11fsHSCvEx86gti09kzP0LIKtW5+820?=
 =?us-ascii?Q?HrkQD+R4O+5ceiSGb4I2yCz7XA1qVchSIzHZgXrjpYBveFWdZheojVsIxeHK?=
 =?us-ascii?Q?Rw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cc2a6f2-0221-4c94-4ab5-08de31c83089
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 17:28:21.2833 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xY9IzLkOfclZrCpcKQC5Xov1En411/xdUztytoys672feypiOkn/kIlWVPvgEcAQEE1Tn3adxPp3H5MeILit/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6465
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

On Mon, Dec 01, 2025 at 11:55:43PM +0000, Jonathan Cavitt wrote:
> Add additional information to each VM so they can report up to the first
> 50 seen faults.  Only pagefaults are saved this way currently, though in
> the future, all faults should be tracked by the VM for future reporting.
> 
> Additionally, of the pagefaults reported, only failed pagefaults are
> saved this way, as successful pagefaults should recover silently and not
> need to be reported to userspace.
> 
> v2:
> - Free vm after use (Shuicheng)
> - Compress pf copy logic (Shuicheng)
> - Update fault_unsuccessful before storing (Shuicheng)
> - Fix old struct name in comments (Shuicheng)
> - Keep first 50 pagefaults instead of last 50 (Jianxun)
> 
> v3:
> - Avoid unnecessary execution by checking MAX_PFS earlier (jcavitt)
> - Fix double-locking error (jcavitt)
> - Assert kmemdump is successful (Shuicheng)
> 
> v4:
> - Rename xe_vm.pfs to xe_vm.faults (jcavitt)
> - Store fault data and not pagefault in xe_vm faults list (jcavitt)
> - Store address, address type, and address precision per fault (jcavitt)
> - Store engine class and instance data per fault (Jianxun)
> - Add and fix kernel docs (Michal W)
> - Properly handle kzalloc error (Michal W)
> - s/MAX_PFS/MAX_FAULTS_SAVED_PER_VM (Michal W)
> - Store fault level per fault (Micahl M)
> 
> v5:
> - Store fault and access type instead of address type (Jianxun)
> 
> v6:
> - Store pagefaults in non-fault-mode VMs as well (Jianxun)
> 
> v7:
> - Fix kernel docs and comments (Michal W)
> 
> v8:
> - Fix double-locking issue (Jianxun)
> 
> v9:
> - Do not report faults from reserved engines (Jianxun)
> 
> v10:
> - Remove engine class and instance (Ivan)
> 
> v11:
> - Perform kzalloc outside of lock (Auld)
> 
> v12:
> - Fix xe_vm_fault_entry kernel docs (Shuicheng)
> 
> v13:
> - Rebase and refactor (jcavitt)
> 
> v14:
> - Correctly ignore fault mode in save_pagefault_to_vm (jcavitt)
> 
> v15:
> - s/save_pagefault_to_vm/xe_pagefault_save_to_vm (Matt Brost)
> - Use guard instead of spin_lock/unlock (Matt Brost)
> - GT was added to xe_pagefault struct.  Use xe_gt_hw_engine
>   instead of creating a new helper function (Matt Brost)
> 
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Cc: Shuicheng Lin <shuicheng.lin@intel.com>
> Cc: Jianxun Zhang <jianxun.zhang@intel.com>
> Cc: Michal Wajdeczko <Michal.Wajdeczko@intel.com>
> Cc: Michal Mzorek <michal.mzorek@intel.com>
> Cc: Ivan Briano <ivan.briano@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pagefault.c | 26 ++++++++++++
>  drivers/gpu/drm/xe/xe_vm.c        | 67 +++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_vm.h        |  9 +++++
>  drivers/gpu/drm/xe/xe_vm_types.h  | 29 +++++++++++++
>  4 files changed, 131 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
> index 0b625a52a598..0fe092226d0a 100644
> --- a/drivers/gpu/drm/xe/xe_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> @@ -247,6 +247,31 @@ static void xe_pagefault_print(struct xe_pagefault *pf)
>  		  pf->consumer.engine_instance);
>  }
>  
> +static void xe_pagefault_save_to_vm(struct xe_device *xe, struct xe_pagefault *pf)
> +{
> +	struct xe_vm *vm;
> +
> +	/*
> +	 * Pagefault may be asociated to VM that is not in fault mode.
> +	 * Perform asid_to_vm behavior, except if VM is not in fault
> +	 * mode, return VM anyways.
> +	 */
> +	down_read(&xe->usm.lock);
> +	vm = xa_load(&xe->usm.asid_to_vm, pf->consumer.asid);
> +	if (vm)
> +		xe_vm_get(vm);
> +	else
> +		vm = ERR_PTR(-EINVAL);
> +	up_read(&xe->usm.lock);
> +
> +	if (IS_ERR(vm))
> +		return;
> +
> +	xe_vm_add_fault_entry_pf(vm, pf);
> +
> +	xe_vm_put(vm);
> +}
> +
>  static void xe_pagefault_queue_work(struct work_struct *w)
>  {
>  	struct xe_pagefault_queue *pf_queue =
> @@ -266,6 +291,7 @@ static void xe_pagefault_queue_work(struct work_struct *w)
>  		err = xe_pagefault_service(&pf);
>  		if (err) {
>  			xe_pagefault_print(&pf);
> +			xe_pagefault_save_to_vm(gt_to_xe(pf.gt), &pf);
>  			xe_gt_dbg(pf.gt, "Fault response: Unsuccessful %pe\n",
>  				  ERR_PTR(err));
>  		}
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 8ab726289583..dc6c36191274 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -27,6 +27,7 @@
>  #include "xe_device.h"
>  #include "xe_drm_client.h"
>  #include "xe_exec_queue.h"
> +#include "xe_gt.h"
>  #include "xe_migrate.h"
>  #include "xe_pat.h"
>  #include "xe_pm.h"
> @@ -578,6 +579,67 @@ static void preempt_rebind_work_func(struct work_struct *w)
>  	trace_xe_vm_rebind_worker_exit(vm);
>  }
>  
> +/**
> + * xe_vm_add_fault_entry_pf() - Add pagefault to vm fault list
> + * @vm: The VM.
> + * @pf: The pagefault.
> + *
> + * This function takes the data from the pagefault @pf and saves it to @vm->faults.list.
> + *
> + * The function exits silently if the list is full, and reports a warning if the pagefault
> + * could not be saved to the list.
> + */
> +void xe_vm_add_fault_entry_pf(struct xe_vm *vm, struct xe_pagefault *pf)
> +{
> +	struct xe_vm_fault_entry *e = NULL;
> +	struct xe_hw_engine *hwe;
> +
> +	/* Do not report faults on reserved engines */
> +	hwe = xe_gt_hw_engine(pf->gt, pf->consumer.engine_class,
> +			      pf->consumer.engine_instance, false);
> +	if (!hwe || xe_hw_engine_is_reserved(hwe))
> +		return;
> +
> +	e = kzalloc(sizeof(*e), GFP_KERNEL);
> +	if (!e) {
> +		drm_warn(&vm->xe->drm,
> +			 "Could not allocate memory for fault!\n");
> +		return;
> +	}
> +
> +	guard(spinlock)(&vm->faults.lock);
> +
> +	/*
> +	 * Limit the number of faults in the fault list to prevent
> +	 * memory overuse.
> +	 */
> +	if (vm->faults.len >= MAX_FAULTS_SAVED_PER_VM) {
> +		kfree(e);
> +		return;
> +	}
> +
> +	e->address = pf->consumer.page_addr;
> +	e->address_precision = 1;

Can you explain what address_precision means? It is a little unclear what '1' means here.

Everything else LGTM.

Matt

> +	e->access_type = pf->consumer.access_type;
> +	e->fault_type = pf->consumer.fault_type;
> +	e->fault_level = pf->consumer.fault_level;
> +
> +	list_add_tail(&e->list, &vm->faults.list);
> +	vm->faults.len++;
> +}
> +
> +static void xe_vm_clear_fault_entries(struct xe_vm *vm)
> +{
> +	struct xe_vm_fault_entry *e, *tmp;
> +
> +	guard(spinlock)(&vm->faults.lock);
> +	list_for_each_entry_safe(e, tmp, &vm->faults.list, list) {
> +		list_del(&e->list);
> +		kfree(e);
> +	}
> +	vm->faults.len = 0;
> +}
> +
>  static int xe_vma_ops_alloc(struct xe_vma_ops *vops, bool array_of_binds)
>  {
>  	int i;
> @@ -1503,6 +1565,9 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags, struct xe_file *xef)
>  	INIT_LIST_HEAD(&vm->userptr.invalidated);
>  	spin_lock_init(&vm->userptr.invalidated_lock);
>  
> +	INIT_LIST_HEAD(&vm->faults.list);
> +	spin_lock_init(&vm->faults.lock);
> +
>  	ttm_lru_bulk_move_init(&vm->lru_bulk_move);
>  
>  	INIT_WORK(&vm->destroy_work, vm_destroy_work_func);
> @@ -1808,6 +1873,8 @@ void xe_vm_close_and_put(struct xe_vm *vm)
>  	}
>  	up_write(&xe->usm.lock);
>  
> +	xe_vm_clear_fault_entries(vm);
> +
>  	for_each_tile(tile, xe, id)
>  		xe_range_fence_tree_fini(&vm->rftree[id]);
>  
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index 361f10b3c453..e9f2de4189e0 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -12,6 +12,12 @@
>  #include "xe_map.h"
>  #include "xe_vm_types.h"
>  
> +/**
> + * MAX_FAULTS_SAVED_PER_VM - Maximum number of faults each vm can store before future
> + * faults are discarded to prevent memory overuse
> + */
> +#define MAX_FAULTS_SAVED_PER_VM	50
> +
>  struct drm_device;
>  struct drm_printer;
>  struct drm_file;
> @@ -22,6 +28,7 @@ struct dma_fence;
>  
>  struct xe_exec_queue;
>  struct xe_file;
> +struct xe_pagefault;
>  struct xe_sync_entry;
>  struct xe_svm_range;
>  struct drm_exec;
> @@ -309,6 +316,8 @@ void xe_vm_snapshot_capture_delayed(struct xe_vm_snapshot *snap);
>  void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct drm_printer *p);
>  void xe_vm_snapshot_free(struct xe_vm_snapshot *snap);
>  
> +void xe_vm_add_fault_entry_pf(struct xe_vm *vm, struct xe_pagefault *pf);
> +
>  /**
>   * xe_vm_set_validating() - Register this task as currently making bos resident
>   * @allow_res_evict: Allow eviction of buffer objects bound to @vm when
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index 3bf912bfbdcc..fff914fb0aa6 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -20,6 +20,7 @@
>  #include "xe_userptr.h"
>  
>  struct xe_bo;
> +struct xe_pagefault;
>  struct xe_svm_range;
>  struct xe_sync_entry;
>  struct xe_user_fence;
> @@ -165,6 +166,24 @@ struct xe_userptr_vma {
>  
>  struct xe_device;
>  
> +/**
> + * struct xe_vm_fault_entry - Elements of vm->faults.list
> + * @list: link into @xe_vm.faults.list
> + * @address: address of the fault
> + * @address_precision: precision of faulted address
> + * @access_type: type of address access that resulted in fault
> + * @fault_type: type of fault reported
> + * @fault_level: fault level of the fault
> + */
> +struct xe_vm_fault_entry {
> +	struct list_head list;
> +	u64 address;
> +	u32 address_precision;
> +	u8 access_type;
> +	u8 fault_type;
> +	u8 fault_level;
> +};
> +
>  struct xe_vm {
>  	/** @gpuvm: base GPUVM used to track VMAs */
>  	struct drm_gpuvm gpuvm;
> @@ -302,6 +321,16 @@ struct xe_vm {
>  		bool capture_once;
>  	} error_capture;
>  
> +	/** @faults: List of all faults associated with this VM */
> +	struct {
> +		/** @faults.lock: lock protecting @faults.list */
> +		spinlock_t lock;
> +		/** @faults.list: list of xe_vm_fault_entry entries */
> +		struct list_head list;
> +		/** @faults.len: length of @faults.list */
> +		unsigned int len;
> +	} faults;
> +
>  	/**
>  	 * @validation: Validation data only valid with the vm resv held.
>  	 * Note: This is really task state of the task holding the vm resv,
> -- 
> 2.43.0
> 
