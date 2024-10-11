Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CCF599A8FE
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 18:36:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 568AF10EB4E;
	Fri, 11 Oct 2024 16:36:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VBfbfSSM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2689F10EB4B
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 16:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728664597; x=1760200597;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=l/nDzi1UO+3CjB5XrE6ydC7gIGk3S7agLQgSjnMWF2k=;
 b=VBfbfSSM/4tAJsg6Jt5C14bzTKuNlZrkfWZRpqTZ5497CoTjaSoWOBbk
 ucAj/t1xw7F/Gr9egr3YPCo7Ja/8BJmYtN/L6nZY/I5VH8XkF62yimwBE
 Ac3OdkNgIrBaWKsHSxhDpv2hnFHeaMEUCzpR7gv8PmS0IFDrQ3dsft7Rg
 //YTv1sgpyI1uHsvHIRD8EVBIs3QTZwrpsLGO7I6BDqchE2pASm6vwjRj
 dud2It4QsDWU7srRkf1UG6rLVEIMk1ux6dBssFgzIofSmOfP23ARVviEF
 CtvzkBKvPUAXhzOOGNP2QhKY+LZbPIBqpVUHBABeZaS/N8b0kLeIWaQL/ w==;
X-CSE-ConnectionGUID: 6kuMYB0cQ5qHlCWi2k8eGg==
X-CSE-MsgGUID: TWnowm3bTDWjfTEnfrx9hA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28232748"
X-IronPort-AV: E=Sophos;i="6.11,196,1725346800"; d="scan'208";a="28232748"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2024 09:36:36 -0700
X-CSE-ConnectionGUID: Nc8IRQPBToOUK98tF4MU0A==
X-CSE-MsgGUID: yL8ZoN58TBy1Rvcyli5zBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,196,1725346800"; d="scan'208";a="81738256"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Oct 2024 09:36:36 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 11 Oct 2024 09:36:35 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 11 Oct 2024 09:36:35 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 11 Oct 2024 09:36:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xBilPkX7ETOPOXIEp7//BjevkmLbvI6xggRs1edNbOGxvps3ptT4RPQAwol6CM+UE7Lka06g0Ng/csy5XKFNhu5jREP7ugWP3jDCrsjeLciGDwPGMyoRNYqlxDGNDSh4GAI9sHptS24LutzH+1jkdyJe6NavBhr/iln+uJ5mo+J2xSItxYY2qsvCvJ+jzxNYu13illOEScmnOMjmsR8pL+5lYbD5c8OpLLpPZcE37HHktuIVddhJbX71bzxg+qCbK634vZCumnjf4LPptqiWgyTNJtLv0RKJk8dmND6IPAUw6gDLzSxqc9LLuVih+nog7cptI+Db5/tM7E72v7z+9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l/nDzi1UO+3CjB5XrE6ydC7gIGk3S7agLQgSjnMWF2k=;
 b=Ese9ngkviCNQsPhLiPnEbY7Rmqgo8dkav3qhtdxcIrhI62oJesjXxtMeur+TTqkTxUpqTldyJyy3jfoJn1bduWhQeyp9FgXZ2NhT1PbILEMbzX1lckkp/Z2YQ2ewLcS41mVJ6s56FVxeJNh8fZ6s+pL3Zi5NSs8IVy+42EPaKYHGbgiWe+bx7Y9Hy13zgO17Pp4+/TbBAoFscz6u/1nXELR2CHvBaWpUjTWB/gCmgt77gZxhI36rzU6wiX/xe/ABftayyxbVcCy8DKBLm1gRstt/rlCqq5XcwHhuf+cjNZMjeL4u62EPiaqbsa/OnNqZbBHqFzWatNLfrS+Ivrf8rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by CH3PR11MB8209.namprd11.prod.outlook.com (2603:10b6:610:15d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Fri, 11 Oct
 2024 16:36:32 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::acfd:b7e:b73b:9361]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::acfd:b7e:b73b:9361%4]) with mapi id 15.20.8048.018; Fri, 11 Oct 2024
 16:36:32 +0000
From: "Luck, Tony" <tony.luck@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
CC: "jfalempe@redhat.com" <jfalempe@redhat.com>, "airlied@redhat.com"
 <airlied@redhat.com>, "sam@ravnborg.org" <sam@ravnborg.org>,
 "emil.l.velikov@gmail.com" <emil.l.velikov@gmail.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "airlied@gmail.com"
 <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v5 0/7] drm/mgag200: Implement VBLANK support
Thread-Topic: [PATCH v5 0/7] drm/mgag200: Implement VBLANK support
Thread-Index: AQHbFJmT04jrr3jRak+Ttm6l1x35MrJzoo8AgAKwlQCAAIBHEIAI7u2AgABwP+CAACOLgIAA2BKAgACXNxA=
Date: Fri, 11 Oct 2024 16:36:32 +0000
Message-ID: <SJ1PR11MB608330D5E114CAF1408DEC9CFC792@SJ1PR11MB6083.namprd11.prod.outlook.com>
References: <20240718104551.575912-1-tzimmermann@suse.de>
 <Zvx6lSi7oq5xvTZb@agluck-desk3.sc.intel.com>
 <49f0ca61-0cf4-4093-b4a7-f49dc46037ab@suse.de>
 <SJ1PR11MB60836E1B04A688CF55506BF4FC702@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <ad02af39-b9b5-4b04-878b-78b3eb7885a5@suse.de>
 <SJ1PR11MB6083AE35E583A3E556B29004FC722@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <4769b892-b2a6-4f8b-a0c6-72fed9eacd31@suse.de>
 <SJ1PR11MB6083AC96151969AD04C4330DFC782@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <SJ1PR11MB6083B44A9FCF128144AEC78DFC782@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <f03a55ee-e355-40dd-94ad-749baeb435c8@suse.de>
