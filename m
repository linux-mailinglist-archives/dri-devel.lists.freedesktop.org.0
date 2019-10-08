Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18AD8CF7FF
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2019 13:19:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12B7D6E101;
	Tue,  8 Oct 2019 11:19:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00080.outbound.protection.outlook.com [40.107.0.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A3DC6E101
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 11:19:15 +0000 (UTC)
Received: from VI1PR0802CA0023.eurprd08.prod.outlook.com
 (2603:10a6:800:aa::33) by VI1PR0802MB2304.eurprd08.prod.outlook.com
 (2603:10a6:800:9f::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2327.25; Tue, 8 Oct
 2019 11:19:09 +0000
Received: from DB5EUR03FT042.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::209) by VI1PR0802CA0023.outlook.office365.com
 (2603:10a6:800:aa::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2327.24 via Frontend
 Transport; Tue, 8 Oct 2019 11:19:09 +0000
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT042.mail.protection.outlook.com (10.152.21.123) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Tue, 8 Oct 2019 11:19:09 +0000
Received: ("Tessian outbound 927f2cdd66cc:v33");
 Tue, 08 Oct 2019 11:19:07 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: a54996235a096243
X-CR-MTA-TID: 64aa7808
Received: from 9b174ae686e9.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.5.56]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 42C8EA41-777F-43D2-BA26-D10ADEB49D94.1; 
 Tue, 08 Oct 2019 11:19:02 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2056.outbound.protection.outlook.com [104.47.5.56])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9b174ae686e9.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 08 Oct 2019 11:19:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TOfhit/IXGkP3WDaxKes6456FcAkxcw4J14O3XQaIgS5sawAX2tsO6l6C7AsBiV4bC7256wFXJZjkymYU2xe8mXknSQjghqFcuPK7JxCPl+ZJ6IloFz7bDVGM0hIhgNhPsOg2BX6nc0AFiNNGdrdbnG26joFZOKML3TFYXrQds2CMyXVJKw+o34+KOwK6CfBHnXKprCKM83Rp5f+1kpi/Vwz8MDpGELbTpou8mWuvPBa36BrkoCbqkl2gzIVL8N19+er0pxSe4WRD8X25VYO8hossgYwRunE72Z7zhVRQ9/o9yBUNXV9siwKGW0N4NUb62/GJxUYcMT0bAR4D7pO7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R+8cPpEdvE0a0oBV2As+q8KHgTvRTUMZbOIyj+3YYM8=;
 b=iPbKPc7iI2IVc9M94/Fn/VHSKZFg4Jf3Gim2jMvTtcgogt5XP1zbgq3TMXa0azSPrjvpFXJ+zQqwuORoQ4/9dx5S+Xkh/3Ji/hlNjDhPtatTgJV2mlvxj9XfNf+1Myj9XkVrwNK0pVD2UEG/jLTj18DVVzQMl2g+sJGZn7NDYPMLyTtjbfezBPrBgM4f4QP48cDekevzTC7qyHUcP+5GConkNHZDaUvHGm4mIaI2txBauJOwZkPm1TStJAPLAwAuzkpAFIyj+4Wa+FeteiRrncTKicoVQqjKvemxK/U81SdgSpV7VWUpw6KwI+iBAd0n2lDxB6QwASYZ7v7HM3ySNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB4015.eurprd08.prod.outlook.com (20.178.126.92) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.24; Tue, 8 Oct 2019 11:18:56 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::7d25:d1f2:e3eb:868b]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::7d25:d1f2:e3eb:868b%6]) with mapi id 15.20.2327.026; Tue, 8 Oct 2019
 11:18:56 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>
Subject: Re: [PATCH] drm/komeda: Set output color depth for output
Thread-Topic: [PATCH] drm/komeda: Set output color depth for output
Thread-Index: AQHVfblD7I+ubO1huUCp0qQz7Z0Q4adQfC0AgAAOlYCAAA4iAA==
Date: Tue, 8 Oct 2019 11:18:56 +0000
Message-ID: <3803267.CWkr2XGRCA@e123338-lin>
References: <20191008091734.19509-1-lowry.li@arm.com>
 <20191008093608.eyr5ygc2lkkaaqia@DESKTOP-E1NTVVP.localdomain>
 <20191008102818.GB16398@lowli01-ThinkStation-P300>
