Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45910A69C1A
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 23:34:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D36710E0E6;
	Wed, 19 Mar 2025 22:34:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JjmypgMX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 915E510E090;
 Wed, 19 Mar 2025 22:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742423660; x=1773959660;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JP74oPvSANfRX1hBqte2N978rczLYUhbKpgMjn69Rgg=;
 b=JjmypgMXrRk0qf7uMdpDgOoj3ZBbRLKfiJQoAyCM9UUvfwsHI+iCGEpj
 ONYT4hjuKNdKAwV8om7YrRhKXsz0Rcp2QYenRtwKSVbnHtXCoYkjSEa1J
 HcRGwtJRz09nhJ3AVVu/FVZzO87awg3AUZSAvNa4v3cbi0q4Fpv5yygVW
 IXgnpzqhJM59N8kT7uBiyBqSYtppmMdkENEltWjLe4OjdyPAbqsOhWmts
 f5W+wu/eK27qlyHoRWp4IdLaJvqyXLhvt0VUCxpTJS8Eb4h5gDYVCobLV
 BgtyxHlFnT04JH4bweuSdSFvbcIIf7YDQwCyI8HZxPcvrseo1f2HTAhgb Q==;
X-CSE-ConnectionGUID: v+Ha8Qx8SRK1JoUqieGRNw==
X-CSE-MsgGUID: urg8ihADT/iLdyObMXlGFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="54303368"
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; d="scan'208";a="54303368"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2025 15:34:19 -0700
X-CSE-ConnectionGUID: URnPlfKYSsWII1nFBkpP3A==
X-CSE-MsgGUID: tMgAgDOZS0imSQjMTbfWFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; d="scan'208";a="153718781"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2025 15:34:19 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 19 Mar 2025 15:34:19 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 19 Mar 2025 15:34:19 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 19 Mar 2025 15:34:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MQSjbOgB9MlH1qvjLF3t2gsvuxjtXUXZjhQGZzzkaAOtpf+VqoC1DaaXSRzKFGdH+Jz6/RuePsiNFd+QodCIlVH9SF7EGAsbo1xTE5t8ibJpKVdXb3Usx7pf7Mvy31jv7u3yKCG0tojPKb/F4dRXjgBGNolkQzC/AsSvKd5zivWt853sNJpFwm+kKuWuzLAbkI1oa1ihEXiwzwgldD9PlkkRqCzoHDxUgyjB+46094REn0VwmlGx3GUyKB3JZdvnFU5VCthUCWrEpewK2fKt6CA76sKb+WP59Jk1iI64vT1TrZz8nqMUqZTygMJH5efuUNmlI3Wt0rvodvSIsy7l8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zVsHSDSSgGKLgksHinEAGqmaLc3gwowS0atN5aWhahM=;
 b=GLuJDeil4oQQK4EdKKBqT9yU0c7pFfGjtkl38kBb9xIjw3v58dYsU3B5mVJF1cW6RXOcQHnRY5hXrjJz3jnLydqrQ4C9bSP5uZZpI0RTGJn1G6FEab7c4gaC2JNPxmkj7bYXmGoYviclWSvHdc8/BkNkWl9+U1maEsxrWmPppyjO+E+QB5XDp0AiITzkqFGBY4i3nELgGmaxv17K3c/iSWiQe0AvOk2wezJIgdjV1KBl7zFiJeeLjSxNVevmQ0cdfF6zlmOEAGr2o05X8PYhg1FQavcY7hRX1cII5Hu8AquE7luN9qGyenvjiyCA/r8AqNUiTs3hmxIWU5CqAVXfGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8707.namprd11.prod.outlook.com (2603:10b6:610:1bf::20)
 by BL4PR11MB8848.namprd11.prod.outlook.com (2603:10b6:208:5a7::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Wed, 19 Mar
 2025 22:33:47 +0000
Received: from CH3PR11MB8707.namprd11.prod.outlook.com
 ([fe80::24af:ac1c:2b1d:7e62]) by CH3PR11MB8707.namprd11.prod.outlook.com
 ([fe80::24af:ac1c:2b1d:7e62%3]) with mapi id 15.20.8534.034; Wed, 19 Mar 2025
 22:33:47 +0000
Message-ID: <a9729627-3898-46ab-ab4b-556aea689b6a@intel.com>
Date: Wed, 19 Mar 2025 15:33:44 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/6] drm/xe/uapi: Define drm_xe_vm_get_property
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Gupta, saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex"
 <alex.zuo@intel.com>, "joonas.lahtinen@linux.intel.com"
 <joonas.lahtinen@linux.intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Lin, Shuicheng" <shuicheng.lin@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "Mrozek, Michal"
 <michal.mrozek@intel.com>
