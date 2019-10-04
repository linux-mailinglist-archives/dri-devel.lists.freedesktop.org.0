Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7981CB911
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2019 13:26:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6710D6EB2A;
	Fri,  4 Oct 2019 11:26:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800088.outbound.protection.outlook.com [40.107.80.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E92C56EB2A
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2019 11:26:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E7Y7QKQpzrbJxZagnsVSwojrRvhNrGIQjXdcHFHGdX1fhJP4Soqeg2ylrvTFzOfFoMTdEeo6C/D9bu4fSuZF304sgnyqRgRNOp6ZDHlZgZ+2KQanY3RcRhqaACepIF26VY4sOLfnvCn1G+QNQljCCE+9r8LJff1vIlaYekJOXAJJ2kJswTL+mozrFgN8LBMGzszEKNs0JdZTlJp1q0/VL2o0II//C1jfOKQeV09nAgAGyvdxIBsb+tD0Wj/bkWiY/TkuZ6XBsJYP0lgKPRf9dpJ0kZkow8O/KIinDiaY9HaBO4SbY1d0/9V10loVwVDxt3aqWR5CKfoKtM7xlq3r0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sWKdm4pTuk6mcoiC/MFDhyNEp7jrpItWKoxBMUb+h0A=;
 b=K7ydL5jE4Dv7AGbWqr+NyI2EFShRctIOep8NbARPpDpI7PDR1pn7ml/I0Q9mv+tFBlKeaiiUxClHoDM+YXt+n5MM59G5LUi3/wthDAMk5yG8bi/YjLcnorS2+BQufSTU6OuuyxXeG0BRGCXvHoYDjzIkmU8TlpuQ5DKgudY+rFugqZvUlKfQwFJq0UbXt/BgVaK/nj9KaVKYeo3spFgchsr8WUkn6xIDsBisLYGROewOOcFr6c+kLUcczf0fKh+WVQxn4zcEeLj/SA0GuQMyAbAYrQnuMSyO1dQrCcaB8SRRVCGlw0gCCqPg/DfyVeeepkbR+oVsDoA81WGSctWoaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB2376.namprd12.prod.outlook.com (52.132.143.139) by
 DM5PR12MB1163.namprd12.prod.outlook.com (10.168.240.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.15; Fri, 4 Oct 2019 11:26:09 +0000
Received: from DM5PR12MB2376.namprd12.prod.outlook.com
 ([fe80::2941:f319:f890:beb0]) by DM5PR12MB2376.namprd12.prod.outlook.com
 ([fe80::2941:f319:f890:beb0%7]) with mapi id 15.20.2305.023; Fri, 4 Oct 2019
 11:26:09 +0000
From: Nirmoy <nirmodas@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>, "Das, Nirmoy"
 <Nirmoy.Das@amd.com>, Nirmoy Das <nirmoy.aiemd@gmail.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>
Subject: Re: [PATCH] drm/amdgpu: fix memory leak
Thread-Topic: [PATCH] drm/amdgpu: fix memory leak
Thread-Index: AQHVepz+LK3ooMYyA0KdAv//MbdaAadKTA0AgAAEf4CAAAO5gIAAA4IA
Date: Fri, 4 Oct 2019 11:26:09 +0000
Message-ID: <e79aa8f8-5198-bfd9-3f69-e7975bac3232@amd.com>
References: <20191004101746.19574-1-nirmoy.das@amd.com>
 <62ea397d-2847-04d7-3c50-6292255845c5@amd.com>
 <32afa408-0968-2d1a-5add-593907636592@amd.com>
 <4d665d18-2109-675e-dd69-c15bd0b2a011@amd.com>
In-Reply-To: <4d665d18-2109-675e-dd69-c15bd0b2a011@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR01CA0035.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:69::48) To DM5PR12MB2376.namprd12.prod.outlook.com
 (2603:10b6:4:b9::11)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2003:c5:8f2d:d200:7f12:8f2c:5192:3b71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6a1dfed0-f26c-4de0-67fc-08d748bda755
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM5PR12MB1163:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB1163CA5200F90E7ACBC3152C8B9E0@DM5PR12MB1163.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 018093A9B5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39860400002)(346002)(396003)(376002)(136003)(189003)(199004)(6486002)(316002)(31686004)(99286004)(110136005)(6636002)(36756003)(446003)(11346002)(229853002)(2616005)(81166006)(486006)(81156014)(186003)(14454004)(54906003)(476003)(6436002)(14444005)(256004)(305945005)(8676002)(4326008)(71200400001)(6116002)(478600001)(7736002)(6512007)(25786009)(6246003)(5660300002)(2906002)(31696002)(386003)(6506007)(53546011)(52116002)(102836004)(4744005)(46003)(8936002)(66556008)(71190400001)(66446008)(66946007)(64756008)(76176011)(66476007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1163;
 H:DM5PR12MB2376.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Dto53kxp8IolxI4ehjOSRGw8z+Gj1CaNAtRLG2dEN4knMXY5d0rSvMrlHiq2avBkVNKRkDd5pkKPQmaCDuxFZWGY1ZR06MkI4LtNhg78L9uApNNHYV6eAVhoER453mJ+nSCUy6xzbJ9kz4U9HuXAtCxRN6/IoFcaycf7I8W1VtqiVDhcKNO9N7SmC2ET6084gbq4lHwYxDNTjbJ4uG4iRrbHbMS/Yl2mXRHJUX5Frpu42foX14OhVrBXOCK46AWfDSAv/ePt0utI52XEXIDhpYIqBlYANnVj/2RvQXmNyFYQw+p+bA+xDihCMsEbyivWy5MPvtn3OkM8kw6AhNaFLjNcFq1td7vZxTFTwoicICWkzsJAgQyGLm4hXpxpfe/bc1zEEUd+ZgRjAAvAlC8UMCvr9MBxFOMwuqLhMqDGFNY=
Content-ID: <6D31CF41D9B91C4FA258FE7DC1F752FC@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a1dfed0-f26c-4de0-67fc-08d748bda755
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2019 11:26:09.1114 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +AR5ANz7jexQmxQiwyIxa2VRtIZ05QbbH7N7OTv3/Q+twzxqQ+eo+8Xpo2x2za0RmuMoFj4VBu5IWYaaUolfLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1163
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sWKdm4pTuk6mcoiC/MFDhyNEp7jrpItWKoxBMUb+h0A=;
 b=VOl1+P8IwY18J73GyeQo60/codjmQkASkIGgUiQQwpjctbndM+FwOmwflodBJyjuzcccEUNR3b1qxvt/+hAPNaHxoPeH0/Oh3HlOBi20UpRiPCasl3aNG1G/OMa3Lsv8cPcezZo4pvUBqArcWEJBj03svw7z6r80HOvZlxPHMd8=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Nirmoy.Das@amd.com; 
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: "airlied@linux.ie" <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQpPbiAxMC80LzE5IDE6MTMgUE0sIEtvZW5pZywgQ2hyaXN0aWFuIHdyb3RlOg0KPg0KPj4+IE5B
SywgdGhhdCBpcyBhIGRvdWJsZSBmcmVlLiBUaGUgYm8gbGlzdCBlbnRyaWVzIGFyZSBmcmVlZCBi
eQ0KPj4+IGFtZGdwdV9ib19saXN0X3B1dCgpLg0KPj4gVGhhbmtzLCBkaWRuJ3QgcmVhbGl6ZSB0
aGF0Lg0KPiBXYWl0IGEgc2Vjb25kLCB3aGF0IGVudHJpZXMgYXJlIHlvdSB0YWxraW5nIGFib3V0
Pw0KPg0KPiBUaGUgZW50cmllcyBpbiB0aGUgbGlzdCBvYmplY3QgYXJlIGZyZWVkIHdoZW4gYW1k
Z3B1X2JvX2xpc3RfcHV0KCkgaXMNCj4gY2FsbGVkLCBidXQgdGhlIHRlbXBvcmFyeSBpbmZvIGFy
cmF5IHdpdGggdGhlIGhhbmRsZXMgbmVlZHMgdG8gYmUgZnJlZWQNCj4gYXMgd2VsbC4NCj4NCj4g
QW5kIGl0IGxvb2tzIGxpa2UgdGhhdCBpcyBpbmRlZWQgbGVha2VkIGhlcmUuDQpJIGFtIHRhbGtp
bmcgYWJvdXQgdGhlIGBpbmZvYCBhcnJheSBjcmVhdGVkIGJ5IA0KYW1kZ3B1X2JvX2NyZWF0ZV9s
aXN0X2VudHJ5X2FycmF5KCkuDQo+IFJlZ2FyZHMsDQo+IENocmlzdGlhbi4NCj4NCj4+PiBSZWdh
cmRzLA0KPj4+IENocmlzdGlhbi4NCj4+IFJlZ2FyZHMsDQo+Pg0KPj4gTmlybW95DQo+Pg0KPj4+
PiAgICAgIAkJfQ0KPj4+PiAgICAgIA0KPj4+PiAgICAgIAkJaGFuZGxlID0gcjsNCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
