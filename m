Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E53FE125F
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2019 08:43:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DDCD6E961;
	Wed, 23 Oct 2019 06:43:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00065.outbound.protection.outlook.com [40.107.0.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE6296E961
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 06:43:23 +0000 (UTC)
Received: from HE1PR08CA0077.eurprd08.prod.outlook.com (2603:10a6:7:2a::48) by
 AM6PR08MB4344.eurprd08.prod.outlook.com (2603:10a6:20b:74::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.21; Wed, 23 Oct 2019 06:43:21 +0000
Received: from DB5EUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::209) by HE1PR08CA0077.outlook.office365.com
 (2603:10a6:7:2a::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2387.20 via Frontend
 Transport; Wed, 23 Oct 2019 06:43:21 +0000
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT003.mail.protection.outlook.com (10.152.20.157) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.23 via Frontend Transport; Wed, 23 Oct 2019 06:43:21 +0000
Received: ("Tessian outbound 851a1162fca7:v33");
 Wed, 23 Oct 2019 06:43:18 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4494aeef9282698d
X-CR-MTA-TID: 64aa7808
Received: from 2e476b2de862.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.4.56]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 FE1A581A-5A09-4C67-8FDA-8C8499CFE212.1; 
 Wed, 23 Oct 2019 06:43:13 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2056.outbound.protection.outlook.com [104.47.4.56])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2e476b2de862.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Wed, 23 Oct 2019 06:43:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UiZtsRu3tcDx8dK5yzP9uPS0G+mH/O6j84WSSzkHnDiUg5NqclMu8WlW3TiiXCkENq15hhESFDiwdQkVDwlfXPLNA7G4bLWW19xCYNMWMlg6Yo4of9M4xv5XMhlFMmiigr4IZ/6WNjKOP/R2ZawP/3x2NK8DN+PPpAauWbmWaNlTcN+il6H+T2INfHk+tHD1xWRzyvW4MXABJt8xn6FZad5e3UNIUEA3jFkjndJGKpNh2AEVruXAhNCEGeIAbBY7JBSX4TtYYmztHn21JM9pIPeFaAbNmJCto9zkvU6QxBTDQ2bVTwXR2WRcWKb4s51nrR4dAlPBiBvfQxHtNpHSuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UvaLJ9iCW/GukE6Q6/g2aWg+NqCkBH1FlUg88c+A1ko=;
 b=FJASo0QUBUX6blRfKu4BzP+Fd6gnuWwkoLa9aodzqXrPdmTwci3BYyEaB3cMnx14gEl7RP87XOtyqZlCUsuTzAlmX97eIL5RPYqy1spQNycHUN/ugSxZKYfMrYv6Z+U9L/0xLWzBNeF1s08oMZ89oRf76X9oSCw6T0XDgEgkSUmL8jywiZJOadShlZXFTgFTj3qxABAdA+XyvL9dBL6SoQF3/+GFUOZUkOhtqNdfCZ0E/ojNm37zurSaMJwNu3EqgQB500BWVuf5Acr5lUy8JtMMPo+eVEr2/zOS/9xhOqTP3OlVA9h2rybQIxkONM5OPnA/vi/v8+X6fF/W/i5D6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB5198.eurprd08.prod.outlook.com (20.179.31.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.20; Wed, 23 Oct 2019 06:43:10 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5%3]) with mapi id 15.20.2367.022; Wed, 23 Oct 2019
 06:43:10 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "airlied@linux.ie" <airlied@linux.ie>, 
 Brian Starkey <Brian.Starkey@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "sean@poorly.run" <sean@poorly.run>, 
 "imirkin@alum.mit.edu" <imirkin@alum.mit.edu>
Subject: [PATCH v7 3/4] drm/komeda: Add drm_ctm_to_coeffs()
Thread-Topic: [PATCH v7 3/4] drm/komeda: Add drm_ctm_to_coeffs()
Thread-Index: AQHViW0iknm0f8sRVESKRsTsViA0sA==
Date: Wed, 23 Oct 2019 06:43:09 +0000
Message-ID: <20191023064226.10969-4-james.qian.wang@arm.com>
References: <20191023064226.10969-1-james.qian.wang@arm.com>
In-Reply-To: <20191023064226.10969-1-james.qian.wang@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR02CA0184.apcprd02.prod.outlook.com
 (2603:1096:201:21::20) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 727c534b-1699-444f-59ab-08d757844ba1
