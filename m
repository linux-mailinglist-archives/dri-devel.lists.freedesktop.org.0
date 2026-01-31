Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2DmSLvNTfWn9RQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 31 Jan 2026 01:59:31 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16650BFC7B
	for <lists+dri-devel@lfdr.de>; Sat, 31 Jan 2026 01:59:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E338E10E0FF;
	Sat, 31 Jan 2026 00:59:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C7Zs6Ooq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5992210E0FF;
 Sat, 31 Jan 2026 00:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769821166; x=1801357166;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Xk02qnUdSquwQF1iLqj0MUaRejQr66WAmHiqfE4KGY0=;
 b=C7Zs6OoqSVZ+OLDL0jVnqq/CNnAaA6yFlqY2raWNYnBdV0l3IlADnlwV
 d1JpV5NtpwKlFF/wBB1yQu+S5HiuwcFQeHAuGMeYjeWPnONRWQRZS7WgH
 /ZTpemqOdPJFVuaZSqGr7k7EUs288Wxjd+cjU/RzVuztEZYbydoUKOiZ1
 ReR9OwSqGsyWmPKM8tm3bpd47Q9/b5TTsrNrKysk5U0rn4g+yKAvcuobo
 /XNhRzff59GqBYvylHQm8lBYzSYdMifAlIS+Py8gX2Z4hYQCrNyCeajb4
 NBpJAu8q0Et6yhdOTLOF72sN2K8UWrAq4eoA3VdPdQTuErxxqMnUasZpa g==;
X-CSE-ConnectionGUID: +Q/bzwFYQ6uQ7n9ipco87g==
X-CSE-MsgGUID: LMDALphxSxmNBQaAcXYxEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="82444295"
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; d="scan'208";a="82444295"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 16:59:26 -0800
X-CSE-ConnectionGUID: ejeRSLg0TSCJqYZCsG5Bsw==
X-CSE-MsgGUID: DDNFUxCTQdmsAa+dgb1TqQ==
X-ExtLoop1: 1
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 16:59:26 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 30 Jan 2026 16:59:25 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 30 Jan 2026 16:59:25 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.23) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 30 Jan 2026 16:59:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tMm7VsmNOHgoBvv/O7RNG0IiW1x1YHIeL7pmrqXnE6EsqN6Vs+QXOxfSJuPWF/g6tFq4utrMEXO9cyLx+HH47KWLjpXzoIluLnww5VfVgLRo8VHKIvZCs0uh19zMGOoZP6hXGlxADSAzaMqbo0ZeF9iALU5WX31VtyEer9zTOZ2I7VqXUQUFWSIihWEX7eHM2piHHtjejfv2ooyat6DfzzjpomcV2V+jWpaU1WWQTH0tZdr191OHAYhtn7dCkYzwxqzeOzLBKtHq6UwQeQ3ArQ72cK++QoRE/PKKAj7v/dG/kgiw8Nb89FxXyr5mek8dN5kWvqa2YaMACwuEEUePGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kqrotd9NxyWDElo9lfsmgz+3xduAgsFAtt7wbu5irbw=;
 b=u9xc3NwU4PtuTRp/ZAdp/GJCCbn8uCUFRkE1qHh8Xz7WdF+HRyQ/nzt/fRNdMKY2wZG/7xSoU5Yex8Eu6y/mlaQDNZfIexb575d8+peW6i/dq7YlrQPfHB0phac92TPVCnfBP+x4GQd1TWG0XWspidJF2ZJnmYoKBG/fRck99s04Gx6dTSdsKFOQkmmxAzpCHrXf/RcecxXYtGitrSljnxYfps2zpvcj3EufDXCaijxZff22m+6wxwEEnvJkyROlA+Ga1GCKbW3o2j/mNxTvZfE899IoTvHAw8Uz5IQNcNmWk1mc05LhVT0URXJTLLhlshacX2h0IBIdH8vwDVQDUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB7920.namprd11.prod.outlook.com (2603:10b6:208:3fc::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Sat, 31 Jan
 2026 00:59:23 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9564.008; Sat, 31 Jan 2026
 00:59:23 +0000
Date: Fri, 30 Jan 2026 16:59:20 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
CC: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>, Ralph Campbell <rcampbell@nvidia.com>,
 Christoph Hellwig <hch@lst.de>, Jason Gunthorpe <jgg@mellanox.com>, "Jason
 Gunthorpe" <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
 <linux-mm@kvack.org>, <stable@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] mm/hmm: Fix a hmm_range_fault() livelock / starvation
 problem
