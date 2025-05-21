Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D17DABFBF7
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 19:06:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B64A210F55C;
	Wed, 21 May 2025 17:03:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dp2pWJ3n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56C5F18A1F2;
 Wed, 21 May 2025 16:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747846644; x=1779382644;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=GMLzJlXVxFB9bsUxSH85lSqYj6/IUaMNhO2nwaZKy6U=;
 b=Dp2pWJ3nVW73/kzWGaK0GJxH1vG/dI+Oud7m576E07N7y7OXDUJP9RZH
 4xSwcPw8g/N8PI6LDBk3zh7iMW/Et3VzULucYX5jhMfDZ8xKl97O2ub3T
 DMF/QbdnVIk+gewdUhNIytxNs5Z7Sq7aNz9gUVU9pT4kzTs7cyz/xfSve
 w649n3o8Kc3AjH2L/WQesOTBkVFm0KA8I/LydvNw+molWatjDVvNRkK95
 aaNS6Oh8vRxtd+NebkGjVLLCpOzPhRJVHHyMJiBxsqqtCgdg5hPFexOFg
 pEHaCaaMbcfwzqJQ1zBtdv7uCA8nkJ22+19+W5t/9q8QAjKy6hUDK5/gU Q==;
X-CSE-ConnectionGUID: uXnTKOLyTVqMuXJOuVGxEw==
X-CSE-MsgGUID: 96+egOZXSFOmp+VsoxYyxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="61180110"
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; d="scan'208";a="61180110"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 09:57:22 -0700
X-CSE-ConnectionGUID: o21eXXY2Q1aYkvZ4iTTnOw==
X-CSE-MsgGUID: L36BdLR8T1uFb/9erDKf7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; d="scan'208";a="140681596"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 09:57:22 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 21 May 2025 09:57:21 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 21 May 2025 09:57:21 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 21 May 2025 09:57:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ure0K4l6QqXAivzooy1vZSz6LlpEJtY5STWdFr8OU+O5CquCiwjxW9AwRxAROCX5PP0kkyz4iVL0XsHavzeXS5RuqbJXMuNF1wivl2S4i2GN9OKFeKR9Ga9D6ewdbuBUqZdAEyS6K/HDqRygBC/YENbo2nZxKAk1dquK8/1+bU71osxA6Nh9Aj9rUg+t73jRl5celiyH230heDo0No5visHrFLemSpzXONXymkaQtJIvARpkQjjLUA1mMZzfhGO6AUcpQHZG5rM1IaJL3jbnXrv23WRG4hQ4gH4cAXNJS18k33duVbVhs/+G1t0U4IMzjvMY0wy/Ac+WNFc+C16Gdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iIx//QXBsDlUVOSJC676ColotgN61pPDongrFHnTbF4=;
 b=vhKTZKHEEWKzBX+Lz455OZfZqfjfs9hPysJFqKScDz6pinPjQ1mFhClIMuUjT8nuDJ2+r8JowXY6lQMgBlnslPF7fopXwN+9t3GJ44OxPA+LKMVgHU+OcTzHFfl9Bmy58J5XCiVAafQ4B17k99rgF4yntzIW0YP3BW6VlPGezSrREbd1ArBX0EjXaIOBRJFEgkxD9+pyXnMHhvECQLtWr1JDIlNgQ4uGZc4e7Bg0ZbsDugafXyTu9DhPUBIkhRYhszOBo4I14qEpWvsna+vd7yTeENknF91PZp0ah03l6Sexhn3gBWWOWeCboX6+Hr4kVYC5Hfg33xFsLwTvICXfFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8019.namprd11.prod.outlook.com (2603:10b6:8:12e::18)
 by IA1PR11MB7856.namprd11.prod.outlook.com (2603:10b6:208:3f5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Wed, 21 May
 2025 16:57:05 +0000
Received: from DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::d2ab:ff8b:3430:b695]) by DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::d2ab:ff8b:3430:b695%6]) with mapi id 15.20.8769.019; Wed, 21 May 2025
 16:57:05 +0000
Date: Wed, 21 May 2025 18:56:54 +0200
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 "Andi Shyti" <andi.shyti@linux.intel.com>, Janusz Krzysztofik
 <janusz.krzysztofik@linux.intel.com>, Krzysztof Karas
 <krzysztof.karas@intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>, Chris Wilson
 <chris.p.wilson@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Jani Nikula
 <jani.nikula@linux.intel.com>
