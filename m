Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2458C8BA10E
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2024 21:26:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E07B2112668;
	Thu,  2 May 2024 19:25:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E3PDIUbX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DDAB112667;
 Thu,  2 May 2024 19:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714677956; x=1746213956;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=F+JMyian+ZNZQLWNUnFXYE8F281RE6FRyB5sKtDL5b8=;
 b=E3PDIUbXfNDCrDyKx49+PD1tJS47b5T8t75dAXBeS4XtGdF5eXw43/IU
 NHoGiO5HQ/3W1cbqqqRDyRUyG/N4BkTvNYUdmR8UTm8n6LiCWd3ogvWOV
 +/Zt4wR4bA8xAHC9tNeTIetCaeqM4PwvRCkOR3BFIeYwlNQew22rWJ+Dt
 bM+NfYUBTTJIh4PPa1EL7dWGIkOQlbGjDEd1j5HvciTIv6+4lvfLbMvw2
 EmEnfVE+uhQ4yaqwcImnQHyBAW/2LfwD22EoRsF+ehrHC8ggiAoSjtOTF
 1KLR/vWdjfM0H0XUzSl08BkhEzdUp1Peg6wKvlGDqP/sYTj0fXPomrr6H Q==;
X-CSE-ConnectionGUID: er1C0qqCTnKEf1nnHbaMzg==
X-CSE-MsgGUID: NvlpwEMCQXq36wAYsX9OWA==
X-IronPort-AV: E=McAfee;i="6600,9927,11062"; a="32980130"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="32980130"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2024 12:25:55 -0700
X-CSE-ConnectionGUID: swJfBoIhTtmdRmxxO7GDig==
X-CSE-MsgGUID: Y7vIA39sRP6/oSVdvdCHtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="58112031"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 May 2024 12:25:54 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 2 May 2024 12:25:54 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 2 May 2024 12:25:53 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 2 May 2024 12:25:53 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 2 May 2024 12:25:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OJdhWnC+VvuE8M1oIURKCnE6Qi6Mt0TS7MxI36slng/19A3Or1P50s6MWyO1AudQRAy0Vci6zRm0cmfv7XskhA80en/fNQxlM7lJQJzoGRu1k1iHHXDiMIUVzbW/n4h0utOlrEfjRWUTBy02FKOnxOVrNMtHKdd1BUE8n/5B8GinHu+zTnue/xaCzs8JYbELiw3ZDaVM+6PDnsRGHOPmY+S7gLPvMV68Q7jx8E7wRmalrZ/Qvh/U+dLWzJaEEgvpjudrLAlIQ5ZFi0BU62BAfHBn08mp4sLNbc6LXePX+7UpwDI0wtki3ACK5Lq/SP8FMVQhSQAS0ezOznYL4FdU4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F+JMyian+ZNZQLWNUnFXYE8F281RE6FRyB5sKtDL5b8=;
 b=NaD69xGhDL9xKKvfaXb1fl3TTlLqc+JYmdKc7+WeaqYLL0KfLtoSYZF8lSweYQXxJAkskFjhzrD3foMp5e3Pvor/STiM3hgwOgxLZMKU8JoDHOmy37Ylv460F3L+L3cFA3zaKw9Tz9fLXPd4mPJ0v8vMhd8n7escBVrBbl7Ht5b0QlaqDtlLz4w40WNUB1UmOPgiRTw3TWUJXCehVUtCfl49ixi2qUtpPQ6ea4u94cnHXjye2MyWqp8TZ2Ci5etMAbiTTcDAywk+PqVa8tCdNCcxdmUIpXrriQ/jGZkGp5oTiztPD8jywwKzDZ1AbMIrCU+rsVJZyeMsfydj8dEGnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by SJ1PR11MB6226.namprd11.prod.outlook.com (2603:10b6:a03:45b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.36; Thu, 2 May
 2024 19:25:51 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d%5]) with mapi id 15.20.7519.021; Thu, 2 May 2024
 19:25:50 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 Jason Gunthorpe <jgg@nvidia.com>
