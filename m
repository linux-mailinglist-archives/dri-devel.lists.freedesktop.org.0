Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86EC53F5183
	for <lists+dri-devel@lfdr.de>; Mon, 23 Aug 2021 21:46:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 702D389B00;
	Mon, 23 Aug 2021 19:46:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2064.outbound.protection.outlook.com [40.107.236.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1D1689954;
 Mon, 23 Aug 2021 19:46:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EidccY6u7GkS8zlke1QHuxftabnqTnObSchg/PHNf9Xz2twQIeQDhLsk+SKt6nY2pqbLUVvvnRSC8b/UrH6h8K5sI1wBso0mtZN17v37hyjQFpWKnJXclW/T8neJMC0wP1aD4dHoG7WLxydLPSeSqN7MSTd2RHv/UNiv8Frh4tEqP7C2fA89SOaXavZJU6oibjlSAtJOreeQbmo3qg76T062UeGa9LhycqANpyDc4xnT9qBHtiv0RptKW/mw0hWzoAdGtVObWeKDHWib/riSwVzNOe4dNwQbNewgP5KPvl3AySllG9DfQYbknmX+gRtEvjOxOTmHV+iwx5L4ur4zng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hz1O9zgusRIp5Hkta0L2YQpB4fFZXZ1ULm1SKPC1hE0=;
 b=T04vhzSDyRTdmZYJ9SbVAqcURpmQ3OaUmM4ssTARn616lHKGzvUlkdzTkPlvIueimWsygKlriKC79tsOJ6yKDcMGDlLqXQcwV0YwlzcF2tVhg69B/6lEAjBcxbqF15R2OfjVBTuFZSZRv8ELbqVSStnfUNAta5WBxmPqdfBydNs7d6nrnS4fivxcz9TeLcA46Sag080lGVur+l//PCkpxl21gEjp94HF4ovzUlQ7MQRyEKA3VYgPC8Wa9XnuywA1ZqoqTjFui0P1h9tnqdzNPR5EKOMxw1cQZazZPJRPimi0a0kzwmInCsGnP36+aheonIK+g6wGF0l4ysH5a/xx+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hz1O9zgusRIp5Hkta0L2YQpB4fFZXZ1ULm1SKPC1hE0=;
 b=1KUm0ahDaBjeI3Q/N75zdGuDoHJv0hGt4m3Q6PYzaATNeEzhZYWt7kP/KcKK/AqhD24VInocYSe4TnJ5oDF2+W0BMkqqXUt0YxVxxPZi2KtwH6FU0E/hJ3KtCBUAm4SFXAQd8h61Y5/wmO7wkbDBZURc/HO6DjlPGgZWO8DIGEY=
Received: from BL1PR12MB5144.namprd12.prod.outlook.com (2603:10b6:208:316::6)
 by BL1PR12MB5380.namprd12.prod.outlook.com (2603:10b6:208:314::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.23; Mon, 23 Aug
 2021 19:13:43 +0000
Received: from BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::5dfc:ea54:4a18:89f5]) by BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::5dfc:ea54:4a18:89f5%4]) with mapi id 15.20.4436.024; Mon, 23 Aug 2021
 19:13:43 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>, Kees Cook
 <keescook@chromium.org>, "Lazar, Lijo" <Lijo.Lazar@amd.com>
CC: "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, "Zhang, Hawking" <Hawking.Zhang@amd.com>,
 "Xu, Feifei" <Feifei.Xu@amd.com>, "Gao, Likun" <Likun.Gao@amd.com>, "Gu,
 JiaWei (Will)" <JiaWei.Gu@amd.com>, "Quan, Evan" <Evan.Quan@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Tuikov, 
 Luben" <Luben.Tuikov@amd.com>, "Grodzovsky, Andrey"
 <Andrey.Grodzovsky@amd.com>, "Li, Dennis" <Dennis.Li@amd.com>, "Sundararaju,
 Sathishkumar" <Sathishkumar.Sundararaju@amd.com>, "Kim, Jonathan"
 <Jonathan.Kim@amd.com>, "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>, "Nieto,
 David M" <David.Nieto@amd.com>, "Feng, Kenneth" <Kenneth.Feng@amd.com>, Lee
 Jones <lee.jones@linaro.org>, "Clements, John" <John.Clements@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>
Subject: RE: [PATCH] drm/amd/pm: And destination bounds checking to struct copy
Thread-Topic: [PATCH] drm/amd/pm: And destination bounds checking to struct
 copy
