Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34BE8B86240
	for <lists+dri-devel@lfdr.de>; Thu, 18 Sep 2025 19:02:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3637510E158;
	Thu, 18 Sep 2025 17:02:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ablzICV+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0498510E31A
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 17:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758214954; x=1789750954;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=R9fRk+xy9oj8vMzp7zW+q8J2e0mVTYPT8+ZFnX18BRU=;
 b=ablzICV+R+Hzv6b9sSC4SdZQheLfv7CqPR2Gaa3064vGcJAgBrOrky+H
 /Wk8vhyIrfGMPt712Cx2A7kp/vq+jZJihLs2XF9CnExZfB+lcFWoafe/o
 0A3UwSQvKx1tB/ZavzTh7eKNrhH8rgQdkhQTnfdW9vSs9RPbgFkpPzqBY
 CcV/GVh2n1kgwU/I9PSt9qHoLAM8SfRXYZHPYDyjDfTaKVMACy53+EM0Y
 eqYqoGvCb98eEn6pnm1Mizt/b/X9uSLgLZZDucUf5Zbo0fSl9CVjra3RE
 eCkITO+m3zQ6oDOCNXxY1aVteovST96YqwjAPsWaqdtI35uQYQw5dvXIP A==;
X-CSE-ConnectionGUID: l/wPLd9xSZiDEou4y2fmVQ==
X-CSE-MsgGUID: eQb80XrORHi1FuqAnF0Baw==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="71928343"
X-IronPort-AV: E=Sophos;i="6.18,275,1751266800"; d="scan'208";a="71928343"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 10:02:33 -0700
X-CSE-ConnectionGUID: FqJ9t6RNQtu5sBbh22m17A==
X-CSE-MsgGUID: NQYZM/vtQhO08PbDHRO56Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,275,1751266800"; d="scan'208";a="179599782"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 10:02:33 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 18 Sep 2025 10:02:32 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 18 Sep 2025 10:02:32 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.61) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 18 Sep 2025 10:02:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YQsdFgRhayDZDcudBqusFXATbx3kp/rYjM4BC20qvJaezWr0VayewU+51YvBrD/ZD2DIZj2e9XfIPytYEz8lVlldJNqY7kKukLgKUnEhlbwrvODsJBNh2qJxp1DVqrju69V+49rCwWjbUfd1U4+ulJNT/Qw9MmzvMD9ffATYq/U5TlSAAIW/AmA4KK3z5tGyswXeaAeF18RClAUZ/jAIYtawJUiOkJVOyAz+uLTCAAVR+wn51/WI1wq0qPFSz6bnpYJGANdsKlAmCI14W3pvJ4+LYNiY8pDc/wVAD2dKCl+tLRajHVhJ0T4eZDDrBCjXbQ5ooBmXZnHrFVYzC4v4dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jqbLOheanNbhbJTlSiueSS414w3Uqspd3FRBXei3Ku8=;
 b=LTPumQ85xyyRQihRXvGznQERRxCo0OT8uiiizEZWcjVgv7xlkhZ5BDrp51KGC4SyjTxlRONXBCF5hQlmpoxzysiZB2W0A/nuoUwNqheWGMtJsODkkSpiPU+ymA5yAATHOS24qVn++CNljeTks4uSjDumWMKn9LPVcqIEyIjFGTkosmEJRKc4z0WD3tIBP/t7+nfAMShYNGV+hMBaj1yz/JlyCWLqRlp8+Z9u8Inf2iuYVPMXOBLkTa6WDsZZzaILfnDoeoJn/X6K6+q5uDz/O4FWBfryFjJ8uLkD8O0reUP8xirIiC1IHikqCbzaZNNNDsYqOId+cyh80aNUBv77Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB7445.namprd11.prod.outlook.com (2603:10b6:510:26e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Thu, 18 Sep
 2025 17:02:18 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 17:02:18 +0000
Date: Thu, 18 Sep 2025 12:02:15 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
CC: <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 3/3] drm/xe: Move rebar to its own file
Message-ID: <x7sisnxuy6qqhoq7ke4t26btpzcgm5fa3vmqhvvwpldjongd63@hvsvhraxnjxi>
References: <20250917-xe-pci-rebar-2-v1-0-005daa7c19be@intel.com>
 <20250917-xe-pci-rebar-2-v1-3-005daa7c19be@intel.com>
 <c276f28c-f599-43e3-a4e5-82b3ad286361@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c276f28c-f599-43e3-a4e5-82b3ad286361@linux.intel.com>
