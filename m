Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B911F50B5
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2019 17:10:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 490DC6F9F1;
	Fri,  8 Nov 2019 16:10:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50072.outbound.protection.outlook.com [40.107.5.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5CD76F9F1
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2019 16:10:07 +0000 (UTC)
Received: from VI1PR08CA0256.eurprd08.prod.outlook.com (2603:10a6:803:dc::29)
 by AM0PR08MB3842.eurprd08.prod.outlook.com (2603:10a6:208:109::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2430.23; Fri, 8 Nov
 2019 16:10:03 +0000
Received: from VE1EUR03FT050.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::205) by VI1PR08CA0256.outlook.office365.com
 (2603:10a6:803:dc::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2430.22 via Frontend
 Transport; Fri, 8 Nov 2019 16:10:03 +0000
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT050.mail.protection.outlook.com (10.152.19.209) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.21 via Frontend Transport; Fri, 8 Nov 2019 16:10:03 +0000
Received: ("Tessian outbound 927f2cdd66cc:v33");
 Fri, 08 Nov 2019 16:10:01 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 91d9da83f8e0e9d8
X-CR-MTA-TID: 64aa7808
Received: from b70bfbaced47.2 (cr-mta-lb-1.cr-mta-net [104.47.8.50])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 26528A83-6F97-4C8B-A4B7-9E0AA436BB2D.1; 
 Fri, 08 Nov 2019 16:09:56 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2050.outbound.protection.outlook.com [104.47.8.50])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b70bfbaced47.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 08 Nov 2019 16:09:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZfsMhPwR91Gp+xgmna72Uq5qB8jg6T8uzZkBhpoKHLEE8EwiqrMdy1oy3yJGeL2PzNN24QIRejSug13/NwtSMv9mmn/11crvnHR21J5YIz34HIpR/A/GaSauvEzeMDobepu3I67Ya6HViFCRPqunLVcg9c3j+fr9SWWozJm+zrc+XK8GCeI/DmbNHuluFo0vOJLhCWoYu+CJSHmdPPpiufj3d8TAUmLlLAumoK10aiVKxnTa4rR48Jp7NV6kbA0K8NcUQoDxi5NZVhiFT3COnV8kojSZYRbtoXaHqZojp4zc8l/3z9DONb5lIhYMeLGD3RG3oOqZEVTgU2oryw4CEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Ma+a7IXg37BtqFIFodDHzf5p1ka57+xA/4Sk43Bpo0=;
 b=jjJmzkO0F7ILPtb0z5mtFqflhEm9O+uJLJLSlbud4r9Tv9PATqjbfijNxKN5NhYdUej350hIU6bJs1lWVRW1SUQ3npmozQIOF84U2g/ueLLdXgG2jAFfADJG5erer6IdYySp6JF8hTVJII5tYpwgAz3FVboQyUaWIMiS9mGyS1E+ASjSsIDQb/J1NbJi2tl2MK/RPYOFXRdE0XHqlwHklQDQl4FyuYwWSZA5awO6z8wz5k25UOWP/ZNLt2LWEnZoS4OGMkK4u32d1wVZn2QObyM6TTyEtINbNMphWAcB2paaJYLQKNTUNxNLDvfOP7WgLHqnbiiMwdjUj8oz+sa/kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from AM0PR08MB5345.eurprd08.prod.outlook.com (52.132.215.213) by
 AM0PR08MB3025.eurprd08.prod.outlook.com (52.134.93.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.24; Fri, 8 Nov 2019 16:09:55 +0000
Received: from AM0PR08MB5345.eurprd08.prod.outlook.com
 ([fe80::109c:e558:5074:13e4]) by AM0PR08MB5345.eurprd08.prod.outlook.com
 ([fe80::109c:e558:5074:13e4%6]) with mapi id 15.20.2430.023; Fri, 8 Nov 2019
 16:09:55 +0000
From: Ayan Halder <Ayan.Halder@arm.com>
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: Re: [PATCHv2 3/4] drm/komeda: use afbc helpers
Thread-Topic: [PATCHv2 3/4] drm/komeda: use afbc helpers
Thread-Index: AQHVk1z8e+jyr8X5TkmCl+TtswqJkaeBdzAA
Date: Fri, 8 Nov 2019 16:09:54 +0000
Message-ID: <20191108160954.GA17321@arm.com>
References: <2485717.1SzL54aMiy@e123338-lin>
 <20191104221228.3588-1-andrzej.p@collabora.com>
 <20191104221228.3588-4-andrzej.p@collabora.com>
In-Reply-To: <20191104221228.3588-4-andrzej.p@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LNXP265CA0007.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::19) To AM0PR08MB5345.eurprd08.prod.outlook.com
 (2603:10a6:208:18c::21)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Ayan.Halder@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [217.140.106.50]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 830c2d67-70c9-46bd-d72d-08d764661d03
X-MS-TrafficTypeDiagnostic: AM0PR08MB3025:|AM0PR08MB3025:|AM0PR08MB3842:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM0PR08MB38427E9DDC52E15D4AFA6754E47B0@AM0PR08MB3842.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
x-forefront-prvs: 0215D7173F
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(346002)(366004)(376002)(396003)(189003)(199004)(33656002)(476003)(2616005)(486006)(6506007)(386003)(102836004)(6436002)(52116002)(26005)(44832011)(305945005)(6512007)(4326008)(8676002)(76176011)(229853002)(256004)(81156014)(81166006)(66446008)(64756008)(186003)(11346002)(446003)(99286004)(66066001)(6916009)(7736002)(6486002)(66946007)(66476007)(66556008)(8936002)(86362001)(25786009)(1076003)(316002)(71200400001)(2906002)(54906003)(14444005)(6116002)(3846002)(5660300002)(6246003)(7416002)(14454004)(36756003)(71190400001)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB3025;
 H:AM0PR08MB5345.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: mSdd7velgxrCU82YKwOHrI0/stMIZJbXymhrbhewSy4Hj54WlNxwVdNVrzLaxZP7bOKFeHu4WAHAQhhfgLcoxIQCbRcrbV5LS+90sj1DNCbNskVxf4UEiUUpnWeumoUKejZ1bXeaEMarHYgFcQNQQeDjdVzrtWSlCp9lKyP+7bA+Q/zh0hIjueJjNG5RK1w0vfF5s3jxPzCyKdfmPofFti+vuS185ruMn0f1KAmbIn2vxFF1JXIGN/XYZZxhyFSMtes7h2xIO0jZqD4l47nf4QXpimjJyR/Kaplb2F7NjSEUypU7kbX0ZyQaFvFsNRikSnYVdXJF7JB5PV2OpJOPTqRtCxKvxrsH+ckwSooTmSiYzbt640sN9c+GMzBwNdlfGpFqtXpf61NdvHJLBogpcdce44c8Y6F0f75BqfYu/gQnheLcC3BgupnfA4LHWyp1
Content-ID: <7C70E09EA3E76D4E9339612D2D6FF4C7@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3025
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Ayan.Halder@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(346002)(376002)(39860400002)(1110001)(339900001)(199004)(189003)(23756003)(3846002)(36756003)(186003)(356004)(25786009)(2906002)(81156014)(6486002)(478600001)(99286004)(36906005)(316002)(126002)(486006)(8746002)(8936002)(476003)(11346002)(54906003)(6116002)(14454004)(1076003)(26826003)(8676002)(336012)(81166006)(86362001)(5660300002)(70586007)(6512007)(6506007)(47776003)(22756006)(76130400001)(33656002)(7736002)(305945005)(14444005)(66066001)(4326008)(26005)(6862004)(6246003)(50466002)(70206006)(386003)(105606002)(102836004)(76176011)(2616005)(446003)(229853002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB3842;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Fail; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 0bf79ed3-0ffe-4660-a099-08d7646617f6
NoDisclaimer: True
X-Forefront-PRVS: 0215D7173F
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5ONpSRTtrDrLYeaHuYjTSQhxkLLBWLW3byr11/bMJ94WtTfzJQv/Yqd9gGESBZwCXf7E8yfBpAW2IGKTtmlN71JNDef8XI9uKCDwEXkyQ2FrVs09ywjptH5t5oIGKUlsrqMZv8p+pyw3up1Ui4i4hEL+kJBtHyhItjoaHJVuzdiM3srxt7n8mXcrj+hPaUe1wCf8GmhQJjHlSBNk3G+q1BthXQkz9KEnJPRTI2lJ/YGqfrtLXyZM3Bibew+ie19nGVyOZxKwHTCRHapwIJ8nX4yayoN+HcEf7gfM/0esbCTBkn5jJzzICwJSxifX4IfXnH5ly2VvZwbR+3oZrYUL1iFojXUt/9KycDSNSwh1MUsmbpK939ZZMrJdZGQlX/wpmO1s/CxQ+sG4i615+ZpYQmn8b+bCIGrjUwKu52A/U1UqzHO3My/8i+0b+ogDZkEZ
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2019 16:10:03.1346 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 830c2d67-70c9-46bd-d72d-08d764661d03
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3842
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Ma+a7IXg37BtqFIFodDHzf5p1ka57+xA/4Sk43Bpo0=;
 b=FV56Ms4LhIUNa5Va8nHu3DwWAaltuFuxrJLvynE8v5MYkcrRlABS/Jnzc60hU6kZlwCiKwbzKuanSqMcxTOxPLaElzanrMK9noR2zY+yOOwi0hEY10/yfSLtemLYk6LCGOilmtqr4FZS+cVxZWSgg4e/JL64AjqU8C7uO8ZG0lA=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Ma+a7IXg37BtqFIFodDHzf5p1ka57+xA/4Sk43Bpo0=;
 b=FV56Ms4LhIUNa5Va8nHu3DwWAaltuFuxrJLvynE8v5MYkcrRlABS/Jnzc60hU6kZlwCiKwbzKuanSqMcxTOxPLaElzanrMK9noR2zY+yOOwi0hEY10/yfSLtemLYk6LCGOilmtqr4FZS+cVxZWSgg4e/JL64AjqU8C7uO8ZG0lA=
X-Mailman-Original-Authentication-Results: spf=fail (sender IP is 63.35.35.123)
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
Cc: nd <nd@arm.com>, "kernel@collabora.com" <kernel@collabora.com>,
 David Airlie <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Mihail Atanassov <Mihail.Atanassov@arm.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBOb3YgMDQsIDIwMTkgYXQgMTE6MTI6MjdQTSArMDEwMCwgQW5kcnplaiBQaWV0cmFz
aWV3aWN6IHdyb3RlOgo+IFRoZXJlIGFyZSBhZmJjIGhlbHBlcnMgYXZhaWxhYmxlLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IEFuZHJ6ZWogUGlldHJhc2lld2ljeiA8YW5kcnplai5wQGNvbGxhYm9yYS5j
b20+Cj4gLS0tCj4gIC4uLi9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Zvcm1hdF9jYXBzLmgg
ICB8ICAxIC0KPiAgLi4uL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZnJhbWVidWZmZXIuYyAg
IHwgNDQgKysrKysrKy0tLS0tLS0tLS0tLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDE3IGluc2VydGlv
bnMoKyksIDI4IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9mb3JtYXRfY2Fwcy5oIGIvZHJpdmVycy9ncHUvZHJt
L2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZm9ybWF0X2NhcHMuaAo+IGluZGV4IDMyMjczY2Yx
OGY3Yy4uNjA3ZWVhODBlNjBjIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlz
cGxheS9rb21lZGEva29tZWRhX2Zvcm1hdF9jYXBzLmgKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
YXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9mb3JtYXRfY2Fwcy5oCj4gQEAgLTMzLDcgKzMzLDYg
QEAKPiAgCj4gICNkZWZpbmUgQUZCQ19USF9MQVlPVVRfQUxJR05NRU5UCTgKPiAgI2RlZmluZSBB
RkJDX0hFQURFUl9TSVpFCQkxNgo+IC0jZGVmaW5lIEFGQkNfU1VQRVJCTEtfQUxJR05NRU5UCQkx
MjgKPiAgI2RlZmluZSBBRkJDX1NVUEVSQkxLX1BJWEVMUwkJMjU2Cj4gICNkZWZpbmUgQUZCQ19C
T0RZX1NUQVJUX0FMSUdOTUVOVAkxMDI0Cj4gICNkZWZpbmUgQUZCQ19USF9CT0RZX1NUQVJUX0FM
SUdOTUVOVAk0MDk2Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9r
b21lZGEva29tZWRhX2ZyYW1lYnVmZmVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkv
a29tZWRhL2tvbWVkYV9mcmFtZWJ1ZmZlci5jCj4gaW5kZXggMWIwMWE2MjVmNDBlLi5lOWM4NzU1
MWE1YjggMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9r
b21lZGFfZnJhbWVidWZmZXIuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9r
b21lZGEva29tZWRhX2ZyYW1lYnVmZmVyLmMKPiBAQCAtNCw2ICs0LDcgQEAKPiAgICogQXV0aG9y
OiBKYW1lcy5RaWFuLldhbmcgPGphbWVzLnFpYW4ud2FuZ0Bhcm0uY29tPgo+ICAgKgo+ICAgKi8K
PiArI2luY2x1ZGUgPGRybS9kcm1fYWZiYy5oPgo+ICAjaW5jbHVkZSA8ZHJtL2RybV9kZXZpY2Uu
aD4KPiAgI2luY2x1ZGUgPGRybS9kcm1fZmJfY21hX2hlbHBlci5oPgo+ICAjaW5jbHVkZSA8ZHJt
L2RybV9nZW0uaD4KPiBAQCAtNDMsOCArNDQsNyBAQCBrb21lZGFfZmJfYWZiY19zaXplX2NoZWNr
KHN0cnVjdCBrb21lZGFfZmIgKmtmYiwgc3RydWN0IGRybV9maWxlICpmaWxlLAo+ICAJc3RydWN0
IGRybV9mcmFtZWJ1ZmZlciAqZmIgPSAma2ZiLT5iYXNlOwo+ICAJY29uc3Qgc3RydWN0IGRybV9m
b3JtYXRfaW5mbyAqaW5mbyA9IGZiLT5mb3JtYXQ7Cj4gIAlzdHJ1Y3QgZHJtX2dlbV9vYmplY3Qg
Km9iajsKPiAtCXUzMiBhbGlnbm1lbnRfdyA9IDAsIGFsaWdubWVudF9oID0gMCwgYWxpZ25tZW50
X2hlYWRlciwgbl9ibG9ja3MsIGJwcDsKPiAtCXU2NCBtaW5fc2l6ZTsKPiArCXUzMiBhbGlnbm1l
bnRfdyA9IDAsIGFsaWdubWVudF9oID0gMCwgYWxpZ25tZW50X2hlYWRlciwgYnBwOwo+ICAKPiAg
CW9iaiA9IGRybV9nZW1fb2JqZWN0X2xvb2t1cChmaWxlLCBtb2RlX2NtZC0+aGFuZGxlc1swXSk7
Cj4gIAlpZiAoIW9iaikgewo+IEBAIC01MiwxOSArNTIsMTUgQEAga29tZWRhX2ZiX2FmYmNfc2l6
ZV9jaGVjayhzdHJ1Y3Qga29tZWRhX2ZiICprZmIsIHN0cnVjdCBkcm1fZmlsZSAqZmlsZSwKPiAg
CQlyZXR1cm4gLUVOT0VOVDsKPiAgCX0KPiAgCj4gLQlzd2l0Y2ggKGZiLT5tb2RpZmllciAmIEFG
QkNfRk9STUFUX01PRF9CTE9DS19TSVpFX01BU0spIHsKPiAtCWNhc2UgQUZCQ19GT1JNQVRfTU9E
X0JMT0NLX1NJWkVfMzJ4ODoKPiAtCQlhbGlnbm1lbnRfdyA9IDMyOwo+IC0JCWFsaWdubWVudF9o
ID0gODsKPiAtCQlicmVhazsKPiAtCWNhc2UgQUZCQ19GT1JNQVRfTU9EX0JMT0NLX1NJWkVfMTZ4
MTY6Cj4gLQkJYWxpZ25tZW50X3cgPSAxNjsKPiAtCQlhbGlnbm1lbnRfaCA9IDE2Owo+IC0JCWJy
ZWFrOwo+IC0JZGVmYXVsdDoKPiAtCQlXQVJOKDEsICJJbnZhbGlkIEFGQkNfRk9STUFUX01PRF9C
TE9DS19TSVpFOiAlbGxkLlxuIiwKPiAtCQkgICAgIGZiLT5tb2RpZmllciAmIEFGQkNfRk9STUFU
X01PRF9CTE9DS19TSVpFX01BU0spOwo+IC0JCWJyZWFrOwo+ICsJaWYgKCFkcm1fYWZiY19nZXRf
c3VwZXJibGtfd2goZmItPm1vZGlmaWVyLCAmYWxpZ25tZW50X3csICZhbGlnbm1lbnRfaCkpCj4g
KwkJcmV0dXJuIC1FSU5WQUw7Cj4gKwo+ICsJaWYgKChhbGlnbm1lbnRfdyAhPSAxNiB8fCBhbGln
bm1lbnRfaCAhPSAxNikgJiYKPiArCSAgICAoYWxpZ25tZW50X3cgIT0gMzIgfHwgYWxpZ25tZW50
X2ggIT0gOCkpIHsKPiArCQlEUk1fREVCVUdfS01TKCJVbnN1cHBvcnRlZCBhZmJjIHRpbGUgdy9o
IFslZC8lZF1cbiIsCj4gKwkJCSAgICAgIGFsaWdubWVudF93LCBhbGlnbm1lbnRfaCk7Cj4gKwo+
ICsJCXJldHVybiAtRUlOVkFMOwpUbyBiZSBob25lc3QsIHRoZSBwcmV2aW91cyBjb2RlIGxvb2tz
IG11Y2ggbW9yZSByZWFkYWJsZQo+ICAJfQo+ICAKPiAgCS8qIHRpbGVkIGhlYWRlciBhZmJjICov
Cj4gQEAgLTg0LDIwICs4MCwxNCBAQCBrb21lZGFfZmJfYWZiY19zaXplX2NoZWNrKHN0cnVjdCBr
b21lZGFfZmIgKmtmYiwgc3RydWN0IGRybV9maWxlICpmaWxlLAo+ICAJCWdvdG8gY2hlY2tfZmFp
bGVkOwo+ICAJfQo+ICAKPiAtCW5fYmxvY2tzID0gKGtmYi0+YWxpZ25lZF93ICoga2ZiLT5hbGln
bmVkX2gpIC8gQUZCQ19TVVBFUkJMS19QSVhFTFM7Cj4gLQlrZmItPm9mZnNldF9wYXlsb2FkID0g
QUxJR04obl9ibG9ja3MgKiBBRkJDX0hFQURFUl9TSVpFLAo+IC0JCQkJICAgIGFsaWdubWVudF9o
ZWFkZXIpOwo+IC0KPiAgCWJwcCA9IGtvbWVkYV9nZXRfYWZiY19mb3JtYXRfYnBwKGluZm8sIGZi
LT5tb2RpZmllcik7Cj4gLQlrZmItPmFmYmNfc2l6ZSA9IGtmYi0+b2Zmc2V0X3BheWxvYWQgKyBu
X2Jsb2NrcyAqCj4gLQkJCSBBTElHTihicHAgKiBBRkJDX1NVUEVSQkxLX1BJWEVMUyAvIDgsCj4g
LQkJCSAgICAgICBBRkJDX1NVUEVSQkxLX0FMSUdOTUVOVCk7Cj4gLQltaW5fc2l6ZSA9IGtmYi0+
YWZiY19zaXplICsgZmItPm9mZnNldHNbMF07Cj4gLQlpZiAobWluX3NpemUgPiBvYmotPnNpemUp
IHsKPiAtCQlEUk1fREVCVUdfS01TKCJhZmJjIHNpemUgY2hlY2sgZmFpbGVkLCBvYmpfc2l6ZTog
MHglenguIG1pbl9zaXplIDB4JWxseC5cbiIsCj4gLQkJCSAgICAgIG9iai0+c2l6ZSwgbWluX3Np
emUpOwpXZSBuZWVkIGtmYi0+b2Zmc2V0X3BheWxvYWQgYW5kIGtmYi0+YWZiY19zaXplIHRvIHNl
dCBzb21lIHJlZ2lzdGVycwppbiBkNzFfbGF5ZXJfdXBkYXRlKCkuIEF0IHRoaXMgbW9tZW50IEkg
ZmVlbCBsaWtlIHB1bmNoaW5nIG15c2VsZiBmb3IKbWFraW5nIHRoZSBzdWdnZXN0aW9uIHRvIGNv
bnNpZGVyIGFic3RyYWN0aW5nIHNvbWUgb2YgdGhlIGtvbWVkYSdzIGFmYmMKY2hlY2tzLiBUbyBt
ZSBpdCBkb2VzIG5vdCBsb29rIGxpa2Uga29tZWRhKGluIHRoZSBjdXJyZW50IHNoYXBlKSBjYW4g
dGFrZQptdWNoIGFkdmFudGFnZSBvZiB0aGUgZ2VuZXJpYyBfYWZiY19mYl9jaGVjaygpIGZ1bmN0
aW9uIChhcyB3YXMgc3VnZ2VzdGVkCnByZXZpb3VzbHkgYnkgRGFudmV0KS4KCkhvd2V2ZXIsIEkg
d2lsbCBsZXQgamFtZXMucWlhbi53YW5nQGFybS5jb20sCk1paGFpbC5BdGFuYXNzb3ZAYXJtLmNv
bSwgQmVuLkRhdmlzQGFybS5jb20gY29tbWVudCBoZXJlIHRvIHNlZSBpZgp0aGVyZSBjb3VsZCBi
ZSBhIHdheSBvZiBhYnN0cmFjdGluZyB0aGUgYWZiYyBiaXRzIGZyb20ga29tZWRhLgoKVGhhbmtz
IGFueXdheXMgZm9yIHRha2luZyBhIHN0YWIgYXQgdGhpcy4KLUF5YW4KPiArCj4gKwlpZiAoIWRy
bV9hZmJjX2NoZWNrX2ZiX3NpemUobW9kZV9jbWQtPnBpdGNoZXNbMF0sIGJwcCwKPiArCQkJCSAg
ICBtb2RlX2NtZC0+d2lkdGgsIG1vZGVfY21kLT5oZWlnaHQsCj4gKwkJCQkgICAgYWxpZ25tZW50
X3csIGFsaWdubWVudF9oLAo+ICsJCQkJICAgIG9iai0+c2l6ZSwgbW9kZV9jbWQtPm9mZnNldHNb
MF0sCj4gKwkJCQkgICAgQUZCQ19TVVBFUkJMS19BTElHTk1FTlQpKQo+ICAJCWdvdG8gY2hlY2tf
ZmFpbGVkOwo+IC0JfQo+ICAKPiAgCWZiLT5vYmpbMF0gPSBvYmo7Cj4gIAlyZXR1cm4gMDsKPiAt
LSAKPiAyLjE3LjEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
