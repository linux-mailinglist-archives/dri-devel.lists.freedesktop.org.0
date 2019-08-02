Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9AF7F4B4
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 12:09:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8816F6EDA7;
	Fri,  2 Aug 2019 10:09:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on061b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0d::61b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 768206EDA7
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2019 10:09:54 +0000 (UTC)
Received: from VI1PR08CA0268.eurprd08.prod.outlook.com (2603:10a6:803:dc::41)
 by HE1PR0802MB2601.eurprd08.prod.outlook.com (2603:10a6:3:d8::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2136.16; Fri, 2 Aug
 2019 10:09:48 +0000
Received: from VE1EUR03FT008.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::205) by VI1PR08CA0268.outlook.office365.com
 (2603:10a6:803:dc::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2136.14 via Frontend
 Transport; Fri, 2 Aug 2019 10:09:48 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT008.mail.protection.outlook.com (10.152.18.75) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Fri, 2 Aug 2019 10:09:46 +0000
Received: ("Tessian outbound 6d016ca6b65d:v26");
 Fri, 02 Aug 2019 10:09:36 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8e6416691434723b
X-CR-MTA-TID: 64aa7808
Received: from 804603496778.1 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.2.53]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0483FA3E-A63E-48E7-92A4-124BA5A31D6E.1; 
 Fri, 02 Aug 2019 10:09:30 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2053.outbound.protection.outlook.com [104.47.2.53])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 804603496778.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 02 Aug 2019 10:09:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jalIwTcSv3c0mxeks8Wg80abLv8CRDSLltCiU0iEIyotcHHZlzn7H8RB0A9Y/VPNjptV/WY8Wbt/A0beFsf4sedKRq5/fXWtf/nCkMjhcOKdj0LIyZZkVvk7jjNVi3NGW4YtZYZupIWymLsGdKR2YEDLXiiGmEkFqxMbHe2WLqTNN66O5fkExS/GfdcXIzl+gd1T9XKvQcCVXtt1dhAyeIAT7A/bUyUU84RJA6WlarwF/0GmxT03tygcbUuTK7rTkuPNTl3+N9rZb2/SdQWzN8vdASplMDxMfC/CM2FN0+sTr4cRJ3z46h0lRWb4fNyTEb951ihIXx5+c37AGBjSgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y8+OSCk/ak1i/kQcxlGd0LCbOC/mtv2ZuTBqrWXKvp8=;
 b=SFGRC/HfEx3n2zhVz2ZAec37ghxwAaLF43ZX8qRfnJtbsRq6ZrkX5zLmrMOLVoPmArKhkFy5iUbfNRQD681zq9hWH2oHd1h4zCGnT2alogmeNUFV13riBEo9zaqa5nl9STKF5iawPOXnRyKs+RuJjguSdavr7usPQUep5orn6GzjmDxMoQm3kfEvfYEbv5uWvx8Gl+h7+QRTXgD6icaNh3tI+1bBk4ZsUWs2rckae8zAuKXc8ROxGQfZxUF0iPJQ9mrzihISleu+JSlpciMpx5h0MSiTprsguJrXi/6nXn/uhjvYiVP3cAVnIgu2RThqi+6Gom8M+KJtbuH6VpV2OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=arm.com;dmarc=pass action=none header.from=arm.com;dkim=pass
 header.d=arm.com;arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4800.eurprd08.prod.outlook.com (10.255.114.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.15; Fri, 2 Aug 2019 10:09:27 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::2151:f0b1:3ea7:c134]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::2151:f0b1:3ea7:c134%6]) with mapi id 15.20.2136.010; Fri, 2 Aug 2019
 10:09:27 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Brian Starkey <Brian.Starkey@arm.com>
Subject: Re: [PATCH v1 2/2] drm: Clear the fence pointer when writeback job
 signaled
Thread-Topic: [PATCH v1 2/2] drm: Clear the fence pointer when writeback job
 signaled
