Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C851BB1E17E
	for <lists+dri-devel@lfdr.de>; Fri,  8 Aug 2025 07:05:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1660710E4B4;
	Fri,  8 Aug 2025 05:05:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EDBmHfM3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C63DA10E4AA;
 Fri,  8 Aug 2025 05:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754629509; x=1786165509;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MQrm1C1/Wo/WrlxE+2k+pFXJSPSDaBnBugTNgvlUF+c=;
 b=EDBmHfM3vPCAxWHHpDWcfUVOgV2leEVQIbwS6LxJqxxdBVpxzbBGnjHO
 9IMGyJSY+Zygffe3Y+EoUsG4DVGZjEpA1YEnAhhjGIxdp5QPPCcHKxOH/
 s+2tVo/eOYcxhesIk59lqRmX5KFPyeV4+8SH7OaXjdRHQ7kZuUKMU6sNq
 Vkju4Lwdr+XKK12w9gaJ715ABjSIGePFkb6F+QE7lYTdOnNFhiIHVSRcQ
 0TDYzITcIVT4n3XZlGsh9VcaXKTRzA2b6EeCQZwy71+i9GV/1boIuSNht
 lrq7YjO3f2gLtifElhiFrrjdSZk6ah0Sd3VHTd9ZndUqDWbnjrodXG8cO g==;
