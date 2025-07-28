Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E08E9B134E7
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jul 2025 08:31:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B9A910E481;
	Mon, 28 Jul 2025 06:31:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mRBNl6P/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A03F10E335;
 Mon, 28 Jul 2025 06:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753684298; x=1785220298;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7XW6df/iinNEO9FCM3keHKOK0MdDN8sftITIFAbI6qE=;
 b=mRBNl6P/lRtU+ZGzHgf+LELdxE4+q1EcX8rn2E7gPvG+lCMVP36K+O5n
 pf398wiVoozR5hvJt7kaLMw7iM9Nhy9d3s2AKSsiRVBTHXOGX0cgKoXpO
 tQNK4lQGMyIU4V899GE/1+DKR//+iU12JArFNDIj0PSJ9WnRHJLYV2DpD
 Rj8qsvCO0Rq4RRuRqDUYup9vM5bvF+41og3lx5CckkPdqc59mbKqkodFD
 A1ETc2plnDiMAzoA7B7gc6hoUwpEpIQYGZgD+KpFZH0A0QEkHldbjKPFE
 d9LrswCexfJ7UczfEGTrZBlxUGKK43KLn+wPQucZOEQ1EzBywM8Jw8G46 A==;
X-CSE-ConnectionGUID: F0EFV1swQ561PZFSb07Jww==
X-CSE-MsgGUID: x9IK8oNjSGqv4mz3hITjAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="78473436"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="78473436"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2025 23:31:37 -0700
X-CSE-ConnectionGUID: Le3NOzbvQrCGlP2edg15cA==
X-CSE-MsgGUID: 7HIoZVyrSvy4Lrc2Q50I5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="185961032"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2025 23:31:35 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Sun, 27 Jul 2025 23:31:34 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Sun, 27 Jul 2025 23:31:34 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.61)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Sun, 27 Jul 2025 23:31:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xkQpzoSpnLtcLTLfBVgWE4h5pMtCcmGjAC3wiJ16gFXlfxmdaZo5U8+hKfdO2nK/Ct+WxOYOjxBDi7M9Zqj0feGkDDk6R7ib9/W+Fhkk9+egOVu86ERLTUt2j8dHGOoDAn2sIPxCv9+zmN99sTr1dgG9e2a0FvUPn5KH5bwpyINM8hTl7+TqZBP3w6hZQ08ageenLyxpZfaRwZn5H8Q5g0qjusCt2zcnmymRptKnPmkMTLLoOdNu59cdRpFNRp+fSLiYXarvf7EfljcadTalGapB6cMY8tA7btZcf/cEHs3osQC0VbpKYO2UTmRIed9Azs7R1nCOy7btUIpcUD8XPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NytSfNI5rDlcuvoJKtxZfzjodJ3S8mZWZ34UECwofkI=;
 b=ujFelhhQzjCwlwieXL85u5ffcDx7v/rSpfczoVr1Iwtp7OCEzeDoWS8H5SzY0VkdhDgp4/FcwRu38KAZzy4uWn8lnhBh4UteH4MdmyBJj8wHHRA3Nv14GtwpUERN4xkc5/UiIKaoFVEA+wxUqYmWGE3oJUUGF6pJKlNQjjUNi4xydc/08boW1OzLNg09sgisb//oWwadnMHqOCsCxxFY2juSV4ziAnMJarJaUOv2sco1cbTc0SBKlClkppxkdTmQmpxbecHSrxo3mrEHUXJWWHTSHqatFgo2x//UrtOkF9Q0KRB19s1nV2NJlaNz7C2+CbzwfhORJyfb06I8Lkwdag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by MW4PR11MB6572.namprd11.prod.outlook.com (2603:10b6:303:1ee::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Mon, 28 Jul
 2025 06:31:23 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%5]) with mapi id 15.20.8964.026; Mon, 28 Jul 2025
 06:31:23 +0000
Message-ID: <7da11f03-29fe-4bae-af0a-c85de7e68140@intel.com>
Date: Mon, 28 Jul 2025 12:01:16 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/28] drm/i915/writeback: Add writeback registers
To: Suraj Kandpal <suraj.kandpal@intel.com>,
 <dri-devel@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>
CC: <ankit.k.nautiyal@intel.com>, <uma.shankar@intel.com>
References: <20250725050409.2687242-1-suraj.kandpal@intel.com>
 <20250725050409.2687242-5-suraj.kandpal@intel.com>