Thread-Index: AQHVR4/K4z4SAitqoEqzGGms5irnZ6bktjQAgAEg6gCAAcNIAIAACyyA
Date: Fri, 2 Aug 2019 10:09:26 +0000
Message-ID: <20190802100919.GA26225@jamwan02-TSP300>
References: <1564571048-15029-1-git-send-email-lowry.li@arm.com>
 <1564571048-15029-3-git-send-email-lowry.li@arm.com>
 <20190731132002.dut5mdsqgh7b75iv@DESKTOP-E1NTVVP.localdomain>
 <20190801063351.GB17887@lowry.li@arm.com>
 <20190802092920.4la5cwrltv2m6dke@DESKTOP-E1NTVVP.localdomain>
In-Reply-To: <20190802092920.4la5cwrltv2m6dke@DESKTOP-E1NTVVP.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0PR03CA0119.apcprd03.prod.outlook.com
 (2603:1096:203:b0::35) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 81e48057-fe90-49cc-bc11-08d717318c1a
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR08MB4800; 
X-MS-TrafficTypeDiagnostic: VE1PR08MB4800:|HE1PR0802MB2601:
X-Microsoft-Antispam-PRVS: <HE1PR0802MB2601357AA5924F27F09530B4B3D90@HE1PR0802MB2601.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:4125;OLM:4125;
x-forefront-prvs: 011787B9DD
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(376002)(346002)(366004)(39860400002)(136003)(396003)(189003)(199004)(58126008)(68736007)(1076003)(53936002)(76176011)(6246003)(14454004)(6116002)(3846002)(2906002)(4326008)(86362001)(71190400001)(71200400001)(6862004)(5660300002)(7416002)(66476007)(64756008)(256004)(486006)(9686003)(6512007)(186003)(66556008)(52116002)(478600001)(66446008)(66946007)(8676002)(81166006)(81156014)(99286004)(33656002)(6636002)(8936002)(305945005)(6506007)(386003)(6436002)(33716001)(55236004)(6486002)(26005)(11346002)(7736002)(54906003)(446003)(229853002)(102836004)(25786009)(316002)(476003)(66066001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4800;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: O+b1mwjUKDIzHejqGWJdW8KldKFEJrIpB/8BmoZ5bOSp8o0nCx7PRcEDVmO32QXkKXwggJLbuamv9puo+4RaWdXMK7E56M2nM+DKdhmPRvJ/0j/zoXRwlXzsdqI4RG/3OdZST859nQWe2MTa/DoE0LA1zb0Uz8z/KL0NSy3j3XdMbq9R0pVfkPpAo+OhA2ZXoQ2fCpF/e14iKUjv2zayhPT9MDmId5NftaM0wHSvcuJtCayKRcWRRMuNq0FEQTik3tIJDukXBBR9vmtNgqdUBRibm1mbtqKL//0ww6SF8lymcQzuZyYrhf3DLvfbZhhL/7c8nkXlGED94izLaJ6e+dWj1+mANh6QtUwJNkT221SF6Me1DbwiU1MCysUqQEJCNO+Sj4hD8RzR5KzEN5bMLFnc9/ZBjqnQDvySpTxYwRU=
Content-ID: <ABE785F5D86ED140AD93C732BBEBA4F6@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4800
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(39860400002)(396003)(376002)(346002)(136003)(2980300002)(199004)(189003)(478600001)(26826003)(81156014)(50466002)(23726003)(9686003)(229853002)(6636002)(6486002)(356004)(33656002)(2906002)(81166006)(6116002)(3846002)(54906003)(316002)(102836004)(26005)(386003)(6506007)(97756001)(8746002)(4326008)(36906005)(58126008)(6512007)(8936002)(6246003)(70206006)(11346002)(63370400001)(446003)(63350400001)(126002)(476003)(70586007)(486006)(14454004)(6862004)(186003)(46406003)(76130400001)(7736002)(1076003)(99286004)(86362001)(33716001)(22756006)(8676002)(336012)(25786009)(5660300002)(66066001)(76176011)(305945005)(47776003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:HE1PR0802MB2601;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 3589f375-24cf-4038-0409-08d717318022
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(710020)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:HE1PR0802MB2601; 
NoDisclaimer: True
X-Forefront-PRVS: 011787B9DD
X-Microsoft-Antispam-Message-Info: YdXSpRd9pC+iHp3WoaCZSFT3arS66vH+1nWAve/OCbcy4SxT8gWfklfoj9jJaGyRY54yGrGvRNXJq21Bt43XSzDsw7VadEFAs69ADScX9nIUoIXht2Dwg7MoOZFs5ppZ2lOcxlHD7NFH58TTUMVHhaQAEYccltQglkupaMUMwdk2srx318csjK3nyRDtHHl1n2viWip0wKrX6wIKJcGc4EPfR5e6OMAGc7+B37hpF9pQy0gbi6xQxhk+8Qr1ToaLkdWEmELfdhkkjgHO/rbJs4lClbvjW7awnBmpW1tbXSz+9ThhOOEfDHjx/ShtOXu/zs2zMq3UF7bb84JB6w/4gzNwIKgck65y5VuOgY2ubR9X9uBqhsYVfTZxOsgxtAkYHjtnhrfsOcdvqj1m71Vylxnk4B7k0ARXvKa/+CU2a4o=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2019 10:09:46.6342 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81e48057-fe90-49cc-bc11-08d717318c1a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2601
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y8+OSCk/ak1i/kQcxlGd0LCbOC/mtv2ZuTBqrWXKvp8=;
 b=dR4rMXHIzBUJCuM7lObIE/MNMCV5S1PDLkl29dF+/tB/7vKC5xW7BYVI6MlTPFCoJcPM456/SKIt1NEWuSg0xoHAW8AW1G1XDzCerTqy3P++k+Q2PQjTxE5zkzLgw4bl9geMTf9oExm+i0xUhSntmx+Lp//91XZKRaRzG5jQBNI=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y8+OSCk/ak1i/kQcxlGd0LCbOC/mtv2ZuTBqrWXKvp8=;
 b=dR4rMXHIzBUJCuM7lObIE/MNMCV5S1PDLkl29dF+/tB/7vKC5xW7BYVI6MlTPFCoJcPM456/SKIt1NEWuSg0xoHAW8AW1G1XDzCerTqy3P++k+Q2PQjTxE5zkzLgw4bl9geMTf9oExm+i0xUhSntmx+Lp//91XZKRaRzG5jQBNI=
X-Mailman-Original-Authentication-Results: spf=temperror (sender IP is
 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=temperror action=none header.from=arm.com;
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
Cc: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 nd <nd@arm.com>, Ayan Halder <Ayan.Halder@arm.com>,
 "airlied@linux.ie" <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>,
 "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>,
 "kieran.bingham+renesas@ideasonboard.com"
 <kieran.bingham+renesas@ideasonboard.com>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>,
 "sean@poorly.run" <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBdWcgMDIsIDIwMTkgYXQgMDU6Mjk6MjBQTSArMDgwMCwgQnJpYW4gU3RhcmtleSB3
cm90ZToKPiBIaSBMb3dyeSwKPiAKPiBPbiBUaHUsIEF1ZyAwMSwgMjAxOSBhdCAwNjozNDowOEFN
ICswMDAwLCBMb3dyeSBMaSAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIHdyb3RlOgo+ID4gSGkgQnJp
YW4sCj4gPiAKPiA+IE9uIFdlZCwgSnVsIDMxLCAyMDE5IGF0IDA5OjIwOjA0UE0gKzA4MDAsIEJy
aWFuIFN0YXJrZXkgd3JvdGU6Cj4gPiA+IEhpIExvd3J5LAo+ID4gPiAKPiA+ID4gVGhhbmtzIGZv
ciB0aGlzIGNsZWFudXAuCj4gPiA+IAo+ID4gPiBPbiBXZWQsIEp1bCAzMSwgMjAxOSBhdCAxMTow
NDo0NUFNICswMDAwLCBMb3dyeSBMaSAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIHdyb3RlOgo+ID4g
PiA+IER1cmluZyBpdCBzaWduYWxzIHRoZSBjb21wbGV0aW9uIG9mIGEgd3JpdGViYWNrIGpvYiwg
YWZ0ZXIgcmVsZWFzaW5nCj4gPiA+ID4gdGhlIG91dF9mZW5jZSwgd2UnZCBjbGVhciB0aGUgcG9p
bnRlci4KPiA+ID4gPiAKPiA+ID4gPiBDaGVjayBpZiBmZW5jZSBsZWZ0IG92ZXIgaW4gZHJtX3dy
aXRlYmFja19jbGVhbnVwX2pvYigpLCByZWxlYXNlIGl0Lgo+ID4gPiA+IAo+ID4gPiA+IFNpZ25l
ZC1vZmYtYnk6IExvd3J5IExpIChBcm0gVGVjaG5vbG9neSBDaGluYSkgPGxvd3J5LmxpQGFybS5j
b20+Cj4gPiA+ID4gLS0tCj4gPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fd3JpdGViYWNrLmMg
fCAyMyArKysrKysrKysrKysrKystLS0tLS0tLQo+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTUg
aW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKPiA+ID4gPiAKPiA+ID4gPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2RybV93cml0ZWJhY2suYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1f
d3JpdGViYWNrLmMKPiA+ID4gPiBpbmRleCBmZjEzOGI2Li40M2Q5ZTNiIDEwMDY0NAo+ID4gPiA+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fd3JpdGViYWNrLmMKPiA+ID4gPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vZHJtX3dyaXRlYmFjay5jCj4gPiA+ID4gQEAgLTMyNCw2ICszMjQsOSBAQCB2
b2lkIGRybV93cml0ZWJhY2tfY2xlYW51cF9qb2Ioc3RydWN0IGRybV93cml0ZWJhY2tfam9iICpq
b2IpCj4gPiA+ID4gIAlpZiAoam9iLT5mYikKPiA+ID4gPiAgCQlkcm1fZnJhbWVidWZmZXJfcHV0
KGpvYi0+ZmIpOwo+ID4gPiA+ICAKPiA+ID4gPiArCWlmIChqb2ItPm91dF9mZW5jZSkKPiA+ID4g
Cj4gPiA+IEknbSB0aGlua2luZyBpdCBtaWdodCBiZSBhIGdvb2QgaWRlYSB0byBzaWduYWwgdGhl
IGZlbmNlIHdpdGggYW4gZXJyb3IKPiA+ID4gaGVyZSwgaWYgaXQncyBub3QgYWxyZWFkeSBzaWdu
YWxlZC4gT3RoZXJ3aXNlLCBpZiB0aGVyZSdzIHNvbWVvbmUKPiA+ID4gd2FpdGluZyAod2hpY2gg
dGhlcmUgc2hvdWxkbid0IGJlKSwgdGhleSdyZSBnb2luZyB0byBiZSB3YWl0aW5nIGEgdmVyeQo+
ID4gPiBsb25nIHRpbWUgOi0pCj4gPiA+IAo+ID4gPiBUaGFua3MsCj4gPiA+IC1Ccmlhbgo+ID4g
PiAKPiA+IEhlcmUgaXQgaGFwcGVuZWQgYXQgYXRvbWljX2NoZWNrIGZhaWxlZCBhbmQgdGVzdCBv
bmx5IGNvbW1pdC4gRm9yIGJvdGgKPiA+IGNhc2VzLCB0aGUgY29tbWl0IGhhcyBiZWVuIGRyb3Bw
ZWQgYW5kIGl0J3Mgb25seSBhIGNsZWFuIHVwLiBTbyBoZXJlIGJldHRlcgo+ID4gbm90IGJlIHRy
ZWF0ZWQgYXMgYW4gZXJyb3IgY2FzZTopCj4gCj4gSWYgYW55b25lIGVsc2UgaGFzIGEgcmVmZXJl
bmNlIG9uIHRoZSBmZW5jZSwgdGhlbiBJTU8gaXQgYWJzb2x1dGVseSBpcwo+IGFuIGVycm9yIHRv
IHJlYWNoIHRoaXMgcG9pbnQgd2l0aG91dCB0aGUgZmVuY2UgYmVpbmcgc2lnbmFsZWQgLQo+IGJl
Y2F1c2UgaXQgbWVhbnMgdGhhdCB0aGUgZmVuY2Ugd2lsbCBuZXZlciBiZSBzaWduYWxlZC4KPiAK
PiBJIGRvbid0IHRoaW5rIHRoZSBBUEkgZ2l2ZXMgeW91IGEgd2F5IHRvIGNoZWNrIGlmIHRoaXMg
aXMgdGhlIGxhc3QKPiByZWZlcmVuY2UsIHNvIGl0J3Mgc2FmZXN0IHRvIGp1c3QgbWFrZSBzdXJl
IHRoZSBmZW5jZSBpcyBzaWduYWxsZWQKPiBiZWZvcmUgZHJvcHBpbmcgdGhlIHJlZmVyZW5jZS4K
PiAKPiBJdCBqdXN0IGZlZWxzIHdyb25nIHRvIG1lIHRvIGhhdmUgdGhlIHBvc3NpYmlsaXR5IG9m
IGEgZGFuZ2xpbmcgZmVuY2UKPiB3aGljaCBpcyBuZXZlciBnb2luZyB0byBnZXQgc2lnbmFsbGVk
OyBhbmQgaXQncyBhbiBlYXN5IGRlZmVuc2l2ZSBzdGVwCj4gdG8gbWFrZSBzdXJlIGl0IGNhbiBu
ZXZlciBoYXBwZW4uCj4gCj4gSSBrbm93IGl0IF9zaG91bGRuJ3RfIGhhcHBlbiwgYnV0IHdlIG9m
dGVuIHB1dCBpbiBoYW5kbGluZyBmb3IgY2FzZXMKPiB3aGljaCBzaG91bGRuJ3QgaGFwcGVuLCBi
ZWNhdXNlIHRoZXkgZnJlcXVlbnRseSBkbyBoYXBwZW4gOi0pCj4gCj4gPiAKPiA+IFNpbmNlIGZv
ciB1c2Vyc3BhY2UsIGl0IHNob3VsZCBoYXZlIGJlZW4gZmFpbGVkIG9yIGEgdGVzdCBvbmx5IGNh
c2UsIHNvCj4gPiB3cml0ZWJhY2UgZmVuY2Ugc2hvdWxkIG5vdCBiZSBzaWduYWxlZC4KPiAKPiBJ
dCdzIG5vdCBvbmx5IHVzZXJzcGFjZSB0aGF0IGNhbiB3YWl0IG9uIGZlbmNlcyAoYW5kIGluIGZh
Y3QgdGhpcwo+IGZlbmNlIHdpbGwgbmV2ZXIgZXZlbiByZWFjaCB1c2Vyc3BhY2UgaWYgdGhlIGNv
bW1pdCBmYWlscyksIHRoZSBkcml2ZXIKPiBtYXkgaGF2ZSB0YWtlbiBhIGNvcHkgdG8gdXNlIGZv
ciAic29tZXRoaW5nIi4KPgoKTWF5YmUgd2UgY2FuIGFkZCBhIHdiX2ZlbmNlIGNhbmNlbGluZyBp
bnRvIGNvbXBsZXRlX3NpZ25hbGluZygpIGZvciB0aGUKYXRvbWljX2NoZWNrIGZhaWxlZCBjbGVh
bnVwIGxpa2UgdGhlIGNydGMtPm91dF9mZW5jZS4KClRoZW4gaWYgaW4gdGhpcyBwbGFjZSB3ZSBz
dGlsbCBjYW4gZ290IGEgZmVuY2UgaGVyZSwgdGhhdCBtdXN0IGJlIGEKZXJyb3Igd2Ugc2lnbmFs
IGFuZCBXQVJOIGl0CgpUaGFua3MKSmFtZXMKCj4gQ2hlZXJzLAo+IC1Ccmlhbgo+IAo+ID4gCj4g
PiBCZXN0IHJlZ2FyZHMsCj4gPiBMb3dyeQo+ID4gPiA+ICsJCWRtYV9mZW5jZV9wdXQoam9iLT5v
dXRfZmVuY2UpOwo+ID4gPiA+ICsKPiA+ID4gPiAgCWtmcmVlKGpvYik7Cj4gPiA+ID4gIH0KPiA+
IAo+ID4gLS0gCj4gPiBSZWdhcmRzCj4gPiBMb3dyeQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
