Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10358FC1B1
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2019 09:38:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 632226E44D;
	Thu, 14 Nov 2019 08:38:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on060e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe1e::60e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 016186E44D
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2019 08:38:12 +0000 (UTC)
Received: from VI1PR0802CA0044.eurprd08.prod.outlook.com
 (2603:10a6:800:a9::30) by AM0PR08MB3524.eurprd08.prod.outlook.com
 (2603:10a6:208:de::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2430.25; Thu, 14 Nov
 2019 08:38:09 +0000
Received: from VE1EUR03FT045.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::203) by VI1PR0802CA0044.outlook.office365.com
 (2603:10a6:800:a9::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2451.23 via Frontend
 Transport; Thu, 14 Nov 2019 08:38:08 +0000
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT045.mail.protection.outlook.com (10.152.19.51) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2451.23 via Frontend Transport; Thu, 14 Nov 2019 08:38:08 +0000
Received: ("Tessian outbound 0939a6bab6b1:v33");
 Thu, 14 Nov 2019 08:38:06 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 69003d00aee04017
X-CR-MTA-TID: 64aa7808
Received: from f462d7ae725a.2 (cr-mta-lb-1.cr-mta-net [104.47.10.54])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 708EC68A-99CA-4C08-807A-AB2EBCDE3179.1; 
 Thu, 14 Nov 2019 08:38:01 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2054.outbound.protection.outlook.com [104.47.10.54])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f462d7ae725a.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 14 Nov 2019 08:38:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ATTWuPjdRBeX/mrOR7ziH/LXObhLZItp4+lCPuBlReMlTHcI0eP94vfgWPKQ4WD1JWxs01Hciw7P3SIe/adl/CphsjxYKTQyTHZehIImdFZGU+xeAlo0kFSVv610Snes5HUpmsel6cboPLy0LojF3bomRDlMY5F/gEm/RE8V/Wf8dONxtTO5KN/LsZ+fHJdhRSQ41Shd9u3/pliIRI48bsC0qqUUkEOz430r1pW9FOeCfbRLT4H6OlduLucqLtVqhms4TQePx+4nbXJoXrxHOWq/J5T56iAo9DzZya2hA45Uujk2UaHdA+rP4QXCHrYcQQovCgWmX0LbI6GlRZGCJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Awgo8mzDAScoElNVrNOTr423ZXzTsReQcbX4ga4vw0k=;
 b=aufO+bHCBV8MLJJQqAr671VTsoAl1Lq2j8StSG3uUKUjUc7Fi0+mZBPVmHQa5UCwPoR/uogfPtvUYHiCMkjyLvNC75JTvlY9nkPhrBDn1DAgZV5IHYRJSz5sk4JwqLw/NWWDfUHu6kNBFSgk0/85yOQpCD6x2vGa381wkccNgN+yeZ5UccEp8cA3CbH90LYJOKcW9l/X4+epL8WyqLhVwe6u3xF6saqzNQOe+8042b8UzSB7Rn8eZ6PfVmsP/+B1+Lbv1J/L0wcx/HRlVpebD2A7PnSEqcchXA5QRlZEg8GSXVt4m7pyfuqaYSGSFXvwRkOBgOdgTtzE/152nsv0Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4768.eurprd08.prod.outlook.com (10.255.114.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.27; Thu, 14 Nov 2019 08:37:59 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a809:417a:faf3:61a7]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a809:417a:faf3:61a7%6]) with mapi id 15.20.2451.023; Thu, 14 Nov 2019
 08:37:58 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "airlied@linux.ie" <airlied@linux.ie>, 
 Brian Starkey <Brian.Starkey@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "sean@poorly.run" <sean@poorly.run>, 
 Mihail Atanassov <Mihail.Atanassov@arm.com>
Subject: [PATCH v3 6/6] drm/komeda: Expose side_by_side by sysfs/config_id
Thread-Topic: [PATCH v3 6/6] drm/komeda: Expose side_by_side by sysfs/config_id
Thread-Index: AQHVmsbRCzpCw/jsq0ibptLi8SePxg==
Date: Thu, 14 Nov 2019 08:37:58 +0000
Message-ID: <20191114083658.27237-7-james.qian.wang@arm.com>
References: <20191114083658.27237-1-james.qian.wang@arm.com>
In-Reply-To: <20191114083658.27237-1-james.qian.wang@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0PR01CA0038.apcprd01.prod.exchangelabs.com
 (2603:1096:203:3e::26) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3bd53c9d-576d-448d-df33-08d768ddf9e9
