Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A778109EE5
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 14:16:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F9696E353;
	Tue, 26 Nov 2019 13:16:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70072.outbound.protection.outlook.com [40.107.7.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E6E96E375
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2019 13:16:33 +0000 (UTC)
Received: from AM6PR08CA0033.eurprd08.prod.outlook.com (2603:10a6:20b:c0::21)
 by AM0PR08MB5170.eurprd08.prod.outlook.com (2603:10a6:208:15c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.16; Tue, 26 Nov
 2019 13:16:30 +0000
Received: from DB5EUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::201) by AM6PR08CA0033.outlook.office365.com
 (2603:10a6:20b:c0::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.17 via Frontend
 Transport; Tue, 26 Nov 2019 13:16:30 +0000
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT010.mail.protection.outlook.com (10.152.20.96) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.17 via Frontend Transport; Tue, 26 Nov 2019 13:16:30 +0000
Received: ("Tessian outbound a8f166c1f585:v33");
 Tue, 26 Nov 2019 13:16:30 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e7b39dd392aaacd0
X-CR-MTA-TID: 64aa7808
Received: from 95ca307b0d32.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.14.57]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B3E3C202-EFF2-440D-A934-6DAB61EC2BB9.1; 
 Tue, 26 Nov 2019 13:16:25 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2057.outbound.protection.outlook.com [104.47.14.57])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 95ca307b0d32.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 26 Nov 2019 13:16:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PCtjhkowsKDNmCYBOpNs9sVB6ZdTtexIHnZazSVinYUYxbQ5GtXC2iR3SStSibkxpwL004r2ZtcDm8rO8JtR+zvi0LPIKWRC4DFGV6dIQV7yRGb6vOf7GxFMDXCGP2oIUwFHBw0Xn/OpSz1QgFMa87A/1T5pD/OLx+B80IKvouWKEEwBsHxCxTpJAC3h16Mx2VHYZRsZNeq9uBcQAVQmVzBbynaSnO9VF1eaZgUWmUiNkgN372U3XkmAVUdUz1ZUsqgbaoSGNgjaYFMH5LrRpkNqZzj11bUrpOy0f9r2Y3k+hjeprf+3IPApjZOUJ7W/azkNcPUDoGyjpRtelr0E8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5MOaSsR5jY0wtwz+PiDW06AIZcsZxDj0v9S4kmIV+VA=;
 b=NB5ENJ/8ICLoi6YLzlyv7iKAF25/f0mwsYhCdCcuTqI8k+8Bl+FDUud9++bEY0O36ktBUUIzRlJAdKbTO+wrv5kTZihMxh9O/fMO2t2dW935QibCbHNY5OyMupMuHfuqYf7uXiLRB1H0NLv2BxGU11ApjWK8UEdqgHFFSL09Q4j2BUJ7qR1lumXd7wp4d1h2c0a0B34c82vC7dOprmFxC1C1gZbJdLEe9Vkj5Optmc+OCckl0xgIPmavR8PjuGFwE+m4b+1p14VSHFYPMSRhI4yehWelritLML/JVHKCDpmPP8q7Jw+6D0H77Q3XI6ci0bwGxa1ICQwSa/U4/cEmVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB4317.eurprd08.prod.outlook.com (20.179.28.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.16; Tue, 26 Nov 2019 13:16:23 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d%3]) with mapi id 15.20.2474.023; Tue, 26 Nov 2019
 13:16:23 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH 25/30] drm/mediatek: hdmi: Use drm_bridge_init()
