Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E23CB2630A
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 12:44:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 984B910E2C2;
	Thu, 14 Aug 2025 10:44:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LHUXmk64";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 088FA10E2C2
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 10:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755168256; x=1786704256;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lTT/SrNtqWXqd/hgJ1g5hqQiQkqmO7rod+pZy7Wk+dw=;
 b=LHUXmk64hN0dl2us/dTp0/O7W8sgYmE7Q82GcG4YyrjfljgxvAtwnTbW
 idBpxIbmKSAL/MKgJFaOVUJrWl25a5mtvfKMJlcv1VNv7aS/iL+I/a+Ev
 PR5uNSaBPKWMs2ahqEZPEKbgE5NqMdqJlwyHxIv5lvgkk1slgOz4O06GB
 vcMDYWeC6asiY0l21TBBTIZEaqg2Do2uROBo44DIld5J9Fqp1nUVQ9YhX
 L+Gu83DFF4RQKtCAon5qiO8qv32UVa1LYxpPz+LwI2HWQEdXETJRWd8KD
 bPgsDJsswlQQvEfZTKyIayCyi8S+jOEu74ez542dx7EHTr69q5JuwlpUN w==;
X-CSE-ConnectionGUID: yQy6jFLXTOi8PW4WQavfAA==
X-CSE-MsgGUID: GnWETAPnSaqEEkVEQJdDUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="68084968"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="68084968"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 03:44:15 -0700
X-CSE-ConnectionGUID: dmkEKf9yS8CA4EKfdE9KOA==
X-CSE-MsgGUID: jP9eyV0ZT320UpirOuUCeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="166366132"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 03:44:15 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 14 Aug 2025 03:44:15 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 14 Aug 2025 03:44:15 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.72)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 14 Aug 2025 03:44:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oQCHCKgt5/fccrGRCdkjSZ5lzMCv+gLIPX/XLPN9G8OhL01Hd2lo40abSyXfV5CzTExUNwJDs/rBF4RRTfwwq5NrB99gRfT6foKU+uY1bHOQWFHxRgW40HuP6eYRkdWmw44s7AGo9QhKuQOWYfMjInwXs2zpGh+ZDZqxQJd05pX78wAocLIS1hGQDS2yEsp4GpcsskrCnFRC2v2tddBnXIEJA4AUXjml3knv1BTepDeqhYpZ/VQPU2tOGobj+24mcW8jG4+ut0dR9mB6AfhGkQkTiCaVxRVxty64cRDegYd3nBTPSTAbnFuDtmH520e0C3eKNJQCZ2H8SB6i/By+ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lTT/SrNtqWXqd/hgJ1g5hqQiQkqmO7rod+pZy7Wk+dw=;
 b=NcRv+du99YSJgEIH6YyMcdxf9DSSlnfm124R5GztkR5WSXy//BoVozZZgfNVVrKNW4JFKpEin9CQRZJDCkEVQlUoJnXpZU95NoIHg5sVByTg6YvGCGiFiyznZojQhZXFNDGDa5k5uq/y9lA0sD8gsOpgzZOFO/3piA9E6QjmoYsa0ESX9V+AgavLJS+TR39htsw3ZQkRrru/X3iXGzP8n2oxItSWs9UCXzrJAjAWe2aoU6CHGnLlD+0zTT2pB1GgL1559EFO52a+HLl5I4Pm2Q9nsjVYIk2GHZuIiV6KB1IXS/1NbeoRsZXFfljNXjEN95ZQvONGAc0vkkK58BuayQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5549.namprd11.prod.outlook.com (2603:10b6:5:388::7) by
 PH3PPF8517B3F27.namprd11.prod.outlook.com (2603:10b6:518:1::d35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.13; Thu, 14 Aug
 2025 10:44:07 +0000
Received: from DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::6c31:ab8a:d70:2555]) by DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::6c31:ab8a:d70:2555%5]) with mapi id 15.20.9031.012; Thu, 14 Aug 2025
 10:44:07 +0000
