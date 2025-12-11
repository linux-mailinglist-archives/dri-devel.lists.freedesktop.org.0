Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF19CB620A
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 15:02:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8756D10E813;
	Thu, 11 Dec 2025 14:02:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SAFwOIHc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0116910E802;
 Thu, 11 Dec 2025 14:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765461754; x=1796997754;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ndJ37Tnd7CKjedVk1aepuI/BXtdegMCXdZ+pXvm9Dm4=;
 b=SAFwOIHc+MovTfVlzrUuX6+JBrATvRUrpXOmOSc/0t65WynPeHt0S1D9
 4bQcLNYXT3Ct01RmJ24+nVWHGpQIKEAZBnMpkSSKAxBOY2fIDWhJppdnG
 bRTFH1Ms4zjcNxqr0lyWfJjCBS/RrrXZyYw1IhyNSHVAmeHd+iqw8WOWL
 6n5phAdtbTtJgUAXYMrN3AHJ1O+4rYJ+jmYaiK2+kbzMroRl8s4oBHH4n
 PYaS3Rpo+3pQKRZYsrjAoD48nsR7Xib+QbU39CNgIMHwxigfMemSFtFJG
 jqSCsPJWcfviXgVQOY+ELIPIK9sM07/yOfGhLj0un/hpcjlWpyAIY3wKj w==;
X-CSE-ConnectionGUID: Y951GTpsQvSsZMRq1vfKQA==
X-CSE-MsgGUID: qSiWWysrQV+FBb4knEzi9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="90089870"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="90089870"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 06:02:33 -0800
X-CSE-ConnectionGUID: wf4pjsqDTX6Nvmro8Z3Pcw==
X-CSE-MsgGUID: xNmTHd6rQsCvGD9mv3VUMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="220174999"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 06:02:32 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 11 Dec 2025 06:01:38 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 11 Dec 2025 06:01:38 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.24) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 11 Dec 2025 06:01:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YnrJW+Y9YcjgpoPh52Cz6tWhX8mMx+o8lFNm4MLBew1Uav3avXK7kuhjH43DCDHJcUQdGIA3bszRleJmFPyQ2XY69roWmM7/7Rm7c0kmiKSJ0kVzTBI6I8ThPPkfvJsWEoJDGwENZoBXzfEmSn+geYWj0xVPulom5RlY+qmD6Q9cKKZLbF6fRc5uxim94KBN2yXM0KNTt8uXKPOmJsqbPOO9/SMc91bS8g+sild5nIYUSYmMVOLywLK8ZuYbZ4v2fq3nDqcdAe0Ru+BjN59FK/GXXWeRSIaE5vsefmIg6feiigfZUweot8yNiZff2SHhtAU/hGOuUbbYdlOIJ+VgVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fMfaBGxfrTjO88E5fHML9K8KZjvdYw3azebbnR6DJEs=;
 b=fs/Nxb1c0RgKdhlELciAYUn5Tc+wxaDAid5qTj21HOCkcGH5L+mB2o5b0zdbVDTcVrSLVGCcu3/nYn7Dk0hA5hPXFGa6EVEBqRDDS702N2ToR3Z9R7cNd4YCiOZirb8X+czJbl2RcjtQHlik2hSTY0WChs0KUCtjK/PCbQNjZ+/z5lX2YG/D6Ped4BS1OFbOn6eobpbu7B7mYyx2DVmWTyCINrWO01T/zAwhX8Xua1h5c480ndNf7DlMFY7hpAj2rrdpNQ2OQibSTJzq4w9++kRXCROxIHQqtt1p16QCtdTbVgFNghW/q4WxLNbGglKsf0EETLTVLhC6TNz8c5dOtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by SJ5PPF8F93806F5.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::845) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Thu, 11 Dec
 2025 14:01:13 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%5]) with mapi id 15.20.9412.005; Thu, 11 Dec 2025
 14:01:13 +0000
