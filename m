Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D28109CA6
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 11:54:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FF266E2E9;
	Tue, 26 Nov 2019 10:54:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02on0625.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe05::625])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72E996E2E9
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2019 10:54:53 +0000 (UTC)
Received: from VI1PR08CA0267.eurprd08.prod.outlook.com (2603:10a6:803:dc::40)
 by AM6PR08MB4737.eurprd08.prod.outlook.com (2603:10a6:20b:cc::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.16; Tue, 26 Nov
 2019 10:54:50 +0000
Received: from AM5EUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::203) by VI1PR08CA0267.outlook.office365.com
 (2603:10a6:803:dc::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.17 via Frontend
 Transport; Tue, 26 Nov 2019 10:54:50 +0000
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT015.mail.protection.outlook.com (10.152.16.132) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.17 via Frontend Transport; Tue, 26 Nov 2019 10:54:49 +0000
Received: ("Tessian outbound dbe0f0961e8c:v33");
 Tue, 26 Nov 2019 10:54:48 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d80a95215e049f5c
X-CR-MTA-TID: 64aa7808
Received: from c84123d83267.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.12.54]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3AB1782E-47AE-4F93-ACF0-949591FDC2A4.1; 
 Tue, 26 Nov 2019 10:54:43 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2054.outbound.protection.outlook.com [104.47.12.54])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c84123d83267.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 26 Nov 2019 10:54:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dkji1v1g0lVPo6F4IjN1CLfVCHoPcizwTWJ3CDCYTKZQjdRPWe+5sGC9tC96R8aq+UoFS52v1smnQblM5XZibAYP1cFVB9mJJIIruh8sC5iiLZE3elC54t/UoyXwDgphBfTw6AMe/23mN703KlGQKa95SZF32LuznaRrvugR3aB244ILkwODk0w7EKIIItweG5OnuQxpjIi0g82XRg+hgLC3FZS3vuo0WhgQDL7I+xOqNmpATk1sdm7tv4qiVbGJypWgX6mx2NY55sff8PcvT2tVRC+gP7r2ZXacnG/J5+wunzjnfDSMRyP7Ohxud1/pGiSrmKpZ7bQ/bWJykyxUQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5sOo+nWrgd3smlitn5MAGdRnsVHO2u3YzHIXLXG2r68=;
 b=C21DLbmV0IafkAoacPnp8H0pJ1dXhKPkdlPwQh3Ld803OqKJWL05AvO8iBb33kEDjtpF16A4La2bF/8EwVR3KyJUQOYGlKpxlxv+OuW/DFz2ZyDU0YdowjT4KWltIzQRo9NAlhfRSxffqNrnhvoqKZLyayw6eVTKZr2WJsCel5LKBq7WX44eHLlKn1oXH9/jjH8LFExqQSdLjG+q6O5hO76DxlKM0mLXRKjV7MrUnWEiMtIlxTb2LJDoEioQ83RVr/6Ifn9gcjkg/ThtqgylGF3dSoYOBUVBSPo8iFrbvOJoxzHlK0VvUDbqp4nbgwIBxXgfPd3V/fVzQn/aiy0prg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4703.eurprd08.prod.outlook.com (10.255.27.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.21; Tue, 26 Nov 2019 10:54:41 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a809:417a:faf3:61a7]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a809:417a:faf3:61a7%6]) with mapi id 15.20.2474.023; Tue, 26 Nov 2019
 10:54:41 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "airlied@linux.ie" <airlied@linux.ie>, 
 Brian Starkey <Brian.Starkey@arm.com>, Mihail Atanassov
 <Mihail.Atanassov@arm.com>
Subject: [PATCH v1 1/2] drm/komeda: Add a new file komeda_sysfs.c
Thread-Topic: [PATCH v1 1/2] drm/komeda: Add a new file komeda_sysfs.c
Thread-Index: AQHVpEfnhh6q9tR5rkGokNkWSivwvA==
Date: Tue, 26 Nov 2019 10:54:41 +0000
Message-ID: <20191126105412.5978-2-james.qian.wang@arm.com>
References: <20191126105412.5978-1-james.qian.wang@arm.com>
In-Reply-To: <20191126105412.5978-1-james.qian.wang@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR0302CA0010.apcprd03.prod.outlook.com
 (2603:1096:202::20) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c6e03f5d-92f8-4d07-d803-08d7725f0f38
