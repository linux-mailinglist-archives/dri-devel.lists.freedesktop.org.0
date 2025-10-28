Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D98C12ABF
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 03:33:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32F7A10E15A;
	Tue, 28 Oct 2025 02:33:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="joRANmOT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5811F10E064;
 Tue, 28 Oct 2025 02:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761618806; x=1793154806;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YbzFjT8ZH4Y0+pJhVTAcAVBhk7czm6PBz0Oow+bI3tA=;
 b=joRANmOTti1GcBjb1zLxSU1kWhwf7ds5XkiGZkZrmK1yMArZdRxlzWMV
 J31B9ugs5SFNPTPMKMNgNqLmU+SHh8ao9y4cCYvu0qKfOHF8yf0c1USo3
 7siIVldHwEvKMknsLrBzzEw19KB1k1C0pQcubag4pyc2MaBLPaYzzVS84
 Xg2LEfFYnAx7AwDvdbeXqQTCdaVzM7jrJrV6G75gUK+Mx2l70BHcTNS3+
 1ASuIrFbiXcT61wPI9OnlfMRrWlWRCa0JnbrHUGUadud6RG/lhvLdaRAi
 AzHW7/you6hjIN82SQdSpX01RXjymlmQfP5SCBQZkLEvcX3CcBPTPhbT2 w==;
X-CSE-ConnectionGUID: ql3dVH/BR5W4fhcTLt+MpA==
X-CSE-MsgGUID: l3MRgSYMSsCqQOQDwHuwaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73997384"
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; d="scan'208";a="73997384"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 19:33:25 -0700
X-CSE-ConnectionGUID: EpVgXfaUSAWcq8fE6uZHpA==
X-CSE-MsgGUID: S+yCKW9cRDGI0Y/3VRZ/wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; d="scan'208";a="184845639"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 19:33:25 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 19:33:25 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 27 Oct 2025 19:33:25 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.58) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 19:33:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kV1YbJdfDOLn+ODY6/+VTFOV6jDf0HvrIAs3pVpiPFQjHb2TW1LJPKxxBiYCZF4kpelGp7NIuIOzstzbmzJ3ZubWsCfjEt6LvKOQrsGtcWnQujmVXSO1+QaXpZnVyeMfTlUeuLxwZg2qbmHXA2HXp0hXsVD2xTPo+UFA858O4nRE+aMcgNsmQCS8TsvCONESv4zwI3LgmQwALF08N8Da/FzSIBtb9915kGBzP6lUGz5efeJAgrIZZXTHVQKkCJ3NAAgWkdACTV3lElP49s+jy1reJTY3N/aojkbWn+DvA/Go2E6MO/JBqJ5IZIJ9PnTxVRP/T3og1e9nUCX/A/LeWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YbzFjT8ZH4Y0+pJhVTAcAVBhk7czm6PBz0Oow+bI3tA=;
 b=E3D3e0yv9l/1KE9jAIqYbiBW3QLeTWwLA3uCh1S5wYBfBxdKXYcDx8bitYGFSaHlJwKKPhFtJ4YHHp+5v5o7C9Dd087rNH7qNfR0NcnlljychMmDeR65GFvBZTCyvcEBCkFbjbkJyGB97Suoq4tjrEJEgta6aduFgOPgsYJkiSEIk+CSKeThk6AybfQqC1CFG4zWt2H+fJhYIJOaQxFDoNcSRHeTfn1rR83+n5d7e+Ai2qK8jyOkKc1kKcPZ6WYZ+qjrig/QiwhlsHOwA4KgKtje4Dg81rDMD2ziYpQPOC/27peBn9gjcMuLEBSzgSpe4ynST0p38fgAnBdq/o98Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by BL1PR11MB5302.namprd11.prod.outlook.com (2603:10b6:208:312::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.19; Tue, 28 Oct
 2025 02:33:22 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1%5]) with mapi id 15.20.9253.018; Tue, 28 Oct 2025
 02:33:22 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Winiarski, Michal" <michal.winiarski@intel.com>, Alex Williamson
 <alex.williamson@redhat.com>, "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Yishai Hadas <yishaih@nvidia.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "Brost, Matthew" <matthew.brost@intel.com>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Jani
 Nikula" <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Laguna,
 Lukasz" <lukasz.laguna@intel.com>
