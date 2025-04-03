Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F497A7B171
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 23:39:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7919210EB82;
	Thu,  3 Apr 2025 21:39:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bsapnwqw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A18C910EB81;
 Thu,  3 Apr 2025 21:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743716364; x=1775252364;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9YVzeBKQV9EUTm37eRKnlGW8F/nRByunHTKI/U26roI=;
 b=bsapnwqwIkFCJh8FzL1KEHmqd7tjmkk3S7yM+WtzCP8i1cDA6r8fNq8U
 KB+K8PRZWCCH4bjbWO6NVUb3v6QlZ321i0GWrrkTPPaXvHuiQ6NayW6lA
 80FL7CIxKUn+YF0MMc/z+bCtFjCZOkXQK+dBDnMa3hCQKhY75q1ZhS1fz
 z2LCJoOexsnzNfpJhQPHkVman1t0AYxvVxIT3nqDXsLqJ9uewkJJ7S5ry
 13kuu/TLFLOWoEfvE+KTnSJ54r3LX5lGSzq2Zg3xyf9DvJGVWMQsSepjv
 9FLB4pEtYVh9TKAZPJo+OnCmps80ErzGFqCXggBpP29Z0OyPwEcYGlzT3 A==;
X-CSE-ConnectionGUID: 2Kaz0N/+RemGEFfkJP7IXA==
X-CSE-MsgGUID: OUNKNMwFQCC9sbVaRfuLuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="45292000"
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; d="scan'208";a="45292000"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 14:39:22 -0700
X-CSE-ConnectionGUID: 4qDc5z57RzKoVKqDqLVxYQ==
X-CSE-MsgGUID: nMrqfLO1QUOzjhNKcrL2/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; d="scan'208";a="158122270"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 14:39:21 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 3 Apr 2025 14:39:20 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 3 Apr 2025 14:39:20 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 3 Apr 2025 14:39:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BYAfIfUtw1GXEfxKDiSszuvowxJZNhJ4bUYldR77KCj/a4LWtuBhOBP8wDk2Qqx/sO+Cb6GFa57EaJot5jX8XBsVTjai+h2gLieOMdapknMO5iB67rmKBPkH1gb1cQLVcpgi3/Fz6tXQT5tZFgOHgBbCZsG8KvSEzYy6qewtEdoYqvsfn0KMSEfY/R4hGd28hn7MkaT1X/KzYmp77mCJVf5GYHX0tOIq80uHfMBa5phrzY9t/RxOnREHI/b+FUC4+XOZT3PYv4TvylZN5RTybpHyq+EKZrBwxElC+zRqDdatfK4bkXHhc3qU1DeGLwuzyeZqGcpLCFJ2xJFMz+XCrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i1+I76CyKdUWJ4MQbq2Ze10IzP0oFO7VgnsL6XDxGWo=;
 b=mo1iofrdTiW4Z/trRiiJrptLXXCkEBwo+aHq9qBRtALAMgpNn9p85+9//Ao29s7oMpfz+h8r5IPu7VdPAhkTAOiWQ+PNQtDK1Y0A+/wMetucCHuVf4NtYvBCRSaeFWUWr+KL1+L4DHesAwcYtEsrVqUIz2RHGjs90OZYzCq9uCgYvK2g6eIT81iUidrnjFRQavPgddKbos1T6KYjnMH3WJFH7IBYzszExuEl+VwJsKIODb6/hT1Bj57+8PsN0hv8Y7/Ggc1yxX6lA0NsSnsfnRBsEHxq9OpgNe85VUE3CqByk3SYkG9CAMQB20egObEZ0npHqRi+pEJ9N4HUXsoshQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by DS0PR11MB6374.namprd11.prod.outlook.com (2603:10b6:8:ca::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8583.42; Thu, 3 Apr 2025 21:39:18 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%5]) with mapi id 15.20.8534.043; Thu, 3 Apr 2025
 21:39:18 +0000