From: "Avizrat, Yaron" <yaron.avizrat@intel.com>
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "airlied@gmail.com" <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, 
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>
CC: "jgg@nvidia.com" <jgg@nvidia.com>, "Elbaz, Koby" <koby.elbaz@intel.com>,
 "Sinyuk, Konstantin" <konstantin.sinyuk@intel.com>, "Levi, Ilia"
 <ilia.levi@intel.com>
Subject: [PATCH 1/1] MAINTAINERS: Change habanalabs maintainers
Thread-Topic: [PATCH 1/1] MAINTAINERS: Change habanalabs maintainers
Thread-Index: AQHcDQGynfOaZ33xFUSBU8dmS0/bNbRh6tYAgAAL3fA=
Date: Thu, 14 Aug 2025 10:44:07 +0000
Message-ID: <DM4PR11MB55491ACAA33DF29CEF3C67DAE935A@DM4PR11MB5549.namprd11.prod.outlook.com>
References: <20250814095556.5424-1-koby.elbaz@intel.com>
 <20250814095556.5424-2-koby.elbaz@intel.com>
 <DS0PR11MB77675D0ED3C78DF853B9A6CB8E35A@DS0PR11MB7767.namprd11.prod.outlook.com>
In-Reply-To: <DS0PR11MB77675D0ED3C78DF853B9A6CB8E35A@DS0PR11MB7767.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5549:EE_|PH3PPF8517B3F27:EE_
x-ms-office365-filtering-correlation-id: f475f8b5-d2a2-44de-ab6c-08dddb1f7eb0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?TEJ2LzdRMGI0dlJSZG5FL1RhV3JadE5tWCtGZ1NWaE1na0RabHB3R3hwaEVD?=
 =?utf-8?B?bzNGY3F6LzIxLzl0ZVhMSEV4N0pRaEJaVzVDOHRJTGtGNlBNRVpQZjBOMVNr?=
 =?utf-8?B?NW1HakFLRTdGVE0vQUFFQjNHcStDZTJmYm5YOEg3S2xiMTBydi8wN1Y3YXc3?=
 =?utf-8?B?OXlISXRDcXZhcGZQbU5udHpvaXdwQ3hwRUdERE9SREZVd3JIdmI3L2hqMnJz?=
 =?utf-8?B?L1pQSXF3T1hXNzBpWGhwTFpneHVMc1BoT0s3blNwdjlnM3VvbHNDbUZaUjc3?=
 =?utf-8?B?cTlnN25FNkhPTzZ1UUdpOTE0alM4ZGxJcmcxTFh6b3pXU0N1czlJMElIaENW?=
 =?utf-8?B?eThMN0VTNTVwODYxWHRuTDhHckpDNS9xRTJ5NzJHbytRSUJQNUhaYklzbWJX?=
 =?utf-8?B?UVdoUUZwQU9KYjRPVVpYVDhnNGlLU2o3SzNmRUNvbFZLc1poTW91ZTZwV3lY?=
 =?utf-8?B?VjdMTEF5SGNVVUpKRlRiQ1JxamdjL1I2VEtwTmZUZ2F0VW5CeWJHZWx0QWdY?=
 =?utf-8?B?aExNNzdXMTM4YWdnRmNXVG9ZWWwyMjRDdzM4dFZaVFZuVGlrRUIrdXErdHdG?=
 =?utf-8?B?aEJtWE5pMFJTaUdvR0RYQmVsekNUaHdyZXc1dm1IYUE3S05wR3lDeHBKTkdO?=
 =?utf-8?B?TExxeU9pWm1UZXV3SldRV0NQaXZmZDRxVlo2VUdBZkk1KzJHRU9JQ2ZrV1dG?=
 =?utf-8?B?U0Nmc2xSSEU5MHBFWTdIVi9Ycy9kNEJXbWRySUl4eVBQZFIrM3hZTENUbEcw?=
 =?utf-8?B?OFJtWFo2SkRVZ1Y5TGd4WkRTVWU5MEhnRThVWG1ncWFwL3BRSEJGUGEyUm9R?=
 =?utf-8?B?TzhDbVpSWDRZYklUYW5SWU4wQlYzNWtRWlFiNWx1ZWNyaWFvcW95d3dNQnRC?=
 =?utf-8?B?NmlJdnFQMlFkZWt1ODZtZ256QmdvclBQekUwVTQzQ0pRZklXRHNaVmhjR1hp?=
 =?utf-8?B?NEp2L3poRi9INHdheGV1U01vT1U4TERmMnVQenpWQkp6djNYVFBzWmphNUFh?=
 =?utf-8?B?VDBGZUY4VHdJa21TTDltcXNBQU4yNW0wRzFOdit0TS9CLzIremQ3UXRFYVYr?=
 =?utf-8?B?QVNEb1F2T2J5SmMzQWx5NzJuTmVURTZTdEVPUkZKUnRHNi9UYWx4NGZXUFpp?=
 =?utf-8?B?Vzd0K2QzaVc5cUl6NUxTdERCQ3JLVmdOZ0EvRk1pVTBrd05MalpWZDlLYndv?=
 =?utf-8?B?Zi9jdC81U29pU0lGN3pYajREUVdXTTg2cmd3OXowOTc0OW03Ulh6TllYYTds?=
 =?utf-8?B?RTM3SllVZ24vZGtkRmh2eUhPOFY1aEo2cXdOZ2hFNk1HeTJCSHoxN0UwTUdi?=
 =?utf-8?B?eG5NbSt6R2Z6dEpVV2NEdmFjTUNFckhhdW94ZGxuckloTmYyRkt4Q080WEwz?=
 =?utf-8?B?MHVPdS85V2hncldnL0lKdk0zdHgyUEJaSnlRQVR2TDJiMmxhQ2hjRTBsWHVO?=
 =?utf-8?B?TWxBRENyZ3ljUjUybFYrdTQ4cjY5cC9kQzV0alBzNVZ4SkZrZUJhREdmN1R2?=
 =?utf-8?B?dlV4U2ZPMHBMU3RGM3lvRDFkUk5rcEhaZWRCYXNLNW00WDUwT3JOMHdFbVNM?=
 =?utf-8?B?a3dKbmNtZzNtNzFYWGMwWHhqYm90VUU3c0FaSzNzZjVnYTNqZkViY1ZNVjA3?=
 =?utf-8?B?QldEOTVnb1UxWTFzcnJ5ZEFUY2d4QklIU2w3Sm5pclIrcEZhdk9SVjdjS0pM?=
 =?utf-8?B?azRmUlJFMVV1NkdZalBuY2hDZTEvV1RZWVh0enJTQW9LeWtGVXFkNXRYVzRB?=
 =?utf-8?B?WkNIcjZvZHVnNjd3UW04SE43SktZTU40RmcrYVV3ZFVIM1BNUUV0UWYrdmhw?=
 =?utf-8?B?Q2hBanV1QW15Wm9YMjl5NkFJRytFcmx2NWtCRVV1SWNUWlJlb1VFYjZ0UGZ0?=
 =?utf-8?B?Q2xMdFdsSjBnNy9BWmIrREJxOENBRE9HM3VpSHF6YjBQWTYwVUh6NXU0Nnhr?=
 =?utf-8?B?Wi9CMk1Oc3RIT3dnK0JSUElJQVI1dUpYUnRQRGpTUFhrWU5URTRudEFXa3FJ?=
 =?utf-8?B?L29MZ09lVHJnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5549.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZmhPM0UzWCtTZFdNS0FXVDNSalcyNm1KKytlNWNJRUVoUzZSRldveFhJRnlw?=
 =?utf-8?B?RUNnYjZkT1BzVEN4dllJNzZsOGJqTVJqSGJrbWtHeXV1NUd2Vyt6THhZTVpp?=
 =?utf-8?B?WSt2ZHBiV3BEYXhDNC9MeFROZGIzYmNtdEY2TnN5cHBOOXNnSnpSckJkbUdv?=
 =?utf-8?B?SktoQlpYVFBnanFPbDc3TDFFS2E5Zm9CTTZobEcyeGpIeFF2WlIxdlArakM1?=
 =?utf-8?B?a1ZqcHJUa1k0Q3Rkc2xsMUpoaFE2dkhnTldKWUlVWXU3a3ErRldYRzhOVFF4?=
 =?utf-8?B?bGR2T3dWNm50VVVsVmpLQVhzaVh6U0g2ZVhNNC9vTUxDanFidTRyeUhZenNS?=
 =?utf-8?B?S001eFlIMnNPdEw1dy84cEltelFISEVHbUt3cjdyNUkweTg2aTFSNDQzTXly?=
 =?utf-8?B?ZlBkeVdPMkorcDVzczR3TUh6Y1pwc0NuTkJDV1JlbVZSY0NlQ0VQWFN2ejB4?=
 =?utf-8?B?M0x0bzZmVEw5MFl0bkZ1Q3o1UFR2VEdZNysvUVBrMVlDTEx4T09NUVRvUUZk?=
 =?utf-8?B?MTlEenQvL1kvQytQZjNZeFc5SmxzZlNVQmtHckk1MUhqUjdtNUk1ekRheXFR?=
 =?utf-8?B?b3g2OGVYd0NMY3pZNlo3bFNQamZ6Rm9MSTZUZkZzM3BFdDYxbmk1bERpaEpm?=
 =?utf-8?B?aHpOZkVIczV1ZHkyODdXVk54U3RwOFFsL0MrTXdSNmZDeERPZmh0UkdqOXZV?=
 =?utf-8?B?VCs5UFFjdG1WYXdraldONGdxaDZoZDVoTVBmOTVNb0pDRjNuMFJHZmJidE82?=
 =?utf-8?B?YmxUMzV1cFY1ZzhTeWJqSFdHeTVoVVVkN2o3eVhDdHREMGdURUp3dzA3TEpK?=
 =?utf-8?B?emYvbWM2aTZlZTdodzhxazZMYkw2dDRROTYzZHhoejFUcGlycGsxNnBtZHhC?=
 =?utf-8?B?cGhNNThyM3F5aU1EQVpKczB6ZFUvZk8zcmVkWEF1emhUaXpVbWJvUVN3VkRI?=
 =?utf-8?B?NlpYdXB6WGVucGNPS0JWZjJlbTBYRW1Sd1dEWXJBb2dNZ3hBUUxqWklvdHBj?=
 =?utf-8?B?THVYYXRyU1pEWFJ1dnVaT2FqU1JZVERTR0JoWHFXVkdzc1JNWTdCU0ZuWnRs?=
 =?utf-8?B?WnlZMTBIMzJoN2pjZHZDd2FJR045YUZaTUJRQkVMSTR4Z1ZSSHZqZ0VvRmx0?=
 =?utf-8?B?VUY5eHBhR1Ayb1F5aUNXN0ZPRjRCQ1Joc2c1UFppYTRsQmVJNit3ZkQvWm00?=
 =?utf-8?B?NXBSWXExWmZaTDF3K2tKNnRzcTM2YnJJdHN3ZHlJUjZUT1FybWV5Z2w2QmNu?=
 =?utf-8?B?eDZYb2I5bE5heW1ZMnMvZVdSUEFzWjZ6OHNEb2pNTXI5b2NnS2kycUM0Ly81?=
 =?utf-8?B?UGZrTzJTTWE3OFpWcUlBM3FzdWxubVoxeGRuQ0lrdVNMT0hSWWFmV2pQUUoy?=
 =?utf-8?B?cENDdG9vVkVOQnQ1T09OWnpoNVlCKyt1RG9FUit3NE1lcVhyL3F3VG14NC8y?=
 =?utf-8?B?VDZSeFY4a0RxZ0prYTloTlhCaXIyZ1J3M1ArQmNJaThRZVJWcGdISUZmL0ZU?=
 =?utf-8?B?blBXUHJaM1MxR0hCNkJwa29Fc012d2M5ei9pUVVDYmJPdkdBc2x4NG5ucVdU?=
 =?utf-8?B?a2g3QmNEWGlVWk4ySVFlWXRid2JmeVhHNEJYZCt6dDJrVkgvTGh6RCtCYUQ0?=
 =?utf-8?B?SmVxWllYcFpwcnJoYklZUnZQTUIrMGMxa1JvUEdDcTlsT1IycnVRMDdydjA5?=
 =?utf-8?B?dXV4L2U4dkpoeU1yL2NURm9SR0FQSzkzK050YjVaWURYT2ZGV0NTL3NMbFRo?=
 =?utf-8?B?N3dPVGNCVkVlUGtxaC9jZ1V2Vkp0Tm9ROWFIbERSZ1dSNmJnLzBDdWlsaThG?=
 =?utf-8?B?aWhOSUUrREdINVVSZzNDQWNXTWNvLy9FakFjQWpwcTZKN3NSczBjdVlHY1NQ?=
 =?utf-8?B?L0ZMUzgwaitCTHVVT3FGYW52TW9SZ2RaVlhBRStIMk9rTTd3KzZZeVJ0cG53?=
 =?utf-8?B?VEdhWVlvZDI5aExCK0RZNVordmRtTzhPbXJZeERjbnNLcFVRcEdmSm9FbUwz?=
 =?utf-8?B?MVJUbUZQVVkrU1FxUzF1OVhpTWdvWVNxeU1qcVFnc3VVVmhEbG5xcWVtV0lD?=
 =?utf-8?B?VFRqcWY1dHJGQ2lqdS9abm5KZEJ4RkU4emhlT1BqVE5iRm0ra0txL1VaZjBT?=
 =?utf-8?Q?5n7AYsdYW8/9R9Bw9yp0q1DDq?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5549.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f475f8b5-d2a2-44de-ab6c-08dddb1f7eb0
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2025 10:44:07.1937 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OaKfRYyRt3wkCjkgbof7ngL5Z14YOo2xLRESda5L9i4Ws99E7FrN7UhJfVg6JBu3nuEuG/OJim6sNrjM/Ykapw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF8517B3F27
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

