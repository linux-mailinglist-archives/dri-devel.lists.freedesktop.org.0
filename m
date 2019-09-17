Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F32B50F6
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2019 17:05:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAD776ECC7;
	Tue, 17 Sep 2019 15:05:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on060d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe1e::60d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B48E6ECC7
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2019 15:05:30 +0000 (UTC)
Received: from VE1PR08CA0017.eurprd08.prod.outlook.com (2603:10a6:803:104::30)
 by DB8PR08MB3977.eurprd08.prod.outlook.com (2603:10a6:10:ad::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2263.17; Tue, 17 Sep
 2019 15:05:25 +0000
Received: from DB5EUR03FT053.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::203) by VE1PR08CA0017.outlook.office365.com
 (2603:10a6:803:104::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2263.16 via Frontend
 Transport; Tue, 17 Sep 2019 15:05:24 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT053.mail.protection.outlook.com (10.152.21.119) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.14 via Frontend Transport; Tue, 17 Sep 2019 15:05:23 +0000
Received: ("Tessian outbound 968ab6b62146:v31");
 Tue, 17 Sep 2019 15:05:18 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 605c4ed9ea2b9c5e
X-CR-MTA-TID: 64aa7808
Received: from 00f66f62f898.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.0.53]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 77454D2F-25C9-46C5-BE17-7F5D27DF74E4.1; 
 Tue, 17 Sep 2019 15:05:13 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2053.outbound.protection.outlook.com [104.47.0.53])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 00f66f62f898.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 17 Sep 2019 15:05:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UbR17fV/c8knnTGUNym2d+dVeJhcyCagQdg2eYrCIIQ9KK3vhPt1FcCIequvlQGS8dibEfzkzqheSWFpiVav5cXR3iHbe5VuVxLDTRsjch5/duiG015/HM9u2PvFvgQqGJikNS1djVXJoSez2H3h5bmCbJsRrPz0fGY3T221yYO/xIuQCICyPU+KW0OUJ/jMUsB+nb6Bv7On/k94nL9P3iZzxqoa9n+MMQiz8OACOp21HSUIKEo+qx9S6RnVF1w958Aflkruxi6PGuvzJWzPlyIs3GkGlmb28Jk+QscwgOM43AOgVAqiyYgCCySCkMjqJ3/IMRKm24Rsv8zPDHgI2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oP9iFk7RX6CHTWY3hcW0MLMGf4HZxKv5hIJghkf5lb0=;
 b=hqIEawCAkC3gWl1OCW2mlq5AMvmW3wqzGUjnQMEg5KtZJSghIEn8gaM5RRmnBFMPwYqZgg4a7ic6r7ukbHBp0RX4K1rU4+Qc0F8uaIkkjSGh3SjK17+LKFWOsgB+1RvKch9OAp2pJM0G0QQwakb6K2qVShb7gOzxqjKn0qYQ7tPGTz9oixRG7ocOmdn+0rZC1P5DZ+/VT07i+uzZTDFKqM/Nmik4Jm52jLetik3zPn2c1KCF6t8n7JHGJ5wJiGnaiJcOHPXu1vGPueVqqthToCuUedXKsvT6nK24BzaZ6n0GYuxwFiUtVRsSJxDboIHqJpOvzEBszklTdCoFM6ElbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB3247.eurprd08.prod.outlook.com (52.134.30.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.21; Tue, 17 Sep 2019 15:05:09 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::f164:4d79:79f:dc6f]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::f164:4d79:79f:dc6f%7]) with mapi id 15.20.2263.023; Tue, 17 Sep 2019
 15:05:09 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/komeda: Remove in-code use of ifdef
