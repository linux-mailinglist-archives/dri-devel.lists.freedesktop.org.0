Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D36DD890FAE
	for <lists+dri-devel@lfdr.de>; Fri, 29 Mar 2024 01:38:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A91810E0A4;
	Fri, 29 Mar 2024 00:38:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="4WdzHSdY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2100.outbound.protection.outlook.com [40.107.93.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6757110E0A4
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Mar 2024 00:38:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NksVv/tsC50NpjyQ4/xUX7AJIdTeOlCoyPsKSNttKGVWJ2DxlHcXF6iG9LVIILXfm83+cAana+bpgz5OG+XtfHPHo60pBpScLHSNcpR962HyHWbt/xCgwGDVthpB3/CBK4onVTJxPCYEfX0yWjFT9vDJcK0kUGlNqDw33RQQIBISmwa3GYEKaxs+zYYKacVtWHZDSERTQns4/X9w3c3oQU6B+6MZUEjVmx4bDncwURQSZMWlIIjJBUeOlMqNaOVRShk7UcIo/TVi+8MizATeX8bFuRmyloyolbYR8O47LQ8nqpQU9XSBdICzuljxKaZD6Mfub1gGOOyPwEjiQCF4BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XOqp/KcI3coeoBc7+zfODqYapdgbxcBv+bgAoq940WQ=;
 b=ViU/VO091La3J42y0NhMhdCr+opwnIMTz6EDhvQMhXPaFYQCHNB+wzo/Of2E0WuvGSu/bzXRcVORXLv35vpK7oGCJrnXJmvRCYez/JyLhFR5TzkbARH9EOGlL8nVgIHpnOkYlb6ttqhbUoCxsn9yH4K204L0JWJYXHxzyoRzaXTdoNGF+3JW5dhastpl1wP75BC0hy8XRXtn5AkZpFXwE+hkS1LBqrIx/HXqxbJBRYW2SDCVSziltpXdU2ByaDB9kvQXKyYprCb3M5qrtKF8gxTLMf5s/eSclMSPPCwrc5dzAeyNmXD7E8LEHW6CtxYKm4aPEbdG4OIQbZD6x0n3SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XOqp/KcI3coeoBc7+zfODqYapdgbxcBv+bgAoq940WQ=;
 b=4WdzHSdYVkLsq9OuVW9JEAFNPvJSkNMqvWk6JMuYTf0Ye5qYPVC6nN3xeqEdun5G4lWNmDGn5pfYia8ahzUQcPFIJq9JIE49k1kWMR2BRaMKwUOj3Xeebwi4GnqxgVVbwCtU+shW47mE/D5YtexQUnl3MpKUQPuXput/DhI8F54=
