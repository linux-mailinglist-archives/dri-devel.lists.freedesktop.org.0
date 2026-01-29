Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WHRqGQsHe2maAgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 08:06:51 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B191AC6B0
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 08:06:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECE2D10E7D3;
	Thu, 29 Jan 2026 07:06:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RacL1lqk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A53A10E7D3;
 Thu, 29 Jan 2026 07:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769670407; x=1801206407;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/jtZPLSn91NHPBKiT/UKNwG5nF5NWnoZ9e5KLadxJX0=;
 b=RacL1lqk4ZHjTw56qD1CMuGswCSfL0qmpZ5s962LXIJGjiK7psaoCB95
 kYPYbEcib/xcTs5VERjKocuOyArBhIgPoaH1mINnVF/99o/5ZQARiia/+
 OapyG3g4mvygtiq7KyaVpILnKTBAerH5o4D+jCEbcmeeYvYcvNwDcGYT+
 Xeu2tbF8Ki5zuEhvRCMhZSTDz/DPkVEsgLC5onnKsqwCTCHRVM0sL7l7U
 5g1p3U6gD8HL7zcesBptpKZGsTDh7yJapcvm9AYtCjR+dG5j6VMJbtfPy
 t+NtHyCh8Tmf/T0nWehMAuQjT0o2qaxDQDQnWPvGK1oolOG8/wYT1+bxb g==;
X-CSE-ConnectionGUID: kkvLa5NZSuisyqgoWXCCqw==
X-CSE-MsgGUID: HZsxcENiRJCoZ9O2Xbg1lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="70936778"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="70936778"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 23:06:46 -0800
X-CSE-ConnectionGUID: 9MH7GTlgQtud8ndkh/IghQ==
X-CSE-MsgGUID: Ez5sz+khRB+oPxLDoRUvIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="213039860"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 23:06:46 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 28 Jan 2026 23:06:44 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 28 Jan 2026 23:06:44 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.34) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 28 Jan 2026 23:06:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rIL5swt+zSnJopVV9SD4deGZjWoWs22hqW48/VsTFXA6n8gjcQpy2lFS5M+RKzsq9kvoBMG68b2cuc7MftIObD8QJwQ8fNL2gcB3Odxw5Zg5x246KHKmt4TN7NRoZ4yiFKOCtQZ+tgpwQKHs7SCM38/0QwE+OX8Jv1ppZOi+sgzsiU0wbcBb/Y5uB9yy8VzhTAeEjkcBJ8qXosVxHAh+8YGW2p4IeU9BjjblBUrNqMqJZSytbBs0/gzAmgbRmpDqPVM2fY3h90Jo39aN6x1Ijb2QLJH683j5lWSV0wsB1QxlJ1gq0DQP3JUQWdT/GYCrN0/nTYXTJVcBtfqXJ3YKiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/jtZPLSn91NHPBKiT/UKNwG5nF5NWnoZ9e5KLadxJX0=;
 b=GKCTR6tRNQDOnG+kNnbbGAyr/9yghqd86ob4pYZ7ggAvVi7EVWZSlw15MQTOBmG10MfedhRlHRc4tkN7I6VgPgkq9vfQBqDLoc32CNZYhgith0rBA0+QutO6jSKsSUIi/wE4g7KRSOVP0H6PKSTVkFL/3eFL5vIsBL3iIp0Ucr9Of7Iu6KSE9jTlXUtp61xewjnQxz3qB4Pb2dX8SYkhYZcXKnv9aJgIHzfBRLGVdNGM9OaVLZYnxT5ra7EVvUWsRqv8laL/226rXbLvw7jFj1I6TB+2lj8dbpf6WJZxhVrZqwITG1MdKu67RisslDgpn/+aURLpRdS9hMlYg8iAVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by DS0PR11MB6496.namprd11.prod.outlook.com (2603:10b6:8:c0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.8; Thu, 29 Jan
 2026 07:06:37 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::f997:762f:f079:134f]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::f997:762f:f079:134f%5]) with mapi id 15.20.9542.010; Thu, 29 Jan 2026
 07:06:37 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>
