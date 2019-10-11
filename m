Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD04D38CC
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2019 07:46:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B0F56EB97;
	Fri, 11 Oct 2019 05:45:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0619.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0e::619])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE0EF6EB97
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2019 05:45:53 +0000 (UTC)
Received: from AM4PR08CA0045.eurprd08.prod.outlook.com (2603:10a6:205:2::16)
 by HE1PR0802MB2137.eurprd08.prod.outlook.com (2603:10a6:3:c8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.20; Fri, 11 Oct
 2019 05:45:49 +0000
Received: from VE1EUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::209) by AM4PR08CA0045.outlook.office365.com
 (2603:10a6:205:2::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.16 via Frontend
 Transport; Fri, 11 Oct 2019 05:45:49 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT003.mail.protection.outlook.com (10.152.18.108) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Fri, 11 Oct 2019 05:45:47 +0000
Received: ("Tessian outbound 3fba803f6da3:v33");
 Fri, 11 Oct 2019 05:45:34 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e3db94b223a7aa1e
X-CR-MTA-TID: 64aa7808
Received: from 0016c1b5f25c.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.9.52]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BB36F53E-3171-470C-9BAA-14A3D2F9E699.1; 
 Fri, 11 Oct 2019 05:45:29 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2052.outbound.protection.outlook.com [104.47.9.52])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0016c1b5f25c.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Fri, 11 Oct 2019 05:45:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JEQxeexqiS4RYFzgegTIxOc421T3TU5DQOUmE2ECfPUQUdpniyCjS/cm25WulLRTqt6kSqPLUXk6nV0jvSLLiWJYNVHQeaPoNoA8ycb/BZCarDGRrYOg0T4Hq5js8mqNM0VOYvNC/L423fePniNNJFDwwLAxOyzGSgL+9kVIOMPM7m8hh2oTY1iN5p/AaVFKGaOPZhw1OcudVtIKQeraEUkArhq52dQuXOm+RqczPrjgzoFeRGG+exjbTOLZ9ID0L9qS9+ihlhp5gqy6mBOAAbkFBom8kUIGo7hQn7Plix2kIahhG34gkMdMz0I5siUDmk/K8fDD+gWQ1meiszo70A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tg5FqZcXN1Q8PYyDwUWcRuC6JhC60pEQl00Wv88LR5o=;
 b=iPRwWhNKYhy/kSGjEcYev+lmosEMXnrRsYb4qTRjDKLz6v66Yq3lNdH5Xrckmb4GX2k/G02K9XyP08suCdVroZY3fdbPo2fmi4akRW0zMvY+X6FMNS90BP96VGpogBExfX6F61a1VZoPF3PewL0Gz8qBVnd7ZZL2tLaXj5sJml0b4DS0iGfWvZR2rdFqlDcN61Rq1BIc4RJIXT6673St0wwZKsLNXsGa57xQ2Md36zt+yuk4PAgj1DIUbrdbcFjMBdseJLlzsgwri9G5o7iEkpN9fO+Fp0R9nO4YIPjxLWDqmfSiqcOquZ5ye4enicfDBgfjYtr+MSoET93fYnmOeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4816.eurprd08.prod.outlook.com (10.255.112.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Fri, 11 Oct 2019 05:45:27 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5%3]) with mapi id 15.20.2347.021; Fri, 11 Oct 2019
 05:45:27 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "airlied@linux.ie" <airlied@linux.ie>, 
 Brian Starkey <Brian.Starkey@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "sean@poorly.run" <sean@poorly.run>, 
 "imirkin@alum.mit.edu" <imirkin@alum.mit.edu>
Subject: [PATCH v2 1/4] drm: Add a new helper drm_color_ctm_s31_32_to_qm_n()
Thread-Topic: [PATCH v2 1/4] drm: Add a new helper
 drm_color_ctm_s31_32_to_qm_n()
