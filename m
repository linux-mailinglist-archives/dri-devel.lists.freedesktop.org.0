Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E27A97E20
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 07:37:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0133510E3FE;
	Wed, 23 Apr 2025 05:37:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PUUys8AX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7D2710E1D4;
 Wed, 23 Apr 2025 05:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745386665; x=1776922665;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LPGpnpQu1BlG2yBKG2CZJlbXwnZ24pTgAvcwsX7R0fM=;
 b=PUUys8AXT+r89E1mSiZnYFcP5t/DaFjP9q29jIZ3EKo8dsmFBTed8cSq
 xB98usjbeKDK/PmHaOuBkMW5Ut7pts1LXXVC1Ro9WGUYnvRCQ2LhBtYbR
 FOG1MMTj8x3tx0tLIfyJXrQyJ2+VEDEo3FXeWstDaGdJFIltK8/0b3/M6
 zNBPCfy6r6hOCBhvAw9392PrtsPKtqUPfdeSfzgSodZuWx8uC/HqHo2cC
 AKW8A+734fANLH+b5Pc7XlI2A5VH1q2SQto4yLyNnalHjAqh2g/QuZe0W
 py+wUGDfrnfVwkmEqFMS8g/qXDgj4a0bdr4LSmT4V+fsQjv2xAW1G0ie6 g==;
X-CSE-ConnectionGUID: qLU3GmB0Ro+wQ5eqBgP2NQ==
X-CSE-MsgGUID: ER7wHY4lRdedH0LmQpBQPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="46665329"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="46665329"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 22:37:45 -0700
X-CSE-ConnectionGUID: MDzQ5uRWR3yh7BPHc9N9Bg==
X-CSE-MsgGUID: WUh2c1mMSP2iv3j3xGejlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="155416311"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 22:37:45 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 22 Apr 2025 22:37:44 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 22 Apr 2025 22:37:44 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 22 Apr 2025 22:37:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PeRBeleUtgiOZ06XQ2xnWeby6bSJThTsj4dqFPGahlMY/g5T7OPL7PZebASguF47+ZcsI3OQBReJeNwNm9kdTZq1QFyeCY2COAowWlFIcMtpwxmhHO4OOns8CK2DNEJlTjh1JKp2sKms6wyD+Sfiv2mhJGKJXFo+7kn+iU51rD4AiSD9m6qlU4X2Dh1iRKhhQ2OXvu9E56vj/H8viRWYBnmBVbwXL0DA0ee5UsfbkwC4g8SRTTUjJ2YuJS/VwXUrt/XdBTEj77VhCcG1x1RPwO6/7b01Au25qkrUhH/vIMvm25+XVMr1lET3L1yFkCEZw6YlCWEltaG6da4gCf5BJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tlKtY6molLOY7Q5Vkgmo2tJ/yanWyIqC17FAZ+tHKMU=;
 b=udkCjt3SsW+zBNI7A4fATpbnuAliqm8fyMoWEA7AgjThOXsKsNIVocvK4kiD8OIETA13ww/1SgJbtNoUl3JCMfOiVvJlvUYlpirWLluhafqYGE8gBzqFYb9t9Rd7JOPpryUezHWH1qhXqvej63dx9b+IXc0vCO5+WOAfXxcHddAwbLl8xIWhz+LcTc+P8RAgVJkiu+7AwB8eH95VB3TI4rBMvF81oJAb15FT5JLYYVOME/V8p01AHltdXgm25reoKZp4i9TVZR/rqbuurFMDfwzTO2bLfE12iY2xsPqZl4t53uXl9hTaMddrpaL4wGZm8HvizMXvf+Sy9Fz5aYtvsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by DM4PR11MB8226.namprd11.prod.outlook.com (2603:10b6:8:182::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.36; Wed, 23 Apr
 2025 05:37:37 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%5]) with mapi id 15.20.8655.033; Wed, 23 Apr 2025
 05:37:36 +0000
Message-ID: <9a71fc97-aa69-4228-8abb-8b43aee58106@intel.com>
Date: Wed, 23 Apr 2025 11:07:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] drm/xe: Add atomic_svm_timeslice_ms debugfs entry
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
References: <20250422170415.584662-1-matthew.brost@intel.com>
 <20250422170415.584662-6-matthew.brost@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250422170415.584662-6-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0018.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::18) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|DM4PR11MB8226:EE_
