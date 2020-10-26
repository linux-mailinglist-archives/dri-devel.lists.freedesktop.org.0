Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3170029890C
	for <lists+dri-devel@lfdr.de>; Mon, 26 Oct 2020 10:05:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EC106E97B;
	Mon, 26 Oct 2020 09:05:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5729A6E97B
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Oct 2020 09:05:29 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id z23so4561348oic.1
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Oct 2020 02:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=kHueAMBDf0gyQkCVPomHF5wm/d+u7/ksxlPoMaZ+Ugo=;
 b=ZhLa9XvVG3KOAhzz7NK0k3ciwlxNADezXgRq1Ocz+G+ljTd4Ow9T+t99RcsqgVonfk
 1MMqSGv1lUWKhlOQVF1J4Xu7pX6L4nXpLuakU8MTu0TBesi0S0+trgGO3L7wPymcMJOg
 h4d9SgBOlpaYPThmD9E0fDcCR0Y+k6Pju4VrY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=kHueAMBDf0gyQkCVPomHF5wm/d+u7/ksxlPoMaZ+Ugo=;
 b=juiXi3u8UZBc0SdgX+kyzZ4nJ6cBoyBxDlqAKbc+XKVcSJqLdELUJqMA2NueS3JMyZ
 i7ggP/K4QDMYwVTtkxCidfoyWy694G4tva3US2zPawzP9oz5rpeu1uYZU+get+BP9aiq
 dYLncUAHk3LMlHp+9NvFAe7+Bljtp1leqbmQjRVqVLYnIzVjUYFc8R+VN/s8EPFCm1jn
 JyXUEel4s0cN8cRq0I+BSKKsPgQMxjuJhqkzbnPHVhoa7jrRo6agSg99tmCAnHTRip4w
 YS66nSfwMxzzQjfIj5VPVPoGxTpAC/t0TIaJNccGn5MsYoi4spmsZzBm17fYm2LTZJSX
 ekuA==
X-Gm-Message-State: AOAM5312FEKwaBv+7Jk4yUIu/RjwpVQBitfvcYxvhQAf1ORvVz/AwMxr
 APuJAGhrWSf3noOOGoVFfVGg+lKiQ8zFJIrjYnS2uQ==
X-Google-Smtp-Source: ABdhPJxo1hCX6QGedJWp6bwqXre5mJLYCXAJVmJ363fy1hzCTnAVgrPyWyGEOZhp0DgFYDtk6WwWk6xV7VlstfKVAh4=
X-Received: by 2002:aca:cc01:: with SMTP id c1mr11868923oig.128.1603703128667; 
 Mon, 26 Oct 2020 02:05:28 -0700 (PDT)
MIME-Version: 1.0
References: <96f62304bad202e4f920d2f4ed62c485@abrecht.li>
 <20201025155201.GA25070@bogon.m.sigxcpu.org>
In-Reply-To: <20201025155201.GA25070@bogon.m.sigxcpu.org>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 26 Oct 2020 10:05:17 +0100
Message-ID: <CAKMK7uEX38yzJGy6PWBs-L375kUGAPQK7SMPjT8Ze+3oKk38Mg@mail.gmail.com>
Subject: Re: [PATCH] Implement .format_mod_supported in mxsfb
To: =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>
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
Cc: Marek Vasut <marex@denx.de>, dl-linux-imx <linux-imx@nxp.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Sascha Hauer <kernel@pengutronix.de>,
 Daniel Abrecht <freedesktop-linux-dri-devel@danielabrecht.ch>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBPY3QgMjUsIDIwMjAgYXQgNDo1MiBQTSBHdWlkbyBHw7xudGhlciA8YWd4QHNpZ3hj