X-CSE-ConnectionGUID: 8VbxzKgJTXe6wzzetHbifQ==
X-CSE-MsgGUID: 28crnBnYST630t6l5luwmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="68344498"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="68344498"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2025 22:05:08 -0700
X-CSE-ConnectionGUID: VWw2alXbRDOpTsfPg/5uGA==
X-CSE-MsgGUID: X7UQLzUoR5m7kZtNpX3Nvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="165142888"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2025 22:05:08 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 7 Aug 2025 22:05:07 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 7 Aug 2025 22:05:07 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.74)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 7 Aug 2025 22:05:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uDWlK6j32HWIWE7NdnUcq8V7keD4s/qkYfQwk9xK+HHna+AlImt5qnkYIRmQB1ILNQzfNmb9w4C2ZmobYCJ4vweMPJjCSPcX+lW+sGlCZAqWIGVZkDXnKEDJ2s3CTn57mZJEg9vDhmJZ2Ceb+pai3U4ff7Dp2iI3LcBfFbzQMRCkv7m5qMiwGdY5CNXRCI8cgBgErJGYFickuGgJ4Lc5HFFx3gLPQagfJKZ1NqQuGsk5OkU7RQ3fgXBkfj4r8FBUrIaI/LjMVMy8gSs+WUsUarDCixee/SLRvHDB6oBAmzZ1pXCWC5vCbc01w9QbPWpEFRvmoVHzmRJnodJcvJyW+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MQrm1C1/Wo/WrlxE+2k+pFXJSPSDaBnBugTNgvlUF+c=;
 b=x7Ss+jNOYTzpeizX6sPzIaCXxICNFf2l+xjF4w/C7mfiYgi29BG7p4DMIbygja5J4+rTrGPLjfJJcONdKWDfjnfLAGIaxkvBsdswj8lhecFxDUwmvO2o0nRbRWOa/FfuqAKfFhmB/iWs2qW+VFnWbtX3+/mS9v5jAdTIBN/uQgf9MeB5BgA698kwjAzdr+LMDyL2ejixb36KNm0Um8Attl/H1Ir77uW8Cu2bUWcSJDX0V4scZirjV5od0qqzGEs/BbVGEsek+63H03qkiAAVbQuYnVcmD1CFlU3fjV863Uszmo5rRlZ8JqSSRqzMHTtWu/Q8gL05p9f1zqMXyGDc9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by LV1PR11MB8819.namprd11.prod.outlook.com
 (2603:10b6:408:2b3::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Fri, 8 Aug
 2025 05:05:04 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::76e3:aa2a:a205:819f]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::76e3:aa2a:a205:819f%7]) with mapi id 15.20.9009.016; Fri, 8 Aug 2025
 05:05:03 +0000
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
Thread-Index: AQHcAutvtF48Hd1pDUSGm6UrRS1SEbRN1YcAgApofzA=
Date: Fri, 8 Aug 2025 05:05:03 +0000
Message-ID: <DM3PPF208195D8D863A5A2E8A151A77A7B3E32FA@DM3PPF208195D8D.namprd11.prod.outlook.com>
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
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|LV1PR11MB8819:EE_
x-ms-office365-filtering-correlation-id: ac6d7d4e-ff48-41b8-79c5-08ddd6392263
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|38070700018|921020; 
x-microsoft-antispam-message-info: =?utf-8?B?NjBvK2RxWWpqRFFvV3ZTRUJPY05od0NteWZycFk2aTFBU1g5MnNtNFpHaWxL?=
 =?utf-8?B?clhiK1BMMVFpNW5iamE5b2ttdlpQQ1BMaTdadG5wSVF3bjhMS3ZIQVZIb3BY?=
 =?utf-8?B?VjZZWmFVZC9nTXZQcUJPZEEzS1ZTRjFaRmhWakQyeFFKQ1hPK1BySlN3V2lF?=
 =?utf-8?B?TURpekozNW1Ka2p3N0ZrL2x6M3JPTXVrTnVZanVvTU9wN2t1WVgyT1lBdHo5?=
 =?utf-8?B?aXdGck1GemltbjluSG9xV3RJejN3N3VxRlIzU2hSaUZFemt3WDZVMkRFQXo4?=
 =?utf-8?B?NUJycHEvWmZSc3ZRM1RsU01oVHlsaER1MEJWaTNBeExQVE9hWHBQQ0FpRURJ?=
 =?utf-8?B?akJMMUtaMXZ1S1Z1YWFsRmVhSDIvVVk4cW5mdnRpZUdIcTRjNG9DMUZLVmFR?=
 =?utf-8?B?RVBhd0xrK3gwY1I2ZVNqclBkSVRtUHlhczFiOTdwR0cremkyNzZqYXRqQlln?=
 =?utf-8?B?ODVCOVl6UUI5MFU2bFpqaW9rakw1SlhjZ2dwMFBnN3BlaWo1STIrZ2FLOWkr?=
 =?utf-8?B?S2pkb3RNNktzL1ZwSy93a090bWt5clM2WndVNC9nMExaNWExL05iem9NU3o4?=
 =?utf-8?B?ZTVhV1hlUkVyZjcvQ0JKYjNneHdaOUYwWEFGZmFEUkkwNGZWdWovU29VSFVG?=
 =?utf-8?B?YTY5SGQ5Ym9KeGJLeG5jclVYVzN5WVhueThOM1A1S1E0MEU1aVBzQWY1TUlq?=
 =?utf-8?B?WXA5ZVNQNEYxSHZ4akIvNk9KMmJiL1ZYWEl6UURscDlveTBYWkFobGxjbUdU?=
 =?utf-8?B?azlTRDdWdkMzNFM5MHJrTGpvTHRxREdZNC9vSmRpMjgrSzhjeDQwMjNadWY4?=
 =?utf-8?B?WGd3d3B0a1V3dGZtaGhGdGhNbGNyZCswdXgyOWcrNXhFZmZ4Y2I5OXlZWks5?=
 =?utf-8?B?SWY4L2pFRDVtU1VSVVp4dTdwTVpXZFFZSXdGdG56WUd2U1U0WW52dEJJdUU1?=
 =?utf-8?B?aXFMQ0lzd0dvY0Q1QTJHVWF1MDFOSG5sbVF1MGl1Y0VPczh3UVVuS3R3NkxU?=
 =?utf-8?B?WXF3dkJIZFB5bXYxbFFQM3NZaC9kdS9xOXRYYlZaWnNRZFNZa1Y3d290ZUJU?=
 =?utf-8?B?OVg0Q204Zmx2ZkN5UUNJR2Fvb1FYMFQ0QkVtUXZ6WEt0aDBleFNIem1PazN2?=
 =?utf-8?B?NEdqNTBzSXpFSU5TY1lZRGxhZTdqUzViSnoyenI3WXdqNjcyVkxFenJWZmxU?=
 =?utf-8?B?WnpWdTJUbXVEU0IrdWNvcU1QQkM3MS9mS2RkTzBqZGJCUDJ4NzQ1Yzg4MVlW?=
 =?utf-8?B?SHpxRitiSHk2MmRzOUZ5S0NpOUY2U3VLTFRFNW1NemlaR2VUVVViTlhHT0cy?=
 =?utf-8?B?ZGYxbThyMG0yQ0ZudThRcnBEM0pHc3JEMEgrR3BVU08wNktYNUhFVWJKaU5K?=
 =?utf-8?B?N1EzN2ZYZmVOeFloR09kWEJFajk5V2ZCc0NVQWxlRVBQT0pQcmU2dG8rWGI3?=
 =?utf-8?B?SXREUHVCZFJtQ2RFYkJ6d2JZbFRtTVNRcHRlQTQvV0JiQ0RuTjFTbkdETXB3?=
 =?utf-8?B?dGFJZGJPQ2pKRkpHcG9UeWRwUjlkdFcvTkhBbGliMWd0cW9UaVNmNDRJcER3?=
 =?utf-8?B?cGMwSUNQSFJxTVJaLzVCcWVTV1VReURQdWFYVzdpOFFQeG9ROW50bVNDL3hU?=
 =?utf-8?B?R3R1TDY5QktKK250bEx0cjlmQmRQWmEraStQQUxpVmhIN0NxZEhGbkoybytJ?=
 =?utf-8?B?dEdQU3pJY3YrM0FBKzJ4dHl6WStzbnp5a1JXVnY2K1UwcitiVnBkMTQrTkVM?=
 =?utf-8?B?VjNhTURPVmZiYTYyRHo5WGRyVmVSRUZEWm83M2Z3dmYxQW0rUzRaTHpVbTg3?=
 =?utf-8?B?enJkRG8zdmRLZS9ra0IwL1hIU2c4K2NQUzM4bnJ6SjI2MXcreE5EWXozSC8z?=
 =?utf-8?B?SEk0cnpKK1ZuN3JTOWRKQjhiTXkrMEk2RVJkK1k3dWR1T0liTUN2RVNZQVV3?=
 =?utf-8?Q?AfyWR8KXMWK3B0D4EBjpLlz1sMj27KP/?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZHl5SU81bHVLWm41dDYrazEvcFhnZlZwb3FRbzVzY1FjZDRjTDNhWk1hZ1p6?=
 =?utf-8?B?N1JXM0pxYWJQRzBSWlM2NU1rdUc1VVIvTFFadEJtWG1vZVovMXVOUjcvTmhX?=
 =?utf-8?B?NWNTb0NqY1VseFJZNjV6NGk4d1o2amp6djFRSndKSzZ2SUlvSlNzUXN3YWNT?=
 =?utf-8?B?eERkOW03SEp3SE0zSDVLU0ZLaWhEMWpjdWZTOThicW52NVp1L1VDdUNDbEk4?=
 =?utf-8?B?eXRlWVB3Ynd5b3FmYmhMUkdTVmxwazZJbWh6SmNBQlVEa2lDNnBZaENIeFBa?=
 =?utf-8?B?bTF0c3RhOUM1RnY0NTNsMUczZzFHT1dDMS9xYVlRY2NZQ3J4MnA4Z05jREdz?=
 =?utf-8?B?R2lyQk1kMHZ5bXVFTkhMSkFHNVJZN3Y1VHBQdlpyYXNIdXd4dmt5TTQ3cHdZ?=
 =?utf-8?B?c1lOR3E5cEVtQnFNeEJ5TFFpRFVhZVByUzZZVnBjMklrMXp6TThKUTFoQVNz?=
 =?utf-8?B?UnE5TWdYVDB3U3ZqTngyTk8vU0dOWHJKb0JQelhQNGZuS0FpckFLdnlQY3ZU?=
 =?utf-8?B?bTgxOVprVE1BSHFEaS9QNGFhaGVaNTlEaGIzeGZNNjRtTjVHNkRBVUVmNmE5?=
 =?utf-8?B?dys0VVI4L3RNcHdsTTFKVGcvMEtzZjNBb1ZhTmRFZUVlL0NxREljT3hNYk4r?=
 =?utf-8?B?REFZQTBGZlF5YmY0eTcrTnFiNE1OZWcxNkNwNFVSaFl4N0VjR1pwdkdPaHgv?=
 =?utf-8?B?V2x0NnVFVXlZamtlK2xWRlhaLzFweWhobTZtQ2hjYzlaTWlncU5ORWNtVTRK?=
 =?utf-8?B?MlRHTlFUK3BpVGhPNnBsQXBKNTJxV0xoaUtvWjYrUEJoR2dCc1lMQTh3SHlJ?=
 =?utf-8?B?dTJTbjJMTHU2bENoNEJGaXJBVXBCYjhnZEJtZlNWSVJMV3JFdVBXL1lqakRV?=
 =?utf-8?B?bnhheE4vWHFUYy9XRy80cGJoYTNTcXVqQlZMRXJFZUVQaUs1MGdNNnFiM2Rz?=
 =?utf-8?B?cFBiUU1zRC9XL1JCN2lXY2VZNDRTTHBTOGVjaWkzRjJ3NWNSYW5WaFpJYXNE?=
 =?utf-8?B?NndLVHJxZ2IrcDBrSjBHVWJRK3A1cS9RQ0E5cnpoZEJRTEptVlVraTNDRm8x?=
 =?utf-8?B?UzNBVUpzUy9jcjI2RHZmVWNhcHZJR0JJeVFZa1pDek55K09sQlRwdVFSMm81?=
 =?utf-8?B?cmNFUEFhYWVjaUR3U1RTUncvVHFmejhhdjlreWpXL0FzWHgzeDBEbi8vbTVy?=
 =?utf-8?B?RnIvZjFZcmttWEc1bW9rempWaVlVWER6RDY4VTlBSldhcTZLekM1YmZaekN1?=
 =?utf-8?B?Z3JLVWxXR1dlWGxHdnNIYzI0UUUvcHNlQkorV3ZtY0R6amYyQlFZbGs4cVB6?=
 =?utf-8?B?MUsvUjlBcDFMSTdTRjcvOFZScHZRZW5Rcld6dml2U1NhMTZVL250MnA4Yith?=
 =?utf-8?B?RVlIV3FiaEYvbXlkbGw5R3ovTmU0ZTc5aEJLd3ZLNkhxVlRkRFo0U0FFVmY1?=
 =?utf-8?B?cVd5N1Y1UjZtMElRYmQyV1Jjak1ac0FuKzBQSkI5K0pGVzIvT2xGRStBdmU2?=
 =?utf-8?B?NjNXOWJDNVIzYlVuWE15R1pIV1Z0blFqamJ2TTJubGZkdERZNnZqOFlEemdm?=
 =?utf-8?B?R2duT2ROZEpvV0dGOW45ZFA0c052MVlnUkFPa0t6bEZUeUtlZmxRZjhMbFR6?=
 =?utf-8?B?cm16UDRQLzlvUFVNWWhRZTZEU2ZrbEF0RWlubmZyQ2RkUFkzYTMxOUF0VFI1?=
 =?utf-8?B?Q1dNTkdSK2VUMXlISDh5TXFiUzRDQ1NLVXhoSm1Cb0p3NU1KUjEyQTJrajFh?=
 =?utf-8?B?ajRkOUtRemZCYlhOcS9wcjhxL2VzOHRFR1VhZ2pDM3R2cDMwN1BjYVUzSmRY?=
 =?utf-8?B?OXBqWnF1ZkZHczFGaGFVUW14VHU5K3RydHlLYis4aXlVNjRxM3l0L2hjWEVq?=
 =?utf-8?B?MGFBQ0pvWlpoQnpuQk81eklCR0U0eVdCTVJJNVNXMENqSm9PeFhGN0pJSy9r?=
 =?utf-8?B?OE1WdGxVc2tZZ1pHb0VONzRsbWRmN210dkQ2TFdGenRMdm84RUtlcVlTUWNq?=
 =?utf-8?B?VXFtcDlsNlBtd0RLSEs1Lzc4RklkSnYzYmdCOWIvKzRlRWdtVFhkajMweS9Z?=
 =?utf-8?B?eWRINXhadmV1dmJGR2NXdEQrSVUraHVSUEZpQXJVL2FRc24vOFdnYm5PWUNR?=
 =?utf-8?Q?auZFLOhh8ch2dNwGoIgQ/NqxP?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac6d7d4e-ff48-41b8-79c5-08ddd6392263
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2025 05:05:03.4705 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8fmT9AjzlIoi/WNMQwVWjkvx847TceeQXReevCB1xjMaMr8NW/AUO2hBe5t18/Fv7F6D3W4U+CSQUiMf1Lf8yw==
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

