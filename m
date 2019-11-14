Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08608FC38E
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2019 11:04:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59F9A6E17F;
	Thu, 14 Nov 2019 10:04:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140079.outbound.protection.outlook.com [40.107.14.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EC5C6E193
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2019 10:04:49 +0000 (UTC)
Received: from VI1PR08CA0201.eurprd08.prod.outlook.com (2603:10a6:800:d2::31)
 by AM6PR08MB4120.eurprd08.prod.outlook.com (2603:10a6:20b:a2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2430.20; Thu, 14 Nov
 2019 10:04:46 +0000
Received: from AM5EUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::204) by VI1PR08CA0201.outlook.office365.com
 (2603:10a6:800:d2::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2451.23 via Frontend
 Transport; Thu, 14 Nov 2019 10:04:46 +0000
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT010.mail.protection.outlook.com (10.152.16.134) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2451.23 via Frontend Transport; Thu, 14 Nov 2019 10:04:46 +0000
Received: ("Tessian outbound 3fba803f6da3:v33");
 Thu, 14 Nov 2019 10:04:45 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2a1b27f95d2c3e9e
X-CR-MTA-TID: 64aa7808
Received: from 308c7ddb3458.2 (cr-mta-lb-1.cr-mta-net [104.47.8.59])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DEEFED6F-19DC-4180-8954-B7B4DB82286B.1; 
 Thu, 14 Nov 2019 10:04:39 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2059.outbound.protection.outlook.com [104.47.8.59])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 308c7ddb3458.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 14 Nov 2019 10:04:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zzpo5Qr6QMM+4KdTRI3Vny/xPyflhZAtyxRL5l377zP1eCqn6nqOnTiUMh8j/8tfVgxyqEwgWuptF1rPEndp26nOjgFaWs+RcUhdVgD6ENASs65h712ALdovxI7SGSTrXabQgZ3tzwVB0mUu/F3eXZ80S0CgnkEMTZY3Y/XK2FQFv7Eih4/QZSfo5owdfoyQWBvNGPMKUc8xMEmANZZtFt2F6sZGJiagxjDJ1c79OEGdhW6EkEWWqBN952oSNpZcK7uN0FqEG+yTI18JQhSBGHVe0pxB9BE91LS07kmTeEtWa9QxzU6IQ2VzCAkmFT6ezcl4RYXwTEazz5bnceR0GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6lyZ44VspJlaQ60fUka0Ht3AmSiCGd+bgytxjiodpDs=;
 b=m9huMDB+ROMOYvwSS0wJ6oBcaQnuFRe/8K+Xt4t6aUmc8rNVAIT3wI3YEC2qVJHBJPZuNfrp1dDiE4FHjy9iEBSD9IvK+MLskJRWBYTLtWMffcdTuGGjzNHkMZwTJzZkP4z24zm92sfNUYq50zkNPaLunO3+WzxykkDhgN0Wh3LSs/43mjMYdJ+viE+CjoetRgoqyct2tc1ZeCTj7GpSM95tiHoLYNjAGCAaLjwm/HMpFdkV1PoOBhatgqFp+nq/uCfqa/Pc0DMZZLm/u4p8vhAyZBJLdgCuL1/KK1GuM80o/03ys1SWfg+n054Pqf4FVBvkdFNijaujx4cTOJ4wEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB5245.eurprd08.prod.outlook.com (20.179.30.215) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.27; Thu, 14 Nov 2019 10:04:38 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a809:417a:faf3:61a7]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a809:417a:faf3:61a7%6]) with mapi id 15.20.2451.023; Thu, 14 Nov 2019
 10:04:38 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, Mihail Atanassov
 <Mihail.Atanassov@arm.com>
Subject: =?utf-8?B?W1BBVENIXSBkcm0va29tZWRhOiBDbGVhbiB3YXJuaW5nczogY2FuZGlkYXRl?=
 =?utf-8?B?IGZvciAnZ251X3ByaW50ZuKAmSBmb3JtYXQgYXR0cmlidXRl?=
