Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D57F43CA
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2019 10:46:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32CE56F8ED;
	Fri,  8 Nov 2019 09:46:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40048.outbound.protection.outlook.com [40.107.4.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1455C6F8ED
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2019 09:46:20 +0000 (UTC)
Received: from HE1PR0802CA0004.eurprd08.prod.outlook.com (2603:10a6:3:bd::14)
 by DB8PR08MB4154.eurprd08.prod.outlook.com (2603:10a6:10:b1::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2408.24; Fri, 8 Nov
 2019 09:46:17 +0000
Received: from AM5EUR03FT056.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::206) by HE1PR0802CA0004.outlook.office365.com
 (2603:10a6:3:bd::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2430.20 via Frontend
 Transport; Fri, 8 Nov 2019 09:46:17 +0000
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT056.mail.protection.outlook.com (10.152.17.224) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2430.21 via Frontend Transport; Fri, 8 Nov 2019 09:46:16 +0000
Received: ("Tessian outbound 6481c7fa5a3c:v33");
 Fri, 08 Nov 2019 09:46:16 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7e66395cc7a8afcb
X-CR-MTA-TID: 64aa7808
Received: from 21c082c59466.2 (cr-mta-lb-1.cr-mta-net [104.47.0.57])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D999B228-FCBD-4190-AFF8-D47EC062FB22.1; 
 Fri, 08 Nov 2019 09:46:11 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2057.outbound.protection.outlook.com [104.47.0.57])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 21c082c59466.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 08 Nov 2019 09:46:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cLxWG7XNfI0G4F1j86D4IObjKIlH9xpBNdkiaXuFLeZW/jWGwzADM7SyjOR0Qp9tHCEZfZc8X9q2oPtAO+w+GsLjLJTZO9pgeWeFyONX/dUjy285lcohiGh8IRIANLTvf4C0WomGoZJK5liAhFS96vx23XXlgWpiXeBJRv3LFNTLT2eCfXyX4FExZhtWKrG0cg5aG9EMXbMnpXfMcCpYeYIc8uhmUpP9j7p7CNe7swvt9DtnazTCG3dJCj6POK21QndYJ206+Y4sr8s5tAZzifaO8MYs2NSgg+daFqWqByBvDnH2xSQVCAM0NVELDyhm2H1P3OvjvCtgB1vhn4chlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sidRalFg5EBz9n1KfOz5u+nnduKfQpnYyMRTz7e02gU=;
 b=AUthSCy+J/hAvQYbTgIcxpQxywbDibw80sWWuMz5Ufsut3J4VArzrfiiwcwmkmS8gIQCjd9PGvLeQqUu8i7YNl6iv3+N7JLcsnpmP/PARsR9wogW1zb3OI6rvUdRhwGgfUbBiKhRerZIlj3Ux2V2q+iYw+3S2UW0KXLVMGF2CviuwZq64O4odUgNC2bqoFTDhvtbjjWKXXmo4iZ/b7Dag7XoqRgOt5Q6ThwA2gJDWO51SMrymjVrMRxiZbZ/E/mRfEEWBr4ECBmQmJqAnlgIHb7DxZ5gLSW3tBSrfrobt705AN5XQoVd6zMNnwZTcdGwYhbmviYCT3hv+Wob2ywqqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from AM6PR08MB3829.eurprd08.prod.outlook.com (20.178.89.14) by
 AM6PR08MB3173.eurprd08.prod.outlook.com (52.135.167.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.22; Fri, 8 Nov 2019 09:46:08 +0000
Received: from AM6PR08MB3829.eurprd08.prod.outlook.com
 ([fe80::6804:f05f:47c0:d9e]) by AM6PR08MB3829.eurprd08.prod.outlook.com
 ([fe80::6804:f05f:47c0:d9e%4]) with mapi id 15.20.2430.023; Fri, 8 Nov 2019
 09:46:08 +0000
From: Brian Starkey <Brian.Starkey@arm.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCHv2 1/4] drm/arm: Factor out generic afbc helpers
Thread-Topic: [PATCHv2 1/4] drm/arm: Factor out generic afbc helpers
Thread-Index: AQHVk1z4dagGuzJ3bkuZ5c+Y7TNITKd9OjQAgAK+PICAAANcgIAABM6AgAAbpACAAO+3gA==
Date: Fri, 8 Nov 2019 09:46:08 +0000
Message-ID: <20191108094607.iy4evnixsiw7ogfu@DESKTOP-E1NTVVP.localdomain>
References: <2485717.1SzL54aMiy@e123338-lin>
 <20191104221228.3588-1-andrzej.p@collabora.com>
 <20191104221228.3588-2-andrzej.p@collabora.com>
 <f4aa14e89852c9ef46ade10e8eccdb66b1adc052.camel@collabora.com>
 <20191107171959.esg2dh6dw6i2lfst@DESKTOP-E1NTVVP.localdomain>
 <CAKMK7uGDqS2ygHjmbTS0rjgYx0LJ9-hAmOvYqEoi7z4TSHY-rA@mail.gmail.com>
 <20191107174913.yme5kd6iva2kc7hw@DESKTOP-E1NTVVP.localdomain>
 <20191107192808.GS23790@phenom.ffwll.local>
In-Reply-To: <20191107192808.GS23790@phenom.ffwll.local>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: NeoMutt/20180716-849-147d51-dirty
x-originating-ip: [217.140.106.53]
x-clientproxiedby: CWLP123CA0078.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:401:5b::18) To AM6PR08MB3829.eurprd08.prod.outlook.com
 (2603:10a6:20b:85::14)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Brian.Starkey@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b649306e-55d7-431b-3053-08d764308044
