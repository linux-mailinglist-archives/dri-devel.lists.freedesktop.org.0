Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77857ACC3A1
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 11:53:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D443610E15C;
	Tue,  3 Jun 2025 09:53:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S85qToJX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDCAE10E13E;
 Tue,  3 Jun 2025 09:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748944414; x=1780480414;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7DI3I/FoNuy/t8uANn7Pv7P7OrSp15u9EcYJkBsRu6w=;
 b=S85qToJXvFGuGo5V9M9s5qsU44eCj3DCpeL9O+LqzwpAbQbggK35Vwlw
 pwx1afjBRPo4WoPtToaDtGAuTZEeZlzCUmezeHmAeazzuX0Z3jCK3AR8f
 m/O7FpL5P/rm05uQIxHjL4123Kx0Og3LDw1gyXYPGy9xIljspY83z3B9M
 s4ZaPj4F4J81Gqu1t0Rx1bKUEZQhRfgnoJa5san+wtWYDZ6/jb+YyohKO
 SgFbofBGxC+e+Rwli8iMgzxjLU+3OqFqlsLThgEU30C8jafS4/nUi621p
 I5SqR9bEQf2PlR2eA365/bVzcSdjC6HUmWb5QsS40oZrWuU1CPRaXwdPq A==;
X-CSE-ConnectionGUID: CxCRB9ufTySPY9pox6hB3Q==
X-CSE-MsgGUID: iTWc/d2GQ3W7DLyF55/ukA==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="61595619"
X-IronPort-AV: E=Sophos;i="6.16,205,1744095600"; d="scan'208";a="61595619"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 02:53:31 -0700
X-CSE-ConnectionGUID: UFiIk5oDR+2fYziWcrI0jA==
X-CSE-MsgGUID: tndNnpn/TDWYkUb9CwukZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,205,1744095600"; d="scan'208";a="175760318"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 02:53:31 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 3 Jun 2025 02:53:30 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 3 Jun 2025 02:53:30 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (40.107.95.62) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 3 Jun 2025 02:53:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dg3XL8hHS5RleH1PmMDOA8G6a7aNmNbKo4HTUAQIJJKKKlQd2cWGIlUDdu0pzlKJUVaKimKfzg/N9fYTI1/kEc/2N/52ZAybBov+/L1boSuevBVTd4yl1RptrHiRou4jIWrQJFUs3gSiemYrJ2ZZXwdxul/PPhfaQDpPMHSp+4UlI1/h9qOr+OiNyCZTdLp9/Ne+SDLJkggRnh/wJDmtPMZ8xb+Ne5zoS/jHwBFgmXvRL0FqcM62pZuY3qGbslO3R14/zY/dt1KowQiX0Af+9jjs9qD5Og8vMz6/impuBF+fsTKK3k+696XJJmFpeTDch4jtO2nMCAnTWtYE/T676A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BWUtGSKQQYBhqHH+wTXEhl0PMMGC9YfYUa6fMwcRUMA=;
 b=hVcWmvPOKNzWysu66kLjD1pYOgwisDUS3XaQ7e16R5g+P3i1bF9byTb3xqDLiTCIQfTc3FzKplp0xu22/abmFACJnNSLa4V5dBFQWZufMW43d+WzoIG/QQ/jWi20wYdQSgJPw83g3hpijjTOIP+K4ienktgZ31WKrLEgprDti1uOUCEjwTTgzk7Ip3QsN9TfEM8jOsNHf+qcIZ55iRk1KzCjsqadMg18GWw75AK7L7ZcH9wPiPAjwI2t2RFaY1HnQJ3fy1lcvJGItfslvELY96WgzN/bzFqRCG6g992ljJ01ieFCrf2EAS2ahQX8eNexJrJJbf1Vcqiel8KPVBbeiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 BN9PR11MB5273.namprd11.prod.outlook.com (2603:10b6:408:132::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8813.20; Tue, 3 Jun 2025 09:53:27 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%4]) with mapi id 15.20.8769.025; Tue, 3 Jun 2025
 09:53:27 +0000
