Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3530BB41B02
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 12:04:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 544CB10E65A;
	Wed,  3 Sep 2025 10:04:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iprpFbAD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD0E710E672;
 Wed,  3 Sep 2025 10:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756893843; x=1788429843;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=jzP5SoayE1bZY8XqtdkNPYHHczxcz1V1PnouznL1oEc=;
 b=iprpFbADWThBjT5l2MZ74gwU2eAa0vuPB+RrUBgnLoQ0Bb2qBfalZKH8
 Jk6rS2lkjSN2k+dj2acZPfrRfG+86l0krxDTg6mFBWeSP3Dc5jQFKwARl
 vVY9P8lPazWyw52yuFfL0OlgWqxq+iqw1p1WQBJu7qT2nVFvAvH22cJfu
 XnlNArw8Bjl9qnT9EVLdfZfZ2Hk4mQsSZIpep8TDIKFJ3PpIdA8vnSeEk
 4hWq7FaIKMXSXFj+9rNcpi5fCqtJXIT9fe15bm82Iol3A/cxmc0IDjAb0
 dOBCm9y2K6ocEOQnx8BPZhTZUp/QwUnwZRd0gTvr+i/TuS1ylWtP38CSt w==;
X-CSE-ConnectionGUID: 90j/qGAOTA+Awj7WjyQ65A==
X-CSE-MsgGUID: ZSdvE/o2Shea3YCTVXMpsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="63020722"
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="63020722"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 03:04:02 -0700
X-CSE-ConnectionGUID: 3Od/otFnQ86LQ4LiM8cpcA==
X-CSE-MsgGUID: nC/d8uU6T7S2IGtkK/gKHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="208760635"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 03:04:02 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 3 Sep 2025 03:04:01 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 3 Sep 2025 03:04:01 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.73)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 3 Sep 2025 03:04:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zqgy4lZjLbOVRy1XYCW4yOjT1WjHq3Z2XmPwMcAwZXEathNQEes9UvefOV2Gy8e2gUsq3i3yS/d1vonYy9CoxHjcalDo3na6HLM+9b6U3bQ1HjrYhGiyFfG+c8c6M67Uzdsc9/2/TbTIH7YFMD92GcQ5dx9CAKj3XIqtDHX8A/zJjO7gR287VNwA48xGMmME68lN4/SVjDfntYN6P4SqSs38v01tHorIW+bEZMBEmddPSUvxVU09SuFbpsDTEwUrVmf43XGyRD82JMuAARFYr0oakBlsPQkHdFS3lN9jllWbSbwQWru3Zwy97jFrumRGaL4laixxTIhQZ7c6xwgqQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jzP5SoayE1bZY8XqtdkNPYHHczxcz1V1PnouznL1oEc=;
 b=Ns7BMI/BQHOwXPWK+B3l/C1Mp60rBXQW2uQyeQebzOeCQ3l/y/pjOiMleocs98ZiBW4vu0pAyffVeNFaYGnS+palbm4p7Ak/q1hQNILs+5q7HA6OUdzdShNELIz46vnAwqUgCH/ifaxb7lck91UhR5JHXr/iKRhy9JTAzsxCgWMO0dbvFry9Zsc1avY3AriOWILCcFWM1cFLrKGwA/LE6/LM6GU1L6fCzJB/XlbutlaNifO+9kV2kJbL+w5v8Y3XK+dotjbQPJZcfEdZamF1Q2OTHDEVWmGAHT800HjBncXix0p32wwe21zlcWUR6u+T/bd/daGjnRuihiDPK0AiKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 SJ0PR11MB7153.namprd11.prod.outlook.com (2603:10b6:a03:48d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Wed, 3 Sep
 2025 10:03:53 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::fc1:e80f:134c:5ed2]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::fc1:e80f:134c:5ed2%5]) with mapi id 15.20.9094.015; Wed, 3 Sep 2025
 10:03:53 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Nikula, Jani" <jani.nikula@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
