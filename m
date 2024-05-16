Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 951598C7D1C
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 21:21:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FBD110E1ED;
	Thu, 16 May 2024 19:21:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NITq28Rr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C359710E1C5;
 Thu, 16 May 2024 19:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715887302; x=1747423302;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=dkeE1euTGJScETRywHlsffZqg2gI0Q2UXqfQ9EzbGzs=;
 b=NITq28Rr42ScKcrQLerN9N31NGDNR5WWLQGtE4ZOvGwErcR+Gq4Dqg/c
 dkD9YeFZ/yRrw24TzfARwro7jQAKlNWrfvOuSZ7zv2NAII6Ye8X9WifGT
 bUjZ/EP7WmrOzOXzsERLrz7+K/5/hmm2gFhrxH6hiaj6icBKJjuNHo74I
 iWtB49AQKGF35wmuXiDRovIeWDhJay1CJzkLnp2ADQfhYTdJ2uJQcf+yj
 T6ydRhnDMzmZBXDzqJtZOn9tjMIuSX9C8+HZKnKj29kXf7/Chrwnwu7aH
 oQHgjYdSzATRcLrTvM7TdWoX/N0glnP6QSM3VmK2ifUjemGuqnwOoDr+K g==;
X-CSE-ConnectionGUID: 7sgih93jRAKiPq1MiGbYoQ==
X-CSE-MsgGUID: 4NfMbDP8TmyG8fMkbWrS0g==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="22706070"
X-IronPort-AV: E=Sophos;i="6.08,165,1712646000"; d="scan'208";a="22706070"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2024 12:21:40 -0700
X-CSE-ConnectionGUID: kwz5AkR3SsKXsZksat/yqQ==
X-CSE-MsgGUID: 3WepB7mFSgWwwi+QMdf/7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,165,1712646000"; d="scan'208";a="36087700"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 May 2024 12:21:40 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 16 May 2024 12:21:39 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 16 May 2024 12:21:39 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 16 May 2024 12:21:39 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 16 May 2024 12:21:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kn2k9b2dbjkARbnWtYxAI/zUtTl+vT4p1zhUGtshYlQS59pxNx60tdG1zEqcktX8YMyf9oEbVbEpaRCsOSMZ+ZvJy7kLjw/2uz56vjw4+0aAPBrhPL7HQxmd9yJhLiU/wzcfrjne3eI18epIfOvpBSB6tyMNPbndMrEqRBMlh7U0T4I/54vCXbWEqU2msN6+stqeUcPcdEMQZ2qgtrBklyzebmB/7AqLpGnss9x193ZmmfQg7KUq3SYAgaqnR1mmg0s9J/oslBLIK9h75zFP/rOxhkm/dYPqA74Yi1YhaSNNouyox4blMdZmZJGMHmmn+9ow9AHTRTUtiegF2vCJjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BUwBmZ0d1IBK5W3xtJCiG+O9DrwXfapQECZNP2PFkkM=;
 b=aKvJ+BaTf8I5vhemArZAHrcSiKWQ48BZwpo71uBY1ZLGVSTekL3zAQuRjoxCzDmgHLFhtb3YMBdEm7bdgn1dnXxB2Vg7F/GEyQa3dCWTTpcdnAFIKTTuz9SDDoA9YlaF2YPPZcnKiaZXbElrWvpBjX4XAVqyd4L4vzKXjpd0Oq+Cbrmo+RAc9akw1AXNls0+VHIBJrgmJCRLgGXl+hUdnQFqqabhJy1tF3SX0lREAY0xd1tPUqJkz0II6pFO2XW/nyjKQjrb1O6LCaoi+kS8r0dZ4eYN7Aw9FDw8lirvA+l3Ng/R9ONUCTUkqEx05neDi6Ak7FWTKm43r4cpuCWHtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DS0PR11MB6446.namprd11.prod.outlook.com (2603:10b6:8:c5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.30; Thu, 16 May
 2024 19:21:36 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::24f2:8bf0:3dbd:dc8c]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::24f2:8bf0:3dbd:dc8c%3]) with mapi id 15.20.7587.025; Thu, 16 May 2024
 19:21:36 +0000
