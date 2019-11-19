Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F20A3101DA9
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 09:35:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29FFE6EA96;
	Tue, 19 Nov 2019 08:35:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60069.outbound.protection.outlook.com [40.107.6.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70FFA6EC91
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2019 08:35:04 +0000 (UTC)
Received: from VI1PR08CA0095.eurprd08.prod.outlook.com (2603:10a6:800:d3::21)
 by VI1PR0802MB2526.eurprd08.prod.outlook.com (2603:10a6:800:b5::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.22; Tue, 19 Nov
 2019 08:34:55 +0000
Received: from DB5EUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::208) by VI1PR08CA0095.outlook.office365.com
 (2603:10a6:800:d3::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.23 via Frontend
 Transport; Tue, 19 Nov 2019 08:34:45 +0000
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT040.mail.protection.outlook.com (10.152.20.243) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.23 via Frontend Transport; Tue, 19 Nov 2019 08:34:45 +0000
Received: ("Tessian outbound 081de437afc7:v33");
 Tue, 19 Nov 2019 08:34:44 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d72b29b253ac5b59
X-CR-MTA-TID: 64aa7808
Received: from a618b3432fe4.2 (cr-mta-lb-1.cr-mta-net [104.47.10.51])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D8EE5520-68A9-4A7A-9530-85BCDF4B7B4B.1; 
 Tue, 19 Nov 2019 08:34:39 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2051.outbound.protection.outlook.com [104.47.10.51])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a618b3432fe4.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 19 Nov 2019 08:34:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lz6Y9xXMC/lQ/8B8H+YT9FaqDOXBBSRoJgkwpJ0aFmaMFx3XmKyeio+3oIu0qSVi02iXgELZAQqd0TYhBIfLmK34+lAfmrfGSMD9cCiIamMEKJ6p6Yo7LhQXF65rWdQWT65Q0NaSwvPHLvlRfxtFJ4dHl9Ca/SHQNZTAgJxX1CDsi6m4JJukjved48uznxfY8gS3J71EFMZdd7j7plXA7+48AQMqomNlQvKSOiDvxPx1bHPCmfR//6/Cvbvabv4oGylgtfXhDZLNz11j/WITctVt3lJvIOXWGKCQD6Wa/Wey6H6t2Z4ZndaaQciO0Z+3CLBFQT9LeA7La+9BZAW1qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UWIehMdMve7N0izP75wIaaQ2gW7/Ez/kbnbps4sNWpA=;
 b=NYVEYrillZtZBvDW60o/HBA9EDHQORbQcfW/97yJg6RUd+hqaJzzWaLZ6qL4SV67tHLt0SplAXS9TlYbFsrjjjb08+AT/qHQErm1WgU8DxuiWbdZoSTAmUItQhpwhvh6K3ICZe51wXERuA5k0oJW7+8YyIYM8kFEMmvsD8BGxYIZBf8caMyJnyMpWsOPFWGfVHvtkI/SOyWrCW374tL6yKBZmW993jZl5qxRIPSaagLYtkvYJ9axuG1CKC7rZnC8gMIZDFwHFsyFMtWLpcQlg+9WtC5PHe1q/XHHwvvFqhiePw2GlIOXLg9MWVWFv48pykMAYyQF0SaZ/VSLJmCJOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4797.eurprd08.prod.outlook.com (10.255.112.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.27; Tue, 19 Nov 2019 08:34:36 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a809:417a:faf3:61a7]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a809:417a:faf3:61a7%6]) with mapi id 15.20.2451.031; Tue, 19 Nov 2019
 08:34:36 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCHv2 3/4] drm/komeda: use afbc helpers
Thread-Topic: [PATCHv2 3/4] drm/komeda: use afbc helpers
Thread-Index: AQHVk1z8xHY+gDfYy0i/iDKbshedr6eBdzAAgAbusQCAAKGHAIAA7isAgACLqoCABhZeAIAALTMAgAF8yYA=
Date: Tue, 19 Nov 2019 08:34:36 +0000
Message-ID: <20191119083429.GA2881@jamwan02-TSP300>
References: <2485717.1SzL54aMiy@e123338-lin>
 <20191104221228.3588-1-andrzej.p@collabora.com>
 <20191104221228.3588-4-andrzej.p@collabora.com>
 <20191108160954.GA17321@arm.com> <20191113020146.GB2746@jamwan02-TSP300>
 <20191113113954.GN23790@phenom.ffwll.local>
 <20191114015220.GA16456@jamwan02-TSP300>
 <CAKMK7uH06iu9OTz-1ZTbv6oVBHtBojSQE6sUu1GWfWk1om8LQQ@mail.gmail.com>
 <20191118070949.GA27075@jamwan02-TSP300>
 <20191118095136.GC23790@phenom.ffwll.local>
In-Reply-To: <20191118095136.GC23790@phenom.ffwll.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR0302CA0003.apcprd03.prod.outlook.com
 (2603:1096:202::13) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 990b3309-531f-483e-9c1a-08d76ccb54e7
