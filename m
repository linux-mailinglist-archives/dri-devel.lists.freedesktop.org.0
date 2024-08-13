Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B825694FDA2
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 08:14:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF8AD10E2B3;
	Tue, 13 Aug 2024 06:14:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EQpcqY0i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 042E810E2B3;
 Tue, 13 Aug 2024 06:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723529645; x=1755065645;
 h=date:from:to:cc:subject:message-id:in-reply-to: mime-version;
 bh=uk0kbQ5KH7+Y2uA4oSqC9qDwgFWvEDro49wiDwWu6g4=;
 b=EQpcqY0iHhT9dDuvdr+q5Z7DU1NVk7/qCuibu7hOggdwN2yCz9e4VSDx
 emD0PZXrfwV9sCGrftTBwl5XtdYkvLrA8ScRESCfiCCVXoTdBiSAM9nLF
 3ctsYSz7UAsObLsXPQqec84DbptdpIf/IlUJStY8sJrp6O797yU8RrEDE
 uJufKNSOK+dQoP0xDlL53AKfrw85Gdfd+BUCu0dhHKhS/YGFNDFjPpE3w
 ycpM43zpNzZW+o7gsHJOAnE05QVx47BXcheJ9HQrC2SYEMkClLy8uNvqO
 0+g966EqV8TjKCvE1l6NRL+GahsW6c9G0ornpidPwmISuaAft4w05e77X w==;
X-CSE-ConnectionGUID: 6VYayQvhTViJcpbUCFBlSA==
X-CSE-MsgGUID: zFJpD1SZQ8qRiJdVw6GDHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="24580672"
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="24580672"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 23:14:04 -0700
X-CSE-ConnectionGUID: 6TtNZpMuRrKt0FaiwO6nHA==
X-CSE-MsgGUID: cXyYhNuwS7mOEzV+bfxMcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="58512507"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Aug 2024 23:14:03 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 12 Aug 2024 23:14:03 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 12 Aug 2024 23:13:44 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 12 Aug 2024 23:13:44 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 12 Aug 2024 23:13:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qdMUqNAqCQAmD2efuI+UcgEtgcARZytsnVLBgt+pWB7SpDbVjhl8qDIByFgjpFLWAdvhT9XRcVqYNe2udtKSo9ofCDa6QLxlhAJ+Y87H6ZebIbBhL0BoBLleLfZOJoVEY6lL5y+aE8zMAU+vCltzFZp9ZGz5rFa0itV6BgJ6ykE7diN0wFFRtuHqaWFn8zsCG+41uAPn8X2hEtFU17FUs4hdS4u1clJ8TqCIWzTaAjrkXfRvLn7WdsdCwAUr3APJRy5QukugK0IBJg0TLMQh5slxdTXpsWqxo+vjFv7h1JTuuD/p0hjrqRIy7971Ru590n7QhzU5n7VLg8krxBOsPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2S9reA3Y49E88nS4X+n9Pdzd2VAq2RROYfMJ1tkgjzo=;
 b=p0aiC8+nXzbuRhEsInpYqwnWO/d3l2q7YOk5yThS+rcQuEMX+ub2RJRWLma8Z4ooe7pC7BIkNIh6jPUVoOzOv3rTEecara0Fen55oxxODfwoaZqqB7JPVNoboFnDVvgR37WUu1Y/nqY6pW1ukR/sDA47yjSe5FvXxaMm082791tmq7xt6QnSkdHnOK0neSGZnj3n6jnixam9DJ0plX+ID+c7hzTl/4S69DMIn69fO8mJ/2foizsB09Have5fXRzqkL1FltV+hnDv8flM+fLCmSu95vDkF1JhWeqIHNMdziRU23VpuerLh7/1lQanwTRWm34NZKAuCFMsXCuGtwjH9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SA3PR11MB7654.namprd11.prod.outlook.com (2603:10b6:806:305::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.32; Tue, 13 Aug
 2024 06:13:36 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.7828.023; Tue, 13 Aug 2024
 06:13:36 +0000
Date: Tue, 13 Aug 2024 14:13:25 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Tejun Heo <tj@kernel.org>, "Lai
 Jiangshan" <jiangshanlai@gmail.com>, <linux-kernel@vger.kernel.org>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <christian.koenig@amd.com>, <ltuikov89@gmail.com>, <daniel@ffwll.ch>,
 <oliver.sang@intel.com>
Subject: Re: [PATCH v3 1/5] workqueue: Split alloc_workqueue into internal
 function and lockdep init
Message-ID: <202408121610.d1cdf757-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240809222827.3211998-2-matthew.brost@intel.com>
X-ClientProxiedBy: SGXP274CA0008.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::20)
 To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SA3PR11MB7654:EE_
