Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D80D4D8B
	for <lists+dri-devel@lfdr.de>; Sat, 12 Oct 2019 08:26:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEA216E452;
	Sat, 12 Oct 2019 06:26:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60051.outbound.protection.outlook.com [40.107.6.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3524C6E452
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Oct 2019 06:26:41 +0000 (UTC)
Received: from VE1PR08CA0035.eurprd08.prod.outlook.com (2603:10a6:803:104::48)
 by VI1PR0801MB1693.eurprd08.prod.outlook.com (2603:10a6:800:4e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16; Sat, 12 Oct
 2019 06:26:34 +0000
Received: from DB5EUR03FT011.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::206) by VE1PR08CA0035.outlook.office365.com
 (2603:10a6:803:104::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.18 via Frontend
 Transport; Sat, 12 Oct 2019 06:26:34 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT011.mail.protection.outlook.com (10.152.20.95) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Sat, 12 Oct 2019 06:26:33 +0000
Received: ("Tessian outbound 927f2cdd66cc:v33");
 Sat, 12 Oct 2019 06:26:28 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: a185b82287f8635d
X-CR-MTA-TID: 64aa7808
Received: from 5c701183a6d3.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.14.50]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6F80B5D7-E877-42E1-BD8E-1130365308D1.1; 
 Sat, 12 Oct 2019 06:26:23 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2050.outbound.protection.outlook.com [104.47.14.50])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5c701183a6d3.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Sat, 12 Oct 2019 06:26:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CU34M8uZ2iHw/SaOi1KjLR/98cM8uXShe0NsQ7eet9xgahivvelYIHbrmS72/ll7ER2x69kpWRXJGYbPB0JdEuGUTXvEm9KdFhyY0ObJzlcyh+GVtpOyEEkbkyiM1nN3thsx7W0XrEtv/HDtnbkEakeB6yOkZKprY8m8KDh2O3oR7bOIMuaBltsyl1q9Q8cB3JMbCoHq3V9LzTbqwncDvzrBXn0MZnSsApwPGsxLSQYFJ3YM+f+AYT43j8JC3OQh6dskfZWVmL/BwCf4gfllKDb0EzhUvdzTv5bvA7cFKxyh2C1lZiGvquVdTIOT82tcTTOnapBuiwZ5QQTlQv/LNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qD/tzP/t5qqkBpL7C5G83qv6cL0cAmnLqDZ9yZP/cPc=;
 b=BGooKosJCu83a9+WJa89FKdl7AmoAlczadWFaY+XPLDUdqC33yZd/d8dnwuiF/+VQ9aO/mnktMpFutd2zOeNct4S1YrsLwQjhtrLRupn8rk6fGAuarCtyqGFW/SMOQyEsimpUr2SZks128ksSupN9vYVTEtYDMBECOw/GB7Tvq7pfuUb6uW0/phWG8tJVo4fBG7wTiZtEAn+AihBhRjdv72N4Pjce0x41ndmz7/L+7fBiTVzQBG2N4MWCywi6mMlGwAJAOJaRNihIUKzjK3t2jKy3JcHZUM3d4xK1Wa82sW6afjLhw9EeP72DPXro+Qrzt3UmEoNzJQ042CwIFFO6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB5488.eurprd08.prod.outlook.com (52.133.246.150) by
 VI1PR08MB4191.eurprd08.prod.outlook.com (20.178.204.217) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Sat, 12 Oct 2019 06:26:20 +0000
Received: from VI1PR08MB5488.eurprd08.prod.outlook.com
 ([fe80::e52a:a540:75ae:ced9]) by VI1PR08MB5488.eurprd08.prod.outlook.com
 ([fe80::e52a:a540:75ae:ced9%4]) with mapi id 15.20.2347.016; Sat, 12 Oct 2019
 06:26:20 +0000
