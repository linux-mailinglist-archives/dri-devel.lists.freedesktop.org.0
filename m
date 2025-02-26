Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9018FA4573D
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 08:56:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 068DB10E072;
	Wed, 26 Feb 2025 07:56:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aQom+eMZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0898310E072
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 07:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740556565; x=1772092565;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=B3RywvGCHACOEka/Y2OICF+VSyfMCH8I8heQfQit0Ak=;
 b=aQom+eMZSw/8MEA8w5FxFkHDje8ERJAgGGFEPMSF9nWnLUxYuxbAGUAD
 1mFwSGiw3GttdCq3q0y1dizZRAK48Mca3ewwXsONd9x69fFZEJLGbygzi
 xoJufnTi+S9HwRvtBBTsQt5caqd7vS1/Y6cjXGyGlyRyrZG5tutyzSI9S
 73ilk3K+IhCreQufms+kkuUPvqyuh4mh7OSUqu95/eBihK9Uu2X+ym4SM
 EgUlu4L3V2U9kL0PLuA1QdJX7sFFwk0ShvFEdWUUchlCR9k76pZpwdJZo
 BIcjzjNz4hPeAGeE5Wh/d7IhBwLwdbp16ilmZkwEEEjhJqIi1rKmgqdxb A==;
X-CSE-ConnectionGUID: ohI1UvOtSceIKNcOQ8CBCw==
X-CSE-MsgGUID: Uxaqm6ESShqvQcPBxZcKFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="52026069"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; d="scan'208";a="52026069"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 23:56:03 -0800
X-CSE-ConnectionGUID: Jox74bpUQ4mKS/ZQRLA+Nw==
X-CSE-MsgGUID: fyHIqlp7Ss25NFia2H6GeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; d="scan'208";a="116631898"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 23:55:59 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Tue, 25 Feb 2025 23:55:51 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 25 Feb 2025 23:55:51 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Feb 2025 23:55:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tc1lZglUmzz3pq+5H/m+NGBKkEvKLyzzX4lqiiqUfLnHv0HPxf+C8GWtM8qwGhptNnO6HgWgmWqkP1csBfEcijj3JdY69bxTLrBQigqSML4y/iGqIw9KOOG5SgefCeA9DYlakqH7GY9g6CEhQ9mlAEJFfLh52E/UpbJOvhGIQDHi335u08EJ6lqu4T1b8isG/1RwGPF4CRlJO55QNLA7zXFY4PtVfEXsmHCSvk1acnN/+UaR2DbgmxG0US3bDRV96NGOGPyGx6fHsOZtiicCujpdbcXFOonBJNKJxTgJdM9/38g+UmRPGtLrmfCuCH2GggUj8IRtwJG8lNQ1UEWf9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B3RywvGCHACOEka/Y2OICF+VSyfMCH8I8heQfQit0Ak=;
 b=wmrHDni27x1WKtKh6E5r2wpc0TW9DGAnr4Hn+Ywdz3hc1+cBDyiF16vky2wELJarKbiW1Xmxuu3lYw2dxwoBuLvHF8Kb/BZJjCTEhFoxPws4Ho0tOZblOP5iKk+RFySDKpqHIFADirQRKWavnOvJZk8hXHeW0jkdv046nR/AnIUjFYqA752aeU64vo9D/qljWeXwkLCctJywU2hGnyv8Y7llIyqkAdMkCY8b3mYnY23E2Qei4QdPb8sEbTJOi+W9LaUJl1hGGQCa89CwQ4FLpSLo/TuDE96GwYPneeT3UIyhNpdiFm8GXbxyoXeSD2HYp8BE5pYPSNa/4XhTCvqt3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by DS7PR11MB7931.namprd11.prod.outlook.com (2603:10b6:8:e5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.18; Wed, 26 Feb
 2025 07:55:08 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%3]) with mapi id 15.20.8466.016; Wed, 26 Feb 2025
 07:55:07 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Wei Lin Guay <wguay@meta.com>
CC: "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "linux-rdma@vger.kernel.org"
 <linux-rdma@vger.kernel.org>, "jgg@nvidia.com" <jgg@nvidia.com>, Dag Moxnes
 <dagmoxnes@meta.com>, "kbusch@kernel.org" <kbusch@kernel.org>, "Nicolaas
 Viljoen" <nviljoen@meta.com>, Oded Gabbay <ogabbay@kernel.org>,
 =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>, "Simona
 Vetter" <simona.vetter@ffwll.ch>, Leon Romanovsky <leon@kernel.org>, "Maor
 Gottlieb" <maorg@nvidia.com>
Subject: RE: [PATCH 0/4] cover-letter: Allow MMIO regions to be exported
 through dmabuf
Thread-Topic: [PATCH 0/4] cover-letter: Allow MMIO regions to be exported
 through dmabuf
