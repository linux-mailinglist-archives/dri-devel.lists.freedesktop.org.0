Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CC0A8B02C
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 08:21:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9009C10E033;
	Wed, 16 Apr 2025 06:21:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EwTyGBKF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BD2A10E033;
 Wed, 16 Apr 2025 06:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744784479; x=1776320479;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KhjTnEZV/fAnPWYNVTlGKWtyCHxAMqAM4bu4T7JAuiM=;
 b=EwTyGBKFaR6JiKYStXw+RFHRcSoqLV7Aa1MTPIYC5nQ1+9nQBVo1ePcM
 cBkAwq9yH32dedQVwnSTjZOD8MjBM95Kd1IEMtZnm0pyUOy7TBsjNYYOH
 4eN63cn65vWHAu/DWljlQOEG/G7CHnlZSPpmvrkINCbW48OuzZEA6pIV2
 xkVx0iOOYMQP1p5QqYSgDBSTj6jHfbAly/FHblQAnHvwI96SiKiKRbmTd
 LVk544owanrZN96QxopHZ2Av75K1tNPEBx4hW9I5UxNW7rJ7Bkd1TtXZZ
 DKJZTOpEt30Zb8T/8c+Tf2eJs73JwHGoUqjroBudSUVSskNhbaNABfhWm Q==;
X-CSE-ConnectionGUID: iAXfDeFBQR6zrJYSyaM29A==
X-CSE-MsgGUID: IG+CmSRDTKeT2dAIRI/PTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="57683638"
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; d="scan'208";a="57683638"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 23:21:18 -0700
X-CSE-ConnectionGUID: OYi4QBdQTqik2LGuXmpk7w==
X-CSE-MsgGUID: h38lNrkSQ5KLoWKBDGOpDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; d="scan'208";a="153563191"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 23:21:17 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 15 Apr 2025 23:21:10 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 15 Apr 2025 23:21:10 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 15 Apr 2025 23:21:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J4ZZVbedW/oLzzO6UBe1RnopUHkIoXbfnMvhaS0H7iF9QIOCjeGeBJNSunc58HNVNC/Bd2fDWXbB3X+aTgVHrIeMibNi1lLT2NMH1u6bPWMJpY+avfVOJFGMt/ExoROgitGGS3DuMBNmQSz6zqM9+hFsdZF22XIkXqcUJJDeYcfz7JlDyH9Tjl8d4P4xyGqA2gGbE+2W5K9meVIcqzKrjJAKNJaO4az3YR7PeCZA/fYgjhHvl1P+pxySyy2xPzpRnrdTCjqBU/KU0FQ1pLuOg1daMGXjuBPl445GazXP36iqCnkbjxhgQaMNh7XwZVPZwExRvWdjp7DGDU7qbAq6Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KhjTnEZV/fAnPWYNVTlGKWtyCHxAMqAM4bu4T7JAuiM=;
 b=s496IbXVDNgx6DjHpMeasPSjs+qDgvSAE3rCTVXk1fs8P/GhAXiJl2kFhlU9VxDZsKY6M6V5W7kfoisYQD7HGV2rIiRJzkOMmC0K22tw6LmH/rPXskqunqOb0KKfDjP+PVsGqqr4kDUoKww1tGqXdbC/uRPPKepWxvzVVETBSsGJKPgS7QOu72BvWsoOtGU9s/+b8fLhsYO2RjvE3Awu8fUN7iM7awyRj7O3k6uhK+8bR/XLjZDLX4/8nFQNFaIvY4e+xhhOFzjIcDmjNTVT7SbnMYPyRlV3luNDrXe9iWMyfrwR0IFHgmlklUufK9FmFN1SALQFkso1DqwBrmijmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by DS4PPF890B596B9.namprd11.prod.outlook.com (2603:10b6:f:fc02::38)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Wed, 16 Apr
 2025 06:21:03 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%5]) with mapi id 15.20.8632.030; Wed, 16 Apr 2025
 06:21:02 +0000
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "alexander.deucher@amd.com" <alexander.deucher@amd.com>
CC: Jani Nikula <jani.nikula@linux.intel.com>, "Syrjala, Ville"
 <ville.syrjala@intel.com>, =?utf-8?B?VmlsbGUgU3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>, "Kumar, Naveen1" <naveen1.kumar@intel.com>
Subject: RE: [PATCH RESEND v13 0/5] Expose modifiers/formats supported by
 async flips
Thread-Topic: [PATCH RESEND v13 0/5] Expose modifiers/formats supported by
 async flips