From: "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "james qian wang (Arm Technology
 China)" <james.qian.wang@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "seanpaul@chromium.org"
 <seanpaul@chromium.org>, "airlied@linux.ie" <airlied@linux.ie>, Brian Starkey
 <Brian.Starkey@arm.com>, Mihail Atanassov <Mihail.Atanassov@arm.com>
Subject: [PATCH] drm/komeda: Set output color depth for output
Thread-Topic: [PATCH] drm/komeda: Set output color depth for output
Thread-Index: AQHVgMX1QcaKushXkkSa5yEyPB0t2w==
Date: Sat, 12 Oct 2019 06:26:20 +0000
Message-ID: <20191012062603.25258-1-lowry.li@arm.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR02CA0162.apcprd02.prod.outlook.com
 (2603:1096:201:1f::22) To VI1PR08MB5488.eurprd08.prod.outlook.com
 (2603:10a6:803:137::22)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Lowry.Li@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 9d9235a1-b57f-4bf9-a795-08d74edd2055
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: VI1PR08MB4191:|VI1PR08MB4191:|VI1PR0801MB1693:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0801MB1693F6DAFD2C9FA0EA2DA70F9F960@VI1PR0801MB1693.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:418;OLM:418;
x-forefront-prvs: 0188D66E61
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(396003)(376002)(346002)(39860400002)(199004)(189003)(3846002)(6116002)(7736002)(26005)(81156014)(102836004)(2201001)(305945005)(186003)(2906002)(6436002)(316002)(81166006)(256004)(50226002)(14454004)(71190400001)(486006)(14444005)(71200400001)(86362001)(8936002)(476003)(6486002)(54906003)(110136005)(6512007)(1076003)(99286004)(25786009)(2616005)(66446008)(52116002)(66946007)(5660300002)(64756008)(66556008)(6636002)(36756003)(66476007)(6506007)(386003)(4326008)(66066001)(2501003)(55236004)(8676002)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB4191;
 H:VI1PR08MB5488.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: lMLoGUsL+CdIFMoAWPcwV+pwWW4Kd1Jtb9XGKY3QOqmq9zL68K4vRhYdxFYN/DFsOF+OoZWdfouAtFlJVM137Km4KUUGs5qs8XLQmBZh7XBFe2kMYLkw+JGLPwJNVofa5mXi1BZCSf/IzkzQIUGhP4mcKyYAYgAYhUSlW3p+sqKR9kHuEmafKs+BnSZ+3K6tKoEbkqULhnSMsHnsHGV/9zRtG/4h0seE6qy9KBFQBbVJEJINx01T9FuluZuf+RFUtpboCcgS69stM0MeOZ0AaMJYeEZTGqSbt9q4koTbSCdnxiiSEd7T4qSpMLWdHL2wTiDyRVLWc8YCYYsx6D7hqi8O3dzRmmyE8/qrZ2gnWDHw7FW63tEfiRGWVQbdfInVgECHODvt/3tB13mjDHsxlnZpp+qli29udXyaASNSbHY=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4191
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Lowry.Li@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(396003)(39860400002)(136003)(189003)(199004)(14444005)(3846002)(22756006)(6116002)(4326008)(6486002)(8676002)(356004)(50226002)(6512007)(8746002)(81156014)(1076003)(81166006)(8936002)(76130400001)(66066001)(2201001)(476003)(126002)(486006)(86362001)(2616005)(70206006)(70586007)(63350400001)(50466002)(336012)(25786009)(47776003)(26826003)(478600001)(23756003)(14454004)(316002)(99286004)(6636002)(5660300002)(54906003)(110136005)(386003)(2501003)(102836004)(6506007)(36756003)(26005)(305945005)(186003)(7736002)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0801MB1693;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: de6ab840-5988-424c-2a46-08d74edd1850
NoDisclaimer: True
X-Forefront-PRVS: 0188D66E61
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5qGjIcx9Hsfc4O90jCK94OMo369NPPQguGzAb1+HinrODND8mbMhSI7A/S9j/cBROy/R5U/Ym75a4FS90HU5oMHQVxZUjdlKHLU0ZwBTgjbvwm89UFwnIu4WCM4WQnHp4BxzvAgPxjRBDEEefoMv3XDADbO3KhuFvCG4ImM0V+kKaoXQsIjNfHG352sa5jggInQXS8pUKGds78N3I8dbwGAyIrSgnXGQhpV63dnQ2CiXacUXXd1FCPJN1EUIKCFF1FiAfZa/vje9bman2YBhDgiDshRNytjg26UP4c4PZ1cyDxeVcukZGRukNluADalzkHf2PPAYM0LtuJqYC84Pg52Ohi7zoaJTZGPoj7dUO1aRBERninzGbmOILsdC4y0WVb+rD+XQc+yEHiciuPlcO5WRzdU4ftrBQc/WxuQ8FSg=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2019 06:26:33.2927 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d9235a1-b57f-4bf9-a795-08d74edd2055
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1693
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qD/tzP/t5qqkBpL7C5G83qv6cL0cAmnLqDZ9yZP/cPc=;
 b=pU5lSgeK/wwtu2VDTdLf0oRgdJFL5VhhamKQA3rZkkcYwppsv20w5a6LImH3aADjb3Y+kb+8Pp8b2OmtbQzWC2j5PnBrkrO+AFyiyTxbQXKrK0L2uZ909RrPNeYxzOKfNZsEhpHzDVp40JqSwbtSqzjvUaOXhQHj8SzRrxcjSWE=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qD/tzP/t5qqkBpL7C5G83qv6cL0cAmnLqDZ9yZP/cPc=;
 b=pU5lSgeK/wwtu2VDTdLf0oRgdJFL5VhhamKQA3rZkkcYwppsv20w5a6LImH3aADjb3Y+kb+8Pp8b2OmtbQzWC2j5PnBrkrO+AFyiyTxbQXKrK0L2uZ909RrPNeYxzOKfNZsEhpHzDVp40JqSwbtSqzjvUaOXhQHj8SzRrxcjSWE=
