Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 772D67601D
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 09:51:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 691D46E89C;
	Fri, 26 Jul 2019 07:51:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40086.outbound.protection.outlook.com [40.107.4.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 647666E89C
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 07:51:24 +0000 (UTC)
Received: from HE1PR0802CA0006.eurprd08.prod.outlook.com (2603:10a6:3:bd::16)
 by AM5PR0802MB2596.eurprd08.prod.outlook.com (2603:10a6:203:98::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.17; Fri, 26 Jul
 2019 07:51:19 +0000
Received: from VE1EUR03FT039.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::207) by HE1PR0802CA0006.outlook.office365.com
 (2603:10a6:3:bd::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2115.14 via Frontend
 Transport; Fri, 26 Jul 2019 07:51:19 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT039.mail.protection.outlook.com (10.152.19.196) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.18 via Frontend Transport; Fri, 26 Jul 2019 07:51:17 +0000
Received: ("Tessian outbound 6d016ca6b65d:v26");
 Fri, 26 Jul 2019 07:51:11 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 373e4b7e4d16622f
X-CR-MTA-TID: 64aa7808
Received: from fbcf67064ec2.1 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.6.52]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 870A09CA-6E51-4156-ADCA-B30C58DDA2BB.1; 
 Fri, 26 Jul 2019 07:51:05 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2052.outbound.protection.outlook.com [104.47.6.52])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fbcf67064ec2.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 26 Jul 2019 07:51:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XUqI+sWqjpqMZh13OT5kQwTxeqKJV7Ai/FgDOYf65NmMst9tTSZgQ9UnirMZN0VI9oCPIlQCtmo+HdSwWeCYcKhiWtvVpq1dLTkcqMvuZZIJRFLcshJ6Mc29zxopBFxp8tAUyFd528riFk8rRIXnfF5i7GEhnow0bp1T64by2XIQ3aFi57ckT8f0G7OT0PbRKfrscMhRQjrOQA0rZLWOD2GZFua04Qzr0oB809s+6ywujOtZ7DSVFDlCTZmIizH6urzmTX/b3g9aFnJml/IDKuC7zMKedsr0qV/FJ0H5Ws4Lp0QFXWJNPhJqa0h2qb0DtX9izT7yoKXFrJ7LLX9a0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pUrCD0Leo0TtWgq8AGKe5YgKp4GAMmDDJNLEblsg/YI=;
 b=cZ/BFIP4MtftXTHZBLcWvMRpQlGi0g48V/SxbQpL1v/6YiFIU1FzI2jjOvqI+7WX5w4IXwc0sAld3tyuAiDsx+f7GwS7rUvvgHsJBC6wtcwGo8+F83ccnp7wN8Yr9nBeoF+8a1/E+/bOKW8pvSkyU916IctMShMC/EuAXJqzBbcCOx+AjRrdfaKAU4mBKWVVORq2MvKfy1NNJ2nuGPswkJlq8p12t5qc/6i7YPQNOGUMYpt2ZZ2XuYIWkMFPeMD6Q6+ciOeiNStZQxUYLxYKZAyFz2zD1d/fj/+30jkXOdBAW3bLomlCa/nNogcBXRr1RcIgj/JuPWYwnayu60KJrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=arm.com;dmarc=pass action=none header.from=arm.com;dkim=pass
 header.d=arm.com;arc=none
