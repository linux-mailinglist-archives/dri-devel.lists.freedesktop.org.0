Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3118B173
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 09:52:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ED6F6E087;
	Tue, 13 Aug 2019 07:52:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0CCB6E084
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 07:52:44 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7D7qb2c034507;
 Tue, 13 Aug 2019 02:52:37 -0500
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7D7qbMh021842
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 13 Aug 2019 02:52:37 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 13
 Aug 2019 02:52:36 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 13 Aug 2019 02:52:36 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7D7qYtr087233;
 Tue, 13 Aug 2019 02:52:35 -0500
Subject: Re: [PATCH 33/60] drm/omap: hdmi: Allocate EDID in the .read_edid()
 operation
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 <dri-devel@lists.freedesktop.org>
References: <20190707180852.5512-1-laurent.pinchart@ideasonboard.com>
 <20190707181937.6250-1-laurent.pinchart@ideasonboard.com>
 <20190707181937.6250-30-laurent.pinchart@ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <db4bd1fc-f21f-d894-3f56-761859387b61@ti.com>
Date: Tue, 13 Aug 2019 10:52:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190707181937.6250-30-laurent.pinchart@ideasonboard.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1565682757;
 bh=ANFlQ2ejXPIAloFU2pqaoLgFODcrDiWxamPj3idWyTQ=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=Et5zuxAONbf+yU0O/P9RDmH704U5ACRaLdjHXesRHSN79BcXsbKbphnF2cOsjw6cx
 KXK5I1lofIv1xNqOt9xcLk8sRwPq4bzpbn1DaOfhklPEJ8lo44ee1TQCVZBZ3f1ZR0
 ettoQuX6CNdVVmp7sCUA4QD/Ko86Vx1bLZ91ZD4g=
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Sean Paul <sean@poorly.run>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDcvMDcvMjAxOSAyMToxOSwgTGF1cmVudCBQaW5jaGFydCB3cm90ZToKPiBCcmluZyB0aGUg
b21hcGRzcy1zcGVjaWZpYyAucmVhZF9lZGlkKCkgb3BlcmF0aW9uIGluIHN5bmMgd2l0aCB0aGUK
PiBkcm1fYnJpZGdlIC5nZXRfZWRpZCgpIG9wZXJhdGlvbiB0byBlYXNlIGNvZGUgcmV1c2UuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVh
c29uYm9hcmQuY29tPgo+IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZHNzL2hkbWk0
LmMgICAgICB8IDM0ICsrKysrKysrKysrKysrKystLS0tLS0tLQo+ICAgZHJpdmVycy9ncHUvZHJt
L29tYXBkcm0vZHNzL2hkbWk1LmMgICAgICB8IDIyICsrKysrKysrKystLS0tLQo+ICAgZHJpdmVy
cy9ncHUvZHJtL29tYXBkcm0vZHNzL29tYXBkc3MuaCAgICB8ICAyICstCj4gICBkcml2ZXJzL2dw
dS9kcm0vb21hcGRybS9vbWFwX2Nvbm5lY3Rvci5jIHwgMTIgKysrLS0tLS0tCj4gICA0IGZpbGVz
IGNoYW5nZWQsIDQzIGluc2VydGlvbnMoKyksIDI3IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3MvaGRtaTQuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9vbWFwZHJtL2Rzcy9oZG1pNC5jCj4gaW5kZXggMGEwYmRhN2Y2ODZmLi5mMDU4NjEwOGI0MWUg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZHNzL2hkbWk0LmMKPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3MvaGRtaTQuYwo+IEBAIC00MTYsMzEgKzQxNiw0
MyBAQCBzdGF0aWMgdm9pZCBoZG1pX2Rpc2Nvbm5lY3Qoc3RydWN0IG9tYXBfZHNzX2RldmljZSAq
c3JjLAo+ICAgCW9tYXBkc3NfZGV2aWNlX2Rpc2Nvbm5lY3QoZHN0LCBkc3QtPm5leHQpOwo+ICAg
fQo+ICAgCj4gLXN0YXRpYyBpbnQgaGRtaV9yZWFkX2VkaWQoc3RydWN0IG9tYXBfZHNzX2Rldmlj
ZSAqZHNzZGV2LAo+IC0JCXU4ICplZGlkLCBpbnQgbGVuKQo+ICtzdGF0aWMgc3RydWN0IGVkaWQg
KmhkbWlfcmVhZF9lZGlkKHN0cnVjdCBvbWFwX2Rzc19kZXZpY2UgKmRzc2RldikKPiAgIHsKPiAg
IAlzdHJ1Y3Qgb21hcF9oZG1pICpoZG1pID0gZHNzZGV2X3RvX2hkbWkoZHNzZGV2KTsKPiAgIAli
b29sIG5lZWRfZW5hYmxlOwo+ICsJdTggKmVkaWQ7Cj4gICAJaW50IHI7Cj4gICAKPiArCWVkaWQg
PSBremFsbG9jKDUxMiwgR0ZQX0tFUk5FTCk7Cgo1MTIgYnl0ZXMgaXMgZW5vdWdoIGZvciBldmVy
eW9uZT8gPSkKCk1heWJlIHN0aWxsIGtlZXAgaXQgYXMgYSBkZWZpbmUgZm9yIGNsYXJpdHk/CgpS
ZXZpZXdlZC1ieTogVG9taSBWYWxrZWluZW4gPHRvbWkudmFsa2VpbmVuQHRpLmNvbT4KCiAgVG9t
aQoKLS0gClRleGFzIEluc3RydW1lbnRzIEZpbmxhbmQgT3ksIFBvcmtrYWxhbmthdHUgMjIsIDAw
MTgwIEhlbHNpbmtpLgpZLXR1bm51cy9CdXNpbmVzcyBJRDogMDYxNTUyMS00LiBLb3RpcGFpa2th
L0RvbWljaWxlOiBIZWxzaW5raQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
