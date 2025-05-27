Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A42F5AC4809
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 08:03:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2374210E0BE;
	Tue, 27 May 2025 06:03:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="goQatF+G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F46F10E0BE;
 Tue, 27 May 2025 06:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748325796; x=1779861796;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3I/bR8/MGf83ETcfdDWDPN805UWlnqxSgvCjZXzdjOo=;
 b=goQatF+GNDf9Ekto0TM0uPr5dDTA6d/8re9zrDuThPux3KOW8SK/2/rL
 fdA9x0FG9PeW5ukfNup8OBbKcmw1y+IzAQ6IwedNkggeCRzeGGjSFo54G
 5fHkhjc84CUlAVH3P+bBx8zjACxY5tkIUooplOCqovPaldvsCNmsBn5wX
 Vo+mTNahTN7iXbub+iqP7EazyLPhiIhPihq8TJjuUftURQuimhssbSwCu
 8wQqI0dJOCZQNtijkFQ+AeBy5XY5J4zFrHtGo3sMRrQGl8wLyYPrpNOG4
 DimKwcoUe3iocUaCehvpNVp9JMafpt5Zb39tbBdeJeGGyTnrPjEwZSoo0 w==;
X-CSE-ConnectionGUID: +LYAC19vThmT0Qe1rdIAvA==
X-CSE-MsgGUID: 4qr/YZcJRny8gDr71+F0sw==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="54105156"
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; d="scan'208";a="54105156"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 23:03:15 -0700
X-CSE-ConnectionGUID: H1Yk1kXZRTuzwUqWc/AQCg==
X-CSE-MsgGUID: uSizkwUzRjyZtbvx/Enxdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; d="scan'208";a="143629299"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 23:03:15 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 26 May 2025 23:03:14 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 26 May 2025 23:03:14 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.77)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Mon, 26 May 2025 23:03:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qGeMdAU16T7lgGLFJ/G3QRgDaQA8U6lw2MaVBfpFNKjeSn+WsQJ6sEh3pAXVjHHgBeKLWff8QSRmlgwzhFC0TDKEnHSaBtgcz6qU7Bw1I/JatCbICTYZ+W5rgEPJQ7I/Be7ifyMOeGgXxrrCTk+YRgIleNF/WpiG+EyjLF2c7a+Hm8RHQzsiqO+6gM6zZ8HfvMA8ExSEfhBmXiigUMzVrDqa3LKHRS+bddzFjNLK00/OLU5K2etE99+d7HuYk8rPJIxqpTqtXsod8zFKudl/0rC4ieiy0ZdqEHy/GXCR0CRthQNe+EfvDHJ6P1MBW6t0s5ss6fgPx1K0xjQomEfWqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3I/bR8/MGf83ETcfdDWDPN805UWlnqxSgvCjZXzdjOo=;
 b=FuGzbJI1rqfD7PNqWETqZBdGjDuO8fNupzq/Ttg1sitwfDObrXlCyqxvxzWV9SAbKx1ArBl1/0MZAdglMFYu3xssOusbz8CKyTabYCzNIXrzVfZq60U95E1qb2+b0MK6CV6v95R5J9DCXe8CZscKdHxtrQ3f87TrvrNDEASfRi50PWGDLFQ/9z7AgwFTxzhi3knJVWanbkdQrmdCBSBpJg66NEU4DJyJsQ9ja7+tNd/mZ0CoJO4k6Q0IqZIGGlp2m8E1tK9e8CAFNtmnwhLdoMs79ZJjLbBMc4OsfV7kM1Hk9ZBEbSqv+otqbiA/ZfBqf5Xa1AkdwzcHheXaoXzwwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by PH7PR11MB7513.namprd11.prod.outlook.com (2603:10b6:510:270::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Tue, 27 May
 2025 06:03:10 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778%3]) with mapi id 15.20.8769.022; Tue, 27 May 2025
 06:03:10 +0000
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
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v10 05/10] mtd: intel-dg: align 64bit read and write
Thread-Topic: [PATCH v10 05/10] mtd: intel-dg: align 64bit read and write
Thread-Index: AQHbxaAO6msK8Xh6mkibgjY+bDZsc7PhmnQAgAR0I3A=
Date: Tue, 27 May 2025 06:03:10 +0000
Message-ID: <CY5PR11MB636674D63B2769B15A79B172ED64A@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20250515133345.2805031-1-alexander.usyskin@intel.com>
 <20250515133345.2805031-6-alexander.usyskin@intel.com>
 <aDGZCL_B3fEkvahj@black.fi.intel.com>
