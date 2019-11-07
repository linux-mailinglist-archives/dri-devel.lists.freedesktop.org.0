Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89BDCF362A
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 18:49:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31D816F76D;
	Thu,  7 Nov 2019 17:49:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-eopbgr120072.outbound.protection.outlook.com [40.107.12.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D78DB6F76C
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 17:49:24 +0000 (UTC)
Received: from VI1PR08CA0182.eurprd08.prod.outlook.com (2603:10a6:800:d2::12)
 by PR2PR08MB4746.eurprd08.prod.outlook.com (2603:10a6:101:23::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2430.23; Thu, 7 Nov
 2019 17:49:21 +0000
Received: from AM5EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::205) by VI1PR08CA0182.outlook.office365.com
 (2603:10a6:800:d2::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2430.20 via Frontend
 Transport; Thu, 7 Nov 2019 17:49:21 +0000
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT025.mail.protection.outlook.com (10.152.16.157) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.21 via Frontend Transport; Thu, 7 Nov 2019 17:49:21 +0000
Received: ("Tessian outbound 3fba803f6da3:v33");
 Thu, 07 Nov 2019 17:49:20 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 05175dcf9b83678e
X-CR-MTA-TID: 64aa7808
Received: from 5d20b239ee2b.1 (cr-mta-lb-1.cr-mta-net [104.47.4.55])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8242925B-1BFC-4995-BF1B-BD902C03F631.1; 
 Thu, 07 Nov 2019 17:49:15 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2055.outbound.protection.outlook.com [104.47.4.55])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5d20b239ee2b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 07 Nov 2019 17:49:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PrPJb+oIpHDYJbp2D0ss7POmdcFs3YDf1cWBVRvz+Prqyo+KQQA3m/dmFEqrjQNUpXlS4GDbEMzJJebdiz1cqfz6WTIyrf0t/W4VvrvmA55SlrONo9Wan1guPwsprgzHdsghGOk5WpYalZkzVblKAPq3Diqm5z7W31nmYf6E0V3P5Om9CALOzVZRbB878rutS5I5m22QTDNnvDzxD0ahXeQyrzDyI3SIGxsFg5dzTuhCyFSNIbglo0sp1uNroJDFAm8tUtLY20/WfwMQPU10rwgqlbE0e0sTOr0LpfZcLMF1aTqkMHheTzWzFL/Z8rDmQef5PWqO5S4lLCC2pufelA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=capflGb9/qQWOFQVUAZSummVMpNDzI8Qhv2r7h4pLVA=;
 b=MRNrpRM0KLx/Z7PThb85Gn1Q+SyUl0S1WAO8RwC9c+ZE22lce8IQNnITNGaubPgAap4SxffIneWVueGx3iGcyQP5kbPSzUQxuKBOfyiuRE4H5O/T/Jr5USOIwWzD+gTbWlq/30Zj+kSkoljjP1/q9D6g12aXeqC7n47/64GLGJAhEy7YMpvzvu9yDfGunHahzOuhONNg6iLwkiM9esMJC1D3IHskAfScn7CU2mye2oPUGsBSUiIU5gkKW8rLPyiCLb64tXjI227iDfeKXrvnCZ+mat/qYdY56Q7I6e62N/Qd6UztCA3phTnhs8VOvlp3H0mJSspUXFePkailT42B+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from AM6PR08MB3829.eurprd08.prod.outlook.com (20.178.89.14) by
 AM6PR08MB3096.eurprd08.prod.outlook.com (52.135.162.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.23; Thu, 7 Nov 2019 17:49:14 +0000
Received: from AM6PR08MB3829.eurprd08.prod.outlook.com
 ([fe80::6804:f05f:47c0:d9e]) by AM6PR08MB3829.eurprd08.prod.outlook.com
 ([fe80::6804:f05f:47c0:d9e%4]) with mapi id 15.20.2430.020; Thu, 7 Nov 2019
 17:49:14 +0000
From: Brian Starkey <Brian.Starkey@arm.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCHv2 1/4] drm/arm: Factor out generic afbc helpers
Thread-Topic: [PATCHv2 1/4] drm/arm: Factor out generic afbc helpers
Thread-Index: AQHVk1z4dagGuzJ3bkuZ5c+Y7TNITKd9OjQAgAK+PICAAANcgIAABM6A
Date: Thu, 7 Nov 2019 17:49:14 +0000
Message-ID: <20191107174913.yme5kd6iva2kc7hw@DESKTOP-E1NTVVP.localdomain>
References: <2485717.1SzL54aMiy@e123338-lin>
 <20191104221228.3588-1-andrzej.p@collabora.com>
 <20191104221228.3588-2-andrzej.p@collabora.com>
 <f4aa14e89852c9ef46ade10e8eccdb66b1adc052.camel@collabora.com>
 <20191107171959.esg2dh6dw6i2lfst@DESKTOP-E1NTVVP.localdomain>
 <CAKMK7uGDqS2ygHjmbTS0rjgYx0LJ9-hAmOvYqEoi7z4TSHY-rA@mail.gmail.com>
In-Reply-To: <CAKMK7uGDqS2ygHjmbTS0rjgYx0LJ9-hAmOvYqEoi7z4TSHY-rA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: NeoMutt/20180716-849-147d51-dirty
x-originating-ip: [217.140.106.50]
x-clientproxiedby: LO2P123CA0036.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::24)
 To AM6PR08MB3829.eurprd08.prod.outlook.com
 (2603:10a6:20b:85::14)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Brian.Starkey@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 289b2aed-1430-4e46-243d-08d763aad1fe
