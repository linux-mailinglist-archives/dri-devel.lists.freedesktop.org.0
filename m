Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 319F2AA73D2
	for <lists+dri-devel@lfdr.de>; Fri,  2 May 2025 15:35:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93C0A10E934;
	Fri,  2 May 2025 13:35:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MhOKG3aH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1549E10E934
 for <dri-devel@lists.freedesktop.org>; Fri,  2 May 2025 13:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746192937; x=1777728937;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=jNVfLL9uBeJv7skLmtiDwDRW1bHqK7w+P9XmR9JJ7XY=;
 b=MhOKG3aHM+Ewe78E62J97L3F7IGLS5k4s9JQDJdTY4TleRgIqpc6mmtG
 49HMWKPz97hj8LQeCxKIxN3eijJR68lEFlGBCDbO6fQB/fAXlOekK739A
 QRGk1jiSldThFAoKpM1Mi4izHyGW3OBpacP4qb8j1Qtm5QAYicZH1m8HX
 qV75EytM/b05G4lpwmv339bppC7DvTryeQgbL2q0QADDFQS0yb6vpcfVE
 GMUdvKZuLP0IvI2OD/21XQ3mJykUAJx2HAe0CX9m/3W5CwQZcCtL7ObIn
 gY1pNeiPWhnvVm+fGzsXNnlKNo3A7Yn+itJSS+MKx9lvQOLvQUAKazORa w==;
X-CSE-ConnectionGUID: FWYIO5FPS3OIqQT7mme9Sw==
X-CSE-MsgGUID: svTKAtKFRhK/9+kgma6BfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="59235126"
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; d="scan'208";a="59235126"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2025 06:35:36 -0700
X-CSE-ConnectionGUID: nY5Hig+DTKiMfzP3puBrGw==
X-CSE-MsgGUID: gs3RmXYgQk+yO+DA2yrRuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; d="scan'208";a="157875113"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2025 06:35:36 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 2 May 2025 06:35:35 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 2 May 2025 06:35:35 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 2 May 2025 06:35:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PVcY6apaL1CmGgucrPbW2o2cEVZ/2Q2ngOADLfXKAdyBhocRmTAt5JxRELsPCL4/OK411MiuK5Ddrwm6kceTy+N3rPEs1lTRvQQ0ikj9Bl9mykP9YqgFQt/izaeNkH332PG3Tfa2UUu8lkMv+uiWqJkqh0c3mdQM0ApEMZ867NAuXPJnlwb/D5A+ocoGZnjd5B3lvCKaEhgL/PA9g1SZ4aB6qUSlGmXEtF5JDDyS4wOCt6zDst/WYOERXRKIRSM6hN0HQs43BB/Cn9u+RzrDN1duyHZqXiZGw3uA1hMMym8H3WZ+p/DbOCqzWzBHgYBfuL+zY5+KzJVB5baBrvnSrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rzB9kHBVPx8mP3flkN/10cZyomyxm6AjUsN0AIFU3Hw=;
 b=ViQYg1U/zaeqInT/OG/dyTuhKBpQ2lQOt05He+wA6+NIzBuALEPWJy7cRqs+Y0J7OStampX+SxgovVFqNQtW4x/rup2nybV01de7DeZw5/o0jStalZD2fzw1Cxr2E+dp7lr1XPSqg1cR1MfGSyxvnLqjFW7HsjB787lARUphsEZHm/4hEzq7gxx9GU1Ah3JTspFk5kkvazYPpZlH3gTzBXUCFMRQ1UmiPXz8sASQLURG2vR0jOkWZdFt81wTJqo4afJtqGEV3x+AYqZoGbi7Zt5mRRh7ypkvUWsiqhy8o13rAFtF+pO0NkS7zP/YVv6BwAzqGTpDOS1ifZyR7e9QnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CYXPR11MB8732.namprd11.prod.outlook.com (2603:10b6:930:d6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Fri, 2 May
 2025 13:35:19 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%4]) with mapi id 15.20.8699.012; Fri, 2 May 2025
 13:35:19 +0000
