Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8B6B230A9
	for <lists+dri-devel@lfdr.de>; Tue, 12 Aug 2025 19:55:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3ECA10E62A;
	Tue, 12 Aug 2025 17:55:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EPzca7Rr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D51DB10E629;
 Tue, 12 Aug 2025 17:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755021317; x=1786557317;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nA2eaith4EffPh/KfjE9M3JVHynyHwBzorksu8Fr7eE=;
 b=EPzca7RrDUxbmBo3RA814ZqvVLc/Hton0+LRaQTrb/BihnGiLgX3HRwi
 W1ATDdfpKQK9i8sC7Jcel7wgCHou0dQhw4NlE1maGkEuKmghZcWHR5Ld6
 OL5b7AOUAXTefuJQx4poj2H5t4jONWDepJunbvj6DMh0pu8S/3zG27qKF
 RXYcx4ZfMr5GxZFyzEOGRicH9R4BnP0rpVh4m5gxzJNdt7n4YahmJHwPe
 KnO+YNRxToXn6+QLuyEOJkM9xVBhKnJ8xYIUm5PO7DFwzhoxRg2zjj99B
 Ohs3GI1MCsSouMj+n42AXRf8bcAv9vLsuXYWjx0ve3rU7qyMSkJYz6lHn w==;
X-CSE-ConnectionGUID: 9jHVFQ3pTGKhYwydpMSETw==
X-CSE-MsgGUID: BsR54/BCStquGoi6PMCs/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="61148924"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; d="scan'208";a="61148924"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2025 10:55:16 -0700
X-CSE-ConnectionGUID: cMn+ZrZ2Tmy+zc1dOC+Ylw==
X-CSE-MsgGUID: xlW1sdU8QpiPubI5iQIDkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; d="scan'208";a="170477434"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2025 10:55:16 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 12 Aug 2025 10:55:16 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 12 Aug 2025 10:55:16 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.64)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 12 Aug 2025 10:55:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kHnNyqHFf+XgtLXQGkrRr6bWo8VsEL1LytvpIvvNt7FYKifzt3tlq8d2MQZK8uR5HPmmkQZeDFIhHSGc14AO/ZFxXHQ8mane1+eBEVJoFTuzh5A5B1ssrAWFwT2yo+MjaHMObzNQcPKXKLvI9QrWEz2bq7+ynxEvY/7Ja3/FL5hF07DpkfDDHgYphSsIO8LRt2G0tAFbpUqz6CnONyrMp1JnOiRBLT8AWyPHEsZ7VZHc3q59rcIW0IysXhjtaXogvCEAGvfKBCAXaYA6U+MQq8oTkZHc/BcIIOhz7pCd14WP8HU23/T1RKRq8FTHX17yHkoeYpeL28eWgMXj1QvvDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yso/h45Idpir/ZmECBGuL9KBlSHXaSQS4RZsldHTpvc=;
 b=pgpMjZJKrPfjeJEnnGlX1sT+qnPnTair7xYaB0Ypc4DQt8RlQy+ktyLEcU6LvT+FCB1SPz8y5zjjtwneIl6C3u36N741CsGcLYOW/Z01ETsdgLsNJ6nszYv38OzRekaoNA1Tj+IA0bLrkCZ8gW2rNd9++iVqMXlbtrsDyHDT5yVGRzY2dqvU7y07p/DspTQaj5mk8gkNH2WJuqxVwIyKdPbOOrdbckkTatMg84pkjM3a3qjohaRVAf7ZBgFvJc0/8dtXg9/4H8+XI2vNsvajhtj5xTZl5eBOA8r/a+/T8mPN2sO5434MK/A89upxChyUixNN3eMwkaT+k251GDAe+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by CY8PR11MB6915.namprd11.prod.outlook.com
 (2603:10b6:930:59::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Tue, 12 Aug
 2025 17:55:14 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::e40a:ca86:8d29:b2ab]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::e40a:ca86:8d29:b2ab%5]) with mapi id 15.20.9031.012; Tue, 12 Aug 2025
 17:55:14 +0000
Message-ID: <6fda0070-5811-4729-a0c8-0f877c9abc79@intel.com>
Date: Tue, 12 Aug 2025 23:25:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/26] drm/gpuvm: Pass map arguments through a struct
To: Danilo Krummrich <dakr@kernel.org>
CC: <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Boris Brezillon" <boris.brezillon@collabora.com>, Brendan King
 <Brendan.King@imgtec.com>, Boris Brezillon <bbrezillon@kernel.org>, "Caterina
 Shablia" <caterina.shablia@collabora.com>, Rob Clark
 <robin.clark@oss.qualcomm.com>, <dri-devel@lists.freedesktop.org>