X-MS-TrafficTypeDiagnostic: VE1PR08MB4797:|VE1PR08MB4797:|VI1PR0802MB2526:
X-MS-Exchange-PUrlCount: 1
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0802MB252662EA5255AB51F015F351B34C0@VI1PR0802MB2526.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
x-forefront-prvs: 022649CC2C
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(396003)(136003)(346002)(376002)(39860400002)(366004)(53754006)(189003)(199004)(6246003)(6512007)(6306002)(66066001)(76176011)(52116002)(9686003)(6916009)(478600001)(81156014)(58126008)(33656002)(25786009)(6116002)(4326008)(8676002)(14454004)(316002)(587094005)(99286004)(6486002)(1076003)(3846002)(14444005)(256004)(6436002)(30864003)(102836004)(5660300002)(7416002)(66446008)(7736002)(86362001)(64756008)(66556008)(66476007)(26005)(55236004)(6506007)(54906003)(386003)(53546011)(186003)(229853002)(2906002)(8936002)(966005)(81166006)(446003)(71200400001)(71190400001)(305945005)(486006)(33716001)(66946007)(11346002)(476003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4797;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 4DqEdtp0d00M/gKXofgIw/bRkmfLjQ8/tRZlfLSE8VSNg2D0RjNxbahlNqOgr02jY/1ujJXjoDoLL8doSDH0EuFvz9zNX0Pbi6c48XH1nYhUAem0aN8Jv1jXuVWPlhZV5LkxqpS49QrPquaxtDmAgqQcz7DLsYTBJICp7RZPDWd1lsat4a9FQ5CvDKKDPt0Gk670Ai+unkJTroXZCp2rP+Ht+OW2gt9xPwuIiIu5IUj7ARqjrXb2gopz/HyJ6OrWU7N5RT9kokxlXx7iuUMoXqhpoCmHjs3fWOLMRUV+B7o7TBSi8xPbwCGV/hgoveGyM6Np8KWABxFbGD4NSv3i0aGgEEbIVqu43+hSuNfiwJwvJ2d5iEO409y5CMptEnyTzM86pimg63l1vpPzCtZywCeSBC3d/eGk5QYiIxNrnC7Y+V7FIyfSSCYVk3ekFeHN1DYx3cAMq5Vsj9w2JdKcCxSO+gsYiAH9v0kuqkyL1dU=
Content-ID: <205D95BD016D564090D9ED0429C1BAF5@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4797
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(136003)(39860400002)(396003)(376002)(346002)(1110001)(339900001)(189003)(53754006)(199004)(126002)(11346002)(446003)(6862004)(336012)(6512007)(76130400001)(476003)(33716001)(6246003)(70586007)(70206006)(30864003)(14444005)(4326008)(6306002)(9686003)(76176011)(50466002)(5660300002)(486006)(14454004)(6506007)(8936002)(26826003)(26005)(186003)(478600001)(53546011)(25786009)(386003)(8676002)(102836004)(99286004)(2906002)(81166006)(81156014)(6486002)(229853002)(305945005)(7736002)(58126008)(966005)(8746002)(54906003)(33656002)(86362001)(587094005)(316002)(105606002)(22756006)(47776003)(23756003)(1076003)(66066001)(356004)(3846002)(6116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0802MB2526;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Fail; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 4e754c4c-246a-49b6-6421-08d76ccb4f1f
NoDisclaimer: True
X-Forefront-PRVS: 022649CC2C
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lTKE0Y6aqutyVBurrajrKX3FgmymJt/sab2w2Zzn/I/slOr598Drw2A3th8YsdWKXHTtlNFQjPQu+VAleJsl/mzD9V61Id+46v0CoTth8S6wpoTP5YlosYu1KQM7311schjrjRlT42TmWj4WCtEz64J/M6e1o3HGHHMnACyTMqTwQmDn+iE6NNHsbN0ZvEY6Nszx1NTvI2Eu4uZStwxksGW9trnXTK1gNIEtVYsnuv2btVqEWqYgA/tEnHvcw2Yi6Zk1j9tlmNuWtc8R9Ek/XgCv29FSsOK7XQxBbuxa0aXqdAwvl+JFKoCqDGNPoywBgJIw0RxnSYQy4uK5keoBofUPt+KA2VU3lpm949Z23pqvy56Mg6MloGIFeb/Uo2dvv7pNzsZ76iiZuM99lgQilvEpfStHolfJO9jqndS30/u0LvWPORkZUUOQsOSpLryUe8g7I7Gv9fdS0BWjdNFM9b8VPX2OvkaO1qES/sH2vUk=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2019 08:34:45.3929 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 990b3309-531f-483e-9c1a-08d76ccb54e7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2526
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UWIehMdMve7N0izP75wIaaQ2gW7/Ez/kbnbps4sNWpA=;
 b=7IG0Jb+ph/2kLbFhwSXYeD/NqjJgzoFJSPPTDQeFn3tah7FTQCx3Uxy8dQtWOdawNAmb1cNay1WhP+DK4v/IvfUCaN63d6HHNSN+EvReKec9fpbYv5a8GlW8tEl+88o2DUaantiA9g9Ayj5uJUpGHC3kLptox2r5nMy0P+09YTM=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UWIehMdMve7N0izP75wIaaQ2gW7/Ez/kbnbps4sNWpA=;
 b=7IG0Jb+ph/2kLbFhwSXYeD/NqjJgzoFJSPPTDQeFn3tah7FTQCx3Uxy8dQtWOdawNAmb1cNay1WhP+DK4v/IvfUCaN63d6HHNSN+EvReKec9fpbYv5a8GlW8tEl+88o2DUaantiA9g9Ayj5uJUpGHC3kLptox2r5nMy0P+09YTM=
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

T24gTW9uLCBOb3YgMTgsIDIwMTkgYXQgMTA6NTE6MzZBTSArMDEwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBNb24sIE5vdiAxOCwgMjAxOSBhdCAwNzowOTo1NkFNICswMDAwLCBqYW1lcyBx
aWFuIHdhbmcgKEFybSBUZWNobm9sb2d5IENoaW5hKSB3cm90ZToKPiA+IE9uIFRodSwgTm92IDE0
LCAyMDE5IGF0IDExOjEyOjEzQU0gKzAxMDAsIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gPiA+IE9u
IFRodSwgTm92IDE0LCAyMDE5IGF0IDI6NTIgQU0gamFtZXMgcWlhbiB3YW5nIChBcm0gVGVjaG5v
bG9neSBDaGluYSkKPiA+ID4gPGphbWVzLnFpYW4ud2FuZ0Bhcm0uY29tPiB3cm90ZToKPiA+ID4g
PiBPbiBXZWQsIE5vdiAxMywgMjAxOSBhdCAxMjozOTo1NFBNICswMTAwLCBEYW5pZWwgVmV0dGVy
IHdyb3RlOgo+ID4gPiA+ID4gT24gV2VkLCBOb3YgMTMsIDIwMTkgYXQgMDI6MDE6NTNBTSArMDAw
MCwgamFtZXMgcWlhbiB3YW5nIChBcm0gVGVjaG5vbG9neSBDaGluYSkgd3JvdGU6Cj4gPiA+ID4g
PiA+IE9uIEZyaSwgTm92IDA4LCAyMDE5IGF0IDA0OjA5OjU0UE0gKzAwMDAsIEF5YW4gSGFsZGVy
IHdyb3RlOgo+ID4gPiA+ID4gPiA+IE9uIE1vbiwgTm92IDA0LCAyMDE5IGF0IDExOjEyOjI3UE0g
KzAxMDAsIEFuZHJ6ZWogUGlldHJhc2lld2ljeiB3cm90ZToKPiA+ID4gPiA+ID4gPiA+IFRoZXJl
IGFyZSBhZmJjIGhlbHBlcnMgYXZhaWxhYmxlLgo+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4g
PiA+IFNpZ25lZC1vZmYtYnk6IEFuZHJ6ZWogUGlldHJhc2lld2ljeiA8YW5kcnplai5wQGNvbGxh
Ym9yYS5jb20+Cj4gPiA+ID4gPiA+ID4gPiAtLS0KPiA+ID4gPiA+ID4gPiA+ICAuLi4vYXJtL2Rp
c3BsYXkva29tZWRhL2tvbWVkYV9mb3JtYXRfY2Fwcy5oICAgfCAgMSAtCj4gPiA+ID4gPiA+ID4g
PiAgLi4uL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZnJhbWVidWZmZXIuYyAgIHwgNDQgKysr
KysrKy0tLS0tLS0tLS0tLQo+ID4gPiA+ID4gPiA+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMTcgaW5z
ZXJ0aW9ucygrKSwgMjggZGVsZXRpb25zKC0pCj4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRh
X2Zvcm1hdF9jYXBzLmggYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVk
YV9mb3JtYXRfY2Fwcy5oCj4gPiA+ID4gPiA+ID4gPiBpbmRleCAzMjI3M2NmMThmN2MuLjYwN2Vl
YTgwZTYwYyAxMDA2NDQKPiA+ID4gPiA+ID4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0v
ZGlzcGxheS9rb21lZGEva29tZWRhX2Zvcm1hdF9jYXBzLmgKPiA+ID4gPiA+ID4gPiA+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Zvcm1hdF9jYXBzLmgK
PiA+ID4gPiA+ID4gPiA+IEBAIC0zMyw3ICszMyw2IEBACj4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+
ID4gPiA+ID4gICNkZWZpbmUgQUZCQ19USF9MQVlPVVRfQUxJR05NRU5UICAgICAgIDgKPiA+ID4g
PiA+ID4gPiA+ICAjZGVmaW5lIEFGQkNfSEVBREVSX1NJWkUgICAgICAgICAgICAgICAxNgo+ID4g
PiA+ID4gPiA+ID4gLSNkZWZpbmUgQUZCQ19TVVBFUkJMS19BTElHTk1FTlQgICAgICAgICAgICAg
ICAgMTI4Cj4gPiA+ID4gPiA+ID4gPiAgI2RlZmluZSBBRkJDX1NVUEVSQkxLX1BJWEVMUyAgICAg
ICAgICAgMjU2Cj4gPiA+ID4gPiA+ID4gPiAgI2RlZmluZSBBRkJDX0JPRFlfU1RBUlRfQUxJR05N
RU5UICAgICAgMTAyNAo+ID4gPiA+ID4gPiA+ID4gICNkZWZpbmUgQUZCQ19USF9CT0RZX1NUQVJU
X0FMSUdOTUVOVCAgIDQwOTYKPiA+ID4gPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9mcmFtZWJ1ZmZlci5jIGIvZHJpdmVycy9n
cHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZnJhbWVidWZmZXIuYwo+ID4gPiA+ID4g
PiA+ID4gaW5kZXggMWIwMWE2MjVmNDBlLi5lOWM4NzU1MWE1YjggMTAwNjQ0Cj4gPiA+ID4gPiA+
ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9mcmFt
ZWJ1ZmZlci5jCj4gPiA+ID4gPiA+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3Bs
YXkva29tZWRhL2tvbWVkYV9mcmFtZWJ1ZmZlci5jCj4gPiA+ID4gPiA+ID4gPiBAQCAtNCw2ICs0
LDcgQEAKPiA+ID4gPiA+ID4gPiA+ICAgKiBBdXRob3I6IEphbWVzLlFpYW4uV2FuZyA8amFtZXMu
cWlhbi53YW5nQGFybS5jb20+Cj4gPiA+ID4gPiA+ID4gPiAgICoKPiA+ID4gPiA+ID4gPiA+ICAg
Ki8KPiA+ID4gPiA+ID4gPiA+ICsjaW5jbHVkZSA8ZHJtL2RybV9hZmJjLmg+Cj4gPiA+ID4gPiA+
ID4gPiAgI2luY2x1ZGUgPGRybS9kcm1fZGV2aWNlLmg+Cj4gPiA+ID4gPiA+ID4gPiAgI2luY2x1
ZGUgPGRybS9kcm1fZmJfY21hX2hlbHBlci5oPgo+ID4gPiA+ID4gPiA+ID4gICNpbmNsdWRlIDxk
cm0vZHJtX2dlbS5oPgo+ID4gPiA+ID4gPiA+ID4gQEAgLTQzLDggKzQ0LDcgQEAga29tZWRhX2Zi
X2FmYmNfc2l6ZV9jaGVjayhzdHJ1Y3Qga29tZWRhX2ZiICprZmIsIHN0cnVjdCBkcm1fZmlsZSAq
ZmlsZSwKPiA+ID4gPiA+ID4gPiA+ICAgICAgICAgc3RydWN0IGRybV9mcmFtZWJ1ZmZlciAqZmIg
PSAma2ZiLT5iYXNlOwo+ID4gPiA+ID4gPiA+ID4gICAgICAgICBjb25zdCBzdHJ1Y3QgZHJtX2Zv
cm1hdF9pbmZvICppbmZvID0gZmItPmZvcm1hdDsKPiA+ID4gPiA+ID4gPiA+ICAgICAgICAgc3Ry
dWN0IGRybV9nZW1fb2JqZWN0ICpvYmo7Cj4gPiA+ID4gPiA+ID4gPiAtICAgICAgIHUzMiBhbGln
bm1lbnRfdyA9IDAsIGFsaWdubWVudF9oID0gMCwgYWxpZ25tZW50X2hlYWRlciwgbl9ibG9ja3Ms
IGJwcDsKPiA+ID4gPiA+ID4gPiA+IC0gICAgICAgdTY0IG1pbl9zaXplOwo+ID4gPiA+ID4gPiA+
ID4gKyAgICAgICB1MzIgYWxpZ25tZW50X3cgPSAwLCBhbGlnbm1lbnRfaCA9IDAsIGFsaWdubWVu
dF9oZWFkZXIsIGJwcDsKPiA+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiAgICAgICAgIG9i
aiA9IGRybV9nZW1fb2JqZWN0X2xvb2t1cChmaWxlLCBtb2RlX2NtZC0+aGFuZGxlc1swXSk7Cj4g
PiA+ID4gPiA+ID4gPiAgICAgICAgIGlmICghb2JqKSB7Cj4gPiA+ID4gPiA+ID4gPiBAQCAtNTIs
MTkgKzUyLDE1IEBAIGtvbWVkYV9mYl9hZmJjX3NpemVfY2hlY2soc3RydWN0IGtvbWVkYV9mYiAq
a2ZiLCBzdHJ1Y3QgZHJtX2ZpbGUgKmZpbGUsCj4gPiA+ID4gPiA+ID4gPiAgICAgICAgICAgICAg
ICAgcmV0dXJuIC1FTk9FTlQ7Cj4gPiA+ID4gPiA+ID4gPiAgICAgICAgIH0KPiA+ID4gPiA+ID4g
PiA+Cj4gPiA+ID4gPiA+ID4gPiAtICAgICAgIHN3aXRjaCAoZmItPm1vZGlmaWVyICYgQUZCQ19G
T1JNQVRfTU9EX0JMT0NLX1NJWkVfTUFTSykgewo+ID4gPiA+ID4gPiA+ID4gLSAgICAgICBjYXNl
IEFGQkNfRk9STUFUX01PRF9CTE9DS19TSVpFXzMyeDg6Cj4gPiA+ID4gPiA+ID4gPiAtICAgICAg
ICAgICAgICAgYWxpZ25tZW50X3cgPSAzMjsKPiA+ID4gPiA+ID4gPiA+IC0gICAgICAgICAgICAg
ICBhbGlnbm1lbnRfaCA9IDg7Cj4gPiA+ID4gPiA+ID4gPiAtICAgICAgICAgICAgICAgYnJlYWs7
Cj4gPiA+ID4gPiA+ID4gPiAtICAgICAgIGNhc2UgQUZCQ19GT1JNQVRfTU9EX0JMT0NLX1NJWkVf
MTZ4MTY6Cj4gPiA+ID4gPiA+ID4gPiAtICAgICAgICAgICAgICAgYWxpZ25tZW50X3cgPSAxNjsK
PiA+ID4gPiA+ID4gPiA+IC0gICAgICAgICAgICAgICBhbGlnbm1lbnRfaCA9IDE2Owo+ID4gPiA+
ID4gPiA+ID4gLSAgICAgICAgICAgICAgIGJyZWFrOwo+ID4gPiA+ID4gPiA+ID4gLSAgICAgICBk
ZWZhdWx0Ogo+ID4gPiA+ID4gPiA+ID4gLSAgICAgICAgICAgICAgIFdBUk4oMSwgIkludmFsaWQg
QUZCQ19GT1JNQVRfTU9EX0JMT0NLX1NJWkU6ICVsbGQuXG4iLAo+ID4gPiA+ID4gPiA+ID4gLSAg
ICAgICAgICAgICAgICAgICAgZmItPm1vZGlmaWVyICYgQUZCQ19GT1JNQVRfTU9EX0JMT0NLX1NJ
WkVfTUFTSyk7Cj4gPiA+ID4gPiA+ID4gPiAtICAgICAgICAgICAgICAgYnJlYWs7Cj4gPiA+ID4g
PiA+ID4gPiArICAgICAgIGlmICghZHJtX2FmYmNfZ2V0X3N1cGVyYmxrX3doKGZiLT5tb2RpZmll
ciwgJmFsaWdubWVudF93LCAmYWxpZ25tZW50X2gpKQo+ID4gPiA+ID4gPiA+ID4gKyAgICAgICAg
ICAgICAgIHJldHVybiAtRUlOVkFMOwo+ID4gPiA+ID4gPiA+ID4gKwo+ID4gPiA+ID4gPiA+ID4g
KyAgICAgICBpZiAoKGFsaWdubWVudF93ICE9IDE2IHx8IGFsaWdubWVudF9oICE9IDE2KSAmJgo+
ID4gPiA+ID4gPiA+ID4gKyAgICAgICAgICAgKGFsaWdubWVudF93ICE9IDMyIHx8IGFsaWdubWVu
dF9oICE9IDgpKSB7Cj4gPiA+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAgRFJNX0RFQlVHX0tN
UygiVW5zdXBwb3J0ZWQgYWZiYyB0aWxlIHcvaCBbJWQvJWRdXG4iLAo+ID4gPiA+ID4gPiA+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYWxpZ25tZW50X3csIGFsaWdubWVudF9oKTsK
PiA+ID4gPiA+ID4gPiA+ICsKPiA+ID4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICByZXR1cm4g
LUVJTlZBTDsKPiA+ID4gPiA+ID4gPiBUbyBiZSBob25lc3QsIHRoZSBwcmV2aW91cyBjb2RlIGxv
b2tzIG11Y2ggbW9yZSByZWFkYWJsZQo+ID4gPiA+ID4gPiA+ID4gICAgICAgICB9Cj4gPiA+ID4g
PiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gICAgICAgICAvKiB0aWxlZCBoZWFkZXIgYWZiYyAqLwo+
ID4gPiA+ID4gPiA+ID4gQEAgLTg0LDIwICs4MCwxNCBAQCBrb21lZGFfZmJfYWZiY19zaXplX2No
ZWNrKHN0cnVjdCBrb21lZGFfZmIgKmtmYiwgc3RydWN0IGRybV9maWxlICpmaWxlLAo+ID4gPiA+
ID4gPiA+ID4gICAgICAgICAgICAgICAgIGdvdG8gY2hlY2tfZmFpbGVkOwo+ID4gPiA+ID4gPiA+
ID4gICAgICAgICB9Cj4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gLSAgICAgICBuX2Js
b2NrcyA9IChrZmItPmFsaWduZWRfdyAqIGtmYi0+YWxpZ25lZF9oKSAvIEFGQkNfU1VQRVJCTEtf
UElYRUxTOwo+ID4gPiA+ID4gPiA+ID4gLSAgICAgICBrZmItPm9mZnNldF9wYXlsb2FkID0gQUxJ
R04obl9ibG9ja3MgKiBBRkJDX0hFQURFUl9TSVpFLAo+ID4gPiA+ID4gPiA+ID4gLSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgYWxpZ25tZW50X2hlYWRlcik7Cj4gPiA+ID4gPiA+
ID4gPiAtCj4gPiA+ID4gPiA+ID4gPiAgICAgICAgIGJwcCA9IGtvbWVkYV9nZXRfYWZiY19mb3Jt
YXRfYnBwKGluZm8sIGZiLT5tb2RpZmllcik7Cj4gPiA+ID4gPiA+ID4gPiAtICAgICAgIGtmYi0+
YWZiY19zaXplID0ga2ZiLT5vZmZzZXRfcGF5bG9hZCArIG5fYmxvY2tzICoKPiA+ID4gPiA+ID4g
PiA+IC0gICAgICAgICAgICAgICAgICAgICAgICBBTElHTihicHAgKiBBRkJDX1NVUEVSQkxLX1BJ
WEVMUyAvIDgsCj4gPiA+ID4gPiA+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
QUZCQ19TVVBFUkJMS19BTElHTk1FTlQpOwo+ID4gPiA+ID4gPiA+ID4gLSAgICAgICBtaW5fc2l6
ZSA9IGtmYi0+YWZiY19zaXplICsgZmItPm9mZnNldHNbMF07Cj4gPiA+ID4gPiA+ID4gPiAtICAg
ICAgIGlmIChtaW5fc2l6ZSA+IG9iai0+c2l6ZSkgewo+ID4gPiA+ID4gPiA+ID4gLSAgICAgICAg
ICAgICAgIERSTV9ERUJVR19LTVMoImFmYmMgc2l6ZSBjaGVjayBmYWlsZWQsIG9ial9zaXplOiAw
eCV6eC4gbWluX3NpemUgMHglbGx4LlxuIiwKPiA+ID4gPiA+ID4gPiA+IC0gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIG9iai0+c2l6ZSwgbWluX3NpemUpOwo+ID4gPiA+ID4gPiA+IFdlIG5l
ZWQga2ZiLT5vZmZzZXRfcGF5bG9hZCBhbmQga2ZiLT5hZmJjX3NpemUgdG8gc2V0IHNvbWUgcmVn
aXN0ZXJzCj4gPiA+ID4gPiA+ID4gaW4gZDcxX2xheWVyX3VwZGF0ZSgpLiBBdCB0aGlzIG1vbWVu
dCBJIGZlZWwgbGlrZSBwdW5jaGluZyBteXNlbGYgZm9yCj4gPiA+ID4gPiA+ID4gbWFraW5nIHRo
ZSBzdWdnZXN0aW9uIHRvIGNvbnNpZGVyIGFic3RyYWN0aW5nIHNvbWUgb2YgdGhlIGtvbWVkYSdz
IGFmYmMKPiA+ID4gPiA+ID4gPiBjaGVja3MuIFRvIG1lIGl0IGRvZXMgbm90IGxvb2sgbGlrZSBr
b21lZGEoaW4gdGhlIGN1cnJlbnQgc2hhcGUpIGNhbiB0YWtlCj4gPiA+ID4gPiA+ID4gbXVjaCBh
ZHZhbnRhZ2Ugb2YgdGhlIGdlbmVyaWMgX2FmYmNfZmJfY2hlY2soKSBmdW5jdGlvbiAoYXMgd2Fz
IHN1Z2dlc3RlZAo+ID4gPiA+ID4gPiA+IHByZXZpb3VzbHkgYnkgRGFudmV0KS4KPiA+ID4gPiA+
ID4gPgo+ID4gPiA+ID4gPiA+IEhvd2V2ZXIsIEkgd2lsbCBsZXQgamFtZXMucWlhbi53YW5nQGFy
bS5jb20sCj4gPiA+ID4gPiA+ID4gTWloYWlsLkF0YW5hc3NvdkBhcm0uY29tLCBCZW4uRGF2aXNA
YXJtLmNvbSBjb21tZW50IGhlcmUgdG8gc2VlIGlmCj4gPiA+ID4gPiA+ID4gdGhlcmUgY291bGQg
YmUgYSB3YXkgb2YgYWJzdHJhY3RpbmcgdGhlIGFmYmMgYml0cyBmcm9tIGtvbWVkYS4KPiA+ID4g
PiA+ID4gPgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBIaSBhbGw6Cj4gPiA+ID4gPiA+Cj4gPiA+
ID4gPiA+IFNpbmNlIHRoZSBjdXJyZW50IGdlbmVyaWMgZHJtX2FmYmMgaGVscGVycyBvbmx5IHN1
cHBvcnQgYWZiY18xLjEsIGJ1dAo+ID4gPiA+ID4gPiBrb21lZGEgbmVlZHMgc3VwcG9ydCBib3Ro
IGFmYmMxLjEvMS4yLCBzbyBJIHRoaW5rIHdlIGNhbjoKPiA+ID4gPiA+ID4gLSBBZGQgYWZiYzEu
MiBzdXBwb3J0IHRvIGRybSBhZmJjIGhlbHBlcnMuCj4gPiA+ID4gPiA+IC0gZm9yIHRoZSBhZmJj
X3BheWxvYWRfb2Zmc2V0LCBjYW4gd2UgYWRkIHRoaXMgbWVtYmVyIHRvCj4gPiA+ID4gPiA+ICAg
ZHJtX2ZyYW1lYnVmZmVyID8KPiA+ID4gPiA+ID4gLSBUaGUgYWxpZ25lZF93L2ggYXJlIGltcG9y
dGFudCBmb3IgYWZiYywgc28gY2FuIHdlIGhhdmUgdGhlbSBpbgo+ID4gPiA+ID4gPiAgIGRybV9m
cmFtZWJ1ZmZlciA/Cj4gPiA+ID4gPgo+ID4gPiA+ID4gSG93IGV4cGVuc2l2ZSBpcyBpdCB0byBy
ZWNvbXB1dGUgdGhlc2UgZnJvbSBhIHN0cnVjdCBkcm1fZnJhbWVidWZmZXI/Cj4gPiA+ID4gPgo+
ID4gPiA+ID4gSSdkIGp1c3QgZ28gd2l0aCBvbmUgZnVuY3Rpb24gd2hpY2ggY29tcHV0ZXMgYWxs
IHRoZXNlIGRlcml2ZWQgdmFsdWVzLCBhbmQKPiA+ID4gPiA+IHN0dWZmcyB0aGVtIGludG8gYSBz
dHJ1Y3QgZHJtX2FmYmMuIFRoZW4gZHJpdmVycyBjYWxsIHRoYXQgb25jZSBvciBzby4KPiA+ID4g
PiA+Cj4gPiA+ID4KPiA+ID4gPiBBIHN0cnVjdCBkcm1fYWZiYywgZ29vZCBpZGVhLCBJIGxpa2Ug
aXQuIDotKQo+ID4gPiA+Cj4gPiA+ID4gYW5kIHdlIGNhbiBjb21wdXRlIGl0IHdoZW4gZG8gdGhl
IGFmYmMgc2l6ZSBjaGVjayBsaWtlCj4gPiA+ID4KPiA+ID4gPiAgIGRybV9hZmJjX2NoZWNrX2Zi
X3NpemUoLi4uLCAma29tZWRhX2ZiLT5kcm1fYWZiYyk7Cj4gPiA+IAo+ID4gPiBEaXNjdXNzZWQg
dGhpcyBhbHNvIHdpdGggQW5kcnplaiBvbiBpcmMgb24gd2hlcmUgZXhhY3RseSB0byBwbGFjZQo+
ID4gPiBzdHVmZi4gSSB0aGluayBpZGVhbGx5IHdlJ2QgYmUgYWJsZSB0byBnZXQgcmlkIG9mIHRo
ZSBjdXN0b20KPiA+ID4gbWFsaWRwX2ZiX2NyZWF0ZSBjb21wbGV0ZWx5LCBhbmQga29tZWRhIHNo
b3VsZCBhbHNvIGJlIGFibGUgdG8gZ2V0IHJpZAo+ID4gPiBvZiBtb3N0IG9mIHRoZSBvcGVuLWNv
ZGVkIGNoZWNrcyAoaXQncyBsYXJnZWx5IHJlaW52ZXRpbmcKPiA+ID4gZHJtX2dlbV9mYl9jcmVh
dGVfd2l0aF9mdW5jcywgaW1vIGJldHRlciB0byBqdXN0IGNhbGwgdGhhdCBmaXJzdCwgdGhlbgo+
ID4gPiB0aGVuIGRvIGEgZmV3IG1vcmUgY2FsbHMgb2YgdGhlIHNwZWNpZmljIHRoaW5ncyB5b3Ug
bmVlZCB0byBoYXZlCj4gPiA+IGNvbXB1dGVkIGluIGFkZGl0aW9uKS4KPiA+ID4gLURhbmllbAo+
ID4gCj4gPiBUaGUgYWZiYyBzdXBwb3J0IGlzIHRoZSBvbmx5IHJlYXNvbiB3aHkgbWFsaWRwL2tv
bWVkYSBkZWZpbmUgb3VyIG93bgo+ID4gZmJfY3JlYXRlKCksIGl0IGlzIGdvb2QgZm9yIGtvbWVk
YSBhbmQgbWFsaWRwIGlmIHdlIHB1dCBhZmJjIHN1cHBvcnQKPiA+IGRpcmVjdGx5IGludG8gdGhl
IHN0YW5kYXJkIGRybV9nZW1fZmJfY3JlYXRlX3dpdGhfZnVuY3MuCj4gPiAKPiA+IEJUVzoKPiA+
IAo+ID4gY2FuIHdlIGFkZCBvbmUgbW9yZSBhcmd1bWVudDogZmJfc3RydWN0X3NpemUgdG8KPiA+
IAo+ID4gICBkcm1fZ2VtX2ZiX2NyZWF0ZV93aXRoX2Z1bmNzKC4uLiwgc2l6ZV90IGZiX3N0cnVj
dF9zaXplKTsKPiA+IAo+ID4gdGhlbiBkcml2ZXIgY2FuIHVzZSBpdCB0byBleHRlbmQgaXRzIG93
biBmYiBzdHJ1Y3QgYW5kIGFkZCBzb21lIHByaXZhdGUKPiA+IGluZm9zLgo+IAo+IEhtLCB0aGlz
IGlzbid0IGhvdyB3ZSB1c3VhbGx5IGRvIGl0IGZvciBzdWJjbGFzc2luZyAtIHRoZSB0cm91Ymxl
IHdpdGgKPiB0aGlzIGlzIHRoYXQgdGhlIHNpemUgb2YgdGhlIGFsbG9jYXRpb24gaXMgdmVyeSBm
YXIgYXdheSBmcm9tIHdoZXJlIHdlCj4gYWN0dWFsbHkgYWxsb2NhdGUsIGF1dG9tYXRlZCBjaGVj
a2VycyBoYXZlIGEgaGFyZGVyIHRpbWUgd2l0aCB0aGlzCj4gcGF0dGVybi4KPiAKPiBVc3VhbGx5
IHdoYXQgd2UgZG8gaXMgc3BsaXQgdGhlIGt6YWxsb2Mgb3V0IGZyb20gdGhlIF9jcmVhdGUgZnVu
Y3Rpb24sCj4gbGVhdmluZyBqdXN0IF9pbml0IGJlaGluZC4gVGhlbiB5b3UgaGF2ZSByb3VnaGx5
IChwc2V1ZG8tY29kZSk6Cj4gCj4gCWRybV9nZW1fZmJfY3JlYXRlX3dpdGhfZnVuY3MoYXJncykg
ewo+IAkJc3RydWN0IGRybV9nZW1fZmIgKmZiOwo+IAo+IAkJZmIgPSBremFsbG9jKHNpemVvZigq
ZmIpKTsKPiAJCWlmICghZmIpCj4gCQkJcmV0dXJuIC1FTk9NRU07Cj4gCj4gCQlyZXR1cm4gZHJt
X2dlbV9mYl9pbml0X3dpdGhfZnVuY3Rpb25zKGZiLCBhcmdzKTsKPiAJfQo+IAo+IElmIHlvdSB0
aGVuIG5lZWQgYSBiaWdnZXIgZnVuY3Rpb24sIHlvdSBqdXN0IGFsbG9jYXRlIHRoYXQgYmlnZ2Vy
Cj4gZnVuY3Rpb24sIGFuZCBwYXNzICZmYi0+YmFzZSB0byB0aGUgX2luaXQgZnVuY3Rpb24uIENv
c3RzIDMgYWRkaXRpb25hbAo+IGxpbmVzIChmb3IgdGhlIGt6YWxsb2MgYW5kIGVycm9yIGNoZWNr
aW5nKSwgYnV0IGVhc2llciB0byByZWFkJnZlcmlmeSBmb3IKPiBib3RoIGh1bWFucyBhbmQgY29t
cGlsZXJzLgo+IAo+IEkgZ3Vlc3Mgd2hhdCB3ZSBjb3VsZCB0aGVuIGRvIGlzIGNyZWF0ZSBhIGRy
bV9nZW1fYWZiY19jcmVhdGUgZnVuY3Rpb24KPiB3aGljaCBzZXRzIHRoaXMgYWxsIHVwIGZvciBh
Cj4gCj4gc3RydWN0IGRybV9nZW1fYWZiY19mcmFtZWJ1ZmZlciB7Cj4gCXN0cnVjdCBkcm1fZ2Vt
X2ZyYW1lYnVmZmVyIGJhc2U7Cj4gCS8qIGFmYmMgc3R1ZmYgKi8KPiB9Owo+IAo+IGFuZCB0aGVu
IGFsc28gZmlsbHMgb3V0IGFsbCBkZXJpdmVkIGFmYmMgdmFsdWVzLCBzbyBtb3JlIHRoYW4ganVz
dAo+IGNhbGxpbmcgZHJtX2dlbV9mYl9pbml0X3dpdGhfZnVuY3Rpb25zLiBBbmQgZHJpdmVycyBj
b3VsZCBzdGlsbCBoYXZlIHRoZWlyCj4gb3duIHZlcnNpb24gd2l0aCBldmVuIG1vcmUgY2hlY2tz
IG9uIHRvcC4KPiAKPiBBbmQgYWxsIGFmYmMgc3VwcG9ydGluZyBkcml2ZXJzIGNvdWxkIHRoZW4g
dXNlIHRoYXQuIEZlZWxzIGEgYml0IGxpa2UKPiBvdmVyZW5naW5lZXJpbmcgdG8gbWUsIGJ1dCBp
ZiB5b3UgZmVlbCBsaWtlIHRoYXQncyBqdXN0aWZpZWQgdG8gZG8gaXQncyBhCj4gZ29vZCBzb2x1
dGlvbi4KCkhpIERhbmllbDoKClRoaXMgc29sdXRpb24gbG9va3MgZ29vZCwgaXQgY2FuIGZpdCBh
bGwgb3VyIHJlcXVpcmVtZW50LgoKVGhhbmtzCkphbWVzLgoKPiBDaGVlcnMsIERhbmllbAo+ID4g
Cj4gPiBUaGFua3MKPiA+IEphbWVzCj4gPiA+ID4KPiA+ID4gPiBUaGFua3MuCj4gPiA+ID4gSmFt
ZXMKPiA+ID4gPgo+ID4gPiA+ID4gRm9yIHJld29ya2luZyBkcm1fZnJhbWVidWZmZXIgaXRzZWxm
IEkgdGhpbmsgaXQncyBwcm9iYWJseSBhIGJpdCB0b28KPiA+ID4gPiA+IGVhcmxpZXIuIEFuZCBp
ZiB3ZSBkbyBpdCwgd2Ugc2hvdWxkIG1heWJlIGdvIGEgYml0IG1vcmUgYm9sZCwgYWltaW5nIHRv
Cj4gPiA+ID4gPiBwcm9wZXJ0eS1meSBhbGwgdGhlIGZyYW1lYnVmZmVyIHNldHRpbmdzLCBtYXli
ZSBldmVuIG1ha2luZyBpdCBleHRlbnNpYmxlLAo+ID4gPiA+ID4gYW5kIGhhdmUgZHJpdmVycyBo
YW5kbGUgYSBjb3JyZXNwb25kaW5nIGRybV9mcmFtZWJ1ZmZlcl9zdGF0ZS4KPiA+ID4gPiA+Cj4g
PiA+ID4gPiBBIHRoaXJkIG9wdGlvbiB3b3VsZCBiZSB0byBjcmVhdGUgYSBkcm1fYWZiY19mcmFt
ZWJ1ZmZlciB3aGljaCBlbWJlZHMKPiA+ID4gPiA+IGRybV9mcmFtZWJ1ZmZlciBhbmQgd2hpY2gg
ZHJpdmVycyB3b3VsZCBuZWVkIHRvIHVzZS4gQnV0IGFsc28gZmVlbHMgYSBiaXQKPiA+ID4gPiA+
IGxpa2UgdG9vIG11Y2ggY2h1cm4uIFJlY29tcHV0aW5nIHNob3VsZCBiZSBxdWljayBlbm91Z2gg
YW5kIG11Y2ggZWFzaWVyLgo+ID4gPiA+ID4gLURhbmllbAo+ID4gPiA+ID4KPiA+ID4gPiA+ID4K
PiA+ID4gPiA+ID4gVGhhbmtzCj4gPiA+ID4gPiA+IEphbWVzCj4gPiA+ID4gPiA+Cj4gPiA+ID4g
PiA+ID4gVGhhbmtzIGFueXdheXMgZm9yIHRha2luZyBhIHN0YWIgYXQgdGhpcy4KPiA+ID4gPiA+
ID4gPiAtQXlhbgo+ID4gPiA+ID4gPiA+ID4gKwo+ID4gPiA+ID4gPiA+ID4gKyAgICAgICBpZiAo
IWRybV9hZmJjX2NoZWNrX2ZiX3NpemUobW9kZV9jbWQtPnBpdGNoZXNbMF0sIGJwcCwKPiA+ID4g
PiA+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG1vZGVfY21kLT53
aWR0aCwgbW9kZV9jbWQtPmhlaWdodCwKPiA+ID4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGFsaWdubWVudF93LCBhbGlnbm1lbnRfaCwKPiA+ID4gPiA+ID4g
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG9iai0+c2l6ZSwgbW9kZV9j
bWQtPm9mZnNldHNbMF0sCj4gPiA+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBBRkJDX1NVUEVSQkxLX0FMSUdOTUVOVCkpCj4gPiA+ID4gPiA+ID4gPiAgICAg
ICAgICAgICAgICAgZ290byBjaGVja19mYWlsZWQ7Cj4gPiA+ID4gPiA+ID4gPiAtICAgICAgIH0K
PiA+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiAgICAgICAgIGZiLT5vYmpbMF0gPSBvYmo7
Cj4gPiA+ID4gPiA+ID4gPiAgICAgICAgIHJldHVybiAwOwo+ID4gPiA+ID4gPiA+ID4gLS0KPiA+
ID4gPiA+ID4gPiA+IDIuMTcuMQo+ID4gPiA+ID4KPiA+ID4gPiA+IC0tCj4gPiA+ID4gPiBEYW5p
ZWwgVmV0dGVyCj4gPiA+ID4gPiBTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24K
PiA+ID4gPiA+IGh0dHA6Ly9ibG9nLmZmd2xsLmNoCj4gPiA+IAo+ID4gPiAKPiA+ID4gCj4gPiA+
IC0tIAo+ID4gPiBEYW5pZWwgVmV0dGVyCj4gPiA+IFNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBD
b3Jwb3JhdGlvbgo+ID4gPiArNDEgKDApIDc5IDM2NSA1NyA0OCAtIGh0dHA6Ly9ibG9nLmZmd2xs
LmNoCj4gCj4gLS0gCj4gRGFuaWVsIFZldHRlcgo+IFNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBD
b3Jwb3JhdGlvbgo+IGh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
