Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F257C8842B
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 07:24:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DC4B10E0AE;
	Wed, 26 Nov 2025 06:24:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="QudScayE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010068.outbound.protection.outlook.com [52.101.56.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6133F10E058;
 Wed, 26 Nov 2025 06:24:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nlG1ASmjfvGxjG1gJ5mI/jHE63FysfHXO8D2KLXysAaPTJQ+FzniAOAH0Z86gajJFuJA6EyfL9S8TNNAVc8fy09OzvNcGENVAlaYC/4Lw/ONrFPsgByuM7wCH5lXkJAiFPSFKGBP0xpqh8dHygZxTxsnOrzA22MMlaFVhCk0mA/nKfAY1ragxa0Wm5Xvo5WMXqTkVS52OaC30L5jke2wlAVt44rXnK06UeWv9tVsgmCIBZIjq9rzkTvVo35dbg4K068K+pkHBlmd93mq6QuZzr3U0CrFgGE5D8seXtlipFXy4RD+QMp16siUSG6Gt80Vf7CLC1BUghhzlUaC0jUfWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XHDGgDNYgE1/seMLZfEy3qZPl+EvOli7IWibvVDjYfQ=;
 b=uhIMW8y4L40x47apxB/adNZadwM4/YITjOTVXdiy3dgaKhB7iA5O+mh4+wm0y+his+/jxJhFUZaW35nlRLG+yHqg0E6YQDggSHkQx2pr498u6Tvq1RtVPujku0BmyrCs0I7WPbRWtOVkZ9C/qw9TPy5UvKvV/LGWiAs4Dp6Z0/s3+M1WtqM/Wy7D5kSRToCXtQ4vHYCen0nMX6jRCuveeCkTQGI6P36Ni86RSv78kY1S0WGPZ3UjYUkXtBNs9RwhdhYRBjZv3PdeLhBgbIlb0v7R9P2O/B8hR2sU2z8uVM9A4ZL5dBF20sOW0KeotJAv6Jm8kJdi9eoA07+92CH7pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XHDGgDNYgE1/seMLZfEy3qZPl+EvOli7IWibvVDjYfQ=;
 b=QudScayE9q2kkscbUIg80rDj89JJli2LhtJlSMrj3HZbdjOfjlmhwxzTGSJLWol6QK5J/YzLRUCF7Y7cldWbwSgdS4rPibg+/WWw5k7MTv7w5rQOLxy38y3lbysbISfnf8hhYFUCPQgRKrZPmCc+vBiqRWaE6ofix+GgkPpRoOsHrxpyYHEN4Uf2YJargcbR7qWQ3YnbNCEi/aZBTbE4ik/AlZTkMG1aBjBwrp0iPGbo+etZX1NMyAe+AZNBITPaXSkjf1JXOW/AYN2StSdzRiYF3097uiJ4o6GxTVQ5KrPlku2zd6TVhzlOytL3SJqxRlTYFI2S64uyx/A3RPJ4zg==
Received: from IA0PR11MB7257.namprd11.prod.outlook.com (2603:10b6:208:43e::21)
 by DM4PR11MB7207.namprd11.prod.outlook.com (2603:10b6:8:111::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Wed, 26 Nov
 2025 06:24:38 +0000
Received: from IA0PR11MB7257.namprd11.prod.outlook.com
 ([fe80::a3f:c748:c7a6:d2e3]) by IA0PR11MB7257.namprd11.prod.outlook.com
 ([fe80::a3f:c748:c7a6:d2e3%5]) with mapi id 15.20.9343.016; Wed, 26 Nov 2025
 06:24:38 +0000
From: <Ludovic.Desroches@microchip.com>
To: <tzimmermann@suse.de>, <simona@ffwll.ch>, <airlied@gmail.com>,
 <mripard@kernel.org>, <maarten.lankhorst@linux.intel.com>,
 <geert@linux-m68k.org>, <tomi.valkeinen@ideasonboard.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <freedreno@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 <imx@lists.linux.dev>, <linux-samsung-soc@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, <virtualization@lists.linux.dev>,
 <spice-devel@lists.freedesktop.org>, <linux-renesas-soc@vger.kernel.org>,
 <linux-rockchip@lists.infradead.org>, <linux-tegra@vger.kernel.org>,
 <intel-xe@lists.freedesktop.org>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v6 03/25] drm/gem-dma: Compute dumb-buffer sizes with
 drm_mode_size_dumb()