SSB3aWxsIGJlIGxlYXZpbmcgSW50ZWwgc29vbiwgS29ieSBFbGJheiAmIEtvbnN0YW50aW4gU2lu
eXVrIHdpbGwgdGFrZSB0aGUgcm9sZSBvZiBoYWJhbmFsYWJzIGRyaXZlciBtYWludGFpbmVycy4N
Cg0KU2lnbmVkLW9mZi1ieTogWWFyb24gQXZpenJhdCA8eWFyb24uYXZpenJhdEBpbnRlbC5jb20+
DQpSZXZpZXdlZC1ieTogS29ieSBFbGJheiA8a29ieS5lbGJhekBpbnRlbC5jb20+DQpSZXZpZXdl
ZC1ieTogS29uc3RhbnRpbiBTaW55dWsgPGtvbnN0YW50aW4uc2lueXVrQGludGVsLmNvbT4NCi0t
LQ0KIE1BSU5UQUlORVJTIHwgMyArKy0NCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pDQoNCmRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJT
DQppbmRleCA1YzRkNmU0OWY3NWUuLmI5ZTIyOGUyYTgyMCAxMDA2NDQNCi0tLSBhL01BSU5UQUlO
RVJTDQorKysgYi9NQUlOVEFJTkVSUw0KQEAgLTEwNjY2LDcgKzEwNjY2LDggQEAgUzoJTWFpbnRh
aW5lZA0KIEY6CWJsb2NrL3BhcnRpdGlvbnMvZWZpLioNCiANCiBIQUJBTkFMQUJTIFBDSSBEUklW
RVINCi1NOglZYXJvbiBBdml6cmF0IDx5YXJvbi5hdml6cmF0QGludGVsLmNvbT4NCitNOglLb2J5
IEVsYmF6IDxrb2J5LmVsYmF6QGludGVsLmNvbT4NCitNOglLb25zdGFudGluIFNpbnl1ayA8a29u
c3RhbnRpbi5zaW55dWtAaW50ZWwuY29tPg0KIEw6CWRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcNCiBTOglTdXBwb3J0ZWQNCiBDOglpcmM6Ly9pcmMub2Z0Yy5uZXQvZHJpLWRldmVsDQot
LQ0KMi40My4wDQoNCg==
