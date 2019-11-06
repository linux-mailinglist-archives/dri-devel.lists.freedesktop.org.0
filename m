Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DEF4F0C35
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2019 03:47:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9513B6EBCD;
	Wed,  6 Nov 2019 02:47:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DB516E111;
 Wed,  6 Nov 2019 02:47:29 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id v8so16722971lfa.12;
 Tue, 05 Nov 2019 18:47:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=F8ueg/vXU/GTQVDaSiUMtP/tJci7JGnmTXswjH4PsB8=;
 b=gEHr6xXH95dPxtbnYfJXSLE+9cDXf13b0Oo6lT4YEjPCjd2N0D4OXsNBsyNLTnVB1a
 u5awxtjmW9Z55yg9rHoUz1QHOI2CmHCB7dCnA4a0hV4RCzqK35It2/KwEZHzF9tlZuYd
 oajG1qAJ1xZ0cr8cuwf/CMzSl/25n8QcstQAmys3D2BNRfy7KtkgRa1q0UVUWz9S9Kpm
 JFxDPppWSYlbIJt4mubyi1yUmHqcn6XEuOXW4feWeYv40cMj13Wd/5Ah9/n6UYM3b2EI
 QYyYjaCODTIlSeXTdJq238APl8JMK/wHBdETxNsFrfPlrVps82vqjRdcjL10aLw9YOOl
 oKhg==
X-Gm-Message-State: APjAAAUTmxUFVWuX9lg/T1GAYC5GUoatdTxyiyqDOotCbVEONT4kRbPX
 kZRJtO71/3d5Lq+X1l0h6hE7nNrsOaCJ76LnebE=
X-Google-Smtp-Source: APXvYqyu8NzukPH/iGmZcYG1f70Zwc4biWBTvXZMtxZlt4q7pbVjAidvBonpBRHZ8vOSGW6dElrIg/unXBmO/y7VJ1U=
X-Received: by 2002:ac2:523c:: with SMTP id i28mr22152605lfl.165.1573008447511; 
 Tue, 05 Nov 2019 18:47:27 -0800 (PST)
MIME-Version: 1.0
References: <20191031214839.27039-1-manasi.d.navare@intel.com>
In-Reply-To: <20191031214839.27039-1-manasi.d.navare@intel.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 6 Nov 2019 12:47:16 +1000
Message-ID: <CAPM=9tzxUj7zHHJgj_PCJ9pOavO2rz6YVPFbJfWBGgMnb9ykKg@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH] drm/fbdev: Fallback to non tiled mode if all
 tiles not present
