Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 007FD6E55A
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2019 14:05:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEB776E81B;
	Fri, 19 Jul 2019 12:05:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820049.outbound.protection.outlook.com [40.107.82.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23F256E81B;
 Fri, 19 Jul 2019 12:05:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kWN+gseG0UE7W/mUz/HAunG2Ivzu7AU7yCz72HNSfKXgnCEZagadTRmg1/rDnYoDGEvZZjpTz9f9BLquLPSQTJwoMiqa4aBAZl450db2zAJ9iAqZssV9mCxIdybtWTRcsYZZuOMARPR0qE5kn7ndBZvrnsI7m4/A6nepk64+al7p7Ufj3oLX6Jcz8KRVEMOHYCrVcGH1ZVUVjZcih44SbOvh0iu2XhqeK1Y025Bew6tbORemDRnB4HMJibHDzdT+Ai16SbhtiCVToqXpRA8qS7x2fvh50TVQA9AZ9vgIsV6eAnHvnPw20vn0Kg3820y2WevjUngq29Vwkk9bZA5oZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mOvOqRDoWekAJWKA6tcpztdeWegXtsWqlDzrbEMmtmo=;
 b=EE+pLtS7Z1VhKwmZ/9pWI/s7ra/CnDHE4SHXDnu6a+0F+ls8MZ010Lux1IgmQjVnrCqTsfGGJwYh2oFAQSsUepGdIB0rPtIi94s0JA573707EMGRyt2b2QAjNF8Vugt3003zqtPdCZX9UE95U0zlZn7HEbUKpqM8d6ie/hLpyKo++fn+EFz+d2a3xwAbzE2jNZ6tCX4zjNEMYbVOAxrZCr9k9fln5gyogJ5+MKZ+9iflURvO9UCKRm3Xg7FRyM4tYCkTrqQHt77Rp4Zs2pMcUHSvEFktLZgQM3Mp9gHDIzOdZ3k8Zac7ePgCBlDNgVBzG4SDAOR9eIJ+r0SO5F9Rtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1242.namprd12.prod.outlook.com (10.168.233.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.12; Fri, 19 Jul 2019 12:05:37 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::cda7:cfc1:ce62:bcb7]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::cda7:cfc1:ce62:bcb7%10]) with mapi id 15.20.2094.011; Fri, 19 Jul
 2019 12:05:36 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 1/6] dma-buf: add dynamic DMA-buf handling v13
Thread-Topic: [PATCH 1/6] dma-buf: add dynamic DMA-buf handling v13
Thread-Index: AQHVPhATRhK3fufdkUGFBmd2Z3oLpabRqHcAgAAE9wCAACr3gA==
Date: Fri, 19 Jul 2019 12:05:36 +0000
Message-ID: <ff12f6e0-f34b-5ea0-72d5-851ef6bb141f@amd.com>
References: <20190626122310.1498-1-christian.koenig@amd.com>
 <20190626122933.GK12905@phenom.ffwll.local>
 <ef70981d-3d52-b339-b3f5-190635969621@gmail.com>
 <20190719085757.GD15868@phenom.ffwll.local>
 <4704d3c5-894d-6ac1-4afb-06c275700bac@amd.com>
 <20190719093144.GK15868@phenom.ffwll.local>