Subject: RE: [PATCH v2 01/26] drm/xe/pf: Remove GuC version check for
 migration support
Thread-Topic: [PATCH v2 01/26] drm/xe/pf: Remove GuC version check for
 migration support
Thread-Index: AQHcQtv0wzD7Xj9wv0+t56HoTZJw9rTW4CSA
Date: Tue, 28 Oct 2025 02:33:22 +0000
Message-ID: <BN9PR11MB5276FD0CBCA1AF1E63351A188CFDA@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20251021224133.577765-1-michal.winiarski@intel.com>
 <20251021224133.577765-2-michal.winiarski@intel.com>
In-Reply-To: <20251021224133.577765-2-michal.winiarski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|BL1PR11MB5302:EE_
x-ms-office365-filtering-correlation-id: af21e0c1-f22d-4107-4b58-08de15ca5cf7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|7416014|1800799024|921020|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?MlR0aC9lcHJGa3JUdVdVL0ZhajljMzUvWWh3VGxtdzZieS9yVkdnR3k5a1FE?=
 =?utf-8?B?Nm9VUjZFVlZyUzAwdHh3SVF3c0srNFZqbkhFdmMzUzcwRVlGMURORFVTMHk5?=
 =?utf-8?B?K0JwSHgxT1ByMmMvdlhoelcyWVNmMHhGZ3RmYXVzM0VHZkZMcmh2ZHZwSzla?=
 =?utf-8?B?MENESVlOVEh5NGk3dHF5UnRqUEhkeVUyUzREOS9nRlpoSnk5bHEwTklWMHVj?=
 =?utf-8?B?dHB4ZU9Wd2FEOEtlWFI0aGV5ZDBiRkRJR0g0c2kwNUNCSVY4encrVWtwSlZh?=
 =?utf-8?B?NzhYRzVlUjNpNUpoSnp5VVhESWYyOThsSk5XNTlsZnMvT0xkbFV4bVp4blJ1?=
 =?utf-8?B?bzRPSkxzRy9WTHJ2ZkdJd1l0UFBtWHdzVFY5T00yWjNWNzJxejJBbExBU2FH?=
 =?utf-8?B?NlVGcEI5a1lwOU5YZzVGUzMxa0hIVmlWQXJZaXJQbk5LR0NzdUxzNUZsVEkw?=
 =?utf-8?B?OUY3QlpOTUJVNWxCTWRVUjQ5L3A3KzFwSVZ6ZiswL1dOeDdDQXpMbHFFc2s3?=
 =?utf-8?B?OTR5THJQbFV3ZzVrQ0h5enByOTFCUktEclFNa2ZpaFFhVFdQQWZhWkNrSUU4?=
 =?utf-8?B?KzB3aUhjeEFDY21lRGIzWEdHdWtzaU8rYit3OXlVaENORnV2UDdDRXcrVGRt?=
 =?utf-8?B?ZnBGVWVqYzRBaXVUUXpRK2kyWERVaUcrUzVrMWlMeUNsbVpvRnlFd3o3bXdh?=
 =?utf-8?B?UytIVkhnNmFYL3cyc0g2K2pnemJlTkFLekR6MklDZ1VXWkF3cnB5ZXFLbFo3?=
 =?utf-8?B?OGl2NWQvQTFidzI5OUV0bzRTTElneStXTmoxNFAwWTREZVVlL3lYNWlFSDZy?=
 =?utf-8?B?QmdQdDQ0VzlVaG5PZ1NkanEzZS9Gd09rZzY1TU5wUFUyZERiV1NMMGNjY2JY?=
 =?utf-8?B?OGw0M0NXYVl5bktudzJtdWhtU0pQQTNZQ3hqTnJHTFVQeVhJdDZ1cEwwV1Ra?=
 =?utf-8?B?NGxBaCtFcDg2WDZLbldIRzF1MUdDaXY5UHp4VDUvSzRSVDg3L0NoT3ZLTlpG?=
 =?utf-8?B?L1FrcllXbEpWRGlSNzFxdEtZdyt4Y0VrRjNzTGY1V3VCOTVYMG5Bc2t1Zkw3?=
 =?utf-8?B?MG02TVMxdlRNQVNQWnZjbVZ4VlpTZEFnbEZIM0dxTFp6ZnNxUVJmdXMxZXF2?=
 =?utf-8?B?ejRpdi9oc29LSEhlMG1UbllNN2ZERSs3QUVmNGl6MUlQV2VNei96eEx0U09k?=
 =?utf-8?B?MW1CRVdUVE00akNHN1p0TUpsT3lJQlRkRi9UQ3JZZktGSjZ1SVcwNmN2d3M0?=
 =?utf-8?B?amJ4b2l2Y2FJTzFwWTQ5ZTBQTUUzb09VRGNYR1lpbnVORVV6UkUrcXZURit5?=
 =?utf-8?B?TjRHVElhcjJ0NXkxWDJnTU9aRmtKc1ZOcER4UEhLbVc2TCttaWtYWTVwRVZB?=
 =?utf-8?B?cFpXNVZGcjR1V2tLb04rY2kvVkRXWitCcEp6WU9jWUFnQjR3MjV2VHZWb05w?=
 =?utf-8?B?elRhN09lbnV1Rm80Znh2VFpKYUt4U1JKUEU3aWFwRUJYL1MwUDcxNkUxeGU4?=
 =?utf-8?B?VXcxWEttVXRjODZManJpS3BNcmtaUjY3MUR2YzAwbXJUYloyOEJPeHlINjN2?=
 =?utf-8?B?eWZOZ3IzSHlRekIzRWlPUHphNGJVUFpIaXE4Q3dnODFidW9HNk9vS0pFVVBS?=
 =?utf-8?B?bExGV3R5enN5R0NBenhNVC9Zd2V6aEFHejRvTEZLQjlHMXpTUGEwYkRTaXZ6?=
 =?utf-8?B?aUlteVV5WVNnaUpDRWRyR2J6RGh5NFdqeGhtS0FLVWh2ekRxcGFQakRoVVZH?=
 =?utf-8?B?ZVVzci9NbmJGREQ3MnVLQlVDSFpVZllqRStDbzA4TmdCUC9tMWFXM0lSWU1j?=
 =?utf-8?B?Q1RWM2NxQzU1K01VTmNQd2RmcHoxc3Jtd3NJV0pEZC9iTWxGRGMrbTVGTUVQ?=
 =?utf-8?B?Y0RHeFRydFJGK0RyeDU2aUNLd1NHMGY3di8xZjRhSmY4dWkydzgwNU9Fc0Ro?=
 =?utf-8?B?M05rN3c5am1Fa3ZidmlXQ2dIdC82a1NjeG9WSW9jaExtMlNPa3VmcXpTbllE?=
 =?utf-8?B?NCtiYlpRYStLRzgvNGdTU1F3UHQ4eDdQRzJZZmJGZkNRQ2FSdXVnYzkxUlJV?=
 =?utf-8?B?amlNckZkWTE4M1UrNDhoRWpZNzZ3VnU3SExvdz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(7416014)(1800799024)(921020)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OVIvNDgxR1Q3QmdPc0hGekgzY1VPQzBzMXJkY1cvdnBWOVpudFIzRDEyeXQr?=
 =?utf-8?B?NmRiTWcrWEhqRENSU3F0eDNZdjVDQzRueU9LVWNlK3o3Tlc0U296cmdpK2pl?=
 =?utf-8?B?RlJodDN3ck5QM3BjTkpWOGdxVExoN2xyTGdPYk9DZi8zVnNxcDJteXNNQUdF?=
 =?utf-8?B?UUY1TGJ4KzdpanNESTBTSHVsRUVhdFk3RWk5MFoycHZvaFdFTENlVkpiMVd6?=
 =?utf-8?B?MGZuZEVOMis5a01ZeCtsUDd3cFBKUmJ6dVVVZ3ZmLzZ1ZmJ1b29JdXhtallR?=
 =?utf-8?B?N3VEQk9xUFRGNFdpRkYzUHB2T2h5bXltRFhIcVp4b1ZmUFJleUhKZnpqUTAw?=
 =?utf-8?B?eW5UUnV2cEpyTEVoNkdoUHNsMFRHVStBeDNVUmtxT2I5Uk41VmxWa0pYelpw?=
 =?utf-8?B?bXdFVVlKdnB2QUZaZGdxQkgydVlmUUNEL1I0N3RVblZVVk1yNEVkak5TL2N4?=
 =?utf-8?B?L3F2enVuSkt4TjNJbnpDKzdXRHhQNFBmU2svaHpoY05YbU5hRFlYYXZXK0pv?=
 =?utf-8?B?Y2t4dWNyUHBzMVlXZHJxaHdMQmNIdVp2QkhWWE5nbTVrL1FvM1dtSUpGSzFW?=
 =?utf-8?B?cTEvaEVDcCt0eS9Jc2dxVTFqZzh4S2N6SjB5MEoyZ09uajQwaDhjZ2luYmZ3?=
 =?utf-8?B?Q0tRMmJheUpiU0NwZTIyQktjY3gwN3ZINUFWWU5seVY5dE1rQW5RcUEvOXFG?=
 =?utf-8?B?bGJpZjV1Qk9wQVZNMXBTZVd4eStQeEUxa0RaR1c1eVZzVEJpNE1BdmR1R1E1?=
 =?utf-8?B?OGVaV2VORWF3S1FOYmZMdzhjaWZsQURoRlpzSWMzbHUwOUJ4cTB6YmFsa25t?=
 =?utf-8?B?TjNqb0xhbzFtUUxURExXWEl6YTllZU9vYzI3Z2NoakNRVjNwTWtLUCtYckNx?=
 =?utf-8?B?b2tqQ0VFSUY3OTRzNW0zb2oxaTVoODVKSjE5SjRibzduWDNrNkp6ajFCaDlv?=
 =?utf-8?B?MTNGMXdmUEVheStHSHlINkJ0UzJnakd6RU1FRktjTkUrd3ZWS0NWTlEvei9D?=
 =?utf-8?B?bnU0MGw2OERTUFVjRWFoUU9iU3pSTUZRSzhhTXlxZzRMU0VxODhVNndsdEdw?=
 =?utf-8?B?SjAwZTFmTDZ2ci9vY0FMejQzQXJPb0hDZ3NPYjM4cUYwblBjWG8rZmMyQWtD?=
 =?utf-8?B?NFdvck9HZ3hDVW1jTW5HeUd2cVM0eC9wQ3NuUENBZmd0OWpmUmhQTkU5cFpZ?=
 =?utf-8?B?OWpzMkhub2xjY3h5aHhpblVzM2MwL1NZdzg1VDhBb1U3WVh4cDRSWURneTlB?=
 =?utf-8?B?aWJNNElsdXdlZ3FVWGdPOHpXRnFFYWpucXlzcFdsckFONTB4VHM2SEE3dGFX?=
 =?utf-8?B?NW9WY2xPZ255NDhLRnFwSUlOSXU2cG1sUXVPeG1mKzN1Z1d2K2JyWU4xdVlJ?=
 =?utf-8?B?QURFU1JVdG9WeWRybDlSZzlFeU80YjduR1drZ0ZIekxFTDNFQUx4djVWRlBt?=
 =?utf-8?B?bDZQUjcxY3FEUVU2QXd6bndqSHdPZDJ6K1UrSkZLeEg0RldjdlRvdlF4Rmp6?=
 =?utf-8?B?Sjd0TndBd1JqWTV1MDJtNjMrUkVBOEJTVC8rc2Z6cWNvcFgwS2tVVTN3Mzg3?=
 =?utf-8?B?WUVxMUN6TWNkNFZvN21wbWo2MG13R3pLMmV3VW1WekNLQXdpQnczeU42NmZE?=
 =?utf-8?B?eUo1c3UwRzMrV2s3UFRpUTBVVkVGQkdLa0VJMGJZYWw5Z3ByN1UrZHlJTzAx?=
 =?utf-8?B?amR6MTFIblNyTkd0RitXbWs1QjVnb0dodVVwejZMd3hpOUVTRExJTGI5MmVJ?=
 =?utf-8?B?MmtlaXUwdjAzRE9JdDY1cjJOTnZla01EQm9vT2FDTlFHYU1SSHpMZTh6M3hM?=
 =?utf-8?B?L1E5YlRsaEJqdThwc1FadTdQeXdoWk5OUWszSFExTHpYM1hSb0VNcW1aK1Av?=
 =?utf-8?B?SkNBSTY1V214Ris5Q3AwaUJGcUlBM2ZHN2hDYU5xYnJ1U3o2VnpxdWRmU1h0?=
 =?utf-8?B?cVJHU3FQTlBSU0czQ2x5eHgrNGFsdXdkNzlpN1NjY1pZckFLOFNCcEtZUitY?=
 =?utf-8?B?S2FKRHhxblVRTGcreGx6Umt0YnJaWm5TV1lDYzhtL05uYkRaT3plZGVBUnll?=
 =?utf-8?B?c0U3WGcyWlJnVGRjUVlVa0lIVWV3cmswRzkzUFN3Yk1nQ3Q4aG9rY3dHNFdR?=
 =?utf-8?Q?3OLrwSdadaqd1OzfGVQQAcz/3?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af21e0c1-f22d-4107-4b58-08de15ca5cf7
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2025 02:33:22.0381 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vVCrG/lg9EWa5rCkqsDyXdRus4Vn83DyHoZXeM46r6MnrpWaJRHYIIl7X5VE60ivVnpxdyu9i7naNMxMJsH+Pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5302
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

