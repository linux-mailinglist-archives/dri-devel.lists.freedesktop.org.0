Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6CB4E29CC
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 07:21:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CC806E0CB;
	Thu, 24 Oct 2019 05:21:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70055.outbound.protection.outlook.com [40.107.7.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AE1F6E0CB
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 05:21:19 +0000 (UTC)
Received: from VI1PR08CA0121.eurprd08.prod.outlook.com (2603:10a6:800:d4::23)
 by VI1PR08MB3469.eurprd08.prod.outlook.com (2603:10a6:803:8a::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.23; Thu, 24 Oct
 2019 05:21:15 +0000
Received: from VE1EUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::200) by VI1PR08CA0121.outlook.office365.com
 (2603:10a6:800:d4::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2387.20 via Frontend
 Transport; Thu, 24 Oct 2019 05:21:15 +0000
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT010.mail.protection.outlook.com (10.152.18.113) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.23 via Frontend Transport; Thu, 24 Oct 2019 05:21:15 +0000
Received: ("Tessian outbound 081de437afc7:v33");
 Thu, 24 Oct 2019 05:21:14 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f63c213de579eb30
X-CR-MTA-TID: 64aa7808
Received: from e4f631f63c0f.2 (cr-mta-lb-1.cr-mta-net [104.47.12.56])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 40DC934D-6DB4-436F-88D0-D4552F8FA2D9.1; 
 Thu, 24 Oct 2019 05:21:08 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2056.outbound.protection.outlook.com [104.47.12.56])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e4f631f63c0f.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 24 Oct 2019 05:21:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H2dMKLj+qzwUHG6gJUFlIIinFENvR0UhiYn5Nkpre9Wm+qqkewjrYP9BFM12ZddtZr3Zd9Pa3BhR4l/fspKckxv2JfHGq0jUE88u7WK7OQNdYtYFPjS4r1vkS2QkD43L0OX2+L5DEmXSin6hQ0RKA0bWXxsbu2wHBdRzk9sj+4D3+43cRC3PJZ8TamZuCiieHp3zqaJivZ4t8JJcnUkZrhml9rzmxgE2nyHdDL+n6Tm1RQhxfVrndPN36ETocsKnSxBr2Du+fH4KxbiOl9mQczZrP+aYHquXxQKamysKTROP5vCuLmfVD1HqMyC5RCbn0vJCs+Z+knT4LK1iPbpgQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s5hAq8j8gBTK5QHkgFUl8QaQUjx95tk8DvfgDASyVRo=;
 b=eV/lqCPTPV9iR2Xcsp0bFYBiIIfT4xmWHOmr7IplnQuBXsvnXE9CHxfvfrP7XIRM8h+Cly5btxClVmdReMaqluSoZ48/ADmexy2ihKrYWQljX3bm5zH20fR8lLQGTqpO2+RPBMMZjRJbHyKJvzTHwYjBy3Z1p7nSSy9bZD1UMPFh1oxQIwraSmhR7/9tp5bFMf8AXF+R5K/E49LjG/FoET72ftw1NALlIagPeLCaHSmoq6o79XADtr9cxZA3oG7foTMb5VQHAYBTUbBqwe8SXbhasgW/JjlVUZ3y+JOMMnfxDKHwRVW0IFdTHLsVXsNryF2MDo1mRT3vMWLNu9I+Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB5021.eurprd08.prod.outlook.com (20.179.30.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.22; Thu, 24 Oct 2019 05:21:07 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5%3]) with mapi id 15.20.2367.022; Thu, 24 Oct 2019
 05:21:07 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [RFC,3/3] drm/komeda: Allow non-component drm_bridge only
 endpoints
Thread-Topic: [RFC,3/3] drm/komeda: Allow non-component drm_bridge only
 endpoints
Thread-Index: AQHVfmX7+sBzYHhR8EiYyRUjNjETp6dddmWAgAAIg4CAALRsAIAAV3gAgAAhhoCAAAegAIAADuyAgAephQCAAAHAAIAAAKMAgALqEYA=
Date: Thu, 24 Oct 2019 05:21:07 +0000
Message-ID: <20191024052059.GA10569@jamwan02-TSP300>
References: <5390495.Gzyn2rW8Nj@e123338-lin>
 <20191016162206.u2yo37rtqwou4oep@DESKTOP-E1NTVVP.localdomain>
 <20191017030752.GA3109@jamwan02-TSP300>
 <20191017082043.bpiuvfr3r4jngxtu@DESKTOP-E1NTVVP.localdomain>
 <20191017102055.GA8308@jamwan02-TSP300>
 <20191017104812.6qpuzoh5bx5i2y3m@DESKTOP-E1NTVVP.localdomain>
 <20191017114137.GC25745@shell.armlinux.org.uk>
 <20191022084210.GX11828@phenom.ffwll.local>
 <20191022084826.GP25745@shell.armlinux.org.uk>
 <CAKMK7uHZ1Lw03LhZVH=oAa92WxZXucqooH1w6SG8HG20+g0Rbg@mail.gmail.com>