X-MS-Office365-Filtering-Correlation-Id: 4943dc46-a66c-4b2d-bbdb-08dcbb5f1150
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?eGyRHgIpz3tO+xDau6Kx/3bqyi9B9I93QtFaTM8rFqmNBbbnrGuESjKijR+U?=
 =?us-ascii?Q?gCgG2xDeL83/R53i8zQWJQvg5z5rJ0F8AS5AuW0+plU7bpxjyzjeMge3CRpc?=
 =?us-ascii?Q?fZWiqVouMhr55qvv5g7AYUE501QxijPDZ8HS4tZOiuBMbsM0xWL+Rat4Qlui?=
 =?us-ascii?Q?uxrCW9qUUCZLiRPTPkW5WWH6FpDiAZzXxyPdQ6Vk2X34fc0q2SHZ1L+tWWpl?=
 =?us-ascii?Q?NHB/oKRnVd0l9LQEh85R/VjTPz70sNxbgtXxhzQpwmy+ifNFg0E5JQM8kWKo?=
 =?us-ascii?Q?hmrM9UfGRl6Crd6n8awCpkAOqL6Zj9Bhh7NpFVFR88q5H5U+mEI/y9fAW5X/?=
 =?us-ascii?Q?w9XFpr1Y2+gqCIwjZzdEZSAeT1kXY4TpneKUIF8wYMyCqhbxCCBrcAmArQl6?=
 =?us-ascii?Q?AHh+m0wFr3nx4m77uw32fAt1g3Cio4xf1YxtlkNW6cmLNyzh99uwDcg/6qeO?=
 =?us-ascii?Q?wy9GcfwHY1oNQDjIOyqLKxcT4iHOhj1SGDo9eXtNbj6/h0PwFvqpGrtjLMvS?=
 =?us-ascii?Q?HStC/epZebAisH4UJ0G/aLj6UL7QBEimURa8FWM2XVxcFLjABKLCR9iTef7j?=
 =?us-ascii?Q?SPxtbp8OWTELhskijIu6SWs6gkksinAd90a5/FX3fkpEzkMwoWbJe17v4T+Y?=
 =?us-ascii?Q?K5rupQukXFCpZoLmqTeMBSSHnfEGazER39B+KbbMxm+E7KUpB0q7Wpf6xxbs?=
 =?us-ascii?Q?j3KsfGw8rNsM1VHD8mT8NIIHFNDdYICH53bo4v7U2CsKFydOEHOtuhYPoVNd?=
 =?us-ascii?Q?ygqwpmawW75Xm6f7uSBQyvhGpMYi4b7IdizFvgMbriTVC1JzmfLAN3wyHrJn?=
 =?us-ascii?Q?R75QOIyCsTWQxa0JPn+fetzj6JzfvyYtC2o/IA1gKysCVZddH9PO8YCMx5bD?=
 =?us-ascii?Q?0bQFMXpBYzNf/wIIq9vb7bLyK/g7O5N41a0xYSm4hfPSTBEQSAAL20v7mc9i?=
 =?us-ascii?Q?B8g3rWzqZEeye+vrNLoiQB1QRWOqGiJnWEgT5c/6Whsye+DEMbpogI0ijLHh?=
 =?us-ascii?Q?avuNPsqq3brtCUlUliGxYdaoXeZrjCT886r89qc8/obxnrbJDO0v1AEZMP6n?=
 =?us-ascii?Q?F/cIOQR8/aGa9eu/WgQ7YmoUs7b0Sq+l/cFaz3o1HyoUIMT6JNnRh7fLCyx5?=
 =?us-ascii?Q?F64LF0TpHYMzbuOpLNAeopvun1qyuI5BkKHHD4plvY5Qiy1bYo5jXYehBHS7?=
 =?us-ascii?Q?hu/P5cQaxiI6zwO/QEz8KmfffkDhFsRatJ7TFd0fiWN5h2322IwctBjoi/Ab?=
 =?us-ascii?Q?Q0dTtlu2dCTkYmEFXz3iv78Zrm3IIBPpDtNISd9aDYO2vYzupjxnpYcoa27N?=
 =?us-ascii?Q?XGQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8603.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0xDGJnc67iQWVSqbIhFIoWRklOM2c26WsCe9LJ+88SG3NM793Tkfj87IVh5d?=
 =?us-ascii?Q?GStdsufj8gj/t+Dwb9CG2M2TzPzpBIcP9gtP9agUZ9t9zI4HYL5eAdhJ/EXO?=
 =?us-ascii?Q?4hyF6pvCgfZiks264V+dJVmYwCTF4cKEkGFkayGGjIh1sw51zxSktiMBhjQn?=
 =?us-ascii?Q?z/iVH43vGoh0I+3xUy2XNQbs2Zw6IyYfP8gCkMLeUfBBMH+d6pkSD2qDfv4q?=
 =?us-ascii?Q?vXx6z2YO4x0nTER9q9UnkJwvLYl+CLISLJy5QqAAeU+ISfLxTjxIszZaVgt+?=
 =?us-ascii?Q?vlTO/t3jBFyo8chgTb74jP1FaJHUfpelUHBRIR4L+OgPMtVsn3E8zZjzFvru?=
 =?us-ascii?Q?O4QMuL05PxjGKnbx42GCdFmO3mX+hhwgznGKXfPYXupjrt1ZCyq+10TWjGsd?=
 =?us-ascii?Q?3iv2LienM/VleAfhIEKExHOeiRX0UTJEFU7lukRVpCRYWmK6GBWxNsI7Jo5v?=
 =?us-ascii?Q?hsxlwbofoxVvDjNLGZUwwbKFCe7igKQbEp3ySlDkicg+ina+5gUwAc38BmQO?=
 =?us-ascii?Q?+4BIkhFkdfE6fr/0FcUXwCpPA3IMwhM5W75gK3OX6pYJVmMWT/s2KYk8Q4nJ?=
 =?us-ascii?Q?0BIWM9KN3FNc4Khx8BXSdkUcOd+Rx9VdETFl/XvC9F/A2kOFtnultTD8K034?=
 =?us-ascii?Q?HikrQv3NIuVdkeWGTigUF+PT3jgcWvtCe8Ykwi+LUSw9cQkavtMXPBAHuVOX?=
 =?us-ascii?Q?UetTWJMdJiBG3ZxGuO+6ftvPrBu1EWkZaz19ynIGHtcN8UbOzgHjGDeSLqYP?=
 =?us-ascii?Q?hWyBFYZKvaVzm25VGW0O1DnF9BPkwYjTA1ng/a9bzKauHkIbfKuviWAxoh1g?=
 =?us-ascii?Q?OECPSiArOoNkcJQKOLwP9U1LxEJ1iGKH3M4DjM1NLzigRC8X058E3A9CosMM?=
 =?us-ascii?Q?CXDtwOqN772VZNpsi35gy9Tdmfg5nkuUtREHHB0BC5lsefmpsh2T7gvIDa/I?=
 =?us-ascii?Q?WTeYb4gs8+iiFVr18KCwXu1j0Yo/jRO6oIfGt6IGCTmIBeexqxBri8A0AXO8?=
 =?us-ascii?Q?t3Ge9FO/Ulth4ehwIUUTRaEH/1bOR7a7ZE7E0g6ozajXmrHlSq9HVU7N1TDW?=
 =?us-ascii?Q?19XWZt/5dc89/4CWGD7N79I77J3cl+4V4MjayeMPnqHNWKBsUTlEhAvr+xcJ?=
 =?us-ascii?Q?RcSeg7TcPDo9pVcjN4P3zTE2BJ8OqVKUXfk4qB+Bs1wqI36yiWxxBoPnYtbD?=
 =?us-ascii?Q?dfLAZ4fihu9HGiAS3MgtVS2MFcOxoryDfIVrvaf6LTsfqzgoDMkSdcJ+6Sif?=
 =?us-ascii?Q?KjkqYVGaUTMCjrOXaD9bfr1Z6rg3B4liVIe2whJlQPWjKU+eGfrs6ibCV9vY?=
 =?us-ascii?Q?6aNlSEYcHHf0Fgq9iLtwhWWddvZTZ4W7AJHLCzswuNxS4nlkJHGFp3i24Cz9?=
 =?us-ascii?Q?7ZuL+k2I+YJXEh9w0UdsmKxXgTEJ1qkuiEKgu5c7mTBcupmz6gMq5+e9+64r?=
 =?us-ascii?Q?ZMVipoqxI7OdnINN7ZBbwWEADvXfhY/DgcENazRiZT27/lcF48fpI7ceyGaD?=
 =?us-ascii?Q?gIoXb0HHZoFZmNmuknVlvHhbYWj0LIqQW4j0Dl7W7poU1GPNKErRWfwzBlme?=
 =?us-ascii?Q?y6r6nLo0dV+ueTpG57GkIVGhBCdnKQc6+qgPUirV7Cusz/cjEvRqYJ5qZiqp?=
 =?us-ascii?Q?BA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4943dc46-a66c-4b2d-bbdb-08dcbb5f1150
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2024 06:13:36.7442 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ez7BmLt0mAqphdPdfnTT9GqQgldBoFHzipBNG7ctADPmWIcebxBEqtm3L++30a+CU+vit2X1phac9PoorBxRNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7654
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

