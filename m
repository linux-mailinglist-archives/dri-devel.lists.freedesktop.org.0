Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76CE172EB3
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 14:21:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C6BD6E52E;
	Wed, 24 Jul 2019 12:21:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TY1-obe.outbound.protection.outlook.com
 (mail-eopbgr1400111.outbound.protection.outlook.com [40.107.140.111])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F9FF6E49A
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 08:10:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IYPW3I89QXai2O/mdhW0K2hgeEW7sQUWZooDGmv5YS9KRIyp/ujmAP3Cb2aDKCKtLMK8p3MLqOgulW2P3OVjZRBK0j92/ua1Lv8rg7+uUPsBWzOz24vkFyTXg3KiqfII9g+Pn/iXMnCUsDRa1oRMyLdgH0BMyoh/7F6TfghCmWbmSoRhH+l/eVWCiC+Iuw0PjRBVcPZCojQJu7Kb9AcJ0adMAUX+g7Eq7cdpG14//78IP00wvFh/6zdCU7swQj83V/SDNETKF/Y4PeUioMwgtnAGt+S1NBxg7nyK8Uiw5vFLKN6q/7rPq5nS2iqiRls/Gs/UzEmle9wnlgg83qdmGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uqwEVaEIv32gUYLSeGQxUIQJawQRamlZQxy38lzmfO0=;
 b=jLQpuTyGXSMeV3LE8XsEixEA0djxq7lASvWJHgwEAoa3qubF6qMK84rVQXaKSPhWKQB79608JtxoRCJzbm+3pLoXdFj6XgObxFjHnc7LbULuZgutiIGMOWJZG32EhBFjw2qrwM9wgjziCYHR2lbIOHRMNbGmH4TKu0cBK+fpdd9MsT+1jzSMf8MkrPRclbSmNj2IZpqa3iVfP6NNvG0ROjaAMnl3nFXI+k4PtjClwRw2qm3zkDhtMnraW4IhA3xSDM3ebfwdgBRn/dMo0Lvt70ns/McnrcUotWWMkNkTx42kq80VIJAwYsID8i3OhaqzfL58KV1BqJYQLYSblVOPOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=bp.renesas.com;dmarc=pass action=none
 header.from=bp.renesas.com;dkim=pass header.d=bp.renesas.com;arc=none
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.13) by
 TY1PR01MB1706.jpnprd01.prod.outlook.com (52.133.160.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.17; Wed, 24 Jul 2019 08:10:23 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::d881:cb74:8277:5a16]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::d881:cb74:8277:5a16%7]) with mapi id 15.20.2094.013; Wed, 24 Jul 2019
 08:10:23 +0000
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Jacopo Mondi <jacopo+renesas@jmondi.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Kieran Bingham
 <kieran.bingham+renesas@ideasonboard.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: RE: [PATCH] drm: rcar_lvds: Fix dual link mode operations
