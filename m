Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34DB1EBE59
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2019 08:15:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09C796F727;
	Fri,  1 Nov 2019 07:14:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10054.outbound.protection.outlook.com [40.107.1.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D53216F727
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2019 07:14:57 +0000 (UTC)
Received: from HE1PR0802CA0009.eurprd08.prod.outlook.com (2603:10a6:3:bd::19)
 by DB6PR0801MB1672.eurprd08.prod.outlook.com (2603:10a6:4:3a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2387.20; Fri, 1 Nov
 2019 07:14:55 +0000
Received: from DB5EUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::207) by HE1PR0802CA0009.outlook.office365.com
 (2603:10a6:3:bd::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2408.17 via Frontend
 Transport; Fri, 1 Nov 2019 07:14:54 +0000
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT021.mail.protection.outlook.com (10.152.20.238) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.20 via Frontend Transport; Fri, 1 Nov 2019 07:14:54 +0000
Received: ("Tessian outbound 851a1162fca7:v33");
 Fri, 01 Nov 2019 07:14:53 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1b0c57a1d05c6cef
X-CR-MTA-TID: 64aa7808
Received: from 1ef925b322fd.2 (cr-mta-lb-1.cr-mta-net [104.47.14.59])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 ED496886-E030-4AC5-BA1F-32BD6D033626.1; 
 Fri, 01 Nov 2019 07:14:48 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2059.outbound.protection.outlook.com [104.47.14.59])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1ef925b322fd.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 01 Nov 2019 07:14:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i9U5OiSaQaTprGn72YmonCgQW+I//htMNQTXh6cJSGqXEQNK223gkjyLFyskQLctMw+z5dHaJ1RzCOdEJ7taALWOeCcTrOabro/vKFW6z2BZSTVlwGAViPcOsHqhdP0yZowq05nNONxfCs3fEyCXbBAkhhVlJzD9niFKgJ76t9AJjAgAluvBQBjOxIcMqhfp5pLsXW9379DwgPf/f/4B6XVTnCuTcNnINx9+gwPBkJfmsD8yaWTS9XgoMcXZ8A3Xip+z8RUAEAzyl2/HWbyAB5D8npzpBD0DEYTKvhd/M9qPhTU3NyUPbuXLkOKVv45rJNprymYeQfpqrSHHhbNnQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D9mg3aQVUXkDo8mZsNdIYAcLjUb0uzG2g5GjzDw7CJQ=;
 b=kdiQdMkL2QIj3g0SPHlgwGVabHu5AFE92mTpDQjCjxP+WDd2JlqqY3qzQJddXV9YUK1eUXb0hexajje++kt4BiN46Mxlyd0/jBNw/UnbaBePHiXN6VQZ92ZYuXraFw8GskqUb8dMO/u8TzJHO+X7/HGYFi/aGgOuwjK1Ccxc8UaDmYWOFjDb1gLCFAtX0zKVX0bhvK1Tp1oAZJu/Bg24E39eor03FzCjoC/XpzpmYgGCxZ0YG6vPiPOF13xTMgpaOqSDWH5Iw1yKNCSyhNt6KW+46rKY29W0tlj/Tx5rSO1xQHMj7u0eiuOqYPCQA4eYGMCtG4KnHuDZkER9w3xZdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4974.eurprd08.prod.outlook.com (10.255.158.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2408.17; Fri, 1 Nov 2019 07:14:37 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a809:417a:faf3:61a7]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a809:417a:faf3:61a7%6]) with mapi id 15.20.2387.030; Fri, 1 Nov 2019
 07:14:37 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Mihail Atanassov <Mihail.Atanassov@arm.com>
Subject: Re: [1/5] drm/komeda: Add debugfs node to control error verbosity
Thread-Topic: [1/5] drm/komeda: Add debugfs node to control error verbosity
Thread-Index: AQHVkIQFrGO7Zbh2NUqSZ/aQ+92y+Q==
Date: Fri, 1 Nov 2019 07:14:37 +0000
Message-ID: <20191101071429.GA29928@jamwan02-TSP300>
References: <20191021164654.9642-2-mihail.atanassov@arm.com>
In-Reply-To: <20191021164654.9642-2-mihail.atanassov@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR02CA0139.apcprd02.prod.outlook.com
 (2603:1096:202:16::23) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: af2bebfc-3a3e-4765-0e20-08d75e9b31f1
