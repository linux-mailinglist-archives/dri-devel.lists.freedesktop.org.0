Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 810FA109EF7
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 14:18:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 845A76E38A;
	Tue, 26 Nov 2019 13:18:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70081.outbound.protection.outlook.com [40.107.7.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB5CB6E3B2
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2019 13:17:07 +0000 (UTC)
Received: from VE1PR08CA0012.eurprd08.prod.outlook.com (2603:10a6:803:104::25)
 by DB6PR0802MB2406.eurprd08.prod.outlook.com (2603:10a6:4:9e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.21; Tue, 26 Nov
 2019 13:17:05 +0000
Received: from DB5EUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::208) by VE1PR08CA0012.outlook.office365.com
 (2603:10a6:803:104::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.16 via Frontend
 Transport; Tue, 26 Nov 2019 13:17:05 +0000
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT015.mail.protection.outlook.com (10.152.20.145) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.17 via Frontend Transport; Tue, 26 Nov 2019 13:17:04 +0000
Received: ("Tessian outbound dbe0f0961e8c:v33");
 Tue, 26 Nov 2019 13:17:04 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: affa3eaeb7309305
X-CR-MTA-TID: 64aa7808
Received: from 053d1c1fc842.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.10.50]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B83F0D2B-6D92-422F-81DA-9412E3644710.1; 
 Tue, 26 Nov 2019 13:16:59 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2050.outbound.protection.outlook.com [104.47.10.50])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 053d1c1fc842.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 26 Nov 2019 13:16:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eBJbLMllsJUEua/SnzJDxeLu1qWbDI/svch0Srx9n2MhztOeZFG33TdvEerhzpyKJELFXFDvxQwR7SHeeAGSN162GE9O0+iU89gvUZy/ChqBB23FLL0dv7D1cizZZWWqkxhMGNfYjokdBJA6NYvOMUgNmHxz1YZIDyxl1X+hz2bN8g0FlQOcx0w/NmcD9+Mnqu9RUOv3w1sEdv2BVmatcFxwofc8+I4Za94N8D5SQZA+7Q55CYNd+wVVifzZzvrVKM7Xs+ZZio/LqclJV934CUSkphgGPsrtTaROMlINW2xM+1dfhzAG1cDL94bwAvCtacKwCA3S/4SZ8EYaVE5PXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P787VNlH7d2aYxO15L1R1Soowsg8PZrcEAWIXJ087W4=;
 b=QY647PFZ15qvI3lyuYvu1oOEJyxkA5IfBK6peEWNqPBM3NxN6/Y6UTw/y0pGVs079GIxZsRe6FBqH6SehhaMVo4i+Y/SPVNGy+me+keKJYjH2Mv1ITWcSZC799Fg32OlQoZgC5vpkR//1eYnMYyKiJBd9KHQJMiW3S6GJ5Aw64XExOIyq3dgO6tZ0xGuIMiyfsplpBOx/nawZAQz2nPeAKgzOKKkIovY+nAkTCm+R0PQSb/I75S7f1DdAfL8AOtfmltArUwI8Vh4KB1IXjK42SlUIkf1wqrJaqixmDGdkbKeq8CgF+yElg1YamUOtCDmXqfnQ8rvtbs2ggHuxS+lYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB4317.eurprd08.prod.outlook.com (20.179.28.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.16; Tue, 26 Nov 2019 13:16:58 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d%3]) with mapi id 15.20.2474.023; Tue, 26 Nov 2019
 13:16:58 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH 30/30] drm/komeda: Use drm_bridge interface for pipe outputs
Thread-Topic: [PATCH 30/30] drm/komeda: Use drm_bridge interface for pipe
 outputs
