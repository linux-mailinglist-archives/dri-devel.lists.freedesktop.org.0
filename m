Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CBE09EDC9E
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 01:45:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 988D510EC94;
	Thu, 12 Dec 2024 00:45:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l+7kC3RH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CC7E10EC94
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 00:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733964320; x=1765500320;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Y21e2Q3M0Be2AvzOlUC6g/oJzgHCcGEgjoxF271lHUI=;
 b=l+7kC3RHKdXNfIs5g1bHd3/PDyrk4xtYju9gCafVW+NeaGl2ijjl0afk
 5AccQLK26z72Y0Zj/HBM0Bktrbw+kmIOwDjTEECh5Wl9aj1aDVtAUrhal
 Y10gmcNktB1NB3E85tSUbxQNcxWnfdVWV+XIzNPx1O8PreqbRld3hxdGX
 KnbCAl8aYMpNL/br9z3LMv01sa3ODV8K45GF7cksqnLjJH7fK4T6vRLBc
 ApsKzIdpy/7WVFeDdWn6tBphzuNMbymJCY2HCx/X/k6FBOLJdD7/R03vK
 qvItO6mEa2qTjsF/tKIgeR5rnPanJKZNhk2/jvrFqSO5SE2aJDfB4a7yC w==;
X-CSE-ConnectionGUID: xT2AwtLbTx6YON/VTl7aPg==
X-CSE-MsgGUID: ZrsXHd5pQ7m8WhwVDz1ZQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="21949114"
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; d="scan'208";a="21949114"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 16:45:19 -0800
X-CSE-ConnectionGUID: 758SdKKUSFGQ4ner5C5HWA==
X-CSE-MsgGUID: fOolBeEdRTyAtP6lTnXveA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="100978873"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2024 16:45:19 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Dec 2024 16:45:19 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 11 Dec 2024 16:45:19 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Dec 2024 16:45:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vtO2pAcvH5uM68azRYVY58pVNwiN3rTENTgMyjTj9Q09hofCDY90D07s/gIND833xfln+2MIHbm5iwlSkRMeky1RBCz0oHsDXkNjhWeyd+yuSPHUAPXAJOJFlGkV8mAQx4TOD/KbscHrMi6LIQSR2o4q89ejOf2UY/WRye/R9pwEb8XuvlBtIISsErjfFsYDGTb/NKZnFped8MWsDXPo8F8ZpfK+BKMrcrm47ZPbSEzqQ7EKmdrHWlLdtW1arJ7+59bfUJFNRdI9/5TvgY6N1iCjqZSSilfBhJ1bo1Qu4dsguDptc7axn7lKdA4khpYlJBqxH7Kii0I/NzyCUwL4Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y21e2Q3M0Be2AvzOlUC6g/oJzgHCcGEgjoxF271lHUI=;
 b=nmv5DlHzRBc0jfaLTL6OKuLIaqG5zD6vmNJZEfF4ZQRfMLLzDvRBYiQkl/yx5cEU+blO05nNIMuae4oEE13VCQkf29tpa2UqB6VbYK0CVcnYhxBqnYMBpsiTW0YoQcnyOg2AywligmoFyMcczaFPnhXyyvpif9or5xvLbBWUxLdMzw+pvxUfW6CuE3pwLul0Te1ZWAWGYCh2xKA4LA1VGA3yuz0XISBGTSDhzGOfbovB3x0Vm8FgNOaOvbKDc1mpj9Z2FUyVAClM48+lkANz+gZerqICRuz2snYSgMzsB7k0owUNQW7iEI1ZvY70hzpTZLeLiWG/xEQRPj/f/pXbWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by MW4PR11MB6982.namprd11.prod.outlook.com (2603:10b6:303:228::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Thu, 12 Dec
 2024 00:44:55 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%3]) with mapi id 15.20.8230.016; Thu, 12 Dec 2024
 00:44:55 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Jann Horn <jannh@google.com>, Gerd Hoffmann <kraxel@redhat.com>, "Sumit
 Semwal" <sumit.semwal@linaro.org>, =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?=
 <christian.koenig@amd.com>, Simona Vetter <simona.vetter@ffwll.ch>, "John
 Stultz" <jstultz@google.com>, Andrew Morton <akpm@linux-foundation.org>,
 "Joel Fernandes (Google)" <joel@joelfernandes.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Julian Orth
 <ju.orth@gmail.com>, "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: RE: [PATCH v2 1/3] udmabuf: fix racy memfd sealing check
