Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F20E9B1E183
	for <lists+dri-devel@lfdr.de>; Fri,  8 Aug 2025 07:05:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41DF610E4AF;
	Fri,  8 Aug 2025 05:05:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EXzxe8MC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B288410E4AE;
 Fri,  8 Aug 2025 05:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754629536; x=1786165536;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2K0ELmCJMJNNMRLlA+s3jCW6y8r9tQNBzB8p6rvzujY=;
 b=EXzxe8MC4C0WEvCEDdU88hkW2Ve4eYvrfMspKV+mUY3bA1RZ83Hnguw8
 Toxdy36GbwML4hH/pJrRuhSctGWP+0nr/CW96xej2Bj6B/zCRB4+Pwh8w
 natiOBPeZmG699psY0UraYfxs9AkhzpD+CoQ0jjuc4NxgM2ds6Y3sThJP
 Yiq1fhK8FjuSeTkO6bsHpn4BkXanZZKuHJoNhOygbbsX+GgOBspDGbzTs
 gGLT4lVA6i3SDXVtiz7I1RalBLgstKk45ILzdW02pvXae1X4JW7TldQCL
 xNqei8GxmMyA59s06CJnSe5Tgekqphl3dfwWxUYDKZx6oQ6CaO3xIt/0T A==;
X-CSE-ConnectionGUID: uZqNCtKzTbiKhizDSEKcnw==
X-CSE-MsgGUID: 8sRXMB0ZQKaYsAFTog4USw==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="68430893"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="68430893"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2025 22:05:35 -0700
X-CSE-ConnectionGUID: id+7/7Y9TQ2TwwslbquseA==
X-CSE-MsgGUID: +5KBX711R6WhIkspWREyUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="188920491"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2025 22:05:34 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 7 Aug 2025 22:05:34 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 7 Aug 2025 22:05:34 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.40)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 7 Aug 2025 22:05:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=moDf7sOYvkW7NyP1uDTjqsk5/+R0XxfqHd8K8Ca/wNom8MeoULGEXPE3mG/lhYBwT0sFtZUPpDyFDhFZo0lCmFaimU+xZhMvwqx0+Hy9zzAO23fevLn3VJLte5KpMKad3vlPr6DW+mDiEVl12jEgI/heEe/Bb4VDCYI6EEtQmY5Xd8ws1VTt5aAkjF0D4SvLX74259u6winEMzt9GeEMpW9BLmGQ6y4YF8bYO1mhoz9lr3zI2sYVOB2bGd2OK+GnnsmhnFQyH6lYVtI4wOJnP4cjanT7IULGLer1bNwajhh+3Z/HUWMHsx+R4E6Ly0hySh+43pjsG9A6kVoqXU8kTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2K0ELmCJMJNNMRLlA+s3jCW6y8r9tQNBzB8p6rvzujY=;
 b=LW+CKn3QO9xQAvEr1SeglROa1bjpplLw/aaw9ku0vOIGvautj4tHXjRIC8HX1AmLFEWeCyt+DiLWPJ7ruHCejbUhDENYPPUXB1+hGpu5JlRC6DscTrgfkhEAij5ABF2ndyIBqe3RTJBMu6XxSldEohUarh83uDET3vJdV5TemS4L8ZeMpJmdtEE1kU1igWnCnsJjIMhgLaszbtVv5GhO0s/KyaQnpGoGQ+s7oOVXhz8rVG/OtS0g7VE9oNArrcvVlzB/RfG0CVECQS69/j8mMQ7UV9jcQljE1MU5pny7IJ/QJN5qz1hvW6P7i2UsanGmypWQrXLVFEpIHSUt4C/SLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by LV1PR11MB8819.namprd11.prod.outlook.com
 (2603:10b6:408:2b3::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Fri, 8 Aug
 2025 05:05:25 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::76e3:aa2a:a205:819f]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::76e3:aa2a:a205:819f%7]) with mapi id 15.20.9009.016; Fri, 8 Aug 2025
 05:05:25 +0000
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
Subject: RE: [PATCH 3/8] drm/mali: use drmm_writeback_connector_init()
Thread-Topic: [PATCH 3/8] drm/mali: use drmm_writeback_connector_init()
Thread-Index: AQHcAutq2pI//lekxEW57m4foBbiFrRN1ZcAgApol5A=
Date: Fri, 8 Aug 2025 05:05:25 +0000
Message-ID: <DM3PPF208195D8DC10DD6F62DD157DA86CCE32FA@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20250801-wb-drop-encoder-v1-0-824646042f7d@oss.qualcomm.com>
 <20250801-wb-drop-encoder-v1-3-824646042f7d@oss.qualcomm.com>
 <ac554483-f892-4997-be35-7b18bf72855a@bootlin.com>
