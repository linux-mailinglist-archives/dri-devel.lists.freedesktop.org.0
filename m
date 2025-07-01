Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 293C4AEF6B3
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 13:38:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE9E810E58C;
	Tue,  1 Jul 2025 11:38:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HsyprQ7+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EBDD10E2AD;
 Tue,  1 Jul 2025 11:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751369898; x=1782905898;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VbJXaMHdUw5YsaesL/Jlq24+bgTKMWax8yPaDywtxws=;
 b=HsyprQ7+Gv208WCOiXcG9aoXS2Hm1Sut9EM5hHWTI9OK8WYjkMaagkG8
 WTxy+OXpx0zB1RMJGob/wOEp8jRZCs2jttPKOaWhX6F2VOL/9VurhYdfL
 hkjnE3tDTBlinQ3gg7Ic5nsST6ihGWdJ4LXiLkxtzZWv8bySDajl25ZLM
 CkM7Mjdkee9wTsvu0zRpbbU7Lb5spAkhqfC3DqlwAeIV0bLxun/Kdztgm
 GZqkXuMziAgeNzNSlEZUQdrbL9I6GQP6x8/wVganBhY/xC/ZUzSslYira
 O+BKxl2C3uXuyuW3sDAqW0cxkwBuQRTdxSIU/fSm14n/RKq+QK4+t0lAp w==;
X-CSE-ConnectionGUID: nPX7s43aSSez4uWGk6JXTA==
X-CSE-MsgGUID: 6RcywvjbTPS4BwbMXWfjPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="56257871"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="56257871"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 04:38:18 -0700
X-CSE-ConnectionGUID: z/Bs3iOuTSyXzlffhPtTkA==
X-CSE-MsgGUID: heHywGKURCyNNs4ukcDxvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="154242451"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 04:38:12 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 1 Jul 2025 04:38:11 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 1 Jul 2025 04:38:11 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.89)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 1 Jul 2025 04:38:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zOE4CSlwW13NzsJSBRzqyVGFFRaEpK3G7FrVs6J8PmGduOBLcu1X2vM+QxnyBOpJWY/JT8VTqI3rBkoRDOtSreoXjTfs2PWujU3q3dI9GcDdIMjjxt0WSyOmMfOex5bRPN3bagfNtY0XFY4VFvJc+COjIo5fT4Fh4oHMC1qwx9U6i38RGYRsO8BqtUi3CS8Sx3lp3T02U56HPJm/frairqbp3G30y1LOAfkZwFfY8F6GA6ZouJOHcLbG/2OZu8GzqK/EnMh31GY6CaS9uVudEiTMVj1lWUPKuK57RcYCa3g7In8MOeIQTwjh18E6dEg5bj+aNFJuTEZg8C7ZA+PiGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QPWq7VTnFKDg1Sv/QNhJpUeYIQDVwOmCkmpzw+0EYBQ=;
 b=L+MIwGaLU9d5gwdOoy66UZ9zZ6RkkJmiTAsCjo4DLXMKm4IbXtXBbpfi8WBHLb1RST3cB5zcuJwpEnnW3dNg3r7RfSA8FZTiRt/gvdSFIOG7GjkujT7jMO4ccMbKe2uuYYZdC6fxKN3xgMKaDbgB2yYgLvNHMS9IgI4ydbspD+LOYbCD53KhnxyF0Fs0KZinp3XsgiAjNQjzb7tpGk54Onrmjkf7xlVr/7E9rtRBBDPo6OuIayRc6HkmcEct5x/Q9sPE2y67xkfK5E9SbOo/NPT/+2CgJtaNYQPPri9bX/0rCWZC3TPxGLTHa6qSBr4GTGk2pWKxfeFtxsHlaImkWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 CH3PR11MB7673.namprd11.prod.outlook.com (2603:10b6:610:126::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.31; Tue, 1 Jul
 2025 11:37:55 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%4]) with mapi id 15.20.8880.029; Tue, 1 Jul 2025
 11:37:54 +0000
