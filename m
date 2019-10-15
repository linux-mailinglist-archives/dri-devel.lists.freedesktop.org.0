Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09AF2D7158
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 10:45:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03FB86E792;
	Tue, 15 Oct 2019 08:44:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50068.outbound.protection.outlook.com [40.107.5.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C20C06E792
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 08:44:53 +0000 (UTC)
Received: from AM6PR08CA0025.eurprd08.prod.outlook.com (2603:10a6:20b:c0::13)
 by DB6PR0801MB1734.eurprd08.prod.outlook.com (2603:10a6:4:31::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16; Tue, 15 Oct
 2019 08:30:09 +0000
Received: from VE1EUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::200) by AM6PR08CA0025.outlook.office365.com
 (2603:10a6:20b:c0::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.16 via Frontend
 Transport; Tue, 15 Oct 2019 08:30:09 +0000
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT010.mail.protection.outlook.com (10.152.18.113) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Tue, 15 Oct 2019 08:30:09 +0000
Received: ("Tessian outbound 0cf06bf5c60e:v33");
 Tue, 15 Oct 2019 08:30:00 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 997d37604a346b9d
X-CR-MTA-TID: 64aa7808
Received: from aa6095eeaf68.1 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.4.57]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0BC840AC-9B0B-4CB4-B70E-FB0646B86E3B.1; 
 Tue, 15 Oct 2019 08:29:54 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2057.outbound.protection.outlook.com [104.47.4.57])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id aa6095eeaf68.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 15 Oct 2019 08:29:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kJELzFzuFfaIKeBwTkPpBxcXL35hlU2ZtkhCOCjTEx3hhj8OIOnnZSvagzF6BTmacZkhR80cY5o3oH0ATnc+TEFOtpKMP9/ufIGlTZtQWsneoXrU+B4/PEt+suEz1wdKG1ZxrcERjzl5HwpK/ukmvXGddd2opu9KjnwJWEHyVIT5QzT7WwxT9ILMBOVOilRqUFsM2akY4bsit5Rr0I0Argq/R0zPeydgCY5E7cjsmRH+JQD78zvMn/tgLHUTzLjSZGwPmTF5sAPtRlOcJU/xTPU3qhan1AcQY2FbJ0AG01OqpBLdJ84nasGTrx6Pqe9iVZOPOx5rIrTW1XvUAbdheQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yD9/kB+CaGYjLiyrA4Bcr5NAuto1tdOngTBiU9HujLQ=;
 b=PwyufANGly0r/3nFtJiwj/TYL/fzaRwIYHMuu9gpkPX3S0BWQ+3lwLMh1SnAeYzwNK5nBr2UDi36lVpG8pHMjX4Mjo9IhcaSIbS+QmY45nvaxn23lPv2ka5UfVLack1QqR/FeAnrj1zBJPUHYCi8K/WkwO8YlvmHT9dxkwl2FgwPKLcdwjzMBWq2dL10XAng5qx/XX7S0LcGwIGQEOJv21/PAB4HVg5zsYSMGj3cx7irGcEJgHLbAgf0Ofg9/eWg5Ra+qGqLrWFS5rohJY7nH3xMq1ldcXh8N+WHxrPfn1RX9wDgf4BKpOu1781FwEfz0vl7+ioM+XtEi+cWF0e4Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from AM6PR08MB3829.eurprd08.prod.outlook.com (20.178.89.14) by
 AM6PR08MB5048.eurprd08.prod.outlook.com (10.255.123.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Tue, 15 Oct 2019 08:29:53 +0000
Received: from AM6PR08MB3829.eurprd08.prod.outlook.com
 ([fe80::ce0:f47b:919d:561a]) by AM6PR08MB3829.eurprd08.prod.outlook.com
 ([fe80::ce0:f47b:919d:561a%5]) with mapi id 15.20.2347.023; Tue, 15 Oct 2019
 08:29:53 +0000
From: Brian Starkey <Brian.Starkey@arm.com>
To: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
Subject: Re: [PATCH v4 2/4] drm/komeda: Add drm_lut_to_fgamma_coeffs()
Thread-Topic: [PATCH v4 2/4] drm/komeda: Add drm_lut_to_fgamma_coeffs()
Thread-Index: AQHVgv3O8k6iQiFsIUKRPFsOmP4H16dbX3GA
Date: Tue, 15 Oct 2019 08:29:52 +0000
Message-ID: <20191015082951.daxl5wpyt4h7xshh@DESKTOP-E1NTVVP.localdomain>
References: <20191015021016.327-1-james.qian.wang@arm.com>
 <20191015021016.327-3-james.qian.wang@arm.com>
In-Reply-To: <20191015021016.327-3-james.qian.wang@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: NeoMutt/20180716-849-147d51-dirty
x-originating-ip: [217.140.106.54]
x-clientproxiedby: AM0PR01CA0048.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:e6::25) To AM6PR08MB3829.eurprd08.prod.outlook.com
 (2603:10a6:20b:85::14)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Brian.Starkey@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: c6f88fbd-c326-40dc-1a26-08d75149e3dc
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: AM6PR08MB5048:|AM6PR08MB5048:|DB6PR0801MB1734:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB6PR0801MB173438FE49555BD8E4A92884F0930@DB6PR0801MB1734.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:2449;OLM:2449;
x-forefront-prvs: 01917B1794
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(366004)(396003)(136003)(376002)(39860400002)(199004)(189003)(478600001)(25786009)(1076003)(44832011)(6636002)(7736002)(305945005)(2906002)(229853002)(81156014)(66476007)(66556008)(8936002)(81166006)(8676002)(64756008)(66946007)(66446008)(4326008)(6862004)(6246003)(6486002)(6436002)(9686003)(6512007)(66066001)(3846002)(99286004)(446003)(6116002)(11346002)(76176011)(86362001)(476003)(52116002)(316002)(5660300002)(71200400001)(71190400001)(486006)(6506007)(14454004)(386003)(54906003)(102836004)(186003)(58126008)(14444005)(256004)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB5048;
 H:AM6PR08MB3829.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: fAoB5XbxzsKMHR8l76/o8RoWl1xV2VAJu7gcaWtD0ofX6VefAMj2XLVrYA6JG43PhxeYt2Povff8smH9Ep/sIUe8N9zJnVjx+QSuWzOOx2aJ2mi6TazyJfonAQlab721O0Fofac9LeDau0f23wQr1RP5BaD6DNYgsB4KxLL9/hj3ks4PEeDVUKuABbTmfJFJWXTNP51ALNj3hnQJ8O+8EHnlvPLKllaaXFAAbsyXUUBVIPlKj1Lkx1LY3PQOXjVpzbRYI0e63y70pKSWz0ITTGZpzdNknniRRT3gwiHILmQe/7wzEsM/ZX2SPUUD0T0jIlGO/8XBvE9CSH4HZ3FA5vllWIF1jr6OwheqNXNkCItDDmtW29a1qMEIFDi3EQZFyaFvS4RdRw+gtqYtS/ems9VpujYcGcEy2gG8pQy0Y54=
