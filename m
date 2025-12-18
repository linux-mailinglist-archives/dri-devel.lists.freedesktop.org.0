Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F075BCC9F6F
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 02:20:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAE7110E519;
	Thu, 18 Dec 2025 01:20:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S4EjnEOY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5627410E4C5;
 Thu, 18 Dec 2025 01:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766020837; x=1797556837;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=7hB495y5qsvblfsgYle1Pi20epdIOqi9hZwIofWKhD8=;
 b=S4EjnEOYeTAXjpNIO8TfQrxHADG2qFxzmhJ8trWSsxKbHb8Yj9fOuv4B
 sbxP1apf4blDw0aBl5ytTVmaQ7xWgDq3BeDdC3eid+Y9XVEYBYJHHx2KE
 ojDcWu7SKkUDJpkKB/uAtceMKNd07lTDbOi7dOWbq1lLLfqTEJhI5nnQu
 tdwH+WvI71rM4c2q3szvwBqtG5yCmP/Y3m1DSRpvO/kzxhmQ5nVGn4kzp
 Hk5XJ0jCVvmmBD8mxmIPKXDmzXALCr9b6cT/r5KjnmLLRtqQBxEwxzSGX
 kTwKynnNptLmtD1yZHzwS5cMrYXIFbdxc4CtnUsggR5vTWQ6O1iPRl8et A==;
X-CSE-ConnectionGUID: NeCkzwYKTJi6aAcjgq8OAw==
X-CSE-MsgGUID: sI8FxztHTWG3se4rf/u7sQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="79092706"
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; d="scan'208";a="79092706"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 17:20:36 -0800
X-CSE-ConnectionGUID: 4xpOfC7iRyeIp75BSVWEhg==
X-CSE-MsgGUID: AFffGHA+QvCVqoNlwrCHNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; d="scan'208";a="198057356"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 17:20:35 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 17 Dec 2025 17:20:34 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 17 Dec 2025 17:20:34 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.7) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 17 Dec 2025 17:20:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ncSB2CA8earRewpY3zx0sJ1r/DJ7YKEjEibzPTF5MtYLm7niwcMc2B7bF6xBiqpPTl5HE46Bb2cAdHprY1e7QGCTaLtogm0Q0JuCNj+z6QU33XzO9m+3uExK1z5eNE4WR4TcTnTuVRcqCUmJvuzrPR+jD/MsukMaWDwD0ZRqXRaLYZdMUMxHsrwVpV4mudFuAe4IB+s4lV85tByDuCFD6bua2Haf0p39uRxnWUonk4rs/WBhgQMnOy9V66hv7Yh3IGoJeUTwRfbJAiNtbp5R2LvCXu5RcuODJoOWCAq5g+/JpyPJRuls1U7XfyN+DxLm0UXlSwQ0mHm+lYsOXhbL8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LMV7fR/BpKU/sm/eFPMDu8aQ5TGbZ9awasLU8jfapRA=;
 b=E1yF6nhDPFhjot859ckaio5RaJaWsyM/cThN+1GydVxZ1AexamoP1V+M7ilmgnGgEmPYd2CRpYpmGta1+cchePm6xf0ZRvJFUvTBxaew+4VqHzZ1TJ/4QuzSYF956LmbJIS5dPXBehrPCByhOx4SKs/wRp0O7QzNQzjY72JvdyP5cp4G+yg1dEY+BBikcDvpbYUiz2K/qJX+jAFSNQY0Oyc2ylApE2WHeDI7KUNogJ7OOk9pCbwGbo1il+zG4PKygTooumFoJ7Ox5fkzl5X6uu8u2XQDONoqmvTdNG9k8/uZkL4eoBkbEvxm/IKvHmP4AOx/SYeurHXiJY8tROg1VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CO1PR11MB5155.namprd11.prod.outlook.com (2603:10b6:303:91::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Thu, 18 Dec
 2025 01:20:32 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 01:20:29 +0000
Date: Wed, 17 Dec 2025 17:20:26 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <himal.prasad.ghimiray@intel.com>, <apopple@nvidia.com>, <airlied@gmail.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>, <felix.kuehling@amd.com>, Christian
 =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, <dakr@kernel.org>,
 "Mrozek, Michal" <michal.mrozek@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>
Subject: Re: [PATCH v4 21/22] drm/pagemap, drm/xe: Support destination
 migration over interconnect
Message-ID: <aUNW2nLEpgAy6qAt@lstrano-desk.jf.intel.com>
References: <20251211165909.219710-1-thomas.hellstrom@linux.intel.com>
 <20251211165909.219710-22-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251211165909.219710-22-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: BY5PR03CA0014.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::24) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CO1PR11MB5155:EE_
