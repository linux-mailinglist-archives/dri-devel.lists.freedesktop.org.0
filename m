Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA61B4CCE4
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2019 13:29:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FAA06E3AE;
	Thu, 20 Jun 2019 11:29:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80C486E3AE
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2019 11:29:03 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id w13so4234420eds.4
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2019 04:29:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=sE36R7XzjGiuQnEAvzt0M0sm8aW6b9ZjU3sJZtNozo4=;
 b=oQzdHhRp1k/aNQxUcAcFih/oLfPcrbdfuFPTWFFSlwazcUCCW4paVqxylrRnLg0mpE
 QCBufqNE7/Hj31poSSwF7m7tSbqeq+f9G7bnh0Fl0AXAYn0wDjrh8tsj02tk67QSAw9t
 i5EFfdrZMzshjF/HdacCl+3TzBeGz1Gu8VHp5jGopsRb+hkEynbbxTRbr81zy2L+vRMk
 ggZY8qNEvT7xO1kGjq3cRGDIBk0LYmmah8LxcOTMWYYt9Z+PJS+xJY7V6FJCeFBWzEj7
 C/rjEhSrKJ7V+1dZ7VFrgUMdLg9EG2EowAdHVH3eUwPRd156kkOAvbr1Kv1uAcS9Fzbj
 Uy0A==
X-Gm-Message-State: APjAAAVz81pTBb5GKVKjLRRMAe85Bq2Q0haQBTfQCBOCT7pLUwiv+0Ry
 2yBbqyXf0MjNJlqTLOUgPqlp1Q==
X-Google-Smtp-Source: APXvYqwZDwUsGQk9KRGn4wHb/EwC9EuL+ymysCFiXtYLP7/DfEtft35g8BN4Z3/ig6Jg9cOk3e77VA==
X-Received: by 2002:a17:906:9711:: with SMTP id
 k17mr539676ejx.298.1561030142138; 
 Thu, 20 Jun 2019 04:29:02 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id y11sm3797833ejb.54.2019.06.20.04.29.00
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 20 Jun 2019 04:29:00 -0700 (PDT)
Date: Thu, 20 Jun 2019 13:28:55 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH] drm/self_refresh: Fix possible NULL deref in failure path
Message-ID: <20190620112855.GQ12905@phenom.ffwll.local>
References: <20190619094151.GI18776@kadam>
 <20190619181951.192305-1-sean@poorly.run>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190619181951.192305-1-sean@poorly.run>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=sE36R7XzjGiuQnEAvzt0M0sm8aW6b9ZjU3sJZtNozo4=;
 b=YOd9UND10yRySfsm9cGRhtxqm9iI2yCWe6X4ZxaCyP7zQrofJugzf44Mht/HChvhla
 DBBwsw4g5FgSk9GnFKbGS4NaAUXsScny7ukYjzBE3EPJaoPDHTDSSxVi1M+/ROuR+q7n
 bc2OdhofLnIkmrmoCVmDYrhwy7+23YR0oKV2o=
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
Cc: Zain Wang <wzz@rock-chips.com>, Maxime Ripard <maxime.ripard@bootlin.com>,
 Jose Souza <jose.souza@intel.com>, Tomasz Figa <tfiga@chromium.org>,
 David Airlie <airlied@linux.ie>, Sean Paul <seanpaul@chromium.org>,
 dri-devel@lists.freedesktop.org, Dan Carpenter <dan.carpenter@oracle.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMTksIDIwMTkgYXQgMDI6MTk6NDdQTSAtMDQwMCwgU2VhbiBQYXVsIHdyb3Rl
