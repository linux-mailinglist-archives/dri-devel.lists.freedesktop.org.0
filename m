Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A155AD6CF1
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 12:02:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19DE210E421;
	Thu, 12 Jun 2025 10:02:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EQ67QVvL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9DB510E144;
 Thu, 12 Jun 2025 10:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749722519; x=1781258519;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=R+DdqvfiLY0GqIt3zWD+mjuyFQbjvEOFUI/PFTxs0Qg=;
 b=EQ67QVvLysYshn5luNgM2Q0lR2QnRO2zqyhVi4eN9671uUpfijyKBDkY
 V6n5WglgdnslPqpQgZ1icEVdjfkq5Zu3qXsQicWgg+Fqux0j4lvXuwtKZ
 vcVMEiL7wPFQ2q6sFKx8jFUHTeZYZEow92Th0DM/KTvlo/jVhhvDerd18
 r5MEbn+X5f9w3DKxamRSkuVo3P1gEo0c1J8rfvRFVQqKDuADJwqrcKYpU
 L0Rk6dTd0hCUp2T2gKe5Sigt8jlXPkBqpzy+HSEZkVwZH0ll31cW2iNmb
 KYiXDuarz7nyNng/D5qTx4fzCQEsbrE0oj7Kmx6yI7F1vDth/8GzwKrs1 A==;
X-CSE-ConnectionGUID: 6g+B7u9XR0SkOJ7f5jTX3A==
X-CSE-MsgGUID: hH04x776T/+eUiakVDn+kA==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="69462026"
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="69462026"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 03:01:55 -0700
X-CSE-ConnectionGUID: inX//9yIQ0KJENXZg+jzCg==
X-CSE-MsgGUID: 7+zTpGDSTlKH5/bblbKavw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="147357562"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 03:01:54 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 03:01:54 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 12 Jun 2025 03:01:54 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.69) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 03:01:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yphKTkQ2txHgNVEtFy5RpZ3fWf6TBdGVRQaiDNM1y0+KWUGBw5AcAmyokFZoxPKyYo5VzdwJ2yQKKjfsovRkHbIWjK37TznUHsG29zdmZQ2xRhFWljZC/MjH9qyFoba4YU7EsSsdO/L+wjDR6QmOVGeY2fDf9YBKcf0fKmgNTx1QuUUFjB5ebhlpnHgDKE2FCnJm0IYNhpnwks9Ihtbe1+aDEIQw97LfQ3NiaYbiciGk7fpoZJaqMK5UFH+lPMFLsl01yw8FtLxfovZWRTN2vBBN5S/bFF8juycolC8jhDd6H1By/Wd3fKD5lR4NGF/ZtkPseKEV5C/xV1wD67UQHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R+DdqvfiLY0GqIt3zWD+mjuyFQbjvEOFUI/PFTxs0Qg=;
 b=kl+M1SLgBILuJjHzTyTw7GVwDhsPXbIDlrFUgMW3cJXjAp2Pi2z543B1pAMCkaG8WOI8yc5wJa6t5syp74bqfUly/FwtgNp7SjLls12ezdHo0Y749u9mfGEVQMvJAyGX2x2Iyu0K5gwUB2S87/nCB8pV3kkGCWrp07b4F4Y4ms2wo646NbBi/iV0LyE9bkL/ZcFKfB7Vg42O+RukQBflsym1PDoCl9v9dHZfsx9PK84elYO8esy2HMLx4u/3pqPxZaohBJotWC5X870VD0pwO6wWvc9kb/v7ALUQL0aOWhOh3DP6jq4cO16e+qTKFlTuMFeW6meBuaxy34VaVHbYEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by IA4PR11MB9324.namprd11.prod.outlook.com (2603:10b6:208:569::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.30; Thu, 12 Jun
 2025 10:01:49 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778%3]) with mapi id 15.20.8835.019; Thu, 12 Jun 2025
 10:01:49 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Richard Weinberger <richard@nod.at>, Guenter Roeck <linux@roeck-us.net>,
 Vignesh Raghavendra <vigneshr@ti.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?=
 <thomas.hellstrom@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 "Poosa, Karthik" <karthik.poosa@intel.com>, "Abliyev, Reuven"
 <reuven.abliyev@intel.com>, "Weil, Oren jer" <oren.jer.weil@intel.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, DRI mailing list
 <dri-devel@lists.freedesktop.org>, intel-gfx
 <intel-gfx@lists.freedesktop.org>, linux-kernel
 <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v6 01/11] mtd: core: always create master device
