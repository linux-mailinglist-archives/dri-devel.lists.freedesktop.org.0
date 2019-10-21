Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B5FDF3AB
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2019 18:56:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A56C16E194;
	Mon, 21 Oct 2019 16:56:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810083.outbound.protection.outlook.com [40.107.81.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CE286E194;
 Mon, 21 Oct 2019 16:56:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CWjgqxSL9gXRJgxxRJ1Kh6UZl6NcPNCCmcfW16Y/ZfLjUAdJ8ev9GLInxKL3gu052Oi87sRjgFt9YxF11z7ViYlw9DBuRs2uq+Pvw9hGgZxgSPVRvnJ1DnD2xvh7rrZmk6CPcWhfftKoEpd4ufKLiom/sTsSbnJnh6dZqQ4tP3gH6OJZHiNpfyvbDfoacXKt3VMmLhdO3WZ/8th4mZeYHyxM+hktakJhCND2ny26MO0qRb9uSnZ+yt9y/brLZ9EFczH35d7JiqBeH3Rxi19GAlLjn/PfU1gmk5KTFofo7QnRwjTVftEs9qDePhGixiL//EqC9CO3YUPQMDhRJqYJMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GjtQCWjgf1gDSnCUKUBaaxddi+1gRB2vRlRcXJjnaQM=;
 b=QUmNVcHlGeJ1VxEuExJm4kzFcNMNzeRQbFFJN6wwapDMjjwk8mHFqyBCKzBVcrwApu+GzaRoHi0f5rIRHej9AjQxKEOs5gAQoriX+U2wNZxT49EOheLGvkUV2WEmlLIO4r6V215ZUkALSWLiRiBG2Bet0dsji4OfGpCePgeECozBLXCPlQWcFKO2tX/uJ73wXNlreMo4ICHuQTPg1JV99yr6K66FMGFQge6+K50gKL6jsHAH467xLsfsk9nTLNaMoDIUcvHy4XXX66vlFbsmYSl4jUviUQ5+68uPHprOZTDULJEO61JvwNEFJl+UTIKxUT+bd4f4nzPkJPEQCbj6BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
Received: from MN2PR05MB6141.namprd05.prod.outlook.com (20.178.241.217) by
 MN2PR05MB7037.namprd05.prod.outlook.com (52.135.37.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.17; Mon, 21 Oct 2019 16:56:19 +0000
Received: from MN2PR05MB6141.namprd05.prod.outlook.com
 ([fe80::286f:c413:5df1:4eb9]) by MN2PR05MB6141.namprd05.prod.outlook.com
 ([fe80::286f:c413:5df1:4eb9%4]) with mapi id 15.20.2367.017; Mon, 21 Oct 2019
 16:56:19 +0000
From: Thomas Hellstrom <thellstrom@vmware.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, DRI Development
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 1/3] dma_resv: prime lockdep annotations
Thread-Topic: [PATCH 1/3] dma_resv: prime lockdep annotations
Thread-Index: AQHViB7hKnW9zc+JNE6NevhYb3h2jw==
Date: Mon, 21 Oct 2019 16:56:19 +0000
Message-ID: <MN2PR05MB61415E3DBF70772C781BEB15A1690@MN2PR05MB6141.namprd05.prod.outlook.com>
References: <20191021145017.17384-1-daniel.vetter@ffwll.ch>
 <20191021145017.17384-2-daniel.vetter@ffwll.ch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [155.4.205.35]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dbce4bde-46bc-4452-1dad-08d756479847
x-ms-traffictypediagnostic: MN2PR05MB7037:|MN2PR05MB7037:
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR05MB70377F851D48A826BF6B7BD5A1690@MN2PR05MB7037.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0197AFBD92
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(346002)(396003)(136003)(39860400002)(376002)(199004)(189003)(76176011)(66066001)(229853002)(316002)(99286004)(91956017)(54906003)(76116006)(14444005)(110136005)(3846002)(476003)(446003)(6116002)(256004)(486006)(5660300002)(6506007)(66446008)(66476007)(66556008)(64756008)(26005)(7696005)(102836004)(66946007)(2906002)(186003)(53546011)(52536014)(74316002)(55016002)(6436002)(71200400001)(71190400001)(4326008)(25786009)(33656002)(66574012)(7416002)(9686003)(81156014)(81166006)(478600001)(6246003)(86362001)(305945005)(8676002)(14454004)(8936002)(7736002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR05MB7037;
 H:MN2PR05MB6141.namprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: vmware.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2IURmTQ5pZ5DdABA/16Ws40ammsUht9qc8LRYf6RsMZOCCbflwXvZCJDkdWBpV4Q0GmbFRF5tzKR7ErQEvMmxW3zFuBJ53SXehsEgOtEz3KFhgWRXzFa3L3xZOkaZIj7K95sXnF/hoibNmfdY54hbreEad6FpXVBKw3Rng7ONtlITU79kKyhh11407v85Ll6jOWhg0BfO6mRQUuGRAhZBWtje18PkPvZ1TcOena41lK8Hj2IenAmozerhsRhDT303K6F9VUvhVT7Oj96yjwqQXuRUaS5TjlQS8gTU3PsgdcptKvTrS2NQVSB7Q4kkNM3hr6Ak3BzlV57yXel8Bx+Fs3tR39D8Uo+2ziXin6FTzJN8S+YLx3nKHcm1c4wc1YXrZ0qkKfg4yR5YSI8+ZzDAyM+zu8qxMItK64r2n8tVBX76KXPX8nNiKS6ifxWpcqH
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbce4bde-46bc-4452-1dad-08d756479847
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2019 16:56:19.2079 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Lag0iZ8f9Lp7fruewDFfoDUGJtLRpcT7/w26nmtZy501swQk05NC9AHAe/GZ4E6lNnFqlOgcQo056IvStBQqIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR05MB7037
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vmware.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GjtQCWjgf1gDSnCUKUBaaxddi+1gRB2vRlRcXJjnaQM=;
 b=IfFS6YFeNHoN4H9qB7d+slkAZBZm6Kb+r/r+p+/rZWCnfyf1pNUmOOj5t0c1okMwyetNfTErzrXn2K0TPjFetsHe+E0p1xO3mN1mK1LFlR6b2J2UAg0UZ8ZCTeS5RFP2QeJALaP+x5lDfoZMqqhcDa8Q1xTVr7sY+mgz/tR3tOU=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=thellstrom@vmware.com; 
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@redhat.com>,
 =?iso-8859-1?Q?Christian_K=F6nig?= <christian.koenig@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTAvMjEvMTkgNDo1MCBQTSwgRGFuaWVsIFZldHRlciB3cm90ZToKPiBGdWxsIGF1ZGl0IG9m
IGV2ZXJ5b25lOgo+Cj4gLSBpOTE1LCByYWRlb24sIGFtZGdwdSBzaG91bGQgYmUgY2xlYW4gcGVy
IHRoZWlyIG1haW50YWluZXJzLgo+Cj4gLSB2cmFtIGhlbHBlcnMgc2hvdWxkIGJlIGZpbmUsIHRo
ZXkgZG9uJ3QgZG8gY29tbWFuZCBzdWJtaXNzaW9uLCBzbwo+ICAgcmVhbGx5IG5vIGJ1c2luZXNz
IGhvbGRpbmcgc3RydWN0X211dGV4IHdoaWxlIGRvaW5nIGNvcHlfKl91c2VyLiBCdXQKPiAgIEkg
aGF2ZW4ndCBjaGVja2VkIHRoZW0gYWxsLgo+Cj4gLSBwYW5mcm9zdCBzZWVtcyB0byBkbWFfcmVz
dl9sb2NrIG9ubHkgaW4gcGFuZnJvc3Rfam9iX3B1c2gsIHdoaWNoCj4gICBsb29rcyBjbGVhbi4K
Pgo+IC0gdjNkIGhvbGRzIGRtYV9yZXN2IGxvY2tzIGluIHRoZSB0YWlsIG9mIGl0cyB2M2Rfc3Vi
bWl0X2NsX2lvY3RsKCksCj4gICBjb3B5aW5nIGZyb20vdG8gdXNlcnNwYWNlIGhhcHBlbnMgYWxs
IGluIHYzZF9sb29rdXBfYm9zIHdoaWNoIGlzCj4gICBvdXRzaWRlIG9mIHRoZSBjcml0aWNhbCBz
ZWN0aW9uLgo+Cj4gLSB2bXdnZnggaGFzIGEgYnVuY2ggb2YgaW9jdGxzIHRoYXQgZG8gdGhlaXIg
b3duIGNvcHlfKl91c2VyOgo+ICAgLSB2bXdfZXhlY2J1Zl9wcm9jZXNzOiBGaXJzdCB0aGlzIGRv
ZXMgc29tZSBjb3BpZXMgaW4KPiAgICAgdm13X2V4ZWNidWZfY21kYnVmKCkgYW5kIGFsc28gaW4g
dGhlIHZtd19leGVjYnVmX3Byb2Nlc3MoKSBpdHNlbGYuCj4gICAgIFRoZW4gY29tZXMgdGhlIHVz
dWFsIHR0bSByZXNlcnZlL3ZhbGlkYXRlIHNlcXVlbmNlLCB0aGVuIGFjdHVhbAo+ICAgICBzdWJt
aXNzaW9uL2ZlbmNpbmcsIHRoZW4gdW5yZXNlcnZpbmcsIGFuZCBmaW5hbGx5IHNvbWUgbW9yZQo+
ICAgICBjb3B5X3RvX3VzZXIgaW4gdm13X2V4ZWNidWZfY29weV9mZW5jZV91c2VyLiBHbG9zc2lu
ZyBvdmVyIHRvbnMgb2YKPiAgICAgZGV0YWlscywgYnV0IGxvb2tzIGFsbCBzYWZlLgo+ICAgLSB2
bXdfZmVuY2VfZXZlbnRfaW9jdGw6IE5vIHR0bV9yZXNlcnZlL2RtYV9yZXN2X2xvY2sgYW55d2hl
cmUgdG8gYmUKPiAgICAgc2Vlbiwgc2VlbXMgdG8gb25seSBjcmVhdGUgYSBmZW5jZSBhbmQgY29w
eSBpdCBvdXQuCj4gICAtIGEgcGlsZSBvZiBzbWFsbGVyIGlvY3RsIGluIHZtd2dmeF9pb2N0bC5j
LCBubyByZXNlcnZhdGlvbnMgdG8gYmUKPiAgICAgZm91bmQgdGhlcmUuCj4gICBTdW1tYXJ5OiB2
bXdnZnggc2VlbXMgdG8gYmUgZmluZSB0b28uCj4KPiAtIHZpcnRpbzogVGhlcmUncyB2aXJ0aW9f
Z3B1X2V4ZWNidWZmZXJfaW9jdGwsIHdoaWNoIGRvZXMgYWxsIHRoZQo+ICAgY29weWluZyBmcm9t
IHVzZXJzcGFjZSBiZWZvcmUgZXZlbiBsb29raW5nIHVwIG9iamVjdHMgdGhyb3VnaCB0aGVpcgo+
ICAgaGFuZGxlcywgc28gc2FmZS4gUGx1cyB0aGUgZ2V0cGFyYW0vZ2V0Y2FwcyBpb2N0bCwgYWxz
byBib3RoIHNhZmUuCj4KPiAtIHF4bCBvbmx5IGhhcyBxeGxfZXhlY2J1ZmZlcl9pb2N0bCwgd2hp
Y2ggY2FsbHMgaW50bwo+ICAgcXhsX3Byb2Nlc3Nfc2luZ2xlX2NvbW1hbmQuIFRoZXJlJ3MgYSBs
b3ZlbHkgY29tbWVudCBiZWZvcmUgdGhlCj4gICBfX2NvcHlfZnJvbV91c2VyX2luYXRvbWljIHRo
YXQgdGhlIHNsb3dwYXRoIHNob3VsZCBiZSBjb3BpZWQgZnJvbQo+ICAgaTkxNSwgYnV0IEkgZ3Vl
c3MgdGhhdCBuZXZlciBoYXBwZW5lZC4gVHJ5IG5vdCB0byBiZSB1bmx1Y2t5IGFuZCBnZXQKPiAg
IHlvdXIgQ1MgZGF0YSBldmljdGVkIGJldHdlZW4gd2hlbiBpdCdzIHdyaXR0ZW4gYW5kIHRoZSBr
ZXJuZWwgdHJpZXMKPiAgIHRvIHJlYWQgaXQuIFRoZSBvbmx5IG90aGVyIGNvcHlfZnJvbV91c2Vy
IGlzIGZvciByZWxvY3MsIGJ1dCB0aG9zZQo+ICAgYXJlIGRvbmUgYmVmb3JlIHF4bF9yZWxlYXNl
X3Jlc2VydmVfbGlzdCgpLCB3aGljaCBzZWVtcyB0byBiZSB0aGUKPiAgIG9ubHkgdGhpbmcgcmVz
ZXJ2aW5nIGJ1ZmZlcnMgKGluIHRoZSB0dG0vZG1hX3Jlc3Ygc2Vuc2UpIGluIHRoYXQKPiAgIGNv
ZGUuIFNvIGxvb2tzIHNhZmUuCj4KPiAtIEEgZGVidWdmcyBmaWxlIGluIG5vdXZlYXVfZGVidWdm
c19wc3RhdGVfc2V0KCkgYW5kIHRoZSB1c2lmIGlvY3RsIGluCj4gICB1c2lmX2lvY3RsKCkgbG9v
ayBzYWZlLiBub3V2ZWF1X2dlbV9pb2N0bF9wdXNoYnVmKCkgb3RvaCBicmVha3MgdGhpcwo+ICAg
ZXZlcnl3aGVyZSBhbmQgbmVlZHMgdG8gYmUgZml4ZWQgdXAuCj4KPiB2MjogVGhvbWFzIHBvaW50
ZWQgYXQgdGhhdCB2bXdnZnggY2FsbHMgZG1hX3Jlc3ZfaW5pdCB3aGlsZSBpdCBob2xkcyBhCj4g
ZG1hX3Jlc3YgbG9jayBvZiBhIGRpZmZlcmVudCBvYmplY3QgYWxyZWFkeS4gQ2hyaXN0aWFuIG1l
bnRpb25lZCB0aGF0Cj4gdHRtIGNvcmUgZG9lcyB0aGlzIHRvbyBmb3IgZ2hvc3Qgb2JqZWN0cy4g
aW50ZWwtZ2Z4LWNpIGhpZ2hsaWdodGVkCj4gdGhhdCBpOTE1IGhhcyBzaW1pbGFyIGlzc3Vlcy4K
Pgo+IFVuZm9ydHVuYXRlbHkgd2UgY2FuJ3QgZG8gdGhpcyBpbiB0aGUgdXN1YWwgbW9kdWxlIGlu
aXQgZnVuY3Rpb25zLAo+IGJlY2F1c2Uga2VybmVsIHRocmVhZHMgZG9uJ3QgaGF2ZSBhbiAtPm1t
IC0gd2UgaGF2ZSB0byB3YWl0IGFyb3VuZCBmb3IKPiBzb21lIHVzZXIgdGhyZWFkIHRvIGRvIHRo
aXMuCj4KPiBTb2x1dGlvbiBpcyB0byBzcGF3biBhIHdvcmtlciAoYnV0IG9ubHkgb25jZSkuIEl0
J3MgaG9ycmlibGUsIGJ1dCBpdAo+IHdvcmtzLgo+Cj4gdjM6IFdlIGNhbiBhbGxvY2F0ZSBtbSEg
KENocmlzKS4gSG9ycmlibGUgd29ya2VyIGhhY2sgb3V0LCBjbGVhbgo+IGluaXRjYWxsIHNvbHV0
aW9uIGluLgo+Cj4gdjQ6IEFubm90YXRlIHdpdGggX19pbml0IChSb2IgSGVycmluZykKPgo+IENj
OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgo+IENjOiBBbGV4IERldWNoZXIgPGFsZXhh
bmRlci5kZXVjaGVyQGFtZC5jb20+Cj4gQ2M6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5r
b2VuaWdAYW1kLmNvbT4KPiBDYzogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28u
dWs+Cj4gQ2M6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgo+IENjOiBS
b2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgo+IENjOiBUb21ldSBWaXpvc28gPHRvbWV1LnZp
em9zb0Bjb2xsYWJvcmEuY29tPgo+IENjOiBFcmljIEFuaG9sdCA8ZXJpY0BhbmhvbHQubmV0Pgo+
IENjOiBEYXZlIEFpcmxpZSA8YWlybGllZEByZWRoYXQuY29tPgo+IENjOiBHZXJkIEhvZmZtYW5u
IDxrcmF4ZWxAcmVkaGF0LmNvbT4KPiBDYzogQmVuIFNrZWdncyA8YnNrZWdnc0ByZWRoYXQuY29t
Pgo+IENjOiAiVk13YXJlIEdyYXBoaWNzIiA8bGludXgtZ3JhcGhpY3MtbWFpbnRhaW5lckB2bXdh
cmUuY29tPgo+IENjOiBUaG9tYXMgSGVsbHN0cm9tIDx0aGVsbHN0cm9tQHZtd2FyZS5jb20+Cj4g
UmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4K
PiBSZXZpZXdlZC1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Cj4g
VGVzdGVkLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KPiBTaWdu
ZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KCkluY2x1
ZGluZyB0aGUgdm13Z2Z4IGF1ZGl0LAoKUmV2aWV3ZWQtYnk6IFRob21hcyBIZWxsc3Ryb20gPHRo
ZWxsc3Ryb21Adm13YXJlLmNvbT4KClRoYW5rcywKClRob21hcwoKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
