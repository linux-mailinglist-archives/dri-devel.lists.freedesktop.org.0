Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEFF3B19F0A
	for <lists+dri-devel@lfdr.de>; Mon,  4 Aug 2025 11:54:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C38FB10E158;
	Mon,  4 Aug 2025 09:54:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kuydg2nv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B15410E051;
 Mon,  4 Aug 2025 09:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754301241; x=1785837241;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DY9X1c6qproGvXv2yd9YJD3yaXoS5uSS3Co3PmyM/hc=;
 b=kuydg2nv+shlE9jva4EswDtz3VoEyBAQPnwY9KaV28UR3Yl7vEqoQ2dM
 XKg+lFF1wj0y4DQ2hfDr0PmX2xTACnKlR5ISHJOHfmvn7DDqf3SyBCRiZ
 0pfnvsNhMgFjxhViqMajpdpBPfW3D3r7O0DZUOKIdq/j+xVFcOoFOu7KR
 1+kuwDFMDFXtTt+PxsEz+eA/tVQ1eHhBuKY8kjxVFjTkTPFDUpKUxy4sL
 iFb4GVgyXNGqMw3YfAhlNI3veBuUjVZ2NZPJvdKyLrdszAi3XTprUr+ay
 hCFFIm+9UQC2JcFraBezS6KYBKEjeqZK/FdWJNdgKka0PnttBrJoZpeu3 Q==;
X-CSE-ConnectionGUID: RLR+j6ZDRHWhJMDOVtiLHQ==
X-CSE-MsgGUID: Eh1ukDkSRL+lWXtasbNtNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11511"; a="82009444"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; d="scan'208";a="82009444"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2025 02:54:00 -0700
X-CSE-ConnectionGUID: qqAgt8TJQriQD0IAdCm6Zw==
X-CSE-MsgGUID: 71DZ9SirQTa/PfAXxWoBUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; d="scan'208";a="168325514"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2025 02:54:01 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 4 Aug 2025 02:53:59 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 4 Aug 2025 02:53:59 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.59)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 4 Aug 2025 02:53:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SWtZUPMC5zDm/2JGlbaVwJIcn+/rhkdNx9dDtRdfBvLDnUr9mhdGu82KG0NiwYn/OFuEB7EIOu9zyg02xPxD5tWQbrBdNyGOvFxDUg49AAL6wHHNCorKlNEfL7zsuhHuayEIRWdHfPa/FA+M0QXb3X0U47xqVEv0Jf/AJ4CERvbecC1VQomPxu7xtAJeU2EFoXb1QeHEvJwBZDde+K0HdDMdiXCCWVfUyTFgYlgGww0FI+2d2yrqitm5fUbbBjxM4mfFMyOBIIM1SNXO/PFO7hpV0hwQhTQgrZdN4+TdpdKzMS7QNtUoQEq2NS1K28UCFpadFaplwz1lv60JQgTZhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fzf7vWGYC6rhf+6IntWgpgEX6Q7qrNCoxANTQXRVerI=;
 b=uFjcyGrNjn4UNyGwdDdxE7IiFdB6IrlPc4TDYYPJ1JMrjmYy22zx7p8/rYQx0utJiGgDfkrNrL0wPr9/c7rxbsB+wbfXue4ZSOtYl0ka2KkWTLL9fhgKMK3GNakWyKXXyTKv3MT7Lna2VHj3lax2gsreQsa+CtaID5GnA6ZHLi/10roqgtRX7d8eoTF+ZklEZYxTYDUHetOUx/brSuZXvkpVeV43kl+rq0kVTD7/LUYLlfgaVnXvfxWLtR610QBeEQ2Qom1/Ah0dvQRczKgn0qpQUrgGKDjZ1t/3SwhWrTK0LIM1F3LSlQ9lKu2RXxghX0g++UFZA2RoAlVHT/K0Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by CH3PR11MB7204.namprd11.prod.outlook.com (2603:10b6:610:146::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Mon, 4 Aug
 2025 09:53:30 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%4]) with mapi id 15.20.8989.018; Mon, 4 Aug 2025
 09:53:30 +0000
Message-ID: <ad9b68cc-4a33-406a-9512-ff5f5460bf99@intel.com>
Date: Mon, 4 Aug 2025 15:23:22 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm: don't run atomic_async_check for disabled planes
To: Xaver Hugl <xaver.hugl@kde.org>, <dri-devel@lists.freedesktop.org>
CC: <andrealmeid@igalia.com>, <chris@kode54.net>, <naveen1.kumar@intel.com>,
 <ville.syrjala@linux.intel.com>, <mdaenzer@redhat.com>,
 <intel-gfx@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <alexdeucher@gmail.com>
