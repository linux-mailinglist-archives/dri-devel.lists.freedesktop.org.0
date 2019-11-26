Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7902109ED8
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 14:16:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FF746E330;
	Tue, 26 Nov 2019 13:16:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on0616.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe1e::616])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 201FD6E32A
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2019 13:16:13 +0000 (UTC)
Received: from VI1PR08CA0168.eurprd08.prod.outlook.com (2603:10a6:800:d1::22)
 by DB8PR08MB4985.eurprd08.prod.outlook.com (2603:10a6:10:bf::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.19; Tue, 26 Nov
 2019 13:16:10 +0000
Received: from VE1EUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::202) by VI1PR08CA0168.outlook.office365.com
 (2603:10a6:800:d1::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.17 via Frontend
 Transport; Tue, 26 Nov 2019 13:16:10 +0000
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT031.mail.protection.outlook.com (10.152.18.69) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.17 via Frontend Transport; Tue, 26 Nov 2019 13:16:09 +0000
Received: ("Tessian outbound a8f166c1f585:v33");
 Tue, 26 Nov 2019 13:16:09 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ae0827d16706ec77
X-CR-MTA-TID: 64aa7808
Received: from 687810ec6074.8 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.14.52]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5BCFF590-9839-44B7-81BC-84FF2EEDCFAF.1; 
 Tue, 26 Nov 2019 13:16:03 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2052.outbound.protection.outlook.com [104.47.14.52])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 687810ec6074.8
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 26 Nov 2019 13:16:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AOEiwG0rYLuSYKaauLV7oePvrJlQu7DrskAkwXOXyh1ppDnoYRzQ3e12lysKMDRjBit6n9XFDCEngYCct6Aoke9Y8mMoj2UXsFVmNpeg2zDN1wq3FOXNdeVJ/a7gWkefylANp+XeQSkEymkB+CPhU/wEPDtVOa/Kz4OLz57+NkIM3mqHDUb1dviRPwntG3l+0ff8fc8bj40kqV0NOfgzQEdDHCZHYVDGUwK2wJ9GLyGctYNEee+OCNDkgpaPg3QOHlzYy8MkXnJKt1cw9Kz557p8fntiH/JAuRKAf0vcvhD5pOP3dnwmzV36KhWenzcXk0Rp3bHhEleT+H6CsIeyCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BdLraPscYl7N5ZnI1D+z6wvdTqf7jpr4JBWbRvcBLpA=;
 b=i+X5n40YxhjsCGYiEpo9c8hEtPAMcJERLAWqJh0VSB19sPSG2UnBf0tjW+g+XxCW367PRVopBTv7q0XSJwBNIM6eCYCLb5Q6XyJVkGIPPxhx32iYuH9Wu/Tnqaenoy2bT+YWdLWmJPnz0CeoCuB5T1L6CBVRAGgU30HOcj8Ymk/HOZlPlR6AYL+DhS7/+JLph8+sGvwoZJInFF8ii1bytQfyi9IpvGHe20BuJSzo8aeDdIn+b1gZ6QrnwO0Fumw8FTlxHNOrS6jv6k0tJjRqfJNrANkTODmSzXWQCTn5HtPcGCM5A0c0nCdRvHk6r9muA+ntQsCjEhKerl+fSG2bvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB4317.eurprd08.prod.outlook.com (20.179.28.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.16; Tue, 26 Nov 2019 13:16:01 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d%3]) with mapi id 15.20.2474.023; Tue, 26 Nov 2019
 13:16:01 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH 03/30] drm/bridge: anx6345: Use drm_bridge_init()
