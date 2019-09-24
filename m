Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7ADBC28A
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2019 09:26:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DECEB6E9B8;
	Tue, 24 Sep 2019 07:26:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0629.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0e::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F7C46E9B8
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2019 07:26:33 +0000 (UTC)
Received: from VI1PR0802CA0002.eurprd08.prod.outlook.com
 (2603:10a6:800:aa::12) by DB8PR08MB5146.eurprd08.prod.outlook.com
 (2603:10a6:10:e7::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.26; Tue, 24 Sep
 2019 07:26:29 +0000
Received: from DB5EUR03FT048.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::209) by VI1PR0802CA0002.outlook.office365.com
 (2603:10a6:800:aa::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.25 via Frontend
 Transport; Tue, 24 Sep 2019 07:26:29 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT048.mail.protection.outlook.com (10.152.21.28) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20 via Frontend Transport; Tue, 24 Sep 2019 07:26:27 +0000
Received: ("Tessian outbound 5061e1b5386c:v31");
 Tue, 24 Sep 2019 07:26:20 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e48258766da11404
X-CR-MTA-TID: 64aa7808
Received: from 12b73542b0cc.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.2.56]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 61407BBD-25A9-4578-952B-CA282CD94D24.1; 
 Tue, 24 Sep 2019 07:26:15 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2056.outbound.protection.outlook.com [104.47.2.56])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 12b73542b0cc.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 24 Sep 2019 07:26:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P+m0IoCG6aM3XJXJA5a9Af4nwBeaXAhngPUH/Q06zvjFrt4/juMc5hL2IhKfHV9Toi4eRqLviYUArqgEtV2hxB7nf72GZ/LLu11x3Km4F97QKcV88k2yEkz1AOtcvn2Jbelu9rA0t5m/6j+H0AqkygT8IL8zw+CUXKit9BOoAAPq2LbOf5DZGAY+TQeMtCoajdU0lyFmHLZmX3mXKaEACruvAKnJ2Ti6nRDNAVChwkz1zOVwpCBtzjb3x3a6w5U5VXIsW2olf9IOCAnyRJJVT2XbR1nomvz/Vk7PylhzTNE7lznUbqv0J0R7kCXzjCLuc568iNCYI77MatWA3dPURg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mZsp5b9CREF6o15QmOw7iKDF5xz9u0ShN5TG4mS9xYQ=;
 b=XCWHe15irX8oozp8HgZKEr9u3bjNhX09CpxwutvUSkPhuKO9kalliV8BK9C5YLfu93LQzRIDrUZA2slrnzjt/BBdGWtOia6r0WS/HeG168qyLKD/WrB7/W63Igl3RAfJh0PxcZH8JddA0Iw9XJbwuQKR6j2QXQf+W13AZxzvniFaohTYNx8DHoAm9DkPwsltO83/DsRnD4aQajPSlGQ72Dkye31nYcIBgiiQhudZRNohtBXVUEWRqq2jBc/XI7CUYVqXAYEmY/gjzJDSXGv7fzNm7wriDtSA5z6ZXnSLc0AtdgmSrxqQfnv3fsvKF0aMSvwNihwlxyfprhAA6nx66A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB5488.eurprd08.prod.outlook.com (52.133.246.150) by
 VI1PR08MB3998.eurprd08.prod.outlook.com (20.178.126.31) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Tue, 24 Sep 2019 07:26:13 +0000
Received: from VI1PR08MB5488.eurprd08.prod.outlook.com
 ([fe80::d09e:254b:4d3b:456b]) by VI1PR08MB5488.eurprd08.prod.outlook.com
 ([fe80::d09e:254b:4d3b:456b%3]) with mapi id 15.20.2284.023; Tue, 24 Sep 2019
 07:26:13 +0000
