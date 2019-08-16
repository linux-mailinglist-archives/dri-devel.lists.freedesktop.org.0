Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3732B8FCDD
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2019 09:58:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52BFA6EB14;
	Fri, 16 Aug 2019 07:58:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750058.outbound.protection.outlook.com [40.107.75.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 589146EB13;
 Fri, 16 Aug 2019 07:58:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EMiyimZqw78LH+nhudHhfUOJ7loFawDN9oZqaVPelh7KB2G6Eoh04ES2nRh+2jHyhVb/QWkAGsWeGvDZJ9hilG6KecPNtCiB3Whk4bt6vv4sTjJLenhmUhjQ4ArL0XDurV6DApz0pvXP1VRkEBaKVXcuigFuzgTJfZys4gMROJbdwVaYOEdN73OTZrl9ylarnkFqKu4ng8hqZ4mN8+mjStS3lFwFFa95+4zSvALv/CHDIHKAfSvRBlJC96HOegC2Djl8X5vnjEiqv0eVJ87t///U9li9Anl7zZaG2juuxozG+bRoLIV24qQ+9WKntDLj3r+3P7d+r+S+kIN8snc1zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GxsMOmGIlRXdUe7YclR3iQIz3Hztjhe8YUK4kRjTVfM=;
 b=Y/CbbhOsoJj6v0PEbnGvdNPdvOY0Ua9meEIjHhNwlMgN5qHoYHxfzSZhif8N/HPHbi6w0b59Lfj/eyWTUUfbnKke4unRg6MDFxlc1r2BHdv+GCGqwf0jeLN2OLJ0W+TXW6n7zT8yfON1I3GKtBpFK9/RnabVv2rNx6oRCctLuo8W0QBnXDVBfyPrSsbr7riTnVFYTC9BhgHxUPQPYy+6hUKkN4Wosld3UUz7gN4N6WkHaOn+Top81lN0az72MKSwRBA37+wq6vbWi4mn7xPdemR1BztQyZRevTMFVC4wWvOpJKcHsBd4IY71RdgFY3BDaYM5PvBYfPR7Xrs8Ts4U6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB2520.namprd12.prod.outlook.com (52.132.141.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.15; Fri, 16 Aug 2019 07:58:32 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::a129:1f1a:52a9:4ac3]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::a129:1f1a:52a9:4ac3%5]) with mapi id 15.20.2157.022; Fri, 16 Aug 2019
 07:58:32 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Chris Wilson <chris@chris-wilson.co.uk>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 5/4] dma-fence: Have dma_fence_signal call signal_locked
Thread-Topic: [PATCH 5/4] dma-fence: Have dma_fence_signal call signal_locked
Thread-Index: AQHVUCVSc8wajMcXIkeNl+26fwB0Hqb66PWAgAGqGACAAADGAIAABA6AgAAHaQCAANEvAA==
Date: Fri, 16 Aug 2019 07:58:32 +0000
Message-ID: <687a42dc-0699-f244-37d0-a04ee1330143@amd.com>
References: <3b4da1e6-b5df-0f0e-cf4d-21dd6fd33e32@amd.com>
 <20190811091523.9382-1-chris@chris-wilson.co.uk>
 <20190814172053.GM7444@phenom.ffwll.local>
 <156589475684.11610.4915544599007801229@skylake-alporthouse-com>
 <CAKMK7uHuh6DMXitCHOCa7sjif9s1sjnHrBuHkwEgpzyQWBFhwA@mail.gmail.com>
 <156589579297.11610.13892431339759400267@skylake-alporthouse-com>
 <156589738438.11610.1779256035636545692@skylake-alporthouse-com>