References: <20250807164338.1832254-1-himal.prasad.ghimiray@intel.com>
 <20250807164338.1832254-2-himal.prasad.ghimiray@intel.com>
 <DC0LRSHVGYYQ.JY2VS78B5EMM@kernel.org>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <DC0LRSHVGYYQ.JY2VS78B5EMM@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0106.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::16) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|CY8PR11MB6915:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d15e573-88fd-4d39-1cd8-08ddd9c96362
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NW16T2hsZG5PaFliSGIyYzRHa21ORjFsRXIyOWFjR2hlZ01iOWdjaWhWNURu?=
 =?utf-8?B?cG4wQXZyazk5WitoRm1rUG1lMXdWK0JmV0ZCbUp1cEFIc1dnY2VtTHhpd0RT?=
 =?utf-8?B?NWJsTmNER3Z1bkR4dE9vbDF1WXZmMEt2eGVGSXlvWHl1NUppU0d0R1pMWHFD?=
 =?utf-8?B?ZHlwcTlQcnNMdUdVbmI5TzRFb2RDU0YxWDZFOEszT1dRTmV2VEpFWXBpTTZp?=
 =?utf-8?B?R0pkYnIvVEV2VVZ0dzhjK0U2ZTFUWnBVaFZlNDZxZ29OUnlXNDUrd0VuNDFt?=
 =?utf-8?B?cCtmNnAxTFhmSms4eUhwbHVhMTBra2l1NW96YnZPSXVWdmt4WWJvNkRRcHNC?=
 =?utf-8?B?U0ovaDFXS09RQUZIRS9PQ29hdHFwYk80UXI0b1FZakVQUmZFT01HVjFIelNu?=
 =?utf-8?B?WG9HajlDNkYxb3NDZDlwSFNsU21BMkN3ZTYrQjBRNUpLZjBSUEkyREkvbFk2?=
 =?utf-8?B?NUJFRnkyd3ZxOTdlQ1ZyQTM4a3llOUdQbmkxOGZLYWJnT1oweGg3L1BjUlll?=
 =?utf-8?B?L1RFNGZWRnY3V0tqY3dYbC9QMHpQUHBXUXl6TDVxMXhwS3dUWUNaYWZRMVZL?=
 =?utf-8?B?M1RCWEdYbjBEeFpkTC8xNFBNZXJGUkFoZVBFemMrcUNzQXR1U0IzVEg2alln?=
 =?utf-8?B?ZXhoK1Fwdnd5UjRlVEo1VzdEYW56N2tCbzR4WjFKbTh3KzdMTnNKNThqZjM2?=
 =?utf-8?B?UzladEVOd21aVWE3Sk1GRnJlMnFqbFI5MEk0VXo3MFJMRGtrZDQwS0daSWYz?=
 =?utf-8?B?SmxYR0lPRFpNUkFOelZtZEtmRGtCbm5kZ3RsMTVrTzA4MFdCR0lpdjhwM01s?=
 =?utf-8?B?aHhWRTVLNy90aS9aaFJFbExQWUhSUXVHZzM4a0RGNUJlU2p3eGR3MC9vVUNB?=
 =?utf-8?B?MVNLQ285S0hFVlB2VU1idktxRWdsR1c5bWh1NTVNb3VPdFkrb2FtL2ZDTmkr?=
 =?utf-8?B?MlJwb0hTVXNuTXJYMjh0NE01eG1hRm4xclRtUjVRMklDT3NHMVVRa0hVVDZs?=
 =?utf-8?B?b1UvQ3grSjJWcGhabzhrVHZWUGJTT25vdkhwbzNxQWtjOTBVU2ZTSS95cmlI?=
 =?utf-8?B?RTFvTTNEenkwNmZ0M2NsNlRIREkza3dBM1oxZ0U4K2ZFZnl6NWl6L2xaZFM3?=
 =?utf-8?B?QlplK3Bmc1AvT3JtdnozaXFjcExjWlZLRm1LQksrRitOQUhpNU5XTjRYNnk3?=
 =?utf-8?B?RTVkWTlIUlBRTmo3WS9nRzN3UEltR3JQQStwQjcwUWp4eHUzMjB5VFdnY3JM?=
 =?utf-8?B?ZitQOTlaRlIxZ040N0RyV2ErVWNKUXlmSC9GdG9Pd0pnUExpQ0kwdnhra0tr?=
 =?utf-8?B?OEhST0IzWVNxTW5EdnpwTFpHbjVIbS9EaTR0c0tONHdzVXpKOWl4Kzd2WjUr?=
 =?utf-8?B?TFVtREZSS09vU000dHE1cGxtRHlTUloyWjQvQzFoUzhZblpKVTY1emtPbDJG?=
 =?utf-8?B?aCsyMEdreFY2VVpGRzFmK1Z4NWhmZmdNUDRvbzRCajI0WWM1bk5LRHh0UWJM?=
 =?utf-8?B?YVZIcHVEYUVPaTMxb0NnSElRNC9wS015Y3ZoNHN0SFFtdTZ0MGp3Q2VJdkl6?=
 =?utf-8?B?aUU4WE1rcFhaZmttL1ZiVmdZa0NPd3NKcWZ6ZnBXL1Y4MW1CelFMbU94ZXNz?=
 =?utf-8?B?c3pNRGQwb2J5TzgySzcxOEp5eVpNeGI2WFJpazVBcmNIQ0F4VzVCQmhyRDZR?=
 =?utf-8?B?VEVvcW5Wa1R6ajBueExtWHZTRXRIN1hPMEw5MzJzUFo5WmJWRjlMTm9GVEV2?=
 =?utf-8?B?TEMyNjZnOTM3WTVZZFpXWThHcW9RNUFTSHZmb2JPTG5DV1RCeHJTWEIyUUEr?=
 =?utf-8?B?NUZ3LzlrZktZZkJUVFlLRUxKSFFFYW1ESGVGalE2emtEalQ3OUFJVVVJeHRL?=
 =?utf-8?B?cDN0UnNEekFRcDhHUGp2d0orTW8yMDR5MG5JNEVNbFhsRlBjYytQRkVCa2lY?=
 =?utf-8?Q?FlSvGQresFQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MlBPVWJ3NS9GSStGQmFBZXhpOFoxSS8zN0dNM3UrWDdZa0pYQzVVKzRxRUVC?=
 =?utf-8?B?Z21JSXk2cUF1TGg0VzhwZE4xRENCSW9lS01sSlR4c0o3bmVWS0hLcitCQTF1?=
 =?utf-8?B?KzJUOWFVWnBtSkFVYWFKdUZ5ZllKRXpqa3F4U3lGaE1LZWw4WWxqU1IxNVhD?=
 =?utf-8?B?d2c5d0xFUkpsZEg3VVBsdU9vcitSckFld2V5ZHB0QS9NcW5XV3BQVXZ4Z1BH?=
 =?utf-8?B?dlJPK0hhQ3hGQ3pHT0dnV2ZKQWlaaHIydkk0Z1Y4dlpCMWRqTFoxcVVLV1pK?=
 =?utf-8?B?OXA5Uk1kaHdxMFVxNnNtQkdGZmlEbjdHRXJ1c2FFUmdWbXZRWkNON0JyVms3?=
 =?utf-8?B?Q2lkMkVISU1SQXpVTnllSmJkdDhWZE5HSkh6NTlVejB2Qmh0T2xmTTFlcUdP?=
 =?utf-8?B?elJvTUNGVklJc2VUU2JBeHRpMUsxR3JtRlRGSGx5a3ZrSFZ2QTRrQTJKNFpQ?=
 =?utf-8?B?bFkvYVFHd05NdXJhdWpVQXdXcU9CVVN1YkxlUTkwZ09YNVZjOEdZNUZXZ2p2?=
 =?utf-8?B?WGh2Nkt4eHFvT2VDSmRPM0JSSkJ4OGZTNTJBOGo1dWIvemxGbVFDUWhKMTRN?=
 =?utf-8?B?VjB2SWN0MEU5SnBlSUZhRW1JR3FTRDRGVkJYUWxMM01vZlRHWXVxbUVnN1Qw?=
 =?utf-8?B?cTlmYUlONTdLRUhvUFRNSUJ0c01oeHlRN25yYW52cFlCbys4V1Y3TXNudVJG?=
 =?utf-8?B?b3hlM2NLZ0JhM091VE0rZHN4ZkJiV3BwMiswQ3hzTm1jcktqS0M5aDZlUCsr?=
 =?utf-8?B?czlNMk5VVlRaeWwzUjFwazJmRDlQaGJQd2pucWdCNDFhTUREWXBRb2NFMkxz?=
 =?utf-8?B?U1BCaTl0QlhCZXJkSk0zM0F0UmhUKy9iMy8rUk1hQyt2Y2lVZ1UrQmt3cm9L?=
 =?utf-8?B?dThHSFlkMlgzU0dJNE9XWXh4RyszZ1BKcERsTXp6ZXJGUkwxTTJFNVU5dDhJ?=
 =?utf-8?B?TjZyRzUzWjY3dzhhQXora2VOVHdLWDBGTHFuUmd5SHlzS3V2ZkI4eUVVNVlp?=
 =?utf-8?B?L29NTVB3VzREVWt3MTNjYnVaczVRQXFrbXA2dXF2cjg2dTc2SXVmaWpaWEtt?=
 =?utf-8?B?bkp2dUtFZnB2allxNUR6YjhNcCtVY2I3THMyblFEM0Vza0lrVmdrdUZkeGlV?=
 =?utf-8?B?S0dwVVZFUTBSUEFPT05JWW5YUTArMkE2NFBQRU9aWFdMd204cGNkSXJ4VXN5?=
 =?utf-8?B?ekVwZ1lMMjAyWEpuR25ndTFrUkZGbFViSWJFb2J3MnppMFZVK1ZLRVNTYVYz?=
 =?utf-8?B?K0E3Y2dQUCtWQkNrQ2NKaUQwQzVpdm1WeTBMVk5vNTczRHQ5cG1IbG1Yc1V3?=
 =?utf-8?B?bjJJRDJPUVJHV2RHRDdHWlUrN1lsZjcwUmVRQWtXbHNFNGZDRS9aQlBGNEo0?=
 =?utf-8?B?c2VaSkU5ME1OSXZNTmJ0MGVkWVFMaGVkMmNtZEs0Z2JEc1BMNWg1ODRvVFFZ?=
 =?utf-8?B?WjJOY2JUUmwrR05ncGV4TjVJRWJ2czhrZGl5N3NrTVJydEFwTUdpdENoQUJL?=
 =?utf-8?B?SmRzRllGYUMwK2pkQS9idzFoaXBMYmFvYk02dkk1WjRnWGZSdUpwWDVwdnNE?=
 =?utf-8?B?eTlxZ01kdlZmQStjN0VldmMzUlFhVDVYZ01ESC91d0hvbFdvNHlrL1VsL0JH?=
 =?utf-8?B?TFo5Q1NOMnRJeVpoTkIvd2dLclgzVVllWXJQcVJ1OHJkbzFKMGRnQk1veTdm?=
 =?utf-8?B?UkZTTi9iOGdxL3JrbHJYVm5KLzhQbnJxUzB6aTNHenpBS3RZTk5XMVhDZGJH?=
 =?utf-8?B?YU5LZUtRZ0RkUGhETmNTaHV2SWd2YkV6ME5POHVra0tIMUR3cFBYTU5jWUVR?=
 =?utf-8?B?QWFQK1RmaE5pdVcyQXNFM3BNQ043MVpGdmVnR0RpTHJDOXpQZE1WM3gzOE9k?=
 =?utf-8?B?dHlLN2RaZ25yeWxUL3dLZ0xyaklZWGdzMHh3R1B1NXRZYnBSWS9CTE9SV0gx?=
 =?utf-8?B?czk3am9GUkZPUU92bms2THU4RkJ6V0VScEVqUmFuNWRodFluR3JpVTRQSk5x?=
 =?utf-8?B?em9XTXp3YXFNZUtidmJxVkluUXZ2b3Y4STJkYVdKV1drdlBIa1YrTjMzSGY1?=
 =?utf-8?B?N2ZpNDVlWjZUbUZiSzNzUXNGajJSeHoyREVRWmVDWUhTTHJWbFh4MWpPdjNp?=
 =?utf-8?B?aGFEeXB0SjNSZlNsa1A3N0w1eHZCN1AvOUtNOFQ4WFJYSnVtM0tlaDRqRTBv?=
 =?utf-8?Q?ohFqtat8AXoquR8GHHG9RPc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d15e573-88fd-4d39-1cd8-08ddd9c96362
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 17:55:13.9263 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wdw7EQ46aEYnP3folZJUt6xtwkhKD6ZnluIHbzAS2o4PGAJ2uy/KFA2B/k9a4AAYY3GjjKke/i1j2AxUdXE8FSQBFjZh/Ai58eqeFDVV0K0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6915
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



On 12-08-2025 22:21, Danilo Krummrich wrote:
> On Thu Aug 7, 2025 at 6:43 PM CEST, Himal Prasad Ghimiray wrote:
>> @@ -2102,17 +2106,16 @@ op_unmap_cb(const struct drm_gpuvm_ops *fn, void *priv,
>>   static int
>>   __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>>   		   const struct drm_gpuvm_ops *ops, void *priv,
>> -		   u64 req_addr, u64 req_range,
>> -		   struct drm_gem_object *req_obj, u64 req_offset)
>> +		   const struct drm_gpuvm_map_req *req)
>>   {
>>   	struct drm_gpuva *va, *next;
>> -	u64 req_end = req_addr + req_range;
>> +	u64 req_end = req->op_map.va.addr + req->op_map.va.range;
> 
> Forgot to add, please extract all previous values from req, such that the below
> diff is minimal and the code remiains easier to read..

Noted.

