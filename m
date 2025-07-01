Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 159B4AEF6D6
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 13:41:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2082A10E593;
	Tue,  1 Jul 2025 11:41:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IsKLs0sv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C7DE10E58E;
 Tue,  1 Jul 2025 11:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751370112; x=1782906112;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/DX0CUrOrsQxGVnCPEe0zgEZ7FMRfuTq34MAy7Q1GcE=;
 b=IsKLs0svfFmUSwf9JYHuHzThMu3LzoQARudMbDQq0r1d0gEr/Y6zQWop
 zIp9VbWPmtlJAAYZQvwcxteaTS3cn0mgQ19VATFG4l7A3RxNn8cfEAdud
 M/8A4iqvnskG8ikkBBtvxPfOKa9tmXPDskoIzk3tZ32//q0SIpeS9myqV
 ZHyzMKsWld1OqRR56Q4BNx6JaFzopJxZnFOIqxSv7XnSRXyC23P2BZaMX
 u1YPVG7ZnCHKNWiT9I1OANprkeuvxdLFJk+iw5f57Y7Nm3xE3/ePiMzaH
 lFjaFiKZ2JTlgQGyoXz3WBqfGvJD1Wcl16UdPXWJSgd2oYHKUozN8fg/d A==;
X-CSE-ConnectionGUID: Q5MSnxpbQ/GjBP1l44h2rA==
X-CSE-MsgGUID: XqPq3IVYRR2yyVZJsSgLBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="53736129"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="53736129"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 04:41:52 -0700
X-CSE-ConnectionGUID: duZ5+Nd4SRytZJ8YSXi9bA==
X-CSE-MsgGUID: URvTjyf+RyyNpiYAnitPFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="177416196"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 04:41:52 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 1 Jul 2025 04:41:51 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 1 Jul 2025 04:41:51 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.41)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 1 Jul 2025 04:41:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B9Q4N18bZmYeP139ZlSnPvCosM708xSiC1To/nWSazMFwU6KlCn9TMTqW5XFgdVTxeiMi8WD08nYvk+BV8s4k4EQ93kp82JH2u3k0YqqVRXLpX2rJvMLmoHvOkatK0ApGXbCzdFK8ig08tQ3zS+RhsvYaTiuNz2sfakQ7IEekBQJKxH3QEHEaMY1k3llbzmkR8LBSzW9KGaFZtcchGG3elaFW7E1Vll7g5qH9GlCi9UbNOXHfySOf0Q9X4gcFXPaXRbArxu6QC8OmdXfYvrc/iapMTz2LWSPfm2egsz5yiE33N8Q/O5nJ74HjEyF1weZjnGXxEPnUnThIrIWR0Fltw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lXUF7LHQ95Gg5H6U+lm6DigVl3l6rL+SHHO56rgv9ao=;
 b=mpC3We5fzsWUmwExUY1cKdu4Tw0Jlwaqv41Y2ipK2RmFzXoeQCXu9XrsCcrW2LMZGO5azYj3wjjXBrjIM0wdpQDXjMwIaGcw4cwvCuTpyKBS8QSKMssSI7ERTqj7AUP6ltq7Aww2i/oQNQaRBRT6qCniSyIsuJmYvjgdq4+VLy+5+s60fwnoSwsYfLupFt1bscVPPHXGWtkwWflhx7g7UPkATJxfTlt7C7KmlKbsLZ5wEVKJRUV5CrSKgt4nHqewP0WuG3s7J1wN1gt1MyeGc2egRcxvrTPN6kVsJgIatdkewPUfRsi4j/xMBYwzfO6Kj0LC/dL8WBKhuec3nZsViw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 IA0PR11MB7693.namprd11.prod.outlook.com (2603:10b6:208:401::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.31; Tue, 1 Jul 2025 11:41:33 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%4]) with mapi id 15.20.8880.029; Tue, 1 Jul 2025
 11:41:33 +0000
Message-ID: <eb143cc5-306c-4900-b391-9ee023c1c5b7@intel.com>
Date: Tue, 1 Jul 2025 17:11:24 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] drm: Add a firmware flash method to device wedged
 uevent
