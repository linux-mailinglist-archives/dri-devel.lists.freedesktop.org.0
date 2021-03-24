Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA14347F2B
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 18:20:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96D856ECBB;
	Wed, 24 Mar 2021 17:20:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay.hostedemail.com (smtprelay0202.hostedemail.com
 [216.40.44.202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E35426ECBB
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 17:20:28 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay04.hostedemail.com (Postfix) with ESMTP id 126B118159034;
 Wed, 24 Mar 2021 17:20:28 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, ,
 RULES_HIT:41:69:152:334:355:379:421:800:960:973:988:989:1260:1261:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1535:1543:1593:1594:1605:1711:1730:1747:1777:1792:1801:2198:2199:2393:2553:2559:2562:2689:2731:3138:3139:3140:3141:3142:3622:3865:3866:3867:3868:3870:3871:3872:3873:3874:4321:4605:5007:6119:6120:6742:7652:7903:10004:10400:10848:11026:11232:11233:11473:11657:11658:11783:11914:12043:12048:12296:12297:12438:12555:12740:12895:12986:13894:14096:14097:14181:14659:14721:21080:21433:21451:21627:21740:21990,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:1, LUA_SUMMARY:none
X-HE-Tag: blade66_5814dea2777c
X-Filterd-Recvd-Size: 5314
Received: from [192.168.1.159] (unknown [47.151.137.21])
 (Authenticated sender: joe@perches.com)
 by omf08.hostedemail.com (Postfix) with ESMTPA;
 Wed, 24 Mar 2021 17:20:24 +0000 (UTC)
Message-ID: <3252fd83141aa9e0e6001acee1dd98e87c676b9a.camel@perches.com>
Subject: [RFC patch] vsprintf: Allow %pe to print non PTR_ERR %pe uses as
 decimal
From: Joe Perches <joe@perches.com>
To: Arnd Bergmann <arnd@kernel.org>, Petr Mladek <pmladek@suse.com>, Steven
 Rostedt <rostedt@goodmis.org>, Sergey Senozhatsky
 <senozhatsky@chromium.org>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Rasmus Villemoes
 <linux@rasmusvillemoes.dk>
Date: Wed, 24 Mar 2021 10:20:23 -0700
In-Reply-To: <810d36184b9fa2880d3ba7738a8f182e27f5107b.camel@perches.com>
References: <20210324121832.3714570-1-arnd@kernel.org>
 <e1310273dcc577f3a772380ada7b6cc1906d680b.camel@perches.com>
 <CAK8P3a0JyoAtTYTi+M_mJ3_KtUJ6NeJB=FNWhzezqcXMac++mQ@mail.gmail.com>
 <810d36184b9fa2880d3ba7738a8f182e27f5107b.camel@perches.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: David Airlie <airlied@linux.ie>, Sascha Hauer <s.hauer@pengutronix.de>,
 Marco Felsch <m.felsch@pengutronix.de>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Liu Ying <victor.liu@nxp.com>, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDIxLTAzLTI0IGF0IDA5OjUyIC0wNzAwLCBKb2UgUGVyY2hlcyB3cm90ZToKPiBP
biBXZWQsIDIwMjEtMDMtMjQgYXQgMTc6NDIgKzAxMDAsIEFybmQgQmVyZ21hbm4gd3JvdGU6Cj4g
PiBPbiBXZWQsIE1hciAyNCwgMjAyMSBhdCAzOjIwIFBNIEpvZSBQZXJjaGVzIDxqb2VAcGVyY2hl
cy5jb20+IHdyb3RlOgo+IFtdCj4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9p
bXgvaW14LWxkYi5jIGIvZHJpdmVycy9ncHUvZHJtL2lteC9pbXgtbGRiLmMKPiA+ID4gW10KPiA+
ID4gPiBAQCAtMTk3LDYgKzE5NywxMiBAQCBzdGF0aWMgdm9pZCBpbXhfbGRiX2VuY29kZXJfZW5h
YmxlKHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlcikKPiA+ID4gPiDCoMKgwqDCoMKgwqBpbnQg
ZHVhbCA9IGxkYi0+bGRiX2N0cmwgJiBMREJfU1BMSVRfTU9ERV9FTjsKPiA+ID4gPiDCoMKgwqDC
oMKgwqBpbnQgbXV4ID0gZHJtX29mX2VuY29kZXJfYWN0aXZlX3BvcnRfaWQoaW14X2xkYl9jaC0+
Y2hpbGQsIGVuY29kZXIpOwo+ID4gPiA+IAo+ID4gPiA+ICsgICAgIGlmIChtdXggPCAwIHx8IG11
eCA+PSBBUlJBWV9TSVpFKGxkYi0+Y2xrX3NlbCkpIHsKPiA+ID4gPiArICAgICAgICAgICAgIGRl
dl93YXJuKGxkYi0+ZGV2LCAiJXM6IGludmFsaWQgbXV4ICVkXG4iLAo+ID4gPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgX19mdW5jX18sIEVSUl9QVFIobXV4KSk7Cj4gPiA+IAo+ID4gPiBUaGlz
IGRvZXMgbm90IGNvbXBpbGUgd2l0aG91dCB3YXJuaW5ncy4KPiA+ID4gCj4gPiA+IGRyaXZlcnMv
Z3B1L2RybS9pbXgvaW14LWxkYi5jOiBJbiBmdW5jdGlvbiDigJhpbXhfbGRiX2VuY29kZXJfZW5h
Ymxl4oCZOgo+ID4gPiBkcml2ZXJzL2dwdS9kcm0vaW14L2lteC1sZGIuYzoyMDE6MjI6IHdhcm5p
bmc6IGZvcm1hdCDigJglZOKAmSBleHBlY3RzIGFyZ3VtZW50IG9mIHR5cGUg4oCYaW504oCZLCBi
dXQgYXJndW1lbnQgNCBoYXMgdHlwZSDigJh2b2lkICrigJkgWy1XZm9ybWF0PV0KPiA+ID4gwqDC
oDIwMSB8ICAgZGV2X3dhcm4obGRiLT5kZXYsICIlczogaW52YWxpZCBtdXggJWRcbiIsCj4gPiA+
IMKgwqDCoMKgwqDCoHwgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+
fgo+ID4gPiAKPiA+ID4gSWYgeW91IHdhbnQgdG8gdXNlIEVSUl9QVFIsIHRoZSAlZCBzaG91bGQg
YmUgJXBlIGFzIEVSUl9QVFIKPiA+ID4gaXMgY29udmVydGluZyBhbiBpbnQgYSB2b2lkICogdG8g
ZGVjb2RlIHRoZSBlcnJvciB0eXBlIGFuZAo+ID4gPiBlbWl0IGl0IGFzIGEgc3RyaW5nLgo+ID4g
Cj4gPiBTb3JyeSBhYm91dCB0aGF0Lgo+ID4gCj4gPiBJIGRlY2lkZWQgYWdhaW5zdCB1c2luZyBF
UlJfUFRSKCkgaW4gb3JkZXIgdG8gYWxzbyBjaGVjayBmb3IKPiA+IHBvc2l0aXZlIGFycmF5IG92
ZXJmbG93LCBidXQgdGhlIHZlcnNpb24gSSB0ZXN0ZWQgd2FzIGRpZmZlcmVudCBmcm9tCj4gPiB0
aGUgdmVyc2lvbiBJIHNlbnQuCj4gPiAKPiA+IHYzIGNvbWluZy4KPiAKPiBUaGFua3MuICBObyB3
b3JyaWVzLgo+IAo+IFVwIHRvIHlvdSwgdnNwcmludGYgd291bGQgZW1pdCB0aGUgcG9zaXRpdmUg
bXV4IGFzIGEgZnVua3kgaGFzaGVkCj4gaGV4IHZhbHVlIGJ5IGRlZmF1bHQgaWYgeW91IHVzZSBF
UlJfUFRSIHdpdGggbXV4ID4gQVJSQVlfU0laRSBzbwo+IHBlcmhhcHMgJWQgd2l0aG91dCB0aGUg
RVJSX1BUUiB1c2UgbWFrZXMgdGhlIG1vc3Qgc2Vuc2UuCj4gCj4gCgpNYXliZSBpdCdzIGJldHRl
ciB0byBvdXRwdXQgbm9uIFBUUl9FUlIgJXBlIHVzZXMgYXMgZGVjaW1hbCBzbyB0aGlzCnNvcnQg
b2YgY29kZSB3b3VsZCB3b3JrLgotLS0KIGxpYi92c3ByaW50Zi5jIHwgMjQgKysrKysrKysrKysr
Ky0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvbGliL3ZzcHJpbnRmLmMgYi9saWIvdnNwcmludGYuYwppbmRl
eCAzNjAwZGI2ODZmYTQuLmRlYmRkMWM2MjAzOCAxMDA2NDQKLS0tIGEvbGliL3ZzcHJpbnRmLmMK
KysrIGIvbGliL3ZzcHJpbnRmLmMKQEAgLTYxOSwxOSArNjE5LDIzIEBAIHN0YXRpYyBjaGFyICpz
dHJpbmdfbm9jaGVjayhjaGFyICpidWYsIGNoYXIgKmVuZCwgY29uc3QgY2hhciAqcywKIAlyZXR1
cm4gd2lkZW5fc3RyaW5nKGJ1ZiwgbGVuLCBlbmQsIHNwZWMpOwogfQogCi1zdGF0aWMgY2hhciAq
ZXJyX3B0cihjaGFyICpidWYsIGNoYXIgKmVuZCwgdm9pZCAqcHRyLAotCQkgICAgIHN0cnVjdCBw
cmludGZfc3BlYyBzcGVjKQorc3RhdGljIG5vaW5saW5lX2Zvcl9zdGFjaworY2hhciAqZXJyX3B0
cihjaGFyICpidWYsIGNoYXIgKmVuZCwgdm9pZCAqcHRyLCBzdHJ1Y3QgcHJpbnRmX3NwZWMgc3Bl
YykKIHsKIAlpbnQgZXJyID0gUFRSX0VSUihwdHIpOwotCWNvbnN0IGNoYXIgKnN5bSA9IGVycm5h
bWUoZXJyKTsKIAotCWlmIChzeW0pCi0JCXJldHVybiBzdHJpbmdfbm9jaGVjayhidWYsIGVuZCwg
c3ltLCBzcGVjKTsKKwlpZiAoSVNfRVJSKHB0cikpIHsKKwkJY29uc3QgY2hhciAqc3ltID0gZXJy
bmFtZShlcnIpOworCisJCWlmIChzeW0pCisJCQlyZXR1cm4gc3RyaW5nX25vY2hlY2soYnVmLCBl
bmQsIHN5bSwgc3BlYyk7CisJfQogCiAJLyoKLQkgKiBTb21lYm9keSBwYXNzZWQgRVJSX1BUUigt
MTIzNCkgb3Igc29tZSBvdGhlciBub24tZXhpc3RpbmcKLQkgKiBFZm9vIC0gb3IgcGVyaGFwcyBD
T05GSUdfU1lNQk9MSUNfRVJSTkFNRT1uLiBGYWxsIGJhY2sgdG8KLQkgKiBwcmludGluZyBpdCBh
cyBpdHMgZGVjaW1hbCByZXByZXNlbnRhdGlvbi4KKwkgKiBTb21lYm9keSBwYXNzZWQgRVJSX1BU
UigtMTIzNCkgb3Igc29tZSBvdGhlciBub24tZXhpc3RpbmcgLUU8Rk9PPgorCSAqIG9yIHBlcmhh
cHMgQ09ORklHX1NZTUJPTElDX0VSUk5BTUU9bgorCSAqIG9yIHBlcmhhcHMgYSBwb3NpdGl2ZSBu
dW1iZXIgbGlrZSBhbiBhcnJheSBpbmRleAorCSAqIEZhbGwgYmFjayB0byBwcmludGluZyBpdCBh
cyBpdHMgZGVjaW1hbCByZXByZXNlbnRhdGlvbi4KIAkgKi8KIAlzcGVjLmZsYWdzIHw9IFNJR047
CiAJc3BlYy5iYXNlID0gMTA7CkBAIC0yNDA3LDkgKzI0MTEsNyBAQCBjaGFyICpwb2ludGVyKGNv
bnN0IGNoYXIgKmZtdCwgY2hhciAqYnVmLCBjaGFyICplbmQsIHZvaWQgKnB0ciwKIAljYXNlICd4
JzoKIAkJcmV0dXJuIHBvaW50ZXJfc3RyaW5nKGJ1ZiwgZW5kLCBwdHIsIHNwZWMpOwogCWNhc2Ug
J2UnOgotCQkvKiAlcGUgd2l0aCBhIG5vbi1FUlJfUFRSIGdldHMgdHJlYXRlZCBhcyBwbGFpbiAl
cCAqLwotCQlpZiAoIUlTX0VSUihwdHIpKQotCQkJYnJlYWs7CisJCS8qICVwZSB3aXRoIGEgbm9u
LUVSUl9QVFIocHRyKSBnZXRzIHRyZWF0ZWQgYXMgJWxkICovCiAJCXJldHVybiBlcnJfcHRyKGJ1
ZiwgZW5kLCBwdHIsIHNwZWMpOwogCWNhc2UgJ3UnOgogCWNhc2UgJ2snOgoKLS0tCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