X-MS-TrafficTypeDiagnostic: VE1PR08MB5198:|VE1PR08MB5198:|AM6PR08MB4344:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB434468E800D8D3C9D4C2E1BEB36B0@AM6PR08MB4344.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:3513;OLM:3513;
x-forefront-prvs: 019919A9E4
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(396003)(366004)(136003)(346002)(199004)(189003)(66446008)(64756008)(66556008)(2501003)(2906002)(66946007)(66476007)(3846002)(36756003)(6116002)(256004)(14454004)(8676002)(486006)(478600001)(25786009)(50226002)(81156014)(2171002)(8936002)(81166006)(4326008)(103116003)(386003)(110136005)(446003)(305945005)(6506007)(316002)(66066001)(102836004)(76176011)(186003)(2616005)(476003)(6512007)(1076003)(5660300002)(99286004)(54906003)(11346002)(52116002)(71200400001)(71190400001)(2201001)(86362001)(6486002)(6436002)(26005)(7736002)(55236004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB5198;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: QMBIruKCqS5TdqYpA45FL7Suk1UelazrwPyXfao7utvo0ex1kG9Sm/Mj7PMnYicaH8iPVV0lbqk3H4+95PQupZy0o8ZWl4lUC/SAAoFwU+OZO3G8NB6ickRor633nCiG1Tpc9L24voCLOOa6bDIbZeUoksDfDyeU96sNyhPD3MeGQSmrZfvC03HCEV8tjdapKCyz+nRrHcnZjKrNevkadS959v6IZv8nsFTDAnwDMjKko8xrlGJ0vmo6FctCrK6mwDH+nZqid4Pf7yQ2Q6tySU/9C2QPUFUbhYOVANKIsS4Otspz6hnKPxPke8Z06VAMuCzpVBwus9yOjjO+lf8+E2Iawo5RSqf8JlVq98FR3ze81tz8ns2C/M0QserRKQxRGD+EQAXDDn839dpzH2gqTwoAU11MYWva1CddD+jF5pQDBdanX0O9dtH2K65DOil4
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5198
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(396003)(39860400002)(136003)(1110001)(339900001)(189003)(199004)(2906002)(26826003)(54906003)(336012)(5660300002)(23756003)(22756006)(6512007)(356004)(50466002)(2171002)(110136005)(102836004)(103116003)(1076003)(36756003)(26005)(478600001)(3846002)(6116002)(2501003)(316002)(25786009)(105606002)(486006)(81166006)(7736002)(14454004)(305945005)(386003)(70206006)(4326008)(47776003)(76130400001)(126002)(186003)(70586007)(6486002)(66066001)(8746002)(50226002)(446003)(2616005)(86362001)(11346002)(99286004)(2201001)(6506007)(8676002)(8936002)(476003)(76176011)(81156014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB4344;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Fail; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 5700c133-2ddb-4f50-a579-08d7578444b3
NoDisclaimer: True
X-Forefront-PRVS: 019919A9E4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eMebvdPcpjVZCMmCESyJGFUr9wzpfvev0sVPZUXDBbS6IYyBIiDpK6UWRJWeDyOXW0CErP4xXs6CJMENybT/aUi5K7riV5/m6BaEXsXzo3zqPMSvT5K13HFjZ+Yg38SH5cbxvKqZ+cM7Eb/qGwTOkKB78NsTOY00h49YOMnZ/Z3ozRFdSJAdJaRXbcw3iy5CJiXmYDh4u/F+WBfy0uOpaMUzekqKkeF6GV9JcByM4aN6XWc6hARRhcxABwApYTr9a29K6lKHFHwyERIRnEZQsmYrZlbPty3cpWzgzAjslxZUCNpRYLhyGCq45eU+PijLQqZkHMdio13n9Vu9819qtn1/hlT0lu8QJxnG9Ad2Pk+omEPUvC00KEUia1Y1yH6Tr1dRGYI5rDetwSEJL4+DhGNpiyrqREUjfaWxop4OSRL1+hiPXRoU02isRi0vlOdX
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2019 06:43:21.1158 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 727c534b-1699-444f-59ab-08d757844ba1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4344
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UvaLJ9iCW/GukE6Q6/g2aWg+NqCkBH1FlUg88c+A1ko=;
 b=XqXguAghUKa8rRi1mGKxVIGYiWw6fOHuetMEfxaMemJjthQxwyh+iy+gPq3jaU69ZqKQuotVs3HMqcALucdRhXOFydcqRbS/9YU4c42s3uXptMy/qbeqCADL44ktgvaZZXSK+vJvqAdkX2XIwWEbDrmdi68ji7nwFO7+EjmUxfw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UvaLJ9iCW/GukE6Q6/g2aWg+NqCkBH1FlUg88c+A1ko=;
 b=XqXguAghUKa8rRi1mGKxVIGYiWw6fOHuetMEfxaMemJjthQxwyh+iy+gPq3jaU69ZqKQuotVs3HMqcALucdRhXOFydcqRbS/9YU4c42s3uXptMy/qbeqCADL44ktgvaZZXSK+vJvqAdkX2XIwWEbDrmdi68ji7nwFO7+EjmUxfw=
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
 Mihail Atanassov <Mihail.Atanassov@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Julien
 Yin \(Arm Technology China\)" <Julien.Yin@arm.com>, "Channing Chen \(Arm
 Technology China\)" <Channing.Chen@arm.com>,
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 "Yiqi Kang \(Arm Technology China\)" <Yiqi.Kang@arm.com>,
 "Thomas Sun \(Arm Technology China\)" <thomas.Sun@arm.com>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>,
 Ben Davis <Ben.Davis@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBmdW5jdGlvbiBpcyBmb3IgY29udmVydGluZyBkcm1fY29sb3JfY3RtIG1hdHJpeCB0byBr
b21lZGEgaGFyZHdhcmUKcmVxdWlyZWQgcmVxdWlyZWQgUTIuMTIgMidzIGNvbXBsZW1lbnQgQ1ND
IG1hdHJpeC4KCnYyOgogIE1vdmUgdGhlIGZpeHBvaW50IGNvbnZlcnNpb24gZnVuY3Rpb24gczMx
XzMyX3RvX3EyXzEyKCkgdG8gZHJtIGNvcmUKICBhcyBhIHNoYXJlZCBoZWxwZXIuCgpTaWduZWQt
b2ZmLWJ5OiBqYW1lcyBxaWFuIHdhbmcgKEFybSBUZWNobm9sb2d5IENoaW5hKSA8amFtZXMucWlh
bi53YW5nQGFybS5jb20+ClJldmlld2VkLWJ5OiBNaWhhaWwgQXRhbmFzc292IDxtaWhhaWwuYXRh
bmFzc292QGFybS5jb20+Ci0tLQogLi4uL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVk
YV9jb2xvcl9tZ210LmMgfCAxNCArKysrKysrKysrKysrKwogLi4uL2dwdS9kcm0vYXJtL2Rpc3Bs
YXkva29tZWRhL2tvbWVkYV9jb2xvcl9tZ210LmggfCAgMSArCiAyIGZpbGVzIGNoYW5nZWQsIDE1
IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkv
a29tZWRhL2tvbWVkYV9jb2xvcl9tZ210LmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkv
a29tZWRhL2tvbWVkYV9jb2xvcl9tZ210LmMKaW5kZXggYzE4MGNlNzBjMjZjLi5kOGU0NDllNmVi
ZGEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRh
X2NvbG9yX21nbXQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tv
bWVkYV9jb2xvcl9tZ210LmMKQEAgLTExNywzICsxMTcsMTcgQEAgdm9pZCBkcm1fbHV0X3RvX2Zn
YW1tYV9jb2VmZnMoc3RydWN0IGRybV9wcm9wZXJ0eV9ibG9iICpsdXRfYmxvYiwgdTMyICpjb2Vm
ZnMpCiB7CiAJZHJtX2x1dF90b19jb2VmZnMobHV0X2Jsb2IsIGNvZWZmcywgc2VjdG9yX3RibCwg
QVJSQVlfU0laRShzZWN0b3JfdGJsKSk7CiB9CisKK3ZvaWQgZHJtX2N0bV90b19jb2VmZnMoc3Ry
dWN0IGRybV9wcm9wZXJ0eV9ibG9iICpjdG1fYmxvYiwgdTMyICpjb2VmZnMpCit7CisJc3RydWN0
IGRybV9jb2xvcl9jdG0gKmN0bTsKKwl1MzIgaTsKKworCWlmICghY3RtX2Jsb2IpCisJCXJldHVy
bjsKKworCWN0bSA9IGN0bV9ibG9iLT5kYXRhOworCisJZm9yIChpID0gMDsgaSA8IEtPTUVEQV9O
X0NUTV9DT0VGRlM7IGkrKykKKwkJY29lZmZzW2ldID0gZHJtX2NvbG9yX2N0bV9zMzFfMzJfdG9f
cW1fbihjdG0tPm1hdHJpeFtpXSwgMywgMTIpOworfQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY29sb3JfbWdtdC5oIGIvZHJpdmVycy9ncHUv
ZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY29sb3JfbWdtdC5oCmluZGV4IDA4YWI2OTI4
MTY0OC4uMmY0NjY4NDY2MTEyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3Bs
YXkva29tZWRhL2tvbWVkYV9jb2xvcl9tZ210LmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9k
aXNwbGF5L2tvbWVkYS9rb21lZGFfY29sb3JfbWdtdC5oCkBAIC0xOCw2ICsxOCw3IEBACiAjZGVm
aW5lIEtPTUVEQV9OX0NUTV9DT0VGRlMJCTkKIAogdm9pZCBkcm1fbHV0X3RvX2ZnYW1tYV9jb2Vm
ZnMoc3RydWN0IGRybV9wcm9wZXJ0eV9ibG9iICpsdXRfYmxvYiwgdTMyICpjb2VmZnMpOwordm9p
ZCBkcm1fY3RtX3RvX2NvZWZmcyhzdHJ1Y3QgZHJtX3Byb3BlcnR5X2Jsb2IgKmN0bV9ibG9iLCB1
MzIgKmNvZWZmcyk7CiAKIGNvbnN0IHMzMiAqa29tZWRhX3NlbGVjdF95dXYycmdiX2NvZWZmcyh1
MzIgY29sb3JfZW5jb2RpbmcsIHUzMiBjb2xvcl9yYW5nZSk7CiAKLS0gCjIuMjAuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