From: "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "james qian wang (Arm Technology
 China)" <james.qian.wang@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "seanpaul@chromium.org"
 <seanpaul@chromium.org>, "airlied@linux.ie" <airlied@linux.ie>, Brian Starkey
 <Brian.Starkey@arm.com>, Mihail Atanassov <Mihail.Atanassov@arm.com>
Subject: [PATCH v2 1/2] drm/komeda: Add line size support
Thread-Topic: [PATCH v2 1/2] drm/komeda: Add line size support
Thread-Index: AQHVcqlYDphWl6Q560C4rpnwGAgy5A==
Date: Tue, 24 Sep 2019 07:26:13 +0000
Message-ID: <20190924072552.32446-2-lowry.li@arm.com>
References: <20190924072552.32446-1-lowry.li@arm.com>
In-Reply-To: <20190924072552.32446-1-lowry.li@arm.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2P15301CA0006.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::16) To VI1PR08MB5488.eurprd08.prod.outlook.com
 (2603:10a6:803:137::22)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Lowry.Li@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 191fa6a6-7643-46c7-a27d-08d740c0834f
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR08MB3998; 
X-MS-TrafficTypeDiagnostic: VI1PR08MB3998:|VI1PR08MB3998:|DB8PR08MB5146:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB8PR08MB51464538E5DF35FDA87699389F840@DB8PR08MB5146.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:7691;OLM:7691;
x-forefront-prvs: 0170DAF08C
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39860400002)(396003)(376002)(136003)(346002)(199004)(189003)(50226002)(102836004)(478600001)(55236004)(66556008)(316002)(4326008)(66946007)(2501003)(25786009)(476003)(11346002)(186003)(66066001)(2616005)(52116002)(26005)(6506007)(386003)(54906003)(99286004)(446003)(76176011)(5660300002)(6116002)(66446008)(3846002)(8936002)(486006)(1076003)(86362001)(8676002)(110136005)(66476007)(64756008)(81156014)(6486002)(36756003)(6636002)(71200400001)(71190400001)(14454004)(2906002)(6512007)(81166006)(2201001)(7736002)(6436002)(305945005)(256004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3998;
 H:VI1PR08MB5488.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: +rso/FxiU4b0tJ+AttQQUsaIuIeTtZ8CmPg+O2thu+FJqH9ULjRoIwK5I43j4cpQ7KIxsuCpk/8kpXWQnVKNQt4/PnrvxuUF2G2nWobmAUWYoNEYCjTTIwP5s+Eeed16MeJbmZuvD1mVJYjSHqODMWGcXpI7NvOLPUIKGy7afuXfCwqfG6vnMr++Zhqt3DoOHcmH65mQ9JQygAfZpauk2EUzTFKqrxd/aeTiOc+lNhY1mgWsNbZEZqpE2N7V8lOufDcbBnN7qhgPLuPSoZ1fpvo6kvLKFBs0WyZF4OgiaGrhaCePGbxnIU0rQHFYq80H7IFiRRzJ8Brp2nF6cLc90HNNkIW1663Ocl8c2iEim6p6FE63eixsAEPc8wJ8aTH5eg/iMuFxmxkrMWOFeSMKgoUpJfqVM4qtt8jXyYGuf28=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3998
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Lowry.Li@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(376002)(136003)(346002)(199004)(189003)(47776003)(8746002)(1076003)(81156014)(8676002)(76176011)(7736002)(26826003)(26005)(6506007)(386003)(81166006)(66066001)(6512007)(6636002)(356004)(102836004)(305945005)(22756006)(336012)(23756003)(11346002)(63350400001)(6486002)(186003)(4326008)(446003)(486006)(126002)(476003)(2616005)(6116002)(50466002)(2501003)(76130400001)(2201001)(50226002)(110136005)(99286004)(478600001)(70206006)(25786009)(5660300002)(70586007)(54906003)(2906002)(8936002)(86362001)(36756003)(14454004)(316002)(3846002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB8PR08MB5146;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 01974bbc-ba72-4081-9387-08d740c07a81
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(710020)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DB8PR08MB5146; 
NoDisclaimer: True
X-Forefront-PRVS: 0170DAF08C
X-Microsoft-Antispam-Message-Info: HLYiIuEZ0jD3nkn7o2EXz7CiehPSPPxDXGzuFTAaP93Jt7DBScPf3fbC+EtK/SC+KwLIAPbmK+q0/RtiODSbxrRMH0J6XYHJyB1U20S86GeRSDsYi/bIBEN8Ni5pxXBSyR58SfDbQVX8E1Bunif5sVkIBT96jMIrajGWt+AOPVgU+lJTs7VOBsY5BbwWP11YWcH6W6iixs2pBnFu6C6xUCR6tl9cZD6ojAHh/S6oWosJ3Wln3zcT0069svL02dRIK3TPeN7ItayJZspEH7bioy1tRe/e+1Z2bCIXnrJ7AEr6yzWsK5F4/APjfxycNmwGQH49sijJA83U+hma+DNLwdfAanRJEQCVvbDKFMMqJCWLzu7nR1Y3U2eVYxPHducIKRZWgQPOb5/CplcSMlt0jfXzGZxcyWZ09yZDPKWO7Zk=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2019 07:26:27.6496 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 191fa6a6-7643-46c7-a27d-08d740c0834f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5146
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mZsp5b9CREF6o15QmOw7iKDF5xz9u0ShN5TG4mS9xYQ=;
 b=FgmWlPlsjZjAkUp4vR0jFGLtraIiSJQ8Ox8jDce/P1sE3yXXaBoViWlDaVveO72Cg1i/TnJ0B++C8HUd0LcTScpGaRNBDHYT9WaiS+cZ84invRv4YHA/EKGvjJc3egJ9D3dR1x+Zw+Ayb+mtVJexB7Bm8v1IZPxvdBWDF2lAsrM=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mZsp5b9CREF6o15QmOw7iKDF5xz9u0ShN5TG4mS9xYQ=;
 b=FgmWlPlsjZjAkUp4vR0jFGLtraIiSJQ8Ox8jDce/P1sE3yXXaBoViWlDaVveO72Cg1i/TnJ0B++C8HUd0LcTScpGaRNBDHYT9WaiS+cZ84invRv4YHA/EKGvjJc3egJ9D3dR1x+Zw+Ayb+mtVJexB7Bm8v1IZPxvdBWDF2lAsrM=
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
Cc: Ayan Halder <Ayan.Halder@arm.com>, "Jonathan Chai
 \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>, nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogIkxvd3J5IExpIChBcm0gVGVjaG5vbG9neSBDaGluYSkiIDxMb3dyeS5MaUBhcm0uY29t
PgoKT24gRDcxLCB3ZSBhcmUgdXNpbmcgdGhlIGdsb2JhbCBsaW5lIHNpemUuIEZyb20gRDMyLCBl
dmVyeQpjb21wb25lbnQgaGF2ZSBhIGxpbmUgc2l6ZSByZWdpc3RlciB0byBpbmRpY2F0ZSB0aGUg
ZmlmbyBzaXplLgoKU28gdGhpcyBwYXRjaCBpcyB0byBzZXQgbGluZSBzaXplIHN1cHBvcnQgYW5k
IGRvIHRoZSBsaW5lIHNpemUKY2hlY2suCgpTaWduZWQtb2ZmLWJ5OiBMb3dyeSBMaSAoQXJtIFRl
Y2hub2xvZ3kgQ2hpbmEpIDxsb3dyeS5saUBhcm0uY29tPgotLS0KIC4uLi9hcm0vZGlzcGxheS9r
b21lZGEvZDcxL2Q3MV9jb21wb25lbnQuYyAgICB8IDU3ICsrKysrKysrKysrKysrKystLS0KIC4u
Li9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9kNzEvZDcxX3JlZ3MuaCB8ICA5ICstLQogLi4u
L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BpcGVsaW5lLmggIHwgIDIgKwogLi4uL2Rp
c3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZV9zdGF0ZS5jICAgIHwgMTcgKysrKysrCiA0IGZp
bGVzIGNoYW5nZWQsIDcwIGluc2VydGlvbnMoKyksIDE1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9jb21wb25lbnQu
YyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9jb21wb25lbnQu
YwppbmRleCA3YjM3NGEzYjkxMWUuLjM1NzgzN2I5ZDZlZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9kNzEvZDcxX2NvbXBvbmVudC5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9jb21wb25lbnQuYwpAQCAtMTA2
LDYgKzEwNiwyMyBAQCBzdGF0aWMgdm9pZCBkdW1wX2Jsb2NrX2hlYWRlcihzdHJ1Y3Qgc2VxX2Zp
bGUgKnNmLCB2b2lkIF9faW9tZW0gKnJlZykKIAkJCSAgIGksIGhkci5vdXRwdXRfaWRzW2ldKTsK
IH0KIAorLyogT24gRDcxLCB3ZSBhcmUgdXNpbmcgdGhlIGdsb2JhbCBsaW5lIHNpemUuIEZyb20g
RDMyLCBldmVyeSBjb21wb25lbnQgaGF2ZQorICogYSBsaW5lIHNpemUgcmVnaXN0ZXIgdG8gaW5k
aWNhdGUgdGhlIGZpZm8gc2l6ZS4KKyAqLworc3RhdGljIHUzMiBfX2dldF9ibGtfbGluZV9zaXpl
KHN0cnVjdCBkNzFfZGV2ICpkNzEsIHUzMiBfX2lvbWVtICpyZWcsCisJCQkgICAgICAgdTMyIG1h
eF9kZWZhdWx0KQoreworCWlmICghZDcxLT5wZXJpcGhfYWRkcikKKwkJbWF4X2RlZmF1bHQgPSBt
YWxpZHBfcmVhZDMyKHJlZywgQkxLX01BWF9MSU5FX1NJWkUpOworCisJcmV0dXJuIG1heF9kZWZh
dWx0OworfQorCitzdGF0aWMgdTMyIGdldF9ibGtfbGluZV9zaXplKHN0cnVjdCBkNzFfZGV2ICpk
NzEsIHUzMiBfX2lvbWVtICpyZWcpCit7CisJcmV0dXJuIF9fZ2V0X2Jsa19saW5lX3NpemUoZDcx
LCByZWcsIGQ3MS0+bWF4X2xpbmVfc2l6ZSk7Cit9CisKIHN0YXRpYyB1MzIgdG9fcm90X2N0cmwo
dTMyIHJvdCkKIHsKIAl1MzIgbHJfY3RybCA9IDA7CkBAIC0zNjUsNyArMzgyLDI4IEBAIHN0YXRp
YyBpbnQgZDcxX2xheWVyX2luaXQoc3RydWN0IGQ3MV9kZXYgKmQ3MSwKIAllbHNlCiAJCWxheWVy
LT5sYXllcl90eXBlID0gS09NRURBX0ZNVF9TSU1QTEVfTEFZRVI7CiAKLQlzZXRfcmFuZ2UoJmxh
eWVyLT5oc2l6ZV9pbiwgNCwgZDcxLT5tYXhfbGluZV9zaXplKTsKKwlpZiAoIWQ3MS0+cGVyaXBo
X2FkZHIpIHsKKwkJLyogRDMyIG9yIG5ld2VyIHByb2R1Y3QgKi8KKwkJbGF5ZXItPmxpbmVfc3og
PSBtYWxpZHBfcmVhZDMyKHJlZywgQkxLX01BWF9MSU5FX1NJWkUpOworCQlsYXllci0+eXV2X2xp
bmVfc3ogPSBMX0lORk9fWVVWX01BWF9MSU5FU1oobGF5ZXJfaW5mbyk7CisJfSBlbHNlIGlmIChk
NzEtPm1heF9saW5lX3NpemUgPiAyMDQ4KSB7CisJCS8qIEQ3MSA0SyAqLworCQlsYXllci0+bGlu
ZV9zeiA9IGQ3MS0+bWF4X2xpbmVfc2l6ZTsKKwkJbGF5ZXItPnl1dl9saW5lX3N6ID0gbGF5ZXIt
PmxpbmVfc3ogLyAyOworCX0gZWxzZQl7CisJCS8qIEQ3MSAySyAqLworCQlpZiAobGF5ZXItPmxh
eWVyX3R5cGUgPT0gS09NRURBX0ZNVF9SSUNIX0xBWUVSKSB7CisJCQkvKiByaWNoIGxheWVyIGlz
IDRLIGNvbmZpZ3VyYXRpb24gKi8KKwkJCWxheWVyLT5saW5lX3N6ID0gZDcxLT5tYXhfbGluZV9z
aXplICogMjsKKwkJCWxheWVyLT55dXZfbGluZV9zeiA9IGxheWVyLT5saW5lX3N6IC8gMjsKKwkJ
fSBlbHNlIHsKKwkJCWxheWVyLT5saW5lX3N6ID0gZDcxLT5tYXhfbGluZV9zaXplOworCQkJbGF5
ZXItPnl1dl9saW5lX3N6ID0gMDsKKwkJfQorCX0KKworCXNldF9yYW5nZSgmbGF5ZXItPmhzaXpl
X2luLCA0LCBsYXllci0+bGluZV9zeik7CisKIAlzZXRfcmFuZ2UoJmxheWVyLT52c2l6ZV9pbiwg
NCwgZDcxLT5tYXhfdnNpemUpOwogCiAJbWFsaWRwX3dyaXRlMzIocmVnLCBMQVlFUl9QQUxQSEEs
IEQ3MV9QQUxQSEFfREVGX01BUCk7CkBAIC00NTYsOSArNDk0LDExIEBAIHN0YXRpYyBpbnQgZDcx
X3diX2xheWVyX2luaXQoc3RydWN0IGQ3MV9kZXYgKmQ3MSwKIAogCXdiX2xheWVyID0gdG9fbGF5
ZXIoYyk7CiAJd2JfbGF5ZXItPmxheWVyX3R5cGUgPSBLT01FREFfRk1UX1dCX0xBWUVSOworCXdi
X2xheWVyLT5saW5lX3N6ID0gZ2V0X2Jsa19saW5lX3NpemUoZDcxLCByZWcpOworCXdiX2xheWVy
LT55dXZfbGluZV9zeiA9IHdiX2xheWVyLT5saW5lX3N6OwogCi0Jc2V0X3JhbmdlKCZ3Yl9sYXll
ci0+aHNpemVfaW4sIEQ3MV9NSU5fTElORV9TSVpFLCBkNzEtPm1heF9saW5lX3NpemUpOwotCXNl
dF9yYW5nZSgmd2JfbGF5ZXItPnZzaXplX2luLCBENzFfTUlOX1ZFUlRJQ0FMX1NJWkUsIGQ3MS0+
bWF4X3ZzaXplKTsKKwlzZXRfcmFuZ2UoJndiX2xheWVyLT5oc2l6ZV9pbiwgNjQsIHdiX2xheWVy
LT5saW5lX3N6KTsKKwlzZXRfcmFuZ2UoJndiX2xheWVyLT52c2l6ZV9pbiwgNjQsIGQ3MS0+bWF4
X3ZzaXplKTsKIAogCXJldHVybiAwOwogfQpAQCAtNTk1LDggKzYzNSw4IEBAIHN0YXRpYyBpbnQg
ZDcxX2NvbXBpel9pbml0KHN0cnVjdCBkNzFfZGV2ICpkNzEsCiAKIAljb21waXogPSB0b19jb21w
aXooYyk7CiAKLQlzZXRfcmFuZ2UoJmNvbXBpei0+aHNpemUsIEQ3MV9NSU5fTElORV9TSVpFLCBk
NzEtPm1heF9saW5lX3NpemUpOwotCXNldF9yYW5nZSgmY29tcGl6LT52c2l6ZSwgRDcxX01JTl9W
RVJUSUNBTF9TSVpFLCBkNzEtPm1heF92c2l6ZSk7CisJc2V0X3JhbmdlKCZjb21waXotPmhzaXpl
LCA2NCwgZ2V0X2Jsa19saW5lX3NpemUoZDcxLCByZWcpKTsKKwlzZXRfcmFuZ2UoJmNvbXBpei0+
dnNpemUsIDY0LCBkNzEtPm1heF92c2l6ZSk7CiAKIAlyZXR1cm4gMDsKIH0KQEAgLTc1Myw3ICs3
OTMsNyBAQCBzdGF0aWMgaW50IGQ3MV9zY2FsZXJfaW5pdChzdHJ1Y3QgZDcxX2RldiAqZDcxLAog
CX0KIAogCXNjYWxlciA9IHRvX3NjYWxlcihjKTsKLQlzZXRfcmFuZ2UoJnNjYWxlci0+aHNpemUs
IDQsIDIwNDgpOworCXNldF9yYW5nZSgmc2NhbGVyLT5oc2l6ZSwgNCwgX19nZXRfYmxrX2xpbmVf
c2l6ZShkNzEsIHJlZywgMjA0OCkpOwogCXNldF9yYW5nZSgmc2NhbGVyLT52c2l6ZSwgNCwgNDA5
Nik7CiAJc2NhbGVyLT5tYXhfZG93bnNjYWxpbmcgPSA2OwogCXNjYWxlci0+bWF4X3Vwc2NhbGlu
ZyA9IDY0OwpAQCAtODYyLDcgKzkwMiw3IEBAIHN0YXRpYyBpbnQgZDcxX3NwbGl0dGVyX2luaXQo
c3RydWN0IGQ3MV9kZXYgKmQ3MSwKIAogCXNwbGl0dGVyID0gdG9fc3BsaXR0ZXIoYyk7CiAKLQlz
ZXRfcmFuZ2UoJnNwbGl0dGVyLT5oc2l6ZSwgNCwgZDcxLT5tYXhfbGluZV9zaXplKTsKKwlzZXRf
cmFuZ2UoJnNwbGl0dGVyLT5oc2l6ZSwgNCwgZ2V0X2Jsa19saW5lX3NpemUoZDcxLCByZWcpKTsK
IAlzZXRfcmFuZ2UoJnNwbGl0dGVyLT52c2l6ZSwgNCwgZDcxLT5tYXhfdnNpemUpOwogCiAJcmV0
dXJuIDA7CkBAIC05MzMsNyArOTczLDggQEAgc3RhdGljIGludCBkNzFfbWVyZ2VyX2luaXQoc3Ry
dWN0IGQ3MV9kZXYgKmQ3MSwKIAogCW1lcmdlciA9IHRvX21lcmdlcihjKTsKIAotCXNldF9yYW5n
ZSgmbWVyZ2VyLT5oc2l6ZV9tZXJnZWQsIDQsIDQwMzIpOworCXNldF9yYW5nZSgmbWVyZ2VyLT5o
c2l6ZV9tZXJnZWQsIDQsCisJCSAgX19nZXRfYmxrX2xpbmVfc2l6ZShkNzEsIHJlZywgNDAzMikp
OwogCXNldF9yYW5nZSgmbWVyZ2VyLT52c2l6ZV9tZXJnZWQsIDQsIDQwOTYpOwogCiAJcmV0dXJu
IDA7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9k
NzFfcmVncy5oIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9kNzEvZDcxX3Jl
Z3MuaAppbmRleCAyZDVlNmQwMGI0MmMuLjE3MjdkYzk5MzkwOSAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9kNzEvZDcxX3JlZ3MuaAorKysgYi9kcml2ZXJz
L2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFfcmVncy5oCkBAIC0xMCw2ICsxMCw3
IEBACiAvKiBDb21tb24gYmxvY2sgcmVnaXN0ZXJzIG9mZnNldCAqLwogI2RlZmluZSBCTEtfQkxP
Q0tfSU5GTwkJMHgwMDAKICNkZWZpbmUgQkxLX1BJUEVMSU5FX0lORk8JMHgwMDQKKyNkZWZpbmUg
QkxLX01BWF9MSU5FX1NJWkUJMHgwMDgKICNkZWZpbmUgQkxLX1ZBTElEX0lOUFVUX0lEMAkweDAy
MAogI2RlZmluZSBCTEtfT1VUUFVUX0lEMAkJMHgwNjAKICNkZWZpbmUgQkxLX0lOUFVUX0lEMAkJ
MHgwODAKQEAgLTMyMSw2ICszMjIsNyBAQAogI2RlZmluZSBMX0lORk9fUkYJCUJJVCgwKQogI2Rl
ZmluZSBMX0lORk9fQ00JCUJJVCgxKQogI2RlZmluZSBMX0lORk9fQUJVRl9TSVpFKHgpCSgoKHgp
ID4+IDQpICYgMHg3KQorI2RlZmluZSBMX0lORk9fWVVWX01BWF9MSU5FU1ooeCkJKCgoeCkgPj4g
MTYpICYgMHhGRkZGKQogCiAvKiBTY2FsZXIgcmVnaXN0ZXJzICovCiAjZGVmaW5lIFNDX0NPRUZG
VEFCCQkweDBEQwpAQCAtNDk0LDEzICs0OTYsNiBAQCBlbnVtIGQ3MV9ibGtfdHlwZSB7CiAjZGVm
aW5lIEQ3MV9ERUZBVUxUX1BSRVBSRVRDSF9MSU5FCTUKICNkZWZpbmUgRDcxX0JVU19XSURUSF8x
Nl9CWVRFUwkJMTYKIAotI2RlZmluZSBENzFfTUlOX0xJTkVfU0laRQkJNjQKLSNkZWZpbmUgRDcx
X01JTl9WRVJUSUNBTF9TSVpFCQk2NAotI2RlZmluZSBENzFfU0NfTUlOX0xJTl9TSVpFCQk0Ci0j
ZGVmaW5lIEQ3MV9TQ19NSU5fVkVSVElDQUxfU0laRQk0Ci0jZGVmaW5lIEQ3MV9TQ19NQVhfTElO
X1NJWkUJCTIwNDgKLSNkZWZpbmUgRDcxX1NDX01BWF9WRVJUSUNBTF9TSVpFCTQwOTYKLQogI2Rl
ZmluZSBENzFfU0NfTUFYX1VQU0NBTElORwkJNjQKICNkZWZpbmUgRDcxX1NDX01BWF9ET1dOU0NB
TElORwkJNgogI2RlZmluZSBENzFfU0NfU1BMSVRfT1ZFUkxBUAkJOApkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmUuaCBiL2RyaXZl
cnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BpcGVsaW5lLmgKaW5kZXggOTEw
ZDI3OWFlNDhkLi45MmFiYTU4Y2UyYTUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0v
ZGlzcGxheS9rb21lZGEva29tZWRhX3BpcGVsaW5lLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2Fy
bS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmUuaApAQCAtMjI3LDYgKzIyNyw4IEBAIHN0
cnVjdCBrb21lZGFfbGF5ZXIgewogCS8qIGFjY2VwdGVkIGgvdiBpbnB1dCByYW5nZSBiZWZvcmUg
cm90YXRpb24gKi8KIAlzdHJ1Y3QgbWFsaWRwX3JhbmdlIGhzaXplX2luLCB2c2l6ZV9pbjsKIAl1
MzIgbGF5ZXJfdHlwZTsgLyogUklDSCwgU0lNUExFIG9yIFdCICovCisJdTMyIGxpbmVfc3o7CisJ
dTMyIHl1dl9saW5lX3N6OyAvKiBtYXhpbXVtIGxpbmUgc2l6ZSBmb3IgWVVWNDIyIGFuZCBZVVY0
MjAgKi8KIAl1MzIgc3VwcG9ydGVkX3JvdHM7CiAJLyoga29tZWRhIHN1cHBvcnRzIGxheWVyIHNw
bGl0IHdoaWNoIHNwbGl0cyBhIHdob2xlIGltYWdlIHRvIHR3byBwYXJ0cwogCSAqIGxlZnQgYW5k
IHJpZ2h0IGFuZCBoYW5kbGUgdGhlbSBieSB0d28gaW5kaXZpZHVhbCBsYXllciBwcm9jZXNzb3Jz
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9w
aXBlbGluZV9zdGF0ZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21l
ZGFfcGlwZWxpbmVfc3RhdGUuYwppbmRleCA1NTI2NzMxZjVhMzMuLjZkZjQ0MjY2NmNmZSAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxp
bmVfc3RhdGUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVk
YV9waXBlbGluZV9zdGF0ZS5jCkBAIC0yODUsNiArMjg1LDcgQEAga29tZWRhX2xheWVyX2NoZWNr
X2NmZyhzdHJ1Y3Qga29tZWRhX2xheWVyICpsYXllciwKIAkJICAgICAgIHN0cnVjdCBrb21lZGFf
ZGF0YV9mbG93X2NmZyAqZGZsb3cpCiB7CiAJdTMyIHNyY194LCBzcmNfeSwgc3JjX3csIHNyY19o
OworCXUzMiBsaW5lX3N6LCBtYXhfbGluZV9zejsKIAogCWlmICgha29tZWRhX2ZiX2lzX2xheWVy
X3N1cHBvcnRlZChrZmIsIGxheWVyLT5sYXllcl90eXBlLCBkZmxvdy0+cm90KSkKIAkJcmV0dXJu
IC1FSU5WQUw7CkBAIC0zMTQsNiArMzE1LDIyIEBAIGtvbWVkYV9sYXllcl9jaGVja19jZmcoc3Ry
dWN0IGtvbWVkYV9sYXllciAqbGF5ZXIsCiAJCXJldHVybiAtRUlOVkFMOwogCX0KIAorCWlmIChk
cm1fcm90YXRpb25fOTBfb3JfMjcwKGRmbG93LT5yb3QpKQorCQlsaW5lX3N6ID0gZGZsb3ctPmlu
X2g7CisJZWxzZQorCQlsaW5lX3N6ID0gZGZsb3ctPmluX3c7CisKKwlpZiAoa2ZiLT5iYXNlLmZv
cm1hdC0+aHN1YiA+IDEpCisJCW1heF9saW5lX3N6ID0gbGF5ZXItPnl1dl9saW5lX3N6OworCWVs
c2UKKwkJbWF4X2xpbmVfc3ogPSBsYXllci0+bGluZV9zejsKKworCWlmIChsaW5lX3N6ID4gbWF4
X2xpbmVfc3opIHsKKwkJRFJNX0RFQlVHX0FUT01JQygiUmVxdWlyZWQgbGluZV9zejogJWQgZXhj
ZWVkcyB0aGUgbWF4IHNpemUgJWRcbiIsCisJCQkJIGxpbmVfc3osIG1heF9saW5lX3N6KTsKKwkJ
cmV0dXJuIC1FSU5WQUw7CisJfQorCiAJcmV0dXJuIDA7CiB9CiAKLS0gCjIuMTcuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
