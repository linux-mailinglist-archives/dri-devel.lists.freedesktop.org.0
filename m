Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SDzVGcfplmn4qwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 11:45:27 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8430E15DF3E
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 11:45:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBCA710E6A7;
	Thu, 19 Feb 2026 10:45:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NkRjLaJL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EC6510E2FD
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Feb 2026 10:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771497922; x=1803033922;
 h=message-id:date:subject:from:to:references:cc:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kN4te2m+khWMV1tX4IC/iS/LIGKal4NZP5YKQRgEz0E=;
 b=NkRjLaJL/Jotd5TjryOJgqeGOvoe3i/O45ES7UZYG5J7JGKWLwoSWvwX
 95cGCTOYI6VPYDvQauf7FMwHz+3HG8A98IdZFUMYQVWloevHuzt08ZxQ2
 S4JYW9YGrjdQ2ECCDu2CuwyRkP0hdBBU3ION50RwP/2eEshveN2HPAZK7
 SjwzqxM1g3PxxSfvWlQNEfPMl7aL1SwhJDct0s4iXaXlDt12v5xoA9KeK
 a0R5M2bMEDf3Ah2VJoarBaU0y4yrvzMdxw/g8HazwhCJ/zgQGPkKn7I4E
 lxpyqB5EAv0a3bqkaiJFJhvIc0aHVrxJC3U9ukeXXEHpYHIgp5MaObqVS Q==;