Date: Thu, 16 May 2024 12:21:24 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Tvrtko Ursulin <tursulin@ursulin.net>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v4 8/8] drm/xe/client: Print runtime to fdinfo
Message-ID: <ZkZctPJtDpuNLZXr@orsosgc001>
References: <20240515214258.59209-1-lucas.demarchi@intel.com>
 <20240515214258.59209-9-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240515214258.59209-9-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR01CA0020.prod.exchangelabs.com (2603:10b6:a02:80::33)
 To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DS0PR11MB6446:EE_
X-MS-Office365-Filtering-Correlation-Id: 96dec728-cc74-4a71-edcc-08dc75dd6759
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dGVzS0psMTNDSFQ2emdtL0pXNkptTXd2OVJCVThrbHp5cDJETGkyYTVZUlE5?=
 =?utf-8?B?aVNQeXV0L0pPTkxqQmFTM0JpaURrSHNETFUvaDRxZDJyeE1uSEhBQTB1Mjl5?=
 =?utf-8?B?VjRMMWEwSVdOQVRURlUwNit3QVZ5N1RxZ1E4L0pHY3lGZ0RINUJCdVJVOG9R?=
 =?utf-8?B?UW5BNkltdXMyeUJ6QnRmSXd1S1A4WEZlRkR1UnVJZm5CUzlPZzZ6WGMyUm5q?=
 =?utf-8?B?aEU5UEhXQmRWMWpRQUVIRk03eE1lV05mR242eDRBZDhkb2tSNGtmRWMzYTFK?=
 =?utf-8?B?R2hoV2ZvdzRiRnJ2WW1aanFwc2kvc1RJRFRSY3l3UEFaWjMyN1krekFZZ3RC?=
 =?utf-8?B?ZjdzVncxbGVZMnFpcW1zTFJINWdQSWJrQVYzLzNrL251UTJQZWZ2WkpqTnZG?=
 =?utf-8?B?amZGZkZKOTE2R1pqS2hyaW9qTlBycFRESHdOb1FqTVR2YkZLNjl2bDVsMTBq?=
 =?utf-8?B?R3VnaG1GL0txcDhNSGFNblR4ZHRINXhTeG01cXlMV1JxWG5XeXdubEdzbjJM?=
 =?utf-8?B?QmJENXE2S29ITEt4cDZacmRWMlRLbzZoeElpRExtT1hmcXkySXZqbndHb2w0?=
 =?utf-8?B?NVhwYVlKbmpWekEyVWdkTVBlcXlTdEVoWG1UYXZRRlFZWVBkcFQ1L0FrUS9Z?=
 =?utf-8?B?SG5GOGNmSWpLNGt4MVlVazR1MHdMSW1kNkJ0OVRySWEzQTMydzZiOUNWMllm?=
 =?utf-8?B?TW5JeDFOUHd0Q3ZiSW8xNnpkNVQ1RlVMT1Rha3NMUkYxS2Rnc0VablQvbmFH?=
 =?utf-8?B?Z1VBMVdhSzZjem8vRWFrVTBlNTZvUzdEWXdDRzg3a1R0NnJmaVFqK2pQZUph?=
 =?utf-8?B?dVh6Zll6UHAvTU1SSWd1WmJRc3ZsekZiVndVbmsyMldOQ3pranFtZW9wWXlO?=
 =?utf-8?B?OVVXVkY5VUxxa3k0TE1pbUlyWlRCU1lrZzN1VElsTjRvbVlZbHVzRmhZdUVt?=
 =?utf-8?B?RWIvdFd2K1A5S0x2cGhSUkZaS2t1QTFpYitOb0pTb0JCZVMyQmcyQ2ZzbENN?=
 =?utf-8?B?TTN1M0FZdmdydVFtdnNqT3lNc2t2WndaV2s5UDdSMEovL1N3OTMxQ1ZMdGhL?=
 =?utf-8?B?cWhubnpaeXgzQmc1R1dkTVJSR2dmRVpwaXMrTlFlc3NXeEVXMVVZVHJOb3ly?=
 =?utf-8?B?SlFKWkJ6TTgxZmZaSDR3bjBPSTVBOGZPaHAvZi90b2IxNnAvTHR1NGhYeW0v?=
 =?utf-8?B?eHhybjkxVUVCVmlxMXozUFdxRmlFcmhRcnZuSTVPNlBpTmJiaTdlb1dSMVE5?=
 =?utf-8?B?eVE1Ly9aTVhDaG1xeTMrcWd1dHJSY0NTSWRuVnZXN1BHWU5DWTM4SGlyVWp1?=
 =?utf-8?B?WEpLcE9iL1Z6ampBaU1lSHJ3V3F6eGJyajk4MkVuL2tnTnp1Uyt0UEhkTWor?=
 =?utf-8?B?UVpzYlF6Qy9JOTFaUm03dkRDYjBpU0kvY0o3aloxRkxsRmEreGU4QUZZUUxK?=
 =?utf-8?B?U1VsUWlpeWhLZGhiOEJyclFNWURaMmdDZlBkWFJ2VTdnZFpvKzF3L3lTOXAy?=
 =?utf-8?B?U3F2YUY0dkF3WWZ1aDBUdjBEL09xM1hLbk84cngyelpyUVMwUWJNN0l1UnBX?=
 =?utf-8?B?OHdpT1hWMGZpVHQ0NEhpL0J0em1JcGo5VE9KY3cwV0ZDaWs4clBZUGRTWTR1?=
 =?utf-8?B?eStFdUNxTEE0UGluT28zUXBBNHZkWDkreEFlWGhLN09JYldubFY5MmUvNUtr?=
 =?utf-8?B?eGhxeHdEdi8zN0lmdXRNSnQzcGd6eE1UbEN2WFVIc3E0emxRTjB4UlRRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cURZa0JJb3VpVysrbkUrdzN0dzByZ0VYdDhVM0xOK1YrcWg2Qk1CSjU0Mzlh?=
 =?utf-8?B?TlhvRXg2cHlKRE9mM3luNUZRRE1IYk13YWsyRVd6VVFCek00Z29OQ0YyYng0?=
 =?utf-8?B?QlV0SjZlNEQ3eXVmU285STllU1NRc0dwZkN4bVhyeXJJRUJGN0dadGMreHJr?=
 =?utf-8?B?N0tzMFFaWEpXR3JPTWVLeDFsREVkenNrUXZLRSsyL0tyOEQ5c0hvVmVRd1Z2?=
 =?utf-8?B?MVhJQjRKN3lkL0VaeVl4VUVwZUVIL1dJOFhYQ3loQlNWMWNvZkFOOWhJZjdh?=
 =?utf-8?B?YjdVTzY4WUNNcExrRzlWSi81WTRraVhqZndGSURyZ29NNnlHam1WN2gwdnRu?=
 =?utf-8?B?ek5YVVZEbE1Hd2VKYlZaaFlNdWhDVTVCdjVxMEdxblZ3VmpXeDFYbXRSdG91?=
 =?utf-8?B?SXFXVVluSEpKU2E5eW5ORzk5cEpoc1BqdWFpV3hzWHNndlBQdGdGbXNvcjkv?=
 =?utf-8?B?aU9wOVE3S1I3WjF6b3BEdmxWMFliYml0cU0reUVmWFJLV1U1T21MOEFHUU5Q?=
 =?utf-8?B?Qkh5cmxDL3R3UmRwcTJJekxIcGFlUWxKUTh5Z2JNMFBJRXZYV0xlcHZyWEhm?=
 =?utf-8?B?TlhMOTM3VmVFT1NXTzJzNjUveDh1NVhKcVhmSHRmZUFQTnNBM2toT2pvRXpF?=
 =?utf-8?B?b0Z2MHZZNWxZdzZQaFFGdkpSOUhuVitmcUt2Z0ovTnJObFkvZ3VJZ211WHUz?=
 =?utf-8?B?alFoUHhXTWZYNlNuSTdnUms2WW9tanMrY3hPVTBCYjBQWkpnZkh3ZklCK1Fl?=
 =?utf-8?B?OVdaNkpoZGp0RE4yZjFsNTVDb0lTcERSSFVBTUhyQzRocUZMMUFxZUFCbFZ4?=
 =?utf-8?B?dGdXMW9YRUlUa1lTcGdaMmRFVHk5NmdaSHJiS0tHVXRTU0I0VHZEUDhFNDA4?=
 =?utf-8?B?TzVEVWpPdzQwV3VFRVluWW0yWGc5MWg3QlQrL3B2QnJNRWd6eXB2WnI1d1hY?=
 =?utf-8?B?aFM0dXFjanRSMmlrSkxNUG5wdytheDl4TThZZTZjbzBWeEdNKzl1d2s1NHg1?=
 =?utf-8?B?OGJkR0pZWVZ2aFpqY3pCYkhpRFBjdnhqVFFmS0hLNytWOGlRVjY5US9weHIv?=
 =?utf-8?B?c2tuTVFzNGlySGVGR0lvc0I3em90UCt2czFkei9sUWRxOHpwcStDOXJzalVW?=
 =?utf-8?B?MVJQc3A0V2JQczR4STJUbzBmaTJLK1UrTGNJWnh2Z2x0SlNsMk8xb3JNKzlL?=
 =?utf-8?B?WjJKTytMR1VGSE5PZ3JBbkhnVVJlbzJDSGFkdG5SVjMxa0VRdWtQZlhTcEFI?=
 =?utf-8?B?cnliZkU0VG5IbVcrSmMvSkl0SnRkLzFDR1FDRHFzeFI1ckZndm45V1VHK0FV?=
 =?utf-8?B?cnJBeUlTUXBBVnQ0ZnFTQnhUWG0waDdTaGJwUE5FWnhQMEdySUU1bE9TYWJG?=
 =?utf-8?B?Q05Wc0tSUDhzR2J1bktWek0vOHN2a3FBQ3RscmFYRno0djNnQStBb2krZHRU?=
 =?utf-8?B?eVFLV1kwWURjVE9FZnJIc1h2SXByTFpDVTJERW5vTUhiaGRDWGN4ZW5qWlJ4?=
 =?utf-8?B?VFhaVzZ1TnoybTY3aFBNcTY0ZW92aUVvWTF2blZkVFhhbXZDMVhiWE9KWFVM?=
 =?utf-8?B?eEsvN2ZSdlBISjdrWE9ObXN4dWsyODZqWWd0SnFDOFVRNnFEdlVxUzFpaUlT?=
 =?utf-8?B?SC9IZDVzQm1Ib1JxTEdHdlkyeU82UFpJb1MzODVtRGJXNC9nT1pxcU01bTh0?=
 =?utf-8?B?U050N1ZWZFFmeDFDdzhudWZieFZpVTB2K2R1Q2JjUkVYQVdLMC9TTHVlUGhO?=
 =?utf-8?B?a0M0WlJjRFZXQVkvYUpCQnJ5ZnBNR01qbTNoZzhhTWFPME9jOE9SekJGOE82?=
 =?utf-8?B?cmhsSDVGMFUyN2Jqc2l0K1gxcVpzMVhIZmpvbUZsMUlLbWpKeTNUeDc0bFNN?=
 =?utf-8?B?L2hzLzJGcGxlTU9xOTFnNjdubElUNEl1cjNmZUhDWS8wV2tzNS9rUjJoeUs1?=
 =?utf-8?B?ckcyM1pRdkN5Ymcxa1B1Uk1Nay9FM1BJUUk0ZGlHMC9OdTc1ekIwalI4MWJN?=
 =?utf-8?B?YjRrMG5RVm9DNmxOQjNPWGp6bUpCd2cySnFPTXVyTlIvR05MTmkwWk9kZXB6?=
 =?utf-8?B?Q1BDMzhhYlJmQjNoZXJiK0U2ZVJNZGgrWi90Z2l3VWpCb29CZUU4L2xNMGE1?=
 =?utf-8?B?bTlpenhsUFlsU1lQWGpuaDhTSmt4U200cDZrS3FDS3hHSkdNWG9yLzhlczBy?=
 =?utf-8?Q?tPFI5rYDB9y/aqpoHwrFA8I=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 96dec728-cc74-4a71-edcc-08dc75dd6759
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2024 19:21:36.3736 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bE9g4YUga0vz6P+v3KJbYOZgXOIQx68hKpPB9R6OcfvPETU9BJGTAzGTgUInO3B6O0igHiGC0D0HyzsRmnbZnd5CXc8XtP6xkETnIBCBw+Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6446
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

