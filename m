Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sEm3HFEYjGnegQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 06:49:05 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 234B31217CB
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 06:49:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E23A10E183;
	Wed, 11 Feb 2026 05:49:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vjde6ZfN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E46010E04D;
 Wed, 11 Feb 2026 05:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770788939; x=1802324939;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1MEki8RWNAdZvvOzwdc0QnRYVnCkXb07Kp2F3yWG3SA=;
 b=Vjde6ZfNkLtM2UuQPDFxrTzNUADN2AD6OFYYFcunhplIYFvySGWNTHS/
 XU8mNQn+BzM3j/zEdUD2u2tAZiZUkLTCLLEzC3L1+h2qsKSzZBGnWtuf2
 aodu1VNlJKQSIT7UUPH7myB3/nJYyC3d64Su1ytqERiIHAcjDhTtnJBHG
 nXuTYcC9nnsjX67ZFsrAXOf/2gKkFvT9gmWkAMDQjJO+iPTID/a8NLV1T
 IyPLaDORB+B4mVpbHQ+/c+pFuvsdb1qNKIyThxMu5iTG2L2EeEqzXm0p4
 Rap93UMuNB62aimTyNkT0IL+Ig69UQHu/AAZ6r9hhUsKmfrHJ/3wyJf9M g==;
X-CSE-ConnectionGUID: 2QST/QUIQV6XmY7FLSpmoA==
X-CSE-MsgGUID: vGjilfz5Q5q86v1sSVpRog==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="89339878"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="89339878"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 21:48:59 -0800
X-CSE-ConnectionGUID: jDFmDSk/TBiDg5hzZ3J3eQ==
X-CSE-MsgGUID: ynAi2WyCR6iy44qGsjBJFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="217102267"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 21:48:59 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 10 Feb 2026 21:48:58 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 10 Feb 2026 21:48:58 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.55) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 10 Feb 2026 21:48:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XOjvhPrUWAcH0uxLMnoREYI3guaEioLPjmoO9pDlUFs5HcENETP+m9PC7QwgOuhk60r7xiQgN5SDEXcj30TaeR9Oi2+uOyU1eAeDLc9iD7zcHA1PRRY3EBZLvo+av1/ED2b1OHeHR5EE3rWSVrqcZSDYCKnFvDY3w5+29heSOonnmca8zi4oD4dH2endUqYzwv3D9aZtskqOrRaaTLKnuhGdP7de79+AcSaz0fmT92nFagKTJ6cGIRoXGFEM32Rwsz7YnxJMlQ7oFbFc9so16nJ8/3u28/kY/J08sXHSbcQiKIrUOIkAZie8LZ4newus6xz9NMyqxaHQyafVrZ1wLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1MEki8RWNAdZvvOzwdc0QnRYVnCkXb07Kp2F3yWG3SA=;
 b=G8iYs38F/CkUX9SE44b8L63xzrffGtGm7RmwvoFjypHAdGjnce/Srz99xbfQLa29RztE40x4f2pfQ2pisarEeeHlFKh1dB3Y8qrnTVkHmdK0Zvfi25Z7FwTDyNlAwFFvdSNuPQT/hQxsXEzJWnzeXpvII0LnnLC/1USt1JV87SDuXGnK9/BsrobZSjnUwt4/9a12GxvKhV/rcefYCwdqN7kscxNWQGDpPsSzO3Ld0EQfMGLOkSwQTRY3MMFibSjppxKvT5OmVxQoY+Nvs5r4HuYPjI4wEoyv6eyUQ7pinB7tIFL1cXkzWtmu0dkPnsqnuHgAlH5FnNZ/2mV2TtRpPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by PH8PR11MB7069.namprd11.prod.outlook.com (2603:10b6:510:217::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.17; Wed, 11 Feb
 2026 05:48:55 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::9d4a:f89:f548:dbc7]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::9d4a:f89:f548:dbc7%6]) with mapi id 15.20.9611.008; Wed, 11 Feb 2026
 05:48:54 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: =?utf-8?B?TWljaGVsIETDpG56ZXI=?= <michel.daenzer@mailbox.org>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, "xaver.hugl@kde.org" <xaver.hugl@kde.org>,
 "andrealmeid@igalia.com" <andrealmeid@igalia.com>, "Kumar, Naveen1"
 <naveen1.kumar@intel.com>, "Syrjala, Ville" <ville.syrjala@intel.com>, Dmitry
 Baryshkov <lumag@kernel.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH RFC v3 0/7] Async Flip in Atomic ioctl corrections
