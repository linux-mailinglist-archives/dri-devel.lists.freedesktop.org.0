Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1916CD00B4
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 14:24:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F55110EF92;
	Fri, 19 Dec 2025 13:24:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nrrskydn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71E8510EF92;
 Fri, 19 Dec 2025 13:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766150680; x=1797686680;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=oe7wwMcWt3hWtjh+ThRIA/roy7LKEsMDLSGv6wg0hVY=;
 b=nrrskydnyekZOSWNwE0krc4Ksf5fY5pKFpDiDqYaSR7IaOL+HW1auGmK
 Exoq3m9gYcNhStN50pZH16mg80KY+944rX6qXqmqEBiRSy4BN9bF29/9h
 hR7gtnXJx8UggSiFh0pSJuO54+NxUO3xiwY4dKXHMLdcIALWYtRAvMKhe
 2VzvN4y0FOPPPYOwIoOP/SfCDqIWPlNzCDUHbXvYQ3IrnuVWmCnN7ACqg
 sewGkKgFkYicOf58dKg9ErW+DUuraimOS3LZpW8h6ohwOm8+5Qyjridz5
 1vQkxRYENdvUkjAJnDZ718j6cd+Sj26wE9BIQ1GyxgKGvN2DfXIHjjONx A==;
X-CSE-ConnectionGUID: sJ76HGqzRJaSrext6iuUpQ==
X-CSE-MsgGUID: KQdAaDz7SQap4yw8yyatgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="70680787"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="70680787"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 05:24:40 -0800
X-CSE-ConnectionGUID: j+JKLL8VTxeMGW/Sw0IVDw==
X-CSE-MsgGUID: YQrToLHmTguohKzO0rWhPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="203373914"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 05:24:40 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 19 Dec 2025 05:24:39 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 19 Dec 2025 05:24:39 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.28) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 19 Dec 2025 05:24:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DGbAVlrnwXQrmDh8beG00CZPVMCsRX2KzGMkU/6J/5Fx8qmaQ41VnDwcS8ny2akxFQR+16eOrbSn+Q2WOgPKv0afPi8Pe0duBCZcH+yx4bpw7ydohkfxsQBU4hJk7vsxwrvrF+SJTplzJKrz7wjHcCGGLV2I3N+SKRUGmB6OF/RT0Pzw/lkUJapCj5sgqKlI4K970uCnfgV956WcYPKhSHLdcPtd45nt/OouyImjJYdAK+1z5wrs34QrfdFvwDbSlcUMFbKrW/I3rn7jwoIjzhbj7BDRV7IS3xGBKw/sJxhSeFZJy2E6qBnezHYhNoZzXzHDmgIphcG3KjTym6Y/Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W/ahd25n8ARSDIttbxmbLl+bLWy3dHbF8vcK3s6/dOY=;
 b=exWKnXDIx9yuMp4Fk3V+kOmyQRIVTuuoqBnUhRP4PB0tZxbSH4I1IAbXVi8UJQWOWHikbUfoncetOmH+D05ldFEXJzCTwY0LK/lFN32pfHAPfzj+HU6I6UzO+nPiNefjvxPFKH7OPKEZ1ZO13lz4+i3foSZQebWSm29+AWDDwZH+czl3E+NrIL1V/CPtD8RCDPFdFyJcIPP2X+Ew6BVny+T2v0DQP0JSgz68g0J+l4NdNWGj1a1RWzZAxwculzmtL8XsgEvKNsYl7rQk7tQr4S/+gd0glbNcwp+rX6/4EB3c7GB0jW9M3kTt2QNCvmD9YvIidTxNNVVXIycSpCDcWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by LV3PR11MB8530.namprd11.prod.outlook.com (2603:10b6:408:1b8::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Fri, 19 Dec
 2025 13:24:36 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::45f:5907:efdb:cb5b]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::45f:5907:efdb:cb5b%3]) with mapi id 15.20.9434.009; Fri, 19 Dec 2025
 13:24:36 +0000
Message-ID: <90270417-b144-4eac-a53b-9f3f32ed1430@intel.com>
Date: Fri, 19 Dec 2025 18:54:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [v8 14/15] drm/i915/color: Add 3D LUT to color pipeline
Content-Language: en-GB
To: Simon Ser <contact@emersion.fr>
CC: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, "Uma
 Shankar" <uma.shankar@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <pekka.paalanen@collabora.com>, <harry.wentland@amd.com>, <mwen@igalia.com>,
 <jadahl@redhat.com>, <sebastian.wick@redhat.com>, <swati2.sharma@intel.com>,
 <alex.hung@amd.com>, <jani.nikula@intel.com>, <suraj.kandpal@intel.com>
