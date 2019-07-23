Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0793771F2B
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 20:23:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 812256E384;
	Tue, 23 Jul 2019 18:23:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140079.outbound.protection.outlook.com [40.107.14.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A75CB6E2D2;
 Tue, 23 Jul 2019 14:55:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R9lRMUDODlAS4XYl4VNQ289MAp6jY/9tgkG41FzuRVFmkIvsPVLsQNQwRx7awRyTAe6DoK8tmkxySeluyszoROAbDoiCk4k6ZbizDmWn475CMi4cgRFJ9pCy2gUJ2EbZzzZsmi1plkxvCu51lqspZyVHfq0/CirL47EZuyBjdR25hqIUbcXs7sJY+1gWPJLBvnWM2nre2rk8Mt8Afhphq0tPFiY3yVx8dCbc6pnd3j30GwsDAMJA2i3idmthsEuDkJmkR/SCPHuJ7V8hz4b3fzCDX1YMktEpMaC/xmXDCblsDVTTXTHbkppZM4WuHk1wmWDmoEDfk/cZ6+2DPQ8k9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YmavxUOco/R1TXry10N00+5Umm6D+n0p9fRLXD49D5o=;
 b=FOUtAIsTvxedxJkTJ5mWbb+GhUqLucNPPwwAGICUH0aECjc9Zxnmvc7KZje9UTspkl4tzHDqeWAzhrFHlIUKyn1Xoz49AYQVRH1WEVAnHxA/MwQeeaqt2pFKvIgq2xyXSNcLfYDmKdBqYuDKxMPFtceoSkLqWFZkVVRdHpEVY+vpNHDkWvnQz83k40SGjhHt9D8xgsQ8qwmRTiwiwuxeHXwkk0H9VMekAhYLxaFwsy+CuOkmZZ2RLCJb4SR7M41ZSVP1DxLjX/ydfelXqdkbfjBYB1dOiZ6slHOvD6L+yQYNFImeFlbvONeTjWbssV1MiH5oaQw2V+eoe2/ysGwm1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=mellanox.com;dmarc=pass action=none
 header.from=mellanox.com;dkim=pass header.d=mellanox.com;arc=none
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (10.171.182.144) by
 VI1PR05MB3311.eurprd05.prod.outlook.com (10.170.238.32) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.10; Tue, 23 Jul 2019 14:55:10 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::5c6f:6120:45cd:2880]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::5c6f:6120:45cd:2880%4]) with mapi id 15.20.2094.013; Tue, 23 Jul 2019
 14:55:10 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 2/6] mm: move hmm_vma_range_done and hmm_vma_fault to
 nouveau
Thread-Topic: [PATCH 2/6] mm: move hmm_vma_range_done and hmm_vma_fault to
 nouveau
Thread-Index: AQHVQHITSjZL0YJcikqGnA6nJMGubKbYTFYA
Date: Tue, 23 Jul 2019 14:55:10 +0000
Message-ID: <20190723145506.GJ15331@mellanox.com>
References: <20190722094426.18563-1-hch@lst.de>
 <20190722094426.18563-3-hch@lst.de>
