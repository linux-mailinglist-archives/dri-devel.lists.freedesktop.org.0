Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F28D6996125
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 09:42:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DEED10E66C;
	Wed,  9 Oct 2024 07:42:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IIjMaHuZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6DF610E66C;
 Wed,  9 Oct 2024 07:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728459738; x=1759995738;
 h=date:from:to:cc:subject:message-id:in-reply-to: mime-version;
 bh=GHBR8CVGu/kj8tQrrvahgnK+Kal7JAGV6y92B8ip+uY=;
 b=IIjMaHuZs7r1raqeHfCF1ubfDBWTp9U9i6pLyBBCrnDcGO3mKSp8tz0D
 5QxMY3+WysdB1o5Dbtq8C/kTYeVXWyN29PxSmKxNqkXWva1r5oDDRApQj
 R5upPXETf7iqgJrVaXg0Oz1skMNzo388E2zaM4xe/PGL9ILLkBuBGTO0G
 NFt05G3eXqY9F4GNgSnAWqMYgilHhjdesyfM4ANzp0PGTHq94kFEYhZaD
 zPkc6ETDmWtMj0TgmwBqowAc2FhKVa77e3nehJBm9Fm0RR1wA6Pv2YD9h
 IDDxSXO8V1ywnzc7z9hW9O04cjq5+6DvfPDAWfzNCqmiQlUBBHRYkN5BZ g==;
