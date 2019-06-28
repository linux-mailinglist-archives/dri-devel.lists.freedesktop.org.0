Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90FC559437
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 08:32:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C21666E882;
	Fri, 28 Jun 2019 06:32:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760087.outbound.protection.outlook.com [40.107.76.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38DC86E881;
 Fri, 28 Jun 2019 06:32:18 +0000 (UTC)
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1388.namprd12.prod.outlook.com (10.168.239.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Fri, 28 Jun 2019 06:32:15 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::7d27:3c4d:aed6:2935]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::7d27:3c4d:aed6:2935%6]) with mapi id 15.20.2008.018; Fri, 28 Jun 2019
 06:32:15 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 2/2] dma-buf: cleanup shared fence removal
Thread-Topic: [PATCH 2/2] dma-buf: cleanup shared fence removal
Thread-Index: AQHVLP3VMWiF09ciQkWCisybAkUKsaavpWqAgAAXJ4CAAAKTAIAALBUAgACxN4A=
Date: Fri, 28 Jun 2019 06:32:15 +0000
Message-ID: <6e9b4005-e490-ab27-2051-1eab801dafd3@amd.com>
References: <20190627101813.61430-1-christian.koenig@amd.com>
 <20190627101813.61430-2-christian.koenig@amd.com>
 <CAKMK7uGtdSxVSUor8P_8XH+uf4_A-kRfY6h+XnJoizscWE4AOg@mail.gmail.com>
 <f1a792c2-87e0-9aba-c6f1-0374122d025b@gmail.com>
 <CAKMK7uFoeugD0ASHm4DRLzq6h3aAvNhE1ODh-bxoH7Lucf1m3w@mail.gmail.com>
 <5e182e5d-efcb-00bd-fa31-6e8bc9571ce6@amd.com>
 <20190627171053.GN12905@phenom.ffwll.local>
 <4844af2e-fbff-ceb9-c16e-32bb7012559f@amd.com>
 <CAKMK7uF2Wb_K9MqALs8o_2i+HDhv=JcnHj6t4VAUO80UVpszZQ@mail.gmail.com>