Message-ID: <cebd70d9-57b5-4e89-b715-4ada250e2eb1@intel.com>
Date: Tue, 1 Jul 2025 17:07:46 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] drm: Add a firmware flash method to device wedged
 uevent
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <lucas.demarchi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <raag.jadav@intel.com>,
 <umesh.nerlige.ramappa@intel.com>, <frank.scarbrough@intel.com>,
 =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, David Airlie
 <airlied@gmail.com>
References: <20250623100109.1086459-1-riana.tauro@intel.com>
 <20250623100109.1086459-2-riana.tauro@intel.com>
 <a2bfb8be-35bc-4db9-9352-02eab1ae0881@amd.com>
 <d057d1e8-8b90-445c-8ccb-8a13e5d41a4c@intel.com>
 <44eac6fd-df68-4ae1-8970-57a686f5782f@amd.com> <aFsaXXKZSBPrcYJb@intel.com>
 <aF8PZMuMgmWKYJgo@intel.com> <4a2bead2-3db6-4526-b980-712362b6e770@amd.com>
 <aGLKgholpl8Z3zWm@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <aGLKgholpl8Z3zWm@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0061.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::18) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|CH3PR11MB7673:EE_
X-MS-Office365-Filtering-Correlation-Id: a37c9259-a1bd-400e-9170-08ddb893b822
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NU5zbEFsemNUbDFrTmN2NUtKc2FnUnVVOWF4aHhxSFJ1Z0lKOXMrYzEwUjlz?=
 =?utf-8?B?YUdMMXN0N3ZQNnRmcmwvYW1xcC90ZG94N2JCNlpQU2NsQmxxWXFEeWR3OVBO?=
 =?utf-8?B?USsrZzRQK0MrdHpiYysvM2dlaDU3ZEtuOHVsVS9TQzhtSW1DenJaZ2VLSlhw?=
 =?utf-8?B?Z3phNjJpQkp6QTdCSURobzJ2VXAybXlxRzhUZHR6b3lXbVhDRVhXcTJnUG9K?=
 =?utf-8?B?MVFZU21vNldJS0U2QVY3Um13WTk4c05POWVNcUNuVUxJSFdaRmRDZUE3ZVBm?=
 =?utf-8?B?bmlHVW9XUXBUQ2hIUHd4akozY0Y0by9RTE93Zm1GV2FwNHg5WnZtOG1KSmNC?=
 =?utf-8?B?c2xiK2Q2T0pqTGNaU1FnYzV1Rk5ndGIyYjJnRkQva3dRVHZxTnAvQWFwR1J2?=
 =?utf-8?B?WEZ3aDR5eHQwb05VQ3NKcFprWERDZThVM09Vd1I5ckNHVXJvMHBxRFU4a0s1?=
 =?utf-8?B?V3hPTzBDQ0dZd25yZjFCREowd2poQTYvZXRWbUFhTGNacmVHeXdvNG9QTVNs?=
 =?utf-8?B?Mk5WNzhkL1EyUFJwOGdHd1R0UUdCbjk2ejFzRThheTN5eTdSZ09EZVNaYktz?=
 =?utf-8?B?WWIyUE1QaDI1cFFWNnZCcjVJazl1ZGxkT3psbVRsQ3F5eTRKdGgyczloVXhv?=
 =?utf-8?B?em5vcGdnU3Y5YjlLbHBheVk1ekl3SmFWYUFHcFNCbnU4VDlSb0VRSjFIQlZm?=
 =?utf-8?B?d2lqWWh2UVBQRFNibmkrT1prYjQ2U0FVeWpHZ0dBaElYMTZxZkFlVXN5WjQw?=
 =?utf-8?B?RFZHdkZmell0TUt5SkNMZ09LTjRwNDh0allUZHZwVVJLWkpuS1M0RVVRUG9C?=
 =?utf-8?B?eFB0RExJL1NlTWdEUjd5L1NIQlhkSjlhTXM2MlJNRGQwRXkzL09rdSswS29E?=
 =?utf-8?B?eHR0RHhnTy9Ga0RkeUFJc0xrYzVaTFlKQ2hJcDJlcGtpbHE0MGFTZWZ3OU5E?=
 =?utf-8?B?eks1UjRvc25QR2gzVm1CUVI4NnozZWdPLzB1MUwza3lpK0hybU0xa0hDWkNm?=
 =?utf-8?B?UFpwQ2pRQ1pGNDlRNk50a1dkSmxjcG9uZjljWU1BVUczRDJSR1drOWZoRFVp?=
 =?utf-8?B?M1pSQTNTK3ArVmVyZVNKcG9tQUhCbHV6dklTSlNucVpDRTFJWDM2VHB2cUkx?=
 =?utf-8?B?UENUMDhGUThTVTEvQ2dYZEQ5dWRrYi8xa1FxTFI2TmoyTmt2eThvb0s2Sm9J?=
 =?utf-8?B?WElYamJ3MkNQUTUzV3Y0RzFpQ0UwZXRoNHYvMnJISUdCL1JHcTM2clRPWXNT?=
 =?utf-8?B?enRCWTV1SHExZTB1dGhxV0gwTHJwL0hCKzE1N2tqSjQ3d0VvYkI0NUVWQmJK?=
 =?utf-8?B?ak9jaTZiWHdZVFpNSkJ2UWNxZ3NXNXJUcXVVN3luby85VzFjV0Iwd2g0eHBi?=
 =?utf-8?B?SnVZajFQaUJLZm9MUVhRRnd6SFpTZnZrbVJtZTZQeVdWUXZEOTd6OEVqc3Iz?=
 =?utf-8?B?WHBEeHh2am81Y2UranN1aVhZdjRma21ad0hqVWpQdkcvclFTejFKQzBoNzVr?=
 =?utf-8?B?OW50RjZFamh0U2dPTHVuWU5rNkFDL3JvaThFYnZYREpJRk1MYmpDSzgxcFRx?=
 =?utf-8?B?SHRmb3FhbFhGUit1aEpQMmFIQnp6RHpDZm54dW9GM2g0VDJKN2NiM00rYXpX?=
 =?utf-8?B?eUh2cER6ZUJvY2Z1dGMxTDEyM2FncHJNV0RreTU2c0tMc0FMMWhPdzZ1N1Nw?=
 =?utf-8?B?RnZDcktzTmR5M05oS01hOVVoeVZDdHhzWlFPUUhGRklGQ0U2WTJVSkd0Z3BM?=
 =?utf-8?B?R084MGZJdC85c0hXQjdDRmNoN3N3d2Jmai9abjRvSy9jaGtTMmxBWm9XNmc2?=
 =?utf-8?Q?jOBxTplHtHgXidijnqyaEJjufDEUHygKwBeIg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Wi9iWDRGcGVGVHVYY2lBL252UjJubHE4cUx1RHBhcHBrRVpsalc1cWpPWGFQ?=
 =?utf-8?B?VkhzUHNFSXZqcVU5bkU0UUxIZDN5ZnNES2N4RnI0NTAzbS80RDRFYzFsaVIx?=
 =?utf-8?B?ZmFBNU85SHVINy9FSm00SjZybkh5R1JRSjh3eU9GdHRWSWk0ZzNYQlpienRz?=
 =?utf-8?B?cE1SRkRMbEI1bktnc0lxR2hlT2NVaEpJekxjSkI1TTZHNis5N29YUGJ5ajIx?=
 =?utf-8?B?K2ttTlRYUnNocEswRGZ6WlRldDRxaWZmQlRTWjBVNXRyeHVpbFVjSDBjVEZ4?=
 =?utf-8?B?SGxySEpiSi9MNlRqQStYSHBHalZlVitlVmtNMmtrdzFFeTA3WEZQQjNxVHNH?=
 =?utf-8?B?SndSMU1KRFZjWnRnQnlLM2dudTd3bHNKNjh5eEE3RWpwWEpLZmt6dzBmTUZw?=
 =?utf-8?B?bTRYNUlVRm9DMklhcmlDb2thejd4L3V4R09hTTF1clpLNXd4UFFmZHRaQUxv?=
 =?utf-8?B?R3Z5R2pxWFR1YVkyQUpyRmlTd3YvMHhURGNwZGxUTkdVeDZYYnhVSWo3N21H?=
 =?utf-8?B?MFN6ZkRHQ2N4QmhxRnRCTHJpaVFmeFZMK3RNdDQ1S0JlbDRrUFZXNmFpcmo0?=
 =?utf-8?B?L3pEVVJLMXRqMTRQVmpzWTR5UmFEeFRmWCs2M2VyeWN0Q2tYak4vSEM3ekxp?=
 =?utf-8?B?anJrK2YyUUcvNGRXUmJCeE5UQWxvdS93aVVEbXdkbG1nU2xpVHdUdU1nSmVs?=
 =?utf-8?B?Z29NajdHWExOQ0dHcXBCVVRSV3hHQWpKRnY5TGxPS1R0SHdNZTgyNGxENy9N?=
 =?utf-8?B?Z2lISm0veFNrdkxhRGd1WkhSZE5GVnBzZlBmWERPZmx3TFlWVzZnVi9lK1Vn?=
 =?utf-8?B?OElXbWMzdnRkWTRYSGVKaU9uK1d0VmlNMHpuTEtTcit0OXNVeDRPUjhzY0hh?=
 =?utf-8?B?WXFPVWdndTgzcFJhVU9PeStrNDhPTUIvZzEzRUNQNkRhRklRM0hmU2htVjJy?=
 =?utf-8?B?NFhlTjhFdEtIK0RoVzBZdjNDZlpQZzF2U1NZYjlKT1VFN01JOE84ZkFjQVBG?=
 =?utf-8?B?WTV4UHlteXVyZzNVWVFRYnNaRUR0enBXbzJLdTd0OTFHdklzcnFTeUl1NFRw?=
 =?utf-8?B?cW81WTdKUTBrcHB3NGx1a0JBTnBodzU0TTM3SDJ6Q0g4d0xxcEhmcmZraThh?=
 =?utf-8?B?eHdiUzJSYXJSalN1NzdhMjlFLzRJNlQ1RzR0d0FzVHd3Tkd1c3phS0k5MGlj?=
 =?utf-8?B?aWlHVzMwUnRRWGJ0dmVQc3hpTXFNa2xyeWR5VWcrQTZxRGFBUk5xM1RJMHAz?=
 =?utf-8?B?cDgyWnRHbDhnN2R6KzU2OE9MNGVPY1NYWlpaMFFCcnk2M2lNbFlDeWdncTJM?=
 =?utf-8?B?LzZmUjMwMUVtNnNiaStMZ3ZUeVpCaFVoOVVnSkdiWWdtT0w4MTdqdGVxRCtz?=
 =?utf-8?B?aGVReFo1R0FZQUFROW02Vyt6dm9qNzQ5U29qaWRONVFuZG16MGI0VlBqamRp?=
 =?utf-8?B?c3pyM09kTkZ4ZDMyZWdhU1RmUWN3UmNyVHhHSXRQZ2RlY2hKdFQ2UEJtVDFX?=
 =?utf-8?B?ZXRpakUwYkhub2puRVdVckFxbWF2VnJIZVVibDNobU1mQWZBZEFDbkxvRnAz?=
 =?utf-8?B?MUlKc0VPWER1eWxqMHAzdkFOdFNHL285RTF5WFlzWlVRWWxoZWJXakdDOUJS?=
 =?utf-8?B?NFZPdC9jOVRVWUliUkdVSU8rUk1NZzNSZ1haVVNnZ2UyR1lvQkR0WTZ0eTVk?=
 =?utf-8?B?RHk2Sy9LTjRCQ1FxRWdkejUra2FtRzV2T2U5NXVYbm1NR2ZGcmtQeWpIVmVa?=
 =?utf-8?B?L2RjUUU1bHJiMDVxMlVRT0xxaGhmQnhCcktaaU1lcDFEendzYUVaWEl2SjlR?=
 =?utf-8?B?NzlQMCtscUp4aVU5SVZRZkQxVHBpWlE5emtOdkdmbGNwWU5ZaEQ0VXAxRzNx?=
 =?utf-8?B?N1dqOXhnaEwwd3R2MVA2Wk5FYU9adGI4OURGU3Z1V0kzYVVMVUxYeFBLYUNk?=
 =?utf-8?B?L29MenlBRytrREgybnB1ZWluMmFZTXlRSG1JQUNIZ1YrdVVyWnFpSDdFaXJ4?=
 =?utf-8?B?MTNYcDRYOGVSTFJEeHVBczBhRmhKYlVYd1VBd3Fidk11YWRFT3VqVTduMGxn?=
 =?utf-8?B?MDBFbTE3THBSUUUvOUhEZzh1Mks0a013VFJOK2x2TnlFU2RIZGk1V1dEQVRO?=
 =?utf-8?Q?1WDHhVW3Pk2r/Cau2IoV67MOK?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a37c9259-a1bd-400e-9170-08ddb893b822
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 11:37:54.8209 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zeKkCX6CAzUxVqk1O/W9WaWChSzmtWlxtQXKKu5mLRsmg1qpeccFy1BVKMyPtnya6EwH9fqGA7sV1SAnNc+SPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7673
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

