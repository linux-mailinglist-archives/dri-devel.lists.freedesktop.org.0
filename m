Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C361A3A06C
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 15:50:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 468D310E70E;
	Tue, 18 Feb 2025 14:50:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yr2WHSSg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9597110E3E2;
 Tue, 18 Feb 2025 14:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739890232; x=1771426232;
 h=content-transfer-encoding:date:message-id:cc:subject:
 from:to:references:in-reply-to:mime-version;
 bh=+nRfhw9bm2EtLzXgT1xFSpJ6ZfvvBCHZMcytAR7Ejcs=;
 b=Yr2WHSSguUjqbFV5Sj1crJQrvd6Je0NTi+oVox/5kHdClYLZ0SEC6Ycf
 7jTMhsKbxanAd5wZ7dXwZVjbR6PXZw9b2WTR9ti9ZvD3oxdNargWycgeQ
 KjLK+Db+ZumW/1TotfriGqjMi7HCJqEWQNT4KhNm3Eyn2E5QVdC/ol/r5
 oKOuiUi43PDo6oQNPhCdltrjKL0UPD2zh6M66X2ESnJwxewI+PaaTOyBu
 bnTNolm+nlDKG1Wew3MNZurlf2iWPzP+Ek/oreYrMHUODoOR2ovWPb3CQ
 Q9y+jEGF/KcirjNXLG8NxAFjSpHXNwyuEy9OtNXUDaRqDY09JXy0/0iQr g==;
X-CSE-ConnectionGUID: 6zBG15s9TnKuE2Yvsw6CvA==
X-CSE-MsgGUID: Dm2EEqutT/itR8PXGnA7ow==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="40297109"
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="40297109"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 06:50:31 -0800
X-CSE-ConnectionGUID: yzJeDcrrQnaUgH92S2jTaw==
X-CSE-MsgGUID: PukOiGxoS+i04xtobC6zUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="119346500"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 06:50:31 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 18 Feb 2025 06:50:30 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 18 Feb 2025 06:50:30 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 18 Feb 2025 06:50:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fQtreITTWvdEYPEjTePTjM2SGfxqAfYE3Y9Z+KfmvqPzmw5IJRpaqAm2hoO/x2mwgLrBZleSaJWASyMP2frmNmDadI8ZJlfWVi1sJUS94aW9S/TSroRDmECHySLU2Tsrvb/GlPjjRi1ibIZV2JQNkCzPiW/ppWyjY6WZ1HG8FGMTCVnsy6kCnH0ZwTmuh32CwrbEU8nux+Ecuzr4ed/pE/nx2uNI1kyn2lhTL+EMO7rwESqY6W0PqAoqGfPi0DwQJdMKTaIwYHkVspPzfctPhRtpIdMHgx0Y5zhvnVoDTS6prTLPgEngdouURUxn31PQFLZqIqrDZhjM/V8StaNj1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+nRfhw9bm2EtLzXgT1xFSpJ6ZfvvBCHZMcytAR7Ejcs=;
 b=xCZGWp32cOuiyCWEB6mAk4AF09LqidoOva1P1V+LZKI2liTCJg+rC31bp9PL80vtxUA2dbLndUjriivkZ+v2iYKFYWpM4eXTAru1wbDG9s+Qrt6iaayieXm0CFIF9eiEjXoM+V1PTYue0zNu/JWCZM3U5mIskbaU4qzZJHh1KNI4aZ1TtUhoQ9SyKsEq3EPeokKjf0WrWyW6cDWdOmRbaKBXJtBPAgA2Pz3nciE74UraZB1SpPHFb6/InEoxTUbSWtNxsDQrf8cnA5Iq0JhyOneoZnGRKxFwbZbzw/wHZL7067baMD8xOBWtIbtsgBd+xtb6rot6p8j4xFps4tJJzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by CY5PR11MB6162.namprd11.prod.outlook.com (2603:10b6:930:29::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.18; Tue, 18 Feb
 2025 14:50:29 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::28da:9438:a3ef:19c0]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::28da:9438:a3ef:19c0%4]) with mapi id 15.20.8445.017; Tue, 18 Feb 2025
 14:50:29 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 18 Feb 2025 14:50:24 +0000
Message-ID: <D7VNLYP11ULY.1J6RH9V7LJV46@intel.com>
CC: <chaitanya.kumar.borah@intel.com>, Naveen Kumar <naveen1.kumar@intel.com>
Subject: Re: [PATCH v5 3/3] drm/i915/display: Add i915 hook for
 format_mod_supported_async
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: Arun R Murthy <arun.r.murthy@intel.com>,
 <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>
