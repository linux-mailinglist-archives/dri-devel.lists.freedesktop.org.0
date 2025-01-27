Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E96A1DD27
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2025 21:07:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEE6810E5B5;
	Mon, 27 Jan 2025 20:07:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZdC6RmCu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BDAF10E5B2;
 Mon, 27 Jan 2025 20:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738008424; x=1769544424;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=pEf0s3LYoDeEHKQSjOe/aV4b5Cg1N9bx5BIxnDOpxxQ=;
 b=ZdC6RmCu1kKt5V1UEyP/McvPz1EDmisV9u1No92x0jAB/flPT0ZQ2vm4
 n+iT6eD0FtnJrs0NpCTuSuRL8ZxeHGhePGsPoaOE42z1NFsgs3dWk0a8M
 ka8gxBANcogMf6wrHogQbM4zP0qREawMw0NbikBnr+VNOg0tTdYIbnJMJ
 p+uOW/yyMioLvnra6l7hWZ3QO1A/VxmKexwPT3A81PykwLQUbbl3Uua7H
 tQzCcPcA56CMcvpBasnOwtTk1n74sjBrIwcBtvTkIeILzHUBSZbpe4gUQ
 jMo1fHQNYu7AQlW/Ro8/8rN3zkpG0HGiRLjrXfLLU7x+90fRT8dEWEBJW A==;
X-CSE-ConnectionGUID: YmU+A62KTKCWsatAkNOPAA==
X-CSE-MsgGUID: t/VDlPHkQYqjAzPhBgaKtw==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="42240349"
X-IronPort-AV: E=Sophos;i="6.13,239,1732608000"; d="scan'208";a="42240349"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2025 12:07:03 -0800
X-CSE-ConnectionGUID: 6JM2uz5DSOKJeOYj0/PzIg==
X-CSE-MsgGUID: ACbrXME2RI2fqTmxa2+CIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,239,1732608000"; d="scan'208";a="108507786"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Jan 2025 12:07:04 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 27 Jan 2025 12:07:03 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 27 Jan 2025 12:07:03 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.46) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 27 Jan 2025 12:07:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YvyJ0dUU6IeFyUT7APU99ed908Wr2FJHwGPUanrwlhT55wB7XHfCTE1sCby4SSDl/c4lW+RN9lFz6fDgHngXcPec3BThh+1Sle248hhQmAw8FqBby2+/gcS6DyyDnJjwPzilqegWcpKsyXqZJvs7+CmnOPepnHZ15f2TSLY514dCzkO02jOQctQFP4gWR6IlH/JBWYRcHZcTF4XAX5UMsLCVpGRGsfvwsMwTlMX3sl6fMi0rxoTPFuh1U0Bu3ot/YcgCmqzRmB2GEeTqXGA7dTwqsJ5KBFvlpw7TIcljzHPGHZwObgYLKavRdM2cSDacSJjsMhdQfMYjCCXJkUY6Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F0E+iVuqIShUPjhv02W91UK6tdy+ZxYhEDNApZ6gd1s=;
 b=O7hS+wxMecTdxyIa1rEFep5n/ek8eL6O11uXaG6+KFK/rh7PRaGBo0itCz/z7RqK+Eb7svBD0/EWafXpA8QIPoCndlSZgHmUYuguLhXTc+kxcizEq4sZyUndAVl4B8IjGFBw2LPHFjJie8V24RBPVtxriegMLqBphADowazEFqyczmfxH9Kw3WUIGhesxZRCzmB31aYTA4y7meOnYEG5w4KC3NEU5VPGWk8hZbtz7umxHE5nId83avAwv1UJUOwywrHevk0veEDwxmKouCPU5Cl6eVGpvLJAc5agC12AJOqhkvwUFxScaExQYwt1qw3haJ2edD5hSF2PElXFfezYOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11)
 by IA1PR11MB6196.namprd11.prod.outlook.com (2603:10b6:208:3e8::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Mon, 27 Jan
 2025 20:07:01 +0000
Received: from SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72]) by SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72%5]) with mapi id 15.20.8377.021; Mon, 27 Jan 2025
 20:07:01 +0000
Date: Mon, 27 Jan 2025 15:06:56 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Giedrius =?utf-8?Q?Statkevi=C4=8Dius?= <giedriuswork@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, Dave Airlie <airlied@gmail.com>,
 <dri-devel@lists.freedesktop.org>
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>, <linux-kernel@vger.kernel.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2] drm/i915/lspcon: do not hardcode settle timeout
Message-ID: <Z5fnYG3u4hBz62OE@intel.com>
References: <20241017075725.207384-1-giedriuswork@gmail.com>
 <CALt+6nqxMZjuZuOKaj8Cx4dcNZx0n-0F9aa97d-vZoMWeN=bOw@mail.gmail.com>
 <Zyk8dFthM0EA2A_K@intel.com>
 <CALt+6noH3qSJNFYeVmhhGahcFiUsti5Rbt8+ef8QKOi37neaEQ@mail.gmail.com>
 <Z5MF9_SAZZJjedXb@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z5MF9_SAZZJjedXb@intel.com>
