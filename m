Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3266105063
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2019 11:21:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 388D46ED5D;
	Thu, 21 Nov 2019 10:21:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on062d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0e::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E2C56ED5D
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2019 10:21:24 +0000 (UTC)
Received: from VI1PR08CA0132.eurprd08.prod.outlook.com (2603:10a6:800:d4::34)
 by AM5PR0801MB1844.eurprd08.prod.outlook.com (2603:10a6:203:39::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.17; Thu, 21 Nov
 2019 10:21:21 +0000
Received: from VE1EUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::204) by VI1PR08CA0132.outlook.office365.com
 (2603:10a6:800:d4::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.19 via Frontend
 Transport; Thu, 21 Nov 2019 10:21:21 +0000
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT009.mail.protection.outlook.com (10.152.18.92) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.17 via Frontend Transport; Thu, 21 Nov 2019 10:21:20 +0000
Received: ("Tessian outbound af6b7800e6cb:v33");
 Thu, 21 Nov 2019 10:21:17 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 933cf55c3eee27e1
X-CR-MTA-TID: 64aa7808
Received: from 06923708197a.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.5.50]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A22A7C2D-E643-40A4-9BBA-9BB28AE41F65.1; 
 Thu, 21 Nov 2019 10:21:12 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2050.outbound.protection.outlook.com [104.47.5.50])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 06923708197a.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 21 Nov 2019 10:21:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ejDRoC2QMmVgRZsFz6/B4v+TI6ay7ItWVbv/r/udyj/AMXUOsceYlKNJqUABsP5y+2LGtLkB60mdUpYopPn4z+7zuK4hGPNTzeXXisWL43AKDUwRzjz1d2lEu/by3NSbs8Y+qp90zW5xY/CaRs8/27gF3hgv6xsKe3OkaFecYjmRjppcbXawI5w5yVx581PfoWgmzgN6/FoVHItp+vadlWQWrtZ+K761Cb2JUrhnHy7RDKXSkttpEKsotIxlJ0r++p8j/WKZJL4NVX9mk6KfjHHHzt5aOkNW1QjaOZZ3mPs+8wIBULOohRsKJJXM+1ysxe/hOMWSST0oYdJknZl/zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+SHNq2JNFL4mqTY0KLlGETwFJgM4uMauCtLOM8c8jwM=;
 b=k+B5+wiSY/afkhOxD4fpmu/o3orKrTHrOgxJJn4mFnXWBDuIWdgbqc9Ss2ThE2NjfYYs8+jveL58xdRFDDcQGZDAqxi7xW7Kc9IlbGem2owDjzxIqkKF8tkp0JT04Zcj+dpri+REqAKnmIOeNDv2pW/5BoZFgZy/TXY9E+dB3tiQPCtuzdTVSIf4Hmzslnar4M2D5waBgNP5uBToCKKuvJ8t/ruMt860+/0Z7e/QYdjsOwgy0oc3qtSw/nuATcETqZAJRy1a53M1MpgC35eQjKbLRNDTgjMpSPlE6U3LjsDqZhH98bgaZ1oxAXsbB2FAdlrEkkD0w6ekxplYmIcE6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB5101.eurprd08.prod.outlook.com (20.179.29.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.17; Thu, 21 Nov 2019 10:21:09 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a809:417a:faf3:61a7]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a809:417a:faf3:61a7%6]) with mapi id 15.20.2474.019; Thu, 21 Nov 2019
 10:21:08 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Dave Airlie <airlied@gmail.com>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "airlied@linux.ie" <airlied@linux.ie>, Brian Starkey <Brian.Starkey@arm.com>, 
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 Mihail Atanassov <Mihail.Atanassov@arm.com>, nd <nd@arm.com>, "Oscar Zhang
 (Arm Technology China)" <Oscar.Zhang@arm.com>, "Tiannan Zhu (Arm Technology
 China)" <Tiannan.Zhu@arm.com>, "Jonathan Chai (Arm Technology China)"
 <Jonathan.Chai@arm.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "Julien Yin (Arm Technology China)"
 <Julien.Yin@arm.com>, "Channing Chen (Arm Technology China)"
 <Channing.Chen@arm.com>, "Thomas Sun (Arm Technology China)"
 <thomas.Sun@arm.com>, "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>,
 Ben Davis <Ben.Davis@arm.com>
