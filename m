Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC6AAC485E
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 08:25:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C90A910E3BC;
	Tue, 27 May 2025 06:25:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xrh0A0zQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07EE510E3BC;
 Tue, 27 May 2025 06:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748327117; x=1779863117;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nK3Jg3b2+51dyjkJ28cmsRao3aAED+8bxGLH/sIKBm4=;
 b=Xrh0A0zQi7ATDmycKaMB5F2NPpknsI/YJQTyEbv94AjzBSpNlRj+uEBV
 Fn3ZOMCCrz9DCBZFdg+Nx7lxhClOjI8FXm27XncFqWRV2NW2lBP6psYB4
 /e0ZNw7m0Xz2Ek/L7SB4TyCtlyhgM9UXFBC1KfVpsiVemT5MDXcP/dJSI
 ATAumhIFNw4dVSF6GQPZjn1gHNLJiSkjDAgCYpPxDIa82gS4rxWP9kKzd
 R2tZ0R25c/FJ+uPdazvb1kfzfp7gQArhcyuoxn9meAaMphBQGX05lNxDk
 dum0SKfIat72ej1L13RZzZvhbhWgRvcUWlpOwgvYytdWURi9Y0p+lEGqR w==;
X-CSE-ConnectionGUID: oZK85EHERQyDhyN2+8eRzw==
X-CSE-MsgGUID: W2jVhMWaS7yuHo+heCNNmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="49412026"
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; d="scan'208";a="49412026"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 23:25:16 -0700
X-CSE-ConnectionGUID: fWAA5VrzSMWQ7I1Iyr46xg==
X-CSE-MsgGUID: lGsAJylUSgeYeAqi0W08+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; d="scan'208";a="147442523"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 23:25:16 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 26 May 2025 23:25:15 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 26 May 2025 23:25:15 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.67)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Mon, 26 May 2025 23:25:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q4mfbm0WvG5rDrp0XuX/nba7vafqQ5T2WLF7TxqfjpbQNEnASGegb65SYX5yVhNg0fqBcq+ZLNZIpNzSVa29lkan4MsaSwtgDaDgzGd4TEhNw0YVg1CLXegQ/P6ccXDnd9x1mMS3tnJ2tNk+jCxW2eprd0NoHVx0sSMJqVOnXmdbkBUSBFYTH4gbrhI1hnkoFx/ayT9yFX6BV0tex3glx8BZLbRYo5hdrIz4f1cBXzQs8QI55MRR710CxWeEZFlVnVATaQFW+r7iMOaBBv9Y/pEb1LIHi3pVlbxm+yAVy8UZ3CjJRI6zsYRRfULnMXLSM9Z8UFCnENHBJwNcJC1pvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nK3Jg3b2+51dyjkJ28cmsRao3aAED+8bxGLH/sIKBm4=;
 b=JGe/5T+Rboeb2EkT39R1gTcvI/6Z630Vy/1VjGB0qmI/BxDIgw3seiCSPnMRe6YhjtmrNh261z1M7/EUOU151DeU3uJxEOzNLQjb4kC5P1vYdGcvpztCojwPDwVtcfmmJGUueDz1qHnIlQzMx5PjVFTdADhAeh2JQhciJqeG/W7GKa9LO7vf6TWWtfuk4uHkeMmoMIZNadmYfKs3yR9MzG98i9NIWDjfqivNraVqTLH4tHMBFm5krp1LDx9heI5t53HrTJSQrLX/yevElCGz8j8l7CWyek/+Mes+R662rjm5/waSCNCgM0VJsYBw0qO8FDwa6GFvMjhy6pYc1nLMEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by CO1PR11MB5202.namprd11.prod.outlook.com (2603:10b6:303:97::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Tue, 27 May
 2025 06:25:13 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778%3]) with mapi id 15.20.8769.022; Tue, 27 May 2025
 06:25:13 +0000
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
Subject: RE: [PATCH v10 08/10] drm/xe/nvm: add on-die non-volatile memory
 device
Thread-Topic: [PATCH v10 08/10] drm/xe/nvm: add on-die non-volatile memory
 device
