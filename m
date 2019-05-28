Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D40A02C24A
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 11:04:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D3A189F4A;
	Tue, 28 May 2019 09:03:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E6C189F06
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 09:03:42 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id p26so30643434edr.2
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 02:03:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jemw2QjWxU+UFHjYLKdEyQ9knTBj8Nqm3v5Mrc95+O8=;
 b=O+pEROIi51Tp0ZvGW0WYDZyL+JsPU0OLq2zOEhtJ5LpSEUoca7562dAUzX6C7LTAQd
 jEHTCiecLlpuQOOqwupC/VMof8KSPCDKZgDaNZjhHFkrQAqT99O4LIFhbhj1CY6BvRVv
 6Q9dfwlYwQhYw28PWcHIXyAhVuKMWFddaZa7WETWJlE2MsS0vGmtUUqR65rRKLiN73hV
 KKU4zp3ziGaprvcyzfRn24umZw8lsrIWbbOEBQyqZsPtz0EO2luGDRjgauG+jbhHdiY6
 7zYniZsgSWkJdOsXJ7VG5F0ITTgi3fgIIbk7UOX+cRnxO6nv8HdwOfa1C26Q3o+9Puwg
 l1hQ==
X-Gm-Message-State: APjAAAVl7gNXusijcNT8QdzSDi4E5lXumodeF12SXRGHhuobMy3uyL95
 HkgbxMk4kGOETFMaAUMtREgKGdTPEZQ=
X-Google-Smtp-Source: APXvYqzRmMQx8hio/CkC+ykYBbXTDds6GiLnz4oTtSmCC0xHsSsFWfJG1JCAR/ZOcV6FU9c5NjgHVQ==
X-Received: by 2002:a50:ad2b:: with SMTP id
 y40mr126347451edc.237.1559034218893; 
 Tue, 28 May 2019 02:03:38 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id x49sm4072656edm.25.2019.05.28.02.03.37
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 28 May 2019 02:03:38 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH 19/33] fbdev: unify unlink_framebuffer paths
Date: Tue, 28 May 2019 11:02:50 +0200
Message-Id: <20190528090304.9388-20-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190528090304.9388-1-daniel.vetter@ffwll.ch>
References: <20190528090304.9388-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jemw2QjWxU+UFHjYLKdEyQ9knTBj8Nqm3v5Mrc95+O8=;
 b=Q2Q/sGFS+3ztGuIG6HjyW4WqtF83a09htVuw4GKSsgH3cHm7dGKzhjvGuCPzzPDkgL
 E1/NRgZTaeTYcHOps+FhdcT1PbSFGvlgKFkIBRaH+zrG9UMsmLLURLcCTjDwxR0xLIN3
 KwwuXSGHz0AEiTSHK9LXqpPeWcu8jfLUGcaEQ=
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 linux-fbdev@vger.kernel.org, DRI Development <dri-devel@lists.freedesktop.org>,
 =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
 Hans de Goede <hdegoede@redhat.com>, Mikulas Patocka <mpatocka@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rm9yIHNvbWUgcmVhc29ucyB0aGUgcG1fdnRfc3dpdGNoX3VucmVnaXN0ZXIgY2FsbCB3YXMgbWlz
