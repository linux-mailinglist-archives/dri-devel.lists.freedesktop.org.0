Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F412DF1CD2
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2019 18:51:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF01A6EE25;
	Wed,  6 Nov 2019 17:51:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150087.outbound.protection.outlook.com [40.107.15.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31B246EE25
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2019 17:51:55 +0000 (UTC)
Received: from HE1PR0802CA0005.eurprd08.prod.outlook.com (2603:10a6:3:bd::15)
 by AM6PR08MB4851.eurprd08.prod.outlook.com (2603:10a6:20b:c9::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2430.20; Wed, 6 Nov
 2019 17:51:52 +0000
Received: from DB5EUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::205) by HE1PR0802CA0005.outlook.office365.com
 (2603:10a6:3:bd::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2430.20 via Frontend
 Transport; Wed, 6 Nov 2019 17:51:52 +0000
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT009.mail.protection.outlook.com (10.152.20.117) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.21 via Frontend Transport; Wed, 6 Nov 2019 17:51:52 +0000
Received: ("Tessian outbound e4042aced47b:v33");
 Wed, 06 Nov 2019 17:51:51 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: a289ec9c161cbd34
X-CR-MTA-TID: 64aa7808
Received: from cc64c54e40ce.1 (cr-mta-lb-1.cr-mta-net [104.47.10.50])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1A7515C2-77E5-4A4C-B19A-689A266CB20F.1; 
 Wed, 06 Nov 2019 17:51:46 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2050.outbound.protection.outlook.com [104.47.10.50])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cc64c54e40ce.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 06 Nov 2019 17:51:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fJymDEVR4BjZIOrCtnNpypwWKnZx73R2lLEepPEF80XIL/BVUr1wf92VSQ946jMny0pWIbhC+3H6NnKEPbDkMd3cQ0BHl9prYRd2DiTn9XWygKXPN3JpbfF6URm8ueowfbIpFb5eMNpcp0/bGasGMbdQUfZQkfqQlBqxzDkJpSvYh0BDjNG+6JT7HBCx4HJztlV1SKRSPio++HcdZA8e4/WcMWwAvvIBJ+8Kco0Xx5lFhHGVLySH4893Z4XwNXMEvFZO2WvHhCyRDrgPE8HKaaqGrDPpxNh7tDHMvteL6HW//NqeIFg5KZ20O99USc39dGhlNC6KYI7Iugqo0soHQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ipv5bL6v/AFxOVK/z8rESLfOAYZ98PHBjQVkKUKY8YY=;
 b=liZXZMq4N8KWL9viasjchV6wa+ib3sYemBL92+a2Od1MAhE2Xwm0pecRAmCngIdeOfPGr9qT4YMLkyHsNB98QnO527h2qd4WlSQRYGhsesvTJLadsiSbk9zm4oR+CqROsK0/S61C1ylkhHFhzBgx55oL9OhsvGMzqvRTU/iLVKrzYf9MsYmekhBvgQUhN+pAOHnEQtz6jRMx0Nzrbq1TE/m1kk+dv/JvBiWchv4WOICtz6E1p7OjujlqzFs3eHi3L0Cv+RJzpqQvXb/brgJtRK+g9u6SRyFqve/oRfqXVhg+cDY6B4rStENFOX15jngkR/8M3cDYWElBc80KmfBqaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB5533.eurprd08.prod.outlook.com (52.133.244.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.22; Wed, 6 Nov 2019 17:51:45 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d%3]) with mapi id 15.20.2408.024; Wed, 6 Nov 2019
 17:51:45 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: drm/komeda: Use devm_platform_ioremap_resource() in
 komeda_dev_create()
Thread-Topic: drm/komeda: Use devm_platform_ioremap_resource() in
 komeda_dev_create()
Thread-Index: AQHVfn+X0ywwD9NhU0O9ZT09tcfr2Kd+kFmA
Date: Wed, 6 Nov 2019 17:51:43 +0000
Message-ID: <28103957.GdvMQdgHhr@e123338-lin>
References: <64a6ea39-3e4b-2ebe-74f7-98720e581e3e@web.de>
 <20191009085704.GA26615@jamwan02-TSP300>
