Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B0071F1B
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 20:22:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A86EC6E358;
	Tue, 23 Jul 2019 18:22:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00084.outbound.protection.outlook.com [40.107.0.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E9B189F89;
 Tue, 23 Jul 2019 14:54:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WJf+0/uq2SjX1VN6KNu+HWXUznvleLGlyAWWpN5Y2Cv+GA7PeqJkWe+B4iN+po63ZAkUQnLcPQJp40GuRl/XL+57A36Ok6DbOYEsak0jHkhvHa5ACylwE/pwMV7oIojjEIW+/i89xOjIDLRZCkPoOwvk5dUmKwth/tkNVXv5nnZpQN2uz9yaV3lc2knbiXKjaMwUrovzIHOu7DKxAYhRE5yxws/zPZtN9DCRW/W0AQPO2X6XAKRNUmdddrN5cE3esi84EIDcqc61UZKbcJ6TsFP1/1y9ZcuyJtUEdpwt+59mn7zq2zjorK1V5LCL16yxh1ym1CmqXP7ioyIHRfK/wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4mMIkWPy7OlbnNwE8X8tiEOFqH0MXBd3HY7q9oa8rY8=;
 b=XX9FppSk0lpwyOgUgp2lxtJdMH5UuA1HWFCT2OgAOuKZgyPhEDNW4BhxUCguKFAy0d1M6A7FhWilbfgWbpKgDcfvBzy/eShyIf6HIBjmjFsbwy43XmuuC6+qsPEMkpQon90zzgpIufH6fwIOSgaXShZqkfwnVWylPFG+uIq+l+5g373lpbJpPZQWjE/KPkC3MmuNsDxFkl2Xb8vdmtJBpqU3SbRzjiauuHE3P0EyzYtXvX7YiI71hV7bAsxTb6m3XvnU/74UyoY4rhCc0Q4l3nBPsuxwUbi0e7g+t2/DrnGC0zD6+DpBdSdAOelsm4upNW4GyvwGV5k6LS+6zvzy9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=mellanox.com;dmarc=pass action=none
 header.from=mellanox.com;dkim=pass header.d=mellanox.com;arc=none
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (10.171.182.144) by
 VI1PR05MB3472.eurprd05.prod.outlook.com (10.170.239.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Tue, 23 Jul 2019 14:54:45 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::5c6f:6120:45cd:2880]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::5c6f:6120:45cd:2880%4]) with mapi id 15.20.2094.013; Tue, 23 Jul 2019
 14:54:45 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Souptick Joarder <jrdr.linux@gmail.com>
Subject: Re: [PATCH 1/6] mm: always return EBUSY for invalid ranges in
 hmm_range_{fault,snapshot}
Thread-Topic: [PATCH 1/6] mm: always return EBUSY for invalid ranges in
 hmm_range_{fault,snapshot}
Thread-Index: AQHVQHIRs6fGZEVop06hMQcrvsZ8NqbWtRqAgAGXHoA=
Date: Tue, 23 Jul 2019 14:54:45 +0000
Message-ID: <20190723145441.GI15331@mellanox.com>
References: <20190722094426.18563-1-hch@lst.de>
 <20190722094426.18563-2-hch@lst.de>
 <CAFqt6zY8zWAmc-VTrZ1KxQPBCdbTxmZy_tq2-OkUi3TVrfp7Og@mail.gmail.com>