Content-Language: en-US
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
In-Reply-To: <20250725050409.2687242-5-suraj.kandpal@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0030.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:178::14) To IA0PR11MB7307.namprd11.prod.outlook.com
 (2603:10b6:208:437::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7307:EE_|MW4PR11MB6572:EE_
X-MS-Office365-Filtering-Correlation-Id: 85bb7a59-6a90-494f-4132-08ddcda05ee0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MWZrTmx0ZWVjcHAvY0kvaU05SUo2VFpQbVJMb2ZWMy82U2crRHRpSVNDa1RF?=
 =?utf-8?B?RkFMdHFVWkQrU1hnOVlrNHB1YnMweVIzaDVDcDU1bDd4VHZ3WnB4MGhJdEI1?=
 =?utf-8?B?ZS9ENFNVNEpzUWRVLzAyMFdZVWFpaWxiTzRNU1hVV2ZHeWd3QlQySDI4U1Rs?=
 =?utf-8?B?NWdjRzF3Rlg4MmprdVN4ZU43bFNPUko4L25kU2FNaFhEaGJUelpuZmZjK2JS?=
 =?utf-8?B?MHQ2ZFk3QW1CWTZsbGlYVDNoZlh6SHkzQ1EzMk43UTNOZ3JPUWtOUXd5L3Nq?=
 =?utf-8?B?NzdoZ05mY1EvUDBBT1VGbUo2TTJNamR6TG9CR2h0UTNYNDRUUE54NmlmZ25u?=
 =?utf-8?B?TVJlOERRaXNSRmFNSTBJQ0FWRXhzVkkwWHNVMjdlZjZlNktGUjBBU0hGb3dQ?=
 =?utf-8?B?Yk5CNXlIcVFlM3k1MlAyZ2h4anNQQkdvdmJzM2VRQ25CQUlES2JKdHprMlpN?=
 =?utf-8?B?N2VVK1dvd0hOWktHR0hXMmZKVGY3STVTT2l2Z3QwUTdmMGZRM2E3Y3g0NERT?=
 =?utf-8?B?UlRnOVU5dURpa1VqV3BRdHR0KzFGMkhPMFhVdFBjdWxtWmZKbXNXcmJQRmFX?=
 =?utf-8?B?bTR1MnBxYWhMMDBQa0RwQzJveDBMV2QzNFRDYlNqS2x1Rjh3L0JaaGhjdlcy?=
 =?utf-8?B?NnJ1M0h6Q1UwcFdXYWVUUHVtNy9nSnNTaU9STE5EUjYvL3VuMDVsbFRjTWFl?=
 =?utf-8?B?VnkxTFBPOXFWQmlRQWx0VzdaVmVGYk1QZ1RhSmgrOUJEdXI0ZWFhaDdUY293?=
 =?utf-8?B?a0xZeXlNdXJ4enJHNEk3cEJiSDY3clVWTldNQjBNbk1MdFQyL2hsdENxVldl?=
 =?utf-8?B?aDRvNDQwd3pGclc4VGpqeWRSQ2hsRHN4UEtmYTk5RXg2dVdVTUM0Mi9BNnkx?=
 =?utf-8?B?M3ZKVG1zMFNMSkk2eVFSODNvZjZQdXBHWHFOYS9qOTI0VjdnbXN6VFJiNm9R?=
 =?utf-8?B?NzJDS205Zmd4bjhtU09vcVYrKzZhQitBcVVCQ0pPMGVmeGdWWEFZVXJVYVlE?=
 =?utf-8?B?K21MUGhPUFJmNTczV0dXZUkyOWJYQW9OZWRZN25XMlRTY0laYlI5aWJqYTlK?=
 =?utf-8?B?L21VZ3RkVlFHR2pDZmI1bHdIVFo3NFV3d1owbHo1ZXhoRjV6eUpwSjdBNkpN?=
 =?utf-8?B?VUMvS2Mrb2xKdnFXbVNDSmc2aWVyN1NKUXJBbk1rc3BrczBwVE9CN0dibmQy?=
 =?utf-8?B?KzRCQlkwR0lrWGRXSnhKT3VMM0VGMXlMMTNPTUtRWjBqWTNxMTd3bFNHZmNZ?=
 =?utf-8?B?Y2t0NDZpNktnc2FTc2RXRGo2ZTFiMUo2Mk9JSWNmOW9adnZVd1E5QVlUZ0Fs?=
 =?utf-8?B?ZzUrVUtYUng1R1lRanZpdElMTzRWc3YwRUptTi9Kbi94aGRlVlRpZFQ1ZCto?=
 =?utf-8?B?cWt2SXhQRXdDd3djaytoTzIxVkswRXYzTWdYVVYzWDRoSHdzaUtsbnMzUUFm?=
 =?utf-8?B?M3l3Y3UzKzdydjNIb3Ezd0N1MzE2QjNYdmxPcDVGNlVzeXlJLzJXQk5aSDZF?=
 =?utf-8?B?YUhLMUFqNFQ3eG9Oc01jakt6ZEoyU3FJdlZBdG1VeHZuUVc5Q0lZOElBaUVE?=
 =?utf-8?B?T0NtRmxSQ09rYkxJVjNMYURXWTRZenRJbDVNMWxta3p1cXZZK2NvZ2F6R1R3?=
 =?utf-8?B?NlZ1UFNpdENMemQ2UHdaZDJseUtNUitaMU0waW1HZEYwUkpERkFBOXFDN3BL?=
 =?utf-8?B?WkUzSHYwY0d0dzZOTUhCTEZac2IwbUwvT3cyK3grT2RITUhveXlYR1dzTEpI?=
 =?utf-8?B?K3hhN1dXV2hSclh3a1NHUzZCK0RCT0xCcTRLNmduSEZIZlVHREdkcUV2MXdV?=
 =?utf-8?B?K0tYU0diUFBJcVJhSnRFZWkxWmwrYkIzZE1PQ0ZzSUliTEFuU2RadDRLKzhE?=
 =?utf-8?B?WXNKbmZZTDJXZG14THhyb0VuQm1vaEIwaWR4RVphWU5FZHFveVlwdXJybGxQ?=
 =?utf-8?Q?qkAzNFYGqXU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SkovSDd0bXZMaks0VThmWFBLQ3h4LzhSTlBPR2lEdnJTaWJQQVB3RS9ZN1ZZ?=
 =?utf-8?B?Q3FIdHJYYlViYTY4VVJnOVlIUGxNSVZiQ2hLY0QwR3hTUlZnUDBwVFJGb3gr?=
 =?utf-8?B?OTNuaUNjTGg5aCtManlHcjlWYThuQlhWNmQ3RnY3NGIyV1VCa0pVbHZqRmFC?=
 =?utf-8?B?OFlrL2U0NHJQWUpJbkFjRDNMYVFsNWlFM2czdnBsWHlsMWJUcHhkTVM4N3Jp?=
 =?utf-8?B?VG5TVlJKanNuZG5kRGtCOWtpSnE4OUUrU3lZWmZHV3J2QXJpSXpEWkNmMnpv?=
 =?utf-8?B?cngzZ0xKVWIzSFZBclh3ZWZXK1dBUHFUSGN4ajhPOFZWN1JIUlRUdDJWSGh4?=
 =?utf-8?B?TFpCcnVkSUp2YWtCY1FPczdXVm4xLzAyZjRJc1JSV1RCUi9zQ0IwUFVsVkRW?=
 =?utf-8?B?RlVXU0FoUlA4dWhyaTBPcHg2RG5VQ3pqU3ZsKy83UjFkWVMxemdNQ1FaSzBZ?=
 =?utf-8?B?QjRvQXQvMzBGMGFjMEJjeDF2d2FxMEFNdEFLTndRSFMrZnVwa3ZyVlNDQmJE?=
 =?utf-8?B?emk4am9ZWXg4dFpQcHQxbERQdzljTGt0SFdJa3lYZk1IQ0lqbUZUU0wzSG1x?=
 =?utf-8?B?T0hydEwvckJGSGVWdld4Zm5panFUeUJDWEprekhYeDFZMEZWR1hXM2RZakpt?=
 =?utf-8?B?M3FyOFJVMnJuckpoajQxekR5cGtmRGE1Uk9Ba29YbTVsNUZ6cWdXRWZoS0NW?=
 =?utf-8?B?aFNyTGFHdHUvT2ZLZURtMzA5ak1QMTVWRGYyQXJqM2hwZ3lqZnZ6L0lURm11?=
 =?utf-8?B?Z1BMMDNUc2UvRjltaXd5TGNSYm1TQXFodVR3NWI0MW85WVM2TFQ4QXFGVDlS?=
 =?utf-8?B?WVpTVTJLb1d5RHRDTnpJc1d0WHp0NmtIellMcHdEajdPQzVDbXJRQUpQRFFR?=
 =?utf-8?B?RE1IYXVzUGN6WFpCUnljQnB4RVlsWGJYT0Erb2xJMVRQRnlCanArUXJyQnJD?=
 =?utf-8?B?cXR0UkxrVHlmMlZlbjl2YkJhU0s5WVNJNEJiVzhOV3NMeWVXZjdINzh4VlBt?=
 =?utf-8?B?VkxQMVFkWmxOczJxdXlNUGhaWGx5K3oxaVhXbDFIZzhKS0ErZHFZUVRIZkdw?=
 =?utf-8?B?Y0NNelNJVFIxV2FZSTRDYWJ6WTdmZzQxWGlUS3BmM20vdzJhbUpDTGFLTk1G?=
 =?utf-8?B?V1ZUcGxicU5qUHY3d29DczFFRW1PRkJZWnVMRWE3S2I4NmNDRGlBOHA0Uk9w?=
 =?utf-8?B?QkYvdHFRRldWbVo2STV6Z2lHeEZkbEQ2MVg4ZDJRbDJ6dnQ5QkZIdlR2bkhp?=
 =?utf-8?B?eXNhYnpDeUJyRGtZdGxXZ2ZBNEd4Z2JNcU9zSENnak80MlA3cG5jenBjY2V1?=
 =?utf-8?B?eW9ldjRGd0NKRk5DUmZIUVRHblVBV3VIUEoxNFFDWVVWdWVJcVFqcmFjU2Z1?=
 =?utf-8?B?SG5XTW5ndlcwVERPQnFpWjNFRHFKMEo5aWp4ekhNQjl5ZmtyUGRyVC92eFhD?=
 =?utf-8?B?TGR2anVwWEhHWE9QZ2VMSFJRT2E0UUZhRmVYWG96RGtoeEdzZTZtNHNXSFF5?=
 =?utf-8?B?TU5aNkF5aFFvYmtlSGJBYkdNdllGOVBMMytWQnk2V081djNBREFPN1FMaURD?=
 =?utf-8?B?aEdVL05NUHpqbjBwcWtUMnBTVEE0TTVMeXh3eXpJTTFsUm8zZTR4NGJxemU4?=
 =?utf-8?B?MXZ0b0pkb3Nkd2h5THczd1FDeDErNzByQ3E2Yld0c2ROeFI4aHQwN1BNd2p2?=
 =?utf-8?B?YTg3M09KYU1nbnJWcERHbkFNMEVCejVFZG5jVlpBWjNGclNTQWZCMFQwQ1RU?=
 =?utf-8?B?dCtvOS9ZdFlLM2RjWVpKODVYZlp1U2tiUGZUTVJ6WFlnNGVFczdzWjFLdFBR?=
 =?utf-8?B?Z0QwWm1DVlMrWlZPOUVTTVVoZ2d5Sm9yMU5MNGlMQXVaSUZkWmZlV1p1Y1ZW?=
 =?utf-8?B?dE1DZzNid2t0NHN4ZDFsdGVkY3FSRmdhcUFmSDdVYmpGN1ZybU54b2NkVWxy?=
 =?utf-8?B?cjNaNkd0NTkzN1JidGFKZGIydDV3NDBnSnhGR1BMNjhwUjB5dFI2SHhJeHE0?=
 =?utf-8?B?bUtDSFRXcktUZm5VSjkvNEtsam43Tk5iWkU1ZVZVQWZFYVhjdHFRQ1FaaXk1?=
 =?utf-8?B?bWRXQy8xdVBDZTJRVjFXVzQxSUFsamZlL3A0WVZYMGNOdzNnblZLOXVjSXUv?=
 =?utf-8?B?VVhxZ0Q2d2J3dm9UOTdKUzRiUTljU2FXc0lGNWpyaVIwaWF3WDRIamM5MGJp?=
 =?utf-8?B?dGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 85bb7a59-6a90-494f-4132-08ddcda05ee0
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2025 06:31:23.2182 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 19MsSXlmzymowywjYXubgQAqAUszSipqgJ1q4ocfuQmG2qJ6M0CYZedvY2I5WVqTma0Sa7sh5tRnKWd9LOg+wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6572
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

On 25-07-2025 10:33, Suraj Kandpal wrote:
> Add writeback registers to its own file.
>
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>   .../drm/i915/display/intel_writeback_reg.h    | 136 ++++++++++++++++++
>   1 file changed, 136 insertions(+)
>   create mode 100644 drivers/gpu/drm/i915/display/intel_writeback_reg.h
>
> diff --git a/drivers/gpu/drm/i915/display/intel_writeback_reg.h b/drivers/gpu/drm/i915/display/intel_writeback_reg.h
> new file mode 100644
> index 000000000000..ffe302ef3dd9
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/display/intel_writeback_reg.h
> @@ -0,0 +1,136 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
After updating the copyright!

Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>

Thanks and Regards,
Arun R Murthy
--------------------

> +
> +#ifndef __INTEL_WRITEBACK_REGS_H__
> +#define __INTEL_WRITEBACK_REGS_H__
> +
> +#include "intel_display_reg_defs.h"
> +
> +/* WD 0 and 1 */
> +#define TRANSCODER_WD0_OFFSET	0x6e000
> +#define TRANSCODER_WD1_OFFSET	0x6d800
> +
> +/* WD 0 and 1 */
> +#define PIPE_WD0_OFFSET		0x7e008
> +#define PIPE_WD1_OFFSET		0x7d008
> +
> +/* Gen12 WD */
> +#define _MMIO_WD(tc, wd0, wd1)	_MMIO_TRANS((tc) - TRANSCODER_WD_0, wd0, wd1)
> +
> +#define WD_TRANS_ENABLE		REG_BIT(31)
> +#define WD_TRANS_STATE		REG_BIT(30)
> +
> +/* WD transcoder control */
> +#define _WD_TRANS_FUNC_CTL_0	0x6e400
> +#define _WD_TRANS_FUNC_CTL_1	0x6ec00
> +#define WD_TRANS_FUNC_CTL(tc)	_MMIO_WD(tc,\
> +				_WD_TRANS_FUNC_CTL_0,\
> +				_WD_TRANS_FUNC_CTL_1)
> +
> +#define TRANS_WD_FUNC_ENABLE		REG_BIT(31)
> +#define WD_TRIGGERED_CAP_MODE_ENABLE	REG_BIT(30)
> +#define START_TRIGGER_FRAME		REG_BIT(29)
> +#define STOP_TRIGGER_FRAME		REG_BIT(28)
> +#define WD_INPUT_SELECT_MASK		REG_GENMASK(14, 12)
> +#define WD_INPUT_PIPE_A			REG_FIELD_PREP(WD_INPUT_SELECT_MASK, 0)
> +#define WD_INPUT_PIPE_B			REG_FIELD_PREP(WD_INPUT_SELECT_MASK, 5)
> +#define WD_INPUT_PIPE_C			REG_FIELD_PREP(WD_INPUT_SELECT_MASK, 6)
> +#define WD_INPUT_PIPE_D			REG_FIELD_PREP(WD_INPUT_SELECT_MASK, 7)
> +#define WD_COLOR_MODE_MASK		REG_GENMASK(22, 20)
> +#define WD_CONTROL_POINTERS             REG_GENMASK(19, 18)
> +#define WD_DISABLE_POINTERS             REG_FIELD_PREP(WD_CONTROL_POINTERS, 3)
> +#define WD_PIX_FMT_YUYV			REG_FIELD_PREP(WD_COLOR_MODE_MASK, 1)
> +#define WD_PIX_FMT_XYUV8888		REG_FIELD_PREP(WD_COLOR_MODE_MASK, 2)
> +#define WD_PIX_FMT_XBGR8888		REG_FIELD_PREP(WD_COLOR_MODE_MASK, 3)
> +#define WD_PIX_FMT_Y410			REG_FIELD_PREP(WD_COLOR_MODE_MASK, 4)
> +#define WD_PIX_FMT_YUV422		REG_FIELD_PREP(WD_COLOR_MODE_MASK, 5)
> +#define WD_PIX_FMT_XBGR2101010		REG_FIELD_PREP(WD_COLOR_MODE_MASK, 6)
> +#define WD_PIX_FMT_RGB565		REG_FIELD_PREP(WD_COLOR_MODE_MASK, 7)
> +#define WD_FRAME_NUMBER_MASK		REG_GENMASK(3, 0)
> +#define WD_FRAME_NUMBER(n)		REG_FIELD_PREP(WD_FRAME_NUMBER_MASK, n)
> +
> +#define _WD_STRIDE_0			0x6e510
> +#define _WD_STRIDE_1			0x6ed10
> +#define WD_STRIDE(tc)			_MMIO_WD(tc,\
> +					_WD_STRIDE_0,\
> +					_WD_STRIDE_1)
> +#define WD_STRIDE_MASK			REG_GENMASK(15, 6)
> +
> +#define _WD_STREAMCAP_CTL0		0x6e590
> +#define _WD_STREAMCAP_CTL1		0x6ed90
> +#define WD_STREAMCAP_CTL(tc)		_MMIO_WD(tc,\
> +					_WD_STREAMCAP_CTL0,\
> +					_WD_STREAMCAP_CTL1)
> +
> +#define WD_STREAM_CAP_MODE_EN		REG_BIT(31)
> +#define WD_SLICING_STRAT_MASK		REG_GENMASK(25, 24)
> +#define WD_SLICING_STRAT_1_1		REG_FIELD_PREP(WD_SLICING_STRAT_MASK, 0)
> +#define WD_SLICING_STRAT_2_1		REG_FIELD_PREP(WD_SLICING_STRAT_MASK, 1)
> +#define WD_SLICING_STRAT_4_1		REG_FIELD_PREP(WD_SLICING_STRAT_MASK, 2)
> +#define WD_SLICING_STRAT_8_1		REG_FIELD_PREP(WD_SLICING_STRAT_MASK, 3)
> +#define WD_STREAM_OVERRUN_STATUS	1
> +
> +#define _WD_SURF_0			0x6e514
> +#define _WD_SURF_1			0x6ed14
> +#define WD_SURF(tc)			_MMIO_WD(tc,\
> +					_WD_SURF_0,\
> +					_WD_SURF_1)
> +
> +#define _WD_IMR_0			0x6e560
> +#define _WD_IMR_1			0x6ed60
> +#define WD_IMR(tc)			_MMIO_WD(tc,\
> +					_WD_IMR_0,\
> +					_WD_IMR_1)
> +#define WD_FRAME_COMPLETE_INT		REG_BIT(7)
> +#define WD_GTT_FAULT_INT		REG_BIT(6)
> +#define WD_VBLANK_INT			REG_BIT(5)
> +#define WD_OVERRUN_INT			REG_BIT(4)
> +#define WD_CAPTURING_INT		REG_BIT(3)
> +#define WD_WRITE_COMPLETE_INT		REG_BIT(2)
> +
> +#define _WD_IIR_0			0x6e564
> +#define _WD_IIR_1			0x6ed64
> +#define WD_IIR(tc)			_MMIO_WD(tc,\
> +					_WD_IIR_0,\
> +					_WD_IIR_1)
> +
> +#define _WD_FRAME_STATUS_0		0x6e568
> +#define _WD_FRAME_STATUS_1		0x6ed68
> +#define WD_FRAME_STATUS(tc)		_MMIO_WD(tc,\
> +					_WD_FRAME_STATUS_0,\
> +					_WD_FRAME_STATUS_1)
> +
> +#define WD_FRAME_COMPLETE		REG_BIT(31)
> +#define WD_STATE_MASK			REG_GENMASK(26, 24)
> +#define WD_STATE_IDLE			REG_FIELD_PREP(WD_STATE_MASK, 0)
> +#define WD_STATE_CAPSTART		REG_FIELD_PREP(WD_STATE_MASK, 1)
> +#define WD_STATE_FRAME_START		REG_FIELD_PREP(WD_STATE_MASK, 2)
> +#define WD_STATE_CAPACITIVE		REG_FIELD_PREP(WD_STATE_MASK, 3)
> +#define WD_STATE_TG_DONE		REG_FIELD_PREP(WD_STATE_MASK, 4)
> +#define WD_STATE_WDX_DONE		REG_FIELD_PREP(WD_STATE_MASK, 5)
> +#define WD_STATE_QUICK_CAP		REG_FIELD_PREP(WD_STATE_MASK, 6)
> +
> +#define _WD_27_M_0			0x6e524
> +#define _WD_27_M_1			0x6ed24
> +#define WD_27_M(tc)			_MMIO_WD(tc,\
> +					_WD_27_M_0,\
> +					_WD_27_M_1)
> +
> +#define _WD_27_N_0			0x6e528
> +
> +/* Address looks wrong in bspec: */
> +#define _WD_27_N_1			0x6ec28
> +#define WD_27_N(tc)			_MMIO_WD(tc,\
> +					_WD_27_N_0,\
> +					_WD_27_N_1)
> +
> +#define _WD_TAIL_CFG_0			0x6e520
> +#define _WD_TAIL_CFG_1			0x6ed20
> +
> +#define WD_TAIL_CFG(tc)			_MMIO_WD(tc,\
> +					_WD_TAIL_CFG_0,\
> +					_WD_TAIL_CFG_1)
> +
> +#endif /* __INTEL_WRITEBACK_REGS_H__ */
