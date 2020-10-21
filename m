Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6B52949A8
	for <lists+dri-devel@lfdr.de>; Wed, 21 Oct 2020 10:57:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F4EF6EA95;
	Wed, 21 Oct 2020 08:57:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A2F56EA95
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 08:57:11 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id i1so2183269wro.1
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 01:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OPi94I7u5TlT9ZMkfo3wd9G1XVf17ZOM76y2ie/UBYo=;
 b=LHFf1nOpd9Yl+wPGLpl23bEIb0QE+8Hot8HPPyfFC6dPlkHm+Dy5yniNcp8HX0A/zw
 lIEYHsUhRbf34d1PqRehF0XEoT/gzswXJzS/vHVbL/EyCnNOruKM6IjOpvFvTkma3oc3
 x6t5IzbtOyzSuC7eyTfotP+gLU4tsrzFecuWM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OPi94I7u5TlT9ZMkfo3wd9G1XVf17ZOM76y2ie/UBYo=;
 b=FB2uv88+tP1PK3cFwg99bplYUmRJrQcFGgbp4O0hOhJNz3YwLxFOpnXG2m29zn6A4M
 GxhYfbp+E7l2XoMFvX3vOTimg+EaSK4ltwnEb498mca58++XfHeV69YyrNnIK1MlEfA9
 N9vk0weIQToIGmZJ3Fgt6PVYzGDtdoWufnAy7bFg7idcPiPQKy8k4ymAdtXsbskJ8bQp
 ma0ipGxHG4dpbJQ9XWwoQDvu8KZvUzUeJfDyl8Uf/7ascxh4f1S95tHhvOkvrye+7LyI
 i6hmNmcFMysmF9elWS7kFE3kPsYHEZnYqdFq5VYPhMjdWEg1E8vc6Gxq0KJBlDA7g0Ru
 5Jjw==
X-Gm-Message-State: AOAM533rK2XQk5TKKoPOwYY8ITP9sV9mb4kO4kodEjdTDv+Om230WFE0
 +O3B5Cqgqaed5Q2BWkhWhPIn2KHV+QcE4Uq4
X-Google-Smtp-Source: ABdhPJw9zQlQYxuU/CNLju53SaBbNIHKJyF+jiQvqzMWRBPWLPGowYaSPULBChwBYVyW5+HEPgaJwA==
X-Received: by 2002:adf:cd87:: with SMTP id q7mr3373418wrj.169.1603270629486; 
 Wed, 21 Oct 2020 01:57:09 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q8sm2675939wro.32.2020.10.21.01.57.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2020 01:57:08 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 05/16] mm/frame-vector: Use FOLL_LONGTERM
Date: Wed, 21 Oct 2020 10:56:44 +0200
Message-Id: <20201021085655.1192025-6-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201021085655.1192025-1-daniel.vetter@ffwll.ch>
References: <20201021085655.1192025-1-daniel.vetter@ffwll.ch>
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
Cc: linux-s390@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Jan Kara <jack@suse.cz>, Pawel Osciak <pawel@osciak.com>, kvm@vger.kernel.org,
 Jason Gunthorpe <jgg@ziepe.ca>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Tomasz Figa <tfiga@chromium.org>, linux-mm@kvack.org,
 Kyungmin Park <kyungmin.park@samsung.com>, John Hubbard <jhubbard@nvidia.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBpcyB1c2VkIGJ5IG1lZGlhL3ZpZGVidWYyIGZvciBwZXJzaXN0ZW50IGRtYSBtYXBwaW5n
