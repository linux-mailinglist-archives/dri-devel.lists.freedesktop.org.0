Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1FEFD1C9
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2019 01:02:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19B966F383;
	Fri, 15 Nov 2019 00:02:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130044.outbound.protection.outlook.com [40.107.13.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F9FC6F383
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2019 00:02:13 +0000 (UTC)
Received: from VI1PR08CA0184.eurprd08.prod.outlook.com (2603:10a6:800:d2::14)
 by VI1PR08MB4237.eurprd08.prod.outlook.com (2603:10a6:803:fc::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.23; Fri, 15 Nov
 2019 00:02:09 +0000
Received: from AM5EUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::205) by VI1PR08CA0184.outlook.office365.com
 (2603:10a6:800:d2::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2451.23 via Frontend
 Transport; Fri, 15 Nov 2019 00:02:09 +0000
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT030.mail.protection.outlook.com (10.152.16.117) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2451.23 via Frontend Transport; Fri, 15 Nov 2019 00:02:09 +0000
Received: ("Tessian outbound 081de437afc7:v33");
 Fri, 15 Nov 2019 00:02:08 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: a3b8982bc5ee555a
X-CR-MTA-TID: 64aa7808
Received: from 32eea7984d57.2 (cr-mta-lb-1.cr-mta-net [104.47.9.54])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 155D8689-8CA9-4379-AE64-12E13DF5E87F.1; 
 Fri, 15 Nov 2019 00:02:02 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2054.outbound.protection.outlook.com [104.47.9.54])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 32eea7984d57.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 15 Nov 2019 00:02:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LTYdAT0JZ0tyAHGE4MLHxD4uSzKLFMQT+69W6DDYenAUBKHEBE3eBrUDzqQlk6OxPxDlP9/EhpJpjw7QgOQM6bjX0Biq0naSduzvRl/oO0Vj+cBDc7ZPy6pSYUh0L7uAvalQshNq+2p1dUCEDflMWqc1FcHX97p9Jz5HPwjsiHP0ONPShqZJ/bKlaV+0zbecsPxi3KySerejFcLC6H2wgcKhGFcmfCrA4sXYtZJMUwHLWOTL9pIA9s3erV+kAZld07vK7BL+Z733Cbe1I4bgw65J2WpfCKkLuW9ovzd/pSTsUaAlcnfU6HIh2ASGHMo0PtabGYnCfAPeDO1oweRW8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x+K8la7NVtCnO9mwhfRNJRdP2O1FO4w3w3RGXdcefZM=;
 b=dEqNnK1OCS81UMYDDp9nmFOoyWiK/NrrPMLwXuqli2VswR/5hIKUZEneSDaG9YqZt6IY9MC8dTEfLOdV+4Z8DjdXwDiTk7cQ7t5m9sYgfdiaYwhDWPvH+7YY9ampBlEsu1n9y4BLtKD3GDJf3X2xusiz2zgJ821q7SkPZufvryobdTMccv3Eua4tHJTlw1Xv6UxNVo32+fJiHjAvuGDUH5yffYfUaL0Sgp2ISqJ0Y2DoA2dDF8OLZqL7F8Pf5BHiVcueSt3v3qnZA0HSOCaivuFSzAYwekr7zaG61FkU/9ILu2cBDzBLXv/XyEdvyAQhDgGhVlte16QKqApiC9nVRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB4383.eurprd08.prod.outlook.com (20.179.28.77) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.23; Fri, 15 Nov 2019 00:02:00 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d%3]) with mapi id 15.20.2451.027; Fri, 15 Nov 2019
 00:02:00 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
Subject: Re: [PATCH v3 1/6] drm/komeda: Add side by side assembling
Thread-Topic: [PATCH v3 1/6] drm/komeda: Add side by side assembling
Thread-Index: AQHVmsbDb0TRDDY6qUmWKK8J6ZmYzqeLWj+A
Date: Fri, 15 Nov 2019 00:02:00 +0000
Message-ID: <6478126.Gfiuz5foDL@e123338-lin>
References: <20191114083658.27237-1-james.qian.wang@arm.com>
 <20191114083658.27237-2-james.qian.wang@arm.com>
