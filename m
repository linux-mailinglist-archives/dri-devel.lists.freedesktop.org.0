Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6F8112A81
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2019 12:48:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C210B6E8CC;
	Wed,  4 Dec 2019 11:48:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02on0607.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe05::607])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFC6F6E8CA
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2019 11:48:18 +0000 (UTC)
Received: from VI1PR08CA0241.eurprd08.prod.outlook.com (2603:10a6:803:dc::14)
 by VI1PR08MB4030.eurprd08.prod.outlook.com (2603:10a6:803:eb::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.20; Wed, 4 Dec
 2019 11:48:15 +0000
Received: from DB5EUR03FT059.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::202) by VI1PR08CA0241.outlook.office365.com
 (2603:10a6:803:dc::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.12 via Frontend
 Transport; Wed, 4 Dec 2019 11:48:15 +0000
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT059.mail.protection.outlook.com (10.152.21.175) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18 via Frontend Transport; Wed, 4 Dec 2019 11:48:15 +0000
Received: ("Tessian outbound d55de055a19b:v37");
 Wed, 04 Dec 2019 11:48:14 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 874064abf3568cd1
X-CR-MTA-TID: 64aa7808
Received: from a83b0422c187.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F2A5E4E6-D138-4B4A-A292-02A1215F4B21.1; 
 Wed, 04 Dec 2019 11:48:09 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a83b0422c187.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 04 Dec 2019 11:48:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mTK1AaUivdIof3/5nwpn7TozAmjNzEoX5VPodlo4whyV3GEyBpBfvQhggUmSpDJzFgEMDfzCC7uLf025qmzP2MIVmsE9lTGXDYIQ2bLc9lRv+UtpJvxUSzjFMcSVv/zFC+CGOyx+ganbJknYWO+0+eKILYIyIk8KGn6SXfOndXODaJR+sMC40/Nb4w76Ry4PkqpMru+v5mUdAsRKkXhVbt1t/qEbLc5fAv2+fTNq2mYmSI1HD5kO+XAqnr2PQgns3v6FH+tdc43j4/4Rki4eNQ+OmJO7P8VWuZj/6E4FdT+aaB9kmWRCY/fzRTvbRPm57A1GN36vJh0HE8w0OnMbCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zsj1ZwfMocxMmhXuaRq5ay7fcHZ5bq2hDSJxGG7/gpQ=;
 b=gN3Owv2jCuI1LnjWgmv47ZxJkFKdicdeXMAo2a3mib3S52RuUcbK5MwxNKYZSDgMioV4MwgarlKtA6QAmAhP0rqbICoEWoTL1QbytOw8Fpm6P1JGXZAUbaSuG2f+xGSVGmA6Xf1rQi6Aw0YKf6qSfAxdHRFPsm00n3gUBfG+Q2/x8QCtoDLyGSW0T+FyJ9A44FAT2VZ20RQ3gfAQAUZNtXmVVJqoQvzHvRFuATjm/ypM38N7FxwR5R9TDAZ8oGkTMIYVjdQn1yH2JDM9DvY1rIomDpQCzVCARtHVJxTORG/TXHikWuVxkVBtKICAXxu4KgfG1CBO9cnCBr+B1a/XPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB3085.eurprd08.prod.outlook.com (52.133.15.153) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.19; Wed, 4 Dec 2019 11:48:06 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d%3]) with mapi id 15.20.2495.014; Wed, 4 Dec 2019
 11:48:06 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 05/28] drm/bridge: dumb-vga-dac: Use drm_bridge_init()
