Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0DDAD08CEC
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 12:07:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0A1210E89A;
	Fri,  9 Jan 2026 11:07:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XkucuZbO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8C6510E02B;
 Fri,  9 Jan 2026 11:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767956825; x=1799492825;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dIWwCMU2QoaINxUXywnDGbUX86qTIJTHzHCBPFOOgfk=;
 b=XkucuZbOkQppqIPyY50KShtk6wygZshiQSMpQPqUMJukycJByyIJUubX
 ZDtNGXla1RVm9IduabeOnvrfubHbOUf/Bk9WCEd1+S5aPVslP2liqB7P3
 GvjcuXjhdqsK9K9+E7vgctgx7yFLkoIXPVn0Cs+lMHEjz8+B3bhRmEKru
 e4jDfjjf9mpfQv/WPYRlJJKAdjwFo90gouz6KAtDSBUosWUT1Mb3skich
 FTDUzyFtl/VT+wzXDNsdX7hvDRIkyhIreHDHVlMnPff1XUkLX55WCcqs3
 PATJlZkDMmb0FyUlPPsSKmiqZ5PXVKBNhsXADZsqIrSkHDmZDUjuNhmIR w==;
X-CSE-ConnectionGUID: TupdvbpVQRWoiU5zlEjm8w==
X-CSE-MsgGUID: 9m5c/uqpRjShV/pnSy9//w==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="56891456"
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; d="scan'208";a="56891456"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 03:07:04 -0800
X-CSE-ConnectionGUID: jxHtTYxQQe+i+vAztoE/hw==
X-CSE-MsgGUID: zHv/GpzFRE2jEFcycgEJEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; d="scan'208";a="203875458"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 03:07:04 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Jan 2026 03:07:03 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 9 Jan 2026 03:07:03 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.7) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Jan 2026 03:07:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bfO5Tc8/UC1TUhHi0GBXTB3OLRj6j4rNrAhDKhpAHhSZUg388OoTbMG3fSTZ9Nkc/uztnB7uA66zlqGE3juPSFYYgt8L8B1nWSnxbmDQAOFJpNSwzjBH9Jvq0/NINvvdWP52NBKBGaOzgQ7Ep1jKXsGxbY0EukLxRvxJaigRYXSwRrgdGgHZLGMuyjvjQ8/qkOO2RN5TodMomaOG0YfmHNuwGPqJqm+TvGED44EdahS9A5YN3PdKt8ronpVaZTwZ2e7nVepYhkrlvW2lIN5R+CZmCLxMeVikg4D7agVwYY7KpcF9CgXUAUZZx0sSPp4/roZaiNeJUuWCnCUvDmTZ7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dIWwCMU2QoaINxUXywnDGbUX86qTIJTHzHCBPFOOgfk=;
 b=rJva9m1DXyjFwqLsmzwQCVEj6YhDXmXEUzivz5zcWto1jFtYVYa5yE3pD3dEHzX+SKgTv2+qMqIdBBRkK5XJKuldg+r1xqIedtyabnztSJcAjCK6CdDOeExO8SxIHItWm+x+mSYRnXXhAAweI3tSe3S1tpPyO8GJLoOC678cO4LlrpR0rt017eU5oZN3dAXvrcXuPQZ/PlZbbWjxZE//NEV0V70uWEDe6wRo6qTV9x6xJD/RXGX0TQdWCDSlHWP1NLR/tf3ivYIiopeUrn6Il+KUNiaMSgxNs9jAGjOF5CBmOXDUCLfG1k8nOOoi/znFRegytoa6Z14xTEofPvv5fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by SJ0PR11MB4782.namprd11.prod.outlook.com (2603:10b6:a03:2df::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.5; Fri, 9 Jan
 2026 11:07:01 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%6]) with mapi id 15.20.9499.003; Fri, 9 Jan 2026
 11:07:01 +0000
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
Thread-Index: AQHcgIN5UwmDuAHNMUuSYMjH6VvbC7VJl7sAgAAVv7A=
Date: Fri, 9 Jan 2026 11:07:00 +0000
Message-ID: <IA0PR11MB730722B84E81A0CC9BF80275BA82A@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20260108-async-v3-0-e7730c3fe9ff@intel.com>
 <342abb15-95e6-4ed6-8b86-a900c0f403a4@mailbox.org>