Ogo+IEZyb206IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3JnPgo+IAo+IElmIHN0YXRl
IGFsbG9jYXRpb24gZmFpbHMsIHdlIHN0aWxsIHRyeSB0byBnaXZlIGJhY2sgdGhlIHJlZmVyZW5j
ZSBvbgo+IGl0LiBBbHNvIGluaXRpYWxpemUgcmV0IGluIGNhc2UgdGhlIGNydGMgaXMgbm90IGVu
YWJsZWQgYW5kIHdlIGhpdCB0aGUKPiBlamVjdCBidXR0b24uCj4gCj4gRml4ZXM6IDE0NTJjMjVi
MGU2MCAoImRybTogQWRkIGhlbHBlcnMgdG8ga2ljayBvZmYgc2VsZiByZWZyZXNoIG1vZGUgaW4g
ZHJpdmVycyIpCj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiBDYzogSm9z
ZSBTb3V6YSA8am9zZS5zb3V6YUBpbnRlbC5jb20+Cj4gQ2M6IFphaW4gV2FuZyA8d3p6QHJvY2st
Y2hpcHMuY29tPgo+IENjOiBUb21hc3ogRmlnYSA8dGZpZ2FAY2hyb21pdW0ub3JnPgo+IENjOiBW
aWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgo+IENjOiBTYW0g
UmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+Cj4gQ2M6IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hy
b21pdW0ub3JnPgo+IENjOiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGlu
dXguaW50ZWwuY29tPgo+IENjOiBNYXhpbWUgUmlwYXJkIDxtYXhpbWUucmlwYXJkQGJvb3RsaW4u
Y29tPgo+IENjOiBTZWFuIFBhdWwgPHNlYW5AcG9vcmx5LnJ1bj4KPiBDYzogRGF2aWQgQWlybGll
IDxhaXJsaWVkQGxpbnV4LmllPgo+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cj4gUmVwb3J0ZWQtYnk6IERhbiBDYXJwZW50ZXIgPGRhbi5jYXJwZW50ZXJAb3JhY2xlLmNvbT4K
PiBTaWduZWQtb2ZmLWJ5OiBTZWFuIFBhdWwgPHNlYW5wYXVsQGNocm9taXVtLm9yZz4KClJldmll
d2VkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgoKPiAtLS0KPiAg
ZHJpdmVycy9ncHUvZHJtL2RybV9zZWxmX3JlZnJlc2hfaGVscGVyLmMgfCA2ICsrKystLQo+ICAx
IGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3NlbGZfcmVmcmVzaF9oZWxwZXIuYyBiL2RyaXZl
cnMvZ3B1L2RybS9kcm1fc2VsZl9yZWZyZXNoX2hlbHBlci5jCj4gaW5kZXggZTBkMmFkMWYwNzBj
Yi4uNGI5NDI0YThmMWYxYyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3NlbGZf
cmVmcmVzaF9oZWxwZXIuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fc2VsZl9yZWZyZXNo
X2hlbHBlci5jCj4gQEAgLTY5LDE0ICs2OSwxNCBAQCBzdGF0aWMgdm9pZCBkcm1fc2VsZl9yZWZy
ZXNoX2hlbHBlcl9lbnRyeV93b3JrKHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yaykKPiAgCXN0cnVj
dCBkcm1fY29ubmVjdG9yICpjb25uOwo+ICAJc3RydWN0IGRybV9jb25uZWN0b3Jfc3RhdGUgKmNv
bm5fc3RhdGU7Cj4gIAlzdHJ1Y3QgZHJtX2NydGNfc3RhdGUgKmNydGNfc3RhdGU7Cj4gLQlpbnQg
aSwgcmV0Owo+ICsJaW50IGksIHJldCA9IDA7Cj4gIAo+ICAJZHJtX21vZGVzZXRfYWNxdWlyZV9p
bml0KCZjdHgsIDApOwo+ICAKPiAgCXN0YXRlID0gZHJtX2F0b21pY19zdGF0ZV9hbGxvYyhkZXYp
Owo+ICAJaWYgKCFzdGF0ZSkgewo+ICAJCXJldCA9IC1FTk9NRU07Cj4gLQkJZ290byBvdXQ7Cj4g
KwkJZ290byBvdXRfZHJvcF9sb2NrczsKPiAgCX0KPiAgCj4gIHJldHJ5Ogo+IEBAIC0xMTYsNiAr
MTE2LDggQEAgc3RhdGljIHZvaWQgZHJtX3NlbGZfcmVmcmVzaF9oZWxwZXJfZW50cnlfd29yayhz
dHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmspCj4gIAl9Cj4gIAo+ICAJZHJtX2F0b21pY19zdGF0ZV9w
dXQoc3RhdGUpOwo+ICsKPiArb3V0X2Ryb3BfbG9ja3M6Cj4gIAlkcm1fbW9kZXNldF9kcm9wX2xv
Y2tzKCZjdHgpOwo+ICAJZHJtX21vZGVzZXRfYWNxdWlyZV9maW5pKCZjdHgpOwo+ICB9Cj4gLS0g
Cj4gU2VhbiBQYXVsLCBTb2Z0d2FyZSBFbmdpbmVlciwgR29vZ2xlIC8gQ2hyb21pdW0gT1MKPiAK
Ci0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpo
dHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
