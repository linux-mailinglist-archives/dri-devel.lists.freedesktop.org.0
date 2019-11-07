Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9B9F2D9C
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 12:42:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CAE96E456;
	Thu,  7 Nov 2019 11:42:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60040.outbound.protection.outlook.com [40.107.6.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FD126E456
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 11:42:37 +0000 (UTC)
Received: from VI1PR08CA0138.eurprd08.prod.outlook.com (2603:10a6:800:d5::16)
 by VE1PR08MB5053.eurprd08.prod.outlook.com (2603:10a6:803:10e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2430.23; Thu, 7 Nov
 2019 11:42:33 +0000
Received: from AM5EUR03FT047.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::204) by VI1PR08CA0138.outlook.office365.com
 (2603:10a6:800:d5::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2430.20 via Frontend
 Transport; Thu, 7 Nov 2019 11:42:33 +0000
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT047.mail.protection.outlook.com (10.152.16.197) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.21 via Frontend Transport; Thu, 7 Nov 2019 11:42:33 +0000
Received: ("Tessian outbound 851a1162fca7:v33");
 Thu, 07 Nov 2019 11:42:33 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: bed9424188f2679d
X-CR-MTA-TID: 64aa7808
Received: from 382107c0733b.2 (cr-mta-lb-1.cr-mta-net [104.47.10.55])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 479E54D0-3CD5-4ADF-AF21-0104589DAD5D.1; 
 Thu, 07 Nov 2019 11:42:26 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2055.outbound.protection.outlook.com [104.47.10.55])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 382107c0733b.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 07 Nov 2019 11:42:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A/5mOrUCMN5lznBCrr0JUb1EFuSdGntYfUEW7jZOautE4PlHbiT/qo6xjavurg2IAfjr+J4oCPZWq+dkMuFvXepCS3TfIHonvVtXuTa10/u+BrzO3ixuhJJXdXkhdQYEupcx9SIzanAe8gXIR5p5ia7WVFFTr/+PbeRAysVU3ovKnglNazWbbB4/5Z2ZT7ZafYpJEfHgzcTovU/J/Lo+x/9JC8ZNM6z28hPh+Tww4gWifPdp9aTE5r72T+B04AAuNq5oiGobcymkWX9KlNhIX+Tuv8eQGrXmR0a4aWLPcwKMk7QfPj4r5M07uQ0X8diWo7Bbh+vqxv14XFKpyop15A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q9Qy+5QuuahR73Se226LG9hQrqrQVwjZKRRxbwvRDIM=;
 b=DaKbSSfcVD6+NpyS8a0vWCGeQO6k4/ToQKpZtAK7xsCHv9eMvAFu0JjMSwJ5Jm5WhtG4Eu1mwLhcY087BlrXwRvtuwp9J2nJ6p6My2CF3aEfrVgrmVMZntTBU7mdNuxnfK4/jvyB2N9S2Yk0Elseq6ZUYtv5XLXshQr86Z98y7vvWoKAIQc6AhqyGSqcM1iCy9imbTi/PzaP4pXUjk4/rCY1u34izUgh4Emuq1o6o9jWzsG75t+fOZZ8eoZgu4MP5Y0TrQ5uPhj3+ILq2Ug0VponP/tFGIPG+Qhj3MdgevXc/yfn9hrBSzcA2VCgzDNOyFvmGHHQ3dE8Z++CYnhPOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB4351.eurprd08.prod.outlook.com (20.179.27.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.20; Thu, 7 Nov 2019 11:42:25 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d%3]) with mapi id 15.20.2408.028; Thu, 7 Nov 2019
 11:42:25 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 0/5] drm/komeda: Improve IRQ error event prints