CC: "kees@kernel.org" <kees@kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-hardening@vger.kernel.org"
 <linux-hardening@vger.kernel.org>, "gustavoars@kernel.org"
 <gustavoars@kernel.org>
Subject: Re: [PATCH 1/3] drm/i915: rename range_overflows_end() to
 range_end_overflows()
Thread-Topic: [PATCH 1/3] drm/i915: rename range_overflows_end() to
 range_end_overflows()
Thread-Index: AQHcGQzj/VkHndvKmECE+BF+QIunG7SBQf6A
Date: Wed, 3 Sep 2025 10:03:53 +0000
Message-ID: <41e00ad316156bc1f6c433ce4864252f077cd4d5.camel@intel.com>
References: <20250829174601.2163064-1-jani.nikula@intel.com>
In-Reply-To: <20250829174601.2163064-1-jani.nikula@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|SJ0PR11MB7153:EE_
x-ms-office365-filtering-correlation-id: 001d0d6b-0c94-4e8f-e8f7-08ddead12fff
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|10070799003|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?aHJqUE81KzNoV1VPdGY3OHNSRWc3c0dBVlRrdGZCUk5VbHZSaDlvc2VSNDli?=
 =?utf-8?B?Vk9oa1JDc05KZjhkcEhwK21LZ3hEUFEzNzAvN3RmRjBZRjNzNVF3Sk1maVlk?=
 =?utf-8?B?NHBPeXZhQWdEVDZEL3VRS3g4MTI2Qlp3ejNISFlhaDkzT1l2OTlJY2wyMXQv?=
 =?utf-8?B?UWFXK2pQSW55cmZtUlBISVFvcmlKVi9SdzNON04rczlVb1hzM2NYNnd3NGdP?=
 =?utf-8?B?ajY4bEp0dUd5YTlFTDlXcHNrQVlwZUhMOExiUzZDL3hlamt6c0ltN1duU1Az?=
 =?utf-8?B?dWNoYUtmNG12VHQ4TGRQY3FFenZUb1dGdXZGRExOQ0FaT3RoRjZPQjVWWTVa?=
 =?utf-8?B?aml5Y2plTWJQRFA2R2F3UFl2QVpmVW9QamZ2OEpCKzltajE5ZkxCME5OaGx6?=
 =?utf-8?B?cU5VbTRJbjVTSGlLU3d2d0ZOMnJuNDYyYkhkRUdpam8rTysvQWRxQTJxWEFk?=
 =?utf-8?B?TURrdlhqaDRxb0xKLzIzZjQrWDJiUE5xVm02YS8yeWNGWG51b3BNd0pEdFll?=
 =?utf-8?B?aDBKckluSmtKTlVES1VJVDE2cFpRNEpZSWFYQnJYQzlFc0lsTWduMldOd2x6?=
 =?utf-8?B?ZkRYbEI0bmZKS0hHdXRIMVh2YTBlZ2dVK1RYL0RmeGFGWWh3Nld4ZjNvbG5N?=
 =?utf-8?B?c2RvM0psd3hqL0hJZlhZMU53bXp4VVFaRGtkTHBmREtNbnhwRmpVY0VzVU90?=
 =?utf-8?B?MENuRjlJcG9rc3VHL1FVcXNVUVhTckszaXJaUlZpYVFuS1FxS1VqM3k4MUpP?=
 =?utf-8?B?Z1IyakpPRDZGbmhIOTZhMEcwZE53S3pVU2tESTFET0tnbDAydnpBT0ZvRmUy?=
 =?utf-8?B?d1kxN1lYYVZxcEEwU3Q4ZGw4Z1lqOXlDVkQwM2V5WUtsZCtzT0ZOZ2tMd0Ro?=
 =?utf-8?B?aElhNlVyazVXYTR4Uk9mVDA3NTdDMVlwMDQ0Y1JiQldJMExaK01kQUVsd0Vx?=
 =?utf-8?B?eUJOdzBkOVBxbDIycXFpTU5GRi9PS0pOeEV6NzlTZVBSTC9rYU5sQ0xDcjJW?=
 =?utf-8?B?R0FwdDRqZmg5ZkczMmpFc2xqQm9sWVN3UE9ISU5pWVZPM0lOMFIwZUtnT3JQ?=
 =?utf-8?B?VDFJQmhGenZmdHZSL2NOMjJsMVpIZW5GYWxZWXlkNzhtdENJYXNzdFhTSzJF?=
 =?utf-8?B?WGZPMHh4QThQZnIvN3ZOTTQ0US83bUZvWk1BLzFBcFVHQmRqZ2lqa082K3ZW?=
 =?utf-8?B?YjV6c2RXajNDN2pXcUplRlc2VEdIOUh1NCtPQzVuSDUwNCtpZDZ5Ym83M09z?=
 =?utf-8?B?Q3pWMEJSLy9mYWtEQk1rbFBGbTczNWNlN0FxaFBYN3JhYlVEWUNzdUEvcjUw?=
 =?utf-8?B?WnBIaDdIOWw4cWdEN3FxQk1lV0FBKzFEUTJKT29lWm9ZSzBiZG11VU5MbHdW?=
 =?utf-8?B?dHB0cnBwZHJ0bjUwanBQNGcyN1lJOTd1M201M0RPc05IelI0bUUyMXUxL25l?=
 =?utf-8?B?b1FxSVZPTjA0Smg4alkxSjhvYlJUWm1DSEVUTU10dGVjL1RmaDRIcmJjak84?=
 =?utf-8?B?S2lIWnB4ZVVJNFVnVnF3dTRRcHJ1T0FIUWQzVG83M1Vka25EMWFzR3JuNElu?=
 =?utf-8?B?MXlHQzZwVHdMaWQveGdsRnJHakx2WG9vdVdkSWRxQXdQUTN4aDVjcTROWHlT?=
 =?utf-8?B?TCtreEZRR21pT2d3YUxuc3JVQW5pNVVQREIyZERrcXlPYzI4d0RpeUMxdHVk?=
 =?utf-8?B?djJSVUkySGRQYldMK3NnZ3BoaGh0Wi9mSEJUNGcrOXRUSE5FU1NXZ1hjZHUy?=
 =?utf-8?B?cGNqWEVPZEFOYjJidm5QbTVvY1o1YjRMMGFzaS9VMnJUYzJCRzF5MCtjUndC?=
 =?utf-8?B?R2NwS2NDNVBnVFFwZERnTUFzMUZaWVBXdGVvczdDOENWOWhQd1NtQmtOWmky?=
 =?utf-8?B?ZGZuMG5jcGNKMVk3YXd0S09SZFlzNXovaGZzMXYzdkN3ZEZ0N3RSa3p1NFdV?=
 =?utf-8?B?RVlyQ1VjN0pBRmw0eHVJdTdpUUtPS2VzS0VCajZzRDNqM3BmQ202L1lXRHBN?=
 =?utf-8?B?TU9Jc0RFUkVRPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(10070799003)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NFBjL0xVZWEyRXdEcWxIUjc1TWJybDJVbXlDT0Zod2V2WVFLTGV6dzFzSW04?=
 =?utf-8?B?cit1cW9IUDVOamgxQzFVemgrQmJrZkNEWXZDSTd2c3Y4bDM4TWlsQk1FdlVI?=
 =?utf-8?B?NlN0emViMlJJMmZEMzNPVS9PS2E0MUtNVFZOQjVtYUhvL3pDTHJ3azFpTmgx?=
 =?utf-8?B?dnR2R3B4elRNQzE1dkxkRkpPOW5mQ2cwcmFQWlVwLytXLzlNSXNpaFNENEtj?=
 =?utf-8?B?L3YyMHpqR0tmblFFYm1CVDNxU0VUVk5LaThmcmVxcndNaE9qMitwVllQbUxN?=
 =?utf-8?B?cFRCalNFN2FXK05iUFNCNGI3dFJDOGE3TEp5M2F2L3hFeHFaQXVTVmhKdkNj?=
 =?utf-8?B?ZWNRUzdneHkzSWpMbitTVGRNV3lOdjV1bzRMYXdyWEtydi9wOTlISFlKYkdF?=
 =?utf-8?B?ZTZJcUhLQURRcWI4MHNadDNPQXpRVXlvaENFcEduTEZIRCtSR0UwdkRzaXpw?=
 =?utf-8?B?S2hjRlNaUkRNVmUvZndmU0J4VTRsVE5WRWs5dGdXcHd3c0NZV1FpSTFCY3dR?=
 =?utf-8?B?Zmp4Kzl5QmVSUDVHdVl2cFlQV1RiTTVWUS8rdHlZVG4wV2dHSzVBdE90d2Ft?=
 =?utf-8?B?MjgwdzVBYmN1Vk9SaXFTQW5iWEF3RHZndVQ3WFJqWnZ0T2VhUnVvME8wUHRw?=
 =?utf-8?B?YTl2d0NhNmhIOWo4RGpBU01rb2VUTkk1R01LK3p3cllEUENqS0cvS2E1RUpF?=
 =?utf-8?B?VWdMRm4vVjFMUWZ2N0RiakFnb3VNN09VVCtLTGgwYU00ZytBSjNjRTJ3WDlP?=
 =?utf-8?B?cGVPeGNSRmgrZEhPaW5ScjNOUitLbTBjdnBWbjlwU2JJQ2xTUU9PTzU4S1BL?=
 =?utf-8?B?MTArK09Edzd5NkMvYVBEL0NEc3RFYnA4SjlWbnVwampyMHptcmE1aWF5Y0hU?=
 =?utf-8?B?ZG4zUmFmdVp6bCtodjg3NGZibno5WjkrTnMveitiZEJ4eXdBanF4bTRnaVhN?=
 =?utf-8?B?ZXRPQkV4VHVNdTN3QUMxRGF3Sm1NdS9qUUtFWlhLbWkyWDR4QzlsYThKOXdW?=
 =?utf-8?B?VkRUSm9HNXZrZEtRZmJyZDA5Zm4rMU5GeTZOWEJxYTFDeUt6TkhsRjVBbE1h?=
 =?utf-8?B?TEFBZXozV3RRS2wwS2JvTGMxNEdFc0dLNFlrRXdQQWFBZ1ZJaHg1ZmpyUHIr?=
 =?utf-8?B?VjlBRGVOMUMyUDNoS25SNEFnVkYvOGF6YnJxenpObUNYVThvRlgxUCswQkVv?=
 =?utf-8?B?MHJXOWpGaTlGY0JUbzFYNU1BYVBRd2xoNCtCVnVRRWRoRmRoNDVxVm5sM08v?=
 =?utf-8?B?WVRCMytTNEdUd2l5bmdmdkxaYm5KUzhqTkJ4U3FZMWRORnhYaURxTE5LMERP?=
 =?utf-8?B?RXI1NER1cUZNWGFHVFlTaFZqTzY1VHVOMVcra1lVQ0J5c0Y4UGtzYmE0OWdL?=
 =?utf-8?B?YTVNZTJQdEZhK2tRdUhLaGM1bkhSYk1Ibi9GSVJWa2c2NHlkaWpCclZ2c09y?=
 =?utf-8?B?Y0FXNEtUTUI1VE9MT3poRHRJQ2FrZWJ3eGFRWlNvMU9iT3gzSFU1SVVpak5w?=
 =?utf-8?B?Yk1MTS9BK1Y3NEUwNkpmbDZNSGdMcVVIVmhOQzE2ZDRjb0N4UWdkdzU3WHNs?=
 =?utf-8?B?UURvZVlyU2liRklubk9HdExhdXJwQ25EWTFUem5XUnp2YklrT0NRSTRZVmR3?=
 =?utf-8?B?TFl6QUxYbGpqdjJ6NmIzdnFmb01oWmZkVUxhOUZYalorMDNWOUNuLzM1dEll?=
 =?utf-8?B?b1ppbS9sbEp1aDJjVE5kUENwT3dtMnBFR3FNaEhOU1g1Qlh4ZGVObktVUVJJ?=
 =?utf-8?B?QWh6THN6aFdvN0NSZGJjVEJIVDhKNjh0SWh5blVnWklHN2xKUHdBL2trRHZU?=
 =?utf-8?B?TG9zZEdJZ1Yycnhpa3hDM2VZQStoL1RIRUUvaE05U09xOUo4UzNSN01TTVBS?=
 =?utf-8?B?OGtnRTZWL3pydjVQNzNtTU1qdjNwMW1URVBETVNubXdKZWh3UkJPK2UyZkRS?=
 =?utf-8?B?K2ZzMnhtZGV4YTJBVW1PNFMzMzlXaXpzUStTT2hCWTZUa3I4R3A3bGJmK3Bw?=
 =?utf-8?B?TUhxa21DdGQzNjN2bFFOTjBUbUJERVRrc1dnRStRYkF5SVY2T1FySTVaN0Rt?=
 =?utf-8?B?dmg4NnlnNlVnTi9CMTF1QVhEQnkybzFUcjJCb3IwMVFaRFhtdE9EcDdod1lF?=
 =?utf-8?B?VkthL1BQOHF3MnQ3WDEyVDh4RlZuQjN6RUducm40ZWNGdi9qOEVianNMWEZo?=
 =?utf-8?B?d1hVM3Byb1NsNE4vbDZEWFBxWFIzVnRuUmYzY2dwNk5RMVROYUNRWm1mYTZP?=
 =?utf-8?B?bEczYTRNY1ArbVIzZDYzNVc4TnZnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0FBFE5A0BE207D4F8F8FD5B07466F275@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 001d0d6b-0c94-4e8f-e8f7-08ddead12fff
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2025 10:03:53.0741 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GKB6WgbWmTtZtNGxXqMF+blVndy6A5muNaxDmiNBS941lyhQcMUXotu+FPcMwZqowGmU/q26kyy1j3XxcC/vuOyXZd5ZgOh95gOeXC3+pes=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB7153
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