In-Reply-To: <20191008102818.GB16398@lowli01-ThinkStation-P300>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.54]
x-clientproxiedby: LO2P265CA0151.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9::19) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 77d67a19-4e5b-4940-c05f-08d74be156f1
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: VI1PR08MB4015:|VI1PR08MB4015:|VI1PR0802MB2304:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0802MB2304C53D25B7268985F26CDD8F9A0@VI1PR0802MB2304.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:6790;OLM:6790;
x-forefront-prvs: 01842C458A
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(136003)(39860400002)(396003)(366004)(346002)(376002)(199004)(189003)(305945005)(6116002)(3846002)(6636002)(478600001)(86362001)(71190400001)(71200400001)(7736002)(8676002)(81166006)(81156014)(8936002)(54906003)(316002)(2906002)(25786009)(14444005)(256004)(14454004)(33716001)(486006)(186003)(66556008)(66946007)(66476007)(64756008)(386003)(6506007)(4326008)(476003)(76176011)(11346002)(66446008)(446003)(26005)(5660300002)(6246003)(6862004)(6436002)(9686003)(99286004)(66066001)(6486002)(229853002)(6512007)(52116002)(102836004)(39026011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB4015;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: AUjSNZdZeG6imk9J02mDPPurxJyMNPpYtwkS/wo605pes9PG/M+z03xQNIqAYAfNyj8+vZ/st61nwIATqXQndn5p+JRHVYhYuqHolY4El/63sOrQqELvS4WbUwZWuBbHExsO0PeCgde3bAY0PSIk8zn3hZxAdVxLIYZLOY6jAYG9YLs/AmT2MZmvmSrAMg7B7SbG8hYVPReHJvJcljQyMDJBWu3m83ecIahRS77JTwAjb1Bg0DWWCwgC2mTifrAS4zD7Q7ZOfbgmnl+kjmEYKZqWSWRtMUXwq+QMCmkYHNIyopaggqOcPPWcGBEN3ZOfYV8vwVVihDDv3CZ992vCoz0KRM/IchDO+bk8uO8AymMWz/Cqo/3DR+gCY6CzOWYc0yhFymOqf8KjgS1H1fsELxSk+JgV8HomQswy4Hl7btk=
Content-ID: <90B299F6B6C45D4EA7BD032BEF584247@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4015
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(376002)(346002)(136003)(39860400002)(396003)(1110001)(339900001)(199004)(189003)(446003)(8936002)(26826003)(99286004)(6862004)(81166006)(8746002)(102836004)(26005)(386003)(6506007)(126002)(476003)(6636002)(76176011)(4326008)(7736002)(305945005)(478600001)(6246003)(25786009)(186003)(486006)(70586007)(76130400001)(11346002)(70206006)(8676002)(5660300002)(97756001)(81156014)(47776003)(66066001)(6116002)(86362001)(23726003)(46406003)(50466002)(2906002)(54906003)(22756006)(316002)(336012)(14444005)(3846002)(33716001)(6486002)(9686003)(14454004)(6512007)(356004)(229853002)(39026011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0802MB2304;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Fail; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: e96d1e4e-532b-47c1-da70-08d74be14ee3
NoDisclaimer: True
X-Forefront-PRVS: 01842C458A
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qaXlXrAAgPbX8Ei9wBI/KYVuIqFAQIsGLhf+mrZovQl217E11GXAwSKNCm/XXW+iri2hPOeoubKoMQL/0xn3okYvULByjGAVEUKxfoyEJW6Nuaizk0mdxA/opGXrpZ7VSXp3miRcowxwbhomYHL2Ut1fWWPaPOlVVjMEtwgqNZ8aAQaS8zcCyhrQI+aFV4L8MRmtnI7CbV1/1HgsRpxLUyfGIpftq4+9HDjh8EgSP3I15SlpQPtFT8CbwcREJX78f+OxLCaOXhlvZfUIbv8zJXnsnPrFw+M1tonN7390naau2eryntmXWifhFtaRrub+ubpoq4QRD7nQ46II/1GfEakiUdEDpNCNTbuMONJt+EI+AZ2I1hI0+E11It68bKPGjTW6ljdMZpcRm/2QMJSaWpGQ2zbDZQC5di22oZ8+0bA=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2019 11:19:09.4122 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77d67a19-4e5b-4940-c05f-08d74be156f1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2304
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R+8cPpEdvE0a0oBV2As+q8KHgTvRTUMZbOIyj+3YYM8=;
 b=x4BOGGVxb4FBNWWIPSJD9EOetfYFNHIhLKEm4qWUhCMckFiq500BaKj+fgsLjeXEd/AOEkJ2EtJkCbmemZNUX6loS3vEaWPutucaEScLjESBZyJiVE7MkRHxBH2knPou2jWpm6dsnMCAI91lgAvsnEU38IBlRCQ7IBRwRzQNQVs=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R+8cPpEdvE0a0oBV2As+q8KHgTvRTUMZbOIyj+3YYM8=;
 b=x4BOGGVxb4FBNWWIPSJD9EOetfYFNHIhLKEm4qWUhCMckFiq500BaKj+fgsLjeXEd/AOEkJ2EtJkCbmemZNUX6loS3vEaWPutucaEScLjESBZyJiVE7MkRHxBH2knPou2jWpm6dsnMCAI91lgAvsnEU38IBlRCQ7IBRwRzQNQVs=
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
Cc: nd <nd@arm.com>, "airlied@linux.ie" <airlied@linux.ie>,
 Liviu Dudau <Liviu.Dudau@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>,
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 Ayan Halder <Ayan.Halder@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlc2RheSwgOCBPY3RvYmVyIDIwMTkgMTE6Mjg6MjQgQlNUIExvd3J5IExpIChBcm0gVGVj
aG5vbG9neSBDaGluYSkgd3JvdGU6Cj4gSGkgQnJpYW4sCj4gT24gVHVlLCBPY3QgMDgsIDIwMTkg
YXQgMDk6MzY6MDlBTSArMDAwMCwgQnJpYW4gU3RhcmtleSB3cm90ZToKPiA+IEhpIExvd3J5LAo+
ID4gCj4gPiBPbiBUdWUsIE9jdCAwOCwgMjAxOSBhdCAwOToxNzo1MkFNICswMDAwLCBMb3dyeSBM
aSAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIHdyb3RlOgo+ID4gPiBTZXQgY29sb3JfZGVwdGggYWNj
b3JkaW5nIHRvIGNvbm5lY3Rvci0+YnBjLgo+ID4gPiAKPiA+ID4gU2lnbmVkLW9mZi1ieTogTG93
cnkgTGkgKEFybSBUZWNobm9sb2d5IENoaW5hKSA8bG93cnkubGlAYXJtLmNvbT4KPiA+ID4gLS0t
Cj4gPiA+ICAuLi4vYXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFfY29tcG9uZW50LmMgICAgfCAg
MSArCj4gPiA+ICAuLi4vZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2NydGMuYyAg
fCAyMCArKysrKysrKysrKysrKysrKysrCj4gPiA+ICAuLi4vZ3B1L2RybS9hcm0vZGlzcGxheS9r
b21lZGEva29tZWRhX2ttcy5oICAgfCAgMiArKwo+ID4gPiAgLi4uL2RybS9hcm0vZGlzcGxheS9r
b21lZGEva29tZWRhX3BpcGVsaW5lLmggIHwgIDEgKwo+ID4gPiAgLi4uL2Rpc3BsYXkva29tZWRh
L2tvbWVkYV9waXBlbGluZV9zdGF0ZS5jICAgIHwgMTkgKysrKysrKysrKysrKysrKysrCj4gPiA+
ICAuLi4vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV93Yl9jb25uZWN0b3IuYyAgfCAgNCArKysr
Cj4gPiA+ICA2IGZpbGVzIGNoYW5nZWQsIDQ3IGluc2VydGlvbnMoKykKPiA+ID4gCj4gPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFfY29t
cG9uZW50LmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFfY29t
cG9uZW50LmMKPiA+ID4gaW5kZXggYzNkMjljMGIwNTFiLi4yN2NkYjAzNTczYzEgMTAwNjQ0Cj4g
PiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9jb21w
b25lbnQuYwo+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2Q3
MS9kNzFfY29tcG9uZW50LmMKPiA+ID4gQEAgLTk1MSw2ICs5NTEsNyBAQCBzdGF0aWMgdm9pZCBk
NzFfaW1wcm9jX3VwZGF0ZShzdHJ1Y3Qga29tZWRhX2NvbXBvbmVudCAqYywKPiA+ID4gIAkJCSAg
ICAgICB0b19kNzFfaW5wdXRfaWQoc3RhdGUsIGluZGV4KSk7Cj4gPiA+ICAKPiA+ID4gIAltYWxp
ZHBfd3JpdGUzMihyZWcsIEJMS19TSVpFLCBIVl9TSVpFKHN0LT5oc2l6ZSwgc3QtPnZzaXplKSk7
Cj4gPiA+ICsJbWFsaWRwX3dyaXRlMzIocmVnLCBJUFNfREVQVEgsIHN0LT5jb2xvcl9kZXB0aCk7
Cj4gPiA+ICB9Cj4gPiA+ICAKPiA+ID4gIHN0YXRpYyB2b2lkIGQ3MV9pbXByb2NfZHVtcChzdHJ1
Y3Qga29tZWRhX2NvbXBvbmVudCAqYywgc3RydWN0IHNlcV9maWxlICpzZikKPiA+ID4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2NydGMuYyBi
L2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2NydGMuYwo+ID4gPiBp
bmRleCA3NTI2M2Q4Y2QwYmQuLmJhYTk4NmI3MDg3NiAxMDA2NDQKPiA+ID4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY3J0Yy5jCj4gPiA+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2NydGMuYwo+ID4gPiBAQCAt
MTcsNiArMTcsMjYgQEAKPiA+ID4gICNpbmNsdWRlICJrb21lZGFfZGV2LmgiCj4gPiA+ICAjaW5j
bHVkZSAia29tZWRhX2ttcy5oIgo+ID4gPiAgCj4gPiA+ICt2b2lkIGtvbWVkYV9jcnRjX2dldF9j
b2xvcl9jb25maWcoc3RydWN0IGRybV9jcnRjX3N0YXRlICpjcnRjX3N0LAo+ID4gPiArCQkJCSAg
dTMyICpjb2xvcl9kZXB0aHMpCj4gPiA+ICt7Cj4gPiA+ICsJc3RydWN0IGRybV9jb25uZWN0b3Ig
KmNvbm47Cj4gPiA+ICsJc3RydWN0IGRybV9jb25uZWN0b3Jfc3RhdGUgKmNvbm5fc3Q7Cj4gPiA+
ICsJaW50IGksIG1pbl9icGMgPSAzMSwgY29ubl9icGMgPSAwOwo+ID4gPiArCj4gPiA+ICsJZm9y
X2VhY2hfbmV3X2Nvbm5lY3Rvcl9pbl9zdGF0ZShjcnRjX3N0LT5zdGF0ZSwgY29ubiwgY29ubl9z
dCwgaSkgewo+ID4gPiArCQlpZiAoY29ubl9zdC0+Y3J0YyAhPSBjcnRjX3N0LT5jcnRjKQo+ID4g
PiArCQkJY29udGludWU7Cj4gPiA+ICsKPiA+ID4gKwkJY29ubl9icGMgPSBjb25uLT5kaXNwbGF5
X2luZm8uYnBjID8gY29ubi0+ZGlzcGxheV9pbmZvLmJwYyA6IDg7Cj4gPiAKPiA+IFdlIGNhbiBo
YXZlIG11bHRpcGxlIGNvbm5lY3RvcnMgb24gYSBzaW5nbGUgQ1JUQyAoZS5nLiBub3JtYWwgKwo+
ID4gd3JpdGViYWNrKSwgc28gd2hhdCdzIHRoZSBleHBlY3RlZCBiZWhhdmlvdXIgaGVyZSBpbiB0
aGF0IGNhc2U/Cj4gPiAKPiA+ID4gKwo+ID4gPiArCQlpZiAoY29ubl9icGMgPCBtaW5fYnBjKQo+
ID4gPiArCQkJbWluX2JwYyA9IGNvbm5fYnBjOwo+ID4gPiArCX0KPiA+ID4gKwo+ID4gPiArCSpj
b2xvcl9kZXB0aHMgPSBHRU5NQVNLKGNvbm5fYnBjLCAwKTsKPiA+ID4gK30KPiA+ID4gKwo+ID4g
PiAgc3RhdGljIHZvaWQga29tZWRhX2NydGNfdXBkYXRlX2Nsb2NrX3JhdGlvKHN0cnVjdCBrb21l
ZGFfY3J0Y19zdGF0ZSAqa2NydGNfc3QpCj4gPiA+ICB7Cj4gPiA+ICAJdTY0IHB4bGNsaywgYWNs
azsKPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEv
a29tZWRhX2ttcy5oIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFf
a21zLmgKPiA+ID4gaW5kZXggNDVjNDk4ZTE1ZTdhLi5hNDI1MDM0NTFiNWQgMTAwNjQ0Cj4gPiA+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ttcy5oCj4g
PiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ttcy5o
Cj4gPiA+IEBAIC0xNjYsNiArMTY2LDggQEAgc3RhdGljIGlubGluZSBib29sIGhhc19mbGlwX2go
dTMyIHJvdCkKPiA+ID4gIAkJcmV0dXJuICEhKHJvdGF0aW9uICYgRFJNX01PREVfUkVGTEVDVF9Y
KTsKPiA+ID4gIH0KPiA+ID4gIAo+ID4gPiArdm9pZCBrb21lZGFfY3J0Y19nZXRfY29sb3JfY29u
ZmlnKHN0cnVjdCBkcm1fY3J0Y19zdGF0ZSAqY3J0Y19zdCwKPiA+ID4gKwkJCQkgIHUzMiAqY29s
b3JfZGVwdGhzKTsKPiA+ID4gIHVuc2lnbmVkIGxvbmcga29tZWRhX2NydGNfZ2V0X2FjbGsoc3Ry
dWN0IGtvbWVkYV9jcnRjX3N0YXRlICprY3J0Y19zdCk7Cj4gPiA+ICAKPiA+ID4gIGludCBrb21l
ZGFfa21zX3NldHVwX2NydGNzKHN0cnVjdCBrb21lZGFfa21zX2RldiAqa21zLCBzdHJ1Y3Qga29t
ZWRhX2RldiAqbWRldik7Cj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rp
c3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZS5oIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNw
bGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmUuaAo+ID4gPiBpbmRleCBiMzIyZjUyYmE4ZjIuLjc2
NTNmMTM0YThlYiAxMDA2NDQKPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5
L2tvbWVkYS9rb21lZGFfcGlwZWxpbmUuaAo+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJt
L2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZS5oCj4gPiA+IEBAIC0zMjMsNiArMzIzLDcg
QEAgc3RydWN0IGtvbWVkYV9pbXByb2Mgewo+ID4gPiAgCj4gPiA+ICBzdHJ1Y3Qga29tZWRhX2lt
cHJvY19zdGF0ZSB7Cj4gPiA+ICAJc3RydWN0IGtvbWVkYV9jb21wb25lbnRfc3RhdGUgYmFzZTsK
PiA+ID4gKwl1OCBjb2xvcl9kZXB0aDsKPiA+ID4gIAl1MTYgaHNpemUsIHZzaXplOwo+ID4gPiAg
fTsKPiA+ID4gIAo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5
L2tvbWVkYS9rb21lZGFfcGlwZWxpbmVfc3RhdGUuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlz
cGxheS9rb21lZGEva29tZWRhX3BpcGVsaW5lX3N0YXRlLmMKPiA+ID4gaW5kZXggMGJhOWM2YWEz
NzA4Li5lNjhlOGY4NWFiMjcgMTAwNjQ0Cj4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0v
ZGlzcGxheS9rb21lZGEva29tZWRhX3BpcGVsaW5lX3N0YXRlLmMKPiA+ID4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmVfc3RhdGUuYwo+ID4g
PiBAQCAtNzQzLDYgKzc0Myw3IEBAIGtvbWVkYV9pbXByb2NfdmFsaWRhdGUoc3RydWN0IGtvbWVk
YV9pbXByb2MgKmltcHJvYywKPiA+ID4gIAkJICAgICAgIHN0cnVjdCBrb21lZGFfZGF0YV9mbG93
X2NmZyAqZGZsb3cpCj4gPiA+ICB7Cj4gPiA+ICAJc3RydWN0IGRybV9jcnRjICpjcnRjID0ga2Ny
dGNfc3QtPmJhc2UuY3J0YzsKPiA+ID4gKwlzdHJ1Y3QgZHJtX2NydGNfc3RhdGUgKmNydGNfc3Qg
PSAma2NydGNfc3QtPmJhc2U7Cj4gPiA+ICAJc3RydWN0IGtvbWVkYV9jb21wb25lbnRfc3RhdGUg
KmNfc3Q7Cj4gPiA+ICAJc3RydWN0IGtvbWVkYV9pbXByb2Nfc3RhdGUgKnN0Owo+ID4gPiAgCj4g
PiA+IEBAIC03NTYsNiArNzU3LDI0IEBAIGtvbWVkYV9pbXByb2NfdmFsaWRhdGUoc3RydWN0IGtv
bWVkYV9pbXByb2MgKmltcHJvYywKPiA+ID4gIAlzdC0+aHNpemUgPSBkZmxvdy0+aW5fdzsKPiA+
ID4gIAlzdC0+dnNpemUgPSBkZmxvdy0+aW5faDsKPiA+ID4gIAo+ID4gPiArCWlmIChkcm1fYXRv
bWljX2NydGNfbmVlZHNfbW9kZXNldChjcnRjX3N0KSkgewo+ID4gPiArCQl1MzIgb3V0cHV0X2Rl
cHRoczsKPiA+ID4gKwkJdTMyIGF2YWlsX2RlcHRoczsKPiA+ID4gKwo+ID4gPiArCQlrb21lZGFf
Y3J0Y19nZXRfY29sb3JfY29uZmlnKGNydGNfc3QsCj4gPiA+ICsJCQkJCSAgICAgJm91dHB1dF9k
ZXB0aHMpOwo+ID4gPiArCj4gPiA+ICsJCWF2YWlsX2RlcHRocyA9IG91dHB1dF9kZXB0aHMgJiBp
bXByb2MtPnN1cHBvcnRlZF9jb2xvcl9kZXB0aHM7Cj4gPiA+ICsJCWlmIChhdmFpbF9kZXB0aHMg
PT0gMCkgewo+ID4gPiArCQkJRFJNX0RFQlVHX0FUT01JQygiTm8gYXZhaWxhYmxlIGNvbG9yIGRl
cHRocywgY29ubiBkZXB0aHM6IDB4JXggJiBkaXNwbGF5OiAweCV4XG4iLAo+ID4gPiArCQkJCQkg
b3V0cHV0X2RlcHRocywKPiA+ID4gKwkJCQkJIGltcHJvYy0+c3VwcG9ydGVkX2NvbG9yX2RlcHRo
cyk7Cj4gPiA+ICsJCQlyZXR1cm4gLUVJTlZBTDsKPiA+ID4gKwkJfQo+ID4gPiArCj4gPiA+ICsJ
CXN0LT5jb2xvcl9kZXB0aCA9IF9fZmxzKGF2YWlsX2RlcHRocyk7Cj4gPiA+ICsJfQo+ID4gPiAr
Cj4gPiA+ICAJa29tZWRhX2NvbXBvbmVudF9hZGRfaW5wdXQoJnN0LT5iYXNlLCAmZGZsb3ctPmlu
cHV0LCAwKTsKPiA+ID4gIAlrb21lZGFfY29tcG9uZW50X3NldF9vdXRwdXQoJmRmbG93LT5pbnB1
dCwgJmltcHJvYy0+YmFzZSwgMCk7Cj4gPiA+ICAKPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3diX2Nvbm5lY3Rvci5jIGIvZHJpdmVy
cy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfd2JfY29ubmVjdG9yLmMKPiA+ID4g
aW5kZXggMjg1MWNhYzk0ZDg2Li43NDBhODEyNTA2MzAgMTAwNjQ0Cj4gPiA+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3diX2Nvbm5lY3Rvci5jCj4gPiA+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3diX2Nvbm5l
Y3Rvci5jCj4gPiA+IEBAIC0xNDIsNiArMTQyLDcgQEAgc3RhdGljIGludCBrb21lZGFfd2JfY29u
bmVjdG9yX2FkZChzdHJ1Y3Qga29tZWRhX2ttc19kZXYgKmttcywKPiA+ID4gIAlzdHJ1Y3Qga29t
ZWRhX2RldiAqbWRldiA9IGttcy0+YmFzZS5kZXZfcHJpdmF0ZTsKPiA+ID4gIAlzdHJ1Y3Qga29t
ZWRhX3diX2Nvbm5lY3RvciAqa3diX2Nvbm47Cj4gPiA+ICAJc3RydWN0IGRybV93cml0ZWJhY2tf
Y29ubmVjdG9yICp3Yl9jb25uOwo+ID4gPiArCXN0cnVjdCBkcm1fZGlzcGxheV9pbmZvICppbmZv
Owo+ID4gPiAgCXUzMiAqZm9ybWF0cywgbl9mb3JtYXRzID0gMDsKPiA+ID4gIAlpbnQgZXJyOwo+
ID4gPiAgCj4gPiA+IEBAIC0xNzEsNiArMTcyLDkgQEAgc3RhdGljIGludCBrb21lZGFfd2JfY29u
bmVjdG9yX2FkZChzdHJ1Y3Qga29tZWRhX2ttc19kZXYgKmttcywKPiA+ID4gIAo+ID4gPiAgCWRy
bV9jb25uZWN0b3JfaGVscGVyX2FkZCgmd2JfY29ubi0+YmFzZSwgJmtvbWVkYV93Yl9jb25uX2hl
bHBlcl9mdW5jcyk7Cj4gPiA+ICAKPiA+ID4gKwlpbmZvID0gJmt3Yl9jb25uLT5iYXNlLmJhc2Uu
ZGlzcGxheV9pbmZvOwo+ID4gPiArCWluZm8tPmJwYyA9IF9fZmxzKGtjcnRjLT5tYXN0ZXItPmlt
cHJvYy0+c3VwcG9ydGVkX2NvbG9yX2RlcHRocyk7Cj4gPiA+ICsKPiA+IAo+ID4gVGhlIElQUyBj
b2xvciBkZXB0aCBkb2Vzbid0IHJlYWxseSBhcHBseSB0byB3cml0ZWJhY2suIE1heWJlIHdlIHNo
b3VsZAo+ID4ganVzdCBza2lwIHRoZSB3cml0ZWJhY2sgY29ubmVjdG9yPwo+ID4gCj4gPiBUaGFu
a3MsCj4gPiAtQnJpYW4KPiA+IAo+IFllcywgdGhlIGNvbG9yIGRlcHRoIG5vdCBhcHBseSB0byB3
cml0ZWJhY2suIFdlIGFkZHMgaXQgYmVjYXVzZToKPiAKPiBJbiB0aGUga29tZWRhX2NydGNfZ2V0
X2NvbG9yX2NvbmZpZygpIHdpbGwgbG9vcCBhbGwgY29ubmVjdG9ycyBvZiBDUlRDCj4gaW5jbHVk
aW5nIHRoZSB3Yl9jb25uLCBzaW5jZSBjcnRjIGFsd2F5cyBoYXMgd2JfY29ubi4gSWYgbm90IHNl
dHRpbmcKPiBoZXJlLCB3Yl9jb25uLT5icGMgd2lsbCBiZSBzZXQgaXQgdG8gOGJpdCBmb3JjZWx5
IGluIGtvbWVkYV9jcnRjX2dldF9jb2xvcl9jb25maWcoKSB3aGljaCB3aWxsIGxlYWQgY3J0YyBi
cGMgdG8gOGJpdHMgYWxsIHRoZSB0aW1lLiBTbyB3ZSBhcmUgc2V0dGluZyB0aGUKPiBsYXJnZXN0
IHN1cHBvcnRlZCBkZXB0aCB0byBrd2JfY29ubi0+YnBjIGhlcmUuCj4gCkkgYWdyZWUgd2l0aCBC
cmlhbiBoZXJlLCBpdCBzb3VuZHMgbGlrZSB5b3UgbmVlZCB0byBmaXgKa29tZWRhX2NydGNfZ2V0
X2NvbG9yX2NvbmZpZygpIHJhdGhlciB0aGFuIHB1dHRpbmcgaW4gYXJjYW5lIGJwYwp2YWx1ZXMg
YW5kIGludm9raW5nIHNwb29reSBhY3Rpb24uIENvbm5lY3RvcnMgaGF2ZSBhIHR5cGUgWzFdLCBz
bwppdCdzIGVhc3kgdG8gZmlsdGVyIFdCIGNvbm5lY3RvcnMgb3V0IG9mIHRoZSBsb29wLgoKWzFd
IGUuZy4gRFJNX01PREVfQ09OTkVDVE9SX1dSSVRFQkFDSyBpbiB0aGlzIGNhc2UuCgo+ID4gPiAg
CWtjcnRjLT53Yl9jb25uID0ga3diX2Nvbm47Cj4gPiA+ICAKPiA+ID4gIAlyZXR1cm4gMDsKPiAK
CgotLSAKTWloYWlsCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