X-MS-TrafficTypeDiagnostic: AM6PR08MB3096:|AM6PR08MB3096:|PR2PR08MB4746:
X-MS-Exchange-PUrlCount: 1
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <PR2PR08MB47460A78311DE0D7BD2F0A2BF0780@PR2PR08MB4746.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
x-forefront-prvs: 0214EB3F68
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(366004)(346002)(136003)(376002)(396003)(51444003)(199004)(189003)(40434004)(2906002)(64756008)(44832011)(7416002)(7736002)(305945005)(53546011)(81166006)(81156014)(8676002)(561944003)(478600001)(446003)(52116002)(76176011)(11346002)(6916009)(66446008)(476003)(6436002)(66556008)(66066001)(8936002)(386003)(6506007)(66946007)(486006)(66476007)(316002)(99286004)(25786009)(26005)(229853002)(6116002)(14444005)(5024004)(256004)(54906003)(14454004)(86362001)(1076003)(6246003)(186003)(3846002)(5660300002)(6306002)(71200400001)(71190400001)(6512007)(58126008)(102836004)(966005)(6486002)(4326008)(9686003)(41533002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB3096;
 H:AM6PR08MB3829.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 0rW9vE99bWlnC26oh0zFxXf3ZZl8XRoVW+YXDq6AeUxY14IcEu5MUlVN2AtBVHcjTRkKp6rHpTH7otn+SvZqAW6UohYKVsrBns3v4tGNGaXnyxjI8x01PdBRXGD3//UvCkggG0c5SOkodfXE2ijM6OkRMRHqJnPJwrMcatJbKi8rP5duiahdJiwted0YFd88lXQlcV0TmGyv1kv+Qdr9AyX6pn+sML4ZizHR+Rp4+KEls7feJrrrbp/2RMuoT9foWiZcMiidp/HkldXQtUwRkWo/k5bAdOPXLjATKXrwsN5KcsIqmUl9c9pPhoBUTSm0Dw8wVvjeMmr5T4vNPUQYvW3FJVf03QtNWgk89fBAmya3Sehjc+AoHj8cxfXHpVDGAwfAEHe4E3eiCFY2k3dV2NpBEc/0CuUwIvM5o1GxR9zSoHMAuwEkNInXAyKkhXDza+PFJr0BSuit8eo728VyXjITp7TzHaX9m6hd5FuOX94=
Content-ID: <BAE305A436EF5246B6E7F54BAC5B46BD@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3096
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Brian.Starkey@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(396003)(136003)(39860400002)(1110001)(339900001)(40434004)(51444003)(189003)(199004)(336012)(26826003)(105606002)(76130400001)(8746002)(6486002)(966005)(36906005)(14454004)(8936002)(26005)(229853002)(316002)(76176011)(66066001)(47776003)(2906002)(3846002)(486006)(22756006)(446003)(386003)(1076003)(476003)(305945005)(53546011)(6506007)(70206006)(6116002)(6246003)(126002)(86362001)(7736002)(99286004)(6306002)(25786009)(11346002)(9686003)(6512007)(186003)(50466002)(5024004)(478600001)(54906003)(356004)(102836004)(5660300002)(81156014)(23756003)(70586007)(58126008)(4326008)(6862004)(81166006)(561944003)(8676002)(14444005)(41533002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:PR2PR08MB4746;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Fail; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: a437d580-7422-41e0-38c5-08d763aacd80
NoDisclaimer: True
X-Forefront-PRVS: 0214EB3F68
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ha1RFit5y/WYED/BoTtDk/EKZBkmruZBfB27DZUy/k7KKRC/rGA0T0zbgSaVELTAlscePFWrj0fHw2RAe/hCD8urvz/HaIAJq1htf2AtLBI1q7YT2aul5zMpPHk+G4zgQHaAQ8hoDYTGU0xY2ML4OjDL/I8hjB/PRtgBLsdkDqkuYHv4xZFDQnv7sXHfj1t4ROPjxRIaMcl0Et9ymUnrBxdN+SzFWSVRhTXnAjV9VlAP/uon9JapIhvmS+4e1zjwJH8RirSTk4OYzI8XhJIpZ7ZPE5ASJR1TTe9p6XQUNk7mJR4aF3XiYRlzlDZimvdIFloAxrihdZ0tgVGtwB/P7YFzdSb5I8WkIuo5ZWEnRkGh29JCmkrxvkITYh2GUIvgxpG9XkHEDH9q0FH/FuIXWFeAwL8bivrCHEXlwYctKZOhISWjaDUqeuG+GQy/95WtIGBCGApQiCIk79i/Ke8jfpSsGLWgR1EJVbAkALfSGF4=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2019 17:49:21.4067 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 289b2aed-1430-4e46-243d-08d763aad1fe
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4746
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=capflGb9/qQWOFQVUAZSummVMpNDzI8Qhv2r7h4pLVA=;
 b=V6BpK7hHaNa9+/YR7oW/jiJn4t8aXG6Xwv/TjjlFODqYDzD3DuORZV4cEWCaka73lghPwjgxB/w242AHkzTuAAPntLrk1Z2jgPXkbXjswpinDWsO8c7rzCOFRo3ZWLVqYNEHzeZ1yKVv3VvUhnJ4vVQSpR/bf8LfMMcFtns1cMc=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=capflGb9/qQWOFQVUAZSummVMpNDzI8Qhv2r7h4pLVA=;
 b=V6BpK7hHaNa9+/YR7oW/jiJn4t8aXG6Xwv/TjjlFODqYDzD3DuORZV4cEWCaka73lghPwjgxB/w242AHkzTuAAPntLrk1Z2jgPXkbXjswpinDWsO8c7rzCOFRo3ZWLVqYNEHzeZ1yKVv3VvUhnJ4vVQSpR/bf8LfMMcFtns1cMc=
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

SGkgRGFuaWVsLAoKT24gVGh1LCBOb3YgMDcsIDIwMTkgYXQgMDY6MzI6MDFQTSArMDEwMCwgRGFu
aWVsIFZldHRlciB3cm90ZToKPiBPbiBUaHUsIE5vdiA3LCAyMDE5IGF0IDY6MjAgUE0gQnJpYW4g
U3RhcmtleSA8QnJpYW4uU3RhcmtleUBhcm0uY29tPiB3cm90ZToKPiA+Cj4gPiBIaSBEYW5pZWws
Cj4gPgo+ID4gT24gVHVlLCBOb3YgMDUsIDIwMTkgYXQgMTE6MjY6MzZQTSArMDAwMCwgRGFuaWVs
IFN0b25lIHdyb3RlOgo+ID4gPiBIaSBBbmRyemVqLAo+ID4gPiBUaGFua3MgZm9yIHRha2luZyB0
aGlzIG9uISBJdCdzIGxvb2tpbmcgYmV0dGVyIHRoYW4gdjEgZm9yIHN1cmUuIEEgZmV3Cj4gPiA+
IHRoaW5ncyBiZWxvdzoKPiA+ID4KPiA+ID4gT24gTW9uLCAyMDE5LTExLTA0IGF0IDIzOjEyICsw
MTAwLCBBbmRyemVqIFBpZXRyYXNpZXdpY3ogd3JvdGU6Cj4gPiA+ID4gK2Jvb2wgZHJtX2FmYmNf
Y2hlY2tfb2Zmc2V0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCj4gPiA+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICBjb25zdCBzdHJ1Y3QgZHJtX21vZGVfZmJfY21kMiAqbW9kZV9jbWQpCj4gPiA+
ID4gK3sKPiA+ID4gPiArICAgaWYgKG1vZGVfY21kLT5vZmZzZXRzWzBdICE9IDApIHsKPiA+ID4g
PiArICAgICAgICAgICBEUk1fREVCVUdfS01TKCJBRkJDIGJ1ZmZlcnMnIHBsYW5lIG9mZnNldCBz
aG91bGQgYmUKPiA+ID4gPiAwXG4iKTsKPiA+ID4gPiArICAgICAgICAgICByZXR1cm4gZmFsc2U7
Cj4gPiA+ID4gKyAgIH0KPiA+ID4gPiArCj4gPiA+ID4gKyAgIHJldHVybiB0cnVlOwo+ID4gPiA+
ICt9Cj4gPiA+ID4gK0VYUE9SVF9TWU1CT0xfR1BMKGRybV9hZmJjX2NoZWNrX29mZnNldCk7Cj4g
PiA+Cj4gPiA+IElzIHRoaXMgYWN0dWFsbHkgdW5pdmVyc2FsbHkgdHJ1ZT8gSWYgdGhlIG9mZnNl
dCBpcyBzdWZmaWNpZW50bHkKPiA+ID4gYWxpZ25lZCBmb3IgKGUuZy4pIERNQSB0cmFuc2ZlcnMg
dG8gc3VjY2VlZCwgaXMgdGhlcmUgYW55IHJlYXNvbiB3aHkgaXQKPiA+ID4gbXVzdCBiZSB6ZXJv
Pwo+ID4gPgo+ID4gPiA+ICtib29sIGRybV9hZmJjX2NoZWNrX3NpemVfYWxpZ24oc3RydWN0IGRy
bV9kZXZpY2UgKmRldiwKPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBz
dHJ1Y3QgZHJtX21vZGVfZmJfY21kMiAqbW9kZV9jbWQpCj4gPiA+ID4gK3sKPiA+ID4gPiArICAg
c3dpdGNoIChtb2RlX2NtZC0+bW9kaWZpZXJbMF0gJgo+ID4gPiA+IEFGQkNfRk9STUFUX01PRF9C
TE9DS19TSVpFX01BU0spIHsKPiA+ID4gPiArICAgY2FzZSBBRkJDX0ZPUk1BVF9NT0RfQkxPQ0tf
U0laRV8xNngxNjoKPiA+ID4gPiArICAgICAgICAgICBpZiAoKG1vZGVfY21kLT53aWR0aCAlIDE2
KSB8fCAobW9kZV9jbWQtPmhlaWdodCAlIDE2KSkKPiA+ID4gPiB7Cj4gPiA+Cj4gPiA+IFRoaXMg
aXMgYSBkZWFsYnJlYWtlciBmb3IgbWFueSByZXNvbHV0aW9uczogZm9yIGV4YW1wbGUsIDEzNjZ4
NzY4IGlzbid0Cj4gPiA+IGNsZWFubHkgZGl2aXNpYmxlIGJ5IDE2IGluIHdpZHRoLiBTbyB0aGlz
IG1lYW5zIHRoYXQgd2Ugd291bGQgaGF2ZSB0bwo+ID4gPiBlaXRoZXIgdXNlIGEgbGFyZ2VyIGJ1
ZmZlciBhbmQgY3JvcCwgb3Igc2NhbGUsIG9yIHNvbWV0aGluZy4KPiA+ID4KPiA+ID4gTm8gdXNl
cnNwYWNlIGlzIHByZXBhcmVkIHRvIGFsaWduIGZiIHdpZHRoL2hlaWdodCB0byB0aWxlIGRpbWVu
c2lvbnMKPiA+ID4gbGlrZSB0aGlzLCBzbyB0aGlzIGNoZWNrIHdpbGwgYmFzaWNhbGx5IGZhaWwg
ZXZlcnl3aGVyZS4KPiA+ID4KPiA+ID4gSG93ZXZlciwgb3ZlcmFsbG9jYXRpb24gcmVsYXRpdmUg
dG8gdGhlIGRlY2xhcmVkIHdpZHRoL2hlaWdodCBpc24ndCBhCj4gPiA+IHByb2JsZW0gYXQgYWxs
LiBJbiBvcmRlciB0byBkZWFsIHdpdGggaG9yaXpvbnRhbCBhbGlnbm1lbnQsIHlvdSBzaW1wbHkK
PiA+ID4gbmVlZCB0byBlbnN1cmUgdGhhdCB0aGUgc3RyaWRlIGlzIGEgbXVsdGlwbGUgb2YgdGhl
IHRpbGUgd2lkdGg7IGZvcgo+ID4gPiB2ZXJ0aWNhbCBhcnJhbmdlbWVudCwgdGhhdCB0aGUgYnVm
ZmVyIGlzIGxhcmdlIGVub3VnaCB0byBjb250YWluCj4gPiA+IHN1ZmZpY2llbnQgJ2xpbmVzJyB0
byB0aGUgbmV4dCB0aWxlIGJvdW5kYXJ5Lgo+ID4gPgo+ID4gPiBpLmUuIHJhdGhlciB0aGFuIGNo
ZWNraW5nIHdpZHRoL2hlaWdodCwgeW91IHNob3VsZCBjaGVjazoKPiA+ID4gICAqIGZiX3N0cmlk
ZSA+PSAoQUxJR04oZmJfd2lkdGgsIHRpbGVfd2lkdGgpLCBicHApCj4gPiA+ICAgKiBidWZfc2l6
ZSA+PSBmYl9zdHJpZGUgKiBBTElHTihmYl9oZWlnaHQsIHRpbGVfaGVpZ2h0KQo+ID4KPiA+IFdl
bGwsIHNvcnQgb2YuCj4gPgo+ID4gSSBhZ3JlZSB3aXRoIHlvdSB0aGF0IGZvciBob3Jpem9udGFs
IHBhZGRpbmcsIHdlIGNhbiBpbmRlZWQgdXNlIHBpdGNoLgo+ID4KPiA+IEhvd2V2ZXIsIHRoZSBB
RkJDIGRlY29kZXIocykgbmVlZCB0byBrbm93IGV4YWN0bHkgd2hhdCB0aGUgdG90YWwKPiA+IF9h
bGxvY2F0ZWRfIHNpemUgaW4gcGl4ZWxzIG9mIHRoZSBidWZmZXIgaXMgLSBhcyB0aGlzIGluZmx1
ZW5jZXMgdGhlCj4gPiBoZWFkZXIgc2l6ZSwgYW5kIHdlIG5lZWQgdG8ga25vdyB0aGUgaGVhZGVy
IHNpemUgdG8ga25vdyB3aGVyZSBpdCBlbmRzCj4gPiBhbmQgdGhlIGJvZHkgYmVnaW5zLgo+ID4K
PiA+IEkgc2VlIGEgY291cGxlIG9mIHBvc3NpYmxlIHdheXMgZm9yd2FyZHM6Cj4gPgo+ID4gIC0g
S2VlcCBpdCBhcy1pcy4gVGhlIHJlc3RyaWN0aXZlIGNoZWNrcyBlbnN1cmUgdGhhdCB0aGVyZSdz
IG5vCj4gPiAgICBhbWJpZ3VpdHkgYW5kIHdlIHVzZSB0aGUgZmIgd2lkdGgvaGVpZ2h0IHRvIGRl
dGVybWluZSB0aGUgcmVhbAo+ID4gICAgYWxsb2NhdGVkIHdpZHRoL2hlaWdodC4gVXNlcnNwYWNl
IG5lZWRzIHRvIGJlIEFGQkMtYXdhcmUgYW5kIHNldCB1cAo+ID4gICAgcGxhbmUgY3JvcHBpbmcg
dG8gaGFuZGxlIHRoZSBhbGlnbm1lbnQgZGlmZmVyZW5jZXMuCj4gPgo+ID4gIC0gVXNlIHBpdGNo
IHRvIGRldGVybWluZSB0aGUgInJlYWwiIHdpZHRoLCBhbmQgaW50ZXJuYWxseSBpbiB0aGUKPiA+
ICAgIGtlcm5lbCBhbGlnbiBoZWlnaHQgdXAgdG8gdGhlIG5leHQgYWxpZ25tZW50IGJvdW5kYXJ5
LiBUaGlzIHdvcmtzCj4gPiAgICBPSywgc28gbG9uZyBhcyB0aGVyZSdzIG5vIGFkZGl0aW9uYWwg
cGFkZGluZyBhdCB0aGUgYm90dG9tIG9mIHRoZQo+ID4gICAgYnVmZmVyLiBUaGlzIHdvdWxkIHdv
cmssIGJ1dCBJIGNhbid0IGZpZ3VyZSBhIHdheSB0byBjaGVjay9lbmZvcmNlCj4gPiAgICB0aGF0
IHRoZXJlJ3Mgbm8gYWRkaXRpb25hbCBwYWRkaW5nIGF0IHRoZSBib3R0b20uCj4gPgo+ID4gIC0g
U29tZXRoaW5nIGVsc2UuLi4KPiA+Cj4gPiBUaGUgY2hlY2tzIGFzLWltcGxlbWVudGVkIHdlcmUg
ZGVsaWJlcmF0ZWx5IGNvbnNlcnZhdGl2ZSwgYW5kIGRvbid0Cj4gPiBwcmVjbHVkZSBkb2luZyBz
b21lIHJlbGF4YXRpb24gaW4gdGhlIGZ1dHVyZS4KPiA+Cj4gPiBPbiBBbmRyb2lkLCBncmFsbG9j
IGlzIHVzZWQgdG8gc3RvcmUgdGhlICJyZWFsIiBhbGxvY2F0ZWQgd2lkdGgvaGVpZ2h0Cj4gPiBh
bmQgdGhpcyBpcyB1c2VkIHRvIHNldCB1cCB0aGUgRFJNIEFQSSBhcHByb3ByaWF0ZWx5Lgo+IAo+
IEZha2Ugc3RyaWRlICsgcmVhbCB2aXNpYmxlIGgvdyBpbiB0aGUgZHJtZmIuIEJlY2F1c2UgdGhh
dCdzIGhvdyBpdAo+IHdvcmtzIHdpdGggYWxsIHRoZSB0aWxlZCBmb3JtYXRzIGFscmVhZHksIGFu
ZCBleHBlY3RpbmcgdXNlcnNwYWNlIHRvCj4gZnVkZ2UgdGhpcyBhbGwgY29ycmVjdGx5IHNlZW1z
IHZlcnkgYmFja3dhcmRzIHRvIG1lLiBJbiBhIHdheSB3ZSBoYWQKPiB0aGF0IGVudGlyZSBmYWtl
IHN0cmlkZSBkaXNjdXNzaW9uIGFscmVhZHkgZm9yIHRoZSBibG9jayBzaXplIGZvcm1hdAo+IHN0
dWZmIGFscmVhZHksIGJ1dCBub3cgaW4gYSBkaWZmZXJlbnQgZmxhdm91ci4KCkZha2Ugc3RyaWRl
IC0gbGlrZSBJIHNhaWQsIG5vIHByb2JsZW07IHNvdW5kcyBnb29kLiBUaGF0IHNvbHZlcyBvbmUK
ZGltZW5zaW9uLgoKU28gZG8geW91IGhhdmUgYSBwcm9wb3NhbCBmb3IgaG93IHdlIGRldGVybWlu
ZSB3aGF0IHRoZSBhbGxvY2F0ZWQKaGVpZ2h0IGlzIGluIHRoYXQgY2FzZT8gSSBkb24ndCByZWFs
bHkgc2VlIGEgd2F5LgoKVGhhbmtzLAotQnJpYW4KCj4gCj4gQWxzbyBJIHRoaW5rIHRoYXQncyBt
b3JlIHJlYXNvbnMgd2h5IHRoaXMgc2hvdWxkIGJlIG5vLW9wdC1vdXRhYmxlCj4gY29kZSB0aGF0
J3MgZG9uZSBmb3IgYWxsIGRyaXZlcnMgd2hlbiB3ZSBjaGVjayBmcmFtZWJ1ZmZlcnMgaW4gYWRk
ZmIuCj4gUGx1cyB0aGVuIHNvbWUgaGVscGVycyB0byBnZXQgYXQgY29tcHV0ZWQgdmFsdWVzIGZv
ciBhbnkgZnJhbWVidWZmZXIKPiB3ZSBrbm93IHRvIGJlIHZhbGlkLgo+IC1EYW5pZWwKPiAKPiA+
ID4gVGhpcyBtYXkgZm9yY2UgdXMgdG8gZG8gc29tZSBzaWxseSBjcm9wcGluZyBnYW1lcyBpbnNp
ZGUgdGhlIFJvY2tjaGlwCj4gPiA+IEtNUyBkcml2ZXIsIGJ1dCBJIGZlZWwgaXQgYmVhdHMgdGhl
IGFsdGVybmF0aXZlIG9mIGJyZWFraW5nIHVzZXJzcGFjZS4KPiA+Cj4gPiBXZWxsLCBub3RoaW5n
J3MgZ29pbmcgdG8gZ2V0IGJyb2tlbiAtIGl0J3MganVzdCBwZXJoYXBzIG5vdCByZWFkeSB0bwo+
ID4gdHVybiBvbiBBRkJDIHlldC4KPiA+Cj4gPiA+Cj4gPiA+ID4gKyAgICAgICAgICAgICAgICAg
ICBEUk1fREVCVUdfS01TKAo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAiQUZC
QyBidWZmZXIgbXVzdCBiZSBhbGlnbmVkIHRvIDE2Cj4gPiA+ID4gcGl4ZWxzXG4iCj4gPiA+ID4g
KyAgICAgICAgICAgICAgICAgICApOwo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgcmV0dXJu
IGZhbHNlOwo+ID4gPiA+ICsgICAgICAgICAgIH0KPiA+ID4gPiArICAgICAgICAgICBicmVhazsK
PiA+ID4gPiArICAgY2FzZSBBRkJDX0ZPUk1BVF9NT0RfQkxPQ0tfU0laRV8zMng4Ogo+ID4gPiA+
ICsgICAgICAgICAgIC8qIGZhbGwgdGhyb3VnaCAqLwo+ID4gPgo+ID4gPiBJdCdzIGFsc28gaW5j
b25ncnVvdXMgdGhhdCAzMng4IGlzIHVuc3VwcG9ydGVkIGhlcmUsIGJ1dCBoYXMgYSBzZWN0aW9u
Cj4gPiA+IGluIGdldF9zdXBlcmJsa193aDsgcGxlYXNlIGhhcm1vbmlzZSB0aGVtIHNvIHRoaXMg
c2VjdGlvbiBlaXRoZXIgZG9lcwo+ID4gPiB0aGUgY2hlY2tzIGFzIGFib3ZlLCBvciB0aGF0IGdl
dF9zdXBlcmJsa193aCBkb2Vzbid0IHN1cHBvcnQgMzJ4OAo+ID4gPiBlaXRoZXIuCj4gPiA+Cj4g
PiA+ID4gK2Jvb2wgZHJtX2FmYmNfY2hlY2tfZmJfc2l6ZV9yZXQodTMyIHBpdGNoLCBpbnQgYnBw
LAo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICB1MzIgdywgdTMyIGgsIHUzMiBz
dXBlcmJsa193LCB1MzIKPiA+ID4gPiBzdXBlcmJsa19oLAo+ID4gPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICBzaXplX3Qgc2l6ZSwgdTMyIG9mZnNldCwgdTMyIGhkcl9hbGlnbiwKPiA+
ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgdTMyICpwYXlsb2FkX29mZiwgdTMyICp0
b3RhbF9zaXplKQo+ID4gPiA+ICt7Cj4gPiA+ID4gKyAgIGludCBuX3N1cGVyYmxrcyA9IDA7Cj4g
PiA+ID4gKyAgIHUzMiBzdXBlcmJsa19zeiA9IDA7Cj4gPiA+ID4gKyAgIHUzMiBhZmJjX3NpemUg
PSAwOwo+ID4gPgo+ID4gPiBQbGVhc2UgZG9uJ3QgaW5pdGlhbGlzZSB0aGUgYWJvdmUgdGhyZWUg
dmFyaWFibGVzLCBnaXZlbiB0aGF0IHlvdSBnbyBvbgo+ID4gPiB0byBpbW1lZGlhdGVseSBjaGFu
Z2UgdGhlaXIgdmFsdWVzLiBJbiB0aGlzIGNhc2UsIGluaXRpYWxpc2luZyB0byB6ZXJvCj4gPiA+
IGNhbiBvbmx5IGhpZGUgbGVnaXRpbWF0ZSB1bmluaXRpYWxpc2VkLXZhcmlhYmxlLXVzZSB3YXJu
aW5ncy4KPiA+ID4KPiA+ID4gPiArICAgbl9zdXBlcmJsa3MgPSAodyAvIHN1cGVyYmxrX3cpICog
KGggLyBzdXBlcmJsa19oKTsKPiA+ID4gPiArICAgc3VwZXJibGtfc3ogPSAoYnBwICogc3VwZXJi
bGtfdyAqIHN1cGVyYmxrX2gpIC8gQklUU19QRVJfQllURTsKPiA+ID4gPiArICAgYWZiY19zaXpl
ID0gQUxJR04obl9zdXBlcmJsa3MgKiBBRkJDX0hFQURFUl9TSVpFLCBoZHJfYWxpZ24pOwo+ID4g
PiA+ICsgICAqcGF5bG9hZF9vZmYgPSBhZmJjX3NpemU7Cj4gPiA+ID4gKwo+ID4gPiA+ICsgICBh
ZmJjX3NpemUgKz0gbl9zdXBlcmJsa3MgKiBBTElHTihzdXBlcmJsa19zeiwKPiA+ID4gPiBBRkJD
X1NVUEVSQkxLX0FMSUdOTUVOVCk7Cj4gPiA+ID4gKyAgICp0b3RhbF9zaXplID0gYWZiY19zaXpl
ICsgb2Zmc2V0Owo+ID4gPgo+ID4gPiBHZW5lcmFsbHkgdGhlc2UgYXJlIHJlZmVycmVkIHRvIGFz
ICd0aWxlcycgcmF0aGVyIHRoYW4gJ3N1cGVyYmxvY2tzJywKPiA+ID4gZ2l2ZW4gdGhhdCBJIHdv
dWxkIG9ubHkgZXhwZWN0IG9uZSBzdXBlcmJsb2NrIHBlciBidWZmZXIsIGJ1dCBpZiB0aGF0J3MK
PiA+ID4gdGhlIHRlcm1pbm9sb2d5IEFGQkMgdXNlcyB0aGVuIGl0IG1pZ2h0IGJlIGJldHRlciB0
byBzdGljayB3aXRoIGl0Lgo+ID4gPgo+ID4gPiA+ICsgICBpZiAoKHcgKiBicHApICE9IChwaXRj
aCAqIEJJVFNfUEVSX0JZVEUpKSB7Cj4gPiA+ID4gKyAgICAgICAgICAgRFJNX0RFQlVHX0tNUygi
SW52YWxpZCB2YWx1ZSBvZiAocGl0Y2ggKiBCSVRTX1BFUl9CWVRFKQo+ID4gPiA+ICg9JXUpIHNo
b3VsZCBiZSBzYW1lIGFzIHdpZHRoICg9JXUpICogYnBwICg9JXUpXG4iLAo+ID4gPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgcGl0Y2ggKiBCSVRTX1BFUl9CWVRFLCB3LCBicHAKPiA+ID4g
PiArICAgICAgICAgICApOwo+ID4gPiA+ICsgICAgICAgICAgIHJldHVybiBmYWxzZTsKPiA+ID4g
PiArICAgfQo+ID4gPgo+ID4gPiBIYXZpbmcgYSB0b28tc21hbGwgcGl0Y2ggaXMgb2J2aW91c2x5
IGEgcHJvYmxlbSBhbmQgd2Ugc2hvdWxkIHJlamVjdAo+ID4gPiBpdC4gQnV0IGlzIGhhdmluZyBh
IHRvby1sYXJnZSBwaXRjaCByZWFsbHkgYSBwcm9ibGVtOyBkb2VzIGl0IG5lZWQgdG8KPiA+ID4g
YmUgYW4gZXhhY3QgbWF0Y2gsIG9yIGNhbiB3ZSBzdXBwb3J0IHRoZSBjYXNlIHdoZXJlIHRoZSBw
aXRjaCBpcyB0b28KPiA+ID4gbGFyZ2UgYnV0IGFsc28gdGlsZS1hbGlnbmVkPyBJZiB3ZSBjYW4s
IGl0IHdvdWxkIGJlIHZlcnkgZ29vZCB0bwo+ID4gPiBzdXBwb3J0IHRoYXQuCj4gPgo+ID4gVGhl
IHJlYXNvbiBmb3IgZm9yY2luZyBpdCB0byBiZSBleGFjdCBpcyBhcyBJIHNhaWQgYWJvdmUgLSB3
ZSBfbXVzdF8KPiA+IGtub3cgd2hhdCB0aGUgInJlYWwiIHdpZHRoIGFuZCBoZWlnaHQgaXMuIElt
cGxlbWVudGluZyB0aGlzIGNoZWNrIHRvCj4gPiBmb3JjZSAocGl0Y2ggPT0gd2lkdGggKiBicHAp
IGVuc3VyZXMgdGhhdCwgYW5kIGFsc28gbGVhdmVzIHRoZSBvcHRpb24KPiA+IGZvciB1cyB0byBy
ZWxheCB0byBhbGxvdyBhIGxhcmdlciBwaXRjaCAoYXMgYWJvdmUpIGlmIHRoYXQgd2FzIHRoZQo+
ID4gcHJlZmVycmVkIGFwcHJvYWNoIGZvciBhbGlnbm1lbnQuCj4gPgo+ID4gSW4gZ2VuZXJhbCB0
aGUgY3VycmVudCBjaGVja3MgYXJlIGRlbGliZXJhdGVseSBkZXNpZ25lZCB0byBsZWF2ZSB0aGUK
PiA+IGRvb3Igb3BlbiBmb3IgZnV0dXJlIGltcHJvdmVtZW50cyB3aXRob3V0IGJyZWFraW5nIGFu
eXRoaW5nLgo+ID4KPiA+IENoZWVycywKPiA+IC1Ccmlhbgo+ID4KPiA+ID4KPiA+ID4gQ2hlZXJz
LAo+ID4gPiBEYW5pZWwKPiA+ID4KPiA+IElNUE9SVEFOVCBOT1RJQ0U6IFRoZSBjb250ZW50cyBv
ZiB0aGlzIGVtYWlsIGFuZCBhbnkgYXR0YWNobWVudHMgYXJlIGNvbmZpZGVudGlhbCBhbmQgbWF5
IGFsc28gYmUgcHJpdmlsZWdlZC4gSWYgeW91IGFyZSBub3QgdGhlIGludGVuZGVkIHJlY2lwaWVu
dCwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIGltbWVkaWF0ZWx5IGFuZCBkbyBub3QgZGlzY2xv
c2UgdGhlIGNvbnRlbnRzIHRvIGFueSBvdGhlciBwZXJzb24sIHVzZSBpdCBmb3IgYW55IHB1cnBv
c2UsIG9yIHN0b3JlIG9yIGNvcHkgdGhlIGluZm9ybWF0aW9uIGluIGFueSBtZWRpdW0uIFRoYW5r
IHlvdS4KCk5vdCBzdXJlIGhvdyB0aGF0IHNudWNrIGluLgoKPiAKPiAKPiAKPiAtLSAKPiBEYW5p
ZWwgVmV0dGVyCj4gU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCj4gKzQxICgw
KSA3OSAzNjUgNTcgNDggLSBodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