X-ClientProxiedBy: BYAPR07CA0078.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::19) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB7445:EE_
X-MS-Office365-Filtering-Correlation-Id: 33299182-6e8d-4cbb-07b5-08ddf6d51fe3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|27256017;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?gxPARkbM9nqx98oimSU89OJuwV/UEW0eV6BAhzaZVDA5gtiZFcaYzvfeWC?=
 =?iso-8859-1?Q?Zmsj1h2ro8th5nk8K7WUsxNjPvAzZKbJ1pvUXfEssnYuiyqAWwmL/CLmpy?=
 =?iso-8859-1?Q?tB0hjiPMVU/fWm63Jh25Ly5FcFn0K9Wwu+y85myfrHcw6uNjt7YrsMZ+NI?=
 =?iso-8859-1?Q?X+7WT1Jfxukv0a/wFPqJcg6cTygDtZg276sJN5JT80qBrPTDOg4uFIF0Rb?=
 =?iso-8859-1?Q?vU+hrfNuX19l8fYXndYxDj3PaM4ivII4EKinO/wsBrWf53YAJyY32j+Mu0?=
 =?iso-8859-1?Q?FSkbp4p2Se+LlWYNaDRSoYBil/AaeGTrkPzY/iqDjbZvDqTY1IjnsXSYll?=
 =?iso-8859-1?Q?uPiKy0CxVUTWphl0WImcmGii24l+bDfcy9iHQvm1u5l9gidRtd7agCfcWI?=
 =?iso-8859-1?Q?Y1pZh0u1oRTu7idJFIPoz8yL4uebQnPfLhi3JjBbJXhPMXtzwUHkPB7Dj8?=
 =?iso-8859-1?Q?cTSeo53NwRpeZAI/TjZFkV4kNxet2VqjQumvUcLgT8Z3if754fmgyn5iA5?=
 =?iso-8859-1?Q?7URcfUG/a2JUbpG2UobiuOEOQZbYdJKY6o4zMKPXqihtSmU/fvP1G8NTZv?=
 =?iso-8859-1?Q?XYCOHDe7FfvKy1yQQmoKdaNAJYqH6lQG4oSjwmxCYUq076ty+0jURIZq5X?=
 =?iso-8859-1?Q?COTDGN+iKprMQE4BoCY73KABGmCbBbK7CB2r2aOta1PWkHwPNmFUHdgX19?=
 =?iso-8859-1?Q?FmBkxLjKdZyjS5MJooKuqf/NhgZJ0stlzKtxemqX2yXLQFzRQXsoDu9iU8?=
 =?iso-8859-1?Q?DdQKQls+zBZlXFholndVV2M+nYMHAGe7u83SYYKmfX1dQxLVAlNIpbT1Do?=
 =?iso-8859-1?Q?3QPZUUrIRKMctt+LoKOImnK8GAcEna3Q4ak7xoApXa2Xlaohm7ENUzx0LR?=
 =?iso-8859-1?Q?njvWO0GlvN+fxZhDW1lOCR4BTCK7C1sdc//tuE6Rzyo6Q5oDChbtRpL8JS?=
 =?iso-8859-1?Q?pUb/x2fbeQCPBbWzWPvz7XY4W2I9BJ9P+j1x6ju6ge72zzrZPvd1iFY5uC?=
 =?iso-8859-1?Q?jRE/wVHA+nX3JsDcrOwH8Uib5uxXwJP22N5UOK8HHV4H3nTTLcD8PtCMXR?=
 =?iso-8859-1?Q?AExpbJ7R0tXH+o4Ur9tKp+LpjZzHlZjiiYUt3xuX7pjBFIFDXinOUf+3Bs?=
 =?iso-8859-1?Q?KzYKJhz6+zZCnhxjyftT09GZwyog/lFEApycUBv9eo7y1ZNJ4kg3HYRDe5?=
 =?iso-8859-1?Q?KvESp9oiyNNpVuV8WmMW5VXg5/RMyJwdX0afusI0916U18NHvA1xCPY+lm?=
 =?iso-8859-1?Q?UMEEaGj1e825HYSuX4HWD1CTbQmReTqB2zTSlhA4zHRxRmzCQ3EwM70gy+?=
 =?iso-8859-1?Q?PKb7bt54L8oNcQNcKmWAiENRO0K2+BmHNKYySJPYXbEqbzwVjDu0giYE9F?=
 =?iso-8859-1?Q?bwxOUr4/5AI8LG/AyknzktN19Zv2Yw/nVXm3sczMJywZ01hTuyAO7Ht6zM?=
 =?iso-8859-1?Q?JBXsKAcYbgjhQ0R9SJL5oCk2m1ixLNLPvXsjYFpKKDqN+Uihv5HpUcaB/v?=
 =?iso-8859-1?Q?fEo14lkFLUYxiNDy6dV5BPYX4twtpbk+cclh1vq/YaMQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(27256017); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?CoYFBuztKUCJKUbFg8S7inr7GckNDB9IhoCe/FIfTFepc9dhdZOm7MXao4?=
 =?iso-8859-1?Q?qOGQo3a3D8Yv4KM0syaEmnacRnw2P8CX5QRmO1x/2vtt6DKSNAyIh9XcUj?=
 =?iso-8859-1?Q?NmJFd0mzrlo7jj4NtA9sMJUOpRIGNnu5dDn/88vy4HAXk7xz1QznIzESJr?=
 =?iso-8859-1?Q?k2RnqE2WtrYWhOKGKI72bDxve5Cm8/+rQ+2LURoNXri7L75wFy1UOcEhrr?=
 =?iso-8859-1?Q?UWMQ5igRQa6w+uVzJ4gN1zkib/CdXezaBQyvE0AoTqrfJ1dqNdJtd2+0vr?=
 =?iso-8859-1?Q?ixVfKlAiSfrxG/GZLYhFGXDA5wVDfVF3LWwOvSINF2znz+qeyIeM8oWLDs?=
 =?iso-8859-1?Q?6DXgnaD+Y8Mf1iDpKIbgXcwrF52exew2BIbH0jCg+5gdAwqqyp6V9MG6r8?=
 =?iso-8859-1?Q?g7QdclJxQB2cki3z7itObApRe4E4iu0HeiveUHQQT6Rdtk2zt9mm3/BhZR?=
 =?iso-8859-1?Q?amqeUGbWp17gBakF7SnOldxAbNvNjpIHEd5haOusliLFKvDTPwWDXJtnv3?=
 =?iso-8859-1?Q?gGkSeVVng8++fAsC3aZ5uyN/ZhxiXYqOeWnoRHMrdzZBq7UdIIVpwgtbrg?=
 =?iso-8859-1?Q?cbpoA2K5CcM9FiKaEZmuP/bXsQ6rwlAiqlWb1bulEPR/859gfFvmKJ6ynm?=
 =?iso-8859-1?Q?VWf3HXRLn0tMvFTUcFFqqeq6g2FU8yG9Qjs4f50W7EvZqCmYVK/oqZInDA?=
 =?iso-8859-1?Q?GJjqYGh7NTrXDOpAl1gjNdKjxdTO/0EVbRYVv6VyNTAD1fP4pmJ0PqIV3C?=
 =?iso-8859-1?Q?MxQUTc0RMCWei4Hvf5YIXcuj5jar0HPGuZt3xChSXKSeG390UqqFLmkDbB?=
 =?iso-8859-1?Q?4lD2l/hMJFmbGlAKzJqGsSrBgOtx3NU1Ch3f2JcJ6Yrip35nPAze4rWGcn?=
 =?iso-8859-1?Q?ohnOTJHf1soXeNZMicdQconbl2zm2XwSPW/19t+SYSOfPyYZFUX679qREL?=
 =?iso-8859-1?Q?4GFbOlUiKvbTqJCFuFxJtk7FacttTCpDOQGigr1CDvPiA4Q7eeW8Yml0FR?=
 =?iso-8859-1?Q?Y5zk8vxb3kgDBMlwShw/kp8O0T4rNkgdNjslKyrz2rnlLu42cD2xEP2j9C?=
 =?iso-8859-1?Q?d4QL3IZPkjlkzSYoSwOe/n4C4KVq8Qg/MkaBybNW7FRwr1RLaMcWOeXnwp?=
 =?iso-8859-1?Q?IzrPDDRWx1Eq+q8knNXAkkMSKXM1uxPk77Snl8Pn5vLkW7A/zKyLrb41fF?=
 =?iso-8859-1?Q?4vBpl4tcOty+GAIdrkR1m1zeWzkxrZkG8M7Vch1555r2fFaNGRKleifnAK?=
 =?iso-8859-1?Q?l/5W0+oov8RDkDr/hTSY8XzoTC9MadsG/S5ZVsatr0TIdUIKtCRz4i44mG?=
 =?iso-8859-1?Q?vP9mey7jESIfFffQcnzqPprofxHvDIEnVZ0OJhnHkWlMzAPPePSUHlNTZP?=
 =?iso-8859-1?Q?3SIm8lcpfjT2zfUllemmSY6hWqpVcxxqfvcJUdQK0GDm/SKKTIgVmDss7v?=
 =?iso-8859-1?Q?dh+yVxuhgt65trWK6D43l274zzD6DBNP1/G8PTL/BLzd9qAHTvk8jCT7m8?=
 =?iso-8859-1?Q?lzRUYShr1FVlgih2H1vuxFaeVE6e1Z/U+8mA8Idmdl3BILaQjxWpMgnIKb?=
 =?iso-8859-1?Q?vo99Msr9Wi+d8oCGCeye+mwgzBoE7RgVnKCI59+4ViNNwKWuq4hUA0Roqv?=
 =?iso-8859-1?Q?C7x64WhGjgXVc+SpI6JBvbTSWsjAK7GQa+jsHgDqwX2ZrcU4LAdCejWQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 33299182-6e8d-4cbb-07b5-08ddf6d51fe3
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 17:02:18.1344 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qZf1IDus43px1lQhhPPUyUphBlFiPEhQexEC57FXDVY5WielVsDFh0nFDuAJQihIaE3tIWiPAxL+xUxDmDdC6JxWtdYuGlhROJrjOWFYMFE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7445
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

