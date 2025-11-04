Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE2EC2F54B
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 06:02:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 599B110E531;
	Tue,  4 Nov 2025 05:02:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D+4L/ten";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B71910E522;
 Tue,  4 Nov 2025 05:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762232538; x=1793768538;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=eXoZvMwY1sYV+BDT/oQ0lNB1NR2wXTGgrwf9vkxtbu0=;
 b=D+4L/tenrx5uOBQqcSW4H7cWBsIcewrumrgRtzPh0RJtZZvaA7TKYXbF
 +oKI8FeFGGkH02E3b+EIW3vYcWUOuFF6UPbA2M3hjWORlOC8ElZb/m7c9
 Hi4WxnvaKnVUu1bo8Slt/kfgjajznm6eInzd79LtA1dHfhUmYVOVcJ/dZ
 tF9tWs3oyj3BLWuDZIrt7/C29Pv2D2H1lmuEZZVjEyS1QGa5ycz2cHhJT
 sgeJsiHe7BkYtna5r2AP1LX0I+Le1i+kIA9QzVmm90tzbCz6JldUhBi4F
 L1m97ieHY0qwRqFGPKlrvZLfs9Jj6BTFQBuwkq7t/wRg9p2y85N5+mhAF Q==;
X-CSE-ConnectionGUID: tQVIzaUSQKua4Pzge6t/AQ==
X-CSE-MsgGUID: 8BPkG/HoQj+FX6CTrzHv+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="64016918"
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; d="scan'208";a="64016918"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 21:02:17 -0800
X-CSE-ConnectionGUID: szvZc47TQ3SUNuxYpt71Tg==
X-CSE-MsgGUID: PrOt0zapTJK9J27aoGn1bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; d="scan'208";a="186298046"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 21:02:16 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 21:02:16 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 3 Nov 2025 21:02:16 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.55) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 21:02:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iKg0vL0tUjI5oUakQiMwDXiG8DtDz3dhN13U75qmrnzZ4Ptzeil1CwxV0lPZLgBPh0ahhBE6d6o6P9z0JHuHKQxU+kX7Vg1jaUtH+BpYGcLNMX8PJ+zfDrCG0iGfB0CFW0s94tM4UxDKGysIJRvc9D+Jquz1fxGgIZACGWxY8lF7JD/i40MNHDeJbEhAno7CcQ8amOkJuO5AQ0MRbKi0LdORJjV3FmOlsRzaiiwz7zO2W17wIb97IXX2EPzCTmb3pEak3wbSepU2I1BFdP90D8IGP+RQQzxDT1wXoEas5DlUR1nHntP86dBxKe70iztjzsZxFWDosGFad2DVSnCoyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eXoZvMwY1sYV+BDT/oQ0lNB1NR2wXTGgrwf9vkxtbu0=;
 b=cCodVg6o4Fudal3WF6Jfcuj8lUtMT1wiLvA+l5Hm72fL/apVaSDY32lQbxxNZ6PqkE0SXmYr8NX+wf9+0D6UJriOhX/EujoMDuG8g7eHYG556mJg0x8hOWseMdoChph8YepNjQ7S9Orpr6oFJpXJK4Qf0u1s1VyBzb84lwLGBSRvUpBvG6MEZTxVDda6VVHIjX2RhEpFYEZyU5sNE3n3xXDCu4HjucVdVKBRxlM4V06BXOjmnZI18C47TN5hBuFsD4GapZv4inWOL804/hErjp1BC9QcSyD7WfBF4V8O8fJ8Rz22nw/t587rQs4GXb9qFLnjHUDFnb1KOpdY+yDJnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by SN7PR11MB7537.namprd11.prod.outlook.com
 (2603:10b6:806:348::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Tue, 4 Nov
 2025 05:02:11 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc%4]) with mapi id 15.20.9275.015; Tue, 4 Nov 2025
 05:02:11 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Manna, Animesh" <animesh.manna@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "Nikula, Jani" <jani.nikula@intel.com>, "Manna, Animesh"
 <animesh.manna@intel.com>, "Hogander, Jouni" <jouni.hogander@intel.com>
