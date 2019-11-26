Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62956109EF4
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 14:17:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 699166E3B5;
	Tue, 26 Nov 2019 13:17:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60077.outbound.protection.outlook.com [40.107.6.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 773E36E354
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2019 13:16:40 +0000 (UTC)
Received: from VI1PR08CA0190.eurprd08.prod.outlook.com (2603:10a6:800:d2::20)
 by VI1PR08MB4351.eurprd08.prod.outlook.com (2603:10a6:803:fd::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.17; Tue, 26 Nov
 2019 13:16:37 +0000
Received: from AM5EUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::200) by VI1PR08CA0190.outlook.office365.com
 (2603:10a6:800:d2::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.17 via Frontend
 Transport; Tue, 26 Nov 2019 13:16:37 +0000
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT020.mail.protection.outlook.com (10.152.16.116) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.17 via Frontend Transport; Tue, 26 Nov 2019 13:16:37 +0000
Received: ("Tessian outbound af6b7800e6cb:v33");
 Tue, 26 Nov 2019 13:16:25 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 551831df112d173d
X-CR-MTA-TID: 64aa7808
Received: from ec33c90fb7d1.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.4.59]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1FE755C1-A806-469A-BCC2-2777D3014020.1; 
 Tue, 26 Nov 2019 13:16:19 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2059.outbound.protection.outlook.com [104.47.4.59])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ec33c90fb7d1.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 26 Nov 2019 13:16:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ipXIWdqkCZxeGhW2gwPAdVOugY7ee2RFtW0zpVTDTE3ElX0VAyIaYgnsXZz/ziU7vB9MfUv4IH9T1Us/W9zlEKpaZ3HWuarFeU8w0y8qzqvexzm3vtS/kY8RFAgv+oPuRVJTlpO3yvfNOREIY/fNGmSqa4lBQ7gGeuetidLpvyCxLyItPPuoprJoWYywZ6IBdvqSvjAt86MKY2OfDaZb6mapsnuqTXqw5AxoXhjH2te4cveCixIxtug8BqY2h9PCvRw4/U3KuKvVdNofmEIxoFDTfqnnwc2OXI2ZN/w65vFKkh4EqKKyj2JI8923cgWs4kTiAWkTlLuepT6aHEtfEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WwWUgh4a/99W8HIctunJRzMXApJ6JnBQ7MIy/xuhdE8=;
 b=UpWvjvAzQNipac5z0VL//JK5qXm17xooJrHkEWbPe1DJhFTvtSKUAEIb7QToj2HuIVpvNT0LK9b2v1vtAsRlMasE8drpL2RKwT5Pc60Y7H9o8Sr4UDOzx9EzCnb6fnXW74K9PZ/LgmKjNodKE80uGYYh3HX5pU+eO/zUYtoOPhoAOP2DqA+UwpaTf6gxtDuU6rWk6n94kHj4aD97Vjzj5b4v/AO7qui9l9Ff7Fj6Kq+KlXK5uqAdscuC7yIKQIQowvUMPbm1T7c5CJ3bLowk0YvzsOxCZDCY8NiQdDo5i6kpLd1NcM8oe1XhEWK48T7gp+Ija02Z5ukUmWeDzwmabw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB4560.eurprd08.prod.outlook.com (20.179.24.80) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.19; Tue, 26 Nov 2019 13:16:18 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d%3]) with mapi id 15.20.2474.023; Tue, 26 Nov 2019
 13:16:17 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH 19/30] drm/bridge: thc63: Use drm_bridge_init()