Message-ID: <aX1T6BozrrtByU8H@lstrano-desk.jf.intel.com>
References: <20260130144529.79909-1-thomas.hellstrom@linux.intel.com>
 <20260130100013.fb1ce1cd5bd7a440087c7b37@linux-foundation.org>
 <b9dd97e7d9e62ebc33c4dfef53a9fd3f51352d3a.camel@linux.intel.com>
 <20260130123810.61dde600422a8fe01cff8296@linux-foundation.org>
 <aX0cJGIU9NLt/OLW@lstrano-desk.jf.intel.com>
 <20260130130835.10d004cd79d67c55b10def74@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260130130835.10d004cd79d67c55b10def74@linux-foundation.org>
X-ClientProxiedBy: MW4P223CA0011.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::16) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB7920:EE_
X-MS-Office365-Filtering-Correlation-Id: dfaf8258-ff11-4d44-2808-08de6063f916
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RzJjZzZrakZpTktCQjBMUEZLTDRacDRpWGExMFJqY2lUTlZNd3VnaEorYlFU?=
 =?utf-8?B?ZEkyUUo3QlFZZzVFT0hSQ0JCWlhnYldIbjE3R3pzelE4T1FpRzk4eHZEU240?=
 =?utf-8?B?eDNVaFRENUY3eC9FSlZwaER5TDRTcmZYblF1d2prdS9DT2FGNFZXeEY0NjN3?=
 =?utf-8?B?MjFYbVd0YzY1OFFLeWVWUFNNSVJSaFFmd0RpV0JETGd2Q3dlN3hQVVd4a3lq?=
 =?utf-8?B?QXkxVWk2UDZ0ZlcybllJQTRydkMwQm5PZFBsd21wYjU2ZkM1YUVCYmlNZHYv?=
 =?utf-8?B?MXNNdEZCQngzVVdIVWZEN1BqUURmVUlvMzBlQXR6RmI5dVZmZHE5VmNMVUNs?=
 =?utf-8?B?YVF2YmVzZUlzMGUyeEZzM2tCd0pNaXAxMkNUNFcvWFdBVHF5MDVMMUROLzFH?=
 =?utf-8?B?ZWtXRFJoN3lEZmtCRHhJZXdXWXNOSHQvMGNHOXpvRnRSYnAreUU0ZW16aDBO?=
 =?utf-8?B?VFZaYzIrZXRiWEg4T2F3a1Bsc29xVDlhclMzYzNPbFJ2cFVERWNjOGhBby9Y?=
 =?utf-8?B?bWQ2MkVmVnJxWnMwaDRpNEJHVjY0MWNYbHJza3p1dFBUbU5mazRrNFBYQzRM?=
 =?utf-8?B?TlN1eGtsOVJZUGRtbkFpWGt5d0FLcm5VaFFpYVNzUVFBZ1pnYnkvdDhlTys2?=
 =?utf-8?B?dzFnY0F3djJRSzlDby9hb0xwQU8yeFQyYkZJeEdveitxV3l0bFM3bmNiQndr?=
 =?utf-8?B?TFcxUE1pb1I0OFdjMG9XQkxGRGkyQmZyeFZyekxzMUYwR294M0JnL2cwdmM0?=
 =?utf-8?B?VFJGWjUrTmxEVDQ4OGxQdDVZNHExQkI5MnV2SjU5VFEwMDN2UnBoQ2IxUFNn?=
 =?utf-8?B?R0NiL3ZzOEQvVnU0VFlhdTlvRW5TRE1HS3RGSUJJOXIxdExEZmZybjVsVUhr?=
 =?utf-8?B?OUZvY25HeEgrNENzWWNRcmljL0dxSHdaWEQ1YUZiM0xUeEJ0aW1nM0h0YWtV?=
 =?utf-8?B?dVZ3bmdTZVBYeS9uZmVsWU5Sc3ArT1J6OU5mdjVvaEFUTGNPalliSDVsRTVt?=
 =?utf-8?B?WWE5MFFlZ1lNT2tZVmd2QXIvTXdZR2xKbVhxV3pLWWlCbFJzaUdHWmtKVUhM?=
 =?utf-8?B?RGpFMStSMXdVWWdSL0lkOTlVQXUvMWt0ZXhFTThGL3NkSXNvOHkzQmYvdklk?=
 =?utf-8?B?WEZlOGxvRkxvVTFXcmFMREsyRGMwZnZ0UUVtc21xcmIwdEhIaGpNREl0QnF6?=
 =?utf-8?B?L3JjMFhxbGpqcXg4cTZ4T05iN0xOVmxIemtpSUdxM1A3NnFBUFc2bmo0ODNQ?=
 =?utf-8?B?cm5admhSL2dCUURkU3RLRFdueWlYQktRMkZXSFM0d3RQUndNOEd5V2JsWW1s?=
 =?utf-8?B?cVF0VjJzVVc2amZsaGlDYm1INDROc1lIZ3hNc21Vc1BpQnAxTWpoMEk2aGNI?=
 =?utf-8?B?dmlkNzY2QXppV2wrYVhKOGR4alRaVTZ1OGwyR2ZUbk43WHpGeW9mUzk1VEhV?=
 =?utf-8?B?cENRM09Mb3lyaE5rSEhRVGt6b2p4Y0NPL1hqUmhPenNXdkFkaHAyRlkxa2RO?=
 =?utf-8?B?dUs1MmRuMFNOWHlNcWNpRXpOV1dXNlpWSWx3RjJDejNReTRGKzBSY1V6aTFh?=
 =?utf-8?B?cUgxTGVXRTJvL0FvdHZUcFlTNWdlZitsM3ovNUkwRmg4T2ZLSnYwZzM1UTVP?=
 =?utf-8?B?cUkvdzN6MEJZc29tTUxlcVhPeS9EdlMwNUZXWUdkSGFzYjJIWFYyU2x1b1Ux?=
 =?utf-8?B?L1oyRm4vQzhwK3JiQjE0M0pKaGM5a3VDNjE0aW9rQ0Zvek4wNEptRm1yMDdQ?=
 =?utf-8?B?ai80c3NqNFJWVlhXN3J0Q2ZLUGdZTzBsMUJzU1JidklmMVBhaWJGQ243bmh6?=
 =?utf-8?B?Mm9KNEJBU2Q3dmlCZVlXQnFGRVFSUEhnQk4wRkszQkpkcGRqNjh5K0ZyQzAx?=
 =?utf-8?B?a0hUdWxMTzBBU2VOclBSVXdwcnM3K2ZHOUtkUHU0QktFVHJxd3B2Y2hGMGVz?=
 =?utf-8?B?MFZ1bUltM3Rxd002SGRKS1RYR3VCWEJLdTI2eHFudVF1VmtsdlVFdGFyOUJ3?=
 =?utf-8?B?aDhRVDJFRk1wSWtUQ29pZTRteksxWFYyZFJUalArMEt6UTdSSGwvWVZFelQw?=
 =?utf-8?B?TDhaU085cGVDZVlQays5SVR5WjRjeDZQb1VxTHdKZEhyUUdBN2x6YTkzdzFt?=
 =?utf-8?Q?KNdo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d0N5RU9VcDZPOWZIM004cndDVzZXMU02elUvNHVxVTRtK2hhTzVhaDJaQlV3?=
 =?utf-8?B?clY2MDdYK2FLUEU1NHVFRGh2Y2h0YmRaS0dhNy8zR0pyb1lESVJrSC9zQXV2?=
 =?utf-8?B?Q2duTkJISjV2NGo3a2V5aUJiaGFWZ0lwLzJ1aE12UllYNytwaFZscEJLcC82?=
 =?utf-8?B?cDQ2cUdFZXlrdFpnTi83cjFKcXZSZnRCV2dYMEVZOTlwSjNkM2VPUXVjMmZK?=
 =?utf-8?B?ODV5YlNyUW1OUUduZlhxSnRvQW40dWJMU3pTSXR5U3JEMlJPSHB4dlQzMjRI?=
 =?utf-8?B?U0FzUmxGTGo3KzZrLzBZWHFMN2x6a2ZtUHRicG9sU0lFa1ZBTHVGNG9wZEgy?=
 =?utf-8?B?QzFucGFvWWlwUkZSYjQ3MGFtQnFUeU5QVkxWQlFCbUhJZUVNOU9LMktzK2c1?=
 =?utf-8?B?QkZ2WjFjSmFCVEN4dEFhdzRxaXVkci9HWGllWmMzV04zUEhJK0k3SkdSd3R6?=
 =?utf-8?B?cmxOV0RJWGcxWEE2L1VmN3ZnTEtBSUx0cW85RnhXd1pGWkdvV24va0hIRVZN?=
 =?utf-8?B?VmFDMHpHbHgwNTBNS0ZnRG1lK3ZiTmx1TFVvdDYvL2laNU5LV3I1Vm5UMmYv?=
 =?utf-8?B?OWVIVng0d1E0b1ZSYXVrSmNFMEUzYWt6U3VObTRyOUdFdElrWEhacFl3SS9X?=
 =?utf-8?B?SWxTVWUwLzFRb2lLZ3krVlBaeE9YamdDb3pGTFpUQTlXdk14TDlWU2VkQi9N?=
 =?utf-8?B?Z3pzc0pVR3J6MHgyMDZ4QzBEeHErNThtdzZtb3BBeVA1d2M0QXRnWFNYMUE2?=
 =?utf-8?B?VjBuZGcwUnBvYTJMcDZWbWErTWpjMFRGVGZzZVpWNjRRTk84K2w4b3ROMk5i?=
 =?utf-8?B?Q1AxalI2WWNaV0ZXdEdJNWVEWTNRQjQ5SmJ5NjBCNVlQSDQ1d0JNWFVMRUVB?=
 =?utf-8?B?NnFDTXR2TGZWNzRZQThQc2tmODJNUmsyL2hZSi9YbG43ZzJOeUY4TG5vRHhN?=
 =?utf-8?B?KzZuKzc3dEJUMFNXWjdyRGlCMFlHTlZreFMvN3c3WFNYK1RZd0pXRnFQWEt6?=
 =?utf-8?B?aXNkOWkya28vc0djZGRqZzhIM09BVzR6Zk11elI3czZkTUQyYm5iSXBxTUxt?=
 =?utf-8?B?Z01EK1c1LytjNG1BK09XTzdqNTcyc3UyN0hqZmxmR0RJMkZRVklnZzBFN2Ry?=
 =?utf-8?B?SHI4ck15ZE1TbUlxZTlLbXM4eUNlZElaZ05YKzZvNldybEpxWHJIWG1wamZO?=
 =?utf-8?B?Z0UwdFpUZGJSWFc5SnRTb3FOYVFwbUxHc2lmaC9ENXByZVBGMVpYMHhuYU40?=
 =?utf-8?B?YXpFN3pwb09OUkovK0s5a25DRG56K2c5cE4vb3orSnJ6b3dzLzhQWEJ3RnJy?=
 =?utf-8?B?OGxHY1YwbkU5T2w4KyttamE5MmNRYkkzMGVMb2I0WHpVUlh0QjNwclFLSlpu?=
 =?utf-8?B?NE5jNTV5WFRBemx0SGNOR0pwQzRaUTBVbWlPTGdBLzZKOThsNDJjOHFBanFW?=
 =?utf-8?B?NDNBRGVEcTNoeWcvYjZMb0h3RWVXNklmckdwcGEwYk1RZnMxUmpjbW5DZkpB?=
 =?utf-8?B?aGh3T1dWLzZPM0NpM2VnL2RMVmlaVU00WWc5dHZYMWJ6c08wcENuMXhRNHh1?=
 =?utf-8?B?R1dNbFBncVBESE10RytuU0podEJXN2RIclNIQUVEcGFGZkUwQkE5M25tcnlN?=
 =?utf-8?B?RU1rbFJNZjA4WUNyOXBLUWZ1QWU5azZEc3ptL1lsVmd4OWJ3SjBET1RUMmZ1?=
 =?utf-8?B?UDd2K0hSeVZpQURpcjc0UmEvd1ZTVXFGZDJ5WGtxbUxxa2FDaW9LL255TFNN?=
 =?utf-8?B?VFBQaXEvNHRid3gyRUVXT2FmMWJXTmtNRmlGdU5SVC9Sa2ZDaFdDWEhNSjhQ?=
 =?utf-8?B?TFg3LzJXS2U2RGZvbkJHV3R0aXZzelg3NWVaaGZmVmpENHVneFZSTmF5VGtK?=
 =?utf-8?B?Q2llZ3ZxVzdURUdVTU8wRHNqaC9BQWV2dktKOUkrQm41SnVsN3Iva0QxY0U1?=
 =?utf-8?B?MC9zREdvMVFCcmFDYnF5aERtSDZpMzl6c05lN2hteFJQdUMzMUx3NENJSGJm?=
 =?utf-8?B?MmtsSkhKYjE5amRiTmtLYzR0RFNhdi9vYlIzdlJKQlkzems0YlJTeUZPOS82?=
 =?utf-8?B?TU1KTkZrdWN0L1d3WUlsbFNiSllNZk1XY3RyaXRYQjRJVUtQUkc4UUFNU0FU?=
 =?utf-8?B?RVMraXNFMDJIU1Jia0xZKzFpZXNYQVFrUFgzamt1ODh4MVRQWnd0dzZ1eVBD?=
 =?utf-8?B?Q25xOHhzTHJMaDVhcjN5elRSbXZOaWNheUh6ZEkxYW9MUU56MGZKVGRnVUZU?=
 =?utf-8?B?MkMxZUtrOW9iSU5JbVhVdDJzK0pqRnNjMkV6SjU3NitBdGd4S2FjVGVUemQ5?=
 =?utf-8?B?bmhROVpsbXd1bGhtTlQ1QVJQcmthWkVLMUVrMk1rd3lSMExKcmNNQT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dfaf8258-ff11-4d44-2808-08de6063f916
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2026 00:59:23.2124 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5YVuwy7ooaPQDiFQK2cjOJn+jep2rAHoD7Qi6w5/5FLs5eSRV+pZYVeoSCesnU4oDL8U3nhMdvjT9SaAlPDeCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7920
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
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matthew.brost@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 16650BFC7B
X-Rspamd-Action: no action