Message-ID: <0e07f48d-0c6e-4779-ae6b-5b4c5d39c895@intel.com>
Date: Thu, 11 Dec 2025 19:31:02 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [v8 00/15] Plane Color Pipeline support for Intel platforms
Content-Language: en-GB
To: Matt Roper <matthew.d.roper@intel.com>, Jani Nikula <jani.nikula@intel.com>
CC: Uma Shankar <uma.shankar@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <ville.syrjala@linux.intel.com>, <pekka.paalanen@collabora.com>,
 <contact@emersion.fr>, <harry.wentland@amd.com>, <mwen@igalia.com>,
 <jadahl@redhat.com>, <sebastian.wick@redhat.com>, <swati2.sharma@intel.com>,
 <alex.hung@amd.com>, <suraj.kandpal@intel.com>, Joshua Ashton
 <joshua@froggi.es>, =?UTF-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Xaver Hugl <xaver.hugl@gmail.com>, Victoria Brekenfeld
 <victoria@system76.com>, Sima <daniel@ffwll.ch>, Liviu Dudau
 <Liviu.Dudau@arm.com>
References: <20251203085211.3663374-1-uma.shankar@intel.com>
 <328637065f79e8ef7e6ca0ab5a22b03887ad6b6b@intel.com>
 <20251211000851.GG4164497@mdroper-desk1.amr.corp.intel.com>
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20251211000851.GG4164497@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0009.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:176::13) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|SJ5PPF8F93806F5:EE_
X-MS-Office365-Filtering-Correlation-Id: fff63c18-4972-48ce-e862-08de38bdbe7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U29vdWUzRDZSYVUrWFNVcXE0YUVpYmEvWStJMkgySEM0aFdSSkhvV1dIbGhU?=
 =?utf-8?B?UWV0QThCc01kMURrS3JQMCtwcXFjZi9FUUhYMWhSQmNjd3pJdmNRZDUwdStO?=
 =?utf-8?B?NmtPeWppWG83NWNiRTR4ZHd5V2tkRWhNN01XREh5cVBIZmZ6aDJydEV3S0JG?=
 =?utf-8?B?ZDZwdDAvelJqN2xneW13QnZza3ZVdFhnQjkvbGt3WW03bGNXYmdaUVdUdXM3?=
 =?utf-8?B?anV6T3dZSkt3Q1BRdW1USEJWdk9yWmJia2ZvbGpQdDZOUlhzdG1QU29oYVRr?=
 =?utf-8?B?NEh6QUYrSTVLNWEwbXY0aUFURlJXczVNZVBJN2tJd0k4YjdTODVEUmFVMCtN?=
 =?utf-8?B?TWJJb05zTHd3YjlRbDB0ZTUzN0NZSGFFMzJPUnVKTFVkNzhxdm1WTm4zTTV2?=
 =?utf-8?B?VmY2VkVnc1dKU0JockZFYktKWHVhYXljWHlablhOZE45MVlsNy9oUzZ4am1i?=
 =?utf-8?B?YVZSSGI3NFEydkVOenB3QnFDYmtaSG9RMnF4WFBLWjM3VXdSM1pEUFlpTlIz?=
 =?utf-8?B?dTNQQWZZZjVVYkpoSHR2S0lNNzZldFBOamhaUlVFa2VzK2c2NFVycVY4dnhk?=
 =?utf-8?B?dGFtY2JoaVVFZWo4UythZXdDZWt0NmU5YTRwMFdIYm0ra203RkU1TXo4ZG54?=
 =?utf-8?B?aVhiRFpVdGtZRTVoS3FMcFpYWEhSaEZJRnJWcWVVYkgrc1dPdzBEQS9raTA0?=
 =?utf-8?B?bTE1bkw3amtJZW5MaVRsbEJPN2VHdzN3ZVlXdkNjTkFqcVNQSmZxRStKeGY2?=
 =?utf-8?B?Sy80RExRREhZdjhDcHlPRE82cGZzVjBIWG1OYmxrT2d4QjFYWEhEb2NXNThC?=
 =?utf-8?B?WW1YenRJYnRxOU9DV1RIWlE0Wk1UV0FXTjM5Y05tVnRjZ2FVVTNrSURmVlBE?=
 =?utf-8?B?OExjZkViaXZFS3pNb1lxcU1OMzFwZDFIN1I3ME1NeGtGdEpKd3p0U3hKTndX?=
 =?utf-8?B?UHFyT1k0NGJFeEI5emJuNWhVVHdJU2ZxYWlQUERYdk5TTithWEwxb3lwY2My?=
 =?utf-8?B?WWJVTlVWaTcwVUZvd1ZIODdxbno5VXUycU9nS0ZHaCtSMUdUSnlXQm1qY1B4?=
 =?utf-8?B?ZE9UNzhtdW5NZllBMURkTVVNc1FDZWUyUWZucTFoVldnVmpGek84TTB3MlNw?=
 =?utf-8?B?QnJoK1F6M3VYcjRHcUpKbVY5RS9qZGdOMWpSa1VtQ3FtNTZIUjNsTnFIaFN1?=
 =?utf-8?B?UnRDTWZEK1ZjUE56Lys4UHhET0FmUURqV1hGSlpJZ1BJWVU0ZE5ZeWk5eUo0?=
 =?utf-8?B?WnNSMkVsQzlPK085b21kWkZTeEpZRjdWRHcvbi9td1Q0UllOeGNhNDRBVGlz?=
 =?utf-8?B?eE0vN3M1dFAzdWZvUW8wUWc5cUpYTGdQS3R4RXV5N0d5QUpubkNBU1hsNEd5?=
 =?utf-8?B?MkhKaVc3RjVYZ2FmUVNFVXUrdkZjd1hyNVBIcm4rVFI0TVg1OTZ3eGJnQW83?=
 =?utf-8?B?WjBibTZKb2ZCSTFvbHMrVGxuTy9CU2ZEaEw3b3JUbEFSbkdrT0s4dEIzamcz?=
 =?utf-8?B?L2F0WFQ4cGtaNG0zSE9FMEQwR3pQNm9OMzBTN3gvNEJaSG93OHlUUjVzTTJt?=
 =?utf-8?B?TTE5S3JVakZGRzdFTmpoK0xTcGxBQWNrS3A4clIwUkk4RTlya2Vvd09PWjdy?=
 =?utf-8?B?aHV0SW50Ymp6Q3dmVEluU0tIYkpnbDhhenErbVh1M2oyZ3Jua0k5NmIweS81?=
 =?utf-8?B?UHk1a1ZYSTNzaTFreE9EK1dFRkhpcFMzVDFkVnovL1hCMXB0Um9YTFBzL1FW?=
 =?utf-8?B?SHVxYXNyNWo5UnpKdHd6QU1WcmtMbVVDM3YzNlVDY2xYZHhVVFV3dXU3R0Qx?=
 =?utf-8?B?Slg4NEZiN3dUdVJNOXFwNnpWVENPc3hSOXVaaUIwMGlHcFU4dVNxbmpCYzl1?=
 =?utf-8?B?b0RDWVFxUzhVRittMmdNeVc4eGo5U2tTbmwyT0pvdFRUT1E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MndrSEtwZ1phNzhnaTU4UXNBMmh1YXBEZC9jZFprRklRODdsMkhMYklXK1JK?=
 =?utf-8?B?ck40Wjl3SWZxY0ZnS2NoY2ZmRVhkQ2NSTmxXWkRjVTRXVVdIejVXNDVZWEJs?=
 =?utf-8?B?VzcycFhBNkhQN2dEWE1nS042ei9OMEhLd1VJR0l1N3BuWTlWaEgyVWUvVG1D?=
 =?utf-8?B?b0ZHcUFndFZNV0hUdlJXcUwvNFN4Q3hDT3o0cGtBTFJTZGd3MFdtVUJMbnhY?=
 =?utf-8?B?LzFoeEs1YzgxelBHRGxLR0M4KzRhbmY3QTJjNEV3bk9qMmZDdG1rRWx1ZFlC?=
 =?utf-8?B?cDI5UzUrUVpLNk0zQk9HdEpPN3BJWDJ2dDEyTTAvRU80TmsvM3ZzeXdYcUhU?=
 =?utf-8?B?YUJnNGJRc0ZpeGoyU1NQYmdpcFZJdHduUSthZ1Zwckk1L2ZQN3hrM2t5V0FJ?=
 =?utf-8?B?eURCMThRNjFSUGpzYm8xMWNsOFM0R1VSMGEzQ2cxL0d3bjNtT0RrbHlMQUJl?=
 =?utf-8?B?azlkcllUZFNDV2tQQ3ZiZGQwaEFTVGpvaW56WUxVYytpL3BHblJNYnpoTDlE?=
 =?utf-8?B?dlBhY1lDZ2lldTNWazMydzUxUDFQcHBsWjdCNk51TjV1TzRPcm14RjFXMTgw?=
 =?utf-8?B?MktIeWVJczFsM3hwQkZyOUYvVmJUOEk0d1IydGE4U0xNd0pudGVOL0thbWkw?=
 =?utf-8?B?Y1VhY1RBdGdJMG1hNW40YWh6cUFxUHRySFBoMDRlYUNtK2xEcWNxbG85cVBD?=
 =?utf-8?B?b1RlZWx3UHpEOWNmd2xYQXREQnYxWjN4UTdxZVppTUNId2ZOcldRYTZ4OCtw?=
 =?utf-8?B?czhEdVVZQXZJc3UzK3BPdUNVT0xNdGxIMG5SZDlTdHRaU0VQOGt5TE9xcGE2?=
 =?utf-8?B?VC9TdWtqZHBXQ0RvV2VyT1F2VDlhWng1WWVuK015aVZLekxZL2VIblJqMU5L?=
 =?utf-8?B?bDdsYmRhMDBlSFJ2dEYrdFNvMFBVSExjcTU4c2E0MXBUc2RXQWhwUnFaOERx?=
 =?utf-8?B?YmlnOWtVRXlOQTBpWCtqK2VFcjBVdmdSVTlyNHRQVXNDZGdLc3U4Q2FMY3Rz?=
 =?utf-8?B?dzN2VVRQUzl5MnJKenRMaVFVR1hOTzZRb0pQK05hY0c2dlFVTW1uZ2NqUDlJ?=
 =?utf-8?B?b0p1SEdhb2pjaG5xdmxYMjR3RGt5NjNtMDdremtybk1GTmlIS1VXcE5FSkIz?=
 =?utf-8?B?bU9VMFY4djZqeUs4dG5HUVdkeldyZGg5VnBvL0t1NzZBaVhtVzBJRDl6YlNp?=
 =?utf-8?B?QzVQelhHd1lSUlhTYThGL05oZHRtYVdpREZkc0NIRkpVcUw1bDNvNTFYY1Zi?=
 =?utf-8?B?a0RTdDR3Z0ZVaENjaGZKNnBkcjQ5WXNOaTRwbThjSmFrbkVhTFJOak9lRnJN?=
 =?utf-8?B?TDlOL0JoMWY5NGRPa1RtRkk5Y0gyQUIyL2JtcHRoWVFRUlh2ZjIzUmpBMGlu?=
 =?utf-8?B?eE84N2d4SjZicjhTRndBRW90ZkNMKzdJZU1zb3kyRDZSUW9pbXZ0TEVhWmd1?=
 =?utf-8?B?TXJOcnoyUDQxQlVUclJOdDhIWm1IZG9FbWRybVdDNW5mNTR6aE9JRS9qd1Ra?=
 =?utf-8?B?N1VYR21SS1RNZVcwc1FKUlJ1eUZraVNjcUQwY1prQ2dXVStoTHJXV0JiR0xp?=
 =?utf-8?B?UVBwZnZCMVNwMmRxK2hrT1JwakZhZyt2RkZlVkZEZ1pRQldsTVBrem1HZ0JO?=
 =?utf-8?B?dFp4VFZyQzdlLzNuVTdkT25LS2s5VGhvZEc1Z1d2OG51NDJwSDJSOVFCU0NT?=
 =?utf-8?B?TjZkZExIM3BhV3g0OFNLalFYbUR6NHlJWGh0S1F1WUJuTEM1WEEwd1hEUGVh?=
 =?utf-8?B?UW5oRURYdi90RlhwTlA4SE9QZEY3bVdVclJsdmpIVThFVnoyKzU5ZEp5eU9U?=
 =?utf-8?B?ZFV6RGRiQ1duTWRFaVlEdm0zTVFpcVJBZ2pWZDRKUWEwM0JsRnhpVlpLRzZj?=
 =?utf-8?B?bXhPbTY0c2VCTm92enA1djZvSEJPWmppeDVqcVl2aUxrQUNwSHBWR2lRNlg3?=
 =?utf-8?B?Skp2RXJBa2NVNWVoWEYzU3huL3dWWnFLNkJxaXp0eUlQSXlXTTdocXZBSWJJ?=
 =?utf-8?B?Q2RTZUU2eUE1OEd2elhTZk0yVHNhSG1iYWdMeFI1WGJlbmEvT0JvQTF5VW9t?=
 =?utf-8?B?bitqc0tZdGdVK0tGVGJwUDhWRFQ1aGl0dGhGc2V2bSs2bUxkM3NXdFpYS29z?=
 =?utf-8?B?SmJNUGlVVGFpd2JkSlFHbUpzWVNJZ1A3eTNBeEtveHRMV1pCQy9BQ2s2L2JG?=
 =?utf-8?Q?BzHzlU38SRR93JVBXIYFcyc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fff63c18-4972-48ce-e862-08de38bdbe7a
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 14:01:13.3638 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IdpmEeMOJwSe6fDDNwnTiFGqPmg/uWSnKVBgIF1jWgt/PP6TRqK5k/adIWPS1lRINijA2Mh71RP9T4Fkodv8thKf1KbPdTog5+uqznwXm60=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF8F93806F5
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