In-Reply-To: <342abb15-95e6-4ed6-8b86-a900c0f403a4@mailbox.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|SJ0PR11MB4782:EE_
x-ms-office365-filtering-correlation-id: 11e1cb3c-6c0e-40f6-40f0-08de4f6f36a6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|10070799003|366016|38070700021|921020; 
x-microsoft-antispam-message-info: =?utf-8?B?eVNndXlFWjhjdG04cStsZzJyaDVvaE5XQUFoTk0yVzhWWGRoRmVScGdYeWM1?=
 =?utf-8?B?ZjI1eDJKbmxwb0xUMHRBeTlCamZjYmhtTG12cm9qcjg3bjBDM3ZJcXh4YWdh?=
 =?utf-8?B?VDBlZjZ2WHVHeWdwWEFmWE1hM2lBbnBWaFFvVDFlbzB0d3hZcUc4Q3ZRZHNK?=
 =?utf-8?B?d250SzNzdW9EMG9Dci93OGVKbW5UTElrNkhidUtteGlYNzRpSW9GMzJDUWMv?=
 =?utf-8?B?RVU5cjBwcmZaNHh4WWtwelhQeTlsbmFUcXFJMklINUNlZ3BXblpINDhNeWJE?=
 =?utf-8?B?N0lLMmVRaDB1UlB2eTZrSEpXdktibFBqbnF2OG52ZURtUklIdUtqMHZJSFJi?=
 =?utf-8?B?ZWxTZnpwSzExYzJHVUQrYWM2V3VYSmNlOWk0RjAzdGcrUE9OWWpPOGdldnYw?=
 =?utf-8?B?OElZeVpidDlwZVlVdzdaT0pzS0s2NVQyeURQOEhtUmI1aUxjYzFmVmYvM1d4?=
 =?utf-8?B?TXJkRGFzeGxrT3lxSXRDaFpPV2tSNVUyalJLL1pMY3loTjIwS2s2SmlGS0Nx?=
 =?utf-8?B?UzZHTFoxUU5rRGhsa05Yd3o1UGJYVnJYK0FvWmtseWtMemZwNkgxT2kzTWtq?=
 =?utf-8?B?UDNEV3ozWHRpVUkvS2lPYXg4YTJUQlA1S0lSV1FycVJ3cC84V0pBcmFPTHdC?=
 =?utf-8?B?SUFBSHd6VnAxWFB5MSsrZUVxeGRhSm9tVmJxSS9rTzdHclBoeVRFNFFZOUJL?=
 =?utf-8?B?TlpneDI4b0o0cER2NVhsWi9xSWlNMzlGWjhFYUNaN1AwODVMUy9wNE9tOW1E?=
 =?utf-8?B?TDduT043UHNtejFEaEp3ZVhQTlVQYTFGeEQ5cDNTR0RpcjQ3V1F6WTh6NDJp?=
 =?utf-8?B?N3BkVUJlcktJd3craE5HbGJIZjg0bUU2dFJPMlk1MXhLcUtrTTUxdmwxOVhS?=
 =?utf-8?B?L1p0UThWS3BiZXB4b0o1S1NqazZpYzJpN3VqSTF6UUNNOERSWUpkcU9qM1RD?=
 =?utf-8?B?SzV5VDUwUzBVeDlPSDdlZDliVjlaYzJwNFVDNjVlWHBQUG1DZVAvZVN0WTBW?=
 =?utf-8?B?SGQ0enJqd01wRGdvTFkzN2dVT0VEQXZwTDhvZ2hOMWhHTlRmaDJBOVRlSVN0?=
 =?utf-8?B?RXlTYThIUzJDN3BDVVBFK3FOZFE2RXBjdHJrQ2JKWTM1UEE2cTVXMUdDQmVD?=
 =?utf-8?B?QnJ1ZzlxQzljZXpLOW1wN3JHREN1UWpGRW1VU0pwVjhzdDJTN0pkcWVtMFN3?=
 =?utf-8?B?NWtHUXpHbjdwdUdXYmtVUHV0aHFSN0xWVmhaK0FMZmhWS2NhTHhGUk1odWdI?=
 =?utf-8?B?NHdVaGwwVTY4bzl3ZG1zd1duaU1IdXBkK0ZxWmU1R1FWNEppZGVNZE9tRkd4?=
 =?utf-8?B?RTdONllBNVc2cWtMalFnNXBsSllwdG1Sby92OWl0L1dZS0prV0cvM0hVdEdX?=
 =?utf-8?B?dSt1VnMvbkZndzdnYWlqRjRrbkdCK1hleSt0KzUyMUppYUxJcTZHdWpRWEor?=
 =?utf-8?B?Yk5SQnhoc2MwZW9jeXJLM0Jpd2h3OVlUQ2lSNHRKc21JckZ0aHFCbkRJUU04?=
 =?utf-8?B?b2l4Q2U0azVGOEJjcmhmQlU5RlN0b3NiSEQzdk1DTUtUR054V0xjTzI4Q2h2?=
 =?utf-8?B?dSs4REl2M2Zvd0ZOWDFPNFVRR1V6bWlSTWdHMElSeC9SY2ZueFRDZXZrUVdk?=
 =?utf-8?B?cDQwNnRtQm1WOU1UQytSQU1zOTg2U1FqQmRUMS9ad0tVWE1vRzdhdUErdWZj?=
 =?utf-8?B?UTVqTlFsQStXUDZqdjhveVpMTGNuR1kzeUxCeUZOY003VkZpa2RjSmh6Zy80?=
 =?utf-8?B?dEE4YklJRHE5WURZUTJ6SS9yczZKVy9VbWpxamZhekU1RGhCaTBjRmtaUVRD?=
 =?utf-8?B?WllVeTJRcmlhbUE4S1ZCdDJ2azdaUGFGK09sYWl4MElpYjhjcG1NTE81WkIx?=
 =?utf-8?B?RURjRWltVUg1L1dFaVB4U3JrcnRKTU5selRrWlJtd2s5VkUwUlhDOHdhbHdH?=
 =?utf-8?B?WGRJNURYeDBkWE1GbFJ0UzlLcm1lTDJTU1FMZmxTVmdKbVpTNkJDWSszL3FJ?=
 =?utf-8?Q?V0fbQVndMO4P+ToG6nOoZaTmcrHCnA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(10070799003)(366016)(38070700021)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MEptcVZFZTFSdTg4aUJGMklhQlVMTTg4UTd1Y09LM2h4RGIxSXhNZEFMeDJv?=
 =?utf-8?B?L2ZsaEg0SUtjcXREN09tK3BqVmhUSzFWRUhpeXppdS9HYSt6aGp2eFVLTGVm?=
 =?utf-8?B?ZUxmdmphTU5OZmpjU3JJQm1jUEdKQllSbTBPQ1g1SnNwOXNLYlBoYmFCcCtx?=
 =?utf-8?B?c1kyNnQyL2Eydzk1QmhUdEExV1p6WTlvb2g0b3JDcXFSSHk0SXR3TkVsbk9m?=
 =?utf-8?B?a1F3RTNRVTBWanVPVHV0UnM3N3B4bnRNYzQzTyt4TnNiYVRHekhwL3lmbVFl?=
 =?utf-8?B?KzN5ckRmdm1LMkI1SXBEaFY0UWFTcXNEUEZvZ1dmcC93QnQxcmJkWnFiYUQ5?=
 =?utf-8?B?Z3cxd1o3cDZ4cTNZT2xtR08zZFpJTkRtSm95VlR3RHRVVU8yeVZZM21rRENK?=
 =?utf-8?B?KzRtaldHL0tSU0hIb3NRQzRFOWtPcnh5TWJna0FvSmJFZE5wd1c2REhlazR6?=
 =?utf-8?B?OGtnUjVZVHp4QkM5bjBIV0dBNHR2eXBPWU1TQjhndGR5SytwYUcwdWM3TlY2?=
 =?utf-8?B?aElndXhkb2VMTjRtbVkrVDFvTjZaSFRhZnd1NVBaSkRSZjNGcXdzZFFoS2ty?=
 =?utf-8?B?aGNoSDZFN1pSZ3cwSkRPN1dmcmdDKzh1TzdBUU5MeXZkWS9PUFNPaDF5bE5C?=
 =?utf-8?B?bGQwaHlicCtKaWtSdzFRY2MyTGVOOVcxbXhJaUlCUFR4NDJCRFpSaTFEOE85?=
 =?utf-8?B?TFJZZmtjZm53Y2hQZDNQa2pRQmNwRWtUWk0xVStBMEtHTzYvMW1UaDJkWmJV?=
 =?utf-8?B?Ty80a0c4Q0V0djBGelRPSjVtL2tMMWZaVXdOa29PZ2hxdzFMb093eVh4ckNw?=
 =?utf-8?B?SVFUQUd2MkI1S2hCNTFLeVMxUVg1TGhSOXV6VGFobFl3eEcyRWE1THc5UmZQ?=
 =?utf-8?B?UXNBT2NBcmVEa2dxelAvakNTRThPeTM1Qnd3Nk92WXRDUnNwbDhqVDJtUlpn?=
 =?utf-8?B?aFQxTXh1TDlYV1phWjZGSkYwZFZNckpzUU5RTkVpcXZ6R0RQYWl4QU9tVXVv?=
 =?utf-8?B?Q2JYYUtoZy80bkpSclhRSW5ZZzlPZ2FYMlJTLzQ2cjdsZ0piZlRRamJ1Ym5z?=
 =?utf-8?B?UkJHUDBXeFltbVhBeWV1bkk0a1U3NE1uM1pYVlhVY2JrZ0dab1pjNm1vRVJT?=
 =?utf-8?B?SHJ2bk9SM0lPRUNxU1U0dlA1Q0hrY2VhRkJ3UW53Z2w2SlpzV2tGNFA5aU9u?=
 =?utf-8?B?b0Z6YzBicWxVQkNwb0plRWFmdVI0b2NqYWg5Y1A5R2podEJoSGFWYWFlbU9m?=
 =?utf-8?B?WDdvczYxcUdPQkEzTEdvOU5ITmFlbnkvaXRMVHlNYi9zM3ZvUHg1VSswb21H?=
 =?utf-8?B?ZzBob2Q0dFNoM0F0TnhpYjBQaGU5R0tmT0FKbnJvcmpFQ0tmbzV4VndaNlFR?=
 =?utf-8?B?Q2piYjN2VTZHVkY1TXN6c3dzZzkzaUsrZUMrc2hGczlLQ0lTSXRVWWxQVjlw?=
 =?utf-8?B?bHJPaUR5UWlPS3BiZXFaMkdTZ29ZZjZTQW10a0NFclJQMTc2RWhyRUlpM3RF?=
 =?utf-8?B?ZnlubytxY3YzandNRUFIOTJWbTUzVExoTHRUSVpabThJOWpiaGtoNG03eEg5?=
 =?utf-8?B?QTVYRVNkbzZSY2ptUy9rWXlZT09NbXJFeUJWaWV5WVJyNU1mT01XVkZNNGVR?=
 =?utf-8?B?V0JZczRUWmhnTktmTlNWK1BzUFcvRlVIeGhxd0U0MUNzZEpCVTUyeTdpajlk?=
 =?utf-8?B?L3RKRGZkZ3NaL1dpRE1SWDY5OFp6T05nTWNhcmVnNVIrOThTaW9wTkxhWFFJ?=
 =?utf-8?B?cnFmZXV6RXhxV3p4WERLSmhzUFZvN3VDdmpHSVp5K1I2cFBsek1QdUtiMjNU?=
 =?utf-8?B?bmhuZmtta01rTVY2QWZEWFZ1VS82NGVNaml6c3JheWZKNnFIMitxOW5DL0Ez?=
 =?utf-8?B?d2RScENXemZFWHJ3aEVzUjFqOWRZY21iREU1NVFJN1dveGt2MlY2NzNDazI3?=
 =?utf-8?B?NWxQZzFwT1dlQ1JvTk5LS0JIN2NNWUxTWXQ2MGdXd2dmcHFNOFUxc2lHYWFB?=
 =?utf-8?B?TlZaVk01ak5LYkw4TzlwUEQ2a0tEc1ppV0FCaHUxVXk2Zk1TUTh2UmVaLzZy?=
 =?utf-8?B?emhNaENlSTZzUldSSFN2SUd3Ty9Ybm5JZllEa21lMlBpSDg3RkxtMFdTVmVm?=
 =?utf-8?B?VlhQL3lJOEpCU3dwRmVMUXJYaWVRQnFPRm5TNkdUMmJ2TjZvZTNaSjJ4RVU5?=
 =?utf-8?B?R1JiRFBOQ2pYQ2Y5YkVUcGtoSElYcU5qaytDb29TTTk2N1FrSlBGS1ZpYlVh?=
 =?utf-8?B?VUJZckhlOWFBcWtlRWdBTnVPNUZXU3JFQWxQeWRZVjZ6eFVHQUJOWUdTWHBv?=
 =?utf-8?B?YzNrcFlWZFY2blJxRTA2cEJvTVNWbVF0T2hISHppNGFaTWVLaTVHV2F5b0Ny?=
 =?utf-8?Q?rINvfwk50LxneJhVg86FD9ivsOAoFfAY50O+7xxKHfxMw?=
