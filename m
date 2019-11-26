Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA32109EE3
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 14:16:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F4CD6E332;
	Tue, 26 Nov 2019 13:16:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-eopbgr120054.outbound.protection.outlook.com [40.107.12.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F9746E332
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2019 13:16:25 +0000 (UTC)
Received: from VI1PR08CA0162.eurprd08.prod.outlook.com (2603:10a6:800:d1::16)
 by PR2PR08MB4780.eurprd08.prod.outlook.com (2603:10a6:101:1a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.16; Tue, 26 Nov
 2019 13:16:22 +0000
Received: from AM5EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::202) by VI1PR08CA0162.outlook.office365.com
 (2603:10a6:800:d1::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.16 via Frontend
 Transport; Tue, 26 Nov 2019 13:16:22 +0000
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT034.mail.protection.outlook.com (10.152.16.81) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.17 via Frontend Transport; Tue, 26 Nov 2019 13:16:22 +0000
Received: ("Tessian outbound f7868d7ede10:v33");
 Tue, 26 Nov 2019 13:16:22 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: cdcfc23dc0b3637b
X-CR-MTA-TID: 64aa7808
Received: from 206d54aa05cd.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.10.58]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6AB2C9AA-EDBB-45A7-90F3-A373C9AAD4DD.1; 
 Tue, 26 Nov 2019 13:16:16 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2058.outbound.protection.outlook.com [104.47.10.58])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 206d54aa05cd.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 26 Nov 2019 13:16:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qrar5kHH41BVuZLRO0jxVyDHRiocfjmimFLrDYuEnv6Y2pM0Shb9MFLgf1MEsyAGdhS+eG+bZoYeRBgLHLWq+m1ZmtjzVzyK65JhPgaP812NsYwjQt7HA0XAVgZy+b9BIy0cxWQVvQ6nx6JZJeHSgngWu7df84qVqoY3KW1miDi+sCMSjemzGht0ffzqky+HfXccDQ0a0oeQ5U3avFOQBi/AQoi53LMX6VFIXZOF9FVtq3fCFpK6CT2fA7QBAamGPBijs/B4ceN8/lwlGtW2zD5r4CXkjCRxOW03ZI5ugZKO9/JlZ3blkLlbxyjWIob86NqcS350Nd+OUectWDN9lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=277eEL94M2rHw20NJBX8K+BY/jR4YETRuPROMMFpHfU=;
 b=KrIQF50cu8q8cfulDMTBgeTVtfBWq0O3BbQgG8R+49zotCfJoHeglFtyEK4yEgAlLEwM6MMv/HsgKR4VwMRumrFkVG4URXm50jK/zrulUz2L9V4mRvj6Fyo1ZzM5ccN343vuBp8zWlNL4Q+evNFMf2vPh3DfzgtPBlXR/jrumpbdR09XuflvOx2zaWt12uRtc6wrKTb9x+EDUjix5l4Gc0G0ghwf40NMciM1YCf3JaKEcBaHLVFVuZP4TO08enqXIxW2hCov63A5onb3qFmq6N/rfy0N1k3SgnCurxAX54jg+HMrPKq9qwC0mpl+GGSrGqTGe2oQaT6mAkz6+UvP4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB4317.eurprd08.prod.outlook.com (20.179.28.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.16; Tue, 26 Nov 2019 13:16:15 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d%3]) with mapi id 15.20.2474.023; Tue, 26 Nov 2019
 13:16:15 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH 16/30] drm/bridge/synopsys: dsi: Use drm_bridge_init()