cywgbm90IGp1c3QKZm9yIGEgc2luZ2xlIGRtYSBvcGVyYXRpb24gYW5kIHRoZW4gZnJlZWQgYWdh
aW4sIHNvIG5lZWRzCkZPTExfTE9OR1RFUk0uCgpVbmZvcnR1bmF0ZWx5IGN1cnJlbnQgcHVwX2xv
Y2tlZCBkb2Vzbid0IHN1cHBvcnQgRk9MTF9MT05HVEVSTSBkdWUgdG8KbG9ja2luZyBpc3N1ZXMu
IFJld29yayB0aGUgY29kZSB0byBwdWxsIHRoZSBwdXAgcGF0aCBvdXQgZnJvbSB0aGUKbW1hcF9z
ZW0gY3JpdGljYWwgc2VjdGlvbiBhcyBzdWdnZXN0ZWQgYnkgSmFzb24uCgpCeSByZWx5aW5nIGVu
dGlyZWx5IG9uIHRoZSB2bWEgY2hlY2tzIGluIHBpbl91c2VyX3BhZ2VzIGFuZCBmb2xsb3dfcGZu
Cihmb3Igdm1fZmxhZ3MgYW5kIHZtYV9pc19mc2RheCkgd2UgY2FuIGFsc28gc3RyZWFtbGluZSB0
aGUgY29kZSBhIGxvdC4KClNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0
ZXJAaW50ZWwuY29tPgpDYzogSmFzb24gR3VudGhvcnBlIDxqZ2dAemllcGUuY2E+CkNjOiBQYXdl
bCBPc2NpYWsgPHBhd2VsQG9zY2lhay5jb20+CkNjOiBNYXJlayBTenlwcm93c2tpIDxtLnN6eXBy
b3dza2lAc2Ftc3VuZy5jb20+CkNjOiBLeXVuZ21pbiBQYXJrIDxreXVuZ21pbi5wYXJrQHNhbXN1
bmcuY29tPgpDYzogVG9tYXN6IEZpZ2EgPHRmaWdhQGNocm9taXVtLm9yZz4KQ2M6IE1hdXJvIENh
cnZhbGhvIENoZWhhYiA8bWNoZWhhYkBrZXJuZWwub3JnPgpDYzogQW5kcmV3IE1vcnRvbiA8YWtw
bUBsaW51eC1mb3VuZGF0aW9uLm9yZz4KQ2M6IEpvaG4gSHViYmFyZCA8amh1YmJhcmRAbnZpZGlh
LmNvbT4KQ2M6IErDqXLDtG1lIEdsaXNzZSA8amdsaXNzZUByZWRoYXQuY29tPgpDYzogSmFuIEth
cmEgPGphY2tAc3VzZS5jej4KQ2M6IERhbiBXaWxsaWFtcyA8ZGFuLmoud2lsbGlhbXNAaW50ZWwu
Y29tPgpDYzogbGludXgtbW1Aa3ZhY2sub3JnCkNjOiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKQ2M6IGxpbnV4LXNhbXN1bmctc29jQHZnZXIua2VybmVsLm9yZwpDYzogbGlu
dXgtbWVkaWFAdmdlci5rZXJuZWwub3JnClNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRh
bmllbC52ZXR0ZXJAZmZ3bGwuY29tPgotLQp2MjogU3RyZWFtbGluZSB0aGUgY29kZSBhbmQgZnVy
dGhlciBzaW1wbGlmeSB0aGUgbG9vcCBjaGVja3MgKEphc29uKQotLS0KIG1tL2ZyYW1lX3ZlY3Rv
ci5jIHwgNTAgKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0K
IDEgZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCAzNSBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9tbS9mcmFtZV92ZWN0b3IuYyBiL21tL2ZyYW1lX3ZlY3Rvci5jCmluZGV4IDEwZjgy
ZDU2NDNiNi4uZDQ0Nzc5ZTU2MzEzIDEwMDY0NAotLS0gYS9tbS9mcmFtZV92ZWN0b3IuYworKysg
Yi9tbS9mcmFtZV92ZWN0b3IuYwpAQCAtMzgsNyArMzgsNiBAQCBpbnQgZ2V0X3ZhZGRyX2ZyYW1l
cyh1bnNpZ25lZCBsb25nIHN0YXJ0LCB1bnNpZ25lZCBpbnQgbnJfZnJhbWVzLAogCXN0cnVjdCB2
bV9hcmVhX3N0cnVjdCAqdm1hOwogCWludCByZXQgPSAwOwogCWludCBlcnI7Ci0JaW50IGxvY2tl
ZDsKIAogCWlmIChucl9mcmFtZXMgPT0gMCkKIAkJcmV0dXJuIDA7CkBAIC00OCw0MCArNDcsMjUg
QEAgaW50IGdldF92YWRkcl9mcmFtZXModW5zaWduZWQgbG9uZyBzdGFydCwgdW5zaWduZWQgaW50
IG5yX2ZyYW1lcywKIAogCXN0YXJ0ID0gdW50YWdnZWRfYWRkcihzdGFydCk7CiAKLQltbWFwX3Jl
YWRfbG9jayhtbSk7Ci0JbG9ja2VkID0gMTsKLQl2bWEgPSBmaW5kX3ZtYV9pbnRlcnNlY3Rpb24o
bW0sIHN0YXJ0LCBzdGFydCArIDEpOwotCWlmICghdm1hKSB7Ci0JCXJldCA9IC1FRkFVTFQ7Ci0J
CWdvdG8gb3V0OwotCX0KLQotCS8qCi0JICogV2hpbGUgZ2V0X3ZhZGRyX2ZyYW1lcygpIGNvdWxk
IGJlIHVzZWQgZm9yIHRyYW5zaWVudCAoa2VybmVsCi0JICogY29udHJvbGxlZCBsaWZldGltZSkg
cGlubmluZyBvZiBtZW1vcnkgcGFnZXMgYWxsIGN1cnJlbnQKLQkgKiB1c2VycyBlc3RhYmxpc2gg
bG9uZyB0ZXJtICh1c2Vyc3BhY2UgY29udHJvbGxlZCBsaWZldGltZSkKLQkgKiBwYWdlIHBpbm5p
bmcuIFRyZWF0IGdldF92YWRkcl9mcmFtZXMoKSBsaWtlCi0JICogZ2V0X3VzZXJfcGFnZXNfbG9u
Z3Rlcm0oKSBhbmQgZGlzYWxsb3cgaXQgZm9yIGZpbGVzeXN0ZW0tZGF4Ci0JICogbWFwcGluZ3Mu
Ci0JICovCi0JaWYgKHZtYV9pc19mc2RheCh2bWEpKSB7Ci0JCXJldCA9IC1FT1BOT1RTVVBQOwot
CQlnb3RvIG91dDsKLQl9Ci0KLQlpZiAoISh2bWEtPnZtX2ZsYWdzICYgKFZNX0lPIHwgVk1fUEZO
TUFQKSkpIHsKKwlyZXQgPSBwaW5fdXNlcl9wYWdlc19mYXN0KHN0YXJ0LCBucl9mcmFtZXMsCisJ
CQkJICBGT0xMX0ZPUkNFIHwgRk9MTF9XUklURSB8IEZPTExfTE9OR1RFUk0sCisJCQkJICAoc3Ry
dWN0IHBhZ2UgKiopKHZlYy0+cHRycykpOworCWlmIChyZXQgPiAwKSB7CiAJCXZlYy0+Z290X3Jl
ZiA9IHRydWU7CiAJCXZlYy0+aXNfcGZucyA9IGZhbHNlOwotCQlyZXQgPSBwaW5fdXNlcl9wYWdl
c19sb2NrZWQoc3RhcnQsIG5yX2ZyYW1lcywKLQkJCWd1cF9mbGFncywgKHN0cnVjdCBwYWdlICoq
KSh2ZWMtPnB0cnMpLCAmbG9ja2VkKTsKLQkJZ290byBvdXQ7CisJCWdvdG8gb3V0X3VubG9ja2Vk
OwogCX0KIAorCW1tYXBfcmVhZF9sb2NrKG1tKTsKIAl2ZWMtPmdvdF9yZWYgPSBmYWxzZTsKIAl2
ZWMtPmlzX3BmbnMgPSB0cnVlOwogCWRvIHsKIAkJdW5zaWduZWQgbG9uZyAqbnVtcyA9IGZyYW1l
X3ZlY3Rvcl9wZm5zKHZlYyk7CiAKKwkJdm1hID0gZmluZF92bWFfaW50ZXJzZWN0aW9uKG1tLCBz
dGFydCwgc3RhcnQgKyAxKTsKKwkJaWYgKCF2bWEpCisJCQlicmVhazsKKwogCQl3aGlsZSAocmV0
IDwgbnJfZnJhbWVzICYmIHN0YXJ0ICsgUEFHRV9TSVpFIDw9IHZtYS0+dm1fZW5kKSB7CiAJCQll
cnIgPSBmb2xsb3dfcGZuKHZtYSwgc3RhcnQsICZudW1zW3JldF0pOwogCQkJaWYgKGVycikgewpA
QCAtOTIsMTcgKzc2LDEzIEBAIGludCBnZXRfdmFkZHJfZnJhbWVzKHVuc2lnbmVkIGxvbmcgc3Rh
cnQsIHVuc2lnbmVkIGludCBucl9mcmFtZXMsCiAJCQlzdGFydCArPSBQQUdFX1NJWkU7CiAJCQly
ZXQrKzsKIAkJfQotCQkvKgotCQkgKiBXZSBzdG9wIGlmIHdlIGhhdmUgZW5vdWdoIHBhZ2VzIG9y
IGlmIFZNQSBkb2Vzbid0IGNvbXBsZXRlbHkKLQkJICogY292ZXIgdGhlIHRhaWwgcGFnZS4KLQkJ
ICovCi0JCWlmIChyZXQgPj0gbnJfZnJhbWVzIHx8IHN0YXJ0IDwgdm1hLT52bV9lbmQpCisJCS8q
IEJhaWwgb3V0IGlmIFZNQSBkb2Vzbid0IGNvbXBsZXRlbHkgY292ZXIgdGhlIHRhaWwgcGFnZS4g
Ki8KKwkJaWYgKHN0YXJ0IDwgdm1hLT52bV9lbmQpCiAJCQlicmVhazsKLQkJdm1hID0gZmluZF92
bWFfaW50ZXJzZWN0aW9uKG1tLCBzdGFydCwgc3RhcnQgKyAxKTsKLQl9IHdoaWxlICh2bWEgJiYg
dm1hLT52bV9mbGFncyAmIChWTV9JTyB8IFZNX1BGTk1BUCkpOworCX0gd2hpbGUgKHJldCA8IG5y
X2ZyYW1lcyk7CiBvdXQ6Ci0JaWYgKGxvY2tlZCkKLQkJbW1hcF9yZWFkX3VubG9jayhtbSk7CisJ
bW1hcF9yZWFkX3VubG9jayhtbSk7CitvdXRfdW5sb2NrZWQ6CiAJaWYgKCFyZXQpCiAJCXJldCA9
IC1FRkFVTFQ7CiAJaWYgKHJldCA+IDApCi0tIAoyLjI4LjAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
