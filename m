Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF173D70E4
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 10:22:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1B796E624;
	Tue, 15 Oct 2019 08:22:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50051.outbound.protection.outlook.com [40.107.5.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 337BB6E624
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 08:22:01 +0000 (UTC)
Received: from AM6PR08CA0008.eurprd08.prod.outlook.com (2603:10a6:20b:b2::20)
 by AM6PR08MB4310.eurprd08.prod.outlook.com (2603:10a6:20b:b8::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.17; Tue, 15 Oct
 2019 08:21:56 +0000
Received: from VE1EUR03FT054.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::204) by AM6PR08CA0008.outlook.office365.com
 (2603:10a6:20b:b2::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.16 via Frontend
 Transport; Tue, 15 Oct 2019 08:21:56 +0000
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT054.mail.protection.outlook.com (10.152.19.64) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Tue, 15 Oct 2019 08:21:55 +0000
Received: ("Tessian outbound 6481c7fa5a3c:v33");
 Tue, 15 Oct 2019 08:21:52 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: caca5d509e512c11
X-CR-MTA-TID: 64aa7808
Received: from 31a7e0264fbc.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.1.50]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D3100901-9DF4-41AB-B43F-E002B54BCE40.1; 
 Tue, 15 Oct 2019 08:21:46 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2050.outbound.protection.outlook.com [104.47.1.50])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 31a7e0264fbc.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 15 Oct 2019 08:21:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DFXHUZBboN3/U+86pAInPpUKTarUTnyRNq7RPK5om/Iv7aw9UadYKhe+x9BV9DSW4GYTEK16/O9tMrMzgSbE1567qEAadxoeMTLIRQ/9zLCfySilBnCIZgsi+eQX9kYxMkIfUNuyS0SRhfdIk41n9aO3NgGBRNZBEDept0D36gIhbbyuvxMj4nGgIodrGE2kfjaitjm6awT4w5Kv1GMJPDAzm0ty3ebloDgJsgv5vueeIjQfb5IE0vWWSN6uia4cuP0paMLRJdR00T6Wl8TlybFtbOVIszz2UPnQvL/AkrXQdvFrSiy2YjJXm+QnBOSS8kGuvVun3L2Jl+pq4jZfVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6KqGS/9jDGD5S5GB01ncOxdpbQBMNXMP+sPAqaNJ3I4=;
 b=KJMXh7L91y54Rf75yF72tsepkA8mjftAwMIItnLRu+rKbg8yhdFeUhe9gk5u3m7R6Ruea9TM6IC+azJwAfplfMvUF1vMvUP+ft3YjKVrsnmNXZs3v4fGRJakncKnt/u+agBohBv6XkzU5m1q4NCRmo592m6jjjd6A4h1IXp3hwDhcKgeM0A4hGl6HOYi5DMMKk89A5cverx0ctrQ+YdD/r65AmhPukj0o54aD4uTWX2TxWNNHuiIx5HGU76xm2wRnsl4kqev3MJc7IGypZThGNAz9S28GevE6DFezqXHO1PlTnoe0jUPoWPnmi7Hlz2j0z+Wa2/3wPX4XaReuw3vbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB5312.eurprd08.prod.outlook.com (52.133.247.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Tue, 15 Oct 2019 08:21:44 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::7d25:d1f2:e3eb:868b]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::7d25:d1f2:e3eb:868b%6]) with mapi id 15.20.2347.023; Tue, 15 Oct 2019
 08:21:44 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
Subject: Re: [PATCH v2 1/4] drm/komeda: Add a new helper
 drm_color_ctm_s31_32_to_qm_n()
Thread-Topic: [PATCH v2 1/4] drm/komeda: Add a new helper
 drm_color_ctm_s31_32_to_qm_n()
Thread-Index: AQHVf/bJ+/P3cfPDu0GaOed3595gHKdaUJkAgACbvICAAHbjAA==
Date: Tue, 15 Oct 2019 08:21:44 +0000
Message-ID: <1687889.77CWzybTeB@e123338-lin>
References: <20191011054240.17782-1-james.qian.wang@arm.com>
 <CAKb7Uvik6MZSwCQ4QF7ed1wttfufbR-J4vNdOtYzM+1tqPE_vw@mail.gmail.com>
 <20191015011604.GA26941@jamwan02-TSP300>
