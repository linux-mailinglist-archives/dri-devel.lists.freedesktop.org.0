Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B40103977
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 13:04:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6043C6E413;
	Wed, 20 Nov 2019 12:04:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02on0619.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe06::619])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B93526E413
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 12:04:07 +0000 (UTC)
Received: from VI1PR08CA0184.eurprd08.prod.outlook.com (2603:10a6:800:d2::14)
 by DBBPR08MB4744.eurprd08.prod.outlook.com (2603:10a6:10:f6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.26; Wed, 20 Nov
 2019 12:04:04 +0000
Received: from DB5EUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::203) by VI1PR08CA0184.outlook.office365.com
 (2603:10a6:800:d2::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.16 via Frontend
 Transport; Wed, 20 Nov 2019 12:04:04 +0000
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT028.mail.protection.outlook.com (10.152.20.99) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.17 via Frontend Transport; Wed, 20 Nov 2019 12:04:03 +0000
Received: ("Tessian outbound a8f166c1f585:v33");
 Wed, 20 Nov 2019 12:04:03 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 08fafed8e21ca22e
X-CR-MTA-TID: 64aa7808
Received: from 3adacec40614.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.10.53]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DB86F84F-B9B3-45B9-AFDC-0F98D215173C.1; 
 Wed, 20 Nov 2019 12:03:58 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2053.outbound.protection.outlook.com [104.47.10.53])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3adacec40614.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 20 Nov 2019 12:03:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QpCdEg3fP90zhSGuYuHeVTlrOw4DNg+hc+Cid/VbIadPOzJeb1OYaL2SU5h/TBVTCS9oaZLhyRbBwmh1jW26PlYDgSRCdtIbU3deVoFhYD3JA2hoe3UN2dnNewitWkRRbve7D1B2gxDEGpKG0MEsQfklYr+Z1GUZrcg+TeybAWKwf3dAYbYQ280ME6rnzjsevlGkSfLBjCBjncgaPMxjekGYyOlIl7TgS7m4b55/f7BJjmiZrlT1YYwaRXfrdeYDSwB6IvKEBUcBnsE3diSHxMGzllU1/COk2xLI/8Unl155t7vXo7EMMhkE3l9a25h+oBaW+gxu2s01RmLOAXO/2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TWgIEX2PHt+Q5+g5bQHryf+220ZL3KKgfgZbuq/dHBY=;
 b=CwvjGdBPPoJe2pLxJfvtIdjwCapcGOq2jb8eoH52jt2saFTyfqRvmL2esk/VwR5IdbSyhdX6qEjLPzxKt8s6c93qLm60KnBBS+g6AIzrraPAy0o6dGJcX5p7oQDM2fbyCpxSpGDiTWSKu8rm4zSljIfO43xdebOB+Vn9aIXJ9nwQ4+vzrzNZDZU/hzcFOKwx1JdaEieqcWXhc7RdcP15gf5PfpPyz7Ia2yMfSetwcYRzoW+wa4DgNV9gUjjM0Od7jt9Sqr8LoVGazotplGdMO05bfQab1UuoVmLrLSCQt+ZQ0iyz4UhKSVZOi7yWDxzZBKWkRnFcqqSmmRXc0J7ByA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB3871.eurprd08.prod.outlook.com (20.178.13.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.17; Wed, 20 Nov 2019 12:03:55 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d%3]) with mapi id 15.20.2451.031; Wed, 20 Nov 2019
 12:03:55 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/komeda: Remove unnecessary komeda_wb_connector_detect
