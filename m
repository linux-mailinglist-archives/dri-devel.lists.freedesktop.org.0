Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D1B109ED7
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 14:16:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 039896E32B;
	Tue, 26 Nov 2019 13:16:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40075.outbound.protection.outlook.com [40.107.4.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BD1D6E313
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2019 13:16:18 +0000 (UTC)
Received: from VI1PR08CA0186.eurprd08.prod.outlook.com (2603:10a6:800:d2::16)
 by VE1PR08MB5215.eurprd08.prod.outlook.com (2603:10a6:803:10a::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.21; Tue, 26 Nov
 2019 13:16:15 +0000
Received: from AM5EUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::201) by VI1PR08CA0186.outlook.office365.com
 (2603:10a6:800:d2::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.17 via Frontend
 Transport; Tue, 26 Nov 2019 13:16:15 +0000
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT020.mail.protection.outlook.com (10.152.16.116) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.17 via Frontend Transport; Tue, 26 Nov 2019 13:16:15 +0000
Received: ("Tessian outbound a8f166c1f585:v33");
 Tue, 26 Nov 2019 13:16:15 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 51c551ae3758d5a3
X-CR-MTA-TID: 64aa7808
Received: from 968035f9f19d.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.10.52]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A4DF99FB-5B7C-4452-B961-7A65C670F671.1; 
 Tue, 26 Nov 2019 13:16:10 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2052.outbound.protection.outlook.com [104.47.10.52])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 968035f9f19d.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 26 Nov 2019 13:16:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pqsx+q7WO6s7kCgm44ng7zRUM3Gnv11VAn0ggNwNTawiJ9FQ4MMUZjne5dxj6gwrqzHRoKBwpTWxnPhr1KCcfioNCc6e+WaCrNafWvmEYfpBOT++uVXeAyy1C+2QqIW1jIEWryaVNWNJCVt20vRFl9UeAV83JCzadGyzmR8haQ5UAcdIJ3CQocYXkc0d8la18yzsLSmGWOzxiQ3dQ8/+HJffmqAR5HOyQyR9EnjctaUpT/MgQAkMxlHrWtSU0Rh22saicd2A06uJjhu/ZPjH7FXtTeiVd3L32kpSAZ4Q3zIA9ZQXPp2zxwkWAkEPrrxoh+esbmmNMHO60WOkbMmGtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gKX2QEoiMcI48kOVP6yPNKCVpbRPSGyLW7NiFE2+cdA=;
 b=crCVIXr9Syiv1xmtQnEKT+ThJqSX7Jnwfjj9gPEb4QNilDu8eCDyOxm2fQIox43GjXWPQ8y/njYLlWLpJRB2+e58vzN/lxbOu7OiRlCT/oWikChLsOIdfvJenkpRK1Sht8VbQfW9vmT6xZ0DywnOHi8Oh1spiFcMUdtUafepR6DohK5atMMoiEv2hRIcrlndcYdOpP9D/o9OXQmx1IRJheVgQeLdcaAkmW1VNEOura9LrseOqAWCchHecmxRCOpJQrc0lTHjATLqlyHc0sRl7OW7PI7jjgZjtE6WB9/ToSOUX0xHSoZ+glvlpV+0jffe4IyD7cFJ9rDJtrNmMtBSJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB4317.eurprd08.prod.outlook.com (20.179.28.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.16; Tue, 26 Nov 2019 13:16:08 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d%3]) with mapi id 15.20.2474.023; Tue, 26 Nov 2019
 13:16:08 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH 10/30] drm/bridge: panel: Use drm_bridge_init()