Thread-Index: AQHbp4IVsrckdgISaU65114RweKSHbOl3pyA
Date: Wed, 16 Apr 2025 06:21:02 +0000
Message-ID: <SJ1PR11MB6129BDF34CF14847EEE77168B9BD2@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <20250407-asyn-v13-0-b93ef83076c5@intel.com>
In-Reply-To: <20250407-asyn-v13-0-b93ef83076c5@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|DS4PPF890B596B9:EE_
x-ms-office365-filtering-correlation-id: 354600d8-e397-4b32-fcf0-08dd7caedcc0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?a3E0UE9rVkxXeXVpYURJL1IrQmlXSmhNZFViZWtzNTlIOC9ISnQ4Y1B1ZU1o?=
 =?utf-8?B?ZzNod3dkZUU3T1dxYUc3ZEZOOStmMnBQYkg2NEhZM0hUeTY1MjlhODFOejF6?=
 =?utf-8?B?VnpTcWtoamhwc0JRTnpBMGkxL3RrTXVxVG9uRmltL1NHVHFzVUtpbHFlUWZ4?=
 =?utf-8?B?TVlCa3dxU1haMUhURlhsMEoxZ3RGNVZ6WVR0OWJTWGlPZ0RWaFpmUmVTVmxi?=
 =?utf-8?B?ZkdZdHB0RldyNkZHVzVoVTFVQVJ6d2gzMFV2dFBxVkJ0VTNRekNyNTBCTUVq?=
 =?utf-8?B?RGdKOGJCV093VDdVMzJWYnNQVzhMQjRzTUphVVhKZFhYSkVDTUNjNXdZUjh6?=
 =?utf-8?B?SHZNdkxVZE1wNm1BQzlIaUNMRC9XdURidy9jQ1NsT0IrMTJKSUpWY2NTNnA1?=
 =?utf-8?B?U3lGZWNEbE5pZG93WnRqQUUzbkZiL2piNDV6K0lTNEk0NkVCUU9lSGNCd1Jk?=
 =?utf-8?B?UkZuU0ZJYmdJZDhkTnBybWw2Szk0dVJkRVc2bVRCTitYVkNHdmcyWUJmZ2Z3?=
 =?utf-8?B?OEd3NFpDOGFSaUw3Ym1WMURkOTF2WHloVnNwb0x2cTM4aDNucUJlYUQzRlNW?=
 =?utf-8?B?T1lrQ2dMa0RJeTV6OEQwUlA1eUdYc3dTSVZRL3lQSGVoK2R0UUthTUJJMzZN?=
 =?utf-8?B?NkZiMjRPUUpzZ1Qwa3B5aHNaMG9PdnNDUnBDcFNmZmQvMk9XZkRERXdqN25C?=
 =?utf-8?B?NGRkemhlTTNFWU50a09EYnhCaTRxYXg4eHMvdmFGWGMrTnM3WXltc1F6THZi?=
 =?utf-8?B?WjJoaG8vNUNnYVJFcVZuenN0SUNNMit4azJjandZUFdMcmhVRnNJSnltZStQ?=
 =?utf-8?B?SmIycm1QWVB2R25vd25QeFI4MURNbG5mMmxhcERiY0lzY2NYM2hDQ3lNUDA5?=
 =?utf-8?B?SHkxNEpNclMvaURkNkd0MlFza0tFMWt4UEo1RXY2QUcydkpiSS9vWEo4YXdO?=
 =?utf-8?B?b3VrVXFabGhWWnVrZWNnc1JWZmMxcHpwRTNoM1luSkVZRFFjQzRUR0o4eXhp?=
 =?utf-8?B?K3JKcXl3aUFiS1M0ZmFMYTZIbzZuajlFK0dyd1BkVU5QajFJUThLcjYvOE5T?=
 =?utf-8?B?ODFpYlo4ZkZ5aFdtbWRTTzMvdE40ZjBkY3czZmtiWlRES2lsZ1ROU25MU0Fh?=
 =?utf-8?B?ZE9wcnN5aXNJRm9YVlVzR1hORkt2WFlCTEIxVWhpVDVhckxzOTBXbmtVMFkz?=
 =?utf-8?B?dGp6c2FCNE1kRjBtbHZtMVpmUHFSekh0VzFNT3BRY09Nam5MNHY4Ukp4VEQv?=
 =?utf-8?B?dFBmVlBrckJ0Y24xQmEwcGI4TmZjTk1sMXNyYkdUbjk5ZFdRWVlEMEp2anQw?=
 =?utf-8?B?VC90RHpoQTBwaHk4V0pGbGJieVRwU0k0K0FneWVNdVVmMjY1QTN4QUhSbUpS?=
 =?utf-8?B?UTlqQ09qcFFSbm16TmZaUXpzOGdXK1UxUUN5ZU4ycTZsNkFWd1hETEdYdUJW?=
 =?utf-8?B?cGJwTysyQTl5R2ZsSHNkZWlOLytQbnlZSDBqdVMyUGhaMEtaQ3hROXdva3dm?=
 =?utf-8?B?UU9IS2kzSmhNVGpGWGhONE9sYWJ5VytGMlpJclVhT0RUMVFFSXV1ZE1Zc2FK?=
 =?utf-8?B?S25HV0VCeDZaLzRjckZmYVRwY2lBa0FiNW83bGF1ZHQ0YWdCWldGQjRad2xj?=
 =?utf-8?B?WnMrK2VoSldIOFYxRThWNzBaM1o1RHpmMXBkOHVLaFJZYitGQXcxTXhuRG5x?=
 =?utf-8?B?LzJBb3RFQjh2ajRxWFpUNURjaUhEU0RnaTBuMGh6Vlg0TmRJNDBPcXI5ZTM0?=
 =?utf-8?B?cmQzOWd6SWkwMHhUQ2Q3QmcvcjBnbnFud3V4aC9pRnFIZ3loei9jNmtLbTln?=
 =?utf-8?B?VnQ1V2wrRjhRQTFTRW01NjR6TlF3YnJDU0ZLazErZlR0Z1RqTGUwNFBMa29Z?=
 =?utf-8?B?b1ZkSGZrS09mWHBhRUE2eDBZQm9DVE83V3A3d1F4R21mMGRyUXVDL0Zvcm1U?=
 =?utf-8?Q?eS7X1Iug1kw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QktLeUxwN0NuYTB0WHZzOWU4eTVqQ2ZlVXZaL0x0U29QN2JzaWVzaGlyektx?=
 =?utf-8?B?ZlFLeTNaOFZIcFlGdHd1YlRIa3BuWEwvYkVWZXFkRjk2Mnh5SHhSbWpwZ3Nn?=
 =?utf-8?B?bDVFUHV5eEhHaS9TdW5hTzAwMTdPK09DLzczdWJqT2hiWVZ6bW5IYXhlaVRq?=
 =?utf-8?B?MnhKVXV6SU1VZWlnZHFqOXFDbWM5ZFJKK2p3akRyY3FsWHFyZkplNTByb1Q2?=
 =?utf-8?B?T0FJUzh0U0xxMEM3VDdXSWRBUFJ2amNLNXB4VVVSemJPTnhac1RVWDJZeHlG?=
 =?utf-8?B?NmwwT1JoaVFHTlJhZDJUdmxWNDZWM0pFdmdmRFpkeVl1bjlSTHo4SDF6SEJh?=
 =?utf-8?B?a1ViY0RkdUdWQWRKeWxkZ3FVSHRyMldUbkVFSnhXTjQrT0ltczRINnEzSTBv?=
 =?utf-8?B?d3BuR0VQdURPRHlRM2xSZittZ2kzV0o2bytiQmFuOUxDakhBUXAzejhwL0dD?=
 =?utf-8?B?RUVWcTlaUkduZ0RTWGttbGRjR2lOR1NxM0NmS3Q5aW9id2xYWnBZYm1rSEFH?=
 =?utf-8?B?NzhabFI3QU9SenRHcm1qWUZlQUw4NE82VkVRWWhQK0pONzBJRDAya0pHbHZJ?=
 =?utf-8?B?L2RNSjdHdERKQnNQeEYvK0x3NTN3NHRpUk5DWjZyQTlheXU5WDN2TGt5QXhR?=
 =?utf-8?B?bWJrQlIvaXQray9pSkg4TmYzNkdlYUdaMDNIbEUrS1hwUC9SZUxtUWFXOGQ3?=
 =?utf-8?B?SUhmeFFSUkZnMGlEWVhEU2d2Vm5zUVY2dVFRUXNTVytiWXVQRWJhNTNDQnI4?=
 =?utf-8?B?WjViclNyN2t5QVYzYVBRRGZmTUIvc1BGTG1hbjUrZGc0WFBJQldZeE1DallV?=
 =?utf-8?B?Nm1HYUNUSEs0QnlNNTk1cllSeFFFdkp2dVBGUmVHY1l3azErMFhPbTZFMytK?=
 =?utf-8?B?SkxTM2MycDkrUFJWRGNlc3FnejRZd1BzZ1Q3aVlrVzZZdlpoUjhWd1IxdC9x?=
 =?utf-8?B?UVRySk5pbnA2VEhQcS9RNndvWFVuTklRZnYzcVBSTStOOTZyaHlyYzZ1VXVl?=
 =?utf-8?B?NS9tMDZRS3FkRWZVS1FUZGtuTkNPdUtacWlHZUxxYnNISTA0cTFGRGxpc0pS?=
 =?utf-8?B?dWozZXd5THowb0UycXk3anRoMFppVVFqN203c05JbjBLREFrSUd1UU4vVUZy?=
 =?utf-8?B?K0NXUWNDVm0yTW9iNlFUWXFnc2ZZa0haVFp4bU5XNWhsaWZnVWtFa29YN3Vp?=
 =?utf-8?B?aFhvN1diK1JodytiOVJNdHI0NWpMTUpRS1pwRE5JVG1LMGJaeGpzNlNKalB0?=
 =?utf-8?B?L2s1VHBPTW9xTkRTV2xwbk1iZEdEdWQ0TVF1ZG45bStQODY4S2RDcWp0YmhB?=
 =?utf-8?B?eUM0RXJrT2ZHRlgyZWFvZVkrelp5bmFpTzg1UUJ6c3g5NjFlRFBGZm5qd3J5?=
 =?utf-8?B?UHhNWDBYdHc1KzN6dlpyTFZmRmFhMlN4ZGVmQWJhaHhJSHlDUnRJMzlEMEVP?=
 =?utf-8?B?NEl1ODZKcHJMUFQ0MmZDdGdRS0FDd0dlR2trVHUwT2YxdnZvNDZsTzNxTSs5?=
 =?utf-8?B?NnNCcjEvN3JqS2pKTjhGZW4vS0FpNkNIakZJRGtRckwvY0VlZGlZYmlEVDFk?=
 =?utf-8?B?RExOT281blROd2FocU9UN1YrZzcwYS9JencyNVVrMFFzTHdqaVd1Um1ZK2Fk?=
 =?utf-8?B?ZWExazl5MGpPMGxLeXFhakNhSHAxTjhBeHpvZUhyYjEzYnc5SnViVFhERGhp?=
 =?utf-8?B?cW16Y0haQ2JlYXZlRE03UWtSYjVac2lBNHF0ZlpreUZTaDVUZWNlUFVacURV?=
 =?utf-8?B?TytyMXhEMmttVGdNRW1nNUxaSTQzeHJweC9Id3BXZ2FZb010eitJRjEyREdi?=
 =?utf-8?B?K1VncXNKM3lWZUsrcEFZbkl4QWtpUGdKRWMyZnMzNHlCaG9qdmozMEdURnVJ?=
 =?utf-8?B?UnB1cWtNdWI2NXpnZUZ2NEtJOXpYSVFod3hSaEQvWTZ1UThhaWcwaGVqTk5Q?=
 =?utf-8?B?aWdSdk1WVkx2Y1VMN2d5WTJCQ1h2bm4yUHA4QVdCSXMvTFBSRjZjUDNkNkF0?=
 =?utf-8?B?Qjcrc2RuWUxMa1BXeDlSbXhpdUdzTjZqV2d6Q0RoUkdtV1ByWUJoRW1JRXAy?=
 =?utf-8?B?OW83SENlZGN0TkMzR0NBdHhSWjZYYVhwdXBWeGhKTEhPazJiSDNremRCR3BS?=
 =?utf-8?B?YS83WUFhTkt1VjJ4SCtna0IyVjZtTTZ0cTFFZFFLMFNjajRheHNMSE5SaGVt?=
 =?utf-8?B?WkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 354600d8-e397-4b32-fcf0-08dd7caedcc0
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2025 06:21:02.6195 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TjTO11d8WmaaB/2xddcCZjUG7g3X+ZsD8HFptvL8BtZamvZBchsAn/U4+VwVdovt6YveU8IMVUHjwjZPj2MoYnEDlxLpubtsqGRMzUTO61s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF890B596B9
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

SGVsbG8gQWxleGFuZGVyLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206
IE11cnRoeSwgQXJ1biBSIDxhcnVuLnIubXVydGh5QGludGVsLmNvbT4NCj4gU2VudDogTW9uZGF5
LCBBcHJpbCA3LCAyMDI1IDExOjE0IEFNDQo+IFRvOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnOyBpbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBpbnRlbC0NCj4geGVAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAbGludXgu
aW50ZWwuY29tPjsgQm9yYWgsIENoYWl0YW55YSBLdW1hcg0KPiA8Y2hhaXRhbnlhLmt1bWFyLmJv
cmFoQGludGVsLmNvbT47IFN5cmphbGEsIFZpbGxlIDx2aWxsZS5zeXJqYWxhQGludGVsLmNvbT47
DQo+IE11cnRoeSwgQXJ1biBSIDxhcnVuLnIubXVydGh5QGludGVsLmNvbT47IFZpbGxlIFN5cmrD
pGzDpA0KPiA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+OyBLdW1hciwgTmF2ZWVuMQ0K
PiA8bmF2ZWVuMS5rdW1hckBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSCBSRVNFTkQgdjEz
IDAvNV0gRXhwb3NlIG1vZGlmaWVycy9mb3JtYXRzIHN1cHBvcnRlZCBieQ0KPiBhc3luYyBmbGlw
cw0KPiANCj4gQWxsIG9mIHRoZSBmb3JtYXRzL21vZGlmaWVycyBzdXBwb3J0ZWQgYnkgdGhlIHBs
YW5lIGR1cmluZyBzeW5jaHJvbm91cyBmbGlwcw0KPiBhcmUgbm9yIHN1cHBvcnRlZCBieSBhc3lu
Y2hyb25vdXMgZmxpcHMuIFRoZSBmb3JtYXRzL21vZGlmaWVycyBleHBvc2VkIHRvDQo+IHVzZXIg
YnkgSU5fRk9STUFUUyBleHBvc2VzIGFsbCBmb3JtYXRzL21vZGlmaWVycyBzdXBwb3J0ZWQgYnkg
cGxhbmUgYW5kDQo+IHRoaXMgbGlzdCB2YXJpZXMgZm9yIGFzeW5jIGZsaXBzLiBJZiB0aGUgYXN5
bmMgZmxpcCBzdXBwb3J0ZWQgZm9ybWF0cy9tb2RpZmllcnMgYXJlDQo+IGV4cG9zZWQgdG8gdGhl
IHVzZXIsIHVzZXIgYmFzZWQgb24gdGhpcyBsaXN0IGNhbiB0YWtlIGRlY2lzaW9uIHRvIHByb2Nl
ZWQgb3INCj4gbm90IGFuZCBhdm9pZCBmbGlwIGZhaWx1cmVzIGR1cmluZyBhc3luYyBmbGlwcy4N
Cj4gRGlzY3Vzc2lvbiBhcm91bmQgdGhpcyBjYW4gYmUgbG9jYXRlZCBADQo+IGh0dHBzOi8vZ2l0
bGFiLmZyZWVkZXNrdG9wLm9yZy9tZXNhL21lc2EvLQ0KPiAvbWVyZ2VfcmVxdWVzdHMvMjk2MTgj
bm90ZV8yNDg3MTIzDQo+IE11dHRlciBpbXBsZW1lbnRhdGlvbiBmb3IgSU5fRk9STUFSVFNfQVNZ
TkMgdW5kZXIgcmV2aWV3IEANCj4gaHR0cHM6Ly9naXRsYWIuZ25vbWUub3JnL0dOT01FL211dHRl
ci8tL21lcmdlX3JlcXVlc3RzLzQwNjMNCj4gWG9yZy9tb2Rlc2V0dGluZyBwYXRjaA0KPiBodHRw
czovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcveG9yZy94c2VydmVyLy0vbWVyZ2VfcmVxdWVzdHMv
MTgxNg0KPiANCg0KV2UgaGF2ZSBhZGRlZCBhIG5ldyBkcm0gcGxhbmUgcHJvcGVydHkgdG8gZXhw
b3NlIHRoZSBmb3JtYXQgbW9kaWZpZXIgcGFpcnMgc3VwcG9ydGVkIGJ5IGEgcGxhbmUgZm9yIGFz
eW5jIGZsaXAuDQpDYW4geW91IHBsZWFzZSBsZXQgdXMga25vdyBpZiB0aGlzIGltcGxlbWVudGF0
aW9uIGxvb2tzIGdvb2QgdG8geW91PyBJZiBzbywga2luZGx5IHByb3ZpZGUgYW4gQWNrLg0KDQpJ
R1QgaW1wbGVtZW50YXRpb246IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJp
ZXMvMTQ2ODUzLw0KDQpSZWdhcmRzDQoNCkNoYWl0YW55YQ0K