CC: Daniel Vetter <daniel@ffwll.ch>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "Brost, Matthew" <matthew.brost@intel.com>, 
 "Welty, Brian" <brian.welty@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "Bommu, Krishnaiah"
 <krishnaiah.bommu@intel.com>, "Vishwanathapura, Niranjana"
 <niranjana.vishwanathapura@intel.com>, Leon Romanovsky <leon@kernel.org>
Subject: RE: [PATCH 06/23] drm/xe/svm: Introduce a helper to build sg table
 from hmm range
Thread-Topic: [PATCH 06/23] drm/xe/svm: Introduce a helper to build sg table
 from hmm range
Thread-Index: AQHaSZDNP3fdwvIgF0K88ldd8EilIrFZUEuAgAAW4fCAALG4gIAAI09QgAA3bwCABhSRIIAAKiwAgAGpRnCAFa1zAIAAF6WggAClagCAAiZXgIAAIx+AgAAvHwCAAB2VgIAELjoAgAIqYwCAABiGAIAAVwWAgAIXDYCAABKpAIAAPDQAgAAlzoCAAEh/EA==
Date: Thu, 2 May 2024 19:25:50 +0000
Message-ID: <SA1PR11MB6991945628597BCD9D111ECD92182@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <65cb3984309d377d6e7d57cb6567473c8a83ed78.camel@linux.intel.com>
 <20240426120047.GX941030@nvidia.com>
 <ad82f95ee29ada403459416d4c97c2b9083b5a0f.camel@linux.intel.com>
 <20240426163519.GZ941030@nvidia.com>
 <f938dc8f7309ae833e02ccdbc72134df0607dfa4.camel@linux.intel.com>
 <20240430173002.GV941030@nvidia.com> <ZjE_LJ7AFFQk0Eep@phenom.ffwll.local>
 <20240501000915.GY941030@nvidia.com> <ZjNJASw0JdXS6dTa@phenom.ffwll.local>
 <93fca752517f0120baa770992fd0f9160b0c14d1.camel@linux.intel.com>
 <20240502124632.GB3341011@nvidia.com>
 <0b700baf6fc3d41b4adf6301b1b4dbc4ff7078fa.camel@linux.intel.com>