On Wed, May 15, 2024 at 02:42:58PM -0700, Lucas De Marchi wrote:
>Print the accumulated runtime for client when printing fdinfo.
>Each time a query is done it first does 2 things:
>
>1) loop through all the exec queues for the current client and
>   accumulate the runtime, per engine class. CTX_TIMESTAMP is used for
>   that, being read from the context image.
>
>2) Read a "GPU timestamp" that can be used for considering "how much GPU
>   time has passed" and that has the same unit/refclock as the one
>   recording the runtime. RING_TIMESTAMP is used for that via MMIO.
>
>Since for all current platforms RING_TIMESTAMP follows the same
>refclock, just read it once, using any first engine available.
>
>This is exported to userspace as 2 numbers in fdinfo:
>
>	drm-cycles-<class>: <RUNTIME>
>	drm-total-cycles-<class>: <TIMESTAMP>
>
>Userspace is expected to collect at least 2 samples, which allows to
>know the client engine busyness as per:
>
>		    RUNTIME1 - RUNTIME0
>	busyness = ---------------------
>			  T1 - T0
>
>Since drm-cycles-<class> always starts at 0, it's also possible to know
>if and engine was ever used by a client.
>
>It's expected that userspace will read any 2 samples every few seconds.
>Given the update frequency of the counters involved and that
>CTX_TIMESTAMP is 32-bits, the counter for each exec_queue can wrap
>around (assuming 100% utilization) after ~200s. The wraparound is not
>perceived by userspace since it's just accumulated for all the
>exec_queues in a 64-bit counter) but the measurement will not be
>accurate if the samples are too far apart.
>
>This could be mitigated by adding a workqueue to accumulate the counters
>every so often, but it's additional complexity for something that is
>done already by userspace every few seconds in tools like gputop (from
>igt), htop, nvtop, etc, with none of them really defaulting to 1 sample
>per minute or more.
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

