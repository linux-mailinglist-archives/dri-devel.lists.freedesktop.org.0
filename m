Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 171FBC1C24A
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 17:39:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E196D10E10A;
	Wed, 29 Oct 2025 16:39:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T3itu25K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47F7C10E10A;
 Wed, 29 Oct 2025 16:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761755964; x=1793291964;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=v7G5dBDG9dT6BIBGV/LDzZk8CryIbRpf663ruK5Eoec=;
 b=T3itu25KbL7Nmo0TXOYR0thyOAZ4grkQkVWgxqek/MWf6h/SoamR3IWA
 XJH/AvwHxQeYDh+WTQ9E0GEHVAIVWaIuUx5NDfGH+GByPzNDkA8WU5EL6
 DJqqJE3yubvKZZji5iXB8BumPUbrdUgkTNAeGS0cKySq+qn/MnTLIV1er
 0VJxdy7tVPP/2JUkcaEXKIC0tcJjqS61mRoHScYLf9st1+Dkjv4G6p1Uq
 Uukc0MnwpcYT2nGsAeGBABOqt8MoOJJUVW+cw1D+MnoAel/X2xg4AFBpi
 gTOjfNMKeRu87tI+2laJGWczZ6vDNXxFRpQaUquJUcgkS3ZbndVx5EOSE Q==;
X-CSE-ConnectionGUID: fT5+5//aQj6DdMtYEDJvBQ==
X-CSE-MsgGUID: cBGgZxlAQJG3+hPjmpfptw==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="67746635"
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; d="scan'208";a="67746635"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 09:39:24 -0700
X-CSE-ConnectionGUID: 2JXyJsFkQL6ltU+67+kRrA==
X-CSE-MsgGUID: KZrEeEjnTPq6JQ5TchQbDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; d="scan'208";a="185598044"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 09:39:24 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 09:39:23 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 29 Oct 2025 09:39:23 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.64) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 09:39:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TtFBEwtSrA3VlVOvnJle21l5BtdzHbFrVO32hiSjql5r1DAWM2Q79JAFAvbziEtQ6VOgUGselue/dDSOj2SceQRhQkfN/zwVFf0kjFvKxzLhW1GTkNZTd1q8dv2GKTV8lnPprUBj9A408NgarKvS9tRl0k2jh3fzf+80w06BuUmKlr6Jin3oFJkdO3mxwaGTwBUMY/0gBHt5/RC2hMuJB3V0IClGEzRJCKHMxg2KcvsjfGBjXdOgXKAvbfD7b1XncIuoj3TUlJyfdkH35dzQSjByhv2hZlTp6KBZdrGcDoT/eoKb+IjXI9aiuatYb60fuQJWZn5U2CRs33OaDiytHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uyz0AOR5xD+GMY0ZuZ9qVEQE+QHQZc/sY3TyPyuOzzM=;
 b=wK8tlOxVSmI0YCj5Ki7dE+/P+Vu7wPc5QR+s1C7Txn65pB114OZTwgvA/pRDDpc43PPw5nilzbEOX8ISfLN/kZxSlSJ1GgMzXRG46EB02iSu/xhGuSqkA4lhIxkvEziu58mFLtz+lbKgxrb74H5+PGfcMZRfpIc3RnP7YV1bRuG2UkiU0A/A2V6QyCj5HYTtyxyC0yQbrW8BKyMjwoFyo9oLpCuAMSs03+1oBjbIxzt3XazTzO58b1x3535P4ayc+DD6NP16odLT+06BAoYEVLF2DrZ8bC4RFS/YnLWFV+ojizOYGNruOPG1tI6FP6mVr3JMM/P6eupiUl7m30hqkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by IA0PR11MB7308.namprd11.prod.outlook.com (2603:10b6:208:436::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Wed, 29 Oct
 2025 16:39:20 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc%3]) with mapi id 15.20.9253.017; Wed, 29 Oct 2025
 16:39:20 +0000
Date: Wed, 29 Oct 2025 16:39:09 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
CC: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>, Andi Shyti
 <andi.shyti@linux.intel.com>, Janusz Krzysztofik
 <janusz.krzysztofik@linux.intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2] drm/buddy: Mark
 drm_test_buddy_fragmentation_performance test as slow
