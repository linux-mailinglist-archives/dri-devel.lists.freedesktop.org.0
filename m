Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B93E8109C9D
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 11:54:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDCBF6E081;
	Tue, 26 Nov 2019 10:54:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60086.outbound.protection.outlook.com [40.107.6.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C6AB6E081
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2019 10:54:47 +0000 (UTC)
Received: from VI1PR08CA0135.eurprd08.prod.outlook.com (2603:10a6:800:d5::13)
 by AM0PR08MB3523.eurprd08.prod.outlook.com (2603:10a6:208:dd::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.17; Tue, 26 Nov
 2019 10:54:44 +0000
Received: from AM5EUR03FT054.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::201) by VI1PR08CA0135.outlook.office365.com
 (2603:10a6:800:d5::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.16 via Frontend
 Transport; Tue, 26 Nov 2019 10:54:44 +0000
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT054.mail.protection.outlook.com (10.152.16.212) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.17 via Frontend Transport; Tue, 26 Nov 2019 10:54:44 +0000
Received: ("Tessian outbound af6b7800e6cb:v33");
 Tue, 26 Nov 2019 10:54:44 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7ef36c54749ed1a5
X-CR-MTA-TID: 64aa7808
Received: from b7975cfa7963.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.12.57]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E951E974-0CD1-440B-B775-E251B687E412.1; 
 Tue, 26 Nov 2019 10:54:39 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2057.outbound.protection.outlook.com [104.47.12.57])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b7975cfa7963.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 26 Nov 2019 10:54:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lt/O2Ubn2uOMXEWyXVFp86QQAezwGbk5VOJ3USWT+BbB14f/8q61G3ei+okv/ZpqcMu6YxNhJQMouABg+RkEAqlv96EkfBqgYpb9AoUDvEh5o9Erypg72bsBIF5zooRWOHKwzFKtb7R4F6NyLdq4jes9qd0MQPiXRCWILMIG2OtFFj3L6obylt5iz7gNevzlxtyrFQDmykoBmzOxnhyr7bivzin9uPL3KyJvqAIWhrWahb2I8xUKl4UIMRjo+dnEUr1gNWpPxCeuBOtCMUVIKkFcTRWKr+h3OWJRJKNQBBq5gTh0fcs2mC+6DL0lNgSgrPdu2qEiveGanC8hIS/NEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ozdwu5i3/hwWTAt2jMApdS4K4ThKMteeTtH1N/yWWTs=;
 b=gXapGLO/KPrVt/9tEpz2ROrCvXV0PGI0Q+RDZgH/6bXQnOK5OLZFtbERZi1d+DSoHvnilKPAjK+Saiyim/CSkRAuR/1ERA4LKe4jUnyxJg9Oio/6158SPt0nja4v9flqYoTKebkl6Cbd5ybDxylnToC2ZgPVR+fLG78uXrgg9r5hWeMAliEeFq+53sWU8/a6ViAnF+omj+73BX3RX88CeTFuWG8sEMQPtL7FzOutmEqeO/EuODoLscUzTAjoqioCXSiIqdSLRcz7pI7btdMCp/cB4cHfzm7MLnX7GXxRqVzXG+nhO/rd8WyZCsjt3fD7JIbrYtI/tRY8pM0AFIH0iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4703.eurprd08.prod.outlook.com (10.255.27.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.21; Tue, 26 Nov 2019 10:54:36 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a809:417a:faf3:61a7]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a809:417a:faf3:61a7%6]) with mapi id 15.20.2474.023; Tue, 26 Nov 2019
 10:54:36 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "airlied@linux.ie" <airlied@linux.ie>, 
 Brian Starkey <Brian.Starkey@arm.com>, Mihail Atanassov
 <Mihail.Atanassov@arm.com>
Subject: [PATCH v1 0/2] drm/komeda: refactor sysfs node "config_id"
Thread-Topic: [PATCH v1 0/2] drm/komeda: refactor sysfs node "config_id"
Thread-Index: AQHVpEfkVwoT4/6XW0a9YqN6H1cykw==
Date: Tue, 26 Nov 2019 10:54:36 +0000
Message-ID: <20191126105412.5978-1-james.qian.wang@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR0302CA0010.apcprd03.prod.outlook.com
 (2603:1096:202::20) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 33237a28-2e28-4c63-c45c-08d7725f0bfb
