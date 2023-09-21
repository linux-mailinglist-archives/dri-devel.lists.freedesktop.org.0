Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C177A9581
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 17:23:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B160810E5E0;
	Thu, 21 Sep 2023 15:23:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7603E10E122;
 Thu, 21 Sep 2023 15:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695309818; x=1726845818;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=hBukB8bsdrKEQiJHJI0pL0rN6L3WRfoEo5CwEIh3BKA=;
 b=SMTthQqehXyq7y7OojORlpj0Fe+8TcxUPKlR17bmXfesT7GJ2aJyhZ+x
 Rc4GUEZZTQoJGgWEJq5fkepeIhVA89pQDwPmYlsKXKE6e/kI/DFBZlIOC
 DXTH1eV5DP0dRrgFQiVP0yHH/FVx/kQghBNzm4KhDtqQncoi5nF4C4aJI
 1ojdIKO6pF03D5CwAikG6WIfIuzXY1eXH9yVN0b5dh5gDI1DEYY60KrQF
 F+gKPqHqrpVw/CwwjS5kYU/nwUQvYGv1llCqkpjAOc4GkCHyc1wJJoUnn
 d4wMCiwT3oU55n+qG7upKhcQXRUaYDU73sZPiVD3O1/UZYSVkEQEc/3iG A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="377846740"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; d="scan'208";a="377846740"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2023 08:23:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="837326663"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; d="scan'208";a="837326663"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Sep 2023 08:23:14 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 21 Sep 2023 08:23:14 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 21 Sep 2023 08:23:14 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.105)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 21 Sep 2023 08:23:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IPl+0GVqs4T5+U9Xo9a4tKeKWOU2sgmk1W5NQBvcCfKuFq08mrqAr0ZjdP+XmLn8VIkFDoJ8ZhfYPfGKWKHM0Jm9QYI0cIGqvmua/7O0aGdRaQzoncnNBcjKJeiY1O9EsYF0f4p6gTOlshLLTVE26bx++OPcJWhgfsgkDJSgSV7BBen5JFdlElw+ri7FQfREEX4brhSMpFnivjQgBXYwLhOtzH+QiwWQP4phXes9Yfk9dqOXCm2xsLgAiMIpa9MZmABO3981X6XU4F32JLRQwdEiql3VTKii7B9nA1MENkm0vns3ABVPOZAWZ0FZZkhKbK4hZJDcEo58YBSIifsu8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jnrHuPRXeNGnoc+drmkYWD2Sw1BYo1LtLBANmB2gKxg=;
 b=VeykhXzw41Fxo71X++WV+g0/y1qxgoD5zhq9rJfLITFaQ2RWTeGTAFjnfrJ9z4mI8ADD9GO0TXeYIQM+mwnDsVn9at3dh3ana3nqFMC7vGE7HDpP/KUtAVCRSatncrdWZTVwBr7kBy7vgOKCg9nRvbfdPu/ZEKrv1NILgkEwD9VojF3YdipHqaCvayroNDf8ZtHBs3BCktQDcRn0gyJR1dCAqsEnf7Zbk+UAOZS1hG15U8Nxs37ZOKvZxldpiy8aPZKBqpsTRV6vCIYkZY8jVzQ0I+RvOq09EXsIKERmzTdG+JS3iB8pOzI4ctVfmKOLPeGyWj1RHu+cOBczJ37Y2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Thu, 21 Sep
 2023 15:23:12 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%6]) with mapi id 15.20.6792.022; Thu, 21 Sep 2023
 15:23:12 +0000
