Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ECF6104B13
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2019 08:12:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D44D6EAE7;
	Thu, 21 Nov 2019 07:12:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70084.outbound.protection.outlook.com [40.107.7.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE55F6EAE7
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2019 07:12:37 +0000 (UTC)
Received: from HE1PR0802CA0011.eurprd08.prod.outlook.com (2603:10a6:3:bd::21)
 by AM0PR08MB3908.eurprd08.prod.outlook.com (2603:10a6:208:106::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.16; Thu, 21 Nov
 2019 07:12:34 +0000
Received: from DB5EUR03FT042.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::208) by HE1PR0802CA0011.outlook.office365.com
 (2603:10a6:3:bd::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.16 via Frontend
 Transport; Thu, 21 Nov 2019 07:12:33 +0000
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT042.mail.protection.outlook.com (10.152.21.123) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.17 via Frontend Transport; Thu, 21 Nov 2019 07:12:33 +0000
Received: ("Tessian outbound f7868d7ede10:v33");
 Thu, 21 Nov 2019 07:12:31 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 02f21577ff2f10c2
X-CR-MTA-TID: 64aa7808
Received: from ba210b15cad0.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.14.59]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F4C1910F-3EC2-4E78-B854-30B7F58CF210.1; 
 Thu, 21 Nov 2019 07:12:26 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2059.outbound.protection.outlook.com [104.47.14.59])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ba210b15cad0.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 21 Nov 2019 07:12:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BiY0h0c87wfRMBCdicUSjyPmS6nEh9lvC1+XLkmoaB0Av3vJp5nwTI5rif71lUssFjvDCy8plBhSg4GgjWyWyt3/2pwk+b88rnukFb+V2MAECKzhhK3SKGDoutn5Z42fhOxipXW99UyILnrFbpQ3HzjeXvIze9w51LKzwwI387t9e0MXEGxwIuc6dgt415Y4PyVLotA3vO2Pc5qneOUqxTv2iZMv0Oy80fjLUKZ8CSKdg92UNQiLz7TiXhgcL0ZRQKv2LeyAdvskmhXDxNBpe6co3ezE6cFxS+9Qyd7qK1xZBg9r6s7XcwYIu8Q9Uz+XxOWPHZ1vYooUPC6JIu0V1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z4eIsz9sa5Hw+dYQo5b5iiwiz5ceZQ+NK39VGfqrZS8=;
 b=BiLF8DUzMkLkbFkWLNP7rKIJu+WHLii/X6AcgiSVQ+uUP3mEI4lbWbjsuN8xn9l9GVSwu0C/PSdeyFGsTqADjFbQ0C7scnuqorBxPIBNh4zzvgURWM0lcFVcT9IIIgX4vyx6rydOOzvNB1rbSgrFMAOpDSQgUbofFtpxUdPuxWE0OCXZhorde1hyb0rRe3JhWd7WxrY6CJEcHN+KhG0Fiz8QNe7bNLed4HHqx2tRivIwMtDjfFbnAuFk4UBKM+R6VlxDaEkeVTPHEMr6rrWRXCikOx5jONSbztI7mrRHFrntX2erACmOmuk0rbNNQbvAZYpUmYy4rWY9MTTCR6DH3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB5069.eurprd08.prod.outlook.com (20.179.29.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.16; Thu, 21 Nov 2019 07:12:24 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a809:417a:faf3:61a7]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a809:417a:faf3:61a7%6]) with mapi id 15.20.2474.019; Thu, 21 Nov 2019
 07:12:24 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "airlied@linux.ie" <airlied@linux.ie>, 
 Brian Starkey <Brian.Starkey@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, Mihail Atanassov
 <Mihail.Atanassov@arm.com>