Subject: Re: [RFC 0/2] Introduce a sysfs interface for lmem information
Message-ID: <wshmxd3k3nmymj45rxxdplkvjdw2qnxtx6t4a4atuwbf3e5fqx@oldyyglbfis2>
References: <20250519153418.44543-1-krzysztof.niemiec@intel.com>
 <174775327260.81385.8059929394366685323@jlahtine-mobl>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <174775327260.81385.8059929394366685323@jlahtine-mobl>
X-ClientProxiedBy: DUZPR01CA0039.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::17) To DS0PR11MB8019.namprd11.prod.outlook.com
 (2603:10b6:8:12e::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8019:EE_|IA1PR11MB7856:EE_
X-MS-Office365-Filtering-Correlation-Id: ba9a7526-a415-4e42-80be-08dd98888424
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eTRDR0xWY3M5SGE0aVB0aHFMWmNjMjF1Ty9mRVltSEVGNFVaYXBscHJ6aHZM?=
 =?utf-8?B?S3Q3aGxCRlY2Njc3NWk5YWNzR1ZyRVdINjgrR0xlZ2JhUk1Tb2w2bHZ2YzlN?=
 =?utf-8?B?Q2hBLzcwNW82RlA2U203Umw0OXBua1gxd1BLSlNsRi9oQWNsVnlhbTNzaTNY?=
 =?utf-8?B?OHhtM2I2dkV0cVlWbDBZTEk2aXlIUWRXQXFCTUV2Z05zY2owZjRRZFhQdkNT?=
 =?utf-8?B?RzUwMnU0UlhBU0JEQmwrTi94a2IzQTRxRzA1dWZlK1lDSFZiVmxqMDVkd3RP?=
 =?utf-8?B?SzJuWnRnbTlKNVU1VDBpL0JQOGw3UVRTQ3dGV3ppdHNuSnBYMnQwS3JaT0xI?=
 =?utf-8?B?NGdCVW9PZHQ4amVSS2NJRjlCQ1ZNOG9KQkNscnFxbkVtVS9jTTJBczgwYXl0?=
 =?utf-8?B?ZGlzY3FwZVJpQ3NFSWg2enM0SFdnN3owVExZTnVoeUtnR3l3MjB6MUp6SGFx?=
 =?utf-8?B?WmdiV0tpNmdNeWM5cFd0NkhHNXE0NVpQczF4aFdzRGp5YnBoSEhySXlXWllO?=
 =?utf-8?B?WGJ1ZEdNS0lTQjdvOHBKVi83SHgyYlR3RVBxTWZTUUxCT2VTbXkzSWNnYXJi?=
 =?utf-8?B?T2toZzdEeUVYNlhkQk1wVHNXSVJ6QW1obDV2S2FPdUdYSXlYUXl4Y2xvRUtw?=
 =?utf-8?B?MU9Sa2ZYRGR1UmxpSVQ0MlQ1K1RZOElReXZBM1N5WXc2Y3Rhd21taFZaVTUr?=
 =?utf-8?B?enhBc0NBM1JQT3JDbFpKOG01dVJObEdPUllKOFNBSlp2TXF5SmlER2JsdEdE?=
 =?utf-8?B?Wm9jOXFDY0dobFN1azRtd1ZVNFJzNm9JY005MUFtUjFCV21NWFh0aCt6VVVn?=
 =?utf-8?B?Q0FZSUptU2ZDSlEzTnZGb0ExM2RXLzgzWjEwZGtXc05BOWdtRGJ0U0RqQms0?=
 =?utf-8?B?bGM3SWxxV3FtUU5OQ2l4aytkODlxZ3c2N2ExWlp0SEtLOElZaUV6N3FiMDB4?=
 =?utf-8?B?NE9jTUh0NWM5ajVTT0VFUHBqVkNIVHdGWE5aMGxmZmNMZ2t3T3N3RmVPNWs3?=
 =?utf-8?B?cHVqdnA4akFXbG5RdmJOMzlMd1o3cmhiSFpQdnQ4N3FPMEp1T0J2d1R6QlBR?=
 =?utf-8?B?NSt1Q2J4aDM1VlBlU01KUS9PdFpacUtWbFRjS1dET2cwK1gxZmVDa2IwRUNJ?=
 =?utf-8?B?YTJ3c3YzRzlPT05WMXBwaEJ0aUs5M2hZTGp3OGFsMUtBdkpnV2k4WDJRSU9F?=
 =?utf-8?B?MmM2R1QzTWk3MnkxZUlleXZlS2dSVXArZzVHOVBVMG9Vc2orYTN1aEJKQ3lZ?=
 =?utf-8?B?NTN2RVNvTWUxa1BuM0taYWdacVFwMERNbnlvNUk1Vy95aTFqNHJoM2JQbUZG?=
 =?utf-8?B?bzV5QkNUbmw4Z1RteDlHZnQ5R1RZN0NuNUFUUDAwUnprZHRDcnhoVTRhMDg4?=
 =?utf-8?B?M0NvemQrYkxwQTAyaWg5WTRyVmplVjdiMHAyempFL1Vob1F5NzJFT0ZtY2RP?=
 =?utf-8?B?VGRnK1lCZ2VCYUh4TjZSSFhRN0Fwanhyd3lEOTBmRUUyclFnZ3dnZjRnczBK?=
 =?utf-8?B?U0NqYTJFK1pOK1JnQmtOQnhlUkhmUC9jNk4vMmVkdXliUVNON2ZESWN6NVJ2?=
 =?utf-8?B?VzN0WG9ub3hIZS9mQncrZVVrMGVoMTBuR2dDUjA5Q1FkUkY5SHVwMkFzaSs3?=
 =?utf-8?B?RldHV1JLMTk5Q2VGbnZ3RERLVWxtakU4Y3ltYUhzdERqQzNWM0ZCdmdaNTI5?=
 =?utf-8?B?alRNbHczSVdCNmc4Q1d4am5GelZMOUx2dEI4Q25qWExhbFA4ZjZDd0dMMzZj?=
 =?utf-8?B?YzZ0TmpuSituSWxpUWhEVmRwUGhRS1ZjbUpwcnRnZ3F4bzU4VWc1emROT0xi?=
 =?utf-8?Q?SMJMUMSewLwrJB3RmY4Ix45V5wGYtcwoMIiBU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NlphaHA2YXB2cFRJYU9YOWtxS0ZDbTlCakpHVms0M3FEZHlCYjZWQWpzSitp?=
 =?utf-8?B?eGJtcWg5TGd4R2lNWHo1d3lKV2VmTmQ5anhUTDl4L1NmWU1aRGQ4aHlrV0xU?=
 =?utf-8?B?MkpSeVlpcmxxcU9GdVRmZ00wa2VqUVJrZzk1Z0o1VEs1VXNjSEJ2TjRmOGhP?=
 =?utf-8?B?RlQ5RGtnYWtRaEdtU0pPUFNvb3BsNDlPdmNZYXF2bkk0dmdXQ0hvYlRiUDRa?=
 =?utf-8?B?ZFBhZ1hIUnZTQWgwZzRsVzdIMGwrNFBDVytWVTM3RCswRUFvVWZpS3BiRFd0?=
 =?utf-8?B?S285Nzk5c09ETEF5MFQxU0JoUno1cTdvbFdnVkk4SFA2OWY2c2dkMkFwZXFE?=
 =?utf-8?B?bFhtVlVvMDFXdys3YUZRc0c2dnpXN3NqbHBHZ1F3dlM2cmZNQnZpUjJ0bjNQ?=
 =?utf-8?B?Uy95VklrNnJLY29YcnF6ZVlleC9CMGdOMEQ3VkNwRzRETnZQcDNZeGU4VFc0?=
 =?utf-8?B?K240RWNYVVZXdmpUSHJ5T3hwOFBKMXNVeHQ5YjQyZXczdXVFUit6WTJlTFNU?=
 =?utf-8?B?SzNRZGNQU3RQT0dKU0NMT1JRc1ZxZnBnNVJmU1JCemNvcGMrY3h4MWYwRXhV?=
 =?utf-8?B?YmVDazdMcGRqUTZ3c3llV2tBeENWZFFDODljOGJ4dHUrYXVKOVAzd1BEaC9n?=
 =?utf-8?B?bklVK2g5dXliQWthQ3hOZ2NqUXNGL0F1Qmc2c2Q3VHlEOVBvS0c1SXM0MURP?=
 =?utf-8?B?eGRhelNtbmNlRUpoNllOeDZPbWpFaXdnTFRRVmNZVXgyQVRoaS9wSTlyaTc5?=
 =?utf-8?B?dy9pK2dUTlFULzlLM0hyNE5mQnA1VUxBdlpOU3B6RitmSTAxZU1BdytUSDR4?=
 =?utf-8?B?M3Z4V21aSjJuVDd1TGV0U3kvV1RHRkJrNTYxcmcrOWlRRHVKdHBsWDFQbGhx?=
 =?utf-8?B?K1F3c1o3dE1RbWo5c21FWVRvR1Z2QjVwMkN3aFZqcXBjQ2lqT1ByeEIrMkQ1?=
 =?utf-8?B?UWpCNXhGV1d4cWkyN2FmMnhvVlpialVpS3FsdFA3aVB6bUloWk1FWkxSdUJB?=
 =?utf-8?B?eWg3SzdhTm9Ba09adVhtUklLZFQrMlNKdWRZSStMTnFMQWttK0RsamtGanVD?=
 =?utf-8?B?ZS9qNmlzcmhNODd3cm9VT2V6T1VwQUJaMm9GZU16U29ObVJxZFRHWE1mSTlT?=
 =?utf-8?B?NGlhT0t1OEN4M2NmSFhZZVZIV09Od2FiV2VrQUg3cWt3N1hIcVh3YU5EcWxN?=
 =?utf-8?B?RWhINkRYWmVJcnNPZFJXaGwvMkRNSEhXL05qUzdMdjBYSW84UHJWd1VrVlF4?=
 =?utf-8?B?a3NyeVlYSkplZ3dIcW91dGZ5N3hEdGU5UEw0L3dwRExpaXg3M1FTT1hKTXdT?=
 =?utf-8?B?SXBPbTNvK0FqekNQOUhZMno4L1NVQnkyNjVRV0FVS21SVGh4Nk0vS2JwZlpv?=
 =?utf-8?B?ZlNTQTJsOG5RYzhybTJLZUhubkhsMXp6VEl5TVIwQnRMV3YxZDZiK0sxTmdU?=
 =?utf-8?B?WVRLRnpkbjZIZk1RMFNxRVVUakVhVEJ3cGFmSkoxcFdHak1BTVUzYVViZ0VR?=
 =?utf-8?B?c0dHNjI1aGxlR3h3YmRUU2tEUjU0MEppL3QzcmpYVEloMXdKTjc1Sm1mdlBF?=
 =?utf-8?B?ZmVIN2kxcDhyVTBRb3huOEZ1SUFINWhvbjNLUEdWdGtwRnZyWmJwYzNiaUJH?=
 =?utf-8?B?dEVRNTNpQzg0dFZXS2FRMmlvSmx0T2tBSCtSSHQzbEplV1VMN2V0OGFmYzJT?=
 =?utf-8?B?S01ETndhUjZsSEJFM2xLbnR6czByMWJsTGl6MnJpQUl5ajZHbWsvNWZlZHlZ?=
 =?utf-8?B?VlFORFFuMlMyRlVHOFBQeXdrbjB6U0l4TWlldUlSQlJZL0JhOFRqeDByVW9o?=
 =?utf-8?B?cVlFQkFjUnNIUHVNNXVuVHlhNHJNMFBIY1dSeFEvdFpHcVNWTm9tU1lXaHVW?=
 =?utf-8?B?RThxM29zNFFTN2dGOTJOQS9wdlVkdXBycklJTXhmclYzT0xZQk11UENKSnlK?=
 =?utf-8?B?QitmU1RCcWZlZ0svOWFyRGpjdU1FRExQK3hQM21kMFVjK1ZQVFByREdZMEtn?=
 =?utf-8?B?VTdSbURqdDQ2U2sza2VuUDhYTGhBVWZlNnZZQUFKNTlDbEszTFJ4WjhTVklP?=
 =?utf-8?B?czY5L2YyRmwrcDdBRGJTeWpsZlZSMERKdlBONSsvR0pzeEN2V0F1blA0Q2NJ?=
 =?utf-8?B?WE9pOEtmY1BBVjFhQUo3R2RwR2oyc0ZtdW5GR1dvWHVQQnhpWDJTTjQ3YklN?=
 =?utf-8?B?MWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ba9a7526-a415-4e42-80be-08dd98888424
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 16:57:05.7891 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 91iccfL2tL4MlH7B8JlJ/IZJYP7b4KIPUSQfJz/Ncl6MOzDvNhVNmoM9+zX0N8EhqC34ZRqwz3wDBaJV/v9Od9meDQENTwPIXsLdFudVJ6Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7856
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

Hi,

On 2025-05-20 at 18:01:12 GMT, Joonas Lahtinen wrote:
> (+ Tvrtko, Rodrigo and Jani)
> 
> Quoting Krzysztof Niemiec (2025-05-19 18:34:14)
> > Hi,
> > 
> > This series introduces a way for applications to read local memory
> > information via files in the sysfs. So far the only way to do this was
> > via i915_query ioctl. This is slightly less handy than sysfs for
> > external users. Additionally, the ioctl has a capability check which
> > limits which users of a system might use it to get information.
> > 
> > The goals of this series are:
> > 
> >         1) Introduce a simpler interface to access lmem information,
> >         2) Lift the CAP_PERFMON check on that information, OR provide
> >            the administrator with a way to optionally lift it.
> > 
> > The first patch introduces the general mechanism without protections.
> > This will effectively lift a capability check on obtaining the memory
> > information. The second patch introduces that check back inside the
> > _show() functions, but also adds a sysctl parameter allowing to override
> > the checks, if an administrator so decides.
> > 
> > I'm sending this as RFC because I have a feeling that there's no
> > consensus whether memory information exposed in the patch should be
> > protected or not. Showing it to any user is strictly speaking an info
> > leak, but the severity thereof might be considered not that high, so I'd
> > rather leave it up to discussion first.
> > 
> > If we decide for lifting the check, the first patch is sufficient.
> 
> Nack on that.
> 
> CPU memory footprint and GPU memory footprint have a very different
> nature. This was discussed to quite a length, please refer to mailing
> list archives.
> 
> > If we
> > decide against it, the second patch protects the information by default,
> > but with a way to expose it as a conscious decision of the admin. I find
> > it a decent compromise.
> 
> No need for the added complexity if we were to add a sysfs.
> 
> If a sysfs is added, it can be made root readable by default but system
> admin is free to chown or chmod the file for more relaxed access. Back
> in the original discussion time, this was omitted for lack of users.
> 