kernel test robot noticed "sysfs:cannot_create_duplicate_filename" on:

commit: 589686d5b8d589e30478cfb8db2e8e2cd54c20e9 ("[PATCH v3 1/5] workqueue: Split alloc_workqueue into internal function and lockdep init")
url: https://github.com/intel-lab-lkp/linux/commits/Matthew-Brost/workqueue-Split-alloc_workqueue-into-internal-function-and-lockdep-init/20240810-122131
base: https://git.kernel.org/cgit/linux/kernel/git/tj/wq.git for-next
patch link: https://lore.kernel.org/all/20240809222827.3211998-2-matthew.brost@intel.com/
patch subject: [PATCH v3 1/5] workqueue: Split alloc_workqueue into internal function and lockdep init

in testcase: boot

compiler: clang-18
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+----------------------------------------+------------+------------+
|                                        | 3b47e19ebc | 589686d5b8 |
+----------------------------------------+------------+------------+
| sysfs:cannot_create_duplicate_filename | 0          | 18         |
+----------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202408121610.d1cdf757-oliver.sang@intel.com


[  OK  ] Started User Login Management.
Starting LSB: Load kernel image with kexec...
[   11.888312][  T131] ata_piix 0000:00:01.1: version 2.13
[  OK  ] Started OpenBSD Secure Shell server.
[   11.890919][  T131] scsi host0: ata_piix
[   11.893885][  T131] sysfs: cannot create duplicate filename '/devices/virtual/workqueue/scsi_tmf_4945632'
[   11.895088][  T131] CPU: 0 UID: 0 PID: 131 Comm: systemd-udevd Not tainted 6.11.0-rc1-00010-g589686d5b8d5 #1
[   11.896222][  T131] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[   11.897360][  T131] Call Trace:
[   11.897806][  T131]  <TASK>
[ 11.898206][ T131] dump_stack_lvl (kbuild/src/consumer/lib/dump_stack.c:121) 
[ 11.898801][ T131] sysfs_create_dir_ns (kbuild/src/consumer/fs/sysfs/dir.c:32 kbuild/src/consumer/fs/sysfs/dir.c:63) 
[ 11.899453][ T131] kobject_add_internal (kbuild/src/consumer/lib/kobject.c:74 kbuild/src/consumer/lib/kobject.c:240) 
[ 11.900074][ T131] kobject_add (kbuild/src/consumer/lib/kobject.c:430) 


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240812/202408121610.d1cdf757-oliver.sang@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

