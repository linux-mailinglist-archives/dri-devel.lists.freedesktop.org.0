Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 445B98D676
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2019 16:46:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5059E89CC4;
	Wed, 14 Aug 2019 14:46:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC7DD89CC4
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 14:46:11 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id z11so9419194wrt.4
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 07:46:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=RZ9MbKBjKXb7iIKtVB/tWj9mxwXvCyRq6iVWKlfTB1I=;
 b=FVFxFgqjdrpmtPt0A0dfl454efTbDPl8lYYI2QrBA7TJUVwg+Go/4dKHzqxaMPNMHq
 PeAHSup0BX1syA2hOFLXeCyP+mm6swmaV19JwGN2viR6NY7F9OipHJ50PA51U1BtJZfc
 lCcY+BRjwXKqlKnFv0nqrhF7h1/Nj/XN+unvI6+PYd+oQl7cPFUXTWUaqRM7dlWfei/5
 KQ1lBW1/rTCnpMRDDGiYNuLNzR+cS7NvB8qx31/R4FYqMY5GWpHoJnug96psa2EjhUHb
 V5ar1OXm8MvbnMYCubaTgd7QJiHFlcfFtOxPwwX5OHooTO9J5slgoCqqpNwEwCJvwDD7
 b1Hg==
X-Gm-Message-State: APjAAAX1hVbp0h2J78KcWr8QEWg8SS/Cz8jGB6poeAmOFrbuePX1EZzi
 CcTz8oIZelzUY8GQqfmx/FPtOQ==
X-Google-Smtp-Source: APXvYqwazZFY70ioUsjFttLt5TL4D6ggiqgiQj9/JbjqN8ER/sNJMCKgouRA7gbKTx7MPxVkp8KddQ==
X-Received: by 2002:adf:e444:: with SMTP id t4mr50315wrm.262.1565793970098;
 Wed, 14 Aug 2019 07:46:10 -0700 (PDT)