Subject: [PATCH v4 0/6] arm/komeda: Add side_by_side support
Thread-Topic: [PATCH v4 0/6] arm/komeda: Add side_by_side support
Thread-Index: AQHVoDsGkHfFxrNdHkS40M+Z6TvkLw==
Date: Thu, 21 Nov 2019 07:12:24 +0000
Message-ID: <20191121071205.27511-1-james.qian.wang@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR03CA0064.apcprd03.prod.outlook.com
 (2603:1096:202:17::34) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7481fa00-0c75-4461-26a1-08d76e522df5
X-MS-TrafficTypeDiagnostic: VE1PR08MB5069:|VE1PR08MB5069:|AM0PR08MB3908:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM0PR08MB3908A65B58E19200044C7B60B34E0@AM0PR08MB3908.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:8273;
x-forefront-prvs: 0228DDDDD7
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39850400004)(366004)(376002)(346002)(136003)(189003)(199004)(386003)(6636002)(55236004)(102836004)(6506007)(256004)(52116002)(2906002)(14444005)(50226002)(7736002)(305945005)(66446008)(186003)(81166006)(81156014)(8676002)(8936002)(66946007)(6512007)(26005)(2616005)(71200400001)(6486002)(478600001)(71190400001)(6436002)(64756008)(66476007)(66556008)(86362001)(66066001)(4326008)(36756003)(2501003)(6116002)(316002)(3846002)(14454004)(103116003)(99286004)(54906003)(110136005)(25786009)(1076003)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB5069;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: W8gntgQtNwMTDBvI98seL79Kdg9vsYsrdIPoA+51BDU45/xo9Rsd7ojLFozmdi0ihTAtT1psAVMZ7PIOQ4OX2e3ccb2HZm9OkXZqIjGeDgvWXSXJlFo5smWuaIsocp0Q/vMtCz0rW2OFqfU7EpHM+UcmFN6lVSbKUpWR/aYO6vLgOA5ie6oLi33pgL1dDXhV3/5MTCZ8p3m2k3kTbLVnJ9Z02ahmXF+QcRk9UbugiVXbqPCq/HGPU2ofCkwBx+VroSJFb78CEgrNZv3lO1PIsT5JvtWtYgKKvro4WrGRnRZr588Gzpn2Z4dfIRvCzi4IifqnPZxsELd3NVpnjxtJPWuGGnvg0usJgyBdWZmb2AG9wUHeDsGG4wGOufYAkcxcuznXHsFXftEM/G0aU+XLJKpFCXMznjDlnT6HcpCfNuSnQQfE5XdwBsz5TIrbNbbw
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5069
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(136003)(39860400002)(346002)(1110001)(339900001)(189003)(199004)(2906002)(50226002)(6506007)(14454004)(4326008)(3846002)(6116002)(316002)(386003)(6636002)(6512007)(99286004)(36756003)(14444005)(110136005)(50466002)(356004)(23756003)(105606002)(54906003)(25786009)(2501003)(22756006)(26826003)(103116003)(478600001)(1076003)(47776003)(6486002)(305945005)(8936002)(8746002)(81156014)(8676002)(81166006)(76130400001)(86362001)(70586007)(186003)(2616005)(5660300002)(7736002)(102836004)(336012)(66066001)(70206006)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB3908;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Fail; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 010c0b35-99e3-437b-0505-08d76e5228a5
NoDisclaimer: True
X-Forefront-PRVS: 0228DDDDD7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0P9z9y5hM78muKDc9fWsuRDCc36ftaasrnFkVl5ev71uaYNGpBESb0BGXo3baYTW8n9HHkF5PaVP5HkrrVa685PHtSbMyMqmhSAUfu0vNJklkII+ImFpXQsKk80j25Ulbeb0aYwyJzs2CunIQ1iZZ7Rsoq3SHHagwKX11ttpK4vH4ruWwJeNPDrvZgNOlFtUUxNTt0xZ4CZxWev+uhxEHN4T3NMrtQ53pwCdu91C4//ldSIaypZPZgre+UL6cQrmSyCrBFAXb1wx9ez1SRNASJoGAh7U6H1m1/SiOhve8q+JSE5qvKsKwKi0n5TSF1UHEvdYMccS8getvmhcl1e0bZSa9ZsyjAiKotcautpaMnaYUjTmDAcsM+51CQbBl7FSzB76WU3RPRlvZF4irj4fB4nei/s9xTxpn6jLUBnnFibKhFmBukGS1l9gJtAzsMT8
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2019 07:12:33.3068 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7481fa00-0c75-4461-26a1-08d76e522df5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3908
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z4eIsz9sa5Hw+dYQo5b5iiwiz5ceZQ+NK39VGfqrZS8=;
 b=yk6jAruHbAmcvb4hk9OE2ZRSMc72ZEgK2dMNRLlTz82pK3O1oHNlDfa3gSYBCdQBt29S4Iz1kHJTkYHvKaS9GeNymjztYDSEhyWiaFU8clROTyDSzBfZBUivw2VJV1lJDg6lWNLybNlhd9/NB8hdPL4V3Opyp+HdN/y0wkY5gKc=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z4eIsz9sa5Hw+dYQo5b5iiwiz5ceZQ+NK39VGfqrZS8=;
 b=yk6jAruHbAmcvb4hk9OE2ZRSMc72ZEgK2dMNRLlTz82pK3O1oHNlDfa3gSYBCdQBt29S4Iz1kHJTkYHvKaS9GeNymjztYDSEhyWiaFU8clROTyDSzBfZBUivw2VJV1lJDg6lWNLybNlhd9/NB8hdPL4V3Opyp+HdN/y0wkY5gKc=
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
Cc: nd <nd@arm.com>, "Oscar
 Zhang \(Arm Technology China\)" <Oscar.Zhang@arm.com>,
 "Tiannan Zhu \(Arm Technology China\)" <Tiannan.Zhu@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Julien
 Yin \(Arm Technology China\)" <Julien.Yin@arm.com>, "Channing Chen \(Arm
 Technology China\)" <Channing.Chen@arm.com>, "james qian wang \(Arm Technology
 China\)" <james.qian.wang@arm.com>, "Thomas Sun \(Arm Technology
 China\)" <thomas.Sun@arm.com>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>,
 Ben Davis <Ben.Davis@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGk6IEFsbAoKS29tZWRhIEhXICh0d28gcGlwZWxpbmVzKSBjYW4gd29yayBvbiBzaWRlIGJ5IHNp
