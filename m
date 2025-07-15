Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9511B0538A
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 09:44:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE20010E0C9;
	Tue, 15 Jul 2025 07:44:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D1jD6FFx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24E4010E0C9;
 Tue, 15 Jul 2025 07:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752565462; x=1784101462;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QytTK5V8TZW4Jgf5GW67iBBklEFurDwhcbFCFb9FURs=;
 b=D1jD6FFxS4uiBsfTboDu9wK7UKwTFq8cDlqbLxISVY1WxikFTVA17fea
 jCXKlYAzCI4A/HxrDwr0WDzHuPm2T5GB8NUhwZbZCA485Uzhfe+oeTaeX
 46kDDYWIPkAIj/VTZGH7Y06rtaNJyGflXMSxeGzMx5uhr4Q90rfqXeotb
 UPJ85DXeBEbz24JNTJxXK9Wkr/nPcICTsyXavGI0KiDuZRcSO8lTAR2gT
 udZll/R1YYFpT5oIaI9pUqhO2MY51D//Gso6/XcpYEGfO9+Xyqj3pMtxY
 FEKABUy+PsuwkbSOKgK3kWWBcczpSKstVQYH7hY/nl9HIkfljBtwVQbzT g==;
X-CSE-ConnectionGUID: mbzR8LszSRacqqCf6jKcmw==
X-CSE-MsgGUID: 64QSzuFLRByticEiz8GShQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="72350204"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="72350204"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 00:44:20 -0700
X-CSE-ConnectionGUID: /xxd13a6RfWScrfthNwCgQ==
X-CSE-MsgGUID: 1qONK8K9RhKNWhYsfmGf1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="157664083"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 00:44:19 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 15 Jul 2025 00:44:18 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 15 Jul 2025 00:44:18 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.54)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 15 Jul 2025 00:44:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vz+8AGxYRhVI2Jp01CpR6Csf6k9D3Mt1KcIjs4Cd50Zhz92c2uuhnopH7bMSH1o9M6+CFb6hgjAOY2ZEiKNl3dojRquPG7r3v0vOkIhrKaiHbiNcv9X5PTMBlinH5uqny+RfQ3cAtFsqpqMLI5pV60ngBmBJ5w5IkZ+V83FPWVZ0m6rqq1VmBqyKhQS66awQc+F5HxXKDWHRDnQbmA1JIqtXO+Jp9AWae50Z72td2nW+reRLi3QFRsU1x1RsFph10yBxp+PQVk+hZ1qGr1zPvLU8LbTMLomoINKKD46FREjDOg7YpKq6EGPZEtuaIMnBJBNvFAmQpblvw2jLTsobvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QytTK5V8TZW4Jgf5GW67iBBklEFurDwhcbFCFb9FURs=;
 b=X2+DslFgUT5W/yJnIcKtR6TmqooBiPzLLfmwDKOxdrbabIrn+jQWcN624IH1q02FMKfRIAuEMxYs1N11sM5Yl3ll8oLZxnmiKquhs8BrQAa2j3yNixlGYsQyN9Y8heoKM23CMuMG801ShBMtCxpJIyi/YO8OQycCeb1TzSeuy6pLL4KTwJ5JntE8folTg5YUjKoLgYEq6QEYns8kuy5cny7bdJLBmR7GsT/liYPeFm5ecgBMlBWlHZ3KDEXGyK2LKkLXE/Cm0oE0YU0ipbPJPmtcW4YXQUiRi2HCrplXVtSNBv/9P56mYp2vhNxpnNiO5Ntk1DIIUX67vBHJbqG+AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 BL1PR11MB5272.namprd11.prod.outlook.com (2603:10b6:208:30a::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.28; Tue, 15 Jul 2025 07:44:06 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::8648:3a6b:af5c:b6e6]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::8648:3a6b:af5c:b6e6%7]) with mapi id 15.20.8901.024; Tue, 15 Jul 2025
 07:44:06 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>, Alex Hung
 <alex.hung@amd.com>, Simon Ser <contact@emersion.fr>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "wayland-devel@lists.freedesktop.org" <wayland-devel@lists.freedesktop.org>,
 "harry.wentland@amd.com" <harry.wentland@amd.com>, "leo.liu@amd.com"
 <leo.liu@amd.com>, "ville.syrjala@linux.intel.com"
 <ville.syrjala@linux.intel.com>, "pekka.paalanen@collabora.com"
 <pekka.paalanen@collabora.com>, "mwen@igalia.com" <mwen@igalia.com>,
 "jadahl@redhat.com" <jadahl@redhat.com>, "sebastian.wick@redhat.com"
 <sebastian.wick@redhat.com>, "shashank.sharma@amd.com"
 <shashank.sharma@amd.com>, "agoins@nvidia.com" <agoins@nvidia.com>,
 "joshua@froggi.es" <joshua@froggi.es>, "mdaenzer@redhat.com"
 <mdaenzer@redhat.com>, "aleixpol@kde.org" <aleixpol@kde.org>,
 "xaver.hugl@gmail.com" <xaver.hugl@gmail.com>, "victoria@system76.com"
 <victoria@system76.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "quic_naseer@quicinc.com" <quic_naseer@quicinc.com>,
 "quic_cbraga@quicinc.com" <quic_cbraga@quicinc.com>,
 "quic_abhinavk@quicinc.com" <quic_abhinavk@quicinc.com>, "marcan@marcan.st"
 <marcan@marcan.st>, "Liviu.Dudau@arm.com" <Liviu.Dudau@arm.com>,
 "sashamcintosh@google.com" <sashamcintosh@google.com>,
 "louis.chauvet@bootlin.com" <louis.chauvet@bootlin.com>,
 "arthurgrillo@riseup.net" <arthurgrillo@riseup.net>
