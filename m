Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17116AD344F
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 13:02:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0377810E4F6;
	Tue, 10 Jun 2025 11:02:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BczEFDTE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DFBC10E4F0;
 Tue, 10 Jun 2025 11:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749553358; x=1781089358;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BAQSUiyhI1EE4wxLDIL1WAF1WA/RzjsQ6tGIocPBzbM=;
 b=BczEFDTEt1YEog1QTAJqdQm2ndR2m7peaSu5hJh0QOo105c56n8Ptt8U
 3NQAcfA1Wi0Ey2buL/Be6EpZVSWCpDoxDMyuuU6QZHA2CBXvsE/z9YC5n
 I7DslSZRBY8YEHsiZ7JGGSjZ0mZX1Wavegzc2fS6FSLhvV44dVykTG2YH
 byqCSaXhTQJ1yq7rWj2k4p5CLlPYAxbSQVNMBtDT8YlOxcdiHSO6CKiMz
 r77/qgc13uS1ws+lR6/CL7fsYdLU9Mu2XMysXMeJ0yHqD4eVazBbhb0b3
 o8qwkN1T2KChvvEtehafV7MRR3BN+V7RowWDcmIbzYCG4KonQ4L3bAqQu w==;
X-CSE-ConnectionGUID: krBVmCoESlmmbPl43g+wdw==
X-CSE-MsgGUID: ke61Bo+6QmCcOykeMyXHZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="39275674"
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; d="scan'208";a="39275674"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 04:02:33 -0700
X-CSE-ConnectionGUID: xmxQnTHrQnClZIjDnfs4dw==
X-CSE-MsgGUID: rk3Xqp2MTeqD4AT7Mw0AzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; d="scan'208";a="146779168"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 04:02:33 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 10 Jun 2025 04:02:31 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 10 Jun 2025 04:02:31 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.83) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 10 Jun 2025 04:02:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l3UIUmXHvXz8MyGU0lbg4xJR7Nbn1oyODboT5UubOp7LqCdf93Dakk0cCSEKcgb64Uif2gI3sKyEwpJLA280BWIJqDySaRsbm1Yp9Ru0+15kM/fhS5Ez8v7xE9JtoFNayAA/e34xPM1agQCAJaCSxyybQ4vcBKSx5lDCCN6W7fyn1jTbkGEUvdgqFi2isoJx7rTE4EraNBBIJtJ6xlupQZV8TjLr8lhQnegbL2GRtTO2LnH+4L1XxYWGAssEOZkZ4z9X63pv40LPD38EniX0opahwoaCvlgqql0i31NgRABEVJsmog5FP3ttKU1N5hz8Cg/0so1PTWw3qNjIkZfp8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BAQSUiyhI1EE4wxLDIL1WAF1WA/RzjsQ6tGIocPBzbM=;
 b=eBuUr69sHr0WovabFObedReAnxwQ7T6lyoFfbqWRCdkHRS0AdeEB35Cj+TQEPQ87rap7zcvPvXfpmGlj5x/bkHe+xHU7oCWM7tKZ64wl821xWWXWkj5JGrZTwHB1mXQJJpamxFwuyB4XpLHxl1oVxTO9snH4fcUV4z9qcTWTZLCccYyXMKu3lA3v5Ge2jn98siovp/lksP9yXlkkk+vhCbRrVc0YI4YX6dmDDPiQRYPwYovqrNuoZC+VQf0BtRxFOqkZe+sHDRpQ8FpM5Ozd9H56jjVdxUM2aFFQvaJGvkjGvnwslAqfaCZyDnfAwTDImanEip7elhNA0u4z5SQ8eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by PH3PPFD01EAC3BA.namprd11.prod.outlook.com (2603:10b6:518:1::d4f) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Tue, 10 Jun
 2025 11:02:13 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778%3]) with mapi id 15.20.8835.018; Tue, 10 Jun 2025
 11:02:13 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: Richard Weinberger <richard@nod.at>, Guenter Roeck <linux@roeck-us.net>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Vignesh Raghavendra
 <vigneshr@ti.com>, "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, "Poosa, Karthik" <karthik.poosa@intel.com>, "Abliyev, 
 Reuven" <reuven.abliyev@intel.com>, "Weil, Oren jer"
 <oren.jer.weil@intel.com>, linux-mtd <linux-mtd@lists.infradead.org>, "DRI
 mailing list" <dri-devel@lists.freedesktop.org>, intel-gfx
 <intel-gfx@lists.freedesktop.org>, linux-kernel
 <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v6 01/11] mtd: core: always create master device
