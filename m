Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B480AC0B6D
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 14:15:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F98610EBEF;
	Thu, 22 May 2025 12:14:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HkfW8JZ7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A08E810EC13;
 Thu, 22 May 2025 12:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747916096; x=1779452096;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VJdFxrr9sYKfTcoBhNqyTKAXzWNtIEBELyVJr6CDLgs=;
 b=HkfW8JZ7mc0w4deeGxlq0oR1wxgHNoFDBMqhRIgyEfFXggy3Jz3QgYu1
 GPakiozrvFZbC4HceCXBvEzc7lbeId+wb9RheP+DJVsOgVh8DJ6saK4/3
 JF9HESXjt+B1LxmFTkB8LocTxe9CpPVsfTvEZSnC2FIuKHYNYQQ3bPOlh
 NcuqfGzyhkkUMmxKflVaV2EHbMrw4qkwHyADe2aK/kNi3r23XikZJfdQo
 qs6Oec7RdYSnM3k7e/5G6HSoNQGFOarZBUgWdyX567PrQPxZl3GFpi7k8
 8Kc9GMLPu2PCf16/X2jS7uTvL1fx4J0h5Q/Ypi1TZ1fKi1LpLiW3ZdW7O A==;
X-CSE-ConnectionGUID: aXvNWZsMSrGlZ6qkqORqRQ==
X-CSE-MsgGUID: 7eYoNZ3NSPOIrud8Yng1ag==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="50079516"
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; d="scan'208";a="50079516"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 05:14:55 -0700
X-CSE-ConnectionGUID: WY2Y5l3CSHizKDYmrjBeXA==
X-CSE-MsgGUID: nBNeyuPaRwubV4GbVxg6wQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; d="scan'208";a="163840077"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 05:14:54 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 22 May 2025 05:14:54 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 22 May 2025 05:14:54 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 22 May 2025 05:14:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LJF8kh1BBC5mctfQFEKBTuDBX+acM/CccHga96rR6YQAZgruDiTyMPpLLgqj4EHO1KXEsIIB3K8ToP+489PARLJWIReC54FCh9RFpkslENQtGv5zSinvU5bNa4TKhhoLVQMoC2uvbdByTc4LpN3x4TWFRujEAek/lJk1v/T36GtZ52Tj5+520Ujkq9rkm7vYS5seYWQw2VXYTokedctefHS2LuizegdDBZxfJ7qgPYkkQnrkVX/abszbXCWUfF2cn1ltsOQlbgZzk93MfqMGVT9OMP5AwcLhWHiMnJyMagD6CRQK/pX4Gopy2M5Ic5ozaeukrO0d43l2J4joxafhiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VJdFxrr9sYKfTcoBhNqyTKAXzWNtIEBELyVJr6CDLgs=;
 b=d2YDW5igd8P/bOIGrBls/Z/4dmmf9Ca7UWEYdltzlUxKgLjShLP1P2/AY7AT5Hp9HmsY/XhZTowDJWl8f1f1YWZtVAyZzCp9UQEottXkxaAKg5VAYZA14yR2Yr0pCWNsTEcu/8ZgD2Vm91Wq/qMmQ0GzoxM3vp2/qxS4KVVPSZlFTN1Zc723yRzhQT4dnl1qd9gdAeMO4MC1qZtFSJMNWjwYShBghBfxSBnmjO9F1gD22mGZJvbDnYnICoD58nywPqMBmacgn7oexlq+CyuDFbo9/wwrKrU9h8fiaCnecFOdJH/Kej52cz4ruLi76hY8crCz75VmuYtgc4EyUafahQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by DM6PR11MB4516.namprd11.prod.outlook.com (2603:10b6:5:2a5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Thu, 22 May
 2025 12:14:22 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778%3]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 12:14:21 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: "Jadav, Raag" <raag.jadav@intel.com>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?=
 <thomas.hellstrom@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 "Poosa, Karthik" <karthik.poosa@intel.com>, "Abliyev, Reuven"
 <reuven.abliyev@intel.com>, "Weil, Oren jer" <oren.jer.weil@intel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Tomas Winkler
 <tomasw@gmail.com>, Vitaly Lubart <lubvital@gmail.com>