cHUub3JnPiB3cm90ZToKPgo+IEhpIERhbmllbCwKPiBPbiBTYXQsIE9jdCAyNCwgMjAyMCBhdCAw
NDo1OToxNlBNICswMDAwLCBEYW5pZWwgQWJyZWNodCB3cm90ZToKPiA+IFRoaXMgd2lsbCBtYWtl
IHN1cmUgYXBwbGljYXRpb25zIHdoaWNoIHVzZSB0aGUgSU5fRk9STUFUUyBibG9iCj4gPiB0byBm
aWd1cmUgb3V0IHdoaWNoIG1vZGlmaWVycyB0aGV5IGNhbiB1c2Ugd2lsbCBwaWNrIHVwIHRoZQo+
ID4gbGluZWFyIG1vZGlmaWVyIHdoaWNoIGlzIG5lZWRlZCBieSBteHNmYi4gU3VjaCBhcHBsaWNh
dGlvbnMKPiA+IHdpbGwgbm90IHdvcmsgb3RoZXJ3aXNlIGlmIGFuIGluY29tcGF0aWJsZSBpbXBs
aWNpdCBtb2RpZmllcgo+ID4gZW5kcyB1cCBiZWluZyBzZWxlY3RlZC4KPgo+IFNpbmNlIHRoaXMg
Z290IGJyb2tlbiBieSB0aGUgc3dpdGNoIGF3YXkgZm9yIHRoZSBzaW1wbGUgZGlzcGxheQo+IHBp
cGVsaW5lIGhlbHBlciAoYWUxZWQwMDkzMjgxOTM5YjgwNjY0YTY4NzY4OWYxMjQzNmMwZTg3NCkg
Y291bGQKPiB5b3UgYWRkIGEgZml4ZXMgdGFnPwoKbXhzZmIgaXMgYWxzbyBtaXNzaW5nIHNldHRp
bmcgdGhlIGFsbG93X2ZiX21vZGlmaWVycyBmbGFnLCB3aXRob3V0CndoaWNoIGFsbCB0aGlzIG1v
ZGlmaWVyIHN0dWZmIHdvbid0IHdvcmsgZ3JlYXQuIFBsZWFzZSBhZGQgdGhhdCB0b28uIEkKZ3Vl
c3Mgc29tZSBpZ3QgdGVzdGluZyBmb3IgdGhpcyBtaWdodCBiZSB1c2VmdWwgdG9vLCBidXQgbm90
IHN1cmUgd2UKY2FuIGRvIHRoYXQgd2l0aCBzdWZmaWNpZW50IGdlbmVyYWxpdHkuIEl0IHNob3Vs
ZCBmYWxsIG92ZXIgdGhvdWdoCnNpbmNlIGlmIHlvdSB0cnkgdG8gY3JlYXRlIGFuIGZiIHdpdGgg
bW9kaWZpZXJzIHlvdSdsbCBmYWlsLCBzbyBubwppZGVhIHdoYXQgdXNlcnNwYWNlIHlvdSBoYXZl
IGhlcmUuCi1EYW5pZWwKCj4gQ2hlZXJzLAo+ICAtLSBHdWlkbwo+Cj4gPgo+ID4gU2lnbmVkLW9m
Zi1ieTogRGFuaWVsIEFicmVjaHQgPHB1YmxpY0BkYW5pZWxhYnJlY2h0LmNoPgo+ID4gLS0tCj4g
PiAgZHJpdmVycy9ncHUvZHJtL214c2ZiL214c2ZiX2ttcy5jIHwgOCArKysrKysrKwo+ID4gIDEg
ZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL214c2ZiL214c2ZiX2ttcy5jCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9teHNmYi9t
eHNmYl9rbXMuYwo+ID4gaW5kZXggOTU2ZjYzMTk5N2YyLi5mYzRiMTYyNjI2MWIgMTAwNjQ0Cj4g
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXhzZmIvbXhzZmJfa21zLmMKPiA+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9teHNmYi9teHNmYl9rbXMuYwo+ID4gQEAgLTQ4NCw2ICs0ODQsMTMgQEAgc3Rh
dGljIHZvaWQgbXhzZmJfcGxhbmVfb3ZlcmxheV9hdG9taWNfdXBkYXRlKHN0cnVjdAo+ID4gZHJt
X3BsYW5lICpwbGFuZSwKPiA+ICAgICAgIHdyaXRlbChjdHJsLCBteHNmYi0+YmFzZSArIExDRENf
QVNfQ1RSTCk7Cj4gPiAgfQo+ID4KPiA+ICtzdGF0aWMgYm9vbCBteHNmYl9mb3JtYXRfbW9kX3N1
cHBvcnRlZChzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSwKPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB1aW50MzJfdCBmb3JtYXQsCj4gPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgdWludDY0X3QgbW9kaWZpZXIpCj4gPiArewo+ID4gKyAgICAgcmV0
dXJuIG1vZGlmaWVyID09IERSTV9GT1JNQVRfTU9EX0xJTkVBUjsKPiA+ICt9Cj4gPiArCj4gPiAg
c3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fcGxhbmVfaGVscGVyX2Z1bmNzIG14c2ZiX3BsYW5lX3By
aW1hcnlfaGVscGVyX2Z1bmNzCj4gPiA9IHsKPiA+ICAgICAgIC5hdG9taWNfY2hlY2sgPSBteHNm
Yl9wbGFuZV9hdG9taWNfY2hlY2ssCj4gPiAgICAgICAuYXRvbWljX3VwZGF0ZSA9IG14c2ZiX3Bs
YW5lX3ByaW1hcnlfYXRvbWljX3VwZGF0ZSwKPiA+IEBAIC00OTUsNiArNTAyLDcgQEAgc3RhdGlj
IGNvbnN0IHN0cnVjdCBkcm1fcGxhbmVfaGVscGVyX2Z1bmNzCj4gPiBteHNmYl9wbGFuZV9vdmVy
bGF5X2hlbHBlcl9mdW5jcyA9IHsKPiA+ICB9Owo+ID4KPiA+ICBzdGF0aWMgY29uc3Qgc3RydWN0
IGRybV9wbGFuZV9mdW5jcyBteHNmYl9wbGFuZV9mdW5jcyA9IHsKPiA+ICsgICAgIC5mb3JtYXRf
bW9kX3N1cHBvcnRlZCAgID0gbXhzZmJfZm9ybWF0X21vZF9zdXBwb3J0ZWQsCj4gPiAgICAgICAu
dXBkYXRlX3BsYW5lICAgICAgICAgICA9IGRybV9hdG9taWNfaGVscGVyX3VwZGF0ZV9wbGFuZSwK
PiA+ICAgICAgIC5kaXNhYmxlX3BsYW5lICAgICAgICAgID0gZHJtX2F0b21pY19oZWxwZXJfZGlz
YWJsZV9wbGFuZSwKPiA+ICAgICAgIC5kZXN0cm95ICAgICAgICAgICAgICAgID0gZHJtX3BsYW5l
X2NsZWFudXAsCj4gPiAtLQo+ID4gMi4yMC4xCj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwo+ID4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+ID4gZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+ID4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKPiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKCgoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdh
cmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
