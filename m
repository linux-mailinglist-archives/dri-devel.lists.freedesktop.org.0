Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E8FA94CAA
	for <lists+dri-devel@lfdr.de>; Mon, 21 Apr 2025 08:39:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3038810E343;
	Mon, 21 Apr 2025 06:39:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e6eudTXN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7509610E343;
 Mon, 21 Apr 2025 06:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745217595; x=1776753595;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tojx21F10kljGM4L7uDmQAYXZePXEyEfI2N2OIdcojQ=;
 b=e6eudTXNv7caFddEXx6jLDAPK0Bz66i1uYy7sToO/CfL1bNhDDcx8E2m
 f/7OMTA3VU2+f8ssD9S09xO5FbQcqhRj16QQA0Ci4tfNONt47Qc/v2dSG
 9yeFKiUsEK0Rs9WmhB85/uzWYh7qX+A85sylkyJMv8PNJ9cuAgUQnNkCx
 GjPJyf3Ma9YL6u8TO1TMNHMKNHD5b/UFo8zsA2tpXVHl1yLunf4FCdkdj
 jaoRMv8yJQaRFqB+yIPRDVeqnevY3EpCpJCtyNOIdCErsjnlCT+nlnCrm
 AUEJciZy0jL+g9i1ZprPNAzcAtxu1rTU0ZmsHniyTaWIknqPFwDvEAZP1 g==;
X-CSE-ConnectionGUID: vZCZDvpiQSORtU5usPRr7g==
X-CSE-MsgGUID: UcHi7+PsQZmholv9yPuEow==
X-IronPort-AV: E=McAfee;i="6700,10204,11409"; a="46630077"
X-IronPort-AV: E=Sophos;i="6.15,227,1739865600"; d="scan'208";a="46630077"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2025 23:39:54 -0700
X-CSE-ConnectionGUID: n2Rtl/LwSaWkgpGkJ9Afiw==
X-CSE-MsgGUID: JUXkrHTaRyWercxg8vVpyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,227,1739865600"; d="scan'208";a="136448782"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2025 23:39:54 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 20 Apr 2025 23:39:53 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sun, 20 Apr 2025 23:39:53 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 20 Apr 2025 23:39:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QYFY8CWX/j+4IHgH2L/chpMpIhbhOOI3XgQzjN3W7UhfMSbgeY2dvXmKZ5vFZCM1K+Cs3syxrbislgHrGcFmza+nRgIP63X1DcPNdzfUMQd6GF/tDQXgsas8UDV7UG3MxNbf+mCppkkvzMs2cFlhRFyWzxUnBzSDOZIivZ/VpKd34nIpsrLffdzDykrNLTuPhwIwzjLUgNRd4JXcHjdaP3nkn5EipFfkOoQn2kqmbA6mJESMMZb1XG/ROYWiK929OJb0r97Hh2wmfkqx8uyxs4HUJHvTRTXsxGcyQn7ixU0NBdYslBLok+K2PUuX8RRs3fvggDnIg5B/yTEs7b3Z5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=62NiMc3dn+xgnPT9ixT7+i93OjXDdFT/tmX+IPmnWcc=;
 b=KPljEPNnjxKyYNKMJFvQBiJ+KGyGPY4KzkoWqbTwYwH59zKpAwzo79Oub/Iw5V7ZIK5SVgHZcNJpQwahUBEpQEk0SKPJIywMTsQCMoLfyj2c9xQsY/qcsCXRyJJvQvSnxjspAS7FiJumJyF3pEkZrU6E0DcygjMq7clFepoLYdesee2754G3WyjEK3uoaGdQVUGY+A3ylFRJi6U/lKy/ItQm0oGgA0rzYUT0V5QRTcIO0GXPKz5izAAIdilWY779wmfA8jkFIXRQAJHVQNPbVxLEifnjc0jtoJu9NdN+HKqSPAG3hWtF4jCgcTzaIQF3Mv5uEN21F/bjHhL18oXghA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by MW4PR11MB8265.namprd11.prod.outlook.com (2603:10b6:303:1e1::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.31; Mon, 21 Apr
 2025 06:39:24 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%5]) with mapi id 15.20.8655.033; Mon, 21 Apr 2025
 06:39:22 +0000
