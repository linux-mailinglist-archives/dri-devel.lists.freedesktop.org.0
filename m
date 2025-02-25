Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F405A434CB
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 06:45:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2D8810E108;
	Tue, 25 Feb 2025 05:45:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GFp7lzqQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6CDE10E108
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 05:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740462330; x=1771998330;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=5XX5xJoTc20T4TuRLstC5wDjFolI2y+qEj6pdj1Di68=;
 b=GFp7lzqQLuM0e5psCv4/4qSA5AJa4B4xM3I5V/SS9Q9A4JIHBwky8b6+
 8QX+5aA2LpmOBwP7nqIkwNZ7nbzs5p4giCMmZrrdS/eKFl1pgJXtTgwor
 JSIE0ptS7oi0Sq83ubdR3wHpcbECvYQm264gjR77InX1VIJI32MNqpiA6
 mt43liAFMdGN9PwdchnY6KsEjo1Tp9kgDMQvZzQnTTu3E4bY8fNFyr5vh
 wlZogzBP/io5mC8wRWHQ5y/pT2olz19DcoNaTeXbhNwJAg7I6H7nTtm7N
 pbycuxsLpIWVyGkyZbnUn0WTMoeE2hl+xIN8BsfgsUgtetvUt4+vvnqIG Q==;
