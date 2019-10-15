Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A80D7419
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 13:00:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 872C36E34C;
	Tue, 15 Oct 2019 11:00:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130083.outbound.protection.outlook.com [40.107.13.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 112186E1EC
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 11:00:24 +0000 (UTC)
Received: from AM4PR08CA0067.eurprd08.prod.outlook.com (2603:10a6:205:2::38)
 by AM6PR08MB5272.eurprd08.prod.outlook.com (2603:10a6:20b:ec::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.21; Tue, 15 Oct
 2019 11:00:20 +0000
Received: from VE1EUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::206) by AM4PR08CA0067.outlook.office365.com
 (2603:10a6:205:2::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.16 via Frontend
 Transport; Tue, 15 Oct 2019 11:00:20 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT009.mail.protection.outlook.com (10.152.18.92) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Tue, 15 Oct 2019 11:00:18 +0000
Received: ("Tessian outbound 3fba803f6da3:v33");
 Tue, 15 Oct 2019 11:00:12 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 97bb444ab06e9fc6
X-CR-MTA-TID: 64aa7808
Received: from e8ec66aa6b36.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.2.51]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6D5FDF9E-E1B6-465F-9FE5-CB1B84FC618E.1; 
 Tue, 15 Oct 2019 11:00:07 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2051.outbound.protection.outlook.com [104.47.2.51])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e8ec66aa6b36.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 15 Oct 2019 11:00:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j8V3xhc3jJ/w2SzGKYaQnRJ30wnzDmPjZpqXm25Gebw/1VCJnTEcCIBKvXahqpb2tHGAzUXpbAw+6drejAIdGieNoQlUiglgazjiym9k4Rfx3ikMrU808lemLvKQFjYzrRyKseng+W+xribcrbKDjdxRp9E7gwOsIEzO0KtswkeSCHHI/WJki+iDkbbV/+uxVXRNtPH2OLsQNz3THE7VJp/QbyqboRng6PAZb27GeJ3Og8RKzqBQE215t1CywAGZNSMUVukQZ9wToEmxL3U0LJGjZOIbQzXYu5Acq3iPTJrqE2mmfZJ1a01K7Ge+e3Pw1Rw5qbu9Dqq+jzQTWLNjeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VYyBqhKxFW5041qLOlY+lX3EJGvwA8fCFNeZ+Ubc0AU=;
 b=HaQQT0pLUPPYOx5KIPJyXgP4w2ynnpHYHyvaYMH7HorbttdJvuLT5LxshLsB3JoHNHehaokRkEJgM/AX4uW/FY4i0Pjpxg2qqxfnUyP9/bLV0rNWSZxfz2TzdVg+eDlCIGtRQ2fPoYzilu7vYuB9izjlitZQqL+/3Kh2QakEMA88iCNiuoFLSHn7q/+RHKy4TlPwyseNmQ+K93QE3cGy3zwFDd4ZHrQE3CWlnVMBvg9Q1f7OcdvQJBS6jocEzeKhd6/wdloVHBMFA0XKllzMBDcqbXQd1r60SW3ykgs6ZvfW/CAF63j7Pb2HjHvDnj0csBWdwNVbI/aDPfYo359iEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB3117.eurprd08.prod.outlook.com (52.133.13.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Tue, 15 Oct 2019 11:00:02 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::7d25:d1f2:e3eb:868b]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::7d25:d1f2:e3eb:868b%6]) with mapi id 15.20.2347.023; Tue, 15 Oct 2019
 11:00:01 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
Subject: [PATCH] drm/komeda: Dump SC_ENH_* registers from scaler block
Thread-Topic: [PATCH] drm/komeda: Dump SC_ENH_* registers from scaler block
Thread-Index: AQHVg0exxDUkact8DUWV7vjAi8CRug==
Date: Tue, 15 Oct 2019 11:00:01 +0000
Message-ID: <20191015105936.50039-1-mihail.atanassov@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.49]
x-clientproxiedby: AM3PR05CA0118.eurprd05.prod.outlook.com
 (2603:10a6:207:2::20) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
