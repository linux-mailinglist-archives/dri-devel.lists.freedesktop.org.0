Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6A9BDF44
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2019 15:45:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ACDB6EBB8;
	Wed, 25 Sep 2019 13:45:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam05on0615.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe51::615])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26CFC6EBB5;
 Wed, 25 Sep 2019 13:45:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H3dQSCLMkfwv8fJYb1XFx6x0NuO1/BOKtA+HbostBw0yCCbfuduzOUE1MEj1iP8HpLzkURygsCxNkvKPEGXsbJYWuOzI5T898AT9dgqL6FNUDQKB6IGddMPhBmgjzG4cFZH1ST2KNfw0noRpgUpi9lDRwylCcSclw6PiMfKMi0qXdRLiQd3NrF/0P/Zt/4QAfheqafJz8p6ARukpQX3LDQeeGEab5KAGKDz0RNuFvwHG1qJw7HaWMOY143PYK2WBtXpL4R436sagGzXQZwEQzEVxZeaz5xkzoGFAUr1IDsp0GvPNpIOsU/C5RxWMPrBfcRANjxlJjSxtTPE1Ft2DSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hmeqChAxyqwO6NZ57JnGwuzmZVA61vyphC0q9AzXQBQ=;
 b=VI3pulX9du8lZ1xy8RhLKKjir3dVcE08euRxwgV0srXZ9tG3e4Vh+qFyDHdbnvmfR5TsVbeYLApb5JPxreDwLTG33ZI4dvHb8ouRrXXf8Jrx4yJQKzYYy97o3pawEtgQr8VYbHJ6eOq4mBgOO0sUwojcitC1GSGybU8dwPCmNMNEqjWupc5Ogje4dE4HnfE8+d1sOvBk4yB8ohxBYBnZDdgDLW8quoAr4CArPMfxEW4OYNFe51EltgSljRKr7uKeYLbYltq31ZrQAA9xDNrR2ePh4JLGVNddgpJmFdeJUjENdqE3/QI3vsbU2MSUyt2zqbDycrSrtt+2jXcj8zp9MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3309.namprd12.prod.outlook.com (20.179.83.157) by
 MN2PR12MB4304.namprd12.prod.outlook.com (10.255.224.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Wed, 25 Sep 2019 13:45:21 +0000
Received: from MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::e105:cd24:c71d:c38d]) by MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::e105:cd24:c71d:c38d%4]) with mapi id 15.20.2305.016; Wed, 25 Sep 2019
 13:45:21 +0000
