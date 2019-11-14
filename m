Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC371FC1A5
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2019 09:37:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F27096E145;
	Thu, 14 Nov 2019 08:37:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60052.outbound.protection.outlook.com [40.107.6.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4520A6E145
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2019 08:37:29 +0000 (UTC)
Received: from VI1PR08CA0100.eurprd08.prod.outlook.com (2603:10a6:800:d3::26)
 by DB8PR08MB3930.eurprd08.prod.outlook.com (2603:10a6:10:a7::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.27; Thu, 14 Nov
 2019 08:37:26 +0000
Received: from VE1EUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::206) by VI1PR08CA0100.outlook.office365.com
 (2603:10a6:800:d3::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.23 via Frontend
 Transport; Thu, 14 Nov 2019 08:37:26 +0000
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT020.mail.protection.outlook.com (10.152.18.242) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.23 via Frontend Transport; Thu, 14 Nov 2019 08:37:26 +0000
Received: ("Tessian outbound 081de437afc7:v33");
 Thu, 14 Nov 2019 08:37:25 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ce607195e87fc3c6
X-CR-MTA-TID: 64aa7808
Received: from cb522d1172fc.2 (cr-mta-lb-1.cr-mta-net [104.47.4.53])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B9B3BC75-96E3-4677-866F-D5DB87C9C979.1; 
 Thu, 14 Nov 2019 08:37:20 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2053.outbound.protection.outlook.com [104.47.4.53])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cb522d1172fc.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 14 Nov 2019 08:37:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B6xcU38Z/c8dn5XR546f5a42rgFxxH8X02t2hU603Trkkz5fW9GWSWuIeLCq2MCxqV7jQg3Nbu6aJBHDx4LKph4Guw1r9BVpno2k476L/Y0sbipIpdCpsA0UuKtgiQmI0cQvs2nvIJpTcsW6tSADr2wVukd0okOujC62gsrZR0CDtl35aIPbWpEjIrh8Q2qsSQtpMHBsJwsxKfzrTZeIYPV6kyzivHnldMKG2zeBv+NWJiFFN7EDSrVaRRopFWDzdyqDSpVpl7IsaqR9kbQMwhJC2E0PRqJ0POyYMlYEqxlhC69lmm/aD9YY98vW6GXxRxcGreJkWEXPlzH5voEF6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xN0Zft+P/jNTEUbHl8hqlOshKgMPAYdWizfLu3gpML8=;
 b=SkScu9cdSIoP/EK/34DmKEqVdCUXWDr+gd/GXExHUVPeBfWEEzQJJ23LD+Ab4dBPQv7giEJAFIDtH8jP4JgqmD04RTXZ9VEgyxA48g71cj7+o87/lJSd4onmQk5BVG9AyQQ3jdXbD7enM0xGQ+8f6ETT67m73SCmFuUp/iZ6+iuYr7Q+xcTV9+eX8sg56KT8XP0yblsNxOUO5KO0YsxKKGMM8BL1JHwry0TK5F2Ky1ShAi4JniFrmDyYQhK5iEevA/P0bEeaJg/Vw1UiI2NfD8fgxr7JQ9JYszuiHpKvTfZ9lw72e5WQ+FWLN9uXI8UDgcaYFg1YTr8n96xhwPBLQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4768.eurprd08.prod.outlook.com (10.255.114.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.27; Thu, 14 Nov 2019 08:37:18 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a809:417a:faf3:61a7]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a809:417a:faf3:61a7%6]) with mapi id 15.20.2451.023; Thu, 14 Nov 2019
 08:37:18 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "airlied@linux.ie" <airlied@linux.ie>, 
 Brian Starkey <Brian.Starkey@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "sean@poorly.run" <sean@poorly.run>, 
 Mihail Atanassov <Mihail.Atanassov@arm.com>
