Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11EB59A318D
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 02:05:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D8AA10E009;
	Fri, 18 Oct 2024 00:05:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NGJH/la6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77CB910E009
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 00:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729209937; x=1760745937;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=s38OCB+1jGeiJyEGE7ELfW7fOTxErPXBGzT8iIeetQ4=;
 b=NGJH/la6jmYSgVS2I7U9b28EuCfIyPp4U+5ctBr5z5EKiLiaD+VZKsz1
 3/tO4tu+CEULMIFHvO/5W/wytk77L6DUeXhhajiwRSni83qW0QoxUjtNW
 ubmhF9ueexdH5B2Eiu1dYcWWgrBVkqGmXEZTHUx8SbJY5SZQj8zIEArFM
 ILC85wzXPBrLG/Ioj9OM4rao4wcRnClbY1v4LTWHIGKm1b5PUCSsqPYmL
 w8LXTs3N6igVT9SsoEChEvPg4OKBYrXPpU4je/a9iDoF2XmYuwGjg9iE3
 ws/NAjTm4nzwN5YtDxuOjs/r/29HjJlB9na+Nm2MIAW9HnpSRTEgshFM8 Q==;
X-CSE-ConnectionGUID: aB4fbJzbQkufro6CSi8o6w==
X-CSE-MsgGUID: yMV3CLDFTaS0balV47agzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11228"; a="28163554"
X-IronPort-AV: E=Sophos;i="6.11,212,1725346800"; d="scan'208";a="28163554"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 17:05:37 -0700
X-CSE-ConnectionGUID: ETDi0+HCTSm8OhpVOnQ2FQ==
X-CSE-MsgGUID: pyPLEIoaT9aiSN7LRTzRMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,212,1725346800"; d="scan'208";a="78311946"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Oct 2024 17:05:37 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 17 Oct 2024 17:05:36 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 17 Oct 2024 17:05:36 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 17 Oct 2024 17:05:36 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.46) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 17 Oct 2024 17:05:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lKsZPSoxXzSjuy31PpiJsnsoRWmqrDq39V0ENaqOFQuu7R57rRwSuoIhKpfOoDbmult/8FBRDWNxGDm4wz+LLv+aeko64CEaeCwZbPCz7mGKadtasDnWd+yRCF/cu0SDQC6Kr0gTVBQisrqxL04IvSXMPgQqr1jEk0O/uVXcQthkzHVsYrrw/CC4uc/3zrA63+68jkaTz7nBPJ6ZgX7fWhj2GihTCdRi6rtQeF71K4gvUbwM+nEHz6DzM43jYCPmyUVrQqgL4s90bHQ/NgrCr8Br/HfCtwe8E7KSv81l8PdsAjxtCa+SQrgVhbFOhsAx9VFM3S9ZeTn5oVFzjkDt1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5voHKb+XylRS5rWkVCYXxOeMWQmamaH6+uUsXSNotIQ=;
 b=s4kT40iYBYbx50oezTFAQip1nhdisk3aWifwz0JChlgOAwCTgIyGJwSUH1pjvh8XCX0VkHj1fOp5xJVxSxCOayTPG7JRXBO4HtCSf72aENHt1GEc+DyzOEY2Mi49aAwa3imMyCyCc65myclrmgVqQny15BFNTk+Ve2wUtMKGWhWywxq+P5eaSsiV6Nqx8R8fQHqZCsePVcn44ppmp8A2sqBte9ima5wErQz7BiTv30m+JOIqxW4cVV3C3Ok4JoZmC0lVoT+bkKY50CG2DNN4z2YUyjqV7i+sn3YX3aLwWNZ9fkdMKUIXsGaFtugNPhxBWp2aAJediHkPFKClLYpWKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by MW6PR11MB8412.namprd11.prod.outlook.com (2603:10b6:303:23a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.24; Fri, 18 Oct
 2024 00:05:28 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.8069.018; Fri, 18 Oct 2024
 00:05:28 +0000
Date: Fri, 18 Oct 2024 08:04:58 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Maxime Ripard
 <mripard@kernel.org>, <dri-devel@lists.freedesktop.org>,
 <oliver.sang@intel.com>
Subject: [linux-next:master] [drm/tests]  2735d5e406:
 WARNING:at_drivers/gpu/drm/drm_framebuffer.c:#drm_framebuffer_init[drm]
Message-ID: <202410171619.be977af4-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: KL1PR01CA0099.apcprd01.prod.exchangelabs.com
 (2603:1096:820:3::15) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|MW6PR11MB8412:EE_
X-MS-Office365-Filtering-Correlation-Id: f6816db6-5e3f-418d-0825-08dcef08866b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qkpB528F+64EVp8LRXRODjIVVvY3E3HmOnbots5NsE+pcz7GXW7G9Jr04cli?=
 =?us-ascii?Q?VMAX2JOwpmu3QzK6s+x+eeKl8PDfpioYFBqzHV/5IJK1KtXOs+wVKogB0fyL?=
 =?us-ascii?Q?Ltk4k7A+HrbXiE3Ys8QGRnwk3dyNCC9ra/YIgfFgkhwDivxpgu6bKV0M1wqZ?=
 =?us-ascii?Q?W238NWKryK0jMeqYIVDKIHeY37F1OdyhrtL3NBxu8gUBOnH+hXUIpN1eIBVN?=
 =?us-ascii?Q?Qz0qCvPiGHf/EhefwuGmheSksCqQDA3wUoDzPrd3WiRT2MrnT69mQ4ds/vMr?=
 =?us-ascii?Q?og1hLdBnqeFTyTGO2bZBZyxgnWpjX8X74VSi343LySWtwS+4RzY1qvBPj3gS?=
 =?us-ascii?Q?c+KxSqIzPZb434JKKJ65Drtn2xibbBOfw3HOL1dXhJMof0Jk2FdB516I20nA?=
 =?us-ascii?Q?9Ozm4mhtQDGfL3GjsTWcPFRBdsoi4vnT5Vw0ACTwZB488Xc6uWGDj5M9DnBd?=
 =?us-ascii?Q?l9wlVU363D4FggfsoEmme7feA5X3VZsw3bnEvALlfPiMCmwKlXOYfgwn24Wf?=
 =?us-ascii?Q?ErkWpVAO+sLF0PW6/l5TUli2FsW4vp2Ih8YIIyxN/hJZ4tx6mrmWuzR91XvR?=
 =?us-ascii?Q?MoqvRmc5cNif/XgfFLcAW+sUBIFJzWYVRllnLBDMSdFK7LafthPxcdjyXsz7?=
 =?us-ascii?Q?OW8QGQo3fpreIp4J0RGfNSZicFQkzCbEkFmZgeXDbuFJUKgWUnymLQKXMBFe?=
 =?us-ascii?Q?aKWzypFyvq9Hhe2UuO0Awh//icTVzufCsk82OVh0yntTJi/1yzDJQZn5wdAf?=
 =?us-ascii?Q?HGAoNf7xsByvSZF73ZvJ4EgrvMof2i/Le9EnhUkSD03c8uOOX0bvoumHBj5K?=
 =?us-ascii?Q?kqu4he1dL9aWzMMKSe7RS2aECOQNaSPtS/QfCOiv2Kou/CY5jg1XmaeMqqED?=
 =?us-ascii?Q?uTQhm/yHq8qZtSfXtG4+LXTOxuapoguA3sk2PCaFTiAB3yV6YhTuhwLi9XFB?=
 =?us-ascii?Q?Nuc8vrOJiRGcGOAwvJfzjijlv1BOhX/YDDIGAoViTxOCVyRNUhM6rw2PLX5H?=
 =?us-ascii?Q?pa96QJTxvIzXFFR/P38SxshACwqYmlA0yS+C+XJX6txTuaCcq8Uuhcdx20LT?=
 =?us-ascii?Q?pcaqo2lsLA+v6wGyaF9YOZXxhwq85rWPwY2gQN/CxgWkUpS/yHxrA4vTFOWt?=
 =?us-ascii?Q?phSW2gIoacqJDi0FG32DLIF7rt9mQt30/VbV38p2QiEEulvqtAE6pauKC1BC?=
 =?us-ascii?Q?jEffiP5PrRqW5OQxpvZnRtQ9gG1tSRtOlixlC0gU0Xk7b4II318/JhfWab+D?=
 =?us-ascii?Q?s3WdZ0e8bte0LjWtlU45u54BZpczSR0DhVqe5zXt7Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8603.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RR73EcSeArNrOGWLp0NRhZPQTszHqGyKIh1BbUR7HZ+0Y3xgsLR1/2YdT2kc?=
 =?us-ascii?Q?/RHflrAtbKDqba2P/u8rEF+TKIpqnI67n+BCj9LolkFaiQlQEb5tJQBha8XS?=
 =?us-ascii?Q?Ux6ooFnY0QrQf7tNz0ddgLEa9gJd8xjSZXN1RVmuRl/EYYIjBUlWJahsRr3B?=
 =?us-ascii?Q?qqf4RrNBHxl5hTs/JO0Tk7KMu4YEFprbTVZOW2swFMBXlN9LR5Ui9lO1MB41?=
 =?us-ascii?Q?a6Ujm30ikDh65XijoZPcL+mh7Im+8UiH1d9MMXy08KMr8hav8fdSwe8mQJxc?=
 =?us-ascii?Q?qaGz8CtP7P2eZQIkZlp0xLYoSvplJpA+YE3CRRpToD1E9U4u6ZXmiptBCBq2?=
 =?us-ascii?Q?aiFE/0eNdUpi4Nzny7oFZ+GWIQ2C5QWZgzers2TQ22UYwLyPf11PEOuZRgHi?=
 =?us-ascii?Q?FvvcZd3R2HpfQZ2WAOaibkX7mQFC9nLC37JiaZHUtsKogooxRIEeFmjAX/ml?=
 =?us-ascii?Q?uTZT0tSB/j+mltU73/uPrutpg+K8WshOXftAPuv09amlRNL/Nrk7x/alOeUM?=
 =?us-ascii?Q?c0ZoH6ZDwfP0m4CsI/GMWDCnbxpm1IdJEIpFtI46aAkMtQGqILN3u14ZwhDz?=
 =?us-ascii?Q?/l5GbxXdHByNA3hyte6w+yOK4MqTyIMj3Z6+YG7wEqjamxCg/kfB82v+1SNO?=
 =?us-ascii?Q?bUalT81yrALNmZSBWjRFUeuNz8FrEM9RAHkQkWZ8JKP144PsS6n5bP8Q2cxk?=
 =?us-ascii?Q?T7WTi8y8kPpBnPpaAnc3cxjOslmvX+m2yeyk+doBsU1ucZWIx0VnU0ZIDh05?=
 =?us-ascii?Q?XQYDKmW+3sYoyshRziD598GqjNakY6d6iBXAKX/BSr2ZAq/v06lD64XhYah5?=
 =?us-ascii?Q?RMWDzqy6lYs6/S7Xcfo9I8/sHXAQzFCacGVA3DLBLKatVNDy7HPugGEG3GmN?=
 =?us-ascii?Q?UuHSYHgdRVzb2lA9HaYUNdtrwBHnJDY3JkOzpeIWV3jSbDQr9z6bXgfAD7AG?=
 =?us-ascii?Q?G2SvwixU3X8ydo2wSXzgi9Hr5P290iLQqpNt62XuVF3bE5YIWS+IeHJLwMF1?=
 =?us-ascii?Q?eMZoDsQ98zhUMsGR+JoitCb5gdAhVwGd0Cp6XkkhAkHC/S1datwvsxLdyPVp?=
 =?us-ascii?Q?59gTxwev/DOhcHtQkRgPk3+wH4NZ85vjYG1s7ENuTINzmYXjWz5oNI3hdOJu?=
 =?us-ascii?Q?CjRbVhDGAhmn1YXh2rbOSEf7jJ1mKYLeP+69ZH9tKzrdFT/CVz6oCEgQwIJ1?=
 =?us-ascii?Q?wBzQ3U7vLai7OHUZq/YIvX9tWaEroFHlKV8MhRjZmdDSj3MxGiQx3HhXpKqd?=
 =?us-ascii?Q?oGcYebmL8ZhD3qSMjLpiLkcMUno1qlAm8M7eTnxpbqYrdAAZuYjalfPetPPs?=
 =?us-ascii?Q?FhoXh5mWLIjM/mKQaZEQeXL2Ol6rZhhnNMp5BhwAhM1LFVmcHOeUJ7SR4SYx?=
 =?us-ascii?Q?GOsbJQQRhp8AmPQC+A7YBSjQ0iO42FZ9c9MQdpXTa3q6Duk6LVAKmvffEmcc?=
 =?us-ascii?Q?XzylVgHsQWKBCnasKhs0M//xJQX1BfSOp5F/xI6pj7Dy/gVQduiCl0OjfC/7?=
 =?us-ascii?Q?x4/FJRAkLYc8azD2IPA1Sg+47eCX1w8Vl7RV7cqLWyv0/3ywbakl80w6mlts?=
 =?us-ascii?Q?+6MhXd73qesj+JCGVo65//EnvQ17fXf1vCqZ5U63n1NlGMDyAd+uA6mRKAms?=
 =?us-ascii?Q?HQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f6816db6-5e3f-418d-0825-08dcef08866b
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 00:05:07.7019 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PtprWfaBl6TNu8zUQvO8mMyx/VDNs6UK3GCDkiSXx1xuG9kndImKDOWjAABZSnCe54nWA9uPSgfaSMNI2iCmGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8412
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

kernel test robot noticed "WARNING:at_drivers/gpu/drm/drm_framebuffer.c:#drm_framebuffer_init[drm]" on:

commit: 2735d5e4060960c7bd06698b0a1990c7d42c762e ("drm/tests: Add test for drm_framebuffer_init()")
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master

[test failed on linux-next/master 15e7d45e786a62a211dd0098fee7c57f84f8c681]

in testcase: kunit
version: 
with following parameters:

	group: group-00



config: x86_64-rhel-8.3-kunit
compiler: gcc-12
test machine: 4 threads 1 sockets Intel(R) Core(TM) i3-3220 CPU @ 3.30GHz (Ivy Bridge) with 8G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202410171619.be977af4-lkp@intel.com


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20241017/202410171619.be977af4-lkp@intel.com


kern  :warn  : [  111.593780] ------------[ cut here ]------------
kern  :warn  : [  111.593995] WARNING: CPU: 0 PID: 4859 at drivers/gpu/drm/drm_framebuffer.c:867 drm_framebuffer_init+0x40/0x380 [drm]
kern  :warn  : [  111.594323] Modules linked in: drm_framebuffer_test drm_kunit_helpers linear_ranges intel_rapl_msr intel_rapl_common x86_pkg_temp_thermal intel_powerclamp btrfs coretemp kvm_intel kvm blake2b_generic xor raid6_pq libcrc32c crct10dif_pclmul crc32_generic crc32_pclmul crc32c_intel ghash_clmulni_intel sd_mod sha512_ssse3 sg rapl ipmi_devintf intel_cstate ipmi_msghandler i915 ahci intel_uncore mei_me ttm intel_gtt libahci mei drm_display_helper libata drm_kms_helper drm_buddy video wmi drm fuse ip_tables [last unloaded: drm_format_test]
kern  :warn  : [  111.595499] CPU: 0 UID: 0 PID: 4859 Comm: kunit_try_catch Tainted: G S  B            N 6.11.0-rc7-01410-g2735d5e40609 #1
kern  :warn  : [  111.595716] Tainted: [S]=CPU_OUT_OF_SPEC, [B]=BAD_PAGE, [N]=TEST
kern  :warn  : [  111.595842] Hardware name: Hewlett-Packard p6-1451cx/2ADA, BIOS 8.15 02/05/2013
kern  :warn  : [  111.595990] RIP: 0010:drm_framebuffer_init+0x40/0x380 [drm]
kern  :warn  : [  111.596223] Code: 56 41 55 49 89 d5 48 89 f2 41 54 48 c1 ea 03 55 48 89 fd 53 48 89 f3 48 83 ec 10 80 3c 02 00 0f 85 54 02 00 00 48 39 2b 74 1e <0f> 0b 41 bc ea ff ff ff 48 83 c4 10 44 89 e0 5b 5d 41 5c 41 5d 41
kern  :warn  : [  111.596572] RSP: 0018:ffffc90000edfbd0 EFLAGS: 00210246
kern  :warn  : [  111.596689] RAX: dffffc0000000000 RBX: ffffc90000edfcc0 RCX: 0000000000000000
kern  :warn  : [  111.596835] RDX: 1ffff920001dbfa1 RSI: ffffc90000edfcc0 RDI: ffffc90000edfd08
kern  :warn  : [  111.596979] RBP: ffff888103087000 R08: ffff888103087000 R09: ffff888217ec9100
kern  :warn  : [  111.597126] R10: 0000000000000003 R11: 00657361656c6572 R12: 1ffff920001dbfc0
kern  :warn  : [  111.597272] R13: ffffc90000edfc40 R14: 0000000000000000 R15: ffffc90000edfe40
kern  :warn  : [  111.597416] FS:  0000000000000000(0000) GS:ffff8881c0e00000(0000) knlGS:0000000000000000
kern  :warn  : [  111.597592] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
kern  :warn  : [  111.597714] CR2: 00000000f7293000 CR3: 00000001310c6001 CR4: 00000000001706f0
kern  :warn  : [  111.597859] DR0: ffffffff874243e0 DR1: ffffffff874243e1 DR2: ffffffff874243e3
kern  :warn  : [  111.598004] DR3: ffffffff874243e5 DR6: 00000000ffff0ff0 DR7: 0000000000000600
kern  :warn  : [  111.598149] Call Trace:
kern  :warn  : [  111.598217]  <TASK>
kern  :warn  : [  111.598278]  ? __warn+0xcc/0x260
kern  :warn  : [  111.598365]  ? drm_framebuffer_init+0x40/0x380 [drm]
kern  :warn  : [  111.598594]  ? report_bug+0x261/0x2c0
kern  :warn  : [  111.598686]  ? handle_bug+0x3c/0x70
kern  :warn  : [  111.598773]  ? exc_invalid_op+0x17/0x40
kern  :warn  : [  111.598867]  ? asm_exc_invalid_op+0x1a/0x20
kern  :warn  : [  111.598969]  ? drm_framebuffer_init+0x40/0x380 [drm]
kern  :warn  : [  111.599186]  ? _raw_spin_lock_irqsave+0x8b/0xf0
kern  :warn  : [  111.599291]  drm_test_framebuffer_init_bad_format+0xf0/0x220 [drm_framebuffer_test]
kern  :warn  : [  111.599451]  ? __drmm_add_action+0x14b/0x280 [drm]
kern  :warn  : [  111.599678]  ? __pfx_drm_test_framebuffer_init_bad_format+0x10/0x10 [drm_framebuffer_test]
kern  :warn  : [  111.599849]  ? __pfx_drm_mode_config_init_release+0x10/0x10 [drm]
kern  :warn  : [  111.600082]  ? __drmm_add_action+0x1a1/0x280 [drm]
kern  :warn  : [  111.600295]  ? __pfx_drm_mode_config_init_release+0x10/0x10 [drm]
kern  :warn  : [  111.600543]  ? __schedule+0x7ec/0x1950
kern  :warn  : [  111.600635]  ? __pfx_read_tsc+0x10/0x10
kern  :warn  : [  111.600728]  ? ktime_get_ts64+0x82/0x230
kern  :warn  : [  111.600823]  kunit_try_run_case+0x1b3/0x490
kern  :warn  : [  111.600923]  ? __pfx_kunit_try_run_case+0x10/0x10
kern  :warn  : [  111.601031]  ? set_cpus_allowed_ptr+0x85/0xc0
kern  :warn  : [  111.601132]  ? __pfx_set_cpus_allowed_ptr+0x10/0x10
kern  :warn  : [  111.601243]  ? __pfx_kunit_try_run_case+0x10/0x10
kern  :warn  : [  111.601349]  ? __pfx_kunit_generic_run_threadfn_adapter+0x10/0x10
kern  :warn  : [  111.601494]  kunit_generic_run_threadfn_adapter+0x80/0xe0
kern  :warn  : [  111.601615]  kthread+0x2db/0x3c0
kern  :warn  : [  111.601698]  ? __pfx_kthread+0x10/0x10
kern  :warn  : [  111.601788]  ret_from_fork+0x34/0x70
kern  :warn  : [  111.601876]  ? __pfx_kthread+0x10/0x10
kern  :warn  : [  111.601965]  ret_from_fork_asm+0x1a/0x30
kern  :warn  : [  111.602061]  </TASK>
kern  :warn  : [  111.602123] ---[ end trace 0000000000000000 ]---


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