X-ClientProxiedBy: MW4PR03CA0191.namprd03.prod.outlook.com
 (2603:10b6:303:b8::16) To SN7PR11MB8282.namprd11.prod.outlook.com
 (2603:10b6:806:269::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8282:EE_|IA1PR11MB6196:EE_
X-MS-Office365-Filtering-Correlation-Id: ef369175-598e-4343-a5d6-08dd3f0e291b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M1VxdEQ3OFpaSE94eW5lUzJVVXZCc0NFaytiMk1oeG03N21GOEZTVnlEMTRT?=
 =?utf-8?B?eVl4OHdNTVhOdWJsSzNvNmQyK1hCS3B6QnVGaVBHTlB5aC9xRjR5NWVKR0o4?=
 =?utf-8?B?dHdYaWZMRWVacUtsVGJEY0NuSm5sZ1ZadVRYd2Fkd0d6alpJWVBrcW5XWjAv?=
 =?utf-8?B?ZnhQRzZ4cGtoSEErWmhaYWQzTlFpeE5OMHFyeGtFY3E2RVRNNVFVNUNiV29u?=
 =?utf-8?B?M254cUI1MkdYUVhqYUhKMVNhamswUEdkTjV1MmVWaGdSWmdpUWdOdjNuZVcy?=
 =?utf-8?B?U25YNmMzSUY5M0tWSEhmditkQk5PbGRVOVRaNVh6ZGp1aU1iTGFoOGtQZDcz?=
 =?utf-8?B?YWJJWkNIdVNieitNOHAvTzFveHhkVkdVSkVMUlNETzNFR3FSR1NQM0lmRXJl?=
 =?utf-8?B?b1ZUYnE4UVlUNWN1VmxSbWpzSlU0TW4yOU5oUEt2Q1BlL0JtMjFqY3pvY2NJ?=
 =?utf-8?B?UTNUaVhGWUhGYWdZeGdaQ1VaS09GWGRvSllVVDQ1NXVVR1paN3gzTlk5RFNl?=
 =?utf-8?B?SEZCKzlJdVZ1alZmT2ZvNTFWaThaWG1CSG10d2tTUzBqL1VaT0VCTG5mK29S?=
 =?utf-8?B?YmdXaDJ5WkcyVlFiN2oyTW1WbWZJS0NVRkkzUWZDZHR1czVUdDRwUXB6R0c1?=
 =?utf-8?B?NGx0SU1SUS9BcUcvOVEzMEJYRG9JYzJ0OHJleS82QS8reXp3N2lmQTNVNk9W?=
 =?utf-8?B?WGdOT2JYaGJzbkNhdm5BbUxFSXRneDRmMUY3bVNaSWI5bEVOVnBTMFJQdE81?=
 =?utf-8?B?QTN1MDJKRkJrbjErNVVRMGxvMGJBUEdwWlNHbitoN3ZHZHpKMXREVElzT1RP?=
 =?utf-8?B?SGlXMHZHbUUxVWdrT21OSGxUM09YRU1CdCsvZjBQNjJIMDJCbDRObHdub1Yz?=
 =?utf-8?B?bkMzcWZtTDZ5a3BYa2FGRkhqdmEreVZPeW9MRE5neHJUWnpHd2d4aEM1K0gw?=
 =?utf-8?B?Z2RzSVMrQzhkeDJmZkVFUDRJVkh3QUpaL2c0YTk1YjJ0QUx0NStrd3oxOVJF?=
 =?utf-8?B?dkRuWDZFMXdoYm9yV01RZWpMNmlXTFdYakdoQ0hmcEthdzJ6YVp4bFpSVThj?=
 =?utf-8?B?QlN3c09OL3Z2aTRYa2JJQS80TXRYVkdLdVdJR0hBV1ZhTzgzbUYrRWgxU3E3?=
 =?utf-8?B?WE9jTEg5MXB4YkZBVnhCUm1iV1A1Nk5tQTZEUmNWZCtrdENlZzVtc3hSVmEz?=
 =?utf-8?B?YnVMdmVtbEt0aEhaYWdFb0ZWdTJFK1hUN2N0L082QUk0ekliY3M0UUpLZ0tt?=
 =?utf-8?B?bnhtdVM0bjBVbmZWNWNjVWdWb2dSUmkzTG9jTk9yenNFQnN2cFFva3I4dWFj?=
 =?utf-8?B?MGxKdFlTWUVuNXI5K255d0F4L3JYYjU1ZDM5RFBVRWkrYUsyL2RibS95OGVE?=
 =?utf-8?B?K2UrbEdML01MMEhWWDVIYnFaUG04VThZN0xmVmIvdXJoWCt5RWNUTHVubi84?=
 =?utf-8?B?SklycFM4MEViUS9NVEFxbXdGYzFRU0FvNmtEQ1grY3QyR25GQi9nR0hnVHhY?=
 =?utf-8?B?TnVQTFJ5R0RGYkY1YU9GTmExMC9OVlM3bzFyRGswK3g1VE5JalpxODZEUkZK?=
 =?utf-8?B?ZnZCZVZkd3pRUFM4YUNOKy84Y1RVdmplMjB2cE1LZHd4Z3Fhdy9WeTM0KzB3?=
 =?utf-8?B?aFAxYVBEVzZoSXlFOWpLUjBaU0NnT3JUQkpiMVpCeTJtRjF2dnpoWTlwSVhU?=
 =?utf-8?B?TjJWem9GYXppTlh2c2dzcHZZMmpKVW1Fa0ZQMUFteDZ2d2kyWUpDaGZQd2xy?=
 =?utf-8?B?cEJHYVBaN3NXTGZDVEM1WlgxcEkvT05ocGFhMDZhbUUxSEVKaVFnV0FmTVl0?=
 =?utf-8?B?dW1XQkVxQVlSU2JVVms3MlA3M0p3MC81bDFOb1RxNURBM2Q4N1FWcWN1M3d5?=
 =?utf-8?Q?xLCr5Rrp0XUSV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8282.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QWtmQ0llT1BWcGU2ZlVKdWxFMm9ndkEySDZ0UW1KNjVKdGJEaHk0azFhOXBW?=
 =?utf-8?B?dEVnZTVRSndLa0FhaXRZa3N5RVlYbnNHZk5uMlFsNWxvaEJVSDI3QitaaDB2?=
 =?utf-8?B?TmZkUVdVM2xxSG5mMnBROVZSNlVvZnVlVCt3MHJHNTlEOVMvaDRnNkRwclRI?=
 =?utf-8?B?ZW1JZzAwWXNHYmZkOFVOZXRaRFEwZEcxZFpPQlVDK2tBRjNDME5EenBLSSt1?=
 =?utf-8?B?eHl5MmZDNWN5d1B5a01oamF2Vm5HWC8xdUlZelllUkd3YmRkN1M0eG40VFdG?=
 =?utf-8?B?MFpzS09QWjBGZGQ1QXhzNVk4VTZjZnFHOGZmQjBySlJKTDF2dmRUM1ZuaWdM?=
 =?utf-8?B?T3VKNHcrRmJVenN2VVJHVzgxYXQxQjh2MnkxSVJDU1kyWWQ2eHcvK1ZQdzFG?=
 =?utf-8?B?cDlhbUxCbElzN1I3STM5Rnc2bXhXNFpnVmNIT0ljRWh1Z09SSmlJbXVrdmRB?=
 =?utf-8?B?RG04WUhWaUUwdFNBMmRNc0FndzVXTlhRcVhPcHlpQVdiNXBJUmdpRk9hMzYz?=
 =?utf-8?B?T091OTQwWHhrd091cVY1cElaR1B6MzZYR01rQ0pZOHN5NGFXVzlyRlRlU1ky?=
 =?utf-8?B?ZFJFQ3h0UUprMmoyS25JTkRCQjhSTmV5QXRaWnRUU3Z1eDQ3NHdGVHJWN2dR?=
 =?utf-8?B?dVJxMXVGcWVFai9Tc3ZLdG9QcCsvZ1cyNkdiN1BSamNEMjZCdnc1My9WYnAz?=
 =?utf-8?B?TkMyMTFmZ0ZzenRqTVBPMTF1eWM1S0lKVXp4Y2JaVWdvejllY0JBalpVZjZJ?=
 =?utf-8?B?UXo3WHA2bzJwaTltV0htaStxZVYxOC9ZNEVIT2cyaXNyZVFjaWE0RE9VMTNP?=
 =?utf-8?B?cExCNE42TjlNY3J3Vng3OVl2WW1WQ0JtZkkzSkwwWTJtQStnSXBkTERmWHNy?=
 =?utf-8?B?djlFQ2QxY3dFOFlkOUVJUm1QUXNZa1lPYllMK28xY2kxdk8vSkJDY1laeElS?=
 =?utf-8?B?YTkyeVRyQVo0bHJnTFd3ZEVxY2o2Mk9HT21OeDZ5UTRjZUtJS2ZINDdtVm5t?=
 =?utf-8?B?bmZLbU9zeUE5MmdGTGZZUnc5d3JsaHJURjc2b3lwRmN3QmRJNnBxZEtWSGRM?=
 =?utf-8?B?eE5pUHJPRnI3RXh0SHBWbUQ5MmNaU1d6SGNIbU1KUVJMTG1DaGxaUjNGakFu?=
 =?utf-8?B?QUVzdld3Yk1RWXRZanluQ2E4WVMvczIwZTVUMFhvMDM0MDdxeTRlUGFSOFBq?=
 =?utf-8?B?TDcvL296QmhDZkpUUFF2a0VNbjd5ZklxZ21xZkI2RkRhVmVpUHEzSkVWTFBL?=
 =?utf-8?B?Yi9Db0Uzc0gyeUc1a3F5WVpHT3hpSFVqZ3MzRGpDblNzNytOQ0g2TGVrQmlL?=
 =?utf-8?B?T1JnUDEveGlIMzlJUzhyaUEwSFE4WTE5NTIvTi9uWWp4QkxGSHBuMVM0V1Qr?=
 =?utf-8?B?Ri9JSEV6b0tabTNHR3JsREJEdDlqdXE4K2JaUng2clVsL1JUMnB2OHF0VGRv?=
 =?utf-8?B?bVBWSmdkZE5OalpOdHhraUs5emVlUW90cURYWE5USmRJaXZtQlR2MWcvWW52?=
 =?utf-8?B?dzFPb2lQZnA1WnRJcVlSOVE5aE42Y1A4YWlkcVNZNlVldnAzMHpwVWQvTkdv?=
 =?utf-8?B?S0IzSVlvQy9TTC9ucHF5Y1d4OGt3UjREZEJDY0RGdnlOWUcvR0hDTWhnWngv?=
 =?utf-8?B?Zlc2Skd3SkEyY2lybk8rME1mMlRhYW5FNllZY1ZaZ3hja2JlZ00wRE11aGd4?=
 =?utf-8?B?QnZVb2MvaHpxd0hSWTRVRHQ1R0xwNmY5ZGtudVR2bFExQ0I3NVhNejJvQUxZ?=
 =?utf-8?B?dFNNKzUySE5qNWE2SmY3dFFFb0k2QXlqKy9zUTRNc3hxU1JxVXlVN1pTMjdi?=
 =?utf-8?B?N0xzSk5waU5Ud0djaXdZTXpIWkRQb0VjVkhkQm9QT3BSVGhVck50NnZacmg1?=
 =?utf-8?B?Mng5TVByRVdkWXpoSFFSWEVqSm1JeUFSYzRjb1k5aWxoRkVFOHRLMG8ybjRG?=
 =?utf-8?B?VCt4ekwvc1ZmZWJoM2M4TUJvNW9IbS9PRXNNczMyM0k1Vks0VjMrZlJmR0Nx?=
 =?utf-8?B?cDFmbitHNFAyR3JVRVcxL0ZrcW5iR1pzVERpb2pJdlVnSlBNQmJQdmw3SFlq?=
 =?utf-8?B?ZXBYL2pJcXJSdlNaOWZ5RGc2aVlveEMvV1QwdTZvNmxlU0YyeWF4VU9pV1FE?=
 =?utf-8?B?bUM3QjlyQUhLSURzM2tEVEx6TDYxT1FqZS95QXNUZG1kcTEwZ1Y3cTNRaktt?=
 =?utf-8?B?NXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ef369175-598e-4343-a5d6-08dd3f0e291b
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2025 20:07:01.1365 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y6Cx6CcmM9RyoEisGzq2hZFtpLOe1Lc0Pvb98LPYAXLXwtTGjOUgmmp2TsNdUMKJlVYZV+JLvuSDjZRh3OWLMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6196
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

On Thu, Jan 23, 2025 at 10:16:07PM -0500, Rodrigo Vivi wrote:
> On Wed, Jan 22, 2025 at 01:15:31PM +0200, Giedrius Statkevičius wrote:
> > Hello,
> > 
> > On Mon, 4 Nov 2024 at 23:28, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
> > >
> > > On Mon, Nov 04, 2024 at 02:09:46PM +0200, Giedrius Statkevičius wrote:
> > > > Hello,
> > > >
> > > > Kind ping.
> > >
> > > There was a pipe underun in CI... I honestly don't believe this patch is
> > > causing it, but anyway I decided to trigger a retest there before I push this.
> > >
> > > Thanks for the patch and review.
> > 
> > 
> > Ping. Could we merge this patch? This plus another patch (that I have yet to
> > send) fixes replugging the HDMI cable on my laptop.
> 
> First of all I'm sorry for the delay here.
> 
> CI was the problem, not the patch.
> 
> I was going to merge this right now, but I noticed it touches include/drm
> 
> Sima, Dave, ack to get this through drm-intel-next?

pushed to drm-intel-next with irc ack from sima

> 
> > 
> > Best regards,
> > Giedrius