Thread-Topic: [PATCH v6 01/11] mtd: core: always create master device
Thread-Index: AQHbi35N9ptLZMK+/0+KHmcJoUKk0bP5FNKAgABXSdCAANahSoAAWdKAgACSaAOAACUigIAAFAQAgAAhxhCAAAxMAIAAXViAgADet1A=
Date: Tue, 10 Jun 2025 11:02:13 +0000
Message-ID: <CY5PR11MB6366B2B40E0C357D6C0935C2ED6AA@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20250302140921.504304-1-alexander.usyskin@intel.com>
 <87bjqyja7o.fsf@bootlin.com>
 <2f3d3ff9-e483-42cc-aaed-f376d46a6701@roeck-us.net>
 <87ikl5xnbc.fsf@bootlin.com>
 <CY5PR11MB63660CFA966BCA1B44528BB1ED6BA@CY5PR11MB6366.namprd11.prod.outlook.com>
 <4d55ac06-c357-4d78-b8b8-5b26486ce529@roeck-us.net>
 <CY5PR11MB63662D21B2C7B1A1C2E6BC4BED6BA@CY5PR11MB6366.namprd11.prod.outlook.com>
 <2e5ebbdd-2a57-4f1f-85c6-7c2dff127b50@roeck-us.net>
 <1176847729.134356549.1749504429656.JavaMail.zimbra@nod.at>
