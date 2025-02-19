Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A372AA3B037
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 04:59:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B583C10E1B5;
	Wed, 19 Feb 2025 03:59:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hITb7Xwa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA18010E140;
 Wed, 19 Feb 2025 03:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739937582; x=1771473582;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=RX1jcdoZFoKOlv0pKbTh4sSWtPdfx+hEJUB41dx5ZDk=;
 b=hITb7Xwa1GcWPyLWQMABLUeg1FBKgZwTb/R5yMKH7JyijUAx7M7TmowH
 LGj3W2G2nx1YpAuVjYusqGWQ61jmpdg1PszDmA332Alty8N5iMLwGYcXY
 Sv/qObOeNefGLt93xS+2yLUhJ03hvKHd3o1zHE93jsRabuel9QTjHFKbA
 N17ib73flzWEdIwUQg5VKzJsMbGIOp9jVjpYGTfE0TAde3Gj5NL62cYBb
 JzhWFKrKO7SXt8R2ANUwCV9l+hHBkpUE5D7q4KtD/VfoHLL4abrTMo0yq
 cEP1ZH8EGoYOr3UbM2LdcNLAxK5CGLDowPJvVJMgrgkBhVpJIoCpGtHlD w==;
X-CSE-ConnectionGUID: pzYtsDJCSgSICLlRwhDZKQ==
X-CSE-MsgGUID: TqWMJN/fRtCs7ejJ4Lvwag==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="40786049"
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208,217";a="40786049"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 19:59:42 -0800
X-CSE-ConnectionGUID: 3gR4BiB4SFyTbpK4A/5Ebg==
X-CSE-MsgGUID: cwqHVy8AQ+CopNvjrU5yGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; 
 d="scan'208,217";a="115249815"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Feb 2025 19:59:41 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 18 Feb 2025 19:59:40 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 18 Feb 2025 19:59:40 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 18 Feb 2025 19:59:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CfitqmsM1U7QCmKd06hCuRGdsLNeGR75ow6vq8TsH8c5jZ3Q5CT7INu4Jh4c6fACuYdMWhMEZurpA5Huk4RCbw5bQKTLkF32eMH/6ezAyoOdZy5W13Qxb99DgzE2GtG4uBjXUzP6myFJv1q6xsXyE/p2iY8mK+U1VaU5Axu4QyziFVsD4kFuVz9UX4G5TwkQ3tz/pmAKefLzyYHqhroq4zuQ2fyIVP9TfIhhfsbtZJtwUTkWAIkkRfFvAg9ycS0rkMQkRpLtIxz1MfHIwMga1N4DY+Xy2WG1hvDTpJNH73v8CUs4dykMyivYBlL55UcGc+EwnuifbhgY9YFlVCNNCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cIkQUxSN63Nh5JR8a66LIfL5vV8/UwNmPVIPsCe9aJQ=;
 b=Jv7A33501rp8JfBLUZaO8IyzE8L/F5DiClTCra3LO2QH7OibJC921EJhnPx9mKtxLbrDKOUTsv4n9OHztpBv5vjkx1NHbXAXWQsXSgm0imUVfTCuQQzxupzCpFlpyi6QX/k2zfnOrEZss6NzAQvxl7AT63kLGgKV+0kZlKFg+9IIF9Oz4AoqL7r3cDLT5BHnVlrAJOidJdgBCA00F2U+qduVwA6uorpnItHmGV6/ZUtX5KuWtsXHxUIjJJawvQvdLx4UwS+trn+tyofILhOXIe7DXXt/fGe54iljuWsMTNkYEDP1taIPEZIZ+vLpzsOecUsScNwD9J+bGHP+iUn8fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by MN2PR11MB4614.namprd11.prod.outlook.com (2603:10b6:208:268::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.17; Wed, 19 Feb
 2025 03:58:57 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%5]) with mapi id 15.20.8466.013; Wed, 19 Feb 2025
 03:58:57 +0000
Content-Type: multipart/alternative;
 boundary="------------sLwlMNV9jw3uGb6ijG5lIbtV"
Message-ID: <cd095fd7-3043-402a-9e21-c0c85c53f8e3@intel.com>
Date: Wed, 19 Feb 2025 09:28:51 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 01/14] drm: Define histogram structures exposed to user
To: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
CC: <intel-xe@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <suraj.kandpal@intel.com>,
 <dmitry.baryshkov@linaro.org>
References: <20250128-dpst-v8-0-871b94d777f8@intel.com>
 <20250128-dpst-v8-1-871b94d777f8@intel.com> <20250217120808.708b9b4d@eldfell>
 <c423efcb-5ab8-41c2-af0a-621007c6175d@intel.com>
 <20250218181819.11ca41ab@eldfell>