Content-ID: <9DD28CA23DCA4A45A3F7E6FD60AC9C52@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5048
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Brian.Starkey@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(346002)(376002)(396003)(1110001)(339900001)(189003)(199004)(102836004)(1076003)(26005)(70586007)(86362001)(229853002)(22756006)(14454004)(76130400001)(46406003)(305945005)(97756001)(70206006)(7736002)(66066001)(386003)(6506007)(76176011)(99286004)(6486002)(356004)(36906005)(8746002)(50466002)(8676002)(25786009)(14444005)(6862004)(8936002)(4326008)(186003)(316002)(5660300002)(2906002)(6246003)(81166006)(6636002)(47776003)(478600001)(336012)(446003)(486006)(54906003)(476003)(126002)(11346002)(6116002)(3846002)(26826003)(23726003)(6512007)(9686003)(58126008)(81156014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB6PR0801MB1734;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Fail; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 2415c43e-4e20-4dc0-2322-08d75149d9e3
NoDisclaimer: True
X-Forefront-PRVS: 01917B1794
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fr9a6kNyg+qRK5UfvuDx0dHcx3y7GfN3v1bpp2fgw8RtvmeeGfEoCIteCyqvvXahWNKqvChTjwrguAsj2yS+7Z5y4++F2bhkrIYJdkvso8kAFFfTnNudxXR6xzFa3R39owRU5PoWNUXPw6h2MkFdPrkCuAeoSdaEJJ0KH0ui2liEDGXLxH3Fg2a7HK2dUc/KV8W+vETOpODdl4sHsP5p7IDZce6lpRVr86fswoZ0I/OFMjiI0HbIEVUmtceu/FNKMQSBMOmy7+bFjNtllBfESByFPB+dbpz3sImSkRafeVaX6Oejt02a+UMW28h77eAM9L9mJDnxH10CPeqDVoEyS6LSRpyoV30W4Y5O5SQAdSOQnieJg2PMcup2KXBDyHAiDeDM0rXEWKzlEnfELFgkeqVm+jc3ucfSz1asDSYbEwU=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2019 08:30:09.2098 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6f88fbd-c326-40dc-1a26-08d75149e3dc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1734
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yD9/kB+CaGYjLiyrA4Bcr5NAuto1tdOngTBiU9HujLQ=;
 b=ej3MUu2NjDWd6mm5HG+Gxa3ICtFLKNCsIccJb1uuptfzz0o8NiiP4xPlgXnrJIz/kTmnuEOKIxXR6l7kQd6hUW0pIoTwn1etJD+uHZdGvAl4ljyoIo+ChtaRYyglLgTawsg+2ngHV7+4Z1cFkvk79Eb+hsozmH8mcXV4DDvglLI=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yD9/kB+CaGYjLiyrA4Bcr5NAuto1tdOngTBiU9HujLQ=;
 b=ej3MUu2NjDWd6mm5HG+Gxa3ICtFLKNCsIccJb1uuptfzz0o8NiiP4xPlgXnrJIz/kTmnuEOKIxXR6l7kQd6hUW0pIoTwn1etJD+uHZdGvAl4ljyoIo+ChtaRYyglLgTawsg+2ngHV7+4Z1cFkvk79Eb+hsozmH8mcXV4DDvglLI=
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

SGkgSmFtZXMsCgpPbiBUdWUsIE9jdCAxNSwgMjAxOSBhdCAwMjoxMDo1M0FNICswMDAwLCBqYW1l
cyBxaWFuIHdhbmcgKEFybSBUZWNobm9sb2d5IENoaW5hKSB3cm90ZToKPiBUaGlzIGZ1bmN0aW9u
IGlzIHVzZWQgdG8gY29udmVydCBkcm0gM2RsdXQgdG8ga29tZWRhIEhXIHJlcXVpcmVkIDFkIGN1
cnZlCgpUaGlzIGlzIGEgMUQgTFVULCBub3QgYSAzRCBMVVQKCkNoZWVycywKLUJyaWFuCgo+IGNv
ZWZmcyB2YWx1ZXMuCj4gCj4gU2lnbmVkLW9mZi1ieTogamFtZXMgcWlhbiB3YW5nIChBcm0gVGVj
aG5vbG9neSBDaGluYSkgPGphbWVzLnFpYW4ud2FuZ0Bhcm0uY29tPgo+IFJldmlld2VkLWJ5OiBN
aWhhaWwgQXRhbmFzc292IDxtaWhhaWwuYXRhbmFzc292QGFybS5jb20+Cj4gLS0tCj4gIC4uLi9h
cm0vZGlzcGxheS9rb21lZGEva29tZWRhX2NvbG9yX21nbXQuYyAgICB8IDUyICsrKysrKysrKysr
KysrKysrKysKPiAgLi4uL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY29sb3JfbWdtdC5oICAg
IHwgIDkgKysrLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDYwIGluc2VydGlvbnMoKyksIDEgZGVsZXRp
b24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVk
YS9rb21lZGFfY29sb3JfbWdtdC5jIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVk
YS9rb21lZGFfY29sb3JfbWdtdC5jCj4gaW5kZXggOWQxNGE5MmRiYjE3Li5jMTgwY2U3MGMyNmMg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFf
Y29sb3JfbWdtdC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9r
b21lZGFfY29sb3JfbWdtdC5jCj4gQEAgLTY1LDMgKzY1LDU1IEBAIGNvbnN0IHMzMiAqa29tZWRh
X3NlbGVjdF95dXYycmdiX2NvZWZmcyh1MzIgY29sb3JfZW5jb2RpbmcsIHUzMiBjb2xvcl9yYW5n
ZSkKPiAgCj4gIAlyZXR1cm4gY29lZmZzOwo+ICB9Cj4gKwo+ICtzdHJ1Y3QgZ2FtbWFfY3VydmVf
c2VjdG9yIHsKPiArCXUzMiBib3VuZGFyeV9zdGFydDsKPiArCXUzMiBudW1fb2Zfc2VnbWVudHM7
Cj4gKwl1MzIgc2VnbWVudF93aWR0aDsKPiArfTsKPiArCj4gK3N0cnVjdCBnYW1tYV9jdXJ2ZV9z
ZWdtZW50IHsKPiArCXUzMiBzdGFydDsKPiArCXUzMiBlbmQ7Cj4gK307Cj4gKwo+ICtzdGF0aWMg
c3RydWN0IGdhbW1hX2N1cnZlX3NlY3RvciBzZWN0b3JfdGJsW10gPSB7Cj4gKwl7IDAsICAgIDQs
ICA0ICAgfSwKPiArCXsgMTYsICAgNCwgIDQgICB9LAo+ICsJeyAzMiwgICA0LCAgOCAgIH0sCj4g
Kwl7IDY0LCAgIDQsICAxNiAgfSwKPiArCXsgMTI4LCAgNCwgIDMyICB9LAo+ICsJeyAyNTYsICA0
LCAgNjQgIH0sCj4gKwl7IDUxMiwgIDE2LCAzMiAgfSwKPiArCXsgMTAyNCwgMjQsIDEyOCB9LAo+
ICt9Owo+ICsKPiArc3RhdGljIHZvaWQKPiArZHJtX2x1dF90b19jb2VmZnMoc3RydWN0IGRybV9w
cm9wZXJ0eV9ibG9iICpsdXRfYmxvYiwgdTMyICpjb2VmZnMsCj4gKwkJICBzdHJ1Y3QgZ2FtbWFf
Y3VydmVfc2VjdG9yICpzZWN0b3JfdGJsLCB1MzIgbnVtX3NlY3RvcnMpCj4gK3sKPiArCXN0cnVj
dCBkcm1fY29sb3JfbHV0ICpsdXQ7Cj4gKwl1MzIgaSwgaiwgaW4sIG51bSA9IDA7Cj4gKwo+ICsJ
aWYgKCFsdXRfYmxvYikKPiArCQlyZXR1cm47Cj4gKwo+ICsJbHV0ID0gbHV0X2Jsb2ItPmRhdGE7
Cj4gKwo+ICsJZm9yIChpID0gMDsgaSA8IG51bV9zZWN0b3JzOyBpKyspIHsKPiArCQlmb3IgKGog
PSAwOyBqIDwgc2VjdG9yX3RibFtpXS5udW1fb2Zfc2VnbWVudHM7IGorKykgewo+ICsJCQlpbiA9
IHNlY3Rvcl90YmxbaV0uYm91bmRhcnlfc3RhcnQgKwo+ICsJCQkgICAgIGogKiBzZWN0b3JfdGJs
W2ldLnNlZ21lbnRfd2lkdGg7Cj4gKwo+ICsJCQljb2VmZnNbbnVtKytdID0gZHJtX2NvbG9yX2x1
dF9leHRyYWN0KGx1dFtpbl0ucmVkLAo+ICsJCQkJCQlLT01FREFfQ09MT1JfUFJFQ0lTSU9OKTsK
PiArCQl9Cj4gKwl9Cj4gKwo+ICsJY29lZmZzW251bV0gPSBCSVQoS09NRURBX0NPTE9SX1BSRUNJ
U0lPTik7Cj4gK30KPiArCj4gK3ZvaWQgZHJtX2x1dF90b19mZ2FtbWFfY29lZmZzKHN0cnVjdCBk
cm1fcHJvcGVydHlfYmxvYiAqbHV0X2Jsb2IsIHUzMiAqY29lZmZzKQo+ICt7Cj4gKwlkcm1fbHV0
X3RvX2NvZWZmcyhsdXRfYmxvYiwgY29lZmZzLCBzZWN0b3JfdGJsLCBBUlJBWV9TSVpFKHNlY3Rv
cl90YmwpKTsKPiArfQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkv
a29tZWRhL2tvbWVkYV9jb2xvcl9tZ210LmggYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkv
a29tZWRhL2tvbWVkYV9jb2xvcl9tZ210LmgKPiBpbmRleCBhMmRmMjE4ZjU4ZTcuLjA4YWI2OTI4
MTY0OCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tv
bWVkYV9jb2xvcl9tZ210LmgKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29t
ZWRhL2tvbWVkYV9jb2xvcl9tZ210LmgKPiBAQCAtMTEsNyArMTEsMTQgQEAKPiAgI2luY2x1ZGUg
PGRybS9kcm1fY29sb3JfbWdtdC5oPgo+ICAKPiAgI2RlZmluZSBLT01FREFfTl9ZVVYyUkdCX0NP
RUZGUwkJMTIKPiArI2RlZmluZSBLT01FREFfTl9SR0IyWVVWX0NPRUZGUwkJMTIKPiArI2RlZmlu
ZSBLT01FREFfQ09MT1JfUFJFQ0lTSU9OCQkxMgo+ICsjZGVmaW5lIEtPTUVEQV9OX0dBTU1BX0NP
RUZGUwkJNjUKPiArI2RlZmluZSBLT01FREFfQ09MT1JfTFVUX1NJWkUJCUJJVChLT01FREFfQ09M
T1JfUFJFQ0lTSU9OKQo+ICsjZGVmaW5lIEtPTUVEQV9OX0NUTV9DT0VGRlMJCTkKPiArCj4gK3Zv
aWQgZHJtX2x1dF90b19mZ2FtbWFfY29lZmZzKHN0cnVjdCBkcm1fcHJvcGVydHlfYmxvYiAqbHV0
X2Jsb2IsIHUzMiAqY29lZmZzKTsKPiAgCj4gIGNvbnN0IHMzMiAqa29tZWRhX3NlbGVjdF95dXYy
cmdiX2NvZWZmcyh1MzIgY29sb3JfZW5jb2RpbmcsIHUzMiBjb2xvcl9yYW5nZSk7Cj4gIAo+IC0j
ZW5kaWYKPiArI2VuZGlmIC8qX0tPTUVEQV9DT0xPUl9NR01UX0hfKi8KPiAtLSAKPiAyLjIwLjEK
PiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
