Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A528AEBA50
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 16:49:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AC6610EA4A;
	Fri, 27 Jun 2025 14:49:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="v8VnyMRn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2047.outbound.protection.outlook.com [40.107.94.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF85210EA4A;
 Fri, 27 Jun 2025 14:49:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JWnBdxaEja/vscMVOJV5SCFLg8uRjLuXv0Ixz0Q/cdf2kn5OeoCYW6sKUyLjol8ScgL2rKKJNj4y0E2Lgt56a2ee4Cv9KBGPMK1wdLmmWSyozZ2hiUga0HChxrnxo90KCg9/UG1dKnrzDEl5PG2o+qLSYl9+VSiVljIf/4zqPZ8l6whpi+JkKPwf5AurDzPAPWvqI1hz6ihxz0g7cFzznnBLHrgcgQdsRw4MxnqWfJb+JF3EgmVaxA9894Ha0M3pLZCdYVgYPpW+EQGWMrcDNsIq3skFRR12O7BnC6WIoqS0UawSrhSqojGTSAe65nm+kfrcv16h8kYZAGoHa40spg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+HVIVveqiequ8VbJVucutKnlAYfo6dy0DcZhZWuNBFY=;
 b=XScsBNGbEF1RCOZ3yUN+ylwdfK4MEPYoyRRHq/2GNRT2SHBoHOYJ8HHkZRri5mvwmU8ECmjkptPP37VBzPi996XTyGAGFq3cAYI2Ta+/hQ8kIir4PvrX8/ekuUrwieBA8gPB3BIp9sMrvL0bNB62Njtsybd5JaiiYTOAiBYIAUvbMv1D1y2Czat9xyNsSuGrkMrqZ4nQnjtshqrVfHmN2u5RY1Pitrgh2VtiT8258AWPvb1hdHtMbNb2iv08KHs2jTMjJ2TCkUFIQLHaFx15VJlx8bh30Fj+SdzZgLXhTg6W7+Rok+lvnGR06RVE2nD6Nl8XLOaQ23iH0wqz2hbB9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+HVIVveqiequ8VbJVucutKnlAYfo6dy0DcZhZWuNBFY=;
 b=v8VnyMRnP60xMwlWiWrOlpjnOzUQK6JLgG13mg4uVJOnZUp2BnlU8W00/bpQPbOWF3QogkkY2+q6WLwBJnA3cLseqZAZXOV3eHyHkA5enRNrukpoyIM17cE9c35egXAtwRcCcQJmUlCKikwq0nhqXY2G7A3kVSjjYvSOa8+ruqM=
Received: from BL1PR12MB5144.namprd12.prod.outlook.com (2603:10b6:208:316::6)
 by PH7PR12MB7019.namprd12.prod.outlook.com (2603:10b6:510:1b9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.23; Fri, 27 Jun
 2025 14:49:05 +0000
Received: from BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::491a:cce3:e531:3c42]) by BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::491a:cce3:e531:3c42%7]) with mapi id 15.20.8880.021; Fri, 27 Jun 2025
 14:49:05 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "long.yunjian@zte.com.cn" <long.yunjian@zte.com.cn>, "Wentland, Harry"
 <Harry.Wentland@amd.com>
CC: "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>, "siqueira@igalia.com"
 <siqueira@igalia.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>, 
 "fang.yumeng@zte.com.cn" <fang.yumeng@zte.com.cn>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "mou.yi@zte.com.cn" <mou.yi@zte.com.cn>, "xu.lifeng1@zte.com.cn"
 <xu.lifeng1@zte.com.cn>, "ouyang.maochun@zte.com.cn"
 <ouyang.maochun@zte.com.cn>