Thread-Topic: [PATCH] drm: rcar_lvds: Fix dual link mode operations
Thread-Index: AQHVQXeAkekjE12GhEmxi27aP7D6DKbZarTw
Date: Wed, 24 Jul 2019 08:10:22 +0000
Message-ID: <TY1PR01MB1770980628C5914BC796C47FC0C60@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <20190723165700.13124-1-jacopo+renesas@jmondi.org>
In-Reply-To: <20190723165700.13124-1-jacopo+renesas@jmondi.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2f64e23a-c273-4972-62f2-08d7100e608c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:TY1PR01MB1706; 
x-ms-traffictypediagnostic: TY1PR01MB1706:
x-microsoft-antispam-prvs: <TY1PR01MB1706342FC0346FB144E852B9C0C60@TY1PR01MB1706.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0108A997B2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(376002)(346002)(39860400002)(136003)(396003)(199004)(189003)(305945005)(66066001)(54906003)(256004)(14444005)(74316002)(33656002)(6116002)(81166006)(8676002)(86362001)(7736002)(476003)(446003)(68736007)(110136005)(53546011)(8936002)(3846002)(316002)(71200400001)(81156014)(26005)(66476007)(186003)(2906002)(5660300002)(6436002)(52536014)(6506007)(64756008)(66556008)(11346002)(55016002)(71190400001)(66446008)(66946007)(478600001)(9686003)(102836004)(6246003)(76116006)(4326008)(53936002)(486006)(44832011)(14454004)(25786009)(76176011)(229853002)(7696005)(99286004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:TY1PR01MB1706;
 H:TY1PR01MB1770.jpnprd01.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:0; MX:1; 
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: jUDIBD/0U0ETu4VQ6bZ/+R4WWKWsQcGwzKEuJvL9/ReXeqzl0l69KuoMSCTjBwfkdOgG4TGdetYaQPwmNkLd5lrfn2bhpr0N0YKDKJyy5mryfeC83SetqA+N0GTSwmjveHasyCmAeRQJ9DmWIw+EKe2kmEXVWMR371ZFo5JTqyUAaoPxhvf/ie2Z2Yauz+1vzyw95Ti1BV3WmWuhRtts0MojXFrkOsY+LLm5L5hA3rX7IQjSRqgKaUvdxzEvTsbdjy2VAcSoOWuBrFN5HKvoq3nEaSa/s5XtXzdIV0nbs/8RlU+Q8v53hk6rmJSiK0kaL3fKPREQS1DtjaU6s7VRMa9lr/ePzwv0SwqovBa6ZicdraFv1dcq1c1SxebkvgBxa9WlGyGMQ6CMa8LYBWREI8PCGbpHXYV0dGlniRFv870=
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f64e23a-c273-4972-62f2-08d7100e608c
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2019 08:10:23.0075 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fabrizio.castro@bp.renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1706
X-Mailman-Approved-At: Wed, 24 Jul 2019 12:20:46 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uqwEVaEIv32gUYLSeGQxUIQJawQRamlZQxy38lzmfO0=;
 b=rugvQIZI0b45pjyHGjvQbX4x85ARR7ykgjwH+DRTfHRgIvCSbD/sk0rcOA32BbZ+DwEDpzKXaAdE1+vrcggBcs6do90T4Rx0mwQ8HJriVoUiR/sE1C2XePssyIlXd0AwC3FW3s5Qt16a9m2l1Er+AovvzchQabI+fXBsXHD4j6g=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
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
Cc: "open list:DRM DRIVERS FOR RENESAS" <linux-renesas-soc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS FOR RENESAS" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSmFjb3BvLAoKVGhhbmsgeW91IGZvciB5b3VyIHBhdGNoIQoKPiBGcm9tOiBsaW51eC1yZW5l
c2FzLXNvYy1vd25lckB2Z2VyLmtlcm5lbC5vcmcgPGxpbnV4LXJlbmVzYXMtc29jLW93bmVyQHZn
ZXIua2VybmVsLm9yZz4gT24gQmVoYWxmIE9mIEphY29wbyBNb25kaQo+IFNlbnQ6IDIzIEp1bHkg
MjAxOSAxNzo1Nwo+IFN1YmplY3Q6IFtQQVRDSF0gZHJtOiByY2FyX2x2ZHM6IEZpeCBkdWFsIGxp
bmsgbW9kZSBvcGVyYXRpb25zCj4gCj4gVGhlIFItQ2FyIExWRFMgZW5jb2RlciB1bml0cyBzdXBw
b3J0IGR1YWwtbGluayBvcGVyYXRpb25zIGJ5IHNwbGl0dGluZwo+IHRoZSBwaXhlbCBvdXRwdXQg
YmV0d2VlbiB0aGUgcHJpbWFyeSBlbmNvZGVyIGFuZCB0aGUgY29tcGFuaW9uIG9uZS4KPiAKPiBJ
biBvcmRlciBmb3IgdGhlIHByaW1hcnkgZW5jb2RlciB0byBzdWNjZXNmdWxseSBjb250cm9sIHRo
ZSBjb21wYW5pb24ncwo+IG9wZXJhdGlvbnMgdGhpcyBzaG91bGQgbm90IGZhaWwgYXQgcHJvYmUg
dGltZSBhbmQgcmVnaXN0ZXIgaXRzZWxmIGl0cwo+IGFzc29jaWF0ZWQgZHJtIGJyaWRnZSBzbyB0
aGF0IHRoZSBwcmltYXJ5IG9uZSBjYW4gZmluZCBpdC4KPiAKPiBDdXJyZW50bHkgdGhlIGNvbXBh
bmlvbiBlbmNvZGVyIGZhaWxzIGF0IHByb2JlIHRpbWUsIGNhdXNpbmcgdGhlCj4gcmVnaXN0cmF0
aW9uIG9mIHRoZSBwcmltYXJ5IHRvIGZhaWwgcHJldmVudGluZyB0aGUgd2hvbGUgRFUgdW5pdCB0
byBiZQo+IHJlZ2lzdGVyZWQgY29ycmVjdGx5Lgo+IAo+IEZpeGVzOiBmYTQ0MGQ4NzAzNTggKCJk
cm06IHJjYXItZHU6IGx2ZHM6IEFkZCBzdXBwb3J0IGZvciBkdWFsLWxpbmsgbW9kZSIpCj4gUmVw
b3J0ZWQtYnk6IEZhYnJpemlvIENhc3RybyA8ZmFicml6aW8uY2FzdHJvQGJwLnJlbmVzYXMuY29t
Pgo+IFNpZ25lZC1vZmYtYnk6IEphY29wbyBNb25kaSA8amFjb3BvK3JlbmVzYXNAam1vbmRpLm9y
Zz4KClJldmlld2VkLWJ5OiBGYWJyaXppbyBDYXN0cm8gPGZhYnJpemlvLmNhc3Ryb0BicC5yZW5l
c2FzLmNvbT4KVGVzdGVkLWJ5OiBGYWJyaXppbyBDYXN0cm8gPGZhYnJpemlvLmNhc3Ryb0BicC5y
ZW5lc2FzLmNvbT4KCj4gCj4gLS0tCj4gVGhlICJGaXhlcyIgdGFnIHJlZmVycyB0byBhIHBhdGNo
IGN1cnJlbnRseSBwYXJ0IG9mIHRoZQo+IHJlbmVzYXMtZHJpdmVycy0yMDE5LTA3LTA5LXY1LjIg
YnJhbmNoIG9mIEdlZXJ0J3MgcmVuZXNhcy1kcml2ZXJzIHRyZWUuCj4gCj4gIGRyaXZlcnMvZ3B1
L2RybS9yY2FyLWR1L3JjYXJfbHZkcy5jIHwgMzEgKysrKysrKysrKysrKysrKysrKysrLS0tLS0t
LS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCj4g
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfbHZkcy5jIGIvZHJp
dmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9sdmRzLmMKPiBpbmRleCBiYWRhN2VlOTg1NDQuLjhi
MDE1YmE5NTg5NSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2x2
ZHMuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfbHZkcy5jCj4gQEAgLTc2
NywxNCArNzY3LDI5IEBAIHN0YXRpYyBpbnQgcmNhcl9sdmRzX3BhcnNlX2R0KHN0cnVjdCByY2Fy
X2x2ZHMgKmx2ZHMpCj4gIAlvZl9ub2RlX3B1dChyZW1vdGVfaW5wdXQpOwo+ICAJb2Zfbm9kZV9w
dXQocmVtb3RlKTsKPiAKPiAtCS8qCj4gLQkgKiBPbiBEMy9FMyB0aGUgTFZEUyBlbmNvZGVyIHBy
b3ZpZGVzIGEgY2xvY2sgdG8gdGhlIERVLCB3aGljaCBjYW4gYmUKPiAtCSAqIHVzZWQgZm9yIHRo
ZSBEUEFEIG91dHB1dCBldmVuIHdoZW4gdGhlIExWRFMgb3V0cHV0IGlzIG5vdCBjb25uZWN0ZWQu
Cj4gLQkgKiBEb24ndCBmYWlsIHByb2JlIGluIHRoYXQgY2FzZSBhcyB0aGUgRFUgd2lsbCBuZWVk
IHRoZSBicmlkZ2UgdG8KPiAtCSAqIGNvbnRyb2wgdGhlIGNsb2NrLgo+IC0JICovCj4gLQlpZiAo
bHZkcy0+aW5mby0+cXVpcmtzICYgUkNBUl9MVkRTX1FVSVJLX0VYVF9QTEwpCj4gLQkJcmV0dXJu
IHJldCA9PSAtRU5PREVWID8gMCA6IHJldDsKPiArCXN3aXRjaCAocmV0KSB7Cj4gKwljYXNlIC1F
Tk9ERVY6Cj4gKwkJLyoKPiArCQkgKiBPbiBEMy9FMyB0aGUgTFZEUyBlbmNvZGVyIHByb3ZpZGVz
IGEgY2xvY2sgdG8gdGhlIERVLCB3aGljaAo+ICsJCSAqIGNhbiBiZSB1c2VkIGZvciB0aGUgRFBB
RCBvdXRwdXQgZXZlbiB3aGVuIHRoZSBMVkRTIG91dHB1dCBpcwo+ICsJCSAqIG5vdCBjb25uZWN0
ZWQuIERvbid0IGZhaWwgcHJvYmUgaW4gdGhhdCBjYXNlIGFzIHRoZSBEVSB3aWxsCj4gKwkJICog
bmVlZCB0aGUgYnJpZGdlIHRvIGNvbnRyb2wgdGhlIGNsb2NrLgo+ICsJCSAqLwo+ICsJCWlmIChs
dmRzLT5pbmZvLT5xdWlya3MgJiBSQ0FSX0xWRFNfUVVJUktfRVhUX1BMTCkKPiArCQkJcmV0ID0g
MDsKPiArCQlicmVhazsKPiArCWNhc2UgLUVOWElPOgo+ICsJCS8qCj4gKwkJICogV2hlbiB0aGUg
TFZEUyBvdXRwdXQgaXMgdXNlZCBpbiBkdWFsIGxpbmsgbW9kZSwgdGhlCj4gKwkJICogY29tcGFu
aW9uIGVuY29kZXIgZmFpbHMgYXQKPiArCQkgKiAncmNhcl9sdmRzX3BhcnNlX2R0X2NvbXBhbmlv
bigpJy4gRG9uJ3QgZmFpbCBwcm9iZSBpbgo+ICsJCSAqIHRoYXQgY2FzZSBhcyB0aGUgbWFzdGVy
IGVuY29kZXIgd2lsbCBuZWVkIHRoZSBjb21wYW5pb24ncwo+ICsJCSAqIGJyaWRnZSB0byBjb250
cm9sIGl0cyBvcGVyYXRpb25zLgo+ICsJCSAqLwo+ICsJCWlmIChsdmRzLT5pbmZvLT5xdWlya3Mg
JiBSQ0FSX0xWRFNfUVVJUktfRFVBTF9MSU5LKQo+ICsJCQlyZXQgPSAwOwo+ICsJCWJyZWFrOwo+
ICsJfQo+IAo+ICAJcmV0dXJuIHJldDsKPiAgfQo+IC0tCj4gMi4yMi4wCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
