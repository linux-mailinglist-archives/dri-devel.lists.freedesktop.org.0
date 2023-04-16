Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D27856E3A14
	for <lists+dri-devel@lfdr.de>; Sun, 16 Apr 2023 18:03:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDC4910E267;
	Sun, 16 Apr 2023 16:03:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2107.outbound.protection.outlook.com [40.107.8.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FEB510E267
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Apr 2023 16:03:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B8qfKh+UYq2QK+quq+hP3ui/FTmTICkFQEyIxNYTl8uAm6KiY9sSXZPytXtdxWCaZqfoAGiA5yqZrKNX1eLLMNOndOltyg2tGSD/88TJvXHJWjij4o5j7RKYusRGZkkiY+Jv+Dsl4LK9kRgYqTIH8stZO0obVtvhtVBA16/ZVFw6bSbuvO0m7mkY+I5oxAqAiAHZSi+jC/8u1NCDh8GybdtuMn1fcUMURoF1/OljzCK0N0uI9OIyD2elLQ2dKzJFrGRc+CJt1w7lNtu12pG/16Hf7q+7eHPaNg3ewoKIAGLA9pydce102AfIxeEWNsZwu6AJfbmc01Zz6gFT7CB6Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XENjkO9tK0OesjzMWGIqyI2/WGFCFIdZZGGlgegI5oE=;
 b=gXOybwWd3bY993pryqWzkqk1dLNggxLrIQDjUitqVTHNbnRYBkfjqUXxk1hKipSbxzUJGtFXccx+K2OuF8H4N1mE1vAg+2GN2bvt97g6IhtzP/I5RGfqREGei6tH/II8yaHIsZxxl76kJ7stUkST893Jv47rzOfpSqqQJausc+j8+MADxpedeFxyCjJ4KDQ9snA3+CAzmTIBCLL+L5PvWQ8bkhq4Exc7Qktm5WFSXVnMXHvFJsw9jMyLel7lR/0qxyVtOh8wq4DegN5RGEutsdzTxWTqtkqhIjdgkqfUiVzXOqY5PA9jOZ9+iK3ndH0nLwqCWxko1E3ORt5dakv59A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=habana.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XENjkO9tK0OesjzMWGIqyI2/WGFCFIdZZGGlgegI5oE=;
 b=m88vrU0maGJY8+GB8bqrTzCeqJn/NWg/hanlPPn07hCVW0r1rw5ku20QeUeD4xxYzTs2v3Dclwo1P1ISls1+F6EfGD9PQ6e1s6cusxwBw98t0DuTuUIdfljB55dQ6sjBcK8bsecth2iRvDihWjwoPe3Cvr2mx6fWKoXBd3izKMMLc0UGW2DO5UNeExnWYD0Lr4UGL9hFfTGxwBrUT3eHu9Pr0g7B99aOPr/rhIYyJhdVN/KTdJRSeCWYY0Fv74KeQcMqel5YKaDGKh+4RyJ/expZeGABqpdFOjecspobw+lfxfFTOL38UgpkPzrKoR4Wy7d0c0JHbd2dEGIh66LkZQ==
Received: from DU2PR02MB7573.eurprd02.prod.outlook.com (2603:10a6:10:2d8::6)
 by DB3PR0202MB9249.eurprd02.prod.outlook.com (2603:10a6:10:429::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Sun, 16 Apr
 2023 16:03:14 +0000
Received: from DU2PR02MB7573.eurprd02.prod.outlook.com
 ([fe80::f04b:e404:488b:2352]) by DU2PR02MB7573.eurprd02.prod.outlook.com
 ([fe80::f04b:e404:488b:2352%5]) with mapi id 15.20.6298.045; Sun, 16 Apr 2023
 16:03:14 +0000
From: Tomer Tayar <ttayar@habana.ai>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <ckoenig.leichtzumerken@gmail.com>,
 "mcanal@igalia.com" <mcanal@igalia.com>, "stanislaw.gruszka@linux.intel.com"
 <stanislaw.gruszka@linux.intel.com>, "ogabbay@kernel.org"
 <ogabbay@kernel.org>, "quic_jhugo@quicinc.com" <quic_jhugo@quicinc.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "jani.nikula@linux.intel.com"
 <jani.nikula@linux.intel.com>, "mwen@igalia.com" <mwen@igalia.com>,
 "maxime@cerno.tech" <maxime@cerno.tech>, "wambui.karugax@gmail.com"
 <wambui.karugax@gmail.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 2/5] drm/debugfs: rework debugfs directory creation v3
Thread-Topic: [PATCH 2/5] drm/debugfs: rework debugfs directory creation v3
Thread-Index: AQHZbU5oXr1yrg7yOE6tocVdbV3lR68uH0iA
Date: Sun, 16 Apr 2023 16:03:14 +0000
Message-ID: <e0803bcf-c447-ad8d-bd1d-af8658cc72c4@habana.ai>
References: <20230412145206.2483-1-christian.koenig@amd.com>
 <20230412145206.2483-3-christian.koenig@amd.com>
In-Reply-To: <20230412145206.2483-3-christian.koenig@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=habana.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU2PR02MB7573:EE_|DB3PR0202MB9249:EE_
x-ms-office365-filtering-correlation-id: dded9bd0-128b-4012-2b72-08db3e9415b4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: N2wUMimqW89hGk2rs/IPTD14x7755LFXtzSWI2TWJpzej7qEGV9jimB/+xC0AHREuwMG+yS4qUf+Gn9Q6K9VzENP6k/OUao7p3ivXWBEmK2sjs4qRiJhNDJmgj1zhtlFoyA77XfV/8gR4bD3hzCeadRG9mo27FCUgIKZdmTDL6HVs4bs9J75XSiPYQeRgRCmFUOoiZVWdNd/afNVe7m/HpgnvbMpX/ZhB9gl1sr3njyEpTeK4hwClnvVsIZux7d16X6k6Vwj2CRThRsyQCneBuUMZuca1l88eLcw2UhjR0q4takwnswDUGwL5yQmvp8TRjH1jEKH8WVQchRJFJenVOjlUvVZDpbtwxfecqtZgEeyNji6WBdEfuI4UzBtg8uDEvOZJTiPUWibgE+BygeJCxqLv1iX2S8nxi6t+Nht6CAK4B6FX8gzh8reTdOIgrQwgF664/YW7OQQVunvDOvhwrpzj2eqpP065GGLa/U1i/NM9Vmrruo43JaFIEC/0WzujQ99bdY9uRVJori0TiAn2dkjh2xrfjFGR+QSuH0o8dA8f52cXEC4KIJxXzq2X2qeitA4cxbnEQHeZGKLn/7cBWoQQghhXH/OacS/3LZ6zgGinPieu50jeZfHED+WuTQSuZp0hRSo0MPZ6sAi0udSsLSs6fOuKEoqR0KREYj9w8GdDNYXjpbrKgbQFUK0MPbNLNKEuL22gsXMjMGsjrinSw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR02MB7573.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(136003)(396003)(39840400004)(346002)(366004)(451199021)(31686004)(31696002)(122000001)(921005)(38100700002)(5660300002)(36756003)(7416002)(38070700005)(2906002)(8676002)(8936002)(316002)(86362001)(66556008)(82960400001)(64756008)(66446008)(41300700001)(53546011)(66476007)(66946007)(91956017)(2616005)(76116006)(6512007)(186003)(110136005)(478600001)(26005)(6506007)(6486002)(71200400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MHBSbjY0Y0twMEtxY0p3ZEJESWV4ZmN4OGUwdFp3OTBRK3I2dW8xZ3FTdEVh?=
 =?utf-8?B?cXl1d2ZoM0hsL0RHQTNzMzhZNVIxajNHSnVQdy9LZk1kZy8xZUhPdzJ4QXRB?=
 =?utf-8?B?S1o2YmFHR0EvVGZNdDZMNHcrTHFiOEhOellLYzM4N3J3WmsyOHB4dGZyU1dN?=
 =?utf-8?B?OTJwR3ZqdDFkNFptcnBkNUtJSkswV0NhVWxWdzV1OERyYXhGaDEySlBHTEJm?=
 =?utf-8?B?cmhOcm1CUDZtdjlhamw2NVh3bkphYWltelc2MEd5NEN1blplWUlxbFhqT2V6?=
 =?utf-8?B?V2xnenpTaDJGTWdPSnFQS0tOWWdsK3RUaGNKNGllYjJBZ01tazl6NFZNYmh3?=
 =?utf-8?B?NUt2NTFiankwYjBuOWM5ZXJVc2NaVTl3a3hRM0U3LzRpbVpQbXhHeEhZTEtT?=
 =?utf-8?B?Y2taeGs1akRFVEFkeW9SKzZ1Z1JuanRDUzVrODZYbnUxaUgxK1EwRnJmS2dQ?=
 =?utf-8?B?ZFZlWmJpOXdhRnJxMS84aXNFY0gvSDRuaE82Qm92N1Q0bXN0cFRvbFc1cXZD?=
 =?utf-8?B?Q2ZpVEswSitPSDBQUGR6UFNrR2lUTkQ5czljakwwYkJJaC94TldMeGVLOW5I?=
 =?utf-8?B?QXc0dldGeGs0QlI0dFRLNkNKaWVKUjRzRVNZZUlpdmNjNWJNdFpmdVMyWEpJ?=
 =?utf-8?B?czNhd1dEdldGTEhzRSt4K1lJSXRRR1h1QlEwWDZoNnppK3ZPdEV5ai81bjU1?=
 =?utf-8?B?WUg3eHRPclBucVh4b1hRUGxDNHM2SmgyeGQxKzNVMjNqdTJJQlNxc3M5ZVhJ?=
 =?utf-8?B?ZnhEaWZjK2JiZEd2V0laM1ZJbGVlKy9FdWNrSXQ1cXNKS0IyakxHaGNWSFVr?=
 =?utf-8?B?NzNQTzJCUmtkaDdLNE95dnp3WmVseHhrOVl2b1IwVEpBeS8vV01iUkRPQWhK?=
 =?utf-8?B?Y01vd0JXUFNpWTl1NjVkMnJHbHZpVjVkc0Z0OFNtNDd6dnZtUnZGREFSR2tq?=
 =?utf-8?B?RHNmSmYrbFBScS9sWk9Ob2JjdC9WTkFtSEtZZHJ4WWFmdnJZbG5naUlzMTFl?=
 =?utf-8?B?eHBVL3F4SExRdWJnMjFLNkhoNno3WVRvYkFwN3hIMUszL1loUzdERE1mZjNv?=
 =?utf-8?B?Qm1kTm16VVNHV1NPL2Ruc0ZsMTBkUFRKYitsNVFpOW5adGZzdi9QQVkySEFR?=
 =?utf-8?B?d1hsS2VGZE1TWURKNmt1VzdkRkJKME9nQjd4aHE1TkR3ZjRiZDFWN1B0QzRi?=
 =?utf-8?B?dDkzbnUvaW56VWpXN05ia2pkd1ZBZHJBczFHUDF0Y1Rnak5vUmZILzVNOGE4?=
 =?utf-8?B?UnBuMkg4czFBMmViK0RuMGhnSTBWcUp4YU1RWmNKcnlhNGxlMERCZmJncm5S?=
 =?utf-8?B?bWZlWWFsSW9sQnE1RE1EbnRISVcxOVhtRjd3SlVheGowM2lkRjRpUGFXb21C?=
 =?utf-8?B?V3d3dTE1ZWFDQTBIdTBvdlFNSDNIcXI1T2JkeTdqVnIvbmlXTDJZdmVtN2Ru?=
 =?utf-8?B?SVk4elN4NmxFTG0ybGFKMm5mU3RJTXRsZW51cWJKU3hJTm42dkNjN3h3MTRH?=
 =?utf-8?B?aHZtWDY4M0NxZFlpc1U4clZlTzhud0J6eHB2UGR4ZnRzSXUwRURrN2gwb0Fr?=
 =?utf-8?B?ckZzS1RBY3A4R1ZWVW53TWNjekNlWllZTkJoWk5zYmxHdm9RWUsrdUpJZjVN?=
 =?utf-8?B?c0N1MEtEem53U0dPN1lHWGdGNitJMzBCNWNpckY0ZVRDOGZBL0h0N29BZ0RE?=
 =?utf-8?B?M0QxQWg4c3grNlZzK0V2Nnhib20wUTFYSm5yRWlqVWR3RXRqaEZpL2d2VVB4?=
 =?utf-8?B?SlFhaTNrV1E5Njh5Z0RBdTF4UHd4QlFiRjQyVXIrZWthS214MFdmdXo1RXM4?=
 =?utf-8?B?V3pOc1dhRjZ6dnhldTRpNkI0TnFLcXZRd1FJalFpSW1zTUdoWTNaRU9LNG5P?=
 =?utf-8?B?TWlrcisyeHhjNWNhMS9ONThRRXBuWDlhb21mQk5mYlFITXFFYkpqQk5DQUpT?=
 =?utf-8?B?RXdCWmhNUlE2TkdYSFY2dmFOeW80cGVBaGhQQWVKV0I4KzM5b29tMjZiSW5a?=
 =?utf-8?B?U0dYUE9uMU0yQmtCK2Y2Vk9qeTBiT1dxT250S2hVVHZKVjNSdUpjV0QyLzRm?=
 =?utf-8?B?eU9PdUZJQUdXd3R6Ly92TTJ5MlkrMFU2Z3JzVHhlT2JJTXN2eEZ6NzBobXlB?=
 =?utf-8?Q?rzrQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1527E9B886AEB14680D437CC6BB0C1A1@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU2PR02MB7573.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dded9bd0-128b-4012-2b72-08db3e9415b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2023 16:03:14.3011 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YNnXTMOgO7IHtO1ecZJU4hhVPfXvmmlo70v/RFWJJN6ugmUruLkhLI3Df+oc+BPR6ObWLLXLugeGVgnR6O9B9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB9249
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

T24gMTIvMDQvMjAyMyAxNzo1MiwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToNCj4gICAvKioNCj4g
LSAqIGFjY2VsX2RlYnVnZnNfaW5pdCgpIC0gSW5pdGlhbGl6ZSBkZWJ1Z2ZzIGZvciBhY2NlbCBt
aW5vcg0KPiArICogYWNjZWxfZGVidWdmc19pbml0KCkgLSBSZWdpc3RlciBkZWJ1Z2ZzIGZvciBh
Y2NlbCBtaW5vcg0KPiArICogQGRldjogUG9pbnRlciB0byB0aGUgZGV2aWNlIGluc3RhbmNlLg0K
PiArICoNCj4gKyAqIFRoaXMgZnVuY3Rpb24gY3JlYXRlcyBhIHJvb3QgZGlyZWN0b3J5IGZvciB0
aGUgZGV2aWNlIGluIGRlYnVnZnMuDQo+ICsgKi8NCj4gK3ZvaWQgYWNjZWxfZGVidWdmc19pbml0
KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpDQo+ICt7DQo+ICsJZHJtX2RlYnVnZnNfZGV2X2luaXQo
ZGV2LCBhY2NlbF9kZWJ1Z2ZzX3Jvb3QpOw0KPiArfQ0KPiArDQo+ICsvKioNCj4gKyAqIGFjY2Vs
X2RlYnVnZnNfcmVnaXN0ZXIoKSAtIFJlZ2lzdGVyIGRlYnVnZnMgZm9yIGRldmljZQ0KPiAgICAq
IEBtaW5vcjogUG9pbnRlciB0byB0aGUgZHJtX21pbm9yIGluc3RhbmNlLg0KPiAgICAqIEBtaW5v
cl9pZDogVGhlIG1pbm9yJ3MgaWQNCj4gICAgKg0KPiAtICogVGhpcyBmdW5jdGlvbiBpbml0aWFs
aXplcyB0aGUgZHJtIG1pbm9yJ3MgZGVidWdmcyBtZW1iZXJzIGFuZCBjcmVhdGVzDQo+IC0gKiBh
IHJvb3QgZGlyZWN0b3J5IGZvciB0aGUgbWlub3IgaW4gZGVidWdmcy4gSXQgYWxzbyBjcmVhdGVz
IGNvbW1vbiBmaWxlcw0KPiAtICogZm9yIGFjY2VsZXJhdG9ycyBhbmQgY2FsbHMgdGhlIGRyaXZl
cidzIGRlYnVnZnMgaW5pdCBjYWxsYmFjay4NCj4gKyAqIENyZWF0ZXMgY29tbW9uIGZpbGVzIGZv
ciBhY2NlbGVyYXRvcnMuDQo+ICAgICovDQo+IC12b2lkIGFjY2VsX2RlYnVnZnNfaW5pdChzdHJ1
Y3QgZHJtX21pbm9yICptaW5vciwgaW50IG1pbm9yX2lkKQ0KPiArdm9pZCBhY2NlbF9kZWJ1Z2Zz
X3JlZ2lzdGVyKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpDQo+ICAgew0KDQpNYXliZSB0aGUgYWNj
ZWxfZGVidWdmc19pbml0KCkgZGVzY3JpcHRpb24gc2hvdWxkIG5vdyBiZSAiSW5pdGlhbGl6ZSAN
CmRlYnVnZnMgZm9yIGRldmljZSI/DQo=
