Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8DB9F750C
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2024 08:02:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4FDF10E2EA;
	Thu, 19 Dec 2024 07:02:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D4qNmNaG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4994B10E466
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 07:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734591739; x=1766127739;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=noMeDe0rxG7Ce2kxDoLus5kAZrz0K2ll1b/qon01QzA=;
 b=D4qNmNaGHqG+U1Kg2G8utqGMf5SD/VJOhV/D0Y1M6KG4j1+kt1P+AQM9
 XB+Q3ijtdX19Sy7IXeARCzFO3Prncl+8OSBJDgrx+oN7GUD01F/VXQbiz
 Z0zEKIwEODzvtDH8AGDGXZdt89yxWu8Bvw/f+198scQvsrFwEElOUDDV/
 Bxs3sE1rv1Y3s9yxVEOE7jyV2lvIF6csajggYKeebmlo7QqQt10MwztFy
 2eI2UXd/OQUYw25r2v9JsIeHm+dUFVqqn6/W9KN04vvMs3epSqA3o647b
 39FxpcJnsm7U3yJpTCbl0WIok+CF8NzA3irIhjBZDK6N8ntdgeuJB0h2k Q==;
X-CSE-ConnectionGUID: j0zGKsQBQZmieaPzchMp2A==
X-CSE-MsgGUID: ROUlO9YARrGZT66iaVRlBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="39028115"
X-IronPort-AV: E=Sophos;i="6.12,247,1728975600"; d="scan'208";a="39028115"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 23:02:19 -0800
X-CSE-ConnectionGUID: 8akxnSabQWeDpLRiGWGoOw==
X-CSE-MsgGUID: eLTJQEYDSGSvwJN76xrwIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="135432671"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Dec 2024 23:02:19 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 18 Dec 2024 23:02:18 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 18 Dec 2024 23:02:18 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 18 Dec 2024 23:02:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WfsJsDmhtihj8IYVtOf3tsoe6kHLcnNOwfJSL5c3T0V5ZBY6HnzeLgny7PsWZkgKjbXGEPESECXSnhy03dCjLBo6uFqshJuj7ayEKH62hoj4lHA0+nZdpHSxWTc2WqPJ2h4IhyUsMEpC9zdGYUhLUqf/3DzJ8wEOTDjYZIqpJ69kHNHgwvujgmm2sEG+VLV4eMRfp5ufnAFcq/AM3RKmf+MRFNMSiqTjHGDkxaNB0LHrm+HAtszzWAE4hdXcj5vFmlYk+nWZqSBhvD6s1BjO2c1GdTzlqx0B8O46yqzt0fhVSGqh/tNX33ZIsjxtiWqjNGw0B5A1rANbkTyehOMsJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=noMeDe0rxG7Ce2kxDoLus5kAZrz0K2ll1b/qon01QzA=;
 b=Yap06RndYh12ybXW3xp3Zea3DG9l4c87S6VcaCgkCTIJ7C4zJ5dRKw+/qrnMU4uS/CLGP2lFUP/HqALhwpABmqz8FGHj0spNkaBomFLUUzkG54zwaeXnTQupqyVvVHkjsllVv/qldT7/E1H85H8fYv1e6iqWV3I//IZBqaB2rR26dAy2aGIeMGGlpcClgbKdCwaNb/fq62o2q1/jupstReWuth2QbTm0GNILDk8JoI9dQp+SyiTC90u/CAQvG8gd2CjkjqCt+T6QQ24cJ+8UZevVC1HNgDNndzOAq05YoOc5g+bZldP2VrJ2J/trMv9Bz9to3YRa2WukVA6uTPVgPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by PH7PR11MB8124.namprd11.prod.outlook.com (2603:10b6:510:237::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Thu, 19 Dec
 2024 07:02:01 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%4]) with mapi id 15.20.8272.005; Thu, 19 Dec 2024
 07:02:01 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>, "Wei Lin
 Guay" <wguay@meta.com>
CC: Keith Busch <kbusch@kernel.org>, "alex.williamson@redhat.com"
 <alex.williamson@redhat.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "kvm@vger.kernel.org"
 <kvm@vger.kernel.org>, "linux-rdma@vger.kernel.org"
 <linux-rdma@vger.kernel.org>, "jgg@nvidia.com" <jgg@nvidia.com>, Dag Moxnes
 <dagmoxnes@meta.com>, Nicolaas Viljoen <nviljoen@meta.com>, Oded Gabbay
 <ogabbay@kernel.org>, Simona Vetter <simona.vetter@ffwll.ch>, Leon Romanovsky
 <leon@kernel.org>, Maor Gottlieb <maorg@nvidia.com>
Subject: RE: [PATCH 0/4] cover-letter: Allow MMIO regions to be exported
 through dmabuf
Thread-Topic: [PATCH 0/4] cover-letter: Allow MMIO regions to be exported
 through dmabuf
Thread-Index: AQHbT6OfgMZQT2ym50q9Un3Rm20kj7LoqU6AgABttwCAARzDAIAAFGSAgAAcV4CAAPjeQIAAauaAgADwvnA=
Date: Thu, 19 Dec 2024 07:02:01 +0000
Message-ID: <IA0PR11MB71855CFE176047053A4E6D07F8062@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20241216095429.210792-1-wguay@fb.com>
 <89d9071b-0d3e-4fcd-963b-7aa234031a38@amd.com>
 <Z2BbPKvbxm7jvJL9@kbusch-mbp.dhcp.thefacebook.com>
 <0f207bf8-572a-4d32-bd24-602a0bf02d90@amd.com>
 <C369F330-5BAD-4AC6-A13C-EEABD29F2F08@meta.com>
 <e8759159-b141-410b-be08-aad54eaed41f@amd.com>
 <IA0PR11MB7185D0E4EE2DA36A87AE6EACF8052@IA0PR11MB7185.namprd11.prod.outlook.com>
 <0c7ab6c9-9523-41de-91e9-602cbcaa1c68@amd.com>
