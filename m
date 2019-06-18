Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2FE4972C
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 03:54:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E29EB6E0C8;
	Tue, 18 Jun 2019 01:53:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 000BD6E0C6
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 01:53:55 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id p15so19046084eds.8
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 18:53:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=aQEwP0GxkFgmtmf4A6zwuM0iwjk9aSs7rleJgpbLM7o=;
 b=tYVKLP8/VXARxdlWFRtaLwryLcFMfHN20H790Fy8VLF7MLZDDM0zSez3egZqvkpvHv
 /8ZrEKtAfESsoRw91L2DPonn+LxN/RIbubhzz5DcMbiMEMhjb4Gcad3+F3GQVpvwaKVB
 5YfKRLw8qFrL4PnCfcm2gUwYW3cGYA5bP0ce26s+7/J6zu/2Ool2ojqLNZcaA+HWa+7r
 /ULfqth85oYP5a2v+nvpi2vOOGHPnTYFWi+D2qwveUcUh6uzt5RCBfvEY0Y1E+Tnk5OB
 LoDzZJM9TZ2HzZLWbuAff9B71YZPOWzLZ34B7Yzz2o8knNfeTShM7deHbEuUFDJgzIH7
 iULg==
X-Gm-Message-State: APjAAAXgAJ6ArxLV98F1m+gFwPP3CvsqHbkbbGwj6eymD2uC1gdOZcFI
 BamRVYDXyAfRtOhsIGdKZL8=
X-Google-Smtp-Source: APXvYqzhlWuZGIy0DSktFZSM4U0Y2bv+SYz4xRdzu0Oh0BBtG6NLP2CqBDe7wI4yufZJvLezxCw50w==
X-Received: by 2002:a50:b6e6:: with SMTP id f35mr82749852ede.82.1560822834619; 
 Mon, 17 Jun 2019 18:53:54 -0700 (PDT)
Received: from smtp.gmail.com ([187.121.151.146])
 by smtp.gmail.com with ESMTPSA id e43sm4349304ede.62.2019.06.17.18.53.49
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 18:53:53 -0700 (PDT)
Date: Mon, 17 Jun 2019 22:53:46 -0300
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 2/3] drm/vkms: stop generating CRCs on buffer overflow
Message-ID: <20190618015346.w2hgjrqlf4jxi3ei@smtp.gmail.com>
References: <20190613121802.2193-1-oleg.vasilev@intel.com>
 <20190613121802.2193-2-oleg.vasilev@intel.com>
 <20190613130711.GL23020@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190613130711.GL23020@phenom.ffwll.local>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=aQEwP0GxkFgmtmf4A6zwuM0iwjk9aSs7rleJgpbLM7o=;
 b=KaHWEi1Be75+F+14fX63mrZWnRGkiPWTUR7EErzx+tyS5fS7slwmTtQKxaX0Gspy2w
 OFEU15oRONRiPfRdMMg2npWZczaaxTpiaMBeqLRZl4yelmOEns7FhIslE/luM/TnRuea
 p2IEBlGvWLPnLBSI/sUEwCNW7AeSQyRcIGVK+37QDvEOQ2F9cmGZ4yqVlQBeFfOEpO3m
 NDKxfGnbtpUeHLNUjzu73tvPzBD8ul9gszhAgnlHJyza22u5o0/LTw2LwkwcPGB6XXVK
 gzl3TfvbgyA6bTntTTFAalEOrRSNftoa7zOKpFrpj+r8GEBZSEc4wDqzD9IyrijfSytv
 nA5w==
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
Cc: Shayenne Moura <shayenneluzmoura@gmail.com>,
 Oleg Vasilev <oleg.vasilev@intel.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgT2xlZywKCkZpcnN0IG9mIGFsbCwgdGhhbmsgeW91IGZvciB5b3VyIHBhdGNoc2V0LgoKT24g
MDYvMTMsIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gT24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMDM6
MTg6MDFQTSArMDMwMCwgT2xlZyBWYXNpbGV2IHdyb3RlOgo+ID4gQmVjYXVzZSBpbnRlcnJ1cHRz
IGFyZSBnZW5lcmF0ZWQgYXJ0aWZpdGlhbGx5LCBrZXJuZWwgYnVnIG1heSBsZWFkIHRvCj4gPiBp
bmZpbnRlIGF0dGVtcHRzIHRvIHN1Ym1pdCBDUkMuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IE9s
ZWcgVmFzaWxldiA8b2xlZy52YXNpbGV2QGludGVsLmNvbT4KPiA+IC0tLQo+ID4gIGRyaXZlcnMv
Z3B1L2RybS92a21zL3ZrbXNfY3JjLmMgfCAxMCArKysrKysrKystCj4gPiAgMSBmaWxlIGNoYW5n
ZWQsIDkgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3ZrbXMvdmttc19jcmMuYyBiL2RyaXZlcnMvZ3B1L2RybS92a21zL3Zr
bXNfY3JjLmMKPiA+IGluZGV4IGQ3YjQwOWEzYzBmOC4uYmM3MTdhODg4OGI1IDEwMDY0NAo+ID4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL3ZrbXMvdmttc19jcmMuYwo+ID4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL3ZrbXMvdmttc19jcmMuYwo+ID4gQEAgLTE2Nyw2ICsxNjcsNyBAQCB2b2lkIHZrbXNf
Y3JjX3dvcmtfaGFuZGxlKHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yaykKPiA+ICAJdTMyIGNyYzMy
ID0gMDsKPiA+ICAJdTY0IGZyYW1lX3N0YXJ0LCBmcmFtZV9lbmQ7Cj4gPiAgCXVuc2lnbmVkIGxv
bmcgZmxhZ3M7Cj4gPiArCWludCByZXQ7Cj4gPiAgCj4gPiAgCXNwaW5fbG9ja19pcnFzYXZlKCZv
dXQtPnN0YXRlX2xvY2ssIGZsYWdzKTsKPiA+ICAJZnJhbWVfc3RhcnQgPSBjcnRjX3N0YXRlLT5m
cmFtZV9zdGFydDsKPiA+IEBAIC0yMDIsNyArMjAzLDE0IEBAIHZvaWQgdmttc19jcmNfd29ya19o
YW5kbGUoc3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKQo+ID4gIAkgKiBtaXNzaW5nIGZyYW1lcwo+
ID4gIAkgKi8KPiA+ICAJd2hpbGUgKGZyYW1lX3N0YXJ0IDw9IGZyYW1lX2VuZCkKPiA+IC0JCWRy
bV9jcnRjX2FkZF9jcmNfZW50cnkoY3J0YywgdHJ1ZSwgZnJhbWVfc3RhcnQrKywgJmNyYzMyKTsK
PiA+ICsJewo+IAo+IEJpa2VzaGVkOiBLZXJuZWwgY29kaW5nc3R5bGUgcHV0cyB0aGlzIG9uIHRo
ZSBzYW1lIGxpbmUgYXMgdGhlIGNsb3NpbmcgKQo+IG9mIHRoZSB3aGlsZS9pZi9mb3IuCgpJIHJl
Y29tbWVuZCB5b3UgdG8gY3JlYXRlIGEgcG9zdC1jb21taXQgc2NyaXB0IGluIHlvdXIgZ2l0IHJl
cG8uClNvbWV0aGluZyBsaWtlIHRoaXM6Cgp0b3VjaCAuZ2l0L2hvb2tzL3Bvc3QtY29tbWl0CgpJ
biB0aGUgcG9zdC1jb21taXQsIGFkZDoKCmV4ZWMgZ2l0IHNob3cgLS1mb3JtYXQ9ZW1haWwgSEVB
RCB8IC4vc2NyaXB0cy9jaGVja3BhdGNoLnBsIC0tc3RyaWN0IC0tY29kZXNwZWxsCiAKPiBBc2lk
ZSBmcm9tIHRoYXQgbm90IHN1cmUgdGhhdCdzIHVzZWZ1bCBoZXJlLCB3ZSd2ZSBmaXhlZCB0aGUg
YnVnIGJ5IG5vdwo+IC4uLgoKSU1ITywgdGhpcyBwYXRjaCBpcyB1c2VmdWwgYmVjYXVzZSBpdCBo
YW5kbGVzIHRoZSByZXR1cm4gdmFsdWUgZnJvbQpkcm1fY3J0Y19hZGRfY3JjX2VudHJ5KCkgd2hp
Y2ggbWFrZSB0aGUgY29kZSBhIGxpdHRsZSBiaXQgbW9yZSByZWxpYWJsZS4KQWRkaXRpb25hbGx5
LCBpdCBhdm9pZHMgcG9sbHV0aW5nIHRoZSBkbWVzZyBvdXRwdXQgaW4gY2FzZSBvZiBhCnByb2Js
ZW0uCgo+IC1EYW5pZWwKPiAKPiA+ICsJCXJldCA9IGRybV9jcnRjX2FkZF9jcmNfZW50cnkoY3J0
YywgdHJ1ZSwgZnJhbWVfc3RhcnQrKywgJmNyYzMyKTsKPiA+ICsJCWlmIChyZXQpIHsKPiA+ICsJ
CQlEUk1fV0FSTigiVktNUyBzdG9wIGdlbmVyYXRpbmcgQ1JDc1xuIik7Cj4gPiArCQkJb3V0LT5j
cmNfZW5hYmxlZCA9IGZhbHNlOwo+ID4gKwkJCWJyZWFrOwo+ID4gKwkJfQo+ID4gKwl9Cj4gPiAg
Cj4gPiAgb3V0Ogo+ID4gIAkvKiB0byBhdm9pZCB1c2luZyB0aGUgc2FtZSB2YWx1ZSBmb3IgZnJh
bWUgbnVtYmVyIGFnYWluICovCj4gPiAtLSAKPiA+IDIuMjEuMAo+ID4gCj4gCj4gLS0gCj4gRGFu
aWVsIFZldHRlcgo+IFNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgo+IGh0dHA6
Ly9ibG9nLmZmd2xsLmNoCgotLSAKUm9kcmlnbyBTaXF1ZWlyYQpodHRwczovL3NpcXVlaXJhLnRl
Y2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
