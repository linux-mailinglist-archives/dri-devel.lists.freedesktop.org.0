Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD5C109ED3
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 14:16:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC2696E32A;
	Tue, 26 Nov 2019 13:16:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50056.outbound.protection.outlook.com [40.107.5.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBFDD6E313
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2019 13:16:15 +0000 (UTC)
Received: from DB6PR0802CA0029.eurprd08.prod.outlook.com (2603:10a6:4:a3::15)
 by AM6PR08MB3365.eurprd08.prod.outlook.com (2603:10a6:20b:42::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.21; Tue, 26 Nov
 2019 13:16:12 +0000
Received: from AM5EUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::201) by DB6PR0802CA0029.outlook.office365.com
 (2603:10a6:4:a3::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.17 via Frontend
 Transport; Tue, 26 Nov 2019 13:16:12 +0000
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT061.mail.protection.outlook.com (10.152.16.247) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.17 via Frontend Transport; Tue, 26 Nov 2019 13:16:12 +0000
Received: ("Tessian outbound 37db47aaea47:v33");
 Tue, 26 Nov 2019 13:16:12 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: fb2c35bb90e50a6d
X-CR-MTA-TID: 64aa7808
Received: from c7042a58f532.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.14.55]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 AF1CAC6A-F64B-481F-A03C-4766F511FEA1.1; 
 Tue, 26 Nov 2019 13:16:06 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2055.outbound.protection.outlook.com [104.47.14.55])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c7042a58f532.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 26 Nov 2019 13:16:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FimEEE1tbvB66/ZOYLl5BWXl3HPDaRfQK2Qa+X7Ua2KktSlaONXKwsTuPgNJcXpfqQ+XVWrpCTO8hyR9R/80HhqjRj57sKhOr9JuYFPCvUCze8JTCqu8utnUJFxyB+Kt51gBzbyP0BZlXZ7wSCZcJEBJRq2pcQlczcRLSS7zwyc9d4NOc35YStwUsN5bhhUQ8BYzpZuQs+raypFxoXbo9/kLOlqg8e0jasuqE8yeHb3bYLGeI6VkgTrB71bPuaRR2FSEDZKMM09UsQj8LNo5siQw2JBss1tNTlg78jH/csNB8OD+SmrwMEe0jI/EnCHGGEft9FEmBkPpEqHRSJtacw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E+gIcXwMEpaWbNQmu/uXel91VQjEKWqcp2Xv7hI8VDc=;
 b=mr+qrzyA4hGy/Zwn+QwxOBZEiNqGk951PBEkAcpZ4NP0z3DRWq67MZtv75AlR7r7GRqOv8/ib8cfPgpeTusNs2qF/6J9QnCvL9P+ApyYw6Op4Bk/qhu8G0KJ1ywHpU2HDJxDdfCkCGTC02pho+5qgDThAEKz1tSUjlmCqYnlHUwpH3BU3kzZ9Jwj8fBeLxmVzhnuEzNAu9ee9FeSjPaWB9sRsXdVIktaCufzK2Wl3yqScGMXEJfWncl3/vjVg16D0cdjQKJBYmVPXyADWqZdnNicX9wHPESG+Z294kTMdDcOROm5VHZmj/JpoC5/oDEyt+xojVvhXv8gulpfFL+NVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB4317.eurprd08.prod.outlook.com (20.179.28.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.16; Tue, 26 Nov 2019 13:16:05 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d%3]) with mapi id 15.20.2474.023; Tue, 26 Nov 2019
 13:16:05 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH 07/30] drm/bridge: lvds-encoder: Use drm_bridge_init()
