Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC378BE372
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 15:18:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD93910FD62;
	Tue,  7 May 2024 13:18:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZuAcA5gO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D319F10F4D4;
 Tue,  7 May 2024 13:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715087911; x=1746623911;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=hwnj8jnyJVtKDhqOTeiGC/yrkc42hiDToATMD95FYus=;
 b=ZuAcA5gOnZNurbq/ROoy9gbbOv0/F76Sv+lQ4zQVte0pCHxlmgE4y7WH
 kMaZi25s6m097JnZiBC/98Rdu5ZisEKjZR3hZHveR4G75OW5ssRyWWVdD
 lY8F8aAxaQsqCnH167pnC13H4oKqRKkL66jbGQFFN7zr+qyLLyi8lU6p+
 OUJM3yC6Y4QglMYtpOFDAcImNJzsibPIAC7TwLrV1hJbxbzvnZS64W16A
 ME8NFerhkIcTr8NjGw3iNkjEgAA//kmrmn6ScN5j9aTMTGKSklMvb71zx
 jjxV8AMZCa9aZBEqae0n963O536EoG3pVv55wrto+MkjbywXnKwES19ST A==;
X-CSE-ConnectionGUID: ixZcV+fKQLeIil6/pByRug==
X-CSE-MsgGUID: 8U5k96/cQaKtA91w40/GSQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="11409191"
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; d="scan'208";a="11409191"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 06:18:30 -0700
X-CSE-ConnectionGUID: MQBe9l2UTXCrUvNbcv+fDQ==
X-CSE-MsgGUID: frhehqRCQ8GoqMtHkAcoHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; d="scan'208";a="51722482"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 May 2024 06:18:30 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 7 May 2024 06:18:29 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 7 May 2024 06:18:29 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 7 May 2024 06:18:29 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 7 May 2024 06:18:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eFLD0bVJ3c+wooDskCbizBo2CqKabxqsHsJH2sLcK9hYxsHuh3rAukR96Y27ilwRf53R+ZXsVi84Nb6BqJY4jCgh/bDXYfnAJSUae9QMsP1h1ywhk5yje04r+1dylIGV4TwN3EqvNIJmVZKUREXDQGii+/Ma/z2Xg/qn55bpOvNNTl+DH/2MhA3wWgb0RwK7DfmSuql70fSpTWosid3ntxwuv86wy8oG+ganyq9URbvNyXKJt/joCFP9NZFIgEL/XGY2bD5QD3FFamCT0QEc/Jvypulu5cwMbDuUhjgI5h72S/k8tQzxs1cw9cW/nRwG7oh5gv9g+88fdoCe2I9bHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oNyLt//+npPNj5DShG/eJcyd3ZJBa0vTnLY+1u5fOvE=;
 b=XxTgFSXN0Xb0DcPbAkIOIWNsl0q1x8goI6ERFJ0iwHAcPXwsBhi0Is8z/4k5Y5B6OLfw/qlT427/xK31yT5FhOtfDrOF2D4bkCNUIw4KH5igordAtAOpJjXOi8MeYSGKx5ObXxPTbNfxqSA6EDGPKDDAIQljbcqor3EPpEQ4hriB3ngn+S8RjLD7p/DfvxeVI7/4AiOLlsH2mibVWGLlpoP2M3nYngAZgUkezTKtINPCFSdWsGJ+HuOcTcNnHDr1hgxeJ2HpSe+78ZF1iCT+c9r/gj6vVavUCCAyw9V06oVI16dhPueRS+9ddd/0TjvlzP+13sZX21xSn0o0t6+ywA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH3PR11MB8435.namprd11.prod.outlook.com (2603:10b6:610:169::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Tue, 7 May
 2024 13:18:22 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.7544.041; Tue, 7 May 2024
 13:18:22 +0000
Date: Tue, 7 May 2024 08:18:18 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Nirmoy Das <nirmoy.das@linux.intel.com>
CC: Shuicheng Lin <shuicheng.lin@intel.com>, <intel-xe@lists.freedesktop.org>, 
 Matthew Brost <matthew.brost@intel.com>, Thomas Hellstrom
 <thomas.hellstrom@intel.com>, <dri-devel@lists.freedesktop.org>, Christian
 =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: [PATCH] drm/xe: Fix UBSAN shift-out-of-bounds failure
Message-ID: <fs2aq6wgrsoilkk4spw7fbmvxnbovn555qbney6aqwetflvg75@q4zsc2l2v64s>
References: <20240507080456.613786-1-shuicheng.lin@intel.com>
 <2a9a7bb2-c74d-44fb-b9d2-cbb42e462d0f@linux.intel.com>
 <96b6a562-eeaf-49f9-9ade-d58fb061086d@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <96b6a562-eeaf-49f9-9ade-d58fb061086d@linux.intel.com>
X-ClientProxiedBy: MW4PR03CA0068.namprd03.prod.outlook.com
 (2603:10b6:303:b6::13) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH3PR11MB8435:EE_
X-MS-Office365-Filtering-Correlation-Id: 10ace2d5-62eb-467f-79c6-08dc6e982b20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qjbuWwPOfeqUG8xUQiNsU9rFf5FvWjHAOWElC3OyQ6utLY8kupnpusgMSV5v?=
 =?us-ascii?Q?Bzcj2K43IeI9XW6Y7Y2hU5OwgFtgnTp3Xhn8ZzLHvUrfts5h6brBUIf8V7gm?=
 =?us-ascii?Q?NWNsCe5O4UflXhK9CWRYDuwjwhfktL9IpZDgarByu/NBA++QeFex2c/puTyo?=
 =?us-ascii?Q?5Ik997xusN11uRJTxtqjjC+Vo6IytfLHw2Ix5qg+EQjjPP7aepY3BJA5sYpb?=
 =?us-ascii?Q?YBJpmTbRJCUx/BEMTmBP360tPJYGzcld/gqIJNv9kE4c5D/83eUC50X+81gc?=
 =?us-ascii?Q?KXD9QhXaqbPqCaKO3xFRSabHC98E2Fz2bhfH4WQKxdhA8tZBCH+dvp9BzQL8?=
 =?us-ascii?Q?mhfP+oh5aZInMqKgxfukxFuvBaw9huzVM4vllVs+QWObg4DzqXKDZnygQ6fE?=
 =?us-ascii?Q?CEXKTTlA+V048jX6en4KN1nuhR0tgLAaE6qM156kSOUsDuDMHaXEPbvhWMUH?=
 =?us-ascii?Q?5ks013aZTFouw/D1F8UktuTTjYCoy8MqMydxMfjeuR2NC2W2OpkPVJ+Gt7zf?=
 =?us-ascii?Q?mcf5iK1f120Xinbd+PiMSGHDig70fgYh6L7LS8AS+xjLkjyZBPukT2P2GPRD?=
 =?us-ascii?Q?Wod8MzSe2lgn1jzJ665keZl/SaE/YxVlK7ZYXhCIUo+E+joIs4PkYdQIymfd?=
 =?us-ascii?Q?XURKJTBPPzpUWVZawNegmLZsgW10bvC6fgMtRGxSNEDbMoATx6DLSkPndj4l?=
 =?us-ascii?Q?nl9PZOmjlwuVw7VHEayTGWP/Iwi7mpmwVyHl1XRD59beJFl3APjEE+EAlZdz?=
 =?us-ascii?Q?7GnBWsPSJJTGSDxbpoNGOZR0qkff9jXxq04xpRHmezj9ORun+ptVFbWGWd5f?=
 =?us-ascii?Q?Cs9olUG4whkfAxIH3sFdgil7ueayHBchdb/i7seSCHPw43EMudcyzvkaSoFR?=
 =?us-ascii?Q?80Vb7D8KTzUKTch6OuMhmgcpwowx1lbSnfh6BADGrBJoHWlZ75jHmRHw931z?=
 =?us-ascii?Q?8IsbxUTWuktePMxZ47O4ej7FB4riKSkYPykVzmsUjxut6kn//Y7Ybf+7UPyf?=
 =?us-ascii?Q?BF9bsnFigsMGZk1//u2WZtmZ/eiCr88/WqskyykNc2mF8JHS3c3Sl8y4opZS?=
 =?us-ascii?Q?kt9eWB7GTSelxs63jEHK9WbAqB4q49KnDZQsvlcH2E8ssdnccitn+FlO6IJo?=
 =?us-ascii?Q?zEPp0au9UUdB96g9BG5NKcxzq7XOjIvX3EjcMcZShfqr09PLcSIKiOr8o4WS?=
 =?us-ascii?Q?w7bH03lPRajkaFLVjxq5jLb8aIGoCuMvHRfCvEzNEFzcjRsHT5L0sxjcOUo?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?T8cu9UQ1BNJ5kxNNPg9zydaaM/LyxJ9oV+kD+/TtLuNS3R6k24aGkK8U2oF5?=
 =?us-ascii?Q?jvSAv9jip15bHQKL3F6AkVIRuB35IDbXEpEHVhy6LHEDs59HLLqfh81HseDC?=
 =?us-ascii?Q?ZYxCTHQaT9gQ1M/gOF+VgRd01ZeZgTk1nWjeBDc3QVxUMAg5G9tIfPf3ovNi?=
 =?us-ascii?Q?gyKBxmlnIZ99W78LIKzPI9aLJAwo/EUAPY1jWAFdkcep2nsCFs8XpX7pT6/r?=
 =?us-ascii?Q?rgxxONN5RXMwoTLJ9sYIJNFc49xy3NQsz6kJ4zwsOM6zXOGW58LwlRjjF+uN?=
 =?us-ascii?Q?qMYOQqimQ244KR2+Qd10QZ/u7cO2Dc1aTJ3Yw0q+NrNqItMz5pFAcirLbMc2?=
 =?us-ascii?Q?p8pMTcRjIzVA1KpLQZLunkmldgaHocr5FqnvqYitbg9cnPlp16NuRUvDP9Uv?=
 =?us-ascii?Q?2EE7hKIV3nw5/jVuCntkkV2LlH3pjCa5guAjoWeip2GveJddZKUWtO/RHb+y?=
 =?us-ascii?Q?8+c5ny2hdLsp8OZyJR+9ktBk3zRkoKtXzyqM9ZZrmYuY7+j75rqF7sjpxZB7?=
 =?us-ascii?Q?UQKkP0UvTE5gQY4HBjQSyYvej81PMG6fYvbZDlVtsaPBSbMWFq+LiN24Sqh9?=
 =?us-ascii?Q?JoCLhhjLxQ2t4aetzycQ+pHVNJtASwYZqVB9SZXSzTY9u3K8eTvHXBzYmRHh?=
 =?us-ascii?Q?ZmE8R5d7aFSJ8M2F3uHPbkhm5DZ+ciEdkGJC00cbUgWqj4GnWmfmtX0TWRBW?=
 =?us-ascii?Q?/uN3zSuGB/NRpOYWVUZye3p+Sx3JWi4WcH0ANKJR0n+U6JNUnusA2G5e4Soi?=
 =?us-ascii?Q?SgvhDPA9FRIQJDxEFvglWTGexjcBr1LNfBO1fvy68OnrXMZDS4qCXSHuR5OG?=
 =?us-ascii?Q?aCUsXGgIxi9wPhAWGDqsuNSDdDXaHKSETvjCogcb9qQMQuBCVXl6IahuTStj?=
 =?us-ascii?Q?CB9uKRRVIFgfPV8g4pIyW+y5e9njWmFxfPXrgllPeOqPhLLHtNJ/cCx7fOHT?=
 =?us-ascii?Q?ZXJWxUhAFCwQzD3UvFdN7kI7XfT+bkSqOZOsipu8alZIQypDVUgAZZHUFbkC?=
 =?us-ascii?Q?rL4vGgpuouJU4J99T2A4DmkUqUvR2Un0+V1DdlyM2Dnb0RQGMS8lI2OAt7f4?=
 =?us-ascii?Q?zt6gG8BsTNYDyHQ8+NBd/TyIGk2TZunVROQXgDB4AW6rhBLpG+FI3tIN/soU?=
 =?us-ascii?Q?dGk6J9PPYUubRlUnGG2ofKUFKbul9fXBrSJe9sNyesunwIV8p160EGyBk4T+?=
 =?us-ascii?Q?wR66A0Ccarpw56CJKFtGUF4BAtv26MvPKvbYl7vfgp8DcgriN6XEJOTFwbZ2?=
 =?us-ascii?Q?Q3rBib5QT1UX6fpCExDzLvUBWCIPeWqMs6F6INUQQynn1OSp0CmGQXGm/Ui1?=
 =?us-ascii?Q?YkuTQvOgdcCWd6Z+n7pXyjLBTmSys6du0OdORc7szd5BN5CSYxPmK9UEhiow?=
 =?us-ascii?Q?Dg2YFAmluBamou7F+mpwm5pXKmlvtcdIzUm7K49Cs9ZWqp/Ii6K+JUT7tYi4?=
 =?us-ascii?Q?/JrkmtOOuOFFNuhn6sy01KfnCd0meiduc7YyDDxFDsM38SrY4hbtPb4w5n4F?=
 =?us-ascii?Q?EGecmOWog4JuufKfnH8xaZty4n3i0fbWD7Lwt+TuFJE4HemITsrTcNA8uq+T?=
 =?us-ascii?Q?6vguvBmmz9icemRWL0E5Z1Vn3bbwLRocls4m+Nl5W/4779snj0Me+Hygt2E0?=
 =?us-ascii?Q?BA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 10ace2d5-62eb-467f-79c6-08dc6e982b20
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2024 13:18:22.0049 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +Cjtc3OgAmpFSVml4UWZ5ju5zpsPUQZ8Rq8dMM0zNltmUaPbRcxsDKUe5aRoCa9imRpfJpKUD8tPkK0WHlKPEkcbs4a/rLK1VQtelnMEeNw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8435
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


+Thomas, +Christian, +dri-devel

On Tue, May 07, 2024 at 11:42:46AM GMT, Nirmoy Das wrote:
>
>On 5/7/2024 11:39 AM, Nirmoy Das wrote:
>>
>>
>>On 5/7/2024 10:04 AM, Shuicheng Lin wrote:
>>>Here is the failure stack:
>>>[   12.988209] ------------[ cut here ]------------
>>>[   12.988216] UBSAN: shift-out-of-bounds in ./include/linux/log2.h:57:13
>>>[   12.988232] shift exponent 64 is too large for 64-bit type 'long unsigned int'
>>>[   12.988235] CPU: 4 PID: 1310 Comm: gnome-shell Tainted: G     U             6.9.0-rc6+prerelease1158+ #19
>>>[   12.988237] Hardware name: Intel Corporation Raptor Lake Client Platform/RPL-S ADP-S DDR5 UDIMM CRB, BIOS RPLSFWI1.R00.3301.A02.2208050712 08/05/2022
>>>[   12.988239] Call Trace:
>>>[   12.988240]  <TASK>
>>>[   12.988242]  dump_stack_lvl+0xd7/0xf0
>>>[   12.988248]  dump_stack+0x10/0x20
>>>[   12.988250]  ubsan_epilogue+0x9/0x40
>>>[   12.988253]  __ubsan_handle_shift_out_of_bounds+0x10e/0x170
>>>[   12.988260]  dma_resv_reserve_fences.cold+0x2b/0x48
>>>[   12.988262]  ? ww_mutex_lock_interruptible+0x3c/0x110
>>>[   12.988267]  drm_exec_prepare_obj+0x45/0x60 [drm_exec]
>>>[   12.988271]  ? vm_bind_ioctl_ops_execute+0x5b/0x740 [xe]
>>>[   12.988345]  vm_bind_ioctl_ops_execute+0x78/0x740 [xe]
>>>
>>>It is caused by the value 0 of parameter num_fences in function drm_exec_prepare_obj.
>>>And lead to in function __rounddown_pow_of_two, "0 - 1" causes the shift-out-of-bounds.
>>>For the num_fences, it should be 1 at least.
>>>
>>>Cc: Matthew Brost<matthew.brost@intel.com>
>>>Signed-off-by: Shuicheng Lin<shuicheng.lin@intel.com>
>>>---
>>>  drivers/gpu/drm/xe/xe_vm.c | 4 ++--
>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>>diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>>>index d17192c8b7de..96cb4d9762a3 100644
>>>--- a/drivers/gpu/drm/xe/xe_vm.c
>>>+++ b/drivers/gpu/drm/xe/xe_vm.c
>>>@@ -2692,7 +2692,7 @@ static int vma_lock_and_validate(struct drm_exec *exec, struct xe_vma *vma,
>>>  	if (bo) {
>>>  		if (!bo->vm)
>>>-			err = drm_exec_prepare_obj(exec, &bo->ttm.base, 0);
>>>+			err = drm_exec_prepare_obj(exec, &bo->ttm.base, 1);
>>
>>This needs to be fixed in drm_exec_prepare_obj() by checking 
>>num_fences and not calling dma_resv_reserve_fences()
>>
>or just call drm_exec_lock_obj() here. ref: 
>https://patchwork.freedesktop.org/patch/577487/

we are hit again by this. Couldn't we change drm_exec_prepare_obj() to
check num_fences and if is 0 just fallback to just do
drm_exec_lock_obj() as  "the least amount of work needed in this case"?

Something like this:

| diff --git a/drivers/gpu/drm/drm_exec.c b/drivers/gpu/drm/drm_exec.c
| index 2da094bdf8a4..68b5f6210b09 100644
| --- a/drivers/gpu/drm/drm_exec.c
| +++ b/drivers/gpu/drm/drm_exec.c
| @@ -296,10 +296,12 @@ int drm_exec_prepare_obj(struct drm_exec *exec, struct drm_gem_object *obj,
|  	if (ret)
|  		return ret;
|  
| -	ret = dma_resv_reserve_fences(obj->resv, num_fences);
| -	if (ret) {
| -		drm_exec_unlock_obj(exec, obj);
| -		return ret;
| +	if (num_fences) {
| +		ret = dma_resv_reserve_fences(obj->resv, num_fences);
| +		if (ret) {
| +			drm_exec_unlock_obj(exec, obj);
| +			return ret;
| +		}
|  	}
|  
|  	return 0;

thanks
Lucas De Marchi

>
>Nirmoy
>
>>
>>Regards,
>>
>>Nirmoy
>>
>>>  		if (!err && validate)
>>>  			err = xe_bo_validate(bo, xe_vma_vm(vma), true);
>>>  	}
>>>@@ -2777,7 +2777,7 @@ static int vm_bind_ioctl_ops_lock_and_prep(struct drm_exec *exec,
>>>  	struct xe_vma_op *op;
>>>  	int err;
>>>-	err = drm_exec_prepare_obj(exec, xe_vm_obj(vm), 0);
>>>+	err = drm_exec_prepare_obj(exec, xe_vm_obj(vm), 1);
>>>  	if (err)
>>>  		return err;
