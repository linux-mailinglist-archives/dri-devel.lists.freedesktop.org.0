Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 961CCC4C6E4
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 09:39:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF1B110E50B;
	Tue, 11 Nov 2025 08:39:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SsoJWQQm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A38910E506;
 Tue, 11 Nov 2025 08:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762850389; x=1794386389;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JzPnlY1bEQh1SYjd/jpS2sERbRWHy68jM3HY8qMvHF4=;
 b=SsoJWQQmEwlJspkDsfjExr64w8cnwzeaN2v3jYmCN/tktJwQPf7fcFoN
 gYJUSYgAVnSPcQLLfch+TZQ1oiehDjhxFM7KKAcjD1KIPWR/a9Okxov4A
 dZDhHaaEiIUQagfkBPOrosB6Fk3hTu10xg7WdsWiPkKchBj0gKES3dQh3
 WlNRvlTEIjSX4DKguVDvT2xpGT2TbIQqIXhFDPk/+zZwuKAyB+BzSdtCi
 8ot6YrBrlO8RmhwHP9R6P7s3a7X9b172AQrJ2/j0NopeqeYC30J5ruP2o
 KdsCahv2v+DztoVEdhudUDDHyFOwNdHlcvYNptiyUsJUs9tCH5rg/99cG w==;
X-CSE-ConnectionGUID: 7XefNhasSNGzIlpS/p+Pjg==
X-CSE-MsgGUID: MbX7CfwhRyuxIyBhtIp7wA==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="75204786"
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; d="scan'208";a="75204786"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 00:39:49 -0800
X-CSE-ConnectionGUID: QVnZw03jTlOkYqCRcUI7Tg==
X-CSE-MsgGUID: QBCI8odPQfmU0JGnWGYPUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; d="scan'208";a="193288343"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 00:39:49 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 11 Nov 2025 00:39:48 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 11 Nov 2025 00:39:48 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.31) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 11 Nov 2025 00:39:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DGGgsDm3kZ22PupQIwJ/xG4bhxqvQhlsRFV6A5GJWtJgVcjG133hrULO1y/QvJyzYLb44VeMKxFr9PnAxOnf0tfmz1yfCm2SL1anQF9+px8a4855DTvLpIYEZGYS3Bj1GoUyxNUexiZA/zGkqj01XAWp4t+x4YlA58XcU+wyvb7JobZtni3BIYYIy5KmEFSa0c2R//c8aifTS+zsF2anLxUcf+TZ90Ul8+gVSV02//vXTiQE6DQMlgIQW0DRAtRNGZwME196tz0JsWdtG6JnM6AQnm287tYs8C6vsL3kpzU56JU4680ted2qvEztxvtemU5StSFQjKwRbYP+uryr8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BcyIHs9NQKtDaxPX9d0XfdqMVDmjYl+7EaPvXYHNdQs=;
 b=esKC7e+b+LRRpwfBI6ayHF3TrIlBvaPC/3ilLeUmlEMk2/zjZzULDqjJ5c27K9eG3mv5yLVP+glcUKmRCHrowNA2sDYh5rnJU+KKcx9CmMAO4lfEKOtztWfIpZqYFyMHc7QGGhpPumqYXIRhNiHIcogDM9LjwV60yT28Bj1yJL62JVrSMNJBpNsU5QNC2I9qY/oidDYbh/oGthEjCWR9afNkZhqA4wZgAARcMLXtN9bNFCCJomTltwKBZZGmOJD5pQDEhx+aJmBuFqnsAUXrexX/uk/4ONYu0zisVQeP49gG+hQSvWyJft2+QTQhlnRu0O8qGijJAq9nVzCWc9Wi2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by PH0PR11MB5206.namprd11.prod.outlook.com (2603:10b6:510:3f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 08:39:46 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%5]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 08:39:46 +0000
Message-ID: <fef29a1d-5682-4d8f-ae6c-c99b19166f7d@intel.com>
Date: Tue, 11 Nov 2025 14:09:32 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [v6 14/16] drm/i915/display: Add registers for 3D LUT
To: Jani Nikula <jani.nikula@intel.com>, Uma Shankar <uma.shankar@intel.com>, 
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
CC: <ville.syrjala@linux.intel.com>, <pekka.paalanen@collabora.com>,
 <contact@emersion.fr>, <harry.wentland@amd.com>, <mwen@igalia.com>,
 <jadahl@redhat.com>, <sebastian.wick@redhat.com>, <shashank.sharma@amd.com>,
 <swati2.sharma@intel.com>, <alex.hung@amd.com>
