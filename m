Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C9AC6BB31
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 22:17:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F099510E1FC;
	Tue, 18 Nov 2025 21:17:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OEsdjZFN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8413D10E1FC;
 Tue, 18 Nov 2025 21:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763500650; x=1795036650;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=lWzBCrUhhaFr+IF2S6TJXssddp2UEJwUJb4qMcgWIyQ=;
 b=OEsdjZFNzuf+AnAgzxe3RePN8xoS/kHvoTy2sicTA3julHesjjWVjHFb
 zAsbSLrZMAxSSodFvdDquWMYXV9DtpgEKIdphYjzHd+eorvqmyyRNUoFa
 pvnPcd9aMyxcZdusq2pT7Ew+0VRJaqgfLwn99KxP1Yo6Gz1R8dRBN+zkJ
 651w2g8LQfEzJ0G/7uxT9x4bE0zI1nZBi8ibiRLsP94Caf8VMtjXS7Ald
 F5VCCAiHd0TmPROmdeSwsfUwwKbIB9yiwa7G1C+ydHk+yAFK80xZT9Dl0
 UU4CFmCKSHibcL7VysiGRHQCklSCSoYPGM/u+CpdRDYmR7sClv3zhu3K6 g==;
X-CSE-ConnectionGUID: rwnAoAOZSSCyH9JPw57zVg==
X-CSE-MsgGUID: TnjNpKmZTNaOLEcYzHpEzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="53106542"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="53106542"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 13:17:29 -0800
X-CSE-ConnectionGUID: nQPvFssyRfWABqAXWGb7eA==
X-CSE-MsgGUID: h8PvHRRFT92wmITOXcxU8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="191004863"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 13:17:29 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 13:17:28 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 18 Nov 2025 13:17:28 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.41) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 13:17:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PdGEd4jtYbBHY/KBA9sjUbMmhJw1Fw0QZUOjt4PNJlPjchnoBpskgrkXqGsTdUe/SwEJlTTO3n7Rbv99kgHtlPewDUKFPo05oJ7UnvVBWwB2d3GpRSGoW+FGsQQLNY+MKa1Lq1fqn2ZoT+Y6W3Wor2RUu1oIXs+KSWi4w/kTwP3dgTOfqltspfUdHHpLE8iqLKaQ0+uxhEXb6q6mRr54ccxA2sNjrIRFNHaSOKl5RUHBM72vzhEGNUw4ze7nqNkjCFMDUrMYqIsWHnzXxKqanSQOHhb5F6XZMxFH081JXOrhpWxEgK1TP7+KiMr1ozINXHZvSfLCJoABypDjK0U4Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s52DVrdgxMPV4Vgmw0C7FbMWoCWU/ZgS6r9G931u41c=;
 b=LucVh8Z9YV5npZF9UYOSrEpDqV14RWNKTmJwtzLa9oLApLjdjsYHPY/c2JndeF1BajQMsSoSovecyATqcZ8kYjAioP4FKx3OC+hRIJvTezesbsRYhFNrPCZgWAWYhPARvp655DiQBasvhv4pEVyhXJPJ0bvvf4l2bzfb8DBbBtaK/rYCbcPvRKagDLxKeTegBE8Cf3ZarvMwQEuX2rIW2kaEKEm/NxenjjYcKcWIThmsGNisWnBgRImCb/fWzq9tUZkHbEehvm9JgXhqAcWRCNnR6cu6pz/XSfgznsoMsa4TXv6Q4wtPITYirww5H4tKlx2rQu3160WYluShnePXWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by PH3PPFF8B8D6872.namprd11.prod.outlook.com (2603:10b6:518:1::d61)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Tue, 18 Nov
 2025 21:17:26 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%3]) with mapi id 15.20.9320.021; Tue, 18 Nov 2025
 21:17:26 +0000
