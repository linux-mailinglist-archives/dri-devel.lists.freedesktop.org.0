Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WOs0N0XOl2kk8wIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 04:00:21 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9196E164551
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 04:00:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61FB110E772;
	Fri, 20 Feb 2026 03:00:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sra4kcZY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DF4610E771;
 Fri, 20 Feb 2026 03:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771556417; x=1803092417;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=p1y2FNl5DbJuNJ5oIuLMy7dhKi8iBRQD9uaOzZhyOng=;
 b=Sra4kcZYf5wdlLbj4QgPWaD+0LcLha17bl4WlSJ+nMi3KjVOo3tChSMI
 NhmK0QaOJv8LnyafFT4KLuEblmdtS3QEi7Ik3sINC7gWs7k/J/8/a8nxM
 gTvhUNOrrBd3GG8aecYlml4M5a9nu0x5kMDLtjO7AUpnePIBWqmbYse0D
 K/GzH29Q0G9jZegonZM5DT/Uf/nq4XlsHgWZS82wMNgS9EMtC81X/gqOB
 tJ9LywlSq984x9w7bnhdej0+0eycMeJNfedtGWZ79EQwfoVyt7+uqPHag
 NgL5SlgOmeeMz1mLO8bVM77qJ2/3FkawOYQR5oGSCN9iRzYX8xaGgVKkM w==;
X-CSE-ConnectionGUID: 6K5N54nNQnKatmTHhADedQ==
X-CSE-MsgGUID: Mw/Pd/jxQ8mvjYtWHoaPGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="75263243"
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; d="scan'208";a="75263243"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 19:00:16 -0800
X-CSE-ConnectionGUID: tDr7Vz6eT0CGApxngmI0MQ==
X-CSE-MsgGUID: i6liZ9oYQ1ueU00804y4yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; d="scan'208";a="219283978"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 19:00:16 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 19 Feb 2026 19:00:15 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 19 Feb 2026 19:00:15 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.57) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 19 Feb 2026 19:00:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mHZ7DVWs5BacMGi8/6nFCvES4QJZVnlFQbLVA/WHkErIWmNHXOEqYvGe+uJVPu9J7x2lJ15F1pd4HAKaaeb9u/fOTDh5Pea64r0/mwWAIw+bmw2fEQ/nOOqepUV+kGdP9y2LYtTz6O1N6QgtpqHqXh5Ywj809KdAiBHn2F000pcQM1pHGLZpsFJBr0BRwuOS89sXa0nKQ6A/0M649zZtYf17WqPhuP5cvjdoup1+YfyWytqhHB/Z9EEd6d9jzC4hzlrhV3+eM2Sk1pcKcpyH/robkHXR26uGnz9kuyKmfh+bLYFvfl8gaAaZv9YhqcUGXqDBiHcpOSUx2ea3osuK7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p24MD2ESulPMV0NrUVN0feqMsa2zzaUODT26nRT7r6E=;
 b=IEngdCXbQCOystkCKTP7lljIlNFFn8zE/PvG0n+Zwlf+RQ7ycj7Bx1e4OjvO46Ei8nBr7iUbw+TAnmCUhawBP4F8XxtG0KZIDCxnCy3X6ravs/pvRNxU24ZUNgzqywklAGo17al8QuxqFpS990cW1vvL0zEsOUNqRRglV1WB9DrflFTUwIfBMBtdj7p0WD9ALwPJPY1oGR+cmMsCcFBoEuc/P/cZPVUpOJQLFQYdgPOvjXg0CXxzg2sE0Ca7mLpp5S9MoE0yW9iDCvAyNiLqQ9ZBSf0cohgtKF+lsZalKQe9or4CUjm8iLzg6Km2K8Mxmssfjtn/cbHEg7g4Pt27NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by PH7PR11MB6425.namprd11.prod.outlook.com (2603:10b6:510:1f7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Fri, 20 Feb
 2026 03:00:13 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::68b9:ea3c:8166:3cc4]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::68b9:ea3c:8166:3cc4%4]) with mapi id 15.20.9611.013; Fri, 20 Feb 2026
 03:00:12 +0000