X-CSE-ConnectionGUID: q2sIarv1TcK9kbMaGnzJfQ==
X-CSE-MsgGUID: W1rFG249Rym0EF8Ml1+Ycg==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="38329680"
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; d="scan'208";a="38329680"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 00:42:17 -0700
X-CSE-ConnectionGUID: zOdJhZP3Ta2cAHR2LgawPQ==
X-CSE-MsgGUID: UnfajBytQhqx2oqmk4GMXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; d="scan'208";a="76040470"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Oct 2024 00:42:17 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 9 Oct 2024 00:42:16 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 9 Oct 2024 00:42:16 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 9 Oct 2024 00:42:16 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.43) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 9 Oct 2024 00:42:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zV1zLJ2yQFjjHq1OjwNp6ZYxQWxoCjYB6HtRtbldJaQ8WG3yrWuGQWgNQ8iNnuF9vXVRbnd/AiuxmdXj3SmWnbu6p8RR8ntfoGWCp7UMW6ggY6kXNv4XglPlzPVrGqZst6yT/D0uvCK5MLzeVa5ENZyCN8fMNBC6YJLO7mRj4lLU3yJEXRJxrAHfs46bRhgUig8CvWEZPJuGI5w1oM5RzFknK3sHghKQBNwSOBluLyN1O/VBz6t0AP9pPBOn3TB2juQkwqq5uzb9SKwhkEFnO9jeOt72v3bOi8bF6KBKFmVAu+fHuQMMEG0YKuyD9BRZAXBFjvSWd82HZF3EPwNYLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mjnc9OcgspeIBL7Pu5905uaEA/vhGvl35mAdmLFavqk=;
 b=MLEyTWqKIL7pzkN08PKPYtQFkWSxqdUv5/rBwrehRsCHdeA4FPWNzF/v+3b3UdbJcROEurTWKdEYFkoA1b+PkAHzO2YcCQfFzNceIv6dNinHcyZcNniuocs08wRVOcS/1hoCbWX7RXzxkTu2I1O7fsEy5ULs0EH3SOpHpU02ETW0RDTjOHtb95Oz8VFt41TJTu4MG2+oibOt1KyWr8FO623A6fiO/dXRCJYYF4BocFq3p622dOUiqiuecV/fVQ3ImGWP86Z8coVDthgY7nnnc/k33i9qjlvsnR1aPFJL7cXzogmIQ3mzgKdpYCZdMzbPd4gjWl8veTvoJssOAAQ5wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by BL3PR11MB6460.namprd11.prod.outlook.com (2603:10b6:208:3bf::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.24; Wed, 9 Oct
 2024 07:42:13 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.8048.013; Wed, 9 Oct 2024
 07:42:13 +0000
Date: Wed, 9 Oct 2024 15:42:02 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Peter Zijlstra
 <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Will Deacon
 <will@kernel.org>, Waiman Long <longman@redhat.com>, Boqun Feng
 <boqun.feng@gmail.com>, Maarten Lankhorst <maarten@lankhorst.se>, Christian
 =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 <linux-kernel@vger.kernel.org>, <intel-xe@lists.freedesktop.org>, Thomas
 =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>, <oliver.sang@intel.com>
Subject: Re: [PATCH RESEND] locking/ww_mutex: Adjust to lockdep nest_lock
 requirements
Message-ID: <202410091542.f6c4a438-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241002125611.361001-1-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: KL1PR0401CA0001.apcprd04.prod.outlook.com
 (2603:1096:820:f::6) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|BL3PR11MB6460:EE_
X-MS-Office365-Filtering-Correlation-Id: 8554364f-0df7-42a7-32ad-08dce835e38a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?o8+BGFvNRsgsDDVEOKxxtNsXDP6cHe1PIFVDrJw9pva9HRFM0sHxMlzT74CY?=
 =?us-ascii?Q?Rl5caCtJ/vvyxJlxjo+xkM8teBDkVJkHYWnXqg3LRuVvn1XU2jujLmez9v3c?=
 =?us-ascii?Q?QIds+d8EVEfUqEIL80w6o9z7rP94iLFbSwGp6reyrExJGVCvHH7DYNYTbg7z?=
 =?us-ascii?Q?c6TqXNgWhmlYFMx4usbvEGzqSuXBgifJYisdMWmvLiuhDFD8Wrol0eAoEmmm?=
 =?us-ascii?Q?emntAwrcXsyjdpAN/veRxrm9IzCjQoOsZpjrotLw6p+f4tL5mXZvre+NUipP?=
 =?us-ascii?Q?gJ/ll8ltUdxH2pbPqLzcdfsltRmWfHJh/yx4dRMG7cG7KiosNCG22z4xFxZu?=
 =?us-ascii?Q?4ZgUBfzfQXPqvMAqaeKReGk6cY7qYwl29AA8o/T4QjTMYdDwswfkN/ctfvym?=
 =?us-ascii?Q?SKyhLA5J6w0TJkKSViyd7vDyFaxG55I7Ya/nMCJUU5NbDPoR4NKsWqXdVz92?=
 =?us-ascii?Q?ux7LrsBIsCcmwG6TVxCcRJD39lhuYzC2CG+WyBoDXfShhy/HY+qORQRWGzi/?=
 =?us-ascii?Q?03ltOan3D+R5XFVuJGQKVc4UCGCvYgPqY2zuiYRM8wTm4sj5R2a37aQYPbQi?=
 =?us-ascii?Q?dY+BbNYIgIvHniM0P0TFYkksSWIG/KS1WdzqCFuE05duQTEr1gva6CE/GDsJ?=
 =?us-ascii?Q?0L17PxF4fDnK6EeMbkb1db/P+BsuDmLWWf/MuzXg+hlbwhFypcgya0GTz4IE?=
 =?us-ascii?Q?3DOkSgWBgruQU57fQf7R7jhujx8M9WzF5ai464x2kQ4mZ95Eu4Oe1Hgm4CCR?=
 =?us-ascii?Q?zISF9r54gMMN/y/6NZ/iLx4m6i2lU8GBO402UnVbbaAD18RtYtzuJvv129hj?=
 =?us-ascii?Q?WeAmU/iDE6mpB0wPbXbGxgqgVgrblOZPfhzQZfSltDNv15JdHd/EfuRY3Hr0?=
 =?us-ascii?Q?9U7hnun05LWjpdqg9h7Uj+4efhcRyvlnMJMYPsr5WtOhjk0ka8HcRomrkF3K?=
 =?us-ascii?Q?Vcf0tB63nkCZyB2DXsGQtIPP4FhDffyae2UzR1gT2FJY222K2rWcCYDUfzLL?=
 =?us-ascii?Q?AwPeqVSY/9jeeyqWipUlCSKlh6qAhD6e9j2f9Y4dAscdadlstP6wCjJ8dEMu?=
 =?us-ascii?Q?/2xlPMBX+M5OENnB/KbpOoz4Pgekik9fSASdsvXD44h0BvASMiutqDOU6RmC?=
 =?us-ascii?Q?DEtrfmHD4WyGT3UunXkHWkWG1//ZGAtwNBHjgcwfwyDCwM4hl/OfHzAjJSsP?=
 =?us-ascii?Q?8BRwkh9KQqhlgdW6PtgF/cFxEw99TNcjdiNzgIWfl7/TZg4rll4bZZ3YO6s?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8603.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Oe4fZqvY72n6SInuLhLEEL4C73Xuul9BVHPzsKAJEnJrF5QkKABmgtMjTD5T?=
 =?us-ascii?Q?C4hHHh+JCCOG8QBHOkgW13y67yH7GZYhma6NL3R9v4gBNbDuRUKUJ488JmKm?=
 =?us-ascii?Q?k3iyxYsLbxRlJpxVcikWil9E5iSCod2rcMYKrljPFn0JeDBjhsmNKD9uh6vW?=
 =?us-ascii?Q?2pU931Dj9Gxssk6iCVnOdi2am7Tn7YHMGysPOiIoKLQb58l4Ffw2gRbBnu/j?=
 =?us-ascii?Q?zvhzPvBiyQuxHOnYAWTgdayowM3DGUezwpfJPB474GRIkRJBkZrSRIAA38pq?=
 =?us-ascii?Q?djZN4N4jomGmLVFBQZsZGG8dnaGGIBQfa3TcGyezjbty7ZKZuTZa9OdDAN5U?=
 =?us-ascii?Q?NXTXZSdgh7SQ7m7qVd9aYs72BWL/18rn1a96BT+CV1zN+THykzJ4xkHo4OTC?=
 =?us-ascii?Q?HVQ9wUW0GmGu9lhzMlgnsIo7du1T1bWmOU30ISeF+ACrzeuHgQNoFZ37EVgj?=
 =?us-ascii?Q?D4buRMrtTouj6DqI4pkvaPYxmCqF+wlH33kzoUWWPOoLioSCbnoeTZm3l22E?=
 =?us-ascii?Q?f/V8qnhzaIWqyGCt3JrikYNezdqBW1UvkzXbVqEETn7o3CDjOzQv1DBPgOsI?=
 =?us-ascii?Q?M7ueEKXw0w9f3SP9ekbkFH8OJMLnoUdaSnzMSBoWp0DtNInniNBp6pxYdpGP?=
 =?us-ascii?Q?T+YFuyx/qhO5WHHpDBatfvVRmD2chrYvB180FszTT2wWmxVaGzdR+L4+diD0?=
 =?us-ascii?Q?C5/NcAm+buwIco56bafsKIDUvXFqIntso50z3lXbH2Nw5KubyaSEQdUnk73a?=
 =?us-ascii?Q?8w9jimB5YxcRl8R6JLe0N3fgRku5C7ws9/Xg8F/VvytcZgjMrXmv3EBflOPd?=
 =?us-ascii?Q?rgRFJQWHrOCKYoqOncb/KDpzGimh/EL2vnwNz+TLjLeKG3EHkpT25CIJrHom?=
 =?us-ascii?Q?w5pcTW2NGFpISTr9uJkLpuGsAa3ZZ7ImtEQ3zlc0WvOBd3M+qMg0JkPLgKIj?=
 =?us-ascii?Q?omr5PGVI0WJu39+7LGJYofe345l9EPjColejG/IrX+xLtETuZT/gR6/ugcjr?=
 =?us-ascii?Q?qVjW4kMC3UjN1kwhFv0ULyVW3INbn73oZr5/XIo/QGwSnL9GseFnVVdjNd78?=
 =?us-ascii?Q?oJ9zg/Zb+IzkgTdrwMt5IJ/nRZ/UuJtW7VfiCETkN6O9IK34CerU52SfCxdn?=
 =?us-ascii?Q?drzpScAq2FI0EW+2ZZGDYPTGGgFV/YVYjnSM2jkOEznNC5uN3qJoRH+Z0TwT?=
 =?us-ascii?Q?zI+gpt/nUEyLhhvPRIBPaGz2KAzXhcyN9WAjTmSTFvoK1Vgwj6LNWX6YJec4?=
 =?us-ascii?Q?d1dORSoj0KG0Su/9u76TuppqOEFD0ZGFHcYYZWpq9aBGTIW+Rmsowwhr3jMA?=
 =?us-ascii?Q?j0g8THqVrKx/T1ojgvEa/k8qhfu8b1tyrD3thMg0Qo5m1ed4TFwBh5axix12?=
 =?us-ascii?Q?kprPl0+mQwXZcA+ng9pr34ljfFQ6PXhB6pefx2Dt8/hC9glcTZlWG2CwE7ey?=
 =?us-ascii?Q?i460QiZYvbPrJcC5lMQuLr/V6Y+oxsW/aoi18G2Va5CWaacQ9FfiSazhR/W2?=
 =?us-ascii?Q?Av7FUhSYPVmO1XwTvRlXV+/gf0GjvlQWhg6RrGisvV26GkFPY3g9HCBb4Ag3?=
 =?us-ascii?Q?7yVNP51KcjbxmE8AY3BDo3DEeADUt46Z4ePKQiACwwc5rmS95PCEz09gO2kP?=
 =?us-ascii?Q?CA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8554364f-0df7-42a7-32ad-08dce835e38a
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2024 07:42:12.9693 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 14IFmvTGaNzVp9w+7NZCMQKmhPil9sue3g55RMB4aoKSrcFIeUu97WDMwxKn2hQKTIc8EKKw+6JVk7TW0LSNMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6460
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



Hello,

kernel test robot noticed "WARNING:at_kernel/locking/lockdep.c:#__lock_acquire" on:

commit: d417c66b8b12b5706c9df4ddf5367af540f195c6 ("[PATCH RESEND] locking/ww_mutex: Adjust to lockdep nest_lock requirements")
url: https://github.com/intel-lab-lkp/linux/commits/Thomas-Hellstr-m/locking-ww_mutex-Adjust-to-lockdep-nest_lock-requirements/20241002-205818
base: https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git d00b83d416e73bc3fa4d21b14bec920e88b70ce6
patch link: https://lore.kernel.org/all/20241002125611.361001-1-thomas.hellstrom@linux.intel.com/
patch subject: [PATCH RESEND] locking/ww_mutex: Adjust to lockdep nest_lock requirements

in testcase: kernel-selftests
version: kernel-selftests-x86_64-977d51cf-1_20240508
with following parameters:

	group: locking



compiler: gcc-12
test machine: 4 threads Intel(R) Xeon(R) CPU E3-1225 v5 @ 3.30GHz (Skylake) with 16G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202410091542.f6c4a438-oliver.sang@intel.com


[   63.327071][  T246] ------------[ cut here ]------------
[   63.332388][  T246] DEBUG_LOCKS_WARN_ON(hlock->references < references)
[ 63.332410][ T246] WARNING: CPU: 2 PID: 246 at kernel/locking/lockdep.c:5058 __lock_acquire (kernel/locking/lockdep.c:5058 (discriminator 9)) 
[   63.348622][  T246] Modules linked in: test_ww_mutex(+) openvswitch nf_conncount nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 psample btrfs blake2b_generic xor zstd_compress raid6_pq libcrc32c intel_rapl_msr intel_rapl_common x86_pkg_temp_thermal intel_powerclamp sd_mod coretemp sg kvm_intel ipmi_devintf ipmi_msghandler i915 kvm binfmt_misc drm_buddy intel_gtt drm_display_helper crct10dif_pclmul crc32_pclmul crc32c_intel mei_wdt ghash_clmulni_intel ttm wmi_bmof sha512_ssse3 ahci rapl drm_kms_helper libahci video intel_cstate intel_uncore serio_raw libata mei_me i2c_i801 mei i2c_smbus intel_pch_thermal ie31200_edac wmi acpi_pad tpm_infineon loop fuse drm dm_mod ip_tables sch_fq_codel
[   63.409553][  T246] CPU: 2 PID: 246 Comm: kworker/u16:5 Tainted: G S                 6.10.0-04481-gd417c66b8b12 #1
[   63.419907][  T246] Hardware name: HP HP Z238 Microtower Workstation/8183, BIOS N51 Ver. 01.63 10/05/2017
[   63.429471][  T246] Workqueue: test-ww_mutex stress_inorder_work [test_ww_mutex]
[ 63.436889][ T246] RIP: 0010:__lock_acquire (kernel/locking/lockdep.c:5058 (discriminator 9)) 
[ 63.442284][ T246] Code: d2 0f 85 15 0c 00 00 44 8b 0d 7d df c7 04 45 85 c9 0f 85 d0 fe ff ff 48 c7 c6 c0 c1 2a 84 48 c7 c7 00 91 2a 84 e8 8d 39 e5 ff <0f> 0b e9 b6 fe ff ff 41 be 02 00 00 00 e9 11 f7 ff ff 31 db e9 bb
All code
========
   0:	d2 0f                	rorb   %cl,(%rdi)
   2:	85 15 0c 00 00 44    	test   %edx,0x4400000c(%rip)        # 0x44000014
   8:	8b 0d 7d df c7 04    	mov    0x4c7df7d(%rip),%ecx        # 0x4c7df8b
   e:	45 85 c9             	test   %r9d,%r9d
  11:	0f 85 d0 fe ff ff    	jne    0xfffffffffffffee7
  17:	48 c7 c6 c0 c1 2a 84 	mov    $0xffffffff842ac1c0,%rsi
  1e:	48 c7 c7 00 91 2a 84 	mov    $0xffffffff842a9100,%rdi
  25:	e8 8d 39 e5 ff       	callq  0xffffffffffe539b7
  2a:*	0f 0b                	ud2    		<-- trapping instruction
  2c:	e9 b6 fe ff ff       	jmpq   0xfffffffffffffee7
  31:	41 be 02 00 00 00    	mov    $0x2,%r14d
  37:	e9 11 f7 ff ff       	jmpq   0xfffffffffffff74d
  3c:	31 db                	xor    %ebx,%ebx
  3e:	e9                   	.byte 0xe9
  3f:	bb                   	.byte 0xbb

Code starting with the faulting instruction
===========================================
   0:	0f 0b                	ud2    
   2:	e9 b6 fe ff ff       	jmpq   0xfffffffffffffebd
   7:	41 be 02 00 00 00    	mov    $0x2,%r14d
   d:	e9 11 f7 ff ff       	jmpq   0xfffffffffffff723
  12:	31 db                	xor    %ebx,%ebx
  14:	e9                   	.byte 0xe9
  15:	bb                   	.byte 0xbb
[   63.461748][  T246] RSP: 0018:ffffc9000141f7a8 EFLAGS: 00010086
[   63.467683][  T246] RAX: 0000000000000000 RBX: 0000000000000001 RCX: 0000000000000027
[   63.475525][  T246] RDX: 0000000000000027 RSI: 0000000000000004 RDI: ffff8883b5330c48
[   63.483354][  T246] RBP: ffff888430688000 R08: 0000000000000001 R09: ffffed1076a66189
[   63.491172][  T246] R10: ffff8883b5330c4b R11: 0000000000000001 R12: ffff888430688f58
[   63.499015][  T246] R13: 00000000000000a0 R14: ffff88841d5b1f28 R15: 0000000000000000
[   63.506860][  T246] FS:  0000000000000000(0000) GS:ffff8883b5300000(0000) knlGS:0000000000000000
[   63.515659][  T246] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   63.522116][  T246] CR2: 00005566d67bd842 CR3: 000000043b67e002 CR4: 00000000003706f0
[   63.529942][  T246] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[   63.537768][  T246] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[   63.545591][  T246] Call Trace:
[   63.548744][  T246]  <TASK>
[ 63.551537][ T246] ? __warn (kernel/panic.c:693) 
[ 63.555470][ T246] ? __lock_acquire (kernel/locking/lockdep.c:5058 (discriminator 9)) 
[ 63.560262][ T246] ? report_bug (lib/bug.c:180 lib/bug.c:219) 
[ 63.564637][ T246] ? handle_bug (arch/x86/kernel/traps.c:239) 
[ 63.568838][ T246] ? exc_invalid_op (arch/x86/kernel/traps.c:260 (discriminator 1)) 
[ 63.573389][ T246] ? asm_exc_invalid_op (arch/x86/include/asm/idtentry.h:621) 
[ 63.578283][ T246] ? __lock_acquire (kernel/locking/lockdep.c:5058 (discriminator 9)) 
[ 63.583090][ T246] ? __lock_acquire (kernel/locking/lockdep.c:5058 (discriminator 9)) 
[ 63.587884][ T246] lock_acquire (kernel/locking/lockdep.c:466 kernel/locking/lockdep.c:5758 kernel/locking/lockdep.c:5721) 
[ 63.592243][ T246] ? stress_inorder_work (kernel/locking/test-ww_mutex.c:456) test_ww_mutex
[ 63.598787][ T246] ? __pfx_lock_acquire (kernel/locking/lockdep.c:5724) 
[ 63.603676][ T246] ? __pfx_do_raw_spin_lock (kernel/locking/spinlock_debug.c:114) 
[ 63.608899][ T246] ? __pfx___might_resched (kernel/sched/core.c:8392) 
[ 63.614036][ T246] ? __ww_mutex_lock+0x94c/0x2b50 
[ 63.619954][ T246] __ww_mutex_lock+0x1f9/0x2b50 
[ 63.625696][ T246] ? stress_inorder_work (kernel/locking/test-ww_mutex.c:456) test_ww_mutex
[ 63.632218][ T246] ? stress_inorder_work (kernel/locking/test-ww_mutex.c:456) test_ww_mutex
[ 63.638750][ T246] ? __pfx___ww_mutex_lock+0x10/0x10 
[ 63.644940][ T246] ? __mutex_unlock_slowpath (arch/x86/include/asm/atomic64_64.h:101 include/linux/atomic/atomic-arch-fallback.h:4329 include/linux/atomic/atomic-long.h:1506 include/linux/atomic/atomic-instrumented.h:4481 kernel/locking/mutex.c:929) 
[ 63.650454][ T246] ? lock_is_held_type (kernel/locking/lockdep.c:5497 kernel/locking/lockdep.c:5827) 
[ 63.655348][ T246] ? __pfx___might_resched (kernel/sched/core.c:8392) 
[ 63.660502][ T246] ? ww_mutex_lock (kernel/locking/mutex.c:878) 
[ 63.665047][ T246] ww_mutex_lock (kernel/locking/mutex.c:878) 
[ 63.669432][ T246] stress_inorder_work (kernel/locking/test-ww_mutex.c:456) test_ww_mutex
[ 63.675813][ T246] ? __pfx_stress_inorder_work (kernel/locking/test-ww_mutex.c:434) test_ww_mutex
[ 63.682709][ T246] ? lock_is_held_type (kernel/locking/lockdep.c:5497 kernel/locking/lockdep.c:5827) 
[ 63.687600][ T246] process_one_work (kernel/workqueue.c:3236) 
[ 63.692398][ T246] ? __pfx_lock_acquire (kernel/locking/lockdep.c:5724) 
[ 63.697307][ T246] ? __pfx_process_one_work (kernel/workqueue.c:3133) 
[ 63.702545][ T246] ? assign_work (kernel/workqueue.c:1202) 
[ 63.707003][ T246] ? lock_is_held_type (kernel/locking/lockdep.c:5497 kernel/locking/lockdep.c:5827) 
[ 63.711899][ T246] worker_thread (kernel/workqueue.c:3306 kernel/workqueue.c:3390) 
[ 63.716353][ T246] ? __pfx_worker_thread (kernel/workqueue.c:3339) 
[ 63.721334][ T246] kthread (kernel/kthread.c:389) 
[ 63.725270][ T246] ? __pfx_kthread (kernel/kthread.c:342) 
[ 63.729732][ T246] ret_from_fork (arch/x86/kernel/process.c:153) 
[ 63.734019][ T246] ? __pfx_kthread (kernel/kthread.c:342) 
[ 63.738485][ T246] ret_from_fork_asm (arch/x86/entry/entry_64.S:257) 
[   63.743119][  T246]  </TASK>
[   63.746012][  T246] irq event stamp: 10527
[ 63.750118][ T246] hardirqs last enabled at (10527): finish_task_switch+0x1b6/0x950 
[ 63.760389][ T246] hardirqs last disabled at (10526): __schedule (kernel/sched/core.c:6416 (discriminator 1)) 
[ 63.769458][ T246] softirqs last enabled at (10478): handle_softirqs (arch/x86/include/asm/preempt.h:26 kernel/softirq.c:401 kernel/softirq.c:582) 
[ 63.778864][ T246] softirqs last disabled at (10473): __irq_exit_rcu (kernel/softirq.c:589 kernel/softirq.c:428 kernel/softirq.c:637) 
[   63.788185][  T246] ---[ end trace 0000000000000000 ]---



The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20241009/202410091542.f6c4a438-oliver.sang@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

