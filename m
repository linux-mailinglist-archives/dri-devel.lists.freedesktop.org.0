Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E8E507FB5
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 05:56:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 915D310F15B;
	Wed, 20 Apr 2022 03:56:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2055.outbound.protection.outlook.com [40.107.236.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A16710F139;
 Wed, 20 Apr 2022 03:56:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T4U+5EppMHv8wAnLIE6TulndxRKld9eeOsS0/TIAtixslJGsMZxUowGbhbsQnI5umwdJQDtFB3QTmgFtq5Pdx7tLh2ABmfDAuLAkuAVgyKLDJsuvzd7jnc90i/naX33YMh1kh1+H8wGVzhglYUUwlRD0K/7G83+yjX95Pk60TuxUer6eVR0nfcLng6C/98EjlRtWTVftm7aSh7zM66fmk/CYqQRSUxA/0g/2FH+OJCFNPbe+gGiArbtleMxKMAwbIIfB2uRLzGs1ay2h0bGCyIpKJ8dzaEgSOTY0NcKjeL7qoVbJoKN0PzD4pCooAcqAgQmOM8GmU+qdDllNWwByuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jD590vIxlxe7SNI6NtBSw1gvX2RPB8fnXkgxWgeSabU=;
 b=gwSVThpmt07SFt+FqL4d8QLGmHf3513OGBmfmPRgKllF4rmpTJCZzhALiZnlpFztDkTsMedmwOMj+ZbRzVrYsh1ABofwss+qUQs1hzaHQkDtaOjJ3v5cVCdaIxJ7TG6kTulKHdvDKdtEL3UpSa+JCmNcos+pxNaGLG9Iwelp++QjWeDdXU/bHI/hRrTiTGCRcC3SgWxIveyOSldwW1HfgZF0s1ENgzMZCFQfRgSDzaQ+2YRlX22z3VLa+IX36ff9I8UuqAf/LgMds26AwcHJNu6UJ7svj8YxHGdnxDgRWmaVzXn6YWkcM21JqyNMNvvHGqz3PpkpzPNp8zRVezYlgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jD590vIxlxe7SNI6NtBSw1gvX2RPB8fnXkgxWgeSabU=;
 b=T1108oRYAmiYNi/yM996ynDeF0cPpDZxqIs/e6BHBl2n9z9LfUT1coegazKOsF4y9SiIPqon5g3MofIawhADFMFXr4OdwxDFZ31pcVNOYIbOuOclePyx1qh1YK8vjcKdrwYXzo8l3Z0VMZLAbIG3Chl66LAQi/C22NmJIu7PqpI=
Received: from BN8PR05MB6611.namprd05.prod.outlook.com (2603:10b6:408:57::15)
 by MN2PR05MB6575.namprd05.prod.outlook.com (2603:10b6:208:e1::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Wed, 20 Apr
 2022 03:56:32 +0000
Received: from BN8PR05MB6611.namprd05.prod.outlook.com
 ([fe80::2cee:3759:958:cf21]) by BN8PR05MB6611.namprd05.prod.outlook.com
 ([fe80::2cee:3759:958:cf21%7]) with mapi id 15.20.5186.013; Wed, 20 Apr 2022
 03:56:32 +0000
From: Zack Rusin <zackr@vmware.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "ckoenig.leichtzumerken@gmail.com" <ckoenig.leichtzumerken@gmail.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 03/15] dma-buf & drm/amdgpu: remove dma_resv workaround
Thread-Topic: [PATCH 03/15] dma-buf & drm/amdgpu: remove dma_resv workaround
Thread-Index: AQHYSl3exfVYH/xFlEu2kvqVBiXOdKz4QIGA
Date: Wed, 20 Apr 2022 03:56:32 +0000
Message-ID: <60ab53ce1ce1333f5e6a15fc83c3c05cd9bd1084.camel@vmware.com>
References: <20220407085946.744568-1-christian.koenig@amd.com>
 <20220407085946.744568-4-christian.koenig@amd.com>
In-Reply-To: <20220407085946.744568-4-christian.koenig@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4-1ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0bd6466a-f830-42d4-d18f-08da2281c1c5
x-ms-traffictypediagnostic: MN2PR05MB6575:EE_
x-ms-exchange-atpmessageproperties: SA|SL
x-microsoft-antispam-prvs: <MN2PR05MB65750E2B8BFB6919304FCE39CEF59@MN2PR05MB6575.namprd05.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: n5JJuxKm6Vw+YlXxLv4LvPxz3NWnW0Co6Jgpk9hQTZp9FRJg2O4dL/29b8fC45JmFs8HD9A2qn6cYMSA5kZdMW4sODfPQChxPPUCMzmUS/Km9p1xVyKeVv9ebSgzDewzGfVOVkiytyY3OnSGLMSIaTnUkirTqwog6E1kkDzxyN0qAWv/GusN5HjThfvJr02Q5nVpU8kbjXiX+cre4LxVeYCX8NNXVSBYEPKH7zGEHoxH21jXvbbGOEAQvHN/B2vZLxyToqZ7DffKGCMP9yarD34QDeO+wULnK5vuDq1ywXKA9e8CtwrZPbUvx2rXo28KcPAP5fblUkMjJtrh16heKqWPZjtZNBY35X8UkpJHg8hl6Q8NYEYp+l7zu5zly7EfD2EhZaxQFd3XCxVRM3pUxh2/OSLgcuuQ7wEWdux0JVTZunq+KhJxZOvXEz8eadUAiG3qcud0OLsQIyjVYbhOe9R1uB2Wlz7SUTmfFp/6C08CV1cW6AheSZRiVqf2ylS+MygPIqt3ASmG1r0wOREjofSNZezhq4mjBSd17EXoFcyFqyAYRACgMlc0IaAsSNqf3wDh/zHHWd7/QjSJVTXZr7nDmjtF9l1SdU3O4cke87R2s0PBLxAiXOnuKDlt1gDEDIrmbBE1tn+8T7RKqMKQHjMmABMFwTqhsBKVc2nVRVAzkh1b7S/pApYgsxW84gdZWN+qKIocAt/+RfC94z3NDA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR05MB6611.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6512007)(6486002)(186003)(8676002)(38070700005)(26005)(91956017)(71200400001)(2906002)(4326008)(76116006)(6506007)(316002)(8936002)(86362001)(45080400002)(5660300002)(508600001)(66946007)(66556008)(64756008)(66476007)(66446008)(66574015)(122000001)(83380400001)(36756003)(110136005)(38100700002)(2616005)(54906003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?enVBQTY4VThoUUYyVnh2dXJQTVNxSXQzWU9PQTUrZXVJd0EwNkNpbUFndytO?=
 =?utf-8?B?N0FxaVRjekEwelUzY3Zqb0NML2t5TlZzdkRodTUyU2xXY29OUkdsYzlXR2Ji?=
 =?utf-8?B?MVNrK1Fab3FLRmtacW5ybG5RQ1FaWmlHWlpBVWZPbDBveWl2cUJHWEMxbUNK?=
 =?utf-8?B?akhFeXlwS2dCTGNqMmpia3dPWjNRejNxWnZSeVYyZTdoMmordkVnWDQ1dVE0?=
 =?utf-8?B?RnBSZEhuREwvZUtpUlAvZXBPbUtTMUZYN2czd1l5L24rOWY2YnRGV05yTlhR?=
 =?utf-8?B?dzJqM1JyZFh2ZTd5Q3hibG5YZ2YwTExrMUVOV2JSYXVMRXFjU2o0THF4aHJo?=
 =?utf-8?B?Wm5NK3VHU2Nsb05xSXNjaDhJckFueXZZcUtLZllabmhYQURiMFo2MU8zU0xx?=
 =?utf-8?B?R0xCUEFWL0IrbThuMWZYYktjQTR4bi9BSFNjbk9QUHFOSlFBQXFsZlNzYnVN?=
 =?utf-8?B?aXpGK0tLaWtzQWRKS00xa010eVRqaWh0dTBZSmVkMDhBNjVycFJJdTRLeUZt?=
 =?utf-8?B?akJNdWNobkIrZHpCeXplMk5lSkRnanBhY1hpbXo4eGlqcnhKMW1tc0JBUXE4?=
 =?utf-8?B?Q3Y4YWNOODU5K3IzUHZkZHpqUElhSERLSWp0dndUaUJ0dHd1djRzUlBlVWFn?=
 =?utf-8?B?SEdnbHhFRjJFSkxqOXV3Ti9xRG00Mk9NYkhLUVJsVGJaUW1QZEVOSXRzaC84?=
 =?utf-8?B?TEpUcERqbmhkOWhaT1dlazB2NGJRZm5JWDVFT0k1ZzdPbE1CYjYxRnhBak9L?=
 =?utf-8?B?Z0NRR1JVcTlOVlNYSE03UmxtMVpqaWZsb0FiY3NTZTA4cmpmKzdCL2EwZkxh?=
 =?utf-8?B?UVUvZ0dBRThVa1pPUEZqbmk2MXBkYUZiMUhzSWJ6MWpDRXR6WlBGTHhLVzlR?=
 =?utf-8?B?WHk2bzEycVgvaEJjOWNXQnU4QTVnTys3akt4eVhOVDc1cnlzSXBEUUdBV0Fr?=
 =?utf-8?B?SUxGaHE4SjByRFczWk8yVkNnbXdpOFJEUHl1VU9UQ3g4dGJxNm04d0dwcy9h?=
 =?utf-8?B?dXAyY1I4Sm9ManZpeE1JbnJWQTl1aWVyNzhQWUZDYUxFOXUvWGYrQmNSTUVw?=
 =?utf-8?B?RjN2QmpvQWNyZDRla0NxLzFjMVJ1aGV5bFp3MmVpMUNJeG10dXVMRXRTeUhH?=
 =?utf-8?B?S0xPL1NOMFM2WFdlL0c5ZUNLQnFCbzdJS1NZY1gxL21vZWRlREFIV1JETVNU?=
 =?utf-8?B?UEpWakxvL0RqRmFrRW1RMlhhbkkzOENPUGdRbFM0bmVYbnp5dEZzVGVad0ov?=
 =?utf-8?B?eWpiUHRVU0ZNTFBUbWNGNFAvMVVQYk1YR2NDdnAwTTdLT0Y2Ync0SVRyZU1P?=
 =?utf-8?B?eG5xQkpjYlY1U21hdEQ2ZHplRy9TY1dBTGoxTm9NWHFQN3BTYmNsejZTZnc1?=
 =?utf-8?B?QmpoWlZxZkZVcGUvdUF6dmV4bXYyYWRIM3ZmeWQyZ3cwdzViSGpjWFBZNVZ1?=
 =?utf-8?B?eDdyYUMydWhoeUNDZ2o3ajRkUzBlNlF1ZW5WTUJVUTRVVS9KM0JjN01TS1VK?=
 =?utf-8?B?YzAycXM3aC8zRUxJU09qVWN0ZmNFT2VHUTJQV3BUK05iVk9Cc0dRK1l2RVVW?=
 =?utf-8?B?ZjE4OVlHL3JsN1o3eVJaSUpTa2hrSWhNTnVoTkZ3OXB6dlViZ09JbzIrNGJM?=
 =?utf-8?B?MmI5dEV1ZkdZMkh2VGxvK085NnI1aExNQlNuVUxBSWw4OFZrVVhHNGlrZG5k?=
 =?utf-8?B?dDlPMElZeHFCNkJtOWJYbjVjMW5KS2xjdDdQZEdtS1I4STFIUHV1aS9OeGRY?=
 =?utf-8?B?RUFXUFVRRmdLWHFnWWxyRmxBbjNiMjFrOWlrOXpSY3pTRGZzTDN4cWRralRX?=
 =?utf-8?B?SDZvV3RUMjVVNnI4ZTZkeW1YdStGM0ljVlVkYXlTMHFGTFFXcTc5bEdUL2R6?=
 =?utf-8?B?TllKS0JoMCtRV01yVkgzR3hwa0Z0NzhpVHplbDRxQXk2T0xzaDZSaGh2YTR3?=
 =?utf-8?B?cGtSNEVsMXhlZTl0VVhRSElrZXovbkRicXhEbGg5ZHZjSWNIamNDM3c3WG95?=
 =?utf-8?B?OFk0ZktHMHBZa0pOOFNxRUhIMVBMQmJFWmF3R0tKeUZRNzBMdndkTlRKRGFU?=
 =?utf-8?B?Rnp6Q0JPbUdKSXJLZExMUmlENkt0UnNQNDJDUFdsajdIcmh5RFh6ZUYyYVIx?=
 =?utf-8?B?Wm8wUDAzYVpxZGZpYmV5OVNSR3RVcTJqMlRwRStucXBWZ3Z2aXZsVklKdDkw?=
 =?utf-8?B?bkJDVk1PSmx5Rkk2Yk1yelN2TWZvYjFyWUtJUmlyb0ZKcTVibTVxWG9qRWhz?=
 =?utf-8?B?MStxbjB6MWEyMHBpTVlZN0U4NmhWZ0NEUVdRNTRzVlNNc0RoaTBPcTRiRHYy?=
 =?utf-8?B?a2U2Y0tmR1czSWo5YkFzeDBYMnROdktGV3BlR3AweDB1QkZwY2FYZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C4B61BDFB43A7B43AE4D1D299DE98DC9@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR05MB6611.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bd6466a-f830-42d4-d18f-08da2281c1c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2022 03:56:32.3282 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BRLH99om0wPHRiQf072NfsNLOnhjrXkblItiPOPO3MSU8WEzTR2l/H4PImtU+a+FbqnS9gvCXW81X2/9sleK1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR05MB6575
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
Cc: "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDIyLTA0LTA3IGF0IDEwOjU5ICswMjAwLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3Rl
Og0KPiBSZXdvcmsgdGhlIGludGVybmFscyBvZiB0aGUgZG1hX3Jlc3Ygb2JqZWN0IHRvIGFsbG93
IGFkZGluZyBtb3JlIHRoYW4NCj4gb25lDQo+IHdyaXRlIGZlbmNlIGFuZCByZW1lbWJlciBmb3Ig
ZWFjaCBmZW5jZSB3aGF0IHB1cnBvc2UgaXQgaGFkLg0KPiANCj4gVGhpcyBhbGxvd3MgcmVtb3Zp
bmcgdGhlIHdvcmthcm91bmQgZnJvbSBhbWRncHUgd2hpY2ggdXNlZCBhIGNvbnRhaW5lcg0KPiBm
b3INCj4gdGhpcyBpbnN0ZWFkLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5p
ZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPg0KPiBSZXZpZXdlZC1ieTogRGFuaWVsIFZldHRl
ciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4NCj4gQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnDQoNCg0KYWZhaWN0IHRoaXMgY2hhbmdlIGJyb2tlIHZtd2dmeCB3aGljaCBub3cga2Vy
bmVsIG9vcHMgcmlnaHQgYWZ0ZXIgYm9vdC4NCkkgaGF2ZW4ndCBoYWQgdGhlIHRpbWUgdG8gbG9v
ayBpbnRvIGl0IHlldCwgc28gSSdtIG5vdCBzdXJlIHdoYXQncyB0aGUNCnByb2JsZW0uIEknbGwg
bG9vayBhdCB0aGlzIHRvbW9ycm93LCBidXQganVzdCBpbiBjYXNlIHlvdSBoYXZlIHNvbWUNCmNs
dWVzLCB0aGUgYmFja3RyYWNlIGZvbGxvd3M6DQoNCiAtLS0tLS0tLS0tLS1bIGN1dCBoZXJlIF0t
LS0tLS0tLS0tLS0NCiBrZXJuZWwgQlVHIGF0IGRyaXZlcnMvZG1hLWJ1Zi9kbWEtcmVzdi5jOjMw
NiENCiBpbnZhbGlkIG9wY29kZTogMDAwMCBbIzFdIFBSRUVNUFQgU01QIFBUSQ0KIENQVTogMSBQ
SUQ6IDE2MDggQ29tbTogZ25vbWUtc2hlbGwgTm90IHRhaW50ZWQgNS4xOC4wLXJjMS12bXdnZngg
IzE4DQogSGFyZHdhcmUgbmFtZTogVk13YXJlLCBJbmMuIFZNd2FyZSBWaXJ0dWFsIFBsYXRmb3Jt
LzQ0MEJYIERlc2t0b3ANClJlZmVyZW5jZSBQbGF0Zm9ybSwgQklPUyA2LjAwIDExLzEyLzIwMjAN
CiBSSVA6IDAwMTA6ZG1hX3Jlc3ZfYWRkX2ZlbmNlKzB4MmVkLzB4MzAwDQogQ29kZTogZmYgZmYg
YmUgMDEgMDAgMDAgMDAgZTggMzEgN2QgZDkgZmYgZTkgODAgZmQgZmYgZmYgYmUgMDMgMDAgMDAN
CjAwIGU4IDIyIDdkIGQ5IGZmIGU5IGVlIGZlIGZmIGZmIDBmIDFmIDQ0IDAwIDAwIGU5IGJjIGZl
IGZmIGZmIDwwZj4gMGINCmU4IDRjIGNjIDQ1IDAwIDY2IDY+DQogUlNQOiAwMDE4OmZmZmZhMWU2
ODQ2YzNhYjAgRUZMQUdTOiAwMDAxMDI0Ng0KIFJBWDogMDAwMDAwMDAwMDAwMDAwMCBSQlg6IGZm
ZmY5NGM1YzU1MDcxMzggUkNYOiA5MDJiYzI0ZTdiN2M3MGFlDQogUkRYOiA5MDJiYzI0ZTdiN2M3
MGFlIFJTSTogZmZmZmZmZmZhYWY3ZjQzNyBSREk6IGZmZmZmZmZmYWFmZmRlNjYNCiBSQlA6IGZm
ZmZhMWU2ODQ2YzNiMDggUjA4OiAwMDAwMDAwMDAwMDAwMDAwIFIwOTogMDAwMDAwMDAwMDAwMDAw
MQ0KIFIxMDogMDAwMDAwMDAwMDAwMDAwNCBSMTE6IDAwMDAwMDAwMDAwMDAwMDAgUjEyOiBmZmZm
OTRjNWNiYTkwNTc4DQogUjEzOiAwMDAwMDAwMDAwMDAwMDAwIFIxNDogZmZmZjk0YzVjYmE4YmMw
MCBSMTU6IDAwMDAwMDAwMDAwMDAwMDANCiBGUzogIDAwMDA3ZjlhMTdjNmU2MDAoMDAwMCkgR1M6
ZmZmZjk0YzZmOWU0MDAwMCgwMDAwKQ0Ka25sR1M6MDAwMDAwMDAwMDAwMDAwMA0KIENTOiAgMDAx
MCBEUzogMDAwMCBFUzogMDAwMCBDUjA6IDAwMDAwMDAwODAwNTAwMzMNCiBDUjI6IDAwMDA3Zjlh
MTQxMTMwMDAgQ1IzOiAwMDAwMDAwMDAxNDRjMDAzIENSNDogMDAwMDAwMDAwMDM3MDZlMA0KIENh
bGwgVHJhY2U6DQogIDxUQVNLPg0KICB0dG1fZXVfZmVuY2VfYnVmZmVyX29iamVjdHMrMHg1NC8w
eDExMCBbdHRtXQ0KICB2bXdfZXhlY2J1Zl9wcm9jZXNzKzB4Y2FlLzB4MTJhMCBbdm13Z2Z4XQ0K
ICA/IHZtd19leGVjYnVmX3JlbGVhc2VfcGlubmVkX2JvKzB4NjAvMHg2MCBbdm13Z2Z4XQ0KICB2
bXdfZXhlY2J1Zl9pb2N0bCsweGZiLzB4MTYwIFt2bXdnZnhdDQogID8gdm13X2V4ZWNidWZfcmVs
ZWFzZV9waW5uZWRfYm8rMHg2MC8weDYwIFt2bXdnZnhdDQogIGRybV9pb2N0bF9rZXJuZWwrMHhi
YS8weDE1MCBbZHJtXQ0KICA/IF9fbWlnaHRfZmF1bHQrMHg3Ny8weDgwDQogIGRybV9pb2N0bCsw
eDI0Ny8weDQ2MCBbZHJtXQ0KICA/IHZtd19leGVjYnVmX3JlbGVhc2VfcGlubmVkX2JvKzB4NjAv
MHg2MCBbdm13Z2Z4XQ0KICA/IGZpbmRfaGVsZF9sb2NrKzB4MzEvMHg5MA0KICA/IF9fZmdldF9m
aWxlcysweGM1LzB4MTkwDQogID8gX190aGlzX2NwdV9wcmVlbXB0X2NoZWNrKzB4MTMvMHgyMA0K
ICA/IGxvY2tfcmVsZWFzZSsweDE0Mi8weDJmMA0KICA/IGRybV9pb2N0bF9rZXJuZWwrMHgxNTAv
MHgxNTAgW2RybV0NCiAgdm13X2dlbmVyaWNfaW9jdGwrMHhhMy8weDExMCBbdm13Z2Z4XQ0KICB2
bXdfdW5sb2NrZWRfaW9jdGwrMHgxNS8weDIwIFt2bXdnZnhdDQogIF9feDY0X3N5c19pb2N0bCsw
eDkxLzB4YzANCiAgZG9fc3lzY2FsbF82NCsweDNiLzB4OTANCiAgZW50cnlfU1lTQ0FMTF82NF9h
ZnRlcl9od2ZyYW1lKzB4NDQvMHhhZQ0KIFJJUDogMDAzMzoweDdmOWExYWYxYWFmZg0KIENvZGU6
IDAwIDQ4IDg5IDQ0IDI0IDE4IDMxIGMwIDQ4IDhkIDQ0IDI0IDYwIGM3IDA0IDI0IDEwIDAwIDAw
IDAwIDQ4DQo4OSA0NCAyNCAwOCA0OCA4ZCA0NCAyNCAyMCA0OCA4OSA0NCAyNCAxMCBiOCAxMCAw
MCAwMCAwMCAwZiAwNSA8NDE+IDg5DQpjMCAzZCAwMCBmMCBmZiBmZiA3Pg0KIFJTUDogMDAyYjow
MDAwN2ZmZDgzMzY5NmMwIEVGTEFHUzogMDAwMDAyNDYgT1JJR19SQVg6IDAwMDAwMDAwMDAwMDAw
MTANCiBSQVg6IGZmZmZmZmZmZmZmZmZmZGEgUkJYOiAwMDAwN2ZmZDgzMzY5NzgwIFJDWDogMDAw
MDdmOWExYWYxYWFmZg0KIFJEWDogMDAwMDdmZmQ4MzM2OTc4MCBSU0k6IDAwMDAwMDAwNDAyODY0
NGMgUkRJOiAwMDAwMDAwMDAwMDAwMDBkDQogUkJQOiAwMDAwMDAwMDQwMjg2NDRjIFIwODogMDAw
MDAwMDAwMDAwMTI0OCBSMDk6IDAwMDA3ZmZkODMzNjk4MDgNCiBSMTA6IDAwMDAwMDAwMDAwMDAw
MDggUjExOiAwMDAwMDAwMDAwMDAwMjQ2IFIxMjogMDAwMDdmZmQ4MzM2OTgwOA0KIFIxMzogMDAw
MDAwMDAwMDAwMDAwZCBSMTQ6IDAwMDA1NTcxOWNiNjI5YzAgUjE1OiAwMDAwN2ZmZDgzMzY5ODA4
DQogIDwvVEFTSz4NCiBNb2R1bGVzIGxpbmtlZCBpbjogb3ZlcmxheSBzbmRfZW5zMTM3MSBpbnRl
bF9yYXBsX21zciBzbmRfYWM5N19jb2RlYw0KaW50ZWxfcmFwbF9jb21tb24gYWM5N19idXMgdnNv
Y2tfbG9vcGJhY2sNCnZtd192c29ja192aXJ0aW9fdHJhbnNwb3J0X2NvbW1vbiB2bXdfdnNvY2tf
dm1jaT4NCiAtLS1bIGVuZCB0cmFjZSAwMDAwMDAwMDAwMDAwMDAwIF0tLS0NCg0Keg0K