References: <20251203085211.3663374-1-uma.shankar@intel.com>
 <20251203085211.3663374-15-uma.shankar@intel.com>
 <aTwwBMKUp5AYmFTN@intel.com> <f24364ad-a861-4fcd-93ab-3230a6b3299b@intel.com>
 <k4mMdQv6X-RIzc4veUD5pP2oD1KGp1Tx6ifJM6S8W3nrowRPz275vsfcNUHeflvxZaISPaM_e861Q-1rO1jnV8bNNmOdPJ3tyS3GVbnpbao=@emersion.fr>
 <31921238-6621-40d5-94b5-8ba3e5f9d40c@intel.com>
 <k3LqbZf-MaL96Q4M9Gi2ulFVSAPs8qKk3J7vvjzvqFwqbI-v8rlIi4f2Sr5KvVmB04UZXAZIPaLZHADswcIMESDOWilrOBNOLtRhlUcoowk=@emersion.fr>
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <k3LqbZf-MaL96Q4M9Gi2ulFVSAPs8qKk3J7vvjzvqFwqbI-v8rlIi4f2Sr5KvVmB04UZXAZIPaLZHADswcIMESDOWilrOBNOLtRhlUcoowk=@emersion.fr>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0006.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:174::10) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|LV3PR11MB8530:EE_
X-MS-Office365-Filtering-Correlation-Id: 4516c6ae-1c31-41d9-022c-08de3f01f432
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U0UrOVd0VldWUVJxR3QxNHFqRWJWbDBoaktYTW5sZHFnY0t2TWFvTFBjR2tp?=
 =?utf-8?B?WjRIVGV4RjdsUjQzMWpMRVFvSVI1SFdYUUd5ZjdUZk01T0VnNGp6NzVValRx?=
 =?utf-8?B?dVNVTTJJWnBQZ0l1dzNqRXJ4OCtiKzVDaksySGxpUnlMMTdtVDdpelkvUllI?=
 =?utf-8?B?TEVWMXBQd2VVenBtMkpraUhFN2c5UXFTWjA3K1VlSGlRUVVFOHA5K3hWWHdN?=
 =?utf-8?B?Ynl2Mm01bVZVSURoQXI3NmFxckxidWVmK3U2VHB0bmlQeUNLazFoRzdyUFY4?=
 =?utf-8?B?ZXdZTW5LaGlpVldPcSs1eGF6cS9jYkpXYWV5YzRPcGYvSVExN1JtaUFmZVNh?=
 =?utf-8?B?SC9POEpwTExBM2VwamlmRHZFUmpIZzhaeUYyZVdIRjlTdkJLbHI5V08yZGhp?=
 =?utf-8?B?ZjFMbEVMOHh3Z1l4R0dMUzdaNTd5SGFKNC9FaGNCODdPOUlZaENtRjh0MDJL?=
 =?utf-8?B?WjhGekptelJ5WlB1bEF2QlloUDhieFdib09RU0MvVDYzY08zTVRCZnJndVZo?=
 =?utf-8?B?cXFUWUhqZVZMeHlORHV6dVg2RnRYT00yZmdEZ0ZpdGVXUDZkN0dFeGNQUWQ5?=
 =?utf-8?B?c2xDM3RTTHRCOWdYdHFlSmNUaGZSUGsxUTZUOGVEOUk5OUJQa1BBQ1FESXNP?=
 =?utf-8?B?SjN1MENjVWlQWXY4am9Va0lDNHp5SFlkZTZoZW5JS21iYmMzZGJldHN3c3ZP?=
 =?utf-8?B?TlZHNTUvK3lVRnN5cGo0TjJ1Qmd0S3BHN2l1OUxzMzBORVdoaTRtY2xvUVRH?=
 =?utf-8?B?dzg5RHpicmdGZEJDdXpEMmJhWG5xS21IQVJ4ZXk5RTA5dSt6WUhINmFJN2lv?=
 =?utf-8?B?bWtBRy9HTm1LTDRTVE5vYUxROE4rUkczZVRBKzh3SEJtZjl3YUZSSlhreTE1?=
 =?utf-8?B?eUVFR1UvbGJ1Z3EwUGF2WjVKTmxvSE5wNFRPU2lWZU9pblR6UFJlb0dTNkJT?=
 =?utf-8?B?ZXdHR29qeDVaMXV5REUzcGczdVlJYlRVc1Vjd2o1b3FIWVNCaWJVbVRQVmRF?=
 =?utf-8?B?L00yaTV0cHJ5ZnpXQ3VxcGg2R0tGL09XQ0IwYkZscWRKLzJ3d3dKZzRsaEt1?=
 =?utf-8?B?U3FkUFcrSjRqTkd4blI2RkpoNC9USjhEVXRJM1pCRkx1ZjNLeXJ3TVhBZ1hN?=
 =?utf-8?B?STFlQVhjQVBEdjdaQ01MVy9mdTg5Mkh2MzIxVkhaT3F0VVRzNE0rM3RNaVY2?=
 =?utf-8?B?b1oyZFEzMlhBaE03QXVWck1hTmFxTGtGdnVmNmRvZ0VJdm9iY2ZLYTZRbUdH?=
 =?utf-8?B?Vy84OWV2RXFRN2pJM2x6M2w4cUoranhDUVhFa1BENEp1Z3dnYjVpRmQ3L2tv?=
 =?utf-8?B?azBLYTlRaEZSOUhZV25yWlo0OXhVUnhkVldjbmxXWnFoZUtKOHFRR1FBc0w3?=
 =?utf-8?B?Y0ZxK3Nwc1FJdG9mb1RNdTkrM014UXpmelN5VC9GZjBKdjRNNjl4YklqS3NZ?=
 =?utf-8?B?SXhucXFvcXRaMGhqcmlLWU94MXRtdWpsN2ZsaE5FbXVjcm1zWTdPWmFuWldW?=
 =?utf-8?B?VU00TjNUZFpoQUxuUjNuOE1VakVMZHR1VnJTRGxqM0pyNlg0bEtZOFl5VitF?=
 =?utf-8?B?TDkwZnlXdkl5K2JLTzNMTHhoeXNxemFCM3VOc0FIU2Vza2tlTjVieU1TYTlB?=
 =?utf-8?B?UnJDa1lKSFIzWFNaQ0lQRkFYS0VkckkvRjBFMkNGOTF4N1d1aS8yNzhxbmc0?=
 =?utf-8?B?SzJUa09ITElML3hSU3VZSys0LzdjdDAxQkViVWNDaHd5NUR1T1djVlBwazY3?=
 =?utf-8?B?dURIKy93V3BQcFJha0d2L2w0ODBuTW5HalEyQ2FTd1RMbjQrMW5kcXlTRXdJ?=
 =?utf-8?B?OWw3SEp1VzdxaXBHUTRIaFY0V3V4Z2k4eFFlUmNaTEl6dG9tVEJhZkhkNHlx?=
 =?utf-8?B?cmVMY3FZbmRHN2JyYW5OSDFDcVJOY09vUzFHejBPL0NocUJaVUpKTGdpSFhS?=
 =?utf-8?Q?VoJEoH47fl3IQv1N5u+l3fWI74RIURLc?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2tvYXg3bmdtekVKK3ZCUXcrWWs5NCtlZHRvSTZmN3ZzOS9nUkNBY3F4dFlQ?=
 =?utf-8?B?eG1oWXl6bEx3bHBNN2tRbGVLTVQ2UkVycmtUMWVoYmVIVjlJQTVzNGxOMFZO?=
 =?utf-8?B?WGRsM2xSNzZUVHlnTWJvNUVoUEVIS1JQSGxiT0krNzZnTHdDajBMR2RHZW9O?=
 =?utf-8?B?WjZsbGZmSTRaWFZnZUJLZmp4T0lPUEUvSnA0ZkZPenNtOElPSnRrSWUrRVpW?=
 =?utf-8?B?ZWNaWmpsU3FLWERxN1VCR01IT3I2Y3VJcVBuQXBtTWEzaG16R2xzdGxkcy96?=
 =?utf-8?B?WXI0N0w2eHIxcXoxWisyTG51Z3IzcndQV3grWEVPSzcrdlI1WjFKUVdPZUNs?=
 =?utf-8?B?WVJReGhGbmRUWlM0dTJuUWpaQmhsa05iK0RlRVphWENNWkh1UEh1ZDNaUkMr?=
 =?utf-8?B?eC9SQU8wT3dKdStCVFZzWmRFS2xFb3VOaXhhRkVIM3gyMkU2ZWtaNitJcW9u?=
 =?utf-8?B?Z2J4bWhHRzhnOEl2QnU2YXg1OFlEcys3a3dNTkRISno3c0lrdDFCbzdEWnRt?=
 =?utf-8?B?cHBCeHZoNGc2RWk4Vmp2WCsvVTU1ekRBSDVONzUwMmNoS2puMVJWZUdZS1Z4?=
 =?utf-8?B?RUZtT09sT2wrdTQ5am9hN0RTUUFNZWtJT2IwVVJOcVpTRmt2QWFTQ2E3aVA5?=
 =?utf-8?B?NStPeFI5UWhTUjN3Y2Q2OWlYREx6cjRhRnNCdkk2cmhuZ2dmL0Z4dVpaRDRH?=
 =?utf-8?B?bnl6YU93eVhBZmtCZG1mTmdqSCtxUlZQcEwrdTZmWHkrU25BYVpaWG1OZWgv?=
 =?utf-8?B?dzdzMzE3NllGakZqT1I4NUtXbWJRTXk2ZU1FckhoQ3ZEeThIZ0FyYXN4MnJU?=
 =?utf-8?B?NHZiYkI4NW5rYlA1bXFhVDBBZGZ2eStWS3BzeFhWV3UrNCtZNkFkdzZoMmll?=
 =?utf-8?B?UjRMRnkxMWttQzVGSWF3T09uSEpmL2FtNFhjVE9SREtSS2tDcWlDcnlTMWlh?=
 =?utf-8?B?SXdtWTFRWk5BUVd1cVl3aVBlSDJYaWk4eWRJVStybG8vS05IajFVTmkzWWh0?=
 =?utf-8?B?ZFhENU4zNXAzdDkweWI2cmZMdzg5THJKQnRERVVnRHpoUHFTSWJvOHNtQ0dj?=
 =?utf-8?B?S29xeHdBUVlsNTc1NnY2N0hJdy9BMXFLRUh5NDlYSDFxM0NMYTArMDZnbUVo?=
 =?utf-8?B?SGVrTXNseC9PY216elNScWtTQ091ZFBhL1NKT25VZWhuQVl5clExcS9hN2pR?=
 =?utf-8?B?dCtkci9YczF3NVIreEJCUjdmTWJSYS84blVabHUwYVdJT3ZDb2FLbkwxcE1T?=
 =?utf-8?B?WGMwOWgrMTJ1ZC9YOUxJeVl3VXQ0UnhZVUkxckFtUHpvVWJiNG1kUEhOUExC?=
 =?utf-8?B?L2tpRVNiRWFQSll6VDkrMEhDQmlXK3VlVldHYXVMN1lQWkRwNWlzV2IvZFRo?=
 =?utf-8?B?cU5qWmNmaTA1SitmMWtwTWVvUEtDWHl3Q2ZVUVk5OThSckpjYTFZek9PUGJw?=
 =?utf-8?B?VFdkZHdTVFFMYjdXbEd2TlB0c3JsV0hDVWFjL0c0VTRhNmg0cTc4OGZ3MGNq?=
 =?utf-8?B?dDlxSnQ1Sko2WVZVK1hxVzRrckJDdzJySGljMGFXYnYwbG5ieTU4cGVkaDVk?=
 =?utf-8?B?bytMdXJaS3VMa2ROc3g4azJYSHlrT2JWVkpCS1NsUVVIN1A2SWp0dWx2VVJk?=
 =?utf-8?B?Rm1mOHNkVjAyZXhRc01zSk4vbUpyUDBEY0RycFk0Y2JRM0NMeXZ5dW5XeGI2?=
 =?utf-8?B?YzYxYWM0SzVDaHpLTWlpNFdiekFoY1lnTzRuaGpDNzdVTmpYZkNYTDZnK3R4?=
 =?utf-8?B?R3ZwZ0RFdVNuRFN1Vzg3M0ZjYUZJL2l0b003US9jbFp3K0JJZnd6WTd1SWVR?=
 =?utf-8?B?SEdKK2dhcEVDVVQ0UTI1aUpBcUFkU1hrckM5WnFML0IweTZMbkMxalZPcW5h?=
 =?utf-8?B?SXIraFNHS3BsRDRuQVZPZFl2b1EwMlNOWEl1QTJqcVJaZHlrSExWQmhweDRD?=
 =?utf-8?B?R2tDT3VCMlUvRkxxL3NVYko4WnZneXVTWGZBOVhVR3Y4QXpieSt0RDRqUUtX?=
 =?utf-8?B?eWMvN3BkeDI3RzFja2tBc3Bsa1BTMGZJNjA3OE9KT1lJU3I5Rk5COG0zeWJT?=
 =?utf-8?B?eDI4TWE5QUk2QmVxdTgxd2RTVVduaWJiTHJKTVYvam92enJodHVHSUVzZ2l1?=
 =?utf-8?B?cG43WHY4UXRYeEtPSjNUcnpMTHhIV2lQdXRlbmZHaStpTDR1V1U5eDlyUG9i?=
 =?utf-8?Q?0qb2h1Au1krb0y6qXut26Hg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4516c6ae-1c31-41d9-022c-08de3f01f432
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 13:24:36.1134 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fqSGYU6RWvWh5dOlf3bWWJFGA5KeW+nrGxfRI5RE7J1h5tHNvWk6wMlISm8B3u7JnjEgZhjQd8LsY6zLUGQi/igTCpqVHNLmXzykrYL3ZNc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8530
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