In-Reply-To: <20190722094426.18563-3-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MN2PR02CA0027.namprd02.prod.outlook.com
 (2603:10b6:208:fc::40) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:4d::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [156.34.55.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f8e1510a-9cc2-4812-8d13-08d70f7dc267
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR05MB3311; 
x-ms-traffictypediagnostic: VI1PR05MB3311:
x-microsoft-antispam-prvs: <VI1PR05MB33110C115415E8D90BDE4379CFC70@VI1PR05MB3311.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0107098B6C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(366004)(136003)(346002)(396003)(39860400002)(189003)(199004)(71200400001)(71190400001)(256004)(8676002)(6116002)(3846002)(64756008)(76176011)(14454004)(6916009)(316002)(6506007)(86362001)(478600001)(6436002)(229853002)(5660300002)(6486002)(386003)(4744005)(99286004)(11346002)(25786009)(446003)(66066001)(1076003)(54906003)(7736002)(102836004)(52116002)(53936002)(305945005)(4326008)(476003)(2616005)(68736007)(66556008)(66476007)(8936002)(66946007)(81156014)(81166006)(33656002)(6512007)(486006)(2906002)(26005)(186003)(66446008)(36756003)(6246003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB3311;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: oZNCEU5446B3GEa6OLWkGnHxiqDkPkKXmfogpj029SkBrJQuOdEJvTbky12FShA2UnL137o98hcX/HWqrFgkkOs7zZq0Ru8Z5XpHNhTlq2rbaYZgKjUfLHym6WBm8BBd1w6JkOIjatbbu+UTfgphmJnoL9Sghu9a2gGJDhLJJF3lISjwzTI/AbKxHRe1//fdOg+r/Vrf5Dh+WCEqUk8ordc0nNxSCqvU1Wga31NnAxDKg3+OfRHEN5TLSZN0MxmsBWuGuQaM3nDmau5MxUzidPB/2vL15RE+21ouBkV4soq9+UJGwbiDKiVd4U80IJ6GAdOLJNHZdM2n+/ay6oOhrBRIox1beCTC5yfGCPXF9UvIjCXkvSkNwt43siwVrHrsvso06V/bwMqlNa2aWtSB10HtVOYjE4vAqzJv5sC6PeQ=
Content-ID: <3FB3BADA1123924E9A7FB81AD9C8BC58@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8e1510a-9cc2-4812-8d13-08d70f7dc267
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2019 14:55:10.3938 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jgg@mellanox.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB3311
X-Mailman-Approved-At: Tue, 23 Jul 2019 18:22:04 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YmavxUOco/R1TXry10N00+5Umm6D+n0p9fRLXD49D5o=;
 b=J66yV23R95DW8vxedlM/uvZTtf2UFG7Y9TcCp2R4eLkY0SyUJGORCJkJeOcpoGBvxaBVOdMea675uRDZACrhw5lg1s8gF7oT311slynDDMiEjRZpZN7zpoz55Vis871J/vAK8ylZ5BwVNV67dl8UOK7IuDQXgk9dFEfGWzM0dpg=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=jgg@mellanox.com; 
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
Cc: Ralph Campbell <rcampbell@nvidia.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 =?iso-8859-1?Q?J=E9r=F4me_Glisse?= <jglisse@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgMjIsIDIwMTkgYXQgMTE6NDQ6MjJBTSArMDIwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gVGhlc2UgdHdvIGZ1bmN0aW9ucyBhcmUgbWFya2VkIGFzIGEgbGVnYWN5IEFQ
SXMgdG8gZ2V0IHJpZCBvZiwgYnV0IHNlZW0KPiB0byBzdWl0IHRoZSBjdXJyZW50IG5vdXZlYXUg
Zmxvdy4gIE1vdmUgaXQgdG8gdGhlIG9ubHkgdXNlciBpbgo+IHByZXBhcmF0aW9uIGZvciBmaXhp
bmcgYSBsb2NraW5nIGJ1ZyBpbnZvbHZpbmcgY2FsbGVyIGFuZCBjYWxsZWUuCj4gQWxsIGNvbW1l
bnRzIHJlZmVycmluZyB0byB0aGUgb2xkIEFQSSBoYXZlIGJlZW4gcmVtb3ZlZCBhcyB0aGlzIG5v
dwo+IGlzIGEgZHJpdmVyIHByaXZhdGUgaGVscGVyLgo+IAo+IFNpZ25lZC1vZmYtYnk6IENocmlz
dG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbm91dmVh
dS9ub3V2ZWF1X3N2bS5jIHwgNDUgKysrKysrKysrKysrKysrKysrKysrLQo+ICBpbmNsdWRlL2xp
bnV4L2htbS5oICAgICAgICAgICAgICAgICAgIHwgNTQgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tCj4gIDIgZmlsZXMgY2hhbmdlZCwgNDMgaW5zZXJ0aW9ucygrKSwgNTYgZGVsZXRpb25zKC0p
CgpSZXZpZXdlZC1ieTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgoKSmFzb24K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
