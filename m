Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5C168AFA
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2019 15:38:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95D5889812;
	Mon, 15 Jul 2019 13:38:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780054.outbound.protection.outlook.com [40.107.78.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D38C89812
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 13:38:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n+9DcNgD4nrtxCU4VnzgMDdiQeOnizPsMnKnxaBGCJ7HMNk0GiWv00E1eyfP8zFPk/qZoNWRRPMtdOmf7HNtZwStvcAHLVfrpaKRjGcvX5+mBZiJ5T6yEiLLGzWZLDaWzZde10HEDl78bUcuvjFSHRMOdt4ExctzivNLfDRh1F8oJ1PaO0wkLiJmL65yAVW78+xGX1DjMg+6CEk0SMF6Ab2QhcarFr7anAooSy6yFZWtFAKu3doHorhmn5io073uTS56ojtLdk+p3oUtnOV/78FUw2OUMTNzrigpHieI0SF/0wxAJl/3f3iSR5vD/NFz5HQzXqAwgwSi5Ua60bwdLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vTHsTsCKLAi8vT3kHT9WTX0SJAvOyZrE2B3j0BJ5B5w=;
 b=hHUxCKbywQUvKHd9BmtaiMsGjRODjlY9FL0AfxR/nBwAg3pKLXwm3nKQs3mRaqNuwrGhYzs46X5jq+6s1pj5tW2VI1fO1ST3CUV+79Vk533SFIki0kJ2+n1NI1uePcm9o3OI9wXcq5XnE+FxD/YFOXLmlikAVGxEVqzXh81CWwOhGEnBXY4NN7Z8u2Z8iwxrXvT6xMh14cz31iMc53GAZl3shrs9lsOwffB7PJk8tIfC3nqn7pZXfv28B6iaKNF6Wfo3CQ7bJgzn6VOXY8x9mziAB+5OnbiTA4kDk7OO6+A6AX30rsWzZYLdMWIRrNdT9W5fXxN1SXK2AbzyIHIUSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1370.namprd12.prod.outlook.com (10.168.238.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Mon, 15 Jul 2019 13:38:46 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::cda7:cfc1:ce62:bcb7]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::cda7:cfc1:ce62:bcb7%10]) with mapi id 15.20.2073.012; Mon, 15 Jul
 2019 13:38:46 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [bug report] drm/ttm: add transparent huge page support for DMA
 allocations v2
Thread-Topic: [bug report] drm/ttm: add transparent huge page support for DMA
 allocations v2
Thread-Index: AQHVLPGOv8ZFH37+40SwLhEqcDKxyqavrjOAgAAKLQCAAATKgIAAANEAgAAEAICAAO1lgIAABzYAgAS+OoCAFiTrAIAAJEcAgAANUoA=
Date: Mon, 15 Jul 2019 13:38:46 +0000
Message-ID: <a8343f54-4a55-8558-a687-127e9e29caa6@amd.com>
References: <20190627140626.GA6027@mwanda>
 <41b33cc3-2f07-681a-5fee-25a328de46bd@amd.com>
 <20190627165532.GD10652@lst.de>
 <278388a6-bd2d-2891-19be-97e33bc470a5@amd.com>
 <20190627171536.GA11117@lst.de>
 <f851fb21-fdf6-f5d7-0f53-7d6ed060b191@amd.com>
 <20190628073935.GA29114@lst.de>
 <32b2a05f-735a-92ef-cc09-67b8017015ee@amd.com>
 <20190701083117.GA22587@lst.de>
 <4af89284-b37a-83fd-6962-45fe2c064c16@amd.com> <20190715125058.GA4384@lst.de>
