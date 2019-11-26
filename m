Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3291E109ED9
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 14:16:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B5E16E32C;
	Tue, 26 Nov 2019 13:16:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03on0612.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe09::612])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25B836E32C
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2019 13:16:22 +0000 (UTC)
Received: from AM4PR08CA0058.eurprd08.prod.outlook.com (2603:10a6:205:2::29)
 by VI1PR08MB2847.eurprd08.prod.outlook.com (2603:10a6:802:19::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.17; Tue, 26 Nov
 2019 13:16:19 +0000
Received: from AM5EUR03FT062.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::209) by AM4PR08CA0058.outlook.office365.com
 (2603:10a6:205:2::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.17 via Frontend
 Transport; Tue, 26 Nov 2019 13:16:19 +0000
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT062.mail.protection.outlook.com (10.152.17.120) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.17 via Frontend Transport; Tue, 26 Nov 2019 13:16:19 +0000
Received: ("Tessian outbound 712c40e503a7:v33");
 Tue, 26 Nov 2019 13:16:19 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ff11807944074eea
X-CR-MTA-TID: 64aa7808
Received: from 1f05e3404f54.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.10.56]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C93E48AB-7CD8-460B-99B2-B8A7AA318EB5.1; 
 Tue, 26 Nov 2019 13:16:14 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2056.outbound.protection.outlook.com [104.47.10.56])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1f05e3404f54.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 26 Nov 2019 13:16:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UDhI7WIoxll0MHYZgVNDhNE7dKtyg1toiocS0iD+SmS2iRTRTiNZrasTG7n8pUGn8fIy23RPhqipEEUrGwFxidUr0Z+UbMg5Orz+r34ignruDMUbIJbTySOI4DLVxDVDQmd4+hPq3EW4dXlVUxOe35irvz7IV1/pmnfaO0CIoll9Zab5EbtgMLcgXSlZNfl+x/FqPb2/XfZuacg4xQgijLparghIbqca7wyn20EZYBtr7A+Fo1yGlABPiQjK9fwqbuZ7dRf09XsKFi01Ed2xKio4Pem6UvtQqZ+Ttx82h5zmzk2AEGSDpsAcXwfpTR8AyuGkfocGy6y2VzQ9WT7O+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6MgqguEy0jasCHbpHxT7B0woU2qwbfZInWMJIuCHW7o=;
 b=PRpTEmu10eQZK2cak1H/kBuh5Cn7EyTNf249/CaPw5M2yjvnxnEgew4Azl/Wd0lm9FYAGXjeiE+PoNXUAU6r8rQzHST9xLZIYDZ12MAYrfRxVJmTnY2uuEmP/Gwxf3KBcq9r5lv3uMhgmCgKh2xa7xUc8wEepQMOXR/sGwDLL4//7wT97iNOAwo6bSfewbdR60cXSjd4k/S0AN38AUvwQHc2155x4U3VMbe0S3MuZPDwEt2Z6zLlJRa+J1vffxQ9mv3tsffRi6BzOHy2XCBmYZgZDr9NRaJxkxDQI7qrJrFIz8s0MX2y3jlZ+6CA4TWhnDYyjhgTUpcmSTrDxZsiew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB4317.eurprd08.prod.outlook.com (20.179.28.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.16; Tue, 26 Nov 2019 13:16:13 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d%3]) with mapi id 15.20.2474.023; Tue, 26 Nov 2019
 13:16:12 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH 14/30] drm/bridge: sil_sii8620: Use drm_bridge_init()