CC: Pranjal Shrivastava <praan@google.com>, Sumit Semwal
 <sumit.semwal@linaro.org>, =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?=
 <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>, "David
 Airlie" <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Gerd Hoffmann
 <kraxel@redhat.com>, Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, "Lucas De
 Marchi" <lucas.demarchi@intel.com>, =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?=
 <thomas.hellstrom@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, 
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin Murphy
 <robin.murphy@arm.com>, Felix Kuehling <Felix.Kuehling@amd.com>, "Alex
 Williamson" <alex@shazbot.org>, Ankit Agrawal <ankita@nvidia.com>,
 "Kasireddy, Vivek" <vivek.kasireddy@intel.com>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linaro-mm-sig@lists.linaro.org"
 <linaro-mm-sig@lists.linaro.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "virtualization@lists.linux.dev"
 <virtualization@lists.linux.dev>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "linux-rdma@vger.kernel.org"
 <linux-rdma@vger.kernel.org>, "iommu@lists.linux.dev"
 <iommu@lists.linux.dev>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>
Subject: RE: [PATCH v5 4/8] vfio: Wait for dma-buf invalidation to complete
Thread-Topic: [PATCH v5 4/8] vfio: Wait for dma-buf invalidation to complete
Thread-Index: AQHcjWW44cZHc/LC3Ey07jDLODM/2bVk8PuAgADKdoCAAH2KAIAChYWg
Date: Thu, 29 Jan 2026 07:06:37 +0000
Message-ID: <BN9PR11MB5276B99D4E8C6496B0C447888C9EA@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20260124-dmabuf-revoke-v5-0-f98fca917e96@nvidia.com>
 <20260124-dmabuf-revoke-v5-4-f98fca917e96@nvidia.com>
 <aXfUZcSEr9N18o6w@google.com> <20260127085835.GQ13967@unreal>
 <20260127162754.GH1641016@ziepe.ca>