Thread-Topic: [PATCH v6 03/25] drm/gem-dma: Compute dumb-buffer sizes with
 drm_mode_size_dumb()
Thread-Index: AQHcEnS8fucA3LjqjkuGZw8r9BxHgrUEDdaAgAAGpQCAAQFLgA==
Date: Wed, 26 Nov 2025 06:24:38 +0000
Message-ID: <2fbe0d43-67c5-4816-aff0-c23ac1507ec5@microchip.com>
References: <20250821081918.79786-1-tzimmermann@suse.de>
 <20250821081918.79786-4-tzimmermann@suse.de>
 <52600bf4-2c1c-49a6-82c5-b31818141a43@microchip.com>
 <a11c195d-197c-45a4-962a-e2336c7360c2@suse.de>
In-Reply-To: <a11c195d-197c-45a4-962a-e2336c7360c2@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7257:EE_|DM4PR11MB7207:EE_
x-ms-office365-filtering-correlation-id: ea781b90-eedd-40ee-e1c3-08de2cb479ce
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7416014|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?aXYwVmRnaHYrQklnTm94L0JCRGF0YnJSOWNDZ29Zb2dTMURqQWFJQ1F3MVVt?=
 =?utf-8?B?by8rZ1N4T0d6NG5PaWlhb3Brb0huYUVGemtRNU91TkUxdjU0WGp2TUMvd2FY?=
 =?utf-8?B?SmM1ZWdqTWFKSnhGM0ZLbkliakRBc3dFMTBxa3M3Yzg5NFlUc1kzeUQxd211?=
 =?utf-8?B?RHgzVlpLckF1VlJacStIMHNWbUFQZ09aYWJGYVJwbVZoWUppUmc5cE91U21s?=
 =?utf-8?B?M2VPWGs1OFRvR2VkSDAzek9jelVlVWhxWVMvOFlpdlFPRm1Lc09ETFJUbXN2?=
 =?utf-8?B?b3dyQmEyWDVKdDgrVGVjQi8wSEwza1NGQ2hkSmJVSzZrK2lzTVV2U0wzVWt6?=
 =?utf-8?B?TThtWGhuWTFxbnRYYlFpYWx2Q3Y1ZEpmYmg1YWpkVk84Y2ZRVFlkWVNsNURD?=
 =?utf-8?B?VHlLNldwSEZLakpIaTVJeWNiK0RKRVV1a3VzQStYdEV3cDl2eUl3WTdxbmhC?=
 =?utf-8?B?anRjUVp0Rlc5azd6VEpIVlJvNlY0K05GbUl1d3YvSkFFSlZud3RMTDZKRUc4?=
 =?utf-8?B?ZTRlL3R6MXl1U1ZFT2tlajRxSGZ1VS80ekc0T3d3TTdSOGtVc0ZLanIybThI?=
 =?utf-8?B?M0lLK3lRaDZ4bHU4NW1Ya3RNVHRQQTR0NVF6Y2ZNb3U3TnBXUy9ydnYwejIy?=
 =?utf-8?B?dnhxV3o4cVJIU085ZThjSkJmMGRYcDdCUmgzWnVWeERRcW9BVzR2d3JiTVdy?=
 =?utf-8?B?eERydm9MbVFtYmNDV1ZicGZ0ZUtvTldsbHYxbnhnRGF1MjkwTkxBUWhOd3Np?=
 =?utf-8?B?MWx5L1RZWUNDU1gvcnROcXFlSXIrVFg0OGJEc3F6TW9MYjdoQzRRWmJpbmJ1?=
 =?utf-8?B?czV0YzVMUXk2VkdjcERjRktQZlYxV1VnNmdwSXF0MTR3UW9UeGFOSG0veko2?=
 =?utf-8?B?WXFMYkVrQitlL0srQ2tBakRMMU5qNGpXWUo2VGVmQ2l4TWo5S0hEMVM0TUUy?=
 =?utf-8?B?c1ZnZUhOQlpKZEtBR2FIWExkVmVTOEpMQVE4TTRUSXhnMDlpUk5DQW1HNExV?=
 =?utf-8?B?SjNaV2l4RllEdktBd2E4OWwwY0ROOHVkZHhMOHkzODE0dllid2k5WnpGcWti?=
 =?utf-8?B?OWswcStwSGc4ZWtKTnJ2SlcvVDFvY0NCVmFKL3d3TUJndVpSNDI1bzgxTFk0?=
 =?utf-8?B?VTV5UVgvdVk0cWs1L0lEY1NTbDE1ajFPUll1bXdCUjRzVkJoLy92eXJMUG11?=
 =?utf-8?B?cDE5OXNBbHo1WlU2S0lpdUVsTEg0bEhic09CSS80T0RmakxNbHV0eFpWL1Bu?=
 =?utf-8?B?ZEF3YVRsL2lKZVlwS0NXTGJheWVCbTB1YmJQaEE5UTZ1bE1qMXJmdVJlaTJ5?=
 =?utf-8?B?V3U0UW1uc2FrNFlMeG9IdmhsY2J1RUpMamNGa2daODZGeEh1RDB1aDZReTYx?=
 =?utf-8?B?M3FIdFhQVTdtQUI3aGk2UGRvR0ZqN1U1K1BDYy9kU1N3NjVmdWVDNkVmODNL?=
 =?utf-8?B?THltRVVaMjY4VWNmakdsNW5xRUJEbENiZldlUlB1LzNGbDl4TWxLQ1ovQko1?=
 =?utf-8?B?QkQvMnVEcmU1QWYvVTFmKzRMTktlUmluYnVodnFUSWlsVzZUaDQyZnNuUFZU?=
 =?utf-8?B?NWpRN2ZadkFaRTdaWFVUREhxVFFXaWNUZzNtMnMzMmYyYWhSZk54WUViSUFn?=
 =?utf-8?B?bkcvcHhqQlNYNkJvV3lGYjR1bGorMmJyR1hNcGZoOW81SlhkSXRDdjcySklU?=
 =?utf-8?B?UzJxekNhemRGU2ptbjZJdlM2M3pGeVhUSVRRQi9HQWttNC9tQTlOOERJMUNs?=
 =?utf-8?B?T2dXS0kza2ZlZHJ1OUZRb0E2MVhoUG82aG1VV3JsaXArZ0NMcHBkd0NnRmIz?=
 =?utf-8?B?YVlZcVhKYU42YVRoVzloYkVJUTRORElGemJMdVpRQndoREQybzd3WG81MFFM?=
 =?utf-8?B?b2ttSzdMekVXdGQ3WkNaZkNZMmNsN25FaDNGOWVCRzlGbWRvR1o4MGRjVlFQ?=
 =?utf-8?B?dkZIclVmcWxWWnJNWklIVHMzRUdTMTFjbzhFNjM3NWplR1VVL1VzcG0xRGpG?=
 =?utf-8?B?UWQ0NlRnVXJUMWtMelVUY0hiOFdSRDZiVzlvMGJZVFRCNGxOMXRvOEV0UGxh?=
 =?utf-8?Q?Z56loj?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7257.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7416014)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VGdEMENBdEZmTm9KQ2JhY3IzbnY0QnZKdFZ4Wmp2K0haV0tJMTV2aU5OaDky?=
 =?utf-8?B?Um9HaTc1WEtqc0FjSkExUU1jUnU1VEw1SUZtQkhvVmhxNXdkZDB2c2NkVUU3?=
 =?utf-8?B?OEszcGYyTU9iYWNLWVVLZ0haS3BHSmNuWDFhMm1yS1lSUTlUb1JFQjlxYnZu?=
 =?utf-8?B?ZGNHZkNqbExtdjRpNDc3Z3NYdlBIMzg5by9RMFhCRnRxQmhiNm9sbXBCeWoy?=
 =?utf-8?B?VjdPVExZOHdZa0M5RUJYdHh0dUE1UDhSK3k4alRiUnVGVlA2d3Fza1N2azlm?=
 =?utf-8?B?c3FaNi9tWHora3pzdDg3ekdwVzlZdWdOZ0JjRklFMXZ1dXh0YlBXQ3h6dnpG?=
 =?utf-8?B?MGpjL2dRdHE5R1JLQXcvZFlvUEQ3clh0dVVyRWNmdjFlQ0lHNGw0YXNIRFBY?=
 =?utf-8?B?VTEyVGEwZTlIUmtmZmpZaDA1QTdxd0t4ZG5Jc3dzNWdjZ3JOKzBsU0M5RnFr?=
 =?utf-8?B?MFFTQ2tVODBSaDdTZkFaUU82dlg3ckhSWG5ib0puWkZtT0U1ZG1KQkxCVFh3?=
 =?utf-8?B?dGRZM05JNENqNmtUNFJIV2xxVTVoYkgvZk1IdnRyYUlaYkRnSXp0MVV0clpj?=
 =?utf-8?B?bloxOExpa0pPejVQMDdPYjBBS2g3L2NTeWFMa2JRazM5YjFjSS91S3FDSXJQ?=
 =?utf-8?B?bk55VVdxYjlGdVZFcnUxdktHQ0pFaVdmTytDVEdhRGJjSXE5T29ZSU92dFFn?=
 =?utf-8?B?SGFGYUpic3NMb1RUazN5NUNEQ2FqcnBoRWN6bm9EZzYyUk1rSE9uamh6eWdr?=
 =?utf-8?B?YlJvNUszMkVpUHAzRWhhVXJ5OWllWWtWbldnZ3M1YURiSzNOU05ZVHlST0NC?=
 =?utf-8?B?Ri9Lck9hZEhvcTNkL1NkNTBTbGo2emhEQ2Q5RExZVzdSdVVRaTlBWG1DenVJ?=
 =?utf-8?B?K2s3R3JnT21NNDdHamN6dTNycUk1T0NJZkdYU28xekpMQ2x5T05VakhUSFZw?=
 =?utf-8?B?WmpIeE1kVkQxZ0JlMWwrbVI0SGh6STc0VUphMURzaEFqc1JLcnpHT1dqM1dB?=
 =?utf-8?B?RXYwLzFkMGVqdXpydTNTZnZDYVk5L1VvUlBZdlRCeU9wR3B1S2hRSGhzeHVz?=
 =?utf-8?B?bjAyRjV3b255YXZkRnlnZUFiSjZhNng2REdxWDllbG9RRS9FM0F5S2c0WjJn?=
 =?utf-8?B?cWczbTV3MmhpOFVZU29vSHFaNmpiZm9EazI0SWdjRHhqamJUQ2puUkNCSFRY?=
 =?utf-8?B?MGZmOVp6dS85V24zRFlUdkRGYzVtckFFemhOU1NjVDR1Y3RqeHlZUEdJMXpF?=
 =?utf-8?B?UW1ZRHF2R2kvNVFCU3Rpa2NzeE12SHExMFZtU1hTMmpicHhyakFjUU9hV1Nn?=
 =?utf-8?B?OS9WbUFkdEg5QndPcklkYUl5bCtuOXk3WDVzei96RUI0QjVWMUN6ajAvY1lq?=
 =?utf-8?B?MG5tVHV4ZWVpNEZrKzdtcEpCWUdUOWk4c0NhaitaSVhyNjdwSzltY3dCVExw?=
 =?utf-8?B?SFlNYU9PaWMwMHc1QndwaUkwM0xmZytRY1JmNHdld0EwOUNnMjdJc21EeFA2?=
 =?utf-8?B?cHhCQkVTdUQ2cm5zUnRoNHovcmgxbEhkSU9VelZWRCt5K3ljdlhUVGJydjVY?=
 =?utf-8?B?NUVCZWoyT1RwOW5VNkhNbVVoMUZXMWQvTHhLTHUyN3ltQnBJUDFBTlBKRG1B?=
 =?utf-8?B?TkxJOFpTMUpueW5oN3Q1M0ZCYlJJa2E1QlAzVThaQzJOb0xLMDc0ZUlIQ3JI?=
 =?utf-8?B?YkxycVc2YWhoTG1MREIxZ255ZWx4UzIrWWduUGF6M21ETGUvTjFnalhROEc4?=
 =?utf-8?B?QWNjdzFLb01LeVhpdWJ6Y2dhWXNSM0FRaUg2SG5DdGNUejg1NEhDS204OVJL?=
 =?utf-8?B?d0tKR0c0a21aMVlZcExlTDlGLy9VSkwvcHZkRWVHQyt2SWpvVjFIVjRYMVpY?=
 =?utf-8?B?bnprZStCZExNZDBnSk04VzEzUVVqN2c2UVZLZlp6R0laLzNtUE5xcVMzei94?=
 =?utf-8?B?KzZSMjVKZVVodkl3WG1BSktjbFEyTlFmWWg3am5tWDFnUVNBeEJ6clUvSmNW?=
 =?utf-8?B?WEF1MmdLdzhQM0JHNThMQXNUOTBaeTVKYVJaQlpiSTVaZkRVSm1YcW1zaklj?=
 =?utf-8?B?cnBuelVLdVh6bDE3WTlldmRWNW1sUWMxRXM3NGdTR3UvcUFMMG83M25rbkl6?=
 =?utf-8?B?eDczamE5N0ZscXp2bFVaMnBVRldDOUxQL0VscmhyMW5KU3BlSmhwSmVVYmgy?=
 =?utf-8?B?U0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EDF1B0E5AFC87D4081CE30A7DFECC81A@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7257.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea781b90-eedd-40ee-e1c3-08de2cb479ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2025 06:24:38.2101 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 28pnl6PDYZubyFlYc+YWMdCWowN0qfPZleuZzT55U+68krWzh+ucmR3qrbLIP/p7huRshESybBO3myjzgC3tOVpZrm+gcvNLAMOCjL1Ot1c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7207
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