In-Reply-To: <20191015011604.GA26941@jamwan02-TSP300>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.49]
x-clientproxiedby: AM4PR0501CA0045.eurprd05.prod.outlook.com
 (2603:10a6:200:68::13) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: b4c8afd0-3ff9-420c-92dd-08d75148bdaf
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: VI1PR08MB5312:|VI1PR08MB5312:|AM6PR08MB4310:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB431024F2F1BEA9AAF4DA1FAC8F930@AM6PR08MB4310.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
x-forefront-prvs: 01917B1794
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(366004)(346002)(396003)(136003)(39860400002)(376002)(189003)(199004)(478600001)(305945005)(81166006)(4326008)(446003)(6636002)(71200400001)(71190400001)(6436002)(256004)(11346002)(8676002)(102836004)(81156014)(5660300002)(476003)(14454004)(66476007)(66946007)(316002)(6246003)(6116002)(486006)(3846002)(86362001)(33716001)(6862004)(66446008)(64756008)(66556008)(66066001)(186003)(26005)(7736002)(6512007)(52116002)(99286004)(54906003)(76176011)(6506007)(53546011)(386003)(2906002)(229853002)(8936002)(6486002)(25786009)(9686003)(39026011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB5312;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: oVIXCaNiKPa916v2vYOXZdXgY+uULCoOefNN8/uTMDCfv2zk4+Sqr6jsmkuqavaFqyUGb929ObjgemdmuCqAh0h+Hf2vlhhrMnOQvP6UON37Ybt3e8zNxY3gPDPG6sxjMnWnH0r1OC6kpyKuxS+q15OAw3vlSlg0mtG2bb/xzbZTNvzKwksl9DL/ZeIanV42xn39+DhQkVU36nCKcsIpXF5xwAUEtXjN4umqHGxQDpNQmLdEVcjjlpQpTefw/1sm3+meZPhbwCaYq6x4BCtTYn2mb6cdEF74+RFtNo5t/OWpXG/BYS/5jHAoTobWE/Ulpa1sueiMRzqsWCauX8Ne4q7CZavbIogWRhhP9NmXIa1JX84W6kgg4vCW3PtyhnNQtHQzCJ/xmVdE9BZTSKJ5GevXcMhYBVgHXlRtW46LEzo=
Content-ID: <512DA533B7A2F848B9F76B640ABD4FA3@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5312
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(396003)(136003)(346002)(39860400002)(376002)(1110001)(339900001)(189003)(199004)(26005)(2906002)(76130400001)(36906005)(6116002)(336012)(6512007)(33716001)(86362001)(66066001)(356004)(316002)(97756001)(8676002)(50466002)(81156014)(81166006)(23726003)(446003)(22756006)(11346002)(3846002)(6246003)(486006)(186003)(126002)(476003)(8936002)(5660300002)(6486002)(9686003)(8746002)(102836004)(47776003)(14454004)(46406003)(478600001)(25786009)(4326008)(53546011)(26826003)(6862004)(54906003)(229853002)(99286004)(6636002)(6506007)(70586007)(386003)(7736002)(305945005)(70206006)(76176011)(39026011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB4310;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Fail; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: da66d652-d6a5-4b35-ad4a-08d75148b6b1
NoDisclaimer: True
X-Forefront-PRVS: 01917B1794
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IsDZRTGFbw1D/nmHRHezywrnyJcX9r9Ircyyev32wLlxmvMV0hp/sSCbmQZWAojtqVcA8DFeQeBED8XvnkpyMGqtTOxY/5z5hEU4TWmhN5jZECh83pv/gHXMd9MygsTqwAr7i/sseoBtgN8FaYhQfQBr+ySRF7S01iDMqdDfAIOUj37xBascMeLAD4X+iASInpJRHa0WbKR26dztBkRJ1SFMaHepz4g2Z4heuYOk1Hj8qJHLTY5jujaAnTzBY9OvX28MZTXjiLyV/fQU3CQfDV3J5OtsPYQHXUL3b7tcIzWdVq0lgbOsTbQnXW8LdtZCg/qk44og0ssp6dZtfEr0sAuj45O3o23I0s//7LVhfPgxf8U+guENqdCv7kNpXPz2FeVzB6tMFwc4PR4O+/dlw/Jf//DeuJaUEP0ZVKy21AE=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2019 08:21:55.7039 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b4c8afd0-3ff9-420c-92dd-08d75148bdaf
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4310
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6KqGS/9jDGD5S5GB01ncOxdpbQBMNXMP+sPAqaNJ3I4=;
 b=Yw85uTVbE6kkldgqklJMK21MQXSSGYyJvasmzaJ6naszuX5JUYBIDj5LusShd0znp4HHMF57djP+KQ4/drhBHP7V3pYy/8yvZJOr0QudP9mme2H8qgpw/0LKg6lFM04L4jsxE4LZ0kMbHZ4pGHx5nawZfCShYDnsYZD73Sx3IZA=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6KqGS/9jDGD5S5GB01ncOxdpbQBMNXMP+sPAqaNJ3I4=;
 b=Yw85uTVbE6kkldgqklJMK21MQXSSGYyJvasmzaJ6naszuX5JUYBIDj5LusShd0znp4HHMF57djP+KQ4/drhBHP7V3pYy/8yvZJOr0QudP9mme2H8qgpw/0LKg6lFM04L4jsxE4LZ0kMbHZ4pGHx5nawZfCShYDnsYZD73Sx3IZA=
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
Cc: nd <nd@arm.com>, Ayan Halder <Ayan.Halder@arm.com>, "Oscar
 Zhang \(Arm Technology China\)" <Oscar.Zhang@arm.com>,
 "Tiannan Zhu \(Arm Technology China\)" <Tiannan.Zhu@arm.com>,
 "airlied@linux.ie" <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>,
 "Channing Chen \(Arm Technology China\)" <Channing.Chen@arm.com>,
 "Yiqi Kang \(Arm Technology China\)" <Yiqi.Kang@arm.com>,
 Ben Davis <Ben.Davis@arm.com>,
 "Thomas Sun \(Arm Technology China\)" <thomas.Sun@arm.com>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>,
 "sean@poorly.run" <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlc2RheSwgMTUgT2N0b2JlciAyMDE5IDAyOjE2OjExIEJTVCBqYW1lcyBxaWFuIHdhbmcg
KEFybSBUZWNobm9sb2d5IENoaW5hKSB3cm90ZToKPiBPbiBNb24sIE9jdCAxNCwgMjAxOSBhdCAx
MTo1ODo0OEFNIC0wNDAwLCBJbGlhIE1pcmtpbiB3cm90ZToKPiA+IE9uIEZyaSwgT2N0IDExLCAy
MDE5IGF0IDE6NDMgQU0gamFtZXMgcWlhbiB3YW5nIChBcm0gVGVjaG5vbG9neSBDaGluYSkKPiA+
IDxqYW1lcy5xaWFuLndhbmdAYXJtLmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IEFkZCBhIG5ldyBo
ZWxwZXIgZnVuY3Rpb24gZHJtX2NvbG9yX2N0bV9zMzFfMzJfdG9fcW1fbigpIGZvciBkcml2ZXIg
dG8KPiA+ID4gY29udmVydCBTMzEuMzIgc2lnbi1tYWduaXR1ZGUgdG8gUW0ubiAyJ3MgY29tcGxl
bWVudCB0aGF0IHN1cHBvcnRlZCBieQo+ID4gPiBoYXJkd2FyZS4KPiA+ID4KPiA+ID4gU2lnbmVk
LW9mZi1ieTogamFtZXMgcWlhbiB3YW5nIChBcm0gVGVjaG5vbG9neSBDaGluYSkgPGphbWVzLnFp
YW4ud2FuZ0Bhcm0uY29tPgo+ID4gPiAtLS0KPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fY29s
b3JfbWdtdC5jIHwgMjMgKysrKysrKysrKysrKysrKysrKysrKysKPiA+ID4gIGluY2x1ZGUvZHJt
L2RybV9jb2xvcl9tZ210LmggICAgIHwgIDIgKysKPiA+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMjUg
aW5zZXJ0aW9ucygrKQo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ry
bV9jb2xvcl9tZ210LmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2NvbG9yX21nbXQuYwo+ID4gPiBp
bmRleCA0Y2U1YzZkOGRlOTkuLjNkNTMzZDBiNDVhZiAxMDA2NDQKPiA+ID4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2RybV9jb2xvcl9tZ210LmMKPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ry
bV9jb2xvcl9tZ210LmMKPiA+ID4gQEAgLTEzMiw2ICsxMzIsMjkgQEAgdWludDMyX3QgZHJtX2Nv
bG9yX2x1dF9leHRyYWN0KHVpbnQzMl90IHVzZXJfaW5wdXQsIHVpbnQzMl90IGJpdF9wcmVjaXNp
b24pCj4gPiA+ICB9Cj4gPiA+ICBFWFBPUlRfU1lNQk9MKGRybV9jb2xvcl9sdXRfZXh0cmFjdCk7
Cj4gPiA+Cj4gPiA+ICsvKioKPiA+ID4gKyAqIGRybV9jb2xvcl9jdG1fczMxXzMyX3RvX3FtX24K
PiA+ID4gKyAqCj4gPiA+ICsgKiBAdXNlcl9pbnB1dDogaW5wdXQgdmFsdWUKPiA+ID4gKyAqIEBt
OiBudW1iZXIgb2YgaW50ZWdlciBiaXRzCj4gPiAKPiA+IElzIHRoaXMgdGhlIGZ1bGwgMidzIGNv
bXBsZW1lbnQgdmFsdWU/IGkuZS4gaW5jbHVkaW5nIHRoZSAic2lnbiIgYml0Cj4gPiBvZiB0aGUg
MidzIGNvbXBsZW1lbnQgcmVwcmVzZW50YXRpb24/IEknZCBraW5kYSBhc3N1bWUgdGhhdCBtID0g
MzIsIG4KPiA+ID0gMCB3b3VsZCBqdXN0IGdldCBtZSB0aGUgaW50ZWdlciBwb3J0aW9uIG9mIHRo
aXMsIGZvciBleGFtcGxlLgo+IAo+IEBtIGRvZXNuJ3QgaW5jbHVkZSAic2lnbi1iaXQiCj4gCj4g
YW5kIGZvciB0aGlzIGNvbnZlcnNpb24gb25seSBzdXBwb3J0IG0gPD0gMzEsIG4gPD0gMzIuCj4g
Cj4gPiA+ICsgKiBAbjogbnVtYmVyIG9mIGZyYWN0aW5hbCBiaXRzCj4gPiAKPiA+IGZyYWN0aW9u
YWwKPiAKPiBUaGFuayB5b3UuCj4gPiAKPiA+ID4gKyAqCj4gPiA+ICsgKiBDb252ZXJ0IGFuZCBj
bGFtcCBTMzEuMzIgc2lnbi1tYWduaXR1ZGUgdG8gUW0ubiAyJ3MgY29tcGxlbWVudC4KPiA+ID4g
KyAqLwo+ID4gPiArdWludDY0X3QgZHJtX2NvbG9yX2N0bV9zMzFfMzJfdG9fcW1fbih1aW50NjRf
dCB1c2VyX2lucHV0LAo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHVpbnQzMl90IG0sIHVpbnQzMl90IG4pCj4gPiA+ICt7Cj4gPiA+ICsgICAgICAgdTY0IG1hZyA9
ICh1c2VyX2lucHV0ICYgfkJJVF9VTEwoNjMpKSA+PiAoMzIgLSBuKTsKPiA+ID4gKyAgICAgICBi
b29sIG5lZ2F0aXZlID0gISEodXNlcl9pbnB1dCAmIEJJVF9VTEwoNjMpKTsKPiA+ID4gKyAgICAg
ICBzNjQgdmFsOwo+ID4gPiArCj4gPiA+ICsgICAgICAgLyogdGhlIHJhbmdlIG9mIHNpZ25lZCAy
cyBjb21wbGVtZW50IGlzIFstMl5uK20sIDJebittIC0gMV0gKi8KPiA+IAo+ID4gVGhpcyBpbXBs
aWVzIHRoYXQgbiA9IDMyLCBtID0gMCB3b3VsZCBhY3R1YWxseSB5aWVsZCBhIDMzLWJpdCAyJ3MK
PiA+IGNvbXBsZW1lbnQgbnVtYmVyLiBJcyB0aGF0IHdoYXQgeW91IG1lYW50Pwo+IAo+IFllcywg
c2luY2UgbSBkb2Vzbid0IGluY2x1ZGUgc2lnbi1iaXQgU28gYSBRMC4zMiBpcyBhIDMzYml0IHZh
bHVlLgo+IAoKSSBnb3R0YSBzYXkgdGhpcyB3b3VsZCBiZSBxdWl0ZSBjb25mdXNpbmcuIFRoZXJl
IGlzIG5vIHNpZ24gYml0IGluIDIncwpjb21wbGVtZW50LCBwZXIgc2UuIFRoZSBNU2JpdCBqdXN0
IGhhcyBhIG5lZ2F0aXZlIHdlaWdodC4gUTE2LjE2IGlzIGEKMzItYml0IHZhbHVlLCBzbyBRMC4z
MiBzaG91bGQgYWxzbyBiZSBhIDMyLWJpdCB2YWx1ZSB3aXRoIHdlaWdodHMKLTJeLTEsICsyXi0y
LCBldGMuCgpCZXN0IHRvIGZvbGxvdyB3aGF0IFdpa2lwZWRpYSBzYXlzLCByaWdodCA6KS4KCj4g
PiAKPiA+ID4gKyAgICAgICB2YWwgPSBjbGFtcF92YWwobWFnLCAwLCBuZWdhdGl2ZSA/IEJJVChu
ICsgbSkgOiBCSVQobiArIG0pIC0gMSk7Cj4gPiAKPiA+IEknbSBnb2luZyB0byBwbGF5IHdpdGgg
bnVtcHkgdG8gY29udmluY2UgbXlzZWxmIHRoYXQgdGhpcyBpcyByaWdodAo+ID4gKGVzcCB3aXRo
IHRoZSBlbmRwb2ludHMpLCBidXQgaW4gdGhlIG1lYW53aGlsZSwgeW91IHByb2JhYmx5IHdhbnQg
dG8KPiA+IHVzZSBCSVRfVUxMIGluIGNhc2UgbiArIG0gPiAzMiAoSSBkb24ndCB0aGluayB0aGF0
J3MgdGhlIGNhc2Ugd2l0aCBhbnkKPiA+IGN1cnJlbnQgaGFyZHdhcmUgdGhvdWdoKS4KPiAKPiBZ
ZXMsIHlvdSBhcmUgcmlnaHQsIEkgbmVlZCB0byB1c2UgQklUX1VMTCwgYW5kIE1paGFpbCBhbHNv
IHBvaW50IHRoaXMgb3V0Lgo+IFRoaXMgaXMgZnVuY3Rpb24gaXMgZHJpdmVkIGZyb20gb3VyIGlu
dGVybmFsIHMzMV8zMl90b19xMl8xNCgpCj4gCj4gPiAKPiA+ID4gKwo+ID4gPiArICAgICAgIHJl
dHVybiBuZWdhdGl2ZSA/IDBsbCAtIHZhbCA6IHZhbDsKPiA+IAo+ID4gV2h5IG5vdCBqdXN0ICJu
ZWdhdGl2ZSA/IC12YWwgOiB2YWwiPwo+IAo+IHdpbGwgY29ycmVjdCBpdC4KPiAKPiA+IAo+ID4g
PiArfQo+ID4gPiArRVhQT1JUX1NZTUJPTChkcm1fY29sb3JfY3RtX3MzMV8zMl90b19xbV9uKTsK
PiA+ID4gKwo+ID4gPiAgLyoqCj4gPiA+ICAgKiBkcm1fY3J0Y19lbmFibGVfY29sb3JfbWdtdCAt
IGVuYWJsZSBjb2xvciBtYW5hZ2VtZW50IHByb3BlcnRpZXMKPiA+ID4gICAqIEBjcnRjOiBEUk0g
Q1JUQwo+ID4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX2NvbG9yX21nbXQuaCBiL2lu
Y2x1ZGUvZHJtL2RybV9jb2xvcl9tZ210LmgKPiA+ID4gaW5kZXggZDFjNjYyZDkyYWI3Li42MGZl
YTU1MDE4ODYgMTAwNjQ0Cj4gPiA+IC0tLSBhL2luY2x1ZGUvZHJtL2RybV9jb2xvcl9tZ210LmgK
PiA+ID4gKysrIGIvaW5jbHVkZS9kcm0vZHJtX2NvbG9yX21nbXQuaAo+ID4gPiBAQCAtMzAsNiAr
MzAsOCBAQCBzdHJ1Y3QgZHJtX2NydGM7Cj4gPiA+ICBzdHJ1Y3QgZHJtX3BsYW5lOwo+ID4gPgo+
ID4gPiAgdWludDMyX3QgZHJtX2NvbG9yX2x1dF9leHRyYWN0KHVpbnQzMl90IHVzZXJfaW5wdXQs
IHVpbnQzMl90IGJpdF9wcmVjaXNpb24pOwo+ID4gPiArdWludDY0X3QgZHJtX2NvbG9yX2N0bV9z
MzFfMzJfdG9fcW1fbih1aW50NjRfdCB1c2VyX2lucHV0LAo+ID4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHVpbnQzMl90IG0sIHVpbnQzMl90IG4pOwo+ID4gPgo+ID4g
PiAgdm9pZCBkcm1fY3J0Y19lbmFibGVfY29sb3JfbWdtdChzdHJ1Y3QgZHJtX2NydGMgKmNydGMs
Cj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdWludCBkZWdhbW1hX2x1dF9z
aXplLAo+ID4gPiAtLQo+ID4gPiAyLjIwLjEKPiA+ID4KPiAKCgotLSAKTWloYWlsCgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