Date: Thu, 21 Sep 2023 11:23:07 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-fixes
Message-ID: <ZQxf267jxc7tiIlZ@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SJ0PR13CA0029.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::34) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH0PR11MB5444:EE_
X-MS-Office365-Filtering-Correlation-Id: 1da4363c-221d-4e90-1e66-08dbbab6ab54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9QaryjKnxD4gWsRbFDhE5Al93nJ0zpOq0xUouv6nRP3xJYTWZ3XmpjzX7wMDHUCnV6KGcCZmlnLkwp/gRfbHCOovqZvXagxxlfJg77rqR3g9rsTz/EES2p47tmLVCZis7Kw4vfAboC2/hDVz8FA1fcE92xG8JtK0Bmv5SKEeNNi3RgFH0LCQqld9Zu1UDGzfR214NEEFyhUZoYOLo3qTHE3TezZJMcLQrhO7ReHPk4OADWpEa0U6Y2L/BkRJCcGFlu3NzvqBC96m9XAR15bvjN97dybpofPSIeyntLkaF16k4gZ8H0O7+Nnf73AfU4S9MZTWeOcwB//chSGCaQsZ9nY7U085EXZC+N++J9gPL18hEUpuvSAtd73nzV+W8dWpJzhPH2zbpF07KheFlecXF7AxN02YlgNuDCg75bbbKA5bLB7xxjq9tCgnKa8TIoAN6ENxa0E9wd0AF5YHEjUOyTxf+DiGXR1YYPvZZax59ayOC6q3Z8FL96FWkDBmiAA2PVvHqNpW2xcW8xA2vTdbx4NUpjK9LszRU3UTzSMaIGqtFS624LtGlyqLdBzy1SBC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(136003)(39860400002)(366004)(346002)(1800799009)(451199024)(186009)(6666004)(6486002)(6506007)(6512007)(478600001)(2906002)(83380400001)(8676002)(316002)(66946007)(54906003)(44832011)(66476007)(66556008)(4326008)(5660300002)(110136005)(8936002)(7416002)(41300700001)(26005)(86362001)(36756003)(2616005)(82960400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZappS3QNe5adgvIkeXD2CTvU8I3nA/s6558niQ1d9yAU/Ox8DwrllPibTBMo?=
 =?us-ascii?Q?HCHMYg65ZiNiUposzFpkOsr580lT+Y9tQM7jV/0L+jNCZ7uPYOO1wqmiHCUB?=
 =?us-ascii?Q?WOZ/bec0POXgtmC4FYgVQGJHEDdJRoq3buDdxXmlBrJfF+fZ3T97detImTBT?=
 =?us-ascii?Q?WQlE9GrCXw8XW8ctnUplruxoVQl30iV6HohudcArWjFXzZEZYtuje9G4KA3w?=
 =?us-ascii?Q?1e4rHC28qLY32AaM8Ws5kSAaCPH5s5xtXLg7MIxzuw3pmpzboCaYAhvhoWpK?=
 =?us-ascii?Q?m7vetrDTP/9htOJpvOGxv0uMmtPSxzrkJyv2wEoVFvxZnTt8TFsGUhxN3rFW?=
 =?us-ascii?Q?SQooyoSdZ1fcTJRm6qmqqnq6Tws3imaeMqp2mz0SZt8CTgnqifToP63JJTAa?=
 =?us-ascii?Q?OaK/VW/SY4mszcNiGWUk53PSF4ERTmhgbgYMNqGU4legBHlGWVgBbtOM1+Qi?=
 =?us-ascii?Q?v92upzWVIEo6tpdIOvyaClHKU1pFn4g/r+sYUU/frGLaN3xZ5GSY7QVPPOmI?=
 =?us-ascii?Q?vyvqEqfO6cXmVpxFPbAEZ2s/dgCscfcNTC58a7qOH0saSc7IgjH9O5c5x1L2?=
 =?us-ascii?Q?Kvl7LxMCWglJCE305rMZpeW1tTxma381P1RIvAEBOGmtXDMXoQNdR3ibcOIP?=
 =?us-ascii?Q?rzwYDuCAPdiGEi0x9x/eeMAHCyhUxC3YBAJOvfykfqAYnvSDlKSvKizqO/NS?=
 =?us-ascii?Q?ogPXnMrswHkGxPwU8KAZ/J4SKLLlPPwlY/+/hJVhaRZ3fI8n2CdKBrPpkvYQ?=
 =?us-ascii?Q?Eh7JDTUbO7tLt+pI3DT9PPro9hl0LTgdLu7hVM6XU791PYl4A3VGM5Temc3v?=
 =?us-ascii?Q?X5vyDda96l2ZrlvhXzlspYMVeJTHqb0XbaqnQetSqLf/qJ9gRRy5jscE+gqZ?=
 =?us-ascii?Q?ELV/QLy9Di/49esfXJQ/tEP/Jf1LayG3fhyYF4VAO4JhmVi6ZBWbaH11mh1W?=
 =?us-ascii?Q?zXygUq+qJNxYpJouyM1Qu1X2YlToV6AYv5SsMPg9JhAJJREyVeqkAf8ERrP1?=
 =?us-ascii?Q?M9DVkpJR/jS930Mvxauc2DaSS7j7ECtD1pdd6vzC3iWuuaOJHqwkAGWWQhZ3?=
 =?us-ascii?Q?Libvz9K6BqwOPdk2XBupRnpWAukregcjCKrCXY4HXLRED0HUvFwTdgq9Lr2D?=
 =?us-ascii?Q?c/bJOdn9B+BBeU3X9A/bMSSp/YoLvQFgG9XkOjKZRFdSzgcmQ4rG/QxrfwaM?=
 =?us-ascii?Q?LRKNDx0a6xfdZe+r5D9pQzYmuNTqN5xWiOz+Lm5F9qO+U1RjFgQNUIEbNVxP?=
 =?us-ascii?Q?kaIQmlimDexRP0fxOFmwBGhvCSPqESa+5c1A/zXMB67LKKxT8hbBMwBV6Cnz?=
 =?us-ascii?Q?MPUBMbGoop9SOyG+ffxSAI3kS4jCbgn7SJ2OSlmg19IjbK2pK/2uF0BeT9qQ?=
 =?us-ascii?Q?R761qXVITygJQ49WwH59OrT0kdoLUWaeoAuVj/yvfNTVrpWgcP7IEPrDLNkN?=
 =?us-ascii?Q?Y1j7gPyY2P6y4aYZK34MbexdcST/FUR+XGxOhyTtXWxqmHb4CZWBNa+3/6O2?=
 =?us-ascii?Q?GmsIzGMuNisNGGobL3yM+Hmub+y0mVdSeu6Y5q5rpyZ7zMhuojX2UJevytJA?=
 =?us-ascii?Q?HVr98Vc+SJOcq1WwUrZm4G/a1rNFE2zL2u+pBXCX?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1da4363c-221d-4e90-1e66-08dbbab6ab54
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2023 15:23:12.6232 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uniead9ldgj2IJpFo3gs4X3SMCgMy6VFsZhUQJ2VmxOkI1hEI/QpbjobXE1pVVdXzUJ5XEf1SGqwNJTSmpm6oQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5444
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