In-Reply-To: <156589738438.11610.1779256035636545692@skylake-alporthouse-com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR1PR01CA0024.eurprd01.prod.exchangelabs.com
 (2603:10a6:102::37) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9223a1de-412a-4c42-e863-08d7221f8852
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB2520; 
x-ms-traffictypediagnostic: DM5PR12MB2520:
x-microsoft-antispam-prvs: <DM5PR12MB2520C5EB930237EF9362D3E583AF0@DM5PR12MB2520.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0131D22242
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(346002)(366004)(136003)(376002)(199004)(189003)(8676002)(14444005)(186003)(81156014)(6246003)(65956001)(71190400001)(31696002)(6512007)(486006)(53936002)(65806001)(36756003)(71200400001)(7736002)(229853002)(256004)(81166006)(8936002)(6116002)(86362001)(46003)(64126003)(305945005)(4326008)(99286004)(54906003)(52116002)(6436002)(102836004)(58126008)(66946007)(110136005)(446003)(65826007)(478600001)(6506007)(386003)(2906002)(66476007)(53546011)(66556008)(64756008)(66446008)(6486002)(11346002)(25786009)(316002)(76176011)(476003)(2616005)(14454004)(31686004)(5660300002)(66574012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2520;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: YisxDaqYtjEMhC6AS10PIiQa4Q11q6Qpzla/I6Qke69C7t60RPSp/28xNRkAD9Qu/Y6VMDYBHn5wm6a5/Au6y/AgNWOhXrTzdPAKtzc5aGfZQVdZudVMgwdFVJiDSEF9+zwX/KckQWH48r3otLr8IfQ08ivC4g9RPeQMPgpj1pDGnDNnqRKFPsxi/XGM0Ph+76sT2CFnMwqXiha/njKDDQ9+JebJZFJVXnEQr/HvK2lDdSUh/jEvp16mcvHm5wWRW8UF1gHBU+YDXKfrWnqcbO4SxHCv9EvkJa5pQ90o+0MniRN84PCNKbxCn4QJrmosmT86vfjw8JpL5m2DpLj7K154aCKlUiCbuai28/PsETQwnRAUSZTPU2LVdHdH8/X6XN0svk3g5fdMRuTqV0AIHb3cGp4LOTJgFqqPiJ4PV0Q=
x-ms-exchange-transport-forked: True
Content-ID: <CC7F9B4A1712FF40B43EB4A0F79FD620@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9223a1de-412a-4c42-e863-08d7221f8852
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2019 07:58:32.5428 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /QF4G4Xh64Mm91rWcJyjZ5SMs7e5pxOT7KOSL27RNwfRI6dU7keS8sqL15+3hIui
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2520
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GxsMOmGIlRXdUe7YclR3iQIz3Hztjhe8YUK4kRjTVfM=;
 b=GIFNoImd8PQmfCyGUf60ieV2cyLaZLbUYHWvs+qsOdiiIqL7fkGxmXs6hmlu90PP7V0bJTR6HQqUG77GwYkvamDxxQ41YzAH6lSptJ86cakIbTwJ32qBGO6ZdB8S3zU6Svw7uud+iKBm/+dsPRWnzRTQTOvNxTL1yfQQMZjgAvI=
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTUuMDguMTkgdW0gMjE6Mjkgc2NocmllYiBDaHJpcyBXaWxzb246DQo+IFF1b3RpbmcgQ2hy
aXMgV2lsc29uICgyMDE5LTA4LTE1IDIwOjAzOjEzKQ0KPj4gUXVvdGluZyBEYW5pZWwgVmV0dGVy
ICgyMDE5LTA4LTE1IDE5OjQ4OjQyKQ0KPj4+IE9uIFRodSwgQXVnIDE1LCAyMDE5IGF0IDg6NDYg
UE0gQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+IHdyb3RlOg0KPj4+PiBR
dW90aW5nIERhbmllbCBWZXR0ZXIgKDIwMTktMDgtMTQgMTg6MjA6NTMpDQo+Pj4+PiBPbiBTdW4s
IEF1ZyAxMSwgMjAxOSBhdCAxMDoxNToyM0FNICswMTAwLCBDaHJpcyBXaWxzb24gd3JvdGU6DQo+
Pj4+Pj4gTm93IHRoYXQgZG1hX2ZlbmNlX3NpZ25hbCBhbHdheXMgdGFrZXMgdGhlIHNwaW5sb2Nr
IHRvIGZsdXNoIHRoZQ0KPj4+Pj4+IGNiX2xpc3QsIHNpbXBseSB0YWtlIHRoZSBzcGlubG9jayBh
bmQgY2FsbCBkbWFfZmVuY2Vfc2lnbmFsX2xvY2tlZCgpIHRvDQo+Pj4+Pj4gYXZvaWQgY29kZSBy
ZXBldGl0aW9uLg0KPj4+Pj4+DQo+Pj4+Pj4gU3VnZ2VzdGVkLWJ5OiBDaHJpc3RpYW4gS8O2bmln
IDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+DQo+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogQ2hyaXMg
V2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+DQo+Pj4+Pj4gQ2M6IENocmlzdGlhbiBL
w7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4NCj4+Pj4+IEhtLCBJIHRoaW5rIHRoaXMg
bGFyZ2VseSBkZWZlYXRzIHRoZSBwb2ludCBvZiBoYXZpbmcgdGhlIGxvY2tsZXNzIHNpZ25hbA0K
Pj4+Pj4gZW5hYmxpbmcgdHJpY2tlcnkgaW4gZG1hX2ZlbmNlLiBNYXliZSB0aGF0IHBhcnQgaXNu
J3QgbmVlZGVkIGJ5IGFueW9uZSwNCj4+Pj4+IGJ1dCBmZWVscyBsaWtlIGEgdGhpbmcgdGhhdCBu
ZWVkcyBhIG5vdGNoIG1vcmUgdGhvdWdodC4gQW5kIGlmIHdlIG5lZWQgaXQsDQo+Pj4+PiBtYXli
ZSBhIGJpdCBtb3JlIGNsZWFudXAuDQo+Pj4+IFlvdSBtZWFuIGRtYV9mZW5jZV9lbmFibGVfc3df
c2lnbmFsaW5nKCkuIFRoZSBvbmx5IHVzZXIgYXBwZWFycyB0byBiZSB0bw0KPj4+PiBmbHVzaCBm
ZW5jZXMsIHdoaWNoIGlzIGFjdHVhbGx5IHRoZSBpbnRlbnQgb2YgYWx3YXlzIG5vdGlmeWluZyB0
aGUgc2lnbmFsDQo+Pj4+IGNiLiBCeSBhbHdheXMgZG9pbmcgdGhlIGNhbGxiYWNrcywgd2UgY2Fu
IGF2b2lkIGluc3RhbGxpbmcgdGhlIGludGVycnVwdA0KPj4+PiBhbmQgY29tcGxldGVseSBzYXR1
cmF0aW5nIENQVXMgd2l0aCBpcnFzLCBpbnN0ZWFkIGRvaW5nIGEgYmF0Y2ggaW4gYQ0KPj4+PiBs
ZWlzdXJlbHkgdGltZXIgY2FsbGJhY2sgaWYgbm90IGZsdXNoZWQgbmF0dXJhbGx5Lg0KPj4+IFll
YWggSSdtIG5vdCBhZ2FpbnN0IGRpdGNoaW5nIHRoaXMsDQo+PiBJIHdhcyBqdXN0IHRoaW5raW5n
IGFsb3VkIHdvcmtpbmcgb3V0IHdoYXQgdGhlIGN1cnJlbnQgdXNlIGNhc2UgaW4gdHRtDQo+PiB3
YXMgZm9yLg0KPj4NCj4+PiBidXQgY2FuJ3Qgd2UgZGl0Y2ggYSBsb3QgbW9yZSBpZg0KPj4+IHdl
IGp1c3QgYWx3YXlzIHRha2UgdGhlIHNwaW5sb2NrIGluIHRob3NlIHBhdGhzIG5vdyBhbnl3YXlz
PyBLaW5kYSBub3QNCj4+PiB3b3J0aCBoYXZpbmcgdGhlIGNvbXBsZXhpdHkgYW55bW9yZS4NCj4+
IFlvdSB3b3VsZCBiZSBhYmxlIHRvIGRyb3AgdGhlIHdhc19zZXQgZnJvbSBkbWFfZmVuY2VfYWRk
X2NhbGxiYWNrLiBTYXkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9kbWEtYnVmL2RtYS1m
ZW5jZS5jIGIvZHJpdmVycy9kbWEtYnVmL2RtYS1mZW5jZS5jDQo+PiBpbmRleCA1OWFjOTZlYzdi
YTguLmU1NjY0NDUxMzRhMiAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtZmVu
Y2UuYw0KPj4gKysrIGIvZHJpdmVycy9kbWEtYnVmL2RtYS1mZW5jZS5jDQo+PiBAQCAtMzQ1LDM4
ICszNDUsMzEgQEAgaW50IGRtYV9mZW5jZV9hZGRfY2FsbGJhY2soc3RydWN0IGRtYV9mZW5jZSAq
ZmVuY2UsIHN0cnVjdCBkbWFfZmVuY2VfY2IgKmNiLA0KPj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGRtYV9mZW5jZV9mdW5jX3QgZnVuYykNCj4+ICAgew0KPj4gICAgICAgICAgdW5zaWdu
ZWQgbG9uZyBmbGFnczsNCj4+IC0gICAgICAgaW50IHJldCA9IDA7DQo+PiAtICAgICAgIGJvb2wg
d2FzX3NldDsNCj4+ICsgICAgICAgaW50IHJldCA9IC1FTk9FTlQ7DQo+Pg0KPj4gICAgICAgICAg
aWYgKFdBUk5fT04oIWZlbmNlIHx8ICFmdW5jKSkNCj4+ICAgICAgICAgICAgICAgICAgcmV0dXJu
IC1FSU5WQUw7DQo+Pg0KPj4gLSAgICAgICBpZiAodGVzdF9iaXQoRE1BX0ZFTkNFX0ZMQUdfU0lH
TkFMRURfQklULCAmZmVuY2UtPmZsYWdzKSkgew0KPj4gLSAgICAgICAgICAgICAgIElOSVRfTElT
VF9IRUFEKCZjYi0+bm9kZSk7DQo+PiArICAgICAgIElOSVRfTElTVF9IRUFEKCZjYi0+bm9kZSk7
DQo+PiArICAgICAgIGNiLT5mdW5jID0gZnVuYzsNCj4+ICsNCj4+ICsgICAgICAgaWYgKHRlc3Rf
Yml0KERNQV9GRU5DRV9GTEFHX1NJR05BTEVEX0JJVCwgJmZlbmNlLT5mbGFncykpDQo+PiAgICAg
ICAgICAgICAgICAgIHJldHVybiAtRU5PRU5UOw0KPj4gLSAgICAgICB9DQo+Pg0KPj4gICAgICAg
ICAgc3Bpbl9sb2NrX2lycXNhdmUoZmVuY2UtPmxvY2ssIGZsYWdzKTsNCj4+IC0NCj4+IC0gICAg
ICAgd2FzX3NldCA9IHRlc3RfYW5kX3NldF9iaXQoRE1BX0ZFTkNFX0ZMQUdfRU5BQkxFX1NJR05B
TF9CSVQsDQo+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZmZW5jZS0+Zmxh
Z3MpOw0KPj4gLQ0KPj4gLSAgICAgICBpZiAodGVzdF9iaXQoRE1BX0ZFTkNFX0ZMQUdfU0lHTkFM
RURfQklULCAmZmVuY2UtPmZsYWdzKSkNCj4+IC0gICAgICAgICAgICAgICByZXQgPSAtRU5PRU5U
Ow0KPj4gLSAgICAgICBlbHNlIGlmICghd2FzX3NldCAmJiBmZW5jZS0+b3BzLT5lbmFibGVfc2ln
bmFsaW5nKSB7DQo+PiArICAgICAgIGlmICghdGVzdF9iaXQoRE1BX0ZFTkNFX0ZMQUdfU0lHTkFM
RURfQklULCAmZmVuY2UtPmZsYWdzKSAmJg0KPj4gKyAgICAgICAgICAgIXRlc3RfYW5kX3NldF9i
aXQoRE1BX0ZFTkNFX0ZMQUdfRU5BQkxFX1NJR05BTF9CSVQsDQo+PiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAmZmVuY2UtPmZsYWdzKSkgew0KPj4gICAgICAgICAgICAgICAgICB0cmFj
ZV9kbWFfZmVuY2VfZW5hYmxlX3NpZ25hbChmZW5jZSk7DQo+Pg0KPj4gLSAgICAgICAgICAgICAg
IGlmICghZmVuY2UtPm9wcy0+ZW5hYmxlX3NpZ25hbGluZyhmZW5jZSkpIHsNCj4+ICsgICAgICAg
ICAgICAgICBpZiAoIWZlbmNlLT5vcHMtPmVuYWJsZV9zaWduYWxpbmcgfHwNCj4+ICsgICAgICAg
ICAgICAgICAgICAgZmVuY2UtPm9wcy0+ZW5hYmxlX3NpZ25hbGluZyhmZW5jZSkpIHsNCj4+ICsg
ICAgICAgICAgICAgICAgICAgICAgIGxpc3RfYWRkX3RhaWwoJmNiLT5ub2RlLCAmZmVuY2UtPmNi
X2xpc3QpOw0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0ID0gMDsNCj4+ICsgICAgICAg
ICAgICAgICB9IGVsc2Ugew0KPj4gICAgICAgICAgICAgICAgICAgICAgICAgIGRtYV9mZW5jZV9z
aWduYWxfbG9ja2VkKGZlbmNlKTsNCj4+IC0gICAgICAgICAgICAgICAgICAgICAgIHJldCA9IC1F
Tk9FTlQ7DQo+PiAgICAgICAgICAgICAgICAgIH0NCj4+ICAgICAgICAgIH0NCj4+IC0NCj4+IC0g
ICAgICAgaWYgKCFyZXQpIHsNCj4+IC0gICAgICAgICAgICAgICBjYi0+ZnVuYyA9IGZ1bmM7DQo+
PiAtICAgICAgICAgICAgICAgbGlzdF9hZGRfdGFpbCgmY2ItPm5vZGUsICZmZW5jZS0+Y2JfbGlz
dCk7DQo+PiAtICAgICAgIH0gZWxzZQ0KPj4gLSAgICAgICAgICAgICAgIElOSVRfTElTVF9IRUFE
KCZjYi0+bm9kZSk7DQo+PiAgICAgICAgICBzcGluX3VubG9ja19pcnFyZXN0b3JlKGZlbmNlLT5s
b2NrLCBmbGFncyk7DQo+Pg0KPj4gICAgICAgICAgcmV0dXJuIHJldDsNCj4+DQo+PiBOb3QgYSB3
aG9sZSBsb3QgY2hhbmdlcyBpbiB0ZXJtcyBvZiBicmFuY2hlcyBhbmQgc2VyaWFsaXNpbmcNCj4+
IGluc3RydWN0aW9ucy4gT25lIGxlc3MgYmFmZmxpbmcgc2VxdWVuY2UgdG8gd29ycnkgYWJvdXQu
DQo+IEZ3aXcsDQo+IEZ1bmN0aW9uICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IG9sZCAgICAgbmV3ICAgZGVsdGENCj4gZG1hX2ZlbmNlX2FkZF9jYWxsYmFjayAgICAgICAgICAg
ICAgICAgICAgICAgMzM4ICAgICAzMDIgICAgIC0zNg0KDQpXZWxsIHNpbmNlIHRoZSBzZXF1ZW5j
ZSBudW1iZXIgY2hhbmdlIGRpZG4ndCB3b3JrZWQgb3V0IEknbSBub3cgd29ya2luZyANCm9uIHNv
bWV0aGluZyB3aGVyZSBJIHJlcGxhY2VkIHRoZSBzaGFyZWQgZmVuY2VzIGxpc3Qgd2l0aCBhIHJl
ZmVyZW5jZSANCmNvdW50ZWQgdmVyc2lvbiB3aGVyZSB3ZSBhbHNvIGhhdmUgYW4gYWN0aXZlIGFu
ZCBzdGFnZWQgdmlldyBvZiB0aGUgZmVuY2VzLg0KDQpUaGlzIHJlbW92ZWQgdGhlIHdob2xlIHBy
b2JsZW0gb2Yga2VlcGluZyB0aGluZ3MgYWxpdmUgd2hpbGUgaW5zaWRlIHRoZSANClJDVSBhbmQg
YWxzbyByZW1vdmVzIHRoZSByZXRyeSBsb29waW5nIGV0Yy4uIEFkZGl0aW9uYWwgdG8gdGhhdCB3
ZSBjYW4gDQphbHNvIGdldCByaWQgb2YgbW9zdCBvZiB0aGUgbWVtb3J5IGJhcnJpZXJzIHdoaWxl
IGFkZGluZyBhbmQgDQptYW5pcHVsYXRpbmcgZmVuY2VzLg0KDQpUaGUgZW5kIHJlc3VsdCBpbiBh
IHRvdGFsbHkgYXJ0aWZpY2lhbCBjb21tYW5kIHN1Ym1pc3Npb24gdGVzdCBjYXNlIGlzIGEgDQo2
MSUgcGVyZm9ybWFuY2UgaW1wcm92ZW1lbnQuIFRoaXMgaXMgc28gbXVjaCB0aGF0IEknbSBhY3R1
YWxseSBzdGlsbCANCnNlYXJjaGluZyBpZiB0aGF0IGlzIG5vdCBjYXVzZWQgYnkgYnVnIHNvbWV3
aGVyZS4NCg0KV2lsbCBwcm9iYWJseSBuZWVkIHNvbWUgbW9yZSB3ZWVrcyB0aWxsIHRoaXMgaXMg
ZG9uZSwgYnV0IHllYWggdGhlcmUgaXMgDQphIGh1Z2UgcG90ZW50aWFsIGZvciBvcHRpbWl6YXRp
b24gaGVyZSwNCkNocmlzdGlhbi4NCg0KPg0KPiBBbG1vc3QgY2VydGFpbmx5IG1vcmUgc2hhdmlu
ZyBpZiB5b3Ugc3RhcmUuDQo+IC1DaHJpcw0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
