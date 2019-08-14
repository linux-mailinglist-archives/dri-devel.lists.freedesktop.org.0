Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E268DE9B
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2019 22:20:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D52F36E82D;
	Wed, 14 Aug 2019 20:20:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C8A36E82E
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 20:20:36 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id a21so334163edt.11
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 13:20:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NGoYUnhBV7TeB+3l4wceLC9ZPh9ISIJNJOmyRzHIbHM=;
 b=ByiryBfWKVGs0dawFOGlGfPvDNYb6Dw+IDB5uXC+TSONTwE/hoObliJ24LHw+Qk0jy
 xVnsM/1JvndJbAgL9cxVZQK5ZRvfVGO9mPke6Bm+DM0gilCnSz01hvpXoxTsESB0s29K
 e98G+8t2nEDzxV3KxXsP9CYPztw+C3PSrPTS9nvdnw9/EX1jeI98Gd2j36QRFAske1kK
 2lqJpxcN4bkY1XRfRpWP3uqEgZxpPEvopsTBrmoc+u8rsftqP7S5TbkFF4FGGgYP02AJ
 oqj9QN2gk4bR0YCvkH1Ufv8+e9PrRuphVBxh28Cf4pmtY5QsE9Y1kq9I8FDTZT2/8m37
 X3ZA==
X-Gm-Message-State: APjAAAVd5wAafVwWwmun3K+TOXa9tBOqEVj4BjhE/wkBbYKmRGwkWIJo
 /mMmO+wlw9QvN+y5yki+xHoM7g==
X-Google-Smtp-Source: APXvYqwaJ7x0tLnRLHwbItm2wgIoNWmNw2/2hrhii9cO7U6X/gWZx95a1UP7+c/DHPfmXSg1sNEoMQ==
X-Received: by 2002:a17:906:1e85:: with SMTP id
 e5mr1324797ejj.200.1565814035124; 
 Wed, 14 Aug 2019 13:20:35 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id ns22sm84342ejb.9.2019.08.14.13.20.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Aug 2019 13:20:34 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/5] mm: Check if mmu notifier callbacks are allowed to fail
