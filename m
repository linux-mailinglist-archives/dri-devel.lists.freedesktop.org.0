Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17800F2D9D
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 12:42:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABC376F65B;
	Thu,  7 Nov 2019 11:42:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00058.outbound.protection.outlook.com [40.107.0.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 993266F65B
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 11:42:39 +0000 (UTC)
Received: from VI1PR08CA0202.eurprd08.prod.outlook.com (2603:10a6:800:d2::32)
 by VE1PR08MB4862.eurprd08.prod.outlook.com (2603:10a6:802:a7::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2408.24; Thu, 7 Nov
 2019 11:42:36 +0000
Received: from AM5EUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::201) by VI1PR08CA0202.outlook.office365.com
 (2603:10a6:800:d2::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2430.23 via Frontend
 Transport; Thu, 7 Nov 2019 11:42:36 +0000
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT037.mail.protection.outlook.com (10.152.17.241) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2430.21 via Frontend Transport; Thu, 7 Nov 2019 11:42:36 +0000
Received: ("Tessian outbound 6481c7fa5a3c:v33");
 Thu, 07 Nov 2019 11:42:36 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 645030880de1a3c0
X-CR-MTA-TID: 64aa7808
Received: from 0078b69d08ee.2 (cr-mta-lb-1.cr-mta-net [104.47.10.59])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 31FF26D5-CEA3-4BE4-BA96-E536CF898A93.1; 
 Thu, 07 Nov 2019 11:42:30 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2059.outbound.protection.outlook.com [104.47.10.59])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0078b69d08ee.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 07 Nov 2019 11:42:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ioa/rERS0IR96CSsebILIvJdVJfjfUwQ+a7LD3u/cN5l4Gpz+mjOA+8W/1WTo6htPTSHgxZaNnTA8ILz1rFhv1EdLXDSqHWlM8pFnxgDZRAei+iT4RqA6kDNOY9h9Sj2A3lA1rhrTEDAUOtQYx23tqT7DS3116XB71sbxYtXX6VzTjIs/QyUE7pjS1zhkuC136cxbI+H92vbGk95pzgbCDGCcKDhVmCBVmpuHevG1K6Bb75nVcAAtbFlhMWKCoFNrxNKCA10QwWO5BPQIsU/a+RI5SKWLJTo2Vg7iW8jmbgfq0eQL5o7tUdDIP82z/ZEJCsxC7UaTm/BQcamrx+xuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Px3I5x1exalU7sGPOYZ9So+eq2jzh/DWgR8Nc28y2p4=;
 b=Ige5gDllKU8Jl7sUi8isYnY40owRp57XStDVnugbNw6dc1rTwyZ5yUfNsL3UiS6fnGOhDsAsFjSWVns+k7e1yzWFx1P7hw0VSl1MiijSyx2+TI4/HD1Lt34bzM+ZHSi+OxQ67o5mNmHikaNtTDTNEdpYFHZkdjfJ2CiFqSFMHg0cIKwQ8OI9qgJ2rBuDAtyjItt7c+iByieR4jiNYYf7X+TP6wTqnH/p+KaeYGC+yZytXihbL8Zzj50znGbi6YAoynlyzxMGCME9lzcJUjcrNgphLTwtS7eC2KeU05dPxYBU/KljzdtRED0+G87gSZ/63nnBfBXprkIyHibDUoKvIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB4351.eurprd08.prod.outlook.com (20.179.27.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.20; Thu, 7 Nov 2019 11:42:29 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d%3]) with mapi id 15.20.2408.028; Thu, 7 Nov 2019
 11:42:29 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 1/5] drm/komeda: Add debugfs node to control error verbosity
Thread-Topic: [PATCH v2 1/5] drm/komeda: Add debugfs node to control error
 verbosity