Date: Fri, 2 May 2025 09:35:14 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <jiangfeng@kylinos.cn>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <andrealmeid@igalia.com>, <christian.koenig@amd.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] drm: Fix potential overflow issue in event_string array
Message-ID: <aBTKEk7eE2Kur16_@intel.com>
References: <20250409014633.31303-1-jiangfeng@kylinos.cn>
 <Z_YSo9YBbsLaYzkO@black.fi.intel.com>
 <aBNngS4XZR4ZtdAL@black.fi.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aBNngS4XZR4ZtdAL@black.fi.intel.com>
X-ClientProxiedBy: MW4PR03CA0238.namprd03.prod.outlook.com
 (2603:10b6:303:b9::33) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CYXPR11MB8732:EE_
X-MS-Office365-Filtering-Correlation-Id: e9e980ef-6839-492e-47d4-08dd897e2dfd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ifVRNGSzAg7JCfELjgeAZVzrmJMEb5D9r47RfcoVQvTPQ8pWoQvYEnbTb2Ro?=
 =?us-ascii?Q?BPhSKmXKM/QNIY4tNI4VO7ted5buP60Qbr1nPMkxoSOTPLc8n++Ggwtw+s9j?=
 =?us-ascii?Q?RsnS8qCn1MC7jGQqe9Yz1yMSfYsLyTmyjfmRsVTszA+l0mdMf1bkScEkYscj?=
 =?us-ascii?Q?MXUkYcgraRwYnVSEoLTzoSe59IitRzfLCW6RlY9kRp91h9xLsbIVtnsc/9FJ?=
 =?us-ascii?Q?gtLKha8KLUg3rgXl/zsTY1S1ZOvyOy6WEf9EAA/DdF/SXvGUPOz6PNQ8BQCb?=
 =?us-ascii?Q?/ocPsmS5Ld3za3+mpf7FZ4mpXeMavAsE+0DiPMRN6tPkE7BtCFYgeQKHlJDB?=
 =?us-ascii?Q?VpmNt2sal01yzeV9rcqCk9iQBeaNjKHQ+n79x/qLlHebB70C02NevwV5W9ho?=
 =?us-ascii?Q?zZ8MY2SzD5mt+A0Hk4gFC9F3ajeH27b0kt81g1tAIjcwo8wB5eBOUNGYofwh?=
 =?us-ascii?Q?svNtRsaIk7tTA/65JV4V1fFcEMJbBHG60a52FRRWuauAVxrq23f9MNRz5l3K?=
 =?us-ascii?Q?EVGIBI6p5GWjYD/FU9TmMLWNRiNcbbCM0Q+9cTgkjZ9OiawaXaHbmTGg4WCS?=
 =?us-ascii?Q?Uh0j+6KFxzGS1HEkGb5SqoYOfeMre0oDnSevHQBH5MMz6I3Xf6nAzWlrWruR?=
 =?us-ascii?Q?hXOJJ3eVFQchpEdjfBRT/XR8B1tBgyDzd3HPRw4kfJ+8WSTzWQuzf84yMGpv?=
 =?us-ascii?Q?uRW12Dt2ufzOFqiaGrrzqmC2b6uE10Z53aKMch84oKnb03AmG1qGgMViuYiT?=
 =?us-ascii?Q?6IAbHfxVTCMRIC8NqEVMSlTLZPCrEvRuaoYpV57yX9mH/2cHUPZo91HMKGfg?=
 =?us-ascii?Q?5K+74sZewin3xzNy3w6ibbCHFYSVThEAtSphhvZ7ih+PA5iS8PS8VXKz3FBW?=
 =?us-ascii?Q?o/wrMPz3k59Ix2v+pIxkIPltOUrp0RnW2qLeEh7w6y52bRV1wJvGm3ItH0wi?=
 =?us-ascii?Q?0EVz2f/YNUjEzbsTEFEdhLG7pPrpjZFMUWOgh6I9balh70fpzTYoermMzTUQ?=
 =?us-ascii?Q?NTt9Njv56tF4fiqOieGZ2qMKxLdKc5REdowwc/8j/xOY45seAUhAqoKIU2JN?=
 =?us-ascii?Q?H44wI1O0R7P1VsE4LmUnH1uTEFEgQABc3EYH8Fa1Y9EA2rr2t5wvrWFoEJfA?=
 =?us-ascii?Q?Q+HozqpriDsRXT16/F1wJlaBrpL8+PVN1AtcdN6J2ixsIeSm1awEFnDCFL28?=
 =?us-ascii?Q?C0tJhXwEeyh5YCk45UOA/QgaJ+aghqXQaqV6MWbpa2CGhvVG+YbSramXZ2ks?=
 =?us-ascii?Q?BtRwg7MB2pAJ+SZb+ebKkm60F8ZE9ekVXIp+e/ofqh9QIhXK6t3JzM51oKyO?=
 =?us-ascii?Q?7gO7beh/W4SpSkWVNqVpVI3neKHccjY5b/G29XPcRwmLjIP7eyMWiOFrmKFS?=
 =?us-ascii?Q?5MMEJ03iL/zh8pz+QUL+nghrgIFY9ks6PTlqcUHkZzdiKwbhs6od9HkeG+w4?=
 =?us-ascii?Q?eF5Sd/sBcwY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JF2oPmCURPnmr0Ugm/l4jxkH9z9Vbc+Cooie6xF3tW/P2vLiWg6xJ5dTu5Bw?=
 =?us-ascii?Q?4uQafiM1JvdR8wm1KS25iOrObVii35p2tyECmxCZFB/UVz8Y0khKvL/DRFdp?=
 =?us-ascii?Q?SYyArUkCUcHxN0/8dw2tw61/HMAMTaAx3A6ySMml0U1bg8eBxjFH56KuAE9e?=
 =?us-ascii?Q?tAc9TTS1KNEuj3HlOfHNMWNnsJekTwMXpENnr5mh/zzbTJIPOBJgZzcdIann?=
 =?us-ascii?Q?Cn8sIaCoeCCKPduA8wednukcpM8MCeywBaXTjxCjfn4H9TshQVUseawuf3T+?=
 =?us-ascii?Q?Enl+9RfoNWbnFL1Pi3ovwUnjDAJuAXi3mQSc+p5q330lR3peB32XOrj4moFh?=
 =?us-ascii?Q?32E9Krns5VUmKKq7gBqcq0QeZqpdvam5MhF88V5lFefPIVYby3op5ikD7BP9?=
 =?us-ascii?Q?Xl9o+om/V6D8kN1q394GWtB2kLt+O/foclTIRe03YASprhYaClc1/lC8SIgO?=
 =?us-ascii?Q?/rXsOJMbGvsdUbkPhsUSLR5drFsqDWack6fqeQHwbMxp18ju+/Ziz62kKifB?=
 =?us-ascii?Q?68mx6c+/dzK9VlI47oHYpKaViLHkuwGFFZTTQf7f286Fb88tgA9hcL34RidE?=
 =?us-ascii?Q?+oryusE6gfb7PTt6jJpndz/6+gKKiVL2PYvppUdGhrxJ+9xlqf7gFLJVAgqm?=
 =?us-ascii?Q?LGmxTWWEPsaHQyY2jYl1cFUT1RcNXi0P9uIESdiF1AbvAhByvtKDOwbH6Nc1?=
 =?us-ascii?Q?XlYEf4trwu+2S3Tp6wqo6qqU2kjJMDiQi7xLahuJjaoAF2OJ5cnC7etsDU+N?=
 =?us-ascii?Q?kxswCcct+qEDLI/Yva4nA3CDU6TzUcHglnsSCRFV2pJts1F0VhXcrY6k8ca0?=
 =?us-ascii?Q?roSwReFl+1P9U/Gjf3Lzgbk4yw+8DECuW+hNTZF5egqjgSs7JgPO/e8G0LuV?=
 =?us-ascii?Q?FGXAUaqAB86c/FcPcuS0/0JvFk5aHZNg5wEFv9IrzxJd7gL0dGk/+Ojg8ukH?=
 =?us-ascii?Q?1UnwTgw/YuixArB/oQqCqiwaWdGG9vdcm8Tfu1SIMdQ7nLtAKQy582eP28lJ?=
 =?us-ascii?Q?8wCO5FMXgGVREyD5bSRY34t1pyhZmL3K8KXosz9BZnhk4Vp536jENw0uHByv?=
 =?us-ascii?Q?4Ljv0rXoNDKhqCFKbOwyUJcc5nOyTbD7gIJrV1lsfcjFzy0Yop8J1Pv6OxTb?=
 =?us-ascii?Q?rM8Ko1VyF7CUx/FEWXVTbaSd3BY42w/NyXL2TAVwBTYQ0FQn42cgr2FWVJc9?=
 =?us-ascii?Q?zNIoyl7icoRNn3nXXDTNtmsHyRcDKLPPauxmvMTVukeRhxi7tgVD9AHjMw+i?=
 =?us-ascii?Q?qH0CtX3HBDdRFDzd635pSn5CP81LU/xpCxvWxiQ60Jhyha4BLmLn22nOIlRp?=
 =?us-ascii?Q?NwvqvC5KAnRkBMzoWKB9yqURFTToHf2SsmoVIVhvX9FPZFLzTep3csGHblCd?=
 =?us-ascii?Q?tK2rw9FHaskkqrBK9XSLXdG1gAvW2BD+pUVEXc4j8Lyj89IEljgmAVaPCBmq?=
 =?us-ascii?Q?xjc11vjOq5wpWC5D40ks2w1W3y0EbVmfQExbRwtdXYtDUv7hXDlwMUX+Yk++?=
 =?us-ascii?Q?ZjBj+NIIKNPvPmqbhvcC1BzCItoncTCKjrhcZZZLyboaqe/DFZOu9sRDdZWG?=
 =?us-ascii?Q?dErultvrnByjs68PLl30Q7vSFZYEwew5BDzdqhSxuGqPl8/i8SP8qyNQfzqo?=
 =?us-ascii?Q?1A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e9e980ef-6839-492e-47d4-08dd897e2dfd
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2025 13:35:18.9490 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3x+wne/vlRgjq1Oi9xx8s88Ws3rRWGdsQE+/mjQ3OHeOXfUNlB27RSM+47qFFg6BWv328GvhvVBUf3k5MV2fwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8732
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

On Thu, May 01, 2025 at 03:22:25PM +0300, Raag Jadav wrote:
> On Wed, Apr 09, 2025 at 09:24:41AM +0300, Raag Jadav wrote:
> > On Wed, Apr 09, 2025 at 09:46:33AM +0800, jiangfeng@kylinos.cn wrote:
> > > From: Feng Jiang <jiangfeng@kylinos.cn>
> > > 
> > > When calling scnprintf() to append recovery method to event_string,
> > > the second argument should be `sizeof(event_string) - len`, otherwise
> > > there is a potential overflow problem.
> > > 
> > > Fixes: b7cf9f4ac1b8 ("drm: Introduce device wedged event")
> > > Signed-off-by: Feng Jiang <jiangfeng@kylinos.cn>
> > 
> > Reviewed-by: Raag Jadav <raag.jadav@intel.com>
> > 
> > Thanks for the fix.
> 
> This one seems got lost in the noise but important for 6.15.
> Any takers?

pushed to drm-misc-fixes

> 
> Raag