Thread-Index: AQHXlTbeT/YlWt76dUqElH+SEevyG6uApdwAgACEhwCAAE3AgIAAAtcw
Date: Mon, 23 Aug 2021 19:13:43 +0000
Message-ID: <BL1PR12MB514453053481613D46D64470F7C49@BL1PR12MB5144.namprd12.prod.outlook.com>
References: <20210819201441.3545027-1-keescook@chromium.org>
 <4922d89d-1293-7b32-d684-c731c246e6c1@amd.com>
 <FB2A077F-78CB-4D84-A8F2-C63C57923496@chromium.org>
 <07a77a6c-f754-c676-5063-72ad418351d5@amd.com>
In-Reply-To: <07a77a6c-f754-c676-5063-72ad418351d5@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2021-08-23T19:13:09Z; 
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=a54132f0-385f-4c2b-9e8a-e267d059c830;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=1
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e503b59a-50e0-4d2d-b926-08d9666a1fbc
x-ms-traffictypediagnostic: BL1PR12MB5380:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL1PR12MB53805101DECC48729A270D9CF7C49@BL1PR12MB5380.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: l9RhdllpCsZOnmpLN4jJFa24Ofn9xK2A6K5fjcgi+j92wmS2VjNoo90C73oa+qEPuPS0iH0260p75nGBzfxQnCF+03Xwz6VOWZBKd0mMZvm275RcttirQTrbzt3YlZoMkwqtJ3oPoHA5xuoAjq44NZ81v/2td/YIWyCiIJ4beRWgnTqlcCqBwBaSCbTNqldANAB37cTELACO9uYk1D23ZVlgzIyrY8FM8Y1hA4GJ7cVcp9CBNfNDgg1bsgq0MmlHPJxfB/LXtIhYsaZHLdJFACRMy4580cpUGUp1kAeyzED4fQcwWh+H3fHljqX8xx07GTiV2lHzRtsRZHDkAwZTnUQBr0J4f+aUiQqRktFq0PO5Sj2G+tTIEjLGaaF0vyrMccX/bevfJCDleTE+mQZoco4neGMLMHVp5z6fE8rCGOWuXCSsTn0b7kC64IIBzain7rjaL6R6BujGaWQgxKDinLwjIha8Pq36WJg7JWYhQ7l+AJ5eixaqHMDsxi5dWbHIumDBF7XsIRACZaZVzkw24OLN60cVFxBga7BjWoYZB9yVc0/jMGKkjOKZu4oIRVotBQK/gK5WflGb47+CiIlp/fhc2ceIkp5UdIopXipjJ4LZf+uInLhAb7s49kF1jtyzC9VXvCzdJeDzZl5LCJZuE6bdClDNsXo4Mv2m1mEU+vTTu4OrBITiRT2oCC891EuCpOPHDWpjLW6yuM69nSc6FA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5144.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(366004)(39860400002)(136003)(396003)(83380400001)(54906003)(110136005)(66574015)(316002)(4326008)(8936002)(8676002)(38070700005)(38100700002)(6636002)(76116006)(64756008)(26005)(55016002)(53546011)(66476007)(66946007)(5660300002)(122000001)(86362001)(2906002)(6506007)(52536014)(478600001)(186003)(9686003)(66556008)(66446008)(33656002)(7696005)(71200400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Vlh6UUhqRGVuVXZvUm9OMzZtK0U5WkhKU043clcvUzYyQmtFejRiTEJvL1Bi?=
 =?utf-8?B?d0VTZUVvU2hiU0tCdVBoem5pZURkL3hlWkZqN09DRjlaay9JZ0NaSmRVSmty?=
 =?utf-8?B?SjVzNTdvYXdGUVlPdFo3VlF6QzEzcmhvK1ovYzdOc05UYTMrOURJSW5hS2Fk?=
 =?utf-8?B?a3ZJbGE3ZjlTSnRvWkp1MmVjVWZjaHlZQzU3ZXB5U2ZLN0sxb3ArbXRyeFlU?=
 =?utf-8?B?NE5xN3NDNHFaUVBQRUQ3VFBWYU1ST25YUWlhVnEzbzI2aVRzUmY2aWFUdWs2?=
 =?utf-8?B?dTdhR1VWd0RnZUFFUkNSdzJWOStxRFdQK3RVdUEya3hPdHZWblhTNEFXQXhR?=
 =?utf-8?B?L0FCV29wVjJKR3c1YW1zYkIyVFpiU1dGU3hxZ3dwVzhtc3hUTWdkMjJFaGhN?=
 =?utf-8?B?Nzk1WC90SGJJaTViVHV0U3BsNG5sejQwZGxHME9zczlUaUxIS1Nhd2NiUU16?=
 =?utf-8?B?NkdaSEZwUnpzTmJYMCtZNzVBS2J5c0tndGJwR3FPMVZXMm9JbS9HRWc4NnhX?=
 =?utf-8?B?OHV0ODQ5STVBeVpScEF1dmVZUVR2aEVnNnFCbWM1Q0dyL0Q2THYvNnZteEJ5?=
 =?utf-8?B?R2NCbEU4dGRXUVNzOWttd1p3L1ZPNVZkVU9TNExBa3F2U3F2b3hYQ0NtSHBE?=
 =?utf-8?B?aUxESERIcTZXUGxUZVc5elYvWjQyR3pFVFEvWER3ckFpSnF2TWRGZWdOdDIz?=
 =?utf-8?B?UFJjN01pZ2UvancrOHM5cnJGSld6cVlqYUtBcHZCNlFNbjI2dHBlS1JaVS9m?=
 =?utf-8?B?NDh5VWlnTzB3OGxBLzFkQjV4Q1BvTE9lZnpVSFRETERxQnpTWGljT1ZoLzZG?=
 =?utf-8?B?Wm9zbjQ5em5nZzJoOHFuZTFCQ3o1UitaWkZhOUd3dzg0cEExelorSTBMZ2tD?=
 =?utf-8?B?V2tsM01ocHh6L0dtU0Z0UEh2Y2pxU2p2YlRyTVVETnBnZUt6OHZoTDU1VER2?=
 =?utf-8?B?eXhOQ1RTNDFLdUg4R2gzbWFPZ1VpaTBITEdPWjJiaDZlcjVtY3FzOW1HclRn?=
 =?utf-8?B?UjJkNnU2WnVNOVJHRHlCK0ZLNDQ0N21NNFQ2cnRwWjlZV2FreXY5bUpZMitw?=
 =?utf-8?B?YkZyKzNhdVdISGEycVdqS01lUjhHY0hqcjlQVTVRVE0zOVd4OHdlVWVBRWNZ?=
 =?utf-8?B?UytXdzVCZGN2bkpYeTBpSjNFbno1elBxTDlLTG1JbFNURDJReGd6WTFlOHlF?=
 =?utf-8?B?eFRpQk5DMXh0V3dsOHhvVVNkWHJ0QmkyYnV1WXhTa3BXL3dGb05COTh1ZWFv?=
 =?utf-8?B?SjFjbHRUck5VSVgvalFCNHBFZTl5aXFyZ0V1bUdKbnRqWmNyQzdjbW0vM0ZI?=
 =?utf-8?B?ZERBRzJKK1c0NG5zZU9MQlY4YlBjZTluMjNqVG9JcUowbmE2WmN3aFVaTnlz?=
 =?utf-8?B?VS9iSVloelpxRlIrdnV1bU85a1grand3bkkrTUhHWk96VkpLQkVoYUd6SVRq?=
 =?utf-8?B?Sjd4Wmp0dnJ1Q2M1ZlZVOGhJNm9wRkFzOW5qNTdRWHFuK1Boc3c5YnV6cmlt?=
 =?utf-8?B?c3ZvWGpwRUlHYVZ3cmRmQm1Uc0xIQ3hoeCtNc0VFbzhyRE5qU1pvQi8wSCtH?=
 =?utf-8?B?emx4c0hycncxVmp2VmVOY21qOWxRMFdqeVNPSGRrTk0xVGxoU3lqUktMYkFy?=
 =?utf-8?B?SDcydi9IQitoUkxYbW1LWTRnU0NVV080Sk5tNW5OUndEQTc1UUJmL3NsMkJL?=
 =?utf-8?B?bU1KWnpnQUUzVXZZenhQR0s4Y1QrMFQ5YlRteUp1VmdreDVWdmk5bUxaaW9Y?=
 =?utf-8?Q?Gf+Y/QGbSyGT9N+4oiCR3XEo9HF+g00sAgqOykO?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5144.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e503b59a-50e0-4d2d-b926-08d9666a1fbc
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2021 19:13:43.1737 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eEO4WX7cFAc9+yarcD9ZBA91ZQmU02hVLw0mHIgw7sbBgyE3biHIk8wPyoSBh3gH7ZOB76YPsgYFJxRGXAZCiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5380
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

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBLb2VuaWcs
IENocmlzdGlhbiA8Q2hyaXN0aWFuLktvZW5pZ0BhbWQuY29tPg0KPiBTZW50OiBNb25kYXksIEF1
Z3VzdCAyMywgMjAyMSAzOjAyIFBNDQo+IFRvOiBLZWVzIENvb2sgPGtlZXNjb29rQGNocm9taXVt
Lm9yZz47IExhemFyLCBMaWpvDQo+IDxMaWpvLkxhemFyQGFtZC5jb20+DQo+IENjOiBQYW4sIFhp
bmh1aSA8WGluaHVpLlBhbkBhbWQuY29tPjsgRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4Lmll
PjsNCj4gRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPjsgWmhhbmcsIEhhd2tpbmcNCj4g
PEhhd2tpbmcuWmhhbmdAYW1kLmNvbT47IFh1LCBGZWlmZWkgPEZlaWZlaS5YdUBhbWQuY29tPjsg
R2FvLCBMaWt1bg0KPiA8TGlrdW4uR2FvQGFtZC5jb20+OyBHdSwgSmlhV2VpIChXaWxsKSA8Smlh
V2VpLkd1QGFtZC5jb20+OyBRdWFuLA0KPiBFdmFuIDxFdmFuLlF1YW5AYW1kLmNvbT47IGFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBkcmktDQo+IGRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZzsgRGV1Y2hlciwgQWxleGFuZGVyDQo+IDxBbGV4YW5kZXIuRGV1Y2hlckBhbWQuY29tPjsg
VHVpa292LCBMdWJlbg0KPiA8THViZW4uVHVpa292QGFtZC5jb20+OyBHcm9kem92c2t5LCBBbmRy
ZXkNCj4gPEFuZHJleS5Hcm9kem92c2t5QGFtZC5jb20+OyBMaSwgRGVubmlzIDxEZW5uaXMuTGlA
YW1kLmNvbT47DQo+IFN1bmRhcmFyYWp1LCBTYXRoaXNoa3VtYXIgPFNhdGhpc2hrdW1hci5TdW5k
YXJhcmFqdUBhbWQuY29tPjsgS2ltLA0KPiBKb25hdGhhbiA8Sm9uYXRoYW4uS2ltQGFtZC5jb20+
OyBXYW5nLCBLZXZpbihZYW5nKQ0KPiA8S2V2aW4xLldhbmdAYW1kLmNvbT47IE5pZXRvLCBEYXZp
ZCBNIDxEYXZpZC5OaWV0b0BhbWQuY29tPjsgRmVuZywNCj4gS2VubmV0aCA8S2VubmV0aC5GZW5n
QGFtZC5jb20+OyBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPjsNCj4gQ2xlbWVudHMs
IEpvaG4gPEpvaG4uQ2xlbWVudHNAYW1kLmNvbT47IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5v
cmc7DQo+IGxpbnV4LWhhcmRlbmluZ0B2Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVjdDogUmU6IFtQ
QVRDSF0gZHJtL2FtZC9wbTogQW5kIGRlc3RpbmF0aW9uIGJvdW5kcyBjaGVja2luZyB0bw0KPiBz
dHJ1Y3QgY29weQ0KPiANCj4gQW0gMjMuMDguMjEgdW0gMTY6MjMgc2NocmllYiBLZWVzIENvb2s6
DQo+ID4NCj4gPiBPbiBBdWd1c3QgMjIsIDIwMjEgMTE6Mjg6NTQgUE0gUERULCAiQ2hyaXN0aWFu
IEvDtm5pZyINCj4gPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4gd3JvdGU6DQo+ID4+DQo+ID4+
IEFtIDE5LjA4LjIxIHVtIDIyOjE0IHNjaHJpZWIgS2VlcyBDb29rOg0KPiA+Pj4gWy4uLl0NCj4g
Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaA0KPiA+
Pj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaA0KPiA+Pj4gaW5kZXggOTZl
ODk1ZDZiZTM1Li40NjA1OTM0YTRmYjcgMTAwNjQ0DQo+ID4+PiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHUuaA0KPiA+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1LmgNCj4gPj4+IEBAIC0xNDQ2LDQgKzE0NDYsMjkgQEAgc3RhdGljIGlubGlu
ZSBpbnQgYW1kZ3B1X2luX3Jlc2V0KHN0cnVjdA0KPiBhbWRncHVfZGV2aWNlICphZGV2KQ0KPiA+
Pj4gICAgew0KPiA+Pj4gICAgCXJldHVybiBhdG9taWNfcmVhZCgmYWRldi0+aW5fZ3B1X3Jlc2V0
KTsNCj4gPj4+ICAgIH0NCj4gPj4+ICsNCj4gPj4+ICsvKioNCj4gPj4+ICsgKiBtZW1jcHlfdHJh
aWxpbmcgLSBDb3B5IHRoZSBlbmQgb2Ygb25lIHN0cnVjdHVyZSBpbnRvIHRoZSBtaWRkbGUNCj4g
Pj4+ICtvZiBhbm90aGVyDQo+ID4+PiArICoNCj4gPj4+ICsgKiBAZHN0OiBQb2ludGVyIHRvIGRl
c3RpbmF0aW9uIHN0cnVjdA0KPiA+Pj4gKyAqIEBmaXJzdF9kc3RfbWVtYmVyOiBUaGUgbWVtYmVy
IG5hbWUgaW4gQGRzdCB3aGVyZSB0aGUNCj4gb3ZlcndyaXRlDQo+ID4+PiArYmVnaW5zDQo+ID4+
PiArICogQGxhc3RfZHN0X21lbWJlcjogVGhlIG1lbWJlciBuYW1lIGluIEBkc3Qgd2hlcmUgdGhl
DQo+IG92ZXJ3cml0ZQ0KPiA+Pj4gK2VuZHMgYWZ0ZXINCj4gPj4+ICsgKiBAc3JjOiBQb2ludGVy
IHRvIHRoZSBzb3VyY2Ugc3RydWN0DQo+ID4+PiArICogQGZpcnN0X3NyY19tZW1iZXI6IFRoZSBt
ZW1iZXIgbmFtZSBpbiBAc3JjIHdoZXJlIHRoZSBjb3B5DQo+IGJlZ2lucw0KPiA+Pj4gKyAqDQo+
ID4+PiArICovDQo+ID4+PiArI2RlZmluZSBtZW1jcHlfdHJhaWxpbmcoZHN0LCBmaXJzdF9kc3Rf
bWVtYmVyLCBsYXN0X2RzdF9tZW1iZXIsDQo+IAkJICAgXA0KPiA+Pj4gKwkJICAgICAgICBzcmMs
IGZpcnN0X3NyY19tZW1iZXIpCQkJCSAgIFwNCj4gPj4gUGxlYXNlIGRvbid0IGFkZCBhIGZ1bmN0
aW9uIGxpa2UgdGhpcyBpbnRvIGFtZGdwdS5oLCBlc3BlY2lhbGx5IHdoZW4NCj4gPj4gaXQgaXMg
b25seSB1c2VkIGJ5IHRoZSBTTVUgY29kZS4NCj4gPiBTdXJlLCBJJ20gaGFwcHkgdG8gbW92ZSBp
dC4gSXQgd2Fzbid0IGNsZWFyIHRvIG1lIHdoaWNoIGhlYWRlcnMgd2VyZQ0KPiBjb25zaWRlcmVk
ICJpbW11dGFibGUiLiBXaGljaCBoZWFkZXIgc2hvdWxkIEkgcHV0IHRoaXMgaW4/DQo+IA0KPiBJ
IHRoaW5rIGFtZGdwdV9zbXVpby5oLCBidXQgSSdtIG5vdCAxMDAlIHN1cmUuIEFsZXggZG8geW91
IGhhdmUgYSBiZXR0ZXINCj4gaWRlYT8NCj4gDQoNCk5vLCB0aGF0J3MgZm9yIHRoZSBTTVVJTyBj
YWxsYmFja3MgZm9yIHRoZSBJUCBibG9jay4gIFBsZWFzZSB1c2UgZHJpdmVycy9ncHUvZHJtL2Ft
ZC9wbS9pbmMvYW1kZ3B1X3NtdS5oDQoNCkFsZXgNCg0KPiBXZSBkb24ndCB3YW50IHRvIHB1dCBh
bnl0aGluZyBuZXcgaW50byBhbWRncHUuaCBhbnkgbW9yZSBzaW5jZSB0aGlzIGlzDQo+IGJhc2lj
YWxseSBvbmx5IGEgbGVnYWN5IGxlZnRvdmVyLg0KPiANCj4gVGhhbmtzLA0KPiBDaHJpc3RpYW4u
DQo+IA0KPiA+DQo+ID4+IEFuZCBwbGVhc2UgZ2l2ZSBpdCBhbiBhbWRncHVfIHByZWZpeCBzbyB0
aGF0IHdlIGFyZSBub3QgY29uZnVzaW5nIGl0DQo+ID4+IHdpdGggYSBjb3JlIGZ1bmN0aW9uLg0K
PiA+IFN1cmUsIEkgd2lsbCBpbmNsdWRlIHRoYXQuDQo+ID4NCj4gPj4gQXBhcnQgZnJvbSB0aGF0
IGxvb2tzIGdvb2QgdG8gbWUuDQo+ID4gVGhhbmtzIQ0KPiA+DQo+ID4gLUtlZXMNCg==
