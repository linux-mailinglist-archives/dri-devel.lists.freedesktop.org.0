Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B979ADCE41
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2019 20:38:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4B5C6EBB5;
	Fri, 18 Oct 2019 18:37:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FF906E114
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2019 06:42:57 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 6D87F61185; Fri, 18 Oct 2019 06:42:57 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 by smtp.codeaurora.org (Postfix) with ESMTP id 51E72610DC;
 Fri, 18 Oct 2019 06:42:56 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 18 Oct 2019 12:12:56 +0530
From: kgunda@codeaurora.org
To: Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [PATCH V7 6/6] backlight: qcom-wled: Add auto string detection
 logic
In-Reply-To: <20191017133954.7vgqjgwxojmjw446@holly.lan>
References: <1571220826-7740-1-git-send-email-kgunda@codeaurora.org>
 <1571220826-7740-7-git-send-email-kgunda@codeaurora.org>
 <20191017112941.qqvgboyambzw63i3@holly.lan>
 <fa32f7ec727cb2626ad877a6cef32a1b@codeaurora.org>
 <20191017133954.7vgqjgwxojmjw446@holly.lan>
Message-ID: <bd369e2d809d642867f712499df0eb33@codeaurora.org>
X-Sender: kgunda@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
X-Mailman-Approved-At: Fri, 18 Oct 2019 18:37:46 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1571380977;
 bh=6TBlAdKQKJ2jvjGwgvWVKyvODqXx7MA+HnxHF0EkO/M=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XXpUDtHDTlxK4+UvWEa/J0kS0HjwY2zBjFYE7YpXGJAmogZBuItNCDKOCCoKd9sHw
 j7laQYY1fc5Ie3Od2WNektEtPV7W7lVx9ovF5SOUdgYCEtFWEh42yQx1tkvgbpiQuc
 9Q51u31cVnJSq1RadpOrTop88nLPI8gLZWDhFCiw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1571380976;
 bh=6TBlAdKQKJ2jvjGwgvWVKyvODqXx7MA+HnxHF0EkO/M=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gW0PUImE+THwnpgh1sMlgBvC+wHvJgH2dfUwZPnMJQ7NXR8nLTHYG6kMHd7zke0fQ
 jsf4OF79koepY/K+yoYiF204JVVpAVxDfkKQO1EgSXeOjt2EQ9YxVRfGLagD86Oa+W
 CjGLZ6+0LYrwcuBryQpPZXdoJgNDTOYZwxCrAF/s=
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
 Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 robh+dt@kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz,
 linux-arm-msm@vger.kernel.org, lee.jones@linaro.org,
 linux-arm-msm-owner@vger.kernel.org, linux-leds@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0xMC0xNyAxOTowOSwgRGFuaWVsIFRob21wc29uIHdyb3RlOgo+IE9uIFRodSwgT2N0
