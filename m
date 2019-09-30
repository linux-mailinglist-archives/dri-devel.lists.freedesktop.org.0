Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 930A5C1E77
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2019 11:51:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 338D26E22D;
	Mon, 30 Sep 2019 09:51:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60086.outbound.protection.outlook.com [40.107.6.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04FF56E22D
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2019 09:51:50 +0000 (UTC)
Received: from VI1PR08CA0177.eurprd08.prod.outlook.com (2603:10a6:800:d1::31)
 by VI1PR08MB4189.eurprd08.prod.outlook.com (2603:10a6:803:eb::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.17; Mon, 30 Sep
 2019 09:51:46 +0000
Received: from AM5EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::204) by VI1PR08CA0177.outlook.office365.com
 (2603:10a6:800:d1::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2305.20 via Frontend
 Transport; Mon, 30 Sep 2019 09:51:46 +0000
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT034.mail.protection.outlook.com (10.152.16.81) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Mon, 30 Sep 2019 09:51:46 +0000
Received: ("Tessian outbound 081de437afc7:v33");
 Mon, 30 Sep 2019 09:51:43 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: acb176955efe3b9f
X-CR-MTA-TID: 64aa7808
Received: from 44bb75865738.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.10.53]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1DADCC40-96D0-463B-B9E6-A0F05B3826FE.1; 
 Mon, 30 Sep 2019 09:51:37 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2053.outbound.protection.outlook.com [104.47.10.53])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 44bb75865738.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Mon, 30 Sep 2019 09:51:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UhhEunOwIzmKRruMDAScDX6Cq2YW0AvO7HkAILs/ZRs/flbewlMd1vHnYcPZROZliDJjIRtreq5HvPOmDtjasgAi50QDE+RCWtYnyGgHViY1mJGkdzWIEQbau4n/oDWi9SqZqbcz9yZ/bXBuqURaHkDeb+/8sMIDXR0QucKdfJvJMJINojcRVLVVFtSZTt2OypUs8inKkYRFn49tOBKhYO6frjBz4vXEX+XPC2P6B6IRvCQCX6GCj+iEix5aeBDL2/5bB2FCBPohIDP6dhQ6UNH0kCQ5nJG5HCvEYy8Vknz8G/glpsSxVhRMBcvtW33jkuk4kI+91owBJ4NERt4r9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CPhTPf5jouzaxkU6CmT9g5wBKpSBXBDjVQlZ7MFikbY=;
 b=RZIO8CO509tZIImU6U8B40HvrOJRpdBynzfDPl+0Tgt4pF/fsKH41dh3adGyz17wu0zukmpF4p+sGWwnnRFtUYmZ8DLI3JbmjZxtQICgWfKaZFKLGuwB11JqofNIa3yYVCpuztluBJPnIbWDMhBk+elURt/cg51ZMFwdPxhVsdbN6q7QBrRZCjSMPNveqnlIdsUNnqUkFu0V3O7w+UJ8CqSchBZkhA+xwHMOvBZ/0GkxDWLPEN7Zt81gZenTcDJLzTea0ikpQSW0d0hNSy/4OGXoVA7/3/PEjDmmFCj2CON4L+OwzMraljjzbHbmUCk9PYt448kcvQB5j69UR81qAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from AM6PR08MB3829.eurprd08.prod.outlook.com (20.178.89.14) by
 AM6PR08MB3958.eurprd08.prod.outlook.com (20.179.1.94) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Mon, 30 Sep 2019 09:51:35 +0000
Received: from AM6PR08MB3829.eurprd08.prod.outlook.com
 ([fe80::3d72:3e6c:cb97:8976]) by AM6PR08MB3829.eurprd08.prod.outlook.com
 ([fe80::3d72:3e6c:cb97:8976%7]) with mapi id 15.20.2284.028; Mon, 30 Sep 2019
 09:51:35 +0000
From: Brian Starkey <Brian.Starkey@arm.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [RFC PATCH] drm:- Add a modifier to denote 'protected' framebuffer
Thread-Topic: [RFC PATCH] drm:- Add a modifier to denote 'protected'
 framebuffer
Thread-Index: AQHVZxR6T7KOwVbC3kmqPMMH1PUhIKcv34OAgAA2WICAAAJKAIAAFqWAgBPsVgA=
Date: Mon, 30 Sep 2019 09:51:35 +0000
Message-ID: <20190930095134.xjcucw2rrij5f4np@DESKTOP-E1NTVVP.localdomain>
References: <20190909134241.23297-1-ayan.halder@arm.com>
 <20190917125301.GQ3958@phenom.ffwll.local>
 <20190917160730.hutzlbuqtpmmtdz3@e110455-lin.cambridge.arm.com>
 <11689dc3-6c3e-084b-b66d-e6ccf75cb8fb@baylibre.com>
 <CAKMK7uF7oKV4609Ca4mLj7gYC1rkWnWAV7_hM5Z48Ez1cBoMqA@mail.gmail.com>
