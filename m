Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D5EB109EE0
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 14:16:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 741D96E351;
	Tue, 26 Nov 2019 13:16:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20085.outbound.protection.outlook.com [40.107.2.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87A116E33D
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2019 13:16:22 +0000 (UTC)
Received: from VI1PR08CA0100.eurprd08.prod.outlook.com (2603:10a6:800:d3::26)
 by AM0PR08MB3956.eurprd08.prod.outlook.com (2603:10a6:208:131::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.16; Tue, 26 Nov
 2019 13:16:20 +0000
Received: from VE1EUR03FT024.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::202) by VI1PR08CA0100.outlook.office365.com
 (2603:10a6:800:d3::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.17 via Frontend
 Transport; Tue, 26 Nov 2019 13:16:20 +0000
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT024.mail.protection.outlook.com (10.152.18.87) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.17 via Frontend Transport; Tue, 26 Nov 2019 13:16:20 +0000
Received: ("Tessian outbound 512f710540da:v33");
 Tue, 26 Nov 2019 13:16:17 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e12ce85a70890146
X-CR-MTA-TID: 64aa7808
Received: from 0334c95094c9.4 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.10.50]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 97330A3C-38B3-4381-BE2E-B672BD82A1DC.1; 
 Tue, 26 Nov 2019 13:16:12 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2050.outbound.protection.outlook.com [104.47.10.50])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0334c95094c9.4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 26 Nov 2019 13:16:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LyNpqlmpgt1JMe0MajkSh80cAYEmqpfAqdopul+rG3Q6GbSERrd+84cT2p/4B4NRIGHHDFvNgGu6E0BVtNknU1WrrqhNVtqxYxay+35iQ0HZYEJMAzzPjGFmZW6GxcuBpc8V0e/yMl5f8mSbCUXrCxwSSKeatuh0hHOc3BSB8kk06hk4Gn2ixyHIIXTOFmVpJYZD0O8gnrknSXICW5+lJ4yc31pc/QTGMjcrX75cIelhPoQgPBL2B5g4e8YvjjABj1XuczpkKU3lpLO76MMCEFRiHDal6kl2FviSzTjwW/WoaoCG1Mzp+OMF1nwzXzV4e+9b7S6wvxxIu4ydHf1naA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YG65isiFDLr+qbpV61uGylAb5rk13yS4rBT9XdjMRJo=;
 b=Ve66c937Sfz3AGkeHhSHDPcy3kTo51V5W1/KZgf7H8a07VcXJ61THosiqxZbNxrOXd+VMy8olJfgS/ogllQHvNswf3vxnWkiKGSf0y7qerc8zB6pRMjTpokYrtvbtGb7VEh7PAC2v/No0SFDWa0UP2V/UgF1HEqFCMZ5whqegC6xYqWxJYXOCrAerilpmbf8H8s2f5lzjwUmWvHB59f6X5Go8mwK8iUKlDJ+82HaPWM+cyUZTMsV6gvbrHFJ6W+bBFnciNS3ph+ItCF1FJK/oXQ6gNdiENw0dkDcANuj7oHNr1hJ8DpRJeaZ+YcI0vhfASkXefCFOZsL2/zfxBYnog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB4317.eurprd08.prod.outlook.com (20.179.28.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.16; Tue, 26 Nov 2019 13:16:10 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d%3]) with mapi id 15.20.2474.023; Tue, 26 Nov 2019
 13:16:10 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH 12/30] drm/bridge: sii902x: Use drm_bridge_init()