X-MS-Office365-Filtering-Correlation-Id: 96615eaa-6c25-4a04-091f-08de3dd3a178
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QTAwRXBBWktFZkk0MEJTK2xrV25aNDl2cnY5TlBxeHJaYkVzUklDUndTZXh3?=
 =?utf-8?B?ZzU3SVV2cnNhcWs3M1dxOHoreGNNRTl6b3lseEtKbzhPSFhQUUI0NzhpUld4?=
 =?utf-8?B?akpLUytBWkg1L1pJTVhPMHFiZUZlL2NRQzh4SWovME9HQlYzNUxoaEQ2U0Ev?=
 =?utf-8?B?b1R1Uk5FSmhNbWtrMXVlNG0zNVl2TTlUUDByZDBPVXNTaEIrM1ExT0lWd0hx?=
 =?utf-8?B?VFRhSDUzVFdqNzEzRHl0RjVXS3hFWDFVWDUxbDBjNUhuYUlESkp0QkdXczJr?=
 =?utf-8?B?V1R6dTFiV2VyNDVCOW9Nd010c2dXWU9CSmFxbVFpdi9JZ3dyMzE2OXRxYmhq?=
 =?utf-8?B?M1NJR29qWGQwaEd4SnFHMXNmVDJiOEdHRXZhRnFYV01ZeXRRdTZ6Y256N0du?=
 =?utf-8?B?Tyt3ZGs3SlhKNEh2UzF1Q1FYNTJJekUrMGlsZklLellabHdidW9jM2lzd25o?=
 =?utf-8?B?V0tWRGoxQzY1amlialBrOE5CaTZ4Q1RzdWkzUGZKb3ZhaEwwYjVzN1VocEdD?=
 =?utf-8?B?d3lsVkFkWFpTbzhvcjhQSzFVaUxCMklCNFoyVjI3TlRCRlFva3ZNNWR6WEEy?=
 =?utf-8?B?dU0yMGkrK2o0b0YwVWJDNy9nZkVCRUhRd1QvRzRVL0FxRnVNLzFqajNyYjZ6?=
 =?utf-8?B?TXA4aWYybzNWUEtFRzRRbmVjUktoUE15TEQ2aVRVZWpkYXQyVzNLaTBzNEht?=
 =?utf-8?B?TEJ5QW9KUmsvYUFDTkgza3Q1WEJabk45TS9jelczRG5pZlZVa0YzYUc2K2s3?=
 =?utf-8?B?djQ5MVBJUlJUVzI1U3hNaElaOVBEaHJGUlRrZ2tzY3JCTGg3M1UxZTlhdVFK?=
 =?utf-8?B?WjF2YlVWdXlqa2YzWEdRMVg5blcyVVFaZHMyNFpHVGtTNXZJUHJwQUREM2Fo?=
 =?utf-8?B?VUFMQVR0MTh6MjdaOE04NnloZE5EelhQclZhNEdreTI1MTBUZGxucGhiNURi?=
 =?utf-8?B?d0VXRFFaQmR1U1lHQUhGUU5NK3pSVHB3YWp0dWlrZU53OHlYMzVpOHArTW80?=
 =?utf-8?B?S1IzTFk2K2VOYXRtRzR0SG9xNzB0YlRkK1grZzJsczJiVzdiYXRBZHVtWUpi?=
 =?utf-8?B?S2hxN3lNKytpNXJIOHV6TS9nSCtYajFBNFN5eHNxSDZxWEdwOFVEdHA1WUYz?=
 =?utf-8?B?NDZPRVh3RktSWDgvU05FbU1waEZoQzVINlJPNnRvT0UrUjFPSExmbm1ncE92?=
 =?utf-8?B?eGZYZjFNTE9aVjU4VkJyMzJmQnBXb2tsTFlZK085d3RFcEJ5VjZVYWpVUlo3?=
 =?utf-8?B?bmZwMUFvQ0Fjb2MwU2ozVllnNWZZTW84Z3hXMXVFYmN0ci9qNVNJRjhsdWVy?=
 =?utf-8?B?b3pMWERXa0dRMG9wMWpqcUhZcWZoN2pQOFZBbnNwTFRud2FxNWtNSktxays1?=
 =?utf-8?B?Rk11Q0UrendnMWZmaDdITk1ZZXF4bVlYQlhFdFVoOGpDdVJ6U3prdkJZVDg2?=
 =?utf-8?B?WDFHNldDc0hVR09LdXJsVFRZSndRR1lHa2U3ZlhpQ3pLWlU1dTFLZWp4NXNx?=
 =?utf-8?B?S2hONVErQlZ3Ykg2Z3lKV3ByalJFbHp6RjBpZzhYZGlmejVNYTBwWEJ3TVVP?=
 =?utf-8?B?OHhUeHMzT2pNTTNuSG95SzdjaHEzcTU4ZWE3bjNSMDJ2bWUrenl0MmZuVnhI?=
 =?utf-8?B?eC9rTHdEZ3ZDZW1Jd1FlSTRVWmpHamhIc1RqVkt1QU1oWnNtOUJGbFVyR0wv?=
 =?utf-8?B?cWtKcVBnMnF1RlQ0czVKYWI5U2xCUWFqS1BMNVR5Y2tsQUFzSVcyaiswWHNr?=
 =?utf-8?B?RlVGU0dwYWh6dUZMWXkwanpDOUpTZTA1eHAyWFlRR1ZNeG8rNHRlKzFxL2FH?=
 =?utf-8?B?bWpKY2w1TFNaMG1kd21zOXZkMEdzZmZ1WEozZEs1YWVHc2s1YTArNE81cm53?=
 =?utf-8?B?RTdxLzVRS0F6S1ZqOXRtN0hEOGFiMGx6WHR6Mysxa20zcWd5WERPV24zMUpl?=
 =?utf-8?Q?7pYMUlAouu3gxzvkiJdS7eJCbGofTJSC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OVdMT1dkamhrQzk2RXpNTWdCaVRoVEdsVTZUeldJTGNZVjJmdGtHcG9qWWdT?=
 =?utf-8?B?cjlWOXAzSHZzVlo5bnBzSFpudlBmbWp5QkxJWm1SU28rbU9zOGhzZ0M3Z0Ju?=
 =?utf-8?B?Nm1PcmVuanhCclBXVVErYXM4NmtWZ1ZqSlpwQmZ4MkZYZWZneHlPYnhuTmdT?=
 =?utf-8?B?bGMrTkZnenJoc05qSXBiRXh5Zi9kZDZ1WWYyQUk0QnFGdVpwaVYrQy80aHBh?=
 =?utf-8?B?OHU1dTZMM0p1T3BjSVpBM2JyMjB2clFpMk0rREhDUHVWUHZuR01wQWxiTTJh?=
 =?utf-8?B?SEVRdXZ3dzJFNjJEcVQ1N1BKaWt3YlBTMytBY2d0QndEWk5ibDRldk9LRHVS?=
 =?utf-8?B?ODFtVy9PdXNFV3hWZEdCN3YwZXgxanNBdmNzbThKOThuSjZ4a2xXbUJVclZy?=
 =?utf-8?B?TjhYQW96Zk53Q3dEd3UwSXcvazQ1SFdCT0I1NzlUTWRhZW5oWndESjQrMVVt?=
 =?utf-8?B?R3YzSUV5VW1VOE95WFNvOVRNdmdFVkpQSHloWTUyd3VXQ3JReWttWnpGNkoy?=
 =?utf-8?B?dGFWa0VqMjBEMmhNdWNRLzJ2U0pKaENwNUtobGc2dSt5NDlZMWtSUUJPWDMx?=
 =?utf-8?B?dUJnRG9MRzJqdVhKRVMwM3BqdEdOQkRuSXU1Z0lBNVdPMmdMQW14aEE0RzN6?=
 =?utf-8?B?UjlqR0dwWnloTVJhenRWb3Y5NGtlUFVPazFRMDJhRjYzZXhKenZjYVJKSlpX?=
 =?utf-8?B?b0ZVUUNETkFLL3lEU2d1UXhHdkUycDhZVGtLMDQ2K3pwWHE0QzVPQlpicG85?=
 =?utf-8?B?QVFQbW44ZVgyTFdPaVlyL3pONDdBRmpsS3lQWG5wVjg3V3EvWjVpVk1hSGRu?=
 =?utf-8?B?R2lmTTZGbzA3RnQ2TlU5Qmt6MHJpTFJlblM0Mk5PcFh3YUJ5UlA4UXVFbG85?=
 =?utf-8?B?TWd2dVJJNFFRbXVnVGV4OThTRWZ2ZDYzb2lvL3czTTkyQmY5MVE5N0VyVGhm?=
 =?utf-8?B?TDVQSDZwbmtUNk0vT25jZmFHN2xKbTJkYUJEbTh6bnZtRG5KeWprOU5jNENI?=
 =?utf-8?B?bks0elR3WTFFS1BDd2dzZXE4NnRwZmJIclhiT2MxRGFldmxTN211RVBlem41?=
 =?utf-8?B?azFnYUZrdUdVWGcraU12UVVYZ2FDVWpMaFdRc2dmU1k3Y3c4dTkzZVU5REJK?=
 =?utf-8?B?aFhrdzhiR0Rnejh0eFl4U243UnZDZk56M3Nxa3M2bjhNaXhjRTZ2VmptcUtv?=
 =?utf-8?B?elEzL0tNckhpVEZGZE5BbU81cUdvSWU3NDY3S0dnYmdpU2dSY21QMVk0dE9Q?=
 =?utf-8?B?M0MyY1lGd2FSZ0ZMa0ZmRUk2YndLYnhDcDV1d1huaW83NmE1YVNuQWV3Njdn?=
 =?utf-8?B?RERhL3g2VFM2Yk1qMHMrZ0ZsTkdyaWRGa1BYRnFxM3p0Mis4RnliQWdHQ3Nq?=
 =?utf-8?B?WmQ5WlJFSzlpb0RNb0RtellEeWF0MU1oeDd0S2VUUGxwSWVGeXl6ckJHTEQw?=
 =?utf-8?B?TGJpTmNaUVBTd2pxOU8ybWpCVTdLbHkvVVZIZndmeE5IM2hHWkVtSFdGMC9M?=
 =?utf-8?B?QUkzTkNNTnB2SXJYeW9LcVl4TUhCSE1sanBpZlJCWURnUytzQXZMeTY3Qmc0?=
 =?utf-8?B?bndDYWZCMzFRK1hVek5WdzlYK0tuYkFXSGI3SzltSzVnT0c5QnhraEVqOS85?=
 =?utf-8?B?VUM4K05qd3BIM0dMaDZPWmZhb205Z3J6OTBXNmNQMUt2dXRZL0JybVFjSG9O?=
 =?utf-8?B?aU14c1p1SVB1b0RFK1dXTG5SNnd4U0x5bFh1Z2tqY0pOTmxpcGp5NG1kRWh0?=
 =?utf-8?B?Tm1PR29RYVBIUzA5V3F3K1hBSDdSdVdadTQxQ0w0dzFGZllSVEY5N2diYjZr?=
 =?utf-8?B?NE5aMThISU1nTkROYmF0dzZSbHBrTHJxeFNuSldGeDhTRFIvRmphanQ5dGxv?=
 =?utf-8?B?V2d6NVFhSkNpM1hkekJnMklQd0xPUHdYSE8va3YydUxUY0puM0lWRXpFUzBV?=
 =?utf-8?B?VHVVa3ZPRXBpdmJVc1luYjlJQnlibjdxSi9sb0dUd2VkOTdBMGlLYVM1TmdS?=
 =?utf-8?B?Y1V0NzI4M0xnSEpzdHRpOStWTVdjb1NWZnVjTVA1S1Z0a3Izam9LckxTSVdI?=
 =?utf-8?B?b2lvdEpXSFROVmovK2dzajRycHcvRFJ6TlpGNFJTMU5ha2tGSDFYUGlncDNL?=
 =?utf-8?B?dVp1TzFrWi9xSWc5R0dsdm9kSUJhUWlwSkJUVHRTUFlpUWdyTTlFaGhFWFJD?=
 =?utf-8?B?UXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 96615eaa-6c25-4a04-091f-08de3dd3a178
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 01:20:29.2013 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LHr0DMLVO8N247jRmHSJ+teYVnGXwz7Nm5Za/d2rBsFc+xjyWaHGotVrn9oZ+3giaYnoJEEdvIJvLrTSuRuSGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5155
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