Subject: RE: [PATCH] drm/amd/display: Use str_on_off() helper
Thread-Topic: [PATCH] drm/amd/display: Use str_on_off() helper
Thread-Index: AQHb4lx44vO3TU+byEK3o6G/8vpsD7QXIHbw
Date: Fri, 27 Jun 2025 14:49:05 +0000
Message-ID: <BL1PR12MB51440A641758D0CA24E7F8B2F745A@BL1PR12MB5144.namprd12.prod.outlook.com>
References: <20250621112742498q_NLTyjSUQoBWFl8SFHu1@zte.com.cn>
In-Reply-To: <20250621112742498q_NLTyjSUQoBWFl8SFHu1@zte.com.cn>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-06-27T14:48:55.0000000Z;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source; MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5144:EE_|PH7PR12MB7019:EE_
x-ms-office365-filtering-correlation-id: c633037c-7b81-49ea-58c3-08ddb589c396
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?RkxPd2tSd2lyOVRVam14RGlhL0Rvb0Q1UWNsMTBiU1JFdUl0SUpOUkEwMzhs?=
 =?utf-8?B?QXl4WTh6ZGNjSmZDdWV6Rkw0d0l2NmlJcEpHWDhPeFd3U1pKUUlvVTcxYk04?=
 =?utf-8?B?THFNY0JkMmNpamtzSDBVOHVPclVqQUZ1ZlJXcFVJbW1YU1E2a2dzdkhscWJa?=
 =?utf-8?B?Z2JOUVY2NGhweXNoa0dGVmNwV0FZYkdKQjZJL2d3UnlhNzZIQ1Q1OWt5aHRG?=
 =?utf-8?B?UUgwYkFNb0VBNFpqUy85eW1RTTQ4ZEt2TFUrMGpTZVZQNU1RUVVkT1laMGFv?=
 =?utf-8?B?NFlUR3V5NytrUERZa2tIRE5ZYmNuWDhoc3NQKzZicFZtazg5aHEwMnp5MXMx?=
 =?utf-8?B?Sit2MG9Td2U1MzR5V1ZFanFrL2JZSUxuQURHQi9SeEVNc3B3OWIxRk9JbUdB?=
 =?utf-8?B?dEJXRW1ERUxxNEdCY3dJRDQ3YnRUNXdIUXNNY3B4ZE5FY1A5RlQrcUN4eWFG?=
 =?utf-8?B?cm9RS2RESjhMalNqaFZKWlArek1CajcxajVadTNSVEQxUE01NTFMS3pIVE13?=
 =?utf-8?B?WlRRZVRTaS9YdU9lTjZVRGhWaXZhemVNRXk5ZWtaU3JtSkxTYms4cmk2ZWI1?=
 =?utf-8?B?dlVNbHNCZ0JOUkQycWYyRnAzdk9pZnJQWERJOXBOYlFKNk11Zkl0ZU9BdDVs?=
 =?utf-8?B?akFVaFZxMDdDS25oS0RnVjR3VkhycnJqSUYzMDd3SGllVkMrM0N4dXFrTVMx?=
 =?utf-8?B?ZzZYZUVzcFFHL0xsbm0vK0tTZUUwV0F0U0gvOEpkWm1xRTZlbTFFUHhNbHZr?=
 =?utf-8?B?czAvb2tKY25qUWJJdEJINi9wdnIyV25jTXNIVWhWSWNJS1JOUmg0TmdCSk9O?=
 =?utf-8?B?bEd4UStEUnRaMEpsL3c4bkZWNHNrcm9TS094WTRGZ2xsQ3dxRFpxbzFpZ0Vh?=
 =?utf-8?B?S0VJejhFZE9pejg1VUt5WkZFUXp3d1lHMS9QRWprOUR6eHRtSUhtSXBGUElE?=
 =?utf-8?B?bVBaVHlDRER1RGdieHVGcXMyQXdqRWZxdzZuSE1TTFM5MFY5dWw4OGV4MzJX?=
 =?utf-8?B?WTRlMVJwZlppdlVCVmhmSlM1ZFBBNVFBRDMwa1dZU0Vtc0w0bEV3N1RRcjdG?=
 =?utf-8?B?SitSbk1kUFZocHc4b0FqN2UrWEk3RUU3a2xCWjQ4V0VhMGZaTnpFYTIxMUlE?=
 =?utf-8?B?aFltS3Aza0Jvb0lVdXZJc1RPV2thMzY1eVIrTmJZN0FPaXVGdFNlTWJKU3hK?=
 =?utf-8?B?a1RlMzErL081Wi9yMXo2dHlLTFZoZHJtTklMZ20yMy8wWUNEUkJwL0NWb3lX?=
 =?utf-8?B?N1FkOEQrUzNNa0JkdXlaUFFXc0VMcGgvUzMremJ5TWxQOTkyeFlsbHF4M0VC?=
 =?utf-8?B?WHlCd1dnUUcxNVJDUGtkUmlwVVlZZkw2Z0l6Q2cwUTJrZzB3bk1XOFIvZzhU?=
 =?utf-8?B?Q1d4SlI3MUFwY2h0YmVMYTFMQWJYeGdVUVFDcCtDSlhrMUZ5UWZrbXlNRzZl?=
 =?utf-8?B?M0svU3hwQVFzbGp3dUpvcEY0djE0TVBvWE9MOWpLTjRISENWMFhmS0FWL0dL?=
 =?utf-8?B?bG0xM3NFZURTTStmc3NJZmN0eDNZMXdqbllRRzJJeU5SSnErYXlacStwdHVB?=
 =?utf-8?B?bHprdG16cXdCSTdDWmZZZWFKd0ZETXdVL1RPb3RjUHNock9tT3JZYm5oWThq?=
 =?utf-8?B?RW5na3FadnNhY3ZxclNDRUU5YUlQU1B2L3lVZ3IxQ0l0dEE2NkZWK1RBQUk4?=
 =?utf-8?B?eVJlS2E3L0JvcHRtWTFNZ1RkS0FjL0VYcGx6N0htQVNCU3JEOFdyZG5hRHpy?=
 =?utf-8?B?Rlc5a1drL0pTZlhqaUo0L01STC9FTExOa3BOYjJBMHIwTENrTE53UFNCMWtq?=
 =?utf-8?B?OEhnaGgvS1VUZVNZN0MxSDBvaEVXaEppMThYcVBjWW1LOTZQSTFRRmZ6QTR3?=
 =?utf-8?B?cTllbWxYNE0vOWNVSlhWMW9NWmk4OEp1YkNIQ1VSeUJOTXoyYUpKUFNvdnls?=
 =?utf-8?B?dVdmVWlrdk5KU2VTNXNTaFBOblZXWXkyeTYwOFVVL09jWCtya01XYVRGTnlR?=
 =?utf-8?B?RzZyYWkwb2ZnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5144.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VjdZSDk4d0dBdXhIRjRBU1g1M2dpZlZ1bEh4emZleGlVQkJVbjZtajBSMXdF?=
 =?utf-8?B?Wm44Ty9wSHJQMDBiVjZpRTNkdW9GMFdtczlJOXduQksvUXBIbjRVQ0VLT0Vl?=
 =?utf-8?B?OXFUUFh1NzU3MG9tdHNOak0wdFo0cDhQdzBSWG45bHhLdEtkTzhKYjhwYnhw?=
 =?utf-8?B?Nk9GSWFFRkoxK01ESCtQd1ZmVlY0REFDNGNEYXVlR0lHblppZ2RYUy9XM0hW?=
 =?utf-8?B?bXRsb0hYZ0pyaytqL3FreEd0ZTN4RUVqTmRuT0tqVFFXK0RXcTU3UkhSejA2?=
 =?utf-8?B?OGYyN0IzZjJuZjY5UGJVRkRVZmVHeWw4YXE5Z044d0hVek1jUnR6c1ZsZldQ?=
 =?utf-8?B?Z1BvbGcrSmdkZ2h3eUpVRkNRamxyWCtlSW5zV1QxRGtrREVYSzVjdDFYR0VJ?=
 =?utf-8?B?dHVmelR6Y2IvZ0lJV1lHckNZS1ZQV01aM1p4Tk1UT2NIU1I4em9EWllodldk?=
 =?utf-8?B?bWtyallSK0dTTjg3V3JwK3U5MllOMFpDMjZhOHY5R2kweElsN2s0d3l4azJW?=
 =?utf-8?B?c1g5N3dydEJsd1hYZmt5SWV0SlpjYldvM0hkQnFXUzRLZGZmS3ZqaUFlNnFS?=
 =?utf-8?B?UGdWazRZMThWdEZjMzk1ZjVveDk5NkFLNFlhYWMzdG5meEVtZnFFa09DTDdQ?=
 =?utf-8?B?ZFJmR3NKZTFCeVNYWDNuVENaWFNxbkI3bkIyMm1LK09ybFlKVFJCTUNGanBD?=
 =?utf-8?B?azZ3TUtUMG1ubXNPY2RkakIwMHZubCt3eXlQTTNuVGZiK244aGluTDZGemlN?=
 =?utf-8?B?YWlFSVZiRFUvT2hvVG9MUmV5cmtNT1l6eFV3N2JQZW9ocDRCcGV4MFd1emNL?=
 =?utf-8?B?cWpuTm5jcTNTMlc2NStMZC95UUloSW1vMkM4M25qVGkwaWFCQ01BU3l5WXBI?=
 =?utf-8?B?TlRPRXZDQlhoSldaNkZKUmludG5RazlEeExWdDhiR0p2NHc4eEUwVWVEL2RY?=
 =?utf-8?B?UCthSHBIMC9XL3pHMnBPV2svTVozVEpQTHhCdjZsbzBKWXQ3cVFOckNoYVNW?=
 =?utf-8?B?NllkYnNjZEJWN1B1WmlpdkFPYmlEdU1ac3hUV0QzQ1RKLzlIM1ZoSFZCbEh0?=
 =?utf-8?B?c1MvSUloSlNBL1l2Y3VlMUxWNDZtSTd3YzRTSWtFK3psNDhtSXc5aVlUWUJa?=
 =?utf-8?B?S3U3VTRUS3IxUXUvZXBQbHBtM2ZmSmsyWDVQUlJPU2pCblUxYVRuemZ0ZUlu?=
 =?utf-8?B?d25aTmtiQnpvdzZnTHQvSVQ1YTdYeEw2UGl4ck0xMEtGVWN3SElvS0Fqczd0?=
 =?utf-8?B?aUx5TEprNTl4TlpjM2dGdWNUTTU0UVBheUxiU09COTg2UjFhRHl5UERuWjQy?=
 =?utf-8?B?b01SamNYMkVOUTIxYVZJWHUraHAyL2JWVCt2UXIyZjhTdUw1c0thN2ZEdy8z?=
 =?utf-8?B?cENwaFZwVGlUN2M5ejYxMFM2TG9uV1BYeUtNaFpTQlBHTDRBWmVmVXpVdStS?=
 =?utf-8?B?U09XcnNpKzBlc1hmNnk1WlNEUXpmZlJkUkJxQ3U3cm90MUdPUFp4MW9DSGNS?=
 =?utf-8?B?TmI1MEt5cTZDQjMzWDVaREU1WTJadHhla00yT1VXY2VEelgxU1IzbENmK2RY?=
 =?utf-8?B?dldKNFIzdE9IeUJwWDZpVllDWVU0L3NKbzQxUHJob1pUNXVCVkxKWVE1Sm1Q?=
 =?utf-8?B?dnAvNUNHT1J4Wi9IMWhLem9GS1pYd2dxTzVPTXlQOC9nbXVuMXJoY09iUEt1?=
 =?utf-8?B?c09WVE5KekE2ZndPTjE5a1F6UWV1aXRkOEJTaTFJSDFTdW83OWpweGoxU0Nu?=
 =?utf-8?B?MFdPcUR5ZktmdXVwOXVEb2hvQWtoYU5RWHZub1g4V0k3WVA4eTZxcjBuTW5P?=
 =?utf-8?B?ZU5yQnB5NDRGcGYrelNrUE9mMmRyUFVtSm1EendkdUhqWTluRVdZK0dyd0wz?=
 =?utf-8?B?WXg1ZGRJMUgvWEZUSjhHLzkzNDFSbHVCWFR1UjhBaC85KzZxM3YxWVVSczJR?=
 =?utf-8?B?YnorZkhOTUxvRlpPQ3hYTEhiMExQejA0R0F1ZXBiQldZYUxnb3lWL1o2NGtq?=
 =?utf-8?B?bTV2TFNaVmtwcFZKb1ZYMGZ4bUhXcTBOSTgrYUhGYXRyRk1qZ2NUenNLL1ow?=
 =?utf-8?B?NzFOZUVEUkpvdHZYQXQyN0hESzdmYjhxTFJPVE8zQkQvcmVYQ3ZSYU5oWUxD?=
 =?utf-8?Q?rfW8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5144.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c633037c-7b81-49ea-58c3-08ddb589c396
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2025 14:49:05.2514 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VjpL7v4QBYGhptOh8hBOht/2wMz5lgUvMD0HbZMHAbI3LRN76jlpPjW6wxvstq5hPIlhX25DoZQfHEWfYyS9TA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7019
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

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBsb25nLnl1
bmppYW5AenRlLmNvbS5jbiA8bG9uZy55dW5qaWFuQHp0ZS5jb20uY24+DQo+IFNlbnQ6IEZyaWRh
eSwgSnVuZSAyMCwgMjAyNSAxMToyOCBQTQ0KPiBUbzogV2VudGxhbmQsIEhhcnJ5IDxIYXJyeS5X
ZW50bGFuZEBhbWQuY29tPg0KPiBDYzogTGksIFN1biBwZW5nIChMZW8pIDxTdW5wZW5nLkxpQGFt
ZC5jb20+OyBzaXF1ZWlyYUBpZ2FsaWEuY29tOyBEZXVjaGVyLA0KPiBBbGV4YW5kZXIgPEFsZXhh
bmRlci5EZXVjaGVyQGFtZC5jb20+OyBLb2VuaWcsIENocmlzdGlhbg0KPiA8Q2hyaXN0aWFuLktv
ZW5pZ0BhbWQuY29tPjsgYWlybGllZEBnbWFpbC5jb207IHNpbW9uYUBmZndsbC5jaDsNCj4gZmFu
Zy55dW1lbmdAenRlLmNvbS5jbjsgYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGRyaS0N
Cj4gZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwu
b3JnOyBtb3UueWlAenRlLmNvbS5jbjsNCj4geHUubGlmZW5nMUB6dGUuY29tLmNuOyBvdXlhbmcu
bWFvY2h1bkB6dGUuY29tLmNuDQo+IFN1YmplY3Q6IFtQQVRDSF0gZHJtL2FtZC9kaXNwbGF5OiBV
c2Ugc3RyX29uX29mZigpIGhlbHBlcg0KPg0KPiBGcm9tOiBZdW1lbmcgRmFuZyA8ZmFuZy55dW1l
bmdAenRlLmNvbS5jbj4NCj4NCj4gUmVtb3ZlIGhhcmQtY29kZWQgc3RyaW5ncyBieSB1c2luZyB0
aGUgc3RyX29uX29mZigpIGhlbHBlci4NCg0KSSBwZXJzb25hbGx5IGZpbmQgdGhhdCB0aGVzZSBo
ZWxwZXJzIGh1cnQgcmVhZGFiaWxpdHkuDQoNCkFsZXgNCg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBZ
dW1lbmcgRmFuZyA8ZmFuZy55dW1lbmdAenRlLmNvbS5jbj4NCj4gLS0tDQo+ICBkcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvZGMvcGcvZGNuMzUvZGNuMzVfcGdfY250bC5jIHwgMyArKy0NCj4g
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4NCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9wZy9kY24zNS9kY24zNV9w
Z19jbnRsLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvcGcvZGNuMzUvZGNu
MzVfcGdfY250bC5jDQo+IGluZGV4IGFmMjFjMGEyN2Y4Ni4uNTA5YmRiMWNhOWJjIDEwMDY0NA0K
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvcGcvZGNuMzUvZGNuMzVfcGdf
Y250bC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9wZy9kY24zNS9k
Y24zNV9wZ19jbnRsLmMNCj4gQEAgLTI0LDYgKzI0LDcgQEANCj4gICAqDQo+ICAgKi8NCj4NCj4g
KyNpbmNsdWRlIDxsaW51eC9zdHJpbmdfY2hvaWNlcy5oPg0KPiAgI2luY2x1ZGUgInJlZ19oZWxw
ZXIuaCINCj4gICNpbmNsdWRlICJjb3JlX3R5cGVzLmgiDQo+ICAjaW5jbHVkZSAiZGNuMzVfcGdf
Y250bC5oIg0KPiBAQCAtMjM2LDcgKzIzNyw3IEBAIHZvaWQgcGdfY250bDM1X2h1YnBfZHBwX3Bn
X2NvbnRyb2woc3RydWN0IHBnX2NudGwNCj4gKnBnX2NudGwsIHVuc2lnbmVkIGludCBodWJwX2Rw
DQo+ICAgICAgIH0NCj4NCj4gICAgICAgRENfTE9HX0RFQlVHKCJIVUJQIERQUCBpbnN0YW5jZSAl
ZCwgcG93ZXIgJXMiLCBodWJwX2RwcF9pbnN0LA0KPiAtICAgICAgICAgICAgIHBvd2VyX29uID8g
Ik9OIiA6ICJPRkYiKTsNCj4gKyAgICAgICAgICAgICBzdHJfb25fb2ZmKHBvd2VyX29uKSk7DQo+
DQo+ICAgICAgIGlmIChodWJwX2RwcF9pbnN0IDwgTUFYX1BJUEVTKSB7DQo+ICAgICAgICAgICAg
ICAgcGdfY250bC0+cGdfcGlwZV9yZXNfZW5hYmxlW1BHX0hVQlBdW2h1YnBfZHBwX2luc3RdID0N
Cj4gcG93ZXJfb247DQo+IC0tDQo+IDIuMjUuMQ0K
