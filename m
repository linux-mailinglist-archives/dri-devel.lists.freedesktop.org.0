Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB91C12B48
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 03:59:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0136010E581;
	Tue, 28 Oct 2025 02:59:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JUvIx8w5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EF3310E578;
 Tue, 28 Oct 2025 02:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761620375; x=1793156375;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=L+EqRhvTFZ8HnaSpW0y8bbHvkx/LcgMJ1mKdmc6b2Js=;
 b=JUvIx8w5kF4vOm7IHmjFHKmmaraM2TgFfpa3MLzLBkfrXJJfDCCN2ss6
 zeDvn8fGqYhAMoayihMY7Th+dT4Z8CO5pmS7xoIGw7TpydHPqwfEYvUC/
 UWYx0yyGOswTl5Dh7VaDgWpSzzT0wmqp0fnerIXD4JxFfdboNnFPZh0JF
 nG9z8+5+7k6Sl4jWtT8La8PIGpWP6TpHv89ejhSead8X7+dtdkVVQZoK9
 84NyJpkYaQGilHOnRXoba05R7P8wGsQx5MjZYC6iO0gPkkfp9LCa9WJ+T
 VOXOdlBvDmsv790VeXk54y+jy5cx+sHpwJJBRxgaI5l+WhMzK9xygSikn A==;
X-CSE-ConnectionGUID: FCNCFz2hRxucUS6oAvmulw==
X-CSE-MsgGUID: 7moovRibRqGlcJJ2+JGaxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="89181126"
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; d="scan'208";a="89181126"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 19:59:34 -0700
X-CSE-ConnectionGUID: RCwYN6K5QJCFm/K7GI/EPQ==
X-CSE-MsgGUID: ZdZqc8BSQ1qZsE/bihNjvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; d="scan'208";a="189276834"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 19:59:33 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 19:59:33 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 27 Oct 2025 19:59:33 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.22) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 19:59:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BrTHUy29f+foZkBDi2RWKAtnf/m6KX32FO5h1/K4q6nMQ2yAgP9M4JGzWXklKm5RxI+mg4Eab044EF8w5eCcxP9OAzqWEisVe+Lu2vgFQ6GytFo57xIQRaWKqybrm2Jq6zg4DO1XgfPqDHyz3OwlrihA2vfrxwjhivAl/RaFseiyl63NUEB2UQ0mSNMwjZcvD1LR4nb9Kse7skI1URMgUByqatjWol8wZDazyy9wXN/eLb0wxe/C8o30Qcp0+MYDS2kGxdhcvkBDW9AAPbbDPcFhTeOXzDAO9vJlvAoczPLbW9cogbmVGi1xQcYI7lAkqF98vYBlZiY8meC49fRZJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L+EqRhvTFZ8HnaSpW0y8bbHvkx/LcgMJ1mKdmc6b2Js=;
 b=tJuJmWLlFd/m1VUVLN8DCzRvHDHjQY1Nw46KfpkiXVzlVOilmymQaBL0/cLe8zdtj/aF22mdaSL/qx3HpjhPmu+wnq1e0bNcE9gPF15prfWdy4qrlPhmQxYgiAu54zUSs3oCIrK8sowTwWD1ncpOerCpRkwdTMQUISjscP6ohgPkXVIk65gsBd3JWJwgeA9L2fKyNtHZSC2py4kHTUeJywN4OC363a3mtUZN1iHXdScYBGWSjiqs3vY1/yJnn292gZqN6A4Rdpuwhs8ocby/Jr7/gJnhMS5Kb0B+moK1i4mxDvvx2Uo2d97j61/fI+8seqa7cGWXBnhF+APSiRcZDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by CO1PR11MB5044.namprd11.prod.outlook.com (2603:10b6:303:92::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Tue, 28 Oct
 2025 02:59:31 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%6]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 02:59:31 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, "xaver.hugl@kde.org" <xaver.hugl@kde.org>,
 "harry.wentland@amd.com" <harry.wentland@amd.com>, "Shankar, Uma"
 <uma.shankar@intel.com>, "louis.chauvet@bootlin.com"
 <louis.chauvet@bootlin.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v6 0/5] User readable error codes on atomic_ioctl failure