Subject: RE: [PATCH v2 08/10] drm/i915/alpm: Enable MAC Transmitting LFPS for
 LT phy
Thread-Topic: [PATCH v2 08/10] drm/i915/alpm: Enable MAC Transmitting LFPS for
 LT phy
Thread-Index: AQHcTRPVwUteZBwLSEO8aRLkB25AQrTh9SuQ
Date: Tue, 4 Nov 2025 05:02:11 +0000
Message-ID: <DM3PPF208195D8D0AB6C0DFA68F67AD0B1DE3C4A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20251103220957.1229608-1-animesh.manna@intel.com>
 <20251103220957.1229608-9-animesh.manna@intel.com>
In-Reply-To: <20251103220957.1229608-9-animesh.manna@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|SN7PR11MB7537:EE_
x-ms-office365-filtering-correlation-id: c13d6f7c-dd20-448b-d885-08de1b5f505b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?eC9oaWdValpZcFcyaDdrOGlycmRnUEEyYjhoc3dFdHVGSFJydTNzRGJaS201?=
 =?utf-8?B?TXZQb1BCNFhraHM4cUNqNVBjSWY0UlYzR0s1N2dhaXhsbnNmaitxb2V3bHhS?=
 =?utf-8?B?cU5yNUFxN0YyVXkwUEF2b3d2dEFjYmJyOXZiY0V5dlI0Ny9tdHk5N05YdnJI?=
 =?utf-8?B?UWcvOS80MmM3Zkc5S1JrSVQ0ZjgrT25hdG1SL2Y1UUdDNnNBWWJTUjBDR1JH?=
 =?utf-8?B?YkM1ZVdPMXFtd1FCcWNjZzhnK1NUc3JVTm5TeTJaejNtcnBOczVQYTNjNE9F?=
 =?utf-8?B?L1ZGVnBRdnU3RE5Wb2U1K2JONUQ3T0tiekNjZ0MxSWRpUFRMRUxCZVN2QjRC?=
 =?utf-8?B?ZEtUY3pvMWFPSGxmdFdveTRMdnpVUTdDVVRHWXU1aE51VFN4Q0dtRzhRNEpQ?=
 =?utf-8?B?cnpuc0pHbE5DRW9yWk8wZFVsUlVyUUlWaXZNVG1oNHd2MnFzZG0wKzhNQTYx?=
 =?utf-8?B?dy83amZQTGpYSFR5SmpFTVRGWS9hR3IvSm8vb2dzTXUvT3R0VWlpRitTRjY1?=
 =?utf-8?B?NGpEWnFwZ1h1c2VWQlpqSVhSRlIrcFZpMWxjVlpwaEZDUFhFbU5yeXdnVnlZ?=
 =?utf-8?B?NkJ4TGd0MUVpUEtzZnpjVDRheDNZTkF1ZTZpVmxJMlRVbXdlbGFic0FmL0RE?=
 =?utf-8?B?Ym1jb1E4aDgxK0hvRWxKU3dOSmI5QWx1U3pRY2tkbDJPNWtTZk9rQzFISDNW?=
 =?utf-8?B?eG9aWE1lenZCdUtqWHVhUEpEVXZKTzdiZHFsbGo3dWJqSlhxanV0dXBhWUxH?=
 =?utf-8?B?ejhkd3VwMWhSOUd0RUE4Y2NQUjBCcnNybmIrRmkyV21tUytKWktKSktiMEcz?=
 =?utf-8?B?end5YVRRcW1NYU9KTjBTanMrRTBpa3BDRVhvbm9NUXp1bTU5MTVKaTZ5Zk5l?=
 =?utf-8?B?cUZQZ2xQY0xSRTBCZ1A2WlB3R1lMS0lCeHZFeWorRkJ5SSsrd0VPVXlqY1RK?=
 =?utf-8?B?ZTA1YS9PbmU0WTNoM2RuT1R2Z25SbE1sU1VLWDEvbnhITnc1RFZmOUZmYTRi?=
 =?utf-8?B?ODFoSmpIZUtHZy9uaUJEQTEzUExRc24wOHVQSGtnaTF4a3ZZMkloRHpoajln?=
 =?utf-8?B?YzFybEpwOS8vNTN1aWJlbkQ1S1FLQ0FiUjJnNFlKSDRla3ZNRGU0eVA0dzVt?=
 =?utf-8?B?UWVhS3ZGamxGZGZMSG8vMFRtc3M2Z1pWYkttS0RsWEw0eU5TZzAvNDNWeW9s?=
 =?utf-8?B?TFV4UFJScnhCbmdWdlo3Rmo1RExaL3NHTnE4eG80M2cyUzJwVHVhdDBmVzE4?=
 =?utf-8?B?U1JDRGppa2ZhbHR6OVFNaDZjTFRxbUNZRW9OdzJLVktMbGMwc3RTYnU3N3BW?=
 =?utf-8?B?cEx5Ymx0Z0tJZVBmcDFQbUxPb2xFYVdxZ09PSzkwKzVJZ2thS25vSnlLbkVP?=
 =?utf-8?B?cVNWNlptbmh2K3JXNU5rdjZ5aHhoZENSZFFXNFhxYnI0aHJpMXQ2OE5EcDhW?=
 =?utf-8?B?ZWpTR0FMdnViQStYb0hiWHFaWWtYU2djYjgxT2c4S2M5VzZIVVZVVFQwcWpI?=
 =?utf-8?B?dHBFYklVZWtvdXZ6RmRGU0pCYndDSVVSVlJKMFNpQWNseVpNV3A0a256Z0V1?=
 =?utf-8?B?Z2xSWDBuVVlEZ0RCYU9UT05MdFVsaGV5VkpNKzNiWVhGK2dpckFHMklpemRr?=
 =?utf-8?B?WThkdFdQRTZUNHU4Ykk0MUlMOEhYSXlncW1sYkNHMFlRWC9IeFBvdWhNUUM3?=
 =?utf-8?B?ak9Pb3crVUhzVE42ajdOdW40b3dmMkcvMHd4cWwyc2MwU1ZIZEJ1dXFIRXMz?=
 =?utf-8?B?VExKZ0xUcHdoVHE5U09yczdDWXZMS0UvbGJSVUd3Qmtwd2xKU3ZMN055TGgr?=
 =?utf-8?B?VVZ2eUxTWUZpLzdPRTNIM1JYaXdlRThoaHlEZkJXQjlsRWFvbWVtcFJEdER5?=
 =?utf-8?B?blpMUVlYd0pWd0tmdjd1Q0p0NmJTR3Bid3NsUnNrWGduejQybThHU0E3Z0Y2?=
 =?utf-8?B?WHRRMEhFK2tyQjdpdjRxSXBOM3RzTHlrbndQZ1pxb0sxNFM2dE9nZnh5aEV1?=
 =?utf-8?B?Z3o1OUE2SXN0TnIxU3N6R1FtYlV4MFJPYnRLaW9VWTMrNmdQK2FwUVk5WWw1?=
 =?utf-8?Q?2pHoL+?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K1J5QzZjeUVIbjBLeERYeFFDb2FDV1FTTEtyVXlmOUpiZmRkbGxlSkhXQnB0?=
 =?utf-8?B?cWtLb3VraUJaMVRvT1huZXdKT1VmbXQ5T3RQSFBIT3hKTG8yS0JFU2dNblhK?=
 =?utf-8?B?V3NiVWgxejJrd3NIaXZxckJOc3pwSGlhM3Zxay9KMXREdWhtSFliZ0tVZFBi?=
 =?utf-8?B?TlFYeDZyK0tRMzN3WXlsWlNGeVVkbmw2ZGJ2ZEsyWUZxWWZtdXE5WXpHV2JY?=
 =?utf-8?B?b0RJTW5ieE1wS0hCdXE4UW5JU0RQcDNVcitXZFF2ZDFFdStEYUVScjRCRzIw?=
 =?utf-8?B?NkJJS21XeVJMUVhJVGt5Qnd4K0FUVThINEhwdzJLc0Q2RDc4akR5TE5ERUIw?=
 =?utf-8?B?K25BSFhhbjd6RU8ydEJDTXE0cFRyMEVyWVAxNlJTYXkvbkhPYWZQam9mZmdr?=
 =?utf-8?B?a3hVdVlLQS91RkEyZ000T2hsRFV1UU5idHQrUlhERE05ZjBlWmNEeCtUZnVx?=
 =?utf-8?B?bGw4cmRvRWNFZUwrV2E0VXFsRXhCWmdOZXBRd1A1SzZvTmgwSFdLTzVtM3hI?=
 =?utf-8?B?TnowaS9XVmh2MnBHR0lWREtEZG5YQ3N5eVppMWk1a0dmV0VRUEFYZXF6bDBr?=
 =?utf-8?B?TGdIRjlrS2lBT2Y5MU9HcE5RUklteTZjaysxM2JHMkVsNi94emJVV2kzZzlK?=
 =?utf-8?B?bk11V2xxRnlnSThHZVRldStsSlR3M21JczNsRmthanBqR09za0k0N05NOWo4?=
 =?utf-8?B?cDl0OFU3RHdlZXpEbXBpNUdBOEJGNXp4OFZjMHY2cytLUW44dEhyeCtEaDEv?=
 =?utf-8?B?S1N4U0ZxZnl5ZGVDK3IvQ1hjMWxNVTViZ0JvcWFPQnB0cVNNNFNuK0dKUUQ4?=
 =?utf-8?B?T0hoeEgvcTFoTjgzTkVFcnFOZ1lzZjFCTHlZVm1xSVNSUGVsblpRSTcvaVla?=
 =?utf-8?B?MGZ1V0JybWpXc3VNMjlsQlM5VDUwRHIxdWExWEo5dlRMMjl0SkVzcUFxS2NF?=
 =?utf-8?B?eHNtVkR3RmpXbzNHRHRWYVU0ZDlEYXd1OWY2ZTVLQTlHTUJzOGRIZ0E1YUJO?=
 =?utf-8?B?bUhUakdJWTRVakUrTG5IZkpUNml6YzZKWExEYzI4c01wRGhrdm5RR0pNSFBq?=
 =?utf-8?B?VnlDUWVFdlRrS2Zyek1PdHlQdXA5b2F5RHVSSU1iaGpqTjNGd2gzRVBCenJt?=
 =?utf-8?B?ZG92SE1HOUZFQ0hld2JJb2dDc0JwbzFRRVNVd2VpQit6M0F2S3FFd0plVUdI?=
 =?utf-8?B?QzJqd00rQ2ZibjNyakV5VldtL0cwL25xUWxkamxhUUMxdklLdmVOblNCZ1ZN?=
 =?utf-8?B?eUQ2ZWpTeG9RT2I2RThCTG9ia1Y2M2piMzhzNVFlR210SDg3YUdKY1phUWgv?=
 =?utf-8?B?UjVwWVhsQU9uQ3ZKM2hQSlRmTFVCendqdENZN09wY3pPaFRnNXFPSERNQjgy?=
 =?utf-8?B?Y1B0NUdnNFlGa1Zmd3ZkSXJxd0FKd3BUMllUd2FOK2JhVmhRbUxzdTlUdG1p?=
 =?utf-8?B?Q1JGNlBLaElHaDF5TFN0eDI1cWIydUFvTVIrN3p2LzBYS0dYS0M5NUFkdTB3?=
 =?utf-8?B?YXBTZTJSaGltVS9odFJuSnFHVjVtVi9mY1VFTUhHa0kxcTBOaXMxMFppcThz?=
 =?utf-8?B?WGRGWFppbXFUNWxNOS9aY3VyUWcwWTloQ2pLN3JkV1pRdVlwRHpsQXpUSVRn?=
 =?utf-8?B?VFpNZ0pkTTNHbmwvYUF4SWxZemZvSDUxZkc1VG44a0xYWjZjZnhzbmhrNjdv?=
 =?utf-8?B?NTJJWW5TYjVzc0x0dXEwdVdubjU3MVRxRGVmL3VheXp2R21qN3RVT3lHMmUr?=
 =?utf-8?B?MGhHdmFlV0FsL3VlM2RNOTExamR1QVQzaGhRUm9wenMvUnI3bDBPSHVRampn?=
 =?utf-8?B?KzI3MjdXczFQalNLdG9zeGJ5Nm1mN1hZd01EZHI1bE5LYXFHbDlxb1F0VVpO?=
 =?utf-8?B?aHZ3MTl2OVdlTGdDOVI3dkpyTE85WTQrTlZBVXU1VVZ4V1pBMlhMNEw3S0Zs?=
 =?utf-8?B?aHpWNnNsNlRpSWkxVElibEtyaTVqOWpPRDZxSDhWRGJraDFzN0k0aU80NzN0?=
 =?utf-8?B?ejlpUHg4Y3QvV01PbUZYVkRkQ2xXL29sOU5lanVQbCtmN0ZWRDlYSkJBOGky?=
 =?utf-8?B?STFnblBYUXBLOUdTWEFHd1VRVWJJaDYzeFZSMFdDRndIMXdVSi9DTFVZM0xa?=
 =?utf-8?Q?21itojl85yRiEv4hihyarNKhV?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c13d6f7c-dd20-448b-d885-08de1b5f505b
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2025 05:02:11.6617 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BVE9sE1QDm8msq/rI/OZ+8CGM9sCQu6YzYNUnfpNVdvRkUXO9i8X/qSs0obZPseRHchsRS3dShgwugtrx9HyRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7537
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