Message-ID: <4263798a-b035-41fb-97ab-32e8ac128a98@intel.com>
Date: Tue, 3 Jun 2025 15:23:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] drm/xe/xe_hw_error: Handle CSC Firmware reported
 Hardware errors
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <lucas.demarchi@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <raag.jadav@intel.com>, <frank.scarbrough@intel.com>
References: <20250603081409.1509709-1-riana.tauro@intel.com>
 <20250603081409.1509709-5-riana.tauro@intel.com>
 <9199cb44-6db3-4a1d-87db-24d018ad0288@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <9199cb44-6db3-4a1d-87db-24d018ad0288@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0080.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::10) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|BN9PR11MB5273:EE_
X-MS-Office365-Filtering-Correlation-Id: b81cf599-903c-4c4d-2b0e-08dda2847ce8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WDNPMXdZdTZ2WGJlMTdhcm0rR1hKY1k2WUlwS1JZYThTYW1tN1lNeEpKUlVO?=
 =?utf-8?B?alFhYXpRYXhQWWVFYStxWjN0VEx3NU1ESXV2aGtBRWM2MHN2bXFRWHVwQXRV?=
 =?utf-8?B?ejJzYU9lUytpVlpPc0MxbUlteWJYVldkZ3Y5MHdiK0tFejNpNG9jMGN0RGhQ?=
 =?utf-8?B?TS9TaUtmZVl6c3g4R2VoM1FROFVyYmZmZyt6Y3lqZXBWNlY0STJ0SDllNlZU?=
 =?utf-8?B?V2U2MjF2NjBGeTJIRFhUSHYrVjM4c2dIMkpvcEVHNTJNRXRRb0x1NEkvaXZE?=
 =?utf-8?B?TzdUcDFvOU9vckRja3lhRkg1cDZncWxoSE13VXFBOGJxNFc3eXNwY2JFWnIw?=
 =?utf-8?B?dGs2bVcvZnBKTjloSms0MTk2cFp0TFBZdDZiTjh6YzJMdXFwdHhoWEF6UHFx?=
 =?utf-8?B?Y1AwUUhzODhFVlZETWRwTC9odm5zQnFwTUhXd0gyTEVFZWJaN0pnNWdjOG5D?=
 =?utf-8?B?QWtDVUl6bzlrdXdoZWlXb0RiVEVGYTJwRGJSazhpcmMxR2xzL0d3S29FZkph?=
 =?utf-8?B?KytJL0dCTzZtNDFGTXc4Z2FxV2NkbnJ6TFgwQzhFTEo1ZlUwOEkxWVJBbjZj?=
 =?utf-8?B?L1hLTEwydXBiNE9OTWFuYkdJTmdkdi9WOTcwdHh2cW5iN2YzTGdtN05zbjlF?=
 =?utf-8?B?RmNOWmF5Mk1RTUNXMk44cHhTaWN0VlZ3ZUhDbGtuTzV5dG9WZVlObjE0eXVG?=
 =?utf-8?B?eCtzRlIrVWJlZkh0c2VrNDRFTXNvSXpjL2VyajVBOCswOTFwdDRvd2tvc0JQ?=
 =?utf-8?B?TmR1MHo0K1NSTWgzRGRFWGdwRzJOR2ZYdFdBU0w0K2VzTXdtWm52cVdxVDhy?=
 =?utf-8?B?YXNrZVFyb01xTEh3ZW1qUll0cXpvcXRESlJUamtIaW5TcWFDekJUNER4WDhB?=
 =?utf-8?B?cXJYVGRCUFI3dHUwVHQ3K3FUaHVVb0h1M2xlelAzZ2xDN0pUUll3aUV3eU4x?=
 =?utf-8?B?amNzVHJOa0M4TDlYdFlGOHJJUWxEc04xa1NVT0I3RGw3UFN2RkRTUElKckZR?=
 =?utf-8?B?cXc0SmFGNkJqYzdveHpVTWxWTDd1ZHoxUmNMVU1KR1FBdUlKWnU3OStqR3hK?=
 =?utf-8?B?bkY0NlJuRTRDV012WkhvMWxDSjRPNWZEcHJVVmFSZkRQVEVnVmJLMnN1ZDlB?=
 =?utf-8?B?cFliQ09WRzNZb3dMZk40eEhDZUdEWHFPZ1UxWE00VkhEaWorNHRmdUdGV3hJ?=
 =?utf-8?B?QUVwVnBicnQ3Y3JzcFA4MzJsNTNFbDlYM3JRRXdOZnk2OUNCaTIvak5Vb04r?=
 =?utf-8?B?OWxlci8rN2pMQ284dk5zZVM5blRIN2Z2NlQvVk1Ud0tmdEMzR1V0QUd5WUlS?=
 =?utf-8?B?R0twOUZzZVN1OExvajdpTEdPVnI5WmtDWmRnR3Q4UFR5SktkRVJvTFBWZG1P?=
 =?utf-8?B?SWRDcVhvMkNzbk5waUpGL0kvYkNVSDhNaTNpWXk1ZUNONDVjM3ZObUtEbVFi?=
 =?utf-8?B?VmU4c1FSNjVjNlpTVzdEUmo1anB5NXRETUUxSGVwUVdLcjJKNFJRbDZKRlNP?=
 =?utf-8?B?RDFZSzlmeGdTckQ1QmtyT2hXN3JVOU5BN2xjaFpMd3ByL3N2Mk1oSEwwa0My?=
 =?utf-8?B?cmNrRG9ZeWY2QXVDQVY0K2lTVTk3cWR2a3V0VURmbU1MZmQ1Q3hQb3hNRW00?=
 =?utf-8?B?ODZiKzVTQ2hvc1c0YVJObEtuaUV6Zzgza29ZNXZycTlFcXJuWG5mb0c1UU0z?=
 =?utf-8?B?dWd4WU5zWENLUmorMENQSWh0eWJnVjFSVUxuY2lmSk5STnZ2VU9nU0xISzVE?=
 =?utf-8?B?aldtZjIxdzFmRExGNjYwcWhSYjJ5bU1HQ3M2UE5wUU1ReElHeXNNSTY5dWZE?=
 =?utf-8?B?RjZDRys4QkpkRUoxR0VrWnlWYW04Tm1hcElkK0t3NjFrUHJVRkI4dzhQS2E5?=
 =?utf-8?B?L2lQQ2pYQk5WbkNkSFhQMmNCcnd0ckhEVHJXM1NCa3lzeiszZ05xMnpkcS9B?=
 =?utf-8?Q?gVeXqudKygc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bCtKSW5mb2o2WnJOV2k0T2xLVms1MlpJVVlKYTJkeXZ0NEFpREJPTFV5bGho?=
 =?utf-8?B?RjQyQ2VRaVh0RlFuY1cySnNWUVh4WjZFNzRUMSt1aTZ5Y0ZCbGw1MksxeitZ?=
 =?utf-8?B?MVdNU1VwNXdUVzRXUU1OcFY5RDlGdlIyeUZUSmhOUUJaTXRDV0hjMDR6Vk9l?=
 =?utf-8?B?Q3lOSFBEblFQU3ZKVWd2ODZMcWFEMjV2N2t0ZURKZTZqWDdCM3FOZXJiNXVi?=
 =?utf-8?B?Vm9ZdFBlQldESTRUTGZnaHE2N3Qwc0xxNFAzd2tidktEdGRqS25mamUvQ2Nw?=
 =?utf-8?B?WVlMMU1QNk9jd0RrMUJMaUNjK0JqWXZMVnNJV0VoQitsdjJjY0UySzJqWWVB?=
 =?utf-8?B?bmxyMzhHZHNrUkExLzVvRlRXRlJPYitQbU00SFdoTDI1RXZoRzNDdXJ5dHp0?=
 =?utf-8?B?S3BtbnAwcnQ5Z05zV25tZGlGYmwxVWNmMTAvRFBoZ2lnbytHQmgwWTVaK0Rp?=
 =?utf-8?B?WEpaNUR6V3pNbUpWcFhaY1paZlNFMVo0aDlnRDI3QnJ5VUhZMFFFSXBwQzAz?=
 =?utf-8?B?ZjF0N2V4MVFLQk51WDZPbk1qaWYyTXI1dHUza3ZmckFBQm5SLzI1L1VPN1BI?=
 =?utf-8?B?b1oxMkRZaUpPYnVmS1VSUzEwTVZPNHFGRDArTGwyeWZ2WjVqMnRZQytqbG5q?=
 =?utf-8?B?cjRPTDgvQUxsMWJCaXpoU0V4eGFheTdXOHAxR2tpNXlkNHF3NUplSnBZcytv?=
 =?utf-8?B?TUhVdTIxQmI3SW5JcU5xVjdMajhWNm1NWTN3VHRpOW9xdWdiajRtK2dOanFR?=
 =?utf-8?B?T2pzZmJNL21qYndyMVhrODZqTUFKd2xQWDQ1THE3bnRudWJmakQvTXEvaUor?=
 =?utf-8?B?c09QbnlhR0RIWFd0bE1FK0JsR1JLd0xyM010dUc1NENhQ0dsT0V0L0tYMGRC?=
 =?utf-8?B?YU1DbVZZT2xrcGVCS2hrZG1oS05NbVhsNWt2RFRPTzdKVTVJeExzM3Nndkp6?=
 =?utf-8?B?b3QwbUdnOStNRHlIQnNBVXlNTWxYRlJhbHg4Z1BWTzl4ZDgxaERrOExiUFhB?=
 =?utf-8?B?NnloVjcrd0hZam93V0liNGJET0Q3SU5pbUZNT29BeEwrcVhpRGlrTHZneWpk?=
 =?utf-8?B?a2Z0SzV0WEVEalFRRERGKy9ZMWVZOGVIUmgvK1cyVHU0Y3RjcnJYaGJNdisv?=
 =?utf-8?B?UzFrRmdXUk5OVks1UmdXNW5UMTZnTzAxN2xZbUo1N0sxSFRoeUgrZHRtRUwr?=
 =?utf-8?B?R1RHa3V4UG41Y09WeHhUdHJLdUk1T0NrenpWb1BDOHlkakI4Yk9CRlhOMFRW?=
 =?utf-8?B?alVOdVJUK0lJU0pObWRML1dBQ1lzcU9tN09qVUZUbnNlNTROYjA1UDFYQm9Z?=
 =?utf-8?B?ZHNETG11UzI0VlhsU1ZYWUl0QUpkUzYyU3JoeVJrbFd4a3R0cFdMY1NWQkJE?=
 =?utf-8?B?ZkwxRit6a3A1dkUzckpPYXRobFFieDE0OHo5TGtpTWlRTUMyWEkzZHRRckRt?=
 =?utf-8?B?UWNmblNXN2JYdXpmdGU0VkRKRzkySmRDdHh5MlhuLzJkQ2dnTHFMQ3RQNXk2?=
 =?utf-8?B?QVlIdXpJS2hBd2x6OWI5ckJsSTNRWjdKU0ZCWEI4blZxYlZreVVxaHQvK2Y2?=
 =?utf-8?B?ZnhzcmRPTW9iYVg3WjJyeVlJc2NSSk43aHVLd0ZFQk1UVnF3Q09wK3RwaXFh?=
 =?utf-8?B?WTJReWtndHRkU016a0Vka0t4NzB4NDhNMCswSU8rcjlSdXhyTTdYN284SThK?=
 =?utf-8?B?NHpFdUVhY0h5RmpQTmVjZVAxTkZrM2pObXZNdU1JaGM0eVFYdmhvQ2xqUDVW?=
 =?utf-8?B?V0xHLzdibUpneGtwVzdEWm5lU0NaSTFESENVTEV1Q2FLSStUNDhVeWhHd2Rn?=
 =?utf-8?B?T0tkcE8zQllLWldoTEtNY0RMbmFpS3cxcWZGNHdJK0hicDFUQlptcHp6UEYy?=
 =?utf-8?B?eFJ1YnEwbjBnQ25mSEVGSlA2UUUySnJOeGVmKytZbDFKTDAyR01GVkdvcnRh?=
 =?utf-8?B?VkZmUWd1Q1dkMGcvRUo3VUNyVXNTOS9TNGJXcE9KK0xtTisvellqNW4yVStS?=
 =?utf-8?B?a2tYV3orTGh3YTNiZ1JLZmNDdnc3M2VQKzJPMXcvWkFwcEoxU21SbGVGL091?=
 =?utf-8?B?NDczay9qenl3WVZXbEpoQ0JENXFPLzNPR3FNTUFIVlRUa0l6UG82dnc4VVUy?=
 =?utf-8?Q?VpoqSSwuIKMGz+We4gmhq6DaA?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b81cf599-903c-4c4d-2b0e-08dda2847ce8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 09:53:27.5421 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: porH4MKslaBYRDZZvcEJXIqjmq/CZJY3xwQchPPFQ5tZmSbiVSRIqvz3ONgB3zlY9ouBsVNVReBIOVVnBQk/5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5273
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

