Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B05B1FBDAD
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2019 02:52:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64B1D6EEB6;
	Thu, 14 Nov 2019 01:52:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150078.outbound.protection.outlook.com [40.107.15.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3A136EEB6
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2019 01:52:36 +0000 (UTC)
Received: from VI1PR08CA0225.eurprd08.prod.outlook.com (2603:10a6:802:15::34)
 by DB7PR08MB3260.eurprd08.prod.outlook.com (2603:10a6:5:21::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2430.24; Thu, 14 Nov
 2019 01:52:34 +0000
Received: from DB5EUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::202) by VI1PR08CA0225.outlook.office365.com
 (2603:10a6:802:15::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2451.22 via Frontend
 Transport; Thu, 14 Nov 2019 01:52:34 +0000
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT012.mail.protection.outlook.com (10.152.20.161) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2451.23 via Frontend Transport; Thu, 14 Nov 2019 01:52:34 +0000
Received: ("Tessian outbound 081de437afc7:v33");
 Thu, 14 Nov 2019 01:52:33 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b61edcd588a44897
X-CR-MTA-TID: 64aa7808
Received: from 14fd57746287.2 (cr-mta-lb-1.cr-mta-net [104.47.12.58])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2325B6D5-DCC2-4E87-A59D-9CC5EE412737.1; 
 Thu, 14 Nov 2019 01:52:27 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2058.outbound.protection.outlook.com [104.47.12.58])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 14fd57746287.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 14 Nov 2019 01:52:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ok3lthLvf4cobTLxumSB0EDsPrCMitQ7Xbego3YLIqv6s5iqIYx4t+Unj9j4q+tSuEX/yHP5TNDE/EuqSpDq411hYxn4jtRns86+hoZuEh94IVAgOt3IQ5/gTokGI/tRcHzfkeA6IerCu2fDFEQ/goFgZSFfvIcl5Sf3ATNRX0tNdcjUQ76kaKQJeyLtKmcIZI9xo9CiHvToe8P4LFCYQaDCArfnF0Us6oR2r+vNhViSad45uN+wdJja6YlnSSS7cnLfjF6gU9QEQVclOZA67Jfcpb1HJCHfZbwuGbWaczbIaTRlxH4qvV9AZSc6ta+mzdN+H1CfIGvOnL3ZxL8i1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AaDefa/B7b8aDSlTAK8ytE4pUkkQEf1m6MydGTTJaVc=;
 b=ibPSxOLyN7l/rHkW/5iVHW5epFDBxQSP9BSY0rSZUj2CXF14BANUEYy23xuvV4sFLPCwlHMtrVBuf7JY6E0VGnMB8gT4OeUFD9wupvZg5yxF945j+05LY0MndVcKeClqq0Xnbj/rnWK9o/OYpIwofoykBWc7FknWmoOtFTgg8dsOVsjEUxW0yhJiTcDY8HKTsWQd9o/rjk1fU+0yh0DBn+EN/iBMM1eXuZ7XL25g4So/GeCYoGwRtCoLnaZshZFyylbuZz4Sl7k0GSTbdz9IU4R9FGoX5TYBTi6Izxp+Y0Z3VTx6atf7DUEuhxMg/S2FrhKjMwRXYh7TnfwtSTRafQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4784.eurprd08.prod.outlook.com (10.255.115.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.20; Thu, 14 Nov 2019 01:52:26 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a809:417a:faf3:61a7]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a809:417a:faf3:61a7%6]) with mapi id 15.20.2451.023; Thu, 14 Nov 2019
 01:52:26 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCHv2 3/4] drm/komeda: use afbc helpers
