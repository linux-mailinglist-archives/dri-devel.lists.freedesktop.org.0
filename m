Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 282E4CB7CC8
	for <lists+dri-devel@lfdr.de>; Fri, 12 Dec 2025 04:55:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FF2B10E257;
	Fri, 12 Dec 2025 03:54:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mGs/RRY8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3081F10E257;
 Fri, 12 Dec 2025 03:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765511697; x=1797047697;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=X7AEVp0zdAwJlVh0bTB5OuGzjqfdGU86mXPJs6wZOhs=;
 b=mGs/RRY8QiY1LZt+kzbTDasX6ji7LfNgQ5+dmjWvMGD8uyRmWffeRsq6
 OKxFHqnxKjfMs9fBwT6rqcdIeUGih7M2AzjNJ1iYnr0i4rWjkR5y0aXXO
 PDsV34pmTWQT2OlXdelBrPsJNv80meNyv39T+cceWXtmhaqRZTu04RIPS
 mVa7VhMwmQgQO3c0d5DYnzSUZMjOzCezSP0aTkaKgcN+/ZO/MINtbV6tI
 yz4VKXnRpDl9M/CsQeQ8I4bObbVlD6nKkz1GqmgYb/DmspTl9bOvBqNKv
 c9gfPb59zjzpO3TVTUBCHqEDTEf1s6isK2PwSCv46NAdeLs7ysZyU3zGG Q==;
