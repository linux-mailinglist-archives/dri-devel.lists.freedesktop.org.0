Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B0AAFDA3C
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 23:55:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D89DE10E1CB;
	Tue,  8 Jul 2025 21:55:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a3qWNuD5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8EE710E1C6;
 Tue,  8 Jul 2025 21:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752011721; x=1783547721;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yc1fRnGAoh/qsEel40b00fpnFThNOVXU0Sgcn6bdSMU=;
 b=a3qWNuD5LhOdVrS30xJP5Gku31zcL7PYpyC7W3EcUep+AffgTtdJz5cB
 PbcOoGkDeHi4PpOS+C6dcm+rSslHIWLM/kZBr3i7E3vRYwnOTU51D4s6l
 fCwLTF0HNJX3LLlJ9k8coh4aimAOLUQdex4DPQnaxF7v/4Fk4oLkgbJqX
 3Pt2B5QtdYqjoAxTai7FHyr0PHttm7Je3+NAwmueYvfOiRVureFY/Bgnf
 t9DKgzcDd+7nDnxa5BW4nFyUTaqI6BsrV1IiqpDuNyHxISCEKmhN5DAXD
 hC3H1cTK2gL2Kqygde/wm8y6sKYQ/fzk9l20ETtLXw7V6FuLbbESZyuOz g==;