T24gMTEvMjUvMjUgMTY6MDMsIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0KPiBFWFRFUk5BTCBF
TUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBr
bm93IA0KPiB0aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBIaQ0KPiANCj4gQW0gMjUuMTEuMjUg
dW0gMTU6Mzkgc2NocmllYiBMdWRvdmljLkRlc3JvY2hlc0BtaWNyb2NoaXAuY29tOg0KPj4gT24g
OC8yMS8yNSAxMDoxNywgVGhvbWFzIFppbW1lcm1hbm4gd3JvdGU6DQo+Pj4gQ2FsbCBkcm1fbW9k
ZV9zaXplX2R1bWIoKSB0byBjb21wdXRlIGR1bWItYnVmZmVyIHNjYW5saW5lIHBpdGNoIGFuZA0K
Pj4+IGJ1ZmZlciBzaXplLiBBbGlnbiB0aGUgcGl0Y2ggdG8gYSBtdWx0aXBsZSBvZiA4Lg0KPiAN
Cj4gSSBtaXNzZWQgYSBjaGFuY2UgdG8gZXhwbGFpbiBpdCBoZXJlLiA6Lw0KDQpJIHdhcyB3b25k
ZXJpbmcgaWYgaXQgd2FzIDgtYml0cyBvciA4LWJ5dGVzLg0KDQo+IA0KPj4+DQo+Pj4gUHVzaCB0
aGUgY3VycmVudCBjYWxjdWxhdGlvbiBpbnRvIHRoZSBvbmx5IGRpcmVjdCBjYWxsZXIgaW14LiBJ
bXgncw0KPj4+IGhhcmR3YXJlIHJlcXVpcmVzIHRoZSBmcmFtZWJ1ZmZlciB3aWR0aCB0byBiZSBh
bGlnbmVkIHRvIDguIFRoZQ0KPj4+IGRyaXZlcidzIGN1cnJlbnQgYXBwcm9hY2ggaXMgYWN0dWFs
bHkgaW5jb3JyZWN0LCBhcyBpdCBvbmx5IGd1YXJhbnRlZXMNCj4+PiB0aGlzIGltcGxpY2l0bHkg
YW5kIHJlcXVpcmVzIGJwcCB0byBiZSBhIG11bHRpcGxlIG9mIDggYWxyZWFkeS4gQQ0KPj4+IGxh
dGVyIGNvbW1pdCB3aWxsIGZpeCB0aGlzIHByb2JsZW0gYnkgYWxpZ25pbmcgdGhlIHNjYW5saW5l
IHBpdGNoDQo+Pj4gc3VjaCB0aGF0IGFuIGFsaWduZWQgd2lkdGggc3RpbGwgZml0cyBpbnRvIGVh
Y2ggc2NhbmxpbmUncyBtZW1vcnkuDQo+Pj4NCj4+PiBBIG51bWJlciBvZiBvdGhlciBkcml2ZXJz
IGFyZSBidWlsZCBvbiB0b3Agb2YgZ2VtLWRtYSBoZWxwZXJzIGFuZA0KPj4+IGltcGxlbWVudCB0
aGVpciBvd24gZHVtYi1idWZmZXIgYWxsb2NhdGlvbi4gVGhlc2UgZHJpdmVycyBpbnZva2UNCj4+
PiBkcm1fZ2VtX2RtYV9kdW1iX2NyZWF0ZV9pbnRlcm5hbCgpLCB3aGljaCBpcyBub3QgYWZmZWN0
ZWQgYnkgdGhpcw0KPj4+IGNvbW1pdC4NCj4+Pg0KPj4+IHY1Og0KPj4+IC0gYXZvaWQgcmVzZXQg
b2YgYXJndW1lbnRzIChUb21pKQ0KPj4+DQo+Pj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFppbW1l
cm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQo+Pj4gUmV2aWV3ZWQtYnk6IFRvbWkgVmFsa2Vp
bmVuIDx0b21pLnZhbGtlaW5lbkBpZGVhc29uYm9hcmQuY29tPg0KPj4+IC0tLQ0KPj4+IMKgwqAg
ZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fZG1hX2hlbHBlci5jwqDCoMKgwqAgfCA3ICsrKysrLS0N
Cj4+PiDCoMKgIGRyaXZlcnMvZ3B1L2RybS9pbXgvaXB1djMvaW14LWRybS1jb3JlLmMgfCA0ICsr
Ky0NCj4+PiDCoMKgIDIgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9u
cygtKQ0KPj4+DQo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX2RtYV9o
ZWxwZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS8gDQo+Pj4gZHJtX2dlbV9kbWFfaGVscGVyLmMNCj4+
PiBpbmRleCA0ZjAzMjBkZjg1OGYuLmFiMWE3MGIxZDZmMSAxMDA2NDQNCj4+PiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vZHJtX2dlbV9kbWFfaGVscGVyLmMNCj4+PiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vZHJtX2dlbV9kbWFfaGVscGVyLmMNCj4+PiBAQCAtMjAsNiArMjAsNyBAQA0KPj4+IMKgwqAg
I2luY2x1ZGUgPGRybS9kcm0uaD4NCj4+PiDCoMKgICNpbmNsdWRlIDxkcm0vZHJtX2RldmljZS5o
Pg0KPj4+IMKgwqAgI2luY2x1ZGUgPGRybS9kcm1fZHJ2Lmg+DQo+Pj4gKyNpbmNsdWRlIDxkcm0v
ZHJtX2R1bWJfYnVmZmVycy5oPg0KPj4+IMKgwqAgI2luY2x1ZGUgPGRybS9kcm1fZ2VtX2RtYV9o
ZWxwZXIuaD4NCj4+PiDCoMKgICNpbmNsdWRlIDxkcm0vZHJtX3ZtYV9tYW5hZ2VyLmg+DQo+Pj4N
Cj4+PiBAQCAtMzA0LDkgKzMwNSwxMSBAQCBpbnQgZHJtX2dlbV9kbWFfZHVtYl9jcmVhdGUoc3Ry
dWN0IGRybV9maWxlIA0KPj4+ICpmaWxlX3ByaXYsDQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBkcm1fbW9kZV9jcmVhdGVfZHVtYiAq
YXJncykNCj4+PiDCoMKgIHsNCj4+PiDCoMKgwqDCoCBzdHJ1Y3QgZHJtX2dlbV9kbWFfb2JqZWN0
ICpkbWFfb2JqOw0KPj4+ICvCoMKgwqAgaW50IHJldDsNCj4+Pg0KPj4+IC3CoMKgwqAgYXJncy0+
cGl0Y2ggPSBESVZfUk9VTkRfVVAoYXJncy0+d2lkdGggKiBhcmdzLT5icHAsIDgpOw0KPj4+IC3C
oMKgwqAgYXJncy0+c2l6ZSA9IGFyZ3MtPnBpdGNoICogYXJncy0+aGVpZ2h0Ow0KPj4+ICvCoMKg
wqAgcmV0ID0gZHJtX21vZGVfc2l6ZV9kdW1iKGRybSwgYXJncywgU1pfOCwgMCk7DQo+Pj4gK8Kg
wqDCoCBpZiAocmV0KQ0KPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiByZXQ7DQo+
PiBIaSwNCj4+DQo+PiBXYXMgaXQgaW50ZW50aW9uYWwgZm9yIHRoaXMgY2hhbmdlIHRvIGFsdGVy
IHRoZSBwaXRjaD8NCj4gDQo+IE1vc3QgaGFyZHdhcmUgZG9lcyBub3QgbmVlZCB0aGUgcGl0Y2gg
dG8gYmUgb2YgYSBjZXJ0YWluIGFsaWdubWVudC4gQnV0DQo+IHRoZXNlIGJ1ZmZlcnMgYXJlIHBv
c3NpYmx5IHNoYXJlZCB3aXRoIG90aGVyIGhhcmR3YXJlLCB3aGljaCBzb21ldGltZXMNCj4gbmVl
ZHMgYWxpZ25tZW50IHRvIGNlcnRhaW4gdmFsdWVzLiBVc2luZyBTWl84IGltcHJvdmVzIGNvbXBh
dGlibGUgd2l0aA0KPiB0aGF0IGhhcmR3YXJlLg0KPiANCj4+DQo+PiBUaGUgYWxpZ25tZW50IHJl
cXVpcmVtZW50IGhhcyBiZWVuIHVwZGF0ZWTigJRmcm9tIDgtYml0IGFsaWdubWVudCB0bw0KPj4g
NjQtYml0IGFsaWdubWVudC4gU2luY2UgdGhlIHBpdGNoIGlzIGV4cHJlc3NlZCBpbiBieXRlcywg
d2Ugc2hvdWxkIHBhc3MNCj4+IFNaXzEgaW5zdGVhZCBvZiBTWl84IGZvciBod19wYXRjaF9hbGln
bi4NCj4+DQo+PiBGb3IgZXhhbXBsZSwgZm9yIGFuIDg1MMOXNDgwIGZyYW1lYnVmZmVyIGF0IDE2
IGJwcCwgdGhlIHBpdGNoIHNob3VsZCBiZQ0KPj4gMTcwMCBieXRlcy4gV2l0aCB0aGUgbmV3IGFs
aWdubWVudCwgdGhlIHBpdGNoIGJlY29tZXMgMTcwNCBieXRlcy4NCj4gDQo+IE1hbnkgZGlzcGxh
eSBtb2RlcyBoYXZlIGFuIDgtYnl0ZSBhbGlnbm1lbnQgaW4gdGhlaXIgd2lkdGguIDg1MCBwaXhl
bHMNCj4gaXMgc29tZXdoYXQgb2YgYW4gZXhjZXB0aW9uLg0KDQpJbmRlZWQsIGJ1dCBvdmVybGF5
LXR5cGUgcGxhbmVzIGFyZSBvZnRlbiB1c2VkIHRvIGRpc3BsYXkgd2luZG93cyB0aGF0IA0KYXJl
IG5vdCB0aGUgc2FtZSBzaXplIGFzIHRoZSBzY3JlZW4sIGFuZCB0aGVyZWZvcmUgcG90ZW50aWFs
bHkgbm90IG9uIA0KOC1ieXRlcyBhbGlnbmVkLg0KDQo+IA0KPj4NCj4+IFBsZWFzZSBsZXQgbWUg
a25vdyBpZiB5b3XigJlkIGxpa2UgbWUgdG8gc3VibWl0IGEgZml4Lg0KPiANCj4gRG8geW91IHNl
ZSBhIGJ1ZyB3aXRoIHlvdXIgaGFyZHdhcmU/IFVubGVzcyB0aGlzIGNyZWF0ZXMgYSByZWFsIHBy
b2JsZW0sDQo+IEknZCBsaWtlIHRvIGtlZXAgaXQgYXMgaXQgaXMgbm93Lg0KDQpZZXMsIHRoYXTi
gJlzIGhvdyBJIG5vdGljZWQgdGhpcyBjaGFuZ2UuIEkgaGF2ZSBhbiBhcHBsaWNhdGlvbiB0aGF0
IA0KcmVxdWVzdHMgYSBmcmFtZWJ1ZmZlciBsYXJnZXIgdGhhbiBteSBzY3JlZW4sIGluIHRoaXMg
Y2FzZSA4NTB4NDgwIGluIA0KUkdCNTY1IGZvciBhbiA4MDB4NDgwIGRpc3BsYXkuIFNvIEkgaGF2
ZSBhIHBpdGNoIG9mIDE3MDAgYnl0ZXMuIE5vdyBpdOKAmXMgDQp1c2luZyBhIHBpdGNoIG9mIDE3
MDQsIHdoaWNoIHNoaWZ0cyBteSBsaW5lcy4NCg0KUmVnYXJkcywNCkx1ZG92aWMNCg0KPiANCj4g
QmVzdCByZWdhcmRzDQo+IFRob21hcw0KPiANCj4+DQo+PiBSZWdhcmRzLA0KPj4gTHVkb3ZpYw0K
Pj4NCj4+DQo+Pj4NCj4+PiDCoMKgwqDCoCBkbWFfb2JqID0gZHJtX2dlbV9kbWFfY3JlYXRlX3dp
dGhfaGFuZGxlKGZpbGVfcHJpdiwgZHJtLCBhcmdzLSANCj4+PiA+c2l6ZSwNCj4+PiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgJmFyZ3MtPmhhbmRsZSk7DQo+Pj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9pbXgvaXB1djMvaW14LWRybS1jb3JlLmMgYi9kcml2ZXJzL2dw
dS8gDQo+Pj4gZHJtL2lteC9pcHV2My9pbXgtZHJtLWNvcmUuYw0KPj4+IGluZGV4IGVjNWZkOWEw
MWYxZS4uYWY0YTMwMzExZTE4IDEwMDY0NA0KPj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pbXgv
aXB1djMvaW14LWRybS1jb3JlLmMNCj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaW14L2lwdXYz
L2lteC1kcm0tY29yZS5jDQo+Pj4gQEAgLTE0NSw4ICsxNDUsMTAgQEAgc3RhdGljIGludCBpbXhf
ZHJtX2R1bWJfY3JlYXRlKHN0cnVjdCBkcm1fZmlsZSANCj4+PiAqZmlsZV9wcml2LA0KPj4+IMKg
wqDCoMKgIGludCByZXQ7DQo+Pj4NCj4+PiDCoMKgwqDCoCBhcmdzLT53aWR0aCA9IEFMSUdOKHdp
ZHRoLCA4KTsNCj4+PiArwqDCoMKgIGFyZ3MtPnBpdGNoID0gRElWX1JPVU5EX1VQKGFyZ3MtPndp
ZHRoICogYXJncy0+YnBwLCA4KTsNCj4+PiArwqDCoMKgIGFyZ3MtPnNpemUgPSBhcmdzLT5waXRj
aCAqIGFyZ3MtPmhlaWdodDsNCj4+Pg0KPj4+IC3CoMKgwqAgcmV0ID0gZHJtX2dlbV9kbWFfZHVt
Yl9jcmVhdGUoZmlsZV9wcml2LCBkcm0sIGFyZ3MpOw0KPj4+ICvCoMKgwqAgcmV0ID0gZHJtX2dl
bV9kbWFfZHVtYl9jcmVhdGVfaW50ZXJuYWwoZmlsZV9wcml2LCBkcm0sIGFyZ3MpOw0KPj4+IMKg
wqDCoMKgIGlmIChyZXQpDQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiByZXQ7
DQo+Pj4NCj4gDQo+IC0tIA0KPiAtLSANCj4gVGhvbWFzIFppbW1lcm1hbm4NCj4gR3JhcGhpY3Mg
RHJpdmVyIERldmVsb3Blcg0KPiBTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgN
Cj4gRnJhbmtlbnN0ci4gMTQ2LCA5MDQ2MSBOw7xybmJlcmcsIEdlcm1hbnksIHd3dy5zdXNlLmNv
bQ0KPiBHRjogSm9jaGVuIEphc2VyLCBBbmRyZXcgTWNEb25hbGQsIFdlcm5lciBLbm9ibGljaCwg
KEhSQiAzNjgwOSwgQUcgDQo+IE7DvHJuYmVyZykNCj4gDQo+IA0KDQoNCg==