Received: from [192.168.1.62] (176-150-251-154.abo.bbox.fr. [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id 39sm16965wrc.45.2019.08.14.07.46.08
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 14 Aug 2019 07:46:09 -0700 (PDT)
Subject: Re: [PATCH] drm/bridge: dumb-vga-dac: Fix dereferencing -ENODEV DDC
 channel
To: Guenter Roeck <linux@roeck-us.net>
References: <20190813093046.4976-1-geert+renesas@glider.be>
 <29ff3bfd-57ee-9c64-3706-555edc8b4675@baylibre.com>
 <20190814143920.GA30613@roeck-us.net>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <591b2c3d-0c12-511a-c044-82459d4b81d0@baylibre.com>
Date: Wed, 14 Aug 2019 16:46:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190814143920.GA30613@roeck-us.net>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=RZ9MbKBjKXb7iIKtVB/tWj9mxwXvCyRq6iVWKlfTB1I=;
 b=NZk2tv5jY4v6sFIqx6wIPHqHYFjbJWPmdrAvktTExwEHbkhtkCLYeORBKPJsMsfbWs
 8UDhtwnKatbRMWt03VfQb0gEZxaJFy6Audxfufrmjr2bTLGXeOMX3R5/jjFR2E/5ZXCb
 XI1naaktsPW3++iepV5p5ajEGvfZmtu2OZS3hh4NImb9LQPYKQCKvPiU+7XvWOP/lEs6
 173yQ3CtzlaG53ySubWC8bPWaMKkbPfFyFjE91Mq/pPZNab+pN+spvkVZEu5K2w86R30
 ZvZo1ckyi0FhhQ0ttKfXijRIDkL/jiwHemPUv7b3HEwYP8AIhOaD8/iiki3wFBM85kcP
 JlCA==
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 linux-renesas-soc@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTQvMDgvMjAxOSAxNjozOSwgR3VlbnRlciBSb2VjayB3cm90ZToKPiBPbiBUdWUsIEF1ZyAx
MywgMjAxOSBhdCAwMjowMToyNlBNICswMjAwLCBOZWlsIEFybXN0cm9uZyB3cm90ZToKPj4gSGks
Cj4+Cj4+Cj4+IE9uIDEzLzA4LzIwMTkgMTE6MzAsIEdlZXJ0IFV5dHRlcmhvZXZlbiB3cm90ZToK
Pj4+IElmIHRoZSBWR0EgY29ubmVjdG9yIGhhcyBubyBEREMgY2hhbm5lbCwgYW4gZXJyb3IgcG9p
bnRlciB3aWxsIGJlCj4+PiBkZXJlZmVyZW5jZWQsIGUuZy4gb24gU2FsdmF0b3ItWFM6Cj4+Pgo+
Pj4gICAgIFVuYWJsZSB0byBoYW5kbGUga2VybmVsIE5VTEwgcG9pbnRlciBkZXJlZmVyZW5jZSBh
dCB2aXJ0dWFsIGFkZHJlc3MgMDAwMDAwMDAwMDAwMDE3ZAo+Pj4gICAgIC4uLgo+Pj4gICAgIENh
bGwgdHJhY2U6Cj4+PiAgICAgIHN5c2ZzX2RvX2NyZWF0ZV9saW5rX3NkLmlzcmEuMCsweDQwLzB4
MTA4Cj4+PiAgICAgIHN5c2ZzX2NyZWF0ZV9saW5rKzB4MjAvMHg0MAo+Pj4gICAgICBkcm1fc3lz
ZnNfY29ubmVjdG9yX2FkZCsweGE4LzB4YzgKPj4+ICAgICAgZHJtX2Nvbm5lY3Rvcl9yZWdpc3Rl
ci5wYXJ0LjMrMHg1NC8weGIwCj4+PiAgICAgIGRybV9jb25uZWN0b3JfcmVnaXN0ZXJfYWxsKzB4
YjAvMHhkMAo+Pj4gICAgICBkcm1fbW9kZXNldF9yZWdpc3Rlcl9hbGwrMHg1NC8weDg4Cj4+PiAg
ICAgIGRybV9kZXZfcmVnaXN0ZXIrMHgxOGMvMHgxZDgKPj4+ICAgICAgcmNhcl9kdV9wcm9iZSsw
eGU0LzB4MTUwCj4+PiAgICAgIC4uLgo+Pj4KPj4+IFRoaXMgaGFwcGVucyBiZWNhdXNlIHZnYS0+
ZGRjIGVpdGhlciBjb250YWlucyBhIHZhbGlkIEREQyBjaGFubmVsCj4+PiBwb2ludGVyLCBvciAt
RU5PREVWLCBhbmQgZHJtX2Nvbm5lY3Rvcl9pbml0X3dpdGhfZGRjKCkgZXhwZWN0cyBhIHZhbGlk
Cj4+PiBEREMgY2hhbm5lbCBwb2ludGVyLCBvciBOVUxMLgo+Pj4KPj4+IEZpeCB0aGlzIGJ5IHJl
c2V0dGluZyB2Z2EtPmRkYyB0byBOVUxMIGluIGNhc2Ugb2YgLUVOT0RFViwgYW5kIHJlcGxhY2lu
Zwo+Pj4gdGhlIGV4aXN0aW5nIGVycm9yIGNoZWNrcyBieSBub24tTlVMTCBjaGVja3MuCj4+PiBU
aGlzIGlzIHNpbWlsYXIgdG8gd2hhdCB0aGUgSERNSSBjb25uZWN0b3IgZHJpdmVyIGRvZXMuCj4+
Pgo+Pj4gRml4ZXM6IGE0ZjkwODdlODVkZTE0MWUgKCJkcm0vYnJpZGdlOiBkdW1iLXZnYS1kYWM6
IFByb3ZpZGUgZGRjIHN5bWxpbmsgaW4gY29ubmVjdG9yIHN5c2ZzIGRpcmVjdG9yeSIpCj4+PiBT
aWduZWQtb2ZmLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJl
Pgo+Pj4gLS0tCj4+PiBBbiBhbHRlcm5hdGl2ZSB3b3VsZCBiZSB0byBjaGVjayBpZiB2Z2EtPmRk
YyBjb250YWlucyBhbiBlcnJvciBwb2ludGVyLAo+Pj4gYW5kIGNhbGxpbmcgZHJtX2Nvbm5lY3Rv
cl9pbml0KCkgaW5zdGVhZCBvZgo+Pj4gZHJtX2Nvbm5lY3Rvcl9pbml0X3dpdGhfZGRjKCksIGxp
a2UgYmVmb3JlLgo+Pj4gLS0tCj4+PiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9kdW1iLXZnYS1k
YWMuYyB8IDcgKysrKy0tLQo+Pj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDMg
ZGVsZXRpb25zKC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uv
ZHVtYi12Z2EtZGFjLmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2R1bWItdmdhLWRhYy5jCj4+
PiBpbmRleCA4ZWY2NTM5YWU3OGE2ZWIzLi43YWE3ODljMzU4ODI5YjA1IDEwMDY0NAo+Pj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9kdW1iLXZnYS1kYWMuYwo+Pj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2JyaWRnZS9kdW1iLXZnYS1kYWMuYwo+Pj4gQEAgLTQyLDcgKzQyLDcgQEAgc3Rh
dGljIGludCBkdW1iX3ZnYV9nZXRfbW9kZXMoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3Rv
cikKPj4+ICAJc3RydWN0IGVkaWQgKmVkaWQ7Cj4+PiAgCWludCByZXQ7Cj4+PiAgCj4+PiAtCWlm
IChJU19FUlIodmdhLT5kZGMpKQo+Pj4gKwlpZiAoIXZnYS0+ZGRjKQo+Pj4gIAkJZ290byBmYWxs
YmFjazsKPj4+ICAKPj4+ICAJZWRpZCA9IGRybV9nZXRfZWRpZChjb25uZWN0b3IsIHZnYS0+ZGRj
KTsKPj4+IEBAIC04NCw3ICs4NCw3IEBAIGR1bWJfdmdhX2Nvbm5lY3Rvcl9kZXRlY3Qoc3RydWN0
IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvciwgYm9vbCBmb3JjZSkKPj4+ICAJICogd2lyZSB0aGUg
RERDIHBpbnMsIG9yIHRoZSBJMkMgYnVzIG1pZ2h0IG5vdCBiZSB3b3JraW5nIGF0Cj4+PiAgCSAq
IGFsbC4KPj4+ICAJICovCj4+PiAtCWlmICghSVNfRVJSKHZnYS0+ZGRjKSAmJiBkcm1fcHJvYmVf
ZGRjKHZnYS0+ZGRjKSkKPj4+ICsJaWYgKHZnYS0+ZGRjICYmIGRybV9wcm9iZV9kZGModmdhLT5k
ZGMpKQo+Pj4gIAkJcmV0dXJuIGNvbm5lY3Rvcl9zdGF0dXNfY29ubmVjdGVkOwo+Pj4gIAo+Pj4g
IAlyZXR1cm4gY29ubmVjdG9yX3N0YXR1c191bmtub3duOwo+Pj4gQEAgLTE5Nyw2ICsxOTcsNyBA
QCBzdGF0aWMgaW50IGR1bWJfdmdhX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYp
Cj4+PiAgCQlpZiAoUFRSX0VSUih2Z2EtPmRkYykgPT0gLUVOT0RFVikgewo+Pj4gIAkJCWRldl9k
YmcoJnBkZXYtPmRldiwKPj4+ICAJCQkJIk5vIGkyYyBidXMgc3BlY2lmaWVkLiBEaXNhYmxpbmcg
RURJRCByZWFkb3V0XG4iKTsKPj4+ICsJCQl2Z2EtPmRkYyA9IE5VTEw7Cj4+PiAgCQl9IGVsc2Ug
ewo+Pj4gIAkJCWRldl9lcnIoJnBkZXYtPmRldiwgIkNvdWxkbid0IHJldHJpZXZlIGkyYyBidXNc
biIpOwo+Pj4gIAkJCXJldHVybiBQVFJfRVJSKHZnYS0+ZGRjKTsKPj4+IEBAIC0yMTgsNyArMjE5
LDcgQEAgc3RhdGljIGludCBkdW1iX3ZnYV9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldikKPj4+ICAKPj4+ICAJZHJtX2JyaWRnZV9yZW1vdmUoJnZnYS0+YnJpZGdlKTsKPj4+ICAK
Pj4+IC0JaWYgKCFJU19FUlIodmdhLT5kZGMpKQo+Pj4gKwlpZiAodmdhLT5kZGMpCj4+PiAgCQlp
MmNfcHV0X2FkYXB0ZXIodmdhLT5kZGMpOwo+Pj4gIAo+Pj4gIAlyZXR1cm4gMDsKPj4+Cj4+Cj4+
IExvb2tzIHNhbmUsCj4+Cj4+IFJldmlld2VkLWJ5OiBOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9u
Z0BiYXlsaWJyZS5jb20+Cj4+Cj4+IEd1ZW50ZXIsIGNhbiB5b3UgY29uZmlybSBpdCBhbHNvIGZp
eGVzIHFlbXU6dmVyc2F0aWxlcGIgPwo+Pgo+IAo+IFllcywgaXQgZG9lcy4KPiAKPiBUZXN0ZWQt
Ynk6IEd1ZW50ZXIgUm9lY2sgPGxpbnV4QHJvZWNrLXVzLm5ldD4KPiAKPiBHdWVudGVyCj4gCgpU
aGFua3MgZm9yIHRlc3RpbmcsCgpBcHBseWluZyB0byBkcm0tbWlzYy1uZXh0Cl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