Date: Tue, 18 Nov 2025 13:17:22 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <christian.koenig@amd.com>, <pstanner@redhat.com>, <dakr@kernel.org>
Subject: Re: [PATCH v3 4/7] drm/xe: Stop abusing DRM scheduler internals
Message-ID: <aRziYhQ4ZWI6zVE6@nvishwa1-desk>
References: <20251016204826.284077-1-matthew.brost@intel.com>
 <20251016204826.284077-5-matthew.brost@intel.com>
 <aRwUrtpXAHi547AS@nvishwa1-desk>
 <aRy0BEOpxjFjJvbC@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <aRy0BEOpxjFjJvbC@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: SJ0PR03CA0082.namprd03.prod.outlook.com
 (2603:10b6:a03:331::27) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|PH3PPFF8B8D6872:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cdcb681-4d5c-446a-0d5f-08de26e7df4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wksbDwLB+/JA4y5H01YvIZejycruWqhcc2MIKVKCDZM/wNnc6gk4bQqD3fuf?=
 =?us-ascii?Q?/c6orHRAZey4yLTuqMeA/habSl53szfB+n1CSlLfIurtTh0Fwc0wS2Tmp3hS?=
 =?us-ascii?Q?ngOZ1zPsD0hoY1sPukezBX7USdQlg18Cw+xSuJerosXXkZCqq8HHdoEhG+bA?=
 =?us-ascii?Q?DycoVBYZw9ONV5kKLhYeaSPySzy28A8I8Z3FR4Gk6fXYBx5osonX9dIi7AGl?=
 =?us-ascii?Q?xVoMJ5um3FhpljF8JZRFqYD+DzeApFnxKNvMIswhllF8xLxPzv08SSHzt1YS?=
 =?us-ascii?Q?3k8FoC6BCrV4OCLX5jiRaet3+2yPSBO1OO8TGkf0VDDRXfyJ1NvbMLvtZX1N?=
 =?us-ascii?Q?3Yac1NXI37AvX2Fe2C0jBx6s3T+tbtaYQsMskmDI8exhKCJTlbkLIIVUiIlZ?=
 =?us-ascii?Q?PSWH23OS1V1POX5rxK27RRAcP42tAVUec+6LG2WxwnrvbE/QkPeNKK8/KMZK?=
 =?us-ascii?Q?mOLPEs1UC0Aw46/JqN3D9h0f+B2rlLvCvx9ug+pQEZYC4jJQ4eW9odvgCVU/?=
 =?us-ascii?Q?F5r+Dq7H63awoztIHGF0oST4+Y9Yvq0E87gV1XmCsmi5z8f7QbgrAocBSMtX?=
 =?us-ascii?Q?Mb/w/JP//ODlvFwUrV+YGjR3GW5oZPzMsIIykAFXPKLZBB36wgTdXxE/pQhb?=
 =?us-ascii?Q?KqIGLBDO9yVs7y/VxbJH5J8/hPcWSZ6doC3HcMqSlN9dVBrdrYjytfUBDmiE?=
 =?us-ascii?Q?7gRgapmchJJdhcfE0Va63lavozQJxoNtABfFHH8yee3QbyhWuYvL8pgcziaE?=
 =?us-ascii?Q?mJo/QZ3TC9IGtAarCUxwtKlGsg6rR4kneM4FVkj6KoVENZOW2JmvgKQGu6Ko?=
 =?us-ascii?Q?01W14clcss8RJ/MWsY73+btlWaX/7+jG7Zbel8Q7Yu7QMdMRwpdH63C7nxXz?=
 =?us-ascii?Q?vombJuiGj80ZH4M9Dh1JHgWWuGw+usgwC0noB8loChP4ymlWqhlShnyQO1gI?=
 =?us-ascii?Q?kB1BTjPv1NV20qo+rltATLHsXT1QvdxoMR6PsjzytYSB0XPz/l9FE6qDwSRD?=
 =?us-ascii?Q?XI4D5EjFVglTRaEZ+FEmJHVVRvPzew4RM8fgyqG6l9ITji8lHuaROmnKUwDA?=
 =?us-ascii?Q?vqwC/VFPNrK8n7u4fgxJErFT+BJ0IFdcDkCB1f3yWwXj0KbFA5oMB52U0d3X?=
 =?us-ascii?Q?HrLljNIWp+mlAFUPyjuv/ilXQVEZOEoQv2z9bm1vBZxbAcdOI1aBlGvlgQEO?=
 =?us-ascii?Q?l4yFJPQlCT72b6zrNP0M3D/kc7OMtlB+doUajZWCX8TzXqNLythshU+MAdpn?=
 =?us-ascii?Q?t+pW5mcubZQ5sR6w3lT5TwgGkq67+QK4+b00b0c4NRh6pvxfMMiO3wq11IbI?=
 =?us-ascii?Q?fYkec/L1m1+gB46uv6iQiFLL+fq18TUURZtegAJEuQXOFDy8n6R/g25wx1Ii?=
 =?us-ascii?Q?VCfDp3VT55VmB4Bice7GhBwC/erRD4/YkKJHPZqa0iB/Sha1y/aMD8cXO2sO?=
 =?us-ascii?Q?FgW8sll1mHqdxIN+dxGCIlDDIqULedlV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UTxt604ofYXqMj3LXmz8VFL3zOwk72nI65nqJZBQWbCmsK4wGIlS2IC5Qjjl?=
 =?us-ascii?Q?uU2UTD3tlpQVE8BVe/bAVR+RR/qy/l/bOx9pQAFrezn9gOXhSl5USuQPgvlX?=
 =?us-ascii?Q?9Gvm/e/OYJLZc/LyQmlF7nAzTVveFEN2NA+/MSW7+SZyF5vjutvK85/K+zDp?=
 =?us-ascii?Q?v5N0PDfdrLR6Gd5cna992AE37gI+zWlNL6NEQtrPSv6Y/vDAd1yShzp+lvgk?=
 =?us-ascii?Q?5TeclUr0eFIC5pnKWJG708smxjz05S6P0SSdCniPMv9btwU+XB62FG13Lza5?=
 =?us-ascii?Q?pnhVyfKLXNVNCEHMlX1s1/VnpSe7TKxOblWNCVpDSiOdIdjvUdChwh2M3/uK?=
 =?us-ascii?Q?w1mQBaSjwR/ew+LAwSiz8E2j5V9XBT7+Uyk/2nlU0men3zwATkE/wuaSzdY4?=
 =?us-ascii?Q?SEZIuKD5X+VdpaPJtUgKpcG0EHSc7SFjqTu8lq2bfU3deNu5f8CpJgDQj/fs?=
 =?us-ascii?Q?LMv2gMvT6C7wxkUqn0JS2CNv5hDuStA3jwJ7nuiVgerx8etO6DkomB+EnVpB?=
 =?us-ascii?Q?f6loFTitUf82BJhw1ni4B7JQF4BTmN0WLrel6Fq+1QEX4a90zKV2G+2qvpiX?=
 =?us-ascii?Q?ojhOP+5Zwh2zjHjNjZwHyRpDwWLsZHnRxS974+KeFcJpyUF3XjWM7dl1++Qw?=
 =?us-ascii?Q?h4G1YntVpxdbwYWlMglSrljMsA9iVRYWvRjeo80zstQGFNXQ4vzTen1mdv9f?=
 =?us-ascii?Q?SVgqzMzMmEjyPwUPzpp6LcHrjHn7CXrvJSZvmPo09/ZUBN+RNbM53Auyh/Mb?=
 =?us-ascii?Q?ymQqPHZb6e6SqbFsu2D8GuoNQ/sIICpZlc6IE8fDHfPEVm4fex83ilgxqI5+?=
 =?us-ascii?Q?Fmib/g6fbsjZx5dx+sGfQUG4mwWXdr2rLSmqj0NMguPOMKnoG936lckbDFns?=
 =?us-ascii?Q?NUcmHJoJ5fUeVdEwLm+/7RO/xdEvGaRML1cIEhT6c4aUK1vTICgEF8K5zlwH?=
 =?us-ascii?Q?8vZNaPKq10s2QLNFUd8+LAbP5gPp3jNi8pUJZBb9iCLpE3jemRyP6NRdTztV?=
 =?us-ascii?Q?aF9a0vL22jkn/eaiDEPmKchIzrjPtI9gg7SCZs7voK9n7NTQejYhPGe/18Uq?=
 =?us-ascii?Q?6DHMz6WVnAls53fitFe4N4qUils01cVR8y1qIABQH2LNGwkStkNR44mJXzOy?=
 =?us-ascii?Q?OkC40b37TdFV1fN2QzAXKQFV3iXdXDap+OEvV3TpC5IE8KtU4tkp3Y7GLFEX?=
 =?us-ascii?Q?ptkkFDH+ks0KMSsI4y5W9DcXhOz4dvLmy++grWG9C7DO5OwSrhQXyX9CtsC9?=
 =?us-ascii?Q?BWlsoriMk51czHhgCvzAZd9mGHzvrEJaP3jNi2IYOWVZiDj/nY4r9eXrIiM/?=
 =?us-ascii?Q?OOys8w99HbAOuT54+CHQzr1lZI9LIduYhgt3ItCNfGs/+KIzO3GMFRv/Qr3S?=
 =?us-ascii?Q?Ipt2bWcKJtAdstJM8/Gy4UIYY0v+fzcyyZn++d8RZcyYEFTWXjCJcUGKZwtK?=
 =?us-ascii?Q?ZsxGLEvaPuEAxgIM7cOFiZ19IQcDQLANhux3RrujCug2ftO6/6ugCInLooSP?=
 =?us-ascii?Q?LYS7Mwpb13+uiCiJznMO706pB6VzYLZG6R2WZKzpcHwO0vvR4dXk2aHXaSfu?=
 =?us-ascii?Q?JlaGtWf1B1c8g8fOwXbaAjcuAOnHE0BcET/CWmYUhOjKTiS0VD12kUAm5YBv?=
 =?us-ascii?Q?KZFTXbUCtqjJ+x6Ynu1vbPU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cdcb681-4d5c-446a-0d5f-08de26e7df4b
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 21:17:26.0523 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bNhmrV8p9Fyigss0fS8D+s/YtLTFw+FpXLAcud7qaImtZDI4mi/lScnEFeeSxCmUprmc4iiT3NPfxNSVT9CatorjhQiGS4D/jaLZwyQuvzVWNM82ikn8WLblHIXGy+sx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFF8B8D6872
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