On 12/18/2025 9:45 PM, Simon Ser wrote:
> On Monday, December 15th, 2025 at 09:43, Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com> wrote:
> 
>> On 12/12/2025 11:55 PM, Simon Ser wrote:
>>
>>> On Friday, December 12th, 2025 at 18:47, Borah, Chaitanya Kumar chaitanya.kumar.borah@intel.com wrote:
>>>
>>>>>> +void intel_color_plane_commit_arm(struct intel_dsb *dsb,
>>>>>> + const struct intel_plane_state *plane_state)
>>>>>> +{
>>>>>> + struct intel_display *display = to_intel_display(plane_state);
>>>>>> + struct intel_crtc *crtc = to_intel_crtc(plane_state->uapi.crtc);
>>>>>> +
>>>>>> + if (crtc && intel_color_crtc_has_3dlut(display, crtc->pipe))
>>>>>> + glk_lut_3d_commit(dsb, crtc, !!plane_state->hw.lut_3d);
>>>>>> ^^^^^^^^^^^^
>>>>>
>>>>> And this looks like a pretty major fail. Why is the 3D LUT stored in
>>>>> the plane state when it's a pipe level thing?
>>>>
>>>> With DISPLAY_VER(display) >= 35, 3DLUT can be attached to a plane.
>>>>
>>>> (Bits[23:22] in 3DLUT_CTL). This is the only way we are exposing the HW
>>>> to the userspace right now (through the new plane color pipeline uapi).
>>>> Therefore, it lies in the plane state.
>>>>
>>>> However, there are (soonish)plans to adopt the color pipeline for crtcs
>>>> too. Once that happens, it needs to be handled a bit more carefully. A
>>>> potential approach is to allow userspace to program the block with a
>>>> first come first served semantics and fail the commit if it tries to set
>>>> 3DLUT both on plane and crtc in the same commit.
>>>
>>> The plane 3D LUT must only be used before blending. Any pipe-level
>>> post-blending 3D LUT hardware block is not suitable to implement plane
>>> colorops.
>>
>> Same 3D LUT block is shared across pipe and planes. When we do end up
>> implementing the pipe color pipeline we would like the 3DLUT exposed at
>> the pipe stage too.
> 
> Ah, I see! And there is a switch in the hw to configure whether it's
> applied pre- or post-blending?
> 

Yes, that's correct.

>> However, there is no good way to do it in the current color pipeline
>> UAPI (atleast that I know of). One suggestion from Harry (discussed in
>> the hackfest) was to list the pipelines in order of preference of the
>> driver.
>>
>> Considering we prefer the pre-blend 3DLUT over a post blend one, it
>> would mean that we don't expose the 3DLUT on the first pipeline on the
>> crtc but do it in the second one. (I am not sure how well it scales though)
>>
>> I have considered other solutions like introducing a new property say
>> "muxed" which could be used with Bypass to indicate if the current color
>> block is being used in another part of the pipeline.
> 
> I think two pipelines + making commits fail when they use conflicting
> colorops is the way to go.
> 
> If it turns out to be a generalized issue with more hardware and the
> above solution isn't enough for user-space, we can think of introducing
> a way to describe the limitation.

IIRC, AMD also had similar HW semantics with some block. But a problem 
for another day, I guess.

==
Chaitanya

