Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD44BA26D
	for <lists+dri-devel@lfdr.de>; Sun, 22 Sep 2019 14:07:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADBFC89DA7;
	Sun, 22 Sep 2019 12:05:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760087.outbound.protection.outlook.com [40.107.76.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DEC66E06E;
 Sat, 21 Sep 2019 11:32:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fsLwwTUAa1zneQKdb9M6+154oydcodyNC/aTgblePZQDpTYIikJM+r7R2icvVm93XWw1ierB4RdL26h71W9C+Fv6AAvEPQuQSwwXSa/m8eshTVsw6cXzHq5l3lmetV2BL0ntAZVt4CsdRQz4L2ri+6usADbG+VpR0Sclek+7tgZ5wCs+KoaYef00oQSfx7QsKfWc0VxPmF2iTpGbTjphP/HVhruC0le09XWqZ6oKejtoFRCnY3NnFKTI4L1b0WyYucDu5QSWH5ph/sVVNJd/7eiDYuGu9UV7m52nxMEi0NeniOya2yNQoNpxwc+GEBqsLwMR8pdpezav6fVIZVVqqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AWLEZ40q2dN9W3tFq1LGqdVGFY7br2wfXt5r+kfM0ik=;
 b=lZkmj/iHT3By9HsVfSVGGFk0WpLHX46SUsPHWl5wW7BiTHeFXy5oU4w6k0+ZMyxpuanRlPRJ8FgTHMPKKNYLF9Vtb/1HZA8xa6GguegWjg3Lg5TezDBVZMDCmloWwI4259rXaGzi0QAlTBklUSFs8ptD35twrtqNDiIQX7gw+YyvqfT3YVs/yQozFj2n+SfxY3rnwMgKLZDlIAmB2dtrSXrQ1eGGX/CXq/NUmMU1qMx40ncwcjNMVcwi81YGVk44vcs7qzxpMy7l4+TOuhcU1D6EkUycQmyPSoK7ZvYw+N6HAnKOxQ+R38bn/OgcY8UjWQJwBe0D+NYr4HG2mNWjrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB2408.namprd12.prod.outlook.com (52.132.141.25) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.22; Sat, 21 Sep 2019 11:32:33 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::9d43:b3d4:9ef:29fc]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::9d43:b3d4:9ef:29fc%8]) with mapi id 15.20.2284.023; Sat, 21 Sep 2019
 11:32:33 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Navid Emamdoost <navid.emamdoost@gmail.com>
Subject: Re: [PATCH] drm/amdgpu: release allocated memory
Thread-Topic: [PATCH] drm/amdgpu: release allocated memory
Thread-Index: AQHVcAWtHmxKnpTE6UuFeazFSHUo+6c2AG+A
Date: Sat, 21 Sep 2019 11:32:33 +0000
Message-ID: <06d1d086-0628-829b-766f-e1f614fab909@amd.com>
References: <20190920224915.2788-1-navid.emamdoost@gmail.com>
In-Reply-To: <20190920224915.2788-1-navid.emamdoost@gmail.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM4PR08CA0066.eurprd08.prod.outlook.com
 (2603:10a6:205:2::37) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cc7e9c59-4fbe-4fda-7382-08d73e87653e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM5PR12MB2408; 