X-Mailman-Original-Authentication-Results: spf=temperror (sender IP is
 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org; dmarc=none
 action=none header.from=arm.com;
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

U2V0IGNvbG9yX2RlcHRoIGFjY29yZGluZyB0byBjb25uZWN0b3ItPmJwYy4KCkNoYW5nZXMgc2lu
Y2UgdjE6CiAtIEZpeGVkIG1pbl9icGMgaXMgZWZmZWN0aXZlbHkgc2V0IGJ1dCBub3QgdXNlZCBp
bgprb21lZGFfY3J0Y19nZXRfY29sb3JfY29uZmlnKCkuCgpTaWduZWQtb2ZmLWJ5OiBMb3dyeSBM
aSAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIDxsb3dyeS5saUBhcm0uY29tPgotLS0KIC4uLi9hcm0v
ZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9jb21wb25lbnQuYyAgICB8ICAxICsKIC4uLi9ncHUvZHJt
L2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY3J0Yy5jICB8IDIwICsrKysrKysrKysrKysrKysr
KysKIC4uLi9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfa21zLmggICB8ICAyICsr
CiAuLi4vZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmUuaCAgfCAgMSArCiAu
Li4vZGlzcGxheS9rb21lZGEva29tZWRhX3BpcGVsaW5lX3N0YXRlLmMgICAgfCAxOSArKysrKysr
KysrKysrKysrKysKIC4uLi9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3diX2Nvbm5lY3Rvci5j
ICB8ICA0ICsrKysKIDYgZmlsZXMgY2hhbmdlZCwgNDcgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9jb21wb25lbnQu
YyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9jb21wb25lbnQu
YwppbmRleCBjM2QyOWMwYjA1MWIuLjI3Y2RiMDM1NzNjMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9kNzEvZDcxX2NvbXBvbmVudC5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9jb21wb25lbnQuYwpAQCAtOTUx
LDYgKzk1MSw3IEBAIHN0YXRpYyB2b2lkIGQ3MV9pbXByb2NfdXBkYXRlKHN0cnVjdCBrb21lZGFf
Y29tcG9uZW50ICpjLAogCQkJICAgICAgIHRvX2Q3MV9pbnB1dF9pZChzdGF0ZSwgaW5kZXgpKTsK
IAogCW1hbGlkcF93cml0ZTMyKHJlZywgQkxLX1NJWkUsIEhWX1NJWkUoc3QtPmhzaXplLCBzdC0+
dnNpemUpKTsKKwltYWxpZHBfd3JpdGUzMihyZWcsIElQU19ERVBUSCwgc3QtPmNvbG9yX2RlcHRo
KTsKIH0KIAogc3RhdGljIHZvaWQgZDcxX2ltcHJvY19kdW1wKHN0cnVjdCBrb21lZGFfY29tcG9u
ZW50ICpjLCBzdHJ1Y3Qgc2VxX2ZpbGUgKnNmKQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY3J0Yy5jIGIvZHJpdmVycy9ncHUvZHJtL2FybS9k
aXNwbGF5L2tvbWVkYS9rb21lZGFfY3J0Yy5jCmluZGV4IDc1MjYzZDhjZDBiZC4uZmUyOTVjNGZj
YTcxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVk
YV9jcnRjLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFf
Y3J0Yy5jCkBAIC0xNyw2ICsxNywyNiBAQAogI2luY2x1ZGUgImtvbWVkYV9kZXYuaCIKICNpbmNs
dWRlICJrb21lZGFfa21zLmgiCiAKK3ZvaWQga29tZWRhX2NydGNfZ2V0X2NvbG9yX2NvbmZpZyhz
dHJ1Y3QgZHJtX2NydGNfc3RhdGUgKmNydGNfc3QsCisJCQkJICB1MzIgKmNvbG9yX2RlcHRocykK
K3sKKwlzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubjsKKwlzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcl9z
dGF0ZSAqY29ubl9zdDsKKwlpbnQgaSwgbWluX2JwYyA9IDMxLCBjb25uX2JwYyA9IDA7CisKKwlm
b3JfZWFjaF9uZXdfY29ubmVjdG9yX2luX3N0YXRlKGNydGNfc3QtPnN0YXRlLCBjb25uLCBjb25u
X3N0LCBpKSB7CisJCWlmIChjb25uX3N0LT5jcnRjICE9IGNydGNfc3QtPmNydGMpCisJCQljb250
aW51ZTsKKworCQljb25uX2JwYyA9IGNvbm4tPmRpc3BsYXlfaW5mby5icGMgPyBjb25uLT5kaXNw
bGF5X2luZm8uYnBjIDogODsKKworCQlpZiAoY29ubl9icGMgPCBtaW5fYnBjKQorCQkJbWluX2Jw
YyA9IGNvbm5fYnBjOworCX0KKworCSpjb2xvcl9kZXB0aHMgPSBHRU5NQVNLKG1pbl9icGMsIDAp
OworfQorCiBzdGF0aWMgdm9pZCBrb21lZGFfY3J0Y191cGRhdGVfY2xvY2tfcmF0aW8oc3RydWN0
IGtvbWVkYV9jcnRjX3N0YXRlICprY3J0Y19zdCkKIHsKIAl1NjQgcHhsY2xrLCBhY2xrOwpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfa21zLmgg
Yi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9rbXMuaAppbmRleCA0
NWM0OThlMTVlN2EuLmE0MjUwMzQ1MWI1ZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Fy
bS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfa21zLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9k
aXNwbGF5L2tvbWVkYS9rb21lZGFfa21zLmgKQEAgLTE2Niw2ICsxNjYsOCBAQCBzdGF0aWMgaW5s
aW5lIGJvb2wgaGFzX2ZsaXBfaCh1MzIgcm90KQogCQlyZXR1cm4gISEocm90YXRpb24gJiBEUk1f
TU9ERV9SRUZMRUNUX1gpOwogfQogCit2b2lkIGtvbWVkYV9jcnRjX2dldF9jb2xvcl9jb25maWco
c3RydWN0IGRybV9jcnRjX3N0YXRlICpjcnRjX3N0LAorCQkJCSAgdTMyICpjb2xvcl9kZXB0aHMp
OwogdW5zaWduZWQgbG9uZyBrb21lZGFfY3J0Y19nZXRfYWNsayhzdHJ1Y3Qga29tZWRhX2NydGNf
c3RhdGUgKmtjcnRjX3N0KTsKIAogaW50IGtvbWVkYV9rbXNfc2V0dXBfY3J0Y3Moc3RydWN0IGtv
bWVkYV9rbXNfZGV2ICprbXMsIHN0cnVjdCBrb21lZGFfZGV2ICptZGV2KTsKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BpcGVsaW5lLmggYi9k
cml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZS5oCmluZGV4
IGIzMjJmNTJiYThmMi4uNzY1M2YxMzRhOGViIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZS5oCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BpcGVsaW5lLmgKQEAgLTMyMyw2ICszMjMsNyBA
QCBzdHJ1Y3Qga29tZWRhX2ltcHJvYyB7CiAKIHN0cnVjdCBrb21lZGFfaW1wcm9jX3N0YXRlIHsK
IAlzdHJ1Y3Qga29tZWRhX2NvbXBvbmVudF9zdGF0ZSBiYXNlOworCXU4IGNvbG9yX2RlcHRoOwog
CXUxNiBoc2l6ZSwgdnNpemU7CiB9OwogCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJt
L2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZV9zdGF0ZS5jIGIvZHJpdmVycy9ncHUvZHJt
L2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmVfc3RhdGUuYwppbmRleCAwYmE5YzZh
YTM3MDguLmU2OGU4Zjg1YWIyNyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNw
bGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmVfc3RhdGUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
YXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZV9zdGF0ZS5jCkBAIC03NDMsNiArNzQz
LDcgQEAga29tZWRhX2ltcHJvY192YWxpZGF0ZShzdHJ1Y3Qga29tZWRhX2ltcHJvYyAqaW1wcm9j
LAogCQkgICAgICAgc3RydWN0IGtvbWVkYV9kYXRhX2Zsb3dfY2ZnICpkZmxvdykKIHsKIAlzdHJ1
Y3QgZHJtX2NydGMgKmNydGMgPSBrY3J0Y19zdC0+YmFzZS5jcnRjOworCXN0cnVjdCBkcm1fY3J0
Y19zdGF0ZSAqY3J0Y19zdCA9ICZrY3J0Y19zdC0+YmFzZTsKIAlzdHJ1Y3Qga29tZWRhX2NvbXBv
bmVudF9zdGF0ZSAqY19zdDsKIAlzdHJ1Y3Qga29tZWRhX2ltcHJvY19zdGF0ZSAqc3Q7CiAKQEAg
LTc1Niw2ICs3NTcsMjQgQEAga29tZWRhX2ltcHJvY192YWxpZGF0ZShzdHJ1Y3Qga29tZWRhX2lt
cHJvYyAqaW1wcm9jLAogCXN0LT5oc2l6ZSA9IGRmbG93LT5pbl93OwogCXN0LT52c2l6ZSA9IGRm
bG93LT5pbl9oOwogCisJaWYgKGRybV9hdG9taWNfY3J0Y19uZWVkc19tb2Rlc2V0KGNydGNfc3Qp
KSB7CisJCXUzMiBvdXRwdXRfZGVwdGhzOworCQl1MzIgYXZhaWxfZGVwdGhzOworCisJCWtvbWVk
YV9jcnRjX2dldF9jb2xvcl9jb25maWcoY3J0Y19zdCwKKwkJCQkJICAgICAmb3V0cHV0X2RlcHRo
cyk7CisKKwkJYXZhaWxfZGVwdGhzID0gb3V0cHV0X2RlcHRocyAmIGltcHJvYy0+c3VwcG9ydGVk
X2NvbG9yX2RlcHRoczsKKwkJaWYgKGF2YWlsX2RlcHRocyA9PSAwKSB7CisJCQlEUk1fREVCVUdf
QVRPTUlDKCJObyBhdmFpbGFibGUgY29sb3IgZGVwdGhzLCBjb25uIGRlcHRoczogMHgleCAmIGRp
c3BsYXk6IDB4JXhcbiIsCisJCQkJCSBvdXRwdXRfZGVwdGhzLAorCQkJCQkgaW1wcm9jLT5zdXBw
b3J0ZWRfY29sb3JfZGVwdGhzKTsKKwkJCXJldHVybiAtRUlOVkFMOworCQl9CisKKwkJc3QtPmNv
bG9yX2RlcHRoID0gX19mbHMoYXZhaWxfZGVwdGhzKTsKKwl9CisKIAlrb21lZGFfY29tcG9uZW50
X2FkZF9pbnB1dCgmc3QtPmJhc2UsICZkZmxvdy0+aW5wdXQsIDApOwogCWtvbWVkYV9jb21wb25l
bnRfc2V0X291dHB1dCgmZGZsb3ctPmlucHV0LCAmaW1wcm9jLT5iYXNlLCAwKTsKIApkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfd2JfY29ubmVj
dG9yLmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV93Yl9jb25u
ZWN0b3IuYwppbmRleCAyODUxY2FjOTRkODYuLjc0MGE4MTI1MDYzMCAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfd2JfY29ubmVjdG9yLmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfd2JfY29ubmVjdG9y
LmMKQEAgLTE0Miw2ICsxNDIsNyBAQCBzdGF0aWMgaW50IGtvbWVkYV93Yl9jb25uZWN0b3JfYWRk
KHN0cnVjdCBrb21lZGFfa21zX2RldiAqa21zLAogCXN0cnVjdCBrb21lZGFfZGV2ICptZGV2ID0g
a21zLT5iYXNlLmRldl9wcml2YXRlOwogCXN0cnVjdCBrb21lZGFfd2JfY29ubmVjdG9yICprd2Jf
Y29ubjsKIAlzdHJ1Y3QgZHJtX3dyaXRlYmFja19jb25uZWN0b3IgKndiX2Nvbm47CisJc3RydWN0
IGRybV9kaXNwbGF5X2luZm8gKmluZm87CiAJdTMyICpmb3JtYXRzLCBuX2Zvcm1hdHMgPSAwOwog
CWludCBlcnI7CiAKQEAgLTE3MSw2ICsxNzIsOSBAQCBzdGF0aWMgaW50IGtvbWVkYV93Yl9jb25u
ZWN0b3JfYWRkKHN0cnVjdCBrb21lZGFfa21zX2RldiAqa21zLAogCiAJZHJtX2Nvbm5lY3Rvcl9o
ZWxwZXJfYWRkKCZ3Yl9jb25uLT5iYXNlLCAma29tZWRhX3diX2Nvbm5faGVscGVyX2Z1bmNzKTsK
IAorCWluZm8gPSAma3diX2Nvbm4tPmJhc2UuYmFzZS5kaXNwbGF5X2luZm87CisJaW5mby0+YnBj
ID0gX19mbHMoa2NydGMtPm1hc3Rlci0+aW1wcm9jLT5zdXBwb3J0ZWRfY29sb3JfZGVwdGhzKTsK
KwogCWtjcnRjLT53Yl9jb25uID0ga3diX2Nvbm47CiAKIAlyZXR1cm4gMDsKLS0gCjIuMTcuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
