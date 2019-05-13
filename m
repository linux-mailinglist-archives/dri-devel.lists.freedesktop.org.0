Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 297211AEFF
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2019 04:45:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EBB28919D;
	Mon, 13 May 2019 02:45:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680076.outbound.protection.outlook.com [40.107.68.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DE0C8918D
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2019 02:45:44 +0000 (UTC)
Received: from MN2PR12MB3536.namprd12.prod.outlook.com (20.179.83.19) by
 MN2PR12MB4030.namprd12.prod.outlook.com (10.255.239.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.21; Mon, 13 May 2019 02:45:42 +0000
Received: from MN2PR12MB3536.namprd12.prod.outlook.com
 ([fe80::11eb:77b3:f5ae:f6c1]) by MN2PR12MB3536.namprd12.prod.outlook.com
 ([fe80::11eb:77b3:f5ae:f6c1%4]) with mapi id 15.20.1878.024; Mon, 13 May 2019
 02:45:42 +0000
From: "Liang, Prike" <Prike.Liang@amd.com>
To: "Zhou, David(ChunMing)" <David1.Zhou@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH 2/2] drm/amd/display: use ttm_eu_reserve_buffers instead
 of amdgpu_bo_reserve
Thread-Topic: [PATCH 2/2] drm/amd/display: use ttm_eu_reserve_buffers instead
 of amdgpu_bo_reserve
Thread-Index: AQHVBMppFMIq5KcZzEGcY4Fvh0s/hKZoYWCA
Date: Mon, 13 May 2019 02:45:42 +0000
Message-ID: <MN2PR12MB35364FA99419927A7CE353E7FB0F0@MN2PR12MB3536.namprd12.prod.outlook.com>
References: <20190507114531.26089-1-david1.zhou@amd.com>
 <20190507114531.26089-2-david1.zhou@amd.com>
In-Reply-To: <20190507114531.26089-2-david1.zhou@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 37b911d9-643f-40ab-a177-08d6d74d175f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB4030; 
x-ms-traffictypediagnostic: MN2PR12MB4030:
x-microsoft-antispam-prvs: <MN2PR12MB403062F06EEA4DF29A1B3996FB0F0@MN2PR12MB4030.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2582;
x-forefront-prvs: 0036736630
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(136003)(376002)(396003)(39860400002)(366004)(189003)(199004)(13464003)(8676002)(81156014)(8936002)(7736002)(305945005)(81166006)(72206003)(14454004)(2501003)(74316002)(478600001)(33656002)(76176011)(2906002)(7696005)(6436002)(14444005)(3846002)(6116002)(256004)(229853002)(5660300002)(476003)(486006)(4326008)(446003)(68736007)(6246003)(52536014)(11346002)(66066001)(76116006)(66574012)(71200400001)(71190400001)(25786009)(66446008)(316002)(64756008)(66556008)(110136005)(73956011)(66476007)(86362001)(66946007)(53546011)(102836004)(6506007)(99286004)(26005)(186003)(9686003)(55016002)(53936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4030;
 H:MN2PR12MB3536.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: kJYnyYcp6DzjdTOZkiCLCJuFQH0z4le6sqyxizTJVtlsvMgM0wBTRkri+OlYGsrlpbtb5zBTk2KHcoBpcg3IYh9e7Yc/sEE7MV3Knb0JFEfK3I4tA75N+VRN2dDtFrIdmJOp3OKJ1CkI2VYM9uqf6Xi7DCSQAGtzNoJ38RT64VrYypNKaZleqrpkb4LbCJkscSyBguMYEqjaxYIqNHVeXSHyPnTDqseAF8LA7edJWurcvNDlnJo0iplcb9f6ox2Om+E2up+O43oOQTpfCWT6TMAuCod06+uMscqujgFULKS/oUdi/9ZouFmKMUC3GkBDfPh9ZM2WAzerCWLGPF5uCzeaqhm0xxlBRxbDTcn2JuFHjoQzu/v5CmVQuWi21FAdJYitS/XXzUsA2FjMO9bn0H60TvZy9+xn1uGzfmaBk74=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37b911d9-643f-40ab-a177-08d6d74d175f
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2019 02:45:42.2619 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4030
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+bq0DkajInMHV2Bl7Q/EQ+GeBeVYPNl9uHomL1MaMyU=;
 b=CoWc0czW0u6mYN0jsJ9/8Yh/132H3B/9f8iIlupNBFCC2BTeaN5WijmWUBxqfLtCNv+nYX1BNBfjIlIgB1Ju91vh2u855OAw8B8E5yymgTJ+e9VBF2x+ipcikfpLQfd56Hz7036c+9LDH/gY4Vv6YYEHvNNiQhHFN9rmLfo+6XQ=
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

QWNrZWQtYnk6IFByaWtlIExpYW5nIDxQcmlrZS5MaWFuZ0BhbWQuY29tPg0KDQoNCi0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBDaHVubWluZyBaaG91IDxkYXZpZDEuemhvdUBhbWQu
Y29tPiANClNlbnQ6IFR1ZXNkYXksIE1heSAwNywgMjAxOSA3OjQ2IFBNDQpUbzogS29lbmlnLCBD
aHJpc3RpYW4gPENocmlzdGlhbi5Lb2VuaWdAYW1kLmNvbT47IExpYW5nLCBQcmlrZSA8UHJpa2Uu
TGlhbmdAYW1kLmNvbT47IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCkNjOiBaaG91
LCBEYXZpZChDaHVuTWluZykgPERhdmlkMS5aaG91QGFtZC5jb20+DQpTdWJqZWN0OiBbUEFUQ0gg
Mi8yXSBkcm0vYW1kL2Rpc3BsYXk6IHVzZSB0dG1fZXVfcmVzZXJ2ZV9idWZmZXJzIGluc3RlYWQg
b2YgYW1kZ3B1X2JvX3Jlc2VydmUNCg0KYWRkIHRpY2tldCBmb3IgZGlzcGxheSBibywgc28gdGhh
dCBpdCBjYW4gcHJlZW1wdCBidXN5IGJvLg0KDQpDaGFuZ2UtSWQ6IEk5ZjAzMWNkY2M4MjY3ZGUw
MGU4MTlhZTMwM2JhYTBhNTJkZjhlYmI5DQpTaWduZWQtb2ZmLWJ5OiBDaHVubWluZyBaaG91IDxk
YXZpZDEuemhvdUBhbWQuY29tPg0KUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlz
dGlhbi5rb2VuaWdAYW1kLmNvbT4NCi0tLQ0KIC4uLi9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdw
dV9kbS9hbWRncHVfZG0uYyB8IDIxICsrKysrKysrKysrKysrLS0tLS0NCiAxIGZpbGUgY2hhbmdl
ZCwgMTYgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jDQppbmRleCBhYzIyZjczNTFh
NDIuLjNmMzY3NzA5NDZhYiAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMNCkBAIC00MTc2LDYgKzQxNzYsOSBAQCBzdGF0aWMgaW50
IGRtX3BsYW5lX2hlbHBlcl9wcmVwYXJlX2ZiKHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lLA0KIAlz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldjsNCiAJc3RydWN0IGFtZGdwdV9ibyAqcmJvOw0KIAlz
dHJ1Y3QgZG1fcGxhbmVfc3RhdGUgKmRtX3BsYW5lX3N0YXRlX25ldywgKmRtX3BsYW5lX3N0YXRl
X29sZDsNCisJc3RydWN0IGxpc3RfaGVhZCBsaXN0Ow0KKwlzdHJ1Y3QgdHRtX3ZhbGlkYXRlX2J1
ZmZlciB0djsNCisJc3RydWN0IHd3X2FjcXVpcmVfY3R4IHRpY2tldDsNCiAJdWludDY0X3QgdGls
aW5nX2ZsYWdzOw0KIAl1aW50MzJfdCBkb21haW47DQogCWludCByOw0KQEAgLTQxOTIsOSArNDE5
NSwxNyBAQCBzdGF0aWMgaW50IGRtX3BsYW5lX2hlbHBlcl9wcmVwYXJlX2ZiKHN0cnVjdCBkcm1f
cGxhbmUgKnBsYW5lLA0KIAlvYmogPSBuZXdfc3RhdGUtPmZiLT5vYmpbMF07DQogCXJibyA9IGdl
bV90b19hbWRncHVfYm8ob2JqKTsNCiAJYWRldiA9IGFtZGdwdV90dG1fYWRldihyYm8tPnRiby5i
ZGV2KTsNCi0JciA9IGFtZGdwdV9ib19yZXNlcnZlKHJibywgZmFsc2UpOw0KLQlpZiAodW5saWtl
bHkociAhPSAwKSkNCisJSU5JVF9MSVNUX0hFQUQoJmxpc3QpOw0KKw0KKwl0di5ibyA9ICZyYm8t
PnRibzsNCisJdHYubnVtX3NoYXJlZCA9IDE7DQorCWxpc3RfYWRkKCZ0di5oZWFkLCAmbGlzdCk7
DQorDQorCXIgPSB0dG1fZXVfcmVzZXJ2ZV9idWZmZXJzKCZ0aWNrZXQsICZsaXN0LCBmYWxzZSwg
TlVMTCk7DQorCWlmIChyKSB7DQorCQlkZXZfZXJyKGFkZXYtPmRldiwgImZhaWwgdG8gcmVzZXJ2
ZSBibyAoJWQpXG4iLCByKTsNCiAJCXJldHVybiByOw0KKwl9DQogDQogCWlmIChwbGFuZS0+dHlw
ZSAhPSBEUk1fUExBTkVfVFlQRV9DVVJTT1IpDQogCQlkb21haW4gPSBhbWRncHVfZGlzcGxheV9z
dXBwb3J0ZWRfZG9tYWlucyhhZGV2KTsNCkBAIC00MjA1LDIxICs0MjE2LDIxIEBAIHN0YXRpYyBp
bnQgZG1fcGxhbmVfaGVscGVyX3ByZXBhcmVfZmIoc3RydWN0IGRybV9wbGFuZSAqcGxhbmUsDQog
CWlmICh1bmxpa2VseShyICE9IDApKSB7DQogCQlpZiAociAhPSAtRVJFU1RBUlRTWVMpDQogCQkJ
RFJNX0VSUk9SKCJGYWlsZWQgdG8gcGluIGZyYW1lYnVmZmVyIHdpdGggZXJyb3IgJWRcbiIsIHIp
Ow0KLQkJYW1kZ3B1X2JvX3VucmVzZXJ2ZShyYm8pOw0KKwkJdHRtX2V1X2JhY2tvZmZfcmVzZXJ2
YXRpb24oJnRpY2tldCwgJmxpc3QpOw0KIAkJcmV0dXJuIHI7DQogCX0NCiANCiAJciA9IGFtZGdw
dV90dG1fYWxsb2NfZ2FydCgmcmJvLT50Ym8pOw0KIAlpZiAodW5saWtlbHkociAhPSAwKSkgew0K
IAkJYW1kZ3B1X2JvX3VucGluKHJibyk7DQotCQlhbWRncHVfYm9fdW5yZXNlcnZlKHJibyk7DQor
CQl0dG1fZXVfYmFja29mZl9yZXNlcnZhdGlvbigmdGlja2V0LCAmbGlzdCk7DQogCQlEUk1fRVJS
T1IoIiVwIGJpbmQgZmFpbGVkXG4iLCByYm8pOw0KIAkJcmV0dXJuIHI7DQogCX0NCiANCiAJYW1k
Z3B1X2JvX2dldF90aWxpbmdfZmxhZ3MocmJvLCAmdGlsaW5nX2ZsYWdzKTsNCiANCi0JYW1kZ3B1
X2JvX3VucmVzZXJ2ZShyYm8pOw0KKwl0dG1fZXVfYmFja29mZl9yZXNlcnZhdGlvbigmdGlja2V0
LCAmbGlzdCk7DQogDQogCWFmYi0+YWRkcmVzcyA9IGFtZGdwdV9ib19ncHVfb2Zmc2V0KHJibyk7
DQogDQotLSANCjIuMTcuMQ0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