Thread-Index: AQHbT6PDX5zn/QnJaEWuVZ9mA55H2rLpHa5AgAE+6QCAANdewIBqbbOAgAOOrCA=
Date: Wed, 26 Feb 2025 07:55:07 +0000
Message-ID: <IA0PR11MB7185E7DBB9E959A2F40D4170F8C22@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20241216095920.237117-1-wguay@fb.com>
 <IA0PR11MB7185FDD56CFDD0A2B8D21468F83B2@IA0PR11MB7185.namprd11.prod.outlook.com>
 <924671F4-E8B5-4007-BE5D-29ED58B95F46@meta.com>
 <IA0PR11MB71858B2E59D3A9F58CEE83DCF8052@IA0PR11MB7185.namprd11.prod.outlook.com>
 <61DF4F0E-D947-436B-9160-A40079DB9085@meta.com>
In-Reply-To: <61DF4F0E-D947-436B-9160-A40079DB9085@meta.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|DS7PR11MB7931:EE_
x-ms-office365-filtering-correlation-id: 8d154215-9fbc-4723-d1b1-08dd563ae316
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?VFFkTGUwdjRjVnUrbUswMXRzTVF0QjBXd096M0pSaHFIdGRKTjNDeGxMNXBR?=
 =?utf-8?B?cFVWMXVPVWJ2Tm5nY3RmTm1ZbXJSTnk3WVM3K3F4dldHR2hTajBGK3AwV01Q?=
 =?utf-8?B?aFhoN0xySFgrVHFDRlhBWWJDSXdha0ZPaUdXeXY2TlBXOU0yUlhrdHArbUdI?=
 =?utf-8?B?R2hOVWV5MlVtTFB1Ylc0UjBWT3JHVnBLb3Z6Slh2UnRUbVlhZjdoSmhtOUYr?=
 =?utf-8?B?QzhHTndjZkY5dXBXalRtRjNJYVpxVTdrRUdaS3BrSVR4NlhsK2M0bUhJSXhL?=
 =?utf-8?B?QmhtaWFPQUlVc1JlS3dVSDFlMFJZYzF1WTJVbnU5ZTV0Y1lsU0VteVFmWWN0?=
 =?utf-8?B?VW1FTnhzYUZHamFWZU9CekwzUkUwS0hyZ0hhei9QSTV2ZlNEdEdRZmNDcGFF?=
 =?utf-8?B?aDVFeXE5V3ErdFlZSkVvU2ZvQUpLN2VNQ2h3RkcrTnYwNWdrM1NvTzZOQVZW?=
 =?utf-8?B?ZVY0NzExM2dxbUdrTm43SnhIaCtkejVuZDJQWWpOTWpTTWp6V1dSNXA4OUM4?=
 =?utf-8?B?dzM0QzQ2Q292Ti9zZHBGWnRJeDYzejJUVHdSdjYrYmpwZWppSDZKYXlPWXli?=
 =?utf-8?B?TVpENXRtVlY3NzNkRmRPTjdxcmtlem5waGhkNWZISmpScUdnQ2FhWnJMOHZT?=
 =?utf-8?B?S1VCaFlJeUpndW9rS3VpK09mR0ZxL0hpREVNNnIvR3pIbjYvNVlIRlRFYjN3?=
 =?utf-8?B?Q3ZCZ3F2TXFVK1I0OTBhbkRsQVV0LzhrdWR2TVhTZFhENi9BbStqT0NmcmVV?=
 =?utf-8?B?dEE0WWRkNVpETUN5UjFNNHo0SEUxbE5LM1pQdDNVelI4S3crbkRPeFAwUmcr?=
 =?utf-8?B?Wng0WE1TTkIwdnREQWIvcFFzWVpldlROZmhkS3BxdUY0UW1XVU81M1lkOGJD?=
 =?utf-8?B?ZzM1UVR3RnpIV3pZWVk3eVZPQmhqNVBZa0haSFd4SDB6UHd4ZUowNXQ1b0g0?=
 =?utf-8?B?cVEwOEdoN3pqRXFnVnJqUEVUTVFUTVZBcVdlcG5HUDdBcW1vaWRPMXppb2E4?=
 =?utf-8?B?MDgvTFBjV3N5N2s4NW93YStWcG9RTy9SNG1KMy9SWXVMRi91NWtVY0tpREJz?=
 =?utf-8?B?VjZNWFlxS1lDYWpOVm1NRlBFbldWaXlEWTIvTW9rajZxVHhBa1UzbTd6NlZl?=
 =?utf-8?B?S1dlVnk2dWphQk93Nk1kYTQ1ck5RMjZMSmRHd1BrSU9EdDM1WFhIRkFUOHlS?=
 =?utf-8?B?b29XMGJjTjl5SjN1NVMrRW9YZStjMEJEZHhvL3RzRmpNNFdwRjhkeXlHUTVE?=
 =?utf-8?B?RWREUVVEY2ROcDNneWJIaURUK1hBQ2FQZWNadnI1VmNyV091TktNdGVVUUty?=
 =?utf-8?B?dTlVekw0OWVLNDl5bTFpclBqekJzRmIwRng4NjRsZ3laTWJuVFcrZXM4Y1BD?=
 =?utf-8?B?LzVnbEEva0dzV21rcXg3TGczb2tzMzVsdzRlTkVLa2VwTnZPcjltNFo5YnZK?=
 =?utf-8?B?eTEzdVpBSkZVRXJYNVpSS3doMWpwUUJOWWJORVVvRk5ZWVowNmFJb3NzTmhm?=
 =?utf-8?B?YTVnWStlN05Rbm1SWE5Kdm1DWmRTSUZEc3Z6MVNwTTVBSFdGcVc5TFN6N0tS?=
 =?utf-8?B?VGdHei9QWmhUWE9iaEt6V3ZXb1J5NGdKQXVUblpVUlpYK1lnMHpTQUhHTGJ2?=
 =?utf-8?B?aW5lNnpDNDBGdWdoaXF5RFYxT3NiaU9zc2FJSlRUaG1IYTZtaW9ScnN3Q0hu?=
 =?utf-8?B?ZXoxblZRK2t4TVdVbERoM1lGU3hPQ3gzVEllWWV5NDZSUzRaVVlHVWZHeVAy?=
 =?utf-8?B?M3JGSDlwb2d3bHJhanRkbVYzMEVKbEZVWHFJSWtOS2xyTEhZSjVUR1h6Z0lm?=
 =?utf-8?B?a3kzN3d1SkpPd0NXZ2trYXhIT0hCQmNaamhBbzRzODkyem1XcXROaExMNGZO?=
 =?utf-8?B?UndJVi84OE9oSXRQREhBRldaWHJ5bzNmNjZQZkJqcnN6emc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RUxVeTFHaTk1aFkxc080WDhLTmtVUVdjVEhmdjl4UzBpQVM2cHh2WlFYNEpP?=
 =?utf-8?B?S1FVY3puYVFHR1VMN2pyMUNwT2RkTGxESVRTUHJOY25aei93Y0tEYk9haWhB?=
 =?utf-8?B?SDhDNzIyWGhhVFdtcGZtaTREaG56N3kvdjdiMWxhUHppd3NPaGxGWlk2dmdI?=
 =?utf-8?B?SjVreUVjQll2eUdHSlIweTJGbC9OSGdZSkdnVkxWU0pZUUpZT1VXN2VsYzBH?=
 =?utf-8?B?WGJIK00zdjVrZTRjN1YyZnQ2T1k5aDFVKzRlVmM0VnBlakFYczVxc21CM1Nw?=
 =?utf-8?B?RUNYaFZSS2pKdjJkOFR3SS9kcnMvcnZxbG85TDR6a2dIdmRuUEh2ZFhsaFhy?=
 =?utf-8?B?VlVWR1Y0aWJZQjRQbmE2OVl2OHhhN1V6aEpLY0c3OG5WQUtDVEFHajRIdWY5?=
 =?utf-8?B?UWZWM3ZnSXFUYUZ0QXpuaDhQWnpKbG5lcDNHK21qRDAyZStBV0xUaUp6b2Z0?=
 =?utf-8?B?K2NwazRtQTVock45eGtvaC93RTMrZzQwdXVOalFlNWV6MWlTZ2t2N1pnREt1?=
 =?utf-8?B?RlhVQStaZjR5M3J3QlpNMWJTNlFDRWVSdlhtRkU3MWQwUWw2a01GTHpiVi9H?=
 =?utf-8?B?YUZ2R2VaRW8zQ08wWG9KdzREZUd1SndPTnRLV0djR3hMZFdSam5RRHBXWER1?=
 =?utf-8?B?SklvdlJNenByMU5NVld2NXNVYzdteGxLclRETFJDUlhXTjRFNUpJRVQrUkk4?=
 =?utf-8?B?WnBmUUtnTkNwYjl5KzVtcGRTR0RIWDlEVTYwbi83cFpNNVZrQ05jMWpJVkxR?=
 =?utf-8?B?TG5GbkJSN0xMQ0hNb3pyb2dmdDZMb0ZKaUdKUGRzY0J4NEhOMC9pdys1aWds?=
 =?utf-8?B?Mlp2aFJoMnJFdUZmdThManN2V3Bpd01EZ2lLVVNDajFLWjFVRFBuUHhOSEM4?=
 =?utf-8?B?QTBuMkVwdmh6OEY1UXpoeWtvdXorZ1NTWWNRUlROL3JEL2JiZEF3T2labDVz?=
 =?utf-8?B?Q0FGOFBUdkI5dFZWVmVCYTJnK1NEd3ZRckFHL3QvUXpnV1ZzbndjVlNOSll0?=
 =?utf-8?B?clRqcGxlNm54R2RDSkQ2d2RPdnJGN0RTa1hBWGRoeWpuQklpTkYyKzZmQmlJ?=
 =?utf-8?B?RXlZNytmRUNxeUJtU0ZjYVZiMnA0bW9xUU5SMm1FS2JLeFVUVW93RElzTjFl?=
 =?utf-8?B?a3k5OXdlOUhjQzNaQ1pWTTVtTWRjZ2RReU1nbzFoYjJ6aHJ5SmUxNVVpRC9W?=
 =?utf-8?B?SWdidlNWQUxQQ2FFYlhDTTBsb0dTMWdYNVZFWU9RdnN5RmxBVVU1OEFGZStp?=
 =?utf-8?B?ZFlsNjJub1FwYTVXd1E3aklEMnEvM3FJaVVPbGQyMm5zVmV6NXVVZ1hYcVBT?=
 =?utf-8?B?UklmclN5VFZad21jbEpCZ3dGZmpvZEppaFdnTzRERllYMnlzREdEZFZjekth?=
 =?utf-8?B?eGo2bmhlZ2VsdWZUVnZWK0J0R2R3K2ZCVmhCNm0xc1J2eGMxTG1VSHQ1WUh0?=
 =?utf-8?B?czg0bk9rYWVPTnlVVDUwd3FPU3ZKVUt6Vlk4UmpXYUZadGtjVG51VE1UbzRH?=
 =?utf-8?B?NGJNYzMyTDYvZjl0ZERGNklMWURsTnJJWmU0c21tQUJoRGtyOC9GQmJsMzZ4?=
 =?utf-8?B?RUVOWi9ZczNVc2xlSjdxeW5lUDJ4T1d0QTJILzJ0MUt5UTFNb3BNd2IydVhr?=
 =?utf-8?B?YzNQK09XSG55U3ZCcUM4dWxlc1NDQkZVaTc3KzFXOURIUnpsSVE2K3ExUFA0?=
 =?utf-8?B?VGwrSjNlRXRrb0puQ2lpNDlpRk0yTllLang2KzNyckR3M3BocTFPSWpPN2N6?=
 =?utf-8?B?c0JMSmlDYW1BWnZ5TlhtNU5RUkYwNmQ0TzVscFpUSnoyU21laWFwYjlRYytS?=
 =?utf-8?B?cWNsbjVaWDZ3Q1FEbWNPc0FVUUtuTEo3VUl0cmxWTmQ3c2p5Y25zQmwyWlNi?=
 =?utf-8?B?RG9HMjBhdVRDZzIvSU0wRFFrcWNCRlJ6dzRDUjNYVXJjYmFjTjQ4SVhjT1By?=
 =?utf-8?B?dGswV1lNOXlwci9mQlEwS1Z6K29NMmtxTTJ0aUZkaWV4QnJkZzRTUjYwWkFi?=
 =?utf-8?B?ZWswa3dUTU5MNmdCV2c0MXFiVnZQVXZMM1JFeEV6K3J6K3cxUy9vMTZQeHJz?=
 =?utf-8?B?aGFIb2RFRWZidWRJVEN2YS9EUEpZTXVoWG80YllScktWWmU0QWZ0YllZeVp5?=
 =?utf-8?Q?w2UkKDSchP0U6CeOo1JleH9OW?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d154215-9fbc-4723-d1b1-08dd563ae316
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2025 07:55:07.3868 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EeGnxEdBCo24l8F/im3JgcX4WFVegnUPMpX3FAF48ByKwE5iEl2b9ByHMUX7VlGC/NsKbbtNQnEiM1MVZzzi6mkQhG2ESDS3oVFbMLpKQ+w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7931
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