Message-ID: <85da7210-3d79-427d-8199-e852cd6a16a4@intel.com>
Date: Mon, 21 Apr 2025 12:09:15 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] drm/xe: Strict migration policy for atomic SVM
 faults
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
References: <20250417041340.479973-1-matthew.brost@intel.com>
 <20250417041340.479973-3-matthew.brost@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250417041340.479973-3-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0106.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::16) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|MW4PR11MB8265:EE_
X-MS-Office365-Filtering-Correlation-Id: 34463f7a-7402-4f8b-cab9-08dd809f4054
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N1JmZklGM3V6Y3hqNk1HNDdDTVdqcjhrZXZzUTVPSjd1VDN6K1llb0RTeGxZ?=
 =?utf-8?B?L1J6cUxJd1dIMXZhekE0OURPTVJTbDBnY3pjdnVVdys4MDNuNFNvcU5BUDlZ?=
 =?utf-8?B?TVhLaHJIY0hOTGZCUGp4a05SVXpPd25IVENxUkNyTTUvTjh4Q2x1Ky9BcWF6?=
 =?utf-8?B?TzRqR0kzTFQ4QWc0cW1iaDFDZU1DQmJIUDdQK3p3YjFIUmcyUWZMdUlTaDkw?=
 =?utf-8?B?dzk2UTR4ZHBBdHJFZkhuR2hYc0dTcXlEdXM5MWJnT3hGVm0zaTF2V3MwOWN1?=
 =?utf-8?B?OWcwRS9wZlRLZGY3dHZJV0lTRkhaM2JZYllsVkRyVVFhWjJnTTdMeUtIV3Q4?=
 =?utf-8?B?Y1NlVkMvZXRUb0thSkVDZXRDOVhTbnNIcXZJMTNTL2YxMy8rNHhENGtnSlJP?=
 =?utf-8?B?UTNtVmFYUnBrNjhBYlZGSVdCQXNMNGJkNnR2WUN3QWxmWHhHMmJUZUZNTFlP?=
 =?utf-8?B?Si9rUGRyME1pNC8zMjh5Z3BSNm5hWEtZeEZveWxNZHVudStucDlkYmNTa1p2?=
 =?utf-8?B?c1dKV21YYklGQ2R2eEZTOW5oVTJ5RS94Znd0ejg1bmF2WUxPdzl1bVNkT1dk?=
 =?utf-8?B?NWhLdDc5TlpjM00yWXl5MnVCcFlWblFDeXFJU1pOUGJWL1k1MS9ZMTg1TDVO?=
 =?utf-8?B?MXZYdnZZQlVaU2FHNk1janBxSmU2UUhnZTlQUnlnbUFSYTlsVWNNajBmb3J1?=
 =?utf-8?B?SmFxY1NYNDlMcUVxV3k0ZXRydzMxSnZJTTNhVmFUK3FrNXk0M1QveXExRjJ0?=
 =?utf-8?B?RG1DUDB0Z2xUTmpSQ056MHUyZlJzSkhqRW14aDVsSDEvL3Z5Z1VNa1NHOVo1?=
 =?utf-8?B?bkdWTlhMT3hPNnFsUElWbVl0cUxiOUg2dy9Lb3pOVXNudGN6MUpHLzRNL00r?=
 =?utf-8?B?blpPQWEya0NONCtJSVcxZ3NuQXBtbjRHNDQzTTJua2RMNlBrdjIwbEhlbnZN?=
 =?utf-8?B?Tk8xSzdBNGxCU3BXQ2ZScCs3a3lQRnJ4WFVQejYvNmZxL3dRMUxsT1dHMVNs?=
 =?utf-8?B?ejNNejM2VDhMYmpDQml4cm5mSkxlRGg2V2NRaW9MY2ZmdDY3MXVVM1B5Z2NF?=
 =?utf-8?B?Zm54NXkxSjcwY3JGTGRCYzhiY3EwS2VjTkZzQ3VUNGRMaGN3bmErSDF5ODN2?=
 =?utf-8?B?SlBMZ2F4Qm5lNHEvemg1V1VHa0dPTFE3cm1UQ01wT1EyMnpLL0NBbkNjMWlu?=
 =?utf-8?B?a3FkSnYwYzhFWHV5Zmo0cG1jTzJvSXZqUXlna3Q3ZGNGRUpUb1dkcHRYaDBB?=
 =?utf-8?B?ZzE1VThSamJMelJLalo1ek9ndTI4bk1qano0L0d4ZXg2SGY2aTArRHM5b0tS?=
 =?utf-8?B?Z0N6c3dJOVYza0lzWHBBTEJ5Z2MzVysxYXVCQmJWdzhQNVZMdS9KV0trV2xo?=
 =?utf-8?B?SlhmRmdkd0JCQzJmNHJpTytMeGU3YXk3dzhIaUxZeWNRSHduSU9oaEl0akU1?=
 =?utf-8?B?eXpLa2JKMTZSVHhVU1FuMjFYVXBYYXBrdTdwRVkvMWdnUzRuNDZVd1BadlJ1?=
 =?utf-8?B?OFhGNUw0YWtPREdpUFArSVlUVUNJczh3QlU3SUk2dUMvZGViTnpPN1p6V0Mx?=
 =?utf-8?B?SW1OVnJ6WmVqaFVTM0JTdHZlK2VERUhNMit3bUtnanh5bkFzekJqS0F2elJH?=
 =?utf-8?B?Ym9MKzZBM2FKUEliek45cENHNXVWRWVtWUxzTEJHTHFVQWNlSDFjakFBU2lP?=
 =?utf-8?B?dCtzUWI2dmhSWDFzdm5xeEJld2lRYXdwZVUwL1hvN2FOc0cyYlU2a1plVHlW?=
 =?utf-8?B?aENVRUdnVjVWQTVtenJ5ekxzYmtxeWpuOE13RFh6THJBNzAvNkRSOU9mS21U?=
 =?utf-8?B?QmN3U1BWRVQ3U3l3ZTNQZ2VLKzcwMER5RmxoQ0VnQlF5RWZuejV3YnNNNDJY?=
 =?utf-8?B?L210UzVlRVBIVXBNYjMyVllrSGxsUkJ4d3h4UmpNaS83bHBoZHVjSEdCNHc1?=
 =?utf-8?Q?dHSB5bBaC20=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VUpSUVFWM2U2K3VVY1JaSW1VdGRRZlVMQ2N3ZlFzc2ZGN2ZReDBXTzI5N1gy?=
 =?utf-8?B?MEVabjZSdDFrMEpwMkF6Zk0vVXdvZmRrVGl6YVhYUzdYRFVTcXVWbkc1U0pr?=
 =?utf-8?B?aHltNnZjeDRvV3ZkbVBoeUxTV3B6cmlYckhKWGpnYXdBQjV1aW91bE1laEJM?=
 =?utf-8?B?UUtWV0lGUCtvK1BKbVNWdGE1R1F6YndOOXozTlBsc1VxNEI4OThYNXhaTExx?=
 =?utf-8?B?UGl6cURQS2F5TjIvek1qeUQ2cXRwdW1aTzRwdTFrQkRvQm84QStwWjFPWEZp?=
 =?utf-8?B?YmJzLzg3V3RmanNVUTFtbW00a0k5ZkpubHdEM2NBejRSZEwwMEcvZXZpMDVl?=
 =?utf-8?B?OUUzS3RWYXo3SkpwQlUzc0tyblRoNDZOUXhyZ1pWc2tqWE9rVGdaeUR5RDQ5?=
 =?utf-8?B?UUlpWFBjMHRURUc1QUdRRzcyR0l2OEVma1hneVBpUWI0MnRJR1VWUEt4RlNw?=
 =?utf-8?B?MHFRanBmOFB2SC9uRHJSU2txaWhWVERTRm9odnVRWXZqdkVqV0NTc3JzTHZH?=
 =?utf-8?B?TzRDekZqbkZxcTBNT0NFVUx3OVdoMXBqQ1VHSEFSR1NESlQ1MVVHTEhkS0JU?=
 =?utf-8?B?MlJnTFd1ZTNyRjF2djlveHIzNlhXZHZHZmh0Wis0OCsxNG5JVVBtTk52THY0?=
 =?utf-8?B?OFFDM25tWjU1blJ5ODhHOEQzQ3BEdlo4Z01TcElhcTVQTDRmeTNwalVZQXBk?=
 =?utf-8?B?bHJRYnpDVmdQK1FRZ2crb1kxUzBtWmRlZnpRd3Zlb2tpM01KQlM3Wmd4Unlh?=
 =?utf-8?B?bFVqenM1MWpzLy9pcDBnZ244eDRWVStOaUxFdnBrYzRzMWtKUnRxWksrcVNY?=
 =?utf-8?B?Ri9PTkNSamczYkU5WG5DdzQ2VkpORU9sYjNxdEtHcytuMU5SSW9lblE3bHU2?=
 =?utf-8?B?alF6VXhlNkxEL2ZRdGZCZGhvem1uT1lUaW52T3dLSlNnQTcyOElwNmJuK3R5?=
 =?utf-8?B?TVdseEs0NjMrN2g5SFQyMnF6a3RsVmVqWWN1c3J4N3d4MVBBOHVFbkw4NWNG?=
 =?utf-8?B?RW1DRFhOdC9WUkMrODkvVFd4d08wcitkVWNJNE9qNEtUdUVzTWN5M3hmaXZC?=
 =?utf-8?B?d0dwcmwrRUtRLzJETkp1VS9XWGdQVDdDem52VlJzS240eGkyelErR041OU1L?=
 =?utf-8?B?bE9NTlZoeklHMmVtalRNcTNGUnE2ZmNqQ0VsaThOaFVIejVqK1AzdllMenhq?=
 =?utf-8?B?WjdpS3pzaFY2OUJ2Z2VEaW4rWklHRWZRTlN1Y25neUh0MzY1WkE5U1E3SDk2?=
 =?utf-8?B?d1l0K3VadHJzTmplS2NJYjNGamNoVFJpOG5vUkRldEFJRFhNQ1ZrQkNOeFBN?=
 =?utf-8?B?NUxJQmtOdHRkMTAwYWEvTzFHTnRSWTlYeXR0SHk5WWlXd0V0Q2Q1NXJ4T3Z6?=
 =?utf-8?B?R3E0aGFyZVFSc2FhWUtmdzlERlRucTVOa1QzU3ZKVmhseC94TWRoa2NxMEFu?=
 =?utf-8?B?d0V4ZDNjODIwOW9hcU40WHR0aURyVUtVY3JNTDR6SUdkaXFJcDlDMjlMY0Zz?=
 =?utf-8?B?cVIzUFArNXdNbEtwcU1VT3VMSEg2MXZsSUp0bFJGTUxCeTJ2aVFYbi95STZZ?=
 =?utf-8?B?UzJCdmlGTmFGYlhXR2s4ZXY5TGNDSGNLRWV1bjB3ZU1wMXRWclk1aWJNTHFH?=
 =?utf-8?B?NGNtMVpCUzNOSHRBbzFjdGFScXJGR1U1TkZ1ekFqMXRpUFNtTTVsSHlCZWND?=
 =?utf-8?B?RStiRk9xdGdKcWZoTEliL2NjZSt5M253U2hqZkM3UlV2MCtMc3FNT0krVjR4?=
 =?utf-8?B?VFQvTWFGbmtZZ1hrUnF6VTAvcElHSEc3Rnc1NmRUeFhyeGprV2xLcUN6bE9s?=
 =?utf-8?B?MkJvOTh4MU1McVg1azNWQkVtTjdKOXZtS05DT1p5WW1od0lyRERoZlZUMC9T?=
 =?utf-8?B?WmZlR09NZ2gxVG5aWnI4dmJBcnNrQUNsNHBzVlozWmtaRlltVjZ2WFQxNHZD?=
 =?utf-8?B?cUdkWGtaaTI0eEtOcGZ1ME1SbGY3SXJDMWlISkVwNVFLZDkzWE1DQnpRM1l0?=
 =?utf-8?B?b2xZZGdQVW5vOTVpeGRJdjkrUDJZYUdIcUdhR0h4SitmOFBKY0F0dm5qMzZp?=
 =?utf-8?B?T0lhLzNNSkdWbGt4TitKRElOb3NVRWc0dCs1SXg1Z0o3WGJzSkptUzFKSHpt?=
 =?utf-8?B?TEMrNzU0a1QyOUl0MU5wa2JDbGdIOTJFZUVNL2V6dUkvNFFhbU5KK0FxVEoy?=
 =?utf-8?Q?7lX+5tXDVISoYxKJhYMnecg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 34463f7a-7402-4f8b-cab9-08dd809f4054
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 06:39:22.7023 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /ZJrtx1jrg9snaoJvGhwE55zK4Q5sNI6qg0a9y2hdQ6F267EXavPE8EhS8TmyUJElgdH7JAapC8ebHfTkOOS9xjHH9nFvTe4eMHcqp5Q54k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB8265
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