Thread-Topic: [PATCH 07/30] drm/bridge: lvds-encoder: Use drm_bridge_init()
Thread-Index: AQHVpFuoYtFUOEB7u0KcxEc0nk9UCg==
Date: Tue, 26 Nov 2019 13:16:05 +0000
Message-ID: <20191126131541.47393-8-mihail.atanassov@arm.com>
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
X-MS-Office365-Filtering-Correlation-Id: a1b9d043-6883-4f0e-43dd-08d77272cf20
X-MS-TrafficTypeDiagnostic: VI1PR08MB4317:|VI1PR08MB4317:|AM6PR08MB3365:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB336527B5D4C5FF184015B9D58F450@AM6PR08MB3365.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:6790;OLM:6790;
x-forefront-prvs: 0233768B38
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(1496009)(4636009)(39860400002)(366004)(346002)(376002)(136003)(396003)(189003)(199004)(5640700003)(86362001)(6512007)(71200400001)(2616005)(6486002)(71190400001)(2906002)(4326008)(6916009)(44832011)(446003)(11346002)(54906003)(66946007)(316002)(66446008)(64756008)(66556008)(66476007)(6436002)(4744005)(8936002)(186003)(26005)(5660300002)(102836004)(305945005)(14454004)(25786009)(99286004)(81166006)(50226002)(478600001)(2501003)(7736002)(6116002)(2351001)(76176011)(1076003)(52116002)(66066001)(256004)(5024004)(8676002)(81156014)(6506007)(3846002)(386003)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB4317;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: eD2mrTiLuGPjRqn5B4LlmZzN/gDFoYOWa65eBY4sekXK5BeFwci8RRQM0L4HWXAyx3NpJGtR9Aa0lxiAZyMiRbKKy3CNYXKJ9YKY6BIP4Lz01Xvpfri/lOq5uC9LCsRE7dveF1I9vPKnegc/4zA3etYhlZi/kXPUIjJ+yMwyTJDy2lFBmpTTWSwDDKot/T6FkuWEJcFKMEMBPesYoKtVMsXhv3FGDtVntZ6/vsbyeFdUJQVX1mXcMM2P7wkxL2SF7eZiKQsU09gaSk7Ell7DFvKT0GPyDkYaKnYQvMFMViXHasuKiVOhL8ZO+mCXyOBarINpFCkFDaLpswkrQYHuzjBu0qNS7PZRjuaN1h2tLN9iseou2Ovx+qd4yFhthIEazdM/VJ6wI8UiQsbnsWXs++oGM/DjH2hnmM2h1E8kQ5IMpuGraifa6NVaAjsjP5qt
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4317
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(346002)(136003)(39860400002)(199004)(189003)(76130400001)(6486002)(102836004)(81166006)(54906003)(25786009)(36906005)(316002)(8746002)(356004)(14454004)(26005)(2906002)(8676002)(81156014)(478600001)(8936002)(36756003)(106002)(5024004)(66066001)(2351001)(47776003)(4326008)(107886003)(26826003)(99286004)(6512007)(76176011)(6916009)(386003)(6506007)(2501003)(5640700003)(23756003)(50466002)(2616005)(446003)(11346002)(86362001)(1076003)(5660300002)(50226002)(70586007)(70206006)(336012)(22756006)(6116002)(3846002)(7736002)(305945005)(186003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB3365;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 35d4a9cc-2d83-438a-2535-08d77272cad9
NoDisclaimer: True
X-Forefront-PRVS: 0233768B38
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lSz8OTw67qecaPtTDKx6CrnFRXtzCXjQZlG9zyudeNweLXDRtKfBFGSderW9MmhGudlsvephqS0nRweSDnXsJLY8srjgvYisuqu8WDr2u/9cBCcmdx1sOiedh1acIR8dMRhDKiXReNYGDDOpZe5dwgyqk5Zoh/TYNsrjKBW2I5RezTS55RhXLNGJDR74hScomSfv2moqJXwCS0c8/EthclObaVdYiknhSsg24u3dpEfE7gpi1LRl/ohSi8YspFY2MGRXe9u7oI8w0ERobcLMIcZKV7D00O17jFOSRoizv0xI8eq7xlTN/1isA5JSQQ2b1SoMnjO+VAmF915BFDEcWIS7npBg1sOOFPYWUWLOJvVFIbptPNO2reuu8nRxIPhzUNY7K+LA2/ykKb2onX2XHJgCwxX23VPOoUYVpmZqyiu/b6tRcBohM2AQJ3m0Ed6S
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2019 13:16:12.2440 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1b9d043-6883-4f0e-43dd-08d77272cf20
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3365
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E+gIcXwMEpaWbNQmu/uXel91VQjEKWqcp2Xv7hI8VDc=;
 b=xih1U9gI8sNryTEKsTyCueacJPhIOw/hONsM1qZz6so24onz6etOjL7teYZuMiy0lzPrmfKBv21NA0ot8YCBXdWqkal2LVY77u1EEE4RBwyDzSnqItNXBaXgP6/rXWAGKpOGTVWDfxTqlBsRBV8MWWYFqVx4VbYj0FZF7aKmlA4=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E+gIcXwMEpaWbNQmu/uXel91VQjEKWqcp2Xv7hI8VDc=;
 b=xih1U9gI8sNryTEKsTyCueacJPhIOw/hONsM1qZz6so24onz6etOjL7teYZuMiy0lzPrmfKBv21NA0ot8YCBXdWqkal2LVY77u1EEE4RBwyDzSnqItNXBaXgP6/rXWAGKpOGTVWDfxTqlBsRBV8MWWYFqVx4VbYj0FZF7aKmlA4=
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Mihail Atanassov <Mihail.Atanassov@arm.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm8gZnVuY3Rpb25hbCBjaGFuZ2UuCgpTaWduZWQtb2ZmLWJ5OiBNaWhhaWwgQXRhbmFzc292IDxt
aWhhaWwuYXRhbmFzc292QGFybS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9sdmRz
LWVuY29kZXIuYyB8IDcgKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwg
NCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2x2ZHMt
ZW5jb2Rlci5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9sdmRzLWVuY29kZXIuYwppbmRleCBl
MjEzMmE4ZDUxMDYuLjE1NTQwNjUxMDQxNiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Jy
aWRnZS9sdmRzLWVuY29kZXIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2x2ZHMtZW5j
b2Rlci5jCkBAIC0xMTIsMTEgKzExMiwxMCBAQCBzdGF0aWMgaW50IGx2ZHNfZW5jb2Rlcl9wcm9i
ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCQlyZXR1cm4gUFRSX0VSUihsdmRzX2Vu
Y29kZXItPnBhbmVsX2JyaWRnZSk7CiAKIAkvKiBUaGUgcGFuZWxfYnJpZGdlIGJyaWRnZSBpcyBh
dHRhY2hlZCB0byB0aGUgcGFuZWwncyBvZl9ub2RlLAotCSAqIGJ1dCB3ZSBuZWVkIGEgYnJpZGdl
IGF0dGFjaGVkIHRvIG91ciBvZl9ub2RlIGZvciBvdXIgdXNlcgotCSAqIHRvIGxvb2sgdXAuCisJ
ICogYnV0IHdlIG5lZWQgYSBicmlkZ2UgYXR0YWNoZWQgdG8gb3VyIG9mX25vZGUgKGluIGRldi0+
b2Zfbm9kZSkKKwkgKiBmb3Igb3VyIHVzZXIgdG8gbG9vayB1cC4KIAkgKi8KLQlsdmRzX2VuY29k
ZXItPmJyaWRnZS5vZl9ub2RlID0gZGV2LT5vZl9ub2RlOwotCWx2ZHNfZW5jb2Rlci0+YnJpZGdl
LmZ1bmNzID0gJmZ1bmNzOworCWRybV9icmlkZ2VfaW5pdCgmbHZkc19lbmNvZGVyLT5icmlkZ2Us
IGRldiwgJmZ1bmNzLCBOVUxMLCBOVUxMKTsKIAlkcm1fYnJpZGdlX2FkZCgmbHZkc19lbmNvZGVy
LT5icmlkZ2UpOwogCiAJcGxhdGZvcm1fc2V0X2RydmRhdGEocGRldiwgbHZkc19lbmNvZGVyKTsK
LS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
