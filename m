Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 500CA109EDB
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 14:16:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9F826E343;
	Tue, 26 Nov 2019 13:16:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30071.outbound.protection.outlook.com [40.107.3.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21CAC6E313
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2019 13:16:15 +0000 (UTC)
Received: from DB6PR0802CA0034.eurprd08.prod.outlook.com (2603:10a6:4:a3::20)
 by HE1PR0801MB1852.eurprd08.prod.outlook.com (2603:10a6:3:7c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.21; Tue, 26 Nov
 2019 13:16:11 +0000
Received: from VE1EUR03FT019.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::204) by DB6PR0802CA0034.outlook.office365.com
 (2603:10a6:4:a3::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.17 via Frontend
 Transport; Tue, 26 Nov 2019 13:16:11 +0000
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT019.mail.protection.outlook.com (10.152.18.153) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.17 via Frontend Transport; Tue, 26 Nov 2019 13:16:10 +0000
Received: ("Tessian outbound fee635499979:v33");
 Tue, 26 Nov 2019 13:16:10 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6f32ef004a750f8f
X-CR-MTA-TID: 64aa7808
Received: from 687810ec6074.12 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.14.52]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9DF367BD-3954-4A4F-80A4-5D274BA0F92C.1; 
 Tue, 26 Nov 2019 13:16:05 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2052.outbound.protection.outlook.com [104.47.14.52])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 687810ec6074.12 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 26 Nov 2019 13:16:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C7DokPhzIyUsSD+HTofdA63KgF9Dv4ulNcpIXh/wfs6W0G3WNB/0VIUNTIOqqdvKdGRdBlbTkV5MjyA9VVgmto4B/robcGXeI32MNxzg/BHTJZriFGlsM60NndtJh0iAY1A7MabZwkv5a1x4yy7W403so7vIev3J6S09/iTrLlPainVP/Ci6qlF+kf27nFnqc7bsEX1e+0ikqWDFiUi/WohqNl0FmUO82/BRmfF9mowURLijoi0NgZb03T5Sk5NcW1G8bx2o4ZmCW5iFfwwLu7Otqb3JXCdlIH8jzNgUEYA5Gm8Q3723sZE0ZLibP69iCK7tiviHFG0cAlpUxyEhjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IdtA94mAshVXUemmMQnmXJ2MlYnOXP7KGT14dEW+wMo=;
 b=hFEuHie9sV68NX8FHv3ZhFeET7TNN8tx133gKDCzDf8UhBYXg9r8iOExEpmzzCH2nK1cvUrTU6s6cQXmteIbelx21G3BT1c4kWEPqejb9EUWvYicc5CRni+dI9bug81SqX+IZ378tMPCUq0jnYI7AEtjtZFhTuQeTsfmC5KhxMpcE91nCCf3KZXac+VMlUZ6teVILn4G6V0aKDp06PKLLRDegMcyFSfU+HeW1OzFJZayxRSELOtPjg3PRh2HM1yFTW1KpikqRNJN9mLL0hv5JebplKhV4G+/H/C4PUAqqHknnRN+YMl4aFMJ04XhkZFCRZLN53HLSU+GDE/DoKLmWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB4317.eurprd08.prod.outlook.com (20.179.28.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.16; Tue, 26 Nov 2019 13:16:03 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d%3]) with mapi id 15.20.2474.023; Tue, 26 Nov 2019
 13:16:03 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH 05/30] drm/bridge: cdns: Use drm_bridge_init()