x-ms-traffictypediagnostic: DM5PR12MB2408:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB2408BD2E0D140A0700910479838B0@DM5PR12MB2408.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-forefront-prvs: 0167DB5752
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(396003)(346002)(136003)(366004)(199004)(189003)(6916009)(6512007)(81166006)(81156014)(7416002)(316002)(14454004)(86362001)(8676002)(6436002)(4326008)(31696002)(8936002)(6246003)(25786009)(2906002)(6486002)(478600001)(6116002)(7736002)(229853002)(305945005)(58126008)(52116002)(46003)(66476007)(186003)(4744005)(486006)(66446008)(5660300002)(386003)(64756008)(71200400001)(66946007)(31686004)(76176011)(36756003)(54906003)(66556008)(11346002)(99286004)(102836004)(446003)(2616005)(65806001)(6506007)(476003)(256004)(65956001)(71190400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2408;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: cDbOTZZlGiD329p155XhCBunBQ+zXI2Srh085hp4qOMxfjthuk8ywKj36X+npGungJlzhax+W1tcgZrZuSeST7OWFHqUSh/dTYfLm83sSFcwszCdLDIv9in+nVtZrnt9cDHkON0WSz/crQohQ4p4obl1CKiogjOCbNUUURLHGdXJ9Ng56p6uzw0dVCxrChrfsMurxy6vvFAv9HgRlYg9jNUeA79H5ysxpt1segazi+JMFqkEickSXG5Y5NEQnc6+rAuAMMoR4/Qz67xi58m0kLR7AFfPfdilAR6pE+qg6ie38a65QWyZfQ3VeYD7ycDfPBF1HVskXZVvsxxchLe516/+nN/63jiT95RC4vqiY3w7XpBlD2GHlbO5bZNH6YeWpJuIOM/wZ5MD+ETQlTUctS6VVnnk4WBNoYhw7Wywj0I=
Content-ID: <93FCB6AD83785947822B890DABAB1753@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc7e9c59-4fbe-4fda-7382-08d73e87653e
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Sep 2019 11:32:33.8512 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WooDPuaCTEoQFUynYre246HNsjLOzxa02KGeuwQ7+JkRw/u86YUPBDBV80FwvoBt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2408
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AWLEZ40q2dN9W3tFq1LGqdVGFY7br2wfXt5r+kfM0ik=;
 b=kn5NINvBvrMG6abn3kK0v6v+aucE3oMY4M6qPuLU4ZJOqc6m3r8Fzaxd6ocYYTs/HbojTie1UkkVpr/RXj4GDffRlAnipxWW5aXy+y/e3fUP6ZPgo6Wp4oE/378DasMV38vjquaeJqb4Rgff9C/A8SVY2omK/ugCXVUcGHoJvZs=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
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
Cc: David Airlie <airlied@linux.ie>, Rex Zhu <Rex.Zhu@amd.com>,
 "kjlu@umn.edu" <kjlu@umn.edu>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "emamd001@umn.edu" <emamd001@umn.edu>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "smccaman@umn.edu" <smccaman@umn.edu>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjEuMDkuMTkgdW0gMDA6NDkgc2NocmllYiBOYXZpZCBFbWFtZG9vc3Q6DQo+IEluIGFtZGdw
dV92bWlkX2dyYWJfaWRsZSwgZmVuY2VzIGlzIGJlaW5nIGxlYWtlZCBpbiBvbmUgZXhlY3V0aW9u
IHBhdGguDQo+IFRoZSBtaXNzaW5nIGtmcmVlIHdhcyBhZGRlZC4NCg0KTkFLLCB0aGUgYXJyYXkg
aXMgZnJlZWQgYnkgdGhlIGRtYV9mZW5jZV9hcnJheS7CoCBUaGlzIGlzIGEgZG91YmxlIGZyZWUu
DQoNClJlZ2FyZHMsDQpDaHJpc3RpYW4uDQoNCj4NCj4gU2lnbmVkLW9mZi1ieTogTmF2aWQgRW1h
bWRvb3N0IDxuYXZpZC5lbWFtZG9vc3RAZ21haWwuY29tPg0KPiAtLS0NCj4gICBkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfaWRzLmMgfCAxICsNCj4gICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKykNCj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9pZHMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9pZHMu
Yw0KPiBpbmRleCA1N2IzZDhhOWJlZjMuLjkwNjNjZDM2ZmE5NCAxMDA2NDQNCj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2lkcy5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9pZHMuYw0KPiBAQCAtMjQ0LDYgKzI0NCw3IEBAIHN0YXRp
YyBpbnQgYW1kZ3B1X3ZtaWRfZ3JhYl9pZGxlKHN0cnVjdCBhbWRncHVfdm0gKnZtLA0KPiAgIAkJ
ciA9IGFtZGdwdV9zeW5jX2ZlbmNlKGFkZXYsIHN5bmMsICZhcnJheS0+YmFzZSwgZmFsc2UpOw0K
PiAgIAkJZG1hX2ZlbmNlX3B1dChyaW5nLT52bWlkX3dhaXQpOw0KPiAgIAkJcmluZy0+dm1pZF93
YWl0ID0gJmFycmF5LT5iYXNlOw0KPiArCQlrZnJlZShmZW5jZXMpOw0KPiAgIAkJcmV0dXJuIHI7
DQo+ICAgCX0NCj4gICAJa2ZyZWUoZmVuY2VzKTsNCg0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
