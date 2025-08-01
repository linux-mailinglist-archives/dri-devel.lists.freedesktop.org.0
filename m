Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E32DB183A1
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 16:23:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C360310E883;
	Fri,  1 Aug 2025 14:23:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FQoFoxvc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C406810E883;
 Fri,  1 Aug 2025 14:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754058195; x=1785594195;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=poRAuPAB/IWtMbBRPtMWMFGRW0e2N0Nwkik82mC9f/0=;
 b=FQoFoxvcVmFD9aFU4uNlaCnWlQua2nNdknnbK6rQZKIblxyvaTdogb/x
 aLTvPnDJb9K9+9/mu6ONpxMAhiNuWniJ1Ks+Hv3Cld79fclBFyQ3yCCeB
 fY1cHzB5vzOoQOqpLt1TTGJ9M/4QUsyuTsgZGPB9LuqqMcduDpPFVyJCH
 XDv2N7HXesKuDAqIZ3piJ+mCZ12PYjKygINfBFNolKNz1ghSlQcIImf/5
 55wsUQDCPhor/usEVMDFEjkBma/3yTG7qy4sGofCUtnN8yJnPt4kDbJc5
 5/4xZCKywecGLLI67gMqJBPta9ILIuIIMTfoMQUIa9tzITNa7F/LRMEZM Q==;
X-CSE-ConnectionGUID: eVJz2UyIQLuXsBWV44kLpQ==
X-CSE-MsgGUID: s6FX3DwXQpCKl6ucT5WcGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="56485175"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="56485175"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 07:23:14 -0700
X-CSE-ConnectionGUID: tXozDTxlSLOIqvXyDKZvdQ==
X-CSE-MsgGUID: GjoUJg7KQzOl92rfxrATtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="200733582"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 07:23:14 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 1 Aug 2025 07:23:13 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 1 Aug 2025 07:23:13 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.45)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 1 Aug 2025 07:23:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kM7mfw7Q77rs+tRZimBVlJ+0lNA/Sjij54F5jV3WjMKhEcNW9hfO4jRBpg4cF1aRYfwZ08nT8GXj0ByteiEsTGoQEslgiVbmGXVQjh09uDipn5uyYf7626K6xR8ECM90DeVCEwsEswElohI2Qwenq5PmUdwUdJ3R7XVOGuyjkPdlmk2J7OxFPdhY1lDqIaw32MaWAQ+P6MNE1UNyvHf/T7kiHhFb7Qga8FE/rH4swZMPWTQKsqn9kVzXIL2afnVA4UOld44xOs7O2xnA2iuwy0/G9UANRx7YL6CG4+InnVHN/DpHx3VMWl+eyDf8LHc8YrY87Z/9B9cf59zEjRj3YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=poRAuPAB/IWtMbBRPtMWMFGRW0e2N0Nwkik82mC9f/0=;
 b=YsvRuw/zF4pd30QhBlsDszxi5mcCazjH243yXf7El4+jDIOMGXqk5EPOMTgfR8bGx7HTJ354p32l7mc502QsGtT2vjd84G9SjcMas8N+3CVFN4E3FJAnDhsmy9C+Pe9ipixIcum7DGTO97x/SCU1TXSu6fFhRIztafIbyXeezouK7Umz1efnCERxuh6t6eppsqT8PbgCxZ75MMezO7sxhcB6yZFCwqB7MnJfL4Ua1MHkiH7Tyuubw/jdidng7KRsBoX/YbZabVe6i28SnCk9LoWrWt46bU2Ah078OQnmBPd8zmraR35iUXTCHRFX/h0f/4mz+geQGnn+OmsYc/VEVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by SA1PR11MB6966.namprd11.prod.outlook.com
 (2603:10b6:806:2bc::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Fri, 1 Aug
 2025 14:23:10 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::76e3:aa2a:a205:819f]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::76e3:aa2a:a205:819f%7]) with mapi id 15.20.8989.013; Fri, 1 Aug 2025
 14:23:10 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>, Dmitry Baryshkov
 <dmitry.baryshkov@oss.qualcomm.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, Harry Wentland <harry.wentland@amd.com>, "Leo
 Li" <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>, "Alex
 Deucher" <alexander.deucher@amd.com>, =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?=
 <christian.koenig@amd.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Liviu Dudau <liviu.dudau@arm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Clark
 <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, "Abhinav
 Kumar" <abhinav.kumar@linux.dev>, Jessica Zhang
 <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, Laurent Pinchart
 <laurent.pinchart+renesas@ideasonboard.com>, Tomi Valkeinen
 <tomi.valkeinen+renesas@ideasonboard.com>, Kieran Bingham
 <kieran.bingham+renesas@ideasonboard.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, "Dave
 Stevenson" <dave.stevenson@raspberrypi.com>, =?utf-8?B?TWHDrXJhIENhbmFs?=
 <mcanal@igalia.com>, Raspberry Pi Kernel Maintenance
 <kernel-list@raspberrypi.com>