Thread-Topic: =?utf-8?B?W1BBVENIXSBkcm0va29tZWRhOiBDbGVhbiB3YXJuaW5nczogY2FuZGlkYXRl?=
 =?utf-8?B?IGZvciAnZ251X3ByaW50ZuKAmSBmb3JtYXQgYXR0cmlidXRl?=
Thread-Index: AQHVmtLsTLvLo3Z9SUGqMMXb28Jv4Q==
Date: Thu, 14 Nov 2019 10:04:37 +0000
Message-ID: <20191114100421.30510-1-james.qian.wang@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR0401CA0020.apcprd04.prod.outlook.com
 (2603:1096:202:2::30) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3e53a4fe-f94b-420d-2180-08d768ea142e
X-MS-TrafficTypeDiagnostic: VE1PR08MB5245:|VE1PR08MB5245:|AM6PR08MB4120:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4120454E2E41D29019F9FC14B3710@AM6PR08MB4120.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:3276;OLM:3276;
x-forefront-prvs: 02213C82F8
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(366004)(396003)(39860400002)(376002)(199004)(189003)(71200400001)(478600001)(6486002)(14454004)(305945005)(476003)(486006)(2616005)(86362001)(7736002)(54906003)(256004)(316002)(110136005)(103116003)(4326008)(36756003)(6512007)(6436002)(50226002)(66946007)(66476007)(66556008)(64756008)(66446008)(6116002)(3846002)(2906002)(71190400001)(14444005)(81166006)(25786009)(4744005)(81156014)(5660300002)(386003)(6636002)(8936002)(55236004)(26005)(99286004)(52116002)(1076003)(186003)(66066001)(102836004)(6506007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB5245;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: P+JqnhGtf9bOVbWaubrIs0ZPphlnPZadO6UAra+6MHDiG5N+HZHwnZ+/FtmRxTVEDc1Au4pMUppRhU8KZFwBexqTh29oPzi5bIwC23O4yuO+e4Ojk/w/+IdhojKCqL3DTfkKwTsaP8VdafV3b84OYmCCf5F6yzyiLVmT/RNmyCSnp3IqNv0yp3G9ONB2n9MdUBIk+stHLD69t4XeqANssTmzHCsRhmVnkm8PtEdtfdahZIythkKpNBP97B2Iyj8fZd4ZQbOW68B5gpIlMORFnlNuPy7qJAkROyRjAGaiyXUwHkdradYCOmdH6XhrBHHbkk55Ypgk9TO12Yb7Nr34YwGhhRL/VQ/7oxl2zYaym02xqRgfHHrFhV/usIFubDRLeHJg5ljUf3r2YPR6mJKeHz6GiUeZzeOiUlUM7JIlcW7FY2W1CjOWa4DJK+5If9ZY
Content-ID: <0069856B13181A42882D7609F4000A00@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5245
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(136003)(396003)(39860400002)(1110001)(339900001)(189003)(199004)(8936002)(186003)(2616005)(103116003)(5660300002)(4744005)(22756006)(4326008)(26005)(1076003)(50466002)(6486002)(14444005)(105606002)(76130400001)(70206006)(70586007)(6512007)(356004)(23676004)(2486003)(3846002)(305945005)(6116002)(47776003)(14454004)(25786009)(54906003)(36756003)(26826003)(336012)(476003)(102836004)(386003)(6506007)(81166006)(81156014)(50226002)(36906005)(316002)(7736002)(478600001)(436003)(66066001)(6636002)(2906002)(110136005)(99286004)(126002)(486006)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB4120;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Fail; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 5f3c8d88-0a80-4858-3845-08d768ea0ebc
NoDisclaimer: True
X-Forefront-PRVS: 02213C82F8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Pdm1CbG+3Gd1++gVntGkGJGDxzABuD8oFz4YmQsqv3ir/pLJ/ovrfVpceB1UvqDE+2g6ygNBptuoPidOUSX/hAM7NIhsEzsGZcRkUHMbUREHT9/+yV9rwWFrIuMZ4PS5tPnXE4jxYm2Wb5vc+rwC+peQT9R5o4H9CDZieWW1lSEIDmqAbl/ghPhsA2BTF6a9ogxSiRoTdRdOH5VesEeGvEeUdFuogqR0ZBGjA9DbnsWNRLxaKkNaJA6+EYtIhOGSnDY/1YWPJ9HpJpGzWEUsqbf2yfnISaVdORuHucZiPVigFBLTQQDqgHXhl7fG6TpWlWBVhQMeSSfvOf+d+GkfpCUVxK2rCclNms0YLlgY9cCmdoeBLlqU9hNaiceGysIynEiiptenBT4X99TCT2pdWKaiLmc4PI48V0GFa7BVg+0t5wFQp9w6iB+JRgnw4UkZ
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2019 10:04:46.5777 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e53a4fe-f94b-420d-2180-08d768ea142e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4120
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6lyZ44VspJlaQ60fUka0Ht3AmSiCGd+bgytxjiodpDs=;
 b=i8DPB1GRkp0z9Dqvvv9kGk14KKhGwZ0ySUcc2ofqxY808naljLDoPJRdLL9nEq+mAf5YFn+vaT4dSDh0pP+6MhSoZWjgyrRcu5WUt17KzlPE8+wcGv/H4TWhCrhWp6YXc2prNeMTK10gAqO77JeI8cfAgdKaep73N/kzt5FsDxw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6lyZ44VspJlaQ60fUka0Ht3AmSiCGd+bgytxjiodpDs=;
 b=i8DPB1GRkp0z9Dqvvv9kGk14KKhGwZ0ySUcc2ofqxY808naljLDoPJRdLL9nEq+mAf5YFn+vaT4dSDh0pP+6MhSoZWjgyrRcu5WUt17KzlPE8+wcGv/H4TWhCrhWp6YXc2prNeMTK10gAqO77JeI8cfAgdKaep73N/kzt5FsDxw=
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
Cc: nd <nd@arm.com>, "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>,
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

a29tZWRhL2tvbWVkYV9ldmVudC5jOiBJbiBmdW5jdGlvbiDigJhrb21lZGFfc3ByaW50ZuKAmToN
CmtvbWVkYS9rb21lZGFfZXZlbnQuYzozMToyOiB3YXJuaW5nOiBmdW5jdGlvbiDigJhrb21lZGFf
c3ByaW50ZuKAmSBtaWdodCBiZSBhIGNhbmRpZGF0ZSBmb3Ig4oCYZ251X3ByaW50ZuKAmSBmb3Jt
YXQgYXR0cmlidXRlIFstV3N1Z2dlc3QtYXR0cmlidXRlPWZvcm1hdF0NCiAgbnVtID0gdnNucHJp
bnRmKHN0ci0+c3RyICsgc3RyLT5sZW4sIGZyZWVfc3osIGZtdCwgYXJncyk7DQoNCnYyOiBVcGRh
dGUgdGhlIGNvbW1lbnQgbXNnLg0KDQpTaWduZWQtb2ZmLWJ5OiBqYW1lcyBxaWFuIHdhbmcgKEFy
bSBUZWNobm9sb2d5IENoaW5hKSA8amFtZXMucWlhbi53YW5nQGFybS5jb20+DQotLS0NCiBkcml2
ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9ldmVudC5jIHwgMSArDQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9ldmVudC5jIGIvZHJpdmVycy9ncHUvZHJtL2Fy
bS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZXZlbnQuYw0KaW5kZXggYmYyNjk2ODNmODExLi45Nzdj
MzhkNTE2ZGEgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRh
L2tvbWVkYV9ldmVudC5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRh
L2tvbWVkYV9ldmVudC5jDQpAQCAtMTcsNiArMTcsNyBAQCBzdHJ1Y3Qga29tZWRhX3N0ciB7DQog
DQogLyogcmV0dXJuIDAgb24gc3VjY2VzcywgIDwgMCBvbiBubyBzcGFjZS4NCiAgKi8NCitfX3By
aW50ZigyLCAzKQ0KIHN0YXRpYyBpbnQga29tZWRhX3NwcmludGYoc3RydWN0IGtvbWVkYV9zdHIg
KnN0ciwgY29uc3QgY2hhciAqZm10LCAuLi4pDQogew0KIAl2YV9saXN0IGFyZ3M7DQotLSANCjIu
MjAuMQ0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
