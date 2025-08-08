Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7F0B1E16E
	for <lists+dri-devel@lfdr.de>; Fri,  8 Aug 2025 07:03:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B00C210E4A6;
	Fri,  8 Aug 2025 05:03:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LLLvxjgo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAA3A10E1BD;
 Fri,  8 Aug 2025 05:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754629396; x=1786165396;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ePQGrKi5unuQoQ4SPE8fKJK+4J69h0R8PoINSt0Xxac=;
 b=LLLvxjgoQ00nvMQj/9zGXhfVS+oP4ZHhsySTIktpyacXgZ3LrjzGy/cx
 FIcY1q27IdGSh27ae3cuV0olf+/J3lBk9OocuzIei/mbSaCSvW230hElK
 mCxLtAMAJlMw5xebiiPJbgr5WP4uRQVnxTCdgqR8H8/AXuEU+cPbbFqBn
 Dhchr/YXEagW0mpJX1P5YZFGlsjROrN7Ifu5myZqa3OD+J+lEQ9zqNAns
 O2RIeOYsz1kTKXHg7XfGyhP98eIojYcDuYxeTZLtd2KuCWp9EBCUM79Rd
 9V5733MbYu/UNV+wdcP2B+mpaaomIs934KYEXhDpJp5BqTvtf/n4qNpeV A==;
X-CSE-ConnectionGUID: tse7KFhZTNan1sBMobBx9w==
X-CSE-MsgGUID: qZ0gxmoJSAiTPBy4w0+4mQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="57047186"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="57047186"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2025 22:03:15 -0700
X-CSE-ConnectionGUID: LTD8dDWZSp6gAvp0RMc4qQ==
X-CSE-MsgGUID: WxcyH26fTXyONzQzdyvywA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="169450724"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2025 22:03:14 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 7 Aug 2025 22:03:14 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 7 Aug 2025 22:03:14 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.78)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 7 Aug 2025 22:03:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t3IosFn/K0yLxrZZiSj1uHK8KDSXjjzi8HGyq28ubIbkUxruGDeQT3R7hxuDQQe3M88lR5GxSdQ1bsmMcYr3v87T6TdVhiL7b6yDRB8fxkrowuN5xzSbXeLfmbpWgu6rIQRYUqRt3Kklrqehpga49ENKHLALpcyOPUIfzL5liLf5ky82bXqewjlq9GhMtM2iZxpOEERbtP2pqvHTEF6FD7giAHvZ3Dy66EMZpchVmFerjxMVE4DlC2xF3/Vn4hKE5VX3OwsPaob20NhAlua5kLzWVO9uBa2mgwQ6dcpOGVaTzyCGV+epTKTYxdXR7Wm3pb+4+FR+sNd66Khm+2HvTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ePQGrKi5unuQoQ4SPE8fKJK+4J69h0R8PoINSt0Xxac=;
 b=V3nC137HL98dIIGm9fLxx2qiE0ECkK3QP2cUud3emkH/RCcRZ0MgNbnCabKJXXNMd6e2dIrjCxrAZYzL1lNhol0EcDiS7YETaYXSS2zZYbctvOyv2yMlqqioRzdZV2TrTZuWPGjSJI7v+hJobL5CMFuFQkizYYlKnd/4RTZBM2VVdCR9FUkO9S8K4mO0RutptyMsrDsjWfzo85UysE5owFP4/hBoac0n/f6Acu/NTcnyI+fRGGIwpMg6vH1pzJQqebmWGWBvBPtqfZz1h8lIdNzcXXMP0jguCGI7cqXh2KwlnGjwhL9Bq/YnYP+cP0/pMBGD9AQGwvDOX2+SBBywMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by LV1PR11MB8819.namprd11.prod.outlook.com
 (2603:10b6:408:2b3::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Fri, 8 Aug
 2025 05:03:10 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::76e3:aa2a:a205:819f]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::76e3:aa2a:a205:819f%7]) with mapi id 15.20.9009.016; Fri, 8 Aug 2025
 05:03:10 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Jani Nikula
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
Subject: RE: [PATCH 6/8] drm/vc4: use drmm_writeback_connector_init()
Thread-Topic: [PATCH 6/8] drm/vc4: use drmm_writeback_connector_init()
Thread-Index: AQHcAutqWBWb+UES7EWqP0QIpbI+sLRYPY0w
Date: Fri, 8 Aug 2025 05:03:10 +0000
Message-ID: <DM3PPF208195D8DE5D00FC40B97A92B1173E32FA@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20250801-wb-drop-encoder-v1-0-824646042f7d@oss.qualcomm.com>
 <20250801-wb-drop-encoder-v1-6-824646042f7d@oss.qualcomm.com>