In-Reply-To: <20260127162754.GH1641016@ziepe.ca>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|DS0PR11MB6496:EE_
x-ms-office365-filtering-correlation-id: 221b550e-0587-470a-5125-08de5f04f1d4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?ckNRRjZ2VlQwbGszRkdrc05wTmxlRjJvZ001NWlKWlBkYzB2UFQvYXdmRlAy?=
 =?utf-8?B?QUdyYTVETUFBZUZUcXZadDhSeHhacWR2enBMTk5ha3BRM3ppZDlMVHhGYnJL?=
 =?utf-8?B?UDRsNmJXSnl0eEVyVWZIb0phTnc5ZjZMNFc0eGNNV2lUbXlIOGpnNHJSMm4z?=
 =?utf-8?B?cVdvclZqV2VOQ3lPQUUzMkk4MENaRFg2N1o2N05tb1RqaE1CWklySmpJUmI5?=
 =?utf-8?B?RVhsUVJNZFMxaHJjZG01V3YxZ2Q1ZDUwNERKeUV2ME01WE9YejY5RWNsQVVS?=
 =?utf-8?B?MG4zRVEvSWxOQ3hQY0w5Mm9DWENDVDZMWExQQklPNGxWd2tEd1pZeTlLQ2Zm?=
 =?utf-8?B?UVovdUNHMlRYVzdKN2sxMGNZK0E2Wm1oaWoyUnlFaHMwL0l4MkQvYm5LT00v?=
 =?utf-8?B?ZlNZUm9JZSsvY3Z3RS9EdGZMZm1SMFpvZkNpdXU5NXhCZHlVK1hFVHdMelpt?=
 =?utf-8?B?TWozbmVyUDZxQTNiTFhlbGVDY2E2WmFpQ251OTZKYlo4alF3OUhDZlFEWE9i?=
 =?utf-8?B?b3BrVHpmWnMzTSsveW9abDZ6UzhCb1A2djNDYkU5cnBiemQ0UWhxU29pSS94?=
 =?utf-8?B?WmNNamw0L21waXZnY1lqNjZpMjFqSzc4emp6N3BOdkYreTdQK1E5RER3QnlC?=
 =?utf-8?B?M2xNdFFJaENrOCtzTDZRcm83WURmTXQxU1N1ZVN2bTk0cVB6Umw5bFdXaWM4?=
 =?utf-8?B?NHl3QXdlMExjZ2lBd2c1bzBuOEdPdXJ4aTVuN0FoZXluZWIwQkp6SVhuUWd3?=
 =?utf-8?B?ZnNReVA2VTlQV0Q1OWRvZE9aN2xOVXUxRFJuNlRhb1QwNnZJWW9pNWxYRnhy?=
 =?utf-8?B?SXFwVWlzcVUyVmxSQ0ZsL3JLWFdUMGRtQ1d0NmVKTXE3SlY4VWlHUUJCajdj?=
 =?utf-8?B?YmJ6ZzhRdFQrK01WN2YzZzgzeGFzK1U5UUZ4ODRQdE00bVAzajh6cEF0VmZH?=
 =?utf-8?B?WXpScHpGVk5yWVZrMkNuR0ZzeEpMM0kxbUpBczltMkFDcE5hSVZQY1h6dkdU?=
 =?utf-8?B?eHRuRm9FSU1aS1N3TmpXUnBzekpFZE0vSEFMN1IrVzY0bGp3SXc5RTRwcTZG?=
 =?utf-8?B?U0JWWHRuTjJRSWtmN3gxMm9VWnlDQ2RQSzZNVkgzWVl5WkJ5d2VoRld5b0JY?=
 =?utf-8?B?VXA0UEdzK1FPR2NIbnVRclVHVE9kK0xuMHR6cGs2RERsWW93UnFwcU9GbHhZ?=
 =?utf-8?B?VFBGbG1wNXRMS2Y3aUlUTitQUzZhMkpxNW1oeVFoTnVyc045aTNFaDdMOXht?=
 =?utf-8?B?RjlVY3RMU1lqamFKOEMydXJuMGxYNGtvdlhmeTJsUFF6M3ZlbHB4Z1ZzbmVV?=
 =?utf-8?B?SmdnTk5CeUQ5VW0xOSttSGRWVWU3Mnk1bTVCdjNrdnhmMDBPcURaZGNUaFdi?=
 =?utf-8?B?Tlo1VXp2bVZNUklJNGpjaXdlaC9vQmU0dVJ2NWdOSlE2R09SQ2Z1RUU0ejFC?=
 =?utf-8?B?aE9xQitLT2FmYWxTSFNHK1ZOZHFhejV6MXBYMERHRzdTS3FxTENUMWhZN2ZT?=
 =?utf-8?B?eDBXZDh0MkRVSkdadlpnd1VEU2hpbHRtMlU0UUQ1QzRCK0dBckxtcS8xL3Vm?=
 =?utf-8?B?ays4c0Fuanc4S25rM1hvamk3b2xCOGlEUTV0ckQ0dmd4ZlY4dFlFcEdwUytG?=
 =?utf-8?B?SDFDUkloWlU4cTQrelBwTmFUamZROGEwaExXbndvOEVHNEx6VnBXUlBya1dQ?=
 =?utf-8?B?ZVlmenh1NGVPVzBBNi9NVlhraGlscmJ1MmZ2c2Z1MVVMeTIwdm0yaitRSk5i?=
 =?utf-8?B?WnY5ZGh5anBuSFJZc1Jrd3VNc081Z3B2dEc5NGs4RXJQM2p5aFE3RGt4K1hz?=
 =?utf-8?B?NVRldHZrMWFZZ3Bud3AxMko5RVNEUlFnR09rSURPaExsVXZ6L2RORWxtazdJ?=
 =?utf-8?B?VGVGdnl3QUJSQzgwZlJLUzFiS2t3bVZ3MmVGLzdiWXNhTmZLRGExNlRvYncz?=
 =?utf-8?B?c0ZENENhV05KbGQvcHh1QXpxRVB0V091Nms0N2p1Wkx3d2QvQ2tLZ25kcEow?=
 =?utf-8?B?NEdubXZ4NWZiRmpQSllYWGNQanpTRnoxUWxwRDZDU2p3SEUrS0gzbXZpM3A5?=
 =?utf-8?B?VHBvNWJTM041L3ROWTNMRzE0YjdMZVdHUXhLTHY1a0VMT2FXV1R6WnFpUWd2?=
 =?utf-8?B?U0Nma2IyWGVkNnAyTU9vUzRFdEhUV3FZbVlvS2laTHYyMXlvZlBsSWkrT0hT?=
 =?utf-8?Q?628scQYYmIjamKS8CGWEe0M=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UXNicTlSaUNhS3ZwRXRwUTRRZTNsZWR2L3VyVzV0V2dhejcrWDVHWDlZV3Jn?=
 =?utf-8?B?Q0xCT2puaVpFNlRGQTNHNFEvZENFL2NtdElIMDlKMEliWnBDZ0o2d3c3aE1K?=
 =?utf-8?B?Vy9FVzgxR0V1T0Uwc1FHRHAzODA3Z2dGbXZTNlBoUUVueGhmTkJaVnpXQThl?=
 =?utf-8?B?eTl2cXRqWC93Uyt3R2x3Qk9HZDN3N0p1Y0xMb3NvUFRlc05xTExpeVNaSmJw?=
 =?utf-8?B?TE5BNEhKR0lFQ2ptVi9zUWZhSTFpRGJxSlRyVzJQT1VJemRJZlhQVVFycWpy?=
 =?utf-8?B?NUhKdm5FRHBUanJhN0VOVXEwMURXNEMrekFOTEg3eXVjMGlyc0g1SFE5MnUz?=
 =?utf-8?B?MlJQblorYmtVbXQwbkQxOHRmK2czdDE2TFdGNDBSTXd0UngwTDUxREl1YUk3?=
 =?utf-8?B?ZmFuU2hxeFRUUVR4MDlKWk50aXpsU0Y1TkpFR0dUcldMZjE5WXdmWkxhTkVX?=
 =?utf-8?B?dU83cmpMK0d4bzg4dW16NWJzN1VLb08vYnhYYnFKQzBDT1Biekw3Y2NPUU5U?=
 =?utf-8?B?WHdEMFhFeG92WFNRd2orM3JJbndJOWptUERvR1FwWUFBZm5wam9kWFptUEdS?=
 =?utf-8?B?NTM5dld5bmNMWUhDZjIxUWZJRGJ4cG15dzdjZ01SQWhLSVhWclp3UXV4UHVz?=
 =?utf-8?B?K3cwYXVSNlEwT0FHN0lCcC80R3NIalV3QVpGcEZUZGdib3NTWncrN0VzTEJa?=
 =?utf-8?B?c0NpQ1FBYm5LYXpVbnNzSGpXLzAyL2REazVSQ1A3TWNmUEliRmUySllZWjhp?=
 =?utf-8?B?WGdUSzRQV3M4alhXWkE4Z1NvR25iVkVxdWZVTFhYTExsVWg0aWF2MUcvT1FG?=
 =?utf-8?B?emhuOHZRNWlrZnQyWEtVYk12YVBkSjFrYTZJU3MyY24rUFBVZnowUTRYZitz?=
 =?utf-8?B?S1Azc3VXemR5aCtBQXJNZFNjK0Nqc1dvL1VpTDROQjFtN2NUOGtMUXdJd00w?=
 =?utf-8?B?S21VbjVvK1N0K0piT2o2c1hQMFZHUmJLL1Q0TkNNWGFwWEkvU09zTFFxVHRK?=
 =?utf-8?B?TCtrdTZlSmovNENkd1l3UWtNMzZkc1M3Wi8zOUIwNlIxaStxSWVueGVvNW9S?=
 =?utf-8?B?bVhtcjEvM29URW1CSlo5TlVmYUp2QWszeXBKRDhjMmsrZzBIb0p3ekZnRkFN?=
 =?utf-8?B?eStqZVJjQzJlZkRqaW9VSWxjY05CSHFUUUhwcHJjTkEvaGpDN3RkdkI3Rko2?=
 =?utf-8?B?NmVYVHdOMHU3UXMxanhmcis0UXlKUk56KzhKZHN4RklMZHBnc1ZoZ2k1Um1i?=
 =?utf-8?B?aGI3RWNxYlJ3dmJia29Cb1RnUVFYSTFRSmJ3K1Z4R3diQlhnVDJ5WTJsQXJh?=
 =?utf-8?B?Q2hhem1mQ2s5WDN1eUd0WlhiWWp3d2E2YnBLaDFla3B2Nm1HSVFGNERFb0Zw?=
 =?utf-8?B?eDhOcnlHdHhVZFY5WGhaQUlrV0xTSDNvamJKZXFEMkN5NFcwNmJvaFhsU3I4?=
 =?utf-8?B?V2ZQUkREOHh1YW5ST0tRSThYR2h6MithSjR3ZkhIa3IrSGwvL0tUSzd4YUFX?=
 =?utf-8?B?Tjh2WWZFRTdnZlVTTWN1Y1djcGxmMUtUdWlCWkgzaWw5c25wYVZ2d2FKS0ZB?=
 =?utf-8?B?cFVtRERPMzQwZzFJRXIxVHMxZlRUQ2JFblZrbm1NR09ZOHJJTS8wOW53REJV?=
 =?utf-8?B?SDFqL05VQ2tUYWZ4MlFUenFvVGFaU2JjRGJyaFBNbFpCQ2p3OEp6Mm9PZnAz?=
 =?utf-8?B?NEtHWTdMbXFqWks1MXdiMW1RN0RJWnFkQTFEeUlIOGU1aGtkWFJmVUlMTGpr?=
 =?utf-8?B?bGNSZnkrdjF5aXhpU2pxc3k1M0hyTGcrNS8vODZiSmFSdDBrbWNZTDFYUzBH?=
 =?utf-8?B?Z2IwMDI4U0ppYWlWaDdOMDNKOGxaS0RDdHNpWEVITHlXQ0drUCtROExwajF0?=
 =?utf-8?B?MVBjYXhaTGZPNTJVUWR4amRzV1VYMm5ZWkRUOGFHNzE2SkJFSnZaaXJIR2VQ?=
 =?utf-8?B?Q0lOcXl4SzdBeWdyb3lsenpJblNLcEkycVRSUy84NHhrU2lFem95U2dWd090?=
 =?utf-8?B?bHVSdkEyak80NmlJOU93KzNVK0MvaExERTBwaHFJc1pGREc4TnM3ZU5NVmd0?=
 =?utf-8?B?b2lYNHJhM1RwaGpUN2JCMVZtbUpKSHlyUFZmdzdLejk2SHpncDhRU2hERlpn?=
 =?utf-8?B?eUNOOGVvek1kanlaQXIwTG9LeWQ2UGs4S0VsbXBPK0Jrdk9mYUhzbWxYZHB6?=
 =?utf-8?B?WkdZQ2JGeUNJVklXeGxmMmQwZDJoTVRMR0lUcG5ZS2xsT3UyRHZheHFXTjhM?=
 =?utf-8?B?c2hOaENJNHJtaTlyYjR3SHVIUVlZaUc5NUtQdlZxTHdkbXZaemozSm9oRkRi?=
 =?utf-8?B?QWFXWVR5czk3THRsaHdVTzVXTVBBa0RMYkdtWEYvZ1lFK1RuY0pSUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 221b550e-0587-470a-5125-08de5f04f1d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2026 07:06:37.3952 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /E/W3mda87lEpJ6Xyvir9prow2QDTHZSyk+eVGzAgQausWUQ5VhbP3Mecc+TI9bamUqOEdD27RsVL+GSB8wbiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6496
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
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_BASE64_TEXT(0.10)[];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[google.com,linaro.org,amd.com,gmail.com,ffwll.ch,redhat.com,collabora.com,chromium.org,linux.intel.com,kernel.org,suse.de,intel.com,8bytes.org,arm.com,shazbot.org,nvidia.com,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,lists.linux.dev];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[35];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,ziepe.ca:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kevin.tian@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 6B191AC6B0
X-Rspamd-Action: no action