In-Reply-To: <CAKMK7uF7oKV4609Ca4mLj7gYC1rkWnWAV7_hM5Z48Ez1cBoMqA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: NeoMutt/20180716-849-147d51-dirty
x-originating-ip: [217.140.106.49]
x-clientproxiedby: LNXP123CA0013.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::25) To AM6PR08MB3829.eurprd08.prod.outlook.com
 (2603:10a6:20b:85::14)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Brian.Starkey@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 06cebfba-02d6-4c52-8fac-08d7458bceb5
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: AM6PR08MB3958:|AM6PR08MB3958:|VI1PR08MB4189:
X-MS-Exchange-PUrlCount: 3
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VI1PR08MB4189712074294DF8E82A2EC0F0820@VI1PR08MB4189.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
x-forefront-prvs: 01762B0D64
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(366004)(396003)(376002)(39860400002)(199004)(189003)(6436002)(6486002)(66066001)(229853002)(2906002)(587094005)(14444005)(44832011)(486006)(446003)(11346002)(5024004)(476003)(58126008)(71190400001)(99286004)(71200400001)(54906003)(26005)(102836004)(186003)(52116002)(53546011)(316002)(386003)(6506007)(76176011)(6116002)(256004)(81156014)(5660300002)(1076003)(66446008)(64756008)(66556008)(66476007)(66946007)(81166006)(9686003)(966005)(6306002)(8676002)(14454004)(3846002)(7736002)(8936002)(305945005)(6246003)(86362001)(6916009)(478600001)(4326008)(6512007)(25786009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB3958;
 H:AM6PR08MB3829.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: smIWcOVoK2yQEq0GmGhAvwXtAPbfKky0Vh6kuDYIWPUBA0pI6X6mnpSsGp22yOVYRSMnL74YMySCAYXevksI3lO9ovJGtNySrKIQ1JEdyfmjYlOXxH9UVBOFoZhwFMbnWQg9pJuOX3JzKpKB/hADk+EhQiK+jEOvEzT+6RGMGL2mBg/T9VC1nUUYUJPkQr2XMlQaWDlI0hiAHNxptMvMIi6xrW7FnKI5PX7YY2bzI+bU1QuCYBkLrk9H+J7AoJE2aknMEguEYetQt2VXEhmO/bjEw+DUEd7hvTAe4GFEG83Tt+qBn4ubqNr0p8WvzWNIPlFT/jn2Xjz4ZQqudSAiEhcNpSer35yVWfs+VXTL05tblXor1/W1TKLIp/G0WPk6nIjjcJdITzR0XMl7A2VQdmzRYi4k9PjhZ8M4ZiQdyl+mFbGMiK3OlCYY4xYlyMvDjVJa76h08LMaoVPILu09KQ==
Content-ID: <6A0EC6A769066D4DB8227B972297CE24@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3958
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Brian.Starkey@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(396003)(376002)(136003)(1110001)(339900001)(189003)(199004)(102836004)(229853002)(6512007)(9686003)(47776003)(86362001)(66066001)(25786009)(6116002)(23726003)(3846002)(2906002)(1076003)(6486002)(186003)(6862004)(50466002)(4326008)(6246003)(54906003)(386003)(6506007)(53546011)(478600001)(26005)(8746002)(81156014)(81166006)(5660300002)(8936002)(8676002)(14454004)(76176011)(6306002)(105606002)(99286004)(305945005)(22756006)(966005)(7736002)(11346002)(316002)(46406003)(36906005)(446003)(14444005)(26826003)(58126008)(70586007)(336012)(587094005)(70206006)(126002)(476003)(76130400001)(486006)(356004)(97756001)(5024004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB4189;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Fail; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 91b96540-ad21-4fee-d5b1-08d7458bc7d6
NoDisclaimer: True
X-Forefront-PRVS: 01762B0D64
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KSzwsSpwx5FrwFSZK1tG9D2OewjDsL8egfobG1zMChYifTZOmIWAPF0LSTLKmocze0ci01rorJq4vESLJPf99g7SvZ8GQvQbS+dJEzD4P2EwmxKyr9Nq4mEUlBDeeg0D9jYpbY6osBWKzXsl4I9JLHrRii9YT0Q/1tl2n2br461iIZPwr4Uem442EZ99k954YJGYReGH0s20N9DqavWZv3UYLe9vEugt32zDyEFuA3/wf/T/p/oJIW1DB8cHUPJygzQCSMdbKJQS5EUkqU+PZMarpLAWH0HmNmu6R3fonrBjrOnbj/FjOuGC9qz6pnFYSe76V2xCKwdsXDTbhPKobKbkbNDwa/K85XXsSiqCB+H1KqHx5tT6qtohjZaRAkclfFf9bjorfMtIYut4PsMAvCgZ33S+2luV/oAtT57FeqlxZlJRcMk4VYw1uUd23yGFPLiWtoYvSXIiEThSFZyF7g==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2019 09:51:46.6289 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 06cebfba-02d6-4c52-8fac-08d7458bceb5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4189
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CPhTPf5jouzaxkU6CmT9g5wBKpSBXBDjVQlZ7MFikbY=;
 b=Ki9rlH4PcN/R7RalZGwcFOyECLZU7FsAqG49jsjNUt7lKcStGFNqApq8wYgu4/GFTpG3MwnpnomT215MxGL8XN9hOn5SvLuNrPpD4f/X92MNkTkfNM7PFF9nTXkhmx8lKcgDWli+re2OgVtPAMNPHyv8crsRAYCNtdruIBTuKVo=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CPhTPf5jouzaxkU6CmT9g5wBKpSBXBDjVQlZ7MFikbY=;
 b=Ki9rlH4PcN/R7RalZGwcFOyECLZU7FsAqG49jsjNUt7lKcStGFNqApq8wYgu4/GFTpG3MwnpnomT215MxGL8XN9hOn5SvLuNrPpD4f/X92MNkTkfNM7PFF9nTXkhmx8lKcgDWli+re2OgVtPAMNPHyv8crsRAYCNtdruIBTuKVo=
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
Cc: nd <nd@arm.com>, Neil Armstrong <narmstrong@baylibre.com>,
 "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>,
 Liviu Dudau <Liviu.Dudau@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "airlied@linux.ie" <airlied@linux.ie>, Ayan Halder <Ayan.Halder@arm.com>,
 "sean@poorly.run" <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiBUdWUsIFNlcCAxNywgMjAxOSBhdCAwNzozNjo0NVBNICswMjAwLCBEYW5pZWwgVmV0
dGVyIHdyb3RlOgo+IE9uIFR1ZSwgU2VwIDE3LCAyMDE5IGF0IDY6MTUgUE0gTmVpbCBBcm1zdHJv
bmcgPG5hcm1zdHJvbmdAYmF5bGlicmUuY29tPiB3cm90ZToKPiA+Cj4gPiBIaSwKPiA+Cj4gPiBP
biAxNy8wOS8yMDE5IDE4OjA3LCBMaXZpdSBEdWRhdSB3cm90ZToKPiA+ID4gT24gVHVlLCBTZXAg
MTcsIDIwMTkgYXQgMDI6NTM6MDFQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3cm90ZToKPiA+ID4+
IE9uIE1vbiwgU2VwIDA5LCAyMDE5IGF0IDAxOjQyOjUzUE0gKzAwMDAsIEF5YW4gSGFsZGVyIHdy
b3RlOgo+ID4gPj4+IEFkZCBhIG1vZGlmaWVyICdEUk1fRk9STUFUX01PRF9BUk1fUFJPVEVDVEVE
JyB3aGljaCBkZW5vdGVzIHRoYXQgdGhlIGZyYW1lYnVmZmVyCj4gPiA+Pj4gaXMgYWxsb2NhdGVk
IGluIGEgcHJvdGVjdGVkIHN5c3RlbSBtZW1vcnkuCj4gPiA+Pj4gRXNzZW50aWFsbHksIHdlIHdh
bnQgdG8gc3VwcG9ydCBFR0xfRVhUX3Byb3RlY3RlZF9jb250ZW50IGluIG91ciBrb21lZGEgZHJp
dmVyLgo+ID4gPj4+Cj4gPiA+Pj4gU2lnbmVkLW9mZi1ieTogQXlhbiBLdW1hciBIYWxkZXIgPGF5
YW4uaGFsZGVyQGFybS5jb20+Cj4gPiA+Pj4KPiA+ID4+PiAvLS0gTm90ZSB0byByZXZpZXdlcgo+
ID4gPj4+IEtvbWVkYSBkcml2ZXIgaXMgY2FwYWJsZSBvZiByZW5kZXJpbmcgRFJNIChEaWdpdGFs
IFJpZ2h0cyBNYW5hZ2VtZW50KSBwcm90ZWN0ZWQKPiA+ID4+PiBjb250ZW50LiBUaGUgRFJNIGNv
bnRlbnQgaXMgc3RvcmVkIGluIGEgZnJhbWVidWZmZXIgYWxsb2NhdGVkIGluIHN5c3RlbSBtZW1v
cnkKPiA+ID4+PiAod2hpY2ggbmVlZHMgc29tZSBzcGVjaWFsIGhhcmR3YXJlIHNpZ25hbHMgZm9y
IGFjY2VzcykuCj4gPiA+Pj4KPiA+ID4+PiBMZXQgdXMgaWdub3JlIGhvdyB0aGUgcHJvdGVjdGVk
IHN5c3RlbSBtZW1vcnkgaXMgYWxsb2NhdGVkIGFuZCBmb3IgdGhlIHNjb3BlIG9mCj4gPiA+Pj4g
dGhpcyBkaXNjdXNzaW9uLCB3ZSB3YW50IHRvIGZpZ3VyZSBvdXQgdGhlIGJlc3Qgd2F5IHBvc3Np
YmxlIGZvciB0aGUgdXNlcnNwYWNlCj4gPiA+Pj4gdG8gY29tbXVuaWNhdGUgdG8gdGhlIGRybSBk
cml2ZXIgdG8gdHVybiB0aGUgcHJvdGVjdGVkIG1vZGUgb24gKGZvciBhY2Nlc3NpbmcgdGhlCj4g
PiA+Pj4gZnJhbWVidWZmZXIgd2l0aCB0aGUgRFJNIGNvbnRlbnQpIG9yIG9mZi4KPiA+ID4+Pgo+
ID4gPj4+IFRoZSBwb3NzaWJsZSB3YXlzIGJ5IHdoaWNoIHRoZSB1c2Vyc3BhY2UgY291bGQgYWNo
aWV2ZSB0aGlzIGlzIHZpYTotCj4gPiA+Pj4KPiA+ID4+PiAxLiBNb2RpZmllcnMgOi0gVGhpcyBs
b29rcyB0byBtZSB0aGUgYmVzdCB3YXkgYnkgd2hpY2ggdGhlIHVzZXJzcGFjZSBjYW4KPiA+ID4+
PiBjb21tdW5pY2F0ZSB0byB0aGUga2VybmVsIHRvIHR1cm4gdGhlIHByb3RlY3RlZCBtb2RlIG9u
IGZvciB0aGUga29tZWRhIGRyaXZlcgo+ID4gPj4+IGFzIGl0IGlzIGdvaW5nIHRvIGFjY2VzcyBv
bmUgb2YgdGhlIHByb3RlY3RlZCBmcmFtZWJ1ZmZlcnMuIFRoZSBvbmx5IHByb2JsZW0gaXMKPiA+
ID4+PiB0aGF0IHRoZSBjdXJyZW50IG1vZGlmaWVycyBkZXNjcmliZSB0aGUgdGlsaW5nL2NvbXBy
ZXNzaW9uIGZvcm1hdC4gSG93ZXZlciwgaXQKPiA+ID4+PiBkb2VzIG5vdCBodXJ0IHRvIGV4dGVu
ZCB0aGUgbWVhbmluZyBvZiBtb2RpZmllcnMgdG8gZGVub3RlIG90aGVyIGF0dHJpYnV0ZXMgb2YK
PiA+ID4+PiB0aGUgZnJhbWVidWZmZXIgYXMgd2VsbC4KPiA+ID4+Pgo+ID4gPj4+IFRoZSBvdGhl
ciByZWFzb24gaXMgdGhhdCBvbiBBbmRyb2lkLCB3ZSBnZXQgYW4gaW5mbyBmcm9tIEdyYWxsb2MK
PiA+ID4+PiAoR1JBTExPQ19VU0FHRV9QUk9URUNURUQpIHdoaWNoIHRlbGxzIHVzIHRoYXQgdGhl
IGJ1ZmZlciBpcyBwcm90ZWN0ZWQuIFRoaXMgY2FuCj4gPiA+Pj4gYmUgdXNlZCB0byBzZXQgdXAg
dGhlIG1vZGlmaWVyL3MgKEFkZEZCMikgZHVyaW5nIGZyYW1lYnVmZmVyIGNyZWF0aW9uLgo+ID4g
Pj4KPiA+ID4+IEhvdyBkb2VzIHRoaXMgbWVzaCB3aXRoIG90aGVyIG1vZGlmaWVycywgbGlrZSBB
RkJDPyBUaGF0J3Mgd2hlcmUgSSBzZWUgdGhlCj4gPiA+PiBpc3N1ZSBoZXJlLgo+ID4gPgo+ID4g
PiBBRkJDIG1vZGlmaWVycyBhcmUgY3VycmVudGx5IHVuZGVyIEFybSdzIG5hbWVzcGFjZSwgdGhl
IHRob3VnaHQgYmVoaW5kIHRoZSBEUk0KPiA+ID4gbW9kaWZpZXJzIHdvdWxkIGJlIHRvIGhhdmUg
aXQgYXMgYSAiZ2VuZXJpYyIgbW9kaWZpZXIuCj4gCj4gQnV0IGlmIGl0J3MgYSBnZW5lcmljIGZs
YWcsIGhvdyBkbyB5b3UgY29tYmluZSB0aGF0IHdpdGggb3RoZXIKPiBtb2RpZmllcnM/IExpa2Ug
aWYgeW91IGhhdmUgYSB0aWxlZCBidWZmZXIsIGJ1dCBhbHNvIGVuY3J5cHRlZD8gT3IKPiBhZmJj
IGNvbXByZXNzZWQsIG9yIHdoYXRldmVyIGVsc2UuIEknZCBleHBlY3QgZm9yIHlvdXIgaHcgZW5j
cnlwdGlvbgo+IGlzIG9ydGhvZ29uYWwgdG8gdGhlIGJ1ZmZlci90aWxpbmcvY29tcHJlc3Npb24g
Zm9ybWF0IHVzZWQ/CgpUaGlzIGJpdCBkb2Vzbid0IG92ZXJsYXAgd2l0aCBhbnkgb2YgdGhlIG90
aGVyIEFGQkMgbW9kaWZpZXJzLCBzbyBhcwp5b3Ugc2F5IGl0J2QgYmUgb3J0aG9nb25hbCwgYW5k
IGNvdWxkIGJlIHNldCBvbiBBRkJDIGJ1ZmZlcnMgKGlmIHdlCndlbnQgdGhhdCByb3V0ZSkuCgo+
IAo+ID4gPj4+IDIuIEZyYW1lYnVmZmVyIGZsYWdzIDotIEFzIG9mIHRvZGF5LCB0aGlzIGNhbiBi
ZSBvbmUgb2YgdGhlIHR3byB2YWx1ZXMKPiA+ID4+PiBpZSAoRFJNX01PREVfRkJfSU5URVJMQUNF
RC9EUk1fTU9ERV9GQl9NT0RJRklFUlMpLiBVbmxpa2UgbW9kaWZpZXJzLCB0aGUgZHJtCj4gPiA+
Pj4gZnJhbWVidWZmZXIgZmxhZ3MgYXJlIGdlbmVyaWMgdG8gdGhlIGRybSBzdWJzeXN0ZW0gYW5k
IGlkZWFsbHkgd2Ugc2hvdWxkIG5vdAo+ID4gPj4+IGludHJvZHVjZSBhbnkgZHJpdmVyIHNwZWNp
ZmljIGNvbnN0cmFpbnQvZmVhdHVyZS4KPiA+ID4+Pgo+ID4gPj4+IDMuIENvbm5lY3RvciBwcm9w
ZXJ0eTotIEkgY291bGQgc2VlIHRoZSBmb2xsb3dpbmcgcHJvcGVydGllcyB1c2VkIGZvciBEUk0K
PiA+ID4+PiBwcm90ZWN0ZWQgY29udGVudDotCj4gPiA+Pj4gRFJNX01PREVfQ09OVEVOVF9QUk9U
RUNUSU9OX0RFU0lSRUQgLyBFTkFCTEVEIDotICJUaGlzIHByb3BlcnR5IGlzIHVzZWQgYnkKPiA+
ID4+PiB1c2Vyc3BhY2UgdG8gcmVxdWVzdCB0aGUga2VybmVsIHByb3RlY3QgZnV0dXJlIGNvbnRl
bnQgY29tbXVuaWNhdGVkIG92ZXIKPiA+ID4+PiB0aGUgbGluayIuIENsZWFybHksIHdlIGFyZSBu
b3QgY29uY2VybmVkIHdpdGggdGhlIHByb3RlY3Rpb24gYXR0cmlidXRlcyBvZiB0aGUKPiA+ID4+
PiB0cmFuc21pdHRlci4gU28sIHdlIGNhbm5vdCB1c2UgdGhpcyBwcm9wZXJ0eSBmb3Igb3VyIGNh
c2UuCj4gPiA+Pj4KPiA+ID4+PiA0LiBEUk0gcGxhbmUgcHJvcGVydHk6LSBBZ2Fpbiwgd2Ugd2Fu
dCB0byBjb21tdW5pY2F0ZSB0aGF0IHRoZSBmcmFtZWJ1ZmZlcih3aGljaAo+ID4gPj4+IGNhbiBi
ZSBhdHRhY2hlZCB0byBhbnkgcGxhbmUpIGlzIHByb3RlY3RlZC4gU28gaW50cm9kdWNpbmcgYSBu
ZXcgcGxhbmUgcHJvcGVydHkKPiA+ID4+PiBkb2VzIG5vdCBoZWxwLgo+ID4gPj4+Cj4gPiA+Pj4g
NS4gRFJNIGNydGMgcHJvcGVydHk6LSBGb3IgdGhlIHNhbWUgcmVhc29uIGFzIGFib3ZlLCBpbnRy
b2R1Y2luZyBhIG5ldyBjcnRjCj4gPiA+Pj4gcHJvcGVydHkgZG9lcyBub3QgaGVscC4KPiA+ID4+
Cj4gPiA+PiA2LiBKdXN0IHRyYWNrIHRoaXMgYXMgcGFydCBvZiBidWZmZXIgYWxsb2NhdGlvbiwg
aS5lLiBJIHRoaW5rIGl0IGRvZXMKPiA+ID4+IG1hdHRlciBob3cgeW91IGFsbG9jYXRlIHRoZXNl
IHByb3RlY3RlZCBidWZmZXJzLiBXZSBjb3VsZCBhZGQgYSAiaXMKPiA+ID4+IHByb3RlY3RlZCBi
dWZmZXIiIGZsYWcgYXQgdGhlIGRtYV9idWYgbGV2ZWwgZm9yIHRoaXMuCgpJIGFsc28gbGlrZSB0
aGlzIGFwcHJvYWNoLiBUaGUgcHJvdGVjdGVkLW5lc3MgaXMgYSBwcm9wZXJ0eSBvZiB0aGUKYWxs
b2NhdGlvbiwgc28gbWFrZXMgc2Vuc2UgdG8gc3RvcmUgaXQgd2l0aCB0aGUgYWxsb2NhdGlvbiBJ
TU8uCgo+ID4gPj4KPiA+ID4+IFNvIHllYWggZm9yIHRoaXMgc3R1ZmYgaGVyZSBJIHRoaW5rIHdl
IGRvIHdhbnQgdGhlIGZ1bGwgdXNlcnNwYWNlIHNpZGUsCj4gPiA+PiBmcm9tIGFsbG9jYXRvciB0
byByZW5kZXJpbmcgc29tZXRoaW5nIGludG8gdGhpcyBwcm90ZWN0ZWQgYnVmZmVycyAobm8gbmVl
ZAo+ID4gPj4gdG8gYWxzbyBoYXZlIHRoZSBlbnRpcmUgImRlY29kZSBhIHByb3RlY3RlZCBiaXRz
dHJlYW0gcGFydCIgaW1vLCBzaW5jZQo+ID4gPj4gdGhhdCB3aWxsIGZyZWFrIHBlb3BsZSBvdXQp
LiBVbmZvcnR1bmF0ZWx5LCBpbiBteSBleHBlcmllbmNlLCB0aGF0IGtpbGxzCj4gPiA+PiBpdCBm
b3IgdXBzdHJlYW0gOi0vIEJ1dCBhbHNvIGluIG15IGV4cGVyaWVuY2Ugb2YgbG9va2luZyBpbnRv
IHRoaXMgZm9yCj4gPiA+PiBvdGhlciBncHUncywgd2UgcmVhbGx5IG5lZWQgdG8gaGF2ZSB0aGUg
ZnVsbCBwaWN0dXJlIGhlcmUgdG8gbWFrZSBzdXJlCj4gPiA+PiB3ZSdyZSBub3Qgc2NyZXdpbmcg
dGhpcyB1cC4KPiA+ID4KPiA+ID4gTWF5YmUgQXlhbiBjb3VsZCd2ZSBiZWVuIGEgYml0IGNsZWFy
ZXIgaW4gaGlzIG1lc3NhZ2UsIGJ1dCB0aGUgYXNrIGhlcmUgaXMgZm9yIGlkZWFzCj4gPiA+IG9u
IGhvdyB1c2Vyc3BhY2UgImNvbW11bmljYXRlcyIgKHN0b3Jlcz8pIHRoZSBmYWN0IHRoYXQgdGhl
IGJ1ZmZlcnMgYXJlIHByb3RlY3RlZCB0bwo+ID4gPiB0aGUga2VybmVsIGRyaXZlci4gSW4gb3Vy
IGRpc3BsYXkgcHJvY2Vzc29yIHdlIG5lZWQgdG8gdGhlIHRoZSBoYXJkd2FyZSB0aGF0IHRoZQo+
ID4gPiBidWZmZXJzIGFyZSBwcm90ZWN0ZWQgYmVmb3JlIGl0IHRyaWVzIHRvIGZldGNoIHRoZW0g
c28gdGhhdCBpdCBjYW4gMSkgZW5hYmxlIHRoZQo+ID4gPiBhZGRpdGlvbmFsIGhhcmR3YXJlIHNp
Z25hbGluZyB0aGF0IHNldHMgdGhlIHByb3RlY3Rpb24gYXJvdW5kIHRoZSBzdHJlYW07IGFuZCAy
KSByZWFkCj4gPiA+IHRoZSBwcm90ZWN0ZWQgYnVmZmVycyBpbiBhIHNwZWNpYWwgbW9kZSB3aGVy
ZSB0aGVyZSB0aGUgbWFnaWMgaGFwcGVucy4KPiAKPiBUaGF0IHdhcyBjbGVhciwgYnV0IGZvciB0
aGUgZnVsbCBwaWN0dXJlIHdlIGFsc28gbmVlZCB0byBrbm93IGhvdwo+IHRoZXNlIGJ1ZmZlcnMg
YXJlIHByb2R1Y2VkIGFuZCB3aGVyZSB0aGV5IGFyZSBhbGxvY2F0ZWQuIE9uZSBhcHByb2FjaAo+
IHdvdWxkIGJlIHRvIGhhdmUgYSBkbWEtYnVmIGhlYXAgdGhhdCBnaXZlcyB5b3UgZW5jcnlwdGVk
IGJ1ZmZlcnMgYmFjay4KPiBXaXRoIHRoYXQgd2UgbmVlZCB0byBtYWtlIHN1cmUgdGhhdCBvbmx5
IGVuY3J5cHRpb24tYXdhcmUgZHJpdmVycwo+IGFsbG93IHN1Y2ggYnVmZmVycyB0byBiZSBpbXBv
cnRlZCwgYW5kIHRoZSBlbnRpcmUgcHJvYmxlbSBiZWNvbWVzIGEKPiBrZXJuZWwtaW50ZXJuYWwg
b25lIC0gYXNpZGUgZnJvbSBhbGxvY2F0aW5nIHRoZSByaWdodCBraW5kIG9mIGJ1ZmZlcgo+IGF0
IHRoZSByaWdodCBwbGFjZS4KPiAKCkluIG91ciBjYXNlLCB3ZSdkIGJlIHN1cHBvcnRpbmcgYSBz
eXN0ZW0gbGlrZSBUWk1QLTEsIHRoZXJlJ3MgYQpMaW5hcm8gY29ubmVjdCBwcmVzZW50YXRpb24g
b24gaXQgaGVyZToKaHR0cHM6Ly9jb25uZWN0LmxpbmFyby5vcmcvcmVzb3VyY2VzL2hrZzE4L2hr
ZzE4LTQwOC8KClRoZSBzaW1wbGVzdCB3YXkgdG8gaW1wbGVtZW50IHRoaXMgaXMgZm9yIGZpcm13
YXJlIHRvIHNldCB1cCBhCmNhcnZlb3V0IHdoaWNoIGl0IHRlbGxzIGxpbnV4IGlzIHNlY3VyZS4g
QSBsaW51eCBhbGxvY2F0b3IgKGlvbiwgZ2VtLAp2YjIsIHdoYXRldmVyKSBjYW4gYWxsb2NhdGUg
ZnJvbSB0aGlzIGNhcnZlb3V0LCBhbmQgdGFnIHRoZSBidWZmZXIgYXMKc2VjdXJlLgoKSW4gdGhp
cyBraW5kIG9mIHN5c3RlbSwgbGludXggZG9lc24ndCBuZWNlc3NhcmlseSBuZWVkIHRvIGtub3cK
YW55dGhpbmcgYWJvdXQgaG93IGJ1ZmZlcnMgYXJlIHByb3RlY3RlZCwgb3Igd2hhdCBIVyBpcyBj
YXBhYmxlIG9mIC0KaXQgb25seSBuZWVkcyB0byBjYXJyeSBhcm91bmQgdGhlICJpc19wcm90ZWN0
ZWQiIGZsYWcuCgpIZXJlLCB0aGUgVEVFIGlzIHVsdGltYXRlbHkgcmVzcG9uc2libGUgZm9yIGRl
Y2lkaW5nIHdoaWNoIEhXIGdldHMKYWNjZXNzIHRvIGEgYnVmZmVyLiBJIGRvbid0IHNlZSBhIGJl
bmVmaXQgb2YgaGF2aW5nIGxpbnV4IGRlY2lkZSB3aGljaApkcml2ZXJzIGNhbiBvciBjYW5ub3Qg
aW1wb3J0IGEgYnVmZmVyLCBiZWNhdXNlIHRoYXQgZGVjaXNpb24gc2hvdWxkIGJlCmhhbmRsZWQg
YnkgdGhlIFRFRS4KCkZvciBwcm92aW5nIG91dCB0aGUgcGlwZWxpbmUsIElNTyBpdCBkb2Vzbid0
IG1hdHRlciB3aGV0aGVyIHRoZQpidWZmZXJzIGFyZSBwcm90ZWN0ZWQgb3Igbm90LiBGb3Igb3Vy
IERQVSwgYWxsIHRoYXQgbWF0dGVycyBpcyB0aGF0IGlmCnRoZSBidWZmZXIgY2xhaW1zIHRvIGJl
IHByb3RlY3RlZCwgd2UgaGF2ZSB0byBzZXQgb3VyIHByb3RlY3RlZApjb250cm9sIGJpdC4gTm90
aGluZyBtb3JlLiBBRkFJSyBpdCBzaG91bGQgd29yayB0aGUgc2FtZSBmb3Igb3RoZXIKVFpNUC0x
IGltcGxlbWVudGF0aW9ucy4KCj4gPiA+IFNvIHllYWgsIHdlIGtub3cgd2UgZG8gd2FudCBmdWxs
IHVzZXJzcGFjZSBzdXBwb3J0LCB3ZSdyZSBwcm9kZGluZyB0aGUgY29tbXVuaXR5IG9uCj4gPiA+
IGFuc3dlcnMgb24gaG93IHRvIGJlc3QgbGV0IHRoZSBrZXJuZWwgc2lkZSBrbm93IHdoYXQgdXNl
cnNwYWNlIGhhcyBkb25lLgo+ID4KPiA+IEFjdHVhbGx5IHRoaXMgaXMgaW50ZXJlc3RpbmcgZm9y
IG90aGVyIG11bHRpbWVkaWEgU29DcyBpbXBsZW1lbnRpbmcgc2VjdXJlIHZpZGVvIGRlY29kZQo+
ID4gcGF0aHMgd2hlcmUgdmlkZW8gYnVmZmVycyBhcmUgYWxsb2NhdGVkIGFuZCBtYW5hZ2VkIGJ5
IGEgdHJ1c3RlZCBhcHAuCj4gCj4gWWVhaCBJIGV4cGVjdCB0aGVyZSdzIG1vcmUgdGhhbiBqdXN0
IGFybSB3YW50aW5nIHRoaXMuIEkgYWxzbyB3b25kZXIKPiBob3cgdGhhdCBpbnRlcmFjdHMgd2l0
aCB0aGUgc2VjdXJlIG1lbW9yeSBhbGxvY2F0b3IgdGhhdCB3YXMgYm9iYmluZwo+IGFyb3VuZCBv
biBkcmktZGV2ZWwgZm9yIGEgd2hpbGUsIGJ1dCBzZWVtcyB0byBub3QgaGF2ZSBnb25lIGFueXdo
ZXJlLgo+IFRoYXQgdGhpbmcgaW1wbGVtZW50ZWQgbXkgaWRlYSBvZiAic2VjdXJlIG1lbW9yeSBp
cyBvbmx5IGFsbG9jYXRlZCBieQo+IGEgc3BlY2lhbCBlbnRpdHkiLgo+IC1EYW5pZWwKCkxpa2Ug
SSBzYWlkLCBmb3IgdXMgYWxsIHdlIG5lZWQgaXMgYSB3YXkgdG8gY2FycnkgYXJvdW5kIGEgMS1i
aXQKImlzX3Byb3RlY3RlZCIgZmxhZyB3aXRoIGEgYnVmZmVyLiBDb3VsZCBvdGhlciBmb2xrcyBz
aGFyZSB3aGF0J3MKbmVlZGVkIGZvciB0aGVpciBzeXN0ZW1zIHNvIHdlIGNhbiByZWFzb24gYWJv
dXQgc29tZXRoaW5nIHRoYXQgd29ya3MKZm9yIGFsbD8KClRoYW5rcyEKLUJyaWFuCgo+IAo+ID4K
PiA+IE5laWwKPiA+Cj4gPiA+Cj4gPiA+IEJlc3QgcmVnYXJkcywKPiA+ID4gTGl2aXUKPiA+ID4K
PiA+ID4KPiA+ID4+IC1EYW5pZWwKPiA+ID4+Cj4gPiA+Pj4KPiA+ID4+PiAtLS8KPiA+ID4+Pgo+
ID4gPj4+IC0tLQo+ID4gPj4+ICBpbmNsdWRlL3VhcGkvZHJtL2RybV9mb3VyY2MuaCB8IDkgKysr
KysrKysrCj4gPiA+Pj4gIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKykKPiA+ID4+Pgo+
ID4gPj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvZHJtL2RybV9mb3VyY2MuaCBiL2luY2x1
ZGUvdWFwaS9kcm0vZHJtX2ZvdXJjYy5oCj4gPiA+Pj4gaW5kZXggM2ZlZWFhM2Y5ODdhLi4zOGU1
ZTgxZDExZmUgMTAwNjQ0Cj4gPiA+Pj4gLS0tIGEvaW5jbHVkZS91YXBpL2RybS9kcm1fZm91cmNj
LmgKPiA+ID4+PiArKysgYi9pbmNsdWRlL3VhcGkvZHJtL2RybV9mb3VyY2MuaAo+ID4gPj4+IEBA
IC03NDIsNiArNzQyLDE1IEBAIGV4dGVybiAiQyIgewo+ID4gPj4+ICAgKi8KPiA+ID4+PiAgI2Rl
ZmluZSBBRkJDX0ZPUk1BVF9NT0RfQkNIICAgICAoMVVMTCA8PCAxMSkKPiA+ID4+Pgo+ID4gPj4+
ICsvKgo+ID4gPj4+ICsgKiBQcm90ZWN0ZWQgZnJhbWVidWZmZXIKPiA+ID4+PiArICoKPiA+ID4+
PiArICogVGhlIGZyYW1lYnVmZmVyIGlzIGFsbG9jYXRlZCBpbiBhIHByb3RlY3RlZCBzeXN0ZW0g
bWVtb3J5IHdoaWNoIGNhbiBiZSBhY2Nlc3NlZAo+ID4gPj4+ICsgKiB2aWEgc29tZSBzcGVjaWFs
IGhhcmR3YXJlIHNpZ25hbHMgZnJvbSB0aGUgZHB1LiBUaGlzIGlzIHVzZWQgdG8gc3VwcG9ydAo+
ID4gPj4+ICsgKiAnR1JBTExPQ19VU0FHRV9QUk9URUNURUQnIGluIG91ciBmcmFtZWJ1ZmZlciBm
b3IgRUdMX0VYVF9wcm90ZWN0ZWRfY29udGVudC4KPiA+ID4+PiArICovCj4gPiA+Pj4gKyNkZWZp
bmUgRFJNX0ZPUk1BVF9NT0RfQVJNX1BST1RFQ1RFRCAgICAgICBmb3VyY2NfbW9kX2NvZGUoQVJN
LCAoMVVMTCA8PCA1NSkpCj4gPiA+Pj4gKwo+ID4gPj4+ICAvKgo+ID4gPj4+ICAgKiBBbGx3aW5u
ZXIgdGlsZWQgbW9kaWZpZXIKPiA+ID4+PiAgICoKPiA+ID4+PiAtLQo+ID4gPj4+IDIuMjMuMAo+
ID4gPj4+Cj4gPiA+Pgo+ID4gPj4gLS0KPiA+ID4+IERhbmllbCBWZXR0ZXIKPiA+ID4+IFNvZnR3
YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgo+ID4gPj4gaHR0cDovL2Jsb2cuZmZ3bGwu
Y2gKPiA+ID4KPiA+Cj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwo+ID4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+ID4gZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwo+ID4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwKPiAKPiAKPiAKPiAtLSAKPiBEYW5pZWwgVmV0dGVyCj4gU29mdHdh
cmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCj4gKzQxICgwKSA3OSAzNjUgNTcgNDggLSBo
dHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