X-MS-TrafficTypeDiagnostic: VE1PR08MB4703:|VE1PR08MB4703:|AM6PR08MB4737:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4737168D6AAE8897709F4EA9B3450@AM6PR08MB4737.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:949;OLM:949;
x-forefront-prvs: 0233768B38
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(376002)(366004)(396003)(136003)(199004)(189003)(14444005)(2616005)(6436002)(71190400001)(71200400001)(50226002)(446003)(6486002)(11346002)(3846002)(6116002)(103116003)(36756003)(5660300002)(7736002)(6512007)(1076003)(305945005)(66476007)(66946007)(99286004)(66446008)(64756008)(66556008)(102836004)(8676002)(66066001)(86362001)(76176011)(54906003)(81166006)(81156014)(52116002)(110136005)(316002)(2501003)(14454004)(478600001)(186003)(26005)(25786009)(4326008)(386003)(6506007)(6636002)(8936002)(55236004)(2906002)(256004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4703;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: DOgFdZlhjySEZM+eQqj6/MSHMdQ6PC/ddtVCGJWZAIRrpV6PXxUe9GC2dn1whfEAmWxeH9oHzSM/urnbamBBsFTm5oApZJq/TH/MDFg1bslgZa1XKr5RinMHXiJakU0oP4lJGmRrmh70lq8OPSdbQo4+fVwvG2q3kXoAg2Ts8I0ln4tmLn3vX705H/RSi1dEVStBlxON0f/lWVBFywHtO+xqp27443EghE3/wrcN91uRIJ5YT08HZpsYPtvddaZlQxwjcs6g1Jbl0mUNk0MbIKa3LJZmW7PnRUGgGlqNGXX/CAXKMeKTLeiGmVu+2suMN4tKGMR7+tHwBPm4WENvtbuRbnMvRP0e+DnGAci02oq9FgjqT3XmWzwtl6gg3XPjpDWJ4vbbqPVBWHt3JH309GdWM4rK/A5ti0aefKoVPFgZwnhqVyGIF4uA904ZOY8+
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4703
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(346002)(136003)(376002)(189003)(199004)(2501003)(386003)(2616005)(8936002)(70586007)(50226002)(70206006)(81156014)(81166006)(8746002)(54906003)(110136005)(50466002)(5660300002)(2906002)(6486002)(316002)(66066001)(36906005)(14444005)(8676002)(26005)(22756006)(1076003)(36756003)(14454004)(99286004)(3846002)(6116002)(47776003)(446003)(11346002)(305945005)(25786009)(106002)(478600001)(26826003)(336012)(6506007)(103116003)(23756003)(4326008)(76130400001)(6636002)(76176011)(7736002)(186003)(102836004)(6512007)(356004)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB4737;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 5e6dc417-ceff-4a26-0166-08d7725f0a1f
NoDisclaimer: True
X-Forefront-PRVS: 0233768B38
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Goz8qQ3VE4gvxuaDf75WN84KzhL3l+sC+fgDeDpy4HXSxyqQP0l4iGI3h5YizG8pwYBVrQcC4AYf8t3wiA2/f8Dm9d3vaSOtRiwEDx8PaADSEW23uLBU9B6RmGgA4Di17Z1fuV97VVvIPPpNwMhZ0pw/CJEAMpw2sD5HY69eydv01AqtF13Ebx1o3hGrmR4tERN2UIWLHVfpwY2G52dYethtx5s5Ybci6M0w+ijJE4ItA8/Qd5+3aM/uzLR28iMtrcrLRaaEZWlCi0f9TC1foBwFbzLigUdTM58UG522UtdC0PchYbJZLyirEf3xyGrbnlXcDycGEyhJQME/qlS0uG/FAav11z7drfSm1JoUekPUehx33f1cDL+cGLdaux1gRM1UGRBP4hIZD8NKvUhxPEk+oA2gjPhSyqGYgw8jlKdBrlDZFF54Yb7p597n7sGj
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2019 10:54:49.8407 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6e03f5d-92f8-4d07-d803-08d7725f0f38
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4737
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5sOo+nWrgd3smlitn5MAGdRnsVHO2u3YzHIXLXG2r68=;
 b=u9kQXAHsmzWHLnZMInFuCHp5fxiMqnB3LdE5G0E5B3hdN9xZPYwuMaSedcipC1fKfRYg0dvzBvqxtOpOlcQvvuFx+XH2fSYG1rtNmUrS7UFzKTPsrLXjmxr4nRoZ4k1A8PAxSQhK5D9rXOB2USWuZArlsLwwfVRHHip2v0Y/ocg=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5sOo+nWrgd3smlitn5MAGdRnsVHO2u3YzHIXLXG2r68=;
 b=u9kQXAHsmzWHLnZMInFuCHp5fxiMqnB3LdE5G0E5B3hdN9xZPYwuMaSedcipC1fKfRYg0dvzBvqxtOpOlcQvvuFx+XH2fSYG1rtNmUrS7UFzKTPsrLXjmxr4nRoZ4k1A8PAxSQhK5D9rXOB2USWuZArlsLwwfVRHHip2v0Y/ocg=
X-Mailman-Original-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
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
Cc: nd <nd@arm.com>, "Oscar
 Zhang \(Arm Technology China\)" <Oscar.Zhang@arm.com>,
 "Tiannan Zhu \(Arm Technology China\)" <Tiannan.Zhu@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Julien
 Yin \(Arm Technology China\)" <Julien.Yin@arm.com>, "Channing Chen \(Arm
 Technology China\)" <Channing.Chen@arm.com>, "james qian wang \(Arm Technology
 China\)" <james.qian.wang@arm.com>, "Thomas Sun \(Arm Technology
 China\)" <thomas.Sun@arm.com>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>,
 Ben Davis <Ben.Davis@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogIkphbWVzIFFpYW4gV2FuZyAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIiA8amFtZXMucWlh
bi53YW5nQGFybS5jb20+CgpBZGQgYSBuZXcgZmlsZSBrb21lZGFfc3lzZnMuYyBhbmQgbW92ZSBh
bGwgc3lzZnMgcmVsYXRlZCBjb2RlIHRvIGl0LgoKU2lnbmVkLW9mZi1ieTogSmFtZXMgUWlhbiBX
YW5nIChBcm0gVGVjaG5vbG9neSBDaGluYSkgPGphbWVzLnFpYW4ud2FuZ0Bhcm0uY29tPgotLS0K
IGRyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEvTWFrZWZpbGUgICB8ICAxICsKIC4u
Li9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZGV2LmMgICB8IDYxICstLS0tLS0t
LS0tLS0tCiAuLi4vZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rldi5oICAgfCAg
MyArCiAuLi4vZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3N5c2ZzLmMgfCA4MSAr
KysrKysrKysrKysrKysrKysrCiA0IGZpbGVzIGNoYW5nZWQsIDg4IGluc2VydGlvbnMoKyksIDU4
IGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9hcm0vZGlz
cGxheS9rb21lZGEva29tZWRhX3N5c2ZzLmMKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YXJtL2Rpc3BsYXkva29tZWRhL01ha2VmaWxlIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5
L2tvbWVkYS9NYWtlZmlsZQppbmRleCAxOTMxYTdmYTFhMTQuLjcwNjY3NGNhNTkyOCAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9NYWtlZmlsZQorKysgYi9k
cml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL01ha2VmaWxlCkBAIC03LDYgKzcsNyBA
QCBjY2ZsYWdzLXkgOj0gXAoga29tZWRhLXkgOj0gXAogCWtvbWVkYV9kcnYubyBcCiAJa29tZWRh
X2Rldi5vIFwKKwlrb21lZGFfc3lzZnMubyBcCiAJa29tZWRhX2Zvcm1hdF9jYXBzLm8gXAogCWtv
bWVkYV9jb2xvcl9tZ210Lm8gXAogCWtvbWVkYV9waXBlbGluZS5vIFwKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rldi5jIGIvZHJpdmVycy9n
cHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZGV2LmMKaW5kZXggOGUwYmNlNDY1NTVi
Li43MzRiODhiODhkOTQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9r
b21lZGEva29tZWRhX2Rldi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21l
ZGEva29tZWRhX2Rldi5jCkBAIC02Myw1OSArNjMsNiBAQCBzdGF0aWMgdm9pZCBrb21lZGFfZGVi
dWdmc19pbml0KHN0cnVjdCBrb21lZGFfZGV2ICptZGV2KQogfQogI2VuZGlmCiAKLXN0YXRpYyBz
c2l6ZV90Ci1jb3JlX2lkX3Nob3coc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgZGV2aWNlX2F0
dHJpYnV0ZSAqYXR0ciwgY2hhciAqYnVmKQotewotCXN0cnVjdCBrb21lZGFfZGV2ICptZGV2ID0g
ZGV2X3RvX21kZXYoZGV2KTsKLQotCXJldHVybiBzbnByaW50ZihidWYsIFBBR0VfU0laRSwgIjB4
JTA4eFxuIiwgbWRldi0+Y2hpcC5jb3JlX2lkKTsKLX0KLXN0YXRpYyBERVZJQ0VfQVRUUl9STyhj
b3JlX2lkKTsKLQotc3RhdGljIHNzaXplX3QKLWNvbmZpZ19pZF9zaG93KHN0cnVjdCBkZXZpY2Ug
KmRldiwgc3RydWN0IGRldmljZV9hdHRyaWJ1dGUgKmF0dHIsIGNoYXIgKmJ1ZikKLXsKLQlzdHJ1
Y3Qga29tZWRhX2RldiAqbWRldiA9IGRldl90b19tZGV2KGRldik7Ci0Jc3RydWN0IGtvbWVkYV9w
aXBlbGluZSAqcGlwZSA9IG1kZXYtPnBpcGVsaW5lc1swXTsKLQl1bmlvbiBrb21lZGFfY29uZmln
X2lkIGNvbmZpZ19pZDsKLQlpbnQgaTsKLQotCW1lbXNldCgmY29uZmlnX2lkLCAwLCBzaXplb2Yo
Y29uZmlnX2lkKSk7Ci0KLQljb25maWdfaWQubWF4X2xpbmVfc3ogPSBwaXBlLT5sYXllcnNbMF0t
PmhzaXplX2luLmVuZDsKLQljb25maWdfaWQuc2lkZV9ieV9zaWRlID0gbWRldi0+c2lkZV9ieV9z
aWRlOwotCWNvbmZpZ19pZC5uX3BpcGVsaW5lcyA9IG1kZXYtPm5fcGlwZWxpbmVzOwotCWNvbmZp
Z19pZC5uX3NjYWxlcnMgPSBwaXBlLT5uX3NjYWxlcnM7Ci0JY29uZmlnX2lkLm5fbGF5ZXJzID0g
cGlwZS0+bl9sYXllcnM7Ci0JY29uZmlnX2lkLm5fcmljaHMgPSAwOwotCWZvciAoaSA9IDA7IGkg
PCBwaXBlLT5uX2xheWVyczsgaSsrKSB7Ci0JCWlmIChwaXBlLT5sYXllcnNbaV0tPmxheWVyX3R5
cGUgPT0gS09NRURBX0ZNVF9SSUNIX0xBWUVSKQotCQkJY29uZmlnX2lkLm5fcmljaHMrKzsKLQl9
Ci0JcmV0dXJuIHNucHJpbnRmKGJ1ZiwgUEFHRV9TSVpFLCAiMHglMDh4XG4iLCBjb25maWdfaWQu
dmFsdWUpOwotfQotc3RhdGljIERFVklDRV9BVFRSX1JPKGNvbmZpZ19pZCk7Ci0KLXN0YXRpYyBz
c2l6ZV90Ci1hY2xrX2h6X3Nob3coc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgZGV2aWNlX2F0
dHJpYnV0ZSAqYXR0ciwgY2hhciAqYnVmKQotewotCXN0cnVjdCBrb21lZGFfZGV2ICptZGV2ID0g
ZGV2X3RvX21kZXYoZGV2KTsKLQotCXJldHVybiBzbnByaW50ZihidWYsIFBBR0VfU0laRSwgIiVs
dVxuIiwgY2xrX2dldF9yYXRlKG1kZXYtPmFjbGspKTsKLX0KLXN0YXRpYyBERVZJQ0VfQVRUUl9S
TyhhY2xrX2h6KTsKLQotc3RhdGljIHN0cnVjdCBhdHRyaWJ1dGUgKmtvbWVkYV9zeXNmc19lbnRy
aWVzW10gPSB7Ci0JJmRldl9hdHRyX2NvcmVfaWQuYXR0ciwKLQkmZGV2X2F0dHJfY29uZmlnX2lk
LmF0dHIsCi0JJmRldl9hdHRyX2FjbGtfaHouYXR0ciwKLQlOVUxMLAotfTsKLQotc3RhdGljIHN0
cnVjdCBhdHRyaWJ1dGVfZ3JvdXAga29tZWRhX3N5c2ZzX2F0dHJfZ3JvdXAgPSB7Ci0JLmF0dHJz
ID0ga29tZWRhX3N5c2ZzX2VudHJpZXMsCi19OwotCiBzdGF0aWMgaW50IGtvbWVkYV9wYXJzZV9w
aXBlX2R0KHN0cnVjdCBrb21lZGFfcGlwZWxpbmUgKnBpcGUpCiB7CiAJc3RydWN0IGRldmljZV9u
b2RlICpucCA9IHBpcGUtPm9mX25vZGU7CkBAIC0yNzcsMTEgKzIyNCw5IEBAIHN0cnVjdCBrb21l
ZGFfZGV2ICprb21lZGFfZGV2X2NyZWF0ZShzdHJ1Y3QgZGV2aWNlICpkZXYpCiAKIAljbGtfZGlz
YWJsZV91bnByZXBhcmUobWRldi0+YWNsayk7CiAKLQllcnIgPSBzeXNmc19jcmVhdGVfZ3JvdXAo
JmRldi0+a29iaiwgJmtvbWVkYV9zeXNmc19hdHRyX2dyb3VwKTsKLQlpZiAoZXJyKSB7Ci0JCURS
TV9FUlJPUigiY3JlYXRlIHN5c2ZzIGdyb3VwIGZhaWxlZC5cbiIpOworCWVyciA9IGtvbWVkYV9k
ZXZfc3lzZnNfaW5pdChtZGV2KTsKKwlpZiAoZXJyKQogCQlnb3RvIGVycl9jbGVhbnVwOwotCX0K
IAogCW1kZXYtPmVycl92ZXJib3NpdHkgPSBLT01FREFfREVWX1BSSU5UX0VSUl9FVkVOVFM7CiAK
QEAgLTMwNCw3ICsyNDksNyBAQCB2b2lkIGtvbWVkYV9kZXZfZGVzdHJveShzdHJ1Y3Qga29tZWRh
X2RldiAqbWRldikKIAljb25zdCBzdHJ1Y3Qga29tZWRhX2Rldl9mdW5jcyAqZnVuY3MgPSBtZGV2
LT5mdW5jczsKIAlpbnQgaTsKIAotCXN5c2ZzX3JlbW92ZV9ncm91cCgmZGV2LT5rb2JqLCAma29t
ZWRhX3N5c2ZzX2F0dHJfZ3JvdXApOworCWtvbWVkYV9kZXZfc3lzZnNfZGVzdHJveShtZGV2KTsK
IAogI2lmZGVmIENPTkZJR19ERUJVR19GUwogCWRlYnVnZnNfcmVtb3ZlX3JlY3Vyc2l2ZShtZGV2
LT5kZWJ1Z2ZzX3Jvb3QpOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5
L2tvbWVkYS9rb21lZGFfZGV2LmggYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRh
L2tvbWVkYV9kZXYuaAppbmRleCBkYWNkYjAwMTUzZTkuLjYxODNlMGYzOTRmMCAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZGV2LmgKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZGV2LmgKQEAgLTI0OCw0
ICsyNDgsNyBAQCB2b2lkIGtvbWVkYV9wcmludF9ldmVudHMoc3RydWN0IGtvbWVkYV9ldmVudHMg
KmV2dHMsIHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpOwogaW50IGtvbWVkYV9kZXZfcmVzdW1lKHN0
cnVjdCBrb21lZGFfZGV2ICptZGV2KTsKIGludCBrb21lZGFfZGV2X3N1c3BlbmQoc3RydWN0IGtv
bWVkYV9kZXYgKm1kZXYpOwogCitpbnQga29tZWRhX2Rldl9zeXNmc19pbml0KHN0cnVjdCBrb21l
ZGFfZGV2ICptZGV2KTsKK3ZvaWQga29tZWRhX2Rldl9zeXNmc19kZXN0cm95KHN0cnVjdCBrb21l
ZGFfZGV2ICptZGV2KTsKKwogI2VuZGlmIC8qX0tPTUVEQV9ERVZfSF8qLwpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfc3lzZnMuYyBiL2RyaXZl
cnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3N5c2ZzLmMKbmV3IGZpbGUgbW9k
ZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwLi43NDBmMDk1YjRjYTUKLS0tIC9kZXYvbnVsbAor
KysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9zeXNmcy5jCkBA
IC0wLDAgKzEsODEgQEAKKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wCisvKgor
ICogKEMpIENPUFlSSUdIVCAyMDE5IEFSTSBMaW1pdGVkLiBBbGwgcmlnaHRzIHJlc2VydmVkLgor
ICogQXV0aG9yOiBKYW1lcy5RaWFuLldhbmcgPGphbWVzLnFpYW4ud2FuZ0Bhcm0uY29tPgorICoK
KyAqLworI2luY2x1ZGUgPGRybS9kcm1fcHJpbnQuaD4KKworI2luY2x1ZGUgImtvbWVkYV9kZXYu
aCIKKworc3RhdGljIHNzaXplX3QKK2NvcmVfaWRfc2hvdyhzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0
cnVjdCBkZXZpY2VfYXR0cmlidXRlICphdHRyLCBjaGFyICpidWYpCit7CisJc3RydWN0IGtvbWVk
YV9kZXYgKm1kZXYgPSBkZXZfdG9fbWRldihkZXYpOworCisJcmV0dXJuIHNucHJpbnRmKGJ1Ziwg
UEFHRV9TSVpFLCAiMHglMDh4XG4iLCBtZGV2LT5jaGlwLmNvcmVfaWQpOworfQorc3RhdGljIERF
VklDRV9BVFRSX1JPKGNvcmVfaWQpOworCitzdGF0aWMgc3NpemVfdAorY29uZmlnX2lkX3Nob3co
c3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgZGV2aWNlX2F0dHJpYnV0ZSAqYXR0ciwgY2hhciAq
YnVmKQoreworCXN0cnVjdCBrb21lZGFfZGV2ICptZGV2ID0gZGV2X3RvX21kZXYoZGV2KTsKKwlz
dHJ1Y3Qga29tZWRhX3BpcGVsaW5lICpwaXBlID0gbWRldi0+cGlwZWxpbmVzWzBdOworCXVuaW9u
IGtvbWVkYV9jb25maWdfaWQgY29uZmlnX2lkOworCWludCBpOworCisJbWVtc2V0KCZjb25maWdf
aWQsIDAsIHNpemVvZihjb25maWdfaWQpKTsKKworCWNvbmZpZ19pZC5tYXhfbGluZV9zeiA9IHBp
cGUtPmxheWVyc1swXS0+aHNpemVfaW4uZW5kOworCWNvbmZpZ19pZC5zaWRlX2J5X3NpZGUgPSBt
ZGV2LT5zaWRlX2J5X3NpZGU7CisJY29uZmlnX2lkLm5fcGlwZWxpbmVzID0gbWRldi0+bl9waXBl
bGluZXM7CisJY29uZmlnX2lkLm5fc2NhbGVycyA9IHBpcGUtPm5fc2NhbGVyczsKKwljb25maWdf
aWQubl9sYXllcnMgPSBwaXBlLT5uX2xheWVyczsKKwljb25maWdfaWQubl9yaWNocyA9IDA7CisJ
Zm9yIChpID0gMDsgaSA8IHBpcGUtPm5fbGF5ZXJzOyBpKyspIHsKKwkJaWYgKHBpcGUtPmxheWVy
c1tpXS0+bGF5ZXJfdHlwZSA9PSBLT01FREFfRk1UX1JJQ0hfTEFZRVIpCisJCQljb25maWdfaWQu
bl9yaWNocysrOworCX0KKwlyZXR1cm4gc25wcmludGYoYnVmLCBQQUdFX1NJWkUsICIweCUwOHhc
biIsIGNvbmZpZ19pZC52YWx1ZSk7Cit9CitzdGF0aWMgREVWSUNFX0FUVFJfUk8oY29uZmlnX2lk
KTsKKworc3RhdGljIHNzaXplX3QKK2FjbGtfaHpfc2hvdyhzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0
cnVjdCBkZXZpY2VfYXR0cmlidXRlICphdHRyLCBjaGFyICpidWYpCit7CisJc3RydWN0IGtvbWVk
YV9kZXYgKm1kZXYgPSBkZXZfdG9fbWRldihkZXYpOworCisJcmV0dXJuIHNucHJpbnRmKGJ1Ziwg
UEFHRV9TSVpFLCAiJWx1XG4iLCBjbGtfZ2V0X3JhdGUobWRldi0+YWNsaykpOworfQorc3RhdGlj
IERFVklDRV9BVFRSX1JPKGFjbGtfaHopOworCitzdGF0aWMgc3RydWN0IGF0dHJpYnV0ZSAqa29t
ZWRhX3N5c2ZzX2VudHJpZXNbXSA9IHsKKwkmZGV2X2F0dHJfY29yZV9pZC5hdHRyLAorCSZkZXZf
YXR0cl9jb25maWdfaWQuYXR0ciwKKwkmZGV2X2F0dHJfYWNsa19oei5hdHRyLAorCU5VTEwsCit9
OworCitzdGF0aWMgc3RydWN0IGF0dHJpYnV0ZV9ncm91cCBrb21lZGFfc3lzZnNfYXR0cl9ncm91
cCA9IHsKKwkuYXR0cnMgPSBrb21lZGFfc3lzZnNfZW50cmllcywKK307CisKK2ludCBrb21lZGFf
ZGV2X3N5c2ZzX2luaXQoc3RydWN0IGtvbWVkYV9kZXYgKm1kZXYpCit7CisJc3RydWN0IGRldmlj
ZSAqZGV2ID0gbWRldi0+ZGV2OworCWludCBlcnI7CisKKwllcnIgPSBzeXNmc19jcmVhdGVfZ3Jv
dXAoJmRldi0+a29iaiwgJmtvbWVkYV9zeXNmc19hdHRyX2dyb3VwKTsKKwlpZiAoZXJyKQorCQlE
Uk1fRVJST1IoImNyZWF0ZSBzeXNmcyBncm91cCBmYWlsZWQuXG4iKTsKKworCXJldHVybiBlcnI7
Cit9CisKK3ZvaWQga29tZWRhX2Rldl9zeXNmc19kZXN0cm95KHN0cnVjdCBrb21lZGFfZGV2ICpt
ZGV2KQoreworCXN0cnVjdCBkZXZpY2UgKmRldiA9IG1kZXYtPmRldjsKKworCXN5c2ZzX3JlbW92
ZV9ncm91cCgmZGV2LT5rb2JqLCAma29tZWRhX3N5c2ZzX2F0dHJfZ3JvdXApOworfQotLSAKMi4y
MC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
