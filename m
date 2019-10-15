Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03610D6CC1
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 03:16:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46B0E6E1A2;
	Tue, 15 Oct 2019 01:16:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140082.outbound.protection.outlook.com [40.107.14.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 720E86E1A2
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 01:16:38 +0000 (UTC)
Received: from VI1PR0802CA0041.eurprd08.prod.outlook.com
 (2603:10a6:800:a9::27) by AM6PR08MB4216.eurprd08.prod.outlook.com
 (2603:10a6:20b:89::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16; Tue, 15 Oct
 2019 01:16:34 +0000
Received: from DB5EUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::207) by VI1PR0802CA0041.outlook.office365.com
 (2603:10a6:800:a9::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.16 via Frontend
 Transport; Tue, 15 Oct 2019 01:16:34 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT044.mail.protection.outlook.com (10.152.21.167) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Tue, 15 Oct 2019 01:16:32 +0000
Received: ("Tessian outbound 927f2cdd66cc:v33");
 Tue, 15 Oct 2019 01:16:24 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1c16bbc12033a55d
X-CR-MTA-TID: 64aa7808
Received: from 1b59f97714ad.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.0.59]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8FCCB7DF-5D7D-4AEE-B0A0-94F043E94065.1; 
 Tue, 15 Oct 2019 01:16:19 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2059.outbound.protection.outlook.com [104.47.0.59])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1b59f97714ad.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 15 Oct 2019 01:16:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eX9NDE/slbm96WQM+X9Qi7fb4I4HbO1yCoCozSSObbSOvGiBP6t8N8yweqm+oo2POJgCNwtAbgWjdifP8OWYvPSnfeZM1m6PBPeUzt9WOLIBb6fBdn6rp6YhueXxtqG5EPInvR8xyG7R/u6mVkKGEJ5p1MGEwIAvi4ys+yqQSYjsV9hEcjpBO1UpRJNpk/bwfUf1PmUpM0uSouxNEQS4gAIKruSXZEZrghpXdi7TuQVKlq7YY26eRyHuVrfIMJeEcsmDbUold2IXHskASuZZ0HQUQaKFb7K81mG0uNhEHCPoN8nZctaYIC0mWHDxdicfhCsfvooxD2iC0TpZ8e+ynA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R64baFQcQ838p4yaTEUcAZXBkZ2XgADSSSx7UGhjfUw=;
 b=C5HqXGTutoKZxeFTOBX7mFrv51PXn60ySOUNDHo4ykw3petMnJ4YDLmMvj3xfbLwr/fXhWdOjPLvj4pwC3l/8WqLfGHvNr36eiOj+9rr50ZDlTnlHj8FDKR/g/+ftFAAFFMnLf2qtLHui8Lpuk/uPU1miDV44rSlE9tHN6+cRbma58HuS6Df4dW1BdvY+tTRIYmXbOKbmBtqJRNZXz8gY/q/ORcFXBTy2lqlRxByE0W8dsFh3QYMmQmFHxQnDsPlafPBUmW1kYNfOOOL60ouZ4QTsUMHOeKS7VxTUfqQuE0GgzreRf7bVMQeY88FuE6QoM5ieyQDA3QnZq7tay//4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB5069.eurprd08.prod.outlook.com (20.179.29.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Tue, 15 Oct 2019 01:16:12 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5%3]) with mapi id 15.20.2347.023; Tue, 15 Oct 2019
 01:16:12 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: Re: [PATCH v2 1/4] drm/komeda: Add a new helper
 drm_color_ctm_s31_32_to_qm_n()
Thread-Topic: [PATCH v2 1/4] drm/komeda: Add a new helper
 drm_color_ctm_s31_32_to_qm_n()
Thread-Index: AQHVf/bDNAzoDxuLVU+by7UkFix6lKdaUJkAgACbswA=
Date: Tue, 15 Oct 2019 01:16:11 +0000
Message-ID: <20191015011604.GA26941@jamwan02-TSP300>
References: <20191011054240.17782-1-james.qian.wang@arm.com>
 <20191011054240.17782-2-james.qian.wang@arm.com>
 <CAKb7Uvik6MZSwCQ4QF7ed1wttfufbR-J4vNdOtYzM+1tqPE_vw@mail.gmail.com>
