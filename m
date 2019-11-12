Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17755F8DA6
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 12:10:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9BB36E22A;
	Tue, 12 Nov 2019 11:10:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80041.outbound.protection.outlook.com [40.107.8.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A79A96E22A
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 11:10:13 +0000 (UTC)
Received: from VI1PR08CA0197.eurprd08.prod.outlook.com (2603:10a6:800:d2::27)
 by VE1PR08MB4912.eurprd08.prod.outlook.com (2603:10a6:802:a9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2430.24; Tue, 12 Nov
 2019 11:10:11 +0000
Received: from VE1EUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::206) by VI1PR08CA0197.outlook.office365.com
 (2603:10a6:800:d2::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2430.23 via Frontend
 Transport; Tue, 12 Nov 2019 11:10:11 +0000
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT043.mail.protection.outlook.com (10.152.19.122) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2430.21 via Frontend Transport; Tue, 12 Nov 2019 11:10:11 +0000
Received: ("Tessian outbound 851a1162fca7:v33");
 Tue, 12 Nov 2019 11:10:07 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8c1b62e43d8bdea4
X-CR-MTA-TID: 64aa7808
Received: from 4b70c4a1f660.1 (cr-mta-lb-1.cr-mta-net [104.47.6.54])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 71930C17-C8E2-4B5B-8258-16B6696CBCBB.1; 
 Tue, 12 Nov 2019 11:10:01 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2054.outbound.protection.outlook.com [104.47.6.54])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4b70c4a1f660.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Tue, 12 Nov 2019 11:10:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AzosQRvGR0ujEQlIIoyKrrUK5Gz96sfNZttRoq6xfKGSSNaMaCVtBlDaVkSMbCmwYkDGetkMDnyPORsUVQhbQpnzfaU+9Kg8KSr2jYd+25ng0yNGHXWgfaAJgaZX7S6CIf7MahxxPSr+xOcEIWbmN3u5Q91qUwqRC+xO23v5AusjeIIV3ktR8KeJUfvxr/f82iL1C/IvLfD5+bM8lNNiQuaUEJqGIIqHj1dLepVBZmjC8EsIaH7ihJUhCaomE8Y27AlaRAGQjy17oqNWFvpMkQd4DWACAKPphJxnBhISrP417BpuvgJdIpO38ibtBgnQtbZKYBCl1sY0g06oBDnUIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4cVA01VPTm34igIPoloOoMRrAW1GGU6jFUdYSaPiuuk=;
 b=hY3CzOq7RXygXd7jfDlrzAeu/Jg+eko4WDS3oAWkC2MzrdDVnESnudIK4Gnl+DTMMePw72Yvbs0vY0FjNju0WRYUo5lVXsjN6wrXLWicHHJlf1X/ovoR02XEc3F831psD6OjfbaLpl5VM1Hcyms7F7iMt8NwiJQ0o/K/HwCVcYoKo8oEiqQOXVebv83p3Ga74rSVWE1INvDvYuliredYVFHr9kAjtoSCFfMGOgrLJLFyZcPCQ/MLrInhlc/w08iCvkskA0M0CcBpf8LJIcuA7yvPvNMv0INnzMnNLz50rvG2bQUuwpGn6JNWAErabAoowVs20LzRD2igNHhsiQjoUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from AM0PR08MB4995.eurprd08.prod.outlook.com (10.255.30.207) by
 AM0PR08MB3636.eurprd08.prod.outlook.com (20.177.43.89) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.20; Tue, 12 Nov 2019 11:10:00 +0000
Received: from AM0PR08MB4995.eurprd08.prod.outlook.com
 ([fe80::3c0c:3112:ccbf:13d0]) by AM0PR08MB4995.eurprd08.prod.outlook.com
 ([fe80::3c0c:3112:ccbf:13d0%6]) with mapi id 15.20.2430.027; Tue, 12 Nov 2019
 11:10:00 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "airlied@linux.ie" <airlied@linux.ie>, 
 Brian Starkey <Brian.Starkey@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "sean@poorly.run" <sean@poorly.run>, 
 Mihail Atanassov <Mihail.Atanassov@arm.com>, "imirkin@alum.mit.edu"
 <imirkin@alum.mit.edu>
Subject: [PATCH v10 1/4] drm: Add a new helper drm_color_ctm_s31_32_to_qm_n()
Thread-Topic: [PATCH v10 1/4] drm: Add a new helper
 drm_color_ctm_s31_32_to_qm_n()
Thread-Index: AQHVmUm5GoYUWOqrlUaBroU+1xdxlw==
Date: Tue, 12 Nov 2019 11:09:59 +0000
Message-ID: <20191112110927.20931-2-james.qian.wang@arm.com>
References: <20191112110927.20931-1-james.qian.wang@arm.com>
In-Reply-To: <20191112110927.20931-1-james.qian.wang@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0PR03CA0106.apcprd03.prod.outlook.com
 (2603:1096:203:b0::22) To AM0PR08MB4995.eurprd08.prod.outlook.com
 (2603:10a6:208:162::15)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 41e05263-a2e0-4503-f887-08d76760e2a6
X-MS-TrafficTypeDiagnostic: AM0PR08MB3636:|AM0PR08MB3636:|VE1PR08MB4912:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VE1PR08MB491269FD496E8BE2C8CAC105B3770@VE1PR08MB4912.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:6790;OLM:6790;
x-forefront-prvs: 021975AE46
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(396003)(39860400002)(376002)(366004)(199004)(189003)(2906002)(99286004)(446003)(2616005)(476003)(7736002)(66066001)(6512007)(6436002)(6486002)(11346002)(54906003)(256004)(305945005)(103116003)(110136005)(316002)(2201001)(14454004)(6116002)(2501003)(86362001)(3846002)(486006)(71200400001)(71190400001)(186003)(386003)(36756003)(1076003)(6506007)(5660300002)(81166006)(8676002)(4326008)(50226002)(26005)(76176011)(66946007)(2171002)(52116002)(81156014)(66446008)(102836004)(66476007)(64756008)(8936002)(66556008)(25786009)(55236004)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB3636;
 H:AM0PR08MB4995.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: tYu4chbxV2kejrJxKtWJI4gl3py26hLDymUJOBXoo92pdmVZqcIauhquIHPT20GYGAbJXLnzbfaM3yTz0M7sef/eNwhCmnRD0fJXkY+QopME+N5Rd75PMcDKvgxTILyLRpOaYUVEMe9kiewbVSg4IRzN8to8vzQxvmasF1Z3xrhyCPTSzn+Bw5FvxylDuKRdS4bReT6W4KYOzWRmjjwI3uby2sTdGvHhdMvccySZjMyrSApFDhJh90Z38jsvwCJmA9/Bei5rhSJmijcfrPXZXow+6ht0mAXUEzsPm+k2LEqVPlCGBzpQKgnWAhexuyDhoyKj5JqBnpQKI1JVLHe7jXq6Mj7YAG2+TgAhWgozkXi5QIGFT8G7hydscisBXFt74lWOBKRn/w0DaUd/gzeoh+exYIertVHHBtDTdna2nlDj7cwKkdP7FMIePvGqeQ2G
Content-ID: <4A2532144974164FB0D33DCB16C5AE24@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3636
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(396003)(39860400002)(376002)(1110001)(339900001)(189003)(199004)(50466002)(2501003)(36756003)(2486003)(23676004)(76176011)(486006)(26005)(25786009)(110136005)(1076003)(446003)(11346002)(54906003)(476003)(2616005)(7736002)(76130400001)(22756006)(356004)(86362001)(305945005)(70206006)(336012)(436003)(14454004)(36906005)(386003)(6506007)(2201001)(50226002)(99286004)(105606002)(3846002)(6116002)(107886003)(66066001)(81166006)(4326008)(5660300002)(478600001)(103116003)(70586007)(8676002)(102836004)(81156014)(8936002)(2906002)(2171002)(126002)(6512007)(26826003)(6486002)(316002)(186003)(47776003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4912;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Fail; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: ff22d156-645f-4d84-f095-08d76760dbb1
NoDisclaimer: True
X-Forefront-PRVS: 021975AE46
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1ek3i3rdUuqHO999/OcFTzkGhc5k35FLOg137e4rWaFe1r6+b9TmBbjoM5T6y0CinaijNflz1rkvTvrPAIOFftsiKJXmwYqaXyhE4PVh9wMxYHOd2+W2XTg8zhMxfnVQkFPRG0xJS8/cbVM9zgtkdxB4KdRitF0H3VpRHWi9HAmQUcUgX9bbWJcxt3s3dN0qW8MJMJQx1QuccaEiPmpjUPGZ7frhosSHDm4FivOA0shki9Y0BoL5YD1nzolyDj2c+gDe9FmXKPCs2cOUvZFc156/62Al9l5abNhNl/LmCYYVWqS0JqRGoM3cf7bxQNTM9MbliOvSjtc5wx5oVRAfr3n2tdY3dTDa4EKHdayzWFRva/yAV8xT2mEgot+MnWQLMzATHeEt6hJ7RNQe94uSLQEMEZlx+X/XSopPOJR1BWQ66lPeYzUtbkP040YXzwE0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2019 11:10:11.1798 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41e05263-a2e0-4503-f887-08d76760e2a6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4912
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4cVA01VPTm34igIPoloOoMRrAW1GGU6jFUdYSaPiuuk=;
 b=a7S8FA0ZNG+RFrvG7J9emCFOZWaTb+z/L/Kd4PePaCk4iMbgxgBCYJQSw0/fMEqd0wBBgQpKJqvMnC7nj6Ur2rniob/EDV+4JE1JR/02dCn3IUJ7BNIDxzY0HoejZQxltuDSCvD/QdXRqPeL4HO/WGavxF9c539tr2GP4lld6wQ=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4cVA01VPTm34igIPoloOoMRrAW1GGU6jFUdYSaPiuuk=;
 b=a7S8FA0ZNG+RFrvG7J9emCFOZWaTb+z/L/Kd4PePaCk4iMbgxgBCYJQSw0/fMEqd0wBBgQpKJqvMnC7nj6Ur2rniob/EDV+4JE1JR/02dCn3IUJ7BNIDxzY0HoejZQxltuDSCvD/QdXRqPeL4HO/WGavxF9c539tr2GP4lld6wQ=
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
 Daniel Vetter <daniel.vetter@ffwll.ch>,
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

QWRkIGEgbmV3IGhlbHBlciBmdW5jdGlvbiBkcm1fY29sb3JfY3RtX3MzMV8zMl90b19xbV9uKCkg
Zm9yIGRyaXZlciB0bw0KY29udmVydCBTMzEuMzIgc2lnbi1tYWduaXR1ZGUgdG8gUW0ubiAyJ3Mg
Y29tcGxlbWVudCB0aGF0IHN1cHBvcnRlZCBieQ0KaGFyZHdhcmUuDQoNClY0OiBBZGRyZXNzIE1p
aGFpLCBEYW5pZWwgYW5kIElsaWEncyByZXZpZXcgY29tbWVudHMuDQpWNTogSW5jbHVkZXMgdGhl
IHNpZ24gYml0IGluIHRoZSB2YWx1ZSBvZiBtIChRbS5uKS4NClY2OiBBbGxvd3MgbSA9IDAgYWNj
b3JkaW5nIHRvIE1paGFpbCdzIGNvbW1lbnRzLg0KVjc6IEFkZHJlc3MgTWloYWlsJ3MgY29tbWVu
dHMuDQpWODogVXNlIHR5cGUgJ3UzMicgdG8gcmVwbGFjZSAndWludDMyX3QnDQpWOTogUmViYXNl
Lg0KDQpTaWduZWQtb2ZmLWJ5OiBqYW1lcyBxaWFuIHdhbmcgKEFybSBUZWNobm9sb2d5IENoaW5h
KSA8amFtZXMucWlhbi53YW5nQGFybS5jb20+DQpSZXZpZXdlZC1ieTogTWloYWlsIEF0YW5hc3Nv
diA8bWloYWlsLmF0YW5hc3NvdkBhcm0uY29tPg0KUmV2aWV3ZWQtYnk6IERhbmllbCBWZXR0ZXIg
PGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+DQotLS0NCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2NvbG9y
X21nbXQuYyB8IDM0ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQogaW5jbHVkZS9k
cm0vZHJtX2NvbG9yX21nbXQuaCAgICAgfCAgMSArDQogMiBmaWxlcyBjaGFuZ2VkLCAzNSBpbnNl
cnRpb25zKCspDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2NvbG9yX21nbXQu
YyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fY29sb3JfbWdtdC5jDQppbmRleCA0Y2U1YzZkOGRlOTku
LmJhNzFlM2I4MjdmMSAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fY29sb3JfbWdt
dC5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2NvbG9yX21nbXQuYw0KQEAgLTEzMiw2ICsx
MzIsNDAgQEAgdWludDMyX3QgZHJtX2NvbG9yX2x1dF9leHRyYWN0KHVpbnQzMl90IHVzZXJfaW5w
dXQsIHVpbnQzMl90IGJpdF9wcmVjaXNpb24pDQogfQ0KIEVYUE9SVF9TWU1CT0woZHJtX2NvbG9y
X2x1dF9leHRyYWN0KTsNCiANCisvKioNCisgKiBkcm1fY29sb3JfY3RtX3MzMV8zMl90b19xbV9u
DQorICoNCisgKiBAdXNlcl9pbnB1dDogaW5wdXQgdmFsdWUNCisgKiBAbTogbnVtYmVyIG9mIGlu
dGVnZXIgYml0cywgb25seSBzdXBwb3J0IG0gPD0gMzIsIGluY2x1ZGUgdGhlIHNpZ24tYml0DQor
ICogQG46IG51bWJlciBvZiBmcmFjdGlvbmFsIGJpdHMsIG9ubHkgc3VwcG9ydCBuIDw9IDMyDQor
ICoNCisgKiBDb252ZXJ0IGFuZCBjbGFtcCBTMzEuMzIgc2lnbi1tYWduaXR1ZGUgdG8gUW0ubiAo
c2lnbmVkIDIncyBjb21wbGVtZW50KS4NCisgKiBUaGUgc2lnbi1iaXQgQklUKG0rbi0xKSBhbmQg
YWJvdmUgYXJlIDAgZm9yIHBvc2l0aXZlIHZhbHVlIGFuZCAxIGZvciBuZWdhdGl2ZQ0KKyAqIHRo
ZSByYW5nZSBvZiB2YWx1ZSBpcyBbLTJeKG0tMSksIDJeKG0tMSkgLSAyXi1uXQ0KKyAqDQorICog
Rm9yIGV4YW1wbGUNCisgKiBBIFEzLjEyIGZvcm1hdCBudW1iZXI6DQorICogLSByZXF1aXJlZCBi
aXQ6IDMgKyAxMiA9IDE1Yml0cw0KKyAqIC0gcmFuZ2U6IFstMl4yLCAyXjIgLSAyXuKIkjE1XQ0K
KyAqDQorICogTk9URTogdGhlIG0gY2FuIGJlIHplcm8gaWYgYWxsIGJpdF9wcmVjaXNpb24gYXJl
IHVzZWQgdG8gcHJlc2VudCBmcmFjdGlvbmFsDQorICogICAgICAgYml0cyBsaWtlIFEwLjMyDQor
ICovDQordTY0IGRybV9jb2xvcl9jdG1fczMxXzMyX3RvX3FtX24odTY0IHVzZXJfaW5wdXQsIHUz
MiBtLCB1MzIgbikNCit7DQorCXU2NCBtYWcgPSAodXNlcl9pbnB1dCAmIH5CSVRfVUxMKDYzKSkg
Pj4gKDMyIC0gbik7DQorCWJvb2wgbmVnYXRpdmUgPSAhISh1c2VyX2lucHV0ICYgQklUX1VMTCg2
MykpOw0KKwlzNjQgdmFsOw0KKw0KKwlXQVJOX09OKG0gPiAzMiB8fCBuID4gMzIpOw0KKw0KKwl2
YWwgPSBjbGFtcF92YWwobWFnLCAwLCBuZWdhdGl2ZSA/DQorCQkJCUJJVF9VTEwobiArIG0gLSAx
KSA6IEJJVF9VTEwobiArIG0gLSAxKSAtIDEpOw0KKw0KKwlyZXR1cm4gbmVnYXRpdmUgPyAtdmFs
IDogdmFsOw0KK30NCitFWFBPUlRfU1lNQk9MKGRybV9jb2xvcl9jdG1fczMxXzMyX3RvX3FtX24p
Ow0KKw0KIC8qKg0KICAqIGRybV9jcnRjX2VuYWJsZV9jb2xvcl9tZ210IC0gZW5hYmxlIGNvbG9y
IG1hbmFnZW1lbnQgcHJvcGVydGllcw0KICAqIEBjcnRjOiBEUk0gQ1JUQw0KZGlmZiAtLWdpdCBh
L2luY2x1ZGUvZHJtL2RybV9jb2xvcl9tZ210LmggYi9pbmNsdWRlL2RybS9kcm1fY29sb3JfbWdt
dC5oDQppbmRleCBkMWM2NjJkOTJhYjcuLjk5N2E0MmFiMjlmNSAxMDA2NDQNCi0tLSBhL2luY2x1
ZGUvZHJtL2RybV9jb2xvcl9tZ210LmgNCisrKyBiL2luY2x1ZGUvZHJtL2RybV9jb2xvcl9tZ210
LmgNCkBAIC0zMCw2ICszMCw3IEBAIHN0cnVjdCBkcm1fY3J0YzsNCiBzdHJ1Y3QgZHJtX3BsYW5l
Ow0KIA0KIHVpbnQzMl90IGRybV9jb2xvcl9sdXRfZXh0cmFjdCh1aW50MzJfdCB1c2VyX2lucHV0
LCB1aW50MzJfdCBiaXRfcHJlY2lzaW9uKTsNCit1NjQgZHJtX2NvbG9yX2N0bV9zMzFfMzJfdG9f
cW1fbih1NjQgdXNlcl9pbnB1dCwgdTMyIG0sIHUzMiBuKTsNCiANCiB2b2lkIGRybV9jcnRjX2Vu
YWJsZV9jb2xvcl9tZ210KHN0cnVjdCBkcm1fY3J0YyAqY3J0YywNCiAJCQkJdWludCBkZWdhbW1h
X2x1dF9zaXplLA0KLS0gDQoyLjIwLjENCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