Thread-Topic: [PATCH v2 05/28] drm/bridge: dumb-vga-dac: Use drm_bridge_init()
Thread-Index: AQHVqpix5N1UMtua3E6i7lQhXvu6XA==
Date: Wed, 4 Dec 2019 11:48:06 +0000
Message-ID: <20191204114732.28514-6-mihail.atanassov@arm.com>
References: <20191204114732.28514-1-mihail.atanassov@arm.com>
In-Reply-To: <20191204114732.28514-1-mihail.atanassov@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.55]
x-clientproxiedby: LNXP265CA0055.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::19) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
x-mailer: git-send-email 2.23.0
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: fa6b5dcf-59a9-456d-2591-08d778afd92d
X-MS-TrafficTypeDiagnostic: VI1PR08MB3085:|VI1PR08MB3085:|VI1PR08MB4030:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VI1PR08MB403059262E5EF92A387F9EC88F5D0@VI1PR08MB4030.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:46;OLM:46;
x-forefront-prvs: 0241D5F98C
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(136003)(39860400002)(366004)(396003)(199004)(189003)(2501003)(1076003)(478600001)(4744005)(6436002)(6512007)(8936002)(6486002)(54906003)(44832011)(4326008)(316002)(50226002)(8676002)(5660300002)(2906002)(81156014)(81166006)(6116002)(3846002)(66946007)(66476007)(66556008)(66446008)(64756008)(11346002)(186003)(2616005)(14454004)(52116002)(76176011)(99286004)(2351001)(25786009)(86362001)(26005)(5640700003)(6916009)(102836004)(71200400001)(305945005)(7736002)(71190400001)(6506007)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3085;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: IN46WK0zdOcas2nOV3ChnTBi9Mx7NAQl+gWiMExRQ65CujbceMbaBZnfUYCMQ68VGbUg+LC0swznpyfaubCK3EOAt3jsGhcRSMbnt1Lyv+OuHCT4R9D2JIMlvzjx7lK3Pwru0BfPzhsqgGec8iq/occKB3j7waLj+aM2E9KjSvK0eMRuAYZpAX0HwUHoRa+VFWWzNjIyH/P3hXaKSIZcnPn3KtSt/g5x/svDB7x5vL5XeLTOPMPXlENkXCwMq6FH5CTzX9EYFpFMj/i50YHFi1Cp17Y+6MDusFMOC9EXf+20r36+1Rk2JN4SXfr8RQLsDW6JZ6lJSvuDPFCwIM9VYSdbDSYEaFFysAKDZOjErlH9cEqgxhkgbqlduT7pmRxFOrOmHb/XyPFhVg2oJwKQ1yGKB3h8Nrwp2m45KoF9G6V3Gnjk0KsbV0ydo63EJeIW
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3085
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(396003)(136003)(376002)(199004)(189003)(478600001)(186003)(102836004)(14454004)(5660300002)(36756003)(11346002)(4744005)(50466002)(23756003)(305945005)(2616005)(22756006)(4326008)(70206006)(26826003)(76130400001)(1076003)(70586007)(107886003)(26005)(7736002)(316002)(8676002)(6512007)(54906003)(336012)(76176011)(6116002)(6916009)(2906002)(86362001)(6506007)(5640700003)(2501003)(99286004)(50226002)(356004)(8936002)(25786009)(2351001)(6486002)(81166006)(3846002)(81156014)(8746002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB4030;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 5da8f555-4496-4e19-2693-08d778afd3ab
NoDisclaimer: True
X-Forefront-PRVS: 0241D5F98C
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ieMnGwBRm+zFC8AowMFSvA2XZGUqpA7IARvmPXpJmfMCeFXKhDxRaz9zVQHChyl9HxcKW7LrVz1uSpgSXCqIOT6wONDfZbYUuCKieWtCAM4gJ6lrbhPghbIwmYIfolyaq4XoIg+i11GFyO8JO+VOKrgbi7ZCdxxnFk4zGEGm3ZcUAgufreCVya9gh9OS52KDIKBN5HXQFB2vAR6C0ZsJEhthlAosjuUecpLfdR5X4Oyc+fRwVoI86z5RIXPr5fIkCBf8AlH5rX4ibnA0Azj7tsWbFVrKlC5wGvZNzKbJjcYxonjxTr1AB9XeA/8uM8afWgkI99zkZ2s3CGQ8iQUt51njN115XUkf2DMkBzKeKfTQn2UUI/T+A2w/JxNiq+OI3McP1K0M6Hx552nRVyrPbOewUh4d+yBW/hTpoHuYJ/7TcWp+PVaK7E1ZQPv3b1tO
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2019 11:48:15.3878 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa6b5dcf-59a9-456d-2591-08d778afd92d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4030
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zsj1ZwfMocxMmhXuaRq5ay7fcHZ5bq2hDSJxGG7/gpQ=;
 b=Fd0OGDB8+UM/HnzHYjR6RDrj0AuyvIMeqBr7sOTavTAQC6eStzv01tXxazQJQwhLVl41qP7eYC3XYX+7+lOXSB3B2CRdEwOSlopUAxNwm6SYkzO/0MVbq/x8uHySNj7+9vQlxCxeuhzOnhUZ2Ce7FDeYx+lqkmnkiQJsBfikukk=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zsj1ZwfMocxMmhXuaRq5ay7fcHZ5bq2hDSJxGG7/gpQ=;
 b=Fd0OGDB8+UM/HnzHYjR6RDrj0AuyvIMeqBr7sOTavTAQC6eStzv01tXxazQJQwhLVl41qP7eYC3XYX+7+lOXSB3B2CRdEwOSlopUAxNwm6SYkzO/0MVbq/x8uHySNj7+9vQlxCxeuhzOnhUZ2Ce7FDeYx+lqkmnkiQJsBfikukk=
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
aWhhaWwuYXRhbmFzc292QGFybS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9kdW1i
LXZnYS1kYWMuYyB8IDYgKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA0
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvZHVtYi12
Z2EtZGFjLmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2R1bWItdmdhLWRhYy5jCmluZGV4IGNj
MzNkYzQxMWI5ZS4uODk2ZjI3MjcyZTM4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJp
ZGdlL2R1bWItdmdhLWRhYy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvZHVtYi12Z2Et
ZGFjLmMKQEAgLTIwNSwxMCArMjA1LDggQEAgc3RhdGljIGludCBkdW1iX3ZnYV9wcm9iZShzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCQl9CiAJfQogCi0JdmdhLT5icmlkZ2UuZnVuY3Mg
PSAmZHVtYl92Z2FfYnJpZGdlX2Z1bmNzOwotCXZnYS0+YnJpZGdlLm9mX25vZGUgPSBwZGV2LT5k
ZXYub2Zfbm9kZTsKLQl2Z2EtPmJyaWRnZS50aW1pbmdzID0gb2ZfZGV2aWNlX2dldF9tYXRjaF9k
YXRhKCZwZGV2LT5kZXYpOwotCisJZHJtX2JyaWRnZV9pbml0KCZ2Z2EtPmJyaWRnZSwgJnBkZXYt
PmRldiwgJmR1bWJfdmdhX2JyaWRnZV9mdW5jcywKKwkJCW9mX2RldmljZV9nZXRfbWF0Y2hfZGF0
YSgmcGRldi0+ZGV2KSwgTlVMTCk7CiAJZHJtX2JyaWRnZV9hZGQoJnZnYS0+YnJpZGdlKTsKIAog
CXJldHVybiAwOwotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