Message-ID: <3716deb0-563c-49fb-9360-743e4c45682c@intel.com>
Date: Thu, 3 Apr 2025 14:39:16 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] drm/xe: Add devcoredump chunking
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>
References: <20250403202705.18488-1-matthew.brost@intel.com>
 <20250403202705.18488-2-matthew.brost@intel.com>
Content-Language: en-US
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20250403202705.18488-2-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0268.namprd04.prod.outlook.com
 (2603:10b6:303:88::33) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|DS0PR11MB6374:EE_
X-MS-Office365-Filtering-Correlation-Id: 957c241b-dfe4-4505-ce1f-08dd72f7fcbc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SDZOSnFKR2VTWmZNemxDamxvdTBIRXMzVnZkT1VqSDcwNmxJYzljbWxjTEVj?=
 =?utf-8?B?NTBsbXF1N3ZJNGNyTEhlc1RUeTMxVXBHYU5aRUlMS3RDMk1kREFSTy9ZR0hj?=
 =?utf-8?B?eGVVRGowdXl1YkQ2elk0b0NCanF2VnN1WS8wR1hZQktXcElUb1N2d2NhRWVE?=
 =?utf-8?B?V3RoMytrbkU5MTdiTUV4Z0lnaDhGMkhUYldXb1MzdXdLdUMrUmRKSU83bjVi?=
 =?utf-8?B?aHNvYWRJMUhVY2ErbHVzS3IvTWdsY1ROcGR2OUlCQ2c3MXIrcTB0dmJtUmNR?=
 =?utf-8?B?L3RMdStkMXJjN0Q0WnNyVi9iM3FPdjlnMzBFbmZKcmZhbjVuNGRobkpvNVJp?=
 =?utf-8?B?NXNkVFM0T3I4Y0RYWjgyYkNJWVVkeEpJckVJOU9wTW8ySStlbEVxUWdDOTAz?=
 =?utf-8?B?RmpvZFZSZjdvZEpnZmx0cEFYckQ3QVUxbmNXVTc0UE83Y0t3VDFVZDBOZEQy?=
 =?utf-8?B?VFJDK0twZ0FTQzlFbFk0NXpUcWtUQUxxbytSajNCMUN1Sld5L1E1enpiU0xK?=
 =?utf-8?B?SHgzUnNHSStiTWhLS3pvUE9hdHN2MFVOOHpOWWdhczkxTlg3eXlhVkRBdkdy?=
 =?utf-8?B?K2NZRGZhQXlkaVJWREVncC9NRHVWWjBuKzBxbVdJN0lNRGxLUVlhZll6eTkw?=
 =?utf-8?B?N0pudElrNVNJZEJvSlF1R1dtUlFyV3ZsRkpQTS9GVVlWSE52elJESXp5QjJP?=
 =?utf-8?B?a0VlYjM3TXRmQlRIWjlzZTN5VnNIK3FWdmRWMFZiRnc4b0VVc0FLM0pKcFd5?=
 =?utf-8?B?VFVqcjB3a25FeEFRREVXb3VXcVR2Wnh1bXAxZ1Q4REVzSmNJNENCM2pIajYw?=
 =?utf-8?B?Z25qVWdBLzVZQlBtUy9tOXd2QmJRcXZ0UzBpaGtubmlMV2ROSkJVNWFLNWhL?=
 =?utf-8?B?cWoyTEQrVnQ4c2xYNWpQR3U4MTRmcWNvNjlOMHcwSWovejZDcWFRdjdwcGw5?=
 =?utf-8?B?YkRXM0hYekU2ZC9qb0xqL004L0FqTkZ3ZGMyNjlWK3dxeDFvSkdLcXBveDRm?=
 =?utf-8?B?akN5YWticE5Fbnl3dlVWbnZ4akM1S0dBTUFSVVJKd3ZML1JvMERGYjhDS3hN?=
 =?utf-8?B?R0RDTEttc0F1dkZ3eTlIVEpQam9zU1VHNVBhZVd0SThSS1dRd3ZLdnluRXRa?=
 =?utf-8?B?K0dQdFRDa0dxMFFZSG0rUmZndmRqUUJoWTRQSkR2TkNybjNMQlVSeEdnUUV6?=
 =?utf-8?B?amV4RkUyajhzc2NMRG5mMUdZdDlLaDRicDc4RkxvYThIVFZTR3hVOXB1NmVQ?=
 =?utf-8?B?cWRibDFhc0NLZ0lrRGJRaTJPSjlFVk50amRsU1lOK29QRklTM2kvYU4rRitY?=
 =?utf-8?B?TVpFaGNtZ2w2NzZBRW9tZ1JHd1c5bHpzb3AxSk1JenRBSXd4VzBYb3M2OWpU?=
 =?utf-8?B?YlA4SUlsN2h5OU5kQy8yRUUvK2tRZG9GbEpTcmgrdjNub1A0MjFHN0hsWExn?=
 =?utf-8?B?S1lna0lIUHBkQ2JUN0JtSk1sYytXeGFNQjd5ckFtTldicmpRWGphNExlRFg0?=
 =?utf-8?B?Y1A1RW9PSFAyWE5nYi9CejBmVmh5ck5Hb1dyb0dZRmF1TTUvWWhMRThPTHNu?=
 =?utf-8?B?bVkrRzFxMXBzTkVCTDJNejBRVkxYSHpHLzZuYUI1d25pWktpTHFWUDFYT0VP?=
 =?utf-8?B?MUN5ckhDRjdTRFFoTWh0dDdLTkVmcUR0VmxLd2hNV09VQys0S2RBcFprNUdD?=
 =?utf-8?B?WkRkbEp3WlBUU2NsN1dWVC9GcUFES1drQ3p1djhoeFlLZGJkREpsVWQvZHNB?=
 =?utf-8?B?aW9ibk9LdnduWWE4ak81QmV4Q0QzdVpxTW03YXN5RVk4cW9hZGppQzlINi9T?=
 =?utf-8?B?SmJoSy81MnJuUUltMytjLzFaazJjNklKL1UyNUV6RG85UDFzaEpFWGZTdThj?=
 =?utf-8?Q?Giucd7L6IOYIF?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V3A1TFdjbUlXcURKaUY2OStUTVZtbjlEdWZ3WE5ZSE9iS0xiTXlpZGNSQ3FB?=
 =?utf-8?B?c1Y1ZnY4aCt4eGk0R3RYbU5ZUnE0SGNPOFlSM2lYOExuSEZ5ZWJCblQ2UmhQ?=
 =?utf-8?B?K1NCeWVtY2l0Qmg3dWZyK3ViTTRJRVlLRGdjci9OQnk2V3Z4TWFYQnNxbzJX?=
 =?utf-8?B?R2kyZVlrQWpUY1c4eXN3Y1JMeTFkQzJYKzdFYU9tbkZtdHRLendsa3lUdGJT?=
 =?utf-8?B?dTNSNEd0azJTZTNoNWtUQWE1WERyV2NTYTJxaEsrQ1JjVUxOdWNuNTFYdUNX?=
 =?utf-8?B?TTAzYVFmU3gvWlN2c2pYc2dxWFNiSUMwcEVCUjlQWmRxQkJFaHQ1S3kxSUdU?=
 =?utf-8?B?OE9jMWd1NFVEZU9sbkNhZ3ZyVWpiSWlQbktoN2JlTENwd0JFUVNDK2M1bWd1?=
 =?utf-8?B?cFdlVnJib3gxSE5YZEdhbkM2eHl0MTNENE85QkswcHRJckNIVzRTbE9nR29M?=
 =?utf-8?B?MmU3WDlxTXBROXYxRHdYRnBuWkcvd0lCM2ZpdG1ucU5JMTlBZ2FBbi9VbElw?=
 =?utf-8?B?TDVxQlFySGRRYjlWczRFdXRxOVJzbUlyNnZIdW5mTXE3Y1VkUGkxeHVQMDlK?=
 =?utf-8?B?czZROWFlaGxaZi9GUGhDeEhFUzRxVkZmQnJoYU1pdlU5UFVFVC95eHlKTWZw?=
 =?utf-8?B?T1VMNXdYcnRZOHBDTEk1YzBaT1VYWDFnOCtUYmM5VTgxZ0FKcEVyalNFai92?=
 =?utf-8?B?aUVEcExacVVVS3BGSWs2SXhPbGUveDJSa2tNWk5GMkgrbStRZ0pLdElGL3Jq?=
 =?utf-8?B?d1R3bEhsYmkxb0tpSmF0WU81RFFIUnZqaWtmaTJhOXBWY1lBTWgzUzVoV1pN?=
 =?utf-8?B?cHhQeXM3TWkrQ2QrWXl3SllXNmExdnRuY1ZXakt5QjFqeEZldTYvc2ViUjFx?=
 =?utf-8?B?ck9HZ1FLeVlPVTF2dmhIU3dVWXU1N2lKaDRwWHZIcHpDcHI5UkhFRng3M1JJ?=
 =?utf-8?B?YlhtbWx6cUZMRjBrY0lOYi9yQnhlYWhJbWljQzlUcVA3NkZZYnpjSkhOU09o?=
 =?utf-8?B?Nk9va24yQlVLcllkQit5QW5xNDZVc0Jacy81bVFoR1dwUEFibkxRKzF0SUVp?=
 =?utf-8?B?QnlrY3A4YjhOUTZJUWppaGJDQXEzV20yS1VWQ0dORFJJWmk3em5RakQrSms0?=
 =?utf-8?B?ejYvM3d2dnIybnZabzFEb3N1ZGdyc0w0REFJWlBML1d0UndYMWdXZDdGU0kx?=
 =?utf-8?B?UFpsTUVSTXlRUVpKc3IvWUFyUDN0L1FqeVdaVVp4RkVQY29VQnJwcUo4WVdx?=
 =?utf-8?B?SzNseHBaN0tWU1RCZkdmYXN2S1VaQm9HZnpwVmh6OFN3cFgxR0hidzh3RjMx?=
 =?utf-8?B?cVdOekE0VlhxeUx4cmVLTVhuTjk0OFQrZW5FWklLUlYvamJPYVJkWXhnRUY5?=
 =?utf-8?B?TUdxRXgzaDRHK0xza3IwN0FLOHliVEpWMWs5SDlUS2pYaE10R2ZUcnVSeWNo?=
 =?utf-8?B?Q2RrSDZFQXR1MG9QYlRGWVVRYjdtQi83UUhTbGc0N3FhTEk1T1I2bHpMS094?=
 =?utf-8?B?TGJkV0JiUzQzcUFDaEpxd2lobnJ5NC80ZFFqYjNXc3JwTXZMSjQ4eDVEU2Zw?=
 =?utf-8?B?cnpOc3JVWWlNZ2luZEhUeFdaVnhjMVhJZlgwZHRJMW1IQWlqOHRBY1RXT2E3?=
 =?utf-8?B?em9WOVIzaTZlYXpPUTlZOStKbElRbG5IaURBazdhT1ByR3F3TW56L2dSRk9o?=
 =?utf-8?B?R0ZsZElSVCs3OTdyY0ZSa2NuMk1QcjNFNFBYak1IamJPd3BvelNEVEs0LzQ3?=
 =?utf-8?B?TDhxR2J2K2JPSzltUFFmOThNSzh6b3EyVjArbHdDcDl2SjI3a3hnSkFNUXA1?=
 =?utf-8?B?UEdGbW1ZRWUxaGxGT2ZPVEppSUtjOVBjQUpuN3ZEdC9LRkFZZjdUeVkxR0RZ?=
 =?utf-8?B?ZkNyZUN3MFg2THN1dnNtV1crSW9ZWTRnQ2twYVJ4NFFqU3RrN2pSbEhOOEJB?=
 =?utf-8?B?L2szY1BJd1NiOW9xSGJicE1zTm9sVHdrTlR5cm9UOGs1SEp0RDU5ajVFY1BS?=
 =?utf-8?B?c2xkUm15S2dDT1I1bDNGRUZkUWRMbVFKWVc5TmZpYm54bGx3QlpnSWJjS1JE?=
 =?utf-8?B?QUpXMUp1QkEzRXVPQVJoR1p0QkFKUFNFRkJnRS9YOTVkL2FNc1Q1RHJUcE9u?=
 =?utf-8?B?RTJ0aTVjKzd6d1VtTU15b3VKemNpT21sbGszVUh3RWFlNFFpYnN6SUVldkZw?=
 =?utf-8?B?cGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 957c241b-dfe4-4505-ce1f-08dd72f7fcbc
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 21:39:18.0955 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H1JfFO23TVfVYJ21504VVa4CT2ega2wwDFK309J78hFfuvyOuLfuneah5lRbTakNwCfOXVvS38xYCjv8Uo/iJjfD65SVkllL5NIh8M2yT6A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6374
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