In-Reply-To: <aDGZCL_B3fEkvahj@black.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|PH7PR11MB7513:EE_
x-ms-office365-filtering-correlation-id: a9563a4e-608c-4db7-2beb-08dd9ce428de
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?dGtneldBaVpTMGtHM3lRZi9Fa3l5eHNUTTZlYlAvZG1KZHgvaUVrV3g1TlFI?=
 =?utf-8?B?c3RKdFZHMWFibWk2R1hRaHYxSTRwMGgvRklUR1QwbGxzVzc1Q0tUeDRnVDBq?=
 =?utf-8?B?dkJMbWJ0QU1rNlJ2TjVmWW01Z0k4K2hPanQ0Z2Y5RGtRcW5BTnJ0ejZnc2ZE?=
 =?utf-8?B?ZjlWTi91cS84UDRZUlZhb2RIY3hLUy91NVZQVUt4RlN5MTh2am14NmVLM2pn?=
 =?utf-8?B?Ym1VcDI0c0RnRnppKzYrOWJjWTNFQlUwU3N1Z0xsWWFLQTgxbENOeklVcTBl?=
 =?utf-8?B?UWU0K0NrNHoyY1VFcERwKzJOVVlQT3NXdFZ6U1NNb255WFB5TzIzWGcvRG5J?=
 =?utf-8?B?TTJxL3BiV3JuL05HOGdWd1Nrb2o3cHZPcU1VRzZPc0UxVlQ5VjNhM1BNeGdo?=
 =?utf-8?B?VENhT3dCT2NraWFpNjlSZXRxbW9oT1BqRVhiYXJhK1dTeExjMGZvaHh0cUJO?=
 =?utf-8?B?KzUwdnpNWEF0cDRVUVVsaW5tbGV5N3ZvWjBSaHptQ0V2OWl6bHZTSUpwZXl6?=
 =?utf-8?B?QVNVcTgyT05RaGVxaDEvMTRaQU1OcW5WeGtiQjVaQlhlUWk4WjY3UjlNOGM5?=
 =?utf-8?B?YXNBTWJIV1R1VFNsOU0xTUZMbkdaeVNpd3dDRnhyckNJYWR2OFUzaiszbnlZ?=
 =?utf-8?B?NUZkUkYwT1YzZGZLV2ZFZnZQUENLcC84VzZ2S0NjZ2tkZU5SYXh2U2xPbnV3?=
 =?utf-8?B?ZW1NU2xGeXhpeEEvK3lXSVNNMVM4OWMzM2xPU0ZWcWcyYnc5WFpRS2tjeDdF?=
 =?utf-8?B?ZTJPNGlYdy9wOWZjOWZkRm5HZitHcHB3V2FSN3RhUGIrdTZwb20wU256dEN2?=
 =?utf-8?B?VVc3dWZuSGc2TEJ5UzFQNzN2SzFuVGxGZzNaRnhlK3NoRVJxN0o2Y2p5STRp?=
 =?utf-8?B?OVc3L1ZCY3lEaWVNaUVWY2huOElpbGxUZnlMTUFVV2cwNjU0MkM4NEI2SG41?=
 =?utf-8?B?NVdwZ0pVbDhlc3RUWkdnUE9lUE5pVGptQ2lEQkRmTUtXVXpkdmRHSTU3NTBo?=
 =?utf-8?B?OUxCZGJ4d3JGeVJwaytyQ1JIZEx3QStLcXM2QXRjSWpZN0pFWjlhRWIyc2ZY?=
 =?utf-8?B?UksrQkdoblFIQUI3T3E4R1pCUzFPUHBuSWJuN3RYTUJPMzFKbVpSdUxUTzZE?=
 =?utf-8?B?ME9aRHZIc3R1U1lNZzdQcFI4dlNwRDlZQVNUVTQ4VnM3M0ZKQWpGTllsVmJp?=
 =?utf-8?B?dnZNQWNjcnBLbnk2azJkdW5GUWdQSTRuMlFoZGpVVWNnVkJRMnBPRk1VL0d5?=
 =?utf-8?B?eWJMV3FOMmZ3M2M5NWpQdmZYWm83VjZVUGZSMnZqTW92TncvSVBvdkJoRE5L?=
 =?utf-8?B?bzdjamZVbnM1Y2dBV0kwbUVDTi9PVnIrR2d6QWFoQ09FNHNnWnBiNExteVBQ?=
 =?utf-8?B?U2ZsZ1ZScWRkbGZxeTRNbEg3ak9zTGF6c0RXQnhNUzB0ZUQyT0NLZSs1ZTBN?=
 =?utf-8?B?VnB3M1R4MXkwVUpoMGNCMjgzTFBoSnl3UGlET1dsWHJEOGtFcHNtNS8xRHpY?=
 =?utf-8?B?b2VtZmtraGFocFB5dHJVN3pxdklNSTdXYnFWN1lNUktJUWtKMGhLRFdrSlA4?=
 =?utf-8?B?VCtEcno3Qkp0clFiV29PZDNPMC9HTURVcTc2Q2NTUkFFNktKWkZ5QnEzSHIv?=
 =?utf-8?B?ZTdBcmNDVnlDWFJlY2JWYXZjMC9EanRSazRMMW5DZjJqSlB5RGIyTFBPclBn?=
 =?utf-8?B?b00yaFlzYVhCQ1UzMVd4ckJKdlVjNTRVdW0zVk9BNEwycE52OXE3aGlDU0tI?=
 =?utf-8?B?eEQvbXYwc1d1K2dYQ1FDQjlTNWZ6T3NITnlTZEU0aFFTem9pRXhBV0ljUGFP?=
 =?utf-8?B?Q1F1RkxUZ1FMRjNpL2Z3VFo2QVg3UzlWU2ZBMnFKeEZUU0FFZGlGT3NDY3pE?=
 =?utf-8?B?VkNtOGZ6dzloTzI4WHJVWHlWQUhEQk9OSGVxcjQ2ZFFBNXF3Q25NNmZmODVv?=
 =?utf-8?B?dS8rNjkyOXZLSDgweEliNERRWHhrNEhFS0Zrdjh4Z3pwc05GeFZIMzdxdGsr?=
 =?utf-8?Q?YjHF5gsRHOqa8MIr9+us8hKcq22yys=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6366.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Nlk1dSsveUhKU3djSnNLcmUvQ0dzc2xRTURXRHFWdjR4MmVraEhjSWlHT3ov?=
 =?utf-8?B?ZlIwUEwwQUJaZTZ1K2c3OVFWRVlrbS9SeHVHS3psNWptSHhvS2VpVFBFY1Rz?=
 =?utf-8?B?ZitSZDJ5WEkvTXdnK3dKSllLRm9OcGxnY1JKallWR0FXYXBrU2NDQWZKaWVO?=
 =?utf-8?B?V09WRndDd0lmZzVPU2hJMGFqSVpVR3M4a0MyQXN1cFhpSjZCbXI2aVFOWTA1?=
 =?utf-8?B?aHpYRXlIbnZyZVVnR1F4NS9zY0Z0Y2JyaHF5a28yQy9aeGFFTEJmN3VKV3c3?=
 =?utf-8?B?NlBVUDlxYkhkQk9ORkJ0VXUrQjN0eUdtTjhpZTY2Sm1wVDVVaVhKQXplMENp?=
 =?utf-8?B?aWswWVg3eWtQK1hyR1NZNis5N3ZOcGFKdXh1b3VBanY0K043M0dxcFNEWlZX?=
 =?utf-8?B?R0VwUFJTR3FtekFsN05XcjJFT2dlQWF4VWJyd1NBSi9ZTTBoNDVtbnQ1K3hq?=
 =?utf-8?B?QU1Gd1p4Rm85VFhFUTlRaEtiOGY3bXk4OFhDSDdTa29kSWpuVGxOVEVpdzBy?=
 =?utf-8?B?aXhTMUdEbDlDcmRLM0MvZitoSHllK3B2QnZBN0MxL0tNZDhaNlZVL2RidklK?=
 =?utf-8?B?M1FzUk1mVDZlb2sxTWdPSlFSM0lJTWl4SnBPeEk3eHJaaGFkcHNNbExhVHZm?=
 =?utf-8?B?bEdyTVZUOE4xb2RhZjB5QTVDSi9kOGdOcTFwK2VyanoxMWt3NzVtNjdSak1L?=
 =?utf-8?B?RkdFMlI4aU13UU1ncjNVN1lJUFUrMWZHYTZqMHF1YXZ4dDZxZWpzRnR2aHJr?=
 =?utf-8?B?NWFiWk1Sa2ZPTW82UUFlTkFiUWQ5cHlkUjVDQm9XaVlyaG8zcy9aRGtuc2kr?=
 =?utf-8?B?eWtKODhtYXpUdVBINUtPdEN6Q2xkakt2WGdnUk5IbHYzMGFqWjZPRTM0Y09w?=
 =?utf-8?B?Rlc4dTIxM1lIUWJucTVjRUlFZkdacmdleHNTTXhLTTJYb05Fa2tFbWd5UlNt?=
 =?utf-8?B?OUxBWlV6R0wzSTNIcW9Kb1IrbkhmM0dPQ2ZxQXNmclkrWHNPZjkyTDJhRTZE?=
 =?utf-8?B?L1dFQjM1YitRMGZzaXYrcFZnNUplTXV1T1g4NGY2UmEzZWdaTlNTQ2JseHVr?=
 =?utf-8?B?OXgvZnpRR1VDaTZjSzlFS0tCQUdiNXZIQUpVZkJPYUhQOUdUM2FjTXRZK25N?=
 =?utf-8?B?NTArUFNOYkJ2Z0Ryc2sxMkUzOVlWejZLczBST1JMMGtEQlZMczYxZHZWcVo4?=
 =?utf-8?B?MlF1REE1VXVqbThRWkdKSHU1OTZhd3h5Z1I2SHRhMWJIYlMzV2hZR3p0emU3?=
 =?utf-8?B?Q09jeGN6cElsZ3A1c0hDYndhWXdKeUpFRGROallLSm9paWFBd2ZQcnRjRWts?=
 =?utf-8?B?L2ZCc0hBMnRWWnBEYXZZV1ZyZ3phUU0xZVJtbzRycUhORGtML0dIVkI5ditu?=
 =?utf-8?B?TnI0U2d0ZVhhZE1MZ0ZGVTNZb3QrU0wxSWVkM2l1Q24vM3lDMGZwc3pST0Fo?=
 =?utf-8?B?bUVYVEo4aEhRN3ZDdkJ3OWxYOFB2WXMxMmxxWlphQ3MySFZPVTZXdFE4VlVu?=
 =?utf-8?B?c1dOMFR3UUZrTU9RYlR6a2x5bWJpUVpoNmVwNjdhTUNTVjRkUjFwcytlUUdT?=
 =?utf-8?B?WTlWMjJjNlFnMlBWVlJVSzJsdFRxdXQ2Mmd3b21nUlNGNkJZbWNya1owWG5G?=
 =?utf-8?B?OURvWml0ckc3T3ZVeHRXZVBNY3Q3YXdNam1kVDNHbDREcXdPQjBJOVNqVmhS?=
 =?utf-8?B?OGFQZi9JbXhvRWw5TlFMZ3hUZkFBUSttSTUwTzk5M0VNU1hzYm1laE5Nb0JD?=
 =?utf-8?B?Nk0wdUE5NTJOeXVEMUJDTWppQTg0aE1xR0NrbUd6a3NLVmkyS1R4Qm95cmhC?=
 =?utf-8?B?QXZaSUcxeDI5WnhzczNFRjh4U2tPT2J0ZmthRGI4RDdZdnoyNzNsTEwvckFi?=
 =?utf-8?B?d1NaNWlOV0d4L1dlWXdscFJ0dDJTRXoyQ3dURkJwaXVncU1JY2U5MnF4ajAz?=
 =?utf-8?B?TGc5dThwRmM4Z2lJWjdzMEl6ZnEvMlpLSlBieFpwa3pZbkc2Wm9RTzRFUW96?=
 =?utf-8?B?Z29BL093WkoxanlqQk50K0ZiRlh1WGVmZVdFMkM1TjI4aGptcnlmZFZkc1ov?=
 =?utf-8?B?Z2lwQTU3WDFtWUdEUno5N0ZGSG1ZWnMxY3dDTWNLUnl0TEVzcWR2ZnBzazdl?=
 =?utf-8?B?MVl5YnhKbWo5bS9QamV4cklSdGtwZVB2NjRJNnREZVJmeVdZQ25CaitES2Ju?=
 =?utf-8?B?ZWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9563a4e-608c-4db7-2beb-08dd9ce428de
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2025 06:03:10.8034 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rzixI+hWUANmOf6SaVRxSmxE0Vp8QPCRnii7giIfsYJowBHXa03JXDeaV/udgkk9k2kEkBkPkT8jGAAL2OJq3x+eEC0HgJemU4lkpHPJMzc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7513
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