From: Riana Tauro <riana.tauro@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <lucas.demarchi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <raag.jadav@intel.com>,
 <umesh.nerlige.ramappa@intel.com>, <frank.scarbrough@intel.com>,
 =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, David Airlie
 <airlied@gmail.com>
References: <20250623100109.1086459-1-riana.tauro@intel.com>
 <20250623100109.1086459-2-riana.tauro@intel.com>
 <a2bfb8be-35bc-4db9-9352-02eab1ae0881@amd.com>
 <d057d1e8-8b90-445c-8ccb-8a13e5d41a4c@intel.com>
 <44eac6fd-df68-4ae1-8970-57a686f5782f@amd.com> <aFsaXXKZSBPrcYJb@intel.com>
 <aF8PZMuMgmWKYJgo@intel.com> <4a2bead2-3db6-4526-b980-712362b6e770@amd.com>
 <aGLKgholpl8Z3zWm@intel.com> <cebd70d9-57b5-4e89-b715-4ada250e2eb1@intel.com>
Content-Language: en-US
In-Reply-To: <cebd70d9-57b5-4e89-b715-4ada250e2eb1@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0093.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::20) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|IA0PR11MB7693:EE_
X-MS-Office365-Filtering-Correlation-Id: c1a8b2b9-b89d-4b1c-8df4-08ddb8943a5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QlZmN1IvNko1d2MxcC9XeTRDaDUvcllDSTVUK2JPSjk0SlpuaXJ0eGJGY3JP?=
 =?utf-8?B?UVJ1UnorUzRRa0g4SndCMFdkaTNmUGFpWGtzYVdHdk4xRWFXWlJkV3daRU8z?=
 =?utf-8?B?M1BkcVM5TWc3ZG1TVy9lNkI1TEs4VTErc2I1UGI5RCtGZUx1OGovMWxLMmk1?=
 =?utf-8?B?ZEtqUUwrNjlPbzNMSThZcFI3NUx5V1hCRXVTTldCUlhGMUJldldLTzBTU2E4?=
 =?utf-8?B?TnFWMjR4UEk1NkZFZXFlTTU4MEhQK0IxRXVuODNVbGhDbnJXbXYyTFdEZ3dx?=
 =?utf-8?B?VjlGZDF6OXhRSDFjejFOSlZIU1dHK3o3QmxFbit2TjV4K1grZExJWXBERFdu?=
 =?utf-8?B?dU5vNGVINzlGbWJRZ1hyYkJYTUZZc2xRalVBL3I1aEowVGpGYnQ4TjZRdzlZ?=
 =?utf-8?B?Nmh3RnZRaEdnSlI1MUhJMnZtdWJnbGNpN3YwYjJGT0tKdlorRCtjOHg2VHdC?=
 =?utf-8?B?MDlkQVhMVXJjOTgzbGJ6TmFWc1FCQ1VNR08zWFQ2UFZ1bEhuSURneUo2b1N1?=
 =?utf-8?B?eE0yYjhFeklhR0ZUSkNGdGdUWVRVeGxUd1NpdGxVMUM4OWg0b0ZuR1p3a3BF?=
 =?utf-8?B?RWEweWJFaVNtNVJjK3V5WHZrVzI2WW1yNWVOWld4OTgyU0lhbjNIKzQ5L3Yz?=
 =?utf-8?B?akpoQ0lIOHVaaHFwV1RUQ21mcm9qWTRYNFhRMlNTb2NybWNWNkw5RHIxQVZo?=
 =?utf-8?B?SUtqS3hLNk84WUN5TUd2c1V1SFJpMmMwTGFmdjRqT252dEdSRlpScmdPZEdW?=
 =?utf-8?B?YklRQWx2eGk0Mkx4SzByQ1NzSVV6M0RTbTFFSGFEdTVUdVdUZ2NhTVVReDJo?=
 =?utf-8?B?TVpQSlE1Y2NiaEEwSDYxUytMRlBKVGtQMjFaRThwNXVqZG5PZG8xVk80WFZM?=
 =?utf-8?B?Q284MWFtTm5iL3JJcThIOENZQnhrYnlUWU5rc09KaWJ1UkhFY1ZFOW5FVlo3?=
 =?utf-8?B?SG9XU0Y0aTFmY0NJY3drZDREVEpYb3lQSHZZbGtRdFFNdjJhYkx5OFEvbmtk?=
 =?utf-8?B?U0tPZVk5Nit2VEVjakIxclhqdCtzR2VobEtHUlZGQldoNUxPUHYxQ3B4eGUy?=
 =?utf-8?B?c0lFNFFicG44bWtMT1lqWTFtSFFIMUZNMmo1VUQ3azc5ZmtLdkpPa21Gamo5?=
 =?utf-8?B?UXp0MTJ1bDhKbDZmQ2ZWVm9lTUpiWUs2d1NHUUZlQWxDcmdWVDNLUUczQU5C?=
 =?utf-8?B?eUtNbFlzWmlCU1VSVzd0N1pIMXJHMVVQMitHbVBzdWpDdFJSTzN0TFdIRmhk?=
 =?utf-8?B?UkhpcnJoRlprc0ZXbFhUendjbldFTU0vTitLOXJZMTBqUVZic1BkZ05TQ2JF?=
 =?utf-8?B?QVZNTHVHelk3dFArM1FRTUZRd1FTWmdKcmh3Wnd6dzdBbUJYclMzdkxZdjBi?=
 =?utf-8?B?SnU5Ty9UQUliYUh3SjAyR0VkcFc2YkpkSDJycUJ6VSs3ejFuektUUkIxQUNl?=
 =?utf-8?B?NVdDclQwNk8wVVBGUk5vc1hESnNJb2oreFp3ek9LeFZGMUJKSTN5YmExamdr?=
 =?utf-8?B?dnRsMVNMS1lqYTBLRmIzQ1BGQjA2allodGNVdForWGR6TThZZ0JCVVJvbjY5?=
 =?utf-8?B?SXpxS0sybmNyRmU1T3dxL3EvYXF3VGdLK3RNcWkwTlZEZGF2SWxJb2VQdmNW?=
 =?utf-8?B?NVl2L2F5RXFHUkdoYXpjdDdFZXhZNTJZdjFUYTFKQ2tlazJrVFh0dGYwOVRy?=
 =?utf-8?B?enRtYXdtVk1IQ1VyOUIwajBhSWU2eUF0dVlXTzFxYjhYbzRYdElHdjZLRXdz?=
 =?utf-8?B?dW1vN3F4bmJEY250UXFlTmdZZnhwQkNzRGNMc0lxVUxYK1NvOU1QZXFTV2x6?=
 =?utf-8?Q?ZVgCc5jjpm21FBE6VfYHSy0dmeKkiEbsy0Z1s=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dVhwREpkU0lSVUhyWTVteE9ycjRHb1BLNjBLelJpMFpkczVXa0pXUkRpc1ZG?=
 =?utf-8?B?ekxiUmxDd1Q2Qm9zM2FsQ3Q1MGtyVlNKZFNEK2l3NS94YWlEL0V1ZnZhYzF2?=
 =?utf-8?B?alVENE9oOGtueXUxVzZtZXlhbnhrM3dmdUovZUFQNmZVZzVNSjVid3QranR0?=
 =?utf-8?B?emRtbDBPczFheCthNEpPbGFGRDBSVmNaeHFqc290YjN2R3VncHlGOWUzOE4x?=
 =?utf-8?B?K3NOODdKb20waTNZamRyZFZjVlhtblJod3FPTlhpUll5aDNxeG40NE5jMHcx?=
 =?utf-8?B?b3ZSSVJVK3pSSityY09MZGVPU2kwa1E1R2U1SVJ3Y2FsQ2k3S1pUTlhRUzA4?=
 =?utf-8?B?dVl4TVZKeXMySG1LWGcvTk1VTjcxQ1ZnZ0NCR0xtVzNFRUk0TjkvMklaZndN?=
 =?utf-8?B?cm9jSittd1NiS1E4RDNVKzNmSW12WmtaSW01bHY2dUt2aEluQ2c5cjRxQS9R?=
 =?utf-8?B?SFpsVEVkc0t3TDZ0LzVoNHUxajBjU0dybmJiNmJCMk45K3ZKclNzZnl3OFpD?=
 =?utf-8?B?cUZLNlNkTndPN3djMklSWm9hck9CUi9BQTBJblFKdk9vNFhDQVIwU203Tk9R?=
 =?utf-8?B?azg5SDROTE4zOGp5THRMSXltZzdVbzJNMlJ0bGg0b09hK2Z5azdiT2tZa1dm?=
 =?utf-8?B?UmhWaWMzNjgrVy9wV3FlT1Jmc2txQjEwR0VNSW80WTljeGsxanZIYU5ONzJn?=
 =?utf-8?B?RE5QN2FJanZHMGJYR01seS90MjExTExKd2EyYndXTE1SMnFtczJjN3pNalVD?=
 =?utf-8?B?RGd5MVlSdFVSY3lQUTVvTHcwWmsxMDg4UFM0QnNKNUpBTU1sOEZRZTJnTGhi?=
 =?utf-8?B?TkFGVzcyenN3UHNma0x1UHd1b1BONHVxYmlVZzdoRkZqUGxUcDZMSXRNSjJU?=
 =?utf-8?B?RWNXMUR3S3h3bXpEdTNDVXNDNnF3ZG9hNkVnd3IrYVFMOWZQOFhzMTFUaEJq?=
 =?utf-8?B?UUIzbS9MUHBjZlZEZzZQQ3dtMGcvbm9YM0dFOXFlNlczaHhyRDU4SFl5Nm5P?=
 =?utf-8?B?d2N1UVBUWEYxZHRQaGhxZmpaZWtkUlB1dTJ3WVJBSjQ3QmZmWE5XWGdKU2VE?=
 =?utf-8?B?WnZlNit3Qk45L0RqOXlxN3pSUUZKeERkZnZ5WTkvM3RveUJxVUE2SEpQeGxF?=
 =?utf-8?B?SHM3SUxyV2tTaFE2djFTV1hPbEozWC9ER2dXSWtDbU5KUWlpTkwrcDJIUEVR?=
 =?utf-8?B?Z0MwVlMvQU50eUZBSE0rZGt0V212Y0ZSeWllb2wwV0Y2azluL1VCRmxZcVho?=
 =?utf-8?B?dTlrb2NHSUpzcUUrMTNHYU9ubGYzcUYyaTNsWXJlNWhzZVZVRDBsYXIxdEJB?=
 =?utf-8?B?U0dhZms3YTFPWmVFODdqMzUwSVI2L2pLeG9nd0QwUExhOXBOYjZrSVRTRHZF?=
 =?utf-8?B?eWtBNWhuREEvWWxLdXlJTGJZQlhHZGJtMmM2MWhkc2RYdlFPNnJUK3B4dlgw?=
 =?utf-8?B?cXhUcWw2RWZGWURySStMbmxKdjlqYUpqdmplckwxNk8ySGRIRFhLbUtIc1JC?=
 =?utf-8?B?Nkc0dkNlV2R4LzdITmZqb1N1aG43ejRFUlJMb0M2THpZVG83RFYzdEEycDls?=
 =?utf-8?B?WWZHN2lTTk1ZMmdhNjdyd0U3MThYU25iRzdia2paVmk3STFkN2poUWVtNUxS?=
 =?utf-8?B?NExMZ0N5RCtiRU5QYmlsRkR5Z2d1cHAxa2p1cC9qQlpWQ2NFcmlvOGo0bzB1?=
 =?utf-8?B?L1lQd3NGUGJMYVIrTGR5dmwrQk1Rd3pJK3NlVnc2ckl3VllCbXdDWUpnRytC?=
 =?utf-8?B?YTVURGg2WkdtTFJHWUZwMnBPY0tNQkdsVXhuVFpIY2ZvbkJBQmFpa0NXYmF2?=
 =?utf-8?B?Wkl5RmJkWVFoRkpONFFJRzBibG5FNUNnL2FPWEJkS2lkUkxoTHl3elVNUTRV?=
 =?utf-8?B?NzJUR1FmL2lVb0hTd2NIblU2b2Y3RG5FZkVxRmxtQ1RYQUpHekEwVGwyTVVk?=
 =?utf-8?B?dys4MHBHS2M1OGZ3ZmVCbUhrbndJS21mVFhYbnM0MElxR3FpZ2xSVnd4K1hy?=
 =?utf-8?B?S3J5R0JGVkNZcXdIN29QVFR1bExJS0dtZUVzYk80THVLeFlCejNQaXVVemdP?=
 =?utf-8?B?ZWhyVnhFVFQwUVVtQ2l0aFJIZTd0NmU2YzVxM3JJdVR3K0JUN1JCNFd0TXJR?=
 =?utf-8?Q?se778ixdB97vnVCeg4M+bHcem?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c1a8b2b9-b89d-4b1c-8df4-08ddb8943a5f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 11:41:33.4078 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4jKKesi5kN9ZI5RLc179xvrsV6mTNjJgntG/nrWkOux1wVGcyE9lorKyNmaZufBxI+3zYZCAFFthrImfyZa6Jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7693
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