Hi Himal

On 6/3/2025 3:01 PM, Ghimiray, Himal Prasad wrote:
> 
> 
> On 03-06-2025 13:44, Riana Tauro wrote:
>> Add support to handle CSC firmware reported errors. When CSC firmware
>> errors are encoutered, a error interrupt is received by the GFX device as
>> a MSI interrupt.
>>
>> Device Source control registers indicates the source of the error as CSC
>> The HEC error status register indicates that the error is firmware 
>> reported
>> Depending on the type of error, the error cause is written to the HEC
>> Firmware error register.
>>
>> On encountering such CSC firmware errors, the graphics device is
>> non-recoverable from driver context. The only way to recover from these
>> errors is firmware flash. The device is then wedged and userspace is
>> notified with a drm uevent
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/regs/xe_gsc_regs.h      |  2 +
>>   drivers/gpu/drm/xe/regs/xe_hw_error_regs.h |  7 ++-
>>   drivers/gpu/drm/xe/xe_device_types.h       |  3 +
>>   drivers/gpu/drm/xe/xe_hw_error.c           | 65 +++++++++++++++++++++-
>>   4 files changed, 75 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_gsc_regs.h b/drivers/gpu/drm/ 
>> xe/regs/xe_gsc_regs.h
>> index 7702364b65f1..fcb6003f3226 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_gsc_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_gsc_regs.h
>> @@ -13,6 +13,8 @@
>>   /* Definitions of GSC H/W registers, bits, etc */
>> +#define BMG_GSC_HECI1_BASE    0x373000
>> +
>>   #define MTL_GSC_HECI1_BASE    0x00116000
>>   #define MTL_GSC_HECI2_BASE    0x00117000
>> diff --git a/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h b/drivers/gpu/ 
>> drm/xe/regs/xe_hw_error_regs.h
>> index ed9b81fb28a0..c146b9ef44eb 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
>> @@ -6,10 +6,15 @@
>>   #ifndef _XE_HW_ERROR_REGS_H_
>>   #define _XE_HW_ERROR_REGS_H_
>> +#define HEC_UNCORR_ERR_STATUS(base)                    XE_REG((base) 
>> + 0x118)
>> +#define    UNCORR_FW_REPORTED_ERR                      BIT(6)
>> +
>> +#define HEC_UNCORR_FW_ERR_DW0(base)                    XE_REG((base) 
>> + 0x124)
>> +
>>   #define DEV_ERR_STAT_NONFATAL            0x100178
>>   #define DEV_ERR_STAT_CORRECTABLE        0x10017c
>>   #define DEV_ERR_STAT_REG(x)            XE_REG(_PICK_EVEN((x), \
>>                                     DEV_ERR_STAT_CORRECTABLE, \
>>                                     DEV_ERR_STAT_NONFATAL))
>> -
>> +#define   XE_CSC_ERROR                BIT(17)
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/ 
>> xe/xe_device_types.h
>> index fb3617956d63..1325ae917c99 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -239,6 +239,9 @@ struct xe_tile {
>>       /** @memirq: Memory Based Interrupts. */
>>       struct xe_memirq memirq;
>> +    /** @csc_hw_error_work: worker to report CSC HW errors */
>> +    struct work_struct csc_hw_error_work;
>> +
>>       /** @pcode: tile's PCODE */
>>       struct {
>>           /** @pcode.lock: protecting tile's PCODE mailbox data */
>> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/ 
>> xe_hw_error.c
>> index 0f2590839900..ad1e244ea612 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_error.c
>> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
>> @@ -3,6 +3,7 @@
>>    * Copyright © 2025 Intel Corporation
>>    */
>> +#include "regs/xe_gsc_regs.h"
>>   #include "regs/xe_hw_error_regs.h"
>>   #include "regs/xe_irq_regs.h"
>> @@ -10,6 +11,8 @@
>>   #include "xe_hw_error.h"
>>   #include "xe_mmio.h"
>> +#define  HEC_UNCORR_FW_ERR_BITS 4
>> +
>>   /* Error categories reported by hardware */
>>   enum hardware_error {
>>       HARDWARE_ERROR_CORRECTABLE = 0,
>> @@ -18,6 +21,13 @@ enum hardware_error {
>>       HARDWARE_ERROR_MAX,
>>   };
>> +static const char * const hec_uncorrected_fw_errors[] = {
>> +    "Fatal",
>> +    "CSE Disabled",
>> +    "FD Corruption",
>> +    "Data Corruption"
>> +};
>> +
>>   static const char *hw_error_to_str(const enum hardware_error hw_err)
>>   {
>>       switch (hw_err) {
>> @@ -32,6 +42,54 @@ static const char *hw_error_to_str(const enum 
>> hardware_error hw_err)
>>       }
>>   }
>> +static void csc_hw_error_work(struct work_struct *work)
>> +{
>> +    struct xe_tile *tile = container_of(work, typeof(*tile), 
>> csc_hw_error_work);
>> +    struct xe_device *xe = tile_to_xe(tile);
>> +
>> +    xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_FW_FLASH);
>> +    xe_device_declare_wedged(xe);
>> +}
> 
> Any specific need for worker to set wedging any significant impact on 
> making it synchronous call?

I tried synchronous but there is a sleeping function that caused an 
error that's why moved it to workqueue

> 
> 
>> +
>> +static void csc_hw_error_handler(struct xe_tile *tile, const enum 
>> hardware_error hw_err)
>> +{
>> +    const char *hw_err_str = hw_error_to_str(hw_err);
>> +    struct xe_device *xe = tile_to_xe(tile);
>> +    struct xe_mmio *mmio = &tile->mmio;
>> +    u32 base, err_bit, err_src;
>> +    unsigned long fw_err;
>> +
>> +    if (xe->info.platform != XE_BATTLEMAGE)
>> +        return;
> 
> why platform specific check here ? I remember having similar error on 
> PVC (reported by root tile).

No PVC had the GSC error bit set and this is only applicable for CSC 
errors. On encountering such errors, device is wedged and uevent needs 
to be sent for firmware update which was also not applicable for PVC

Hence the check

Thanks
Riana

>   > +
>> +    /* Not supported in BMG */
>> +    if (hw_err == HARDWARE_ERROR_CORRECTABLE)
>> +        return;
>> +
>> +    base = BMG_GSC_HECI1_BASE;
>> +    lockdep_assert_held(&xe->irq.lock);
>> +    err_src = xe_mmio_read32(mmio, HEC_UNCORR_ERR_STATUS(base));
>> +    if (!err_src) {
>> +        drm_err_ratelimited(&xe->drm, HW_ERR "Tile%d reported 
>> HEC_ERR_STATUS_%s blank\n",
>> +                    tile->id, hw_err_str);
>> +        return;
>> +    }
>> +
>> +    if (err_src & UNCORR_FW_REPORTED_ERR) {
>> +        fw_err = xe_mmio_read32(mmio, HEC_UNCORR_FW_ERR_DW0(base));
>> +        for_each_set_bit(err_bit, &fw_err, HEC_UNCORR_FW_ERR_BITS) {
>> +            drm_err_ratelimited(&xe->drm, HW_ERR
>> +                        "%s: HEC Uncorrected FW %s error reported, 
>> bit[%d] is set\n",
>> +                         hw_err_str, hec_uncorrected_fw_errors[err_bit],
>> +                         err_bit);
>> +
>> +            schedule_work(&tile->csc_hw_error_work);
>> +        }
>> +    }
>> +
>> +    xe_mmio_write32(mmio, HEC_UNCORR_ERR_STATUS(base), err_src);
>> +}
>> +
>>   static void hw_error_source_handler(struct xe_tile *tile, const enum 
>> hardware_error hw_err)
>>   {
>>       const char *hw_err_str = hw_error_to_str(hw_err);
>> @@ -50,7 +108,8 @@ static void hw_error_source_handler(struct xe_tile 
>> *tile, const enum hardware_er
>>           goto unlock;
>>       }
>> -    /* TODO: Process errrors per source */
>> +    if (err_src & XE_CSC_ERROR)
>> +        csc_hw_error_handler(tile, hw_err);
>>       xe_mmio_write32(&tile->mmio, DEV_ERR_STAT_REG(hw_err), err_src);
>> @@ -101,8 +160,12 @@ static void process_hw_errors(struct xe_device *xe)
>>    */
>>   void xe_hw_error_init(struct xe_device *xe)
>>   {
>> +    struct xe_tile *tile = xe_device_get_root_tile(xe);
>> +
>>       if (!IS_DGFX(xe) || IS_SRIOV_VF(xe))
>>           return;
>> +    INIT_WORK(&tile->csc_hw_error_work, csc_hw_error_work);
>> +
>>       process_hw_errors(xe);
>>   }
> 