Thread-Topic: [PATCH v2 0/5] drm/komeda: Improve IRQ error event prints
Thread-Index: AQHVlWBsrADBZKixe0GvhOzL83K+tQ==
Date: Thu, 7 Nov 2019 11:42:25 +0000
Message-ID: <20191107114155.54307-1-mihail.atanassov@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.55]
x-clientproxiedby: LO2P265CA0146.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9::14) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
x-mailer: git-send-email 2.23.0
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e5a3f1ec-d8e9-41bf-c768-08d763779423
X-MS-TrafficTypeDiagnostic: VI1PR08MB4351:|VI1PR08MB4351:|VE1PR08MB5053:
X-MS-Exchange-PUrlCount: 1
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VE1PR08MB50536FDC87A28FB7EB94CFD58F780@VE1PR08MB5053.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
x-forefront-prvs: 0214EB3F68
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(346002)(396003)(39860400002)(376002)(136003)(189003)(199004)(53754006)(316002)(54906003)(476003)(50226002)(71200400001)(6512007)(305945005)(6916009)(2906002)(8936002)(2616005)(44832011)(4326008)(6436002)(66066001)(256004)(486006)(86362001)(26005)(71190400001)(36756003)(52116002)(2351001)(14444005)(6506007)(99286004)(6486002)(102836004)(2501003)(386003)(186003)(6116002)(14454004)(66946007)(66476007)(66556008)(64756008)(66446008)(25786009)(478600001)(6306002)(1076003)(3846002)(8676002)(81166006)(81156014)(7736002)(5640700003)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB4351;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: DYVX0PYoPwfggPDms5K3+w8K7LRIsPpvXOoyKUCqUGD6fVf9oK8gu7/MjZ1x0aq2KQPKLDpJ+bExTFQ5X4S4kKzEvENh8Ow1/iSblQ/StR7siQzrZAhRRgGGRBtvg2XAG9Bc1GFOxkWTzkLFl4zhTTkEY8XkTVn2kQcHPPwv3khMtUSybrxx6olRlhplRkqOI2pCmasD7oftF82fCNmzmCY3CpoqG+0QTRokk2VJjnfTrRMu4GdkU8mHbQgkkmPRte30+veehjLbrnS5rNwk3nFKIM4nRayqIkj6XzDjPombWCX+N5ysvHQGnwFBQp9j1CkhTXPd+h1Cs6qOv9h9m1BqmGEQ+qP0PsTQnuQE+j27yvzBA5vrviR378tkJk5k1oPaCZURpwX/ej6q8JMQshV9UPg9ss1MUqD78eCKA1kDViqCQjt+LUtpN7TEFCwUap6OyeXYaMZCa8Fi1Qkrdh898wuagvcSJ4jPer7xzD8=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4351
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT047.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(39860400002)(346002)(396003)(1110001)(339900001)(53754006)(189003)(199004)(336012)(26826003)(5640700003)(105606002)(76130400001)(36756003)(8746002)(2351001)(6486002)(36906005)(50226002)(6916009)(14454004)(8936002)(316002)(6116002)(126002)(26005)(66066001)(47776003)(486006)(2906002)(3846002)(386003)(22756006)(1076003)(2616005)(86362001)(305945005)(6506007)(70206006)(476003)(102836004)(7736002)(99286004)(25786009)(356004)(6512007)(6306002)(186003)(2501003)(54906003)(5660300002)(50466002)(14444005)(107886003)(23756003)(81156014)(478600001)(4326008)(81166006)(70586007)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB5053;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Fail; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: e538ae12-ba5c-4d88-5a5f-08d763778f27
NoDisclaimer: True
X-Forefront-PRVS: 0214EB3F68
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bbCETai02CGBXX7+/pc6UMxOD22G0v1vnPS1O+O97cO98pgmUX0E3vAAPVr7CXixwLAVKB1eYvyAOP1GYB/FSFqvy7K+Z6rhFTbPzaHg9IqCoqhCuXNMMf+zmHBN+XthtCcCcYkKa6K5Xr1Wg4qZtkmuLDEJ5ua5ntMdmZ1+wSMjTFuqqi1o1oi4OHYelmRku99UlzB0st/z3YHraOObdSJKLnetPUGescBNdyWm6u5ieLl0zrrvLMPDlqqhLIjBuxKFk93PmREJDqnlB/1wLVvvbTmkL3RXyCS5+9SRlZFBkX1yjqb8B9hwZ2cwa/VjfOrujlUqfWFwKei+Qt3GEfRSdjzGYY9Vp9TDH1w8mU2WTB8t9r8XjiuIrbyCum9zXm/wf4rSqTRtyS9jbEudw6wcAS0F/I7MoPTegL02u/lW7W1A7HXUretplZOm0sKqotnyRfVr3W+xgShUqQULJDIX/fah9/1TcoLPbqf/5Uc=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2019 11:42:33.3294 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5a3f1ec-d8e9-41bf-c768-08d763779423
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5053
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q9Qy+5QuuahR73Se226LG9hQrqrQVwjZKRRxbwvRDIM=;
 b=TubYzZkLu2R/4itVn+9bXG5WvF7vFAWUFNr9v50A7rZz0WSCDHWEUHA4gbl4iL9GJyPkm+WWRpSnDF4PGvp4eMUkhQRa3EyAGt1DH/O2T4DCFnJ7L7epn+MXqheCQJww4rPGhOQqpItWgaGZu2tikw2RZw2xbeKdHwpe514cUJQ=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q9Qy+5QuuahR73Se226LG9hQrqrQVwjZKRRxbwvRDIM=;
 b=TubYzZkLu2R/4itVn+9bXG5WvF7vFAWUFNr9v50A7rZz0WSCDHWEUHA4gbl4iL9GJyPkm+WWRpSnDF4PGvp4eMUkhQRa3EyAGt1DH/O2T4DCFnJ7L7epn+MXqheCQJww4rPGhOQqpItWgaGZu2tikw2RZw2xbeKdHwpe514cUJQ=
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
Cc: Mihail Atanassov <Mihail.Atanassov@arm.com>,
 David Airlie <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>, nd <nd@arm.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgZXZlcnlvbmUsCgpTZW5kaW5nIG91dCBhIHYyIG9mIHRoZSBzZXJpZXMgc2luY2UgSSBoYWQg