Thread-Topic: [PATCH 12/30] drm/bridge: sii902x: Use drm_bridge_init()
Thread-Index: AQHVpFurjxmagkJwXkOkEV0fENOC3Q==
Date: Tue, 26 Nov 2019 13:16:10 +0000
Message-ID: <20191126131541.47393-13-mihail.atanassov@arm.com>
References: <20191126131541.47393-1-mihail.atanassov@arm.com>
In-Reply-To: <20191126131541.47393-1-mihail.atanassov@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.55]
x-clientproxiedby: LO2P265CA0453.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::33) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
x-mailer: git-send-email 2.23.0
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8898764f-595a-42ed-c7ef-08d77272d3ed
X-MS-TrafficTypeDiagnostic: VI1PR08MB4317:|VI1PR08MB4317:|AM0PR08MB3956:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM0PR08MB3956991415572AAFB58233188F450@AM0PR08MB3956.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:324;OLM:324;
x-forefront-prvs: 0233768B38
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(1496009)(4636009)(39860400002)(366004)(346002)(376002)(136003)(396003)(189003)(199004)(5640700003)(86362001)(6512007)(71200400001)(2616005)(6486002)(71190400001)(2906002)(4326008)(6916009)(44832011)(446003)(11346002)(54906003)(66946007)(316002)(66446008)(64756008)(66556008)(66476007)(6436002)(4744005)(8936002)(186003)(26005)(5660300002)(102836004)(305945005)(14454004)(25786009)(99286004)(81166006)(50226002)(478600001)(2501003)(7736002)(6116002)(2351001)(76176011)(1076003)(52116002)(66066001)(256004)(8676002)(81156014)(6506007)(3846002)(386003)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB4317;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: jSVly2z3FOwpX1PQwHDHlh7BImRa8ioUlO2lM54z6Qb65j8KmKtA1nW+ZyLfNT2SqInwBeAcoNC5nyONFh3ZXf2uh4y6L+xVRhepffRvwIDoycZH9Q3y8Mj1RAJAIweWU8PN2q8aR0D2ayqfVN7aGgCE6PRamGEEAcpE20VxJ4bcybGx3id6v4mUYWu1SOIm3U39SC3dEA0VQUMji/hnQcCLcOthiZHxIiSSt3D2gjSu1XO4wUtAfd2N2+JrEJgRQhO2NRGaARROJsHscM+PRb0ZU7OXfRxa5Y0iL1325Tw5NXfo8uLBrxDRlaWyq7GsTKszNTbse+gJqJRpMixQ9HoDYsADIsHlwwztoldjF/Mi+uUzZD0Vp8dAX25yaMYxYaIkDYo0aRqSd1taV3JU0ELtFTgKw1ANVond/yytedsC+/PapLT5LFv74KNQkxUV
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4317
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT024.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(376002)(396003)(39860400002)(189003)(199004)(2501003)(7736002)(305945005)(6116002)(6916009)(316002)(2351001)(2616005)(36906005)(5640700003)(99286004)(356004)(81156014)(81166006)(1076003)(86362001)(478600001)(22756006)(14454004)(25786009)(26826003)(66066001)(3846002)(8746002)(8676002)(8936002)(2906002)(47776003)(54906003)(106002)(102836004)(26005)(6512007)(4744005)(386003)(36756003)(70586007)(6506007)(4326008)(76176011)(70206006)(76130400001)(446003)(6486002)(23756003)(11346002)(107886003)(186003)(50466002)(336012)(5660300002)(50226002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB3956;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: d08bbc98-40b4-4de8-b207-08d77272cde8
NoDisclaimer: True
X-Forefront-PRVS: 0233768B38
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o0Njcg2PYChh53CpNqj36d7SFKjW0sQQ54UrLIQVTKSoVsognPSncM/Aru3NQFk2BXVlbqG/2WJOHv6TKoacUIDT1gUxri86TE6BlyyNK/Kx4yI+c4TSE72Oplwe3I84fwxOu9LshE41JkcnxodxQzI9x9N0nwgabkA9e82RuGNQWV19DqO43landkn8ztGk3uq6hC4MAIGNGSnUPxwrpoQeGNbZ9GR3fgwsPJyjcwgXT3UGPDne7aEOyT2WHueDi8BPlIkjLAG2KNAHgILeq4u4XDnBRP6aI/EnO3lqp0nOL5p8aPkvDgbu8/CJ6LK6N2eJl80cmDtB91Zz4f6rUeVGLL12znaAxc/lm6J0b8DpNLkfmktH1YJsDtQ6dKD49Iy47t57FA247+rTyu6WMHKOcOXzr9IPQ4zqK/oRq78kEpMU9LzLYHaGF3Za6BLY
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2019 13:16:20.2567 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8898764f-595a-42ed-c7ef-08d77272d3ed
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3956
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YG65isiFDLr+qbpV61uGylAb5rk13yS4rBT9XdjMRJo=;
 b=6uTrHhEyryREh76cPkiJLlfivrTQozE7Dm4W20qo6TyednHOrrZGlO6AkBASQ9d6i+AjRnBFb7KN8AnnJE8X3fm0Pn3bI9bFKSzUl7+sD3uTiM9ytT9DQ1GSIbecX46wT/ZUbHAOIYdTSC/+RmB+PJ/TdEB/fGUDuTDApm6spuM=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YG65isiFDLr+qbpV61uGylAb5rk13yS4rBT9XdjMRJo=;
 b=6uTrHhEyryREh76cPkiJLlfivrTQozE7Dm4W20qo6TyednHOrrZGlO6AkBASQ9d6i+AjRnBFb7KN8AnnJE8X3fm0Pn3bI9bFKSzUl7+sD3uTiM9ytT9DQ1GSIbecX46wT/ZUbHAOIYdTSC/+RmB+PJ/TdEB/fGUDuTDApm6spuM=
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Mihail Atanassov <Mihail.Atanassov@arm.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm8gZnVuY3Rpb25hbCBjaGFuZ2UuCgpTaWduZWQtb2ZmLWJ5OiBNaWhhaWwgQXRhbmFzc292IDxt
aWhhaWwuYXRhbmFzc292QGFybS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zaWk5
MDJ4LmMgfCA1ICsrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAzIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc2lpOTAyeC5jIGIv
ZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zaWk5MDJ4LmMKaW5kZXggYjcwZThjNWNmMmUxLi4yYTlk
YjYyMTQ4NGQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc2lpOTAyeC5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc2lpOTAyeC5jCkBAIC0xMDE3LDkgKzEwMTcsOCBA
QCBzdGF0aWMgaW50IHNpaTkwMnhfcHJvYmUoc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCwKIAkJ
CXJldHVybiByZXQ7CiAJfQogCi0Jc2lpOTAyeC0+YnJpZGdlLmZ1bmNzID0gJnNpaTkwMnhfYnJp
ZGdlX2Z1bmNzOwotCXNpaTkwMngtPmJyaWRnZS5vZl9ub2RlID0gZGV2LT5vZl9ub2RlOwotCXNp
aTkwMngtPmJyaWRnZS50aW1pbmdzID0gJmRlZmF1bHRfc2lpOTAyeF90aW1pbmdzOworCWRybV9i
cmlkZ2VfaW5pdCgmc2lpOTAyeC0+YnJpZGdlLCBkZXYsICZzaWk5MDJ4X2JyaWRnZV9mdW5jcywK
KwkJCSZkZWZhdWx0X3NpaTkwMnhfdGltaW5ncywgTlVMTCk7CiAJZHJtX2JyaWRnZV9hZGQoJnNp
aTkwMngtPmJyaWRnZSk7CiAKIAlzaWk5MDJ4X2F1ZGlvX2NvZGVjX2luaXQoc2lpOTAyeCwgZGV2
KTsKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
