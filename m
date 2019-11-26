Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD60109EEE
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 14:17:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF5616E3AC;
	Tue, 26 Nov 2019 13:16:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140042.outbound.protection.outlook.com [40.107.14.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBF2C6E358
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2019 13:16:30 +0000 (UTC)
Received: from HE1PR08CA0071.eurprd08.prod.outlook.com (2603:10a6:7:2a::42) by
 AM6PR08MB3879.eurprd08.prod.outlook.com (2603:10a6:20b:8c::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.19; Tue, 26 Nov 2019 13:16:28 +0000
Received: from VE1EUR03FT059.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::200) by HE1PR08CA0071.outlook.office365.com
 (2603:10a6:7:2a::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.17 via Frontend
 Transport; Tue, 26 Nov 2019 13:16:28 +0000
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT059.mail.protection.outlook.com (10.152.19.60) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.17 via Frontend Transport; Tue, 26 Nov 2019 13:16:28 +0000
Received: ("Tessian outbound 712c40e503a7:v33");
 Tue, 26 Nov 2019 13:16:13 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b69359a9aa1b7bd6
X-CR-MTA-TID: 64aa7808
Received: from eb4165d38a59.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.14.58]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8F49B243-D0E0-4A24-A9E0-E1DA024E1BED.1; 
 Tue, 26 Nov 2019 13:16:08 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2058.outbound.protection.outlook.com [104.47.14.58])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id eb4165d38a59.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 26 Nov 2019 13:16:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G6718M6WIG7cznXs21aajtfzYW649KgFYmnuuofdSy4g/DvXdwMCpmhMp//d9RdlD9ur8/LgPgeqfzeyafteeACEK01JrB7dvHabsIb0EgGdPMn9pLyNEpauWpA0ZUgVg1P3CmtkvnjJk6kmGAcLu0c0mvTcAYp3MUnQ6HsFaZYSzCXJd4DEvFOhRg1Yyli8vaQGYPlE08h3HEz9dqBZDgzDs7Se1WWmwfoYYJ437Qt9Y+SXmq7ajkVVOR8dYqUwoFUdJEUfyXZlwo16IjRimcGOJHIkovKanpQT6HrUAjGVYiGKjwfVZRBwr6w/LNUWs5KA4SrTIcCHnRK018dpWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=528OVsPgmledT3KzwsU137Xb39xXYhXTngkZrmxaBXM=;
 b=UVRHQI5NSR5z9Z2tmeofrDay4MVQ0KobLR9uetxScQiMbU3atw1g2CgHZftlx/ZUR5EQ3H1E1ZmoSx3t5e5MVUuuRf5vljRw/mtelBFTXcT68x42bMkgn97vkmJ37YSbZs9LIUvq9jsCq/9ezwiOhuh1Dxf2iHT0YfhrhUziq/aGYHMltTzoCrdZBhzj4qKAV00ORwReB/1TyVvIZom/H1sm4FT67LcTbxKLgZLEAxVJWWKIiithlx+AtfR3DW6YJUUrh/w9hJlSWS+3zDlcJCn1mVhdFHzD4i/QZgrgLvAOqV9wvnFHKPPuYp5HTVc2wb+b65KeXgpqOJ06pPpq2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB4317.eurprd08.prod.outlook.com (20.179.28.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.16; Tue, 26 Nov 2019 13:16:06 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d%3]) with mapi id 15.20.2474.023; Tue, 26 Nov 2019
 13:16:06 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH 08/30] drm/bridge: megachips-stdpxxxx-ge-b850v3-fw: Use
 drm_bridge_init()
Thread-Topic: [PATCH 08/30] drm/bridge: megachips-stdpxxxx-ge-b850v3-fw: Use
 drm_bridge_init()