Received: from VI1PR08MB5488.eurprd08.prod.outlook.com (52.133.246.150) by
 VI1PR08MB5552.eurprd08.prod.outlook.com (20.179.28.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.14; Fri, 26 Jul 2019 07:51:02 +0000
Received: from VI1PR08MB5488.eurprd08.prod.outlook.com
 ([fe80::c091:c28c:bb1a:5236]) by VI1PR08MB5488.eurprd08.prod.outlook.com
 ([fe80::c091:c28c:bb1a:5236%2]) with mapi id 15.20.2115.005; Fri, 26 Jul 2019
 07:51:02 +0000
From: "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "james qian wang (Arm Technology
 China)" <james.qian.wang@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "seanpaul@chromium.org"
 <seanpaul@chromium.org>, "airlied@linux.ie" <airlied@linux.ie>, Brian Starkey
 <Brian.Starkey@arm.com>
Subject: [PATCH] drm/komeda: Adds internal bpp computing for arm afbc only
 format YU08 YU10
Thread-Topic: [PATCH] drm/komeda: Adds internal bpp computing for arm afbc
 only format YU08 YU10
Thread-Index: AQHVQ4beFTTy2Dg0kUOV3ws9alTcfg==
Date: Fri, 26 Jul 2019 07:51:02 +0000
Message-ID: <1564127450-22601-1-git-send-email-lowry.li@arm.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0PR04CA0006.apcprd04.prod.outlook.com
 (2603:1096:203:36::18) To VI1PR08MB5488.eurprd08.prod.outlook.com
 (2603:10a6:803:137::22)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Lowry.Li@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 1.9.1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 45fa6674-a635-4d75-accf-08d7119e0a98
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR08MB5552; 
X-MS-TrafficTypeDiagnostic: VI1PR08MB5552:|AM5PR0802MB2596:
X-Microsoft-Antispam-PRVS: <AM5PR0802MB2596B19C1ED9445FB5A248889FC00@AM5PR0802MB2596.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:3173;OLM:3173;
x-forefront-prvs: 01106E96F6
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(376002)(39860400002)(136003)(366004)(189003)(199004)(6506007)(4326008)(55236004)(6436002)(53936002)(386003)(2501003)(102836004)(6512007)(2906002)(52116002)(305945005)(99286004)(7736002)(6636002)(86362001)(6116002)(66066001)(25786009)(478600001)(186003)(14454004)(3846002)(54906003)(5660300002)(316002)(26005)(8936002)(36756003)(110136005)(50226002)(2201001)(8676002)(81156014)(81166006)(66556008)(66476007)(66446008)(68736007)(64756008)(476003)(71200400001)(71190400001)(2616005)(256004)(486006)(66946007)(6486002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB5552;
 H:VI1PR08MB5488.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: XMXOrhUDXpidBIwS3WQq8Pus0yR77D1wxedV0UTFb5mPdBXL8r7NgdyxoKz0OvKHSeZh4D7hLNtlKP4FlnC1I7KZdD3F+r1FXvyx181GaFhLmEtLGfaiXlzoSz8xcemHI9CnNhR/0Vk0sjE6XHEZOh3wOo4z/atkjVC0nSQ7lIOXlxcMewyEvhHVaBWiTtIgjXss0k8OkAAyoh5NEk9GEDeT+WPVhP9NukOJR3rfBUPCxS7pHxousFin9wHgszcqpTTXa3fDftuCtxrACcWyV5rqJkI4svGTYLNtDuXlPLj07EZDnaYtlEs6Yx/ExZr+jc/YwS8VDbs4cpn+VrGHXQpcIJ+LMSVPKBt/R8EFf6o0f5NoMLil8yg+3RwLUWMZdzpZISWDzp2DKORckhP7r4h303a8m1jUDcCGOjyPp1Y=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5552
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Lowry.Li@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(376002)(136003)(396003)(2980300002)(199004)(189003)(76130400001)(305945005)(5660300002)(4326008)(50466002)(86362001)(81166006)(66066001)(2201001)(23756003)(2501003)(25786009)(2616005)(14454004)(26826003)(3846002)(7736002)(316002)(6512007)(47776003)(478600001)(70206006)(36756003)(63370400001)(70586007)(6486002)(22756006)(356004)(63350400001)(6116002)(476003)(6506007)(36906005)(99286004)(336012)(50226002)(2906002)(102836004)(8746002)(54906003)(8936002)(126002)(8676002)(110136005)(6636002)(486006)(186003)(386003)(81156014)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR0802MB2596;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: db321ca0-4b51-4a31-101f-08d7119e0143
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(710020)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM5PR0802MB2596; 
NoDisclaimer: True
X-Forefront-PRVS: 01106E96F6
X-Microsoft-Antispam-Message-Info: /em7aQNTwkCMzC46BIl/1Gx5Cm+K/z6rnCe/paKrt/mje09wNU8aFzNZ0WEBXewr1Lsdo2NY5IHTUVCI7+k/6mv56h8CvRq4XZHvKWMrCMTwVstyS8GiBaCcwrkG/tzAiK25KwmMOhtXKT6vgN4fzeB2NRgU1lhQGupe7aTI/EA67aQKa8WSXHckC6Hdw02UtobaAkiEVRqNan5dZIxbim4BwZiytapo/flOli1okpGboAipH7wyZL5+nbXaEnyUck6Cv3bXWaLWxcgxuGQg3FuiJdK2VWYGb5Gyp+4Tu3fiXGkGTdCgUmZtu/Caui5riCBdcAy0lt+rPRjao39QKDOBHvgQFBI7h5SEMC6T3t1EKWZH0QXKP76lBt+UicmGuQbIwcMlTRcrwMainAhivLSVHn6NMhikRmiZZV6KQ/4=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2019 07:51:17.5186 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 45fa6674-a635-4d75-accf-08d7119e0a98
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2596
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pUrCD0Leo0TtWgq8AGKe5YgKp4GAMmDDJNLEblsg/YI=;
 b=3nqo4WzEIqTcvrRzCva7oslFVwYQZ6+9TE3L8yLFjjQ6R9zvijbsw8CuhvyYmpw26Z4XD+X/1srC50MA7d/sMupbN/BmACGHlq27i3O4PNpg+0AOtvpr6LPyXqH05YyC+MmsBlAPWg2TvFYWVAysNbOqLDMY/OmtIIlL7IREfRA=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pUrCD0Leo0TtWgq8AGKe5YgKp4GAMmDDJNLEblsg/YI=;
 b=3nqo4WzEIqTcvrRzCva7oslFVwYQZ6+9TE3L8yLFjjQ6R9zvijbsw8CuhvyYmpw26Z4XD+X/1srC50MA7d/sMupbN/BmACGHlq27i3O4PNpg+0AOtvpr6LPyXqH05YyC+MmsBlAPWg2TvFYWVAysNbOqLDMY/OmtIIlL7IREfRA=
X-Mailman-Original-Authentication-Results: spf=temperror (sender IP is
 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=temperror action=none header.from=arm.com;
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
Cc: Ayan Halder <Ayan.Halder@arm.com>, "Jonathan Chai
 \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>, nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGRybV9mb3JtYXRfaW5mbyBkb2Vzbid0IGhhdmUgYW55IGNwcCBvciBibG9ja19zaXplIChi
b3RoIGFyZSB6ZXJvKQppbmZvcm1hdGlvbiBmb3IgYXJtIG9ubHkgYWZiYyBmb3JtYXQgWVUwOC9Z
VTEwLiB3ZSBuZWVkIHRvIGNvbXB1dGUgaXQKYnkgb3Vyc2VsdmVzLgoKU2lnbmVkLW9mZi1ieTog
TG93cnkgTGkgKEFybSBUZWNobm9sb2d5IENoaW5hKSA8bG93cnkubGlAYXJtLmNvbT4KLS0tCiAu
Li4vZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZm9ybWF0X2NhcHMuYyAgICB8IDIzICsr
KysrKysrKysrKysrKysrKysrKysKIC4uLi9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9m
b3JtYXRfY2Fwcy5oICAgIHwgIDMgKysrCiAuLi4vZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21l
ZGFfZnJhbWVidWZmZXIuYyAgICB8ICA2ICsrKystLQogMyBmaWxlcyBjaGFuZ2VkLCAzMCBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
cm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Zvcm1hdF9jYXBzLmMgYi9kcml2ZXJzL2dwdS9kcm0v
YXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9mb3JtYXRfY2Fwcy5jCmluZGV4IGNkNGQ5ZjUuLjNj
OWUwNjAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29t
ZWRhX2Zvcm1hdF9jYXBzLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVk
YS9rb21lZGFfZm9ybWF0X2NhcHMuYwpAQCAtMzUsNiArMzUsMjkgQEAKIAlyZXR1cm4gTlVMTDsK
IH0KIAordTMyIGtvbWVkYV9nZXRfYWZiY19mb3JtYXRfYnBwKGNvbnN0IHN0cnVjdCBkcm1fZm9y
bWF0X2luZm8gKmluZm8sIHU2NCBtb2RpZmllcikKK3sKKwl1MzIgYnBwOworCisJV0FSTl9PTiht
b2RpZmllciA9PSBEUk1fRk9STUFUX01PRF9MSU5FQVIpOworCisJc3dpdGNoIChpbmZvLT5mb3Jt
YXQpIHsKKwljYXNlIERSTV9GT1JNQVRfWVVWNDIwXzhCSVQ6CisJCWJwcCA9IDEyOworCQlicmVh
azsKKwljYXNlIERSTV9GT1JNQVRfWVVWNDIwXzEwQklUOgorCQlicHAgPSAxNTsKKwkJYnJlYWs7
CisJZGVmYXVsdDoKKwkJYnBwID0gaW5mby0+Y3BwWzBdICogODsKKwkJYnJlYWs7CisJfQorCisJ
V0FSTl9PTihicHAgPT0gMCk7CisKKwlyZXR1cm4gYnBwOworfQorCiAvKiBUd28gYXNzdW1wdGlv
bnMKICAqIDEuIFJHQiBhbHdheXMgaGFzIFlUUgogICogMi4gVGlsZWQgUkdCIGFsd2F5cyBoYXMg
U0MKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRh
X2Zvcm1hdF9jYXBzLmggYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVk
YV9mb3JtYXRfY2Fwcy5oCmluZGV4IDM2MzE5MTAuLjMyMjczY2YgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Zvcm1hdF9jYXBzLmgKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZm9ybWF0X2NhcHMuaApA
QCAtOTcsNiArOTcsOSBAQCBzdGF0aWMgaW5saW5lIGNvbnN0IGNoYXIgKmtvbWVkYV9nZXRfZm9y
bWF0X25hbWUodTMyIGZvdXJjYywgdTY0IG1vZGlmaWVyKQoga29tZWRhX2dldF9mb3JtYXRfY2Fw
cyhzdHJ1Y3Qga29tZWRhX2Zvcm1hdF9jYXBzX3RhYmxlICp0YWJsZSwKIAkJICAgICAgIHUzMiBm
b3VyY2MsIHU2NCBtb2RpZmllcik7CiAKK3UzMiBrb21lZGFfZ2V0X2FmYmNfZm9ybWF0X2JwcChj
b25zdCBzdHJ1Y3QgZHJtX2Zvcm1hdF9pbmZvICppbmZvLAorCQkJICAgICAgIHU2NCBtb2RpZmll
cik7CisKIHUzMiAqa29tZWRhX2dldF9sYXllcl9mb3VyY2NfbGlzdChzdHJ1Y3Qga29tZWRhX2Zv
cm1hdF9jYXBzX3RhYmxlICp0YWJsZSwKIAkJCQkgIHUzMiBsYXllcl90eXBlLCB1MzIgKm5fZm10
cyk7CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29t
ZWRhX2ZyYW1lYnVmZmVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tv
bWVkYV9mcmFtZWJ1ZmZlci5jCmluZGV4IDEwYmY2M2UuLjk2NmQwYzcgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ZyYW1lYnVmZmVyLmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZnJhbWVidWZmZXIu
YwpAQCAtNDQsNyArNDQsNyBAQCBzdGF0aWMgaW50IGtvbWVkYV9mYl9jcmVhdGVfaGFuZGxlKHN0
cnVjdCBkcm1fZnJhbWVidWZmZXIgKmZiLAogCWNvbnN0IHN0cnVjdCBkcm1fZm9ybWF0X2luZm8g
KmluZm8gPSBmYi0+Zm9ybWF0OwogCXN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqOwogCXUzMiBh
bGlnbm1lbnRfdyA9IDAsIGFsaWdubWVudF9oID0gMCwgYWxpZ25tZW50X2hlYWRlcjsKLQl1MzIg
bl9ibG9ja3MgPSAwLCBtaW5fc2l6ZSA9IDA7CisJdTMyIG5fYmxvY2tzID0gMCwgbWluX3NpemUg
PSAwLCBicHA7CiAKIAlvYmogPSBkcm1fZ2VtX29iamVjdF9sb29rdXAoZmlsZSwgbW9kZV9jbWQt
PmhhbmRsZXNbMF0pOwogCWlmICghb2JqKSB7CkBAIC04NiwxMCArODYsMTIgQEAgc3RhdGljIGlu
dCBrb21lZGFfZmJfY3JlYXRlX2hhbmRsZShzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyICpmYiwKIAlr
ZmItPm9mZnNldF9wYXlsb2FkID0gQUxJR04obl9ibG9ja3MgKiBBRkJDX0hFQURFUl9TSVpFLAog
CQkJCSAgICBhbGlnbm1lbnRfaGVhZGVyKTsKIAorCWJwcCA9IGtvbWVkYV9nZXRfYWZiY19mb3Jt
YXRfYnBwKGluZm8sIGZiLT5tb2RpZmllcik7CiAJa2ZiLT5hZmJjX3NpemUgPSBrZmItPm9mZnNl
dF9wYXlsb2FkICsgbl9ibG9ja3MgKgotCQkJIEFMSUdOKGluZm8tPmNwcFswXSAqIEFGQkNfU1VQ
RVJCTEtfUElYRUxTLAorCQkJIEFMSUdOKGJwcCAqIEFGQkNfU1VQRVJCTEtfUElYRUxTIC8gOCwK
IAkJCSAgICAgICBBRkJDX1NVUEVSQkxLX0FMSUdOTUVOVCk7CiAJbWluX3NpemUgPSBrZmItPmFm
YmNfc2l6ZSArIGZiLT5vZmZzZXRzWzBdOworCiAJaWYgKG1pbl9zaXplID4gb2JqLT5zaXplKSB7
CiAJCURSTV9ERUJVR19LTVMoImFmYmMgc2l6ZSBjaGVjayBmYWlsZWQsIG9ial9zaXplOiAweCVs
eC4gbWluX3NpemUgMHgleC5cbiIsCiAJCQkgICAgICBvYmotPnNpemUsIG1pbl9zaXplKTsKLS0g
CjEuOS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