Thread-Topic: [PATCH 03/30] drm/bridge: anx6345: Use drm_bridge_init()
Thread-Index: AQHVpFumWN2LaRa5802T6cP9cvsh+w==
Date: Tue, 26 Nov 2019 13:16:01 +0000
Message-ID: <20191126131541.47393-4-mihail.atanassov@arm.com>
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
X-MS-Office365-Filtering-Correlation-Id: 3bd79e25-8211-402b-e333-08d77272cdbb
X-MS-TrafficTypeDiagnostic: VI1PR08MB4317:|VI1PR08MB4317:|DB8PR08MB4985:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB8PR08MB49857C7C6A4EF62A4947B0E58F450@DB8PR08MB4985.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:1443;OLM:1443;
x-forefront-prvs: 0233768B38
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(366004)(346002)(376002)(136003)(396003)(189003)(199004)(5640700003)(86362001)(6512007)(71200400001)(2616005)(6486002)(71190400001)(2906002)(4326008)(6916009)(44832011)(446003)(11346002)(54906003)(66946007)(316002)(66446008)(64756008)(66556008)(66476007)(6436002)(7416002)(8936002)(186003)(26005)(5660300002)(102836004)(305945005)(14454004)(25786009)(99286004)(81166006)(50226002)(478600001)(2501003)(7736002)(6116002)(2351001)(76176011)(1076003)(52116002)(66066001)(256004)(14444005)(8676002)(81156014)(6506007)(3846002)(386003)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB4317;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 0ONJWPJOth+Ob6G8gvodfCmi8+R02t70ub+3Ab8nu/DDw/CR4Ibie/oYV5Uxjg5GMWc91PViq4ky0jsK5Y8fCxf21KwOe2mm3Sk4WrJ/1l4PVERLdGgJqCkUtYoceJONU2/XLzdGhmsnpfK0rouNczDKe48+6yzh8eRMmq4K8Ps3joTUo0mhYTkQAALqzAUoxVL/Xu9bbj1V+5y/jl4P6BsA3I1qcIw+hcc3SN9ebcFGesF6tP/2oCVALlWLRilZJdKpDrm2dq2BB4L+xjQ22Xb2ViKMou1CMcXDgR0AV55XUtCGSnklCVcsn5fpHfxylxx3H7zToWjnjJ5JQguNbkP1cPZlCthjVwRxWt5/owP1qN9TAMlfGTIDkRq9S2GyRKd0kTemCu3J2w2vdeQVGyGV1pw+PwaPvVloDHEkPDWvjSxnMksqOt64701I+1t1
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4317
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(396003)(346002)(39860400002)(189003)(199004)(81156014)(5660300002)(23756003)(14444005)(26005)(50466002)(2351001)(76176011)(1076003)(7736002)(47776003)(99286004)(76130400001)(305945005)(102836004)(86362001)(6486002)(66066001)(70206006)(106002)(386003)(6506007)(22756006)(6916009)(107886003)(2501003)(70586007)(36906005)(54906003)(316002)(4326008)(186003)(356004)(2906002)(8746002)(50226002)(6512007)(446003)(478600001)(26826003)(6116002)(3846002)(25786009)(8676002)(2616005)(5640700003)(81166006)(8936002)(36756003)(336012)(11346002)(14454004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB8PR08MB4985;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 742e748e-4191-45ce-d2dc-08d77272c866
NoDisclaimer: True
X-Forefront-PRVS: 0233768B38
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2y6yNoKvgD++8EKGgERU1JsD3Jvte2Foixcr/noBxDD27UCtKDQ0O+CFW6TZQ5UhokSMcxvYQbPOB3nazqupTESaAONCGwDCFSapR1Y2kYHxmlBduxiCIFqMK6eQkI4EmW63gQrQIxq5qYrIh1ryy9hKMC1z+C6VEodvJDPBM4FpcxUbePDU8Jz1h1M78D7SlhLZ1BUUK4ndUeMmxQyO3B/PCccH0b1572Bc/rOD2CVCh0AgibxrDUO6qURBHIczgVkcw3F3vi4q/jasKWxx/DaXrU936e8fVOXBV0xeNpLoaR1T4zmSlr1d24c969ZVBgfe65YiEsbiL1l9FBBL9rSGf48aFGfwOF2lY+T3IJeUZkIpcvcB0hqMMExe10Xt/keK9qitb4PKIqMynYNCg7IHW4IG+z8wSgG6866buh2x77DFcr+1Hc8hKulglI4N
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2019 13:16:09.8004 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bd79e25-8211-402b-e333-08d77272cdbb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4985
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BdLraPscYl7N5ZnI1D+z6wvdTqf7jpr4JBWbRvcBLpA=;
 b=D1v+wKUvBEXmmvZ7h86PluO3iyk0BLQBh9rXYyQp7cvu0zpXVUvg7xQdsdwoMlKgwvNbmddDxbpfBItZqWfrMJxoom1uWz6q+8u6MuVbuw+xpggFOyKHjhQLX8RzfbUDHNy3GqnxQgQEarE3rTUCrFMm5w2LBPxTxSfXcniyNLU=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BdLraPscYl7N5ZnI1D+z6wvdTqf7jpr4JBWbRvcBLpA=;
 b=D1v+wKUvBEXmmvZ7h86PluO3iyk0BLQBh9rXYyQp7cvu0zpXVUvg7xQdsdwoMlKgwvNbmddDxbpfBItZqWfrMJxoom1uWz6q+8u6MuVbuw+xpggFOyKHjhQLX8RzfbUDHNy3GqnxQgQEarE3rTUCrFMm5w2LBPxTxSfXcniyNLU=
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
 Icenowy Zheng <icenowy@aosc.io>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Torsten Duwe <duwe@lst.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, nd <nd@arm.com>,
 Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm8gZnVuY3Rpb25hbCBjaGFuZ2UuCgpTaWduZWQtb2ZmLWJ5OiBNaWhhaWwgQXRhbmFzc292IDxt
aWhhaWwuYXRhbmFzc292QGFybS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFs
b2dpeC9hbmFsb2dpeC1hbng2MzQ1LmMgfCA1ICsrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9i
cmlkZ2UvYW5hbG9naXgvYW5hbG9naXgtYW54NjM0NS5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRn
ZS9hbmFsb2dpeC9hbmFsb2dpeC1hbng2MzQ1LmMKaW5kZXggYjRmM2E5MjNhNTJhLi4xMzBkNWMz
YTA3ZWYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgvYW5hbG9n
aXgtYW54NjM0NS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgvYW5hbG9n
aXgtYW54NjM0NS5jCkBAIC02OTYsOCArNjk2LDYgQEAgc3RhdGljIGludCBhbng2MzQ1X2kyY19w
cm9iZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50LAogCiAJbXV0ZXhfaW5pdCgmYW54NjM0NS0+
bG9jayk7CiAKLQlhbng2MzQ1LT5icmlkZ2Uub2Zfbm9kZSA9IGNsaWVudC0+ZGV2Lm9mX25vZGU7
Ci0KIAlhbng2MzQ1LT5jbGllbnQgPSBjbGllbnQ7CiAJaTJjX3NldF9jbGllbnRkYXRhKGNsaWVu
dCwgYW54NjM0NSk7CiAKQEAgLTc2MCw3ICs3NTgsOCBAQCBzdGF0aWMgaW50IGFueDYzNDVfaTJj
X3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQsCiAJLyogTG9vayBmb3Igc3VwcG9ydGVk
IGNoaXAgSUQgKi8KIAlhbng2MzQ1X3Bvd2Vyb24oYW54NjM0NSk7CiAJaWYgKGFueDYzNDVfZ2V0
X2NoaXBfaWQoYW54NjM0NSkpIHsKLQkJYW54NjM0NS0+YnJpZGdlLmZ1bmNzID0gJmFueDYzNDVf
YnJpZGdlX2Z1bmNzOworCQlkcm1fYnJpZGdlX2luaXQoJmFueDYzNDUtPmJyaWRnZSwgJmNsaWVu
dC0+ZGV2LAorCQkJCSZhbng2MzQ1X2JyaWRnZV9mdW5jcywgTlVMTCwgTlVMTCk7CiAJCWRybV9i
cmlkZ2VfYWRkKCZhbng2MzQ1LT5icmlkZ2UpOwogCiAJCXJldHVybiAwOwotLSAKMi4yMy4wCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