Thread-Index: AQHVlWBvEMFUMNrqkUyDY5X/ImK4tw==
Date: Thu, 7 Nov 2019 11:42:28 +0000
Message-ID: <20191107114155.54307-2-mihail.atanassov@arm.com>
References: <20191107114155.54307-1-mihail.atanassov@arm.com>
In-Reply-To: <20191107114155.54307-1-mihail.atanassov@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.55]
x-clientproxiedby: LO2P265CA0146.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9::14) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
x-mailer: git-send-email 2.23.0
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 20a34134-500f-450f-8d47-08d7637795c9
X-MS-TrafficTypeDiagnostic: VI1PR08MB4351:|VI1PR08MB4351:|VE1PR08MB4862:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VE1PR08MB4862BA2460139E75923656BE8F780@VE1PR08MB4862.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:1850;OLM:1850;
x-forefront-prvs: 0214EB3F68
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(346002)(396003)(39860400002)(376002)(136003)(189003)(199004)(11346002)(316002)(54906003)(446003)(476003)(50226002)(71200400001)(6512007)(305945005)(6916009)(2906002)(8936002)(2616005)(44832011)(4326008)(6436002)(66066001)(256004)(486006)(86362001)(26005)(71190400001)(36756003)(52116002)(2351001)(6506007)(99286004)(6486002)(102836004)(2501003)(76176011)(386003)(186003)(6116002)(14454004)(66946007)(66476007)(66556008)(64756008)(66446008)(25786009)(478600001)(1076003)(3846002)(8676002)(81166006)(81156014)(7736002)(5640700003)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB4351;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: O6fniMMiVL7OOTWcx4Fpdn0GZf/4hC/7AiTbyJwvDTeRaPWaOCgbb6d3XBgVaVounvbFj2azzgmxdCxv6b8Hd7QGemG/8lTedZGqSH+ZOcEFTTIyEYBJ9rpapOvRYEdy4TacFDWw68BrYywusoOpWFLwNZowH/t4iC+3wkcCgOms7FKokjYwZYPMTOk8Qt6mGpZKqNr9maK3gqVY36DL2GZaK7awGdczv+yg6+e0Bt07rMd/UltxKmv/HS/Zj6O8o0PpUYKLvZFsth0Wf6EKrie/KgdL64c/FNMXBolBMQnN0m9HukqSn38A2xO8Vl57jZ3AZkTv7ImDRw/i1vfKnnrzYQs87NJII1TRRZYF8LYlxOvgPrzNXLSmJuK/Y1UnJjSpt7nLYhHc6DEzlSJZ9ZRdHj8hgaoXUnmBymDnYG1OFf91umvIafj3nUhsiNao
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4351
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(39860400002)(136003)(376002)(1110001)(339900001)(189003)(199004)(11346002)(6116002)(2351001)(8676002)(6916009)(86362001)(66066001)(5660300002)(5640700003)(81166006)(386003)(14454004)(356004)(76176011)(486006)(3846002)(47776003)(316002)(22756006)(81156014)(99286004)(476003)(102836004)(105606002)(2616005)(126002)(6506007)(186003)(26005)(2501003)(50226002)(336012)(26826003)(446003)(107886003)(70206006)(4326008)(478600001)(54906003)(70586007)(8936002)(8746002)(25786009)(7736002)(305945005)(76130400001)(2906002)(36756003)(23756003)(6512007)(50466002)(1076003)(6486002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4862;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Fail; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 92ec3c68-c2d0-4213-9fd9-08d763779159
NoDisclaimer: True
X-Forefront-PRVS: 0214EB3F68
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SA2fRD75Y2KUNFWK5vZEeKFDAAvDiC5CGvR98wxjiFwsCe8U2HxhP2VXsxq0rmSFyBZl4FIaN4hzYE9EUxYOvy0IEWasIvxI9rL6lFKrfgCJ3lj/Haf5RsbE7s8kQPIWVFvfDxP3AQKsSzkOcnzePmeQKiZvGdil5Yo+MTwUjVz8wR8qnoM07kfxBVk98zqvY2bqt+UXkMnN/9tEY7oq/FTy9vQzpSsiJaF8a5gA4TBHS7lG4N1TXwXKAvEz0uRlGYo4k7xoF0RzB26mKquOOeNReTQKSj6dh6Li2lDeIK/VY9vpiOg/5J/pgoHA85qv33p7Z9tEt2yFO2UI8qHzzzWU6oIEgsF1tB/8PuS7qLMseHM4sQGqcYwXVLjk2pSCXzle6yNWP0/aqbjiYzXMCGACT7Y5JWay67Z2wXYbi7hQ/mJo3CstxvjV6YC+dm6w
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2019 11:42:36.0906 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20a34134-500f-450f-8d47-08d7637795c9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4862
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Px3I5x1exalU7sGPOYZ9So+eq2jzh/DWgR8Nc28y2p4=;
 b=MDIcln5YVLw6ZbC2AFHkCetlmx6MjLTc5GHrSUiLdDI5H6eKOlFMpoH/X70r0I0QWV/ImCiwsrH1s2yZ2cRRNkatG0PiA2eeJ0aJ74k9F8GigHNi35TwJItz60xAbbchiiqRyIQT9lGiBoAxYLVXFsNR17nL2ppM4t8zGwGmxQ8=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Px3I5x1exalU7sGPOYZ9So+eq2jzh/DWgR8Nc28y2p4=;
 b=MDIcln5YVLw6ZbC2AFHkCetlmx6MjLTc5GHrSUiLdDI5H6eKOlFMpoH/X70r0I0QWV/ImCiwsrH1s2yZ2cRRNkatG0PiA2eeJ0aJ74k9F8GigHNi35TwJItz60xAbbchiiqRyIQT9lGiBoAxYLVXFsNR17nL2ppM4t8zGwGmxQ8=
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
Cc: Mihail Atanassov <Mihail.Atanassov@arm.com>,
 David Airlie <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>, nd <nd@arm.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TmFtZWQgJ2Vycl92ZXJib3NpdHknLCBjdXJyZW50bHkgd2l0aCBvbmx5IDEgYWN0aXZlIGJpdCBp
biB0aGF0CnJlcGxpY2F0ZXMgdGhlIGV4aXN0aW5nIGxldmVsIC0gcHJpbnQgZXJyb3IgZXZlbnRz
IG9uY2UgcGVyIGZsaXAuCgpSZXZpZXdlZC1ieTogSmFtZXMgUWlhbiBXYW5nIChBcm0gVGVjaG5v
bG9neSBDaGluYSkgPGphbWVzLnFpYW4ud2FuZ0Bhcm0uY29tPgpTaWduZWQtb2ZmLWJ5OiBNaWhh
aWwgQXRhbmFzc292IDxtaWhhaWwuYXRhbmFzc292QGFybS5jb20+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZGV2LmMgICB8ICA0ICsrKysKIGRyaXZlcnMv
Z3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rldi5oICAgfCAxNCArKysrKysrKysr
KystLQogZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZXZlbnQuYyB8
ICA5ICsrKysrKystLQogZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFf
a21zLmMgICB8ICAyICstCiA0IGZpbGVzIGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKyksIDUgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVk
YS9rb21lZGFfZGV2LmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVk
YV9kZXYuYwppbmRleCAxNGQ1YzVkYTllM2IuLjRlNDZmNjUwZmRkZiAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZGV2LmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZGV2LmMKQEAgLTU4LDYgKzU4LDgg
QEAgc3RhdGljIHZvaWQga29tZWRhX2RlYnVnZnNfaW5pdChzdHJ1Y3Qga29tZWRhX2RldiAqbWRl
dikKIAltZGV2LT5kZWJ1Z2ZzX3Jvb3QgPSBkZWJ1Z2ZzX2NyZWF0ZV9kaXIoImtvbWVkYSIsIE5V
TEwpOwogCWRlYnVnZnNfY3JlYXRlX2ZpbGUoInJlZ2lzdGVyIiwgMDQ0NCwgbWRldi0+ZGVidWdm
c19yb290LAogCQkJICAgIG1kZXYsICZrb21lZGFfcmVnaXN0ZXJfZm9wcyk7CisJZGVidWdmc19j
cmVhdGVfeDE2KCJlcnJfdmVyYm9zaXR5IiwgMDY2NCwgbWRldi0+ZGVidWdmc19yb290LAorCQkJ
ICAgJm1kZXYtPmVycl92ZXJib3NpdHkpOwogfQogI2VuZGlmCiAKQEAgLTI3Myw2ICsyNzUsOCBA
QCBzdHJ1Y3Qga29tZWRhX2RldiAqa29tZWRhX2Rldl9jcmVhdGUoc3RydWN0IGRldmljZSAqZGV2
KQogCQlnb3RvIGVycl9jbGVhbnVwOwogCX0KIAorCW1kZXYtPmVycl92ZXJib3NpdHkgPSBLT01F
REFfREVWX1BSSU5UX0VSUl9FVkVOVFM7CisKICNpZmRlZiBDT05GSUdfREVCVUdfRlMKIAlrb21l
ZGFfZGVidWdmc19pbml0KG1kZXYpOwogI2VuZGlmCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYuaCBiL2RyaXZlcnMvZ3B1L2RybS9hcm0v
ZGlzcGxheS9rb21lZGEva29tZWRhX2Rldi5oCmluZGV4IDQxNDIwMDIzM2I2NC4uYjViZDNkNTg5
OGVlIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVk
YV9kZXYuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9k
ZXYuaApAQCAtMjAyLDYgKzIwMiwxNCBAQCBzdHJ1Y3Qga29tZWRhX2RldiB7CiAKIAkvKiogQGRl
YnVnZnNfcm9vdDogcm9vdCBkaXJlY3Rvcnkgb2Yga29tZWRhIGRlYnVnZnMgKi8KIAlzdHJ1Y3Qg
ZGVudHJ5ICpkZWJ1Z2ZzX3Jvb3Q7CisJLyoqCisJICogQGVycl92ZXJib3NpdHk6IGJpdG1hc2sg
Zm9yIGhvdyBtdWNoIGV4dHJhIGluZm8gdG8gcHJpbnQgb24gZXJyb3IKKwkgKgorCSAqIFNlZSBL
T01FREFfREVWXyogbWFjcm9zIGZvciBkZXRhaWxzLgorCSAqLworCXUxNiBlcnJfdmVyYm9zaXR5
OworCS8qIFByaW50IGEgc2luZ2xlIGxpbmUgcGVyIGVycm9yIHBlciBmcmFtZSB3aXRoIGVycm9y
IGV2ZW50cy4gKi8KKyNkZWZpbmUgS09NRURBX0RFVl9QUklOVF9FUlJfRVZFTlRTIEJJVCgwKQog
fTsKIAogc3RhdGljIGlubGluZSBib29sCkBAIC0yMTksOSArMjI3LDExIEBAIHZvaWQga29tZWRh
X2Rldl9kZXN0cm95KHN0cnVjdCBrb21lZGFfZGV2ICptZGV2KTsKIHN0cnVjdCBrb21lZGFfZGV2
ICpkZXZfdG9fbWRldihzdHJ1Y3QgZGV2aWNlICpkZXYpOwogCiAjaWZkZWYgQ09ORklHX0RSTV9L
T01FREFfRVJST1JfUFJJTlQKLXZvaWQga29tZWRhX3ByaW50X2V2ZW50cyhzdHJ1Y3Qga29tZWRh
X2V2ZW50cyAqZXZ0cyk7Cit2b2lkIGtvbWVkYV9wcmludF9ldmVudHMoc3RydWN0IGtvbWVkYV9l
dmVudHMgKmV2dHMsIHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpOwogI2Vsc2UKLXN0YXRpYyBpbmxp
bmUgdm9pZCBrb21lZGFfcHJpbnRfZXZlbnRzKHN0cnVjdCBrb21lZGFfZXZlbnRzICpldnRzKSB7
fQorc3RhdGljIGlubGluZSB2b2lkIGtvbWVkYV9wcmludF9ldmVudHMoc3RydWN0IGtvbWVkYV9l
dmVudHMgKmV2dHMsCisJCQkJICAgICAgIHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpCit7fQogI2Vu
ZGlmCiAKIGludCBrb21lZGFfZGV2X3Jlc3VtZShzdHJ1Y3Qga29tZWRhX2RldiAqbWRldik7CmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9ldmVu
dC5jIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZXZlbnQuYwpp
bmRleCBhMzZmYjg2Y2MwNTQuLjU3NWVkNGRmNzRlZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZXZlbnQuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9ldmVudC5jCkBAIC0xMDcsMTAgKzEwNywxMiBA
QCBzdGF0aWMgYm9vbCBpc19uZXdfZnJhbWUoc3RydWN0IGtvbWVkYV9ldmVudHMgKmEpCiAJICAg
ICAgIChLT01FREFfRVZFTlRfRkxJUCB8IEtPTUVEQV9FVkVOVF9FT1cpOwogfQogCi12b2lkIGtv
bWVkYV9wcmludF9ldmVudHMoc3RydWN0IGtvbWVkYV9ldmVudHMgKmV2dHMpCit2b2lkIGtvbWVk
YV9wcmludF9ldmVudHMoc3RydWN0IGtvbWVkYV9ldmVudHMgKmV2dHMsIHN0cnVjdCBkcm1fZGV2
aWNlICpkZXYpCiB7Ci0JdTY0IHByaW50X2V2dHMgPSBLT01FREFfRVJSX0VWRU5UUzsKKwl1NjQg
cHJpbnRfZXZ0cyA9IDA7CiAJc3RhdGljIGJvb2wgZW5fcHJpbnQgPSB0cnVlOworCXN0cnVjdCBr
b21lZGFfZGV2ICptZGV2ID0gZGV2LT5kZXZfcHJpdmF0ZTsKKwl1MTYgY29uc3QgZXJyX3ZlcmJv
c2l0eSA9IG1kZXYtPmVycl92ZXJib3NpdHk7CiAKIAkvKiByZWR1Y2UgdGhlIHNhbWUgbXNnIHBy
aW50LCBvbmx5IHByaW50IHRoZSBmaXJzdCBldnQgZm9yIG9uZSBmcmFtZSAqLwogCWlmIChldnRz
LT5nbG9iYWwgfHwgaXNfbmV3X2ZyYW1lKGV2dHMpKQpAQCAtMTE4LDYgKzEyMCw5IEBAIHZvaWQg
a29tZWRhX3ByaW50X2V2ZW50cyhzdHJ1Y3Qga29tZWRhX2V2ZW50cyAqZXZ0cykKIAlpZiAoIWVu
X3ByaW50KQogCQlyZXR1cm47CiAKKwlpZiAoZXJyX3ZlcmJvc2l0eSAmIEtPTUVEQV9ERVZfUFJJ
TlRfRVJSX0VWRU5UUykKKwkJcHJpbnRfZXZ0cyB8PSBLT01FREFfRVJSX0VWRU5UUzsKKwogCWlm
ICgoZXZ0cy0+Z2xvYmFsIHwgZXZ0cy0+cGlwZXNbMF0gfCBldnRzLT5waXBlc1sxXSkgJiBwcmlu
dF9ldnRzKSB7CiAJCWNoYXIgbXNnWzI1Nl07CiAJCXN0cnVjdCBrb21lZGFfc3RyIHN0cjsKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ttcy5j
IGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfa21zLmMKaW5kZXgg
ZDQ5NzcyZGU5M2UwLi5lMzBhNWI0M2NhYTkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
cm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ttcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0v
ZGlzcGxheS9rb21lZGEva29tZWRhX2ttcy5jCkBAIC00OCw3ICs0OCw3IEBAIHN0YXRpYyBpcnFy
ZXR1cm5fdCBrb21lZGFfa21zX2lycV9oYW5kbGVyKGludCBpcnEsIHZvaWQgKmRhdGEpCiAJbWVt
c2V0KCZldnRzLCAwLCBzaXplb2YoZXZ0cykpOwogCXN0YXR1cyA9IG1kZXYtPmZ1bmNzLT5pcnFf
aGFuZGxlcihtZGV2LCAmZXZ0cyk7CiAKLQlrb21lZGFfcHJpbnRfZXZlbnRzKCZldnRzKTsKKwlr
b21lZGFfcHJpbnRfZXZlbnRzKCZldnRzLCBkcm0pOwogCiAJLyogTm90aWZ5IHRoZSBjcnRjIHRv
IGhhbmRsZSB0aGUgZXZlbnRzICovCiAJZm9yIChpID0gMDsgaSA8IGttcy0+bl9jcnRjczsgaSsr
KQotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