In-Reply-To: <ac554483-f892-4997-be35-7b18bf72855a@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|LV1PR11MB8819:EE_
x-ms-office365-filtering-correlation-id: caf6963e-490b-4dba-b0a7-08ddd6392f61
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|38070700018|921020; 
x-microsoft-antispam-message-info: =?utf-8?B?QmU5Zlk5U05Pb0NTUjZvY1h1MjlUeVFxM1hxMnE0SnNFNnhuQ3Z1V0thZlpq?=
 =?utf-8?B?cWJ6S0kwNlhtQVd4eFJKeDBnOGJlYTZQaytYci8zYm9wUkRVMWN4Z2MyMXBs?=
 =?utf-8?B?L2RwMm0wYlVKMFVnR3V4aGFRL0VOT25FVHhjMG1pYWZNaitWaWpFSjVSM3B6?=
 =?utf-8?B?NTkxbTJtbVJUVElqU00rK3hsVXh6U2JVTC9qeFNXNmhSMDhSTkdjeW9CQTJ5?=
 =?utf-8?B?YlVjeVhzY0hYeXRRRUlYM09WWm15cjJOZmdnRENnUUZORmROSmdyd2F1L3VK?=
 =?utf-8?B?b0pLbFEvQVdWTWJHZE1ublVzQ3A5S2h5VjV3R1IydU9tWWdQL0h2NVk5NHov?=
 =?utf-8?B?ZTFQYmlwazRWUERrQlRpRS8wK1hKT2lOTkU0MFBJbTIvMmJ2NnEvQUgxUStu?=
 =?utf-8?B?QisydEN1aW5XQUhPWkZrOGJZSENDSUJJRTc1ZituVnIrTUFFamg4U0RlQzdu?=
 =?utf-8?B?UUYwWmhzZkFZQnMwK2VUNUJkTk15ZCs1SHpMMGUwVUVsN1VWT00wMGJiVllu?=
 =?utf-8?B?bEYvck9NVjQ2RVRqQTZhNGlGNi9JMXFiVVIxQWZaN01QWFFkOEV6MWNRdUhu?=
 =?utf-8?B?aHU0Y2dCc21CM01zTDBMc0lpUE1uM3NkVjZtM3QwdmhZNW1mRUxXejNVWmxX?=
 =?utf-8?B?YWpqSVI4OEs2cUxaL3ZKd2p0SDBHRGswME45YmtpSHR4SHFSblhua2pnN1dD?=
 =?utf-8?B?Zk83dWhWcEg1Z0hhMWZ3SHBJUkdrM0lTRWdqL3BXK0JjWExtb21tYWExekZh?=
 =?utf-8?B?K0xxdjNFNkFYUjB4UU9pcFF4K0dLazdwbUNDaW1rWDFZWkNxU3NpWG9uMzBG?=
 =?utf-8?B?OXgrWXJHWTV1dGtrc2s4UTNSNU1YdW82ZTU3T0dhVFhMc2VoUHYyeFBVdFpE?=
 =?utf-8?B?NGkvSm5kS1lLcWZYay9WbDhiUTd5bDBDbitYeTN3YmNSYm9Ibk9MUWtxT3F2?=
 =?utf-8?B?a080ajBwNVBGTnNLYnhsakFjSStNZXdTOGZmWUtaTG1DbVRZdllKNkZDeUpW?=
 =?utf-8?B?YjRJUWdUbVRhTmY4K0JvajdzOW8xbm5TWVR1TS9ISzAvYUhaTy9ScWwrUVlU?=
 =?utf-8?B?bkYzbzR2SUorRkFnQ3RoMnplaTEvV1ljYTU0c0FrYm05WHpWdklVYU8wVzhF?=
 =?utf-8?B?cWE1cUtiSmJVeURtVENwK1ljU21RQUxya1VCSkdXYjZlUlV5NXlZY2JzSkFw?=
 =?utf-8?B?WEh5WEFZcHMvUERhRlRUS2x3blE1OVIyN0JLRFVlU0RDQi9yUDhoL2VXNThO?=
 =?utf-8?B?bzBraG42U3U1WVBOc1hKK0VLWmwxbjREcVpneXc2TVVPV3h6bVdXb0hwckRB?=
 =?utf-8?B?TjhwUUZSclAzY0hTdXRwdER4L3NkUGZyTjF2T2lGT1cxZWtNUFdiRXI0ZGQ4?=
 =?utf-8?B?MGtudVV2VGlWbVFBdU9ibnhWTEw4UTVtUjBlQzRmTWZZeStqcHNPQ3B5OGtW?=
 =?utf-8?B?dG5KaFBTejBGb1Z0L2FqRlU1emZlWHpPWlNySjVRYkhENS9yak54VmI3R1k1?=
 =?utf-8?B?QmNJa0g4NWNRQzIrejZSUkpTNWxEQUNZVVcySDgzSW5YTDN0Ynl1TmRPbzEz?=
 =?utf-8?B?NFowNXljWmhjSmd6NjYzN1hCZlR3WXBmeDhha2FncnVQM202TDVoSkI3NDFu?=
 =?utf-8?B?bFFYcmJXdWFxS2pxYWxxK0VTbmtERVE3TTR4QUxXYzdRU29sd0V3REo1bE9j?=
 =?utf-8?B?WlBzYnFlRGZQYUZHQ09jRHlKbWIyM014R3JVRjhROEwxV3l1czVaV0xRSzVY?=
 =?utf-8?B?QXY1TTJnYko2dXdycjcwNWdNTStNZHN1Y2ZzNnFRZ2lXcnFrOEQrcnFCNzlo?=
 =?utf-8?B?Z2Jvd0RQR1MyWmttSi9VdTZFRForNURyVUxKTjhXeXRKSTl2dm9XckxhUm4y?=
 =?utf-8?B?aFJNL1Y3eEdxZkpicWY3azBnK2VYR1FhWEJ3dlMzU1dwRk85UmZwaCtQSFlC?=
 =?utf-8?Q?6bSHgTIKcT0Gzjd8NICbXXHXDoR3PnQk?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZG04TU1xVmJEWERoTWFydlNLKysvQUJMVldVQ09lZnVUT2xBa1FJVXlYdER6?=
 =?utf-8?B?RHJ3WXk4YUU3ZEIzeFF3S0t4QXl2cTJRWlo3czRCYVFIR0FlQkhFVDRIeEFZ?=
 =?utf-8?B?c056YnpGVGRScm16eTZQWWlGN1o3dWo4UDZ6MXZ4Q25qYjFQM1lHYjJ2bU8v?=
 =?utf-8?B?djh3dFVpTXBFVVZITnErZWhyZDViQ3NTVHo3QWhZaldZUjNBSURJU2pSMjdU?=
 =?utf-8?B?OUxyMUtSa3d6T0x2TmQvSWV4bUhIRmJYc1BtSUpsNWRyL1RZenpQK28wZHps?=
 =?utf-8?B?U3FMWjhkaFpQMGsyNC9tL1NPRmRKSGZvS2p0S1RhejVaa1IrQlVYNlZNOUgr?=
 =?utf-8?B?QkFyWC9iR24zRGxjZHhmZ0Z1NkV3K2lNU2UvNXpEa2NLSy9zYUJNdlhIWFEz?=
 =?utf-8?B?WnpuVUJYRzFwV1NycUpYZ1NDaUo1YVpBckxyUjJUZFJWdWNTTmU2Y0JGT1dm?=
 =?utf-8?B?TCtjNzVXaElKWHRlaTFRM2IvSW15V2x6TGFmck0vT0tuQWdPYm9CNlZRS1VD?=
 =?utf-8?B?cE9OWnppdXZ6NWI3eVdQc05tOUFIN2VQV3FRVTEzeWowOGtEZ3gxOGhabnZo?=
 =?utf-8?B?a1Zva21EQ0paY044WWZiMWZ4UmhyVWhnUUdBTVNoL3lhaHhNaWdGVCt1dGNF?=
 =?utf-8?B?MXZiL2kzZ2RONWM1Z0FQSHJnMEcveUZOalR5bndtUGMvNVllVlBidkF2YXJC?=
 =?utf-8?B?eS9nbm8xc2cxU0dES3BPdGdiamdSRC9sd0Z0cDk5Y2I5cGhNSzkwZWFJUHVY?=
 =?utf-8?B?Qk9pd3RRRGtWYmZPOFBWL2VuOEJCRDlpc3FobVJWdzdSVS9hT0NKV2FvUXQx?=
 =?utf-8?B?aXozOERKOWxGaDUrclBIMHQ1TnA3SFRVWWorOVNGMGRnbCs1NUFhK0VNMkdw?=
 =?utf-8?B?R3l4b0ZzQlowSmYrM2wxVXRQWGhZN1puUmtjelV2aHcyYytDeEMzUlJlR1l3?=
 =?utf-8?B?em9TcFRNSDJ6bm1uRGlMZC9ubEdFWVN2UjJ2MnFpd3VCbW80aTJKUGo1dTdH?=
 =?utf-8?B?M0Q0WDVZcWxwajVGcE91K1VLQXVzaTcwMW1sYnFBSXFNVUtVbURNNVN2RjBx?=
 =?utf-8?B?cGp2WW8zSGUvZXFqdjBteHRsdzZmQWRScm9NZWRRV0I0TC8zbnFjVWFOL1Nx?=
 =?utf-8?B?QVprSlB2ejVmOTlUM1dTWXl4RFlQOUlDOGowQ3hsVlhFSE5DdVVQSDVYcWZM?=
 =?utf-8?B?VmpQV3pJL1BFbk1HM1dscjdBbDhzN25samFhc29SbHBlWFJYbmR1RGZPdVFG?=
 =?utf-8?B?SHhtU1NUcGN0ZmIrb015ZS9PeFBEbEdyQWlUTVV1TlBOWkFjRlkxVm5WR2RD?=
 =?utf-8?B?dmlYTm1HN0F6T3hreTkvbFpIbnhOMlVwSEpSZmJlQmU5NXhVOUlnaWM1MENi?=
 =?utf-8?B?Y1Y4RnVPSlBHUGRBV2RTNXA4enZyTEFadDhoZVgvQVRRVytJMUY1ZEdNcEFH?=
 =?utf-8?B?WjhLS0M5ZURCYzdpUXBDbHlWZkdsNDdVU3Q5aDRMalczZUJYc3pFUkdOSUZQ?=
 =?utf-8?B?OEx6YytsRWY2TzBwR3JRVExvZzhEUEdVQTdTeFpObThSRGtWdENibWFXbjVC?=
 =?utf-8?B?R0hKdU0xekxTcU1BOTZpL045SEZBaXpUODk5WXBZN1h6d3JSQW82YWt6cUhF?=
 =?utf-8?B?ckZ6OHc1bUdmREFaaTgzdDhwY1JYZ21URnAvWkppM3pyaEJEL2p5UHpvT1NL?=
 =?utf-8?B?RkpKMjU0bkwvN3FZRUd1eTNTZjhzVlBRSFkxS0lPamNmaURTc1p0bHJOczRs?=
 =?utf-8?B?bEp3VDExRDZqMjFvVm9yWGVsZ0ZORTZKVGlkT2w1bVp1OTIyUUI1eEhDYnk4?=
 =?utf-8?B?b3NIS2ZCYmREQ0RWc1Rid0RPdU9KY0xiSHQzQ084eG9BZHJUQVptSHhnbmcy?=
 =?utf-8?B?Q281bDVULzVRSC9lUlA5Z1pkTmw3cHpHWE05L0VGdTZtbVhENnlDWS81Sk9R?=
 =?utf-8?B?eGRYS3F5ODNDZU9FbWZxUzJqRThOaml2YTdlMWQybVVIVUg1MTV2U3owMmZ6?=
 =?utf-8?B?UllKYTR6Zjk2Sm1JT0hJY2JRUk5aMVpDVUdkY1BIWGtJYnkzL0J0YVRXeUE2?=
 =?utf-8?B?TUxicG5lNVhMRTlBNVYvZ0JJNnp2c0liNXZzMVI4WGpuclpPZGZNdEljL1Bn?=
 =?utf-8?Q?c/w9NFMQQqfTIK4hDcHJStv3u?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: caf6963e-490b-4dba-b0a7-08ddd6392f61
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2025 05:05:25.2797 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YKYKVQKY/9XVkpL0EtdsqPkeV9ojsEasCjFuLFECoS0WPjFtzesh9Z0TWa+XhGMVMlUQlVeg/wQM9yC6Xh8DUg==
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