Content-Language: en-US
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
In-Reply-To: <20250218181819.11ca41ab@eldfell>
X-ClientProxiedBy: MA0PR01CA0060.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::14) To IA0PR11MB7307.namprd11.prod.outlook.com
 (2603:10b6:208:437::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7307:EE_|MN2PR11MB4614:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e052713-65ca-4e62-52cf-08dd5099bc38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UHpmYWo0dVUvUWtKZkJFRTZtUDk2dUlOTVcrU2ZwRjRWdWJNMXUrbWVGSWxl?=
 =?utf-8?B?V09GOU1PSmhRdjk3U3QvZUZOS1hqRFJBVkdySFUwTkRtZWRRV1hjVDZPZ2ZL?=
 =?utf-8?B?Y2VncmN1MzVsS1JDTkxJdThXVW8xYUpndU84QlZQTXNCbDlCZE1sV3VxZHh5?=
 =?utf-8?B?b2xUYTNaVlM3QXBSV3EzUDR6Wk5Mc2hXa01jc29JOXBtS1dZai9GeWxWNDZO?=
 =?utf-8?B?WDNab1puTE5mZWN4TXRveU0yU0laNXBSZTk1dXVMdHFlL0kyOSt3K2xWWFNS?=
 =?utf-8?B?ci9JdGhlSjBzOXRKVlVCN0dxZjlVNUIwOEZndy9tNUxCc1E3bjErY09rS3dR?=
 =?utf-8?B?U2FLQkFCVDIxcEFPMCtiOGNHUzJOQXBPV2RCOXN5Z3dXbWhlcmxJTjErNGtJ?=
 =?utf-8?B?cFFEK2VqV0cyc3U3U0l5SjI0bFZrTFBUYld5MUxPRW5DaWZDemtPa1QySVp3?=
 =?utf-8?B?SEVEQXpSbUhma1VkdjRod0tST3FsY05rbGNDUS9VNGxkT2NHZ3VHMjNrT1JO?=
 =?utf-8?B?NUpIMnRyeGMyUkp2NjdFTExaOW1ta1ZjRzM3SHdDbkVFV3duVGh1b3FTaDAr?=
 =?utf-8?B?bVJWOXpnUXZrQ3F2MXRiaytOOGFFVnl6QlB3d2ZXN3ZCTVc4OVYraUFXYmFj?=
 =?utf-8?B?aVpIc1BYSWJVUFlOWUJQMmhXczUrblNrKzBOOWZINXhtRDdNZFE2Vm5tNThs?=
 =?utf-8?B?czBmcVdFbk92cEVUMnNZaEVSK0pnb3cxSTExc2F3TmhiaXNlaFhxSDF5dGFP?=
 =?utf-8?B?ZksrTDZ0YUpmY1NsOTBtNGZUelVPdzFzUUlBVGxjQk1peUdVbVdEb29aeERu?=
 =?utf-8?B?N3k1bWlwRFc3OGhJS25LV2JuRk1udmZrSlJvbjFLaDlTZk1kc2tCSnJndUUr?=
 =?utf-8?B?NlJNL0RnemFxcnF1V2xPTXRuQlBsZ1g3K2tSRHZ5RnhCZkVJckpGelZvVzZ2?=
 =?utf-8?B?bWJIVVFFVzdldnl6NUM1ZytGUXRwaWo1aUF0Q3lOaGlGT3JkSWFtWVI1QjVI?=
 =?utf-8?B?dnJGcVBnbVZPTVcxaFo5Ync1ekVWWDMxQllDT2RGUGlodVJlSVJUK3lTa3Vy?=
 =?utf-8?B?YTdmWnZHT3RyVTIvVnZNblovSEovYm9RVUxLT2psdGRRL3U5OUdoTjNPM3dh?=
 =?utf-8?B?Ym9vVTFpWUVoenVVaW1SRTExZjJ2NHNoM3h3S3hNa1pmMjhWUWJXbHhOQ1NS?=
 =?utf-8?B?dE5qNGwrTjI4RDlRRmFNVWtzMFFsZHZNdXo2VFduWTVuNU5pQ0w2SlhZV0sy?=
 =?utf-8?B?L1VaRlIrcnJjczVXcmVEQU5MdXpIWGFEc3lyTFlwWmRER0M0cXNhYzFvanNz?=
 =?utf-8?B?NkJ1ZW84K0I1UzBNTmljc2RlZ29rUWpvUk5lNnc3UmJkNEk3eWUzY091Vmlu?=
 =?utf-8?B?MmZQSVNLZjhoRmZaQ3hLUTBsZjJSRWRDY0VkRDhzYTR0QlRaQlkyeDdIUGZt?=
 =?utf-8?B?UDQzb1lDbHREK0dNUm1NM2FSWVFPd09LSnVLM3BIRHFzZHh2Rk9LclYzaUx6?=
 =?utf-8?B?a2hXa2t3YkZuTU1hUm5TVExsZTdqdlBCZ1JZTHNaL25PSThYQldJNmlCOVM4?=
 =?utf-8?B?Zjh4S3VBYmhzK1dBc3FZR2Yzc1VsY3NxYlJLT21wbGVaZHdnSzhCdnU3akZp?=
 =?utf-8?B?WVZRckJLOXM4NVN1T01vM0JRSFovY0Q1VkFOb3JLNnFoT3hJNTcrVGdHRElI?=
 =?utf-8?B?VWF3Y2djRVRTdUQyUHhlcEdmSVUxNWovUjN1QlFTNEhEbWxPaThIRThQVldu?=
 =?utf-8?B?WHczd2xwb3lKUjlUT0dCdDZZUVNMZ1JQTmhXQkJ5SWNCcjNhUTlWQThjMjk0?=
 =?utf-8?B?NS9lZ2Y5TU9sektWL3pwcERjRDZYRXpPNC9sdHJEZFM3YVR3MWVmc1l6NDNj?=
 =?utf-8?Q?uCfn8RXpTZ850?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c05wdmtRcmRLZ0JsLzQxdEJraVQ1R0M0T3VxVVdxMlhVSzZmbEhJM05id3Bu?=
 =?utf-8?B?L3lTa3FVLzRuYTlBcTlnN0Zhd2NJUFlHcitIM1dPaEM2SE9mTVZ0RHZpamZ2?=
 =?utf-8?B?ZnBXVnM2dWZHc05nUTlYTW0wMDd4bG1LSnBHMkw0cGs5MndPU1M4ZTdQR0w3?=
 =?utf-8?B?ODkvbUE1NTcwWXVLZ0Vuc201bVNDYUVaREVvaEFaeGc3TXlMZmYzMHN3MDR3?=
 =?utf-8?B?aFNqZUd4TW5FUE94M0FORGlvdmxvbE9QdWx1U1BtSHc5c0Zxa0lrN29pTU1u?=
 =?utf-8?B?a0wyOUNPc3F0bE1UTXBVOUtMQS9tQWZLNmVuRTdhVHVZYWxnK0J0YkJZUjg5?=
 =?utf-8?B?WS90K2twbmtaZ0p5TVg2bzNHSE5JS3B1VkhsWkhxL05jUlY4dVJ1TUl6RnRD?=
 =?utf-8?B?OTYwbHptY1ZoUk4wRUpSbHhGdkFLc1U4OE5LRkdCdS84ZGt3Vjc5RURhZHlG?=
 =?utf-8?B?YjBVc0tmMld4M3V1a1JaTldzZ0dOOW1UVVpmWkRtT1A0dEZVMlZySlJqL0xy?=
 =?utf-8?B?cnpTRi9SbUozT0ErcWFZNzVZZTg5ZWdPTG81b09aN1dId1REa1ZTdnVxazh2?=
 =?utf-8?B?Y1JXMjZPUExrU055K2JJU2dlS2ZKank3M0JLYnpiL2dReWtCdm1sTjZTVFc4?=
 =?utf-8?B?ZWJOSTM1Uyt3dFRQUWZPeVlsN3hmUWVrVS8yZ21RNlFCMjRYSEkrRzlWY0Na?=
 =?utf-8?B?b3ZiQ3ZLSkIzQ1FjamtIbzliQWlQR2tqWHFQOVo2SjRBY3lVTDdTN3VQV0J6?=
 =?utf-8?B?QnJBejFiWTk1cXQwcXB1ZDRMZU12REU0OVFvVHJlQkFqMVI3OCtHSVlvNFE0?=
 =?utf-8?B?TTNMRXJ3OVFCTTZGNnNYNDRrN0lRVTc5N1Zaa0owQ0oxb21scFdxYzB2dWd0?=
 =?utf-8?B?V2N0bzBmaUl2TnQ4Y2lXc3lZNUY0c1A0SjBLbU5oamUrWll4MGd5QVdlaDhR?=
 =?utf-8?B?YWx4eUtNRllaUmM5UmZTYVlKSkQrSTZnV3VsV0pCZzR3Z3BZZWM1NjZqYTNT?=
 =?utf-8?B?ZlBuVDZ4UWFCQW9yZGtaTC9rYlBneEdmOE1Sd1pTMGVjYjBONUVrNHMweWdN?=
 =?utf-8?B?SHQ0Y3ZtdXlOQWowb2pVeDU2VEZvQVFtUWpBUm90OFE1SjJPN0M5czdUSHpQ?=
 =?utf-8?B?czlwdDQ4cnByVTNaMTgwbW1UalRiY2FwSU56WjlmSUJWQUdpN3c2OGl1MXJw?=
 =?utf-8?B?NzBDVmdmeTh1Y0crUFVjRHV2aEcyeUFWdnR3WEx0WmFXRk8xbXZGVVdxdlA4?=
 =?utf-8?B?eEI1cFRTOUxaRmFjUXdEODJ2c296RjBSdkFySkVDVXR5cjhFYWsxM0w0TlZ1?=
 =?utf-8?B?RGtSeDdPNCtMOEdGb3JycVFjMFVscCtkNEV6NU1WOU01eUU1WmtkbUtUamE1?=
 =?utf-8?B?OS9Pa3dCYlRmYWxtc1FOSGhrNGJkcXJNRHQrV1VXWGtzTlFKczRmNGp3c3NW?=
 =?utf-8?B?RVJIQlhUalkvS0JiOXp6NTFPUis2aXlDczcreDd3eXhEZUJ0UWVBYlFpQzRi?=
 =?utf-8?B?NmhINkZrVmJrV0VCK0djakFibUwyZGFadmdwelRJMTFlcVJvN24wNHhtSGVL?=
 =?utf-8?B?K25WZ2JuanRudW1reDVRR3c4eGJqNDk5MEdRVFBVUVNhNTdHTENIbmk4ME12?=
 =?utf-8?B?MllEQitYKzAwWGtNdUdVS3hhRkhmRUxDdTd5Y05xWER1Y2FPUHdQQlFibVNE?=
 =?utf-8?B?OXNmbEN3bnUxeTZtMkpxVUptNnhFQzVEaU1WMWZsejhCZXdhbFdTWjltYnZi?=
 =?utf-8?B?MVAwQUNmNlEwaGhER1hHYndDUFo2Z082NnZNYjF5YW9DM1dUakxXWEdSaVNH?=
 =?utf-8?B?QUJJNGIxdy9MWnBDdUgzMy9vMVZIQXEySFRWWlk4L3VuMGk1UkFWN1MzdVox?=
 =?utf-8?B?eXM1TExibi9kZDNIc0Y2TmEyZFMyYy9aNFBmbUdPM2tLT2RBdjVoME9PbHBn?=
 =?utf-8?B?YWZUZThyWHNlUUFNMFM5TGV5ZjZ6bnF0NjI3eXYydzlMZlNIQnFFcGJCLy80?=
 =?utf-8?B?RlNmZE5vTzJJeEQwY3NOK20zOElTeTRySzlzYjVhVW1rVEZ5dlhCa20xSDNJ?=
 =?utf-8?B?Y3ZzZnVpTnlNbUVOUkNnNTJQYUVQejdSUkw5cW1UYkZCdklUTk8wV0h5R0NY?=
 =?utf-8?Q?OZDY8Xb2gUS0yu1zfd5hD+RdH?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e052713-65ca-4e62-52cf-08dd5099bc38
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2025 03:58:57.7458 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2GOyYSXH6XRfveJQs/A2Id+PGrXF1peNxDITt8SjqYYwmAFcfSUHLbSI+m8g4pee0uqdMZ8WApWGOJWZ4ekAqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4614
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

--------------sLwlMNV9jw3uGb6ijG5lIbtV
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 18-02-2025 21:48, Pekka Paalanen wrote:
> On Tue, 18 Feb 2025 11:13:39 +0530
> "Murthy, Arun R"<arun.r.murthy@intel.com> wrote:
>
>> On 17-02-2025 15:38, Pekka Paalanen wrote:
>>> Hi Arun,
>>>
>>> this whole series seems to be missing all the UAPI docs for the DRM
>>> ReST files, e.g. drm-kms.rst. The UAPI header doc comments are not a
>>> replacement for them, I would assume both are a requirement.
>>>
>>> Without the ReST docs it is really difficult to see how this new UAPI
>>> should be used.
>> Hi Pekka,
>> I also realized later on this. Will add this in my next patchset.
>>> On Tue, 28 Jan 2025 21:21:07 +0530
>>> Arun R Murthy<arun.r.murthy@intel.com> wrote:
>>>   
>>>> Display Histogram is an array of bins and can be generated in many ways
>>>> referred to as modes.
>>>> Ex: HSV max(RGB), Wighted RGB etc.
>>>>
>>>> Understanding the histogram data format(Ex: HSV max(RGB))
>>>> Histogram is just the pixel count.
>>>> For a maximum resolution of 10k (10240 x 4320 = 44236800)
>>>> 25 bits should be sufficient to represent this along with a buffer of 7
>>>> bits(future use) u32 is being considered.
>>>> max(RGB) can be 255 i.e 0xFF 8 bit, considering the most significant 5
>>>> bits, hence 32 bins.
>>>> Below mentioned algorithm illustrates the histogram generation in
>>>> hardware.
>>>>
>>>> hist[32] = {0};
>>>> for (i = 0; i < resolution; i++) {
>>>> 	bin = max(RGB[i]);
>>>> 	bin = bin >> 3;	/* consider the most significant bits */
>>>> 	hist[bin]++;
>>>> }
>>>> If the entire image is Red color then max(255,0,0) is 255 so the pixel
>>>> count of each pixels will be placed in the last bin. Hence except
>>>> hist[31] all other bins will have a value zero.
>>>> Generated histogram in this case would be hist[32] = {0,0,....44236800}
>>>>
>>>> Description of the structures, properties defined are documented in the
>>>> header file include/uapi/drm/drm_mode.h
>>>>
>>>> v8: Added doc for HDR planes, removed reserved variables (Dmitry)
>>>>
>>>> Signed-off-by: Arun R Murthy<arun.r.murthy@intel.com>
>>>> ---
>>>>    include/uapi/drm/drm_mode.h | 65 +++++++++++++++++++++++++++++++++++++++++++++
>>>>    1 file changed, 65 insertions(+)
>>>>
>>>> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
>>>> index c082810c08a8b234ef2672ecf54fc8c05ddc2bd3..b8b7b18843ae7224263a9c61b20ac6cbf5df69e9 100644
>>>> --- a/include/uapi/drm/drm_mode.h
>>>> +++ b/include/uapi/drm/drm_mode.h
>>>> @@ -1355,6 +1355,71 @@ struct drm_mode_closefb {
>>>>    	__u32 pad;
>>>>    };
>>>>    
>>>> +/**
>>>> + * enum drm_mode_histogram
>>>> + *
>>>> + * @DRM_MODE_HISTOGRAM_HSV_MAX_RGB:
>>>> + * Maximum resolution at present 10k, 10240x4320 = 44236800
>>>> + * can be denoted in 25bits. With an additional 7 bits in buffer each bin
>>>> + * can be a u32 value.
>>>> + * For SDL, Maximum value of max(RGB) is 255, so max 255 bins.
>>> I assume s/SDL/SDR/.
>> Yes, sorry TYPO
>>> This assumption seems false. SDR can be also 10-bit and probably even
>>> more.
>> Yes but in practice majority of them being 8-bit. So have considered
>> 8-bit for illustration purpose only.
>> The design itself should accommodate 10-bit as well.
> Hi Arun,
>
> if these are just examples, then there is no need to mention SDR or
> HDR. You can say that if "thing" is 8-bit, then there are 256 possible
> values, and we could have 256 bins or we could have just 32 bins.
>
> But what is "thing"? Let's see below.
Sure will remove these over here and add then in the ReST document.
>>>> + * If the most significant 5 bits are considered, then bins = 2^5
>>>> + * will be 32 bins.
>>>> + * For HDR, maximum value of max(RGB) is 65535, so max 65535 bins.
>>> Does this mean that the histogram is computed on the pixel values
>>> emitted to the cable? What if the cable format is YUV?
>> Yes, again the illustration over here is max(RGB) used for histogram
>> generation.
>> If YUV is used or weighted RGB is used for histogram generation then the
>> mode will have to change and accordingly the data for that mode.
> Do you mean that the HDMI or DisplayPort signalling mode (YUV vs. RGB?
> sub-sampling? bit-depth?) affects which histogram modes can be used?
No this is actually for user as to how to interpret the histogram data 
that is being sent from the KMD. UMD reads this histogram so in order to 
understand the format of this data he needs to know the histogram mode.
> Currently userspace cannot know or control the signalling mode. How
> would userspace know which histogram modes are possible?
As part of drm_histogram_caps struct under HISTOGRAM_CAPS property KMD 
will expose all of the supported histogram modes to the user. User will 
then choose one among the supported modes by drm_histogram_config 
struct(HISTOGRAM_ENABLE property)
> You should also define at which point of the pixel pipeline the
> histogram is recorded. Is it before, say, CRTC DEGAMMA processing? Is
> it after signal encoding to the 6/8/10/12/14/16-bit RGB or YUV format?
> Before or after YUV sub-sampling? Limited or full range?
This again is the hardware design. Theoretically this histogram hardware 
will be at the end of the hardware pipe, i.e after hardware/software 
composition is done.
>>>> + * For illustration consider a full RED image of 10k resolution considering all
>>>> + * 8 bits histogram would look like hist[255] = {0,0,....44236800} with SDR
>>>> + * plane similarly with HDR the same would look like hist[65535] =
>>>> + * {0,0,0,....44236800}
>>> This SDR vs. HDR is a false dichotomy. I presume the meaningful
>>> difference is bits-per-channel, not the dynamic range.
>>>
>>> It would be good to have the pseudocode snippet here instead of the
>>> commit message. The commit message should not contain any UAPI notes
>>> that are not in the UAPI docs. OTOH, repeating UAPI docs in the commit
>>> message is probably not very useful, as the more interesting questions
>>> are why this exists and what it can be used for.
>> I have the pseudocode in the cover letter of this patchset.
> The cover letter won't end up in kernel documentation. It should be in
> the documentation since it is a very explicit and good way to document
> what the histogram recorder does.
Sure will move to the ReST doc.
>>>> + */
>>>> +enum drm_mode_histogram {
>>>> +	DRM_MODE_HISTOGRAM_HSV_MAX_RGB = 0x01,
>>> What does the HSV stand for?
>>>
>>> When talking about pixel values, my first impression is
>>> hue-saturation-value. But there are no hue-saturation-value
>>> computations at all?
>> The computation will have to be done by the user in the library.
> Why does the UAPI token have "HSV" in its name?
Agree, will remove that.
> There is nothing related to hue, saturation or value here. It's just
> max(R, G, B).
>
>>>> +};
>>>> +
>>>> +/**
>>>> + * struct drm_histogram_caps
>>>> + *
>>>> + * @histogram_mode: histogram generation modes, defined in the
>>>> + *		    enum drm_mode_histogram
>>>> + * @bins_count: number of bins for a chosen histogram mode. For illustration
>>>> + *		refer the above defined histogram mode.
>>>> + */
>>>> +struct drm_histogram_caps {
>>>> +	__u32 histogram_mode;
>>>> +	__u32 bins_count;
>>>> +};
>>> Patch 3 says:
>>>
>>> + * Property HISTOGRAM_CAPS is a blob pointing to the struct drm_histogram_caps
>>> + * Description of the structure is in include/uapi/drm/drm_mode.h
>>>
>>> This is a read-only property, right?
>>>
>>> The blob contains one struct drm_histogram_caps. What if more than one
>>> mode is supported?
>> Multiple modes can be ORed. User will have to choose one of them
>> depending on the algorithm that he is developing/using.
> Oh! That did not occur to me. This needs documentation.
Sure will add this in ReST doc.
> Do all modes use the same bin count?
Again this dependents on the hardware design.
>>> If the bin count depends on the bits-per-channel of something which
>>> depends on set video mode or other things, how does updating work?
>>> What if userspace uses a stale count? How does userspace ensure it uses
>>> the current count?
>> The bin count depends on the hardware design. Hence this bin count will
>> be share to the user via the histogram capability.
> If the bin counts depend on hardware only, then the SDR/HDR examples
> are misleading. They seem to imply a connection between bit depth and
> bin count. Instead, you can just say that the bin count is dictated by
> the hardware design.
>
> I wonder if that is a future-proof assumption. I could easily expect
> that different histogram modes would use different bin counts, or
> produce multiple histograms (one per channel), or even 3D histograms.
> One also wouldn't want to use more bins than the signal has possible
> values.
Here we are not considering 3D, hence the name 1D LUT in the next patches.
> Just pondering. It's perilous to try to make UAPI generic if there is
> only one vendor or piece of hardware.
I had this series in i915 and based on the comment from the community 
moved to drm with a generic UAPI. I assume histogram is supported by AMD 
as well.
>>>> +
>>>> +/**
>>>> + * struct drm_histogram_config
>>>> + *
>>>> + * @hist_mode_data: address to the histogram mode specific data if any
>>> Do I understand correctly that the KMS blob will contain a userspace
>>> virtual memory address (a user pointer)? How does that work? What are
>>> the lifetime requirements for that memory?
>>>
>>> I do not remember any precedent of this, and I suspect it's not a good
>>> design. I believe all the data should be contained in the blobs, e.g.
>>> how IN_FORMATS does it. I'm not sure what would be the best UAPI here
>>> for returning histogram data to userspace, but at least all the data
>>> sent to the kernel should be contained in the blob itself since it
>>> seems to be quite small. Variable length is ok for blobs.
>> This point has actually opened up discussion on the design. Sima has
>> infact commented the same with multiple options and which among them
>> buits best. Lets take this discussion on that thread.
> Indeed, I don't know much about that topic.
>
>>>> + * @nr_hist_mode_data: number of elements pointed by the address in
>>>> + *		       hist_mode_data
>>>> + * @hist_mode: histogram mode(HSV max(RGB), RGB, LUMA etc)
>>>> + * @enable: flag to enable/disable histogram
>>>> + */
>>>> +struct drm_histogram_config {
>>>> +	__u64 hist_mode_data;
>>>> +	__u32 nr_hist_mode_data;
>>>> +	enum drm_mode_histogram hist_mode;
>>>> +	bool enable;
>>> Don't enum and bool have non-fixed sizes? Hence inappropriate as UABI,
>>> if architecture, build options, or the contents of the enum change the
>>> ABI.
>>>   
>>>> +};
>>>> +
>>>> +/**
>>>> + * struct drm_histogram
>>>> + *
>>>> + * @config: histogram configuration data pointed by struct drm_histogram_config
>>> s/pointed by/defined by/ I presume? That much is obvious from the field
>>> type. What does it mean? Why is struct drm_histogram_config a separate
>>> struct?
>> This is totally a separate property for enabling histogram. When
>> enabling histogram if there are multiple modes of histogram generation
>> supported by the hardware which among them will be used here and the
>> data for that mode if required(For Ex: weights for the RGB in case of
>> weighted RGB) would have to be sent from user and this struct
>> drm_histogram_config holds those elements.
> Ah, I missed that there is a KMS property holding only a config.
>
>>>> + * @data_ptr: pointer to the array of histogram.
>>>> + *	      Histogram is an array of bins. Data format for each bin depends
>>>> + *	      on the histogram mode. Refer to the above histogram modes for
>>>> + *	      more information.
>>> Another userspace virtual address stored in a KMS blob?
>>>   
>>>> + * @nr_elements: number of bins in the histogram.
>>>> + */
>>>> +struct drm_histogram {
>>>> +	struct drm_histogram_config config;
>>>> +	__u64 data_ptr;
>>>> +	__u32 nr_elements;
>>>> +};
>>>> +
>>>>    #if defined(__cplusplus)
>>>>    }
>>>>    #endif
>>>>   
> Thanks,
> pq