IDE3LCAyMDE5IGF0IDA1OjQ3OjQ3UE0gKzA1MzAsIGtndW5kYUBjb2RlYXVyb3JhLm9yZyB3cm90
ZToKPj4gT24gMjAxOS0xMC0xNyAxNjo1OSwgRGFuaWVsIFRob21wc29uIHdyb3RlOgo+PiA+IE9u
IFdlZCwgT2N0IDE2LCAyMDE5IGF0IDAzOjQzOjQ2UE0gKzA1MzAsIEtpcmFuIEd1bmRhIHdyb3Rl
Ogo+PiA+ID4gVGhlIGF1dG8gc3RyaW5nIGRldGVjdGlvbiBhbGdvcml0aG0gY2hlY2tzIGlmIHRo
ZSBjdXJyZW50IFdMRUQKPj4gPiA+IHNpbmsgY29uZmlndXJhdGlvbiBpcyB2YWxpZC4gSXQgdHJp
ZXMgZW5hYmxpbmcgZXZlcnkgc2luayBhbmQKPj4gPiA+IGNoZWNrcyBpZiB0aGUgT1ZQIGZhdWx0
IGlzIG9ic2VydmVkLiBCYXNlZCBvbiB0aGlzIGluZm9ybWF0aW9uCj4+ID4gPiBpdCBkZXRlY3Rz
IGFuZCBlbmFibGVzIHRoZSB2YWxpZCBzaW5rIGNvbmZpZ3VyYXRpb24uCj4+ID4gPiBBdXRvIGNh
bGlicmF0aW9uIHdpbGwgYmUgdHJpZ2dlcmVkIHdoZW4gdGhlIE9WUCBmYXVsdCBpbnRlcnJ1cHRz
Cj4+ID4gPiBhcmUgc2VlbiBmcmVxdWVudGx5IHRoZXJlYnkgaXQgdHJpZXMgdG8gZml4IHRoZSBz
aW5rIGNvbmZpZ3VyYXRpb24uCj4+ID4gPgo+PiA+ID4gVGhlIGF1dG8tZGV0ZWN0aW9uIGFsc28g
a2lja3MgaW4gd2hlbiB0aGUgY29ubmVjdGVkIExFRCBzdHJpbmcKPj4gPiA+IG9mIHRoZSBkaXNw
bGF5LWJhY2tsaWdodCBtYWxmdW5jdGlvbnMgKGJlY2F1c2Ugb2YgZGFtYWdlKSBhbmQKPj4gPiA+
IHJlcXVpcmVzIHRoZSBkYW1hZ2VkIHN0cmluZyB0byBiZSB0dXJuZWQgb2ZmIHRvIHByZXZlbnQg
dGhlCj4+ID4gPiBjb21wbGV0ZSBwYW5lbCBhbmQvb3IgYm9hcmQgZnJvbSBiZWluZyBkYW1hZ2Vk
Lgo+PiA+ID4KPj4gPiA+IFNpZ25lZC1vZmYtYnk6IEtpcmFuIEd1bmRhIDxrZ3VuZGFAY29kZWF1
cm9yYS5vcmc+Cj4+ID4KPj4gPiBJdCdzIGEgY29tcGxleCBiaXQgb2YgY29kZSBidXQgSSdtIE9L
IHdpdGggaXQgaW4gcHJpbmNpcGxlLiBFdmVyeXRoaW5nCj4+ID4gYmVsb3cgaXMgYWJvdXQgc21h
bGwgZGV0YWlscyBhbmQvb3Igbml0cGlja2luZy4KPj4gPgo+PiA+Cj4+ID4gPiArc3RhdGljIHZv
aWQgd2xlZF9vdnBfd29yayhzdHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmspCj4+ID4gPiArewo+PiA+
ID4gKwlzdHJ1Y3Qgd2xlZCAqd2xlZCA9IGNvbnRhaW5lcl9vZih3b3JrLAo+PiA+ID4gKwkJCQkJ
IHN0cnVjdCB3bGVkLCBvdnBfd29yay53b3JrKTsKPj4gPiA+ICsJZW5hYmxlX2lycSh3bGVkLT5v
dnBfaXJxKTsKPj4gPiA+ICt9Cj4+ID4gPiArCj4+ID4KPj4gPiBBIGJpdCBvZiBjb21tZW50aW5n
IGFib3V0IHdoeSB3ZSBoYXZlIHRvIHdhaXQgMTBtcyBiZWZvcmUgZW5hYmxpbmcgdGhlCj4+ID4g
T1ZQIGludGVycnVwdCB3b3VsZCBiZSBhcHByZWNpYXRlZC4KPj4gPgo+PiA+Cj4+IFN1cmUuIFdp
bGwgYWRkIHRoZSBjb21tZW50IGluIHRoZSBuZXh0IHNlcmllcy4KPj4gPiA+ICtzdGF0aWMgaXJx
cmV0dXJuX3Qgd2xlZF9vdnBfaXJxX2hhbmRsZXIoaW50IGlycSwgdm9pZCAqX3dsZWQpCj4+ID4g
PiArewo+PiA+ID4gKwlzdHJ1Y3Qgd2xlZCAqd2xlZCA9IF93bGVkOwo+PiA+ID4gKwlpbnQgcmM7
Cj4+ID4gPiArCXUzMiBpbnRfc3RzLCBmYXVsdF9zdHM7Cj4+ID4gPiArCj4+ID4gPiArCXJjID0g
cmVnbWFwX3JlYWQod2xlZC0+cmVnbWFwLAo+PiA+ID4gKwkJCSB3bGVkLT5jdHJsX2FkZHIgKyBX
TEVEM19DVFJMX1JFR19JTlRfUlRfU1RTLCAmaW50X3N0cyk7Cj4+ID4gPiArCWlmIChyYyA8IDAp
IHsKPj4gPiA+ICsJCWRldl9lcnIod2xlZC0+ZGV2LCAiRXJyb3IgaW4gcmVhZGluZyBXTEVEM19J
TlRfUlRfU1RTIHJjPSVkXG4iLAo+PiA+ID4gKwkJCXJjKTsKPj4gPiA+ICsJCXJldHVybiBJUlFf
SEFORExFRDsKPj4gPiA+ICsJfQo+PiA+ID4gKwo+PiA+ID4gKwlyYyA9IHJlZ21hcF9yZWFkKHds
ZWQtPnJlZ21hcCwgd2xlZC0+Y3RybF9hZGRyICsKPj4gPiA+ICsJCQkgV0xFRDNfQ1RSTF9SRUdf
RkFVTFRfU1RBVFVTLCAmZmF1bHRfc3RzKTsKPj4gPiA+ICsJaWYgKHJjIDwgMCkgewo+PiA+ID4g
KwkJZGV2X2Vycih3bGVkLT5kZXYsICJFcnJvciBpbiByZWFkaW5nIFdMRURfRkFVTFRfU1RBVFVT
IHJjPSVkXG4iLAo+PiA+ID4gKwkJCXJjKTsKPj4gPiA+ICsJCXJldHVybiBJUlFfSEFORExFRDsK
Pj4gPiA+ICsJfQo+PiA+ID4gKwo+PiA+ID4gKwlpZiAoZmF1bHRfc3RzICYKPj4gPiA+ICsJCShX
TEVEM19DVFJMX1JFR19PVlBfRkFVTFRfQklUIHwgV0xFRDNfQ1RSTF9SRUdfSUxJTV9GQVVMVF9C
SVQpKQo+PiA+ID4gKwkJZGV2X2RiZyh3bGVkLT5kZXYsICJXTEVEIE9WUCBmYXVsdCBkZXRlY3Rl
ZCwgaW50X3N0cz0leAo+PiA+ID4gZmF1bHRfc3RzPSAleFxuIiwKPj4gPiA+ICsJCQlpbnRfc3Rz
LCBmYXVsdF9zdHMpOwo+PiA+ID4gKwo+PiA+ID4gKwlpZiAoZmF1bHRfc3RzICYgV0xFRDNfQ1RS
TF9SRUdfT1ZQX0ZBVUxUX0JJVCkgewo+PiA+ID4gKwkJbXV0ZXhfbG9jaygmd2xlZC0+bG9jayk7
Cj4+ID4gPiArCQlkaXNhYmxlX2lycV9ub3N5bmMod2xlZC0+b3ZwX2lycSk7Cj4+ID4KPj4gPiBX
ZSdyZSBjdXJyZW50bHkgcnVubmluZyB0aGUgdGhyZWFkZWQgSVNSIGZvciB0aGlzIGlycS4gRG8g
d2UgcmVhbGx5IG5lZWQKPj4gPiB0byBkaXNhYmxlIGl0Pwo+PiA+Cj4+IFdlIG5lZWQgdG8gZGlz
YWJsZSB0aGlzIElSUSwgZHVyaW5nIHRoZSBhdXRvIHN0cmluZyBkZXRlY3Rpb24gbG9naWMuIAo+
PiBCZWNhdXNlCj4+IGluIHRoZSBhdXRvIHN0cmluZyBkZXRlY3Rpb24gd2UgY29uZmlndXJlIHRo
ZSBjdXJyZW50IHNpbmtzIG9uZSBieSBvbmUgCj4+IGFuZAo+PiBjaGVjayB0aGUKPj4gc3RhdHVz
IHJlZ2lzdGVyIGZvciB0aGUgT1ZQcyBhbmQgc2V0IHRoZSByaWdodCBzdHJpbmcgY29uZmlndXJh
dGlvbi4gCj4+IFdlCj4+IGVuYWJsZSBpdCBsYXRlciBhZnRlcgo+PiB0aGUgYXV0byBzdHJpbmcg
ZGV0ZWN0aW9uIGlzIGNvbXBsZXRlZC4KPiAKPiBUaGlzIGlzIGEgdGhyZWFkZWQgb25lc2hvdCBp
bnRlcnJ1cHQgaGFuZGxlci4gV2h5IGlzbid0IHRoZSBmcmFtZXdvcmsKPiBtYXNraW5nIHN1ZmZp
Y2llbnQgZm9yIHlvdSBoZXJlPwo+IAo+IAo+IERhbmllbC4KUmlnaHQgLi4gSSBvdmVybG9va2Vk
IHRoYXQgaXQgaXMgYSBvbmVzaG90IGludGVycnVwdCBlYXJsaWVyLgpJIHdpbGwgYWRkcmVzcyBp
dCBpbiB0aGUgbmV4dCBzZXJpZXMuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