X-MS-TrafficTypeDiagnostic: AM6PR08MB3173:|AM6PR08MB3173:|DB8PR08MB4154:
X-MS-Exchange-PUrlCount: 1
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB8PR08MB415496D6C16327EAE425007FF07B0@DB8PR08MB4154.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
x-forefront-prvs: 0215D7173F
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(136003)(366004)(396003)(39860400002)(51444003)(189003)(199004)(40434004)(81166006)(81156014)(7736002)(587094005)(478600001)(14454004)(229853002)(99286004)(25786009)(6916009)(52116002)(4326008)(186003)(3846002)(45080400002)(256004)(5024004)(54906003)(2906002)(316002)(966005)(8936002)(6306002)(26005)(66066001)(14444005)(71200400001)(446003)(476003)(66946007)(11346002)(102836004)(76176011)(386003)(64756008)(53546011)(66446008)(66556008)(7416002)(58126008)(6116002)(561944003)(66476007)(5660300002)(305945005)(44832011)(6512007)(9686003)(71190400001)(1076003)(6246003)(6486002)(6506007)(6436002)(8676002)(86362001)(486006)(30864003)(41533002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB3173;
 H:AM6PR08MB3829.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: uxc7enum/GO/ezSNIopuhCNyIAFhkwUqZCvZnS5BYLe2C30hLJkYwjNHJN5Iw1uSAIxMwm08QhFIOH7ykN0XKsAyjpHoGMiL7pch7PhwSewkGaU2jGkZ5LtogdegfyMAHsj4mxvxGWaITMK9UFf7rdLrzs79QTIgoDmcdvdVPIzKOgvrsOSV6D/p7ZPwJln0RBPIyuwFmgcQbA+/rd8rD2XJEcLDWE1M3QGqBsVmj+MY8vnw50/7m9Z/td7Ouc7ytgYDyjbW7xQFf0Mz0AWj6DfFIBNDmKOCrqrwfPQIu+mGl0zxRmgQYsrghXAupQ+Y/iAYdz0ga+cEEBRmqxDNCbX3DdbTFMkqJjNglsxDGfP2iGmne73VUOEfmmdsuQ50TaTKMUNi0pxafvtmh61PqjVeTd0QMsnS2lmISmAa5dZU5STOeq/3hGZhxkfyIwAtOO+VKhwavrdNYRa+GzMh3zZUeAVcmtVmY6CQ2bc6BL0=
Content-ID: <2C15A1EBAA602148855A074DC3B99379@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3173
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Brian.Starkey@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(396003)(136003)(376002)(1110001)(339900001)(189003)(40434004)(51444003)(199004)(587094005)(22756006)(30864003)(229853002)(5660300002)(6862004)(102836004)(186003)(76176011)(4326008)(26005)(6246003)(53546011)(6506007)(386003)(76130400001)(486006)(54906003)(58126008)(316002)(99286004)(50466002)(6306002)(126002)(6486002)(336012)(23756003)(9686003)(6512007)(476003)(446003)(11346002)(8676002)(356004)(14454004)(47776003)(86362001)(478600001)(26826003)(561944003)(14444005)(5024004)(45080400002)(7736002)(966005)(2906002)(66066001)(70206006)(8746002)(1076003)(70586007)(81166006)(81156014)(8936002)(305945005)(105606002)(36906005)(3846002)(6116002)(25786009)(41533002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB8PR08MB4154;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Fail; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: a003cc1c-52d0-4cca-5d97-08d764307afc
NoDisclaimer: True
X-Forefront-PRVS: 0215D7173F
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eT2tdahJR9YrEboiLF61UTkbe0W0vtdwFCZGf0FFaJhclBehQPkRyNOkfme7MbSUNylaxmlHLFNTXJfQlSaVSqcEY6X147iTUtRvZXyYUagkBw/yEURoaMYiye4nq9i0HiCJYhZCtxlSu20SEII9LPsH0J9iWAhtP5A1xa6CredE4trpH0B5OeWJiIIyZKmBd3BnbIT0vj8IZHjkF2PeoSg6bUT1w5L0rBHubqnh1nNwJnU716sruFK7g7qqpDmVLKIiVVaGEAfp1cdyByYOJZJAsmqF8umxixmALIqF0Li9Oo7K0ojWGvR8W6I/HQrkTw2yID+82N9P0t+kiUNpIVeRxgbXl/DfqPO8MKmBOw2OxwT3TJ89bG+dHiZlopXjURPhSlF9LQTU/bBagLxK4KCNNDFqRT3U0hLgasDrpZOgFKq8/xdLcVxFvzV6SySAqThCDYsqi/RhRUOrl2Kf3Ffbbn64cCk+wGt+CyzyPGA=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2019 09:46:16.8424 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b649306e-55d7-431b-3053-08d764308044
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4154
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sidRalFg5EBz9n1KfOz5u+nnduKfQpnYyMRTz7e02gU=;
 b=8jNNi5AvoiGdPpusUugX2B6fLqQV5I+NFTt08yDExjI6thbFHSW92qgRzpj5N2bZ3RwXqxL7rxWCNMfqIzSWf0T4MaXt+YpkF8xcJ+RK+5EaDKbHxZtd9RducSrpfpqTVFkeyeWB9kjT1Hs5MEApt2sY7k88TNiMGkxcY/FRcvU=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sidRalFg5EBz9n1KfOz5u+nnduKfQpnYyMRTz7e02gU=;
 b=8jNNi5AvoiGdPpusUugX2B6fLqQV5I+NFTt08yDExjI6thbFHSW92qgRzpj5N2bZ3RwXqxL7rxWCNMfqIzSWf0T4MaXt+YpkF8xcJ+RK+5EaDKbHxZtd9RducSrpfpqTVFkeyeWB9kjT1Hs5MEApt2sY7k88TNiMGkxcY/FRcvU=
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
Cc: nd <nd@arm.com>, Ayan Halder <Ayan.Halder@arm.com>,
 "kernel@collabora.com" <kernel@collabora.com>,
 Daniel Stone <daniels@collabora.com>, David Airlie <airlied@linux.ie>,
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

SGkgRGFuaWVsLAoKT24gVGh1LCBOb3YgMDcsIDIwMTkgYXQgMDg6Mjg6MDhQTSArMDEwMCwgRGFu
aWVsIFZldHRlciB3cm90ZToKPiBPbiBUaHUsIE5vdiAwNywgMjAxOSBhdCAwNTo0OToxNFBNICsw
MDAwLCBCcmlhbiBTdGFya2V5IHdyb3RlOgo+ID4gSGkgRGFuaWVsLAo+ID4gCj4gPiBPbiBUaHUs
IE5vdiAwNywgMjAxOSBhdCAwNjozMjowMVBNICswMTAwLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+
ID4gPiBPbiBUaHUsIE5vdiA3LCAyMDE5IGF0IDY6MjAgUE0gQnJpYW4gU3RhcmtleSA8QnJpYW4u
U3RhcmtleUBhcm0uY29tPiB3cm90ZToKPiA+ID4gPgo+ID4gPiA+IEhpIERhbmllbCwKPiA+ID4g
Pgo+ID4gPiA+IE9uIFR1ZSwgTm92IDA1LCAyMDE5IGF0IDExOjI2OjM2UE0gKzAwMDAsIERhbmll
bCBTdG9uZSB3cm90ZToKPiA+ID4gPiA+IEhpIEFuZHJ6ZWosCj4gPiA+ID4gPiBUaGFua3MgZm9y
IHRha2luZyB0aGlzIG9uISBJdCdzIGxvb2tpbmcgYmV0dGVyIHRoYW4gdjEgZm9yIHN1cmUuIEEg
ZmV3Cj4gPiA+ID4gPiB0aGluZ3MgYmVsb3c6Cj4gPiA+ID4gPgo+ID4gPiA+ID4gT24gTW9uLCAy
MDE5LTExLTA0IGF0IDIzOjEyICswMTAwLCBBbmRyemVqIFBpZXRyYXNpZXdpY3ogd3JvdGU6Cj4g
PiA+ID4gPiA+ICtib29sIGRybV9hZmJjX2NoZWNrX29mZnNldChzdHJ1Y3QgZHJtX2RldmljZSAq
ZGV2LAo+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBkcm1f
bW9kZV9mYl9jbWQyICptb2RlX2NtZCkKPiA+ID4gPiA+ID4gK3sKPiA+ID4gPiA+ID4gKyAgIGlm
IChtb2RlX2NtZC0+b2Zmc2V0c1swXSAhPSAwKSB7Cj4gPiA+ID4gPiA+ICsgICAgICAgICAgIERS
TV9ERUJVR19LTVMoIkFGQkMgYnVmZmVycycgcGxhbmUgb2Zmc2V0IHNob3VsZCBiZQo+ID4gPiA+
ID4gPiAwXG4iKTsKPiA+ID4gPiA+ID4gKyAgICAgICAgICAgcmV0dXJuIGZhbHNlOwo+ID4gPiA+
ID4gPiArICAgfQo+ID4gPiA+ID4gPiArCj4gPiA+ID4gPiA+ICsgICByZXR1cm4gdHJ1ZTsKPiA+
ID4gPiA+ID4gK30KPiA+ID4gPiA+ID4gK0VYUE9SVF9TWU1CT0xfR1BMKGRybV9hZmJjX2NoZWNr
X29mZnNldCk7Cj4gPiA+ID4gPgo+ID4gPiA+ID4gSXMgdGhpcyBhY3R1YWxseSB1bml2ZXJzYWxs
eSB0cnVlPyBJZiB0aGUgb2Zmc2V0IGlzIHN1ZmZpY2llbnRseQo+ID4gPiA+ID4gYWxpZ25lZCBm
b3IgKGUuZy4pIERNQSB0cmFuc2ZlcnMgdG8gc3VjY2VlZCwgaXMgdGhlcmUgYW55IHJlYXNvbiB3
aHkgaXQKPiA+ID4gPiA+IG11c3QgYmUgemVybz8KPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ICtib29s
IGRybV9hZmJjX2NoZWNrX3NpemVfYWxpZ24oc3RydWN0IGRybV9kZXZpY2UgKmRldiwKPiA+ID4g
PiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IGRybV9tb2RlX2Zi
X2NtZDIgKm1vZGVfY21kKQo+ID4gPiA+ID4gPiArewo+ID4gPiA+ID4gPiArICAgc3dpdGNoICht
b2RlX2NtZC0+bW9kaWZpZXJbMF0gJgo+ID4gPiA+ID4gPiBBRkJDX0ZPUk1BVF9NT0RfQkxPQ0tf
U0laRV9NQVNLKSB7Cj4gPiA+ID4gPiA+ICsgICBjYXNlIEFGQkNfRk9STUFUX01PRF9CTE9DS19T
SVpFXzE2eDE2Ogo+ID4gPiA+ID4gPiArICAgICAgICAgICBpZiAoKG1vZGVfY21kLT53aWR0aCAl
IDE2KSB8fCAobW9kZV9jbWQtPmhlaWdodCAlIDE2KSkKPiA+ID4gPiA+ID4gewo+ID4gPiA+ID4K
PiA+ID4gPiA+IFRoaXMgaXMgYSBkZWFsYnJlYWtlciBmb3IgbWFueSByZXNvbHV0aW9uczogZm9y
IGV4YW1wbGUsIDEzNjZ4NzY4IGlzbid0Cj4gPiA+ID4gPiBjbGVhbmx5IGRpdmlzaWJsZSBieSAx
NiBpbiB3aWR0aC4gU28gdGhpcyBtZWFucyB0aGF0IHdlIHdvdWxkIGhhdmUgdG8KPiA+ID4gPiA+
IGVpdGhlciB1c2UgYSBsYXJnZXIgYnVmZmVyIGFuZCBjcm9wLCBvciBzY2FsZSwgb3Igc29tZXRo
aW5nLgo+ID4gPiA+ID4KPiA+ID4gPiA+IE5vIHVzZXJzcGFjZSBpcyBwcmVwYXJlZCB0byBhbGln
biBmYiB3aWR0aC9oZWlnaHQgdG8gdGlsZSBkaW1lbnNpb25zCj4gPiA+ID4gPiBsaWtlIHRoaXMs
IHNvIHRoaXMgY2hlY2sgd2lsbCBiYXNpY2FsbHkgZmFpbCBldmVyeXdoZXJlLgo+ID4gPiA+ID4K
PiA+ID4gPiA+IEhvd2V2ZXIsIG92ZXJhbGxvY2F0aW9uIHJlbGF0aXZlIHRvIHRoZSBkZWNsYXJl
ZCB3aWR0aC9oZWlnaHQgaXNuJ3QgYQo+ID4gPiA+ID4gcHJvYmxlbSBhdCBhbGwuIEluIG9yZGVy
IHRvIGRlYWwgd2l0aCBob3Jpem9udGFsIGFsaWdubWVudCwgeW91IHNpbXBseQo+ID4gPiA+ID4g
bmVlZCB0byBlbnN1cmUgdGhhdCB0aGUgc3RyaWRlIGlzIGEgbXVsdGlwbGUgb2YgdGhlIHRpbGUg
d2lkdGg7IGZvcgo+ID4gPiA+ID4gdmVydGljYWwgYXJyYW5nZW1lbnQsIHRoYXQgdGhlIGJ1ZmZl
ciBpcyBsYXJnZSBlbm91Z2ggdG8gY29udGFpbgo+ID4gPiA+ID4gc3VmZmljaWVudCAnbGluZXMn
IHRvIHRoZSBuZXh0IHRpbGUgYm91bmRhcnkuCj4gPiA+ID4gPgo+ID4gPiA+ID4gaS5lLiByYXRo
ZXIgdGhhbiBjaGVja2luZyB3aWR0aC9oZWlnaHQsIHlvdSBzaG91bGQgY2hlY2s6Cj4gPiA+ID4g
PiAgICogZmJfc3RyaWRlID49IChBTElHTihmYl93aWR0aCwgdGlsZV93aWR0aCksIGJwcCkKPiA+
ID4gPiA+ICAgKiBidWZfc2l6ZSA+PSBmYl9zdHJpZGUgKiBBTElHTihmYl9oZWlnaHQsIHRpbGVf
aGVpZ2h0KQo+ID4gPiA+Cj4gPiA+ID4gV2VsbCwgc29ydCBvZi4KPiA+ID4gPgo+ID4gPiA+IEkg
YWdyZWUgd2l0aCB5b3UgdGhhdCBmb3IgaG9yaXpvbnRhbCBwYWRkaW5nLCB3ZSBjYW4gaW5kZWVk
IHVzZSBwaXRjaC4KPiA+ID4gPgo+ID4gPiA+IEhvd2V2ZXIsIHRoZSBBRkJDIGRlY29kZXIocykg
bmVlZCB0byBrbm93IGV4YWN0bHkgd2hhdCB0aGUgdG90YWwKPiA+ID4gPiBfYWxsb2NhdGVkXyBz
aXplIGluIHBpeGVscyBvZiB0aGUgYnVmZmVyIGlzIC0gYXMgdGhpcyBpbmZsdWVuY2VzIHRoZQo+
ID4gPiA+IGhlYWRlciBzaXplLCBhbmQgd2UgbmVlZCB0byBrbm93IHRoZSBoZWFkZXIgc2l6ZSB0
byBrbm93IHdoZXJlIGl0IGVuZHMKPiA+ID4gPiBhbmQgdGhlIGJvZHkgYmVnaW5zLgo+ID4gPiA+
Cj4gPiA+ID4gSSBzZWUgYSBjb3VwbGUgb2YgcG9zc2libGUgd2F5cyBmb3J3YXJkczoKPiA+ID4g
Pgo+ID4gPiA+ICAtIEtlZXAgaXQgYXMtaXMuIFRoZSByZXN0cmljdGl2ZSBjaGVja3MgZW5zdXJl
IHRoYXQgdGhlcmUncyBubwo+ID4gPiA+ICAgIGFtYmlndWl0eSBhbmQgd2UgdXNlIHRoZSBmYiB3
aWR0aC9oZWlnaHQgdG8gZGV0ZXJtaW5lIHRoZSByZWFsCj4gPiA+ID4gICAgYWxsb2NhdGVkIHdp
ZHRoL2hlaWdodC4gVXNlcnNwYWNlIG5lZWRzIHRvIGJlIEFGQkMtYXdhcmUgYW5kIHNldCB1cAo+
ID4gPiA+ICAgIHBsYW5lIGNyb3BwaW5nIHRvIGhhbmRsZSB0aGUgYWxpZ25tZW50IGRpZmZlcmVu
Y2VzLgo+ID4gPiA+Cj4gPiA+ID4gIC0gVXNlIHBpdGNoIHRvIGRldGVybWluZSB0aGUgInJlYWwi
IHdpZHRoLCBhbmQgaW50ZXJuYWxseSBpbiB0aGUKPiA+ID4gPiAgICBrZXJuZWwgYWxpZ24gaGVp
Z2h0IHVwIHRvIHRoZSBuZXh0IGFsaWdubWVudCBib3VuZGFyeS4gVGhpcyB3b3Jrcwo+ID4gPiA+
ICAgIE9LLCBzbyBsb25nIGFzIHRoZXJlJ3Mgbm8gYWRkaXRpb25hbCBwYWRkaW5nIGF0IHRoZSBi
b3R0b20gb2YgdGhlCj4gPiA+ID4gICAgYnVmZmVyLiBUaGlzIHdvdWxkIHdvcmssIGJ1dCBJIGNh
bid0IGZpZ3VyZSBhIHdheSB0byBjaGVjay9lbmZvcmNlCj4gPiA+ID4gICAgdGhhdCB0aGVyZSdz
IG5vIGFkZGl0aW9uYWwgcGFkZGluZyBhdCB0aGUgYm90dG9tLgo+ID4gPiA+Cj4gPiA+ID4gIC0g
U29tZXRoaW5nIGVsc2UuLi4KPiA+ID4gPgo+ID4gPiA+IFRoZSBjaGVja3MgYXMtaW1wbGVtZW50
ZWQgd2VyZSBkZWxpYmVyYXRlbHkgY29uc2VydmF0aXZlLCBhbmQgZG9uJ3QKPiA+ID4gPiBwcmVj
bHVkZSBkb2luZyBzb21lIHJlbGF4YXRpb24gaW4gdGhlIGZ1dHVyZS4KPiA+ID4gPgo+ID4gPiA+
IE9uIEFuZHJvaWQsIGdyYWxsb2MgaXMgdXNlZCB0byBzdG9yZSB0aGUgInJlYWwiIGFsbG9jYXRl
ZCB3aWR0aC9oZWlnaHQKPiA+ID4gPiBhbmQgdGhpcyBpcyB1c2VkIHRvIHNldCB1cCB0aGUgRFJN
IEFQSSBhcHByb3ByaWF0ZWx5Lgo+ID4gPiAKPiA+ID4gRmFrZSBzdHJpZGUgKyByZWFsIHZpc2li
bGUgaC93IGluIHRoZSBkcm1mYi4gQmVjYXVzZSB0aGF0J3MgaG93IGl0Cj4gPiA+IHdvcmtzIHdp
dGggYWxsIHRoZSB0aWxlZCBmb3JtYXRzIGFscmVhZHksIGFuZCBleHBlY3RpbmcgdXNlcnNwYWNl
IHRvCj4gPiA+IGZ1ZGdlIHRoaXMgYWxsIGNvcnJlY3RseSBzZWVtcyB2ZXJ5IGJhY2t3YXJkcyB0
byBtZS4gSW4gYSB3YXkgd2UgaGFkCj4gPiA+IHRoYXQgZW50aXJlIGZha2Ugc3RyaWRlIGRpc2N1
c3Npb24gYWxyZWFkeSBmb3IgdGhlIGJsb2NrIHNpemUgZm9ybWF0Cj4gPiA+IHN0dWZmIGFscmVh
ZHksIGJ1dCBub3cgaW4gYSBkaWZmZXJlbnQgZmxhdm91ci4KPiA+IAo+ID4gRmFrZSBzdHJpZGUg
LSBsaWtlIEkgc2FpZCwgbm8gcHJvYmxlbTsgc291bmRzIGdvb2QuIFRoYXQgc29sdmVzIG9uZQo+
ID4gZGltZW5zaW9uLgo+ID4gCj4gPiBTbyBkbyB5b3UgaGF2ZSBhIHByb3Bvc2FsIGZvciBob3cg
d2UgZGV0ZXJtaW5lIHdoYXQgdGhlIGFsbG9jYXRlZAo+ID4gaGVpZ2h0IGlzIGluIHRoYXQgY2Fz
ZT8gSSBkb24ndCByZWFsbHkgc2VlIGEgd2F5Lgo+IAo+IENvdWxkIHlvdSBjb21wdXRlIHRoZSBo
ZWlnaHQgYnkgbG9va2luZyBhdCB0aGUgYnVmZmVyIHNpemU/IE9yIGRvZXMgdGhhdAo+IG5vdCBo
ZWxwIHNpbmNlIHRoZSBoZWFkZXIgc3R1ZmYgaXMgZ2VuZXJhbGx5IHJhdGhlciBzbWFsbD8KCkkn
dmUgd29uZGVyZWQgYWJvdXQgdGhhdC4gV2UgbWlnaHQgYmUgYWJsZSB0byB1c2UgaXQgaGV1cmlz
dGljYWxseSwKYnV0IGl0IGRvZXMgcGxhY2UgY2VydGFpbiBhc3N1bXB0aW9ucyBvbiB0aGUgYWxs
b2NhdG9yIC0gZm9yIGluc3RhbmNlCnJvdW5kaW5nIHVwIHRvIGEgcGFnZSBvcmRlciBtaWdodCBj
YXVzZSBwcm9ibGVtcy4KCj4gCj4gT3RoZXJ3aXNlIEkgZ3Vlc3MganVzdCByb3VuZCB1cCBoZWln
aHQgYW5kIGhvcGUgaXQgd29ya3MuIElmIHdlIHJ1biBpbnRvIGEKPiB1c2UtY2FzZSB3aGVyZSB0
aGF0IGRvZXNuJ3Qgd29yayBhbnltb3JlIHNvbWVob3csIHRoZW4gd2UgZ2V0IHRvIHJldiBhbGwK
PiB0aGUgYWZiYyBtb2RpZmllcnMgYW5kIG1ha2UgdGhlbSAyIHBsYW5lcy4gV2l0aCB0aGF0IHRo
ZXJlJ3Mgbm8gc3VjaCBpc3N1ZQo+IGFueW1vcmUgKHdoaWNoIGlzIHdoeSB0aGUgaW50ZWwgY29t
cHJlc3NlZCBzdHVmZiBoYXMgMiBwbGFuZXMpLgo+IC1EYW5pZWwKPiAKCldlIGNvbnNpZGVyZWQg
ZXhwb3NpbmcgdGhlIGhlYWRlciBleHBsaWNpdGx5IGFzIGEgcGxhbmUgYmVmb3JlCm9yaWdpbmFs
bHkgc3VibWl0dGluZyB0aGUgbW9kaWZpZXJzOyBob3dldmVyIHRoZSBoZWFkZXIgYW5kIGJvZHkg
YXJlCmxpbmtlZCBpbiBzdWNoIGEgd2F5IHRoYXQgdGhleSBhcmVuJ3Qgc2VwYXJhYmxlLCBzbyB0
aGV5IGFyZW4ndCByZWFsbHkKc2VwYXJhdGUgcGxhbmVzLiBBbHNvIHdlIGhhdmUgbXVsdGktcGxh
bmUgQUZCQyBidWZmZXJzLCB3aGVyZSBlYWNoCnBsYW5lIGhhcyBpdHMgb3duIGhlYWRlciBhbmQg
dGh1cyB3ZSdkIG5lZWQgYXQgbGVhc3QgNiBwbGFuZXMgdG8KZGVzY3JpYmUgaXQgZnVsbHkgaWYg
d2Ugc2VwYXJhdGUgb3V0IHRoZSBoZWFkZXIuCgpJJ20gbm90IGVudGlyZWx5IHN1cmUgaG93IGEg
c2VwYXJhdGUgaGVhZGVyIHBsYW5lIHdvdWxkIGhlbHAgd2l0aCB0aGlzCmlzc3VlIGFueXdheS4K
CgpXZSBjb3VsZCByb3VuZCB1cCB0aGUgaGVpZ2h0LCB3aGljaCBzaG91bGQgY292ZXIgdGhlIGNv
bW1vbiBjYXNlLiBJdApzZWVtKGVkKSBzYWZlc3QgdG8gc3RhcnQgd2l0aCB0aGUgY29uc2VydmF0
aXZlIHJlc3RyaWN0aW9ucy4KCk15IHByb3Bvc2FsIGZvciBoYW5kbGluZyB0aGUgY2FzZSBvZiBh
ZGRpdGlvbmFsIHZlcnRpY2FsIHBhZGRpbmcgb24KdG9wIG9mIHRoYXQgd291bGQgYmUgdG8gYWRk
IGEgZmllbGQgaW4gdGhlIG1vZGlmaWVyIHdoaWNoIGluZGljYXRlcwpob3cgbXVjaCBhZGRpdGlv
bmFsIHZlcnRpY2FsIHBhZGRpbmcgdGhlcmUgaXMuIEkga25vdyB0aGUgQnJvYWRjb20KU0FORCBt
b2RpZmllcnMgZG8gYSBzaW1pbGFyIHRoaW5nLiBJdCBkb2VzIG1ha2UgdGhlIG1vZGlmaWVycyBh
IGJpdAoibm9uLW9wYXF1ZSIgdGhvdWdoLCBhcyB0aGUgbW9kaWZpZXIgdmFsdWUgY2FuJ3QgYmUg
c2ltcGx5IHF1ZXJpZWQKZnJvbSB0aGUgbW9kaWZpZXIgbGlzdC4KCgouLi4gYWxsIG9mIHRoYXQg
c2FpZCwgdGhlIGtlcm5lbCBpbnRlcmZhY2UgaXMgYWxyZWFkeSByaWNoIGVub3VnaCB0bwpzdXBw
b3J0IGV2ZXJ5dGhpbmcsIGlmIHVzZXJzcGFjZSB1bmRlcnN0YW5kcyB0aGF0IHNvbWV0aW1lcyBp
dCBuZWVkcwp0byBjcm9wLgoKVGhhbmtzLAotQnJpYW4KCj4gCj4gPiBUaGFua3MsCj4gPiAtQnJp
YW4KPiA+IAo+ID4gPiAKPiA+ID4gQWxzbyBJIHRoaW5rIHRoYXQncyBtb3JlIHJlYXNvbnMgd2h5
IHRoaXMgc2hvdWxkIGJlIG5vLW9wdC1vdXRhYmxlCj4gPiA+IGNvZGUgdGhhdCdzIGRvbmUgZm9y
IGFsbCBkcml2ZXJzIHdoZW4gd2UgY2hlY2sgZnJhbWVidWZmZXJzIGluIGFkZGZiLgo+ID4gPiBQ
bHVzIHRoZW4gc29tZSBoZWxwZXJzIHRvIGdldCBhdCBjb21wdXRlZCB2YWx1ZXMgZm9yIGFueSBm
cmFtZWJ1ZmZlcgo+ID4gPiB3ZSBrbm93IHRvIGJlIHZhbGlkLgo+ID4gPiAtRGFuaWVsCj4gPiA+
IAo+ID4gPiA+ID4gVGhpcyBtYXkgZm9yY2UgdXMgdG8gZG8gc29tZSBzaWxseSBjcm9wcGluZyBn
YW1lcyBpbnNpZGUgdGhlIFJvY2tjaGlwCj4gPiA+ID4gPiBLTVMgZHJpdmVyLCBidXQgSSBmZWVs
IGl0IGJlYXRzIHRoZSBhbHRlcm5hdGl2ZSBvZiBicmVha2luZyB1c2Vyc3BhY2UuCj4gPiA+ID4K
PiA+ID4gPiBXZWxsLCBub3RoaW5nJ3MgZ29pbmcgdG8gZ2V0IGJyb2tlbiAtIGl0J3MganVzdCBw
ZXJoYXBzIG5vdCByZWFkeSB0bwo+ID4gPiA+IHR1cm4gb24gQUZCQyB5ZXQuCj4gPiA+ID4KPiA+
ID4gPiA+Cj4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgRFJNX0RFQlVHX0tNUygKPiA+
ID4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICJBRkJDIGJ1ZmZlciBtdXN0IGJl
IGFsaWduZWQgdG8gMTYKPiA+ID4gPiA+ID4gcGl4ZWxzXG4iCj4gPiA+ID4gPiA+ICsgICAgICAg
ICAgICAgICAgICAgKTsKPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICByZXR1cm4gZmFs
c2U7Cj4gPiA+ID4gPiA+ICsgICAgICAgICAgIH0KPiA+ID4gPiA+ID4gKyAgICAgICAgICAgYnJl
YWs7Cj4gPiA+ID4gPiA+ICsgICBjYXNlIEFGQkNfRk9STUFUX01PRF9CTE9DS19TSVpFXzMyeDg6
Cj4gPiA+ID4gPiA+ICsgICAgICAgICAgIC8qIGZhbGwgdGhyb3VnaCAqLwo+ID4gPiA+ID4KPiA+
ID4gPiA+IEl0J3MgYWxzbyBpbmNvbmdydW91cyB0aGF0IDMyeDggaXMgdW5zdXBwb3J0ZWQgaGVy
ZSwgYnV0IGhhcyBhIHNlY3Rpb24KPiA+ID4gPiA+IGluIGdldF9zdXBlcmJsa193aDsgcGxlYXNl
IGhhcm1vbmlzZSB0aGVtIHNvIHRoaXMgc2VjdGlvbiBlaXRoZXIgZG9lcwo+ID4gPiA+ID4gdGhl
IGNoZWNrcyBhcyBhYm92ZSwgb3IgdGhhdCBnZXRfc3VwZXJibGtfd2ggZG9lc24ndCBzdXBwb3J0
IDMyeDgKPiA+ID4gPiA+IGVpdGhlci4KPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ICtib29sIGRybV9h
ZmJjX2NoZWNrX2ZiX3NpemVfcmV0KHUzMiBwaXRjaCwgaW50IGJwcCwKPiA+ID4gPiA+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHUzMiB3LCB1MzIgaCwgdTMyIHN1cGVyYmxrX3csIHUz
Mgo+ID4gPiA+ID4gPiBzdXBlcmJsa19oLAo+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgc2l6ZV90IHNpemUsIHUzMiBvZmZzZXQsIHUzMiBoZHJfYWxpZ24sCj4gPiA+ID4g
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICB1MzIgKnBheWxvYWRfb2ZmLCB1MzIgKnRv
dGFsX3NpemUpCj4gPiA+ID4gPiA+ICt7Cj4gPiA+ID4gPiA+ICsgICBpbnQgbl9zdXBlcmJsa3Mg
PSAwOwo+ID4gPiA+ID4gPiArICAgdTMyIHN1cGVyYmxrX3N6ID0gMDsKPiA+ID4gPiA+ID4gKyAg
IHUzMiBhZmJjX3NpemUgPSAwOwo+ID4gPiA+ID4KPiA+ID4gPiA+IFBsZWFzZSBkb24ndCBpbml0
aWFsaXNlIHRoZSBhYm92ZSB0aHJlZSB2YXJpYWJsZXMsIGdpdmVuIHRoYXQgeW91IGdvIG9uCj4g
PiA+ID4gPiB0byBpbW1lZGlhdGVseSBjaGFuZ2UgdGhlaXIgdmFsdWVzLiBJbiB0aGlzIGNhc2Us
IGluaXRpYWxpc2luZyB0byB6ZXJvCj4gPiA+ID4gPiBjYW4gb25seSBoaWRlIGxlZ2l0aW1hdGUg
dW5pbml0aWFsaXNlZC12YXJpYWJsZS11c2Ugd2FybmluZ3MuCj4gPiA+ID4gPgo+ID4gPiA+ID4g
PiArICAgbl9zdXBlcmJsa3MgPSAodyAvIHN1cGVyYmxrX3cpICogKGggLyBzdXBlcmJsa19oKTsK
PiA+ID4gPiA+ID4gKyAgIHN1cGVyYmxrX3N6ID0gKGJwcCAqIHN1cGVyYmxrX3cgKiBzdXBlcmJs
a19oKSAvIEJJVFNfUEVSX0JZVEU7Cj4gPiA+ID4gPiA+ICsgICBhZmJjX3NpemUgPSBBTElHTihu
X3N1cGVyYmxrcyAqIEFGQkNfSEVBREVSX1NJWkUsIGhkcl9hbGlnbik7Cj4gPiA+ID4gPiA+ICsg
ICAqcGF5bG9hZF9vZmYgPSBhZmJjX3NpemU7Cj4gPiA+ID4gPiA+ICsKPiA+ID4gPiA+ID4gKyAg
IGFmYmNfc2l6ZSArPSBuX3N1cGVyYmxrcyAqIEFMSUdOKHN1cGVyYmxrX3N6LAo+ID4gPiA+ID4g
PiBBRkJDX1NVUEVSQkxLX0FMSUdOTUVOVCk7Cj4gPiA+ID4gPiA+ICsgICAqdG90YWxfc2l6ZSA9
IGFmYmNfc2l6ZSArIG9mZnNldDsKPiA+ID4gPiA+Cj4gPiA+ID4gPiBHZW5lcmFsbHkgdGhlc2Ug
YXJlIHJlZmVycmVkIHRvIGFzICd0aWxlcycgcmF0aGVyIHRoYW4gJ3N1cGVyYmxvY2tzJywKPiA+
ID4gPiA+IGdpdmVuIHRoYXQgSSB3b3VsZCBvbmx5IGV4cGVjdCBvbmUgc3VwZXJibG9jayBwZXIg
YnVmZmVyLCBidXQgaWYgdGhhdCdzCj4gPiA+ID4gPiB0aGUgdGVybWlub2xvZ3kgQUZCQyB1c2Vz
IHRoZW4gaXQgbWlnaHQgYmUgYmV0dGVyIHRvIHN0aWNrIHdpdGggaXQuCj4gPiA+ID4gPgo+ID4g
PiA+ID4gPiArICAgaWYgKCh3ICogYnBwKSAhPSAocGl0Y2ggKiBCSVRTX1BFUl9CWVRFKSkgewo+
ID4gPiA+ID4gPiArICAgICAgICAgICBEUk1fREVCVUdfS01TKCJJbnZhbGlkIHZhbHVlIG9mIChw
aXRjaCAqIEJJVFNfUEVSX0JZVEUpCj4gPiA+ID4gPiA+ICg9JXUpIHNob3VsZCBiZSBzYW1lIGFz
IHdpZHRoICg9JXUpICogYnBwICg9JXUpXG4iLAo+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAgIHBpdGNoICogQklUU19QRVJfQllURSwgdywgYnBwCj4gPiA+ID4gPiA+ICsgICAg
ICAgICAgICk7Cj4gPiA+ID4gPiA+ICsgICAgICAgICAgIHJldHVybiBmYWxzZTsKPiA+ID4gPiA+
ID4gKyAgIH0KPiA+ID4gPiA+Cj4gPiA+ID4gPiBIYXZpbmcgYSB0b28tc21hbGwgcGl0Y2ggaXMg
b2J2aW91c2x5IGEgcHJvYmxlbSBhbmQgd2Ugc2hvdWxkIHJlamVjdAo+ID4gPiA+ID4gaXQuIEJ1
dCBpcyBoYXZpbmcgYSB0b28tbGFyZ2UgcGl0Y2ggcmVhbGx5IGEgcHJvYmxlbTsgZG9lcyBpdCBu
ZWVkIHRvCj4gPiA+ID4gPiBiZSBhbiBleGFjdCBtYXRjaCwgb3IgY2FuIHdlIHN1cHBvcnQgdGhl
IGNhc2Ugd2hlcmUgdGhlIHBpdGNoIGlzIHRvbwo+ID4gPiA+ID4gbGFyZ2UgYnV0IGFsc28gdGls
ZS1hbGlnbmVkPyBJZiB3ZSBjYW4sIGl0IHdvdWxkIGJlIHZlcnkgZ29vZCB0bwo+ID4gPiA+ID4g
c3VwcG9ydCB0aGF0Lgo+ID4gPiA+Cj4gPiA+ID4gVGhlIHJlYXNvbiBmb3IgZm9yY2luZyBpdCB0
byBiZSBleGFjdCBpcyBhcyBJIHNhaWQgYWJvdmUgLSB3ZSBfbXVzdF8KPiA+ID4gPiBrbm93IHdo
YXQgdGhlICJyZWFsIiB3aWR0aCBhbmQgaGVpZ2h0IGlzLiBJbXBsZW1lbnRpbmcgdGhpcyBjaGVj
ayB0bwo+ID4gPiA+IGZvcmNlIChwaXRjaCA9PSB3aWR0aCAqIGJwcCkgZW5zdXJlcyB0aGF0LCBh
bmQgYWxzbyBsZWF2ZXMgdGhlIG9wdGlvbgo+ID4gPiA+IGZvciB1cyB0byByZWxheCB0byBhbGxv
dyBhIGxhcmdlciBwaXRjaCAoYXMgYWJvdmUpIGlmIHRoYXQgd2FzIHRoZQo+ID4gPiA+IHByZWZl
cnJlZCBhcHByb2FjaCBmb3IgYWxpZ25tZW50Lgo+ID4gPiA+Cj4gPiA+ID4gSW4gZ2VuZXJhbCB0
aGUgY3VycmVudCBjaGVja3MgYXJlIGRlbGliZXJhdGVseSBkZXNpZ25lZCB0byBsZWF2ZSB0aGUK
PiA+ID4gPiBkb29yIG9wZW4gZm9yIGZ1dHVyZSBpbXByb3ZlbWVudHMgd2l0aG91dCBicmVha2lu
ZyBhbnl0aGluZy4KPiA+ID4gPgo+ID4gPiA+IENoZWVycywKPiA+ID4gPiAtQnJpYW4KPiA+ID4g
Pgo+ID4gPiA+ID4KPiA+ID4gPiA+IENoZWVycywKPiA+ID4gPiA+IERhbmllbAo+ID4gPiA+ID4K
PiA+ID4gPiBJTVBPUlRBTlQgTk9USUNFOiBUaGUgY29udGVudHMgb2YgdGhpcyBlbWFpbCBhbmQg
YW55IGF0dGFjaG1lbnRzIGFyZSBjb25maWRlbnRpYWwgYW5kIG1heSBhbHNvIGJlIHByaXZpbGVn
ZWQuIElmIHlvdSBhcmUgbm90IHRoZSBpbnRlbmRlZCByZWNpcGllbnQsIHBsZWFzZSBub3RpZnkg
dGhlIHNlbmRlciBpbW1lZGlhdGVseSBhbmQgZG8gbm90IGRpc2Nsb3NlIHRoZSBjb250ZW50cyB0
byBhbnkgb3RoZXIgcGVyc29uLCB1c2UgaXQgZm9yIGFueSBwdXJwb3NlLCBvciBzdG9yZSBvciBj
b3B5IHRoZSBpbmZvcm1hdGlvbiBpbiBhbnkgbWVkaXVtLiBUaGFuayB5b3UuCj4gPiAKPiA+IE5v
dCBzdXJlIGhvdyB0aGF0IHNudWNrIGluLgo+ID4gCj4gPiA+IAo+ID4gPiAKPiA+ID4gCj4gPiA+
IC0tIAo+ID4gPiBEYW5pZWwgVmV0dGVyCj4gPiA+IFNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBD
b3Jwb3JhdGlvbgo+ID4gPiArNDEgKDApIDc5IDM2NSA1NyA0OCAtIGh0dHA6Ly9ibG9nLmZmd2xs
LmNoCj4gCj4gLS0gCj4gRGFuaWVsIFZldHRlcgo+IFNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBD
b3Jwb3JhdGlvbgo+IGh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
