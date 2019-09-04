Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A777EA7CD5
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2019 09:33:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 805CE8989C;
	Wed,  4 Sep 2019 07:33:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820083.outbound.protection.outlook.com [40.107.82.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42A648989C
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2019 07:33:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RqIMUmtgUBS81lXLCSSN/uvUAcKHYx/AWhLeCbt/Jx95QJOnrmd7OxJLQzEI/gG1T66JQY/P1FzO4dHpi+BbnycA87VAIsACoCVTMddOAedD72iK+jGSGxfIPl+UNE9I8vHQVtRTKhhdOsf6s+k2MtGlqLEI7v72pLET9FEVf0NUShgdyf/cCDt5r/GsbwrDROK6+lu87ZoJO+39mMFIlusSo4Q20eairSDRjgKNKqWAaFwQAhOEx596pPbx+344fikH7qGB2O0rZzVNREbGhKhubbp6TxmUkhI7+08b9JbUqwpXEcqDbxsrmm8ZBdozKqhZ6xxu+isnskFg/X1icA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f1IJBzZJFjTp9JhivkBo/TKz83nWdQrsk7fk/t/61p4=;
 b=ZyK29c/uGk+JLeydEniswU9E2bgjQ0kLJEGG6AnZSrC4lf7F60BtK+maDxOBFPR4cQbvsvPUSVhHb5Tj+5Ktp7T4/c4tzjaya1PGxpAEt+PRhcQIJKfBFzT3jZ3zAb5Nmqai2OVPi5RsMbYCs3v4M59jPx3KT0TUFD3pBYUZERdgmoEvtr/YCVfZT9VGQkyoAJBC+kxarQ3kJ2ZyJwSiKMfyQMvMv9v6vBivnXFU8flGlIJnjExZzsPscCkVSllSTVrf1A+BVtASode7Ro2Px3s7mJT0uy1vwlpWtKe9jZw5gn9uUxMk+I5idmvbEFCMtxCGBRSiLxKwXH36YcNJYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1225.namprd12.prod.outlook.com (10.168.240.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.20; Wed, 4 Sep 2019 07:33:27 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::9d43:b3d4:9ef:29fc]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::9d43:b3d4:9ef:29fc%8]) with mapi id 15.20.2220.022; Wed, 4 Sep 2019
 07:33:27 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0gKFZNd2FyZSk=?= <thomas_os@shipmail.org>, 
 Dave Hansen <dave.hansen@intel.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2 3/4] drm/ttm, drm/vmwgfx: Correctly support support AMD
 memory encryption
Thread-Topic: [PATCH v2 3/4] drm/ttm, drm/vmwgfx: Correctly support support
 AMD memory encryption
Thread-Index: AQHVYlmrEsqRn+3n2UyO+FRNS69TaKcaWZqAgAADnYCAAAEogIAAC2+AgAAENQCAAAPnAIAAr2oA
Date: Wed, 4 Sep 2019 07:33:27 +0000
Message-ID: <cfe46eda-66b5-b40d-6721-84e6e0e1f5de@amd.com>
References: <20190903131504.18935-1-thomas_os@shipmail.org>
 <20190903131504.18935-4-thomas_os@shipmail.org>
 <b54bd492-9702-5ad7-95da-daf20918d3d9@intel.com>
 <CAKMK7uFv+poZq43as8XoQaSuoBZxCQ1p44VCmUUTXOXt4Y+Bjg@mail.gmail.com>
 <6d0fafcc-b596-481b-7b22-1f26f0c02c5c@intel.com>
 <bed2a2d9-17f0-24bd-9f4a-c7ee27f6106e@shipmail.org>
 <7fa3b178-b9b4-2df9-1eee-54e24d48342e@intel.com>
 <ba77601a-d726-49fa-0c88-3b02165a9a21@shipmail.org>