In-Reply-To: <CAFqt6zY8zWAmc-VTrZ1KxQPBCdbTxmZy_tq2-OkUi3TVrfp7Og@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MN2PR15CA0003.namprd15.prod.outlook.com
 (2603:10b6:208:1b4::16) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:4d::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [156.34.55.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d966fda0-338e-478c-42a1-08d70f7db38f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR05MB3472; 
x-ms-traffictypediagnostic: VI1PR05MB3472:
x-microsoft-antispam-prvs: <VI1PR05MB347230E82CADE677CF76D105CFC70@VI1PR05MB3472.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0107098B6C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(366004)(376002)(136003)(39860400002)(199004)(189003)(3846002)(52116002)(8676002)(86362001)(4326008)(14444005)(6512007)(5660300002)(36756003)(6246003)(64756008)(54906003)(478600001)(66446008)(7416002)(53936002)(66556008)(66476007)(305945005)(7736002)(68736007)(25786009)(256004)(66946007)(6116002)(476003)(486006)(81166006)(33656002)(81156014)(11346002)(1076003)(6486002)(6916009)(2616005)(2906002)(76176011)(8936002)(6436002)(71200400001)(71190400001)(316002)(186003)(6506007)(14454004)(53546011)(386003)(446003)(66066001)(229853002)(99286004)(102836004)(26005)(142933001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB3472;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: cJYSJS2lynI+8NSitY0FCPF3DUkNFAV9rRYTDScuv0IEZyNwhUTOooWDYj2xi0xGXE3/oMIvdp7ZHywr0NO2Zklirmi83UxUGZsHZLBriJog+mCFGxkkPNbNbYM8HynGZeKbNPuWrGdmNbJR1POj87XJ9HqDsIJ6+Rzk5U3sb5rBYCw7cXdsReBv4kLS2ipscGz1zpHloPKnWfrm5yasb+YL7Obs74wYRn868EhdOQwLte3hQNWWExU78jtuMPdy6MvtixZmTXbrheElthkZAmU45ShPGsC920dg8ldAyWFsfFo1gkyg8dMxngwKBEzc9PiCsk2pD3L1RCBmFzsdxujyg4fIQTTBqcOveNHDooi/ki2rqYBCv0xzGO5VkBzrRW1Y0X+tFjyZxl1Uy3QPkDxI6Es1212yFeCGnjy6s60=
Content-ID: <84AEF1430B5CAF409CC0D62618B7407E@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d966fda0-338e-478c-42a1-08d70f7db38f
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2019 14:54:45.5342 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jgg@mellanox.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB3472
X-Mailman-Approved-At: Tue, 23 Jul 2019 18:22:04 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4mMIkWPy7OlbnNwE8X8tiEOFqH0MXBd3HY7q9oa8rY8=;
 b=hv4zF8aV5+O2OvGuMKH+i3y9edejOgSdsLgoBQ/n3o5GHjzSWTwL2LnZgPrmnwg/vFmwhWzztAvFJMRWWuzXvyK2SynNlC8ofn8LEwPBrvHXF3Tlk19NJCPMaxhYpoTZgXtKa2hk8MwiJdIv+yxZO0B7Zwv04VPwR2bAjBkmBzE=
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
 Felix Kuehling <Felix.Kuehling@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Linux-MM <linux-mm@kvack.org>,
 =?iso-8859-1?Q?J=E9r=F4me_Glisse?= <jglisse@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgMjIsIDIwMTkgYXQgMDg6MDc6MzNQTSArMDUzMCwgU291cHRpY2sgSm9hcmRl
ciB3cm90ZToKPiBPbiBNb24sIEp1bCAyMiwgMjAxOSBhdCAzOjE0IFBNIENocmlzdG9waCBIZWxs
d2lnIDxoY2hAbHN0LmRlPiB3cm90ZToKPiA+Cj4gPiBXZSBzaG91bGQgbm90IGhhdmUgdHdvIGRp
ZmZlcmVudCBlcnJvciBjb2RlcyBmb3IgdGhlIHNhbWUgY29uZGl0aW9uLiAgSW4KPiA+IGFkZGl0
aW9uIHRoaXMgcmVhbGx5IGNvbXBsaWNhdGVzIHRoZSBjb2RlIGR1ZSB0byB0aGUgc3BlY2lhbCBo
YW5kbGluZyBvZgo+ID4gRUFHQUlOIHRoYXQgZHJvcHMgdGhlIG1tYXBfc2VtIGR1ZSB0byB0aGUg
RkFVTFRfRkxBR19BTExPV19SRVRSWSBsb2dpYwo+ID4gaW4gdGhlIGNvcmUgdm0uCj4gPgo+ID4g
U2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Cj4gPiBSZXZpZXdl
ZC1ieTogUmFscGggQ2FtcGJlbGwgPHJjYW1wYmVsbEBudmlkaWEuY29tPgo+ID4gUmV2aWV3ZWQt
Ynk6IEZlbGl4IEt1ZWhsaW5nIDxGZWxpeC5LdWVobGluZ0BhbWQuY29tPgo+ID4gIERvY3VtZW50
YXRpb24vdm0vaG1tLnJzdCB8ICAyICstCj4gPiAgbW0vaG1tLmMgICAgICAgICAgICAgICAgIHwg
MTAgKysrKy0tLS0tLQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA3IGRl
bGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL3ZtL2htbS5yc3Qg
Yi9Eb2N1bWVudGF0aW9uL3ZtL2htbS5yc3QKPiA+IGluZGV4IDdkOTA5NjRhYmJiMC4uNzEwY2Ux
YzcwMWJmIDEwMDY0NAo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi92bS9obW0ucnN0Cj4gPiBAQCAt
MjM3LDcgKzIzNyw3IEBAIFRoZSB1c2FnZSBwYXR0ZXJuIGlzOjoKPiA+ICAgICAgICByZXQgPSBo
bW1fcmFuZ2Vfc25hcHNob3QoJnJhbmdlKTsKPiA+ICAgICAgICBpZiAocmV0KSB7Cj4gPiAgICAg
ICAgICAgIHVwX3JlYWQoJm1tLT5tbWFwX3NlbSk7Cj4gPiAtICAgICAgICAgIGlmIChyZXQgPT0g
LUVBR0FJTikgewo+ID4gKyAgICAgICAgICBpZiAocmV0ID09IC1FQlVTWSkgewo+ID4gICAgICAg
ICAgICAgIC8qCj4gPiAgICAgICAgICAgICAgICogTm8gbmVlZCB0byBjaGVjayBobW1fcmFuZ2Vf
d2FpdF91bnRpbF92YWxpZCgpIHJldHVybiB2YWx1ZQo+ID4gICAgICAgICAgICAgICAqIG9uIHJl
dHJ5IHdlIHdpbGwgZ2V0IHByb3BlciBlcnJvciB3aXRoIGhtbV9yYW5nZV9zbmFwc2hvdCgpCj4g
PiBkaWZmIC0tZ2l0IGEvbW0vaG1tLmMgYi9tbS9obW0uYwo+ID4gaW5kZXggZTFlZWRlZjEyOWNm
Li4xNmI2NzMxYTM0ZGIgMTAwNjQ0Cj4gPiArKysgYi9tbS9obW0uYwo+ID4gQEAgLTk0Niw3ICs5
NDYsNyBAQCBFWFBPUlRfU1lNQk9MKGhtbV9yYW5nZV91bnJlZ2lzdGVyKTsKPiA+ICAgKiBAcmFu
Z2U6IHJhbmdlCj4gPiAgICogUmV0dXJuOiAtRUlOVkFMIGlmIGludmFsaWQgYXJndW1lbnQsIC1F
Tk9NRU0gb3V0IG9mIG1lbW9yeSwgLUVQRVJNIGludmFsaWQKPiA+ICAgKiAgICAgICAgICBwZXJt
aXNzaW9uIChmb3IgaW5zdGFuY2UgYXNraW5nIGZvciB3cml0ZSBhbmQgcmFuZ2UgaXMgcmVhZCBv
bmx5KSwKPiA+IC0gKiAgICAgICAgICAtRUFHQUlOIGlmIHlvdSBuZWVkIHRvIHJldHJ5LCAtRUZB
VUxUIGludmFsaWQgKGllIGVpdGhlciBubyB2YWxpZAo+ID4gKyAqICAgICAgICAgIC1FQlVTWSBp
ZiB5b3UgbmVlZCB0byByZXRyeSwgLUVGQVVMVCBpbnZhbGlkIChpZSBlaXRoZXIgbm8gdmFsaWQK
PiA+ICAgKiAgICAgICAgICB2bWEgb3IgaXQgaXMgaWxsZWdhbCB0byBhY2Nlc3MgdGhhdCByYW5n
ZSksIG51bWJlciBvZiB2YWxpZCBwYWdlcwo+ID4gICAqICAgICAgICAgIGluIHJhbmdlLT5wZm5z
W10gKGZyb20gcmFuZ2Ugc3RhcnQgYWRkcmVzcykuCj4gPiAgICoKPiA+IEBAIC05NjcsNyArOTY3
LDcgQEAgbG9uZyBobW1fcmFuZ2Vfc25hcHNob3Qoc3RydWN0IGhtbV9yYW5nZSAqcmFuZ2UpCj4g
PiAgICAgICAgIGRvIHsKPiA+ICAgICAgICAgICAgICAgICAvKiBJZiByYW5nZSBpcyBubyBsb25n
ZXIgdmFsaWQgZm9yY2UgcmV0cnkuICovCj4gPiAgICAgICAgICAgICAgICAgaWYgKCFyYW5nZS0+
dmFsaWQpCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVBR0FJTjsKPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAtRUJVU1k7Cj4gPgo+ID4gICAgICAgICAgICAg
ICAgIHZtYSA9IGZpbmRfdm1hKGhtbS0+bW0sIHN0YXJ0KTsKPiA+ICAgICAgICAgICAgICAgICBp
ZiAodm1hID09IE5VTEwgfHwgKHZtYS0+dm1fZmxhZ3MgJiBkZXZpY2Vfdm1hKSkKPiA+IEBAIC0x
MDYyLDEwICsxMDYyLDggQEAgbG9uZyBobW1fcmFuZ2VfZmF1bHQoc3RydWN0IGhtbV9yYW5nZSAq
cmFuZ2UsIGJvb2wgYmxvY2spCj4gPgo+ID4gICAgICAgICBkbyB7Cj4gPiAgICAgICAgICAgICAg
ICAgLyogSWYgcmFuZ2UgaXMgbm8gbG9uZ2VyIHZhbGlkIGZvcmNlIHJldHJ5LiAqLwo+ID4gLSAg
ICAgICAgICAgICAgIGlmICghcmFuZ2UtPnZhbGlkKSB7Cj4gPiAtICAgICAgICAgICAgICAgICAg
ICAgICB1cF9yZWFkKCZobW0tPm1tLT5tbWFwX3NlbSk7Cj4gPiAtICAgICAgICAgICAgICAgICAg
ICAgICByZXR1cm4gLUVBR0FJTjsKPiA+IC0gICAgICAgICAgICAgICB9Cj4gPiArICAgICAgICAg
ICAgICAgaWYgKCFyYW5nZS0+dmFsaWQpCj4gPiArICAgICAgICAgICAgICAgICAgICAgICByZXR1
cm4gLUVCVVNZOwo+IAo+IElzIGl0IGZpbmUgdG8gcmVtb3ZlICB1cF9yZWFkKCZobW0tPm1tLT5t
bWFwX3NlbSkgPwoKSXQgc2VlbXMgdmVyeSBzdWJ0bGUsIGJ1dCB1bmRlciB0aGUgY292ZXJzIHRo
aXMgY2FsbHMKaGFuZGxlX21tX2ZhdWx0KCkgd2l0aCBGQVVMVF9GTEFHX0FMTE9XX1JFVFJZIHdo
aWNoIHdpbGwgY2F1c2UgdGhlCm1tYXAgc2VtIHRvIGJlY29tZSB1bmxvY2tlZCBhbG9uZyB0aGUg
LUVBR0FJTiByZXR1cm4gcGF0aC4KCkkgdGhpbmsgd2l0aG91dCB0aGUgY29tbWl0IG1lc3NhZ2Ug
SSB3b3VsZG4ndCBoYXZlIGJlZW4gYWJsZSB0bwp1bmRlcnN0YW5kIHRoYXQsIHNvIENocmlzdG9w
aCwgY291bGQgeW91IGFsc28gYWRkIHRoZSBjb21tZW50IGJlbG93CnBsZWFzZT8KCk90aGVyd2lz
ZQoKUmV2aWV3ZWQtYnk6IEphc29uIEd1bnRob3JwZSA8amdnQG1lbGxhbm94LmNvbT4KCkZyYW5r
bHksIEkgZmluZCB0aGUgJ2ludCAqbG9ja2VkJyBzY2hlbWUgb2YgR1VQIGVhc2llciB0byB1bmRl
cnN0YW5kLi4KCmRpZmYgLS1naXQgYS9tbS9obW0uYyBiL21tL2htbS5jCmluZGV4IDE2YjY3MzFh
MzRkYjc5Li41NGIzYTQxNjJhZTk0OSAxMDA2NDQKLS0tIGEvbW0vaG1tLmMKKysrIGIvbW0vaG1t
LmMKQEAgLTMwMSw4ICszMDEsMTAgQEAgc3RhdGljIGludCBobW1fdm1hX2RvX2ZhdWx0KHN0cnVj
dCBtbV93YWxrICp3YWxrLCB1bnNpZ25lZCBsb25nIGFkZHIsCiAJZmxhZ3MgfD0gaG1tX3ZtYV93
YWxrLT5ibG9jayA/IDAgOiBGQVVMVF9GTEFHX0FMTE9XX1JFVFJZOwogCWZsYWdzIHw9IHdyaXRl
X2ZhdWx0ID8gRkFVTFRfRkxBR19XUklURSA6IDA7CiAJcmV0ID0gaGFuZGxlX21tX2ZhdWx0KHZt
YSwgYWRkciwgZmxhZ3MpOwotCWlmIChyZXQgJiBWTV9GQVVMVF9SRVRSWSkKKwlpZiAocmV0ICYg
Vk1fRkFVTFRfUkVUUlkpIHsKKwkJLyogTm90ZSwgaGFuZGxlX21tX2ZhdWx0IGRpZCB1cF9yZWFk
KCZtbS0+bW1hcF9zZW0pKSAqLwogCQlyZXR1cm4gLUVBR0FJTjsKKwl9CiAJaWYgKHJldCAmIFZN
X0ZBVUxUX0VSUk9SKSB7CiAJCSpwZm4gPSByYW5nZS0+dmFsdWVzW0hNTV9QRk5fRVJST1JdOwog
CQlyZXR1cm4gLUVGQVVMVDsKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
