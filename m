Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC8DFA02A
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 02:31:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 816566E0BE;
	Wed, 13 Nov 2019 01:31:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150040.outbound.protection.outlook.com [40.107.15.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 794A66E0BE
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 01:31:51 +0000 (UTC)
Received: from DB6PR0801CA0045.eurprd08.prod.outlook.com (2603:10a6:4:2b::13)
 by AM0PR08MB4963.eurprd08.prod.outlook.com (2603:10a6:208:159::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2430.22; Wed, 13 Nov
 2019 01:31:48 +0000
Received: from AM5EUR03FT056.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::207) by DB6PR0801CA0045.outlook.office365.com
 (2603:10a6:4:2b::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2430.22 via Frontend
 Transport; Wed, 13 Nov 2019 01:31:48 +0000
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT056.mail.protection.outlook.com (10.152.17.224) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2430.21 via Frontend Transport; Wed, 13 Nov 2019 01:31:48 +0000
Received: ("Tessian outbound 0cf06bf5c60e:v33");
 Wed, 13 Nov 2019 01:31:47 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 073bf625c0848a69
X-CR-MTA-TID: 64aa7808
Received: from 3a6e1fc25020.2 (cr-mta-lb-1.cr-mta-net [104.47.6.59])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 57701F1F-4423-470D-B315-3CECC0B652FB.1; 
 Wed, 13 Nov 2019 01:31:42 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2059.outbound.protection.outlook.com [104.47.6.59])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3a6e1fc25020.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 13 Nov 2019 01:31:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jhOc0whresK85hSO4GfRa7oU0RZ+D6d6uKKJEtM1VARYyxrkK2XqwAgHrLLsSyNLfkmECH4L1jby+m0+d1Qt5rEY7cJIXyg8ri7eJirry+VtQnSYzqBcogJlcwHpf+lzWSz2tUQPRVGdg3++vk4TpCe7aUSqr6ngqa/r9oBF/4u9hu8bZDlR5cmooLW4r90kOixCjO1ab0pdvb5PwYPi2RbJnoD/3cl//roJrDUSxd6QrlPlKA5L8//wu0qo+k1ZZrFDIMTWFWx+YHt/S3YMhzuFFOqoYi2zOZ6prFd+fXBnR+nfYl4395ldxPSaJmSfgN50wCp6hsxLOtC+cu2Iww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Nyx0rS85HVXh2e9/mWrIwZooFHXGSUXUSNOu3h/ruE=;
 b=D+iZlLfgkNkB9oGN1uHXe59fYv1sAADb+Eog8c/r1JofGZdrM3Fq7xJFuP8FRcDnMFqGUxd3tolMC0OVafoFMsuAdxI4xuYQvb3hkMjRdksQk4G3DxALIUwM9a9b/aEvMXbTT6LwfXUINbSK2OW/umqvocIvvUCKsLnUYwhksLceQZhmdPm98X//p2RLX/rC3BVRbDe2x/iLK2FsQIQy2ajZtHDiRI2YSs9ACLoiirqc+QjzMiOqY51R6BXJ2JXhj1uDMfOYg8id8zuYLXEaNV/AogLqK3p4fXsun5ONhXHy/o51PcP05JNzk6Ys30cAGJWXnEUBsfKBEHKf+Jdn2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB5085.eurprd08.prod.outlook.com (20.179.29.207) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.23; Wed, 13 Nov 2019 01:31:37 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a809:417a:faf3:61a7]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a809:417a:faf3:61a7%6]) with mapi id 15.20.2451.023; Wed, 13 Nov 2019
 01:31:37 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: "airlied@linux.ie" <airlied@linux.ie>, "daniel@ffwll.ch"
 <daniel@ffwll.ch>, "sean@poorly.run" <sean@poorly.run>, Mihail Atanassov
 <Mihail.Atanassov@arm.com>
Subject: [PATCH] drm/komeda: Fix komeda driver build error
Thread-Topic: [PATCH] drm/komeda: Fix komeda driver build error
Thread-Index: AQHVmcIXdL7uHyjPDkKsAqgwFS9XVQ==
Date: Wed, 13 Nov 2019 01:31:37 +0000
Message-ID: <20191113013114.3013-1-james.qian.wang@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR02CA0188.apcprd02.prod.outlook.com
 (2603:1096:201:21::24) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 715c1152-1dde-43f7-16f6-08d767d94063
X-MS-TrafficTypeDiagnostic: VE1PR08MB5085:|VE1PR08MB5085:|AM0PR08MB4963:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM0PR08MB4963DD74FCF7CC1B54E3C253B3760@AM0PR08MB4963.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:298;OLM:298;
x-forefront-prvs: 0220D4B98D
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(39860400002)(136003)(366004)(396003)(189003)(199004)(486006)(476003)(36756003)(66476007)(256004)(64756008)(66556008)(386003)(2616005)(50226002)(26005)(8936002)(6506007)(55236004)(102836004)(66946007)(52116002)(186003)(8676002)(81156014)(81166006)(103116003)(5660300002)(66446008)(66066001)(4744005)(71190400001)(71200400001)(1076003)(2906002)(6116002)(3846002)(6486002)(6436002)(2201001)(86362001)(54906003)(110136005)(316002)(2501003)(99286004)(14454004)(478600001)(6636002)(6512007)(25786009)(305945005)(7736002)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB5085;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: jON7GbO34HfmCsvwcy2GlIDBfq4YuBr+VJLNUzuEMDupcnGHVJ7ByroicsraCUrcNuLhaYu4TbBeGFV9DtNu1lqPDmqwTUNS9qRp9z+a3dcNDX4HhXkTBWuFag3H6xJEm4UVVOqzBmM/8Sd1cPja5Ua/OieCR0Tf1gxBW8s6YbwZ2PDz83jLbQt8FxI+F6Ov8Eyx45E2QyfpvcHLBR4Pr4w99EJ4Kzju6EuPXPeFWTfvKsz/6lb5KcQZIp/QlZbJg50lGP9Rkq5Wzq7heOl/kgk0qdVBKUhzEsLawRYF9qB0LCTHQ7c8soM29zBFGZWnLtlRj/bxQq+mf9z+K/Y0jBVfSfgnAJQRcFhfS1+S3KXyuUfN1f3LadpIn0i5+w0riEBS5iqd/q2chACbonz0H+2lQyOSIB4IASXBFIYqyJF0nsngTa/zQJoueCulCL1L
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5085
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(136003)(396003)(346002)(1110001)(339900001)(199004)(189003)(6512007)(4744005)(2501003)(7736002)(305945005)(102836004)(478600001)(105606002)(1076003)(36906005)(86362001)(6506007)(386003)(6116002)(26826003)(3846002)(26005)(2616005)(476003)(356004)(2906002)(336012)(14454004)(186003)(50466002)(5660300002)(6636002)(22756006)(50226002)(36756003)(126002)(2201001)(70206006)(70586007)(4326008)(6486002)(99286004)(8676002)(25786009)(8746002)(8936002)(81166006)(81156014)(110136005)(54906003)(76130400001)(23756003)(103116003)(47776003)(486006)(66066001)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB4963;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Fail; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 621a7c9e-51bc-4398-4b1f-08d767d939c0
NoDisclaimer: True
X-Forefront-PRVS: 0220D4B98D
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rKsjtoNYUeh0AyYsymF04KgLsruiSLNBzqvnBr7EOupEIbQU70t3QeUpxVECp55QPSLgkFDtGi3Jojg994BIq98dVz5Jthj/4448MJ2eEhKKbsX0Me2ALuDk2pj5vs1d57Xt70vm4asa7T8EqfjpbCFioyVgQBHL3elO148OPXl8IPomC5iCixWA8ul0xBZvIHsHp0v6ScBe3QhMQcphYkN6JGHVTAG2sLTBsyQrTxJ1E0arM1ZmXYbjPmGB8Ui1+TlPG/qhiA2SkMiRGpxZCK9SZ1zPu9yDljPqYhuYRAauVyVCMdlCUZHB8Vgt/WM2M4aipcNG6ZyfhGn9hs4vMBG42BY0lryZRcqrdN8Ml83sgUHAZ34HZcwi8nV+YJljVOJ0vQ1eknfVtNO2r3WII2g4lEkzCEPdeM+Mjwcmi4RbEvAhEvo0A5PNnTKPBnYY
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2019 01:31:48.1333 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 715c1152-1dde-43f7-16f6-08d767d94063
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4963
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Nyx0rS85HVXh2e9/mWrIwZooFHXGSUXUSNOu3h/ruE=;
 b=Iw8NhmlgdkHi0CXv/C7ypGG6SzX7HdL9nB71Ee9UQ+eUlSBNzaqW85Lz0FcNOTdEoObh1RIsNWKh3wz/Zou0g7QuypT7g/TUI8Fg+giWLkOTjQ0YLR+3Usw5c3QSdIhWk75CxJOS9oqLzqRzsdygRwd2pnhV1aoFSDLn6HtzfXI=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Nyx0rS85HVXh2e9/mWrIwZooFHXGSUXUSNOu3h/ruE=;
 b=Iw8NhmlgdkHi0CXv/C7ypGG6SzX7HdL9nB71Ee9UQ+eUlSBNzaqW85Lz0FcNOTdEoObh1RIsNWKh3wz/Zou0g7QuypT7g/TUI8Fg+giWLkOTjQ0YLR+3Usw5c3QSdIhWk75CxJOS9oqLzqRzsdygRwd2pnhV1aoFSDLn6HtzfXI=
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
Cc: nd <nd@arm.com>,
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4IHRoZSBidWlsZCBlcnJvcnMgbGVhZCBieQoKJ2NvbW1pdCA0MDM5ZjAyOTNiYmQgKCJkcm0v
a29tZWRhOiBBZGQgb3B0aW9uIHRvIHByaW50IFdBUk4tIGFuZCBJTkZPLWxldmVsIElSUSBldmVu
dHMiKScKClNpZ25lZC1vZmYtYnk6IGphbWVzIHFpYW4gd2FuZyAoQXJtIFRlY2hub2xvZ3kgQ2hp
bmEpIDxqYW1lcy5xaWFuLndhbmdAYXJtLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYXJtL2Rp
c3BsYXkva29tZWRhL2tvbWVkYV9kZXYuaCB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYuaCBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlz
cGxheS9rb21lZGEva29tZWRhX2Rldi5oCmluZGV4IDE1ZjUyZTMwNGMwOC4uZDQwNmE0ZDgzMzUy
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9k
ZXYuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYu
aApAQCAtNTEsMTIgKzUxLDEyIEBACiAKICNkZWZpbmUgS09NRURBX1dBUk5fRVZFTlRTCUtPTUVE
QV9FUlJfQ1NDRQogCi0jZGVmaW5lIEtPTUVEQV9JTkZPX0VWRU5UUyAoezAgXAorI2RlZmluZSBL
T01FREFfSU5GT19FVkVOVFMgKDAgXAogCQkJICAgIHwgS09NRURBX0VWRU5UX1ZTWU5DIFwKIAkJ
CSAgICB8IEtPTUVEQV9FVkVOVF9GTElQIFwKIAkJCSAgICB8IEtPTUVEQV9FVkVOVF9FT1cgXAog
CQkJICAgIHwgS09NRURBX0VWRU5UX01PREUgXAotCQkJICAgIH0pCisJCQkgICAgKQogCiAvKiBt
YWxpZHAgZGV2aWNlIGlkICovCiBlbnVtIHsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