Thread-Index: AQHVpFu1/dwArMKc0027RihyptTKCg==
Date: Tue, 26 Nov 2019 13:16:27 +0000
Message-ID: <20191126131541.47393-31-mihail.atanassov@arm.com>
References: <20191126131541.47393-1-mihail.atanassov@arm.com>
In-Reply-To: <20191126131541.47393-1-mihail.atanassov@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.55]
x-clientproxiedby: LO2P265CA0453.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::33) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
x-mailer: git-send-email 2.23.0
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5a42e163-5e6d-4577-c0ec-08d77272ee86
X-MS-TrafficTypeDiagnostic: VI1PR08MB4317:|VI1PR08MB4317:|DB6PR0802MB2406:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB6PR0802MB24066A0093ACE8CC60A248288F450@DB6PR0802MB2406.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:124;OLM:124;
x-forefront-prvs: 0233768B38
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(366004)(346002)(376002)(136003)(396003)(189003)(199004)(5640700003)(86362001)(6512007)(71200400001)(2616005)(6486002)(71190400001)(2906002)(4326008)(6916009)(44832011)(446003)(11346002)(54906003)(66946007)(316002)(66446008)(64756008)(66556008)(66476007)(6436002)(6666004)(8936002)(186003)(26005)(5660300002)(102836004)(305945005)(14454004)(25786009)(99286004)(81166006)(50226002)(478600001)(2501003)(7736002)(6116002)(2351001)(76176011)(1076003)(52116002)(66066001)(256004)(5024004)(8676002)(81156014)(6506007)(3846002)(386003)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB4317;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: R5Felx19e0efcHzOKBgG5QUqHNPEFuhTW1e8Q9Si3tvavXXJnSLPHnwelU+27fAl35Wytmmi+nAniZdjT2DezQfMf96fkdHLo2VrU70s4DfXUZ9OwnBGE9WN9dgfBEQ+NWGaJK3bCQVwY4GtpMF8vaAw9GBKavnHw8emR0BvESFAiCOXTHipxz7pPbyLUgvfKQwp2zhRJEPy1PKd7XVOPoCJISHCrrAVvc0Qonf3BGra2/673EqpJ9kc4Bx3jMPSsRAnfv8jAgsN7hoU8f3m/NvCQYyCrOD2P9K3jpTO9yGPTnYNysbJrjKb5nY3/ZaZ9WmUmEmteMYbs6+8PeC9Fo9E9FpK/R1QmhlaWCY3moHtiPcX86CfaIeQWd946Xn88AekoQVR/WOl2pGEpyAQHqGGCJEnK3ZNIfFuglEeZE0uX8yZ5Zemg1oiAkC7I2Ky
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4317
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(346002)(136003)(39860400002)(189003)(199004)(47776003)(99286004)(14454004)(2501003)(22756006)(76130400001)(386003)(6512007)(6666004)(70206006)(356004)(66066001)(70586007)(8676002)(107886003)(81156014)(81166006)(25786009)(5640700003)(2616005)(7736002)(5024004)(1076003)(4326008)(186003)(5660300002)(6486002)(11346002)(26005)(8936002)(8746002)(446003)(106002)(6916009)(54906003)(2351001)(50226002)(76176011)(102836004)(305945005)(3846002)(6116002)(336012)(50466002)(6506007)(26826003)(23756003)(478600001)(2906002)(86362001)(316002)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB6PR0802MB2406;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 3232a280-4c05-4c94-4486-08d77272d837
NoDisclaimer: True
X-Forefront-PRVS: 0233768B38
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G9fayHjuruZcCHSwrJdH7PcrjoXMNIPtl0gGegJJRRvzctbaIBiTG6rzgMYILbi9YnOkOcjSCTu8AtQdVRBWStK9UozgNObmL1mTVp8TRWN6R9EczAUlwr1allqDMhi1q1l5j3a8Dk4G2UBof6C8asNx+qnQdIWHwQqPMhz+FH19PFJMJN11dXnbKaSz3pmM1AIyLI7qjH/M5IKiAmS1hmh0y45D68UYULPDzqkctTy3TC44qPSSDKhvuzfH12AIy0TMZFsLiv0tYqGSh5gCJUiRXja8dpSQFu3dlnQNII/h0An2yXP0jMU9e7JxmJD9VpuKuOxJungR3+XpySFV6S+srTiMyEhsJex0LU8Wr7QNhJafm9R3mQKJs+ezKmfsO0u0UZ+2eoIc4fUbZn4r6/msqZFZAZfr2Ie38bkJMXpSJw9T9BOsbKvIhzzenWHD
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2019 13:17:04.9140 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a42e163-5e6d-4577-c0ec-08d77272ee86
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2406
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P787VNlH7d2aYxO15L1R1Soowsg8PZrcEAWIXJ087W4=;
 b=qSn+6wfZID5ZlCos+n+y4zL8Fzjt419K8lVnbcgCSBOzVxkz5apr8gM9jAR5ZauSQzxPTzXuEAFes+ItMwi8X89QfUk+IxDSqaLRg8KIZ5J77z28nveHhXnMemJ4iXfeJJzJQntkaZSmHnSaXV2WqP6WjzGTRhO66wj7EKvv2Yk=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P787VNlH7d2aYxO15L1R1Soowsg8PZrcEAWIXJ087W4=;
 b=qSn+6wfZID5ZlCos+n+y4zL8Fzjt419K8lVnbcgCSBOzVxkz5apr8gM9jAR5ZauSQzxPTzXuEAFes+ItMwi8X89QfUk+IxDSqaLRg8KIZ5J77z28nveHhXnMemJ4iXfeJJzJQntkaZSmHnSaXV2WqP6WjzGTRhO66wj7EKvv2Yk=