X-CSE-ConnectionGUID: HmViGLi8RtyKpm7smmJWLA==
X-CSE-MsgGUID: O8QoZxdLQLez1kDwMuzcxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="55054176"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="55054176"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 19:54:56 -0800
X-CSE-ConnectionGUID: iE/qUbOKTnmRWac6LJHR6A==
X-CSE-MsgGUID: Hk+RUrTASV+wuMpobhu2/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="197786353"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 19:54:52 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 11 Dec 2025 19:54:51 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 11 Dec 2025 19:54:51 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.47) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 11 Dec 2025 19:54:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hDFyuzcgrHdZ0BvpoKpMUNhzfbT5jt5B08bb9iM6eQEa0kpnpIGiEzILYypsi2yjHte++Gu0DgAcFqyI4QfTbLlGU71nBZSEmJaRVdulQ0kUSGZtUz86ir06vlUt8HnYzhC0cGAUJaVPP6h8ecLU6bdSOPWmDW7qUKgzfvcWWYYchCaS1j7Ahn30wIRuEF1aOyxKS9WeYGiKunOb1SooPno13lQAXeGQrU2CjgMeFhqTQ3+HSTb/jWkYhD/W0/CqDuQTvmFx8tLbBARtfJU3brcc+o2nWFyG6fNGl6yEdUsWbsXnKXvYlJt7cpLcVyMsrcu0hgtoSopReZ/i3dQHKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y5ET2j/sGJEpkKzYpyZfQhA3bM9tNonpG0Wxs6O2Ns0=;
 b=r1JDIR9tc8iEmqdKFvaiUHneyiRclUYBagD0bcQJrtHqIhscaIDHOgP873IzGvIDfqqdEcMy4pyobcFLm5xNgBgbPYRD3K8x3TRSBaEzvjyMNGVvDId4LKAOfRW1HLHdq63LnuAHKuKcecprlBNqzbNXdZogjsCMFGcwxBHti+GkD3zSEzrkBYL7le1rNEhfpBSBN3lVB+t65ZRT0c9yOyW5xvktO5yms1jLpCbLvc5CBcKRY3TrG0d8cZiX6n8hAyIJ2pjXLjUSMPBg2EtKiml9GmoX689S4GRfwkgmxJZK/aVrz3Qon5lrKQTjFyDYEvAAb9gA8DlO8ulZOzvS8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ2PR11MB8540.namprd11.prod.outlook.com (2603:10b6:a03:574::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Fri, 12 Dec
 2025 03:54:49 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 03:54:49 +0000
Date: Thu, 11 Dec 2025 19:54:47 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <phasta@kernel.org>
CC: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 <vitaly.prosyak@amd.com>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, Alex Deucher <alexander.deucher@amd.com>,
 <dakr@kernel.org>, Boris Brezillon <boris.brezillon@collabora.com>, "Lucas
 Stach" <l.stach@pengutronix.de>
Subject: Re: [PATCH] drm/sched: run free_job work on timeout workqueue
Message-ID: <aTuSByKSKqsv8m3k@lstrano-desk.jf.intel.com>
References: <3e780e52dc0a7f1267e814c895e9d5e840a8c913.camel@mailbox.org>
 <d846a1dd-a705-410a-a043-ffae43bada57@amd.com>
 <aTjTucrVHe8TR/gN@lstrano-desk.jf.intel.com>
 <0508680962030eb0f858890a3183a545126614c9.camel@mailbox.org>
 <8ceb06b4-5f56-471d-91f6-a6ea6733e9a8@amd.com>
 <b0e9af12b924e09c0006f0a3068aca3e4ea6fc30.camel@mailbox.org>
 <aTmpFgeDsyq0a9vK@lstrano-desk.jf.intel.com>
 <cbf77a87f928cbeb3f05579a58919a44f3a40593.camel@mailbox.org>
 <e4830223-23a4-45cd-940e-2dbad1036704@amd.com>
 <49ccd3784e1ebc54e3a4fb70b2a961418a4ba231.camel@mailbox.org>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <49ccd3784e1ebc54e3a4fb70b2a961418a4ba231.camel@mailbox.org>
X-ClientProxiedBy: MW3PR06CA0022.namprd06.prod.outlook.com
 (2603:10b6:303:2a::27) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ2PR11MB8540:EE_
X-MS-Office365-Filtering-Correlation-Id: b487e630-e51d-428c-9072-08de393232b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RWlJdTJyMURURlJwUHQvd1RHU1pvVmllYXJXVTlOWVBDa2VBUlVCelNJUjdZ?=
 =?utf-8?B?eitBM0tkbkg3M1o5ZGpFWHpoeS9KOVBMOW51UEl6VVEyWUQ4TVd5eERsdGhR?=
 =?utf-8?B?bndoMHRCbHA4b2NtVHRTK0JrZkdzQVdvQnhuU2t0OEtuL3JWWFU2M2tGTi9x?=
 =?utf-8?B?Ynl3UW1xR0t4bmo3RWJWd0VjbnZHVEdyTmhPTWt5bHF3Wkc0SUE0c3N0R2c2?=
 =?utf-8?B?VVZmelprVmtlWWhUdHJJWTRkQkZ4OXFJeE5HV2VYMzRoNGJDa0kzbmxwakRC?=
 =?utf-8?B?QTJGcGJ1ejJhT2x5L0drSGhCL2NaSjVYYTB3OGdMM2orOC9pdkZMQTdrdnFG?=
 =?utf-8?B?K3lPRERtZlRPOTg2MFNVR0FSNGZIb2N3WlNpTXVwa2J6dmh3ZXB2aXc5eXFo?=
 =?utf-8?B?MzlQM1N2RGFabVRrTFpEY1RkV1NBN2c4L3RrRktqemdJMXoxK3djbFluOHlM?=
 =?utf-8?B?T0lvOWxnRjB1UGxNbHN2MHVyTUtBS0JGNmtLeEdRK21sWExrak54UWJqb3Zo?=
 =?utf-8?B?M1RXSlBBTUdFdlZORmJoTXZKY1I1L3BXRlNLUlRVRGx2U2Q1aTJ4ZERsNXBG?=
 =?utf-8?B?LzFBd3VwanFSYUR3UUxrT01QTTVwWkJBOU1odHp4R2ZqN1F3NUZIbm9pYmJ0?=
 =?utf-8?B?aXJOaloreVM4SkhsbGpDcXdJOU9WSDN0cU95ZzZGUXRUNjlOekVrVHpkZ3l6?=
 =?utf-8?B?WVZEK25qRDJvbXZSR3pqVjBWMkRYaThlSHNOUFkvWnlUVG5mcHNaQnpKaU5y?=
 =?utf-8?B?Z2hMUVFnQWZNNmRacVNpT1VZWXc0MllESk9icy9PaUxjc2dRdXRuNld1Wkgv?=
 =?utf-8?B?d2I0VUJpRU5uMUkyUXhnWlFFRkYvdGhFMG8vRUo4RTRzZTNSdUVKcE5SWmpL?=
 =?utf-8?B?TEJHMkZzVzVxdVZVR1d6VE9nTjZCY0xjb2JHU0pPYmVDd2hqVVBBWmc0UW5o?=
 =?utf-8?B?R3NTVUg4OEhlZXFHMS96MVQ1RnpSajJJQ1MyeGtzRjZ4WThTMk1wY3lITDN0?=
 =?utf-8?B?Znd6S2pNNVRpdUJXMnVITzVzYWFJS2hPbTIrd0J2eTZoaEc0WmtYb2x4Y3VR?=
 =?utf-8?B?bFBQcHU3bnJSRE9NejBZQnVaV2ZlY0hOaTBlNXhualEycCtLcHdXWGZLTC9r?=
 =?utf-8?B?Y2daaWhEKy82Uk02bGVnTTZ5QlhjRVc2Y01VTGtrVjV1L2hVNE8wY0Rkdjh4?=
 =?utf-8?B?d3JvaUxaQm5rMThpYkR3emF5T3NHT3crSVIxTGtzeGNkWnRkSVdRVnR3WGRK?=
 =?utf-8?B?LytFQ3lOdVhESTVzMTdkaENsOVBsUHdWZnhNb3d2MkR2NjZvdEJzck1IOHBq?=
 =?utf-8?B?cnRHcDRYM1h1Ui9ONnZQblhabzJNRFZkK3lGbVZrbUxzSndoZGZPSmFUTWtq?=
 =?utf-8?B?YlhLWGRjdSsrWnJZUVlPQWJnZEd3N1RZUk5mclFxbEJGZWVZcHc3anJNMmhM?=
 =?utf-8?B?YUZ5bHViN0RabjMxRUJkOXg3eDJQMFYydnhmZzNibUJaanlNbUZic3FlQnhu?=
 =?utf-8?B?NVZqazV0dkxTMXUyZWw0Nyt0SWFWTFQvN2xodXl6emo1a1VWOG04eEF4VUQy?=
 =?utf-8?B?NWhVbW1DdnZDWStiYzZYN3J1eUxLM3ZwRHk2OTFDVG1HaE1vRFR3RnF1YzFD?=
 =?utf-8?B?R0tZLzZCTVhsWUVVS2VRM3lXSlRHVHFQSFNJTTRLUnoyOUF2M1dFSmZUQity?=
 =?utf-8?B?c2ROeFgvZDgxWDh0SVhIR2d3V0k1bGQwcVNNS3Jra3Q5dkFteHRiYnpIOTdT?=
 =?utf-8?B?NUFmQzdNc0dTakdvd3cwZkk3RUxIU3QyODFqQ1FpU00zTzg5L0VIejhBWlBo?=
 =?utf-8?B?bXR2ZmVycVpMNndGRVRyYmJkNHRSclF1eU1HWHl2MTZZZ1hkampDY3NzcUI0?=
 =?utf-8?B?Ym4rS2lWQXJveVh3SzdZdWgxZm4wOWRWZUg1QkRMdTFhczQyUVdVWnpkMTYz?=
 =?utf-8?Q?nVXr22xJkpColahrPc2KvtKGt4Z9oPCR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SExSRHF3ZkV2T0I1dmFYemdYR1l6K2kybE83aFNMcklvM0JLM1NuM2VCWlho?=
 =?utf-8?B?MDdyZ1dnVGpCbEZKQkZBYWVWMUZtM3lmc1dBcU1rQllyZUJ5WWllZDBGUmJj?=
 =?utf-8?B?UkJWMVZ3Y0JiTWpJdk1ZdGI1Q25ja1FmTVRNdjRFZnJmNXdwd1R3UE04b3Ft?=
 =?utf-8?B?WFoxMzNEcnN2WU1PQWs1a2Z4dDRhKy81NVlrQWpKM2RoSTdPazBqWXhFV2No?=
 =?utf-8?B?UCtJOFRZK1Z6N3FRR0JjN0Y2Ulg5aHJrelNCWHNKMk9OVkRjVVRyQm42LzNK?=
 =?utf-8?B?MnRybHZEY01pcHhleElNbTZ1OXBLaEZxRTN6b2Z0ZWFndXNXMmNTYnFTWG9w?=
 =?utf-8?B?eWdMREVqTUhLWkxuY3BKSTByTE9ka2toM1lmc1A5R0E4OFRiKzBNQ2UrcXpp?=
 =?utf-8?B?UFdhVk16aUNPN3diMEJnS1JzV3NKQmhFZVo4b3dhTGozZm5JZjEweFlBY1Mw?=
 =?utf-8?B?bm5mbG80UGtKWkNRZVhuZFBndk1zME1Tb0ZjRDQ2dWdlRjdqSlF6QlQ4Ti8z?=
 =?utf-8?B?N2dKVWxHMUJKdVM4RnhuR1dhRktWc2ExckdxZXFUaTFGQzlNMGplWUsrRytS?=
 =?utf-8?B?a2lFTWxIM3hEak5SY2xkbVE1NG9GYXBkNEUrWnZwaCtVbm13V0ZpZ21SeDZR?=
 =?utf-8?B?bTFoRzRpRzJtZ0VzbnlIU2hMbU92SDZXSjUycjBqK1NmNUFrTFdBQlVtNU0w?=
 =?utf-8?B?NytzYitLWWRyM3kwTGxMVlgyalN3Vk5nVGpsR3NlRWxsWGJZMnB0OSsrT2Ru?=
 =?utf-8?B?SnQveVhhb2Q1ZEI5NjE0NWk2VS9md2JQVmcrRUdVc1JnYk9BZGZnUkFkZU5z?=
 =?utf-8?B?OGg2blZaWUkxRWVFRjVyOFZZSVpYeUNEQmhWakhWQ0VVZXFkRjM3SmI4K1Y5?=
 =?utf-8?B?ZGJIczdrdEpjd3ptQjgxQjEyRlhQcGs4Q1d2WlJYYTFRRVh3RjZTakFXcm40?=
 =?utf-8?B?K3pNQjJtd1V5WHNEM3JQZjNmY1JYdXlkRGthSVZrblcyOXh3d1ZXUXZZdUZZ?=
 =?utf-8?B?N1ZPbW43eGxGb3FXaENvMXFyczVCR01yb3U1YklURnBJUzNKM2JFQ2tTaHBk?=
 =?utf-8?B?eTF1aUpiUk1obzYwT21veDdvd2UxL0xoc2pHV2VNNnBsd1ZKRmdJMjkvYVJn?=
 =?utf-8?B?UExTYUxPaWpkTkRXYzVnZ0R4MjNsdWFIRC83ZHlOVmpWbXl3RTEwV1UvMGN4?=
 =?utf-8?B?dkJsVFNJa1Juc2RJWmlrZHhYV0xCU2Rtb1RRcW1VYlpyQmtZMnoyQzZ3N2NN?=
 =?utf-8?B?Q0d5ZDhNS1ZpVWZyaUZxNDhzQ243TVIzaVV0cEhxd1NTMTJLczFKRUVSR28x?=
 =?utf-8?B?MFZhUnJYdUpGRVlNblF0Y1gyL3Bud2dLOThKSFNFZUFmdm85Q1RRYWNpcXNE?=
 =?utf-8?B?cTNUcU5xd2hSZnZ5MWNVYW90Q2lUVHBqZjN6akVwUk5CeVZySnl2OG9WYi90?=
 =?utf-8?B?OWplSlNmTlJ2NVJ1dU9kWVlvM1U3endvL0V1am9ZdEtxTzN3bUxna3ZoYnp5?=
 =?utf-8?B?Qzk0eGRqTWdza2lIb1RzR2drRTBZdytPQlJhcXZhYXBqaUY5RDZZcGR0eXpB?=
 =?utf-8?B?T1liMHBHVHE1OE9wcUlxRnBJbmZSc1YwUTdaZjY4Z0ZJTThRRklUUUN2cjBI?=
 =?utf-8?B?VlZjenJsdWZVMDNsZThPTlRDQWJ5dXAyak03UEFBWWFMS0Q2WnhZWDgzN296?=
 =?utf-8?B?azAzVm1sWDlyeXlKaW5GTWJQWHhhVWloZ2ZOMTlLSElhT1o0NzRrOUxRa1h0?=
 =?utf-8?B?MUJ6Ui8rcXlTSHdLMllsMThWK2dwY0ZZWDBHOGMwVjE3eFA2S3Fqc0ZCSHFa?=
 =?utf-8?B?WnZEakF3TDVPemd6cnRNd2s3dU9wSER2KzFTNzZnaEJCcHpnVlVzRlVoRWw0?=
 =?utf-8?B?Ymc5MGgrTDlZTFZGUUdHLzVhWjlVdVFXSU41Vi9PaU5sYW45VlhYaHZoMDRo?=
 =?utf-8?B?d3VJaTV3RmxnZjNJaUFWZmVVZG5SZHpHMmJNdEFwbVl0dnZPTlUrT20ycVB0?=
 =?utf-8?B?NytjaDc5TWliRDBxajlGL2hXNXdxb3U1c3FrSnhLL1dRZlo0dENsZnczK3Q1?=
 =?utf-8?B?SGp5RHBQUXlPUkdJSm95dnYwZkdaSVdZV1JnU2hKdFZlNEtjNE9yOUU5YzBV?=
 =?utf-8?B?bTd2MXFrRktlUlg1eG1yT3VIV3BBUVdlc2RLMU1MWE5oM0p4TzF0UmIvK1ll?=
 =?utf-8?B?SUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b487e630-e51d-428c-9072-08de393232b0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 03:54:49.6036 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CdbR5ig3K6ZZAVesj+x7IUEEQXdhNVuXLmYPAWZP1JyDLfwm2QVVfHKFcsjkfqPyoGHYqcGZTAqFP34hdRcrTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8540
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

On Thu, Dec 11, 2025 at 01:40:42PM +0100, Philipp Stanner wrote:
> On Thu, 2025-12-11 at 12:55 +0100, Christian König wrote:
> > On 12/11/25 12:32, Philipp Stanner wrote:
> > > On Wed, 2025-12-10 at 09:08 -0800, Matthew Brost wrote:
> > > > On Wed, Dec 10, 2025 at 02:06:15PM +0100, Philipp Stanner wrote:
> > > > > On Wed, 2025-12-10 at 13:47 +0100, Christian König wrote:
> > > > > > On 12/10/25 10:58, Philipp Stanner wrote:
> > > > > > > On Tue, 2025-12-09 at 17:58 -0800, Matthew Brost wrote:
> > > > > > > > On Tue, Dec 09, 2025 at 03:19:40PM +0100, Christian König wrote:
> > ...
> > > > > > > 
> > > > > > > I can tell you how I design it in our Rust jobqueue:
> > > > > > > Drivers create jobs, and in submit_job() the pass ownership over the
> > > > > > > job to the jobqueue – IOW after pushing a job, a driver can't access it
> > > > > > > anymore. In the run_job() callback, the jobqueue either passes the job
> > > > > > > back by value (ownership) or borrows the job to the driver so that it
> > > > > > > can be copied (this is done so that the JQ can hypothetically do
> > > > > > > resubmits).
> > > > > > > 
> > > > > > > This way there is no need for refcounting (in Rust / jobqueue).
> > > > > > > 
> > > > 
> > > > See below. If you need to resubmit for any reason, where will the
> > > > information for resubmission be stored? Likewise, if you want to drop
> > > > additional references on fence signaling, how are you going to retrieve
> > > > that?
> > > 
> > > Well yes, as I just stated, it is, unfortunately, always necessary to
> > > have a list of running jobs. The jobs inside of it don't need to be
> > > shared with the driver, though.
> > Actually the initially implementation of the scheduler didn't had a list of running jobs.
> > 
> > The original idea was that you just call run_job() which returns a reference to the HW fence and then the scheduler installs a callback to this HW fence which wakes up the scheduler again to push the next job.
> > 
> > The idea of the scheduler being responsible to track what's in flight on the HW came much later and to be honest is actually not a functionality the scheduler actually needs.
> 
> As far as I understand GPU driver design so far it's unavoidable to
> have at the very least a list of finished fences in the scheduler, so
> you can signal them once the hardware fences signal.
> 
> And at the very least once you have to do resubmissions you need to
> remember which jobs / fences are in flight.

Yes.

> 
> Unless it were possible to use the hardware_fence for everything.
>

Disconnecting the hardware fence from the scheduler fence is actually a
very good idea. If your hardware submission spans multiple resources,
each with its own seqno, the hardware fence becomes a composite fence
(either a chain or an array). You can’t install those in dma-resv or use
chains in syncobjs. In Xe, this use case is called parallel submission
to multiple engines; I believe AMD has something similar called gangs.

If we didn't disconnect the scheduler fence from the hardware fence,
Xe would break—or we’d have to implement a convoluted reinvention of a
chain or array for the hardware fence.

> 
> > 
> > > Jobqueue could do resubmits through help with that list, by running the
> > > desired jobs again. While run_job() executes, jobs are loaned to the
> > > driver, who only needs them temporarily, not permanently.
> > > 
> > > One could have that loaning in C, too, but would not be able to enforce
> > > it.
> > > 
> > > > 
> > > > > > > Maybe the core of the problem is not so much the lack of refcounting,
> > > > > > > but the lack of ownership rules. Why even would the driver need the job
> > > > > > > still after it got pushed? It should be fire-and-forget.
> > > > > > 
> > > > > > Yeah, that sounds sane to me as well and is exactly how it was initially designed in the drm_scheduler as well.
> > > > > > 
> > > > > > The job is basically just the information the driver needs for the submission which it gives to the scheduler on push, and the scheduler gives back to the driver on pop.
> > > > > > 
> > > > > > The full execution time is represented by the scheduler fence and not the job. And the scheduler fence is reference counted exactly because of the reasons Mathew brought up here.
> > > > > 
> > > > > Would be interesting to hear where Xe would still need the job. If only
> > > > > the backend_ops give a driver access to a job again after it got
> > > > > pushed, then it should be safe.
> > > > > 
> > > > 
> > > > Xe needs a subset of the job after submission to handle tasks like
> > > > resubmission after a device reset.
> > > > 
> > > 
> > > the job or the jobS?
> > > 
> > > Because you get the job that caused the timeout by the scheduler,
> > > through timedout_job().
> > > 
> > > And the rest you need will soonish be obtainable through the new
> > > iterator. So what else do you need?
> > > 
> > > 
> > > >  It’s questionable whether we need
> > > > this, as it shouldn’t happen in practice—only individual queues should
> > > > fail with a working KMD and hardware. It likely doesn’t work anyway if
> > > > queues have interdependencies. This is really an opportunistic approach.
> > > > 
> > > > However, we absolutely need this for VF migration resubmission. Again,
> > > > this requires only a very small subset of driver job information. I
> > > > believe it’s just the starting point in the ring, batch address(es), and
> > > > a pointer to the driver-side queue object.
> > > 
> > > In Rust, I borrow the job to the driver. So if it really needs
> > > something about it permanently, it can copy it into some object with a
> > > decoupled life-time.
> > > Or maybe have the job-struct's generic data-field contain something
> > > refcounted, IDK.
> > > 
> > > 
> > > 
> > > > 
> > > > We also build a reference-counting model around jobs, where the final
> > > > put releases other objects and runtime power management references. This
> > > > assumes that the job’s final put means the scheduler fence is signaled.
> > > > Again, this is really just a small subset of information we need here.
> > > > 
> > > > So if we add hooks to store the subset of information Xe needs for
> > > > everything above in the scheduler fence and a non-IRQ, pausable callback
> > > > (i.e., won’t execute when the scheduler is stopped, like free_job), this
> > > > could be made to work. We really don’t need about 90% of the information
> > > > in the job and certainly nothing in the base object.
> > > > 
> > > > This would be major surgery, though. I suspect most drivers have a
> > > > subset of information in the job that needs to stick around until it
> > > > signals, so this means surgery across 11 drivers.
> > > 
> > > Not sure if that's worth it. My hope would more be that interested
> > > users with firmware scheduling can switch to jobqueue and start over
> > > with a fresh, clean design with proper memory life times.
> > 
> > That sounds reasonable to me. I was more than once at the point of wanting to nuke the scheduler and starting from scratch again.
> > 

I think we can unwind drm sched.

> 
> Actually, since the 1950s, you don't want to rewrite software at all
> anymore. Yet we again and again end up at that point.
> 
> Only works if you *really* get it right. Even with jobqueue that's
> already becoming more complicated, because we might have to support
> resubmits, which I hoped we could 100% avoid.
> 

You probably need resubmission for VF migration cases. For resets, we
could likely avoid resubmission support, assuming all devices provide
proper process isolation.

> drm_sched's primary design mistake is having two job lists with
> different life times AND on top of that resubmits.
> 
> > > > > > I'm absolutely not against reference counting, what I'm pushing back is abusing the job object as something it was never designed for while we already have an object which implements exactly the needed functionality.
> > > > 
> > > > Well, oops. Having free_job called after the fence is signaled is how I
> > > > arrived at the implementation in Xe. I agree that if we can move driver
> > > > info into the scheduler fence, this could work for likely everyone.
> > 
> > Ok in that case I'm going to give that a try.
> > 
> > > > > > > > > > And my uneducated guess is that it's happening in amdgpu. It seems a
> > > > > > > > > > sched_job lives inside an amdgpu_job. Can the latter be freed at other
> > > > > > > > > > places than free_job()?
> > > > > > > > > 
> > > > > > > > > > > 
> > > > > > > 
> > > > > > > […]
> > > > > > > 
> > > > > > > > > > > It basically says to the driver that the job lifetime problems created by the scheduler is the driver problem and need to be worked around there.
> > > > > > > > > > > 
> > > > > > > > > > 
> > > > > > > > > > My POV still mostly is that (with the current design) the driver must
> > > > > > > > > > not use jobs after free_job() was invoked. And when that happens is
> > > > > > > > > > unpredictable.
> > > > > > > > > > 
> > > > > > > > 
> > > > > > > > This is somewhat of an absurd statement from my point of view. I have a
> > > > > > > > valid job pointer, then I call another function (see above for an
> > > > > > > > example of how drm_sched_start/stop is unsafe) and it disappears behind
> > > > > > > > my back.
> > > > > > > > 
> > > > > > > 
> > > > > > > The statement is absurd because reality (the code) is absurd. We all
> > > > > > > are basically Alice in Wonderland, running as fast as we can just to
> > > > > > > remain on the same spot ^_^
> > > > > > > 
> > > > > > > What I am stating is not that this is *good*, but this is what it
> > > > > > > currently is like. Whether we like it or not.
> > > > > > > 
> > > > > > > The misunderstanding you and I might have is that for me jobs having to
> > > > > > > be refcounted is not a reality until it's reflected in code,
> > > > > > > documentation and, ideally, drivers.
> > > > > > > 
> > > > 
> > > > I agree this part is badly misdesigned. In the timedout job callback,
> > > > you’re handed a job, and if you perform certain actions, it can just
> > > > disappear— even all the way back to the caller of timedout_job. That’s
> > > > not great. Then we have this free_guilty mechanism to avoid it
> > > > disappearing, but sometimes it still does, which is horrible.
> > > 
> > > Who makes it disappear, the driver callback? Because that free_guilty
> > > mechanism is what frees jobs in the first place.
> > 
> > I think so yes.
> 
> The driver must not free the job in timedout_job. That's completely
> against the design, be it bad or good. free_job() is the point where
> you can free. That's why it's called that.
> 

drm_sched_start/stop, which is called during AMD’s (and possibly
others’) TDR, can also free jobs. Having a single point—the work item
that calls free_job—makes everything much safer. So just signal the
fences in the TDR after kicking the job off the hardware and let the
known work item handle cleanup. Not to harp on this, but this is what Xe
does.

> > 
> > > The more you think about it, the more astonished you become how this
> > > could ever have been designed and merged that way. There was no clean
> > > design anywhere, neither with APIs, nor life times, nor locking.
> > 
> > Yeah, which is exactly the reason why I said I'm not going to maintain that stuff.
> > 
> > I mean I still feel guilty that it came this far, but yeah.
>

I played a part too, but let me give you a different perspective. When I
worked on submission in i915, getting anything functional in the
existing code was nearly impossible. For about a year, all I did was
fight bugs after implementing the GuC backend—and I’m fairly certain it
still doesn’t work in all cases. In Xe, my initial implementation on top
of drm_sched has more or less just worked. Yes, I’m using a subset of
drm_sched, but the concepts—avoiding submission in IRQ contexts, using
work queues for ordering, disconnecting the scheduler fence from the
hardware fence, and being able to stop/start—are all very good ideas. We
need some cleanups, but all is not lost.

> You've said so frequently, don't worry too much. I just bring it up out
> of surprise because, you know, some design mistakes are unavoidable.
> It's just very difficult, GPU resubmits, hangs and all that. But other
> things and certain hacks (drm_sched_fini()) are so *obviously* broken
> that you wonder..

Yes, see above. A subset works quite well, but there are a lot of scary
things in drm_sched.

> 
> 
> P.
> 
> > 
> > > > > > > >  The safe way to handle this is to take a local reference before
> > > > > > > > doing anything that could make it disappear. That is much more
> > > > > > > > reasonable than saying, “we have five things you can do in the
> > > > > > > > scheduler, and if you do any of them it isn’t safe to touch the job
> > > > > > > > afterward.”
> > > > > > > 
> > > > > > > Yeah, but that's drm_sched being drm_scheddy. Before I documented it
> > > > > > > there were also these implicit refcounting rules in run_job(), where
> > > > > > > the driver needs to take the reference for the scheduler for it to be
> > > > > > > non-racy.
> > > > > > > 
> > > > 
> > > > Yes, agreed. This is my fault for not being more responsible in fixing
> > > > issues rather than just backing away from these really scary parts of
> > > > the code (e.g., drm_sched_stop, drm_sched_start,
> > > > drm_sched_resubmit_jobs, etc.) and doing something sane in Xe by using
> > > > only a subset of the scheduler.
> > > 
> > > It's a bit like writing C++: no one can ever agree which feature subset
> > > is safe to use.
> > > 
> > > That's why we want to do a fresh restart for firmware-schedulers, since
> > > they allow us to drastically simplify things. Timeout? Close the ring.
> > > Job-pushing is fire and forget. Resets? Rings aren't shared.
> > 
> > +1
> > 
> > > > > > > It also wasn't documented for a long time that drm_sched (through
> > > > > > > spsc_queue) will explode if you don't use entities with a single
> > > > > > > producer thread.
> > > > > > 
> > > > > > That is actually documented, but not on the scheduler but rather the dma_fence.
> > > > > > 
> > > > 
> > > > spsc - "Single producer, Single consumer". So it is in the name.
> > > 
> > > Ah, NTOTM.
> > > 
> > > What's obvious for one party is a mystery to someone with a different
> > > mind. I recognized the meaning after months, after work one day.
> > > 
> > > But don't get me started on that queue……
> > > 
> > > > 
> > > > > > And that you can only have a single producer is a requirement inherited from the dma_fence and not scheduler specific at all.
> > > > > 
> > > > > What does dma_fence have to do with it? It's about the spsc_queue being
> > > > > racy like mad. You can access and modify dma_fence's in parallel
> > > > > however you want – they are refcounted and locked.
> > > > > 
> > > > > 
> > > > > P.
> > > > > 
> > > > > > 
> > > > > > > drm_sched got here because of gross design mistakes, lots of hacks for
> > > > > > > few drivers, and, particularly, a strange aversion¹ against writing
> > > > > > > documentation. If Xe came, back in the day, to the conclusion that job
> > > > > > > lifetimes are fundamentally broken and that the objectively correct way
> > > > > > > to solve this is refcounting, then why wasn't that pushed into
> > > > > > > drm_sched back then?
> > > > > > > 
> > > > > > > > 
> > > > > > > > > > To be unfair, we already have strange refcount expectations already.
> > > > > > > > > > But I sort of agree that there is no objectively good solution in
> > > > > > > > > > sight.
> > > > > > > > > > 
> > > > > > > > > > > > 
> > > > > > > > > > > > Let me respin to my documentation series and upstream that soonish,
> > > > > > > > > > > > than we can build on top of that.
> > > > > > > > > > 
> > > > > > > > > > > > 
> > > > > > > > > > > > 
> > > > > > > > > > > > P.
> > > > > > > > > > > > 
> > > > > > > > > > > > > 
> > > > > > > > > > > > > 2. Move reference counting to the base DRM scheduler job object, provide a
> > > > > > > > > > > > >    vfunc for the final job put, and document usage. Medium invasive.
> > > > > > > > > > > 
> > > > > > > > > > > I strongly think that reference counting the job object just because the scheduler needs it is a bad idea.
> > > > > > > > > > > 
> > > > > > > > > > > With that we are just moving the hot potato from one side of our mouth to the other without really solving the issue.
> > > > > > > > > > > 
> > > > > > > > 
> > > > > > > > See above—I can’t say I agree with this assessment. I think the lack of
> > > > > > > > reference counting is exactly the problem. I don’t really understand the
> > > > > > > > pushback on a very well-understood concept (reference counting) in
> > > > > > > > Linux. I would sign up to fix the entire subsystem if we go this route.
> > > > > > > > 
> > > > > > > > > > > If a driver like XE needs that for some reason than that is perfectly fine.
> > > > > > > > > > 
> > > > > > > > > > Nouveau doesn't need it either.
> > > > > > > > > > 
> > > > > > > > > > > 
> > > > > > > > > > > > > 3. Move job (driver) side tracking to the scheduler fence and let it
> > > > > > > > > > > > >    control the lifetime. Very invasive.
> > > > > > > > > > > 
> > > > > > > > > > > Thinking about it more that is actually not so much of a problem.
> > > > > > > > > > > 
> > > > > > > > > > > Let me try to code something together by the end of next week or so.
> > > > > > > > > > 
> > > > > > > > > > The hero Gotham needs :)
> > > > > > > > > > 
> > > > > > > > 
> > > > > > > > Are you sure about this one? I think unless the problems around
> > > > > > > > drm_sched_start/stop and free_guilty are fixed, my feeling is this
> > > > > > > > entire thing is still badly broken for anyone who wants to use those.
> > > > > > > > 
> > > > > > > > To sum up this whole email: I strongly disagree with option #3, but if
> > > > > > > > that is the consensus, I will, of course, support the effort.
> > > > > > > 
> > > > > > > 
> > > > > > > I would like to discuss those topics with Danilo, too, who returns from
> > > > > > > LPC soonish. Also to get some more insights into Nouveau and our use-
> > > > > > > cases.
> > > > > > > 
> > > > > > > My suggestion is that we pick the conversation up again soonish.
> > > > > > > Christmas is around the corner, and I suppose we can't fix this all up
> > > > > > > in 2025 anyways, so we might want to give it a fresh re-spin in '26.
> > > > > > 
> > > > > > Since we finally found the root cause I'm all in postponing that till next year.
> > > > > > 
> > > > 
> > > > Ok, glad we found the root cause. I’m not as opposed to option #3 as
> > > > stated—this was a bit of angry typing—but if we go in that direction, we
> > > > really need clear rules, for example:
> > > > 
> > > > - A job cannot be referenced driver-side after the initial
> > > >   drm_sched_entity_push_job call, aside from a single run_job callback.
> > > 
> > > That's what the current code and documentation demand, yes.
> > > 
> > > >   Maybe run_job is actually replaced by a scheduler fence input?
> > > 
> > > fence input?
> > 
> > ops->schedule(job) ?

