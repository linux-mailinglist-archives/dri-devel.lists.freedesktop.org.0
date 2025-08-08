Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF10CB1E161
	for <lists+dri-devel@lfdr.de>; Fri,  8 Aug 2025 07:02:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 546F210E1B9;
	Fri,  8 Aug 2025 05:02:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jVX2gyY7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9297210E1B9;
 Fri,  8 Aug 2025 05:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754629360; x=1786165360;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Ny9/fwXopMiutZpSqiWXlSfuaOHysbRD65A2XHDXQnc=;
 b=jVX2gyY7u5jJurxmiGR++FN+i94pyu0psINs8WT8hH9S7r2vmfQIVfhU
 3bDk9AtvEUuzOqXUFBJ4iwOsYDoQqAcbBxNQYaqrtby2z5qojQIeO9OFO
 r+8oLn1ZV3XFrQ9B5EQilQjuddm/WVE//kMu3jruAUqwixdxoPybFpWHd
 tSmKSJ3ofrD6dSvhfPh2f2Kzl3Vr79a9gWakfhYigGOCwYQS3ES4UEdm0
 oYTwMaRpjCFn6UFLdX3KEP7rgwgQTZJYaLc4jBXuPKDw3rNSVUMMqgDG5
 LyVxfPAkvczJ9VH8nbhXcH1Hk2Hphy16o+XxOdoBj2Hm9ZBfSO5GJzXbq g==;
X-CSE-ConnectionGUID: SXGSA+A7QQ6n+vH0FSAQHA==
X-CSE-MsgGUID: wtrruzE2ThKcPmzSgq4NPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="57047117"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="57047117"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2025 22:02:40 -0700
X-CSE-ConnectionGUID: xjmn1f2dQm6wdHrthq4hzQ==
X-CSE-MsgGUID: soUSD9LGSnyurmQ+M0RntQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="169450596"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2025 22:02:39 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 7 Aug 2025 22:02:38 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 7 Aug 2025 22:02:38 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.86)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 7 Aug 2025 22:02:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hzDgp+wseSP+orFx9EQcMe4+VNgNrx3CWrJ394f22qJV1ne1nrjTgwyQF+Juooh/2UTpMwsOKYVji8BPPrnjAjIuQBP40rKCHQYyE80xWpLCX/dzyazCytwESM3bVrwXTV1XB2fX1zwzq7KBTa4lkpbV6uQxBppN2Z4QWVzITuSs4CbIUCTjH0NiLDVtVZbGXP7kU6KWT3PcyumNXKXSX/jUsmRe38iVsZLXOXFiFKlhiyYv15ToicwRnQapIFOAZLIaaS6S2BJeNtXSsM26asjZFVMllTxmgX2hXsNNrzyncAnS7ZbiuWwhNlEPJ0CByoCKVyOYBMmKnMYKrgo+zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ny9/fwXopMiutZpSqiWXlSfuaOHysbRD65A2XHDXQnc=;
 b=j5x9tXPPO8vlFPxbiSb1dfsdNTIMaqJxDIoC/q1ZFrgLW0ZfMh5pFDaiNHm6gqueNJ74Y9izhk98S4vNVD7tOceZ6SnIP61cFxsuXAxYtGIOb7NY2Kw+wPDWRDInIAAfMW1yE22q2XuOerLavfo/Tx3cXNn9b4HqOmP5pXFdpI4ujpuJDrWGDyY0HWmn4hPtF1adwNVi1RRVF8828COxHx4qeZ/Jc6KjbPJIHLGjoC+vZ3pa82Ea17F/7Zi2LCuVbhbs9m2MKOUv1Xjr+cKO0LyruNJ1azJxtw+tMcowurhOZhEthQtQI1Qnv76/EnKPu/lEufwvYnES7YtEQDQ2wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by LV1PR11MB8819.namprd11.prod.outlook.com
 (2603:10b6:408:2b3::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Fri, 8 Aug
 2025 05:02:34 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::76e3:aa2a:a205:819f]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::76e3:aa2a:a205:819f%7]) with mapi id 15.20.9009.016; Fri, 8 Aug 2025
 05:02:34 +0000
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
Subject: RE: [PATCH 2/8] drm/komeda: use drmm_writeback_connector_init()
Thread-Topic: [PATCH 2/8] drm/komeda: use drmm_writeback_connector_init()
Thread-Index: AQHcAutl+P6RANl3nkigi10ysWdszLRYPWBw
Date: Fri, 8 Aug 2025 05:02:34 +0000
Message-ID: <DM3PPF208195D8D9FE51A3A0FA7867354A7E32FA@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20250801-wb-drop-encoder-v1-0-824646042f7d@oss.qualcomm.com>
 <20250801-wb-drop-encoder-v1-2-824646042f7d@oss.qualcomm.com>
