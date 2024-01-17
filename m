Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B8882FEB3
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jan 2024 03:02:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3736010E56C;
	Wed, 17 Jan 2024 02:02:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AF8810E356
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jan 2024 02:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1705456930; x=1736992930;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=9E5D+kmBh4Kp5ZzIbSmAgTx1aTED9kFanZ8wfTORyHk=;
 b=cEVQgMovhtQ7NmX7WM0r6OSSYAYjMCd1p3AjydymF2F0Lr278ohUrAQV
 aJv+q9aRCAQHhmiPDwC66npAlMTlvm4oAR6y3/4F9wTQpd4dSIHQtkgFe
 UFnQQywlcYXEP8JhMssVO8FEP49ATEsEd9zQOXDsfHe2F7k/Yn1CSEpg/
 XrcRSDXo4JQEz+qL/hXCUasYmFuJn5uOi1HOOS6OfknJbfOULkH4grc+b
 vWI6l2DqoIy+cBJzTsgcRr9DLC3A5SMU2saLHsjUnvtYtJ/O207Rl+3+A
 TMb0pTC1ntLFD534cx8RWRTHd6Thr4duvEh9mE76cs3XJcYOnIn9ZEaqK g==;
X-CSE-ConnectionGUID: jDusnun6SESmP0wdD46erg==
X-CSE-MsgGUID: w7x0mO73R7eJ8IpECeOpnw==
X-IronPort-AV: E=Sophos;i="6.05,200,1701154800"; d="scan'208";a="14839039"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Jan 2024 19:02:05 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Jan 2024 19:02:02 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.250)
 by email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 16 Jan 2024 19:02:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FonQbFUH1qDyqueMKzTYPFVh36H280gCn5stkCC2SZwMvLMc63JzkNOH0n6nfsQoo2rFw4ghmNPesKBpeP8HR6zJ4S5KkRgTus9qL7LaeRvvIjPIy/wgV1Zw+DBP4Z/pGrB9Dt9dAXuzmkwRf41hAlvx2ldckexKBitj0qUheBEWVqiWQPWPjmUbFhVRE76SDZTuAvCFbNhhTUz6UIv52CgJJF04uXrQLQj7qCjtAuA3fazKHnT7ce4P6aZ8Nx0B+mcDAIsmg7ueWtyM59ATLl0ShC4Z7pNZga4XTcXbOgh/N+bxpkvaiRNxDenaMLgYCG487twi1mvl9r5QKktL+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9E5D+kmBh4Kp5ZzIbSmAgTx1aTED9kFanZ8wfTORyHk=;
 b=EEP5TNx0Aavm6FUTaNbyHRrCDa/epPv0P/cJtu0UFocQObPTsBl+TpaPNemeySBim/6fcOjF/HD0G1WNgLa3A+BMDF8QKtRdmlofdvwYIoYJn9OHhCVrEgY79dliaSDe2oNxX/M0/MfWWVfwBimiPFsxjtk5ur9UZWuVWinSK3hWs28oHnAkDwFUeHbTNf3QnZH98BOk6Bt6WGrfFxQU6qrsktaYEc010HZw44vwjz/NZRgt29iUWU/dhcbbX9jowhmqLX5lZNm0qPeGBmpKMqgD+BaWAk9yx+l4jZW2zPqrc0pTYDq+RQDI51JoXVx7hQJJQk9m6dHKFcoUSAyFrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9E5D+kmBh4Kp5ZzIbSmAgTx1aTED9kFanZ8wfTORyHk=;
 b=nsFbMNGkMUYnPI9fk0pck9Zw6Y35l8aF8WZU/r3YCnwNGhebfP9fL6fRIxrnPkNQUQ4uH2RUIinWlGwJU5gaXVUDQwke9NDR8pc6oxE5GtndVFiaowyyL2MIRQCqnUeAzADXqRXoKiYBA3QAKCGmDAIEIAO4KMZaxm4iR/LiXn8GSvkq9KknbXgsFUd6B7ZVbrydvOaV3cWqukCl0EW/+HbqHbHWHeTSye1nrWTEUeVK7AziaWFL0ofUzVQoBatH1JZ2CA/u4a5d+hhxX0t+4HM7kDkTp/BCG48SRQvvWw9cRA0Pmy7u/3ehHAldGk9vAN4RpggY/xYVE8DKrTViwQ==
