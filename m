Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB00DF387
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2019 18:47:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96BA66E186;
	Mon, 21 Oct 2019 16:47:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03on062a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe09::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4CEA6E186
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 16:47:31 +0000 (UTC)
Received: from AM6PR08CA0046.eurprd08.prod.outlook.com (2603:10a6:20b:c0::34)
 by VI1PR08MB3086.eurprd08.prod.outlook.com (2603:10a6:803:46::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2367.24; Mon, 21 Oct
 2019 16:47:27 +0000
Received: from AM5EUR03FT052.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::203) by AM6PR08CA0046.outlook.office365.com
 (2603:10a6:20b:c0::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2367.21 via Frontend
 Transport; Mon, 21 Oct 2019 16:47:27 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT052.mail.protection.outlook.com (10.152.17.161) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.23 via Frontend Transport; Mon, 21 Oct 2019 16:47:26 +0000
Received: ("Tessian outbound 3fba803f6da3:v33");
 Mon, 21 Oct 2019 16:47:26 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d78833cbaa10bce8
X-CR-MTA-TID: 64aa7808
Received: from eb75fcf24e5c.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.9.50]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A2E6B801-A93A-4E86-9164-10572C3BB85B.1; 
 Mon, 21 Oct 2019 16:47:21 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2050.outbound.protection.outlook.com [104.47.9.50])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id eb75fcf24e5c.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 21 Oct 2019 16:47:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WSQV9/h+1vdCTNaSAmAUORQjM4SNA/f4gta6Znaorvr2GMCSiESLOjTk8uuo+ZBgfZG9K3XlWScusJsUoP4gcJK/mgOGzouU825OnkgatzYLMi0MdEQyFM8YOwJ0p4Wqz4QN3f0zY+z2+Teq1zXRQPF1qn5K0V0VFgneWaccbLvjfp3IcBoaUzrHK4M8ONrfdd5jQETOYlwqZySm2YXG/zgVJziKBQSQiO33fuvNMbBWGahCsKRgWFmtlAaE6hthJe8Ukp80HV/MsJIcoIBElvihmPfOGj+qFZ0Wx3IOcVb9UM9+G/HG7wwePVrQ53zWXMKu6jOyoXnxPiAFoOvOPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q3V9noWMBRpfRoY49oT6UDQXbQXYaQlVevKp/l4BnO0=;
 b=UXStiOLzEU+PCSEQTa+8ZrA1SLE60sLUdMDhvIEkx0XWRc+heWOKzt6OjoHhu4oLFr66XUWVbYWge2JqB/jd7PJib78+aqpsi9StqYPg2nRLV8AlS0RMbQD0l5hB0TMKfb1ZQKENzAsLGLd9fIw57F4e7JLBi8DMAFG9GWQdP/t1cpm0sG8eBG010sKLsY0rHvOJgZXnPHWKaF9vEmOP3HER6adXRmmdKoEIy7w9NZLrzccSZL8ISUegJr/5ElwJR/CHMol/Pi4bVDk2YoxdPIgUvLKGqc0aluGpu2JMLWxBgd58OeijxOVLyFlfufcaY3L0pAe8kzPKHpW7stl5mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB3693.eurprd08.prod.outlook.com (20.178.13.153) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.18; Mon, 21 Oct 2019 16:47:19 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::7d25:d1f2:e3eb:868b]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::7d25:d1f2:e3eb:868b%6]) with mapi id 15.20.2367.022; Mon, 21 Oct 2019
 16:47:19 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/5] drm/komeda: Remove CONFIG_KOMEDA_ERROR_PRINT
