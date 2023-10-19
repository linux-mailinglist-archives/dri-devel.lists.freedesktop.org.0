Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE737CFF4A
	for <lists+dri-devel@lfdr.de>; Thu, 19 Oct 2023 18:19:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EB8810E528;
	Thu, 19 Oct 2023 16:19:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 137F610E527;
 Thu, 19 Oct 2023 16:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697732359; x=1729268359;
 h=date:from:to:cc:subject:message-id:
 content-transfer-encoding:mime-version;
 bh=YaaTWxOFXx+GQUCoA+BZV8Pgl5BmKl3BglbCLGu/uQU=;
 b=XGb0PdXP6DdvFRVKNJilFGmoVyR4uBunR9KQjyD3XhuRWf9r6ew2jVFJ
 iLoC2kDXV4lypAKSXtU5s1M8z8aS17kmQXMHcGL60JQ+x7zlDHGIaVECQ
 JN600ywCuCPO31IA4jiui7CIQvjMAV5ZgTy6yw4Qjlw8ltgo7I6rFbKQl
 iP0gFkyd7VKXzuMUoKOkEMIK5Y0bY5lGpBK/DnK2mEkJBsY7ABZ2NEEfX
 cBAtE3bvyfxgG8Nkxi0d2XE1ZgSFP86OCQTIFkA9PlIPSGp+KT2yR8wP1
 LWk+u5ff5tZxrzwdt7a+ix8h/lWc+rdvf6f5a2unDe1HuyFUf4Vjn2qPd g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="417414169"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; d="scan'208";a="417414169"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2023 09:18:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="900796641"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; d="scan'208";a="900796641"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Oct 2023 09:16:43 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 19 Oct 2023 09:18:49 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 19 Oct 2023 09:18:49 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 19 Oct 2023 09:18:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oYpx/7PGt36XmX/Uvu3itdNkXUhN5jdmboR/gzOx/7w5slwUW1333V11cG2jbFtbt6YS/3fU6dZeyGR1eZQ4aYp6Ap2vCRG/mwhUUdPXTtN69p/yni1D8/ASMe2ab2phoqCkp0Ob1KO6WIxx4CZ5WFMC/RrnpZZW2nHWebNOyVDT40dAjVpf6niU2aDS9sAztZ/btTKcTeQc/2Ck6GjqPPFtxF5x1xvBp7I+sesQaRpvRdE0iCQRO916AahFE8YXTW0dFlUjtWMaCAcx49fJXcDButLLwZPGB1V9hJ/ZvDGiieexu3Ga5FpNYo+ia5DTIDdLObYgPzOm4wH2jWZKLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qlw20aTfKcOJY9IhDtRJBQj55gj3GP3moYOqbQVpfSQ=;
 b=ktL2wx08rw3MqyuPP4GV5xC+Ys0iSeFLhPEF9YUc0poIyNtjzXD9LmE+wsliW6mmUfjpqnjQeiHvcD4bdx/eDp8QYFYVpM0ke3WYKzLbnvYIGXRCJMWxFWV4r2Zm11lAr0P6Cco7gk8R4eMAVLyMA7ASXq04p3Nk+gfjeDGvRXQ1mMC7JJrIilb7+cONxGmYpTlCEvt/IUM/M8RuyCHgXbD54V7ukxZlYdMNP9SQfM158O0H7++W38TSOLQ1FA45VEUqFYcjpyi6L30dVOJUumOv6W4MUeocHKf80J6BB5Vpf+k4nccz83jGrEcKiMcscFi+OPVlb6U9kwnERU59PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM6PR11MB4594.namprd11.prod.outlook.com (2603:10b6:5:2a0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Thu, 19 Oct
 2023 16:18:47 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6886.034; Thu, 19 Oct 2023
 16:18:47 +0000
Date: Thu, 19 Oct 2023 12:18:42 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-next
Message-ID: <ZTFW4g6duLtp+Wy0@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0067.namprd04.prod.outlook.com
 (2603:10b6:303:6b::12) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM6PR11MB4594:EE_
X-MS-Office365-Filtering-Correlation-Id: cd9874ee-d14e-4ad9-aac1-08dbd0bf1289
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KQoCfUZEottORGDFXaXKhJ9EiYnaKODlJlVANnLVfj1DBXvJcKkTGLCMEgfALImhKq9wl9MR8oA9KrDNMaKOojedDIof4UUfv+XJDwxwxnDp7rVbXlMMmroCeeIZVapinkCGA/mvUHAN7dkB7+yQNRpBVkvhsduVpF6CR13GuMz7LXOLW6zSUr6cMfiEL3wCgSpYAZlTHum0winhW0T18AQTKlFMxcsyHDMK6eiZiXKGisgx/wYJNIBsjcSMhjyj0UPOls83nlLMyLHr+XobcMSdno/EziLYVOXRDQGWDZPa6D2gllic0L7qJ/PXMOOu5JJRDz7WiNA99DCSJwOi8mXUXPZs5aySgH8le4Wx4VIk8U/VzcAswST1tCbdj0y/dl61UPcM8+wYOLxV/6rjRbpyLd2ALN0wE/sVHy17veeUr1YxXEuTV8RDrNsuiUwpMOmyO8fZzFGmnb4mzXhdVaHlZGEqdqumpL7MAxQ4bbb9RWBbNIn2u2sij7kg82pxmenjS92g1mTgA9smJ/XhRq4X0uXCfQ2iM9KmTACH6tfFlQ0mMmbviG+JvT69SRutCSDoST7oR5s2VMYaKpI/nADI25qT+ciGJzqumHh99vE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(376002)(396003)(136003)(39860400002)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(86362001)(6506007)(38100700002)(44832011)(4001150100001)(41300700001)(36756003)(5660300002)(4326008)(7416002)(2906002)(66574015)(83380400001)(82960400001)(6512007)(26005)(2616005)(6666004)(8676002)(6486002)(966005)(478600001)(8936002)(110136005)(66946007)(66476007)(316002)(66556008)(54906003)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?DwMDdq1zNKT+3SdSo4xL0UzVHdSVlBbB31JxfzNHmY89jWCabPPAKBhT5r?=
 =?iso-8859-1?Q?Xy0MLta0UWtXSNpObjkiy73sQHoEP/X+iiGYkpm44eVAGl/Ch9c220dHfT?=
 =?iso-8859-1?Q?gvaMmyagqTakG7H8ddu/SuoerzDoGpAmlzNsKzGvD9UCaIJ9Fn9OqjJfGD?=
 =?iso-8859-1?Q?ZC2zNKlrMn3H6+pGK0h+fNLpT5CjHjReLTdDmR8WR4qHWWM2LTWmQpLbqr?=
 =?iso-8859-1?Q?c3aE4VdS762yLVIk9eR7drWq8/FPaN/Hk4/kd8/Efq6oPiUUIvOuYSgmx5?=
 =?iso-8859-1?Q?s6m/TT+5Fx0jF1xoQ//vkrAHHEZ0/sB/uYdP9HkYMIcrn/wrxAwj9NcLEf?=
 =?iso-8859-1?Q?D8g1fML/GP+Rkn6+pWgQuOMyF0Ioptp4XXOenSbyCD2nH+16SPZ6d+iCJw?=
 =?iso-8859-1?Q?wKQFdGF948eb+VxXcNR3sCfwSY6hQmHHMU4FnW91rdNEfH4U2BuwGilLH4?=
 =?iso-8859-1?Q?EA3bOmuc5hntvwyk2tDT4c2ScRJu2vJ3KTMPqQojO/+72YK/3tXNO8jYrP?=
 =?iso-8859-1?Q?ECbmUbQ0ZH9fHOFcfvA9SEdS9u8BMhv15wrdY5xO07A+mf8uwRl4eiOLiR?=
 =?iso-8859-1?Q?4zevJ4Nf0PhFMDcsBQVqsSrJ6GteN9LFq+KFuh5L4/DZR2nnaHE8oLM340?=
 =?iso-8859-1?Q?IKJf5DJnv3RifOgrI8MnheSV3OaR41x/HDvMhAlx21VKZpJP1HgEs5XbOp?=
 =?iso-8859-1?Q?Hizks4FNx5D5YRnbt429xMyt+6gXafFhmP6b0neng+RuX9eyJ1ASSKibg/?=
 =?iso-8859-1?Q?7cn+uNvJiIoKvTrDwkFHC+pyGS4SknHR571Ma/tOrKfT/k+lm+pkntxbwf?=
 =?iso-8859-1?Q?Y2KLd1fqgLWhqMw9TMMLWuapCtdaMyXH7Dhzz+xg2oyQHf0k1QfbI1RXZz?=
 =?iso-8859-1?Q?ng8MTMl81fXNVU7LJ9cDpb+P3CpH1dCC+h8m5rZbcBF2VPIM1CM6kWmj9X?=
 =?iso-8859-1?Q?AukAgYc5KgIDdvsX6RZjBm+Q5fr+j4dusNsRs8DVQnwjF6+pfUEobqsG38?=
 =?iso-8859-1?Q?22yCviLuJYKcTYkUiJ2sC42NGfHpM64NPM/l/ixiRv3J/kF9XjPYyhA66q?=
 =?iso-8859-1?Q?4aSs9FIiBG8irOtDpw8Jx+5Bwxcgn+vkNXFh7/X4rcX22CSXKWDndK9NDy?=
 =?iso-8859-1?Q?MuepeqN/fqM7g66aQqV6LGkEW/NVx11fAwMIGd8uLcGuR2up6N/9kHD+ZL?=
 =?iso-8859-1?Q?z/jqjCpEuUJ9y0fDHD7aWwI9wqjmltFNNF+EhXxc9faIUjDmTuYVG01gwW?=
 =?iso-8859-1?Q?i2iKRmLy8ZAf8aYsTkUK0Ote6kmWY0k+hPZR6q0WO/SHyVS9WEpYWPcvo7?=
 =?iso-8859-1?Q?zjf+YKwQTZ2vVqyp9TIhA5V+MJVhNpkTylVBaqAOLPyjTAk4tw8yQWJVpQ?=
 =?iso-8859-1?Q?pL0DydvyDPn9FUyJOJ2QJsXl+jY7MBn5XvGXFF6e8JNyMD4wRmNO5clhmY?=
 =?iso-8859-1?Q?VEbnKfYubLilk/jnprJY+UI3duWN+ELx/fgABoQqq3+1xyVbYxn4ssl+e7?=
 =?iso-8859-1?Q?VeIenIg0d9gCOsa0gkZsIZyqMkK0DelXZKSPrEz8SW9pHZYdoUeGNbzP+Z?=
 =?iso-8859-1?Q?H3iCcN1XxN3fGcaYyBykC8ApubfEa10Yb0Ez4nHa7vLMtVrnyEhPvQ0RP0?=
 =?iso-8859-1?Q?MRGuV5qfsKnksJ65KBxb7ubdOjGTwsgvQ0?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cd9874ee-d14e-4ad9-aac1-08dbd0bf1289
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 16:18:47.4226 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Psv9K/dwUl8C/u2DaoMSBrrprdLaU3kyOQo0Uqp5/kF6AokJu+5ZWMX6ATxpfWq6jNGtkvto4HVnXuJPIH0WUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4594
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave and Daniel,

This is our last pull request towards 6.7.
I'm sending this on behalf of Jani, who was covering this round.

The main reason for this extra PR is to ensure that we get MTL
force_probe removed on 6.7. The platform has a good green picture
in our BAT CI currently and is stable.

Please notice that this is highly dependent on fixes that are
coming through drm-intel-gt-next pull-request that Tvrtko just sent:

https://lore.kernel.org/all/ZTFDFSbd%2FU7YP+hI@tursulin-desk/

Here goes drm-intel-next-2023-10-19:

- Add new DG2 PCI IDs (Shekhar)
- Remove watchdog timers for PSR on Lunar Lake (Mika Kahola)
- DSB changes for proper handling of LUT programming (Ville)
- Store DSC DPCD capabilities in the connector (Imre)
- Clean up zero initializers (Ville)
- Remove Meteor Lake force_probe protection (RK)

Thanks,
Rodrigo.

The following changes since commit a6028afef98a6e3f059a014452914eb01035d530:

  drm/i915/dsi: Add some debug logging to mipi_exec_i2c (v2) (2023-10-12 12:41:54 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-next-2023-10-19

for you to fetch changes up to 213c43676beb5f5a63cb27a0c8e8e71035b08445:

  drm/i915/mtl: Remove the 'force_probe' requirement for Meteor Lake (2023-10-18 06:23:41 +0200)

----------------------------------------------------------------
- Add new DG2 PCI IDs (Shekhar)
- Remove watchdog timers for PSR on Lunar Lake (Mika Kahola)
- DSB changes for proper handling of LUT programming (Ville)
- Store DSC DPCD capabilities in the connector (Imre)
- Clean up zero initializers (Ville)
- Remove Meteor Lake force_probe protection (RK)

----------------------------------------------------------------
Imre Deak (19):
      drm/i915/dp: Sanitize DPCD revision check in intel_dp_get_dsc_sink_cap()
      drm/i915/dp: Store DSC DPCD capabilities in the connector
      drm/i915/dp_mst: Set connector DSC capabilities and decompression AUX
      drm/i915/dp: Use i915/intel connector local variables in i915_dsc_fec_support_show()
      drm/i915/dp: Use connector DSC DPCD in i915_dsc_fec_support_show()
      drm/i915/dp: Use connector DSC DPCD in intel_dp_dsc_compute_max_bpp()
      drm/i915/dp: Use connector DSC DPCD in intel_dp_supports_fec()
      drm/i915/dp: Use connector DSC DPCD in intel_dp_supports_dsc()
      drm/i915/dp: Use connector DSC DPCD in intel_dp_dsc_max_sink_compressed_bppx16()
      drm/i915/dp: Pass connector DSC DPCD to drm_dp_dsc_sink_supported_input_bpcs()
      drm/i915/dp: Pass only the required i915 to intel_dp_source_dsc_version_minor()
      drm/i915/dp: Pass only the required DSC DPCD to intel_dp_sink_dsc_version_minor()
      drm/i915/dp: Use connector DSC DPCD in intel_dp_dsc_compute_params()
      drm/i915/dp: Use connector DSC DPCD in intel_dp_dsc_supports_format()
      drm/i915/dp: Use connector DSC DPCD in intel_dp_dsc_get_slice_count()
      drm/i915/dp: Use connector DSC DPCD in intel_dp_mode_valid()
      drm/i915/dp: Use connector DSC DPCD in intel_dp_dsc_compute_config()
      drm/i915/dp_mst: Use connector DSC DPCD in intel_dp_mst_mode_valid_ctx()
      drm/i915/dp: Remove unused DSC caps from intel_dp

Mika Kahola (1):
      drm/i915/lnl: Remove watchdog timers for PSR

Radhakrishna Sripada (1):
      drm/i915/mtl: Remove the 'force_probe' requirement for Meteor Lake

Shekhar Chauhan (1):
      drm/i915: Add new DG2 PCI IDs

Ville Syrjälä (6):
      drm/i915/dsb: Allocate command buffer from local memory
      drm/i915/dsb: Correct DSB command buffer cache coherency settings
      drm/i915/dsb: Re-instate DSB for LUT updates
      drm/i915/display: Clean up zero initializers
      drm/i915/hdcp: Clean up zero initializers
      drm/i915/pci: Clean up zero initializers

 drivers/gpu/drm/i915/display/intel_acpi.c          |   2 +-
 drivers/gpu/drm/i915/display/intel_color.c         |   3 -
 drivers/gpu/drm/i915/display/intel_cx0_phy.c       |   2 +-
 .../gpu/drm/i915/display/intel_display_debugfs.c   |  22 +--
 drivers/gpu/drm/i915/display/intel_display_types.h |   8 +-
 drivers/gpu/drm/i915/display/intel_dp.c            | 212 ++++++++++++---------
 drivers/gpu/drm/i915/display/intel_dp.h            |   7 +-
 .../gpu/drm/i915/display/intel_dp_aux_backlight.c  |   4 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c        |  37 +++-
 drivers/gpu/drm/i915/display/intel_dsb.c           |  18 +-
 drivers/gpu/drm/i915/display/intel_gmbus.c         |   2 +-
 .../gpu/drm/i915/display/intel_hdcp_gsc_message.c  |  44 ++---
 drivers/gpu/drm/i915/display/intel_plane_initial.c |   2 +-
 drivers/gpu/drm/i915/display/intel_psr.c           |  10 +-
 drivers/gpu/drm/i915/display/intel_sdvo.c          |   2 +-
 drivers/gpu/drm/i915/display/intel_snps_phy.c      |   2 +-
 drivers/gpu/drm/i915/display/intel_wm.c            |   2 +-
 drivers/gpu/drm/i915/i915_pci.c                    |   3 +-
 include/drm/i915_pciids.h                          |   6 +-
 19 files changed, 235 insertions(+), 153 deletions(-)
