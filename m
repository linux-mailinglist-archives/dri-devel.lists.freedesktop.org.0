Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBD02A5080
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 20:53:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA8E96ECEC;
	Tue,  3 Nov 2020 19:53:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com
 [209.85.217.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0848B6EEAB
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 19:53:17 +0000 (UTC)
Received: by mail-vs1-f65.google.com with SMTP id z123so5440553vsb.0
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Nov 2020 11:53:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=LPtP+9CQKIJmcik5TfvwygpKuN/Q0uAwXqya4YloAdw=;
 b=B2boycV34De30iPEHxBaMREuePF0NGLgLrE7+aoKHEZz0ipSRa5uZuiWpXd0+o+uHH
 R4chg/JtFm8GVCGqaICpLPVzGjQ7ow/IvXj7JFJCx2KfwqRlWVaeZr308mJU4kva/4Eh
 zXTrVtpg5LBc4NAguKESSLI5qydOsbKfx/PTpKPbcEokDAk6kSqdJZRFydEFjc4KMfZK
 ngA4MpLVnfNVeQNRjCTT1TMNSYQ5NoI1hiKVV50Fw/j9rQRJuPDmUyzEWyPdaCKVu+Mv
 Y6sdzfxDgEuK4NoPOdQVInHRKasfNNAIvXD9PW9GbR8AnetmhwgBWYJjqDG/kWxDyV+o
 PM4Q==
X-Gm-Message-State: AOAM530dayq8DsHK9ppobleklz8isl/7j+c2op9ALAED3ZquwjlL9Nq5
 wdfeaK+qfVQ4bHw+YmePgEbB8xPGXrRR1qwmGXM=
X-Google-Smtp-Source: ABdhPJx4YmOziGVtLAIcDjvkVsd2iI7cO9OJ9Fc3RUpf8kGA3o8WVbldKHp0pQbO701GqFnl14XHag7m54w7qsSERqk=
X-Received: by 2002:a67:f699:: with SMTP id n25mr19488936vso.52.1604433196168; 
 Tue, 03 Nov 2020 11:53:16 -0800 (PST)
MIME-Version: 1.0
References: <20201022165450.682571-1-lyude@redhat.com>
 <CAKb7UvhfWA6ijoQnq2Mvrx8jfn57EC-P5KBkYR3HmrBUrntJhg@mail.gmail.com>
 <8d15a513bd38a01b3607e5c75b5754cc599fe33c.camel@redhat.com>
In-Reply-To: <8d15a513bd38a01b3607e5c75b5754cc599fe33c.camel@redhat.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Tue, 3 Nov 2020 14:53:05 -0500
Message-ID: <CAKb7UvjJHMbDEAYJRCCdQ=LZfpogb4Z6y+yYFgPYKvbE1mM1ig@mail.gmail.com>
Subject: Re: [PATCH] drm/edid: Fix uninitialized variable in drm_cvt_modes()
To: Lyude <lyude@redhat.com>
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
Cc: Kees Cook <keescook@chromium.org>, Leon Romanovsky <leon@kernel.org>,
 David Airlie <airlied@linux.ie>, Chao Yu <chao@kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 "# 3.9+" <stable@vger.kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Kalle Valo <kvalo@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgMywgMjAyMCBhdCAyOjQ3IFBNIEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5j
b20+IHdyb3RlOgo+Cj4gU29ycnkhIFRob3VnaHQgSSBoYWQgcmVzcG9uZGVkIHRvIHRoaXMgYnV0
IGFwcGFyZW50bHkgbm90LCBjb21tZW50cyBkb3duIGJlbG93Cj4KPiBPbiBUaHUsIDIwMjAtMTAt
MjIgYXQgMTQ6MDQgLTA0MDAsIElsaWEgTWlya2luIHdyb3RlOgo+ID4gT24gVGh1LCBPY3QgMjIs
IDIwMjAgYXQgMTI6NTUgUE0gTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4gd3JvdGU6Cj4g
PiA+Cj4gPiA+IE5vdGljZWQgdGhpcyB3aGVuIHRyeWluZyB0byBjb21waWxlIHdpdGggLVdhbGwg
b24gYSBrZXJuZWwgZm9yay4gV2UKPiA+ID4gcG90ZW50aWFsbHkKPiA+ID4gZG9uJ3Qgc2V0IHdp
ZHRoIGhlcmUsIHdoaWNoIGNhdXNlcyB0aGUgY29tcGlsZXIgdG8gY29tcGxhaW4gYWJvdXQgd2lk
dGgKPiA+ID4gcG90ZW50aWFsbHkgYmVpbmcgdW5pbml0aWFsaXplZCBpbiBkcm1fY3Z0X21vZGVz
KCkuIFNvLCBsZXQncyBmaXggdGhhdC4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogTHl1ZGUg
UGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KPiA+ID4KPiA+ID4gQ2M6IDxzdGFibGVAdmdlci5rZXJu
ZWwub3JnPiAjIHY1LjkrCj4gPiA+IEZpeGVzOiAzZjY0OWFiNzI4Y2QgKCJ0cmVld2lkZTogUmVt
b3ZlIHVuaW5pdGlhbGl6ZWRfdmFyKCkgdXNhZ2UiKQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBMeXVk
ZSBQYXVsIDxseXVkZUByZWRoYXQuY29tPgo+ID4gPiAtLS0KPiA+ID4gIGRyaXZlcnMvZ3B1L2Ry
bS9kcm1fZWRpZC5jIHwgOCArKysrKysrLQo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2RybV9lZGlkLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYwo+ID4gPiBpbmRl
eCA2MzExMjViNDZlMDQuLjJkYTE1OGZmZWQ4ZSAxMDA2NDQKPiA+ID4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2RybV9lZGlkLmMKPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMK
PiA+ID4gQEAgLTMwOTQsNiArMzA5NCw3IEBAIHN0YXRpYyBpbnQgZHJtX2N2dF9tb2RlcyhzdHJ1
Y3QgZHJtX2Nvbm5lY3Rvcgo+ID4gPiAqY29ubmVjdG9yLAo+ID4gPgo+ID4gPiAgICAgICAgIGZv
ciAoaSA9IDA7IGkgPCA0OyBpKyspIHsKPiA+ID4gICAgICAgICAgICAgICAgIGludCB3aWR0aCwg
aGVpZ2h0Owo+ID4gPiArICAgICAgICAgICAgICAgdTggY3Z0X2FzcGVjdF9yYXRpbzsKPiA+ID4K
PiA+ID4gICAgICAgICAgICAgICAgIGN2dCA9ICYodGltaW5nLT5kYXRhLm90aGVyX2RhdGEuZGF0
YS5jdnRbaV0pOwo+ID4gPgo+ID4gPiBAQCAtMzEwMSw3ICszMTAyLDggQEAgc3RhdGljIGludCBk
cm1fY3Z0X21vZGVzKHN0cnVjdCBkcm1fY29ubmVjdG9yCj4gPiA+ICpjb25uZWN0b3IsCj4gPiA+
ICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlOwo+ID4gPgo+ID4gPiAgICAgICAgICAg
ICAgICAgaGVpZ2h0ID0gKGN2dC0+Y29kZVswXSArICgoY3Z0LT5jb2RlWzFdICYgMHhmMCkgPDwg
NCkgKyAxKSAqCj4gPiA+IDI7Cj4gPiA+IC0gICAgICAgICAgICAgICBzd2l0Y2ggKGN2dC0+Y29k
ZVsxXSAmIDB4MGMpIHsKPiA+ID4gKyAgICAgICAgICAgICAgIGN2dF9hc3BlY3RfcmF0aW8gPSBj
dnQtPmNvZGVbMV0gJiAweDBjOwo+ID4gPiArICAgICAgICAgICAgICAgc3dpdGNoIChjdnRfYXNw
ZWN0X3JhdGlvKSB7Cj4gPiA+ICAgICAgICAgICAgICAgICBjYXNlIDB4MDA6Cj4gPiA+ICAgICAg
ICAgICAgICAgICAgICAgICAgIHdpZHRoID0gaGVpZ2h0ICogNCAvIDM7Cj4gPiA+ICAgICAgICAg
ICAgICAgICAgICAgICAgIGJyZWFrOwo+ID4gPiBAQCAtMzExNCw2ICszMTE2LDEwIEBAIHN0YXRp
YyBpbnQgZHJtX2N2dF9tb2RlcyhzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcgo+ID4gPiAqY29ubmVjdG9y
LAo+ID4gPiAgICAgICAgICAgICAgICAgY2FzZSAweDBjOgo+ID4gPiAgICAgICAgICAgICAgICAg
ICAgICAgICB3aWR0aCA9IGhlaWdodCAqIDE1IC8gOTsKPiA+ID4gICAgICAgICAgICAgICAgICAg
ICAgICAgYnJlYWs7Cj4gPiA+ICsgICAgICAgICAgICAgICBkZWZhdWx0Ogo+ID4KPiA+IFdoYXQg
dmFsdWUgd291bGQgY3Z0LT5jb2RlWzFdIGhhdmUgc3VjaCB0aGF0IHRoaXMgZ2V0cyBoaXQ/Cj4g
Pgo+ID4gT3IgaXMgdGhpcyBhICJjb21waWxlciBpcyBicm9rZW4sIHNvIGxldCdzIGFkZCBtb3Jl
IGNvZGUiIHNpdHVhdGlvbj8KPiA+IElmIHNvLCBwZXJoYXBzIHRoZSBjb2RlIGFkZGVkIGNvdWxk
IGp1c3QgYmUgZW5vdWdoIHRvIHNpbGVuY2UgdGhlCj4gPiBjb21waWxlciAodW5yZWFjaGFibGUs
IGV0Yyk/Cj4KPiBJIG1lYW4sIHRoaXMgaW5mb3JtYXRpb24gY29tZXMgZnJvbSB0aGUgRURJRCB3
aGljaCBpbmhlcmVudGx5IG1lYW5zIGl0J3MgY29taW5nCj4gZnJvbSBhbiB1bnRydXN0ZWQgc291
cmNlIHNvIHRoZSB2YWx1ZSBjb3VsZCBiZSBsaXRlcmFsbHkgYW55dGhpbmcgYXMgbG9uZyBhcyB0
aGUKPiBFRElEIGhhcyBhIHZhbGlkIGNoZWNrc3VtLiBOb3RlIChhc3N1bWluZyBJJ20gdW5kZXJz
dGFuZGluZyB0aGlzIGNvZGUKPiBjb3JyZWN0bHkpOgo+Cj4gZHJtX2FkZF9lZGlkX21vZGVzKCkg
4oaSIGFkZF9jdnRfbW9kZXMoKSDihpIgZHJtX2Zvcl9lYWNoX2RldGFpbGVkX2Jsb2NrKCkg4oaS
Cj4gZG9fY3Z0X21vZGUoKSDihpIgZHJtX2N2dF9tb2RlcygpCj4KPiBTbyBhZmFpY3QgdGhpcyBp
c24ndCBhIGJyb2tlbiBjb21waWxlciBidXQgYSBsZWdpdGltYXRlIHVuaW5pdGlhbGl6ZWQgdmFy
aWFibGUuCgpUaGUgdmFsdWUgY2FuIGJlIGFueXRoaW5nLCBidXQgaXQgaGFzIHRvIGJlIHNvbWV0
aGluZy4gVGhlIHN3aXRjaCBpcwpvbiAidW5rbm93biAmIDB4MGMiLCBzbyBvbmx5IDQgY2FzZXMg
YXJlIHBvc3NpYmxlLCB3aGljaCBhcmUKZW51bWVyYXRlZCBpbiB0aGUgc3dpdGNoLgoKICAtaWxp
YQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