References: <20250801131053.6730-1-xaver.hugl@kde.org>
Content-Language: en-US
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
In-Reply-To: <20250801131053.6730-1-xaver.hugl@kde.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0041.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::15) To IA0PR11MB7307.namprd11.prod.outlook.com
 (2603:10b6:208:437::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7307:EE_|CH3PR11MB7204:EE_
X-MS-Office365-Filtering-Correlation-Id: 39d77af2-a8a4-418b-8759-08ddd33cc430
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NE5GUHIwZXBZOWp5MzhMenlEWVFHdUhnWU1odG9yNHVOZE9qL0Qxb1ZCcFdn?=
 =?utf-8?B?MVR6eEJSRTN3TlNMWmIwRy9jaXZaQk1RdzFCb2Z6NlFvemYvckxpZnB5cVU2?=
 =?utf-8?B?UkQrSHZvOGpGZ0lSTFFaa2grOWV1elN0OHRYdlpMRXpqU0xiekl4YVJwK3Rw?=
 =?utf-8?B?NHVaZlpuZmVnRFgwMkxTa0RqTjN0aG1zUmwwdjVobklabmY4dWl1dkVsM3pR?=
 =?utf-8?B?ank3QWNDTzNHbUl0UkFyOWRrZVF1ZHQyMGc5dkZGUnZaQ2g2VWppNDRGNW1h?=
 =?utf-8?B?Uy8wcUM2bTdYR29rNzEwL2toMTNDZUpnWjY4bU9FZ2huOXRDT01HalJ0UVpU?=
 =?utf-8?B?UHlFa2FEL2p3UWZzVzNRMjB4VXNNaVFHYVZGTFlKRGRCNmI3VHpNMldjWVcr?=
 =?utf-8?B?L3ZZZWVBRVpvN2htQ2F4ZnVrQ0lleDBRMkxxMU5mQXJWUmFWY2VzZytSL0dU?=
 =?utf-8?B?c013QkZ6ZTJRZC8yU0IwM09veW9aTDBBQ05PMCtKMzJsa1YyZXN4ZkpHQ29B?=
 =?utf-8?B?Rm1hOUJ2NWtFUU95T2JtekFnTk9QQWtoSXdBeXM3RkNhQnZESjNDSTUzdGVs?=
 =?utf-8?B?NC9yZFpiaEFtVnhPaFMyVURkRVkxREJpSFBydC9ZNHFIYnZUWG42eWQ3SFpT?=
 =?utf-8?B?SW8zSUJ5RG41MnFySkIyYnI0OVVoeGdYazRFSWQybkZwczVlRkxwbE5PaFNK?=
 =?utf-8?B?cThsYXFETDdiZS9hWUlKRE4rbndaVlRGQzJVYUdCTDkzeHZxTUI0cjU0eEd1?=
 =?utf-8?B?V1JtaytFblpZbGlIYW5ISzF1am1BMVRSdGliUllxL0tQVkJMVlJLMWdmU2Zo?=
 =?utf-8?B?SDE2RWVTbTJrSFZ2WmVtcjF2ekxISVYyaWQzV1NSSm4zSUs3MlpWZC9ZeUxE?=
 =?utf-8?B?c3dlOW5JQXo2MnFnTzJKVlc0ekEzbVR4WStBVXYwR01nVXdHOW5selZkZXlT?=
 =?utf-8?B?VHViVGxtK2VwVTFIRWlEaWVGNVpTK01HSFlFRDk4bHR1THJEZHhTZFF3bEZ1?=
 =?utf-8?B?MXFmdkZMU0srNHQwdU9xRUh0cXc3cHRaSkp4bGtqYUdiOU94dkZrUVNxLzc3?=
 =?utf-8?B?bjQzVk9RZmltZUpoanBoU1RTTVAySU1wQXJ6WlNsN0FIaUx1MzhvdHF2SkNK?=
 =?utf-8?B?QmMzcjk3aFpCbEd1L0tuNVByLzA3RnZtV042eG1WeXFjamkrN3RSZlZsRFVU?=
 =?utf-8?B?T3k1eUJ3ZUdKRzlETU03c2ZCTWwxS2djTENXR210KzdlblBMRDFUTzNaZWo5?=
 =?utf-8?B?S1ZmQzlFNW1DbE5lajhUOGx1UWYyOHBNQnM3U1l5Z2pLWlFIMk50cEV5VENo?=
 =?utf-8?B?eTNNVUExOWE0WGlQV0V4dUh6TjZHaGF4T1R2b0FPUjkrSHBjM3RabUQrMDRP?=
 =?utf-8?B?eTYveVlCbmkxUVZqd3J5VU8zVUo3T3g5b2Q1aDNxQXZBNHB3R1VzS3M2ank4?=
 =?utf-8?B?VlZkdHJjOFFGV0NZQUtPK1hZRFpvVWc1ZlE0c0ZmWkhxV3dmOWpFOXdsRTNY?=
 =?utf-8?B?dlR2K2wzcmFRdnhyb2RrbG81QndiNVVhTENTaTl5SnM0UW9Ca1FCcm5IamZj?=
 =?utf-8?B?ODBDcjdMaEovL3BxRGxqb05TbUl6T2U2elpYWTRCSUdnUHduNWcrL2szYjk0?=
 =?utf-8?B?N2QrQ2hsV2tWTllONHpZK0RiTVVRc3BTcWVZbStLYVRWaSt0cy9QYjNiVVRC?=
 =?utf-8?B?VkViSC8vemN1d21pMXpGaUFLYi9neWg2U2d0aXJNYzNCUDRPakJrVDlCM0o2?=
 =?utf-8?B?Y25aNEMvbGxMRTJNc215THFaT3FUTEtUS3Qrbmd1Vzg3d1V3R1dNZzdKd3px?=
 =?utf-8?Q?fGWFBJLeOVlPBi1kNbRIeAurYWEsD0x7LmgCc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NWR5a282SUZkTnFDYWJ6SGp0dlZiNWJ2WDl4UnZnQ1Z0YW5pd1U2NWw2ODBW?=
 =?utf-8?B?OFkzbFN0TFV1WmxseDBrMmI5UmZFL0RQWUZLQWMvY1VJSUhGNURrNHhiNUdL?=
 =?utf-8?B?UWNzTnBtVS9XR0ZNV1QwUUlza1RFeGtPQjdWcW9UdDFrTmJEVVdscjFXbE9j?=
 =?utf-8?B?TC9KYXVoRlFwOTFBVnd6aFNNUzNQK3c4dzg0N3dlc3RRWnFNeUc0akRmN1FT?=
 =?utf-8?B?WHVDSStlWXVSZkZUcUdod0h2V3NhOUlQSnhyYUpMRWRJSWJnKzR0NlNZZUdT?=
 =?utf-8?B?dGVLdWpLQ0dXMzY2L2lhTkY1MVZzUVNUa3IxZ2EybEQvek5valArK0xHQno1?=
 =?utf-8?B?azhYUW1ScEZJWnVIVWZncnQvQVZYZFhpOTJpZWZGOGxGbGl0ZGoxVE54YkRq?=
 =?utf-8?B?Rkg1alVHeEJOb2xzbUZHOWVLaURhUWVYNWZONldGRkVNYkRNODVPUElZT0FR?=
 =?utf-8?B?VHFCWU5nNnRzRW9pMTd6VVphZDlydXVKT0txd1dZeUNuVlB3aWdaVG5VWmhw?=
 =?utf-8?B?dStHVTZsRU1md21rdFhORlFzcU94RU44aytTcWpVR3ltSVBNQU9OU0dFcjNU?=
 =?utf-8?B?bmZLYXNiV0w5VUt0c0hkeHFqSk5LTm9BVkU0RUJ2Wi9seGF3N013VkJxOWQ4?=
 =?utf-8?B?WUk2eTViZE5zV1FnUWlFN2lWRTNwVWVtT29EV2FKMW81ZW9jT3RLV3ZPcDdU?=
 =?utf-8?B?K1JaSmJhdWdISGFxMFoycnFzS2pKR0xsVFI2eDBXRi81OG9BK1JJdmxST2or?=
 =?utf-8?B?MmswdHlPU3FPbEhoRVRVdVY4UDM3UnV3RnhqbCtZVlh3Uit0c1d5dm5xSFVp?=
 =?utf-8?B?OGRYZmZqZStLbGsvTnNuV0hyRU84QlRPQ1Y3am5WVHAwQStsRnhZYXpYTEVJ?=
 =?utf-8?B?dXl0RjRrZUNadDgrbEtzakErTXFpaUY5SEFxbTk2d2k0VnpwRW1qTUNobjUw?=
 =?utf-8?B?SGhHaWlwTElibWdVT0lmcDdLU2graEYzUUM3L3ltdWhjbENCTXNhbmZaSlVy?=
 =?utf-8?B?L3cvSFd1TWdUZmFPcm1YQkxQcWRMdE41d3pudXJvcmJicWVOSXpLYlpiaWhL?=
 =?utf-8?B?c042RUJjWFFqNU1nSERtajU1cTNtaGNTSDN1eFppV1VxRTlvbXJFUk9CRzNn?=
 =?utf-8?B?eWxldlNpbzhneENFeUJrVnQyOThwcXE2VVpMRElTclgzYllETFlGNkpMQjVY?=
 =?utf-8?B?UDVsNEJsV3RZQ011RExTNGdadVpLeUtYUVZ0LzNTbzY4bFhqcUZwYjJ1bXJH?=
 =?utf-8?B?Y1hJdkdKTVVsUUd2bkdPTzliQkFiYTdyMDloeUVRYTl3RUFqbHkwenpkbUk5?=
 =?utf-8?B?aHZrdjR2bnRTOXdJb0o5U1N4QVAvcDl0andUd3BHNWhrdnJZTkxuV2xwNFRE?=
 =?utf-8?B?OFFLRitYc3BSTDB5NzlLN001ekk3VFg5S2VvK2xrRGFOaFphYmo3YWtwK1pT?=
 =?utf-8?B?UmpOSVVzUCtWVG95Q3UrT3FKaVlXT2xpVzMrdURjaHdzZ2N4Ym1kOWwzRDN1?=
 =?utf-8?B?bkRCeTdCZ1pIai9nenREaEg1NHJBeVRPNUxvY01zMlA3WnZQVllZN3ozcGVN?=
 =?utf-8?B?LzRCVXFGYUdIVGpMZ0N1bXYwYUEwbFU2Q282QlNVU01BUGMvMktmZnJhQTBw?=
 =?utf-8?B?NzVVWVBlRWpjMHhrMndSU25pOUJLQlU2UUVIVUlrRy9hZkRQWWtpMEVBZHlH?=
 =?utf-8?B?cFZMcksvdlJORkQ2YlVKM3VCNzdidmFsK3hMenBEMUxUTDRCc0tnMUZVM3kv?=
 =?utf-8?B?UHF0bngzaXUrdU1FTm1yc0NkTXNVc3F0SXNaQ2s0T0VLc0RJQkJRdTlvKzdu?=
 =?utf-8?B?enkxL3l6WjcxeXcxeFZvbEdaZngvcHpEQjg0NDY4Z1o2MzhSeEJ2KytFSVRa?=
 =?utf-8?B?MkZNY0lYMHg4SXFLWDVOakZKSTBZZ21rT2FqMlBJZjFJaWRJRUJHanNzQkVu?=
 =?utf-8?B?dmdIQkVUek1nT29iN2MvZGtIeUh2eVRncEFzVjhzM0FmN2x3eHVLcjA1YzJQ?=
 =?utf-8?B?dnIwbFJWYjJMWGx4SGozWjNGWkFSeUY3QklHWmdQNG5JQVd4cXNLMGgwQ0FM?=
 =?utf-8?B?am5lMUQ1bm1NS0F0KzNDVzBwRVhOUG5EZDFWQy95TVl6MEN2UVkzbFlsQVov?=
 =?utf-8?B?dkNsU3VSL3NMQm8ra2ZGbjZLekNKNklJNVVOMGkxZUVKUnpTTWZpUjFERERN?=
 =?utf-8?B?TGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 39d77af2-a8a4-418b-8759-08ddd33cc430
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2025 09:53:30.3281 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KZd7pnkvz9oHL74L3gDt1RPrBd/NM/2FbG7/XxX3bGBF5LtRDkm/3jpwTFAaJs88LwsXMd/LdFPAg4AP2Fcyzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7204
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

On 01-08-2025 18:40, Xaver Hugl wrote:
> It's entirely valid and correct for compositors to include disabled
> planes in the atomic commit, and doing that should not prevent async
> flips from working. To fix that, this commit moves the plane check
> to after all the properties of the object have been set,
I dont think this is required. Again the plane states will have to be 
fetched outside the set_prop()

Alternate approach
@@ -1091,8 +1091,16 @@ int drm_atomic_set_property(struct 
drm_atomic_state *state,

                         /* ask the driver if this non-primary plane is 
supported */
                         if (plane->type != DRM_PLANE_TYPE_PRIMARY) {
-                               ret = -EINVAL;
+                               /*
+                                * continue if no change in prop on 
non-supported async planes as well
+                                * or when disabling the plane
+                                */
+                               if (ret == 0 || (prop == 
config->prop_fb_id && prop_value == 0))
+  drm_dbg_atomic(prop->dev,
+ "[PLANE:%d:%s] continue async as there is no prop change\n",
+                                                      obj->id, 
plane->name);
+                               else
+                                       ret = -EINVAL;

                                 if (plane_funcs && 
plane_funcs->atomic_async_check)

Thanks and Regards,
Arun R Murthy
--------------------

>   and skips
> the async checks if the plane was and still is not visible.
>
> Fixes: fd40a63c drm/atomic (Let drivers decide which planes to async flip)
> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4263
>
> Signed-off-by: Xaver Hugl <xaver.hugl@kde.org>
> ---
>   drivers/gpu/drm/drm_atomic_uapi.c | 51 +++++++++++++++++++++----------
>   1 file changed, 35 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
> index c2726af6698e..2ae41a522e92 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -1068,7 +1068,6 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
>   		struct drm_plane *plane = obj_to_plane(obj);
>   		struct drm_plane_state *plane_state;
>   		struct drm_mode_config *config = &plane->dev->mode_config;
> -		const struct drm_plane_helper_funcs *plane_funcs = plane->helper_private;
>   
>   		plane_state = drm_atomic_get_plane_state(state, plane);
>   		if (IS_ERR(plane_state)) {
> @@ -1084,21 +1083,8 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
>   				ret = drm_atomic_plane_get_property(plane, plane_state,
>   								    prop, &old_val);
>   				ret = drm_atomic_check_prop_changes(ret, old_val, prop_value, prop);
> -			}
> -
> -			/* ask the driver if this non-primary plane is supported */
> -			if (plane->type != DRM_PLANE_TYPE_PRIMARY) {
> -				ret = -EINVAL;
> -
> -				if (plane_funcs && plane_funcs->atomic_async_check)
> -					ret = plane_funcs->atomic_async_check(plane, state, true);
> -
> -				if (ret) {
> -					drm_dbg_atomic(prop->dev,
> -						       "[PLANE:%d:%s] does not support async flips\n",
> -						       obj->id, plane->name);
> -					break;
> -				}
> +				if (ret)
> +				    break;
>   			}
>   		}
>   
> @@ -1394,6 +1380,10 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
>   	int ret = 0;
>   	unsigned int i, j, num_fences;
>   	bool async_flip = false;
> +	struct drm_plane *plane;
> +	struct drm_plane_state *old_plane_state = NULL;
> +	struct drm_plane_state *new_plane_state = NULL;
> +	u64 fb_id = 0;
>   
>   	/* disallow for drivers not supporting atomic: */
>   	if (!drm_core_check_feature(dev, DRIVER_ATOMIC))
> @@ -1521,6 +1511,35 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
>   			copied_props++;
>   		}
>   
> +		if (async_flip && obj->type == DRM_MODE_OBJECT_PLANE &&
> +		    obj_to_plane(obj)->type != DRM_PLANE_TYPE_PRIMARY) {
> +			/* need to ask the driver if this plane is supported */
> +			plane = obj_to_plane(obj);
> +			old_plane_state = drm_atomic_get_old_plane_state(state, plane);
> +			new_plane_state = drm_atomic_get_new_plane_state(state, plane);
> +			ret = drm_atomic_plane_get_property(plane, new_plane_state,
> +							    dev->mode_config.prop_fb_id,
> +							    &fb_id);
> +			if (ret)
> +				break;
> +			/*
> +			 * Only do the check if the plane was or is enabled.
> +			 * Note that the new state doesn't have "visible" set yet,
> +			 * so this uses fb_id instead.
> +			 */
> +			if (old_plane_state->visible || fb_id)
> +				ret = -EINVAL;
> +			if (ret && plane->helper_private &&
> +			    plane->helper_private->atomic_async_check) {
> +				ret = plane->helper_private->atomic_async_check(plane, state, true);
> +			}
> +			if (ret) {
> +				drm_dbg_atomic(dev, "[PLANE:%d:%s] does not support async flips\n",
> +						obj->id, plane->name);
> +				break;
> +			}
> +		}
> +
>   		drm_mode_object_put(obj);
>   	}
>   