From: "Huang, Ray" <Ray.Huang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: [PATCH v2 04/11] drm/amdgpu: add tmz feature parameter (v2)
Thread-Topic: [PATCH v2 04/11] drm/amdgpu: add tmz feature parameter (v2)
Thread-Index: AQHVc6d5LDMLCCkjDkuRHVizXsCgBw==
Date: Wed, 25 Sep 2019 13:45:21 +0000
Message-ID: <1569419090-5304-5-git-send-email-ray.huang@amd.com>
References: <1569419090-5304-1-git-send-email-ray.huang@amd.com>
In-Reply-To: <1569419090-5304-1-git-send-email-ray.huang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-clientproxiedby: HK2PR02CA0186.apcprd02.prod.outlook.com
 (2603:1096:201:21::22) To MN2PR12MB3309.namprd12.prod.outlook.com
 (2603:10b6:208:106::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 970b6585-b1ce-49f6-227c-08d741be9bec
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB4304; 
x-ms-traffictypediagnostic: MN2PR12MB4304:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB4304185CD746CA19488D9605EC870@MN2PR12MB4304.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 01713B2841
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(376002)(346002)(396003)(366004)(189003)(199004)(86362001)(8936002)(305945005)(2501003)(50226002)(6636002)(256004)(6486002)(6116002)(3846002)(6436002)(6512007)(2906002)(4326008)(66066001)(102836004)(26005)(186003)(52116002)(76176011)(486006)(476003)(2616005)(11346002)(66946007)(66476007)(66556008)(64756008)(66446008)(446003)(99286004)(5660300002)(81156014)(6506007)(81166006)(450100002)(25786009)(36756003)(316002)(478600001)(386003)(8676002)(71190400001)(71200400001)(110136005)(54906003)(7736002)(14454004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4304;
 H:MN2PR12MB3309.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /GsgYH95H5H81Oc8htWRS+AgY9v9/gnZR5Bz0CU/drzcijVK0JRm467yz9MY43fZo/us2Ct0u/9blvfW7y/IIRAFu1a6KH9ajmkLDle0YsSRWre7bDnEPem/tp0LmBXj2GhFPBRg1B45GGRN7TkkaZlegSAuM8d7K8HcDyFVrjkVjOBnsYkQ3ToPR24MsqnWmTZDo21U70OQAtveRaEdPgzMCsSoKtfOY+M29tUZxybgoig0iD/M7yiT0uidRN4I7+uT3r+l3mM0BIX7AwqH/+BHh/Id2UTsQ0ykxh0HNf8QqWRnol6ZjifvF8UGoPjLxUyMp3T37pTc5j9lVoKcHQvXnEhQhCo5rcXIytNHZj2IrXmsuvCQrAcgH/ZMmhixDe18nGIdgg1ALPju4IxFxb9VN6xNYQIXi2pnIE2rui4=
Content-ID: <F7DE9556A9D14D4DAD2B02B6AA6DC091@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 970b6585-b1ce-49f6-227c-08d741be9bec
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2019 13:45:21.4928 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /tWIgWEf2XhtDEzNbe5s4GLNCYw9g4pG8Wi/GVDT3HjZwpZuOwdGeXNGm3ItJFc5Oc/FFVCFauWCxOOAlK793w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4304
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hmeqChAxyqwO6NZ57JnGwuzmZVA61vyphC0q9AzXQBQ=;
 b=aNy3Gk5E3sFY66d3K0P5vhLN0Rl0KwfwwrsoW5rGo/mllJ4sBtm5kovRM0fuImZnBAJ07v1X2/X50DmYJ4tRkEKaVrRX+vXkvPZ/ODs1NjLy7D2FuKcB5sNXYiGGHjVrzg2hy74nukU3Op8YWSBKN+vNdkEpmB+VsXmLRK7qwws=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Ray.Huang@amd.com; 
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
Cc: "Tuikov, Luben" <Luben.Tuikov@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>, "Liu,
 Aaron" <Aaron.Liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaCBhZGRzIHRteiBwYXJhbWV0ZXIgdG8gZW5hYmxlL2Rpc2FibGUgdGhlIGZlYXR1
cmUgaW4gdGhlIGFtZGdwdSBrZXJuZWwNCm1vZHVsZS4gTm9tYWxseSwgYnkgZGVmYXVsdCwgaXQg
c2hvdWxkIGJlIGF1dG8gKHJlbHkgb24gdGhlIGhhcmR3YXJlDQpjYXBhYmlsaXR5KS4NCg0KQnV0
IHJpZ2h0IG5vdywgaXQgbmVlZCB0byBzZXQgIm9mZiIgdG8gYXZvaWQgYnJlYWtpbmcgb3RoZXIg
ZGV2ZWxvcGVycycNCndvcmsgYmVjYXVzZSBpdCdzIG5vdCB0b3RhbGx5IGNvbXBsZXRlZC4NCg0K
V2lsbCBzZXQgImF1dG8iIHRpbGwgdGhlIGZlYXR1cmUgaXMgc3RhYmxlIGFuZCBjb21wbGV0ZWx5
IHZlcmlmaWVkLg0KDQp2MjogYWRkICJhdXRvIiBvcHRpb24gZm9yIGZ1dHVyZSB1c2UuDQoNClNp
Z25lZC1vZmYtYnk6IEh1YW5nIFJ1aSA8cmF5Lmh1YW5nQGFtZC5jb20+DQpSZXZpZXdlZC1ieTog
QWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPg0KUmV2aWV3ZWQtYnk6IENo
cmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4NCi0tLQ0KIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oICAgICB8ICAxICsNCiBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMgfCAxMSArKysrKysrKysrKw0KIDIgZmlsZXMgY2hhbmdl
ZCwgMTIgaW5zZXJ0aW9ucygrKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1LmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaA0KaW5k
ZXggYTE1MTZhMy4uOTMwNjQzYyAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdS5oDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaA0K
QEAgLTE3Miw2ICsxNzIsNyBAQCBleHRlcm4gaW50IGFtZGdwdV9mb3JjZV9hc2ljX3R5cGU7DQog
I2lmZGVmIENPTkZJR19IU0FfQU1EDQogZXh0ZXJuIGludCBzY2hlZF9wb2xpY3k7DQogI2VuZGlm
DQorZXh0ZXJuIGludCBhbWRncHVfdG16Ow0KIA0KICNpZmRlZiBDT05GSUdfRFJNX0FNREdQVV9T
SQ0KIGV4dGVybiBpbnQgYW1kZ3B1X3NpX3N1cHBvcnQ7DQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2Rydi5jDQppbmRleCA2OTc4ZDE3Li42MDZmMWQzIDEwMDY0NA0KLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jDQorKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMNCkBAIC0xNDUsNiArMTQ1LDcgQEAgaW50IGFtZGdw
dV9kaXNjb3ZlcnkgPSAtMTsNCiBpbnQgYW1kZ3B1X21lcyA9IDA7DQogaW50IGFtZGdwdV9ub3Jl
dHJ5ID0gMTsNCiBpbnQgYW1kZ3B1X2ZvcmNlX2FzaWNfdHlwZSA9IC0xOw0KK2ludCBhbWRncHVf
dG16ID0gMDsNCiANCiBzdHJ1Y3QgYW1kZ3B1X21ncHVfaW5mbyBtZ3B1X2luZm8gPSB7DQogCS5t
dXRleCA9IF9fTVVURVhfSU5JVElBTElaRVIobWdwdV9pbmZvLm11dGV4KSwNCkBAIC03NTIsNiAr
NzUzLDE2IEBAIHVpbnQgYW1kZ3B1X2RtX2FibV9sZXZlbCA9IDA7DQogTU9EVUxFX1BBUk1fREVT
QyhhYm1sZXZlbCwgIkFCTSBsZXZlbCAoMCA9IG9mZiAoZGVmYXVsdCksIDEtNCA9IGJhY2tsaWdo
dCByZWR1Y3Rpb24gbGV2ZWwpICIpOw0KIG1vZHVsZV9wYXJhbV9uYW1lZChhYm1sZXZlbCwgYW1k
Z3B1X2RtX2FibV9sZXZlbCwgdWludCwgMDQ0NCk7DQogDQorLyoqDQorICogRE9DOiB0bXogKGlu
dCkNCisgKiBUcnVzdCBNZW1vcnkgWm9uZSAoVE1aKSBpcyBhIG1ldGhvZCB0byBwcm90ZWN0IHRo
ZSBjb250ZW50cyBiZWluZyB3cml0dGVuIHRvDQorICogYW5kIHJlYWQgZnJvbSBtZW1vcnkuDQor
ICoNCisgKiBUaGUgZGVmYXVsdCB2YWx1ZTogMCAob2ZmKS4gIFRPRE86IGNoYW5nZSB0byBhdXRv
IHRpbGwgaXQgaXMgY29tcGxldGVkLg0KKyAqLw0KK01PRFVMRV9QQVJNX0RFU0ModG16LCAiRW5h
YmxlIFRNWiBmZWF0dXJlICgtMSA9IGF1dG8sIDAgPSBvZmYgKGRlZmF1bHQpLCAxID0gb24pIik7
DQorbW9kdWxlX3BhcmFtX25hbWVkKHRteiwgYW1kZ3B1X3RteiwgaW50LCAwNDQ0KTsNCisNCiBz
dGF0aWMgY29uc3Qgc3RydWN0IHBjaV9kZXZpY2VfaWQgcGNpaWRsaXN0W10gPSB7DQogI2lmZGVm
ICBDT05GSUdfRFJNX0FNREdQVV9TSQ0KIAl7MHgxMDAyLCAweDY3ODAsIFBDSV9BTllfSUQsIFBD
SV9BTllfSUQsIDAsIDAsIENISVBfVEFISVRJfSwNCi0tIA0KMi43LjQNCg0KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