Thread-Topic: [PATCH v2 1/3] udmabuf: fix racy memfd sealing check
Thread-Index: AQHbRmlh2I0Vg+HJjUOdEDCAy2cWibLh0F1A
Date: Thu, 12 Dec 2024 00:44:55 +0000
Message-ID: <IA0PR11MB7185F52956A0897CDA857CFEF83F2@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20241204-udmabuf-fixes-v2-0-23887289de1c@google.com>
 <20241204-udmabuf-fixes-v2-1-23887289de1c@google.com>
In-Reply-To: <20241204-udmabuf-fixes-v2-1-23887289de1c@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|MW4PR11MB6982:EE_
x-ms-office365-filtering-correlation-id: 090b5756-f68c-4638-ce5f-08dd1a463262
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|1800799024|366016|376014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?aXhKNWQvaVpNM0pvNXArNkpmY2QzT281L3VjN1JzVnljdTM4S0VHV29CZG5w?=
 =?utf-8?B?MTJydnBiOHpmQVJ3SG1OWlpYSDJIT0NpTGdkY3I4bkpmaVZNUUlVOEhjdzJT?=
 =?utf-8?B?SVMxajZRd3JKL3NQWkZrNlpVemFnM2t1VWVtUzQySFhJakU1ZEJGU0pNY1Jv?=
 =?utf-8?B?bXpaem1MSGlkR21CSmNXRlYzYWFIUmNJVkhUZHdnaDBpV1d2VVZ2cFZpUG9Z?=
 =?utf-8?B?M3pkVWg0YTFLWUszS3ZTcU05eHNYVUxlU0RXS1NUaEN1UXZIbjhRSEpaQzFm?=
 =?utf-8?B?TXZQbW1aNGxucVk5U3JTbS9HS0R4OE5mbWxoQXlsNmlQNkxjcnU2WWthVWM1?=
 =?utf-8?B?Lzh6eDhuTjF1NGJrdkdrMTdpRlNYMEVvaVM4OUJuN0svZjBIOStLV3I0ZjNo?=
 =?utf-8?B?WjRzQWNtVVBmVHVxMDZETWxDcVJFQmZYMFZGVFNVOUxpRXVPb0RwREt3R21O?=
 =?utf-8?B?ZVo4WUsvWmk2QjRXZGpkRHcyMm5ZS0pHbUE2Y0F5dVlxMUxQU2p1a2NCUGFo?=
 =?utf-8?B?OUpDb3JRQ0lhbVo4YnA4d3NTeFY0eWhxdG5relpHWVJoaitWYmw3bkVKMmtx?=
 =?utf-8?B?d3RaTVVQbElSQzI0MGNGelVVSytvZTlrVlFkTXl5WUxNT3liNGNlcmY2cjVr?=
 =?utf-8?B?YzV0dVdpd3R6WXV5M1pYNHE3WGxnSmJWWlNPZ0hUTVczUnNOMkhQZGNyUEJ2?=
 =?utf-8?B?VVlyRTJMalNFNUJndlNoQ3A5K0hOWFl1WUpmNm1hWEpSZ0FyTVNIcXJzZnov?=
 =?utf-8?B?cTdyUHlxcmRHSjZGdHpFVkorajhBUHd5aWU4S0FkaC9kdWlhSzZ1RFVyVnVz?=
 =?utf-8?B?blgrbEc3Z0FlSW5PakV4cEFLMVduZnA3V1c4cGRNdFF4bGJ4RTh2N2IrRmFH?=
 =?utf-8?B?SlNMenRoaDV5ODRKM2YySzlaNTIxK3JZTGxud252dkFmK2tuRGlvUXNtRVlm?=
 =?utf-8?B?L2NmaU5oU0diN0p2NUg0TmI3WmJEajlyZlh0VzFPL2Q5Zi9nMkFEUUFVTXlh?=
 =?utf-8?B?SElMdEM2bXAvQ2ZCb0piOHppSzcvd0FqZXRKZk5PdlpneGRLaDMvd212MHY5?=
 =?utf-8?B?SEV0TkhsRW5GNUo5UllFMFc0cmEyajBQWWtLNzFnY09BZEtQZ2h3R2sxZ1Nl?=
 =?utf-8?B?STVUSHU1SjZCM2lJaGVuVlNheFd5bUFnVHpkUlNVWkJUQUlvdGZMeGVUMlR4?=
 =?utf-8?B?M1lKclJWU2VvMGE1MkVvekRwbEJLRjIyZmNZUEMrZGJrQXlFUk4rT3E4OFlV?=
 =?utf-8?B?cHAzZUZPK2R6UlhYLzdMVlV1UUxPL1lvTzJRd29hWjRVdldLSGJnRVhlSmZE?=
 =?utf-8?B?NGFNOWxSanhyNlIrQUN0eE9ER0VUeEN6Y2VHeWtNa00zWHRkTVY2bmdRRTlI?=
 =?utf-8?B?aGFLRThQdk1jNUJYN0xnYTI2TjltekhxS1hsYjFYTmt4R2hrcU1WR2lic3Bx?=
 =?utf-8?B?d2FBYmsxR1J3dGFtS0diZitNWXJ6c3B5NFdZdmwzMGZ5aDEwYjg1a3l5Y2FM?=
 =?utf-8?B?MTZVYmx1dTFMeWJaZ2xlN1hYcUZ5dHl4MU5CRXZpMzBYSmtCSHFkK2RsTlho?=
 =?utf-8?B?czZyTndoNDlSZ29JQ3Z3SzlmN21LTmpDN0hkUHRZeVo1WmhCeXg1UnYwQitn?=
 =?utf-8?B?elFrejNuSnl5Y3ZiTFJyU2xFa093YmhqNSttdXMwRm1QakRzaERCdzBoc3Qx?=
 =?utf-8?B?bmhtOUo5ak4vT29FWVhmaU4xQlNNVDhES3pPMzJwaDYwUVdYbDZ2Mk1rTDBR?=
 =?utf-8?B?UHJDZUF4eHMxNThaVk9wanloYUdCSzV6QlpSV1Z2L1hMVmxuOVRtMUM2UEV4?=
 =?utf-8?Q?+kfw/FBSzAtbk0aJBA8jfb5DFw2Rib5sQIVqk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(366016)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bjJCSldpK1ZuYmpsRmg2Qm9ZaUVDeFZWbTFvcXA5ZnR3dlUwV25tL093eWpT?=
 =?utf-8?B?UWRLUXJhMUpLbUVDUzNhbUE1bDdSK1BhWFZ4UW0rdElnZkdlOFhhYktnRXBp?=
 =?utf-8?B?Y2crWWtuMDlsU0F1R09HaUFkN3lvQkxIVTdqczAxRk9hbmVjK3FCamo0bkxZ?=
 =?utf-8?B?V0Uray84UVRQUFBxOFZGMDB4a1QzREgwUTFzeHVDMlk0a2ppemU0Y3luR0VQ?=
 =?utf-8?B?OFlMY3Q1YTdPcjNkYzRzcFV6WHlnV2tWVkdCdW9aVU9GSHRNaHRMWEhBUFo5?=
 =?utf-8?B?bE5OY1hPaG1ZVDJBUG1GK2tzWmhmZElyS2VGNmpMb3BwL0NRTEQyeGVaZ2dQ?=
 =?utf-8?B?Qkc0MENxaFlvb0pVR1Z3cDhraElTU0xObmVQaGVZWjdkdWhlQ1dsYk4wTDky?=
 =?utf-8?B?K2VVdFZIaHF6TzY2OXpveGxCN3dveklkNURaRmo1cDNPWUNDa2VMaWFzL3I1?=
 =?utf-8?B?MlVSWVJaMzNoRXVlUzBUU0YySUtjMitWMmFvN2RDbWxycGl5SU1XSHZvZDl4?=
 =?utf-8?B?UXdMWkQyeGx4OEROR3pJYWx2S3c4WU0xaDNyVlZFVlJYeU1HbkNpZUk5OUUy?=
 =?utf-8?B?cDRlSnBEdXdTUS9GcXR3dm9DZ0kvRHVadDRZV1ZxcWZxaTNRREp2amZEVmtL?=
 =?utf-8?B?NXd1clEyQTEzWThpWXJHSUNKbGpGa28vT3gvekpxVnliellPTlVuS0l6MHpk?=
 =?utf-8?B?anNGV2lLRUZlSUNhQjNwNFBBRlBJdUFLVkorTjRxTGlTa1dzV1V4K05idW1s?=
 =?utf-8?B?ODdGYU4wR01taHo2NWVrWUlOMTRxYXMzZXM2bGU5K0RjT1JlbzJSZXRYUVpL?=
 =?utf-8?B?OEFQMjZaSXRMaEUrQWxtcEhvalJsUmFmbmpQQktPb05jTWtSNmtudWovK0RH?=
 =?utf-8?B?ZkdxK2xHMGdVVlFtSkQwVnFlaDVqQTUrRUF3eXNWakZPYkttd25GNHErSkdS?=
 =?utf-8?B?NmxOT2cxSGpYYVg5K01GazBTZFluc0dveDJqL05HTi8zdW1OYUd5RmF5RzV0?=
 =?utf-8?B?eTcwU1NYTWRiOWJsRC9TejQ4YldpVklVRk9mdGNxUW11U3YrMldtNWRpSG5K?=
 =?utf-8?B?SW5MdFdzbGUxT3BLd3lCejBwZnFJU05wbHJVcVhWK2hQelptR3dNK1EyUHB1?=
 =?utf-8?B?SnpSbGgwWXZXb29BMVhTYlRGOENnM0VtMmFINmREMDlteGhpU2tQcUdrc2Ns?=
 =?utf-8?B?dy9PeEY1dWNGNUhSWXJvQ2l0MjlTelBrSVV5enErU1BJK1B4NGIxY0NTUmR4?=
 =?utf-8?B?YXkrb1hUenAxeHdudjdxQzZqd3RBNm5VZmZScGFpWkl0RkhwOVRKZ0xDeE1P?=
 =?utf-8?B?cVgvVGF3d0FUSUpSNWViMmpnRko4OG43QUR4RmJ4Q1JJMGlMQ0c3WFRSSUxL?=
 =?utf-8?B?bEY1Wjd5cEREcXVaeUJ2aVFhcUFER3hXanNiVE5Dak51S1FsZE0zcWVuYXMv?=
 =?utf-8?B?NkdCV1pidjVLdWV3dWpOSHFVeExUYTZrNkluOWN0N21kMERaQVlXWGx4MDgw?=
 =?utf-8?B?c211TWpBYms2NVdtSS8ybkJrWU14RjFpY2xNSFoxQkpYbnZLNHdxTHkyZEZG?=
 =?utf-8?B?Q0hucW40dFdpUGV0eDZIZWhVR2pFd1hobGVvQU0rK0ZOYWd1RU00dzdKZ3h0?=
 =?utf-8?B?N2VGY2pKWTFlTWNWQS8yY2VBeDkvWnJPR0J3MG9jNUp4VE5kRUJHT3A3Q0VJ?=
 =?utf-8?B?R3B5YXVBSlZmaDZWNjJVQUh6RWdTcGpoQ0FCRC9EakM3V0x5TUppZFJCV0hl?=
 =?utf-8?B?WmVodzgzS05BNzdRTkU2bkxuOHpVaFZlZzlZaUxpUjM5NWNDdFJNQmlFaFJJ?=
 =?utf-8?B?WkpoTU1aaTV2SmRJdk13R0pjLy9IQVpkVHVSS2QzRUZWRXY1RnZabWM1NjR0?=
 =?utf-8?B?bnJJd2diUTNkTHZuWExMamdNWmJ3ZmVzWC8rSVYrbjA2SEpHNXdnQ0N0Zk9l?=
 =?utf-8?B?K3IvNkYwU0l4OWo0cmd4OENhanNxdkZkWkQyQW1NUm5PczVrQjRUS05FWmRi?=
 =?utf-8?B?ZHpwYk5RUW1zTmpZT1A2WTVTRUdvaG5Ib25USjJieEhPbDEzZWdsaWhNRkMy?=
 =?utf-8?B?WHdObHRZWDlNL2R3d1psa3I4NFQzanFHMHRmSmZNV0FsTzd5NU1TdFVkS1dL?=
 =?utf-8?Q?ctwtp4AFdztq/xhz6G8bYTSuo?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 090b5756-f68c-4638-ce5f-08dd1a463262
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2024 00:44:55.1362 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Xa8G8wvbbyTqsQbffVq8o9MPfZY2SfBatDOug0wjuYK+lbp7xLGqCJgkMJSv2tgZGNU1n7/pD7xkBdtgTvDwclWdlszEDlNZioMdFVjZ1wE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6982
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