Subject: [PATCH v3 0/6] arm/komeda: Add side_by_side support
Thread-Topic: [PATCH v3 0/6] arm/komeda: Add side_by_side support
Thread-Index: AQHVmsa5hZBsqwaKCk6udCfTKRiLJA==
Date: Thu, 14 Nov 2019 08:37:18 +0000
Message-ID: <20191114083658.27237-1-james.qian.wang@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0PR01CA0038.apcprd01.prod.exchangelabs.com
 (2603:1096:203:3e::26) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3acbeb92-f534-4ff1-20f4-08d768dde103
X-MS-TrafficTypeDiagnostic: VE1PR08MB4768:|VE1PR08MB4768:|DB8PR08MB3930:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB8PR08MB39304A9C8B243E0E3A43C012B3710@DB8PR08MB3930.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:8273;
x-forefront-prvs: 02213C82F8
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(376002)(346002)(396003)(136003)(39850400004)(189003)(199004)(71200400001)(71190400001)(36756003)(305945005)(2906002)(7736002)(110136005)(54906003)(6116002)(316002)(3846002)(99286004)(103116003)(6486002)(8936002)(2616005)(476003)(6436002)(66476007)(66556008)(64756008)(66446008)(66946007)(478600001)(6512007)(50226002)(66066001)(486006)(14454004)(2501003)(5660300002)(52116002)(256004)(14444005)(386003)(55236004)(25786009)(6636002)(102836004)(6506007)(8676002)(4326008)(26005)(81156014)(81166006)(1076003)(186003)(2201001)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4768;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: vjBad1EY4U2lSzi0N7Jx1n916/pzuhEXhc13JJNnFsVbAVeIoxH4sGd1c0W5nTLum+jgwZgLRCUmM0Uj5jUcMjVAXeN2wyriUL1d+w1F9e1qvbJ2kMZ8gkCsJWkcXaz0uo+6coDsj/KQUri/zlfoQAxClabtIMlUGIyS8QLp47yWCq0nkfTGG5w+mcFdNiQ66tBJv03Dl+NBO5hVOc+u3L5HjxNXQG92xtM7In02lZuALfR/ojGewybDrGAmPe0ECv4CPDsu5H20EY4ZRYxiNMvFCcEuS+ZbzKF/yFE/008dgLBObSfb6E+1bvZvJVCL0iCVHXGmXFeAJbi1tRGIZHKhMrFvy1z+QWNdO8Gowf9R5TPjaBs/xrm4PR5kqB5I1dO+k+F0EIgVph8azkDjBPK4hpj2LcHSDmG+1vcevrRw04hyegDcvx+vaTdYYswt
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4768
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(376002)(136003)(39850400004)(1110001)(339900001)(189003)(199004)(25786009)(36756003)(186003)(47776003)(2616005)(4326008)(14454004)(476003)(6486002)(66066001)(486006)(126002)(3846002)(6116002)(6636002)(2501003)(386003)(26005)(478600001)(6512007)(22756006)(356004)(102836004)(2906002)(336012)(316002)(7736002)(1076003)(76130400001)(36906005)(6506007)(26826003)(305945005)(103116003)(110136005)(50466002)(54906003)(14444005)(23756003)(81156014)(81166006)(99286004)(8746002)(8936002)(5660300002)(8676002)(86362001)(2201001)(50226002)(70206006)(105606002)(70586007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB8PR08MB3930;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Fail; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: e7ff8c80-3e7c-4a34-e59a-08d768dddbaf
NoDisclaimer: True
X-Forefront-PRVS: 02213C82F8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d/6amFuNJebNPLnLexDpsy4dY9jt1q6zZU6ax8JH+QYL+LTfREq1WP5f4njK98oYCSr52n6QKCNPPfslOw8KAirTATwUsFWx+mevRxU6lJCi/6BihxHl6w8UEx6OAqaxKn6ZpgQMUusSbH58lqRwbPYoGvGFJGDU2OUrkMYNfHOFGOsRZa8UTAQX3HfRQqeepupwx+GC4UPcInQlBapTw7RJExIPFtD9fvoCZtv9lfmya9Wj/LEmN4gZUPw/78Z24Oat9d6IH3Mky4GlcjQ1V3tDrNPy9zTPlrVdjIwT0cISAYMPAOspjIFBqLontLC/vY77sKqtNihR3TUzs7XYljnil6e6vJqZj3ymqRYnzkqbE2JFczBFwwYE+XyPVEDRj7AO/Uiyx/qNFH7i7DIi3SPZ74Imfyz3aVBvIfWJYM0Bwdr3CNwFwUYBmkMpu0md
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2019 08:37:26.7303 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3acbeb92-f534-4ff1-20f4-08d768dde103
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB3930
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xN0Zft+P/jNTEUbHl8hqlOshKgMPAYdWizfLu3gpML8=;
 b=kWkuYjqSlVSWcnPsMi0B2sQbMcUPJ/oz7lQccbnonlxqlSIYrw5sfa45/1z6BfaFQrQ0a2qtimin2F1zPqL3lV7s7teTM4YlZXsGx34YyId4m+KGdmuWDbj5rtl0uFxJXVeep3lK98U1jcyD2rT+TXZ+6mOlg8qqX7QMcZqLfmY=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xN0Zft+P/jNTEUbHl8hqlOshKgMPAYdWizfLu3gpML8=;
 b=kWkuYjqSlVSWcnPsMi0B2sQbMcUPJ/oz7lQccbnonlxqlSIYrw5sfa45/1z6BfaFQrQ0a2qtimin2F1zPqL3lV7s7teTM4YlZXsGx34YyId4m+KGdmuWDbj5rtl0uFxJXVeep3lK98U1jcyD2rT+TXZ+6mOlg8qqX7QMcZqLfmY=
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
Cc: nd <nd@arm.com>, Ayan Halder <Ayan.Halder@arm.com>, "Oscar
 Zhang \(Arm Technology China\)" <Oscar.Zhang@arm.com>, "Tiannan Zhu \(Arm
 Technology China\)" <Tiannan.Zhu@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Julien
 Yin \(Arm Technology China\)" <Julien.Yin@arm.com>, "Channing Chen \(Arm
 Technology China\)" <Channing.Chen@arm.com>, "james qian wang \(Arm Technology
 China\)" <james.qian.wang@arm.com>,
 "Yiqi Kang \(Arm Technology China\)" <Yiqi.Kang@arm.com>,
 "Thomas Sun \(Arm Technology China\)" <thomas.Sun@arm.com>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>,
 Ben Davis <Ben.Davis@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

S29tZWRhIEhXICh0d28gcGlwZWxpbmVzKSBjYW4gd29yayBvbiBzaWRlIGJ5IHNpZGUgbW9kZSwg
d2hpY2ggc3BsaXRzIHRoZQppbnRlcm5hbCBkaXNwbGF5IHByb2Nlc3NpbmcgdG8gdHdvIGhhbHZl
cyAoTEVGVC9SSUdIVCkgYW5kIGhhbmRsZSB0aGVtIGJ5CnR3byBwaXBlbGluZXMgc2VwYXJhdGVs
eSBhbmQgc2ltdWx0YW5lb3VzbHkuCkFuZCBzaW5jZSBvbmUgc2luZ2xlIHBpcGVsaW5lIG9ubHkg
aGFuZGxlcyB0aGUgaGFsZiBkaXNwbGF5IGZyYW1lLCBzbyB0aGUKbWFpbiBlbmdpbmUgY2xvY2sg
cmVxdWlyZW1lbnQgY2FuIGFsc28gYmUgaGFsdmVkLgoKVGhlIGRhdGEgZmxvdyBvZiBzaWRlX2J5
X3NpZGUgYXMgYmxvdzoKCiBzbGF2ZS5sYXllcjAgLT5cICAgICAgICAgICAgICAgICAgLy0+IHNs
YXZlLndiX2xheWVyIC0+IG1lbS5mYi5yaWdodF9wYXJ0CiAgICAgLi4uICAgICAgICAgLT4gc2xh
dmUuY29tcGl6IC0+CiBzbGF2ZS5sYXllcjMgLT4vICAgICAgICAgICAgICAgICAgXC0+IHNsYXZl
LmltcHJvY2Vzc29yLT4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIFwgICAvLT4gb3V0cHV0LWxpbmswCiBtYXN0ZXIubGF5ZXIwIC0+XCAg
ICAgICAgICAgICAgICAgICAvLT4gbWFzdGVyLmltcHJvY2Vzc29yIC0+XC0+IG91dHB1dC1saW5r
MQogICAgIC4uLiAgICAgICAgICAtPiBtYXN0ZXIuY29tcGl6IC0+CiBtYXN0ZXIubGF5ZXIzIC0+
LyAgICAgICAgICAgICAgICAgICBcLT4gbWFzdGVyLndiX2xheWVyIC0+IG1lbS5mYi5sZWZ0X3Bh
cnQKCnYzOiBSZWJhc2UKCmphbWVzIHFpYW4gd2FuZyAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpICg2
KToKICBkcm0va29tZWRhOiBBZGQgc2lkZSBieSBzaWRlIGFzc2VtYmxpbmcKICBkcm0va29tZWRh
OiBBZGQgc2lkZSBieSBzaWRlIHBsYW5lX3N0YXRlIHNwbGl0CiAgZHJtL2tvbWVkYTogQnVpbGQg
c2lkZSBieSBzaWRlIGRpc3BsYXkgb3V0cHV0IHBpcGVsaW5lCiAgZHJtL2tvbWVkYTogQWRkIHNp
ZGUgYnkgc2lkZSBzdXBwb3J0IGZvciB3cml0ZWJhY2sKICBkcm0va29tZWRhOiBVcGRhdGUgd3Jp
dGViYWNrIHNpZ25hbCBmb3Igc2lkZV9ieV9zaWRlCiAgZHJtL2tvbWVkYTogRXhwb3NlIHNpZGVf
Ynlfc2lkZSBieSBzeXNmcy9jb25maWdfaWQKCiAuLi4vZHJtL2FybS9kaXNwbGF5L2luY2x1ZGUv
bWFsaWRwX3Byb2R1Y3QuaCAgfCAgIDMgKy0KIC4uLi9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3
MV9jb21wb25lbnQuYyAgICB8ICAgNCArCiAuLi4vZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEv
a29tZWRhX2NydGMuYyAgfCAgNTQgKystLQogLi4uL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRh
L2tvbWVkYV9kZXYuYyAgIHwgICA0ICsKIC4uLi9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9r
b21lZGFfZGV2LmggICB8ICAgOSArCiAuLi4vZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29t
ZWRhX2ttcy5oICAgfCAgIDggKwogLi4uL2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3Bp
cGVsaW5lLmMgIHwgIDUwICsrKy0KIC4uLi9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9w
aXBlbGluZS5oICB8ICAzOSArKy0KIC4uLi9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmVf
c3RhdGUuYyAgICB8IDI3NyArKysrKysrKysrKysrKysrKy0KIC4uLi9ncHUvZHJtL2FybS9kaXNw
bGF5L2tvbWVkYS9rb21lZGFfcGxhbmUuYyB8ICAgNyArLQogLi4uL2FybS9kaXNwbGF5L2tvbWVk
YS9rb21lZGFfd2JfY29ubmVjdG9yLmMgIHwgIDExICstCiAxMSBmaWxlcyBjaGFuZ2VkLCA0MjEg
aW5zZXJ0aW9ucygrKSwgNDUgZGVsZXRpb25zKC0pCgotLQoyLjIwLjEKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