Thread-Topic: [PATCH] drm/komeda: Remove in-code use of ifdef
Thread-Index: AQHVbWlL0OWI56HteESDsGRUxRcZfQ==
Date: Tue, 17 Sep 2019 15:05:08 +0000
Message-ID: <20190917150314.20892-1-mihail.atanassov@arm.com>
References: <CAKMK7uECMr46Ag8E=eqTKdZxgt_4M42t7GEyNGv0gxpv-TL3Pg@mail.gmail.com>
In-Reply-To: <CAKMK7uECMr46Ag8E=eqTKdZxgt_4M42t7GEyNGv0gxpv-TL3Pg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.55]
x-clientproxiedby: LO2P265CA0194.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::14) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
x-mailer: git-send-email 2.23.0
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: c35eb4f7-032d-4cab-7b41-08d73b8076e9
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:VI1PR08MB3247; 
X-MS-TrafficTypeDiagnostic: VI1PR08MB3247:|VI1PR08MB3247:|DB8PR08MB3977:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB8PR08MB39770BB76FFB0A1F8050ED208F8F0@DB8PR08MB3977.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:3173;OLM:3173;
x-forefront-prvs: 01630974C0
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(39860400002)(346002)(136003)(366004)(189003)(199004)(71190400001)(52116002)(6512007)(2616005)(25786009)(476003)(86362001)(66066001)(81156014)(11346002)(102836004)(316002)(26005)(66556008)(64756008)(66446008)(6436002)(6486002)(446003)(54906003)(50226002)(8936002)(6916009)(81166006)(2906002)(66476007)(6116002)(3846002)(4326008)(99286004)(7736002)(256004)(305945005)(36756003)(186003)(5660300002)(6506007)(66946007)(386003)(76176011)(8676002)(478600001)(71200400001)(14454004)(486006)(44832011)(1076003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3247;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: 71zfecJ59+DfTVyD06TL1uQ+MlxnmDli6F+/uBIpKGmmWx1SDP4NtVXFv2MHl4nVhFkdOT5dQNAVbbikpkIceWBtMTb5jIh8yNtbUyPkXDKlqqzYZL2o62hDtEPpORHFfnVPxhw+Asz7XbaFhK9F0l2PM5rvmUrsV2oCiSKkW9B/amj5nvdQNVanbAR385swpy7dpOefBoMax9VO4gT5LqTSfFKM5AhBZDXqjJrPbEyCyYrZzB0R9g0Ug6wPAlM6fY+vPl7zxweBv65PD350IM6wV3kFkHT8RZcHX70hAqfr4Xsg+epdoZG4kX6ENrlfsPeBz/uCEhsYGVk1FfVOK+aFLVT2OGVAHVDAaOsL+TxgL/Z/tWMnxkggBN6AGp0GaGJ0Tc8A224srVD/1HXfuaUUYR5c1BTCnFv7fZaMHLU=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3247
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(136003)(376002)(396003)(189003)(199004)(6486002)(50226002)(107886003)(2906002)(81166006)(99286004)(22756006)(478600001)(70586007)(70206006)(26005)(8676002)(6506007)(386003)(25786009)(81156014)(316002)(7736002)(356004)(6862004)(76130400001)(63350400001)(305945005)(86362001)(8746002)(102836004)(26826003)(2616005)(446003)(11346002)(1076003)(5660300002)(36756003)(336012)(66066001)(76176011)(6512007)(486006)(476003)(126002)(6116002)(3846002)(50466002)(23756003)(4326008)(8936002)(186003)(14454004)(54906003)(47776003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB8PR08MB3977;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: af7ce52e-666b-44c6-c4c6-08d73b806e0e
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(710020)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DB8PR08MB3977; 
NoDisclaimer: True
X-Forefront-PRVS: 01630974C0
X-Microsoft-Antispam-Message-Info: oQUCrXjY8RlEq09mdKnY/CN7VMVm690Rmnb5+qcjC8llJMZXzGjYtn+xeEpWvknplej2aT9cdW+J3XvpNhlLgGZLC0RsVRWMIOWRxPd9cgWs1u2tuIVoZ01nj8HfwkcBqLwA15KgvVAlrovXSMET7lZMCkicKdl00t/WYq/cMZAyLYOsIfb+TU708HkAMKG89l68u5FqP/wzPZ/Ip/0Vlrwh8nhGz1ZrYt0hi3Iu46Doh9gubLogj/dx8ulCVVu+AfEK/aNvOnOYGo9v5acBBF3Js0Vz/8oGaDUUJ2UVf2w3G3hL4ky6+7A/+YYsYD+BvOuVn5unQ/lOMU1tWoxHVg7Eb6Q0KtKGmhSHK6RRKp6GUDv1WxMbOBOOKf6ZwmJVbryp7YX7oItdxIwv2wsXepllVH9SHeV5bD14QOiQu6c=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2019 15:05:23.2539 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c35eb4f7-032d-4cab-7b41-08d73b8076e9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB3977
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oP9iFk7RX6CHTWY3hcW0MLMGf4HZxKv5hIJghkf5lb0=;
 b=lO5mfUjMENiAVpZYKYVDkKlhMctE//6G/Mwl4SG7l+yUDh4lLW6D3XkPzCSV/jQ2xgGZEAXCEmgReUvswyG7Ni5aq0Yt77lpYPaSU8KvMGg8kjmz1Nx4JuE60k9k56d8bFuxY+o2fE/+sgcUjZY2pZgZgtoqPMKsrZmIJdmJc0Q=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oP9iFk7RX6CHTWY3hcW0MLMGf4HZxKv5hIJghkf5lb0=;
 b=lO5mfUjMENiAVpZYKYVDkKlhMctE//6G/Mwl4SG7l+yUDh4lLW6D3XkPzCSV/jQ2xgGZEAXCEmgReUvswyG7Ni5aq0Yt77lpYPaSU8KvMGg8kjmz1Nx4JuE60k9k56d8bFuxY+o2fE/+sgcUjZY2pZgZgtoqPMKsrZmIJdmJc0Q=
X-Mailman-Original-Authentication-Results: spf=temperror (sender IP is
 63.35.35.123)
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
 "airlied@linux.ie" <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>,
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>, "Lowry Li \(Arm Technology
 China\)" <Lowry.Li@arm.com>, Mihail Atanassov <Mihail.Atanassov@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UHJvdmlkZSBhIGR1bW15IHN0YXRpYyBpbmxpbmUgZnVuY3Rpb24gaW4gdGhlIGhlYWRlciBpbnN0
ZWFkLgoKQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IExvd3J5IExpIChB
cm0gVGVjaG5vbG9neSBDaGluYSkgPExvd3J5LkxpQGFybS5jb20+CkNjOiBqYW1lcyBxaWFuIHdh
bmcgKEFybSBUZWNobm9sb2d5IENoaW5hKSA8amFtZXMucWlhbi53YW5nQGFybS5jb20+CkZpeGVz
OiA0ZDc0YjI1ZWUzOTUgKCJkcm0va29tZWRhOiBBZGRzIGVycm9yIGV2ZW50IHByaW50IGZ1bmN0
aW9uYWxpdHkiKQpTaWduZWQtb2ZmLWJ5OiBNaWhhaWwgQXRhbmFzc292IDxtaWhhaWwuYXRhbmFz
c292QGFybS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21l
ZGFfZGV2LmggfCAyICsrCiBkcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVk
YV9rbXMuYyB8IDIgLS0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEv
a29tZWRhX2Rldi5oIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFf
ZGV2LmgKaW5kZXggZTI4ZTdlNjU2M2FiLi44YWNmOGMwNjAxY2MgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rldi5oCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rldi5oCkBAIC0yMjAsNiArMjIwLDgg
QEAgc3RydWN0IGtvbWVkYV9kZXYgKmRldl90b19tZGV2KHN0cnVjdCBkZXZpY2UgKmRldik7CiAK
ICNpZmRlZiBDT05GSUdfRFJNX0tPTUVEQV9FUlJPUl9QUklOVAogdm9pZCBrb21lZGFfcHJpbnRf
ZXZlbnRzKHN0cnVjdCBrb21lZGFfZXZlbnRzICpldnRzKTsKKyNlbHNlCitzdGF0aWMgaW5saW5l
IHZvaWQga29tZWRhX3ByaW50X2V2ZW50cyhzdHJ1Y3Qga29tZWRhX2V2ZW50cyAqZXZ0cykge30K
ICNlbmRpZgogCiAjZW5kaWYgLypfS09NRURBX0RFVl9IXyovCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9rbXMuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ttcy5jCmluZGV4IDE4ZDdlMjUyMDIyNS4uZGM4
NWMwOGU2MTRkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRh
L2tvbWVkYV9rbXMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tv
bWVkYV9rbXMuYwpAQCAtNDcsOSArNDcsNyBAQCBzdGF0aWMgaXJxcmV0dXJuX3Qga29tZWRhX2tt
c19pcnFfaGFuZGxlcihpbnQgaXJxLCB2b2lkICpkYXRhKQogCW1lbXNldCgmZXZ0cywgMCwgc2l6
ZW9mKGV2dHMpKTsKIAlzdGF0dXMgPSBtZGV2LT5mdW5jcy0+aXJxX2hhbmRsZXIobWRldiwgJmV2
dHMpOwogCi0jaWZkZWYgQ09ORklHX0RSTV9LT01FREFfRVJST1JfUFJJTlQKIAlrb21lZGFfcHJp
bnRfZXZlbnRzKCZldnRzKTsKLSNlbmRpZgogCiAJLyogTm90aWZ5IHRoZSBjcnRjIHRvIGhhbmRs
ZSB0aGUgZXZlbnRzICovCiAJZm9yIChpID0gMDsgaSA8IGttcy0+bl9jcnRjczsgaSsrKQotLSAK
Mi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
