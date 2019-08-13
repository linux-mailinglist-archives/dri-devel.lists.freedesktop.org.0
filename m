Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB528B128
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 09:32:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 046356E071;
	Tue, 13 Aug 2019 07:32:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C5946E071
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 07:32:24 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7D7WD2p029701;
 Tue, 13 Aug 2019 02:32:13 -0500
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7D7WD5f127005
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 13 Aug 2019 02:32:13 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 13
 Aug 2019 02:32:12 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 13 Aug 2019 02:32:12 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7D7WAge010953;
 Tue, 13 Aug 2019 02:32:10 -0500
Subject: Re: [PATCH 28/60] drm/omap: Factor out display type to connector type
 conversion
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 <dri-devel@lists.freedesktop.org>
References: <20190707180852.5512-1-laurent.pinchart@ideasonboard.com>
 <20190707181937.6250-1-laurent.pinchart@ideasonboard.com>
 <20190707181937.6250-25-laurent.pinchart@ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <89eb9d64-3375-568a-6f0a-9e4cbe5896cc@ti.com>
Date: Tue, 13 Aug 2019 10:32:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190707181937.6250-25-laurent.pinchart@ideasonboard.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1565681533;
 bh=+UExw/7XuTETHNhu4gklm3koj4wXiIC5xJVFhfv7dwc=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=bN65lUOCAfcHVJuQOMcCSxIwMNmV6+EKi815r9/XhUnLEu+lunlhiMBDUb5fZqEuB
 v2d2TAmGWSQOJw30T0bpE/D5m2i6KX9+nd8X+hrVaGblLfDOm7c8+iY7Hcje+LUpVr
 2OlTIW5G5ViEwVSS9pRSifdIX4T/jdhK4+RmhKFk=
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

T24gMDcvMDcvMjAxOSAyMToxOSwgTGF1cmVudCBQaW5jaGFydCB3cm90ZToKPiBNb3ZlIHRoZSBj
b2RlIHRoYXQgY29tcHV0ZXMgdGhlIERSTSBjb25uZWN0b3IgdHlwZSBmb3IgdGhlCj4gb21hcGRz
c19kZXZpY2UgZGlzcGxheSB0eXBlIHRvIGEgbmV3IG9tYXBkc3NfZGV2aWNlX2Nvbm5lY3Rvcl90
eXBlKCkKPiBmdW5jdGlvbiBmb3IgbGF0ZXIgcmV1c2UuCj4gCj4gU2lnbmVkLW9mZi1ieTogTGF1
cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgo+IC0tLQo+
ICAgZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZHNzL2Jhc2UuYyAgICAgICB8IDIzICsrKysrKysr
KysrKysrKysrKysrKysrCj4gICBkcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3Mvb21hcGRzcy5o
ICAgIHwgIDEgKwo+ICAgZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9jb25uZWN0b3IuYyB8
IDE5ICstLS0tLS0tLS0tLS0tLS0tLS0KPiAgIDMgZmlsZXMgY2hhbmdlZCwgMjUgaW5zZXJ0aW9u
cygrKSwgMTggZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9v
bWFwZHJtL2Rzcy9iYXNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3MvYmFzZS5jCj4g
aW5kZXggYTE5NzBiOWRiNmFiLi5jYWU1Njg3ODIyZTIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL29tYXBkcm0vZHNzL2Jhc2UuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJt
L2Rzcy9iYXNlLmMKPiBAQCAtMjg1LDYgKzI4NSwyOSBAQCB2b2lkIG9tYXBkc3NfZGV2aWNlX3Bv
c3RfZGlzYWJsZShzdHJ1Y3Qgb21hcF9kc3NfZGV2aWNlICpkc3NkZXYpCj4gICB9Cj4gICBFWFBP
UlRfU1lNQk9MX0dQTChvbWFwZHNzX2RldmljZV9wb3N0X2Rpc2FibGUpOwo+ICAgCj4gK3Vuc2ln
bmVkIGludCBvbWFwZHNzX2RldmljZV9jb25uZWN0b3JfdHlwZShlbnVtIG9tYXBfZGlzcGxheV90
eXBlIHR5cGUpCj4gK3sKPiArCXN3aXRjaCAodHlwZSkgewo+ICsJY2FzZSBPTUFQX0RJU1BMQVlf
VFlQRV9IRE1JOgo+ICsJCXJldHVybiBEUk1fTU9ERV9DT05ORUNUT1JfSERNSUE7Cj4gKwljYXNl
IE9NQVBfRElTUExBWV9UWVBFX0RWSToKPiArCQlyZXR1cm4gRFJNX01PREVfQ09OTkVDVE9SX0RW
SUQ7Cj4gKwljYXNlIE9NQVBfRElTUExBWV9UWVBFX0RTSToKPiArCQlyZXR1cm4gRFJNX01PREVf
Q09OTkVDVE9SX0RTSTsKPiArCWNhc2UgT01BUF9ESVNQTEFZX1RZUEVfRFBJOgo+ICsJY2FzZSBP
TUFQX0RJU1BMQVlfVFlQRV9EQkk6Cj4gKwkJcmV0dXJuIERSTV9NT0RFX0NPTk5FQ1RPUl9EUEk7
Cj4gKwljYXNlIE9NQVBfRElTUExBWV9UWVBFX1ZFTkM6Cj4gKwkJLyogVE9ETzogVGhpcyBjb3Vs
ZCBhbHNvIGJlIGNvbXBvc2l0ZSAqLwo+ICsJCXJldHVybiBEUk1fTU9ERV9DT05ORUNUT1JfU1ZJ
REVPOwo+ICsJY2FzZSBPTUFQX0RJU1BMQVlfVFlQRV9TREk6Cj4gKwkJcmV0dXJuIERSTV9NT0RF
X0NPTk5FQ1RPUl9MVkRTOwo+ICsJZGVmYXVsdDoKPiArCQlyZXR1cm4gRFJNX01PREVfQ09OTkVD
VE9SX1Vua25vd247Cj4gKwl9Cj4gK30KPiArRVhQT1JUX1NZTUJPTF9HUEwob21hcGRzc19kZXZp
Y2VfY29ubmVjdG9yX3R5cGUpOwoKV2h5IGRvIHdlIG5lZWQgdG8gZXhwb3J0IHRoaXM/IEluIHRo
ZSBlbmQgZW51bSBvbWFwX2Rpc3BsYXlfdHlwZSBzaG91bGQgCmdvIGF3YXkgb3IgYmUgcHJpdmF0
ZSB0byBvbWFwZHJtLCByaWdodD8KClJldmlld2VkLWJ5OiBUb21pIFZhbGtlaW5lbiA8dG9taS52
YWxrZWluZW5AdGkuY29tPgoKICBUb21pCgotLSAKVGV4YXMgSW5zdHJ1bWVudHMgRmlubGFuZCBP
eSwgUG9ya2thbGFua2F0dSAyMiwgMDAxODAgSGVsc2lua2kuClktdHVubnVzL0J1c2luZXNzIElE
OiAwNjE1NTIxLTQuIEtvdGlwYWlra2EvRG9taWNpbGU6IEhlbHNpbmtpCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
