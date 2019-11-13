Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C592FA20F
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 03:02:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D96616EC56;
	Wed, 13 Nov 2019 02:02:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0620.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0e::620])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BE966EC56
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 02:02:07 +0000 (UTC)
Received: from VI1PR08CA0114.eurprd08.prod.outlook.com (2603:10a6:800:d4::16)
 by HE1PR0801MB2028.eurprd08.prod.outlook.com (2603:10a6:3:56::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2430.20; Wed, 13 Nov
 2019 02:02:03 +0000
Received: from VE1EUR03FT014.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::205) by VI1PR08CA0114.outlook.office365.com
 (2603:10a6:800:d4::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2451.22 via Frontend
 Transport; Wed, 13 Nov 2019 02:02:03 +0000
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT014.mail.protection.outlook.com (10.152.19.38) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2430.21 via Frontend Transport; Wed, 13 Nov 2019 02:02:03 +0000
Received: ("Tessian outbound 081de437afc7:v33");
 Wed, 13 Nov 2019 02:02:02 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: a01a9dbb12ba88d0
X-CR-MTA-TID: 64aa7808
Received: from e41616ca4418.2 (cr-mta-lb-1.cr-mta-net [104.47.9.51])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1A5E90D1-DC72-4FEA-B0B3-890ABA1C73A2.1; 
 Wed, 13 Nov 2019 02:01:57 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2051.outbound.protection.outlook.com [104.47.9.51])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e41616ca4418.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 13 Nov 2019 02:01:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mw2oz2mj7xLXP48pXjh+NIn3KeARTBg8Q9IQBh3Dgek+UJDQI0jxLGTQ7+9mxxW9Ooe9SMIEwC+BV6PHYP8hcuwbd6rXK6V+JN97NjKy4T0YPAPYb8hRXxYPgh5fU6a5XqurhI6+5iFx05KFokMgeSrLCuJptC7S4llgUWIg/F1OB2Eh6UV/hYuXdcdcw93cexdIGKRUvFOG3a6cpL8e4dMZaNoNTFXmp2P9Q5IGKPZ3VHAlKA7fpIDh10bmCX6qOKMt72YU4r+QPihk0vpXdasnfnoTxzKD5HURalTSzTdHFbOXsUzMBeSUVmGYZDt2a9d++xZF59BXSuW2j+O7Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ReV0oIBM9ymRPkA/8hrIZWWDYT8C7AGjReD22AbeNOY=;
 b=fonjGn7/+s9sFxIuSR8aVeDKR+4MluadMFziPbbAOD0KxUDYB0Pg+7PIqFx5xrHXihjUhvHRxGerxPKA2qAwp7f4jaW5Gm48/8/Ota2zMponBu6QURSNGVl4qA6A8CrZZ94Ij1IjHLSFJN7BXLlko2IuGOSmcAp7y7TcUWi3okb02HLKCI8rvr6XGf/VSYkIK/jpRCyFkn1YK9IyWPI1N+9Hh2OPnjsAve34AdUC1FE3EKzjeFoH6bSecl9kj9+R7tS3dmwUFkeC0vVpGN/GhxZHD3Muu3BKT3+Gdyv2VEuJhH3CUvp/9y9TCfO/KGXDXf4B3nc9qifcCwjJvtKcqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB5038.eurprd08.prod.outlook.com (10.255.159.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.24; Wed, 13 Nov 2019 02:01:53 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a809:417a:faf3:61a7]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a809:417a:faf3:61a7%6]) with mapi id 15.20.2451.023; Wed, 13 Nov 2019
 02:01:53 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Ayan Halder <Ayan.Halder@arm.com>
Subject: Re: [PATCHv2 3/4] drm/komeda: use afbc helpers
Thread-Topic: [PATCHv2 3/4] drm/komeda: use afbc helpers
Thread-Index: AQHVk1z8xHY+gDfYy0i/iDKbshedr6eBdzAAgAbusQA=
Date: Wed, 13 Nov 2019 02:01:53 +0000
Message-ID: <20191113020146.GB2746@jamwan02-TSP300>
References: <2485717.1SzL54aMiy@e123338-lin>
 <20191104221228.3588-1-andrzej.p@collabora.com>
 <20191104221228.3588-4-andrzej.p@collabora.com>
 <20191108160954.GA17321@arm.com>
