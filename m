Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C963F9501
	for <lists+dri-devel@lfdr.de>; Fri, 27 Aug 2021 09:21:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 726536E073;
	Fri, 27 Aug 2021 07:20:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2042.outbound.protection.outlook.com [40.107.212.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A22AD6E06E;
 Fri, 27 Aug 2021 07:20:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hdurhq+UeRwvL6ri5+gKRcM1wAjp8PqR1glWHy24AZKtxgrKxqqODXgcq8gniJ3cGJWV+dUF3CaTFQv75iuq2X2PVwJYyz69xpUyAh1oOsD65lo4G3GzwJisAepOPdPteYBTiV4+H2OlgVhWdiNjVtLQ9ikSFKwFHHtzzxcMiCWwdfMxNQBf0chUySgCtt7YCKhizbSu2XjyVoFye2vBzbncHAXAheoDZdzp0K76fdxkKrmeppKyqLMFEvrq6O5mYxRb/6/GRvQheKFizE2P6LAnDPsHDaPMTC0aHW+cWmh7GkXhWyDqrDZkHHslJ1ItPKkww7AUBKeZWm0g+cML/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bxU0cZKOQuheP5z5oZu50xGOg4MgfefEYvufRKFGFpI=;
 b=OANBbFUkI4MyCaHp6tRlC4WkZEjvob4gliApnj1C0DZJ4GibHTK/UFfAs38wXzi41K5woUn+f2WTzxZ6Fj6E2fMiVHrPV1b1OnMgZT1DxyUMAj8PhIqx28gM4iL1pddJ1NMicxXQSsGQ6q37gShrStPVDnYSZXibb/U1CqaRGghIM2AKeDTzfJ1wSICjdHDbr8vELemdn1IYXIAuGb0lskZY7xWj1E+yQfY9Vn1T1hldJ7MRcRCbnEH2DNj4IsntiH2YrOEsryY9M++5hN2C8J8oYikS3Qxf3YGm4a4FVVSU4nYy4vLvK5e6l6dwEslLcKYU3OKsEOzMBbf+78aGYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bxU0cZKOQuheP5z5oZu50xGOg4MgfefEYvufRKFGFpI=;
 b=NcatrWBw37E6FdoZm0COkfdBNXe0Fx5ZtFKNBD5X4HvmBf3jGnigSq3a8wKehP8W4zy46UJ5mO3WlezfjwH799cF7hN2r3bQUiM8y0s/KfFzXRKMd7sGgNvM9tlDklpfBOTvoD0Okg2DbGQP8JwngCNwP5A+hpcyVyBn4nl8DwE=
Received: from BL1PR12MB5269.namprd12.prod.outlook.com (2603:10b6:208:30b::20)
 by BL1PR12MB5269.namprd12.prod.outlook.com (2603:10b6:208:30b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.21; Fri, 27 Aug
 2021 07:20:51 +0000
Received: from BL1PR12MB5269.namprd12.prod.outlook.com
 ([fe80::acc6:c407:1353:6a]) by BL1PR12MB5269.namprd12.prod.outlook.com
 ([fe80::acc6:c407:1353:6a%5]) with mapi id 15.20.4436.024; Fri, 27 Aug 2021
 07:20:51 +0000
From: "Liu, Monk" <Monk.Liu@amd.com>
To: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH] drm/sched: fix the bug of time out calculation(v3)
Thread-Topic: [PATCH] drm/sched: fix the bug of time out calculation(v3)
Thread-Index: AQHXmjadxsIrIGn2Y02EiNcylnR376uF0cOAgABnvwCAALnqcA==
Date: Fri, 27 Aug 2021 07:20:51 +0000
Message-ID: <BL1PR12MB5269AAC2FA518CF85724C85D84C89@BL1PR12MB5269.namprd12.prod.outlook.com>
References: <1629953731-14629-1-git-send-email-Monk.Liu@amd.com>
 <20419179-ee90-45aa-f4b8-b6bcb20a9c52@amd.com>
 <cc01416c-c04e-a716-f617-71351c1ad06a@amd.com>
In-Reply-To: <cc01416c-c04e-a716-f617-71351c1ad06a@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=true;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2021-08-27T07:20:47Z; 
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD Official Use
 Only-AIP 2.0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ActionId=62f47130-46ba-4198-8723-46775fe913e9;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=1
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0dd1df0a-5597-4000-ff59-08d9692b333e
x-ms-traffictypediagnostic: BL1PR12MB5269:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL1PR12MB52694E332958426E5BC26DB484C89@BL1PR12MB5269.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:398;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8/x0Z1I0VmUvzeHLHsNGtX7zqPhkYrWTCAjNt4GxmeoDT5AOh2xej1vlPFBHVtNGf5/HBlfS4LYjCk6xc+LZb/ZPpgye74uwPlxwkAtSkPsEX2JmamoujuyBqToeB29qkgXyzwIFgu14cDAjy2pYDbp7/jgthtgDyOv+3+SeGOhw8mjQbiFcrvLxm/ZI1Y1D5RMZxLEeFTjtS+85bkMXNF+KdLerQYnaIGDwUIzKFUuFlQmzefEapjKlB/rIBHMO6t6YAQL5zqgA/FemWMUZNL/smRfVQw2Cb5EG1aGcv53j1qACD0Prhg00nVdBtSS16wVMbxVXyYwPJ6yxh05zL/D2mXq2FlH872UUK85ox2hS2Mic5a3M49PeTZMlmWBc0hzwz4F5TeBU3cb9mj5D2pq8WnCBsMOiZWpojZcxhF/Gt2ey8G+OFU1Fh3YjOQ6OAIjPqifJqqCf2PK1c/6tcnwdkUEHI9xuMWyQJd0UW8+qh3420Re6ulovBsJe2T5TRHQJDr5gcmyHMxMovkyJupGyDz7B+B2objsi5SpbLfrSzDpWWqei1T/3l3aj2Lt8Fqnm2IKLXrkYbHov7RHbIdssBZr4L1y3n0/gy2w+gguAallxtAxnZ+9SD/dQVNMgfbSXuoutNH53NMKklz84cfQKy8wxCUUPwgoqjPr1bxFkMCrQgKK8/aPTJwD/55lH1SdeP4g1YzRLkUWLIVKWpA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5269.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(396003)(346002)(376002)(39860400002)(6506007)(83380400001)(53546011)(122000001)(26005)(450100002)(55016002)(66946007)(9686003)(64756008)(76116006)(66476007)(86362001)(2906002)(66556008)(33656002)(38100700002)(478600001)(8676002)(38070700005)(66446008)(7696005)(71200400001)(52536014)(8936002)(5660300002)(110136005)(4326008)(6636002)(186003)(316002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MzZGUE9aK2NGWFhUUkRUTXg1cUNuTmViaVZjUjVRQ3ZobWFPM2ZSTGxZQ3FZ?=
 =?utf-8?B?TkZXUWtCdlU2N2JIeU5oNUVkWHZzVXdwY2xrWEt6VFNjbFJZTlN2aWlkM0Jy?=
 =?utf-8?B?eDRJSXpJUzd1Z2JvMEQ4QmpPRC9SWUlHS3lFS1cwbG9CblhoNy8rUDVhMG5V?=
 =?utf-8?B?dVU4VFZscE9jYTJGZzVaOFZoZSs5R29URVAwdC9TSWdRMVhTaitsSllGZzQw?=
 =?utf-8?B?T05xNmIxV1JTUmdHeHRBZ0x0VTMvdjFRWHNya1NmL2ZvMkJHR1cxdy9tMmQr?=
 =?utf-8?B?ZWRPMC95YXZHWk12bGtYM3h5UnhIWWdETzdUZmZGRXdlSlZKNkFrc0xycVR1?=
 =?utf-8?B?dE1oV2V6OHo0UDJmaDk3MThNNWJOYlc3cHE1cXdXWWhpQkY2bE5JeHdNaG1o?=
 =?utf-8?B?cG1seDJUUEt5cEpRUzN3LzdpbnlWVXBidjYvdHpEMlc0L0FEQ0NtT016Tjl5?=
 =?utf-8?B?Q29ERWQ2elp0c1BEQXdnWUZRcGNQRWRybVIxUmVoa29VOWN5OWZTZTdjVEVS?=
 =?utf-8?B?dHlyb1EvVU9nOUdiRzg2NzRqQjcyK0tud04weXFBZ3NONGlnQWV5eFp6Rjlk?=
 =?utf-8?B?MGEwdmZxa2Rud2E2a3Y1UHNRS0RxZ2lsK2VSVnlTYi9wYmZTa2d0TFhQdmh4?=
 =?utf-8?B?dWN4Qm9TeElEaFBTYTRDZlU2cXAvRTR3TEJBY2hKSDR4VWR3QTBEeGlXc2tq?=
 =?utf-8?B?QnFTQ3dWdi9NeU9abXhCbHVhVVdKT1NHdWpqMjcwUXUyL2swS3lMaDFqWTVS?=
 =?utf-8?B?VWNETWQ2VmF2bXNmbW1GREdXYmFmaytFN1hBc0hoRjNnUGk1R2w5UzA4anJQ?=
 =?utf-8?B?TFRySUdiVVFncWhJcmhuQ3FHeWRrelRKT3JRcit4UGFZUU0weEFVZG5nZTBK?=
 =?utf-8?B?cE1GSXpkczNGZUZhV0k2aU9ISkgwRjBROTF4ZTZabmlETlVIKzFyQkVpc3N1?=
 =?utf-8?B?WVRDNEtLTUZFTXVWSHJuUXNoWTlVNUc3RkluYmNZeCtsQjR6Tkhyb3lreGtz?=
 =?utf-8?B?YnNuWkduV1hkMHMzUnBlZXkva1BFRnpvUkY4RG90dC9uZzFYWXhTWWlTbVJB?=
 =?utf-8?B?ZjR5TWFxbFVicUhXekptYmFHOE5ZRGFGKysxZjJadVFUMDFNTUlucnZXRVRs?=
 =?utf-8?B?cEtpSjloaXlwN2wwRXhBM25ScFVaeG1BU1lvWUViTTdmZW9oU0pVRkFYdVkw?=
 =?utf-8?B?Q3J1U1RzcTZOYWFNUllqbVdOWjMxNVNBTTIycTZ0NWdBWThDOSszVUVPaUJ2?=
 =?utf-8?B?VjVjbmpiWnQ0QVFIL3lOU29UY2s2a3VTMkMrN0lTeUl5L0VRckl0TlAwTjVr?=
 =?utf-8?B?Ly9ZMnFNeXVQQTNTU1kxbW5GTEh1TVZCMzFCZXVmQWtoQ2Q2ckkyVFpoVnZX?=
 =?utf-8?B?OG9odUgrMVQ3Q3dEUHRlV2g5cEtRMmJsSllUUCtHNWVqMDZTWHc1a3RzOTFu?=
 =?utf-8?B?MVMzTWpGNldqTExWNjZLUlRrS054bUFCbG51TXlSODBMTklPcFZLYlZIa25j?=
 =?utf-8?B?dTRwTWtQenVqa1hJSUpvRDFNNWtjODVtMmE5OUUrSEEzcVZ0Y3ZwakFYd0hQ?=
 =?utf-8?B?UEJvS0FtV0JScjNuZWlxZUU0TVBxTDlFSVI1eWEzTFN5eUprcGlxdHpDRzF1?=
 =?utf-8?B?N0ZvL2Nheng1WXFjT0szNEFzMWt6TEhCdStBck5ocWdwRk4wOTA4NkEvTnF3?=
 =?utf-8?B?cGlxK3ZUR0tWeU5vNTBnYlVaazJpbEFwdWlrb0RESWZsTmMvOU1iU0JoOW12?=
 =?utf-8?Q?i8JougumvNmwXkioV2KeK4YXi5V/ck3p6IO5dRh?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5269.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dd1df0a-5597-4000-ff59-08d9692b333e
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2021 07:20:51.2558 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QRa6KYmk320mDmLMnp6+V5wldHO6Pix9/7twmTTBTqrWMd8QAH6RbKE5Zt5d3Ofe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5269
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

W0FNRCBPZmZpY2lhbCBVc2UgT25seV0NCg0Kd2hhdCBpcyB0aGF0ICd0cycgcmVwcmVzZW50aW5n
IGZvciA/IGl0IGxvb2tzIHRvIG1lIHRoZSBqaWZmaWVzIHRoYXQgaXQgZ2V0IHNjaGVkdWxlZCB0
byB0aGUgcmluZywgIGJ1dCBhIGpvYiBzY2hlZHVsZWQgdG8gdGhlIHJpbmcgZG9lc24ndCByZXBy
ZXNlbnQgaXQncyBiZWluZyBwcm9jZXNzZWQgYnkgaHcuDQoNClRoYW5rcyANCg0KLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQpNb25rIExpdSB8IENsb3VkLUdQVSBD
b3JlIHRlYW0NCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KDQot
LS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogR3JvZHpvdnNreSwgQW5kcmV5IDxBbmRy
ZXkuR3JvZHpvdnNreUBhbWQuY29tPg0KU2VudDogRnJpZGF5LCBBdWd1c3QgMjcsIDIwMjEgNDox
NCBBTQ0KVG86IExpdSwgTW9uayA8TW9uay5MaXVAYW1kLmNvbT47IGFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnOyBLb2VuaWcsIENocmlzdGlhbiA8Q2hyaXN0aWFuLktvZW5pZ0BhbWQuY29t
Pg0KQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNClN1YmplY3Q6IFJlOiBbUEFU
Q0hdIGRybS9zY2hlZDogZml4IHRoZSBidWcgb2YgdGltZSBvdXQgY2FsY3VsYXRpb24odjMpDQoN
CkF0dGFjaGVkIHF1aWNrIHBhdGNoIGZvciBwZXIgam9iIFRUTCBjYWxjdWxhdGlvbiB0byBtYWtl
IG1vcmUgcHJlY2lzZXMgbmV4dCB0aW1lciBleHBpcmF0aW9uLiBJdCdzIG9uIHRvcCBvZiB0aGUg
cGF0Y2ggaW4gdGhpcyB0aHJlYWQuIExldCBtZSBrbm93IGlmIHRoaXMgbWFrZXMgc2Vuc2UuDQoN
CkFuZHJleQ0KDQpPbiAyMDIxLTA4LTI2IDEwOjAzIGEubS4sIEFuZHJleSBHcm9kem92c2t5IHdy
b3RlOg0KPg0KPiBPbiAyMDIxLTA4LTI2IDEyOjU1IGEubS4sIE1vbmsgTGl1IHdyb3RlOg0KPj4g
aXNzdWU6DQo+PiBpbiBjbGVhbnVwX2pvYiB0aGUgY2FuY2xlX2RlbGF5ZWRfd29yayB3aWxsIGNh
bmNlbCBhIFRPIHRpbWVyIGV2ZW4gDQo+PiB0aGUgaXRzIGNvcnJlc3BvbmRpbmcgam9iIGlzIHN0
aWxsIHJ1bm5pbmcuDQo+Pg0KPj4gZml4Og0KPj4gZG8gbm90IGNhbmNlbCB0aGUgdGltZXIgaW4g
Y2xlYW51cF9qb2IsIGluc3RlYWQgZG8gdGhlIGNhbmNlbGxpbmcgDQo+PiBvbmx5IHdoZW4gdGhl
IGhlYWRpbmcgam9iIGlzIHNpZ25hbGVkLCBhbmQgaWYgdGhlcmUgaXMgYSAibmV4dCIgam9iIA0K
Pj4gd2Ugc3RhcnRfdGltZW91dCBhZ2Fpbi4NCj4+DQo+PiB2MjoNCj4+IGZ1cnRoZXIgY2xlYW51
cCB0aGUgbG9naWMsIGFuZCBkbyB0aGUgVERSIHRpbWVyIGNhbmNlbGxpbmcgaWYgdGhlIA0KPj4g
c2lnbmFsZWQgam9iIGlzIHRoZSBsYXN0IG9uZSBpbiBpdHMgc2NoZWR1bGVyLg0KPj4NCj4+IHYz
Og0KPj4gY2hhbmdlIHRoZSBpc3N1ZSBkZXNjcmlwdGlvbg0KPj4gcmVtb3ZlIHRoZSBjYW5jZWxf
ZGVsYXllZF93b3JrIGluIHRoZSBiZWdpbmluZyBvZiB0aGUgY2xlYW51cF9qb2IgDQo+PiByZWNv
dmVyIHRoZSBpbXBsZW1lbnQgb2YgZHJtX3NjaGVkX2pvYl9iZWdpbi4NCj4+DQo+PiBUT0RPOg0K
Pj4gMSlpbnRyb2R1Y2UgcGF1c2UvcmVzdW1lIHNjaGVkdWxlciBpbiBqb2JfdGltZW91dCB0byBz
ZXJpYWwgdGhlIA0KPj4gaGFuZGxpbmcgb2Ygc2NoZWR1bGVyIGFuZCBqb2JfdGltZW91dC4NCj4+
IDIpZHJvcCB0aGUgYmFkIGpvYidzIGRlbCBhbmQgaW5zZXJ0IGluIHNjaGVkdWxlciBkdWUgdG8g
YWJvdmUgDQo+PiBzZXJpYWxpemF0aW9uIChubyByYWNlIGlzc3VlIGFueW1vcmUgd2l0aCB0aGUg
c2VyaWFsaXphdGlvbikNCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBNb25rIExpdSA8TW9uay5MaXVA
YW1kLmNvbT4NCj4+IC0tLQ0KPj4gwqAgZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9t
YWluLmMgfCAyNQ0KPj4gKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLQ0KPj4gwqAgMSBmaWxlIGNo
YW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDE1IGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYw0KPj4gYi9kcml2ZXJz
L2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYw0KPj4gaW5kZXggYTJhOTUzNi4uZWNmODE0
MCAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5j
DQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYw0KPj4gQEAg
LTY3NiwxMyArNjc2LDcgQEAgZHJtX3NjaGVkX2dldF9jbGVhbnVwX2pvYihzdHJ1Y3QgDQo+PiBk
cm1fZ3B1X3NjaGVkdWxlciAqc2NoZWQpDQo+PiDCoCB7DQo+PiDCoMKgwqDCoMKgIHN0cnVjdCBk
cm1fc2NoZWRfam9iICpqb2IsICpuZXh0Ow0KPj4gwqAgLcKgwqDCoCAvKg0KPj4gLcKgwqDCoMKg
ICogRG9uJ3QgZGVzdHJveSBqb2JzIHdoaWxlIHRoZSB0aW1lb3V0IHdvcmtlciBpcyBydW5uaW5n
IE9SIA0KPj4gdGhyZWFkDQo+PiAtwqDCoMKgwqAgKiBpcyBiZWluZyBwYXJrZWQgYW5kIGhlbmNl
IGFzc3VtZWQgdG8gbm90IHRvdWNoIHBlbmRpbmdfbGlzdA0KPj4gLcKgwqDCoMKgICovDQo+PiAt
wqDCoMKgIGlmICgoc2NoZWQtPnRpbWVvdXQgIT0gTUFYX1NDSEVEVUxFX1RJTUVPVVQgJiYNCj4+
IC3CoMKgwqDCoMKgwqDCoCAhY2FuY2VsX2RlbGF5ZWRfd29yaygmc2NoZWQtPndvcmtfdGRyKSkg
fHwNCj4+IC3CoMKgwqDCoMKgwqDCoCBrdGhyZWFkX3Nob3VsZF9wYXJrKCkpDQo+PiArwqDCoMKg
IGlmIChrdGhyZWFkX3Nob3VsZF9wYXJrKCkpDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJu
IE5VTEw7DQo+DQo+DQo+IEkgYWN0dWFsbHkgZG9uJ3Qgc2VlIHdoeSB3ZSBuZWVkIHRvIGtlZXAg
dGhlIGFib3ZlLCBvbiB0aGUgb3RoZXIgc2lkZSANCj4gKGluIGRybV9zY2hlZF9zdG9wKSB3ZSB3
b24ndCB0b3VjaCB0aGUgcGVuZGluZyBsaXN0IGFueXdheSB1bnRpbCBzY2hlZCANCj4gdGhyZWFk
IGNhbWUgdG8gZnVsbCBzdG9wIChrdGhyZWFkX3BhcmspLiBJZiB5b3UgZG8gc2VlIGEgcmVhc29u
IHdoeSANCj4gdGhpcyBuZWVkZWQgdGhlbiBhIGNvbW1lbnQgc2hvdWxkIGJlIGhlcmUgaSB0aGlu
ay4NCj4NCj4gQW5kcmV5DQo+DQo+DQo+PiBzcGluX2xvY2soJnNjaGVkLT5qb2JfbGlzdF9sb2Nr
KTsNCj4+IEBAIC02OTMsMTcgKzY4NywyMSBAQCBkcm1fc2NoZWRfZ2V0X2NsZWFudXBfam9iKHN0
cnVjdCANCj4+IGRybV9ncHVfc2NoZWR1bGVyICpzY2hlZCkNCj4+IMKgwqDCoMKgwqAgaWYgKGpv
YiAmJiBkbWFfZmVuY2VfaXNfc2lnbmFsZWQoJmpvYi0+c19mZW5jZS0+ZmluaXNoZWQpKSB7DQo+
PiDCoMKgwqDCoMKgwqDCoMKgwqAgLyogcmVtb3ZlIGpvYiBmcm9tIHBlbmRpbmdfbGlzdCAqLw0K
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGxpc3RfZGVsX2luaXQoJmpvYi0+bGlzdCk7DQo+PiArDQo+
PiArwqDCoMKgwqDCoMKgwqAgLyogY2FuY2VsIHRoaXMgam9iJ3MgVE8gdGltZXIgKi8NCj4+ICvC
oMKgwqDCoMKgwqDCoCBjYW5jZWxfZGVsYXllZF93b3JrKCZzY2hlZC0+d29ya190ZHIpOw0KPj4g
wqDCoMKgwqDCoMKgwqDCoMKgIC8qIG1ha2UgdGhlIHNjaGVkdWxlZCB0aW1lc3RhbXAgbW9yZSBh
Y2N1cmF0ZSAqLw0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgIG5leHQgPSBsaXN0X2ZpcnN0X2VudHJ5
X29yX251bGwoJnNjaGVkLT5wZW5kaW5nX2xpc3QsDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB0eXBlb2YoKm5leHQpLCBsaXN0KTsNCj4+IC3C
oMKgwqDCoMKgwqDCoCBpZiAobmV4dCkNCj4+ICsNCj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAobmV4
dCkgew0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbmV4dC0+c19mZW5jZS0+c2NoZWR1
bGVkLnRpbWVzdGFtcCA9DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGpv
Yi0+c19mZW5jZS0+ZmluaXNoZWQudGltZXN0YW1wOw0KPj4gLQ0KPj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgLyogc3RhcnQgVE8gdGltZXIgZm9yIG5leHQgam9iICovDQo+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBkcm1fc2NoZWRfc3RhcnRfdGltZW91dChzY2hlZCk7DQo+PiArwqDCoMKg
wqDCoMKgwqAgfQ0KPj4gwqDCoMKgwqDCoCB9IGVsc2Ugew0KPj4gwqDCoMKgwqDCoMKgwqDCoMKg
IGpvYiA9IE5VTEw7DQo+PiAtwqDCoMKgwqDCoMKgwqAgLyogcXVldWUgdGltZW91dCBmb3IgbmV4
dCBqb2IgKi8NCj4+IC3CoMKgwqDCoMKgwqDCoCBkcm1fc2NoZWRfc3RhcnRfdGltZW91dChzY2hl
ZCk7DQo+PiDCoMKgwqDCoMKgIH0NCj4+IMKgIMKgwqDCoMKgwqAgc3Bpbl91bmxvY2soJnNjaGVk
LT5qb2JfbGlzdF9sb2NrKTsNCj4+IEBAIC03OTEsMTEgKzc4OSw4IEBAIHN0YXRpYyBpbnQgZHJt
X3NjaGVkX21haW4odm9pZCAqcGFyYW0pDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIChlbnRpdHkgPSBkcm1fc2NoZWRfc2VsZWN0X2VudGl0eShzY2hl
ZCkpKSB8fA0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
a3RocmVhZF9zaG91bGRfc3RvcCgpKTsNCj4+IMKgIC3CoMKgwqDCoMKgwqDCoCBpZiAoY2xlYW51
cF9qb2IpIHsNCj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAoY2xlYW51cF9qb2IpDQo+PiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBzY2hlZC0+b3BzLT5mcmVlX2pvYihjbGVhbnVwX2pvYik7DQo+
PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvKiBxdWV1ZSB0aW1lb3V0IGZvciBuZXh0IGpvYiAq
Lw0KPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZHJtX3NjaGVkX3N0YXJ0X3RpbWVvdXQoc2No
ZWQpOw0KPj4gLcKgwqDCoMKgwqDCoMKgIH0NCj4+IMKgIMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAo
IWVudGl0eSkNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbnRpbnVlOw0K