Subject: RE: [PATCH V10 33/46] drm: Add Enhanced LUT precision structure
Thread-Topic: [PATCH V10 33/46] drm: Add Enhanced LUT precision structure
Thread-Index: AQHb3z//M2lqQoBfgUWRIPxQgVeKULQodneAgATM1gCABYKtAIAAMiWg
Date: Tue, 15 Jul 2025 07:44:06 +0000
Message-ID: <DM4PR11MB636083B3C1D1AF7690DE87D1F457A@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20250617041746.2884343-1-alex.hung@amd.com>
 <20250617041746.2884343-34-alex.hung@amd.com>
 <Mk2DCOdpZ75QLmGiZYM8GfnoMHRIGsx2S0_gzq2ryBHKEfLQMP5ArB3s94s8NYyci5xYBPN1md01QaUOqqlwKb3KxJIBRxMLO9yjoitMVJc=@emersion.fr>
 <9e116b0d-c46c-41f5-a953-7d17d22c98c5@amd.com>
 <SJ1PR11MB612940940934BD8499DA179FB957A@SJ1PR11MB6129.namprd11.prod.outlook.com>
In-Reply-To: <SJ1PR11MB612940940934BD8499DA179FB957A@SJ1PR11MB6129.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|BL1PR11MB5272:EE_
x-ms-office365-filtering-correlation-id: 14be8bdb-786d-418c-8906-08ddc373608b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?a1RCekc5b0IyRWdmc0dOZXF3bHJkYnBZcitCVFhoYjRWdzFSaDd4Q0c5TVFI?=
 =?utf-8?B?UGV4WUhnenNmK0R6ZGVHckhQTkt2NWVyZlI0WlZRVUxPUHk2OFJ5OWpNVlZ1?=
 =?utf-8?B?V3BicmlZT0lHQVg4YkxrSUt3U003VTBpcGE3dy9BK0xKQkVyYmtSSHpVam04?=
 =?utf-8?B?NTJEU0dVMFJHQzNTbHJqQVR2VFBueS9TTm9vdW41MTdvRWVpQU16NHNnazUy?=
 =?utf-8?B?cDNGaWYvZ1AwZUx3elRhTTdKenpLcDZ4ZXl2TXRTY2xJUzNaaXNaY2N2L25x?=
 =?utf-8?B?YU1UUkFYa3BZMXhwaXlZS1NvL0RjbkdFN3MwUStReVREc3pDVklpZThaMkNF?=
 =?utf-8?B?YklxbThNL1Jsb2VkS01MQTNnZGdvWkxwSTRlM1dlVG9CVXQvWEw2TXAycmc4?=
 =?utf-8?B?aytDYkVXWlArd1VnTm9iZmNoaUVadHJnc3o3MWxPaVMzYmpRS2ljeldyclFR?=
 =?utf-8?B?cTFZSjczZzRMQ0F1OWF1NGNoMVdpdlgzaWlzRUlpMGxSSzBvVTdnT0o1eHFh?=
 =?utf-8?B?QXNyOG56alR3VjBOOW45TCtOSjAwY0tCZm0vd0FvM3ljN2dvWTcvWjhid0F3?=
 =?utf-8?B?MXFOdVFSd0tTRk42R3dOUFhaa2t5Q0dMMGQvSHY5SkN0aWt6WktFb0tRdmVs?=
 =?utf-8?B?bG5aUzcyajdwenk4YUQwVGJZYVh4K1dia2pGSE5FRGs3eEVyMVpYUGNxak9L?=
 =?utf-8?B?MDFwaWhjTHUzRldyTmFTTTlVenF2Vlg4VE1TcGxZZldvc2RZUUgxYkYzMWE3?=
 =?utf-8?B?cWMwOEF5aUFYSm54Rlk0WWs4OW9hOHpNTWpGTjFuVUZUaUNtUTJlclFFeEZU?=
 =?utf-8?B?TnVTaGVOOWtNNXBSbjNWZjJWRlhMZFRWYzlYWUtzUDRzQ0owTzN4UFJCUy95?=
 =?utf-8?B?TVpVc05GOGpCb3FqMk44N1NiV3pkOFc3eUVrTGlGV2RtM3dzRWRQRGgyZFZk?=
 =?utf-8?B?c2x5TUNPOU8xOHhvU2Mzb0JOKzRseERUaG5pNWNWeWFlODBWMXh0c3dBdzN0?=
 =?utf-8?B?WGlhTGJ0VER0eU40Yk9SeUVpeTZqVFJSUVREeTdNU1ZNTWpwSE0xUWFUc1Fl?=
 =?utf-8?B?N1dXbWhtaVFYU25wbG8vODVtWk80aUxRQldCZVVPUUZBWWR5OW5UZjNya1I0?=
 =?utf-8?B?UUFXamFEUkI1QXpEV2pxRTFrU0VOcWN0blozMmNpS0YxTFF1R1U2cm84Q2JX?=
 =?utf-8?B?ZVZhc0Y5TGNFdkRzS3I2UmJoVzBKUDJES2V2K3poNWpOMlR0aW4xSDZGbW1v?=
 =?utf-8?B?bTQxRUhrUkJISDVudTRBbFRQK0t1bzNVR3dwUExFc2xwdTFabHBGbGcyaG9U?=
 =?utf-8?B?UXFTNm55R0thQWFnN05CQkJXTUw0ZXk1RzQ1Q0dWTEFweFlXdk12cVdadVkz?=
 =?utf-8?B?RmxVMHVCU2RGU0VtaXJQbUZWNkRoZXFCNjBIYnZjQ3FvbDRYWHBRc0llUm52?=
 =?utf-8?B?K0xNMzFDNnJOb3VBSlVHelJZSUt5dTJlamFkTWRsTnEzY1QzS3NidmtXV1lh?=
 =?utf-8?B?eGNmMlEwclJyRHk1b2lwUDhIZ0ZqYVBTb0kvaUdmV21PV1YyeVFwNHBwUm5v?=
 =?utf-8?B?Ykl4N0tCc0RPSjd2Um9FUHgxYitFb3ZXa0R2L3JRc21VRnlhbUtzTmhIQmhk?=
 =?utf-8?B?OUFOVW5rWkgyOVM3ZW0zWU0yMU8xL3RVOG5DMjlMWjBWdzdXbkpBY3k3U2Jx?=
 =?utf-8?B?Y2FrZUdHSVBWZEpGVlVsVGtEQ1VEZjZkZUx5aCtpdVRCamdXaDVMemdoTy9U?=
 =?utf-8?B?RDNEVW5RU0p6QmxITFZnZVl4YXB2aGVhVFBOSDRqK0wwb0Y1VVhZY2FOOVVR?=
 =?utf-8?B?SmlZeERsa2dGSVFzMlFpMHZ5UC9PWG9CWDlBSjhWRThjc3kwcFZ1TG9Db2lv?=
 =?utf-8?B?SVFBK3daVkd6ZzlUZ2ZHMUNXNTVYVHVSeHViSXBXd0dITCsvc1k1YnRzYm5K?=
 =?utf-8?B?R0N1ZDNVenBUUC95L2U3TndsS0N0ZG5xTnVHaW03TTlSblo0aHRlYmRreEMv?=
 =?utf-8?B?Y3k5RlhzS0t3PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?akIxVkNEdFRRRFF3YzBMcXdOVXJDNU0xU0MzZGVSMWozeEgvbFFXTnpralAz?=
 =?utf-8?B?WVZ3Vks5TjFpdDFqcC9tR2J0RHkzcWY1VDk2d1QwNGFnR29qcVlPUlp2b1NG?=
 =?utf-8?B?bmJkd1pJZGwrVjc4Q3o3YmdPS2VNZWN6WU9Vcy8rcGlDRjFRR1VyVkpneThy?=
 =?utf-8?B?ZzNmM2VjaUpOWTZScmIrdUk2dllKeVY0cnpWUUxDOXRya21Ybk9NOEl0dzUy?=
 =?utf-8?B?VFg4MHdGQXlnNnVLYXNoM3hvSlcvenpQK1FEZm10UGJwNWRaaXZiOWhHYTg2?=
 =?utf-8?B?TXpMSlJnT211Y09iV2RCSEh3akg3VnVTU01tQ3ZDMG9zRU0xTDVtSWZYMytx?=
 =?utf-8?B?TW9EbmFyampDMk5EVjhWYmo2bWxISTNFVm41WXpNSW5aN085S1dCU1RXUVdi?=
 =?utf-8?B?QzZxeW5rTkpPWXRibzE4Mm5HRGsxdUJLcDI0d0o1LzR2aUdWbm9adDRrb2oz?=
 =?utf-8?B?RC9RUEhTQUgyemU3b1AyWXhHY1p4R3o1TFFXMVFIWU8wZk1xNnM4SGNKSXlW?=
 =?utf-8?B?b290OW14eFBlM3ZyNitoN202U3JYYmZyOE9xdmpRVG9UM2ZPSHBwRThBOFY4?=
 =?utf-8?B?OXliSkFocFRTekNzSDFBWndGVzdmb0w4bTcvUlQ4T3pBVmFxY2hkMGVaV254?=
 =?utf-8?B?Z09IdTZVNjdCeVFlY3BESTVSSlVlOUZtYW1KaGkydDNaU1RyZEFUTlIrNWNM?=
 =?utf-8?B?clZWWXRMaFNSbk8yMmltRFlBbHRiMlFTVEFNeklDRWRUNjFhNXFVWnd5L1E2?=
 =?utf-8?B?MGtVa0l5MFYrclg0Rys4VFA3Q29WMmVCamo5bmQvNEJCR01XaEdOLzdnMzhG?=
 =?utf-8?B?RHFYQWUwMjBQNTA0T0x0TnVtZDZyaHM2S3dkdTE0QTFXdXpadmltTDVtamdQ?=
 =?utf-8?B?K2xuNUVWSFpOUHd6SVMrT3llSlNtRk80S0xlVkdzdnZ6K3FXNjlpNGFndENk?=
 =?utf-8?B?RE8wNEY4NE02ZGlSbDRiUUpLdE9jOGg1S3Iybk85T20xQnZUZkNaWUpHdGFJ?=
 =?utf-8?B?L04vbjhMckU4ZzNRRFM4RlQzbWdUb3ZKUlFZaUFwSVRoNXlSOFJWdTd0YzdU?=
 =?utf-8?B?Njl3emd4NmVYaThhKzVoOWdPc1NROGNDNEZtUUo4YkJBSVhlS3FVZFVtR0Fz?=
 =?utf-8?B?bUYrWWZHOHUxZGZ0c0dlY0RqZ2xLVzEzWEliOUFyM0tDKzEreEZ2bzdDaVpO?=
 =?utf-8?B?eW9RWnBuTERVaHFiMlljZFlkSDFTc2RUdHZMbXRRVUJGQ1JqOXYydEZVMEtZ?=
 =?utf-8?B?VXQzdVpXeFBJeXcrU1BRakhHT1ZjRDVQY2hxYmwrbGxHekl3d3V5eEVjSVVv?=
 =?utf-8?B?SktiODhNTUhlQVE1Z1BqOHJiK3pqUXpXN3Q4R2xSdk1aS3JkZUJzcVpvbURi?=
 =?utf-8?B?NUt3WEM1aHJBVExkeWxKeVEzWTZmaEJmTDNyMnRIcUdLcjdxbTJXYlppR253?=
 =?utf-8?B?MldnYlkvUGc5a3V5WUxtODJFTVc3K1FOMWh1VW5SN1hoa2ZzeDl1ZzQ5Y0g5?=
 =?utf-8?B?Mit0QnJ5TlY4cDkrc2c0MkJsS2JEdnBSKzlLV1o4bml3bytmc0swTEdUY083?=
 =?utf-8?B?QmtoUXlGRDEvRUlzL3NhWWhFU3JjeUNWS0gzejgxUDBDdldnTjBkdm1nb2xK?=
 =?utf-8?B?Z2NtcEgwSm9hdEJ2cmhmYWJkQjlUSUdaUXBDVUptQ1I1Y0tSaHh5OXRvaTR4?=
 =?utf-8?B?bDA1NXYvTG1IYVlGSDZlNUlGdWJKcDFCamtzSGlROHphaHdSTTNWc213aUpM?=
 =?utf-8?B?MjJWTWJuN2N3UGJPQlNZT2lmbStFYVM5NUJkTXN6VTRYSzg1Q1dwL2psaWxH?=
 =?utf-8?B?S1VyNEhCMU5HQjFjcUZPcEdnendtV2ZURWcvaW9UaVh1azhQUkVRWldvSVJE?=
 =?utf-8?B?YTR0VFlLTW1OOTNsSGR4d0lTa21oOGRGOWlJTUF6UytkQTkrdjB4V0pvVUpw?=
 =?utf-8?B?MUVQU3lmUnM1OVpIYjVUWFRzYnZabGRvb05PSitCMGdvYlArVlhLcytMeStX?=
 =?utf-8?B?YzAwUDAxeDlKMVJTeDRNU2dlRnpaMnJyMmR0eTlPS240MURtY3N4SDJqQ2Ev?=
 =?utf-8?B?Y3M2MVVqOUZGMldhQy82a0NBWlNXSTFMTWd4NEN6QnphdXJ5NlFXelA2ckJE?=
 =?utf-8?Q?PEcbQTnLC6RY2fep4MZGI1EPP?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14be8bdb-786d-418c-8906-08ddc373608b
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2025 07:44:06.4564 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5FofN6d6pDMcf9YdY8xBllDuUrT9tahfzJoxO6GxTTO2r7T5injb/INaaOTSrPbxuPNdnDgESQNyxMMo+TZjQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5272
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQm9yYWgsIENoYWl0YW55
YSBLdW1hciA8Y2hhaXRhbnlhLmt1bWFyLmJvcmFoQGludGVsLmNvbT4NCj4gU2VudDogVHVlc2Rh
eSwgSnVseSAxNSwgMjAyNSAxMDowOCBBTQ0KPiBUbzogQWxleCBIdW5nIDxhbGV4Lmh1bmdAYW1k
LmNvbT47IFNpbW9uIFNlciA8Y29udGFjdEBlbWVyc2lvbi5mcj47DQo+IFNoYW5rYXIsIFVtYSA8
dW1hLnNoYW5rYXJAaW50ZWwuY29tPg0KPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZzsgYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IHdheWxhbmQtDQo+IGRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZzsgaGFycnkud2VudGxhbmRAYW1kLmNvbTsgbGVvLmxpdUBhbWQu
Y29tOw0KPiB2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbTsgcGVra2EucGFhbGFuZW5AY29s
bGFib3JhLmNvbTsgbXdlbkBpZ2FsaWEuY29tOw0KPiBqYWRhaGxAcmVkaGF0LmNvbTsgc2ViYXN0
aWFuLndpY2tAcmVkaGF0LmNvbTsgc2hhc2hhbmsuc2hhcm1hQGFtZC5jb207DQo+IGFnb2luc0Bu
dmlkaWEuY29tOyBqb3NodWFAZnJvZ2dpLmVzOyBtZGFlbnplckByZWRoYXQuY29tOw0KPiBhbGVp
eHBvbEBrZGUub3JnOyB4YXZlci5odWdsQGdtYWlsLmNvbTsgdmljdG9yaWFAc3lzdGVtNzYuY29t
Ow0KPiBkYW5pZWxAZmZ3bGwuY2g7IHF1aWNfbmFzZWVyQHF1aWNpbmMuY29tOyBxdWljX2NicmFn
YUBxdWljaW5jLmNvbTsNCj4gcXVpY19hYmhpbmF2a0BxdWljaW5jLmNvbTsgbWFyY2FuQG1hcmNh
bi5zdDsgTGl2aXUuRHVkYXVAYXJtLmNvbTsNCj4gc2FzaGFtY2ludG9zaEBnb29nbGUuY29tOyBs
b3Vpcy5jaGF1dmV0QGJvb3RsaW4uY29tOyBhcnRodXJncmlsbG9AcmlzZXVwLm5ldA0KPiBTdWJq
ZWN0OiBSRTogW1BBVENIIFYxMCAzMy80Nl0gZHJtOiBBZGQgRW5oYW5jZWQgTFVUIHByZWNpc2lv
biBzdHJ1Y3R1cmUNCj4gDQo+IA0KPiANCj4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
PiA+IEZyb206IEFsZXggSHVuZyA8YWxleC5odW5nQGFtZC5jb20+DQo+ID4gU2VudDogRnJpZGF5
LCBKdWx5IDExLCAyMDI1IDk6NTkgUE0NCj4gPiBUbzogU2ltb24gU2VyIDxjb250YWN0QGVtZXJz
aW9uLmZyPjsgU2hhbmthciwgVW1hDQo+ID4gPHVtYS5zaGFua2FyQGludGVsLmNvbT4NCj4gPiBD
YzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmc7DQo+ID4gd2F5bGFuZC0gZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBoYXJy
eS53ZW50bGFuZEBhbWQuY29tOw0KPiA+IGxlby5saXVAYW1kLmNvbTsgdmlsbGUuc3lyamFsYUBs
aW51eC5pbnRlbC5jb207DQo+ID4gcGVra2EucGFhbGFuZW5AY29sbGFib3JhLmNvbTsgbXdlbkBp
Z2FsaWEuY29tOyBqYWRhaGxAcmVkaGF0LmNvbTsNCj4gPiBzZWJhc3RpYW4ud2lja0ByZWRoYXQu
Y29tOyBzaGFzaGFuay5zaGFybWFAYW1kLmNvbTsNCj4gYWdvaW5zQG52aWRpYS5jb207DQo+ID4g
am9zaHVhQGZyb2dnaS5lczsgbWRhZW56ZXJAcmVkaGF0LmNvbTsgYWxlaXhwb2xAa2RlLm9yZzsN
Cj4gPiB4YXZlci5odWdsQGdtYWlsLmNvbTsgdmljdG9yaWFAc3lzdGVtNzYuY29tOyBkYW5pZWxA
ZmZ3bGwuY2g7DQo+ID4gcXVpY19uYXNlZXJAcXVpY2luYy5jb207IHF1aWNfY2JyYWdhQHF1aWNp
bmMuY29tOw0KPiA+IHF1aWNfYWJoaW5hdmtAcXVpY2luYy5jb207IG1hcmNhbkBtYXJjYW4uc3Q7
IExpdml1LkR1ZGF1QGFybS5jb207DQo+ID4gc2FzaGFtY2ludG9zaEBnb29nbGUuY29tOyBCb3Jh
aCwgQ2hhaXRhbnlhIEt1bWFyDQo+ID4gPGNoYWl0YW55YS5rdW1hci5ib3JhaEBpbnRlbC5jb20+
OyBsb3Vpcy5jaGF1dmV0QGJvb3RsaW4uY29tOw0KPiA+IGFydGh1cmdyaWxsb0ByaXNldXAubmV0
DQo+ID4gU3ViamVjdDogUmU6IFtQQVRDSCBWMTAgMzMvNDZdIGRybTogQWRkIEVuaGFuY2VkIExV
VCBwcmVjaXNpb24NCj4gPiBzdHJ1Y3R1cmUNCj4gPg0KPiA+DQo+ID4NCj4gPiBPbiA3LzgvMjUg
MTE6MTAsIFNpbW9uIFNlciB3cm90ZToNCj4gPiA+IE9uIFR1ZXNkYXksIEp1bmUgMTd0aCwgMjAy
NSBhdCAwNjoyNiwgQWxleCBIdW5nIDxhbGV4Lmh1bmdAYW1kLmNvbT4NCj4gPiB3cm90ZToNCj4g
PiA+DQo+ID4gPj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9kcm0vZHJtX21vZGUuaA0KPiA+
ID4+IGIvaW5jbHVkZS91YXBpL2RybS9kcm1fbW9kZS5oIGluZGV4IDY1MWJkZjQ4Yjc2Ni4uMjFi
ZDk2ZjQzN2UwDQo+ID4gMTAwNjQ0DQo+ID4gPj4gLS0tIGEvaW5jbHVkZS91YXBpL2RybS9kcm1f
bW9kZS5oDQo+ID4gPj4gKysrIGIvaW5jbHVkZS91YXBpL2RybS9kcm1fbW9kZS5oDQo+ID4gPj4g
QEAgLTg3Miw2ICs4NzIsMTYgQEAgc3RydWN0IGRybV9jb2xvcl9sdXQgew0KPiA+ID4+ICAgCV9f
dTE2IHJlc2VydmVkOw0KPiA+ID4+ICAgfTsNCj4gPiA+Pg0KPiA+ID4+ICtzdHJ1Y3QgZHJtX2Nv
bG9yX2x1dF8zMiB7DQo+ID4gPg0KPiA+ID4gU3ViamVjdGl2ZSBuaXQ6IEkgd291bGQgcGVyc29u
YWxseSBwcmVmZXIgImx1dDMyIiBvdmVyICJsdXRfMzIiLCBidXQNCj4gPiA+IHRoYXQncyB2ZXJ5
IGRlZXAgaW50byBiaWtlLXNoZWRkaW5nIHRlcnJpdG9yeS4gRmVlbCBmcmVlIHRvIGlnbm9yZS4N
Cj4gPg0KPiA+IEkgdGhpbmsgaXQncyBhIGdvb2QgaWRlYS4NCj4gPg0KPiA+IEkgZ290IHRoaXMg
ZnJvbSBVbWEncyBwYXRjaHNldC4gSSB3aWxsIHN5bmMgdXAgd2l0aCBoaW0gdG8gYXZvaWQNCj4g
PiBmdXR1cmUgY29uZmxpY3RzLg0KPiA+DQo+IA0KPiBKdXN0IGZvciB0aGUgcmVjb3JkLCB3ZSB0
b29rIHNvbWUgaW5zcGlyYXRpb24gZnJvbSBzdHJ1Y3QgZHJtX2NvbG9yX2N0bV8zeDQgZm9yDQo+
IHRoaXMuDQo+IFRoYXQgc2FpZCwgSSBkb27igJl0IG1pbmQgdGhlIGJpa2Utc2hlZGRpbmcg4oCU
IG5hbWluZyB0aGluZ3MgaXMgaGFsZiB0aGUgZnVuIGFueXdheS4NCj4gSGFwcHkgdG8gZ28gd2l0
aCBsdXQzMiBpZiB0aGF0IGxvb2tzIGJldHRlciENCj4gDQo+IEBVbWEgZmVlbCBmcmVlIHRvIGRp
c2FncmVlLg0KDQpZZWFoLCBBZ3JlZS4gQWxzbyBBbGV4LCB5b3UgY2FuIG1ha2UgdGhlIGNoYW5n
ZSBhbmQgaGF2ZSBpdCBhcyBwYXJ0IG9mIHlvdXIgc2VyaWVzLg0KTGV0IHVzIGtub3cgaWYgYW55
IGhlbHAgbmVlZGVkLg0KDQpSZWdhcmRzLA0KVW1hIFNoYW5rYXINCg0KPg0KPiBSZWdhcmRzDQo+
IA0KPiBDaGFpdGFueWENCj4gDQo+ID4gPg0KPiA+ID4+ICsJLyoNCj4gPiA+PiArCSAqIFNpbWls
YXIgdG8gZHJtX2NvbG9yX2x1dCBidXQgZm9yIGhpZ2ggcHJlY2lzaW9uIExVVHMNCj4gPiA+PiAr
CSAqLw0KPiA+ID4NCj4gPiA+IEluc3RlYWQgb2YgdGhpcyBjb2RlIGNvbW1lbnQsIHdvdWxkIGJl
IG5pY2VyIHRvIGhhdmUgYSBwcm9wZXIgZG9jDQo+ID4gY29tbWVudC4NCj4gPiA+IEluIGRvYyBj
b21tZW50cywgInN0cnVjdCBYWFgiIGlzIGVub3VnaCB0byBjcmVhdGUgYSBsaW5rLiAoc3RydWN0
DQo+ID4gPiBkcm1fY29sb3JfbHV0IGRvZXNuJ3QgaGF2ZSBhIGRvYyBjb21tZW50LCBidXQgaGFz
IGJlZW4gaW50cm9kdWNlZA0KPiA+ID4gYWdlcw0KPiA+ID4gYWdvLikNCj4gPiA+DQo+ID4gPiAi
aGlnaCBwcmVjaXNpb24iIGlzIGEgYml0IHN1YmplY3RpdmUsIHByb2liYWJseSAiMzItYml0IHBy
ZWNpc2lvbiINCj4gPiA+IHdvdWxkIGJlIGJldHRlci4NCj4gPiA+DQo+ID4gPj4gKwlfX3UzMiBy
ZWQ7DQo+ID4gPj4gKwlfX3UzMiBncmVlbjsNCj4gPiA+PiArCV9fdTMyIGJsdWU7DQo+ID4gPj4g
KwlfX3UzMiByZXNlcnZlZDsNCj4gPiA+PiArfTsNCj4gPiA+PiArDQo+ID4gPj4gICAvKioNCj4g
PiA+PiAgICAqIGVudW0gZHJtX2NvbG9yb3BfdHlwZSAtIFR5cGUgb2YgY29sb3Igb3BlcmF0aW9u
DQo+ID4gPj4gICAgKg0KPiA+ID4+IEBAIC04NzksNiArODg5LDcgQEAgc3RydWN0IGRybV9jb2xv
cl9sdXQgew0KPiA+ID4+ICAgICogYW5kIGRlZmluZXMgYSBkaWZmZXJlbnQgc2V0IG9mIHByb3Bl
cnRpZXMuIFRoaXMgZW51bSBkZWZpbmVzDQo+ID4gPj4gYWxsIHR5cGVzDQo+ID4gYW5kDQo+ID4g
Pj4gICAgKiBnaXZlcyBhIGhpZ2gtbGV2ZWwgZGVzY3JpcHRpb24uDQo+ID4gPj4gICAgKi8NCj4g
PiA+PiArDQo+ID4gPg0KPiA+ID4gTml0OiBwcm9iYWJseSB0aGlzIGV4dHJhIG5ld2xpbmUgc2hv
dWxkIGdldCBkcm9wcGVkPw0KPiA+ID4NCj4gPiA+PiAgIGVudW0gZHJtX2NvbG9yb3BfdHlwZSB7
DQo+ID4gPj4gICAJLyoqDQo+ID4gPj4gICAJICogQERSTV9DT0xPUk9QXzFEX0NVUlZFOg0KPiA+
ID4+IC0tDQo+ID4gPj4gMi40My4wDQoNCg==