PiA+IFNpZ25lZC1vZmYtYnk6IERtaXRyeSBCYXJ5c2hrb3YgPGRtaXRyeS5iYXJ5c2hrb3ZAb3Nz
LnF1YWxjb21tLmNvbT4NCg0KTEdUTSwNClJldmlld2VkLWJ5OiBTdXJhaiBLYW5kcGFsIDxzdXJh
ai5rYW5kcGFsQGludGVsLmNvbT4NCg0KPiA+IC0tLQ0KPiA+ICAgZHJpdmVycy9ncHUvZHJtL2Ry
bV93cml0ZWJhY2suYyB8IDE0ICsrKysrKystLS0tLS0tDQo+ID4gICBpbmNsdWRlL2RybS9kcm1f
d3JpdGViYWNrLmggICAgIHwgMTAgKysrKystLS0tLQ0KPiA+ICAgMiBmaWxlcyBjaGFuZ2VkLCAx
MiBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vZHJtX3dyaXRlYmFjay5jDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0vZHJt
X3dyaXRlYmFjay5jIGluZGV4DQo+ID4NCj4gMWEwMWRmOTFiMmM1ODY4ZTE1OGQ0ODliNzgyZjRj
NTdjNjFhMjcyYy4uZWMyNTc1YzRjMjFiNzQ0OTcwN2IwNTk1Mw0KPiAyMmUNCj4gPiAyMjAyYTBj
Zjk4NjUgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV93cml0ZWJhY2suYw0K
PiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fd3JpdGViYWNrLmMNCj4gPiBAQCAtMjM1LDcg
KzIzNSw3IEBAIHN0YXRpYyBpbnQgX19kcm1fd3JpdGViYWNrX2Nvbm5lY3Rvcl9pbml0KHN0cnVj
dA0KPiBkcm1fZGV2aWNlICpkZXYsDQo+ID4gICB9DQo+ID4NCj4gPiAgIC8qKg0KPiA+IC0gKiBk
cm1fd3JpdGViYWNrX2Nvbm5lY3Rvcl9pbml0X3dpdGhfZW5jb2RlciAtIEluaXRpYWxpemUgYSB3
cml0ZWJhY2sNCj4gPiBjb25uZWN0b3Igd2l0aA0KPiA+ICsgKiBkcm1fd3JpdGViYWNrX2Nvbm5l
Y3Rvcl9pbml0IC0gSW5pdGlhbGl6ZSBhIHdyaXRlYmFjayBjb25uZWN0b3INCj4gPiArIHdpdGgN
Cj4gPiAgICAqIGEgY3VzdG9tIGVuY29kZXINCj4gDQo+IElmIEkgdW5kZXJzdG9vZCBjb3JyZWN0
bHkgeW91ciBzZXJpZXMgeW91IHdhbnQgdG8gcmVkdWNlIHRoZSB1c2FnZSBvZiBub24tDQo+IGRy
bW0gd3JpdGViYWNrLCBzbyBtYXliZSB3ZSBjYW4gYWRkIGEgY29tbWVudCB0byBkaXJlY3QgcG9l
cGxlIHRvIGRybW0NCj4gdmFyaWFudCB0byBhdm9pZCBuZXcgdXNhZ2Ugb2YgdGhpcyBBUEk/DQo+
IA0KPiBXaXRoIG9yIHdpdGhvdXQgdGhpczoNCj4gDQo+IFJldmlld2VkLWJ5OiBMb3VpcyBDaGF1
dmV0IDxsb3Vpcy5jaGF1dmV0QGJvb3RsaW4uY29tPg0KPiANCj4gPiAgICAqDQo+ID4gICAgKiBA
ZGV2OiBEUk0gZGV2aWNlDQo+ID4gQEAgLTI2MywxMSArMjYzLDExIEBAIHN0YXRpYyBpbnQgX19k
cm1fd3JpdGViYWNrX2Nvbm5lY3Rvcl9pbml0KHN0cnVjdA0KPiBkcm1fZGV2aWNlICpkZXYsDQo+
ID4gICAgKg0KPiA+ICAgICogUmV0dXJuczogMCBvbiBzdWNjZXNzLCBvciBhIG5lZ2F0aXZlIGVy
cm9yIGNvZGUNCj4gPiAgICAqLw0KPiA+IC1pbnQgZHJtX3dyaXRlYmFja19jb25uZWN0b3JfaW5p
dF93aXRoX2VuY29kZXIoc3RydWN0IGRybV9kZXZpY2UgKmRldiwNCj4gPiAtCQkJCQkgICAgICBz
dHJ1Y3QgZHJtX3dyaXRlYmFja19jb25uZWN0b3INCj4gKndiX2Nvbm5lY3RvciwNCj4gPiAtCQkJ
CQkgICAgICBzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuYywNCj4gPiAtCQkJCQkgICAgICBjb25zdCBz
dHJ1Y3QgZHJtX2Nvbm5lY3Rvcl9mdW5jcw0KPiAqY29uX2Z1bmNzLA0KPiA+IC0JCQkJCSAgICAg
IGNvbnN0IHUzMiAqZm9ybWF0cywgaW50IG5fZm9ybWF0cykNCj4gPiAraW50IGRybV93cml0ZWJh
Y2tfY29ubmVjdG9yX2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwNCj4gPiArCQkJCSBzdHJ1
Y3QgZHJtX3dyaXRlYmFja19jb25uZWN0b3INCj4gKndiX2Nvbm5lY3RvciwNCj4gPiArCQkJCSBj
b25zdCBzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcl9mdW5jcw0KPiAqY29uX2Z1bmNzLA0KPiA+ICsJCQkJ
IHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jLA0KPiA+ICsJCQkJIGNvbnN0IHUzMiAqZm9ybWF0cywg
aW50IG5fZm9ybWF0cykNCj4gPiAgIHsNCj4gPiAgIAlzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29u
bmVjdG9yID0gJndiX2Nvbm5lY3Rvci0+YmFzZTsNCj4gPiAgIAlpbnQgcmV0Ow0KPiA+IEBAIC0y
ODQsNyArMjg0LDcgQEAgaW50DQo+ID4gZHJtX3dyaXRlYmFja19jb25uZWN0b3JfaW5pdF93aXRo
X2VuY29kZXIoc3RydWN0IGRybV9kZXZpY2UgKmRldiwNCj4gPg0KPiA+ICAgCXJldHVybiByZXQ7
DQo+ID4gICB9DQo+ID4gLUVYUE9SVF9TWU1CT0woZHJtX3dyaXRlYmFja19jb25uZWN0b3JfaW5p
dF93aXRoX2VuY29kZXIpOw0KPiA+ICtFWFBPUlRfU1lNQk9MKGRybV93cml0ZWJhY2tfY29ubmVj
dG9yX2luaXQpOw0KPiA+DQo+ID4gICAvKioNCj4gPiAgICAqIGRybV93cml0ZWJhY2tfY29ubmVj
dG9yX2NsZWFudXAgLSBDbGVhbnVwIHRoZSB3cml0ZWJhY2sgY29ubmVjdG9yDQo+ID4gZGlmZiAt
LWdpdCBhL2luY2x1ZGUvZHJtL2RybV93cml0ZWJhY2suaCBiL2luY2x1ZGUvZHJtL2RybV93cml0
ZWJhY2suaA0KPiA+IGluZGV4DQo+ID4NCj4gODc5Y2ExMDMzMjBjYzIyNWZmYjM2ODc0MTkwODgz
NjEzMTU1MzVmYy4uOTU4NDY2YTA1ZTYwNGIzODc3MjI2MTBmYzENCj4gMWYNCj4gPiA5ZTg0MTMx
NmQyMWIgMTAwNjQ0DQo+ID4gLS0tIGEvaW5jbHVkZS9kcm0vZHJtX3dyaXRlYmFjay5oDQo+ID4g
KysrIGIvaW5jbHVkZS9kcm0vZHJtX3dyaXRlYmFjay5oDQo+ID4gQEAgLTEzNywxMSArMTM3LDEx
IEBAIGRybV9jb25uZWN0b3JfdG9fd3JpdGViYWNrKHN0cnVjdA0KPiBkcm1fY29ubmVjdG9yICpj
b25uZWN0b3IpDQo+ID4gICAJcmV0dXJuIGNvbnRhaW5lcl9vZihjb25uZWN0b3IsIHN0cnVjdCBk
cm1fd3JpdGViYWNrX2Nvbm5lY3RvciwgYmFzZSk7DQo+ID4gICB9DQo+ID4NCj4gPiAtaW50IGRy
bV93cml0ZWJhY2tfY29ubmVjdG9yX2luaXRfd2l0aF9lbmNvZGVyKHN0cnVjdCBkcm1fZGV2aWNl
ICpkZXYsDQo+ID4gLQkJCQlzdHJ1Y3QgZHJtX3dyaXRlYmFja19jb25uZWN0b3INCj4gKndiX2Nv
bm5lY3RvciwNCj4gPiAtCQkJCXN0cnVjdCBkcm1fZW5jb2RlciAqZW5jLA0KPiA+IC0JCQkJY29u
c3Qgc3RydWN0IGRybV9jb25uZWN0b3JfZnVuY3MNCj4gKmNvbl9mdW5jcywgY29uc3QgdTMyICpm
b3JtYXRzLA0KPiA+IC0JCQkJaW50IG5fZm9ybWF0cyk7DQo+ID4gK2ludCBkcm1fd3JpdGViYWNr
X2Nvbm5lY3Rvcl9pbml0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsDQo+ID4gKwkJCQkgc3RydWN0
IGRybV93cml0ZWJhY2tfY29ubmVjdG9yDQo+ICp3Yl9jb25uZWN0b3IsDQo+ID4gKwkJCQkgY29u
c3Qgc3RydWN0IGRybV9jb25uZWN0b3JfZnVuY3MNCj4gKmNvbl9mdW5jcywNCj4gPiArCQkJCSBz
dHJ1Y3QgZHJtX2VuY29kZXIgKmVuYywNCj4gPiArCQkJCSBjb25zdCB1MzIgKmZvcm1hdHMsIGlu
dCBuX2Zvcm1hdHMpOw0KPiA+DQo+ID4gICBpbnQgZHJtbV93cml0ZWJhY2tfY29ubmVjdG9yX2lu
aXQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwNCj4gPiAgIAkJCQkgIHN0cnVjdCBkcm1fd3JpdGVi
YWNrX2Nvbm5lY3Rvcg0KPiAqd2JfY29ubmVjdG9yLA0KPiA+DQo+IA0KPiAtLQ0KPiBMb3VpcyBD
aGF1dmV0LCBCb290bGluDQo+IEVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcN
Cj4gaHR0cHM6Ly9ib290bGluLmNvbQ0KDQo=