On Thu, Sep 18, 2025 at 07:41:59PM +0300, Ilpo Järvinen wrote:
>On Wed, 17 Sep 2025, Lucas De Marchi wrote:
>
>> Now that xe_pci.c calls the rebar directly, it doens't make sense to
>> keep it in xe_vram.c since it's closer to the PCI initialization than to
>> the vram. Move it to its own file.
>>
>> While at it, add a better comment to document the possible values for
>> the vram_bar_size module parameter.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/Makefile       |   1 +
>>  drivers/gpu/drm/xe/xe_pci.c       |   3 +-
>>  drivers/gpu/drm/xe/xe_pci_rebar.c | 125 ++++++++++++++++++++++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_pci_rebar.h |  13 ++++
>>  drivers/gpu/drm/xe/xe_vram.c      | 109 ---------------------------------
>>  drivers/gpu/drm/xe/xe_vram.h      |   1 -
>>  6 files changed, 141 insertions(+), 111 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index 7a065c98a3b85..5a66d7a53d0db 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -95,6 +95,7 @@ xe-y += xe_bb.o \
>>  	xe_observation.o \
>>  	xe_pat.o \
>>  	xe_pci.o \
>> +	xe_pci_rebar.o \
>>  	xe_pcode.o \
>>  	xe_pm.o \
>>  	xe_preempt_fence.o \
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> index 1f4120b535137..6cc5e7b6901a8 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> @@ -27,6 +27,7 @@
>>  #include "xe_macros.h"
>>  #include "xe_mmio.h"
>>  #include "xe_module.h"
>> +#include "xe_pci_rebar.h"
>>  #include "xe_pci_sriov.h"
>>  #include "xe_pci_types.h"
>>  #include "xe_pm.h"
>> @@ -866,7 +867,7 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>>  	if (err)
>>  		return err;
>>
>> -	xe_vram_resize_bar(xe);
>> +	xe_pci_rebar(xe);
>>
>>  	err = xe_device_probe_early(xe);
>>  	/*
>> diff --git a/drivers/gpu/drm/xe/xe_pci_rebar.c b/drivers/gpu/drm/xe/xe_pci_rebar.c
>> new file mode 100644
>> index 0000000000000..e04416630b573
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_pci_rebar.c
>> @@ -0,0 +1,125 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2025 Intel Corporation
>> + */
>> +
>> +#include "xe_pci_rebar.h"
>> +
>> +#include <linux/pci.h>
>> +#include <linux/types.h>
>> +
>> +#include <drm/drm_print.h>
>> +
>> +#include "regs/xe_bars.h"
>> +#include "xe_device_types.h"
>> +#include "xe_module.h"
>> +
>> +#define BAR_SIZE_SHIFT 20
>> +
>> +static void release_bars(struct pci_dev *pdev)
>> +{
>> +	int resno;
>> +
>> +	for (resno = PCI_STD_RESOURCES; resno < PCI_STD_RESOURCE_END; resno++) {
>> +		if (pci_resource_len(pdev, resno))
>> +			pci_release_resource(pdev, resno);
>> +	}
>> +}
>> +
>> +static void resize_bar(struct xe_device *xe, int resno, resource_size_t size)
>> +{
>> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>> +	int bar_size = pci_rebar_bytes_to_size(size);
>> +	int ret;
>> +
>> +	release_bars(pdev);
>> +
>> +	ret = pci_resize_resource(pdev, resno, bar_size);
>> +	if (ret) {
>> +		drm_info(&xe->drm, "Failed to resize BAR%d to %dM (%pe). Consider enabling 'Resizable BAR' support in your BIOS\n",
>> +			 resno, 1 << bar_size, ERR_PTR(ret));
>> +		return;
>> +	}
>> +
>> +	drm_info(&xe->drm, "BAR%d resized to %dM\n", resno, 1 << bar_size);
>> +}
>> +
>> +void xe_pci_rebar(struct xe_device *xe)
>> +{
>> +	int force_vram_bar_size = xe_modparam.force_vram_bar_size;
>> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>> +	struct pci_bus *root = pdev->bus;
>> +	resource_size_t current_size;
>> +	resource_size_t rebar_size;
>> +	struct resource *root_res;
>> +	u32 bar_size_mask;
>> +	u32 pci_cmd;
>> +	int i;
>> +
>> +	/* gather some relevant info */
>> +	current_size = pci_resource_len(pdev, LMEM_BAR);
>> +	bar_size_mask = pci_rebar_get_possible_sizes(pdev, LMEM_BAR);
>> +
>> +	if (!bar_size_mask)
>> +		return;
>> +
>> +	/*
>> +	 * Handle force_vram_bar_size:
>> +	 * - negative: resize is disabled
>> +	 * - 0: try to resize to maximum possible
>> +	 * - positive: resize to specific value
>> +	 */
>> +	if (force_vram_bar_size < 0)
>> +		return;
>> +
>> +	if (force_vram_bar_size) {
>> +		u32 bar_size_bit;
>> +
>> +		rebar_size = force_vram_bar_size * (resource_size_t)SZ_1M;
>> +
>> +		bar_size_bit = bar_size_mask & BIT(pci_rebar_bytes_to_size(rebar_size));
>> +
>> +		if (!bar_size_bit) {
>> +			drm_info(&xe->drm,
>> +				 "Requested size: %lluMiB is not supported by rebar sizes: 0x%x. Leaving default: %lluMiB\n",
>> +				 (u64)rebar_size >> 20, bar_size_mask, (u64)current_size >> 20);
>> +			return;
>> +		}
>> +
>> +		rebar_size = 1ULL << (__fls(bar_size_bit) + BAR_SIZE_SHIFT);
>> +
>> +		if (rebar_size == current_size)
>> +			return;
>> +	} else {
>> +		rebar_size = 1ULL << (__fls(bar_size_mask) + BAR_SIZE_SHIFT);
>> +
>> +		/* only resize if larger than current */
>> +		if (rebar_size <= current_size)
>> +			return;
>> +	}
>> +
>> +	drm_info(&xe->drm, "Attempting to resize bar from %lluMiB -> %lluMiB\n",
>> +		 (u64)current_size >> 20, (u64)rebar_size >> 20);
>
>BTW, if you want to do additional cleanups, all these 20 could be replaced
>with ilog(SZ_1M) as it makes more obvious where that number comes from.
>
>But this conflicts anyway with my rebar rework series so perhaps this
>is not the best time for such cleanup.

agreed. This patch and the others that will come on top should be merged
only after yours. I will mention that in the cover letter of my next
rev.

Lucas De Marchi

>
>-- 
> i.