CC: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 8/8] drm: writeback: rename
 drm_writeback_connector_init_with_encoder()
Thread-Topic: [PATCH 8/8] drm: writeback: rename
 drm_writeback_connector_init_with_encoder()
Thread-Index: AQHcAutvtF48Hd1pDUSGm6UrRS1SEbRN1YcAgAAEG+A=
Date: Fri, 1 Aug 2025 14:23:10 +0000
Message-ID: <DM3PPF208195D8DB87B912E14EB611D075BE326A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20250801-wb-drop-encoder-v1-0-824646042f7d@oss.qualcomm.com>
 <20250801-wb-drop-encoder-v1-8-824646042f7d@oss.qualcomm.com>
 <3c522dd8-0e56-4ab3-84da-d9193137d4fe@bootlin.com>
In-Reply-To: <3c522dd8-0e56-4ab3-84da-d9193137d4fe@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|SA1PR11MB6966:EE_
x-ms-office365-filtering-correlation-id: 4a5ec1d0-41f8-4e94-6359-08ddd106f175
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|921020|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?RTBGRU1SRDFwR1JPNmZaZkQraWROcEk5a1Z4WTVRU0d0M1F6b2tPZkZMZFQ0?=
 =?utf-8?B?Y0VlYXZ6SW9iVFFkRytUTVhPa1NTOGE3MVcyd1IvU2Z6WkxIbHR4bkFGTGl4?=
 =?utf-8?B?K2ZhUGRsRXl0ZGtsK3hYeFp5bDEzOFhaNkEycFlaVThwSHkwM3Q4djgxcTkz?=
 =?utf-8?B?N1liTEJPOFNrYmpXMmsxcVIyak5abmxrYU51WjFCOWd1K2JvcVhLS1FDbldw?=
 =?utf-8?B?ekljRWZjcEVaYlgvQ3RURkpOZEJTUW1IN3YwVWJUR0psWGIxVWtQeG1lRmZL?=
 =?utf-8?B?a3V5RWpVeE4wZ21HdnJ1YmRpbnoyMVpxNnEzRTVHL0FaeU03L2pUeFFnTzZW?=
 =?utf-8?B?QnVubVl2Nmh5UkRNTEZBOXVQTjFPdEdaR1FVdUVKckE1N0g0TFpMTTVXZVd4?=
 =?utf-8?B?STdlQjJxV2xoRFZ2UXprQzJJZXFjd1RTOXlOdW41cnRRMHpvbnNNNlBmenE0?=
 =?utf-8?B?RzdvdWdtVzFIQUxsNUdVV1RpeHJyUnA4c3dTMHp3aXBvNGE2dEdMNmJPbkVP?=
 =?utf-8?B?WFZkWEZDQS9Td1Q5YVg4am14SlBQMk01bEF4bjhCb1U2amhmc0twUS9Rcmw5?=
 =?utf-8?B?dG5HeUdEN3JtVkdRbmdNQ3k5TDhxY3VpdVlYUVNJRUE0SFcyM2NodG10cEdr?=
 =?utf-8?B?ZkEyREJLdGt5Wm9BNHRIME9Zc3RQTUZ1M0IvOG9lYUtCZnIvMnRVUFphc1lC?=
 =?utf-8?B?c1BLZkx5WGl5WU84ajZ0c0ZBOHNxSjJEaDZUeUd1bExFc1dGdHZJbmhvd2RC?=
 =?utf-8?B?WDIzWDhyZ1Z2QSt5eVZaRzdNL0xOZlp3OWt4cis3WjQyVXNYWGdhSWNhN296?=
 =?utf-8?B?V1dPckJjNDRmeHNNSFNJbHg5eUo2SXkvS25WUmYxUGs1K0x3ZVl1ZDFIRDA5?=
 =?utf-8?B?NmRHMW9oTWFaaUZkUXRJbHNaZmJqZ2ZZRFZNZlA2YnJqZEVEZFgrUUxFOFB2?=
 =?utf-8?B?UHJhcjQyZkRlRW5QNFJoU0NjYUI0K05raXFNeUpJKzBFZnRaN1poUVNjSmVP?=
 =?utf-8?B?eWVWK3dhTEJpMVN0ZnFPZUZjSms5RkFGT2d1dkJzQ3NEMW5PSGdYNkZ4YWht?=
 =?utf-8?B?YklEUERxcUllRnRNaldBRDFrbFZydXljZTNWMFFwclU1d2JBRTI4SjlqNHIz?=
 =?utf-8?B?cTRJOTFCUkY0N29WNU9zNzY3a3NyckkxOHlBWTFHc3AzcTdzb3pHNzhBWStR?=
 =?utf-8?B?T0pmVWhqMEp5aXRwaTRnbXQ2T21rWHhNN25zY3BzejhRVWc2c3UzZDhrdGY4?=
 =?utf-8?B?SUtrQXlqZU4ydlJyK05tdExvWUJCL2VvOEJ2N3p4bUh1ZFYzK0w2VEVXenR3?=
 =?utf-8?B?NURBVkhaalFzTFVzbWI5dVppVVhoVFpjRjJJeHArbmNrV0VYbU5oMnJxa09R?=
 =?utf-8?B?MTBiN0ZNWDlLTytxczVvSDNtSk1lTGFkNUFTeHBzWHlHY1psWXlTZ1Q0Um00?=
 =?utf-8?B?RGExRkIrL1NqUTM4TkZKUXA0TWJ3NFlhK2pOSm0wNGxkL2NQdVFBVDFab1J5?=
 =?utf-8?B?d0p1TWpuOTVhSVN0U1lEY2xJUlJFaGtDeEpta2MxME5FMEJpc2ovRGJ0QnNI?=
 =?utf-8?B?OVBaTnRDazRHdERnSUExVWxsY3NuaGFGVzVZZWJWY1VzaWRVMU5Vbkw1UUhR?=
 =?utf-8?B?NnA0eEo4WUVUOFJqaWRkWUpnNHNvenZqZzUwQ0YvRndZQW5JeWpQaUtCVEVz?=
 =?utf-8?B?QStlMzNGQ1FpNzloekdzMy9kY1o3aFd4QitNMjBaZC9JRjNIeVI2Tlo0L0tE?=
 =?utf-8?B?K3NpTHg4K2p1WG0wWnNYWGJvekYrbWRIck1zOVBZeWE2SGRQeG8xdGtlaG4w?=
 =?utf-8?B?R2RQSmRDTndwU1VDa1A2ZzVsNDRlOXZnY2J3QnlhZFVTRmNsMEp4dVV4M2p6?=
 =?utf-8?B?WXVjNFlVd0FHV3dialpoWndWcGFZKzJyVWJMdGpsTCtsaGEwMG16by90NmRo?=
 =?utf-8?Q?/UpO79kTTeNzo/pEXQOlqAsHr4jRbYrZ?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SUNWekN0Vml4YTB2Zm9DcXM2WTh3aXBxMGV3akJNSzVGWHNxSWQ5N29pUEE1?=
 =?utf-8?B?KzRraFhQOHlXY2QwenVUcmNldmc5REdTcUlwcXlsYVFhKzUraUpHS01zVWRt?=
 =?utf-8?B?anRxamhaVUlOVlJsQ3AxSEZGY29MbHRFKzV6RlZwOXB5R3FhTHA4emE0aUdW?=
 =?utf-8?B?QjN4NFNEcjRaeUMxNWpFZFZLNGZXREtWeHM0UVRmQml0RkhXZjBNYm9jNmo0?=
 =?utf-8?B?K3lNNTNGTnN2aExYWUVvSUVqOHlzT0Y0dHVILzhLekl4WXFWN2IrTldyVkNz?=
 =?utf-8?B?UUpmYUx3c1hyS0d3QVhUUzQ0Nk56T2ZIcEJ1Y2Nscit1MHdkeTNqbEQ5dE4w?=
 =?utf-8?B?ZTV2YlZ1QXFGcG1seWh0MTBBczcwQkU0OVRFLzRaQVRqWFRwcm5sbGF0Ung4?=
 =?utf-8?B?Qm1heVJiaUhhTjlNbjRlTE9tR2VVeWFwZjJvTS83blRKWlJQOHpKQVR5Z2lw?=
 =?utf-8?B?d21oa1k3RGJsWmhlZnZhK0V5anlJNGZwY2VLUWYwREpHeStnZnlqbEdsNDBx?=
 =?utf-8?B?VEM4cWI1NHZrdThBTStGMVdlWVZvZVo1Y0ZrV2Q5QTVjQXZBOTVpUDRjWDhJ?=
 =?utf-8?B?U1NwT2lDZ2lpcHR5a0dLakdQYVlYc0pCYW9qcXYvL3YyRDBYSTJvdTBTdlhv?=
 =?utf-8?B?dTRlRWtpbXdZVHhEUG5WVjcrZlRyeC9vdXNPVFRhQ2FzdDdoUnk4enpjYW42?=
 =?utf-8?B?MFZvQWgvVDhBUnhGc3N4WjA5T2VjeU1hamkyYnVGUng5ZW81U0xSMldyN3J1?=
 =?utf-8?B?N3VOa0QvSmtmWm5GVkZGUEZFc3dEclZTRDBQTWFESDdMNno2VVJOdzBhdVJH?=
 =?utf-8?B?MjMrL0MweVptRC90b2ExSTl2eDBqMEhmbHEyQlljNCtQLzJaSkJtOVY0K2gr?=
 =?utf-8?B?cUljTHVoeHM0Tm1uU21mc0dSajQvR2lUWGlVaGdNeTc0VUQzVU5YM21RS1p2?=
 =?utf-8?B?UXFUdmRNUjU3azNFeGs3U21qaGNpdVdWR3NHWWFPZTltQStKbmVmTjd2R2pO?=
 =?utf-8?B?SmVnYjhTQnZOUFlWZFFZUnZUN0J6SFU0NXpOcnpBcnZkaGI1VFUvZ2Zyd011?=
 =?utf-8?B?RS9wdVFOTjdZT0J4TVl5UkN1RnJmOWJ2a0E2bUN0VWZsRHYyUFg1Wmpqektv?=
 =?utf-8?B?RUxaQ3hrdWxzWVRrMlpPVWNHVXgxRzBxaVl6NG11MEYxWXZvQkQyQjVOV2lv?=
 =?utf-8?B?d3FEa1NxLzhVakl5MmxqTU1CL0J1dDFDVXJoT0dFOHc0ZU1kRVpqc1hUQjQ2?=
 =?utf-8?B?V1h6U0lraG4xWkpVV3NrZDNTUFVVbkNGaGgrV3pORDl4TW1DRmdxOXRtZGxI?=
 =?utf-8?B?dXdUcW14MyttNk5OOXE4MmhJVDgyZkZaRUp0YVNjRVVodll4QkxvY09ONnZr?=
 =?utf-8?B?amw3WXFxd3dlQ2J3K05PSU5tN3pTc2FJeWswUWVDbkFTZDkxZ1pGdVhjakt6?=
 =?utf-8?B?bXR4Q2F5VXpobWN3YzV5RSt0cFFEa24yZWxNbFBUV0JCcEdjWlo2VkxCci9v?=
 =?utf-8?B?OXF2N09kSFR5SVF5YVZFb0kvQWdQQ0xXdGtZUDV0cjRRVGc0UEg0cWpHNFBL?=
 =?utf-8?B?M0V5RDRZbTFVT0duOVVGdXlGdGQwbDhQMWNodFRUQkdoOWZ3WHlCNjZQNVZE?=
 =?utf-8?B?VW1nLzlYRG14ZGF2LytxeUpXSFE3QndPSk5DeFZveEpZeGxuWTFwTW1hYXZ4?=
 =?utf-8?B?dFNhVkdKTW9LTGtFMXEyRXlDdWREcWFIVWQxQmNCNmRqUkZENG5ZZDU4a3dZ?=
 =?utf-8?B?NzlRalVSYlRVQXdaYnNIdVV0TUgwb01UWGwwanNMdWM3eHpjdFVneDhVVk9V?=
 =?utf-8?B?UFVGeXlndVdhT3c0Z2cwNUxnODJTTExaUnE5V0VTZUpoa2ZST2RCSmtOL1ZF?=
 =?utf-8?B?SmFxaG1rSE5ycGZINFZEenhHK3ZQVDBsRTdPVzRHZ1RPSjFrZS9oTExYUDVr?=
 =?utf-8?B?R2tCZ29wUnZGVkNPRU5wTW5GZnljb2ppN2VMdVA3enEvYU1oQ2ZZWkNpcGdF?=
 =?utf-8?B?R2M4ZXBaVVU0R2xDY1ZxVDZzaVRuUGkxb1RsN2lJMmNBb3ZJTW5MUEMxVnd0?=
 =?utf-8?B?MjNHcDZlRjVaOEVVUVpJei9FWTZxcm5kNW15VmEwQXlZWWlEOFhUdkQ3bzFJ?=
 =?utf-8?Q?W01cIqPdYVtCAq5NXC3eY5k1h?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a5ec1d0-41f8-4e94-6359-08ddd106f175
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2025 14:23:10.7211 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: btvoxaga5/hlo91o5YH6QYfNp46ujQF3BsipvzssQ6mIfVFazhUVSqLcCJo90QPZzVime1wHegsmlZImPAu2FA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6966
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

