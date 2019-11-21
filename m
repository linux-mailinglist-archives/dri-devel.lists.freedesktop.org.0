Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9566D104DB0
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2019 09:18:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 740736E141;
	Thu, 21 Nov 2019 08:18:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10069.outbound.protection.outlook.com [40.107.1.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8F7E6EB95
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2019 08:17:56 +0000 (UTC)
Received: from VI1PR0801CA0073.eurprd08.prod.outlook.com
 (2603:10a6:800:7d::17) by VI1PR08MB3037.eurprd08.prod.outlook.com
 (2603:10a6:803:42::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.27; Thu, 21 Nov
 2019 08:17:54 +0000
Received: from AM5EUR03FT014.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::206) by VI1PR0801CA0073.outlook.office365.com
 (2603:10a6:800:7d::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.18 via Frontend
 Transport; Thu, 21 Nov 2019 08:17:54 +0000
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT014.mail.protection.outlook.com (10.152.16.130) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.17 via Frontend Transport; Thu, 21 Nov 2019 08:17:53 +0000
Received: ("Tessian outbound af6b7800e6cb:v33");
 Thu, 21 Nov 2019 08:17:52 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c5807edc8ee2474d
X-CR-MTA-TID: 64aa7808
Received: from 8339bfbc747e.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.4.52]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 AAFBD1A8-7EA8-48BC-8535-3AC62EB5B825.1; 
 Thu, 21 Nov 2019 08:17:47 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2052.outbound.protection.outlook.com [104.47.4.52])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8339bfbc747e.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 21 Nov 2019 08:17:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MCYA0mQWFT8TVX3DHDLJyu3hqcz+upn7lCqh9aK0xgyw2zaq694G07HwMlLSGIj8+zZZhVIjimoW4hu5ACcNaSkkiSa7Tk4eHhGjisJ4TCOpMZNh4J1UzTYJgMigQEVjzxwHjrXRcH/kRuiTPyga9aHz+MlX6s3M8e3znXzWEpQ1QsJG+3i/kDj+wmvnpm+ps6uWz9n2W6i1kOmMz8qjk5cfRKcl5LpYOxZ7T+qlkTp2ZKUtg0LjU1eW1fZ2f+Rcpbx4GwAiRNJCZKy5svqnfmU/2ymeROQfd0PX64SVFPQ+wcYdq4RkkgbMtT/Jg4XmBO+Z1jOzJaOovRTi7Do4eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QASb25Jew3FsFszPjgiiGr3y2lMle5ccT+pKmrURqnE=;
 b=PtqaFdxMze/vsq/r94PXQXfFQwHT4290p2+pycPujvLO/O3hZqy6Y76WeV08TRx+MIIIo3YyDKnt8iavh28L26lZxrqhGXEEqvAjPsEKrfkvamkTH7buUUMuMlRsa0UnbJz9DcbJFcfKX6oCHKiMb6Gh54CZdKpp6gpxvA59NGvhYlLLG3W2acPKp9DVi5zuz9PcQqyQOzsQa8c5aREGb8k81Lk9MjG1veRpDnS5Shh3g2AgQ3CDU4ur0DA+QVdVQlQ5bdzhdq/lHIC+2ZdJNSnccXVHh7Ip14BCC8sFhCvOw/0Z7x5F1I051TB1+ZI+5GpExYYcv6iTQKJCK3Eb5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4910.eurprd08.prod.outlook.com (10.255.114.207) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.17; Thu, 21 Nov 2019 08:17:45 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a809:417a:faf3:61a7]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a809:417a:faf3:61a7%6]) with mapi id 15.20.2474.019; Thu, 21 Nov 2019
 08:17:45 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "airlied@linux.ie" <airlied@linux.ie>, 
 Brian Starkey <Brian.Starkey@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, Mihail Atanassov
 <Mihail.Atanassov@arm.com>
Subject: [PATCH v2 2/2] drm/komeda: Enable new product D32 support
Thread-Topic: [PATCH v2 2/2] drm/komeda: Enable new product D32 support
Thread-Index: AQHVoEQnHODp0nh43k+zk6WDkpPTxA==
Date: Thu, 21 Nov 2019 08:17:45 +0000
Message-ID: <20191121081717.29518-3-james.qian.wang@arm.com>
References: <20191121081717.29518-1-james.qian.wang@arm.com>
In-Reply-To: <20191121081717.29518-1-james.qian.wang@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR03CA0056.apcprd03.prod.outlook.com
 (2603:1096:202:17::26) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 37c19b4b-9997-47a9-5de4-08d76e5b4ede
