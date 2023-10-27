Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3358D7D8E2C
	for <lists+dri-devel@lfdr.de>; Fri, 27 Oct 2023 07:30:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA47A10E91E;
	Fri, 27 Oct 2023 05:30:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E12D10E91D;
 Fri, 27 Oct 2023 05:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698384646; x=1729920646;
 h=date:from:to:cc:subject:message-id:in-reply-to: mime-version;
 bh=1+YVtNY1e9jSIc5DBC54zZ0Sqxoy0rzMOBZo64TZJRY=;
 b=Lpxm9R99iKCQpImB37uvueTHfPsqTP0dZ5ZYK2n42HiAHkSbu7gAX3KC
 I9Z+ECyua/Vzt8IUo5Twx7zFl7Jihvqf5R+YVPmuIwttPYpF9OaFThRX6
 beWAxK2NdfU04ahjgyB4PR7ExVMT3R/7nqZHJTDLBSBvIMby+zHXRFpEM
 O6Z9jkK1mbdmnuScPF+zo0lLGZWuks0sTHAtR+VDSeKPU9gxsr6XS4VYt
 kZTjZ+D6VP61ejBmKJS+NfnzH6lkDJnjjEki2XOdU+4m+ZwEBmV7SO1mb
 RTVK54iGyzqkhgD9s1jUV9uaaveKEQdlpBxuQHepISCipSR4VDFWtJShR w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="451951543"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; d="scan'208";a="451951543"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2023 22:30:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; 
   d="scan'208";a="720885"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Oct 2023 22:30:33 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 26 Oct 2023 22:30:44 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 26 Oct 2023 22:30:44 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 26 Oct 2023 22:30:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GEC8hndnfULa+6ZMK7dK1KyMjuFF5GHYrfJNHucGtC9QOdWcN4xZsQKOUsOYwZ3IAmRK5MFLSX5z9tO5ImnKo89dcBbSnBUx6X6s7WJ3JkgbKpuYLaiFeClKCet2gVBWPrFhwhqgr9wDhGJ2n69LGhGYXQDSNm4tKh8rSPDvgAFUyVZXLJW+X+/QJKqiZ5Cy6Dgm7xGGkx9jg2cnaWEgG75WOhT5aSBqi9ffCmq2njLa4GyN7bXF7zHpw6SFOawJsJNrbXlzo3H7eANZQqYwZE4eIgGCIemkCvyFOnjoOna30lsfDttJGOd6eBPlM/jDJ3z4VoIxTRUkueVJIb1Zlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=73LiNekPRupDIBqTCkywTfgs74DE0gEBB5HGC49cmrA=;
 b=byJDMtz0ZCE45sDjQgWs+2ck6GE5aBjEzxEd6GBNyJ0eCJcJF+uyGS5llxAdHZgM0VObmhAvXjGTg9uG7x2q4t3F7N2BXVyL7O/yUU+SG79nRlneQNLJ7sv+4cMy6+ls0RhXi7WVswYsb7DDCkVDJ1w7TaTOVue3Mil9dDFBb6V3YOhatmC9p7me5BJpJeLNiG3tBH5JZXDiIWUhDYxCmUzcN4ZbPrGfOC6Os7RTPeFtJAoY8RNI/u6QfLKVJExdRaf+XecCDiQ79VqvOq+LyJi8qwHL2fWep2P06/zYa2BgPyafBXrt+ml82uH/0pTZkTmFu7divJjzqvzSBox9xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
 by IA0PR11MB7815.namprd11.prod.outlook.com (2603:10b6:208:404::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.24; Fri, 27 Oct
 2023 05:30:42 +0000
Received: from PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::29f0:3f0f:2591:d1f6]) by PH8PR11MB6779.namprd11.prod.outlook.com
 ([fe80::29f0:3f0f:2591:d1f6%3]) with mapi id 15.20.6907.032; Fri, 27 Oct 2023
 05:30:42 +0000