On Tue, Nov 18, 2025 at 09:59:32AM -0800, Matthew Brost wrote:
>On Mon, Nov 17, 2025 at 10:39:42PM -0800, Niranjana Vishwanathapura wrote:
>> On Thu, Oct 16, 2025 at 01:48:23PM -0700, Matthew Brost wrote:
>> > Use new pending job list iterator and new helper functions in Xe to
>> > avoid reaching into DRM scheduler internals.
>> >
>> > Part of this change involves removing pending jobs debug information
>> > from debugfs and devcoredump. As agreed, the pending job list should
>> > only be accessed when the scheduler is stopped. However, it's not
>> > straightforward to determine whether the scheduler is stopped from the
>> > shared debugfs/devcoredump code path. Additionally, the pending job list
>> > provides little useful information, as pending jobs can be inferred from
>> > seqnos and ring head/tail positions. Therefore, this debug information
>> > is being removed.
>> >
>> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>> > ---
>> > drivers/gpu/drm/xe/xe_gpu_scheduler.c    |  4 +-
>> > drivers/gpu/drm/xe/xe_gpu_scheduler.h    | 34 +++--------
>> > drivers/gpu/drm/xe/xe_guc_submit.c       | 74 ++++--------------------
>> > drivers/gpu/drm/xe/xe_guc_submit_types.h | 11 ----
>> > drivers/gpu/drm/xe/xe_hw_fence.c         | 16 -----
>> > drivers/gpu/drm/xe/xe_hw_fence.h         |  2 -
>> > 6 files changed, 20 insertions(+), 121 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.c b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
>> > index f4f23317191f..9c8004d5dd91 100644
>> > --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.c
>> > +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
>> > @@ -7,7 +7,7 @@
>> >
>> > static void xe_sched_process_msg_queue(struct xe_gpu_scheduler *sched)
>> > {
>> > -	if (!READ_ONCE(sched->base.pause_submit))
>> > +	if (!drm_sched_is_stopped(&sched->base))
>> > 		queue_work(sched->base.submit_wq, &sched->work_process_msg);
>> > }
>> >
>> > @@ -43,7 +43,7 @@ static void xe_sched_process_msg_work(struct work_struct *w)
>> > 		container_of(w, struct xe_gpu_scheduler, work_process_msg);
>> > 	struct xe_sched_msg *msg;
>> >
>> > -	if (READ_ONCE(sched->base.pause_submit))
>> > +	if (drm_sched_is_stopped(&sched->base))
>> > 		return;
>> >
>> > 	msg = xe_sched_get_msg(sched);
>> > diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.h b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
>> > index b971b6b69419..583372a78140 100644
>> > --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.h
>> > +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
>> > @@ -55,14 +55,10 @@ static inline void xe_sched_resubmit_jobs(struct xe_gpu_scheduler *sched)
>> > {
>> > 	struct drm_sched_job *s_job;
>> >
>> > -	list_for_each_entry(s_job, &sched->base.pending_list, list) {
>> > -		struct drm_sched_fence *s_fence = s_job->s_fence;
>> > -		struct dma_fence *hw_fence = s_fence->parent;
>> > -
>> > +	drm_sched_for_each_pending_job(s_job, &sched->base, NULL)
>> > 		if (to_xe_sched_job(s_job)->skip_emit ||
>> > -		    (hw_fence && !dma_fence_is_signaled(hw_fence)))
>> > +		    !drm_sched_job_is_signaled(s_job))
>> > 			sched->base.ops->run_job(s_job);
>> > -	}
>> > }
>> >
>> > static inline bool
>> > @@ -71,14 +67,6 @@ xe_sched_invalidate_job(struct xe_sched_job *job, int threshold)
>> > 	return drm_sched_invalidate_job(&job->drm, threshold);
>> > }
>> >
>> > -static inline void xe_sched_add_pending_job(struct xe_gpu_scheduler *sched,
>> > -					    struct xe_sched_job *job)
>> > -{
>> > -	spin_lock(&sched->base.job_list_lock);
>> > -	list_add(&job->drm.list, &sched->base.pending_list);
>> > -	spin_unlock(&sched->base.job_list_lock);
>> > -}
>> > -
>> > /**
>> >  * xe_sched_first_pending_job() - Find first pending job which is unsignaled
>> >  * @sched: Xe GPU scheduler
>> > @@ -88,21 +76,13 @@ static inline void xe_sched_add_pending_job(struct xe_gpu_scheduler *sched,
>> > static inline
>> > struct xe_sched_job *xe_sched_first_pending_job(struct xe_gpu_scheduler *sched)
>> > {
>> > -	struct xe_sched_job *job, *r_job = NULL;
>> > -
>> > -	spin_lock(&sched->base.job_list_lock);
>> > -	list_for_each_entry(job, &sched->base.pending_list, drm.list) {
>> > -		struct drm_sched_fence *s_fence = job->drm.s_fence;
>> > -		struct dma_fence *hw_fence = s_fence->parent;
>> > +	struct drm_sched_job *job;
>> >
>> > -		if (hw_fence && !dma_fence_is_signaled(hw_fence)) {
>> > -			r_job = job;
>> > -			break;
>> > -		}
>> > -	}
>> > -	spin_unlock(&sched->base.job_list_lock);
>> > +	drm_sched_for_each_pending_job(job, &sched->base, NULL)
>> > +		if (!drm_sched_job_is_signaled(job))
>> > +			return to_xe_sched_job(job);
>> >
>> > -	return r_job;
>> > +	return NULL;
>> > }
>> >
>> > static inline int
>> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>> > index 0ef67d3523a7..680696efc434 100644
>> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> > @@ -1032,7 +1032,7 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
>> > 	struct xe_exec_queue *q = ge->q;
>> > 	struct xe_guc *guc = exec_queue_to_guc(q);
>> > 	struct xe_gpu_scheduler *sched = &ge->sched;
>> > -	struct xe_sched_job *job;
>> > +	struct drm_sched_job *job;
>> > 	bool wedged = false;
>> >
>> > 	xe_gt_assert(guc_to_gt(guc), xe_exec_queue_is_lr(q));
>> > @@ -1091,16 +1091,10 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
>> > 	if (!exec_queue_killed(q) && !xe_lrc_ring_is_idle(q->lrc[0]))
>> > 		xe_devcoredump(q, NULL, "LR job cleanup, guc_id=%d", q->guc->id);
>> >
>> > -	xe_hw_fence_irq_stop(q->fence_irq);
>> > +	drm_sched_for_each_pending_job(job, &sched->base, NULL)
>> > +		xe_sched_job_set_error(to_xe_sched_job(job), -ECANCELED);
>> >
>> > 	xe_sched_submission_start(sched);
>> > -
>> > -	spin_lock(&sched->base.job_list_lock);
>> > -	list_for_each_entry(job, &sched->base.pending_list, drm.list)
>> > -		xe_sched_job_set_error(job, -ECANCELED);
>> > -	spin_unlock(&sched->base.job_list_lock);
>> > -
>> > -	xe_hw_fence_irq_start(q->fence_irq);
>> > }
>> >
>> > #define ADJUST_FIVE_PERCENT(__t)	mul_u64_u32_div(__t, 105, 100)
>> > @@ -1219,7 +1213,7 @@ static enum drm_gpu_sched_stat
>> > guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>> > {
>> > 	struct xe_sched_job *job = to_xe_sched_job(drm_job);
>> > -	struct xe_sched_job *tmp_job;
>> > +	struct drm_sched_job *tmp_job;
>> > 	struct xe_exec_queue *q = job->q;
>> > 	struct xe_gpu_scheduler *sched = &q->guc->sched;
>> > 	struct xe_guc *guc = exec_queue_to_guc(q);
>> > @@ -1228,7 +1222,6 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>> > 	unsigned int fw_ref;
>> > 	int err = -ETIME;
>> > 	pid_t pid = -1;
>> > -	int i = 0;
>> > 	bool wedged = false, skip_timeout_check;
>> >
>> > 	xe_gt_assert(guc_to_gt(guc), !xe_exec_queue_is_lr(q));
>> > @@ -1395,28 +1388,15 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>> > 		__deregister_exec_queue(guc, q);
>> > 	}
>> >
>> > -	/* Stop fence signaling */
>> > -	xe_hw_fence_irq_stop(q->fence_irq);
>> > +	/* Mark all outstanding jobs as bad, thus completing them */
>> > +	xe_sched_job_set_error(job, err);
>>
>> This setting error for this timed out job is newly added.
>> Why was it not there before and being added now?
>>
>
>Because the TDR job was added back into the pending list first, so in
>fact we did set the error on the job.
>