Thread-Topic: [PATCH v6 01/11] mtd: core: always create master device
Thread-Index: AQHbi35N9ptLZMK+/0+KHmcJoUKk0bP5FNKAgABXSdCAANahSoAAWdKAgACSaAOAACUigIAAFAQAgAAhxhCAAAxMAIAAXViAgADet1B87pkdB/wY57yAgAEiYbGAAA56AIAABaLggABFNgOAATvKgA==
Date: Thu, 12 Jun 2025 10:01:49 +0000
Message-ID: <CY5PR11MB6366DA38B20B29C1662BDC76ED74A@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20250302140921.504304-1-alexander.usyskin@intel.com>
 <CY5PR11MB63662D21B2C7B1A1C2E6BC4BED6BA@CY5PR11MB6366.namprd11.prod.outlook.com>
 <2e5ebbdd-2a57-4f1f-85c6-7c2dff127b50@roeck-us.net>
 <1176847729.134356549.1749504429656.JavaMail.zimbra@nod.at>
 <CY5PR11MB6366B2B40E0C357D6C0935C2ED6AA@CY5PR11MB6366.namprd11.prod.outlook.com>
 <130790886.134361099.1749560056731.JavaMail.zimbra@nod.at>
 <c90c8bad-9c7a-4bf7-8282-ebefebba90a3@roeck-us.net>
 <877c1ivcym.fsf@bootlin.com>
 <1612313571.134371311.1749637592940.JavaMail.zimbra@nod.at>
 <CY5PR11MB636692EFD9BB99B6F2D959BFED75A@CY5PR11MB6366.namprd11.prod.outlook.com>
 <87y0tytjmj.fsf@bootlin.com>