In-Reply-To: <f03a55ee-e355-40dd-94ad-749baeb435c8@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6083:EE_|CH3PR11MB8209:EE_
x-ms-office365-filtering-correlation-id: 64b1d7e0-892b-4d2e-bb1f-08dcea12dd29
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?ZzlJL1V1K1NYbDhGQ1ZXdGU4b3YwUmJpZ0hDOE5TS2ttWmI5YUZncVh3SWQz?=
 =?utf-8?B?b0kvSjlLU1BBMkxJbGIrRnByZmF5MzNjTlFSWjJYQW1jNHZTRUsvQ29nUVVl?=
 =?utf-8?B?ZUloYm8zeEw5KzFXRFhQVHpKbnRnOG1sRVRYM1ExRXRaL3ZhejNZUTV2ZzBR?=
 =?utf-8?B?QlNCS1p5QXlrMktVNU9GMUZ6NzhPdXEwYVFyRFQxMjhUUzdPTDBNQ2NYMnlB?=
 =?utf-8?B?YXI4ck5NMG1RWkluMFJZSVV6dzBTMzFYM2tTeXNOTDVNams1YnFMUEZvMmFs?=
 =?utf-8?B?ZVFEYlk2eFh3andYR0psMlJINDBxbmU0c1ZmTGN2bEpyYWFpamg2WHh3S0Vn?=
 =?utf-8?B?eW42UEtnZm1PR0dEcDlxR3VJY3pPaG1mekkxeWhIeWpCK3BpdVBpZ0dScE53?=
 =?utf-8?B?WHhVVTlIa2FPb0pFSFJETnZZam5KWlBGT2JuY2xpZHhhTzlxalYrbmhoeitx?=
 =?utf-8?B?ak8yVGJocjl5dkF3WlRKbWtabzIrZHZrdWxyNUd4d2J4YzFJRWNocEdZcHA4?=
 =?utf-8?B?SDB5WFZOQktpRVhPTEpyc3BFOWUvYzVrVFdOMjY4T1FJeWsvaEZYc0YyT2hh?=
 =?utf-8?B?U1ZYRUJuK0tSb0pIRHhSYTQ3ZUs4b1hsQkpsbHJ4OGM4eG5GWHNTeE45d2Fs?=
 =?utf-8?B?OHZSS3BiWjd4WnBpcWxRc2tCUDBVMVVkM1grYzA2YTQ5VzdkMkNXbkFzSXhl?=
 =?utf-8?B?RFQ5M084emxkY3lZaHpaMXZSazZxOFh6cVUwNk9oSG1hcHhYcHBONlY5SkZa?=
 =?utf-8?B?THNVOUxIOWRvUFBIS1hwVTU1czlCM3ZEUFVHaXluT29acDcvN29aZW41ajBD?=
 =?utf-8?B?a3I4czdYbzVmZzd5TWJuU0FyVXMrK29ycVI5TVFUbjRtR2pIK05qcEg2U3JX?=
 =?utf-8?B?NzkxQ2ZnVDhRVHRJbThzUVE0cmhHd0Q5bHFRWS85UFg2MzEwd1lrK0I2L1Jp?=
 =?utf-8?B?WEF5VlRydnIvbTkxSVdsWTFRR1B0VzBRVzU2NWRhOEJ6U0RoUVgrUE81SFZ0?=
 =?utf-8?B?aUo1eFZ3dVA0OVV6VFVqM0R0V092Rk5mUW94ZmpCbldPQlNSQlRVUVdxTjVu?=
 =?utf-8?B?c0pSNkVxbm5uc1l0djFpa3doWEEraVBCY3ZKL21HVWNhcitQYk5TaUU0STky?=
 =?utf-8?B?SGNqK2VUM21rMmlnOE9SNVpDQm9lOG14aUpyVGQ2ak5DNmZCVGNFdm8vekRL?=
 =?utf-8?B?bFhSU2FwZWhhelJOQzBHdEcwWkJxU1h5WDM4cXBVL0RaK0h6NzFqZ21NdmZa?=
 =?utf-8?B?VTJlVGw2dG10b3hMQm1CTEhIVVc0RXRMcmV1enJ6MHZMVlcydGtualI4WXls?=
 =?utf-8?B?TjV0QzNmSWRjY0hpd1dTWkpReGZ3Sno4Tkl3UzltL1RKbFhTL2VpZUxSMHd3?=
 =?utf-8?B?bEx5alQzNll6MDArdDlWdWJQRmErbnRrUFZHdlNJR1B1eVA1d1BEa1dmMGRW?=
 =?utf-8?B?czkwQWFGVHcxVzcrdFhGVVF5ZXkrNzlyRnF4NlowcW1KU2pDanJUdlFGdTk4?=
 =?utf-8?B?cXY0TnBCVGdSVjkzMktqN2FyQXE1eENzMm1hTjVheFFEVTJhbzcxMGNVd2RU?=
 =?utf-8?B?allBWUVGaDZ0eFlhTmJ4ckNtRUt1VUM5OFEwcGNHdnJuYTA1TEIrcFBEVDN4?=
 =?utf-8?B?TUdOOE41Tlg0SFJnTUZMaW1mWHRtQndpZ0laWEpDaFZ4N0l2cGU5VXJMaDVO?=
 =?utf-8?B?czdVS1B6ajVCL0xDd3h4L0l2TjhSRUlUeVdGZkxQbFM5RXpxaXpZM21QaWdQ?=
 =?utf-8?B?WjUxSHQwK1UrTThWTmhuU1BWQ1JGaWZibFd5OWhYdDVHOGpVT0t0UFF2aDd2?=
 =?utf-8?B?UXEyR25iTmkwaGFTUnJmZz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6083.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MnJ0dlNhUGhRWnE2Z0RFTHJST0lIL3FmTFZpMmVpaDZCc1pwdUJDY0IrMGE1?=
 =?utf-8?B?bjQyQ1Jib3BhelBvUUJqTm9lNXJ3dTZBZ3ExdERyVW5CZmJNbFdjeS91V3hu?=
 =?utf-8?B?aGU2VFhXMTRhVXBOYVhrM1Qzc3A5RG9TVUtSK0RwWHpuSWRabS83SllwWUJr?=
 =?utf-8?B?R3pCTW5XMDRubzlqZ3krcGMzK1VFMzIrSVlmeUtrVnVmY29GY0cwaXVEK09v?=
 =?utf-8?B?Tk5abkhQcTFGcnRrZGM0ZENISlJNSmUxL1Uzd3VZc2ttU3RCRzVyaVNpRkVh?=
 =?utf-8?B?eXNGYzA4cW9IbVd4T2FrbTRZcU5rZjZrQ0tKTlNZa05Pa2ZFTTZMMUdzUXVr?=
 =?utf-8?B?UHBMMStJMXR1Y0RMeXVxVkFiQXBCMG9tc2tBM3dHWnBTazFxbjBXUlp1b3Z6?=
 =?utf-8?B?TDEzMFpVUXFtcFgwVkN0U0NpNFpDM1dyOUFaaGlZT25qbWg0cjFrTEZ6VVdM?=
 =?utf-8?B?QkdwVFhMbndTVlZDYS81N3lIZjNVWGl2anYwcFFYcFoxMlAybVRTYTN6NTVz?=
 =?utf-8?B?SzRGZTlsTE5od1F6SkVLbDBENWIzaUpoaHh0VEx4ZWRnWUpGcTFyMXkybkVR?=
 =?utf-8?B?Mmc1V3VZNDUwaWdOVTduVTZzZnBlVmhKZU14ejJPeGRKYTNnY1ExSVJIa0Q2?=
 =?utf-8?B?MUVaeFZGaE5ad1E1THBqWWhYMktKWXZsUnRUSHcyVk5NVXJsMHE0TnZIN3hn?=
 =?utf-8?B?eWhUK0swVXIvNEJTT3kvT283bXV3Y1lyL3RqWERoUHU4eUZBeWZ6blRxSVFo?=
 =?utf-8?B?RGR2Ym9aZDFUUnVEMzR5MjhvWXR3djV1SVFFV1BRQTczd1lGOWtBOS9MbkJy?=
 =?utf-8?B?TXlFNFcyNjJCbWZFdUEvZkk1bSt6VEF0WFRyTXFYRHZaUUZvQk9ISk90NHRD?=
 =?utf-8?B?K3gxcDQ1S0RQTjg3eHZvZStVMnJ2dWdqNEpibVF4cFBCejlxWmZPaUF6alZJ?=
 =?utf-8?B?blBzeEd1UTQxMVQ4M0JHMjdnVWgvbUdhVTEzQlZvTE94Y01nNndLUWRLckVr?=
 =?utf-8?B?VkRZVlZ3aXZsYXR2T1JXUlBzaGQzMHZPM2VEYVdmS2FGUWhIU3lzYWtzMXg2?=
 =?utf-8?B?NFJNckxFTlhSM3E2K295NHRZOVduaWU0ZVVhQ29BNzdDTktQYnZZOUl4OHpY?=
 =?utf-8?B?eUxkVTU0ci9GdWEvRG14WkQxL2F1MnlkYjI5SEJqRnJWOGZSckxGVGo5K0s0?=
 =?utf-8?B?T0tWWEhMeWNNcW5pOGJqVllKTEdhS2tYUkIrR0paWGNuWERTRzFTdEx1ZG5N?=
 =?utf-8?B?MmFpalBmRURaUDBoNGIvMXZZbWJWTmlxMGZuMjlDTWlYRkp1aXNlTGY3aVND?=
 =?utf-8?B?T1g4UE9yZngrL1k2blRMZXlWMFZyYnc1QjIwb0NHUWNRMzgzNGRFNXgybTRX?=
 =?utf-8?B?L2hsUC9IUHJVcjNQK1h1OTNURkVLVEZITXAzVGQvWlE3V1R0elhYZmltTyth?=
 =?utf-8?B?NTFjbm90dzA1c09pd2NkZE5BK0sydU5zS2hjZXZHZlZuKzM3Q1dkYzJXWlFi?=
 =?utf-8?B?UGtsRkZsS1NJS2dNTElKMTZqVlFkcnA1V0ZhTDBJZUhia0g0U1VGSUtuNjkw?=
 =?utf-8?B?QUpERmxlQVVSUXBuMVl4WHUxVjAxUnFQVmcrNGlpU0lXem5FcUF4Ti9jQjhk?=
 =?utf-8?B?MytmSStSWC9VeVJ4M09peGV6NGlTU0pXNkx2WU9EYzJZMEw1T3NRVEFDMHZG?=
 =?utf-8?B?VTIrdXZsUm55RzZ1a2ZjR1RxSVZ0dlhtWWhWRVV0ZUd3Skc0TFlIZ0JOQi9Q?=
 =?utf-8?B?QXdNcEltcjN2U1QwRDNFcStxOWJnMGQrdHdhQWRZdFRGa1BDdGNzRGVaYXpo?=
 =?utf-8?B?bW1OSkdLaFdFVzA5aXdWNVUvUXdOMjFpZDRib2xqZ093Z2hGeWdXL0NEQjly?=
 =?utf-8?B?SC9HWVZQTTJEVStQOUNLL3pTZDhDNWFySkI2Y3BacDRxSkFFV2Z1U0I5TmNB?=
 =?utf-8?B?SllYMi9KU3hEeGNrNHdqZkdIUnR1SGRYOG5od3BZSk5yTUJQK21OMFJGVFRK?=
 =?utf-8?B?KzJPMGpDVjVHalJqSmJDQUJOMHVIN3cvcEkwd3QvbXFrbVZtTWtiK3BuMFpF?=
 =?utf-8?B?VEZIUGoxYjVYNW9ZNHc5U3dZYkVrVDJJU2EyQVUwWjNlS2lyNUFEV0Y4OUJs?=
 =?utf-8?Q?/BNoX0YYs73T246Y+PZ0Sbm+x?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6083.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64b1d7e0-892b-4d2e-bb1f-08dcea12dd29
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2024 16:36:32.0409 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EQd1YdGwXa3Y4CROOS0x1REuS2H3LmA54mXh+kNPGlY7s6VCdWmPsAwp+3Cx+5nzCLg13TF0IYDcL+4W2g1ypg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8209
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