In-Reply-To: <20190719093144.GK15868@phenom.ffwll.local>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR0P264CA0062.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1d::26) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ef19b6b1-53ce-4ebe-4345-08d70c4168c2
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1242; 
x-ms-traffictypediagnostic: DM5PR12MB1242:
x-microsoft-antispam-prvs: <DM5PR12MB12425F2955A04B568288A06383CB0@DM5PR12MB1242.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01039C93E4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(376002)(136003)(346002)(39860400002)(396003)(199004)(189003)(25786009)(316002)(54906003)(58126008)(99286004)(76176011)(6506007)(102836004)(486006)(229853002)(8676002)(478600001)(71200400001)(71190400001)(64126003)(4326008)(14454004)(66574012)(52116002)(386003)(256004)(186003)(6486002)(68736007)(8936002)(6116002)(81156014)(81166006)(31686004)(53936002)(6246003)(6436002)(6512007)(36756003)(446003)(11346002)(7736002)(66476007)(66946007)(66446008)(66556008)(64756008)(305945005)(2616005)(476003)(2906002)(5660300002)(31696002)(86362001)(65826007)(6916009)(65956001)(46003)(65806001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1242;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 82jQ0xxwIqHfxKZWAfzOK+1Y/x4pgEcf8FGsnVuy3z3xOdsMymCVMDvRvlLyimBaV1p/8j7zTG2v//xiGG6lFTlNusy7zIjwRZkTHwZRLOFISOEVqP48Ldfgjtgx8/AM+v6WFy3Ic4IjUH0rDPuke93/rb2fTpMrrINYePIS6dSdUoNRF2KoD/Bn25yt3Po1WNxDjHM26JESt0xghW9+CELArwRfJpk37yeVXBvz4gX16A8y6yiwyRiKM8SLGutJTkmtV4Bq2GIqvTAZcMr/3kkrUNHw+2mXKvE+NFhDeSuSQAenQMPLTZ909VV9P2FtafWquAHt3X1ioedu+WD8Lss+Vsf7VHhf+1jeXIvHdQ8TfDkLdTa0iaNX2738MPiYdwQjoSnvvLfqoEnUQmJYpwHQN15J6InoFWF5HTbJ2MA=
Content-ID: <F230BD57A5CDF44DADE90031707A9037@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef19b6b1-53ce-4ebe-4345-08d70c4168c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2019 12:05:36.8155 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ckoenig@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1242
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mOvOqRDoWekAJWKA6tcpztdeWegXtsWqlDzrbEMmtmo=;
 b=1IZGYvh5o223zlT1kwNNtmnhzbY/V/BAxYlhbt2NkUiEzs620eIOc+9uYxfpD/zzc6YCeM3NrLSkopkFSy8MpGsdn4WJfKu4szmk2CZ3zZOcg87YYDyLwjRXY6AIA0A6Uh5fUMmS2QWwGU+DzQeReLkENqO42aa6zwtp478BKqs=
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTkuMDcuMTkgdW0gMTE6MzEgc2NocmllYiBEYW5pZWwgVmV0dGVyOg0KPiBPbiBGcmksIEp1
bCAxOSwgMjAxOSBhdCAwOToxNDowNUFNICswMDAwLCBLb2VuaWcsIENocmlzdGlhbiB3cm90ZToN
Cj4+IEFtIDE5LjA3LjE5IHVtIDEwOjU3IHNjaHJpZWIgRGFuaWVsIFZldHRlcjoNCj4+PiBPbiBU
dWUsIEp1bCAxNiwgMjAxOSBhdCAwNDoyMTo1M1BNICswMjAwLCBDaHJpc3RpYW4gS8O2bmlnIHdy
b3RlOg0KPj4+PiBBbSAyNi4wNi4xOSB1bSAxNDoyOSBzY2hyaWViIERhbmllbCBWZXR0ZXI6DQo+
Pj4+IFtTTklQXQ0KPj4+IFdlbGwgbXkgbWFpbCBoZXJlIHByZWNlZWRlZCB0aGUgZW50aXJlIGFt
ZGtmZCBldmljdGlvbl9mZW5jZSBkaXNjdXNzaW9uLg0KPj4+IFdpdGggdGhhdCBJJ20gbm90IHN1
cmUgYW55bW9yZSwgc2luY2Ugd2UgZG9uJ3QgcmVhbGx5IG5lZWQgdHdvIGFwcHJvYWNoZXMNCj4+
PiBvZiB0aGUgc2FtZSB0aGluZy4gQW5kIGlmIHRoZSBwbGFuIGlzIHRvIG1vdmUgYW1ka2ZkIG92
ZXIgZnJvbSB0aGUNCj4+PiBldmljdGlvbl9mZW5jZSB0cmljayB0byB1c2luZyB0aGUgaW52YWxp
ZGF0ZSBjYWxsYmFjayBoZXJlLCB0aGVuIEkgdGhpbmsNCj4+PiB3ZSBtaWdodCBuZWVkIHNvbWUg
Y2xhcmlmaWNhdGlvbnMgb24gd2hhdCBleGFjdGx5IHRoYXQgbWVhbnMuDQo+PiBNaG0sIEkgdGhv
dWdodCB0aGF0IHRoaXMgd2FzIG9ydGhvZ29uYWwuIEkgbWVhbiB0aGUgaW52YWxpZGF0aW9uDQo+
PiBjYWxsYmFjayBmb3IgYSBidWZmZXIgYXJlIGluZGVwZW5kZW50IGZyb20gaG93IHRoZSBkcml2
ZXIgaXMgZ29pbmcgdG8NCj4+IHVzZSBpdCBpbiB0aGUgZW5kLg0KPj4NCj4+IE9yIGRvIHlvdSBt
ZWFuIHRoYXQgd2UgY291bGQgdXNlIGZlbmNlcyBhbmQgc2F2ZSB1cyBmcm9tIGFkZGluZyBqdXN0
DQo+PiBhbm90aGVyIG1lY2hhbmlzbSBmb3IgdGhlIHNhbWUgc2lnbmFsaW5nIHRoaW5nPw0KPj4N
Cj4+IFRoYXQgY291bGQgb2YgY291cnNlIHdvcmssIGJ1dCBJIGhhZCB0aGUgaW1wcmVzc2lvbiB0
aGF0IHlvdSBhcmUgbm90DQo+PiB2ZXJ5IGluIGZhdm9yIG9mIHRoYXQuDQo+IEl0IHdvbid0LCBz
aW5jZSB5b3UgY2FuIGVpdGhlciB1c2UgdGhlIGZlbmNlIGFzIHRoZSBpbnZhbGlkYXRlIGNhbGxi
YWNrLA0KPiBvciBhcyBhIGZlbmNlIChmb3IgaW1wbGljaXQgc3luYykuIEJ1dCBub3QgYm90aC4N
Cg0KV2h5IG5vdCBib3RoPyBJIG1lYW4gaW1wbGljaXQgc3luYyBpcyBhbiBhcnRpZmFjdCB5b3Ug
bmVlZCB0byBoYW5kbGUgDQpzZXBhcmF0ZWx5IGFueXdheS4NCg0KPiBCdXQgSSBhbHNvIGRvbid0
IHRoaW5rIGl0J3MgYSBnb29kIGlkZWEgdG8gaGF2ZSAyIGludmFsaWRhdGlvbiBtZWNoYW5pc21z
LA0KPiBhbmQgc2luY2Ugd2UgZG8gaGF2ZSBvbmUgbWVyZ2VkIGluLXRyZWUgYWxyZWFkeSB3b3Vs
ZCBiZSBnb29kIHRvIHByb29mDQo+IHRoYXQgdGhlIG5ldyBvbmUgaXMgdXAgdG8gdGhlIGV4aXN0
aW5nIGNoYWxsZW5nZS4NCg0KT2ssIGhvdyB0byBwcm9jZWVkIHRoZW4/IFNob3VsZCBJIGZpeCB1
cCB0aGUgaW1wbGljaXQgc3luY2luZyBvZiBmZW5jZXMgDQpmaXJzdD8gSSd2ZSBnbyBhIGNvdXBs
ZSBvZiBpZGVhcyBmb3IgdGhhdCBhcyB3ZWxsLg0KDQpUaGlzIHdheSB3ZSB3b24ndCBoYXZlIGFu
eSBkcml2ZXIgc3BlY2lmaWMgZGVmaW5pdGlvbiBvZiB3aGF0IHRoZSBmZW5jZXMgDQppbiBhIHJl
c2VydmF0aW9uIG9iamVjdCBtZWFuIGFueSBtb3JlLg0KDQo+IEZvciBjb250ZXh0OiBJIHNwZW5k
IHdheSB0b28gbXVjaCB0aW1lIHJlYWRpbmcgdHRtLCBhbWRncHUva2ZkIGFuZCBpOTE1LWdlbQ0K
PiBjb2RlIGFuZCBteSBvdmVyYWxsIGltcHJlc3Npb24gaXMgdGhhdCBldmVyeW9uZSdzIGp1c3Qg
cnVubmluZyBhcm91bmQgaW4NCj4gb3Bwb3NpdGUgZGlyZWN0aW9ucyBhbmQgaXQncyBvbmUgaHVn
ZSBoYWlyYmFsbCBvZiBhIG1lc3MuIFdpdGggYSBwcmV0dHkNCj4gZXZlbiBkaXN0cmlidXRpb24g
b2YgZXF1YWxseSAiZWVrIHRoaXMgaXMgaG9ycmlibGUiIGJ1dCBhbHNvICJ3b3cgdGhpcyBpcw0K
PiBtdWNoIGJldHRlciB0aGFuIHdoYXQgdGhlIG90aGVyIGRyaXZlciBkb2VzIi4gU28gdGhhdCdz
IHdoeSBJJ20gZXZlbiBtb3JlDQo+IG9uIHRoZSAiYXJlIHdlIHN1cmUgdGhpcyBpcyB0aGUgcmln
aHQgdGhpbmciIHRyYWluLg0KDQpUb3RhbGx5IGFncmVlIG9uIHRoYXQsIGJ1dCB3ZSBzaG91bGQg
YWxzbyBub3QgbWFrZSB0aGUgbWlzdGFrZSB3ZSBoYXZlIA0Kc2VlbiBvbiBXaW5kb3dzIHRvIHRy
eSB0byBmb3JjZSBhbGwgZHJpdmVycyBpbnRvIGEgY29tbW9uIG1lbW9yeSBtYW5hZ2VtZW50Lg0K
DQpUaGF0IGRpZG4ndCB3b3JrZWQgb3V0IHRoYXQgd2VsbCBpbiB0aGUgZW5kIGFuZCBJIHdvdWxk
IHJhdGhlciBnbyBkb3duIA0KdGhlIHJvdXRlIG9mIHRyeWluZyB0byBtb3ZlIGxvZ2ljIGludG8g
c2VwYXJhdGUgY29tcG9uZW50cyBhbmQgYmFja2luZyANCm9mZiBpbnRvIGRyaXZlciBzcGVjaWZp
YyBsb2dpYyBpZiB3ZSBmb3VuZCB0aGF0IGNvbW1vbiBzdHVmZiBkb2Vzbid0IHdvcmsuDQoNCkNo
cmlzdGlhbi4NCg0KPiAtRGFuaWVsDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