X-Mailer: aerc 0.18.2-107-g4f7f5d40b602
References: <20250218-asyn-v5-0-7ac5ac4abd4a@intel.com>
 <20250218-asyn-v5-3-7ac5ac4abd4a@intel.com>
In-Reply-To: <20250218-asyn-v5-3-7ac5ac4abd4a@intel.com>
X-ClientProxiedBy: MI2P293CA0007.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:45::7) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|CY5PR11MB6162:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b9b442b-7a88-4ad8-41df-08dd502b9614
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M2IvTWRxaTdLck9URWdPUERGREpHVk15MkdnV29iNkpkRTlpOFY2aDNpVWpy?=
 =?utf-8?B?U29kNTFCREtsNTdkNksrK1Z6R25xRmxnMCtHS3lKLzB3aWVLQkQ5ejJBa1N2?=
 =?utf-8?B?elFXMkwyZC9VMzB4eTVsZks1ZGZyMVhGQ2o0ZEZ2MzVTdytIakxyem5WY0Fs?=
 =?utf-8?B?dWU5aDFMSFdtOThsbHd4Q29oSExyQlJMbEJQY2ZFMGpET1VRWDhzY01ETmZh?=
 =?utf-8?B?SUtUWmZpd3I2b1A1VFp4TEdETWhzYmNuK25SaXVDUS96cmZTdkE2TG1ia2ov?=
 =?utf-8?B?d09TbFVZZEorZ2VlMUx5NXF5cjRZRm51akpoT0JDYTFGcVhqVUtTbkhKWWdt?=
 =?utf-8?B?V2VCeVlla0s2Q2l3RTVTRlVRenB0VEhzd2pidVhjaWkzeGpVMDN3VDJTVFY4?=
 =?utf-8?B?TTg4NHcrdDMvaU1nQzNLYTlsY0EwZld4WEwyNm1FTXJVMlVKYlpsZlUzY0tl?=
 =?utf-8?B?Z3RNMFVscE1STC9PZERmd1lWOU96WitaV2xUb25kbFQxdWtnLy83ejMxQkFp?=
 =?utf-8?B?WDRDZE95UWZSY2xsckhCL05Kb2NlNTM0L3lHZlZ6Vm5hUXQzeTl6TmMxcnRu?=
 =?utf-8?B?R1VZRFp4L3dGa1pOM2ppZjJHMFQ1U2NiNlMvWGE2YzZ5bVZVU3Z6bzlBb1U3?=
 =?utf-8?B?NHRhN0xCK08wQ0M0c3RKSEc1TzVKdXd5ZmJpODhKUWxRODMxMzNCZ1N2TWpi?=
 =?utf-8?B?RndSZkFxc0F5L2dCMjdib3pYcXNCUnU3bHh5MEhSazhIYXpqV1pFOVhjYTNC?=
 =?utf-8?B?YmFDQWZ3c0UvREVoMGlqUUlheDNxZzVJWUh3R2pLYXNPT0dieEs0aS9nRDlF?=
 =?utf-8?B?TkxkZTc3Z3JzZldjemNoOXVETmJQVlVTMHBMdlYxS1JOUk1WNHRBTG9rUHZ3?=
 =?utf-8?B?Vktka3BpNzlrNDZRNTBVQmRTYm5MaFdwRzhaYWFQZ0t1Q1dQSzRoQlFJY21z?=
 =?utf-8?B?aTU4TXZtSDBHYmNRV0Y0UFJBMWhGUEZPMkExSis3S010NHVCRkF3RmpFYm4v?=
 =?utf-8?B?Q1ArdllaL3c4VG4zYy9weGEyMThzQXgrQlBva0V3cmJDWWFYZDZVYTg5M3NK?=
 =?utf-8?B?MzhhcVA4cjQzTzlOa0k1bjBvWnFtUE5UNG9oOHdUUnF6WkZwYXltZStTcmVR?=
 =?utf-8?B?VGJWY3Z4VmkyK2ptNWZWQUlpZDFBNDBNSEpkd0pJNHBzcXFzczB1Z0Jna0J0?=
 =?utf-8?B?QlhaR1hzaXdGV1p0VGl6YUxXWEcrMitnZjhDOW5xL1lLM05XNUYyTmlFQzhK?=
 =?utf-8?B?NnZlcnlweEcxVnplNEZhRnhLZkRVUWRkWHFTTVcrbkFlbTRpdGtheWpzR3V2?=
 =?utf-8?B?SE14ckpNUkJvZ1FJNXlTT1A1dStzcVNndFg3YUUzdmRNeDY3cE1DMjhIbDBh?=
 =?utf-8?B?UlZnYVRNYkpmVGhIeTdwTk4yVkJ5bC9xR1BRNTYvMndFQjNLRDlBMlBnU1lI?=
 =?utf-8?B?MFhFbGZkcGcyZ0VmYVZ0RjlRbTRoWmd1d1lNYkswQ05xNzQxMk1mblRObFo2?=
 =?utf-8?B?eDJDV29rKzluNG1kbndvTE9VREFZTTdtMkZCTzZ5VTdNTHdxa2JrNnQxZ1BY?=
 =?utf-8?B?aGhaUnE4WFVLMktibWpBYzBvaW05TGtwMUpUbWQ2SDVRdlpXN2JQeHh3clRi?=
 =?utf-8?B?QzQ3bFVvUmw3T1Y1NzdmVzErNG5OWkxsaCtOczZTV2d2TkIwRTVOVEFpNUlT?=
 =?utf-8?B?U0hKN0RWbldGOHVGTlZNVnJiZmhVWlkyNXhCWnM0VEl3YVZXZVlmK3NaaU96?=
 =?utf-8?B?MUI2RmkrMHd1ZmJ4L21ZbHpKRGZPR0VrZ0ZveWJIbU8xaldwd0xMNUpXV3RQ?=
 =?utf-8?B?ZmhGKzY4Q0Z4aFBBa1djT3NYOCtjekhjcERyVGxKZEhGcll6VXEzeHk4VXNw?=
 =?utf-8?Q?AiOXCvv+XGpxZ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S25WcitXVWZpeHAyemJHZFdqR2p2cTRtTjRFTXU1UytRTkF3VWJQdXU5YTVD?=
 =?utf-8?B?Y3lVTFFSazFSQmhJZU5hSEhMYlpKaFY3cXBkT1JPS0dKU1V5KzBla2ExL1NE?=
 =?utf-8?B?ekxZMEJJNGZ2ajA4Z2tIWjM4UnZKakd6UytpNHcxY2RUdEh3N2NsZzhveXNu?=
 =?utf-8?B?ZWlEZDA5dW1FUTFKc2VVUjNndmZqZ0t1ZHZmV0ExaFVQVlUxV1ZkNzlTNHhP?=
 =?utf-8?B?YTNWRnlWZVNKQ21zNzIvMm14eEtXaFljSnF3NDNiQUsvdUR1WklsbThRYVVW?=
 =?utf-8?B?QldNdFdDTzFMN1pTU0Nqa1FCOEU5QUxFR0hHNkVFdzJqb0VhMGd6Wm90a2cr?=
 =?utf-8?B?YUVqWUpqODVlTUhTSHFDMDdPU1FxTktxblZDVTc5U2xxWTFMVXY5ams3a1VC?=
 =?utf-8?B?WGRlb0JuVWNEVmxIKzNJVjg0bkYzaXFwekk1WDNTeGZtOGpPRWhZUXdONXpJ?=
 =?utf-8?B?N01YNUk3bGFGSHlWeVpKWnM3cTgvY1NSald6RjdCMGY2amN6V3ZQZzVpdHNU?=
 =?utf-8?B?cGhWVEpGMnFXQnFiSEtWemppZHp6QnZoVXlHb1F1eU96Mk1QLzRqN1kyTVAy?=
 =?utf-8?B?U3BWTDM4S1NrMGZudnNTZldBOGQ2Zk1OMjhRVTBIaytjYzJtZWZyVHRoWkhI?=
 =?utf-8?B?OUVtRlZoSnRSOHdZZHk1T3VVOTFBVGpLWDlZN3Q3ZTZaQmFkSzNTeGVpSVho?=
 =?utf-8?B?cHdxZHlSaFpzTGhUT1BtTGd3RXZHdjNwMWVrMXM2QVpsS2ZNSm4rOWJWaXpE?=
 =?utf-8?B?bnZFZ1ArN2MxblJwdFV1Z2dyd29xbG8vUi93Q0d4T0JNa3dIRGV5WnpWdXoy?=
 =?utf-8?B?N210SUxVZkZJeHdQVlZGNWJpT1lOZEZTc091SjZtdGhyQjlHV2pKWTZ4MDFp?=
 =?utf-8?B?b3BqUWg3eVp5VTlURWI4dE9HdzZSbTV6ZzJjM2d1NDFud0FVWUxYVzJJQ0dP?=
 =?utf-8?B?cyt0bDZmbmlzWnk4MDVxYzFxV3RFcW5tL25IbEd5Rm95czQ4cVNVU2xadlBZ?=
 =?utf-8?B?a01yZlV1UUxBYzBYSmoxVmhOaVFJNlRUZ3NWaWxsa0pFbzZiRTkvdWxYQVlq?=
 =?utf-8?B?TEVYaVZld2ZRc2xleUlaVnBSd0hlS2h6REE4ODNkRG1kbmpvdmE5UWFnNVFV?=
 =?utf-8?B?aldtODIrLzAyalBKZEdCdFFFWVgwOWRxR1ROdmJKMkJIeFdUZ0E5d3VOL1Js?=
 =?utf-8?B?OXZuUXBHWWV5THJBa0tCWjhPTjdLTEVXT2o0M2tLK1p1blQ4UWhUUHM5UjhB?=
 =?utf-8?B?NzNvMjN5Z3Avck1SZVI2RTBVd01seVZjczRaS0JPbnhFeHl5ZHJDVFRvemVt?=
 =?utf-8?B?aXhUU3NjR29TNzk5TldYUmkwWEg2aS81aEUwcms2ZXg4S3R3ZFFaNHBHRFRk?=
 =?utf-8?B?U2ZBN0ZKekJJbkpsRU5QUGVGUTdabzk5UTFFK0ZVaHB2MG1jN1FnT1lOQ0Fj?=
 =?utf-8?B?bkF0aW0vbzdwUTMxTm9ZcmhxUDE5T3RYcnVWb3BGVzkyVzVlQkF1cGEzUnJF?=
 =?utf-8?B?SXpZNWdqdWV5TEw5UU5sSjl1aFVMQnZsT0Y5T2l2VnB5QysyN2ZacU1VZEhG?=
 =?utf-8?B?bDBmU0MzSSthNGZUOVV6NzJlT2xldnp1Vzg2L3dTbjRqOUl2YUhTbDdNUERt?=
 =?utf-8?B?VlNGVnVOU2hOQzBFdG04M3VlQ2ptb29wbjFDTWdSaW94NC9tVlcrZHRRVjVm?=
 =?utf-8?B?d2J4dXR1QkJjTTNPS1NaTEJKWlJxN3dSSHNGd0MrRThucTBhb1k5MzVsbEZh?=
 =?utf-8?B?YWFMWGJGSmpZbUVNNGEyMEJvdTd0Um8zczJWWk5tZE5oZmRpT2w3VEU4b2Vz?=
 =?utf-8?B?RGZCT3dCbHZNc216cVZqWkRieGFQNEpjUkV5NzQramQyOEpEbWdCckZTRTVD?=
 =?utf-8?B?b3BidUtwYk1NN2lEVkN3Lzlvblp6cVpwNnc4Y1NzUHhkenNUcWRzM3FHTnVY?=
 =?utf-8?B?alU0OEoxU1NFTnV5S21iMUhQNzdwT2VZVzliSXM5d0kweFMzWDgzMUpwS2t2?=
 =?utf-8?B?S0R2K0JHamRVRFdJdmhkWnM4MWxQUCsxem5jZ0pKS3ZCV0tmWUtBdEU4Nkk2?=
 =?utf-8?B?aTRBeTdsbjVpUkxKWTNGaEdLaG8zNDQwaXprT2VqMTkyU0x6cW9pemtzdFJV?=
 =?utf-8?B?MjZ0NEg5VUlYd0dmT1Y2WXRWcys1UUk2MktaekZMZnJCb1JCZ2VhNWR2WVl4?=
 =?utf-8?B?L2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b9b442b-7a88-4ad8-41df-08dd502b9614
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 14:50:28.9889 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BFpanl0QRN7zOcrmLkFvqqzVm8fF6dTzxU/DUVDPRr7oblantrEF8vrfUqIfSXMYW594CLmfB0Azj8bhy6dtDPzNAnrRr0vBkHJNViuwJ1s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6162
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

On Tue Feb 18, 2025 at 9:02 AM UTC, Arun R Murthy wrote:
> Hook up the newly added plane function pointer
> format_mod_supported_async to populate the modifiers/formats supported
> by asynchronous flips.
>
> v5: Correct the if condition for modifier support check (Chaitanya)
>
> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> Tested-by: Naveen Kumar <naveen1.kumar@intel.com>

LGTM
Reviewed-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>

--=20
Best regards,
Sebastian

