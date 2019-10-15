Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F49D719E
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 10:55:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DFDF897BB;
	Tue, 15 Oct 2019 08:55:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40052.outbound.protection.outlook.com [40.107.4.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B427A897BB
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 08:55:38 +0000 (UTC)
Received: from VI1PR08CA0164.eurprd08.prod.outlook.com (2603:10a6:800:d1::18)
 by VE1PR08MB4958.eurprd08.prod.outlook.com (2603:10a6:803:108::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.21; Tue, 15 Oct
 2019 08:55:34 +0000
Received: from AM5EUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::208) by VI1PR08CA0164.outlook.office365.com
 (2603:10a6:800:d1::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.16 via Frontend
 Transport; Tue, 15 Oct 2019 08:55:34 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT030.mail.protection.outlook.com (10.152.16.117) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Tue, 15 Oct 2019 08:55:32 +0000
Received: ("Tessian outbound 6481c7fa5a3c:v33");
 Tue, 15 Oct 2019 08:55:27 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3f537d8ea2c04355
X-CR-MTA-TID: 64aa7808
Received: from 7c1844d741b1.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.12.59]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 69A2A0E9-57F0-4D79-B0FD-70A72885789F.1; 
 Tue, 15 Oct 2019 08:55:22 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2059.outbound.protection.outlook.com [104.47.12.59])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7c1844d741b1.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Tue, 15 Oct 2019 08:55:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aHY2RjCRdj1HwLnNdoayOhoJcI5/JuhswcJg8Zek+FoNOu8+P8QljvkGCtbW9FPl5Qjo+iH/kWOqeIzTE5JMkBfdkmbiQZEcHSXKJV3JjnImRS8/hLvf38urpXJyrqwWTSgAPShf6lCxYnpIPsJRZFeEMaCWOxfWBcYQ7HcpTtSFhnWVIPUVQI4ILBDhTNmYp7QPNIRF8iYjdCX0GjIHjA8YtCsXBP2Sw4N2RJDPgKTfLJIUoUAogtYafy/d5WTlP45jKU2Knnv6SWmGBLBL8YRpYB1/HdQZqnjc2BOxlxhKtPBrc9UyZUSDjQ1D6k6PzBoKpzftrZZ5hE16SzHzXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+12jSE9K08bEIL2aEYWoaw3gN6kWnpCy2M6X8Epg2qE=;
 b=Yz7aNei3UGDsV+1tjOnEaKqGRD/tgQBwNPHBH9yYiDgQbxtffLMiYJUm4EcVNhc5nzQEpJ71bPpOmIYVLh5lFVryauvAgnDiaZfDKTB6ufvBYRYYlXXcm2GRC6WUxrd+bwlthb4eDiMmrwKgMwRsf9ZB6fF/2iYbomPovlSLL1KaxIPt/+YSlWVJKiWXPI2bivP+YJA3+CAZzwUfFg/FMIKZTRArIx22YHOZ7BOuZJJTZ4D9jlqqCahXMSQLRf6HngouxDdQEicR/dkg2Jmnm6JiWc4DiFui+t49cULB7Uj0dAj/pY7uRbT1UNbTF2fbkEzeGRzKraRFu0lFcCWtRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4704.eurprd08.prod.outlook.com (10.255.115.206) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.18; Tue, 15 Oct 2019 08:55:20 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5%3]) with mapi id 15.20.2347.023; Tue, 15 Oct 2019
 08:55:20 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Brian Starkey <Brian.Starkey@arm.com>
Subject: Re: [PATCH v4 2/4] drm/komeda: Add drm_lut_to_fgamma_coeffs()
Thread-Topic: [PATCH v4 2/4] drm/komeda: Add drm_lut_to_fgamma_coeffs()
Thread-Index: AQHVgv3GI0L46yKgNUGru0epkUV1d6dbX3IAgAAHFAA=
Date: Tue, 15 Oct 2019 08:55:19 +0000
Message-ID: <20191015085512.GA1624@jamwan02-TSP300>
References: <20191015021016.327-1-james.qian.wang@arm.com>
 <20191015021016.327-3-james.qian.wang@arm.com>
 <20191015082951.daxl5wpyt4h7xshh@DESKTOP-E1NTVVP.localdomain>
