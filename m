Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EN98AoeqcWnYLAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 05:41:43 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AECA461C2D
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 05:41:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 672BB10E04B;
	Thu, 22 Jan 2026 04:41:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YuKs5uDt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88EFE10E04B;
 Thu, 22 Jan 2026 04:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769056896; x=1800592896;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3q5NtXUC2CtGGJKB8/VfhV4Vy/c7MirKyruc1qjqDKA=;
 b=YuKs5uDtdkfoR6bTWrEA5ZHfdKJfm3osn4h8b/eqSHa79Qpk+LA0NhhO
 qMBzBX0WZ7Oc/HYRgyICEA0FzqnM2QEJGAyeyk5FR3mNmvNKhvHq6MtuA
 EVbTFiTbnhHLlG424Bt7yxs4VivpM1L56v4CkXYYy83EHAMM/kyKl8HWl
 UwsJUC1V+f8zrNDidJPXR21pH9y9h/Dgudvcdy96cQ6el39KG6JghPXSf
 eJTjO3OKk/q5SjfUJa1l4WMuklID31/Nvts+lEup4JJU5+6e/tiM28F8d
 BGQXVr4mMkarx0mP5mIk3xQDOb8bVM81WEnSPU23Kq35KYoZr7tfHAeR1 w==;
X-CSE-ConnectionGUID: eSFhYsnIRXG5LGpAD+P0CQ==
X-CSE-MsgGUID: +R6fdmQMSICM68NV6a/gSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="81404575"
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; d="scan'208";a="81404575"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 20:41:33 -0800
X-CSE-ConnectionGUID: F8rhy3PyRZmWgZdlSbVtXQ==
X-CSE-MsgGUID: v9XeUzDxSkGOpYCDOaMD8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; d="scan'208";a="206445614"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 20:41:32 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 21 Jan 2026 20:41:32 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 21 Jan 2026 20:41:32 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.12) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 21 Jan 2026 20:41:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lmzEoxcsb98PBZgOpnTa83IMCn35eFQk6+faFd0lOB7XzkePQTxblhYmsT3SI9Zt2rSYArn0yHePMUMdLa6cgJLxhLLV5ZfQ1+OhLfi4QWLZO3FDewPyV52SfsRBkiGZt1sbGboZ7lsgQ5GubtgiV535JV/65KQfrMb5fSO5kI18AtMKR1NTQgFRuOq+fEahlxNSLMFAZ+Fj4sSdWbhgeoBrb6XS0/3DtQy7L0Oh+7tkZpEOwiKUuldqP2Vv2BVTt+3vwfdzwKKa4FIUqg279Ukuq4hSHVzYnscGKNW0N7FRnyi71rDkqYN1n/QYWYZSDGaF2oPPIJNsBdOZJG2U+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HkyAsZuZCp491Ltv298YjYg4MmEBBuCE6sT0fWhoQ+8=;
 b=niY8f8FgmD0e1JTdDzHnrOaCY0DsGB7DO5NMvA6hFtuYnbxU7R81LzkbgqyN65nhUO5/KTxoBs9JoMoVTyVvknNDM/AprEF0x0gKaUAE80shZBovdDpe1pPpk6YCm1i06bRxl4NgYfbK6FGO79+iL5a+PBcoI06BuALypQCftZMUQ/W05cae5Q3YZ1lCo5y9fBKvci2SiiMu9x/9pVzeBPdVGd8p/2vcfBAVIzpMNBRQ8c8hcspCJy8vIigMjv5HRM0tFkIu82hkHLaPkpWW3m9S2uuP9AjLPmoCTvSh85GjsvF3Th9k3Lf/qwOlrCia8GJJ16dAv87oQNYzcCew1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by MN6PR11MB8102.namprd11.prod.outlook.com (2603:10b6:208:46d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Thu, 22 Jan
 2026 04:41:28 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%6]) with mapi id 15.20.9542.009; Thu, 22 Jan 2026
 04:41:27 +0000
