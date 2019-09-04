Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9040AA80DF
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2019 13:10:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7357689467;
	Wed,  4 Sep 2019 11:10:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700069.outbound.protection.outlook.com [40.107.70.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5686489467
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2019 11:10:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JYCLTB4d3uqsB98/czJN8aaeRMz2EgIhVvhQoZ4tewdXXT7fp88275DXtpIB0RQvFZkgsVXqKznbcQvc2uIbFCwQTT6zfuxi4ODDm0rpOmTfy/eCerK5RxcaO0ajU76aAnbRf4vGGoMhBqU2yNIJgUQhV/t8j1UjC8qMewf8ytAvK6I4ywGzVAWcZMfkBLVw6ipVf16wAqpROzsg1gTKFWZ/hQaCfkk0XzlLq5lfaV2cifsSjQ8hsCNcliGfS9eMx+gA+C4kPkseku9WIzxqPOGVkyBxBKVg6KbqReGiFVxPSRcdQtPQ93+/9iixMOM0C3KsHqoSR3CKMOTyBRpXbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MvpST9tZI3IyIAjzjPMW/V+heDNHw6NF5O0C/6AYLtg=;
 b=igoCS+uoiT/UnN/+NX//qejw9Pb96WJBsUAnlrymCEBnlb//5X3A9Bpau9rbopsF2nAcPMwkUGj+VlNddhrvgn2fSB6e/4T4k3650SCCiQEItMj7Jq+Rr1wVZWRz8SUJqyUy5wGiQtBmXzmd4BCGo2xSrPJCgKAn4sgFiTHIJHVQP4TQsWjYkcxWfYlq1VcQl+43jwmijneifmCRkVKgw4bPcAQgN5UCm9YDA9aI5wN8JKW6WKC9jQxxsGq8XR2JICjZOV1Lmnn4ifNANLNE5DFkwtDnvYRjLqGmBwnj+asgc88zddkhtc8Ju5iOA1qc3w2lLeYlxg0L+QUnnr0oGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1834.namprd12.prod.outlook.com (10.175.87.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.14; Wed, 4 Sep 2019 11:10:34 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::9d43:b3d4:9ef:29fc]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::9d43:b3d4:9ef:29fc%8]) with mapi id 15.20.2220.022; Wed, 4 Sep 2019
 11:10:34 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0gKFZNd2FyZSk=?= <thomas_os@shipmail.org>, 
 Dave Hansen <dave.hansen@intel.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2 3/4] drm/ttm, drm/vmwgfx: Correctly support support AMD
 memory encryption
Thread-Topic: [PATCH v2 3/4] drm/ttm, drm/vmwgfx: Correctly support support
 AMD memory encryption
Thread-Index: AQHVYlmrEsqRn+3n2UyO+FRNS69TaKcaWZqAgAADnYCAAAEogIAAC2+AgAAENQCAAAPnAIAAr2oAgAANAoCAAC+pAA==
Date: Wed, 4 Sep 2019 11:10:34 +0000
Message-ID: <7eec2c11-d0d4-4c81-6ed2-d0932bf5af33@amd.com>
References: <20190903131504.18935-1-thomas_os@shipmail.org>
 <20190903131504.18935-4-thomas_os@shipmail.org>
 <b54bd492-9702-5ad7-95da-daf20918d3d9@intel.com>
 <CAKMK7uFv+poZq43as8XoQaSuoBZxCQ1p44VCmUUTXOXt4Y+Bjg@mail.gmail.com>
 <6d0fafcc-b596-481b-7b22-1f26f0c02c5c@intel.com>
 <bed2a2d9-17f0-24bd-9f4a-c7ee27f6106e@shipmail.org>
 <7fa3b178-b9b4-2df9-1eee-54e24d48342e@intel.com>
 <ba77601a-d726-49fa-0c88-3b02165a9a21@shipmail.org>
 <cfe46eda-66b5-b40d-6721-84e6e0e1f5de@amd.com>
 <94113acc-1f99-2386-1d42-4b9930b04f73@shipmail.org>