Ok, got it. Thanks.

>> > +	drm_sched_for_each_pending_job(tmp_job, &sched->base, NULL)
>> > +		xe_sched_job_set_error(to_xe_sched_job(tmp_job), -ECANCELED);
>> >
>> > -	/*
>> > -	 * Fence state now stable, stop / start scheduler which cleans up any
>> > -	 * fences that are complete
>> > -	 */
>> > -	xe_sched_add_pending_job(sched, job);
>>
>> Why xe_sched_add_pending_job() was there before?
>>
>
>We (DRM scheduler maintainers agreed drivers shouldn't touch the pending
>list), below returning DRM_GPU_SCHED_STAT_NO_HANG defers this step to
>the DRM scheduler core.
>
>> > 	xe_sched_submission_start(sched);
>> > -
>> > 	xe_guc_exec_queue_trigger_cleanup(q);
>>
>> Why do we need to trigger cleanup again here?
>>
>
>This is existing code and it should only be called once in this
>function. At this point in time, we don't know if the TDR fired
>naturally with a normal timeout value or if we are already in process of
>cleaning up. If it is the former, then we switch to cleanup immediately
>mode which is why this call is needed.
>
>> >
>> > -	/* Mark all outstanding jobs as bad, thus completing them */
>> > -	spin_lock(&sched->base.job_list_lock);
>> > -	list_for_each_entry(tmp_job, &sched->base.pending_list, drm.list)
>> > -		xe_sched_job_set_error(tmp_job, !i++ ? err : -ECANCELED);
>> > -	spin_unlock(&sched->base.job_list_lock);
>> > -
>> > -	/* Start fence signaling */
>> > -	xe_hw_fence_irq_start(q->fence_irq);
>> > -
>> > -	return DRM_GPU_SCHED_STAT_RESET;
>> > +	return DRM_GPU_SCHED_STAT_NO_HANG;
>>
>> This is error case. So, why return is changed to NO_HANG?
>>
>
>See above, this how we can delete xe_sched_add_pending_job.
>