Thread-Topic: [PATCH] drm/komeda: Remove unnecessary komeda_wb_connector_detect
Thread-Index: AQHVn5qV+pWuZV5Y1kWI3ajbAtzdnA==
Date: Wed, 20 Nov 2019 12:03:55 +0000
Message-ID: <20191120120348.37340-1-mihail.atanassov@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.55]
x-clientproxiedby: LNXP123CA0024.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::36) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
x-mailer: git-send-email 2.23.0
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 03b5e9d3-71ad-4614-0748-08d76db1bcc8
X-MS-TrafficTypeDiagnostic: VI1PR08MB3871:|VI1PR08MB3871:|DBBPR08MB4744:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DBBPR08MB4744E4A47974A404B06E0F6A8F4F0@DBBPR08MB4744.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:139;OLM:139;
x-forefront-prvs: 02272225C5
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(346002)(39860400002)(376002)(366004)(189003)(199004)(6436002)(6486002)(81166006)(102836004)(6506007)(8936002)(8676002)(81156014)(2351001)(2906002)(186003)(5640700003)(1076003)(14454004)(54906003)(6512007)(2501003)(478600001)(26005)(316002)(386003)(99286004)(2616005)(6916009)(66066001)(486006)(36756003)(66556008)(66446008)(50226002)(476003)(4326008)(25786009)(66476007)(66946007)(64756008)(71200400001)(256004)(14444005)(86362001)(71190400001)(5660300002)(305945005)(7736002)(3846002)(6116002)(44832011)(52116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3871;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: K7syOcYj4MRY06vDicNeTzymqa39FVoGMEPATGD9k5Ytroyz63jSdOt44/maK4Ypbho1A//GmC4dsOridZzPZumjhW+/iNUJOtMkQiD8HRZCLx5tOreru7b0g6R30goU2sWcu8NCwsVBO1k7RNsOtsE+brpquXU9KaNbXARRfUjAeCrWJ3j9Qhhan6yiIQdIeyRtmMMbLGMyiItLR0fLMLIDg3Yl91LzQAaUBovYCSQ8sslFmyiZsohKsuqztJkIq31RuJgcRdDxRYdgCa4RSB6SNM8AnY6O/t/D4zjRUkvMnsfml+gpZzDz3oaGW2YUZydyIMMsIRx299lsS69YMvYQ4pL1GLed2/6+dKGq87WpmJaU6GSzH3Wxh/A+0dSf4/YX9t9I96qqW4uo7Si4F1kH02iRoF/Zfijut5up1UZKrKf9n8ronfa4+l9p6f5F
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3871
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(346002)(396003)(376002)(1110001)(339900001)(199004)(189003)(99286004)(356004)(2501003)(8676002)(50226002)(76130400001)(14454004)(66066001)(4326008)(23756003)(81156014)(8746002)(1076003)(81166006)(5660300002)(102836004)(26826003)(478600001)(2351001)(54906003)(3846002)(186003)(6116002)(6512007)(105606002)(26005)(386003)(6506007)(486006)(70206006)(2616005)(36756003)(25786009)(8936002)(86362001)(336012)(22756006)(476003)(6486002)(47776003)(5640700003)(50466002)(305945005)(126002)(7736002)(2906002)(316002)(107886003)(14444005)(6916009)(70586007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DBBPR08MB4744;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Fail; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: fcce571c-e4ca-40ae-194d-08d76db1b7b8
NoDisclaimer: True
X-Forefront-PRVS: 02272225C5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qzZdqqDzIEn6MkA/XTr2RHKg2zYSzX2zNfinW1OuuS3JPPcIPzF1JcSXn1/J3Htz1+Eay9DMb25Qfd5c8R7mhwkdPldSoMVpotS3FM3dGSycTUzxiKMCd4lKcFnzL4Nd7Q85sgpShZ9kCNhYT9lypOJnf4XDozkIOeFxkb2WO2rWdpyB+r0mjPomIfkqQReo4tx0XalS2C1X6ZOxlh60FmJGS/5CtrTBGlYi/wmx3rLKRoex+MzyrOafoeg+4Ihr5FRV4xSMAKBO6onfamJlVslNLCg8p8L1cayIns9Z7KmOBcC1Ez44fEy40jqAH8kOzAAdWQLeQFbs7ql2o+8LjHGgo/RBh8Vk5dWsgCeq7SlUXqUPxNhQpI92l5wkEBe3zhIiTLusUmBaCX8x/3/embeQ1O/DMW7vzjCRxZqcajJu/8geHB7HEJ9qlQe/lU8s
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2019 12:04:03.9548 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 03b5e9d3-71ad-4614-0748-08d76db1bcc8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4744
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TWgIEX2PHt+Q5+g5bQHryf+220ZL3KKgfgZbuq/dHBY=;
 b=syEHckz5/iLfc5y6l69NRckrZWnyy9LoZD1JfjRfx7i/3gf4RDnCfwotYL53/2hJ1fUwiT0uUUsK2cji2gp2aoK3KSYg38WtpOePzeDh81+PQTLgUk20j7v+lckxpmKE9fWcstYdbTY1RUhXQmSEoT9W5L0kWCkNEJfX7PsAVxo=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TWgIEX2PHt+Q5+g5bQHryf+220ZL3KKgfgZbuq/dHBY=;
 b=syEHckz5/iLfc5y6l69NRckrZWnyy9LoZD1JfjRfx7i/3gf4RDnCfwotYL53/2hJ1fUwiT0uUUsK2cji2gp2aoK3KSYg38WtpOePzeDh81+PQTLgUk20j7v+lckxpmKE9fWcstYdbTY1RUhXQmSEoT9W5L0kWCkNEJfX7PsAVxo=
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
 "james qian wang \(Arm
 Technology China\)" <james.qian.wang@arm.com>, nd <nd@arm.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGZ1bmMgaXMgb3B0aW9uYWwgYW5kIHRoZSBjb25uZWN0b3Igd2lsbCByZXBvcnQgYXMgYWx3
YXlzIGNvbm5lY3RlZCwKaS5lLiBubyBjaGFuZ2UgaW4gYmVoYXZpb3VyLgoKU2lnbmVkLW9mZi1i
eTogTWloYWlsIEF0YW5hc3NvdiA8bWloYWlsLmF0YW5hc3NvdkBhcm0uY29tPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3diX2Nvbm5lY3Rvci5jIHwgNyAt
LS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV93Yl9jb25uZWN0b3IuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3diX2Nvbm5lY3Rvci5jCmlu
ZGV4IGU0NjVjYzQ4NzljOS4uYzg5ZWNkYmE4YzI4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV93Yl9jb25uZWN0b3IuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV93Yl9jb25uZWN0b3IuYwpAQCAtMTA3
LDEyICsxMDcsNiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9jb25uZWN0b3JfaGVscGVyX2Z1
bmNzIGtvbWVkYV93Yl9jb25uX2hlbHBlcl9mdW5jcyA9IHsKIAkubW9kZV92YWxpZAk9IGtvbWVk
YV93Yl9jb25uZWN0b3JfbW9kZV92YWxpZCwKIH07CiAKLXN0YXRpYyBlbnVtIGRybV9jb25uZWN0
b3Jfc3RhdHVzCi1rb21lZGFfd2JfY29ubmVjdG9yX2RldGVjdChzdHJ1Y3QgZHJtX2Nvbm5lY3Rv
ciAqY29ubmVjdG9yLCBib29sIGZvcmNlKQotewotCXJldHVybiBjb25uZWN0b3Jfc3RhdHVzX2Nv
bm5lY3RlZDsKLX0KLQogc3RhdGljIGludAoga29tZWRhX3diX2Nvbm5lY3Rvcl9maWxsX21vZGVz
KHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IsCiAJCQkgICAgICAgdWludDMyX3QgbWF4
WCwgdWludDMyX3QgbWF4WSkKQEAgLTEyOCw3ICsxMjIsNiBAQCBzdGF0aWMgdm9pZCBrb21lZGFf
d2JfY29ubmVjdG9yX2Rlc3Ryb3koc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcikKIAog
c3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fY29ubmVjdG9yX2Z1bmNzIGtvbWVkYV93Yl9jb25uZWN0
b3JfZnVuY3MgPSB7CiAJLnJlc2V0CQkJPSBkcm1fYXRvbWljX2hlbHBlcl9jb25uZWN0b3JfcmVz
ZXQsCi0JLmRldGVjdAkJCT0ga29tZWRhX3diX2Nvbm5lY3Rvcl9kZXRlY3QsCiAJLmZpbGxfbW9k
ZXMJCT0ga29tZWRhX3diX2Nvbm5lY3Rvcl9maWxsX21vZGVzLAogCS5kZXN0cm95CQk9IGtvbWVk
YV93Yl9jb25uZWN0b3JfZGVzdHJveSwKIAkuYXRvbWljX2R1cGxpY2F0ZV9zdGF0ZQk9IGRybV9h
dG9taWNfaGVscGVyX2Nvbm5lY3Rvcl9kdXBsaWNhdGVfc3RhdGUsCi0tIAoyLjIzLjAKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