Thread-Topic: [PATCH 19/30] drm/bridge: thc63: Use drm_bridge_init()
Thread-Index: AQHVpFuv1f0rKFruYE6C6McKrV2JsQ==
Date: Tue, 26 Nov 2019 13:16:17 +0000
Message-ID: <20191126131541.47393-20-mihail.atanassov@arm.com>
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
X-MS-Office365-Filtering-Correlation-Id: 599426f7-83c3-436a-c3fc-08d77272de51
X-MS-TrafficTypeDiagnostic: VI1PR08MB4560:|VI1PR08MB4560:|VI1PR08MB4351:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VI1PR08MB4351115D9B7115F41C662E018F450@VI1PR08MB4351.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:376;OLM:376;
x-forefront-prvs: 0233768B38
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(366004)(346002)(136003)(39860400002)(396003)(189003)(199004)(71190400001)(478600001)(1076003)(66476007)(186003)(26005)(5640700003)(52116002)(64756008)(256004)(8676002)(2351001)(66946007)(54906003)(81156014)(44832011)(3846002)(4744005)(6116002)(6436002)(2616005)(66556008)(71200400001)(2906002)(11346002)(66446008)(99286004)(14454004)(81166006)(6916009)(5660300002)(25786009)(2501003)(8936002)(102836004)(66066001)(36756003)(6486002)(6512007)(386003)(4326008)(50226002)(76176011)(316002)(86362001)(7736002)(446003)(6506007)(305945005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB4560;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: +wEj2TXnLyjilv0qLzlz0ARpoMHoqNgcARY+GDh2B/SJSuAa7FJmRi16O2nxycLU6XrN+vtFmu5TJNNwMa848vqSzn3hpDuJB/HLqvdbTwQhJSk06sxwmdX4aVdQWLDL2gFU+u2pEM4DECv56+B5N8TBBd0RvRL9KdF63ZsDLrvDAdYkbmTcW9kG+lTYvFH8fJJ5ljj9Oir3nFrgsffehDQDf4F/sUHEJtzyK/8rPdC8nMZu12G6wdYvojYTKQbQyje0LbMEZlK6Mrig8/r7YEtFZcrA6pNxM5tagf5j8AmicXpqx2jftlH+sSoXieLMEKVYz4XnpGbpXik4rNT5Iq8TMmeFmBBBoYjsJm008qYtizCXqIkoEwKBQRh7lRKkBHV0SjXuoGNRYtj9BBeUkjMs3V1hEGQc+UqCq/259n14ajvsY/DDpoYqw3nvPITY
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4560
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(39860400002)(346002)(376002)(189003)(199004)(36756003)(356004)(1076003)(2906002)(8676002)(107886003)(478600001)(3846002)(50226002)(14454004)(6116002)(6506007)(386003)(76176011)(102836004)(5660300002)(86362001)(54906003)(2351001)(36906005)(26826003)(4744005)(8936002)(8746002)(316002)(81156014)(81166006)(76130400001)(4326008)(70206006)(70586007)(50466002)(99286004)(5640700003)(6916009)(23756003)(106002)(47776003)(66066001)(6512007)(305945005)(7736002)(2616005)(2501003)(446003)(25786009)(26005)(186003)(336012)(11346002)(6486002)(22756006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB4351;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 401d8086-1aeb-4fcf-a152-08d77272d243
NoDisclaimer: True
X-Forefront-PRVS: 0233768B38
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Te0WmfZd/1Dh6vP0usrZWUFhdJXfX/YNxKesftZXlymVohDhlNzAZvVg++S9+H7KXxvO2xTeW3l7EFCwehpeyI0vT073WCJtWgb4t2Su1IzIrc+x+UkT4vwO88lYKF+RBK6yMvOqTzwR41Vt/YmavEkakjD18ttHA+K0CjslNQojGvnLztxrEFSTaPatgnIUnWO6nLtEK/Shu5VeY68Zmj2eP9Uuk6TRVLZbz5OicUx3lsDx+Z58gUJkahFQyP0RsUQKk2P27TMGJf3PztoEtcKRyagA6XYKRBh58TUM/0xCnaLwApWLgxN1VoF62u7k8PL6/Av4Ko0FPJBTbKzVUKrLgi03SLybzAZoOaXcwh2lTCTF3NwOsJ1tvmpfA4iSMQPH/w0QJif+/GYUjI2GwoyjpZmYkztHIKIFZfJ3BISCKQrNBJ0cbybQBybJPZQy
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2019 13:16:37.7322 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 599426f7-83c3-436a-c3fc-08d77272de51
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4351
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WwWUgh4a/99W8HIctunJRzMXApJ6JnBQ7MIy/xuhdE8=;
 b=REVwHFK4ix5yiIsKLIEF9PPRWmXhU66yy4T+YHyckbNsLAWgMOefFVtv8MGgn6IpgJkqocbZ8dXr/DRSlWBlCMqN90XkSS6+WTUCWYLnbWo0HR8gjXkK8N122ZpRnAf8El/wYn/RAKlQ/lY/jtMP4uFViDcUeSvWyIp1c6nbYwE=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WwWUgh4a/99W8HIctunJRzMXApJ6JnBQ7MIy/xuhdE8=;
 b=REVwHFK4ix5yiIsKLIEF9PPRWmXhU66yy4T+YHyckbNsLAWgMOefFVtv8MGgn6IpgJkqocbZ8dXr/DRSlWBlCMqN90XkSS6+WTUCWYLnbWo0HR8gjXkK8N122ZpRnAf8El/wYn/RAKlQ/lY/jtMP4uFViDcUeSvWyIp1c6nbYwE=
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
aWhhaWwuYXRhbmFzc292QGFybS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90aGM2
M2x2ZDEwMjQuYyB8IDcgKystLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
NSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RoYzYz
bHZkMTAyNC5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90aGM2M2x2ZDEwMjQuYwppbmRleCAz
ZDc0MTI5YjI5OTUuLmFiZTgwNmRiNWY0ZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Jy
aWRnZS90aGM2M2x2ZDEwMjQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RoYzYzbHZk
MTAyNC5jCkBAIC0yMTgsMTEgKzIxOCw4IEBAIHN0YXRpYyBpbnQgdGhjNjNfcHJvYmUoc3RydWN0
IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlpZiAocmV0KQogCQlyZXR1cm4gcmV0OwogCi0JdGhj
NjMtPmJyaWRnZS5kcml2ZXJfcHJpdmF0ZSA9IHRoYzYzOwotCXRoYzYzLT5icmlkZ2Uub2Zfbm9k
ZSA9IHBkZXYtPmRldi5vZl9ub2RlOwotCXRoYzYzLT5icmlkZ2UuZnVuY3MgPSAmdGhjNjNfYnJp
ZGdlX2Z1bmM7Ci0JdGhjNjMtPmJyaWRnZS50aW1pbmdzID0gJnRoYzYzLT50aW1pbmdzOwotCisJ
ZHJtX2JyaWRnZV9pbml0KCZ0aGM2My0+YnJpZGdlLCAmcGRldi0+ZGV2LCAmdGhjNjNfYnJpZGdl
X2Z1bmMsCisJCQkmdGhjNjMtPnRpbWluZ3MsIHRoYzYzKTsKIAlkcm1fYnJpZGdlX2FkZCgmdGhj
NjMtPmJyaWRnZSk7CiAKIAlyZXR1cm4gMDsKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