In-Reply-To: <CAKMK7uF2Wb_K9MqALs8o_2i+HDhv=JcnHj6t4VAUO80UVpszZQ@mail.gmail.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR0P264CA0059.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1d::23) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ec09e1f2-a954-400d-dfd8-08d6fb925c7d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1388; 
x-ms-traffictypediagnostic: DM5PR12MB1388:
x-microsoft-antispam-prvs: <DM5PR12MB1388609462B3FC356995904383FC0@DM5PR12MB1388.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 00826B6158
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(376002)(346002)(39860400002)(396003)(136003)(199004)(189003)(76176011)(2906002)(99286004)(64756008)(478600001)(66556008)(58126008)(229853002)(316002)(5660300002)(71190400001)(71200400001)(6506007)(52116002)(446003)(2616005)(11346002)(65826007)(476003)(65956001)(86362001)(73956011)(31696002)(54906003)(6436002)(186003)(46003)(66476007)(6916009)(65806001)(66446008)(6486002)(486006)(66946007)(6512007)(36756003)(305945005)(72206003)(102836004)(7736002)(256004)(14444005)(5024004)(64126003)(81166006)(31686004)(53936002)(25786009)(14454004)(81156014)(386003)(4326008)(8936002)(68736007)(6246003)(6116002)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1388;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: dapsPHphyHVoNUyp3JqQ05PjQac4aX6kHIcUgTJPAKOECPCPLUUgblaicMXfQSSDe2SoU4EnTvownNxWrDOfbHTGewsjldl+OHD0z8IbKiyfppKHCDeNH/kwy7YE3MXaz5H2oO8PN+wcKBD9VKKToFwHfdll12oq1cCUFjrMRd63AJV1yLem5E0UgiU2jt/hV1lOYNoNquJSvAtNFB7M50r8HbPjOUQMIJgZoRYjvM1P/9OIefLM21NWIvYGJBcrLV5iRoEiT4pP1uWFceUkDv0VnFDiuFR5hA9hjmyulXCt+tpKjqnw8oHCz5Eroy1aAKBVoFDK+0mX+WB/gJCB/jJQSxM7g38vndp7vci5SHMsgEYhV2+6LcJiZ5QtgjRUFXM6tS//DZGJTqZB+vaBibATUr0ra62kaetc7GcxG+A=
Content-ID: <9EE539E2F3BE8B47AB676E9CC23253FB@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec09e1f2-a954-400d-dfd8-08d6fb925c7d
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2019 06:32:15.8827 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ckoenig@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1388
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JaULSTtOkEmSBZZQuX1uE27UU8r8e00oayJunplZ5w0=;
 b=liMFg0XC+X4T9mubz2eFC5z6CmendkTTKxNODXimais/fQCA0hghwTp4i2CoGgCn2PP78CTV6MdpBXKv0cfwaYVI1ktVHVstZ2rlV3UHsj7TpnNQ04TauiGNV7Fd8l2D7owrf4ihtCXtsn0iMnGL/klaR6TcghUbX7jGd6FDQis=
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjcuMDYuMTkgdW0gMjE6NTcgc2NocmllYiBEYW5pZWwgVmV0dGVyOg0KPiBbU05JUF0NCj4+
IEFnYWluLCB0aGUgcmVhc29uIHRvIHJlbW92ZSB0aGUgZmVuY2UgZnJvbSBvbmUgcmVzZXJ2YXRp
b24gb2JqZWN0IGlzDQo+PiBzaW1wbHkgdGhhdCBpdCBpcyBmYXN0ZXIgdG8gcmVtb3ZlIGl0IGZy
b20gb25lIG9iamVjdCB0aGFuIHRvIGF0dGFjaCBhDQo+PiBuZXcgZmVuY2UgdG8gYWxsIG90aGVy
IG9iamVjdHMuDQo+IEhtIEkgZ3Vlc3MgSSB3YXMgbGVhZCBhc3RyYXkgYnkgdGhlIGV2aWN0aW9u
X2ZlbmNlIGludmFsaWRhdGlvbiB0aGluZw0KPiBpbiBlbmFibGVfc2lnbmFsaW5nLCBhbmQgYSBm
ZXcgb3RoZXIgcGxhY2VzIHRoYXQgZnJlZWQgdGhlIGJvIHJpZ2h0DQo+IGFmdGVycyAobGlrZSBh
bWRncHVfYW1ka2ZkX2dwdXZtX2ZyZWVfbWVtb3J5X29mX2dwdSksIHdoZXJlIHJlbW92aW5nDQo+
IHRoZSBmZW5jZXMgZmlyc3QgYW5kIHRoZW4gZnJlZWluZyB0aGUgYm8gaXMga2luZGEgcG9pbnRs
ZXNzLg0KDQpBSCEgTm93IEkga25vdyB3aGVyZSB5b3VyIG1pc3NpbmcgcHV6emxlIHBpZWNlIGlz
Lg0KDQpTZWUgd2hlbiB3ZSBmcmVlIGEgYnVmZmVyIG9iamVjdCBUVE0gcHV0cyBpdCBvbiB0aGUg
ZGVsYXllZCBkZWxldGUgbGlzdCANCnRvIG1ha2Ugc3VyZSB0aGF0IGl0IGdldHMgZnJlZWQgdXAg
b25seSBhZnRlciBhbGwgZmVuY2VzIGFyZSBzaWduYWxlZC4NCg0KU28gdGhpcyBpcyBlc3NlbnRp
YWxseSB0byBtYWtlIHN1cmUgdGhlIEJPIGdldHMgZnJlZWQgdXAgaW1tZWRpYXRlbHkuDQoNCj4g
Tm93IHdpdGggeW91ciBpbnNpc3RlbmNlIHRoYXQgSSdtIGdldHRpbmcgc29tZXRoaW5nIHdyb25n
IEkgZ3Vlc3MgdGhlDQo+IHlvdSdyZSB0YWxraW5nIGFib3V0IHRoZSB1bmJpbmQgY2FzZSwgd2hl
cmUgdGhlIGJvIHN1cnZpdmVzLCBidXQgaXQncw0KPiBtYXBwaW5nIGRpc2FwcGVhcnMsIGFuZCBo
ZW5jZSB0aGF0IHNwZWNpZmljIGV2aWN0aW9uX2ZlbmNlIG5lZWRzIHRvIGJlDQo+IHJlbW92ZWQu
DQo+IEFuZCB5ZWFoIHRoZXJlIEkgZ3Vlc3MganVzdCByZW1vdmluZyB0aGUgbWFnaWMgZXZpY3Rp
b24gZmVuY2UgaXMNCj4gY2hlYXBlciB0aGFuIHJlcGxhY2luZyBhbGwgdGhlIG90aGVycy4NCg0K
SWYgcG9zc2libGUgSSBhY3R1YWxseSB3YW50IHRvIGFwcGx5IHRoaXMgdG8gdGhlIGdlbmVyYWwg
Y2FzZSBvZiBmcmVlaW5nIA0KdXAgcGVyIHByb2Nlc3MgcmVzb3VyY2VzLg0KDQpJbiBvdGhlciB3
b3JkcyB3aGVuIHdlIGRvbid0IHRyYWNrIHJlc291cmNlIHVzYWdlIG9uIGEgcGVyIHN1Ym1pc3Np
b24gDQpiYXNpcyBmcmVlaW5nIHVwIHJlc291cmNlcyBpcyBjb3N0bHkgYmVjYXVzZSB3ZSBhbHdh
eXMgaGF2ZSB0byB3YWl0IGZvciANCnRoZSBsYXN0IHN1Ym1pc3Npb24uDQoNCkJ1dCBpZiB3ZSBj
YW4gcHJldmVudCBmdXJ0aGVyIGFjY2VzcyB0byB0aGUgcmVzb3VyY2UgdXNpbmcgcGFnZSB0YWJs
ZXMgDQppdCBpcyBwZXJmZWN0bHkgdmFsaWQgdG8gZnJlZSBpdCBhcyBzb29uIGFzIHRoZSBwYWdl
IHRhYmxlcyBhcmUgdXAgdG8gZGF0ZS4NCg0KUmVnYXJkcywNCkNocmlzdGlhbi4NCg0KPg0KPiBO
b3cgSSBndWVzcyBJIHVuZGVyc3RhbmQgdGhlIG1lY2hhbmljcyBvZiB0aGlzIHNvbWV3aGF0LCBh
bmQgd2hhdA0KPiB5b3UncmUgZG9pbmcsIGFuZCBsaXQgb29rcyBldmVuIHNvbWV3aGF0IHNhZmUu
IEJ1dCBJIGhhdmUgbm8gaWRlYSB3aGF0DQo+IHRoaXMgaXMgc3VwcG9zZWQgdG8gYWNoaWV2ZS4g
SXQgZmVlbHMgYSBiaXQgbGlrZSAtPm5vdGlmeV9tb3ZlLCBidXQNCj4gaW1wbGVtZW50ZWQgaW4g
dGhlIG1vc3QgaG9ycmlibGUgd2F5IHBvc3NpYmxlLiBPciBtYXliZSBzb21ldGhpbmcNCj4gZWxz
ZS4NCj4NCj4gUmVhbGx5IG5vIGlkZWEuDQo+DQo+IEFuZCBnaXZlbiB0aGF0IHdlJ3ZlIHdhc3Rl
ZCBJIGZldyBwYWdlcyBmdWxsIG9mIHBhcmFncmFwaHMgYWxyZWFkeSBvbg0KPiB0cnlpbmcgdG8g
ZXhwbGFpbiB3aGF0IHlvdXIgbmV3IGxpdHRsZSBoZWxwZXIgaXMgZm9yLCB3aGVuIGl0J3Mgc2Fm
ZQ0KPiB0byB1c2UsIHdoZW4gaXQncyBtYXliZSBub3QgYSBnb29kIGlkZWEsIGFuZCB3ZSBzdGls
bCBoYXZlbid0IGV2ZW4NCj4gYm90dG9tZWQgb3V0IG9uIHdoYXQgdGhpcyBpcyBmb3IgLi4uIHdl
bGwgSSByZWFsbHkgZG9uJ3QgdGhpbmsgaXQncyBhDQo+IGdvb2QgaWRlYSB0byBpbmZsaWN0IHRo
aXMgaW50byBjb3JlIGNvZGUuIEJlY2F1c2UganVzdCBibGluZGx5DQo+IHJlbW92aW5nIG5vcm1h
bCBmZW5jZXMgaXMgbm90IHNhZmUuDQo+DQo+IEVzcGVjaWFsbHkgd2l0aCBsaWtlIGhhbGYgYSBz
ZW50ZW5jZSBvZiBrZXJuZWxkb2MgdGhhdCBleHBsYWlucw0KPiBub3RoaW5nIG9mIGFsbCB0aGlz
IGNvbXBsZXhpdHkuDQo+IC1EYW5pZWwNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