Ok, returning NO_HANG here so that drm scheduler adds the job
back into the pending list. It is bit confusing to reader as
to why we return NO_HANG even the case of a hang (error)
condition here. May be a comment will help.

Niranjana

>> Niranjana
>>
>> >
>> > sched_enable:
>> > 	set_exec_queue_pending_tdr_exit(q);
>> > @@ -2244,7 +2224,7 @@ static void guc_exec_queue_unpause_prepare(struct xe_guc *guc,
>> > 	struct drm_sched_job *s_job;
>> > 	struct xe_sched_job *job = NULL;
>> >
>> > -	list_for_each_entry(s_job, &sched->base.pending_list, list) {
>> > +	drm_sched_for_each_pending_job(s_job, &sched->base, NULL) {
>> > 		job = to_xe_sched_job(s_job);
>> >
>> > 		xe_gt_dbg(guc_to_gt(guc), "Replay JOB - guc_id=%d, seqno=%d",
>> > @@ -2349,7 +2329,7 @@ void xe_guc_submit_unpause(struct xe_guc *guc)
>> > 		 * created after resfix done.
>> > 		 */
>> > 		if (q->guc->id != index ||
>> > -		    !READ_ONCE(q->guc->sched.base.pause_submit))
>> > +		    !drm_sched_is_stopped(&q->guc->sched.base))
>> > 			continue;
>> >
>> > 		guc_exec_queue_unpause(guc, q);
>> > @@ -2771,30 +2751,6 @@ xe_guc_exec_queue_snapshot_capture(struct xe_exec_queue *q)
>> > 	if (snapshot->parallel_execution)
>> > 		guc_exec_queue_wq_snapshot_capture(q, snapshot);
>> >
>> > -	spin_lock(&sched->base.job_list_lock);
>> > -	snapshot->pending_list_size = list_count_nodes(&sched->base.pending_list);
>> > -	snapshot->pending_list = kmalloc_array(snapshot->pending_list_size,
>> > -					       sizeof(struct pending_list_snapshot),
>> > -					       GFP_ATOMIC);
>> > -
>> > -	if (snapshot->pending_list) {
>> > -		struct xe_sched_job *job_iter;
>> > -
>> > -		i = 0;
>> > -		list_for_each_entry(job_iter, &sched->base.pending_list, drm.list) {
>> > -			snapshot->pending_list[i].seqno =
>> > -				xe_sched_job_seqno(job_iter);
>> > -			snapshot->pending_list[i].fence =
>> > -				dma_fence_is_signaled(job_iter->fence) ? 1 : 0;
>> > -			snapshot->pending_list[i].finished =
>> > -				dma_fence_is_signaled(&job_iter->drm.s_fence->finished)
>> > -				? 1 : 0;
>> > -			i++;
>> > -		}
>> > -	}
>> > -
>> > -	spin_unlock(&sched->base.job_list_lock);
>> > -
>> > 	return snapshot;
>> > }
>> >
>> > @@ -2852,13 +2808,6 @@ xe_guc_exec_queue_snapshot_print(struct xe_guc_submit_exec_queue_snapshot *snaps
>> >
>> > 	if (snapshot->parallel_execution)
>> > 		guc_exec_queue_wq_snapshot_print(snapshot, p);
>> > -
>> > -	for (i = 0; snapshot->pending_list && i < snapshot->pending_list_size;
>> > -	     i++)
>> > -		drm_printf(p, "\tJob: seqno=%d, fence=%d, finished=%d\n",
>> > -			   snapshot->pending_list[i].seqno,
>> > -			   snapshot->pending_list[i].fence,
>> > -			   snapshot->pending_list[i].finished);
>> > }
>> >
>> > /**
>> > @@ -2881,7 +2830,6 @@ void xe_guc_exec_queue_snapshot_free(struct xe_guc_submit_exec_queue_snapshot *s
>> > 			xe_lrc_snapshot_free(snapshot->lrc[i]);
>> > 		kfree(snapshot->lrc);
>> > 	}
>> > -	kfree(snapshot->pending_list);
>> > 	kfree(snapshot);
>> > }
>> >
>> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit_types.h b/drivers/gpu/drm/xe/xe_guc_submit_types.h
>> > index dc7456c34583..0b08c79cf3b9 100644
>> > --- a/drivers/gpu/drm/xe/xe_guc_submit_types.h
>> > +++ b/drivers/gpu/drm/xe/xe_guc_submit_types.h
>> > @@ -61,12 +61,6 @@ struct guc_submit_parallel_scratch {
>> > 	u32 wq[WQ_SIZE / sizeof(u32)];
>> > };
>> >
>> > -struct pending_list_snapshot {
>> > -	u32 seqno;
>> > -	bool fence;
>> > -	bool finished;
>> > -};
>> > -
>> > /**
>> >  * struct xe_guc_submit_exec_queue_snapshot - Snapshot for devcoredump
>> >  */
>> > @@ -134,11 +128,6 @@ struct xe_guc_submit_exec_queue_snapshot {
>> > 		/** @wq: Workqueue Items */
>> > 		u32 wq[WQ_SIZE / sizeof(u32)];
>> > 	} parallel;
>> > -
>> > -	/** @pending_list_size: Size of the pending list snapshot array */
>> > -	int pending_list_size;
>> > -	/** @pending_list: snapshot of the pending list info */
>> > -	struct pending_list_snapshot *pending_list;
>> > };
>> >
>> > #endif
>> > diff --git a/drivers/gpu/drm/xe/xe_hw_fence.c b/drivers/gpu/drm/xe/xe_hw_fence.c
>> > index b2a0c46dfcd4..e65dfcdfdbc5 100644
>> > --- a/drivers/gpu/drm/xe/xe_hw_fence.c
>> > +++ b/drivers/gpu/drm/xe/xe_hw_fence.c
>> > @@ -110,22 +110,6 @@ void xe_hw_fence_irq_run(struct xe_hw_fence_irq *irq)
>> > 	irq_work_queue(&irq->work);
>> > }
>> >
>> > -void xe_hw_fence_irq_stop(struct xe_hw_fence_irq *irq)
>> > -{
>> > -	spin_lock_irq(&irq->lock);
>> > -	irq->enabled = false;
>> > -	spin_unlock_irq(&irq->lock);
>> > -}
>> > -
>> > -void xe_hw_fence_irq_start(struct xe_hw_fence_irq *irq)
>> > -{
>> > -	spin_lock_irq(&irq->lock);
>> > -	irq->enabled = true;
>> > -	spin_unlock_irq(&irq->lock);
>> > -
>> > -	irq_work_queue(&irq->work);
>> > -}
>> > -
>> > void xe_hw_fence_ctx_init(struct xe_hw_fence_ctx *ctx, struct xe_gt *gt,
>> > 			  struct xe_hw_fence_irq *irq, const char *name)
>> > {
>> > diff --git a/drivers/gpu/drm/xe/xe_hw_fence.h b/drivers/gpu/drm/xe/xe_hw_fence.h
>> > index f13a1c4982c7..599492c13f80 100644
>> > --- a/drivers/gpu/drm/xe/xe_hw_fence.h
>> > +++ b/drivers/gpu/drm/xe/xe_hw_fence.h
>> > @@ -17,8 +17,6 @@ void xe_hw_fence_module_exit(void);
>> > void xe_hw_fence_irq_init(struct xe_hw_fence_irq *irq);
>> > void xe_hw_fence_irq_finish(struct xe_hw_fence_irq *irq);
>> > void xe_hw_fence_irq_run(struct xe_hw_fence_irq *irq);
>> > -void xe_hw_fence_irq_stop(struct xe_hw_fence_irq *irq);
>> > -void xe_hw_fence_irq_start(struct xe_hw_fence_irq *irq);
>> >
>> > void xe_hw_fence_ctx_init(struct xe_hw_fence_ctx *ctx, struct xe_gt *gt,
>> > 			  struct xe_hw_fence_irq *irq, const char *name);
>> > --
>> > 2.34.1
>> >