X-CSE-ConnectionGUID: MelIt15nR7aNcHeARy270A==
X-CSE-MsgGUID: yCA1Oxg7R2KTNHhRYpeV9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="45034836"
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; d="scan'208";a="45034836"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 21:45:30 -0800
X-CSE-ConnectionGUID: a5cKHXNDRbmgVvLTToz76g==
X-CSE-MsgGUID: Ucp1fSWvRzu3Lm3lNacQSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; d="scan'208";a="116915815"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 21:45:29 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 24 Feb 2025 21:45:28 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 24 Feb 2025 21:45:28 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.49) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 24 Feb 2025 21:45:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EnrMH0v/YfbaIivuHtP297P6nZe6CPbX3AjZOYv32mUazi9g/weoJydigsaacQ4eindXYJbWtQFRf9WeEKyMpS/5Nql+wMwEbxWMjXypDaHF2oNTw1X8FwiDe+UlFiGdIzE7r4mLLF2eanGg8D+b525jEbeg+DtBIAna/InlV9BnT5jCgB8mnvB5yZl4GfP19nRyqspP5H5+hxmhfs9CMBc7eDfxOxFoyu+Hf5LYThsRe1BnLGzTPJddBLh7J/gYTH4KI3pIFm1TfUYNYNkvxSauBNodqx7tglqlkhQU8rK/QhXPMxdqShOlYFOaUkj5wPnBreK9SLbmeWTJXSB5Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zj/4hafYcgtluR8OBUffsI9Z1KDSP4+THaaPPkYWd5U=;
 b=iWvhUJoFIq8POuWsUXTsoSykbNdZGQ7iU9hGJSlWDGNjBHJ+CpdqRZsuok3p0lElGfHk6uxJG6FPJv6pg+NyB1BhymQM0oxZGaYnRohPYJKORU/31ITUOKXjwnZcd9cT1Pux+CiQDSLBaSflk9+FDoTV0boCLDUB6UeQZfKRRZFecCh9FujPi1jKWRBCeYl7PX7/88WvKEJfOBwmkkx3X1HRqS6eNUNBhPUGIj/8v63KuZD+FTuihUJ4S060gIkjXVW8sWoFA0B7RWsKZgKga+uexHr+4ucijKvr0QrBrAXU5Crx86YnBIdTmC8O7456sRoMXILhlfuV/9BW7Ok++w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB7511.namprd11.prod.outlook.com (2603:10b6:806:347::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Tue, 25 Feb
 2025 05:45:24 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 05:45:24 +0000
Date: Mon, 24 Feb 2025 21:46:27 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <phasta@kernel.org>
CC: qianyi liu <liuqianyi125@gmail.com>, Danilo Krummrich <dakr@kernel.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/scheduler: Fix mem leak when last_scheduled signaled
Message-ID: <Z71ZM9Cs1Wb4mhD3@lstrano-desk.jf.intel.com>
References: <20250221062702.1293754-1-liuqianyi125@gmail.com>
 <3b369e1a49b354852f361b103999673e4f7906a9.camel@mailbox.org>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3b369e1a49b354852f361b103999673e4f7906a9.camel@mailbox.org>
X-ClientProxiedBy: MW4P220CA0014.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::19) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB7511:EE_
X-MS-Office365-Filtering-Correlation-Id: c5253344-efa4-44bc-0c79-08dd555f9956
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZjdocnY2UGZ3TUhaa3ZmQll5SFF4TzB5YlZKR011MW5hMjRYSU14S282NGxR?=
 =?utf-8?B?NmV1S1d0amlPM202VlZmc1o4ZXdWTGVnSVpGbXN1Ukx1Y29UazgrUVBvUkhs?=
 =?utf-8?B?bzlOdS9JV29XZlhEaUFqdzBCRXB4OCtHeE9XYkR5NUhpTXhxMTNtZnN2RE0z?=
 =?utf-8?B?cFNmbS90MEpPZXVjYUZFWjlrWjk3a1p2SExOS3RFRHFyYXhNclNjdlZrVTI0?=
 =?utf-8?B?eXJvT3dwa21kTVRoblVwK2x5NFFoSnQ3SHo5c1JBNEtxcVNQMytFWmY0TTVs?=
 =?utf-8?B?MUZkbDlvOVk0Yno4UzlURHFKZjJoeWZQZ2lyRzBINWNkTStkSURIdkdEVlRT?=
 =?utf-8?B?UzBOcXhVM3IzRXVRYVlpUGRubFNQME5relpQcHNYNHRFRzg2a0ViRlZwL0pD?=
 =?utf-8?B?SzNQSnlLeUY2NGJ5TDUxa1p4OGdTWDNwRW1WMUZaYVpnT1MyV2I4S2NlMWts?=
 =?utf-8?B?UDhueWYvWFljUDZ4MWM4cVZsZ2tWc05kemtQWmd3YmNzTnduNkJSSTFmV2FK?=
 =?utf-8?B?VUR6eG50UHdFNGhpQzlhRWwyWFJhTk1Ccklyakc1Rll0ZFRKOVljSHgrSzdX?=
 =?utf-8?B?M2EwRVZHdE9lQ1lKU3NFZzI2aHl4amlmeFM2emFvaVFPTUcvZHU3T1F3SWxl?=
 =?utf-8?B?UWpLVEJCSVZaYlkwMnpRRU11cC81VEIzSnlDVmsvVXhhZk10YVU3L2hWbFlu?=
 =?utf-8?B?Y3pNb0JIeWcrU3ZZZ2Q2ZUx0NldrWVJKall4WHFndDhQSGY0d2libDFDSDI5?=
 =?utf-8?B?WVF3TGJRZDB4bFpGV0xtQ3lkNHFoN21WcXQwcEpMMDZ4b25SbkJnTk1ncXVi?=
 =?utf-8?B?azNPWG1DbTI3Rm14bXludW1Vd2xkREs5WXczbWxtdG93SWs4Y05hMHJVY2dq?=
 =?utf-8?B?RktsMzJoZUttVDk1dFpGZXA4bkx5ZnNoSGZtLzNpWVpocGxyZ2c5Z2ZNM0hn?=
 =?utf-8?B?OTkzL1hYT0lOdTNMdzdxZDVnbXgvWGJpdVROY21OUHBhVGROZnlHSnB0cnNQ?=
 =?utf-8?B?enVIQVBUWnNSSDk3czRTUUtzVjRMazJ1NU1KWG56dzRJU0loNC95VjZaaTh0?=
 =?utf-8?B?d3Z3S1k4SFpQbFJEYTVoNnFNekVVMWZqOEhqUm1PSm9kUENmL1dBVlpTTTBl?=
 =?utf-8?B?OERhdWJycmhkcEF0ZlZCN1FvbnRIcm9QZjZ6ZTVkTE9FTElFWE44NnRlTTJy?=
 =?utf-8?B?SExhMndWT1ZqVGhlSExDdlNBL0haeVJuNDV6eUNidVJQMzdoL0hrTmhvRHFw?=
 =?utf-8?B?bFd2TW1YeERmTzRFWkRrWUpQbFpXcTlaZ1NaeVBWTk1meFpuSjdUZEdRMjEr?=
 =?utf-8?B?Sk95T3djRXptTEc4Q2YzcjlrSTFqL1F2SWdNTGlvbTdzUjhTbXR1c0ZZNHRC?=
 =?utf-8?B?UGw2cWJ6NEVoMHpnYWgrNHdYdkRScHBQMzQyVFRUWVV2YzYxNXRmZE0rdlNZ?=
 =?utf-8?B?ZW1WZlMvb1AwY2tVMHNtTlJaQmJwRGNFejR6ZHhkdmdBMTNhQ2NON3N2dnlQ?=
 =?utf-8?B?amZNbWVQclMwRGNwdmlDQWo3eHRaWXQyK2htMEowYzFrWHAwT29mTVZ4V0lO?=
 =?utf-8?B?YlZmM01IbWEvL3l6SUtzUEtOWWdjdk5ZNjN6NWdLOWxyQWJuWThzWjBBT21X?=
 =?utf-8?B?ajJuampWVEV3YXZjUk1JZEo0UzVaMGNieDZ4SkkrRkRUMEhKcmJDVWo0clk0?=
 =?utf-8?B?OXN6Wk1yS05sRmEwYmpEck4yVWMrT3pMTFByWXZGTkFNdklya0djSGE4Z3Bw?=
 =?utf-8?B?aERIR0dxRXQySUxMYmE5cjlBR2tmcnl0YlN0WmYxb3dkNkM0OUd1WG85Q1N3?=
 =?utf-8?B?cmYzcC9CQzE4N2xoM29Sdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?amNFOGR4R3NlR1hhNTVtK3RuYVlmWFRxbmFHdzdabGtTelpPenBLZGVuSXps?=
 =?utf-8?B?Y1BuWGlpMURDWTBNRDhXSHRaZmFFNmRtNkFscDF5elNEVGhaT2JFdlk3WEUy?=
 =?utf-8?B?K1JwbjN4Tk9CN2NOWDNVUllVaWF0MVpjVnliWlJRT3V2WTMyQXRmK3ZwMVA4?=
 =?utf-8?B?aEhCdDFLZVdpS0ZCa05GK0xQZG5jQk4xVFphRHB6WHdaSGdLMEdSQmpiYTN6?=
 =?utf-8?B?QU91SFJkN1Arc1ZaVEdXditMNTBjeElsNldqd3RsaHhKcXVHd2haN3kwVWdO?=
 =?utf-8?B?cS9teVhiZ1VQM1A1QjRLS0xYS0tOWHJKR0FPd2VYMmpwM3BlZ052S0RTS3JY?=
 =?utf-8?B?cDFyejJ6cmljV0NwcnJYUDhTNkc5SFc1emo3V1Z0U1RYcUg4cEVTWk4wL2xK?=
 =?utf-8?B?VVVPWVBJUGM4b3RpejRiVDB6UzVjMHNzSlV0ZHR3b01GOThVbDU3MkZmWGwr?=
 =?utf-8?B?bW5nWW04Q1d0RTVpeUJsWTR2WEMvc1pCa2ZHNktZM0lVdXJ4UklzT1NvL2V6?=
 =?utf-8?B?ay9pdGUyWTl6RHlwazNTeWtoakNvcHFCWnk2T3d2ZDIwMEg4c1RxR2wwSHJw?=
 =?utf-8?B?TWdOQ0hiNkpZUjMrWjNCdjZHVjJoaGtpTTR2a0ZCbTBlRmtoRDVHU01DOUho?=
 =?utf-8?B?eGdRQ1FlSXFpVmdSOHNhdkdGdFAzZ0dGNTNOZ3lmNk9MK0s2SHhBYURJTlda?=
 =?utf-8?B?ZTJmRDNCRFprU2VYWll1OS96NHR6c0pQL1J0ak9mRlNXUDkwMDhnS1dyazBj?=
 =?utf-8?B?Uk0zeFE0UTdBcGQ3MjBydllhb09FOHRtNFUzaitDR2hxWnovVmJYVVBlYUdX?=
 =?utf-8?B?M0JFZXhXaUhKVGxQSkViSlZHc1dLcTMzUHdRTFB6WHdRS1BJQUUyTm9QMHc5?=
 =?utf-8?B?NkJKK3lkaHRBbmVZYnFJaXk5bHBYQVhWaVpKRmJiR0hYc2RUVStJem9FY2VG?=
 =?utf-8?B?L2Uvc1FvZDhMNS93dDVnS3NwTVVOUm9MMThlTXRUVEVEZC83anpwREdSMFhq?=
 =?utf-8?B?QWFFYVZIaGd4am5Iclh0SHlFdHUvV0F0OHZDR0FUMEI3czUvSEZZQm90aVlU?=
 =?utf-8?B?R1ZMRjhDNm5PZGJMYys1YjA0T24xUWltTTM4U2pxR1NSRFM1dUF0cUNaUFRD?=
 =?utf-8?B?ckhFZzUvWnIwY2lTbG9uMnlWaFZxektlMldrQ1c1QXJ1V1ZtWUZpZTZqWnZu?=
 =?utf-8?B?V1ZCQWdEOTV5T1lYd1VUUHNYeHo0T1l4bFNqV2FOVTBwSVhMc3Mwa2wzT2Zi?=
 =?utf-8?B?bys2clNGcG1JRTFqZEpTRDkxZ01ZWVNwd1QxQWlnbGErbngrbTBWT3dPLzdj?=
 =?utf-8?B?bFE3MEsxbjR6cmMvTGFqa1FkemhXbmdhWXNkMEdTdTkzcHIyM3ZKRytHd05T?=
 =?utf-8?B?d1NxSzdWaTd2MThLdU45clQ1RklUbzljZTNDcWJGOEFNaTBOWGd4NXpCT0gz?=
 =?utf-8?B?N3dwU1ovOXVwS3R0TGN5dTBGUWk4bTNnWXBERDdqVFlFUHdsSy9zYnV1Qkp0?=
 =?utf-8?B?R0grc1lHYXpHa0xBVFFLb1NXM3lDeG1tTmtQajFWcitxaElZd1ZMRFQ4U1Zm?=
 =?utf-8?B?WVhQMURGK0JlczVJOGxPd2dvZkZPRlVxME15Ym8xUTFVNitxb1d2eldFdXdR?=
 =?utf-8?B?NGFXSHRZMUlTNStnMVJ0VDk3djFMaGdNMGlSemxzUk5CTUZranlWeTQ1TE4y?=
 =?utf-8?B?YXd6RXhzUy93MU9vOWVHUmJzeVlaaW4rcFh4L2p1c05FYldNbEp2OFFwWmMr?=
 =?utf-8?B?NXhaZ3lGUjd2OEFhdmN2WC9SZzl0MzNFdGtKZ1AraXp4bFBTajBoSlFBVHNy?=
 =?utf-8?B?b0lrY0hoaDVTQk4xTkZNMjZmL0xKWGpqQlE1YnYyTjBVV3lvMFJUamhCdEg0?=
 =?utf-8?B?bldDUnR3ejY0MGFzMlROQ0RkUUU1MmhlQjBOZ3JFYXUyb25mancrb091aHl4?=
 =?utf-8?B?eXUyTnNWV2RPWklvS3NsTzJsSktzUDRWM0ZHT2E4UzBZWHVMdndDY1RhcFJp?=
 =?utf-8?B?TkN1U0NTOHNsbTM2UE9sbFdoUk92bkk0bDFOY1V0UFQzaDRvam5JbGI0a3VM?=
 =?utf-8?B?QkZmdG9tcXhxS2syMHNXMFlkS1RTQUpnbHh4Ny9OM1c4UUNFY2FCWHpTR3ov?=
 =?utf-8?B?bHorbUYwOVFITDErQ1lZUk9yY2RzeGNTN3dTa0VCRk5VSjM3OWtIWTIvYzhT?=
 =?utf-8?B?U1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c5253344-efa4-44bc-0c79-08dd555f9956
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 05:45:24.0587 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EJPxAfHdGMc3NbqhLaG5F//pKsJ845J5SKtECGuOLG8qdZpTZm0X1Tp4g7pHPqXMCca+CrpOufdPbTMLz8JXKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7511
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