x-ms-exchange-antispam-messagedata-1: Z3U42n0L5KcV7g==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11e1cb3c-6c0e-40f6-40f0-08de4f6f36a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2026 11:07:00.9822 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7MzBGGwyaTzumk7lnHZbx6x/xxfqrg4GpjQGBgtvodEPUkxJySobHej9wz4370rx9GPyqM3hdlqIUHcjabxoDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4782
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

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IE1pY2hlbCBEw6RuemVyIDxt
aWNoZWwuZGFlbnplckBtYWlsYm94Lm9yZz4NCj4gU2VudDogRnJpZGF5LCBKYW51YXJ5IDksIDIw
MjYgMzoxMyBQTQ0KPiBUbzogTXVydGh5LCBBcnVuIFIgPGFydW4uci5tdXJ0aHlAaW50ZWwuY29t
PjsgTWFhcnRlbiBMYW5raG9yc3QNCj4gPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNv
bT47IE1heGltZSBSaXBhcmQgPG1yaXBhcmRAa2VybmVsLm9yZz47DQo+IFRob21hcyBaaW1tZXJt
YW5uIDx0emltbWVybWFubkBzdXNlLmRlPjsgRGF2aWQgQWlybGllDQo+IDxhaXJsaWVkQGdtYWls
LmNvbT47IFNpbW9uYSBWZXR0ZXIgPHNpbW9uYUBmZndsbC5jaD47IEphbmkgTmlrdWxhDQo+IDxq
YW5pLm5pa3VsYUBsaW51eC5pbnRlbC5jb20+OyBWaXZpLCBSb2RyaWdvIDxyb2RyaWdvLnZpdmlA
aW50ZWwuY29tPjsgSm9vbmFzDQo+IExhaHRpbmVuIDxqb29uYXMubGFodGluZW5AbGludXguaW50
ZWwuY29tPjsgVHZydGtvIFVyc3VsaW4NCj4gPHR1cnN1bGluQHVyc3VsaW4ubmV0PjsgeGF2ZXIu
aHVnbEBrZGUub3JnOyBhbmRyZWFsbWVpZEBpZ2FsaWEuY29tOyBLdW1hciwNCj4gTmF2ZWVuMSA8
bmF2ZWVuMS5rdW1hckBpbnRlbC5jb20+OyBTeXJqYWxhLCBWaWxsZSA8dmlsbGUuc3lyamFsYUBp
bnRlbC5jb20+Ow0KPiBEbWl0cnkgQmFyeXNoa292IDxsdW1hZ0BrZXJuZWwub3JnPg0KPiBDYzog
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgaW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZzsgaW50ZWwtDQo+IHhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBTdWJqZWN0OiBS
ZTogW1BBVENIIFJGQyB2MyAwLzddIEFzeW5jIEZsaXAgaW4gQXRvbWljIGlvY3RsIGNvcnJlY3Rp
b25zDQo+IA0KPiBPbiAxLzgvMjYgMTA6NDMsIEFydW4gUiBNdXJ0aHkgd3JvdGU6DQo+ID4gc3Ry
dWN0IGRybV9jcnRjX3N0YXRlIHsNCj4gPiAgICAgICAgICAvKioNCj4gPiAgICAgICAgICAgKiBA
YXN5bmNfZmxpcDoNCj4gPiAgICAgICAgICAgKg0KPiA+ICAgICAgICAgICAqIFRoaXMgaXMgc2V0
IHdoZW4gRFJNX01PREVfUEFHRV9GTElQX0FTWU5DIGlzIHNldCBpbiB0aGUgbGVnYWN5DQo+ID4g
ICAgICAgICAgICogUEFHRV9GTElQIElPQ1RMLiBJdCdzIG5vdCB3aXJlZCB1cCBmb3IgdGhlIGF0
b21pYyBJT0NUTA0KPiA+IGl0c2VsZiB5ZXQuDQo+ID4gICAgICAgICAgICovDQo+ID4gICAgICAg
ICAgYm9vbCBhc3luY19mbGlwOw0KPiA+DQo+ID4gSW4gdGhlIGV4aXN0aW5nIGNvZGUgdGhlIGZs
YWcgYXN5bmNfZmxpcCB3YXMgaW50ZW5kZWQgZm9yIHRoZSBsZWdhY3kNCj4gPiBQQUdFX0ZMSVAg
SU9DVEwuIEJ1dCB0aGUgc2FtZSBpcyBiZWluZyB1c2VkIGZvciBhdG9taWMgSU9DVEwuDQo+ID4g
QXMgcGVyIHRoZSBoYXJkd2FyZSBmZWF0dXJlIGlzIGNvbmNlcm5lZCwgYXN5bmMgZmxpcCBpcyBh
IHBsYW5lDQo+ID4gZmVhdHVyZSBhbmQgaXMgdG8gYmUgdHJlYXRlZCBwZXIgcGxhbmUgYmFzaXMg
YW5kIG5vdCBwZXIgcGlwZSBiYXNpcy4NCj4gPiBGb3IgYSBnaXZlbiBoYXJkd2FyZSBwaXBlLCBh
bW9uZyB0aGUgbXVsdGlwbGUgaGFyZHdhcmUgcGxhbmVzLCBvbmUgY2FuDQo+ID4gZ28gd2l0aCBz
eW5jIGZsaXAgYW5kIG90aGVyIDIvMyBjYW4gZ28gd2l0aCBhc3luYyBmbGlwLg0KPiANCj4gRldJ
VywgdGhpcyBraW5kIG9mIG1peCduJ21hdGNoIGRvZXNuJ3Qgc2VlbSB1c2VmdWwgd2l0aCBjdXJy
ZW50IFVBUEksIHNpbmNlIG5vDQo+IG5ldyBjb21taXQgY2FuIGJlIG1hZGUgZm9yIHRoZSBhc3lu
YyBwbGFuZShzKSBiZWZvcmUgdGhlIHByZXZpb3VzIGNvbW1pdCBmb3INCj4gdGhlIHN5bmMgcGxh
bmUocykgaGFzIGNvbXBsZXRlZCwgc28gdGhlIGFzeW5jIHBsYW5lKHMpIGNhbid0IGFjdHVhbGx5
IGhhdmUNCj4gaGlnaGVyIHVwZGF0ZSByYXRlIHRoYW4gdGhlIHN5bmMgb25lKHMpLg0KVGhhdOKA
mXMgcmlnaHQsIHN1Y2ggbWl4IGFuZCBtYXRjaCBmbGlwcyB3aWxsIHN0aWxsIGNvbnN1bWUgdmJs
YW5rIHRpbWUgZm9yIGZsaXBwaW5nLg0KVGhpcyBzZXJpZXMgZG9lc27igJl0IHNvbHZlIHRoYXQs
IGJ1dCByYXRoZXIgYWNjb21tb2RhdGUgbXVsdGlwbGUgcGxhbmUgYXN5bmMgZmxpcHMgaW4gYW4g
YXRvbWljIGlvY3RsIGFuZCBhbGxvd2luZyBkaXNhYmxpbmcgb2YgYSBzeW5jIHBsYW5lIHdoaWNo
IGlzIGFscmVhZHkgZW5hYmxlZC4gVGhlcmUgaGFzIGJlZW4gYSBsb25nIGRpc2N1c3Npb24gaW4g
dGhlIGdpdGxhYihodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL2k5MTUva2VybmVs
Ly0vaXNzdWVzLzEzODM0KSBvbiB0aGlzLg0KDQpUaGFua3MgYW5kIFJlZ2FyZHMsDQpBcnVuIFIg
TXVydGh5DQotLS0tLS0tLS0tLS0tLS0tLS0tDQo=