Thread-Index: AQHbxaAaBNngr+ItyEmq2P6oEpoBdrPhoi0AgARsrvA=
Date: Tue, 27 May 2025 06:25:13 +0000
Message-ID: <CY5PR11MB63666722F7C02E4D776CE601ED64A@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20250515133345.2805031-1-alexander.usyskin@intel.com>
 <20250515133345.2805031-9-alexander.usyskin@intel.com>
 <aDGfgubuFfa3e0K_@black.fi.intel.com>
In-Reply-To: <aDGfgubuFfa3e0K_@black.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|CO1PR11MB5202:EE_
x-ms-office365-filtering-correlation-id: 8118fb6b-c4a4-49fa-649d-08dd9ce73d15
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?dUlXOGVuejgwTEdGY293YmRYbzhQa29WUUVHeXdIQ1VlKzJlRFVNc05sNkFn?=
 =?utf-8?B?Si9wbFlZWEtWU0t1V1FjZER0UG9IZFk5SVFEY3N2TmJKUGZ3eDltS0NJY05Y?=
 =?utf-8?B?elpMVkxtWXBYVEdTR3Vad0Y3YW5xVFJKVU1kY0VtWVYzcmJ5Z3hjQm02Rjgw?=
 =?utf-8?B?TmR4dEF6VFdmTkNoOVlsVkswc3Rab3lDd04zMXkrMWRncTBVT2wrK3M3eFN3?=
 =?utf-8?B?R29CL2ZYNkEva2hqcktnREpZWjQvNmhjZkdXVjRGc3J3THNZL3RBOUdIcUxU?=
 =?utf-8?B?SUlZRkdQdklUaEhOc3Z6R0hDRnkwWDdId2FLZzR4UEdKQkx5VlRxUnVsS0RC?=
 =?utf-8?B?akJhUWFBWVN0YXpEb2c1MXJ0TGdwUHVnSTB0MGRwUi9nMmprSmlTN1VOS0Ns?=
 =?utf-8?B?aVhPNTEwMVVwNDZMWlZMT1hYZ1FDMFhTSXk1WkhpSkNNbXdzcmtPWlI3YmRD?=
 =?utf-8?B?Z0hrQXZYZENtMUlkSTc2cjNONGgyK1A2KzcwTzBuRlBEYlZleG5hbjYyc3E3?=
 =?utf-8?B?WFl1TTUvTUxMTElLdFpUTU1zcHZKQ0UzcGxCdTdnSHlpS1htZnlSQXovbEFB?=
 =?utf-8?B?T29jZUhjbCtuNHBGNEtpRFVMTnRBL3VHQmRXVzFQbytOSmZUbytzMktOdFl6?=
 =?utf-8?B?MTdXZVNORHBicjZCZFNBeUZSWnNpUTdtbTNZbm45Wm82UVFBMnpmaGk2MHBv?=
 =?utf-8?B?TjFsQVlad1dpa3FiSFo3ekFwQUxWR1VBTy96cmM2Qy83UmcwYzg0STk5MklO?=
 =?utf-8?B?OHhsOEtRbnZHSkorVGNPYjZKaXRWTVJ4aGs4dVBlRkRKZHQ3RzczWWRMRS9I?=
 =?utf-8?B?MHVIQncvd045aXBicU54Wk5zNDZDbUlEN2tIRS9saWRlYW9DMGpsYVF2OVpr?=
 =?utf-8?B?c09wbXMrRWI5clRzcXJ5bk4ySWl3TG9tY1lEODlUbnBybEJhRkRuNklRN3lR?=
 =?utf-8?B?SjBOcnNRVkgvUzNFbGJpVnpuS1R3V2c4N2tlUWFtZzQyamJTME5YSFU3ZlMz?=
 =?utf-8?B?a2hxQ0VDZUtGdmV4VnRway9udEh4MHdoWmc1bHMwV2Q4eDVxZ0hBOVNmamlZ?=
 =?utf-8?B?Zk84SU1XYUwzRUF0RCt5cTZlaVBBVyt1cWpGMGRVbkZDZTZBSVlzTDU5VTRh?=
 =?utf-8?B?KzU0TVBWeldBUzZyRVQ4RitaZzFQNEFybFRpbUZ1OWlFTDd1elJESjZMdkx2?=
 =?utf-8?B?aS9ZdDFMZzVtVWh4ZEVzNzMrK0FXMHNmVTBodFVFZ0dYYTRMN2sxT1EzakRv?=
 =?utf-8?B?dnpDU3h1alYzcVE1OTZIaDJ3TStjUkNaT1NxejhCK0IzeC9RL3pzVlArVGpF?=
 =?utf-8?B?clhFWXQvZnBuY1Q1QjNIY2NXelB5eVFBS0pMclYxR2Nzbi9IMm1oUmQxU3px?=
 =?utf-8?B?ekt2UUdodGxFVjU0d2tyc1orTmk5SkE1eWlNWXAvWkZuN3hpRllZNlJmby9q?=
 =?utf-8?B?K25VV1Mza3FhY2VtM090TW44bHdXamtSWSsvQWhDbDZFTEd6RzZEcnhDeXdi?=
 =?utf-8?B?NUhubEUvRzEranpqQVlMMjNITndyUmNjOENyNUNCM2FxUU9Gdlg5K0VZQWMv?=
 =?utf-8?B?SVBQVER3RlgyMm1FOTVoQWVpbzliNnVEakxyT0l5SGhUbUd1OEg1T0dBb3BR?=
 =?utf-8?B?R1EwaGdWZm81NzRrMDBJYysrUlBxNFZacEJVL1Y1eU5SMkswMFlUK0x1ZGUz?=
 =?utf-8?B?U1ROOGdzVU1RbzhISmZ6ZkZCQXJtVFN4S3RHVkhRMGNjT3FrYmduWk5jZnE0?=
 =?utf-8?B?T0kyRjNPZFF2Z3FGTVdhcjAza0pDVTlNRmRBZ0VFaTgrZnpJQ3UrWlQvSU0r?=
 =?utf-8?B?MFg3WVVVUEdMVmJkWVRNT0dRTkZoRHpxT01uYm43enVNeEx4eHdvOFBVemdh?=
 =?utf-8?B?Y1VER29CcFoyaWZsbGZsamlqb25KblZGL0JWa3RCZzFoa1g0RWgzMUFhbHh2?=
 =?utf-8?B?dnNLRTFRb2VMV1lMZU9ucEUveTJnd2xFODdwN0VFUzFscjlaU0QvSkVHTW1P?=
 =?utf-8?B?dkN6R0FMdXlRPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6366.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QUFPdWxNV0kxdnhHbEdBQjVzSUhxQ1ljZDhhMmdVRStET3J0S1JtaFBBRDlD?=
 =?utf-8?B?ZC9PckxtYnU5YXB2MmluRjZzTFdTTmVUQVJhZlVONThtSDNhRmdZek51TTZ4?=
 =?utf-8?B?Z2djdzczbXltVHFlZ2RZaWJSUXg1VGtnalFnTzZ2Tlo2aEVoTm53Um5LMHdD?=
 =?utf-8?B?bi9oOUZHZDBTV1EwSEV2RjEwWWkxZ0lRR1pSTzQzeFNndm9wQ0VFUERBN0Ux?=
 =?utf-8?B?ZzN4VmUvRVZJbC91SXVRN2QxUktSR0MvNXRNZ29YN3ZxSzdBU2NwL0VhL0J2?=
 =?utf-8?B?QjhCeXFINGRuRWFXMk5GbnVuZ1FoaHAyNklVbTZQaFZYc094blA1U3h5M0pW?=
 =?utf-8?B?RjNhYWdvczJ3TlVCMmZTTjNtZ2E3UklFWXhIWUYwVFpTclVuc0xaOHRRdU9M?=
 =?utf-8?B?eVQzOFlsMnd5aVYwemlRRGpvYnNUbEhhKzRobU82d3lBRFN4ellaNC9qYTNL?=
 =?utf-8?B?Nmd5d2FrYjJvV1FCRWorcXZwVFlhZmYrQkNEWi9oM0txVGhIcXdpRjdJd09k?=
 =?utf-8?B?UFZQdWNLYTZRRWpXdW5PamVuTm94a1VZNXczV1oxUmFITUVWVk5yekxQTEdE?=
 =?utf-8?B?dmxpem9GYmMzNDBuYktsbnNvOGJ0eHY0aG9WSmZncFZENmJyb0JVVE0vcUF4?=
 =?utf-8?B?WEhWZktkSHd0d0x3aVN1bWh2d0VmYWFyV3c5MDUzRjB1RVR4WlFrTVhla0k4?=
 =?utf-8?B?YXFHclhpeTlQZnNrRzNVKzNoK1BtWmEvNloraUEwa2RKSldBc0JrYTJHUS9x?=
 =?utf-8?B?N2YyQzZpcjZEbjZZZXRwTncvWEhqVzZBT2pydnBZRTlORlVYMnVMOEQyNkx1?=
 =?utf-8?B?VFp6QTBMdnJPRjlmREYvTmlxNEpqS3lXNExMVmdmQzVYR3hiQnoyaFRjQnEx?=
 =?utf-8?B?cHUwVk9XVVNuS2xhS29aaEFmbE5MbGdLR1Q1c2dKUWV0V1YweUR0L05wSzRo?=
 =?utf-8?B?andmblVRVVB2d09mVnc4OGtnSEFERzYxWmpoaGdnN2xCWUFJNUNkT0ZuWTl5?=
 =?utf-8?B?NzkzeU1rY3JWaXROMVdhYVBTVWVSem9MS0NJUDZobGVPUUdVMWJxOUpORW8y?=
 =?utf-8?B?S1VpWXVqMDVST3dDbmVGRFMzSnQzWEZqQjB2Qko0TVFOQ09UZ0ZVRzdReXNp?=
 =?utf-8?B?c3dsVGw2Sk9oT2JjYldUNUZnR2x6UWtlbm9JNVV5d0FUdEl1d3VUMGowN3RW?=
 =?utf-8?B?TVltWXdLcjNjRHU1cmxUQnpUSk5vZnc4MWE2T2VZeWQ2VC9IN253dHJQdXpD?=
 =?utf-8?B?bTU1Y1VUNzFzWUUzQlRnaThKMWpaSDhCN0p6bzlqWS9tcUFWWUVxcXhYMHNC?=
 =?utf-8?B?Zmpqc0RLZVZEZjZnR2NtNjNJWXpVb0FKaDVWZVBqWFZReHFzNk9VYVNYMGlY?=
 =?utf-8?B?MHBKaHB3Z2FSUjZtYU9SWXYxZzlvanJlY2xSZk9STW15TjZEaWZ1OXNqaC9a?=
 =?utf-8?B?b3NNY2pZZHhzdzRzaStEM3RPNUdFdjQzOUhLMXB4UFo3eEtOalU2bzg1d1lv?=
 =?utf-8?B?MlJIYkZFSEZ2UGZ5N3BjOXNrTUFOZzhnbzlkRktrbFdLZE4wUkNMVDYxb2F2?=
 =?utf-8?B?ZUtUZHU0bFU0T3A1Qkc5VDJnNHJFUVFVWnZEbFdxTDRSMWRPTktOSENZSDJK?=
 =?utf-8?B?aU5tSmQ2RmRTRldJTlJJY0hSa2REZnJSN2Eyb01YWGdVbDBsbngyZEVsZEZ1?=
 =?utf-8?B?QUFMOW5GcVBQaVJnQS9RS1ZDcUNkc1Rvb2NpSVcwZEJITVliYk1aYUxFaGpL?=
 =?utf-8?B?ekc2SUZDU0FRVmNOOXZ0bUtoZ1k2eTIybThXaUhjZS9xL21aRGV2cG5QcC9O?=
 =?utf-8?B?TUZnSGw2RTZDYUNNSWVmckR2YVJsMG42bmdRbUtnUzZ1cTdteFVNVTRqRnpD?=
 =?utf-8?B?Q0Zmays5azQycXhrMkFZbmhYN1hBd1VqdnUyVWJQYlB5TXdsWTRaTmJsUUVx?=
 =?utf-8?B?VFZtUERaSkhZM0R3QVh1bUhlNjcyZ2NBNWZkZzdoT1N2OHFFL0Mxb0NrQ3hH?=
 =?utf-8?B?MmZBK01VVWhoNE1uOVBTZnV4Sk9kREhsTWJrRHVVOWEwTG44RjU3dVNBWUhj?=
 =?utf-8?B?d010bk1rQTkyOUEyVDEvSHRvUkJSQTVOZ1JYaFNLTlB0OUhHZ0laU1RzVEpt?=
 =?utf-8?B?YVAwbndQUEtoZ3FtQzVlc2x1NzhSSk9McTFBUnhCbUFNSXBiVTFkdktSUlVZ?=
 =?utf-8?B?Ync9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8118fb6b-c4a4-49fa-649d-08dd9ce73d15
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2025 06:25:13.2256 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VCqgOfXlvs8v0ha91FMVTA68wGJnFbCOm9LylmPvAB0/Q2fA0HhbMTImG6QrQ0KPZ8l4fqTpAdj1cYJLMnZeF+EYI2QRZI4Mr224xUoDUac=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5202
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