PiBGcm9tOiBKYXNvbiBHdW50aG9ycGUgPGpnZ0B6aWVwZS5jYT4NCj4gU2VudDogV2VkbmVzZGF5
LCBKYW51YXJ5IDI4LCAyMDI2IDEyOjI4IEFNDQo+IA0KPiBPbiBUdWUsIEphbiAyNywgMjAyNiBh
dCAxMDo1ODozNUFNICswMjAwLCBMZW9uIFJvbWFub3Zza3kgd3JvdGU6DQo+ID4gPiA+IEBAIC0z
MzMsNyArMzU5LDM3IEBAIHZvaWQgdmZpb19wY2lfZG1hX2J1Zl9tb3ZlKHN0cnVjdA0KPiB2Zmlv
X3BjaV9jb3JlX2RldmljZSAqdmRldiwgYm9vbCByZXZva2VkKQ0KPiA+ID4gPiAgCQkJZG1hX3Jl
c3ZfbG9jayhwcml2LT5kbWFidWYtPnJlc3YsIE5VTEwpOw0KPiA+ID4gPiAgCQkJcHJpdi0+cmV2
b2tlZCA9IHJldm9rZWQ7DQo+ID4gPiA+ICAJCQlkbWFfYnVmX2ludmFsaWRhdGVfbWFwcGluZ3Mo
cHJpdi0+ZG1hYnVmKTsNCj4gPiA+ID4gKwkJCWRtYV9yZXN2X3dhaXRfdGltZW91dChwcml2LT5k
bWFidWYtPnJlc3YsDQo+ID4gPiA+ICsJCQkJCSAgICAgIERNQV9SRVNWX1VTQUdFX0JPT0tLRUVQ
LA0KPiBmYWxzZSwNCj4gPiA+ID4gKwkJCQkJICAgICAgTUFYX1NDSEVEVUxFX1RJTUVPVVQpOw0K
PiA+ID4gPiAgCQkJZG1hX3Jlc3ZfdW5sb2NrKHByaXYtPmRtYWJ1Zi0+cmVzdik7DQo+ID4gPiA+
ICsJCQlpZiAocmV2b2tlZCkgew0KPiA+ID4gPiArCQkJCWtyZWZfcHV0KCZwcml2LT5rcmVmLA0K
PiB2ZmlvX3BjaV9kbWFfYnVmX2RvbmUpOw0KPiA+ID4gPiArCQkJCS8qIExldCdzIHdhaXQgdGls
bCBhbGwgRE1BIHVubWFwIGFyZQ0KPiBjb21wbGV0ZWQuICovDQo+ID4gPiA+ICsJCQkJd2FpdCA9
IHdhaXRfZm9yX2NvbXBsZXRpb25fdGltZW91dCgNCj4gPiA+ID4gKwkJCQkJJnByaXYtPmNvbXAs
IHNlY3NfdG9famlmZmllcygxKSk7DQo+ID4gPg0KPiA+ID4gSXMgdGhlIDEtc2Vjb25kIGNvbnN0
YW50IHN1ZmZpY2llbnQgZm9yIGFsbCBoYXJkd2FyZSwgb3Igc2hvdWxkIHRoZQ0KPiA+ID4gaW52
YWxpZGF0ZV9tYXBwaW5ncygpIGNvbnRyYWN0IHJlcXVpcmUgdGhlIGNhbGxiYWNrIHRvIGJsb2Nr
IHVudGlsDQo+ID4gPiBzcGVjdWxhdGl2ZSByZWFkcyBhcmUgc3RyaWN0bHkgZmVuY2VkPyBJJ20g
d29uZGVyaW5nIGFib3V0IGEgY2FzZSB3aGVyZQ0KPiA+ID4gYSBkZXZpY2UncyBmaXJtd2FyZSBo
YXMgYSBoaWdoIHJlc3BvbnNlIGxhdGVuY3ksIHBlcmhhcHMgZHVlIHRvIGludGVybmFsDQo+ID4g
PiBtYW5hZ2VtZW50IHRhc2tzIGxpa2UgZXJyb3IgcmVjb3Zlcnkgb3IgdGhlcm1hbCBhbmQgaXQg
ZXhjZWVkcyB0aGUgMXMNCj4gPiA+IHRpbWVvdXQuDQo+ID4gPg0KPiA+ID4gSWYgdGhlIGRldmlj
ZSBpcyBpbiB0aGUgbWlkZGxlIG9mIGEgbGFyZ2UgRE1BIGJ1cnN0IGFuZCB0aGUgZmlybXdhcmUg
aXMNCj4gPiA+IHNsb3cgdG8gZmx1c2ggdGhlIGludGVybmFsIHBpcGVsaW5lcyB0byBhIGZ1bGx5
ICJxdWllc2NlZCINCj4gPiA+IHJlYWQtYW5kLWRpc2NhcmQgc3RhdGUsIHJlY2xhaW1pbmcgdGhl
IG1lbW9yeSBhdCBleGFjdGx5IDEuMDAxIHNlY29uZHMNCj4gPiA+IHJpc2tzIHRyaWdnZXJpbmcg
cGxhdGZvcm0tbGV2ZWwgZmF1bHRzLi4NCj4gPiA+DQo+ID4gPiBTaW5jZSB0aGUgd2VuIGV4cGxp
Y2l0bHkgcGVybWl0IHRoZXNlIHNwZWN1bGF0aXZlIHJlYWRzIHVudGlsIHVubWFwIGlzDQo+ID4g
PiBjb21wbGV0ZSwgcmVseWluZyBvbiBhIGhhcmRjb2RlZCB0aW1lb3V0IGluIHRoZSBleHBvcnRl
ciBzZWVtcyB0bw0KPiA+ID4gaW50cm9kdWNlIGEgaGFyZHdhcmUtZGVwZW5kZW50IHJhY2UgY29u
ZGl0aW9uIHRoYXQgY291bGQgY29tcHJvbWlzZQ0KPiA+ID4gc3lzdGVtIHN0YWJpbGl0eSB2aWEg
SU9NTVUgZXJyb3JzIG9yIEFFUiBmYXVsdHMuDQo+ID4gPg0KPiA+ID4gU2hvdWxkIHRoZSBpbXBv
cnRlciBpbnN0ZWFkIGJlIHJlcXVpcmVkIHRvIGd1YXJhbnRlZSB0aGF0IGFsbA0KPiA+ID4gc3Bl
Y3VsYXRpdmUgYWNjZXNzIGhhcyBjZWFzZWQgYmVmb3JlIHRoZSBpbnZhbGlkYXRpb24gY2FsbCBy
ZXR1cm5zPw0KPiA+DQo+ID4gSXQgaXMgZ3VhcmFudGVlZCBieSB0aGUgZG1hX3Jlc3Zfd2FpdF90
aW1lb3V0KCkgY2FsbCBhYm92ZS4gVGhhdCBjYWxsDQo+IGVuc3VyZXMNCj4gPiB0aGF0IHRoZSBo
YXJkd2FyZSBoYXMgY29tcGxldGVkIGFsbCBwZW5kaW5nIG9wZXJhdGlvbnMuIFRoZSAx4oCRc2Vj
b25kDQo+IGRlbGF5IGlzDQo+ID4gbWVhbnQgdG8gY2F0Y2ggY2FzZXMgd2hlcmUgYW4gaW4ta2Vy
bmVsIERNQSB1bm1hcCBjYWxsIGlzIG1pc3NpbmcsIHdoaWNoDQo+IHNob3VsZA0KPiA+IG5vdCB0
cmlnZ2VyIGFueSBETUEgYWN0aXZpdHkgYXQgdGhhdCBwb2ludC4NCj4gDQo+IENocmlzdGlhbiBt
YXkga25vdyBhY3R1YWwgZXhhbXBsZXMsIGJ1dCBteSBnZW5lcmFsIGZlZWxpbmcgaXMgaGUgd2Fz
DQo+IHdvcnJ5aW5nIGFib3V0IGRyaXZlcnMgdGhhdCBoYXZlIHB1c2hlZCB0aGUgRE1BQlVGIHRv
IHZpc2liaWxpdHkgb24NCj4gdGhlIEdQVSBhbmQgdGhlIG1vdmUgbm90aWZ5ICYgZmVuY2VzIG9u
bHkgc2hvb3QgZG93biBzb21lIGFjY2Vzcy4gU28NCj4gaXQgaGFzIHRvIHdhaXQgdW50aWwgdGhl
IERNQUJVRiBpcyBmaW5hbGx5IHVubWFwcGVkLg0KPiANCj4gUHJhbmphbCdzIGV4YW1wbGUgc2hv
dWxkIGJlIGNvdmVyZWQgYnkgdGhlIGRyaXZlciBhZGRpbmcgYSBmZW5jZSBhbmQNCj4gdGhlbiB0
aGUgdW5ib3VuZGVkIGZlbmNlIHdhaXQgd2lsbCBjb21wbGV0ZSBpdC4NCj4gDQoNCkJlYXIgbWUg
aWYgaXQncyBhbiBpZ25vcmFudCBxdWVzdGlvbi4NCg0KVGhlIGNvbW1pdCBtc2cgb2YgcGF0Y2g2
IHNheXMgdGhhdCBWRklPIGRvZXNuJ3QgdG9sZXJhdGUgdW5ib3VuZGVkDQp3YWl0LCB3aGljaCBp
cyB0aGUgcmVhc29uIGJlaGluZCB0aGUgMm5kIHRpbWVvdXQgd2FpdCBoZXJlLg0KDQpUaGVuIHdo
eSBpcyAidGhlIHVuYm91bmRlZCBmZW5jZSB3YWl0IiBub3QgYSBwcm9ibGVtIGluIHRoZSBzYW1l
DQpjb2RlIHBhdGg/IHRoZSB1c2Ugb2YgTUFYX1NDSEVEVUxFX1RJTUVPVVQgaW1wbHkgYSB3b3Jz
dC1jYXNlDQp0aW1lb3V0IGluIGh1bmRyZWRzIG9mIHllYXJzLi4uDQoNCmFuZCBpdCdkIGJlIGhl
bHBmdWwgdG8gcHV0IHNvbWUgd29yZHMgaW4gdGhlIGNvZGUgYmFzZWQgb24gd2hhdCdzDQpkaXNj
dXNzZWQgaGVyZS4NCg==