Thanks and Regards,
Arun R Murthy
--------------------

--------------sLwlMNV9jw3uGb6ijG5lIbtV
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 18-02-2025 21:48, Pekka Paalanen
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20250218181819.11ca41ab@eldfell">
      <pre wrap="" class="moz-quote-pre">On Tue, 18 Feb 2025 11:13:39 +0530
&quot;Murthy, Arun R&quot; <a class="moz-txt-link-rfc2396E" href="mailto:arun.r.murthy@intel.com">&lt;arun.r.murthy@intel.com&gt;</a> wrote:

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">On 17-02-2025 15:38, Pekka Paalanen wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">Hi Arun,

this whole series seems to be missing all the UAPI docs for the DRM
ReST files, e.g. drm-kms.rst. The UAPI header doc comments are not a
replacement for them, I would assume both are a requirement.

Without the ReST docs it is really difficult to see how this new UAPI
should be used.  
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">Hi Pekka,
I also realized later on this. Will add this in my next patchset.
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">
On Tue, 28 Jan 2025 21:21:07 +0530
Arun R Murthy <a class="moz-txt-link-rfc2396E" href="mailto:arun.r.murthy@intel.com">&lt;arun.r.murthy@intel.com&gt;</a> wrote:
 
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">Display Histogram is an array of bins and can be generated in many ways
referred to as modes.
Ex: HSV max(RGB), Wighted RGB etc.