X-MS-TrafficTypeDiagnostic: VE1PR08MB4974:|VE1PR08MB4974:|DB6PR0801MB1672:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB6PR0801MB1672363BA0DC79E137C3A45EB3620@DB6PR0801MB1672.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
x-forefront-prvs: 020877E0CB
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(346002)(136003)(39860400002)(396003)(366004)(376002)(199004)(189003)(25786009)(8936002)(6486002)(6246003)(81166006)(229853002)(7736002)(71190400001)(476003)(478600001)(5660300002)(486006)(256004)(8676002)(2906002)(3846002)(71200400001)(305945005)(81156014)(6116002)(64756008)(55236004)(66446008)(102836004)(66066001)(66556008)(86362001)(6506007)(4326008)(186003)(6512007)(66476007)(6436002)(316002)(386003)(6862004)(76176011)(99286004)(26005)(54906003)(14454004)(52116002)(33716001)(9686003)(446003)(11346002)(1076003)(58126008)(6636002)(33656002)(66946007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4974;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: U5y2bMdlAgl1ikUr5igZ/yGKwJFG4fTz5RufrK3Xsg57syHS3O6bpnuKtQw7xoXDQkZEloKA9203GGks7ppQcURUAlGrzaBNA6FOqzK+eq9uqLdLxtajpmMnq2SenHZLZhH5j0WPnET5eS7/eUZFZz8iudXL15UKf8U4ppRcTgzcexE75ZpZnaUAlVppjHL0+pscwZ9ci/6nlu3zFBOTc7v9GGBWB6yOAoRT3SNTdDJ+3upLOC+y6hIbkCvvgGIqtYqL+A51lAf0lDRswDL1uIxzrqq6TrAWzJN/5pZBKUYJimGqN73AVU1YfjYCOOO3wuPlcX8onzwI6N2ngxUsGmWlT8SxmYvHqIAZyvfzw8J35C6nrS+zHvbXSzXswzgn/vYsPmGndyvJMO9upSj9wY5qSQHcpplgzJFmEI3YQjWRX9oU5Se/axF7umY7YJVd
Content-ID: <A84F4C6716ADC846926F4EA01B30D87A@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4974
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(39860400002)(346002)(136003)(396003)(376002)(1110001)(339900001)(189003)(199004)(5660300002)(8676002)(105606002)(81156014)(81166006)(8746002)(46406003)(8936002)(22756006)(33716001)(305945005)(50466002)(1076003)(356004)(7736002)(33656002)(9686003)(58126008)(76130400001)(66066001)(336012)(126002)(26005)(76176011)(316002)(86362001)(6486002)(186003)(47776003)(6862004)(54906003)(2906002)(3846002)(4326008)(6636002)(23726003)(229853002)(25786009)(476003)(446003)(26826003)(14454004)(478600001)(386003)(486006)(70586007)(6506007)(107886003)(11346002)(6116002)(102836004)(97756001)(6246003)(70206006)(99286004)(6512007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB6PR0801MB1672;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Fail; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 446c4ff2-ca15-4ad7-82d7-08d75e9b279a
NoDisclaimer: True
X-Forefront-PRVS: 020877E0CB
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IGVEnil4n6/nl0Fm2VyhE11KGd381dV0Q09o8owecZsZSG3/FAMBzszPeDdoTvnvLFL8poJramkVocdcUFnuSfLuMOjRx5GqJH2EvwHJinNUcj1uWtNUXQQMTuett8EYLQKrdB2WQ/LIx6GAhZ7Gks+ahXkDQE5g8/B/8BlpCzyaNbVIsunQbBBdPS04DuezM4x3GaYLzsYXXbGhFoQTowFubqtLA5OHoSQQYGZUJsxAholZpCrM0BzmOhTZ9zlJlKvznR6Cm3jxKCUbKqwPra9hCsy8rTcMgc8HgEd0bd7WC0PuaLVI54wrvZhpOT/CCQGsoEfn874XAF9ZK64UV9xwUAYWs1Vo0mkk8mGNONdleGbDOM08A88L68pe7xWKY8MfTo45iG6tiQkZaRpI6m1hBGZTYRRUqNSwCwA6ZeIgkM+kAIb4hKx7KLbcXOV9
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2019 07:14:54.6526 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af2bebfc-3a3e-4765-0e20-08d75e9b31f1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1672
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D9mg3aQVUXkDo8mZsNdIYAcLjUb0uzG2g5GjzDw7CJQ=;
 b=3KahQf0qeJxQx7AWu684eZo4BYVkidfX2YayXQBLA25k3nFW9GvnHDVF2hsWXJGgtoAkCCd9lSAZpUY8us11d3vIY8K8Py/c5VpCAbMcJpMRh25t68E8u7QqfuqjvqChB9UfB92LmJkau3XVA33+K8kDnp8+Gpj6vnJo7vYC+A4=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D9mg3aQVUXkDo8mZsNdIYAcLjUb0uzG2g5GjzDw7CJQ=;
 b=3KahQf0qeJxQx7AWu684eZo4BYVkidfX2YayXQBLA25k3nFW9GvnHDVF2hsWXJGgtoAkCCd9lSAZpUY8us11d3vIY8K8Py/c5VpCAbMcJpMRh25t68E8u7QqfuqjvqChB9UfB92LmJkau3XVA33+K8kDnp8+Gpj6vnJo7vYC+A4=
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
Cc: "Lowry Li \(Arm
 Technology China\)" <Lowry.Li@arm.com>, David Airlie <airlied@linux.ie>,
 Liviu Dudau <Liviu.Dudau@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 nd <nd@arm.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBPY3QgMjEsIDIwMTkgYXQgMDQ6NDc6MTRQTSArMDAwMCwgTWloYWlsIEF0YW5hc3Nv
diB3cm90ZToKPiBOYW1lZCAnZXJyX3ZlcmJvc2l0eScsIGN1cnJlbnRseSB3aXRoIG9ubHkgMSBh
Y3RpdmUgYml0IGluIHRoYXQKPiByZXBsaWNhdGVzIHRoZSBleGlzdGluZyBsZXZlbCAtIHByaW50
IGVycm9yIGV2ZW50cyBvbmNlIHBlciBmbGlwLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE1paGFpbCBB
dGFuYXNzb3YgPG1paGFpbC5hdGFuYXNzb3ZAYXJtLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUv
ZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZGV2LmMgICB8ICA0ICsrKysKPiAgZHJpdmVy
cy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZGV2LmggICB8IDE0ICsrKysrKysr
KysrKy0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2V2ZW50
LmMgfCAgOSArKysrKysrLS0KPiAgZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9r
b21lZGFfa21zLmMgICB8ICAyICstCj4gIDQgZmlsZXMgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygr
KSwgNSBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9k
aXNwbGF5L2tvbWVkYS9rb21lZGFfZGV2LmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkv
a29tZWRhL2tvbWVkYV9kZXYuYwo+IGluZGV4IDkzN2E2ZDRjNDg2NS4uODIyMzBjMGRkZWMzIDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rl
di5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZGV2
LmMKPiBAQCAtNTgsNiArNTgsOCBAQCBzdGF0aWMgdm9pZCBrb21lZGFfZGVidWdmc19pbml0KHN0
cnVjdCBrb21lZGFfZGV2ICptZGV2KQo+ICAJbWRldi0+ZGVidWdmc19yb290ID0gZGVidWdmc19j
cmVhdGVfZGlyKCJrb21lZGEiLCBOVUxMKTsKPiAgCWRlYnVnZnNfY3JlYXRlX2ZpbGUoInJlZ2lz
dGVyIiwgMDQ0NCwgbWRldi0+ZGVidWdmc19yb290LAo+ICAJCQkgICAgbWRldiwgJmtvbWVkYV9y
ZWdpc3Rlcl9mb3BzKTsKPiArCWRlYnVnZnNfY3JlYXRlX3gxNigiZXJyX3ZlcmJvc2l0eSIsIDA2
NjQsIG1kZXYtPmRlYnVnZnNfcm9vdCwKPiArCQkJICAgJm1kZXYtPmVycl92ZXJib3NpdHkpOwo+
ICB9Cj4gICNlbmRpZgo+ICAKPiBAQCAtMjgwLDYgKzI4Miw4IEBAIHN0cnVjdCBrb21lZGFfZGV2
ICprb21lZGFfZGV2X2NyZWF0ZShzdHJ1Y3QgZGV2aWNlICpkZXYpCj4gIAkJZ290byBlcnJfY2xl
YW51cDsKPiAgCX0KPiAgCj4gKwltZGV2LT5lcnJfdmVyYm9zaXR5ID0gS09NRURBX0RFVl9QUklO
VF9FUlJfRVZFTlRTOwo+ICsKPiAgI2lmZGVmIENPTkZJR19ERUJVR19GUwo+ICAJa29tZWRhX2Rl
YnVnZnNfaW5pdChtZGV2KTsKPiAgI2VuZGlmCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rldi5oIGIvZHJpdmVycy9ncHUvZHJtL2FybS9k
aXNwbGF5L2tvbWVkYS9rb21lZGFfZGV2LmgKPiBpbmRleCA0MTQyMDAyMzNiNjQuLmI1YmQzZDU4
OThlZSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tv
bWVkYV9kZXYuaAo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29t
ZWRhX2Rldi5oCj4gQEAgLTIwMiw2ICsyMDIsMTQgQEAgc3RydWN0IGtvbWVkYV9kZXYgewo+ICAK
PiAgCS8qKiBAZGVidWdmc19yb290OiByb290IGRpcmVjdG9yeSBvZiBrb21lZGEgZGVidWdmcyAq
Lwo+ICAJc3RydWN0IGRlbnRyeSAqZGVidWdmc19yb290Owo+ICsJLyoqCj4gKwkgKiBAZXJyX3Zl
cmJvc2l0eTogYml0bWFzayBmb3IgaG93IG11Y2ggZXh0cmEgaW5mbyB0byBwcmludCBvbiBlcnJv
cgo+ICsJICoKPiArCSAqIFNlZSBLT01FREFfREVWXyogbWFjcm9zIGZvciBkZXRhaWxzLgo+ICsJ
ICovCj4gKwl1MTYgZXJyX3ZlcmJvc2l0eTsKPiArCS8qIFByaW50IGEgc2luZ2xlIGxpbmUgcGVy
IGVycm9yIHBlciBmcmFtZSB3aXRoIGVycm9yIGV2ZW50cy4gKi8KPiArI2RlZmluZSBLT01FREFf
REVWX1BSSU5UX0VSUl9FVkVOVFMgQklUKDApCj4gIH07Cj4gIAo+ICBzdGF0aWMgaW5saW5lIGJv
b2wKPiBAQCAtMjE5LDkgKzIyNywxMSBAQCB2b2lkIGtvbWVkYV9kZXZfZGVzdHJveShzdHJ1Y3Qg
a29tZWRhX2RldiAqbWRldik7Cj4gIHN0cnVjdCBrb21lZGFfZGV2ICpkZXZfdG9fbWRldihzdHJ1
Y3QgZGV2aWNlICpkZXYpOwo+ICAKPiAgI2lmZGVmIENPTkZJR19EUk1fS09NRURBX0VSUk9SX1BS
SU5UCj4gLXZvaWQga29tZWRhX3ByaW50X2V2ZW50cyhzdHJ1Y3Qga29tZWRhX2V2ZW50cyAqZXZ0
cyk7Cj4gK3ZvaWQga29tZWRhX3ByaW50X2V2ZW50cyhzdHJ1Y3Qga29tZWRhX2V2ZW50cyAqZXZ0
cywgc3RydWN0IGRybV9kZXZpY2UgKmRldik7Cj4gICNlbHNlCj4gLXN0YXRpYyBpbmxpbmUgdm9p
ZCBrb21lZGFfcHJpbnRfZXZlbnRzKHN0cnVjdCBrb21lZGFfZXZlbnRzICpldnRzKSB7fQo+ICtz
dGF0aWMgaW5saW5lIHZvaWQga29tZWRhX3ByaW50X2V2ZW50cyhzdHJ1Y3Qga29tZWRhX2V2ZW50
cyAqZXZ0cywKPiArCQkJCSAgICAgICBzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KQo+ICt7fQo+ICAj
ZW5kaWYKPiAgCj4gIGludCBrb21lZGFfZGV2X3Jlc3VtZShzdHJ1Y3Qga29tZWRhX2RldiAqbWRl
dik7Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29t
ZWRhX2V2ZW50LmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9l
dmVudC5jCj4gaW5kZXggYTM2ZmI4NmNjMDU0Li41NzVlZDRkZjc0ZWQgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZXZlbnQuYwo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2V2ZW50LmMKPiBAQCAt
MTA3LDEwICsxMDcsMTIgQEAgc3RhdGljIGJvb2wgaXNfbmV3X2ZyYW1lKHN0cnVjdCBrb21lZGFf
ZXZlbnRzICphKQo+ICAJICAgICAgIChLT01FREFfRVZFTlRfRkxJUCB8IEtPTUVEQV9FVkVOVF9F
T1cpOwo+ICB9Cj4gIAo+IC12b2lkIGtvbWVkYV9wcmludF9ldmVudHMoc3RydWN0IGtvbWVkYV9l
dmVudHMgKmV2dHMpCj4gK3ZvaWQga29tZWRhX3ByaW50X2V2ZW50cyhzdHJ1Y3Qga29tZWRhX2V2
ZW50cyAqZXZ0cywgc3RydWN0IGRybV9kZXZpY2UgKmRldikKPiAgewo+IC0JdTY0IHByaW50X2V2
dHMgPSBLT01FREFfRVJSX0VWRU5UUzsKPiArCXU2NCBwcmludF9ldnRzID0gMDsKPiAgCXN0YXRp
YyBib29sIGVuX3ByaW50ID0gdHJ1ZTsKPiArCXN0cnVjdCBrb21lZGFfZGV2ICptZGV2ID0gZGV2
LT5kZXZfcHJpdmF0ZTsKPiArCXUxNiBjb25zdCBlcnJfdmVyYm9zaXR5ID0gbWRldi0+ZXJyX3Zl
cmJvc2l0eTsKPiAgCj4gIAkvKiByZWR1Y2UgdGhlIHNhbWUgbXNnIHByaW50LCBvbmx5IHByaW50
IHRoZSBmaXJzdCBldnQgZm9yIG9uZSBmcmFtZSAqLwo+ICAJaWYgKGV2dHMtPmdsb2JhbCB8fCBp
c19uZXdfZnJhbWUoZXZ0cykpCj4gQEAgLTExOCw2ICsxMjAsOSBAQCB2b2lkIGtvbWVkYV9wcmlu
dF9ldmVudHMoc3RydWN0IGtvbWVkYV9ldmVudHMgKmV2dHMpCj4gIAlpZiAoIWVuX3ByaW50KQo+
ICAJCXJldHVybjsKPiAgCj4gKwlpZiAoZXJyX3ZlcmJvc2l0eSAmIEtPTUVEQV9ERVZfUFJJTlRf
RVJSX0VWRU5UUykKPiArCQlwcmludF9ldnRzIHw9IEtPTUVEQV9FUlJfRVZFTlRTOwo+ICsKPiAg
CWlmICgoZXZ0cy0+Z2xvYmFsIHwgZXZ0cy0+cGlwZXNbMF0gfCBldnRzLT5waXBlc1sxXSkgJiBw
cmludF9ldnRzKSB7Cj4gIAkJY2hhciBtc2dbMjU2XTsKPiAgCQlzdHJ1Y3Qga29tZWRhX3N0ciBz
dHI7Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29t
ZWRhX2ttcy5jIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfa21z
LmMKPiBpbmRleCBkNDk3NzJkZTkzZTAuLmUzMGE1YjQzY2FhOSAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9rbXMuYwo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ttcy5jCj4gQEAgLTQ4LDcgKzQ4
LDcgQEAgc3RhdGljIGlycXJldHVybl90IGtvbWVkYV9rbXNfaXJxX2hhbmRsZXIoaW50IGlycSwg
dm9pZCAqZGF0YSkKPiAgCW1lbXNldCgmZXZ0cywgMCwgc2l6ZW9mKGV2dHMpKTsKPiAgCXN0YXR1
cyA9IG1kZXYtPmZ1bmNzLT5pcnFfaGFuZGxlcihtZGV2LCAmZXZ0cyk7Cj4gIAo+IC0Ja29tZWRh
X3ByaW50X2V2ZW50cygmZXZ0cyk7Cj4gKwlrb21lZGFfcHJpbnRfZXZlbnRzKCZldnRzLCBkcm0p
Owo+ICAKPiAgCS8qIE5vdGlmeSB0aGUgY3J0YyB0byBoYW5kbGUgdGhlIGV2ZW50cyAqLwo+ICAJ
Zm9yIChpID0gMDsgaSA8IGttcy0+bl9jcnRjczsgaSsrKQoKdGhhbmsgeW91IGZvciB0aGUgcGF0
Y2gsIGxvb2tzIGdvb2QgdG8gbWUuCgpCVFc6IGZvciB5b3UgcXVlc3Rpb246IAogfCBUaGVzZSBw
YXRjaGVzIGFyZSBvdmVyYWxsIHF1aXRlIHRpbnksIGFuZCBJIHdhcyBjb25zaWRlcmluZyBqdXN0
CiB8IHNxdWFzaGluZyB0aGVtIGludG8gb25lLCBidXQgSSBvcHRlZCB0byBrZWVwIHRoZW0gc2Vw
YXJhdGUgZm9yIGFuIGVhc2llcgogfCByZXZpZXcgZXhwZXJpZW5jZTsgcGxlYXNlIGxldCBtZSBr
bm93IHdoZXRoZXIgeW91IHByZWZlciBhIHNpbmdsZSBwYXRjaC4KCkkgbGlrZSB0aGUgY3VycmVu
dCBzaW5nbGUgcGF0Y2guIDopCgpSZXZpZXdlZC1ieTogSmFtZXMgUWlhbiBXYW5nIChBcm0gVGVj
aG5vbG9neSBDaGluYSkgPGphbWVzLnFpYW4ud2FuZ0Bhcm0uY29tPgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