In-Reply-To: <ba77601a-d726-49fa-0c88-3b02165a9a21@shipmail.org>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR2P264CA0009.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101::21)
 To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5d52c5be-54cd-4319-387a-08d7310a2cee
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1225; 
x-ms-traffictypediagnostic: DM5PR12MB1225:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB12250BA7AC689A5DF4F20FC283B80@DM5PR12MB1225.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0150F3F97D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(136003)(346002)(396003)(366004)(51444003)(199004)(189003)(478600001)(110136005)(5660300002)(54906003)(58126008)(71190400001)(71200400001)(66946007)(76176011)(7416002)(81166006)(8936002)(8676002)(14454004)(81156014)(36756003)(46003)(6486002)(4326008)(186003)(64756008)(99286004)(66476007)(386003)(6506007)(53546011)(102836004)(66556008)(2906002)(316002)(229853002)(86362001)(53936002)(6246003)(52116002)(65956001)(65806001)(31696002)(476003)(31686004)(6436002)(6512007)(305945005)(7736002)(446003)(2616005)(6116002)(256004)(11346002)(25786009)(66446008)(486006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1225;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 5ot6W/CwzLTTu6GGkv0Lp5piVMrCSsXj6bqAdfPyTJvIcDBZrnJpxkbcBfkPEO2wSn0tOHQcfB1RtkyUvWraxHi4zrpQ0KCqztaVoTz1ab2NXEQJMZrCbhHI3LZ8ZO2nyBo6YWXjLMVHdtOY7CylOC9OMQyTmyiFLcmwTHwvUWpkthe9DsrH9aP4OhcNtFCc/SvHuH5iIXBjfgNsWcoJMH9pPzahYRjQmG2wWKMFkyxGwhZD2LefpCiPMJNfr/DLVFMBJ2Js8Qe8+sgynFi9WqHvMT4DpdmDtnQQ2L5Gjd454E1lsfFtFNFse7iEEaa2AY6dxmmlmbVIVtLK7S3hYnFlcjBMzbuhNzBHXNri71jJgSVDyndB+3NWe3AkpsG6leL0apK8NuMNL9biY8u9QcOH/vmiXm8ydORNrmaRKn4=
Content-ID: <EC6A318B0D8592409E7975FC2E0B079E@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d52c5be-54cd-4319-387a-08d7310a2cee
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2019 07:33:27.2586 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fNjpiJrUZ/TO62DNbfuv/FeljFLDUlNyDcrF+mV9s+GsmKNzX1EMEMPjk+ZUhb6x
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1225
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f1IJBzZJFjTp9JhivkBo/TKz83nWdQrsk7fk/t/61p4=;
 b=JbMqweJtRUvsyCs/FHBT8/0S4ojvmVUwjq4U1y0Eeuk9SohTVG/BGoVnIce7JManxtFPcw9qmkHZkFoT2zIwCxb0szlBJmEPSlGdqnOhO0mQLArfo0hN1GvKGCJ1O2mbw+Ozq9kvJV3q63dDyqFKrseUqNnXMeX+VhqoBBEAjv4=
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

QW0gMDMuMDkuMTkgdW0gMjM6MDUgc2NocmllYiBUaG9tYXMgSGVsbHN0csO2bSAoVk13YXJlKToN
Cj4gT24gOS8zLzE5IDEwOjUxIFBNLCBEYXZlIEhhbnNlbiB3cm90ZToNCj4+IE9uIDkvMy8xOSAx
OjM2IFBNLCBUaG9tYXMgSGVsbHN0csO2bSAoVk13YXJlKSB3cm90ZToNCj4+PiBTbyB0aGUgcXVl
c3Rpb24gaGVyZSBzaG91bGQgcmVhbGx5IGJlLCBjYW4gd2UgZGV0ZXJtaW5lIGFscmVhZHkgYXQg
bW1hcA0KPj4+IHRpbWUgd2hldGhlciBiYWNraW5nIG1lbW9yeSB3aWxsIGJlIHVuZW5jcnlwdGVk
IGFuZCBhZGp1c3QgdGhlICpyZWFsKg0KPj4+IHZtYS0+dm1fcGFnZV9wcm90IHVuZGVyIHRoZSBt
bWFwX3NlbT8NCj4+Pg0KPj4+IFBvc3NpYmx5LCBidXQgdGhhdCByZXF1aXJlcyBwb3B1bGF0aW5n
IHRoZSBidWZmZXIgd2l0aCBtZW1vcnkgYXQgbW1hcA0KPj4+IHRpbWUgcmF0aGVyIHRoYW4gYXQg
Zmlyc3QgZmF1bHQgdGltZS4NCj4+IEknbSBub3QgY29ubmVjdGluZyB0aGUgZG90cy4NCj4+DQo+
PiB2bWEtPnZtX3BhZ2VfcHJvdCBpcyB1c2VkIHRvIGNyZWF0ZSBhIFZNQSdzIFBURXMgcmVnYXJk
bGVzcyBvZiBpZiB0aGV5DQo+PiBhcmUgY3JlYXRlZCBhdCBtbWFwKCkgb3IgZmF1bHQgdGltZS7C
oCBJZiB3ZSBlc3RhYmxpc2ggYSBnb29kDQo+PiB2bWEtPnZtX3BhZ2VfcHJvdCwgY2FuJ3Qgd2Ug
anVzdCB1c2UgaXQgZm9yZXZlciBmb3IgZGVtYW5kIGZhdWx0cz8NCj4NCj4gV2l0aCBTRVYgSSB0
aGluayB0aGF0IHdlIGNvdWxkIHBvc3NpYmx5IGVzdGFibGlzaCB0aGUgZW5jcnlwdGlvbiBmbGFn
cyANCj4gYXQgdm1hIGNyZWF0aW9uIHRpbWUuIEJ1dCB0aGlua2luZyBvZiBpdCwgaXQgd291bGQg
YWN0dWFsbHkgYnJlYWsgd2l0aCANCj4gU01FIHdoZXJlIGJ1ZmZlciBjb250ZW50IGNhbiBiZSBt
b3ZlZCBiZXR3ZWVuIGVuY3J5cHRlZCBzeXN0ZW0gbWVtb3J5IA0KPiBhbmQgdW5lbmNyeXB0ZWQg
Z3JhcGhpY3MgY2FyZCBQQ0kgbWVtb3J5IGJlaGluZCB1c2VyLXNwYWNlJ3MgYmFjay4gDQo+IFRo
YXQgd291bGQgaW1wbHkga2lsbGluZyBhbGwgdXNlci1zcGFjZSBlbmNyeXB0ZWQgUFRFcyBhbmQg
YXQgZmF1bHQgDQo+IHRpbWUgc2V0IHVwIG5ldyBvbmVzIHBvaW50aW5nIHRvIHVuZW5jcnlwdGVk
IFBDSSBtZW1vcnkuLg0KDQpXZWxsIG15IHByb2JsZW0gaXMgd2hlcmUgZG8geW91IHNlZSBlbmNy
eXB0ZWQgc3lzdGVtIG1lbW9yeSBoZXJlPw0KDQpBdCBsZWFzdCBmb3IgQU1EIEdQVXMgYWxsIG1l
bW9yeSBhY2Nlc3NlZCBtdXN0IGJlIHVuZW5jcnlwdGVkIGFuZCB0aGF0IA0KY291bnRzIGZvciBi
b3RoIHN5c3RlbSBhcyB3ZWxsIGFzIFBDSSBtZW1vcnkuDQoNClNvIEkgZG9uJ3QgZ2V0IHdoeSB3
ZSBjYW4ndCBhc3N1bWUgYWx3YXlzIHVuZW5jcnlwdGVkIGFuZCBrZWVwIGl0IGxpa2UgdGhhdC4N
Cg0KUmVnYXJkcywNCkNocmlzdGlhbi4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
