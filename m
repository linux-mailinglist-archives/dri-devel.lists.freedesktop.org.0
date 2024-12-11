Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14BC89EC45F
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 06:36:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C76010E18D;
	Wed, 11 Dec 2024 05:36:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hGvxGSa4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DEDA10E18D
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 05:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733895379; x=1765431379;
 h=date:from:to:cc:subject:message-id:
 content-transfer-encoding:mime-version;
 bh=zvvhkMVWowQVJ2sLOquSIF7Zzh37ALHBwLI4Mg2fDZg=;
 b=hGvxGSa48MV56f4I3bALcBZAfeT4TkZs2hqx7XXC0xIWuRGLEbalez/T
 Z5bEagmzxt2UCWDC82CTG96BixZaZ/0ToU+RNWX30huH50dMZ4y04XY7z
 /y/TGq+GdAEaqx0QZ7TvWIZ2VDEnqZ1Xo1l5NpDsWz/ZODnXEgRIVeAzH
 Kc2QFMoMMkZhM5IcvvZBAdreWYKnAEdQglOg5nBgbIHvwfdhE6c/t8lM+
 5D8xsGK6A+O4kka7yaK4cyXlQk5OKI17jCe2p2L6sg56M5URUqbfhPxXb
 Q6ZGsW/h8KikhEHpPrixoVEWub3WmkadYz4BUSAjE5rJTmkwOIMiahEUy Q==;
X-CSE-ConnectionGUID: 35Ib3LS1TbeluFwvuKmysA==
X-CSE-MsgGUID: 0fUFeKk5TfOFhETsxMe7PQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="44734677"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="44734677"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 21:36:18 -0800
X-CSE-ConnectionGUID: XRJ9/E/SQVueyOV2094sRw==
X-CSE-MsgGUID: P4XlnuSqR8eM7IGMuD7x0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="95870005"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Dec 2024 21:36:17 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Dec 2024 21:36:17 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Dec 2024 21:36:17 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Dec 2024 21:36:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hWpLAnCWTw6P5Y1QLKS+Zn3rUxgmXNjANoTHB3Aj0pDuz6ZwHDtwwrChwoWkpEFJCgtQx3eUGo56ox6enJVkvRNHWv3TBGP06F1Vx5cQq4IwLcHzEwiYPI/PtWllMbsXRYS10zPLsiZ25RjZKWZk3OZt0cMxhNVvllslZn1Qlbaah3QIhAdU3nYh/mxI99JU2gJ/YtZ7bgwQyvChmLU18UJbqfngRRggHC6GwHQjC5CuMsJmpue9khNeTpZ1tJsdCda5UeUUpfceTiVZkXLobD7yACEeHCu9YMSLbjuoQFnkJKRZjEMN4QqrKiTMbkO1VaFsddPFeoefTm1G8BmiTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xdNFqWpzZf+er5gd/PgKG7WbhdNRGH0glH1FdREd5cs=;
 b=JklXORWAGNjoH+bxYpT2x9RksPtKkF+gcQ/EDcrV6aQwk6A47BweMqojKIYZQtbSs1+FUpBn3hhEy8JkuJ6MI4mby7HBFtwjxv/5ubkEbYcHw8L/H19y2DrViOENTr7exsiRMk3YAco2Iw0H8RqmmYBY+pYpOisl2oHW/nLxMZHXPmqqjSoo8BIa5byUF7hdVb4sOP27LnXD4RrNrGi9lQ5rEzRl49cutwLG4f64TI07ENBy4XFBjnZqO3s/78XFDoGEA1q+NLS2NnjYLj/Z/w8iwaJD4Ht7RvhPIY1B17KZQ4GuMucWh+b2peSVrfw2H0Qb+3N5xM+ISMRh8kdJaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by CY8PR11MB7799.namprd11.prod.outlook.com (2603:10b6:930:78::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.12; Wed, 11 Dec
 2024 05:36:14 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%6]) with mapi id 15.20.8251.008; Wed, 11 Dec 2024
 05:36:14 +0000
Date: Wed, 11 Dec 2024 13:36:06 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>, 
 Maxime Ripard <mripard@kernel.org>, <dri-devel@lists.freedesktop.org>,
 <oliver.sang@intel.com>
Subject: [linus:master] [drm/tests]  d219425604:
 WARNING:at_drivers/gpu/drm/drm_framebuffer.c:#drm_framebuffer_free[drm]