Thread-Topic: [PATCH RFC v3 0/7] Async Flip in Atomic ioctl corrections
Thread-Index: AQHcgIN5UwmDuAHNMUuSYMjH6VvbC7VJl7sAgAAVv7CAAAYDgIAEhRQAgAA1GoCALro9oA==
Date: Wed, 11 Feb 2026 05:48:54 +0000
Message-ID: <IA0PR11MB73070E28F07D2BA29C5D5473BA63A@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20260108-async-v3-0-e7730c3fe9ff@intel.com>
 <342abb15-95e6-4ed6-8b86-a900c0f403a4@mailbox.org>
 <IA0PR11MB730722B84E81A0CC9BF80275BA82A@IA0PR11MB7307.namprd11.prod.outlook.com>
 <d1e6ad38-06bf-4139-966d-312bc728225c@mailbox.org>
 <83e50bd4-de11-4298-bab9-7a5255b0c5ca@intel.com>
 <dd0a089c-6591-4fc3-b14e-5acc1c59cf8e@mailbox.org>
In-Reply-To: <dd0a089c-6591-4fc3-b14e-5acc1c59cf8e@mailbox.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|PH8PR11MB7069:EE_
x-ms-office365-filtering-correlation-id: d1a480b5-6321-4157-48d0-08de69313daa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|38070700021|921020; 
x-microsoft-antispam-message-info: =?utf-8?B?akdBNFpWaEZsZXJKMTlVMFNyR3o1VzJ0aC9QOWtNV1YwaWFUY3dLSDRTV0ZO?=
 =?utf-8?B?YUU5QjA2U25sMUx3RFV4dS9oTVhKWkNYYnorZnNKd3VZb0dyZEhmT3Y5aWxz?=
 =?utf-8?B?MjJCOWVDMU41MGlnbTB3ZHRKbko4M0QxeUJGbFJrdzlackpjanNRV0E0ODVp?=
 =?utf-8?B?YlhaeVcxS25KeGJJSUZReFg4dFEwdlRuUmY2VTc2QitkYTNTK0k0SzgyN0tz?=
 =?utf-8?B?TUUzcUFXMUxmMXdQUlRpRkg3bk9uOEkzZG9obTdBSmxsN25RaUpRMk4yQmJZ?=
 =?utf-8?B?YTJkZWhFR3VjR20yRzgrQURJSlZ3TEg3eTlLd2xiZHhhM3VmaWU0RDFpM09h?=
 =?utf-8?B?SmpCSTZDeDcxakF4bVhOOXdUamc1OHpzd2gvM0pOK0lpbUxqckE2ZDBPc2RL?=
 =?utf-8?B?b2hIdjd2c2FuRDc4N2poWDl3R0RHTzJVR0hWdEhlZnJQOEFwczA5enJvcnhr?=
 =?utf-8?B?QVlqY21yOUV6YXdiN1VJVHFUempHaFdUa3gwTGFKbEVnTjdMNzVhUVdSVXpv?=
 =?utf-8?B?WGFLamdZSVVhbFcrckRFVHljZWVHdnhTZ0hDNThLWFNsT3BDQkFqR3hmdW5V?=
 =?utf-8?B?NkVvdW5xU3BRdXY0YnJlNHNQYzFCdEF0U1VnYU9WZFJYWllWWTNYeVpQblpX?=
 =?utf-8?B?LzJzV2I2ZWdnZzBTUnVha1JtWkoxRCthS0ltSXAxUkcxenhzZVNDQWthL0Jm?=
 =?utf-8?B?RVJFdE9pNGVzVFNoVWp3UDJXUUxhbldxd2FmZEhhSEF6OGNzanFzcG5tMDFD?=
 =?utf-8?B?QW9ILzV6TE1JS3ZTS3dFUWM3M1RqbFRCUkppcURxM3Evczh3ZW9MV3NuM0lR?=
 =?utf-8?B?NlhCS0l2c2I1dUtGZHY5eCtYTzF6SXVUQTJ6UFoxNitYQUhJL09NNmd3M2JE?=
 =?utf-8?B?VS94NjVqaThJSnNVVW50bjRuSUE0djd0T3VjVDYwZ0RKNDdHbnBQT2pSMXEx?=
 =?utf-8?B?WlB3V3VZNjFQM2ZTQXFEaDFBOHJjc3dnZWV4ckE3Z0hBYjVYYWdZaVJOL1Zn?=
 =?utf-8?B?MXVTU2RSQi9UU01wbThGSXlKdy9CcUp5Q282ZUphT01zZE5rZnJHUHZrUmxG?=
 =?utf-8?B?L0wzVUJVcVBjaXAvcGpodWJ6S2czaVlMSngvZk5wMFltNk9IVzJ6dnRQc0xT?=
 =?utf-8?B?V0VYbDhldTY1czN5K0w4RFhPbzBiNmlCWkluNUtqcFpTQ0JMbHNick8rYnlu?=
 =?utf-8?B?enFVdVF2S2xTczFaWDUvUXdXdEVRcXB3SFQ5QjIrazNzYnlVNGMxU3QzdXBG?=
 =?utf-8?B?TnVmS09OVTBzVUNpMHRBbjBBRFgySTNPM1VrcmJZWmFKVnQvUk05OEpQUGxn?=
 =?utf-8?B?UU12aGdyOTNpN200dHIyUkhhZWZ1bUg4MDB0cTJsMVBNOUtKckJwWkxYdjhH?=
 =?utf-8?B?elNsRUFhcmtMN1c2Y1pCNEFGcGhhSk9MYWg3UDZUTnc4VHcxcXRaNDZUb1ZV?=
 =?utf-8?B?YjB4a291Yi91K0RUTWE5ZDF2RTR2YjFCeGhMTjhHVkFzc2txNStZZmt0VHBq?=
 =?utf-8?B?SXNMMDNGam5CMDRxS1c3TnRZSjErdFE3Ym1WSXBpeVhJQWUxUWF1MmdKWkpZ?=
 =?utf-8?B?RGQvZGFjTWVPcVF3aVdqbHBWUklGdWxmQzJrMTJMcEpiLzFKSWFyMGVlamg4?=
 =?utf-8?B?QWVDNnpCTFlyaTcxV2Jyc1Z2QVZ5M2x4YVZSWVlEVWFjVWlHWnVlcFM5MXI0?=
 =?utf-8?B?RU14eDN0dTdGNGVpNjBwNkIwUUtObVhaOGZiSExtdlYrMEwzU3hrVkZwSVNK?=
 =?utf-8?B?K3l4bTlrNGd6T0x0L2MwRUpUU21vUDJ6eEw2aWpaOTBFdHFWT1FOcytTbzJy?=
 =?utf-8?B?RzVIbUtqVC9BbDZ1cVZIZnQ2VjN0bCtlc0JPQm41cWYrVzlrWnA4U3Y0eTho?=
 =?utf-8?B?TGFzbWp0LzRqcnl3WEhobEVoV0ZIUWZ0ekVZNjkyZ3d2Ryt5V1lFNHpMNHUx?=
 =?utf-8?B?d3pTVEc1ek01WXF2eFlGaURDT1BjUFlxQkhlOSs0TkVETzlpT2dxMEVjcEcx?=
 =?utf-8?B?QUhGUkt3L1M3L05VU0dzUGo0WVlZM293dFpuMmZIK2pzZzZmb0gwaDZNM3dk?=
 =?utf-8?B?QTBINSthZG5SeUgxM29XVVNnT3RqbUtkNGlXOS9weHpKNS83WUZUQ01PcHdK?=
 =?utf-8?B?NFUwTWlIVlZTSlNNZ1hXbmM3ZDNzbDlFdXZ5QW8xSGFMK3hCTEtqaHFMQmJ0?=
 =?utf-8?Q?zdAh75QOqnU8RWVyIwVQ8oP3LzAVAZo0jpL1sxajUANL?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700021)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WU5aU2I3NjhvU1QxQmsyQ3pZdSt5YWxGaER4MGRKVDd0K3hNOTM0dzU2Q3E1?=
 =?utf-8?B?TlBtYXRkbmRpbFJLUUFRZmZPQjBVSDVaK2Q0d250cHpUWDhOak5Ia1J3OS92?=
 =?utf-8?B?T2RYdFhEK0V1WUU4aEVyMEkyaE5YODJ2bEtQOGZUcXBCUDBDSVk0YUZ1WHZF?=
 =?utf-8?B?QVNNK1BpT3FGZTB3L2M4bHg5SUVYM1BRSTdKMDRSK0Z0M2s3aEJyS1RKK2ZW?=
 =?utf-8?B?MHloazVrNXM1MEVCMk5rSWY4ZTU3bWlRS0VSV1hEMnJhS29jallyaWQ0Rkhx?=
 =?utf-8?B?cFB2dStCR2hUekNGbWZqaW9CQ05jVFlqSkdHNHh4ZkQwQUZNRVp3T3lDblBr?=
 =?utf-8?B?UXozQWlNZERFSHhLYStpTWRwS1VENE9KSGhZV1Jlbm9TQUdPN3NyS3I4L09V?=
 =?utf-8?B?bWg4ODVPVlhtcWIyOVF1S1plV2U5VGpwRWFDWDdLWjdnN2JIN0s5ejBhSk1X?=
 =?utf-8?B?UVl6WVlGMyt2VThEb0NVWHdPWUU2L2QwRTFQNm40c3h4SWloS2dQYWhwYUFm?=
 =?utf-8?B?b0ZFeEV4WTFOTUJ2UllWRXJVTmQxdVNuYTU2VTJudEM2R2U2dlkyM0FCakJW?=
 =?utf-8?B?R3lpcjFwUHNwV0lmckdQbE0rY00wL2c3NFNWQStnZDdleVRVczBuTUZjUmxz?=
 =?utf-8?B?MVN3bWRkcjN3T1RUTllkYncyYXo4T3A3aEUwU1pIb1VSZEM2VTdEaHl5KzVv?=
 =?utf-8?B?OHdjWEt5ZUFMT2diWURzYTZyWkViZHdjTm9XSmFub1JXZVZWQ1FyVDdVdE9v?=
 =?utf-8?B?bCttOGFvcU81d1Nxc1RoUDhKaXhnSk9NOXhHTzJZK2ExeEZoWGdjVzdac1BE?=
 =?utf-8?B?bng4MDdrQ3FoK1Y0ZDdEazZlbkR0U29VY1g0VkJySjMxUEFocVZJMzk1K3M1?=
 =?utf-8?B?ZnFIb0dhVEM2NGxGdDk4TXFrSFAvbTVSTXVNVWx4Z3pjWTh3WUk5N3F4RWxu?=
 =?utf-8?B?VzJobXhzSXRtUFJsL0ppWWV0c2FlSVptMlBtN1JOcFlkYlhFTG1hNlQvWnBk?=
 =?utf-8?B?Q09GY3Q0bm80SkpkSU9aMTdqQkszd1pEbTRZZ1cwa0R5c3JFSlVvVkN4Ny8w?=
 =?utf-8?B?UiszaUZ5dlZiek1YMFdXZHBOclVBOFNldnJRRHJMWUJtbnBxLzljM1Q1SEcw?=
 =?utf-8?B?ZVRHZDQrZ3FQZmd4eFpRbzRVQTZMRWR0eWRsdEZpcyt0RUM4RDgrTmdISVlo?=
 =?utf-8?B?Vk1VcjZpdzROT29oZERMbnJiUWtla1hBcUhnYzRScW5IenE1aGI1QnE1S09O?=
 =?utf-8?B?a1g5cGJud29NR2pUTEdCT0UxQzZEeDVMZ0dWS1JCSkMydW5MOFNsaW9Pazh4?=
 =?utf-8?B?R1lhaVRubjMvWExpQ21mNkozVStVcDNLK3c4cGM5Vk5tTy9jZ0xHY0VPdDIv?=
 =?utf-8?B?Y09Db055WHB5M2xnMW1WbzJ3UEhTV2NWTE1lQkZBWmxsNGNKM3pZOS8vdkQv?=
 =?utf-8?B?cktjYlBkckVnZFU3c21uY3JPMFZrYk1ucGh5eDdFVEZqRkxadmQyK29LRFVN?=
 =?utf-8?B?S1hxTU53b2MzMUZ5bkQ2b3FaeStFRnJ5SjErd2xHeWFLaG56bm9BbXpSblMy?=
 =?utf-8?B?enVOZXdoazh2aGJFOUFHZ2F1alE2T0dQT25TZHpyMWU5czFmQko0eWRFLzgy?=
 =?utf-8?B?ZDM4ck5JWHJBUmMvTVJLMlhvZG92a2JocE5TQnRIaERNSFg4S08rWE9qdnRY?=
 =?utf-8?B?ZUxjbXBvOWN3aHdjck43akpHQUl2WitEOHZ6UDlUbWZjRDVJelppTmZmZUZ0?=
 =?utf-8?B?aE9wMVNtVmNQRXNXUS9vVFM5U3RzOEZEVlRWQUNMSVZQd3VhMDd5ZWVadkU3?=
 =?utf-8?B?L2FwUDE5RnFHWUcxT0FoRy82VkZiTHlIM1N2M0VjWXZ2UXYyeWRiRytOcW4y?=
 =?utf-8?B?MUpHazdFTzdLeXNKZ05aMElBR2RYQ3BZcVVCYUVnSU9PZStyTzdXMzRrM25L?=
 =?utf-8?B?TXhnam9LYjczbU9OZlpmT2d0Y0g0bEQvRkoxcDFmUksvUjBkSXpjWGFSSEpJ?=
 =?utf-8?B?N0Y4WUN5NTlwc05EeHZXVDArNjhlU3ZYTmkxbm9Sdjc3UDRsRXpZZXlIOUEr?=
 =?utf-8?B?QWF2dWc3OVgwT255SnBYaUVJaDMwaWk3V1p2V0JxN1laQ0NHNjlaQi8yUGN2?=
 =?utf-8?B?WVEvMi9wM1A0WkVuSzM3OHVMNzUwOTh4eTNSQXVRUzNNQ2t3U1J4OUxDZ3Ux?=
 =?utf-8?B?VnhGUEVUMXUzZlJJNmVvVVdjWHF4OTlleVJGTnJlTUgzTHpCUzc0K1plMUdE?=
 =?utf-8?B?ejRQemtJbHB4VUFqZzJNN0JlZUFWelMrT0QxUTZWUHdKWkFXaGxmajVPU1JP?=
 =?utf-8?B?V2RPeVY1cGxEUUE4d2svMDJwSE04Z25uM3ZjQTg4b2RFQXR3RmFFQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1a480b5-6321-4157-48d0-08de69313daa
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2026 05:48:54.1457 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /oM48P8NydAxtiHNO7RjjtwYxQhBzCnckvNmC7iqCG8Q2bcAGekJLgCV4WUO/GtZZ/PVguYfZnrBiIddSPcQXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7069
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
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[mailbox.org,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,intel.com,ursulin.net,kde.org,igalia.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[IA0PR11MB7307.namprd11.prod.outlook.com:mid,mailbox.org:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arun.r.murthy@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 234B31217CB
X-Rspamd-Action: no action

PiBPbiAxLzEyLzI2IDA5OjIzLCBNdXJ0aHksIEFydW4gUiB3cm90ZToNCj4gPiBPbiAwOS0wMS0y
MDI2IDE2OjUyLCBNaWNoZWwgRMOkbnplciB3cm90ZToNCj4gPj4gT24gMS85LzI2IDEyOjA3LCBN
dXJ0aHksIEFydW4gUiB3cm90ZToNCj4gPj4+PiBGcm9tOiBNaWNoZWwgRMOkbnplciA8bWljaGVs
LmRhZW56ZXJAbWFpbGJveC5vcmc+IE9uIDEvOC8yNiAxMDo0MywNCj4gPj4+PiBBcnVuIFIgTXVy
dGh5IHdyb3RlOg0KPiA+Pj4+PiBzdHJ1Y3QgZHJtX2NydGNfc3RhdGUgew0KPiA+Pj4+PiAgICAg
ICAgICAvKioNCj4gPj4+Pj4gICAgICAgICAgICogQGFzeW5jX2ZsaXA6DQo+ID4+Pj4+ICAgICAg
ICAgICAqDQo+ID4+Pj4+ICAgICAgICAgICAqIFRoaXMgaXMgc2V0IHdoZW4gRFJNX01PREVfUEFH
RV9GTElQX0FTWU5DIGlzIHNldCBpbiB0aGUNCj4gbGVnYWN5DQo+ID4+Pj4+ICAgICAgICAgICAq
IFBBR0VfRkxJUCBJT0NUTC4gSXQncyBub3Qgd2lyZWQgdXAgZm9yIHRoZSBhdG9taWMNCj4gPj4+
Pj4gSU9DVEwgaXRzZWxmIHlldC4NCj4gPj4+Pj4gICAgICAgICAgICovDQo+ID4+Pj4+ICAgICAg
ICAgIGJvb2wgYXN5bmNfZmxpcDsNCj4gPj4+Pj4NCj4gPj4+Pj4gSW4gdGhlIGV4aXN0aW5nIGNv
ZGUgdGhlIGZsYWcgYXN5bmNfZmxpcCB3YXMgaW50ZW5kZWQgZm9yIHRoZQ0KPiA+Pj4+PiBsZWdh
Y3kgUEFHRV9GTElQIElPQ1RMLiBCdXQgdGhlIHNhbWUgaXMgYmVpbmcgdXNlZCBmb3IgYXRvbWlj
IElPQ1RMLg0KPiA+Pj4+PiBBcyBwZXIgdGhlIGhhcmR3YXJlIGZlYXR1cmUgaXMgY29uY2VybmVk
LCBhc3luYyBmbGlwIGlzIGEgcGxhbmUNCj4gPj4+Pj4gZmVhdHVyZSBhbmQgaXMgdG8gYmUgdHJl
YXRlZCBwZXIgcGxhbmUgYmFzaXMgYW5kIG5vdCBwZXIgcGlwZSBiYXNpcy4NCj4gPj4+Pj4gRm9y
IGEgZ2l2ZW4gaGFyZHdhcmUgcGlwZSwgYW1vbmcgdGhlIG11bHRpcGxlIGhhcmR3YXJlIHBsYW5l
cywgb25lDQo+ID4+Pj4+IGNhbiBnbyB3aXRoIHN5bmMgZmxpcCBhbmQgb3RoZXIgMi8zIGNhbiBn
byB3aXRoIGFzeW5jIGZsaXAuDQo+ID4+Pj4gRldJVywgdGhpcyBraW5kIG9mIG1peCduJ21hdGNo
IGRvZXNuJ3Qgc2VlbSB1c2VmdWwgd2l0aCBjdXJyZW50DQo+ID4+Pj4gVUFQSSwgc2luY2Ugbm8g
bmV3IGNvbW1pdCBjYW4gYmUgbWFkZSBmb3IgdGhlIGFzeW5jIHBsYW5lKHMpIGJlZm9yZQ0KPiA+
Pj4+IHRoZSBwcmV2aW91cyBjb21taXQgZm9yIHRoZSBzeW5jIHBsYW5lKHMpIGhhcyBjb21wbGV0
ZWQsIHNvIHRoZQ0KPiA+Pj4+IGFzeW5jIHBsYW5lKHMpIGNhbid0IGFjdHVhbGx5IGhhdmUgaGln
aGVyIHVwZGF0ZSByYXRlIHRoYW4gdGhlIHN5bmMgb25lKHMpLg0KPiA+Pj4gVGhhdOKAmXMgcmln
aHQsIHN1Y2ggbWl4IGFuZCBtYXRjaCBmbGlwcyB3aWxsIHN0aWxsIGNvbnN1bWUgdmJsYW5rIHRp
bWUgZm9yDQo+IGZsaXBwaW5nLg0KPiA+PiBEb2VzIGEgcGxhbmUgcHJvcGVydHkgcmVhbGx5IG1h
a2Ugc2Vuc2UgZm9yIHRoaXMgdGhlbj8NCj4gPg0KPiA+IEFzIHBlciB0aGUgaGFyZHdhcmUgdGhp
cyBhc3luYyBmbGlwIGlzIHBlciBwbGFuZSBiYXNpcyBhbmQgbm90IHBlciBjcnRjLg0KPiANCj4g
VGhhdCdzIG5vdCByZWFsbHkgcmVsZXZhbnQuDQo+IA0KPiANCj4gPiBOb3QgdGhhdCBJIGFtIHRy
eWluZyB0byBjbGVhbiB1cCB0aGlzLiBSZWNlbnRseSBBTUQgYWRkZWQgYXN5bmMgc3VwcG9ydCBv
bg0KPiBvdmVybGF5cyBhcyB3ZWxsIGZvciB3aGljaMKgIGZldyBvdGhlciBoYWNrcyB3ZXJlIGFk
ZGVkLiBUaGUgY2hlY2tzIHRoYXQgd2UgZG8NCj4gZm9yIGFzeW5jIGZsaXAgd2VyZSBhbGwgZG9u
ZSBpbiBwbGFjZSBvZiBjb3B5IHRoZSBvYmpzL3Byb3BlcnRpZXMsIGJ1dCBpdCBhY3R1YWxseSBp
cw0KPiBzdXBwb3NlZCB0byBiZSBkb25lIGluIHRoZSBjaGVja19vbmx5KCkgcGFydCBvZiB0aGUg
ZHJtIGNvcmUgY29kZS4gVGhpcyB3YXMNCj4gdGhlIGxpbWl0YXRpb24gd2l0aCB0aGUgZXhpc3Rp
bmcgaW1wbGVtZW50YXRpb24uDQo+IA0KPiBUaG9zZSBpbXBsZW1lbnRhdGlvbiBkZXRhaWxzIGNh
biBiZSBjaGFuZ2VkIHdpdGhvdXQgY2hhbmdpbmcgVUFQSS4NCj4gDQo+IA0KPiA+IEFzIHBlciBo
YXJkd2FyZSB0aGUgYXN5bmMgZmxpcCBpcyBhc3NvY2lhdGVkIHdpdGggdGhlIHBsYW5lLCBoZW5j
ZSBjaGFuZ2luZyBpdA0KPiB0byBhIHBsYW5lIHByb3BlcnR5Lg0KPiANCj4gQSBwbGFuZSBwcm9w
ZXJ0eSB3b3VsZCBvbmx5IHJlYWxseSBiZSBuZWVkZWQgZm9yIG1peGluZyBhc3luYyAmIHN5bmMg
cGxhbmUNCj4gdXBkYXRlcyBpbiBhIHNpbmdsZSBjb21taXQuIFNpbmNlIHRoYXQncyBjdXJyZW50
bHkgbm90IHVzZWZ1bGx5IHBvc3NpYmxlIGR1ZSB0bw0KPiBvdGhlciByZXN0cmljdGlvbnMgb2Yg
dGhlIFVBUEksIHRoZSBEUk1fTU9ERV9QQUdFX0ZMSVBfQVNZTkMgZmxhZyB3aGljaA0KPiBhZmZl
Y3RzIHRoZSBjb21taXQgYXMgYSB3aG9sZSBpcyBmaW5lIGF0IHRoaXMgcG9pbnQuDQo+IA0KU29y
cnkgZm9yIGdldHRpbmcgYmFjayBsYXRlIG9uIHRoaXMsIHRvb2sgc29tZSB0aW1lIHRvIGNvbGxh
Ym9yYXRlIGFsbCB0aGUgZmVlZGJhY2tzLg0KDQpXZSBjYW4gZGVwaWN0IHRoZSBiZWxvdyAzIHNj
ZW5hcmlvcyBiYXNlZCBvbiB0aGUgZGlzY3Vzc2lvbnMgc28gZmFyLg0KMS4gS01EIGNhbiBhbGxv
dyBhIG1peCBvZiBzeW5jIGFuZCBhc3luYyBvbmx5IGlmIHRoZXJlIGlzIGEgZGlzYWJsZSBwbGFu
ZSByZXEgb24gc3luYyBhbmQgbm8gcGxhbmUgdXBkYXRlIG9uIHN5bmMgZmxpcHMgYWxvbmcgd2l0
aCBhc3luYyBmbGlwcyhtYXliZSBvbiBtdWx0aXBsZSBwbGFuZXMpLiAgS01EIHdpbGwgc2VuZCB0
aGUgZmxpcGRvbmUgYWZ0ZXIgc3luYyBwbGFuZSBkaXNhYmxlIGlzIGRvbmUuIChCYXNpY2FsbHkg
ZmxpcGRvbmUgd2lsbCBzZW5kIGF0IHZibGFuaykNCjIuIFdpdGggbXVsdGlwbGUgcGxhbmUgYXN5
bmMgZmxpcHMsIEtNRCBzZW5kIG9uZSBmbGlwIGRvbmUgYWZ0ZXIgY29tcGxldGlvbiBvZiB0aGUg
bGFzdCBwbGFuZSBhc3luYyBmbGlwLiAoYXN5bmMgZmxhZyBwZXIgcGxhbmUgbWF5IG5vdCBiZSBy
ZXF1aXJlZCBpbiB0aGlzIGNhc2UsIGFzeW5jIGZsYWcgcGVyIGNydGMgaXMgY29uc2lkZXJlZCkN
CjMuIFdpdGggbXVsdGlwbGUgcGxhbmUgYXN5bmMgZmxpcHMsIEtNRCBzZW5kIGZsaXAgZG9uZSBw
ZXIgcGxhbmUgYmFzaXMgdG8gdGhlIHVzZXIuIChhc3luYyBmbGFnIHBlciBwbGFuZSBmcm9tIHVz
ZXIpDQo0LiBXaXRoIHN1cHBvcnRpbmcgYSBtaXggb2Ygc3luYyBhbmQgYXN5bmMgZmxpcHMsIHNo
b3VsZCBLTUQgYWxsb3cgdGhlbSBhbmQgc2VuZCBvbmUgZmxpcGRvbmUgZm9yIGFzeW5jIGZsaXBz
IGFuZCBvbmUgZmxpcGRvbmUgZm9yIHN5bmMgZmxpcHMuDQoNCk91dCBvZiB0aGVzZSBzY2VuYXJp
b3Mgd2UgZmVlbCAxIGFuZCAyIHdvdWxkIGJlIG1vcmUgcmVhbGlzdGljIGFuZCBoZW5jZSB3ZSBo
YXZlIGFkZGVkIHN1cHBvcnQgb2YgdGhlc2UgdHdvIGluIHRoaXMgc2VyaWVzLg0KDQpXZSBkb250
IHNlZSBhbnkgbWFqb3IgdXNlIGNhc2Ugd2l0aCBzY2VuYXJpbyAzIGFuZCA0IGhlbmNlIG5vdCBj
b25zaWRlcmVkIGluIHRoaXMgc2VyaWVzLg0KDQpUaGlzIHNlcmllcyBhbHNvIGluY2x1ZGVzIHRo
ZSBjbGVhbnVwIG9mIGFzeW5jIHBhdGggaW4gdGhlIEtNRC4gRm9yIHRoZSB1c2Vyc3BhY2UgaXQg
c3RpbGwgZG9lc27igJl0IGhhdmUgYW55IGltcGFjdCBidXQgb3BlbnMgYSB3aW5kb3cgYnkgYWRk
aW5nIG5ldyBwbGFuZSBwcm9wZXJ0eSBmb3IgYXN5bmMgZmxpcCB3aGljaCBpcyBub3QgbWFuZGF0
b3J5Lg0KRXZlbiB3aXRoIHRoZSBleGlzdGluZyBEUk1fTU9ERV9QQUdFX0ZMSVBfQVNZTkMgZmxh
ZyBwYXNzZWQgaW4gdGhlIGF0b21pY19pb2N0bCB3aWxsIHN0aWxsIHdvcmsgYXMgZXhwZWN0ZWQu
DQpGZWx0IGl0cyBiZXR0ZXIgdG8gbWFrZSB0aGUgY29ycmVjdGlvbiBvbiBob3cgYSBhc3luYyBm
bGlwIHJlcSBpcyBzZW5kIGZyb20gdGhlIHVzZXIgaW4gYXRvbWljX2lvY3RsIGJ5IGFkZGluZyBu
ZXcgcGxhbmUgcHJvcGVydHkuDQpBZGRpbmcgcGxhbmUgbGV2ZWwgYXN5bmMgZmxhZyBpbiBhdG9t
aWNfcGxhbmVfc3RhdGUgaXMgZG9uZSBzbyBhcyB0byBzdXBwb3J0IHNjZW5hcmlvIDEgbWVudGlv
bmVkIGFib3ZlLg0KDQpUaGFua3MgZm9yIGFsbCB5b3UgZmVlZGJhY2shDQoNClRoYW5rcyBhbmQg
UmVnYXJkcywNCkFydW4gUiBNdXJ0aHkNCi0tLS0tLS0tLS0tLS0tLS0tLS0tDQo=