PiBTdWJqZWN0OiBSZTogW1BBVENIIDgvOF0gZHJtOiB3cml0ZWJhY2s6IHJlbmFtZQ0KPiBkcm1f
d3JpdGViYWNrX2Nvbm5lY3Rvcl9pbml0X3dpdGhfZW5jb2RlcigpDQoNClNhbWUgaGVyZSBkcm0v
d3JpdGViYWNrDQoNClJlZ2FyZHMsDQpTdXJhaiBLYW5kcGFsDQoNCj4gDQo+IA0KPiANCj4gTGUg
MDEvMDgvMjAyNSDDoCAxNTo1MSwgRG1pdHJ5IEJhcnlzaGtvdiBhIMOpY3JpdMKgOg0KPiA+IFJl
bmFtZSBkcm1fd3JpdGViYWNrX2Nvbm5lY3Rvcl9pbml0X3dpdGhfZW5jb2RlcigpIHRvDQo+ID4g
ZHJtX3dyaXRlYmFja19jb25uZWN0b3JfaW5pdCgpIGFuZCBhZGFwdCBpdHMgaW50ZXJmYWNlIHRv
IGZvbGxvdw0KPiA+IGRybW1fd3JpdGViYWNrX2Nvbm5lY3Rvcl9pbml0KCkuDQo+ID4NCj4gPiBT
aWduZWQtb2ZmLWJ5OiBEbWl0cnkgQmFyeXNoa292IDxkbWl0cnkuYmFyeXNoa292QG9zcy5xdWFs
Y29tbS5jb20+DQo+ID4gLS0tDQo+ID4gICBkcml2ZXJzL2dwdS9kcm0vZHJtX3dyaXRlYmFjay5j
IHwgMTQgKysrKysrKy0tLS0tLS0NCj4gPiAgIGluY2x1ZGUvZHJtL2RybV93cml0ZWJhY2suaCAg
ICAgfCAxMCArKysrKy0tLS0tDQo+ID4gICAyIGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMo
KyksIDEyIGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fd3JpdGViYWNrLmMNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fd3JpdGViYWNrLmMg
aW5kZXgNCj4gPg0KPiAxYTAxZGY5MWIyYzU4NjhlMTU4ZDQ4OWI3ODJmNGM1N2M2MWEyNzJjLi5l
YzI1NzVjNGMyMWI3NDQ5NzA3YjA1OTUzDQo+IDIyZQ0KPiA+IDIyMDJhMGNmOTg2NSAxMDA2NDQN
Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3dyaXRlYmFjay5jDQo+ID4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2RybV93cml0ZWJhY2suYw0KPiA+IEBAIC0yMzUsNyArMjM1LDcgQEAgc3Rh
dGljIGludCBfX2RybV93cml0ZWJhY2tfY29ubmVjdG9yX2luaXQoc3RydWN0DQo+IGRybV9kZXZp
Y2UgKmRldiwNCj4gPiAgIH0NCj4gPg0KPiA+ICAgLyoqDQo+ID4gLSAqIGRybV93cml0ZWJhY2tf
Y29ubmVjdG9yX2luaXRfd2l0aF9lbmNvZGVyIC0gSW5pdGlhbGl6ZSBhIHdyaXRlYmFjaw0KPiA+
IGNvbm5lY3RvciB3aXRoDQo+ID4gKyAqIGRybV93cml0ZWJhY2tfY29ubmVjdG9yX2luaXQgLSBJ
bml0aWFsaXplIGEgd3JpdGViYWNrIGNvbm5lY3Rvcg0KPiA+ICsgd2l0aA0KPiA+ICAgICogYSBj
dXN0b20gZW5jb2Rlcg0KPiANCj4gSWYgSSB1bmRlcnN0b29kIGNvcnJlY3RseSB5b3VyIHNlcmll
cyB5b3Ugd2FudCB0byByZWR1Y2UgdGhlIHVzYWdlIG9mIG5vbi0NCj4gZHJtbSB3cml0ZWJhY2ss
IHNvIG1heWJlIHdlIGNhbiBhZGQgYSBjb21tZW50IHRvIGRpcmVjdCBwb2VwbGUgdG8gZHJtbQ0K
PiB2YXJpYW50IHRvIGF2b2lkIG5ldyB1c2FnZSBvZiB0aGlzIEFQST8NCj4gDQo+IFdpdGggb3Ig
d2l0aG91dCB0aGlzOg0KPiANCj4gUmV2aWV3ZWQtYnk6IExvdWlzIENoYXV2ZXQgPGxvdWlzLmNo
YXV2ZXRAYm9vdGxpbi5jb20+DQo+IA0KPiA+ICAgICoNCj4gPiAgICAqIEBkZXY6IERSTSBkZXZp
Y2UNCj4gPiBAQCAtMjYzLDExICsyNjMsMTEgQEAgc3RhdGljIGludCBfX2RybV93cml0ZWJhY2tf
Y29ubmVjdG9yX2luaXQoc3RydWN0DQo+IGRybV9kZXZpY2UgKmRldiwNCj4gPiAgICAqDQo+ID4g
ICAgKiBSZXR1cm5zOiAwIG9uIHN1Y2Nlc3MsIG9yIGEgbmVnYXRpdmUgZXJyb3IgY29kZQ0KPiA+
ICAgICovDQo+ID4gLWludCBkcm1fd3JpdGViYWNrX2Nvbm5lY3Rvcl9pbml0X3dpdGhfZW5jb2Rl
cihzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LA0KPiA+IC0JCQkJCSAgICAgIHN0cnVjdCBkcm1fd3Jp
dGViYWNrX2Nvbm5lY3Rvcg0KPiAqd2JfY29ubmVjdG9yLA0KPiA+IC0JCQkJCSAgICAgIHN0cnVj
dCBkcm1fZW5jb2RlciAqZW5jLA0KPiA+IC0JCQkJCSAgICAgIGNvbnN0IHN0cnVjdCBkcm1fY29u
bmVjdG9yX2Z1bmNzDQo+ICpjb25fZnVuY3MsDQo+ID4gLQkJCQkJICAgICAgY29uc3QgdTMyICpm
b3JtYXRzLCBpbnQgbl9mb3JtYXRzKQ0KPiA+ICtpbnQgZHJtX3dyaXRlYmFja19jb25uZWN0b3Jf
aW5pdChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LA0KPiA+ICsJCQkJIHN0cnVjdCBkcm1fd3JpdGVi
YWNrX2Nvbm5lY3Rvcg0KPiAqd2JfY29ubmVjdG9yLA0KPiA+ICsJCQkJIGNvbnN0IHN0cnVjdCBk
cm1fY29ubmVjdG9yX2Z1bmNzDQo+ICpjb25fZnVuY3MsDQo+ID4gKwkJCQkgc3RydWN0IGRybV9l
bmNvZGVyICplbmMsDQo+ID4gKwkJCQkgY29uc3QgdTMyICpmb3JtYXRzLCBpbnQgbl9mb3JtYXRz
KQ0KPiA+ICAgew0KPiA+ICAgCXN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IgPSAmd2Jf
Y29ubmVjdG9yLT5iYXNlOw0KPiA+ICAgCWludCByZXQ7DQo+ID4gQEAgLTI4NCw3ICsyODQsNyBA
QCBpbnQNCj4gPiBkcm1fd3JpdGViYWNrX2Nvbm5lY3Rvcl9pbml0X3dpdGhfZW5jb2RlcihzdHJ1
Y3QgZHJtX2RldmljZSAqZGV2LA0KPiA+DQo+ID4gICAJcmV0dXJuIHJldDsNCj4gPiAgIH0NCj4g
PiAtRVhQT1JUX1NZTUJPTChkcm1fd3JpdGViYWNrX2Nvbm5lY3Rvcl9pbml0X3dpdGhfZW5jb2Rl
cik7DQo+ID4gK0VYUE9SVF9TWU1CT0woZHJtX3dyaXRlYmFja19jb25uZWN0b3JfaW5pdCk7DQo+
ID4NCj4gPiAgIC8qKg0KPiA+ICAgICogZHJtX3dyaXRlYmFja19jb25uZWN0b3JfY2xlYW51cCAt
IENsZWFudXAgdGhlIHdyaXRlYmFjayBjb25uZWN0b3INCj4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVk
ZS9kcm0vZHJtX3dyaXRlYmFjay5oIGIvaW5jbHVkZS9kcm0vZHJtX3dyaXRlYmFjay5oDQo+ID4g
aW5kZXgNCj4gPg0KPiA4NzljYTEwMzMyMGNjMjI1ZmZiMzY4NzQxOTA4ODM2MTMxNTUzNWZjLi45
NTg0NjZhMDVlNjA0YjM4NzcyMjYxMGZjMQ0KPiAxZg0KPiA+IDllODQxMzE2ZDIxYiAxMDA2NDQN
Cj4gPiAtLS0gYS9pbmNsdWRlL2RybS9kcm1fd3JpdGViYWNrLmgNCj4gPiArKysgYi9pbmNsdWRl
L2RybS9kcm1fd3JpdGViYWNrLmgNCj4gPiBAQCAtMTM3LDExICsxMzcsMTEgQEAgZHJtX2Nvbm5l
Y3Rvcl90b193cml0ZWJhY2soc3RydWN0DQo+IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcikNCj4g
PiAgIAlyZXR1cm4gY29udGFpbmVyX29mKGNvbm5lY3Rvciwgc3RydWN0IGRybV93cml0ZWJhY2tf
Y29ubmVjdG9yLCBiYXNlKTsNCj4gPiAgIH0NCj4gPg0KPiA+IC1pbnQgZHJtX3dyaXRlYmFja19j
b25uZWN0b3JfaW5pdF93aXRoX2VuY29kZXIoc3RydWN0IGRybV9kZXZpY2UgKmRldiwNCj4gPiAt
CQkJCXN0cnVjdCBkcm1fd3JpdGViYWNrX2Nvbm5lY3Rvcg0KPiAqd2JfY29ubmVjdG9yLA0KPiA+
IC0JCQkJc3RydWN0IGRybV9lbmNvZGVyICplbmMsDQo+ID4gLQkJCQljb25zdCBzdHJ1Y3QgZHJt
X2Nvbm5lY3Rvcl9mdW5jcw0KPiAqY29uX2Z1bmNzLCBjb25zdCB1MzIgKmZvcm1hdHMsDQo+ID4g
LQkJCQlpbnQgbl9mb3JtYXRzKTsNCj4gPiAraW50IGRybV93cml0ZWJhY2tfY29ubmVjdG9yX2lu
aXQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwNCj4gPiArCQkJCSBzdHJ1Y3QgZHJtX3dyaXRlYmFj
a19jb25uZWN0b3INCj4gKndiX2Nvbm5lY3RvciwNCj4gPiArCQkJCSBjb25zdCBzdHJ1Y3QgZHJt
X2Nvbm5lY3Rvcl9mdW5jcw0KPiAqY29uX2Z1bmNzLA0KPiA+ICsJCQkJIHN0cnVjdCBkcm1fZW5j
b2RlciAqZW5jLA0KPiA+ICsJCQkJIGNvbnN0IHUzMiAqZm9ybWF0cywgaW50IG5fZm9ybWF0cyk7
DQo+ID4NCj4gPiAgIGludCBkcm1tX3dyaXRlYmFja19jb25uZWN0b3JfaW5pdChzdHJ1Y3QgZHJt
X2RldmljZSAqZGV2LA0KPiA+ICAgCQkJCSAgc3RydWN0IGRybV93cml0ZWJhY2tfY29ubmVjdG9y
DQo+ICp3Yl9jb25uZWN0b3IsDQo+ID4NCj4gDQo+IC0tDQo+IExvdWlzIENoYXV2ZXQsIEJvb3Rs
aW4NCj4gRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZw0KPiBodHRwczovL2Jv
b3RsaW4uY29tDQoNCg==