bWlzc2VkIG91dCBhIGNvdXBsZSBvZiBpc3N1ZXMKY2hlY2twYXRjaCBjYXVnaHQuCgpDaGFuZ2Vz
IHNpbmNlIHYxIFtodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzY4MzI1
L106CiAtIEZpeGVkIGEgY291cGxlIG9mIGNoZWNrcGF0Y2ggaXNzdWVzIGluIDIvNSBhbmQgNS81
Cgp2MSdzIGNvdmVyIGxldHRlcjoKClRoaXMgaXMgYSBzbWFsbGlzaCBzZXJpZXMgdGhhdCB0cmll
cyB0byByZW1vdmUgc29tZSBidWlsZC10aW1lCmNvbmZpZ3VyYWJpbGl0eSBpbiBrb21lZGEgYW5k
IHJlcGxhY2UgaXQgd2l0aCBhIGRlYnVnZnMgY29udHJvbC4gTGF0ZXIKcGF0Y2hlcyBpbiB0aGUg
c2VyaWVzIGFkZCBzb21lIGV4dHJhIGZ1bmN0aW9uYWxpdHkgd2hpY2ggSSBmb3VuZCB1c2VmdWwK
ZHVyaW5nIG15IGRlYnVnZ2luZyBzZXNzaW9ucywgc28gSSBmaWd1cmVkIEknZCBiYWtlIGl0IGlu
LgoKSSd2ZSBwcmVzZXJ2ZWQgdGhlIGRlZmF1bHQgYmVoYXZpb3VyIGFzIGlmIENPTkZJR19LT01F
REFfRVJST1JfUFJJTlQKd2VyZSBlbmFibGVkLCBzbyBwcm9kdWN0aW9uIGtlcm5lbHMgY2FuIGhh
dmUgc29tZSBmZWVkYmFjayBmcm9tIHRoZQpkcml2ZXIgd2hlbiB0aGluZ3MgYXJlIGdvaW5nIHNv
dXRoLgoKMTogSW50cm9kdWNlIHRoZSBlcnJfdmVyYm9zaXR5IGRlYnVnZnMgbm9kZSBmb3Iga29t
ZWRhOyB0aGlzIGtlZXBzIHRoZQogICBkZWZhdWx0IG9mIHByaW50aW5nIGVycm9yIGV2ZW50cyBv
bmNlIHBlciBmcmFtZS4KMjogRHJvcCBDT05GSUdfS09NRURBX0VSUk9SX1BSSU5UIHNpbmNlIG91
dHB1dCBjYW4gYmUgZGlzYWJsZWQgYXQKICAgcnVudGltZQozOiBBZGQgYSBkcm0gc3RhdGUgZHVt
cCBvbiBldmVudC4gSXQncyBxdWl0ZSBjaGF0dHkgc28gSSBsZWZ0IGl0IG9ubHkKICAgZm9yIGVy
cm9yIGV2ZW50czsgcHJpbnRpbmcgYWxsIHRoYXQgb25jZSBwZXIgZnJhbWUgZXZlcnkgdnN5bmMg
Zmxvb2RzIG15CiAgIHNlcmlhbCB0ZXJtaW5hbCwgc28gbm8gaW5mbyArIHN0YXRlIGNvbWJpbmF0
aW9uLgo0OiBBZGQgbG93ZXItc2V2ZXJpdHkgY2F0ZWdvcmllcyB0byB0aGUgZXZlbnQgcHJpbnRl
cgo1OiBOb3JtYWxseSB0aGVzZSBldmVudHMgZmlyZSBvbmx5IG9uY2UgcGVyIHBhZ2VmbGlwLCBi
dXQgc29tZXRpbWVzIGl0J3MKICAgdXNlZnVsIHRvIHNlZSB0aGVtIGFsbCBhcyB0aGV5IGNvbWUg
aW4uCgpUaGVzZSBwYXRjaGVzIGFyZSBvdmVyYWxsIHF1aXRlIHRpbnksIGFuZCBJIHdhcyBjb25z
aWRlcmluZyBqdXN0CnNxdWFzaGluZyB0aGVtIGludG8gb25lLCBidXQgSSBvcHRlZCB0byBrZWVw
IHRoZW0gc2VwYXJhdGUgZm9yIGFuIGVhc2llcgpyZXZpZXcgZXhwZXJpZW5jZTsgcGxlYXNlIGxl
dCBtZSBrbm93IHdoZXRoZXIgeW91IHByZWZlciBhIHNpbmdsZSBwYXRjaC4KVGhhbmtzIQoKTWlo
YWlsIEF0YW5hc3NvdiAoNSk6CiAgZHJtL2tvbWVkYTogQWRkIGRlYnVnZnMgbm9kZSB0byBjb250
cm9sIGVycm9yIHZlcmJvc2l0eQogIGRybS9rb21lZGE6IFJlbW92ZSBDT05GSUdfS09NRURBX0VS
Uk9SX1BSSU5UCiAgZHJtL2tvbWVkYTogT3B0aW9uYWxseSBkdW1wIERSTSBzdGF0ZSBvbiBpbnRl
cnJ1cHRzCiAgZHJtL2tvbWVkYTogQWRkIG9wdGlvbiB0byBwcmludCBXQVJOLSBhbmQgSU5GTy1s
ZXZlbCBJUlEgZXZlbnRzCiAgZHJtL2tvbWVkYTogYWRkIHJhdGUgbGltaXRpbmcgZGlzYWJsZSB0
byBlcnJfdmVyYm9zaXR5CgogZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L0tjb25maWcgICAg
ICAgICAgIHwgIDYgLS0tLQogZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9NYWtl
ZmlsZSAgIHwgIDUgKystLQogLi4uL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9k
ZXYuYyAgIHwgIDQgKysrCiAuLi4vZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rl
di5oICAgfCAzMCArKysrKysrKysrKysrKystLS0tCiAuLi4vZ3B1L2RybS9hcm0vZGlzcGxheS9r
b21lZGEva29tZWRhX2V2ZW50LmMgfCAyMyArKysrKysrKysrKy0tLQogLi4uL2dwdS9kcm0vYXJt
L2Rpc3BsYXkva29tZWRhL2tvbWVkYV9rbXMuYyAgIHwgIDIgKy0KIDYgZmlsZXMgY2hhbmdlZCwg
NTEgaW5zZXJ0aW9ucygrKSwgMTkgZGVsZXRpb25zKC0pCgotLSAKMi4yMy4wCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
