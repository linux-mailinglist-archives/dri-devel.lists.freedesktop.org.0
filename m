Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6783140A7
	for <lists+dri-devel@lfdr.de>; Mon,  8 Feb 2021 21:40:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63ED06E9F2;
	Mon,  8 Feb 2021 20:40:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2068.outbound.protection.outlook.com [40.107.93.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A6F06E9F0
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Feb 2021 20:40:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RjCW3302F5BQNdOuWU7sJRd/TLVzpkQ7kGa5U+Ab9Q5itK6jbbUPg87N/ZyaiAr5rxgT5Kp1adCwWSpNCcQMt4YIZpaZAwvDpdekpFA9fKZVJInygVF7vOoYeIrewZqJ4+zcZexJJq22QcAPNOVFFKOUJeZU+Bp0HmdXL5E8VnnGBzLX5WBvf99gutFzar+7q9CPNfi2M1eTavSqcgfgGPYRE25GuNyitcAPAe556VjVyas8l9bUhT7Gl6FgYdKzt97zWjP1rOagkkav8PlxnbesmSQrJf9NhiYSeJ7E8iYCmQwRFPTcxEzxJ+v31LFHuVk6AUgTn7wDJuAAgCw8ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8CwiM6DZRgeoLyXRVFrCgkLpZI6rUlXYpVW2awVXwS4=;
 b=dJ+YqekQ1/MuFMDM+scXBrbCby2C6mSfzEgftzvs5MG8387eHnslWO2G8SCbwlUkujeKUaj+mUbbo8hVhS9krv2LhvHPsBFWe7lJpnpTqgwwBFw1mbZ5CKLiq/wgs3oWemzhDQD09H2REumpEWvqel97747Xw9EZizvGL0TA5iGP2pZ2jxxlOenzvj/D+JFRyF7SO3EP715t1ge7xDm1Pem8WL6kAAMyX26hp3Hs2BSZ5FIDXT6Ut2KUmDjlBlYf7raOWppjWujCVP7FGXkuy0c/OH0Fnf2WXTP7LqNs2XKJj1iME/+2i5nT+bNbbZMOoTgwMow+MvZbVtbblUlTnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8CwiM6DZRgeoLyXRVFrCgkLpZI6rUlXYpVW2awVXwS4=;
 b=DRb61Dbxv7pola20oD4Foseb62bOmy9lW2cU68ELAxzVW96VECKFEJQTcS5a04t5Hdsb/F9XSdm9J0QvHb102Es/QJWXm9IJObUQtnb/eTPcmT4IuvB0phxIrsxMriBvI2NPqA017GqqdWsB6askqZegQVwhk0fnwd6JgceM/RA=
Received: from (2603:10b6:208:8f::18) by
 MN2PR05MB7165.namprd05.prod.outlook.com (2603:10b6:208:18b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.10; Mon, 8 Feb
 2021 20:40:21 +0000
Received: from BL0PR05MB5186.namprd05.prod.outlook.com
 ([fe80::856b:10f9:d35c:cde1]) by BL0PR05MB5186.namprd05.prod.outlook.com
 ([fe80::856b:10f9:d35c:cde1%4]) with mapi id 15.20.3846.025; Mon, 8 Feb 2021
 20:40:20 +0000
From: Zack Rusin <zackr@vmware.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>
Subject: Re: [Linux-graphics-maintainer] [PATCH 2/3] drm/ttm: move memory
 accounting into vmwgfx v3
Thread-Topic: [Linux-graphics-maintainer] [PATCH 2/3] drm/ttm: move memory
 accounting into vmwgfx v3
Thread-Index: AQHW+gV2NsHDcavmqECv2lrEwoaev6pOSm0AgABxeICAAAClAIAABKQA
Date: Mon, 8 Feb 2021 20:40:20 +0000
Message-ID: <8516A633-8DA6-44D2-A414-59473AB2C3F8@vmware.com>
References: <20210128131604.149660-1-christian.koenig@amd.com>
 <20210128131604.149660-2-christian.koenig@amd.com>
 <ddb5c9c9-173c-1919-6000-b51d451109ba@amd.com>
 <071AC444-2B1A-4333-83FA-CA1A53E35C1C@vmware.com>
 <003b1e64-2510-5d96-be62-f8f45843023b@amd.com>
 <5CBDA1F3-5801-45BA-B84A-A5B83FA95BEB@vmware.com>
 <9CB18811-DA0A-40C3-A719-A9EFAA98D0CE@vmware.com>
 <c0f31c1c-ccae-6441-16bf-2bc25c715f41@amd.com>
 <8d14d1b6-e3eb-87ad-a386-681f787ecf94@amd.com>
 <4E11F79F-685A-4969-B59E-B05AC40578F9@vmware.com>
 <8750d410-6212-efe2-af55-4974c6cdf092@amd.com>
In-Reply-To: <8750d410-6212-efe2-af55-4974c6cdf092@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.40.0.2.32)
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=vmware.com;
x-originating-ip: [71.175.59.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a9033390-aafc-4f31-3419-08d8cc71c0b1
x-ms-traffictypediagnostic: MN2PR05MB7165:
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR05MB7165B138BE9AF38A579640E6CE8F9@MN2PR05MB7165.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RmUBcd0FngqNy2MG+uz5Iv8HYSfTuNVUmM1zOc/9oiq/ngAa4VMqVME6+ZeCgqJXLs8OUV3tXV+iLL0EwY5JljE0tpP0zOB5heyhXaSmLyvjjQtNb/JhiYH1Fbly++bbeRGPbJ0zDo6v81dViBYA4NoMPdlnnvgxs35XZqogLi0lRK24iMIuMtz9r98kfuHzq9UslY1y66iPi40tPldOZzdEQUsSz6eM12svqSKdYZWcpJW9TvJWMNqayo3edvomi1P29CJ1ShtBnNUk6uVH+IvExQDUoKSmHu6jLmlrfMF0Wzf6orpoFojtt8HkwUPrIj7hQ5JX0P9yGsfp5JKRmiMPMTnG4laYCizDXaIajhUS4L6i8KJxXas/SCWAsodKiYJbK6cYq+HMnJGe4Z++a48DPIyRzV0U/OVNmfIY/cKL/fzGnc25WtjmzB67rMKY6FbV5tmawD5Zd9sVAIGBKtciEWxAklp3jVLo47DXOf+qzbpLqicNo65PnyZfRa3D3LXu2jUnbBH0ikpqsjc/DwMPCDkI+XUFODwwXSdldRy6Nwdbfl59Wvm7PpWZ2tQ18N1rVSTY6V+7pOxgMJ5eMStvD/drouRaILm3yFVG5TA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR05MB5186.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(376002)(366004)(346002)(396003)(6916009)(4326008)(8936002)(71200400001)(6486002)(6512007)(186003)(5660300002)(8676002)(6506007)(86362001)(53546011)(36756003)(33656002)(66574015)(64756008)(66446008)(76116006)(316002)(66946007)(66556008)(66476007)(2906002)(26005)(54906003)(83380400001)(478600001)(2616005)(40753002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?K2hpUm9KeXFybDBESG90bUJBb3JNZk94WTFGZjgxdWJTMk5NRWk1VG1vZXd5?=
 =?utf-8?B?TmFDS3NkTHhRT1I1VVQyWlI0cHdpT1ZyRzVsN2NuK0RyR3I1R211cUlKd1ly?=
 =?utf-8?B?V3NCWHR4R1M3VFJtTTRJV0UwcTNOeVFSR29SQkxncGp3dzRZSjFqeElNbDlF?=
 =?utf-8?B?cjVNZy9UZWhSMEVxbjFzcjQyUWxuTER6N0NjRGpRS2RhTDNiR3NOS3JSNEJI?=
 =?utf-8?B?VGduTkdmVGJoSG5BS3VBMjBqREo3cDlndTIvcFlNRTJrVHJXcFNXaDdzMWxI?=
 =?utf-8?B?MGZQS1ROMWI2aVJsQ2s2d083T1F6TDV5aTBrK1RpU3hiVGJuSzQrNTNWQmRC?=
 =?utf-8?B?MHJtbk15S1pCZlFtT0Y2amFkTDRnNEJCaGZ1bG54SVVlanN2SFZYZ0p6cDZm?=
 =?utf-8?B?dEE0TUM2djVIcTF4SUJXQ1R6TW15ejJmUW5BeURyOEhRd0NmZUVqQXF6N0FO?=
 =?utf-8?B?UkQ4cnpxZ2FSRWFvWmtiUVlUVUVuamFMQis0Wi9GWmgrTGRNUTdFOWIvcTRT?=
 =?utf-8?B?L0duWlFyK3l6U2hrRTZBRXREcitpY0J0STJtUGpZQkpVWGZOd255QWdhZVMv?=
 =?utf-8?B?UnVZUVpyUFNzVnBKWC9sVWtseXZSaVBiaDE4NDlsQktURmZKWmpzQ3ovbENW?=
 =?utf-8?B?WHVYWVd1dnoxWnJJUGUreDdzZmxMN2hUSExudGRya1N4VlhtYmQxQU9aK1E5?=
 =?utf-8?B?c1NqZEs1WC9HMGxSc0FoYkk2dllHcFFXanVLcExuY0w5Si9TK2UwTzdWd2pj?=
 =?utf-8?B?QkhtS1pSZUpBRmdscDYyMGkxQWRlc3ZQdjJaamhaUU8rajNwMHlXSHpya3Yr?=
 =?utf-8?B?UytsRms3QXhtbUZVckkzK1dPdWY4dHJBbWltcjkvVXdhRkE3NGljZU43MERQ?=
 =?utf-8?B?Vmw2bVpEeCs4NE5BaU0xYm9vNE5oQkx0ZkJnYWdrOWphcitsTUI4UEdqOTF2?=
 =?utf-8?B?Y1dSdmdLcHJiRi84azI2YXJrckhwWTNqWkFDNFNvZVMrWmdubHhYRlROZ2lN?=
 =?utf-8?B?UW1VQXVKOGF6OVF2dTVaT2RTdnEvb0lvbzBzVVdpNXBuQzJURk1GdWxWRkho?=
 =?utf-8?B?ak82YUVjS3BqZm5CR3UvQWRtVVBUOFJ6WHlMZzZKYTVSeFhCMzk2Z2JuWE51?=
 =?utf-8?B?RXBKVnJTcGZxZVN4ekVzYkN2VUdUZXFicytCbVF2NlgzNnBWc2NPdkVQYk5B?=
 =?utf-8?B?UlZOeGVHbXhiR25Xa21XZmU2alZnalBnb1FDbTRGK3lKaGxEaUYwcWpSRTRM?=
 =?utf-8?B?S1FtZ2NPcFExZUJkVDh1QlVRTm5ucW1uamVjRC95S3J3aGlnYWY4a1lURWZi?=
 =?utf-8?B?RzV6MmdIblZtTG4yd2tOR25RQWFlVElyRlAxc2hEV0QxalpSNjRDUjdVY2Uw?=
 =?utf-8?B?aEJ4TE4xWnBqWkRIRTV4WC9pcEJGdXZhUkU5NlJjZE9xb3R3NSt0YjRqdmtu?=
 =?utf-8?B?cWJXanhDZGE4Vmc0bHhqSEhQRlZmZHZWN09oYjBIVytjRk9IWUdSb0dBd3dl?=
 =?utf-8?B?MS9ub2ErUGRRU0ZVZFQwZ1VmME1CSHVpNzlHQmVaeG5sTUVKTEZUOXZGa21h?=
 =?utf-8?B?VGwwRzZncS9iRjI4Z21wcTdLS0U3RzE5YVRMRmF2LzM3M0JrR3Zzbis1QlIr?=
 =?utf-8?B?ek9QUVA2UGdZQnlzellVbXZjRktndCtjcUUxL2lnRDlzbWRtRGVxMGI5TS9Y?=
 =?utf-8?B?bFFkemtHNkNDSDUyMHFsRW5aV0kwV090eGk4VDdWWEMzZndndmpRODRTS2xm?=
 =?utf-8?Q?S/vSDxS+wEdIggHTTU0J9ZkLS6HpsYjIVzym76D?=
Content-ID: <B67800690AED684C8BA6075E601EF7E9@namprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR05MB5186.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9033390-aafc-4f31-3419-08d8cc71c0b1
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2021 20:40:20.7585 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WD63twLg7isFvYRkzIhoRBfa7Pcly4RpdQ7x2INlav401wAe3AekMkLfHj+04acKPPCXVmInqgroAPS+7zL52w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR05MB7165
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
Cc: "Das, Nirmoy" <Nirmoy.Das@amd.com>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gT24gRmViIDgsIDIwMjEsIGF0IDE1OjIzLCBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3Rp
YW4ua29lbmlnQGFtZC5jb20+IHdyb3RlOg0KPiANCj4gQW0gMDguMDIuMjEgdW0gMjE6MjEgc2No
cmllYiBaYWNrIFJ1c2luOg0KPj4+IE9uIEZlYiA4LCAyMDIxLCBhdCAwODozNSwgQ2hyaXN0aWFu
IEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPiB3cm90ZToNCj4+PiANCj4+PiBIaSBa
YWNrLA0KPj4+IA0KPj4+IG9rIHdlIGZpZ3VyZWQgb3V0IGhvdyB0byBkbyB0aGlzIGNvcnJlY3Rs
eS4NCj4+PiANCj4+PiBCYXNpY2FsbHkgdXNpbmcgdGhlIHBkZXYtPmtvYmogaW5zdGVhZCBvZiB0
aGUgZHJtLT5wcmltYXJ5LT5rZGV2LT5rb2JqIHBvaW50ZXIgd29ya2VkIHF1aXRlIHdlbGwuDQo+
Pj4gDQo+Pj4gSSd2ZSBqdXN0IHNlbmQgdGhlIGxhdGVzdCBwYXRjaGVzIHRvIHRoZSBtYWlsaW5n
IGxpc3QuIElmIHlvdSBkb24ndCBoYXZlIGFueSBvYmplY3Rpb25zIEkgd2lsbCBjb21taXQgdGhh
dCB0b21vcnJvdyB3aXRoIHlvdXIgYW5kIERhbmllbHMgcmIuDQo+PiBUaGF0IHNvdW5kcyBnb29k
LiBUaGF0IG1vdmVzIHRoZSBlbnRyaWVzIHVuZGVyIC9zeXMvZGV2aWNlcy9wY2lCVVMvSUQvbWVt
b3J5X2FjY291bnRpbmcgLCB5ZXM/DQo+IA0KPiBZZXMgY29ycmVjdC4gSSByZWFsbHkgaG9wZSBu
b2JvZHkgcmVsaWVkIG9uIHRoZSBvbGQgbG9jYXRpb24gb3Igb3RoZXJ3aXNlIEkgbmVlZCB0byBh
ZGQgc29tZSBraW5kIG9mIHN5bWxpbmsgd29ya2Fyb3VuZCBvciBzdWNoLg0KDQpJ4oCZbSBub3Qg
YXdhcmUgb2YgYW55b25lIGRlcGVuZGluZyBvbiB0aGF0IGxvY2F0aW9uLiBJ4oCZbGwgdGhpbmsg
YWJvdXQgaXQgdGhpcyB3ZWVrIGFuZCBpbiB0aGUgd29yc3QgY2FzZSBJ4oCZbGwganVzdCBkaXNh
YmxlIGl0IGZvciB0aGUgbmV4dCByZWxlYXNlIHVudGlsIHdlIGNhbiBzcGVuZCBzb21lIHRpbWUg
Y3JlYXRpbmcgYW4gYWN0dWFsIHN0cnVjdHVyZSB0byBvdXIgc3lzZnMgbGF5b3V0IHRoYXQgd2Ug
Y2FuIG1haW50YWluIGxvbmcgdGVybSBidXQgdGhhdOKAmXMgbm90IHNvbWV0aGluZyB5b3UgbmVl
ZCB0byB3b3JyeSBhYm91dC4gVGhhbmsgeW91Lg0KDQp6Cl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