X-CSE-ConnectionGUID: EwP4qfsGStq2KGl7aqp5Mg==
X-CSE-MsgGUID: EI7wbUiKS76HJkVJXrXGCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="64959640"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="64959640"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 14:55:20 -0700
X-CSE-ConnectionGUID: dbPdfEA8SNSH1wDu/zpQvg==
X-CSE-MsgGUID: BkAPJjcHRQCUFoDEQBphrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="155232616"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 14:55:20 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 8 Jul 2025 14:55:19 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 8 Jul 2025 14:55:19 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.75) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 8 Jul 2025 14:55:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cDeridG8JkMYwflgx8jUk6pkZjApWHEw60UIft06AnPO3BHPDpN3I9I1foCC6NGXTl0HUxKD6ewNyNjWiior3qmkL/+ffDhsTF1y7sQ63J/7K1YErPUDu/tYw8feWopk14gEq1SA7BBoh7ZsOQ16vVWvSWi3PEMjWYEp2H93PU0lvqsnaltOmtq0kXYUXRtovStJT6GquLEURwk0+ImXN5T/S/WtoUgXRlfHqtt74x2TItv3ifX0lUtnjHxuw7g6Bmx8ba/jzcetC7A7maYu7LE+kNXE4N5GYNyl7SfM+n5Y3yvc+Gm/BLiJu9WpneOcLqe9CBOrwzr4d+VNEFMD0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yc1fRnGAoh/qsEel40b00fpnFThNOVXU0Sgcn6bdSMU=;
 b=PbkvRiNDtkgUGNUIMhwDXBT4hd5AWxCNoKh97QmJYl2yVWif3OXZA965YIJWrsD0ZCpRmS55EtIrShLC0PaAm8RtB/xtQjm3HIKmDwELCZmbnACTg0frbbvMWNXdN/mBklxqzA+wwEk65isKm+lkTzLwGGWs5v2gcvVViZPW+eoPqqUb33vJvAO3qRYuxJKkWzdsx9YKrIJ7oO22tBHM/gHmafb4Wb2Z1WtiV/BGOa0RTMZ1uxSj2C4QMfpQJ6FH6LSJqBgErxTgKpbYvQaJZhiC+zmHw9jeHCSPUcmx/BlHZuOIyKnbdtmg+Ke9rVwJS0rDlY+TMaDgH3Pdwe/QXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by PH7PR11MB7569.namprd11.prod.outlook.com (2603:10b6:510:273::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Tue, 8 Jul
 2025 21:55:16 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8901.023; Tue, 8 Jul 2025
 21:55:16 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Deak, Imre" <imre.deak@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: =?utf-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, "Jani
 Nikula" <jani.nikula@linux.intel.com>, Paul Menzel <pmenzel@molgen.mpg.de>,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH] drm/dp: Change AUX DPCD probe address from LANE0_1_STATUS
 to TRAINING_PATTERN_SET
Thread-Topic: [PATCH] drm/dp: Change AUX DPCD probe address from
 LANE0_1_STATUS to TRAINING_PATTERN_SET
Thread-Index: AQHb8E6ebzoBotYkSkubGfg07ucVwrQoxJNg
Date: Tue, 8 Jul 2025 21:55:16 +0000
Message-ID: <CH0PR11MB544452BD227559C5C0C21E82E54EA@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250708212331.112898-1-imre.deak@intel.com>
In-Reply-To: <20250708212331.112898-1-imre.deak@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|PH7PR11MB7569:EE_
x-ms-office365-filtering-correlation-id: 3048f54d-a660-4533-d7a7-08ddbe6a1fb3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|10070799003|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?TmpFUUpUUkNJRi90akNMZitSSEYrRmpuUWN1bHZCTDhLaklBcDBaT1l0YUta?=
 =?utf-8?B?RFlRQk8rck5hbWlaY1VzV2xqbGNDT0RldCs3N1h5T1k0THYzbnk3VjBqYkZ0?=
 =?utf-8?B?ejZaMjBDL2FvWXdBREs2TDRzWWpIQ0NCeGVBTjBBMzdhSnpZS0xmMHNuTGx1?=
 =?utf-8?B?RHdtbmU0SmxtRTVVelVpNG96STJvb3JjQ3dUUDFWRmZiZ3JjUVBweWVVMUtO?=
 =?utf-8?B?ZG5pMi9HR3MwUkQwU2ZQZ2FWNEE5M1hVYUhEZjM4Tk1HM3RhL3l0YllTZE9Y?=
 =?utf-8?B?b3phYS92UHZvbTZrZ1dCQU14aHhYZnFRd1JEWkNtNlc0dFRUVk1BcW16RVRo?=
 =?utf-8?B?VDlIV3h4RlNIUUFna0k4VWdXK0h0S2k4OExIRk9FZ2huT01VMUNNNzJyeEVZ?=
 =?utf-8?B?R2NxbmJ4S29kRnpHRlFKalZJNEJPZmJiUVJFNExqSUdUUWx4MGsxVDBuaE43?=
 =?utf-8?B?WDV0bFNFNy9MVDMvY3BBTit1aE54RXVidnlUVXdsa3RZWkZPbGhDOExPSmNu?=
 =?utf-8?B?S1FnT2tjQkNpVjBhcUdiOXBBbEZsZ1V3L2xDNFM5ZlBqUDF0R0JSemxxMTFX?=
 =?utf-8?B?YXRsazA3cktkZ0hZa2ZoaVFGZTRKY21sRExhdkhWT3F2Tk1aK3lJUkJ6aWRu?=
 =?utf-8?B?VEZRdTdYZ1pHaEI4ZDEvTThyUE9UbklvZERKbXVBWVBFd3VPSm1LdFJObzJo?=
 =?utf-8?B?bzU0alZ1dk1VenB5ZkE4RkpDanBGTnJVS0FIUDZmNkZLMjY5clZYdmx0M0Q2?=
 =?utf-8?B?eTZZeS9lQTNZUTVQQ0JLcVEwY1JGalZ6WXNyVnJrT21LMHEveFVxVks3cGFu?=
 =?utf-8?B?Q2FHWUZsK0J3cElaRTVuY0NSRnJmdlRUeklxVThMM3VFWjAvZTZZdUVZRDF2?=
 =?utf-8?B?WXo4OVhiL1Q5MlZqM3JtWERvMXovNTFuOG96RWVvczhZUENtQXR3QTREVG8z?=
 =?utf-8?B?WFJaS2pTRVZDcTgra3Q0a0VPQ3ExajFpNW5IN0VvMnpIOUlXS2lsOU8vTU5X?=
 =?utf-8?B?dFM1c3J3LzZENVZ2Q1RFdloxVnEwR1ZLZ2JyQnV4THlWZDhGOTRBRzFnSWxy?=
 =?utf-8?B?Um9rLy9paFc2RThEbXgzcGtZSjZzWkRpTFA3VllVODd4TFlESC95WGllelhR?=
 =?utf-8?B?M2x6bFVVbkF6aXQrRVlFdVlGcnVQdk1Ub2FONElXdXFQNTFxamRiT2lXY25R?=
 =?utf-8?B?ZkRCblBLcDhGOXdMWjVSeVQ4dFNCY1B4Z1BUYXRIYUNYRFJTekNDenc3ejFk?=
 =?utf-8?B?NEFmS0Y3YTVnUW4wZDh2UGlvT05WT09OdlhJNll0OTZWeHlQRmVZTDhHTGE4?=
 =?utf-8?B?dFhMU3lVY0hyTDYya0t2djJqUG85R0lLaGdOY2M1UHNRdU1Oc3ZxQmFONDFO?=
 =?utf-8?B?NW55ZzlBb0NCaXBBYmgraUN1dG5aVlM3TXliUjFoQzB2dzA0TUtIdDIxVGJm?=
 =?utf-8?B?Rjc4UFhoRGY3dEtWUEV4bGdscW5qTVhmQ244bWVyQ0VXRTJYWU5va3FObkdV?=
 =?utf-8?B?V2JsT2VJeHh1UFBDZ09ybFpUS0RSYTU0L2pJWXM2NUNNWXU4d2x1WGE4YWN1?=
 =?utf-8?B?bjNvUXZnR1pEc3h2Mm1QY3VaMGticm1kSHN4NzlSd1BFR0xLVWxYdWNCQ2Nt?=
 =?utf-8?B?ekFtdzdacDV0RWxKMmxETmVXVk5VckFiUnFHLyt5bmlkM0k1WTZtV3ZwcHhy?=
 =?utf-8?B?QU54cVAxWXpTRmxKWEpoZUtuQ2RBN0hNdXowTG02aGxKM0JMaDV1ZktFbWo0?=
 =?utf-8?B?dU1lVm5BeFdtUzAvQ2xNaHEvUG10M3BCUDYzaHdiUzNDa3lXTDlrNHZyeklR?=
 =?utf-8?B?L1ZJY05IR0cyOHdNZlFVWmdQZGhzNHlpcFFVSU1YckZWYUZITFVYMGp3b1Nj?=
 =?utf-8?B?b2JHZlAzNG1DWW4rVmhSd3dnWGxFdDBtUUpYTWZzQldLQTB4bFpTVmYzbC9w?=
 =?utf-8?Q?smsu0tK+0L0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(10070799003)(7053199007)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a2VoUWN2YWFJbVkzMUlHTFR6b0FZbGlzcTlaNldWYTVEMVp1TzlEak01TTA4?=
 =?utf-8?B?M0Y3N3h6VjVYKzFVd0xHRXQ2ZC9hRGJHNWVob3hLTlhZdWsvdUU2UlRhdHZZ?=
 =?utf-8?B?Z1RlNEdibk9qaXRUbXdva3M0Z2p3a2tVVEZPWXgxVVU5MmdCQXhBZEJhZDVs?=
 =?utf-8?B?MG1nWUQ0SjF3TDR3UzBTL1N2bllHSk1TbnlQTVdJSlpSOVFiTEdzSlByZmpx?=
 =?utf-8?B?RHVBcGdCQWRDeXNLK2hRZXZnaE9DUDV5N1ZGOXBTQlNVT0Z6ZnRJWU13MVdw?=
 =?utf-8?B?R0x4clV5SWI5WklidTNFeTlOU1BPMlF2T0twUUs2Tk5DWlJqOUNUbkNmeEJt?=
 =?utf-8?B?cngrUHhESElHTjZOcmhxWEJ1SWg3NWw5TS9VMFJnRU41cVBSNDJJL1crTnFa?=
 =?utf-8?B?Umk3Q3ZGUUt6TURKNEdzZDQrRkRNVDNhU1UzYjh3Vk43N3Q4V3R3N1ovY1RW?=
 =?utf-8?B?bm9UbXhkUG9HM0x0U09nZ0lJdDA4V2hTRkRYTVlsZjNsZlRIRmxoQzNWS25v?=
 =?utf-8?B?VzRFZXNPZ2lXQ21JQTZHTVkwdkt2UWdCRzNsL0hFV0xDV09pNUtIRGYxWHZl?=
 =?utf-8?B?TjZlT0tIak45MlltRVlPdGtDK3h5ZGcxaTQvUjdaZVpDaGNOZXQvZlNPRUxB?=
 =?utf-8?B?VUErWlBqbWNrSzMzMi9rY05qOGZWOUI0NDBUcTFmM1JhZlZZNHBtbk9Td0Rs?=
 =?utf-8?B?RDVIbjJlWk5lSUVEWUxQcjVLOCtQWkowckloNUpVcHAycDVvbmNlZDkyVUJR?=
 =?utf-8?B?UVdrTUZuOFZ2ZGlIWS9Rb3c4ZlF2QmpVeWxRQ3EzanNXVUEvaFozREo0c3lr?=
 =?utf-8?B?Uy8xdkV5VjNUODRSRjl5TkhuTHRRZFZkUGNQbEs3eERUVE0wajN0Q21FOTNj?=
 =?utf-8?B?VWl5eFRaMUVrdWFVYTZVekUrNVN2THdzdnRDTkQyejJGSE9ndFE2aC80TVRW?=
 =?utf-8?B?UGMvYWkzbXIxYVc3REtZb3g0WG1YMGdzOWlwSlowZGdBZ1RCYnpuazZ5NXdj?=
 =?utf-8?B?UUVRcnNib1p4ckRKVU82dEZuNjV2RTg2aWhIcUhoSFVEZGVYYzBvN0p5SWZz?=
 =?utf-8?B?dWpubHdJNlNLamJXTklPR2VLQ05LdXJMbkxzaUNFUXY5c2crRkc3dHY5Q3hW?=
 =?utf-8?B?REM3WGthTGVkUHNtc0J0TGZoU1ZNRk1Mc3h6d0pBZDVqc0RnUmhzUWZ2YVhQ?=
 =?utf-8?B?bVY4QVJPWFF1d0F2QWNjNEJyZkxuOElTemJsTllyS0pWUFdKUnFRTkxVeXJt?=
 =?utf-8?B?NHZZdTNSUWJFZ3BkeHBKZDlVYkhMeFFxdnMveEtKWWNzN3o5eXdUZGc0elEy?=
 =?utf-8?B?dEJSWUEwOG1VWWcxc2RwSmhZV2RNNWl1ZEtUN01LaWZ0c2pBNEFYbkh2cmhD?=
 =?utf-8?B?U1JMRmxZOEE5Q1ArK1dxSHVUT0UzSEsxNXd5c1NmTUx4ektVWVVhMGcySFRs?=
 =?utf-8?B?YjAvVVByVWJWaThmS3crNkFQSHFSdXpjbHVNUjUrYmZ4ZlFaS1pEcFhpOXVF?=
 =?utf-8?B?SzZscG82WE96RjMxUVRvWFR0dEdJY3dyMHNNcE5WNFE5VUFPRmNIQXlGVmVX?=
 =?utf-8?B?ZnNKbjNYYm5UVWlFaTdWTGx2a0hSNVF2UVF0K25oWFJyNlA3dDhNQjRGVm9W?=
 =?utf-8?B?OHFnaWhyU1JrNmFqSWkvSUxPMDVpWU5pbkU1REUyRUxaNTkzRVR3a0Z1eGhU?=
 =?utf-8?B?WXpmYXcxaTQ2QVdRNXUzM1VsN1p5SmhjVVREY0hYL2trQ2xxSDBIT3lVVVZL?=
 =?utf-8?B?eUM3a0RtMDd4UjlCNDUrNzlmdzlPbzhkcXQwaTNyRGpTdDlrVGlFTUloeGtG?=
 =?utf-8?B?Q2NSdjRyYlJFVDh4eWdYRm5LaktuS2h3MGQ5OXFLSjhsVEoyaWtZd3VQWnhz?=
 =?utf-8?B?cnA5OGphb05oczhtVWNaVzZHZHgyczZ6bklxbWR0VWJKamFVMU04bTQvdzBj?=
 =?utf-8?B?T2lyUUZGNHppK2h1Z1hLbnJOVFVTc0Fzemk3d3dLRHo3RXltMkJ5dy8xN2lu?=
 =?utf-8?B?S2l2SjVXeURTRERDdmdkRWh3UTFDWlNPamJmMlhXUTU1d0doRElUR2FPQkJ2?=
 =?utf-8?B?SmIvVVhJVDRGWkI0RUw5VFlmT3ZHNGZ2d0JYSzNWVFc0RUdXWnZEQkpxa2Mw?=
 =?utf-8?B?T3B2aHRUaDJLZVo4dFpsbjlZMGdYbzlLdUIwVjI1QnYyNHBWYU1QRVV5RDF1?=
 =?utf-8?Q?fqS1M2O1BSqzVO/pKNRjsNA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3048f54d-a660-4533-d7a7-08ddbe6a1fb3
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2025 21:55:16.3861 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S5jtRCRUlCJ3TwAbvUrfmo2+EOkCuKdtlw3XUOlgHJ2QH+WVT2KYOJP1Ou0WP/SeC7FYW4wjNlu/UyHnBVaptm8+k5XTaj1MDL2ZzB731BU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7569
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

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEludGVsLWdmeCA8aW50ZWwtZ2Z4LWJv
dW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgSW1yZSBEZWFrDQpTZW50
OiBUdWVzZGF5LCBKdWx5IDgsIDIwMjUgMjoyNCBQTQ0KVG86IGludGVsLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmc7IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZw0KQ2M6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBs
aW51eC5pbnRlbC5jb20+OyBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAbGludXguaW50ZWwuY29t
PjsgUGF1bCBNZW56ZWwgPHBtZW56ZWxAbW9sZ2VuLm1wZy5kZT4NClN1YmplY3Q6IFtQQVRDSF0g
ZHJtL2RwOiBDaGFuZ2UgQVVYIERQQ0QgcHJvYmUgYWRkcmVzcyBmcm9tIExBTkUwXzFfU1RBVFVT
IHRvIFRSQUlOSU5HX1BBVFRFUk5fU0VUDQo+IA0KPiBDb21taXQgYTQwYzVkNzI3YjgxICgiZHJt
L2RwOiBDaGFuZ2UgQVVYIERQQ0QgcHJvYmUgYWRkcmVzcyBmcm9tDQo+IERQQ0RfUkVWIHRvIExB
TkUwXzFfU1RBVFVTIikgc3RvcHBlZCB1c2luZyB0aGUgRFBDRF9SRVYgcmVnaXN0ZXIgZm9yDQo+
IERQQ0QgcHJvYmluZywgc2luY2UgdGhpcyByZXN1bHRzIGluIGxpbmsgdHJhaW5pbmcgZmFpbHVy
ZXMgYXQgbGVhc3Qgd2hlbg0KPiB1c2luZyBhbiBJbnRlbCBCYXJsb3cgUmlkZ2UgVEJUIGh1YiBh
dCBVSEJSIGxpbmsgcmF0ZXMgKHRoZQ0KPiBEUF9JTlRSQV9IT1BfQVVYX1JFUExZX0lORElDQVRJ
T04gbmV2ZXIgZ2V0dGluZyBjbGVhcmVkIGFmdGVyIHRoZSBmYWlsZWQNCj4gbGluayB0cmFpbmlu
ZykuIFNpbmNlIGFjY2Vzc2luZyBEUENEX1JFViBkdXJpbmcgbGluayB0cmFpbmluZyBpcw0KPiBw
cm9oaWJpdGVkIGJ5IHRoZSBEUCBTdGFuZGFyZCwgTEFORTBfMV9TVEFUVVMgKDB4MjAyKSB3YXMg
dXNlZCBpbnN0ZWFkLA0KPiBhcyBpdCBmYWxscyB3aXRoaW4gdGhlIFN0YW5kYXJkJ3MgdmFsaWQg
cmVnaXN0ZXIgYWRkcmVzcyByYW5nZQ0KPiAoMHgxMDItMHgxMDYsIDB4MjAyLTB4MjA3LCAweDIw
MGMtMHgyMDBmLCAweDIyMTYpIGFuZCBpdCBmaXhlZCB0aGUgbGluaw0KPiB0cmFpbmluZyBvbiB0
aGUgYWJvdmUgVEJUIGh1Yi4NCj4gDQo+IEhvd2V2ZXIsIHJlYWRpbmcgdGhlIExBTkUwXzFfU1RB
VFVTIHJlZ2lzdGVyIGFsc28gaGFzIGEgc2lkZS1lZmZlY3QgYXQNCj4gbGVhc3Qgb24gYSBOb3Zh
dGVrIGVEUCBwYW5lbCwgYXMgcmVwb3J0ZWQgb24gdGhlIENsb3NlczogbGluayBiZWxvdywNCj4g
cmVzdWx0aW5nIGluIHNjcmVlbiBmbGlja2VyaW5nIG9uIHRoYXQgcGFuZWwuIE9uZSBjbGVhciBz
aWRlLWVmZmVjdCB3aGVuDQo+IGRvaW5nIHRoZSAxLWJ5dGUgcHJvYmUgcmVhZHMgZnJvbSBMQU5F
MF8xX1NUQVRVUyBkdXJpbmcgbGluayB0cmFpbmluZw0KPiBiZWZvcmUgcmVhZGluZyBvdXQgdGhl
IGZ1bGwgNiBieXRlIGxpbmsgc3RhdHVzIHN0YXJ0aW5nIGF0IHRoZSBzYW1lDQo+IGFkZHJlc3Mg
aXMgdGhhdCB0aGUgcGFuZWwgd2lsbCByZXBvcnQgdGhlIGxpbmsgdHJhaW5pbmcgYXMgY29tcGxl
dGVkDQo+IHdpdGggdm9sdGFnZSBzd2luZyAwLiBUaGlzIGlzIGRpZmZlcmVudCBmcm9tIHRoZSBu
b3JtYWwsIGZsaWNrZXItZnJlZQ0KPiBzY2VuYXJpbyB3aGVuIG5vIERQQ0QgcHJvYmluZyBpcyBk
b25lLCB0aGUgcGFuZWwgcmVwb3J0aW5nIHRoZSBsaW5rDQo+IHRyYWluaW5nIGNvbXBsZXRlIHdp
dGggdm9sdGFnZSBzd2luZyAyLg0KPiANCj4gVXNpbmcgdGhlIFRSQUlOSU5HX1BBVFRFUk5fU0VU
IHJlZ2lzdGVyIGZvciBEUENEIHByb2JpbmcgZG9lc24ndCBoYXZlDQo+IHRoZSBhYm92ZSBzaWRl
LWVmZmVjdCwgdGhlIHBhbmVsIHdpbGwgbGluayB0cmFpbiB3aXRoIHZvbHRhZ2Ugc3dpbmcgMiBh
cw0KPiBleHBlY3RlZCBhbmQgaXQgd2lsbCBzdGF5IGZsaWNrZXItZnJlZS4gVGhpcyByZWdpc3Rl
ciBpcyBhbHNvIGluIHRoZQ0KPiBhYm92ZSB2YWxpZCByZWdpc3RlciByYW5nZSBhbmQgaXMgdW5s
aWtlbHkgdG8gaGF2ZSBhIHNpZGUtZWZmZWN0IGFzIHRoYXQNCj4gb2YgTEFORTBfMV9TVEFUVVM6
IFJlYWRpbmcgTEFORTBfMV9TVEFUVVMgaXMgcGFydCBvZiB0aGUgbGluayB0cmFpbmluZw0KPiBD
Ui9FUSBzZXF1ZW5jZXMgYW5kIHNvIGl0IG1heSBjYXVzZSBhIHN0YXRlIGNoYW5nZSBpbiB0aGUg
c2luayAtIGV2ZW4gaWYNCj4gaW5hZHZlcnRlbnRseSBhcyBJIHN1c3BlY3QgaW4gdGhlIGNhc2Ug
b2YgdGhlIGFib3ZlIE5vdmF0ZWsgcGFuZWwuIEFzDQo+IG9wcG9zZWQgdG8gdGhpcywgcmVhZGlu
ZyBUUkFJTklOR19QQVRURVJOX1NFVCBpcyBub3QgcGFydCBvZiB0aGUgbGluaw0KPiB0cmFpbmlu
ZyBzZXF1ZW5jZSAoaXQgbXVzdCBiZSBvbmx5IHdyaXR0ZW4gb25jZSBhdCB0aGUgYmVnaW5uaW5n
IG9mIHRoZQ0KPiBDUi9FUSBzZXF1ZW5jZXMpLCBzbyBpdCdzIHVubGlrZWx5IHRvIGNhdXNlIGFu
eSBzdGF0ZSBjaGFuZ2UgaW4gdGhlDQo+IHNpbmsuDQo+IA0KPiBBcyBhIHNpZGUtbm90ZSwgdGhp
cyBOb3ZhdGVrIHBhbmVsIGFsc28gbGFja3Mgc3VwcG9ydCBmb3IgVFBTMywgd2hpbGUNCj4gY2xh
aW1pbmcgc3VwcG9ydCBmb3IgSEJSMiwgd2hpY2ggdmlvbGF0ZXMgdGhlIERQIFN0YW5kYXJkICh0
aGUgU3RhbmRhcmQNCj4gbWFuZGF0aW5nIFRQUzMgZm9yIEhCUjIpLg0KPiANCj4gQmVzaWRlcyB0
aGUgTm92YXRlayBwYW5lbCAoUFNSIDEpLCB3aGljaCB0aGlzIGNoYW5nZSBmaXhlcywgSSBhbHNv
DQo+IHZlcmlmaWVkIHRoZSBjaGFuZ2Ugb24gYSBTYW1zdW5nIChQU1IgMSkgYW5kIGFuIEFuYWxv
Z2l4IChQU1IgMikgZURQDQo+IHBhbmVsIGFzIHdlbGwgYXMgb24gdGhlIEludGVsIEJhcmxvdyBS
aWRnZSBUQlQgaHViLg0KPiANCj4gTm90ZSB0aGF0IGluIHRoZSBkcm0tdGlwIHRyZWUgKHRhcmdl
dGluZyB0aGUgdjYuMTcga2VybmVsIHZlcnNpb24pIHRoZQ0KPiBpOTE1IGFuZCB4ZSBkcml2ZXJz
IGtlZXAgRFBDRCBwcm9iaW5nIGVuYWJsZWQgb25seSBmb3IgdGhlIHBhbmVsIGtub3duDQo+IHRv
IHJlcXVpcmUgdGhpcyAoSFAgWlIyNHcpLCBoZW5jZSB0aG9zZSBkcml2ZXJzIGluIGRybS10aXAg
YXJlIG5vdA0KPiBhZmZlY3RlZCBieSB0aGUgYWJvdmUgcHJvYmxlbS4NCj4gDQo+IENjOiBWaWxs
ZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPg0KPiBDYzogSmFuaSBO
aWt1bGEgPGphbmkubmlrdWxhQGxpbnV4LmludGVsLmNvbT4NCj4gRml4ZXM6IGE0MGM1ZDcyN2I4
MSAoImRybS9kcDogQ2hhbmdlIEFVWCBEUENEIHByb2JlIGFkZHJlc3MgZnJvbSBEUENEX1JFViB0
byBMQU5FMF8xX1NUQVRVUyIpDQo+IFJlcG9ydGVkLWFuZC10ZXN0ZWQtYnk6IFBhdWwgTWVuemVs
IDxwbWVuemVsQG1vbGdlbi5tcGcuZGU+DQo+IENsb3NlczogaHR0cHM6Ly9naXRsYWIuZnJlZWRl
c2t0b3Aub3JnL2RybS9pOTE1L2tlcm5lbC8tL2lzc3Vlcy8xNDU1OA0KPiBTaWduZWQtb2ZmLWJ5
OiBJbXJlIERlYWsgPGltcmUuZGVha0BpbnRlbC5jb20+DQoNClNvbWUgdXNlcyBvZiB0aGUgZmly
c3QgcGVyc29uIGluIHRoZSBjb21taXQgbWVzc2FnZSBjb3VsZCBtYXliZQ0KYmUgcmV2aXNlZCB0
byBzcGVhayBtb3JlIGdlbmVyYWxseSwgYnV0IEknbSBub3QgZ29pbmcgdG8gbWFrZSB0aGF0DQph
IHJlcXVpcmVtZW50LiAgQXMgaXMsIHRoaXMgcGF0Y2ggaXM6DQpSZXZpZXdlZC1ieTogSm9uYXRo
YW4gQ2F2aXR0IDxqb25hdGhhbi5jYXZpdHRAaW50ZWwuY29tPg0KLUpvbmF0aGFuIENhdml0dA0K
DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2Rpc3BsYXkvZHJtX2RwX2hlbHBlci5jIHwgMiAr
LQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Rpc3BsYXkvZHJtX2RwX2hlbHBlci5jIGIv
ZHJpdmVycy9ncHUvZHJtL2Rpc3BsYXkvZHJtX2RwX2hlbHBlci5jDQo+IGluZGV4IDFjMzkyMDI5
NzkwNmIuLjFlY2MzZGY3ZTMxNjcgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kaXNw
bGF5L2RybV9kcF9oZWxwZXIuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZGlzcGxheS9kcm1f
ZHBfaGVscGVyLmMNCj4gQEAgLTc0Miw3ICs3NDIsNyBAQCBzc2l6ZV90IGRybV9kcF9kcGNkX3Jl
YWQoc3RydWN0IGRybV9kcF9hdXggKmF1eCwgdW5zaWduZWQgaW50IG9mZnNldCwNCj4gIAlpbnQg
cmV0Ow0KPiAgDQo+ICAJaWYgKGRwY2RfYWNjZXNzX25lZWRzX3Byb2JlKGF1eCkpIHsNCj4gLQkJ
cmV0ID0gZHJtX2RwX2RwY2RfcHJvYmUoYXV4LCBEUF9MQU5FMF8xX1NUQVRVUyk7DQo+ICsJCXJl
dCA9IGRybV9kcF9kcGNkX3Byb2JlKGF1eCwgRFBfVFJBSU5JTkdfUEFUVEVSTl9TRVQpOw0KPiAg
CQlpZiAocmV0IDwgMCkNCj4gIAkJCXJldHVybiByZXQ7DQo+ICAJfQ0KPiAtLSANCj4gMi40NC4y
DQo+IA0KPiANCg==
