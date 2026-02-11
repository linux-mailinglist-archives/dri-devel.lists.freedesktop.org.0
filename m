Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oPUTLj4PjWmiyQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 00:22:38 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 169FB128497
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 00:22:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 905DE10E18F;
	Wed, 11 Feb 2026 23:22:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GNAlxADe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0806010E18F;
 Wed, 11 Feb 2026 23:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770852152; x=1802388152;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=+zllo6eZsbwwXjxfRSPUR6nIB0jP4z7wJis3mNtLNp4=;
 b=GNAlxADeVt8lS+urLIl94sw05DoeaXari/upMF0XZAFYx65gLyLW5ZyG
 3r4FITtmwm9Ob5iUEGA3bGZnp+j9NZLQ0vrBTZ8Z/F4QZ+rCxrOIYrmhs
 vH0wv5bUfTAu8QOB4tGzkfIAZ3XgudB3qLhd3cUDjldVky2qxwN/CGrUC
 0opv+C6TBr2LWwq1RbXkiPtIerZUGGbtiU59NiQKQauDtSAbPmCSG9Xii
 BqFLdqnzGUo76Wx03h0VpCa6c49aq0NcOfIsigMlHaVgadkOD8dfIkyjH
 DgA35deg94H9KF6pcdmuFYOWmRki2Q3y4WDa9NxpGMXlnZjkgruzxoMwV g==;