Subject: Re: [PATCH v4 6/6] drm/komeda: Expose side_by_side by sysfs/config_id
Thread-Topic: [PATCH v4 6/6] drm/komeda: Expose side_by_side by sysfs/config_id
Thread-Index: AQHVoDsY3wS7JXHxKU+92h5A5rXdAKeVYXUAgAAI04A=
Date: Thu, 21 Nov 2019 10:21:08 +0000
Message-ID: <20191121102101.GA32514@jamwan02-TSP300>
References: <20191121071205.27511-1-james.qian.wang@arm.com>
 <20191121071205.27511-7-james.qian.wang@arm.com>
 <20191121094926.GC6236@phenom.ffwll.local>
In-Reply-To: <20191121094926.GC6236@phenom.ffwll.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR06CA0017.apcprd06.prod.outlook.com
 (2603:1096:202:2e::29) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: fe16905e-ada3-4b82-3668-08d76e6c8db2
X-MS-TrafficTypeDiagnostic: VE1PR08MB5101:|VE1PR08MB5101:|AM5PR0801MB1844:
X-MS-Exchange-PUrlCount: 2
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB1844907292C2CEEC3B860442B34E0@AM5PR0801MB1844.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:6430;OLM:6430;
x-forefront-prvs: 0228DDDDD7
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(396003)(346002)(39860400002)(376002)(366004)(136003)(199004)(189003)(86362001)(81156014)(55236004)(99286004)(52116002)(33716001)(229853002)(1076003)(6436002)(6486002)(478600001)(76176011)(966005)(66066001)(26005)(5660300002)(186003)(25786009)(8936002)(6636002)(6306002)(9686003)(102836004)(2906002)(6506007)(386003)(14454004)(305945005)(3846002)(256004)(6512007)(33656002)(14444005)(8676002)(110136005)(66946007)(446003)(6116002)(64756008)(7736002)(71200400001)(66446008)(66556008)(71190400001)(66476007)(11346002)(2501003)(58126008)(6246003)(316002)(2201001)(81166006)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB5101;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: Vt5YbTUNQs5Sxn5LuQ8e/YsbhVzG6vkP9eeFayg/mc7UjecQdgL1gncWFzbdZZrbHKmw6nnHH2Vw/QppfwDd3zMt0AOHBwG9O7zFiTAb4EABeY1RRv19UWdVnrVhykvIkO3q20Nl9ZDXOfCHOZpxVIK+UtD+Zx4m8F+a/5ynDd5nIZUbuxaqU6mUjccdkPXqry3mnCITUGY2wS5O+thYg9Qv9d4h4GVUVze9l57p5BwYi6RywE+P/Z+fKYnSCucKfa6ckUO1me+yd/EgbkKUPccTw6tI33CxDlnNsfFaceJoTTY82aoTTKTHRIkqMI+0SLn/WIqacpORDUseK5Q6TSJBnmizYTz3hvKaLLaS79f4JfLqw2njmEFBnRrR7L/Ht4k0Qo34imuEyfAEWDS8iBamgwgOZXFs6q22w8+dJLaS02USzndiJVkZ9X28kzaUU3QMu4YFsftCiouxwhb2c2kXzkV+LIuSXqEMjFIK8K8=
Content-ID: <FE7D88DA5A172F4CAEE863476F9DEDDB@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5101
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(376002)(39860400002)(396003)(346002)(136003)(1110001)(339900001)(40434004)(189003)(199004)(5660300002)(11346002)(6506007)(186003)(386003)(76176011)(26005)(8746002)(76130400001)(25786009)(102836004)(33716001)(6246003)(6512007)(9686003)(6306002)(66066001)(446003)(8936002)(50466002)(47776003)(14444005)(5024004)(70586007)(86362001)(105606002)(70206006)(6116002)(2906002)(23726003)(2201001)(22756006)(1076003)(6486002)(81156014)(478600001)(46406003)(3846002)(6636002)(26826003)(97756001)(81166006)(305945005)(229853002)(110136005)(316002)(58126008)(587094005)(2501003)(336012)(99286004)(966005)(8676002)(36906005)(7736002)(14454004)(33656002)(356004)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR0801MB1844;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Fail; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 1cd417b3-9f04-4481-64dd-08d76e6c8663
X-Forefront-PRVS: 0228DDDDD7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZLSRnNsnUOXepWVuwCSQpfynhFkoTmrCMWFN3LtVgrQnQrGhNk+j+Mpm3HAoIanZh6YjQFALlt04fkHfjQcdND5rInl8s/5APp5UCPwsQ/vc5OWaVF9PaCsCiXcb9kZOVmvjBW9W0Vv7anI8cjQH6tvXw69/nO44MZ50Qxv+ENvLC7Txz18/8Ma+PaYQYuYLM+6wPtCjcDJM4M7SF63Zv2xrLZuTXWWdo6/dp1v0+iQgcloxuhP8iJgtTGj3ngugvRkMWbj0vv+Tmz+6zwOBIyYlj230FOFSV2hkHAMdvBCXJUWJl2YRZiqs6UgQ9Fm6TtF124DvNhpf736Vsm1Pbng8MTtE77t9I2h4/NJha0CpMxLaeIm1Nikcn3TLN1vcABX1pNRWvwzIyOM7NC49wqHlrGIybPNYFX3jZti8khsTIZCBvqu+Q4oAODKSLVB00we8oJrJaRsDWb83LkVApeCUdrwZ7Buil2LFuOj2f9k=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2019 10:21:20.7973 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe16905e-ada3-4b82-3668-08d76e6c8db2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1844
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AFU0vvl438xpWahWY1n0Y+yCB/ZEwTi7EeXsTtM8zx4=;
 b=RrGVX/B2UinknpOFCSpSkEzhLLkNslD7oYvBu9ldEEv9HOBhTSD3j2NyeHYxaAQZsSHMMYhlzQHkPMduxJIKbu92N71bDX96LcdvfOceZlbKqVLN1XRVoh3SZg+B9rda+PSE5hZFieg7RdTLktrgPXv1ywADrCs9coee/4+wu0w=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+SHNq2JNFL4mqTY0KLlGETwFJgM4uMauCtLOM8c8jwM=;
 b=f28IEXCqx1BOmIP2Tj4X0lYIhl4Kjadz7XJUBWJaYbU9cF0ZjzAkQcvFDCDXX0E/08rT4pST76ZZf6IN9RIKj9rBk5hUirPqC9NiByp9OZy1n6CX11P/YKKlJ2kF6KW+cV8VQzMmS/HPx/pxTjiL6lcx1gjVyw3yUyHq5LRUCGE=