Thread-Topic: [PATCHv2 3/4] drm/komeda: use afbc helpers
Thread-Index: AQHVk1z8xHY+gDfYy0i/iDKbshedr6eBdzAAgAbusQCAAKGHAIAA7isA
Date: Thu, 14 Nov 2019 01:52:25 +0000
Message-ID: <20191114015220.GA16456@jamwan02-TSP300>
References: <2485717.1SzL54aMiy@e123338-lin>
 <20191104221228.3588-1-andrzej.p@collabora.com>
 <20191104221228.3588-4-andrzej.p@collabora.com>
 <20191108160954.GA17321@arm.com> <20191113020146.GB2746@jamwan02-TSP300>
 <20191113113954.GN23790@phenom.ffwll.local>
In-Reply-To: <20191113113954.GN23790@phenom.ffwll.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: LO2P123CA0005.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::17) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c09cbead-3372-45cc-70c8-08d768a55183
X-MS-TrafficTypeDiagnostic: VE1PR08MB4784:|VE1PR08MB4784:|DB7PR08MB3260:
X-MS-Exchange-PUrlCount: 1
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB7PR08MB3260D000A9385E06B19611E3B3710@DB7PR08MB3260.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
x-forefront-prvs: 02213C82F8
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(376002)(136003)(396003)(39860400002)(366004)(346002)(199004)(189003)(53754006)(1076003)(7416002)(33716001)(14454004)(478600001)(5660300002)(966005)(6306002)(256004)(9686003)(14444005)(58126008)(6486002)(316002)(229853002)(305945005)(33656002)(7736002)(6436002)(6512007)(99286004)(8936002)(54906003)(4326008)(81166006)(52116002)(81156014)(76176011)(6246003)(8676002)(6116002)(25786009)(386003)(6916009)(2906002)(26005)(6506007)(3846002)(186003)(11346002)(486006)(86362001)(446003)(476003)(102836004)(71200400001)(71190400001)(66476007)(55236004)(66946007)(66556008)(66066001)(64756008)(66446008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4784;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: SXuJOfwUsKY/WM/KoiEnt56PF0njBU8dJzkpT72DG4PfOepTT3C0GthuTBCt/5WUqkvMHz0GPZxQtcJuM5GccrmmWtxVUVXPfkGsRgS4qUKnGKx+A/nnAOYx67TG7moHbzQI8aQJ0vSQ8+VsZ1q0v75s/S53C8dPF/qM0BfAd394T3wTQs/nzubc28Na5aJeaHJDtg0X0N3tA3sTAWvfdp5PF6zBq1jSvBJuch25DKFQMVO6ftHuhPhAOcCA5pqybNelhu4hi12lGfSaHbr0DfksUxZD2+BNyUE5II78lp895kwz2MoHQnetkBW1McDNNPhEtXKWMraF+G2B3qY3y+YXhlxWeykLK7JKFibhEjJBz11Qk7vLPxb5K8qKKuwqJOpmgLqH8JXpJ0XddMcO3qb5xQsVvrXohWP1WtzlmX42dINqgnB00pJXFwsj/N7/qQ2bOSAmnePV6fasVHjVU7bmwQZmAbGdhjj6iosG8uw=
Content-ID: <3ADD614D554ECD48A0A061B62474F6DE@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4784
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(376002)(396003)(346002)(136003)(39860400002)(1110001)(339900001)(189003)(53754006)(199004)(14444005)(4326008)(6862004)(102836004)(5660300002)(70586007)(81166006)(478600001)(33656002)(8936002)(8676002)(81156014)(229853002)(23756003)(105606002)(6246003)(8746002)(66066001)(3846002)(6116002)(966005)(186003)(6486002)(316002)(47776003)(2906002)(6306002)(9686003)(6512007)(26826003)(126002)(486006)(25786009)(11346002)(1076003)(446003)(54906003)(33716001)(14454004)(76176011)(305945005)(70206006)(336012)(26005)(6506007)(386003)(58126008)(50466002)(99286004)(7736002)(86362001)(22756006)(476003)(76130400001)(356004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB7PR08MB3260;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Fail; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: e62a3690-6ba3-45a0-34cf-08d768a54c64
NoDisclaimer: True
X-Forefront-PRVS: 02213C82F8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dVFcGekcB4obr8sPAIEYsu7u27PTu4VY0moUvO1iNIfmcmlJJVUSjUOvRw8Z8R4XP6t128i47XABZ+CLAMg52QDfw+NAjDL/zSKDYFuDegJz3FiTXcIJu57zJRsgftuNEBGW3rfPiEoYQN7jlNAza/lOBxktw6LHqgD1y2+5ZYMk0cXpEsB5DBOdiljm5YIvY7LdUoMMvwSj0Av9Gf6AzSBT0d0TrMTRgdy6Dx3Qi60/ppV6+Wj7E9P3bHU5V0YkzA+/lndY4zXlv1nSph4DPH1tfjDPpFktKxHuiX5vLhOBQP3WjIIPqprjs9ootcffEW0jpq3kva7ZZjZkLRi3JyHPHeDLMd/PALSMswmdeN2Q+devOuL1Yh6Q5F3REZQd8/5BARAevlJe5NckxGwZ+5Sudmj0Tv91ZeYbtZYK4DZsEUYmWb0dHLqY8DWEcHeDtx510l9Yg8I7rycDbAOWlMk3Iwx+w168oNub4fKckrI=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2019 01:52:34.1915 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c09cbead-3372-45cc-70c8-08d768a55183
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3260
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AaDefa/B7b8aDSlTAK8ytE4pUkkQEf1m6MydGTTJaVc=;
 b=zFaMZNyZqeTViD2AA1wOuuzs0jiZ0evtl0LJ55kzGvQDRv1rfjQAgFyajpzZOSUMHAD+pBRde/iCYWiCLlGd/CEkq/SebKTyBlAPpjFFRHfh2Djt7vvwdRq8MC1rN48Fma7WVJglsMz/EK7N81xHWW7mqb1E+4wFsUyRBC0vcns=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AaDefa/B7b8aDSlTAK8ytE4pUkkQEf1m6MydGTTJaVc=;
 b=zFaMZNyZqeTViD2AA1wOuuzs0jiZ0evtl0LJ55kzGvQDRv1rfjQAgFyajpzZOSUMHAD+pBRde/iCYWiCLlGd/CEkq/SebKTyBlAPpjFFRHfh2Djt7vvwdRq8MC1rN48Fma7WVJglsMz/EK7N81xHWW7mqb1E+4wFsUyRBC0vcns=
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
Cc: nd <nd@arm.com>, Mihail Atanassov <Mihail.Atanassov@arm.com>,
 "kernel@collabora.com" <kernel@collabora.com>, David Airlie <airlied@linux.ie>,
 Liviu Dudau <Liviu.Dudau@arm.com>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Ayan Halder <Ayan.Halder@arm.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBOb3YgMTMsIDIwMTkgYXQgMTI6Mzk6NTRQTSArMDEwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBXZWQsIE5vdiAxMywgMjAxOSBhdCAwMjowMTo1M0FNICswMDAwLCBqYW1lcyBx
aWFuIHdhbmcgKEFybSBUZWNobm9sb2d5IENoaW5hKSB3cm90ZToKPiA+IE9uIEZyaSwgTm92IDA4
LCAyMDE5IGF0IDA0OjA5OjU0UE0gKzAwMDAsIEF5YW4gSGFsZGVyIHdyb3RlOgo+ID4gPiBPbiBN
b24sIE5vdiAwNCwgMjAxOSBhdCAxMToxMjoyN1BNICswMTAwLCBBbmRyemVqIFBpZXRyYXNpZXdp
Y3ogd3JvdGU6Cj4gPiA+ID4gVGhlcmUgYXJlIGFmYmMgaGVscGVycyBhdmFpbGFibGUuCj4gPiA+
ID4gCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogQW5kcnplaiBQaWV0cmFzaWV3aWN6IDxhbmRyemVq
LnBAY29sbGFib3JhLmNvbT4KPiA+ID4gPiAtLS0KPiA+ID4gPiAgLi4uL2FybS9kaXNwbGF5L2tv
bWVkYS9rb21lZGFfZm9ybWF0X2NhcHMuaCAgIHwgIDEgLQo+ID4gPiA+ICAuLi4vYXJtL2Rpc3Bs
YXkva29tZWRhL2tvbWVkYV9mcmFtZWJ1ZmZlci5jICAgfCA0NCArKysrKysrLS0tLS0tLS0tLS0t
Cj4gPiA+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwgMjggZGVsZXRpb25z
KC0pCj4gPiA+ID4gCj4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlz
cGxheS9rb21lZGEva29tZWRhX2Zvcm1hdF9jYXBzLmggYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rp
c3BsYXkva29tZWRhL2tvbWVkYV9mb3JtYXRfY2Fwcy5oCj4gPiA+ID4gaW5kZXggMzIyNzNjZjE4
ZjdjLi42MDdlZWE4MGU2MGMgMTAwNjQ0Cj4gPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Fy
bS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZm9ybWF0X2NhcHMuaAo+ID4gPiA+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Zvcm1hdF9jYXBzLmgKPiA+ID4g
PiBAQCAtMzMsNyArMzMsNiBAQAo+ID4gPiA+ICAKPiA+ID4gPiAgI2RlZmluZSBBRkJDX1RIX0xB
WU9VVF9BTElHTk1FTlQJOAo+ID4gPiA+ICAjZGVmaW5lIEFGQkNfSEVBREVSX1NJWkUJCTE2Cj4g
PiA+ID4gLSNkZWZpbmUgQUZCQ19TVVBFUkJMS19BTElHTk1FTlQJCTEyOAo+ID4gPiA+ICAjZGVm
aW5lIEFGQkNfU1VQRVJCTEtfUElYRUxTCQkyNTYKPiA+ID4gPiAgI2RlZmluZSBBRkJDX0JPRFlf
U1RBUlRfQUxJR05NRU5UCTEwMjQKPiA+ID4gPiAgI2RlZmluZSBBRkJDX1RIX0JPRFlfU1RBUlRf
QUxJR05NRU5UCTQwOTYKPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9k
aXNwbGF5L2tvbWVkYS9rb21lZGFfZnJhbWVidWZmZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0v
ZGlzcGxheS9rb21lZGEva29tZWRhX2ZyYW1lYnVmZmVyLmMKPiA+ID4gPiBpbmRleCAxYjAxYTYy
NWY0MGUuLmU5Yzg3NTUxYTViOCAxMDA2NDQKPiA+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9mcmFtZWJ1ZmZlci5jCj4gPiA+ID4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZnJhbWVidWZmZXIuYwo+ID4g
PiA+IEBAIC00LDYgKzQsNyBAQAo+ID4gPiA+ICAgKiBBdXRob3I6IEphbWVzLlFpYW4uV2FuZyA8
amFtZXMucWlhbi53YW5nQGFybS5jb20+Cj4gPiA+ID4gICAqCj4gPiA+ID4gICAqLwo+ID4gPiA+
ICsjaW5jbHVkZSA8ZHJtL2RybV9hZmJjLmg+Cj4gPiA+ID4gICNpbmNsdWRlIDxkcm0vZHJtX2Rl
dmljZS5oPgo+ID4gPiA+ICAjaW5jbHVkZSA8ZHJtL2RybV9mYl9jbWFfaGVscGVyLmg+Cj4gPiA+
ID4gICNpbmNsdWRlIDxkcm0vZHJtX2dlbS5oPgo+ID4gPiA+IEBAIC00Myw4ICs0NCw3IEBAIGtv
bWVkYV9mYl9hZmJjX3NpemVfY2hlY2soc3RydWN0IGtvbWVkYV9mYiAqa2ZiLCBzdHJ1Y3QgZHJt
X2ZpbGUgKmZpbGUsCj4gPiA+ID4gIAlzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyICpmYiA9ICZrZmIt
PmJhc2U7Cj4gPiA+ID4gIAljb25zdCBzdHJ1Y3QgZHJtX2Zvcm1hdF9pbmZvICppbmZvID0gZmIt
PmZvcm1hdDsKPiA+ID4gPiAgCXN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqOwo+ID4gPiA+IC0J
dTMyIGFsaWdubWVudF93ID0gMCwgYWxpZ25tZW50X2ggPSAwLCBhbGlnbm1lbnRfaGVhZGVyLCBu
X2Jsb2NrcywgYnBwOwo+ID4gPiA+IC0JdTY0IG1pbl9zaXplOwo+ID4gPiA+ICsJdTMyIGFsaWdu
bWVudF93ID0gMCwgYWxpZ25tZW50X2ggPSAwLCBhbGlnbm1lbnRfaGVhZGVyLCBicHA7Cj4gPiA+
ID4gIAo+ID4gPiA+ICAJb2JqID0gZHJtX2dlbV9vYmplY3RfbG9va3VwKGZpbGUsIG1vZGVfY21k
LT5oYW5kbGVzWzBdKTsKPiA+ID4gPiAgCWlmICghb2JqKSB7Cj4gPiA+ID4gQEAgLTUyLDE5ICs1
MiwxNSBAQCBrb21lZGFfZmJfYWZiY19zaXplX2NoZWNrKHN0cnVjdCBrb21lZGFfZmIgKmtmYiwg
c3RydWN0IGRybV9maWxlICpmaWxlLAo+ID4gPiA+ICAJCXJldHVybiAtRU5PRU5UOwo+ID4gPiA+
ICAJfQo+ID4gPiA+ICAKPiA+ID4gPiAtCXN3aXRjaCAoZmItPm1vZGlmaWVyICYgQUZCQ19GT1JN
QVRfTU9EX0JMT0NLX1NJWkVfTUFTSykgewo+ID4gPiA+IC0JY2FzZSBBRkJDX0ZPUk1BVF9NT0Rf
QkxPQ0tfU0laRV8zMng4Ogo+ID4gPiA+IC0JCWFsaWdubWVudF93ID0gMzI7Cj4gPiA+ID4gLQkJ
YWxpZ25tZW50X2ggPSA4Owo+ID4gPiA+IC0JCWJyZWFrOwo+ID4gPiA+IC0JY2FzZSBBRkJDX0ZP
Uk1BVF9NT0RfQkxPQ0tfU0laRV8xNngxNjoKPiA+ID4gPiAtCQlhbGlnbm1lbnRfdyA9IDE2Owo+
ID4gPiA+IC0JCWFsaWdubWVudF9oID0gMTY7Cj4gPiA+ID4gLQkJYnJlYWs7Cj4gPiA+ID4gLQlk
ZWZhdWx0Ogo+ID4gPiA+IC0JCVdBUk4oMSwgIkludmFsaWQgQUZCQ19GT1JNQVRfTU9EX0JMT0NL
X1NJWkU6ICVsbGQuXG4iLAo+ID4gPiA+IC0JCSAgICAgZmItPm1vZGlmaWVyICYgQUZCQ19GT1JN
QVRfTU9EX0JMT0NLX1NJWkVfTUFTSyk7Cj4gPiA+ID4gLQkJYnJlYWs7Cj4gPiA+ID4gKwlpZiAo
IWRybV9hZmJjX2dldF9zdXBlcmJsa193aChmYi0+bW9kaWZpZXIsICZhbGlnbm1lbnRfdywgJmFs
aWdubWVudF9oKSkKPiA+ID4gPiArCQlyZXR1cm4gLUVJTlZBTDsKPiA+ID4gPiArCj4gPiA+ID4g
KwlpZiAoKGFsaWdubWVudF93ICE9IDE2IHx8IGFsaWdubWVudF9oICE9IDE2KSAmJgo+ID4gPiA+
ICsJICAgIChhbGlnbm1lbnRfdyAhPSAzMiB8fCBhbGlnbm1lbnRfaCAhPSA4KSkgewo+ID4gPiA+
ICsJCURSTV9ERUJVR19LTVMoIlVuc3VwcG9ydGVkIGFmYmMgdGlsZSB3L2ggWyVkLyVkXVxuIiwK
PiA+ID4gPiArCQkJICAgICAgYWxpZ25tZW50X3csIGFsaWdubWVudF9oKTsKPiA+ID4gPiArCj4g
PiA+ID4gKwkJcmV0dXJuIC1FSU5WQUw7Cj4gPiA+IFRvIGJlIGhvbmVzdCwgdGhlIHByZXZpb3Vz
IGNvZGUgbG9va3MgbXVjaCBtb3JlIHJlYWRhYmxlCj4gPiA+ID4gIAl9Cj4gPiA+ID4gIAo+ID4g
PiA+ICAJLyogdGlsZWQgaGVhZGVyIGFmYmMgKi8KPiA+ID4gPiBAQCAtODQsMjAgKzgwLDE0IEBA
IGtvbWVkYV9mYl9hZmJjX3NpemVfY2hlY2soc3RydWN0IGtvbWVkYV9mYiAqa2ZiLCBzdHJ1Y3Qg
ZHJtX2ZpbGUgKmZpbGUsCj4gPiA+ID4gIAkJZ290byBjaGVja19mYWlsZWQ7Cj4gPiA+ID4gIAl9
Cj4gPiA+ID4gIAo+ID4gPiA+IC0Jbl9ibG9ja3MgPSAoa2ZiLT5hbGlnbmVkX3cgKiBrZmItPmFs
aWduZWRfaCkgLyBBRkJDX1NVUEVSQkxLX1BJWEVMUzsKPiA+ID4gPiAtCWtmYi0+b2Zmc2V0X3Bh
eWxvYWQgPSBBTElHTihuX2Jsb2NrcyAqIEFGQkNfSEVBREVSX1NJWkUsCj4gPiA+ID4gLQkJCQkg
ICAgYWxpZ25tZW50X2hlYWRlcik7Cj4gPiA+ID4gLQo+ID4gPiA+ICAJYnBwID0ga29tZWRhX2dl
dF9hZmJjX2Zvcm1hdF9icHAoaW5mbywgZmItPm1vZGlmaWVyKTsKPiA+ID4gPiAtCWtmYi0+YWZi
Y19zaXplID0ga2ZiLT5vZmZzZXRfcGF5bG9hZCArIG5fYmxvY2tzICoKPiA+ID4gPiAtCQkJIEFM
SUdOKGJwcCAqIEFGQkNfU1VQRVJCTEtfUElYRUxTIC8gOCwKPiA+ID4gPiAtCQkJICAgICAgIEFG
QkNfU1VQRVJCTEtfQUxJR05NRU5UKTsKPiA+ID4gPiAtCW1pbl9zaXplID0ga2ZiLT5hZmJjX3Np
emUgKyBmYi0+b2Zmc2V0c1swXTsKPiA+ID4gPiAtCWlmIChtaW5fc2l6ZSA+IG9iai0+c2l6ZSkg
ewo+ID4gPiA+IC0JCURSTV9ERUJVR19LTVMoImFmYmMgc2l6ZSBjaGVjayBmYWlsZWQsIG9ial9z
aXplOiAweCV6eC4gbWluX3NpemUgMHglbGx4LlxuIiwKPiA+ID4gPiAtCQkJICAgICAgb2JqLT5z
aXplLCBtaW5fc2l6ZSk7Cj4gPiA+IFdlIG5lZWQga2ZiLT5vZmZzZXRfcGF5bG9hZCBhbmQga2Zi
LT5hZmJjX3NpemUgdG8gc2V0IHNvbWUgcmVnaXN0ZXJzCj4gPiA+IGluIGQ3MV9sYXllcl91cGRh
dGUoKS4gQXQgdGhpcyBtb21lbnQgSSBmZWVsIGxpa2UgcHVuY2hpbmcgbXlzZWxmIGZvcgo+ID4g
PiBtYWtpbmcgdGhlIHN1Z2dlc3Rpb24gdG8gY29uc2lkZXIgYWJzdHJhY3Rpbmcgc29tZSBvZiB0
aGUga29tZWRhJ3MgYWZiYwo+ID4gPiBjaGVja3MuIFRvIG1lIGl0IGRvZXMgbm90IGxvb2sgbGlr
ZSBrb21lZGEoaW4gdGhlIGN1cnJlbnQgc2hhcGUpIGNhbiB0YWtlCj4gPiA+IG11Y2ggYWR2YW50
YWdlIG9mIHRoZSBnZW5lcmljIF9hZmJjX2ZiX2NoZWNrKCkgZnVuY3Rpb24gKGFzIHdhcyBzdWdn
ZXN0ZWQKPiA+ID4gcHJldmlvdXNseSBieSBEYW52ZXQpLgo+ID4gPiAKPiA+ID4gSG93ZXZlciwg
SSB3aWxsIGxldCBqYW1lcy5xaWFuLndhbmdAYXJtLmNvbSwKPiA+ID4gTWloYWlsLkF0YW5hc3Nv
dkBhcm0uY29tLCBCZW4uRGF2aXNAYXJtLmNvbSBjb21tZW50IGhlcmUgdG8gc2VlIGlmCj4gPiA+
IHRoZXJlIGNvdWxkIGJlIGEgd2F5IG9mIGFic3RyYWN0aW5nIHRoZSBhZmJjIGJpdHMgZnJvbSBr
b21lZGEuCj4gPiA+Cj4gPiAKPiA+IEhpIGFsbDoKPiA+IAo+ID4gU2luY2UgdGhlIGN1cnJlbnQg
Z2VuZXJpYyBkcm1fYWZiYyBoZWxwZXJzIG9ubHkgc3VwcG9ydCBhZmJjXzEuMSwgYnV0Cj4gPiBr
b21lZGEgbmVlZHMgc3VwcG9ydCBib3RoIGFmYmMxLjEvMS4yLCBzbyBJIHRoaW5rIHdlIGNhbjoK
PiA+IC0gQWRkIGFmYmMxLjIgc3VwcG9ydCB0byBkcm0gYWZiYyBoZWxwZXJzLgo+ID4gLSBmb3Ig
dGhlIGFmYmNfcGF5bG9hZF9vZmZzZXQsIGNhbiB3ZSBhZGQgdGhpcyBtZW1iZXIgdG8KPiA+ICAg
ZHJtX2ZyYW1lYnVmZmVyID8KPiA+IC0gVGhlIGFsaWduZWRfdy9oIGFyZSBpbXBvcnRhbnQgZm9y
IGFmYmMsIHNvIGNhbiB3ZSBoYXZlIHRoZW0gaW4KPiA+ICAgZHJtX2ZyYW1lYnVmZmVyID8gIAo+
IAo+IEhvdyBleHBlbnNpdmUgaXMgaXQgdG8gcmVjb21wdXRlIHRoZXNlIGZyb20gYSBzdHJ1Y3Qg
ZHJtX2ZyYW1lYnVmZmVyPwo+IAo+IEknZCBqdXN0IGdvIHdpdGggb25lIGZ1bmN0aW9uIHdoaWNo
IGNvbXB1dGVzIGFsbCB0aGVzZSBkZXJpdmVkIHZhbHVlcywgYW5kCj4gc3R1ZmZzIHRoZW0gaW50
byBhIHN0cnVjdCBkcm1fYWZiYy4gVGhlbiBkcml2ZXJzIGNhbGwgdGhhdCBvbmNlIG9yIHNvLgo+
CgpBIHN0cnVjdCBkcm1fYWZiYywgZ29vZCBpZGVhLCBJIGxpa2UgaXQuIDotKQoKYW5kIHdlIGNh
biBjb21wdXRlIGl0IHdoZW4gZG8gdGhlIGFmYmMgc2l6ZSBjaGVjayBsaWtlIAoKICBkcm1fYWZi
Y19jaGVja19mYl9zaXplKC4uLiwgJmtvbWVkYV9mYi0+ZHJtX2FmYmMpOwoKVGhhbmtzLgpKYW1l
cwoKPiBGb3IgcmV3b3JraW5nIGRybV9mcmFtZWJ1ZmZlciBpdHNlbGYgSSB0aGluayBpdCdzIHBy
b2JhYmx5IGEgYml0IHRvbwo+IGVhcmxpZXIuIEFuZCBpZiB3ZSBkbyBpdCwgd2Ugc2hvdWxkIG1h
eWJlIGdvIGEgYml0IG1vcmUgYm9sZCwgYWltaW5nIHRvCj4gcHJvcGVydHktZnkgYWxsIHRoZSBm
cmFtZWJ1ZmZlciBzZXR0aW5ncywgbWF5YmUgZXZlbiBtYWtpbmcgaXQgZXh0ZW5zaWJsZSwKPiBh
bmQgaGF2ZSBkcml2ZXJzIGhhbmRsZSBhIGNvcnJlc3BvbmRpbmcgZHJtX2ZyYW1lYnVmZmVyX3N0
YXRlLgo+IAo+IEEgdGhpcmQgb3B0aW9uIHdvdWxkIGJlIHRvIGNyZWF0ZSBhIGRybV9hZmJjX2Zy
YW1lYnVmZmVyIHdoaWNoIGVtYmVkcwo+IGRybV9mcmFtZWJ1ZmZlciBhbmQgd2hpY2ggZHJpdmVy
cyB3b3VsZCBuZWVkIHRvIHVzZS4gQnV0IGFsc28gZmVlbHMgYSBiaXQKPiBsaWtlIHRvbyBtdWNo
IGNodXJuLiBSZWNvbXB1dGluZyBzaG91bGQgYmUgcXVpY2sgZW5vdWdoIGFuZCBtdWNoIGVhc2ll
ci4KPiAtRGFuaWVsCj4gCj4gPiAKPiA+IFRoYW5rcwo+ID4gSmFtZXMKPiA+IAo+ID4gPiBUaGFu
a3MgYW55d2F5cyBmb3IgdGFraW5nIGEgc3RhYiBhdCB0aGlzLgo+ID4gPiAtQXlhbgo+ID4gPiA+
ICsKPiA+ID4gPiArCWlmICghZHJtX2FmYmNfY2hlY2tfZmJfc2l6ZShtb2RlX2NtZC0+cGl0Y2hl
c1swXSwgYnBwLAo+ID4gPiA+ICsJCQkJICAgIG1vZGVfY21kLT53aWR0aCwgbW9kZV9jbWQtPmhl
aWdodCwKPiA+ID4gPiArCQkJCSAgICBhbGlnbm1lbnRfdywgYWxpZ25tZW50X2gsCj4gPiA+ID4g
KwkJCQkgICAgb2JqLT5zaXplLCBtb2RlX2NtZC0+b2Zmc2V0c1swXSwKPiA+ID4gPiArCQkJCSAg
ICBBRkJDX1NVUEVSQkxLX0FMSUdOTUVOVCkpCj4gPiA+ID4gIAkJZ290byBjaGVja19mYWlsZWQ7
Cj4gPiA+ID4gLQl9Cj4gPiA+ID4gIAo+ID4gPiA+ICAJZmItPm9ialswXSA9IG9iajsKPiA+ID4g
PiAgCXJldHVybiAwOwo+ID4gPiA+IC0tIAo+ID4gPiA+IDIuMTcuMQo+IAo+IC0tIAo+IERhbmll
bCBWZXR0ZXIKPiBTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KPiBodHRwOi8v
YmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