Received: from BL3PR11MB6436.namprd11.prod.outlook.com (2603:10b6:208:3bc::11)
 by PH0PR11MB4821.namprd11.prod.outlook.com (2603:10b6:510:34::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.23; Wed, 17 Jan
 2024 02:01:59 +0000
Received: from BL3PR11MB6436.namprd11.prod.outlook.com
 ([fe80::96fe:b914:e84a:73fc]) by BL3PR11MB6436.namprd11.prod.outlook.com
 ([fe80::96fe:b914:e84a:73fc%6]) with mapi id 15.20.7181.027; Wed, 17 Jan 2024
 02:01:59 +0000
From: <Dharma.B@microchip.com>
To: <robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: display: convert Atmel's HLCDC to DT
 schema
Thread-Topic: [PATCH 1/3] dt-bindings: display: convert Atmel's HLCDC to DT
 schema
Thread-Index: AQHaQ6+BkMWRIT/cyky30UWqcbtbOLDS8ReAgApZ2AA=
Date: Wed, 17 Jan 2024 02:01:59 +0000
Message-ID: <d68dec86-8c33-4876-b95e-df0f4ad16f9c@microchip.com>
References: <20240110102535.246177-1-dharma.b@microchip.com>
 <20240110102535.246177-2-dharma.b@microchip.com>
 <170488786892.942140.9840992468910708150.robh@kernel.org>
In-Reply-To: <170488786892.942140.9840992468910708150.robh@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR11MB6436:EE_|PH0PR11MB4821:EE_
x-ms-office365-filtering-correlation-id: a0bcfcb9-d0f8-4216-f37d-08dc17004a3e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AIY/3zWehsyfhazYuLZcAKX8T+ROcKEwhxDFMZyN+Nu/pjLTmqb9WOIeRVX8iVRMZc6wSlSzIjgse4Qot6MEXSpDKT+PymJr+QKOmiqqScZciTxtC+I/i7jh7Fi7FY7oGh2saZMdSkoUFKdicqS4pl7zFFxQrcZpHJj+jGEWlVHUyiGChcrrYN0bz9H5/E+RobA6XtygeArQF22aRhpxtFParQUosBOK1fj3poXWIpvX1xyNIWooATu3lIOKocQU1u8o+jMl0ZIJ1/apaSm9KM/3sl/ifujYL55WeRD1S90M2KE3gfmA9Cs7G28xsPBHb3lgKn/yeyZE1sdWf430zc0X6JHWC4SuQcaWhNn59QqVV8mhU84KagxiLwXxdoJ9rh1NcrvhayqSnhdJW21jqihSZ4Clpj/Jvn6q9XGSXyOgo97X54ZXHQEBHWOxyngwid+hQPziNSaquQn9g+rFiZnItZVUVT3M9vhWSYC7S3RVHBEAsM+fgRPW5QcjPXigGOtRwCSI9nILy1ok5nwM/ivH8gWdHDL1hcNEWx//TkA0p7lkVhS80OgNEJkVvT5JigYdcFuJSTF1wwucTB2TnQoCKFtvbtZpqI0Cghs4ZMfCVIMYIDFLQlZ63WOVOFXnL+waArXxJF0PhEQR1oVWkWl/KkJUsPCQNNcEupFntkwOAFRq4PD4fXlp6qghn6y1
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6436.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(39860400002)(136003)(366004)(376002)(230173577357003)(230273577357003)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(38070700009)(31686004)(53546011)(66556008)(6506007)(83380400001)(64756008)(6916009)(54906003)(6512007)(66446008)(6486002)(966005)(316002)(66476007)(478600001)(66946007)(2616005)(76116006)(91956017)(26005)(71200400001)(4326008)(8676002)(8936002)(122000001)(7416002)(2906002)(5660300002)(41300700001)(36756003)(86362001)(31696002)(38100700002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RXBQV0FRTXI2dVNLRFhZcWw4dllGaC9heTRZbXZ3TG9CekRoT3lDNHg2a0hw?=
 =?utf-8?B?K3Y2d2ZMRmYyWXpNYzBPVml4NzVnOExRN2ZSaGk5RC85SEF5VGtpTi9jcnh6?=
 =?utf-8?B?TlVaUVFINjB2bUlObWsvcmlrcDJ3RmdJbmNIQ0VnYnhFS2pIOE42SllZejg3?=
 =?utf-8?B?N1FtWUl3Z1U4TWhpWHhvS2tjaUwwNUpUQVFBQVRnNlhUQ3FTNUxSSTI4dVd6?=
 =?utf-8?B?dFJRcXR5bjFvK1Z6ZDQ3dWZ0eTl0UXFWdUZrcm9oYjNtbTMyZCtXcmdjakd1?=
 =?utf-8?B?cHoyT2JjR1lzOG9pQnVzYzFrQVhxMzQyYzkwWmN2Wmc3N2trQTJOeUhKTXY3?=
 =?utf-8?B?MzBvaHNQdWcrbE1xYTdvZlNGc3NvVHVHS2txRFBaRHIrdEpjWUluTjJ3V3VI?=
 =?utf-8?B?UHcyTDdZc0dUK3FuRUVOa2lDRmZVNytZQ0dxaTVhYjB1NTFUS0ZpUHFhUjdi?=
 =?utf-8?B?dEJPSkw3YkpLSzI1dk4vaGZxK0NHOXhiYWRMZy8vb1o0VXdkMDBVVTdiVmcw?=
 =?utf-8?B?dDFrNVFwd1VnaEJoWUtja2pDdFhUMFZEUzNpdEw4TEVIZzdGV0w2Mkc2S2FB?=
 =?utf-8?B?cWcwMm4wbzl6R3JtMVZ3QkpDb0phQzRpM3oxWkNMU2MzRmRzbUNxNk5aS3NY?=
 =?utf-8?B?bUNFM3ZDak1Cb20xVVlLaDVodTJxYTNHbWFYU3doL2FqSjk0VXQ2Rm42N3Mx?=
 =?utf-8?B?WGl4SElQa1lNcUZUQW4wM2pxYnFINEk3WngyYmg5NmpPQXBISHhPVHdzUHpU?=
 =?utf-8?B?YlJZdURhanp2ZWtGTENXeUxOakRWdGVzU1kvM2lhNVVnT0NCcU0zN20wVEY3?=
 =?utf-8?B?Q1Y5UG9mb2JGYWRnOVRPWi9zdUQ1UVpKR3ZaMEZXQWorZk9XbWU1VlJxdEUz?=
 =?utf-8?B?VUcyM1lmVXpZUFNxazFBSDJxcDJNbld2Tmd0K2J4TWJXRFZza0xOMVpuTHRU?=
 =?utf-8?B?UEh6TjJyNkNpczB3aDNMOVpsdnNYa1ZsalhOUVVJUFhRcWxoV3UvYWZtblFM?=
 =?utf-8?B?My9Nb2dnWGNHYWJqeVQ2Yk1kNzlTSnloZjZUL21OVTB0SU1MRnRkaTZrYlVH?=
 =?utf-8?B?MmlOcjdWUjBJdWkyZ2FuMEFtbEJiN2FGMjl3RitvT1J2dGg1d1hkMS95VHRh?=
 =?utf-8?B?L3ZuUVF0R2NJWFVuLzhNMHhZLzFBK3N4bEtvMlNGcS9GSis0YlNFOUptS2w4?=
 =?utf-8?B?c3lDbWJGMFA3ZVRzVTJFLzcxT1VCN1QydTJXKzRwUmhnelc3SkdqQWxJczhs?=
 =?utf-8?B?dWY2cTIrQVFWam9qa3NLdTZJeG8ybStNcWtJWmhrKzRpa0RpUnVTTUZjc2xv?=
 =?utf-8?B?WWFvNzU0NlVmMk93cTZlay91R3VTdFpuUVVqS1pPdVZZM2IrVG4wVWhCVVhr?=
 =?utf-8?B?eVFGYWFwSlA1ZWZJOHJ4NUM4VUVCZHhXRWNRSzl3NThGTzJJOTNtaU11UTNo?=
 =?utf-8?B?UWlyZkZVS1ZudlB1SXpxZ1A5SDFhM2xIWk5EMEJMRlluVlhBZ01GZkkrZVdt?=
 =?utf-8?B?SFRkOHNIRnpDaDZGSkxBdU9wRmdxR3ptVUhoU1FwUGxrQU4wQlg3SXF5VHZE?=
 =?utf-8?B?cytONEg2UmI1em1OL0xTNWxxWXdaZkhlQ2VlbWpMQWdRd2NNY0VrU081dWZa?=
 =?utf-8?B?K0ZoOVlEUjQ0NHFScGVpRExTWXBXZnEwMHc1ejBjRG9MTS9pQkZYVFRUREV4?=
 =?utf-8?B?YjZIVThHSzZWaXRFbkwrNlQ3OGJ2TFFoeUhUWTFSSWxnejZaWTR6UTUwOG9M?=
 =?utf-8?B?YWpjaDMwMjBvOUV6VHh2enIvKzkrNW9XNjl1cEtQN2swSzJpYUhsRWJ6OGkv?=
 =?utf-8?B?K1dQdGlSQXVoQktpRWpGQ01lL3pHQVdLMDhVODV1aXBMS3VwQVFHdjBxM0JS?=
 =?utf-8?B?eTdqdmppd3FOM1JsdDF6d3RPRVlwOThRMVIzcjdBTW5UUURwbFg1bGRBdHUy?=
 =?utf-8?B?eDR4ZUhLWnZzcTJ5bS9seDd4bjEyNkxUdytLS1NNREdQZmhrSjRuMnhsTTdI?=
 =?utf-8?B?UnE3ZU1KWE1sT2l2bTlaVVZTOG45dmhYS2Q5WXU5ZkpkQ1dma3hFZC9hb2pW?=
 =?utf-8?B?RXpwSTZDcUxxcHk4a1VKZjlaTFpQM2xzUm13MVpGUC8wa0FsbFBxcGFSZndU?=
 =?utf-8?Q?hQxwnmCAF4OnE1nAUjnyejLO6?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <13F79C04D3E10F4CB99CDD6D2531E864@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6436.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0bcfcb9-d0f8-4216-f37d-08dc17004a3e
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2024 02:01:59.2614 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tRKP63xJsKJp2zRa0Xif+HKYmCPepPyuI1QAl4rHcfRecZ2lWpxZjVuFar9DbDaJ2xgyj9rQ87TgqXvutKQ82Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4821
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
Cc: thierry.reding@gmail.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 linux-kernel@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 alexandre.belloni@bootlin.com, bbrezillon@kernel.org, sam@ravnborg.org,
 lee@kernel.org, Nicolas.Ferre@microchip.com, dri-devel@lists.freedesktop.org,
 claudiu.beznea@tuxon.dev, robh+dt@kernel.org, linux-pwm@vger.kernel.org,
 mripard@kernel.org, tzimmermann@suse.de, u.kleine-koenig@pengutronix.de,
 daniel@ffwll.ch, airlied@gmail.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUm9iLA0KT24gMTAvMDEvMjQgNToyNyBwbSwgUm9iIEhlcnJpbmcgd3JvdGU6DQo+IEVYVEVS
TkFMIEVNQUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3Mg
eW91IGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZQ0KPiANCj4gT24gV2VkLCAxMCBKYW4gMjAyNCAx
NTo1NTozMyArMDUzMCwgRGhhcm1hIEJhbGFzdWJpcmFtYW5pIHdyb3RlOg0KPj4gQ29udmVydCB0
aGUgZXhpc3RpbmcgRFQgYmluZGluZyB0byBEVCBzY2hlbWEgb2YgdGhlIEF0bWVsJ3MgSExDREMg
ZGlzcGxheQ0KPj4gY29udHJvbGxlci4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBEaGFybWEgQmFs
YXN1YmlyYW1hbmkgPGRoYXJtYS5iQG1pY3JvY2hpcC5jb20+DQo+PiAtLS0NCj4+ICAgLi4uL2Rp
c3BsYXkvYXRtZWwvYXRtZWwsaGxjZGMtZGMueWFtbCAgICAgICAgIHwgMTMzICsrKysrKysrKysr
KysrKysrKw0KPj4gICAuLi4vYmluZGluZ3MvZGlzcGxheS9hdG1lbC9obGNkYy1kYy50eHQgICAg
ICAgfCAgNzUgLS0tLS0tLS0tLQ0KPj4gICAyIGZpbGVzIGNoYW5nZWQsIDEzMyBpbnNlcnRpb25z
KCspLCA3NSBkZWxldGlvbnMoLSkNCj4+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2F0bWVsL2F0bWVsLGhsY2RjLWRjLnlhbWwN
Cj4+ICAgZGVsZXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9kaXNwbGF5L2F0bWVsL2hsY2RjLWRjLnR4dA0KPj4NCj4gDQo+IE15IGJvdCBmb3VuZCBlcnJv
cnMgcnVubmluZyAnbWFrZSBEVF9DSEVDS0VSX0ZMQUdTPS1tIGR0X2JpbmRpbmdfY2hlY2snDQo+
IG9uIHlvdXIgcGF0Y2ggKERUX0NIRUNLRVJfRkxBR1MgaXMgbmV3IGluIHY1LjEzKToNCj4gSSBj
b25kdWN0ZWQgdGhlIHRlc3RzIGFmdGVyIGFwcGx5aW5nIGFsbCB0aHJlZSBvZiB0aGVtLCBzbyBJ
IGRpZG4ndCANCm5vdGljZSB0aGVzZSBlcnJvcnMuIEkgaGF2ZSBhZGRyZXNzZWQgdGhpcyBpbiB2
Mi4gVGhhbmsgeW91Lg0KDQotLSANCldpdGggQmVzdCBSZWdhcmRzLA0KRGhhcm1hIEIuDQo+IHlh
bWxsaW50IHdhcm5pbmdzL2Vycm9yczoNCj4gDQo+IGR0c2NoZW1hL2R0YyB3YXJuaW5ncy9lcnJv
cnM6DQo+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2F0bWVsL2F0
bWVsLGhsY2RjLWRjLmV4YW1wbGUuZHRiOiAvZXhhbXBsZS0wL2hsY2RjQGYwMDMwMDAwOiBmYWls
ZWQgdG8gbWF0Y2ggYW55IHNjaGVtYSB3aXRoIGNvbXBhdGlibGU6IFsnYXRtZWwsc2FtYTVkMy1o
bGNkYyddDQo+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2F0bWVs
L2F0bWVsLGhsY2RjLWRjLmV4YW1wbGUuZHRiOiAvZXhhbXBsZS0wL2hsY2RjQGYwMDMwMDAwL2hs
Y2RjLXB3bTogZmFpbGVkIHRvIG1hdGNoIGFueSBzY2hlbWEgd2l0aCBjb21wYXRpYmxlOiBbJ2F0
bWVsLGhsY2RjLXB3bSddDQo+IA0KPiBkb2MgcmVmZXJlbmNlIGVycm9ycyAobWFrZSByZWZjaGVj
a2RvY3MpOg0KPiANCj4gU2VlIGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9k
ZXZpY2V0cmVlLWJpbmRpbmdzL3BhdGNoLzIwMjQwMTEwMTAyNTM1LjI0NjE3Ny0yLWRoYXJtYS5i
QG1pY3JvY2hpcC5jb20NCj4gDQo+IFRoZSBiYXNlIGZvciB0aGUgc2VyaWVzIGlzIGdlbmVyYWxs
eSB0aGUgbGF0ZXN0IHJjMS4gQSBkaWZmZXJlbnQgZGVwZW5kZW5jeQ0KPiBzaG91bGQgYmUgbm90
ZWQgaW4gKnRoaXMqIHBhdGNoLg0KPiANCj4gSWYgeW91IGFscmVhZHkgcmFuICdtYWtlIGR0X2Jp
bmRpbmdfY2hlY2snIGFuZCBkaWRuJ3Qgc2VlIHRoZSBhYm92ZQ0KPiBlcnJvcihzKSwgdGhlbiBt
YWtlIHN1cmUgJ3lhbWxsaW50JyBpcyBpbnN0YWxsZWQgYW5kIGR0LXNjaGVtYSBpcyB1cCB0bw0K
PiBkYXRlOg0KPiANCj4gcGlwMyBpbnN0YWxsIGR0c2NoZW1hIC0tdXBncmFkZQ0KPiANCj4gUGxl
YXNlIGNoZWNrIGFuZCByZS1zdWJtaXQgYWZ0ZXIgcnVubmluZyB0aGUgYWJvdmUgY29tbWFuZCB5
b3Vyc2VsZi4gTm90ZQ0KPiB0aGF0IERUX1NDSEVNQV9GSUxFUyBjYW4gYmUgc2V0IHRvIHlvdXIg
c2NoZW1hIGZpbGUgdG8gc3BlZWQgdXAgY2hlY2tpbmcNCj4geW91ciBzY2hlbWEuIEhvd2V2ZXIs
IGl0IG11c3QgYmUgdW5zZXQgdG8gdGVzdCBhbGwgZXhhbXBsZXMgd2l0aCB5b3VyIHNjaGVtYS4N
Cj4gDQoNCg==