Message-ID: <bxwjcxdwyvvclchjqqm7er46dqx5br7y37smponyp35vs4smmn@qrohjfiyvwd7>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20251029143313.42630-2-krzysztof.niemiec@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20251029143313.42630-2-krzysztof.niemiec@intel.com>
X-ClientProxiedBy: WA2P291CA0031.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::12) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|IA0PR11MB7308:EE_
X-MS-Office365-Filtering-Correlation-Id: ca073e9b-03ce-4c73-464c-08de1709b581
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UFVhTkRnMUZGQlZRQnN2MWhOS2MxeC90QUpnSHFNZWxhWkQxQ1B2UDUyckY5?=
 =?utf-8?B?cnZzcytRYWk2Mk44UjRrSDRlWUpNdFZvZTYyNGZPUmJrWXRqZkJIK2pPYmF5?=
 =?utf-8?B?WWJ4SUl5aStTMkZhdnFHeDFSeGt2WjdLay8xM1lOblVKalZWMUcwZ1V3cG10?=
 =?utf-8?B?NnlDT3lPaVUzLy9SdlN5NDJLUU5hd0JpSGE3M0VXUXF1THlpZDdOS1paaXdZ?=
 =?utf-8?B?NGJ3QnZWSHFDeGtFNkh6SVJNZWNHaFBhajhyMEZpKzBlZWVPd0hFTlVkZ1hs?=
 =?utf-8?B?cVY2NHV2bmZ5dGpMLzY1VjB4bktEdmtCSmVZakNWRjVZZzdXYkxGMU0vUDQw?=
 =?utf-8?B?dzY0akVkZFl4WnQ0TzF1WnFzQzdUVkJBZmJqSVMwWFZ6NDh2ZnRoakdDSnY1?=
 =?utf-8?B?NklDSlgrMjI3S3gxR2FtVm5UNTBBR1AvWVFRUUkxelJUazY1VFh0VUdkMjha?=
 =?utf-8?B?Z3ZmRk1ocFJ6Z1BnS2VjSTh4Sll1Z2lpdHZBVzJZQWFLMFhaYzRQdTI4bGIy?=
 =?utf-8?B?ZnhiT1dwRTNZR0tORUptbG10UlQ1Vm1DVnFXTUU0azVGa3VCdUZNc0dWVzdG?=
 =?utf-8?B?a0xQMkhpWkFKWUk4cWNqR0V2OHFjc01ONXFsb0dmRVdKTnRQUVZvemtVTmlW?=
 =?utf-8?B?bjFicVRiWjlZVHpwaGROaENQbzZVeUY0L0ljMS9lVFNGb0FRTWhVMTNFd0pW?=
 =?utf-8?B?Yjk1K2t1VzRBSHFyTEE0Mk5xKzM2bEhKdGg2NktJWjlKU1JGOUNBTlE2SmI2?=
 =?utf-8?B?Z1hhU3pFOW1GMHczZUZ2ZGxWRU8yUTVjd2hGNEJ1eG92d3JCNXJTdTY5enhO?=
 =?utf-8?B?eUp5NXZ3QXhhaG5UUHZRajFDVGtXdmlZRWFmeGt4UUVuZDJ3Y2F0czZJbGJi?=
 =?utf-8?B?N0owQS9XRTZmVld4OTlxVVkra1dxa0NCM3AySkVLZE1jVnJrclZHWVJabVd0?=
 =?utf-8?B?b09OR1NUYXpHRkVRbHRGN0M5cmF6emdVOU9vbXNZbEh1d0ZLUkJlclJySkNa?=
 =?utf-8?B?ZUtRRWtzQkYzSSt5Z1VLYmxWVXh0S3IxSVJ4cGFQL3lNRGtxc0tTaEtxcGVh?=
 =?utf-8?B?UEFhSnYzVEtYMFJGM095cjhiczk3akpJYjJrSDZmZU1aWTJRZzUxemE5dngx?=
 =?utf-8?B?aVhCSUhwWFgvR0lEZm5BMXNDVUVYYkFBVEtjRm04R3A1OG8za1lCNnNvdEQ3?=
 =?utf-8?B?aFUrTzNrNmlnamhXSTJaTlNadjY3MGRpblpHcml1WExmYVRGZytnTUdSNEJ5?=
 =?utf-8?B?UnFab0hNcnpOSkZJa2ZncmJ5MFg5dENiVWxDd215UnVqSjB3ZHBvdFpUUUVS?=
 =?utf-8?B?TnpGRUVGeVJxVU9ISXlubVRIOE1JRklOWTRKSmR5cHNOVHBCaWlFTDJIbFNH?=
 =?utf-8?B?S2RsaHU5dVVXTkJuVmxlekw1YnBHc1p0d1VjbXJENUw5M0dtYlpyVndVUFVt?=
 =?utf-8?B?Q1JLN1c5amppUUlSY2RUSWtiTXJNY2kzWklXTThka1FmSUNhN2R0aWZHSjBw?=
 =?utf-8?B?dEhjK2pjeGEvSlRTSVdHdm5HZ1pKQThuOUd5UmYvZjVseVlhTGQ5VUZRWndS?=
 =?utf-8?B?eGlHeStYYW9vdjA5SmJSOEhjT0VpWEx0TzNuUEVmSUdqUVRON0plQzVFbVVV?=
 =?utf-8?B?eko4RTEyR00yWVJONnArajNENll1RjQ4ZTM0ajllNXBIdDhlam9MaVR6ZWI5?=
 =?utf-8?B?aFN5dDVpQnY5Q1d5SlhGb1NzSWRZdlBDc0pVVy9DMXJsOElwUUFHQ0F4RDQ0?=
 =?utf-8?B?ZnlFT1JzWExUemUvZzlIOTQwblVLRzA3Y1hpcm1PRGZwUk1tblNPdFVCY3ZV?=
 =?utf-8?B?eHVLN3RuSDRrQktDenJOMVpvRHJ5ZUZ4SmJHMFhlUDNNbE5rVG1EcFluTVIr?=
 =?utf-8?B?emdKUmVoR3AydVR1T0NQUVpFczQ4cGI1REJ3UmFXMFg2eXc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cUpjRnVMV01id04xa0x6R2tTRXV1M21ybnNIeEx0MEMvc294QVhDanNIWEtl?=
 =?utf-8?B?aGpQWkdFelZBNkdycW9QbmpuaXRnNW5MaTU1TTNFZmgwYnd2Mkt1VEwrRElJ?=
 =?utf-8?B?TmpIUHByK0FNU2pVYzlWQkFmZE5aRWYzRjZpYmZhWmhXQXVQMURrd1poa2kz?=
 =?utf-8?B?SEtjSlZ5bUpiZ0tjUXFsbGQ3K2xVdW9qcFY0SEMzZlRITWtTVnlpcHZzd3V6?=
 =?utf-8?B?MW04dzFqb1B3MitML1I3TDRxNWhJVWZMaDdDaml3dVcra0lmZVAvcG9TV0pE?=
 =?utf-8?B?Z21lSEFEL1RoU0ZOLzlUb0UvYnUwV3JmWWNVREhNZGFhRjF3aVNqY1luVDBO?=
 =?utf-8?B?bVVZVVlDeFpCVGw2S1ZJRXhXWStxQ0R3V3BjYitTbmtVMzQ3bXZoaDNuM0xp?=
 =?utf-8?B?T2ppaVRnMG0xMFlXK2JjNGZQMnJJamFnTzA1Sm8zcm94bzVXMEJhRS9LTGZQ?=
 =?utf-8?B?VWxMRy93YkNvazVEdllFdDdlb1hqQS9MSGp6ejZxbHhhRWx2dmNJZWtEZGZV?=
 =?utf-8?B?WmszUHhtZjlZMm9wTXhXVmsyQS9KcTRjaEw5Zk9CWlU5aXBxeTFWeGNBTlJP?=
 =?utf-8?B?YVFaNEd3WU8vRGdGT2VKelptQmRNcjRGcFlTMUlzVG9RSjNKalp5cElSSm1r?=
 =?utf-8?B?NlBzYmZmS0FSL3Y0emFVa05yc1lrVkJYQi82M0NaK2VIeFdCVTV5b0Z0Rk5q?=
 =?utf-8?B?ckd0ODBWNXRHeElWd0h6WFJmVjdJRldKNm9zN2FKVkIyNVd0alFCWE4ydVNZ?=
 =?utf-8?B?TVE1bWNmUEVkQklHTjRYTTF3Snd5MGwwc0ZSV043bThQaVBjY1NwSlZSakxS?=
 =?utf-8?B?Wmtud1d2MGIzS05HY0JWQ3FHZEhTUFZBaWVoMmVzZk1vYXFaMUZyNUNXdmtS?=
 =?utf-8?B?elc4d1J0cHZQY2tVQTh2elVNdXlKaWY1S3lEUk8rbitlSnZGeUczb2pyOGlv?=
 =?utf-8?B?ODFXUThIUjRnSUxsVkhYWUR2dGU5cklaZW95RmdLTzY4Tmt5TmJEOUhTakFa?=
 =?utf-8?B?NVpkQjFBdDY4RTFDdm0yT0huUm5SSlRLSWdINUszcEVVYjhwNGM0aFhlcTQ4?=
 =?utf-8?B?SVZOaWpRZi8wVXM3V0x4anZLOG9zU2tVU3hnT0lLeGFUbHZDMzN0c2xUbEpu?=
 =?utf-8?B?N0daT2Q1V2txY1hqejJtSHRoTWkvSklzUE8wSk9GcmxnVEtveE82ZktZeS9y?=
 =?utf-8?B?WGNvNmRZbmd1UjlmSDhYMDBnbm4xZXdiU3RjY0lYMkRTWGFIaEVqMTBXQmhG?=
 =?utf-8?B?UDlGbVRmTkwzRFo0UndMZ1VTSnA2am41NVdaQ3F3bWo1NHdzWXArZ0VtVDRG?=
 =?utf-8?B?MHV6YStteFNmNG5DZHVMTUZWdVBkZk9nTFlvUmFzVzhkNktKTXNYeDdTR2Y2?=
 =?utf-8?B?dkpUTW9CVE1EcWdlUnpOWENKSlM4MlpiLzhTeXY2THFlSElhaWRIQWhlRzE3?=
 =?utf-8?B?OEJTWkRzNlNqZ2lWc29EZGFSZ3FYZnM2WW9PbGRHaWRjR3l6M3pFVlpQZHF5?=
 =?utf-8?B?dU1UekRQVzVYaTBndlUwdEpmZTc0V2Nhbmd0ZTRZNk1Qbk5UNjY4RHlZdzJR?=
 =?utf-8?B?M1djdVNXMGtRbEw4LzFRT3lnS2VTZHZVcjE1NVhTRGd4SnVRTXVCc3VaRG85?=
 =?utf-8?B?L1RzaVpiNjh0aCtLR01pazR4NldvV2wrUWZmMHBwT2dPbFBHZS80akhIemE1?=
 =?utf-8?B?b3hYSy9vNzN5eUNKU2JQOHJIZEprV2xsaVdLUWowUDcvN2RuQW1xWm9SaFZY?=
 =?utf-8?B?T2d6bWo2UWxGdVMvbmdWTTI5R0J4MXQrNjY2SDQvMHlPaVRma2lTOXJOelJL?=
 =?utf-8?B?SXBtY0RrUnA0NGEwY3RpWWJjTThkMkU4b0Nad3dWV2Y5WFZyb29FV3BKUk9h?=
 =?utf-8?B?RmsrdkpDSGFsaWlrN0JwMkZDRXNlaUs5VkhZQUw2bWxJQWdhTkVXMk1uOXZs?=
 =?utf-8?B?b0dGd1lHRTVEMldDb1J2SlJvUENHcEFtTG5rMkpZdWhWQXVPTFhPNXpYN0JM?=
 =?utf-8?B?MmpVMlRYZmZTelNJYzFwaDJaMHkyQ3FZUUlRQW5KaVhTTWdSV0hITWo4RXJx?=
 =?utf-8?B?Rnk5S1ErcHRpQWRGM2NOb0N4SkdHaGZ1TVI1c1drZmZoZXRCUUVPUDJQd1BY?=
 =?utf-8?B?VUg0Q1ZSVGNUeGVhQ1k3alVUUlg1ZGJBb3RLWTdBZEduUUMyUWJlWVVJR1B1?=
 =?utf-8?B?V2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ca073e9b-03ce-4c73-464c-08de1709b581
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 16:39:20.4154 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3BCoVNTVPnI1id8EdqXc7pZ1HGg30upV/OoikBI2DHGNtnvDmvO4ajq7E9plFxhYPI38zL/aVfxL8gfM+9MK5jnqUDpkAT/TjMEuzcxyRw0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7308
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

Hi Krzysztof,

On 2025-10-29 at 15:33:14 +0100, Krzysztof Niemiec wrote:
> Mark the newly introduced drm_test_buddy_fragmentation_performance test
> as KUNIT_SPEED_SLOW, as it might take more than a second on some
> systems.
> 
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15095
> Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
> Reviewed-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> ---
>  drivers/gpu/drm/tests/drm_buddy_test.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c b/drivers/gpu/drm/tests/drm_buddy_test.c
> index 5f40b5343bd8..672423af7c17 100644
> --- a/drivers/gpu/drm/tests/drm_buddy_test.c
> +++ b/drivers/gpu/drm/tests/drm_buddy_test.c
> @@ -876,7 +876,7 @@ static struct kunit_case drm_buddy_tests[] = {
>  	KUNIT_CASE(drm_test_buddy_alloc_contiguous),
>  	KUNIT_CASE(drm_test_buddy_alloc_clear),
>  	KUNIT_CASE(drm_test_buddy_alloc_range_bias),
> -	KUNIT_CASE(drm_test_buddy_fragmentation_performance),
> +	KUNIT_CASE_SLOW(drm_test_buddy_fragmentation_performance),
>  	{}
>  };

Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
-- 
Best Regards,
Krzysztof
