Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90372BD7FDB
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 09:45:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7671F10E56C;
	Tue, 14 Oct 2025 07:45:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eP7D8UIm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 297E210E56D;
 Tue, 14 Oct 2025 07:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760427948; x=1791963948;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=NkhDBz/KTM1OxtdYNae0aXfdhhN1cDbdfcASLuAa2e4=;
 b=eP7D8UImADN+IpaalVqTAeS8JoQB9VeT05f8tx7CevMARHLQF0l3n6y2
 Qv7Mns3QBMayv04qEMK7JhPkkVX9EfW24CT9gij/wx7MEdnaK84QOUORZ
 Wlwm2LVHXijZkDST8yjmDXIX61upZV3J8DLaVxA1Mc4Mnhy9tDrZo5w07
 ncOB2NKJ+c7+lhy67H8Ca9aXcKkFE/JTQJ/qoW13siSZPNdcKcm8CeDaz
 563oGbFgonyTCCIAyN58B87sEvmeLt4p+cGkbz78oMZ8qrh39LcPZKgiX
 JNKYmyFh2gh9J4qYDQTFDHO0I0VLR9jdUQ12wFNw9T9Twkr17qUn45W35 Q==;
X-CSE-ConnectionGUID: RTFLACD1TFuiER0HUxnlwA==
X-CSE-MsgGUID: 2IfQiluxRNOu/lgBJv+D6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62490993"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="62490993"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 00:45:47 -0700
X-CSE-ConnectionGUID: fk2cvyleSNaZFDEdoXZTbA==
X-CSE-MsgGUID: 6FVHfzMwTk6maqwMbYFCOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="185835280"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 00:45:48 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 00:45:46 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 14 Oct 2025 00:45:46 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.71) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 00:45:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WduAS+t3/jEbiF+/q/u2/pxRGVGYamJOQq/kNB7Y2rzVGQ9NsCs6cmQqD8yf30DcNlC0a439vRafjjoRFRaMv8Y011IgcHCwyvUKd9nJxtS8144qDKZv5UKhLpMzbGGqjWA2R9GXHZvc/Y7V/m8snfu43o1sW9rrr4YBkpLnsfAxEjDXOgQTq7PSCNpYKMk+iqrE4fwzA5tgUvnEI8lBU5eLDNYoOVK9okrS32JVLTc4ewmMSvW4lkJx98uT/d7NoOEnkFg34Kedxg7XByN8VTkHFaOgDRPnKqlHLbOwOcPtwy9RlDXtm7gRpAta0zg2MgEZ8OHLK/xZfb3O2epzFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GawOG3U29EVFuoL14lPtPSH4i1W06UZ56aolmAYgS5w=;
 b=BgGU4KAoC16+kTG/OSaw8UbnkDIIPHWYKGgR/ONrW1xlh/F8uLNVc+Ql37Oixy78Z0ADNdpLFrGZVKVyHP1tun2XlJmi2B5Jk+ToM+YjhBwYGlsY0OnejMP/24UCUa2UnbHtexOr3ynpJmySND+2HdyhmKp/dnmkD9umSj3jNgxEgf9iE6Jm/NfcZUSjUl7jFemX6RAAR8NPd4ADAmVIgzN7jRawgHqV32+1iLU44X4HTI/on4iF5hcYem6x4fiev6/M0q/0Um+RA77LvbmsjqlQtLKwxk3oL2cEaAD0yzGSka7ns5P6xIe0LCqLUVE8TEibjg/bsvet+HmaVWI5Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by PH7PR11MB6954.namprd11.prod.outlook.com (2603:10b6:510:205::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Tue, 14 Oct
 2025 07:45:44 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc%3]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 07:45:44 +0000
Date: Tue, 14 Oct 2025 07:45:33 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 "Jani Nikula" <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Krzysztof Niemiec
 <krzysztof.niemiec@intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>
Subject: Re: [PATCH 3/3] drm/i915: Wait for page_sizes_gtt in gtt selftest on
 CHV/BXT+VTD
Message-ID: <ysmmufb2ip4afbgvplq2vxldyawhteibeviuahogoo3dawocdt@zyg7etradvfy>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20251008161258.3568573-5-janusz.krzysztofik@linux.intel.com>
 <20251008161258.3568573-8-janusz.krzysztofik@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20251008161258.3568573-8-janusz.krzysztofik@linux.intel.com>
X-ClientProxiedBy: DB9PR06CA0026.eurprd06.prod.outlook.com
 (2603:10a6:10:1db::31) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|PH7PR11MB6954:EE_