Thread-Topic: [PATCH 25/30] drm/mediatek: hdmi: Use drm_bridge_init()
Thread-Index: AQHVpFuzInu3PYWIi0+K6XxDPncYZw==
Date: Tue, 26 Nov 2019 13:16:23 +0000
Message-ID: <20191126131541.47393-26-mihail.atanassov@arm.com>
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
X-MS-Office365-Filtering-Correlation-Id: 0bcf62aa-1d7b-4bb7-d66d-08d77272d9f7
X-MS-TrafficTypeDiagnostic: VI1PR08MB4317:|VI1PR08MB4317:|AM0PR08MB5170:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM0PR08MB51701ACDB2DACFB22F4549CC8F450@AM0PR08MB5170.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:324;OLM:324;
x-forefront-prvs: 0233768B38
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(1496009)(4636009)(39860400002)(366004)(346002)(376002)(136003)(396003)(189003)(199004)(5640700003)(86362001)(6512007)(71200400001)(2616005)(6486002)(71190400001)(2906002)(4326008)(6916009)(44832011)(446003)(11346002)(54906003)(66946007)(316002)(66446008)(64756008)(66556008)(66476007)(6436002)(4744005)(8936002)(186003)(26005)(5660300002)(102836004)(305945005)(14454004)(25786009)(99286004)(81166006)(50226002)(478600001)(2501003)(7736002)(6116002)(2351001)(76176011)(1076003)(52116002)(66066001)(256004)(8676002)(81156014)(6506007)(3846002)(386003)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB4317;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: QH9/CltOxxb0l/6tpFpbYlQcp5dmI9Yq82VXmWt8mb5qv4dHhuIdGTyyssbGnPc1mTu5G3yo/8/88sfFsKzGvM+MIn4ZSvgtIRVlySwdnEFZO3iFp3sfoKFyT2DH+8xlgWD+dJ96zQqxBPN7xjvBmOofGorf/WDil4VVlRGCUQgWApXY3uP5kp1k3oTILQPi9JaEo2fI35/pq15GxGgcZ7ozX8X+9W2FA2aVaLEApjsjIM3G4bK/+qx+6olIu5TAV4biKvA8cWQ0qOKMkEZMCLuynp7fvyzOu7EbXHifgznSa1cd7TYX97iAbiwAyZnyyT8JsDaNKDlxLEbYX9frSyY3AwL2j+TujhCFcGOpwAERBe/3BkBQx90scXxZd6jmnnQPydJEFTbfKl82YiGBr+ntvcmyYp5tTXIgHA8M+1THfgud0v7p/cfOpxRR068e
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4317
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(396003)(136003)(346002)(189003)(199004)(2501003)(386003)(2616005)(70586007)(70206006)(81156014)(81166006)(50226002)(8936002)(8746002)(2906002)(54906003)(50466002)(5660300002)(2351001)(47776003)(316002)(11346002)(66066001)(8676002)(26005)(14454004)(446003)(1076003)(6486002)(99286004)(3846002)(6116002)(22756006)(36756003)(86362001)(106002)(25786009)(478600001)(26826003)(4744005)(336012)(5640700003)(6916009)(107886003)(6506007)(4326008)(23756003)(76130400001)(356004)(76176011)(102836004)(7736002)(186003)(6512007)(305945005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB5170;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 1e2bfdee-0080-4504-50d2-08d77272d592
NoDisclaimer: True
X-Forefront-PRVS: 0233768B38
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rwKStPC23UFSiExRr2SqO3/RKvHavq/1pTytf83W4fkOd69HrokVT9Hdh7VN+6170mNauFnz4Dann9xsaxii1Xi7hAsrcdRKzJsf7Jg6RS0ilfJLTkeqBwJA2NToBuEacwf5EvW04HxFpEc9Jou/X8NQN9DNpCf3p42txCQnN44o7r6vPWR45b5LBPgO0tZ4m2PSU9boMdsjdu6CgT3nbWnJ2JEXUQFnxh7PvL6zq1lCeqpUuC2FRwbx0nXA8L17eYWrK4CLYPLcwVAphax6TUhFGuzQTadG5qWpxgRD0W5xO4oOHkMukj+BlAGr+wfHSYvEF6lRZb5RA8PReJppCcUV4h97WwWY71HLlNcQsbzZRUTvTF6+3iKqlyagqcZNDNyt+47npqzYLbIohGjZ4x0pzF5RwnBa0G7SL6LN2L7072jskz+BcIVlhfyB7Kyc
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2019 13:16:30.4430 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bcf62aa-1d7b-4bb7-d66d-08d77272d9f7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5170
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5MOaSsR5jY0wtwz+PiDW06AIZcsZxDj0v9S4kmIV+VA=;
 b=pX4foftaRCM9dA9DEdAENXCpieJQuPbJItHjvWjX0a1vj5CIURm6BNIJYnX0RMOP4nO1V4AybANyYt3U4GrdZVB0qDdP5YyuZ/P85ImioNknCOTxhEgZy8/CMz0Jf85s2eHH+jcqX6SONVih6byrJhSupo9K5NIQwMejM3yS6Xg=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5MOaSsR5jY0wtwz+PiDW06AIZcsZxDj0v9S4kmIV+VA=;
 b=pX4foftaRCM9dA9DEdAENXCpieJQuPbJItHjvWjX0a1vj5CIURm6BNIJYnX0RMOP4nO1V4AybANyYt3U4GrdZVB0qDdP5YyuZ/P85ImioNknCOTxhEgZy8/CMz0Jf85s2eHH+jcqX6SONVih6byrJhSupo9K5NIQwMejM3yS6Xg=
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
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 nd <nd@arm.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm8gZnVuY3Rpb25hbCBjaGFuZ2UuCgpTaWduZWQtb2ZmLWJ5OiBNaWhhaWwgQXRhbmFzc292IDxt
aWhhaWwuYXRhbmFzc292QGFybS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19oZG1pLmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1p
LmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYwppbmRleCBmNjg0OTQ3YzUy
NDMuLjk3NjFhODA2NzRkOSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19oZG1pLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMKQEAgLTE3
MDgsOCArMTcwOCw4IEBAIHN0YXRpYyBpbnQgbXRrX2RybV9oZG1pX3Byb2JlKHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXYpCiAKIAltdGtfaGRtaV9yZWdpc3Rlcl9hdWRpb19kcml2ZXIoZGV2
KTsKIAotCWhkbWktPmJyaWRnZS5mdW5jcyA9ICZtdGtfaGRtaV9icmlkZ2VfZnVuY3M7Ci0JaGRt
aS0+YnJpZGdlLm9mX25vZGUgPSBwZGV2LT5kZXYub2Zfbm9kZTsKKwlkcm1fYnJpZGdlX2luaXQo
JmhkbWktPmJyaWRnZSwgJnBkZXYtPmRldiwgJm10a19oZG1pX2JyaWRnZV9mdW5jcywKKwkJCU5V
TEwsIE5VTEwpOwogCWRybV9icmlkZ2VfYWRkKCZoZG1pLT5icmlkZ2UpOwogCiAJcmV0ID0gbXRr
X2hkbWlfY2xrX2VuYWJsZV9hdWRpbyhoZG1pKTsKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
