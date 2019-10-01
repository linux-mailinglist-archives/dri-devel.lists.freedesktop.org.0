Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4411C2E98
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2019 10:08:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A8E16E554;
	Tue,  1 Oct 2019 08:08:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690076.outbound.protection.outlook.com [40.107.69.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 886D06E554
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2019 08:08:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lb+VAJwXu5Dh6WIJNLz3SEPd/64koZ/Nw391nL2QTT/l0UCdwdZl9vpGN6ecxP8jdg1+gl3b/S4J8ZUJ4j06USEwWgdZg4wBpu1JEVvG62/H2P+e7SByf3Sy5k5xEX8ktw+PYuT1cCCWYfqoSfElD1Z/2yLEn0MUDxOMBSVV1BkO7wFO5fEeTB5VjMtu/OUjobMPEJ9E/XoyI5j1v6H1pE5Txr6xvPpLY35ben705PEHQZ69Uh8XZHcfHVlmVDSwdgOi4bFxJufyMFa2pUtILMRLom7FPO3rWA2YwfZV0RIIPrsFfwFsZjVZQ7nlX4T0rio7oByTEHO45NR7db4ouQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SfDBWvCjtwzx1BH3WCm6LsljRdGIUrkhNKseyFY3zmA=;
 b=eAoBfgkJZCzaBqNgSZhlzQF0Y0qSjH2vq35R04c1PYiLtiobKYXewvgjeZlcYqA8oqvZuZ2Zlh0HDPUG/DRVH7w3cj81UeBoqGCEkX8esM2TYW9nbUgjpLztTRoCsLWtH2Jpl3PC5nTMcOafZqg5Uh2dV3YX6uSwT+ApvbC3xlE2E5vndCQEz5soNHiAvgp+XBnMSy0l1y5+fQ1hDf/6z2h4iRPlrxBu6PfAHp/5rlX2Iv7bZdx1mFVInACGGb+uCgEiBipahi/z/iAy8BYwR9H/TmiL2mYIiWqzpCg8Raco8/nBhzTekBAmeHxMu73lRwsMV+azggwx0Lt1tVod8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
Received: from MN2PR05MB6141.namprd05.prod.outlook.com (20.178.241.217) by
 MN2PR05MB7086.namprd05.prod.outlook.com (52.135.39.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.11; Tue, 1 Oct 2019 08:07:58 +0000
Received: from MN2PR05MB6141.namprd05.prod.outlook.com
 ([fe80::9861:5501:d72f:d977]) by MN2PR05MB6141.namprd05.prod.outlook.com
 ([fe80::9861:5501:d72f:d977%2]) with mapi id 15.20.2327.009; Tue, 1 Oct 2019
 08:07:58 +0000
From: Thomas Hellstrom <thellstrom@vmware.com>
To: =?iso-8859-1?Q?Christian_K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/ttm: move cpu_writers handling into vmwgfx v2
Thread-Topic: [PATCH] drm/ttm: move cpu_writers handling into vmwgfx v2
Thread-Index: AQHVd6zgzNEJOx5GxE2OeIvId3NjBw==
Date: Tue, 1 Oct 2019 08:07:58 +0000
Message-ID: <MN2PR05MB61410E4D65C0F3AF52ADE35CA19D0@MN2PR05MB6141.namprd05.prod.outlook.com>
References: <20190930163358.27898-1-christian.koenig@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [155.4.205.35]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 121dd493-99cb-4ccc-dc4e-08d7464678e9
x-ms-traffictypediagnostic: MN2PR05MB7086:|MN2PR05MB7086:
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR05MB70860CC674E8596007F29F2CA19D0@MN2PR05MB7086.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0177904E6B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(366004)(39860400002)(346002)(396003)(136003)(199004)(189003)(76116006)(71200400001)(3846002)(66446008)(52536014)(66556008)(66476007)(2501003)(64756008)(91956017)(256004)(66946007)(71190400001)(7736002)(8936002)(6116002)(81166006)(81156014)(8676002)(5660300002)(25786009)(186003)(4744005)(316002)(110136005)(446003)(6506007)(53546011)(305945005)(86362001)(14454004)(486006)(229853002)(33656002)(26005)(6246003)(55016002)(102836004)(66574012)(478600001)(99286004)(476003)(66066001)(74316002)(7696005)(76176011)(9686003)(2906002)(6436002)(40753002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR05MB7086;
 H:MN2PR05MB6141.namprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: vmware.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1Cvolm/iDETyBWYnkzu7tKSzzAiF/PGY0anenfQWkkjB6Vi+eHZlmjPbb5MIpirw+/t+f8HqpPcshFX12VRmkCXgFNgwQlWeTXX0jCIF4ANvlIB6ej80iTNGRlIYrRpm75NJWwJGjHwR0+hzaTqPmDvHDnms5py8Ae1+LRAY8SlmK+cTXBbEW1qLIdtI3NdNXW1a+WWNsdfVkDGyl3XTd782JfrvOeyz+D/NunHqXuzzZDDpN6Bv36y7Hdt4u5xAb03VPSQo3PMpbs6FKftTnMxSuJzu5qyTajU6RjoUsJXC5mberJiPG1iGhnAcdSWBL3W33bSqcexPs8341QSP3yUNFIKLgswSeF6bRnjKoLRNJkIIhtkBz/0iIhi76FWZ9M1Zb7WYupPgQLwilaCiUQAWeS2xVfjI453co+NSge0=
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 121dd493-99cb-4ccc-dc4e-08d7464678e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2019 08:07:58.5522 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /ElKdsMz6EWJjhOZn2K+R6GXT21sYZyykaKCVpQALbVgJJLvxioTe9SUXvZkyrUKt+j7ZCTOBODOGIVF2mgCjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR05MB7086
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vmware.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SfDBWvCjtwzx1BH3WCm6LsljRdGIUrkhNKseyFY3zmA=;
 b=TO/iyKw7meczSgrJl1oiPe3jLkGtH6H3B8PQ91dCx+5Xa3K0tiwjw8fxPt2xU3IXg5wLG3cYp/ItD/oWdvv9DUdqXlGgo6ynVtgYkMvQ8ByCf5cR3l5n039qzeXVU9SCxyFzdorqxhvGi9dZSGqxzkKALDAnEN0xZLGevtqGu6k=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=thellstrom@vmware.com; 
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIENocmlzdGlhbiwKCk9uIDkvMzAvMTkgNjozNCBQTSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90
ZToKPiBGcm9tOiBDaHJpc3RpYW4gS8O2bmlnIDxja29lbmlnLmxlaWNodHp1bWVya2VuQGdtYWls
LmNvbT4KPgo+IFRoaXMgZmVhdHVyZSBpcyBvbmx5IHVzZWQgYnkgdm13Z2Z4IGFuZCBzdXBlcmZs
b3VzIGZvciBldmVyeWJvZHkgZWxzZS4KPgo+IHYyOiB1c2Ugdm13X2J1ZmZlcl9vYmplY3QgaW5z
dGVhZCBvZiB2bXdfdXNlcl9iby4KPgo+IFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcg
PGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPiAtLS0KCkkganVzdCBzZW50IG91dCBhIHBhdGNo
IGJhc2VkIG9uIHRoaXMgdGhhdCBpcyBzbGlnaHRseSByZXdvcmtlZCBvbiB0aGUKdm13Z2Z4IHNp
ZGUgYW5kIHRoYXQgZml4ZXMgYSBjb3VwbGUgb2YgY2hlY2twYXRjaCB3YXJuaW5ncy4gIFRUTSBj
aGFuZ2VzCnNob3VsZCBiZSB0aGUgc2FtZS4gQWRkZWQgbXlzZWxmIGFzIENvLWRldmVsb3BlZC1i
eToKCkhvcGUgdGhpcyBpcyBvay4gSWYgeW91IHdhbnQgdG8gbWVyZ2UgaXQgdGhyb3VnaCB5b3Vy
IHRyZWUgSSdtIGZpbmUgd2l0aAp0aGF0LgoKL1Rob21hcwoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