Thread-Topic: [PATCH v6 0/5] User readable error codes on atomic_ioctl failure
Thread-Index: AQHcOP+qpA0PYrMmJUa4SheZ96TKgbTW+4Qg
Date: Tue, 28 Oct 2025 02:59:31 +0000
Message-ID: <IA0PR11MB7307186B96670D760B67F173BAFDA@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20251009-atomic-v6-0-d209709cc3ba@intel.com>
In-Reply-To: <20251009-atomic-v6-0-d209709cc3ba@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|CO1PR11MB5044:EE_
x-ms-office365-filtering-correlation-id: 293477cb-459a-4f93-8ec9-08de15ce0431
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|921020|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?ZmVkNU00Y0llMXlSOTdocGtNMGlLaUdJelRkV1l6VFVvaU4yVWE1R0tPVGVY?=
 =?utf-8?B?SWNkS3RLQjI1bHQxTnRGWllLdnBxVERyZ2EyM1ZhNUZGcVZackxHMHlzRDNI?=
 =?utf-8?B?Rjg1NEdlVUN4Q2pVM1JYcXZwc2dLNVRaZHNFTGNxdEI1dm5UWmJRYUhjOHAy?=
 =?utf-8?B?aXlpM0tHeWhQd0RPUlBTTVV1NEgyMWZUaTRzUXM1dkV2SkV3RitQQXlyYlZJ?=
 =?utf-8?B?S045eHJvMHB2SnMxM3Rjd214TmdOU1k0UXJ2UmQreElldE92Zjc3aHJ4NVNk?=
 =?utf-8?B?UEk2WVA2WEUrWUdhcExvY0hHK0RDd2p6V2t6OU5HQVJFaXlCUUV6YitISDRY?=
 =?utf-8?B?cXo5RTRFVFNXV3pJdjR4WmV2QWhKU1VlRUFlT0I0emFGc2VlMGhMSFdDTExC?=
 =?utf-8?B?STNXR1RMOGl3cExKNjZHNVFSQ0lBVnozdUtsQU5CeDVWbmlSM3NrV0dyN1Jl?=
 =?utf-8?B?NldGR0EyVWt2RHdQNHZsVW0yUDFNQVluK0xjUE9XVUF4Qmszekw0ZzlodVZq?=
 =?utf-8?B?Z0pVdWpodk5OeWUwaWZlSU1kN2RlYTl6MnN2b2pVZ3hVVkUySFJwVXF0MjRp?=
 =?utf-8?B?QVBhWDZtRmZZNUtUZHE1NlZKVGlCbjFrN0p2NE4vbXduOVNuRWs3V001cGN1?=
 =?utf-8?B?dkF0SDRFdDdDbGZVWElwOHlZTXZ2bUIvR3ZRL0twQUdyWmxzam1IVHRGVVlJ?=
 =?utf-8?B?R29GbFpXdXYrVzk4THdPOUkrelVNODRQNjhNbi9hOU5KR2gxMi81STBRY2c3?=
 =?utf-8?B?a3kvTFg1Y05lN0dpMS9pNmhqRDQyRko5VS83bm9oMmhIeTRvRUxBa1JlWnI2?=
 =?utf-8?B?ZTBVYWNTMUNhSTVZb3QvQXNMOHM5cHA2aUYrRDJERXRiWjk2Vk1wNUZXRkhX?=
 =?utf-8?B?dEVNL2VaSlhKSTNQb052L01xdDJuQXVrUjVsVG5OU01CRzlVMng0bGpvSVp2?=
 =?utf-8?B?NWZ0eXZqNncyVnkxUFRjc0lnVDFDaUFud2ZpS05UZlVySFFEWEJQT3VTSWc2?=
 =?utf-8?B?MTNHQ28zRGJhcS9sLzdEZWR1MnhaeVVudTZremV3OFVKbXVQY09rcVNrR1dx?=
 =?utf-8?B?alV6NS93ZmMwK1NMWVFRQlpIb2ZzdVBpVWczZnhhcVRaSEF5WEdQSVhkT1hD?=
 =?utf-8?B?MFR1aXVXTUZIKzRXSXdZL2lXZWFpc05VNWlTQzNkTHF3Z1cwU0dUd3I0dE1v?=
 =?utf-8?B?VGJVQ0VMQlhSeTJxQjI2SXlDMmQ3bFA1VmxIcTVucHhQMnpQNDlCS0FPejBr?=
 =?utf-8?B?dnpXbnpjK0RESEVDeEpvWTdJYThkQlZLK2JXSTFVSUxBMjRndmFJcFAra3lL?=
 =?utf-8?B?N3VlbkdrNlZoa0UrbkFLZzR0TVdWdFVGaUY3d2ZobWo5dk5hQmtUVG1ZdHFZ?=
 =?utf-8?B?WS9aajRHelFMMGdVUzFNc0VjNERMbGVMYkdHSlV4UXFFVjFNU0xQeGxybFpO?=
 =?utf-8?B?RVpZSkdSaWsvaUZueXBNN3I2eGJ2ZVVYOFJXZEJIajR1UU04eFBGa3RWZHNu?=
 =?utf-8?B?WG42OS9UYlBZTkJCQ3hsV0pBR3B0aWlVNjA2Wk5WdUI2MUJzUnVRTjBoTVo5?=
 =?utf-8?B?NXZNdTlLNVpxOFg4YkhhOTY5RVdKUXhMSmRMOFdZdCtGVlFQUytXLzE5b3hG?=
 =?utf-8?B?K3BFQVRLMjU3cXc0Z0VrQ3lISlFRSG1LK2JDc0VYTlJyK3ZyRE9Va2UvSExy?=
 =?utf-8?B?aDJRdldWSkFhaXdyTTdCaWdmNHhxVUcwaHg1MnY3eURBTVRDOGY4N3JKbWtu?=
 =?utf-8?B?UUhZQStFVGdBYWpEVDBJd2F0VHVFRit2WHhWWkV4V0FrQjBTbnBmNitNcXR5?=
 =?utf-8?B?eWNPb1N4Uk1MUHkyMEVvRlZoQ3Axd1J3QzV5U0c2K1JnOU0wODVNR2l1S1pL?=
 =?utf-8?B?aVJVcHpIc2UwN2RiSXlQQWJkUzhVMGlHOW9pOFoyR2hKNTRmREtPZ2ZLbm5p?=
 =?utf-8?B?a1AvLzhrdzhRRmVjL001VmhWcUljQ3c1dW5TZDlsQXNlNlE1S0pwSHNEYlRI?=
 =?utf-8?B?aDFQdHVuNVdRPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(921020)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ajFoS21NazJxMzRGN3d1VDF4dlorSUtOMGZWUmg5WndOMmNrTXlXVTY5ZzNY?=
 =?utf-8?B?ODBxaXJiY0VwMTk1cmtzQzU1K0hGdU13QlQwSjlFaDNHL2NEaWVpV1ZpSzZ5?=
 =?utf-8?B?UmVOY1FUYStTOVNpMzhEWVphUW5zaEVPUE91eFZkWjJ3UHZUUERUMlh6S1VV?=
 =?utf-8?B?NjZpVlk2a1hacHZJSU5wcGx3cXJhbllCSFJhNGFnRG5HR1BkODNDNjNPM2VE?=
 =?utf-8?B?cjFjYU9qcHpHSS96c1NjL2R2ZDgyc3dpZWo5RU1uTVRNbTZ5SHJXUmw1djYz?=
 =?utf-8?B?Rk44NTcvdC9ncVZzVG41Rm5mdVVDMjJxamk2MmxwNmc0b1ZhVTdkN3hkUlN6?=
 =?utf-8?B?VmFyUzJ1cFV2d2ZSdXZJTElCZFpqWTJuK3RIaGp6TTlISG9HUGx3RklvOTA4?=
 =?utf-8?B?VTJ1WllkdUpCRnV0NENnZDVCdjI0QWdWNlhkcXpFVktFLzl4dUtaaXBkeFlI?=
 =?utf-8?B?QzllbUY0ZktjQjlnNzNkRFJCSkxUL1UwZ0xnNmxxYm43S01UTFlUUitYMExr?=
 =?utf-8?B?YjlXWVM0UGYyMmZRUkY1c2hRNERQM2FITCs4UEdZRXVUUjRITGdJNzZSNmRY?=
 =?utf-8?B?aU8xcGhWczhWVkYxK0ltNVdWYTZoQlBvRzVHc0o2bEFqeTlvdHJpQnNEQXNt?=
 =?utf-8?B?c0M4ZjkzVzFVVTlKS0xaWUdORTRpTEUxR3ZidFA4MzNCdUZXa1RnbTBDbEpw?=
 =?utf-8?B?eVpCYUg2TnZUend4TFFUbHM3VDlheXJRemcvZTJyMGRxbUFrUkEvOEpiMzZG?=
 =?utf-8?B?SjRhRkZMRzQ2UDUwU2dTZ05FeG5Ed3pqWDdLR1FJbXlrbXlmRUxwUmg0ckRx?=
 =?utf-8?B?eEJFUm13WU9FT1g1WFk2alFNZUVtbmo1T055VXRlalNvMVRzNHlza3VLZmRW?=
 =?utf-8?B?OW82Z0xLY0Y3OHJZZG1neDZCS2lWZmlGQWE0T3IwM3FaRGpGNVJMZzVQMENH?=
 =?utf-8?B?eS91aG1NcmNzRVE2cHBiWUljSkF3NmFIQm1laXI0RHN0YkFTZTFnV1RKRk1x?=
 =?utf-8?B?dGVZTms3Vk56R244VER5czJTK1lRNXI2NEVKM25DUThEOEdwVVF4NEpwVnlI?=
 =?utf-8?B?UlhuMTMwSlNLZU1CQ2hWZm9HTG5vUlRWdVFqUHNNN0d3NUloYVdqVlVFSHVq?=
 =?utf-8?B?K3F6MkZ0TW0wRURPdG0yUTNFRGdzVHN0RHEyWVQ4R29sam51VUVUczNVZmlR?=
 =?utf-8?B?TFF0a0U3VXhZczdwOHBsYzhxUXBDZjFJQ0J4SzR2MzU1VEVhWHZzckJxdUQz?=
 =?utf-8?B?TjZsM2FibXdvMlorMHN3cG5oU1kwSElmakt3QmZ1T0VXSDRUcVl1bEhBbWNX?=
 =?utf-8?B?NjBHQzAwOGxKdVBKNGc5cXhUeWtGTXRDb2RoTlhxQlkxcXlZMFFldEs4a0xD?=
 =?utf-8?B?MmpaN0RveCtGTlVDVkgySWpHc0wxbUNFS1FlQTNDSVZUc21aaTZJRnhVcmdO?=
 =?utf-8?B?NFVZOTMyMFh4UVdJcEI4a01VUmtBSDMrMkhVTzZLZXpoSjh0ZWZ2anNpRkxQ?=
 =?utf-8?B?MjBuSGRBL0xqbnBzWThra0ltVHZ2MURWVVk3SlQ4bU1ZcTJtQXZRSEt0UXBh?=
 =?utf-8?B?UyszdEFkd1p0WmNveEdQa1NMbW5QYkp0SFZxZytQa1J0MG5XeUlsNkxNalMr?=
 =?utf-8?B?c2VNbXdBQ2RLY0hyWFl3MEdscUwrRnJYeGZRLy9vNHpEU3pJTkRKaTdVazhl?=
 =?utf-8?B?bWhVaytmcGs4ZjAzK29EckUrMFk1WFJ5UUU4ZlBDQ3haMk9QM2tQeW1FL21R?=
 =?utf-8?B?OWV1c2NpMlAvODJZSHhjK1A5dDdDcTFMQmhCU0UwNWttdkRPSVVrYkxuZUpZ?=
 =?utf-8?B?WERWZWFabmp2UmRkQUY5WHpjZHB1VDhqRXIxeTdndkF4UGpnMzJITzg4Witk?=
 =?utf-8?B?eU9JclB6QitzVUpaVmtXRSsvRjQwT3E3ZTdOU1VTRTZ5NVBtSkVLSmk3U2J1?=
 =?utf-8?B?VTJrQmpWVHdFNnlRM2FXTnNuUkRDcVlUVFlYNmtvNk9HV082QnYvY1ZyOCs2?=
 =?utf-8?B?RHg1K0JncVNuRHdnQ2JUa2VqRUhJVWdwM3ZFeTNnRlcxTHdxSEN3UUdjVjhq?=
 =?utf-8?B?YnlhQnBaSjRFaGxLU0xyRURhZS9PRU91ekhIWkhRVUtQVWpFQ3ZnTHZnd2R0?=
 =?utf-8?Q?VvTxMqgeLQrqbSRBBJIf6aFt/?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 293477cb-459a-4f93-8ec9-08de15ce0431
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2025 02:59:31.0802 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 49HshZuXAJev9EVKFiSAMVz1XoljsYO2JtJliQybu+3Lws9OkYNu9faLbuhGCHYlgRw4BIjFygiibF53hBWInw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5044
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