Thread-Topic: [PATCH 14/30] drm/bridge: sil_sii8620: Use drm_bridge_init()
Thread-Index: AQHVpFusBDgtM9ENkEKxMg8CrEW9Uw==
Date: Tue, 26 Nov 2019 13:16:12 +0000
Message-ID: <20191126131541.47393-15-mihail.atanassov@arm.com>
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
X-MS-Office365-Filtering-Correlation-Id: 9c1c8f72-3b60-4652-8047-08d77272d39e
X-MS-TrafficTypeDiagnostic: VI1PR08MB4317:|VI1PR08MB4317:|VI1PR08MB2847:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VI1PR08MB28478F08F55F70E9B0E29D0E8F450@VI1PR08MB2847.eurprd08.prod.outlook.com>
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
X-Microsoft-Antispam-Message-Info-Original: Kr4JQXa2ZFf9DeYAr8nInYzhyyuXXX7oIDuvdph6ywA7fQDwpd9elpi3td5z7TEeSI9MtbCgu/GtCYY9vwXdBd2UTEjEgLaFWyxSQT8JCKE3CVJY2fjtGs6UT/Ggl/CP9xHNUFe5qbo8j793pc1xLhjEx0lZWo7+AYk82KRX5VS11Ax0688NpGj8D+V5UjCJVhKqa+PoXxAz6Roo1VSCvZjNH3zCDaoow7cCWdEOJK6A+3VR5ar3KZIFAtssFXHD23dlBGECAMnfXIw8ubjsFDRLPHIQIJ/z83244Ff4bQrif1La2ICmsvtadAHsxedSl1yUIMt63EA6zyN0a/06t1W6YKP/QFP5vKUJSKbLJxIT9Nl61C4uxeqfp9V3YwlKeIz8dtraSPLfUkXpmE33/OA/Hq3EHT4do4m768UqtkrgZ6/xuXsgoZcLUNzWY+yb
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4317
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(376002)(396003)(346002)(199004)(189003)(6506007)(386003)(478600001)(36906005)(316002)(66066001)(6916009)(106002)(86362001)(2616005)(36756003)(446003)(47776003)(305945005)(102836004)(25786009)(107886003)(2906002)(7736002)(6116002)(1076003)(26826003)(356004)(3846002)(5660300002)(99286004)(22756006)(11346002)(50466002)(336012)(4744005)(6486002)(26005)(186003)(8746002)(14454004)(76176011)(76130400001)(8676002)(81166006)(81156014)(2501003)(5640700003)(2351001)(6512007)(23756003)(70206006)(70586007)(50226002)(8936002)(54906003)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB2847;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 00fea5f2-bb0f-4bbe-413e-08d77272cf20
NoDisclaimer: True
X-Forefront-PRVS: 0233768B38
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4ou+jrLo5CfK7OkOOcWt+4nT9FFqW0VkrgsT0yVJE23FLH09buixtpatJirxCAEGvOK515yv1J2xPpytJn5RuBPq8KsRqDkeotLlOSDg89rU3K/0GUqbQHA573XGGU/GA5u+sUBjZ5lpxRsrDwKc2AsfkW70x6iipD9A+h7PmyGlYQpjd3RApNoeLxSPI3QJikUlYnEfi09O8j0oghmu+GCqMR1OhnDqC4bqwSMEf7RAwxzLBgDmqJdh0pdxmRS05609qNkLP2wcWA6FfAjWKbKNZQcq0J4eacElUfLMZ9vFNGRxbWHqr4INKA2puf10lL/1FGRAqlTO79csbmA6yEG/0Ndv6y7ai46U9xUkAJvrl4NlFin8IVkwqiidQRSIqRH9yrJYfYhvfC2U0XS27xkIJb0bgTJ4NiZWGMBOpA2QXw9cejILtXgQLFC0gZem
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2019 13:16:19.7502 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c1c8f72-3b60-4652-8047-08d77272d39e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2847
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6MgqguEy0jasCHbpHxT7B0woU2qwbfZInWMJIuCHW7o=;
 b=7mdGnpAbAI9MuVi7PlT1ATzFNntIIl7eSuetpq+adU9L14NhWFX06ejRixfp+vlDd9sxYaFQ3/3XK6+VDq9bgydjfHwNgY877K0F0AhtatX9aEqh2HGYbAgFYpAIaDGQESdGPc3tL5G9N4wxwQDsAdwX+lni269cBJsUTNww7SY=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6MgqguEy0jasCHbpHxT7B0woU2qwbfZInWMJIuCHW7o=;
 b=7mdGnpAbAI9MuVi7PlT1ATzFNntIIl7eSuetpq+adU9L14NhWFX06ejRixfp+vlDd9sxYaFQ3/3XK6+VDq9bgydjfHwNgY877K0F0AhtatX9aEqh2HGYbAgFYpAIaDGQESdGPc3tL5G9N4wxwQDsAdwX+lni269cBJsUTNww7SY=
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
aWhhaWwuYXRhbmFzc292QGFybS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zaWwt
c2lpODYyMC5jIHwgMyArLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3NpbC1zaWk4NjIw
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3NpbC1zaWk4NjIwLmMKaW5kZXggNGMwZWVmNDA2
ZWIxLi40ODJkYzIyOTEzNTAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc2ls
LXNpaTg2MjAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3NpbC1zaWk4NjIwLmMKQEAg
LTIzMzcsOCArMjMzNyw3IEBAIHN0YXRpYyBpbnQgc2lpODYyMF9wcm9iZShzdHJ1Y3QgaTJjX2Ns
aWVudCAqY2xpZW50LAogCiAJaTJjX3NldF9jbGllbnRkYXRhKGNsaWVudCwgY3R4KTsKIAotCWN0
eC0+YnJpZGdlLmZ1bmNzID0gJnNpaTg2MjBfYnJpZGdlX2Z1bmNzOwotCWN0eC0+YnJpZGdlLm9m
X25vZGUgPSBkZXYtPm9mX25vZGU7CisJZHJtX2JyaWRnZV9pbml0KCZjdHgtPmJyaWRnZSwgZGV2
LCAmc2lpODYyMF9icmlkZ2VfZnVuY3MsIE5VTEwsIE5VTEwpOwogCWRybV9icmlkZ2VfYWRkKCZj
dHgtPmJyaWRnZSk7CiAKIAlpZiAoIWN0eC0+ZXh0Y29uKQotLSAKMi4yMy4wCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