In-Reply-To: <20191108160954.GA17321@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0PR01CA0027.apcprd01.prod.exchangelabs.com
 (2603:1096:203:3e::15) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: af7ac2e9-6537-47c4-477c-08d767dd7a50
X-MS-TrafficTypeDiagnostic: VE1PR08MB5038:|VE1PR08MB5038:|HE1PR0801MB2028:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <HE1PR0801MB2028FDCE2B653DD30CB5D740B3760@HE1PR0801MB2028.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
x-forefront-prvs: 0220D4B98D
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(346002)(39860400002)(136003)(366004)(376002)(396003)(189003)(199004)(53754006)(6512007)(58126008)(26005)(6246003)(476003)(9686003)(3846002)(6116002)(305945005)(6436002)(7736002)(14454004)(81156014)(5660300002)(229853002)(86362001)(54906003)(316002)(8676002)(66066001)(486006)(33656002)(81166006)(64756008)(66946007)(25786009)(71190400001)(66446008)(66556008)(66476007)(6486002)(71200400001)(2906002)(446003)(478600001)(1076003)(4326008)(33716001)(6506007)(52116002)(386003)(76176011)(186003)(102836004)(55236004)(6636002)(8936002)(7416002)(6862004)(99286004)(14444005)(256004)(11346002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB5038;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: +xDxWWhoQh/ZpMk+rdJ91XMrsk9l+nzwXg78NvCrwFU+Z85j7jz6G5blPgkCxePPC7IcJMhskcazKjoFWP65UsRQozCinq8e1jl8j+S94/figs/XW03mgLA7T+Oa/rpW/y88NEM/P+fKgII78HkeiAlqlpMammQHDUXe0XjenMCLRpVsaCToaSb4WZCaagZU7X49aitLPOsG0Y0mvm5p0/2l5AbX4EGTtIPZKlvYlGLqcwlti7xKu1TrKTymkEOEs1RaNRuc1cidXpHCCiRQ4zCUL20cXjytnZjhbvvshiBgdoXRVtHB4c2SRO+bNCUJ2srOE7h0XLmA4f21HatQI4tFwCzctDZaQxZVdUkDvIuOToY2Hlj7+9qq2v+It1SMPeGcG2bl4uCw1u47OJhaIHdBq/5KyRaR1/pcAydmPzMSz5XLg+GoBJWgPsS6Bg8h
Content-ID: <8F468F222A27164DAFB3A0A17DD7105F@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5038
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(39860400002)(136003)(396003)(376002)(346002)(1110001)(339900001)(189003)(53754006)(199004)(4326008)(81156014)(9686003)(6512007)(23756003)(81166006)(6862004)(1076003)(70206006)(70586007)(14444005)(305945005)(33716001)(6246003)(316002)(14454004)(7736002)(54906003)(58126008)(86362001)(36906005)(76176011)(6486002)(33656002)(76130400001)(66066001)(26826003)(8676002)(25786009)(356004)(5660300002)(386003)(478600001)(6636002)(99286004)(50466002)(6506007)(22756006)(186003)(102836004)(8746002)(2906002)(8936002)(229853002)(26005)(105606002)(336012)(6116002)(446003)(3846002)(476003)(486006)(11346002)(126002)(47776003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:HE1PR0801MB2028;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Fail; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: d0ce9162-372f-4263-5b77-08d767dd746e
NoDisclaimer: True
X-Forefront-PRVS: 0220D4B98D
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bzl4+5W1INk6YYeo9p64GujU/oWHj7zvp7C9LkewvcPeAC+kmRRmTjHbErdDM0zv91LMz6d6phHye4MasZxfoTWMOjA9DnElJ/9ySrWiuxOK+5T9tx2KdD4rYK62c00Sn+IrQXI1cQQQq53qaMT6PPIN/Zowkj28Kto2F6xqSjDMZLTZcaueLt6gXTLCpJeMxHaGf92qzoi3l72xYQdliBM4xz2O2VGRPffVYbu1PEt35pjm7tDdW/Q4UmfG1TasEftYmiXSIMG8KKrURRU3fuNxexmC8Gq8pm0BBZZjLvvmwcjiXZ+LpB/U7dDPlYgWsOmDz/4HERKtp90HGjBma+O4AxfQ5H3MJB6lof2csa46KhDspiIYvw2CjPVXgkgoUccF2a+aCkGOiD73AWBMgEHh5EbY3ZxBDRyUCO2zYKnEyFlgD0eoebAITV3Ah5um
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2019 02:02:03.2618 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af7ac2e9-6537-47c4-477c-08d767dd7a50
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB2028
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ReV0oIBM9ymRPkA/8hrIZWWDYT8C7AGjReD22AbeNOY=;
 b=68bw/xZ6RiA6w+J+s6sSI9xhEIxBDb3WlYV4TQU7JFKEopJKs+VEsCyd/PGt4ll4ijxN35DzBQIsZxU8rrHRhhmavR0WIic6dEbrbuzIyDianrktzx8IpE2pjPtotK+c8MUPLJMJN7KI8Uuq8eDAzOczbdfcj1HRYdMJpXR3iOU=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ReV0oIBM9ymRPkA/8hrIZWWDYT8C7AGjReD22AbeNOY=;
 b=68bw/xZ6RiA6w+J+s6sSI9xhEIxBDb3WlYV4TQU7JFKEopJKs+VEsCyd/PGt4ll4ijxN35DzBQIsZxU8rrHRhhmavR0WIic6dEbrbuzIyDianrktzx8IpE2pjPtotK+c8MUPLJMJN7KI8Uuq8eDAzOczbdfcj1HRYdMJpXR3iOU=
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
Cc: nd <nd@arm.com>, "kernel@collabora.com" <kernel@collabora.com>,
 David Airlie <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Mihail Atanassov <Mihail.Atanassov@arm.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMDgsIDIwMTkgYXQgMDQ6MDk6NTRQTSArMDAwMCwgQXlhbiBIYWxkZXIgd3Jv
dGU6Cj4gT24gTW9uLCBOb3YgMDQsIDIwMTkgYXQgMTE6MTI6MjdQTSArMDEwMCwgQW5kcnplaiBQ
aWV0cmFzaWV3aWN6IHdyb3RlOgo+ID4gVGhlcmUgYXJlIGFmYmMgaGVscGVycyBhdmFpbGFibGUu
Cj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IEFuZHJ6ZWogUGlldHJhc2lld2ljeiA8YW5kcnplai5w
QGNvbGxhYm9yYS5jb20+Cj4gPiAtLS0KPiA+ICAuLi4vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVk
YV9mb3JtYXRfY2Fwcy5oICAgfCAgMSAtCj4gPiAgLi4uL2FybS9kaXNwbGF5L2tvbWVkYS9rb21l
ZGFfZnJhbWVidWZmZXIuYyAgIHwgNDQgKysrKysrKy0tLS0tLS0tLS0tLQo+ID4gIDIgZmlsZXMg
Y2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwgMjggZGVsZXRpb25zKC0pCj4gPiAKPiA+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9mb3JtYXRf
Y2Fwcy5oIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZm9ybWF0
X2NhcHMuaAo+ID4gaW5kZXggMzIyNzNjZjE4ZjdjLi42MDdlZWE4MGU2MGMgMTAwNjQ0Cj4gPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9mb3JtYXRfY2Fw
cy5oCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9m
b3JtYXRfY2Fwcy5oCj4gPiBAQCAtMzMsNyArMzMsNiBAQAo+ID4gIAo+ID4gICNkZWZpbmUgQUZC
Q19USF9MQVlPVVRfQUxJR05NRU5UCTgKPiA+ICAjZGVmaW5lIEFGQkNfSEVBREVSX1NJWkUJCTE2
Cj4gPiAtI2RlZmluZSBBRkJDX1NVUEVSQkxLX0FMSUdOTUVOVAkJMTI4Cj4gPiAgI2RlZmluZSBB
RkJDX1NVUEVSQkxLX1BJWEVMUwkJMjU2Cj4gPiAgI2RlZmluZSBBRkJDX0JPRFlfU1RBUlRfQUxJ
R05NRU5UCTEwMjQKPiA+ICAjZGVmaW5lIEFGQkNfVEhfQk9EWV9TVEFSVF9BTElHTk1FTlQJNDA5
Ngo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29t
ZWRhX2ZyYW1lYnVmZmVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tv
bWVkYV9mcmFtZWJ1ZmZlci5jCj4gPiBpbmRleCAxYjAxYTYyNWY0MGUuLmU5Yzg3NTUxYTViOCAx
MDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRh
X2ZyYW1lYnVmZmVyLmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21l
ZGEva29tZWRhX2ZyYW1lYnVmZmVyLmMKPiA+IEBAIC00LDYgKzQsNyBAQAo+ID4gICAqIEF1dGhv
cjogSmFtZXMuUWlhbi5XYW5nIDxqYW1lcy5xaWFuLndhbmdAYXJtLmNvbT4KPiA+ICAgKgo+ID4g
ICAqLwo+ID4gKyNpbmNsdWRlIDxkcm0vZHJtX2FmYmMuaD4KPiA+ICAjaW5jbHVkZSA8ZHJtL2Ry
bV9kZXZpY2UuaD4KPiA+ICAjaW5jbHVkZSA8ZHJtL2RybV9mYl9jbWFfaGVscGVyLmg+Cj4gPiAg
I2luY2x1ZGUgPGRybS9kcm1fZ2VtLmg+Cj4gPiBAQCAtNDMsOCArNDQsNyBAQCBrb21lZGFfZmJf
YWZiY19zaXplX2NoZWNrKHN0cnVjdCBrb21lZGFfZmIgKmtmYiwgc3RydWN0IGRybV9maWxlICpm
aWxlLAo+ID4gIAlzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyICpmYiA9ICZrZmItPmJhc2U7Cj4gPiAg
CWNvbnN0IHN0cnVjdCBkcm1fZm9ybWF0X2luZm8gKmluZm8gPSBmYi0+Zm9ybWF0Owo+ID4gIAlz
dHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iajsKPiA+IC0JdTMyIGFsaWdubWVudF93ID0gMCwgYWxp
Z25tZW50X2ggPSAwLCBhbGlnbm1lbnRfaGVhZGVyLCBuX2Jsb2NrcywgYnBwOwo+ID4gLQl1NjQg
bWluX3NpemU7Cj4gPiArCXUzMiBhbGlnbm1lbnRfdyA9IDAsIGFsaWdubWVudF9oID0gMCwgYWxp
Z25tZW50X2hlYWRlciwgYnBwOwo+ID4gIAo+ID4gIAlvYmogPSBkcm1fZ2VtX29iamVjdF9sb29r
dXAoZmlsZSwgbW9kZV9jbWQtPmhhbmRsZXNbMF0pOwo+ID4gIAlpZiAoIW9iaikgewo+ID4gQEAg
LTUyLDE5ICs1MiwxNSBAQCBrb21lZGFfZmJfYWZiY19zaXplX2NoZWNrKHN0cnVjdCBrb21lZGFf
ZmIgKmtmYiwgc3RydWN0IGRybV9maWxlICpmaWxlLAo+ID4gIAkJcmV0dXJuIC1FTk9FTlQ7Cj4g
PiAgCX0KPiA+ICAKPiA+IC0Jc3dpdGNoIChmYi0+bW9kaWZpZXIgJiBBRkJDX0ZPUk1BVF9NT0Rf
QkxPQ0tfU0laRV9NQVNLKSB7Cj4gPiAtCWNhc2UgQUZCQ19GT1JNQVRfTU9EX0JMT0NLX1NJWkVf
MzJ4ODoKPiA+IC0JCWFsaWdubWVudF93ID0gMzI7Cj4gPiAtCQlhbGlnbm1lbnRfaCA9IDg7Cj4g
PiAtCQlicmVhazsKPiA+IC0JY2FzZSBBRkJDX0ZPUk1BVF9NT0RfQkxPQ0tfU0laRV8xNngxNjoK
PiA+IC0JCWFsaWdubWVudF93ID0gMTY7Cj4gPiAtCQlhbGlnbm1lbnRfaCA9IDE2Owo+ID4gLQkJ
YnJlYWs7Cj4gPiAtCWRlZmF1bHQ6Cj4gPiAtCQlXQVJOKDEsICJJbnZhbGlkIEFGQkNfRk9STUFU
X01PRF9CTE9DS19TSVpFOiAlbGxkLlxuIiwKPiA+IC0JCSAgICAgZmItPm1vZGlmaWVyICYgQUZC
Q19GT1JNQVRfTU9EX0JMT0NLX1NJWkVfTUFTSyk7Cj4gPiAtCQlicmVhazsKPiA+ICsJaWYgKCFk
cm1fYWZiY19nZXRfc3VwZXJibGtfd2goZmItPm1vZGlmaWVyLCAmYWxpZ25tZW50X3csICZhbGln
bm1lbnRfaCkpCj4gPiArCQlyZXR1cm4gLUVJTlZBTDsKPiA+ICsKPiA+ICsJaWYgKChhbGlnbm1l
bnRfdyAhPSAxNiB8fCBhbGlnbm1lbnRfaCAhPSAxNikgJiYKPiA+ICsJICAgIChhbGlnbm1lbnRf
dyAhPSAzMiB8fCBhbGlnbm1lbnRfaCAhPSA4KSkgewo+ID4gKwkJRFJNX0RFQlVHX0tNUygiVW5z
dXBwb3J0ZWQgYWZiYyB0aWxlIHcvaCBbJWQvJWRdXG4iLAo+ID4gKwkJCSAgICAgIGFsaWdubWVu
dF93LCBhbGlnbm1lbnRfaCk7Cj4gPiArCj4gPiArCQlyZXR1cm4gLUVJTlZBTDsKPiBUbyBiZSBo
b25lc3QsIHRoZSBwcmV2aW91cyBjb2RlIGxvb2tzIG11Y2ggbW9yZSByZWFkYWJsZQo+ID4gIAl9
Cj4gPiAgCj4gPiAgCS8qIHRpbGVkIGhlYWRlciBhZmJjICovCj4gPiBAQCAtODQsMjAgKzgwLDE0
IEBAIGtvbWVkYV9mYl9hZmJjX3NpemVfY2hlY2soc3RydWN0IGtvbWVkYV9mYiAqa2ZiLCBzdHJ1
Y3QgZHJtX2ZpbGUgKmZpbGUsCj4gPiAgCQlnb3RvIGNoZWNrX2ZhaWxlZDsKPiA+ICAJfQo+ID4g
IAo+ID4gLQluX2Jsb2NrcyA9IChrZmItPmFsaWduZWRfdyAqIGtmYi0+YWxpZ25lZF9oKSAvIEFG
QkNfU1VQRVJCTEtfUElYRUxTOwo+ID4gLQlrZmItPm9mZnNldF9wYXlsb2FkID0gQUxJR04obl9i
bG9ja3MgKiBBRkJDX0hFQURFUl9TSVpFLAo+ID4gLQkJCQkgICAgYWxpZ25tZW50X2hlYWRlcik7
Cj4gPiAtCj4gPiAgCWJwcCA9IGtvbWVkYV9nZXRfYWZiY19mb3JtYXRfYnBwKGluZm8sIGZiLT5t
b2RpZmllcik7Cj4gPiAtCWtmYi0+YWZiY19zaXplID0ga2ZiLT5vZmZzZXRfcGF5bG9hZCArIG5f
YmxvY2tzICoKPiA+IC0JCQkgQUxJR04oYnBwICogQUZCQ19TVVBFUkJMS19QSVhFTFMgLyA4LAo+
ID4gLQkJCSAgICAgICBBRkJDX1NVUEVSQkxLX0FMSUdOTUVOVCk7Cj4gPiAtCW1pbl9zaXplID0g
a2ZiLT5hZmJjX3NpemUgKyBmYi0+b2Zmc2V0c1swXTsKPiA+IC0JaWYgKG1pbl9zaXplID4gb2Jq
LT5zaXplKSB7Cj4gPiAtCQlEUk1fREVCVUdfS01TKCJhZmJjIHNpemUgY2hlY2sgZmFpbGVkLCBv
Ympfc2l6ZTogMHglenguIG1pbl9zaXplIDB4JWxseC5cbiIsCj4gPiAtCQkJICAgICAgb2JqLT5z
aXplLCBtaW5fc2l6ZSk7Cj4gV2UgbmVlZCBrZmItPm9mZnNldF9wYXlsb2FkIGFuZCBrZmItPmFm
YmNfc2l6ZSB0byBzZXQgc29tZSByZWdpc3RlcnMKPiBpbiBkNzFfbGF5ZXJfdXBkYXRlKCkuIEF0
IHRoaXMgbW9tZW50IEkgZmVlbCBsaWtlIHB1bmNoaW5nIG15c2VsZiBmb3IKPiBtYWtpbmcgdGhl
IHN1Z2dlc3Rpb24gdG8gY29uc2lkZXIgYWJzdHJhY3Rpbmcgc29tZSBvZiB0aGUga29tZWRhJ3Mg
YWZiYwo+IGNoZWNrcy4gVG8gbWUgaXQgZG9lcyBub3QgbG9vayBsaWtlIGtvbWVkYShpbiB0aGUg
Y3VycmVudCBzaGFwZSkgY2FuIHRha2UKPiBtdWNoIGFkdmFudGFnZSBvZiB0aGUgZ2VuZXJpYyBf
YWZiY19mYl9jaGVjaygpIGZ1bmN0aW9uIChhcyB3YXMgc3VnZ2VzdGVkCj4gcHJldmlvdXNseSBi
eSBEYW52ZXQpLgo+IAo+IEhvd2V2ZXIsIEkgd2lsbCBsZXQgamFtZXMucWlhbi53YW5nQGFybS5j
b20sCj4gTWloYWlsLkF0YW5hc3NvdkBhcm0uY29tLCBCZW4uRGF2aXNAYXJtLmNvbSBjb21tZW50
IGhlcmUgdG8gc2VlIGlmCj4gdGhlcmUgY291bGQgYmUgYSB3YXkgb2YgYWJzdHJhY3RpbmcgdGhl
IGFmYmMgYml0cyBmcm9tIGtvbWVkYS4KPgoKSGkgYWxsOgoKU2luY2UgdGhlIGN1cnJlbnQgZ2Vu
ZXJpYyBkcm1fYWZiYyBoZWxwZXJzIG9ubHkgc3VwcG9ydCBhZmJjXzEuMSwgYnV0CmtvbWVkYSBu
ZWVkcyBzdXBwb3J0IGJvdGggYWZiYzEuMS8xLjIsIHNvIEkgdGhpbmsgd2UgY2FuOgotIEFkZCBh
ZmJjMS4yIHN1cHBvcnQgdG8gZHJtIGFmYmMgaGVscGVycy4KLSBmb3IgdGhlIGFmYmNfcGF5bG9h
ZF9vZmZzZXQsIGNhbiB3ZSBhZGQgdGhpcyBtZW1iZXIgdG8KICBkcm1fZnJhbWVidWZmZXIgPwot
IFRoZSBhbGlnbmVkX3cvaCBhcmUgaW1wb3J0YW50IGZvciBhZmJjLCBzbyBjYW4gd2UgaGF2ZSB0
aGVtIGluCiAgZHJtX2ZyYW1lYnVmZmVyID8gIAoKVGhhbmtzCkphbWVzCgo+IFRoYW5rcyBhbnl3
YXlzIGZvciB0YWtpbmcgYSBzdGFiIGF0IHRoaXMuCj4gLUF5YW4KPiA+ICsKPiA+ICsJaWYgKCFk
cm1fYWZiY19jaGVja19mYl9zaXplKG1vZGVfY21kLT5waXRjaGVzWzBdLCBicHAsCj4gPiArCQkJ
CSAgICBtb2RlX2NtZC0+d2lkdGgsIG1vZGVfY21kLT5oZWlnaHQsCj4gPiArCQkJCSAgICBhbGln
bm1lbnRfdywgYWxpZ25tZW50X2gsCj4gPiArCQkJCSAgICBvYmotPnNpemUsIG1vZGVfY21kLT5v
ZmZzZXRzWzBdLAo+ID4gKwkJCQkgICAgQUZCQ19TVVBFUkJMS19BTElHTk1FTlQpKQo+ID4gIAkJ
Z290byBjaGVja19mYWlsZWQ7Cj4gPiAtCX0KPiA+ICAKPiA+ICAJZmItPm9ialswXSA9IG9iajsK
PiA+ICAJcmV0dXJuIDA7Cj4gPiAtLSAKPiA+IDIuMTcuMQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