On Thu, Dec 11, 2025 at 05:59:08PM +0100, Thomas Hellström wrote:
> Support destination migration over interconnect when migrating from
> device-private pages with the same dev_pagemap owner.
> 
> Since we now also collect device-private pages to migrate,
> also abort migration if the range to migrate is already
> fully populated with pages from the desired pagemap.
> 
> Finally return -EBUSY from drm_pagemap_populate_mm()
> if the migration can't be completed without first migrating all
> pages in the range to system. It is expected that the caller
> will perform that before retrying the call to
> drm_pagemap_populate_mm().
> 
> Assume for now that the drm_pagemap implementation is *not*
> capable of migrating data within the pagemap itself. This
> restriction will be configurable in upcoming patches.
> 
> v3:
> - Fix a bug where the p2p dma-address was never used.
> - Postpone enabling destination interconnect migration,
>   since xe devices require source interconnect migration to
>   ensure the source L2 cache is flushed at migration time.
> - Update the drm_pagemap_migrate_to_devmem() interface to
>   pass migration details.
> v4:
> - Define XE_INTERCONNECT_P2P unconditionally (CI)
> - Include a missing header (CI)
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/drm_pagemap.c   | 188 +++++++++++++++++++++++---------
>  drivers/gpu/drm/xe/xe_migrate.c |   4 +-
>  drivers/gpu/drm/xe/xe_svm.c     |  26 +++--
>  drivers/gpu/drm/xe/xe_svm.h     |   1 +
>  include/drm/drm_pagemap.h       |  19 +++-
>  5 files changed, 179 insertions(+), 59 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
> index 77f8ea5ed802..56bedb622264 100644
> --- a/drivers/gpu/drm/drm_pagemap.c
> +++ b/drivers/gpu/drm/drm_pagemap.c
> @@ -206,10 +206,12 @@ static void drm_pagemap_get_devmem_page(struct page *page,
>  /**
>   * drm_pagemap_migrate_map_pages() - Map migration pages for GPU SVM migration
>   * @dev: The device for which the pages are being mapped
> + * @local_dpagemap: The drm_pagemap pointer of the local drm_pagemap.
>   * @pagemap_addr: Array to store DMA information corresponding to mapped pages
>   * @migrate_pfn: Array of migrate page frame numbers to map
>   * @npages: Number of pages to map
>   * @dir: Direction of data transfer (e.g., DMA_BIDIRECTIONAL)
> + * @mdetails: Details governing the migration behaviour.
>   *
>   * This function maps pages of memory for migration usage in GPU SVM. It
>   * iterates over each page frame number provided in @migrate_pfn, maps the
> @@ -219,12 +221,15 @@ static void drm_pagemap_get_devmem_page(struct page *page,
>   * Returns: 0 on success, -EFAULT if an error occurs during mapping.
>   */
>  static int drm_pagemap_migrate_map_pages(struct device *dev,
> +					 struct drm_pagemap *local_dpagemap,
>  					 struct drm_pagemap_addr *pagemap_addr,
>  					 unsigned long *migrate_pfn,
>  					 unsigned long npages,
> -					 enum dma_data_direction dir)
> +					 enum dma_data_direction dir,
> +					 const struct drm_pagemap_migrate_details *mdetails)
>  {
>  	unsigned long i;
> +	unsigned long num_peer_pages = 0;
>  
>  	for (i = 0; i < npages;) {
>  		struct page *page = migrate_pfn_to_page(migrate_pfn[i]);
> @@ -235,31 +240,50 @@ static int drm_pagemap_migrate_map_pages(struct device *dev,
>  		if (!page)
>  			goto next;
>  
> -		if (WARN_ON_ONCE(is_zone_device_page(page)))
> -			return -EFAULT;
> -
>  		folio = page_folio(page);
>  		order = folio_order(folio);
>  
> -		dma_addr = dma_map_page(dev, page, 0, page_size(page), dir);
> -		if (dma_mapping_error(dev, dma_addr))
> -			return -EFAULT;
> +		if (is_device_private_page(page)) {
> +			struct drm_pagemap_zdd *zdd = page->zone_device_data;
> +			struct drm_pagemap *dpagemap = zdd->dpagemap;
> +			struct drm_pagemap_addr addr;
> +
> +			if (dpagemap == local_dpagemap && !mdetails->can_migrate_same_pagemap)
> +				goto next;
>  
> -		pagemap_addr[i] =
> -			drm_pagemap_addr_encode(dma_addr,
> -						DRM_INTERCONNECT_SYSTEM,
> -						order, dir);
> +			num_peer_pages += NR_PAGES(order);
> +			addr = dpagemap->ops->device_map(dpagemap, dev, page, order, dir);
> +			if (dma_mapping_error(dev, addr.addr))
> +				return -EFAULT;
> +
> +			pagemap_addr[i] = addr;
> +		} else {
> +			dma_addr = dma_map_page(dev, page, 0, page_size(page), dir);
> +			if (dma_mapping_error(dev, dma_addr))
> +				return -EFAULT;
> +
> +			pagemap_addr[i] =
> +				drm_pagemap_addr_encode(dma_addr,
> +							DRM_INTERCONNECT_SYSTEM,
> +							order, dir);
> +		}
>  
>  next:
>  		i += NR_PAGES(order);
>  	}
>  
> +	if (num_peer_pages)
> +		drm_dbg(local_dpagemap->drm, "Migrating %lu peer pages over interconnect.\n",
> +			num_peer_pages);
> +
>  	return 0;
>  }
>  
>  /**
>   * drm_pagemap_migrate_unmap_pages() - Unmap pages previously mapped for GPU SVM migration
>   * @dev: The device for which the pages were mapped
> + * @migrate_pfn: Array of migrate pfns set up for the mapped pages. Used to
> + * determine the drm_pagemap of a peer device private page.
>   * @pagemap_addr: Array of DMA information corresponding to mapped pages
>   * @npages: Number of pages to unmap
>   * @dir: Direction of data transfer (e.g., DMA_BIDIRECTIONAL)
> @@ -270,16 +294,27 @@ static int drm_pagemap_migrate_map_pages(struct device *dev,
>   */
>  static void drm_pagemap_migrate_unmap_pages(struct device *dev,
>  					    struct drm_pagemap_addr *pagemap_addr,
> +					    unsigned long *migrate_pfn,
>  					    unsigned long npages,
>  					    enum dma_data_direction dir)
>  {
>  	unsigned long i;
>  
>  	for (i = 0; i < npages;) {
> -		if (!pagemap_addr[i].addr || dma_mapping_error(dev, pagemap_addr[i].addr))
> +		struct page *page = migrate_pfn_to_page(migrate_pfn[i]);
> +
> +		if (!page || !pagemap_addr[i].addr || dma_mapping_error(dev, pagemap_addr[i].addr))
>  			goto next;
>  
> -		dma_unmap_page(dev, pagemap_addr[i].addr, PAGE_SIZE << pagemap_addr[i].order, dir);
> +		if (is_zone_device_page(page)) {
> +			struct drm_pagemap_zdd *zdd = page->zone_device_data;
> +			struct drm_pagemap *dpagemap = zdd->dpagemap;
> +
> +			dpagemap->ops->device_unmap(dpagemap, dev, pagemap_addr[i]);
> +		} else {
> +			dma_unmap_page(dev, pagemap_addr[i].addr,
> +				       PAGE_SIZE << pagemap_addr[i].order, dir);
> +		}
>  
>  next:
>  		i += NR_PAGES(pagemap_addr[i].order);
> @@ -301,8 +336,7 @@ npages_in_range(unsigned long start, unsigned long end)
>   * @mm: Pointer to the struct mm_struct.
>   * @start: Start of the virtual address range to migrate.
>   * @end: End of the virtual address range to migrate.
> - * @timeslice_ms: The time requested for the migrated pagemap pages to
> - * be present in @mm before being allowed to be migrated back.
> + * @mdetails: Details to govern the migration.
>   *
>   * This function migrates the specified virtual address range to device memory.
>   * It performs the necessary setup and invokes the driver-specific operations for
> @@ -320,7 +354,7 @@ npages_in_range(unsigned long start, unsigned long end)

Update kernel doc to indicate devmem_allocation is consumed on failure?

>  int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
>  				  struct mm_struct *mm,
>  				  unsigned long start, unsigned long end,
> -				  unsigned long timeslice_ms)
> +				  const struct drm_pagemap_migrate_details *mdetails)
>  {
>  	const struct drm_pagemap_devmem_ops *ops = devmem_allocation->ops;
>  	struct drm_pagemap *dpagemap = devmem_allocation->dpagemap;
> @@ -329,9 +363,11 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
>  		.start		= start,
>  		.end		= end,
>  		.pgmap_owner	= pagemap->owner,
> -		.flags		= MIGRATE_VMA_SELECT_SYSTEM,
> +		.flags		= MIGRATE_VMA_SELECT_SYSTEM | MIGRATE_VMA_SELECT_DEVICE_COHERENT |
> +		(mdetails->source_peer_migrates ? 0 : MIGRATE_VMA_SELECT_DEVICE_PRIVATE),
>  	};
>  	unsigned long i, npages = npages_in_range(start, end);
> +	unsigned long own_pages = 0, migrated_pages = 0;
>  	struct vm_area_struct *vas;
>  	struct drm_pagemap_zdd *zdd = NULL;
>  	struct page **pages;
> @@ -373,8 +409,10 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
>  	zdd = drm_pagemap_zdd_alloc(dpagemap);
>  	if (!zdd) {
>  		err = -ENOMEM;
> -		goto err_free;
> +		kvfree(buf);
> +		goto err_out;
>  	}
> +	zdd->devmem_allocation = devmem_allocation;	/* Owns ref */
>  
>  	migrate.vma = vas;
>  	migrate.src = buf;
> @@ -385,55 +423,111 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
>  		goto err_free;
>  
>  	if (!migrate.cpages) {
> -		err = -EFAULT;
> +		/* No pages to migrate. Raced or unknown device pages. */
> +		err = -EBUSY;
>  		goto err_free;
>  	}
>  
>  	if (migrate.cpages != npages) {
> +		/*
> +		 * Some pages to migrate. But we want to migrate all or
> +		 * nothing. Raced or unknown device pages.
> +		 */

I honestly think this is going to be an issue. Let's say two devices
fault at the same time and both try to migrate simultaneously—neither
side is likely to make forward progress, resulting in the migration
failing even with a retry loop at the caller.

How about a Xe module-wide migration rwsem? The first call to
drm_pagemap_populate_mm would take it in read mode, and subsequent
attempts would take it in write mode. We can't control CPU-side races
here, but we do have some level of GPU-side control via a lock like the
one I suggested.

The other alternative is to restructure our GPU SVM range tree into a
process-wide structure (rather than per-device VM), which locks the
range when servicing a fault and supports multiple sets of pages
attached to the range. This is pretty large work though, so I'd lean
towards some Xe driver side locking first.

>  		err = -EBUSY;
> -		goto err_finalize;
> +		goto err_aborted_migration;
> +	}
> +
> +	/* Count device-private pages to migrate */
> +	for (i = 0; i < npages; ++i) {
> +		struct page *src_page = migrate_pfn_to_page(migrate.src[i]);
> +
> +		if (src_page && is_zone_device_page(src_page)) {
> +			if (page_pgmap(src_page) == pagemap)
> +				own_pages++;
> +		}

In an effort to make the 2M transition easier, can this loop increment i
and own-pages based on the folio order?

> +	}
> +
> +	drm_dbg(dpagemap->drm, "Total pages %lu; Own pages: %lu.\n",
> +		npages, own_pages);
> +	if (own_pages == npages) {
> +		err = 0;
> +		drm_dbg(dpagemap->drm, "Migration wasn't necessary.\n");
> +		goto err_aborted_migration;
> +	} else if (own_pages && mdetails->can_migrate_same_pagemap) {
> +		err = -EBUSY;
> +		drm_dbg(dpagemap->drm, "Migration aborted due to fragmentation.\n");
> +		goto err_aborted_migration;
>  	}
>  
>  	err = ops->populate_devmem_pfn(devmem_allocation, npages, migrate.dst);
>  	if (err)
>  		goto err_finalize;
>  
> -	err = drm_pagemap_migrate_map_pages(devmem_allocation->dev, pagemap_addr,
> -					    migrate.src, npages, DMA_TO_DEVICE);
> +	err = drm_pagemap_migrate_map_pages(devmem_allocation->dev,
> +					    devmem_allocation->dpagemap, pagemap_addr,
> +					    migrate.src, npages, DMA_TO_DEVICE,
> +					    mdetails);
> +
> +	if (err) {
> +		drm_pagemap_migrate_unmap_pages(devmem_allocation->dev, pagemap_addr,
> +						migrate.src, npages, DMA_TO_DEVICE);
>  
> -	if (err)
>  		goto err_finalize;
> +	}
>  
> +	own_pages = 0;
>  	for (i = 0; i < npages; ++i) {
>  		struct page *page = pfn_to_page(migrate.dst[i]);
> -
> +		struct page *src_page = migrate_pfn_to_page(migrate.src[i]);
> +
> +		if (unlikely(src_page && is_zone_device_page(src_page) &&
> +			     page_pgmap(src_page) == pagemap &&
> +			     !mdetails->can_migrate_same_pagemap)) {
> +			migrate.dst[i] = 0;
> +			pages[i] = NULL;
> +			own_pages++;
> +			continue;
> +		}

Same as above, I think logic should be based on folio order?

>  		pages[i] = page;
>  		migrate.dst[i] = migrate_pfn(migrate.dst[i]);
>  		drm_pagemap_get_devmem_page(page, zdd);
>  	}
> +	drm_WARN_ON(dpagemap->drm, !!own_pages);
>  
>  	err = ops->copy_to_devmem(pages, pagemap_addr, npages,
>  				  devmem_allocation->pre_migrate_fence);
> +	drm_pagemap_migrate_unmap_pages(devmem_allocation->dev, pagemap_addr,
> +					migrate.src, npages, DMA_TO_DEVICE);
>  	if (err)
>  		goto err_finalize;
>  
>  	/* Upon success bind devmem allocation to range and zdd */
>  	devmem_allocation->timeslice_expiration = get_jiffies_64() +
> -		msecs_to_jiffies(timeslice_ms);
> -	zdd->devmem_allocation = devmem_allocation;	/* Owns ref */
> +		msecs_to_jiffies(mdetails->timeslice_ms);
>  
>  err_finalize:
>  	if (err)
>  		drm_pagemap_migration_unlock_put_pages(npages, migrate.dst);
> +err_aborted_migration:
>  	migrate_vma_pages(&migrate);
> +
> +	for (i = 0; i < npages; ++i)
> +		if (migrate.src[i] & MIGRATE_PFN_MIGRATE)
> +			migrated_pages++;

Again based on folio order?

> +
> +	if (!err && migrated_pages < npages - own_pages) {
> +		drm_dbg(dpagemap->drm, "Raced while finalizing migration.\n");
> +		err = -EBUSY;
> +	}
> +
>  	migrate_vma_finalize(&migrate);
> -	drm_pagemap_migrate_unmap_pages(devmem_allocation->dev, pagemap_addr, npages,
> -					DMA_TO_DEVICE);
>  err_free:
> -	if (zdd)
> -		drm_pagemap_zdd_put(zdd);
> +	drm_pagemap_zdd_put(zdd);
>  	kvfree(buf);
> +	return err;
> +
>  err_out:
> +	devmem_allocation->ops->devmem_release(devmem_allocation);
>  	return err;
>  }
>  EXPORT_SYMBOL_GPL(drm_pagemap_migrate_to_devmem);
> @@ -706,6 +800,7 @@ EXPORT_SYMBOL(drm_pagemap_put);
>  int drm_pagemap_evict_to_ram(struct drm_pagemap_devmem *devmem_allocation)
>  {
>  	const struct drm_pagemap_devmem_ops *ops = devmem_allocation->ops;
> +	struct drm_pagemap_migrate_details mdetails = {};
>  	unsigned long npages, mpages = 0;
>  	struct page **pages;
>  	unsigned long *src, *dst;
> @@ -744,8 +839,10 @@ int drm_pagemap_evict_to_ram(struct drm_pagemap_devmem *devmem_allocation)
>  	if (err || !mpages)
>  		goto err_finalize;
>  
> -	err = drm_pagemap_migrate_map_pages(devmem_allocation->dev, pagemap_addr,
> -					    dst, npages, DMA_FROM_DEVICE);
> +	err = drm_pagemap_migrate_map_pages(devmem_allocation->dev,
> +					    devmem_allocation->dpagemap, pagemap_addr,
> +					    dst, npages, DMA_FROM_DEVICE,
> +					    &mdetails);
>  	if (err)
>  		goto err_finalize;
>  
> @@ -761,8 +858,9 @@ int drm_pagemap_evict_to_ram(struct drm_pagemap_devmem *devmem_allocation)
>  		drm_pagemap_migration_unlock_put_pages(npages, dst);
>  	migrate_device_pages(src, dst, npages);
>  	migrate_device_finalize(src, dst, npages);
> -	drm_pagemap_migrate_unmap_pages(devmem_allocation->dev, pagemap_addr, npages,
> +	drm_pagemap_migrate_unmap_pages(devmem_allocation->dev, pagemap_addr, dst, npages,
>  					DMA_FROM_DEVICE);
> +
>  err_free:
>  	kvfree(buf);
>  err_out:
> @@ -805,6 +903,7 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
>  		MIGRATE_VMA_SELECT_DEVICE_COHERENT,
>  		.fault_page	= page,
>  	};
> +	struct drm_pagemap_migrate_details mdetails = {};
>  	struct drm_pagemap_zdd *zdd;
>  	const struct drm_pagemap_devmem_ops *ops;
>  	struct device *dev = NULL;
> @@ -853,19 +952,6 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
>  	if (!migrate.cpages)
>  		goto err_free;
>  
> -	if (!page) {
> -		for (i = 0; i < npages; ++i) {
> -			if (!(migrate.src[i] & MIGRATE_PFN_MIGRATE))
> -				continue;
> -
> -			page = migrate_pfn_to_page(migrate.src[i]);
> -			break;
> -		}
> -
> -		if (!page)
> -			goto err_finalize;
> -	}
> -	zdd = page->zone_device_data;

This isn't actually related to this patch but agree this is some
leftover dead code. You break this out into its own patch.

>  	ops = zdd->devmem_allocation->ops;
>  	dev = zdd->devmem_allocation->dev;
>  
> @@ -875,8 +961,8 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
>  	if (err)
>  		goto err_finalize;
>  
> -	err = drm_pagemap_migrate_map_pages(dev, pagemap_addr, migrate.dst, npages,
> -					    DMA_FROM_DEVICE);
> +	err = drm_pagemap_migrate_map_pages(dev, zdd->dpagemap, pagemap_addr, migrate.dst, npages,
> +					    DMA_FROM_DEVICE, &mdetails);
>  	if (err)
>  		goto err_finalize;
>  
> @@ -893,8 +979,8 @@ static int __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
>  	migrate_vma_pages(&migrate);
>  	migrate_vma_finalize(&migrate);
>  	if (dev)
> -		drm_pagemap_migrate_unmap_pages(dev, pagemap_addr, npages,
> -						DMA_FROM_DEVICE);
> +		drm_pagemap_migrate_unmap_pages(dev, pagemap_addr, migrate.dst,
> +						npages, DMA_FROM_DEVICE);
>  err_free:
>  	kvfree(buf);
>  err_out:
> @@ -930,9 +1016,11 @@ static vm_fault_t drm_pagemap_migrate_to_ram(struct vm_fault *vmf)
>  	struct drm_pagemap_zdd *zdd = vmf->page->zone_device_data;
>  	int err;
>  
> +	drm_pagemap_zdd_get(zdd);

Can you explain the extra ref here? The page itself should have a ref
owned by the drm_pagemap_migrate_to_ram caller, right?

>  	err = __drm_pagemap_migrate_to_ram(vmf->vma,
>  					   vmf->page, vmf->address,
>  					   zdd->devmem_allocation->size);
> +	drm_pagemap_zdd_put(zdd);
>  
>  	return err ? VM_FAULT_SIGBUS : 0;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index f3b66b55acfb..4edb41548000 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -35,6 +35,7 @@
>  #include "xe_sa.h"
>  #include "xe_sched_job.h"
>  #include "xe_sriov_vf_ccs.h"
> +#include "xe_svm.h"
>  #include "xe_sync.h"
>  #include "xe_trace_bo.h"
>  #include "xe_validation.h"
> @@ -2048,7 +2049,8 @@ static void build_pt_update_batch_sram(struct xe_migrate *m,
>  			u64 pte;
>  
>  			xe_tile_assert(m->tile, sram_addr[i].proto ==
> -				       DRM_INTERCONNECT_SYSTEM);
> +				       DRM_INTERCONNECT_SYSTEM ||
> +				       sram_addr[i].proto == XE_INTERCONNECT_P2P);
>  			xe_tile_assert(m->tile, addr);
>  			xe_tile_assert(m->tile, PAGE_ALIGNED(addr));
>  
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 22281d69e26a..03cc4a24ce27 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -1058,6 +1058,10 @@ static int xe_drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
>  				      unsigned long timeslice_ms)
>  {
>  	struct xe_pagemap *xpagemap = container_of(dpagemap, typeof(*xpagemap), dpagemap);
> +	struct drm_pagemap_migrate_details mdetails = {
> +		.timeslice_ms = timeslice_ms,
> +		.source_peer_migrates = 1,
> +	};
>  	struct xe_vram_region *vr = xe_pagemap_to_vr(xpagemap);
>  	struct dma_fence *pre_migrate_fence = NULL;
>  	struct xe_device *xe = vr->xe;
> @@ -1109,10 +1113,9 @@ static int xe_drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
>  
>  		/* Ensure the device has a pm ref while there are device pages active. */
>  		xe_pm_runtime_get_noresume(xe);
> +		/* Consumes the devmem allocation ref. */
>  		err = drm_pagemap_migrate_to_devmem(&bo->devmem_allocation, mm,
> -						    start, end, timeslice_ms);
> -		if (err)
> -			xe_svm_devmem_release(&bo->devmem_allocation);
> +						    start, end, &mdetails);
>  		xe_bo_unlock(bo);
>  		xe_bo_put(bo);
>  	}
> @@ -1628,6 +1631,7 @@ int xe_svm_alloc_vram(struct xe_svm_range *range, const struct drm_gpusvm_ctx *c
>  	struct xe_vm *vm = range_to_vm(&range->base);
>  	enum drm_gpusvm_scan_result migration_state;
>  	struct xe_device *xe = vm->xe;
> +	int err, retries = 1;
>  
>  	xe_assert(range_to_vm(&range->base)->xe, range->base.pages.flags.migrate_devmem);
>  	range_debug(range, "ALLOCATE VRAM");
> @@ -1646,10 +1650,18 @@ int xe_svm_alloc_vram(struct xe_svm_range *range, const struct drm_gpusvm_ctx *c
>  		drm_dbg(&xe->drm, "Request migration to device memory on \"%s\".\n",
>  			dpagemap->drm->unique);
>  
> -	return drm_pagemap_populate_mm(dpagemap, xe_svm_range_start(range),
> -				       xe_svm_range_end(range),
> -				       range->base.gpusvm->mm,
> -				       ctx->timeslice_ms);
> +	do {
> +		err = drm_pagemap_populate_mm(dpagemap, xe_svm_range_start(range),
> +					      xe_svm_range_end(range),
> +					      range->base.gpusvm->mm,
> +					      ctx->timeslice_ms);
> +
> +		if (err == -EBUSY && retries)
> +			drm_gpusvm_range_evict(range->base.gpusvm, &range->base);

With the above commit, here is where I think we need a module migration
rwsem.

> +
> +	} while (err == -EBUSY && retries--);
> +
> +	return err;
>  }
>  
>  static struct drm_pagemap_addr
> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> index 50e80bc892b6..b7b8eeacf196 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -205,6 +205,7 @@ struct xe_tile;
>  struct xe_vram_region;
>  
>  #define XE_INTERCONNECT_VRAM 1
> +#define XE_INTERCONNECT_P2P (XE_INTERCONNECT_VRAM + 1)
>  
>  struct xe_svm_range {
>  	struct {
> diff --git a/include/drm/drm_pagemap.h b/include/drm/drm_pagemap.h
> index f73afece42ba..46e9c58f09e0 100644
> --- a/include/drm/drm_pagemap.h
> +++ b/include/drm/drm_pagemap.h
> @@ -317,10 +317,27 @@ struct drm_pagemap_devmem {
>  	struct dma_fence *pre_migrate_fence;
>  };
>  
> +/**
> + * struct drm_pagemap_migrate_details - Details to govern migration.
> + * @timeslice_ms: The time requested for the migrated pagemap pages to
> + * be present in @mm before being allowed to be migrated back.
> + * @can_migrate_same_pagemap: Whether the copy function as indicated by
> + * the @source_peer_migrates flag, can migrate device pages within a
> + * single drm_pagemap.

This is essentially saying 'my copy function is smart enough to skip
pages in the correct placement' or is saying 'my copy function can copy
pages from one position on my device to another'?

I want to make sure I'm getting this right.

Matt

> + * @source_peer_migrates: Whether on p2p migration, The source drm_pagemap
> + * should use the copy_to_ram() callback rather than the destination
> + * drm_pagemap should use the copy_to_devmem() callback.
> + */
> +struct drm_pagemap_migrate_details {
> +	unsigned long timeslice_ms;
> +	u32 can_migrate_same_pagemap : 1;
> +	u32 source_peer_migrates : 1;
> +};
> +
>  int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
>  				  struct mm_struct *mm,
>  				  unsigned long start, unsigned long end,
> -				  unsigned long timeslice_ms);
> +				  const struct drm_pagemap_migrate_details *mdetails);
>  
>  int drm_pagemap_evict_to_ram(struct drm_pagemap_devmem *devmem_allocation);
>  
> -- 
> 2.51.1
> 