Date: Wed, 14 Aug 2019 22:20:23 +0200
Message-Id: <20190814202027.18735-2-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190814202027.18735-1-daniel.vetter@ffwll.ch>
References: <20190814202027.18735-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NGoYUnhBV7TeB+3l4wceLC9ZPh9ISIJNJOmyRzHIbHM=;
 b=B5pmU59ycnYBpryQhhG1Z3DbeM8Nqe5M8v1SwTte2yz8M8LB54A/UjWXYoWpYTn2Uv
 5wXLGfAUtYZN5x4CsUBfceRVwXq/4IjhgUmLTFyUKguhiSbuw71qyrATlnjMjT5+NMfu
 Y1nD5IwF07+NuCcwz0U1msvMGB0mJkgxThOFM=
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
Cc: Michal Hocko <mhocko@suse.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, linux-mm@kvack.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 David Rientjes <rientjes@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SnVzdCBhIGJpdCBvZiBwYXJhbm9pYSwgc2luY2UgaWYgd2Ugc3RhcnQgcHVzaGluZyB0aGlzIGRl
ZXAgaW50bwpjYWxsY2hhaW5zIGl0J3MgaGFyZCB0byBzcG90IGFsbCBwbGFjZXMgd2hlcmUgYW4g
bW11IG5vdGlmaWVyCmltcGxlbWVudGF0aW9uIG1pZ2h0IGZhaWwgd2hlbiBpdCdzIG5vdCBhbGxv
d2VkIHRvLgoKSW5zcGlyZWQgYnkgc29tZSBjb25mdXNpb24gd2UgaGFkIGRpc2N1c3NpbmcgaTkx
NSBtbXUgbm90aWZpZXJzIGFuZAp3aGV0aGVyIHdlIGNvdWxkIHVzZSB0aGUgbmV3bHktaW50cm9k
dWNlZCByZXR1cm4gdmFsdWUgdG8gaGFuZGxlIHNvbWUKY29ybmVyIGNhc2VzLiBVbnRpbCB3ZSBy
ZWFsaXplZCB0aGF0IHRoZXNlIGFyZSBvbmx5IGZvciB3aGVuIGEgdGFzawpoYXMgYmVlbiBraWxs
ZWQgYnkgdGhlIG9vbSByZWFwZXIuCgpBbiBhbHRlcm5hdGl2ZSBhcHByb2FjaCB3b3VsZCBiZSB0
byBzcGxpdCB0aGUgY2FsbGJhY2sgaW50byB0d28KdmVyc2lvbnMsIG9uZSB3aXRoIHRoZSBpbnQg
cmV0dXJuIHZhbHVlLCBhbmQgdGhlIG90aGVyIHdpdGggdm9pZApyZXR1cm4gdmFsdWUgbGlrZSBp
biBvbGRlciBrZXJuZWxzLiBCdXQgdGhhdCdzIGEgbG90IG1vcmUgY2h1cm4gZm9yCmZhaXJseSBs
aXR0bGUgZ2FpbiBJIHRoaW5rLgoKU3VtbWFyeSBmcm9tIHRoZSBtLWwgZGlzY3Vzc2lvbiBvbiB3
aHkgd2Ugd2FudCBzb21ldGhpbmcgYXQgd2FybmluZwpsZXZlbDogVGhpcyBhbGxvd3MgYXV0b21h
dGVkIHRvb2xpbmcgaW4gQ0kgdG8gY2F0Y2ggYnVncyB3aXRob3V0Cmh1bWFucyBoYXZpbmcgdG8g
bG9vayBhdCBldmVyeXRoaW5nLiBJZiB3ZSBqdXN0IHVwZ3JhZGUgdGhlIGV4aXN0aW5nCnByX2lu
Zm8gdG8gYSBwcl93YXJuLCB0aGVuIHdlJ2xsIGhhdmUgZmFsc2UgcG9zaXRpdmVzLiBBbmQgYXMt
aXMsIG5vCm9uZSB3aWxsIGV2ZXIgc3BvdCB0aGUgcHJvYmxlbSBzaW5jZSBpdCdzIGxvc3QgaW4g
dGhlIG1hc3NpdmUgYW1vdW50cwpvZiBvdmVyYWxsIGRtZXNnIG5vaXNlLgoKdjI6IERyb3AgdGhl
IGZ1bGwgV0FSTl9PTiBiYWNrdHJhY2UgaW4gZmF2b3VyIG9mIGp1c3QgYSBwcl93YXJuIGZvcgp0
aGUgcHJvYmxlbWF0aWMgY2FzZSAoTWljaGFsIEhvY2tvKS4KCnYzOiBSZWJhc2Ugb24gdG9wIG9m
IEdsaXNzZSdzIGFyZyByZXdvcmsuCgp2NDogTW9yZSByZWJhc2Ugb24gdG9wIG9mIEdsaXNzZSBy
ZXdvcmtpbmcgZXZlcnl0aGluZy4KCnY1OiBGaXh1cCByZWJhc2UgZGFtYWdlIGFuZCBhbHNvIGNh
dGNoIGZhaWx1cmVzICE9IEVBR0FJTiBmb3IKIWJsb2NrYWJsZSAoSmFzb24pLiBBbHNvIGdvIGJh
Y2sgdG8gV0FSTl9PTiBhcyByZXF1ZXN0ZWQgYnkgSmFzb24sIHNvCmF1dG9tYXRpYyBjaGVja2Vy
cyBjYW4gZWFzaWx5IGNhdGNoIGJ1Z3MgYnkgc2V0dGluZyBwYW5pY19vbl93YXJuLgoKQ2M6IEFu
ZHJldyBNb3J0b24gPGFrcG1AbGludXgtZm91bmRhdGlvbi5vcmc+CkNjOiBNaWNoYWwgSG9ja28g
PG1ob2Nrb0BzdXNlLmNvbT4KQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5p
Z0BhbWQuY29tPgpDYzogRGF2aWQgUmllbnRqZXMgPHJpZW50amVzQGdvb2dsZS5jb20+CkNjOiBE
YW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgpDYzogIkrDqXLDtG1lIEdsaXNz
ZSIgPGpnbGlzc2VAcmVkaGF0LmNvbT4KQ2M6IGxpbnV4LW1tQGt2YWNrLm9yZwpDYzogUGFvbG8g
Qm9uemluaSA8cGJvbnppbmlAcmVkaGF0LmNvbT4KQ2M6IEphc29uIEd1bnRob3JwZSA8amdnQHpp
ZXBlLmNhPgpTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVs
LmNvbT4KLS0tCiBtbS9tbXVfbm90aWZpZXIuYyB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9tbS9tbXVfbm90aWZpZXIuYyBiL21tL21tdV9ub3Rp
Zmllci5jCmluZGV4IGI1NjcwNjIwYWVhMC4uMTZmMWNiYzc3NWQwIDEwMDY0NAotLS0gYS9tbS9t
bXVfbm90aWZpZXIuYworKysgYi9tbS9tbXVfbm90aWZpZXIuYwpAQCAtMTc5LDYgKzE3OSw4IEBA
IGludCBfX21tdV9ub3RpZmllcl9pbnZhbGlkYXRlX3JhbmdlX3N0YXJ0KHN0cnVjdCBtbXVfbm90
aWZpZXJfcmFuZ2UgKnJhbmdlKQogCQkJCXByX2luZm8oIiVwUyBjYWxsYmFjayBmYWlsZWQgd2l0
aCAlZCBpbiAlc2Jsb2NrYWJsZSBjb250ZXh0LlxuIiwKIAkJCQkJbW4tPm9wcy0+aW52YWxpZGF0
ZV9yYW5nZV9zdGFydCwgX3JldCwKIAkJCQkJIW1tdV9ub3RpZmllcl9yYW5nZV9ibG9ja2FibGUo
cmFuZ2UpID8gIm5vbi0iIDogIiIpOworCQkJCVdBUk5fT04obW11X25vdGlmaWVyX3JhbmdlX2Js
b2NrYWJsZShyYW5nZSkgfHwKKwkJCQkJcmV0ICE9IC1FQUdBSU4pOwogCQkJCXJldCA9IF9yZXQ7
CiAJCQl9CiAJCX0KLS0gCjIuMjIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