In-Reply-To: <20250801-wb-drop-encoder-v1-2-824646042f7d@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|LV1PR11MB8819:EE_
x-ms-office365-filtering-correlation-id: c8101e21-c8a0-469f-e591-08ddd638c98b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|38070700018|921020; 
x-microsoft-antispam-message-info: =?utf-8?B?YU16cVY0TW9ocUlNWWRtY3k1bU9vSlpaZC90SXdram9iUC9qTk55L0JteDJn?=
 =?utf-8?B?RG85eWNkTEpod0JYOWJ6T1hxMk9lL0g4dkJOYWVLY1dlVk9WZjE0NXFQbEgx?=
 =?utf-8?B?RnMvTDVQc1ljb3VjNDJnNjUvdmVHcW02ZTlTS1MzVUpsZGZaalh5KzN6OVh5?=
 =?utf-8?B?NW53N2dFRVRXZnBoMHc4WURSd0owL0xXUE5ObGV5TWFPRW53aXFlajVXNFVS?=
 =?utf-8?B?UWhIeW9TUHk4WEJkU2ZXNW9CdHlaTWZvOVltV2xuNGd4MFM3YUZvckwwL2Fn?=
 =?utf-8?B?ZXhSWWI4M2hrNTRFYWFDUm92SzNGVWpWcEhEUXF2NHhHU0tCVFlEZ1dNWVZN?=
 =?utf-8?B?Vk9SUVBDV2MwMUlRbWYzY3lHZFRyWHRuQ3RyejNPV3pIZmZLaXlFSlBqWHo5?=
 =?utf-8?B?ajZaak5ETXRtaDIvcUM4VTN4clIrdFRGK0FncGNHTjlNdFE2STBXcnNLam0w?=
 =?utf-8?B?WmRFMTh1L0tTWGRIWktVTVNadjRnaHpITWMvRjBSZGI0ZnZiVmlGbE9paTh3?=
 =?utf-8?B?RTNZVmtpblBPK05IYnJlenNnaEV0RXZqcFlEaW1wWkVxTFJpNlZFdHdMenQw?=
 =?utf-8?B?TDBJdWJxSU85K1RaVEVHUlNid3ZtRGxKQ3pLQTRrWVVUSHFMWEFaVGRVRGdK?=
 =?utf-8?B?Njh3VWdldU91Z2dJOHlKYW1FUnRqRFh3WUl1T1ZwRS9hcmx6bTNJMGxqS1Zu?=
 =?utf-8?B?SWtzSVJycFlIblZDTHRiT3NFNEZlb0dDbng3K1Exd0k2NHpWaTZYckc3Ry93?=
 =?utf-8?B?d1crL2hURWxRck1VVUdTSmlnLysvdWswK2JVdFlmMTFDM3krOUsxNjlsZXZ0?=
 =?utf-8?B?RGs3T3l5WS9kYXVCaUpQd1c2ZEtpWmthMFdoSDZlL1FYQkpiOGFaZ2ZBZ05w?=
 =?utf-8?B?bDRsb1B4T3ZEL0RSajF1TmpCNm1Vby9lNmJtdk5oWnlleDFteFZ4R1lYQ0tw?=
 =?utf-8?B?ZURCSjJ3dnppMkh5cHRjcEc1dTlqTHBKVnNZYy9aa0VRd011a2xxakE2TFNo?=
 =?utf-8?B?T2dabTdUZ1pJWkpCc01xSll5WWJxK29EVXpxZEdadUplYU9CUWRmRitPTkxZ?=
 =?utf-8?B?aCtBZVIzYXA5djhEeWFlWmxsME9vWmZNTjRrSXVuNXExaTVEcHdzOGZKaHE4?=
 =?utf-8?B?NzA4N3p3V3JZSnl1SmhMcjNqOE9aWFhRTDhWNTFyWXZvWm5PNjVSRno1aUcz?=
 =?utf-8?B?QkJMb21QV2pzQWxUd0g4L1JWTkFjTXVHbm9HQUczSmFpcG9KYm1hdlJnZzRG?=
 =?utf-8?B?WkFJL0NzUHRYT0FtelFJOFRIWEZZNjBtVW1Ga2g1V1RQUlJIcXJraVlYTm9G?=
 =?utf-8?B?UHV6NjhWWFMybzg1R3ZscUgyRkxqMnIraWZVUjJQMTYzNmxWK0dab1QxRnhP?=
 =?utf-8?B?Tkd5aFRCMlh4UVhEMFZTSG9hWDl6L1IzNVBnMDF4eWh2VTZXMjBsMDZFc0lE?=
 =?utf-8?B?ejFQZ0M2Q2o0dUFZMTY3RTNRRVJNWVQxQ3BrQmJ6VE5wckt2dzYvVEpqcDgz?=
 =?utf-8?B?WVJaOFFKUmg5U0FPZVVtVzBqNzFoQkFMWDdVdDYraTBWUSsyMmVVRE8wbElS?=
 =?utf-8?B?MFhaVUJxQ1VDVzNBQ0Y5TW5ZOU45emNxVWN2czV5NWRFU0JTYWpFcjkwcmhR?=
 =?utf-8?B?UDlWUlJXcjgzcVBacWhSamFtelB4b2xRbkMwTzVsSWhJZGRnODZYNnFBK0cr?=
 =?utf-8?B?NUE2KytpMDlQWjIxd3hUa3phTlNIcTZMSVlRWlNzR2RlS285bjFKNDF3bXlR?=
 =?utf-8?B?RVNobFpDQ1hDWG9SY1p4N3RydWZwR2pnVDIvYnU1dmtZK3htanBidDNZOFoz?=
 =?utf-8?B?TkhFL1B2SXdBckVZd01FNVhUL2lhdFJrTDNrMUFCcWorL0xZTXl0MDJkdW5J?=
 =?utf-8?B?NytBZDdod0xORXp1Slp1dVM5RkZCYk1ZdWxsRDhmYjYyM2t5OEExSkNkV0RL?=
 =?utf-8?B?K2VOR004d0hUaXNQSkZXOHdWTkpabVJmMTNXb0o2UnViRHg2MmdUa1F1U2xo?=
 =?utf-8?Q?IkCkjZinvREpKicCiWepMw0jfVL5TE=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NDk2UVdZVCtSajdBMzYyLzRyVlRkdWEvbkd5disvQTFVVmxWeWhtUFJaZ0NB?=
 =?utf-8?B?c0xyZE51c0ozY3NSODZrWnh0VnhxMVZNTldmQnIxMkZ6anRDQ01MZHh5ZWRH?=
 =?utf-8?B?V0JVTDRVVUkyVHJSalVHS3F6dlEvV29pbWRTdDFsYkgwazlmbmhWWVZOOVRG?=
 =?utf-8?B?djdYTC9XSzhIVXBmVDNxY2pZdy9yVnBXUjZTdXlnMENWZzlJaFlVdE4xcGdv?=
 =?utf-8?B?RlczT1RQWTFUS1FJWEFERjRFV3c3WS9FVnZuS21lSHpzVzVUenpFUUtQUCtw?=
 =?utf-8?B?TjdNU2VEcEQzcVhkeHF6bVZ0NGlHeTdCUGJEaFVqdnNEYTZQQVFxdFVhSGg5?=
 =?utf-8?B?c2ZWcnJoblFsc2ltME9UeTE2eURqQnRvNk9TR1JYaDlBT2tHaG4xeldMcndP?=
 =?utf-8?B?UXpBeEQ2NmZYN2VvdWxKNG11UDJFZ1F1ZGdqQnBaVk1DSFdJa2VmR1pDRHoy?=
 =?utf-8?B?SW9JczdnY2RLMG1VSXZrU3dKUWtiMVJReVNwSkNNSlhaMlRuN1BMSU5mY1lq?=
 =?utf-8?B?K3FKR1ZKSGV3TGtJVENLTzZIaG9ZOUpyUG5wZC9uNDlqUC84bmhDZVIrN29l?=
 =?utf-8?B?bWJ4dFplbDhaaExVV2ZFYkE3cU8xdWlGaHZjK3pUV1FITWhkQXdiaUxaS2E5?=
 =?utf-8?B?VEtOYSt5aU9mMnpLOUdTcytCSlJ5cVVqM2Uwdm5FVi81VWkyb0oxcS90eUJl?=
 =?utf-8?B?MDJSSU5kT2ZGekR5NFRwcXk4NjRxQXE3MzNiV0J0UmRvZzVKRWdrVFMrQ1Aw?=
 =?utf-8?B?MHBBSS85a0JQSXV6blBmeldkNFBheStlcldDTVFJWFl0VzdNb28wcTBjKzJN?=
 =?utf-8?B?NTQ5MlQzSkhndGt0V1RHRVo0RG5GNGNlanQ0emJvRS9PdXFtQUNRb0l5M0tX?=
 =?utf-8?B?OGJRcGs3QU5DT1BuSjl4KytIbC82MWZVeU9vZk5lV2Y3aVlEK1FnQ09Edyt0?=
 =?utf-8?B?YU83WXArejVMeUo5VHdYTm5Gek5OTktDbVc4dGsyWU93ZWpJUnN5ajNkbzhm?=
 =?utf-8?B?OUpJZFFSVy9ydTZUMFl0d2FGVzE5TGw5eW1hTDY5dk5CWGtWeWp1TWQ4R3B0?=
 =?utf-8?B?R3JOeHU1a2l4OE84WkNGbnVIS2d3Y0p0TTlKampvVndrbkZjMHpRcVYxamNW?=
 =?utf-8?B?bVNkNlBwNlI1RDRtR1pCK002ZzZobWRaVTJSRXBpSnpTdGFwMVBNeUVmbUEr?=
 =?utf-8?B?bENjZzd5M2FxTDJWaVZNUk5haFgydkE4TkdpQ2JxZTdacjRRbHIybHdPN1ZH?=
 =?utf-8?B?c1NMa3hXS1hlMCs5bFFreGpJMFdkb1pZVmJEc0FsSndDRThLUkJmMnE2TTBJ?=
 =?utf-8?B?UkZidStLTDk4OFhHN01RUEFFZmE5N1ZENXpMLzhWREU2b2FGNlpRUTFldHZT?=
 =?utf-8?B?RkxZcVhZUjJ4VDArNUJDZitZK0I3SFB1VFFOczB3UmJsdEhYbzRtd3Z0MXdy?=
 =?utf-8?B?dFVFTzNubkMvL1RQb3QzdzNRMzBkOUxXbWZEVWZmZXZzSXpUb2ZocWNuMU8r?=
 =?utf-8?B?NWpoMVpIRW9JYjZuNzdlcmtlSDdKTUdZRm1oV3hBamNDbUlvWDAwQUdxQmZY?=
 =?utf-8?B?NHBKYis5Yi9RbjFlSnMrV3NOV0RLU2xsRUg1ZFhxYWYyVy9BWWhFZGZvaTlW?=
 =?utf-8?B?WGI3SGtlTC9vbm8vQllac2d4M24xU1RydmVYRlZMNXptL2lMRWJrNURaTmsx?=
 =?utf-8?B?ZkxCbTlpMlVFSUcvUEJjeHp1eGsxK1JDOVJIdzdFUTdpeDNuTmh5VFdXSzJh?=
 =?utf-8?B?MHQ2UVFNeERyTGhzNVYwb2ltSkpmeHBjbGpGazd2SlB2UEN3c3M4cDB6c3VC?=
 =?utf-8?B?S2ZwV1AyN2Nod1lXdFUwMDZLRllRd3RMZDFyTnVyRFBGckNMRFhBN1JlYXcw?=
 =?utf-8?B?amxhU01XZlJITHV6UzlLeHBveGZSalkrY2hlVGhkUkVWV2Q2MUdTblBLWWp2?=
 =?utf-8?B?N1RObnByQm12WVFVbzBlbms3YjdOcHZEMEtNR3oxVDkvR3pvS3d6OFQxRW5t?=
 =?utf-8?B?a2hNbDdxUHc2NTh5OEFhNTJYc1pndTVoekhUR2hEKzFmWVRsSndGSzhYaTNw?=
 =?utf-8?B?ZmxLTlp6SUlLTlN4TXM2Y3Y4VFVwMDFGVWhDNmtrU3U2UkZ0U0JmWEhNdTgy?=
 =?utf-8?Q?5oM2SbfG+h4LRYArA81/r6Gon?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8101e21-c8a0-469f-e591-08ddd638c98b
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2025 05:02:34.3962 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GwFWHYdYwCcZ/vYZMAhtAIj4YzMrnXTI6lHfAMdaZDtJP1s8TrsCZNxX3ygdHv3djjHloFAK4RJKUg+Owd6kaQ==
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