x-mailer: git-send-email 2.23.0
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: ba9fbbcb-0a81-4785-0065-08d7515eddfa
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: VI1PR08MB3117:|VI1PR08MB3117:|AM6PR08MB5272:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB52727A27B90DD7F72A3B61688F930@AM6PR08MB5272.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:261;OLM:261;
x-forefront-prvs: 01917B1794
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(979002)(4636009)(346002)(396003)(376002)(366004)(136003)(39860400002)(189003)(199004)(2616005)(52116002)(476003)(86362001)(316002)(5660300002)(6436002)(6486002)(66066001)(6512007)(3846002)(6116002)(99286004)(186003)(102836004)(54906003)(26005)(14454004)(256004)(14444005)(71200400001)(71190400001)(386003)(6506007)(486006)(44832011)(1076003)(305945005)(25786009)(7736002)(1671002)(478600001)(8676002)(81166006)(8936002)(36756003)(81156014)(66556008)(66476007)(64756008)(66946007)(66446008)(4326008)(109986005)(2906002)(50226002)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3117;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 4hZBVsYCMYP99HlfrO5ivZ6Dv0ilc6Gjx201wOF3qqU74hrPFRwDP1bj/6PjKtWD1zp1C/W83GAdz64RwJb5kcmhLuu9JYL1i/LVBM0yQ4/Ppg4t3O2Yztv4Rw5ELw9fyAtzgxJkpxU2k9Ui4ijlwi1PA6Axxq+YSIwErF4y7wMTvzESuLSE4B5f4Z8QEJOprVSUHhpaGYp3q7m9lSIFFLSd27capwj1cqFXt8Qx5NQgUC9EsYc56Z20kdd8cbm4S9GQt1P87kbuTOKaNedNzr8f0sWAFH5eMimTwHEllOf+y8WIWZ9hxFKJHuBYrVEScb24tvDUPbS2RZC655Cth6RcSC//8rrlWKMwqeuQ6VTiktamgLx0EvPJpf+vxE21B88kZMI61Ftq8cjWq9YLS7CxWFwzqTFymyzxxqYvPlI=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3117
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(979002)(4636009)(39860400002)(346002)(396003)(136003)(376002)(189003)(199004)(1671002)(36756003)(70586007)(36906005)(54906003)(316002)(50226002)(47776003)(70206006)(107886003)(109986005)(102836004)(22756006)(356004)(6506007)(26005)(7736002)(186003)(14454004)(76130400001)(386003)(336012)(23756003)(66066001)(14444005)(99286004)(305945005)(26826003)(6512007)(63350400001)(1076003)(478600001)(4326008)(2906002)(8676002)(126002)(8746002)(25786009)(6116002)(3846002)(2616005)(476003)(81156014)(5660300002)(50466002)(486006)(6486002)(86362001)(81166006)(8936002)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB5272;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 29ac9219-f59c-45bc-2853-08d7515ed398
NoDisclaimer: True
X-Forefront-PRVS: 01917B1794
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dWeloFiTiOI1Wpodhhn+2fO9Zpx69osKRiIiIAFy0NiE40UB3fO+J8DXO6H3SH3KfoOoMs959VRJDtoM4hVmZrFkjM/c8FL2donx9wVTvwDVi52z6T3DUy5/WmT9BPzUAq/OM5nZDXnvm/rX93zindCeL+oJ0m4mSBlbHa3sj/kurH1vZ6sPFmtsTOnJCfWfs1bCaD93dG0KoCRxuearnMxv025ATBW5TbU5N4+g9g8PqxDAGBaQQqdqYB8d/bHlN8v7WJNdYgDuOgz/tWKqf5at/lTTHtPIfCfKHZ2RV7AGif1fQ9U0L8774xZXQgx7U7FAMA4Uo/1DcEik8zSll8Z9qrDeEdbItf5KxgElWY2gA4aujJPghFkm90lLz5oZX0xZLzWQGSdZ5xYxXnNLVjHzHG8uW4p5kpblQQb3/ak=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2019 11:00:18.8068 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ba9fbbcb-0a81-4785-0065-08d7515eddfa
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5272
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VYyBqhKxFW5041qLOlY+lX3EJGvwA8fCFNeZ+Ubc0AU=;
 b=x5gklzNlVYXB0jgqLb0M1CIyS8MB2netszbbh82zLQt4mIbROCjQ1nh0Rr2/SzHFp7171pw+vRFfauURTHiV4iaxtvXVM/AZIrcocFwrkYOGWn5kEg8+lVmNs8Js4zQnAf6W8jcshkU9MD7NNk15eQhP77StUAAwEng5HBG6opE=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VYyBqhKxFW5041qLOlY+lX3EJGvwA8fCFNeZ+Ubc0AU=;
 b=x5gklzNlVYXB0jgqLb0M1CIyS8MB2netszbbh82zLQt4mIbROCjQ1nh0Rr2/SzHFp7171pw+vRFfauURTHiV4iaxtvXVM/AZIrcocFwrkYOGWn5kEg8+lVmNs8Js4zQnAf6W8jcshkU9MD7NNk15eQhP77StUAAwEng5HBG6opE=
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
Cc: Mihail Atanassov <Mihail.Atanassov@arm.com>,
 David Airlie <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>, nd <nd@arm.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2lnbmVkLW9mZi1ieTogTWloYWlsIEF0YW5hc3NvdiA8bWloYWlsLmF0YW5hc3NvdkBhcm0uY29t