X-CSE-ConnectionGUID: 4HDbSP5jQO+DzVskExSF3Q==
X-CSE-MsgGUID: zQL44TCTTDmAeHlOu3Anfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="74613509"
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; d="scan'208";a="74613509"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 15:22:31 -0800
X-CSE-ConnectionGUID: TKPXUsUyT/qkIqyYMIfkpQ==
X-CSE-MsgGUID: nLGoBIYVR/O8wYsSXYHfMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; d="scan'208";a="211279747"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 15:22:31 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 11 Feb 2026 15:22:30 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 11 Feb 2026 15:22:30 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.5) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 11 Feb 2026 15:22:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eo5DOZdhDL87YLM9/YQP5vc5ERsXR0ki5rO6DS1a17jxX9gbXMx3EF9hDEFrIajBbduZQ18yeE5lckep9WJN3bwULgXHrVR1U4LVJBo6B6Nx51go1NW7iZkPm3EDoAmM2oftiqqbZNKErBz3xlJtjQnRqYSU+AjxP0taKPQ1k+xktoeT/C1K8Nrl2PBxd/94eAtTwXlPTsVSFFlOBs0nsFnZjeNg96dv8VGOnoBiEep6PACRMuN3KHcfpR2o68cqCEsnpNXcpcju/PmKd4fE7qjs7/8Dd/KpXdJ5cEKZdyIB4yr4HCdg6EYtfYFFO5OeXHPLf6SI5TNowjKg7pXskA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x2ZBqF8HFXzK6gRbo3LAZ/6KmMWTZvu7Op5RQpGRQKc=;
 b=sQ06/Q45TFSbt/HHzCbn21wqB1JNuDb4W+elXjqzcjZj38u+sevAPgvXZUp5j+RBAxw2zbecSgY6Md58yXmHZSl2aBETpfz70rCD2AGJXD/reGrG7Wsgz7DPcO3xrcmVMLWDonB8KUVqHRh/OL24s870zcvZm99Sk92/gtnJ8UiIhZpx0w+t9Bfdl9Iuf6KuI8mmmTd4baw+W1m/s6YiLczdJm1dhAzBExSxJcvuidcbRNR3e+RbpDcuK13Nz65zpdyMe4Q1mmzq+CWh72kUX8iYuYOiq1m1v4VBXmIq+qeaBA8dmTcGXDlnM6e5b/dOYnLU82vz8dH9t2Jbvz3hTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by LV2PR11MB5999.namprd11.prod.outlook.com (2603:10b6:408:17d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Wed, 11 Feb
 2026 23:22:23 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9587.017; Wed, 11 Feb 2026
 23:22:23 +0000
Date: Wed, 11 Feb 2026 15:22:21 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Alistair Popple <apopple@nvidia.com>
CC: Thomas =?iso-8859-1?B?SGVsbHN0cu+/vW0=?=
 <thomas.hellstrom@linux.intel.com>, <intel-xe@lists.freedesktop.org>, "Ralph
 Campbell" <rcampbell@nvidia.com>, Christoph Hellwig <hch@lst.de>, "Jason
 Gunthorpe" <jgg@mellanox.com>, Jason Gunthorpe <jgg@ziepe.ca>, Leon
 Romanovsky <leon@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, John
 Hubbard <jhubbard@nvidia.com>, <linux-mm@kvack.org>,
 <dri-devel@lists.freedesktop.org>, <stable@vger.kernel.org>
Subject: Re: [PATCH v5] mm: Fix a hmm_range_fault() livelock / starvation
 problem
Message-ID: <aY0PLeNTYXOOoV0R@lstrano-desk.jf.intel.com>
References: <20260210115653.92413-1-thomas.hellstrom@linux.intel.com>
 <20260211222303.42qfp6rqxxnpfkr4@offworld>
 <vfviexoy6uj6cifcbyezshgssomgu2f3jxpckjnapx5fzqb2bd@dpcaefu5m6du>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <vfviexoy6uj6cifcbyezshgssomgu2f3jxpckjnapx5fzqb2bd@dpcaefu5m6du>
X-ClientProxiedBy: BYAPR11CA0106.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::47) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|LV2PR11MB5999:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e8452f4-c7b2-441a-bca4-08de69c4692d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZGJaWUpTSzk3eFJwOTVYUG5TT0RIWmNMT2kxUzNwY1NRcEw4ODkvM0JhZXcw?=
 =?utf-8?B?RzBqdlJxc3dxRThhdVVHRnBpY0pQa1ErS0RUNytPbFYxQnlUU092R1ZmSVl0?=
 =?utf-8?B?RFE1b1c0MklUWXJJNDYxQzVWcXJtMlBLTU1vVUhsU1oyblBRZ09IdkJkSGNC?=
 =?utf-8?B?MVFuV0w5N2l0YXZ0RFZrRXVUWEdmTWJ2Nks3MGlUcHk2R3VFU0ZGY3RMM2tu?=
 =?utf-8?B?SXJKT0o3SHBBNlNvVDRPdERFeDlvczkyc3JyUGdYbndPSjJYTjhYYmZBc3NR?=
 =?utf-8?B?b1g3YU5XWjFSNG9aN0tHL2tJcjBWNTVpai9KYU85aC8xaUZBYU9RdXM1RlFn?=
 =?utf-8?B?QTk0NjJsNUJsTm1OSWRaK0o2dk1lb0FReGo4SEgxYzlRTWFzL2RuNzVjZ3VT?=
 =?utf-8?B?dDV6TlJCOWgyd214R2dtQ0cvelNrMllzUStrTHFhZm05OXdUdDBvWkNUYWJ3?=
 =?utf-8?B?UTlCOFM3bzljM0ljR3hqQW1aQTY0bjFZNWo3OXdVUzJFRVUyaWJvSjRNQmNB?=
 =?utf-8?B?M3N1R2NOaE5nMUx5S01SS0ZKV1BXbWswQmVCaVhaZERUd1Q1SElhM2lES2h4?=
 =?utf-8?B?OXMybCsyT2pMK1JlSlRQREVYTENtU1lDellqVHJNMm5HVDM2K0dSeVluRFFM?=
 =?utf-8?B?SXhLdk54dk5GUGpJMHQ1VlZxWnBCSGZxYWUyUkU3bEZPUTBMb3IrT1R0bW0z?=
 =?utf-8?B?a0hSYWlKZkY1aVNTaE9IdkQzSFJrZGREdjQ0Vno1d3dSYis1ajJ2alZVODlF?=
 =?utf-8?B?SkZKMXpxNlYxeXJCRXJkNll6ZmZiZXUzdGhoZGxsSUVjRnJWNmJmcVhvWHMx?=
 =?utf-8?B?dGVJWHhIbEUza1R6K3dJN3FEUHlsaXY5Q3llLzQ4aURLZFBMZ0hvVXplTHlB?=
 =?utf-8?B?elR4K3NBdEozVHEwWnFJWjZ1b1JOeU0vQ21FdnFsYWFkTm5lTGI3Vk1odUU0?=
 =?utf-8?B?NlBYSEMySytrc28wK3Vtc1oxOUdjdmpzMFB0K1BVSDA1Y3BsMWNSZnNzL1hy?=
 =?utf-8?B?ZjBCTk1vbDdZRVQ4ZzlmSEg3TFZhWE81K2s3VTViSjlPb0JJNEV3QzU3NFRW?=
 =?utf-8?B?NTExUTZwNlRMQzhlMmlvVm9QS3hLSWtNbEVuNUQ3cTcwSjlHUUdCQUM0aVd1?=
 =?utf-8?B?NTF5TjlJdVA0SEtGbk0zQUlXRm1pUDlpVTR5ZUZRQmFWN3dGaVE1dEVZdHZr?=
 =?utf-8?B?dU1UZmdHeXMwWFhkWXRMQ1RvRENGUkxpcXViRGpTK3VwN2haTFBoKytqSzZu?=
 =?utf-8?B?ODZhUlZ6bHQ3OTJaUzlBL3ZuQnVkRjdMcjFGTm00U3Y2aTlCUnVJekM5TFlq?=
 =?utf-8?B?Mmtsdkt4ZUs3NnJIN1JlbGloMkFzTldLYmVvR3Rqd3ZqZXJJaFlweDdYTG93?=
 =?utf-8?B?SnVJS2N4eWZET2t3aFpmeHhYdTk5UFhlbkFzUFhNL3Rvc3dlM3VTbklEaUZD?=
 =?utf-8?B?UWkwQ1VpaDJwQUE1bzRPZ3RUeExXdDZVdXNWYlVJWi9IRzFmWUtCOFE4cGw0?=
 =?utf-8?B?NVM1Z3lHUWFOVUtLRXgvcm9odE9SR0d1MzBqN281TkhnOHR5ekkzWTB0QW1Q?=
 =?utf-8?B?QmRXVW9ZWG55cmpBMC96N3BOLzNIR3FuKzZxaWREbGpMSEpCa2VZMzBHQnly?=
 =?utf-8?B?T2k5WCtFQ2tuMThyVTZ6czE3MXZ4RG9jaGwwaUZaZVpRYktEVzQwM0lNWXhO?=
 =?utf-8?B?LytFVi9jRGFjWmF6djZwdVlXZGJiZ3pMYlI4eW9ubERNV0liZGdxYnl5QllM?=
 =?utf-8?B?UUk2a0VsalU2Rm0rVGlvb1BERWs4RFNaSzVvODlhWG1QMFUvNEhsUVh5RWNE?=
 =?utf-8?B?NG0vK2tUNm56dDNPOTFaazN4U2dXeHR1Q1Nmai9aellNcDl3NUZJekhrU1Fn?=
 =?utf-8?B?WFZ3bWlVbDZBUkhYVEFUc0JYbE05SXF1ZHl6Y3pMTXhkQjVsTDI5SjVxN0Rw?=
 =?utf-8?B?QnJqcVhYMThlL0FmaXU0OWViWWFGOW1tVTdRRG5GQ3gzR0ZjMHQzWjdKYlFE?=
 =?utf-8?B?SmZxQkFKdkF4bEovSmsyVXZnS3pSQTNVZVFZWnNUcHluazRnM2tFdUw5cWYx?=
 =?utf-8?B?RElDdXFraVM0N21IL0xkWW5JNXVNUFZBOGVKNklCOUZNREhEdm1OaThlem1N?=
 =?utf-8?Q?GU8A=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VHF5ZGlWUDVhOHJudCt6bmYrVk1aeXVIWkRMREZLWndqcVBhaHUyUk5CUWRu?=
 =?utf-8?B?bGxyejMrWTUrYisrVXZvZ0pHaGo5R3hHQXMweXhVU1ZWSEs3ZGlTeEdPVno0?=
 =?utf-8?B?NnN4MkIwclBxVGpqS0YyWjFGMGkza1g5dkx6UjhsZnpiZzc0NURvWFBvazQ0?=
 =?utf-8?B?Q2VjN3NIR3VVdWZPcWZ2U2tJWVVuc0RhbjVIc3BrSEZveCs1WEJlSjk1TlFS?=
 =?utf-8?B?bzM4UW1laEh1TDBUNm5PMmN4dE5iZDBEempIbzJoYjFFTldxU0lVTjBlOGJY?=
 =?utf-8?B?a0xqOGhLaWZ4MEJETUh1OVVlK282WU91V2E5WlJIOWFFVVkvZDY1SjBQYkdH?=
 =?utf-8?B?SkRiajJadzNwYmdMWEZKcFJrcEhUcTV0WHFSd1BXaExDSFVrVzBsT016UzZs?=
 =?utf-8?B?ME9yNlRRc1Y5YUl2dXFKamVtTVZTZS9JN0NDdGNXQTBDRnV3TDNKdVUrbFpl?=
 =?utf-8?B?RElNSGRNMXRKeDc5eVJCUDJaMGl4YzN3bDlrM205ekN6Z3MwMkovSjU3cUEz?=
 =?utf-8?B?NDYrUjUrT240NFZLbmNtUzNwRFpEbEp4Q0VzV00ySy84MysyQm8vclJaVDRC?=
 =?utf-8?B?TmlaM1pBZTNLKzVqY050ekFOSUZEUjcydHFkR0NnVGpzVjBwNDJubmJ6c1Yy?=
 =?utf-8?B?bEdMU09sa28vOURlUEZuOE9rY0NLUVpiUTNzMTBsUk5SSEJpd3hhaWN4TG9l?=
 =?utf-8?B?VkltLzdUaGZXbVVEUHpKWXgwTkQ1Tlk2cDdqVUYvR0tZNm1TWVZKMGxEL2Vu?=
 =?utf-8?B?ajJBZVNiMG9kZlZpRUVkTzUzUzdiY3Z6Rk4vQ1k2bnljMGRVeEhOSFNmalV5?=
 =?utf-8?B?MjNGYTRMc29HY0FYeS9kRlBsMnk4Qk9SbURYVkVrSUs2dlY5WThTVlF3WWx0?=
 =?utf-8?B?eU9DNURrUzJ2dHZvNHQxUG51L3EzWGJqQkVIYWYrTCsyWFBMWGRCYzhLNG9z?=
 =?utf-8?B?TW9GOWxVQmE3YzdkUmh1VlU0YkxHeFhyWGZqSXZrcm1hV05rRS9KUFcrYUYr?=
 =?utf-8?B?THR4aDVIaGIzYTZudmdHVy80UStWTGVsdGE0ZXA2c1UrNFV1ZnFTaDAyS09h?=
 =?utf-8?B?eGpTWjhaRXpoOXExL2JWVzUxYmRUV1Azd0xkdHJwMGtsdWJVbWNFYjA2OFNS?=
 =?utf-8?B?akZMVUlUVGRjQlppZkJ0MHpQcFhqcGhWQ0JzK1pVc3Z1bnJLbUREM1kyRzJN?=
 =?utf-8?B?WE1ISUdBa0NxYkdvYjJRYUlROHRvS3kvZjFsbi9WS05nMW1lZVNOQWVPbWhR?=
 =?utf-8?B?QnhOMDh5TEU5YjFzSTN6UmRMSVlGTDg1bDduMVR3TVpkZ2RaRHh6QVJGbFV4?=
 =?utf-8?B?U2pHYllVeGJDM2pveHFGOFVnUWJPSVg2ZXBiK3dKQW1xNGRUNEUrYjBnT0FO?=
 =?utf-8?B?MDZ4akh0ZFlyRy9PeTY4K2tzdVl3d21LbzdhM21wZC9zMEp3UVRvRTRRYThS?=
 =?utf-8?B?Q0lOYkN1MWxFRTBET0tKNGRWRVIvMDdLMDhGUmVGaFlQSStFR0hhQWxjNXlI?=
 =?utf-8?B?VjFpWkNNSjVzQm1yMTFsdkkvUEJnTzBTSmJUYVlPdlNDcUJyL2tZS3RrNjcv?=
 =?utf-8?B?d1BMYU9na0hRdEpwcHVxeU9YeGR1WFNCUVdIeUVtaHRjZS8wYlk3d0x4WEtO?=
 =?utf-8?B?Mld1cStsVEtxeENDRmxiZmN3Nm54SExZM1hpa3R2eVhRUEU2bFBpWWd3aVZz?=
 =?utf-8?B?VzI1VjJRQTJVQmQwMEcxbjVoS3BiSHBqMFBMR2pYVk9jdk5Za1M2SnJWZjFS?=
 =?utf-8?B?NGlaWUdwWVRNOEdwMEJNeWtmeXhvK3J0THpMWU1kRFhwZ2VOS2VnTzFOTExU?=
 =?utf-8?B?RUJMaHdTbjRDREh0OTFBajVDM3h4U05GTXloMHZvWER1MTBOeGJxK3lPL21B?=
 =?utf-8?B?MkQwUHpOREpyVThyNHNhT3ZlZW1aUU1VWUFaQjU0R1QzZVVSUGFlZHM3MHlp?=
 =?utf-8?B?SFQ4NmUxY1MxdGg0di9Yd09aSmpIbzd3NmNJRFNpSXVKN1l2aWlYZzE5L0U4?=
 =?utf-8?B?eng0NlprQm9iL2xSZnVQRFlEdVZNUlJKdGdaT0J2eWg3cWxqbkZIck1vVHVw?=
 =?utf-8?B?MDRMczlGR01nL0twOFgwWDd0bzczcU0raGhZdWk2R2RReGhXSEU5aERnUXZZ?=
 =?utf-8?B?M0Y2R2MxRUc2ODlDZ053MVJaWWZZeDRONHBuWUZNdHJ2TTlzUkJYdmYyak5n?=
 =?utf-8?B?amVSK2Q0QjEwVElVWXBhU3B4OXVmNU9QVGl0eExBYVhrRFhYcEtoVkYybHdQ?=
 =?utf-8?B?cFgyeE5jRDlCZDhZWGdxT1lPME42REt6ZzdZMllpeEYyb0ZpbkZIYk90STRZ?=
 =?utf-8?B?UTlxR1pXMC80L2l6YVBZN1paMFkvSDJDNUR0QWY3SmVJYWlBVGtzZ3k1Umgv?=
 =?utf-8?Q?oe0HvddTMXmprUC0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e8452f4-c7b2-441a-bca4-08de69c4692d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 23:22:23.3825 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5/PlJfxqGbJ5iibnMAANi+ux29CcLWorVL9aW7RLglPLPWJyalM/96vznl5om6gCclVA7yHG6FFeOkN2Le7QCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB5999
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stgolabs.net:email,intel.com:dkim];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[dri-devel];
	FROM_NEQ_ENVFROM(0.00)[matthew.brost@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Queue-Id: 169FB128497
X-Rspamd-Action: no action

On Thu, Feb 12, 2026 at 09:54:50AM +1100, Alistair Popple wrote:
> On 2026-02-12 at 09:23 +1100, Davidlohr Bueso <dave@stgolabs.net> wrote...
> > On Tue, 10 Feb 2026, Thomas Hellstrï¿½m wrote:
> > 
> > > @@ -176,7 +176,7 @@ static int migrate_vma_collect_huge_pmd(pmd_t *pmdp, unsigned long start,
> > > 		}
> > > 
> > > 		if (softleaf_is_migration(entry)) {
> > > -			migration_entry_wait_on_locked(entry, ptl);
> > > +			softleaf_entry_wait_on_locked(entry, ptl);
> > > 			spin_unlock(ptl);
> > 
> > softleaf_entry_wait_on_locked() unconditionally drops the ptl.
> 
> As does migration_entry_wait_on_locked() so obviously a pre-existing issue.
> I'm not sure why we would wait on a migration entry here though, maybe Balbir
> can help?

I noticed this recently as being odd, given that we don’t wait on PTE
migration entries.

Looking again, this is unreachable code, since we bail out just above
this if statement on !softleaf_is_device_private(entry). So we should
just delete this entire if statement.

Matt

> 
> > > 			return -EAGAIN;
> > > 		}