Date: Fri, 27 Oct 2023 13:30:35 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: Re: [PATCH] drm/i915/gem: Allow users to disable waitboost
Message-ID: <202310271326.abb748d0-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230920215624.3482244-1-vinay.belgaumkar@intel.com>
X-ClientProxiedBy: SI2PR02CA0013.apcprd02.prod.outlook.com
 (2603:1096:4:194::21) To PH8PR11MB6779.namprd11.prod.outlook.com
 (2603:10b6:510:1ca::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6779:EE_|IA0PR11MB7815:EE_
X-MS-Office365-Filtering-Correlation-Id: 56a11ae4-85d1-4f17-abdf-08dbd6addc38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YswyVmjN0yb/GIZBYu+e/al0YndwEv/pPjay8vXUhkVA4O2gSYK6G75FrcRwld4mAoaUnfTg7t+ZByUFLa7SULhplK4pOYxpH405qxGy11bEJlimOEqWmEFLIbVW570JJ3Z5M8Y8pWuBykNmj5m/o1FUGplg5mK/JS5acjwz6rWtbO4Z7ZL0zrsLi/XIUVMHerWg0SZ8fPcRTdK6oaI/uPFPN9YCjH/KtVrOMwzL4A/XlfFm8QrGcx91WB1GkCVxH9ekrBwAfhvh8R4hFqOLd0RD351h6jAPfAwe3kL1uoF+iioiUbGn73jRubN4TuNgH/LnyuDfyccDYbCTfOnKU+/avHMdjRgsbyAZvSpOnklDWULciExV0t+10nBe8xx00/O1WOJntkAxOj+16T6lXU7pSADymviVwQkkvNDBqUp805ZzI2Ucq0/8sdJ90o/DhdpJ9i0KF37xOfMZ5KEuzQZH1GtvFwajrGw48cNEmf1DcBOII68NyM8v1ywftbxQmlvIK4thPruMpa9INrbtWMGy2o6kCL5bmx7rcpbz3AUl+C6+gigmhkrydsuC+wIglpXjayOoe4GI+H7Sj5aF6g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6779.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(136003)(396003)(366004)(376002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(6666004)(6506007)(6512007)(478600001)(966005)(6486002)(83380400001)(2616005)(107886003)(1076003)(26005)(41300700001)(2906002)(5660300002)(37006003)(66476007)(66556008)(54906003)(6636002)(316002)(66946007)(4326008)(6862004)(8676002)(8936002)(36756003)(86362001)(82960400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fCSPi4RRY7rr42/LnXD46doacDUpJDRAEX0TlNyQ6fkC04dniWDeweQFZfkN?=
 =?us-ascii?Q?e6MJIz7ihWiUldtmCYOni2ggU96jhIy6/2K9FIiYGEzu91xmMzUPDU5CiapP?=
 =?us-ascii?Q?d6WNEAJKk7DEwqu5dTn4RuQcu8Zkv6PMrAXhtf7ELrD1sE5QK6tSBv/nP6Rt?=
 =?us-ascii?Q?Hnn76KnVW3FzGKOoIYF+I6GpsWlrN6PKGyGmc52mvQRVD73oB43tytpLVWv6?=
 =?us-ascii?Q?wwJpNhPrq1Dx8ygFEjCF6WMD1dXgX9kPa8kUQct3qA+euT1j65if3EQvJEps?=
 =?us-ascii?Q?FlbLCyX4ONBXwp0TqId3/wiV7MVALz35G290dUMUM2aXmozzugScK/RywZQn?=
 =?us-ascii?Q?tR8pa1lS809pHKDBTZDwctNW/6cD9+F5aSpLemwi0bPhIRqBNHjGhxRe7/4R?=
 =?us-ascii?Q?U6nWG/5Hp9RSrmaUUfWrTJ9AwOjU31x3MjMaWuMCkonbOMG+P14F3Bg0Any2?=
 =?us-ascii?Q?RhKRk5bYWXNde7WUlzKkDPPt+xyRCbZzNHNJ3imNhrIZGoRa5JTK1s2ZVc79?=
 =?us-ascii?Q?5kHwwaD8hnyrywaqCD0YlzWu1tVBhgEPTyDokqX7/TCmzFg8C5wwZXbad5gQ?=
 =?us-ascii?Q?NG6dq6hlg0RoHMite5z+okDlTSSUYYarS8gDdb4g4KgAXNwvo+lnXG10o4/E?=
 =?us-ascii?Q?YR9D/GeKLxfx/EU3H45DwW6jb+W5twOqkLVUzLLNij2LWbY9jExvP1Kt2XX/?=
 =?us-ascii?Q?LIrLLXs7BtlzK9fppCP177HeOZHKujG3yFHnFzZxXlvDss+VSuhYsqegaxGd?=
 =?us-ascii?Q?65VAVf1d4aMKNGl8cyDs6zbPmBm0ys4ML5oij45FhZ2MvqdzA18C23DJ0yZE?=
 =?us-ascii?Q?nUes31o9qQE9/X5Qo1fMGUx+dkrgp8d7a9AUa2d+V9effLud521b3Nb+sawG?=
 =?us-ascii?Q?24AbdyF1E450q4sQKQ5f4CQUEhZZ/fqmbnIK/rHg1gGCAGkHzu8eTNN+EyJE?=
 =?us-ascii?Q?k7nPkeTCTZuK0hI1EzkxUAFhpDaDB5yVvMQFfi7GvVenIUgeSE3U5QOt9W61?=
 =?us-ascii?Q?RpNbP0MtZB8f/mRCljhptFBh3CjxA5gNQ8EnKzLiAQ/2H9B/k4yc+SdeJkTZ?=
 =?us-ascii?Q?XunJQYdVI3Dqq7I1Flx/6kENNNmirAW7KHnAqN+7rfKk4kbbO3SMkQobewnz?=
 =?us-ascii?Q?orIcekGp8xawNcxiLT9MuKyhz62zbdWkhISbeYqg/rJFpa9kgkFHeyky/a7T?=
 =?us-ascii?Q?9zgePOKc/B/MRLDU04yeJJZWk2YS6BA6Z9R8OjpcP1UZ/m55AbGHjAhLD1KC?=
 =?us-ascii?Q?Vddaz9fyp7Wg2s2uthuSo07umakN4TFYUmdmZAkm8RnNRd167c/Q6PMFoQR3?=
 =?us-ascii?Q?79ApIWxcYbZhHUl3st7vpK/S4smk6Q65BKS7Ub7htNAQz+/vbdfBpQYE3Kry?=
 =?us-ascii?Q?xmamPl9FPpF1cSUx/I5WVUBD3xJS+50E0lox+9YtN3+7sUFYIJsRrKNaYYWE?=
 =?us-ascii?Q?2veu8cVu0ZCaYG/Ax08h5a0bBgaRDf804gSQwxLM83so74ZUaTpi48YVc5PB?=
 =?us-ascii?Q?ds+L6DkpXs9SjkoyuMnPdwq1dgEeTYiPQfFsL/1AyrFmfaijWeeVYUFM5s8e?=
 =?us-ascii?Q?+7E9cEPMmd1SGKi/Pv5Mk3Kh9dn1xIM5+b1qMiDg3oe/ZWiJewnIVAljadfc?=
 =?us-ascii?Q?rQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 56a11ae4-85d1-4f17-abdf-08dbd6addc38
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6779.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2023 05:30:41.9250 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4MLNfD9gSymuV8KNsch9fH7JZFDY+dbb7FTQ8jq/Ujw5MxFcdhwX1Cn6mJxDeOjhmcMffqFaI6yyaHpCBMrztw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7815
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
 dri-devel@lists.freedesktop.org, oliver.sang@intel.com,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, oe-lkp@lists.linux.dev,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Hello,

kernel test robot noticed "assertion_failure" on:

commit: 54fef7ea35dadd66193b98805b0bc42ef2b279db ("[PATCH] drm/i915/gem: Allow users to disable waitboost")
url: https://github.com/intel-lab-lkp/linux/commits/Vinay-Belgaumkar/drm-i915-gem-Allow-users-to-disable-waitboost/20230921-060357
base: git://anongit.freedesktop.org/drm-intel for-linux-next
patch link: https://lore.kernel.org/all/20230920215624.3482244-1-vinay.belgaumkar@intel.com/
patch subject: [PATCH] drm/i915/gem: Allow users to disable waitboost

in testcase: igt
version: igt-x86_64-0f075441-1_20230520
with following parameters:

	group: group-23



compiler: gcc-12
test machine: 20 threads 1 sockets (Commet Lake) with 16G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202310271326.abb748d0-oliver.sang@intel.com



user  :notice: [   42.847071] Starting subtest: engines-cleanup

user  :notice: [   42.854776] Starting dynamic subtest: rcs0

user  :notice: [   42.863938] (gem_ctx_persistence:833) CRITICAL: Test assertion failure function test_nonpersistent_cleanup, file ../tests/i915/gem_ctx_persistence.c:283:

user  :notice: [   42.882029] (gem_ctx_persistence:833) CRITICAL: Failed assertion: gem_wait(i915, spin->handle, &timeout) == 0

user  :notice: [   42.895541] (gem_ctx_persistence:833) CRITICAL: error: -22 != 0



The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20231027/202310271326.abb748d0-oliver.sang@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

