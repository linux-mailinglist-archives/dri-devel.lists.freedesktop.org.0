Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C78AE41F
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2019 08:58:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21C086E822;
	Tue, 10 Sep 2019 06:57:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc
 [IPv6:2a01:238:4321:8900:456f:ecd6:43e:202c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBAD089E7B
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2019 20:14:02 +0000 (UTC)
Received: from p200300ccff0a27001a3da2fffebfd33a.dip0.t-ipconnect.de
 ([2003:cc:ff0a:2700:1a3d:a2ff:febf:d33a] helo=aktux)
 by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <andreas@kemnade.info>)
 id 1i7Q2o-0005Fh-OY; Mon, 09 Sep 2019 22:13:51 +0200
Date: Mon, 9 Sep 2019 22:13:49 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [PATCH 1/2] backlight: lm3630a: add an enable gpio for the HWEN
 pin
Message-ID: <20190909221349.46ca5a1f@aktux>
In-Reply-To: <20190909105729.w5552rtop7rhghy2@holly.lan>
References: <20190908203704.30147-1-andreas@kemnade.info>
 <20190908203704.30147-2-andreas@kemnade.info>
 <20190909105729.w5552rtop7rhghy2@holly.lan>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Spam-Score: -1.0 (-)
X-Mailman-Approved-At: Tue, 10 Sep 2019 06:57:58 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7S0iKdrC5W7P3u4rFYo6R5dKDWVHbSKL0UCfO8ayAEY=; b=Ca1HsyzD/Rzmy3F/wPAzVKV0jH
 1JibeJWfqCLlaa8vb+7Jrrt7+HIBdqRX4faZ8Lkt+wJBgrSOWjW6uYFJuoF9EnR8uTQR68+4ijb5c
 Nlt25Zh1DQU+BJTX2e7j+hslmzL8KrclN5IqlwazEZ9G0V9ZEH8F0PPTcFMJQ6MBEQDc=;
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-fbdev@vger.kernel.org, b.zolnierkie@samsung.com, jingoohan1@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz, "H. Nikolaus
 Schaller" <hns@goldelico.com>, lee.jones@linaro.org, linux-leds@vger.kernel.org,
 dmurphy@ti.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCA5IFNlcCAyMDE5IDExOjU3OjI5ICswMTAwCkRhbmllbCBUaG9tcHNvbiA8ZGFuaWVs