On Mon, Feb 24, 2025 at 10:52:56AM +0100, Philipp Stanner wrote:
> Hello,
> 
> subject line: please write "drm/sched" instead of "drm/scheduler". It
> has become the norm
> 
> On Fri, 2025-02-21 at 14:27 +0800, qianyi liu wrote:
> > Problem: If prev(last_scheduled) was already signaled I encountred a
> 
> prev(last_scheduled) almost reads like a function call. Maybe write
> "prev / last_scheduled"?
> 
> > memory leak in drm_sched_entity_fini. This is because the
> > prev(last_scheduled) fence is not free properly.
> 
> s/free/freed
> 
> > 
> > Fix: Balance the prev(last_scheduled) fence refcnt when
> > dma_fence_add_callback failed.
> > 
> > Signed-off-by: qianyi liu <liuqianyi125@gmail.com>
> > ---
> >  drivers/gpu/drm/scheduler/sched_entity.c | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/scheduler/sched_entity.c
> > b/drivers/gpu/drm/scheduler/sched_entity.c
> > index 69bcf0e99d57..1c0c14bcf726 100644
> > --- a/drivers/gpu/drm/scheduler/sched_entity.c
> > +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> > @@ -259,9 +259,12 @@ static void drm_sched_entity_kill(struct
> > drm_sched_entity *entity)
> >  		struct drm_sched_fence *s_fence = job->s_fence;
> >  
> >  		dma_fence_get(&s_fence->finished);
> > -		if (!prev || dma_fence_add_callback(prev, &job-
> > >finish_cb,
> > -					  
> > drm_sched_entity_kill_jobs_cb))
> > +		if (!prev ||
> > +		    dma_fence_add_callback(prev, &job->finish_cb,
> > +					  
> > drm_sched_entity_kill_jobs_cb)) {
> > +			dma_fence_put(prev);
> 
> But now the fence will also be put when prev == NULL. Is that

dma_fence_put(NULL) is a NOP [1].

[1] https://elixir.bootlin.com/linux/v6.13.4/source/include/linux/dma-fence.h#L290

> intentional? It doesn't seem correct to me from looking at the commit
> message, which states "Balance […] refcnt when dma_fence_add_callback
> failed"
> 
> It didn't get clear to me immediately which dma_fence_get() your new
> dma_fence_put() balances. Can you ellaborate on that or maybe write a
> comment?


drm_sched_entity_kill_jobs_cb(prev, ...)	-  Calls put 'prev'

drm_sched_entity_kill_jobs_cb(NULL, ...)	- Does not.

> 
> But also be handy of could share the kmemleak trace.
>

Agree kmemleak trace would good, include in commit message, but the
patch looks correct to me.

I also think the commit message need a bit of work as Phillip suggests.

Matt 

> 
> Thanks
> P.
> 
> >  			drm_sched_entity_kill_jobs_cb(NULL, &job-
> > >finish_cb);
> > +		}
> >  
> >  		prev = &s_fence->finished;
> >  	}
> 
