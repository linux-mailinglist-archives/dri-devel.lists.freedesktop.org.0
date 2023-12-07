Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD9780838E
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 09:50:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70F5810E1C9;
	Thu,  7 Dec 2023 08:50:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8DC710E061;
 Thu,  7 Dec 2023 08:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701939020; x=1733475020;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=9EtIY0JE9I2UJmAYjAy1FoDCsqV8elyWAh27HGMHB7Q=;
 b=T51FLvRq8uUF5AqM6tXMAzG51VSMWkKVJs6nH3Ru3vwR9z2QN7hxSNiJ
 g5yVnmuCWShiev4uY8jAldgz9yWCM/GOncvy/qRpELYRfbZKlclXXJx08
 vM5uc7/r2MhEC9V2P68J3OdmwtcbrhGjKUa1KXwo+TB/I3WZ9Ix9dUEt1
 9/7pWer1LdDGYfUr89eacVOA2CPo4HD7guOze1v8PoxSlmIrvwEJNSRcy
 FeSRLApgqVGAHd4YDT7afC29K3ymW8ylzfiRDAJ+YD3kuZNh/D7nmWymQ
 +gImLeq9hxvzWHySScrTV+R5MwKYFXmH9/guIfqtZXvhn6svRijSQjhmr w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="1269774"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="1269774"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 00:48:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="842139217"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="842139217"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Dec 2023 00:48:14 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 00:48:14 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 7 Dec 2023 00:48:14 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 7 Dec 2023 00:48:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ctOAlYLiWvfWHs3Sqs9JG19Qu++X3iunzsRv+Dqu60bGd0kgMSRToZ0X5je2KBrytXr3dgHHtRLurKW7a3OdG3R8+16ryMWlFRK03Mdmz/uELEmaMpAVWqH9VYLgp9DKEWuf5RILiVkb1WmwaCvlzN1fvF/25zxN8uWjw5L3uX2QZKtxxz1saJA1XDlbz3shpaE1UkX3H2q2h+vrNWE51LScrPk0u13SRoh2U5j7yCLCulj8oyGWSfudhnHSHiPN14O7NlUBXq141EZzlIjTdBGlXvEDCyy9xMU9r4yVX38hpqzwMLhn0cs6MDDcuD+oFOp/frlA2i7BLu+a7fslbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XDG8y7PXCMrLHCk7LJWYr3WNNyn+eMD7iJ5yqk+tDmw=;
 b=ZrofALTXUxWYw3fvR4t2UX6NUZLp9DndMpxdK++8r30PGMyy8oCPWPs9e2ahiR4HG+aBH7qHkRcteyRgILjslgp8lrrw6wrOsICSyhQYmQRD7tfao5DHKN+AiWcjHP7rTyQN4zwQRtP9hJqH7IVkbPycnQL+Gz4r5yA876mnl3OTbmQp7A4WIjDYFgQoRHlFktKw3DuBWeYynlKaCJ65O7R8vt0dbPB+91/MikCEhsHZ00JsZADl0NCFaJWeYK+hmwHGwZYUnD4y2zNiSow/7ozOxtKe0CCFJZUMEHvju8vSAZxtiTH9t8NHiV+rB6KAiYPxJdaJtTy1AuncHx3Qtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by DM4PR11MB5310.namprd11.prod.outlook.com (2603:10b6:5:391::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.27; Thu, 7 Dec
 2023 08:48:07 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::1236:9a2e:5acd:a7f]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::1236:9a2e:5acd:a7f%3]) with mapi id 15.20.7068.025; Thu, 7 Dec 2023
 08:48:06 +0000
Date: Thu, 7 Dec 2023 16:47:58 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [drm-intel:drm-intel-gt-next] [drm/i915] [confidence: ] 9bb66c179f:
 assertion_failure
Message-ID: <202312071643.321205c6-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR02CA0112.apcprd02.prod.outlook.com
 (2603:1096:4:92::28) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|DM4PR11MB5310:EE_
