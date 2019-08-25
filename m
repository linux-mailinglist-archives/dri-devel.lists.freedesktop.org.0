Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 253EF9C52A
	for <lists+dri-devel@lfdr.de>; Sun, 25 Aug 2019 19:35:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F8E76E109;
	Sun, 25 Aug 2019 17:35:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710077.outbound.protection.outlook.com [40.107.71.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62C7F6E109;
 Sun, 25 Aug 2019 17:35:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cZcU1p9xTXNuhpCN1CdfRUwr5rrunD6fMcj86a0HdsB4tQ/XmfPgxr3qphbqDlEkeRO1yqlV5q84MC85WM7xnSXe4YbADGsWvGoG4t8x+fnrvonoIOKIPRpb2uiObA/ZscU+2AMA1PzcfAOmse9O1Drlw+VPqxRtFzZu3Rndth2uYrW6MVgqM7WDulYzq7ifFWtC7MksKQ/2tRW31qGgd4lFjEbgvzCnTSpd8O8hHlyPbu/6fM/S4XUSkmOyvbk4WpU+czkWg0LBeP7bA79uL3pMT+tkzFIEsJ1INwAtIVAQcHIKE1/NReLkSabqNOR1raptWIupO1MxO+MOrr9v7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MdRj/fwpzOCaPU54wZFR0cibg7emU0sf8n9s2RFNSSc=;
 b=WeMBWS/JCaKA8wJZdB7WK1T8p+rKIMnZTPlV4+bkBpl8/AEX7le1td8Z0GT4O0WscxAz3LZTkjmwEtclIxiL4Z/HnM+kPAZnR8Aqpl+xKdtbvtIViMux0rnvgGc7ZKRY0Elu3k2awSp1tFb5fIBR7mR0nVKgfBu7p9vrWhs86pJLQuA4EERvlZcoYzPddCmTi3zkQLzpqqJNbHnlzN+Y4iVeB87gYTrizAvXhipK/1+B5e0aCVAE+/+aODg4JRRDhs/6kuDluuJPitB3RaOP6YZiQQDLWQp9QjrVDEA/u/BNaQCPuStgddMlCbCDTXnXh9P2giKWJN1gCUJ5umc/zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB2502.namprd12.prod.outlook.com (52.132.141.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Sun, 25 Aug 2019 17:35:22 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::a129:1f1a:52a9:4ac3]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::a129:1f1a:52a9:4ac3%5]) with mapi id 15.20.2178.020; Sun, 25 Aug 2019
 17:35:22 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Chris Wilson <chris@chris-wilson.co.uk>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] dma-buf: Give dma-fence-array distinct lockclasses
Thread-Topic: [PATCH] dma-buf: Give dma-fence-array distinct lockclasses
Thread-Index: AQHVWoQTNl2oCTyTfEeuCxOzO57wAKcKqIOAgAACPgCAAXcgAA==
Date: Sun, 25 Aug 2019 17:35:22 +0000
Message-ID: <835c1e5d-9e73-fc8e-1f71-5d5f389b21d3@amd.com>
References: <20190824135848.8571-1-chris@chris-wilson.co.uk>
 <1a7c7518-1efd-39d4-fee5-b7ac76c50de0@amd.com>
 <156667395882.2672.494047397841710215@skylake-alporthouse-com>