In-Reply-To: <87y0tytjmj.fsf@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|IA4PR11MB9324:EE_
x-ms-office365-filtering-correlation-id: 5d4222f3-0a53-40cf-0475-08dda9982607
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|10070799003|1800799024|7416014|376014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?WlpUUnZURUZMci84SHJIZEZjb2syQmV4eDQvcCtuQXUwVUNLc1pSdEFwS1Vx?=
 =?utf-8?B?NkNYenR4SXdMYlBGSTRQUnl1R21YVit2cTNYWlhBTnBIbnZybnBtbFljRyta?=
 =?utf-8?B?R1R0L2FKclg1eTdKRlBJZ2xLZmpNNjhva0wxc2FwNEd2UllaTkg4U1ZVQ1R5?=
 =?utf-8?B?OHhoS3RnUGU4L1NvMGg0RUIrRnJFRnNiM3JCMXJoVTJHZnJwREZrcjNlWU9Z?=
 =?utf-8?B?VHpIOVVycUNVT0s5NTdyc29OL3Q1MnZ6Q0FNWDJUMVVDclZnbER3cC9Pa0hu?=
 =?utf-8?B?ODJSZG1KZmJ4TlJ2alJIREEvTzhWNU5qcENHSVhrdVpHOCt4d2VEUWR1QW9v?=
 =?utf-8?B?UHZGcldLM0FmeUZhdFRqdDZDT2JJVDRpMzRxWGt4Wnh2dHdiTmFxbkVtb3VE?=
 =?utf-8?B?QUQ4b2R4bjMwVmFOY2hSK0RrT3NVK2oybHRjMXVMSm9obmxvMnBxSDNzNXR4?=
 =?utf-8?B?b0UxMG96c1JYNDRaZTZwT2Z3dTJLUmVqR0tWU21MajZzOExpS3dBa05rbVFX?=
 =?utf-8?B?TWlQR0tTekNUaHRwVG1IendXWWFSc0dCZXRYNDIyakJMb2V4N1h5ZVR5cktM?=
 =?utf-8?B?TTNkWkJYSDMyRzFReER0SzhZZ0p1TW9ybklpSStMTWIzYTM1S2dOaVJmc0Nn?=
 =?utf-8?B?MTZBdFV6Mk4wOFFsQS9RWVM4ZUJZZzJWYWtVd29ZZ2RZSldXWHdxVmh1cnVj?=
 =?utf-8?B?Qng4cURmMUdVUGlmOXJUSnUrazJrcGt6bDdsQVM2RWREc3hxblVYUHlOV1BV?=
 =?utf-8?B?Q3doMVNBNTZQWHp5d0dZUXV2TzRMRG9XZjdQWWwzdWM5aFBHbWlnUnI0SDRN?=
 =?utf-8?B?MzU5dS9mOUFGSWFTOVMvSytkcFgvR3NWS2tKdVFHeEhOVThWMmNJbldBWU5n?=
 =?utf-8?B?VDFvVUZ4WXhjbEpQbjNyRkxROTlnQ3ZUa2hzcnc3S2wwSlFPczI5SkEvRWNi?=
 =?utf-8?B?RFpLOTlJV0xYLzBaL3AzNEc3VUJqOUpUZjVPdERKRUZIdXNiSkx1Z0NkUHU2?=
 =?utf-8?B?bXhXYjUvQkNxQnF3MVpZU2JJNXZNeVJlL0FKWnBZM1plNk0vY1Uxb2Rsd2Jm?=
 =?utf-8?B?eGZuOW9WeTNnWjFLT25MaExvY3k4bFR5UXY5RjBjaTFpVDRmektIZWhXQ0Zr?=
 =?utf-8?B?NHdna2tnVjQxTGhESHdSZVlyNklseWVIUm5SdWdEWXhFRDd1R3NCOVJJUVJv?=
 =?utf-8?B?K1VLNFZ0RU1VQ2JyQ2FyS3VRNW1nYXNJekkydUdiRVNqVE9VOGJwYXo1VG1y?=
 =?utf-8?B?cnVEUUthZWNpZ292c0NQOFlLRDFiOFBNSm5UKzhWMHBKRzJsRTVLeDY1TldH?=
 =?utf-8?B?VURaUWhrYm1LNlV5U3NrcVJ2b1BnSlpYelJZUUZaeWtxQkNmbE5HSlh4VGlu?=
 =?utf-8?B?Sm9iMFpvMy9kUkp0WmhtdFd3TVJ6LytqVzQ0NFJST2J1L24xa1NWZkh5S2Jz?=
 =?utf-8?B?TkVadFlwTEN0M3F4ckNGTkVSQTNUVll5Q1BCcnhzNTZiQVF0Z0d4MzdnN3Nq?=
 =?utf-8?B?ZUNjQ1lUS3RNRldxa3B0YUVSRnBYNlY0UC8xRU4zOG1Ob1pDL1VQVmZ4bzNQ?=
 =?utf-8?B?MHBTUmR6cUJ2akZhMWhoUzdMcTdTak4rRm4wY3hhWkd5WFNkZGtneGNWbVdL?=
 =?utf-8?B?Z1YzQ1lrTUtabVAzeklWNThrbHFGaEdEdlRmZEhneWtaa2FaQ0ZST2thclUv?=
 =?utf-8?B?VEhscHVHb1VMamcwY3dJcS92ZFVHL1Fqc2NnTXk3SUJQV3lucEdiSStHaWV6?=
 =?utf-8?B?WjUyaGxTVTdGNmdpcVJuTXdnNVdRWTVlNUI0RkdocEdQdVJUbzVXMzEyVzRj?=
 =?utf-8?B?clgwamExMTBjMUJML2ZFYzZZR1VsOEg2cVdQN3RUcXFheGVLNG1Wc3BsQWxn?=
 =?utf-8?B?RExLR2dLN0wzVmRVV2lYWktyZTZMRnRSTkNTT0hBZExJQjZaRWNpRFdzQnMx?=
 =?utf-8?Q?Nt0pJhIPbhk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6366.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(1800799024)(7416014)(376014)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZG5IR3k1Mnkvb0xBV0ZBUmFCS3c5ajJSaXBHVjZkZzcrZUhURnJoQnNMakw3?=
 =?utf-8?B?akx4d1FkUEY5aFp3VEFaSW9ta3lqL0d5M0VFc2V3a1VBN2YzTXhmZVVPbGI1?=
 =?utf-8?B?dFVMYllJbkdLdTZQVisrRHo2cnphcGRlSnQ2c3ArWEZEcldHeVlpVVpvR3Zo?=
 =?utf-8?B?bTRNd1ZmVTZ6V1I0eUxoaHJ4RDVnekR3UWEwQXl3TEU2Tnc0Q05reU43UU94?=
 =?utf-8?B?R2ZzdGtkSjdzWmxLYy96STJPYUNkYnJuSGljSmt5SXZ2UUVjSnpId3l0Unpm?=
 =?utf-8?B?b1NBS0FnZ2V3amFuei85NUNQOEp0TndPUFdseXZucXNReHJsWHpjYk9ZNERn?=
 =?utf-8?B?RDVBMmZMUi9YR3ZoQTJIN0laSUhhc0xiY3JvQjJ2b25ZNHg0SXR2c2RLakRQ?=
 =?utf-8?B?TlVQbDhPVnl6eHNOV1pMM0lPd0I3SzZTL05DSDJXMVBsVU5NWkp0Q2VQelhG?=
 =?utf-8?B?c0VHOTAyS3ZhVWQvS0wzaXdkYlpqRTNDSEg5TlRQcE9YalZtb1NBUFhlY1ZY?=
 =?utf-8?B?OXhNMXlUU2dNMyt6UU5XVkJkZytubVA5WldNQldwRWlQdXBTUExFSHZwbDdR?=
 =?utf-8?B?MmRrMjlTS2k4WktiS0JwZGd4WkRwMHNSM0x2RDBwN2hlTlNLZ05Yd084OWVZ?=
 =?utf-8?B?ejRVMnU2eVNYdU5HR0w2UlZ5Smp2QmJJeEZNOGxENXhocjZDcjlvYXVRdGox?=
 =?utf-8?B?RFRmVy9sZFpHOEhqcGFUOER1Mm9DK2ZOYlF1aTN6WlNPN2lWZUE2d2ZxTG4v?=
 =?utf-8?B?QkRMV3l5SFZyOTR2U00yRUFGUjJUb3FUSzczWEFXTHFWaG9pSThQZUpHemZj?=
 =?utf-8?B?UXBWbGx1ZW0zK3EzeDdhYzk1QnhtdGRoeVpEeEFaelR1Z1NPQzJvdXZVY3Ja?=
 =?utf-8?B?a29FdTRXNVpLWmVXdUQzb1lUdEVLb1pwNTBjLzM3RURRTlY0dndHaUt1VGY2?=
 =?utf-8?B?blhVaENTcVFOMSttck4wd3NCMjlndThGMUYrR1oxWGp3QnNHekhnT2FMQTJQ?=
 =?utf-8?B?bEJQZXVTcEwvd05vRjRudWxZbHVMVTExcld4bTVqWngwb1Zkb3JqSlJLWHFO?=
 =?utf-8?B?Z0djcHZWWG9HcGZkdzBrWDFOVVZzOGs5ZU5NQklmUjZmMjhzNFdWcnJtYkZQ?=
 =?utf-8?B?OEZEL09lUjVpMWdSZmdaWmhjV3NuR3VpbmgyYXo2aWphRk1jdGVpUjc3QjVU?=
 =?utf-8?B?ZExyOFJkOFJCSVdjTHJlOWNXWjFnb1F6OFg5YzVPQ3lSbnk3MWorZW1vRmFM?=
 =?utf-8?B?V0ZrVkUvenNDWHQxUHY2aE00RG92bVVMTVhrR01wMkVjcnIzN2xiY0JYY3NH?=
 =?utf-8?B?S0VLelhBeXMxVXhmd0Z3a1MxTW1HS2FUR2JaQ2ZYSk5xQWIxUzZETHdBdzRs?=
 =?utf-8?B?SFY0eUhmZEZKdFVGb1R6UXloL2pib2Z5Slh1a05YcVNYSjltQXZWY1cyb2c2?=
 =?utf-8?B?dlVITDR6WjR5bkQrdDFGSW04SkdpNmdiMHA4ODFJSHk4dTZKalNhbjl2dEsr?=
 =?utf-8?B?TndKbkI4eVFBc1ZBMmlxSk42WTluSFV5OXRxeU1mUFBOZ3Vmbm5nVldqQVd4?=
 =?utf-8?B?VG45ZWZ5a0FYREt1ckFITDllZlRXa2hsM0t4YWYwZzJuSmd3alcvVjlHaU5r?=
 =?utf-8?B?a3IrMWJka1VZRGlmb0lLQjdubm0wMFhhR2FuTURHREgvdDlsQlE2K0VKQVkz?=
 =?utf-8?B?YXp1S2EzbC9qTGRkTTR0NGpRTUVPS2hKc254RmVHMm1JUm55ZmQ3bzM2aDM2?=
 =?utf-8?B?amJLcVRuV0ZZcVJ0KzIySEtYOU4vZlZsazFac3NZazBreGxtMXJHS01EVVln?=
 =?utf-8?B?TEk1SnV3ODNmOVZ3VG5nMkJ6b3BWNXpLYTc0Q3NtTEFXTFp5UmFFQWNQODVO?=
 =?utf-8?B?OXg5YXBERitaaE1ONmJ5MmJnV28rL01qazhacFhhTzNVdWFtaHh0Z3JOR3oy?=
 =?utf-8?B?SWhST09nQ3ZnNklKcXRKaStKY0pmQnptczZVTU0rVFdnNGNPalJUNTVFbHpS?=
 =?utf-8?B?NVlLMTFBZkN1elNJMUZYK3MyK2lObCtNL1pqMmplK09MUGNmaXlLSUIxM1Ey?=
 =?utf-8?B?L1JNcFVhbzNjRTBHbFhVdVNqY1FGNGkybk16aVdNRk9RMG85b1gycDI2RFht?=
 =?utf-8?B?emJFNGgwOHRPQitmaXN0Z2NpU3c2MnkxRzlkWERiZmxRNGdTNWpDZW1oclhW?=
 =?utf-8?B?Q3QwT0I1ZlRSZ2tQK3JqcVV1RUZNQTZncXJ0MWJJQ0puUUJQV2xPWkh6aG51?=
 =?utf-8?B?QS9wQWJxZC9wOUE3QzdFK25BZDlBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d4222f3-0a53-40cf-0475-08dda9982607
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2025 10:01:49.4146 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fWCkSGhlr7e+w3OZREq3aFDoJUL28LkTy2e3TX3/RoAfArZhdFgHmeI9BHkFaSDjtUsYx0ARVwDHM4YXyMrDDILOq8+8MFLcsZjFpYdiEYU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9324
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
bWFzdGVyIGRldmljZQ0KPiANCj4gSGVsbG8sDQo+IA0KPiBPbiAxMS8wNi8yMDI1IGF0IDEwOjUy
OjM2IEdNVCwgIlVzeXNraW4sIEFsZXhhbmRlciINCj4gPGFsZXhhbmRlci51c3lza2luQGludGVs
LmNvbT4gd3JvdGU6DQo+IA0KPiA+PiBTdWJqZWN0OiBSZTogW1BBVENIIHY2IDAxLzExXSBtdGQ6
IGNvcmU6IGFsd2F5cyBjcmVhdGUgbWFzdGVyIGRldmljZQ0KPiA+Pg0KPiA+PiAtLS0tLSBVcnNw
csO8bmdsaWNoZSBNYWlsIC0tLS0tDQo+ID4+ID4gVm9uOiAiTWlxdWVsIFJheW5hbCIgPG1pcXVl
bC5yYXluYWxAYm9vdGxpbi5jb20+DQo+ID4+ID4+IE9uIDYvMTAvMjUgMDU6NTQsIFJpY2hhcmQg
V2VpbmJlcmdlciB3cm90ZToNCj4gPj4gPj4+IC0tLS0tIFVyc3Byw7xuZ2xpY2hlIE1haWwgLS0t
LS0NCj4gPj4gPj4+PiBWb246ICJBbGV4YW5kZXIgVXN5c2tpbiIgPGFsZXhhbmRlci51c3lza2lu
QGludGVsLmNvbT4NCj4gPj4gPj4+PiBSaWNoYXJkLCBJJ3ZlIHJlcHJvZHVjZWQgeW91ciBzZXR1
cCAobW9kdWxvIHRoYXQgSSBtdXN0IGxvYWQgbXRkcmFtDQo+ID4+IG1hbnVhbGx5KQ0KPiA+PiA+
Pj4+IGFuZCBwYXRjaCBwcm92aWRlZCBpbiB0aGlzIHRocmVhZCBoZWxwcyB0byBmaXggdGhlIGlz
c3VlLg0KPiA+PiA+Pj4+IENhbiB5b3UgYXBwbHkgYW5kIGNvbmZpcm0/DQo+ID4+ID4+PiBZZXMs
IGl0IGZpeGVzIHRoZSBpc3N1ZSBoZXJlISA6LSkNCj4gPj4gPj4+DQo+ID4+ID4+DQo+ID4+ID4+
IEl0IGRvZXNuJ3Qgc2VlbSB0byBmaXggdGhlIGlzc3VlIGlmIHRoZSBwYXJ0aXRpb24gZGF0YSBp
cyBpbg0KPiA+PiA+PiBkZXZpY2V0cmVlLg0KPiA+PiA+DQo+ID4+ID4gSSBoYWQgYSBsb29rIGF0
IHRoZSBwYXRjaCBhZ2Fpbi4gVGhlIHdob2xlIG10ZCBjb3JlIG1ha2VzIGFzc3VtcHRpb25zDQo+
IG9uDQo+ID4+ID4gcGFyZW50aW5nLCB3aGljaCBpcyB0b3RhbGx5IGNoYW5nZWQgd2l0aCB0aGlz
IHBhdGNoLiBUaGVyZSBhcmUgc28gbWFueQ0KPiA+PiA+IGNyZWF0aXZlIHdheXMgdGhpcyBjYW4g
YnJlYWssIEkgZG9uJ3QgYmVsaWV2ZSB3ZSBhcmUgZ29pbmcgdG8gY29udGludWUNCj4gPj4gPiB0
aGlzIHJvdXRlLiBJIHByb3Bvc2UgdG8gcmV2ZXJ0IHRoZSBwYXRjaCBlbnRpcmVseSBmb3Igbm93
LiBXZSBuZWVkIHRvDQo+ID4+ID4gZmluZCBhbm90aGVyIGFwcHJvYWNoLCBJJ20gc29ycnkuDQo+
ID4+DQo+ID4+IEkgdGhpbmsgcmV2ZXJ0aW5nIGlzIGEgdmFsaWQgb3B0aW9uIHRvIGNvbnNpZGVy
IGlmIHRoZSBpc3N1ZSB0dXJucyBvdXQgdG8gYmUNCj4gPj4gYSAiYmFjayB0byB0aGUgZHJhd2lu
ZyBib2FyZCIgcHJvYmxlbS4NCj4gPj4NCj4gPj4gPiBBbGV4YW5kZXIsIGNhbiB5b3UgcGxlYXNl
IHJlbWluZCBtZSB3aGF0IHdhcyB5b3VyIGluaXRpYWwgcHJvYmxlbT8gSQ0KPiA+PiA+IGJlbGll
dmUgeW91IG5lZWRlZCB0byBhbmNob3IgcnVudGltZSBQTSBvbiB0aGUgbWFzdGVyIGRldmljZS4g
Q2FuIHlvdQ0KPiA+PiA+IHBsZWFzZSBlbGFib3JhdGUgYWdhaW4/IFdoeSB0YWtpbmcgdGhlIGNv
bnRyb2xsZXIgYXMgc291cmNlICh0aGUNCj4gPj4gPiBkZWZhdWx0LCBiZWZvcmUgeW91ciBjaGFu
Z2UpIGRpZCBub3Qgd29yaz8gQWxzbyB3aHkgd2FzIHNlbGVjdGluZw0KPiA+PiA+IE1URF9QQVJU
SVRJT05FRF9NQVNURVIgbm90IGFuIG9wdGlvbiBmb3IgeW91PyBJJ20gdHJ5aW5nIHRvIGdldCB0
bw0KPiB0aGUNCj4gPj4gPiByb290IG9mIHRoaXMgY2hhbmdlIGFnYWluLCBzbyB3ZSBjYW4gZmlu
ZCBhIHNvbHV0aW9uIGZpeGluZyAidGhlIHdvcmxkIg0KPiA+PiA+IChmYXN0KSBhbmQgaW4gYSBz
ZWNvbmQgdGltZSBhIHdheSB0byBhZGRyZXNzIHlvdXIgcHJvYmxlbS4NCj4gPj4NCj4gPj4gSUlS
QyB0aGUgcHJvYmxlbSBpcyB0aGF0IGRlcGVuZGluZyBvbg0KPiBDT05GSUdfTVREX1BBUlRJVElP
TkVEX01BU1RFUg0KPiA+PiB3b24ndCBmbHkgYXMgUE0gbmVlZHMgdG8gd29yayB3aXRoIGFueSBj
b25maWd1cmF0aW9uLg0KPiA+PiBBbmQgZW5mb3JjaW5nIENPTkZJR19NVERfUEFSVElUSU9ORURf
TUFTVEVSIHdpbGwgYnJlYWsgZXhpc3RpbmcNCj4gPj4gc2V0dXBzIGJlY2F1c2UgbXRkIGlkJ3Mg
d2lsbCBjaGFuZ2UuDQo+ID4+DQo+ID4+IE9uIHRoZSBvdGhlciBoYW5kLCBob3cgYWJvdXQgcGxh
Y2luZyB0aGUgbWFzdGVyIGRldmljZSBhdCB0aGUgZW5kDQo+ID4+IG9mIHRoZSBhdmFpbGFibGUg
bXRkIGlkIHNwYWNlIGlmIENPTkZJR19NVERfUEFSVElUSU9ORURfTUFTVEVSPW4/DQo+ID4+IEEg
Yml0IGhhY2t5IGJ1dCBJTUhPIHdvcnRoIGEgdGhvdWdodC4NCj4gPj4NCj4gPj4gVGhhbmtzLA0K
PiA+PiAvL1JpY2hhcmQNCj4gPg0KPiA+IFRoZSBvcmlnaW5hbCBwcm9ibGVtIHdhcyB0aGF0IGdl
bmVyYWwgcHVycG9zZSBPUyBuZXZlciBzZXQNCj4gPiBDT05GSUdfTVREX1BBUlRJVElPTkVEX01B
U1RFUiBhbmQgd2UgbmVlZCB2YWxpZCBkZXZpY2UgdHJlZQ0KPiA+IHRvIHBvd2VyIG1hbmFnZW1l
bnQgdG8gd29yay4NCj4gPg0KPiA+IFdlIGNhbiByZXR1cm4gdG8gVjcgb2YgdGhpcyBwYXRjaCB0
aGF0IG9ubHkgY3JlYXRlcyBkdW1teSBtYXN0ZXIgaWYNCj4gPiBDT05GSUdfTVREX1BBUlRJVElP
TkVEX01BU1RFUiBpcyBvZmYuDQo+ID4gSW4gdGhpcyBjYXNlIHRoZSBoaWVyYXJjaHkgcmVtYWlu
cyB0aGUgc2FtZS4NCj4gPg0KPiA+IE1pcXVlbCwgY2FuIHlvdSByZS1yZXZpZXcgdjcgYW5kIHNh
eSBpZiBpdCB3b3J0aCB0byByZXZlcnQgY3VycmVudCB2ZXJzaW9uIGFuZA0KPiA+IHB1dCB2NyBp
bnN0ZWFkPw0KPiANCj4gQWZ0ZXIgdGFraW5nIGluc3BpcmF0aW9uIGZyb20gUmljaGFyZCdzIHdp
c2RvbSBvbiBJUkMsIHdlIGhhdmUgYW5vdGhlcg0KPiBwcm9wb3NhbC4gTGV0J3MgZHJvcCB0aGUg
bXRkX21hc3RlciBjbGFzcy4gV2UgbmVlZCBhbiBtdGQgZGV2aWNlIHRvIGJlDQo+IHRoZSBtYXN0
ZXIgZGV2aWNlLCB3ZSBhbHJlYWR5IGhhdmUgb25lIGJ1dCB3ZSBjYW5ub3Qga2VlcCAqYXQgdGhl
DQo+IGJlZ2lubmluZyogb2YgdGhlIElEIHNwYWNlIHVuZGVyIHRoZSBDT05GSUdfTVREX1BBUlRJ
VElPTkVEX01BU1RFUj1uDQo+IGNvbmZpZ3VyYXRpb24gdG8gYXZvaWQgYnJlYWtpbmcgdXNlcnNw
YWNlLiBTbyBsZXQncyBrZWVwIHRoZSBtYXN0ZXINCj4gYW55d2F5LCB3aXRoIHRoZSBmb2xsb3dp
bmcgc3BlY2lmaWNpdGllcyBpbiB0aGUgcHJvYmxlbWF0aWMgY2FzZToNCj4gLSBpZCBpcyBhbGxv
Y2F0ZWQgZnJvbSB0aGUgbWF4IHZhbHVlIGRvd253YXJkcyAoYXZvaWRzIG1lc3Npbmcgd2l0aA0K
PiAgIG51bWJlcmluZykNCj4gLSBtdGQgZGV2aWNlIGlzIHNpbXBseSBoaWRkZW4gKHNhbWUgdXNl
ciBleHBlcmllbmNlIGFzIGJlZm9yZSkNCj4gDQo+IEFwcGFyZW50bHkgdGhpcyBzZWNvbmQgcG9p
bnQsIHdoaWxlIG5vdCBuYXRpdmVseSBzdXBwb3J0ZWQsIGlzIHNvbWV0aGluZw0KPiB0aGUgYmxv
Y2sgd29ybGQgYWxyZWFkeSBkb2VzOg0KPiBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51
eC92Ni4xNS4xL3NvdXJjZS9pbmNsdWRlL2xpbnV4L2Jsa2Rldi5oI0w4OA0KPiANCj4gV2hhdCBk
byB5b3UgdGhpbms/DQo+IA0KPiBUaGFua3MsDQo+IE1pcXXDqGwNCg0KSW4gZ2VuZXJhbCwgaXQg
aXMgZmluZSBmb3IgbWUgLSB3ZSBoYXZlIHBhcmVudCBtdGQgaW5pdGlhbGl6ZWQgYW5kIHBhcnRp
Y2lwYXRpbmcNCmluIHBvd2VyIG1hbmFnZW1lbnQuDQoNCkkgY2FuJ3Qgc2VlIGhvdyB0byBiZW5k
IGlkcl9hbGxvYyB0byBhbGxvY2F0ZSBmcm9tIHRoZSBlbmQgYW5kIGNvcm5lciBjYXNlDQpvZiBm
dWxsIGlkciByYW5nZSBpcyBhbHNvIHdpbGwgYmUgcHJvYmxlbWF0aWMuDQoNCi0gLSANClRoYW5r
cywNClNhc2hhDQoNCg0K
