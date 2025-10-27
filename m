Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 966BEC0FB41
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 18:40:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43AD610E524;
	Mon, 27 Oct 2025 17:40:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RMMpqyJX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46EB710E524
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 17:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761586804; x=1793122804;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=i5K/9PEtQC+cT14BFRoPUWaIgu6orl5iqg5qLyHA+G4=;
 b=RMMpqyJXNwIFLPwSZ5SZiLjprn92wsowI0iDxQqpfJxMhJ4QejsWxk1T
 y/zmX0/cveXRqZKMNO10plmKlJbDvF943b+gmDLOYmu4jTUielyIccTGf
 EIKtLqL1Y+7QZpLRKO5Jswp1Zea+dBrecs5yYl+nS4NTDd7S6yieASCQK
 iDcTZtzqjqtqq2YM9y6Efw7XJQ3gFEWgAGptpCYuxnUR0F1/JmUu7tzAK
 1HgWGuguOCPaD4nXR43ATaYO7koWP0FYZp/DY5Orn1yKLNr43iBhee7jK
 qDCA8odnWsPJq0pvgfV1mCwgvUKis0m8SL5pJO08iRfpQC2tcMNnu4Gqd w==;
X-CSE-ConnectionGUID: ci/jwmpMRRWIcRM7MiI7IQ==
X-CSE-MsgGUID: D23xfNxsTken3xj9Loh49w==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="81099751"
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="81099751"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 10:40:03 -0700
X-CSE-ConnectionGUID: W1lZZstZRKi05MuePID2VA==
X-CSE-MsgGUID: l9e7SG2YSEeCrZDJrfqrJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="189481789"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 10:40:02 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 10:40:01 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 27 Oct 2025 10:40:01 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.36) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 10:40:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u8I4EZivXBjbEEwhHvmB05l3gqRGKjqxIH74WaBmG7ioQj2iCh2o/SF+JIjP5POkaOmmTjhIYWqSckqU/ggi+6+5gV1fCNFzqEum7puWt3b6FMBRdqBCbDccGnbWkQZ8n/AwbFNvlZdGYc34NZ2/ThCatXjJRC12M/FZTzttU6X9/RAU06ImGgQxOtzfz6jsuJjxAfoI6lcRLEmrmY6rTHDsgB4y5oa8UmS9jMxpY3AXg1HbWLaJ1P5gj2p+2PRvJinnd1oj/K4FRgUmj9xTuRWbt7l1ylZMdCffgRWyQMyJ+15Sy4987sw5aTAlVFJxF6Fqz5Pd0RO1cGJuet8G4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a0bNXuE32dbgUdfRI2KyYA4RasKZZlVnyfMehjBwnBQ=;
 b=Zo0za5FVmVEEpJw4ntcKMECBXuQqyssobaNp/9iK2H+RCbwYRlEbdeYbaCLmVmMQh4q5c0yT8nWtPGhZJ/BP0mT7dppS2A+DD1GlqaV01gTSpLUAGu9CKNc7IJVShcbbBiK6N+oYcOReYwBShxIiaTT8d9cjAt/7tVFJu+d0niPgIZNzAiAfrQco+gOmi/bvi67serBrHsivWDzRz/6RZsYypiWK44Lm+k85tcbq90Ki7vImBLUftsuGkhpF3XzCiXyLW8kTttLKTaabf955LNRIGyNzxPHs4sCsfP2mmMlmO7AkxHvl9IQSu3JUJFagqXrsGjPiRalKLO74oLdyhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BY1PR11MB8008.namprd11.prod.outlook.com (2603:10b6:a03:534::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.19; Mon, 27 Oct
 2025 17:40:00 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 17:40:00 +0000
Date: Mon, 27 Oct 2025 10:39:57 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Philipp Stanner <pstanner@redhat.com>
CC: Philipp Stanner <phasta@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, "David
 Airlie" <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>, Christian
 =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH v2] drm/sched: Extend and update documentation