PiBTdWJqZWN0OiBSZTogW1BBVENIIHYxMCAwNS8xMF0gbXRkOiBpbnRlbC1kZzogYWxpZ24gNjRi
aXQgcmVhZCBhbmQgd3JpdGUNCj4gDQo+IE9uIFRodSwgTWF5IDE1LCAyMDI1IGF0IDA0OjMzOjQw
UE0gKzAzMDAsIEFsZXhhbmRlciBVc3lza2luIHdyb3RlOg0KPiA+IEdTQyBOVk0gY29udHJvbGxl
ciBIVyBlcnJvcnMgb24gcXVhZCBhY2Nlc3Mgb3ZlcmxhcHBpbmcgMUsgYm9yZGVyLg0KPiA+IEFs
aWduIDY0Yml0IHJlYWQgYW5kIHdyaXRlIHRvIGF2b2lkIHJlYWRxL3dyaXRlcSBvdmVyIDFLIGJv
cmRlci4NCj4gPg0KPiA+IEFja2VkLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJv
b3RsaW4uY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBVc3lza2luIDxhbGV4YW5k
ZXIudXN5c2tpbkBpbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvbXRkL2RldmljZXMv
bXRkX2ludGVsX2RnLmMgfCAzNQ0KPiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4g
PiAgMSBmaWxlIGNoYW5nZWQsIDM1IGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL210ZC9kZXZpY2VzL210ZF9pbnRlbF9kZy5jDQo+IGIvZHJpdmVycy9tdGQvZGV2
aWNlcy9tdGRfaW50ZWxfZGcuYw0KPiA+IGluZGV4IGVlZGMwOTc0YmI1Yi4uMmYzMmVkMzExZmZk
IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvbXRkL2RldmljZXMvbXRkX2ludGVsX2RnLmMNCj4g
PiArKysgYi9kcml2ZXJzL210ZC9kZXZpY2VzL210ZF9pbnRlbF9kZy5jDQo+ID4gQEAgLTI0Niw2
ICsyNDYsMjQgQEAgc3RhdGljIHNzaXplX3QgaWRnX3dyaXRlKHN0cnVjdCBpbnRlbF9kZ19udm0g
Km52bSwNCj4gdTggcmVnaW9uLA0KPiA+ICAJCWxlbl9zIC09IHRvX3NoaWZ0Ow0KPiA+ICAJfQ0K
PiA+DQo+ID4gKwlpZiAoIUlTX0FMSUdORUQodG8sIHNpemVvZih1NjQpKSAmJg0KPiA+ICsJICAg
ICgodG8gXiAodG8gKyBsZW5fcykpICYgR0VOTUFTSygzMSwgMTApKSkgew0KPiA+ICsJCS8qDQo+
ID4gKwkJICogV29ya2Fyb3VuZCByZWFkcy93cml0ZXMgYWNyb3NzIDFrLWFsaWduZWQgYWRkcmVz
c2VzDQo+ID4gKwkJICogKHN0YXJ0IHUzMiBiZWZvcmUgMWssIGVuZCB1MzIgYWZ0ZXIpDQo+ID4g
KwkJICogYXMgdGhpcyBmYWlscyBvbiBoYXJkd2FyZS4NCj4gDQo+IElmIHRoZXJlJ3MgYSBzcGVj
IGRlZmluaXRpb24sIHdlIHVzdWFsbHkgbWVudGlvbiB3b3JrYXJvdW5kcyB3aXRoDQo+IFdhX0lE
OnBsYXRmb3JtIHNvIHRoYXQgdGhleSdyZSBlYXN5IHRvIHRyYWNrLiBpbnRlbF93b3JrYXJvdW5k
cy5jDQo+IGlzIGdvb2QgcmVmZXJlbmNlIGZvciBpdC4NCj4gDQpUaGVyZSBpcyBub3RoaW5nIGlu
IHNwZWMgdGhhdCBJIGNhbiBmaW5kLg0KTm90IHN1cmUgdGhhdCBpIGNhbiBmb3JtYWxpemUgaSBh
cyB3b3JrYXJvdW5kLg0KDQo+ID4gKwkJICovDQo+ID4gKwkJdTMyIGRhdGE7DQo+ID4gKw0KPiA+
ICsJCW1lbWNweSgmZGF0YSwgJmJ1ZlswXSwgc2l6ZW9mKHUzMikpOw0KPiA+ICsJCWlkZ19udm1f
d3JpdGUzMihudm0sIHRvLCBkYXRhKTsNCj4gPiArCQlpZiAoaWRnX252bV9lcnJvcihudm0pKQ0K
PiA+ICsJCQlyZXR1cm4gLUVJTzsNCj4gPiArCQlidWYgKz0gc2l6ZW9mKHUzMik7DQo+ID4gKwkJ
dG8gKz0gc2l6ZW9mKHUzMik7DQo+ID4gKwkJbGVuX3MgLT0gc2l6ZW9mKHUzMik7DQo+ID4gKwl9
DQo+ID4gKw0KPiA+ICAJbGVuOCA9IEFMSUdOX0RPV04obGVuX3MsIHNpemVvZih1NjQpKTsNCj4g
PiAgCWZvciAoaSA9IDA7IGkgPCBsZW44OyBpICs9IHNpemVvZih1NjQpKSB7DQo+ID4gIAkJdTY0
IGRhdGE7DQo+ID4gQEAgLTMwMyw2ICszMjEsMjMgQEAgc3RhdGljIHNzaXplX3QgaWRnX3JlYWQo
c3RydWN0IGludGVsX2RnX252bSAqbnZtLA0KPiB1OCByZWdpb24sDQo+ID4gIAkJZnJvbSArPSBm
cm9tX3NoaWZ0Ow0KPiA+ICAJfQ0KPiA+DQo+ID4gKwlpZiAoIUlTX0FMSUdORUQoZnJvbSwgc2l6
ZW9mKHU2NCkpICYmDQo+ID4gKwkgICAgKChmcm9tIF4gKGZyb20gKyBsZW5fcykpICYgR0VOTUFT
SygzMSwgMTApKSkgew0KPiA+ICsJCS8qDQo+ID4gKwkJICogV29ya2Fyb3VuZCByZWFkcy93cml0
ZXMgYWNyb3NzIDFrLWFsaWduZWQgYWRkcmVzc2VzDQo+ID4gKwkJICogKHN0YXJ0IHUzMiBiZWZv
cmUgMWssIGVuZCB1MzIgYWZ0ZXIpDQo+ID4gKwkJICogYXMgdGhpcyBmYWlscyBvbiBoYXJkd2Fy
ZS4NCj4gPiArCQkgKi8NCj4gPiArCQl1MzIgZGF0YSA9IGlkZ19udm1fcmVhZDMyKG52bSwgZnJv
bSk7DQo+ID4gKw0KPiA+ICsJCWlmIChpZGdfbnZtX2Vycm9yKG52bSkpDQo+ID4gKwkJCXJldHVy
biAtRUlPOw0KPiA+ICsJCW1lbWNweSgmYnVmWzBdLCAmZGF0YSwgc2l6ZW9mKGRhdGEpKTsNCj4g
PiArCQlsZW5fcyAtPSBzaXplb2YodTMyKTsNCj4gPiArCQlidWYgKz0gc2l6ZW9mKHUzMik7DQo+
ID4gKwkJZnJvbSArPSBzaXplb2YodTMyKTsNCj4gPiArCX0NCj4gPiArDQo+ID4gIAlsZW44ID0g
QUxJR05fRE9XTihsZW5fcywgc2l6ZW9mKHU2NCkpOw0KPiA+ICAJZm9yIChpID0gMDsgaSA8IGxl
bjg7IGkgKz0gc2l6ZW9mKHU2NCkpIHsNCj4gPiAgCQl1NjQgZGF0YSA9IGlkZ19udm1fcmVhZDY0
KG52bSwgZnJvbSArIGkpOw0KPiA+IC0tDQo+ID4gMi40My4wDQo+ID4NCg==
