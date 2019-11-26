Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE44109ED1
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 14:16:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44E6789CAF;
	Tue, 26 Nov 2019 13:16:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10065.outbound.protection.outlook.com [40.107.1.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0FCA89CAF
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2019 13:16:10 +0000 (UTC)
Received: from HE1PR08CA0077.eurprd08.prod.outlook.com (2603:10a6:7:2a::48) by
 DBBPR08MB4410.eurprd08.prod.outlook.com (2603:10a6:10:d2::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.16; Tue, 26 Nov 2019 13:16:08 +0000
Received: from VE1EUR03FT059.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::207) by HE1PR08CA0077.outlook.office365.com
 (2603:10a6:7:2a::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.17 via Frontend
 Transport; Tue, 26 Nov 2019 13:16:08 +0000
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT059.mail.protection.outlook.com (10.152.19.60) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.17 via Frontend Transport; Tue, 26 Nov 2019 13:16:07 +0000
Received: ("Tessian outbound 712c40e503a7:v33");
 Tue, 26 Nov 2019 13:16:07 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c1139fa09dcf615f
X-CR-MTA-TID: 64aa7808
Received: from 687810ec6074.4 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.14.52]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F7D55C45-E4BE-456B-8874-7F153F58846F.1; 
 Tue, 26 Nov 2019 13:16:02 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2052.outbound.protection.outlook.com [104.47.14.52])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 687810ec6074.4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 26 Nov 2019 13:16:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TtOBf7SlgXOQSOJgtGeFEFolh2pnsf4RhROmt7DjLIajy9hKZJIq1qsqpLHUNLeU842zxWnWR8LIvlwP0+zDUfkDa71uLLpsi2B8FpvTvxzIg3A2jPPpqi6ekCgJQYr56CgCG32e3GU3JHv1qY0medQH3lcPh94sWuhdnkWlETGwqmcytFEf4QC9UqgnrigPzrfgA7Rq9TSaGerLe6Ssq4DGlAFJ9aRGcCJKQ7RwsjHoCXYUfHdakGt709FpQy2naWWFog/c85oesACyae5MQUYwU/47bZz5PATrt8CtroI7bPZESRxn+EWOyOC3+ytV2yW8kBEJ4v05W4j6bHKJfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lozbmKQolmfEpGhORJ6KkPbrizY8PP9qfhnG2x9TOEw=;
 b=UGdtSe3zFVuJ94+gYhNkZr6+9UcIyJMdsOPYc1C1sTBR+7KtykfruFBRsEXW0+UqrSJXOigxF5FTSGrBTxNfZGOyQrB+biFd5TDu8HZVtdX8ATAu9WAB9Ib3igGMV+y/0a5uo/mUdH9TzpZHfG/h19eSJMQjpuHXW6qNp2CVrfbcLLt5zDlzZU9WuEsvr4PlszCaTFvrljDUEoCUIkYnJ+Kiuhx+mKWDhoIsgNXTJIfRsL8UH9aglkseflDHEPh8bjsl7TB7mWCH+frG7HKeKRyifGoybssUO67RcG5abEwOZt0C+oFNYPx/IXGKLQ11hwZmSOSZIAVXG5QgqldeOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB4317.eurprd08.prod.outlook.com (20.179.28.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.16; Tue, 26 Nov 2019 13:16:00 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d%3]) with mapi id 15.20.2474.023; Tue, 26 Nov 2019
 13:16:00 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH 01/30] drm: Introduce drm_bridge_init()
