Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3B6E3669
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 17:20:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C87E66E446;
	Thu, 24 Oct 2019 15:20:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20040.outbound.protection.outlook.com [40.107.2.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71A556E446
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 15:20:04 +0000 (UTC)
Received: from VI1PR08CA0163.eurprd08.prod.outlook.com (2603:10a6:800:d1::17)
 by AM6PR08MB3574.eurprd08.prod.outlook.com (2603:10a6:20b:4e::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2367.20; Thu, 24 Oct
 2019 15:20:01 +0000
Received: from VE1EUR03FT052.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::207) by VI1PR08CA0163.outlook.office365.com
 (2603:10a6:800:d1::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2387.20 via Frontend
 Transport; Thu, 24 Oct 2019 15:20:01 +0000
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT052.mail.protection.outlook.com (10.152.19.173) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2387.20 via Frontend Transport; Thu, 24 Oct 2019 15:20:01 +0000
Received: ("Tessian outbound 081de437afc7:v33");
 Thu, 24 Oct 2019 15:19:59 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8deed213d56a1793
X-CR-MTA-TID: 64aa7808
Received: from 3e2b2aef10d0.2 (cr-mta-lb-1.cr-mta-net [104.47.9.54])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 684D38F7-0957-42EF-B7AB-A12BDDF5D270.1; 
 Thu, 24 Oct 2019 15:19:54 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2054.outbound.protection.outlook.com [104.47.9.54])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3e2b2aef10d0.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 24 Oct 2019 15:19:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UEwMDZTf+6PHziz1yLnWHsW68eTCGklo170c/4QRdwcnIIv94S9kTTzG/PUdtzipZO2y6o4Y5LG0W59w+Q7LXaxbC2UOjvfNShMm8A4Zb6zn9eKkKJVaqOO2sXr1CdIWGSg7tfnFTX16Iw2Cqo8nYPaURQUrQAmOekf3cvRJs3De12xNLRgbGF7oRujeHJEkTuTZOUxKh7JmsH6EOU+WCyO3m6EgtwxfRl/jvyzqMz2231QNBEYhv6ZteSRd3xfkMuT6hOi3i9PEmIbIsL5E0oqxlBYe0ozfGvJAbVfoWCpLWM0LaN1yJS2ZpgUU6tvCIV1gfdIY6wB5BPgDyWScgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HVRyS5LouQ5sJt3m+yDKy3GrbPgBDqdpcUsCSh9YUgw=;
 b=FhoQMWkuNjL0ARa9UBZeSXJhxc19sP2qGW6BV75lTugaVlpDXyIpaorC327i7vS4s88dlgTdoNV79E9KK7JhQmug4pMRvi0jQXPB2qkakV5iiFgtoqamydhAX2NUYGl9ZM6PkA7S56UnLbCMwAq3lpNYZ58xotjDDCgGDoyKu6bDiQQyqYPEvU/n/usg405AK8b87KhIf5N+zh7UnO/f85dXPPBYuyRrRseS+NfeyVfRUYpMchzlQzQOLNpcVTchU5wI6FwXQLedIKiu0ENqIUQc7HbUyVZ0osvsynnQgpE8abHSrMHmUBqoSiZBVWWa4b8dsgUlhLl2wbbyrbNaWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from AM0PR08MB5345.eurprd08.prod.outlook.com (52.132.215.213) by
 AM0PR08MB5137.eurprd08.prod.outlook.com (10.255.28.91) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.22; Thu, 24 Oct 2019 15:19:52 +0000
Received: from AM0PR08MB5345.eurprd08.prod.outlook.com
 ([fe80::109c:e558:5074:13e4]) by AM0PR08MB5345.eurprd08.prod.outlook.com
 ([fe80::109c:e558:5074:13e4%6]) with mapi id 15.20.2387.023; Thu, 24 Oct 2019
 15:19:52 +0000
From: Ayan Halder <Ayan.Halder@arm.com>
To: Rob Herring <robh+dt@kernel.org>
Subject: Re: Question regarding "reserved-memory"
Thread-Topic: Question regarding "reserved-memory"
Thread-Index: AQHVinZwwZsw70agmEe040OUqUpTNqdp3/4AgAAICoA=
Date: Thu, 24 Oct 2019 15:19:52 +0000
Message-ID: <20191024151951.GA29067@arm.com>
References: <20191024142211.GA29467@arm.com>
 <CAL_JsqJSSYdRyy=Hw4H613fWVyXM3ivFj8mgO6iwvXZQOr=9pA@mail.gmail.com>
In-Reply-To: <CAL_JsqJSSYdRyy=Hw4H613fWVyXM3ivFj8mgO6iwvXZQOr=9pA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P123CA0004.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::16) To AM0PR08MB5345.eurprd08.prod.outlook.com
 (2603:10a6:208:18c::21)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Ayan.Halder@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [217.140.106.53]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 02ebcbf3-4354-45e5-a654-08d75895a3b4