X-MS-TrafficTypeDiagnostic: VE1PR08MB4910:|VE1PR08MB4910:|VI1PR08MB3037:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VI1PR08MB30374882E97807378316DDE7B34E0@VI1PR08MB3037.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:8273;
x-forefront-prvs: 0228DDDDD7
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(346002)(366004)(136003)(39850400004)(189003)(199004)(6116002)(3846002)(2616005)(6486002)(478600001)(86362001)(4326008)(446003)(102836004)(6636002)(71190400001)(26005)(71200400001)(54906003)(110136005)(14454004)(186003)(2501003)(11346002)(6436002)(316002)(6512007)(99286004)(25786009)(2906002)(66946007)(64756008)(7736002)(66556008)(66066001)(305945005)(1076003)(66476007)(256004)(14444005)(36756003)(52116002)(76176011)(386003)(6506007)(55236004)(81166006)(81156014)(8676002)(50226002)(103116003)(66446008)(8936002)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4910;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: PxP72KOwQXGJio0A8mGPnfzZ1LQyj/uf5pUMtcznNlJKNNZbAESVsEbgWZC1dUMwQK5zLBy5TDd2l1O+hkopnBcNVeZt7IV9kBVBRi+Dv9MKEFbLY7NUUqEW6PxuIyUa3YX4FjNoP970M65tBvnp1jC4IxoqstgsiVSqq5awH/t4p93kp7lhvJlqHv8U5ry71HGEQetLZwG4OnoqODximXMHI8ZElIPzY24XqYOPM7YgpuE2VxSJOKyJ5wCYMUZlJK4350/+/P1/a1vvDvQ/eAgPlHoC32D/ubWJPsOgXud66s2w67nzPFPSYsdOQvTJBBF1LB+y1SwW9Eay/uHVGa6sEndQ663Zsin9cOXJ7rojygQPpaH49ZhFso7a+HMm5ik9JCoHON6SBZrK8k3Ve1uYg4FzyMAWEDf30McEcRlqwQ35Znfu3h2dBSC1zn8n
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4910
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39850400004)(396003)(376002)(346002)(1110001)(339900001)(189003)(199004)(47776003)(81156014)(81166006)(54906003)(36906005)(316002)(5660300002)(2501003)(66066001)(6486002)(110136005)(305945005)(105606002)(1076003)(70206006)(103116003)(76130400001)(14444005)(99286004)(70586007)(86362001)(4326008)(50466002)(2616005)(478600001)(6636002)(356004)(2906002)(25786009)(14454004)(22756006)(6512007)(8676002)(26005)(6116002)(7736002)(50226002)(3846002)(102836004)(36756003)(23756003)(8936002)(26826003)(11346002)(446003)(186003)(6506007)(76176011)(386003)(8746002)(336012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3037;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Fail; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 1530753a-151d-4646-32c9-08d76e5b496a
NoDisclaimer: True
X-Forefront-PRVS: 0228DDDDD7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VO7mlusPjxSmo+0sJxSMRP3IGfm7tn1QOYJ/adI3X4dObIeLLISqwJ4KatSHxGLUNyD3MfNYpOCHgzzXGp5ZZB1HLG5i76ysMNSsurgB+yUaRM0bMALfz5x2z0+ToLP4U6KLTGu2MxGlQtS1W5rypPNc73HsdgX3CB9xcxkyEookST7nvcYingWpwj2fZDyZo/dpaYoIk1h3p0hwT+PRPFmhJ769bE+wWcADxomECIjqG49x+vtoEcAapHsM6BiHxcfXLnOMU+9QXrGaka2S9c6ABBVcqiHhiT5lFsBUMnKLUWz1kNkZNz8sDpuviddQbcWjK/uy7B4CA0jOAmm+1mWe+A+JJniQUFqXhfOG3j8eTRNINIGT9sLg0InMmr9TsT8lDs2CsgKSTAPfFTf8CgdU7OHY4ePHU3xEqR9K2dI7pfSDZHjGU8mKP9Z9mSq8
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2019 08:17:53.9868 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 37c19b4b-9997-47a9-5de4-08d76e5b4ede
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3037
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QASb25Jew3FsFszPjgiiGr3y2lMle5ccT+pKmrURqnE=;
 b=Y568bpsBWUBkHlzkJ3HfphKeRYbxgKKVI4UHpwr/vAzxci3hHj3Q4lMxaifC5g/KL+Z7IpPx46UVKYdzD7psgUQiaxEQHExCxgY1I1OHV1NXQRSs2uzapHvgoq7zlEAM9rPMrF46lvU5i3WaMCyjPS/3PMhaBlP/g8y13WoZQ4w=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QASb25Jew3FsFszPjgiiGr3y2lMle5ccT+pKmrURqnE=;
 b=Y568bpsBWUBkHlzkJ3HfphKeRYbxgKKVI4UHpwr/vAzxci3hHj3Q4lMxaifC5g/KL+Z7IpPx46UVKYdzD7psgUQiaxEQHExCxgY1I1OHV1NXQRSs2uzapHvgoq7zlEAM9rPMrF46lvU5i3WaMCyjPS/3PMhaBlP/g8y13WoZQ4w=
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

RDMyIGlzIHNpbXBsZSB2ZXJzaW9uIG9mIEQ3MSwgdGhlIGRpZmZlcmVuY2UgaXM6Ci0gT25seSBo
YXMgb25lIHBpcGVsaW5lCi0gRHJvcCB0aGUgcGVyaXBoIGJsb2NrIGFuZCBtZXJnZSBpdCB0byBH
Q1UKCnYyOiBSZWJhc2UuCgpTaWduZWQtb2ZmLWJ5OiBKYW1lcyBRaWFuIFdhbmcgKEFybSBUZWNo
bm9sb2d5IENoaW5hKSA8amFtZXMucWlhbi53YW5nQGFybS5jb20+Ci0tLQogLi4uL2RybS9hcm0v
ZGlzcGxheS9pbmNsdWRlL21hbGlkcF9wcm9kdWN0LmggIHwgIDMgKy0KIC4uLi9hcm0vZGlzcGxh
eS9rb21lZGEvZDcxL2Q3MV9jb21wb25lbnQuYyAgICB8ICAyICstCiAuLi4vZ3B1L2RybS9hcm0v
ZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9kZXYuYyAgfCA0MyArKysrKysrKysrKystLS0tLS0tCiAu
Li4vZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9yZWdzLmggfCAxMyArKysrKysK
IC4uLi9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZHJ2LmMgICB8ICAxICsKIDUg
ZmlsZXMgY2hhbmdlZCwgNDQgaW5zZXJ0aW9ucygrKSwgMTggZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2luY2x1ZGUvbWFsaWRwX3Byb2R1Y3Qu
aCBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9pbmNsdWRlL21hbGlkcF9wcm9kdWN0LmgK
aW5kZXggOTZlMmU0MDE2MjUwLi5kYmQzZDQ3NjUwNjUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hcm0vZGlzcGxheS9pbmNsdWRlL21hbGlkcF9wcm9kdWN0LmgKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FybS9kaXNwbGF5L2luY2x1ZGUvbWFsaWRwX3Byb2R1Y3QuaApAQCAtMTgsNyArMTgs
OCBAQAogI2RlZmluZSBNQUxJRFBfQ09SRV9JRF9TVEFUVVMoX19jb3JlX2lkKSAgICAgKCgoX191
MzIpKF9fY29yZV9pZCkpICYgMHhGRikKIAogLyogTWFsaS1kaXNwbGF5IHByb2R1Y3QgSURzICov
Ci0jZGVmaW5lIE1BTElEUF9ENzFfUFJPRFVDVF9JRCAgIDB4MDA3MQorI2RlZmluZSBNQUxJRFBf
RDcxX1BST0RVQ1RfSUQJMHgwMDcxCisjZGVmaW5lIE1BTElEUF9EMzJfUFJPRFVDVF9JRAkweDAw
MzIKIAogdW5pb24ga29tZWRhX2NvbmZpZ19pZCB7CiAJc3RydWN0IHsKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9jb21wb25lbnQuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9jb21wb25lbnQuYwppbmRl
eCA2ZGFkZjQ0MTNlZjMuLmM3ZjdlOWM1NDVjNyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FybS9kaXNwbGF5L2tvbWVkYS9kNzEvZDcxX2NvbXBvbmVudC5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9jb21wb25lbnQuYwpAQCAtMTI3NCw3ICsx
Mjc0LDcgQEAgc3RhdGljIGludCBkNzFfdGltaW5nX2N0cmxyX2luaXQoc3RydWN0IGQ3MV9kZXYg
KmQ3MSwKIAogCWN0cmxyID0gdG9fY3RybHIoYyk7CiAKLQljdHJsci0+c3VwcG9ydHNfZHVhbF9s
aW5rID0gdHJ1ZTsKKwljdHJsci0+c3VwcG9ydHNfZHVhbF9saW5rID0gZDcxLT5zdXBwb3J0c19k
dWFsX2xpbms7CiAKIAlyZXR1cm4gMDsKIH0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
cm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9kZXYuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlz
cGxheS9rb21lZGEvZDcxL2Q3MV9kZXYuYwppbmRleCA5YjNiZjM1M2I2Y2MuLjJkNDI5ZTMxMGU1
YiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9kNzEvZDcx
X2Rldi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9k
ZXYuYwpAQCAtMzcxLDIzICszNzEsMzMgQEAgc3RhdGljIGludCBkNzFfZW51bV9yZXNvdXJjZXMo
c3RydWN0IGtvbWVkYV9kZXYgKm1kZXYpCiAJCWdvdG8gZXJyX2NsZWFudXA7CiAJfQogCi0JLyog
cHJvYmUgUEVSSVBIICovCisJLyogT25seSB0aGUgbGVnYWN5IEhXIGhhcyB0aGUgcGVyaXBoIGJs
b2NrLCB0aGUgbmV3ZXIgbWVyZ2VzIHRoZSBwZXJpcGgKKwkgKiBpbnRvIEdDVQorCSAqLwogCXZh
bHVlID0gbWFsaWRwX3JlYWQzMihkNzEtPnBlcmlwaF9hZGRyLCBCTEtfQkxPQ0tfSU5GTyk7Ci0J
aWYgKEJMT0NLX0lORk9fQkxLX1RZUEUodmFsdWUpICE9IEQ3MV9CTEtfVFlQRV9QRVJJUEgpIHsK
LQkJRFJNX0VSUk9SKCJhY2Nlc3MgYmxrIHBlcmlwaCBidXQgZ290IGJsazogJWQuXG4iLAotCQkJ
ICBCTE9DS19JTkZPX0JMS19UWVBFKHZhbHVlKSk7Ci0JCWVyciA9IC1FSU5WQUw7Ci0JCWdvdG8g
ZXJyX2NsZWFudXA7CisJaWYgKEJMT0NLX0lORk9fQkxLX1RZUEUodmFsdWUpICE9IEQ3MV9CTEtf
VFlQRV9QRVJJUEgpCisJCWQ3MS0+cGVyaXBoX2FkZHIgPSBOVUxMOworCisJaWYgKGQ3MS0+cGVy
aXBoX2FkZHIpIHsKKwkJLyogcHJvYmUgUEVSSVBIRVJBTCBpbiBsZWdhY3kgSFcgKi8KKwkJdmFs
dWUgPSBtYWxpZHBfcmVhZDMyKGQ3MS0+cGVyaXBoX2FkZHIsIFBFUklQSF9DT05GSUdVUkFUSU9O
X0lEKTsKKworCQlkNzEtPm1heF9saW5lX3NpemUJPSB2YWx1ZSAmIFBFUklQSF9NQVhfTElORV9T
SVpFID8gNDA5NiA6IDIwNDg7CisJCWQ3MS0+bWF4X3ZzaXplCQk9IDQwOTY7CisJCWQ3MS0+bnVt
X3JpY2hfbGF5ZXJzCT0gdmFsdWUgJiBQRVJJUEhfTlVNX1JJQ0hfTEFZRVJTID8gMiA6IDE7CisJ
CWQ3MS0+c3VwcG9ydHNfZHVhbF9saW5rCT0gISEodmFsdWUgJiBQRVJJUEhfU1BMSVRfRU4pOwor
CQlkNzEtPmludGVncmF0ZXNfdGJ1CT0gISEodmFsdWUgJiBQRVJJUEhfVEJVX0VOKTsKKwl9IGVs
c2UgeworCQl2YWx1ZSA9IG1hbGlkcF9yZWFkMzIoZDcxLT5nY3VfYWRkciwgR0NVX0NPTkZJR1VS
QVRJT05fSUQwKTsKKwkJZDcxLT5tYXhfbGluZV9zaXplCT0gR0NVX01BWF9MSU5FX1NJWkUodmFs
dWUpOworCQlkNzEtPm1heF92c2l6ZQkJPSBHQ1VfTUFYX05VTV9MSU5FUyh2YWx1ZSk7CisKKwkJ
dmFsdWUgPSBtYWxpZHBfcmVhZDMyKGQ3MS0+Z2N1X2FkZHIsIEdDVV9DT05GSUdVUkFUSU9OX0lE
MSk7CisJCWQ3MS0+bnVtX3JpY2hfbGF5ZXJzCT0gR0NVX05VTV9SSUNIX0xBWUVSUyh2YWx1ZSk7
CisJCWQ3MS0+c3VwcG9ydHNfZHVhbF9saW5rCT0gR0NVX0RJU1BMQVlfU1BMSVRfRU4odmFsdWUp
OworCQlkNzEtPmludGVncmF0ZXNfdGJ1CT0gR0NVX0RJU1BMQVlfVEJVX0VOKHZhbHVlKTsKIAl9
CiAKLQl2YWx1ZSA9IG1hbGlkcF9yZWFkMzIoZDcxLT5wZXJpcGhfYWRkciwgUEVSSVBIX0NPTkZJ
R1VSQVRJT05fSUQpOwotCi0JZDcxLT5tYXhfbGluZV9zaXplCT0gdmFsdWUgJiBQRVJJUEhfTUFY
X0xJTkVfU0laRSA/IDQwOTYgOiAyMDQ4OwotCWQ3MS0+bWF4X3ZzaXplCQk9IDQwOTY7Ci0JZDcx
LT5udW1fcmljaF9sYXllcnMJPSB2YWx1ZSAmIFBFUklQSF9OVU1fUklDSF9MQVlFUlMgPyAyIDog
MTsKLQlkNzEtPnN1cHBvcnRzX2R1YWxfbGluawk9IHZhbHVlICYgUEVSSVBIX1NQTElUX0VOID8g
dHJ1ZSA6IGZhbHNlOwotCWQ3MS0+aW50ZWdyYXRlc190YnUJPSB2YWx1ZSAmIFBFUklQSF9UQlVf
RU4gPyB0cnVlIDogZmFsc2U7Ci0KIAlmb3IgKGkgPSAwOyBpIDwgZDcxLT5udW1fcGlwZWxpbmVz
OyBpKyspIHsKIAkJcGlwZSA9IGtvbWVkYV9waXBlbGluZV9hZGQobWRldiwgc2l6ZW9mKHN0cnVj
dCBkNzFfcGlwZWxpbmUpLAogCQkJCQkgICAmZDcxX3BpcGVsaW5lX2Z1bmNzKTsKQEAgLTQxNSw3
ICs0MjUsNyBAQCBzdGF0aWMgaW50IGQ3MV9lbnVtX3Jlc291cmNlcyhzdHJ1Y3Qga29tZWRhX2Rl
diAqbWRldikKIAl9CiAKIAkvKiBsb29wIHRoZSByZWdpc3RlciBibGtzIGFuZCBwcm9iZSAqLwot
CWkgPSAyOyAvKiBleGNsdWRlIEdDVSBhbmQgUEVSSVBIICovCisJaSA9IDE7IC8qIGV4Y2x1ZGUg
R0NVICovCiAJb2Zmc2V0ID0gRDcxX0JMT0NLX1NJWkU7IC8qIHNraXAgR0NVICovCiAJd2hpbGUg
KGkgPCBkNzEtPm51bV9ibG9ja3MpIHsKIAkJYmxrX2Jhc2UgPSBtZGV2LT5yZWdfYmFzZSArIChv
ZmZzZXQgPj4gMik7CkBAIC00MjUsOSArNDM1LDkgQEAgc3RhdGljIGludCBkNzFfZW51bV9yZXNv
dXJjZXMoc3RydWN0IGtvbWVkYV9kZXYgKm1kZXYpCiAJCQllcnIgPSBkNzFfcHJvYmVfYmxvY2so
ZDcxLCAmYmxrLCBibGtfYmFzZSk7CiAJCQlpZiAoZXJyKQogCQkJCWdvdG8gZXJyX2NsZWFudXA7
Ci0JCQlpKys7CiAJCX0KIAorCQlpKys7CiAJCW9mZnNldCArPSBENzFfQkxPQ0tfU0laRTsKIAl9
CiAKQEAgLTYwMyw2ICs2MTMsNyBAQCBkNzFfaWRlbnRpZnkodTMyIF9faW9tZW0gKnJlZ19iYXNl
LCBzdHJ1Y3Qga29tZWRhX2NoaXBfaW5mbyAqY2hpcCkKIAogCXN3aXRjaCAocHJvZHVjdF9pZCkg
ewogCWNhc2UgTUFMSURQX0Q3MV9QUk9EVUNUX0lEOgorCWNhc2UgTUFMSURQX0QzMl9QUk9EVUNU
X0lEOgogCQlmdW5jcyA9ICZkNzFfY2hpcF9mdW5jczsKIAkJYnJlYWs7CiAJZGVmYXVsdDoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9yZWdz
LmggYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFfcmVncy5oCmlu
ZGV4IDE3MjdkYzk5MzkwOS4uODFkZTZhMjNlN2YzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFfcmVncy5oCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9yZWdzLmgKQEAgLTcyLDYgKzcyLDE5IEBACiAj
ZGVmaW5lIEdDVV9DT05UUk9MX01PREUoeCkJKCh4KSAmIDB4NykKICNkZWZpbmUgR0NVX0NPTlRS
T0xfU1JTVAlCSVQoMTYpCiAKKy8qIEdDVV9DT05GSUdVUkFUSU9OIHJlZ2lzdGVycyAqLworI2Rl
ZmluZSBHQ1VfQ09ORklHVVJBVElPTl9JRDAJMHgxMDAKKyNkZWZpbmUgR0NVX0NPTkZJR1VSQVRJ
T05fSUQxCTB4MTA0CisKKy8qIEdDVSBjb25maWd1cmF0aW9uICovCisjZGVmaW5lIEdDVV9NQVhf
TElORV9TSVpFKHgpCSgoeCkgJiAweEZGRkYpCisjZGVmaW5lIEdDVV9NQVhfTlVNX0xJTkVTKHgp
CSgoeCkgPj4gMTYpCisjZGVmaW5lIEdDVV9OVU1fUklDSF9MQVlFUlMoeCkJKCh4KSAmIDB4NykK
KyNkZWZpbmUgR0NVX05VTV9QSVBFTElORVMoeCkJKCgoeCkgPj4gMykgJiAweDcpCisjZGVmaW5l
IEdDVV9OVU1fU0NBTEVSUyh4KQkoKCh4KSA+PiA2KSAmIDB4NykKKyNkZWZpbmUgR0NVX0RJU1BM
QVlfU1BMSVRfRU4oeCkJKCgoeCkgPj4gMTYpICYgMHgxKQorI2RlZmluZSBHQ1VfRElTUExBWV9U
QlVfRU4oeCkJKCgoeCkgPj4gMTcpICYgMHgxKQorCiAvKiBHQ1Ugb3Btb2RlICovCiAjZGVmaW5l
IElOQUNUSVZFX01PREUJCTAKICNkZWZpbmUgVEJVX0NPTk5FQ1RfTU9ERQkxCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kcnYuYyBiL2RyaXZl
cnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rydi5jCmluZGV4IGI3YTEwOTdj
NDVjNC4uYWQzOGJiYzc0MzFlIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3Bs
YXkva29tZWRhL2tvbWVkYV9kcnYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkv
a29tZWRhL2tvbWVkYV9kcnYuYwpAQCAtMTI1LDYgKzEyNSw3IEBAIHN0YXRpYyBpbnQga29tZWRh
X3BsYXRmb3JtX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCiBzdGF0aWMg
Y29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBrb21lZGFfb2ZfbWF0Y2hbXSA9IHsKIAl7IC5jb21w
YXRpYmxlID0gImFybSxtYWxpLWQ3MSIsIC5kYXRhID0gZDcxX2lkZW50aWZ5LCB9LAorCXsgLmNv
bXBhdGlibGUgPSAiYXJtLG1hbGktZDMyIiwgLmRhdGEgPSBkNzFfaWRlbnRpZnksIH0sCiAJe30s
CiB9OwogCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
