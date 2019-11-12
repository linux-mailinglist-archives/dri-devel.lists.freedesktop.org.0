Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E34F8D05
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 11:40:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3378A6EB04;
	Tue, 12 Nov 2019 10:40:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20046.outbound.protection.outlook.com [40.107.2.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 090D06EB04
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 10:40:46 +0000 (UTC)
Received: from VI1PR0802CA0033.eurprd08.prod.outlook.com
 (2603:10a6:800:a9::19) by AM0PR08MB3634.eurprd08.prod.outlook.com
 (2603:10a6:208:d6::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.22; Tue, 12 Nov
 2019 10:40:42 +0000
Received: from AM5EUR03FT019.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::205) by VI1PR0802CA0033.outlook.office365.com
 (2603:10a6:800:a9::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2430.23 via Frontend
 Transport; Tue, 12 Nov 2019 10:40:42 +0000
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT019.mail.protection.outlook.com (10.152.16.104) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.21 via Frontend Transport; Tue, 12 Nov 2019 10:40:42 +0000
Received: ("Tessian outbound 3fba803f6da3:v33");
 Tue, 12 Nov 2019 10:40:38 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b9988feed9b57917
X-CR-MTA-TID: 64aa7808
Received: from eebcda1cfdc6.2 (cr-mta-lb-1.cr-mta-net [104.47.10.54])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 85B22660-2E5E-4997-BD9A-D9C91F06BD67.1; 
 Tue, 12 Nov 2019 10:40:33 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2054.outbound.protection.outlook.com [104.47.10.54])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id eebcda1cfdc6.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Tue, 12 Nov 2019 10:40:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TBg0CEXLzW7JPTajW6rvaUgGk9barZtq1prZG+3b4ZEREFeTJYay85kDmrfgr+iuIL0CJX7mv1vczfhiHlfV2mxNCXJ+rQvyJ6trHdQZm78AmDhgZbVG67k3vWaG2IFT3PvVsl5wQ9bJge0448dDWzgssM5x3ThR7XiL+M4t8XetufgTQ6SdZqDf3bdfMZEi537NBfGRr2LFBrY5CHI+1UWemixCooJdJAkKOOy2tmhcgZCNYKjGBkx7mwOHrMju/v08emaHA6O/PpjmHF0XsdDeIOQjnfXNIzv6BGteA4+vvF0rLX1W7cNHemhhRKo0V5EnGOvGo9tEhBbZCS31aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dwl4JXh3gudDNqqnWSO4qmhHyZFD7hivyUxQxR0plGY=;
 b=evPEEmoEwP5tfRzEvXOhFboOHEYcGaKwO9Y6SBqRzSBlnUCqkASMK732cxNklB5oZOQ2RF1RHmQ6fVIx8xG3w7/Z6STxkw423kpnsRdxrQvtOvEtfJ4SjO39/mE5FN3JpTY5bSNWUJ9gDfb2mnRMYHX26lYG7UdKdkY6hPBBDG8gr85F1z2f1WIeH2VblPLNeT735n7YWy9hnMWRHmvR5vM+UaVyv62kR44LRBCfTpRwTn7GnfvhD29CxqXmUqs4Ui5B5nhcGraY5uojArhwBOBbbUBZCSLgfcHmtsU/+20Jk5tG7Mo8CDUlEQ5maSZmNhKdHL39K9HCPNcAOi3b4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from AM0PR08MB4995.eurprd08.prod.outlook.com (10.255.30.207) by
 AM0PR08MB4082.eurprd08.prod.outlook.com (20.178.119.219) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.23; Tue, 12 Nov 2019 10:40:31 +0000
Received: from AM0PR08MB4995.eurprd08.prod.outlook.com
 ([fe80::3c0c:3112:ccbf:13d0]) by AM0PR08MB4995.eurprd08.prod.outlook.com
 ([fe80::3c0c:3112:ccbf:13d0%6]) with mapi id 15.20.2430.027; Tue, 12 Nov 2019
 10:40:31 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "airlied@linux.ie" <airlied@linux.ie>, 
 Brian Starkey <Brian.Starkey@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "sean@poorly.run" <sean@poorly.run>, 
 Mihail Atanassov <Mihail.Atanassov@arm.com>, "imirkin@alum.mit.edu"
 <imirkin@alum.mit.edu>
Subject: [PATCH v9 2/4] drm/komeda: Add drm_lut_to_fgamma_coeffs()
Thread-Topic: [PATCH v9 2/4] drm/komeda: Add drm_lut_to_fgamma_coeffs()
Thread-Index: AQHVmUWbKgyTbmPF30mDCSrJAJAYVQ==
Date: Tue, 12 Nov 2019 10:40:31 +0000
Message-ID: <20191112103956.19074-3-james.qian.wang@arm.com>
References: <20191112103956.19074-1-james.qian.wang@arm.com>
In-Reply-To: <20191112103956.19074-1-james.qian.wang@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0PR03CA0087.apcprd03.prod.outlook.com
 (2603:1096:203:72::27) To AM0PR08MB4995.eurprd08.prod.outlook.com
 (2603:10a6:208:162::15)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 40c58122-e8b4-435b-8670-08d7675cc455
X-MS-TrafficTypeDiagnostic: AM0PR08MB4082:|AM0PR08MB4082:|AM0PR08MB3634:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM0PR08MB36345E35ED6DC4D61485FF1FB3770@AM0PR08MB3634.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:2043;OLM:2043;
x-forefront-prvs: 021975AE46
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(979002)(4636009)(376002)(366004)(346002)(396003)(136003)(39860400002)(199004)(189003)(86362001)(6512007)(478600001)(66066001)(54906003)(110136005)(316002)(5660300002)(6486002)(14454004)(2171002)(11346002)(446003)(2616005)(6436002)(25786009)(476003)(2201001)(14444005)(1076003)(6506007)(8936002)(386003)(99286004)(2906002)(4326008)(55236004)(102836004)(103116003)(256004)(66946007)(66556008)(66476007)(64756008)(66446008)(6116002)(3846002)(52116002)(26005)(81166006)(81156014)(8676002)(186003)(7736002)(486006)(71190400001)(71200400001)(36756003)(305945005)(76176011)(50226002)(2501003)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB4082;
 H:AM0PR08MB4995.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: a3v/DQSfKb9ZZFqlQ2LipZjWy8dFhQAnHCkcn8pf0fi6AHxYczSwTGPAOb4RoCIGQOkSvD9HLZ9jHk4CA0mxXodCeWpgvv3IPBfESGVxOz/6ZM5QzzHM6vBVUtNZAozTueldrJaZtNsS2pB3NQ97bZb4KUaZGYkN1f+aZxCrDuSR/i7RmfNtmjNFimIbpvs9DrOMwFsFYbJNcoWjliiVlH4NbsJkHe5uxRFK5+K/qFEE+zgcf9ar2rJpKSDls/dG57Y2Phg7qr99/dN8Qo8LXH05wPtl3Lxj6yqt7r+q5dBk2vizPFOcYznQ+sN3nBAvrxtxXioYiK70TledlUPuwnXraXIlyeb7tpf51va5WyMsu0zvB2RXSyl5UfEEaW+Q9FV57dx41iJsvl4i1CDZUPk8Tcq9imkDYDrjDjM5WKPgcrZ/X6sCzMpiCOknWStt
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4082
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(979002)(4636009)(39860400002)(136003)(396003)(376002)(346002)(1110001)(339900001)(189003)(199004)(4326008)(478600001)(14454004)(26005)(6512007)(99286004)(336012)(2171002)(103116003)(66066001)(23756003)(11346002)(446003)(54906003)(25786009)(186003)(26826003)(6486002)(36756003)(14444005)(36906005)(316002)(356004)(110136005)(47776003)(3846002)(6116002)(50226002)(305945005)(2201001)(7736002)(1076003)(81166006)(81156014)(486006)(2501003)(102836004)(86362001)(50466002)(386003)(2616005)(5660300002)(6506007)(76176011)(2906002)(105606002)(76130400001)(126002)(70206006)(22756006)(476003)(8676002)(70586007)(8936002)(8746002)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB3634;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Fail; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 5aaa2bfe-eacc-40e4-cf60-08d7675cbd74
NoDisclaimer: True
X-Forefront-PRVS: 021975AE46
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zkK2ZVwNTqpFAmM6H7PF/NQqct7YBhSH/22xK8D7lart0bOl79tCHRkUU3huHx/ZP0mB2XJTTbrISG/u+Ukb5e9A1eWnNdBLyG+Wtw7K+QC1sxUIb5gIEq7rWcdNID6IJO65WT8D6O5LVS01I0IJmpc/jZ6ksqvT4nMQxpY8DWXwSZprP58phD6rS15OXlwOaW1zyFGiFdX7Fp3EGy9ErShWtBHCUDyKTL4by8QMK5XQQjW5orOstW2rg8SnVWPTa180tPWov7r9wiVegUVjLWash9flS4SprQBePfzyuDNeENZW3amy4/axtwldbPveuwfdxreDG7fO0BiKjjngt4VRh9cCFCHyjb0Hzi9m8YlkCEkr1ylD05Y9W4e5j6dW8wuWrmVWW5fxEPJTumpIKrb9fweWiaSE2rK26+J0VLVWTW4HxabEgpOSWx4ioBYQ
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2019 10:40:42.4055 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40c58122-e8b4-435b-8670-08d7675cc455
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3634
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dwl4JXh3gudDNqqnWSO4qmhHyZFD7hivyUxQxR0plGY=;
 b=+Pgg5dtCZX15W2ngjSFIKapDfjxtJOhi4FimOi578ORS9OHEXdzezp5gRyCy42S3x8btny2crv8qnTdU40lWejK233hJmEOYzJENO6rxHuM418u5Tmgv2MdKuWXxINScCCKoI7oh/YKz1ZCuzXFoIGbl9rsodSHm2Db3KLqJWg8=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dwl4JXh3gudDNqqnWSO4qmhHyZFD7hivyUxQxR0plGY=;
 b=+Pgg5dtCZX15W2ngjSFIKapDfjxtJOhi4FimOi578ORS9OHEXdzezp5gRyCy42S3x8btny2crv8qnTdU40lWejK233hJmEOYzJENO6rxHuM418u5Tmgv2MdKuWXxINScCCKoI7oh/YKz1ZCuzXFoIGbl9rsodSHm2Db3KLqJWg8=
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
