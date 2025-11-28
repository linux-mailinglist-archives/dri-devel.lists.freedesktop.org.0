Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A5EC92E9F
	for <lists+dri-devel@lfdr.de>; Fri, 28 Nov 2025 19:36:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34FC310E901;
	Fri, 28 Nov 2025 18:36:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W7uRRvUP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A48910E8FD
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Nov 2025 18:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764354987; x=1795890987;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=eizeez6EQ5J2KqjJLEDlsOKUdkIS0A/+ji51gS+cqOE=;
 b=W7uRRvUPyHg4BFzcB1luudyPmYBU2kF7Si8j0d7SetmSa1ser/HEsKrF
 JPF5bnaRobWstA+OejMWBpV0dS3jOQ2idGgw7Kd7JQMRTf95uK0T0Wwex
 KdFSRY1EydjmfGybW5HtAFANpNo4BCLYDCou/QOtOERk++kfGaLFW41XQ
 7+r/9sqSQNxhQwDZesE+pHfWjR08IAi4/rUuskgExOQ7YRS+cuhQ/w/ot
 C6VCEaN7fzbMXkQ3Xkh4bDeHfDlzkjrOUgpf8q3A52ma5r/jPhhzv0oqZ
 7HmTQ5bc7/QE+2n/PCfJ1qztLgPhVzYcZV2gbVcqlw0njAAeSXuJUhRSk A==;
