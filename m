Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D74D845F2
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 09:28:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C28356E629;
	Wed,  7 Aug 2019 07:27:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70ACF6E588
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2019 23:16:16 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id k10so17287240qtq.1
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Aug 2019 16:16:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qo3M/m6bAMWNKeEf1KSsSvYS6KA/79bnXZ/MG9HQ7+c=;
 b=GmafdYEJGs1sOkuaFVJZGxUZCMPxvDiUAxk08ho3ApPWz5uD4Cs9dsDwmMDWTmctz1
 yj+QHDUX0SpeOmkCHxvHXGFSj65cfL02pQMbbM9dL1ejEFJa1GzW5ekp8dIy8IffwToK
 UYdFjyoBKR8lbEbgyuv1XM0u2flmG+GBY5RnO27iuIA1ck+2kt5DW1IaNbR2Zvz5+9Bv
 vojDyRwB/g7zli6wZ0/SIVaoNv/1JSFyXzLroObP5PTvvQ4NWX5yzBo+Drm2I9AKHfNH
 YQHefibR8JPES9Kz6jF//Db1BLZ7/vDpJVW5Pg5jexFkdc6RXLpeNUoqdKRyiDq4cYwD
 EcwQ==
X-Gm-Message-State: APjAAAUCQ6xSGy1dThoNi/EooHJfvwA+oSSIxakE+wXpt0ZpPIqS17kg
 5A+0oQ1AzJ/eZhypiuLyTSznDA==
X-Google-Smtp-Source: APXvYqwzSzqBhit7womFZned74qAW6JuvC+DaQssS9gJgppa+iNTQrGgfDRkcUg2AKLeoxFn+koswg==
X-Received: by 2002:a0c:ad6f:: with SMTP id v44mr5590212qvc.40.1565133375491; 
 Tue, 06 Aug 2019 16:16:15 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id l5sm38853627qte.9.2019.08.06.16.16.14
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 06 Aug 2019 16:16:14 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hv8gg-0006eL-1z; Tue, 06 Aug 2019 20:16:14 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: linux-mm@kvack.org
Subject: [PATCH v3 hmm 02/11] mm/mmu_notifiers: do not speculatively allocate
 a mmu_notifier_mm
Date: Tue,  6 Aug 2019 20:15:39 -0300
Message-Id: <20190806231548.25242-3-jgg@ziepe.ca>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190806231548.25242-1-jgg@ziepe.ca>
References: <20190806231548.25242-1-jgg@ziepe.ca>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 07 Aug 2019 07:26:18 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qo3M/m6bAMWNKeEf1KSsSvYS6KA/79bnXZ/MG9HQ7+c=;
 b=WIvITimiWkKwXR9MAnwvbjPd/jMGoFdgSbKJFYsFUTclr60pQsMdghZmIOiCh5YXC0
 UttFPobZS06cPlOZT0PF7D3HVksfWxSV4t/CAk8TXFyUTmugFgIF0+8oo8kipepx+JH2
 FaOArh02dXo+Kn1J1o19Ll/t6xFzUWU5L8C0euhgPJsWnHYPCsSB+yc+FHlEmVCAuX1U
 +F5OWyMlJ9C8l6nJvwq0WdkKMN98R7WVkx30edRvtFR93R5JGnJIrzkZgNRu9P36xdgz
 ULUtU6UxEUUqnG9agwf1nN+Htatwu+jA9bbrHaEueg4ngKDbsCMWsyahgp9VLjoDhgxe
 +acQ==
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
Cc: Andrea Arcangeli <aarcange@redhat.com>,
 Ralph Campbell <rcampbell@nvidia.com>, Dimitri Sivanich <sivanich@sgi.com>,
 Gavin Shan <shangw@linux.vnet.ibm.com>, Andrea Righi <andrea@betterlinux.com>,
 linux-rdma@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 iommu@lists.linux-foundation.org, amd-gfx@lists.freedesktop.org,
 Jason Gunthorpe <jgg@mellanox.com>, Alex Deucher <alexander.deucher@amd.com>,
 intel-gfx@lists.freedesktop.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgoKQSBwcmlvciBjb21taXQg
ZTBmM2MzZjc4ZGEyICgibW0vbW11X25vdGlmaWVyOiBpbml0IG5vdGlmaWVyIGlmIG5lY2Vzc2Fy
eSIpCm1hZGUgYW4gYXR0ZW1wdCBhdCBkb2luZyB0aGlzLCBidXQgaGFkIHRvIGJlIHJldmVydGVk
IGFzIGNhbGxpbmcKdGhlIEdGUF9LRVJORUwgYWxsb2NhdG9yIHVuZGVyIHRoZSBpX21tYXBfbXV0
ZXggY2F1c2VzIGRlYWRsb2NrLCBzZWUKY29tbWl0IDM1Y2ZhMmIwYjQ5MSAoIm1tL21tdV9ub3Rp
ZmllcjogYWxsb2NhdGUgbW11X25vdGlmaWVyIGluIGFkdmFuY2UiKS4KCkhvd2V2ZXIsIHdlIGNh
biBhdm9pZCB0aGF0IHByb2JsZW0gYnkgZG9pbmcgdGhlIGFsbG9jYXRpb24gb25seSB1bmRlcgp0
aGUgbW1hcF9zZW0sIHdoaWNoIGlzIGFscmVhZHkgaGFwcGVuaW5nLgoKU2luY2UgYWxsIHdyaXRl
cnMgdG8gbW0tPm1tdV9ub3RpZmllcl9tbSBob2xkIHRoZSB3cml0ZSBzaWRlIG9mIHRoZQptbWFw
X3NlbSByZWFkaW5nIGl0IHVuZGVyIHRoYXQgc2VtIGlzIGRldGVybWluaXN0aWMgYW5kIHdlIGNh
biB1c2UgdGhhdCB0bwpkZWNpZGUgaWYgdGhlIGFsbG9jYXRpb24gcGF0aCBpcyByZXF1aXJlZCwg
d2l0aG91dCBzcGVjdWxhdGlvbi4KClRoZSBhY3R1YWwgdXBkYXRlIHRvIG1tdV9ub3RpZmllcl9t
bSBtdXN0IHN0aWxsIGJlIGRvbmUgdW5kZXIgdGhlCm1tX3Rha2VfYWxsX2xvY2tzKCkgdG8gZW5z
dXJlIHJlYWQtc2lkZSBjb2hlcmVuY3kuCgpTaWduZWQtb2ZmLWJ5OiBKYXNvbiBHdW50aG9ycGUg
PGpnZ0BtZWxsYW5veC5jb20+Ci0tLQogbW0vbW11X25vdGlmaWVyLmMgfCAzNCArKysrKysrKysr
KysrKysrKysrKysrLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygr
KSwgMTIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvbW0vbW11X25vdGlmaWVyLmMgYi9tbS9t
bXVfbm90aWZpZXIuYwppbmRleCAyMThhNmYxMDhiYzJkMC4uNjk2ODEwZjYzMmFkZTEgMTAwNjQ0
Ci0tLSBhL21tL21tdV9ub3RpZmllci5jCisrKyBiL21tL21tdV9ub3RpZmllci5jCkBAIC0yNDIs
MjcgKzI0MiwzMiBAQCBFWFBPUlRfU1lNQk9MX0dQTChfX21tdV9ub3RpZmllcl9pbnZhbGlkYXRl
X3JhbmdlKTsKICAqLwogaW50IF9fbW11X25vdGlmaWVyX3JlZ2lzdGVyKHN0cnVjdCBtbXVfbm90
aWZpZXIgKm1uLCBzdHJ1Y3QgbW1fc3RydWN0ICptbSkKIHsKLQlzdHJ1Y3QgbW11X25vdGlmaWVy
X21tICptbXVfbm90aWZpZXJfbW07CisJc3RydWN0IG1tdV9ub3RpZmllcl9tbSAqbW11X25vdGlm
aWVyX21tID0gTlVMTDsKIAlpbnQgcmV0OwogCiAJbG9ja2RlcF9hc3NlcnRfaGVsZF93cml0ZSgm
bW0tPm1tYXBfc2VtKTsKIAlCVUdfT04oYXRvbWljX3JlYWQoJm1tLT5tbV91c2VycykgPD0gMCk7
CiAKLQltbXVfbm90aWZpZXJfbW0gPSBrbWFsbG9jKHNpemVvZihzdHJ1Y3QgbW11X25vdGlmaWVy
X21tKSwgR0ZQX0tFUk5FTCk7Ci0JaWYgKHVubGlrZWx5KCFtbXVfbm90aWZpZXJfbW0pKQotCQly
ZXR1cm4gLUVOT01FTTsKKwlpZiAoIW1tLT5tbXVfbm90aWZpZXJfbW0pIHsKKwkJLyoKKwkJICog
a21hbGxvYyBjYW5ub3QgYmUgY2FsbGVkIHVuZGVyIG1tX3Rha2VfYWxsX2xvY2tzKCksIGJ1dCB3
ZQorCQkgKiBrbm93IHRoYXQgbW0tPm1tdV9ub3RpZmllcl9tbSBjYW4ndCBjaGFuZ2Ugd2hpbGUg
d2UgaG9sZAorCQkgKiB0aGUgd3JpdGUgc2lkZSBvZiB0aGUgbW1hcF9zZW0uCisJCSAqLworCQlt
bXVfbm90aWZpZXJfbW0gPQorCQkJa21hbGxvYyhzaXplb2Yoc3RydWN0IG1tdV9ub3RpZmllcl9t
bSksIEdGUF9LRVJORUwpOworCQlpZiAoIW1tdV9ub3RpZmllcl9tbSkKKwkJCXJldHVybiAtRU5P
TUVNOworCisJCUlOSVRfSExJU1RfSEVBRCgmbW11X25vdGlmaWVyX21tLT5saXN0KTsKKwkJc3Bp
bl9sb2NrX2luaXQoJm1tdV9ub3RpZmllcl9tbS0+bG9jayk7CisJfQogCiAJcmV0ID0gbW1fdGFr
ZV9hbGxfbG9ja3MobW0pOwogCWlmICh1bmxpa2VseShyZXQpKQogCQlnb3RvIG91dF9jbGVhbjsK
IAotCWlmICghbW1faGFzX25vdGlmaWVycyhtbSkpIHsKLQkJSU5JVF9ITElTVF9IRUFEKCZtbXVf
bm90aWZpZXJfbW0tPmxpc3QpOwotCQlzcGluX2xvY2tfaW5pdCgmbW11X25vdGlmaWVyX21tLT5s
b2NrKTsKLQotCQltbS0+bW11X25vdGlmaWVyX21tID0gbW11X25vdGlmaWVyX21tOwotCQltbXVf
bm90aWZpZXJfbW0gPSBOVUxMOwotCX0KKwkvKiBQYWlycyB3aXRoIHRoZSBtbWRyb3AgaW4gbW11
X25vdGlmaWVyX3VucmVnaXN0ZXJfKiAqLwogCW1tZ3JhYihtbSk7CiAKIAkvKgpAQCAtMjczLDE0
ICsyNzgsMTkgQEAgaW50IF9fbW11X25vdGlmaWVyX3JlZ2lzdGVyKHN0cnVjdCBtbXVfbm90aWZp
ZXIgKm1uLCBzdHJ1Y3QgbW1fc3RydWN0ICptbSkKIAkgKiBXZSBjYW4ndCByYWNlIGFnYWluc3Qg
YW55IG90aGVyIG1tdSBub3RpZmllciBtZXRob2QgZWl0aGVyCiAJICogdGhhbmtzIHRvIG1tX3Rh
a2VfYWxsX2xvY2tzKCkuCiAJICovCisJaWYgKG1tdV9ub3RpZmllcl9tbSkKKwkJbW0tPm1tdV9u
b3RpZmllcl9tbSA9IG1tdV9ub3RpZmllcl9tbTsKKwogCXNwaW5fbG9jaygmbW0tPm1tdV9ub3Rp
Zmllcl9tbS0+bG9jayk7CiAJaGxpc3RfYWRkX2hlYWRfcmN1KCZtbi0+aGxpc3QsICZtbS0+bW11
X25vdGlmaWVyX21tLT5saXN0KTsKIAlzcGluX3VubG9jaygmbW0tPm1tdV9ub3RpZmllcl9tbS0+
bG9jayk7CiAKIAltbV9kcm9wX2FsbF9sb2NrcyhtbSk7CisJQlVHX09OKGF0b21pY19yZWFkKCZt
bS0+bW1fdXNlcnMpIDw9IDApOworCXJldHVybiAwOworCiBvdXRfY2xlYW46CiAJa2ZyZWUobW11
X25vdGlmaWVyX21tKTsKLQlCVUdfT04oYXRvbWljX3JlYWQoJm1tLT5tbV91c2VycykgPD0gMCk7
CiAJcmV0dXJuIHJldDsKIH0KIEVYUE9SVF9TWU1CT0xfR1BMKF9fbW11X25vdGlmaWVyX3JlZ2lz
dGVyKTsKLS0gCjIuMjIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