LGTM,

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Thanks,
Umesh
>---
> Documentation/gpu/drm-usage-stats.rst       |  21 +++-
> Documentation/gpu/xe/index.rst              |   1 +
> Documentation/gpu/xe/xe-drm-usage-stats.rst |  10 ++
> drivers/gpu/drm/xe/xe_drm_client.c          | 121 +++++++++++++++++++-
> 4 files changed, 150 insertions(+), 3 deletions(-)
> create mode 100644 Documentation/gpu/xe/xe-drm-usage-stats.rst
>
>diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/drm-usage-stats.rst
>index 6dc299343b48..a80f95ca1b2f 100644
>--- a/Documentation/gpu/drm-usage-stats.rst
>+++ b/Documentation/gpu/drm-usage-stats.rst
>@@ -112,6 +112,19 @@ larger value within a reasonable period. Upon observing a value lower than what
> was previously read, userspace is expected to stay with that larger previous
> value until a monotonic update is seen.
>
>+- drm-total-cycles-<keystr>: <uint>
>+
>+Engine identifier string must be the same as the one specified in the
>+drm-cycles-<keystr> tag and shall contain the total number cycles for the given
>+engine.
>+
>+This is a timestamp in GPU unspecified unit that matches the update rate
>+of drm-cycles-<keystr>. For drivers that implement this interface, the engine
>+utilization can be calculated entirely on the GPU clock domain, without
>+considering the CPU sleep time between 2 samples.
>+
>+A driver may implement either this key or drm-maxfreq-<keystr>, but not both.
>+
> - drm-maxfreq-<keystr>: <uint> [Hz|MHz|KHz]
>
> Engine identifier string must be the same as the one specified in the
>@@ -121,6 +134,9 @@ percentage utilization of the engine, whereas drm-engine-<keystr> only reflects
> time active without considering what frequency the engine is operating as a
> percentage of its maximum frequency.
>
>+A driver may implement either this key or drm-total-cycles-<keystr>, but not
>+both.
>+
> Memory
> ^^^^^^
>
>@@ -168,5 +184,6 @@ be documented above and where possible, aligned with other drivers.
> Driver specific implementations
> -------------------------------
>
>-:ref:`i915-usage-stats`
>-:ref:`panfrost-usage-stats`
>+* :ref:`i915-usage-stats`
>+* :ref:`panfrost-usage-stats`
>+* :ref:`xe-usage-stats`
>diff --git a/Documentation/gpu/xe/index.rst b/Documentation/gpu/xe/index.rst
>index c224ecaee81e..3f07aa3b5432 100644
>--- a/Documentation/gpu/xe/index.rst
>+++ b/Documentation/gpu/xe/index.rst
>@@ -23,3 +23,4 @@ DG2, etc is provided to prototype the driver.
>    xe_firmware
>    xe_tile
>    xe_debugging
>+   xe-drm-usage-stats.rst
>diff --git a/Documentation/gpu/xe/xe-drm-usage-stats.rst b/Documentation/gpu/xe/xe-drm-usage-stats.rst
>new file mode 100644
>index 000000000000..482d503ae68a
>--- /dev/null
>+++ b/Documentation/gpu/xe/xe-drm-usage-stats.rst
>@@ -0,0 +1,10 @@
>+.. SPDX-License-Identifier: GPL-2.0+
>+
>+.. _xe-usage-stats:
>+
>+========================================
>+Xe DRM client usage stats implementation
>+========================================
>+
>+.. kernel-doc:: drivers/gpu/drm/xe/xe_drm_client.c
>+   :doc: DRM Client usage stats
>diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
>index 08f0b7c95901..952b0cc87708 100644
>--- a/drivers/gpu/drm/xe/xe_drm_client.c
>+++ b/drivers/gpu/drm/xe/xe_drm_client.c
>@@ -2,6 +2,7 @@
> /*
>  * Copyright © 2023 Intel Corporation
>  */
>+#include "xe_drm_client.h"
>
> #include <drm/drm_print.h>
> #include <drm/xe_drm.h>
>@@ -12,9 +13,66 @@
> #include "xe_bo.h"
> #include "xe_bo_types.h"
> #include "xe_device_types.h"
>-#include "xe_drm_client.h"
>+#include "xe_exec_queue.h"
>+#include "xe_force_wake.h"
>+#include "xe_gt.h"
>+#include "xe_hw_engine.h"
>+#include "xe_pm.h"
> #include "xe_trace.h"
>
>+/**
>+ * DOC: DRM Client usage stats
>+ *
>+ * The drm/xe driver implements the DRM client usage stats specification as
>+ * documented in :ref:`drm-client-usage-stats`.
>+ *
>+ * Example of the output showing the implemented key value pairs and entirety of
>+ * the currently possible format options:
>+ *
>+ * ::
>+ *
>+ * 	pos:    0
>+ * 	flags:  0100002
>+ * 	mnt_id: 26
>+ * 	ino:    685
>+ * 	drm-driver:     xe
>+ * 	drm-client-id:  3
>+ * 	drm-pdev:       0000:03:00.0
>+ * 	drm-total-system:       0
>+ * 	drm-shared-system:      0
>+ * 	drm-active-system:      0
>+ * 	drm-resident-system:    0
>+ * 	drm-purgeable-system:   0
>+ * 	drm-total-gtt:  192 KiB
>+ * 	drm-shared-gtt: 0
>+ * 	drm-active-gtt: 0
>+ * 	drm-resident-gtt:       192 KiB
>+ * 	drm-total-vram0:        23992 KiB
>+ * 	drm-shared-vram0:       16 MiB
>+ * 	drm-active-vram0:       0
>+ * 	drm-resident-vram0:     23992 KiB
>+ * 	drm-total-stolen:       0
>+ * 	drm-shared-stolen:      0
>+ * 	drm-active-stolen:      0
>+ * 	drm-resident-stolen:    0
>+ * 	drm-cycles-rcs: 28257900
>+ * 	drm-total-cycles-rcs:   7655183225
>+ * 	drm-cycles-bcs: 0
>+ * 	drm-total-cycles-bcs:   7655183225
>+ * 	drm-cycles-vcs: 0
>+ * 	drm-total-cycles-vcs:   7655183225
>+ * 	drm-engine-capacity-vcs:        2
>+ * 	drm-cycles-vecs:        0
>+ * 	drm-total-cycles-vecs:  7655183225
>+ * 	drm-engine-capacity-vecs:       2
>+ * 	drm-cycles-ccs: 0
>+ * 	drm-total-cycles-ccs:   7655183225
>+ * 	drm-engine-capacity-ccs:        4
>+ *
>+ * Possible `drm-cycles-` key names are: `rcs`, `ccs`, `bcs`, `vcs`, `vecs` and
>+ * "other".
>+ */
>+
> /**
>  * xe_drm_client_alloc() - Allocate drm client
>  * @void: No arg
>@@ -179,6 +237,66 @@ static void show_meminfo(struct drm_printer *p, struct drm_file *file)
> 	}
> }
>
>+static void show_runtime(struct drm_printer *p, struct drm_file *file)
>+{
>+	unsigned long class, i, gt_id, capacity[XE_ENGINE_CLASS_MAX] = { };
>+	struct xe_file *xef = file->driver_priv;
>+	struct xe_device *xe = xef->xe;
>+	struct xe_gt *gt;
>+	struct xe_hw_engine *hwe;
>+	struct xe_exec_queue *q;
>+	u64 gpu_timestamp;
>+
>+	xe_pm_runtime_get(xe);
>+
>+	/* Accumulate all the exec queues from this client */
>+	mutex_lock(&xef->exec_queue.lock);
>+	xa_for_each(&xef->exec_queue.xa, i, q)
>+		xe_exec_queue_update_runtime(q);
>+	mutex_unlock(&xef->exec_queue.lock);
>+
>+	/* Get the total GPU cycles */
>+	for_each_gt(gt, xe, gt_id) {
>+		hwe = xe_gt_any_hw_engine(gt);
>+		if (!hwe)
>+			continue;
>+
>+		xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>+		gpu_timestamp = xe_hw_engine_read_timestamp(hwe);
>+		xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>+		break;
>+	}
>+
>+	if (unlikely(!hwe))
>+		return;
>+
>+	for (class = 0; class < XE_ENGINE_CLASS_MAX; class++) {
>+		const char *class_name;
>+
>+		for_each_gt(gt, xe, gt_id)
>+			capacity[class] += gt->user_engines.instances_per_class[class];
>+
>+		/*
>+		 * Engines may be fused off or not exposed to userspace. Don't
>+		 * return anything if this entire class is not available
>+		 */
>+		if (!capacity[class])
>+			continue;
>+
>+		class_name = xe_hw_engine_class_to_str(class);
>+		drm_printf(p, "drm-cycles-%s:\t%llu\n",
>+			   class_name, xef->runtime[class]);
>+		drm_printf(p, "drm-total-cycles-%s:\t%llu\n",
>+			   class_name, gpu_timestamp);
>+
>+		if (capacity[class] > 1)
>+			drm_printf(p, "drm-engine-capacity-%s:\t%lu\n",
>+				   class_name, capacity[class]);
>+	}
>+
>+	xe_pm_runtime_put(xe);
>+}
>+
> /**
>  * xe_drm_client_fdinfo() - Callback for fdinfo interface
>  * @p: The drm_printer ptr
>@@ -192,5 +310,6 @@ static void show_meminfo(struct drm_printer *p, struct drm_file *file)
> void xe_drm_client_fdinfo(struct drm_printer *p, struct drm_file *file)
> {
> 	show_meminfo(p, file);
>+	show_runtime(p, file);
> }
> #endif
>-- 
>2.43.0
>
