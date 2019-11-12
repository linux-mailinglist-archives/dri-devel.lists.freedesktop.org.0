Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8C7F8DA7
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 12:10:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A8D06EB10;
	Tue, 12 Nov 2019 11:10:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20057.outbound.protection.outlook.com [40.107.2.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBC8F6EB10
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 11:10:22 +0000 (UTC)
Received: from VI1PR0802CA0016.eurprd08.prod.outlook.com
 (2603:10a6:800:aa::26) by AM5PR0802MB2436.eurprd08.prod.outlook.com
 (2603:10a6:203:a1::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2430.22; Tue, 12 Nov
 2019 11:10:19 +0000
Received: from VE1EUR03FT059.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::203) by VI1PR0802CA0016.outlook.office365.com
 (2603:10a6:800:aa::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.22 via Frontend
 Transport; Tue, 12 Nov 2019 11:10:19 +0000
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT059.mail.protection.outlook.com (10.152.19.60) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.21 via Frontend Transport; Tue, 12 Nov 2019 11:10:19 +0000
Received: ("Tessian outbound 927f2cdd66cc:v33");
 Tue, 12 Nov 2019 11:10:16 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f0f9c5476530ba08
X-CR-MTA-TID: 64aa7808
Received: from d79f0f428efc.2 (cr-mta-lb-1.cr-mta-net [104.47.4.51])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4F2DC11C-75F8-4723-8DD8-4A6F944CC0E3.1; 
 Tue, 12 Nov 2019 11:10:11 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2051.outbound.protection.outlook.com [104.47.4.51])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d79f0f428efc.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 12 Nov 2019 11:10:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DHjqLln0srUgmvvp53WCZtvy0+C+NEgo86+CRTkbO6SddJrN82kKdyeAodoNg9u74MN0Pav0oeRH/T5DCihbJdneW4ylmZtrlfOuBbkTSgOk4YqFvMenVaXQn4DAVAECdCdSE5D6mbDivmUHLKbG0J5Zw/b3JP8UaWPx/2RWC4H2B3IA1EJ75j95SEBZnchlpz0YSqTtx1ZIQWsodMlDQTUrNZOKJrCPAS+Fuvmwml8YstBpUt9w89I2ui4Dk8l6DXNkeU9/9J5fU1kF52ARjfJ1ZXUaBcWtBe+4Pg1wT1do1sTirS8YF7uFBofAgM71CBlAcpQyhkl/ifQeTODDTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dwl4JXh3gudDNqqnWSO4qmhHyZFD7hivyUxQxR0plGY=;
 b=PtBi0Mq6vG6CnKvSibborgddR4FZG41OJD+8tSNo/KH0NFP4EqzjfSgKUZRiqOfds/ETin62ySFFa60clBeCnmtrJ0ONYFirq1bp/JTcb9Y9XeCn9Ho+arLr1JDI5/c08p9HlfYiNQ8EyyetWG5r1vDYqSHDRIN4o13x1aWvQv8+FWvwGzw6jeQmi4sN0RL3bTxsGmxd5ccwKIkhDlwAEztuyj4YcCzXqfBU814aMuBQjSYY76KH5lJIdIFo7qRfapp/uTkfQvo6ZvxZsMysz0srlU5LGqC8H938uFVpPb9DfJatzG9/JzAT4+c58t3wMs7WkqRGy2Ev3M7YXPQq5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from AM0PR08MB4995.eurprd08.prod.outlook.com (10.255.30.207) by
 AM0PR08MB3636.eurprd08.prod.outlook.com (20.177.43.89) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.20; Tue, 12 Nov 2019 11:10:10 +0000
Received: from AM0PR08MB4995.eurprd08.prod.outlook.com
 ([fe80::3c0c:3112:ccbf:13d0]) by AM0PR08MB4995.eurprd08.prod.outlook.com
 ([fe80::3c0c:3112:ccbf:13d0%6]) with mapi id 15.20.2430.027; Tue, 12 Nov 2019
 11:10:09 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "airlied@linux.ie" <airlied@linux.ie>, 
 Brian Starkey <Brian.Starkey@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "sean@poorly.run" <sean@poorly.run>, 
 Mihail Atanassov <Mihail.Atanassov@arm.com>, "imirkin@alum.mit.edu"
 <imirkin@alum.mit.edu>
Subject: [PATCH v10 2/4] drm/komeda: Add drm_lut_to_fgamma_coeffs()
Thread-Topic: [PATCH v10 2/4] drm/komeda: Add drm_lut_to_fgamma_coeffs()
Thread-Index: AQHVmUm+oipHNsw4FUeM3rml3PnnBg==
Date: Tue, 12 Nov 2019 11:10:09 +0000
Message-ID: <20191112110927.20931-3-james.qian.wang@arm.com>
References: <20191112110927.20931-1-james.qian.wang@arm.com>
In-Reply-To: <20191112110927.20931-1-james.qian.wang@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0PR03CA0106.apcprd03.prod.outlook.com
 (2603:1096:203:b0::22) To AM0PR08MB4995.eurprd08.prod.outlook.com
 (2603:10a6:208:162::15)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9e505c51-a944-4cac-993b-08d76760e785
X-MS-TrafficTypeDiagnostic: AM0PR08MB3636:|AM0PR08MB3636:|AM5PR0802MB2436:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0802MB2436CCB266D955D1189EB573B3770@AM5PR0802MB2436.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:2043;OLM:2043;
x-forefront-prvs: 021975AE46
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(396003)(39860400002)(376002)(366004)(199004)(189003)(2906002)(99286004)(446003)(2616005)(476003)(7736002)(66066001)(6512007)(6436002)(6486002)(11346002)(54906003)(256004)(305945005)(103116003)(14444005)(110136005)(316002)(2201001)(14454004)(6116002)(2501003)(86362001)(3846002)(486006)(71200400001)(71190400001)(186003)(386003)(36756003)(1076003)(6506007)(5660300002)(81166006)(8676002)(4326008)(50226002)(26005)(76176011)(66946007)(2171002)(52116002)(81156014)(66446008)(102836004)(66476007)(64756008)(8936002)(66556008)(25786009)(55236004)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB3636;
 H:AM0PR08MB4995.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: efgPPhW1sIC+T2J3ud2UUGeRox9h2yMuqqqjAoHAwkPC0VELuJamMjU2TdOt2LM+MTxvtZo0wW8xi4NJAGepDA3vNNstuLhaXM5bm9zrgHLIO2Lm6paZhaYgdnLk1p+Kx0GGYI5nJ7em6Uy49sXmjGZ6cKYpmbgs4mLC+uBwZ+267ogL0eT0/WAwEBzGekuefn3eLiy7qIA8wDT5kTk+yUw/Kx+tkGKcyexLeyr1wFFcRMbKuyxnkrauroBPqQ2Q8uKwdHZS1r1z6e3HuQKWJ/i3DVeOJMw960pghVJ+n/giDek4WRjvd2YT99mV/7eTxDvtH4H28Y3edT9TjYIKpaQ22IiledFJ73aVG3o9oz3v8Yh10bXEVOQmZPpAan8caghZrp6datxVXlWDaC00gApCY2mSkO19s/DJTNdRHy5Hv0LfH2tr3gwjcda/C67p
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3636
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(39860400002)(136003)(376002)(1110001)(339900001)(199004)(189003)(6512007)(76176011)(446003)(11346002)(26005)(336012)(2906002)(66066001)(356004)(76130400001)(186003)(102836004)(50466002)(22756006)(476003)(486006)(386003)(6506007)(2171002)(2201001)(3846002)(103116003)(4326008)(126002)(99286004)(6116002)(14454004)(478600001)(2501003)(47776003)(86362001)(2616005)(26826003)(70586007)(105606002)(305945005)(23756003)(316002)(8936002)(36906005)(8676002)(8746002)(7736002)(36756003)(54906003)(1076003)(50226002)(5660300002)(110136005)(6486002)(14444005)(70206006)(81156014)(81166006)(25786009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR0802MB2436;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Fail; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: e693d14d-60ac-493b-320b-08d76760e14e
NoDisclaimer: True
X-Forefront-PRVS: 021975AE46
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: INocy86hmmRMDToQADivMg6OdlgpMcx4fppWshJTpudTeBcEdxkhuO7p2pL114GSDxPH7Xy57XfIkCy7DoJHDRNpzztw6b0R5vpSZB4KgJofNHS8oegcI+g3IAAOoMYXMlIwdUDFYTwyH+prEreCDlDGyAg5/aWhUzvRCM5JbIyh1xXcBPy3cB1vcD20jdRwl0DUuZwx32xaEJmJn3R12ftrs1R6OZnBhB05Y+uJcE/gZGT7bwiMzXBYsR+theyFZ2H0c4CHnBJD99/teWbP6zM+oWiKXu4gDa3bFRPNKfo19SpoEaHrw9ZdLiMjc6MEUu7U3iuEeoSNpCXtzhelw4Fs9qHSnth58Dvaw4sjbtUP68LQIxXnVO8WZBeicW15bPB78I+pFeJVtqir2JVltx7wwSKO4XrbeeRpS92gg/P3tZ33cSwPWclg32SQFLcz
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2019 11:10:19.3897 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e505c51-a944-4cac-993b-08d76760e785
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2436
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dwl4JXh3gudDNqqnWSO4qmhHyZFD7hivyUxQxR0plGY=;
 b=Jai0NsqsHq59Sg27RJ9TlmHDByYltbZHgyuUXWYUIllQokoFCUpRsHD8iIgadgpYuW9kak7vRL2ONd4VV19OVm9qEOUnjEqlPeqN/+h4gJz8ZB+cfle4wSkh0PGb0duIZY4fSxc3pZzN5UA7ZxpC98YAONjljUWz9T8GU1N/SX0=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dwl4JXh3gudDNqqnWSO4qmhHyZFD7hivyUxQxR0plGY=;
 b=Jai0NsqsHq59Sg27RJ9TlmHDByYltbZHgyuUXWYUIllQokoFCUpRsHD8iIgadgpYuW9kak7vRL2ONd4VV19OVm9qEOUnjEqlPeqN/+h4gJz8ZB+cfle4wSkh0PGb0duIZY4fSxc3pZzN5UA7ZxpC98YAONjljUWz9T8GU1N/SX0=
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
 Zhang \(Arm Technology China\)" <Oscar.Zhang@arm.com>, "Tiannan Zhu \(Arm
 Technology China\)" <Tiannan.Zhu@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Julien
 Yin \(Arm Technology China\)" <Julien.Yin@arm.com>, "Channing Chen \(Arm
 Technology China\)" <Channing.Chen@arm.com>, "james qian wang \(Arm Technology
 China\)" <james.qian.wang@arm.com>,
 "Yiqi Kang \(Arm Technology China\)" <Yiqi.Kang@arm.com>,
 "Thomas Sun \(Arm Technology China\)" <thomas.Sun@arm.com>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>,
 Ben Davis <Ben.Davis@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBmdW5jdGlvbiBpcyB1c2VkIHRvIGNvbnZlcnQgZHJtIGNvbG9yIGx1dCB0byBrb21lZGEg
SFcgcmVxdWlyZWQgY3VydmUKY29lZmZzIHZhbHVlcy4KClNpZ25lZC1vZmYtYnk6IGphbWVzIHFp
YW4gd2FuZyAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIDxqYW1lcy5xaWFuLndhbmdAYXJtLmNvbT4K
UmV2aWV3ZWQtYnk6IE1paGFpbCBBdGFuYXNzb3YgPG1paGFpbC5hdGFuYXNzb3ZAYXJtLmNvbT4K
LS0tCiAuLi4vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9jb2xvcl9tZ210LmMgICAgfCA1MiAr
KysrKysrKysrKysrKysrKysrCiAuLi4vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9jb2xvcl9t
Z210LmggICAgfCAgOSArKystCiAyIGZpbGVzIGNoYW5nZWQsIDYwIGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29t
ZWRhL2tvbWVkYV9jb2xvcl9tZ210LmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29t
ZWRhL2tvbWVkYV9jb2xvcl9tZ210LmMKaW5kZXggOWQxNGE5MmRiYjE3Li5jMTgwY2U3MGMyNmMg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Nv
bG9yX21nbXQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVk
YV9jb2xvcl9tZ210LmMKQEAgLTY1LDMgKzY1LDU1IEBAIGNvbnN0IHMzMiAqa29tZWRhX3NlbGVj
dF95dXYycmdiX2NvZWZmcyh1MzIgY29sb3JfZW5jb2RpbmcsIHUzMiBjb2xvcl9yYW5nZSkKIAog
CXJldHVybiBjb2VmZnM7CiB9CisKK3N0cnVjdCBnYW1tYV9jdXJ2ZV9zZWN0b3IgeworCXUzMiBi
b3VuZGFyeV9zdGFydDsKKwl1MzIgbnVtX29mX3NlZ21lbnRzOworCXUzMiBzZWdtZW50X3dpZHRo
OworfTsKKworc3RydWN0IGdhbW1hX2N1cnZlX3NlZ21lbnQgeworCXUzMiBzdGFydDsKKwl1MzIg
ZW5kOworfTsKKworc3RhdGljIHN0cnVjdCBnYW1tYV9jdXJ2ZV9zZWN0b3Igc2VjdG9yX3RibFtd
ID0geworCXsgMCwgICAgNCwgIDQgICB9LAorCXsgMTYsICAgNCwgIDQgICB9LAorCXsgMzIsICAg
NCwgIDggICB9LAorCXsgNjQsICAgNCwgIDE2ICB9LAorCXsgMTI4LCAgNCwgIDMyICB9LAorCXsg
MjU2LCAgNCwgIDY0ICB9LAorCXsgNTEyLCAgMTYsIDMyICB9LAorCXsgMTAyNCwgMjQsIDEyOCB9
LAorfTsKKworc3RhdGljIHZvaWQKK2RybV9sdXRfdG9fY29lZmZzKHN0cnVjdCBkcm1fcHJvcGVy
dHlfYmxvYiAqbHV0X2Jsb2IsIHUzMiAqY29lZmZzLAorCQkgIHN0cnVjdCBnYW1tYV9jdXJ2ZV9z
ZWN0b3IgKnNlY3Rvcl90YmwsIHUzMiBudW1fc2VjdG9ycykKK3sKKwlzdHJ1Y3QgZHJtX2NvbG9y
X2x1dCAqbHV0OworCXUzMiBpLCBqLCBpbiwgbnVtID0gMDsKKworCWlmICghbHV0X2Jsb2IpCisJ
CXJldHVybjsKKworCWx1dCA9IGx1dF9ibG9iLT5kYXRhOworCisJZm9yIChpID0gMDsgaSA8IG51
bV9zZWN0b3JzOyBpKyspIHsKKwkJZm9yIChqID0gMDsgaiA8IHNlY3Rvcl90YmxbaV0ubnVtX29m
X3NlZ21lbnRzOyBqKyspIHsKKwkJCWluID0gc2VjdG9yX3RibFtpXS5ib3VuZGFyeV9zdGFydCAr
CisJCQkgICAgIGogKiBzZWN0b3JfdGJsW2ldLnNlZ21lbnRfd2lkdGg7CisKKwkJCWNvZWZmc1tu
dW0rK10gPSBkcm1fY29sb3JfbHV0X2V4dHJhY3QobHV0W2luXS5yZWQsCisJCQkJCQlLT01FREFf
Q09MT1JfUFJFQ0lTSU9OKTsKKwkJfQorCX0KKworCWNvZWZmc1tudW1dID0gQklUKEtPTUVEQV9D
T0xPUl9QUkVDSVNJT04pOworfQorCit2b2lkIGRybV9sdXRfdG9fZmdhbW1hX2NvZWZmcyhzdHJ1
Y3QgZHJtX3Byb3BlcnR5X2Jsb2IgKmx1dF9ibG9iLCB1MzIgKmNvZWZmcykKK3sKKwlkcm1fbHV0
X3RvX2NvZWZmcyhsdXRfYmxvYiwgY29lZmZzLCBzZWN0b3JfdGJsLCBBUlJBWV9TSVpFKHNlY3Rv
cl90YmwpKTsKK30KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21l
ZGEva29tZWRhX2NvbG9yX21nbXQuaCBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21l
ZGEva29tZWRhX2NvbG9yX21nbXQuaAppbmRleCBhMmRmMjE4ZjU4ZTcuLjA4YWI2OTI4MTY0OCAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY29s
b3JfbWdtdC5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRh
X2NvbG9yX21nbXQuaApAQCAtMTEsNyArMTEsMTQgQEAKICNpbmNsdWRlIDxkcm0vZHJtX2NvbG9y
X21nbXQuaD4KIAogI2RlZmluZSBLT01FREFfTl9ZVVYyUkdCX0NPRUZGUwkJMTIKKyNkZWZpbmUg
S09NRURBX05fUkdCMllVVl9DT0VGRlMJCTEyCisjZGVmaW5lIEtPTUVEQV9DT0xPUl9QUkVDSVNJ
T04JCTEyCisjZGVmaW5lIEtPTUVEQV9OX0dBTU1BX0NPRUZGUwkJNjUKKyNkZWZpbmUgS09NRURB
X0NPTE9SX0xVVF9TSVpFCQlCSVQoS09NRURBX0NPTE9SX1BSRUNJU0lPTikKKyNkZWZpbmUgS09N
RURBX05fQ1RNX0NPRUZGUwkJOQorCit2b2lkIGRybV9sdXRfdG9fZmdhbW1hX2NvZWZmcyhzdHJ1
Y3QgZHJtX3Byb3BlcnR5X2Jsb2IgKmx1dF9ibG9iLCB1MzIgKmNvZWZmcyk7CiAKIGNvbnN0IHMz
MiAqa29tZWRhX3NlbGVjdF95dXYycmdiX2NvZWZmcyh1MzIgY29sb3JfZW5jb2RpbmcsIHUzMiBj
b2xvcl9yYW5nZSk7CiAKLSNlbmRpZgorI2VuZGlmIC8qX0tPTUVEQV9DT0xPUl9NR01UX0hfKi8K
LS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