R2VudGxlIFJlbWluZGVyIQ0KQW55IGNvbW1lbnRzIG9uIHRoaXM/DQoNClRoYW5rcyBhbmQgUmVn
YXJkcywNCkFydW4gUiBNdXJ0aHkNCi0tLS0tLS0tLS0tLS0tLS0tLS0NCg0KPiAtLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBNdXJ0aHksIEFydW4gUiA8YXJ1bi5yLm11cnRoeUBp
bnRlbC5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBPY3RvYmVyIDksIDIwMjUgMzowMyBQTQ0KPiBU
bzogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT47
IE1heGltZSBSaXBhcmQNCj4gPG1yaXBhcmRAa2VybmVsLm9yZz47IFRob21hcyBaaW1tZXJtYW5u
IDx0emltbWVybWFubkBzdXNlLmRlPjsgRGF2aWQNCj4gQWlybGllIDxhaXJsaWVkQGdtYWlsLmNv
bT47IFNpbW9uYSBWZXR0ZXIgPHNpbW9uYUBmZndsbC5jaD47IEphbmkgTmlrdWxhDQo+IDxqYW5p
Lm5pa3VsYUBsaW51eC5pbnRlbC5jb20+OyBWaXZpLCBSb2RyaWdvIDxyb2RyaWdvLnZpdmlAaW50
ZWwuY29tPjsgSm9vbmFzDQo+IExhaHRpbmVuIDxqb29uYXMubGFodGluZW5AbGludXguaW50ZWwu
Y29tPjsgVHZydGtvIFVyc3VsaW4NCj4gPHR1cnN1bGluQHVyc3VsaW4ubmV0PjsgeGF2ZXIuaHVn
bEBrZGUub3JnOyBoYXJyeS53ZW50bGFuZEBhbWQuY29tOw0KPiBTaGFua2FyLCBVbWEgPHVtYS5z
aGFua2FyQGludGVsLmNvbT47IGxvdWlzLmNoYXV2ZXRAYm9vdGxpbi5jb20NCj4gQ2M6IGRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmc7IGludGVsLQ0KPiB4ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IE11cnRoeSwgQXJ1biBSIDxh
cnVuLnIubXVydGh5QGludGVsLmNvbT4NCj4gU3ViamVjdDogW1BBVENIIHY2IDAvNV0gVXNlciBy
ZWFkYWJsZSBlcnJvciBjb2RlcyBvbiBhdG9taWNfaW9jdGwgZmFpbHVyZQ0KPiANCj4gVGhlIHNl
cmllcyBmb2N1c2VzIG9uIHByb3ZpZGluZyBhIHVzZXIgcmVhZGFibGUgZXJyb3IgdmFsdWUgb24g
YSBmYWlsdXJlIGluDQo+IGRybV9hdG9taWNfaW9jdGwoKS4gVXN1YWxseSAtRUlOVkFMIGlzIHJl
dHVybmVkIGluIG1vc3Qgb2YgdGhlIGVycm9yIGNhc2VzIGFuZA0KPiBpdCBpcyBkaWZmaWN1bHQg
Zm9yIHRoZSB1c2VyIHRvIGRlY29kZSB0aGUgZXJyb3IgYW5kIGdldCB0byBrbm93IHRoZSByZWFs
IGNhdXNlIGZvcg0KPiB0aGUgZXJyb3IuIElmIHVzZXIgZ2V0cyB0byBrbm93IHRoZSByZWFzb24g
Zm9yIHRoZSBlcnJvciB0aGVuIGNvcnJlY3RpdmUNCj4gbWVhc3VyZW1lbnRzIGNhbiBiZSB0YWtl
biB1cC4NCj4gDQo+IFRPRE86IGRyaXZlciBzcGVjaWZpYyBlcnJvciBjb2RlcyBhcmUgdG8gYmUg
YWRkZWQgYW5kIHdpbGwgYmUgZG9uZSBpbiB0aGUNCj4gZm9sbG93LXVwIHBhdGNoZXMuDQo+IA0K
PiBUaGUgSUdUIHJlbGF0ZWQgY2hhbmdlcyBhcmUgcHVzaGVkIGZvciByZXZpZXcgQA0KPiBodHRw
czovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzE1MzMzMC8NCj4gDQo+IFNpZ25l
ZC1vZmYtYnk6IEFydW4gUiBNdXJ0aHkgPGFydW4uci5tdXJ0aHlAaW50ZWwuY29tPg0KPiAtLS0N
Cj4gQXJ1biBSIE11cnRoeSAoNSk6DQo+ICAgICAgIGRybTogRGVmaW5lIHVzZXIgcmVhZGFibGUg
ZXJyb3IgY29kZXMgZm9yIGF0b21pYyBpb2N0bA0KPiAgICAgICBkcm0vYXRvbWljOiBBZGQgZXJy
b3JfY29kZSBlbGVtZW50IGluIGF0b21pY19zdGF0ZQ0KPiAgICAgICBkcm0vYXRvbWljOiBBbGxv
Y2F0ZSBhdG9taWNfc3RhdGUgYXQgdGhlIGJlZ2lubmluZyBvZiBhdG9taWNfaW9jdGwNCj4gICAg
ICAgZHJtL2F0b21pYzogUmV0dXJuIHVzZXIgcmVhZGFibGUgZXJyb3IgaW4gYXRvbWljX2lvY3Rs
DQo+ICAgICAgIGRybS9pOTE1L2Rpc3BsYXk6IEVycm9yIGNvZGVzIGZvciBhc3luYyBmbGlwIGZh
aWx1cmVzDQo+IA0KPiAgZHJpdmVycy9ncHUvZHJtL2RybV9hdG9taWMuYyAgICAgICAgICAgICAg
ICAgfCAzMSArKysrKysrKysrDQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY191YXBpLmMg
ICAgICAgICAgICB8IDkyICsrKysrKysrKysrKysrKysrKystLS0tLS0tLQ0KPiAtDQo+ICBkcml2
ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXkuYyB8IDI1ICsrKystLS0tDQo+
ICBpbmNsdWRlL2RybS9kcm1fYXRvbWljLmggICAgICAgICAgICAgICAgICAgICB8IDEwICsrKw0K
PiAgaW5jbHVkZS91YXBpL2RybS9kcm1fbW9kZS5oICAgICAgICAgICAgICAgICAgfCA0MSArKysr
KysrKysrKysrDQo+ICA1IGZpbGVzIGNoYW5nZWQsIDE1OSBpbnNlcnRpb25zKCspLCA0MCBkZWxl
dGlvbnMoLSkNCj4gLS0tDQo+IGJhc2UtY29tbWl0OiBhNzEwMWUzNWYyOWUwMzU2MmYyNGNlMTIy
MGYwODM1MDI2MGZjMGZjDQo+IGNoYW5nZS1pZDogMjAyNTA3MjgtYXRvbWljLWM5NzEzZmQzNTdl
NA0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiAtLQ0KPiBBcnVuIFIgTXVydGh5IDxhcnVuLnIubXVy
dGh5QGludGVsLmNvbT4NCg0K