In-Reply-To: <94113acc-1f99-2386-1d42-4b9930b04f73@shipmail.org>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR0P264CA0066.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1d::30) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5ea8b247-34a3-4cd3-8c4f-08d7312881ca
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1834; 
x-ms-traffictypediagnostic: DM5PR12MB1834:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB18341AC181095588BB19A1C183B80@DM5PR12MB1834.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0150F3F97D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(376002)(39860400002)(136003)(366004)(51444003)(199004)(189003)(54906003)(110136005)(46003)(186003)(2906002)(5660300002)(316002)(31686004)(58126008)(65806001)(6436002)(65956001)(53936002)(52116002)(99286004)(6512007)(6246003)(14454004)(66476007)(64756008)(66446008)(66946007)(476003)(2616005)(11346002)(6486002)(71200400001)(71190400001)(36756003)(66556008)(4326008)(25786009)(478600001)(256004)(8936002)(81166006)(31696002)(6506007)(7736002)(53546011)(386003)(8676002)(76176011)(81156014)(102836004)(305945005)(486006)(229853002)(7416002)(86362001)(446003)(6116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1834;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: pPUv5UgOt9jfG0Aj5heaUg4XMecDx7oEk9Py4fhIgbNMiQkbTJ+GDwapgkoycN0AoynKSyLnkRxVDsiglAhUkuY8S+qgMbetu2g5ZbzgUhQ6ED3txFEg7dbCJq9E5F1JkCzTmwBEwYsxcngn7Nxke+LOmKl3bZEwpcPOWXBDvvxmVzmB4usfP9VXUm9vbpl/uiAKpkirKuUBxAzfgUd06bjO1Rvo7JEPteai+xp4PmSpgl1kGXK7ebfT1EF6uEpUGVIQ12liJkZhFdHV/txr7lyIJhtyjvYCcMaxcA6EU4xvM/LjeAzOi/CWWigcXquxAiM/E3YEHWi29M4H5aNoujkTlSLGc/4z7RAnKbIXJ5bP9EDtrlu4ap9d4jl6eUW7relGJ1w2nYOXGTEwjygYNiJNCL+98pKyeBUT+wDBhaI=
Content-ID: <720D09F6018EA349B0CD24663E1E2DBE@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ea8b247-34a3-4cd3-8c4f-08d7312881ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2019 11:10:34.5940 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cCGpwXNnagFMYX1dZuT8tBG0ewhRVoetEKIYis9Ewp/6WjqI9fDw5zQY7DE2ylnO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1834
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MvpST9tZI3IyIAjzjPMW/V+heDNHw6NF5O0C/6AYLtg=;
 b=lwDobZ/Y/+loGVJo7CZZe18g+k6AbTImroFSL06W1LRA5/WLOY9VRL6XWrt54t/JIe6WPP5UqCrPmo8hvygYxFlzvDEPxQ5LHMxT/bTKfDHTg4X9NQtqTE0EUPND1otXt3e6cbLrVcxBptEJBX7qHtmXmP3F0G3ti8NN2Nm7vCE=
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
Cc: "Lendacky, Thomas" <Thomas.Lendacky@amd.com>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 "pv-drivers@vmware.com" <pv-drivers@vmware.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Andy Lutomirski <luto@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDQuMDkuMTkgdW0gMTA6MTkgc2NocmllYiBUaG9tYXMgSGVsbHN0csO2bSAoVk13YXJlKToN
Cj4gSGksIENocmlzdGlhbiwNCj4NCj4gT24gOS80LzE5IDk6MzMgQU0sIEtvZW5pZywgQ2hyaXN0
aWFuIHdyb3RlOg0KPj4gQW0gMDMuMDkuMTkgdW0gMjM6MDUgc2NocmllYiBUaG9tYXMgSGVsbHN0
csO2bSAoVk13YXJlKToNCj4+PiBPbiA5LzMvMTkgMTA6NTEgUE0sIERhdmUgSGFuc2VuIHdyb3Rl
Og0KPj4+PiBPbiA5LzMvMTkgMTozNiBQTSwgVGhvbWFzIEhlbGxzdHLDtm0gKFZNd2FyZSkgd3Jv
dGU6DQo+Pj4+PiBTbyB0aGUgcXVlc3Rpb24gaGVyZSBzaG91bGQgcmVhbGx5IGJlLCBjYW4gd2Ug
ZGV0ZXJtaW5lIGFscmVhZHkgYXQgDQo+Pj4+PiBtbWFwDQo+Pj4+PiB0aW1lIHdoZXRoZXIgYmFj
a2luZyBtZW1vcnkgd2lsbCBiZSB1bmVuY3J5cHRlZCBhbmQgYWRqdXN0IHRoZSAqcmVhbCoNCj4+
Pj4+IHZtYS0+dm1fcGFnZV9wcm90IHVuZGVyIHRoZSBtbWFwX3NlbT8NCj4+Pj4+DQo+Pj4+PiBQ
b3NzaWJseSwgYnV0IHRoYXQgcmVxdWlyZXMgcG9wdWxhdGluZyB0aGUgYnVmZmVyIHdpdGggbWVt
b3J5IGF0IG1tYXANCj4+Pj4+IHRpbWUgcmF0aGVyIHRoYW4gYXQgZmlyc3QgZmF1bHQgdGltZS4N
Cj4+Pj4gSSdtIG5vdCBjb25uZWN0aW5nIHRoZSBkb3RzLg0KPj4+Pg0KPj4+PiB2bWEtPnZtX3Bh
Z2VfcHJvdCBpcyB1c2VkIHRvIGNyZWF0ZSBhIFZNQSdzIFBURXMgcmVnYXJkbGVzcyBvZiBpZiB0
aGV5DQo+Pj4+IGFyZSBjcmVhdGVkIGF0IG1tYXAoKSBvciBmYXVsdCB0aW1lLsKgIElmIHdlIGVz
dGFibGlzaCBhIGdvb2QNCj4+Pj4gdm1hLT52bV9wYWdlX3Byb3QsIGNhbid0IHdlIGp1c3QgdXNl
IGl0IGZvcmV2ZXIgZm9yIGRlbWFuZCBmYXVsdHM/DQo+Pj4gV2l0aCBTRVYgSSB0aGluayB0aGF0
IHdlIGNvdWxkIHBvc3NpYmx5IGVzdGFibGlzaCB0aGUgZW5jcnlwdGlvbiBmbGFncw0KPj4+IGF0
IHZtYSBjcmVhdGlvbiB0aW1lLiBCdXQgdGhpbmtpbmcgb2YgaXQsIGl0IHdvdWxkIGFjdHVhbGx5
IGJyZWFrIHdpdGgNCj4+PiBTTUUgd2hlcmUgYnVmZmVyIGNvbnRlbnQgY2FuIGJlIG1vdmVkIGJl
dHdlZW4gZW5jcnlwdGVkIHN5c3RlbSBtZW1vcnkNCj4+PiBhbmQgdW5lbmNyeXB0ZWQgZ3JhcGhp
Y3MgY2FyZCBQQ0kgbWVtb3J5IGJlaGluZCB1c2VyLXNwYWNlJ3MgYmFjay4NCj4+PiBUaGF0IHdv
dWxkIGltcGx5IGtpbGxpbmcgYWxsIHVzZXItc3BhY2UgZW5jcnlwdGVkIFBURXMgYW5kIGF0IGZh
dWx0DQo+Pj4gdGltZSBzZXQgdXAgbmV3IG9uZXMgcG9pbnRpbmcgdG8gdW5lbmNyeXB0ZWQgUENJ
IG1lbW9yeS4uDQo+PiBXZWxsIG15IHByb2JsZW0gaXMgd2hlcmUgZG8geW91IHNlZSBlbmNyeXB0
ZWQgc3lzdGVtIG1lbW9yeSBoZXJlPw0KPj4NCj4+IEF0IGxlYXN0IGZvciBBTUQgR1BVcyBhbGwg
bWVtb3J5IGFjY2Vzc2VkIG11c3QgYmUgdW5lbmNyeXB0ZWQgYW5kIHRoYXQNCj4+IGNvdW50cyBm
b3IgYm90aCBzeXN0ZW0gYXMgd2VsbCBhcyBQQ0kgbWVtb3J5Lg0KPg0KPiBXZSdyZSB0YWxraW5n
IFNNRSBub3cgcmlnaHQ/DQo+DQo+IFRoZSBjdXJyZW50IFNNRSBzZXR1cCBpcyB0aGF0IGlmIGEg
ZGV2aWNlJ3MgRE1BIG1hc2sgc2F5cyBpdCdzIGNhcGFibGUgDQo+IG9mIGFkZHJlc3NpbmcgdGhl
IGVuY3J5cHRpb24gYml0LCBjb2hlcmVudCBtZW1vcnkgd2lsbCBiZSBlbmNyeXB0ZWQuIA0KPiBU
aGUgbWVtb3J5IGNvbnRyb2xsZXJzIHdpbGwgZGVjcnlwdCBmb3IgdGhlIGRldmljZSBvbiB0aGUg
Zmx5LiANCj4gT3RoZXJ3aXNlIGNvaGVyZW50IG1lbW9yeSB3aWxsIGJlIGRlY3J5cHRlZC4NCj4N
Cj4+DQo+PiBTbyBJIGRvbid0IGdldCB3aHkgd2UgY2FuJ3QgYXNzdW1lIGFsd2F5cyB1bmVuY3J5
cHRlZCBhbmQga2VlcCBpdCANCj4+IGxpa2UgdGhhdC4NCj4NCj4gSSBzZWUgdHdvIHJlYXNvbnMu
IEZpcnN0LCBpdCB3b3VsZCBicmVhayB3aXRoIGEgcmVhbCBkZXZpY2UgdGhhdCANCj4gc2lnbmFs
cyBpdCdzIGNhcGFibGUgb2YgYWRkcmVzc2luZyB0aGUgZW5jcnlwdGlvbiBiaXQuDQoNCldoeT8g
QmVjYXVzZSB3ZSBkb24ndCB1c2UgZG1hX21tYXBfY29oZXJlbnQoKT8NCg0KSSd2ZSBhbHJlYWR5
IHRhbGtlZCB3aXRoIENocmlzdG9waCB0aGF0IHdlIHByb2JhYmx5IHdhbnQgdG8gc3dpdGNoIFRU
TSANCm92ZXIgdG8gdXNpbmcgdGhhdCBpbnN0ZWFkIHRvIGFsc28gZ2V0IHJpZCBvZiB0aGUgdHRt
X2lvX3Byb3QoKSBoYWNrLg0KDQpSZWdhcmRzLA0KQ2hyaXN0aWFuLg0KDQo+DQo+IFNlY29uZCBJ
IGNhbiBpbWFnaW5lIHVuYWNjZWxlcmF0ZWQgc2V0dXBzIChzb21ldGhpbmcgbGlrZSB2a21zIHVz
aW5nIA0KPiBwcmltZSBmZWVkaW5nIGEgVk5DIGNvbm5lY3Rpb24pIHdoZXJlIHdlIGFjdHVhbGx5
IHdhbnQgdGhlIFRUTSBidWZmZXJzIA0KPiBlbmNyeXB0ZWQgdG8gcHJvdGVjdCBkYXRhLg0KPg0K
PiBCdXQgYXQgbGVhc3QgdGhlIGxhdHRlciByZWFzb24gaXMgd2F5IGZhciBvdXQgaW4gdGhlIGZ1
dHVyZS4NCj4NCj4gU28gZm9yIG1lIEknbSBvayB3aXRoIHRoYXQgaWYgdGhhdCB3b3JrcyBmb3Ig
eW91Pw0KPg0KPiAvVGhvbWFzDQo+DQo+DQo+Pg0KPj4gUmVnYXJkcywNCj4+IENocmlzdGlhbi4N
Cj4NCj4NCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