c2luZyBmcm9tIHRoZQpkaXJlY3QgdW5yZWdpc3Rlcl9mcmFtZWJ1ZmZlciBwYXRoLiBGaXggdGhp
cy4KCnYyOiBmYmluZm8tPmRldiBpcyB1c2VkIHRvIGRlY2lkZWQgd2hldGhlciB1bmxpbmtfZnJh
bWVidWZmZXIgaGFzIGJlZW4KY2FsbGVkIGFscmVhZHkuIEkgYm90Y2hlZCB0aGF0IGluIHYxLiBN
YWtlIHRoaXMgYWxsIGNsZWFyZXIgYnkKaW5saW5pbmcgX191bmxpbmtfZnJhbWVidWZmZXIuCgp2
MzogRml4IHR5cG9lIGluIHN1YmplY3QgKE1hYXJ0ZW4pLgoKU2lnbmVkLW9mZi1ieTogRGFuaWVs
IFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+ClJldmlld2VkLWJ5OiBTYW0gUmF2bmJv
cmcgPHNhbUByYXZuYm9yZy5vcmc+ClJldmlld2VkLWJ5OiBNYWFydGVuIExhbmtob3JzdCA8bWFh
cnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgpDYzogTWFhcnRlbiBMYW5raG9yc3QgPG1h
YXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4KQ2M6IEJhcnRsb21pZWogWm9sbmllcmtp
ZXdpY3ogPGIuem9sbmllcmtpZUBzYW1zdW5nLmNvbT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmll
bC52ZXR0ZXJAZmZ3bGwuY2g+CkNjOiAiTWljaGHFgiBNaXJvc8WCYXciIDxtaXJxLWxpbnV4QHJl
cmUucW1xbS5wbD4KQ2M6IFBldGVyIFJvc2luIDxwZWRhQGF4ZW50aWEuc2U+CkNjOiBIYW5zIGRl
IEdvZWRlIDxoZGVnb2VkZUByZWRoYXQuY29tPgpDYzogTWlrdWxhcyBQYXRvY2thIDxtcGF0b2Nr
YUByZWRoYXQuY29tPgotLS0KIGRyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYm1lbS5jIHwgNDcg
KysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyMCBpbnNl
cnRpb25zKCspLCAyNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2Zi
ZGV2L2NvcmUvZmJtZW0uYyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYm1lbS5jCmluZGV4
IGYzYmNhZDMwZDNiYS4uYmVlNDVlOTQwNWI4IDEwMDY0NAotLS0gYS9kcml2ZXJzL3ZpZGVvL2Zi
ZGV2L2NvcmUvZmJtZW0uYworKysgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJtZW0uYwpA
QCAtMTcyMiwxNSArMTcyMiwzMCBAQCBzdGF0aWMgdm9pZCB1bmJpbmRfY29uc29sZShzdHJ1Y3Qg
ZmJfaW5mbyAqZmJfaW5mbykKIAljb25zb2xlX3VubG9jaygpOwogfQogCi1zdGF0aWMgdm9pZCBf
X3VubGlua19mcmFtZWJ1ZmZlcihzdHJ1Y3QgZmJfaW5mbyAqZmJfaW5mbyk7Ci0KLXN0YXRpYyB2
b2lkIGRvX3VucmVnaXN0ZXJfZnJhbWVidWZmZXIoc3RydWN0IGZiX2luZm8gKmZiX2luZm8pCit2
b2lkIHVubGlua19mcmFtZWJ1ZmZlcihzdHJ1Y3QgZmJfaW5mbyAqZmJfaW5mbykKIHsKLQl1bmJp
bmRfY29uc29sZShmYl9pbmZvKTsKKwlpbnQgaTsKKworCWkgPSBmYl9pbmZvLT5ub2RlOworCWlm
IChXQVJOX09OKGkgPCAwIHx8IGkgPj0gRkJfTUFYIHx8IHJlZ2lzdGVyZWRfZmJbaV0gIT0gZmJf
aW5mbykpCisJCXJldHVybjsKKworCWlmICghZmJfaW5mby0+ZGV2KQorCQlyZXR1cm47CisKKwlk
ZXZpY2VfZGVzdHJveShmYl9jbGFzcywgTUtERVYoRkJfTUFKT1IsIGkpKTsKIAogCXBtX3Z0X3N3
aXRjaF91bnJlZ2lzdGVyKGZiX2luZm8tPmRldik7CiAKLQlfX3VubGlua19mcmFtZWJ1ZmZlcihm
Yl9pbmZvKTsKKwl1bmJpbmRfY29uc29sZShmYl9pbmZvKTsKKworCWZiX2luZm8tPmRldiA9IE5V
TEw7Cit9CitFWFBPUlRfU1lNQk9MKHVubGlua19mcmFtZWJ1ZmZlcik7CisKK3N0YXRpYyB2b2lk
IGRvX3VucmVnaXN0ZXJfZnJhbWVidWZmZXIoc3RydWN0IGZiX2luZm8gKmZiX2luZm8pCit7CisJ
dW5saW5rX2ZyYW1lYnVmZmVyKGZiX2luZm8pOwogCWlmIChmYl9pbmZvLT5waXhtYXAuYWRkciAm
JgogCSAgICAoZmJfaW5mby0+cGl4bWFwLmZsYWdzICYgRkJfUElYTUFQX0RFRkFVTFQpKQogCQlr
ZnJlZShmYl9pbmZvLT5waXhtYXAuYWRkcik7CkBAIC0xNzUzLDI4ICsxNzY4LDYgQEAgc3RhdGlj
IHZvaWQgZG9fdW5yZWdpc3Rlcl9mcmFtZWJ1ZmZlcihzdHJ1Y3QgZmJfaW5mbyAqZmJfaW5mbykK
IAlwdXRfZmJfaW5mbyhmYl9pbmZvKTsKIH0KIAotc3RhdGljIHZvaWQgX191bmxpbmtfZnJhbWVi
dWZmZXIoc3RydWN0IGZiX2luZm8gKmZiX2luZm8pCi17Ci0JaW50IGk7Ci0KLQlpID0gZmJfaW5m
by0+bm9kZTsKLQlpZiAoV0FSTl9PTihpIDwgMCB8fCBpID49IEZCX01BWCB8fCByZWdpc3RlcmVk
X2ZiW2ldICE9IGZiX2luZm8pKQotCQlyZXR1cm47Ci0KLQlpZiAoZmJfaW5mby0+ZGV2KSB7Ci0J
CWRldmljZV9kZXN0cm95KGZiX2NsYXNzLCBNS0RFVihGQl9NQUpPUiwgaSkpOwotCQlmYl9pbmZv
LT5kZXYgPSBOVUxMOwotCX0KLX0KLQotdm9pZCB1bmxpbmtfZnJhbWVidWZmZXIoc3RydWN0IGZi
X2luZm8gKmZiX2luZm8pCi17Ci0JX191bmxpbmtfZnJhbWVidWZmZXIoZmJfaW5mbyk7Ci0KLQl1
bmJpbmRfY29uc29sZShmYl9pbmZvKTsKLX0KLUVYUE9SVF9TWU1CT0wodW5saW5rX2ZyYW1lYnVm
ZmVyKTsKLQogLyoqCiAgKiByZW1vdmVfY29uZmxpY3RpbmdfZnJhbWVidWZmZXJzIC0gcmVtb3Zl
IGZpcm13YXJlLWNvbmZpZ3VyZWQgZnJhbWVidWZmZXJzCiAgKiBAYTogbWVtb3J5IHJhbmdlLCB1
c2VycyBvZiB3aGljaCBhcmUgdG8gYmUgcmVtb3ZlZAotLSAKMi4yMC4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