PgotLS0KIC4uLi9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9kNzEvZDcxX2NvbXBvbmVudC5j
IHwgMTQgKysrKysrKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tv
bWVkYS9kNzEvZDcxX2NvbXBvbmVudC5jIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tv
bWVkYS9kNzEvZDcxX2NvbXBvbmVudC5jCmluZGV4IGMzZDI5YzBiMDUxYi4uNzI1MmZjMzg3ZmJh
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFf
Y29tcG9uZW50LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9kNzEv
ZDcxX2NvbXBvbmVudC5jCkBAIC03MDMsNyArNzAzLDcgQEAgc3RhdGljIHZvaWQgZDcxX3NjYWxl
cl91cGRhdGUoc3RydWN0IGtvbWVkYV9jb21wb25lbnQgKmMsCiAKIHN0YXRpYyB2b2lkIGQ3MV9z
Y2FsZXJfZHVtcChzdHJ1Y3Qga29tZWRhX2NvbXBvbmVudCAqYywgc3RydWN0IHNlcV9maWxlICpz
ZikKIHsKLQl1MzIgdls5XTsKKwl1MzIgdlsxMF07CiAKIAlkdW1wX2Jsb2NrX2hlYWRlcihzZiwg
Yy0+cmVnKTsKIApAQCAtNzIzLDYgKzcyMywxOCBAQCBzdGF0aWMgdm9pZCBkNzFfc2NhbGVyX2R1
bXAoc3RydWN0IGtvbWVkYV9jb21wb25lbnQgKmMsIHN0cnVjdCBzZXFfZmlsZSAqc2YpCiAJc2Vx
X3ByaW50ZihzZiwgIlNDX0hfREVMVEFfUEg6XHRcdDB4JVhcbiIsIHZbNl0pOwogCXNlcV9wcmlu
dGYoc2YsICJTQ19WX0lOSVRfUEg6XHRcdDB4JVhcbiIsIHZbN10pOwogCXNlcV9wcmludGYoc2Ys
ICJTQ19WX0RFTFRBX1BIOlx0XHQweCVYXG4iLCB2WzhdKTsKKworCWdldF92YWx1ZXNfZnJvbV9y
ZWcoYy0+cmVnLCAweDEzMCwgMTAsIHYpOworCXNlcV9wcmludGYoc2YsICJTQ19FTkhfTElNSVRT
Olx0XHQweCVYXG4iLCB2WzBdKTsKKwlzZXFfcHJpbnRmKHNmLCAiU0NfRU5IX0NPRUZGMDpcdFx0
MHglWFxuIiwgdlsxXSk7CisJc2VxX3ByaW50ZihzZiwgIlNDX0VOSF9DT0VGRjE6XHRcdDB4JVhc
biIsIHZbMl0pOworCXNlcV9wcmludGYoc2YsICJTQ19FTkhfQ09FRkYyOlx0XHQweCVYXG4iLCB2
WzNdKTsKKwlzZXFfcHJpbnRmKHNmLCAiU0NfRU5IX0NPRUZGMzpcdFx0MHglWFxuIiwgdls0XSk7
CisJc2VxX3ByaW50ZihzZiwgIlNDX0VOSF9DT0VGRjQ6XHRcdDB4JVhcbiIsIHZbNV0pOworCXNl
cV9wcmludGYoc2YsICJTQ19FTkhfQ09FRkY1Olx0XHQweCVYXG4iLCB2WzZdKTsKKwlzZXFfcHJp
bnRmKHNmLCAiU0NfRU5IX0NPRUZGNjpcdFx0MHglWFxuIiwgdls3XSk7CisJc2VxX3ByaW50Zihz
ZiwgIlNDX0VOSF9DT0VGRjc6XHRcdDB4JVhcbiIsIHZbOF0pOworCXNlcV9wcmludGYoc2YsICJT
Q19FTkhfQ09FRkY4Olx0XHQweCVYXG4iLCB2WzldKTsKIH0KIAogc3RhdGljIGNvbnN0IHN0cnVj
dCBrb21lZGFfY29tcG9uZW50X2Z1bmNzIGQ3MV9zY2FsZXJfZnVuY3MgPSB7Ci0tIAoyLjIzLjAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