SGkgV2VpIExpbiwNCg0KWy4uLl0NCj4gDQo+IAlZZWFoLCB0aGUgbW1hcCBoYW5kbGVyIGlzIHJl
YWxseSBuZWVkZWQgYXMgYSBkZWJ1Z2dpbmcgdG9vbCBnaXZlbg0KPiB0aGF0IHRoZQ0KPiAJaW1w
b3J0ZXIgd291bGQgbm90IGJlIGFibGUgdG8gcHJvdmlkZSBhY2Nlc3MgdG8gdGhlIGRtYWJ1Zidz
DQo+IHVuZGVybHlpbmcNCj4gCW1lbW9yeSB2aWEgdGhlIENQVSBpbiBhbnkgb3RoZXIgd2F5Lg0K
PiANCj4gDQo+IA0KPiAJCS0gUmF0aGVyIHRoYW4gaGFuZGxlIGRpZmZlcmVudCByZWdpb25zIHdp
dGhpbiBhIHNpbmdsZSBkbWEtYnVmLA0KPiB3b3VsZCB2ZmlvLQ0KPiAJCXVzZXIgb3BlbiBtdWx0
aXBsZSBkaXN0aW5jdCBmaWxlIGRlc2NyaXB0b3JzIHdvcms/DQo+IAkJRm9yIG91ciBzcGVjaWZp
YyB1c2UgY2FzZSwgd2UgZG9uJ3QgcmVxdWlyZSBtdWx0aXBsZSByZWdpb25zIGFuZA0KPiBwcmVm
ZXINCj4gCQlKYXNvbuKAmXMgb3JpZ2luYWwgcGF0Y2guDQo+IA0KPiANCj4gCVJlc3RyaWN0aW5n
IHRoZSBkbWFidWYgdG8gYSBzaW5nbGUgcmVnaW9uIChvciBoYXZpbmcgdG8gY3JlYXRlIG11bHRp
cGxlDQo+IGRtYWJ1ZnMNCj4gCXRvIHJlcHJlc2VudCBtdWx0aXBsZSByZWdpb25zL3JhbmdlcyBh
c3NvY2lhdGVkIHdpdGggYSBzaW5nbGUgc2NhdHRlcmVkDQo+IGJ1ZmZlcikNCj4gCXdvdWxkIG5v
dCBiZSBmZWFzaWJsZSBvciBpZGVhbCBpbiBhbGwgY2FzZXMuIEZvciBpbnN0YW5jZSwgaW4gbXkg
dXNlLWNhc2UsDQo+IEkgYW0NCj4gCXNoYXJpbmcgYSBsYXJnZSBmcmFtZWJ1ZmZlciAoRkIpIGxv
Y2F0ZWQgaW4gR1BVJ3MgVlJBTS4gQW5kLA0KPiBhbGxvY2F0aW5nIGEgbGFyZ2UNCj4gCUZCIGNv
bnRpZ3VvdXNseSAobnJfcmFuZ2VzID0gMSkgaW4gVlJBTSBpcyBub3QgcG9zc2libGUgd2hlbiB0
aGVyZSBpcw0KPiBtZW1vcnkNCj4gCXByZXNzdXJlLg0KPiANCj4gCUZ1cnRoZXJtb3JlLCBzaW5j
ZSB3ZSBhcmUgYWRkaW5nIGEgbmV3IFVBUEkgd2l0aCB0aGlzIHBhdGNoL2ZlYXR1cmUsDQo+IHdl
IGNhbm5vdA0KPiAJZ28gYmFjayBhbmQgdHdlYWsgaXQgKHRvIGFkZCBzdXBwb3J0IGZvciBucl9y
YW5nZXMgPiAxKSBzaG91bGQgdGhlcmUgYmUNCj4gYSBuZWVkIGluDQo+IAl0aGUgZnV0dXJlLCBi
dXQgeW91IGNhbiBhbHdheXMgdXNlIG5yX3JhbmdlcyA9IDEgYW55dGltZS4gVGhhdCBpcyB3aHkN
Cj4gaXQgbWFrZXMNCj4gCXNlbnNlIHRvIGJlIGZsZXhpYmxlIGluIHRlcm1zIG9mIHRoZSBudW1i
ZXIgb2YgcmFuZ2VzL3JlZ2lvbnMuDQo+IA0KPiANCj4gDQo+IA0KPiANCj4gCQkJQWxzbywgbXkg
dW5kZXJzdGFuZGluZyBpcyB0aGF0IHRoaXMgcGF0Y2hzZXQgY2Fubm90DQo+IHByb2NlZWQgdW50
aWwgTGVvbidzDQo+IA0KPiANCj4gCQlzZXJpZXMgaXMgbWVyZ2VkOg0KPiANCj4gDQo+IA0KPiAJ
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcva3ZtL2NvdmVyLjE3MzMzOTg5MTMuZ2l0Lmxlb25Aa2Vy
bmVsLm9yZy8NCj4gDQo+IA0KPiANCj4gCQlUaGFua3MgZm9yIHRoZSBwb2ludGVyLg0KPiAJCUkg
d2lsbCByZWJhc2UgbXkgbG9jYWwgcGF0Y2ggc2VyaWVzIG9uIHRvcCBvZiB0aGF0Lg0KPiANCj4g
DQo+IAlBRkFJSywgTGVvbidzIHdvcmsgaW5jbHVkZXMgbmV3IG1lY2hhbmlzbS9BUElzIHRvIGRv
IFAyUCBETUEsDQo+IHdoaWNoIHdlDQo+IAlzaG91bGQgYmUgdXNpbmcgaW4gdGhpcyBwYXRjaHNl
dC4gQW5kLCBJIHRoaW5rIGhlIGlzIGFsc28gcGxhbm5pbmcgdG8gdXNlDQo+IHRoZQ0KPiAJbmV3
IEFQSXMgdG8gYXVnbWVudCBkbWFidWYgdXNhZ2UgYW5kIG5vdCBiZSBmb3JjZWQgdG8gdXNlIHRo
ZQ0KPiBzY2F0dGVyLWdhdGhlcg0KPiAJbGlzdCBwYXJ0aWN1bGFybHkgaW4gY2FzZXMgd2hlcmUg
dGhlIHVuZGVybHlpbmcgbWVtb3J5IGlzIG5vdCBiYWNrZWQgYnkNCj4gc3RydWN0IHBhZ2UuDQo+
IA0KPiAJSSB3YXMganVzdCB3YWl0aW5nIGZvciBhbGwgb2YgdGhpcyB0byBoYXBwZW4sIGJlZm9y
ZSBwb3N0aW5nIGEgdjMuDQo+IA0KPiANCj4gDQo+IElzIHRoZXJlIGFueSB1cGRhdGUgb3IgRVRB
IGZvciB0aGUgdjM/IEFyZSB0aGVyZSBhbnkgd2F5cyB3ZSBjYW4gaGVscD8NCkkgYmVsaWV2ZSBM
ZW9uJ3Mgc2VyaWVzIGlzIHZlcnkgY2xvc2UgdG8gZ2V0dGluZyBtZXJnZWQuIE9uY2UgaXQgbGFu
ZHMsIHRoaXMgc2VyaWVzIGNhbg0KYmUgcmV2aXZlZC4NCg0KPiANCj4gQWRkaXRpb25hbGx5LCBk
byB5b3UgaGF2ZSBhbnkgcmVwbyB0aGF0IHdlIGNhbiBhY2Nlc3MgdG8gYmVnaW4gdmFsaWRhdGlu
ZyBvdXINCj4gdXNlciBBUEkgY2hhbmdlcy4gVGhpcyB3b3VsZCBncmVhdGx5IGFpZCB1cyBpbiBv
dXIgc29mdHdhcmUgZGV2ZWxvcG1lbnQuDQpTdXJlLCBoZXJlIGlzIHRoZSBicmFuY2ggYXNzb2Np
YXRlZCB3aXRoIHRoaXMgc2VyaWVzICh2Mik6DQpodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5v
cmcvVml2ZWsvZHJtLXRpcC8tL2NvbW1pdHMvdmZpb19kbWFidWZfMg0KDQpOb3RlIHRoYXQsIHRo
ZSBhYm92ZSBicmFuY2ggaXMgYmFzZWQgb2ZmIG9mIEtlcm5lbCA2LjEwIGJ1dCBJIHRoaW5rIGl0
IHNob3VsZG4ndCBiZQ0KdG9vIGhhcmQgdG8gZm9ya2xpZnQgdGhlIHBhdGNoZXMgb250byA2LjE0
LiBBbHNvLCBoZXJlIGlzIHRoZSBRZW11IGJyYW5jaCB0aGF0DQppbmNsdWRlcyBwYXRjaGVzIHRo
YXQgZGVtb25zdHJhdGUgYW5kIG1ha2UgdXNlIG9mIHRoaXMgbmV3IGZlYXR1cmU6DQpodHRwczov
L2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvVml2ZWsvcWVtdS8tL2NvbW1pdHMvdmZpb19kbWFidWZf
Mg0KDQpPbiBhIGRpZmZlcmVudCBub3RlLCBpZiBpdCBpcyBub3QgdG9vIG11Y2ggdHJvdWJsZSwg
Y291bGQgeW91IHBsZWFzZSByZXBseSB0byBlbWFpbHMNCmluIHRleHQgKHByZWZlcnJlZCBmb3Jt
YXQgZm9yIGVtYWlscyBvbiBtYWlsaW5nIGxpc3RzKSBpbnN0ZWFkIG9mIEhUTUw/DQoNClRoYW5r
cywNClZpdmVrDQoNCj4gDQo+IFRoYW5rcywNCj4gV2VpIExpbg0KPiANCj4gDQo+IAlUaGFua3Ms
DQo+IAlWaXZlaw0KPiANCj4gDQo+IA0KPiANCj4gCQlUaGFua3MsDQo+IAkJV2VpIExpbg0KPiAN
Cj4gDQo+IA0KPiANCj4gDQo+IAkJCVRoYW5rcywNCj4gCQkJVml2ZWsNCj4gDQo+IA0KPiANCj4g
DQo+IAkJCQlJbiBhZGRpdGlvbiB0byB0aGUgaW5pdGlhbCBwcm9wb3NhbCBieSBKYXNvbiwNCj4g
YW5vdGhlciBwcm9taXNpbmcNCj4gCQkJCWFwcGxpY2F0aW9uIGlzIGV4cG9zaW5nIG1lbW9yeSBm
cm9tIGFuIEFJDQo+IGFjY2VsZXJhdG9yIChib3VuZCB0byBWRklPKQ0KPiAJCQkJdG8gYW4gUkRN
QSBkZXZpY2UuIFRoaXMgd291bGQgYWxsb3cgdGhlIFJETUENCj4gZGV2aWNlIHRvIGRpcmVjdGx5
IGFjY2Vzcw0KPiAJCQkJdGhlIGFjY2VsZXJhdG9yJ3MgbWVtb3J5LCB0aGVyZWJ5IGZhY2lsaXRh
dGluZw0KPiBkaXJlY3QgZGF0YQ0KPiAJCQkJdHJhbnNhY3Rpb25zIGJldHdlZW4gdGhlIFJETUEg
ZGV2aWNlIGFuZCB0aGUNCj4gYWNjZWxlcmF0b3IuDQo+IA0KPiAJCQkJQmVsb3cgaXMgZnJvbSB0
aGUgdGV4dC9tb3RpdmF0aW9uIGZyb20gdGhlDQo+IG9yZ2luYWwgY292ZXIgbGV0dGVyLg0KPiAN
Cj4gCQkJCWRtYS1idWYgaGFzIGJlY29tZSBhIHdheSB0byBzYWZlbHkgYWNxdWlyZSBhDQo+IGhh
bmRsZSB0byBub24tc3RydWN0IHBhZ2UNCj4gCQkJCW1lbW9yeSB0aGF0IGNhbiBzdGlsbCBoYXZl
IGxpZmV0aW1lIGNvbnRyb2xsZWQgYnkNCj4gdGhlIGV4cG9ydGVyLiBOb3RhYmx5DQo+IAkJCQlS
RE1BIGNhbiBub3cgaW1wb3J0IGRtYS1idWYgRkRzIGFuZCBidWlsZA0KPiB0aGVtIGludG8gTVJz
IHdoaWNoDQo+IA0KPiANCj4gCQlhbGxvd3MNCj4gDQo+IA0KPiAJCQkJZm9yDQo+IAkJCQlQQ0kg
UDJQIG9wZXJhdGlvbnMuIEV4dGVuZCB0aGlzIHRvIGFsbG93IHZmaW8tcGNpDQo+IHRvIGV4cG9y
dCBNTUlPIG1lbW9yeQ0KPiAJCQkJZnJvbSBQQ0kgZGV2aWNlIEJBUnMuDQo+IA0KPiAJCQkJVGhp
cyBzZXJpZXMgc3VwcG9ydHMgYSB1c2UgY2FzZSBmb3IgU1BESyB3aGVyZSBhDQo+IE5WTWUgZGV2
aWNlIHdpbGwgYmUNCj4gDQo+IA0KPiAJCW93bmVkDQo+IA0KPiANCj4gCQkJCWJ5IFNQREsgdGhy
b3VnaCBWRklPIGJ1dCBpbnRlcmFjdGluZyB3aXRoIGENCj4gUkRNQSBkZXZpY2UuIFRoZSBSRE1B
DQo+IA0KPiANCj4gCQlkZXZpY2UNCj4gDQo+IA0KPiAJCQkJbWF5IGRpcmVjdGx5IGFjY2VzcyB0
aGUgTlZNZSBDTUIgb3IgZGlyZWN0bHkNCj4gbWFuaXB1bGF0ZSB0aGUgTlZNZQ0KPiANCj4gDQo+
IAkJZGV2aWNlJ3MNCj4gDQo+IA0KPiAJCQkJZG9vcmJlbGwgdXNpbmcgUENJIFAyUC4NCj4gDQo+
IAkJCQlIb3dldmVyLCBhcyBhIGdlbmVyYWwgbWVjaGFuaXNtLCBpdCBjYW4gc3VwcG9ydA0KPiBt
YW55IG90aGVyIHNjZW5hcmlvcw0KPiANCj4gDQo+IAkJd2l0aA0KPiANCj4gDQo+IAkJCQlWRklP
LiBJIGltYWdpbmUgdGhpcyBkbWFidWYgYXBwcm9hY2ggdG8gYmUNCj4gdXNhYmxlIGJ5IGlvbW11
ZmQgYXMgd2VsbCBmb3INCj4gCQkJCWdlbmVyaWMgYW5kIHNhZmUgUDJQIG1hcHBpbmdzLg0KPiAN
Cj4gCQkJCVRoaXMgc2VyaWVzIGdvZXMgYWZ0ZXIgdGhlICJCcmVhayB1cCBpb2N0bCBkaXNwYXRj
aA0KPiBmdW5jdGlvbnMgdG8gb25lDQo+IAkJCQlmdW5jdGlvbiBwZXIgaW9jdGwiIHNlcmllcy4N
Cj4gDQo+IAkJCQl2MjoNCj4gCQkJCS0gTmFtZSB0aGUgbmV3IGZpbGUgZG1hX2J1Zi5jDQo+IAkJ
CQktIFJlc3RvcmUgb3JpZ19uZW50cyBiZWZvcmUgZnJlZWluZw0KPiAJCQkJLSBGaXggcmV2ZXJz
ZWQgbG9naWMgYXJvdW5kIHByaXYtPnJldm9rZWQNCj4gCQkJCS0gU2V0IHByaXYtPmluZGV4DQo+
IAkJCQktIFJlYmFzZWQgb24gdjIgIkJyZWFrIHVwIGlvY3RsIGRpc3BhdGNoDQo+IGZ1bmN0aW9u
cyINCj4gCQkJCXYxOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzAtdjEtDQo+IDllNmUxNzM5
ZWQ5NSs1ZmEtDQo+IAkJCQl2ZmlvX2RtYV9idWZfamdnQG52aWRpYS5jb20NCj4gCQkJCUNjOiBs
aW51eC1yZG1hQHZnZXIua2VybmVsLm9yZw0KPiAJCQkJQ2M6IE9kZWQgR2FiYmF5IDxvZ2FiYmF5
QGtlcm5lbC5vcmc+DQo+IAkJCQlDYzogQ2hyaXN0aWFuIEvDtm5pZw0KPiA8Y2hyaXN0aWFuLmtv
ZW5pZ0BhbWQuY29tPg0KPiAJCQkJQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3
bGwuY2g+DQo+IAkJCQlDYzogTGVvbiBSb21hbm92c2t5IDxsZW9uQGtlcm5lbC5vcmc+DQo+IAkJ
CQlDYzogTWFvciBHb3R0bGllYiA8bWFvcmdAbnZpZGlhLmNvbT4NCj4gCQkJCUNjOiBkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IAkJCQlTaWduZWQtb2ZmLWJ5OiBKYXNvbiBHdW50
aG9ycGUNCj4gPGpnZ0BudmlkaWEuY29tPg0KPiANCj4gCQkJCUphc29uIEd1bnRob3JwZSAoMyk6
DQo+IAkJCQl2ZmlvOiBBZGQgdmZpb19kZXZpY2VfZ2V0KCkNCj4gCQkJCWRtYS1idWY6IEFkZCBk
bWFfYnVmX3RyeV9nZXQoKQ0KPiAJCQkJdmZpby9wY2k6IEFsbG93IE1NSU8gcmVnaW9ucyB0byBi
ZSBleHBvcnRlZA0KPiB0aHJvdWdoIGRtYS1idWYNCj4gDQo+IAkJCQlXZWkgTGluIEd1YXkgKDEp
Og0KPiAJCQkJdmZpby9wY2k6IEFsbG93IGV4cG9ydCBkbWFidWYgd2l0aG91dA0KPiBtb3ZlX25v
dGlmeSBmcm9tIGltcG9ydGVyDQo+IA0KPiAJCQkJZHJpdmVycy92ZmlvL3BjaS9NYWtlZmlsZSAg
ICAgICAgICB8ICAgMSArDQo+IAkJCQlkcml2ZXJzL3ZmaW8vcGNpL2RtYV9idWYuYyAgICAgICAg
IHwgMjkxDQo+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+IAkJCQlkcml2ZXJzL3Zm
aW8vcGNpL3ZmaW9fcGNpX2NvbmZpZy5jIHwgICA4ICstDQo+IAkJCQlkcml2ZXJzL3ZmaW8vcGNp
L3ZmaW9fcGNpX2NvcmUuYyAgIHwgIDQ0ICsrKystDQo+IAkJCQlkcml2ZXJzL3ZmaW8vcGNpL3Zm
aW9fcGNpX3ByaXYuaCAgIHwgIDMwICsrKw0KPiAJCQkJZHJpdmVycy92ZmlvL3ZmaW9fbWFpbi5j
ICAgICAgICAgICB8ICAgMSArDQo+IAkJCQlpbmNsdWRlL2xpbnV4L2RtYS1idWYuaCAgICAgICAg
ICAgIHwgIDEzICsrDQo+IAkJCQlpbmNsdWRlL2xpbnV4L3ZmaW8uaCAgICAgICAgICAgICAgIHwg
ICA2ICsNCj4gCQkJCWluY2x1ZGUvbGludXgvdmZpb19wY2lfY29yZS5oICAgICAgfCAgIDEgKw0K
PiAJCQkJaW5jbHVkZS91YXBpL2xpbnV4L3ZmaW8uaCAgICAgICAgICB8ICAxOCArKw0KPiAJCQkJ
MTAgZmlsZXMgY2hhbmdlZCwgNDA1IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pDQo+IAkJ
CQljcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy92ZmlvL3BjaS9kbWFfYnVmLmMNCj4gDQo+IAkJ
CQktLQ0KPiAJCQkJMi40My41DQo+IA0KDQo=