ops->schedule(fence) ?

> > 
> > > > - Drivers can attach information to the scheduler fence and control its
> > > >   lifetime.
> > > > - Drivers can iterate over pending scheduler fences when the scheduler
> > > >   is stopped.
> > > 
> > > That sounds as if we're about to make a mistake with the job-iterator.

No. See resubmission. Something this is required.

> > > 
> > > > - Drivers receive a pausable callback in a non-IRQ context when the
> > > >   scheduler fence signals.
> > > > 
> > > > etc...
> > > > 
> > > > Again, this is a pretty major change. I personally wouldn’t feel
> > > > comfortable hacking 11 drivers—10 of which aren’t mine—to do something
> > > > like this. Refcounting the job would be less invasive and would make the
> > > > existing hairball of code safe.
> > > 
> > > See my firmware-scheduler comment above. The issue is that getting
> > > systems with lax rules back under control in hindsight is 10x as
> > > expensive as carefully designing strict rules from the get-go.

Getting things wrong and learning from it is, unfortunately, part of the
process.

> > > 
> > > My experience so far is that a maintainer's primary job is actually
> > > keeping APIs consistent and forcing people to document everything
> > > properly.
> > 
> > I would rather say that a maintainers job is to reject bad ideas and push for good ones.
> > 

+1

Matt

> > Christian.
> > 
> > > 
> > > 
> > > P.
> 