Received: from MW4PR12MB7165.namprd12.prod.outlook.com (2603:10b6:303:21b::14)
 by DM6PR12MB4154.namprd12.prod.outlook.com (2603:10b6:5:21d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.38; Fri, 29 Mar
 2024 00:38:33 +0000
Received: from MW4PR12MB7165.namprd12.prod.outlook.com
 ([fe80::e039:187d:47be:afb7]) by MW4PR12MB7165.namprd12.prod.outlook.com
 ([fe80::e039:187d:47be:afb7%4]) with mapi id 15.20.7409.031; Fri, 29 Mar 2024
 00:38:33 +0000
From: "Klymenko, Anatoliy" <Anatoliy.Klymenko@amd.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, "Simek, Michal" <michal.simek@amd.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
CC: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>
Subject: RE: [PATCH v3 8/9] dt-bindings: xlnx: Add VTC and TPG bindings
Thread-Topic: [PATCH v3 8/9] dt-bindings: xlnx: Add VTC and TPG bindings
Thread-Index: AQHae9CWOJYT8G1vaUajPKAdUatgu7FDRIUAgADPWeCAAQwKAIAIv8BA
Date: Fri, 29 Mar 2024 00:38:33 +0000
Message-ID: <MW4PR12MB716570A3676218F0C6375E37E63A2@MW4PR12MB7165.namprd12.prod.outlook.com>
References: <20240321-dp-live-fmt-v3-0-d5090d796b7e@amd.com>
 <20240321-dp-live-fmt-v3-8-d5090d796b7e@amd.com>
 <a82d525c-737a-4ac4-9d71-e88f4ba69ea1@linaro.org>
 <MW4PR12MB7165889CE7F27A3F0B29DC7EE6312@MW4PR12MB7165.namprd12.prod.outlook.com>
 <c0d70ba9-34ef-4121-834d-4d107f03d7f0@linaro.org>
In-Reply-To: <c0d70ba9-34ef-4121-834d-4d107f03d7f0@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR12MB7165:EE_|DM6PR12MB4154:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TpIXUI1tOoxBgieJZFs86ZOnax28WOgd65SKotSU+RwdgsmqHWTEabexLJuZwmkGnJ9VA+Hm4/OLrYG6dtEoRK7PPHw62P3HLYuKvP7E6FvNm4f/Y7qTXosqFjU1sA3dJ06PtIZzdx57JSngHEcaZqcePMfVLanhfotW6j437xMsAZ9tsFKhNNoFC2S9Qs8YWjUMhnOEs9BMCfzRC0qQMq6vk9zewrfZpgLImzaghijwiD+qpwXjd8tGLsdK2kuCyia9ZUd719KgvIEzC6svaGyQiYNNuWfIYQhzfhXfgFEeiRt91k28u4g4HXT62Ya5xt6teUuuLxl2cubpyOAzGQnnhbQ7qJ8PuuSNH6lfRxq8KCtpby2r7ZvPSUHXdxhZleIM45hVfJQiVXTsNXWaL8Oq3HlmJ2CGxoq+JBm0TMCV7oKe64NzuEJXwsLbUrAN8tJzwrfFSxeprNqQouG9tMv7m0jsVw74c4SQM7h5/8ABdLGWIf1Bo8ZCKx1gzS4Z2TLjuB87UV9jNQhMNx5X1231lHrB21wrYjZ7RiLzNylySqFLL55Fi/QpwRIBnCaZdBzyFt6oNSoF+1rJ6ybSxYyBdUhuNPCeI9++/6T3El9TM5Kl9PLWakOC91X5dQFTGdLRcUqNM4KEKn0wJHV5V1ueP6uBOiMTz6+FJ7DDhK1Cq6M0W4Y6CVmyu65yYfIxxiEK4EL5LRqFscjloLlAcA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR12MB7165.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005)(7416005)(921011); DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bFlkT0ZFOER4YXFHUG50YzJBWGEyMHZzLzRFdWNhY1ZoOTM0ZktrZGdUeDgz?=
 =?utf-8?B?MXJ3dG1GQWZhanhEMU9HWHdmN2ZpU09wMTh0MjJGQ05Qem9ueWRvaHZwQWpq?=
 =?utf-8?B?RkU3VGkxZTdKODkxYjZhOW1oVWEwZWdYRGlEeTVWNkg0SVJNcHZFbGhGeW5j?=
 =?utf-8?B?NUExVHNDK1ljMVRSUENzVnk2VitYWHV0WXBsRUZTSWdzdEV1SXJMWHR4dnM5?=
 =?utf-8?B?SU9EbkZ2UUhPT2JFVXFiNmhrQkZoUytlcXh3VzFvNzJON29vamxsTEd0bzkv?=
 =?utf-8?B?STY1RWI5U1UzbkRqbDBrbGdvNjB3OEFOS2s1WktMbW5rODZsZkY1bmQ3RDBk?=
 =?utf-8?B?UUlCYzhGQ200WXl2TE9lcnp5bEpKenVGUncvYXYzTWpuNWJFQjlSTVpIWWNs?=
 =?utf-8?B?Ty9LTTZLUnQvekZhUHRDWllSanNndHVmWVB5b0I2R21ubEJhQ0VzeUtwT2pP?=
 =?utf-8?B?b0x5OTBJQXlmWWlhei8reGkvVTZFUTRpMVRKMElIcDNyQmVxSWQybTV4RzB1?=
 =?utf-8?B?ZFY4Umx0Z2tLK3JLajM2R2E3ZXJmMVJiVWNqRlF1THcvRXZSMXhSbHpHMGI3?=
 =?utf-8?B?cDdYL0RDRXAwaEo3VXF6MUk5RzFMdHBMOWg5UEZxTTBESnVjS2N5d1RsQ0RZ?=
 =?utf-8?B?Vk5ORkxMUVJwT3lTZ3ZVcjBTWXFwZ1R5SjNwMmwwRm5lcnJVOEk3WElKNmEv?=
 =?utf-8?B?d0IrNnpITWJNbkJla3VhNTlyTncxN2RKOEV2VGZ5MnYvTTZEQ2E2QnBJVkJH?=
 =?utf-8?B?cHN6ZHhzK3pidHVnSzc0OEpjYkszaE0xWmQxSlFUMFY1ZG5WK2R1bU9ZT3VR?=
 =?utf-8?B?MU1mOFNiYk1MQy9rZU82azNVOWZ4cEYvVVBwZ1l1M3R0YjQ1RUxVWnVBMlpV?=
 =?utf-8?B?VUIvV0p3T2M2N1Y0a1JyUGExN0NKQkdpQThWQlZyRmtsaG1iUzd3ZXV3QURC?=
 =?utf-8?B?R051OUZDUUdQSXRjMlhtL1JJWUIwTnR6R2FuSDNSdWJIdTF1STcvdlFRK1hy?=
 =?utf-8?B?L3drMnRkVk5uMmUrVk9vdVlwRUkyeEZvOUVaajBEeTdkUnUzUnREa0hkK3hP?=
 =?utf-8?B?dUlyQU5hY1I0dld6eHJaZFhxN29HRkh0bFc2TlBZMDdiYTlEZy9pU0o0T3pP?=
 =?utf-8?B?amNSV003dU9HMTkvYU1CSGVzMHAyTnV1RGcwM29Ub0dtaEg1OUhPcUppUWhW?=
 =?utf-8?B?b0pZQ0ZxS0JEc2FzQ0p0S0h5a1g1dldmdUlXMFk2RFNZbzhWZXpUZEZMM3Fa?=
 =?utf-8?B?d1YzUlFaeFhCSjVYeVBPNjEvSTdhTzJnRDBlVHRFOGg4c28zQWlGakdUU2Iy?=
 =?utf-8?B?cmVMUlZUOXYramFqZFRLeVNISk5WdVZWdE1QcnBaNm1hMVl0WU42czkvUWds?=
 =?utf-8?B?d0VCYXpUQkcyclVwWld6dlhpa0VLLzViVXdhQktxaUNjUkxDSzg0cW5BVWxL?=
 =?utf-8?B?WFo1MkNEcEpzTW13T1pCMGl1akhEMDU1WU9LU1VzTXhaYmdXNkM0ZEg2bklV?=
 =?utf-8?B?Z0ZvaFFzTTJmelhXb2xTRTVvUWN3OE83dCszR2dSakxDZkFvWGNaN3Q4ZnFS?=
 =?utf-8?B?ci85aUpiWTVOb2dldnI3MTU4NjVqL2FoemtFcmN4NCtWNWJTbU13TlRJQ2Ni?=
 =?utf-8?B?V2MwbktvL3JzTUd1dXZadWFFRFNVVVI0U3R0N0VENHllTS9hUUR6UWsrL1VK?=
 =?utf-8?B?a0g5Q3NPSm1aZEc3UjIvU0h2cnNQdXNmMEFwV1JJMUZqSmx5L1FvNDRMMHha?=
 =?utf-8?B?Zk5ZWFZvQ3pRYmh2Vkg1cVpvM1B4R1crVTkrOWtiMXVlWnhqSjhhcWYzSDlO?=
 =?utf-8?B?bzAzTWpUa2JHZHZ0SklBUjVWS3BxS0NyZVliYk1IM0lYNEtPM0lpVG5XeStQ?=
 =?utf-8?B?bzhkV3dmcjY1SWpCbC9QSlFzQUpuYk1BbWt1NU5qNS85UzQ1cHNrWVR1cXZz?=
 =?utf-8?B?ZWZFTit1TytaeU5WS1E5VG1CTWFYby95RWY1SXorRUN5ZzNaK1VPRzVIU1hw?=
 =?utf-8?B?czRjY2NodkFRd3JNcktVb1JXVDIwQlNrVndvekdPNy9FbXUrZFdhdXd3K0pZ?=
 =?utf-8?B?cVpwQWlzeUhRNThvT2xDZXFBdUVPL2U2NlBrN2RQanVrS1RGc25pQzVLQmlW?=
 =?utf-8?Q?kBfw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB7165.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d2d5bf5-af6a-45e8-54a5-08dc4f889081
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Mar 2024 00:38:33.8022 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WqOdtz5vFbXMFvzlAvTp+sxeoElOKsN6Dgbbm/dPiZDT+YiBFmCKmTRfubphCWMgtnt65hA3u3qG6iCJc7jFbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4154
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