Thread-Topic: [PATCH 10/30] drm/bridge: panel: Use drm_bridge_init()
Thread-Index: AQHVpFuq5irvJSnAN0+ujiTuPMRYMw==
Date: Tue, 26 Nov 2019 13:16:08 +0000
Message-ID: <20191126131541.47393-11-mihail.atanassov@arm.com>
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
X-MS-Office365-Filtering-Correlation-Id: a80afabc-3da7-46fb-309f-08d77272d112
X-MS-TrafficTypeDiagnostic: VI1PR08MB4317:|VI1PR08MB4317:|VE1PR08MB5215:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VE1PR08MB52158792DF684A5EAE9672F48F450@VE1PR08MB5215.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:176;OLM:176;
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
X-Microsoft-Antispam-Message-Info-Original: A3NozrP8WLfq2LchbEEdCkQfd3zsfHgS7FCm7JLug0RzxG1F6ANw/7utf44ziNKp/Uz6VY9jIQ6Ctjui5HsB2cbPXqaylwPDux8TuxkS7fVwTQYE5eXT1hegtZhFtSYLrKxUj4e6HxgIogmauyd3/Ymuz/3AkqSs5/qvYhJFzceT9kgwI/d4NqfBLFEzSRtKlBh/cqJstiZb6Ua3IkTvh6firUkZ7Lf/5wtK36wgEE+Z2FLwz2dfj+rAp0lLThCKZ1dPtTqG3WaWVdfqioIFR1F8iD7DJm296ln8JflVqZX4Q1r/HRqJhKiuOQyyTnM2NOLiGbXI+RlMDJliGa1t3KexdgEopqUWypjgkKOn2KgcR58j5uSWQxC1c3RmNVcxxpMtPH7V1hB65nHPA5x0DBt1AJOG4iwGrZmeN7n+9bpNw/78OJCr6KZZ7+0sd6XM
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4317
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(376002)(396003)(39860400002)(189003)(199004)(478600001)(76176011)(50466002)(2501003)(2351001)(99286004)(11346002)(26005)(186003)(76130400001)(5640700003)(1076003)(22756006)(356004)(47776003)(102836004)(107886003)(23756003)(6506007)(386003)(66066001)(4326008)(5660300002)(6486002)(6512007)(2616005)(7736002)(36906005)(14454004)(86362001)(336012)(70206006)(70586007)(316002)(25786009)(26826003)(305945005)(2906002)(8746002)(8676002)(81166006)(50226002)(3846002)(6116002)(8936002)(54906003)(6916009)(81156014)(106002)(446003)(4744005)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB5215;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: e08b4ffd-ff82-4325-222b-08d77272ccba
NoDisclaimer: True
X-Forefront-PRVS: 0233768B38
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: br0vK/LgxlZ9EcRwt7iP+SCX9vLpGbY6cKtBZkR7h8nfSDGxtOSYVvMzSTcZzc7h6+NrMXUlvE3SIKFGCfsqU6MJQxfNWX5ZB+vuX7SLYVj89fOt8JtIX/omFy72PD8a0IG0erlyrIM6hTVe2ty8G/pgAeDAI7bgq8sNiK9ktidaYq8cAbVnpfVylLwBzhuWB3hMzgFnDUdd+2wqrRgpDRu0wqzLyXkoy2mD1ZO1js9vi28xnYaMzCNDxSqWvKDgX7ACcTp+88tLecRbmvpAjgBp3r71Uh6KcKm8/DOpcOGs7wbqpU9+k29+IKaKXObXt+qA1ZqY44xDEoSb805fDiwEfS3E1OveUsmDwlwLr2zl361o/GuuEMFSLIocSfUTxpTmHH5rRcGa5owje8m7Dz7A5QZ1PtRfFd99hWy9SMW2yNgAF4L8C0fbQecrrrm8
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2019 13:16:15.5092 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a80afabc-3da7-46fb-309f-08d77272d112
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5215
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gKX2QEoiMcI48kOVP6yPNKCVpbRPSGyLW7NiFE2+cdA=;
 b=fND/uxG6DmCfQDDILWaeafM+Hw6cyX1VXsbrWPN/n2BDe70Neb8wTV9Bh14r0j8mUw3qBkkQL/pFn9yAs/AX38n5ZRfzVCs5mYAGhrA2KmD7HeUEGUv1OeQW0bRGmMUlnF1MqDOqcckyl6CiERIH/UPkmPhWJTYeEq1bSfeRGvk=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gKX2QEoiMcI48kOVP6yPNKCVpbRPSGyLW7NiFE2+cdA=;
 b=fND/uxG6DmCfQDDILWaeafM+Hw6cyX1VXsbrWPN/n2BDe70Neb8wTV9Bh14r0j8mUw3qBkkQL/pFn9yAs/AX38n5ZRfzVCs5mYAGhrA2KmD7HeUEGUv1OeQW0bRGmMUlnF1MqDOqcckyl6CiERIH/UPkmPhWJTYeEq1bSfeRGvk=
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
aWhhaWwuYXRhbmFzc292QGFybS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9wYW5l
bC5jIHwgNyArKy0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA1IGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvcGFuZWwuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9icmlkZ2UvcGFuZWwuYwppbmRleCBmNGUyOTNlN2NmNjQuLjkxZDY4ZDAz
MzdjYyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9wYW5lbC5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9icmlkZ2UvcGFuZWwuYwpAQCAtMTkyLDExICsxOTIsOCBAQCBzdHJ1Y3Qg
ZHJtX2JyaWRnZSAqZHJtX3BhbmVsX2JyaWRnZV9hZGRfdHlwZWQoc3RydWN0IGRybV9wYW5lbCAq
cGFuZWwsCiAJcGFuZWxfYnJpZGdlLT5jb25uZWN0b3JfdHlwZSA9IGNvbm5lY3Rvcl90eXBlOwog
CXBhbmVsX2JyaWRnZS0+cGFuZWwgPSBwYW5lbDsKIAotCXBhbmVsX2JyaWRnZS0+YnJpZGdlLmZ1
bmNzID0gJnBhbmVsX2JyaWRnZV9icmlkZ2VfZnVuY3M7Ci0jaWZkZWYgQ09ORklHX09GCi0JcGFu
ZWxfYnJpZGdlLT5icmlkZ2Uub2Zfbm9kZSA9IHBhbmVsLT5kZXYtPm9mX25vZGU7Ci0jZW5kaWYK
LQorCWRybV9icmlkZ2VfaW5pdCgmcGFuZWxfYnJpZGdlLT5icmlkZ2UsIHBhbmVsLT5kZXYsCisJ
CQkmcGFuZWxfYnJpZGdlX2JyaWRnZV9mdW5jcywgTlVMTCwgTlVMTCk7CiAJZHJtX2JyaWRnZV9h
ZGQoJnBhbmVsX2JyaWRnZS0+YnJpZGdlKTsKIAogCXJldHVybiAmcGFuZWxfYnJpZGdlLT5icmlk
Z2U7Ci0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