On Fri, Jan 30, 2026 at 01:08:35PM -0800, Andrew Morton wrote:
> On Fri, 30 Jan 2026 13:01:24 -0800 Matthew Brost <matthew.brost@intel.com> wrote:
> 
> > > > Unfortunately hmm_range_fault() is typically called from a gpu
> > > > pagefault handler and it's crucial to get the gpu up and running again
> > > > as fast as possible.
> > > 
> > > Would a millisecond matter?  Regular old preemption will often cause
> > > longer delays.
> > > 
> > 
> > I think millisecond is too high. We are aiming to GPU page faults
> > serviced in 10-15us of CPU time (GPU copy time varies based on size of
> > fault / copy bus speed but still at most 200us).
> 
> But it's a rare case?
> 

Not that rare. I believe this code path — where hmm_range_fault returns
-EBUSY — can be triggered any time HMM_PFN_REQ_FAULT is set and a page
needs to be faulted in.

We don't set HMM_PFN_REQ_FAULT in our GPU fault handler unless
migrations are racing, which should indeed be rare with well behaved
user space. But there are other cases, such as userptr binds, that do
set HMM_PFN_REQ_FAULT, where it's somewhat expected to fault in a bunch
of CPU pages. Doing an msleep probably isn’t a great idea in core code
that a bunch of drivers call, unless this is truly the last resort.
 