Understanding the histogram data format(Ex: HSV max(RGB))
Histogram is just the pixel count.
For a maximum resolution of 10k (10240 x 4320 = 44236800)
25 bits should be sufficient to represent this along with a buffer of 7
bits(future use) u32 is being considered.
max(RGB) can be 255 i.e 0xFF 8 bit, considering the most significant 5
bits, hence 32 bins.
Below mentioned algorithm illustrates the histogram generation in
hardware.

hist[32] = {0};
for (i = 0; i &lt; resolution; i++) {
	bin = max(RGB[i]);
	bin = bin &gt;&gt; 3;	/* consider the most significant bits */
	hist[bin]++;
}
If the entire image is Red color then max(255,0,0) is 255 so the pixel
count of each pixels will be placed in the last bin. Hence except
hist[31] all other bins will have a value zero.
Generated histogram in this case would be hist[32] = {0,0,....44236800}

Description of the structures, properties defined are documented in the
header file include/uapi/drm/drm_mode.h

v8: Added doc for HDR planes, removed reserved variables (Dmitry)

Signed-off-by: Arun R Murthy <a class="moz-txt-link-rfc2396E" href="mailto:arun.r.murthy@intel.com">&lt;arun.r.murthy@intel.com&gt;</a>
---
  include/uapi/drm/drm_mode.h | 65 +++++++++++++++++++++++++++++++++++++++++++++
  1 file changed, 65 insertions(+)

diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index c082810c08a8b234ef2672ecf54fc8c05ddc2bd3..b8b7b18843ae7224263a9c61b20ac6cbf5df69e9 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -1355,6 +1355,71 @@ struct drm_mode_closefb {
  	__u32 pad;
  };
  
+/**
+ * enum drm_mode_histogram
+ *
+ * @DRM_MODE_HISTOGRAM_HSV_MAX_RGB:
+ * Maximum resolution at present 10k, 10240x4320 = 44236800
+ * can be denoted in 25bits. With an additional 7 bits in buffer each bin
+ * can be a u32 value.
+ * For SDL, Maximum value of max(RGB) is 255, so max 255 bins.  
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">I assume s/SDL/SDR/.  
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">Yes, sorry TYPO
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">
This assumption seems false. SDR can be also 10-bit and probably even
more.  
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">Yes but in practice majority of them being 8-bit. So have considered 
8-bit for illustration purpose only.
The design itself should accommodate 10-bit as well.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Hi Arun,

if these are just examples, then there is no need to mention SDR or
HDR. You can say that if &quot;thing&quot; is 8-bit, then there are 256 possible
values, and we could have 256 bins or we could have just 32 bins.

But what is &quot;thing&quot;? Let's see below.
</pre>
    </blockquote>
    Sure will remove these over here and add then in the ReST document.<br>
    <blockquote type="cite" cite="mid:20250218181819.11ca41ab@eldfell">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+ * If the most significant 5 bits are considered, then bins = 2^5
+ * will be 32 bins.
+ * For HDR, maximum value of max(RGB) is 65535, so max 65535 bins.  
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Does this mean that the histogram is computed on the pixel values
emitted to the cable? What if the cable format is YUV?  
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">Yes, again the illustration over here is max(RGB) used for histogram 
generation.
If YUV is used or weighted RGB is used for histogram generation then the 
mode will have to change and accordingly the data for that mode.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Do you mean that the HDMI or DisplayPort signalling mode (YUV vs. RGB?
sub-sampling? bit-depth?) affects which histogram modes can be used?
</pre>
    </blockquote>
    No this is actually for user as to how to interpret the histogram
    data that is being sent from the KMD. UMD reads this histogram so in
    order to understand the format of this data he needs to know the
    histogram mode.<br>
    <blockquote type="cite" cite="mid:20250218181819.11ca41ab@eldfell">
      <pre wrap="" class="moz-quote-pre">
Currently userspace cannot know or control the signalling mode. How
would userspace know which histogram modes are possible?
</pre>
    </blockquote>
    As part of drm_histogram_caps struct under HISTOGRAM_CAPS property
    KMD will expose all of the supported histogram modes to the user.
    User will then choose one among the supported modes by
    drm_histogram_config struct(HISTOGRAM_ENABLE property)<br>
    <blockquote type="cite" cite="mid:20250218181819.11ca41ab@eldfell">
      <pre wrap="" class="moz-quote-pre">
You should also define at which point of the pixel pipeline the
histogram is recorded. Is it before, say, CRTC DEGAMMA processing? Is
it after signal encoding to the 6/8/10/12/14/16-bit RGB or YUV format?
Before or after YUV sub-sampling? Limited or full range?
</pre>
    </blockquote>
    This again is the hardware design. Theoretically this histogram
    hardware will be at the end of the hardware pipe, i.e after
    hardware/software composition is done.<br>
    <blockquote type="cite" cite="mid:20250218181819.11ca41ab@eldfell">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+ * For illustration consider a full RED image of 10k resolution considering all
+ * 8 bits histogram would look like hist[255] = {0,0,....44236800} with SDR
+ * plane similarly with HDR the same would look like hist[65535] =
+ * {0,0,0,....44236800}  
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">This SDR vs. HDR is a false dichotomy. I presume the meaningful
difference is bits-per-channel, not the dynamic range.

It would be good to have the pseudocode snippet here instead of the
commit message. The commit message should not contain any UAPI notes
that are not in the UAPI docs. OTOH, repeating UAPI docs in the commit
message is probably not very useful, as the more interesting questions
are why this exists and what it can be used for.  
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">I have the pseudocode in the cover letter of this patchset.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
The cover letter won't end up in kernel documentation. It should be in
the documentation since it is a very explicit and good way to document
what the histogram recorder does.
</pre>
    </blockquote>
    Sure will move to the ReST doc.<br>
    <blockquote type="cite" cite="mid:20250218181819.11ca41ab@eldfell">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+ */