X-Mailman-Original-Authentication-Results: spf=fail (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org; dmarc=none
 action=none header.from=arm.com;
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBOb3YgMjEsIDIwMTkgYXQgMTA6NDk6MjZBTSArMDEwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBUaHUsIE5vdiAyMSwgMjAxOSBhdCAwNzoxMjo1NUFNICswMDAwLCBqYW1lcyBx
aWFuIHdhbmcgKEFybSBUZWNobm9sb2d5IENoaW5hKSB3cm90ZToKPiA+IFRoZXJlIGFyZSBzb21l
IHJlc3RyaWN0aW9ucyBpZiBIVyB3b3JrcyBvbiBzaWRlX2J5X3NpZGUsIGV4cG9zZSBpdCB2aWEK
PiA+IGNvbmZpZ19pZCB0byB1c2VyLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEphbWVzIFFpYW4g
V2FuZyAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIDxqYW1lcy5xaWFuLndhbmdAYXJtLmNvbT4KPiA+
IC0tLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9pbmNsdWRlL21hbGlkcF9wcm9k
dWN0LmggfCAzICsrLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29t
ZWRhX2Rldi5jICAgICAgfCAxICsKPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJt
L2Rpc3BsYXkvaW5jbHVkZS9tYWxpZHBfcHJvZHVjdC5oIGIvZHJpdmVycy9ncHUvZHJtL2FybS9k
aXNwbGF5L2luY2x1ZGUvbWFsaWRwX3Byb2R1Y3QuaAo+ID4gaW5kZXggMTA1M2IxMTM1MmViLi45
NmUyZTQwMTYyNTAgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkv
aW5jbHVkZS9tYWxpZHBfcHJvZHVjdC5oCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rp
c3BsYXkvaW5jbHVkZS9tYWxpZHBfcHJvZHVjdC5oCj4gPiBAQCAtMjcsNyArMjcsOCBAQCB1bmlv
biBrb21lZGFfY29uZmlnX2lkIHsKPiA+ICAgICAgICAgICAgICAgICAgICAgbl9zY2FsZXJzOjIs
IC8qIG51bWJlciBvZiBzY2FsZXJzIHBlciBwaXBlbGluZSAqLwo+ID4gICAgICAgICAgICAgICAg
ICAgICBuX2xheWVyczozLCAvKiBudW1iZXIgb2YgbGF5ZXJzIHBlciBwaXBlbGluZSAqLwo+ID4g
ICAgICAgICAgICAgICAgICAgICBuX3JpY2hzOjMsIC8qIG51bWJlciBvZiByaWNoIGxheWVycyBw
ZXIgcGlwZWxpbmUgKi8KPiA+IC0gICAgICAgICAgICAgICAgICAgcmVzZXJ2ZWRfYml0czo2Owo+
ID4gKyAgICAgICAgICAgICAgICAgICBzaWRlX2J5X3NpZGU6MSwgLyogaWYgSFcgd29ya3Mgb24g
c2lkZV9ieV9zaWRlIG1vZGUgKi8KPiA+ICsgICAgICAgICAgICAgICAgICAgcmVzZXJ2ZWRfYml0
czo1Owo+ID4gICAgIH07Cj4gPiAgICAgX191MzIgdmFsdWU7Cj4gPiAgfTsKPiA+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rldi5jCj4gPiBpbmRleCBj
M2ZhNDgzNWNiOGQuLjRkZDQ2OTlkNGUzZCAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rldi5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYuYwo+ID4gQEAgLTgzLDYgKzgzLDcgQEAg
Y29uZmlnX2lkX3Nob3coc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgZGV2aWNlX2F0dHJpYnV0
ZSAqYXR0ciwgY2hhciAqYnVmKQo+Cj4gVWgsIHRoaXMgc3lzZnMgZmlsZSBoZXJlIGxvb2tzIGEg
bG90IGxpa2UgdWFwaSBmb3Igc29tZSBjb21wb3NpdG9yIHRvCj4gZGVjaWRlIHdoYXQgdG8gZG8u
IERvIHlvdSBoYXZlIHRoZSB1c2Vyc3BhY2UgZm9yIHRoaXM/CgpZZXMsIG91ciBIV0MgZHJpdmVy
IHVzZXMgdGhpcyBjb25maWdfaWQgYW5kIHByb2R1Y3RfaWQgZm9yIGlkZW50aWZ5aW5nIHRoZQpI
VyBjYXBzLgoKPiBBbHNvIGEgZmV3IG1vcmUgdGhvdWdodHMgb24gdGhpczoKPiAtIFlvdSBjYW4n
dCBqdXN0IGFkZCBtb3JlIGZpZWxkcyB0byB1YXBpIHN0cnVjdHMuCj4gLSBUaGlzIGRvZXNuJ3Qg
cmVhbGx5IGZlZWwgbGlrZSBpdCB3YXMgZXZlciByZXZpZXdlZCB0byBmaXQgaW50byBhdG9taWMu
Cj4gLSBzeXNmcyBzaG91bGQgYmUgb25lIHZhbHVlIHBlciBmaWxlLCBub3QgYSBzbW9yZ2FzYnJv
ZCBvZiB0aGluZ3Mgc3R1ZmZlZAo+ICAgaW50byBhIGJpbmFyeSBzdHJ1Y3R1cmUuCgpJIHdpbGwg
c2VudCBhIHNlcmllcyBhbmQgc3BsaXQgdGhpcyBzdHJ1Y3QgdG8gbXVsdGlwbGUgZmlsZXMuCgp8
IFRoaXMgZG9lc24ndCByZWFsbHkgZmVlbCBsaWtlIGl0IHdhcyBldmVyIHJldmlld2VkIHRvIGZp
dCBpbnRvIGF0b21pYwoKVGhlc2UgdmFsdWVzIGRvbid0IGhhdmUgYXRvbWljIHByb2JsZW0sIHNp
bmNlIGNvbmZpZ19pZCBpcyBmb3IKcmVwcmVzZW50aW5nIHRoZSBIVyBjYXBzIGluZm8sIHdoaWNo
IGFyZSBub3QgY29uZmlndXJhYmxlLgoKVGhhbmtzCkphbWVzCgo+IC1EYW5pZWwKPgo+ID4gICAg
IG1lbXNldCgmY29uZmlnX2lkLCAwLCBzaXplb2YoY29uZmlnX2lkKSk7Cj4gPgo+ID4gICAgIGNv
bmZpZ19pZC5tYXhfbGluZV9zeiA9IHBpcGUtPmxheWVyc1swXS0+aHNpemVfaW4uZW5kOwo+ID4g
KyAgIGNvbmZpZ19pZC5zaWRlX2J5X3NpZGUgPSBtZGV2LT5zaWRlX2J5X3NpZGU7Cj4gPiAgICAg
Y29uZmlnX2lkLm5fcGlwZWxpbmVzID0gbWRldi0+bl9waXBlbGluZXM7Cj4gPiAgICAgY29uZmln
X2lkLm5fc2NhbGVycyA9IHBpcGUtPm5fc2NhbGVyczsKPiA+ICAgICBjb25maWdfaWQubl9sYXll
cnMgPSBwaXBlLT5uX2xheWVyczsKPiA+IC0tCj4gPiAyLjIwLjEKPiA+Cj4gPiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gZHJpLWRldmVsIG1haWxp
bmcgbGlzdAo+ID4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+ID4gaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKPgo+IC0tCj4g
RGFuaWVsIFZldHRlcgo+IFNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgo+IGh0
dHA6Ly9ibG9nLmZmd2xsLmNoCklNUE9SVEFOVCBOT1RJQ0U6IFRoZSBjb250ZW50cyBvZiB0aGlz
IGVtYWlsIGFuZCBhbnkgYXR0YWNobWVudHMgYXJlIGNvbmZpZGVudGlhbCBhbmQgbWF5IGFsc28g
YmUgcHJpdmlsZWdlZC4gSWYgeW91IGFyZSBub3QgdGhlIGludGVuZGVkIHJlY2lwaWVudCwgcGxl
YXNlIG5vdGlmeSB0aGUgc2VuZGVyIGltbWVkaWF0ZWx5IGFuZCBkbyBub3QgZGlzY2xvc2UgdGhl
IGNvbnRlbnRzIHRvIGFueSBvdGhlciBwZXJzb24sIHVzZSBpdCBmb3IgYW55IHB1cnBvc2UsIG9y
IHN0b3JlIG9yIGNvcHkgdGhlIGluZm9ybWF0aW9uIGluIGFueSBtZWRpdW0uIFRoYW5rIHlvdS4K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