X-MS-TrafficTypeDiagnostic: VE1PR08MB4703:|VE1PR08MB4703:|AM0PR08MB3523:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM0PR08MB3523C860FF3E66EE886EFF6CB3450@AM0PR08MB3523.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:1332;OLM:1332;
x-forefront-prvs: 0233768B38
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(376002)(366004)(396003)(136003)(199004)(189003)(2616005)(6436002)(71190400001)(71200400001)(50226002)(6486002)(3846002)(6116002)(103116003)(36756003)(5660300002)(7736002)(6512007)(1076003)(305945005)(4744005)(66476007)(66946007)(99286004)(66446008)(64756008)(66556008)(102836004)(8676002)(66066001)(86362001)(54906003)(81166006)(81156014)(52116002)(110136005)(316002)(2501003)(14454004)(478600001)(186003)(26005)(25786009)(4326008)(386003)(6506007)(6636002)(8936002)(55236004)(2906002)(256004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4703;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 9hfIXGC4JHtkDXH1pnml1jX6iSmZHThJfvopKj8JwpG4iJLyGHjQFzZZoRx0OlWZYr0xhEw5AH2g8z0UGkUb1fmh2NiFY8Mvu5TjDJf4Pc91dvmXZMiZxmsQ5vfc2quKeckAgrqhNatz4MQYLbP8rXvj6EVsWtwNgryAZCyaA5IlvZTpJU/+pTRI/AHqCnNSgIuI9bRGBUbhDu1UNXSncCpMUyky/qxHMJ/UNPqSTCQVLVxVtBIX0Wv6g1uoPm+dxRZRixx6G6661JyYyaTSINrv3hcegJdtKU3aecbULVi3regCdb64jcHgCGRkumf/ess+Hw+MgOcvCRHEsXjo81yVEiDYGPm4aC1azVNphJaOVfmI4D6u3KT7s3bUigkcioR7xMDxyzFyxiNRNvbE0JVzj4/JkNu2gxY9ub9azCNsO2HkpD1cK5PN3ST7wNFI
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4703
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(136003)(346002)(39860400002)(199004)(189003)(103116003)(5660300002)(356004)(7736002)(305945005)(26826003)(3846002)(478600001)(36756003)(6486002)(25786009)(6116002)(76130400001)(23756003)(316002)(110136005)(36906005)(50466002)(2501003)(99286004)(14454004)(1076003)(106002)(2906002)(4744005)(26005)(186003)(6506007)(81166006)(81156014)(6636002)(386003)(8676002)(4326008)(6512007)(50226002)(22756006)(66066001)(102836004)(8746002)(70206006)(70586007)(336012)(47776003)(8936002)(86362001)(2616005)(54906003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB3523;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 4af862b8-8b87-4f70-d283-08d7725f06b1
NoDisclaimer: True
X-Forefront-PRVS: 0233768B38
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jnNh+pJHu9Vd1OuOshIZKCWGIVWYX9Ua1NeWaJTGl+xXpP8yU+sun6OIBnz+br67/lwsxpHix6G8jtMK8FC6PAQnexe42H4km8siBm8Fv5bNK1pevQFTIeYhPM8+HpFqJheHlDyiu8DYAYyWgwbbdwwpWHgeb5ATuJT9E97HPMLnFuBIk0+hM7AxguIjw8fvPufFRCw22AOwPEch+khc0Jouvz8sP9TeF+Q4HfXlGSESPJi5hl0ShNHkB5qT4D58yU8bnG3LcTKozwV7BOSvMR5yUgGv3D7U6KeefOFmGx3zx059VmcEMnscT8xH+clbrDh03Ar5u3YD84e9jLWyPG/zzzVXf7ooml4vpc8UTquvvvjUdwNt6y9ciuu426T3guO+tvxN83RJiY5wEou7SG7TrVLYjvag37y4gViCJFi3Bz4gpvjQqiQiRDEmycTj
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2019 10:54:44.4122 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 33237a28-2e28-4c63-c45c-08d7725f0bfb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3523
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ozdwu5i3/hwWTAt2jMApdS4K4ThKMteeTtH1N/yWWTs=;
 b=r9QLvUdFX3j5mLXDaxEkqwt/YpEaP/maOapu3XHdWvLF4syT/7Z88GzYA0kdl4cUuxuIds9W46/bTAczWIhb4PxgYk+zr2Dk1LNVhgGnsx64NkX+IBZmFWPCK4TphjBsOcxRJpGqLxrVsPelF3IE5TtmU1XhX0t7UBtPS2TeKwo=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ozdwu5i3/hwWTAt2jMApdS4K4ThKMteeTtH1N/yWWTs=;
 b=r9QLvUdFX3j5mLXDaxEkqwt/YpEaP/maOapu3XHdWvLF4syT/7Z88GzYA0kdl4cUuxuIds9W46/bTAczWIhb4PxgYk+zr2Dk1LNVhgGnsx64NkX+IBZmFWPCK4TphjBsOcxRJpGqLxrVsPelF3IE5TtmU1XhX0t7UBtPS2TeKwo=
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

U3BsaXQgc3lzZnMgbm9kZSAiY29uZmlnX2lkIiB0byBtdWx0aXBsZSBmaWxlcy4KCkphbWVzIFFp
YW4gV2FuZyAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpICgyKToKICBkcm0va29tZWRhOiBBZGQgYSBu
ZXcgZmlsZSBrb21lZGFfc3lzZnMuYwogIGRybS9rb21lZGE6IFJlZmFjdG9yIHN5c2ZzIG5vZGUg
ImNvbmZpZ19pZCIKCiAuLi4vZHJtL2FybS9kaXNwbGF5L2luY2x1ZGUvbWFsaWRwX3Byb2R1Y3Qu
aCAgfCAgMTMgLS0KIGRyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEvTWFrZWZpbGUg
ICB8ICAgMSArCiAuLi4vZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rldi5jICAg
fCAgNjEgKy0tLS0tLS0tCiAuLi4vZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rl
di5oICAgfCAgIDMgKwogLi4uL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9zeXNm
cy5jIHwgMTI1ICsrKysrKysrKysrKysrKysrKwogNSBmaWxlcyBjaGFuZ2VkLCAxMzIgaW5zZXJ0
aW9ucygrKSwgNzEgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUv
ZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfc3lzZnMuYwoKLS0KMi4yMC4xCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