X-MS-Office365-Filtering-Correlation-Id: b069dc8a-42a9-4dad-904b-08de0af5ae2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OUg3S2toMUpqdnhxOWF1ZGNuVmhGc3hCVVUxZS9VR2daVDh3Vlk3MnRFMmQ3?=
 =?utf-8?B?SkVMelI1bHRId0FBMVNFNW1KUEhBUUgvMjIveVFzUVdJbEttRG5FTGdOeUtW?=
 =?utf-8?B?ZUtiRzdsU3pIc0RLeUorOW1Yd3dWdnEybXZqVjNwYXdpdEg1dmEvYURBbHhP?=
 =?utf-8?B?R25ZcWxYWHIrTkF2T1YzN3U0UVFxRE1QeE9BNW82VktBMFhkVVY0Q0VndVZl?=
 =?utf-8?B?U0RWQkhFNTNEYmkxU2FPYmNvbUh5UEg1MGhpRHFhRDBNVzdENXVyY1g1Ykky?=
 =?utf-8?B?UTdPSlhBTkJlQ1JjV3pRT3d2cDRlbFFBVWlZQzhUdWxmcWt2WTBIdWJWdE13?=
 =?utf-8?B?clZCNE1yODNYZkpSMGNmNTlHQmZrT2ozS3NUNzhUazNqMGpjV283dGs4Z1Z3?=
 =?utf-8?B?eTFZeGF4K0JVM2poVHVNZC81UTlicEhyRzlacVNNK1pramNGQmlYMExVc1Vr?=
 =?utf-8?B?eEdkMzJXeXRDQzRJbFlyVHMxRlNxUkdFbXlBRU1kM25PUjFnemMwU2tzazRV?=
 =?utf-8?B?aFJRNTVLOHJMRGk3aGlXM1dkNmtvVVlIN0k5ZWxKYU0wcGwrdStoLzFrZjcr?=
 =?utf-8?B?MjFHcmNkTEhIblZkWFpXR1huQWd3M1huNmtBVGdIamJsbG5nZExYWitFcm9k?=
 =?utf-8?B?NmdtLzJ6UTJUOTdqek5mQXJISkx1c0x1MXZpN2lHcVBwR3dkUTRkbGFiVW9C?=
 =?utf-8?B?QlZrZVNHeTVHSHAwRVVDeDdvcURpbFN6MUV2R2dtV2E5cm54Rk9OQWhkQ1Rr?=
 =?utf-8?B?NWpIc2t3YzlVbGdOcVRVZHBBTXI1NS9Nd3A1bUtLQ0pGT0RWWUlPeU9sU0JD?=
 =?utf-8?B?K3ByZDhEaFBsZlJTaFlJd3ZISzh3NnRQc25TR0l4OUdySUxJWnRIcG9GOVo1?=
 =?utf-8?B?a1JQODRTODZPVVdQZXJWdHhqQUFvNkt1WWFwazNZb3psWXpmajRrWHVsQ0do?=
 =?utf-8?B?Qm82cjNNUlhJUnA1ZlBWR21zRjRETHY4MlhJQTU4VGduU2M0S3cxendZcnpQ?=
 =?utf-8?B?NEErdmtuUnVSTFRtTFRGS3UwZ3hOMDFMbEtrK3U4SGkvWXpqdUhjZkYxWHA4?=
 =?utf-8?B?TEpFVTJnMkdVU1JOK2UvNWkzR1pVZWhyendGTXhRdyt0blN1NWRhRmpvNm5G?=
 =?utf-8?B?RTVwTVRkMS9NMkdzdkNtZmhmOGdjR0tNSldibjVDRnk5Q2o0RmxpbVZtaXpk?=
 =?utf-8?B?RGlwTkZ2cm1DTWVoaS9YSUd6Mk1NdkV4R05ibm81V0dLYWZQTDBoZWhBcXBv?=
 =?utf-8?B?Wk44aytycS93ZmdFUWJkOENZSmgyVHZDam1ZK3hTdEdsZWdPRXdlR2c5clVG?=
 =?utf-8?B?RktiT3hLd2pjSkxxbWtTVVBsVGRzRjZhYXJoU2swckkrU0VDNS9oTHowVmtI?=
 =?utf-8?B?cUZNZXRmNHc4VEdYcHJGTTdBZDNDUGxBU2psM0FuZEZGcGxobUppMERuWEJU?=
 =?utf-8?B?eVlJQTBLdWFXMDZ1alZmaVpiRlRMaHlRSXFRbDJsWHVVRENvUStQNHcyb1FC?=
 =?utf-8?B?cnhoY2hGWTJwbVFNRmxaRlJzYW1BNnNVWkNzNy9VL3NKRjMycHdWamk4RVFY?=
 =?utf-8?B?Zk5ZeWRYeW5RcmYxeWtmN1NTZjhqOW1jMkhtcTlWUFFmSzlyVFhNSitZcllQ?=
 =?utf-8?B?dkNVNVVPWGF5TWd1SVVuQVU0NWNnNEcyZnRpNW9PV2pRaDk1a3NITU5BYW9k?=
 =?utf-8?B?MStIRzB0YnpaSjUrODhIWUFNVEFVWDUvcDB3K3MzZ2lpZFliaWg1czV3Umdq?=
 =?utf-8?B?TUY1RnlyQURrSkE5YTN2a1JlUWRPYUVVcTBzUDkyMU9iNVMzZURaVEVOWUhY?=
 =?utf-8?B?R0J1ekxlelpvRDlEQ2JCYnZZSlNhMm4yYnBzOHNGU3BXSTRjVDUxZ3VMb0ZH?=
 =?utf-8?B?d3RGbGxIUFBYSmJ1RzIrcDVZY2U1dm00bFNyUDF1MHl4NEVPa00yZUhYVkpU?=
 =?utf-8?Q?jSuzbJSUhw6PC12zH2xAdBcsoL1BWVc2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TTJqL3Y3V0xZbUFZbEpNOEF3UGdVV1dzNDB4ZVgvdFJUQ0NXMkNwUW5DTThK?=
 =?utf-8?B?SkVUL0V0ZFNUbVFzYzF3enJIWjc0SThWdVRuSlZRL0oyN3NTN3VkelN4b3c0?=
 =?utf-8?B?ZEVia3BJU0h6bzB2VXhXS2hrYXpFZUgwN0pUUk9iNHpUWEswRUVWSHdhTHNl?=
 =?utf-8?B?UDBkT01zcWlMT2VRTkpaMysrbUx5ZmgwVW9ZT3g4alhQY2d1Z3dWZFJhemNM?=
 =?utf-8?B?aGJmeENzUmxRV1lINnBDYjRMbHYrTVErb0h3NGVCUmF2K2NRdk12K1BhRnJK?=
 =?utf-8?B?ajB2Vjg3UWRVazc0VEk2ZVNocGdrS3o0NmFRWkp4ejh5Si9XUTNQdEVjZGVW?=
 =?utf-8?B?VmZPRmppNVJpWDZzcm1LREo3R0pqUG9LM0ZjT3hlRWoyVUNzSGpoK0FVNFk1?=
 =?utf-8?B?QXlxcSswMTNEVW5MRWpZMmhTcm5tRmtuUXRxdk5PdzBnYnFxcSt3ZHdhaEs0?=
 =?utf-8?B?MzFmaGwwTmNXeHF3bUNGZGNCWko3UDNKZGxUQ1l6N2crd0JrQzh2ZUZCdTFk?=
 =?utf-8?B?ZDJPSjJSUlJFUDh6YnBpTzF3TFNqL3pKY01zNlFhUUpxNlBmSDhscnNYT29V?=
 =?utf-8?B?UTVsL0g4bEdKMm8yUVRlYUN1ZjlUTTZKM1cxN3R0Tm5oWXVlWitpcHRRUFhj?=
 =?utf-8?B?cys5Z2tmMGFUb3JxNHhMeHl5Vm83bCttSmhhOGdudnNsQkN1cHYzZ3BoY0J1?=
 =?utf-8?B?aHlqb3J5b1FhOU00TlZ1M0RxL2E2MFExWXVmYkFBcmFyOUlzbkJVSFpCV3lm?=
 =?utf-8?B?d2hNUVJQMjJzRXFGODNPRnRzVytCM0tENzJxR3RwaW5iNWRrM1VVazVFN2Ni?=
 =?utf-8?B?L004cXF4ZURTYit6VE1tOWp4QUFZSkI0L3FSTnlST0diUDd2VHloc2RQZ1lW?=
 =?utf-8?B?YnYybHZvMCs1eGJXdG12U040ckJtZk5yUUZiRTlKQlZNN282VG54YVkramU0?=
 =?utf-8?B?THhtM3RYaGdYRFB6eGNSOFIrdis4b0kzUGJvWm9wNGVRaFdaOFdSQ0xhN0RB?=
 =?utf-8?B?SmhCTlREbU5ITFoxK01oUHFwU2N3UlRFMyttNmc1M285MmdYWUw5NDFpaGVL?=
 =?utf-8?B?WjBpS1RqanNjQXl5UjBpbmtxWnlUUlFTYTZWTFNpSHZhZmJRTncxUEVwQlNa?=
 =?utf-8?B?TzcxV0o2U0g2c3NaV01mSnd4WmJOcUFlM2pYdE51UjFpNWtqelovSDJpbUMw?=
 =?utf-8?B?aFUxMUpUOTVUcHU4QXRIYUo2UWJXRzFzNTNnN2FWSm1ueHA5R2ljREpRVFFX?=
 =?utf-8?B?cEVkV3YrMjF4MWJDVnVJWVBvUEdSZjVYV0srWkNMeGp4U1JmQzF2ckcwcHB1?=
 =?utf-8?B?NzhzYTJXdE1yOHlpNkh3U3krN3dOZXVlcFZOd1hKSXN3UzVqaWpYdlJraEEv?=
 =?utf-8?B?azhrR2hVa2JiWG5palhRZXJ5OWk1QjV3aHI2UTJCZ1kzZ2JZUUg2elhVQk9C?=
 =?utf-8?B?Rm01K2RWSHdoNHE5SGtzd1pxbk9ja29pR1VkOXBGTGhIdlNQNWF2NC82d0c4?=
 =?utf-8?B?a2x5eTdhaUlZU3Q2WXJ5c2xaRVdXbVdTM05CZlcrUDhENUxlL0xIdmd6NHJm?=
 =?utf-8?B?NndkcU92TXdUdlBQOEVUYkZ4ejlFS2pPN2Z1UjBWRFhabGJIcXpoaFgwZS95?=
 =?utf-8?B?NEVUcTZubWtLYWNhaS9uRUFYYlAvZHduMDhOY2NpbEF1VjJ2ODRySy9OUTVk?=
 =?utf-8?B?V3huVGo3bWpqdmQ0K1FpWWhpNnlxdkZlMUx4VzBhRzZpbjNUR0lWUHJrR09w?=
 =?utf-8?B?a2U2Wnl0V3MzeDJIM0FIMEoxdG41K01yRUJjbjB5VkVvRDROeVppUVRTMUo5?=
 =?utf-8?B?YnljVHE3emRVZ1dsOFAvdmlHN3ZoUVdTejloUlIyQmduN2VralZjbkpEbDVn?=
 =?utf-8?B?OFNacVBORDFzR2dmcmFBME9nZlFjM2N4bXdCYlozVGszWU9iNmJXV3VqY28z?=
 =?utf-8?B?R01GbzlUdmRBcjg1VzdLTU90MytyVXBXWlpWNittai9oTGtnWmZMOVh0OWxL?=
 =?utf-8?B?UUR2RWtlV05tWCsyam9TWmNuS1hQS2dCcEoybEI3d3pTcy9hVFd5SFNicU96?=
 =?utf-8?B?YmFmdkoxY1k4VzF5dEFESXBmM1NDZVJ5a0t1azQ2Sk9ad1NJM2ZXT2pHeEdG?=
 =?utf-8?B?R2hQeDMvQzJFL3BQUnFWKzZVYmNkLzJmcG5VL3V2My9sTSsrRHRmUm5sdGF1?=
 =?utf-8?B?U3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b069dc8a-42a9-4dad-904b-08de0af5ae2c
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 07:45:44.0004 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HOmt0LZqLID48+hYPVwYbgz/aOJ5y638J99OK9GUVqNVZXy5yuV15YUhQRm6Khga1U/rWZdXieTnvtuTGgIFoVXXsU7g1htkxm3eVZAb3O4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6954
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

Hi Janusz,

> VMA binding to GGTT is now asynchronous in CHV / BXT+VDT enviroments, then
> vma->resource->page_sizes_gtt the test uses as shift count may still be
> not populated (equal 0) after i915_vma_pin() returns.  Wait for VMA bind
> completion in those cases to avoid shift-out-of-bounds kernel warnings and
> the test case failing with -EBADSLT.
> 
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/selftests/i915_gem_gtt.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
> index 7ab4c4e602648..0a86e48575394 100644
> --- a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
> +++ b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
> @@ -1118,6 +1118,10 @@ static int misaligned_case(struct i915_address_space *vm, struct intel_memory_re
>  		goto err_put;
>  	}
>  
> +	/* make sure page_sizes_gtt has been populated before use */
> +	if (i915_is_ggtt(vm) && intel_vm_no_concurrent_access_wa(vm->i915))
> +		i915_vma_wait_for_bind(vma);
> +
>  	expected_vma_size = round_up(size, 1 << (ffs(vma->resource->page_sizes_gtt) - 1));
>  	expected_node_size = expected_vma_size;
>  
> -- 
> 2.51.0
> 

Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

-- 
Best Regards,
Krzysztof
