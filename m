Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD62B1B7A0
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2019 16:01:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD0138925E;
	Mon, 13 May 2019 14:01:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810043.outbound.protection.outlook.com [40.107.81.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 141A98925E
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2019 14:01:22 +0000 (UTC)
Received: from MN2PR12MB3536.namprd12.prod.outlook.com (20.179.83.19) by
 MN2PR12MB3104.namprd12.prod.outlook.com (20.178.243.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.24; Mon, 13 May 2019 14:01:19 +0000
Received: from MN2PR12MB3536.namprd12.prod.outlook.com
 ([fe80::11eb:77b3:f5ae:f6c1]) by MN2PR12MB3536.namprd12.prod.outlook.com
 ([fe80::11eb:77b3:f5ae:f6c1%4]) with mapi id 15.20.1878.024; Mon, 13 May 2019
 14:01:19 +0000
From: "Liang, Prike" <Prike.Liang@amd.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <ckoenig.leichtzumerken@gmail.com>,
 "Olsak, Marek" <Marek.Olsak@amd.com>, "Zhou, David(ChunMing)"
 <David1.Zhou@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH 4/4] drm/amdgpu: stop removing BOs from the LRU during CS
Thread-Topic: [PATCH 4/4] drm/amdgpu: stop removing BOs from the LRU during CS
Thread-Index: AQHVBzqHtT9ig0PtH0OPqBXWwtSj/qZpE1TA
Date: Mon, 13 May 2019 14:01:19 +0000
Message-ID: <MN2PR12MB3536E593C868F386FC7E2A5BFB0F0@MN2PR12MB3536.namprd12.prod.outlook.com>
References: <20190510141316.1746-1-christian.koenig@amd.com>
 <20190510141316.1746-4-christian.koenig@amd.com>
In-Reply-To: <20190510141316.1746-4-christian.koenig@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [202.108.86.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3ad3c875-f9dc-474a-5ad6-08d6d7ab796b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3104; 
x-ms-traffictypediagnostic: MN2PR12MB3104:
x-microsoft-antispam-prvs: <MN2PR12MB3104A7DFB748F0090153D880FB0F0@MN2PR12MB3104.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2733;
x-forefront-prvs: 0036736630
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(376002)(346002)(396003)(39860400002)(136003)(13464003)(189003)(199004)(6506007)(229853002)(53936002)(186003)(6436002)(33656002)(55016002)(102836004)(9686003)(53546011)(5660300002)(26005)(2501003)(8936002)(8676002)(81156014)(52536014)(86362001)(81166006)(486006)(476003)(11346002)(446003)(316002)(110136005)(66574012)(6246003)(99286004)(256004)(14444005)(68736007)(72206003)(478600001)(7696005)(66066001)(14454004)(66446008)(71190400001)(71200400001)(76176011)(25786009)(74316002)(7736002)(305945005)(64756008)(76116006)(6116002)(66556008)(66946007)(66476007)(73956011)(3846002)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3104;
 H:MN2PR12MB3536.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +SWcMOFweEGDZF1WnuSl5a3kw8P2yKnI6xJEBsDG0ebR/wZ3SzufggI8vBKMrs8TrWGb3jQiTBC0EbANotSu64bzC3jyf2XYri8RLYgovijn0PnjDY271Q5GRm3f7S0v5PbjNCcb1ADkTovGHGfLsMQMMBRSaU6RUlUiHLCUHLdteCpee+Be+9Icf320DA8e+A9ZIzVUkCe8de90XzbOzNjTv2rOAUe06YfabD9zdtSe2rXR/4DgmJmiNm4TOcnmiwt4NuGA8ucuA2m+HFR7GhZGQB+BDyuf/Ge0Onx/gQtuIM7cXgmSKfk/wl60vVCRQ0ZK8ivhUiMjPAogh31RLHQo/LqfLqOaA6XYqvcAlcr6a2xS5JQ/onTppdkCu1ZZs/jOYSNAAsU2WJn+Ie0xnUPy3BwDJzoKmti6ZUqycVw=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ad3c875-f9dc-474a-5ad6-08d6d7ab796b
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2019 14:01:19.4170 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3104
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EBoeSp4GsdR2ILyQkSfBMs3mNAhoHhAun1HghxgVYpU=;
 b=xxn9M+Nl7sbYVnfq/MqRzGdQqRRI4cepnHOdlIcV55pqYI8/rUl6+T3fID6NumlQhB6kFkfgKOJZkN3djGzC8t5W29COpbK4iitInuZtrAxXcaiRubbEIOMlVB1j7PVzg8vZxCYHdncJIR/PQYwB2aYDfCXfssWKKpFg+dZvgTc=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Prike.Liang@amd.com; 
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

SGkgQ2hyaXN0aWFuIO+8jA0KDQpUaGUgc2VyaWVzIHBhdGNoIGNhbiByZXNvbHZlIEFiYXF1cyBw
aW5uZWQgZmFpbGVkIGlzc3VlIC4NCldvdWxkIHlvdSBsaWtlIHB1c2ggdGhlIGZvdXIgZml4IHBh
dGNoZXMgdG8gZHJtLW5leHQgYnJhbmNoIC4NCg0KVGhhbmtzLA0KUHJpa2UNCi0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBDaHJpc3RpYW4gS8O2bmlnIDxja29lbmlnLmxlaWNodHp1
bWVya2VuQGdtYWlsLmNvbT4gDQpTZW50OiBGcmlkYXksIE1heSAxMCwgMjAxOSAxMDoxMyBQTQ0K
VG86IE9sc2FrLCBNYXJlayA8TWFyZWsuT2xzYWtAYW1kLmNvbT47IFpob3UsIERhdmlkKENodW5N
aW5nKSA8RGF2aWQxLlpob3VAYW1kLmNvbT47IExpYW5nLCBQcmlrZSA8UHJpa2UuTGlhbmdAYW1k
LmNvbT47IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNClN1YmplY3Q6IFtQQVRDSCA0
LzRdIGRybS9hbWRncHU6IHN0b3AgcmVtb3ZpbmcgQk9zIGZyb20gdGhlIExSVSBkdXJpbmcgQ1MN
Cg0KW0NBVVRJT046IEV4dGVybmFsIEVtYWlsXQ0KDQpUaGlzIGF2b2lkcyBPT00gc2l0dWF0aW9u
cyB3aGVuIHdlIGhhdmUgbG90cyBvZiB0aHJlYWRzIHN1Ym1pdHRpbmcgYXQgdGhlIHNhbWUgdGlt
ZS4NCg0KU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0Bh
bWQuY29tPg0KLS0tDQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2NzLmMgfCAy
ICstDQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQoNCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3MuYyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jcy5jDQppbmRleCBhMWQ2YTA3MjFlNTMuLjg4
MjhkMzBjZDQwOSAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9jcy5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3MuYw0KQEAg
LTY0OCw3ICs2NDgsNyBAQCBzdGF0aWMgaW50IGFtZGdwdV9jc19wYXJzZXJfYm9zKHN0cnVjdCBh
bWRncHVfY3NfcGFyc2VyICpwLA0KICAgICAgICB9DQoNCiAgICAgICAgciA9IHR0bV9ldV9yZXNl
cnZlX2J1ZmZlcnMoJnAtPnRpY2tldCwgJnAtPnZhbGlkYXRlZCwgdHJ1ZSwNCi0gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgJmR1cGxpY2F0ZXMsIHRydWUpOw0KKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAmZHVwbGljYXRlcywgZmFsc2UpOw0KICAgICAgICBpZiAo
dW5saWtlbHkociAhPSAwKSkgew0KICAgICAgICAgICAgICAgIGlmIChyICE9IC1FUkVTVEFSVFNZ
UykNCiAgICAgICAgICAgICAgICAgICAgICAgIERSTV9FUlJPUigidHRtX2V1X3Jlc2VydmVfYnVm
ZmVycyBmYWlsZWQuXG4iKTsNCi0tDQoyLjE3LjENCg0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
