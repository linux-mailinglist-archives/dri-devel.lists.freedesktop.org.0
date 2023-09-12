Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8304979C200
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 03:53:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E932C10E03D;
	Tue, 12 Sep 2023 01:53:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW2PR02CU002.outbound.protection.outlook.com
 (mail-westus2azon11013011.outbound.protection.outlook.com [52.101.49.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C299B10E03D
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 01:53:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kI2/ZIgR5sIC3PEXR0+vGijlqQYKy6Q7vQfjdG6XbI0BYda6hD+2RKgiQvA+thp/2mkFThKENa/Qe8x50/HZ8THfac7Ds3o6gICovZAxCk/AibE2AzmVn99vyBCiiIqmKdTUPyYP0QteiT/uspqsUJhoVvkmBa92SbRcDQCyH998X03YYNaOqkVxJeIizrAsX+IKZe1GHK+oQ24qlqJt9Fu+fgHw5XWidjeCRUzNUse3jgFk22SYeFifzm9yYDgJcFm/nPBEwZupzFhGQWYkGfXTW5pNcCddsU/Z1Wk6+bSpBW/SdFCWXoGNwEQS38Y/VrXcIQRkewCroNgudqSkzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n7AvILWJoG26yCNvlDmsALB39Q+o2Bg9ZCP6uQHnNVA=;
 b=lUDHM2QppeFsa+Cmh+pBCsRcHzN1PfBR9vUndNXjtM3UJk+iV4h5hfGzfFbp3GpjBnnv/ca6lQRRhEvpeQgxzMnzBxQZWIqwhKTs1X7Mmub6vtWPr5dpRa2w83F1HwIVULTA9EKx8YFdBuuVGqUaNOsrCCUq0mHRiKCB7fWQ5H0eqvIEdPKXQQPEqlm2tmMPaIqNzDDmkDLPyO9sIfkULHnJ5DGNJOstpYOyBnZv3ty9I9AuDyg1TPzFHhpXvSfEMgx8/IeS0ezsp3ARzS9Zawu9fueRZmH0grSuX4BnSAGzkwXB0WluIFKQ3aTqC/vb0/0vg/E9TbBYE7bzPWUoWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n7AvILWJoG26yCNvlDmsALB39Q+o2Bg9ZCP6uQHnNVA=;
 b=dQ4pdf58IOOkkc+1FaHMyTxXFse0nkpN3dySYClgmTCgg/xcGcgEpz02r8KqtdQhTp/sEBic7rF/hasJSvxlKjBspZxcT83zzDwBW/hg5wlP69syRNOjW95CDoBm53BqjHttFzNm8beQlMFIdQJIUVVUocT93kwPoxplJT9Fk5Q=
Received: from IA0PR05MB9832.namprd05.prod.outlook.com (2603:10b6:208:404::6)
 by SJ2PR05MB9900.namprd05.prod.outlook.com (2603:10b6:a03:500::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35; Tue, 12 Sep
 2023 01:53:48 +0000
Received: from IA0PR05MB9832.namprd05.prod.outlook.com
 ([fe80::9e05:acf:9240:addd]) by IA0PR05MB9832.namprd05.prod.outlook.com
 ([fe80::9e05:acf:9240:addd%3]) with mapi id 15.20.6745.035; Tue, 12 Sep 2023
 01:53:48 +0000
From: Zack Rusin <zackr@vmware.com>
To: "nick.alcock@oracle.com" <nick.alcock@oracle.com>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "ebiederm@xmission.com" <ebiederm@xmission.com>,
 "brauner@kernel.org" <brauner@kernel.org>, "keescook@chromium.org"
 <keescook@chromium.org>, "airlied@gmail.com" <airlied@gmail.com>,
 "code@siddh.me" <code@siddh.me>, "pstanner@redhat.com" <pstanner@redhat.com>, 
 "ddiss@suse.de" <ddiss@suse.de>, "andy@kernel.org" <andy@kernel.org>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mcgrof@kernel.org" <mcgrof@kernel.org>, "daniel@ffwll.ch" <daniel@ffwll.ch>
Subject: Re: [PATCH v2 0/5] Introduce new wrappers to copy user-arrays
Thread-Topic: [PATCH v2 0/5] Introduce new wrappers to copy user-arrays
Thread-Index: AQHZ4o9xLec+33ofI0qfeDLvXJwswbAWctCA
Date: Tue, 12 Sep 2023 01:53:47 +0000
Message-ID: <0f3075867d473d57e769b9a064bccf7b967e162c.camel@vmware.com>
References: <cover.1694202430.git.pstanner@redhat.com>
In-Reply-To: <cover.1694202430.git.pstanner@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.48.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR05MB9832:EE_|SJ2PR05MB9900:EE_
x-ms-office365-filtering-correlation-id: 8d3426fc-cf99-4de5-dece-08dbb3331afb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ylIlLGkVslyA1T7lYx/W+AwIJDZnrUUcGun+KOYV1JnspGcTOmQyHhtF0E16nG+u7a6/wZ52UqcH4P4OE3FYN5MKjyWQbXb76jPFF8k05BKAQeWMlZrE+Xa9scWEt9dYMeDPEG1jdnBKH5D01CCKqMbJBoZL79lcitgllHpMc8JvnsLo1p7DromJG7F7HdSo6WfFKovs2P48eoHu5r5XKeNkHU3w+9BsfPJoY9mlx9J1Jiyk4Uturt/2o2pyo+177ve7j48r/ARapAgL3wkl6VjOWVMTrLYCzSWtDt2yHqO6Qyk/6EW+Sb3HWC90fpS3fZqdV62oyyYOeWDywtdkpsvys8wlpH6BjptHFfcRS0jZRbzEjYvmx1N6vBGWxtW/KYqrd9ZUxI+ItaJiPFBZGgJlBg42tND0vZSgBUS2i3MsqMv//DMyrlgpt3w4KsFTHuLwQS1r7u4Axdrnu0HkkZVxldQi4C3OXBZ5495OVn15PvKxWpoBvPipq3HJ+fDA8y+fpFkA5mocFNu5p8iHRTp+vqh+ESf4lqtvpBLHvEVbYg4WVCrwpfvKaK955xRTtYQalSbowx1qGd4iSXFNtUPZCeuHV23kMvuCemFuvJKpQXLlx6Sc2Wee2WkxjuvfhCtanSEekWJggmvsqmLiTt8ei6+8bOZhgLoaARvGCvuXoyJHhPCUzK6ueljQFCCa
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR05MB9832.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(366004)(136003)(39860400002)(376002)(186009)(451199024)(1800799009)(36756003)(86362001)(54906003)(478600001)(122000001)(921005)(38070700005)(38100700002)(2616005)(26005)(83380400001)(2906002)(6512007)(41300700001)(71200400001)(5660300002)(7416002)(64756008)(6486002)(6506007)(66476007)(66446008)(66946007)(66556008)(76116006)(8936002)(110136005)(4326008)(8676002)(316002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WDRVVjJmTldFNVJaYXBncHpzaDhya1ZJV0xRektmWTZEVnpRZTlNd2YveDBy?=
 =?utf-8?B?Q2h0T2dUejJjU1pQU0RUYjQrVFhpTFhjQ1ZRZ3dSNlMwdERrTmUzRFJYTDQ4?=
 =?utf-8?B?d1U3UDBPQUJLeElJSjJ5OHlsZ1hqa29CVG9RZXpVZElnNm9sREkwM09NRzJV?=
 =?utf-8?B?ZDlTOVB6MlZka3dmdnB0a01SSTZBSVE1cmh5RDRieDFyakpNcDBwQkJzSDNE?=
 =?utf-8?B?RzhueHdud0NJODlGTHYzdmxOTzBVYVlBRnJ2MnZWSDZnc293RW1HcGxBSmFh?=
 =?utf-8?B?d3oxSlkrZnd1ckpyVFVhZ2pLbS84UjlFdlEyMmhXMnpHVkNPZ0RVLzhKRHFN?=
 =?utf-8?B?cXMveVFDRWJSaGFBVnQvQVYzUWdKUzRBamRsMFl0dCtEQjlRRkVjZG8vOXls?=
 =?utf-8?B?bVFYeUF6a3FkUlk4S2Y5eVdVS1BUT3BrdEUxU3JZaHYzMGpjZFYxdUFEYUFt?=
 =?utf-8?B?QW9hNHU1MTYzUE1YNDdVdGxVa3NVeDVSYnZWQ0R4clA3YkNJenlTQlNORnk4?=
 =?utf-8?B?Q2k1ZFNmc0VERTJkek5qcng0dzVPVm8xMDZMNHlJenlqeFpGYkNLQ0ZZbWgy?=
 =?utf-8?B?OFp2S3dRUjcxR2FzYmxmWmkyeDBiZjRNN2t0SEl1T2tYbm1Sa1d5M3dYY2Z6?=
 =?utf-8?B?aXdkYzU1VHVvSUpIZ3lVQ3o4aG1Gd1Y0RE9COEtMZ3BkRi9MTE1sYVJhM0hJ?=
 =?utf-8?B?NW1OdG95VElFM1MxQUc5a3MzbktyZXM5RGQ3c3FHaHpXZmZYbkZGYW9GRStQ?=
 =?utf-8?B?c3U4YXNLNG9kR015alo2cnp3eWZWaTRLQi9BZUMyNkxyVHRzbExzOGxsV28y?=
 =?utf-8?B?N3FtYWFjN3d4MGRLYkUwSWFNaUZ0dklkbmV5MmZCT041QUhtZlB6UWdNcGZN?=
 =?utf-8?B?d0RJaUNTcEM5SFI2YnNOT0NJazNPVjNNbnA2cUJ6L0Fncng2YXdjeGI1dTg2?=
 =?utf-8?B?bVNWOFdoWG5EUFNHOEE4M0dXR0xBbi9WSFp3NURlU3hTamRYYnF1VldzZTRZ?=
 =?utf-8?B?V1dIN1RRc09XclV1RWh4VXZURHkwc1A3ZE9CV0owSGs2RHBMYVFxWmgyS2Jr?=
 =?utf-8?B?V2ZoR2QwSU95UUhSNlA2Qk1ZSEdvak1GWUk2NFNjQ2NTUUpyak5SRkp2ajk2?=
 =?utf-8?B?eVNtVlU1MFgwVnExcmRMNnNGRUNCL3BQcThFNjViYmJybURsaUFqVk0zbDE0?=
 =?utf-8?B?SHpPcXBMUzRLZjBKcWpzSDRXTkx2dlU1TlhPdWtkL1FQRkpKaElWWEZ0ZTVv?=
 =?utf-8?B?RnNwWHFRWTB4QjJOOXVCZm9DcXNXeTRSa3pNNHczdUpNblIvN2NqN21Qbi9S?=
 =?utf-8?B?bEJTSjNkM2lrQ1BDN0F4bEdmY2Zjb1RsSytOVk44ck1TajNGNVJHY2ZTcVc2?=
 =?utf-8?B?RGlKZnpuRnBIb2MvNndKdUV4Q2VPYjRoVTNWdVJSa016MnFzaTdvM2VaU0oz?=
 =?utf-8?B?MHo4TW5NV01SNWtpemZmOXJkNUwzWEd4NDlZMlFTOWR0LzVocnA2R0dkNTJh?=
 =?utf-8?B?dy9RNUZHN1YzRmFIQkJsSkJtU2hzQlAxQ2dYa1VCN3VTRmhrVm9JbkNUWXc0?=
 =?utf-8?B?aEs3ekpnSGZ6WHF5enZ3eGFNaUFjdUtnTU9EaE5POHRQVjA4WHFCNndLM2VL?=
 =?utf-8?B?QzZnQUhsbnV5OWQ0dVdCRkUrYTBqcW5LNWZwL0RIMlFjdFlUQk5HRGtzY2xi?=
 =?utf-8?B?RnI3d3RmcHRnUUpwY0RnTDVKYkRXRDRkOUFpNURReE5iZXg3U2VuODlkNXB0?=
 =?utf-8?B?cVJieWUzeGgzOUZ4Q1VCTzFGTnJyU3RHSnRrcUphWEtyY0ZQOFhaUmNKUTBB?=
 =?utf-8?B?MGQ5K2laUVMvdE13MkRiUE8vazFJdnQ0aUNVaGZOenhWMnlhc2Jod090QU1T?=
 =?utf-8?B?TXQ5Z0crSStkU0VOcHFLekpDTEdKeFY3bkRsSnFPU3p0eTVycnNsL3dYYVkr?=
 =?utf-8?B?aUo4NmxtTk1lYkYySzEvTENOY0VqSkhmTEJUMjRDbE9RWks1T3dmeGhHbHBC?=
 =?utf-8?B?ZWxDc2hmSmZsbTNsT1llS1dKZ1hkS3BXK1BPd3N4b2hOanFYQTVoREFQbzhz?=
 =?utf-8?B?RTNXaFUrV1lkZzJTR2lUOXNNcTV5NkFtdFdmb0JLQkg4eU5Sa0ZlNG4zV0Zu?=
 =?utf-8?Q?ZROpRnnQA7AhHUyE++z4k4EXx?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <27C09B5C8E9CDA4F92992A7B549730C8@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR05MB9832.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d3426fc-cf99-4de5-dece-08dbb3331afb
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2023 01:53:47.9862 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gaPaJL6X/1OL9IstrGem8lO3grTWkEqkPciM62MVXpw/IzACKlA3wpOdZjVkn0ucyAg8cLf+LFMSqLpGx/NAoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR05MB9900
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
Cc: Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 "kexec@lists.infradead.org" <kexec@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDIzLTA5LTA4IGF0IDIxOjU5ICswMjAwLCBQaGlsaXBwIFN0YW5uZXIgd3JvdGU6
DQo+IEhpIQ0KPiANCj4gRGF2aWQgQWlybGllIHN1Z2dlc3RlZCB0aGF0IHdlIGNvdWxkIGltcGxl
bWVudCBuZXcgd3JhcHBlcnMgYXJvdW5kDQo+ICh2KW1lbWR1cF91c2VyKCkgZm9yIGR1cGxpY2F0
aW5nIHVzZXIgYXJyYXlzLg0KPiANCj4gVGhpcyBzbWFsbCBwYXRjaCBzZXJpZXMgZmlyc3QgaW1w
bGVtZW50cyB0aGUgdHdvIG5ldyB3cmFwcGVyIGZ1bmN0aW9ucw0KPiBtZW1kdXBfYXJyYXlfdXNl
cigpIGFuZCB2bWVtZHVwX2FycmF5X3VzZXIoKS4gVGhleSBjYWxjdWxhdGUgdGhlDQo+IGFycmF5
LXNpemVzIHNhZmVseSwgaS5lLiwgdGhleSByZXR1cm4gYW4gZXJyb3IgaW4gY2FzZSBvZiBhbiBv
dmVyZmxvdy4NCj4gDQo+IEl0IHRoZW4gaW1wbGVtZW50cyB0aGUgbmV3IHdyYXBwZXJzIGluIHR3
byBjb21wb25lbnRzIGluIGtlcm5lbC8gYW5kIHR3bw0KPiBpbiB0aGUgZHJtLXN1YnN5c3RlbS4N
Cj4gDQo+IEluIHRvdGFsLCB0aGVyZSBhcmUgMTggZmlsZXMgaW4gdGhlIGtlcm5lbCB0aGF0IHVz
ZSAodiltZW1kdXBfdXNlcigpIHRvDQo+IGR1cGxpY2F0ZSBhcnJheXMuIE15IHBsYW4gaXMgdG8g
cHJvdmlkZSBwYXRjaGVzIGZvciB0aGUgb3RoZXIgMTQNCj4gc3VjY2Vzc2l2ZWx5IG9uY2UgdGhp
cyBzZXJpZXMgaGFzIGJlZW4gbWVyZ2VkLg0KPiANCj4gDQo+IENoYW5nZXMgc2luY2UgdjE6DQo+
IC0gSW5zZXJ0IG5ldyBoZWFkZXJzIGFscGhhYmV0aWNhbGx5IG9yZGVyZWQNCj4gLSBSZW1vdmUg
ZW1wdHkgbGluZXMgaW4gZnVuY3Rpb25zJyBkb2NzdHJpbmdzDQo+IC0gUmV0dXJuIC1FT1ZFUkZM
T1cgaW5zdGVhZCBvZiAtRUlOVkFMIGZyb20gd3JhcHBlciBmdW5jdGlvbnMNCj4gDQo+IA0KPiBA
QW5keToNCj4gSSB0ZXN0LWJ1aWxkIGl0IGZvciBVTSBvbiBteSB4ODZfNjQuIEJ1aWxkcyBzdWNj
ZXNzZnVsbHkuDQo+IEEga2VybmVsIGJ1aWxkIChsb2NhbG1vZGNvbmZpZykgZm9yIG15IEZlZG9y
YTM4IEAgeDg2XzY0IGRvZXMgYWxzbyBib290DQo+IGZpbmUuDQo+IA0KPiBJZiB0aGVyZSBpcyBt
b3JlIEkgY2FuIGRvIHRvIHZlcmlmeSB0aGUgZWFybHkgYm9vdCBzdGFnZXMgYXJlIGZpbmUsDQo+
IHBsZWFzZSBsZXQgbWUga25vdyENCj4gDQo+IFAuDQo+IA0KPiBQaGlsaXBwIFN0YW5uZXIgKDUp
Og0KPiDCoCBzdHJpbmcuaDogYWRkIGFycmF5LXdyYXBwZXJzIGZvciAodiltZW1kdXBfdXNlcigp
DQo+IMKgIGtlcm5lbDoga2V4ZWM6IGNvcHkgdXNlci1hcnJheSBzYWZlbHkNCj4gwqAga2VybmVs
OiB3YXRjaF9xdWV1ZTogY29weSB1c2VyLWFycmF5IHNhZmVseQ0KPiDCoCBkcm1fbGVhc2UuYzog
Y29weSB1c2VyLWFycmF5IHNhZmVseQ0KPiDCoCBkcm06IHZtZ2Z4X3N1cmZhY2UuYzogY29weSB1
c2VyLWFycmF5IHNhZmVseQ0KPiANCj4gwqBkcml2ZXJzL2dwdS9kcm0vZHJtX2xlYXNlLmPCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDQgKy0tDQo+IMKgZHJpdmVycy9ncHUvZHJtL3Ztd2dm
eC92bXdnZnhfc3VyZmFjZS5jIHzCoCA0ICstLQ0KPiDCoGluY2x1ZGUvbGludXgvc3RyaW5nLmjC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgNDAgKysrKysrKysrKysrKysrKysr
KysrKysrKw0KPiDCoGtlcm5lbC9rZXhlYy5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDIgKy0NCj4gwqBrZXJuZWwvd2F0Y2hfcXVldWUuY8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAyICstDQo+IMKgNSBmaWxl
cyBjaGFuZ2VkLCA0NiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQ0KPiANCg0KU2VyaWVz
LCBhbmQgaW4gcGFydGljdWxhciB0aGUgdm13Z2Z4IGNoYW5nZXMsIGxvb2sgZ29vZCB0byBtZS4N
Cg0KUmV2aWV3ZWQtYnk6IFphY2sgUnVzaW4gPHphY2tyQHZtd2FyZS5jb20+DQo=
