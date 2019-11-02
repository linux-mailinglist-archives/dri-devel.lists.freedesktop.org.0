Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 922E2EDA28
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2019 08:54:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 386A36E151;
	Mon,  4 Nov 2019 07:54:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-eopbgr1310103.outbound.protection.outlook.com [40.107.131.103])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D68A6E375
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Nov 2019 06:17:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f+Du7S6uSi5cJY2QzDCqW7iuEoboS2XTL4Teay42wSObyhkhmh6ZvzQVIohjQOYmCuYB3+HuqyeYMH2DDGJEfGsXQnQiBQAyiJ72BK9AWGQNgxMZNmygsge1LE/3x9oWSq2pPBm7M/dSNqQqsKz3DgIujVAc0BAiXaVCu48xNvlDYgPViGk67+PDZN56VW2SGv7IcREa6jfgh7l4CdUP0cuGx0mWASnfLCHBlJWo2wdbc2Wv4AyFYxeUAb7ZObpVuE5xdCM3zdHHZgURaslDzotSuF6BcH86YRYwAtB7dyr0FSEFYCUgvdj9qnNNdyXkDKhSbugQvHB3gFAI5Bw6wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SO4sO1z+ffKrKW8H3i+vsIhAt/FsBZwTCu2jZkGHcSc=;
 b=ImovqjVAvrORk14lUdbvT7lswIphm09ljgVoBsPZ7yfW5uLWMT4XTZNlNwYFrzRPbo5Z1Rfn7z7NrdXlHOUcVJNFMLd/ZvbUHelI6BYTVc6vYWKqyY6RXG84VS15EtXdViYQChwNPvEx91aXoekuv6jjhOdKfVWfB/j3rj5GwaNVI25fPvrXbmdSU9UTwRmjktLe5l9bsSOhg8kkXiNHpNrKpUEOhl5dQUq0SL53AmRGygTr8xgjW0qdDE3ZtbXFmCl3GZy8hDjoNdptrW+HkYrF9OYpeExtGCyX5W0O8/SuQirc7kbpmh8leUCfsZt8gAOr93+Ky4f5BMgr3+P+mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