+enum drm_mode_histogram {
+	DRM_MODE_HISTOGRAM_HSV_MAX_RGB = 0x01,  
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">What does the HSV stand for?

When talking about pixel values, my first impression is
hue-saturation-value. But there are no hue-saturation-value
computations at all?  
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">The computation will have to be done by the user in the library.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Why does the UAPI token have &quot;HSV&quot; in its name?
</pre>
    </blockquote>
    Agree, will remove that.<br>
    <blockquote type="cite" cite="mid:20250218181819.11ca41ab@eldfell">
      <pre wrap="" class="moz-quote-pre">
There is nothing related to hue, saturation or value here. It's just
max(R, G, B).

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+};
+
+/**
+ * struct drm_histogram_caps
+ *
+ * @histogram_mode: histogram generation modes, defined in the
+ *		    enum drm_mode_histogram
+ * @bins_count: number of bins for a chosen histogram mode. For illustration
+ *		refer the above defined histogram mode.
+ */
+struct drm_histogram_caps {
+	__u32 histogram_mode;
+	__u32 bins_count;
+};  
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Patch 3 says:

+ * Property HISTOGRAM_CAPS is a blob pointing to the struct drm_histogram_caps
+ * Description of the structure is in include/uapi/drm/drm_mode.h

This is a read-only property, right?