> Am I incorrect in believing that getting preempted will cause latencies
> much larger than this?
> 

I'm not really sure — I'm not a scheduling expert — but from my research
I think preemption is still less than 1ms, and in cases where you don't
preempt, cond_resched() is basically free.

> > Matt
> > 
> > > > Is there a way we could test for the cases where cond_resched() doesn't
> > > > work and in that case instead call sched_yield(), at least on -EBUSY
> > > > errors?
> > > 
> > > kernel-internal sched_yield() was taken away years ago and I don't
> > > think there's a replacement, particularly one which will cause a
> > > realtime-policy task to yield to a non-rt-policy one.
> > > 
> > > It's common for kernel code to forget that it could have realtime
> > > policy - we probably have potential lockups in various places.
> > > 
> > > I suggest you rerun your testcase with this patch using `chrt -r', see
> > > if my speculation is correct.
> 
> Please?

Thomas is in Europe, so he’s already done for the day. But I tested this
fix and verified that it resolves the hang we were seeing.

I also did at least 10 runs with chrt -r 1, chrt -r 50, and chrt -r 99.
I couldn’t get it to hang — previously I could reproduce the hang in at
most 2 runs.

In this test case all threads are on work queues, which I believe can
bypass real-time scheduling policies, so that likely explains the chrt
result. I think we’d have to craft a test case that triggers an
hmm_range_fault from a user space call (userptr binds would do this) and
race it with a migration to catch any RT bugs.

Matt