X-CSE-ConnectionGUID: 0juKzLOLRmWFbu2TlsvYgQ==
X-CSE-MsgGUID: 7MFSKKqfRtmCTXxx+wZbOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11627"; a="89035573"
X-IronPort-AV: E=Sophos;i="6.20,234,1758610800"; d="scan'208";a="89035573"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2025 10:36:26 -0800
X-CSE-ConnectionGUID: Srn6CcmWSnCV2M0Xt7aMJg==
X-CSE-MsgGUID: TPoD9LrUS3aDuu4Ay3KKLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,234,1758610800"; d="scan'208";a="192638796"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2025 10:36:26 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 28 Nov 2025 10:36:25 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 28 Nov 2025 10:36:25 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.47) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 28 Nov 2025 10:36:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xzvw064t2X834OogHTcBPFkTTZrYDaQCJzYibR1e4KbAGGGt0PU9C4KDNuOYRG+oI+T6N1o9wLpqxlg38ugLeGVnAAcyMH5laJvULi41bxxnGfqZ20weKNfg5lPGh+3eViJlBJisGcjVdS7iPLiiivhzYVWk9a6CQIk6BBel5mOLHELFVVGBlFMPsKEVRrllPC0yAhdDBjoZobo9CppqdRkeHU9bTqwQ3H7qtVcicF4pxT9/Khv5RY4yutwBLYkqJVvKlQixtomZN4UeJN7+yrOu391Fu8Cqn6AmePxhNMz/8a5RGpuAb2F9qCjFpUbXKUs76mlhLZpaczGQHUHTPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NEuJXQEw+YnogF6AWHGSoWCwk/eZNRPXgfP3Mkoc1qw=;
 b=bsa3MAiEIoUNx9sW7v+IYE15Q2OFvhytNrPZ3zxDnhtyIVs+rUiwgas5nGy5zs02vL5eN5TxJrKSRKczaEGVKqAddeRhp7WAMPq/RzCADv5TYsQR1AipEWRvjlz5oVo6b6gXpoSYu4F9Nmok2gBs042egEtjpc0pNL1nKd9cb9HT28rDu4ASC6bxkig5zoAc7VJZ5vjmSiKdeej4lupj4CMWrdaJx2xo1lh0v8CV/OwFxK/TYzjs84K9e90nj7F83txcyR8vV4cwHF+jfS5KR9wisR3Uw0iGIWXjkKsBVBwjq/0WIGl5QsDtTk2/LQGZFRrRA2JZMl+CsW00SUFS5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by LV3PR11MB8578.namprd11.prod.outlook.com (2603:10b6:408:1b3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Fri, 28 Nov
 2025 18:36:19 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9366.012; Fri, 28 Nov 2025
 18:36:18 +0000
Date: Fri, 28 Nov 2025 10:36:15 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Jordan Niethe <jniethe@nvidia.com>
CC: <linux-mm@kvack.org>, <balbirs@nvidia.com>, <akpm@linux-foundation.org>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <david@redhat.com>, <ziy@nvidia.com>, <apopple@nvidia.com>,
 <lorenzo.stoakes@oracle.com>, <lyude@redhat.com>, <dakr@kernel.org>,
 <airlied@gmail.com>, <simona@ffwll.ch>, <rcampbell@nvidia.com>,
 <mpenttil@redhat.com>, <jgg@nvidia.com>, <willy@infradead.org>
Subject: Re: [RFC PATCH 1/6] mm/hmm: Add flag to track device private PFNs
Message-ID: <aSnrnyfr9fvst6eO@lstrano-desk.jf.intel.com>
References: <20251128044146.80050-1-jniethe@nvidia.com>
 <20251128044146.80050-2-jniethe@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251128044146.80050-2-jniethe@nvidia.com>
X-ClientProxiedBy: MW4PR04CA0277.namprd04.prod.outlook.com
 (2603:10b6:303:89::12) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|LV3PR11MB8578:EE_
X-MS-Office365-Filtering-Correlation-Id: 90689be4-54ae-4292-6d14-08de2ead055b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YlJvZU5rNm1JeDFpZ01iaTZTUmtFU01pTFBQZTB4SlhTTDMwV1hkK3pJS0Fz?=
 =?utf-8?B?NHFzWjZWeXI3WU1rRUZENi9peTBQNGhIL25vNzBkR2Q5bkFnTUF1ZmsxYjRs?=
 =?utf-8?B?SGRkcm9Gc3lwNnFuQ0hvMjEyNHFGdGlCVkJIcCtxcWYxZldqb2V6RE5zSm1t?=
 =?utf-8?B?ai9UclVpY2pJU2tnYTJEdW9JR0VqR05RZHpMVHlTbDJKNzlRNUQxd2pvcHp1?=
 =?utf-8?B?Q2dCNEVVRHZ6WjdBWVdPWUJKZy9hdGpaSUNnWURrNEtjQTh1TG9ZSGJOMTIx?=
 =?utf-8?B?VE1jSnVwL1VLN3lXcS8rcnB6ODVHVzlUY3NCUHJUcnpUa1o1UnpIaVhDVmIz?=
 =?utf-8?B?WlBReHhZU0FNY0laZUhwT09IakRESUZ2Q2ErWTk0TG1uYkFXWjR3TERIMUpy?=
 =?utf-8?B?Zk9ZaG9uTkd1MlMxdzI5MUFPbWpGZ25ObTJSbjdZNXdITnQ2K2hJN25TSWts?=
 =?utf-8?B?OWdjNkgyTlBCTFV6TVBZQmJVaVJMZUcvTUY4NjNVbWZ5b1Q3M1djbm1YL2V1?=
 =?utf-8?B?Ujl3V2txRWNxNHFUSnF6R1FhUFVBNHR0TUtKKzUwamhnWjlhWTZVd0NDRTAx?=
 =?utf-8?B?RldDSU5wOUhXdllYVE9pSlZFMElBYkJ0ckZFSjNsc3p6alBFd2NqYmlONVpi?=
 =?utf-8?B?cy9LNFZxc25INTVFSzNoUzhtalY3UitzNXNJdmxnZ3dmUGwxQUNLZFZ6cU02?=
 =?utf-8?B?dllyVXREYnBoeGhEYkJUeENQaW5LQjZCSVlEM05YcTdmUjFuWkt6R1RUL1Ew?=
 =?utf-8?B?UEx5TWg1dStaWXlKTWw4YjR3RHJXT3VNMkt1Q0IzU1BJVDRyUlI5L0JuaytL?=
 =?utf-8?B?eW4yWUx4M21RTENibXcxQ0Z6eFZCcitUUVNTa2lMT3I5dzY2ZmxaL3E3dUFS?=
 =?utf-8?B?cTFxWTlMZXcybHZkZm9nYmlNdTRML0JYVGdVbzB1RGd3cGdJNzlDWlJKQ2dw?=
 =?utf-8?B?UGREV2V6ME1FV01TdXY5MmFVOGdNU1hUWkNCVHRGdUR0YnRGN0lvRzd1d1ow?=
 =?utf-8?B?OTRvbHNpM1hzcUZ5TjFPUmZmY3lmQS8xWmNPQmFYdVhlcHZLaTdUanVjNjh4?=
 =?utf-8?B?R0lEV2dmSkZTZDZwVDJ4QldVRE9yaHFPZ0x3d2tucyt6SGNySWtsNnNHR3cy?=
 =?utf-8?B?N1N2M2Q3WGtuWnYvdXEyRVc3b1FKMmFwWnNOV2lPakc4TWtMaTl1NUxIUkJz?=
 =?utf-8?B?WUdKYU5KcFZvUW5YRlFGQzFjd255dW9rem55bjFyUGVGYS8rNk9Fajd6cVFs?=
 =?utf-8?B?b254Qnphb0pRWVZJRzRNQmhZZlVUTTFzTkxFK0wvdW1JS0RWdVl1VENvZnB1?=
 =?utf-8?B?TDQyblhhaVVoU3VadUYvNFN6aGZkZ09QVlFxREs0QngzUEpQOGZoc05tZzRa?=
 =?utf-8?B?ZUdkOEhybFFmL2Jnd3oyOWJxdm5VMzFpY3dRcVdoOEhKUFNhVlRha3NkemVW?=
 =?utf-8?B?Y0xTR3UvdjhKZUxvb0JQVWZRSDZRRkhnY01seVB5Zy9kQkJUdlVsY1NiZytw?=
 =?utf-8?B?Y1BPcXFHc09RaForZ3ZYbXl5cFFKd3dKNkxGOWhxUHpna0t4SXc2MXhHM1pa?=
 =?utf-8?B?aEd2cHc4aUcwUFM5OW1tQUFveHpYT080d0ZaV1h6YkZQL1FxR3FzbkFqQk5n?=
 =?utf-8?B?akIrMHI2MmszOWVNdGdiYjhYalNLdENzaElINU5kUzh1dGhPTzNhQUhrbWRn?=
 =?utf-8?B?QlZvZm9rWjlYdE5xODFOVkZQbHhJOXllZFZNZzBraWx6TFVrTzZsZDFmTnlP?=
 =?utf-8?B?dnVtdlVGSUdtdzREZU1xZFdyZmpyMHhwL1J6ZEFtNEZadmRnejMwYWhJWkFa?=
 =?utf-8?B?Nnh3ZlAvcmFqTFNoeXNkYU9TRGFQZzlqcHYzOHZxQzZaUjBRcEk5S1MwZGFz?=
 =?utf-8?B?VS8yb3d0cS9ic0hVZGRqNVRQUXEzV2gxSzBVQTFOcUdwYzBGeTE3Y3hGcWRL?=
 =?utf-8?Q?D2shpP4XPscR6ZI2PaYJIUSHTMfd+G9h?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QlAvL09oazBidGVPa0Q5ODJ1blpGbjFHeC84TW9hd2prQlV2d2MwYUQxaTFn?=
 =?utf-8?B?ckI1RzVVMnRwWklGajcyREpybGRyOWZzNm00L2drdGF5dW9uN0hSU0Zrcmxp?=
 =?utf-8?B?N2tKMUI1bmE4VXd5WkcxQzFmbjNlN0pNR2FTc08yZUI4eTVnb1UwbkNtRGcx?=
 =?utf-8?B?TjZ0eEFWdHpPc1BDQWNNLzQ2eVlKNVFZYy9WTmFEejlGN0x0UzNoZ0d4VGpr?=
 =?utf-8?B?SXR2MTlHSElPMW1iQVZOd21JZXp0VHhVQmJnQ1c1SVFmQVdJa211dnQzTDA3?=
 =?utf-8?B?YkpUa3gvWWg3Tk85WE5ySCt2eFhHQkljVnZ5MzVZcU04TnVIbjhkUW9wbE9r?=
 =?utf-8?B?cnNXSmxlTFRyU2dGK05YTVdNbnM4aUxFWG82NjVZS005enlsamZtbGx5RmV5?=
 =?utf-8?B?d0pKZXpQdHlZZUsydEhOcVNFUkROUGxiODd5KzREZ05JTkpDbFd4RFdEQTFW?=
 =?utf-8?B?cm5NNHhGdTY0WEFlVUZXU3VKUHlmcVRFS0tpUWZxeFdwNVlJYnh5c21VNmxp?=
 =?utf-8?B?ajlaYTkyRlRabDI4cTVBZ3hoRVFLZWNNT3lTdTJjOVVOaWRKN05wUExFTCtv?=
 =?utf-8?B?eG1EajA5dnY5NHZEamVwSVJTN3lwTE82UUVnZ2JKQW1kUGxiVlFMcHZUUlhB?=
 =?utf-8?B?WE9lL3hEUzVLY2xTbmNuQTYvWTlTc0tGd0l5alRaSWlNNFphSnFHTTNpMWd0?=
 =?utf-8?B?QWplaHpOc0cxcHdNZ0JTV1ZENDJpZ1ZJNUdnM1RkK2FHbU56R2p2S2Q1b09O?=
 =?utf-8?B?YkpmVzB6N3kvMWdla24zdlM1UlBCQmIwbWIzYXU1QUZ0bU9nV2c1WVVqTGF3?=
 =?utf-8?B?SFUyYzE3cXRqZXFqZlU2VGlSR2RCQUx3S28zWWNoVk1rMzA1M1VZQmhpNC9N?=
 =?utf-8?B?ZG9sK2tLYTMvOFhTdzZRS3hWRVV1NDJNa094cjJYeTN0RWd3d01PUWVRZFdN?=
 =?utf-8?B?QUdsL2hiQzZPSndEd1BKS3JlSnFZM1NtWUFHNFFZOEc1U2JDTGR3QUF3ZGZn?=
 =?utf-8?B?SnhZbzh1cEFlcjh5Sm5QYVVvMFFlM0NJSHN6c3R5aStQdGRybm9WcU9JYmxn?=
 =?utf-8?B?ZWRGcDNpSERjaFgzemQyYnJSS3NFdCtwT0kwdDBvb2ZCV2Npckl6TEQyQ0w3?=
 =?utf-8?B?WG9NZFIrbjFCVnJSMDd4QlJockI3bHdzNDVVNnBkUDRyN0tvbEVkdVc4Y3pK?=
 =?utf-8?B?S0xvVjYwQ0N5ZitUZkV2bVRKRkZYbWhMbmNpMFJqL2NkY3lkL0dkaGVYR0NJ?=
 =?utf-8?B?MmNWWVQ0TThxTDQ3clFXMXZkVTEyR00vSDNqcHlWRTZ1UDJpNHozanEwS0Jv?=
 =?utf-8?B?NnZ2K2RqT1dObFpvcTZiUzlCMFJaL1J2WG9lemJmMG9EV096Nk81QlBoeGk5?=
 =?utf-8?B?WFJ2Vjl3OTF0bG5laXRxUnE2UVZVKzh6bTZnQ09XRkllWFlNS2Rjamw5MWtR?=
 =?utf-8?B?ODRoQTlaUmMrd09HZ1BpL3FVZkZNbFhLdi9lR0dBWVlxb2FUdEhEMlhxcWpu?=
 =?utf-8?B?NURsMHpPaEh2cXRXZXpRd3ZCOFpGQkJIK2xpcGs5R1lHZmZndmM4WEF3NzZn?=
 =?utf-8?B?eGNCR2RDcUwyNDhvV1NHS2FJMkkvR25pNVBWVTdVdjRVTC9qWjVGanMzbVVK?=
 =?utf-8?B?SXBidjJhZkRLVDlQbHFNQkRSaWMxclZHb0N4eDZaK1hyQkFyQnJkR0YyV3RT?=
 =?utf-8?B?Q0dqNFRZVE45YzYvNVFXQlZudGd5RnlqYmt3RlRLdjlVZmpOcTREZVBMeWFw?=
 =?utf-8?B?SlgwTWdFOWFpT0dxVDJpTFZGdlBTbVU1cUZ2SXZ5ZGw5eTdrR2JvSyt6cE5q?=
 =?utf-8?B?akwvcGRCUkIvYXpkeXArY2Zkcm9VdCtVL3A4cGoyMXhDL1Y4b0h6ZFhTMitN?=
 =?utf-8?B?Z1NFRGNKcm96Nkx2QVNjcFZDTVR0RFlTams2d2xqNUpFODJsYUh0NXU5aWVM?=
 =?utf-8?B?L1MzS0tLM1crVm96YjZCT3AyY2ZRNzZYNWMvRUdFOTRiTVpVM1VBbnlJM0JG?=
 =?utf-8?B?WEp6T1BSRTFWbXBGRXRnVUhCODhKdjV6Q0Z4YlRtOUFzcFR4Wk5wdkxYd0xv?=
 =?utf-8?B?QkxqYWEzaWhXUkFLdVBtYUt2bXR2VFZ1N0p6RWNCQVRVSG14dmJLc1dXTFRT?=
 =?utf-8?B?OEZwVzM0OWg5ODBhcEp6ZFQ1ZGtHNjkyRVd3NFpCbHZuaHFRS0dlamxubW10?=
 =?utf-8?B?aHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 90689be4-54ae-4292-6d14-08de2ead055b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2025 18:36:18.8316 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gjMH7uYS7mPt85bvP+ra9Jsqj0a418I75vyRGxzJu/ThTcHxGRU5i2GidRsZKE79sA3GtiVEN3sI7URAAqHDIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8578
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

On Fri, Nov 28, 2025 at 03:41:41PM +1100, Jordan Niethe wrote:
> A future change will remove device private pages from the physical
> address space. This will mean that device private pages no longer have
> normal PFN and must be handled separately.
> 
> Prepare for this by adding a HMM_PFN_DEVICE_PRIVATE flag to indicate
> that a hmm_pfn contains a PFN for a device private page.
> 
> Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> ---
>  include/linux/hmm.h | 2 ++
>  mm/hmm.c            | 2 +-
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/hmm.h b/include/linux/hmm.h
> index db75ffc949a7..df571fa75a44 100644
> --- a/include/linux/hmm.h
> +++ b/include/linux/hmm.h
> @@ -23,6 +23,7 @@ struct mmu_interval_notifier;
>   * HMM_PFN_WRITE - if the page memory can be written to (requires HMM_PFN_VALID)
>   * HMM_PFN_ERROR - accessing the pfn is impossible and the device should
>   *                 fail. ie poisoned memory, special pages, no vma, etc
> + * HMM_PFN_DEVICE_PRIVATE - the pfn field contains a DEVICE_PRIVATE pfn.
>   * HMM_PFN_P2PDMA - P2P page
>   * HMM_PFN_P2PDMA_BUS - Bus mapped P2P transfer
>   * HMM_PFN_DMA_MAPPED - Flag preserved on input-to-output transformation
> @@ -40,6 +41,7 @@ enum hmm_pfn_flags {
>  	HMM_PFN_VALID = 1UL << (BITS_PER_LONG - 1),
>  	HMM_PFN_WRITE = 1UL << (BITS_PER_LONG - 2),
>  	HMM_PFN_ERROR = 1UL << (BITS_PER_LONG - 3),
> +	HMM_PFN_DEVICE_PRIVATE = 1UL << (BITS_PER_LONG - 7),
>  	/*
>  	 * Sticky flags, carried from input to output,
>  	 * don't forget to update HMM_PFN_INOUT_FLAGS
> diff --git a/mm/hmm.c b/mm/hmm.c
> index 87562914670a..1cff68ade1d4 100644
> --- a/mm/hmm.c
> +++ b/mm/hmm.c
> @@ -262,7 +262,7 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
>  		if (is_device_private_entry(entry) &&
>  		    page_pgmap(pfn_swap_entry_to_page(entry))->owner ==
>  		    range->dev_private_owner) {
> -			cpu_flags = HMM_PFN_VALID;
> +			cpu_flags = HMM_PFN_VALID | HMM_PFN_DEVICE_PRIVATE;

I think you’ll need to set this flag in hmm_vma_handle_absent_pmd as
well. That function handles 2M device pages. Support for 2M device
pages, I believe, will be included in the 6.19 PR, but
hmm_vma_handle_absent_pmd is already upstream.

Matt

>  			if (is_writable_device_private_entry(entry))
>  				cpu_flags |= HMM_PFN_WRITE;
>  			new_pfn_flags = swp_offset_pfn(entry) | cpu_flags;
> -- 
> 2.34.1
> 