T24gRnJpLCAyMDI1LTA4LTI5IGF0IDIwOjQ1ICswMzAwLCBKYW5pIE5pa3VsYSB3cm90ZToNCj4g
UmVuYW1lIHJhbmdlX292ZXJmbG93c19lbmQoKSB0byByYW5nZV9lbmRfb3ZlcmZsb3dzKCksIGFs
b25nIHdpdGggdGhlDQo+IF90DQo+IHZhcmlhbnQuDQo+IA0KPiBJdCdzIGFsbCByYXRoZXIgc3Vi
amVjdGl2ZSwgYnV0IEkgdGhpbmsgcmFuZ2VfZW5kX292ZXJmbG93cygpIHJlYWRzDQo+IGJldHRl
ci4NCj4gDQo+IENjOiBLZWVzIENvb2sgPGtlZXNAa2VybmVsLm9yZz4NCj4gQ2M6IEd1c3Rhdm8g
QS4gUi4gU2lsdmEgPGd1c3Rhdm9hcnNAa2VybmVsLm9yZz4NCj4gQ2M6IGxpbnV4LWhhcmRlbmlu
Z0B2Z2VyLmtlcm5lbC5vcmcNCj4gU2lnbmVkLW9mZi1ieTogSmFuaSBOaWt1bGEgPGphbmkubmlr
dWxhQGludGVsLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IEpvdW5pIEjDtmdhbmRlciA8am91bmkuaG9n
YW5kZXJAaW50ZWwuY29tPg0KDQo+IC0tLQ0KPiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3Bs
YXkvaW50ZWxfZmJjLmMgfCA0ICsrLS0NCj4gwqBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9pbnRl
bF9yYzYuY8KgwqDCoMKgwqAgfCAyICstDQo+IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV91
dGlscy5owqDCoMKgwqDCoMKgwqAgfCA2ICsrKy0tLQ0KPiDCoDMgZmlsZXMgY2hhbmdlZCwgNiBp
bnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZmJjLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9kaXNwbGF5L2ludGVsX2ZiYy5jDQo+IGluZGV4IGQ0YzVkZWZmOWNiZS4uNDQ2ZTJhZDI4YTcw
IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2ZiYy5j
DQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZmJjLmMNCj4gQEAg
LTM4MywxMSArMzgzLDExIEBAIHN0YXRpYyB2b2lkIGk4eHhfZmJjX3Byb2dyYW1fY2ZiKHN0cnVj
dA0KPiBpbnRlbF9mYmMgKmZiYykNCj4gwqAJc3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmk5MTUg
PSB0b19pOTE1KGRpc3BsYXktPmRybSk7DQo+IMKgDQo+IMKgCWRybV9XQVJOX09OKGRpc3BsYXkt
PmRybSwNCj4gLQkJwqDCoMKgIHJhbmdlX292ZXJmbG93c19lbmRfdCh1NjQsDQo+IGk5MTVfZ2Vt
X3N0b2xlbl9hcmVhX2FkZHJlc3MoaTkxNSksDQo+ICsJCcKgwqDCoCByYW5nZV9lbmRfb3ZlcmZs
b3dzX3QodTY0LA0KPiBpOTE1X2dlbV9zdG9sZW5fYXJlYV9hZGRyZXNzKGk5MTUpLA0KPiDCoAkJ
CQkJwqANCj4gaTkxNV9nZW1fc3RvbGVuX25vZGVfb2Zmc2V0KCZmYmMtPmNvbXByZXNzZWRfZmIp
LA0KPiDCoAkJCQkJwqAgVTMyX01BWCkpOw0KPiDCoAlkcm1fV0FSTl9PTihkaXNwbGF5LT5kcm0s
DQo+IC0JCcKgwqDCoCByYW5nZV9vdmVyZmxvd3NfZW5kX3QodTY0LA0KPiBpOTE1X2dlbV9zdG9s
ZW5fYXJlYV9hZGRyZXNzKGk5MTUpLA0KPiArCQnCoMKgwqAgcmFuZ2VfZW5kX292ZXJmbG93c190
KHU2NCwNCj4gaTkxNV9nZW1fc3RvbGVuX2FyZWFfYWRkcmVzcyhpOTE1KSwNCj4gwqAJCQkJCcKg
DQo+IGk5MTVfZ2VtX3N0b2xlbl9ub2RlX29mZnNldCgmZmJjLT5jb21wcmVzc2VkX2xsYiksDQo+
IMKgCQkJCQnCoCBVMzJfTUFYKSk7DQo+IMKgCWludGVsX2RlX3dyaXRlKGRpc3BsYXksIEZCQ19D
RkJfQkFTRSwNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2ludGVsX3Jj
Ni5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvaW50ZWxfcmM2LmMNCj4gaW5kZXggOWNh
NDI1ODlkYTRkLi5iZjM4Y2M1ZmU4NzIgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2d0L2ludGVsX3JjNi5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2ludGVs
X3JjNi5jDQo+IEBAIC0zNDEsNyArMzQxLDcgQEAgc3RhdGljIGludCB2bHZfcmM2X2luaXQoc3Ry
dWN0IGludGVsX3JjNiAqcmM2KQ0KPiDCoAkJcmV0dXJuIFBUUl9FUlIocGN0eCk7DQo+IMKgCX0N
Cj4gwqANCj4gLQlHRU1fQlVHX09OKHJhbmdlX292ZXJmbG93c19lbmRfdCh1NjQsDQo+ICsJR0VN
X0JVR19PTihyYW5nZV9lbmRfb3ZlcmZsb3dzX3QodTY0LA0KPiDCoAkJCQkJIGk5MTUtPmRzbS5z
dG9sZW4uc3RhcnQsDQo+IMKgCQkJCQkgcGN0eC0+c3RvbGVuLT5zdGFydCwNCj4gwqAJCQkJCSBV
MzJfTUFYKSk7DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3V0aWxz
LmgNCj4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3V0aWxzLmgNCj4gaW5kZXggOWNiNDBj
MmM0YjEyLi5mZGFjOWExNThiNTMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2k5MTVfdXRpbHMuaA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3V0aWxzLmgN
Cj4gQEAgLTc5LDcgKzc5LDcgQEAgYm9vbCBpOTE1X2Vycm9yX2luamVjdGVkKHZvaWQpOw0KPiDC
oCNkZWZpbmUgcmFuZ2Vfb3ZlcmZsb3dzX3QodHlwZSwgc3RhcnQsIHNpemUsIG1heCkgXA0KPiDC
oAlyYW5nZV9vdmVyZmxvd3MoKHR5cGUpKHN0YXJ0KSwgKHR5cGUpKHNpemUpLCAodHlwZSkobWF4
KSkNCj4gwqANCj4gLSNkZWZpbmUgcmFuZ2Vfb3ZlcmZsb3dzX2VuZChzdGFydCwgc2l6ZSwgbWF4
KSAoeyBcDQo+ICsjZGVmaW5lIHJhbmdlX2VuZF9vdmVyZmxvd3Moc3RhcnQsIHNpemUsIG1heCkg
KHsgXA0KPiDCoAl0eXBlb2Yoc3RhcnQpIHN0YXJ0X18gPSAoc3RhcnQpOyBcDQo+IMKgCXR5cGVv
ZihzaXplKSBzaXplX18gPSAoc2l6ZSk7IFwNCj4gwqAJdHlwZW9mKG1heCkgbWF4X18gPSAobWF4
KTsgXA0KPiBAQCAtODgsOCArODgsOCBAQCBib29sIGk5MTVfZXJyb3JfaW5qZWN0ZWQodm9pZCk7
DQo+IMKgCXN0YXJ0X18gPiBtYXhfXyB8fCBzaXplX18gPiBtYXhfXyAtIHN0YXJ0X187IFwNCj4g
wqB9KQ0KPiDCoA0KPiAtI2RlZmluZSByYW5nZV9vdmVyZmxvd3NfZW5kX3QodHlwZSwgc3RhcnQs
IHNpemUsIG1heCkgXA0KPiAtCXJhbmdlX292ZXJmbG93c19lbmQoKHR5cGUpKHN0YXJ0KSwgKHR5
cGUpKHNpemUpLA0KPiAodHlwZSkobWF4KSkNCj4gKyNkZWZpbmUgcmFuZ2VfZW5kX292ZXJmbG93
c190KHR5cGUsIHN0YXJ0LCBzaXplLCBtYXgpIFwNCj4gKwlyYW5nZV9lbmRfb3ZlcmZsb3dzKCh0
eXBlKShzdGFydCksICh0eXBlKShzaXplKSwNCj4gKHR5cGUpKG1heCkpDQo+IMKgDQo+IMKgI2Rl
ZmluZSBwdHJfbWFza19iaXRzKHB0ciwgbikNCj4gKHsJCQkJCVwNCj4gwqAJdW5zaWduZWQgbG9u
ZyBfX3YgPSAodW5zaWduZWQNCj4gbG9uZykocHRyKTsJCQlcDQoNCg==