References: <20250318171146.78571-1-jonathan.cavitt@intel.com>
 <20250318171146.78571-4-jonathan.cavitt@intel.com>
 <4f6e669c-5d80-4bf9-a7ab-eac8c0ce8000@intel.com>
 <CH0PR11MB5444600AD376DB09737B32B4E5D92@CH0PR11MB5444.namprd11.prod.outlook.com>
 <CH3PR11MB8707995DFB1FAE57E0023449F4D92@CH3PR11MB8707.namprd11.prod.outlook.com>
 <CH0PR11MB5444F20BF59C2DB0B7A2953DE5D92@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Language: en-US
From: Jianxun Zhang <jianxun.zhang@intel.com>
In-Reply-To: <CH0PR11MB5444F20BF59C2DB0B7A2953DE5D92@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR02CA0041.namprd02.prod.outlook.com
 (2603:10b6:a03:54::18) To CH3PR11MB8707.namprd11.prod.outlook.com
 (2603:10b6:610:1bf::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8707:EE_|BL4PR11MB8848:EE_
X-MS-Office365-Filtering-Correlation-Id: 50da79bc-8028-42a5-7673-08dd67361d36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c1BwN2FOWGx6OVNoTy85NVhSY21sM0tiT1ozbHNVdWFyRWUxV1lYaituTjVD?=
 =?utf-8?B?TTl2bVM3czNEdHorenhkZE83VDBGaEs5NjJpSGttaEh1U2hYUzJXUkZ1MlJU?=
 =?utf-8?B?WTVaTTRXN1lXejdEdVQ2VmRCNHZ6azcxYkZlTVFBQ3dSVlJYT1VzQkhGQjBi?=
 =?utf-8?B?MGNmdjNoRzhLUHdCdlhOVmxQVE05Y0tLK3FoQzJWb3pHelk3QlFmbitRZXJP?=
 =?utf-8?B?UmFFbWFNd0tQUXQ4ckFBZjNMTW16K21ERTlsZ1I1Rnc3NHh4enBTNHZIMFZh?=
 =?utf-8?B?MGllRHdNOHJyS0RIYVFGNUw1NzhjeW40amNnS3FBRUVoYjZ3aG9uRHgxU1Y3?=
 =?utf-8?B?R09weE9DcEJYZGZuSEt5S3FCaEVMTXE4U2YrbHhpbVRLRmJHOGpqODNDY253?=
 =?utf-8?B?WGx1WC9XWEVhVEowc2N5ZGNkQXU0RWx5elVDdUIwM0JqdWZTUFlBZkNjR0Js?=
 =?utf-8?B?cnNkWFV2azhqcXYvRVdUSUVMSGMxb0NOSHdCcDlDenA4dW1mVERZS2pRNWVa?=
 =?utf-8?B?WEE2cWw2eDVIK3czTlU0VlpYUXF5MFFhaXNvdlBxRFcvSzNROVhKZ25ibFQy?=
 =?utf-8?B?V0pQN3Jkc0ErUE5idWVXZG5KbndNbjZEN2RmMjFiSlF1TkdBOUhsNld2SFgr?=
 =?utf-8?B?bDhwcU00VlpUT09tTDh5ckNWZ1NQdVN2QkFJME1LaUJVVWFyOVpJSkJsVkx4?=
 =?utf-8?B?dFI5VHh3eUk5bkI5YmtPUEYvU2VaL0g5Vm4xemkxd1o0NkE0Rk9KZjgzVDBE?=
 =?utf-8?B?ZUFIbXFpbkJuZ2NkcVo1SUR5b0lKWUZYVCtyVkJReW01bGNEaXd5amlpZURy?=
 =?utf-8?B?UFZOditNM2pGcWtFVkRmYWhFbkF4OUk4M1lIR2dUK0pvbGY2ZnE5aWRmMWcr?=
 =?utf-8?B?Y1k2a1RSc2U1V1d2bWdMSTJpWTlMSkJLRXQ5Vy9ua29zcUhENGxWOVcrK3M4?=
 =?utf-8?B?aGx3S1BqQUg5S1FOMEovN1dLS24zMURuLzBSeDBTRUZqUnYwblArSWNtV3I5?=
 =?utf-8?B?cUgzZ1JtVjFHa1ZQSjF5dFMrSEJGSjZsazM3RU5DOXhxM0lYQWEzZ2Q2RHFy?=
 =?utf-8?B?endKZ2RYM2MrRENHK0hFQ2k5OUplMGRNNDJoYVNiZmx1YnB5NXU1M3k4Q3Ex?=
 =?utf-8?B?WGJhRXpXa01jbkxjbVVwWHcweWQ4NzlRcDBiT0dpTEJhMUtVSU85U05sQUJY?=
 =?utf-8?B?TGl1SWhYREQ0N3lyNVZkNmpoMWxUM3Q5V3Q1Z0FDdmd6RWVCbno3SUw4RDZp?=
 =?utf-8?B?WkVxM01VQnBPRmlkNFg1RThhVjEwdVFpbyt1KzBnWVYzbVJZVDB3cTJXdm95?=
 =?utf-8?B?eXNCRUVndnRrUm5mbHNpQmFSUER1MEJyeWhvTXN4TFFjSFUxWHV4Zk55dVpu?=
 =?utf-8?B?WHBLUjUrYVJMMlduNUxoZWRHVzkvWEMrYTVDcUlaTGM4d0tPRDJHL3VOVkJB?=
 =?utf-8?B?TWZ3VnlCK1VsOURrT1ZjR1dndnNvZVdjSzVJUk1sQ3NpaVR3K2RuTlBLYm53?=
 =?utf-8?B?SmVRL2tibzlVT3dUVUx4YkpXcWYzdlEvTTVZTEpBTmR5S3BwNWJKa3R6RWFC?=
 =?utf-8?B?U2c4NVQ5N0ZKWDdqdDM3TE5mOStjNDR6bm5DV1NWR0wzRHJHbU1xbnFiYThr?=
 =?utf-8?B?VXZMRDRWR3NqczgzZG5xR0g5MHBKWUs1cHFKUCs1WG1kOFd6RUVrRUtHL2xJ?=
 =?utf-8?B?dWNiUzRjMVVBZjNFSEZwdCtuOGtKT0Z1eDBJeEg3T2oxY1RSeEJpakFaOFFP?=
 =?utf-8?B?SkF5aEZFRkc1cFZaTGlML2ZwMlZDQi9BMUpTeXBScllKOCt4a0hJKzRoM3E3?=
 =?utf-8?B?T21waEdBZnZ0bzg5c3BwamNrMDZHaTAxTU1iQ0xFQXhzaDY3a29rWS8xblk2?=
 =?utf-8?Q?1/YB2c7QZFRLd?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8707.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZEVSdGsvdFV0MkJhUGQ1MkUwOFBSSHF3YUhJM0VpcFB3M25ncko5LzFTY1dv?=
 =?utf-8?B?T0hUT2lRb2trdGtyTFB6dlZmUkd4U3Rudnd1Y1MvRG5JOGt0VWcxdDBPQmw0?=
 =?utf-8?B?dHJ3SlJZV21yYXBJL2dxeDVnQUVIUUV2QzA0QWhsNU9YUkJYd21KcWYzWFBr?=
 =?utf-8?B?ZC9vZ3FJYjdFNGw4cTBVYUZMMnBzYnBUalFPdkRwZlFRKzRleHBGdFdYQWZK?=
 =?utf-8?B?MkRXY005NzlqOGtOYU54NlNHTUhRT0g4NWhGbDFvOWJudWNsTGlwUEZnYXUy?=
 =?utf-8?B?ZDNCYmQzWkpLd29XUTNLMUd4a3ppZG5EOVZEbFNybmo1QUVJcWhHVFRFZzg0?=
 =?utf-8?B?STNZb2FtSEpRdk9rODc0UGZzV1VmRGJ1UFBCRGUrdmliM3IvUVpuWW5aRFNP?=
 =?utf-8?B?Q0Z2aFI4SFNHd0kvdGVkZEpodGgzekkwdWQ5MHYrYTdaWktvRGVDRzRvOFd3?=
 =?utf-8?B?d0pxL1V5T0FYMTcyelRWa09vdjhDS0JhckhlZHQrZUxoM1VMZkVJOC9ORVJv?=
 =?utf-8?B?M2g4aThlOTltdkxZSUhWQkdrS05JcmJ0RSsrV0JoQkZrV1lxaXl2ZGc2TWZJ?=
 =?utf-8?B?c0Z6Tm9lekxPQzZPMzcrZk1CbU1IT29RQSt3WjRuR1c5WTN5RU00WkQvUUNt?=
 =?utf-8?B?WWdVNmdKY2V3TWV2RFF4TmU5ekFLTHQ2S2FNWmtYUm4yRVkrSGVjMGh3ZUpX?=
 =?utf-8?B?d2VGc3hkelNoWGdrV3N5R2M1TGVON1FFYVJ5TXBheEExbG15YlJ0VFdkd3lm?=
 =?utf-8?B?RUxJT2ZZZG4xbEt5NGNveGg3aCs2aDhxcXNKbndYRkxVQ0FqUVpPbUlJYjE4?=
 =?utf-8?B?SHEzSlNHcmkxbVNySTlRSk4xQzFUWFZJa2Y0aUZ0T1NyV3FSUkVzTUV6SldV?=
 =?utf-8?B?ZE1MTyttc3pnNjBsL0lRanBlUnkvN2o4MXFCT0UxL3NVTmxXaVRDWHVqRmVj?=
 =?utf-8?B?dE04UFRReTIyZGJsV1pvWnRKbTZScnNtT3krcVErZEg1R0VQZnJSN05mV1RV?=
 =?utf-8?B?U0pBVmVWdUhUdVBsb3V6TFVhbWN1VlBtVytYVEplUkJDdzMvRC80R0UxbnB1?=
 =?utf-8?B?NkJ1Z09zTTFqY0M3N2hIY0w2aTYybEMzRUoyVytGTWI2M05lUXpGYW5hVTZ2?=
 =?utf-8?B?UmpkdU5DeU5ZK0FSRFBrMEVmY080T1h4dVhHbklRa0V4V0xVOUNLY2I5NE5F?=
 =?utf-8?B?RXV0NVhXd2Y2WVF6bkFqbnZtdzV2YVBsSDdCWnRpWmlGVDJ6dlZPNTJOYjFs?=
 =?utf-8?B?dEMvbXhWcUN4d3VQUjhMT0YvWW50SlN5Nmw2YnR0SzA1UUNoSW1hWHlaaXRG?=
 =?utf-8?B?SXd6VUFmc3lNWmVFa0pNeEgzOS8xeHNaMTlTZTZrTHpIb3VpQU84cXhSS3kr?=
 =?utf-8?B?bDF2SDE4Mjk5cnJERVNZc04xRGFwQUkxT1dLbnduVjBHS1NHK3pIWSttQkdM?=
 =?utf-8?B?N0JweU5ESTA0dS90dkMwcHo3ajY3cVpBZjAxa1ZoZ2hkYjk0UTNhSHIycXN1?=
 =?utf-8?B?dHJ2Nys5S3JmNzN4NGRmU1hOQXMwRks1TjU2M2NwaGEvTFlZeENwVStkbjFs?=
 =?utf-8?B?cXVVZCtIWWVESExUY0czR0o2cXRJRHVnNmoxWXZSS01xUC9OYm5SY1l3WitU?=
 =?utf-8?B?U2I5dVVMVTcybW5KdVNENlEwb2hvb29uY0JaQmtrNnJhcjUzS21wdVNEcExi?=
 =?utf-8?B?UXJLQ1B0RXNUU2lIRk1wcEdiQVBvanJodlVTblBhbHdRbUh5K00yWmM3NkF6?=
 =?utf-8?B?M2cweHh1WUk0WnhPcklrRkt3ak1rbFR4bHZHcUFsMDJTL1VSdGU3emFNSUln?=
 =?utf-8?B?ais3SXJUVzFVQXJoeWZ5enVMNEU5VllpdEtnOFM0aUx3SUFJaG9PQWNaZWRv?=
 =?utf-8?B?T1p5bXVBVnc4TlR1M21GV0VEbjhQcUdKc0N0cFh0d01qVklKWEJxYmVEMzdT?=
 =?utf-8?B?M2xWYTA2am9HVnA1SVo4MTBQWmJCeldKK3BuTGFlMjBCaU5JcStNYmk1N05D?=
 =?utf-8?B?allIVWFuNUlycnkrbzdCRjVpSjhrRy9LcVdGVkFOdzVGc3JacEZhMjhSQ3FY?=
 =?utf-8?B?akg1WTh3ZXdxOFNRSm5DR29MTkZtcnZBblRWb3RGK3Bqbk5qaDh6N1lvOEN6?=
 =?utf-8?B?dmpNNFh4MnBjZTJEcUd3QWJGMEtuOW1GamhIYnhsbDAwRG90M3N2a0hHQ0w0?=
 =?utf-8?B?NlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 50da79bc-8028-42a5-7673-08dd67361d36
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8707.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2025 22:33:47.4336 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e3IUwsHR7nSsAOrv3u2nBSM0eqtaN6HtXzRYWx2Q0DtuVeYq/n/NycnaH3VeDaLNOBrbIss3wiwZN2GDU9/O5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR11MB8848
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



On 3/19/25 14:13, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Zhang, Jianxun <jianxun.zhang@intel.com>
> Sent: Wednesday, March 19, 2025 2:02 PM
> To: Cavitt, Jonathan <jonathan.cavitt@intel.com>; intel-xe@lists.freedesktop.org
> Cc: Gupta, saurabhg <saurabhg.gupta@intel.com>; Zuo, Alex <alex.zuo@intel.com>; joonas.lahtinen@linux.intel.com; Brost, Matthew <matthew.brost@intel.com>; Lin, Shuicheng <shuicheng.lin@intel.com>; dri-devel@lists.freedesktop.org; Wajdeczko, Michal <Michal.Wajdeczko@intel.com>; Mrozek, Michal <michal.mrozek@intel.com>
> Subject: Re: [PATCH v9 3/6] drm/xe/uapi: Define drm_xe_vm_get_property
>>
>> ________________________________________
>> From: Cavitt, Jonathan <jonathan.cavitt@intel.com>
>> Sent: Wednesday, March 19, 2025 1:13 PM
>> To: Zhang, Jianxun; intel-xe@lists.freedesktop.org
>> Cc: Gupta, saurabhg; Zuo, Alex; joonas.lahtinen@linux.intel.com; Brost, Matthew; Lin, Shuicheng; dri-devel@lists.freedesktop.org; Wajdeczko, Michal; Mrozek, Michal; Cavitt, Jonathan
>> Subject: RE: [PATCH v9 3/6] drm/xe/uapi: Define drm_xe_vm_get_property
>>
>> -----Original Message-----
>> From: Zhang, Jianxun <jianxun.zhang@intel.com>
>> Sent: Wednesday, March 19, 2025 12:59 PM
>> To: Cavitt, Jonathan <jonathan.cavitt@intel.com>; intel-xe@lists.freedesktop.org
>> Cc: Gupta, saurabhg <saurabhg.gupta@intel.com>; Zuo, Alex <alex.zuo@intel.com>; joonas.lahtinen@linux.intel.com; Brost, Matthew <matthew.brost@intel.com>; Lin, Shuicheng <shuicheng.lin@intel.com>; dri-devel@lists.freedesktop.org; Wajdeczko, Michal <Michal.Wajdeczko@intel.com>; Mrozek, Michal <michal.mrozek@intel.com>
>> Subject: Re: [PATCH v9 3/6] drm/xe/uapi: Define drm_xe_vm_get_property
>>>
>>> On 3/18/25 10:11, Jonathan Cavitt wrote:
>>>> Add initial declarations for the drm_xe_vm_get_property ioctl.
>>>>
>>>> v2:
>>>> - Expand kernel docs for drm_xe_vm_get_property (Jianxun)
>>>>
>>>> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
>>>> Cc: Zhang Jianxun <jianxun.zhang@intel.com>
>>>> ---
>>>>    include/uapi/drm/xe_drm.h | 80 +++++++++++++++++++++++++++++++++++++++
>>>>    1 file changed, 80 insertions(+)
>>>>
>>>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>>>> index 616916985e3f..ef335471653e 100644
>>>> --- a/include/uapi/drm/xe_drm.h
>>>> +++ b/include/uapi/drm/xe_drm.h
>>>> @@ -81,6 +81,7 @@ extern "C" {
>>>>     *  - &DRM_IOCTL_XE_EXEC
>>>>     *  - &DRM_IOCTL_XE_WAIT_USER_FENCE
>>>>     *  - &DRM_IOCTL_XE_OBSERVATION
>>>> + *  - &DRM_IOCTL_XE_VM_GET_PROPERTY
>>>>     */
>>>>
>>>>    /*
>>>> @@ -102,6 +103,7 @@ extern "C" {
>>>>    #define DRM_XE_EXEC                       0x09
>>>>    #define DRM_XE_WAIT_USER_FENCE            0x0a
>>>>    #define DRM_XE_OBSERVATION                0x0b
>>>> +#define DRM_XE_VM_GET_PROPERTY             0x0c
>>>>
>>>>    /* Must be kept compact -- no holes */
>>>>
>>>> @@ -117,6 +119,7 @@ extern "C" {
>>>>    #define DRM_IOCTL_XE_EXEC                 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)
>>>>    #define DRM_IOCTL_XE_WAIT_USER_FENCE              DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
>>>>    #define DRM_IOCTL_XE_OBSERVATION          DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OBSERVATION, struct drm_xe_observation_param)
>>>> +#define DRM_IOCTL_XE_VM_GET_PROPERTY       DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_VM_GET_PROPERTY, struct drm_xe_vm_get_property)
>>>>
>>>>    /**
>>>>     * DOC: Xe IOCTL Extensions
>>>> @@ -1189,6 +1192,83 @@ struct drm_xe_vm_bind {
>>>>      __u64 reserved[2];
>>>>    };
>>>>
>>>> +/** struct xe_vm_fault - Describes faults for %DRM_XE_VM_GET_PROPERTY_FAULTS */
>>>> +struct xe_vm_fault {
>>>> +   /** @address: Address of the fault */
>>>> +   __u64 address;
>>>> +#define DRM_XE_FAULT_ADDRESS_TYPE_NONE_EXT         0
>>
>>> Just a question, VK_DEVICE_FAULT_ADDRESS_TYPE_NONE_EXT in Vulkan spec
>>> specifies the address of the fault does not describe a page fault, or an
>>> instruction address. Does this NONE type in KMD mean the same thing?
>>
>> I think it means that the page that was attempted to be accessed did not exist.
>> Read, by comparison, means that the page existed, but that permission was
>> not granted to read the contents.  Write means the same thing for write
>> permissions.
>>
>> At least, that was my understanding.
>>
>> -Jonathan Cavitt
>>
>> But no matter if the page existing or not, the type of access, read, write or exec is always present. Make sense?
> 
> Yeah, that makes sense.  Though I don't think that's what the address type field is being used for?
> 
> Here's the itemized list of places where these address types are used:
> 
> DRM_XE_FAULT_ADDRESS_TYPE_NONE_EXT:
> Used during pagefault handling, if no associated VM was found.  It's also technically the default address type
> (as the pagefault structure is initialized to all zeroes).
> 
> DRM_XE_FAULT_ADDRESS_TYPE_READ_INVALID_EXT:
> Currently unused
> 
> DRM_XE_FAULT_ADDRESS_TYPE_WRITE_INVALID_EXT:
> Reported if we attempt to perform a non-read operation on a read-only VMA.
> 
> Should we expand this list before creating the next revision?  Or perhaps rename address_type to
> something else?
> 
> -Jonathan Cavitt
There are two groups of definitions of access or address types in KMD, 
DRM_XE_* macros here and enum xe_gt_pagefault_access_type that could be 
derived from bspec 77412. The DRM_XE_FAULT_ADDRESS_TYPE_NONE_EXT is an 
addition but it is in neither bspec nor Vulkan spec.

Assuming Bspec 77412 is the right place of what KMD gets from lower 
level, I think we should align both KMD and UMD in the interface around 
it. What I can imagine is:

If KMD needs to parse or interpret fields of PF descriptor struct 
internally, say, printk out page fault in a pretty way, you can just 
report all of these fields one by one in struct xe_vm_fault, plus their 
encoding definitions in xe_drm.h.

If KMD doesn't feel dealing with these fields is necessary, your work 
can be as simple as reporting raw dwords of PF descriptor struct back to 
UMD. UMD will interpret these fields according to bspec 77412 and then 
map them into VK definitions.

(You can still report raw values to UMD and have some parsing for KMD 
internal need, of course. I just think it is a waste to do the work in 
both sides.)

Actually, there are some fields still missing like fault type in 77412 
that is necessary for fault level. (enum xe_gt_pagefault_fault_type)

You can have a talk in KMD team, and I am okay with either way. (I 
didn't know there is a bspec for the PF. But thanks to one of your 
commit msg, I now can see things more clear. :-)


> 
>>
>>>> +#define DRM_XE_FAULT_ADDRESS_TYPE_READ_INVALID_EXT 1
>>>> +#define DRM_XE_FAULT_ADDRESS_TYPE_WRITE_INVALID_EXT        2
>>>> +   /** @address_type: Type of address access that resulted in fault */
>>>> +   __u32 address_type;
>>>> +   /** @address_precision: Precision of faulted address */
>>>> +   __u32 address_precision;
>>>> +   /** @fault_level: fault level of the fault */
>>>> +   __u8 fault_level;
>>>> +   /** @engine_class: class of engine fault was reported on */
>>>> +   __u8 engine_class;
>>>> +   /** @engine_instance: instance of engine fault was reported on */
>>>> +   __u8 engine_instance;
>>>> +   /** @pad: MBZ */
>>>> +   __u8 pad[5];
>>>> +   /** @reserved: MBZ */
>>>> +   __u64 reserved[3];
>>>> +};
>>>> +
>>>> +/**
>>>> + * struct drm_xe_vm_get_property - Input of &DRM_IOCTL_XE_VM_GET_PROPERTY
>>>> + *
>>>> + * The user provides a VM and a property to query among DRM_XE_VM_GET_PROPERTY_*,
>>>> + * and sets the values in the vm_id and property members, respectively.  This
>>>> + * determines both the VM to get the property of, as well as the property to
>>>> + * report.
>>>> + *
>>>> + * If size is set to 0, the driver fills it with the required size for the
>>>> + * requested property.  The user is expected here to allocate memory for the
>>>> + * property structure and to provide a pointer to the allocated memory using the
>>>> + * data member.  For some properties, this may be zero, in which case, the
>>>> + * value of the property will be saved to the value member and size will remain
>>>> + * zero on return.
>>>> + *
>>>> + * If size is not zero, then the IOCTL will attempt to copy the requested
>>>> + * property into the data member.
>>>> + *
>>>> + * The IOCTL will return -ENOENT if the VM could not be identified from the
>>>> + * provided VM ID, or -EINVAL if the IOCTL fails for any other reason, such as
>>>> + * providing an invalid size for the given property or if the property data
>>>> + * could not be copied to the memory allocated to the data member.
>>>> + *
>>>> + * The property member can be:
>>>> + *  - %DRM_XE_VM_GET_PROPERTY_FAULTS
>>>> + */
>>>> +struct drm_xe_vm_get_property {
>>>> +   /** @extensions: Pointer to the first extension struct, if any */
>>>> +   __u64 extensions;
>>>> +
>>>> +   /** @vm_id: The ID of the VM to query the properties of */
>>>> +   __u32 vm_id;
>>>> +
>>>> +#define DRM_XE_VM_GET_PROPERTY_FAULTS              0
>>>> +   /** @property: property to get */
>>>> +   __u32 property;
>>>> +
>>>> +   /** @size: Size to allocate for @data */
>>>> +   __u32 size;
>>>> +
>>>> +   /** @pad: MBZ */
>>>> +   __u32 pad;
>>>> +
>>>> +   union {
>>>> +           /** @data: Pointer to user-defined array of flexible size and type */
>>>> +           __u64 data;
>>>> +           /** @value: Return value for scalar queries */
>>>> +           __u64 value;
>>>> +   };
>>>> +
>>>> +   /** @reserved: MBZ */
>>>> +   __u64 reserved[3];
>>>> +};
>>>> +
>>>>    /**
>>>>     * struct drm_xe_exec_queue_create - Input of &DRM_IOCTL_XE_EXEC_QUEUE_CREATE
>>>>     *
>>>
>>>
>>