The blob contains one struct drm_histogram_caps. What if more than one
mode is supported?  
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">Multiple modes can be ORed. User will have to choose one of them 
depending on the algorithm that he is developing/using.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Oh! That did not occur to me. This needs documentation.
</pre>
    </blockquote>
    Sure will add this in ReST doc.<br>
    <blockquote type="cite" cite="mid:20250218181819.11ca41ab@eldfell">
      <pre wrap="" class="moz-quote-pre">
Do all modes use the same bin count?
</pre>
    </blockquote>
    Again this dependents on the hardware design.<br>
    <blockquote type="cite" cite="mid:20250218181819.11ca41ab@eldfell">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">If the bin count depends on the bits-per-channel of something which
depends on set video mode or other things, how does updating work?
What if userspace uses a stale count? How does userspace ensure it uses
the current count?  
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">The bin count depends on the hardware design. Hence this bin count will 
be share to the user via the histogram capability.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
If the bin counts depend on hardware only, then the SDR/HDR examples
are misleading. They seem to imply a connection between bit depth and
bin count. Instead, you can just say that the bin count is dictated by
the hardware design.

I wonder if that is a future-proof assumption. I could easily expect
that different histogram modes would use different bin counts, or
produce multiple histograms (one per channel), or even 3D histograms.
One also wouldn't want to use more bins than the signal has possible
values.
</pre>
    </blockquote>
    Here we are not considering 3D, hence the name 1D LUT in the next
    patches.<br>
    <blockquote type="cite" cite="mid:20250218181819.11ca41ab@eldfell">
      <pre wrap="" class="moz-quote-pre">