Message-ID: <cd2e1c87-b0e4-4123-a1b7-88c86722e088@intel.com>
Date: Fri, 20 Feb 2026 08:30:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915/vrr: partial revert of
 dda7dcd9da73c5327aef42b89f0519bb51e84217
To: Benjamin Tissoires <bentiss@kernel.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, "Joonas
 Lahtinen" <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>
CC: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20260218-wip-fix-iris-plus-v1-1-e6b969defd6d@kernel.org>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20260218-wip-fix-iris-plus-v1-1-e6b969defd6d@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1P287CA0010.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::18) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|PH7PR11MB6425:EE_
X-MS-Office365-Filtering-Correlation-Id: ea48aa42-d503-4266-c49f-08de702c2a51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b0dNY0RXMVpLZlljdXZTUDdicDRlMjVEbDhLVC83bUYxcDlYOHVTZ2VXY0xY?=
 =?utf-8?B?QlZhRkcxc05jYWd4OFBHZGVQNXpPVWg1NUU5SElSZkFoK3grZWR6WTFBdXNX?=
 =?utf-8?B?TUF3NTdCUVdxbUQxUVlhUnkvUXZjT1k5V01tekdiaXAzTDlIV3AzcHBEK1hI?=
 =?utf-8?B?TTZuRGhSVVk5ZVpUcDFvUTRYUUdpVnBxMkUvU0IzS2tFalBUbHEraXpxTDY3?=
 =?utf-8?B?UENZQkFhNTBpakFKWEE3Wkx2aXgxR2hCVXlMZHkxZXIzYzA4dVNEK1phOHVB?=
 =?utf-8?B?cnFGaUl0UDVtNTJCdjZOU1lJMWlMbFh4ZGp3UmdrMnFhT2pFa09NL0NkY1U5?=
 =?utf-8?B?VnFUTkJNVGFOYktVaTZzOFYxV1ZYd21vdkVraVBjcitENXc2YzRMTFJFRC91?=
 =?utf-8?B?S0ZkZktKYWFWcEpCcGgzODl4OXFzNVVMRkVGQ2ZJcFZwcG9vTXBuODgrUDU4?=
 =?utf-8?B?VzdUcThxOGVsQ2NRWE1aQjM4alhONk9qR1k3bENCK0hoV2xrM25Tbkd4ZmpI?=
 =?utf-8?B?cjN1STZScXczWVc5OUM4cDYwTUU4eG9VRW56UnprRkR5U0hqSkxGaG4yZzFP?=
 =?utf-8?B?R2hVbE90Sy9DN3dnaWVHcjFlUmlmaTBvcDQrQTZ2ZEFrRitlc2hKTXJnRjJ4?=
 =?utf-8?B?dVNCZS9aOHJnVXlLaUZ3T1BLYjcrUVEwOEpEeUVoOXdoVGtxbEhpZDR3VzRj?=
 =?utf-8?B?QUNFM1BiTHlXMzltVWRGYWd0aUljdUE2ai9MUE1PVWF2ZnNZZGREejNSZkpB?=
 =?utf-8?B?RzhQTlNqMjRaUkl0SU9hLzlFazN6b1pzeW5oeGxpUXl1OHZEQi8rMEdSdVFJ?=
 =?utf-8?B?N2tDajcrNzZYbHBzNEtFTmVyUTkxNjJKVW9qb1pRTUFNMFJwSHR4THQyZC9M?=
 =?utf-8?B?TFU5MmV4dWMvZlQ1SkQ1Z1pQWFdvME0yd3dJVDBpT1R0SVVodU80Rk1LUWIx?=
 =?utf-8?B?QUU0cEwrVlNXZ2srWVVmamhBekx1TE12SG1LOHN3NXpiZ3MrK1NCd0psL3p0?=
 =?utf-8?B?UDAyTmZhUG5mRDBZSHp6SWVaVTFacFg3OWZEL3QrdFBmZ3ErZXJJRkVGVXVa?=
 =?utf-8?B?Q3J6ejlKZlAxdmZFV240YnF4V2xBM0h3MmVqTUE2UFNZU05QVjdYTVhxMTh1?=
 =?utf-8?B?Z0U5UUlXQW9lMEhBNnNrWmhEYWFWYlJVWkZJSVlpdEw0NVIvVm9Nck1uVm9S?=
 =?utf-8?B?T3dhQ2ZmOFMvSnZPblJxSzQ3ME50dHorcVFhdkt2dWNwRWRBalFuZ3VIT1Zm?=
 =?utf-8?B?ejFBakNWeGxIdXNFTVN4N0ZhU1ZiRXkyU2VMN3p1SW55L1N3SExnc0s4N1I4?=
 =?utf-8?B?Y0xKbFFyYUJQUnl0dkF3TDB3LzZUOWs1OGsxeEJDVXFJVVJzOTc0U0M3anNl?=
 =?utf-8?B?aEUwdy9JcVhxTFFzYTQ2ZTFMR2EyTit2S0hJL0d4VUNDdTN1Sy9CalUyZnJu?=
 =?utf-8?B?ZitxMVEvTDRocmhQVzgxSU9UdFgzdFZwVFNlVlNpT1E1VmdqTzBja0dvWE5w?=
 =?utf-8?B?cTFadi9WaSt6dWdYNXBSaGpzT2lyN3I4NUtwSTg2NUVCcjdhLzFVZmRvWUty?=
 =?utf-8?B?b0ZaYVV3cHIxOGVpSmpxaVJXbURaMUFUSDZyOTRxL2VhNHk1OUpudWdrUWhk?=
 =?utf-8?B?S2lnaDFVVERpWXJyTmFJa3EzbXg3VGxmT1JzejlmZlFOc3NQMElHWXRaMHg3?=
 =?utf-8?B?aGJBcitnUjU5TUpmTk1aTG8wS1dsZUdhWHlBcmplN0NWVmI3UUFxMkNHS0pn?=
 =?utf-8?B?S1Zva0JQeDVOVzV1WkRDRjBKczBRUTEvNWFNNzBsM2FWK0ZwWnNZQThLTG1y?=
 =?utf-8?B?Wkh6K3U5TXNoM09pZGJzNUlNaDVHRjhRRUY1UmoyNzNRRU5ud2FuNVJrMmJq?=
 =?utf-8?B?aHlUU1VodzhYNlh6aW9FNHlQb0ZCVE16azhrYzk4SVliZjFGVWlvZDBvdXRt?=
 =?utf-8?B?NkllMDhDNVZiYWhtN2RpZ1FGaHhITjJrUDh6LzdpZVkrSTVsK1BLbTVCS2Z4?=
 =?utf-8?B?dVlGK2JXVWNaOC9la0dLdDcrM0JJWFA1Z1ZrWERZT1ZPK3RSZGNuUVBKS3Jr?=
 =?utf-8?Q?gIHyFU?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RDJZeWs4dTNmRldlSkE3cFBZbDdhUHMxWGJrQUF1U0k3SzVENXVRV2hXMFZq?=
 =?utf-8?B?MEJmU2Uxa2VKNXA5SzFZcE5LdmVPeVkrSGp5SWdqMW5mR0duL1cxQ2tWYUc5?=
 =?utf-8?B?aTROYStUUUw2cjdwVStOQjVYclpidWVSMFZlcURHKzVsUzdzbjdub1N2OE9r?=
 =?utf-8?B?SjdPazFrc0FGYkhISC95QjBSem15Zm8wa3hwT1JieEE4Q3ltTVdzcGRSQ1BB?=
 =?utf-8?B?V0lhLys1S2oxYjY4b1NacXJtQ2ZYeTM0eUlYbzJPcE1IRjVIY0k4VUNiQ0d4?=
 =?utf-8?B?QndwbHJKaE5LRWd2QjREVnczckF0VWNURmtGanpYd1RlMWdHMWhYY20yQ0Ro?=
 =?utf-8?B?UXJybnc1YVd5Szlhd0dPSDZ5SjVVZ2E3c3VESTNhNERGRjl0QlR1VExqS2Rt?=
 =?utf-8?B?Ry9KTXFWdzJnZytTeHFKcHBWT282aldWdHZoOXZpQk9MZExKcWVxclJrZUFC?=
 =?utf-8?B?aE9lSW1seXVZL01uWnhrRk91NWkzODJtQlRVT0hab28vRC9CNG5JcWdWSkVB?=
 =?utf-8?B?R2NPZlJVdUNDaFRFSWoxdGV2cWpXQk9MYmlMaGhZU1poZ1lmcDBRWDNjVTQx?=
 =?utf-8?B?YTdKM1JVenlaeTM4V0Q4VGdwZ2lwYVd4WVZOVXhjM3RWZ1lEdzZ5NEorSWVW?=
 =?utf-8?B?aU5UNEhacUh2ZDMyZHNHWE5ZWmttRDhaUlZYbjlPUkdzRDNVNlJQekdmUmRS?=
 =?utf-8?B?azlXdGRMTVRjK1E5WlpiYVRnNThvQnVOQ3BHa21UMm9YcEwyMWY2bzh4T25n?=
 =?utf-8?B?bjVGWkk5RkVCWEVpQytwajFQWDg4QWQ3RWN3U1N0RVV5R0lkRTJ4ckNJNjY1?=
 =?utf-8?B?dmx6OC80U0p2S3lyci9vaG5LOE8wVElhUEFrMGZzeFlTNTVJem9SU2RDWDA0?=
 =?utf-8?B?dk5sZ0VwNmlJY2hzall2Z2g1dkkvRjJJTi81bmdQVmJxbnlZZG1nMzFkdkpX?=
 =?utf-8?B?bnhQekxTWW1PckNvYTFUdmZ5ZmVUOFl0Yk4vT0huSFd2S1UrSHh3aVRlTUpw?=
 =?utf-8?B?ZHZoQ0dwMGV2U0Q3TFU1b2Z0dk1LbHZpS0tUbC9QV1pwaXNEaVVFTDV2US9I?=
 =?utf-8?B?NnBFb1puRlU2Zm9QZDVxU2h2TE5BNDF5T25KZit5dE1EcitXTE5DUGs0eTVZ?=
 =?utf-8?B?Q1NzZUdoOXdIeERpS3hyS1RiaDVObHE2QnVsY2pla3R1TytMcDJuZEVTVXkv?=
 =?utf-8?B?RTZQMFpXd0FxSDhRUXVHYUluc0dOWDR2ZTZXc0RYQVd2Y1l6d05FSTlUMW12?=
 =?utf-8?B?MTVzekxrZ3BORkNhTmZVYU5JZ3Zrc1I4bWZUVnpmU0N4Wi9pUkQraGN4SmFM?=
 =?utf-8?B?VGp2dnVBcTlkN0FvQU96L2w5dldPYWtGVjBZdDlqZ0xjYlVUMkhwMVFpNDlB?=
 =?utf-8?B?bnFSVFowbmZzYmpzbVo3MTEvWEdJRWZpM2tCTmFHd21Ic0xKdFZpMi9FeHM5?=
 =?utf-8?B?TnAySnJkUzArRWMxV1Bkb3M2UDVuRHZPUmNsU1pMSDMwRXdQQlNwbmRwYURx?=
 =?utf-8?B?NXpUSFExWkhrcS9qeHQ1c2NFYXhXKzN5OVowQ080S3lYbGdodlJGT2gxRjBE?=
 =?utf-8?B?bnhjakMyUWFWT29CMVBmeE5DcUs1RjZRV3JMTmFrNXY3alN5T0hvbzhGM2cr?=
 =?utf-8?B?RlRIQVpUR0JEQ0FtRDZEb2REc0RpdXdUeGJnQkhhNHBaZ21iUDA4YVlVcTZJ?=
 =?utf-8?B?TDdna3FXYU9STDV6K3hNRWdETlo5bFlEZ0NjbW90Z2FKakVMbHZuMDh5OHJF?=
 =?utf-8?B?VTZYUW1JZVRYbzBXSHRGcDdGQ3N0ZFBJTEFRMnlKdzJKQzlSbUxMaTRUcm5P?=
 =?utf-8?B?T2cyRzZPRU95am9IdkxVb0wzOFcyM3VFUTVqbEhYU3pIdkZaSFMxUG9nMHZh?=
 =?utf-8?B?QzdWSHhFdjJEN3NzWUV1R1JKTzFHMW5TNVZOamFhZ01zRlRHVGxSQXpPSmMr?=
 =?utf-8?B?ZHVsZjdQb01yL1hHdk1iU0IxS2xKMTNJeW9zT2V0N1FLWWowK3RnaWpvVDVD?=
 =?utf-8?B?bm5LV2tqMzZUY0V6cWNCUGJtM1ZDQW9CVDNIOEEwRVZTcFpndk83VUZRSFZu?=
 =?utf-8?B?TEdLbEJnQVJqcUYvdEdlaEUrWUFGWDN2OGxja3dPU1k0RzdFRVNneXFVZnJW?=
 =?utf-8?B?NklkVVFDM2pDV3M1UXZVS2MxRDNDR28waThjcW02MmJidmQ5S0VtNW9ONDBy?=
 =?utf-8?B?K0tiZGdDTmd2UVMzY2lzL0F6aElONnhJRGZhTGFXWXlGaktaZ1dsM2ZpVklD?=
 =?utf-8?B?bThqSm5MMStSYURmaDhJamN1SDYrN1VSQWE4d2FlZVd5a3NHWlBzTjUxOENk?=
 =?utf-8?B?T21INUNOd3QyMnE4ZGhRVXREU3NuclJ4UzJxejZFRG5sNWFCRzZNankvT3B0?=
 =?utf-8?Q?1CXER5LFp+Gek7Aw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ea48aa42-d503-4266-c49f-08de702c2a51
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 03:00:12.7512 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B506uPz34HB8kg8ccV6DTSnE3i0cENwaa+Tkgayi5w8scqskJJHn25g8M3RLsdMaDQfhHuWfN6Wp0mdN13jTIOajJ109je0u9F2vgoMnqvg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6425
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pages.freedesktop.org:url,intel.com:mid,intel.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,intel.com,ursulin.net,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ankit.k.nautiyal@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 9196E164551
X-Rspamd-Action: no action