On 7/1/2025 5:07 PM, Riana Tauro wrote:
> Hi Rodrigo/Christian
> 
> On 6/30/2025 11:03 PM, Rodrigo Vivi wrote:
>> On Mon, Jun 30, 2025 at 10:29:10AM +0200, Christian König wrote:
>>> On 27.06.25 23:38, Rodrigo Vivi wrote:
>>>>>> Or at least print a big warning into the system log?
>>>>>>
>>>>>> I mean a firmware update is usually something which the system 
>>>>>> administrator triggers very explicitly because when it fails for 
>>>>>> some reason (e.g. unexpected reset, power outage or whatever) it 
>>>>>> can sometimes brick the HW.
>>>>>>
>>>>>> I think it's rather brave to do this automatically. Are you sure 
>>>>>> we don't talk past each other on the meaning of the wedge event?
>>>>>
>>>>> The goal is not to do that automatically, but raise the uevent to 
>>>>> the admin
>>>>> with enough information that they can decide for the right correctable
>>>>> action.
>>>>
>>>> Christian, Andre, any concerns with this still?
>>>
>>> Well, that sounds not quite the correct use case for wedge events.
>>>
>>> See the wedge event is made for automation.
>>
>> I respectfully disagree with this statement.
>>
>> The wedged state in i915 and xe, then ported to drm, was never just about
>> automation. Of course, the unbind + flr + rebind is one that driver 
>> cannot
>> do by itself, hence needs automation. But wedge cases were also very 
>> useful
>> in other situations like keeping the device in the failure stage for 
>> debuging
>> (without automation) or keeping other critical things up like display 
>> with SW
>> rendering (again, nothing about automation).
>>
>>> For example to allow a process supervising containers get the device 
>>> working again and re-start the container which used it or gather 
>>> crash log etc .....
>>>
>>> When you want to notify the system administrator which manual 
>>> intervention is necessary then I would just write that into the 
>>> system log and raise a device event with WEDGED=unknown.
>>>
>>> What we could potentially do is to separate between WEDGED=unknown 
>>> and WEDGED=manual, e.g. between driver has no idea what to do and 
>>> driver printed useful info into the system log.
>>
>> Well, you are right here. Even our official documentation in drm-uapi.rst
>> already tells that firmware flashing should be a case for 'unknown'.
> 
> I had added specific method since we know firmware flash will recover 
> the error.  Sure will change it.
> 
> In the current code, there is no recovery method named "unknown" even 
> though the document mentions it
> 
> https://elixir.bootlin.com/linux/v6.16-rc4/source/drivers/gpu/drm/ 
> drm_drv.c#L534
> 
> Since we are adding something new, can it be "manual" instead of unknown?

Okay missed it. It's in the drm_dev_wedged_event function. Will use unknown

> 
> 
> Thanks
> Riana
> 
>> Let's go with that then. And use other hints like logs and sysfs so, 
>> Admin
>> has a better information of what to do.
>>
>>>
>>> But creating an event with WEDGED=firmware-flash just sounds to 
>>> specific, when we go down that route we might soon have WEDGE=change- 
>>> bios-setting, WEDGE=....
>>
>> Well, I agree that we shouldn't explode the options exponentially here.
>>
>> Although I believe that firmware flashing should be a common case in many
>> case and could be a candidate for another indication.
>>
>> But let's move on with WEDGE='unknown' for this case.
>>
>> Thanks,
>> Rodrigo.
>>
>>>
>>> Regards,
>>> Christian.
>>>
>>>>
>>>>>
>>>>> Thanks,
>>>>> Rodrigo.
> 