References: <20251105123413.2671075-1-uma.shankar@intel.com>
 <20251105123413.2671075-15-uma.shankar@intel.com>
 <f64acba83751cf49663b4f8c6801095b7c17fc9e@intel.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <f64acba83751cf49663b4f8c6801095b7c17fc9e@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0085.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ad::16) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|PH0PR11MB5206:EE_
X-MS-Office365-Filtering-Correlation-Id: e2718c04-254d-49c4-24c3-08de20fdde0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RGgrR3FUZ3Z1TGlEamJPVkpydVdwaG9lTG1nOGRkaVlEQkJZc2lKaGlmN1d3?=
 =?utf-8?B?UERCSzlsb1p4NWtLVXJ0Y2NPV3ptdEswZkNHMUtUbjJURUVhWEJQaDlEYzFn?=
 =?utf-8?B?dVN0OFNGVjZGWnk2WE9ZTGcwRytFOHhQY214bjJpZFpKdDM0SGQyc0ZBb1M2?=
 =?utf-8?B?NlhmL1BKQUtReHJ3L01uZWUwbFBhME1TazlOZTRsZTNVRTJyNXFRVnFlVUZX?=
 =?utf-8?B?bFB0R1NWTUxiaGR5TVhUWjJiTUxkMGI1cTBSbTkydHJZQkNuVFh4QTVzM3p6?=
 =?utf-8?B?RjkyRUlWOHRueUNSY2VrTlAvS1JFcWZnMjFYSkRXbzE3MG5BcnRXSjhJb01S?=
 =?utf-8?B?eWJEdktZTGg3TWErRis1NVB4MmJ3SHZQeHRUZEs5MnpnWkZ2V01UR1FFYXpM?=
 =?utf-8?B?OGM1REpOTjIzN1FEZ3ZCSWE4SHNld0NUZ25YZXRaZFRBSDFhYy9qL3R5MnZu?=
 =?utf-8?B?amh0YjI1TllpVlJTdDE2bXg1a0NFd0JEd1FZZ0lEamdqcnErR0RqSmtrT2Za?=
 =?utf-8?B?WVM3dHQ3UGJ5SXRJZml5YUJvRnVrZVV6UnFSWHlGL0VxZjVLdGFSM3J1Zm1D?=
 =?utf-8?B?YVdLVk5BeTgrYlcwUnM2VVd6UEV2ZXZKenFlaGhycnUyVmxISmo5M3FVdGtQ?=
 =?utf-8?B?SjZERmgxdG9jdE9qVzVZd0FNaDhSS1JnVWl6MXRQQUM0ZUpyZVBzVnRpRDVN?=
 =?utf-8?B?enVzNlAvOXBHODUrcnRqd0Naa2ZFMVNyQmpHZ2FTamdYODFJWTlrNk9EQ0ND?=
 =?utf-8?B?aDRjNDc5L0tqUFpLVTB2Ukx4a0V4RU1FUGQ1WlZRRmkwL011d0ZDMkN4cXh0?=
 =?utf-8?B?QVBOdFptVjRzcWFLZ1NydCtBT1dsVzVxMVNFRS9Xd1ZsNkIvL0E2bFFyWnVr?=
 =?utf-8?B?ZUxSYkJyWVpHZ3FPVjA1eXhkNU9ZSmlMQTRMeFBXV0xKa2pTR0hYZDVmcDJi?=
 =?utf-8?B?NE52RlJqZmVTSzcxMXFXVDAwUmEyMXZpdHdVWVpBYnhNUDVnUkpON25QeURz?=
 =?utf-8?B?UFM3SDcyazRFU1JTMGZLTjhBMjVaOFVib2hUNm9YUWZPNm03Q0hLYURZN2VL?=
 =?utf-8?B?NEt3dkIrVlAvd1g1ZkI2VTVkWGIvSDRVWkpWZlZrcE12U25qcHRIZk1SUzZJ?=
 =?utf-8?B?OHVDS2xPTndiYVZoUG9nTUpIU04vOVhjeHc5WWZNTVBZcXJlYWF1MW9wT3pV?=
 =?utf-8?B?cnJnSWUzR244b21lZ3dzWG1UWXJwcFQ5UStYMUlsdjZHR1FFZ0FjajZXQXdO?=
 =?utf-8?B?bS80YWJTSkVvcVZtZmtrRTBiVm5ST1hoRXgrK0hyN0FUbmJtUExCV3ZWdG5J?=
 =?utf-8?B?OUpaNXVSYXZrVURqRTNtUTEwV2NzaTlNcW5uQXU4R09hbXFGL3RvK1FJajdW?=
 =?utf-8?B?ZU5LWndUa2huYldKZ1FCT2xpTTd5SEh0YWlrSEF4WTg4TmVFN3VualkwczJS?=
 =?utf-8?B?T2JYTHEzQllSNDFYMExsYzZLTkx5YzB4WVhRWnppNzV1N01QNVp5SWw4c0dl?=
 =?utf-8?B?a3Q5TFJTWWRUS2V6UHFBRWFjdDQ0S054VGNDa1VvL1JrL25NR3NGd09iUGMy?=
 =?utf-8?B?bWxmc1pRMW9lS05sbXhKU2tsTmh0NFNZSkRjSUY1Z0Y2VVYvWUtsZy92RUEr?=
 =?utf-8?B?ZHB1NkFRZlVIcGczMWlmaGdkTWhpVjQrRVA4eEJLWWRLZ01mNDEvS1RCV3hC?=
 =?utf-8?B?UGhpY1dMbEVabzFha2YrY2dSRmxwLzA0bXgwQzIvNVNuZnNEUzdjWmVSTGRa?=
 =?utf-8?B?QTh6b2NtWnpNV2UyRnFYblJBeldobklndkR2L1Z4WkJjVmdKRmlQRFJTdzY1?=
 =?utf-8?B?SVZMVDdWMTRhcUcvVTBwSzRTR21HZWZHWjZsRklSUzhVYmlFV0NkZ1BaN0Fn?=
 =?utf-8?B?SzlIcXZsOHduaFNPSFdYZGlvUjljTnNNcTRzdWNRQXV3YmExTGhxSFhEdUZ1?=
 =?utf-8?Q?rTOYvq4n9vfzWZGhGA7Nj1iV4pzy8qaT?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VjMvQlV3TllqYWR2VUFablhDL1kwUTNNY0VZdTBiZjd3bXBSQmNEMEhoc2Mx?=
 =?utf-8?B?V0l1c2tzU2xKdlBVTm05Y2VGU2hBY0c3M3ZLMFpWSjlyWnY0ZXZxNnVIa0lx?=
 =?utf-8?B?RXVER3hHMmZvdVQ1Rm41bU01dDd0S1ZtNjZUWklabHBpdFZhbzdJcG5kc3I1?=
 =?utf-8?B?L3JuVXV1cVh1Kzh0bEFaV2tLWGxqY0VpblhMQXFKUXlLMWpLQzdZc25Vc21m?=
 =?utf-8?B?TklIQk1oa01HMzZCbUN1a3hiSThxY2VQSkRYVkVDOSs4TEphZUNCWWlsZkcz?=
 =?utf-8?B?K25Hck85RWFUT1lJbGg5MHRjQWV3TkpzdUNraDROL3Azb3I4OWZaMVk3dDB2?=
 =?utf-8?B?Z0FiaDdHM3NkTVVKUWFEVUpmUDFidFloSjBmL0N0aDFPajRlTGkvMTVkQjlY?=
 =?utf-8?B?VzFJTGcvandJWnRJVFhGZGNWWWcwTXRvcmNsUElNTWpXQ2Y0UVZpYllJUU9W?=
 =?utf-8?B?c3JGbVZtTTZNTGRVVXNsNFg1UnREdzJ6VzhJUkhKYTJ4LzBiQW5QQTBMRyt6?=
 =?utf-8?B?VlNXTkZmRi81elZSWjRib2FEc0ppNVBGV2s4b3NsL1FrUU5FaHU5SDU1dUdr?=
 =?utf-8?B?eFN3L3pNR3F1dEZQc2d3Q09OaXEwZkVBbU9XY1ExazdBdFRkNmhSZktwekZr?=
 =?utf-8?B?S2t2UitlZUlTWHE4OEdoQkFibU0zUUptUEF5WW1Fc0tOdEFkclg1bmthT0tI?=
 =?utf-8?B?bXdQV044d2NMdm1FSnRXSVBkZG12SHE4WFF2TDRvUGFvRFJiUzkrb0Q4NU91?=
 =?utf-8?B?U2ZJUEpOaGxaWkV3R0I1RkZwamdvckViMnVzdWhpQkNCS1JoTjJzWlpwOU0z?=
 =?utf-8?B?VFVoY3o0dUJIZ1U1YlhMLzQwWEFNUUU2bzVtZ0hkQUF0aDA4c3REM3dxcFI3?=
 =?utf-8?B?ZXplWHovNVhQelpwQmlJb2t3WVVYWFpTNm9QTDlQRTlGNDc5U1B0NysvazRN?=
 =?utf-8?B?Tm45Y2NycTJ3MWUyTEFZZytkSHdpWTdkclg3Q1M2eWNhVlZ4b1ZJRDhlY3Nj?=
 =?utf-8?B?dWJLMXA4ZHZzcW1ZRGFxWVNrWkNRT052Y0M5WGlDREFmenVtY2xUTG1qOWVq?=
 =?utf-8?B?WklITVZ6dU54Y29UWHVDTU1mNXBuNFViWGRaY3FBMVJ4MVdFbFB6MnpjeUtU?=
 =?utf-8?B?Vks2Um91UDhST05rWXN2T1ZseUdaT0tlTkx1eVdLeTBlcHNDb2xrU2JYZUxq?=
 =?utf-8?B?MDdGaHlSd3lOeTlpamRLOHgwTlloMlN1Y1RMWEErZUdHQnlKeEFCRWRDRHpI?=
 =?utf-8?B?bDNQSFhjekIveGYrb1V1YVlVaDV4akhDZTA4bG93SVBFZ1haZlRuVytFZGpT?=
 =?utf-8?B?WEFUa1hBeW1zaXRtYlQyMXpmd1lQb1Bwek1tVnU5Y3hMNWdxSWthNkVUT0M0?=
 =?utf-8?B?RkVUWk9QckgrYi9RMDlwa1VhdjJ2WlM2UVptdDhaSEFyU3dXWDI5WCt1eG9P?=
 =?utf-8?B?OWNmZ0pBUlZzZEVlQXoyb0xpak14TEFMczBBR1F0U1JiN0lqTGRUY1Mxb0pB?=
 =?utf-8?B?VGEvRGdVU3hDVVVxTnJGZ0R5RjVuQWYwS2dUT3dlQm90akUzVTl3cTkrMFp4?=
 =?utf-8?B?eDhkdTVRZjVMWmwydzd3Qll3bXg5NWQ2K2dTUkxuYXdjMGJhUDM2MnZqVHd0?=
 =?utf-8?B?SU8rdDNqOGxXVU5MMFlUWWU1SjFyeGlEM0VTa0RCSUNFZXFCNUlJaTh5MXZ1?=
 =?utf-8?B?QkJHZXJPZGhGTDNHSDFjK1hDY25wdUYyazNWZzIzemdxOWNoU0FlS080RHFx?=
 =?utf-8?B?dnQ3YUJpNmZXM09sVE1zQzJDRnZRcWFuNUVkdC9jaWRmM3YzKzVRZFRDdUxz?=
 =?utf-8?B?NG9zSkJDa3FHVmlYcXViWExRazhhbUdzMFdudVFFMGxrL1hSVWs0M0tyRlRo?=
 =?utf-8?B?OFFnY3diS29Fd0d5blh6R2dmTG1sdU9qUUh6VzZ1V3EvNVNDTzdyb2dlV2hi?=
 =?utf-8?B?SVExaTllWUVIMWZLcWpBaXdLSCszN0gzV01uSy8vZnoyWm8wNDROOUdWU2lF?=
 =?utf-8?B?b2dvREFydHVzNmJaWlFaMXNTR1lta1lnL3NOVmV3VStxZ1YwZzJoeHYvUEw3?=
 =?utf-8?B?SktzSWQyR0tuNmJ2djlvUW9wUFdvWTU3ckZEYkFnM0N4eExUbGFKS0tOaGho?=
 =?utf-8?B?Z3MxMmRmc1BKdGcvVElaVm1QUEk5WUJUQ3VTMXNsbWR3Y1JBbFpVUFZYSUl1?=
 =?utf-8?Q?k84USlkDkrFr8fbux89uzvk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e2718c04-254d-49c4-24c3-08de20fdde0e
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 08:39:46.1217 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6kLzYHrkxx7cAGYGn9DBpjPNa9TS1PodQbTQ7tKuW9oaDmGTZJ2E8ykQ2hLwVM974JkOn0att4EuwILNuQNVmp62dOIKV0QDe3HcvjE4kqU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5206
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



