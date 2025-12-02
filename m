Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97DAFC9A9B0
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 09:05:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DDAB10E061;
	Tue,  2 Dec 2025 08:05:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JGoX+WqP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBD1110E061;
 Tue,  2 Dec 2025 08:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764662702; x=1796198702;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=OrbA1FFpVzzWSrZePr1RisAsu3JU23R33T5sc44qL0w=;
 b=JGoX+WqPF9bn3JyhdWKjIGLkgWN5CS3lwVHs+jqabeP9WO4kl44hWXKv
 XZu9rIKcLpMT4GWp8Q/6QZHXpzOsUGeQkr2LzzFQwys5vVKVoRY4/ueuY
 nB8SJlrI5AojZN/o813VAEdLG/qbddOG/ApCS5raVW54z4jIyT01ywusq
 1zYnwAMcUX1FEIt6ikEGsXUg3E4eSb8TobV0+50Sfo+9pW4LwzuNe9fU5
 j2dB3sDh7sDdAxj8a9C+10hjBVGpvV1SShvhMrBUXcTSZZvb3igrA1SYi
 oZGJlQZo48FzZw4HHxrBTaWBecM71HGD7JrHMQg0G7rkbITeLWymCyjTZ w==;
X-CSE-ConnectionGUID: ao6z8SwEQ7S94be+ZPRbiQ==
X-CSE-MsgGUID: G+V/sv2RSjucqBvuYUxL5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66787712"
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; d="scan'208";a="66787712"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 00:05:01 -0800
X-CSE-ConnectionGUID: onPLdpqmStWLhK/r+ltImA==
X-CSE-MsgGUID: WR8t1F5BQ726ooHAdfGEyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; d="scan'208";a="217646573"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 00:05:01 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 00:05:00 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 00:05:00 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.23) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 00:05:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xt1Y/a9PmSzkn4oOLNfSULv/lv45SZ9PFCGhTxGGsbu28tIVicEqBVdv/0QrD0S11m+B4G/V8TwMDM8LLozd4ovljxnPmk9ntkSWLFn7oJ4xoRiOjA0muezPCNRgwAcI0gttGIoRH6icfmWSsxeQSQX03Ydznh0I9kwEfFOH7Igt4gGBbGmI4Rm/EU9/2FlVgRQKN+QT/IOYCgYqf/4PWpLjydTQsSphAqSLGagMzm542McjBPqsQKTxDXYZX+cxeG2Mt+6gbPxWskS6j5Rp126nePdjxky6d1pDYcVAKYpg0IzCEcoQv3KelusDlZrnIdAvGaTIEsgIgZZ4omdU9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YvgVRynjcpYApcahVGPt2yrYgbbqSCxAEB1sOhkU9+o=;
 b=DppEDlygxnJkwC4VfGkVXdKwsoun30HyuIKnyqARfcgUhm+sUvskHtJHl4NEVcJotSpiFNm8Ovs/WXYuUCIT2ToqmNwkPMP6lBNNFsCIAspim4pOyG8OxyiYW+sh87J5y80a/Noq7ZPUd/HLezaKwZW5q3q1tsrRUaGEVGH3N3EDOeY8JippAgSD7NnaiQSDAGnkNd0+08E29kerjNMei+SB/++nU8rMIOO+Dufx/NlSGu5VWaXQhPrXQy7nDuCFK5u8DDBZOYpFO0lSqQz5qrjbTWJe020wvOmmjZ7QGz9t5QzWr4tsJVQ/JOdX2ZSaPBGRR5mePCBhym1+zhK27A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by CY8PR11MB7315.namprd11.prod.outlook.com (2603:10b6:930:9e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 08:04:58 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%5]) with mapi id 15.20.9388.003; Tue, 2 Dec 2025
 08:04:58 +0000
Message-ID: <d1270854-6085-4d28-96ed-1eb3d107e393@intel.com>
Date: Tue, 2 Dec 2025 13:34:46 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [v7, 01/15] drm/i915/display: Add identifiers for driver specific
 blocks
