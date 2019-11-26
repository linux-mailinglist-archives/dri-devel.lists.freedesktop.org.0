Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 706A4109EE7
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 14:16:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B75926E375;
	Tue, 26 Nov 2019 13:16:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-eopbgr90083.outbound.protection.outlook.com [40.107.9.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82A8C6E375
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2019 13:16:34 +0000 (UTC)
Received: from VI1PR08CA0106.eurprd08.prod.outlook.com (2603:10a6:800:d3::32)
 by PR2PR08MB4747.eurprd08.prod.outlook.com (2603:10a6:101:28::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.21; Tue, 26 Nov
 2019 13:16:32 +0000
Received: from DB5EUR03FT029.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::203) by VI1PR08CA0106.outlook.office365.com
 (2603:10a6:800:d3::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.18 via Frontend
 Transport; Tue, 26 Nov 2019 13:16:31 +0000
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT029.mail.protection.outlook.com (10.152.20.131) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.17 via Frontend Transport; Tue, 26 Nov 2019 13:16:31 +0000
Received: ("Tessian outbound f7868d7ede10:v33");
 Tue, 26 Nov 2019 13:16:30 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d8041612cdfffd86
X-CR-MTA-TID: 64aa7808
Received: from 95ca307b0d32.4 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.14.57]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C8F618B6-898E-43B8-B39E-9F15EB3C7B3F.1; 
 Tue, 26 Nov 2019 13:16:25 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2057.outbound.protection.outlook.com [104.47.14.57])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 95ca307b0d32.4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 26 Nov 2019 13:16:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J4jif/BK1R5UAaupC8+hnRgpr1VlR4VWNzv3Sm0hc/lPA44FkFlpQajLtkxbzBHBK9ZmVGgIo/dzusKHM2WKziKyiFjXVGDjnxKfhafGBSywN8sqHk/DnuIi2YWr0OEZnE2s6MngEk0c5mdFZCzEt3If6NG1jUQg6ZCubFzBEvZBKDuu6aB50NXQZ7I5Y5xNkhZHwIjosPBv2iF1GTsOFCUket0DLH/MrBxGqgcbn/24tXsw7q+VKaACCNN5XkSnKi1h0VR5Dx/liOMxEjVa+PiTvxlUCE+OMLj+AG69uZne2SdeUX9acaxlrGThFKHILJw6lu5nuyCmH2NVDOs/Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zWRkjbKXWosT47zn6WBBKW0xFtrV15qKHnsxlVXCAOs=;
 b=fRA6zQVEPMkSZ+QZUF3NcrtJpaJTAE2f1C0HJXqFb/PyxRKVRDyV4WPRWftTZ60DSUiM0Pxfk0WGajZtiXrlLCLetXxoM/4YD0uAWwUtCbhjVQmy7W7e5yf3g5ApTkanG9E9THlWOhZkvuXmsNqdfDJOyBoeNNUwYXSoMJGymGkTKOhegS1ZkzJb6eKbMALYzx6G30r9uudSTXAZEneo6n+I/VcgH29cJmr8Ehozmv0bisGGRDRXNZoVPGuyRN5vjGtwqXTLxT/a2CzMmEpCwZFlatoedu2W6j4Fj9AwqIdj7+eVZ3O9ybW9Yo164+urSU/gHIfKRcQNrHt28ONVvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB4317.eurprd08.prod.outlook.com (20.179.28.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.16; Tue, 26 Nov 2019 13:16:24 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d%3]) with mapi id 15.20.2474.023; Tue, 26 Nov 2019
 13:16:24 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH 26/30] drm: rcar-du: lvds: Use drm_bridge_init()
