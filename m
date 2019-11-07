Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0BF9F3598
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 18:20:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E88536F752;
	Thu,  7 Nov 2019 17:20:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00055.outbound.protection.outlook.com [40.107.0.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B58286F752
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 17:20:11 +0000 (UTC)
Received: from VI1PR08CA0109.eurprd08.prod.outlook.com (2603:10a6:800:d4::11)
 by VI1PR0802MB2592.eurprd08.prod.outlook.com (2603:10a6:800:ae::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2430.20; Thu, 7 Nov
 2019 17:20:08 +0000
Received: from VE1EUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::200) by VI1PR08CA0109.outlook.office365.com
 (2603:10a6:800:d4::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2430.20 via Frontend
 Transport; Thu, 7 Nov 2019 17:20:08 +0000
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT003.mail.protection.outlook.com (10.152.18.108) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.21 via Frontend Transport; Thu, 7 Nov 2019 17:20:08 +0000
Received: ("Tessian outbound 6481c7fa5a3c:v33");
 Thu, 07 Nov 2019 17:20:08 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1e7dc5c9629f8928
X-CR-MTA-TID: 64aa7808
Received: from 1399717bac7f.2 (cr-mta-lb-1.cr-mta-net [104.47.5.52])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BD2C1B1A-9608-4EBB-B99B-A1B8E74CC67C.1; 
 Thu, 07 Nov 2019 17:20:02 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2052.outbound.protection.outlook.com [104.47.5.52])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1399717bac7f.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 07 Nov 2019 17:20:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V8JSzT6vC7FX7k4Ev0oq/x7Dgm8nPmsY2GlgJHpe+givImJ9RXhsG5w1kY2TE2xj+gpLkJO47p5xN5KZKpg0fHR5OBPSdLj69zxZrFDl4EbtoZWgddzkMhVwyUDRlKTpVG/4Fp7MLm6Q74GJwWxIaXz/jFWrFcpVURuHZbhlxwAKoUGlhtruoXP7hF8C7a8RfcKlfQYfcQyi/Um9afTKYNSNabmNA64rmFRbHlDSZs/ewXOpBtSoVJFgqT2aNExA2OEZOPlcR7vU3VSjg4b2YeO27pwbhKfUVDY5iJLNJx3HsPmGsQU4sVAOL5osfYtEsx8zBvqmrK5JVK5Knrsq+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nl//OdXkKSaSENZFMooJgIYbxfPQagyaHi1L9TR7vbY=;
 b=h55VOhwFwRWCG1Hf6+YSwLyY16B3TgREjqHOYkr0w3PdHfC39zV1EzblswajvMniAAJOmvGRMZZSa5mbL9yvX7+cmFweQw9y7cFGcasUwh5uF0StRmsI8pRuyuu7ege0ISf7qo4k7zjnAoOrQo74m9u//8ulJgysaxhrdSN42ofrfJXHZ/UlLeZwW0/h3JkDyUiuecR5rW7kkr5Et1aznbBeI5C+ceMYbGVXJejEgYpntD3cpuqXcBvwKvD4zoN0tVupA+tCKddxyY01mmlmhUH8PIOOwEM6wZWtD+CPn0Jk+jL+PtwnSKiOfIf4EfLA6kmfl6JDAlxuZwhE8z5KhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from AM6PR08MB3829.eurprd08.prod.outlook.com (20.178.89.14) by
 AM6PR08MB5220.eurprd08.prod.outlook.com (10.255.96.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.22; Thu, 7 Nov 2019 17:20:00 +0000
Received: from AM6PR08MB3829.eurprd08.prod.outlook.com
 ([fe80::6804:f05f:47c0:d9e]) by AM6PR08MB3829.eurprd08.prod.outlook.com
 ([fe80::6804:f05f:47c0:d9e%4]) with mapi id 15.20.2430.020; Thu, 7 Nov 2019
 17:20:00 +0000
From: Brian Starkey <Brian.Starkey@arm.com>
To: Daniel Stone <daniels@collabora.com>
Subject: Re: [PATCHv2 1/4] drm/arm: Factor out generic afbc helpers
Thread-Topic: [PATCHv2 1/4] drm/arm: Factor out generic afbc helpers
Thread-Index: AQHVk1z4dagGuzJ3bkuZ5c+Y7TNITKd9OjQAgAK+PIA=
Date: Thu, 7 Nov 2019 17:20:00 +0000
Message-ID: <20191107171959.esg2dh6dw6i2lfst@DESKTOP-E1NTVVP.localdomain>
References: <2485717.1SzL54aMiy@e123338-lin>
 <20191104221228.3588-1-andrzej.p@collabora.com>
 <20191104221228.3588-2-andrzej.p@collabora.com>
 <f4aa14e89852c9ef46ade10e8eccdb66b1adc052.camel@collabora.com>
In-Reply-To: <f4aa14e89852c9ef46ade10e8eccdb66b1adc052.camel@collabora.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: NeoMutt/20180716-849-147d51-dirty
x-originating-ip: [217.140.106.50]
x-clientproxiedby: LNXP265CA0005.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::17) To AM6PR08MB3829.eurprd08.prod.outlook.com
 (2603:10a6:20b:85::14)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Brian.Starkey@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 08c9ff2f-2f9b-4521-51b7-08d763a6bd49
X-MS-TrafficTypeDiagnostic: AM6PR08MB5220:|AM6PR08MB5220:|VI1PR0802MB2592:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0802MB2592B26D7FA099A8DA232E5CF0780@VI1PR0802MB2592.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
x-forefront-prvs: 0214EB3F68
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(346002)(366004)(136003)(376002)(199004)(189003)(26005)(486006)(1076003)(476003)(5660300002)(102836004)(2906002)(6246003)(6512007)(9686003)(4326008)(52116002)(6486002)(8936002)(186003)(229853002)(81166006)(81156014)(8676002)(6436002)(446003)(71200400001)(71190400001)(66446008)(64756008)(66556008)(66476007)(66946007)(76176011)(14444005)(6916009)(256004)(316002)(54906003)(58126008)(99286004)(66066001)(11346002)(44832011)(86362001)(6116002)(14454004)(3846002)(6506007)(478600001)(386003)(7736002)(305945005)(7416002)(25786009)(41533002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB5220;
 H:AM6PR08MB3829.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 7/2Sjzi9oq7QSFNs9dG6oZh3ifTJk6S0ZlMhBwtiymDlLol1MZAbN1PhARFDV+3HJClwZNqq2kWwvR+o0n7Jf4SxO5Dz+jc+Q1EqzbpqHP0Oyct5Jcf2C+zMMKLyF9dVwzFevTINYOjQzPCX+8DiCKaWMsf/k+SNbCxdvT5FwCQA54fBr5N9uoeTemqz+TPbiynE/9OFBSwtCUsdFIqDmDIlmsQlBLODyywIGuv4gsI2qRQy+hoDjWJ7i2QPWAL4jwCbu2IuIY6rCwj1oJTl9CVQi4MVT0pWiE6jTxW1/Wd3iYc8ivJP5IUSq0l2QrsyPr21IgoJDuZl4pCZFoIBbHD09qW7Jc9c+Bt3h1Srkt3rLtqMgpgJJYAT6yRfw1EKIi9r1pPBIylmlICMad/wCz+9rQOrn9UQd4f1uJumTBstOfoPUx7prA5ezCPsmgnf
Content-ID: <10EF444E30ACA44A9A7318789F138AF9@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5220
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Brian.Starkey@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(346002)(136003)(376002)(1110001)(339900001)(40434004)(189003)(199004)(7736002)(14454004)(8676002)(81166006)(99286004)(8936002)(36906005)(81156014)(54906003)(58126008)(3846002)(8746002)(26826003)(2906002)(25786009)(6116002)(26005)(66066001)(102836004)(386003)(486006)(50466002)(6506007)(478600001)(47776003)(86362001)(336012)(126002)(229853002)(23756003)(5024004)(305945005)(186003)(356004)(316002)(6486002)(14444005)(76176011)(1076003)(6512007)(76130400001)(5660300002)(70586007)(70206006)(22756006)(9686003)(476003)(4326008)(6246003)(11346002)(105606002)(107886003)(6862004)(446003)(41533002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0802MB2592;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Fail; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: f497a1b3-8968-4587-8682-08d763a6b810
X-Forefront-PRVS: 0214EB3F68
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7YkM0jK90B6ZzKC2Pjl1oPkuL6Hns+W5nUHMPF2rFjnCTgKdnlbn+eFNiQQTaIpoh88XjIpULohKWELzP22H/qiX2JRBKeL3dAz0ZBe6wnsolHBtJKQlgH+lQdhPeMnHcp3IM8ZmXujXDpWjCua6hbVYm6R2k83iWm65VvEt8d1jRZBC68YvldAPRy8Tk72Y0vJsZCVcWfjTXnvIvEpYkQIVabOD8q8oiXI6jrM7IPG5lvZumW5j2evYRHVx3R3cvCONRugkJy9UrH97iXAFTAk3X3eKNV5ysZkBUN/r5lKsIB5Y7yV/jgb81cTUsZM0sV1c4zqhUEG6TROHcPyiDLwaY9AIwXxN9DxVScytBEDDae+Aj/GBQlQIXAQyXSUJhMC3jC9K7OjwXlSmzVClYJ5ZJXg9ACEgHq9JlNfcyo1EsaAOCBX1eTdeWtQimsf6
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2019 17:20:08.6573 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 08c9ff2f-2f9b-4521-51b7-08d763a6bd49
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2592
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YhTvwlHnsfIFuwJZMjkPpBGGvf0Yk+gYFE5n2A92XB4=;
 b=USy/onnZDG4c1dwmxfvUq0vAu5bvsgukTawSh0Shyts+RefUdcJWpXzPD0i/S1/Fz+3E7tQbg8Maflo6CzGhTI8CADBO6XTKHDSCuSaj4APu25hFaKqmsPfTn/0a1Do7vaHYzAjb0OGJjKHv7mK6S2Atk0HGfJT6+DkO6T6rMDI=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nl//OdXkKSaSENZFMooJgIYbxfPQagyaHi1L9TR7vbY=;
 b=Rs/O3z9WKsUVoklIw0op//z+SNidJ6FAU07W98lFzHOlRtOr85QuuSGuJ0AP9+wGgYB8FATREuryqUqbJRjbaAMAcWzqB+fMXUkA0rje/si+5or/UbyHXBk+3WS2h3GrfWMKtaSYNvVOQlyFDoXHHHpQ+PZVdpDgZPMDetth4tw=
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
Cc: Ayan Halder <Ayan.Halder@arm.com>,
 "kernel@collabora.com" <kernel@collabora.com>, David Airlie <airlied@linux.ie>,
 Liviu Dudau <Liviu.Dudau@arm.com>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Mihail Atanassov <Mihail.Atanassov@arm.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGFuaWVsLAoKT24gVHVlLCBOb3YgMDUsIDIwMTkgYXQgMTE6MjY6MzZQTSArMDAwMCwgRGFu
aWVsIFN0b25lIHdyb3RlOgo+IEhpIEFuZHJ6ZWosCj4gVGhhbmtzIGZvciB0YWtpbmcgdGhpcyBv
biEgSXQncyBsb29raW5nIGJldHRlciB0aGFuIHYxIGZvciBzdXJlLiBBIGZldwo+IHRoaW5ncyBi
ZWxvdzoKPgo+IE9uIE1vbiwgMjAxOS0xMS0wNCBhdCAyMzoxMiArMDEwMCwgQW5kcnplaiBQaWV0
cmFzaWV3aWN6IHdyb3RlOgo+ID4gK2Jvb2wgZHJtX2FmYmNfY2hlY2tfb2Zmc2V0KHN0cnVjdCBk
cm1fZGV2aWNlICpkZXYsCj4gPiArICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBk
cm1fbW9kZV9mYl9jbWQyICptb2RlX2NtZCkKPiA+ICt7Cj4gPiArICAgaWYgKG1vZGVfY21kLT5v
ZmZzZXRzWzBdICE9IDApIHsKPiA+ICsgICAgICAgICAgIERSTV9ERUJVR19LTVMoIkFGQkMgYnVm
ZmVycycgcGxhbmUgb2Zmc2V0IHNob3VsZCBiZQo+ID4gMFxuIik7Cj4gPiArICAgICAgICAgICBy
ZXR1cm4gZmFsc2U7Cj4gPiArICAgfQo+ID4gKwo+ID4gKyAgIHJldHVybiB0cnVlOwo+ID4gK30K
PiA+ICtFWFBPUlRfU1lNQk9MX0dQTChkcm1fYWZiY19jaGVja19vZmZzZXQpOwo+Cj4gSXMgdGhp
cyBhY3R1YWxseSB1bml2ZXJzYWxseSB0cnVlPyBJZiB0aGUgb2Zmc2V0IGlzIHN1ZmZpY2llbnRs
eQo+IGFsaWduZWQgZm9yIChlLmcuKSBETUEgdHJhbnNmZXJzIHRvIHN1Y2NlZWQsIGlzIHRoZXJl
IGFueSByZWFzb24gd2h5IGl0Cj4gbXVzdCBiZSB6ZXJvPwo+Cj4gPiArYm9vbCBkcm1fYWZiY19j
aGVja19zaXplX2FsaWduKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCj4gPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3QgZHJtX21vZGVfZmJfY21kMiAqbW9kZV9jbWQpCj4g
PiArewo+ID4gKyAgIHN3aXRjaCAobW9kZV9jbWQtPm1vZGlmaWVyWzBdICYKPiA+IEFGQkNfRk9S
TUFUX01PRF9CTE9DS19TSVpFX01BU0spIHsKPiA+ICsgICBjYXNlIEFGQkNfRk9STUFUX01PRF9C
TE9DS19TSVpFXzE2eDE2Ogo+ID4gKyAgICAgICAgICAgaWYgKChtb2RlX2NtZC0+d2lkdGggJSAx
NikgfHwgKG1vZGVfY21kLT5oZWlnaHQgJSAxNikpCj4gPiB7Cj4KPiBUaGlzIGlzIGEgZGVhbGJy
ZWFrZXIgZm9yIG1hbnkgcmVzb2x1dGlvbnM6IGZvciBleGFtcGxlLCAxMzY2eDc2OCBpc24ndAo+
IGNsZWFubHkgZGl2aXNpYmxlIGJ5IDE2IGluIHdpZHRoLiBTbyB0aGlzIG1lYW5zIHRoYXQgd2Ug
d291bGQgaGF2ZSB0bwo+IGVpdGhlciB1c2UgYSBsYXJnZXIgYnVmZmVyIGFuZCBjcm9wLCBvciBz
Y2FsZSwgb3Igc29tZXRoaW5nLgo+Cj4gTm8gdXNlcnNwYWNlIGlzIHByZXBhcmVkIHRvIGFsaWdu
IGZiIHdpZHRoL2hlaWdodCB0byB0aWxlIGRpbWVuc2lvbnMKPiBsaWtlIHRoaXMsIHNvIHRoaXMg
Y2hlY2sgd2lsbCBiYXNpY2FsbHkgZmFpbCBldmVyeXdoZXJlLgo+Cj4gSG93ZXZlciwgb3ZlcmFs
bG9jYXRpb24gcmVsYXRpdmUgdG8gdGhlIGRlY2xhcmVkIHdpZHRoL2hlaWdodCBpc24ndCBhCj4g
cHJvYmxlbSBhdCBhbGwuIEluIG9yZGVyIHRvIGRlYWwgd2l0aCBob3Jpem9udGFsIGFsaWdubWVu
dCwgeW91IHNpbXBseQo+IG5lZWQgdG8gZW5zdXJlIHRoYXQgdGhlIHN0cmlkZSBpcyBhIG11bHRp
cGxlIG9mIHRoZSB0aWxlIHdpZHRoOyBmb3IKPiB2ZXJ0aWNhbCBhcnJhbmdlbWVudCwgdGhhdCB0
aGUgYnVmZmVyIGlzIGxhcmdlIGVub3VnaCB0byBjb250YWluCj4gc3VmZmljaWVudCAnbGluZXMn
IHRvIHRoZSBuZXh0IHRpbGUgYm91bmRhcnkuCj4KPiBpLmUuIHJhdGhlciB0aGFuIGNoZWNraW5n
IHdpZHRoL2hlaWdodCwgeW91IHNob3VsZCBjaGVjazoKPiAgICogZmJfc3RyaWRlID49IChBTElH
TihmYl93aWR0aCwgdGlsZV93aWR0aCksIGJwcCkKPiAgICogYnVmX3NpemUgPj0gZmJfc3RyaWRl
ICogQUxJR04oZmJfaGVpZ2h0LCB0aWxlX2hlaWdodCkKCldlbGwsIHNvcnQgb2YuCgpJIGFncmVl
IHdpdGggeW91IHRoYXQgZm9yIGhvcml6b250YWwgcGFkZGluZywgd2UgY2FuIGluZGVlZCB1c2Ug
cGl0Y2guCgpIb3dldmVyLCB0aGUgQUZCQyBkZWNvZGVyKHMpIG5lZWQgdG8ga25vdyBleGFjdGx5
IHdoYXQgdGhlIHRvdGFsCl9hbGxvY2F0ZWRfIHNpemUgaW4gcGl4ZWxzIG9mIHRoZSBidWZmZXIg
aXMgLSBhcyB0aGlzIGluZmx1ZW5jZXMgdGhlCmhlYWRlciBzaXplLCBhbmQgd2UgbmVlZCB0byBr
bm93IHRoZSBoZWFkZXIgc2l6ZSB0byBrbm93IHdoZXJlIGl0IGVuZHMKYW5kIHRoZSBib2R5IGJl
Z2lucy4KCkkgc2VlIGEgY291cGxlIG9mIHBvc3NpYmxlIHdheXMgZm9yd2FyZHM6CgogLSBLZWVw
IGl0IGFzLWlzLiBUaGUgcmVzdHJpY3RpdmUgY2hlY2tzIGVuc3VyZSB0aGF0IHRoZXJlJ3Mgbm8K
ICAgYW1iaWd1aXR5IGFuZCB3ZSB1c2UgdGhlIGZiIHdpZHRoL2hlaWdodCB0byBkZXRlcm1pbmUg
dGhlIHJlYWwKICAgYWxsb2NhdGVkIHdpZHRoL2hlaWdodC4gVXNlcnNwYWNlIG5lZWRzIHRvIGJl
IEFGQkMtYXdhcmUgYW5kIHNldCB1cAogICBwbGFuZSBjcm9wcGluZyB0byBoYW5kbGUgdGhlIGFs
aWdubWVudCBkaWZmZXJlbmNlcy4KCiAtIFVzZSBwaXRjaCB0byBkZXRlcm1pbmUgdGhlICJyZWFs
IiB3aWR0aCwgYW5kIGludGVybmFsbHkgaW4gdGhlCiAgIGtlcm5lbCBhbGlnbiBoZWlnaHQgdXAg
dG8gdGhlIG5leHQgYWxpZ25tZW50IGJvdW5kYXJ5LiBUaGlzIHdvcmtzCiAgIE9LLCBzbyBsb25n
IGFzIHRoZXJlJ3Mgbm8gYWRkaXRpb25hbCBwYWRkaW5nIGF0IHRoZSBib3R0b20gb2YgdGhlCiAg
IGJ1ZmZlci4gVGhpcyB3b3VsZCB3b3JrLCBidXQgSSBjYW4ndCBmaWd1cmUgYSB3YXkgdG8gY2hl
Y2svZW5mb3JjZQogICB0aGF0IHRoZXJlJ3Mgbm8gYWRkaXRpb25hbCBwYWRkaW5nIGF0IHRoZSBi
b3R0b20uCgogLSBTb21ldGhpbmcgZWxzZS4uLgoKVGhlIGNoZWNrcyBhcy1pbXBsZW1lbnRlZCB3
ZXJlIGRlbGliZXJhdGVseSBjb25zZXJ2YXRpdmUsIGFuZCBkb24ndApwcmVjbHVkZSBkb2luZyBz
b21lIHJlbGF4YXRpb24gaW4gdGhlIGZ1dHVyZS4KCk9uIEFuZHJvaWQsIGdyYWxsb2MgaXMgdXNl
ZCB0byBzdG9yZSB0aGUgInJlYWwiIGFsbG9jYXRlZCB3aWR0aC9oZWlnaHQKYW5kIHRoaXMgaXMg
dXNlZCB0byBzZXQgdXAgdGhlIERSTSBBUEkgYXBwcm9wcmlhdGVseS4KCj4KPiBUaGlzIG1heSBm
b3JjZSB1cyB0byBkbyBzb21lIHNpbGx5IGNyb3BwaW5nIGdhbWVzIGluc2lkZSB0aGUgUm9ja2No
aXAKPiBLTVMgZHJpdmVyLCBidXQgSSBmZWVsIGl0IGJlYXRzIHRoZSBhbHRlcm5hdGl2ZSBvZiBi
cmVha2luZyB1c2Vyc3BhY2UuCgpXZWxsLCBub3RoaW5nJ3MgZ29pbmcgdG8gZ2V0IGJyb2tlbiAt
IGl0J3MganVzdCBwZXJoYXBzIG5vdCByZWFkeSB0bwp0dXJuIG9uIEFGQkMgeWV0LgoKPgo+ID4g
KyAgICAgICAgICAgICAgICAgICBEUk1fREVCVUdfS01TKAo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICJBRkJDIGJ1ZmZlciBtdXN0IGJlIGFsaWduZWQgdG8gMTYKPiA+IHBpeGVsc1xu
Igo+ID4gKyAgICAgICAgICAgICAgICAgICApOwo+ID4gKyAgICAgICAgICAgICAgICAgICByZXR1
cm4gZmFsc2U7Cj4gPiArICAgICAgICAgICB9Cj4gPiArICAgICAgICAgICBicmVhazsKPiA+ICsg
ICBjYXNlIEFGQkNfRk9STUFUX01PRF9CTE9DS19TSVpFXzMyeDg6Cj4gPiArICAgICAgICAgICAv
KiBmYWxsIHRocm91Z2ggKi8KPgo+IEl0J3MgYWxzbyBpbmNvbmdydW91cyB0aGF0IDMyeDggaXMg
dW5zdXBwb3J0ZWQgaGVyZSwgYnV0IGhhcyBhIHNlY3Rpb24KPiBpbiBnZXRfc3VwZXJibGtfd2g7
IHBsZWFzZSBoYXJtb25pc2UgdGhlbSBzbyB0aGlzIHNlY3Rpb24gZWl0aGVyIGRvZXMKPiB0aGUg
Y2hlY2tzIGFzIGFib3ZlLCBvciB0aGF0IGdldF9zdXBlcmJsa193aCBkb2Vzbid0IHN1cHBvcnQg
MzJ4OAo+IGVpdGhlci4KPgo+ID4gK2Jvb2wgZHJtX2FmYmNfY2hlY2tfZmJfc2l6ZV9yZXQodTMy
IHBpdGNoLCBpbnQgYnBwLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgIHUzMiB3LCB1
MzIgaCwgdTMyIHN1cGVyYmxrX3csIHUzMgo+ID4gc3VwZXJibGtfaCwKPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICBzaXplX3Qgc2l6ZSwgdTMyIG9mZnNldCwgdTMyIGhkcl9hbGlnbiwK
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICB1MzIgKnBheWxvYWRfb2ZmLCB1MzIgKnRv
dGFsX3NpemUpCj4gPiArewo+ID4gKyAgIGludCBuX3N1cGVyYmxrcyA9IDA7Cj4gPiArICAgdTMy
IHN1cGVyYmxrX3N6ID0gMDsKPiA+ICsgICB1MzIgYWZiY19zaXplID0gMDsKPgo+IFBsZWFzZSBk
b24ndCBpbml0aWFsaXNlIHRoZSBhYm92ZSB0aHJlZSB2YXJpYWJsZXMsIGdpdmVuIHRoYXQgeW91
IGdvIG9uCj4gdG8gaW1tZWRpYXRlbHkgY2hhbmdlIHRoZWlyIHZhbHVlcy4gSW4gdGhpcyBjYXNl
LCBpbml0aWFsaXNpbmcgdG8gemVybwo+IGNhbiBvbmx5IGhpZGUgbGVnaXRpbWF0ZSB1bmluaXRp
YWxpc2VkLXZhcmlhYmxlLXVzZSB3YXJuaW5ncy4KPgo+ID4gKyAgIG5fc3VwZXJibGtzID0gKHcg
LyBzdXBlcmJsa193KSAqIChoIC8gc3VwZXJibGtfaCk7Cj4gPiArICAgc3VwZXJibGtfc3ogPSAo
YnBwICogc3VwZXJibGtfdyAqIHN1cGVyYmxrX2gpIC8gQklUU19QRVJfQllURTsKPiA+ICsgICBh
ZmJjX3NpemUgPSBBTElHTihuX3N1cGVyYmxrcyAqIEFGQkNfSEVBREVSX1NJWkUsIGhkcl9hbGln
bik7Cj4gPiArICAgKnBheWxvYWRfb2ZmID0gYWZiY19zaXplOwo+ID4gKwo+ID4gKyAgIGFmYmNf
c2l6ZSArPSBuX3N1cGVyYmxrcyAqIEFMSUdOKHN1cGVyYmxrX3N6LAo+ID4gQUZCQ19TVVBFUkJM
S19BTElHTk1FTlQpOwo+ID4gKyAgICp0b3RhbF9zaXplID0gYWZiY19zaXplICsgb2Zmc2V0Owo+
Cj4gR2VuZXJhbGx5IHRoZXNlIGFyZSByZWZlcnJlZCB0byBhcyAndGlsZXMnIHJhdGhlciB0aGFu
ICdzdXBlcmJsb2NrcycsCj4gZ2l2ZW4gdGhhdCBJIHdvdWxkIG9ubHkgZXhwZWN0IG9uZSBzdXBl
cmJsb2NrIHBlciBidWZmZXIsIGJ1dCBpZiB0aGF0J3MKPiB0aGUgdGVybWlub2xvZ3kgQUZCQyB1
c2VzIHRoZW4gaXQgbWlnaHQgYmUgYmV0dGVyIHRvIHN0aWNrIHdpdGggaXQuCj4KPiA+ICsgICBp
ZiAoKHcgKiBicHApICE9IChwaXRjaCAqIEJJVFNfUEVSX0JZVEUpKSB7Cj4gPiArICAgICAgICAg
ICBEUk1fREVCVUdfS01TKCJJbnZhbGlkIHZhbHVlIG9mIChwaXRjaCAqIEJJVFNfUEVSX0JZVEUp
Cj4gPiAoPSV1KSBzaG91bGQgYmUgc2FtZSBhcyB3aWR0aCAoPSV1KSAqIGJwcCAoPSV1KVxuIiwK
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgcGl0Y2ggKiBCSVRTX1BFUl9CWVRFLCB3LCBi
cHAKPiA+ICsgICAgICAgICAgICk7Cj4gPiArICAgICAgICAgICByZXR1cm4gZmFsc2U7Cj4gPiAr
ICAgfQo+Cj4gSGF2aW5nIGEgdG9vLXNtYWxsIHBpdGNoIGlzIG9idmlvdXNseSBhIHByb2JsZW0g
YW5kIHdlIHNob3VsZCByZWplY3QKPiBpdC4gQnV0IGlzIGhhdmluZyBhIHRvby1sYXJnZSBwaXRj
aCByZWFsbHkgYSBwcm9ibGVtOyBkb2VzIGl0IG5lZWQgdG8KPiBiZSBhbiBleGFjdCBtYXRjaCwg
b3IgY2FuIHdlIHN1cHBvcnQgdGhlIGNhc2Ugd2hlcmUgdGhlIHBpdGNoIGlzIHRvbwo+IGxhcmdl
IGJ1dCBhbHNvIHRpbGUtYWxpZ25lZD8gSWYgd2UgY2FuLCBpdCB3b3VsZCBiZSB2ZXJ5IGdvb2Qg
dG8KPiBzdXBwb3J0IHRoYXQuCgpUaGUgcmVhc29uIGZvciBmb3JjaW5nIGl0IHRvIGJlIGV4YWN0
IGlzIGFzIEkgc2FpZCBhYm92ZSAtIHdlIF9tdXN0Xwprbm93IHdoYXQgdGhlICJyZWFsIiB3aWR0
aCBhbmQgaGVpZ2h0IGlzLiBJbXBsZW1lbnRpbmcgdGhpcyBjaGVjayB0bwpmb3JjZSAocGl0Y2gg
PT0gd2lkdGggKiBicHApIGVuc3VyZXMgdGhhdCwgYW5kIGFsc28gbGVhdmVzIHRoZSBvcHRpb24K
Zm9yIHVzIHRvIHJlbGF4IHRvIGFsbG93IGEgbGFyZ2VyIHBpdGNoIChhcyBhYm92ZSkgaWYgdGhh
dCB3YXMgdGhlCnByZWZlcnJlZCBhcHByb2FjaCBmb3IgYWxpZ25tZW50LgoKSW4gZ2VuZXJhbCB0
aGUgY3VycmVudCBjaGVja3MgYXJlIGRlbGliZXJhdGVseSBkZXNpZ25lZCB0byBsZWF2ZSB0aGUK
ZG9vciBvcGVuIGZvciBmdXR1cmUgaW1wcm92ZW1lbnRzIHdpdGhvdXQgYnJlYWtpbmcgYW55dGhp
bmcuCgpDaGVlcnMsCi1CcmlhbgoKPgo+IENoZWVycywKPiBEYW5pZWwKPgpJTVBPUlRBTlQgTk9U
SUNFOiBUaGUgY29udGVudHMgb2YgdGhpcyBlbWFpbCBhbmQgYW55IGF0dGFjaG1lbnRzIGFyZSBj
b25maWRlbnRpYWwgYW5kIG1heSBhbHNvIGJlIHByaXZpbGVnZWQuIElmIHlvdSBhcmUgbm90IHRo
ZSBpbnRlbmRlZCByZWNpcGllbnQsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciBpbW1lZGlhdGVs
eSBhbmQgZG8gbm90IGRpc2Nsb3NlIHRoZSBjb250ZW50cyB0byBhbnkgb3RoZXIgcGVyc29uLCB1
c2UgaXQgZm9yIGFueSBwdXJwb3NlLCBvciBzdG9yZSBvciBjb3B5IHRoZSBpbmZvcm1hdGlvbiBp
biBhbnkgbWVkaXVtLiBUaGFuayB5b3UuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