Thread-Topic: [PATCH 16/30] drm/bridge/synopsys: dsi: Use drm_bridge_init()
Thread-Index: AQHVpFuuu7uz+7T4vkyXcqiSDJ7s7w==
Date: Tue, 26 Nov 2019 13:16:15 +0000
Message-ID: <20191126131541.47393-17-mihail.atanassov@arm.com>
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
X-MS-Office365-Filtering-Correlation-Id: 9fce6a58-9a3a-42a3-2e25-08d77272d50d
X-MS-TrafficTypeDiagnostic: VI1PR08MB4317:|VI1PR08MB4317:|PR2PR08MB4780:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <PR2PR08MB4780E6DF925C5503A05F63628F450@PR2PR08MB4780.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:176;OLM:176;
x-forefront-prvs: 0233768B38
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(1496009)(4636009)(39860400002)(366004)(346002)(376002)(136003)(396003)(189003)(199004)(5640700003)(86362001)(6512007)(71200400001)(2616005)(6486002)(71190400001)(2906002)(4326008)(6916009)(44832011)(446003)(11346002)(54906003)(66946007)(316002)(66446008)(64756008)(66556008)(66476007)(6436002)(7416002)(4744005)(8936002)(186003)(26005)(5660300002)(102836004)(305945005)(14454004)(25786009)(99286004)(81166006)(50226002)(478600001)(2501003)(7736002)(6116002)(2351001)(76176011)(1076003)(52116002)(66066001)(256004)(8676002)(81156014)(6506007)(3846002)(386003)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB4317;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 1dEWGvytWJJ9YspW5ENK8y3MBEkBuSyp949tejwzIayrSy59ueAc5L5kC7pePLBS51lrJd/c7b1buHZeoPX+nWc4gnjhTef+Ck9jOcsZtPDqAmNWD2s5IE0VkeLhwxjCYGR0IIpFxZI9smFPpDpeVkVC4ztvALXigfcSwqwiCuahxMh5Vk1XfBOImaBbAcdyQpdnRaVQVtwvXC8pr/33nvhhO1GUmUTcFlvWuf6wOguGtvPGNbDDTjBpQq8P779zQqWLRYvmWwNnbdznlPm/Mb/62R+o6tbhmH/93up3tkcWfYO02oPDKPKfigXlYhgiyFLRQFUEJWMBZBdVW58371hVdIb+iMxPN74eqZgeEx4+wDWRlWto5dS0MOA6GoVFKRzS76k16JGQ/xxIJLpbUZBFNPPqu3Au0oYCTQroImO6sIa5IqYDCzmnLLiXv917
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4317
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(396003)(39860400002)(136003)(189003)(199004)(54906003)(6506007)(6916009)(107886003)(8676002)(26005)(5640700003)(106002)(478600001)(4744005)(26826003)(25786009)(7736002)(102836004)(305945005)(6512007)(356004)(336012)(4326008)(23756003)(76176011)(186003)(76130400001)(386003)(5660300002)(50466002)(8936002)(2906002)(2501003)(2351001)(2616005)(50226002)(81166006)(81156014)(70206006)(70586007)(8746002)(86362001)(36756003)(1076003)(11346002)(446003)(14454004)(99286004)(6486002)(22756006)(47776003)(316002)(36906005)(3846002)(6116002)(66066001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:PR2PR08MB4780;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 7b18cebc-f988-41fc-87a7-08d77272d089
NoDisclaimer: True
X-Forefront-PRVS: 0233768B38
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jofNHCTo/DUlg19pNisxQU2kGORuaHhsaPe2CBngtaM0DnKjj2Onzi00IxtBTfzWJ8WEGwYmJsy/fyKXRxwEAS2MJH/mXtQbajaLau+ULdje8ilTbG2w0nOK68/1grKn3klt1pJykHLhjSUJUdUH89LxKZ0QaW7RN4ombcjXBlRoDdJxDQqgZmvTETpWIsqDA2Vb3Wz4/KtOxbC56/SrdEtvCzW0wDMvCwOAgHwOSG8mzMFMhB4gVJMszFEb/xghXCKIe6KWCUWpX2saz0kGtQb79Th2P6fMXBbGImA5yg0U48Zz8bfnb2zcWGOtiiWwpwo2xWbpIPmQMiXkIuLg8Tzv4RKx1dQXV1d2HCFBvxNNpMgrnn46jLUzgLagnZMGjtNMlgbUi0musgPpKB5NM+2Tzw9RN39VxORgRXtWo6yAy1uipGMUTLqfh/5MHKj5
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2019 13:16:22.1893 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fce6a58-9a3a-42a3-2e25-08d77272d50d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4780
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=277eEL94M2rHw20NJBX8K+BY/jR4YETRuPROMMFpHfU=;
 b=tF1eOEzlOQp76zat/U8OVR7N7/NUkihEyCJo5KHQlq/1dYPJSmu0Ko1u3IJM0Q+au8d8sf+9mJFDjAelLmbBsMnhG8bljm7xwCfEKfkGYknOr3qLxPIvYetlxsi1ziAGom7XKjqNJ3UsuHB0RyzW2pLhLeOcPUBqhj13AtTDUIY=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=277eEL94M2rHw20NJBX8K+BY/jR4YETRuPROMMFpHfU=;
 b=tF1eOEzlOQp76zat/U8OVR7N7/NUkihEyCJo5KHQlq/1dYPJSmu0Ko1u3IJM0Q+au8d8sf+9mJFDjAelLmbBsMnhG8bljm7xwCfEKfkGYknOr3qLxPIvYetlxsi1ziAGom7XKjqNJ3UsuHB0RyzW2pLhLeOcPUBqhj13AtTDUIY=
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
 =?iso-8859-1?Q?Yannick_Fertr=E9?= <yannick.fertre@st.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, nd <nd@arm.com>,
 Sam Ravnborg <sam@ravnborg.org>, Matt Redfearn <matt.redfearn@thinci.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm8gZnVuY3Rpb25hbCBjaGFuZ2UuCgpTaWduZWQtb2ZmLWJ5OiBNaWhhaWwgQXRhbmFzc292IDxt
aWhhaWwuYXRhbmFzc292QGFybS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5v
cHN5cy9kdy1taXBpLWRzaS5jIHwgNyArKy0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlk
Z2Uvc3lub3BzeXMvZHctbWlwaS1kc2kuYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3Bz
eXMvZHctbWlwaS1kc2kuYwppbmRleCBiNmU3OTNiYjY1M2MuLjA1MWY5YWFmNTg2NyAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1taXBpLWRzaS5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctbWlwaS1kc2kuYwpAQCAtMTA1Miwx
MSArMTA1Miw4IEBAIF9fZHdfbWlwaV9kc2lfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldiwKIAkJcmV0dXJuIEVSUl9QVFIocmV0KTsKIAl9CiAKLQlkc2ktPmJyaWRnZS5kcml2ZXJf
cHJpdmF0ZSA9IGRzaTsKLQlkc2ktPmJyaWRnZS5mdW5jcyA9ICZkd19taXBpX2RzaV9icmlkZ2Vf
ZnVuY3M7Ci0jaWZkZWYgQ09ORklHX09GCi0JZHNpLT5icmlkZ2Uub2Zfbm9kZSA9IHBkZXYtPmRl
di5vZl9ub2RlOwotI2VuZGlmCisJZHJtX2JyaWRnZV9pbml0KCZkc2ktPmJyaWRnZSwgJnBkZXYt
PmRldiwgJmR3X21pcGlfZHNpX2JyaWRnZV9mdW5jcywKKwkJCU5VTEwsIGRzaSk7CiAKIAlyZXR1
cm4gZHNpOwogfQotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