In-Reply-To: <0b700baf6fc3d41b4adf6301b1b4dbc4ff7078fa.camel@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|SJ1PR11MB6226:EE_
x-ms-office365-filtering-correlation-id: e6276e4c-734f-42c4-c6cb-08dc6addad58
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?VFVjY2RlMzVHTWZtOGVhTHlVL3lMcTBnajlwcmFxSE9RcjcrSENZTmFyRFZ0?=
 =?utf-8?B?U0ozZzc3anZXczRKTk9pUzY2bEZ5WFc5UU43NFlOT0V6ZUY3UzJTRzZWTVlv?=
 =?utf-8?B?WVdCcVlqNzluMy9HNHhDbWIvK1BCQTVtcnFrU2VIU2JrMWJvc1U0RVNsbTBF?=
 =?utf-8?B?djJHZnZ2NThLeHNnNTBQVzdtbTFRcDJTdWx3N1NwREhNMEM0UFkyNGhJb2kw?=
 =?utf-8?B?NjNzTVlXUVB5WCsweUtpZ1ZFcDc2SHZnRUFxYjJwaGVnN1U4eEllV3czczZO?=
 =?utf-8?B?M1hUamdQRHpGZVNkZ2d4aTU2TDJVV3UvcGo0Vm5lQUtyZTJxYVV6Z1hKeGZP?=
 =?utf-8?B?RVhxNjdHUUdYa1MwaTFRVG1pdnZrbFdKWHczc0ZLeE1SNlA5RVNYQjNBbHA2?=
 =?utf-8?B?cnpIUElzbVlQSFNGNXpYUlBScWJFTVE4Z1FNa2Y3UGhSZjZmTWM2ZlFaeVQy?=
 =?utf-8?B?Mjh6T2w2cFBrOWFhdHBKdGwzcCt6YTQydmliTkRtTUh2d2lWWnFMQTBjYXJI?=
 =?utf-8?B?R084c1VGUGVQZVVDMXkxR04yS2hMczVCMm1NSndYcnlsdkVCVWdPOE9va3Rz?=
 =?utf-8?B?eVBIb21DcVE0L051b3NocC9FTkpjNkU2L1NiMkZyU0QxR1ZxUm1Ka3JUQWo4?=
 =?utf-8?B?dHF1K0d0UzhabFZ1cnVCWkFGYmJzVE1GRk8rcGtQNTFuTmxzWXVqUXVkT0hr?=
 =?utf-8?B?WXIydzl1UDJ1dlFqSUxPa0lnVDlLa1RjS1ByZVZIREYzU1drb21tVENUKzJ6?=
 =?utf-8?B?VzRmK1RCWjcyUm9vVGVqa2JkZVlpa3FQODlYbG5tMklMUGVQdmt3eFBXOVBu?=
 =?utf-8?B?MUwvMS9CNnN2VGZCUjBwdDVwR3VQWS9kdHBqZW00ZENLUDM1WnlnWGtDanpw?=
 =?utf-8?B?QXBmclJNWE1xSzEyT2F6NUkvNEQrc1NQeEJFK0NnL2p4SWNRNG1OSmNxeHRS?=
 =?utf-8?B?a0dtRW9KVnZVbDRwOHBqUENYQ3A3ZW1nUzhlcUFZYjFiQm9Tdlh3dUQzSHd6?=
 =?utf-8?B?b2lkcHlENEZkTFA5N0hseityOUNtVUZQb2JMVjNrUmt0SkJwam92WDE1SHBO?=
 =?utf-8?B?MnZYdUhFWEpVZExmWVNxWXdXSkwzS2hKYVZRd2h3MTRwdXl4aWViSGVVZjZ6?=
 =?utf-8?B?bnVUcVBtUUpmV0Nlb0VZbTkzakdXZ3d0WTZ2bGNFNUFEbEIxejI3SWYyUEor?=
 =?utf-8?B?SENldnZ3bDgwQThDdXpZY3pSeTB6d0FpOUdrdnpYVzFDVGpSUlI2emNoVXhX?=
 =?utf-8?B?aG5oUlp4U2RwMTJVQ2pldU5DWnBRcjYwVFdYVHBremJMSjhpdnN4QmU2NTVF?=
 =?utf-8?B?UHZCSDdxQ2ltWVdKdFd1WndZanRjbEN4MkQzK0phUnJNa1pPaHk2Tzl0NEkv?=
 =?utf-8?B?K1VFQUFSNDBPcEw5c0k0bFlrU3JuVFhPdU1ZSmhDQVRFUWovSVUrbmJnM2lo?=
 =?utf-8?B?VWNCNSszSGxSRXNod05WcHF3ZThnUmlRamtVdFlrY1pacTZEWS9INDhYVWJY?=
 =?utf-8?B?eGpWNGdUaGFKZUJ2OHpnaUtWWDBxbGVkcHUyd1pIM01kK3lPSlk3VTB1NmRa?=
 =?utf-8?B?clF4UmVoRXZYLzZGbndTeUdCZWFMNGRHaDFKR2N0NVFSaDlyWGNtRkZVN0dU?=
 =?utf-8?B?Q3FOSjVkSXBlMk43eVFQbGk5Q2JPT055T3hoUDVsWDNlREc1ajc4V0tYZFl2?=
 =?utf-8?B?T2hnU3I0ZktPVUo5Ky9rQ1dLZ053bDROUERKVklKY3EyMmtVbUNhZUFXZ0p6?=
 =?utf-8?B?ZDIyNWFjWFlMak5zb3VKQTV0cXE4bUN0emZaaEZ5UDA2QmhNL0NyNVVQczNY?=
 =?utf-8?B?SHJFUVlZUlluMllITEhNdz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MjhUb3JHYm5PMlZHRks1bDB5SGdSMXJ5RjViSXZGU2QyVGpYZS9xellEOUJt?=
 =?utf-8?B?cEtlVjM3cm9ETFFYSWhzcGxHalU5TzFscmd2eGovRWpKZDlMQXlZd3NVakdr?=
 =?utf-8?B?cW5nRFV5cmoyekM2bDR2T1NTQlF0UW5wNU44d1ZCU1pSdG5mOEt4bDZwOHUw?=
 =?utf-8?B?Vk9WS3owYk9OV29pV3JGRldXSUtuNzhLLzdZR05xaXM2V0Y5TVhDNzlWR3NX?=
 =?utf-8?B?eHpWbWpkaFNkTlRqT2d4VzhnT3kyWHAzZWFzYXowUFBGK3V3ak51bWhnaWcy?=
 =?utf-8?B?YWZrVS9VSlJHRzYyZFZiWkJnV3hsczUwamJHRjZSVmJxM2FmRFpFY2w0c25u?=
 =?utf-8?B?dVNQR3ZLY2ZXLzlGMzdjT1pQT0psYlpwQzUwMUFncjNvcHR0ZElqMW1NbFNu?=
 =?utf-8?B?OTlmaWxHc2xqTFZDd1d0TENZbzlIRXpHVWViUUo2aFFndUk2bE9ZZmZ4cUQ2?=
 =?utf-8?B?WkFzcEdXK0NwVWt6MExjQWo1V1JCQ1ZNQ0JCNVQraEhJM2Q0dy90VnJXZnVI?=
 =?utf-8?B?SzJNUCtZTG5ZVHN4VVQ3TEwyV2V3MVkvVi9PQUJYYmtlUDR6cnYzdklDM3h4?=
 =?utf-8?B?eWxkdkozcnRFcUVLMjFXSi9WVi9JMFlEb0pmVkFSTjdCdzlIRzNPVnZMcXla?=
 =?utf-8?B?UEEza2ltOHdic2JrM0VTdlNYZENCSzZmc1lzQUZkV3RDTDdaZ3N1SUoxNUl2?=
 =?utf-8?B?SURlYWJXbkQ4dDdCclFNQ3I0WmYvQXQzajhDZWFoSmRjUTY3dGE0WWtncGJ1?=
 =?utf-8?B?MklWNWdPQVBrZlJSQjJzeCsvMDEwVm9FVUs3OUcwRDNqMzlFaDRjUVR2NWNn?=
 =?utf-8?B?RGxaSitROU1ucGR3VjVGVjJRSFFaczhPaXdaQXcrcTZrUjkyQjhRSk43bSt0?=
 =?utf-8?B?WDBJamVKTU1lUUFRQVFSQ2E0TmJ3U1VNRUhpRmJ1RHpqelExZ0VGZ2ZKRTJS?=
 =?utf-8?B?UlJ6Z1lESHVEdG5aNmIxdTdaeU5mWHBLTytodi9GSTNiaXV6a0RDU1lIZGMr?=
 =?utf-8?B?RXVjOEdHMFdmZytrdmNlWWxkbVNjV2xHbUxCQzRXeG5HekhJcWlkREl4RGZ3?=
 =?utf-8?B?TGpOV2xQZkJHZFVDRm9yMGxzSEgrdnJILzhKSXRJa2VJWlBTc2RoOGlZa0Fa?=
 =?utf-8?B?ODNUMEZjZlM1bFZmS25lbkZwVTZQYzJZdzM2K1NYejJjV0JVa3JCdnJxNlhS?=
 =?utf-8?B?VkRrcktHNHNVNFFDTWVPNWIyelZLRSswK2NUQTI5UVgxaFVQanBWRTUzdlJF?=
 =?utf-8?B?N05EMDFNZ3htQ3IyUTZZanViRExiQ01WUllEUjloMW5yblhocDc2bTE4Y21v?=
 =?utf-8?B?YVhQRFc4amEzNm93b3hhMFFRbzFRek16TzNqQ3VjckZHQ1doMFlDQjBwaTlX?=
 =?utf-8?B?Zk5obWNmZkgxT0VVRDNYSHBWbGVqNUI2T09OQmE2dW9RZU9HRkdrb1lKMWJL?=
 =?utf-8?B?WnIrKy9waTQzRGdjSkVGcitIUEc5L083bWZBaGxLQ3ZOQVZSZldEdFRsN0RV?=
 =?utf-8?B?YllGRnlDc25NcG5SZzRkeWJ3enZEelNVdGhVRlZ1QjlIOG9mcGJRc1BOdmhl?=
 =?utf-8?B?UDAxUDg2VjBvSk4wekp1WFJWMFBnZ2hHSHVlTWJEYmZya3lzMjZKUnhhVFd1?=
 =?utf-8?B?Kzl1S21mbDFtUzFkbWZYcTRDWDFGVlhGZDJVanJpNlJzM2RRNmhvQjl4SEMy?=
 =?utf-8?B?eUFHYlhVSjVzb2FKN3JFTUM1UHE1MmRqV1VGOGFpTzlIdjIwcWdHSzFjd1B4?=
 =?utf-8?B?dk5Jd2xKci9MeGR3a2RBL1ZHbUhmSkI0VUtBa2JZdzNWQkhrS2tDL2J3cFgv?=
 =?utf-8?B?MXVVNkwvdkRuTEFyeDV4SEJiU1BjTGwyRnVtN2dwVWEyRjlFVzZBd0xjeUJy?=
 =?utf-8?B?MHVGUURTQjhxeEZIUUZEc0Fza01DMHdsN0tjSHZjSHZjZUIyZ3lVSGM1cEpt?=
 =?utf-8?B?S294QUpyYS9sS2Q3ZUJDVDdmbVZwYW9OaDMxMHBqMVVwOUJuVFBsYnY2ZFF4?=
 =?utf-8?B?Sm4zWll3TWprSGR1alRpNXkrSytqellsS0hzajVyR1JyOFo1UGRUNlFsRUdn?=
 =?utf-8?B?MEl3SDQxVUR6SEoxODJYVTIyMnlOQ3BLWDZBS3JBUzdieFlGZTF5ZGs3bnhF?=
 =?utf-8?Q?iNjg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6276e4c-734f-42c4-c6cb-08dc6addad58
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 May 2024 19:25:50.7993 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ysms/obGVs8u3dMpAc4a45qRgUl56QyBgU/DaiyyqAWl5PhERQcA3fZqyKEQgkSrVCV2aUePel6jRmZSnEHyoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6226
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