Subject: RE: [PATCH v10 04/10] mtd: intel-dg: register with mtd
Thread-Topic: [PATCH v10 04/10] mtd: intel-dg: register with mtd
Thread-Index: AQHbxaAJPNuSEp81lkKjqc2nDVfgyrPdpcuAgAD0lJA=
Date: Thu, 22 May 2025 12:14:21 +0000
Message-ID: <CY5PR11MB6366FBBB13319D7986105AF7ED99A@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20250515133345.2805031-1-alexander.usyskin@intel.com>
 <20250515133345.2805031-5-alexander.usyskin@intel.com>
 <aC5HjQKRf_4Ewous@black.fi.intel.com>
In-Reply-To: <aC5HjQKRf_4Ewous@black.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|DM6PR11MB4516:EE_
x-ms-office365-filtering-correlation-id: 103d684f-9159-4478-78c8-08dd992a2f2d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?RDdhZUF1QmRHUit0NXJXWmJTYnRQa09NRk1KeGxickpXNFJoNVdwb2NFTGZ5?=
 =?utf-8?B?cTFYTm5ROVBMcmtEdmNIUlh0Q1p2aHVtSHd6bDVSeTA1S3NYRDVSaERXMGtX?=
 =?utf-8?B?dHlIbXdEWXdNRGhidmVkVFN1M1hGVDltZzBtT2dVbFlSb3NyU3VENXZNSUFP?=
 =?utf-8?B?eFQwK01kdTc3QWd1eUdHK3dKNUZQMGhObUxsdWRwR3owQVUyOGIvN0tqUXNj?=
 =?utf-8?B?UzZLMEordjZSR2lMRS9nTUJWL2J6Q3cxUWNJQ3ZaTGIvd0JGZlVXYmthM3dP?=
 =?utf-8?B?Qnk0N2s1Y2VKNUZJYXd5Sjh3NmtsMUJHU3A5a2xESzYwbVhpYTlIRmlydnI1?=
 =?utf-8?B?TVlYN0NwQzdmak4zVjBacUZ2L1g1ZXQ4Q05YSjNjYzlGVU1FaEFvUi9QZmdE?=
 =?utf-8?B?cnNaZndLZG42Y1RiOXhLSlZraStOdEFoSU9za1pFOW12SGkwRmRPVzAxRmJs?=
 =?utf-8?B?bWxEQUYyRnRFYk95bEZ0ejY4TWJBTjQ1clQwYzhJOHc4eGJNZmFiVUxBVEZL?=
 =?utf-8?B?ak9xR0ZzdGtrT2Rha2dkTkM2eTVvMVQrRk1pa0Q1bXJQRkkwWUc4UXY2aEpw?=
 =?utf-8?B?Nk1RMzBDdWw4VDkySjdqSGtsdjBDR0dvSElnNnp5YzJYbVErTFpoVVNtNXZx?=
 =?utf-8?B?bXZzd0J0VzVrUk1JWHBtTkNLVFhMaDJqR29UZkFpL3hRVVBmalM2MmxqbUF2?=
 =?utf-8?B?eEozS2RrNmlNdzJrNStqK0pyTUsvMXE3MG5SSFZIWHpoL3RwbU95cXZubkQ2?=
 =?utf-8?B?ZEpuVm9PalEyRC9mN0oraDV0cnRJcGtuSE9TcCtsMllzMVNRNkdkQ0VmT2JN?=
 =?utf-8?B?WXBxLzhndk0yQWdJOTJKL1BucjJzVzBQbU9iTE84VWxrRWE0VzVaZGNwSWpE?=
 =?utf-8?B?ZWFDaWZPZXAyTGV1WThkeFpucC9ReVRvSmMyVkpyU0pQZ1lvTlllRjd0d3NM?=
 =?utf-8?B?MnQwWlpqUllRMURDVmtpMXV3aHo2UXU1bGRnNVV5eHRaclUwYnpwdW9ncE83?=
 =?utf-8?B?Rm1GdkQ1c1JXa1dnd3BJV29mUG9Gc29hOU0xTy9NaHhuNkUvcmtqMzZtNHpo?=
 =?utf-8?B?eVhtbDcxK0RzYVVPb24vbmZITURPS2kzNDA0RlhUS0dzVUtKUGwwdTBrKzZT?=
 =?utf-8?B?Tzg3WTNiOTdBam1ScmZ5bld1M2U4V1U3dFdwT1JaNk9aMHNHU3dQZ0EyMWtn?=
 =?utf-8?B?TEphRE9TN3NaSzNHNVYzZzRGKzJaeGMyelBmbnZYZUsydnUyQUZoeGhCdEh1?=
 =?utf-8?B?b0RWUEhZME5zbzlpQ2FwcExOalRtSTFUbWxUM1E1bTdNM0UwQm1FRGNFUXNm?=
 =?utf-8?B?eU8va1VENVJ6M0s3MnZGdU01WmVQMXhITTY0L1RYNklQY0hhanl3Wmx3WWpN?=
 =?utf-8?B?UTJMU1lOalFZS2h0WHlXRk1VQWs1TUxXWWZ4TFVVZVhxNjl0ZGlHZncwNWs0?=
 =?utf-8?B?Y1A2bHVVUXJrVmh5L290ZEFsLzlaMjhCZkVWM0xGZ0hzQTVuU2J1UDY3alQ1?=
 =?utf-8?B?bkN1aktyaytDSUV3ZTdLaGdtaXVFdm1vS0pYMGcrOUJrVXVTNDRTUFJ6RVdV?=
 =?utf-8?B?cVRGaUhOYUNjMno2QU5ZYmErWGd6SXRIRHRxL2MrcWtlOWxrMmJCRTBNb0x2?=
 =?utf-8?B?Tm9odFVkajZKMWE0SThFbzJ0NlJGVlM4cVh3MjVadGpZTzlFRHFiRk43M0Ex?=
 =?utf-8?B?TzBobmQrQTNKYmw2NnVEVG1PYmhXWFBVNUkrdGlXMDFlcVJiYXF1RHBwb3By?=
 =?utf-8?B?dktpYTJWZXVqRnBUMU1RQlorenFHTUJxU0VRR2doZkJiNkFvQlQvbnpoYmJs?=
 =?utf-8?B?MUtjTXlUZ0lueWh0ajVWRWNxbkRVNmdRZjVBTEFZWW9veS8yOVpXY2RpbjB4?=
 =?utf-8?B?YStJOTR4YnJUak1iMUdLS0xOWkNLbCsrYkpPTEhSVGZFcyt1Vm5BNmUranB2?=
 =?utf-8?B?MHoxK3pzRXpqdGM1bW01clBjRUxEcnIvTHp3aFRUdG9pVk9nc01tbXUrdlJH?=
 =?utf-8?B?TjQxVHZmUTBnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6366.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZVpORVo1eTl5SnRkSzQ5ZlNveHEwa01WRWNtT3NaSHV5MTJCUnFwbkRORFJw?=
 =?utf-8?B?MHhIcjByVHRqWE9ISFdyaDRFUmg1dmdBZTFsdnkxNzhLVFpzU3FxaVhHU2lR?=
 =?utf-8?B?a002NFpXNW5WUTM0YVZ5UXdRQjFKYUZLZG15d1hLQXFIckxZdnpkS1RSeCtm?=
 =?utf-8?B?TzhxMUo2K1RyZFNBOFRTZjFsOFZNTk94UDNMYjJTaEhjbTNoSVhoNW9wS2Ru?=
 =?utf-8?B?NGwwU0E1am53dUIybFg1N2xwL0dJdnZBa2wrZEtlb0VQMStGOVd4VXUrRHVu?=
 =?utf-8?B?eDJSQkpEOHRveG9LVlhFdHA1aFJWUk5sSHA0K3FPNkllMlI3bThyWnlmV0dE?=
 =?utf-8?B?V2ZndjBIK2ZBK0RBNVNOT0hpVXd2QTEySVlSTXlnZmFrRnhFVFZsV3gzWU5q?=
 =?utf-8?B?Z1dubDE2UE5TRmVmZ0lwVnhTU2dnc2pvd2tERFd4aFVJTm9BU2xTdWhCbnl2?=
 =?utf-8?B?Y3BmZWI5VjRUYVhDM3pvZHZZVkRiV1U3b3JuTSt6Qnpyc3BSSUZRUjhJMFUy?=
 =?utf-8?B?V01yT1NFek9hUGNYVHRYYjI2TGxLTFZTRlZVbXhybFlyZjZCUG4wSG5SU2JY?=
 =?utf-8?B?QWFMbDMrcDlpTHQrS3ZmczVLUDJ0SCtuRFhWYnl0TWQ3TXkwNnhmWFF4S2F2?=
 =?utf-8?B?MVFrekNaZno5YjBnVUlmTzZaQ3ZMb21sWnMzK0lzbm1NV2pWYzBRQkVDQmJE?=
 =?utf-8?B?cjJOM2RxSDlQSy9KOXl1WG9qaXNYdnF3Y3lwaTdrSFFzTDluVW9aOFBIeGJy?=
 =?utf-8?B?ZVEwdzFNSXJtTUpsNDdPTVhYeW02Ujk4SDk1ZGVOSXU1bGJTVUZXanczZ29y?=
 =?utf-8?B?MU5qSFJ6cStPM3gzTllYVGFJREYzdlRCTFVoWkViVmZ1c1ZzektsZHp6anVk?=
 =?utf-8?B?TVdKd2xjUm9ONU9vZHJiUWFNNS9JRHJOaGtBQXNQNlNEWG5ValJuRUVzVXZt?=
 =?utf-8?B?OGJONUdvTklqZEV2NGFHUVpPeDJEVjhRZ2ZGeEJjdVB0V1o3bWFBRmg2VG41?=
 =?utf-8?B?V1NWeHlYbE1TbnkxYjFOQWI3d1lObjAyL09xUloyZzh5RHh0cjJsQlRIeHNi?=
 =?utf-8?B?cUk2U3VOMjZqRkh3b3lvVU96VWFFZ21kcmVkT2NXNzhjcGkyZnhubjduKzdG?=
 =?utf-8?B?cVpiWTFZV2FuYTBKeThVdFFQbmxVb2dBdWl6UFdpYkhxSFBLYXhXZG5ORFJS?=
 =?utf-8?B?TjJpUWdSVG1ETFhKdkFRQ0JRc2xRRVhBQm9WNHJFRExiL2pDWFlPL003RElD?=
 =?utf-8?B?TUtraW9CNFZaL2NvYlV1cTltYWxiei9VSUMzeUNnQWhmdzhhNmRDUVR6L2tR?=
 =?utf-8?B?RVpXRnh3MlZDZkNrcWg5OGFTVUpiNWZIVHpJYTlOZElDNy9NbXhlc3ViYS9k?=
 =?utf-8?B?dGVjVTRVM3NYNHZ2eVhBRy9NM3d2MDNLalkxV3M3ZEhFQWF5VkdEZ1puYm8z?=
 =?utf-8?B?UERDRlBpTzVHeVI4ZThIOHo4V0ZDckJPdTZzRE9pcGxsYXZMaUZsRDVaajBJ?=
 =?utf-8?B?STVkSXQ5U3FIMDhGRkdaZyt3dGQyQTVJWUFIZU5sN25pbTEyOUdxbmxRd2pD?=
 =?utf-8?B?eENjN2hMNzZrMmp1cTlJNEZyWkdvSE9yRzFMQWdiRFNmK1dON1NRckZ6QTB1?=
 =?utf-8?B?by91cDRtaWhycGJ4NkkyUzZVU1JTK3BHRmxwSEtJbERMTnVHM2lwR0dReWJB?=
 =?utf-8?B?Y3RaelVlSWdROHFsQXZGOURTUUhycGpYU3JpdDFKczdoOTNzRUVEbVNKUjl5?=
 =?utf-8?B?NjR2cTgvdHhmbmhnUGdjWUo2TEt1SkN5MDM3ZExnWXRyMHlBcjIxY1QydzVT?=
 =?utf-8?B?eXlnSTVHVjl2d3NQR0k3YmlxbEt1cFozN21ZcVg0WEsxRjFRN3lidDhzYU9m?=
 =?utf-8?B?T1dvOGd4aXZGYU8xZHdNTDBjNkgrR0ZYK09VR0o5eDRXK01SeGJsZ0Y1RE4y?=
 =?utf-8?B?TEFtRVJRdmt4aEhCc09TS1pmUUtTenFQOXhhTWd1Si94eTFwQW1HL3hCL1Ra?=
 =?utf-8?B?NHVZcDFxVm9RZGtiM2s0UEo3ODVMWFp5eGVNV3ZQT09aMUh0UG5OZEZoUlRE?=
 =?utf-8?B?ZW8xVTJCSnJmZjcvTGpGT1BJY0c0bjcvTDEyNzVqbDFqVTVleVZUVy9EcDlR?=
 =?utf-8?Q?s5RjRy/q9VBous7R4UwacUK9q?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 103d684f-9159-4478-78c8-08dd992a2f2d
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2025 12:14:21.5227 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /VkO7Fz9n4e3vxP6SQ6SHuAJTyqa4iX6cF5Rdq5SlTCx8SMohZjUpOcChGidM5pd9BPvN+Sevv9DmSGE+VIz7PXXVv2c+Nam3Hha96Dgo5Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4516
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