In-Reply-To: <CAKMK7uHZ1Lw03LhZVH=oAa92WxZXucqooH1w6SG8HG20+g0Rbg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR06CA0012.apcprd06.prod.outlook.com
 (2603:1096:202:2e::24) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a6101a23-b15f-46a5-cecf-08d75841fe34
X-MS-TrafficTypeDiagnostic: VE1PR08MB5021:|VE1PR08MB5021:|VI1PR08MB3469:
X-MS-Exchange-PUrlCount: 3
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VI1PR08MB34695DA7AA0CB8F533964BB1B36A0@VI1PR08MB3469.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
x-forefront-prvs: 0200DDA8BE
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(346002)(366004)(376002)(396003)(39860400002)(136003)(51444003)(189003)(199004)(66946007)(14454004)(66446008)(71190400001)(71200400001)(966005)(66556008)(478600001)(33716001)(66066001)(6512007)(9686003)(4326008)(6246003)(6306002)(58126008)(66476007)(64756008)(7736002)(33656002)(229853002)(6436002)(6486002)(1076003)(6916009)(316002)(54906003)(11346002)(476003)(386003)(5660300002)(8676002)(446003)(26005)(76176011)(99286004)(52116002)(55236004)(86362001)(305945005)(186003)(53546011)(6506007)(8936002)(81156014)(81166006)(102836004)(6116002)(2906002)(3846002)(486006)(25786009)(256004)(14444005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB5021;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: Sh3+K1nlKjCbWws09ySN648Ungv04Hg1ynviINxi4gHic3TGbQVORS7+gOTTjuruA/IDT/6IDv3+IyrQEh85briQuhOOtyB3xEAzB61bS/I27gx7xVRmD3vcjLJ/rzEa5Zyb4Rfymg8sYNwIPE9gzKG5TM3StP5G91tgXmVU6T8880wKuBQP18m0fPx2V/JuVKoTq3893u6Y8xLWyzhfTdhreVPRgKNWzqTC/I2xIAeT3lAVN3S+1P1MUuSv988hDdXPUZNg/qegJOI27z/INEFa+TmOs1YLqEgeyM/urui1fs74QbcPztovHkJwWogAheYYVnjoklpWzznSXUcRlQO20DLFvmOTazjm6ElirCs22+1sM7ByEw01p67RmMHBxS11cG0SJUZE+d8CQsPFQax+nDog4jAAhHVmagLHk/IyKemjRrK6+qXtBoJLfJXXNNz1AiWRqE10XvmsTztSRqtxAjOYfE5QpCrGdXe+k6Y=
Content-ID: <DBA8E8164B6F85479ADE603C071C51F4@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5021
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(346002)(376002)(136003)(39860400002)(396003)(1110001)(339900001)(189003)(199004)(51444003)(5660300002)(6486002)(336012)(99286004)(386003)(7736002)(316002)(6506007)(36906005)(476003)(446003)(966005)(50466002)(33716001)(126002)(11346002)(486006)(8676002)(81156014)(105606002)(356004)(33656002)(186003)(14454004)(47776003)(81166006)(14444005)(26826003)(58126008)(478600001)(1076003)(8746002)(25786009)(22756006)(305945005)(76176011)(229853002)(3846002)(76130400001)(8936002)(70586007)(54906003)(26005)(53546011)(86362001)(6512007)(2906002)(9686003)(66066001)(23726003)(6116002)(6306002)(70206006)(6246003)(46406003)(97756001)(4326008)(6862004)(107886003)(102836004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3469;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Fail; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 6552a1e0-83c7-4371-c146-08d75841f8ed
NoDisclaimer: True
X-Forefront-PRVS: 0200DDA8BE
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pzxwmJVUFZzoDpElJX++CxA8hm393R30OTf7WmYYJ1mBVDnZtZL/C72layx1dBRMV3pJ419kDszSwCCPGdofJdww95IB4SGTfqgAo03d6tNyAQXPnSxQqPxP4mn/5wrMSfTxWqag7f58nSqAEleTqyndMnz54Piqg5ZLv86lLZ5QzoyMvAw+Fdv0hcy+7TLd7N7me1bv/TAtioo4zAPJS+3l0VKbgwYNLkXxUv8yh+jdk+bjhZKjcM1jjW1aObd4hLL8IutXvEPkLMY9Jt3d9vuJGtr6WRLfpf68oiQ/K+Bez4OM/6tI0ADVvhqt2ovObcTNYwIn2eOBXUEgcUCa4mEfW1cPh97obmXtAMJZuhH3uAPtqc9gctb9SR7BREisQ44pE0H3mqsTZFi3xuqCoUkFhTw3ROzINbAylLptsFPaO5ZMc8SPIGPTtOdO70epFnOfqN0fgYFqLmwPtcTFFQ==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2019 05:21:15.6085 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a6101a23-b15f-46a5-cecf-08d75841fe34
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3469
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s5hAq8j8gBTK5QHkgFUl8QaQUjx95tk8DvfgDASyVRo=;
 b=icJlli+guT/kB0ZNsYRIxzwoj3s7wuiLHgJs37jMKdFGfiG5eh9rOZs1jAvsTlF4XVoaSvQ9oVa6Qi8UYeUnZaLnX9YdNPcVZ6Xo4O1s0giWIpVp0jOFp961ZY/9CwYydABm+bIeHV7OdhTFJRs6YJY116uDnFENhbM53rB5SR0=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s5hAq8j8gBTK5QHkgFUl8QaQUjx95tk8DvfgDASyVRo=;
 b=icJlli+guT/kB0ZNsYRIxzwoj3s7wuiLHgJs37jMKdFGfiG5eh9rOZs1jAvsTlF4XVoaSvQ9oVa6Qi8UYeUnZaLnX9YdNPcVZ6Xo4O1s0giWIpVp0jOFp961ZY/9CwYydABm+bIeHV7OdhTFJRs6YJY116uDnFENhbM53rB5SR0=
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
Cc: Mihail Atanassov <Mihail.Atanassov@arm.com>,
 David Airlie <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Russell King - ARM Linux admin <linux@armlinux.org.uk>, nd <nd@arm.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgMjIsIDIwMTkgYXQgMTA6NTA6NDJBTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBUdWUsIE9jdCAyMiwgMjAxOSBhdCAxMDo0OCBBTSBSdXNzZWxsIEtpbmcgLSBB
Uk0gTGludXggYWRtaW4KPiA8bGludXhAYXJtbGludXgub3JnLnVrPiB3cm90ZToKPiA+Cj4gPiBP
biBUdWUsIE9jdCAyMiwgMjAxOSBhdCAxMDo0MjoxMEFNICswMjAwLCBEYW5pZWwgVmV0dGVyIHdy
b3RlOgo+ID4gPiBPbiBUaHUsIE9jdCAxNywgMjAxOSBhdCAxMjo0MTozN1BNICswMTAwLCBSdXNz
ZWxsIEtpbmcgLSBBUk0gTGludXggYWRtaW4gd3JvdGU6Cj4gPiA+ID4gT24gVGh1LCBPY3QgMTcs
IDIwMTkgYXQgMTA6NDg6MTJBTSArMDAwMCwgQnJpYW4gU3RhcmtleSB3cm90ZToKPiA+ID4gPiA+
IE9uIFRodSwgT2N0IDE3LCAyMDE5IGF0IDEwOjIxOjAzQU0gKzAwMDAsIGphbWVzIHFpYW4gd2Fu
ZyAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIHdyb3RlOgo+ID4gPiA+ID4gPiBPbiBUaHUsIE9jdCAx
NywgMjAxOSBhdCAwODoyMDo1NkFNICswMDAwLCBCcmlhbiBTdGFya2V5IHdyb3RlOgo+ID4gPiA+
ID4gPiA+IE9uIFRodSwgT2N0IDE3LCAyMDE5IGF0IDAzOjA3OjU5QU0gKzAwMDAsIGphbWVzIHFp
YW4gd2FuZyAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIHdyb3RlOgo+ID4gPiA+ID4gPiA+ID4gT24g
V2VkLCBPY3QgMTYsIDIwMTkgYXQgMDQ6MjI6MDdQTSArMDAwMCwgQnJpYW4gU3RhcmtleSB3cm90
ZToKPiA+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+ID4gSWYgSmFtZXMgaXMgc3Ryb25n
bHkgYWdhaW5zdCBtZXJnaW5nIHRoaXMsIG1heWJlIHdlIGp1c3Qgc3dhcAo+ID4gPiA+ID4gPiA+
ID4gPiB3aG9sZXNhbGUgdG8gYnJpZGdlPyBCdXQgZm9yIG1lLCB0aGUgcHJhZ21hdGljIGFwcHJv
YWNoIHdvdWxkIGJlIHRoaXMKPiA+ID4gPiA+ID4gPiA+ID4gc3RvcC1nYXAuCj4gPiA+ID4gPiA+
ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gVGhpcyBpcyBhIGdvb2QgaWRl
YSwgYW5kIEkgdm90ZSArVUxPTkdfTUFYIDopCj4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+
ID4gYW5kIEkgYWxzbyBjaGVja2VkIHRkYTk5OHggZHJpdmVyLCBpdCBzdXBwb3J0cyBicmlkZ2Uu
IHNvIHN3YXAgdGhlCj4gPiA+ID4gPiA+ID4gPiB3aG9sZXNhbGUgdG8gYnJpZ2UgaXMgcGVyZmVj
dC4gOikKPiA+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiBXZWxsLCBh
cyBNaWhhaWwgd3JvdGUsIGl0J3MgZGVmaW5pdGVseSBub3QgcGVyZmVjdC4KPiA+ID4gPiA+ID4g
Pgo+ID4gPiA+ID4gPiA+IFRvZGF5LCBpZiB5b3Ugcm1tb2QgdGRhOTk4eCB3aXRoIHRoZSBEUFUg
ZHJpdmVyIHN0aWxsIGxvYWRlZCwKPiA+ID4gPiA+ID4gPiBldmVyeXRoaW5nIHdpbGwgYmUgdW5i
b3VuZCBncmFjZWZ1bGx5Lgo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gSWYgd2Ugc3dhcCB0
byBicmlkZ2UsIHRoZW4gcm1tb2QnaW5nIHRkYTk5OHggKG9yIGFueSBvdGhlciBicmlkZ2UKPiA+
ID4gPiA+ID4gPiBkcml2ZXIgdGhlIERQVSBpcyB1c2luZykgd2l0aCB0aGUgRFBVIGRyaXZlciBz
dGlsbCBsb2FkZWQgd2lsbCByZXN1bHQKPiA+ID4gPiA+ID4gPiBpbiBhIGNyYXNoLgo+ID4gPiA+
ID4gPgo+ID4gPiA+ID4gPiBJIGhhdmVuJ3QgcmVhZCB0aGUgYnJpZGdlIGNvZGUsIGJ1dCBzZWVt
cyB0aGlzIGlzIGEgYnVnIG9mIGRybV9icmlkZ2UsCj4gPiA+ID4gPiA+IHNpbmNlIGlmIHRoZSBi
cmlkZ2UgaXMgc3RpbGwgaW4gdXNpbmcgYnkgb3RoZXJzLCB0aGUgcm1tb2Qgc2hvdWxkIGZhaWwK
PiA+ID4gPiA+ID4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBDb3JyZWN0LCBidXQgdGhlcmUncyBubyBm
aXggZm9yIHRoYXQgdG9kYXkuIFlvdSBjYW4gYWxzbyB0YWtlIGEgbG9vawo+ID4gPiA+ID4gYXQg
dGhlIHRocmVhZCBsaW5rZWQgZnJvbSBNaWhhaWwncyBjb3ZlciBsZXR0ZXIuCj4gPiA+ID4gPgo+
ID4gPiA+ID4gPiBBbmQgcGVyc29uYWxseSBvcGluaW9uLCBpZiB0aGUgYnJpZGdlIGRvZXNuJ3Qg
aGFuZGxlIHRoZSBkZXBlbmRlbmNlLgo+ID4gPiA+ID4gPiBmb3IgdXM6Cj4gPiA+ID4gPiA+Cj4g
PiA+ID4gPiA+IC0gYWRkIHN1Y2ggc3VwcG9ydCB0byBicmlkZ2UKPiA+ID4gPiA+Cj4gPiA+ID4g
PiBUaGF0IHdvdWxkIGNlcnRhaW5seSBiZSBoZWxwZnVsLiBJIGRvbid0IGtub3cgaWYgdGhlcmUn
cyBjb25zZW5zdXMgb24KPiA+ID4gPiA+IGhvdyB0byBkbyB0aGF0Lgo+ID4gPiA+ID4KPiA+ID4g
PiA+ID4gICBvcgo+ID4gPiA+ID4gPiAtIGp1c3QgZG8gdGhlIGluc21vZC9ybW1vZCBpbiBjb3Jy
ZWN0IG9yZGVyLgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+IFNvLCB0aGVyZSByZWFsbHkgYXJl
IHByb3BlciBiZW5lZml0cyB0byBzdGlja2luZyB3aXRoIHRoZSBjb21wb25lbnQKPiA+ID4gPiA+
ID4gPiBjb2RlIGZvciB0ZGE5OTh4LCB3aGljaCBpcyB3aHkgSSdkIGxpa2UgdG8gdW5kZXJzdGFu
ZCB3aHkgeW91J3JlIHNvCj4gPiA+ID4gPiA+ID4gYWdhaW5zdCB0aGlzIHBhdGNoPwo+ID4gPiA+
ID4gPiA+Cj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IFRoaXMgY2hhbmdlIGhhbmRsZXMgdHdvIGRp
ZmZlcmVudCBjb25uZWN0b3JzIGluIGtvbWVkYSBpbnRlcm5hbGx5LCBjb21wYXJlCj4gPiA+ID4g
PiA+IHdpdGggb25lIGludGVyZmFjZSwgaXQgaW5jcmVhc2VzIHRoZSBjb21wbGV4aXR5LCBtb3Jl
IHJpc2sgb2YgYnVnIGFuZCBtb3JlCj4gPiA+ID4gPiA+IGNvc3Qgb2YgbWFpbnRhaW5hbmNlLgo+
ID4gPiA+ID4gPgo+ID4gPiA+ID4KPiA+ID4gPiA+IFdlbGwsIGl0J3Mgb25seSBhYm91dCBob3cg
dG8gYmluZCB0aGUgZHJpdmVycyAtIHR3byBkaWZmZXJlbnQgbWV0aG9kcwo+ID4gPiA+ID4gb2Yg
YmluZGluZywgbm90IHR3byBkaWZmZXJlbnQgY29ubmVjdG9ycy4gSSB3b3VsZCBhcmd1ZSB0aGF0
IGNhcnJ5aW5nCj4gPiA+ID4gPiBvdXIgb3V0LW9mLXRyZWUgcGF0Y2hlcyB0byBzdXBwb3J0IGJv
dGggcGxhdGZvcm1zIGlzIGEgbGFyZ2VyCj4gPiA+ID4gPiBtYWludGVuYW5jZSBidXJkZW4uCj4g
PiA+ID4gPgo+ID4gPiA+ID4gSG9uZXN0bHkgdGhpcyBsb29rcyBsaWtlIGEgd2luLXdpbiB0byBt
ZS4gV2UgZ2V0IHRoZSBzdXBlcmlvciBhcHByb2FjaAo+ID4gPiA+ID4gd2hlbiBpdHMgc3VwcG9y
dGVkLCBhbmQgc3RpbGwgZ2V0IHRvIHN1cHBvcnQgYnJpZGdlcyB3aGljaCBhcmUgbW9yZQo+ID4g
PiA+ID4gY29tbW9uLgo+ID4gPiA+ID4KPiA+ID4gPiA+IEFzL3doZW4gaW1wcm92ZW1lbnRzIGFy
ZSBtYWRlIHRvIHRoZSBicmlkZ2UgY29kZSB3ZSBjYW4gcmVtb3ZlIHRoZQo+ID4gPiA+ID4gY29t
cG9uZW50IGJpdHMgYW5kIG5vdCBsb3NlIGFueXRoaW5nLgo+ID4gPiA+Cj4gPiA+ID4gVGhlcmUg
d2FzIGFuIGlkZWEgYSB3aGlsZSBiYWNrIGFib3V0IHVzaW5nIHRoZSBkZXZpY2UgbGlua3MgY29k
ZSB0bwo+ID4gPiA+IHNvbHZlIHRoZSBicmlkZ2UgaXNzdWUgLSBidXQgYXQgdGhlIHRpbWUgdGhl
IGRldmljZSBsaW5rcyBjb2RlIHdhc24ndAo+ID4gPiA+IHVwIHRvIHRoZSBqb2IuICBJIHRoaW5r
IHRoYXQncyBiZWVuIHJlc29sdmVkIG5vdywgYnV0IEkgaGF2ZW4ndCBiZWVuCj4gPiA+ID4gYWJs
ZSB0byBjb25maXJtIGl0LiAgSSBkaWQgcHJvcG9zZSBzb21lIHBhdGNoZXMgZm9yIGJyaWRnZSBh
dCB0aGUKPiA+ID4gPiB0aW1lIGJ1dCB0aGV5IHByb2JhYmx5IG5lZWQgdXBkYXRpbmcuCj4gPiA+
Cj4gPiA+IEkgdGhpbmsgdGhlIG9ubHkgcGF0Y2hlcyB0aGF0IGV4aXN0ZWQgd2hlcmUgZm9yIHBh
bmVsLCBhbmQgd2Ugb25seQo+ID4gPiBkaXNjdXNzZWQgdGhlIGJyaWRnZSBjYXNlLiBBdCBsZWFz
dCBJIGNhbiBvbmx5IGZpbmQgcGF0Y2hlcyBmb3IgcGFuZWwsbm90Cj4gPiA+IGJyaWRnZSwgYnV0
IG1pZ2h0IGJlIG1pc3Npbmcgc29tZXRoaW5nLgo+ID4KPiA+IEkgaGFkIGEgcGF0Y2hlcywgd2hp
Y2ggaXMgd2h5IEkgcmFpc2VkIHRoZSBwcm9ibGVtIHdpdGggdGhlIGNvcmU6Cj4gPgo+ID4gNjk2
MWVkZmVlMjZkIGJyaWRnZSBoYWNrcyB1c2luZyBkZXZpY2UgbGlua3MKPiA+Cj4gPiBidXQgaXQg
bmV2ZXIgd2VudCBmdXJ0aGVyIHRoYW4gYW4gZXhwZXJpbWVudCBhdCB0aGUgdGltZSBiZWNhdXNl
IG9mIHRoZQo+ID4gcHJvYmxlbXMgaW4gdGhlIGNvcmUuICBBcyBpdCB3YXMgYSBoYWNrLCBpdCBu
ZXZlciBnb3QgcG9zdGVkLiAgU2VlbXMKPiA+IHRoYXQga2VybmVsIHRyZWUgKGZvciB0aGUgY3Vi
b3gpIGlzIHN0aWxsIDUuMiBiYXNlZCwgc28gaGFzIGEgbG90IG9mCj4gPiBwYXRjaGVzIGFuZCBt
aWdodCBuZWVkIHVwZGF0aW5nIHRvIGEgbW9yZSByZWNlbnQgYmFzZSBiZWZvcmUgYW55dGhpbmcK
PiA+IGNhbiBiZSB0ZXN0ZWQuCj4gCj4gCj4gRm9yIHJlZmVyZW5jZSwgdGhlIHBhbmVsIHBhdGNo
Ogo+IAo+IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTAzNjQ4NzMvCj4gCj4g
QW5kIHRoZSBodWdlIGRpc2N1c3Npb24gYXJvdW5kIGJyaWRnZXMsIHRoYXQgcmVzdWx0ZWQgaW4g
UmFmYWVsCj4gV3l6b2NraSBmaXhpbmcgYWxsIHRoZSBjb3JlIGlzc3VlczoKPiAKPiBodHRwczov
L3d3dy5zcGluaWNzLm5ldC9saXN0cy9kcmktZGV2ZWwvbXNnMjAxOTI3Lmh0bWwKPiAKPiBKYW1l
cywgZG8geW91IHdhbnQgdG8gbG9vayBpbnRvIHRoaXMgZm9yIGJyaWRnZXM/Cj4gCgpIaSBEYW5p
ZWw6CgpJdCdzIG15IGhvbm91ci4gYnV0IEkgZG9uJ3QgaGF2ZSBtdWNoIHRpbWUgaW4gdGhlIG5l
eHQgMyB3ZWVrcy4KCkFuZCBJIHRhbGtlZCB3aXRoIE1paGFpbCwgaGUgd2lsbCBoZWxwIHRvIGNo
ZWNrIHRoaXMgcHJvYmxlbS4KClRoYW5rcwpKYW1lcy4KPiBDaGVlcnMsIERhbmllbAo+IC0tIAo+
IERhbmllbCBWZXR0ZXIKPiBTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KPiAr
NDEgKDApIDc5IDM2NSA1NyA0OCAtIGh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