In-Reply-To: <1176847729.134356549.1749504429656.JavaMail.zimbra@nod.at>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|PH3PPFD01EAC3BA:EE_
x-ms-office365-filtering-correlation-id: cbe5b9dc-76bd-4131-cb9d-08dda80e4140
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?QVpSakhFZTk1dzM4TW0wQXRLSHJvVzVaczhsYVN5bFplYmhBRzZXYlVFb0ZW?=
 =?utf-8?B?S09IaCtUMXZFRWdrelZoNHAyMWt5QWxIRTVXTFpBUkd0eEw2d0FLcmx1NVdU?=
 =?utf-8?B?bXEzYjJuWi9IeVlRSTJtdVVJL05DQXJLUDM5VWxGZitWM3Z6V243TXR4akxH?=
 =?utf-8?B?Skt1L0R1aWVFbGNRcnlTWUw1U1g1YW5LWGtxVXEvY09rbTNJcmtzaEpsM1dI?=
 =?utf-8?B?cHBsbFpEb3ZUNHI0NmVyQWtOV0dJY0dONEs1Q3ArdW5Lc1ZESkJaWlhFS1U4?=
 =?utf-8?B?OXlTdW80bHE1NnZQTkEyTGxHOVJrYlFVZzA4REZGdUJhenFsOTFJNTE4TmVN?=
 =?utf-8?B?emM4K1ZTSGdXdmVvbE42azAvczVYOVB5N0FSZWFja0dPZWtHWTVZb0ZCZmEx?=
 =?utf-8?B?M2ZGQmoxaTFjbVBzckk5Z0ptNUZXNkdpZms4TUU5eVU5K0lKS2h6MitjZm5N?=
 =?utf-8?B?R29XWjBwY0lOaFBYNkd6TjByM1IwWnhnL0l5aDI4TmQ3Q2Q2aEp1dWxULytN?=
 =?utf-8?B?dUhHWjY3cWhsUU16amEraFFpSVc3SmVkYy9MM1NqWFRsc3h6ZmovY1Y1cGRn?=
 =?utf-8?B?NkNNaWZsNHZJbS9zRDZWdTVMamRaam81WklZakJVaVovZEZNSnRJZ0FTTUpM?=
 =?utf-8?B?VHg5WURmYnZTZjk2R3NFRHc4a1c4dHNPL0NtUGRSMnFNdGdHa2VjL0VTbmxu?=
 =?utf-8?B?VHFHSHJWSTRpQTk4cUI2T2xqRFdrUnE1Qm1vZWtWUFB1WGpMU2duRHJlT0dU?=
 =?utf-8?B?SjJTR1ZVOGJuYUdIckhaMWNKdnBEYUhvUFhsUnBqWCsvU2Q5eXVhUHlWOGhK?=
 =?utf-8?B?eEpxNXNFM2w1MGw4RS81Q2ZVT2llS0RWZXNvbTR6Qk5SRUUwbWpOazlsTmx2?=
 =?utf-8?B?TUpqOWlHVnJDSWFOclVGZU1rNEtaT2xpMzVpOHpUS3ovNE5pMm1YOGlaVncy?=
 =?utf-8?B?d28xbk81MzFQOWVJNUh2U3FpMkorMFRtQW9yK1VyaS9QS0Y3K1VaVTQ5R3la?=
 =?utf-8?B?U2QxOTRYdDl4RXY0RUFuNWRNempJTWhYYnlXYTZ0eVFTM2FMTDJoblFtbW13?=
 =?utf-8?B?UEtuS3pIVzlUSlk3Z3FKbnoyeGZKeGd2YWNLeTFNd0pMR1BQN2RFY01EU3M3?=
 =?utf-8?B?QjY2MXNSWE5ZM0FYZWFGQWNKd3hWUkRqOTl5VTFIY2hwV1hwT1VSY3c0NEJD?=
 =?utf-8?B?bURBTFg2WUFTOVRtOVRaaTJTM2lVYTlFczVqQWVFRnE0SmNhUFg3Wjh0YzRk?=
 =?utf-8?B?YWlGRis0dGcraEllRzFDS2QyTDdiOGt4a203c1JaUWtXSXgrTENLWC9HTkFZ?=
 =?utf-8?B?NThHMkRZaDI5S0tOWnJkMktYbCt0L29kRGxrdElLT3Q3bFFkaXM3VmRzM2xo?=
 =?utf-8?B?cmMwalpnMytENlUxM2lQbDJsTlJDMTZKYjRQL09LU0NBMUM2SXBWTFNEWFdV?=
 =?utf-8?B?LzA1ZGYwaWJkTGxqVGt1dnZQZ0cwYmtEZ2o5WmRBYUhnV3hiR3ZwdnlQTGpt?=
 =?utf-8?B?NWFYYW8zRW9NRTI0WDJvWjQ0QVJ6aHdkQ094bm4vRzA5M1d2K3g0SnZzaTNQ?=
 =?utf-8?B?VUJTWSt4SDUxNHZRM0UyVHpCUXFXcUV4K0NZanRJcG0wUHZqNEtKQ09LS1JD?=
 =?utf-8?B?L0VWaXZrM0FTTDhkM0ZiWUxCYVc3YnU4QXRFZTRTdmt2bDdmTzA2ZWk1RWpj?=
 =?utf-8?B?MHgwYnphUldyN3Zudk9UY0MveDZZazVxZkYrZ0w3YTNOWjcrTk1jaGdJbzRs?=
 =?utf-8?B?SWg4amN2YWEvbGhpYkpBMDdROGxrVDJqRzlzcHdhV3FhdkFvOWtGcHR3dnJr?=
 =?utf-8?B?S1k3R202VW5ydVdnTzkzU2JPWFRNOG52eFdVa3hRQStxN1RGZlR4czk2OXgx?=
 =?utf-8?B?b0QwOWtTem15R1VPQ3dYSjdkMmFRcXhBTlJSY0p0VUx1RkVETnZWVVpjREJv?=
 =?utf-8?B?MGo4WVJEQmhiNEZ5eUthRGVaN3dyNExWUGVyTlpxNE1uL1hyd3lPY0EzSlJH?=
 =?utf-8?Q?NXm1JK5pi9Rb8O6QC3Bpmjga15SxuI=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6366.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?elJ5Q01sT2xHMlA5akRxTEpmME5mRTFlVWtjNjZUdC81VmFlbzlQQ0tudWNP?=
 =?utf-8?B?cEpXcVpSbGZpNXpRYy9QOStPSTNFQU1jd1l1YXJjQ3Z1R1lsZjEzekd0YnQ3?=
 =?utf-8?B?bitleW1WdkNTcDR3NEt1bDVQVjYrdXA0N3d4NUg5OFVyQWZXNDlVcGI2R1dv?=
 =?utf-8?B?UTh6U3R5M2Q1VVBjZDJCeUtkS2NGRGIvaDRRamVzQ3RHUitqTUZiNXBYbTJa?=
 =?utf-8?B?VFVUMlF6SDc3Y1hpbGpvMmNmeVFERFVmcVY5a1NGdnNYbHRJblhpV0lERWJ0?=
 =?utf-8?B?eUg4aWpGUGs1NlJxY2NoNHQ1bXFveFZUMlNiUTZBQXRCZmlpWHUrOFpSU2Z3?=
 =?utf-8?B?UnliK1lWUmppeEp2WGoyU1ZzWGdseWlyVUJMVWs0bHJ1MjZTenI1b1JOV3Fr?=
 =?utf-8?B?K0RwRVVpYTBhN1E3QmREU2NMZXJMQkplRHJmNHZzZndrY0dFcnN2UDc1OG5j?=
 =?utf-8?B?THhCTFRFRTY1R1NmN2U5Z2xLaG9PaXdPMXVKMXhFcHRUVFR5RWE3Z0o2bDlQ?=
 =?utf-8?B?WHNWWCtHV25Lbm43QjlpWGtyTG1yL0dvdlJSakducmZCc0htck4xR3pRM2Fa?=
 =?utf-8?B?ZmU5RkVpRXdIWm43REd3aDhYTUNkZGsyUjJ6aElkOHBwaUZIQ084V1I0NTNF?=
 =?utf-8?B?Mnc5dHZ4R1hEOUF5Ympzb0dwU1haNUtDeURMN2MxaldnUUY1TE9QTmsrM2Zl?=
 =?utf-8?B?Z3UzRVo3SHZTVzBYMVE4dnFaVnplN01ERUhxSGFtK3pYeWJzMFpVU3F5Si9s?=
 =?utf-8?B?SVk3d0I4UTQzRlQ5bUhxU0Z2d25XK1htNnR5UnVUV0d5Tm9sTXB5SW9IODJT?=
 =?utf-8?B?aEhWem5EWWxGQ2oyaExJTUZOdGE4Zkx3aVJESlhFMXdmT3dHTmVBT1B6SmZq?=
 =?utf-8?B?b1JydUlnZjI4SUltSkhWMDI4NmU1a091Rlg4WWhNa0YwRUEvVDF5OE1LMnlM?=
 =?utf-8?B?bDhFWm1sTE1qZUZZWmRFaWt0bWdvdmsvUFBVM2lLNmZHYnB5RWRzaklNY25X?=
 =?utf-8?B?eExPanZxczdpcFZLcFlodVRhcEszYW8zS1c0eWJMU2FIcm8xRkt3ekFVbzJt?=
 =?utf-8?B?cnN0TXQyREUwcUszY25WSzZlbjA3UHl1YmhVZUwwZzU5R0J4LzUyYThtd0lV?=
 =?utf-8?B?ZkVMaStDbjFNZnVyYUh6OGVpbFFnNnRFTDM4Y0JIZXpKRjgrcjdaZVF2eUhi?=
 =?utf-8?B?VkY4WUtLL01CbzUwV0dGdzBzS3N1V0VHQkpxRUFIZ2VUSDlycDlFZHdrLzU2?=
 =?utf-8?B?d0I5T3ZyRUV2RmpDekFHTnptVVVCdWU1TjZXdzQ2RUJ4eEpCZ1VDUU5kRCs0?=
 =?utf-8?B?Ylk3VFNrWG5OcmZXcGJjV3ovbzFSaWlEZXB5TDZGbzAvRDVKSld3emhiSjE5?=
 =?utf-8?B?Q05wWnNndjc0bDhRaXAvc2RGVktqVEZtY3J4bWp0d1lKN1FyYWhMNUZncmhP?=
 =?utf-8?B?UWFpMEVOV3dvM3FTeEE2NXRWSDFkRkplN1dramZIVloreS9vdHpRUjJKeTFX?=
 =?utf-8?B?WVRtT2Z6bWVtU2JVT08yeUgzYmdBQTBOak4xNHYxbkhxNUllbjAvc1kwb0tV?=
 =?utf-8?B?TTFBOVEzNStWWU02NXd2ZGdmLzh2cTlDcGRKZUcrOXJ4QWVZU1BrRE1NTmVs?=
 =?utf-8?B?ZU1qTlFQL3JUMzdvUnc1c2xjbDY5YmZ5SzFuUUhjRVdhbUpQTVNhQVQyVmRI?=
 =?utf-8?B?N0Rxbi91dmVIbEI1YXlJU2EzbHFlVU0xS0NrWmpLazRoUnhkRWp4eVd1dWVq?=
 =?utf-8?B?d3BYUUp1dFR5R1NZSVdla2E1Y2VCNFdxVVRQdlZqVS9ETlBmQkhjT3k4UmYz?=
 =?utf-8?B?VVMwa2xIaHlOM3QzRGRLdm15ekxkVTVJRkM4WW9ya0ZJNEVmUmRHTElMbnRB?=
 =?utf-8?B?ZjZoTXFKblhXZjhHeExWaVNZdDJMSG5HSTVHemJ5QmdEdEkzdFovUzdmT01Y?=
 =?utf-8?B?SFRlRlMwZ3dIUTByWGxsbzgyTGZVaDBTdGlSckFkeVo0ait2TExXSThDbk81?=
 =?utf-8?B?aTNKbVF1Vy8raXVUaVFCOVA0cVEwN2x2TzlRUFBQeVFNV3NkaXVFRThOelJD?=
 =?utf-8?B?RjhLc21CWmV4eHUxY3JnNUQzVFRPWWtKR0daTHRWK05VNnAybE5QZWlaY3NL?=
 =?utf-8?B?emRKcG5CT0lFREVqenE3c3N2SXV5OGhsaE04RmtITjVnUGJQTHRYZ3FPclJE?=
 =?utf-8?B?RFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbe5b9dc-76bd-4131-cb9d-08dda80e4140
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2025 11:02:13.3793 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Tsw8fS2Fu7mJT9fhpVUUehN/TmBlwpICivpfDKLqpmSaiKg0EImYtuQjJ/4MJScrI9rXJAKlnkKBFgEu1FU6WXyfRGoaDXEd8Gb8TH6g/Sk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFD01EAC3BA
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