Message-ID: <202412111305.163da841-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SGAP274CA0002.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::14)
 To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|CY8PR11MB7799:EE_
X-MS-Office365-Filtering-Correlation-Id: 79725e05-a54b-4f4c-8583-08dd19a5ba72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QCZ91SRBzpebPSufdsQDgWIpYIp1YvECUKj9bQE561lDvZEpQj/DCJeYcvl5?=
 =?us-ascii?Q?KMeoIKkYJg+08zKD0WoFWZtECqPtL4h16kMx/8hzEpPpDQuhzwbbUA0B9TD8?=
 =?us-ascii?Q?SVc+ilWDeE0QIAK/7VUuNp3Rw6jHLDfXnG/d4vsnFBCX//agHmNYkvAT1M1S?=
 =?us-ascii?Q?mTTe2LOz8FSLjZS5mC+94PyuY0mnvco8DdlJpDjITjcB2qqO+zI+shoBCVJu?=
 =?us-ascii?Q?mrzbIyBPLZHaNwRjWdQ3prFke0Z1vWhBQXQO16q1RgzrANz9X+l1Sg83tOpc?=
 =?us-ascii?Q?Mg5lVmZf7Bv0oK/k0SAsDOJBoB7zPXrhiM0yUJ4w6weooGvyYnqZQaDyZEmU?=
 =?us-ascii?Q?TUqCVPkpFj6vUIXQGn/MqxO36mcAkcJWvd4h6qgBZRrULD1ufwOzgdqaYorI?=
 =?us-ascii?Q?bAYp2XkNf035PHNOMBfix6kZE98HjDIelLO0IqN02jV/Y235gzUYVzJTfKNC?=
 =?us-ascii?Q?fXtHnXtBfMnxlOCOES5s4iYyjdBXLYnam7A31SQo541rT/h6PEYw8sO9OsL7?=
 =?us-ascii?Q?acINBtUHwNbO8T6mt0Ap5pY7Oj1rpAUJOjOu/74+7F0iXivv3hQqkN+truFS?=
 =?us-ascii?Q?5RJp8uJXufUjgjc1uf9tZHOHXxee6OCa9rgCV2iD8qhY14pw63v7J2LHsmO3?=
 =?us-ascii?Q?qhynONAQW9wKod+6f+2sQZaURYns56PqX3cxjLz2YV6UP33hx+rqyI8xzMFf?=
 =?us-ascii?Q?rNKjlc/XUn6CC9Lmy50hhaGsCFsNMY4/lAgTr1Yl+kcl6XMPrdJJcGEAQlxr?=
 =?us-ascii?Q?bZFKMZMc+3LAoor1Th3x/p90HoSoB9x0IK8iqdb7h4ajk7t6ciK1on6iWv/o?=
 =?us-ascii?Q?fwxeFS8Fti85gxya2wrC4gphgkWI+vMX00wjBjsN3+wsg5mJZbSMuTb3mOE7?=
 =?us-ascii?Q?PSe1P18x6HJnQlFVJvWzrT3AFeJd5HsgP5KVIGEgQJb6yD4plAF6TmOWLSj9?=
 =?us-ascii?Q?mMVpXtKda590B7z6bCannbRlvCMgLU4jUpG9dUoa7nH4ELjNlMUrcYZHCX3C?=
 =?us-ascii?Q?ywJKDHRAQeX+jx315zG5IB06eUMAImJ/jDAcCqGxrULCTMGy/OqNQsGUUm5O?=
 =?us-ascii?Q?OyyiQYV8qE1d6r6Rx6djUgRCZqX3ce0SwQAmV+y8SJiLU4RQOEFltxseA8f7?=
 =?us-ascii?Q?Sujj5DIFFGRsJqNSFl3/HWQOs7NpnuEsfmZ3/yFWFAJzvEqh/Mb91hNVUxGp?=
 =?us-ascii?Q?7Zubkeu5834pT1lyBZshPEtzaOrQM6X1XodriF8Fn9DY9LocOApGX+lYeU+K?=
 =?us-ascii?Q?7AdwcYbKBWo9fQuWhrwtTUU+uQwM8/SG3bvC9zh40BVXAx+Pw96Ncg7eOi0N?=
 =?us-ascii?Q?1rwoGlKa2kk4FTo8X6/VpaQLc4/ZS4rm8hkVK4rVyOh4GKuusSNLhdJza+d3?=
 =?us-ascii?Q?BLlqYrc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8603.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DuY3UpPlPY+zGNsyzbztysbR7cyk8yJQoem0Fx0hw2HBCMhmKdn6O7lxIiLa?=
 =?us-ascii?Q?kS1cYWvQERiAQV2dcbX2WcLKx+Rf/Bpk28Ugb6iHKF1EJlyKAyFxlM78v1fi?=
 =?us-ascii?Q?FXOe7k3WEekw7+stNdqE1om0+PfUX82qFYpwhqSY5+W/ejAorGxHwCRwpCSh?=
 =?us-ascii?Q?4XePFjYL+s8Ne1KrBJ8P9JOy64ueXkIHVtiXLcsgI3IqE6eMjKLlUjddlE+H?=
 =?us-ascii?Q?9xfxzSoLg0PX23Aooqx30OcyMQanggb6pkMcXOH1HU4ewRxRBHoL2yNaqHVK?=
 =?us-ascii?Q?yRCTRbFB8Nwu7IMr7HaOecoZ5gxE2DG/hBDfSMIhzWcfwPtjPnb7cA9HRdOx?=
 =?us-ascii?Q?libdh2WxoMaq5PkcJRJcwXoMLQIDr+vpeWmEdWbeB6RBgoC/D7Uk+NDGLkn0?=
 =?us-ascii?Q?rw44YRHWAnK2m85NuqrvgSvr0mWG3+6zsHiYZU4jldRuPkBTKgZmPgheRIAk?=
 =?us-ascii?Q?I662iuivKqRC93xV67vBbFZBxQUFZquljABgfE7J+Zl5IZiZpZFCaneaGuBG?=
 =?us-ascii?Q?RHCG/cmYxMdRPfEx2lt6aTIdC93euD1J3Rk37NrOYqZDxz7LT4SY11Wy6uNX?=
 =?us-ascii?Q?zxgi+HFTwSH+ejT8EOGI8oHXECvXRWvW93xrZGgob+/+7fyUKW7N671nztv8?=
 =?us-ascii?Q?g1lbAyi3dzJFN+vfNJdCfJAlFvKQ5tFSA2ZG9X2swOFyRjlv86TrEWAaSjrF?=
 =?us-ascii?Q?rCeSfX+EDZyPQ3mDcEI5PW8M+5P7phLPDaxvGb3qHBv/qHVy5tBFs+HkP4Zr?=
 =?us-ascii?Q?R8mgrM09B7ail7fTyraRibd6I/DkIxZCMKXASABaR/M+3ZbBWLBzOB3SIwcU?=
 =?us-ascii?Q?kYlS/lNWxLonm95j09/kPyE3+Ck3KU9TFDaoAchQJkie/1TNtxCb+BodrdC6?=
 =?us-ascii?Q?7A+g3lviOtXxAd6mKHBX7vdaA7EJ7Ny1ftuyoNlfJKGxiwSrijBNXFvG1xYZ?=
 =?us-ascii?Q?K5DnhvYM9/Vh6Dwpwfz17f1ApHni/UnceT9CJ+k0xoPKLTcLu5Lp/65DF8h3?=
 =?us-ascii?Q?HqLMgObEI7p4SOqk2rjUXaIol8dH7tXksHvBbNUIU7FXl9m9CnX99gJOJ45f?=
 =?us-ascii?Q?KQLmZLXzMaWNu4ebhNHU49ooiH5jfRDBc0f8ilrpurtRm05boa5TmkGIxGni?=
 =?us-ascii?Q?zVYl8j+fl2sbcDNYpufpOM2RcuZvdD1Ht6+uhqCgCPpp2/3o9o/nMkS6+H2a?=
 =?us-ascii?Q?wyMJ91LfT1pEWZ54Pd3T/iouBfalXsbacwNQzgHEcKZUjvDnquq4tw3tHy6o?=
 =?us-ascii?Q?gePGfgNTp09KdydxApZTve7emvW/djw53V/KBouts4Cbl1S7Xi0fmpPcJKXL?=
 =?us-ascii?Q?RtiNndAPU0UXpJoopdT8WVgOXII9mNA4HTUP7/AozS21vl6ZWuII+bS4Uv0s?=
 =?us-ascii?Q?ECKy3PwoFWA/uK0a6MgWXlIy624fo3q/iOAz6zz7fFcdZBjyDLDfathe2gZ3?=
 =?us-ascii?Q?lqFNAj0gORzCPBLxDAJBWIXBCU4KpGDgH94uis52uLD/QP7KFztzf8+vrCwZ?=
 =?us-ascii?Q?+1YtexxZO8YUEfFjV2fGnxJo8S6QsMvFLH4E6fbbTQWThtntGg5yB8+SifTI?=
 =?us-ascii?Q?bortynqFqmjeI1YWpKFiaiMwWVZkWjnMNM0e5IZUYmwcvY5tPt9lKbvI0lTt?=
 =?us-ascii?Q?zQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 79725e05-a54b-4f4c-8583-08dd19a5ba72
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2024 05:36:14.5925 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ECVuUZlLsQqKi/QwikFj04FsaXNjtvWng++U5T2uH16mFxmR2e05hcTD1DgL268L8fYSGK6eoIUdfGm7hXW7Tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7799
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