SGkgS3J6eXN6dG9mLA0KDQpUaGFuayB5b3UgZm9yIHRoZSBmZWVkYmFjay4NCg0KPiAtLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0
b2Yua296bG93c2tpQGxpbmFyby5vcmc+DQo+IFNlbnQ6IFNhdHVyZGF5LCBNYXJjaCAyMywgMjAy
NCAzOjIxIEFNDQo+IFRvOiBLbHltZW5rbywgQW5hdG9saXkgPEFuYXRvbGl5LktseW1lbmtvQGFt
ZC5jb20+OyBMYXVyZW50IFBpbmNoYXJ0DQo+IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2Fy
ZC5jb20+OyBNYWFydGVuIExhbmtob3JzdA0KPiA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50
ZWwuY29tPjsgTWF4aW1lIFJpcGFyZA0KPiA8bXJpcGFyZEBrZXJuZWwub3JnPjsgVGhvbWFzIFpp
bW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+Ow0KPiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRA
Z21haWwuY29tPjsgRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPjsgU2ltZWssDQo+IE1p
Y2hhbCA8bWljaGFsLnNpbWVrQGFtZC5jb20+OyBBbmRyemVqIEhhamRhDQo+IDxhbmRyemVqLmhh
amRhQGludGVsLmNvbT47IE5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3Jn
PjsNCj4gUm9iZXJ0IEZvc3MgPHJmb3NzQGtlcm5lbC5vcmc+OyBKb25hcyBLYXJsbWFuIDxqb25h
c0Brd2lib28uc2U+OyBKZXJuZWoNCj4gU2tyYWJlYyA8amVybmVqLnNrcmFiZWNAZ21haWwuY29t
PjsgUm9iIEhlcnJpbmcgPHJvYmgrZHRAa2VybmVsLm9yZz47DQo+IEtyenlzenRvZiBLb3psb3dz
a2kgPGtyenlzenRvZi5rb3psb3dza2krZHRAbGluYXJvLm9yZz47IENvbm9yIERvb2xleQ0KPiA8
Y29ub3IrZHRAa2VybmVsLm9yZz47IE1hdXJvIENhcnZhbGhvIENoZWhhYiA8bWNoZWhhYkBrZXJu
ZWwub3JnPg0KPiBDYzogVG9taSBWYWxrZWluZW4gPHRvbWkudmFsa2VpbmVuQGlkZWFzb25ib2Fy
ZC5jb20+OyBkcmktDQo+IGRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgbGludXgtYXJtLWtl
cm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOyBsaW51eC0NCj4ga2VybmVsQHZnZXIua2VybmVsLm9y
ZzsgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LQ0KPiBtZWRpYUB2Z2VyLmtlcm5l
bC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MyA4LzldIGR0LWJpbmRpbmdzOiB4bG54OiBB
ZGQgVlRDIGFuZCBUUEcgYmluZGluZ3MNCj4gDQo+IENhdXRpb246IFRoaXMgbWVzc2FnZSBvcmln
aW5hdGVkIGZyb20gYW4gRXh0ZXJuYWwgU291cmNlLiBVc2UgcHJvcGVyDQo+IGNhdXRpb24gd2hl
biBvcGVuaW5nIGF0dGFjaG1lbnRzLCBjbGlja2luZyBsaW5rcywgb3IgcmVzcG9uZGluZy4NCj4g
DQo+IA0KPiBPbiAyMi8wMy8yMDI0IDIwOjEyLCBLbHltZW5rbywgQW5hdG9saXkgd3JvdGU6DQo+
ID4gSGkgS3J6eXN6dG9mLA0KPiA+DQo+ID4gVGhhbmtzIGEgbG90IGZvciB0aGUgcmV2aWV3Lg0K
PiA+DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+IEZyb206IEtyenlzenRv
ZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4NCj4gPj4gU2VudDog
VGh1cnNkYXksIE1hcmNoIDIxLCAyMDI0IDEwOjU5IFBNDQo+ID4+IFRvOiBLbHltZW5rbywgQW5h
dG9saXkgPEFuYXRvbGl5LktseW1lbmtvQGFtZC5jb20+OyBMYXVyZW50IFBpbmNoYXJ0DQo+ID4+
IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+OyBNYWFydGVuIExhbmtob3JzdA0K
PiA+PiA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPjsgTWF4aW1lIFJpcGFyZA0K
PiA+PiA8bXJpcGFyZEBrZXJuZWwub3JnPjsgVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5u
QHN1c2UuZGU+Ow0KPiBEYXZpZA0KPiA+PiBBaXJsaWUgPGFpcmxpZWRAZ21haWwuY29tPjsgRGFu
aWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPjsgU2ltZWssDQo+ID4+IE1pY2hhbCA8bWljaGFs
LnNpbWVrQGFtZC5jb20+OyBBbmRyemVqIEhhamRhDQo+ID4+IDxhbmRyemVqLmhhamRhQGludGVs
LmNvbT47IE5laWwgQXJtc3Ryb25nDQo+ID4+IDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPjsg
Um9iZXJ0IEZvc3MgPHJmb3NzQGtlcm5lbC5vcmc+OyBKb25hcw0KPiA+PiBLYXJsbWFuIDxqb25h
c0Brd2lib28uc2U+OyBKZXJuZWogU2tyYWJlYw0KPiA8amVybmVqLnNrcmFiZWNAZ21haWwuY29t
PjsNCj4gPj4gUm9iIEhlcnJpbmcgPHJvYmgrZHRAa2VybmVsLm9yZz47IEtyenlzenRvZiBLb3ps
b3dza2kNCj4gPj4gPGtyenlzenRvZi5rb3psb3dza2krZHRAbGluYXJvLm9yZz47IENvbm9yIERv
b2xleQ0KPiA+PiA8Y29ub3IrZHRAa2VybmVsLm9yZz47IE1hdXJvIENhcnZhbGhvIENoZWhhYiA8
bWNoZWhhYkBrZXJuZWwub3JnPg0KPiA+PiBDYzogVG9taSBWYWxrZWluZW4gPHRvbWkudmFsa2Vp
bmVuQGlkZWFzb25ib2FyZC5jb20+OyBkcmktDQo+ID4+IGRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZzsgbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOw0KPiA+PiBsaW51eC0g
a2VybmVsQHZnZXIua2VybmVsLm9yZzsgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4
LQ0KPiA+PiBtZWRpYUB2Z2VyLmtlcm5lbC5vcmcNCj4gPj4gU3ViamVjdDogUmU6IFtQQVRDSCB2
MyA4LzldIGR0LWJpbmRpbmdzOiB4bG54OiBBZGQgVlRDIGFuZCBUUEcNCj4gPj4gYmluZGluZ3MN
Cj4gPj4NCj4gPj4gQ2F1dGlvbjogVGhpcyBtZXNzYWdlIG9yaWdpbmF0ZWQgZnJvbSBhbiBFeHRl
cm5hbCBTb3VyY2UuIFVzZSBwcm9wZXINCj4gPj4gY2F1dGlvbiB3aGVuIG9wZW5pbmcgYXR0YWNo
bWVudHMsIGNsaWNraW5nIGxpbmtzLCBvciByZXNwb25kaW5nLg0KPiA+Pg0KPiA+Pg0KPiA+PiBP
biAyMS8wMy8yMDI0IDIxOjQzLCBBbmF0b2xpeSBLbHltZW5rbyB3cm90ZToNCj4gPj4+IGRpZmYg
LS1naXQgYS9pbmNsdWRlL2R0LWJpbmRpbmdzL21lZGlhL21lZGlhLWJ1cy1mb3JtYXQuaA0KPiA+
Pj4gYi9pbmNsdWRlL2R0LQ0KPiA+PiBiaW5kaW5ncy9tZWRpYS9tZWRpYS1idXMtZm9ybWF0LmgN
Cj4gPj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4+PiBpbmRleCAwMDAwMDAwMDAwMDAuLjYw
ZmM2ZTExZGFiYw0KPiA+Pj4gLS0tIC9kZXYvbnVsbA0KPiA+Pj4gKysrIGIvaW5jbHVkZS9kdC1i
aW5kaW5ncy9tZWRpYS9tZWRpYS1idXMtZm9ybWF0LmgNCj4gPj4+IEBAIC0wLDAgKzEsMTc3IEBA
DQo+ID4+PiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9ubHkgT1IgTUlU
KSAqLw0KPiA+Pj4gKy8qDQo+ID4+PiArICogTWVkaWEgQnVzIEFQSSBoZWFkZXINCj4gPj4+ICsg
Kg0KPiA+Pj4gKyAqIENvcHlyaWdodCAoQykgMjAwOSwgR3Vlbm5hZGkgTGlha2hvdmV0c2tpDQo+
ID4+PiArPGcubGlha2hvdmV0c2tpQGdteC5kZT4NCj4gPj4+ICsgKg0KPiA+Pj4gKyAqIFRoaXMg
cHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IN
Cj4gPj4+ICttb2RpZnkNCj4gPj4+ICsgKiBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBH
ZW5lcmFsIFB1YmxpYyBMaWNlbnNlIHZlcnNpb24gMg0KPiA+Pj4gK2FzDQo+ID4+PiArICogcHVi
bGlzaGVkIGJ5IHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb24uDQo+ID4+DQo+ID4+IFRoYXQn
cyBub3QgdHJ1ZS4gWW91ciBTUERYIHRlbGxzIHNvbWV0aGluZyBlbnRpcmVseSBkaWZmZXJlbnQu
DQo+ID4+DQo+ID4NCj4gPiBUaGFuayB5b3UgLSBJJ2xsIHNlZSBob3cgdG8gZml4IGl0Lg0KPiA+
DQo+ID4+IEFueXdheSwgeW91IGRpZCBub3QgZXhwbGFpbiB3aHkgeW91IG5lZWQgdG8gY29weSBh
bnl0aGluZyBhbnl3aGVyZS4NCj4gPj4NCj4gPj4gU3BlY2lmaWNhbGx5LCByYW5kb20gaGV4IHZh
bHVlcyAqYXJlIG5vdCBiaW5kaW5ncyouDQo+ID4+DQo+ID4NCj4gPiBUaGUgc2FtZSBtZWRpYSBi
dXMgZm9ybWF0IHZhbHVlcyBhcmUgYmVpbmcgdXNlZCBieSB0aGUgcmVmZXJlbmNlDQo+ID4gZHJp
dmVyIGluIHBhdGNoICM5LiBBbmQsIGFzIGZhciBhcyBJIGtub3csIHdlIGNhbm5vdCB1c2UgaGVh
ZGVycyBmcm9tDQo+ID4gTGludXggQVBJIGhlYWRlcnMgZGlyZWN0bHkgKGF0IGxlYXN0IEkNCj4g
DQo+IEkgZG9uJ3QgdW5kZXJzdGFuZCB3aGF0IGRvZXMgaXQgbWVhbi4gWW91IGNhbiB1c2UgaW4g
eW91ciBkcml2ZXIgd2hhdGV2ZXINCj4gaGVhZGVycyB5b3Ugd2lzaCwgSSBkb24ndCBjYXJlIGFi
b3V0IHRoZW0uDQo+IA0KPiANCj4gbm90aWNlZCB0aGUgc2FtZSBwYXR0ZXJuIGluIC4uL2R0LWJp
bmRpbmdzL3NkdHYtc3RhbmRhcnRzLmggZm9yIGluc3RhbmNlKS4NCj4gV2hhdCB3b3VsZCBiZSB0
aGUgYmVzdCBhcHByb2FjaCB0byByZXVzaW5nIHRoZSBzYW1lIGRlZmluZXMgb24gRFQgYW5kDQo+
IGRyaXZlciBzaWRlcyBmcm9tIHlvdXIgcG9pbnQgb2Ygdmlldz8gU3ltbGluayBtYXliZT8NCj4g
Pg0KPiANCj4gV3JhcCB5b3VyIG1lc3NhZ2VzIHRvIG1hdGNoIG1haWxpbmcgbGlzdCBkaXNjdXNz
aW9uIHN0eWxlLiBUaGVyZSBhcmUgbm8NCj4gZGVmaW5lcyB1c2VkIGluIERULiBJZiB0aGVyZSBh
cmUsIHNob3cgbWUgdGhlbSBpbiAqVEhJUyogb3Igb3RoZXINCj4gKnVwc3RyZWFtZWQqIChiZWlu
ZyB1cHN0cmVhbWVkKSBwYXRjaHNldC4NCj4gDQoNClNvcnJ5LCBJIGRpZG4ndCBleHBsYWluIHBy
b3Blcmx5IHdoYXQgSSdtIHRyeWluZyB0byBhY2hpZXZlLiBJIG5lZWQgdG8NCmNyZWF0ZSBhIERU
IG5vZGUgcHJvcGVydHkgdGhhdCByZXByZXNlbnRzIHZpZGVvIHNpZ25hbCBmb3JtYXQsIG9uZSBv
Zg0KTUVESUFfQlVTX0ZNVF8qIGZyb20gaW5jbHVkZS91YXBpL2xpbnV4L21lZGlhLWJ1cy1mb3Jt
YXQuaC4gSXQgd291bGQgYmUNCm5pY2UgdG8gcmV1c2UgdGhlIHNhbWUgc3ltYm9saWMgdmFsdWVz
IGluIHRoZSBkZXZpY2UgdHJlZS4gV2hhdCBpcyB0aGUNCmJlc3QgYXBwcm9hY2ggaGVyZT8gU2hv
dWxkIEkgY3JlYXRlIGEgc2VwYXJhdGUgaGVhZGVyIGluDQppbmNsdWRlL2R0LWJpbmRpbmdzIHdp
dGggdGhlIHNhbWUgb3Igc2ltaWxhciAodG8gYXZvaWQgbXVsdGlwbGUNCmRlZmluaXRpb24gZXJy
b3JzKSBkZWZpbmVzLCBvciBpcyBpdCBiZXR0ZXIgdG8gY3JlYXRlIGEgc3ltbGluayB0bw0KbWVk
aWEtYnVzLWZvcm1hdC5oIGxpa2UgaW5jbHVkZS9kdC1iaW5kaW5ncy9saW51eC1ldmVudC1jb2Rl
cy5oPw0KDQo+IFdoYXRldmVyIHlvdSBoYXZlIG91dCBvZiB0cmVlIG9yICJETyBOT1QgTUVSR0Ui
IGRvZXMgbm90IG1hdHRlciBhbmQNCj4gZG9lcyBub3QganVzdGlmeSBhbnl0aGluZy4NCj4gDQo+
IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0KDQpUaGFuayB5b3UsDQpBbmF0b2xpeQ0K
DQo=