SGkgSmFzb24sDQoNCkkgdHJpZWQgdG8gdW5kZXJzdGFuZCBob3cgeW91IHN1cHBvc2VkIHVzIHRv
IHVzZSBobW0gcmFuZ2UgZmF1bHQuLi4gaXQgc2VlbXMgeW91IHdhbnQgdXMgdG8gY2FsbCBobW0g
cmFuZ2UgZmF1bHQgdHdvIHRpbWVzIG9uIGVhY2ggZ3B1IHBhZ2UgZmF1bHQ6DQoNCjEuDQpDYWxs
IEhtbV9yYW5nZV9mYXVsdCBmaXJzdCB0aW1lLCBwZm4gb2YgdGhlIGZhdWx0IGFkZHJlc3MgaXMg
c2V0IHdpdGggSE1NX1BGTl9SRVFfRkFVTFQNCk90aGVyIHBmbnMgaW4gdGhlIFBSRUZBVUxUX1NJ
WkUgcmFuZ2Ugd2lsbCBiZSBzZXQgYXMgMA0KSG1tX3JhbmdlIGZhdWx0IHJldHVybnM6DQoJUGZu
IHdpdGggMCBmbGFnIG9yIEhNTV9QRk5fVkFMSUQgZmxhZywgbWVhbnMgYSB2YWxpZCBwZm4NCglQ
Zm4gd2l0aCBITU1fUEZOX0VSUk9SIGZsYWcsIG1lYW5zIGludmFsaWQgcGZuDQoNCjIuCQ0KVGhl
biBjYWxsIGhtbV9yYW5nZV9mYXVsdCBhIHNlY29uZCB0aW1lDQpTZXR0aW5nIHRoZSBobW1fcmFu
Z2Ugc3RhcnQvZW5kIG9ubHkgdG8gY292ZXIgdmFsaWQgcGZucw0KV2l0aCBhbGwgdmFsaWQgcGZu
cywgc2V0IHRoZSBSRVFfRkFVTFQgZmxhZw0KDQoNCkJhc2ljYWxseSB1c2UgaG1tX3JhbmdlX2Zh
dWx0IHRvIGZpZ3VyZSBvdXQgdGhlIHZhbGlkIGFkZHJlc3MgcmFuZ2UgaW4gdGhlIGZpcnN0IHJv
dW5kOyB0aGVuIHJlYWxseSBmYXVsdCAoZS5nLiwgdHJpZ2dlciBjcHUgZmF1bHQgdG8gYWxsb2Nh
dGUgc3lzdGVtIHBhZ2VzKSBpbiB0aGUgc2Vjb25kIGNhbGwgdGhlIGhtbSByYW5nZSBmYXVsdC4N
Cg0KRG8gSSB1bmRlcnN0YW5kIGl0IGNvcnJlY3RseT8NCg0KVGhpcyBpcyBzdHJhbmdlIHRvIG1l
LiBXZSBzaG91bGQgYWxyZWFkeSBrbm93IHRoZSB2YWxpZCBhZGRyZXNzIHJhbmdlIGJlZm9yZSB3
ZSBjYWxsIGhtbSByYW5nZSBmYXVsdCwgYmVjYXVzZSB0aGUgbWlncmF0aW9uIGNvZGVzIG5lZWQg
dG8gbG9vayB1cCBjcHUgdm1hIGFueXdheS4gd2hhdCBpcyB0aGUgcG9pbnQgb2YgdGhlIGZpcnN0
IGhtbV9yYW5nZSBmYXVsdD8NCg0KT2FrDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0N
Cj4gRnJvbTogVGhvbWFzIEhlbGxzdHLDtm0gPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwu
Y29tPg0KPiBTZW50OiBUaHVyc2RheSwgTWF5IDIsIDIwMjQgMTE6MDIgQU0NCj4gVG86IEphc29u
IEd1bnRob3JwZSA8amdnQG52aWRpYS5jb20+DQo+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxA
ZmZ3bGwuY2g+OyBaZW5nLCBPYWsgPG9hay56ZW5nQGludGVsLmNvbT47IGRyaS0NCj4gZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBpbnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IEJy
b3N0LA0KPiBNYXR0aGV3IDxtYXR0aGV3LmJyb3N0QGludGVsLmNvbT47IFdlbHR5LCBCcmlhbg0K
PiA8YnJpYW4ud2VsdHlAaW50ZWwuY29tPjsgR2hpbWlyYXksIEhpbWFsIFByYXNhZA0KPiA8aGlt
YWwucHJhc2FkLmdoaW1pcmF5QGludGVsLmNvbT47IEJvbW11LCBLcmlzaG5haWFoDQo+IDxrcmlz
aG5haWFoLmJvbW11QGludGVsLmNvbT47IFZpc2h3YW5hdGhhcHVyYSwgTmlyYW5qYW5hDQo+IDxu
aXJhbmphbmEudmlzaHdhbmF0aGFwdXJhQGludGVsLmNvbT47IExlb24gUm9tYW5vdnNreQ0KPiA8
bGVvbkBrZXJuZWwub3JnPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDA2LzIzXSBkcm0veGUvc3Zt
OiBJbnRyb2R1Y2UgYSBoZWxwZXIgdG8gYnVpbGQgc2cgdGFibGUNCj4gZnJvbSBobW0gcmFuZ2UN
Cj4gDQo+IE9uIFRodSwgMjAyNC0wNS0wMiBhdCAwOTo0NiAtMDMwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOg0KPiA+IE9uIFRodSwgTWF5IDAyLCAyMDI0IGF0IDExOjExOjA0QU0gKzAyMDAsIFRo
b21hcyBIZWxsc3Ryw7ZtIHdyb3RlOg0KPiA+DQo+ID4gPiBJdCdzIHRydWUgdGhlIGNwdSB2bWEg
bG9va3VwIGlzIGEgcmVtbmFudCBmcm9tIGFtZGtmZC4gVGhlIGlkZWENCj4gPiA+IGhlcmUgaXMN
Cj4gPiA+IHRvIHJlcGxhY2UgdGhhdCB3aXRoIGZpeGVkIHByZWZhdWx0aW5nIHJhbmdlcyBvZiB0
dW5hYmxlIHNpemUuIFNvDQo+ID4gPiBmYXIsDQo+ID4gPiBhcyB5b3UgbWVudGlvbiwgdGhlIHBy
ZWZhdWx0aW5nIHJhbmdlIGhhcyBiZWVuIGRldGVybWluZWQgYnkgdGhlDQo+ID4gPiBDUFUNCj4g
PiA+IHZtYSBzaXplLiBHaXZlbiBwcmV2aW91cyBmZWVkYmFjaywgdGhpcyBpcyBnb2luZyB0byBj
aGFuZ2UuDQo+ID4NCj4gPiBQZXJoYXBzIGxpbWl0aW5nIHByZWZhdWx0IHRvIGEgVk1BIGJhcnJp
ZXIgaXMgYSByZWFzb25hYmxlIHRoaW5nIHRvDQo+ID4gZG8sIGJ1dCB0aGUgaW1wbGVtZW50YXRp
b24gc2hvdWxkIGJlIHB1c2hlZCBpbnRvIGhtbV9yYW5nZV9mYXVsdCBhbmQNCj4gPiBub3Qgb3Bl
biBjb2RlZCBpbiB0aGUgZHJpdmVyLg0KPiA+DQo+ID4gPiBTdGlsbCB0aGUgcHJlZmF1bHRpbmcg
cmFuZ2UgbmVlZHMgdG8gYmUgcmVzdHJpY3RlZCB0byBhdm9pZCAtRUZBVUxUDQo+ID4gPiBmYWls
dXJlcyBpbiBobW1fcmFuZ2VfZmF1bHQoKS4gVGhhdCBjYW4gb2ZjIGJlIGRvbmUgYnkgY2FsbGlu
ZyBpdA0KPiA+ID4gd2l0aG91dCBITU1fUEZOX1JFUV9GQVVMVCBmb3IgdGhlIHJhbmdlIGFuZCBp
bnRlcnByZXQgdGhlIHJldHVybmVkDQo+ID4gPiBwbmZzLg0KPiA+DQo+ID4gWWVzLCB0aGlzIGlz
IGV4YWN0bHkgd2hhdCB0aGF0IGZlYXR1cmUgaXMgZm9yLCB5b3UgbWFyayB5b3VyIHByZWZldGNo
DQo+ID4gZGlmZmVyZW50bHkgZnJvbSB0aGUgZmF1bHQgY3JpdGljYWwgcGFnZShzKS4NCj4gPg0K
PiA+ID4gVGhlcmUgaXMgYSBwZXJmb3JtYW5jZSBjb25jZXJuIG9mIHRoaXMgYXBwcm9hY2ggYXMg
Y29tcGFyZWQgdG8NCj4gPiA+IHBlZWtpbmcgYXQgdGhlIENQVSB2bWFzIGRpcmVjdGx5LCBzaW5j
ZSBobW1fcmFuZ2VfZmF1bHQoKSB3b3VsZA0KPiA+ID4gbmVlZCB0bw0KPiA+ID4gYmUgY2FsbGVk
IHR3aWNlLiBBbnkgZ3VpZGVsaW5lcyBpZGVhcyBoZXJlPw0KPiA+DQo+ID4gSWYgdGhlcmUgaXMg
c29tZXRoaW5nIHdyb25nIHdpdGggaG1tX3JhbmdlX2ZhdWx0KCkgdGhlbiBwbGVhc2UgZml4DQo+
ID4gaXQuIEknbSBub3Qgc3VyZSB3aHkgeW91J2QgY2FsbCBpdCB0d2ljZSwgdGhlIEhNTV9QRk5f
UkVRX0ZBVUxUIGlzDQo+ID4gcGVyDQo+ID4gUEZOPw0KPiANCj4gQWgsIHllcyB5b3UncmUgcmln
aHQuIEkgc29tZWhvdyB0aG91Z2h0IGl0IHdhcyBwZXIgcmFuZ2UuIE1ha2VzIHNlbnNlDQo+IG5v
dy4NCj4gDQo+IFRoYW5rcywNCj4gVGhvbWFzDQo+IA0KPiANCj4gDQo+ID4NCj4gPiBKYXNvbg0K
DQo=