Thread-Topic: [PATCH 01/30] drm: Introduce drm_bridge_init()
Thread-Index: AQHVpFukMd5nbiwRlEK6zRU7NBRujQ==
Date: Tue, 26 Nov 2019 13:15:59 +0000
Message-ID: <20191126131541.47393-2-mihail.atanassov@arm.com>
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
X-MS-Office365-Filtering-Correlation-Id: f061b75b-75ec-47c6-2216-08d77272cc78
X-MS-TrafficTypeDiagnostic: VI1PR08MB4317:|VI1PR08MB4317:|DBBPR08MB4410:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DBBPR08MB4410F052FA57D0758D3FB6C88F450@DBBPR08MB4410.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:2803;OLM:2803;
x-forefront-prvs: 0233768B38
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(366004)(346002)(376002)(136003)(396003)(189003)(199004)(5640700003)(86362001)(6512007)(71200400001)(2616005)(6486002)(71190400001)(2906002)(4326008)(6916009)(44832011)(446003)(11346002)(54906003)(66946007)(316002)(66446008)(64756008)(66556008)(66476007)(6436002)(8936002)(186003)(26005)(5660300002)(102836004)(305945005)(14454004)(25786009)(99286004)(81166006)(50226002)(478600001)(2501003)(7736002)(6116002)(2351001)(76176011)(1076003)(52116002)(66066001)(256004)(5024004)(8676002)(81156014)(6506007)(3846002)(386003)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB4317;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: pkFiXarJUqAfX5ax59j9bvPQfxDgOCg7YpKcF5pNm5x77H6QsiHQQ8wEZK07Ekf/lfdSpgrrnYNIJg67rvmr1kZSNxw5dMqe0Z0oporjEsSMb1+nQ8MbPeBeXYSKYEn2WKx1jN2Z1c7nbiHCVGRNpXRXXD1QmPTu6C0KxCvTSE4IrIoLsRNxdJ0jbyDWSagg4jl7l6nLpMB3nbZgtcHVHdq3MnMIukQoRLGtlm9O06DJ+ACPAmD+AuO2zZCPHVU2zmoqT5HbLXFyzyG3NFTL1Z+nYzwRYeNGw0d3fskacvKWjS8RmPjXnXgIHAkIaE9L8ng+qEU314pvMUKvie/O4d0hUH5fH8WUWGTbh+VM79lNa5tKelA8EfDPcMMATA8Isj4agLyRNrVDpke+k7qsOO60HEnNP0ZSMOrABm4jyaAIawF2Shg1yTEmemmBNv5q
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4317
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(136003)(376002)(396003)(199004)(189003)(106002)(2351001)(26005)(50466002)(6116002)(186003)(1076003)(305945005)(6506007)(3846002)(386003)(81156014)(5660300002)(47776003)(102836004)(99286004)(7736002)(25786009)(11346002)(76176011)(76130400001)(36756003)(66066001)(6916009)(336012)(70586007)(70206006)(446003)(86362001)(2616005)(6486002)(6512007)(2906002)(54906003)(23756003)(36906005)(2501003)(5640700003)(14454004)(4326008)(316002)(8746002)(107886003)(81166006)(8676002)(50226002)(8936002)(22756006)(26826003)(5024004)(478600001)(356004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DBBPR08MB4410;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 561161b2-5d04-4a7b-b109-08d77272c721
NoDisclaimer: True
X-Forefront-PRVS: 0233768B38
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q4i16YZ8bturndb/4B76JGPRC7AMGXBdXA0PheRqWtBCIbGmiS7KVgcZoYa77N0nc9Qj5YOKBi97WAYSeyFbTWvzgmcmIlD9ZtenYvwGWIil6RoQXXY88xUG4wMVxZHo9JgBCXZAVNZ8soJw2iPsXfqgP0TbxUrxfIb3GeYl0SYwN213h7o5spG4mhNeA8xpq3OsnemGau0OwlcCHmy0H3qscNcxCyhN60RN5gabapxbM1mkswPqi2sPC/1Ma2ZNz5vCGfdN7TV3nDZEzVO8TkutNAA7xVcS/hsiNUIsTK7fpMQ6MSbljKlxotXRsvoK/UOsWM/e1kG0AbKhwdrFxiJQe0TfwYJl3cvORibJVi5S2H6TeVIT/Lq16YYD6GTNnaX/MjMAnTTS5MX/9QRMPQhe/2Lf4Zm6XR+5U28wmYnYDr/eetXUyoXcZaOL30BM
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2019 13:16:07.7426 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f061b75b-75ec-47c6-2216-08d77272cc78
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4410
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lozbmKQolmfEpGhORJ6KkPbrizY8PP9qfhnG2x9TOEw=;
 b=rPFinv9LH3xI19EM70ZoHgim8wNVn52VBD0kfRsH62AfldAxgysW4vDj+6YkULYq4hHu6JcOGdIOJEPre34GXyB7sKf9WxaBYmaOz6XbLhvtTCj6+z89UNkTVH7c9/qtCaGDVQc2hc9oukFpvr4/oZoUupZRkEkWHN4YmWPdKAI=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lozbmKQolmfEpGhORJ6KkPbrizY8PP9qfhnG2x9TOEw=;
 b=rPFinv9LH3xI19EM70ZoHgim8wNVn52VBD0kfRsH62AfldAxgysW4vDj+6YkULYq4hHu6JcOGdIOJEPre34GXyB7sKf9WxaBYmaOz6XbLhvtTCj6+z89UNkTVH7c9/qtCaGDVQc2hc9oukFpvr4/oZoUupZRkEkWHN4YmWPdKAI=
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
 David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QSBzaW1wbGUgY29udmVuaWVuY2UgZnVuY3Rpb24gdG8gaW5pdGlhbGl6ZSB0aGUgc3RydWN0IGRy
bV9icmlkZ2UuCgpTaWduZWQtb2ZmLWJ5OiBNaWhhaWwgQXRhbmFzc292IDxtaWhhaWwuYXRhbmFz
c292QGFybS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9icmlkZ2UuYyB8IDI5ICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrCiBpbmNsdWRlL2RybS9kcm1fYnJpZGdlLmggICAgIHwg
IDQgKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAzMyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2RybV9icmlkZ2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fYnJpZGdl
LmMKaW5kZXggY2JhNTM3Yzk5ZTQzLi5jYmU2ODBhYTZlYWMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9kcm1fYnJpZGdlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9icmlkZ2UuYwpA
QCAtODksNiArODksMzUgQEAgdm9pZCBkcm1fYnJpZGdlX3JlbW92ZShzdHJ1Y3QgZHJtX2JyaWRn
ZSAqYnJpZGdlKQogfQogRVhQT1JUX1NZTUJPTChkcm1fYnJpZGdlX3JlbW92ZSk7CiAKKy8qKgor
ICogZHJtX2JyaWRnZV9pbml0IC0gaW5pdGlhbGlzZSBhIGRybV9icmlkZ2Ugc3RydWN0dXJlCisg
KgorICogQGJyaWRnZTogYnJpZGdlIGNvbnRyb2wgc3RydWN0dXJlCisgKiBAZnVuY3M6IGNvbnRy
b2wgZnVuY3Rpb25zCisgKiBAZGV2OiBkZXZpY2UKKyAqIEB0aW1pbmdzOiB0aW1pbmcgc3BlY2lm
aWNhdGlvbiBmb3IgdGhlIGJyaWRnZTsgb3B0aW9uYWwgKG1heSBiZSBOVUxMKQorICogQGRyaXZl
cl9wcml2YXRlOiBwb2ludGVyIHRvIHRoZSBicmlkZ2UgZHJpdmVyIGludGVybmFsIGNvbnRleHQg
KG1heSBiZSBOVUxMKQorICovCit2b2lkIGRybV9icmlkZ2VfaW5pdChzdHJ1Y3QgZHJtX2JyaWRn
ZSAqYnJpZGdlLCBzdHJ1Y3QgZGV2aWNlICpkZXYsCisJCSAgICAgY29uc3Qgc3RydWN0IGRybV9i
cmlkZ2VfZnVuY3MgKmZ1bmNzLAorCQkgICAgIGNvbnN0IHN0cnVjdCBkcm1fYnJpZGdlX3RpbWlu
Z3MgKnRpbWluZ3MsCisJCSAgICAgdm9pZCAqZHJpdmVyX3ByaXZhdGUpCit7CisJV0FSTl9PTigh
ZnVuY3MpOworCisJYnJpZGdlLT5kZXYgPSBOVUxMOworCWJyaWRnZS0+ZW5jb2RlciA9IE5VTEw7
CisJYnJpZGdlLT5uZXh0ID0gTlVMTDsKKworI2lmZGVmIENPTkZJR19PRgorCWJyaWRnZS0+b2Zf
bm9kZSA9IGRldi0+b2Zfbm9kZTsKKyNlbmRpZgorCWJyaWRnZS0+dGltaW5ncyA9IHRpbWluZ3M7
CisJYnJpZGdlLT5mdW5jcyA9IGZ1bmNzOworCWJyaWRnZS0+ZHJpdmVyX3ByaXZhdGUgPSBkcml2
ZXJfcHJpdmF0ZTsKK30KK0VYUE9SVF9TWU1CT0woZHJtX2JyaWRnZV9pbml0KTsKKwogLyoqCiAg
KiBkcm1fYnJpZGdlX2F0dGFjaCAtIGF0dGFjaCB0aGUgYnJpZGdlIHRvIGFuIGVuY29kZXIncyBj
aGFpbgogICoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9icmlkZ2UuaCBiL2luY2x1ZGUv
ZHJtL2RybV9icmlkZ2UuaAppbmRleCBjMGEyMjg2YTgxZTkuLmQ2ZDlkNTMwMTU1MSAxMDA2NDQK
LS0tIGEvaW5jbHVkZS9kcm0vZHJtX2JyaWRnZS5oCisrKyBiL2luY2x1ZGUvZHJtL2RybV9icmlk
Z2UuaApAQCAtNDAyLDYgKzQwMiwxMCBAQCBzdHJ1Y3QgZHJtX2JyaWRnZSB7CiAKIHZvaWQgZHJt
X2JyaWRnZV9hZGQoc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSk7CiB2b2lkIGRybV9icmlkZ2Vf
cmVtb3ZlKHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UpOwordm9pZCBkcm1fYnJpZGdlX2luaXQo
c3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSwgc3RydWN0IGRldmljZSAqZGV2LAorCQkgICAgIGNv
bnN0IHN0cnVjdCBkcm1fYnJpZGdlX2Z1bmNzICpmdW5jcywKKwkJICAgICBjb25zdCBzdHJ1Y3Qg
ZHJtX2JyaWRnZV90aW1pbmdzICp0aW1pbmdzLAorCQkgICAgIHZvaWQgKmRyaXZlcl9wcml2YXRl
KTsKIHN0cnVjdCBkcm1fYnJpZGdlICpvZl9kcm1fZmluZF9icmlkZ2Uoc3RydWN0IGRldmljZV9u
b2RlICpucCk7CiBpbnQgZHJtX2JyaWRnZV9hdHRhY2goc3RydWN0IGRybV9lbmNvZGVyICplbmNv
ZGVyLCBzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlLAogCQkgICAgICBzdHJ1Y3QgZHJtX2JyaWRn
ZSAqcHJldmlvdXMpOwotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