In-Reply-To: <20190715125058.GA4384@lst.de>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: VI1P195CA0093.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:59::46) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3c55563e-9b4f-4b94-87d2-08d70929c2b5
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1370; 
x-ms-traffictypediagnostic: DM5PR12MB1370:
x-microsoft-antispam-prvs: <DM5PR12MB1370857893BC04B9591B472583CF0@DM5PR12MB1370.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 00997889E7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(376002)(39860400002)(366004)(346002)(199004)(189003)(476003)(2616005)(66946007)(66476007)(66556008)(64756008)(66446008)(76176011)(386003)(102836004)(486006)(11346002)(446003)(86362001)(31696002)(52116002)(8936002)(5660300002)(81166006)(81156014)(65826007)(6512007)(53936002)(6436002)(6246003)(31686004)(14444005)(186003)(256004)(2906002)(6486002)(6506007)(46003)(68736007)(6916009)(25786009)(58126008)(99286004)(54906003)(316002)(71190400001)(71200400001)(64126003)(8676002)(4326008)(14454004)(478600001)(229853002)(7736002)(36756003)(65806001)(305945005)(65956001)(6116002)(14583001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1370;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: xyHdS8uhgIy8h9aDF4rlk3UCMriiMQa15dnA47LdeTeZ0I9r8cKUBh3C9GZL2m3Sn8xjUoQhtckjjcjIe6+rLdE17mgaoHB1QJkS5pmOJvogW/SU65E12LCCOcsUhSFUuRso4074aHoJCuAH6SVT7wsyx8L2/4zY7lgO+iYr3uPSKw4ZdnnmeM29ccPpGa0Bzt8ZwfvOEnhHUf2HIm7GOJEzqsHM+0KOiIBdQpV8gUJrLKAOhvVcD3g25Op47kQ90mMh86jRoFccpqXA0KmTHv3Djk5uYRlyrzp+b7tp2IvpWl5MudTrCfXmrNddNsO345+vJrXODbol/V/oOxlh+KUam7W8vO9s1EiE6K9P9WIjCt6s2PJlklLFMcVNEawdOtN1xJIl+/AjYx8aa3ioorkzx5i6Y6Ta8F+dqOWASOo=
Content-ID: <10CD1A11F7D29C4F9C25CB08C5FE41E0@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c55563e-9b4f-4b94-87d2-08d70929c2b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2019 13:38:46.4002 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ckoenig@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1370
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vTHsTsCKLAi8vT3kHT9WTX0SJAvOyZrE2B3j0BJ5B5w=;
 b=s0TG4hlE3Rku9+iLu1L/FfHDmVkz0+z0ccDuyNkX5XzTxIjhxIdRlVGwf5GYi6VlZFlUI8DHYbbyRQivV/xRUGj8+JPtlCmzU6OwQdq7CJPr1CjEtWaWyFLVm7MfatGLcXMeHL8sy4ywYxJ+Ia2L0OZEvSu+J35C+P7E88WCkoY=
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTUuMDcuMTkgdW0gMTQ6NTAgc2NocmllYiBDaHJpc3RvcGggSGVsbHdpZzoNCj4gT24gTW9u
LCBKdWwgMTUsIDIwMTkgYXQgMTA6NDE6MTRBTSArMDAwMCwgS29lbmlnLCBDaHJpc3RpYW4gd3Jv
dGU6DQo+IFtTTklQXQ0KPj4+Pj4gdGhhdCBhcmUgRE1BIGNvaGVyZW50LiAgQWRkaW5nIGEgRE1B
X0FUVFJfVU5DQUNIRUQgd291bGQgYmUgbW9zdGx5DQo+Pj4+PiB0cml2aWFsLCB3ZSBqdXN0IG5l
ZWQgdG8gZGVmaW5lIHByb3BlciBzZW1hbnRpY3MgZm9yIGl0Lg0KPj4+PiBTb3VuZHMgZ29vZC4g
Q2FuIHlvdSBkbyB0aGlzPyBDYXVzZSBJIG9ubHkga25vdyB4ODYgYW5kIGEgZmV3IGJpdHMgb2Yg
QVJNLg0KPj4+IFNvIHdoYXQgc2VtYW50aWNzIGRvIHlvdSBuZWVkPyAgR2l2ZW4gdGhhdCB3ZSBo
YXZlIHNvbWUgYXJjaGl0ZWN0dXJlcw0KPj4+IHRoYXQgY2FuJ3Qgc2V0IHBhZ2VzIGFzIHVuY2Fj
aGVkIGF0IHJ1bnRpbWUgaXQgZWl0aGVyIGhhcyB0byBiZSBhIGhpbnQsDQo+Pj4gb3Igd2UgY291
bGQgZmFpbCBpdCBpZiBub3Qgc3VwcG9ydGVkIGJ5IGltcGxlbWVudGF0aW9uLiAgV2hpY2ggb25l
IHdvdWxkDQo+Pj4geW91IHByZWZlcj8NCj4+IFdlbGwgZmlyc3Qgb2YgYWxsIEkgdGhpbmsgd2Ug
bmVlZCBhIGZ1bmN0aW9uIHdoaWNoIGNhbiB0ZWxsIGlmIGl0J3MNCj4+IHN1cHBvcnRlZCBpbiBn
ZW5lcmFsIG9uIHRoZSBjdXJyZW50IGFyY2hpdGVjdHVyZS4NCj4+DQo+PiBUaGVuIEkndmUgYXNr
ZWQgYXJvdW5kIGEgYml0IGFuZCB3ZSB1bmZvcnR1bmF0ZWx5IGZvdW5kIGEgZmV3IG1vcmUgY2Fz
ZXMNCj4+IEkgZGlkbid0IGtuZXcgYmVmb3JlIHdoZXJlIHVuY2FjaGVkIGFjY2VzcyB0byBzeXN0
ZW0gbWVtb3J5IGlzDQo+PiBtYW5kYXRvcnkuIFRoZSBvbmx5IGdvb2QgbmV3cyBJIGhhdmUgaXMg
dGhhdCB0aGUgQU1EIGRldmljZXMgbmVlZGluZw0KPj4gdGhhdCBhcmUgYWxsIGludGVncmF0ZWQg
aW50byB0aGUgQ1BVLiBTbyBhdCBsZWFzdCBmb3IgQU1EIGhhcmR3YXJlIHdlDQo+PiBjYW4gc2Fm
ZWx5IGFzc3VtZSB4ODYgZm9yIHRob3NlIGNhc2VzLg0KPj4NCj4+IEJ1dCBiZWNhdXNlIG9mIHRo
YXQgSSB3b3VsZCBzYXkgd2Ugc2hvdWxkIGhhcmQgZmFpbCBpZiBpdCBpcyBub3QNCj4+IHBvc3Np
YmxlIHRvIGdldCBzb21lIHVuY2FjaGVkIG1lbW9yeS4NCj4gU28gSSBndWVzcyB0aGUgc2VtYW50
aWNzIHByZWZlcnJlZCBieSB5b3UgaXMgYSBETUFfQVRUUl9VTkNBQ0hFRCBmbGFnDQo+IHRoYXQg
d291bGQgZmFpbCBpZiBub3Qgc3VwcG9ydGVkLiAgVGhhdCBzaG91bGQgYmUgcmVsYXRpdmVseSBl
YXN5DQo+IHRvIHN1cHBvcnQuICBJbml0aWFsbHkgeW91J2QgbmVlZCB0aGF0IG9uIHg4NiB3aXRo
IHRoZSBkaXJlY3QgbWFwcGluZw0KPiBhbmQgQU1EIElPTU1VPw0KDQpDdXJyZW50bHkgSSBuZWVk
IHRoYXQgZm9yIGJvdGggZG1hX2FsbG9jX2F0dHJzKCkgYW5kIGRtYV9tYXBfcGFnZV9hdHRycygp
Lg0KDQpCdXQgSSBob3BlIHRvIGdldCByaWQgb2YgdGhlIHVuY2FjaGVkIHVzZSBjYXNlIGZvciBk
bWFfbWFwX3BhZ2VfYXR0cnMoKSANCmFuZCBvbmx5IHVzZSBkbWFfYWxsb2NfYXR0cnMoKS4NCg0K
U28gaWYgdGhhdCBtYWtlcyB0aGluZ3MgZWFzaWVyIHlvdSBjYW4ganVzdCBpZ25vcmUgZG1hX21h
cF9wYWdlX2F0dHJzKCkgDQphbmQgd2UganVzdCBjb250aW51ZSB0byB1c2UgdGhlIGhhY2sgd2Ug
YWxyZWFkeSBoYXZlIHRpbGwgSSBtYW5hZ2UgdG8gDQptaWdyYXRlIGFsbCBkcml2ZXJzIHVzaW5n
IFRUTSBhd2F5IGZyb20gdGhhdC4NCg0KPj4gV2hlbiB3ZSByZXR1cm4gYSBwcm9wZXIgZXJyb3Ig
Y29kZSB3ZSBhdCBsZWFzdCBnaXZlIHRoZSB1c2VyIGEgZ29vZCBpZGVhDQo+PiBvZiB3aGF0J3Mg
Z29pbmcgd3JvbmcuDQo+Pg0KPj4gSSBtZWFuIHRoZSBvbmx5IG90aGVyIHBvc3NpYmxlIHdvcmth
cm91bmQgaW4gdGhlIGtlcm5lbCBJIGNhbiBzZWUgaXMgdG8NCj4+IGluc3RlYWQgb2YgdHJ5aW5n
IHRvIG1hcCBhIHBhZ2UgYmFja2luZyBhIGNlcnRhaW4gdXNlcnNwYWNlIGFkZHJlc3MgaXMNCj4+
IHRvIGNoYW5nZSB3aGVyZSB0aGlzIHVzZXJzcGFjZSBhZGRyZXNzIGlzIHBvaW50aW5nIHRvLiBZ
b3Uga25vdyB3aGF0IEkNCj4+IG1lYW4/IChJdCdzIGtpbmQgb2YgaGFyZCB0byBleHBsYWluIGJl
Y2F1c2UgSSdtIG5vdCBhIG5hdGl2ZSBzcGVha2VyIG9mDQo+PiBFbmdsaXNoKSBCdXQgdGhhdCBh
cHByb2FjaCBzb3VuZHMgbGlrZSBhIGRlZXAgcmFiYml0IGhvbGUgdG8gbWUuDQo+IElzbid0IHRo
YXQga2luZGEgd2hhdCB3ZSBhcmUgZG9pbmcgZm9yIHRoZSBkZXZpY2UgcHJpdmF0ZSBtZW1vcnkN
Cj4gd29yayBpbiBobW0/ICBCdXQgaXQgY291bGQgY2VydGFpbmx5IGdvIGRvd24gYSByYXRob2xl
IGZhc3QuDQoNCk9oLCBnb29kIHBvaW50LiBZZWFoIHRoYXQgaXMgdmVyeSBzaW1pbGFyLg0KDQpJ
bnN0ZWFkIG9mIHJlcGxhY2luZyB0aGUgc3lzdGVtIG1lbW9yeSBwYWdlIHdpdGggYSBkZXZpY2Ug
bWVtb3J5IHBhZ2UsIA0Kd2Ugd291bGQgcmVwbGFjZSBvbmUgaW5hY2Nlc3NpYmxlIHN5c3RlbSBt
ZW1vcnkgcGFnZSB3aXRoIGFuIGFjY2Vzc2libGUgDQpvbmUuIEJ1dCBhcGFydCBmcm9tIHRoYXQg
aXQgaXMgZXNzZW50aWFsbHkgdGhlIHNhbWUgZnVuY3Rpb25hbGl0eS4NCg0KUmVnYXJkcywNCkNo
cmlzdGlhbi4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