PiBTdWJqZWN0OiBSZTogW1BBVENIIHYxMCAwOC8xMF0gZHJtL3hlL252bTogYWRkIG9uLWRpZSBu
b24tdm9sYXRpbGUNCj4gbWVtb3J5IGRldmljZQ0KPiANCj4gT24gVGh1LCBNYXkgMTUsIDIwMjUg
YXQgMDQ6MzM6NDNQTSArMDMwMCwgQWxleGFuZGVyIFVzeXNraW4gd3JvdGU6DQo+ID4gRW5hYmxl
IGFjY2VzcyB0byBpbnRlcm5hbCBub24tdm9sYXRpbGUgbWVtb3J5IG9uIERHRlgNCj4gPiB3aXRo
IEdTQy9DU0MgZGV2aWNlcyB2aWEgYSBjaGlsZCBkZXZpY2UuDQo+ID4gVGhlIG52bSBjaGlsZCBk
ZXZpY2UgaXMgZXhwb3NlZCB2aWEgYXV4aWxpYXJ5IGJ1cy4NCj4gDQo+IC4uLg0KPiANCj4gPiAr
dm9pZCB4ZV9udm1faW5pdChzdHJ1Y3QgeGVfZGV2aWNlICp4ZSkNCj4gPiArew0KPiANCj4gU2Ft
ZSBhcyBwYXRjaCA2LCBwbGVhc2UgaGFuZGxlIGVycm9ycy4NClRoaXMgZGV2aWNlIGZhaWx1cmUg
aXMgbm9uLWZhdGFsIGZvciBYZSwgY2FsbGVyIHdpbGwgaWdub3JlDQp0aGUgZmFpbHVyZSBhbnl3
YXkuDQoNCj4gDQo+ID4gKwlzdHJ1Y3QgcGNpX2RldiAqcGRldiA9IHRvX3BjaV9kZXYoeGUtPmRy
bS5kZXYpOw0KPiA+ICsJc3RydWN0IGludGVsX2RnX252bV9kZXYgKm52bTsNCj4gPiArCXN0cnVj
dCBhdXhpbGlhcnlfZGV2aWNlICphdXhfZGV2Ow0KPiA+ICsJaW50IHJldDsNCj4gPiArDQo+ID4g
KwlpZiAoIXhlLT5pbmZvLmhhc19nc2NfbnZtKQ0KPiA+ICsJCXJldHVybjsNCj4gPiArDQo+ID4g
KwkvKiBObyBhY2Nlc3MgdG8gaW50ZXJuYWwgTlZNIGZyb20gVkZzICovDQo+ID4gKwlpZiAoSVNf
U1JJT1ZfVkYoeGUpKQ0KPiA+ICsJCXJldHVybjsNCj4gPiArDQo+ID4gKwkvKiBOdm0gcG9pbnRl
ciBzaG91bGQgYmUgTlVMTCBoZXJlICovDQo+ID4gKwlpZiAoV0FSTl9PTih4ZS0+bnZtKSkNCj4g
PiArCQlyZXR1cm47DQo+ID4gKw0KPiA+ICsJeGUtPm52bSA9IGt6YWxsb2Moc2l6ZW9mKCpudm0p
LCBHRlBfS0VSTkVMKTsNCj4gPiArCWlmICgheGUtPm52bSkNCj4gPiArCQlyZXR1cm47DQo+ID4g
Kw0KPiA+ICsJbnZtID0geGUtPm52bTsNCj4gPiArDQo+ID4gKwludm0tPndyaXRlYWJsZV9vdmVy
cmlkZSA9IGZhbHNlOw0KPiA+ICsJbnZtLT5iYXIucGFyZW50ID0gJnBkZXYtPnJlc291cmNlWzBd
Ow0KPiA+ICsJbnZtLT5iYXIuc3RhcnQgPSBHRU4xMl9HVU5JVF9OVk1fQkFTRSArIHBkZXYtDQo+
ID5yZXNvdXJjZVswXS5zdGFydDsNCj4gPiArCW52bS0+YmFyLmVuZCA9IG52bS0+YmFyLnN0YXJ0
ICsgR0VOMTJfR1VOSVRfTlZNX1NJWkUgLSAxOw0KPiANCj4gSnVzdCBvdXQgb2YgY3VyaW9zaXR5
LCB3aHkgb2ZmIGJ5IG9uZT8gQXJlbid0IGlvcmVtYXBzIGFsbCBQQUdFX1NJWkVkPw0KDQpXYXMg
aGVyZSBhbGwgdGhlIHRpbWUsIG5ldmVyIHF1ZXN0aW9uZWQgdGhpcy4NCj4gDQo+ID4gKwludm0t
PmJhci5mbGFncyA9IElPUkVTT1VSQ0VfTUVNOw0KPiA+ICsJbnZtLT5iYXIuZGVzYyA9IElPUkVT
X0RFU0NfTk9ORTsNCj4gPiArCW52bS0+cmVnaW9ucyA9IHJlZ2lvbnM7DQo+ID4gKw0KPiA+ICsJ
YXV4X2RldiA9ICZudm0tPmF1eF9kZXY7DQo+ID4gKw0KPiA+ICsJYXV4X2Rldi0+bmFtZSA9ICJu
dm0iOw0KPiA+ICsJYXV4X2Rldi0+aWQgPSAocGNpX2RvbWFpbl9ucihwZGV2LT5idXMpIDw8IDE2
KSB8DQo+ID4gKwkJICAgICAgIFBDSV9ERVZJRChwZGV2LT5idXMtPm51bWJlciwgcGRldi0+ZGV2
Zm4pOw0KPiANCj4gRGl0dG8gYXMgcGF0Y2ggNi4NCldpbGwgZG8NCj4gDQo+ID4gKwlhdXhfZGV2
LT5kZXYucGFyZW50ID0gJnBkZXYtPmRldjsNCj4gPiArCWF1eF9kZXYtPmRldi5yZWxlYXNlID0g
eGVfbnZtX3JlbGVhc2VfZGV2Ow0KPiA+ICsNCj4gPiArCXJldCA9IGF1eGlsaWFyeV9kZXZpY2Vf
aW5pdChhdXhfZGV2KTsNCj4gPiArCWlmIChyZXQpIHsNCj4gPiArCQlkcm1fZXJyKCZ4ZS0+ZHJt
LCAieGUtbnZtIGF1eCBpbml0IGZhaWxlZCAlZFxuIiwgcmV0KTsNCj4gPiArCQlyZXR1cm47DQo+
ID4gKwl9DQo+ID4gKw0KPiA+ICsJcmV0ID0gYXV4aWxpYXJ5X2RldmljZV9hZGQoYXV4X2Rldik7
DQo+ID4gKwlpZiAocmV0KSB7DQo+ID4gKwkJZHJtX2VycigmeGUtPmRybSwgInhlLW52bSBhdXgg
YWRkIGZhaWxlZCAlZFxuIiwgcmV0KTsNCj4gPiArCQlhdXhpbGlhcnlfZGV2aWNlX3VuaW5pdChh
dXhfZGV2KTsNCj4gPiArCQlyZXR1cm47DQo+ID4gKwl9DQo+ID4gK30NCj4gDQo+IFJhYWcNCg==
