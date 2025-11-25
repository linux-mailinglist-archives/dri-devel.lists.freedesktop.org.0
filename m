Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07DD7C85129
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 14:02:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2BDD10E3E8;
	Tue, 25 Nov 2025 13:02:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GHndA8JB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 531C910E3D9
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 13:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764075753; x=1795611753;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=suKE0+7ur0MiO6T8fxXz0XUNz7kEylj82VD2c4dLOK4=;
 b=GHndA8JBiWoHyQjf8vAIGhYgw0+os0mXC3EIkYHNr2CwqgQu6K7ZxGFp
 WnYFPmtdeGTV8U0TkzOB2iRVPHRvRNjRbavcEGpgRyVa0MzKqFgdGptWC
 pcoy96nJsC+SVg/dP7rReS0k/0qi6ROL4ajbdGFt/9C523IJxEKoP55JP
 ZGnuVBWEEKFW1LLfzyPmIo5axPn2urBLDeR7QXWfa8XoV10dMSx7c7DEL
 NEb2ELw1STdopTEll1p58pCq6RFVzebzwDHqfCwikor80jWcejFqm5INL
 Q9WhVVgmOFXGGDFQKNYvDvEllpHCdp1R2CIom32Ua4v4TK65K5rENjuij A==;
X-CSE-ConnectionGUID: jg83Y/WQRSq5lpaNVn0QAA==
X-CSE-MsgGUID: gagLXn0LREGDnNSzlw5LoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="66126917"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="66126917"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 05:02:32 -0800
X-CSE-ConnectionGUID: MSNbk44PQ1ewRL8uxhbKqg==
X-CSE-MsgGUID: zjyygTiBTSCsTpVDtCaWsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="191887570"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 05:02:31 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 05:02:31 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 25 Nov 2025 05:02:31 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.31) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 05:02:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OQlcEp1EWXc9xy5+D9+5gzyFHYJjREQEHqe1fkEoL/zz16ySiv0amb/qt3S4rBYAnolKiTo78ur7nPXbhY/BBJ9hJmxvKSz+lgx1+sOGi5SCwEVNfkYcvu0g/o8V5naC8v23SYK/DBdKqcP5KUsinTKM7PY2MN8HdPKHO9VwC8UUDsYHh/WlrKumtPKZH0+OHoXEbYcoWBr8TlnZqrgkaSTfHyjYzWTFOsSJkIsARGj4LxuaPvoxCCoVb9+oWmKTPNgCzSRVppRlUr+3xSb1Sf9sMJpYDLpnYxwS3x37axWQ/4MbTK5b1vDHsXYv6tpAgi7h0p30DedyqIJUWtGvPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=suKE0+7ur0MiO6T8fxXz0XUNz7kEylj82VD2c4dLOK4=;
 b=UybTOBUdGeA4xx1oc31f8dg9ghs6vtmbFGwc0o1VsPTIbYPPf3Dhq8ixWDTTuAfarwVG7BWKckFIY+m2S/6P6ujtIOvEHY/wr9yPWO3cft1dr+pKH82vgJzKln6iBF8bqghYkcqZWY2hR/bTfuooC6Rw1tM2GJCDmlwV7pGVrbGDFVcrLT/v080MjSxdVVByjINc7ZapVraWmpYRQduvxhQFkd2e386CMsX7KfrJUaMiCZgYhM5wbAySWyHZPk2y6YMiritaGGSiw3+BcTiSNmRYuNE/dDx/V2EQ/7INwZwd4RbE6w+ohk3CINNg+NRbxZpFem5Ht3QJn8Lw/AfgXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA4PR11MB9251.namprd11.prod.outlook.com (2603:10b6:208:56f::13)
 by CO1PR11MB5041.namprd11.prod.outlook.com (2603:10b6:303:90::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Tue, 25 Nov
 2025 13:02:28 +0000
Received: from IA4PR11MB9251.namprd11.prod.outlook.com
 ([fe80::6de6:5e54:b54d:8edc]) by IA4PR11MB9251.namprd11.prod.outlook.com
 ([fe80::6de6:5e54:b54d:8edc%7]) with mapi id 15.20.9343.011; Tue, 25 Nov 2025
 13:02:28 +0000
From: "Sokolowski, Jan" <jan.sokolowski@intel.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: David Francis <David.Francis@amd.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Felix Kuehling <felix.kuehling@amd.com>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>
Subject: RE: [PATCH 1/1] drm: disallow setting 0 as new handle in
 DRM_IOCTL_GEM_CHANGE_HANDLE
Thread-Topic: [PATCH 1/1] drm: disallow setting 0 as new handle in
 DRM_IOCTL_GEM_CHANGE_HANDLE
Thread-Index: AQHcXfXbiSxh9f6oD0iHeinWZoYJJrUDWR8AgAABmUA=
Date: Tue, 25 Nov 2025 13:02:28 +0000
Message-ID: <IA4PR11MB9251D04B84D7129BB1DA449099D1A@IA4PR11MB9251.namprd11.prod.outlook.com>
References: <20251125102847.904357-1-jan.sokolowski@intel.com>
 <20251125102847.904357-2-jan.sokolowski@intel.com>
 <28441359-4625-4d3e-8c1a-852a1868bde8@amd.com>
In-Reply-To: <28441359-4625-4d3e-8c1a-852a1868bde8@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA4PR11MB9251:EE_|CO1PR11MB5041:EE_
x-ms-office365-filtering-correlation-id: 8da923ff-1d8b-48bd-36cc-08de2c22e351
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?LzdQek9FSk9HVlV1QllyZG55OGdjalBDUVFXWmpZRENXcFFvWXo5T0xNN2h5?=
 =?utf-8?B?Wk1KdGRvRjByMnl6Q1dhMFdFb0N0R0ZqckJxQVpiVkVvUDhBRmF0dU96Rjhi?=
 =?utf-8?B?MVIvYjM1dGtDK3ZnSVdxRURGRnhlVEpEODQyRzNuWk9ZRUhUeEtWcW1XWFph?=
 =?utf-8?B?VysxSUU0aW9hdFBGYW1mSXJhTUZlaUtENE9XR3BDRUxkQkNuOHc1dG40ZzFp?=
 =?utf-8?B?RFhNQ3lmLzJBTTJQN3lvNzZxZnVDZEVzd1JpRS81VWlmRGlYWFNkR0xJeWpn?=
 =?utf-8?B?SkhuTWhXazZ5YXI0Y1VZT2FGb2o3Uk9GeTZDWm9yM0F4L0tFL1l3T2hDY1o4?=
 =?utf-8?B?aXl0OGdQQ0dhVkFjTkx4NCtHUldtQzZiYUZ4d1k4YWIzZldmanRjTUNOWVNW?=
 =?utf-8?B?OHV3RzNxWnViOVhmQTA1R3F2KzZLaXljMXZQdmRIK2xPcCtWM0xRMkJHUmgw?=
 =?utf-8?B?bys4UldETk4yVjVzMzZoaFZXZ1FRTDArc0VJUWxhdVVZZllXaWlvZGtvUTJC?=
 =?utf-8?B?Z3BHR25FUjN3NEdUbE5RcGxwL3hCeEg4VEY0RTVhaHhoTk5KU0lCcGVQSjhh?=
 =?utf-8?B?RU5MOEp3YlZ1WXMyYTZUbUVYM2VUMHVRd2dtdklaU1BFUmR6ZE03UDhqT0tE?=
 =?utf-8?B?elk3Rms0OHVwVDc3MUVJTVh1ME5hUWtwdlFOaWFPa3BaRkNMWmxHM0w3a0JL?=
 =?utf-8?B?UU4yMzY3RmRoMVR6Y0pMY3Nna1R1aEpSd01PZXVveWFiUUNBQUl1Q0R5MFdR?=
 =?utf-8?B?UGxWRUFTd1RjclMzY21HMUx4TmVXaU9CWGxoM1FIK1JadmdCZ3hwamRmV1ZO?=
 =?utf-8?B?NHFNUEk5YW9ndmowd3JOejdTUVI1MjF5emhWK0dUL2NKU214R2E1MGlnMzhq?=
 =?utf-8?B?Um1rcm12NGhxbWs3S254ZXltTVJTMVpHUWxEeWZuUnQ5Nk05QlpYaTZWWVRz?=
 =?utf-8?B?emtZcVBqRFByMzJpTU5vem9TSCsvVThQZHVLQmo3OHYrblFaNWZWbnlVd09p?=
 =?utf-8?B?NlI3Q1U2Z1JkQ2Z4dDZrbXdqRnc1VExvZXE4bUttKzA1TkpTQTVLYVp0bFha?=
 =?utf-8?B?eUtZa0gzd0tXUWMyTGEvcE1QM0ljOGFCWnZPaDNzYmtFRnkveldFK01ibmV3?=
 =?utf-8?B?RDZuTkdSSC9US3JhU2JCNkxZeWxaS0ZlRjVieUNyYjdmVWFWMnpMZDhyTFhS?=
 =?utf-8?B?dHI2L1lDdU1ndkVUa1FuWjJkWTliem11Y1RqOFdDUTk0Q3lXREM0ZGEzNXQw?=
 =?utf-8?B?NS8zNmxDM3BhU3lrZ3BPMlF5NkNRbzNrK1dsVHhnQTk0R1FsM05qSjRGcFJ0?=
 =?utf-8?B?ZnVOc3RtOURZM0IzSlVnZU85RlRlUUcwUjRka000Vm42OGlXMUxJSEE2c2xQ?=
 =?utf-8?B?NUJNU0hsQlhCeXpwS2haTEppSDlDTzVPTFpRT3N0eGhKaDBXMDVBcUJSYmZq?=
 =?utf-8?B?NWhicDhzVU9rRnN6RVh6L3FlbVpCVTk5OW5UY3Z1cmpuNmFJWHpSNXZ6RVcr?=
 =?utf-8?B?YUxrY0NrZmNUOGRwVUpBdXBYSVhtbjFVRFE2VWdQd2JhaTdEQmZTd3JmeWZT?=
 =?utf-8?B?NHRXajNRRUk3S2VXamJLUVlUeUFXb2JNTnFRaE15M1ZJaldQTGdrbDI1MW9O?=
 =?utf-8?B?dnZmbWMxYzVSZFgzc0R1R055M1pCbWo2bnd1Q1k5MFcrOWVDN3VsNmNQNjhl?=
 =?utf-8?B?bGxNMFUyczVaelpQUFZWM0wxbWNra0xjSkFPWnVCZGRqYkFHYjB0MEdoWVI5?=
 =?utf-8?B?SzhWS3N3RTY1cFZMQWVjY2xrT0VRRVdod0FIWXVnT2RDdCtPQ283Y05YQWZP?=
 =?utf-8?B?NTFmVTA4ZzF6VnJvSUg3YXA2MDFBdS9neW1pRzJFK3Y2MmVFWXk0c25kcTBm?=
 =?utf-8?B?YlNMbDZ0a09idHkvNHVRaExFdTFTSDFXSHNGbGMzQzBra1dqV0c4RWFtTnBy?=
 =?utf-8?B?TUFTZ2UxNEFDK2dPbVRiVkVJUm5WZ2ZUeGx0QTBLemRKTExib0pMU1lObVlU?=
 =?utf-8?B?K0JLdTVGaWpuQlIzZGNmK0JJM3JoOGdHVGV3VHN2WUZBYzdtK0xVblFrZ1N3?=
 =?utf-8?Q?PcvU1t?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA4PR11MB9251.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YU9md1hwbFY4YTZmK3NlT3g1bUpiOHVpMng5OXRRdm1OOWVITEg1SHpJeDJJ?=
 =?utf-8?B?VEYwSkU5SUQwem8xME9DeWNWYnlRT2F6M25ZSXk1cldidnk3Y0Z0SGo2dnlE?=
 =?utf-8?B?aTg3dGg3QStZUlY5ejc3RHJ5RTVBRXNpbW5rbHZFWFg3dzdyYUM0bzh2akpI?=
 =?utf-8?B?V0pJTlUwMDlvakEwQkJFa0pYWDdBcWNaenp3N0pDRXJXZUh2bzl6YmFoa0tD?=
 =?utf-8?B?eXhvRE4wdEN6S1RoVlJQdzJVeW5BNFJmODNLTFI1NUc5UUZWc1QxMzNkVEJl?=
 =?utf-8?B?ME9QOXhaQjJWOE03LzJzR1R6cDJseGd1RWM3MlQ1Ry9wWS9zZ0NORk9ybDQ1?=
 =?utf-8?B?V1NyYlpXbzg0aW9PTktNTisrczgxYkpTRy96d2w2TW8yRThXRmZLYWRxRjA4?=
 =?utf-8?B?b0hxT3pJSGVYVCtqR0x3S0d4MCs5bWF1UmFDTUo1alVaamkyMGpPdTY1Ris3?=
 =?utf-8?B?cGFSNkJHV3JWRW5xdGg1N253WEl1M09YRDF6OGdvQ3czdmxoNkw3T3pUajZF?=
 =?utf-8?B?OFFibXV2VWpNT04ydDZpUFc5VUJ4d0x2bHZEblRCS1N3bFVJdHBrM0Z3VDFN?=
 =?utf-8?B?bXRMek5KdmdqdlNCM0NFZjZOaDh0a2hiV3lmclBHYm1nUlB3TWtRNHc0R3BX?=
 =?utf-8?B?UWFaMXB5anR4TCtybzRQcUx6VDdaN2xVNGZjblp2L1NNMjkway82ODZTMXp6?=
 =?utf-8?B?Vkp1YVJ2czVnclZTQ29vNjIrbUsyb0V6SHN1eDY0T3BhYVZ5MFlsRDlzMnBX?=
 =?utf-8?B?Vm1oSlBjSSttYlZjYkp5bS9CUTkxeHpxTTFYdXNsU0Z4YUdKcm5rUisvWjJR?=
 =?utf-8?B?Mk5yVzdxYjVoNjhKYndYTVA3QThjc0hicmtiN1BUQm0zOTBmSDBGWkFIODVR?=
 =?utf-8?B?YmN0Uk9oZlovVEJ6d2svZzdwS2dnRUxlTk83MEg3aVNvWVFIWm83cHFrUThD?=
 =?utf-8?B?VjBKaTJUV1pXM3pXQ3Axa2VBaERsSzVtZHhkc1dsNUZXUGs2aDcxaHVzaWtB?=
 =?utf-8?B?ZWMrci9RRFYvTEthcUlqOGVUUWRPSWZPMDNxRjlIK0J6cjFzbS94ZC9Tc0gv?=
 =?utf-8?B?YzNlcVN0bkordUJHU1dXbGZlckxacjVHL0ZwaDZzc256WlN0cVlMOG1SenpN?=
 =?utf-8?B?N29pYU5wUzgyenFJdWFkazB1T1hjbjRzVld5SGhLRlUwd0pxOFlObU54U2ND?=
 =?utf-8?B?MEtXcGpvM3ZBaGpDL1JMN1hteXZIOFNuU1Jza1dmRGN5NG5DdWlCcjNZelgw?=
 =?utf-8?B?eWc4M1JaaURvQ0FUaTdJWGRZaHRLYTc4QlhzeHFhUUdjaDRKdlNzdEp2bHNu?=
 =?utf-8?B?RW9pKzlKVlN2VUp5a0pBTGdyNTNZN0FDOHhWKzdMQnpDbURHbDdRZHAxbDdu?=
 =?utf-8?B?cjlQQlZMK0hHdFFuUENuSEhhYVdKZldmdHZWSVdwQW5IdUVNeiswNVZxL3JX?=
 =?utf-8?B?eHFQeUNTeWx6bFYwRW85cW1BQVpvMXROUUMwVmw5RitPMHFDdlhkSWtmbi9M?=
 =?utf-8?B?d1BYL3JweTZIWlUxTE1UR0hranZVckRrTHZmL20xK09YL3h4WlNpZ2s3R1No?=
 =?utf-8?B?WjRTeXYyWkFnR2pWdjJXejN1MkprekwwV1pibzA4TmpVb25taUVuV0UxSUFK?=
 =?utf-8?B?Vm0zMVhIQzFiZFZrTlRuc0FTYnY3K2trL0dub0Yvdm5pNytxZ1VkaGsvTmRP?=
 =?utf-8?B?TEY3SGlJWkRtaG95bzlMQWlJaUEyNXNTa2ZiNkV1OWl3NENER1BGcE04TnpJ?=
 =?utf-8?B?aXhYQ0JUaFVTREdPMjF6UW5jTHdqYXhKTkcvRkdGd1BSUVVYUTV5aCtrekxD?=
 =?utf-8?B?RW5nclJFc2lyYjJ5bC9KNjhGWmNSWFI1bU1xUm5sK1VpTHFVWkRHZ0c2WkRo?=
 =?utf-8?B?amdZS2lraENqc1NGaVpMYWdsVngyMy9DaE1Ycm1MejN6VkxOQTlvTGNlck5U?=
 =?utf-8?B?Mmludzcyb1JReThYRGpsdDREK2p1cElBOUdvYW0rVjIxb2lLY3JlQmZYQUt2?=
 =?utf-8?B?UW8zdFBoS2doZ2E5S0tTTUpLaWlWY1BRRWtyU2NJL2gvcDg5TWZMMFAwQ1Rk?=
 =?utf-8?B?L21nSFVpK2txamN2QU5GWkRkZUFvUVFnZUIxN3daY0xpa3B4YnpJeHFvSUVU?=
 =?utf-8?Q?B4KQ87U95QJI6dcx8cLIH7rI6?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA4PR11MB9251.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8da923ff-1d8b-48bd-36cc-08de2c22e351
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2025 13:02:28.7052 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kVyHEHlwa+KT4uWyhHNdSIhPfUDzNY8lk9Ea+cYQDg842C1k6xet/TYunpysUMS45U0SlQ2FMnqvSrUbekcE0l8Ov3hZ4zS0JtbxeUq8PXo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5041
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBDaHJpc3RpYW4gS8O2bmlnIDxj
aHJpc3RpYW4ua29lbmlnQGFtZC5jb20+DQo+IFNlbnQ6IFR1ZXNkYXksIE5vdmVtYmVyIDI1LCAy
MDI1IDE6NTQgUE0NCj4gVG86IFNva29sb3dza2ksIEphbiA8amFuLnNva29sb3dza2lAaW50ZWwu
Y29tPjsgZHJpLQ0KPiBkZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IERhdmlkIEZy
YW5jaXMgPERhdmlkLkZyYW5jaXNAYW1kLmNvbT47IE1hYXJ0ZW4gTGFua2hvcnN0DQo+IDxtYWFy
dGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+OyBNYXhpbWUgUmlwYXJkDQo+IDxtcmlwYXJk
QGtlcm5lbC5vcmc+OyBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT47DQo+
IERhdmlkIEFpcmxpZSA8YWlybGllZEBnbWFpbC5jb20+OyBTaW1vbmEgVmV0dGVyIDxzaW1vbmFA
ZmZ3bGwuY2g+OyBGZWxpeA0KPiBLdWVobGluZyA8ZmVsaXgua3VlaGxpbmdAYW1kLmNvbT47IERl
IE1hcmNoaSwgTHVjYXMNCj4gPGx1Y2FzLmRlbWFyY2hpQGludGVsLmNvbT4NCj4gU3ViamVjdDog
UmU6IFtQQVRDSCAxLzFdIGRybTogZGlzYWxsb3cgc2V0dGluZyAwIGFzIG5ldyBoYW5kbGUgaW4N
Cj4gRFJNX0lPQ1RMX0dFTV9DSEFOR0VfSEFORExFDQo+IA0KPiBPbiAxMS8yNS8yNSAxMToyOCwg
SmFuIFNva29sb3dza2kgd3JvdGU6DQo+ID4gZHJtX2ZpbGUncyBvYmplY3RfaWRyIHVzZXMgMSBh
cyBiYXNlIHZhbHVlLCB3aGljaCBjYW4gY2F1c2UgaWQNCj4gPiBtaXNtYXRjaCB3aGVuIHRyeWlu
ZyB0byB1c2UgRFJNX0lPQ1RMX0dFTV9DSEFOR0VfSEFORExFDQo+ID4gdG8gY2hhbmdlIGlkIGZy
b20gMSB0byAwLg0KPiA+DQo+ID4gRGlzYWxsb3cgMCBhcyBuZXcgaGFuZGxlIGluIHRoYXQgaW9j
dGwuDQo+ID4NCj4gPiBGaXhlczogNTMwOTY3MjhiODkxICgiZHJtOiBBZGQgRFJNIHByaW1lIGlu
dGVyZmFjZSB0byByZWFzc2lnbiBHRU0NCj4gaGFuZGxlIikNCj4gPiBTaWduZWQtb2ZmLWJ5OiBK
YW4gU29rb2xvd3NraSA8amFuLnNva29sb3dza2lAaW50ZWwuY29tPg0KPiA+IENjOiBEYXZpZCBG
cmFuY2lzIDxEYXZpZC5GcmFuY2lzQGFtZC5jb20+DQo+ID4gQ2M6IE1hYXJ0ZW4gTGFua2hvcnN0
IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+DQo+ID4gQ2M6IE1heGltZSBSaXBh
cmQgPG1yaXBhcmRAa2VybmVsLm9yZz4NCj4gPiBDYzogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1t
ZXJtYW5uQHN1c2UuZGU+DQo+ID4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBnbWFpbC5jb20+
DQo+ID4gQ2M6IFNpbW9uYSBWZXR0ZXIgPHNpbW9uYUBmZndsbC5jaD4NCj4gPiBDYzogIkNocmlz
dGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+DQo+ID4gQ2M6IEZlbGl4IEt1
ZWhsaW5nIDxmZWxpeC5rdWVobGluZ0BhbWQuY29tPg0KPiA+IENjOiBMdWNhcyBEZSBNYXJjaGkg
PGx1Y2FzLmRlbWFyY2hpQGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9ncHUvZHJt
L2RybV9nZW0uYyB8IDQgKysrKw0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCsp
DQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9nZW0uYyBiL2RyaXZl
cnMvZ3B1L2RybS9kcm1fZ2VtLmMNCj4gPiBpbmRleCA2ODE2OGQ1OGE3YzguLjJhNDlhOGUzOTZm
YSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbS5jDQo+ID4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2RybV9nZW0uYw0KPiA+IEBAIC05NzUsNiArOTc1LDEwIEBAIGludCBk
cm1fZ2VtX2NoYW5nZV9oYW5kbGVfaW9jdGwoc3RydWN0DQo+IGRybV9kZXZpY2UgKmRldiwgdm9p
ZCAqZGF0YSwNCj4gPiAgCWlmIChhcmdzLT5oYW5kbGUgPT0gYXJncy0+bmV3X2hhbmRsZSkNCj4g
PiAgCQlyZXR1cm4gMDsNCj4gPg0KPiA+ICsJLyogQXMgdGhlIGlkciBiYXNlIGlzIDEsIHRyeWlu
ZyB0byBzZXQgaGFuZGxlIDAgd2lsbCBjcmVhdGUgaWQgbWlzbWF0Y2gNCj4gKi8NCj4gPiArCWlm
IChhcmdzLT5uZXdfaGFuZGxlID09IDApDQo+ID4gKwkJcmV0dXJuIDA7DQo+IA0KPiBUaGF0IHdv
dWxkIG5lZWQgdG8gcmV0dXJuIC1FSU5WQWwgb3Igc29tZSBvdGhlciBlcnJvciBjb2RlLg0KDQpP
aywgd2lsbCBjaGFuZ2UgdGhhdCBpbiBuZXh0IHZlcnNpb24uDQoNCj4gDQo+IEJ1dCBJJ20gd29u
ZGVyaW5nIHdoeSB0aGF0IGlzIG5lY2Vzc2FyeSBhdCBhbGw/IERvZXNuJ3QgaWRyX2FsbG9jKCkg
cmV0dXJuIGFuDQo+IGVycm9yIHdoZW4geW91IHRyeSB0byBhbGxvY2F0ZSBoYW5kbGUgMD8NCg0K
SXQgYXBwZWFycyB0aGF0IGlkcl9hbGxvYyBkb2Vzbid0IHJldHVybiBhbnkgZXJyb3JzIGluIHRo
aXMgc2NlbmFyaW8sIG90aGVyd2lzZSB3ZSdkIGdvdG8gb3V0X3VubG9jayBzdHJhaWdodCBhd2F5
Lg0KDQo+IA0KPiBSZWdhcmRzLA0KPiBDaHJpc3RpYW4uDQo+IA0KPiA+ICsNCj4gPiAgCW11dGV4
X2xvY2soJmZpbGVfcHJpdi0+cHJpbWUubG9jayk7DQo+ID4NCj4gPiAgCXNwaW5fbG9jaygmZmls
ZV9wcml2LT50YWJsZV9sb2NrKTsNCg0K