Thread-Index: AQHVpFupoTyMiBGaqE2PqP/t3pS+oQ==
Date: Tue, 26 Nov 2019 13:16:06 +0000
Message-ID: <20191126131541.47393-9-mihail.atanassov@arm.com>
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
X-MS-Office365-Filtering-Correlation-Id: d9b51a94-232c-4e42-0212-08d77272d893
X-MS-TrafficTypeDiagnostic: VI1PR08MB4317:|VI1PR08MB4317:|AM6PR08MB3879:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB387972F61FDEF578796A346B8F450@AM6PR08MB3879.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:324;OLM:324;
x-forefront-prvs: 0233768B38
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(1496009)(4636009)(39860400002)(366004)(346002)(376002)(136003)(396003)(189003)(199004)(5640700003)(86362001)(6512007)(71200400001)(2616005)(6486002)(71190400001)(2906002)(4326008)(6916009)(44832011)(446003)(11346002)(54906003)(66946007)(316002)(66446008)(64756008)(66556008)(66476007)(6436002)(7416002)(4744005)(8936002)(186003)(26005)(5660300002)(102836004)(305945005)(14454004)(25786009)(99286004)(81166006)(50226002)(478600001)(2501003)(7736002)(6116002)(2351001)(76176011)(1076003)(52116002)(66066001)(256004)(14444005)(8676002)(81156014)(6506007)(3846002)(386003)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB4317;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 4VUgw8KHe+8hT3ET9hAb5BZeNLc32X1H66UjnzLNyB57x+IkhAd5bSvIvThkYG8QarEGl7Pb9kTyW6sGXNOjut3etc2aumEj32RAMqFku/1BUYlV9LKgCXMWejLoALeMa0FGds4RmJQVjOiV4qjqDISCLMUnqB5RyOroepAnLvFchKMBk03K7g2NFDuaKi6bHez/Js5Y5yiFf9N5xoqXbNpf9pM++7sawQ+n86urLPQApz+WWFzJnIU/qcNSrDNUEOBYe0JeW5PkAXNpBEIVvT2nnkFJla9/d4bisZkq5EJbhA1yaw69kbfoTn/okynj2HopKs8XENNsnoh24k76YVF6NJgEfpxr7pghCJpDySXjj3z50qruadB53BM+pa+twA9XU26aHd+xgrV5VtFlduI0fkCWnc9fUEMhZqFOQRUVyp89h+7E6F93C6s6Jnmz
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4317
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(396003)(39860400002)(136003)(199004)(189003)(8936002)(2501003)(14444005)(2351001)(6916009)(356004)(7736002)(305945005)(76130400001)(5660300002)(50226002)(66066001)(47776003)(107886003)(4326008)(478600001)(26826003)(14454004)(76176011)(1076003)(316002)(81156014)(8676002)(36756003)(81166006)(5640700003)(25786009)(106002)(6512007)(336012)(54906003)(6506007)(386003)(26005)(4744005)(102836004)(70586007)(6486002)(86362001)(2616005)(6116002)(3846002)(23756003)(99286004)(70206006)(50466002)(446003)(11346002)(2906002)(186003)(8746002)(22756006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB3879;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: cc23e328-4222-4a2f-1e6d-08d77272cb79
NoDisclaimer: True
X-Forefront-PRVS: 0233768B38
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5+dKqz8ZHSFu05akHQwTRq0K6IaTxW7N3icVLM9jOoXFDNP6j6ubjMD6KaaAM5aJFHrsw4SEHGHlGuRbORHM3vnbl9nwKYPgSB/qw8iJqDxzKHWD7Q0/+F7/GTh8kWfLpbPApeCcQxn/Rhf5mHXP3/K0Gifs4OFuhC7EK7whIBKL0IhdyzmBi0BxaxCVXNOF1diLHFgTPNehabC/KLc1S9ZDoCEV0X6RhrYXTqMAYod0UeUxjF5X1ebYMXAnwtBUYW9qS5/VGhwRUFhFD/FNFYajJdGK5/TSg7BSziNsd5pknx5eXq7EQr6T3xJqVT3RT8BOJm2dxow+ZStxY/GG+ypYcQqSIMppKgeSh6qv1inhzEvx3Jn6tX8FaBp9BqhQd0lJ2a+60WojiSuBEBCuoAxM6cjG4KVD0uF6qcbXZ56l6hRRoOAYq9l/jQ1U8kqU
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2019 13:16:28.0504 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9b51a94-232c-4e42-0212-08d77272d893
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3879
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=528OVsPgmledT3KzwsU137Xb39xXYhXTngkZrmxaBXM=;
 b=u/dgm9lyzcBsToTjvghYaxq4lZMMS3j5Sj+5lyhOdLGlxxLh/Fuybw1oR0pVUKwCz6WXBpAtm7MnEDOmdw6M0VzmcjaSPCmsApaGE0QEMox/WegEraquHCNQkL2gPGUdqOdq2ClN2f0ZtgKNXt6dC4b6xqVL0HdIckDuCOrwpks=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=528OVsPgmledT3KzwsU137Xb39xXYhXTngkZrmxaBXM=;
 b=u/dgm9lyzcBsToTjvghYaxq4lZMMS3j5Sj+5lyhOdLGlxxLh/Fuybw1oR0pVUKwCz6WXBpAtm7MnEDOmdw6M0VzmcjaSPCmsApaGE0QEMox/WegEraquHCNQkL2gPGUdqOdq2ClN2f0ZtgKNXt6dC4b6xqVL0HdIckDuCOrwpks=
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
 Mihail Atanassov <Mihail.Atanassov@arm.com>,
 Martyn Welch <martyn.welch@collabora.co.uk>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Peter Senna Tschudin <peter.senna@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, nd <nd@arm.com>,
 Martin Donnelly <martin.donnelly@ge.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm8gZnVuY3Rpb25hbCBjaGFuZ2UuCgpTaWduZWQtb2ZmLWJ5OiBNaWhhaWwgQXRhbmFzc292IDxt
aWhhaWwuYXRhbmFzc292QGFybS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9tZWdh
Y2hpcHMtc3RkcHh4eHgtZ2UtYjg1MHYzLWZ3LmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2JyaWRnZS9tZWdhY2hpcHMtc3RkcHh4eHgtZ2UtYjg1MHYzLWZ3LmMgYi9kcml2ZXJzL2dw
dS9kcm0vYnJpZGdlL21lZ2FjaGlwcy1zdGRweHh4eC1nZS1iODUwdjMtZncuYwppbmRleCBlOGE0
OWY2MTQ2YzYuLmQ1NjdjZDYzODEwZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRn
ZS9tZWdhY2hpcHMtc3RkcHh4eHgtZ2UtYjg1MHYzLWZ3LmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L2JyaWRnZS9tZWdhY2hpcHMtc3RkcHh4eHgtZ2UtYjg1MHYzLWZ3LmMKQEAgLTMwMyw4ICszMDMs
OCBAQCBzdGF0aWMgaW50IHN0ZHA0MDI4X2dlX2I4NTB2M19md19wcm9iZShzdHJ1Y3QgaTJjX2Ns
aWVudCAqc3RkcDQwMjhfaTJjLAogCWkyY19zZXRfY2xpZW50ZGF0YShzdGRwNDAyOF9pMmMsIGdl
X2I4NTB2M19sdmRzX3B0cik7CiAKIAkvKiBkcm0gYnJpZGdlIGluaXRpYWxpemF0aW9uICovCi0J
Z2VfYjg1MHYzX2x2ZHNfcHRyLT5icmlkZ2UuZnVuY3MgPSAmZ2VfYjg1MHYzX2x2ZHNfZnVuY3M7
Ci0JZ2VfYjg1MHYzX2x2ZHNfcHRyLT5icmlkZ2Uub2Zfbm9kZSA9IGRldi0+b2Zfbm9kZTsKKwlk
cm1fYnJpZGdlX2luaXQoJmdlX2I4NTB2M19sdmRzX3B0ci0+YnJpZGdlLCBkZXYsICZnZV9iODUw
djNfbHZkc19mdW5jcywKKwkJCU5VTEwsIE5VTEwpOwogCWRybV9icmlkZ2VfYWRkKCZnZV9iODUw
djNfbHZkc19wdHItPmJyaWRnZSk7CiAKIAkvKiBDbGVhciBwZW5kaW5nIGludGVycnVwdHMgc2lu
Y2UgcG93ZXIgdXAuICovCi0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
