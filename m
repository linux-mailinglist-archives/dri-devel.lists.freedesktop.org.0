Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95DA4109EE2
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 14:16:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30D266E34B;
	Tue, 26 Nov 2019 13:16:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60054.outbound.protection.outlook.com [40.107.6.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 238586E32A
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2019 13:16:17 +0000 (UTC)
Received: from AM6PR08CA0009.eurprd08.prod.outlook.com (2603:10a6:20b:b2::21)
 by AM5PR0802MB2513.eurprd08.prod.outlook.com (2603:10a6:203:a0::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.19; Tue, 26 Nov
 2019 13:16:14 +0000
Received: from AM5EUR03FT038.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::203) by AM6PR08CA0009.outlook.office365.com
 (2603:10a6:20b:b2::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.17 via Frontend
 Transport; Tue, 26 Nov 2019 13:16:14 +0000
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT038.mail.protection.outlook.com (10.152.17.118) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.17 via Frontend Transport; Tue, 26 Nov 2019 13:16:14 +0000
Received: ("Tessian outbound 512f710540da:v33");
 Tue, 26 Nov 2019 13:16:14 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4942229eebfaa73c
X-CR-MTA-TID: 64aa7808
Received: from eb4165d38a59.4 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.14.58]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1DAE1596-2200-417D-A62D-830D93F26AF2.1; 
 Tue, 26 Nov 2019 13:16:08 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2058.outbound.protection.outlook.com [104.47.14.58])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id eb4165d38a59.4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 26 Nov 2019 13:16:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bRQZ/GzVZm4JljAeFh8AuwTyTW00rDhlzi3DFhW85S3V/zRbPxzJfFyMnioegmWfdkyReVtGuzL80+HNOb7XrMsNKZ3qPzDnlTBhKwcfJn1NUg++uAOFyjhDE858D2MBMo3pOXYNcx+uzSn+pZTFk5KnYueKjBA7B9EgCuOhKBpqtffsEyCwR9+d/D/ndqm9wPe/rfO4zAbncO6NPXd1gWaSzpGy0B21y8l3cdTEJodKKYeZMHI4MJV2cXUdMTVPxfJlEb9jHORrzZeQ551t+TUR57TIYyhOjn6Za9sP9dbsJr+PEpYiUcwKBKoJ1XLykMvvBVwJkJ5en2pL7CqmZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D4D/5bCj6TvVVRDvDiedXMOypvZfwR1Fa0QcscRNJGw=;
 b=JU/c04osgz9ZPI9ERwihRNfyV9/KMRbPxXMuDB5rkGzaWxu2bC0u2AiyVbTNJ7GnNuUlR1rXv1WloI3EihABx1tnu6VSo8PFZ9Sjl3U3kegs+1SqqnCkMF/tLqeF/Fa/PV3xH6nb58ClDo3Ez5bbpHNHY6AOgNwThVhH3+gWi0kE9WIbCkcbcOtjlQqP+D9ZAsGUiKtchz/rxbpqqzf4xVZLsctNpM+wGY+H5FxAqpC7zk8WXH+XUhofpeMyAXKRDng/jOy/FpGde5Y977Or1gFXwYIPCse18SPIrDuRSECCI+NrA4XKIqK1AGyN6sonimczJ6jGD5q34AEwCjhAJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB4317.eurprd08.prod.outlook.com (20.179.28.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.16; Tue, 26 Nov 2019 13:16:07 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d%3]) with mapi id 15.20.2474.023; Tue, 26 Nov 2019
 13:16:07 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH 09/30] drm/bridge: nxp-ptn3460: Use drm_bridge_init()