X-Mailman-Original-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
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
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "james qian
 wang \(Arm Technology China\)" <james.qian.wang@arm.com>, nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VG8gc3VwcG9ydCBtb3JlIHRyYW5zbWl0dGVycywgd2UgbmVlZCB0byBhbGxvdyBub24tY29tcG9u
ZW50IGZyYW1ld29yawpicmlkZ2VzIHRvIGJlIGF0dGFjaGVkIHRvIGEgZHVtbXkgZHJtX2VuY29k
ZXIgaW4gb3VyIGRyaXZlci4KCkEvQiB0ZXN0ZWQgZm9yIGVxdWl2YWxlbmNlIGFnYWluc3QgdGRh
OTk4eCwgYW5kIGFsc28gdGVzdGVkIHRpX3RmcDQxMCBhcwphbiBhbHRlcm5hdGUgdHJhbnNtaXR0
ZXIuCgpTaWduZWQtb2ZmLWJ5OiBNaWhhaWwgQXRhbmFzc292IDxtaWhhaWwuYXRhbmFzc292QGFy
bS5jb20+Ci0tLQogLi4uL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kcnYuYyAg
IHwgNTQgKysrKysrLS0tLS0tLQogLi4uL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVk
YV9rbXMuYyAgIHwgNzcgKysrKysrKysrKysrKysrKystLQogLi4uL2dwdS9kcm0vYXJtL2Rpc3Bs
YXkva29tZWRhL2tvbWVkYV9rbXMuaCAgIHwgIDIgKwogMyBmaWxlcyBjaGFuZ2VkLCAxMDAgaW5z
ZXJ0aW9ucygrKSwgMzMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rp
c3BsYXkva29tZWRhL2tvbWVkYV9kcnYuYwppbmRleCBkNmMyMjIyYzVkMzMuLjI4NzAxMjNiZWYz
NyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFf
ZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZHJ2
LmMKQEAgLTYsMTAgKzYsMTAgQEAKICAqLwogI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPgogI2lu
Y2x1ZGUgPGxpbnV4L2tlcm5lbC5oPgorI2luY2x1ZGUgPGxpbnV4L29mX2dyYXBoLmg+CiAjaW5j
bHVkZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+Ci0jaW5jbHVkZSA8bGludXgvY29tcG9uZW50
Lmg+CiAjaW5jbHVkZSA8bGludXgvcG1fcnVudGltZS5oPgotI2luY2x1ZGUgPGRybS9kcm1fb2Yu
aD4KKyNpbmNsdWRlIDxkcm0vZHJtX2JyaWRnZS5oPgogI2luY2x1ZGUgImtvbWVkYV9kZXYuaCIK
ICNpbmNsdWRlICJrb21lZGFfa21zLmgiCiAKQEAgLTcyLDM1ICs3MiwyOSBAQCBzdGF0aWMgaW50
IGtvbWVkYV9iaW5kKHN0cnVjdCBkZXZpY2UgKmRldikKIAlyZXR1cm4gZXJyOwogfQogCi1zdGF0
aWMgY29uc3Qgc3RydWN0IGNvbXBvbmVudF9tYXN0ZXJfb3BzIGtvbWVkYV9tYXN0ZXJfb3BzID0g
ewotCS5iaW5kCT0ga29tZWRhX2JpbmQsCi0JLnVuYmluZAk9IGtvbWVkYV91bmJpbmQsCi19Owot
Ci1zdGF0aWMgaW50IGNvbXBhcmVfb2Yoc3RydWN0IGRldmljZSAqZGV2LCB2b2lkICpkYXRhKQot
ewotCXJldHVybiBkZXYtPm9mX25vZGUgPT0gZGF0YTsKLX0KLQotc3RhdGljIHZvaWQga29tZWRh
X2FkZF9zbGF2ZShzdHJ1Y3QgZGV2aWNlICptYXN0ZXIsCi0JCQkgICAgIHN0cnVjdCBjb21wb25l
bnRfbWF0Y2ggKiptYXRjaCwKLQkJCSAgICAgc3RydWN0IGRldmljZV9ub2RlICpucCwKLQkJCSAg
ICAgdTMyIHBvcnQsIHUzMiBlbmRwb2ludCkKK3N0YXRpYyBpbnQga29tZWRhX2FkZF9zbGF2ZShz
dHJ1Y3QgZGV2aWNlX25vZGUgKm5wLCB1MzIgcG9ydCwgdTMyIGVuZHBvaW50KQogewogCXN0cnVj
dCBkZXZpY2Vfbm9kZSAqcmVtb3RlOworCXN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2U7CisJaW50
IHJldCA9IDA7CiAKIAlyZW1vdGUgPSBvZl9ncmFwaF9nZXRfcmVtb3RlX25vZGUobnAsIHBvcnQs
IGVuZHBvaW50KTsKLQlpZiAocmVtb3RlKSB7Ci0JCWRybV9vZl9jb21wb25lbnRfbWF0Y2hfYWRk
KG1hc3RlciwgbWF0Y2gsIGNvbXBhcmVfb2YsIHJlbW90ZSk7Ci0JCW9mX25vZGVfcHV0KHJlbW90
ZSk7Ci0JfQorCWlmICghcmVtb3RlKQorCQlyZXR1cm4gMDsKKworCWJyaWRnZSA9IG9mX2RybV9m
aW5kX2JyaWRnZShyZW1vdGUpOworCWlmICghYnJpZGdlKQorCQlyZXQgPSAtRVBST0JFX0RFRkVS
OworCisJb2Zfbm9kZV9wdXQocmVtb3RlKTsKKwlyZXR1cm4gcmV0OwogfQogCiBzdGF0aWMgaW50
IGtvbWVkYV9wbGF0Zm9ybV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogewog
CXN0cnVjdCBkZXZpY2UgKmRldiA9ICZwZGV2LT5kZXY7Ci0Jc3RydWN0IGNvbXBvbmVudF9tYXRj
aCAqbWF0Y2ggPSBOVUxMOwogCXN0cnVjdCBkZXZpY2Vfbm9kZSAqY2hpbGQ7CisJaW50IHJldDsK
IAogCWlmICghZGV2LT5vZl9ub2RlKQogCQlyZXR1cm4gLUVOT0RFVjsKQEAgLTEwOSwxNyArMTAz
LDI1IEBAIHN0YXRpYyBpbnQga29tZWRhX3BsYXRmb3JtX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9k
ZXZpY2UgKnBkZXYpCiAJCWlmIChvZl9ub2RlX2NtcChjaGlsZC0+bmFtZSwgInBpcGVsaW5lIikg
IT0gMCkKIAkJCWNvbnRpbnVlOwogCi0JCS8qIGFkZCBjb25uZWN0b3IgKi8KLQkJa29tZWRhX2Fk
ZF9zbGF2ZShkZXYsICZtYXRjaCwgY2hpbGQsIEtPTUVEQV9PRl9QT1JUX09VVFBVVCwgMCk7Ci0J
CWtvbWVkYV9hZGRfc2xhdmUoZGV2LCAmbWF0Y2gsIGNoaWxkLCBLT01FREFfT0ZfUE9SVF9PVVRQ
VVQsIDEpOworCQkvKiBhdHRhY2ggYW55IHJlbW90ZSBkZXZpY2VzIGlmIHByZXNlbnQgKi8KKwkJ
cmV0ID0ga29tZWRhX2FkZF9zbGF2ZShjaGlsZCwgS09NRURBX09GX1BPUlRfT1VUUFVULCAwKTsK
KwkJaWYgKHJldCkgeworCQkJb2Zfbm9kZV9wdXQoY2hpbGQpOworCQkJcmV0dXJuIHJldDsKKwkJ
fQorCQlyZXQgPSBrb21lZGFfYWRkX3NsYXZlKGNoaWxkLCBLT01FREFfT0ZfUE9SVF9PVVRQVVQs
IDEpOworCQlpZiAocmV0KSB7CisJCQlvZl9ub2RlX3B1dChjaGlsZCk7CisJCQlyZXR1cm4gcmV0
OworCQl9CiAJfQogCi0JcmV0dXJuIGNvbXBvbmVudF9tYXN0ZXJfYWRkX3dpdGhfbWF0Y2goZGV2
LCAma29tZWRhX21hc3Rlcl9vcHMsIG1hdGNoKTsKKwlyZXR1cm4ga29tZWRhX2JpbmQoZGV2KTsK
IH0KIAogc3RhdGljIGludCBrb21lZGFfcGxhdGZvcm1fcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9k
ZXZpY2UgKnBkZXYpCiB7Ci0JY29tcG9uZW50X21hc3Rlcl9kZWwoJnBkZXYtPmRldiwgJmtvbWVk
YV9tYXN0ZXJfb3BzKTsKKwlrb21lZGFfdW5iaW5kKCZwZGV2LT5kZXYpOwogCXJldHVybiAwOwog
fQogCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVk
YV9rbXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ttcy5j
CmluZGV4IGUzMGE1YjQzY2FhOS4uMmZjNmNkOTk1NmZkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9rbXMuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9rbXMuYwpAQCAtNCw4ICs0LDggQEAKICAqIEF1
dGhvcjogSmFtZXMuUWlhbi5XYW5nIDxqYW1lcy5xaWFuLndhbmdAYXJtLmNvbT4KICAqCiAgKi8K
LSNpbmNsdWRlIDxsaW51eC9jb21wb25lbnQuaD4KICNpbmNsdWRlIDxsaW51eC9pbnRlcnJ1cHQu
aD4KKyNpbmNsdWRlIDxsaW51eC9vZl9ncmFwaC5oPgogCiAjaW5jbHVkZSA8ZHJtL2RybV9hdG9t
aWMuaD4KICNpbmNsdWRlIDxkcm0vZHJtX2F0b21pY19oZWxwZXIuaD4KQEAgLTE0LDYgKzE0LDkg
QEAKICNpbmNsdWRlIDxkcm0vZHJtX2dlbV9jbWFfaGVscGVyLmg+CiAjaW5jbHVkZSA8ZHJtL2Ry
bV9nZW1fZnJhbWVidWZmZXJfaGVscGVyLmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9pcnEuaD4KKyNp
bmNsdWRlIDxkcm0vZHJtX29mLmg+CisjaW5jbHVkZSA8ZHJtL2RybV9lbmNvZGVyLmg+CisjaW5j
bHVkZSA8ZHJtL2RybV9icmlkZ2UuaD4KICNpbmNsdWRlIDxkcm0vZHJtX3Byb2JlX2hlbHBlci5o
PgogI2luY2x1ZGUgPGRybS9kcm1fdmJsYW5rLmg+CiAKQEAgLTI1Nyw2ICsyNjAsNjkgQEAgc3Rh
dGljIHZvaWQga29tZWRhX2ttc19tb2RlX2NvbmZpZ19pbml0KHN0cnVjdCBrb21lZGFfa21zX2Rl
diAqa21zLAogCWNvbmZpZy0+aGVscGVyX3ByaXZhdGUgPSAma29tZWRhX21vZGVfY29uZmlnX2hl
bHBlcnM7CiB9CiAKK3N0YXRpYyB2b2lkIGtvbWVkYV9lbmNvZGVyX2Rlc3Ryb3koc3RydWN0IGRy
bV9lbmNvZGVyICplbmNvZGVyKQoreworCWRybV9lbmNvZGVyX2NsZWFudXAoZW5jb2Rlcik7Cit9
CisKK3N0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2VuY29kZXJfZnVuY3Mga29tZWRhX2R1bW15X2Vu
Y19mdW5jcyA9IHsKKwkuZGVzdHJveSA9IGtvbWVkYV9lbmNvZGVyX2Rlc3Ryb3ksCit9OworCitz
dGF0aWMgaW50IGtvbWVkYV9lbmNvZGVyX2F0dGFjaF9icmlkZ2Uoc3RydWN0IGtvbWVkYV9kZXYg
Km1kZXYsCisJCQkJCXN0cnVjdCBrb21lZGFfa21zX2RldiAqa21zLAorCQkJCQlzdHJ1Y3QgZHJt
X2VuY29kZXIgKmVuY29kZXIsCisJCQkJCXN0cnVjdCBkZXZpY2Vfbm9kZSAqbnApCit7CisJc3Ry
dWN0IGRldmljZV9ub2RlICpyZW1vdGU7CisJc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZTsKKwl1
MzIgY3J0Y3MgPSAwOworCWludCByZXQgPSAwOworCisJcmVtb3RlID0gb2ZfZ3JhcGhfZ2V0X3Jl
bW90ZV9ub2RlKG5wLCBLT01FREFfT0ZfUE9SVF9PVVRQVVQsIDApOworCWlmICghcmVtb3RlKQor
CQlyZXR1cm4gMDsKKworCWJyaWRnZSA9IG9mX2RybV9maW5kX2JyaWRnZV9kZXZsaW5rKCZrbXMt
PmJhc2UsIHJlbW90ZSk7CisJaWYgKCFicmlkZ2UpIHsKKwkJcmV0ID0gLUVJTlZBTDsKKwkJZ290
byBleGl0OworCX0KKworCWNydGNzID0gZHJtX29mX2ZpbmRfcG9zc2libGVfY3J0Y3MoJmttcy0+
YmFzZSwgcmVtb3RlKTsKKworCWVuY29kZXItPnBvc3NpYmxlX2NydGNzID0gY3J0Y3MgPyBjcnRj
cyA6IDE7CisKKwlyZXQgPSBkcm1fZW5jb2Rlcl9pbml0KCZrbXMtPmJhc2UsIGVuY29kZXIsICZr
b21lZGFfZHVtbXlfZW5jX2Z1bmNzLAorCQkJICAgICAgIERSTV9NT0RFX0VOQ09ERVJfVE1EUywg
TlVMTCk7CisJaWYgKHJldCkKKwkJZ290byBleGl0OworCisJcmV0ID0gZHJtX2JyaWRnZV9hdHRh
Y2goZW5jb2RlciwgYnJpZGdlLCBOVUxMKTsKKwlpZiAocmV0KQorCQlnb3RvIGV4aXQ7CisKK2V4
aXQ6CisJb2Zfbm9kZV9wdXQocmVtb3RlKTsKKwlyZXR1cm4gcmV0OworfQorCitzdGF0aWMgaW50
IGtvbWVkYV9lbmNvZGVyX2F0dGFjaF9icmlkZ2VzKHN0cnVjdCBrb21lZGFfa21zX2RldiAqa21z
LAorCQkJCQkgc3RydWN0IGtvbWVkYV9kZXYgKm1kZXYpCit7CisJaW50IGksIGVycjsKKworCWZv
ciAoaSA9IDA7IGkgPCBrbXMtPm5fY3J0Y3M7IGkrKykgeworCQllcnIgPSBrb21lZGFfZW5jb2Rl
cl9hdHRhY2hfYnJpZGdlKAorCQkJbWRldiwga21zLAorCQkJJmttcy0+ZW5jb2RlcnNbaV0sIG1k
ZXYtPnBpcGVsaW5lc1tpXS0+b2Zfbm9kZSk7CisJCWlmIChlcnIpCisJCQlyZXR1cm4gZXJyOwor
CX0KKworCXJldHVybiAwOworfQorCiBzdHJ1Y3Qga29tZWRhX2ttc19kZXYgKmtvbWVkYV9rbXNf
YXR0YWNoKHN0cnVjdCBrb21lZGFfZGV2ICptZGV2KQogewogCXN0cnVjdCBrb21lZGFfa21zX2Rl
diAqa21zID0ga3phbGxvYyhzaXplb2YoKmttcyksIEdGUF9LRVJORUwpOwpAQCAtMjk1LDcgKzM2
MSw3IEBAIHN0cnVjdCBrb21lZGFfa21zX2RldiAqa29tZWRhX2ttc19hdHRhY2goc3RydWN0IGtv
bWVkYV9kZXYgKm1kZXYpCiAJaWYgKGVycikKIAkJZ290byBjbGVhbnVwX21vZGVfY29uZmlnOwog
Ci0JZXJyID0gY29tcG9uZW50X2JpbmRfYWxsKG1kZXYtPmRldiwga21zKTsKKwllcnIgPSBrb21l
ZGFfZW5jb2Rlcl9hdHRhY2hfYnJpZGdlcyhrbXMsIG1kZXYpOwogCWlmIChlcnIpCiAJCWdvdG8g
Y2xlYW51cF9tb2RlX2NvbmZpZzsKIApAQCAtMzA1LDExICszNzEsMTEgQEAgc3RydWN0IGtvbWVk
YV9rbXNfZGV2ICprb21lZGFfa21zX2F0dGFjaChzdHJ1Y3Qga29tZWRhX2RldiAqbWRldikKIAkJ
CSAgICAgICBrb21lZGFfa21zX2lycV9oYW5kbGVyLCBJUlFGX1NIQVJFRCwKIAkJCSAgICAgICBk
cm0tPmRyaXZlci0+bmFtZSwgZHJtKTsKIAlpZiAoZXJyKQotCQlnb3RvIGZyZWVfY29tcG9uZW50
X2JpbmRpbmc7CisJCWdvdG8gY2xlYW51cF9tb2RlX2NvbmZpZzsKIAogCWVyciA9IG1kZXYtPmZ1
bmNzLT5lbmFibGVfaXJxKG1kZXYpOwogCWlmIChlcnIpCi0JCWdvdG8gZnJlZV9jb21wb25lbnRf
YmluZGluZzsKKwkJZ290byBjbGVhbnVwX21vZGVfY29uZmlnOwogCiAJZHJtLT5pcnFfZW5hYmxl
ZCA9IHRydWU7CiAKQEAgLTMyNSw4ICszOTEsNiBAQCBzdHJ1Y3Qga29tZWRhX2ttc19kZXYgKmtv
bWVkYV9rbXNfYXR0YWNoKHN0cnVjdCBrb21lZGFfZGV2ICptZGV2KQogCWRybV9rbXNfaGVscGVy
X3BvbGxfZmluaShkcm0pOwogCWRybS0+aXJxX2VuYWJsZWQgPSBmYWxzZTsKIAltZGV2LT5mdW5j
cy0+ZGlzYWJsZV9pcnEobWRldik7Ci1mcmVlX2NvbXBvbmVudF9iaW5kaW5nOgotCWNvbXBvbmVu
dF91bmJpbmRfYWxsKG1kZXYtPmRldiwgZHJtKTsKIGNsZWFudXBfbW9kZV9jb25maWc6CiAJZHJt
X21vZGVfY29uZmlnX2NsZWFudXAoZHJtKTsKIAlrb21lZGFfa21zX2NsZWFudXBfcHJpdmF0ZV9v
YmpzKGttcyk7CkBAIC0zNDcsNyArNDExLDYgQEAgdm9pZCBrb21lZGFfa21zX2RldGFjaChzdHJ1
Y3Qga29tZWRhX2ttc19kZXYgKmttcykKIAlkcm1fYXRvbWljX2hlbHBlcl9zaHV0ZG93bihkcm0p
OwogCWRybS0+aXJxX2VuYWJsZWQgPSBmYWxzZTsKIAltZGV2LT5mdW5jcy0+ZGlzYWJsZV9pcnEo
bWRldik7Ci0JY29tcG9uZW50X3VuYmluZF9hbGwobWRldi0+ZGV2LCBkcm0pOwogCWRybV9tb2Rl
X2NvbmZpZ19jbGVhbnVwKGRybSk7CiAJa29tZWRhX2ttc19jbGVhbnVwX3ByaXZhdGVfb2Jqcyhr
bXMpOwogCWRybS0+ZGV2X3ByaXZhdGUgPSBOVUxMOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfa21zLmggYi9kcml2ZXJzL2dwdS9kcm0vYXJt
L2Rpc3BsYXkva29tZWRhL2tvbWVkYV9rbXMuaAppbmRleCA0NTZmM2M0MzU3MTkuLmI0MGJhMGY0
NzZiMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21l
ZGFfa21zLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFf
a21zLmgKQEAgLTEyLDYgKzEyLDcgQEAKICNpbmNsdWRlIDxkcm0vZHJtX2F0b21pY19oZWxwZXIu
aD4KICNpbmNsdWRlIDxkcm0vZHJtX2NydGNfaGVscGVyLmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9k
ZXZpY2UuaD4KKyNpbmNsdWRlIDxkcm0vZHJtX2VuY29kZXIuaD4KICNpbmNsdWRlIDxkcm0vZHJt
X3dyaXRlYmFjay5oPgogI2luY2x1ZGUgPGRybS9kcm1fcHJpbnQuaD4KIApAQCAtMTIzLDYgKzEy
NCw3IEBAIHN0cnVjdCBrb21lZGFfa21zX2RldiB7CiAJaW50IG5fY3J0Y3M7CiAJLyoqIEBjcnRj
czogY3J0Y3MgbGlzdCAqLwogCXN0cnVjdCBrb21lZGFfY3J0YyBjcnRjc1tLT01FREFfTUFYX1BJ
UEVMSU5FU107CisJc3RydWN0IGRybV9lbmNvZGVyIGVuY29kZXJzW0tPTUVEQV9NQVhfUElQRUxJ
TkVTXTsKIH07CiAKICNkZWZpbmUgdG9fa3BsYW5lKHApCWNvbnRhaW5lcl9vZihwLCBzdHJ1Y3Qg
a29tZWRhX3BsYW5lLCBiYXNlKQotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