In-Reply-To: <156667395882.2672.494047397841710215@skylake-alporthouse-com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR0P264CA0112.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:19::28) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c27508f9-7110-46f4-58ac-08d729829aed
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB2502; 
x-ms-traffictypediagnostic: DM5PR12MB2502:
x-microsoft-antispam-prvs: <DM5PR12MB2502E639E275C0D368DF947B83A60@DM5PR12MB2502.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01401330D1
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(396003)(376002)(366004)(346002)(199004)(189003)(46003)(66476007)(2501003)(71200400001)(6486002)(8936002)(31686004)(71190400001)(478600001)(6246003)(14454004)(6512007)(8676002)(53936002)(81166006)(81156014)(316002)(86362001)(4326008)(6116002)(31696002)(66446008)(36756003)(66556008)(64756008)(305945005)(5660300002)(25786009)(58126008)(2906002)(6436002)(229853002)(54906003)(7736002)(486006)(76176011)(52116002)(256004)(99286004)(65956001)(65806001)(386003)(6506007)(446003)(14444005)(2616005)(476003)(11346002)(186003)(66946007)(102836004)(110136005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2502;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: JltNYlGkW80orFcBf5QqtGkuYr1u0J793NF1+xx7tUc16EVrSVXcq2qC3Wn5rIot8tG5W9luTUxm3UQFwSwe4dX/+TWgbwP8oBZyPOnL0lOVMjTKk4JHv2o+FDT4UsmABB4ZcnKj2sejXsShBWu7cIHPDC0el7wgWD9U6o4XbVMUV1ZYNsja0mkEYQTiP2fl3w5LX8OTe5Q0se+m3C3CN+Ob+UJAa5IGY6hmBd9WNIsReqq3Ah5EOP/igJQTWLZSOnrHYk/z/QAs4ybZKFlalwinpa7DZ4NTyAvXQdUPw6xZeF8nbXdSn5fgsLRh67VDpWOKwlMAitVAVzD2dqUA6VJ8sY4FsJh8uT+a8OB9cLVrS0uQYLZljGO81Qkf4CYajfb7+1UXG2/Nq48+nMVSYrCcVJ69VYGrjDydag3Qs3w=
x-ms-exchange-transport-forked: True
Content-ID: <65037408DEC3154EA7B532C9C8ED64C5@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c27508f9-7110-46f4-58ac-08d729829aed
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2019 17:35:22.1056 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wzXou3AQQJy7BPyKmjN8Z8cw8MiYodTLqdTLOlztFEmhGqDgGLfhFpy6JXCbIMl5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2502
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MdRj/fwpzOCaPU54wZFR0cibg7emU0sf8n9s2RFNSSc=;
 b=NVaZXD0PVLIVeekiHZL2jmC9TWcCCJKc7rPssu1YLV5ZHYN7EzPAMemes8sS7OiehJB+YlPJubJHPjUyIoJCnWjktwK8J3t4IixlAF88/0T9pwUmm8laSbq8p1Tr13njgUgGftoxAFE2/Tyaj/p1K2+C2ceyEyzf7gGVvxve4Co=
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjQuMDguMTkgdW0gMjE6MTIgc2NocmllYiBDaHJpcyBXaWxzb246DQo+IFF1b3RpbmcgS29l
bmlnLCBDaHJpc3RpYW4gKDIwMTktMDgtMjQgMjA6MDQ6NDMpDQo+PiBBbSAyNC4wOC4xOSB1bSAx
NTo1OCBzY2hyaWViIENocmlzIFdpbHNvbjoNCj4+PiBJbiBvcmRlciB0byBhbGxvdyBkbWEtZmVu
Y2UtYXJyYXkgYXMgYSBnZW5lcmljIGNvbnRhaW5lciBmb3IgZmVuY2VzLCB3ZQ0KPj4+IG5lZWQg
dG8gYWxsb3cgZm9yIGl0IHRvIGNvbnRhaW4gb3RoZXIgZG1hLWZlbmNlLWFycmF5cy4gQnkgZ2l2
aW5nIGVhY2gNCj4+PiBkbWEtZmVuY2UtYXJyYXkgY29uc3RydWN0aW9uIHRoZWlyIG93biBsb2Nr
Y2xhc3MsIHdlIGFsbG93IGRpZmZlcmVudA0KPj4+IHR5cGVzIG9mIGRtYS1mZW5jZS1hcnJheSB0
byBuZXN0LCBidXQgc3RpbGwgZG8gbm90IGFsbG93IG9uIGNsYXNzIG9mDQo+Pj4gZG1hLWZlbmNl
LWFycmF5IHRvIGNvbnRhaW4gaXRzZWxmIChldmVuIHRob3VnaCB0aGV5IGhhdmUgZGlzdGluY3QN
Cj4+PiBsb2NrcykuDQo+Pj4NCj4+PiBJbiBwcmFjdGljZSwgdGhpcyBtZWFucyB0aGF0IGVhY2gg
c3Vic3lzdGVtIGdldHMgaXRzIG93biBkbWEtZmVuY2UtYXJyYXkNCj4+PiBjbGFzcyBhbmQgd2Ug
Y2FuIGZyZWVseSB1c2UgZG1hLWZlbmNlLWFycmF5cyBhcyBjb250YWluZXJzIHdpdGhpbiB0aGUN
Cj4+PiBkbWFidWYgY29yZSB3aXRob3V0IGFuZ2VyaW5nIGxvY2tkZXAuDQo+PiBJJ3ZlIGNvbnNp
ZGVyZWQgdGhpcyBmb3IgYXMgd2VsbC4gRS5nLiB0byB1c2UgdGhlIGRtYV9mZW5jZV9hcnJheQ0K
Pj4gaW1wbGVtZW50YXRpb24gaW5zdGVhZCBvZiBjb21pbmcgdXAgd2l0aCB0aGUgZG1hX2ZlbmNl
X2NoYWluIGNvbnRhaW5lci4NCj4+DQo+PiBCdXQgYXMgaXQgdHVybmVkIG91dCB3aGVuIHVzZXJz
cGFjZSBjYW4gY29udHJvbCBuZXN0aW5nLCBpdCBpcyB0cml2aWFsDQo+PiB0byBjaGFpbiBlbm91
Z2ggZG1hX2ZlbmNlX2FycmF5cyB0b2dldGhlciB0byBjYXVzZSBhbiBpbiBrZXJuZWwgc3RhY2sN
Cj4+IG92ZXJmbG93LiBXaGljaCBpbiB0dXJuIGNyZWF0ZXMgYSByZWFsbHkgbmljZSBhdHRhY2sg
dmVjdG9yLg0KPj4NCj4+IFNvIGFzIGxvbmcgYXMgdXNlcnNwYWNlIGhhcyBjb250cm9sIG92ZXIg
ZG1hX2ZlbmNlX2FycmF5IG5lc3RpbmcgdGhpcyBpcw0KPj4gYSBjbGVhciBOQUsgYW5kIGFjdHVh
bGx5IGV4dHJlbWVseSBkYW5nZXJvdXMuDQo+IFlvdSBhcmUgcHJvcG9zaW5nIHRvIHVzZSByZWN1
cnNpdmUgZG1hX2ZlbmNlX2FycmF5IGNvbnRhaW5lcnMgZm9yDQo+IGRtYV9yZXN2Li4uDQoNCkh1
aT8gV2hlcmU/IEkndmUgdHJpZWQgcmF0aGVyIGhhcmQgdG8gYXZvaWQgdGhhdC4NCg0KVGhhdCB3
YXMgY2VydGFpbmx5IG5vdCBpbnRlbnRpb25hbCwNCkNocmlzdGlhbi4NCg0KPg0KPj4gSXQgYWN0
dWFsbHkgdG9vayBtZSBxdWl0ZSBhIHdoaWxlIHRvIGdldCB0aGUgZG1hX2ZlbmNlX2NoYWluIGNv
bnRhaW5lcg0KPj4gcmVjdXJzaW9uIGxlc3MgdG8gYXZvaWQgc3R1ZmYgbGlrZSB0aGlzLg0KPiBT
dXJlLCB3ZSd2ZSBiZWVuIGF2b2lkaW5nIHJlY3Vyc2lvbiBmb3IgeWVhcnMuDQo+IC1DaHJpcw0K
DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