PiBTdWJqZWN0OiBSZTogW1BBVENIIHY2IDAxLzExXSBtdGQ6IGNvcmU6IGFsd2F5cyBjcmVhdGUg
bWFzdGVyIGRldmljZQ0KPiANCj4gLS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQ0KPiA+
IFZvbjogIkd1ZW50ZXIgUm9lY2siIDxsaW51eEByb2Vjay11cy5uZXQ+DQo+ID4+PiBJIGFtIHRy
eWluZyB0byBib290IGZyb20gInBub3IiLiBJdCBsb29rcyBsaWtlIHRoZSBwYXJ0aXRpb24gZGF0
YSAoZnJvbQ0KPiA+Pj4gZGV2aWNldHJlZSkNCj4gPj4+IGlzIG5vdyBpZ25vcmVkLiBtdGRibG9j
azYgdXNlZCB0byBiZSB0aGUgc2Vjb25kIGZsYXNoLg0KPiA+Pj4NCj4gPj4+IEd1ZW50ZXINCj4g
Pj4NCj4gPj4gSXMgdGhpcyB3aXRoIENPTkZJR19NVERfUEFSVElUSU9ORURfTUFTVEVSPw0KPiA+
Pg0KPiA+DQo+ID4gWWVzDQo+ID4NCj4gPj4gSSB0aGluayB0aGF0IG10ZF9pc19wYXJ0aXRpb24g
aXMgYW1iaWd1b3VzIG5vdy4NCj4gPj4gV2UgYWx3YXlzIGhhdmUgbWFzdGVyIHBhcnRpdGlvbiB3
aGVuDQo+IENPTkZJR19NVERfUEFSVElUSU9ORURfTUFTVEVSDQo+ID4+IGlzIGVuYWJsZWQgYW5k
IHBhcmVudCBjaGVjayBpcyB1c2VsZXNzLg0KPiA+PiBXZSBtdXN0IGNoZWNrIGdyYW5kcGFyZW50
IGluIHRoaXMgY2FzZS4NCj4gPj4gTWlxdWVsLCBhbSBJIHJpZ2h0Pw0KPiA+Pg0KPiA+PiBXZSBj
YW4gcmV0dXJuIHRvIG9sZGVyIHBhdGNoIHZlcnNpb24gdGhhdCBoYXZlIGNyZWF0ZWQgcGFydGl0
aW9uDQo+ID4+IGluc3RlYWQgb2YgdGhlIG1hc3RlciBkZXZpY2UuDQo+ID4+IE9yIHRyeSB0byBm
aXggbXRkX2lzX3BhcnRpdGlvbiwgbGlrZSBiZWxvdy4NCj4gPj4gR3VlbnRlciwgaXMgYmVsb3cg
cGF0Y2ggaGVscHM/DQo+ID4+DQo+ID4gTm8sIGl0IGRvZXMgbm90IG1ha2UgYSBkaWZmZXJlbmNl
LiBQYXJ0aXRpb25zIGFyZSBzdGlsbCBub3QgY3JlYXRlZC4NCj4gDQo+IExvb2tzIGxpa2UgYWxs
IHBhcnRpdGlvbiBwYXJzaW5nIGlzIGJyb2tlbiB3aGVuDQo+IENPTkZJR19NVERfUEFSVElUSU9O
RURfTUFTVEVSPXkgaXMgc2V0Lg0KPiBBbGV4YW5kZXIsIEkgd2FzIGFibGUgdG8gcmVwcm9kdWNl
IHdpdGggTVREUkFNIGFuZCB0aGUgbXRkcGFydHM9IGtlcm5lbA0KPiBwYXJhbWV0ZXIuDQo+IEJ1
aWxkIHdpdGggQ09ORklHX01URF9NVERSQU09eSBhbmQNCj4gQ09ORklHX01URF9QQVJUSVRJT05F
RF9NQVNURVI9eSwNCj4gcGFzcyBtdGRwYXJ0cz1cIm10ZHJhbSB0ZXN0IGRldmljZToyNTZrKGZv
bylybywtKGJhcilcIiB0byB0aGUga2VybmVsDQo+IGNvbW1hbmQgbGluZS4NCj4gDQo+IEJlZm9y
ZSB5b3VyIGNoYW5nZToNCj4gJCBjYXQgL3Byb2MvbXRkDQo+IGRldjogICAgc2l6ZSAgIGVyYXNl
c2l6ZSAgbmFtZQ0KPiBtdGQwOiAwMDQwMDAwMCAwMDAyMDAwMCAibXRkcmFtIHRlc3QgZGV2aWNl
Ig0KPiBtdGQxOiAwMDA0MDAwMCAwMDAyMDAwMCAiZm9vIg0KPiBtdGQyOiAwMDNjMDAwMCAwMDAy
MDAwMCAiYmFyIg0KPiANCj4gQWZ0ZXI6DQo+ICQgY2F0IC9wcm9jL210ZA0KPiBkZXY6ICAgIHNp
emUgICBlcmFzZXNpemUgIG5hbWUNCj4gbXRkMDogMDA0MDAwMDAgMDAwMjAwMDAgIm10ZHJhbSB0
ZXN0IGRldmljZSINCj4gDQo+IEhvcGUgdGhpcyBoZWxwcyENCj4gDQo+IFRoYW5rcywNCj4gLy9S
aWNoYXJkDQoNClJpY2hhcmQsIEkndmUgcmVwcm9kdWNlZCB5b3VyIHNldHVwIChtb2R1bG8gdGhh
dCBJIG11c3QgbG9hZCBtdGRyYW0gbWFudWFsbHkpDQphbmQgcGF0Y2ggcHJvdmlkZWQgaW4gdGhp
cyB0aHJlYWQgaGVscHMgdG8gZml4IHRoZSBpc3N1ZS4NCkNhbiB5b3UgYXBwbHkgYW5kIGNvbmZp
cm0/DQoNCkd1ZW50ZXIsIGFzIHBhdGNoIG5vdCBoZWxwaW5nIGFuZCBJJ20gbm90IHN1cmUgaG93
IHRvIHJlcHJvZHVjZSBpdCBsb2NhbGx5LA0KY2FuIHlvdSBhZGQgZHJpdmVycy9tdGQgdG8gZHlu
YW1pYyBkZWJ1ZyBhbmQgY29sbGVjdCBkbWVzZyBmb3IgZ29vZA0KYW5kIGJhZCBjYXNlcz8NCklm
IHlvdSBoYXZlIHNvbWUgZXhwbGFuYXRpb24gaG93IHRvIHJ1biBxZW11LXN5c3RlbS1hcm0gSSds
bA0KYmUgZ2xhZCB0byB0cnkgdG8gcmVwcm9kdWNlIGl0IGxvY2FsbHkuDQoNCi0gLSANClRoYW5r
cywNClNhc2hhDQoNCg0K