This is something I missed, my bad. That is of course the better way to
handle the access control.

> Even now, userspace/sysadmin could already essentially use setuid helper
> process that will only report the memory statistics.
> 
> So I'm not really fully convinced this is needed at all.
> 

This is in fact mostly a matter of convenience, as for the usecase under
consideration here (mangohud) it can be assumed that root can be
obtained anyway. It would just be MUCH more convenient for users of the
driver to just chmod the appropriate files and go, instead of setting up
whole other binary just to invoke the ioctl and parse it, and then have
it do IPC with the main binary that can't be run as root. Just way less
hoops to go through. We could just tell userspace to "deal with it", but
then I don't know why can't we just play nice. Is this kind of change
too intrusive for us to warrant the userspace gain?

And it's true that reporting this via sysfs is redundant, but then, for
example, engine information is also available via both sysfs and
i915_query. Is there a particular reason for it to be the case for
engine info that can't be applied to memory info? Access control
notwithstanding, as it can be handled by file permissions.

Thanks
Krzysztof

> And if it is to be added for the convenience of usersppace, it should
> probably then be considered to be a standard interface across DRM drivers
> ala fdinfo or cgroups.
> 
> Regards, Joonas
> 
> > 
> > This change has been requested in these parallel issues for i915 and Xe:
> > 
> > https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14153
> > https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4861
> > 
> > Thanks
> > Krzysztof
> > 
> > Krzysztof Niemiec (2):
> >   drm/i915: Expose local memory information via sysfs
> >   drm/i915: Add protections to sysfs local memory information
> > 
> >  drivers/gpu/drm/i915/i915_sysfs.c          |   6 +
> >  drivers/gpu/drm/i915/intel_memory_region.c | 136 +++++++++++++++++++++
> >  drivers/gpu/drm/i915/intel_memory_region.h |   3 +
> >  3 files changed, 145 insertions(+)
> > 
> > -- 
> > 2.45.2
> > _