PiBTdWJqZWN0OiBbUEFUQ0ggdjIgMDgvMTBdIGRybS9pOTE1L2FscG06IEVuYWJsZSBNQUMgVHJh
bnNtaXR0aW5nIExGUFMgZm9yDQo+IExUIHBoeQ0KPiANCj4gRW5hYmxlIExUIHBoeSBmb3IgdHJh
bnNtaXR0aW5nIExGUFMgZHVyaW5nIGF1eC1sZXNzIGFscG0uDQoNCk5vdCByZWFsbHkgIQ0KWW91
IGFyZSBhY3R1YWxseSBlbmFibGluZyBNQUMgdG8gdHJhbnNtaXQgTEZQUyB2aWEgTFQgUEhZDQoN
Cj4gDQo+IENjOiBKb3VuaSBIw7ZnYW5kZXIgPGpvdW5pLmhvZ2FuZGVyQGludGVsLmNvbT4NCj4g
U2lnbmVkLW9mZi1ieTogQW5pbWVzaCBNYW5uYSA8YW5pbWVzaC5tYW5uYUBpbnRlbC5jb20+DQo+
IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kZGkuYyAgICAgIHwg
IDUgKystDQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2x0X3BoeS5jICAg
fCAzNSArKysrKysrKysrKysrKysrKysrDQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5
L2ludGVsX2x0X3BoeS5oICAgfCAgMiArKw0KPiAgLi4uL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2lu
dGVsX2x0X3BoeV9yZWdzLmggIHwgIDMgKysNCj4gIDQgZmlsZXMgY2hhbmdlZCwgNDQgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGRpLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNw
bGF5L2ludGVsX2RkaS5jDQo+IGluZGV4IDczM2VmNDU1OTEzMS4uZjY0NTBlYmVhMmE4IDEwMDY0
NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RkaS5jDQo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGRpLmMNCj4gQEAgLTM3ODEs
NyArMzc4MSwxMCBAQCBzdGF0aWMgdm9pZCBtdGxfZGRpX3ByZXBhcmVfbGlua19yZXRyYWluKHN0
cnVjdA0KPiBpbnRlbF9kcCAqaW50ZWxfZHAsDQo+ICAJICogICAgIGlpLiBFbmFibGUgTUFDIFRy
YW5zbWl0cyBMRlBTIGluIHRoZSAiUEhZIENvbW1vbiBDb250cm9sIDAiDQo+IFBJUEUNCj4gIAkg
KiAgICAgICAgIHJlZ2lzdGVyDQo+ICAJICovDQo+IC0JaW50ZWxfbG5sX21hY190cmFuc21pdF9s
ZnBzKGVuY29kZXIsIGNydGNfc3RhdGUpOw0KPiArCWlmIChIQVNfTFRfUEhZKGRpc3BsYXkpKQ0K
PiArCQlpbnRlbF94ZTNwbHBkX21hY190cmFuc21pdF9sZnBzKGVuY29kZXIsIGNydGNfc3RhdGUp
Ow0KPiArCWVsc2UNCj4gKwkJaW50ZWxfbG5sX21hY190cmFuc21pdF9sZnBzKGVuY29kZXIsIGNy
dGNfc3RhdGUpOw0KPiAgfQ0KPiANCj4gIHN0YXRpYyB2b2lkIGludGVsX2RkaV9wcmVwYXJlX2xp
bmtfcmV0cmFpbihzdHJ1Y3QgaW50ZWxfZHAgKmludGVsX2RwLCBkaWZmIC0tZ2l0DQo+IGEvZHJp
dmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9sdF9waHkuYw0KPiBiL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfbHRfcGh5LmMNCj4gaW5kZXggYWY0OGQ2Y2RlMjI2Li44
NzY1OWE5ZDk4NDcgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkv
aW50ZWxfbHRfcGh5LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRl
bF9sdF9waHkuYw0KPiBAQCAtNyw2ICs3LDcgQEANCj4gDQo+ICAjaW5jbHVkZSAiaTkxNV9yZWcu
aCINCj4gICNpbmNsdWRlICJpOTE1X3V0aWxzLmgiDQo+ICsjaW5jbHVkZSAiaW50ZWxfYWxwbS5o
Ig0KPiAgI2luY2x1ZGUgImludGVsX2N4MF9waHkuaCINCj4gICNpbmNsdWRlICJpbnRlbF9jeDBf
cGh5X3JlZ3MuaCINCj4gICNpbmNsdWRlICJpbnRlbF9kZGkuaCINCj4gQEAgLTE5OTgsMyArMTk5
OSwzNyBAQCB2b2lkIGludGVsX3hlM3BscGRfcGxsX2Rpc2FibGUoc3RydWN0DQo+IGludGVsX2Vu
Y29kZXIgKmVuY29kZXIpDQo+ICAJCWludGVsX2x0X3BoeV9wbGxfZGlzYWJsZShlbmNvZGVyKTsN
Cj4gDQo+ICB9DQo+ICsNCj4gKy8qDQo+ICsgKiBBY2NvcmRpbmcgdG8gSEFTIHdlIG5lZWQgdG8g
ZW5hYmxlIE1BQyBUcmFuc21pdHRpbmcgTEZQUyBpbiB0aGUgIlBIWQ0KPiArQ29tbW9uDQo+ICsg
KiBDb250cm9sIDAiIFBJUEUgcmVnaXN0ZXIgaW4gY2FzZSBvZiBBVVggTGVzcyBBTFBNIGlzIGdv
aW5nIHRvIGJlDQo+ICt1c2VkLiBUaGlzDQo+ICsgKiBmdW5jdGlvbiBpcyBkb2luZyB0aGF0IGFu
ZCBpcyBjYWxsZWQgYnkgbGluayByZXRyYWluIHNlcXVlbmNlLg0KPiArICovDQo+ICt2b2lkIGlu
dGVsX3hlM3BscGRfbWFjX3RyYW5zbWl0X2xmcHMoc3RydWN0IGludGVsX2VuY29kZXIgKmVuY29k
ZXIsDQo+ICsJCQkJICAgICBjb25zdCBzdHJ1Y3QgaW50ZWxfY3J0Y19zdGF0ZSAqY3J0Y19zdGF0
ZSkgew0KPiArCWludGVsX3dha2VyZWZfdCB3YWtlcmVmOw0KPiArCWludCBpOw0KPiArCXU4IG93
bmVkX2xhbmVfbWFzazsNCj4gKw0KPiArCWlmICghaW50ZWxfYWxwbV9pc19hbHBtX2F1eF9sZXNz
KGVuY190b19pbnRlbF9kcChlbmNvZGVyKSwNCj4gY3J0Y19zdGF0ZSkpDQo+ICsJCXJldHVybjsN
Cj4gKw0KPiArCW93bmVkX2xhbmVfbWFzayA9IGludGVsX2x0X3BoeV9nZXRfb3duZWRfbGFuZV9t
YXNrKGVuY29kZXIpOw0KPiArDQo+ICsJd2FrZXJlZiA9IGludGVsX2x0X3BoeV90cmFuc2FjdGlv
bl9iZWdpbihlbmNvZGVyKTsNCj4gKw0KPiArCWZvciAoaSA9IDA7IGkgPCA0OyBpKyspIHsNCj4g
KwkJaW50IHR4ID0gaSAlIDIgKyAxOw0KPiArCQl1OCBsYW5lX21hc2sgPSBpIDwgMiA/IElOVEVM
X0xUX1BIWV9MQU5FMCA6DQo+IElOVEVMX0xUX1BIWV9MQU5FMTsNCj4gKw0KPiArCQlpZiAoIShv
d25lZF9sYW5lX21hc2sgJiBsYW5lX21hc2spKQ0KPiArCQkJY29udGludWU7DQo+ICsNCj4gKwkJ
aW50ZWxfbHRfcGh5X3JtdyhlbmNvZGVyLCBsYW5lX21hc2ssIExUX1BIWV9DTU5fQ1RMKHR4LA0K
PiAwKSwNCj4gKwkJCQkgTFRfUEhZX0NNTl9MRlBTX0VOQUJMRSwNCj4gKwkJCQkgTFRfUEhZX0NN
Tl9MRlBTX0VOQUJMRSwNCj4gTUJfV1JJVEVfQ09NTUlUVEVEKTsNCg0KQWxsIHRoaXMgbG9vcCBu
b3QgbmVlZGVkIHlvdSBoYXZlIG5vIGRlcGVuZGVuY3kgb24gdGhlIHRyYW5zbWl0dGVyDQpMVF9Q
SFlfQ01OX0NUTDAgaXMgb25seSBvbmUgb2YgaXRzIGtpbmQgYXQgYWRkcmVzcyAweDgwMC4NCkEg
c2ltcGxlIGx0X3BoeV9ybXcgdG8gZW5hYmxlIExUX1BIWV9DTU5fTEZQU19FTkFCTEUgc2hvdWxk
IHdvcmsNCg0KPiArCX0NCj4gKw0KPiArCWludGVsX2x0X3BoeV90cmFuc2FjdGlvbl9lbmQoZW5j
b2Rlciwgd2FrZXJlZik7IH0NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rp
c3BsYXkvaW50ZWxfbHRfcGh5LmgNCj4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2lu
dGVsX2x0X3BoeS5oDQo+IGluZGV4IGE1MzhkNGM2OTIxMC4uNzM5MWRkNzI1MmQ3IDEwMDY0NA0K
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2x0X3BoeS5oDQo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfbHRfcGh5LmgNCj4gQEAgLTM4
LDYgKzM4LDggQEAgdm9pZCBpbnRlbF9sdF9waHlfcGxsX3N0YXRlX3ZlcmlmeShzdHJ1Y3QNCj4g
aW50ZWxfYXRvbWljX3N0YXRlICpzdGF0ZSwgIHZvaWQgaW50ZWxfeGUzcGxwZF9wbGxfZW5hYmxl
KHN0cnVjdCBpbnRlbF9lbmNvZGVyDQo+ICplbmNvZGVyLA0KPiAgCQkJICAgICAgY29uc3Qgc3Ry
dWN0IGludGVsX2NydGNfc3RhdGUgKmNydGNfc3RhdGUpOyAgdm9pZA0KPiBpbnRlbF94ZTNwbHBk
X3BsbF9kaXNhYmxlKHN0cnVjdCBpbnRlbF9lbmNvZGVyICplbmNvZGVyKTsNCj4gK3ZvaWQgaW50
ZWxfeGUzcGxwZF9tYWNfdHJhbnNtaXRfbGZwcyhzdHJ1Y3QgaW50ZWxfZW5jb2RlciAqZW5jb2Rl
ciwNCj4gKwkJCQkgICAgIGNvbnN0IHN0cnVjdCBpbnRlbF9jcnRjX3N0YXRlICpjcnRjX3N0YXRl
KTsNCj4gDQo+ICAjZGVmaW5lIEhBU19MVF9QSFkoZGlzcGxheSkgKERJU1BMQVlfVkVSKGRpc3Bs
YXkpID49IDM1KQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3Bs
YXkvaW50ZWxfbHRfcGh5X3JlZ3MuaA0KPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkv
aW50ZWxfbHRfcGh5X3JlZ3MuaA0KPiBpbmRleCA5MjIzNDg3ZDc2NGUuLjhhMTliN2NiNTlkYyAx
MDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9sdF9waHlf
cmVncy5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfbHRfcGh5
X3JlZ3MuaA0KPiBAQCAtMzYsNiArMzYsOSBAQA0KPiAgI2RlZmluZSBMVF9QSFlfVFhZX0NUTDEw
X01BQyhpZHgpCV9NTUlPKExUX1BIWV9UWFlfQ1RMMTAoaWR4KSkNCj4gICNkZWZpbmUgIExUX1BI
WV9UWF9MQU5FX0VOQUJMRQkJUkVHX0JJVDgoMCkNCj4gDQo+ICsjZGVmaW5lIExUX1BIWV9DTU5f
Q1RMKGlkeCwgY29udHJvbCkJKDB4ODAwICsgKDB4MjAwICogKChpZHgpIC0gMSkpICsNCj4gKGNv
bnRyb2wpKQ0KDQpObyBuZWVkIHNob3VsZCBvbmx5IGJlIDB4ODAwDQpBbmQgbmFtZSBzaG91bGQg
YmUgTFRfUEhZX0NNTl9DVExfMA0KDQpSZWdhcmRzLA0KU3VyYWogS2FuZHBhbA0KDQo+ICsjZGVm
aW5lICBMVF9QSFlfQ01OX0xGUFNfRU5BQkxFCQlSRUdfQklUOCgxKQ0KPiArDQo+ICAvKiBMVCBQ
aHkgVmVuZG9yIFJlZ2lzdGVyICovDQo+ICAjZGVmaW5lIExUX1BIWV9WRFJfMF9DT05GSUcJMHhD
MDINCj4gICNkZWZpbmUgIExUX1BIWV9WRFJfRFBfUExMX0VOQUJMRQlSRUdfQklUKDcpDQo+IC0t
DQo+IDIuMjkuMA0KDQo=