PiBTdWJqZWN0OiBSZTogW1BBVENIIHYxMCAwNC8xMF0gbXRkOiBpbnRlbC1kZzogcmVnaXN0ZXIg
d2l0aCBtdGQNCj4gDQo+IE9uIFRodSwgTWF5IDE1LCAyMDI1IGF0IDA0OjMzOjM5UE0gKzAzMDAs
IEFsZXhhbmRlciBVc3lza2luIHdyb3RlOg0KPiA+IFJlZ2lzdGVyIHRoZSBvbi1kaWUgbnZtIGRl
dmljZSB3aXRoIHRoZSBtdGQgc3Vic3lzdGVtLg0KPiA+IFJlZmNvdW50IG52bSBvYmplY3Qgb24g
X2dldCBhbmQgX3B1dCBtdGQgY2FsbGJhY2tzLg0KPiA+IEZvciBlcmFzZSBvcGVyYXRpb24gYWRk
cmVzcyBhbmQgc2l6ZSBzaG91bGQgYmUgNEsgYWxpZ25lZC4NCj4gPiBGb3Igd3JpdGUgb3BlcmF0
aW9uIGFkZHJlc3MgYW5kIHNpemUgaGFzIHRvIGJlIDRieXRlcyBhbGlnbmVkLg0KPiANCj4gLi4u
DQo+IA0KPiA+ICtzdGF0aWMgaW50IGludGVsX2RnX252bV9pbml0X210ZChzdHJ1Y3QgaW50ZWxf
ZGdfbnZtICpudm0sIHN0cnVjdCBkZXZpY2UNCj4gKmRldmljZSwNCj4gPiArCQkJCSB1bnNpZ25l
ZCBpbnQgbnBhcnRzLCBib29sIHdyaXRhYmxlX292ZXJyaWRlKQ0KPiA+ICt7DQo+ID4gKwl1bnNp
Z25lZCBpbnQgaTsNCj4gPiArCXVuc2lnbmVkIGludCBuOw0KPiA+ICsJc3RydWN0IG10ZF9wYXJ0
aXRpb24gKnBhcnRzID0gTlVMTDsNCj4gPiArCWludCByZXQ7DQo+IA0KPiBSZXZlcnNlIHhtYXMg
b3JkZXIgKGFsb25nIHdpdGggYWxsIG90aGVyIHBsYWNlcykuDQpzdXJlDQoNCj4gDQo+ID4gKwlk
ZXZfZGJnKGRldmljZSwgInJlZ2lzdGVyaW5nIHdpdGggbXRkXG4iKTsNCj4gPiArDQo+ID4gKwlu
dm0tPm10ZC5vd25lciA9IFRISVNfTU9EVUxFOw0KPiA+ICsJbnZtLT5tdGQuZGV2LnBhcmVudCA9
IGRldmljZTsNCj4gPiArCW52bS0+bXRkLmZsYWdzID0gTVREX0NBUF9OT1JGTEFTSCB8IE1URF9X
UklURUFCTEU7DQo+IA0KPiBJc24ndCBNVERfQ0FQX05PUkZMQVNIIGFscmVhZHkgd3JpdGFibGU/
DQpZb3UgYXJlIHJpZ2h0LCB3aWxsIGRyb3AgTVREX1dSSVRFQUJMRQ0KPiANCj4gPiArCW52bS0+
bXRkLnR5cGUgPSBNVERfREFUQUZMQVNIOw0KPiA+ICsJbnZtLT5tdGQucHJpdiA9IG52bTsNCj4g
PiArCW52bS0+bXRkLl93cml0ZSA9IGludGVsX2RnX210ZF93cml0ZTsNCj4gPiArCW52bS0+bXRk
Ll9yZWFkID0gaW50ZWxfZGdfbXRkX3JlYWQ7DQo+ID4gKwludm0tPm10ZC5fZXJhc2UgPSBpbnRl
bF9kZ19tdGRfZXJhc2U7DQo+ID4gKwludm0tPm10ZC5fZ2V0X2RldmljZSA9IGludGVsX2RnX210
ZF9nZXRfZGV2aWNlOw0KPiA+ICsJbnZtLT5tdGQuX3B1dF9kZXZpY2UgPSBpbnRlbF9kZ19tdGRf
cHV0X2RldmljZTsNCj4gPiArCW52bS0+bXRkLndyaXRlc2l6ZSA9IFNaXzE7IC8qIDEgYnl0ZSBn
cmFudWxhcml0eSAqLw0KPiA+ICsJbnZtLT5tdGQuZXJhc2VzaXplID0gU1pfNEs7IC8qIDRLIGJ5
dGVzIGdyYW51bGFyaXR5ICovDQo+ID4gKwludm0tPm10ZC5zaXplID0gbnZtLT5zaXplOw0KPiA+
ICsNCj4gPiArCXBhcnRzID0ga2NhbGxvYyhudm0tPm5yZWdpb25zLCBzaXplb2YoKnBhcnRzKSwg
R0ZQX0tFUk5FTCk7DQo+ID4gKwlpZiAoIXBhcnRzKQ0KPiA+ICsJCXJldHVybiAtRU5PTUVNOw0K
PiA+ICsNCj4gPiArCWZvciAoaSA9IDAsIG4gPSAwOyBpIDwgbnZtLT5ucmVnaW9ucyAmJiBuIDwg
bnBhcnRzOyBpKyspIHsNCj4gPiArCQlpZiAoIW52bS0+cmVnaW9uc1tpXS5pc19yZWFkYWJsZSkN
Cj4gPiArCQkJY29udGludWU7DQo+ID4gKwkJcGFydHNbbl0ubmFtZSA9IG52bS0+cmVnaW9uc1tp
XS5uYW1lOw0KPiA+ICsJCXBhcnRzW25dLm9mZnNldCAgPSBudm0tPnJlZ2lvbnNbaV0ub2Zmc2V0
Ow0KPiA+ICsJCXBhcnRzW25dLnNpemUgPSBudm0tPnJlZ2lvbnNbaV0uc2l6ZTsNCj4gPiArCQlp
ZiAoIW52bS0+cmVnaW9uc1tpXS5pc193cml0YWJsZSAmJiAhd3JpdGFibGVfb3ZlcnJpZGUpDQo+
ID4gKwkJCXBhcnRzW25dLm1hc2tfZmxhZ3MgPSBNVERfV1JJVEVBQkxFOw0KPiA+ICsJCW4rKzsN
Cj4gPiArCX0NCj4gPiArDQo+ID4gKwlyZXQgPSBtdGRfZGV2aWNlX3JlZ2lzdGVyKCZudm0tPm10
ZCwgcGFydHMsIG4pOw0KPiA+ICsNCj4gPiArCWtmcmVlKHBhcnRzKTsNCj4gDQo+IEkgZGlkbid0
IGZpbmQgYW55dGhpbmcgcXVlc3Rpb25hYmxlIGFib3V0IHRoaXMsIGJ1dCBob3BlIHRoaXMgaXMg
dGVzdGVkDQo+IGFuZCB0aGVyZSBhcmUgbm8gc2lkZS1lZmZlY3RzIG9mIHRoaXMuDQo+IA0KVGhp
cyB3YXMgaW4gaTkxNSBpbnRlcm5hbCBmb3IgeWVhcnMuDQoNCj4gPiArDQo+IA0KPiBOaXQ6IFJl
ZHVuZGFudCBibGFuayBsaW5lLg0KPiANCldpbGwgZHJvcA0KDQo+ID4gKwlyZXR1cm4gcmV0Ow0K
PiA+ICt9DQo+IA0KPiBSYWFnDQo=