Here goes drm-intel-fixes-2023-09-21:

- Prevent error pointer dereference (Dan Carpenter)
- Fix PMU busyness values when using GuC mode (Umesh)

Thanks,
Rodrigo.

The following changes since commit ce9ecca0238b140b88f43859b211c9fdfd8e5b70:

  Linux 6.6-rc2 (2023-09-17 14:40:24 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2023-09-21

for you to fetch changes up to c524cd40e8a2a1a36f4898eaf2024beefeb815f3:

  i915/pmu: Move execlist stats initialization to execlist specific setup (2023-09-20 10:55:37 -0400)

----------------------------------------------------------------
- Prevent error pointer dereference (Dan Carpenter)
- Fix PMU busyness values when using GuC mode (Umesh)

----------------------------------------------------------------
Dan Carpenter (1):
      drm/i915/gt: Prevent error pointer dereference

Umesh Nerlige Ramappa (1):
      i915/pmu: Move execlist stats initialization to execlist specific setup

 drivers/gpu/drm/i915/gt/intel_engine_cs.c            | 1 -
 drivers/gpu/drm/i915/gt/intel_execlists_submission.c | 2 ++
 drivers/gpu/drm/i915/gt/intel_lrc.c                  | 5 +++--
 3 files changed, 5 insertions(+), 3 deletions(-)