X-MS-Office365-Filtering-Correlation-Id: 522643b5-fb87-4a4a-b13f-08dd8228f450
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N1BsdXFwUmFMdWVIdGUwRk1mZFVCZWo3dk9BRFJqNllyeENxQk4wOSt6ZEYy?=
 =?utf-8?B?L2JQQ3JIV0hLL3p2VlNBZy9BUzV0aVFUUjdsczdZVWpDQ0hDK25QbmVUUnVs?=
 =?utf-8?B?WVozRnhDdXRPS2RBQXVaM29XZzhnMnJiWFFYS1pCZE1EcmZSMGVKS3ZybDVr?=
 =?utf-8?B?TE80NmNwVlFvZmszdEhtdGtvdWtSQnF4NzlQN0kvcDlpMjJ5a0hRZDlEa1hX?=
 =?utf-8?B?WlZsUm0zdU5XSDlYMktFMVBNTzRSR29ncHI4dHlsY0doV2hnSisrR1QrMXJ6?=
 =?utf-8?B?YnYyYjR4Rno5MzFRQjBRYXFJUFVKakhFeDZOd0FvZTRvRmNVY2dSSCtBWkVH?=
 =?utf-8?B?NDlTTEkzcU9nVjU2MzgxSVZTZTI5bEFKaFk0WklHZkg5MXJEZ3dBUjMxSjlN?=
 =?utf-8?B?eEFDcnlXMVJ3ZnRJZnluYnVjbW4rYWVKYmtvS2JjZUlQVnNmWk16OGVlSDBq?=
 =?utf-8?B?UExEQTc4ejhjSDBiY0Mya2k2OC9aUUtWWmpsLzRHK3Uva3RhYXNSQmRsSUcr?=
 =?utf-8?B?dWQ4WS91QnFWTnVOTzlNZlNvNlc5VnhWT2E5eHNObDdqakZub042OW9icUxh?=
 =?utf-8?B?a092NDhhM2hDeHFvanhVc3FnUEdVZjFnTFBPZFpEanRyaXBkU1ZwSUxtd2dJ?=
 =?utf-8?B?cHBzS2w0RUFvSTZOTG1EUW5YVzBTczZFbGxROFlML3BDZzBETGZlM2hCWTFW?=
 =?utf-8?B?TnVpQnJHS1J1ZmtSdVp5VEJYVU9ubnJJeU9YdCtsNUdyWXM4b2lWUTlwbVF6?=
 =?utf-8?B?TjJDaFpxQ2IxRkx5elZ3czF0LzZiQlZrVlJ4VnNlUjdFTlg5cGMyNnRIeGV2?=
 =?utf-8?B?K3p2dHRkamhxUXEwZWIyaHFlbzl3L3V5b1B6NHFNR2NBWlBLTjVxMk1mS3VM?=
 =?utf-8?B?MG5ibkhGdjViYWtiaEcxSHBzYzJSRjI4a3RzemM5WXJXMHhKbjdJUDVTVG5K?=
 =?utf-8?B?b0V2SXZWMEk3dWNwbWhMMWFuUkNUNFFoWFUvcDU1UU1TYkVzcElIWE50SGhy?=
 =?utf-8?B?WmkzOVYwMXRJWkRvU1F0VU5DbzRtYkZaLzdMdktGVFBMR296Qkh4djZPSzYy?=
 =?utf-8?B?K05vd0txRzBXV21HS2NSV1JnK2Q2TmRmMEhDb0dRSVVLNXdvaW1pNmMzUXlv?=
 =?utf-8?B?SW1tNVZCUGltR2RmaG9XV3Zmc1FXTk1SM0JJU1gwQWNscHVzWjFyam9kYTlJ?=
 =?utf-8?B?bUtZMGdocFRZN1hyQ25DckRjOHlDdGVPNEZPanBReDdSTDZuYkU2QnI1UmtM?=
 =?utf-8?B?VEZvcGZuRUh5UzY5Q3ltSHZrYUJvZmZjcWpTMWxhK01JUllna2taNUVJdU1C?=
 =?utf-8?B?djlPb05Oa3E3QWdJSUwwNEZ5TGI0dEQ2Ynp2MzRzRzRFVzRNZUpQN2l1Sytu?=
 =?utf-8?B?RkhyWFNhTFJGVVFINTU4NXBWZ2JrQlVoSGI1eUVSb0hBVlZuR1JKQW5qMnVz?=
 =?utf-8?B?QkJ1MWcybk5KMDR1UEJaZjlocWR1WUxPYW9McEcvaC8xM3VlWCsvQ3YwYlVi?=
 =?utf-8?B?RnRMM1MrRnRweHRRYkdwcmlPQldxemh4KzNGSmlKK0RBY1N0UG5YekhMZnNt?=
 =?utf-8?B?eUtSYWFwSERlRXhPVmZHbzd3N3dxNmllUjJ4NHJ5K3M0THNiUVpJNVpmaWZM?=
 =?utf-8?B?dkpwTXQ3UGlGQjZ4aTZiM0kzaS9pM1NJWUlMWXdZZEZTcUkva1hBdXU0ZUtz?=
 =?utf-8?B?UjdzSXZRZmdjK3R3NDhuM1ozV1NENWdYZFcwVUpvS3daZm9vVHUwcHlZK2Uw?=
 =?utf-8?B?anQ0YWp0WExOUm55YmpoS0wrTzVGQjZlVytnYXR0cUVNcjVxMGNSVTVYSGw1?=
 =?utf-8?B?ck5DRlN0ampwb0FreUFJcUhLeHhnUXRzTjBVMkdYamxONllReXVYQzJBR05r?=
 =?utf-8?B?ejZ2KzFsMEp2ZHVMZ1d3MnJSdFhBNHpOK2hDMjh4QUFBa2g3aE50Qy8zSTFR?=
 =?utf-8?Q?gKvYiHVlJk8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aU16MkJ4SUlRclp3VVRZelE3YTQrUjkwTlBiMTZ3VDJUN2VmcUpQSm1sRzZ3?=
 =?utf-8?B?dkNhZ3duY1FBQk92TnYvZ1lxOHpZald0MW5wdmFBZmJ2WHBEQUozenYwNkxa?=
 =?utf-8?B?T0psUlBaNnY4SWw1YzFQd2dsYTBxMjZoYzJ4ejZyWkZyY3pKT2M3QWJMWU5i?=
 =?utf-8?B?YXRLRW1MUHVST3NYVmZwczNncWdsQU9iY2dLaGdOQmhrNi9CSUdSZTVGVStj?=
 =?utf-8?B?TTBaRWtkSFk3VWVGQURtUGdqbmg5N25rZjltQVNVcDEzZ3dBNm1sZzNtcGJE?=
 =?utf-8?B?VDlsU3RKSC93MHJWYy9EeGdRcCtvNXZya2JzTjV1Ymh0amQycmFiSEhXTk90?=
 =?utf-8?B?VC9VNTlDMHJFVVJIQ3lDTnE4a0VBTFhXMi90S2V5OVNJemJFZDJTSExXQWk1?=
 =?utf-8?B?T2t2SDlHWUs5cUJwZ2N3Z1lINllLWkJDUXNCOUl4QlJNSjBRNTJwZlNydzB2?=
 =?utf-8?B?UE01M210NURBMXN4c1pTQU1hcG5acVZRcG9NUkF1ZVNQc1kwbVYzUDJRb2tl?=
 =?utf-8?B?RU5lQ2ZGYW5VdVEvcXFkc0ZMNWRtYXRucmMwc0x0L041UHNuQ3djVzh2VGV2?=
 =?utf-8?B?bndMSG5vaWNjMmxIUXV5cWNvZll6Vm5JTTVqTWR2dGFmUmwzTFN5eDlFU3dV?=
 =?utf-8?B?VzRGc29CVUdOTUdqV1oxTy8rTHZMQW1IYjhaN2R6c1hCNFMxLzNJd0gwWThT?=
 =?utf-8?B?aS91KzNRUkRXVldXUUdtVXIyMkM1aGxCclZIb253em1xOUdlNW5RTWNRM3c4?=
 =?utf-8?B?QVdpSnRHbFB2QThadXVINGRkNlZXLzE4aWJRZU9VclhFcm1iZ2VoaEhyMEJl?=
 =?utf-8?B?L3FsV1ZnWVhUK1hSbFZ1WUJjWk5lcXNBREo1bGhlZHMwbm0xQ1JpeUt2WS9V?=
 =?utf-8?B?SkhxUlpRazVXczY1NmVZbFFkbm1Ub3NCZjloekhtWFgyV2pzaE1vSkwwT1A4?=
 =?utf-8?B?azVLdlZLZ251MUZBdFR3Qi9aRmo2ZU5WZS9heFJBNlA3ZHpzL2hjMEpFUTBL?=
 =?utf-8?B?N2Q2ZEdkUHM3SkRkUStxcFJYUVRTTFo3akl6MUlSUmdhKzdQWFYyQUFyd1hi?=
 =?utf-8?B?OUFIbWtYV1FtN3FxNkdKcmN1TENQVmJvUzl5Y0wwSHRiSU5GTmZRUUF6bnRT?=
 =?utf-8?B?WXkyR2x5bGYzYVBiOEFJMlpVWlpKNzcrelR1Q2JVM0Q3R3ZMUXhKOGM0M1lt?=
 =?utf-8?B?R1dWYnpBV1JZelZIa1BXZ0JVdnl4ekhQNzBCMER6dWVtaktNYWZtcjZQQkNV?=
 =?utf-8?B?aGJvQ1Y1RkVqeUQ0eWRyVmdGSnFSRHdSNHJvQnh6djFRWFpyUWNqWDhHZjhP?=
 =?utf-8?B?TlR4dXU0dkxMSENENVJ2YWozbytZaDBpRlZGZWI4UDlZTkxyVk84Y3hXcTJa?=
 =?utf-8?B?QWRQWXpFY3I2RVlJbnhpNEhrQ25WM0RDZ0JibG9CZ0VmTHd6WlBwcElhWFdm?=
 =?utf-8?B?NzdBZlc4TnZNK0JhNXlna2tJcjZsOUVaWktGWkZMdTdiVDBaLzB6WnBKVTdR?=
 =?utf-8?B?NjJUWjEzdWJMakh1UmlKZ0JQVTZmRTZvT20yZk14TlJHd0ZrNm1abUQ2Zm5W?=
 =?utf-8?B?bjBpUGVleWgwbm9xTDhGMXhvSjI0SkRPbk5jNFFtWWd4TWczMkIzZ2ZQUzYr?=
 =?utf-8?B?WFdveDluUCsrbFovaTd0RzNxOGxJOEd4Y21kYXNSdUk5MVVoSzl0ZHZMVklm?=
 =?utf-8?B?YUF6YVRieVFTUDFxOWtoWlFXZzVQMzBYM3JUVVpVYUFGaHdKYVdtbG9tQ3Rv?=
 =?utf-8?B?UTh3ZGE3ekNFemcwamluc0xFT1huZzAxR2xlMTVyZjZlbDYyeW1DcHkxVHBF?=
 =?utf-8?B?OFJNYTBhblZSNkpQc3dNRkpZTE5GT0ZaR1o2LzhZeTJWNHB5U1VsekxNWEdi?=
 =?utf-8?B?ZmpUS3BiYmw4N2Q3Um91cDFDREZGMG93Z3UyVG5pdDlWUUsvWVJMK3hPUnRt?=
 =?utf-8?B?Nzdtc3JwalIyMkJPVVhKbkYvdlhZUGNmVFRoL3d5SngyaHB4eDhVeSsrQmZw?=
 =?utf-8?B?VzVLM3VJQXdVL3hZYmYrVlRyOEtYYWR6OVFWZitXVk5CVXMyN0UwUHlFa2JB?=
 =?utf-8?B?T3BjbzFVQmgrUzdzangyQ01hZCtLcElmTlVCV2ZKSnBXZE1nVXdpU1ZFWW5E?=
 =?utf-8?B?a0lVSzdpa2VZR3ZIK3JIZURwSmw0K01WUTRmMkYxdCtOYUJnS2VqYldKMTBq?=
 =?utf-8?Q?yk6uPCzbWY55eAD2x4K3LIQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 522643b5-fb87-4a4a-b13f-08dd8228f450
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 05:37:36.8580 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T375xF3wr6r6RryTzoSuMIHFkRltj9XHKMc+hSe2CgfbkPebzyVDcxMupJaimOp67MPW2OWjmIR/esf7XRjLYCd/W/H7Vndlm7UaBzALTdM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8226
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