Thread-Topic: [PATCH 2/5] drm/komeda: Remove CONFIG_KOMEDA_ERROR_PRINT
Thread-Index: AQHViC80o3rsgkgVM0CzSwA5fpvmTw==
Date: Mon, 21 Oct 2019 16:47:19 +0000
Message-ID: <20191021164654.9642-3-mihail.atanassov@arm.com>
References: <20191021164654.9642-1-mihail.atanassov@arm.com>
In-Reply-To: <20191021164654.9642-1-mihail.atanassov@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.51]
x-clientproxiedby: LO2P123CA0003.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::15) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
x-mailer: git-send-email 2.23.0
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 13b43450-07fb-4585-522b-08d756465afd
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: VI1PR08MB3693:|VI1PR08MB3693:|VI1PR08MB3086:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VI1PR08MB30868A8340372143F739EE6A8F690@VI1PR08MB3086.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:1051;OLM:1051;
x-forefront-prvs: 0197AFBD92
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(366004)(396003)(346002)(39860400002)(199004)(189003)(11346002)(6436002)(316002)(54906003)(256004)(8936002)(6512007)(14444005)(2501003)(71200400001)(5640700003)(71190400001)(50226002)(486006)(2906002)(446003)(6486002)(2616005)(44832011)(5660300002)(8676002)(476003)(305945005)(66066001)(36756003)(86362001)(25786009)(14454004)(186003)(478600001)(6506007)(386003)(102836004)(26005)(4326008)(2351001)(81156014)(1076003)(6116002)(3846002)(66946007)(81166006)(66556008)(52116002)(66476007)(7736002)(64756008)(66446008)(99286004)(76176011)(6916009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3693;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: g3WiCLgsbKoApXfA2UA3urdyAfQO0BPdci21FtjmX9GR0cbejAqeM+sQJhbcqaIewfSyd2OO96h18P9RcsbWct17rcL738xILGF4nFYVEr2zWCAFGGEvWn9eLhWvkbYWW0LmsPt6opAySot00T0juxDLIHXMke2bqakOjznrLL7oMEnGGlwqE47utRv1V18uLvVxLUxK5T7G0IwfHMzGZ4wAu3CnUHOamfWHoa3Jo+Zdi77WvYVxpZlwr06WstOGy2Qo/Hccg620naUQRxhsv0DQD8zBTwIEy9dTsC7D/LFRa1lmEyuVYnRhpzZhWHWaagdjkgShuRu773xd85JdcXCkuFnpOkEFWPxAk2hSy46gZlEZiciQI57EN6Gpx5EGULUN8/woDMJHMjhj/Xrat2MJKTYqGoOWn3kGEmb7hK9RkAAmq1Wys71BZQdo21K7
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3693
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(346002)(396003)(39860400002)(199004)(189003)(6486002)(6116002)(3846002)(14454004)(356004)(478600001)(26826003)(76130400001)(70206006)(2501003)(70586007)(54906003)(6916009)(5640700003)(316002)(36906005)(25786009)(2351001)(186003)(2616005)(476003)(126002)(486006)(336012)(63350400001)(11346002)(446003)(6506007)(86362001)(23756003)(107886003)(14444005)(2906002)(4326008)(7736002)(6512007)(99286004)(102836004)(305945005)(26005)(76176011)(386003)(8676002)(50466002)(81166006)(8746002)(8936002)(1076003)(81156014)(50226002)(22756006)(47776003)(5660300002)(36756003)(66066001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3086;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 7fd0f2a2-b54f-4f90-6dbb-08d75646566f
NoDisclaimer: True
X-Forefront-PRVS: 0197AFBD92
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RJqYo2GdydQ9hG/egQojtX1sRqO0NPeQAdttKsdHVNxooAGzbZaxE4Iwjvs0/iO++44MV+qMoCNyuf+p4Uu8agVMcDwgsTzO/cu5MyILX1RwXNM/g+96HnFMvV7yEO04HqABwlp4uAbodQVAMTHcv7cbBjMFOrhMhgoCVBkuAahiTF/fpSF/7Jsffwv7LBBpsRzijjcx+wTQDjfiOsMaTHFGlhP/5jLgl7ZP+tHcfvB5AIvcjtQzleRm6cN9LRhpQpHX2KMwqsSMNC2Ysu+rULUyvoi4Ry6/VvLVdnRPX2C2/CBKAT5wlTUrIfB0MO+33ThS9kafFFl6Ga8S/kPkE/aTJix/XHUNSJohwhqwH5RHG36fl/n6OB4qqiuvGF9kq9Qr/bGSenozxkOGPoXBfGFMiYzpkfIBpxgJjtPJTLcBgnYme7UCtb4a37yVLTUk
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2019 16:47:26.9904 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 13b43450-07fb-4585-522b-08d756465afd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3086
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q3V9noWMBRpfRoY49oT6UDQXbQXYaQlVevKp/l4BnO0=;
 b=YFPZF0bEjsvnl8jGivdvohf2ST2CFTc8CeOWpirnDyQMIcHOuQBArHvCNmL2/Mb3Qv5Rqb8IsUG1s7bjZJZ9l5vjcAr8R/pRdmoTnrXd9updP3JNx42i7n2pHb9varxHiLokq6g7rh+jJqTCoog8Q2RH/G9xYGqnch2zTYmvSZA=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q3V9noWMBRpfRoY49oT6UDQXbQXYaQlVevKp/l4BnO0=;
 b=YFPZF0bEjsvnl8jGivdvohf2ST2CFTc8CeOWpirnDyQMIcHOuQBArHvCNmL2/Mb3Qv5Rqb8IsUG1s7bjZJZ9l5vjcAr8R/pRdmoTnrXd9updP3JNx42i7n2pHb9varxHiLokq6g7rh+jJqTCoog8Q2RH/G9xYGqnch2zTYmvSZA=
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
 "james qian wang \(Arm
 Technology China\)" <james.qian.wang@arm.com>, "Lowry Li \(Arm Technology
 China\)" <Lowry.Li@arm.com>, nd <nd@arm.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm93IHRoYXQgdGhlcmUncyBhIGRlYnVnZnMgbm9kZSB0byBjb250cm9sIHRoZSBzYW1lLCByZW1v
dmUgdGhlCmNvbmZpZyBvcHRpb24uCgpTaWduZWQtb2ZmLWJ5OiBNaWhhaWwgQXRhbmFzc292IDxt
aWhhaWwuYXRhbmFzc292QGFybS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5
L0tjb25maWcgICAgICAgICAgICAgfCA2IC0tLS0tLQogZHJpdmVycy9ncHUvZHJtL2FybS9kaXNw
bGF5L2tvbWVkYS9NYWtlZmlsZSAgICAgfCA1ICsrLS0tCiBkcml2ZXJzL2dwdS9kcm0vYXJtL2Rp
c3BsYXkva29tZWRhL2tvbWVkYV9kZXYuaCB8IDYgLS0tLS0tCiAzIGZpbGVzIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKSwgMTUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FybS9kaXNwbGF5L0tjb25maWcgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkvS2Nv
bmZpZwppbmRleCBlODdmZjg2MjMwNzYuLmNlYzA2MzllM2FhMSAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FybS9kaXNwbGF5L0tjb25maWcKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9k
aXNwbGF5L0tjb25maWcKQEAgLTEyLDkgKzEyLDMgQEAgY29uZmlnIERSTV9LT01FREEKIAkgIFBy
b2Nlc3NvciBkcml2ZXIuIEl0IHN1cHBvcnRzIHRoZSBENzEgdmFyaWFudHMgb2YgdGhlIGhhcmR3
YXJlLgogCiAJICBJZiBjb21waWxlZCBhcyBhIG1vZHVsZSBpdCB3aWxsIGJlIGNhbGxlZCBrb21l
ZGEuCi0KLWNvbmZpZyBEUk1fS09NRURBX0VSUk9SX1BSSU5UCi0JYm9vbCAiRW5hYmxlIGtvbWVk
YSBlcnJvciBwcmludCIKLQlkZXBlbmRzIG9uIERSTV9LT01FREEKLQloZWxwCi0JICBDaG9vc2Ug
dGhpcyBvcHRpb24gdG8gZW5hYmxlIGVycm9yIHByaW50aW5nLgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9NYWtlZmlsZSBiL2RyaXZlcnMvZ3B1L2RybS9h
cm0vZGlzcGxheS9rb21lZGEvTWFrZWZpbGUKaW5kZXggZjA5NWExYzY4YWM3Li4xOTMxYTdmYTFh
MTQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEvTWFrZWZp
bGUKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9NYWtlZmlsZQpAQCAt
MTYsMTIgKzE2LDExIEBAIGtvbWVkYS15IDo9IFwKIAlrb21lZGFfY3J0Yy5vIFwKIAlrb21lZGFf
cGxhbmUubyBcCiAJa29tZWRhX3diX2Nvbm5lY3Rvci5vIFwKLQlrb21lZGFfcHJpdmF0ZV9vYmou
bworCWtvbWVkYV9wcml2YXRlX29iai5vIFwKKwlrb21lZGFfZXZlbnQubwogCiBrb21lZGEteSAr
PSBcCiAJZDcxL2Q3MV9kZXYubyBcCiAJZDcxL2Q3MV9jb21wb25lbnQubwogCi1rb21lZGEtJChD
T05GSUdfRFJNX0tPTUVEQV9FUlJPUl9QUklOVCkgKz0ga29tZWRhX2V2ZW50Lm8KLQogb2JqLSQo
Q09ORklHX0RSTV9LT01FREEpICs9IGtvbWVkYS5vCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYuaCBiL2RyaXZlcnMvZ3B1L2RybS9hcm0v
ZGlzcGxheS9rb21lZGEva29tZWRhX2Rldi5oCmluZGV4IGI1YmQzZDU4OThlZS4uODMxYzM3NTE4
MGY4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVk
YV9kZXYuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9k
ZXYuaApAQCAtMjI2LDEzICsyMjYsNyBAQCB2b2lkIGtvbWVkYV9kZXZfZGVzdHJveShzdHJ1Y3Qg
a29tZWRhX2RldiAqbWRldik7CiAKIHN0cnVjdCBrb21lZGFfZGV2ICpkZXZfdG9fbWRldihzdHJ1
Y3QgZGV2aWNlICpkZXYpOwogCi0jaWZkZWYgQ09ORklHX0RSTV9LT01FREFfRVJST1JfUFJJTlQK
IHZvaWQga29tZWRhX3ByaW50X2V2ZW50cyhzdHJ1Y3Qga29tZWRhX2V2ZW50cyAqZXZ0cywgc3Ry
dWN0IGRybV9kZXZpY2UgKmRldik7Ci0jZWxzZQotc3RhdGljIGlubGluZSB2b2lkIGtvbWVkYV9w
cmludF9ldmVudHMoc3RydWN0IGtvbWVkYV9ldmVudHMgKmV2dHMsCi0JCQkJICAgICAgIHN0cnVj
dCBkcm1fZGV2aWNlICpkZXYpCi17fQotI2VuZGlmCiAKIGludCBrb21lZGFfZGV2X3Jlc3VtZShz
dHJ1Y3Qga29tZWRhX2RldiAqbWRldik7CiBpbnQga29tZWRhX2Rldl9zdXNwZW5kKHN0cnVjdCBr
b21lZGFfZGV2ICptZGV2KTsKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