Thread-Topic: [PATCH 26/30] drm: rcar-du: lvds: Use drm_bridge_init()
Thread-Index: AQHVpFuzCCWCeiajR0azDZK79iNyGA==
Date: Tue, 26 Nov 2019 13:16:24 +0000
Message-ID: <20191126131541.47393-27-mihail.atanassov@arm.com>
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
X-MS-Office365-Filtering-Correlation-Id: bc800894-7c00-4e09-7dae-08d77272daba
X-MS-TrafficTypeDiagnostic: VI1PR08MB4317:|VI1PR08MB4317:|PR2PR08MB4747:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <PR2PR08MB474705435201D43DE4A05AAB8F450@PR2PR08MB4747.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:376;OLM:376;
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
X-Microsoft-Antispam-Message-Info-Original: jNZyCECqC/7P+UsXMnkFjI6+eNr5TCvVNSHj3njTCXUN8FCBJ0HHrB9WfooHtASIx3Umk0dV+Zz+v+oEyIsJ4ApjaoMnn3j/T15G7Ccja7xnsIwhNksC85LtVEJsB2df2ZZlrO/TTZhmar9VABdnVE+FXLiiV7cM0+NsLlqhr9vx/mfZ8hus3C5HaAMdnPXqE45WLQAmOM3SXS8KY5k39NMXJvNnE5g+A93TRqsfTSpWOgqsU20Oc8aRWIffX40PZCCKYpLEk/0dZ1a6/9QQmh2aWMUGCteH9p5Bz+fV8/8IfA4EZ03McReX6lyJY3EM405imMYqDmC5Tgkk86svX1L++nxHIrUwS3Fx8+QRvpHFDEt9Bz3WKmy28WgQKHfVAsq9X5IGfY9ibojC8OJUvR8zw2Sl2/vEC+Y7/JgyI8LGy7TIdmodRS6Xr1J1SqWx
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4317
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(39860400002)(396003)(136003)(199004)(189003)(99286004)(478600001)(23756003)(11346002)(36756003)(54906003)(4744005)(446003)(2616005)(7736002)(8676002)(4326008)(81156014)(81166006)(305945005)(47776003)(8936002)(66066001)(14454004)(316002)(8746002)(3846002)(50226002)(107886003)(26826003)(25786009)(6116002)(70206006)(1076003)(2501003)(70586007)(50466002)(2351001)(6512007)(5660300002)(356004)(76176011)(106002)(22756006)(76130400001)(386003)(336012)(5640700003)(6506007)(6486002)(2906002)(102836004)(26005)(86362001)(6916009)(186003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:PR2PR08MB4747;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 5213e331-3562-425a-bb57-08d77272d62b
NoDisclaimer: True
X-Forefront-PRVS: 0233768B38
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gID9bAEjmeaORxxw+g6zmYtvf+wiY0xEUvrJzPJZiFpj0MIIrZ9GKNaIV2sbCal1zjPHacCmORCcoIWwJT3At8XCSkGvv0atFOx0uXDC4bOmV53PBINeWRm+OxK/1AFjIm2+vYNGUWqMNKowHE+4Q8Ng47KOsttVg6PKQrY//11G6swKhaJ162cdMAEv0Q/NcAqQlu81otsuCk8Y/7wkfAnZOSCSoKqOPL0VwJlCjuBrrvCa2q2roiC4hFbqcJSYHjowTBmL5GAHKqkg2bykYhNqomF+tI+TxwsSjqqjNRCchtWmIJzZZEPhTYnJ41tU/XmKfEqwHCjVkc1yyggLSxXZmEOLFMR7Sha5kKILEEXMayzCyBJsRMSIJyR1rvfKz+UleLf05XDgASS82fBikEM/NuzagtGIzI4OePFIw/oAfvbCZe+P5Ldg5vIeigLi
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2019 13:16:31.7167 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc800894-7c00-4e09-7dae-08d77272daba
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4747
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zWRkjbKXWosT47zn6WBBKW0xFtrV15qKHnsxlVXCAOs=;
 b=zllVX4QaEXQs5sq6vYcUC1WrERqhWBEONBZKo1t/cz2lMPex46xDK3X4A+hR/xlPFgJAUBSUPVlsNDtLVOyilrDWVUtD9KGqcn+6PuAU9TGN3DEiMqzfOdV/mtP0OhcWsI9tDBIM4zvqa25veR9P6Em4/ECQcW8Zev656e2Jsyo=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zWRkjbKXWosT47zn6WBBKW0xFtrV15qKHnsxlVXCAOs=;
 b=zllVX4QaEXQs5sq6vYcUC1WrERqhWBEONBZKo1t/cz2lMPex46xDK3X4A+hR/xlPFgJAUBSUPVlsNDtLVOyilrDWVUtD9KGqcn+6PuAU9TGN3DEiMqzfOdV/mtP0OhcWsI9tDBIM4zvqa25veR9P6Em4/ECQcW8Zev656e2Jsyo=
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
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm8gZnVuY3Rpb25hbCBjaGFuZ2UuCgpTaWduZWQtb2ZmLWJ5OiBNaWhhaWwgQXRhbmFzc292IDxt
aWhhaWwuYXRhbmFzc292QGFybS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNh
cl9sdmRzLmMgfCA1ICsrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAzIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfbHZk
cy5jIGIvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9sdmRzLmMKaW5kZXggOGM2YzE3MmJi
ZjJlLi5hYzFmMjliYWNmY2IgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3Jj
YXJfbHZkcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfbHZkcy5jCkBAIC04
ODEsOSArODgxLDggQEAgc3RhdGljIGludCByY2FyX2x2ZHNfcHJvYmUoc3RydWN0IHBsYXRmb3Jt
X2RldmljZSAqcGRldikKIAlpZiAocmV0IDwgMCkKIAkJcmV0dXJuIHJldDsKIAotCWx2ZHMtPmJy
aWRnZS5kcml2ZXJfcHJpdmF0ZSA9IGx2ZHM7Ci0JbHZkcy0+YnJpZGdlLmZ1bmNzID0gJnJjYXJf
bHZkc19icmlkZ2Vfb3BzOwotCWx2ZHMtPmJyaWRnZS5vZl9ub2RlID0gcGRldi0+ZGV2Lm9mX25v
ZGU7CisJZHJtX2JyaWRnZV9pbml0KCZsdmRzLT5icmlkZ2UsICZwZGV2LT5kZXYsICZyY2FyX2x2
ZHNfYnJpZGdlX29wcywKKwkJCU5VTEwsIGx2ZHMpOwogCiAJbWVtID0gcGxhdGZvcm1fZ2V0X3Jl
c291cmNlKHBkZXYsIElPUkVTT1VSQ0VfTUVNLCAwKTsKIAlsdmRzLT5tbWlvID0gZGV2bV9pb3Jl
bWFwX3Jlc291cmNlKCZwZGV2LT5kZXYsIG1lbSk7Ci0tIAoyLjIzLjAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