In-Reply-To: <0c7ab6c9-9523-41de-91e9-602cbcaa1c68@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|PH7PR11MB8124:EE_
x-ms-office365-filtering-correlation-id: 76882155-0090-406d-786b-08dd1ffb097a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?WWQ0dTI1Q01McVQwblJHWTR4UldoRE5EYkFsSXhmZlF6bk5uRUhIeGx4UzdP?=
 =?utf-8?B?WU5TdVB0eDhjMHhFVUdTODdVcjc1czRDbmJUa214WjVheGl6aXhqTjYyVEtF?=
 =?utf-8?B?RU83QllNazVDTy91OGd4NzdBOHdhVk1VdHBlQnNlR0VnR3BORHhtYW8zM1U3?=
 =?utf-8?B?d1ZWUjBlanpPM1NtVnp3NjgzK2pKK3FkL1VRSlpRaUVJckx6UE82Q20wdHVN?=
 =?utf-8?B?Sjh2aS9nbHhlRWhpZ0daWEtqek1EdlRXVDBqKzUycVdMNUdzYTJqdEJTc0Y4?=
 =?utf-8?B?TWVZdStEUElTWUFrWGVJeDY2R21jZGRIVFRUSnU4RkJUSkllRHRKZnQ3dnZi?=
 =?utf-8?B?a2JJdTAvYm82c0krTGQ2eFRhdDFnUVNrN1BsSHVreC9TZ09tYy9ZWTR4SXVi?=
 =?utf-8?B?b2RtRzVyQnJsekp1bkZmV2tNOEhGQmdlVUZJREg1RFpnY3FzTGVzK2ZaUzBI?=
 =?utf-8?B?L0JKWUxickhySkVTTngzcFpYNHJtV0QvZHg5UTFDb2FWSVA5eFVKMEdWeXpo?=
 =?utf-8?B?eis0czU5Tytsc3BHYTArR3hET3hUcjZBWmc4V2ZLV0Y4ZWlSbWZtaEJwM05L?=
 =?utf-8?B?LzRXTjlSM1ZNSWRsamxFN0NoWjVLVVUvT1JsMFpsUE15ODd4TnM5aG5ncmRs?=
 =?utf-8?B?SjlzYUR4S3puR2duWnlIZ2xQMFVHZGQ5anBxa3ZTWWZyL2dpV0tBRVkzL2Vp?=
 =?utf-8?B?YmlhV29HV1R5MFROdmkzdXhuejV3cnBOU0szeFlnUmg3ZndaQVZqNnJXRDRv?=
 =?utf-8?B?QkxDd3VHdHhLT1cxNkxTc1R0NEZ0SllhdHVDVFR0akQzaHVoQi9BWlRORnFR?=
 =?utf-8?B?aWdsajlpTkdpTmduQ2E0Q3ZOeXNVN1JxOGdwL3A0VGI2T2hDbHVJaCtFd0pW?=
 =?utf-8?B?MlA3TVl2S1cyaVNmcXJtRVZXZHRabW9UNHY4NzZtWm1DcWo2TjU5UTYrZjd6?=
 =?utf-8?B?c1dpUVJkSkxla3Jhb2gyWjkzTDNuN0FtMVJRRngyUGVvY3BFZXBPSlFRaDdo?=
 =?utf-8?B?V0tCVXhLMG9URkp4ckt1bkdheWFHcUR5dmk4VThDazZkKzBzS1hsTHZPWFhG?=
 =?utf-8?B?dkJ4ZUZES3JOelUxZ3JDUzBjbVhkVVhhUFgzRmdNZzdXTXpiekF5cm53azJT?=
 =?utf-8?B?dTlhL0U4U1QwcjZRQ3c3NEN1cElVOEJ4cHlOdVRJbDdkV2ZKQVhjQTJ2dEto?=
 =?utf-8?B?Ym8vU3pQVmp2ZWxGMkR1NmNBcTlnODY4Rll4cXQ3dUxPS01lZW1QTDduQkJM?=
 =?utf-8?B?YlNGeVNTSzNUZVJ0cXo5UWVScTQyaWhFaFYra0lqQVlnUXlKN05uMzQ2SFFt?=
 =?utf-8?B?WWwxKzdOTzFUa204eFZvU25DcmJHakk3THBZa2hnOVVpZ0JmZFRYUXpKMXhI?=
 =?utf-8?B?ci9vdlp0RUpxU0tka0U1Z0VKL2h4MFI0a21iSFoxMEkrd0hWQjNYOGJOSmE2?=
 =?utf-8?B?OVhobDJBbU9LT0tTclNPc1ZUOTJ1NVpBZnNzS3duL3pvb0FjVEZmQ3ZqeXE0?=
 =?utf-8?B?ck1DYnk4aW5JWmFVZTlBRlRvb1hrWEFNSStOSTZiemthM3FZcmhheGJrZDRI?=
 =?utf-8?B?d1FObzNnRkI3bTlvdTlvRTRSdVo4Z0N4bkVoZmMxNUI2L3JMTDM3UlJqWklO?=
 =?utf-8?B?cG5oR2hJekpHTWJMSlljODdwRnJYeC9BQU5tMFp3dllqVHZhaWVGZk9kcEla?=
 =?utf-8?B?VWJYaTE5eCtLa2VtNVRDQnNwc2dNd3RkVWt3NHlhSjVmQzRTYlNCcDVDYjlF?=
 =?utf-8?B?NkpEZHh1RUdjblV3eGlnV0ZZdmJSV0E5bGlwYVYrUHFOQmxSWTArNTBiSGM4?=
 =?utf-8?B?NUxGNmIrMUljK2FTb1ljRVZTT085UTFocnhsWmpUNnphV2dOR21nMzl6NXlj?=
 =?utf-8?B?aExLOTJ2VTdZdFdEVUM5V0kxTGhlRDlWL3JLdEltbGozYzJwenFycHRYVTVu?=
 =?utf-8?Q?T40twHlW5NncT+KVHD4scl2K3l8yYxpc?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WEJyRHZUVWVrL0FBcDdnbUY1cHdlNVBKUVNDM21sMTFjNU1aeHUwb3VLRVB1?=
 =?utf-8?B?LzJQZzYvdmJDWWNlNmV5em5za0JGbW81RkVVM05KM1dxeHZuRWRCMWUxRWlW?=
 =?utf-8?B?MHlrdDFrZzMydEJJb2t6d29EU0Z1OUMxcHdWcnpoQkJJaE5WS3ZFcTY2Ukdl?=
 =?utf-8?B?TkhFKzZRcFZIWVpuYWtsSmtNU1RVKzUrdkxyUkc5emFZSTdLc1V3QlMwL2kv?=
 =?utf-8?B?aHhvR2lpQkNKNTBiMExZa2hhd05XZUtxRUkxUGJHTDVGaGNDUE9CQTV6cDdJ?=
 =?utf-8?B?SXZMYlNrTXpKTENBdUd1dEdNQjhFaDlmUDFKdFJQbk9GQlgyWStrdFhuT2Ew?=
 =?utf-8?B?ZmZ1RlhDS3RMNjQwUUZ5c3VBVmxUcHcrNUhOYU5JZzZoZ2xiMW15VG8wZFY2?=
 =?utf-8?B?NjZWa2pNRjZvcHZqWFovemVhcG5KSFpDQ3NTNC94cUpaUVhUY1krRCs1OWdP?=
 =?utf-8?B?VWJSSHdVVjJ2TUF1dXk5Rm9PVHBLOWJVeG1xRXV1dklnODFOVXJwNXQyM2JE?=
 =?utf-8?B?R1JYVTBCV01NaUtqdlV6RGN2VDRQZkFheHIrTDZRR0g5Vml2YlNyUDVqU0Fv?=
 =?utf-8?B?eDlwZTRlWlZhVFB6WmNiSis3Z2Z5RmxJSEtQOVU0OTJ6c3MyYU9kM21maS81?=
 =?utf-8?B?OHc4TFFZTnBsOEROeTNMdHllc0hEWXgwYkZSQmROQVdjV3YrR1k2d0I5b1p4?=
 =?utf-8?B?NkV5bDRDNCtKQnRGemhoVmhUcDFScmF2UWJScFE1dHpsdnNReHcyL0dJdm9V?=
 =?utf-8?B?UHlGc1d3VTd6UkhvRXdJUDJSaEdCRFVLWWZpKzJ4eHgvM21NZkxKaVRhNlJK?=
 =?utf-8?B?U2MzMTFFWmFzRTRjVmtBTk8vTURHbFBOMDBIYU5rT3J0UmhKMTJ4eWVBaHNT?=
 =?utf-8?B?akZOYlF2Ky9ZQTJHTkMvUW83VDRYQjA5dEo2YlpaK1JEbjk0Y01MNXBvQlRq?=
 =?utf-8?B?dUhhVTl6eFR4dEQxR3htT05mVEozcllwR0I1YnArcEwvUjdoZi9GRVRvc0R6?=
 =?utf-8?B?WWY1eHZRVFJ3SDlwWlFpemhRdWFzVlMramRMWW5uUC9VMWZSeklsS2F1RGJE?=
 =?utf-8?B?RDZESlpKSjFyWmNsQzBrQWFEUkxhOW9LUG8vWGdLMDlzU2U1L0l5ak1zc2lk?=
 =?utf-8?B?QjVaeXZCbVU1d08wNmFHbDRpTERJdk10YVZLMGRoekhJWDViWlQyUzVsWnY2?=
 =?utf-8?B?V25rSkVvallxT0tZRkdvUk5XcHMvejZMNjE0MklrdkJCS0szaXBwY0xVMGI0?=
 =?utf-8?B?eDRBYVIxWE1YN2lRd3JGRXFqRUZPU2NzK1NPU2J5M2xtYXNZTCs1Wjl3d1Vz?=
 =?utf-8?B?NXJObnhFN2JBNlE2TzRSTmUvb1NyZXNFMi83NW0reUZrSUYxWU1qM09uTHls?=
 =?utf-8?B?Y2d0NTI3eEtPR0hJZk5wSFEzS3I4UzQySmllYlN6amZiTGI4MDV2YkNhZ1lB?=
 =?utf-8?B?a1VBSTNDQlNzNVJrbDE5ZUZBZ2dzQXJETHpSdnVjZFBUN0ZsWG5GUHlldWx4?=
 =?utf-8?B?STBvUlVWd2tZUFJrTytMUy9rTENMYXdsT0QxZEVoWm5BbEU1Q0FNTlFiVUpu?=
 =?utf-8?B?MXY2ZHQ2c3dQZ2kvRGJyd2E3K2dTZkhPY25WRW1xTDJiekw1MzUwYWNnQ3k0?=
 =?utf-8?B?cFFwV29BWFYxclJudTNNUnRZakUzMjVYYXAxelJlUmFaa29ibE9xdm9Yd09J?=
 =?utf-8?B?ZnpwYkVPc2xPRGV1NVJyYXd5bDh1ZjhGanczVU5sMTdqY2pHM0NWc1BaVC9G?=
 =?utf-8?B?bm9sL3B5L3ZMYVVBNjdWdkJnaW1qV0lwUUUvWmE4VlliRXZLQUcxYmd5SFdl?=
 =?utf-8?B?RTlkMjM0TzF5d1kwYjFqVUVLMys2dDdBWFcvd1RrTklTRjJoc2dlK3dtSHRM?=
 =?utf-8?B?RkVPUzhwZUVPZ05BSGV3Y2NKMDVzRG9jbEVVTU5ETUdZY3FrbXFrK2RGR21N?=
 =?utf-8?B?VzR0MWdPc251anZQc1hRaGRuZXVqMFl2Ui9SZVhPdE4xZEc5Z3dqaHdUKy9Z?=
 =?utf-8?B?Q2hubDhkdUF1T1FJTmdIb0llV25KM3ROdzcvaFBMclFRcWQ4RW9ZaUc4R0Vv?=
 =?utf-8?B?TEJCcGVTVWY4TmNKSisxUWR5ZE9FNGRnbkJnbnh4emNxN1A4Ym9aeFNsS3Y2?=
 =?utf-8?Q?R8npaHKNxHZFAq1DISjNvCvzz?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76882155-0090-406d-786b-08dd1ffb097a
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2024 07:02:01.2270 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kcMoGPzZxHpOzoIWqcIRVOU4aH3xKCWn9GLkUkxdA7cuhmxtU781fOdFRL0wgGnzNyGuUVyy71+9ToIh5KjfiXAHnqQNBZqmJnG6XofmwnM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8124
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