Thread-Index: AQHVf/cV8wl8pZbk8kmsplok4zd2Gw==
Date: Fri, 11 Oct 2019 05:45:27 +0000
Message-ID: <20191011054459.17984-2-james.qian.wang@arm.com>
References: <20191011054459.17984-1-james.qian.wang@arm.com>
In-Reply-To: <20191011054459.17984-1-james.qian.wang@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0PR03CA0011.apcprd03.prod.outlook.com
 (2603:1096:203:2e::23) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 2bf9f7b4-2580-45e2-ee62-08d74e0e43ed
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: VE1PR08MB4816:|VE1PR08MB4816:|HE1PR0802MB2137:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <HE1PR0802MB21371B9B0CFBBA20F474249DB3970@HE1PR0802MB2137.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:4125;OLM:4125;
x-forefront-prvs: 0187F3EA14
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(136003)(39860400002)(396003)(376002)(346002)(199004)(189003)(4326008)(2201001)(2171002)(86362001)(2906002)(103116003)(36756003)(6512007)(1076003)(316002)(110136005)(81156014)(81166006)(8936002)(6436002)(54906003)(99286004)(50226002)(305945005)(7736002)(8676002)(3846002)(76176011)(6116002)(5660300002)(52116002)(6486002)(66476007)(6506007)(386003)(66556008)(66446008)(64756008)(14454004)(446003)(186003)(11346002)(256004)(26005)(102836004)(71200400001)(2616005)(476003)(486006)(66946007)(55236004)(25786009)(71190400001)(2501003)(66066001)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4816;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: kZseXxyq3+7BV1f66OK9E+I9JtdhGNwjl4tARhiY6Zg8TKORfT27y4FP8rMVTdnbYeXdhUhU5LPp9ETFajKpKkOaQS2wt50eLV9Hu+djsYHdZeXN8b+d3wNAh9xZ2p6BTZB+bnGSckiMAeIX7n78dLtlauSMtvbXlBreliv/oVH4Q2ibvdBDp+BPZty1i6b+wW//urY4kzUP+YRWMLiouLVeDcJjxn4OJq68zyCLwKOCvvDd+PUSGJyB7dvCRI/O3Vvqtb2nxyIxkW8P1i+5o7kGOtbIqMJ4TkSEQo3QwLbpD5CqW0Tu8QbBi3xTNHGSSLOvUIIDlo7kXk6NSZjMPYklfPstp1Flc+6zzixZwBK9etbiBIjMgNa7CW4kYFnfRrrYmPgAFWg6M8x3m0K5FAcT2y3U0wiEPvqKMQjdomM=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4816
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(136003)(396003)(346002)(199004)(189003)(86362001)(3846002)(316002)(26005)(102836004)(23756003)(76176011)(47776003)(36756003)(1076003)(6116002)(54906003)(22756006)(6512007)(6506007)(110136005)(2201001)(36906005)(4326008)(7736002)(2501003)(2171002)(305945005)(66066001)(63350400001)(478600001)(50466002)(386003)(186003)(336012)(6486002)(486006)(11346002)(126002)(476003)(14454004)(5660300002)(8936002)(8676002)(76130400001)(50226002)(356004)(70586007)(81166006)(99286004)(81156014)(25786009)(2616005)(26826003)(2906002)(446003)(70206006)(103116003)(8746002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:HE1PR0802MB2137;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 569d4c24-4bc1-4db0-0474-08d74e0e3817
NoDisclaimer: True
X-Forefront-PRVS: 0187F3EA14
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xzewXLLaAQEZoHTLZ+3Ixbe8Wzeh0vDOPhQgtOwbjfaFfGJTTo3G4p719ApSrvOzx5aNHVj26Pls4tILU897v2eACZYGi58COO07+Ea+Wtn/8QHjRtW2Rqm9vqVQHVnHeNGiqqRRwaaugdd55Va7QHcVWVRoBQTz39KxNmQ25uj9N6E34hdVmfHyzYsYi2T+z5pFSOurreoHcV/yC/x98xRSN9V20RLNhWe8eLUQqVEOOnD+7hsKHJMRwa5x8IHhPIKrcC8BNFoZc42jsljfLcROPELgwi1B6cULYkT/mQ7ufnhcJLWGgoCQoEh8THf4WJpHEPPOIXv4ZLxiE/rTtmvzzKD6/pBybs866ZqSyJVJM7at2eFbtStC/T0BS3isT/rRf5tVj1wZr0DBzT+ZEA4qitTcBuJ3vb7WE3SQrbc=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2019 05:45:47.1348 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bf9f7b4-2580-45e2-ee62-08d74e0e43ed
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2137
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tg5FqZcXN1Q8PYyDwUWcRuC6JhC60pEQl00Wv88LR5o=;
 b=EeI9cSGdeSucDS2FIuk33MCGsS7//zHVxiRlKdOtPXkCczahabF1ngjLiiW20AmxAn02r7pH7//omcR4Ijpi8C+U/S3kgVLhhKlmaDRXXtpSb7YdyPKx4qKc0w92IEPaXXEu44emGwaw/6MgUCFGJ0cKzzfn0bolVW1CRmg25es=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tg5FqZcXN1Q8PYyDwUWcRuC6JhC60pEQl00Wv88LR5o=;
 b=EeI9cSGdeSucDS2FIuk33MCGsS7//zHVxiRlKdOtPXkCczahabF1ngjLiiW20AmxAn02r7pH7//omcR4Ijpi8C+U/S3kgVLhhKlmaDRXXtpSb7YdyPKx4qKc0w92IEPaXXEu44emGwaw/6MgUCFGJ0cKzzfn0bolVW1CRmg25es=
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

QWRkIGEgbmV3IGhlbHBlciBmdW5jdGlvbiBkcm1fY29sb3JfY3RtX3MzMV8zMl90b19xbV9uKCkg
Zm9yIGRyaXZlciB0bwpjb252ZXJ0IFMzMS4zMiBzaWduLW1hZ25pdHVkZSB0byBRbS5uIDIncyBj
b21wbGVtZW50IHRoYXQgc3VwcG9ydGVkIGJ5CmhhcmR3YXJlLgoKU2lnbmVkLW9mZi1ieTogamFt
ZXMgcWlhbiB3YW5nIChBcm0gVGVjaG5vbG9neSBDaGluYSkgPGphbWVzLnFpYW4ud2FuZ0Bhcm0u
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fY29sb3JfbWdtdC5jIHwgMjMgKysrKysrKysr
KysrKysrKysrKysrKysKIGluY2x1ZGUvZHJtL2RybV9jb2xvcl9tZ210LmggICAgIHwgIDIgKysK
IDIgZmlsZXMgY2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9kcm1fY29sb3JfbWdtdC5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9jb2xvcl9tZ210
LmMKaW5kZXggNGNlNWM2ZDhkZTk5Li4zZDUzM2QwYjQ1YWYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9kcm1fY29sb3JfbWdtdC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fY29sb3Jf
bWdtdC5jCkBAIC0xMzIsNiArMTMyLDI5IEBAIHVpbnQzMl90IGRybV9jb2xvcl9sdXRfZXh0cmFj
dCh1aW50MzJfdCB1c2VyX2lucHV0LCB1aW50MzJfdCBiaXRfcHJlY2lzaW9uKQogfQogRVhQT1JU
X1NZTUJPTChkcm1fY29sb3JfbHV0X2V4dHJhY3QpOwoKKy8qKgorICogZHJtX2NvbG9yX2N0bV9z
MzFfMzJfdG9fcW1fbgorICoKKyAqIEB1c2VyX2lucHV0OiBpbnB1dCB2YWx1ZQorICogQG06IG51
bWJlciBvZiBpbnRlZ2VyIGJpdHMKKyAqIEBuOiBudW1iZXIgb2YgZnJhY3RpbmFsIGJpdHMKKyAq
CisgKiBDb252ZXJ0IGFuZCBjbGFtcCBTMzEuMzIgc2lnbi1tYWduaXR1ZGUgdG8gUW0ubiAyJ3Mg
Y29tcGxlbWVudC4KKyAqLwordWludDY0X3QgZHJtX2NvbG9yX2N0bV9zMzFfMzJfdG9fcW1fbih1
aW50NjRfdCB1c2VyX2lucHV0LAorCQkJCSAgICAgIHVpbnQzMl90IG0sIHVpbnQzMl90IG4pCit7
CisJdTY0IG1hZyA9ICh1c2VyX2lucHV0ICYgfkJJVF9VTEwoNjMpKSA+PiAoMzIgLSBuKTsKKwli
b29sIG5lZ2F0aXZlID0gISEodXNlcl9pbnB1dCAmIEJJVF9VTEwoNjMpKTsKKwlzNjQgdmFsOwor
CisJLyogdGhlIHJhbmdlIG9mIHNpZ25lZCAycyBjb21wbGVtZW50IGlzIFstMl5uK20sIDJebitt
IC0gMV0gKi8KKwl2YWwgPSBjbGFtcF92YWwobWFnLCAwLCBuZWdhdGl2ZSA/IEJJVChuICsgbSkg
OiBCSVQobiArIG0pIC0gMSk7CisKKwlyZXR1cm4gbmVnYXRpdmUgPyAwbGwgLSB2YWwgOiB2YWw7
Cit9CitFWFBPUlRfU1lNQk9MKGRybV9jb2xvcl9jdG1fczMxXzMyX3RvX3FtX24pOworCiAvKioK
ICAqIGRybV9jcnRjX2VuYWJsZV9jb2xvcl9tZ210IC0gZW5hYmxlIGNvbG9yIG1hbmFnZW1lbnQg
cHJvcGVydGllcwogICogQGNydGM6IERSTSBDUlRDCmRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9k
cm1fY29sb3JfbWdtdC5oIGIvaW5jbHVkZS9kcm0vZHJtX2NvbG9yX21nbXQuaAppbmRleCBkMWM2
NjJkOTJhYjcuLjYwZmVhNTUwMTg4NiAxMDA2NDQKLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2NvbG9y
X21nbXQuaAorKysgYi9pbmNsdWRlL2RybS9kcm1fY29sb3JfbWdtdC5oCkBAIC0zMCw2ICszMCw4
IEBAIHN0cnVjdCBkcm1fY3J0YzsKIHN0cnVjdCBkcm1fcGxhbmU7CgogdWludDMyX3QgZHJtX2Nv
bG9yX2x1dF9leHRyYWN0KHVpbnQzMl90IHVzZXJfaW5wdXQsIHVpbnQzMl90IGJpdF9wcmVjaXNp
b24pOwordWludDY0X3QgZHJtX2NvbG9yX2N0bV9zMzFfMzJfdG9fcW1fbih1aW50NjRfdCB1c2Vy
X2lucHV0LAorCQkJCSAgICAgIHVpbnQzMl90IG0sIHVpbnQzMl90IG4pOwoKIHZvaWQgZHJtX2Ny
dGNfZW5hYmxlX2NvbG9yX21nbXQoc3RydWN0IGRybV9jcnRjICpjcnRjLAogCQkJCXVpbnQgZGVn
YW1tYV9sdXRfc2l6ZSwKLS0KMi4yMC4xCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