Just pondering. It's perilous to try to make UAPI generic if there is
only one vendor or piece of hardware.
</pre>
    </blockquote>
    I had this series in i915 and based on the comment from the
    community moved to drm with a generic UAPI. I assume histogram is
    supported by AMD as well.<br>
    <blockquote type="cite" cite="mid:20250218181819.11ca41ab@eldfell">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+
+/**
+ * struct drm_histogram_config
+ *
+ * @hist_mode_data: address to the histogram mode specific data if any  
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Do I understand correctly that the KMS blob will contain a userspace
virtual memory address (a user pointer)? How does that work? What are
the lifetime requirements for that memory?

I do not remember any precedent of this, and I suspect it's not a good
design. I believe all the data should be contained in the blobs, e.g.
how IN_FORMATS does it. I'm not sure what would be the best UAPI here
for returning histogram data to userspace, but at least all the data
sent to the kernel should be contained in the blob itself since it
seems to be quite small. Variable length is ok for blobs.  
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">This point has actually opened up discussion on the design. Sima has 
infact commented the same with multiple options and which among them 
buits best. Lets take this discussion on that thread.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Indeed, I don't know much about that topic.

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+ * @nr_hist_mode_data: number of elements pointed by the address in
+ *		       hist_mode_data
+ * @hist_mode: histogram mode(HSV max(RGB), RGB, LUMA etc)
+ * @enable: flag to enable/disable histogram
+ */
+struct drm_histogram_config {
+	__u64 hist_mode_data;
+	__u32 nr_hist_mode_data;
+	enum drm_mode_histogram hist_mode;
+	bool enable;  
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Don't enum and bool have non-fixed sizes? Hence inappropriate as UABI,
if architecture, build options, or the contents of the enum change the
ABI.
 
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+};
+
+/**
+ * struct drm_histogram
+ *
+ * @config: histogram configuration data pointed by struct drm_histogram_config  
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">s/pointed by/defined by/ I presume? That much is obvious from the field
type. What does it mean? Why is struct drm_histogram_config a separate
struct?  
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">This is totally a separate property for enabling histogram. When 
enabling histogram if there are multiple modes of histogram generation 
supported by the hardware which among them will be used here and the 
data for that mode if required(For Ex: weights for the RGB in case of 
weighted RGB) would have to be sent from user and this struct 
drm_histogram_config holds those elements.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Ah, I missed that there is a KMS property holding only a config.

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+ * @data_ptr: pointer to the array of histogram.
+ *	      Histogram is an array of bins. Data format for each bin depends
+ *	      on the histogram mode. Refer to the above histogram modes for
+ *	      more information.  
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Another userspace virtual address stored in a KMS blob?
 
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+ * @nr_elements: number of bins in the histogram.
+ */
+struct drm_histogram {
+	struct drm_histogram_config config;
+	__u64 data_ptr;
+	__u32 nr_elements;
+};
+
  #if defined(__cplusplus)
  }
  #endif
 
</pre>
          </blockquote>
        </blockquote>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Thanks,
pq</pre>
    </blockquote>
    <p>Thanks and Regards,<br>
      Arun R Murthy<br>
      --------------------<span style="white-space: pre-wrap">
</span></p>
  </body>
</html>

--------------sLwlMNV9jw3uGb6ijG5lIbtV--