X-MS-Office365-Filtering-Correlation-Id: 70c0c04e-a2f6-4e20-2955-08dbf7013b67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FUZVtnNXWXC7lUgr8Lu0YMghHgKNTdkbR1w9isRneiOo9qUuflwuVwPhl/6rbFfuhY9cFegXeYqTPdYc7co1C0y3WH+IoPjnHMJBX50WRh3lioJyU4hqilbClYoXXg/d3cDdVdlpgidx1SuOFDpVk/N+z10iI+fkpjQuQqnUpAsuFqmBetg3WKKPs4emDDcoFCVpjE5DZQiXqYHQXPS7q/WV2QPsrMYfycZ0aB9zAl6SrPNW1JQvcwaeydlzey92l4hSEH2f/apkigTpof5VpG79r/x4tJcHeh7L/mWhGwM4v1ve+Gu/xmdiIBzt5cjJMM7b5gdOfT2yjla67UI/WKoYSboOV1evMS4Bf2NSBMYFEYOc70gy+SvCmYZx69JT5fsL6H8RRc2DTAP1t0VCqOwszVeOosv4JGXeajfcCZ9cDoK5gptWjxJ5K7ai4qfeEyyF4y8x80p9lXG5uU120aMj1vbzpO5B1IGWRERzYq27x0gc+n/lbWKXdDuvZsz6jL5XRUUS3E1dq4yes1l41l66dl6y7fD7DQFLTAr9AXn7wIZjwZkSLoD+Cu5bG4AR0NPP0/xnlV3VkPm1gmMcSw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8603.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(396003)(136003)(376002)(39860400002)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(66946007)(66556008)(66476007)(478600001)(6486002)(966005)(82960400001)(83380400001)(6666004)(6512007)(316002)(26005)(6636002)(37006003)(54906003)(6506007)(8936002)(1076003)(4326008)(6862004)(8676002)(2616005)(38100700002)(86362001)(5660300002)(2906002)(41300700001)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?m3tkOC7eFcY72F452m4V61gKn3ArkxXXiQVQy+Nrj6GPesiZ7KJiZNFEwOIQ?=
 =?us-ascii?Q?q+wyMwO/Z6mV1oIzygxFBRgwVV/NbLaomqaocK8aO0omKo9U8g7JdPX6IqUm?=
 =?us-ascii?Q?vSXDmrC9jQYhXq7XbFaNypfMj6zV1MzHoi3Tsvev/IKddEBCvsaMVoP0eEYt?=
 =?us-ascii?Q?74U4kBorYYqyT4jqit18LiiMAo91I3UvOqnw8VDBkDSXB+TlAcG74DWzulaD?=
 =?us-ascii?Q?sUoEMxZpR4JJDpBxgiRkG7vxAAUT+/IRA2KbT0f5pOsLF2Vap4maYqa6eOb2?=
 =?us-ascii?Q?Y83syx7l3hkS8TPAeH3RAssz6+CXeNyIBQypdbZ8NA4o1JXq/iIGrnZ3bkPX?=
 =?us-ascii?Q?95u8bH/JJ84Rjh2VgsIJevxTPZDMrYAvGEdfeCnn4IKY/yKg2NDLzGEmbClf?=
 =?us-ascii?Q?lSFeDmpoBqEU8Cvnw3H2ViblXgYn3rnL1l5O5wvkYJ2r7fU6N9DTNRoYhFAX?=
 =?us-ascii?Q?P8R3zv8UK8obli5SWXh1jbtzAcnMfLm8oT6PSXHleFw5wk06I9slrTrxoGRq?=
 =?us-ascii?Q?9O1mPIdYl+lNnT5nZmUMgCh+vkWD2mLmk5fOLyiavct1hk4ZN9w+z90zXRy1?=
 =?us-ascii?Q?Nz1WA73WsDJrSUMIrgg6U4SiMI5uVKsGsX6dXiWbPG3sM81fkYktNfLA70W9?=
 =?us-ascii?Q?QcBnis49axd72Jf4TMU9diziULeW6hVsMGtZ1JoIkUNKJA7qnDY1Fy65DwDM?=
 =?us-ascii?Q?c0fj6yW1INaB7IXLyqtEz0W+Ef3QKcZEnSXOcAeAWGRnr1ZPyiUR20Lj7nTg?=
 =?us-ascii?Q?9sVvpY2tqRP9QMKPn6VAUr3RRRIFZ2P67Taf7Z3m8xDTYM2E2qzwTUoXv32F?=
 =?us-ascii?Q?L+FK3VmlgTYoVcjwFGZE+H+B6b6c1PNXUWuuKDXYP+fIdGLyjlF9GhQLsnA7?=
 =?us-ascii?Q?vkKm2hlz9uDAepin07SZH7yZJZz3HkORL9QOroO7RLdGupb4D6nbnazwiiVm?=
 =?us-ascii?Q?WzFW5ijhAjqPN+sx8B+3yekifzCax+AQfsXAMmowq9y/SQopJVAAMdDp6Z+D?=
 =?us-ascii?Q?jRr2ia2SFGXauO36FpR31KcqgGCLWLHWo/UBmm2ctg4XSfgE5hiwcCzbt11a?=
 =?us-ascii?Q?vYsPLAh8d7RTcrBsC09B3igYnRWlyOZAkfp7Nuy13uyiDXNVyzX7fRyZusoO?=
 =?us-ascii?Q?siECDrHrTRU/zsb/vllM6/O36wHI3ocxm03PHj8cCraXwakzWZbG59w3vMTo?=
 =?us-ascii?Q?6z1RDxgD3gA+SUkPburkxj6G1yR1egSFRNcP+rVDskBCCd92k09VjX7zq5NW?=
 =?us-ascii?Q?09+q/ZITX/ICWg5vau5hyACep+ybfDHPq/hM2Rim0N3i5qmG1s24uzh7jejR?=
 =?us-ascii?Q?ggUBqwjFoL2kvsKI5ZFmINf9sQIFuXH/1ByJP2e4oiUGGgMJbFV6jvI3HOkH?=
 =?us-ascii?Q?h6jRUdPKMPrLmq/uT1lcJoZXVt4K6+RvJ99QOOVESL2pSKyhqf5Yz/3mMZuO?=
 =?us-ascii?Q?/mqm8j9McuNAQqxde1ULDEgN84BPaBKZxpIGkeb1qf7TPaN4ppEVzRjHdbE9?=
 =?us-ascii?Q?PeFQKn3f2oQCidnAclAYHxIWOAilgnkYiQnJEzRH9QE6aetZx61b6kD4EXmm?=
 =?us-ascii?Q?gK1Kka/6XzlaBZNnmf4Rcii/3r33ONwSBrNfSFxCdsclyLzxDhcRZ8rtuuqs?=
 =?us-ascii?Q?Cg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 70c0c04e-a2f6-4e20-2955-08dbf7013b67
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2023 08:48:06.7573 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y4/mIjd36WI1t2evEnDUZ/iE2VXFurZEzZwazD3lQY6qWh3gQs5m2LeI8+mHhpihzXMoMva3QdazCWRCnQwfSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5310
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
Cc: lkp@intel.com, intel-gfx@lists.freedesktop.org,
 Jonathan Cavitt <jonathan.cavitt@intel.com>, dri-devel@lists.freedesktop.org,
 oliver.sang@intel.com, Andi Shyti <andi.shyti@linux.intel.com>,
 oe-lkp@lists.linux.dev, Chris
 Wilson <chris.p.wilson@linux.intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Hello,