X-MS-TrafficTypeDiagnostic: VE1PR08MB4768:|VE1PR08MB4768:|AM0PR08MB3524:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM0PR08MB352469CA7170373C1042C3CFB3710@AM0PR08MB3524.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:2201;OLM:2201;
x-forefront-prvs: 02213C82F8
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(376002)(346002)(396003)(136003)(39850400004)(189003)(199004)(71200400001)(71190400001)(36756003)(305945005)(2906002)(7736002)(110136005)(54906003)(6116002)(316002)(3846002)(99286004)(103116003)(446003)(11346002)(6486002)(8936002)(2616005)(476003)(6436002)(66476007)(66556008)(64756008)(66446008)(66946007)(478600001)(6512007)(50226002)(66066001)(486006)(14454004)(2501003)(5660300002)(76176011)(52116002)(256004)(14444005)(386003)(55236004)(25786009)(6636002)(102836004)(6506007)(8676002)(4326008)(26005)(81156014)(81166006)(1076003)(186003)(2201001)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4768;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: uxWJBK2FNuHy+XpfXqh1dz4UMc6Rh8NyurPVA/k4IFMEzR2XnDbaom/pjm/3hq+3+ytAIveH+OBQ2T9osjw0Ma/mj6Lq0qzMFAK8FXXZ1rh2Rrgq/ZcZg4kipDXgdj07pADhLj1KySp3aUtdr00VVjzOOCZzA8AVDwr2pTpHM0/jsDEPO64A7a13wVTpWORXt82dJFf+pH3YvyO4wRC44etoAJZZ+PQeWG4hzs0l9sxQ1zqHDy8RZgT9rESmad9xPf6PEYW61j8NwvBDiu6VHMhIqgbJhpZZ+acMr3+Ja199g44hzY2JpJrLq2C+iQRDX8T7myAcg8PFTJU1ZMfocnjRjioUIhN0C+UaSu9HxpEwXy5pB5EjbP6NvtQjugb38sJpMgej9Zh8ylMuzKfr424hYd/lO8KaD0uEjwt/HgJObH9s7dhuHDmlFp2urFOg
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4768
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39850400004)(396003)(346002)(376002)(1110001)(339900001)(199004)(189003)(105606002)(6636002)(8936002)(103116003)(36756003)(81166006)(26826003)(22756006)(8676002)(50226002)(81156014)(3846002)(6116002)(7736002)(356004)(36906005)(54906003)(2201001)(478600001)(2906002)(2501003)(76130400001)(8746002)(336012)(186003)(316002)(86362001)(14454004)(70586007)(5660300002)(476003)(4326008)(486006)(110136005)(126002)(14444005)(70206006)(2616005)(26005)(386003)(1076003)(23756003)(6486002)(66066001)(6506007)(102836004)(446003)(6512007)(50466002)(99286004)(76176011)(47776003)(25786009)(11346002)(305945005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB3524;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Fail; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: c2c8f05f-7838-4c0b-069a-08d768ddf3e0
NoDisclaimer: True
X-Forefront-PRVS: 02213C82F8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aWUdoNbPKzWwiBA+gI3hV2mr4JIF4KdrV0TnnIm+KsC9T1AzOIdnEIgtDba1UokLevUmYIqAaGRpyCQn5Q7L8+9IbpylAAAeveTniqRA2OFhV4MXTK/Eq7Qn7/LOjWezQTbX09qg6DJ7fU7vIOy66zRs5JadHX4tLl5WOuRplnyNY8LQ6KQAaYzJ+AZgBCrWAMuQIEVHvhBNnpB5ouNDjDkPBZNNFBqLFy7mhIq30CzZrqai8IEsdi68/9Sn4QzVCygVA6DWY9sSBnr2XONIkHvT5EmsIrPM3k3SiKMHbTaYOdsRTMJhUToLOx8s/1ql9p6s78skVl1d4KvOc1MoemksCZ+DkhcZaMf2z+YzXBCrnfFTyEC44HD+XOTFDOCoOXpU9T3Oc5q6Iyt3Ee+nsPDh8eh24VM+WuhWM0CKW89Pl5B2rDuN5Ak4WBQQijzc
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2019 08:38:08.4988 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bd53c9d-576d-448d-df33-08d768ddf9e9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3524
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Awgo8mzDAScoElNVrNOTr423ZXzTsReQcbX4ga4vw0k=;
 b=DG/SbwJL5aBUBqnYQ27d8+wk05JPaJSUWgqErDMd1C7yRsGGCZSm+vsSdC6BuSHHzCnj5/0kJCXrRewAlBWwogDjtpx5IJy/2fM3bePuKwLFdHikVnTaVia+RDNHnJAxNgeSgnrjMIYFWaRtGun+UICTYMpDHfxf6LKU4WfbGrU=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Awgo8mzDAScoElNVrNOTr423ZXzTsReQcbX4ga4vw0k=;
 b=DG/SbwJL5aBUBqnYQ27d8+wk05JPaJSUWgqErDMd1C7yRsGGCZSm+vsSdC6BuSHHzCnj5/0kJCXrRewAlBWwogDjtpx5IJy/2fM3bePuKwLFdHikVnTaVia+RDNHnJAxNgeSgnrjMIYFWaRtGun+UICTYMpDHfxf6LKU4WfbGrU=
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

VGhlcmUgYXJlIHNvbWUgcmVzdHJpY3Rpb25zIGlmIEhXIHdvcmtzIG9uIHNpZGVfYnlfc2lkZSwg
ZXhwb3NlIGl0IHZpYQpjb25maWdfaWQgdG8gdXNlci4KClNpZ25lZC1vZmYtYnk6IEphbWVzIFFp
YW4gV2FuZyAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIDxqYW1lcy5xaWFuLndhbmdAYXJtLmNvbT4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkvaW5jbHVkZS9tYWxpZHBfcHJvZHVjdC5o
IHwgMyArKy0KIGRyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rldi5j
ICAgICAgfCAxICsKIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2luY2x1ZGUvbWFs
aWRwX3Byb2R1Y3QuaCBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9pbmNsdWRlL21hbGlk
cF9wcm9kdWN0LmgKaW5kZXggMTA1M2IxMTM1MmViLi45NmUyZTQwMTYyNTAgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9pbmNsdWRlL21hbGlkcF9wcm9kdWN0LmgKKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2luY2x1ZGUvbWFsaWRwX3Byb2R1Y3QuaApA
QCAtMjcsNyArMjcsOCBAQCB1bmlvbiBrb21lZGFfY29uZmlnX2lkIHsKIAkJCW5fc2NhbGVyczoy
LCAvKiBudW1iZXIgb2Ygc2NhbGVycyBwZXIgcGlwZWxpbmUgKi8KIAkJCW5fbGF5ZXJzOjMsIC8q
IG51bWJlciBvZiBsYXllcnMgcGVyIHBpcGVsaW5lICovCiAJCQluX3JpY2hzOjMsIC8qIG51bWJl
ciBvZiByaWNoIGxheWVycyBwZXIgcGlwZWxpbmUgKi8KLQkJCXJlc2VydmVkX2JpdHM6NjsKKwkJ
CXNpZGVfYnlfc2lkZToxLCAvKiBpZiBIVyB3b3JrcyBvbiBzaWRlX2J5X3NpZGUgbW9kZSAqLwor
CQkJcmVzZXJ2ZWRfYml0czo1OwogCX07CiAJX191MzIgdmFsdWU7CiB9OwpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZGV2LmMgYi9kcml2ZXJz
L2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYuYwppbmRleCBjM2ZhNDgzNWNi
OGQuLjRkZDQ2OTlkNGUzZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5
L2tvbWVkYS9rb21lZGFfZGV2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tv
bWVkYS9rb21lZGFfZGV2LmMKQEAgLTgzLDYgKzgzLDcgQEAgY29uZmlnX2lkX3Nob3coc3RydWN0
IGRldmljZSAqZGV2LCBzdHJ1Y3QgZGV2aWNlX2F0dHJpYnV0ZSAqYXR0ciwgY2hhciAqYnVmKQog
CW1lbXNldCgmY29uZmlnX2lkLCAwLCBzaXplb2YoY29uZmlnX2lkKSk7CiAKIAljb25maWdfaWQu
bWF4X2xpbmVfc3ogPSBwaXBlLT5sYXllcnNbMF0tPmhzaXplX2luLmVuZDsKKwljb25maWdfaWQu
c2lkZV9ieV9zaWRlID0gbWRldi0+c2lkZV9ieV9zaWRlOwogCWNvbmZpZ19pZC5uX3BpcGVsaW5l
cyA9IG1kZXYtPm5fcGlwZWxpbmVzOwogCWNvbmZpZ19pZC5uX3NjYWxlcnMgPSBwaXBlLT5uX3Nj
YWxlcnM7CiAJY29uZmlnX2lkLm5fbGF5ZXJzID0gcGlwZS0+bl9sYXllcnM7Ci0tIAoyLjIwLjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