In-Reply-To: <CAKb7Uvik6MZSwCQ4QF7ed1wttfufbR-J4vNdOtYzM+1tqPE_vw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0P153CA0018.APCP153.PROD.OUTLOOK.COM
 (2603:1096:203:18::30) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 4162c131-8a78-40b9-b02f-08d7510d50ef
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: VE1PR08MB5069:|VE1PR08MB5069:|AM6PR08MB4216:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4216B85F067AE3D6EEEBF769B3930@AM6PR08MB4216.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:8273;
x-forefront-prvs: 01917B1794
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(376002)(39860400002)(366004)(396003)(346002)(136003)(199004)(189003)(99286004)(5660300002)(2171002)(229853002)(256004)(33716001)(25786009)(6916009)(66946007)(66476007)(66556008)(64756008)(66446008)(6116002)(3846002)(6436002)(6512007)(9686003)(102836004)(476003)(6246003)(7736002)(316002)(86362001)(14454004)(478600001)(2906002)(81156014)(66066001)(446003)(26005)(6486002)(58126008)(8936002)(1076003)(386003)(6506007)(76176011)(33656002)(53546011)(305945005)(486006)(81166006)(11346002)(71200400001)(71190400001)(186003)(8676002)(52116002)(54906003)(4326008)(55236004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB5069;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: QLbnvuZPKzcbrV05OChcKT8XMrC2pLX044HjtKDzDxK2k7ALlmuzyvpiYG2MI0NlSag7saTt4kYyAmjnekJyEmUvmh26WkkwUfk4DEYpzVeHvomwC7N4VzJQgQgZfMxIsjnvdeSsn4ZhU8Wp7eWyPildLRzzQzF+4AvLzTD8kKWHpcOArK653yhA6K+fwVVjD1/Viq4Pg2w5heYNKCcgQR9uTyYXarSFu3mUb/lx9SiR6tP6RLlnMJFGlW05qxHRUz4S1zCwbWPBtNg7AEiHjyaHK9OWFoBqiqwsIFLYqqSkbaqkYRvVe5n35Su+rWZyECN4VyafSrb7WTM1IkL1lDl8PP0mgS9M5a/hZlh6dulpALI6fCw1yuDRNnywtsXH8aIdSGv/E+b6Wmn/fisfxECYIKVpdvB6uL7Cx444YdQ=
Content-ID: <95A824C58CB2A045A31C89F1918849E5@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5069
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(396003)(136003)(346002)(39860400002)(376002)(189003)(199004)(356004)(6246003)(2171002)(76130400001)(5660300002)(4326008)(7736002)(26826003)(478600001)(25786009)(1076003)(6862004)(186003)(97756001)(23726003)(6116002)(26005)(70206006)(2906002)(70586007)(229853002)(102836004)(6506007)(8676002)(3846002)(53546011)(81156014)(81166006)(99286004)(8746002)(8936002)(386003)(76176011)(58126008)(50466002)(14454004)(86362001)(316002)(6512007)(446003)(47776003)(9686003)(63350400001)(336012)(305945005)(66066001)(486006)(11346002)(476003)(46406003)(22756006)(33716001)(33656002)(54906003)(6486002)(126002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB4216;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 6497e44f-f088-4063-d62e-08d7510d4421
NoDisclaimer: True
X-Forefront-PRVS: 01917B1794
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TUq5EWMeZqBfXRou/Qz8V/Utfw4QtulstPLuJkpIKWjAIJ8kaOkKyB9ilrsvxK/RWqyr0od2X8W6ZW+72Tcwj9CPl8xTNnzpyKRceS5xzAPJIzw2MzfEQNsOVQU+8YCppnxLk8LlWmF8E3hYTzmLn6DpM8BdJSsW5/ixNaZ7xIF8uDLyVuQKC/ZW2ERZov1PUwbiOiNgaBi82uHwliQCZ9H1b8lYZyzBQ4pQU4d56xeNr3S2UdIubKhaPzq7ZIxuo466fICCddAp3t5A14HX6iOiwKsBvRgI5qM74gfll1NxDLD+rpwBqzUorbr04glmcToE9LDPQCKX5kylOM3pE9IHbKOB4VqampRiMGqnOp8xs6hl2JMpN6l9fy46u+XI0imBdLkiycyHmhS1TfyLMBr4udm/MS1IS051sVRRjsM=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2019 01:16:32.9974 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4162c131-8a78-40b9-b02f-08d7510d50ef
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4216
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R64baFQcQ838p4yaTEUcAZXBkZ2XgADSSSx7UGhjfUw=;
 b=hs0qhMpsazSu4gHZDWUDDIawXyC0MYTHHCw9Gndj7xLN+PYMrVYIeYErklrA2OsFSEptBYOKT/pho7VyHPXlSCmbOI3oxJEK1xnx7RKf7g3lOIvKlUYoNeQEHqJcxJaaHULpvd6aZ1vHUHvRpgDjGhGj1LRQAVVUeBXoN7iEglQ=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R64baFQcQ838p4yaTEUcAZXBkZ2XgADSSSx7UGhjfUw=;
 b=hs0qhMpsazSu4gHZDWUDDIawXyC0MYTHHCw9Gndj7xLN+PYMrVYIeYErklrA2OsFSEptBYOKT/pho7VyHPXlSCmbOI3oxJEK1xnx7RKf7g3lOIvKlUYoNeQEHqJcxJaaHULpvd6aZ1vHUHvRpgDjGhGj1LRQAVVUeBXoN7iEglQ=
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
Cc: nd <nd@arm.com>, Ayan Halder <Ayan.Halder@arm.com>, "Oscar
 Zhang \(Arm Technology China\)" <Oscar.Zhang@arm.com>, "Tiannan Zhu \(Arm
 Technology China\)" <Tiannan.Zhu@arm.com>,
 Mihail Atanassov <Mihail.Atanassov@arm.com>,
 "airlied@linux.ie" <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin
 \(Arm Technology China\)" <Julien.Yin@arm.com>, "Channing Chen \(Arm
 Technology China\)" <Channing.Chen@arm.com>,
 "Yiqi Kang \(Arm Technology China\)" <Yiqi.Kang@arm.com>,
 "Thomas Sun \(Arm Technology China\)" <thomas.Sun@arm.com>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>,
 "sean@poorly.run" <sean@poorly.run>, Ben Davis <Ben.Davis@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBPY3QgMTQsIDIwMTkgYXQgMTE6NTg6NDhBTSAtMDQwMCwgSWxpYSBNaXJraW4gd3Jv
dGU6Cj4gT24gRnJpLCBPY3QgMTEsIDIwMTkgYXQgMTo0MyBBTSBqYW1lcyBxaWFuIHdhbmcgKEFy
bSBUZWNobm9sb2d5IENoaW5hKQo+IDxqYW1lcy5xaWFuLndhbmdAYXJtLmNvbT4gd3JvdGU6Cj4g
Pgo+ID4gQWRkIGEgbmV3IGhlbHBlciBmdW5jdGlvbiBkcm1fY29sb3JfY3RtX3MzMV8zMl90b19x
bV9uKCkgZm9yIGRyaXZlciB0bwo+ID4gY29udmVydCBTMzEuMzIgc2lnbi1tYWduaXR1ZGUgdG8g
UW0ubiAyJ3MgY29tcGxlbWVudCB0aGF0IHN1cHBvcnRlZCBieQo+ID4gaGFyZHdhcmUuCj4gPgo+
ID4gU2lnbmVkLW9mZi1ieTogamFtZXMgcWlhbiB3YW5nIChBcm0gVGVjaG5vbG9neSBDaGluYSkg
PGphbWVzLnFpYW4ud2FuZ0Bhcm0uY29tPgo+ID4gLS0tCj4gPiAgZHJpdmVycy9ncHUvZHJtL2Ry
bV9jb2xvcl9tZ210LmMgfCAyMyArKysrKysrKysrKysrKysrKysrKysrKwo+ID4gIGluY2x1ZGUv
ZHJtL2RybV9jb2xvcl9tZ210LmggICAgIHwgIDIgKysKPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDI1
IGluc2VydGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9j
b2xvcl9tZ210LmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2NvbG9yX21nbXQuYwo+ID4gaW5kZXgg
NGNlNWM2ZDhkZTk5Li4zZDUzM2QwYjQ1YWYgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vZHJtX2NvbG9yX21nbXQuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9jb2xvcl9t
Z210LmMKPiA+IEBAIC0xMzIsNiArMTMyLDI5IEBAIHVpbnQzMl90IGRybV9jb2xvcl9sdXRfZXh0
cmFjdCh1aW50MzJfdCB1c2VyX2lucHV0LCB1aW50MzJfdCBiaXRfcHJlY2lzaW9uKQo+ID4gIH0K
PiA+ICBFWFBPUlRfU1lNQk9MKGRybV9jb2xvcl9sdXRfZXh0cmFjdCk7Cj4gPgo+ID4gKy8qKgo+
ID4gKyAqIGRybV9jb2xvcl9jdG1fczMxXzMyX3RvX3FtX24KPiA+ICsgKgo+ID4gKyAqIEB1c2Vy
X2lucHV0OiBpbnB1dCB2YWx1ZQo+ID4gKyAqIEBtOiBudW1iZXIgb2YgaW50ZWdlciBiaXRzCj4g
Cj4gSXMgdGhpcyB0aGUgZnVsbCAyJ3MgY29tcGxlbWVudCB2YWx1ZT8gaS5lLiBpbmNsdWRpbmcg
dGhlICJzaWduIiBiaXQKPiBvZiB0aGUgMidzIGNvbXBsZW1lbnQgcmVwcmVzZW50YXRpb24/IEkn
ZCBraW5kYSBhc3N1bWUgdGhhdCBtID0gMzIsIG4KPiA9IDAgd291bGQganVzdCBnZXQgbWUgdGhl
IGludGVnZXIgcG9ydGlvbiBvZiB0aGlzLCBmb3IgZXhhbXBsZS4KCkBtIGRvZXNuJ3QgaW5jbHVk
ZSAic2lnbi1iaXQiCgphbmQgZm9yIHRoaXMgY29udmVyc2lvbiBvbmx5IHN1cHBvcnQgbSA8PSAz
MSwgbiA8PSAzMi4KCj4gPiArICogQG46IG51bWJlciBvZiBmcmFjdGluYWwgYml0cwo+IAo+IGZy
YWN0aW9uYWwKClRoYW5rIHlvdS4KPiAKPiA+ICsgKgo+ID4gKyAqIENvbnZlcnQgYW5kIGNsYW1w
IFMzMS4zMiBzaWduLW1hZ25pdHVkZSB0byBRbS5uIDIncyBjb21wbGVtZW50Lgo+ID4gKyAqLwo+
ID4gK3VpbnQ2NF90IGRybV9jb2xvcl9jdG1fczMxXzMyX3RvX3FtX24odWludDY0X3QgdXNlcl9p
bnB1dCwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdWludDMyX3Qg
bSwgdWludDMyX3QgbikKPiA+ICt7Cj4gPiArICAgICAgIHU2NCBtYWcgPSAodXNlcl9pbnB1dCAm
IH5CSVRfVUxMKDYzKSkgPj4gKDMyIC0gbik7Cj4gPiArICAgICAgIGJvb2wgbmVnYXRpdmUgPSAh
ISh1c2VyX2lucHV0ICYgQklUX1VMTCg2MykpOwo+ID4gKyAgICAgICBzNjQgdmFsOwo+ID4gKwo+
ID4gKyAgICAgICAvKiB0aGUgcmFuZ2Ugb2Ygc2lnbmVkIDJzIGNvbXBsZW1lbnQgaXMgWy0yXm4r
bSwgMl5uK20gLSAxXSAqLwo+IAo+IFRoaXMgaW1wbGllcyB0aGF0IG4gPSAzMiwgbSA9IDAgd291
bGQgYWN0dWFsbHkgeWllbGQgYSAzMy1iaXQgMidzCj4gY29tcGxlbWVudCBudW1iZXIuIElzIHRo
YXQgd2hhdCB5b3UgbWVhbnQ/CgpZZXMsIHNpbmNlIG0gZG9lc24ndCBpbmNsdWRlIHNpZ24tYml0
IFNvIGEgUTAuMzIgaXMgYSAzM2JpdCB2YWx1ZS4KCj4gCj4gPiArICAgICAgIHZhbCA9IGNsYW1w
X3ZhbChtYWcsIDAsIG5lZ2F0aXZlID8gQklUKG4gKyBtKSA6IEJJVChuICsgbSkgLSAxKTsKPiAK
PiBJJ20gZ29pbmcgdG8gcGxheSB3aXRoIG51bXB5IHRvIGNvbnZpbmNlIG15c2VsZiB0aGF0IHRo
aXMgaXMgcmlnaHQKPiAoZXNwIHdpdGggdGhlIGVuZHBvaW50cyksIGJ1dCBpbiB0aGUgbWVhbndo
aWxlLCB5b3UgcHJvYmFibHkgd2FudCB0bwo+IHVzZSBCSVRfVUxMIGluIGNhc2UgbiArIG0gPiAz
MiAoSSBkb24ndCB0aGluayB0aGF0J3MgdGhlIGNhc2Ugd2l0aCBhbnkKPiBjdXJyZW50IGhhcmR3
YXJlIHRob3VnaCkuCgpZZXMsIHlvdSBhcmUgcmlnaHQsIEkgbmVlZCB0byB1c2UgQklUX1VMTCwg
YW5kIE1paGFpbCBhbHNvIHBvaW50IHRoaXMgb3V0LgpUaGlzIGlzIGZ1bmN0aW9uIGlzIGRyaXZl
ZCBmcm9tIG91ciBpbnRlcm5hbCBzMzFfMzJfdG9fcTJfMTQoKQoKPiAKPiA+ICsKPiA+ICsgICAg
ICAgcmV0dXJuIG5lZ2F0aXZlID8gMGxsIC0gdmFsIDogdmFsOwo+IAo+IFdoeSBub3QganVzdCAi
bmVnYXRpdmUgPyAtdmFsIDogdmFsIj8KCndpbGwgY29ycmVjdCBpdC4KCj4gCj4gPiArfQo+ID4g
K0VYUE9SVF9TWU1CT0woZHJtX2NvbG9yX2N0bV9zMzFfMzJfdG9fcW1fbik7Cj4gPiArCj4gPiAg
LyoqCj4gPiAgICogZHJtX2NydGNfZW5hYmxlX2NvbG9yX21nbXQgLSBlbmFibGUgY29sb3IgbWFu
YWdlbWVudCBwcm9wZXJ0aWVzCj4gPiAgICogQGNydGM6IERSTSBDUlRDCj4gPiBkaWZmIC0tZ2l0
IGEvaW5jbHVkZS9kcm0vZHJtX2NvbG9yX21nbXQuaCBiL2luY2x1ZGUvZHJtL2RybV9jb2xvcl9t
Z210LmgKPiA+IGluZGV4IGQxYzY2MmQ5MmFiNy4uNjBmZWE1NTAxODg2IDEwMDY0NAo+ID4gLS0t
IGEvaW5jbHVkZS9kcm0vZHJtX2NvbG9yX21nbXQuaAo+ID4gKysrIGIvaW5jbHVkZS9kcm0vZHJt
X2NvbG9yX21nbXQuaAo+ID4gQEAgLTMwLDYgKzMwLDggQEAgc3RydWN0IGRybV9jcnRjOwo+ID4g
IHN0cnVjdCBkcm1fcGxhbmU7Cj4gPgo+ID4gIHVpbnQzMl90IGRybV9jb2xvcl9sdXRfZXh0cmFj
dCh1aW50MzJfdCB1c2VyX2lucHV0LCB1aW50MzJfdCBiaXRfcHJlY2lzaW9uKTsKPiA+ICt1aW50
NjRfdCBkcm1fY29sb3JfY3RtX3MzMV8zMl90b19xbV9uKHVpbnQ2NF90IHVzZXJfaW5wdXQsCj4g
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQzMl90IG0sIHVpbnQz
Ml90IG4pOwo+ID4KPiA+ICB2b2lkIGRybV9jcnRjX2VuYWJsZV9jb2xvcl9tZ210KHN0cnVjdCBk
cm1fY3J0YyAqY3J0YywKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdWludCBk
ZWdhbW1hX2x1dF9zaXplLAo+ID4gLS0KPiA+IDIuMjAuMQo+ID4KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