Message-ID: <4a1e6ff2-fa37-440c-aaae-9ec0eeb1befe@intel.com>
Date: Thu, 22 Jan 2026 10:11:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/5] drm/atomic: Allocate atomic_state at the beginning
 of atomic_ioctl
To: Louis Chauvet <louis.chauvet@bootlin.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 <xaver.hugl@kde.org>, <harry.wentland@amd.com>, <uma.shankar@intel.com>
CC: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>
References: <20260106-atomic-v7-0-d51d9a351684@intel.com>
 <20260106-atomic-v7-3-d51d9a351684@intel.com>
 <52a1c55b-43fe-46b6-9846-21de0f263542@bootlin.com>
Content-Language: en-US
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
In-Reply-To: <52a1c55b-43fe-46b6-9846-21de0f263542@bootlin.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0013.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:177::17) To IA0PR11MB7307.namprd11.prod.outlook.com
 (2603:10b6:208:437::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7307:EE_|MN6PR11MB8102:EE_
X-MS-Office365-Filtering-Correlation-Id: 72116079-3a6e-4ebb-d3e8-08de59708167
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VzdOaGhpa3M3Z3ExNkRZUGpKSCtodVM0VmNkYVFIM3hoMXMyNmptYWZTRFRE?=
 =?utf-8?B?Y3VmVnoyN1lpdUEzcW80SUdvNWxOUXUyYmREQ3MzOHNyS3VCOW5LL1o2SmpF?=
 =?utf-8?B?d1B1NFBJQy9wWHNWbnZpaXJoNGZKRWtObUgrNDM3ai9QN3pqVVYrdFBFY0pm?=
 =?utf-8?B?NENjcStlVHR0RGRLYW9iY2JVNmtxUzVqbThqMENWZ0NiVkJiSEs0VkxJN2hH?=
 =?utf-8?B?OHkweUhQeUhNdmJQRVZGMm0rS1Y4YnY0bmxyS3hPZTJMTmRVUHpGUE9mWGwr?=
 =?utf-8?B?VDlia1JKci9UblpCdDhWaHl6OVVtOWt6bTBzYlNOcHFnT003L3BYL2xKYlhn?=
 =?utf-8?B?UjhiemxnUWJyMU5IOFArRlgyZ0xaaXlpVEZ1UGVYU1EyQW5LS0Rhc1JNRnhV?=
 =?utf-8?B?UVlTV2p2NFk2TVkvWkF5RTEzTDRua0h2eitUNGdOK1crUVd2SzcwZlkweURH?=
 =?utf-8?B?T1g3cFpNcDVDajNua1NoOW0rdWNZcldUUytCUHNnVkxMeUpsbktNbjBJR3da?=
 =?utf-8?B?NmVXbFBHeXlFT3pJcE1sVkFscitTcG9ZRUNOeU0ycEppOW9rRndNd0F3Tkxx?=
 =?utf-8?B?TWsyZWFVY2s4VVVTa1MyOFNDSkUxd3BoSU9qTEZoWkVZVnpGV2hYMFBqQjlI?=
 =?utf-8?B?c2t2VStqMkczWFA0TGlhbW40c0RPa01iVWJUZDZ3c3ZiUlVGZ3Q3OWNvM1Jk?=
 =?utf-8?B?K0dybTRQU2VlaTAxU01xSmxLeW9Hei9aOVZOSGtMV2xjRlhkOVVRZXJhU0FL?=
 =?utf-8?B?bDdmbGNFSzhnUStRTnRUdVlpZjVYTmd6bW1IaFhvY2kxNHpZTlZpcXBFNGlZ?=
 =?utf-8?B?U0FDMzFMTEtDeDVZVENYU1NSR3RlcW9qbFlwMTZGT2Z0S1BVczRhcVBGTVJp?=
 =?utf-8?B?NUZ6ZkV6ZTZCaHVFeHQ0WHloMkhHUkc3c3NYamtuN1FUU1BUNHdZbDIwanJM?=
 =?utf-8?B?MUVHa1N0ZnVvL2cvYzNDTmplbC9MT0p3T3FkRHhoa1ZVYTR1Z3ZQZlFqQkZv?=
 =?utf-8?B?cXJiZkZ0Y0VhMURVemtpc1hNMHoxdkpxekx0c2FxOW5ENTl0cFNqd1dpV2hn?=
 =?utf-8?B?aXlVNjBib09YcXBvWGRCaEtzV1AvbnNMYjVvSjVzb3N2NXZBbG1EOE1lOWFu?=
 =?utf-8?B?RmU3WmVXVkc5QmNPM05zQnU2aW52bVdGY29UcmthVHZEbUJub01qOVZyV0JH?=
 =?utf-8?B?N3FITnNSK0FsVDdjY0x2dGw5OXBvSHRBSFNXWUluZ3c5ekpMSlV2NmRMYjA5?=
 =?utf-8?B?R2NmckE3K0dTZUhjemJUbWl4aFFsd01SeGNXdUxtYnRuS1ZROE1obFpjMDZB?=
 =?utf-8?B?eU5QenR0Z3hKQXpteEZpRHZDazlHZy8yb3BtbXJrUUc4SXhyK3hnK3A4d2lh?=
 =?utf-8?B?L0RRWUR1THNQLzVFZU93d09VOXozSmEyZkFOcUlYdjYxbFBoYVFnWU81amYz?=
 =?utf-8?B?WEN4c00rQXFLcXVmYjZLbWdSVTNsdXdHcHRHZlJFcWc5b0hGWmxXdFdXZzl6?=
 =?utf-8?B?UUhkeXc0SGdZS1VhMTRmaE5hN05EZk9VdlZZRVNaZGRxR3lVUmQ3VDVRckxj?=
 =?utf-8?B?KzJvZFRra3U5dVVIaVVreVJxSStqSExzYmJITGY5aTBXVS9EcWZjdmUrUFFF?=
 =?utf-8?B?V3BCbE5XOFJNQkFsZ2tZZndHRUdRRE4veFk1Y2FzTEF5Q3JLTTNxdFJ5dFpK?=
 =?utf-8?B?Qldnek8zT1d6Y1VSTXZ5NmdwU1d4VWMvejlacVBlbUNBMjJqVTZ2clc5ZTUr?=
 =?utf-8?B?SEZKZC9HTFVIbFZxckNsVEJDOWtmWm5CYlVHbDVZd3NBdXdJam9lT3J4c0cx?=
 =?utf-8?B?KytwMmlpS1Z5MWNRT3pvZHd4eDVsQVlIUTVpbis5NEZ6UzhRU0ZncVI2T3RR?=
 =?utf-8?B?Y211VWdDU1E3Y0Mzc2MwZkxSblZJL1J1OWMzRDNFVHRVOVdtb005dlRDTGRz?=
 =?utf-8?B?d3kweS91MExocjQydG96djV2bW5tNEJhMWp4WWt4ZVJyanUyeVljeWRCb0Q3?=
 =?utf-8?B?V0V1Q0FJbExuTHlBdk9UM3UxTXVmTjRTeUxCcW1ZVVNXYkprL3JLaU5LcWor?=
 =?utf-8?B?dG80eEtFd2VZWFVueUtYREpkT09hMHhPc1A4d1BaWm9vTkFaUzRxZTlnSEM1?=
 =?utf-8?B?Ui9YemFXcEpqUXVGNmFPSi9LQmtZSG1YWVgzSFhYb0xqL3VXLzF3OUhsRVhi?=
 =?utf-8?B?ZkE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NEM2RU9HK2hTOFlSSVN3UUppSnlxRFdrZCtScHB0NTFlQVZFVjVSYTlrWEIz?=
 =?utf-8?B?UGM4NTNkRE5MNGJMKzErZ2dJMnJQa2lFazlWNEtCbklmOUxhZFFvRExxUVgv?=
 =?utf-8?B?MW1aU29JSDBnNUNUWEtuYUpDQUNmSGNMNFNyakFVN2JJSU9pT20wK3NMa1dN?=
 =?utf-8?B?QW5VcU1lWWVSQjdzc2oxUjdkMndoYnh4YUdjQm95NXdGUk12cnBXVnpUV3lu?=
 =?utf-8?B?dDdvMlJibGxHdVBnK01oMkpDVFVURTBzaElqTWdJU2RaVU9VZ1F6Wk9uVnN0?=
 =?utf-8?B?UzNvU2o2TmlJUnlHeENKWlBITWttdnFyRWwyY05qaG9BMGl2OG40bnYxNlJD?=
 =?utf-8?B?eFNKNDhJcWxnK2ZEUklwMTNBM2gxUWRHOVBlZmJjajdjUXhrOU5ETWJkaUE2?=
 =?utf-8?B?UGF3dWZPL21XaVlNV285OVVySkVBU3hnTUJQVTEwR1dQUnVvVTBzRVIzVWlI?=
 =?utf-8?B?MmxtVkxLZHBRelVoS0daOTFKaVBZeDE1bkFQK1hxTlJ3UWtIWWZSQlNKMGNK?=
 =?utf-8?B?N3hGeEl5cjMzYU0vUHdiQzBKakJLbzBWeXRGMXhkZm55VWpzQ1NmL0tRbFcy?=
 =?utf-8?B?RGRzQk9IZE53Y2NsVkFEY0ZLUHJMUktSZ2RjMW1COEtTdGQ4dFgvdXVnbzcr?=
 =?utf-8?B?TUZKb2t2d3BrL2wxeWorZEFFUGE1M0Mzdk5MQWw5ZXpJT3V5UHFGMDYrbnFl?=
 =?utf-8?B?L1RFWHJrdnk3VUE3cXFOTXhqNllkYWRXRStOc0pBTjRHV0ZVOTRwdlVxMVNr?=
 =?utf-8?B?UkVRYXpBNzMvUzgzdXY2aWg2VVdjc3VScGIwVUdPZkhyVHNnSnlldWtKeTlj?=
 =?utf-8?B?RVVlVkN6ZWlEMFl5ai81VTNkUUV1eHpaVytUUXVEWENNMWVtVjNoZlEycEVn?=
 =?utf-8?B?b0hvYUEwK1M1ZDQ5dGlDelVjbU1UWmppRXg5NnNienlOWTNZbkI4RHpENU44?=
 =?utf-8?B?R0pXRTFGUjZ6M0QrWjFmdHZIOVlTZmRFU2k3ekNZTlViVW1UaU0wdGU1bmlv?=
 =?utf-8?B?WkdNelA5QUl3dHN3N0dpU2lmc090bGpzK2lxbFZUVThZMVVSeFFWRmg0YTRv?=
 =?utf-8?B?emdzZ2N1VTh3NzFpN0VPWW9QZ2M4UFJlUXI5V2UwTXhPMGFyMGo0NVlwWXBp?=
 =?utf-8?B?MXFOcXNESG5lYzJRNSt5YmRtYnduTWxHZkJQMkZqRGZlaEFRU2Fxa29Ub2dE?=
 =?utf-8?B?c1Irc05uZ0JmNnpIdFpwYk5RMEM4ZkttVFNKUTBVamhFSUdrM0dQNGlJYWNJ?=
 =?utf-8?B?ZGxJQUM2ZDRyUFJZaENSSldpVVRzQ2xYV0ZBTHZGQVg0aVI0SDBTc0NUalZt?=
 =?utf-8?B?aC9mckZRdUZLM2RiK3hpMzlDRlRiRXJWVDR0eWI1SEJDQXg2RlhkT3kwTlMx?=
 =?utf-8?B?WGNCTU54YThqTEdXRlE2Y0kxaUREMTRnWkprWVpROUJKVVUzVGZTWm9NWUkz?=
 =?utf-8?B?TUliYTRuQTc4TGhKTndkVXZ2NHNhYTRDWE1ZUUNXd1FIZ1lQWVh0ZzR5YjVP?=
 =?utf-8?B?ZzhlTnNwaWNTRzBkRGlHaWZjTG42d1RmZitSQTJlTHNrVzVra05kK3h0c3VY?=
 =?utf-8?B?Q1gzdDY2MFAzTjhjZExBQUUzOGg3MnNQN2RVSk9MKzVCb2l6WmZsTUcxWnRk?=
 =?utf-8?B?eTJDalp5TkVpdHEvMzNHSkFPZGtXUStzOCtnNGg3T0J3OGNrbmVnQi9OWXlj?=
 =?utf-8?B?dURiRGoraVd6eGtoR3BlVmFKTFdRdlhpQWdtVmJWN2I5VFE5M2czQUJFU2ZF?=
 =?utf-8?B?ZTFsUnBRUlJUaFdSZDl1Nml5QWRPd1ZsQ1NDZ2RVTlg2Nnd6amlxSVRueTh3?=
 =?utf-8?B?YklSWEVmMWZoNU0wOEhtdHJMVFZwUCs5Y2R4b04wekJ3VGVraFhpMEdBL0RV?=
 =?utf-8?B?Qit5QndDd2F6ZU5zbHBZTDJOOFpwbHNDNGluaDhTUWFMdk45SXBZMSs3K0R4?=
 =?utf-8?B?VGVyUlBTUWVZMkRoN2lYbFRsNVRFdDA0a2VKRWpJY3RSQWs4NU45V1VMb09z?=
 =?utf-8?B?U2d0UzhBYlZCeXZXbStnWWJRcUNRWTZLclhENDBhNVpPRDFBRHNXaUVnMlZ4?=
 =?utf-8?B?R21zOVlBdisxWisvRW0rREpWSWptcUtZSHN0dUZCUTdaNFA0Nlk0NGx1ZHIw?=
 =?utf-8?B?MVMzU0hrRUNlMjlGcllMenNPYVJwSmFRMUxOQWZRdVc3OTVzWUdZVjhvV3ZR?=
 =?utf-8?B?NkxMVGI3SHR6QjU2ZWZZTVVpaHJ2MEVOTytCRFRPeldoZWtIV3Q1Sm1xQk93?=
 =?utf-8?B?UGhsS0NYK3dWQTZ4MHBnZFFMSGE4bGd1OFhiL1k3RXRLNkpCODhvVXo3T0tV?=
 =?utf-8?B?a1ExR0VROFMwSmZ3bEhMdStFZlUvZ2Mwb09xa0R0VisvNDdXNys0QT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 72116079-3a6e-4ebb-d3e8-08de59708167
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 04:41:27.7116 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UJ+KohPmC8oOdthxZ1KL6YrKB68fGzC3xUdbWFSumkMbBYp600sr46k9F/XwY7rMYinZo6dNBILoVesUREnHxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8102
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[9];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_TO(0.00)[bootlin.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,intel.com,ursulin.net,kde.org,amd.com];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FROM_NEQ_ENVFROM(0.00)[arun.r.murthy@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Queue-Id: AECA461C2D
X-Rspamd-Action: no action

Thanks for the review and sorry I missed to reply back on this!

On 07-01-2026 16:33, Louis Chauvet wrote:
>
>
> On 1/6/26 05:37, Arun R Murthy wrote:
>> Move atomic_state allocation to the beginning of the atomic_ioctl
>> to accommodate drm_mode_atomic_err_code usage for returning error
>> code on failures.
>> As atomic state is required for drm_mode_atomic_err_code to store the
>> error codes.
>>
>> v7: Reframe commit message (Suraj)
>>
>> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
>> ---
>>   drivers/gpu/drm/drm_atomic_uapi.c | 20 +++++++++++---------
>>   1 file changed, 11 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c 
>> b/drivers/gpu/drm/drm_atomic_uapi.c
>> index 
>> 7320db4b8489f10e24ed772094c77e2172951633..02029b5d7832eeaf4a225096a94947344083fc0b 
>> 100644
>> --- a/drivers/gpu/drm/drm_atomic_uapi.c
>> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
>> @@ -1553,13 +1553,21 @@ int drm_mode_atomic_ioctl(struct drm_device 
>> *dev,
>>       struct drm_modeset_acquire_ctx ctx;
>>       struct drm_out_fence_state *fence_state;
>>       int ret = 0;
>> -    unsigned int i, j, num_fences;
>> +    unsigned int i, j, num_fences = 0;
>>       bool async_flip = false;
>>         /* disallow for drivers not supporting atomic: */
>>       if (!drm_core_check_feature(dev, DRIVER_ATOMIC))
>>           return -EOPNOTSUPP;
>>   +    state = drm_atomic_state_alloc(dev);
>> +    if (!state)
>> +        return -ENOMEM;
>
> It seems strange to add num_fences = 0 at the top and then don't use 
> it before the num_fences = 0. Did you forgot to replace return -ENOMEM 
> by goto out?
>
As part of this series in places where we return on error has been 
changed to goto out, cleanup and then return with error code. In cleanup 
we will be completing the fences. Hence setting this num_fences to 0 
initially.
>> +
>> +    drm_modeset_acquire_init(&ctx, DRM_MODESET_ACQUIRE_INTERRUPTIBLE);
>> +    state->acquire_ctx = &ctx;
>> +    state->allow_modeset = !!(arg->flags & 
>> DRM_MODE_ATOMIC_ALLOW_MODESET);
>> +
>>       /* disallow for userspace that has not enabled atomic cap (even
>>        * though this may be a bit overkill, since legacy userspace
>>        * wouldn't know how to call this ioctl)
>> @@ -1598,13 +1606,6 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
>>           return -EINVAL;
>>       }
>>   -    state = drm_atomic_state_alloc(dev);
>> -    if (!state)
>> -        return -ENOMEM;
>> -
>> -    drm_modeset_acquire_init(&ctx, DRM_MODESET_ACQUIRE_INTERRUPTIBLE);
>> -    state->acquire_ctx = &ctx;
>> -    state->allow_modeset = !!(arg->flags & 
>> DRM_MODE_ATOMIC_ALLOW_MODESET);
>>       state->plane_color_pipeline = file_priv->plane_color_pipeline;
>>     retry:
>> @@ -1703,7 +1704,8 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
>>       }
>>     out:
>> -    complete_signaling(dev, state, fence_state, num_fences, !ret);
>> +    if (num_fences)
>> +        complete_signaling(dev, state, fence_state, num_fences, !ret);
>
> Hello Arun,
>
> I am not familiar with this part of DRM, but this num_fences change 
> seems strange and unrelated to this patch.
>
> If this is intentional, I think this change the previous behavior:
>
>     num_fences = 0;
>     for (...) {
>         if (ret)
>             goto out;
>     }
>     ret = prepare_signaling(dev, state, arg, file_priv,
>                 fence_state, &num_fences);
>     out:
>     complete_signaling(dev, state, fence_state, num_fences, !ret);
>
> Without your change:
>
> => no error -> prepare_signaling/complete_signaling are called with 
> num_fences=0
> => error in prepare_signaling -> complete_signaling is called in all 
> cases
> => error in loop = complete_signaling without prepare_signaling (very 
> strange, is it your fix?)
>
> With your change:
>
> => no error -> same
> => error in prepare_signaling -> depends on prepare_signaling, only if 
> num_fences!=0 (a bit strange, but maybe expected)
> => error in loop -> don't call complete_signaling
>
> I don't know if the previous behavior is broken, but if this change is 
> needed, maybe you can extract it in a different patch?
Yes even prior to this change it seems to have some issues and this 
patch/series is not trying to fix that.

In this series before the for loop on error condition instead of exiting 
goto error with cleanup is added for which num_fences is set to 0 in the 
beginning.

Sure will move this change out of this patch.

Thanks and Regards,
Arun R Murthy
-------------------

>
> Thanks,
> Louis Chauvet
>
>
>>       if (ret == -EDEADLK) {
>>           drm_atomic_state_clear(state);
>>
>