To: "Murthy, Arun R" <arun.r.murthy@intel.com>, Uma Shankar
 <uma.shankar@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <ville.syrjala@linux.intel.com>, <pekka.paalanen@collabora.com>,
 <contact@emersion.fr>, <harry.wentland@amd.com>, <mwen@igalia.com>,
 <jadahl@redhat.com>, <sebastian.wick@redhat.com>, <swati2.sharma@intel.com>,
 <alex.hung@amd.com>, <jani.nikula@intel.com>, <suraj.kandpal@intel.com>
References: <20251201064655.3579280-2-uma.shankar@intel.com>
 <045b308b-c5ab-4ad2-b25e-3fbda2b14590@intel.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <045b308b-c5ab-4ad2-b25e-3fbda2b14590@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0027.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:17a::17) To DM4PR11MB6141.namprd11.prod.outlook.com
 (2603:10b6:8:b3::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|CY8PR11MB7315:EE_
X-MS-Office365-Filtering-Correlation-Id: 23949e6d-ffb6-4f33-4da9-08de31797bb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bWlwZG0wYWpEd2hOd2hrRmlTOGo5MVpGUVZFV1I5NkZ0L1FtcGlyenVnWnZG?=
 =?utf-8?B?cnU1UGVaaHhZaC91aGhxbmh1a0taa1cydHJJbHhwZFdjWFlvSFR1VFJ0WitW?=
 =?utf-8?B?SmdWa3NhWE5BM24yQ1RkSWJGMGVFdGNlZTNxM0ZsM3R3SS84SjJuK3QrY2RI?=
 =?utf-8?B?N0k1WmVWTTMrZFpPWWxmN1lXREhKemtCTldSTkZXU2hvS096OERidkVjcmps?=
 =?utf-8?B?aGpyaEtkYjNScDRGY2FkNDNlNkF0cXA1aTlvb0pkQ2hvS2dFVm1NaU1mWHh6?=
 =?utf-8?B?ak1HcEhSZWM2TERPZnBHSVZJODNwRnNwQ3BJcWs2UFI0M2g4TllMM0VkUzFJ?=
 =?utf-8?B?QmN4OE1hNVJQeVdOelgvM3dOMVlYMkFJSldUcW8wRVkrZTN6SlUrWDAxM05R?=
 =?utf-8?B?aEQzQXIwQlY5eVBjcmVuQVN6VnFpMkpBanFUMDRLQVg1TGdRQ3V2NTF2dGNp?=
 =?utf-8?B?VnBCaEQ5RW9saktLNFBoV0V6WkpIRW9lcUdDdEJkSThtcThKWm91djVCSFgz?=
 =?utf-8?B?a2VqSGt0Y2pFVWgwdHVQYXByajhCL3NlcENnM0RmYjgzTlBKbnIzRmxsTDBL?=
 =?utf-8?B?YkdyYmU4UU9qRGdPNjZpdWJvZjhkK2tGVU9EVG1HaUFPd09iN1pSYkxiLzVQ?=
 =?utf-8?B?YjVtUFZEajZ0M0lGU0xJd3Z2UnEvMk9hSDJvOVFySkNyTnduMXJuR1dCWTBu?=
 =?utf-8?B?Q1B2R3ZLM2E3bVJJdGZkbVlFUHdsTFowN2VBZWlyVUFCeGhvbjZOZng3Mmwy?=
 =?utf-8?B?N3ZGVHB2OGxLelIxMTJFY0xMUnZXRzJrdWRhemhWL1JFaWVKZWtKczVlQVN3?=
 =?utf-8?B?Zmp4QUFwOFd1MlhNcEV3ZWFNdVRJM1JrdVJmSERTa0lySE1uU0xKZUFyN0FC?=
 =?utf-8?B?SkdWUnMvMFhqd0huU05mSUJ1d3NwZWRKSmdQcEwxaG9ZY0M2T0VSS2V2NTA1?=
 =?utf-8?B?c0E0WWVlUVNWaDBUeS8ybzRydFcxdVg4c3VuUThYV2VySGU1MW9yU3padDlY?=
 =?utf-8?B?cTBVamVERkYrWVJXWmk2UFFLTG50S1RTTk0wM052S09WU0QwSFhBUk1UVnh0?=
 =?utf-8?B?bzVSU2dyQW9xS2VIMVdMNEt4L3Y3SWswV3h0Ui9XdTVJbE9JWEZDS3FtRUFQ?=
 =?utf-8?B?VURjZUltZGhuMGtjRmhpTmRibHcxUkh5REwwTzRzeXE1OHhrYVM3ME1nclZs?=
 =?utf-8?B?R04rbmdSTEZZdG1ZcGlUZ2xQK200TzB2eWlzWVdiL1NBZ2hXNk1ROVRjUnJI?=
 =?utf-8?B?MEkwc2Z4VW1MeEloT2xSUnpJWjhPYURUZTUzU3ZmOUtwVVZmanlpTFpmckZr?=
 =?utf-8?B?a2paQjBPdWIxSkVYQ3ZKeHdhYUE1U0pkcHVId2plK2w0ZmtlOHZJVDF1ZTFH?=
 =?utf-8?B?SWZRcktHMGtmTzNXQ0ZIQ2hnVW1qOVJuaERwcGRIQlE1dmIxV1JpelcrRUU4?=
 =?utf-8?B?OE5zMnBMSThUVDdUV1k0cU9odlhmMDhIejkwOHg4UDVkQ3BUQThKMDlTYXNG?=
 =?utf-8?B?eDd1Z3RZWmsrTDZFZ01Mb1pZZFdJQVRCblNJOHVJczZUYlFRT2cwMlVsd0dQ?=
 =?utf-8?B?eEFXN2lRWjFqelZNQlpkcVViYmtVK1ZieXNFVGNwUnI0SGhCQWxsay9rV2Zy?=
 =?utf-8?B?b3hlREdIUWNIR3N1Vmx6eXFpQjJHSEIwVS8vNzBEaVlZTlp0dnM5bThLaTZx?=
 =?utf-8?B?SWpHQzQvQzBDMVFaZlg2VTRjNkJacFBHditSYlBiTEh1c1B5REp0V3g3NEt0?=
 =?utf-8?B?Um1UbndsRjV0WjRTeVBmdGR1SjdHVktaRTJmeEdoS05Wc041VUd5ZmFzNFov?=
 =?utf-8?B?aWhBYXgxNTlNOGhEdkV4RVlPVWNCdEg4WWpDVXpieTJqWEpBT2ZyUUdqckpa?=
 =?utf-8?B?L3UwNktraE1wSk1uL05jVEZITFVaMTd1K1gwOHNkaHZTSG50dEhzVVFwNE9a?=
 =?utf-8?Q?OG0+wZdBJw4Drlj1dsmH3igv1rbK/0+C?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SmdHRVh3Y05ZQmt0MWppSzRCb3cxS3RIczNKaTV3N09FdEZKb1J2TUNqT2py?=
 =?utf-8?B?ekhLUE9MM0c2YjNTTjhmN2M5ZGRnd005UzlGY0JMRnFvaXJUM0UyYnlMbzZ2?=
 =?utf-8?B?ME82TjVEU0hvZk54WFRCc0Y4WlIzOTI3V3JkOVhaU3lDYmFCTWNpV3JYMlNH?=
 =?utf-8?B?ckt3d1dUVEplTkVVa2QyZTcwQ0dzcXVZNUJuMlY4U1A4ZTNjSXVya1VheHBm?=
 =?utf-8?B?eGVZZ2lMd1Y5RWV6OEFMTVI4dnJQV3ErbXlwS3JlemlMcENTQU5Bc05FcWNI?=
 =?utf-8?B?MDFDMlhDaTZJTkJqOUNpN1RncDZOTVNXd0xMVjY4Y3VBVkZ4Nzc5UkdtdytX?=
 =?utf-8?B?akZxcFBONk1TT055ditGYVpmUkoxYk45KzNuY244aGN1OVZpRVAxWHFPSzdM?=
 =?utf-8?B?U2EvMFZVNW1NdWdrZHdDN04xRHBSRFBOL0tPTU5PZkR4blU4NjV0aStJdTNn?=
 =?utf-8?B?MDZLMk1EdWIwUHZMdk12UCthVExIMGh1eEpiWndycXhQR2FuMzNadEYzaDhT?=
 =?utf-8?B?TXlTL3RBNDRkMHlCYnZzZzFMY2tRQ0wvTFZlMXZVZUZ1aEFtZ3BYZ29GL0xR?=
 =?utf-8?B?alpkcDFlOVk1UWJ3dEhqQ0ZyU24zbHNyL2hPWHlBejVmQnNyTW03RU9IbG5r?=
 =?utf-8?B?MWl2dHE2NFRKTkpLUlVrakMzeWdKbHJzaG1pNzVreVg3MzQxcW9YWmd1bFpj?=
 =?utf-8?B?NXJnRVp2L2R1NVU4czFSTHVJRGJRN1cxT3ZWMmt2RVBRZDhrVmdNbE1lamxq?=
 =?utf-8?B?VElzZ2xFTmRMa0JZUU9WSElyMmxta2x0MFpvL2dBM3pKanFqWldISEpwMTUz?=
 =?utf-8?B?Nk9QYnJ4L0Zhby8zWDRRN2VtQnlzRmprK240S2QyeEJHVjlHU2ZHeTAwTWV1?=
 =?utf-8?B?eEhNUXh2d3NUdjNxTWFMVFNDenN3aEczYmNDcDRESW82Z3p1NlJMTTZ1eTVv?=
 =?utf-8?B?eS9JRVc1a2tKRlFFVkNTUmpkK1hzTnRJVEh4dWFTcG5GUnE0Ry9JM0JBcWZZ?=
 =?utf-8?B?R0lrS255bnZKMzEydksvMHBJcTUrTGtib0xUMHRjN1N5YS9NRkQ0aWVodVZK?=
 =?utf-8?B?WWtnRk4raFdyVTlrZmNOZllwNlF4cjFLajhtSEpNQmdmQkhZRitwQURWYnFF?=
 =?utf-8?B?dDdjV09OZzJndW81MTl2N2oxRHNKN0VSdDR6NW5Oa3k5UVNhN09NSFRnY29N?=
 =?utf-8?B?TjV2bjNEaUp5T3ArMGVBTFZTTmhldlhYSHZHQlZPRWtobWg4UWdlVEFiZWlP?=
 =?utf-8?B?R0M3OGNQSHlla0VBVEd4VEUwakErK04wZFZxSUp4N01nOUlMdXRzUFFqYWlv?=
 =?utf-8?B?UjhMMURxUW9Ya1ZIVElzekhkejRodFdmYUk0SjFWY0c4ZTZEWTFvVU1xbFZo?=
 =?utf-8?B?UmlMVGkwU0w5cW4zTkFTWitVSnBRRCtuZUVsa3pLZXVIQVM2dVNQb3RLc1Fv?=
 =?utf-8?B?NXVWTUQ0K05VMm96VjlzN1hQTXJ2b2dNNjRiMEkwSVhCaElZaEUzU1luaVNS?=
 =?utf-8?B?OTlIbmVGbHlvZ1FwMWNUTnpEakJ6bHlBQWh4djJyY1JhNWZwUDhIQjNhRk9m?=
 =?utf-8?B?Q0tKcWh5bGdKRXQxT2V0ajgxa2N3cTJCYTErVkR4TkJNeFVEYVF5cTZ0aWpH?=
 =?utf-8?B?OW5XR1g3UU9VbGdIbldmYXdzTlp4WGk3TE5uS1NaTldpVm5EajNpc2ZRYnN4?=
 =?utf-8?B?YkpBK3RlVVFWZUFOUE56T1g2cnhFZEZ3ZVliM082S0d2VWY4MXhCSEZlM2lR?=
 =?utf-8?B?TEpWM0dpcDB0elRXWDBaRzZ6V1Y0WjVGQWRhK2lxRnlmamdiTFhuc3N2S1hy?=
 =?utf-8?B?MmlpOENkWGhVY2tLd1dkZW5vMlluSEIydCtpTGlPVThPY0d2bk1JbjVRWFNp?=
 =?utf-8?B?UW5QSFJPanNkN2N3OVhVbWVoTkdFRzh3d05RdzYzZjBiZXEvUWtJUHNsU1Jz?=
 =?utf-8?B?Nmp5Ulp0NENPWndZSlFaQUhIQVQ4c0pkSG5KSlUyUm5NU1E1ZjIxVjlIVmxH?=
 =?utf-8?B?YWFuaFpoRmpZcnVvY3ZUbzNmUUlnVjdhejQxQ3VZdkVNTGxOZzJmZWRrZEw5?=
 =?utf-8?B?RzVKUnZiOEFsenpYL1JYZXZmbXFSU1J1VWlkU3Vzb1hpdEd3TGdMeWxZejZr?=
 =?utf-8?B?bmdUcWNFVk9GZE56T0R0NHJ0UEQwV3FkcHd4NzZtOENLZGFJeUJRcHJzeU9U?=
 =?utf-8?Q?t1AFTZFfjakN1u4IGfdUgxo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 23949e6d-ffb6-4f33-4da9-08de31797bb8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6141.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 08:04:58.0911 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gg1i9Kzat2q/37EDGQkfvovquxZ3Qoqo7pLCmB7ROvtGRgPJrOUlnvxvR6S2KAt9NSdCHXeeG0Zzzqbz7Myj+pQ/vOOxR8DMVUWwMfsS2kw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7315
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



On 12/2/2025 1:12 PM, Murthy, Arun R wrote:
> On 01-12-2025 12:16, Uma Shankar wrote:
>> From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>>
>> Add macros to identify intel specific color blocks. It will help
>> in mapping drm_color_ops to intel color HW blocks
>>
>> v2:- Prefix enums with INTEL_* (Jani, Suraj)
>>     - Remove unnecessary comments (Jani)
>>     - Commit message improvements (Suraj)
>>
>> Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
>> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
>> ---
>>   drivers/gpu/drm/i915/display/intel_display_limits.h | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_display_limits.h b/ 
>> drivers/gpu/drm/i915/display/intel_display_limits.h
>> index f0fa27e365ab..55fd574ba313 100644
>> --- a/drivers/gpu/drm/i915/display/intel_display_limits.h
>> +++ b/drivers/gpu/drm/i915/display/intel_display_limits.h
>> @@ -138,4 +138,12 @@ enum hpd_pin {
>>       HPD_NUM_PINS
>>   };
>> +enum intel_color_block {
> 
> Can this be intel_plane_color_block/pipeline as we get a new block/ 
> pipeline for crtc which can later be named as intel_crtc_color_block/ 
> pipeline

I had given it a thought but we don't really need a different enum 
because all the intel_colorop code is agnostic to which object it is 
attached to. Otherwise we have to create plane and crtc specific colorop 
functions without much need of it. So, I envision it as a single colorop 
enum type serving both plane and crtc but with appropriate prefix.

enum intel_color_block {
/* Plane color blocks */
         INTEL_PLANE_CB_PRE_CSC_LUT,
         INTEL_PLANE_CB_CSC,
         INTEL_PLANE_CB_POST_CSC_LUT,
         INTEL_PLANE_CB_3DLUT,

/* CRTC color blocks */
	INTEL_CRTC_CB_PRE_CSC_LUT,
	...

         INTEL_CB_MAX
};

==
Chaitanya

> 
> Thanks and Regards,
> Arun R Murthy
> -------------------
> 
>> +    INTEL_PLANE_CB_PRE_CSC_LUT,
>> +    INTEL_PLANE_CB_CSC,
>> +    INTEL_PLANE_CB_POST_CSC_LUT,
>> +
>> +    INTEL_CB_MAX
>> +};
>> +
>>   #endif /* __INTEL_DISPLAY_LIMITS_H__ */