X-CSE-ConnectionGUID: MbHwgIa/TGeaEsaheL7PUw==
X-CSE-MsgGUID: kgbzuakTTYeN/fAPYiCQ0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="60154163"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="60154163"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 02:45:22 -0800
X-CSE-ConnectionGUID: VVgSrsSYS0WfZPJmBTqC1w==
X-CSE-MsgGUID: J2L3ppnRQua2qtgldhUFMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="252183828"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 02:45:22 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 19 Feb 2026 02:45:21 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 19 Feb 2026 02:45:21 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.65) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 19 Feb 2026 02:45:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ySRhxtbCBmaxLtIEIjpZBh5S04l75YFa1nICJiUHxFz6tQrSNWj+KfAI7ntcmclFLvPRWU7JxnMgGGmMcPX9ilv/Yka1JFNp/+XdWV4enekWI7ZigAABhyR+kYfaWsxHaXlb6BfZ7+Xkj+vl/bdZ4UMh5LoqRFItbMQQg1wwHho6UGlbnHoLgEyzUUzwH3jRBKUNsAihzCY1jaAnxFnqsWYejp2+0+B+VtRiMnXlqOOP+9ICHAvhRWx0Vw9dYsnL0cOOq0Jdn1pJiqAmxYYg/J8qDSH1FYC6EeGCQ18QxKUQvIl6GpPy4IDfb5Ep494kpUeKTv6pSfNvOk8lUCCRUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NSdT2R3YIivxq8WVajsPIkYDGLjMpLUFc0Hdg5vI1v4=;
 b=pmnfEv1pSGTS05DWa7glBrwH+2cZi4vYLuhy6yZxI4KYwRA/Ia9hrvVy6LDdG+91VOElDPsRU/LF6VMVNH/03zyxKUxWsp+o7shSfoQUME+eZGguoT8qkgIhmzA1T6hG6jpdFKqDdwu2zan2aZmv8ZfL3yk/BuPgoq0vov7MiSAmZZfMDqtkiJoYXfrWa7lB6izJzy7VWShFrAfVg/lOrGqIe3hZtUHGK4PwndtjEYB9KU/VOKi8CO4rduGdmAmBbNPa/FFCECRVXEFDp+80j4aDyRtOYbr9hS/Bzg7XDNDVllqbrIEXCzv2oJuzv7x2/iqn7QZf7wRjWk05MgJ8Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8208.namprd11.prod.outlook.com (2603:10b6:8:165::18)
 by CY5PR11MB6307.namprd11.prod.outlook.com (2603:10b6:930:21::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Thu, 19 Feb
 2026 10:45:19 +0000
Received: from DS0PR11MB8208.namprd11.prod.outlook.com
 ([fe80::ecb0:7475:84de:ca9c]) by DS0PR11MB8208.namprd11.prod.outlook.com
 ([fe80::ecb0:7475:84de:ca9c%5]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 10:45:18 +0000
Message-ID: <e9df7116-e33e-4571-966e-c5e8b4528165@intel.com>
Date: Thu, 19 Feb 2026 16:15:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] drm/buddy: Add kernel-doc for allocator structures
 and flags
From: "Yadav, Sanjay Kumar" <sanjay.kumar.yadav@intel.com>
To: <dri-devel@lists.freedesktop.org>, Arunpravin Paneer Selvam
 <arunpravin.paneerselvam@amd.com>
References: <20260212092527.718455-4-sanjay.kumar.yadav@intel.com>
 <20260212092527.718455-5-sanjay.kumar.yadav@intel.com>
Content-Language: en-US
CC: "Auld, Matthew" <matthew.auld@intel.com>
In-Reply-To: <20260212092527.718455-5-sanjay.kumar.yadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0229.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f4::8) To DS0PR11MB8208.namprd11.prod.outlook.com
 (2603:10b6:8:165::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8208:EE_|CY5PR11MB6307:EE_
X-MS-Office365-Filtering-Correlation-Id: ef357fda-f8d9-4802-8b0c-08de6fa3f939
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T2ZXd1VldXIrQkZHR1oyQkFHeHV6Z3hZbEpkNnM3ZnZzOVJkdGZmWU5jWkI0?=
 =?utf-8?B?NTQza0ZCR011WFFnN3lRSS9WQjNQR1dBaUtyY0tnb0hMM0RQaWxXSDZNdHh1?=
 =?utf-8?B?R1ZiOTl6Rk16N0czcnNPeWhYR216Z3N3YVY1MDg0SGEvZHg1Y1Z5MTVRYkVx?=
 =?utf-8?B?dGF6VVRQQk95bnd4NzB5cjI1WTJyZVZIK1JCSzBScDQ5akd1bEVOdEtrazdx?=
 =?utf-8?B?Z3VFUnoxV0hKQUtweldocDlJcnN6em1CWVVwT25zS0llZEFMb2VDVjR4V01J?=
 =?utf-8?B?TVlmT0ZqaHNuMjA1b3IrZEVLcVZrYXhnNU9xUlM5ZGFNWUpYYUxEbHpOVzE1?=
 =?utf-8?B?VzFWeGFCdTI3eHAxUzVwS0hHMmRxdkJWQlY2N0ZQT25SSHgrNGR4WkpPdHBX?=
 =?utf-8?B?LzdKRnRsak9uYnBVaUh1TUtMRWd6Y0ZEck5UUFVBamNGdGhWdDJzRVNqUkJs?=
 =?utf-8?B?RS9XblhVaThzYnoxaWJmVnFhN2VLandvQmNaaWMzQUFkR2tYR05YdTZEaUlk?=
 =?utf-8?B?NTJrTGtmeU5XN2JuQVFPbnIvT25KY1oxUmJ2MmRLWHpSL0gveTNneGZ5a0dX?=
 =?utf-8?B?ZnZzeEVYbjZJbEh5aWI2ODFzVjZHR09XOGttak5HQWk1Ymd3Y040bHBndzV3?=
 =?utf-8?B?bDhuNGd5MFYzcjk2Q1g3dlBhdHoyTmVEZGhwU01yS2tKSExvMTkvcDFWZjBP?=
 =?utf-8?B?NkxjbFd5NkZPYlQyenYrUE1BTlBzUzI3KzErWDI1MXBEY0V1cnZOS3FDYjBj?=
 =?utf-8?B?cFQ4RlJEZmNENWlBMUtWOEVTMU5rVkRQWk54dFZRUlZRL3YwZXk0K1AvTWNY?=
 =?utf-8?B?ajRyWWJENUZ2RnlaYWh5RnFxcnBkaVhuZ0Z4WVBWbjcxSWZhQTJHVVdJMitl?=
 =?utf-8?B?SExIbTZydTdFemtldDc1bksyalEyZWxPVWlDTTRCejZRWng0Y1NwcGNEMmVD?=
 =?utf-8?B?UjVqcnZ6VEJXcTJ3Q3pKY3VHMmtJamp5THc4Nno4TGdYbGdwSWh0SnBhQ09Z?=
 =?utf-8?B?dWprbW5qN2tUVFF5blJtaXNJUFZDempLYjZxc3BYSmJtOTFublNWdVp0YUUr?=
 =?utf-8?B?UWc5UWM0NTJIY2VkWTMwRVpPcWd2Q3V1ZFRoTUhJdDRUcGpKRy9FaHB0Mi9K?=
 =?utf-8?B?emlvUmsxVlV5Q2xFeUEvVHF3V2R1d1p0andiN3JaMGZnTkwyck9jTTE2MzhW?=
 =?utf-8?B?WDVCRlphRXVpdHQxOFFFSDNpblZKYmZXT01JV2RsZ0dnZTFkK29lZCttZ2Yv?=
 =?utf-8?B?WVMyY21xN29aTmhMVVdpNGlYOENWQ01wTzdRSzVGWTJaSlRHQ0lzM0wrZXhR?=
 =?utf-8?B?bWJBenVPSisrMHRkbEpsNVJIVmdHUDdBVWpucmpwSGdqME5FdmthWlp6UFFM?=
 =?utf-8?B?blJCd0tVZk1BQ0Ezemd5RWs0ZzVraTdETWRmbjNVK2FMYjZCL0pIaTEzeCtF?=
 =?utf-8?B?QmFDc1B6aEtQdFJZSmdvSVArM2hBRnJBZlhDVTdiWFBvMWRqNzJDbmZ2RlpE?=
 =?utf-8?B?b0NBTFd0OHgzUEZDRHVLRUIySHlUNjVzNHU3Um1zVlhraUJFRnBLMlc4M2NB?=
 =?utf-8?B?QTIvVFZLbytmVERweWNOdmJlSlIwbjAzZ0R1Z3liMTlxNFZXVmpGa3BmYndH?=
 =?utf-8?B?ZGE3UHR2NkI2VGZjUXNITTRFYW1FTjdvU3FUai9BWXlsd09ENVQ2eVNFcmlv?=
 =?utf-8?B?U3g5VkppaFJWeXBOMmtjbUJpeDFWSGNYMDlMY3dGRFp1eUo2NjBXTjVQdnd0?=
 =?utf-8?B?VzVFMmYzZ20yS2lBeUZpNDhXUzhiQzRod1VpcWZWUUJxQUVYZHZmeTBpekI3?=
 =?utf-8?B?R0RwTVNpd2NxMVl0K1NQYko2UVI1bTNQa0pCYytRVUJVSUJrTnFOeTNySWV4?=
 =?utf-8?B?ZFJLMmMyVTAvbUZ3UGVvM1Q0RTZHWnlsY0srYitkZUZqYS9JOUw5a296bUlj?=
 =?utf-8?B?Q1JxNVJpVUVmUEQxOFN5amdpMDFrc2VVdUl6bmVtSWxscHZKWUJFT0QxRW1y?=
 =?utf-8?B?VmFEKytuUzZsNG1pREhCRy9vS2ZjVElmZVQ0d2ZzRjNDN2E0VEppWnlrZmlB?=
 =?utf-8?B?enI5aDA3aHdIbmRlM1ZFWnlyUlNSaUlJVVU0NHpJQ2krWUFFaytjbUxwQ3lo?=
 =?utf-8?Q?qsps=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8208.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a29YbTVBTDFScjZjTEFRbmJpZHJqbVZpcjNPaGhleHdwVUo2OG82VFZ1Wmhh?=
 =?utf-8?B?eStOMTdDM2UxcGNMUld0VnNsc1lTRkhjT0lxSGRTc0pEWE9wTlBxcWRJWlJi?=
 =?utf-8?B?WEcxWGFzRXlkMWsrSElUVmY3V0tDZ3NHUTNZVHZmeWF1aU9xbG5GZ0tQckpF?=
 =?utf-8?B?WVlYQ3JmVEtpUG1xTnEra0hveEdKREgrN3Aya1FxbHE3enduUVd5cUJPVmdu?=
 =?utf-8?B?NWRrK0VDcmpQUDFWSkxERk8ySkdMTW1ZQThveWdZY3gyRkNONXRPTHVNMDgy?=
 =?utf-8?B?UmU3TEN1ZDNTeW84SEVHN1Mxd2pYWDM4TDZiclhldGNuZ0FQbERabGNPRGNs?=
 =?utf-8?B?ckUxSTdhdTJ0ZTdWVmZnQmxsZnh3TFhxWE9qS2J2Z3pNTm90ZnVSeFovd0ZQ?=
 =?utf-8?B?Uy9IeHltTHFoNWpXRmVLVnlSRHlmVkJzK2J6VUU5ZDd2ZTFHMUE0RFFaTGZj?=
 =?utf-8?B?YytVWEYzNitkMG9uUDljR1pBTjdxb204TVVBemt6ekpsR3U0NEkyWFZpYWVy?=
 =?utf-8?B?RStjdGxFdmlpemlSemErcDUxcnNPQVhFSXFjZjgweG5FNVhqMVdLT0VOQXVN?=
 =?utf-8?B?YTl1WG42bzU3RVNXVTEyLzJXMFQ0RnRTK2ZXUDRoRzVsZG5sSGh4Mmo2Vlg1?=
 =?utf-8?B?RW1IUjVCQ1M2V1pXUm5vYzlZWkJZWEE2dng3QTY4cG1yT0RDZlNTbVgzQXM0?=
 =?utf-8?B?ZTh4RE1yYjg0RUoyY0NRTVZGSHJVeHVZUHU5SDhYUXc5ZzJzbzFPOFE0S0Fr?=
 =?utf-8?B?OW1QQnl3Z1FjbVdpd05lMTJ2UnVPelE2Vko0UHNtZGdRRnFyVkxhL1ZCdjEz?=
 =?utf-8?B?YUk1b04yZ1FkWTV3cWN4bVNVS25TZEtTNjdlcVlhcW5uNHE0MTVoYUl2YlJj?=
 =?utf-8?B?NUY0M2JoUklqZ2dmSm1hZzBveEIvRFUxaFV1amJRZ0V0UXNFbWpsTG9XVTZX?=
 =?utf-8?B?elVUNjlCZWtONkZUY2ozNWxLb1gydXloL3FsT2I0NlcvS1VJQ0Y0K1Q3LzFv?=
 =?utf-8?B?cTFyYWhMeDYraDFLWFNMN0dMN0hlSEtzdWl0RVB0M0NKK1JpSTQzb3NibUJ6?=
 =?utf-8?B?RC9RTmlleE9ZQzJJZUJXV3g5cHNhN3pJWHVObnVOM1VpSmd4b015YjdKUGhW?=
 =?utf-8?B?L0htMWtwNXg0bkx0em9Ib3VpKzdERWxBS1V5NUF0MnlsdFF3dHNvMnFVU2F6?=
 =?utf-8?B?clU2bGVLemxaWTFoMzNrWTl3M2phMjZEOHFheUR0QzAyc3NoaFFXOW9GSk1v?=
 =?utf-8?B?Mm13NVNFeHIxQU8yTkZjc09VTmlzY05nTytBUkFhazhVOHRaVndTeG54Y2l5?=
 =?utf-8?B?emJkbmhTcWdxMmI4UThhSGRoRGRUY0E3djNkQ2xZZmVGYzVzY1Y5TnF2Mldq?=
 =?utf-8?B?Q0NiOVQ3TjhLaDY3aGtjRGd3V0x2R2R4d3VTN2Z5Q1FHSmZXU28rR05FVHpy?=
 =?utf-8?B?VEtncnBRVkZEdGxhcEE5TUcwbWZnLzNyMFVzWHRsbllMcE12ZzdvRzdKK2xY?=
 =?utf-8?B?WmdncVNqblIxTkFiamlZUGdreU81RFR5VjhSdWNRbndaZDEwaW9qNzlUdXJK?=
 =?utf-8?B?aFZuS3lsSXczejdIUTNxTXFydFNnNFNSVUNQeUVaazhFbE4xVSsxM2tML3FQ?=
 =?utf-8?B?OFd2MCtkdXFDR0RxcnRQU2tIRlEzejdjMVp2R2Nlb1pTZEhlMTNmUlFwOW1H?=
 =?utf-8?B?MXhtVVJiUXE3cUNjUC9RSTI5ZWc3MDg0Z1p3TWYyQXJxREFlMGxOeHRFalVQ?=
 =?utf-8?B?aGkwTUpVbzgrSFh1RCtISDFoRlpsb0c3aCtaekxMSXhpajV6djlwMHdtYStG?=
 =?utf-8?B?b0w2N1U5Wk9xVHRQakJVbUMrYnJZN01qWkJsN0Q1NENSVWgvT2oxVE5LdXNV?=
 =?utf-8?B?N0l3Y1RobFlSY0NvcjNReitQdW9LV2FxOHk4aTNXMm50V3FFeFIrUVNZbEQv?=
 =?utf-8?B?U2xOVE8rVUZjVUlSMmkzeUdhMUpjakdpMmdJTTIxWmgyMjhZZGJkTUx6SkNP?=
 =?utf-8?B?Um5mc1lvTk9HWDduS3JQdGtZYkMrMHRQRjBVUlFOUUxKNG5QY3FNSUpOUlRQ?=
 =?utf-8?B?WXRRWDJCbHRpd01JTUhIaVNmenBwNlVqU0pzS1N1UXNncDVESEp1eXBuOU5L?=
 =?utf-8?B?Y083RGN3aEZZc2V3bWJLdUlPQ3BoVk84dWdZU3pwOGhLcHcxZnlBT0xQQnQ4?=
 =?utf-8?B?Nlcxb2p5Tlh0QjBlbmJQT2VHRG9nTElGS2MxYkx2QVZzcE1YSzY5enVoU3Qw?=
 =?utf-8?B?Tjk5bDQvU0IyUCtBZ3ozV1FZRytQbS82dFI3ODZpYkRnODZmcStzcDcyUmRr?=
 =?utf-8?B?dU1sKzQ2V3FWakc1cWRxcnNGaXV4ZitHbVJXY3l0YkpEdTNIbG54TTNCZGw0?=
 =?utf-8?Q?87uepw2HV5p/SWN4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ef357fda-f8d9-4802-8b0c-08de6fa3f939
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8208.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 10:45:18.8363 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UQG4Hb1f5iHMVRGM7RtTNiFVEIfpm/Ve0gkjwbPTEpcEJreaawKI+o+Bcm+FCFxY0Jvxe2G07kqRTi25Edz9N/n7tJRQNXDONl0aKaEBIQ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6307
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
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:email,intel.com:mid,intel.com:dkim,intel.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sanjay.kumar.yadav@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.991];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 8430E15DF3E
X-Rspamd-Action: no action