Received: from PU1P153MB0169.APCP153.PROD.OUTLOOK.COM (10.170.189.13) by
 PU1P153MB0186.APCP153.PROD.OUTLOOK.COM (10.170.187.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.7; Sat, 2 Nov 2019 06:17:22 +0000
Received: from PU1P153MB0169.APCP153.PROD.OUTLOOK.COM
 ([fe80::69f1:c9:209a:1809]) by PU1P153MB0169.APCP153.PROD.OUTLOOK.COM
 ([fe80::69f1:c9:209a:1809%2]) with mapi id 15.20.2430.010; Sat, 2 Nov 2019
 06:17:22 +0000
From: Dexuan Cui <decui@microsoft.com>
To: Wei Hu <weh@microsoft.com>, "b.zolnierkie@samsung.com"
 <b.zolnierkie@samsung.com>, KY Srinivasan <kys@microsoft.com>, Haiyang Zhang
 <haiyangz@microsoft.com>, Stephen Hemminger <sthemmin@microsoft.com>,
 "sashal@kernel.org" <sashal@kernel.org>, "hch@lst.de" <hch@lst.de>,
 "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>, "robin.murphy@arm.com"
 <robin.murphy@arm.com>, "mchehab+samsung@kernel.org"
 <mchehab+samsung@kernel.org>, "sam@ravnborg.org" <sam@ravnborg.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
 "info@metux.net" <info@metux.net>, "arnd@arndb.de" <arnd@arndb.de>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "dcui@microsoft.com" <dcui@microsoft.com>, Michael Kelley
 <mikelley@microsoft.com>
Subject: RE: [PATCH] video: hyperv: hyperv_fb: Use physical memory for fb on
 HyperV Gen 1 VMs.
Thread-Topic: [PATCH] video: hyperv: hyperv_fb: Use physical memory for fb on
 HyperV Gen 1 VMs.
Thread-Index: AQHViMlWrXYtpApox02C+wFzOSr7Mqd3cNRA
Date: Sat, 2 Nov 2019 06:17:21 +0000
Message-ID: <PU1P153MB01690579FA52DCDF964AE179BF7D0@PU1P153MB0169.APCP153.PROD.OUTLOOK.COM>
References: <20191022110905.4032-1-weh@microsoft.com>
In-Reply-To: <20191022110905.4032-1-weh@microsoft.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Owner=decui@microsoft.com;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2019-11-02T06:17:20.0215252Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=4eba7dcd-726f-4dbc-aee3-a2c3ebaeee78;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Extended_MSFT_Method=Automatic
x-originating-ip: [2601:600:a280:7f70:f1df:b100:5b7:2fb9]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 7c71a8cf-bc8a-4aa3-ca6e-08d75f5c5278
x-ms-traffictypediagnostic: PU1P153MB0186:|PU1P153MB0186:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <PU1P153MB018663BCF459F3D1D197BE2FBF7D0@PU1P153MB0186.APCP153.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0209425D0A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(366004)(376002)(39860400002)(346002)(136003)(189003)(199004)(76176011)(2906002)(9686003)(81166006)(6436002)(7416002)(2501003)(46003)(229853002)(5660300002)(186003)(52536014)(2201001)(14454004)(33656002)(102836004)(66556008)(74316002)(7736002)(81156014)(22452003)(305945005)(8676002)(66946007)(110136005)(66476007)(316002)(4744005)(8990500004)(7696005)(66446008)(86362001)(76116006)(99286004)(486006)(446003)(6506007)(14444005)(1511001)(64756008)(10290500003)(71190400001)(55016002)(8936002)(256004)(1250700005)(6116002)(11346002)(6246003)(476003)(478600001)(6636002)(71200400001)(25786009)(10090500001)(921003)(1121003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:PU1P153MB0186;
 H:PU1P153MB0169.APCP153.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: agcJjU65hYd96Mz4pYn562usIB46stdUd0ocknLZsYReDTi+C1KewR4XaxJnPFtWnL0ieEilE0reWrdeGoipper05wIeOQ8zogG6nIAY2G2I99npwKwPd+mJdMNYUzbCNBNi+RLcd1O4xuiikSil+2wAFZwIGBoTQkCpt2gDbEbBPJqK7k3apW9UX7azev/NUzgiSwhBuKozUmHzLdlZojrnqtnXhYKZQhKBWtk3uufsbG5Ke9bPmSF0HANrKbYQHhfBmPKhUc2vZgM4GS93tCoCHjvd8mPip42KaSXRjvfNQqORiJAq0wc4M5c3Ln6mOHf7llrC0l/n/hdDbNxrSSOpuJoUGWJh0s8q3ryC5cy1Q3x5Jlc77nsC4fdYJmCgGVKPx5JNSSfAveFmbiEmbZ3ts+msX/1BrasGLVKdasgC2yBkCez2d5iw+0VYYN37
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c71a8cf-bc8a-4aa3-ca6e-08d75f5c5278
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2019 06:17:21.6105 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SsM+tdNqUOiLKkfLPm6jswx+wJxwf/BI+oYiY1KA7KbDaZqSNbU4sQBCVJiJMA3ml28Iu9E+6ihZyhAhgCIYkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU1P153MB0186
X-Mailman-Approved-At: Mon, 04 Nov 2019 07:54:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microsoft.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SO4sO1z+ffKrKW8H3i+vsIhAt/FsBZwTCu2jZkGHcSc=;
 b=Dy/nCnuY/t5SB5D9fWj3/pSwvVDWjBTIRvFz4y0img4qYBW/6r15YribGlXYTtqWk8lGlv+NhMbRXxtMzepqRT01Sz8bGoRpAmnSOimhw0f0m7oCLrpMPO99gGGM1svBdhdOCoX57R8+3jBVkyc32E5wWi5pjxFQpQcHp3YMRFI=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=decui@microsoft.com; 
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

PiBGcm9tOiBsaW51eC1oeXBlcnYtb3duZXJAdmdlci5rZXJuZWwub3JnCj4gPGxpbnV4LWh5cGVy
di1vd25lckB2Z2VyLmtlcm5lbC5vcmc+IE9uIEJlaGFsZiBPZiBXZWkgSHUKPiBTZW50OiBUdWVz
ZGF5LCBPY3RvYmVyIDIyLCAyMDE5IDQ6MTEgQU0KPiAuLi4gCj4gKwkvKiBBbGxvY2F0ZSBmcm9t
IENNQSAqLwo+ICsJLy8gcmVxdWVzdF9wYWdlcyA9IChyZXF1ZXN0X3NpemUgPj4gUEFHRV9TSElG
VCkgKyAxOwoKIi8vIiBzZWVtcyByYXJlIGluIExpbnV4IGtlcm5lbCBjb2RlLgpJTU8gIi8qICov
IiBpcyBtb3JlIGNvbW1vbi4KCj4gKwkJCXByX2luZm8oIlVuYWJsZSB0byBhbGxvY2F0ZSBlbm91
Z2ggY29udGlndW91cyBwaHlzaWNhbCBtZW1vcnkKPiBvbiBHZW4gMSBWTS4gVXNlIE1NSU8gaW5z
dGVhZC5cbiIpOwoKVGhlIGxpbmUgZXhjZWVkcyA4MCBjaGFycy4KIAo+IEBAIC0xMDYwLDYgKzEx
NjgsNyBAQCBzdGF0aWMgaW50IGh2ZmJfcHJvYmUoc3RydWN0IGh2X2RldmljZSAqaGRldiwKPiAg
CXBhciA9IGluZm8tPnBhcjsKPiAgCXBhci0+aW5mbyA9IGluZm87Cj4gIAlwYXItPmZiX3JlYWR5
ID0gZmFsc2U7Cj4gKwlwYXItPm5lZWRfZG9jb3B5ID0gZmFsc2U7CgpNYXliZSBpdCdzIGJldHRl
ciBpZiB3ZSBzZXQgdGhlIGRlZmF1bHQgdmFsdWUgdG8gdHJ1ZT8gVGhpcyB3YXkgd2UgY2FuIHNh
dmUKdGhlICIJcGFyLT5uZWVkX2RvY29weSA9IHRydWU7IiBpbiBodmZiX2dldG1lbSgpLgoKVGhh
bmtzLAotLSBEZXh1YW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