SGkgQ2hyaXN0aWFuLA0KDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMC80XSBjb3Zlci1sZXR0ZXI6
IEFsbG93IE1NSU8gcmVnaW9ucyB0byBiZSBleHBvcnRlZA0KPiB0aHJvdWdoIGRtYWJ1Zg0KPiAN
Cj4gPj4NCj4gPj4+IAlJIHdpbGwgcmVzZW5kIHRoZSBwYXRjaCBzZXJpZXMuIEkgd2FzIGV4cGVy
aWVuY2luZyBpc3N1ZXMgd2l0aCBteSBlbWFpbA0KPiA+Pj4gY2xpZW50LCB3aGljaCBpbmFkdmVy
dGVudGx5IHNwbGl0IHRoZSBzZXJpZXMgaW50byB0d28gc2VwYXJhdGUgZW1haWxzLg0KPiA+Pg0K
PiA+PiBBbHRlcm5hdGl2ZWx5IEkgY2FuIGFsc28gY29weSB0aGUgY29kZSBmcm9tIHRoZSBsaXN0
IGFyY2hpdmUgYW5kIGV4cGxhaW4gd2h5DQo+ID4+IHRoYXQgZG9lc24ndCB3b3JrOg0KPiA+Pg0K
PiA+PiArdm9pZCB2ZmlvX3BjaV9kbWFfYnVmX21vdmUoc3RydWN0IHZmaW9fcGNpX2NvcmVfZGV2
aWNlICp2ZGV2LCBib29sDQo+ID4+ICtyZXZva2VkKSB7DQo+ID4+ICsgICAgc3RydWN0IHZmaW9f
cGNpX2RtYV9idWYgKnByaXY7DQo+ID4+ICsgICAgc3RydWN0IHZmaW9fcGNpX2RtYV9idWYgKnRt
cDsNCj4gPj4gKw0KPiA+PiArICAgIGxvY2tkZXBfYXNzZXJ0X2hlbGRfd3JpdGUoJnZkZXYtPm1l
bW9yeV9sb2NrKTsNCj4gPj4NCj4gPj4gVGhpcyBtYWtlcyBzdXJlIHRoYXQgdGhlIGNhbGxlciBp
cyBob2xkaW5nIHZkZXYtPm1lbW9yeV9sb2NrLg0KPiA+Pg0KPiA+PiArDQo+ID4+ICsgICAgbGlz
dF9mb3JfZWFjaF9lbnRyeV9zYWZlKHByaXYsIHRtcCwgJnZkZXYtPmRtYWJ1ZnMsIGRtYWJ1ZnNf
ZWxtKSB7DQo+ID4+ICsgICAgICAgIGlmICghZG1hX2J1Zl90cnlfZ2V0KHByaXYtPmRtYWJ1Zikp
DQo+ID4+DQo+ID4+IFRoaXMgaGVyZSBvbmx5IHdvcmtzIGJlY2F1c2UgdmZpb19wY2lfZG1hX2J1
Zl9yZWxlYXNlKCkgYWxzbyBncmFicw0KPiB2ZGV2LQ0KPiA+Pj4gbWVtb3J5X2xvY2sgYW5kIHNv
IHdlIGFyZSBwcm90ZWN0ZWQgYWdhaW5zdCBjb25jdXJyZW50IHJlbGVhc2VzLg0KPiA+PiArICAg
ICAgICAgICAgY29udGludWU7DQo+ID4+ICsgICAgICAgIGlmIChwcml2LT5yZXZva2VkICE9IHJl
dm9rZWQpIHsNCj4gPj4gKyAgICAgICAgICAgIGRtYV9yZXN2X2xvY2socHJpdi0+ZG1hYnVmLT5y
ZXN2LCBOVUxMKTsNCj4gPj4gKyAgICAgICAgICAgIHByaXYtPnJldm9rZWQgPSByZXZva2VkOw0K
PiA+PiArICAgICAgICAgICAgZG1hX2J1Zl9tb3ZlX25vdGlmeShwcml2LT5kbWFidWYpOw0KPiA+
PiArICAgICAgICAgICAgZG1hX3Jlc3ZfdW5sb2NrKHByaXYtPmRtYWJ1Zi0+cmVzdik7DQo+ID4+
ICsgICAgICAgIH0NCj4gPj4gKyAgICAgICAgZG1hX2J1Zl9wdXQocHJpdi0+ZG1hYnVmKTsNCj4g
Pj4NCj4gPj4gVGhlIHByb2JsZW0gaXMgbm93IHRoYXQgdGhpcyBoZXJlIG1pZ2h0IGRyb3AgdGhl
IGxhc3QgcmVmZXJlbmNlIHdoaWNoIGluDQo+IHR1cm4NCj4gPj4gY2FsbHMgdmZpb19wY2lfZG1h
X2J1Zl9yZWxlYXNlKCkgd2hpY2ggYWxzbyB0cmllcyB0byBncmFiIHZkZXYtDQo+ID4+PiBtZW1v
cnlfbG9jayBhbmQgc28gcmVzdWx0cyBpbiBhIGRlYWRsb2NrLg0KPiA+IEFGQUlDUywgdmZpb19w
Y2lfZG1hX2J1Zl9yZWxlYXNlKCkgd291bGQgbm90IGJlIGNhbGxlZCBzeW5jaHJvbm91c2x5DQo+
IGFmdGVyIHRoZQ0KPiA+IGxhc3QgcmVmZXJlbmNlIGlzIGRyb3BwZWQgYnkgZG1hX2J1Zl9wdXQo
KS4gVGhpcyBpcyBiZWNhdXNlIGZwdXQoKSwgd2hpY2ggaXMNCj4gY2FsbGVkDQo+ID4gYnkgZG1h
X2J1Zl9wdXQoKSB0cmlnZ2VycyBmX29wLT5yZWxlYXNlKCkgYXN5bmNocm9ub3VzbHk7IHRoZXJl
Zm9yZSwgYQ0KPiBkZWFkbG9jaw0KPiA+IGlzIHVubGlrZWx5IHRvIG9jY3VyIGluIHRoaXMgc2Nl
bmFyaW8sIHVubGVzcyBJIGFtIG92ZXJsb29raW5nIHNvbWV0aGluZy4NCj4gDQo+IE15IHJlY29s
bGVjdGlvbiBpcyB0aGF0IHRoZSBmX29wLT5yZWxlYXNlIGhhbmRsZXIgaXMgb25seSBjYWxsZWQN
Cj4gYXN5bmNocm9ub3VzbHkgaWYgZnB1dCgpIHdhcyBpc3N1ZWQgaW4gaW50ZXJydXB0IGNvbnRl
eHQuDQpIZXJlIGlzIHRoZSBjb2RlIG9mIGZwdXQoKSBmcm9tIHRoZSBjdXJyZW50IG1hc3RlcjoN
CnZvaWQgZnB1dChzdHJ1Y3QgZmlsZSAqZmlsZSkNCnsNCiAgICAgICAgaWYgKGZpbGVfcmVmX3B1
dCgmZmlsZS0+Zl9yZWYpKSB7DQogICAgICAgICAgICAgICAgc3RydWN0IHRhc2tfc3RydWN0ICp0
YXNrID0gY3VycmVudDsNCg0KICAgICAgICAgICAgICAgIGlmICh1bmxpa2VseSghKGZpbGUtPmZf
bW9kZSAmIChGTU9ERV9CQUNLSU5HIHwgRk1PREVfT1BFTkVEKSkpKSB7DQogICAgICAgICAgICAg
ICAgICAgICAgICBmaWxlX2ZyZWUoZmlsZSk7DQogICAgICAgICAgICAgICAgICAgICAgICByZXR1
cm47DQogICAgICAgICAgICAgICAgfQ0KICAgICAgICAgICAgICAgIGlmIChsaWtlbHkoIWluX2lu
dGVycnVwdCgpICYmICEodGFzay0+ZmxhZ3MgJiBQRl9LVEhSRUFEKSkpIHsNCiAgICAgICAgICAg
ICAgICAgICAgICAgIGluaXRfdGFza193b3JrKCZmaWxlLT5mX3Rhc2tfd29yaywgX19fX2ZwdXQp
Ow0KICAgICAgICAgICAgICAgICAgICAgICAgaWYgKCF0YXNrX3dvcmtfYWRkKHRhc2ssICZmaWxl
LT5mX3Rhc2tfd29yaywgVFdBX1JFU1VNRSkpDQogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHJldHVybjsNCiAgICAgICAgICAgICAgICAgICAgICAgIC8qDQogICAgICAgICAgICAgICAg
ICAgICAgICAgKiBBZnRlciB0aGlzIHRhc2sgaGFzIHJ1biBleGl0X3Rhc2tfd29yaygpLA0KICAg
ICAgICAgICAgICAgICAgICAgICAgICogdGFza193b3JrX2FkZCgpIHdpbGwgZmFpbC4gIEZhbGwg
dGhyb3VnaCB0byBkZWxheWVkDQogICAgICAgICAgICAgICAgICAgICAgICAgKiBmcHV0IHRvIGF2
b2lkIGxlYWtpbmcgKmZpbGUuDQogICAgICAgICAgICAgICAgICAgICAgICAgKi8NCiAgICAgICAg
ICAgICAgICB9DQoNCiAgICAgICAgICAgICAgICBpZiAobGxpc3RfYWRkKCZmaWxlLT5mX2xsaXN0
LCAmZGVsYXllZF9mcHV0X2xpc3QpKQ0KICAgICAgICAgICAgICAgICAgICAgICAgc2NoZWR1bGVf
ZGVsYXllZF93b3JrKCZkZWxheWVkX2ZwdXRfd29yaywgMSk7DQogICAgICAgIH0NCn0NCg0KSUlV
QywgYmFzZWQgb24gdGhlIGFib3ZlIGNvZGUsIGl0IGxvb2tzIGxpa2UgdGhlcmUgYXJlIHR3byB3
YXlzIGluIHdoaWNoIHRoZQ0KZl9vcC0+cmVsZWFzZSgpIGhhbmRsZXIgaXMgdHJpZ2dlcmVkIGZy
b20gZnB1dCgpOg0KLSB2aWEgZGVsYXllZF9mcHV0KCkgZm9yIGtlcm5lbCB0aHJlYWRzIGFuZCBj
b2RlIGluIGludGVycnVwdCBjb250ZXh0DQotIHZpYSB0YXNrX3dvcmtfcnVuKCkganVzdCBiZWZv
cmUgdGhlIHRhc2svcHJvY2VzcyByZXR1cm5zIHRvIHRoZSB1c2VyLW1vZGUNCg0KVGhlIGZpcnN0
IHNjZW5hcmlvIGFib3ZlIGlzIGRlZmluaXRlbHkgYXN5bmNocm9ub3VzIGFzIHRoZSByZWxlYXNl
KCkgaGFuZGxlciBpcw0KY2FsbGVkIGZyb20gYSB3b3JrZXIgdGhyZWFkLiBCdXQgSSB0aGluayB0
aGUgc2Vjb25kIGNhc2UgKHdoaWNoIGlzIHRoZSBtb3N0DQpjb21tb24gYW5kIHJlbGV2YW50IGZv
ciBvdXIgdXNlLWNhc2UpIGNhbiBhbHNvIGJlIGNvbnNpZGVyZWQgYXN5bmNocm9ub3VzLA0KYmVj
YXVzZSB0aGUgZXhlY3V0aW9uIG9mIHRoZSBzeXN0ZW0gY2FsbCBvciBpb2N0bCB0aGF0IGxlZCB0
byB0aGUgY29udGV4dCBpbg0Kd2hpY2ggZG1hX2J1Zl9wdXQoKSB3YXMgY2FsbGVkIGlzIGNvbXBs
ZXRlZC4NCg0KSGVyZSBpcyBhIHRyYWNlIGZyb20gbXkgbGlnaHQgdGVzdGluZyB3aXRoIHRoZSB1
ZG1hYnVmIGRyaXZlciwgd2hlcmUgeW91IGNhbg0Kc2VlIHRoZSByZWxlYXNlKCkgaGFuZGxlciBi
ZWluZyBjYWxsZWQgYnkgc3lzY2FsbF9leGl0X3RvX3VzZXJfbW9kZSgpIDoNClsgIDE1OC40NjQy
MDNdIENhbGwgVHJhY2U6DQpbICAxNTguNDY2NjgxXSAgPFRBU0s+DQpbICAxNTguNDY4ODE1XSAg
ZHVtcF9zdGFja19sdmwrMHg2MC8weDgwDQpbICAxNTguNDcyNTA3XSAgZHVtcF9zdGFjaysweDE0
LzB4MTYNClsgIDE1OC40NzU4NTNdICByZWxlYXNlX3VkbWFidWYrMHgyZi8weDlmDQpbICAxNTgu
NDc5NjMxXSAgZG1hX2J1Zl9yZWxlYXNlKzB4M2MvMHg5MA0KWyAgMTU4LjQ4MzQwOF0gIF9fZGVu
dHJ5X2tpbGwrMHg4Zi8weDE4MA0KWyAgMTU4LjQ4NzA5OF0gIGRwdXQrMHhlNy8weDFhMA0KWyAg
MTU4LjQ5MDAxM10gIF9fZnB1dCsweDEzMS8weDJiMA0KWyAgMTU4LjQ5MzE3OF0gIF9fX19mcHV0
KzB4MTkvMHgyMA0KWyAgMTU4LjQ5NjM1Ml0gIHRhc2tfd29ya19ydW4rMHg2MS8weDkwDQpbICAx
NTguNDk5OTU5XSAgc3lzY2FsbF9leGl0X3RvX3VzZXJfbW9kZSsweDFhNC8weDFiMA0KWyAgMTU4
LjUwNDc2OV0gIGRvX3N5c2NhbGxfNjQrMHg1Yi8weDExMA0KWyAgMTU4LjUwODQ1OF0gIGVudHJ5
X1NZU0NBTExfNjRfYWZ0ZXJfaHdmcmFtZSsweDRiLzB4NTMNCg0KQW5kLCBoZXJlIGlzIHRoZSBy
ZWxldmFudCBzeXNjYWxsIGNvZGUgKGZyb20gYXJjaC94ODYvZW50cnkvY29tbW9uLmMpOg0KX192
aXNpYmxlIG5vaW5zdHIgYm9vbCBkb19zeXNjYWxsXzY0KHN0cnVjdCBwdF9yZWdzICpyZWdzLCBp
bnQgbnIpDQp7DQogICAgICAgIGFkZF9yYW5kb21fa3N0YWNrX29mZnNldCgpOw0KICAgICAgICBu
ciA9IHN5c2NhbGxfZW50ZXJfZnJvbV91c2VyX21vZGUocmVncywgbnIpOw0KDQogICAgICAgIGlu
c3RydW1lbnRhdGlvbl9iZWdpbigpOw0KDQogICAgICAgIGlmICghZG9fc3lzY2FsbF94NjQocmVn
cywgbnIpICYmICFkb19zeXNjYWxsX3gzMihyZWdzLCBucikgJiYgbnIgIT0gLTEpIHsNCiAgICAg
ICAgICAgICAgICAvKiBJbnZhbGlkIHN5c3RlbSBjYWxsLCBidXQgc3RpbGwgYSBzeXN0ZW0gY2Fs
bC4gKi8NCiAgICAgICAgICAgICAgICByZWdzLT5heCA9IF9feDY0X3N5c19uaV9zeXNjYWxsKHJl
Z3MpOw0KICAgICAgICB9DQoNCiAgICAgICAgaW5zdHJ1bWVudGF0aW9uX2VuZCgpOw0KICAgICAg
ICBzeXNjYWxsX2V4aXRfdG9fdXNlcl9tb2RlKHJlZ3MpOw0KDQpJIGFsc28gY29uZmlybWVkIHRo
YXQgdGhlIHJlbGVhc2UoKSBoYW5kbGVyIGlzIGluZGVlZCBjYWxsZWQgYWZ0ZXIgZG1hX2J1Zl9w
dXQoKQ0KKGFuZCBub3QgYnkgZG1hX2J1Zl9wdXQoKSkgYnkgYWRkaW5nIGRlYnVnIHByaW50cyBi
ZWZvcmUgYW5kIGFmdGVyDQpkbWFfYnVmX3B1dCgpIGFuZCBvbmUgaW4gdGhlIHJlbGVhc2UoKSBo
YW5kbGVyLiBGdXJ0aGVybW9yZSwgSSBhbHNvIGZvdW5kDQp0aGF0IGNhbGxpbmcgY2xvc2UoKSBv
biB0aGUgZG1hYnVmIGZkIGluIHRoZSB1c2VyLXNwYWNlIGlzIG9uZSBzY2VuYXJpbyBpbg0Kd2hp
Y2ggZnB1dCgpIGlzIGNhbGxlZCBzeW5jaHJvbm91c2x5LiBIZXJlIGlzIHRoZSByZWxldmFudCB0
cmFjZToNClsgIDMwMi43NzA5MTBdIENhbGwgVHJhY2U6DQpbICAzMDIuNzczMzg5XSAgPFRBU0s+
DQpbICAzMDIuNzc1NTE2XSAgZHVtcF9zdGFja19sdmwrMHg2MC8weDgwDQpbICAzMDIuNzc5MjA5
XSAgZHVtcF9zdGFjaysweDE0LzB4MTYNClsgIDMwMi43ODI1NDldICByZWxlYXNlX3VkbWFidWYr
MHgyZi8weDlmDQpbICAzMDIuNzg2MzI5XSAgZG1hX2J1Zl9yZWxlYXNlKzB4M2MvMHg5MA0KWyAg
MzAyLjc5MDEwNV0gIF9fZGVudHJ5X2tpbGwrMHg4Zi8weDE4MA0KWyAgMzAyLjc5Mzc4OV0gIGRw
dXQrMHhlNy8weDFhMA0KWyAgMzAyLjc5NjcwM10gIF9fZnB1dCsweDEzMS8weDJiMA0KWyAgMzAy
Ljc5OTg2Nl0gIF9fZnB1dF9zeW5jKzB4NTMvMHg3MA0KWyAgMzAyLjgwMzI5OV0gIF9feDY0X3N5
c19jbG9zZSsweDU4LzB4YzANClsgIDMwMi44MDcwNzZdICB4NjRfc3lzX2NhbGwrMHgxMjZhLzB4
MTdkMA0KWyAgMzAyLjgxMDkzOF0gIGRvX3N5c2NhbGxfNjQrMHg0Zi8weDExMA0KWyAgMzAyLjgx
NDYyMl0gIGVudHJ5X1NZU0NBTExfNjRfYWZ0ZXJfaHdmcmFtZSsweDRiLzB4NTMNCg0KQXMgeW91
IGNhbiBzZWUgYWJvdmUsIHRoZXJlIGlzIGluZGVlZCBhIHN5bmNocm9ub3VzIHZlcnNpb24gb2Yg
ZnB1dCgpIGRlZmluZWQNCmp1c3QgYmVsb3cgZnB1dCgpOg0KLyoNCiAqIHN5bmNocm9ub3VzIGFu
YWxvZyBvZiBmcHV0KCk7IGZvciBrZXJuZWwgdGhyZWFkcyB0aGF0IG1pZ2h0IGJlIG5lZWRlZA0K
ICogaW4gc29tZSB1bW91bnQoKSAoYW5kIHRodXMgY2FuJ3QgdXNlIGZsdXNoX2RlbGF5ZWRfZnB1
dCgpIHdpdGhvdXQNCiAqIHJpc2tpbmcgZGVhZGxvY2tzKSwgbmVlZCB0byB3YWl0IGZvciBjb21w
bGV0aW9uIG9mIF9fZnB1dCgpIGFuZCBrbm93DQogKiBmb3IgdGhpcyBzcGVjaWZpYyBzdHJ1Y3Qg
ZmlsZSBpdCB3b24ndCBpbnZvbHZlIGFueXRoaW5nIHRoYXQgd291bGQNCiAqIG5lZWQgdGhlbS4g
IFVzZSBvbmx5IGlmIHlvdSByZWFsbHkgbmVlZCBpdCAtIGF0IHRoZSB2ZXJ5IGxlYXN0LA0KICog
ZG9uJ3QgYmxpbmRseSBjb252ZXJ0IGZwdXQoKSBieSBrZXJuZWwgdGhyZWFkIHRvIHRoYXQuDQog
Ki8NCnZvaWQgX19mcHV0X3N5bmMoc3RydWN0IGZpbGUgKmZpbGUpDQp7DQoJaWYgKGZpbGVfcmVm
X3B1dCgmZmlsZS0+Zl9yZWYpKQ0KCQlfX2ZwdXQoZmlsZSk7DQp9DQoNCkJhc2VkIG9uIGFsbCB0
aGUgYWJvdmUsIEkgdGhpbmsgd2UgY2FuIGNvbmNsdWRlIHRoYXQgc2luY2UgZG1hX2J1Zl9wdXQo
KQ0KZG9lcyBub3QgZGlyZWN0bHkgKG9yIHN5bmNocm9ub3VzbHkpIGNhbGwgdGhlIGZfb3AtPnJl
bGVhc2UoKSBoYW5kbGVyLCBhDQpkZWFkbG9jayBpcyB1bmxpa2VseSB0byBvY2N1ciBpbiB0aGUg
c2NlbmFyaW8geW91IGRlc2NyaWJlZC4NCg0KVGhhbmtzLA0KVml2ZWsNCg0KPiANCj4gQnV0IGNv
dWxkIGJlIHRoYXQgdGhpcyBpbmZvcm1hdGlvbiBpcyBvdXRkYXRlZC4NCj4gDQo+IFJlZ2FyZHMs
DQo+IENocmlzdGlhbi4NCj4gDQo+ID4NCj4gPiBUaGFua3MsDQo+ID4gVml2ZWsNCj4gPg0KPiA+
PiArICAgIH0NCj4gPj4gK30NCj4gPj4NCj4gPj4gVGhpcyBwYXR0ZXJuIHdhcyBzdWdnZXN0ZWQg
bXVsdGlwbGUgdGltZXMgYW5kIEkgaGFkIHRvIHJlamVjdGVkIGl0IGV2ZXJ5DQo+IHRpbWUNCj4g
Pj4gYmVjYXVzZSB0aGUgd2hvbGUgaWRlYSBpcyBqdXN0IGZ1bmRhbWVudGFsbHkgYnJva2VuLg0K
PiA+Pg0KPiA+PiBJdCdzIHJlYWxseSBhc3RvbmlzaGluZyBob3cgcGVvcGxlIGFsd2F5cyBjb21l
IHVwIHdpdGggdGhlIHNhbWUgYnJva2VuDQo+ID4+IHBhdHRlcm4uDQo+ID4+DQo+ID4+IFJlZ2Fy
ZHMsDQo+ID4+IENocmlzdGlhbi4NCj4gPj4NCj4gPj4NCj4gPj4NCj4gPj4NCj4gPj4NCj4gPj4N
Cj4gPj4NCj4gPj4gCQlBcGFydCBmcm9tIHRoYXQgSSBoYXZlIHRvIHJlamVjdCB0aGUgYWRkaW5n
IG9mDQo+ID4+IGRtYV9idWZfdHJ5X2dldCgpLCB0aGF0IGlzIGNsZWFybHkgbm90IHNvbWV0aGlu
ZyB3ZSBzaG91bGQgZG8uDQo+ID4+DQo+ID4+DQo+ID4+DQo+ID4+IAlVbmRlcnN0b29kLiBJdCBh
cHBlYXJzIHRoYXQgVml2ZWsgaGFzIGNvbmZpcm1lZCB0aGF0IGhpcyB2MiBoYXMNCj4gPj4gcmVz
b2x2ZWQgdGhlIGlzc3VlLiBJIHdpbGwgZm9sbG93IHVwIHdpdGggaGltIHRvIGRldGVybWluZSBp
ZiBoZSBwbGFucyB0bw0KPiA+PiByZXN1bWUgaGlzIHBhdGNoLCBhbmQgaWYgc28sIEkgd2lsbCBh
cHBseSBteSBsYXN0IHBhdGNoIG9uIHRvcCBvZiBoaXMNCj4gdXBkYXRlZA0KPiA+PiBwYXRjaCBz
ZXJpZXMNCj4gPj4NCj4gPj4gCVRoYW5rcywNCj4gPj4gCVdlaSBMaW4NCj4gPj4NCj4gPj4NCj4g
Pj4gCQlUaGFua3MsDQo+ID4+IAkJQ2hyaXN0aWFuLg0KPiA+Pg0KPiA+Pg0KPiA+Pg0KPiA+Pg0K
DQo=