PiBGcm9tOiBXaW5pYXJza2ksIE1pY2hhbCA8bWljaGFsLndpbmlhcnNraUBpbnRlbC5jb20+DQo+
IFNlbnQ6IFdlZG5lc2RheSwgT2N0b2JlciAyMiwgMjAyNSA2OjQxIEFNDQo+IA0KPiAgc3RhdGlj
IGJvb2wgcGZfY2hlY2tfbWlncmF0aW9uX3N1cHBvcnQoc3RydWN0IHhlX2d0ICpndCkNCj4gIHsN
Cj4gLQkvKiBHdUMgNzAuMjUgd2l0aCBzYXZlL3Jlc3RvcmUgdjIgaXMgcmVxdWlyZWQgKi8NCj4g
LQl4ZV9ndF9hc3NlcnQoZ3QsIEdVQ19GSVJNV0FSRV9WRVIoJmd0LT51Yy5ndWMpID49DQo+IE1B
S0VfR1VDX1ZFUig3MCwgMjUsIDApKTsNCj4gLQ0KPiAgCS8qIFhYWDogZm9yIG5vdyB0aGlzIGlz
IGZvciBmZWF0dXJlIGVuYWJsaW5nIG9ubHkgKi8NCj4gIAlyZXR1cm4gSVNfRU5BQkxFRChDT05G
SUdfRFJNX1hFX0RFQlVHKTsNCg0Kd2h5IHB1dHRpbmcgaXQgdW5kZXIgYSBkZWJ1ZyBvcHRpb24/
IE5vdyB5b3UgYXJlIHNlbmRpbmcgZm9ybWFsDQpzZXJpZXMgZm9yIG1lcmdlLCBhc3N1bWluZyBn
b29kIHF1YWxpdHkuDQo=