On 11/10/2025 5:38 PM, Jani Nikula wrote:
> On Wed, 05 Nov 2025, Uma Shankar <uma.shankar@intel.com> wrote:
>> From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>>
>> Add registers needed to program 3D LUT
>>
>> BSpec: 69378, 69379, 69380
>>
>> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
>> ---
>>   .../i915/display/skl_universal_plane_regs.h   | 26 +++++++++++++++++++
>>   1 file changed, 26 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane_regs.h b/drivers/gpu/drm/i915/display/skl_universal_plane_regs.h
>> index 4d71d07e90ff..88b4c6c57054 100644
>> --- a/drivers/gpu/drm/i915/display/skl_universal_plane_regs.h
>> +++ b/drivers/gpu/drm/i915/display/skl_universal_plane_regs.h
>> @@ -520,6 +520,32 @@
>>   #define	  PLANE_MIN_DBUF_BLOCKS(val)		REG_FIELD_PREP(PLANE_MIN_DBUF_BLOCKS_MASK, (val))
>>   #define	  PLANE_INTERIM_DBUF_BLOCKS_MASK	REG_GENMASK(11, 0)
>>   #define	  PLANE_INTERIM_DBUF_BLOCKS(val)	REG_FIELD_PREP(PLANE_INTERIM_DBUF_BLOCKS_MASK, (val))
>> +/* 3D LUT */
>> +#define _LUT_3D_CTL_A		0x490A4
>> +#define _LUT_3D_CTL_B		0x491A4
>> +#define   LUT_3D_ENABLE			REG_BIT(31)
>> +#define   LUT_3D_READY			REG_BIT(30)
>> +#define   LUT_3D_BINDING_MASK		REG_GENMASK(23, 22)
>> +#define   LUT_3D_BIND_PIPE		REG_FIELD_PREP(LUT_3D_BINDING_MASK, 0)
>> +#define   LUT_3D_BIND_PLANE_1		REG_FIELD_PREP(LUT_3D_BINDING_MASK, 1)
>> +#define   LUT_3D_BIND_PLANE_2		REG_FIELD_PREP(LUT_3D_BINDING_MASK, 2)
>> +#define   LUT_3D_BIND_PLANE_3		REG_FIELD_PREP(LUT_3D_BINDING_MASK, 3)
>> +#define _LUT_3D_INDEX_A		0x490A8
>> +#define _LUT_3D_INDEX_B		0x491A8
>> +#define   LUT_3D_AUTO_INCREMENT		REG_BIT(13)
>> +#define   LUT_3D_INDEX_VALUE_MASK	REG_GENMASK(12, 0)
>> +#define   LUT_3D_INDEX_VALUE(x)		REG_FIELD_PREP(LUT_3D_INDEX_VALUE_MASK, (x))
>> +#define _LUT_3D_DATA_A		0x490AC
>> +#define _LUT_3D_DATA_B		0x491AC
>> +#define   LUT_3D_DATA_RED_MASK		REG_GENMASK(29, 20)
>> +#define   LUT_3D_DATA_GREEN_MASK	REG_GENMASK(19, 10)
>> +#define   LUT_3D_DATA_BLUE_MASK		REG_GENMASK(9, 0)
>> +#define   LUT_3D_DATA_RED(x)		REG_FIELD_PREP(LUT_3D_DATA_RED_MASK, (x))
>> +#define   LUT_3D_DATA_GREEN(x)		REG_FIELD_PREP(LUT_3D_DATA_GREEN_MASK, (x))
>> +#define   LUT_3D_DATA_BLUE(x)		REG_FIELD_PREP(LUT_3D_DATA_BLUE_MASK, (x))
>> +#define LUT_3D_CTL(pipe)	_MMIO_PIPE(pipe, _LUT_3D_CTL_A, _LUT_3D_CTL_B)
>> +#define LUT_3D_INDEX(pipe)	_MMIO_PIPE(pipe, _LUT_3D_INDEX_A, _LUT_3D_INDEX_B)
>> +#define LUT_3D_DATA(pipe)	_MMIO_PIPE(pipe, _LUT_3D_DATA_A, _LUT_3D_DATA_B)
> 
> The regs go before their contents. For the umpteenth time, please read
> the big comment near the top of i915_reg.h.
> 

Noted, will fix in th next version. Thank you for pointing out.

Have been carrying this patch in my internal branches for a while 
perhaps a good time to move them to intel_color_reg.h while at it.

==
Chaitanya

> 
>>   
>>   /* tgl+ */
>>   #define _SEL_FETCH_PLANE_CTL_1_A		0x70890
> 

