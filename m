Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79948BFD24
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2019 04:22:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 661D36EE3E;
	Fri, 27 Sep 2019 02:22:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140044.outbound.protection.outlook.com [40.107.14.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B913F6EE3E
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2019 02:22:41 +0000 (UTC)
Received: from VI1PR08CA0119.eurprd08.prod.outlook.com (2603:10a6:800:d4::21)
 by VI1PR08MB2782.eurprd08.prod.outlook.com (2603:10a6:802:19::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.26; Fri, 27 Sep
 2019 02:22:37 +0000
Received: from DB5EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::209) by VI1PR08CA0119.outlook.office365.com
 (2603:10a6:800:d4::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2305.20 via Frontend
 Transport; Fri, 27 Sep 2019 02:22:37 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT025.mail.protection.outlook.com (10.152.20.104) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Fri, 27 Sep 2019 02:22:35 +0000
Received: ("Tessian outbound 851a1162fca7:v33");
 Fri, 27 Sep 2019 02:22:31 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4b6112c4c3b5d4a7
X-CR-MTA-TID: 64aa7808
Received: from 7cfb8e3b9955.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.1.51]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 885D8583-355E-410A-AB75-3B22B005693F.1; 
 Fri, 27 Sep 2019 02:22:26 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2051.outbound.protection.outlook.com [104.47.1.51])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7cfb8e3b9955.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Fri, 27 Sep 2019 02:22:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DrzhtzxQQh3V85ujLDgApRq5D+1YXGfwl5dDtUceQo+9L4Ct9TamRDR0OTsZHONiLWVVndfir/WlQR/J/OQwTKmwek3abmEbnYYChKuRQukZR7oD8Uu7edfiV7N017m+18x8YhV+fTMq4jCZTEdH0ntkjIE8InLR1FmA9o+qTUVor4yuNznIrmvljt5jhutxrxji1Qfb3v/yix/DCygyWyz7a0+UP+7ATS/PsxMDfNsyVILi+7FkQKF7z/tql/WaVb7Ir78hd9T0IiTayjf0BEonaRd1NcaoMO3+U6mZ9Hip/+HUY3CSKy3PtwBi9q8/be/44kAiT0zvS+znxG2jXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sj3uqaFoS7iFPNXbwuuCnsulqMWJX5WdBCY6BJ/hxA0=;
 b=N6BHLHtMgGXsYyrt3afg2Zw3PkTaKzoC/aNlmhFSvEd+vUpOL+A7Cy3Oz4p7RD6gAlv0KsRtvRdcAcOjzfpxkT0odBei9ehhEF8cRVdpylKL91Qc2MEIKxOXZGnb49dD2ZaUmwVPRWQkQVRdYibLWz1vs5eDZThASqKO1JctCVI2L4p1Y/KzniybWp5SwSxwlNvWVHa9q8vy+lxYT8IFm8VGP/+uk3a5WpYKtopkCPwjBoqTUylLt4c0pa+qKa1eqZMjjqkMTGepwxgkSGHPNA/a4e4r2Vy8Dx6yqnzw8AiXNmFV2HS3beaCZOuVUv2MwTvxtdXCUw5B0Whl5e9aFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4847.eurprd08.prod.outlook.com (10.255.114.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.18; Fri, 27 Sep 2019 02:22:25 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a0a6:ad4c:b7a7:f879]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a0a6:ad4c:b7a7:f879%5]) with mapi id 15.20.2284.023; Fri, 27 Sep 2019
 02:22:25 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Brian Starkey <Brian.Starkey@arm.com>
Subject: Re: [PATCH] drm/komeda: Adds output-color format/depth support
Thread-Topic: [PATCH] drm/komeda: Adds output-color format/depth support
Thread-Index: AQHVb5fml3iiEtk+MEOqXjNduhm+kKc5MiiAgADp5ICAAhFyAIACqBcA
Date: Fri, 27 Sep 2019 02:22:24 +0000
Message-ID: <20190927022218.GA11732@jamwan02-TSP300>
References: <20190920094329.17513-1-lowry.li@arm.com>
 <20190923121604.jqi6ewln27yvdajw@DESKTOP-E1NTVVP.localdomain>
 <20190924021313.GA15776@jamwan02-TSP300>
 <20190925094810.fbeyt7fxvyhaip33@DESKTOP-E1NTVVP.localdomain>