In-Reply-To: <20191114083658.27237-2-james.qian.wang@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.55]
x-clientproxiedby: LO2P265CA0181.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::25) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: dfdcd901-289b-4834-f8e9-08d7695f0f52
X-MS-TrafficTypeDiagnostic: VI1PR08MB4383:|VI1PR08MB4383:|VI1PR08MB4237:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VI1PR08MB4237D60B8C00AC5E5BE839998F700@VI1PR08MB4237.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:813;OLM:813;
x-forefront-prvs: 02229A4115
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(136003)(376002)(396003)(39860400002)(346002)(366004)(189003)(199004)(66556008)(6246003)(478600001)(66066001)(476003)(486006)(26005)(6636002)(52116002)(102836004)(25786009)(86362001)(6862004)(33716001)(11346002)(446003)(186003)(14444005)(7736002)(256004)(305945005)(386003)(6506007)(4326008)(54906003)(14454004)(6436002)(6512007)(9686003)(71190400001)(71200400001)(8676002)(316002)(76176011)(6116002)(3846002)(66476007)(5660300002)(81156014)(2906002)(81166006)(66946007)(6486002)(99286004)(64756008)(66446008)(229853002)(8936002)(39026011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB4383;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 6oZ7jOLbBq3XXK8lem0eSIkUI7b+I0F7xT6NzGi8gPpQ5Fijn3BQpa03Z4YdkAhoA+eoUrVQ4yhEJSWFnEE7t4ANW56deKMHqwN4tHAsw5tdoKnLlI8F8UEoylucKvIepGKnrcshPwqJgzvPMrR6T+QNKNkQmdYzjqVuT7aaOMZeCX6V2HPw0i+acYU2E4qu1jBoVYAc34oqeFjMg21hb698jYh7k9P1Gme9fKTENQjOIcwoGmozZ/9a23okaMtiTcNkI6nT+3/bbnrdwIfHDN/qX2JB5Y3LIMYR85R4al4lyD66CT1z4/hLYInIrCDpMsXhkzJfsiHpnjDzKo6ribm9I6IVgG3TtNdw/TFYqxqQA5jLMwZ6s9ujM5L263hjeCrdHNntJ+GgdO81ThdVgE3hWlE+QJHWqnA/Xw8di1DyC4DjOTCe45UiHUZBerop
Content-ID: <59DC05BA19F9514BB2B6EADC810B420F@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4383
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(346002)(136003)(39860400002)(376002)(396003)(1110001)(339900001)(199004)(189003)(6486002)(22756006)(316002)(2906002)(356004)(6636002)(70206006)(70586007)(11346002)(476003)(86362001)(446003)(6512007)(9686003)(6862004)(7736002)(105606002)(229853002)(4326008)(54906003)(36906005)(76176011)(6246003)(305945005)(186003)(25786009)(102836004)(99286004)(14444005)(14454004)(26826003)(478600001)(50466002)(6506007)(386003)(66066001)(46406003)(26005)(47776003)(5660300002)(8746002)(8936002)(81166006)(81156014)(486006)(336012)(3846002)(6116002)(76130400001)(126002)(97756001)(23726003)(33716001)(8676002)(39026011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB4237;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Fail; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 007294e7-747e-4f85-276d-08d7695f09d8
NoDisclaimer: True
X-Forefront-PRVS: 02229A4115
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Pub3yVfj+qxZFTRc1egNGveIw7ItmqESK1m9lGHHB0+1edZ7fgzH9/T/5y0FlVqYBNMtqVedrOzvy/UxK9Ivs42MihUGs+zh5K+v1856L1Oe8KclncGTzjIEDWB/iRIUOo3dowJTA0DyyJftgsZ3YeXtFp0xunKOrwp7q1m1PN0aHCFZEMg034NhnaiIdQLI9li8v6ZjiHHRYtqCPFSOaAOpWh9cFSwTIltnQoVOijeoL78jEC/MMn97Dy6vKXVzxKVp/TDz5j8cSpMbW0duns0WIt/p19tDyGjJsfFk+lICwW1n2SSW4pa8IybmG6/F8niC4y7bWtHggDbUfXtkbKEGUOuPltepvQDUoS7++pdPV8IN4r8BqwRxA6ayy+6O4g2hkSIB2w5opxF+InTuAAfcttwggWUWeenZNLG/c6TJbn53DuEkdcuvW9LoXLK/
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2019 00:02:09.5329 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dfdcd901-289b-4834-f8e9-08d7695f0f52
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4237
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x+K8la7NVtCnO9mwhfRNJRdP2O1FO4w3w3RGXdcefZM=;
 b=z/YMS7TZfUX/6a+41AuX6a8vp5T6mNAcAsU1nuUcFsADmUXkOLlK/d6EoJmQzC12SIpkjvInKW0pafTVRJMABkMj7bXkg/BoWggb4FdX4lmq8d5gVrR2GXie79fKvhtx+mZ+tNKUdFdtcwHCV4wNoshgz9YzcWh9rQffQ/nvBTU=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x+K8la7NVtCnO9mwhfRNJRdP2O1FO4w3w3RGXdcefZM=;
 b=z/YMS7TZfUX/6a+41AuX6a8vp5T6mNAcAsU1nuUcFsADmUXkOLlK/d6EoJmQzC12SIpkjvInKW0pafTVRJMABkMj7bXkg/BoWggb4FdX4lmq8d5gVrR2GXie79fKvhtx+mZ+tNKUdFdtcwHCV4wNoshgz9YzcWh9rQffQ/nvBTU=
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
Cc: "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>, "Oscar
 Zhang \(Arm Technology China\)" <Oscar.Zhang@arm.com>,
 "Tiannan Zhu \(Arm Technology China\)" <Tiannan.Zhu@arm.com>,
 "airlied@linux.ie" <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>,
 Ayan Halder <Ayan.Halder@arm.com>, "Channing Chen \(Arm
 Technology China\)" <Channing.Chen@arm.com>,
 "Yiqi Kang \(Arm Technology China\)" <Yiqi.Kang@arm.com>,
 "Thomas Sun \(Arm Technology China\)" <thomas.Sun@arm.com>, nd <nd@arm.com>,
 "sean@poorly.run" <sean@poorly.run>, Ben Davis <Ben.Davis@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSmFtZXMsCgpPbiBUaHVyc2RheSwgMTQgTm92ZW1iZXIgMjAxOSAwODozNzoyNCBHTVQgamFt
ZXMgcWlhbiB3YW5nIChBcm0gVGVjaG5vbG9neSBDaGluYSkgd3JvdGU6Cj4gS29tZWRhIEhXIGNh
biBzdXBwb3J0IHNpZGUgYnkgc2lkZSwgd2hpY2ggc3BsaXRzIHRoZSBpbnRlcm5hbCBkaXNwbGF5
Cj4gcHJvY2Vzc2luZyB0byB0d28gc2luZ2xlIGhhbHZlcyAoTEVGVC9SSUdIVCkgYW5kIGhhbmRs
ZSB0aGVtIGJ5IHR3bwo+IHBpcGVsaW5lcyBzZXBhcmF0ZWx5Lgo+IGtvbWVkYSAic2lkZSBieSBz
aWRlIiBpcyBlbmFibGVkIGJ5IERUIHByb3BlcnR5OiAic2lkZV9ieV9zaWRlX21hc3RlciIsCj4g
b25jZSBEVCBjb25maWd1cmVkIHNpZGUgYnkgc2lkZSwga29tZWRhIG5lZWQgdG8gdmVyaWZ5IGl0
IHdpdGggSFcncwo+IGNvbmZpZ3VyYXRpb24sIGFuZCBhc3NlbWJsZSBpdCBmb3IgdGhlIGZ1cnRo
ZXIgdXNhZ2UuCgpBIGZldyBwcm9ibGVtcyBJIHNlZSB3aXRoIHRoaXMgYXBwcm9hY2g6CiAtIFRo
aXMgcHJvcGVydHkgZG9lc24ndCBzY2FsZSB0byA+MiBwaXBlczsKIC0gT3VyIEhXIGlzIGNhcGFi
bGUgb2YgZHluYW1pY2FsbHkgc3dpdGNoaW5nIGJldHdlZW4gU0JTIGFuZCBub24tU0JTCm1vZGVz
LCB3aXRoIHRoaXMgRFQgcHJvcGVydHkgeW91J3JlIGVmZmVjdGl2ZWx5IGRlbnlpbmcgdGhlIG9w
cG9ydHVuaXR5CnRvIHVzZSB0aGUgc2Vjb25kIHBpcGUgd2hlbiB0aGUgZmlyc3Qgb25lIGNhbiBi
ZSBzYXRpc2ZpZWQgd2l0aAo0IHBsYW5lcyBhbmQgMXB4L2Nsay4KCklmIHdlIG9ubHkgd2FudCB0
byBmaXggdGhlIGZpcnN0IHByb2JsZW0sIHRoZW4gYXQgbGVhc3Qgd2UgbmVlZCB0aGlzCnRvIGJl
IGEgcHJvcGVydHkgb2YgdGhlIHBpcGVsaW5lIG5vZGUgd2l0aCBhIHBoYW5kbGUgbGlua2luZyBz
bGF2ZSB0bwptYXN0ZXIgKG9yIGJpZGlyZWN0aW9uYWwpLgoKRm9yIHRoZSBzZWNvbmQsIHdoeSBu
b3QgZG8gdGhlIFNCUyBkZWNpc2lvbiBhdCBtb2Rlc2V0IHRpbWU/CklmIHRoZSBmaXJzdCBDUlRD
IGhhcyBkdWFsLWxpbmsgb3V0cHV0IGFuZCB0aGUgY29tbWl0OgogLSBvbmx5IGRyaXZlcyBvbmUg
Q1JUQwogLSB1c2VzIHVwIHRvIDQgcGxhbmVzCiAtIGRvZXNuJ3QgbWVldCBjbGsgcmVxdWlyZW1l
bnRzIHdpdGhvdXQgU0JTIGJ1dCBkb2VzIHdpdGggU0JTCnRoZW4gd2UgY2FuIHN3aXRjaCBTQlMg
b24gZHluYW1pY2FsbHkuCgpBbmQgd2UgY2FuIHR3ZWFrIHRoYXQgZGVjaXNpb24gd2l0aCBwb3dl
ciB1c2UgaW4gbWluZCBsYXRlciBvbiBzaW5jZQp0aGVyZSdzIG5vIHVzZXItdmlzaWJsZSBrbm9i
LgoKV2UgY2FuIHN0aWxsIGtlZXAgYSBEVCBwcm9wZXJ0eSBpZiB3ZSBoYXZlIGEgdXNlIGNhc2Ug
Zm9yIGl0IChlLmcuCmZvcmNpbmcgU0JTIG9uIGZvciBzb21lIHJlYXNvbiksIGJ1dCB3ZSBtaWdo
dCB3YW50IHRvIG5hbWUgaXQgc2xpZ2h0bHkKbW9yZSBjb25zZXJ2YXRpdmVseSB0aGVuLCBzbyBp
dCBkb2Vzbid0IGltcGx5IHRoYXQgd2UgbmV2ZXIgZG8gU0JTCndoZW4gaXQncyBub3QgdGhlcmUu
CgpMYXN0bHksIG1haW50YWluaW5nIHRoYXQgcHJvcGVydHkgaW4gY29tYmluYXRpb24gd2l0aCB0
aGUgZHluYW1pYwptb2Rlc2V0LXRpbWUgU0JTIGRlY2lzaW9uIHRyZWUgbWVhbnMgZXh0cmEgY29k
ZSBmb3IgbW9yZSBvciBsZXNzIHRoZQpzYW1lIGZ1bmN0aW9uYWxpdHkuIDwyYz5JJ20gbm90IDEw
MCUgc3VyZSBpdCdzIHdvcnRoIGl0LjwvMmM+Cgo+IAo+IHYzOiBDb3JyZWN0IGEgdHlwby4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBKYW1lcyBRaWFuIFdhbmcgKEFybSBUZWNobm9sb2d5IENoaW5hKSA8
amFtZXMucWlhbi53YW5nQGFybS5jb20+Cj4gLS0tCj4gIC4uLi9ncHUvZHJtL2FybS9kaXNwbGF5
L2tvbWVkYS9rb21lZGFfY3J0Yy5jICB8IDEzICsrKystCj4gIC4uLi9ncHUvZHJtL2FybS9kaXNw
bGF5L2tvbWVkYS9rb21lZGFfZGV2LmMgICB8ICAzICsrCj4gIC4uLi9ncHUvZHJtL2FybS9kaXNw
bGF5L2tvbWVkYS9rb21lZGFfZGV2LmggICB8ICA5ICsrKysKPiAgLi4uL2dwdS9kcm0vYXJtL2Rp
c3BsYXkva29tZWRhL2tvbWVkYV9rbXMuaCAgIHwgIDMgKysKPiAgLi4uL2RybS9hcm0vZGlzcGxh
eS9rb21lZGEva29tZWRhX3BpcGVsaW5lLmMgIHwgNTAgKysrKysrKysrKysrKysrKystLQo+ICAu
Li4vZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmUuaCAgfCAgMSArCj4gIDYg
ZmlsZXMgY2hhbmdlZCwgNzMgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKPiAKPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY3J0Yy5j
IGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY3J0Yy5jCj4gaW5k
ZXggMWM0NTJlYTc1OTk5Li5jZWU5YTE2OTJlNzEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY3J0Yy5jCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY3J0Yy5jCj4gQEAgLTU2MSwyMSArNTYxLDMw
IEBAIGludCBrb21lZGFfa21zX3NldHVwX2NydGNzKHN0cnVjdCBrb21lZGFfa21zX2RldiAqa21z
LAo+ICAJa21zLT5uX2NydGNzID0gMDsKPiAgCj4gIAlmb3IgKGkgPSAwOyBpIDwgbWRldi0+bl9w
aXBlbGluZXM7IGkrKykgewo+ICsJCS8qIGlmIHNicywgb25lIGtvbWVkYV9kZXYgb25seSBjYW4g
cmVwcmVzZW50IG9uZSBDUlRDICovCj4gKwkJaWYgKG1kZXYtPnNpZGVfYnlfc2lkZSAmJiBpICE9
IG1kZXYtPnNpZGVfYnlfc2lkZV9tYXN0ZXIpCj4gKwkJCWNvbnRpbnVlOwo+ICsKPiAgCQljcnRj
ID0gJmttcy0+Y3J0Y3Nba21zLT5uX2NydGNzXTsKPiAgCQltYXN0ZXIgPSBtZGV2LT5waXBlbGlu
ZXNbaV07Cj4gIAo+ICAJCWNydGMtPm1hc3RlciA9IG1hc3RlcjsKPiAgCQljcnRjLT5zbGF2ZSAg
PSBrb21lZGFfcGlwZWxpbmVfZ2V0X3NsYXZlKG1hc3Rlcik7Cj4gKwkJY3J0Yy0+c2lkZV9ieV9z
aWRlID0gbWRldi0+c2lkZV9ieV9zaWRlOwo+ICAKPiAgCQlpZiAoY3J0Yy0+c2xhdmUpCj4gIAkJ
CXNwcmludGYoc3RyLCAicGlwZS0lZCIsIGNydGMtPnNsYXZlLT5pZCk7Cj4gIAkJZWxzZQo+ICAJ
CQlzcHJpbnRmKHN0ciwgIk5vbmUiKTsKPiAgCj4gLQkJRFJNX0lORk8oIkNSVEMtJWQ6IG1hc3Rl
cihwaXBlLSVkKSBzbGF2ZSglcykuXG4iLAo+IC0JCQkga21zLT5uX2NydGNzLCBtYXN0ZXItPmlk
LCBzdHIpOwo+ICsJCURSTV9JTkZPKCJDUlRDLSVkOiBtYXN0ZXIocGlwZS0lZCkgc2xhdmUoJXMp
IHNicyglcykuXG4iLAo+ICsJCQkga21zLT5uX2NydGNzLCBtYXN0ZXItPmlkLCBzdHIsCj4gKwkJ
CSBjcnRjLT5zaWRlX2J5X3NpZGUgPyAiT24iIDogIk9mZiIpOwo+ICAKPiAgCQlrbXMtPm5fY3J0
Y3MrKzsKPiArCj4gKwkJaWYgKG1kZXYtPnNpZGVfYnlfc2lkZSkKPiArCQkJYnJlYWs7Cj4gIAl9
Cj4gIAo+ICAJcmV0dXJuIDA7Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlz
cGxheS9rb21lZGEva29tZWRhX2Rldi5jIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tv
bWVkYS9rb21lZGFfZGV2LmMKPiBpbmRleCA0ZTQ2ZjY1MGZkZGYuLmMzZmE0ODM1Y2I4ZCAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYu
Ywo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rldi5j
Cj4gQEAgLTE3OCw2ICsxNzgsOSBAQCBzdGF0aWMgaW50IGtvbWVkYV9wYXJzZV9kdChzdHJ1Y3Qg
ZGV2aWNlICpkZXYsIHN0cnVjdCBrb21lZGFfZGV2ICptZGV2KQo+ICAJCX0KPiAgCX0KPiAgCj4g
KwltZGV2LT5zaWRlX2J5X3NpZGUgPSAhb2ZfcHJvcGVydHlfcmVhZF91MzIobnAsICJzaWRlX2J5
X3NpZGVfbWFzdGVyIiwKPiArCQkJCQkJICAgJm1kZXYtPnNpZGVfYnlfc2lkZV9tYXN0ZXIpOwo+
ICsKPiAgCXJldHVybiByZXQ7Cj4gIH0KPiAgCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rldi5oIGIvZHJpdmVycy9ncHUvZHJtL2FybS9k
aXNwbGF5L2tvbWVkYS9rb21lZGFfZGV2LmgKPiBpbmRleCBkNDA2YTRkODMzNTIuLjQ3MTYwNGI0
MjQzMSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tv
bWVkYV9kZXYuaAo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29t
ZWRhX2Rldi5oCj4gQEAgLTE4Myw2ICsxODMsMTUgQEAgc3RydWN0IGtvbWVkYV9kZXYgewo+ICAK
PiAgCS8qKiBAaXJxOiBpcnEgbnVtYmVyICovCj4gIAlpbnQgaXJxOwo+ICsJLyoqCj4gKwkgKiBA
c2lkZV9ieV9zaWRlOgo+ICsJICoKPiArCSAqIG9uIHNicyB0aGUgd2hvbGUgZGlzcGxheSBmcmFt
ZSB3aWxsIGJlIHNwbGl0IHRvIHR3byBoYWx2ZXMgKDE6MiksCj4gKwkgKiBtYXN0ZXIgcGlwZWxp
bmUgaGFuZGxlcyB0aGUgbGVmdCBwYXJ0LCBzbGF2ZSBmb3IgdGhlIHJpZ2h0IHBhcnQKPiArCSAq
Lwo+ICsJYm9vbCBzaWRlX2J5X3NpZGU7CgpUaGF0J3MgYSBkdXBsaWNhdGUgb2YgdGhlIG9uZSBp
biBrb21lZGFfY3J0Yy4gWW91IGRvbid0IG5lZWQgYm90aC4KCj4gKwkvKiogQHNpZGVfYnlfc2lk
ZV9tYXN0ZXI6IG1hc3RlciBwaXBlIGlkIGZvciBzaWRlIGJ5IHNpZGUgKi8KPiArCWludCBzaWRl
X2J5X3NpZGVfbWFzdGVyOwoKQXMgSSBkZXRhaWxlZCBhYm92ZSwgdGhpcyBzaG91bGQgYmUgb24g
dGhlIGNydGMsIG90aGVyd2lzZSB3ZSBjYW4ndApzY2FsZSB0byA+MiBwaXBlcy4KCj4gIAo+ICAJ
LyoqIEBsb2NrOiB1c2VkIHRvIHByb3RlY3QgZHBtb2RlICovCj4gIAlzdHJ1Y3QgbXV0ZXggbG9j
azsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21l
ZGFfa21zLmggYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9rbXMu
aAo+IGluZGV4IDQ1NmYzYzQzNTcxOS4uYWU2NjU0ZmU5NWUyIDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ttcy5oCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfa21zLmgKPiBAQCAtNzYsNiArNzYs
OSBAQCBzdHJ1Y3Qga29tZWRhX2NydGMgewo+ICAJICovCj4gIAlzdHJ1Y3Qga29tZWRhX3BpcGVs
aW5lICpzbGF2ZTsKPiAgCj4gKwkvKiogQHNpZGVfYnlfc2lkZTogaWYgdGhlIG1hc3RlciBhbmQg
c2xhdmUgd29ya3Mgb24gc2lkZSBieSBzaWRlIG1vZGUgKi8KPiArCWJvb2wgc2lkZV9ieV9zaWRl
Owo+ICsKPiAgCS8qKiBAc2xhdmVfcGxhbmVzOiBrb21lZGEgc2xhdmUgcGxhbmVzIG1hc2sgKi8K
PiAgCXUzMiBzbGF2ZV9wbGFuZXM7Cj4gIAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZS5jIGIvZHJpdmVycy9ncHUvZHJtL2Fy
bS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmUuYwo+IGluZGV4IDQ1MmU1MDVhMWZkMy4u
MTA0ZTI3Y2MxZGMzIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9r
b21lZGEva29tZWRhX3BpcGVsaW5lLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3Bs
YXkva29tZWRhL2tvbWVkYV9waXBlbGluZS5jCj4gQEAgLTMyNiwxNCArMzI2LDU2IEBAIHN0YXRp
YyB2b2lkIGtvbWVkYV9waXBlbGluZV9hc3NlbWJsZShzdHJ1Y3Qga29tZWRhX3BpcGVsaW5lICpw
aXBlKQo+ICBzdHJ1Y3Qga29tZWRhX3BpcGVsaW5lICoKPiAga29tZWRhX3BpcGVsaW5lX2dldF9z
bGF2ZShzdHJ1Y3Qga29tZWRhX3BpcGVsaW5lICptYXN0ZXIpCj4gIHsKPiAtCXN0cnVjdCBrb21l
ZGFfY29tcG9uZW50ICpzbGF2ZTsKPiArCXN0cnVjdCBrb21lZGFfZGV2ICptZGV2ID0gbWFzdGVy
LT5tZGV2Owo+ICsJc3RydWN0IGtvbWVkYV9jb21wb25lbnQgKmNvbXAsICpzbGF2ZTsKPiArCXUz
MiBhdmFpbF9pbnB1dHM7Cj4gKwo+ICsJLyogb24gU0JTLCBzbGF2ZSBwaXBlbGluZSBtZXJnZSB0
byBtYXN0ZXIgdmlhIGltYWdlIHByb2Nlc3NvciAqLwo+ICsJaWYgKG1kZXYtPnNpZGVfYnlfc2lk
ZSkgewo+ICsJCWNvbXAgPSAmbWFzdGVyLT5pbXByb2MtPmJhc2U7Cj4gKwkJYXZhaWxfaW5wdXRz
ID0gS09NRURBX1BJUEVMSU5FX0lNUFJPQ1M7Cj4gKwl9IGVsc2Ugewo+ICsJCWNvbXAgPSAmbWFz
dGVyLT5jb21waXotPmJhc2U7Cj4gKwkJYXZhaWxfaW5wdXRzID0gS09NRURBX1BJUEVMSU5FX0NP
TVBJWlM7Cj4gKwl9Cj4gIAo+IC0Jc2xhdmUgPSBrb21lZGFfY29tcG9uZW50X3BpY2t1cF9pbnB1
dCgmbWFzdGVyLT5jb21waXotPmJhc2UsCj4gLQkJCQkJICAgICAgS09NRURBX1BJUEVMSU5FX0NP
TVBJWlMpOwo+ICsJc2xhdmUgPSBrb21lZGFfY29tcG9uZW50X3BpY2t1cF9pbnB1dChjb21wLCBh
dmFpbF9pbnB1dHMpOwo+ICAKPiAgCXJldHVybiBzbGF2ZSA/IHNsYXZlLT5waXBlbGluZSA6IE5V
TEw7Cj4gIH0KPiAgCj4gK3N0YXRpYyBpbnQga29tZWRhX2Fzc2VtYmxlX3NpZGVfYnlfc2lkZShz
dHJ1Y3Qga29tZWRhX2RldiAqbWRldikKPiArewo+ICsJc3RydWN0IGtvbWVkYV9waXBlbGluZSAq
bWFzdGVyLCAqc2xhdmU7Cj4gKwlpbnQgaTsKPiArCj4gKwlpZiAoIW1kZXYtPnNpZGVfYnlfc2lk
ZSkKPiArCQlyZXR1cm4gMDsKPiArCj4gKwlpZiAobWRldi0+c2lkZV9ieV9zaWRlX21hc3RlciA+
PSBtZGV2LT5uX3BpcGVsaW5lcykgewo+ICsJCURSTV9FUlJPUigiRFQgY29uZmlndXJlZCBzaWRl
IGJ5IHNpZGUgbWFzdGVyLSVkIGlzIGludmFsaWQuXG4iLAo+ICsJCQkgIG1kZXYtPnNpZGVfYnlf
c2lkZV9tYXN0ZXIpOwo+ICsJCXJldHVybiAtRUlOVkFMOwo+ICsJfQo+ICsKPiArCW1hc3RlciA9
IG1kZXYtPnBpcGVsaW5lc1ttZGV2LT5zaWRlX2J5X3NpZGVfbWFzdGVyXTsKPiArCXNsYXZlID0g
a29tZWRhX3BpcGVsaW5lX2dldF9zbGF2ZShtYXN0ZXIpOwo+ICsJaWYgKCFzbGF2ZSB8fCBzbGF2
ZS0+bl9sYXllcnMgIT0gbWFzdGVyLT5uX2xheWVycykgewo+ICsJCURSTV9FUlJPUigiQ3VycmVu
dCBIVyBkb2Vzbid0IHN1cHBvcnQgc2lkZSBieSBzaWRlLlxuIik7Cj4gKwkJcmV0dXJuIC1FSU5W
QUw7Cj4gKwl9Cj4gKwo+ICsJaWYgKCFtYXN0ZXItPmR1YWxfbGluaykgewo+ICsJCURSTV9ERUJV
R19BVE9NSUMoIlNCUyBjYW4gbm90IHdvcmsgd2l0aG91dCBkdWFsIGxpbmsuXG4iKTsKPiArCQly
ZXR1cm4gLUVJTlZBTDsKPiArCX0KPiArCj4gKwlmb3IgKGkgPSAwOyBpIDwgbWFzdGVyLT5uX2xh
eWVyczsgaSsrKQo+ICsJCW1hc3Rlci0+bGF5ZXJzW2ldLT5zYnNfc2xhdmUgPSBzbGF2ZS0+bGF5
ZXJzW2ldOwo+ICsKPiArCXJldHVybiAwOwo+ICt9Cj4gKwo+ICBpbnQga29tZWRhX2Fzc2VtYmxl
X3BpcGVsaW5lcyhzdHJ1Y3Qga29tZWRhX2RldiAqbWRldikKPiAgewo+ICAJc3RydWN0IGtvbWVk
YV9waXBlbGluZSAqcGlwZTsKPiBAQCAtMzQ2LDcgKzM4OCw3IEBAIGludCBrb21lZGFfYXNzZW1i
bGVfcGlwZWxpbmVzKHN0cnVjdCBrb21lZGFfZGV2ICptZGV2KQo+ICAJCWtvbWVkYV9waXBlbGlu
ZV9kdW1wKHBpcGUpOwo+ICAJfQo+ICAKPiAtCXJldHVybiAwOwo+ICsJcmV0dXJuIGtvbWVkYV9h
c3NlbWJsZV9zaWRlX2J5X3NpZGUobWRldik7Cj4gIH0KPiAgCj4gIHZvaWQga29tZWRhX3BpcGVs
aW5lX2R1bXBfcmVnaXN0ZXIoc3RydWN0IGtvbWVkYV9waXBlbGluZSAqcGlwZSwKPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmUu
aCBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BpcGVsaW5lLmgK
PiBpbmRleCBhYzg3MjVlMjQ4NTMuLjIwYTA3NmNjZTYzNSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZS5oCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmUuaAo+IEBAIC0y
MzcsNiArMjM3LDcgQEAgc3RydWN0IGtvbWVkYV9sYXllciB7Cj4gIAkgKiBub3QgdGhlIHNvdXJj
ZSBidWZmZXIuCj4gIAkgKi8KPiAgCXN0cnVjdCBrb21lZGFfbGF5ZXIgKnJpZ2h0Owo+ICsJc3Ry
dWN0IGtvbWVkYV9sYXllciAqc2JzX3NsYXZlOwo+ICB9Owo+ICAKPiAgc3RydWN0IGtvbWVkYV9s
YXllcl9zdGF0ZSB7Cj4gCgoKLS0gCk1paGFpbAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