UHJvZ3Jlc3MhIE15IHN5c3RlbSBub3cgYm9vdHMuIEJ1dCB0aGVyZSdzIG9uZSBXQVJOX09OIGR1
bXAgYWxvbmcgdGhlIHdheSB0byB0aGUgImxvZ2luOiIgcHJvbXB0Lg0KDQpUaGFua3MNCg0KLVRv
bnkNCg0KLS0tDQoNClsgICAzMy4xMTE1MDVdIENvbnNvbGU6IHN3aXRjaGluZyB0byBjb2xvdXIg
ZHVtbXkgZGV2aWNlIDgweDI1DQpbICAgMzMuMTE5NTgxXSBtZ2FnMjAwIDAwMDA6MDg6MDAuMDog
dmdhYXJiOiBkZWFjdGl2YXRlIHZnYSBjb25zb2xlDQpbICAgMzMuMTM5NTc0XSBbZHJtXSBJbml0
aWFsaXplZCBtZ2FnMjAwIDEuMC4wIGZvciAwMDAwOjA4OjAwLjAgb24gbWlub3IgMA0KWyAgIDMz
LjE1NzY2NV0gZmJjb246IG1nYWcyMDBkcm1mYiAoZmIwKSBpcyBwcmltYXJ5IGRldmljZQ0KWyAg
IDMzLjE5NjQ5MF0gaXhnYmUgMDAwMDowMzowMC4xOiBNdWx0aXF1ZXVlIEVuYWJsZWQ6IFJ4IFF1
ZXVlIGNvdW50ID0gNjMsIFR4IFF1ZXVlIGNvdW50ID0gNjMgWERQIFF1ZXVlIGNvdW50ID0gMA0K
WyAgIDMzLjI4MTM2N10gaXhnYmUgMDAwMDowMzowMC4xOiAxNi4wMDAgR2IvcyBhdmFpbGFibGUg
UENJZSBiYW5kd2lkdGgsIGxpbWl0ZWQgYnkgNS4wIEdUL3MgUENJZSB4NCBsaW5rIGF0IDAwMDA6
MDA6MDMuMiAoY2FwYWJsZSBvZiAzMi4wMDAgR2IvcyB3aXRoIDUuMCBHVC9zIFBDSWUgeDggbGlu
aykNClsgICAzMy4yODI1MTldIC0tLS0tLS0tLS0tLVsgY3V0IGhlcmUgXS0tLS0tLS0tLS0tLQ0K
WyAgIDMzLjI4MjU1MF0gbWdhZzIwMCAwMDAwOjA4OjAwLjA6IFtkcm1dIGRybV9XQVJOX09OKHBp
cGUgPj0gZGV2LT5udW1fY3J0Y3MpDQpbICAgMzMuMjgyNjEwXSBXQVJOSU5HOiBDUFU6IDEyMyBQ
SUQ6IDE3NzQgYXQgZHJpdmVycy9ncHUvZHJtL2RybV92YmxhbmsuYzoxNDg4IGRybV9jcnRjX3Zi
bGFua19vbl9jb25maWcrMHgxYjUvMHgyMTAgW2RybV0NClsgICAzMy4yODI2ODddIE1vZHVsZXMg
bGlua2VkIGluOiBjcmN0MTBkaWZfcGNsbXVsIGNyYzMyX3BjbG11bCBtZ2FnMjAwKCspIGNyYzMy
Y19pbnRlbCBpMmNfYWxnb19iaXQgZ2hhc2hfY2xtdWxuaV9pbnRlbCBkcm1fc2htZW1faGVscGVy
IHNoYTUxMl9zc3NlMyBkcm1fa21zX2hlbHBlciBzaGEyNTZfc3NzZTMgc2hhMV9zc3NlMyBtcHQz
c2FzIGl4Z2JlKCspIHJhaWRfY2xhc3MgbWRpbyBkcm0gc2NzaV90cmFuc3BvcnRfc2FzIGRjYSBm
dXNlDQpbICAgMzMuMjgyNzEyXSBDUFU6IDEyMyBVSUQ6IDAgUElEOiAxNzc0IENvbW06IHN5c3Rl
bWQtdWRldmQgTm90IHRhaW50ZWQgNi4xMi4wLXJjMisgIzE3MQ0KWyAgIDMzLjI4MjcxNl0gSGFy
ZHdhcmUgbmFtZTogSW50ZWwgQ29ycG9yYXRpb24gQlJJQ0tMQU5EL0JSSUNLTEFORCwgQklPUyBC
UkJEWFNEMS44NkIuMDMzOC5WMDEuMTYwMzE2MjEyNyAwMy8xNi8yMDE2DQpbICAgMzMuMjgyNzE4
XSBSSVA6IDAwMTA6ZHJtX2NydGNfdmJsYW5rX29uX2NvbmZpZysweDFiNS8weDIxMCBbZHJtXQ0K
WyAgIDMzLjI4Mjc0M10gQ29kZTogNGMgOGIgNjcgNTAgNGQgODUgZTQgNzUgMDMgNGMgOGIgMjcg
ZTggMzQgY2UgMDEgZDYgNDggYzcgYzEgNzggOWIgYjEgYzAgNGMgODkgZTIgNDggYzcgYzcgMWUg
ZDYgYjEgYzAgNDggODkgYzYgZTggM2IgOWYgNjAgZDUgPDBmPiAwYiA0OCA4MyBjNCAxOCA1YiA1
ZCA0MSA1YyA0MSA1ZCA0MSA1ZSA0MSA1ZiBjMyBjYyBjYyBjYyBjYyA0OA0KWyAgIDMzLjI4Mjc0
NV0gUlNQOiAwMDE4OmZmZmZiZDFjYTNmOGY2NjAgRUZMQUdTOiAwMDAxMDI4Mg0KWyAgIDMzLjI4
Mjc0OV0gUkFYOiAwMDAwMDAwMDAwMDAwMDNmIFJCWDogZmZmZjlkZGYwYTQ5ODAwMCBSQ1g6IDAw
MDAwMDAwMDAwMDAwMDANClsgICAzMy4yODI3NTFdIFJEWDogMDAwMDAwMDAwMDAwMDAwMiBSU0k6
IGZmZmZmZmZmOTdhMDBlNzggUkRJOiAwMDAwMDAwMGZmZmZmZmZmDQpbICAgMzMuMjgyNzUzXSBS
QlA6IDAwMDAwMDAwMDAwMDAwMDAgUjA4OiAwMDAwMDAwMDAwMDAwMDAxIFIwOTogMDAwMDAwMDAw
MDAwMDAwMA0KWyAgIDMzLjI4Mjc1NV0gUjEwOiAwMDAwMDAwMDAwMDAwMDAxIFIxMTogMDAwMDAw
MDAwMDAwMDAwMSBSMTI6IGZmZmY5ZGYyNTc3NThkZjANClsgICAzMy4yODI3NTddIFIxMzogZmZm
ZjlkZGYwYTQ5OTNmMCBSMTQ6IGZmZmZmZmZmYzBiNzI2YzAgUjE1OiBmZmZmOWRkZjA1ZDMzNDUw
DQpbICAgMzMuMjgyNzU4XSBGUzogIDAwMDA3ZjY2YWI4ZTJiNDAoMDAwMCkgR1M6ZmZmZjlkZWI2
MWY4MDAwMCgwMDAwKSBrbmxHUzowMDAwMDAwMDAwMDAwMDAwDQpbICAgMzMuMjgyNzYxXSBDUzog
IDAwMTAgRFM6IDAwMDAgRVM6IDAwMDAgQ1IwOiAwMDAwMDAwMDgwMDUwMDMzDQpbICAgMzMuMjgy
NzYzXSBDUjI6IDAwMDA3ZjY2YWI4YzdjNGIgQ1IzOiAwMDAwMDAwMDBiYzA0MDAzIENSNDogMDAw
MDAwMDAwMDM3MDZmMA0KWyAgIDMzLjI4Mjc2NV0gRFIwOiAwMDAwMDAwMDAwMDAwMDAwIERSMTog
MDAwMDAwMDAwMDAwMDAwMCBEUjI6IDAwMDAwMDAwMDAwMDAwMDANClsgICAzMy4yODI3NjZdIERS
MzogMDAwMDAwMDAwMDAwMDAwMCBEUjY6IDAwMDAwMDAwZmZmZTBmZjAgRFI3OiAwMDAwMDAwMDAw
MDAwNDAwDQpbICAgMzMuMjgyNzY4XSBDYWxsIFRyYWNlOg0KWyAgIDMzLjI4Mjc3MV0gIDxUQVNL
Pg0KWyAgIDMzLjI4Mjc3M10gID8gX193YXJuKzB4OTAvMHgxYTANClsgICAzMy4yODI3ODVdICA/
IGRybV9jcnRjX3ZibGFua19vbl9jb25maWcrMHgxYjUvMHgyMTAgW2RybV0NClsgICAzMy4yODI4
MDhdICA/IHJlcG9ydF9idWcrMHgxYzMvMHgxZDANClsgICAzMy4yODI4MTldICA/IGhhbmRsZV9i
dWcrMHg1Yi8weGEwDQpbICAgMzMuMjgyODI0XSAgPyBleGNfaW52YWxpZF9vcCsweDE0LzB4NzAN
ClsgICAzMy4yODI4MjddICA/IGFzbV9leGNfaW52YWxpZF9vcCsweDE2LzB4MjANClsgICAzMy4y
ODI4MzldICA/IGRybV9jcnRjX3ZibGFua19vbl9jb25maWcrMHgxYjUvMHgyMTAgW2RybV0NClsg
ICAzMy4yODI4NjJdICA/IG1nYWcyMDBfY3J0Y19zZXRfZ2FtbWFfbGluZWFyKzB4MTdhLzB4MTkw
IFttZ2FnMjAwXQ0KWyAgIDMzLjI4Mjg2OF0gID8gbWdhZzIwMF9lbmFibGVfZGlzcGxheSsweDEz
Yi8weDE2MCBbbWdhZzIwMF0NClsgICAzMy4yODI4NzZdICBkcm1fY3J0Y192Ymxhbmtfb24rMHgy
OC8weDQwIFtkcm1dDQpbICAgMzMuMjgyODk4XSAgZHJtX2F0b21pY19oZWxwZXJfY29tbWl0X21v
ZGVzZXRfZW5hYmxlcysweGE2LzB4MjQwIFtkcm1fa21zX2hlbHBlcl0NClsgICAzMy4yODI5MjBd
ICBkcm1fYXRvbWljX2hlbHBlcl9jb21taXRfdGFpbCsweDUwLzB4ODAgW2RybV9rbXNfaGVscGVy
XQ0KWyAgIDMzLjI4MjkzMV0gIG1nYWcyMDBfbW9kZV9jb25maWdfaGVscGVyX2F0b21pY19jb21t
aXRfdGFpbCsweDI4LzB4NDAgW21nYWcyMDBdDQpbICAgMzMuMjgyOTUxXSAgY29tbWl0X3RhaWwr
MHg5NC8weDEzMCBbZHJtX2ttc19oZWxwZXJdDQpbICAgMzMuMjgyOTYzXSAgZHJtX2F0b21pY19o
ZWxwZXJfY29tbWl0KzB4MTNlLzB4MTcwIFtkcm1fa21zX2hlbHBlcl0NClsgICAzMy4yODI5NzVd
ICBkcm1fYXRvbWljX2NvbW1pdCsweDk3LzB4YjAgW2RybV0NClsgICAzMy4yODI5OTZdICA/IF9f
cGZ4X19fZHJtX3ByaW50Zm5faW5mbysweDEwLzB4MTAgW2RybV0NClsgICAzMy4yODMwMjddICBk
cm1fY2xpZW50X21vZGVzZXRfY29tbWl0X2F0b21pYysweDIwNy8weDI1MCBbZHJtXQ0KWyAgIDMz
LjI4MzA2MF0gIGRybV9jbGllbnRfbW9kZXNldF9jb21taXRfbG9ja2VkKzB4NWIvMHgxOTAgW2Ry
bV0NClsgICAzMy4yODMwODZdICBkcm1fY2xpZW50X21vZGVzZXRfY29tbWl0KzB4MjQvMHg1MCBb
ZHJtXQ0KWyAgIDMzLjI4MzEwOV0gIF9fZHJtX2ZiX2hlbHBlcl9yZXN0b3JlX2ZiZGV2X21vZGVf
dW5sb2NrZWQrMHg5NS8weGQwIFtkcm1fa21zX2hlbHBlcl0NClsgICAzMy4yODMxMjJdICBkcm1f
ZmJfaGVscGVyX3NldF9wYXIrMHgyZS8weDQwIFtkcm1fa21zX2hlbHBlcl0NClsgICAzMy4yODMx
MzJdICBmYmNvbl9pbml0KzB4MmE4LzB4NTYwDQpbICAgMzMuMjgzMTQzXSAgdmlzdWFsX2luaXQr
MHhjNC8weDEyMA0KWyAgIDMzLjI4MzE1MF0gIGRvX2JpbmRfY29uX2RyaXZlci5pc3JhLjArMHgx
YTEvMHgzZDANClsgICAzMy4yODMxNThdICBkb190YWtlX292ZXJfY29uc29sZSsweDEwYi8weDFh
MA0KWyAgIDMzLjI4MzE2NF0gIGRvX2ZiY29uX3Rha2VvdmVyKzB4NWMvMHhjMA0KWyAgIDMzLjI4
MzE2N10gIGZiY29uX2ZiX3JlZ2lzdGVyZWQrMHg0OS8weDcwDQpbICAgMzMuMjgzMTcwXSAgZG9f
cmVnaXN0ZXJfZnJhbWVidWZmZXIrMHgxODQvMHgyMzANClsgICAzMy4yODMxNzldICByZWdpc3Rl
cl9mcmFtZWJ1ZmZlcisweDIwLzB4NDANClsgICAzMy4yODMxODJdICBfX2RybV9mYl9oZWxwZXJf
aW5pdGlhbF9jb25maWdfYW5kX3VubG9jaysweDMzZS8weDU5MCBbZHJtX2ttc19oZWxwZXJdDQpb
ICAgMzMuMjgzMTkzXSAgPyBkcm1fY2xpZW50X3JlZ2lzdGVyKzB4MzMvMHhjMCBbZHJtXQ0KWyAg
IDMzLjI4MzIyMl0gIGRybV9mYmRldl9zaG1lbV9jbGllbnRfaG90cGx1ZysweDZjLzB4YzAgW2Ry
bV9zaG1lbV9oZWxwZXJdDQpbICAgMzMuMjgzMjI4XSAgZHJtX2NsaWVudF9yZWdpc3RlcisweDdi
LzB4YzAgW2RybV0NClsgICAzMy4yODMyNTRdICBtZ2FnMjAwX3BjaV9wcm9iZSsweDkwLzB4MTgw
IFttZ2FnMjAwXQ0KWyAgIDMzLjI4MzI2Ml0gIGxvY2FsX3BjaV9wcm9iZSsweDQ2LzB4YTANClsg
ICAzMy4yODMyNjldICBwY2lfZGV2aWNlX3Byb2JlKzB4YjUvMHgyMjANClsgICAzMy4yODMyNzdd
ICByZWFsbHlfcHJvYmUrMHhkOS8weDM4MA0KWyAgIDMzLjI4MzI4OF0gIF9fZHJpdmVyX3Byb2Jl
X2RldmljZSsweDc4LzB4MTUwDQpbICAgMzMuMjgzMjkzXSAgZHJpdmVyX3Byb2JlX2RldmljZSsw
eDFlLzB4OTANClsgICAzMy4yODMyOTddICBfX2RyaXZlcl9hdHRhY2grMHhkNi8weDFkMA0KWyAg
IDMzLjI4MzMwMV0gID8gX19wZnhfX19kcml2ZXJfYXR0YWNoKzB4MTAvMHgxMA0KWyAgIDMzLjI4
MzMwNV0gIGJ1c19mb3JfZWFjaF9kZXYrMHg2Ni8weGEwDQpbICAgMzMuMjgzMzExXSAgYnVzX2Fk
ZF9kcml2ZXIrMHgxMTEvMHgyNDANClsgICAzMy4yODMzMTddICBkcml2ZXJfcmVnaXN0ZXIrMHg1
Yy8weDEyMA0KWyAgIDMzLjI4MzMyMF0gID8gX19wZnhfbWdhZzIwMF9wY2lfZHJpdmVyX2luaXQr
MHgxMC8weDEwIFttZ2FnMjAwXQ0KWyAgIDMzLjI4MzMyNl0gIGRvX29uZV9pbml0Y2FsbCsweDYy
LzB4M2EwDQpbICAgMzMuMjgzMzMzXSAgPyBfX2ttYWxsb2NfY2FjaGVfbm9wcm9mKzB4MjQwLzB4
MzAwDQpbICAgMzMuMjgzMzQzXSAgZG9faW5pdF9tb2R1bGUrMHg2NC8weDI0MA0KWyAgIDMzLjI4
MzM1NF0gIGluaXRfbW9kdWxlX2Zyb21fZmlsZSsweDdhLzB4YTANClsgICAzMy4yODMzNjZdICBp
ZGVtcG90ZW50X2luaXRfbW9kdWxlKzB4MTVmLzB4MjYwDQpbICAgMzMuMjgzMzc4XSAgX194NjRf
c3lzX2Zpbml0X21vZHVsZSsweDVhLzB4YjANClsgICAzMy4yODMzODNdICBkb19zeXNjYWxsXzY0
KzB4NzMvMHgxOTANClsgICAzMy4yODMzOTZdICBlbnRyeV9TWVNDQUxMXzY0X2FmdGVyX2h3ZnJh
bWUrMHg3Ni8weDdlDQpbICAgMzMuMjgzMzk5XSBSSVA6IDAwMzM6MHg3ZjY2YWM1MjdlMGQNClsg
ICAzMy4yODM0MDNdIENvZGU6IGM4IDBjIDAwIDBmIDA1IGViIGE5IDY2IDBmIDFmIDQ0IDAwIDAw
IGYzIDBmIDFlIGZhIDQ4IDg5IGY4IDQ4IDg5IGY3IDQ4IDg5IGQ2IDQ4IDg5IGNhIDRkIDg5IGMy
IDRkIDg5IGM4IDRjIDhiIDRjIDI0IDA4IDBmIDA1IDw0OD4gM2QgMDEgZjAgZmYgZmYgNzMgMDEg
YzMgNDggOGIgMGQgM2IgODAgMGMgMDAgZjcgZDggNjQgODkgMDEgNDgNClsgICAzMy4yODM0MDZd
IFJTUDogMDAyYjowMDAwN2ZmZmYwYzc1MmI4IEVGTEFHUzogMDAwMDAyNDYgT1JJR19SQVg6IDAw
MDAwMDAwMDAwMDAxMzkNClsgICAzMy4yODM0MTBdIFJBWDogZmZmZmZmZmZmZmZmZmZkYSBSQlg6
IDAwMDA1NTdjZDNiMzhkMDAgUkNYOiAwMDAwN2Y2NmFjNTI3ZTBkDQpbICAgMzMuMjgzNDEyXSBS
RFg6IDAwMDAwMDAwMDAwMDAwMDAgUlNJOiAwMDAwN2Y2NmFjNjgxMzJjIFJESTogMDAwMDAwMDAw
MDAwMDAxMA0KWyAgIDMzLjI4MzQxNF0gUkJQOiAwMDAwMDAwMDAwMDIwMDAwIFIwODogMDAwMDAw
MDAwMDAwMDAwMCBSMDk6IDAwMDAwMDAwMDAwMDAwMDANClsgICAzMy4yODM0MTZdIFIxMDogMDAw
MDAwMDAwMDAwMDAxMCBSMTE6IDAwMDAwMDAwMDAwMDAyNDYgUjEyOiAwMDAwN2Y2NmFjNjgxMzJj
DQpbICAgMzMuMjgzNDE4XSBSMTM6IDAwMDA1NTdjZDNiMThlYjAgUjE0OiAwMDAwMDAwMDAwMDAw
MDA3IFIxNTogMDAwMDU1N2NkM2IzOGY4MA0KWyAgIDMzLjI4MzQyOV0gIDwvVEFTSz4NClsgICAz
My4yODM0MzFdIGlycSBldmVudCBzdGFtcDogNDUxMzMNClsgICAzMy4yODM0MzNdIGhhcmRpcnFz
IGxhc3QgIGVuYWJsZWQgYXQgKDQ1MTM5KTogWzxmZmZmZmZmZjk2MTg3Nzg0Pl0gdnByaW50a19l
bWl0KzB4M2Q0LzB4M2UwDQpbICAgMzMuMjgzNDQ0XSBoYXJkaXJxcyBsYXN0IGRpc2FibGVkIGF0
ICg0NTE0NCk6IFs8ZmZmZmZmZmY5NjE4NzczNz5dIHZwcmludGtfZW1pdCsweDM4Ny8weDNlMA0K
WyAgIDMzLjI4MzQ0OF0gc29mdGlycXMgbGFzdCAgZW5hYmxlZCBhdCAoNDQ4MjIpOiBbPGZmZmZm
ZmZmOTYwZGFjOTE+XSBfX2lycV9leGl0X3JjdSsweGExLzB4MTEwDQpbICAgMzMuMjgzNDU2XSBz
b2Z0aXJxcyBsYXN0IGRpc2FibGVkIGF0ICg0NDgxNyk6IFs8ZmZmZmZmZmY5NjBkYWM5MT5dIF9f
aXJxX2V4aXRfcmN1KzB4YTEvMHgxMTANClsgICAzMy4yODM0NTldIC0tLVsgZW5kIHRyYWNlIDAw
MDAwMDAwMDAwMDAwMDAgXS0tLQ0KWyAgIDMzLjI4MzQ5NF0gQ29uc29sZTogc3dpdGNoaW5nIHRv
IGNvbG91ciBmcmFtZSBidWZmZXIgZGV2aWNlIDEyOHg0OA0KWyAgIDMzLjM3OTU1N10gaXhnYmUg
MDAwMDowMzowMC4xOiBNQUM6IDMsIFBIWTogMCwgUEJBIE5vOiBHMzY3NDgtMDA1DQpbICAgMzMu
Mzk5ODUyXSBtZ2FnMjAwIDAwMDA6MDg6MDAuMDogW2RybV0gZmIwOiBtZ2FnMjAwZHJtZmIgZnJh
bWUgYnVmZmVyIGRldmljZQ0K