LnRob21wc29uQGxpbmFyby5vcmc+IHdyb3RlOgoKPiBPbiBTdW4sIFNlcCAwOCwgMjAxOSBhdCAx
MDozNzowM1BNICswMjAwLCBBbmRyZWFzIEtlbW5hZGUgd3JvdGU6Cj4gPiBGb3Igbm93IGp1c3Qg
ZW5hYmxlIGl0IGluIHRoZSBwcm9iZSBmdW5jdGlvbiB0byBhbGxvdyBpMmMKPiA+IGFjY2VzcyBh
bmQgZGlzYWJsZSBpdCBvbiByZW1vdmUuIERpc2FibGluZyBhbHNvIG1lYW5zIHJlc2V0dGluZwo+
ID4gdGhlIHJlZ2lzdGVyIHZhbHVlcyB0byBkZWZhdWx0Lgo+ID4gCj4gPiBUZXN0ZWQgb24gS29i
byBDbGFyYSBIRC4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogQW5kcmVhcyBLZW1uYWRlIDxhbmRy
ZWFzQGtlbW5hZGUuaW5mbz4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2xt
MzYzMGFfYmwuYyB8IDE4ICsrKysrKysrKysrKysrKysrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAx
OCBpbnNlcnRpb25zKCspCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2JhY2ts
aWdodC9sbTM2MzBhX2JsLmMgYi9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9sbTM2MzBhX2JsLmMK
PiA+IGluZGV4IGIwNGIzNWQwMDdhMi4uM2I0NWExNzMzMTk4IDEwMDY0NAo+ID4gLS0tIGEvZHJp
dmVycy92aWRlby9iYWNrbGlnaHQvbG0zNjMwYV9ibC5jCj4gPiArKysgYi9kcml2ZXJzL3ZpZGVv
L2JhY2tsaWdodC9sbTM2MzBhX2JsLmMKPiA+IEBAIC0xMiw2ICsxMiw4IEBACj4gPiAgI2luY2x1
ZGUgPGxpbnV4L3VhY2Nlc3MuaD4KPiA+ICAjaW5jbHVkZSA8bGludXgvaW50ZXJydXB0Lmg+Cj4g
PiAgI2luY2x1ZGUgPGxpbnV4L3JlZ21hcC5oPgo+ID4gKyNpbmNsdWRlIDxsaW51eC9ncGlvL2Nv
bnN1bWVyLmg+Cj4gPiArI2luY2x1ZGUgPGxpbnV4L2dwaW8uaD4KPiA+ICAjaW5jbHVkZSA8bGlu
dXgvcHdtLmg+Cj4gPiAgI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RhdGEvbG0zNjMwYV9ibC5o
Pgo+ID4gIAo+ID4gQEAgLTQ4LDYgKzUwLDcgQEAgc3RydWN0IGxtMzYzMGFfY2hpcCB7Cj4gPiAg
CXN0cnVjdCBsbTM2MzBhX3BsYXRmb3JtX2RhdGEgKnBkYXRhOwo+ID4gIAlzdHJ1Y3QgYmFja2xp
Z2h0X2RldmljZSAqYmxlZGE7Cj4gPiAgCXN0cnVjdCBiYWNrbGlnaHRfZGV2aWNlICpibGVkYjsK
PiA+ICsJc3RydWN0IGdwaW9fZGVzYyAqZW5hYmxlX2dwaW87Cj4gPiAgCXN0cnVjdCByZWdtYXAg
KnJlZ21hcDsKPiA+ICAJc3RydWN0IHB3bV9kZXZpY2UgKnB3bWQ7Cj4gPiAgfTsKPiA+IEBAIC01
MDYsNiArNTA5LDE0IEBAIHN0YXRpYyBpbnQgbG0zNjMwYV9wcm9iZShzdHJ1Y3QgaTJjX2NsaWVu
dCAqY2xpZW50LAo+ID4gIAkJcmV0dXJuIC1FTk9NRU07Cj4gPiAgCXBjaGlwLT5kZXYgPSAmY2xp
ZW50LT5kZXY7Cj4gPiAgCj4gPiArCXBjaGlwLT5lbmFibGVfZ3BpbyA9IGRldm1fZ3Bpb2RfZ2V0
X29wdGlvbmFsKCZjbGllbnQtPmRldiwgImVuYWJsZSIsCj4gPiArCQkJCQkJR1BJT0RfQVNJUyk7
ICAKPiAKPiBJbml0aWFsaXppbmcgR1BJT0RfQVNJUyBkb2Vzbid0IGxvb2sgcmlnaHQgdG8gbWUu
Cj4gCj4gSWYgeW91IGluaXRpYWxpemUgQVNJUyB0aGVuIHRoZSBkcml2ZXIgbXVzdCBjb25maWd1
cmUgdGhlIHBpbiBhcyBhbgo+IG91dHB1dC4uLiBmYXIgZWFzaWVyIGp1c3QgdG8gc2V0IEdQSU9E
X09VVF9ISUdIIGR1cmluZyB0aGUgZ2V0Lgo+IAo+IE5vdGUgYWxzbyB0aGF0IHRoZSBjYWxsIHRv
IHRoaXMgZnVuY3Rpb24gc2hvdWxkIGFsc28gYmUgbW92ZWQgKmJlbG93Kgo+IHRoZSBjYWxscyBw
YXJzZSB0aGUgRFQuCj4gCm9vcHMsIG11c3QgaGF2ZSBmb3Jnb3R0ZW4gdGhhdCwgYW5kIGhhZCBn
b29kIGx1Y2sgaGVyZS4KPiAKPiA+ICsJaWYgKElTX0VSUihwY2hpcC0+ZW5hYmxlX2dwaW8pKSB7
Cj4gPiArCQlydmFsID0gUFRSX0VSUihwY2hpcC0+ZW5hYmxlX2dwaW8pOwo+ID4gKwkJcmV0dXJu
IHJ2YWw7Cj4gPiArCX0KPiA+ICsKPiA+ICsKPiA+ICAJcGNoaXAtPnJlZ21hcCA9IGRldm1fcmVn
bWFwX2luaXRfaTJjKGNsaWVudCwgJmxtMzYzMGFfcmVnbWFwKTsKPiA+ICAJaWYgKElTX0VSUihw
Y2hpcC0+cmVnbWFwKSkgewo+ID4gIAkJcnZhbCA9IFBUUl9FUlIocGNoaXAtPnJlZ21hcCk7Cj4g
PiBAQCAtNTM1LDYgKzU0NiwxMCBAQCBzdGF0aWMgaW50IGxtMzYzMGFfcHJvYmUoc3RydWN0IGky
Y19jbGllbnQgKmNsaWVudCwKPiA+ICAJfQo+ID4gIAlwY2hpcC0+cGRhdGEgPSBwZGF0YTsKPiA+
ICAKPiA+ICsJaWYgKHBjaGlwLT5lbmFibGVfZ3Bpbykgewo+ID4gKwkJZ3Bpb2Rfc2V0X3ZhbHVl
X2NhbnNsZWVwKHBjaGlwLT5lbmFibGVfZ3BpbywgMSk7ICAKPiAKPiBOb3QgbmVlZGVkLCB1c2Ug
R1BJT0RfT1VUX0hJR0ggaW5zdGVhZC4KPiAKPiAKPiA+ICsJCXVzbGVlcF9yYW5nZSgxMDAwLCAy
MDAwKTsgIAo+IAo+IE5vdCBuZWVkZWQsIHRoaXMgc2xlZXAgaXMgYWxyZWFkeSBwYXJ0IG9mIGxt
MzYzMGFfY2hpcF9pbml0KCkuCj4gCnlvdSBhcmUgcmlnaHQuCj4gCj4gPiArCX0KPiA+ICAJLyog
Y2hpcCBpbml0aWFsaXplICovCj4gPiAgCXJ2YWwgPSBsbTM2MzBhX2NoaXBfaW5pdChwY2hpcCk7
Cj4gPiAgCWlmIChydmFsIDwgMCkgewo+ID4gQEAgLTU4Niw2ICs2MDEsOSBAQCBzdGF0aWMgaW50
IGxtMzYzMGFfcmVtb3ZlKHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQpCj4gPiAgCWlmIChydmFs
IDwgMCkKPiA+ICAJCWRldl9lcnIocGNoaXAtPmRldiwgImkyYyBmYWlsZWQgdG8gYWNjZXNzIHJl
Z2lzdGVyXG4iKTsKPiA+ICAKPiA+ICsJaWYgKHBjaGlwLT5lbmFibGVfZ3BpbykKPiA+ICsJCWdw
aW9kX3NldF92YWx1ZV9jYW5zbGVlcChwY2hpcC0+ZW5hYmxlX2dwaW8sIDApOwo+ID4gKyAgCj4g
Cj4gSXMgdGhpcyBuZWVkZWQ/Cj4gCj4gVGhpcyBpcyBhIHJlbW92ZSBwYXRoLCBub3QgYSBwb3dl
ciBtYW5hZ2VtZW50IHBhdGgsIGFuZCB3ZSBoYXZlIG5vIGlkZWEKPiB3aGF0IHRoZSBvcmlnaW5h
bCBzdGF0dXMgb2YgdGhlIHBpbiB3YXMgYW55d2F5Pwo+IAoKTG9va2luZyBhdCBJc2hkbiBvbiBw
YWdlIDUgb2YgdGhlIGRhdGFzaGVldCwgc3dpdGNoaW5nIGl0IG9mZiBldmVyeXRpbWUKcG9zc2li
bGUgc2VlbXMgbm90IG5lZWRlZC4gV2Ugd291bGQgbmVlZCB0byBjYWxsIGNoaXBfaW5pdCgpIGV2
ZXJ5dGltZQp3ZSBlbmFibGUgdGhlIGdwaW8gb3IgbGl2ZSB3aXRoIGRlZmF1bHQgdmFsdWVzLgpU
aGVyZWZvcmUgSSBkaWQgZGVjaWRlIHRvIG5vdCBwdXQgaXQgaW50byBhbnkgcG93ZXIgbWFuYWdl
bWVudCBwYXRoLiBCdXQKc3dpdGNoaW5nIGl0IG9uIGFuZCBub3Qgc3dpdGNoaW5nIGl0IG9mZiBm
ZWVscyBzbyB1bmJhbGFuY2VkLiAKClJlZ2FyZHMsCkFuZHJlYXMKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