Thread-Topic: [PATCH 05/30] drm/bridge: cdns: Use drm_bridge_init()
Thread-Index: AQHVpFunfH94LB/Of02Me66l+5EISA==
Date: Tue, 26 Nov 2019 13:16:03 +0000
Message-ID: <20191126131541.47393-6-mihail.atanassov@arm.com>
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
X-MS-Office365-Filtering-Correlation-Id: dd4882c1-4d05-45e2-59e8-08d77272ce3c
X-MS-TrafficTypeDiagnostic: VI1PR08MB4317:|VI1PR08MB4317:|HE1PR0801MB1852:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <HE1PR0801MB1852502C77AD713828FAEFDF8F450@HE1PR0801MB1852.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:669;OLM:669;
x-forefront-prvs: 0233768B38
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(366004)(346002)(376002)(136003)(396003)(189003)(199004)(5640700003)(86362001)(6512007)(71200400001)(2616005)(6486002)(71190400001)(2906002)(4326008)(6916009)(44832011)(446003)(11346002)(54906003)(66946007)(316002)(66446008)(64756008)(66556008)(66476007)(6436002)(4744005)(8936002)(186003)(26005)(5660300002)(102836004)(305945005)(14454004)(25786009)(99286004)(81166006)(50226002)(478600001)(2501003)(7736002)(6116002)(2351001)(76176011)(1076003)(52116002)(66066001)(256004)(8676002)(81156014)(6506007)(3846002)(386003)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB4317;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: Z2F59TblmaSmxIdPDaLfjNldy8W1wcU/EOpogwnc7F0Ygdm698rPsa1KjzMLVH+8g+4amDp0DmzgBNjYOQQTRTqOmxrIiOU2SfiLOKJoYiDyLSHV2Fqr9ZZumTe3p5qiw2ccTZeTtDf8reqEHA0uJOzQn4RrtiXeq5rnkiZBco5kF7KT4I9O3ISDN/vLHnLQrfzFND1c2J3vWIOZFpsMK4TxXJvdGjfTnxdbBFtU60ABgzkOwSWkm7SaGAN1xBMya6G7HHPXf+3EidH8v+ox6/YYUM704D0HEdreOV8nv807XOGiCNbjHOlK1+NqG3W8ih6NQunVxe5lccc/U/qVbQRrRN0PdQPHYSlXNOPFOUmhdl2XAUn/kU9FW/Jvz7FDu+Lbw8Ma9PtNVIrt+slj4pPlUqFSAHiYNC6qKX8veRc0+MIYSAAZSvur1Pa9snNS
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4317
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(39860400002)(136003)(376002)(189003)(199004)(47776003)(6916009)(2501003)(50466002)(11346002)(50226002)(81166006)(66066001)(25786009)(8936002)(8746002)(81156014)(7736002)(14454004)(5640700003)(6486002)(8676002)(86362001)(305945005)(446003)(22756006)(2616005)(1076003)(6512007)(26826003)(2351001)(386003)(6506007)(26005)(106002)(54906003)(316002)(5660300002)(102836004)(23756003)(76176011)(356004)(478600001)(4326008)(36906005)(2906002)(4744005)(107886003)(186003)(76130400001)(99286004)(3846002)(6116002)(70206006)(70586007)(36756003)(336012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:HE1PR0801MB1852;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: a688f0ef-d3c3-4ee0-d189-08d77272c9b2
NoDisclaimer: True
X-Forefront-PRVS: 0233768B38
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4qTz7IGVRe5zBuIinWFMLpIvq+6C5Dj6eSdIByQ0LmN+kftYpJn/tD5OFUfQIpKHTRXOymv01C9jeb42JDiwscRZ30/L1mPjap560kW5ZcNhl2vKaw3yQVyeGrPZUdcX4HbXtGYMk8Gr7Qjm4+nwj4W+ZG0lWkoRsB5PYuDaSNKVwDPyoXTGsnG9ZjdtHeqZWuq14LaJRzvHQnrKwes7iPOID7lwASE4WeMJ0sQSnO4wGlYB1T2F5xNk2m4skX9aQorM+7hjCv/ms/Yi3Iyj3S/ZcgZAARzkFsGf5yYjfeByrmk+2/N4TJ9kyy/GG9rYZdX9JC1BwjkEytS0Q3cdYdPbRonupaMIcXRIOLwqe9aHTGqxv+ue2A7Vo47h/MdWmjBbY7MkTDGJrvTVUPyh5TngATkYixr6L62REV6XXp5iFgiABBPmrHN4s06dZbj7
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2019 13:16:10.7033 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd4882c1-4d05-45e2-59e8-08d77272ce3c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1852
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IdtA94mAshVXUemmMQnmXJ2MlYnOXP7KGT14dEW+wMo=;
 b=ufx+yy1E9PF1dxAolcA+WO3sszn0/nuzUUBUz8OtWkKEWGQAF6KCVQkTWa8AHDzco/AyVmlVfXMaX9aj4/AjA851TOejuQybxlalg2oqgscyP5F6THgBl4TmK/fatB4IyT4kLGJSsbU1+OMIWArOMdmoPL4wLDuMPs71VXlRtiQ=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IdtA94mAshVXUemmMQnmXJ2MlYnOXP7KGT14dEW+wMo=;
 b=ufx+yy1E9PF1dxAolcA+WO3sszn0/nuzUUBUz8OtWkKEWGQAF6KCVQkTWa8AHDzco/AyVmlVfXMaX9aj4/AjA851TOejuQybxlalg2oqgscyP5F6THgBl4TmK/fatB4IyT4kLGJSsbU1+OMIWArOMdmoPL4wLDuMPs71VXlRtiQ=
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
aWhhaWwuYXRhbmFzc292QGFybS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9jZG5z
LWRzaS5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvY2Rucy1kc2kuYyBi
L2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvY2Rucy1kc2kuYwppbmRleCAzYTViZDRlN2ZkMWUuLjU4
YjJhYThiNmMyNCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9jZG5zLWRzaS5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvY2Rucy1kc2kuYwpAQCAtMTIzMyw4ICsxMjMz
LDggQEAgc3RhdGljIGludCBjZG5zX2RzaV9kcm1fcHJvYmUoc3RydWN0IHBsYXRmb3JtX2Rldmlj
ZSAqcGRldikKIAkgKiBDRE5TX0RQSV9JTlBVVC4KIAkgKi8KIAlpbnB1dC0+aWQgPSBDRE5TX0RQ
SV9JTlBVVDsKLQlpbnB1dC0+YnJpZGdlLmZ1bmNzID0gJmNkbnNfZHNpX2JyaWRnZV9mdW5jczsK
LQlpbnB1dC0+YnJpZGdlLm9mX25vZGUgPSBwZGV2LT5kZXYub2Zfbm9kZTsKKwlkcm1fYnJpZGdl
X2luaXQoJmlucHV0LT5icmlkZ2UsICZwZGV2LT5kZXYsICZjZG5zX2RzaV9icmlkZ2VfZnVuY3Ms
CisJCQlOVUxMLCBOVUxMKTsKIAogCS8qIE1hc2sgYWxsIGludGVycnVwdHMgYmVmb3JlIHJlZ2lz
dGVyaW5nIHRoZSBJUlEgaGFuZGxlci4gKi8KIAl3cml0ZWwoMCwgZHNpLT5yZWdzICsgTUNUTF9N
QUlOX1NUU19DVEwpOwotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