ZGUgbW9kZSwgd2hpY2ggc3BsaXRzIHRoZQppbnRlcm5hbCBkaXNwbGF5IHByb2Nlc3NpbmcgdG8g
dHdvIGhhbHZlcyAoTEVGVC9SSUdIVCkgYW5kIGhhbmRsZSB0aGVtIGJ5CnR3byBwaXBlbGluZXMg
c2VwYXJhdGVseSBhbmQgc2ltdWx0YW5lb3VzbHkuCkFuZCBzaW5jZSBvbmUgc2luZ2xlIHBpcGVs
aW5lIG9ubHkgaGFuZGxlcyB0aGUgaGFsZiBkaXNwbGF5IGZyYW1lLCBzbyB0aGUKbWFpbiBlbmdp
bmUgY2xvY2sgcmVxdWlyZW1lbnQgY2FuIGFsc28gYmUgaGFsdmVkLgoKVGhlIGRhdGEgZmxvdyBv
ZiBzaWRlX2J5X3NpZGUgYXMgYmxvdzoKCiBzbGF2ZS5sYXllcjAgLT5cICAgICAgICAgICAgICAg
ICAgLy0+IHNsYXZlLndiX2xheWVyIC0+IG1lbS5mYi5yaWdodF9wYXJ0CiAgICAgLi4uICAgICAg
ICAgLT4gc2xhdmUuY29tcGl6IC0+CiBzbGF2ZS5sYXllcjMgLT4vICAgICAgICAgICAgICAgICAg
XC0+IHNsYXZlLmltcHJvY2Vzc29yLT4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIFwgICAvLT4gb3V0cHV0LWxpbmswCiBtYXN0ZXIubGF5
ZXIwIC0+XCAgICAgICAgICAgICAgICAgICAvLT4gbWFzdGVyLmltcHJvY2Vzc29yIC0+XC0+IG91
dHB1dC1saW5rMQogICAgIC4uLiAgICAgICAgICAtPiBtYXN0ZXIuY29tcGl6IC0+CiBtYXN0ZXIu
bGF5ZXIzIC0+LyAgICAgICAgICAgICAgICAgICBcLT4gbWFzdGVyLndiX2xheWVyIC0+IG1lbS5m
Yi5sZWZ0X3BhcnQKCnYzOiBSZWJhc2UKCmphbWVzIHFpYW4gd2FuZyAoQXJtIFRlY2hub2xvZ3kg
Q2hpbmEpICg2KToKICBkcm0va29tZWRhOiBBZGQgc2lkZSBieSBzaWRlIGFzc2VtYmxpbmcKICBk
cm0va29tZWRhOiBBZGQgc2lkZSBieSBzaWRlIHBsYW5lX3N0YXRlIHNwbGl0CiAgZHJtL2tvbWVk
YTogQnVpbGQgc2lkZSBieSBzaWRlIGRpc3BsYXkgb3V0cHV0IHBpcGVsaW5lCiAgZHJtL2tvbWVk
YTogQWRkIHNpZGUgYnkgc2lkZSBzdXBwb3J0IGZvciB3cml0ZWJhY2sKICBkcm0va29tZWRhOiBV
cGRhdGUgd3JpdGViYWNrIHNpZ25hbCBmb3Igc2lkZV9ieV9zaWRlCiAgZHJtL2tvbWVkYTogRXhw
b3NlIHNpZGVfYnlfc2lkZSBieSBzeXNmcy9jb25maWdfaWQKCiAuLi4vZHJtL2FybS9kaXNwbGF5
L2luY2x1ZGUvbWFsaWRwX3Byb2R1Y3QuaCAgfCAgIDMgKy0KIC4uLi9hcm0vZGlzcGxheS9rb21l
ZGEvZDcxL2Q3MV9jb21wb25lbnQuYyAgICB8ICAgNCArCiAuLi4vZ3B1L2RybS9hcm0vZGlzcGxh
eS9rb21lZGEva29tZWRhX2NydGMuYyAgfCAgNTQgKystLQogLi4uL2dwdS9kcm0vYXJtL2Rpc3Bs
YXkva29tZWRhL2tvbWVkYV9kZXYuYyAgIHwgICA0ICsKIC4uLi9ncHUvZHJtL2FybS9kaXNwbGF5
L2tvbWVkYS9rb21lZGFfZGV2LmggICB8ICAgOSArCiAuLi4vZ3B1L2RybS9hcm0vZGlzcGxheS9r
b21lZGEva29tZWRhX2ttcy5oICAgfCAgIDggKwogLi4uL2RybS9hcm0vZGlzcGxheS9rb21lZGEv
a29tZWRhX3BpcGVsaW5lLmMgIHwgIDUwICsrKy0KIC4uLi9kcm0vYXJtL2Rpc3BsYXkva29tZWRh
L2tvbWVkYV9waXBlbGluZS5oICB8ICAzOSArKy0KIC4uLi9kaXNwbGF5L2tvbWVkYS9rb21lZGFf
cGlwZWxpbmVfc3RhdGUuYyAgICB8IDI3NyArKysrKysrKysrKysrKysrKy0KIC4uLi9ncHUvZHJt
L2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGxhbmUuYyB8ICAgNyArLQogLi4uL2FybS9kaXNw
bGF5L2tvbWVkYS9rb21lZGFfd2JfY29ubmVjdG9yLmMgIHwgIDExICstCiAxMSBmaWxlcyBjaGFu
Z2VkLCA0MjEgaW5zZXJ0aW9ucygrKSwgNDUgZGVsZXRpb25zKC0pCgotLQoyLjIwLjEKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