In-Reply-To: <20191009085704.GA26615@jamwan02-TSP300>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.55]
x-clientproxiedby: LO2P265CA0478.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a2::34) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 2453ff7b-4b9c-4d71-3c64-08d762e20152
X-MS-TrafficTypeDiagnostic: VI1PR08MB5533:|VI1PR08MB5533:|AM6PR08MB4851:
X-MS-Exchange-PUrlCount: 1
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB48515F872D78856C57AD15F18F790@AM6PR08MB4851.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:7691;OLM:7691;
x-forefront-prvs: 02135EB356
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(346002)(396003)(366004)(39860400002)(376002)(136003)(199004)(189003)(386003)(64756008)(66556008)(66446008)(6506007)(66946007)(102836004)(5660300002)(66476007)(305945005)(71190400001)(81156014)(6486002)(86362001)(76176011)(486006)(33716001)(52116002)(6436002)(81166006)(8676002)(446003)(71200400001)(476003)(11346002)(9686003)(6246003)(6512007)(2351001)(5640700003)(2501003)(26005)(25786009)(186003)(8936002)(4326008)(6306002)(6116002)(3846002)(478600001)(229853002)(7736002)(99286004)(14454004)(966005)(256004)(316002)(2906002)(54906003)(14444005)(66066001)(6916009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB5533;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: vXwzzM7EYQuQCoBmEwIo/DQLZq5WQWtOTUh6D6K+VKR0XKJMYIxbX3xRG0ES4yMmD3wsW6Blg/QBLYhN2+Ge4ZnnzCKtrnpSEnGSIflQryyc7Tu8xF2xNxODPGPerzQR9G/Y8g2De9TRL1Y78hhG9A1Hj0QvCk7WZrgmvVnZawpwC7fgpMW22nrzCtVzoqTiHiKqZSLpAQRxHE4+Pk2rTER2QSIb/lV9B99jA5w7NFhGO3kiv4GyHy1p8rnN7cdZcpHGVZAKqZDHdSccaHwJRUu+JXdAxyvlCjaIiDV8ompDg8knYTioOExpW5F6hPf+nwBl5wNw6oZTvP/nZlU7Hb/iO3zkSEjHLepaDjE5s8X19HhibemWMNC/pdINCCNdX55wUZBm16ELYVujmjVKXSMympht9eAtrHzW5/s7xOlrWFI9oHJBOisx2EZ767tF3Zps8tjn152Fw5hpm6Xl9ADZegKDgYlDDPBxxctsleI=
Content-ID: <184B2102DD5CE648896FEEA08791FEB1@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5533
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(39860400002)(346002)(376002)(396003)(136003)(1110001)(339900001)(199004)(189003)(316002)(386003)(76176011)(6506007)(478600001)(336012)(6916009)(5640700003)(356004)(186003)(25786009)(14444005)(66066001)(33716001)(47776003)(81156014)(81166006)(7736002)(8936002)(8746002)(97756001)(476003)(99286004)(54906003)(126002)(86362001)(446003)(26826003)(11346002)(486006)(70206006)(6246003)(26005)(46406003)(76130400001)(4326008)(2906002)(305945005)(70586007)(23726003)(966005)(5660300002)(6306002)(50466002)(6512007)(3846002)(9686003)(8676002)(6116002)(14454004)(105606002)(2351001)(6486002)(229853002)(2501003)(22756006)(102836004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB4851;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Fail; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: af046850-12c4-428a-10f7-08d762e1fc27
NoDisclaimer: True
X-Forefront-PRVS: 02135EB356
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6H51jCe1mBcMCEZ9ICWG7WVp1CpbxJrxMpnqc/2Em5Hp7nVbNU+eLnxMjY7AqzGYO5W0OrZRO4dyjIV1NiV03mA4Gt2XM4fGze49U4SSeRSFJATlJDHy2WsIZO+CnrSma0YdoP2k7kjILHdzfGNMyMSbuRT2kXDp+kGG03/0BkB5JbKYvrEdfnQbsiqX+n5tpSeNGra/Mh0CwrRpNKPzlGXIhjpwmLdoknEcbSzeEFVumNs3jo4AXcyaJ4g2MvjUYBcRIgbrTsW0CHLPk4ckC2oqHajdA175DuS+N2tcHWHVRvTgDOXvJ4/PfKmObXrvBRcNhKXXgIuFxwQMGqmbBWtKRCbiDIfOc7LzKyXA8pur7sEsiug1sDV67yrsqDpuQpq9ufWKd5iTO7BYmgzDH5+4MXg7/DsxC42WXJlLykfe5/CIovwr/w51YCynpzHbXeCYXYWsc8vdhUdWlz1mWnL8Z2S0Z6uT5hHMzqvRZ/c=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2019 17:51:52.0001 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2453ff7b-4b9c-4d71-3c64-08d762e20152
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4851
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ipv5bL6v/AFxOVK/z8rESLfOAYZ98PHBjQVkKUKY8YY=;
 b=1W/cvQwH1DHJJhSgf5jd0t9f6HFzeWniVs3WunxCFeo0L1eWBUitVWcsg+14YHE86eCifKoELXUerOV3A9BwBVJsYhrcbDaaNQL7yyFmlU8dPdG/uTUR3r9Uj8LfoW3dMWWYLvjrVFMsW+E8UJS1xqVuwVJ6qfZK5viBJR7NUEU=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ipv5bL6v/AFxOVK/z8rESLfOAYZ98PHBjQVkKUKY8YY=;
 b=1W/cvQwH1DHJJhSgf5jd0t9f6HFzeWniVs3WunxCFeo0L1eWBUitVWcsg+14YHE86eCifKoELXUerOV3A9BwBVJsYhrcbDaaNQL7yyFmlU8dPdG/uTUR3r9Uj8LfoW3dMWWYLvjrVFMsW+E8UJS1xqVuwVJ6qfZK5viBJR7NUEU=
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
Cc: David Airlie <airlied@linux.ie>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 Liviu Dudau <Liviu.Dudau@arm.com>, LKML <linux-kernel@vger.kernel.org>,
 Markus Elfring <Markus.Elfring@web.de>,
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkbmVzZGF5LCA5IE9jdG9iZXIgMjAxOSAwOTo1NzoxMSBHTVQgamFtZXMgcWlhbiB3YW5n
IChBcm0gVGVjaG5vbG9neSBDaGluYSkgd3JvdGU6Cj4gT24gU2F0LCBTZXAgMjEsIDIwMTkgYXQg
MDc6NTA6NDZQTSArMDIwMCwgTWFya3VzIEVsZnJpbmcgd3JvdGU6Cj4gPiBGcm9tOiBNYXJrdXMg
RWxmcmluZyA8ZWxmcmluZ0B1c2Vycy5zb3VyY2Vmb3JnZS5uZXQ+Cj4gPiBEYXRlOiBTYXQsIDIx
IFNlcCAyMDE5IDE5OjQzOjUxICswMjAwCj4gPiAKPiA+IFNpbXBsaWZ5IHRoaXMgZnVuY3Rpb24g
aW1wbGVtZW50YXRpb24gYnkgdXNpbmcgYSBrbm93biB3cmFwcGVyIGZ1bmN0aW9uLgo+ID4gCj4g
PiBUaGlzIGlzc3VlIHdhcyBkZXRlY3RlZCBieSB1c2luZyB0aGUgQ29jY2luZWxsZSBzb2Z0d2Fy
ZS4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogTWFya3VzIEVsZnJpbmcgPGVsZnJpbmdAdXNlcnMu
c291cmNlZm9yZ2UubmV0Pgo+IAo+IFRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLgo+IAo+IExvb2tz
IGdvb2QgdG8gbWUuCj4gUmV2aWV3ZWQtYnk6IEphbWVzIFFpYW4gV2FuZyAoQXJtIFRlY2hub2xv
Z3kgQ2hpbmEpIDxqYW1lcy5xaWFuLndhbmdAYXJtLmNvbT4KCkFwcGxpZWQgdG8gZHJtLW1pc2Mt
bmV4dCAtIDUwZWM1YjU2M2JlZDA0YjBiMjYyODIyYjc1NWY2YWEzMzZmMWY0MGEKCj4gCj4gPiAt
LS0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYuYyB8
IDkgKy0tLS0tLS0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA4IGRlbGV0
aW9ucygtKQo+ID4gCj4gPiAtLQo+ID4gMi4yMy4wCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYuYyBiL2RyaXZlcnMvZ3B1
L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rldi5jCj4gPiBpbmRleCBjYTY0YTEyOWM1
OTQuLmEzODdkOTIzOTYyZSAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlz
cGxheS9rb21lZGEva29tZWRhX2Rldi5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rp
c3BsYXkva29tZWRhL2tvbWVkYV9kZXYuYwo+ID4gQEAgLTE3MiwxOSArMTcyLDEyIEBAIHN0cnVj
dCBrb21lZGFfZGV2ICprb21lZGFfZGV2X2NyZWF0ZShzdHJ1Y3QgZGV2aWNlICpkZXYpCj4gPiAg
CXN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYgPSB0b19wbGF0Zm9ybV9kZXZpY2UoZGV2KTsK
PiA+ICAJY29uc3Qgc3RydWN0IGtvbWVkYV9wcm9kdWN0X2RhdGEgKnByb2R1Y3Q7Cj4gPiAgCXN0
cnVjdCBrb21lZGFfZGV2ICptZGV2Owo+ID4gLQlzdHJ1Y3QgcmVzb3VyY2UgKmlvX3JlczsKPiA+
ICAJaW50IGVyciA9IDA7Cj4gPiAKPiA+ICAJcHJvZHVjdCA9IG9mX2RldmljZV9nZXRfbWF0Y2hf
ZGF0YShkZXYpOwo+ID4gIAlpZiAoIXByb2R1Y3QpCj4gPiAgCQlyZXR1cm4gRVJSX1BUUigtRU5P
REVWKTsKPiA+IAo+ID4gLQlpb19yZXMgPSBwbGF0Zm9ybV9nZXRfcmVzb3VyY2UocGRldiwgSU9S
RVNPVVJDRV9NRU0sIDApOwo+ID4gLQlpZiAoIWlvX3Jlcykgewo+ID4gLQkJRFJNX0VSUk9SKCJO
byByZWdpc3RlcnMgZGVmaW5lZC5cbiIpOwo+ID4gLQkJcmV0dXJuIEVSUl9QVFIoLUVOT0RFVik7
Cj4gPiAtCX0KPiA+IC0KPiA+ICAJbWRldiA9IGRldm1fa3phbGxvYyhkZXYsIHNpemVvZigqbWRl
diksIEdGUF9LRVJORUwpOwo+ID4gIAlpZiAoIW1kZXYpCj4gPiAgCQlyZXR1cm4gRVJSX1BUUigt
RU5PTUVNKTsKPiA+IEBAIC0xOTIsNyArMTg1LDcgQEAgc3RydWN0IGtvbWVkYV9kZXYgKmtvbWVk
YV9kZXZfY3JlYXRlKHN0cnVjdCBkZXZpY2UgKmRldikKPiA+ICAJbXV0ZXhfaW5pdCgmbWRldi0+
bG9jayk7Cj4gPiAKPiA+ICAJbWRldi0+ZGV2ID0gZGV2Owo+ID4gLQltZGV2LT5yZWdfYmFzZSA9
IGRldm1faW9yZW1hcF9yZXNvdXJjZShkZXYsIGlvX3Jlcyk7Cj4gPiArCW1kZXYtPnJlZ19iYXNl
ID0gZGV2bV9wbGF0Zm9ybV9pb3JlbWFwX3Jlc291cmNlKHBkZXYsIDApOwo+ID4gIAlpZiAoSVNf
RVJSKG1kZXYtPnJlZ19iYXNlKSkgewo+ID4gIAkJRFJNX0VSUk9SKCJNYXAgcmVnaXN0ZXIgc3Bh
Y2UgZmFpbGVkLlxuIik7Cj4gPiAgCQllcnIgPSBQVFJfRVJSKG1kZXYtPnJlZ19iYXNlKTsKPiBf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKPiAKCgot
LSAKTWloYWlsCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