Hi Rodrigo/Christian

On 6/30/2025 11:03 PM, Rodrigo Vivi wrote:
> On Mon, Jun 30, 2025 at 10:29:10AM +0200, Christian König wrote:
>> On 27.06.25 23:38, Rodrigo Vivi wrote:
>>>>> Or at least print a big warning into the system log?
>>>>>
>>>>> I mean a firmware update is usually something which the system administrator triggers very explicitly because when it fails for some reason (e.g. unexpected reset, power outage or whatever) it can sometimes brick the HW.
>>>>>
>>>>> I think it's rather brave to do this automatically. Are you sure we don't talk past each other on the meaning of the wedge event?
>>>>
>>>> The goal is not to do that automatically, but raise the uevent to the admin
>>>> with enough information that they can decide for the right correctable
>>>> action.
>>>
>>> Christian, Andre, any concerns with this still?
>>
>> Well, that sounds not quite the correct use case for wedge events.
>>
>> See the wedge event is made for automation.
> 
> I respectfully disagree with this statement.
> 
> The wedged state in i915 and xe, then ported to drm, was never just about
> automation. Of course, the unbind + flr + rebind is one that driver cannot
> do by itself, hence needs automation. But wedge cases were also very useful
> in other situations like keeping the device in the failure stage for debuging
> (without automation) or keeping other critical things up like display with SW
> rendering (again, nothing about automation).
> 
>> For example to allow a process supervising containers get the device working again and re-start the container which used it or gather crash log etc .....
>>
>> When you want to notify the system administrator which manual intervention is necessary then I would just write that into the system log and raise a device event with WEDGED=unknown.
>>
>> What we could potentially do is to separate between WEDGED=unknown and WEDGED=manual, e.g. between driver has no idea what to do and driver printed useful info into the system log.
> 
> Well, you are right here. Even our official documentation in drm-uapi.rst
> already tells that firmware flashing should be a case for 'unknown'.

I had added specific method since we know firmware flash will recover 
the error.  Sure will change it.

In the current code, there is no recovery method named "unknown" even 
though the document mentions it

https://elixir.bootlin.com/linux/v6.16-rc4/source/drivers/gpu/drm/drm_drv.c#L534

Since we are adding something new, can it be "manual" instead of unknown?


Thanks
Riana

> Let's go with that then. And use other hints like logs and sysfs so, Admin
> has a better information of what to do.
> 
>>
>> But creating an event with WEDGED=firmware-flash just sounds to specific, when we go down that route we might soon have WEDGE=change-bios-setting, WEDGE=....
> 
> Well, I agree that we shouldn't explode the options exponentially here.
> 
> Although I believe that firmware flashing should be a common case in many
> case and could be a candidate for another indication.
> 
> But let's move on with WEDGE='unknown' for this case.
> 
> Thanks,
> Rodrigo.
> 
>>
>> Regards,
>> Christian.
>>
>>>
>>>>
>>>> Thanks,
>>>> Rodrigo.