In-Reply-To: <20191015082951.daxl5wpyt4h7xshh@DESKTOP-E1NTVVP.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0P153CA0033.APCP153.PROD.OUTLOOK.COM
 (2603:1096:203:17::21) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 7ec7abbb-86ba-4fef-3e0c-08d7514d7004
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: VE1PR08MB4704:|VE1PR08MB4704:|VE1PR08MB4958:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VE1PR08MB49581AE6A82BA092CCA694DBB3930@VE1PR08MB4958.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:3968;OLM:3968;
x-forefront-prvs: 01917B1794
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(376002)(39860400002)(396003)(346002)(136003)(366004)(199004)(189003)(478600001)(9686003)(6512007)(33656002)(486006)(256004)(54906003)(99286004)(6246003)(2906002)(7736002)(305945005)(76176011)(4326008)(52116002)(14444005)(25786009)(3846002)(6116002)(6486002)(6436002)(229853002)(71200400001)(26005)(6862004)(14454004)(186003)(71190400001)(102836004)(55236004)(1076003)(6506007)(386003)(8936002)(446003)(8676002)(81156014)(81166006)(58126008)(316002)(33716001)(6636002)(66476007)(66556008)(66446008)(66946007)(64756008)(11346002)(476003)(66066001)(86362001)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4704;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: JDdtVg14Td13O31QvmpNm9KylxbaIT3kmlparakc/f6tb0a59fCooW6X+/6gdk5VP08dBJHqB55wFqZ39YZw7NewghMOCyUxqM2YxbtxJlxEx1oUfG1pCf1R9ZqSFMpq9/GPxaBdDEKiR3yel415QF7nQCuwj504J9AraWg+/B4FqA8mbz7QxA9m8tjMqw3SZ6zCqqzro4vZ5bvDxcQnnlhwby9r3W7hGbl8dqAk2QX+b28zU8tiqvbYuPHxOQF2TJsjrck+lpgCyQXJMflQNor3Y5T+WMBt7sSOftiuL1Bucu+P10fQ6Twk1k7+uoB6ww1SGYBvKLXLprt+eSd8bFQKHfmeBCAob7d1c+JAtvYvj8JhXMLCdSkwIXWe9/PdsRc0r309tNR+u5HWhMl/nwGOyZjDZpzLcjEE4wgz1ls=
Content-ID: <0EBD8AD90D1CEB4D905F480A8778721B@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4704
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(136003)(396003)(39860400002)(346002)(376002)(199004)(189003)(8746002)(86362001)(8936002)(478600001)(99286004)(126002)(476003)(6486002)(1076003)(33656002)(446003)(11346002)(47776003)(63350400001)(25786009)(26005)(76130400001)(70586007)(46406003)(70206006)(486006)(229853002)(102836004)(22756006)(356004)(76176011)(316002)(58126008)(6116002)(5660300002)(54906003)(50466002)(36906005)(386003)(6246003)(14454004)(81166006)(4326008)(97756001)(2906002)(6506007)(14444005)(6636002)(6862004)(186003)(3846002)(6512007)(9686003)(66066001)(33716001)(7736002)(8676002)(336012)(305945005)(26826003)(23726003)(81156014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4958;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 64064b69-d978-46fc-e860-08d7514d67fd
NoDisclaimer: True
X-Forefront-PRVS: 01917B1794
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vJ3MbAgZsKlzFxbIorOeYJPo8UQm7XzkeyeZNroxLDgPeJOL0MLOPpHtGILdgBcMjEuPNmK8xy0gmSD1/j8OOC9um/XpGe/vMvmsdEhxHbk9XTG8kwUqYnxdt4hUVFqMF2FRYHFWc+AJ1Gjk5tsJT9An+YUq2t5FEw5YtOmKKeaFhEXieMBEPBl6QrGs7U8L7DzWH47h/WEpeO0l8bWXLGYLvrKfkOv3lpBonT/eTZbBa/ROWwjufLh6RR4YqAb6aJPlmvW+Q5yPmmC7+gcANdeIepv7XI4W29Cx5JmbmHjfNPX2EwDSAueJ2WGklkCe/BWDyk3GKjrOMTDN7RuPlmxIs0sLflp1Fs01k6ZeBamOMhkTo2R5cu3k+pO2Av/ExwsZpend3IH4QtVuMsO2qKKpVwZ7Cjro7YvXvBZrEfk=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2019 08:55:32.9331 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ec7abbb-86ba-4fef-3e0c-08d7514d7004
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4958
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+12jSE9K08bEIL2aEYWoaw3gN6kWnpCy2M6X8Epg2qE=;
 b=S+KBjcPev1sRTGpZfI+0cQpXUO51PldyvoRxcLEpaijv8RPIsTwGT+AtBll673aIp6A/p+Pcil6id23O/o2zHN96c4yllIxIVUx1aWeInQkB0EW7a9tn1OGBTkYDeie9Exa7IH7Bs37sO9PSCwmHn0fOFhjTfnqx3Z2U47jbRIM=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+12jSE9K08bEIL2aEYWoaw3gN6kWnpCy2M6X8Epg2qE=;
 b=S+KBjcPev1sRTGpZfI+0cQpXUO51PldyvoRxcLEpaijv8RPIsTwGT+AtBll673aIp6A/p+Pcil6id23O/o2zHN96c4yllIxIVUx1aWeInQkB0EW7a9tn1OGBTkYDeie9Exa7IH7Bs37sO9PSCwmHn0fOFhjTfnqx3Z2U47jbRIM=
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
 Zhang \(Arm Technology China\)" <Oscar.Zhang@arm.com>,
 "Tiannan Zhu \(Arm Technology China\)" <Tiannan.Zhu@arm.com>,
 Mihail Atanassov <Mihail.Atanassov@arm.com>,
 "airlied@linux.ie" <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>,
 "Channing Chen \(Arm Technology China\)" <Channing.Chen@arm.com>,
 "Yiqi Kang \(Arm Technology China\)" <Yiqi.Kang@arm.com>,
 Ben Davis <Ben.Davis@arm.com>,
 "Thomas Sun \(Arm Technology China\)" <thomas.Sun@arm.com>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>,
 "sean@poorly.run" <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgMTUsIDIwMTkgYXQgMDg6Mjk6NTJBTSArMDAwMCwgQnJpYW4gU3RhcmtleSB3
cm90ZToKPiBIaSBKYW1lcywKPiAKPiBPbiBUdWUsIE9jdCAxNSwgMjAxOSBhdCAwMjoxMDo1M0FN
ICswMDAwLCBqYW1lcyBxaWFuIHdhbmcgKEFybSBUZWNobm9sb2d5IENoaW5hKSB3cm90ZToKPiA+
IFRoaXMgZnVuY3Rpb24gaXMgdXNlZCB0byBjb252ZXJ0IGRybSAzZGx1dCB0byBrb21lZGEgSFcg
cmVxdWlyZWQgMWQgY3VydmUKPiAKPiBUaGlzIGlzIGEgMUQgTFVULCBub3QgYSAzRCBMVVQKPgoK
VGhhbmsgeW91IEJyaWFuIHdpbGwgY29ycmVjdCBpdCBpbiB0aGUgbmV4dCB2ZXJzaW9uLgoKSmFt
ZXMKCj4gQ2hlZXJzLAo+IC1Ccmlhbgo+IAo+ID4gY29lZmZzIHZhbHVlcy4KPiA+IAo+ID4gU2ln
bmVkLW9mZi1ieTogamFtZXMgcWlhbiB3YW5nIChBcm0gVGVjaG5vbG9neSBDaGluYSkgPGphbWVz
LnFpYW4ud2FuZ0Bhcm0uY29tPgo+ID4gUmV2aWV3ZWQtYnk6IE1paGFpbCBBdGFuYXNzb3YgPG1p
aGFpbC5hdGFuYXNzb3ZAYXJtLmNvbT4KPiA+IC0tLQo+ID4gIC4uLi9hcm0vZGlzcGxheS9rb21l
ZGEva29tZWRhX2NvbG9yX21nbXQuYyAgICB8IDUyICsrKysrKysrKysrKysrKysrKysKPiA+ICAu
Li4vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9jb2xvcl9tZ210LmggICAgfCAgOSArKystCj4g
PiAgMiBmaWxlcyBjaGFuZ2VkLCA2MCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPiAK
PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVk
YV9jb2xvcl9tZ210LmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVk
YV9jb2xvcl9tZ210LmMKPiA+IGluZGV4IDlkMTRhOTJkYmIxNy4uYzE4MGNlNzBjMjZjIDEwMDY0
NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY29s
b3JfbWdtdC5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tv
bWVkYV9jb2xvcl9tZ210LmMKPiA+IEBAIC02NSwzICs2NSw1NSBAQCBjb25zdCBzMzIgKmtvbWVk
YV9zZWxlY3RfeXV2MnJnYl9jb2VmZnModTMyIGNvbG9yX2VuY29kaW5nLCB1MzIgY29sb3JfcmFu
Z2UpCj4gPiAgCj4gPiAgCXJldHVybiBjb2VmZnM7Cj4gPiAgfQo+ID4gKwo+ID4gK3N0cnVjdCBn
YW1tYV9jdXJ2ZV9zZWN0b3Igewo+ID4gKwl1MzIgYm91bmRhcnlfc3RhcnQ7Cj4gPiArCXUzMiBu
dW1fb2Zfc2VnbWVudHM7Cj4gPiArCXUzMiBzZWdtZW50X3dpZHRoOwo+ID4gK307Cj4gPiArCj4g
PiArc3RydWN0IGdhbW1hX2N1cnZlX3NlZ21lbnQgewo+ID4gKwl1MzIgc3RhcnQ7Cj4gPiArCXUz
MiBlbmQ7Cj4gPiArfTsKPiA+ICsKPiA+ICtzdGF0aWMgc3RydWN0IGdhbW1hX2N1cnZlX3NlY3Rv
ciBzZWN0b3JfdGJsW10gPSB7Cj4gPiArCXsgMCwgICAgNCwgIDQgICB9LAo+ID4gKwl7IDE2LCAg
IDQsICA0ICAgfSwKPiA+ICsJeyAzMiwgICA0LCAgOCAgIH0sCj4gPiArCXsgNjQsICAgNCwgIDE2
ICB9LAo+ID4gKwl7IDEyOCwgIDQsICAzMiAgfSwKPiA+ICsJeyAyNTYsICA0LCAgNjQgIH0sCj4g
PiArCXsgNTEyLCAgMTYsIDMyICB9LAo+ID4gKwl7IDEwMjQsIDI0LCAxMjggfSwKPiA+ICt9Owo+
ID4gKwo+ID4gK3N0YXRpYyB2b2lkCj4gPiArZHJtX2x1dF90b19jb2VmZnMoc3RydWN0IGRybV9w
cm9wZXJ0eV9ibG9iICpsdXRfYmxvYiwgdTMyICpjb2VmZnMsCj4gPiArCQkgIHN0cnVjdCBnYW1t
YV9jdXJ2ZV9zZWN0b3IgKnNlY3Rvcl90YmwsIHUzMiBudW1fc2VjdG9ycykKPiA+ICt7Cj4gPiAr
CXN0cnVjdCBkcm1fY29sb3JfbHV0ICpsdXQ7Cj4gPiArCXUzMiBpLCBqLCBpbiwgbnVtID0gMDsK
PiA+ICsKPiA+ICsJaWYgKCFsdXRfYmxvYikKPiA+ICsJCXJldHVybjsKPiA+ICsKPiA+ICsJbHV0
ID0gbHV0X2Jsb2ItPmRhdGE7Cj4gPiArCj4gPiArCWZvciAoaSA9IDA7IGkgPCBudW1fc2VjdG9y
czsgaSsrKSB7Cj4gPiArCQlmb3IgKGogPSAwOyBqIDwgc2VjdG9yX3RibFtpXS5udW1fb2Zfc2Vn
bWVudHM7IGorKykgewo+ID4gKwkJCWluID0gc2VjdG9yX3RibFtpXS5ib3VuZGFyeV9zdGFydCAr
Cj4gPiArCQkJICAgICBqICogc2VjdG9yX3RibFtpXS5zZWdtZW50X3dpZHRoOwo+ID4gKwo+ID4g
KwkJCWNvZWZmc1tudW0rK10gPSBkcm1fY29sb3JfbHV0X2V4dHJhY3QobHV0W2luXS5yZWQsCj4g
PiArCQkJCQkJS09NRURBX0NPTE9SX1BSRUNJU0lPTik7Cj4gPiArCQl9Cj4gPiArCX0KPiA+ICsK
PiA+ICsJY29lZmZzW251bV0gPSBCSVQoS09NRURBX0NPTE9SX1BSRUNJU0lPTik7Cj4gPiArfQo+
ID4gKwo+ID4gK3ZvaWQgZHJtX2x1dF90b19mZ2FtbWFfY29lZmZzKHN0cnVjdCBkcm1fcHJvcGVy
dHlfYmxvYiAqbHV0X2Jsb2IsIHUzMiAqY29lZmZzKQo+ID4gK3sKPiA+ICsJZHJtX2x1dF90b19j
b2VmZnMobHV0X2Jsb2IsIGNvZWZmcywgc2VjdG9yX3RibCwgQVJSQVlfU0laRShzZWN0b3JfdGJs
KSk7Cj4gPiArfQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9r
b21lZGEva29tZWRhX2NvbG9yX21nbXQuaCBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9r
b21lZGEva29tZWRhX2NvbG9yX21nbXQuaAo+ID4gaW5kZXggYTJkZjIxOGY1OGU3Li4wOGFiNjky
ODE2NDggMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRh
L2tvbWVkYV9jb2xvcl9tZ210LmgKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxh
eS9rb21lZGEva29tZWRhX2NvbG9yX21nbXQuaAo+ID4gQEAgLTExLDcgKzExLDE0IEBACj4gPiAg
I2luY2x1ZGUgPGRybS9kcm1fY29sb3JfbWdtdC5oPgo+ID4gIAo+ID4gICNkZWZpbmUgS09NRURB
X05fWVVWMlJHQl9DT0VGRlMJCTEyCj4gPiArI2RlZmluZSBLT01FREFfTl9SR0IyWVVWX0NPRUZG
UwkJMTIKPiA+ICsjZGVmaW5lIEtPTUVEQV9DT0xPUl9QUkVDSVNJT04JCTEyCj4gPiArI2RlZmlu
ZSBLT01FREFfTl9HQU1NQV9DT0VGRlMJCTY1Cj4gPiArI2RlZmluZSBLT01FREFfQ09MT1JfTFVU
X1NJWkUJCUJJVChLT01FREFfQ09MT1JfUFJFQ0lTSU9OKQo+ID4gKyNkZWZpbmUgS09NRURBX05f
Q1RNX0NPRUZGUwkJOQo+ID4gKwo+ID4gK3ZvaWQgZHJtX2x1dF90b19mZ2FtbWFfY29lZmZzKHN0
cnVjdCBkcm1fcHJvcGVydHlfYmxvYiAqbHV0X2Jsb2IsIHUzMiAqY29lZmZzKTsKPiA+ICAKPiA+
ICBjb25zdCBzMzIgKmtvbWVkYV9zZWxlY3RfeXV2MnJnYl9jb2VmZnModTMyIGNvbG9yX2VuY29k
aW5nLCB1MzIgY29sb3JfcmFuZ2UpOwo+ID4gIAo+ID4gLSNlbmRpZgo+ID4gKyNlbmRpZiAvKl9L
T01FREFfQ09MT1JfTUdNVF9IXyovCj4gPiAtLSAKPiA+IDIuMjAuMQo+ID4gCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