On 12/11/2025 5:38 AM, Matt Roper wrote:
> On Thu, Dec 04, 2025 at 08:44:57PM +0200, Jani Nikula wrote:
>> On Wed, 03 Dec 2025, Uma Shankar <uma.shankar@intel.com> wrote:
>>> This series intends to add support for Plane Color Management for
>>> Intel platforms. This is based on the design which has been agreed
>>> upon by the community. Series implementing the design for generic
>>> DRM core has been sent out by Alex Hung and Harry Wentland and is
>>> merged to upstream tree:
>>> https://patchwork.freedesktop.org/series/152970/
>>
>> Thanks for the patches, pushed to topic/drm-intel-plane-color-pipeline,
>> and sent out the pull request [1].
> 
> Drive-by comment, but does this series have some memory leaks?  Maybe
> I'm missing something, but I see various allocations that don't seem to
> have corresponding free's anywhere.  E.g., the colorop from
> intel_colorop_alloc() doesn't seem to be freed anywhere.  And
> drm_colorop_pipeline_destroy() / drm_colorop_cleanup() don't seem to be
> called from anywhere yet, so I think the state allocated by
> drm_colorop_reset() might also be leaking in the intel_display code?
> 
> Maybe I'm just overlooking something obvious; I haven't reviewed the
> series in depth.
> 

Thank you for the comment Matt. You are probably right, we seemed to 
have missed it.

Kmemleak does not seem to care about intel_colorop_alloc(). Probably 
because the lifetime of these objects is tied to the driver itself?

It does complain about the kasprintfs used in 
_intel_color_pipeline_plane_init().
This is used in amdgpu and vkms too. So they might be missing this too.
Also, I see amd calling drm_colorop_pipeline_destroy() only in the init 
failure path. vkms seems to get this right, It calls it from 
vkms_destroy(). I can ofcourse be wrong.

Anyway, let me investigate a bit further and hopefully come up with some 
fixes.

==
Chaitanya

> 
> Matt
> 
>>
>> BR,
>> Jani.
>>
>>
>> [1] https://lore.kernel.org/all/e7129c6afd6208719d2f5124da86e810505e7a7b@intel.com
>>
>>
>> -- 
>> Jani Nikula, Intel
> 

