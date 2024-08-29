Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1D0964BD4
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 18:42:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9667C10E0B0;
	Thu, 29 Aug 2024 16:42:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hm7YQT2Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B302510E73F;
 Thu, 29 Aug 2024 16:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724949740; x=1756485740;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=3RTrxJV5iLMW2S8JmjUZjaTShKhK1QamKiqxQ0pAbrc=;
 b=hm7YQT2QN11N1TJl2cUOIh1Spz32Rr/K2O0VZiuYE3FeWPK2+Gsky8iR
 M7Vche+WpSYpO97d0DASh2Y/KOS4KbssuAUbvPkvtkeIwzUB72xKFtSZW
 H/uKOXwFlcj/j2OZVrxSPyHMES4br1wXB7Efjz0LyBUTFhLSzQFdFbuMu
 baxMH7+obUNrzO/3G37aDtoBZbiHTGnx+WhxwFJPY4sU8/KFeAC3jAkNY
 n82bNhVjTuzzcbmys4bZRglw+yYI/OYuP9FPFjiW7nPTt1G7EThfphtJU
 Ttzo86/he6x0pKk/f5IWZT5IGMqx9YBUqFXCN3809rsKIFs8u5gFPOt/D Q==;
X-CSE-ConnectionGUID: wMgvMEQgRi+ehbn99nBQLw==
X-CSE-MsgGUID: wB2aT5CVTkqu9Vo4Jy/LvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="34222921"
X-IronPort-AV: E=Sophos;i="6.10,186,1719903600"; d="scan'208";a="34222921"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 09:42:19 -0700
X-CSE-ConnectionGUID: Ua/6/d0xSPicDePVYXuE4A==
X-CSE-MsgGUID: VU4wwKk/SE+SYtcIoFUVag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,186,1719903600"; d="scan'208";a="68525684"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Aug 2024 09:42:18 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 29 Aug 2024 09:42:18 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 29 Aug 2024 09:42:18 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 29 Aug 2024 09:42:18 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 29 Aug 2024 09:42:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z7kEKNnDtqOGsso+qSNY0h6/shVgdN9rUSogK43p6R63NCy9+9razex1KPY06dO82aUVNJdiXwLFFt8QQ6YY1VwKte4MiVCxZ+HASfw4FTJMCsBFmab+dzHaFDEBr8bxP0yX4IAG0T3DEOfZFTKpodANOBnVHa6sM3hnzBP2fZyuOxCr6248wSzpflvnxDP/PoFxtvKjE9vtnZ/LW6tH27FZU+xepKcEQ7xd4rpSpxADDk6/ioVRTxWgdPPbc6rRLWnNb1SMNA3ZLzWVBY4SQbJzo4mQtiFsR6Kd+cgrju+SCABNORbuM119aK5YUzDUPnjaVRHzR7pU9LzG1xZ3Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dsUBlHGPXJJAE8j+S4ZRJdJfpIS+h8ddMxux1Fa8cDs=;
 b=L8ZlnNPT6uYA3T8h/gn4QFDzF/bEk7O8mucbDPU6yAYGM/Zi4Gtt0XxMQM94d42bq47jEXzPrM+H3PFSrrtN9z6lw74DPDIqN2FozHZZDV7qU6SMKbzAiUG6lnvst/pmCyYIMpYjDsCtdAUui1bd/XptIEr+jp/OUO/VjkM/2h4QdPUnD2PBFZdV+DxLO6biEN7x+WX9dp0Tr4N/2BucZKa9eUIMYY32Xo/ocHICzLeF2ztN/E1xQN5rTeu7Es6wQlPdpGHsuFp2Fm+pFsiZh5mFC+ped4axCWy14k3WsuivcJyAUF+/0+zj/sBORbZ8LZZc3yZr0+z4pOEMx7TXFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CO1PR11MB4851.namprd11.prod.outlook.com (2603:10b6:303:9b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.26; Thu, 29 Aug
 2024 16:42:14 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7875.018; Thu, 29 Aug 2024
 16:42:14 +0000
Date: Thu, 29 Aug 2024 16:40:47 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
CC: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <thomas.hellstrom@linux.intel.com>,
 <matthew.auld@intel.com>, <daniel@ffwll.ch>
Subject: Re: [RFC PATCH 05/28] drm/gpusvm: Add support for GPU Shared Virtual
 Memory
Message-ID: <ZtCkj9GNM4CS5Ctx@DUT025-TGLU.fm.intel.com>
References: <20240828024901.2582335-1-matthew.brost@intel.com>
 <20240828024901.2582335-6-matthew.brost@intel.com>
 <Zs80t6LxPt2bXMPA@phenom.ffwll.local>
 <c1d455a7-f682-43ac-8bbd-af0727954d5d@amd.com>
 <Zs9FtNM/UVSSCAhR@DUT025-TGLU.fm.intel.com>
 <Zs9Pbnt0LObX0XDw@phenom.ffwll.local>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zs9Pbnt0LObX0XDw@phenom.ffwll.local>
X-ClientProxiedBy: SJ0PR13CA0191.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::16) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CO1PR11MB4851:EE_
X-MS-Office365-Filtering-Correlation-Id: 842042e1-b06c-4e59-2965-08dcc8498936
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R0EwZXo5aG1kTzVRcGMyVjhXKzVwM1RsdWI3VnNSVWRNZkV4a0hTSjNNU1Z1?=
 =?utf-8?B?WVlXekRJRWJQYVB2SUdPKzhBRGdib2Jzek9Qb1htblpHaWFySG1RS1VUVWtU?=
 =?utf-8?B?cUlFM0dvZ0pINUczV3hEM096RlZ5QWlRRFQwOC9aTHhieEE2ZlZXa3hneUR5?=
 =?utf-8?B?ZEhUemhhWnhkS3hNQVI4SVZmV3ZEVStFTmdiUnhNUEkzakFaL3ZnZHV0cGs4?=
 =?utf-8?B?K2xyc04ybC8xd05MRzV1Y1pZYXJMVzZBSTcxb0JGMnRNMEN2YzgxbmFZVUhZ?=
 =?utf-8?B?RDFrakE0UjVGMFczNjBKOVhGOUhjbjhRVEIwMzQ1VTZoYUlHamN5L0dNKzdT?=
 =?utf-8?B?TWhFalhxY0lOemdUZENnVFVjSGYxZ0lETDFqNjJXMXFpNUNZRTlpTnRZZlBa?=
 =?utf-8?B?OUxISG9KekFTZ2k0ZHVFVGdwQzgzWS80VFZVUm9hT05Mc1FHenlEZzVuY1RX?=
 =?utf-8?B?RkJuMGJQWUtSY002dXdSSnpOVXBZQ0V2alpaV1UzK3hHdnA5MjN4cWFqcFlH?=
 =?utf-8?B?aXBRbklrNEF4eHluWW42d1RvSStWUnlKc3NxR0hZbEtHNUNxc2pld3BtbEdm?=
 =?utf-8?B?V3I0WERkN1E2YWJXK3BIcG8rSWVCNzVjQUVMYnViTnRsb2Y1MTlueEs1RHFI?=
 =?utf-8?B?VzdtQkphemRIMjZlZXVuZ1c4ZDRqWkxXMktZcWVBcGNtVU1SWXBTVGh3bTUy?=
 =?utf-8?B?VzYrM0pHQ1AwWTZRS0N1MTlQdm9MeWRWdzdSaUlyTVlXNnd5ZUM3MmFySE5E?=
 =?utf-8?B?czU0RTJaaXF2cFVSb3NFR2JmNVNTMEx5cXQ0dkpNdEN6K282NStpK0RmdU5Q?=
 =?utf-8?B?RVRackxPU0dWUDZyWTM1QzBsa3l1RDhMeTJ3SWhvWmRUUVBlYy81elh0bFMy?=
 =?utf-8?B?NDlCc3BKMzNDNzdQT3N2ZnUzbGl2VjZvbFRId28yV2YxWUNGZEplS2NLc3I0?=
 =?utf-8?B?ZFJ0RlQwK3psWEc4OFUrWUdYZTd2RkcreHhWSENXYzhKS2N4Y0RYV0tZd0RQ?=
 =?utf-8?B?dTdpYU5TNDhHNnVveC84MTdJd3EvYmdVOFd1dDJObjNpTzJwTVFST3V0cnRW?=
 =?utf-8?B?b0dTdlZMY3pJcjBBUlBuRzVQakprbVFBZ2JlOElZSnVkbU15ZUpSaStFK21x?=
 =?utf-8?B?TTFJa0swVDh1RVhKeVFtSGcvTWFJeXNkd05rNjFoQjVsaWNHMHFvNGhXdnpr?=
 =?utf-8?B?Z285TXpGS3JiNHpRRWNJT1NWdGJuQXhBbCtuZ2FHQnVkSURFS1ZqaVlVandD?=
 =?utf-8?B?c05WN1BHcnhVT3lFNGxHSGhuMkVRUVcrRTVmcWZDTzkxQzJwZURMczFrcVJ3?=
 =?utf-8?B?S2JkeUJhR3RyTndyS09KcFAxTk5XanZ5azNUK1FkVXVzSGtzZ0ZQNElEL2ZR?=
 =?utf-8?B?V1FWMnU3K0kzZXJNMFZaR1A3OWphZjBkM1dyekJ5TFVjTVlYVDB3Q0lDVUZs?=
 =?utf-8?B?YjdxYUt3dngrMFJLelBFWlU3Wm9oeTBleWhNV2Q1UkZkQ2dFZmo0VkZIdnUz?=
 =?utf-8?B?N0N0OTcreDRvZTlaQmRRcjR6cmVwWEZ5WHA2L0pmTGdGbjAvbG9HRGRyUGph?=
 =?utf-8?B?Z1RvM1FmWWEvV29ZQXdhd1hpYXpHMFNJTFVySi8xLzJnMU1LZEtXVzgvRi95?=
 =?utf-8?B?SWYvU1pMY21JZVZYQ2JlZnRsOVNFS1ltT2Y5YWg5bzVHUGF4d01Lb1NsOFlM?=
 =?utf-8?B?NGsyRnd0NUNVQytsc24yN05JTVVTQ0gyd0IrdzVpMEVXLytvUk84eXozRWtu?=
 =?utf-8?Q?WG+WUAiJeMfzVqM0f8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?STU3Q2F2MkFiM2d1bWVlRUVCK0NsKzV2cnhxYUVhNTh2NmNMVUg1cHdmdjhs?=
 =?utf-8?B?RWl6ME1kbVllTUlTYzNkbkF5T0lIZ29IR2c5djJZUHRPazF2VFdrWkRSL291?=
 =?utf-8?B?RDNxVm1jM1EvM3F3K1Z2S1h6Vm5RaXNxeG1acDhGb2ZYWms2Uk9SWURFZzhY?=
 =?utf-8?B?M0FmNFZodTYvTnJ5RzE2WFZlcUt5eE5KSnM1bFBKRHQyRWR5NTV0K2lXT28y?=
 =?utf-8?B?NmhnMUR0eEJXbW1VcjczWVJTZWdVQk4zTytmUXpuUnNnWEVZek1DdXdiN0Vx?=
 =?utf-8?B?dVJmNG1XY3FOK2Jsc2VBNHl3Tk9rU1ZXQnFWblZVT29vRlp0VHNvRzFwNC9G?=
 =?utf-8?B?NkNqdjdsQnlBRlFyMyt3aVg0MUdkNTRYbEhSZ3pNWURzQkVRdXZZSTFQTzg2?=
 =?utf-8?B?MThQdDhhZE9pUlNSaHNlTm90TXI0eHEzVGNVV3dhT3BZUDZQRWJKeDB6YnZ1?=
 =?utf-8?B?Yy9IM1hxVVZvVFFZeHVUTGhETkoxQ3p2U2IwWkdaRlpUZHhBOXYwaEFIcTVE?=
 =?utf-8?B?cG5NcW80QWhMa1Fmams2UDdHeFVHNHN0cENPQkJxdFovTjVnNDVycGV6eGhz?=
 =?utf-8?B?NUtFTWNZVDNCaXl5RFBDSm1keHBTVmNBS29uaDQwSUFHNVJiTzdzRjdid1ZT?=
 =?utf-8?B?N1NUK0ZQWHpicmpySmRmWStKV2dGSFhmMHJ2UmkrL3dvSnVrQm4xK25YSW9R?=
 =?utf-8?B?c2xuYW0rdmJVM3FRZlRMNmhuMW1TOWY2SXZMd1JCRGJGUWw3WTBoTlllc3Zp?=
 =?utf-8?B?WTJJNE9pUHozcTZwVUVBQTdmZHl5VmgxWFN5VHdreFZPcTBtRjRLN08wVnRk?=
 =?utf-8?B?djM4SHZsVlN0T0dXMjhrRkdQcktrdU81UjY4R1M0bW9HMi9hTWhuTkNmS0ll?=
 =?utf-8?B?WFlQMnYvOHI5dGFmYmxlV1V3cGJ6T25JOHp6NG1CME9ObDE1V1RYNnFNNi9O?=
 =?utf-8?B?VjhlU0F4djR4MHpoYUdtUlNWUHhzdnRPYjRMcm5mallnLzN2V0lrcWJqY01Z?=
 =?utf-8?B?SzVIbSsydXFrWlF4aUc0K2IxYTFkV3VEY1ZJTlZPaHZwWDJjSFhEZ0tKUmpq?=
 =?utf-8?B?MVM4eVJLMWhpWTdVckt1ZVRNWnZlTjRwZ2NuOGprdGplWWl2ZEM5WUJBODVk?=
 =?utf-8?B?K2NaK21wNEZzSlBzOFhWUGxGcTZEMTFTdjAwZ0J3QVI1bzJJVTFXR1JTV1lF?=
 =?utf-8?B?N24weG42NHpSK04weU8ySVBsSHNLSTFrMXpRd0dqWXdTMDlOcnFrQTR0a2RT?=
 =?utf-8?B?ditqNXdSdnIxcWRiZDNZSGhVc1FRdnJ2OSszbFUvMFM0b3VWR1IxZ3RsemJn?=
 =?utf-8?B?Z0QzdWJPajM5VWxhUjVTZ3FuOXd2bHFxZSttRVhpOEhINkt4b3NtSnpKWUFk?=
 =?utf-8?B?bm5PRG9rRlc0bkZsL2I3d0RvR1JxSlRkR1RSUVVCZE0yNC9yRHdQeFZZdHhX?=
 =?utf-8?B?Sm5HMm83SCtkTS94ZFJ3enBaQ2M0OWN3bDZuZFZadGNTckEyNHhnLzhPR2Yr?=
 =?utf-8?B?dWVsY0JzOGMyQ2RMZ3c4THYwQTl3MkZyWlF0Z3RacXAzVWxwT1c4ZVhyVnNI?=
 =?utf-8?B?a2FadGNRYlV6bXp1aDVCWGF6aWpnaTVTZldTZjlFY1N4OG9rRkxpdStVa0da?=
 =?utf-8?B?SVNLOVdQeXhpSUZHNzUvdkZZeVVuemdkZlRHbmRBeUJZcUkrODUraWFneWFH?=
 =?utf-8?B?ck4wcW5XM1pRSzlHZFpaRlpLWm0vdC9DR1hmVlRJaDYzVTRlS3hsYm9FMlVG?=
 =?utf-8?B?SmpuNzI0RFpraU91cWlDdXpDelZGTklMR2ZRUVZnb0ZkN2VYeE5NQlVtYnRX?=
 =?utf-8?B?TFQrTTNzenBQQjgvRmQ2d2dja1RNaXZGeGtINC9Sa1RhdWhpN0tWbnhadnc5?=
 =?utf-8?B?c1BtMTFqcGhJWDJsNFZUcUh5MnV1b0hHU052eE1HRk9kMzlFTkVUd0xSNk1T?=
 =?utf-8?B?QWhFempnNnRWaUlqSVNVMEM1Y2V2TjRCWUtqaldNVk9scDZhUGU2Ri9sd3cx?=
 =?utf-8?B?NWZSNno1bHR2YTU5LytqTDVZN0tJYmdkRWptYSs4bXN2OVlJVWxrZ0pXSHZm?=
 =?utf-8?B?Umh3V1gwb29wRHIzbHZqUE5IT2FZOGFDUDNlUGZXU2JMQms4WE1LNkJwTkNB?=
 =?utf-8?B?YkwvRU1PVUNvR1VkQUNpTCtOMFR6NVk2K0Z1YkNVeEdTWDMrRkVaMG9NMzcr?=
 =?utf-8?B?MkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 842042e1-b06c-4e59-2965-08dcc8498936
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 16:42:14.1368 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fK2WKdHmGbGjeqO3PiwTlJXGts/ylKLk5yR0ffpAbexNOWcwb5aQaB+c2hRQtXsLJBIEzZKeOSF60izlZs4LxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4851
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