PiBTdWJqZWN0OiBbUEFUQ0ggdjIgMS8zXSB1ZG1hYnVmOiBmaXggcmFjeSBtZW1mZCBzZWFsaW5n
IGNoZWNrDQo+IA0KPiBUaGUgY3VycmVudCBjaGVja19tZW1mZF9zZWFscygpIGlzIHJhY3k6IFNp
bmNlIHdlIGZpcnN0IGRvDQo+IGNoZWNrX21lbWZkX3NlYWxzKCkgYW5kIHRoZW4gdWRtYWJ1Zl9w
aW5fZm9saW9zKCkgd2l0aG91dCBob2xkaW5nIGFueQ0KPiByZWxldmFudCBsb2NrIGFjcm9zcyBi
b3RoLCBGX1NFQUxfV1JJVEUgY2FuIGJlIHNldCBpbiBiZXR3ZWVuLg0KPiBUaGlzIGlzIHByb2Js
ZW1hdGljIGJlY2F1c2Ugd2UgY2FuIGVuZCB1cCBob2xkaW5nIHBpbnMgdG8gcGFnZXMgaW4gYQ0K
PiB3cml0ZS1zZWFsZWQgbWVtZmQuDQo+IA0KPiBGaXggaXQgdXNpbmcgdGhlIGlub2RlIGxvY2ss
IHRoYXQncyBwcm9iYWJseSB0aGUgZWFzaWVzdCB3YXkuDQo+IEluIHRoZSBmdXR1cmUsIHdlIG1p
Z2h0IHdhbnQgdG8gY29uc2lkZXIgbW92aW5nIHRoaXMgbG9naWMgaW50byBtZW1mZCwNCj4gZXNw
ZWNpYWxseSBpZiBhbnlvbmUgZWxzZSB3YW50cyB0byB1c2UgbWVtZmRfcGluX2ZvbGlvcygpLg0K
PiANCj4gUmVwb3J0ZWQtYnk6IEp1bGlhbiBPcnRoIDxqdS5vcnRoQGdtYWlsLmNvbT4NCj4gQ2xv
c2VzOiBodHRwczovL2J1Z3ppbGxhLmtlcm5lbC5vcmcvc2hvd19idWcuY2dpP2lkPTIxOTEwNg0K
PiBDbG9zZXM6DQo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvQ0FHNDhlejB3OEhyRkVadEpr
Zm1rVktGRGhFNWFQN256PW9icmltZVRnDQo+IHBEK1N0a1Y5d0BtYWlsLmdtYWlsLmNvbQ0KPiBG
aXhlczogZmJiMGRlNzk1MDc4ICgiQWRkIHVkbWFidWYgbWlzYyBkZXZpY2UiKQ0KPiBDYzogc3Rh
YmxlQHZnZXIua2VybmVsLm9yZw0KPiBTaWduZWQtb2ZmLWJ5OiBKYW5uIEhvcm4gPGphbm5oQGdv
b2dsZS5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9kbWEtYnVmL3VkbWFidWYuYyB8IDEzICsrKysr
KysrKy0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25z
KC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9kbWEtYnVmL3VkbWFidWYuYyBiL2RyaXZl
cnMvZG1hLWJ1Zi91ZG1hYnVmLmMNCj4gaW5kZXgNCj4gOGNlMWYwNzRjMmQzMmEwYTlmNTlmZjcx
ODQzNTllMzdkNTY1NDhjNi4uYzFkOGMyNzY2ZDZkMzZmYzVmZTFiM2Q3Mw0KPiAwNTdmNmUwMWVj
NjY3OGYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZG1hLWJ1Zi91ZG1hYnVmLmMNCj4gKysrIGIv
ZHJpdmVycy9kbWEtYnVmL3VkbWFidWYuYw0KPiBAQCAtNDM2LDE0ICs0MzYsMTkgQEAgc3RhdGlj
IGxvbmcgdWRtYWJ1Zl9jcmVhdGUoc3RydWN0IG1pc2NkZXZpY2UNCj4gKmRldmljZSwNCj4gIAkJ
CWdvdG8gZXJyOw0KPiAgCQl9DQo+IA0KPiArCQkvKg0KPiArCQkgKiBUYWtlIHRoZSBpbm9kZSBs
b2NrIHRvIHByb3RlY3QgYWdhaW5zdCBjb25jdXJyZW50DQo+ICsJCSAqIG1lbWZkX2FkZF9zZWFs
cygpLCB3aGljaCB0YWtlcyB0aGlzIGxvY2sgaW4gd3JpdGUgbW9kZS4NCj4gKwkJICovDQpUaGFu
ayB5b3UgZm9yIGFkZGluZyBjb21tZW50cy4NCg0KQWNrZWQtYnk6IFZpdmVrIEthc2lyZWRkeSA8
dml2ZWsua2FzaXJlZGR5QGludGVsLmNvbT4NCg0KPiArCQlpbm9kZV9sb2NrX3NoYXJlZChmaWxl
X2lub2RlKG1lbWZkKSk7DQo+ICAJCXJldCA9IGNoZWNrX21lbWZkX3NlYWxzKG1lbWZkKTsNCj4g
LQkJaWYgKHJldCA8IDApIHsNCj4gLQkJCWZwdXQobWVtZmQpOw0KPiAtCQkJZ290byBlcnI7DQo+
IC0JCX0NCj4gKwkJaWYgKHJldCkNCj4gKwkJCWdvdG8gb3V0X3VubG9jazsNCj4gDQo+ICAJCXJl
dCA9IHVkbWFidWZfcGluX2ZvbGlvcyh1YnVmLCBtZW1mZCwgbGlzdFtpXS5vZmZzZXQsDQo+ICAJ
CQkJCSBsaXN0W2ldLnNpemUsIGZvbGlvcyk7DQo+ICtvdXRfdW5sb2NrOg0KPiArCQlpbm9kZV91
bmxvY2tfc2hhcmVkKGZpbGVfaW5vZGUobWVtZmQpKTsNCj4gIAkJZnB1dChtZW1mZCk7DQo+ICAJ
CWlmIChyZXQpDQo+ICAJCQlnb3RvIGVycjsNCj4gDQo+IC0tDQo+IDIuNDcuMC4zMzguZzYwY2Nh
MTU4MTktZ29vZw0KDQo=