On 17-04-2025 09:43, Matthew Brost wrote:
> Mixing GPU and CPU atomics does not work unless a strict migration
> policy of GPU atomics must be device memory. Enforce a policy of must be
> in VRAM with a retry loop of 2 attempts, if retry loop fails abort
> fault.
> 
> v2:
>   - Only retry migration on atomics
>   - Drop alway migrate modparam
> 
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_module.c |  3 --
>   drivers/gpu/drm/xe/xe_module.h |  1 -
>   drivers/gpu/drm/xe/xe_svm.c    | 57 ++++++++++++++++++++++++++--------
>   drivers/gpu/drm/xe/xe_svm.h    |  5 ---
>   4 files changed, 44 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> index 05c7d0ae6d83..1c4dfafbcd0b 100644
> --- a/drivers/gpu/drm/xe/xe_module.c
> +++ b/drivers/gpu/drm/xe/xe_module.c
> @@ -33,9 +33,6 @@ struct xe_modparam xe_modparam = {
>   module_param_named(svm_notifier_size, xe_modparam.svm_notifier_size, uint, 0600);
>   MODULE_PARM_DESC(svm_notifier_size, "Set the svm notifier size(in MiB), must be power of 2");
>   
> -module_param_named(always_migrate_to_vram, xe_modparam.always_migrate_to_vram, bool, 0444);
> -MODULE_PARM_DESC(always_migrate_to_vram, "Always migrate to VRAM on GPU fault");
> -
>   module_param_named_unsafe(force_execlist, xe_modparam.force_execlist, bool, 0444);
>   MODULE_PARM_DESC(force_execlist, "Force Execlist submission");
>   
> diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
> index 84339e509c80..5a3bfea8b7b4 100644
> --- a/drivers/gpu/drm/xe/xe_module.h
> +++ b/drivers/gpu/drm/xe/xe_module.h
> @@ -12,7 +12,6 @@
>   struct xe_modparam {
>   	bool force_execlist;
>   	bool probe_display;
> -	bool always_migrate_to_vram;
>   	u32 force_vram_bar_size;
>   	int guc_log_level;
>   	char *guc_firmware_path;
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 56b18a293bbc..1cc41ce7b684 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -726,6 +726,35 @@ static int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
>   }
>   #endif
>   
> +static bool supports_4K_migration(struct xe_device *xe)
> +{
> +	if (xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K)
> +		return false;
> +
> +	return true;
> +}
> +
> +static bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range,
> +					       struct xe_vma *vma)
> +{
> +	struct xe_vm *vm = range_to_vm(&range->base);
> +	u64 range_size = xe_svm_range_size(range);
> +
> +	if (!range->base.flags.migrate_devmem)
> +		return false;
> +
> +	if (xe_svm_range_in_vram(range)) {
> +		drm_dbg(&vm->xe->drm, "Range is already in VRAM\n");
> +		return false;
> +	}
> +
> +	if (range_size <= SZ_64K && !supports_4K_migration(vm->xe)) {
> +		drm_dbg(&vm->xe->drm, "Platform doesn't support SZ_4K range migration\n");
> +		return false;
> +	}
> +
> +	return true;
> +}
>   
>   /**
>    * xe_svm_handle_pagefault() - SVM handle page fault
> @@ -750,12 +779,14 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>   			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
>   		.check_pages_threshold = IS_DGFX(vm->xe) &&
>   			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR) ? SZ_64K : 0,
> +		.vram_only = atomic,

atomic && is_dgfx.
  >   	};
>   	struct xe_svm_range *range;
>   	struct drm_gpusvm_range *r;
>   	struct drm_exec exec;
>   	struct dma_fence *fence;
>   	struct xe_tile *tile = gt_to_tile(gt);
> +	int migrate_try_count = atomic ? 3 : 1;
>   	ktime_t end = 0;
>   	int err;
>   
> @@ -782,18 +813,21 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>   
>   	range_debug(range, "PAGE FAULT");
>   
> -	/* XXX: Add migration policy, for now migrate range once */
> -	if (!range->skip_migrate && range->base.flags.migrate_devmem &&
> -	    xe_svm_range_size(range) >= SZ_64K) {
> -		range->skip_migrate = true;
> -
> +	if (--migrate_try_count >= 0 &&
> +	    xe_svm_range_needs_migrate_to_vram(range, vma)) {
>   		err = xe_svm_alloc_vram(vm, tile, range, &ctx);
>   		if (err) {
> -			drm_dbg(&vm->xe->drm,
> -				"VRAM allocation failed, falling back to "
> -				"retrying fault, asid=%u, errno=%pe\n",
> -				vm->usm.asid, ERR_PTR(err));
> -			goto retry;
> +			if (migrate_try_count || !ctx.vram_only) {
> +				drm_dbg(&vm->xe->drm,
> +					"VRAM allocation failed, falling back to retrying fault, asid=%u, errno=%pe\n",
> +					vm->usm.asid, ERR_PTR(err));
> +				goto retry;
> +			} else {
> +				drm_err(&vm->xe->drm,
> +					"VRAM allocation failed, retry count exceeded, asid=%u, errno=%pe\n",
> +					vm->usm.asid, ERR_PTR(err));
> +				return err;
> +			}
>   		}
>   	}
>   
> @@ -843,9 +877,6 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>   	}
>   	drm_exec_fini(&exec);
>   
> -	if (xe_modparam.always_migrate_to_vram)
> -		range->skip_migrate = false;
> -
>   	dma_fence_wait(fence, false);
>   	dma_fence_put(fence);
>   
> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> index 3d441eb1f7ea..0e1f376a7471 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -39,11 +39,6 @@ struct xe_svm_range {
>   	 * range. Protected by GPU SVM notifier lock.
>   	 */
>   	u8 tile_invalidated;
> -	/**
> -	 * @skip_migrate: Skip migration to VRAM, protected by GPU fault handler
> -	 * locking.
> -	 */
> -	u8 skip_migrate	:1;
>   };
>   
>   /**