kernel test robot noticed "assertion_failure" on:

commit: 9bb66c179f50e61df20ba13c9b34ca17d00b05fb ("drm/i915: Reserve some kernel space per vm")
git://anongit.freedesktop.org/drm-intel drm-intel-gt-next

in testcase: igt
version: igt-x86_64-0f075441-1_20230520
with following parameters:

	group: group-04



compiler: gcc-12
test machine: 20 threads 1 sockets (Commet Lake) with 16G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)


we also observed below tests failed upon this commit while pass on parent.

8aa519f17512da50 9bb66c179f50e61df20ba13c9b3
---------------- ---------------------------
       fail:runs  %reproduction    fail:runs
           |             |             |
           :6          100%           6:6     igt.api_intel_bb.bb-with-allocator.fail
           :6          100%           6:6     igt.api_intel_bb.blit-noreloc-keep-cache.fail
           :6          100%           6:6     igt.api_intel_bb.blit-noreloc-purge-cache.fail
           :6          100%           6:6     igt.api_intel_bb.blit-reloc-purge-cache.fail
           :6          100%           6:6     igt.api_intel_bb.delta-check.fail
           :6          100%           6:6     igt.api_intel_bb.object-noreloc-keep-cache-simple.fail
           :6          100%           6:6     igt.api_intel_bb.object-noreloc-purge-cache-simple.fail
           :6           83%           5:6     igt.api_intel_bb.object-reloc-purge-cache.fail
           :6          100%           6:6     igt.api_intel_bb.simple-bb-ctx.fail
           :6          100%           6:6     igt.api_intel_bb.simple-bb.fail



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202312071643.321205c6-oliver.sang@intel.com


[   43.922756][  T447]
[   43.935008][  T447] IGT-Version: 1.27.1-g0f075441 (x86_64) (Linux: 6.6.0-rc7-01579-g9bb66c179f50 x86_64)
[   43.935018][  T447]
[   43.947248][  T447] Starting subtest: bb-with-allocator
[   43.947258][  T447]
[   43.956752][  T447] (api_intel_bb:857) intel_batchbuffer-CRITICAL: Test assertion failure function __intel_bb_add_object, file ../lib/intel_batchbuffer.c:1673:
[   43.956762][  T447]
[   43.974467][  T447] (api_intel_bb:857) intel_batchbuffer-CRITICAL: Failed assertion: allocated || reserved
[   43.974477][  T447]
[   43.987691][  T447] (api_intel_bb:857) intel_batchbuffer-CRITICAL: Can't get offset, allocated: 0, reserved: 0
[   43.987706][  T447]


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20231207/202312071643.321205c6-oliver.sang@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