On 12-02-2026 14:55, Sanjay Yadav wrote:
> Add missing kernel-doc for GPU buddy allocator flags,
> gpu_buddy_block, and gpu_buddy. The documentation covers block
> header fields, allocator roots, free trees, and allocation flags
> such as RANGE, TOPDOWN, CONTIGUOUS, CLEAR, and TRIM_DISABLE.
> Private members are marked with kernel-doc private markers
> and documented with regular comments.
>
> No functional changes.
>
> v2:
> - Corrected GPU_BUDDY_CLEAR_TREE and GPU_BUDDY_DIRTY_TREE index
>    values (Arun)
> - Rebased after DRM buddy allocator moved to drivers/gpu/
> - Updated commit message
>
> v3:
> - Document reserved bits 8:6 in header layout (Arun)
> - Fix checkpatch warning
>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> Suggested-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
> Reviewed-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>

Hi Arun,

Could you please merge this series if its looks fine? Thanks.

> ---
>   include/linux/gpu_buddy.h | 123 +++++++++++++++++++++++++++++++-------
>   1 file changed, 103 insertions(+), 20 deletions(-)
>
> diff --git a/include/linux/gpu_buddy.h b/include/linux/gpu_buddy.h
> index 07ac65db6d2e..bf2a42256536 100644
> --- a/include/linux/gpu_buddy.h
> +++ b/include/linux/gpu_buddy.h
> @@ -12,11 +12,58 @@
>   #include <linux/sched.h>
>   #include <linux/rbtree.h>
>   
> +/**
> + * GPU_BUDDY_RANGE_ALLOCATION - Allocate within a specific address range
> + *
> + * When set, allocation is restricted to the range [start, end) specified
> + * in gpu_buddy_alloc_blocks(). Without this flag, start/end are ignored
> + * and allocation can use any free space.
> + */
>   #define GPU_BUDDY_RANGE_ALLOCATION		BIT(0)
> +
> +/**
> + * GPU_BUDDY_TOPDOWN_ALLOCATION - Allocate from top of address space
> + *
> + * Allocate starting from high addresses and working down. Useful for
> + * separating different allocation types (e.g., kernel vs userspace)
> + * to reduce fragmentation.
> + */
>   #define GPU_BUDDY_TOPDOWN_ALLOCATION		BIT(1)
> +
> +/**
> + * GPU_BUDDY_CONTIGUOUS_ALLOCATION - Require physically contiguous blocks
> + *
> + * The allocation must be satisfied with a single contiguous block.
> + * If the requested size cannot be allocated contiguously, the
> + * allocation fails with -ENOSPC.
> + */
>   #define GPU_BUDDY_CONTIGUOUS_ALLOCATION		BIT(2)
> +
> +/**
> + * GPU_BUDDY_CLEAR_ALLOCATION - Prefer pre-cleared (zeroed) memory
> + *
> + * Attempt to allocate from the clear tree first. If insufficient clear
> + * memory is available, falls back to dirty memory. Useful when the
> + * caller needs zeroed memory and wants to avoid GPU clear operations.
> + */
>   #define GPU_BUDDY_CLEAR_ALLOCATION		BIT(3)
> +
> +/**
> + * GPU_BUDDY_CLEARED - Mark returned blocks as cleared
> + *
> + * Used with gpu_buddy_free_list() to indicate that the memory being
> + * freed has been cleared (zeroed). The blocks will be placed in the
> + * clear tree for future GPU_BUDDY_CLEAR_ALLOCATION requests.
> + */
>   #define GPU_BUDDY_CLEARED			BIT(4)
> +
> +/**
> + * GPU_BUDDY_TRIM_DISABLE - Disable automatic block trimming
> + *
> + * By default, if an allocation is smaller than the allocated block,
> + * excess memory is trimmed and returned to the free pool. This flag
> + * disables trimming, keeping the full power-of-two block size.
> + */
>   #define GPU_BUDDY_TRIM_DISABLE			BIT(5)
>   
>   enum gpu_buddy_free_tree {
> @@ -28,7 +75,28 @@ enum gpu_buddy_free_tree {
>   #define for_each_free_tree(tree) \
>   	for ((tree) = 0; (tree) < GPU_BUDDY_MAX_FREE_TREES; (tree)++)
>   
> +/**
> + * struct gpu_buddy_block - Block within a buddy allocator
> + *
> + * Each block in the buddy allocator is represented by this structure.
> + * Blocks are organized in a binary tree where each parent block can be
> + * split into two children (left and right buddies). The allocator manages
> + * blocks at various orders (power-of-2 sizes) from chunk_size up to the
> + * largest contiguous region.
> + *
> + * @private: Private data owned by the allocator user (e.g., driver-specific data)
> + * @link: List node for user ownership while block is allocated
> + */
>   struct gpu_buddy_block {
> +/* private: */
> +	/*
> +	 * Header bit layout:
> +	 * - Bits 63:12: block offset within the address space
> +	 * - Bits 11:10: state (ALLOCATED, FREE, or SPLIT)
> +	 * - Bit 9: clear bit (1 if memory is zeroed)
> +	 * - Bits 8:6: reserved
> +	 * - Bits 5:0: order (log2 of size relative to chunk_size)
> +	 */
>   #define GPU_BUDDY_HEADER_OFFSET GENMASK_ULL(63, 12)
>   #define GPU_BUDDY_HEADER_STATE  GENMASK_ULL(11, 10)
>   #define   GPU_BUDDY_ALLOCATED	   (1 << 10)
> @@ -43,7 +111,7 @@ struct gpu_buddy_block {
>   	struct gpu_buddy_block *left;
>   	struct gpu_buddy_block *right;
>   	struct gpu_buddy_block *parent;
> -
> +/* public: */
>   	void *private; /* owned by creator */
>   
>   	/*
> @@ -53,43 +121,58 @@ struct gpu_buddy_block {
>   	 * gpu_buddy_free* ownership is given back to the mm.
>   	 */
>   	union {
> +/* private: */
>   		struct rb_node rb;
> +/* public: */
>   		struct list_head link;
>   	};
> -
> +/* private: */
>   	struct list_head tmp_link;
>   };
>   
>   /* Order-zero must be at least SZ_4K */
>   #define GPU_BUDDY_MAX_ORDER (63 - 12)
>   
> -/*
> - * Binary Buddy System.
> +/**
> + * struct gpu_buddy - GPU binary buddy allocator
> + *
> + * The buddy allocator provides efficient power-of-two memory allocation
> + * with fast allocation and free operations. It is commonly used for GPU
> + * memory management where allocations can be split into power-of-two
> + * block sizes.
>    *
> - * Locking should be handled by the user, a simple mutex around
> - * gpu_buddy_alloc* and gpu_buddy_free* should suffice.
> + * Locking should be handled by the user; a simple mutex around
> + * gpu_buddy_alloc_blocks() and gpu_buddy_free_block()/gpu_buddy_free_list()
> + * should suffice.
> + *
> + * @n_roots: Number of root blocks in the roots array.
> + * @max_order: Maximum block order (log2 of largest block size / chunk_size).
> + * @chunk_size: Minimum allocation granularity in bytes. Must be at least SZ_4K.
> + * @size: Total size of the address space managed by this allocator in bytes.
> + * @avail: Total free space currently available for allocation in bytes.
> + * @clear_avail: Free space available in the clear tree (zeroed memory) in bytes.
> + *               This is a subset of @avail.
>    */
>   struct gpu_buddy {
> -	/* Maintain a free list for each order. */
> -	struct rb_root **free_trees;
> -
> +/* private: */
>   	/*
> -	 * Maintain explicit binary tree(s) to track the allocation of the
> -	 * address space. This gives us a simple way of finding a buddy block
> -	 * and performing the potentially recursive merge step when freeing a
> -	 * block.  Nodes are either allocated or free, in which case they will
> -	 * also exist on the respective free list.
> +	 * Array of red-black trees for free block management.
> +	 * Indexed as free_trees[clear/dirty][order] where:
> +	 * - Index 0 (GPU_BUDDY_CLEAR_TREE): blocks with zeroed content
> +	 * - Index 1 (GPU_BUDDY_DIRTY_TREE): blocks with unknown content
> +	 * Each tree holds free blocks of the corresponding order.
>   	 */
> -	struct gpu_buddy_block **roots;
> -
> +	struct rb_root **free_trees;
>   	/*
> -	 * Anything from here is public, and remains static for the lifetime of
> -	 * the mm. Everything above is considered do-not-touch.
> +	 * Array of root blocks representing the top-level blocks of the
> +	 * binary tree(s). Multiple roots exist when the total size is not
> +	 * a power of two, with each root being the largest power-of-two
> +	 * that fits in the remaining space.
>   	 */
> +	struct gpu_buddy_block **roots;
> +/* public: */
>   	unsigned int n_roots;
>   	unsigned int max_order;
> -
> -	/* Must be at least SZ_4K */
>   	u64 chunk_size;
>   	u64 size;
>   	u64 avail;
