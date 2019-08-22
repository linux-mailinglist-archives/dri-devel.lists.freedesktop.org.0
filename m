Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27457994F1
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 15:27:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 928236EB31;
	Thu, 22 Aug 2019 13:26:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam03on0609.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe49::609])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85AED6EB30;
 Thu, 22 Aug 2019 13:26:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OGtKcJv41zl3jLj1paTukJO2xnEHsGZ47VveNB8sQ32TOyWEbLlhYfldJ3EIrjjh0SpESg2qM5H1cRjYU3uWuvcfNViHtShb63jKMHDmgdBTTmuqR65gqUZEVPrfF57FcL27Xgum33QOmeoCKlL3CsvP2eydsdqKlFa4SVFmli6ZlhBpeDmhg4hNr00xlLgGOWmusL6A3Wt3oOkdo6WDNpcCLUiiFHCetc+oObpQt+AxZBe2NtSKnxokHhL+W2IRhOE4zR4tqed2fKeQ4gpgW5xPWtWxVE6uYLVI5g8VZw2cm2vHxwWauNwhV6Vem0EHiyjNSiU8P18rJnDoFssZGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3H4G6LCzrQ617VDYctyfLGG5LHGK7ZfBvkQc2Tfv6zc=;
 b=iXySQ/tTe/pyQ1cbEZxQ9ZbP3ytlQhh0QGQwIv1+rXj7B7Hf86E3p0DeTZJGy2dV8JjMuEWMGAmLf1CSUeoHN3ftTVHAQIZb2B5uG/DblRMqkyZUfmyB/P2b13b57+LLvga9aEB8Bf2OhbNPuuFQKhMoOso2/INZDB2fYNXaXkq6gvglVb+gqq+ODVpe81d7pGNG/m7bDyFJjGOeeLvFYzs8OzlqXYrlxD0jwj2E8d8iUOoaWWeIQuhIa3+apWq5hBoA7xlYUM+li9gpFoq2bIHO2DKlHbwA6ToUUvkl1TGKrpC0X2nzv5u/o8/CJ1hKWWrpUIEaH8opDUaEHu11ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN8PR12MB3217.namprd12.prod.outlook.com (20.179.67.158) by
 BN8PR12MB3329.namprd12.prod.outlook.com (20.178.208.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Thu, 22 Aug 2019 13:26:56 +0000
Received: from BN8PR12MB3217.namprd12.prod.outlook.com
 ([fe80::78ee:f1aa:4477:4b77]) by BN8PR12MB3217.namprd12.prod.outlook.com
 ([fe80::78ee:f1aa:4477:4b77%7]) with mapi id 15.20.2178.018; Thu, 22 Aug 2019
 13:26:56 +0000
From: "Francis, David" <David.Francis@amd.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v3 13/16] drm/amd/display: Validate DSC caps on MST
 endpoints
Thread-Topic: [PATCH v3 13/16] drm/amd/display: Validate DSC caps on MST
 endpoints
Thread-Index: AQHVWFtDrTLRYFcrDUmSsgLe7sWVD6cHKcSK
Date: Thu, 22 Aug 2019 13:26:55 +0000
Message-ID: <BN8PR12MB3217E79658514D777D0CFB1BEFA50@BN8PR12MB3217.namprd12.prod.outlook.com>
References: <20190821200129.11575-1-David.Francis@amd.com>,
 <20190821200129.11575-14-David.Francis@amd.com>