On 4/3/2025 1:27 PM, Matthew Brost wrote:
> Chunk devcoredump into 1.5G pieces to avoid hitting the kvmalloc limit
> of 2G. Simple algorithm reads 1.5G at time in xe_devcoredump_read
> callback as needed.
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_devcoredump.c       | 59 ++++++++++++++++++-----
>   drivers/gpu/drm/xe/xe_devcoredump_types.h |  2 +
>   drivers/gpu/drm/xe/xe_guc_hwconfig.c      |  2 +-
>   3 files changed, 50 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
> index 81b9d9bb3f57..a9e618abf8ac 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> @@ -80,7 +80,8 @@ static struct xe_guc *exec_queue_to_guc(struct xe_exec_queue *q)
>   	return &q->gt->uc.guc;
>   }
>   
> -static ssize_t __xe_devcoredump_read(char *buffer, size_t count,
> +static ssize_t __xe_devcoredump_read(char *buffer, ssize_t count,
> +				     ssize_t start,
>   				     struct xe_devcoredump *coredump)
>   {
>   	struct xe_device *xe;
> @@ -94,7 +95,7 @@ static ssize_t __xe_devcoredump_read(char *buffer, size_t count,
>   	ss = &coredump->snapshot;
>   
>   	iter.data = buffer;
> -	iter.start = 0;
> +	iter.start = start;
>   	iter.remain = count;
>   
>   	p = drm_coredump_printer(&iter);
> @@ -168,6 +169,8 @@ static void xe_devcoredump_snapshot_free(struct xe_devcoredump_snapshot *ss)
>   	ss->vm = NULL;
>   }
>   
> +#define XE_DEVCOREDUMP_CHUNK_MAX	(SZ_512M + SZ_1G)
> +
>   static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
>   				   size_t count, void *data, size_t datalen)
>   {
> @@ -183,6 +186,9 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
>   	/* Ensure delayed work is captured before continuing */
>   	flush_work(&ss->work);
>   
> +	if (ss->read.size > XE_DEVCOREDUMP_CHUNK_MAX)
> +		xe_pm_runtime_get(gt_to_xe(ss->gt));
> +
>   	mutex_lock(&coredump->lock);
>   
>   	if (!ss->read.buffer) {
> @@ -195,12 +201,26 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
>   		return 0;
>   	}
>   
> +	if (offset >= ss->read.chunk_position + XE_DEVCOREDUMP_CHUNK_MAX ||
> +	    offset < ss->read.chunk_position) {
> +		ss->read.chunk_position =
> +			ALIGN_DOWN(offset, XE_DEVCOREDUMP_CHUNK_MAX);
> +
> +		__xe_devcoredump_read(ss->read.buffer,
> +				      XE_DEVCOREDUMP_CHUNK_MAX,
> +				      ss->read.chunk_position, coredump);
> +	}
> +
>   	byte_copied = count < ss->read.size - offset ? count :
>   		ss->read.size - offset;
> -	memcpy(buffer, ss->read.buffer + offset, byte_copied);
> +	memcpy(buffer, ss->read.buffer +
> +	       (offset % XE_DEVCOREDUMP_CHUNK_MAX), byte_copied);
>   
>   	mutex_unlock(&coredump->lock);
>   
> +	if (ss->read.size > XE_DEVCOREDUMP_CHUNK_MAX)
> +		xe_pm_runtime_put(gt_to_xe(ss->gt));
> +
>   	return byte_copied;
>   }
>   
> @@ -254,17 +274,32 @@ static void xe_devcoredump_deferred_snap_work(struct work_struct *work)
>   	xe_guc_exec_queue_snapshot_capture_delayed(ss->ge);
>   	xe_force_wake_put(gt_to_fw(ss->gt), fw_ref);
>   
> -	xe_pm_runtime_put(xe);
> +	ss->read.chunk_position = 0;
>   
>   	/* Calculate devcoredump size */
> -	ss->read.size = __xe_devcoredump_read(NULL, INT_MAX, coredump);
> -
> -	ss->read.buffer = kvmalloc(ss->read.size, GFP_USER);
> -	if (!ss->read.buffer)
> -		return;
> +	ss->read.size = __xe_devcoredump_read(NULL, LONG_MAX, 0, coredump);
> +
> +	if (ss->read.size > XE_DEVCOREDUMP_CHUNK_MAX) {
> +		ss->read.buffer = kvmalloc(XE_DEVCOREDUMP_CHUNK_MAX,
> +					   GFP_USER);
> +		if (!ss->read.buffer)
> +			goto put_pm;
> +
> +		__xe_devcoredump_read(ss->read.buffer,
> +				      XE_DEVCOREDUMP_CHUNK_MAX,
> +				      0, coredump);
> +	} else {
> +		ss->read.buffer = kvmalloc(ss->read.size, GFP_USER);
> +		if (!ss->read.buffer)
> +			goto put_pm;
> +
> +		__xe_devcoredump_read(ss->read.buffer, ss->read.size, 0,
> +				      coredump);
> +		xe_devcoredump_snapshot_free(ss);
> +	}
>   
> -	__xe_devcoredump_read(ss->read.buffer, ss->read.size, coredump);
> -	xe_devcoredump_snapshot_free(ss);
> +put_pm:
> +	xe_pm_runtime_put(xe);
>   }
>   
>   static void devcoredump_snapshot(struct xe_devcoredump *coredump,
> @@ -425,7 +460,7 @@ void xe_print_blob_ascii85(struct drm_printer *p, const char *prefix, char suffi
>   	if (offset & 3)
>   		drm_printf(p, "Offset not word aligned: %zu", offset);
>   
> -	line_buff = kzalloc(DMESG_MAX_LINE_LEN, GFP_KERNEL);
> +	line_buff = kzalloc(DMESG_MAX_LINE_LEN, GFP_ATOMIC);
Is this related? Or should it be a separate patch?

>   	if (!line_buff) {
>   		drm_printf(p, "Failed to allocate line buffer\n");
>   		return;
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> index 1a1d16a96b2d..a174385a6d83 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
> +++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> @@ -66,6 +66,8 @@ struct xe_devcoredump_snapshot {
>   	struct {
>   		/** @read.size: size of devcoredump in human readable format */
>   		ssize_t size;
> +		/** @read.chunk_position: position of devcoredump chunk */
> +		ssize_t chunk_position;
>   		/** @read.buffer: buffer of devcoredump in human readable format */
>   		char *buffer;
>   	} read;
> diff --git a/drivers/gpu/drm/xe/xe_guc_hwconfig.c b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
> index af2c817d552c..21403a250834 100644
> --- a/drivers/gpu/drm/xe/xe_guc_hwconfig.c
> +++ b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
> @@ -175,7 +175,7 @@ int xe_guc_hwconfig_lookup_u32(struct xe_guc *guc, u32 attribute, u32 *val)
>   	if (num_dw == 0)
>   		return -EINVAL;
>   
> -	hwconfig = kzalloc(size, GFP_KERNEL);
> +	hwconfig = kzalloc(size, GFP_ATOMIC);
Likewise this?

John.

>   	if (!hwconfig)
>   		return -ENOMEM;
>   