X-MS-TrafficTypeDiagnostic: AM0PR08MB5137:|AM0PR08MB5137:|AM6PR08MB3574:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB357445469E37C16E17CD3E8CE46A0@AM6PR08MB3574.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
x-forefront-prvs: 0200DDA8BE
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(366004)(396003)(136003)(39860400002)(189003)(199004)(186003)(76176011)(102836004)(25786009)(86362001)(66946007)(66476007)(66066001)(53546011)(386003)(6506007)(26005)(4326008)(3846002)(6116002)(81166006)(11346002)(81156014)(446003)(2616005)(476003)(486006)(14454004)(66556008)(8676002)(64756008)(66446008)(44832011)(8936002)(478600001)(6486002)(305945005)(7736002)(33656002)(6246003)(14444005)(54906003)(99286004)(316002)(6436002)(229853002)(256004)(5660300002)(2906002)(36756003)(71190400001)(71200400001)(6512007)(52116002)(1076003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB5137;
 H:AM0PR08MB5345.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: a3Al9ZnNHStOjXXtHSw/cApok7f8XWIGCOsza5kVAHhb0xCwtXipE9m1OokkoR+MAOrf3I/Zz0bNocycfWy8G9CotfSHqqi1seHwTKSbjC0+TK3/UP92JG5bVRMwQ8oarMaP3MjkUWHe+Vagr8mnekTSzKUV+F87YU77BU2gGx/+Py8dT5E0HNYfVr/5ltqwyX21ONOGKZPxsXiURWnxlJ1E/wPoVEKnQTengugBfzf80XergA4vQ1qbKfpsdq0BwMEdSKE63Y8sS1DlBQNqS05/9Fj6qH6T+z0NbLj8CAyFyBA7cEyEio/WQWMvsjXetditfgvYKhu0gOAJY87hwsUhpVE4bDl9w4dCWb2UKLW5GcsyiJEV92LcwZBmZqeYls9n/ZHXWZKv6JBA/jjWzGZBzAf4+8CCmh2chPjavpssvzLs9Q0bciz6lcRnJL4a
Content-ID: <47D9427BD490E34687050EE8A7647BE1@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5137
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Ayan.Halder@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(39860400002)(136003)(376002)(1110001)(339900001)(199004)(189003)(6246003)(36756003)(70206006)(6512007)(97756001)(76130400001)(70586007)(105606002)(33656002)(478600001)(4326008)(305945005)(47776003)(76176011)(26005)(7736002)(66066001)(6862004)(14454004)(26826003)(81156014)(50466002)(6506007)(8676002)(102836004)(386003)(356004)(53546011)(5660300002)(3846002)(8746002)(1076003)(81166006)(2906002)(316002)(99286004)(8936002)(54906003)(6116002)(14444005)(476003)(336012)(229853002)(86362001)(126002)(486006)(2616005)(186003)(11346002)(446003)(23726003)(36906005)(22756006)(6486002)(25786009)(46406003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB3574;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Fail; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 7052bbf4-1f77-4373-91ba-08d758959e19
NoDisclaimer: True
X-Forefront-PRVS: 0200DDA8BE
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I9WfWdGvM/70TeZMJnMWaVu3V3j5zTJOQkW2thSjDb+SI4F/tezk1GTFhgXHRFIV+KRqw1xanyJ/nMzMibExlHWS6QvaN3aqcGv7bg+8SpaWo28tim/Y2AWEldxglxjj+ClW/0u27pVWf+jbh+641GsdKorN/d4wSWf6ozouXQfkA3Ci60VWSPQwhF7OKb6gS3KSTctXnX2T9qdMD0hd7Oyp8sweRRFatWV3ZU5q45ozx86/JPuRfuOrcJ+pSMFEgwbqqdqXxKkHOjB5avTXCU8+OC2Nwv7g3F9zrVq3r1kC5XXIjXiSZ7iAclHPimSrFRKfYZPGmuhL3sVJ/v1KEZgcYe7p9/HfYZH3hqPFub5rhlm1PoU035iRFsBNpKVX69aHW2ea8pAYvHV+NG3p1WNB8Y/TnZzNhqIcM6P4VSKHPRlMVWf1TKOMZIDwZSFs
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2019 15:20:01.5070 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 02ebcbf3-4354-45e5-a654-08d75895a3b4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3574
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HVRyS5LouQ5sJt3m+yDKy3GrbPgBDqdpcUsCSh9YUgw=;
 b=pY0VaheEQuxunYkiRrD8hv5512qrUAim/LAQ/dl5GdpP3iZ5YmNfRWZI5vOMJxo2YPZlVDI8/IRzWQd7Bmh0PvwMj70lHiyUCb+oDvic8nZ8QkunRP/vetOIFmSKIE9Oa/UAQgh5lJ8nrCh/DkN/np+SGhIaQ0px+4/uihfutiE=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HVRyS5LouQ5sJt3m+yDKy3GrbPgBDqdpcUsCSh9YUgw=;
 b=pY0VaheEQuxunYkiRrD8hv5512qrUAim/LAQ/dl5GdpP3iZ5YmNfRWZI5vOMJxo2YPZlVDI8/IRzWQd7Bmh0PvwMj70lHiyUCb+oDvic8nZ8QkunRP/vetOIFmSKIE9Oa/UAQgh5lJ8nrCh/DkN/np+SGhIaQ0px+4/uihfutiE=
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
Cc: Mark Rutland <Mark.Rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, nd <nd@arm.com>,
 Liviu Dudau <Liviu.Dudau@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "james qian wang \(Arm Technology
 China\)" <james.qian.wang@arm.com>, Mihail Atanassov <Mihail.Atanassov@arm.com>,
 "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMjQsIDIwMTkgYXQgMDk6NTE6MDRBTSAtMDUwMCwgUm9iIEhlcnJpbmcgd3Jv
dGU6Cj4gT24gVGh1LCBPY3QgMjQsIDIwMTkgYXQgOToyMiBBTSBBeWFuIEhhbGRlciA8QXlhbi5I
YWxkZXJAYXJtLmNvbT4gd3JvdGU6CkhpIEJvYiwKClRoYW5rcyBmb3IgeW91ciBxdWljayByZXNw
b25zZS4KPiA+Cj4gPgo+ID4gSGkgRm9sa3MsCj4gPgo+ID4gSSBoYXZlIGEgcXVlc3Rpb24gcmVn
YXJkaW5nICJyZXNlcnZlZC1tZW1vcnkiLiBJIGFtIHVzaW5nIGFuIEFybSBKdW5vCj4gPiBwbGF0
Zm9ybSB3aGljaCBoYXMgYSBjaHVuayBvZiByYW0gaW4gaXRzIGZwZ2EuIEkgaW50ZW5kIHRvIG1h
a2UgdGhpcwo+ID4gbWVtb3J5IGFzIHJlc2VydmVkIHNvIHRoYXQgaXQgY2FuIGJlIHNoYXJlZCBi
ZXR3ZWVuIHZhcmlvdXMgZGV2aWNlcwo+ID4gZm9yIHBhc3NpbmcgZnJhbWVidWZmZXIuCj4gPgo+
ID4gTXkgZHRzIGxvb2tzIGxpa2UgdGhlIGZvbGxvd2luZzotCj4gPgo+ID4gLyB7Cj4gPiAgICAg
ICAgIC4uLi4gLy8gc29tZSBub2Rlcwo+ID4KPiA+ICAgICAgICAgdGx4QDYwMDAwMDAwIHsKPiA+
ICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gInNpbXBsZS1idXMiOwo+ID4gICAgICAgICAg
ICAgICAgIC4uLgo+ID4KPiA+ICAgICAgICAgICAgICAgICBqdW5vX3dyYXBwZXIgewo+ID4KPiA+
ICAgICAgICAgICAgICAgICAgICAgICAgIC4uLiAvKiBoZXJlIHdlIGhhdmUgYWxsIHRoZSBub2Rl
cyAqLwo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgIC8qIGNvcnJlc3BvbmRpbmcgdG8g
dGhlIGRldmljZXMgaW4gdGhlIGZwZ2EgKi8KPiA+Cj4gPiAgICAgICAgICAgICAgICAgICAgICAg
ICBtZW1vcnlAZDAwMDAwMCB7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZGV2
aWNlX3R5cGUgPSAibWVtb3J5IjsKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBy
ZWcgPSA8MHgwMCAweDYwMDAwMDAwIDB4MDAgMHg4MDAwMDAwPjsKPiA+ICAgICAgICAgICAgICAg
ICAgICAgICAgIH07Cj4gPgo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgcmVzZXJ2ZWQtbWVt
b3J5IHsKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAjYWRkcmVzcy1jZWxscyA9
IDwweDAxPjsKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAjc2l6ZS1jZWxscyA9
IDwweDAxPjsKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByYW5nZXM7Cj4gPgo+
ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZyYW1lYnVmZmVyQGQwMDAwMDAgewo+
ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAi
c2hhcmVkLWRtYS1wb29sIjsKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBsaW51eCxjbWEtZGVmYXVsdDsKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICByZXVzYWJsZTsKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICByZWcgPSA8MHgwMCAweDYwMDAwMDAwIDB4MDAgMHg4MDAwMDAwPjsKPiA+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwaGFuZGxlID0gPDB4NDQ+Owo+ID4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB9Owo+ID4gICAgICAgICAgICAgICAgICAg
ICAgICAgfTsKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIC4uLgo+ID4gICAgICAgICAgICAg
ICAgIH0KPiA+ICAgICAgICAgfQo+ID4gLi4uCj4gPiB9Cj4gPgo+ID4gTm90ZSB0aGF0IHRoZSBk
ZXB0aCBvZiB0aGUgInJlc2VydmVkLW1lbW9yeSIgbm9kZSBpcyAzLgo+ID4KPiA+IFJlZmVyIF9f
ZmR0X3NjYW5fcmVzZXJ2ZWRfbWVtKCkgOi0KPiA+Cj4gPiAgICAgICAgIGlmICghZm91bmQgJiYg
ZGVwdGggPT0gMSAmJiBzdHJjbXAodW5hbWUsICJyZXNlcnZlZC1tZW1vcnkiKSA9PSAwKSB7Cj4g
Pgo+ID4gICAgICAgICAgICAgICAgIGlmIChfX3Jlc2VydmVkX21lbV9jaGVja19yb290KG5vZGUp
ICE9IDApIHsKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIHByX2VycigiUmVzZXJ2ZWQgbWVt
b3J5OiB1bnN1cHBvcnRlZCBub2RlCj4gPiBmb3JtYXQsIGlnbm9yaW5nXG4iKTsKPiA+ICAgICAg
ICAgICAgICAgICAgICAgICAgIC8qIGJyZWFrIHNjYW4gKi8KPiA+ICAgICAgICAgICAgICAgICAg
ICAgICAgIHJldHVybiAxOwo+ID4gICAgICAgICAgICAgICAgIH0KPiA+ICAgICAgICAgICAgICAg
ICBmb3VuZCA9IDE7Cj4gPgo+ID4gICAgICAgICAgICAgICAgIC8qIHNjYW4gbmV4dCBub2RlICov
Cj4gPiAgICAgICAgICAgICAgICAgcmV0dXJuIDA7Cj4gPiAgICAgICAgIH0KPiA+Cj4gPiBJdCBl
eHBlY3RzIHRoZSAicmVzZXJ2ZWQtbWVtb3J5IiBub2RlIHRvIGJlIGF0IGRlcHRoID09IDEgYW5k
IHNvIGl0Cj4gPiBkb2VzIG5vdCBwcm9iZSBpdCBpbiBvdXIgY2FzZS4KPiA+Cj4gPiBOaWV0aGVy
IGZyb20gdGhlCj4gPiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmVzZXJ2ZWQt
bWVtb3J5L3Jlc2VydmVkLW1lbW9yeS50eHQKPiA+ICBub3IgZnJvbSBjb21taXQgLSBlOGQ5ZDFm
NTQ4NWI1MmVjM2M0ZDdhZjgzOWU2OTE0NDM4ZjZjMjg1LAo+ID4gSSBjb3VsZCB1bmRlcnN0YW5k
IHRoZSByZWFzb24gZm9yIHN1Y2ggcmVzdHJpY3Rpb24uCj4gPgo+ID4gU28sIEkgc2VlayB0aGUg
Y29tbXVuaXR5J3MgYWR2aWNlIGFzIHRvIHdoZXRoZXIgSSBzaG91bGQgZml4IHVwCj4gPiBfX2Zk
dF9zY2FuX3Jlc2VydmVkX21lbSgpIHNvIGFzIHRvIGRvIGF3YXkgd2l0aCB0aGUgcmVzdHJpY3Rp
b24gb3IKPiA+IHB1dCB0aGUgInJlc2VydmVkLW1lbW9yeSIgbm9kZSBvdXRzaWRlIG9mICd0bHhA
NjAwMDAwMDAnICh3aGljaCBsb29rcwo+ID4gIGxvZ2ljYWxseSBpbmNvcnJlY3QgYXMgdGhlIG1l
bW9yeSBpcyBvbiB0aGUgZnBnYSBwbGF0Zm9ybSkuCj4gCj4gRm9yIG5vdywgSSdtIGdvaW5nIHRv
IHNheSBpdCBtdXN0IGJlIGF0IHRoZSByb290IGxldmVsLiAKQ2FuIHlvdSBtZW50aW9uIGl0IGlu
IHRoZSBEb2N1bWVudGF0aW9uLy4uLi9yZXNlcnZlZC1tZW1vcnkudHh0LApwbGVhc2U/Cgo+IEkn
ZCBndWVzcyB0aGUKPiBtZW1vcnlAZDAwMDAwMCBub2RlIGlzIGFsc28ganVzdCBpZ25vcmVkICh3
cm9uZyB1bml0LWFkZHJlc3MgQlRXKS4KSSB3b3VsZCByZXF1ZXN0IHlvdSB0byBpZ25vcmUgdGhl
IGFkZHJlc3MgZm9yIHRoZSB0aW1lIGJlaW5nLiBJbgpqdW5vX3dyYXBwZXJ7fSwgd2UgaGF2ZSBh
IGNvbXBsZXggcmVtYXBwaW5nIG9mIGFkZHJlc3NlcyBvZiBhbGwgdGhlCnN1Yi1kZXZpY2VzLiBJ
IGRlbGliZXJhdGVseSBkaWQgbm90IHB1dCB0aGF0IGluIHRoZSBzbmlwcGV0LCBzbyBhcyB0bwpw
cmV2ZW50IGFueSBkaXN0cmFjdGlvbiBmcm9tIHRoZSBjb3JlIGlzc3VlLgoKPiAKPiBJIHRoaW5r
IHlvdSdyZSBhbHNvIGZvcmdldHRpbmcgdGhlIGxhdGVyIHVuZmxhdHRlbmVkIHBhcnNpbmcgb2YK
PiAvcmVzZXJ2ZWQtbWVtb3J5LgpBcmUgeW91IHRhbGtpbmcgYWJvdXQgdGhlIHJlbWFpbmluZyBw
YXJ0IG9mIHRoZQpfX2ZkdF9zY2FuX3Jlc2VydmVkX21lbSgpIGllCgogICAgICAgLi4uLgogICAg
ICAgIH0gZWxzZSBpZiAoZm91bmQgJiYgZGVwdGggPCAyKSB7CiAgICAgICAgICAgICAgICAvKiBz
Y2FubmluZyBvZiAvcmVzZXJ2ZWQtbWVtb3J5IGhhcyBiZWVuIGZpbmlzaGVkICovCiAgICAgICAg
ICAgICAgICByZXR1cm4gMTsKICAgICAgICB9CgogICAgICAgIGlmICghb2ZfZmR0X2RldmljZV9p
c19hdmFpbGFibGUoaW5pdGlhbF9ib290X3BhcmFtcywgbm9kZSkpCiAgICAgICAgICAgICAgICBy
ZXR1cm4gMDsKCiAgICAgICAgZXJyID0gX19yZXNlcnZlZF9tZW1fcmVzZXJ2ZV9yZWcobm9kZSwg
dW5hbWUpOwogICAgICAgIGlmIChlcnIgPT0gLUVOT0VOVCAmJiBvZl9nZXRfZmxhdF9kdF9wcm9w
KG5vZGUsICJzaXplIiwgTlVMTCkpCiAgICAgICAgICAgICAgICBmZHRfcmVzZXJ2ZWRfbWVtX3Nh
dmVfbm9kZShub2RlLCB1bmFtZSwgMCwgMCk7CgogICAgICAgIC8qIHNjYW4gbmV4dCBub2RlICov
CiAgICAgICAgcmV0dXJuIDA7CgpJZiBzbywgSSBhZ3JlZSB3aXRoIHlvdSB0aGF0IGl0IG5lZWRz
IHRvIGJlIGNoYW5nZWQgYXMgd2VsbCAoaWYgd2UKd2VyZSB0byBkbyBhd2F5IHdpdGggdGhlIHJl
c3RyaWN0aW9uKS4KCj4gVGhlIG90aGVyIGNvbXBsaWNhdGlvbiBJSVJDIGlzIGJvb3Rpbmcgd2l0
aCBVRUZJCj4gZG9lcyBpdCdzIG93biByZXNlcnZlZCBtZW1vcnkgdGFibGUgd2hpY2ggb2Z0ZW4g
dXNlcyB0aGUgRFQgdGFibGUgYXMKPiBpdHMgc291cmNlLgpJIGhhdmUgbm8ga25vd2xlZGdlIG9m
IFVFRkkgYm9vdGluZy4gU28gaWYgVUVGSSBleHBlY3RzCiJyZXNlcnZlZC1tZW1vcnkiIG5vZGVz
IHRvIGJlIGF0IHJvb3QgbGV2ZWwsIHRoZW4gd2UgbXVzdCBhZGhlcmUgdG8KdGhlIHJlc3RyaWN0
aW9uLiA6KQoKQXlhbgo+IAo+IFJvYgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