On 2/18/2026 9:53 PM, Benjamin Tissoires wrote:
> Commit dda7dcd9da73 ("drm/i915/vrr: Use fixed timings for platforms that
> support VRR") introduced a regression on my Ice Lake laptop with an Iris
> Plus G7.
>
> The screen can go blank (screen lock or just idle), but if I try to wake
> it up, there is an immediate kernel lock. The netconsole was really
> unhelpful here, and a bisect gave me the commit above to be the culprit.
>
> For reference, the netconsole I could get was:
> [  103.553110] netconsole: network logging started
> [  125.642395] mce: [Hardware Error]: CPU 0: Machine Check Exception: 5 Bank 6: ba00000011000402
> [  125.642400] mce: [Hardware Error]: RIP !INEXACT! 33:<00007fa4471665ec>
> [  125.642403] mce: [Hardware Error]: TSC 38282e339d
> [  125.642404] mce: [Hardware Error]: PROCESSOR 0:706e5 TIME 1771365482 SOCKET 0 APIC 0 microcode ca
> [  125.642406] mce: [Hardware Error]: Run the above through 'mcelog --ascii'
> [  125.642406] mce: [Hardware Error]: Machine check: Processor context corrupt
> [  125.642407] Kernel panic - not syncing: Fatal machine check
> [  125.642415] Kernel Offset: 0x1d400000 from 0xffffffff81000000 (relocation range: 0xffffffff80000000-0xffffffffbfffffff)
>
> and then the backtrace lead to the netconsole in itself.
>
> If I restore the early return when vmin >= vmax (in my case vmin==vmax),
> then I can use my machine again after it goes idle.
>
> I have strictly no ideas if this is the correct solution, so please take
> this with a grain of salt, but this is effectively preventing me to use
> distro kernel since v6.16.


Hi Benjamin,

Thanks for bisecting and getting the problematic commit.

This seem to be an issue while trying to fill few VRR related stuff. 
Your change effectively makes an early return from the 
intel_vrr_compute_config(), probably avoiding setting those VRR related 
parameters in sw state.

To understand the issue better and to debug further I request you to 
file a bug for i915 in gitlab [1] . More details in [2].

Also request you to test with the latest drm-tip : [3], and attach the 
logs from boot. The link [2] has the necessary details.


Links:

[1] https://gitlab.freedesktop.org/drm/i915/kernel/-/issues

[2] https://drm.pages.freedesktop.org/intel-docs/how-to-file-i915-bugs.html

[3] https://gitlab.freedesktop.org/drm/tip/-/commits/drm-tip


Thanks & Regards,

Ankit



>
> Signed-off-by: Benjamin Tissoires <bentiss@kernel.org>
> ---
> I've been experiencing this bug since kernel v6.16.
>
> System Information
>          Manufacturer: Dell Inc.
>          Product Name: XPS 13 7390 2-in-1
>
> cpu: Intel(R) Core(TM) i7-1065G7 CPU @ 1.30GHz
>
> lspci:
> 00:00.0 Host bridge [0600]: Intel Corporation Ice Lake-LP Processor Host Bridge/DRAM Registers [8086:8a12] (rev 03)
> 	Subsystem: Dell Device [1028:08b0]
> 	Flags: bus master, fast devsel, latency 0, IOMMU group 2
> 	Capabilities: <access denied>
> 	Kernel driver in use: icl_uncore
>
> 00:02.0 VGA compatible controller [0300]: Intel Corporation Iris Plus Graphics G7 [8086:8a52] (rev 07) (prog-if 00 [VGA controller])
> 	DeviceName: To Be Filled by O.E.M.
> 	Subsystem: Dell Device [1028:08b0]
> 	Flags: bus master, fast devsel, latency 0, IRQ 188, IOMMU group 1
> 	Memory at 603d000000 (64-bit, non-prefetchable) [size=16M]
> 	Memory at 4000000000 (64-bit, prefetchable) [size=256M]
> 	I/O ports at 4000 [size=64]
> 	Expansion ROM at 000c0000 [virtual] [disabled] [size=128K]
> 	Capabilities: <access denied>
> 	Kernel driver in use: i915
> 	Kernel modules: i915
>
> Again, I have really no idea if this is the correct fix, but it would be
> nice if the issue could be solved in v7.0 and backported to older
> kernels.
>
> Please tell me if I need to provide more information.
>
> Cheers,
> Benjamin
> ---
>   drivers/gpu/drm/i915/display/intel_vrr.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
> index b92c42fde937..3d16dd4611d9 100644
> --- a/drivers/gpu/drm/i915/display/intel_vrr.c
> +++ b/drivers/gpu/drm/i915/display/intel_vrr.c
> @@ -377,6 +377,9 @@ intel_vrr_compute_config(struct intel_crtc_state *crtc_state,
>   		vmax = vmin;
>   	}
>   
> +	if (vmin >= vmax)
> +		return;
> +
>   	if (crtc_state->uapi.vrr_enabled && vmin < vmax)
>   		intel_vrr_compute_vrr_timings(crtc_state, vmin, vmax);
>   	else if (is_cmrr_frac_required(crtc_state) && is_edp)
>
> ---
> base-commit: 05f7e89ab9731565d8a62e3b5d1ec206485eeb0b
> change-id: 20260218-wip-fix-iris-plus-28a916221bdc
>
> Best regards,