Message-ID: <aP+ubU1/W5KIEUCY@lstrano-desk.jf.intel.com>
References: <20251023143803.150978-2-phasta@kernel.org>
 <aPqdr98ANKN53GKm@lstrano-desk.jf.intel.com>
 <bd2fda6dc370432e5478c891514bce5d8a0d8b76.camel@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bd2fda6dc370432e5478c891514bce5d8a0d8b76.camel@redhat.com>
X-ClientProxiedBy: MW4P222CA0023.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::28) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BY1PR11MB8008:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ed6476d-4643-42c4-3522-08de157fda61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aytWbnl5aDUzakFEOVdmOGZaWUM4aE9sTFRPMmg3RjhmN0VFQkhWVFU1NVJ3?=
 =?utf-8?B?YVM0cGJ5RVBOK1dlYkZ6Wit0TzBBcDdrRlBxclNZN1ZUVUsrdWd2MThySlE3?=
 =?utf-8?B?RmVoYlEya3pEMVo4Mms4NzBEY1dvS3ZvWXVjUnYvK2RCUSttbmo3S0Q3a3Nv?=
 =?utf-8?B?M3hFQzBzYjZCR3lLVjhjeDE0Q2xHNFg5NmIwcE5nL2J4dk1wVHJCOVRWR0VQ?=
 =?utf-8?B?ZXZpUHBaQW1sbWV3eStCMHBqenlJYXkwa2RvdkFzbVBRY0s2WFVRYlJqU21N?=
 =?utf-8?B?Tm80eTBjdXZUNkVoUWROQTN2OU9FMlo1T1g1KzlEdjQwL1FENmZrRkVBRXZC?=
 =?utf-8?B?anhQeU50ZElxaWFnRlMyN0NHdEYybDJnc2VKdHJHRWhOUUp5TDJGSFdyVktL?=
 =?utf-8?B?Yjkzam5vTzNZbXRqU29CcTBZaDEvbncyeG1rekFrRkxSMVpGYXdQc04zc2I5?=
 =?utf-8?B?M2Z4b0hhMWVVWXBwM05xY0cwNzNVYWJsZVdRZVBTNEFhaXZmRGdCdzRESk9F?=
 =?utf-8?B?SmpBYWR5aHlGc05zNEFpYXdqeDhpajhyL3ZZdzF6cnZLbDBIVk1EQkJROWg2?=
 =?utf-8?B?dVc5L2ZFQktIR3k5ZXlwa2s0S052MnZLcDUwYm5rdzZaaFFoZVdpOFN3eEM1?=
 =?utf-8?B?ZU5JcnNyd3RuNmRINkpxK2RnOEhWNG1aTGFaN0hRQkZzWHJxN08zY0d1eWty?=
 =?utf-8?B?amZRV2VnekUxNWgvWjJTVnJHWnczU21QbmNvc1A1R2NwclhmT0Uvd2FZa1hZ?=
 =?utf-8?B?WmVQVnhDcm13dCt1SElsSURUL3NKWW9ZWFhCZnlGTEN3MWJ3UHdzM0VnZmY0?=
 =?utf-8?B?MnBuM2pjZHI3QXNxWGhsOW1JZXRRSEZtUys5YjZUZlJEUHM3ZE1hOWplRDNQ?=
 =?utf-8?B?NE5jblF5bzV3cmd5NWp0Y1UxOGR4WEcrOFhMR00yNXRydFBQRngxZ0NHeWI3?=
 =?utf-8?B?RmZ5TldudTh4S0RqWVh1bVpLUmtZSEhPUE9RcVd2azZ6NEFRTlg2OXdPaFcx?=
 =?utf-8?B?anBFTFI0Rnl0dFd1MHBOcVFkSjhCZURkeWFyWnAwNHcxLzFmVFQvZzk0OFVl?=
 =?utf-8?B?cHZXbldzUy9SbWtobmxYQnhxeHVFS2JOWXYrZHlqdk16Q3ZhU0ZtUCtWQnJv?=
 =?utf-8?B?ZHVMSlJZcG9xUmZSVVMrN2l5ZzdTZkRmNlpMK3BHMHUwWFVKZCtjUHZxZUQ1?=
 =?utf-8?B?akxudEV1QWpYOFMzWFJHemc1b21OZTRiS3hFbGRSZVF6aEhsR1VXU08zR3Bv?=
 =?utf-8?B?MFBUNTBydnpNRmEzc3R1TGlkcjNlRnlHRjVKa09uMWRldGYvUUMxYmhLNEN4?=
 =?utf-8?B?MExFM29zTlBlenU3NEl3eklNcHBYZ0p0cWVqcDlmSXJ5MEFsRy9OQ1NzcWdB?=
 =?utf-8?B?ZGo1dTAvQzF2VUdtUnkrQXFlcm1JS0NHRHJrQ2NZTEQ1cTNKRFFqWVZBbERB?=
 =?utf-8?B?V09VdlZXY0dlZzBZY0VYR2ZmTzRidVd2aWVxU1EyS1M5M3VtNjJHU05nZ0Rv?=
 =?utf-8?B?UkUwQzkzMW9JY3piUGE5Y2xOL2NFbVZrMWRBMFZQME5GRHNMZGEwQkU2ZSs3?=
 =?utf-8?B?djZHZDI5ZUs5djEwd1F1N3lYYmZwaTVuSjBHWkhXaXZXZy81ZElha2JyNUtY?=
 =?utf-8?B?aVpXY2tVaUtFOTdOMHR6aTVjUzhnRHRXc281YWFSb1JWdjFzVjVBckpIcTlV?=
 =?utf-8?B?SHRSRVduTnpoMXJOODFmWi9Sb2x1NERxMVcxbTlVWG96aEJqZnlvT2ZjSk1P?=
 =?utf-8?B?VFE2NGt2NXFnUWl4c1JYMVVRVHpkdFRCZEdFVzNMZ21XalVjaHg3TnBBZjVh?=
 =?utf-8?B?cVBZVXdVZmVWTEhqU1AvTTIrUXIzaVVQWmFnL0dLRHE0dGdvWjdyUldlbTZi?=
 =?utf-8?B?ckpEUU9HY2ZqL1gxQlBVaE1pa3JEYkU5MXBOdU1iNGwvb2c9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?djd4cDk0WDhUdG1PdGZ6a0VNUm9md3B4Yjg3UzdMVWVmdzRhRU4vbzZ0bDZG?=
 =?utf-8?B?S3ljWEsvWjJ3WUx0NUI4aFNrNVlGOU56STIwQ2kvQS9xRXlDRzFyTTNOZlRQ?=
 =?utf-8?B?NnZ5YUt0dGFoWmNMMXFqdUZVSlNaMW1WNy8rSm02Z1hvUkFnRy9FaDJlWERZ?=
 =?utf-8?B?dmQ2a2g4azdmT24vRGh3TFRvR3JINCtWU0NkWDBkMHlwQm5XNHplNll1Uzh1?=
 =?utf-8?B?WFptLzRsaHQ3TGgvRWQ3Z3JSaG16RXJnK0pnTGpLeXo3a1NTcGhaa2hCeGox?=
 =?utf-8?B?bjRRendIT0cyMC9mQ29wWkt2aDc2MnRSR1RSVm5yMVBCRzJZNFJySFB4c0ww?=
 =?utf-8?B?aC92UVg2WkRIemNWbGljVXR6OFo1bFYvMGZrU2F1a3dSdlpDMXRVSTNlRDZC?=
 =?utf-8?B?K3BtWmhmbVRSaVcxQ2F0YTNYajUvM0NTYTNmczhMdGJpemZLZFVZQmN1V3I2?=
 =?utf-8?B?enJWaVc3bkh2Znlyc2M0UkVveXBqK0FHMVMrL084QzNBU3VHL1BQaCtuTGxV?=
 =?utf-8?B?TjNhbEhDbmlwNUxzL2tBVXBITEhCblNJQUpPRGp2RG15NHRuaFdQaXM0TXRx?=
 =?utf-8?B?NDVVdG43RERtMWZrbmVPYzI2M0dUd0VFZ0JSSGxSenhwTlM3Vkw0ZGpra1JU?=
 =?utf-8?B?aDJDNlN0ZlVEMG5Qb1pWblhqUDF3dGhJcE5YU05FMDdaT3l2SkwxU3A3RDZv?=
 =?utf-8?B?MVFHVHp3NmcrNStXK2RmTDdPeDFXUlNHcW5nemxOTFlSZGNDU2VYZHN1MEZs?=
 =?utf-8?B?RDdUMzhvcUNLd1ltRWN3V1RlTlZhMHk5U1N3a3M0VHFpZEExN01MZks1MU9w?=
 =?utf-8?B?VG5pSnlKdzJaWGdxVzcrRmZZN2hwOVJPL1lGTjJyd0FrTDVuZTRNTFVkREgx?=
 =?utf-8?B?bEZqZmJ2NnBKcUEzckQxcWJyK3ArdHYwazFmK2k3bFBOWE93a3VlK3FiZTJv?=
 =?utf-8?B?ZUNVNkZja0ZsaVVIbXk5aklnMTZaeE5oRE9OWHNQbFpMMEEzaTgvODBXVmpR?=
 =?utf-8?B?SDlFd3laWWpiMUo0VDM0TmxRelJhUjBEZUtYWHRrMUN5NU41dW5mSzEvdm8z?=
 =?utf-8?B?OStNNVNsc1NSTzhpQ3BweEFFVjdPRXpBTit1Z0Q4NVlydGVxdVVVUUYzR3Jh?=
 =?utf-8?B?c3JaZkhkRW9YS2FQYURiMkQrQTNzNDMrNUluWW0xWHFOS205UHpEdzNpVnUx?=
 =?utf-8?B?Si91WTQ0eWRCTHBUdXZyOEp5Tml6QnJDSTFoKzhqbjA4TnNWa255eGwvNHoz?=
 =?utf-8?B?eWFwdk1ERTk1QmlTamxxRDZYanU5dHVJTTlZeFR2T2g5Q0c5eU4ySEp5bDJt?=
 =?utf-8?B?Tk5XREQ3WFd0RmxNS2R4M1NXV0pJbjVaZXU5UytFOVBvWkl0dEtMTGN3ZlJt?=
 =?utf-8?B?VnRxMjNvdzl3TmZIblFzWVZjdWo2YzZCVWo5Q2dYTGg3VlhhRkl6U2lhWTRX?=
 =?utf-8?B?dkhDNDlxdXJKL2tXMEFDZ2x3OUxqem44Y29jQWxhakR6U3l4dERTbXp0a2V3?=
 =?utf-8?B?WTNybEo3eW1FbWtwNmVlVVZXMGl1Z2ZkM1VuU0M1ZDhzNy83a2swaklhMUk1?=
 =?utf-8?B?cVByWCszOEhMOHExUGxTMnFFbTcyTXZtejE5SVBkWDZTRHJhd2ovRWkzM0li?=
 =?utf-8?B?cktiMkxFeTM4eWt6d0ZYeGdpQ1ZadzJxUzkvclJuZWUyK1lrRXFMdWZ5ZEZE?=
 =?utf-8?B?VytqVUpGSlRNT0h5S1BpazczRkxCT0pTR2JOYk5uZ2lNNjhuR3JkNEp0SWh6?=
 =?utf-8?B?TzJXTVZHQ0pBdC8wbWkyeVNXdXJVMk9wQ3hIWmJZc0s4bWFqT0d3L2xhemMw?=
 =?utf-8?B?T1BKRUJ1SkJmLzZnUmFUeDRSalM2a2I1WFZUcERJUkdOV3plQnhMNlN3QzYr?=
 =?utf-8?B?NjdwQVBhbGZ2bVJ3WE9aMjNGci93T015NndQY1BlN0VzMStrSExlb3ZDYk5M?=
 =?utf-8?B?VVI5d3FxT250VDczYWtUWm41Y0U1K3BQZzdUZEtDQ28zbmFEOGZ2Q2UxRTRx?=
 =?utf-8?B?UGRhR1lKUTM2NCtMWkVVNlZxSVNGU0EwdU1jaFRyQi9QN2hqNlY4UndMdHhl?=
 =?utf-8?B?R0xMR1JYdUdVRjdmeW5PczVoRlY1MmNGQ1NiVVdyMjJpeTlKVVBGVlNZVWt3?=
 =?utf-8?B?NmxxLzBFcExySjdTVHVGV0tYU0dlNmZuamJ5dnRpUW5JVUdESXlkMVk5MmJi?=
 =?utf-8?B?cmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ed6476d-4643-42c4-3522-08de157fda61
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 17:40:00.3481 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3LMT8l0W26PBR6Hs/iyiT2g6qnDeSc2/fZuKcyxeKseL0FZZN/GFOvaY890eaBFXlrw5DCmkvofF0mEgogBp9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8008
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