In-Reply-To: <20250801-wb-drop-encoder-v1-6-824646042f7d@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|LV1PR11MB8819:EE_
x-ms-office365-filtering-correlation-id: 8cfe8b7a-27f3-4755-110b-08ddd638df3f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|38070700018|921020; 
x-microsoft-antispam-message-info: =?utf-8?B?R2JxcFNkNnpRZ0V6eUxtaUxQMXAyYnVaR08zcFFBRWhQNjdudkJ6dTJyWE5q?=
 =?utf-8?B?dGFTbUc1VlRDS1NDSTFQdDIvWFRZOVM1RjdSdWpSMU9lTDdxM2ZrOWRoZ1hX?=
 =?utf-8?B?K1U1M1MvZkpuMmhDcGpYMVJrK0hYVEpNV1o0TkhQSFlQblhiQzZWVllHYW5k?=
 =?utf-8?B?WkEwYWlTMjk2MWFwS3h5d1FHLzYxbDh4TjR0ZzhJUE00Lzk0L1lCT0swSFZ1?=
 =?utf-8?B?WXgrdDVlckY0bjViOTA2NmNGZlFqVVN2UzdKalViTllQZWZUdnk0TG9UWnV6?=
 =?utf-8?B?UTkyZGc5eFBvUWVlUm42TnRVTG1aQjVVOFMvQkE1Q3BvZkZnaEEvc0Vha3B0?=
 =?utf-8?B?Y0doNTJQRVhZUVAwOStPVmxUcVo2WnEvekc2dHNTc29hNWpmellPVXprUUpC?=
 =?utf-8?B?VVdOM2M5Vm5KbkdteDdHTTRpZmk1VWs2cUREcjViZ2d5bm8rT3dsRGI5OU5U?=
 =?utf-8?B?NFVGVEttQlliYUNqZEpNalVPWStrcSt5OGh3OEdaclJhWDRTNVUvUWxGcm1v?=
 =?utf-8?B?bkY1TDE4aHdDd2tFQUxJUE0vYU1XaUY0RE1YYU5uTmxTS0hJOHNlcFYvSDE1?=
 =?utf-8?B?KzNvbXhkNCs3VGs4djNmSHdzZzgvTmtSMk0rRjFIU1drY2FCczM4WUg3S2cy?=
 =?utf-8?B?RitobUN0RWJMVFh1bGEzQmg1NkdoTmhGQVZSOUtGZktsMWNoOVhzOG9GUVU4?=
 =?utf-8?B?Ui9nOHhkSUc2dXcvaU5uOExIYm0xaGtGN1dUMm5ISmpmWllrbG5uNThDZFZk?=
 =?utf-8?B?a3hyTkNOUHczWGNsTDdUYjN5SjVTdk01bVUzMFhwTWJTWFV0ZWVQOHplblc1?=
 =?utf-8?B?M2ZFMjROdkdVa1F2UlFJRmpsRy9MZ0lEWHMxSGQrY0toa3lWSFJleTZoeEd3?=
 =?utf-8?B?d3d2QU4rd0ZTNkFUQVVhMnJXYUJQK1BpdDNtWjd0OE9BdXlsU251OUpSRzdS?=
 =?utf-8?B?bXd5UWdRaHEzcElrQnBsV29ocVdxa0VMUURMVGF2cGVwM2x5M2hyUEdNaHA4?=
 =?utf-8?B?Z25VUE1mbFVJSk96elo4VENiZDVsOFJrL0tUcWp3c3RLYkV4Yy9vTFkwa1Qx?=
 =?utf-8?B?eTBmVjdJd2VudVZCbVNHS1N0dHk4VitiSHNmdlFDdkdoeTZhSStwMnlSeHlr?=
 =?utf-8?B?S000ajVoQStmeGp3R25OamM3VE41MHJ6QlFUNjJ3TTZtbEFDVTlsT1JFMG42?=
 =?utf-8?B?L1RIZjFuU2c5S3cvOHVoMVVlNWR3QXRJalJ5QlBaL2FHSWs0bW4zUEljL2dq?=
 =?utf-8?B?K1UvRE8zUHBtRGRzanJKajFNYTJBQWR2MjBtTjdJNUNCMWxlYlZTMGNBdFdI?=
 =?utf-8?B?OVprZnF0TW1PL3lSd2JoMkJXdkgrQmVmbmZHUmJ2dWRid1BNTSswdld2b2pk?=
 =?utf-8?B?TDJVMEhqa3ZocUp5TUpCWDZYanZzVklrWFlGMytZUlBkQ1ppZm5LMFlDZ2N0?=
 =?utf-8?B?OWRUUmNZMEhOQ2drVTJFekVUNXpUQUg2a2VmVmdTOUVUc3I1M1UwazZKdWdF?=
 =?utf-8?B?eHlxWHZsanhiQUlDa1FOYTVmUWphdTlic0hXdVdXY2RmT1F5c2M4bDBzUFVl?=
 =?utf-8?B?VFpOVWpKR0k1a290MUU5R2VZMkt3Zi9EajNzNzRXdDRFVTZmK0lnaUJ5Y1M5?=
 =?utf-8?B?aytRMGJXME1qWmZPYWNNZktRdmcrVmU4TmNCOHFyZm1lVEswNXltdytMcTdr?=
 =?utf-8?B?QTJNbHgwRG1GVGFwczY4c0pXOWxKUFpveEg0clI5MDg0Z1lnTFBYQ3NlVkM2?=
 =?utf-8?B?V1hySXFkc1dJekhUZkNkN1BVNDl3RmdxSWE3OE0rVjJETkFaSUNJVWxDcXNK?=
 =?utf-8?B?WFRwS1I2aE92cXVlUXBDUkY0QWlBNlRYMEhiRlpGQ2NoTjN1VzNmcjBmSEFq?=
 =?utf-8?B?Q1NWczR0aFc0RUFNWmlOTVVDcUZwVk45ZWRrSzdUR1dKeVQ5eFp4Qm1uU214?=
 =?utf-8?B?ODRiNjhqeXNMRmhTODlLSTdlbHcrY3A3NzVPekxncmdDTkdUYVdaTnpWRlMx?=
 =?utf-8?Q?sgoESyfbZlH6vUsBifKcV3MbA/mkzQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MmlFdlJ0RTZwd3JqbC9yQndDSzdYRy9EY2ZmR09wVEFkSUd6VzVUNExnbDlq?=
 =?utf-8?B?dVF6dktsbVdDSjFhRjhqeU1Hck5YNGdRQU0zK3Y4UUllYWsrTjRaREhzSEh1?=
 =?utf-8?B?QzlPcFRiK3hEcTdraUxIYXZzNVB4b1A0b2ppM09RTnRGaHJaQ1lUREc3bVBo?=
 =?utf-8?B?L09maFN5a3dSM0RXOVJNS0JvYUVwbGZGbG8rcmt4Vkd2ZDV0R3lwdFkyMjVp?=
 =?utf-8?B?aktVNHVDdVVHVWx5NDlyWjlGakdRK1h3bitROENCV3hyaERpYyt3M0lFYmpJ?=
 =?utf-8?B?Nkk5QUYrUExybzNQRWVHK1YydHpXdk9QYWNxMkpKbyt5Sk40bG9GcW05OWhR?=
 =?utf-8?B?L21FbVpCcGxqeHpuTE55bVI4QklELzVmM0JNQm5lQXNkak4yMnhKSUxjUGU0?=
 =?utf-8?B?ZVNuZzUzWW1KQTN5Z3dEU1grc3hKdUNjZjJLYkJ2MllSa0dFTWhJSUVnK05C?=
 =?utf-8?B?VlNtT05pcy9QNXlWR2V0aE5LbTBZU0pqeDJUWlZmY2hXejU5VWFmSTJ0UENW?=
 =?utf-8?B?VUdMaWRNWTRNZmEyeVFSNDhMa082cTk2eDE3KzVPRlN0RnhLTHlpL1ErZFBQ?=
 =?utf-8?B?YlRmVER0ZG90K3FWeDExZXhyVXlOWm4wSERyRjZXNmhNRFZPU2MvYXNVd0lw?=
 =?utf-8?B?ajhPQVVXWkxxV2cxWitZMGJpQzRYQjZIM0NFRWRxMjc2bUN6bUtacHJZK20v?=
 =?utf-8?B?NWlSbUN0UTlnQVl2Mk4ybFkwMHI5VlZQV2ZETXBWVWxNbDBEUytzaExIUU1x?=
 =?utf-8?B?aWxUb1Z1UWtBS0pMTlNtR0FYckt3aDFIWGkzUnZCLytWTnlSMkQ0N1orUHFO?=
 =?utf-8?B?MlEzVnIvTzNWNGtOV0I2Mzl5VzJ2MEJIakFqdkxVMi82bzQ5cWxJaFJNc2Ry?=
 =?utf-8?B?VEFKRThFVGJCemFVc0VhMjVzNXRTRU5jWUQxcEdlWVM4N2hCdFJIZTNmd1Nz?=
 =?utf-8?B?RldxRkoydm52Q3Y0N1pCYnovZjlZL1VlemMwM0hzOEVSSWxRVyttKzhLT05a?=
 =?utf-8?B?TWZHSGxLbWQ5d1JLdUxjbEg0ak1ucms2dllENVJFd2h1WmFLb3c3YzBjMzdC?=
 =?utf-8?B?dlZjZXdYWFJkR2s1cUs1a0VwbVN6ZVBaNlM5NnQ0ZU9DSER5R0ZDaWlVSlUr?=
 =?utf-8?B?Nm9wcm5zQ3JIY1ZGejcya0l4NTJpTXJlSHVtMjFzWStyTHNRS2JCQkpkQjBs?=
 =?utf-8?B?WWsrSUtZcnlJRzcwME5IWjE1eXFzNXhVeW5jdGYzQUdtV1dRZDZPb3FScGVm?=
 =?utf-8?B?ZzU4ZjFxYUNjWm85eFd1ZVFPNzZnZVdTc2FmU2R4ZzVvaXpUNGFpclY1Wito?=
 =?utf-8?B?cllIT2RTK1BjaUVCVWQrWkRSUFlFbTRUY1kxSm0ycXlCQXpnM2R4T29ZVldM?=
 =?utf-8?B?am5NdmVKNU1udFpkTlh0V0w0WjBNVG0zQk53OEdDanM4YUxQY0dvc3ZoRW9y?=
 =?utf-8?B?UXhhTS8ybmc3OWwvV2dDcjZYa0NhV2h3Tm5EK3RKbzJJMnN6Ynp4cVBuY0Rt?=
 =?utf-8?B?aUJsYUhzNVNqeHJDZHZLWTREUFZCbnRMUG16bnlod0RrVC9WMm1MdUxNcmJM?=
 =?utf-8?B?SkZKdldBQ3dab3h6NUhQa2hoY1pDMW1jRFJmWWdSeFZzWTVlQzdxQVRpK2pW?=
 =?utf-8?B?TUNId0I3ZGwyWlpuSzN0UnV1S25JYklSa3Nmekpzd3hTSWUxcmo0ZWpZNDhB?=
 =?utf-8?B?OGtxRE5PVi9URmdMaGZ6azNFamRsWGpPa1ZTemRONXl6cFhiZCs3UDgwbUJK?=
 =?utf-8?B?VDI0dmtaSmFqRkRmWHFPcy9abk9rVUlTOEhWZXZNdGRhVEVDSDBoSjEzeDBN?=
 =?utf-8?B?T0dRQXJZd1FSUkpvYUNGWXlOeFVlY0Fqc1dQOU56OUlIams1RUhDQW41aDlt?=
 =?utf-8?B?MVgxb3N3SmZPYXpYTGE5WmR3SmFqRmFJUEpGV0hoRUxOTktzNytEYTVDdzhO?=
 =?utf-8?B?dzc2ekdjSDhmYlpnYmNTSDBhR1Noa254NjFUdm1sYTdXQTdCbk9xR0lEU1Rp?=
 =?utf-8?B?cTcyQlVFVmpIWUZrcmtybnp0UXpzWkJOQmo2bkl2YzROU2x1Z3FrYU9LSXR6?=
 =?utf-8?B?cTgzTFlLQ2p5Y2JLMkUzSTMvQ1BCU01mWlhMajBzTjduR2wwNkVxcURMUVEw?=
 =?utf-8?Q?vX9IoWNlieHnK5JTSf7XdaXXN?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cfe8b7a-27f3-4755-110b-08ddd638df3f
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2025 05:03:10.7900 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +GeVZtkXYzuvEZBY2YRl8K5l/ifci83KDk0xsAUm0RH43vsLzLHYZUGDHpvTXeODNWibtv8tK5wckqS3OiZ8EA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR11MB8819
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