On Wed, Aug 28, 2024 at 06:25:18PM +0200, Daniel Vetter wrote:
> On Wed, Aug 28, 2024 at 03:43:48PM +0000, Matthew Brost wrote:
> > On Wed, Aug 28, 2024 at 04:46:24PM +0200, Christian König wrote:
> > > Am 28.08.24 um 16:31 schrieb Daniel Vetter:
> > > > On Tue, Aug 27, 2024 at 07:48:38PM -0700, Matthew Brost wrote:
> > > > > +		if (!ctx->mmap_locked) {
> > > > > +			/*
> > > > > +			 * XXX: HMM locking document indicates only a read-lock
> > > > > +			 * is required but there apears to be a window between
> > > > > +			 * the MMU_NOTIFY_MIGRATE event triggered in a CPU fault
> > > > > +			 * via migrate_vma_setup and the pages actually moving
> > > > > +			 * in migrate_vma_finalize in which this code can grab
> > > > > +			 * garbage pages. Grabbing the write-lock if the range
> > > > > +			 * is attached to vram appears to protect against this
> > > > > +			 * race.
> > > > > +			 */
> > 
> > Thanks the comments, replying to both of you inline.
> > 
> > > > This one is really scary, since it means the entire migrate pte trickery
> > > > is essentially completely busted. Grabbing the mmap write lock just means
> > > > you block out pretty much everything interesting from concurrently
> > > > happening.
> > > > 
> > > > My gut feeling says we need to figure out what's happening here, because
> > > > this looks a bit too fundamental to me.
> > 
> > I agree. I haven’t looked into this issue for a couple of months but
> > really need to understand what is going on.
> > 
> > I should have mentioned this in the cover letter: the goal of this
> > series was to produce something for review that is stable and supports
> > UMDs/user applications. It was not intended to be presented as a final
> > solution. This issue certainly falls into the category of "needs to be
> > understood and requires a proper fix."
> > 
> > One open question I have is whether the test case that triggers this
> > issue is even defined behavior. The test creates concurrent access
> > between the GPU and CPU to the same memory address, resulting in GPU and
> > CPU faults racing against each other. It’s possible that this is
> > undefined behavior, so data corruption might be acceptable—i.e., the
> > kernel can’t crash, but incorrect results might be permissible.
> 
> Yes this is supposed to be defined, at least from an hmm pov. And core mm/
> is ridiculous in how many races it allows, especially around concurrent
> fault handling.
> 
> It is ofc really slow if every fault results in a migration, but that's a
> matter of the application setting stupid memory migration hints for the
> gpu.
> 
> > e.g. This is the only defined usage model:
> > 
> > alloc_memory();
> > start_compute_kernel();
> > sync_on_compute_kernel_completion();
> > read_memory();
> > 
> > Hopefully, in the next week or so, I'll be heavily engaging with the UMD
> > teams. Development can then start, and applications will be running soon
> > after. This will allow us to address issues like this, collect data on
> > memory usage, and verify some of the assumptions I've made, such as
> > optimizing for 2M+ allocations.
> > 
> > > 
> > > I think I have at least a high level understanding what's going on here,
> > > Felix and especially Philip should know more of the details.
> > > 
> > 
> > I meant to reach out to AMD for issues like this. So, Felix
> > (felix.kuehling@amd.com) and Philip (Philip.Yang@amd.com) would be good
> > contacts?
> > 
> > > In general grabbing the mm_lock to protect PTEs from changing is completely
> > > nonsense. The mm_lock is to protect the VMAs and *not* the PTEs!
> > > 
> > 
> > Thanks for the hint. I believe that in the AMD implementation, I noticed
> > some additional locks for migration, which might be how you mitigated
> > this issue.
> 
> Yeah, so in general hold mmap_reading is indeed pure magic thinking for
> preventing pte changes, like Christian points out. It doesn't stop
> invalidates, and with the per vma locking it also doesn't stop new valid

Invalidations happening to parallel to migrations, get pages, or
bindings should be fine. The notifier lock usage should make all of this
safe.

> ptes from being inserted at least for anon memory.
> 
> Except migration pte entries that point at vram pages are special, and are
> _only_ resolved while holding mmap_read. Which means holding mmap_write
> for the case of looking up our own vram pages with hmm_range_fault
> actually prevents issues. And so this duct-tape of holding mmap_write very
> much looks like a working hack to plug any races against concurrently
> ongoing migrations to system memory due to cpu faults.
> 

Agree holding mmap_write is a hack. Looking at AMD 'To serialize concurrent
migrations or validations of the same range, the prange->migrate_mutex
must be held.', seemly I could drop mmap write lock abuse and use
something like this here. The would like be an inner lock of the mmap
lock.

Does this seem like a reasonable thing to explore?

> An even more fun corner case is multiple concurrent cpu faults on the same
> vram page. fork gets you that, or maybe a bit more reasonable mremap with

My understanding is memory shared between processes cannot migrated due
to current limitations migrate layer.

e.g. mmap called with MAP_SHARED is not eligible for migration.

Unsure what the behavior is fork() is called on a process with memory in
VRAM and the child tries to access it. Maybe fork() is different than
MAP_SHARED where as parent / child processes can share memory in VRAM? 

Also really I'm unsure what would happen if user space calls fork() and
has an Xe VM open and tries to use it too. Before commenting more on
this, I need play around with test cases like this educate myself.

My current test doesn't use mremap, agree that would be to good add.
Again before commenting more here, let add more test cases to educate
myself.

> MREMAP_DONTUNMAP | MREMAP_MAYMOVE. I think just hammer the same va with
> multiple threads along isn't enough, it's better to have a private va for

I do have test cases where multiple CPU faults from threads hammer the
same memory. Found some bugs in my initial code but as far as I can tell
multiple CPU faults in parallel occur in my testing and do work.

> each thread pointing at the same anon memory page, so that you can get

You are losing me here - 'private va for each thread pointing at the
same anon memory page'. This is a fork() case where the parent allocates
memory and then all children try to read in parallel?

> more parallel faults due to finely grained pte locking.
> 
> Would be a good testcase to add, if you don't have it yet.
>

See above, agree these are good test cases which I haven't considered and
will expand my suite to include these. Thanks for the tip - IMO testing
is as important or even more important than the KMD design and need to
ensure I have all possible uses covered.

> > I must say it is a bit unfortunate that the HMM locking documentation
> > doesn’t mention this. I believe the documentation needs additional
> > information, which I can add once we finalize the solution.
> 
> Yeah, at least from my very cursory lock you don't have enough locking.
> I've written an in-depth reply to patch 23 with the high-level summary of
> my thoughts.
>

Will look and reply there.

Matt

> Cheers, Sima
> 
> > 
> > Matt 
> > 
> > > Even with the write side of the mm_lock taken it is perfectly possible that
> > > PTE change. It's just less likely.
> > > 
> > > We run into multiple issues before we figured out this important distinction
> > > as well.
> > > 
> > > Christian.
> > > 
> > > > -Sima
> > > > 
> > > > 
> > > > > +			if (vram_pages)
> > > > > +				mmap_write_lock(mm);
> > > > > +			else
> > > > > +				mmap_read_lock(mm);
> > > > > +		}
> > > > > +		err = hmm_range_fault(&hmm_range);
> > > > > +		if (!ctx->mmap_locked) {
> > > > > +			if (vram_pages)
> > > > > +				mmap_write_unlock(mm);
> > > > > +			else
> > > > > +				mmap_read_unlock(mm);
> > > > > +		}
> > > > > +
> > > > > +		if (err == -EBUSY) {
> > > > > +			if (time_after(jiffies, timeout))
> > > > > +				break;
> > > > > +
> > > > > +			hmm_range.notifier_seq = mmu_interval_read_begin(notifier);
> > > > > +			continue;
> > > > > +		}
> > > > > +		break;
> > > > > +	}
> > > > > +	if (!ctx->mmap_locked)
> > > > > +		mmput(mm);
> > > > > +	if (err)
> > > > > +		goto err_free;
> > > > > +
> > > > > +	pages = (struct page **)pfns;
> > > > > +
> > > > > +	if (ctx->prefault) {
> > > > > +		range->pages = pages;
> > > > > +		goto set_seqno;
> > > > > +	}
> > > > > +
> > > > > +map_pages:
> > > > > +	if (is_device_private_page(hmm_pfn_to_page(pfns[0]))) {
> > > > > +		WARN_ON_ONCE(!range->vram_allocation);
> > > > > +
> > > > > +		for (i = 0; i < npages; ++i) {
> > > > > +			pages[i] = hmm_pfn_to_page(pfns[i]);
> > > > > +
> > > > > +			if (WARN_ON_ONCE(!is_device_private_page(pages[i]))) {
> > > > > +				err = -EOPNOTSUPP;
> > > > > +				goto err_free;
> > > > > +			}
> > > > > +		}
> > > > > +
> > > > > +		/* Do not race with notifier unmapping pages */
> > > > > +		drm_gpusvm_notifier_lock(gpusvm);
> > > > > +		range->flags.has_vram_pages = true;
> > > > > +		range->pages = pages;
> > > > > +		if (mmu_interval_read_retry(notifier, hmm_range.notifier_seq)) {
> > > > > +			err = -EAGAIN;
> > > > > +			__drm_gpusvm_range_unmap_pages(gpusvm, range);
> > > > > +		}
> > > > > +		drm_gpusvm_notifier_unlock(gpusvm);
> > > > > +	} else {
> > > > > +		dma_addr_t *dma_addr = (dma_addr_t *)pfns;
> > > > > +
> > > > > +		for_each_dma_page(i, j, npages, order) {
> > > > > +			if (WARN_ON_ONCE(i && order !=
> > > > > +					 hmm_pfn_to_map_order(pfns[i]))) {
> > > > > +				err = -EOPNOTSUPP;
> > > > > +				npages = i;
> > > > > +				goto err_unmap;
> > > > > +			}
> > > > > +			order = hmm_pfn_to_map_order(pfns[i]);
> > > > > +
> > > > > +			pages[j] = hmm_pfn_to_page(pfns[i]);
> > > > > +			if (WARN_ON_ONCE(is_zone_device_page(pages[j]))) {
> > > > > +				err = -EOPNOTSUPP;
> > > > > +				npages = i;
> > > > > +				goto err_unmap;
> > > > > +			}
> > > > > +
> > > > > +			set_page_dirty_lock(pages[j]);
> > > > > +			mark_page_accessed(pages[j]);
> > > > > +
> > > > > +			dma_addr[j] = dma_map_page(gpusvm->drm->dev,
> > > > > +						   pages[j], 0,
> > > > > +						   PAGE_SIZE << order,
> > > > > +						   DMA_BIDIRECTIONAL);
> > > > > +			if (dma_mapping_error(gpusvm->drm->dev, dma_addr[j])) {
> > > > > +				err = -EFAULT;
> > > > > +				npages = i;
> > > > > +				goto err_unmap;
> > > > > +			}
> > > > > +		}
> > > > > +
> > > > > +		/* Huge pages, reduce memory footprint */
> > > > > +		if (order) {
> > > > > +			dma_addr = kmalloc_array(j, sizeof(*dma_addr),
> > > > > +						 GFP_KERNEL);
> > > > > +			if (dma_addr) {
> > > > > +				for (i = 0; i < j; ++i)
> > > > > +					dma_addr[i] = (dma_addr_t)pfns[i];
> > > > > +				kvfree(pfns);
> > > > > +				kfree_mapping = true;
> > > > > +			} else {
> > > > > +				dma_addr = (dma_addr_t *)pfns;
> > > > > +			}
> > > > > +		}
> > > > > +
> > > > > +		/* Do not race with notifier unmapping pages */
> > > > > +		drm_gpusvm_notifier_lock(gpusvm);
> > > > > +		range->order = order;
> > > > > +		range->flags.kfree_mapping = kfree_mapping;
> > > > > +		range->flags.has_dma_mapping = true;
> > > > > +		range->dma_addr = dma_addr;
> > > > > +		range->vram_allocation = NULL;
> > > > > +		if (mmu_interval_read_retry(notifier, hmm_range.notifier_seq)) {
> > > > > +			err = -EAGAIN;
> > > > > +			__drm_gpusvm_range_unmap_pages(gpusvm, range);
> > > > > +		}
> > > > > +		drm_gpusvm_notifier_unlock(gpusvm);
> > > > > +	}
> > > > > +
> > > > > +	if (err == -EAGAIN)
> > > > > +		goto retry;
> > > > > +set_seqno:
> > > > > +	range->notifier_seq = hmm_range.notifier_seq;
> > > > > +
> > > > > +	return 0;
> > > > > +
> > > > > +err_unmap:
> > > > > +	for_each_dma_page(i, j, npages, order)
> > > > > +		dma_unmap_page(gpusvm->drm->dev,
> > > > > +			       (dma_addr_t)pfns[j],
> > > > > +			       PAGE_SIZE << order, DMA_BIDIRECTIONAL);
> > > > > +err_free:
> > > > > +	if (alloc_pfns)
> > > > > +		kvfree(pfns);
> > > > > +err_out:
> > > > > +	return err;
> > > > > +}
> > > > > +
> > > > > +/**
> > > > > + * drm_gpusvm_range_unmap_pages - Unmap pages associated with a GPU SVM range
> > > > > + * @gpusvm: Pointer to the GPU SVM structure
> > > > > + * @range: Pointer to the GPU SVM range structure
> > > > > + * @ctx: GPU SVM context
> > > > > + *
> > > > > + * This function unmaps pages associated with a GPU SVM range. If @in_notifier
> > > > > + * is set, it is assumed that gpusvm->notifier_lock is held in write mode; if it
> > > > > + * is clear, it acquires gpusvm->notifier_lock in read mode. Must be called on
> > > > > + * each GPU SVM range attached to notifier in gpusvm->ops->invalidate for IOMMU
> > > > > + * security model.
> > > > > + */
> > > > > +void drm_gpusvm_range_unmap_pages(struct drm_gpusvm *gpusvm,
> > > > > +				  struct drm_gpusvm_range *range,
> > > > > +				  const struct drm_gpusvm_ctx *ctx)
> > > > > +{
> > > > > +	if (ctx->in_notifier)
> > > > > +		lockdep_assert_held_write(&gpusvm->notifier_lock);
> > > > > +	else
> > > > > +		drm_gpusvm_notifier_lock(gpusvm);
> > > > > +
> > > > > +	__drm_gpusvm_range_unmap_pages(gpusvm, range);
> > > > > +
> > > > > +	if (!ctx->in_notifier)
> > > > > +		drm_gpusvm_notifier_unlock(gpusvm);
> > > > > +}
> > > > > +
> > > > > +/**
> > > > > + * drm_gpusvm_migration_put_page - Put a migration page
> > > > > + * @page: Pointer to the page to put
> > > > > + *
> > > > > + * This function unlocks and puts a page.
> > > > > + */
> > > > > +static void drm_gpusvm_migration_put_page(struct page *page)
> > > > > +{
> > > > > +	unlock_page(page);
> > > > > +	put_page(page);
> > > > > +}
> > > > > +
> > > > > +/**
> > > > > + * drm_gpusvm_migration_put_pages - Put migration pages
> > > > > + * @npages: Number of pages
> > > > > + * @migrate_pfn: Array of migrate page frame numbers
> > > > > + *
> > > > > + * This function puts an array of pages.
> > > > > + */
> > > > > +static void drm_gpusvm_migration_put_pages(unsigned long npages,
> > > > > +					   unsigned long *migrate_pfn)
> > > > > +{
> > > > > +	unsigned long i;
> > > > > +
> > > > > +	for (i = 0; i < npages; ++i) {
> > > > > +		if (!migrate_pfn[i])
> > > > > +			continue;
> > > > > +
> > > > > +		drm_gpusvm_migration_put_page(migrate_pfn_to_page(migrate_pfn[i]));
> > > > > +		migrate_pfn[i] = 0;
> > > > > +	}
> > > > > +}
> > > > > +
> > > > > +/**
> > > > > + * drm_gpusvm_get_vram_page - Get a reference to a VRAM page
> > > > > + * @page: Pointer to the page
> > > > > + * @zdd: Pointer to the GPU SVM zone device data
> > > > > + *
> > > > > + * This function associates the given page with the specified GPU SVM zone
> > > > > + * device data and initializes it for zone device usage.
> > > > > + */
> > > > > +static void drm_gpusvm_get_vram_page(struct page *page,
> > > > > +				     struct drm_gpusvm_zdd *zdd)
> > > > > +{
> > > > > +	page->zone_device_data = drm_gpusvm_zdd_get(zdd);
> > > > > +	zone_device_page_init(page);
> > > > > +}
> > > > > +
> > > > > +/**
> > > > > + * drm_gpusvm_migrate_map_pages() - Map migration pages for GPU SVM migration
> > > > > + * @dev: The device for which the pages are being mapped
> > > > > + * @dma_addr: Array to store DMA addresses corresponding to mapped pages
> > > > > + * @migrate_pfn: Array of migrate page frame numbers to map
> > > > > + * @npages: Number of pages to map
> > > > > + * @dir: Direction of data transfer (e.g., DMA_BIDIRECTIONAL)
> > > > > + *
> > > > > + * This function maps pages of memory for migration usage in GPU SVM. It
> > > > > + * iterates over each page frame number provided in @migrate_pfn, maps the
> > > > > + * corresponding page, and stores the DMA address in the provided @dma_addr
> > > > > + * array.
> > > > > + *
> > > > > + * Return: 0 on success, -EFAULT if an error occurs during mapping.
> > > > > + */
> > > > > +static int drm_gpusvm_migrate_map_pages(struct device *dev,
> > > > > +					dma_addr_t *dma_addr,
> > > > > +					long unsigned int *migrate_pfn,
> > > > > +					unsigned long npages,
> > > > > +					enum dma_data_direction dir)
> > > > > +{
> > > > > +	unsigned long i;
> > > > > +
> > > > > +	for (i = 0; i < npages; ++i) {
> > > > > +		struct page *page = migrate_pfn_to_page(migrate_pfn[i]);
> > > > > +
> > > > > +		if (!page)
> > > > > +			continue;
> > > > > +
> > > > > +		if (WARN_ON_ONCE(is_zone_device_page(page)))
> > > > > +			return -EFAULT;
> > > > > +
> > > > > +		dma_addr[i] = dma_map_page(dev, page, 0, PAGE_SIZE, dir);
> > > > > +		if (dma_mapping_error(dev, dma_addr[i]))
> > > > > +			return -EFAULT;
> > > > > +	}
> > > > > +
> > > > > +	return 0;
> > > > > +}
> > > > > +
> > > > > +/**
> > > > > + * drm_gpusvm_migrate_unmap_pages() - Unmap pages previously mapped for GPU SVM migration
> > > > > + * @dev: The device for which the pages were mapped
> > > > > + * @dma_addr: Array of DMA addresses corresponding to mapped pages
> > > > > + * @npages: Number of pages to unmap
> > > > > + * @dir: Direction of data transfer (e.g., DMA_BIDIRECTIONAL)
> > > > > + *
> > > > > + * This function unmaps previously mapped pages of memory for GPU Shared Virtual
> > > > > + * Memory (SVM). It iterates over each DMA address provided in @dma_addr, checks
> > > > > + * if it's valid and not already unmapped, and unmaps the corresponding page.
> > > > > + */
> > > > > +static void drm_gpusvm_migrate_unmap_pages(struct device *dev,
> > > > > +					   dma_addr_t *dma_addr,
> > > > > +					   unsigned long npages,
> > > > > +					   enum dma_data_direction dir)
> > > > > +{
> > > > > +	unsigned long i;
> > > > > +
> > > > > +	for (i = 0; i < npages; ++i) {
> > > > > +		if (!dma_addr[i] || dma_mapping_error(dev, dma_addr[i]))
> > > > > +			continue;
> > > > > +
> > > > > +		dma_unmap_page(dev, dma_addr[i], PAGE_SIZE, dir);
> > > > > +	}
> > > > > +}
> > > > > +
> > > > > +/**
> > > > > + * drm_gpusvm_migrate_to_vram - Migrate GPU SVM range to VRAM
> > > > > + * @gpusvm: Pointer to the GPU SVM structure
> > > > > + * @range: Pointer to the GPU SVM range structure
> > > > > + *                   failure of this function.
> > > > > + * @vram_allocation: Driver-private pointer to the VRAM allocation. The caller
> > > > > + *                   should hold a reference to the VRAM allocation, which
> > > > > + *                   should be dropped via ops->vram_allocation or upon the
> > > > > + *                   failure of this function.
> > > > > + * @ctx: GPU SVM context
> > > > > + *
> > > > > + * This function migrates the specified GPU SVM range to VRAM. It performs the
> > > > > + * necessary setup and invokes the driver-specific operations for migration to
> > > > > + * VRAM. Upon successful return, @vram_allocation can safely reference @range
> > > > > + * until ops->vram_release is called which only upon successful return.
> > > > > + *
> > > > > + * Returns:
> > > > > + * 0 on success, negative error code on failure.
> > > > > + */
> > > > > +int drm_gpusvm_migrate_to_vram(struct drm_gpusvm *gpusvm,
> > > > > +			       struct drm_gpusvm_range *range,
> > > > > +			       void *vram_allocation,
> > > > > +			       const struct drm_gpusvm_ctx *ctx)
> > > > > +{
> > > > > +	u64 start = range->va.start, end = range->va.end;
> > > > > +	struct migrate_vma migrate = {
> > > > > +		.start		= start,
> > > > > +		.end		= end,
> > > > > +		.pgmap_owner	= gpusvm->device_private_page_owner,
> > > > > +		.flags		= MIGRATE_VMA_SELECT_SYSTEM,
> > > > > +	};
> > > > > +	struct mm_struct *mm = gpusvm->mm;
> > > > > +	unsigned long i, npages = npages_in_range(start, end);
> > > > > +	struct vm_area_struct *vas;
> > > > > +	struct drm_gpusvm_zdd *zdd = NULL;
> > > > > +	struct page **pages;
> > > > > +	dma_addr_t *dma_addr;
> > > > > +	void *buf;
> > > > > +	int err;
> > > > > +
> > > > > +	if (!range->flags.migrate_vram)
> > > > > +		return -EINVAL;
> > > > > +
> > > > > +	if (!gpusvm->ops->populate_vram_pfn || !gpusvm->ops->copy_to_vram ||
> > > > > +	    !gpusvm->ops->copy_to_sram)
> > > > > +		return -EOPNOTSUPP;
> > > > > +
> > > > > +	if (!ctx->mmap_locked) {
> > > > > +		if (!mmget_not_zero(mm)) {
> > > > > +			err = -EFAULT;
> > > > > +			goto err_out;
> > > > > +		}
> > > > > +		mmap_write_lock(mm);
> > > > > +	}
> > > > > +
> > > > > +	mmap_assert_locked(mm);
> > > > > +
> > > > > +	vas = vma_lookup(mm, start);
> > > > > +	if (!vas) {
> > > > > +		err = -ENOENT;
> > > > > +		goto err_mmunlock;
> > > > > +	}
> > > > > +
> > > > > +	if (end > vas->vm_end || start < vas->vm_start) {
> > > > > +		err = -EINVAL;
> > > > > +		goto err_mmunlock;
> > > > > +	}
> > > > > +
> > > > > +	if (!vma_is_anonymous(vas)) {
> > > > > +		err = -EBUSY;
> > > > > +		goto err_mmunlock;
> > > > > +	}
> > > > > +
> > > > > +	buf = kvcalloc(npages, 2 * sizeof(*migrate.src) + sizeof(*dma_addr) +
> > > > > +		       sizeof(*pages), GFP_KERNEL);
> > > > > +	if (!buf) {
> > > > > +		err = -ENOMEM;
> > > > > +		goto err_mmunlock;
> > > > > +	}
> > > > > +	dma_addr = buf + (2 * sizeof(*migrate.src) * npages);
> > > > > +	pages = buf + (2 * sizeof(*migrate.src) + sizeof(*dma_addr)) * npages;
> > > > > +
> > > > > +	zdd = drm_gpusvm_zdd_alloc(range);
> > > > > +	if (!zdd) {
> > > > > +		err = -ENOMEM;
> > > > > +		goto err_free;
> > > > > +	}
> > > > > +
> > > > > +	migrate.vma = vas;
> > > > > +	migrate.src = buf;
> > > > > +	migrate.dst = migrate.src + npages;
> > > > > +
> > > > > +	err = migrate_vma_setup(&migrate);
> > > > > +	if (err)
> > > > > +		goto err_free;
> > > > > +
> > > > > +	/*
> > > > > +	 * FIXME: Below cases, !migrate.cpages and migrate.cpages != npages, not
> > > > > +	 * always an error. Need to revisit possible cases and how to handle. We
> > > > > +	 * could prefault on migrate.cpages != npages via hmm_range_fault.
> > > > > +	 */
> > > > > +
> > > > > +	if (!migrate.cpages) {
> > > > > +		err = -EFAULT;
> > > > > +		goto err_free;
> > > > > +	}
> > > > > +
> > > > > +	if (migrate.cpages != npages) {
> > > > > +		err = -EBUSY;
> > > > > +		goto err_finalize;
> > > > > +	}
> > > > > +
> > > > > +	err = gpusvm->ops->populate_vram_pfn(gpusvm, vram_allocation, npages,
> > > > > +					     migrate.dst);
> > > > > +	if (err)
> > > > > +		goto err_finalize;
> > > > > +
> > > > > +	err = drm_gpusvm_migrate_map_pages(gpusvm->drm->dev, dma_addr,
> > > > > +					   migrate.src, npages, DMA_TO_DEVICE);
> > > > > +	if (err)
> > > > > +		goto err_finalize;
> > > > > +
> > > > > +	for (i = 0; i < npages; ++i) {
> > > > > +		struct page *page = pfn_to_page(migrate.dst[i]);
> > > > > +
> > > > > +		pages[i] = page;
> > > > > +		migrate.dst[i] = migrate_pfn(migrate.dst[i]);
> > > > > +		drm_gpusvm_get_vram_page(page, zdd);
> > > > > +	}
> > > > > +
> > > > > +	err = gpusvm->ops->copy_to_vram(gpusvm, pages, dma_addr, npages);
> > > > > +	if (err)
> > > > > +		goto err_finalize;
> > > > > +
> > > > > +	/* Upon success bind vram allocation to range and zdd */
> > > > > +	range->vram_allocation = vram_allocation;
> > > > > +	WRITE_ONCE(zdd->vram_allocation, vram_allocation);	/* Owns ref */
> > > > > +
> > > > > +err_finalize:
> > > > > +	if (err)
> > > > > +		drm_gpusvm_migration_put_pages(npages, migrate.dst);
> > > > > +	migrate_vma_pages(&migrate);
> > > > > +	migrate_vma_finalize(&migrate);
> > > > > +	drm_gpusvm_migrate_unmap_pages(gpusvm->drm->dev, dma_addr, npages,
> > > > > +				       DMA_TO_DEVICE);
> > > > > +err_free:
> > > > > +	if (zdd)
> > > > > +		drm_gpusvm_zdd_put(zdd);
> > > > > +	kvfree(buf);
> > > > > +err_mmunlock:
> > > > > +	if (!ctx->mmap_locked) {
> > > > > +		mmap_write_unlock(mm);
> > > > > +		mmput(mm);
> > > > > +	}
> > > > > +err_out:
> > > > > +	return err;
> > > > > +}
> > > > > +
> > > > > +/**
> > > > > + * drm_gpusvm_migrate_populate_sram_pfn - Populate SRAM PFNs for a VM area
> > > > > + * @vas: Pointer to the VM area structure, can be NULL
> > > > > + * @npages: Number of pages to populate
> > > > > + * @src_mpfn: Source array of migrate PFNs
> > > > > + * @mpfn: Array of migrate PFNs to populate
> > > > > + * @addr: Start address for PFN allocation
> > > > > + *
> > > > > + * This function populates the SRAM migrate page frame numbers (PFNs) for the
> > > > > + * specified VM area structure. It allocates and locks pages in the VM area for
> > > > > + * SRAM usage. If vas is non-NULL use alloc_page_vma for allocation, if NULL use
> > > > > + * alloc_page for allocation.
> > > > > + *
> > > > > + * Returns:
> > > > > + * 0 on success, negative error code on failure.
> > > > > + */
> > > > > +static int drm_gpusvm_migrate_populate_sram_pfn(struct vm_area_struct *vas,
> > > > > +						unsigned long npages,
> > > > > +						unsigned long *src_mpfn,
> > > > > +						unsigned long *mpfn, u64 addr)
> > > > > +{
> > > > > +	unsigned long i;
> > > > > +
> > > > > +	for (i = 0; i < npages; ++i, addr += PAGE_SIZE) {
> > > > > +		struct page *page;
> > > > > +
> > > > > +		if (!(src_mpfn[i] & MIGRATE_PFN_MIGRATE))
> > > > > +			continue;
> > > > > +
> > > > > +		if (vas)
> > > > > +			page = alloc_page_vma(GFP_HIGHUSER, vas, addr);
> > > > > +		else
> > > > > +			page = alloc_page(GFP_HIGHUSER);
> > > > > +
> > > > > +		if (!page)
> > > > > +			return -ENOMEM;
> > > > > +
> > > > > +		lock_page(page);
> > > > > +		mpfn[i] = migrate_pfn(page_to_pfn(page));
> > > > > +	}
> > > > > +
> > > > > +	return 0;
> > > > > +}
> > > > > +
> > > > > +/**
> > > > > + * drm_gpusvm_evict_to_sram - Evict GPU SVM range to SRAM
> > > > > + * @gpusvm: Pointer to the GPU SVM structure
> > > > > + * @range: Pointer to the GPU SVM range structure
> > > > > + *
> > > > > + * Similar to __drm_gpusvm_migrate_to_sram but does not require mmap lock and
> > > > > + * migration done via migrate_device_* functions. Fallback path as it is
> > > > > + * preferred to issue migrations with mmap lock.
> > > > > + *
> > > > > + * Returns:
> > > > > + * 0 on success, negative error code on failure.
> > > > > + */
> > > > > +static int drm_gpusvm_evict_to_sram(struct drm_gpusvm *gpusvm,
> > > > > +				    struct drm_gpusvm_range *range)
> > > > > +{
> > > > > +	unsigned long npages;
> > > > > +	struct page **pages;
> > > > > +	unsigned long *src, *dst;
> > > > > +	dma_addr_t *dma_addr;
> > > > > +	void *buf;
> > > > > +	int i, err = 0;
> > > > > +
> > > > > +	npages = npages_in_range(range->va.start, range->va.end);
> > > > > +
> > > > > +	buf = kvcalloc(npages, 2 * sizeof(*src) + sizeof(*dma_addr) +
> > > > > +		       sizeof(*pages), GFP_KERNEL);
> > > > > +	if (!buf) {
> > > > > +		err = -ENOMEM;
> > > > > +		goto err_out;
> > > > > +	}
> > > > > +	src = buf;
> > > > > +	dst = buf + (sizeof(*src) * npages);
> > > > > +	dma_addr = buf + (2 * sizeof(*src) * npages);
> > > > > +	pages = buf + (2 * sizeof(*src) + sizeof(*dma_addr)) * npages;
> > > > > +
> > > > > +	err = gpusvm->ops->populate_vram_pfn(gpusvm, range->vram_allocation,
> > > > > +					     npages, src);
> > > > > +	if (err)
> > > > > +		goto err_free;
> > > > > +
> > > > > +	err = migrate_device_vma_range(gpusvm->mm,
> > > > > +				       gpusvm->device_private_page_owner, src,
> > > > > +				       npages, range->va.start);
> > > > > +	if (err)
> > > > > +		goto err_free;
> > > > > +
> > > > > +	err = drm_gpusvm_migrate_populate_sram_pfn(NULL, npages, src, dst, 0);
> > > > > +	if (err)
> > > > > +		goto err_finalize;
> > > > > +
> > > > > +	err = drm_gpusvm_migrate_map_pages(gpusvm->drm->dev, dma_addr,
> > > > > +					   dst, npages, DMA_BIDIRECTIONAL);
> > > > > +	if (err)
> > > > > +		goto err_finalize;
> > > > > +
> > > > > +	for (i = 0; i < npages; ++i)
> > > > > +		pages[i] = migrate_pfn_to_page(src[i]);
> > > > > +
> > > > > +	err = gpusvm->ops->copy_to_sram(gpusvm, pages, dma_addr, npages);
> > > > > +	if (err)
> > > > > +		goto err_finalize;
> > > > > +
> > > > > +err_finalize:
> > > > > +	if (err)
> > > > > +		drm_gpusvm_migration_put_pages(npages, dst);
> > > > > +	migrate_device_pages(src, dst, npages);
> > > > > +	migrate_device_finalize(src, dst, npages);
> > > > > +	drm_gpusvm_migrate_unmap_pages(gpusvm->drm->dev, dma_addr, npages,
> > > > > +				       DMA_BIDIRECTIONAL);
> > > > > +err_free:
> > > > > +	kvfree(buf);
> > > > > +err_out:
> > > > > +
> > > > > +	return err;
> > > > > +}
> > > > > +
> > > > > +/**
> > > > > + * __drm_gpusvm_migrate_to_sram - Migrate GPU SVM range to SRAM (internal)
> > > > > + * @gpusvm: Pointer to the GPU SVM structure
> > > > > + * @vas: Pointer to the VM area structure
> > > > > + * @page: Pointer to the page for fault handling (can be NULL)
> > > > > + * @start: Start address of the migration range
> > > > > + * @end: End address of the migration range
> > > > > + *
> > > > > + * This internal function performs the migration of the specified GPU SVM range
> > > > > + * to SRAM. It sets up the migration, populates + dma maps SRAM PFNs, and
> > > > > + * invokes the driver-specific operations for migration to SRAM.
> > > > > + *
> > > > > + * Returns:
> > > > > + * 0 on success, negative error code on failure.
> > > > > + */
> > > > > +static int __drm_gpusvm_migrate_to_sram(struct drm_gpusvm *gpusvm,
> > > > > +					struct vm_area_struct *vas,
> > > > > +					struct page *page,
> > > > > +					u64 start, u64 end)
> > > > > +{
> > > > > +	struct migrate_vma migrate = {
> > > > > +		.vma		= vas,
> > > > > +		.pgmap_owner	= gpusvm->device_private_page_owner,
> > > > > +		.flags		= MIGRATE_VMA_SELECT_DEVICE_PRIVATE,
> > > > > +		.fault_page	= page,
> > > > > +	};
> > > > > +	unsigned long npages;
> > > > > +	struct page **pages;
> > > > > +	dma_addr_t *dma_addr;
> > > > > +	void *buf;
> > > > > +	int i, err = 0;
> > > > > +
> > > > > +	mmap_assert_locked(gpusvm->mm);
> > > > > +
> > > > > +	/* Corner where VMA area struct has been partially unmapped */
> > > > > +	if (start < vas->vm_start)
> > > > > +		start = vas->vm_start;
> > > > > +	if (end > vas->vm_end)
> > > > > +		end = vas->vm_end;
> > > > > +
> > > > > +	migrate.start = start;
> > > > > +	migrate.end = end;
> > > > > +	npages = npages_in_range(start, end);
> > > > > +
> > > > > +	buf = kvcalloc(npages, 2 * sizeof(*migrate.src) + sizeof(*dma_addr) +
> > > > > +		       sizeof(*pages), GFP_KERNEL);
> > > > > +	if (!buf) {
> > > > > +		err = -ENOMEM;
> > > > > +		goto err_out;
> > > > > +	}
> > > > > +	dma_addr = buf + (2 * sizeof(*migrate.src) * npages);
> > > > > +	pages = buf + (2 * sizeof(*migrate.src) + sizeof(*dma_addr)) * npages;
> > > > > +
> > > > > +	migrate.vma = vas;
> > > > > +	migrate.src = buf;
> > > > > +	migrate.dst = migrate.src + npages;
> > > > > +
> > > > > +	err = migrate_vma_setup(&migrate);
> > > > > +	if (err)
> > > > > +		goto err_free;
> > > > > +
> > > > > +	/* Raced with another CPU fault, nothing to do */
> > > > > +	if (!migrate.cpages)
> > > > > +		goto err_free;
> > > > > +
> > > > > +	err = drm_gpusvm_migrate_populate_sram_pfn(vas, npages,
> > > > > +						   migrate.src, migrate.dst,
> > > > > +						   start);
> > > > > +	if (err)
> > > > > +		goto err_finalize;
> > > > > +
> > > > > +	err = drm_gpusvm_migrate_map_pages(gpusvm->drm->dev, dma_addr,
> > > > > +					   migrate.dst, npages,
> > > > > +					   DMA_BIDIRECTIONAL);
> > > > > +	if (err)
> > > > > +		goto err_finalize;
> > > > > +
> > > > > +	for (i = 0; i < npages; ++i)
> > > > > +		pages[i] = migrate_pfn_to_page(migrate.src[i]);
> > > > > +
> > > > > +	err = gpusvm->ops->copy_to_sram(gpusvm, pages, dma_addr, npages);
> > > > > +	if (err)
> > > > > +		goto err_finalize;
> > > > > +
> > > > > +err_finalize:
> > > > > +	if (err)
> > > > > +		drm_gpusvm_migration_put_pages(npages, migrate.dst);
> > > > > +	migrate_vma_pages(&migrate);
> > > > > +	migrate_vma_finalize(&migrate);
> > > > > +	drm_gpusvm_migrate_unmap_pages(gpusvm->drm->dev, dma_addr, npages,
> > > > > +				       DMA_BIDIRECTIONAL);
> > > > > +err_free:
> > > > > +	kvfree(buf);
> > > > > +err_out:
> > > > > +	mmap_assert_locked(gpusvm->mm);
> > > > > +
> > > > > +	return err;
> > > > > +}
> > > > > +
> > > > > +/**
> > > > > + * drm_gpusvm_migrate_to_sram - Migrate (evict) GPU SVM range to SRAM
> > > > > + * @gpusvm: Pointer to the GPU SVM structure
> > > > > + * @range: Pointer to the GPU SVM range structure
> > > > > + * @ctx: GPU SVM context
> > > > > + *
> > > > > + * This function initiates the migration of the specified GPU SVM range to
> > > > > + * SRAM. It performs necessary checks and invokes the internal migration
> > > > > + * function for actual migration.
> > > > > + *
> > > > > + * Returns:
> > > > > + * 0 on success, negative error code on failure.
> > > > > + */
> > > > > +int drm_gpusvm_migrate_to_sram(struct drm_gpusvm *gpusvm,
> > > > > +			       struct drm_gpusvm_range *range,
> > > > > +			       const struct drm_gpusvm_ctx *ctx)
> > > > > +{
> > > > > +	u64 start = range->va.start, end = range->va.end;
> > > > > +	struct mm_struct *mm = gpusvm->mm;
> > > > > +	struct vm_area_struct *vas;
> > > > > +	int err;
> > > > > +	bool retry = false;
> > > > > +
> > > > > +	if (!ctx->mmap_locked) {
> > > > > +		if (!mmget_not_zero(mm)) {
> > > > > +			err = -EFAULT;
> > > > > +			goto err_out;
> > > > > +		}
> > > > > +		if (ctx->trylock_mmap) {
> > > > > +			if (!mmap_read_trylock(mm))  {
> > > > > +				err = drm_gpusvm_evict_to_sram(gpusvm, range);
> > > > > +				goto err_mmput;
> > > > > +			}
> > > > > +		} else {
> > > > > +			mmap_read_lock(mm);
> > > > > +		}
> > > > > +	}
> > > > > +
> > > > > +	mmap_assert_locked(mm);
> > > > > +
> > > > > +	/*
> > > > > +	 * Loop required to find all VMA area structs for the corner case when
> > > > > +	 * VRAM backing has been partially unmapped from MM's address space.
> > > > > +	 */
> > > > > +again:
> > > > > +	vas = find_vma(mm, start);
> > > > > +	if (!vas) {
> > > > > +		if (!retry)
> > > > > +			err = -ENOENT;
> > > > > +		goto err_mmunlock;
> > > > > +	}
> > > > > +
> > > > > +	if (end <= vas->vm_start || start >= vas->vm_end) {
> > > > > +		if (!retry)
> > > > > +			err = -EINVAL;
> > > > > +		goto err_mmunlock;
> > > > > +	}
> > > > > +
> > > > > +	err = __drm_gpusvm_migrate_to_sram(gpusvm, vas, NULL, start, end);
> > > > > +	if (err)
> > > > > +		goto err_mmunlock;
> > > > > +
> > > > > +	if (vas->vm_end < end) {
> > > > > +		retry = true;
> > > > > +		start = vas->vm_end;
> > > > > +		goto again;
> > > > > +	}
> > > > > +
> > > > > +	if (!ctx->mmap_locked) {
> > > > > +		mmap_read_unlock(mm);
> > > > > +		/*
> > > > > +		 * Using mmput_async as this function can be called while
> > > > > +		 * holding a dma-resv lock, and a final put can grab the mmap
> > > > > +		 * lock, causing a lock inversion.
> > > > > +		 */
> > > > > +		mmput_async(mm);
> > > > > +	}
> > > > > +
> > > > > +	return 0;
> > > > > +
> > > > > +err_mmunlock:
> > > > > +	if (!ctx->mmap_locked)
> > > > > +		mmap_read_unlock(mm);
> > > > > +err_mmput:
> > > > > +	if (!ctx->mmap_locked)
> > > > > +		mmput_async(mm);
> > > > > +err_out:
> > > > > +	return err;
> > > > > +}
> > > > > +
> > > > > +/**
> > > > > + * drm_gpusvm_page_free - Put GPU SVM zone device data associated with a page
> > > > > + * @page: Pointer to the page
> > > > > + *
> > > > > + * This function is a callback used to put the GPU SVM zone device data
> > > > > + * associated with a page when it is being released.
> > > > > + */
> > > > > +static void drm_gpusvm_page_free(struct page *page)
> > > > > +{
> > > > > +	drm_gpusvm_zdd_put(page->zone_device_data);
> > > > > +}
> > > > > +
> > > > > +/**
> > > > > + * drm_gpusvm_migrate_to_ram - Migrate GPU SVM range to RAM (page fault handler)
> > > > > + * @vmf: Pointer to the fault information structure
> > > > > + *
> > > > > + * This function is a page fault handler used to migrate a GPU SVM range to RAM.
> > > > > + * It retrieves the GPU SVM range information from the faulting page and invokes
> > > > > + * the internal migration function to migrate the range back to RAM.
> > > > > + *
> > > > > + * Returns:
> > > > > + * VM_FAULT_SIGBUS on failure, 0 on success.
> > > > > + */
> > > > > +static vm_fault_t drm_gpusvm_migrate_to_ram(struct vm_fault *vmf)
> > > > > +{
> > > > > +	struct drm_gpusvm_zdd *zdd = vmf->page->zone_device_data;
> > > > > +	int err;
> > > > > +
> > > > > +	err = __drm_gpusvm_migrate_to_sram(zdd->range->gpusvm,
> > > > > +					   vmf->vma, vmf->page,
> > > > > +					   zdd->range->va.start,
> > > > > +					   zdd->range->va.end);
> > > > > +
> > > > > +	return err ? VM_FAULT_SIGBUS : 0;
> > > > > +}
> > > > > +
> > > > > +/**
> > > > > + * drm_gpusvm_pagemap_ops - Device page map operations for GPU SVM
> > > > > + */
> > > > > +static const struct dev_pagemap_ops drm_gpusvm_pagemap_ops = {
> > > > > +	.page_free = drm_gpusvm_page_free,
> > > > > +	.migrate_to_ram = drm_gpusvm_migrate_to_ram,
> > > > > +};
> > > > > +
> > > > > +/**
> > > > > + * drm_gpusvm_pagemap_ops_get - Retrieve GPU SVM device page map operations
> > > > > + *
> > > > > + * Returns:
> > > > > + * Pointer to the GPU SVM device page map operations structure.
> > > > > + */
> > > > > +const struct dev_pagemap_ops *drm_gpusvm_pagemap_ops_get(void)
> > > > > +{
> > > > > +	return &drm_gpusvm_pagemap_ops;
> > > > > +}
> > > > > +
> > > > > +/**
> > > > > + * drm_gpusvm_has_mapping - Check if GPU SVM has mapping for the given address range
> > > > > + * @gpusvm: Pointer to the GPU SVM structure.
> > > > > + * @start: Start address
> > > > > + * @end: End address
> > > > > + *
> > > > > + * Returns:
> > > > > + * True if GPU SVM has mapping, False otherwise
> > > > > + */
> > > > > +bool drm_gpusvm_has_mapping(struct drm_gpusvm *gpusvm, u64 start, u64 end)
> > > > > +{
> > > > > +	struct drm_gpusvm_notifier *notifier;
> > > > > +
> > > > > +	drm_gpusvm_for_each_notifier(notifier, gpusvm, start, end) {
> > > > > +		struct drm_gpusvm_range *range = NULL;
> > > > > +
> > > > > +		drm_gpusvm_for_each_range(range, notifier, start, end)
> > > > > +			return true;
> > > > > +	}
> > > > > +
> > > > > +	return false;
> > > > > +}
> > > > > diff --git a/drivers/gpu/drm/xe/drm_gpusvm.h b/drivers/gpu/drm/xe/drm_gpusvm.h
> > > > > new file mode 100644
> > > > > index 000000000000..0ea70f8534a8
> > > > > --- /dev/null
> > > > > +++ b/drivers/gpu/drm/xe/drm_gpusvm.h
> > > > > @@ -0,0 +1,415 @@
> > > > > +/* SPDX-License-Identifier: MIT */
> > > > > +/*
> > > > > + * Copyright © 2024 Intel Corporation
> > > > > + */
> > > > > +
> > > > > +#ifndef __DRM_GPUSVM_H__
> > > > > +#define __DRM_GPUSVM_H__
> > > > > +
> > > > > +#include <linux/kref.h>
> > > > > +#include <linux/mmu_notifier.h>
> > > > > +#include <linux/workqueue.h>
> > > > > +
> > > > > +struct dev_pagemap_ops;
> > > > > +struct drm_device;
> > > > > +struct drm_gpusvm;
> > > > > +struct drm_gpusvm_notifier;
> > > > > +struct drm_gpusvm_ops;
> > > > > +struct drm_gpusvm_range;
> > > > > +
> > > > > +/**
> > > > > + * struct drm_gpusvm_ops - Operations structure for GPU SVM
> > > > > + *
> > > > > + * This structure defines the operations for GPU Shared Virtual Memory (SVM).
> > > > > + * These operations are provided by the GPU driver to manage SVM ranges and
> > > > > + * perform operations such as migration between VRAM and system RAM.
> > > > > + */
> > > > > +struct drm_gpusvm_ops {
> > > > > +	/**
> > > > > +	 * @notifier_alloc: Allocate a GPU SVM notifier (optional)
> > > > > +	 *
> > > > > +	 * This function shall allocate a GPU SVM notifier.
> > > > > +	 *
> > > > > +	 * Returns:
> > > > > +	 * Pointer to the allocated GPU SVM notifier on success, NULL on failure.
> > > > > +	 */
> > > > > +	struct drm_gpusvm_notifier *(*notifier_alloc)(void);
> > > > > +
> > > > > +	/**
> > > > > +	 * @notifier_free: Free a GPU SVM notifier (optional)
> > > > > +	 * @notifier: Pointer to the GPU SVM notifier to be freed
> > > > > +	 *
> > > > > +	 * This function shall free a GPU SVM notifier.
> > > > > +	 */
> > > > > +	void (*notifier_free)(struct drm_gpusvm_notifier *notifier);
> > > > > +
> > > > > +	/**
> > > > > +	 * @range_alloc: Allocate a GPU SVM range (optional)
> > > > > +	 * @gpusvm: Pointer to the GPU SVM
> > > > > +	 *
> > > > > +	 * This function shall allocate a GPU SVM range.
> > > > > +	 *
> > > > > +	 * Returns:
> > > > > +	 * Pointer to the allocated GPU SVM range on success, NULL on failure.
> > > > > +	 */
> > > > > +	struct drm_gpusvm_range *(*range_alloc)(struct drm_gpusvm *gpusvm);
> > > > > +
> > > > > +	/**
> > > > > +	 * @range_free: Free a GPU SVM range (optional)
> > > > > +	 * @range: Pointer to the GPU SVM range to be freed
> > > > > +	 *
> > > > > +	 * This function shall free a GPU SVM range.
> > > > > +	 */
> > > > > +	void (*range_free)(struct drm_gpusvm_range *range);
> > > > > +
> > > > > +	/**
> > > > > +	 * @vram_release: Release VRAM allocation (optional)
> > > > > +	 * @vram_allocation: Driver-private pointer to the VRAM allocation
> > > > > +	 *
> > > > > +	 * This function shall release VRAM allocation and expects to drop a
> > > > > +	 * reference to VRAM allocation.
> > > > > +	 */
> > > > > +	void (*vram_release)(void *vram_allocation);
> > > > > +
> > > > > +	/**
> > > > > +	 * @populate_vram_pfn: Populate VRAM PFN (required for migration)
> > > > > +	 * @gpusvm: Pointer to the GPU SVM
> > > > > +	 * @vram_allocation: Driver-private pointer to the VRAM allocation
> > > > > +	 * @npages: Number of pages to populate
> > > > > +	 * @pfn: Array of page frame numbers to populate
> > > > > +	 *
> > > > > +	 * This function shall populate VRAM page frame numbers (PFN).
> > > > > +	 *
> > > > > +	 * Returns:
> > > > > +	 * 0 on success, a negative error code on failure.
> > > > > +	 */
> > > > > +	int (*populate_vram_pfn)(struct drm_gpusvm *gpusvm,
> > > > > +				 void *vram_allocation,
> > > > > +				 unsigned long npages,
> > > > > +				 unsigned long *pfn);
> > > > > +
> > > > > +	/**
> > > > > +	 * @copy_to_vram: Copy to VRAM (required for migration)
> > > > > +	 * @gpusvm: Pointer to the GPU SVM
> > > > > +	 * @pages: Pointer to array of VRAM pages (destination)
> > > > > +	 * @dma_addr: Pointer to array of DMA addresses (source)
> > > > > +	 * @npages: Number of pages to copy
> > > > > +	 *
> > > > > +	 * This function shall copy pages to VRAM.
> > > > > +	 *
> > > > > +	 * Returns:
> > > > > +	 * 0 on success, a negative error code on failure.
> > > > > +	 */
> > > > > +	int (*copy_to_vram)(struct drm_gpusvm *gpusvm,
> > > > > +			    struct page **pages,
> > > > > +			    dma_addr_t *dma_addr,
> > > > > +			    unsigned long npages);
> > > > > +
> > > > > +	/**
> > > > > +	 * @copy_to_sram: Copy to system RAM (required for migration)
> > > > > +	 * @gpusvm: Pointer to the GPU SVM
> > > > > +	 * @pages: Pointer to array of VRAM pages (source)
> > > > > +	 * @dma_addr: Pointer to array of DMA addresses (destination)
> > > > > +	 * @npages: Number of pages to copy
> > > > > +	 *
> > > > > +	 * This function shall copy pages to system RAM.
> > > > > +	 *
> > > > > +	 * Returns:
> > > > > +	 * 0 on success, a negative error code on failure.
> > > > > +	 */
> > > > > +	int (*copy_to_sram)(struct drm_gpusvm *gpusvm,
> > > > > +			    struct page **pages,
> > > > > +			    dma_addr_t *dma_addr,
> > > > > +			    unsigned long npages);
> > > > > +
> > > > > +	/**
> > > > > +	 * @invalidate: Invalidate GPU SVM notifier (required)
> > > > > +	 * @gpusvm: Pointer to the GPU SVM
> > > > > +	 * @notifier: Pointer to the GPU SVM notifier
> > > > > +	 * @mmu_range: Pointer to the mmu_notifier_range structure
> > > > > +	 *
> > > > > +	 * This function shall invalidate the GPU page tables. It can safely
> > > > > +	 * walk the notifier range RB tree/list in this function. Called while
> > > > > +	 * holding the notifier lock.
> > > > > +	 */
> > > > > +	void (*invalidate)(struct drm_gpusvm *gpusvm,
> > > > > +			   struct drm_gpusvm_notifier *notifier,
> > > > > +			   const struct mmu_notifier_range *mmu_range);
> > > > > +};
> > > > > +
> > > > > +/**
> > > > > + * struct drm_gpusvm_notifier - Structure representing a GPU SVM notifier
> > > > > + *
> > > > > + * @gpusvm: Pointer to the GPU SVM structure
> > > > > + * @notifier: MMU interval notifier
> > > > > + * @interval: Interval for the notifier
> > > > > + * @rb: Red-black tree node for the parent GPU SVM structure notifier tree
> > > > > + * @root: Cached root node of the RB tree containing ranges
> > > > > + * @range_list: List head containing of ranges in the same order they appear in
> > > > > + *              interval tree. This is useful to keep iterating ranges while
> > > > > + *              doing modifications to RB tree.
> > > > > + * @flags.removed: Flag indicating whether the MMU interval notifier has been
> > > > > + *                 removed
> > > > > + *
> > > > > + * This structure represents a GPU SVM notifier.
> > > > > + */
> > > > > +struct drm_gpusvm_notifier {
> > > > > +	struct drm_gpusvm *gpusvm;
> > > > > +	struct mmu_interval_notifier notifier;
> > > > > +	struct {
> > > > > +		u64 start;
> > > > > +		u64 end;
> > > > > +	} interval;
> > > > > +	struct {
> > > > > +		struct rb_node node;
> > > > > +		struct list_head entry;
> > > > > +		u64 __subtree_last;
> > > > > +	} rb;
> > > > > +	struct rb_root_cached root;
> > > > > +	struct list_head range_list;
> > > > > +	struct {
> > > > > +		u32 removed : 1;
> > > > > +	} flags;
> > > > > +};
> > > > > +
> > > > > +/**
> > > > > + * struct drm_gpusvm_range - Structure representing a GPU SVM range
> > > > > + *
> > > > > + * @gpusvm: Pointer to the GPU SVM structure
> > > > > + * @notifier: Pointer to the GPU SVM notifier
> > > > > + * @refcount: Reference count for the range
> > > > > + * @rb: Red-black tree node for the parent GPU SVM notifier structure range tree
> > > > > + * @va: Virtual address range
> > > > > + * @notifier_seq: Notifier sequence number of the range's pages
> > > > > + * @pages: Pointer to the array of pages (if backing store is in VRAM)
> > > > > + * @dma_addr: DMA address array (if backing store is SRAM and DMA mapped)
> > > > > + * @vram_allocation: Driver-private pointer to the VRAM allocation
> > > > > + * @order: Order of dma mapping. i.e. PAGE_SIZE << order is mapping size
> > > > > + * @flags.migrate_vram: Flag indicating whether the range can be migrated to VRAM
> > > > > + * @flags.unmapped: Flag indicating if the range has been unmapped
> > > > > + * @flags.partial_unmap: Flag indicating if the range has been partially unmapped
> > > > > + * @flags.has_vram_pages: Flag indicating if the range has vram pages
> > > > > + * @flags.has_dma_mapping: Flag indicating if the range has a DMA mapping
> > > > > + * @flags.kfree_mapping: Flag indicating @dma_addr is a compact allocation based
> > > > > + *                       on @order which releases via kfree
> > > > > + *
> > > > > + * This structure represents a GPU SVM range used for tracking memory ranges
> > > > > + * mapped in a DRM device.
> > > > > + */
> > > > > +struct drm_gpusvm_range {
> > > > > +	struct drm_gpusvm *gpusvm;
> > > > > +	struct drm_gpusvm_notifier *notifier;
> > > > > +	struct kref refcount;
> > > > > +	struct {
> > > > > +		struct rb_node node;
> > > > > +		struct list_head entry;
> > > > > +		u64 __subtree_last;
> > > > > +	} rb;
> > > > > +	struct {
> > > > > +		u64 start;
> > > > > +		u64 end;
> > > > > +	} va;
> > > > > +	unsigned long notifier_seq;
> > > > > +	union {
> > > > > +		struct page **pages;
> > > > > +		dma_addr_t *dma_addr;
> > > > > +	};
> > > > > +	void *vram_allocation;
> > > > > +	u16 order;
> > > > > +	struct {
> > > > > +		/* All flags below must be set upon creation */
> > > > > +		u16 migrate_vram : 1;
> > > > > +		/* All flags below must be set / cleared under notifier lock */
> > > > > +		u16 unmapped : 1;
> > > > > +		u16 partial_unmap : 1;
> > > > > +		u16 has_vram_pages : 1;
> > > > > +		u16 has_dma_mapping : 1;
> > > > > +		u16 kfree_mapping : 1;
> > > > > +	} flags;
> > > > > +};
> > > > > +
> > > > > +/**
> > > > > + * struct drm_gpusvm - GPU SVM structure
> > > > > + *
> > > > > + * @name: Name of the GPU SVM
> > > > > + * @drm: Pointer to the DRM device structure
> > > > > + * @mm: Pointer to the mm_struct for the address space
> > > > > + * @device_private_page_owner: Device private pages owner
> > > > > + * @mm_start: Start address of GPU SVM
> > > > > + * @mm_range: Range of the GPU SVM
> > > > > + * @notifier_size: Size of individual notifiers
> > > > > + * @ops: Pointer to the operations structure for GPU SVM
> > > > > + * @chunk_sizes: Pointer to the array of chunk sizes used in range allocation.
> > > > > + *               Entries should be powers of 2 in descending order.
> > > > > + * @num_chunks: Number of chunks
> > > > > + * @notifier_lock: Read-write semaphore for protecting notifier operations
> > > > > + * @zdd_wq: Workqueue for deferred work on zdd destruction
> > > > > + * @root: Cached root node of the Red-Black tree containing GPU SVM notifiers
> > > > > + * @notifier_list: list head containing of notifiers in the same order they
> > > > > + *                 appear in interval tree. This is useful to keep iterating
> > > > > + *                 notifiers while doing modifications to RB tree.
> > > > > + *
> > > > > + * This structure represents a GPU SVM (Shared Virtual Memory) used for tracking
> > > > > + * memory ranges mapped in a DRM (Direct Rendering Manager) device.
> > > > > + *
> > > > > + * No reference counting is provided, as this is expected to be embedded in the
> > > > > + * driver VM structure along with the struct drm_gpuvm, which handles reference
> > > > > + * counting.
> > > > > + */
> > > > > +struct drm_gpusvm {
> > > > > +	const char *name;
> > > > > +	struct drm_device *drm;
> > > > > +	struct mm_struct *mm;
> > > > > +	void *device_private_page_owner;
> > > > > +	u64 mm_start;
> > > > > +	u64 mm_range;
> > > > > +	u64 notifier_size;
> > > > > +	const struct drm_gpusvm_ops *ops;
> > > > > +	const u64 *chunk_sizes;
> > > > > +	int num_chunks;
> > > > > +	struct rw_semaphore notifier_lock;
> > > > > +	struct workqueue_struct *zdd_wq;
> > > > > +	struct rb_root_cached root;
> > > > > +	struct list_head notifier_list;
> > > > > +};
> > > > > +
> > > > > +/**
> > > > > + * struct drm_gpusvm_ctx - DRM GPU SVM context
> > > > > + *
> > > > > + * @mmap_locked: mmap lock is locked
> > > > > + * @trylock_mmap: trylock mmap lock, used to avoid locking inversions
> > > > > + *                (e.g.dma-revs -> mmap lock)
> > > > > + * @in_notifier: entering from a MMU notifier
> > > > > + * @read_only: operating on read-only memory
> > > > > + * @vram_possible: possible to use VRAM
> > > > > + * @prefault: prefault pages
> > > > > + *
> > > > > + * Context that is DRM GPUSVM is operating in (i.e. user arguments).
> > > > > + */
> > > > > +struct drm_gpusvm_ctx {
> > > > > +	u32 mmap_locked :1;
> > > > > +	u32 trylock_mmap :1;
> > > > > +	u32 in_notifier :1;
> > > > > +	u32 read_only :1;
> > > > > +	u32 vram_possible :1;
> > > > > +	u32 prefault :1;
> > > > > +};
> > > > > +
> > > > > +int drm_gpusvm_init(struct drm_gpusvm *gpusvm,
> > > > > +		    const char *name, struct drm_device *drm,
> > > > > +		    struct mm_struct *mm, void *device_private_page_owner,
> > > > > +		    u64 mm_start, u64 mm_range, u64 notifier_size,
> > > > > +		    const struct drm_gpusvm_ops *ops,
> > > > > +		    const u64 *chunk_sizes, int num_chunks);
> > > > > +void drm_gpusvm_fini(struct drm_gpusvm *gpusvm);
> > > > > +void drm_gpusvm_free(struct drm_gpusvm *gpusvm);
> > > > > +
> > > > > +struct drm_gpusvm_range *
> > > > > +drm_gpusvm_range_find_or_insert(struct drm_gpusvm *gpusvm, u64 fault_addr,
> > > > > +				u64 gpuva_start, u64 gpuva_end,
> > > > > +				const struct drm_gpusvm_ctx *ctx);
> > > > > +void drm_gpusvm_range_remove(struct drm_gpusvm *gpusvm,
> > > > > +			     struct drm_gpusvm_range *range);
> > > > > +
> > > > > +struct drm_gpusvm_range *
> > > > > +drm_gpusvm_range_get(struct drm_gpusvm_range *range);
> > > > > +void drm_gpusvm_range_put(struct drm_gpusvm_range *range);
> > > > > +
> > > > > +bool drm_gpusvm_range_pages_valid(struct drm_gpusvm *gpusvm,
> > > > > +				  struct drm_gpusvm_range *range);
> > > > > +
> > > > > +int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
> > > > > +			       struct drm_gpusvm_range *range,
> > > > > +			       const struct drm_gpusvm_ctx *ctx);
> > > > > +void drm_gpusvm_range_unmap_pages(struct drm_gpusvm *gpusvm,
> > > > > +				  struct drm_gpusvm_range *range,
> > > > > +				  const struct drm_gpusvm_ctx *ctx);
> > > > > +
> > > > > +int drm_gpusvm_migrate_to_vram(struct drm_gpusvm *gpusvm,
> > > > > +			       struct drm_gpusvm_range *range,
> > > > > +			       void *vram_allocation,
> > > > > +			       const struct drm_gpusvm_ctx *ctx);
> > > > > +int drm_gpusvm_migrate_to_sram(struct drm_gpusvm *gpusvm,
> > > > > +			       struct drm_gpusvm_range *range,
> > > > > +			       const struct drm_gpusvm_ctx *ctx);
> > > > > +
> > > > > +const struct dev_pagemap_ops *drm_gpusvm_pagemap_ops_get(void);
> > > > > +
> > > > > +bool drm_gpusvm_has_mapping(struct drm_gpusvm *gpusvm, u64 start, u64 end);
> > > > > +
> > > > > +struct drm_gpusvm_range *
> > > > > +drm_gpusvm_range_find(struct drm_gpusvm_notifier *notifier, u64 start, u64 end);
> > > > > +
> > > > > +/**
> > > > > + * drm_gpusvm_notifier_lock - Lock GPU SVM notifier
> > > > > + * @gpusvm__: Pointer to the GPU SVM structure.
> > > > > + *
> > > > > + * Abstract client usage GPU SVM notifier lock, take lock
> > > > > + */
> > > > > +#define drm_gpusvm_notifier_lock(gpusvm__)	\
> > > > > +	down_read(&(gpusvm__)->notifier_lock)
> > > > > +
> > > > > +/**
> > > > > + * drm_gpusvm_notifier_unlock - Unlock GPU SVM notifier
> > > > > + * @gpusvm__: Pointer to the GPU SVM structure.
> > > > > + *
> > > > > + * Abstract client usage GPU SVM notifier lock, drop lock
> > > > > + */
> > > > > +#define drm_gpusvm_notifier_unlock(gpusvm__)	\
> > > > > +	up_read(&(gpusvm__)->notifier_lock)
> > > > > +
> > > > > +/**
> > > > > + * __drm_gpusvm_range_next - Get the next GPU SVM range in the list
> > > > > + * @range: a pointer to the current GPU SVM range
> > > > > + *
> > > > > + * Return: A pointer to the next drm_gpusvm_range if available, or NULL if the
> > > > > + *         current range is the last one or if the input range is NULL.
> > > > > + */
> > > > > +static inline struct drm_gpusvm_range *
> > > > > +__drm_gpusvm_range_next(struct drm_gpusvm_range *range)
> > > > > +{
> > > > > +	if (range && !list_is_last(&range->rb.entry,
> > > > > +				   &range->notifier->range_list))
> > > > > +		return list_next_entry(range, rb.entry);
> > > > > +
> > > > > +	return NULL;
> > > > > +}
> > > > > +
> > > > > +/**
> > > > > + * drm_gpusvm_for_each_range - Iterate over GPU SVM ranges in a notifier
> > > > > + * @range__: Iterator variable for the ranges. If set, it indicates the start of
> > > > > + *	     the iterator. If NULL, call drm_gpusvm_range_find() to get the range.
> > > > > + * @notifier__: Pointer to the GPU SVM notifier
> > > > > + * @start__: Start address of the range
> > > > > + * @end__: End address of the range
> > > > > + *
> > > > > + * This macro is used to iterate over GPU SVM ranges in a notifier. It is safe
> > > > > + * to use while holding the driver SVM lock or the notifier lock.
> > > > > + */
> > > > > +#define drm_gpusvm_for_each_range(range__, notifier__, start__, end__)	\
> > > > > +	for ((range__) = (range__) ?:					\
> > > > > +	     drm_gpusvm_range_find((notifier__), (start__), (end__));	\
> > > > > +	     (range__) && (range__->va.start < (end__));		\
> > > > > +	     (range__) = __drm_gpusvm_range_next(range__))
> > > > > +
> > > > > +/**
> > > > > + * drm_gpusvm_range_set_unmapped - Mark a GPU SVM range as unmapped
> > > > > + * @range: Pointer to the GPU SVM range structure.
> > > > > + * @mmu_range: Pointer to the MMU notifier range structure.
> > > > > + *
> > > > > + * This function marks a GPU SVM range as unmapped and sets the partial_unmap flag
> > > > > + * if the range partially falls within the provided MMU notifier range.
> > > > > + */
> > > > > +static inline void
> > > > > +drm_gpusvm_range_set_unmapped(struct drm_gpusvm_range *range,
> > > > > +			      const struct mmu_notifier_range *mmu_range)
> > > > > +{
> > > > > +	lockdep_assert_held_write(&range->gpusvm->notifier_lock);
> > > > > +
> > > > > +	range->flags.unmapped = true;
> > > > > +	if (range->va.start < mmu_range->start ||
> > > > > +	    range->va.end > mmu_range->end)
> > > > > +		range->flags.partial_unmap = true;
> > > > > +}
> > > > > +
> > > > > +#endif /* __DRM_GPUSVM_H__ */
> > > > > -- 
> > > > > 2.34.1
> > > > > 
> > > 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