On 22-04-2025 22:34, Matthew Brost wrote:
> Add some informal control for atomic SVM fault GPU timeslice to be able
> to play around with values and tweak performance.
> 
> v2:
>   - Reduce timeslice default value to 5ms
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_debugfs.c      | 38 ++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_device.c       |  1 +
>   drivers/gpu/drm/xe/xe_device_types.h |  3 +++
>   drivers/gpu/drm/xe/xe_svm.c          |  3 ++-
>   4 files changed, 44 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index d0503959a8ed..d83cd6ed3fa8 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -191,6 +191,41 @@ static const struct file_operations wedged_mode_fops = {
>   	.write = wedged_mode_set,
>   };
>   
> +static ssize_t atomic_svm_timeslice_ms_show(struct file *f, char __user *ubuf,
> +					    size_t size, loff_t *pos)
> +{
> +	struct xe_device *xe = file_inode(f)->i_private;
> +	char buf[32];
> +	int len = 0;
> +
> +	len = scnprintf(buf, sizeof(buf), "%d\n", xe->atomic_svm_timeslice_ms);
> +
> +	return simple_read_from_buffer(ubuf, size, pos, buf, len);
> +}
> +
> +static ssize_t atomic_svm_timeslice_ms_set(struct file *f,
> +					   const char __user *ubuf,
> +					   size_t size, loff_t *pos)
> +{
> +	struct xe_device *xe = file_inode(f)->i_private;
> +	u32 atomic_svm_timeslice_ms;
> +	ssize_t ret;
> +
> +	ret = kstrtouint_from_user(ubuf, size, 0, &atomic_svm_timeslice_ms);
> +	if (ret)
> +		return ret;
> +
> +	xe->atomic_svm_timeslice_ms = atomic_svm_timeslice_ms;
> +
> +	return size;
> +}
> +
> +static const struct file_operations atomic_svm_timeslice_ms_fops = {
> +	.owner = THIS_MODULE,
> +	.read = atomic_svm_timeslice_ms_show,
> +	.write = atomic_svm_timeslice_ms_set,
> +};
> +
>   void xe_debugfs_register(struct xe_device *xe)
>   {
>   	struct ttm_device *bdev = &xe->ttm;
> @@ -211,6 +246,9 @@ void xe_debugfs_register(struct xe_device *xe)
>   	debugfs_create_file("wedged_mode", 0600, root, xe,
>   			    &wedged_mode_fops);
>   
> +	debugfs_create_file("atomic_svm_timeslice_ms", 0600, root, xe,
> +			    &atomic_svm_timeslice_ms_fops);
> +
>   	for (mem_type = XE_PL_VRAM0; mem_type <= XE_PL_VRAM1; ++mem_type) {
>   		man = ttm_manager_type(bdev, mem_type);
>   
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 75e753e0a682..abf3c72baaa6 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -444,6 +444,7 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
>   	xe->info.devid = pdev->device;
>   	xe->info.revid = pdev->revision;
>   	xe->info.force_execlist = xe_modparam.force_execlist;
> +	xe->atomic_svm_timeslice_ms = 5;
>   
>   	err = xe_irq_init(xe);
>   	if (err)
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index b9a892c44c67..6f5222f42410 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -567,6 +567,9 @@ struct xe_device {
>   	/** @pmu: performance monitoring unit */
>   	struct xe_pmu pmu;
>   
> +	/** @atomic_svm_timeslice_ms: Atomic SVM fault timeslice MS */
> +	u32 atomic_svm_timeslice_ms;
> +
>   #ifdef TEST_VM_OPS_ERROR
>   	/**
>   	 * @vm_inject_error_position: inject errors at different places in VM
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index d5376a76cdd1..de4eb04fc78e 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -784,7 +784,8 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>   		.devmem_only = atomic && IS_DGFX(vm->xe) &&
>   			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
>   		.timeslice_ms = atomic && IS_DGFX(vm->xe) &&
> -			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR) ? 5 : 0,
> +			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR) ?
> +			vm->xe->atomic_svm_timeslice_ms : 0,

LGTM
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

>   	};
>   	struct xe_svm_range *range;
>   	struct drm_gpusvm_range *r;