PiBTdWJqZWN0OiBbUEFUQ0ggMi84XSBkcm0va29tZWRhOiB1c2UgZHJtbV93cml0ZWJhY2tfY29u
bmVjdG9yX2luaXQoKQ0KPiANCj4gVXNlIGRybW1fcGxhaW5fZW5jb2Rlcl9hbGxvYygpIHRvIGFs
bG9jYXRlIHNpbXBsZSBlbmNvZGVyIGFuZA0KPiBkcm1tX3dyaXRlYmFja19jb25uZWN0b3JfaW5p
dCgpIGluIG9yZGVyIHRvIGluaXRpYWxpemUgd3JpdGViYWNrIGNvbm5lY3Rvcg0KPiBpbnN0YW5j
ZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IERtaXRyeSBCYXJ5c2hrb3YgPGRtaXRyeS5iYXJ5c2hr
b3ZAb3NzLnF1YWxjb21tLmNvbT4NCg0KTEdUTSwNClJldmlld2VkLWJ5OiBTdXJhaiBLYW5kcGFs
IDxzdXJhai5rYW5kcGFsQGludGVsLmNvbT4NCg0KPiAtLS0NCj4gIC4uLi9kcm0vYXJtL2Rpc3Bs
YXkva29tZWRhL2tvbWVkYV93Yl9jb25uZWN0b3IuYyAgIHwgMzAgKysrKysrKysrKysrLS0tLQ0K
PiAtLS0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCAxMyBkZWxldGlv
bnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29t
ZWRhL2tvbWVkYV93Yl9jb25uZWN0b3IuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxh
eS9rb21lZGEva29tZWRhX3diX2Nvbm5lY3Rvci5jDQo+IGluZGV4DQo+IDg3NWNkYmZmMThjOWRj
OTdlNzM2MDQ5ZmVhYThhMWZlMWJjYzgyZmYuLjIxMDg0MWI0NDUzYWJmZTYwY2VjYzFjZmM3OWE4
DQo+IDQyOThiZTNlNjg0IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3Bs
YXkva29tZWRhL2tvbWVkYV93Yl9jb25uZWN0b3IuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
YXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV93Yl9jb25uZWN0b3IuYw0KPiBAQCAtNSw2ICs1LDcg
QEANCj4gICAqDQo+ICAgKi8NCj4gICNpbmNsdWRlIDxkcm0vZHJtX2ZyYW1lYnVmZmVyLmg+DQo+
ICsjaW5jbHVkZSA8ZHJtL2RybV9tYW5hZ2VkLmg+DQo+ICAjaW5jbHVkZSAia29tZWRhX2Rldi5o
Ig0KPiAgI2luY2x1ZGUgImtvbWVkYV9rbXMuaCINCj4gDQo+IEBAIC0xMjEsMTcgKzEyMiwxMCBA
QCBrb21lZGFfd2JfY29ubmVjdG9yX2ZpbGxfbW9kZXMoc3RydWN0DQo+IGRybV9jb25uZWN0b3Ig
KmNvbm5lY3RvciwNCj4gIAlyZXR1cm4gMDsNCj4gIH0NCj4gDQo+IC1zdGF0aWMgdm9pZCBrb21l
ZGFfd2JfY29ubmVjdG9yX2Rlc3Ryb3koc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcikN
Cj4gLXsNCj4gLQlkcm1fY29ubmVjdG9yX2NsZWFudXAoY29ubmVjdG9yKTsNCj4gLQlrZnJlZSh0
b19rY29ubih0b193Yl9jb25uKGNvbm5lY3RvcikpKTsNCj4gLX0NCj4gLQ0KPiAgc3RhdGljIGNv
bnN0IHN0cnVjdCBkcm1fY29ubmVjdG9yX2Z1bmNzIGtvbWVkYV93Yl9jb25uZWN0b3JfZnVuY3Mg
PSB7DQo+ICAJLnJlc2V0CQkJPSBkcm1fYXRvbWljX2hlbHBlcl9jb25uZWN0b3JfcmVzZXQsDQo+
ICAJLmRldGVjdAkJCT0ga29tZWRhX3diX2Nvbm5lY3Rvcl9kZXRlY3QsDQo+ICAJLmZpbGxfbW9k
ZXMJCT0ga29tZWRhX3diX2Nvbm5lY3Rvcl9maWxsX21vZGVzLA0KPiAtCS5kZXN0cm95CQk9IGtv
bWVkYV93Yl9jb25uZWN0b3JfZGVzdHJveSwNCj4gIAkuYXRvbWljX2R1cGxpY2F0ZV9zdGF0ZQk9
DQo+IGRybV9hdG9taWNfaGVscGVyX2Nvbm5lY3Rvcl9kdXBsaWNhdGVfc3RhdGUsDQo+ICAJLmF0
b21pY19kZXN0cm95X3N0YXRlCT0NCj4gZHJtX2F0b21pY19oZWxwZXJfY29ubmVjdG9yX2Rlc3Ry
b3lfc3RhdGUsDQo+ICB9Ow0KPiBAQCAtMTQzLDEzICsxMzcsMTUgQEAgc3RhdGljIGludCBrb21l
ZGFfd2JfY29ubmVjdG9yX2FkZChzdHJ1Y3QNCj4ga29tZWRhX2ttc19kZXYgKmttcywNCj4gIAlz
dHJ1Y3Qga29tZWRhX3diX2Nvbm5lY3RvciAqa3diX2Nvbm47DQo+ICAJc3RydWN0IGRybV93cml0
ZWJhY2tfY29ubmVjdG9yICp3Yl9jb25uOw0KPiAgCXN0cnVjdCBkcm1fZGlzcGxheV9pbmZvICpp
bmZvOw0KPiArCXN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlcjsNCj4gKw0KPiAgCXUzMiAqZm9y
bWF0cywgbl9mb3JtYXRzID0gMDsNCj4gIAlpbnQgZXJyOw0KPiANCj4gIAlpZiAoIWtjcnRjLT5t
YXN0ZXItPndiX2xheWVyKQ0KPiAgCQlyZXR1cm4gMDsNCj4gDQo+IC0Ja3diX2Nvbm4gPSBremFs
bG9jKHNpemVvZigqa3diX2Nvbm4pLCBHRlBfS0VSTkVMKTsNCj4gKwlrd2JfY29ubiA9IGRybW1f
a3phbGxvYygma21zLT5iYXNlLCBzaXplb2YoKmt3Yl9jb25uKSwNCj4gR0ZQX0tFUk5FTCk7DQo+
ICAJaWYgKCFrd2JfY29ubikNCj4gIAkJcmV0dXJuIC1FTk9NRU07DQo+IA0KPiBAQCAtMTY1LDEx
ICsxNjEsMTkgQEAgc3RhdGljIGludCBrb21lZGFfd2JfY29ubmVjdG9yX2FkZChzdHJ1Y3QNCj4g
a29tZWRhX2ttc19kZXYgKmttcywNCj4gIAkJcmV0dXJuIC1FTk9NRU07DQo+ICAJfQ0KPiANCj4g
LQllcnIgPSBkcm1fd3JpdGViYWNrX2Nvbm5lY3Rvcl9pbml0KCZrbXMtPmJhc2UsIHdiX2Nvbm4s
DQo+IC0JCQkJCSAgICZrb21lZGFfd2JfY29ubmVjdG9yX2Z1bmNzLA0KPiAtDQo+ICZrb21lZGFf
d2JfZW5jb2Rlcl9oZWxwZXJfZnVuY3MsDQo+IC0JCQkJCSAgIGZvcm1hdHMsIG5fZm9ybWF0cywN
Cj4gLQkJCQkJICAgQklUKGRybV9jcnRjX2luZGV4KCZrY3J0Yy0+YmFzZSkpKTsNCj4gKwllbmNv
ZGVyID0gZHJtbV9wbGFpbl9lbmNvZGVyX2FsbG9jKCZrbXMtPmJhc2UsIE5VTEwsDQo+ICsJCQkJ
CSAgIERSTV9NT0RFX0VOQ09ERVJfVklSVFVBTCwNCj4gTlVMTCk7DQo+ICsJaWYgKElTX0VSUihl
bmNvZGVyKSkNCj4gKwkJcmV0dXJuIFBUUl9FUlIoZW5jb2Rlcik7DQo+ICsNCj4gKwlkcm1fZW5j
b2Rlcl9oZWxwZXJfYWRkKGVuY29kZXIsDQo+ICZrb21lZGFfd2JfZW5jb2Rlcl9oZWxwZXJfZnVu
Y3MpOw0KPiArDQo+ICsJZW5jb2Rlci0+cG9zc2libGVfY3J0Y3MgPSBCSVQoZHJtX2NydGNfaW5k
ZXgoJmtjcnRjLT5iYXNlKSk7DQo+ICsNCj4gKwllcnIgPSBkcm1tX3dyaXRlYmFja19jb25uZWN0
b3JfaW5pdCgma21zLT5iYXNlLCB3Yl9jb25uLA0KPiArCQkJCQkgICAgJmtvbWVkYV93Yl9jb25u
ZWN0b3JfZnVuY3MsDQo+ICsJCQkJCSAgICBlbmNvZGVyLA0KPiArCQkJCQkgICAgZm9ybWF0cywg
bl9mb3JtYXRzKTsNCj4gIAlrb21lZGFfcHV0X2ZvdXJjY19saXN0KGZvcm1hdHMpOw0KPiAgCWlm
IChlcnIpIHsNCj4gIAkJa2ZyZWUoa3diX2Nvbm4pOw0KPiANCj4gLS0NCj4gMi4zOS41DQoNCg==