PiBTdWJqZWN0OiBbUEFUQ0ggNi84XSBkcm0vdmM0OiB1c2UgZHJtbV93cml0ZWJhY2tfY29ubmVj
dG9yX2luaXQoKQ0KPiANCj4gVXNlIGRybW1fcGxhaW5fZW5jb2Rlcl9hbGxvYygpIHRvIGFsbG9j
YXRlIHNpbXBsZSBlbmNvZGVyIGFuZA0KPiBkcm1tX3dyaXRlYmFja19jb25uZWN0b3JfaW5pdCgp
IGluIG9yZGVyIHRvIGluaXRpYWxpemUgd3JpdGViYWNrIGNvbm5lY3Rvcg0KPiBpbnN0YW5jZS4N
Cj4gDQo+IFNpZ25lZC1vZmYtYnk6IERtaXRyeSBCYXJ5c2hrb3YgPGRtaXRyeS5iYXJ5c2hrb3ZA
b3NzLnF1YWxjb21tLmNvbT4NCg0KTEdUTSwNClJldmlld2VkLWJ5OiBTdXJhaiBLYW5kcGFsIDxz
dXJhai5rYW5kcGFsQGludGVsLmNvbT4NCg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS92YzQv
dmM0X3R4cC5jIHwgOSArKysrLS0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMo
KyksIDUgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Zj
NC92YzRfdHhwLmMgYi9kcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF90eHAuYw0KPiBpbmRleA0KPiA0
MmFjYWMwNWZlNDc4NjFjZWQyMjZhNGY2NDY2MWY1NDVlMjFkZGI1Li5mZWY0ZTRlZTQ3Y2Y0MWQ0
MGRlNDdjNTIwMWYNCj4gMDM0OWRjMzZjNTZiZCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL3ZjNC92YzRfdHhwLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfdHhwLmMN
Cj4gQEAgLTM3Nyw3ICszNzcsNiBAQCB2YzRfdHhwX2Nvbm5lY3Rvcl9kZXRlY3Qoc3RydWN0IGRy
bV9jb25uZWN0b3INCj4gKmNvbm5lY3RvciwgYm9vbCBmb3JjZSkgIHN0YXRpYyBjb25zdCBzdHJ1
Y3QgZHJtX2Nvbm5lY3Rvcl9mdW5jcw0KPiB2YzRfdHhwX2Nvbm5lY3Rvcl9mdW5jcyA9IHsNCj4g
IAkuZGV0ZWN0ID0gdmM0X3R4cF9jb25uZWN0b3JfZGV0ZWN0LA0KPiAgCS5maWxsX21vZGVzID0g
ZHJtX2hlbHBlcl9wcm9iZV9zaW5nbGVfY29ubmVjdG9yX21vZGVzLA0KPiAtCS5kZXN0cm95ID0g
ZHJtX2Nvbm5lY3Rvcl9jbGVhbnVwLA0KPiAgCS5yZXNldCA9IGRybV9hdG9taWNfaGVscGVyX2Nv
bm5lY3Rvcl9yZXNldCwNCj4gIAkuYXRvbWljX2R1cGxpY2F0ZV9zdGF0ZSA9DQo+IGRybV9hdG9t
aWNfaGVscGVyX2Nvbm5lY3Rvcl9kdXBsaWNhdGVfc3RhdGUsDQo+ICAJLmF0b21pY19kZXN0cm95
X3N0YXRlID0gZHJtX2F0b21pY19oZWxwZXJfY29ubmVjdG9yX2Rlc3Ryb3lfc3RhdGUsDQo+IEBA
IC02MDEsMTAgKzYwMCwxMCBAQCBzdGF0aWMgaW50IHZjNF90eHBfYmluZChzdHJ1Y3QgZGV2aWNl
ICpkZXYsIHN0cnVjdA0KPiBkZXZpY2UgKm1hc3Rlciwgdm9pZCAqZGF0YSkNCj4gDQo+ICAJZHJt
X2Nvbm5lY3Rvcl9oZWxwZXJfYWRkKCZ0eHAtPmNvbm5lY3Rvci5iYXNlLA0KPiAgCQkJCSAmdmM0
X3R4cF9jb25uZWN0b3JfaGVscGVyX2Z1bmNzKTsNCj4gLQlyZXQgPSBkcm1fd3JpdGViYWNrX2Nv
bm5lY3Rvcl9pbml0X3dpdGhfZW5jb2Rlcihkcm0sICZ0eHAtDQo+ID5jb25uZWN0b3IsDQo+IC0J
CQkJCQkJZW5jb2RlciwNCj4gLQ0KPiAJJnZjNF90eHBfY29ubmVjdG9yX2Z1bmNzLA0KPiAtCQkJ
CQkJCWRybV9mbXRzLA0KPiBBUlJBWV9TSVpFKGRybV9mbXRzKSk7DQo+ICsJcmV0ID0gZHJtbV93
cml0ZWJhY2tfY29ubmVjdG9yX2luaXQoZHJtLCAmdHhwLT5jb25uZWN0b3IsDQo+ICsJCQkJCSAg
ICAmdmM0X3R4cF9jb25uZWN0b3JfZnVuY3MsDQo+ICsJCQkJCSAgICBlbmNvZGVyLA0KPiArCQkJ
CQkgICAgZHJtX2ZtdHMsIEFSUkFZX1NJWkUoZHJtX2ZtdHMpKTsNCj4gIAlpZiAocmV0KQ0KPiAg
CQlyZXR1cm4gcmV0Ow0KPiANCj4gDQo+IC0tDQo+IDIuMzkuNQ0KDQo=