Thread-Topic: [PATCH 09/30] drm/bridge: nxp-ptn3460: Use drm_bridge_init()
Thread-Index: AQHVpFupslWOenScmkW8ORjTGjHPqQ==
Date: Tue, 26 Nov 2019 13:16:07 +0000
Message-ID: <20191126131541.47393-10-mihail.atanassov@arm.com>
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
X-MS-Office365-Filtering-Correlation-Id: a4fcc98c-24d3-4c01-3408-08d77272d04f
X-MS-TrafficTypeDiagnostic: VI1PR08MB4317:|VI1PR08MB4317:|AM5PR0802MB2513:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0802MB2513ED13E28B39E5767EF3CD8F450@AM5PR0802MB2513.eurprd08.prod.outlook.com>
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
X-Microsoft-Antispam-Message-Info-Original: kh/C7PCVsvfDVv3zTNKSmefSypczC4D8M7sHoEktOhaSzLiG2usy39fE7J+tU0Atv9D/vk+u8eVw7wD/PKmZjI6v+u8T9J1Kbl26ALFFupVS8iG9jnF/M6gE95STzVOArfX6I4QlrKWQSxxgQQyZlJcatiwyNwov421hCCzYCdMwOkzAi3ogfU+5gdW07bDLRb9cw4a7+umDWpnkmDlYvczs3357AS/EsndN1V1d1xF4yEeGxTH4IG5TyJvHY51CQ52gsjdMANewTP7YzBiXo3IZ/YdrTGZ84SnWR6aV8NPReegtwqdpA+CxGxBmRKYogPfdAl3m9zPeFtNSwQbwAjmxX/jct6SWKx5Eyv5K2EjVwFoEJDFQAuv/ZI0gKdD26tNvRxdOhvVVkt95ntT7jZ/RQfPOgLp1egB0WklLFW31Kc0e0F7jnlzFGwM4Hgx/
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4317
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(39860400002)(136003)(376002)(189003)(199004)(22756006)(66066001)(50466002)(54906003)(316002)(2501003)(102836004)(36906005)(386003)(6506007)(7736002)(2351001)(36756003)(5660300002)(26005)(11346002)(2616005)(99286004)(336012)(1076003)(446003)(86362001)(106002)(76176011)(4744005)(186003)(478600001)(305945005)(26826003)(14454004)(76130400001)(81156014)(50226002)(5640700003)(8676002)(6512007)(6486002)(70586007)(25786009)(70206006)(6916009)(2906002)(8936002)(8746002)(23756003)(3846002)(356004)(47776003)(6116002)(4326008)(107886003)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR0802MB2513;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: c551a330-582c-4e98-9ad9-08d77272cc0a
NoDisclaimer: True
X-Forefront-PRVS: 0233768B38
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3ntjL9vb9qvGSuBnd1OVzEI9SHQRPvf10ywMkwteNqJcf22hM7v2kFMAWj2/fncdv4PPP42v5cfCts9vWJ2QsIRBOWBuDcOXwEF+DSAkqSHWRu7EY0jT2hRMIEIq6crXvFBSqqHllWUOqNIUYd/Ag+tONUzTEzikXNffzdb73yiflibHMgsa6ixds6CNUEKAKAxZimHf+XzXeylmoLWjXm5UerCPzbnjus/e+Yek8yluEmb9ZMhnX7dOciqRJ05r1g6CY6sx3cjSiXTtaf/3OsonFGCMbTFX14INBwV9umr9lIrT8nQec5FmewzYyUnbXj9KMpU75xz0l+83UUsJ5tKqolT9iRu01Baqmu7VpZ5QyywlpPrrSYjRCB99m/TF4BqzZxu0lMrl35ut9mqoQU5SKzSopVNKU00NSZ1MVG+4cRfoCCVa/sbATkM9txrE
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2019 13:16:14.2283 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a4fcc98c-24d3-4c01-3408-08d77272d04f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2513
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D4D/5bCj6TvVVRDvDiedXMOypvZfwR1Fa0QcscRNJGw=;
 b=sqVVTiQIqqcaEvn1va8KsqQk/m12iCkPETnYuxNhHWWdeWBxxu+42NvaOzeQn7hszs0AQaFF7Cb1Hcp19K0jgg5CMVPLJFCVUeQioCAJQy2a97SyW5tOpBPoMPwCoHx1jvBb8vC/yjJyd7JjzglgUf7tET2n7erOOs38aC8X9oY=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D4D/5bCj6TvVVRDvDiedXMOypvZfwR1Fa0QcscRNJGw=;
 b=sqVVTiQIqqcaEvn1va8KsqQk/m12iCkPETnYuxNhHWWdeWBxxu+42NvaOzeQn7hszs0AQaFF7Cb1Hcp19K0jgg5CMVPLJFCVUeQioCAJQy2a97SyW5tOpBPoMPwCoHx1jvBb8vC/yjJyd7JjzglgUf7tET2n7erOOs38aC8X9oY=
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
aWhhaWwuYXRhbmFzc292QGFybS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9ueHAt
cHRuMzQ2MC5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvbnhwLXB0bjM0
NjAuYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvbnhwLXB0bjM0NjAuYwppbmRleCA1N2ZmMDEz
Mzk1NTkuLjI2NTZhMTg4YjQzNCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9u
eHAtcHRuMzQ2MC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvbnhwLXB0bjM0NjAuYwpA
QCAtMzIwLDggKzMyMCw4IEBAIHN0YXRpYyBpbnQgcHRuMzQ2MF9wcm9iZShzdHJ1Y3QgaTJjX2Ns
aWVudCAqY2xpZW50LAogCQlyZXR1cm4gcmV0OwogCX0KIAotCXB0bl9icmlkZ2UtPmJyaWRnZS5m
dW5jcyA9ICZwdG4zNDYwX2JyaWRnZV9mdW5jczsKLQlwdG5fYnJpZGdlLT5icmlkZ2Uub2Zfbm9k
ZSA9IGRldi0+b2Zfbm9kZTsKKwlkcm1fYnJpZGdlX2luaXQoJnB0bl9icmlkZ2UtPmJyaWRnZSwg
ZGV2LCAmcHRuMzQ2MF9icmlkZ2VfZnVuY3MsCisJCQlOVUxMLCBOVUxMKTsKIAlkcm1fYnJpZGdl
X2FkZCgmcHRuX2JyaWRnZS0+YnJpZGdlKTsKIAogCWkyY19zZXRfY2xpZW50ZGF0YShjbGllbnQs
IHB0bl9icmlkZ2UpOwotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