PiBTdWJqZWN0OiBSZTogW1BBVENIIDMvOF0gZHJtL21hbGk6IHVzZSBkcm1tX3dyaXRlYmFja19j
b25uZWN0b3JfaW5pdCgpDQo+IA0KPiANCj4gDQo+IExlIDAxLzA4LzIwMjUgw6AgMTU6NTEsIERt
aXRyeSBCYXJ5c2hrb3YgYSDDqWNyaXTCoDoNCj4gPiBVc2UgZHJtbV9wbGFpbl9lbmNvZGVyX2Fs
bG9jKCkgdG8gYWxsb2NhdGUgc2ltcGxlIGVuY29kZXIgYW5kDQo+ID4gZHJtbV93cml0ZWJhY2tf
Y29ubmVjdG9yX2luaXQoKSBpbiBvcmRlciB0byBpbml0aWFsaXplIHdyaXRlYmFjaw0KPiA+IGNv
bm5lY3RvciBpbnN0YW5jZS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IERtaXRyeSBCYXJ5c2hr
b3YgPGRtaXRyeS5iYXJ5c2hrb3ZAb3NzLnF1YWxjb21tLmNvbT4NCg0KTEdUTSwNClJldmlld2Vk
LWJ5OiBTdXJhaiBLYW5kcGFsIDxzdXJhai5rYW5kcGFsQGludGVsLmNvbT4NCg0KPiA+IC0tLQ0K
PiA+ICAgZHJpdmVycy9ncHUvZHJtL2FybS9tYWxpZHBfbXcuYyB8IDI1ICsrKysrKysrKysrKysr
LS0tLS0tLS0tLS0NCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCAxMSBk
ZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL21h
bGlkcF9tdy5jDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0vYXJtL21hbGlkcF9tdy5jIGluZGV4DQo+
ID4NCj4gNjAwYWY1YWQ4MWIxNWQwYzMwZjlmNzk1ODhmNDBjY2EwNzQzN2VkOC4uMTgyMjc1YzBj
MjljZDg1MjdjODVkZmIzZTcNCj4gMzENCj4gPiA3NTYxZGEzOTJjNDYgMTAwNjQ0DQo+ID4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FybS9tYWxpZHBfbXcuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hcm0vbWFsaWRwX213LmMNCj4gPiBAQCAtODQsMTEgKzg0LDYgQEAgbWFsaWRwX213X2Nv
bm5lY3Rvcl9kZXRlY3Qoc3RydWN0IGRybV9jb25uZWN0b3INCj4gKmNvbm5lY3RvciwgYm9vbCBm
b3JjZSkNCj4gPiAgIAlyZXR1cm4gY29ubmVjdG9yX3N0YXR1c19jb25uZWN0ZWQ7DQo+ID4gICB9
DQo+ID4NCj4gPiAtc3RhdGljIHZvaWQgbWFsaWRwX213X2Nvbm5lY3Rvcl9kZXN0cm95KHN0cnVj
dCBkcm1fY29ubmVjdG9yDQo+ID4gKmNvbm5lY3RvcikgLXsNCj4gPiAtCWRybV9jb25uZWN0b3Jf
Y2xlYW51cChjb25uZWN0b3IpOw0KPiA+IC19DQo+ID4gLQ0KPiA+ICAgc3RhdGljIHN0cnVjdCBk
cm1fY29ubmVjdG9yX3N0YXRlICoNCj4gPiAgIG1hbGlkcF9td19jb25uZWN0b3JfZHVwbGljYXRl
X3N0YXRlKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IpDQo+ID4gICB7DQo+ID4gQEAg
LTExNCw3ICsxMDksNiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9jb25uZWN0b3JfZnVuY3MN
Cj4gbWFsaWRwX213X2Nvbm5lY3Rvcl9mdW5jcyA9IHsNCj4gPiAgIAkucmVzZXQgPSBtYWxpZHBf
bXdfY29ubmVjdG9yX3Jlc2V0LA0KPiA+ICAgCS5kZXRlY3QgPSBtYWxpZHBfbXdfY29ubmVjdG9y
X2RldGVjdCwNCj4gPiAgIAkuZmlsbF9tb2RlcyA9IGRybV9oZWxwZXJfcHJvYmVfc2luZ2xlX2Nv
bm5lY3Rvcl9tb2RlcywNCj4gPiAtCS5kZXN0cm95ID0gbWFsaWRwX213X2Nvbm5lY3Rvcl9kZXN0
cm95LA0KPiA+ICAgCS5hdG9taWNfZHVwbGljYXRlX3N0YXRlID0gbWFsaWRwX213X2Nvbm5lY3Rv
cl9kdXBsaWNhdGVfc3RhdGUsDQo+ID4gICAJLmF0b21pY19kZXN0cm95X3N0YXRlID0gZHJtX2F0
b21pY19oZWxwZXJfY29ubmVjdG9yX2Rlc3Ryb3lfc3RhdGUsDQo+ID4gICB9Ow0KPiA+IEBAIC0y
MTEsNiArMjA1LDcgQEAgc3RhdGljIHUzMiAqZ2V0X3dyaXRlYmFja19mb3JtYXRzKHN0cnVjdCBt
YWxpZHBfZHJtDQo+ICptYWxpZHAsIGludCAqbl9mb3JtYXRzKQ0KPiA+ICAgaW50IG1hbGlkcF9t
d19jb25uZWN0b3JfaW5pdChzdHJ1Y3QgZHJtX2RldmljZSAqZHJtKQ0KPiA+ICAgew0KPiA+ICAg
CXN0cnVjdCBtYWxpZHBfZHJtICptYWxpZHAgPSBkcm1fdG9fbWFsaWRwKGRybSk7DQo+ID4gKwlz
dHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXI7DQo+ID4gICAJdTMyICpmb3JtYXRzOw0KPiA+ICAg
CWludCByZXQsIG5fZm9ybWF0czsNCj4gPg0KPiA+IEBAIC0yMjQsMTEgKzIxOSwxOSBAQCBpbnQg
bWFsaWRwX213X2Nvbm5lY3Rvcl9pbml0KHN0cnVjdCBkcm1fZGV2aWNlDQo+ICpkcm0pDQo+ID4g
ICAJaWYgKCFmb3JtYXRzKQ0KPiA+ICAgCQlyZXR1cm4gLUVOT01FTTsNCj4gPg0KPiA+IC0JcmV0
ID0gZHJtX3dyaXRlYmFja19jb25uZWN0b3JfaW5pdChkcm0sICZtYWxpZHAtPm13X2Nvbm5lY3Rv
ciwNCj4gPiAtCQkJCQkgICAmbWFsaWRwX213X2Nvbm5lY3Rvcl9mdW5jcywNCj4gPiAtDQo+ICZt
YWxpZHBfbXdfZW5jb2Rlcl9oZWxwZXJfZnVuY3MsDQo+ID4gLQkJCQkJICAgZm9ybWF0cywgbl9m
b3JtYXRzLA0KPiA+IC0JCQkJCSAgIDEgPDwgZHJtX2NydGNfaW5kZXgoJm1hbGlkcC0NCj4gPmNy
dGMpKTsNCj4gPiArCWVuY29kZXIgPSBkcm1tX3BsYWluX2VuY29kZXJfYWxsb2MoZHJtLCBOVUxM
LA0KPiBEUk1fTU9ERV9FTkNPREVSX1ZJUlRVQUwsDQo+ID4gKwkJCQkJICAgTlVMTCk7DQo+ID4g
KwlpZiAoSVNfRVJSKGVuY29kZXIpKQ0KPiA+ICsJCXJldHVybiBQVFJfRVJSKGVuY29kZXIpOw0K
PiA+ICsNCj4gPiArCWRybV9lbmNvZGVyX2hlbHBlcl9hZGQoZW5jb2RlciwNCj4gJm1hbGlkcF9t
d19lbmNvZGVyX2hlbHBlcl9mdW5jcyk7DQo+ID4gKw0KPiA+ICsJZW5jb2Rlci0+cG9zc2libGVf
Y3J0Y3MgPSAxIDw8IGRybV9jcnRjX2luZGV4KCZtYWxpZHAtPmNydGMpOw0KPiANCj4gZHJtX2Ny
dGNfbWFzaz8NCj4gDQo+IFdpdGggdGhpczoNCj4gDQo+IFJldmlld2VkLWJ5OiBMb3VpcyBDaGF1
dmV0IDxsb3Vpcy5jaGF1dmV0QGJvb3RsaW4uY29tPg0KPiANCj4gPiArDQo+ID4gKwlyZXQgPSBk
cm1tX3dyaXRlYmFja19jb25uZWN0b3JfaW5pdChkcm0sICZtYWxpZHAtPm13X2Nvbm5lY3RvciwN
Cj4gPiArCQkJCQkgICAgJm1hbGlkcF9td19jb25uZWN0b3JfZnVuY3MsDQo+ID4gKwkJCQkJICAg
IGVuY29kZXIsDQo+ID4gKwkJCQkJICAgIGZvcm1hdHMsIG5fZm9ybWF0cyk7DQo+ID4gICAJa2Zy
ZWUoZm9ybWF0cyk7DQo+ID4gICAJaWYgKHJldCkNCj4gPiAgIAkJcmV0dXJuIHJldDsNCj4gPg0K
PiANCj4gLS0NCj4gTG91aXMgQ2hhdXZldCwgQm9vdGxpbg0KPiBFbWJlZGRlZCBMaW51eCBhbmQg
S2VybmVsIGVuZ2luZWVyaW5nDQo+IGh0dHBzOi8vYm9vdGxpbi5jb20NCg0K