On Fri, Oct 24, 2025 at 11:12:40AM +0200, Philipp Stanner wrote:
> On Thu, 2025-10-23 at 14:27 -0700, Matthew Brost wrote:
> > On Thu, Oct 23, 2025 at 04:38:04PM +0200, Philipp Stanner wrote:
> > > From: Philipp Stanner <pstanner@redhat.com>
> > > 
> > > The various objects and their memory lifetime used by the GPU scheduler
> > > are currently not fully documented.
> > > 
> > > Add documentation describing the scheduler's objects. Improve the
> > > general documentation at a few other places.
> > > 
> > > Co-developed-by: Christian König <christian.koenig@amd.com>
> > > Signed-off-by: Christian König <christian.koenig@amd.com>
> > > Signed-off-by: Philipp Stanner <pstanner@redhat.com>
> > 
> > This is great documentation—thanks for writing it up. It clarifies
> > several bugs I've noticed in multiple NPU drivers over the past year
> > related to reclaim, making it clear that these behaviors are not
> > allowed. 
> > 
> 
> Good to hear that we're in line here.
> 
> > Also, check out [1], which enforces some of the reclaim rules
> > outlined here.
> 
> Will take a look hopefully next week.
> 
> > 
> > A couple of minor nits below, but I'm inclined to RB.
> > 
> > [1] https://patchwork.freedesktop.org/series/156284/
> > 
> > > ---
> > > Changes in v2:
> > >   - Fix some typos. (Bagas Sanjava)
> > > ---
> > >  Documentation/gpu/drm-mm.rst           |  36 ++++
> > >  drivers/gpu/drm/scheduler/sched_main.c | 229 ++++++++++++++++++++++---
> > >  include/drm/gpu_scheduler.h            |   5 +-
> > >  3 files changed, 239 insertions(+), 31 deletions(-)
> > > 
> > > diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
> > > index d55751cad67c..95ee95fd987a 100644
> > > --- a/Documentation/gpu/drm-mm.rst
> > > +++ b/Documentation/gpu/drm-mm.rst
> > > @@ -556,12 +556,48 @@ Overview
> > >  .. kernel-doc:: drivers/gpu/drm/scheduler/sched_main.c
> > >     :doc: Overview
> > > 
> > > 
> 
> […]
> 
> > >  
> > > +
> > > +/**
> > > + * DOC: Entity Object
> > > + *
> > > + * The entity object (&struct drm_sched_entity) is a container for jobs which
> > > + * should execute sequentially. Drivers should create an entity for each
> > > + * individual context they maintain for command submissions which can run in
> > > + * parallel.
> > > + *
> > > + * The lifetime of the entity *should not* exceed the lifetime of the
> > > + * userspace process it was created for and drivers should call the
> > > + * drm_sched_entity_flush() function from their file_operations.flush()
> > > + * callback. It is possible that an entity object is not alive anymore
> > > + * while jobs previously fetched from it are still running on the hardware.
> > 
> > This is not how Xe has implemented it. Instead, on FD close (or queue
> > close, for that matter), we trigger our entity through a GPU command and
> > immediately timeout all jobs,
> > 
> 
> How can Xe "timeout all jobs"? Are you interfering with the scheduler's
> timeout work item?
> 

We set TDR to zero and it naturally removes queues from the hardware,
signals all fences, queue ref goes to zero once free_job() is called on
every job, and finally queue (entity) is freed.

> Anyways, the docu just says "It is possible", not that it's typical. So
> the docu is fine here, agreed?

Sure, I just don't want to get into situation were designs like Xe's are
viewed as incorrect as this works rather well.

> 
> >  signaling them accordingly. Technically,
> > the object entity can outlive the FD, but the effects of the FD close
> > are externally visible. The complete teardown process can outlive the FD
> > as well, since it involves multiple ping-pong steps with our firmware. I
> > believe this approach is also valid.
> > 
> > > + *
> > > + * This is done because all results of a command submission should become
> > > + * visible externally even after a process exits. This is normal POSIX
> > > + * behavior for I/O operations.
> > > + *
> > > + * The problem with this approach is that GPU submissions contain executable
> > > + * shaders enabling processes to evade their termination by offloading work to
> > > + * the GPU. So when a process is terminated with a SIGKILL the entity object
> > > + * makes sure that jobs are freed without running them while still maintaining
> > > + * correct sequential order for signaling fences.
> > > + *
> > > + * All entities associated with a scheduler have to be torn down before that
> > > + * scheduler.
> > > + */
> > > +
> > > +/**
> > > + * DOC: Hardware Fence Object
> > > + *
> > > + * The hardware fence object is a dma_fence provided by the driver through
> > > + * &struct drm_sched_backend_ops.run_job. The driver signals this fence once the
> > > + * hardware has completed the associated job.
> > > + *
> > > + * Drivers need to make sure that the normal dma_fence semantics are followed
> > > + * for this object. It's important to note that the memory for this object can
> > > + * *not* be allocated in &struct drm_sched_backend_ops.run_job since that would
> > > + * violate the requirements for the dma_fence implementation. The scheduler
> > > + * maintains a timeout handler which triggers if this fence doesn't signal
> > > + * within a configurable amount of time.
> > > + *
> > > + * The lifetime of this object follows dma_fence refcounting rules. The
> > > + * scheduler takes ownership of the reference returned by the driver and
> > > + * drops it when it's not needed any more.
> > > + *
> > > + * See &struct drm_sched_backend_ops.run_job for precise refcounting rules.
> > > + */
> > > +
> > > +/**
> > > + * DOC: Scheduler Fence Object
> > > + *
> > > + * The scheduler fence object (&struct drm_sched_fence) encapsulates the whole
> > > + * time from pushing the job into the scheduler until the hardware has finished
> > > + * processing it. It is managed by the scheduler. The implementation provides
> > > + * dma_fence interfaces for signaling both scheduling of a command submission
> > > + * as well as finishing of processing. &struct drm_sched_fence.finished is the
> > > + * fence typically used to synchronize userspace, e.g., in a &struct drm_syncobj.
> > 
> > Is it ever not the finished fence? Early in Xe, I originally used the
> > hardware fence, and it caused all sorts of trouble. One reason the DRM
> > scheduler is a well-designed system is that the finished fence can be
> > installed universally.
> 
> Agreed, we can say that it's always the finished fence.
>

+1
 
> (you should never call the GPU scheduler a "well-designed system",
> though xD)
> 

Well if you worked on driver which invented its own scheduling (i915)
you might have different view... The GPU scheduler has its problems but
it really does work quite well.

> > 
> > I also suggest we add a wrapper to access the finished fence, so drivers
> > don’t need to dig deep into scheduler objects to retrieve it.
> 
> Yes, ACK. I actually once had a patch somewhere which adds such a
> wrapper and uses it in Nouveau. I can digg for it; but feel free to
> provide one if you have some cycles.
> 

+1. Maybe I'll wrap this into my series cleaning Xe's layering
violations.

> > 
> > > + *
> > > + * The lifetime of this object also follows normal dma_fence refcounting rules.
> > > + */
> > > +
> > > +/**
> > > + * DOC: Scheduler and Run Queue Objects
> > > + *
> > > + * The scheduler object itself (&struct drm_gpu_scheduler) does the actual
> > > + * scheduling: it picks the next entity to run a job from and pushes that job
> > > + * onto the hardware. Both FIFO and RR selection algorithms are supported, with
> > > + * FIFO being the default and the recommended one.
> > > + *
> > > + * The lifetime of the scheduler is managed by the driver using it. Before
> > > + * destroying the scheduler the driver must ensure that all hardware processing
> > > + * involving this scheduler object has finished by calling for example
> > > + * disable_irq(). It is *not* sufficient to wait for the hardware fence here
> > > + * since this doesn't guarantee that all callback processing has finished.
> > > + *
> > > + * The run queue object (&struct drm_sched_rq) is a container for entities of a
> > > + * certain priority level. This object is internally managed by the scheduler
> > > + * and drivers must not touch it directly. The lifetime of a run queue is bound
> > > + * to the scheduler's lifetime.
> > > + *
> > > + * All entities associated with a scheduler must be torn down before it. Drivers
> > > + * should implement &struct drm_sched_backend_ops.cancel_job to avoid pending
> > > + * jobs (those that were pulled from an entity into the scheduler, but have not
> > > + * been completed by the hardware yet) from leaking.
> > >   */
> > >  
> > >  /**
> > >   * DOC: Flow Control
> > >   *
> > >   * The DRM GPU scheduler provides a flow control mechanism to regulate the rate
> > > - * in which the jobs fetched from scheduler entities are executed.
> > > + * at which jobs fetched from scheduler entities are executed.
> > >   *
> > > - * In this context the &drm_gpu_scheduler keeps track of a driver specified
> > > - * credit limit representing the capacity of this scheduler and a credit count;
> > > - * every &drm_sched_job carries a driver specified number of credits.
> > > + * In this context the &struct drm_gpu_scheduler keeps track of a driver
> > > + * specified credit limit representing the capacity of this scheduler and a
> > > + * credit count; every &struct drm_sched_job carries a driver-specified number
> > > + * of credits.
> > >   *
> > > - * Once a job is executed (but not yet finished), the job's credits contribute
> > > - * to the scheduler's credit count until the job is finished. If by executing
> > > - * one more job the scheduler's credit count would exceed the scheduler's
> > > - * credit limit, the job won't be executed. Instead, the scheduler will wait
> > > - * until the credit count has decreased enough to not overflow its credit limit.
> > > - * This implies waiting for previously executed jobs.
> > > + * Once a job is being executed, the job's credits contribute to the
> > > + * scheduler's credit count until the job is finished. If by executing one more
> > > + * job the scheduler's credit count would exceed the scheduler's credit limit,
> > > + * the job won't be executed. Instead, the scheduler will wait until the credit
> > > + * count has decreased enough to not overflow its credit limit. This implies
> > > + * waiting for previously executed jobs.
> > >   */
> > >  
> > > +/**
> > > + * DOC: Error and Timeout handling
> > > + *
> > 
> > Should this section mention DRM_GPU_SCHED_STAT_NO_HANG usage?
> 
> Yes, it should.
> 
> > 
> > > + * Errors are signaled by using dma_fence_set_error() on the hardware fence
> > > + * object before signaling it with dma_fence_signal(). Errors are then bubbled
> > > + * up from the hardware fence to the scheduler fence.
> > > + *
> > > + * The entity allows querying errors on the last run submission using the
> > > + * drm_sched_entity_error() function which can be used to cancel queued
> > > + * submissions in &struct drm_sched_backend_ops.run_job as well as preventing
> > > + * pushing further ones into the entity in the driver's submission function.
> > > + *
> > > + * When the hardware fence doesn't signal within a configurable amount of time
> > > + * &struct drm_sched_backend_ops.timedout_job gets invoked. The driver should
> > > + * then follow the procedure described in that callback's documentation.
> > > + *
> > > + * (TODO: The timeout handler should probably switch to using the hardware
> > > + * fence as parameter instead of the job. Otherwise the handling will always
> > > + * race between timing out and signaling the fence).
> > > + *
> > 
> > This might be a bit invasive, and honestly, I'm not sure if the
> > subsystem can handle it. I'd leave out this TODO for now. We can't
> > predict the future, so it's probably best not to try in the
> > documentation.
> 
> Yes. I think that TODO is actually surplus now that we have NO_HANG.
>

My concern with replacing the job list for resubmission is that some job
state information is required. If I recall correctly, in Xe, this
includes the job's batch address(es) and its position in the hardware
ring where it was originally programmed. Of course, we could shuffle our
data structures around a bit but a little invasive.

The use case for resubmission in Xe that is absolutely required is VF
migration - it doesn't work without resubmission.

I also suspect rewriting every drivers TDR to use fence based interface
rather than job will be non-trivial. Or jobs disappearing immediately
after run job will break a bunch of drivers in non-trival ways.

Matt

> 
> P.
> 
> > 
> > Matt
> > 
> > > + * The scheduler also used to provided functionality for re-submitting jobs
> > > + * and, thereby, replaced the hardware fence during reset handling. This
> > > + * functionality is now deprecated. This has proven to be fundamentally racy
> > > + * and not compatible with dma_fence rules and shouldn't be used in new code.
> > > + *
> > > + * Additionally, there is the function drm_sched_increase_karma() which tries
> > > + * to find the entity which submitted a job and increases its 'karma' atomic
> > > + * variable to prevent resubmitting jobs from this entity. This has quite some
> > > + * overhead and resubmitting jobs is now marked as deprecated. Thus, using this
> > > + * function is discouraged.
> > > + *
> > > + * Drivers can still recreate the GPU state in case it should be lost during
> > > + * timeout handling *if* they can guarantee that forward progress will be made
> > > + * and this doesn't cause another timeout. But this is strongly hardware
> > > + * specific and out of the scope of the general GPU scheduler.
> > > + */
> > >  #include <linux/export.h>
> > >  #include <linux/wait.h>
> > >  #include <linux/sched.h>
> > > diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> > > index fb88301b3c45..a97351435d9e 100644
> > > --- a/include/drm/gpu_scheduler.h
> > > +++ b/include/drm/gpu_scheduler.h
> > > @@ -458,8 +458,8 @@ struct drm_sched_backend_ops {
> > >  	struct dma_fence *(*run_job)(struct drm_sched_job *sched_job);
> > >  
> > >  	/**
> > > -	 * @timedout_job: Called when a job has taken too long to execute,
> > > -	 * to trigger GPU recovery.
> > > +	 * @timedout_job: Called when a hardware fence didn't signal within a
> > > +	 * configurable amount of time. Triggers GPU recovery.
> > >  	 *
> > >  	 * @sched_job: The job that has timed out
> > >  	 *
> > > @@ -506,7 +506,6 @@ struct drm_sched_backend_ops {
> > >  	 * that timeout handlers are executed sequentially.
> > >  	 *
> > >  	 * Return: The scheduler's status, defined by &enum drm_gpu_sched_stat
> > > -	 *
> > >  	 */
> > >  	enum drm_gpu_sched_stat (*timedout_job)(struct drm_sched_job *sched_job);
> > >  
> > > -- 
> > > 2.49.0
> > > 
> 