In-Reply-To: <20190925094810.fbeyt7fxvyhaip33@DESKTOP-E1NTVVP.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2P15301CA0013.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::23) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: bdc12179-c463-4958-0d06-08d742f18f80
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:VE1PR08MB4847; 
X-MS-TrafficTypeDiagnostic: VE1PR08MB4847:|VE1PR08MB4847:|VI1PR08MB2782:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VI1PR08MB2782BC4B5CF2EFD77E0FE552B3810@VI1PR08MB2782.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:8273;
x-forefront-prvs: 0173C6D4D5
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(346002)(376002)(39860400002)(366004)(396003)(136003)(189003)(199004)(478600001)(2906002)(14454004)(86362001)(25786009)(186003)(7736002)(26005)(386003)(446003)(486006)(476003)(6636002)(55236004)(99286004)(66946007)(6506007)(66476007)(76176011)(3846002)(71200400001)(71190400001)(52116002)(66556008)(66446008)(64756008)(6116002)(6512007)(9686003)(6862004)(6486002)(6246003)(4744005)(66066001)(305945005)(102836004)(6436002)(11346002)(1076003)(229853002)(8936002)(54906003)(8676002)(81156014)(4326008)(81166006)(316002)(58126008)(33656002)(5660300002)(33716001)(256004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4847;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: bw9t85S6ViV+V79hqy69DbYxx4JEK2RtBgl0CdoU4pP+/Q35U1IeJJyEyjilyA6QGc3U6UXzx6NAx2uyu9E31T0XutLp4EIc6P3ns/gxMYzH344wtbAFmIzM08vc8ENPk6P2vTPCoQRvJy92GLhpmZSD9zYU4epJBfZkNB5FMnj8GloYsE3aCcoUd0bwQFyYfIy5CT0Z2330QwfsgZHqvaU2JPzc8K+cPWV/xMd4X/1GTkKZ/tj+XvaYD08eLRRNfspiKJ3Ud5/NAyPmx18V0S4nxC26Rm/T/R8ribNWKapeQRhYvAnNYgU5HyBsVrE7p3J0Z3GTTGsCKcnat2aIiClBUI1FFZ0mVC//u92K51tHrQnYIx9Kjz9mG7emzGwV64S7v/luDuu+iiPWZHMAucjj8r27zVB42buiPMwABpQ=
Content-ID: <A5B6D405326C164F9FFC6ACC39BE50EF@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4847
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(39860400002)(136003)(396003)(376002)(346002)(189003)(199004)(4744005)(76130400001)(47776003)(3846002)(6116002)(81156014)(8936002)(305945005)(33716001)(11346002)(50466002)(478600001)(6636002)(22756006)(486006)(25786009)(476003)(336012)(76176011)(6506007)(4326008)(1076003)(33656002)(7736002)(54906003)(446003)(14454004)(26826003)(99286004)(102836004)(70586007)(63350400001)(6512007)(97756001)(6862004)(9686003)(5660300002)(86362001)(6486002)(8746002)(23726003)(356004)(186003)(8676002)(126002)(66066001)(2906002)(229853002)(70206006)(386003)(6246003)(316002)(26005)(46406003)(81166006)(58126008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB2782;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 4989c802-b7c4-46af-586c-08d742f188da
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(710020)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:VI1PR08MB2782; 
NoDisclaimer: True
X-Forefront-PRVS: 0173C6D4D5
X-Microsoft-Antispam-Message-Info: PEEc7Qj8odSZ9iYvNpH3JQWasD2LRowxfI8WA2sYbQrRJ6MscrsjUkBj82pHiQco6jTmZdYS1OG3z65Gb1l48iduhlSQdqZ6ALXLhJMIOf2JynumJucaNqEF1J3sBxWuDRJe+M9ozrS4uPstTbqoqXO7zgL8+M7c7dmisWqp9xcUdjlOS8XAbnBIxbpCmiLu+U/v6ns5TteKyfhpLJ1jta/6b4yhtM6Bbvg3R+Z/edOf/4KrgQ/PmIKdtfkXljrQ+aFKkconSrQIrJPeA4LP6AiyXHPJWyRa8YDqDRMdOgz4TthuRxW0LXqBTHKEhlkU0nDEF4Jk7qrQT6ha8cFvEArpt361hUHkGIySfPj/BfOSTOJjb9chgYyrs9AfVgdO7C+JC7goZ5iZ3CTiEx85nT5hqj4tSzRPZpXblXvcWgw=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2019 02:22:35.7799 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bdc12179-c463-4958-0d06-08d742f18f80
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2782
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sj3uqaFoS7iFPNXbwuuCnsulqMWJX5WdBCY6BJ/hxA0=;
 b=eJH/moj/3iyRu0TeWPAS1nvGigc/eWEf4x3f+LMAltIGFgm28g13AYmlgwDWkJECSfYqwvV2fSQPEhhCYc9h079QaRlaQXorjvhWJMzG57YgAe9fdCrWnRQtW1Am3YzYe1JHyEZYADf9py3cU58R+pRlH+PSiOzZVvLog0I9v6A=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sj3uqaFoS7iFPNXbwuuCnsulqMWJX5WdBCY6BJ/hxA0=;
 b=eJH/moj/3iyRu0TeWPAS1nvGigc/eWEf4x3f+LMAltIGFgm28g13AYmlgwDWkJECSfYqwvV2fSQPEhhCYc9h079QaRlaQXorjvhWJMzG57YgAe9fdCrWnRQtW1Am3YzYe1JHyEZYADf9py3cU58R+pRlH+PSiOzZVvLog0I9v6A=
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
Cc: nd <nd@arm.com>, Mihail Atanassov <Mihail.Atanassov@arm.com>,
 "airlied@linux.ie" <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>,
 Ayan Halder <Ayan.Halder@arm.com>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBTZXAgMjUsIDIwMTkgYXQgMDk6NDg6MTFBTSArMDAwMCwgQnJpYW4gU3RhcmtleSB3
cm90ZToKPiBIaSBKYW1lcywKPiAKPiBPbiBUdWUsIFNlcCAyNCwgMjAxOSBhdCAwMjoxMzoyN0FN
ICswMDAwLCBqYW1lcyBxaWFuIHdhbmcgKEFybSBUZWNobm9sb2d5IENoaW5hKSB3cm90ZToKPiA+
IAo+ID4gSGkgQnJpYW46Cj4gPiAKPiA+IFNpbmNlIG9uZSBtb25pdG9yIGNhbiBzdXBwb3J0IG11
dGlwbGUgY29sb3ItZm9ybWF0cywgdGhpcyBEVCBwcm9wZXJ0eQo+ID4gc3VwcGx5IGEgd2F5IGZv
ciB1c2VyIHRvIHNlbGVjdCBhIHNwZWNpZmljIG9uZSBmcm9tIHRoaXMgc3VwcG9ydGVkCj4gPiBj
b2xvci1mb3JtYXRzLgo+IAo+IE1vZGlmeWluZyBEVCBpcyBhIF9yZWFsbHlfIHVzZXItdW5mcmll
bmRseSB3YXkgb2Ygc3BlY2lmeWluZwo+IHByZWZlcmVuY2VzLiBJZiB3ZSB3YW50IGEgdXNlciB0
byBiZSBhYmxlIHRvIHBpY2sgYSBwcmVmZXJyZWQgZm9ybWF0LAo+IHRoZW4gaXQgc2hvdWxkIHBy
b2JhYmx5IGJlIHZpYSB0aGUgYXRvbWljIEFQSSBhcyBWaWxsZSBtZW50aW9uZWQuCj4KCkhpIEJy
aWFuOgoKQWdyZWUsIGEgZHJtIFVQQUkgbWlnaHQgYmUgdGhlIGJlc3QgJiByaWdodCB3YXkgZm9y
IHRoaXMuCgpJIGNhbiByYWlzZSBhIG5ldyB0aHJlYWQvdG9waWMgdG8gZGlzY3VzcyB0aGUgIkhP
VyBUTyIsIG1heWJlIGFmdGVyIHRoZQpDaGluZXNlIG5hdGlvbmFsIGRheS4KCkxBU1Q6CndoYXQg
ZG8geW91IHRoaW5rIGFib3V0IHRoaXMgcGF0Y2g6Ci0gSnVzdCBkcm9wIGl0LCB3YWl0aW5nIGZv
ciB0aGUgbmV3IHVhcGkKLSBvciBrZWVwIGl0LCBhbmQgcmVwbGFjZSBpdCBvbmNlIG5ldyB1YXBp
IGlzIHJlYWR5LgoKVGhhbmtzCkphbWVzCgo+IENoZWVycywKPiAtQnJpYW4KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