In-Reply-To: <20190821200129.11575-14-David.Francis@amd.com>
Accept-Language: en-CA, en-US
Content-Language: en-CA
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7efc42ad-7025-45dc-0b89-08d72704672b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:BN8PR12MB3329; 
x-ms-traffictypediagnostic: BN8PR12MB3329:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN8PR12MB33294A8EC64A6CE0DA090F43EFA50@BN8PR12MB3329.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 01371B902F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(136003)(366004)(346002)(376002)(189003)(199004)(66946007)(76116006)(316002)(6246003)(14454004)(14444005)(256004)(54906003)(110136005)(486006)(6436002)(66556008)(66476007)(64756008)(186003)(66446008)(8676002)(446003)(81156014)(71190400001)(81166006)(71200400001)(2906002)(9686003)(476003)(53936002)(11346002)(478600001)(25786009)(4326008)(66066001)(33656002)(2501003)(55016002)(15650500001)(52536014)(7696005)(53546011)(6506007)(305945005)(5660300002)(450100002)(3846002)(6116002)(8936002)(76176011)(26005)(7736002)(86362001)(74316002)(99286004)(229853002)(102836004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3329;
 H:BN8PR12MB3217.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: IE7+slvBD8tscRh+KBrWb3Izcj8Il9YdlM/rWgckZRoNJw6UAbue7097ONgnU1mT/9nzq+xDBGyf9XppKqI7bQLac8E2D961qjs2IDthWBrtka7oG4FAA+/DvMURe2s9g7ONGHKnFEaAfxISTnQXhFHifdvFfLMmFTYixvt76YPhk8AB43iZ3oFtW2EmH4x8+uE9J1/qTgv79W6VThlQZ/X6h2ORTyOWKWk3Emc/WyM/p2n23XUuu7y/YZzuxdmbGnzlD+DcfMPqBf9wOpl8bfr8igL53mB4IubOAjkD/LB67Z9NJC54+wg55GjoN1tAm0Tppt2zEW7qJ/M4a01bTF11XGPAgDWu+fqllupfn621EKM/xzB1qdZFqni1fzGkn3AM5eumemqkxFNR9aCiR6YFJPJDD9NLrBHQp60CoJg=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7efc42ad-7025-45dc-0b89-08d72704672b
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2019 13:26:55.8802 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UUxTgTXbqG56d7jbCJlI2ytilqqrk8g7z42ZZmPcvp1Q9fJkW6ECOJIkDKhF79kE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3329
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3H4G6LCzrQ617VDYctyfLGG5LHGK7ZfBvkQc2Tfv6zc=;
 b=1bOX5GyzL0VsJdylUVxAPXDt0Qij3HV9Yu8LbLWQX7HHhV7RhL7eUEbF66/Oqg8rUHZfWwRj7zVf6JtwP7wJayQkIwcTMsomzfEkV2ocjt29hvV80qR9B5VNE/fMm9kbPfNuhd3IZl4KZFfo5wXSrqVB4dYSPPL7TIFV1OgqOOc=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=David.Francis@amd.com; 
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
Cc: "Liu, Wenjing" <Wenjing.Liu@amd.com>, "Cornij,
 Nikola" <Nikola.Cornij@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2hvb3BzLCBsZWZ0IGluIGEgdGVzdCBwcmludC4gIElnbm9yZSB0aGlzIHBhdGNoCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkZyb206IERhdmlkIEZyYW5jaXMgPERh
dmlkLkZyYW5jaXNAYW1kLmNvbT4KU2VudDogQXVndXN0IDIxLCAyMDE5IDQ6MDEgUE0KVG86IGRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCkNjOiBGcmFuY2lzLCBEYXZpZDsgTGl1LCBXZW5qaW5nOyBDb3JuaWosIE5pa29sYQpTdWJq
ZWN0OiBbUEFUQ0ggdjMgMTMvMTZdIGRybS9hbWQvZGlzcGxheTogVmFsaWRhdGUgRFNDIGNhcHMg
b24gTVNUIGVuZHBvaW50cwoKRHVyaW5nIE1TVCBtb2RlIGVudW1lcmF0aW9uLCBpZiBhIG5ldyBk
Y19zaW5rIGlzIGNyZWF0ZWQsCnBvcHVsYXRlIGl0IHdpdGggZHNjIGNhcHMgYXMgYXBwcm9wcmlh
dGUuCgpVc2UgZHJtX2RwX21zdF9kc2NfY2Fwc19mb3JfcG9ydCB0byBnZXQgdGhlIHJhdyBjYXBz
LAp0aGVuIHBhcnNlIHRoZW0gb250byBkY19zaW5rIHdpdGggZGNfZHNjX3BhcnNlX2RzY19kcGNk
LgoKQ2M6IFdlbmppbmcgTGl1IDxXZW5qaW5nLkxpdUBhbWQuY29tPgpDYzogTmlrb2xhIENvcm5p
aiA8Tmlrb2xhLkNvcm5pakBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBEYXZpZCBGcmFuY2lzIDxE
YXZpZC5GcmFuY2lzQGFtZC5jb20+Ci0tLQogLi4uL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9k
bV9tc3RfdHlwZXMuYyAgIHwgMjcgKysrKysrKysrKysrKysrKysrLQogMSBmaWxlIGNoYW5nZWQs
IDI2IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9tc3RfdHlwZXMuYyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX21zdF90eXBlcy5jCmlu
ZGV4IDE2MjE4YTIwMmI1OS4uOTk3OGMxYTAxZWI3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9tc3RfdHlwZXMuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9tc3RfdHlwZXMuYwpA
QCAtMjUsNiArMjUsNyBAQAoKICNpbmNsdWRlIDxsaW51eC92ZXJzaW9uLmg+CiAjaW5jbHVkZSA8
ZHJtL2RybV9hdG9taWNfaGVscGVyLmg+CisjaW5jbHVkZSA8ZHJtL2RybV9kcF9tc3RfaGVscGVy
Lmg+CiAjaW5jbHVkZSAiZG1fc2VydmljZXMuaCIKICNpbmNsdWRlICJhbWRncHUuaCIKICNpbmNs
dWRlICJhbWRncHVfZG0uaCIKQEAgLTE4OSw2ICsxOTAsMjQgQEAgc3RhdGljIGNvbnN0IHN0cnVj
dCBkcm1fY29ubmVjdG9yX2Z1bmNzIGRtX2RwX21zdF9jb25uZWN0b3JfZnVuY3MgPSB7CiAgICAg
ICAgLmVhcmx5X3VucmVnaXN0ZXIgPSBhbWRncHVfZG1fbXN0X2Nvbm5lY3Rvcl9lYXJseV91bnJl
Z2lzdGVyLAogfTsKCisjaWZkZWYgQ09ORklHX0RSTV9BTURfRENfRFNDX1NVUFBPUlQKK3N0YXRp
YyBib29sIHZhbGlkYXRlX2RzY19jYXBzX29uX2Nvbm5lY3RvcihzdHJ1Y3QgYW1kZ3B1X2RtX2Nv
bm5lY3RvciAqYWNvbm5lY3RvcikKK3sKKyAgICAgICBzdHJ1Y3QgZGNfc2luayAqZGNfc2luayA9
IGFjb25uZWN0b3ItPmRjX3Npbms7CisgICAgICAgc3RydWN0IGRybV9kcF9tc3RfcG9ydCAqcG9y
dCA9IGFjb25uZWN0b3ItPnBvcnQ7CisgICAgICAgdTggZHNjX2NhcHNbMTZdID0geyAwIH07CisK
KyAgICAgICBpZiAoZHJtX2RwX21zdF9kc2NfY2Fwc19mb3JfcG9ydChwb3J0LCBkc2NfY2Fwcykg
PCAwKQorICAgICAgICAgICAgICAgcmV0dXJuIGZhbHNlOworCisgICAgICAgcHJpbnRrKCJWYWxp
ZGF0ZWQgRFNDIGNhcHMgMHgleCIsIGRzY19jYXBzWzBdKTsKKyAgICAgICBpZiAoIWRjX2RzY19w
YXJzZV9kc2NfZHBjZChkc2NfY2FwcywgTlVMTCwgJmRjX3NpbmstPnNpbmtfZHNjX2NhcHMuZHNj
X2RlY19jYXBzKSkKKyAgICAgICAgICAgICAgIHJldHVybiBmYWxzZTsKKworICAgICAgIHJldHVy
biB0cnVlOworfQorI2VuZGlmCisKIHN0YXRpYyBpbnQgZG1fZHBfbXN0X2dldF9tb2RlcyhzdHJ1
Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQogewogICAgICAgIHN0cnVjdCBhbWRncHVfZG1f
Y29ubmVjdG9yICphY29ubmVjdG9yID0gdG9fYW1kZ3B1X2RtX2Nvbm5lY3Rvcihjb25uZWN0b3Ip
OwpAQCAtMjMxLDEwICsyNTAsMTYgQEAgc3RhdGljIGludCBkbV9kcF9tc3RfZ2V0X21vZGVzKHN0
cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IpCiAgICAgICAgICAgICAgICAvKiBkY19saW5r
X2FkZF9yZW1vdGVfc2luayByZXR1cm5zIGEgbmV3IHJlZmVyZW5jZSAqLwogICAgICAgICAgICAg
ICAgYWNvbm5lY3Rvci0+ZGNfc2luayA9IGRjX3Npbms7CgotICAgICAgICAgICAgICAgaWYgKGFj
b25uZWN0b3ItPmRjX3NpbmspCisgICAgICAgICAgICAgICBpZiAoYWNvbm5lY3Rvci0+ZGNfc2lu
aykgewogICAgICAgICAgICAgICAgICAgICAgICBhbWRncHVfZG1fdXBkYXRlX2ZyZWVzeW5jX2Nh
cHMoCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25uZWN0b3IsIGFj
b25uZWN0b3ItPmVkaWQpOwoKKyNpZmRlZiBDT05GSUdfRFJNX0FNRF9EQ19EU0NfU1VQUE9SVAor
ICAgICAgICAgICAgICAgICAgICAgICBpZiAoIXZhbGlkYXRlX2RzY19jYXBzX29uX2Nvbm5lY3Rv
cihhY29ubmVjdG9yKSkKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBtZW1zZXQoJmFj
b25uZWN0b3ItPmRjX3NpbmstPnNpbmtfZHNjX2NhcHMsCisgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIDAsIHNpemVvZihhY29ubmVjdG9yLT5kY19zaW5rLT5zaW5rX2RzY19j
YXBzKSk7CisjZW5kaWYKKyAgICAgICAgICAgICAgIH0KICAgICAgICB9CgogICAgICAgIGRybV9j
b25uZWN0b3JfdXBkYXRlX2VkaWRfcHJvcGVydHkoCi0tCjIuMTcuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