To: Manasi Navare <manasi.d.navare@intel.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=F8ueg/vXU/GTQVDaSiUMtP/tJci7JGnmTXswjH4PsB8=;
 b=aH5EBbAMRFBFgYF5ofSpgP1gFuFLBP+76RjfCWhHm2PHE6mqlZC9kfnvbb9jnP1wxO
 wAL22QFGJKC5mtFcHdDSDuCOGdeiFiy+tp4Q2ANowzS2+Q1hImk6k/C6vfZZHJOGrRbo
 Y9cV5/5kLhcTvOPKsKlpI2En91XK9b5EZuu6QmJna/DDCf6Wrp0JI3NtJ7Ocsfk9jq7w
 FiGGOa4SUmjbyTc9k393cDlLAaX7lKlGvv7oQWHe+L2RAgZ4/Va7ycxZCpxe84rSQUu+
 YiGRfuDnOoluuQ5FLi6ZpdAefa9VaZ7wyDpuZcacZU5M8rAv8rYTQn0TRbW/n2JKWUdi
 wgzQ==
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
Cc: Dave Airlie <airlied@redhat.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAxIE5vdiAyMDE5IGF0IDA3OjQ2LCBNYW5hc2kgTmF2YXJlIDxtYW5hc2kuZC5uYXZh
cmVAaW50ZWwuY29tPiB3cm90ZToKPgo+IEluIGNhc2Ugb2YgdGlsZWQgZGlzcGxheXMsIGlmIHdl
IGhvdHBsdWcganVzdCBvbmUgY29ubmVjdG9yLAo+IGZiY29uIGN1cnJlbnRseSBqdXN0IHNlbGVj
dHMgdGhlIHByZWZlcnJlZCBtb2RlIGFuZCBpZiBpdCBpcwo+IHRpbGVkIG1vZGUgdGhlbiB0aGF0
IGJlY29tZXMgYSBwcm9ibGVtIGlmIHJlc3Qgb2YgdGhlIHRpbGVzIGFyZQo+IG5vdCBwcmVzZW50
Lgo+IFNvIGluIHRoZSBmYmRldiBkcml2ZXIgb24gaG90cGx1ZyB3aGVuIHdlIHByb2JlIHRoZSBj
bGllbnQgbW9kZXNldCwKPiB3ZSB3ZSBkb250IGZpbmQgYWxsIHRoZSBjb25uZWN0b3JzIGZvciBh
bGwgdGlsZXMsIHRoZW4gb24gYSBjb25uZWN0b3IKPiB3aXRoIG9uZSB0aWxlLCBqdXN0IGZhbGxi
YWNrIHRvIHRoZSBmaXJzdCBhdmFpbGFibGUgbm9uIHRpbGVkIG1vZGUKPiB0byBkaXNwbGF5IG92
ZXIgYSBzaW5nbGUgY29ubmVjdG9yLgo+Cj4gU3VnZ2VzdGVkLWJ5OiBWaWxsZSBTeXJqw6Rsw6Qg
PHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgo+IFN1Z2dlc3RlZC1ieTogRGF2ZSBBaXJs
aWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4KPiBDYzogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJq
YWxhQGxpbnV4LmludGVsLmNvbT4KPiBDYzogRGF2ZSBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0LmNv
bT4KPiBTaWduZWQtb2ZmLWJ5OiBNYW5hc2kgTmF2YXJlIDxtYW5hc2kuZC5uYXZhcmVAaW50ZWwu
Y29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2NsaWVudF9tb2Rlc2V0LmMgfCAyOSAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAyOSBpbnNlcnRp
b25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9jbGllbnRfbW9kZXNl
dC5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9jbGllbnRfbW9kZXNldC5jCj4gaW5kZXggODk1Yjcz
ZjIzMDc5Li5lMjhhNzIzNTg3ZGIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9j
bGllbnRfbW9kZXNldC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9jbGllbnRfbW9kZXNl
dC5jCj4gQEAgLTExNCw2ICsxMTQsMjAgQEAgZHJtX2NsaWVudF9maW5kX21vZGVzZXQoc3RydWN0
IGRybV9jbGllbnRfZGV2ICpjbGllbnQsIHN0cnVjdCBkcm1fY3J0YyAqY3J0YykKPiAgICAgICAg
IHJldHVybiBOVUxMOwo+ICB9Cj4KPiArc3RhdGljIHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICoK
PiArZHJtX2Nvbm5lY3Rvcl9mYWxsYmFja19ub25fdGlsZWRfbW9kZShzdHJ1Y3QgZHJtX2Nvbm5l
Y3RvciAqY29ubmVjdG9yKQo+ICt7Cj4gKyAgICAgICBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAq
bW9kZTsKPiArCj4gKyAgICAgICBsaXN0X2Zvcl9lYWNoX2VudHJ5KG1vZGUsICZjb25uZWN0b3It
Pm1vZGVzLCBoZWFkKSB7Cj4gKyAgICAgICAgICAgICAgIGlmIChtb2RlLT5oZGlzcGxheSA9PSBj
b25uZWN0b3ItPnRpbGVfaF9zaXplICYmCj4gKyAgICAgICAgICAgICAgICAgICBtb2RlLT52ZGlz
cGxheSA9PSBjb25uZWN0b3ItPnRpbGVfdl9zaXplKQo+ICsgICAgICAgICAgICAgICAgICAgICAg
IGNvbnRpbnVlOwo+ICsgICAgICAgICAgICAgICByZXR1cm4gbW9kZTsKPiArICAgICAgIH0KPiAr
ICAgICAgIHJldHVybiBOVUxMOwo+ICt9Cj4gKwo+ICBzdGF0aWMgc3RydWN0IGRybV9kaXNwbGF5
X21vZGUgKgo+ICBkcm1fY29ubmVjdG9yX2hhc19wcmVmZXJyZWRfbW9kZShzdHJ1Y3QgZHJtX2Nv
bm5lY3RvciAqY29ubmVjdG9yLCBpbnQgd2lkdGgsIGludCBoZWlnaHQpCj4gIHsKPiBAQCAtMzQ4
LDggKzM2MiwxNyBAQCBzdGF0aWMgYm9vbCBkcm1fY2xpZW50X3RhcmdldF9wcmVmZXJyZWQoc3Ry
dWN0IGRybV9jb25uZWN0b3IgKipjb25uZWN0b3JzLAo+ICAgICAgICAgc3RydWN0IGRybV9jb25u
ZWN0b3IgKmNvbm5lY3RvcjsKPiAgICAgICAgIHU2NCBjb25uX2NvbmZpZ3VyZWQgPSAwOwo+ICAg
ICAgICAgaW50IHRpbGVfcGFzcyA9IDA7Cj4gKyAgICAgICBpbnQgbnVtX3RpbGVkX2Nvbm5zID0g
MDsKPiAgICAgICAgIGludCBpOwo+Cj4gKyAgICAgICBmb3IgKGkgPSAwOyBpIDwgY29ubmVjdG9y
X2NvdW50OyBpKyspIHsKPiArICAgICAgICAgICAgICAgY29ubmVjdG9yID0gY29ubmVjdG9yc1tp
XTsKPiArICAgICAgICAgICAgICAgaWYgKCFjb25uZWN0b3ItPmhhc190aWxlKQo+ICsgICAgICAg
ICAgICAgICAgICAgICAgIGNvbnRpbnVlOwo+ICsKPiArICAgICAgICAgICAgICAgbnVtX3RpbGVk
X2Nvbm5zICsrOwoKRHJvcCB0aGUgc3BhY2UgYmVmb3JlIHRoZSArKyBoZXJlLiBNYXliZSBqdXN0
IG1ha2UgdGhpcwoKaWYgKGNvbm5lY3RvcnNbaV0tPmhhc190aWxlKQogICAgICAgIG51bV90aWxl
ZF9jb25ucysrOwoKUmV2aWV3ZWQtYnk6IERhdmUgQWlybGllIDxhaXJsaWVkQHJlZGhhdC5jb20+
CgpPdGhlcndpc2UgSSB0aGluayB0aGlzIHNlZW1zIGZpbmUsIHRob3VnaCBpdCBkb2VzIGJlZyB0
aGUgcXVlc3Rpb24gaW4KbXkgbWluZCBvZiB3aGF0IGhhcHBlbnMgaWYgSSBnZXQgMiA4SyBtb25p
dG9ycywgYW5kIHBsdWcgdGhlIGZpcnN0CnRpbGUgb2Ygb25lIGluLCBhbmQgdGhlIHNlY29uZCB0
aWxlIG9mIHRoZSBvdGhlciBpbi4KCkRhdmUuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