kernel test robot noticed "WARNING:at_drivers/gpu/drm/drm_framebuffer.c:#dr=
m_framebuffer_free[drm]" on:

commit: d2194256049910d286cd6c308c2689df521d8842 ("drm/tests: Add test for =
drm_framebuffer_free()")
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

[test failed on linus/master      7503345ac5f5e82fd9a36d6e6b447c016376403a]
[test failed on linux-next/master ebe1b11614e079c5e366ce9bd3c8f44ca0fbcc1b]

in testcase: kunit
version:=20
with following parameters:

	group: group-00


config: x86_64-rhel-9.4-kunit
compiler: gcc-12
test machine: 8 threads Intel(R) Core(TM) i7-6700 CPU @ 3.40GHz (Skylake) w=
ith 16G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202412111305.163da841-lkp@intel.co=
m


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20241211/202412111305.163da841-lkp@=
intel.com


[  152.407500][ T4768] ------------[ cut here ]------------
[  152.418100][ T4768] drm-kunit-mock-device drm_test_framebuffer_free.drm-=
kunit-mock-device: [drm] drm_WARN_ON(!list_empty(&fb->filp_head))
[  152.418134][ T4768] WARNING: CPU: 6 PID: 4768 at drivers/gpu/drm/drm_fra=
mebuffer.c:832 drm_framebuffer_free+0x126/0x1a0 [drm]
[  152.441735][ T4768] Modules linked in: drm_framebuffer_test drm_kunit_he=
lpers linear_ranges snd_hda_codec_hdmi snd_ctl_led snd_hda_codec_realtek sn=
d_hda_codec_generic snd_hda_scodec_component intel_rapl_msr intel_rapl_comm=
on x86_pkg_temp_thermal btrfs intel_powerclamp coretemp kvm_intel blake2b_g=
eneric xor kvm raid6_pq libcrc32c snd_soc_avs snd_soc_hda_codec crct10dif_p=
clmul snd_hda_ext_core i915 snd_soc_core sd_mod snd_compress sg snd_hda_int=
el ipmi_devintf ipmi_msghandler crc32_generic crc32_pclmul snd_intel_dspcfg=
 cec snd_intel_sdw_acpi intel_gtt snd_hda_codec ttm snd_hda_core crc32c_int=
el drm_display_helper snd_hwdep ahci snd_pcm mei_wdt ghash_clmulni_intel dr=
m_kms_helper libahci wmi_bmof rapl drm_buddy snd_timer video intel_cstate m=
ei_me snd libata intel_uncore intel_pmc_core serio_raw mei pcspkr soundcore=
 intel_pch_thermal intel_vsec wmi pmt_telemetry acpi_pad pmt_class binfmt_m=
isc drm fuse loop dm_mod ip_tables chacha_generic poly1305_generic [last un=
loaded: drm_format_test]
[  152.528270][ T4768] CPU: 6 UID: 0 PID: 4768 Comm: kunit_try_catch Tainte=
d: G S  B            N 6.11.0-rc7-01411-gd21942560499 #1
[  152.539795][ T4768] Tainted: [S]=3DCPU_OUT_OF_SPEC, [B]=3DBAD_PAGE, [N]=
=3DTEST
[  152.546473][ T4768] Hardware name: HP HP Z240 SFF Workstation/802E, BIOS=
 N51 Ver. 01.63 10/05/2017
[  152.555399][ T4768] RIP: 0010:drm_framebuffer_free+0x126/0x1a0 [drm]
[  152.561797][ T4768] Code: 8b 74 24 50 4d 85 f6 74 28 4c 89 e7 e8 f3 fc 7=
8 c2 48 c7 c1 80 39 4c c0 4c 89 f2 48 c7 c7 e0 39 4c c0 48 89 c6 e8 5a 08 e=
4 c0 <0f> 0b e9 2e ff ff ff 48 b8 00 00 00 00 00 fc ff df 4c 89 e2 48 c1
[  152.581167][ T4768] RSP: 0018:ffffc90001397c08 EFLAGS: 00010282
[  152.587067][ T4768] RAX: 0000000000000000 RBX: ffffc90001397cc8 RCX: 000=
0000000000027
[  152.594872][ T4768] RDX: 0000000000000027 RSI: 0000000000000004 RDI: fff=
f8883c9930bc8
[  152.602675][ T4768] RBP: ffffc90001397ca0 R08: 0000000000000001 R09: fff=
fed1079326179
[  152.610478][ T4768] R10: ffff8883c9930bcb R11: 0000000000000001 R12: fff=
f888108fad000
[  152.618275][ T4768] R13: ffff888435067000 R14: ffff888434a6ca80 R15: fff=
fc90000a8f650
[  152.626076][ T4768] FS:  0000000000000000(0000) GS:ffff8883c9900000(0000=
) knlGS:0000000000000000
[  152.634820][ T4768] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  152.641241][ T4768] CR2: 0000559f29c1e540 CR3: 000000043c06a003 CR4: 000=
00000003706f0
[  152.649038][ T4768] DR0: ffffffff8757a458 DR1: ffffffff8757a459 DR2: fff=
fffff8757a45a
[  152.656837][ T4768] DR3: ffffffff8757a45b DR6: 00000000fffe0ff0 DR7: 000=
0000000000600
[  152.664639][ T4768] Call Trace:
[  152.667783][ T4768]  <TASK>
[  152.670576][ T4768]  ? __warn+0xc8/0x250
[  152.674496][ T4768]  ? drm_framebuffer_free+0x126/0x1a0 [drm]
[  152.680289][ T4768]  ? report_bug+0x25d/0x2c0
[  152.684640][ T4768]  ? handle_bug+0x3c/0x70
[  152.688816][ T4768]  ? exc_invalid_op+0x13/0x40
[  152.693338][ T4768]  ? asm_exc_invalid_op+0x16/0x20
[  152.698206][ T4768]  ? drm_framebuffer_free+0x126/0x1a0 [drm]
[  152.703996][ T4768]  ? drm_framebuffer_free+0x126/0x1a0 [drm]
[  152.709806][ T4768]  drm_test_framebuffer_free+0x188/0x510 [drm_framebuf=
fer_test]
[  152.717270][ T4768]  ? __pfx_drm_test_framebuffer_free+0x10/0x10 [drm_fr=
amebuffer_test]
[  152.725247][ T4768]  ? __pfx_drm_mode_config_init_release+0x10/0x10 [drm=
]
[  152.732090][ T4768]  ? __drmm_add_action+0x19f/0x280 [drm]
[  152.737636][ T4768]  ? __schedule+0x6ea/0x1670
[  152.742077][ T4768]  ? __pfx_read_tsc+0x10/0x10
[  152.746598][ T4768]  ? ktime_get_ts64+0x82/0x240
[  152.751206][ T4768]  kunit_try_run_case+0x176/0x440
[  152.756078][ T4768]  ? try_to_wake_up+0x74d/0x1610
[  152.760859][ T4768]  ? __pfx_kunit_try_run_case+0x10/0x10
[  152.766242][ T4768]  ? __pfx__raw_spin_lock_irqsave+0x10/0x10
[  152.771970][ T4768]  ? set_cpus_allowed_ptr+0x81/0xb0
[  152.777006][ T4768]  ? __pfx_set_cpus_allowed_ptr+0x10/0x10
[  152.782565][ T4768]  ? __pfx_kunit_try_run_case+0x10/0x10
[  152.787945][ T4768]  ? __pfx_kunit_generic_run_threadfn_adapter+0x10/0x1=
0
[  152.794713][ T4768]  kunit_generic_run_threadfn_adapter+0x7c/0xe0
[  152.800784][ T4768]  kthread+0x2d7/0x3c0
[  152.804712][ T4768]  ? __pfx_kthread+0x10/0x10
[  152.809145][ T4768]  ret_from_fork+0x30/0x70
[  152.813410][ T4768]  ? __pfx_kthread+0x10/0x10
[  152.817843][ T4768]  ret_from_fork_asm+0x1a/0x30
[  152.822455][ T4768]  </TASK>
[  152.825331][ T4768] ---[ end trace 0000000000000000 ]---


--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

