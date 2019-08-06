Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB200845C5
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 09:27:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA93E6E652;
	Wed,  7 Aug 2019 07:26:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83FB76E581
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2019 23:16:18 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id n11so86410759qtl.5
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Aug 2019 16:16:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pkHeCt/hoSJAt//UHPk0X0I7hZeOiqjMeNu5wqmOhVU=;
 b=bDWs48CWWtvFFQ7P34qBk0GnxqMbWXFFKMcQvj2+bJx5gS00ZdilWhcGewEAwFzXMo
 Kqx4OLxxBkSB1iYAD+RtbjGIwH25yUsr85JeCI2HgOMKuzqp6U4i1mij9ycALHmr4GH+
 WqE96dWfJhXmMCRNDnvf+T6lmYaavDLgZPm04zjwRJ4Nit3u8mCrholqlmXyf5x+PoXA
 seORbhdzWU2ruHGZHfIbf22zFLBN2OeWh/pUUciOaAfygMGtrbhbh7jBUE1Sn9BKMTC2
 1kn9yt4FOvSVvUSDG5OSqpWMIGbVdKapzH0XWSsORaz5vxto7QP609r67d16G98kx7tk
 aDGw==
X-Gm-Message-State: APjAAAUkhQt9S0o6W3yrem1t0CNvieLqbytTs7QpPQMtW18EnGaqEkSv
 wzml5EOJ25SdGKezozW0Omvh/Q==
X-Google-Smtp-Source: APXvYqy6Nsusk0wHFyYvRxTipEB7NphBo9CKaHBj+WOx7SnMsQAhKID5TREjs8PZo1+pA73I5XbxVg==
X-Received: by 2002:ac8:2b01:: with SMTP id 1mr5497725qtu.177.1565133377682;
 Tue, 06 Aug 2019 16:16:17 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id r14sm36816958qkm.100.2019.08.06.16.16.14
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 06 Aug 2019 16:16:17 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hv8gg-0006fG-Jc; Tue, 06 Aug 2019 20:16:14 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: linux-mm@kvack.org
Subject: [PATCH v3 hmm 11/11] mm/mmu_notifiers: remove unregister_no_release
Date: Tue,  6 Aug 2019 20:15:48 -0300
Message-Id: <20190806231548.25242-12-jgg@ziepe.ca>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190806231548.25242-1-jgg@ziepe.ca>
References: <20190806231548.25242-1-jgg@ziepe.ca>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 07 Aug 2019 07:26:18 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pkHeCt/hoSJAt//UHPk0X0I7hZeOiqjMeNu5wqmOhVU=;
 b=EO1RyLd4d0AnXDRqElYRzxtyKz38WeGeNBRIkYdo+3VFgs/T0oIQs20Zy/5GKhTnqI
 UfyYPmrt29HX9vdxZVEwKEX/vOCaV33r4IcvjjLv+dvBVpY91WnTDcNJXzjaMgjBsFFt
 FdxAfV5Xk74BDXvs4obq2oP6Eu9zK7wtAWH8j4mJyF0Ged8Qf759ly97ojGQOxxLbF+m
 EBz8VKm2ELuy2OvTFchRCVHhBVH+J3NM3xKbJA1b+9RKe4syO0dO8Tpu7jcVbUS84W+G
 X1zRmwp67vSBaYZNs5bfg6X3fWLEdZzDSXoP+HJcr6VhTvigDkmOWFIoLfep3TCPpIME
 lbKg==
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

RnJvbTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgoKbW11X25vdGlmaWVyX3Vu
cmVnaXN0ZXJfbm9fcmVsZWFzZSgpIGFuZCBtbXVfbm90aWZpZXJfY2FsbF9zcmN1KCkgbm8KbG9u
Z2VyIGhhdmUgYW55IHVzZXJzLCB0aGV5IGhhdmUgYWxsIGJlZW4gY29udmVydGVkIHRvIHVzZQpt
bXVfbm90aWZpZXJfcHV0KCkuCgpTbyBkZWxldGUgdGhpcyBkaWZmaWN1bHQgdG8gdXNlIGludGVy
ZmFjZS4KClNpZ25lZC1vZmYtYnk6IEphc29uIEd1bnRob3JwZSA8amdnQG1lbGxhbm94LmNvbT4K
LS0tCiBpbmNsdWRlL2xpbnV4L21tdV9ub3RpZmllci5oIHwgIDUgLS0tLS0KIG1tL21tdV9ub3Rp
Zmllci5jICAgICAgICAgICAgfCAzMSAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAy
IGZpbGVzIGNoYW5nZWQsIDM2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGlu
dXgvbW11X25vdGlmaWVyLmggYi9pbmNsdWRlL2xpbnV4L21tdV9ub3RpZmllci5oCmluZGV4IDMx
YWE5NzEzMTVhMTQyLi41MjkyOWU1ZWY3MDgyNiAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9t
bXVfbm90aWZpZXIuaAorKysgYi9pbmNsdWRlL2xpbnV4L21tdV9ub3RpZmllci5oCkBAIC0yNzEs
OCArMjcxLDYgQEAgZXh0ZXJuIGludCBfX21tdV9ub3RpZmllcl9yZWdpc3RlcihzdHJ1Y3QgbW11
X25vdGlmaWVyICptbiwKIAkJCQkgICBzdHJ1Y3QgbW1fc3RydWN0ICptbSk7CiBleHRlcm4gdm9p
ZCBtbXVfbm90aWZpZXJfdW5yZWdpc3RlcihzdHJ1Y3QgbW11X25vdGlmaWVyICptbiwKIAkJCQkg
ICAgc3RydWN0IG1tX3N0cnVjdCAqbW0pOwotZXh0ZXJuIHZvaWQgbW11X25vdGlmaWVyX3VucmVn
aXN0ZXJfbm9fcmVsZWFzZShzdHJ1Y3QgbW11X25vdGlmaWVyICptbiwKLQkJCQkJICAgICAgIHN0
cnVjdCBtbV9zdHJ1Y3QgKm1tKTsKIGV4dGVybiB2b2lkIF9fbW11X25vdGlmaWVyX21tX2Rlc3Ry
b3koc3RydWN0IG1tX3N0cnVjdCAqbW0pOwogZXh0ZXJuIHZvaWQgX19tbXVfbm90aWZpZXJfcmVs
ZWFzZShzdHJ1Y3QgbW1fc3RydWN0ICptbSk7CiBleHRlcm4gaW50IF9fbW11X25vdGlmaWVyX2Ns
ZWFyX2ZsdXNoX3lvdW5nKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLApAQCAtNTEzLDkgKzUxMSw2IEBA
IHN0YXRpYyBpbmxpbmUgdm9pZCBtbXVfbm90aWZpZXJfcmFuZ2VfaW5pdChzdHJ1Y3QgbW11X25v
dGlmaWVyX3JhbmdlICpyYW5nZSwKIAlzZXRfcHRlX2F0KF9fX21tLCBfX19hZGRyZXNzLCBfX3B0
ZXAsIF9fX3B0ZSk7CQkJXAogfSkKIAotZXh0ZXJuIHZvaWQgbW11X25vdGlmaWVyX2NhbGxfc3Jj
dShzdHJ1Y3QgcmN1X2hlYWQgKnJjdSwKLQkJCQkgICB2b2lkICgqZnVuYykoc3RydWN0IHJjdV9o
ZWFkICpyY3UpKTsKLQogI2Vsc2UgLyogQ09ORklHX01NVV9OT1RJRklFUiAqLwogCiBzdHJ1Y3Qg
bW11X25vdGlmaWVyX3JhbmdlIHsKZGlmZiAtLWdpdCBhL21tL21tdV9ub3RpZmllci5jIGIvbW0v
bW11X25vdGlmaWVyLmMKaW5kZXggNGE3NzBiNTIxMWI3MWQuLjJlYzQ4ZjhiYTllMjg4IDEwMDY0
NAotLS0gYS9tbS9tbXVfbm90aWZpZXIuYworKysgYi9tbS9tbXVfbm90aWZpZXIuYwpAQCAtMjEs
MTggKzIxLDYgQEAKIC8qIGdsb2JhbCBTUkNVIGZvciBhbGwgTU1zICovCiBERUZJTkVfU1RBVElD
X1NSQ1Uoc3JjdSk7CiAKLS8qCi0gKiBUaGlzIGZ1bmN0aW9uIGFsbG93cyBtbXVfbm90aWZpZXI6
OnJlbGVhc2UgY2FsbGJhY2sgdG8gZGVsYXkgYSBjYWxsIHRvCi0gKiBhIGZ1bmN0aW9uIHRoYXQg
d2lsbCBmcmVlIGFwcHJvcHJpYXRlIHJlc291cmNlcy4gVGhlIGZ1bmN0aW9uIG11c3QgYmUKLSAq
IHF1aWNrIGFuZCBtdXN0IG5vdCBibG9jay4KLSAqLwotdm9pZCBtbXVfbm90aWZpZXJfY2FsbF9z
cmN1KHN0cnVjdCByY3VfaGVhZCAqcmN1LAotCQkJICAgIHZvaWQgKCpmdW5jKShzdHJ1Y3QgcmN1
X2hlYWQgKnJjdSkpCi17Ci0JY2FsbF9zcmN1KCZzcmN1LCByY3UsIGZ1bmMpOwotfQotRVhQT1JU
X1NZTUJPTF9HUEwobW11X25vdGlmaWVyX2NhbGxfc3JjdSk7Ci0KIC8qCiAgKiBUaGlzIGZ1bmN0
aW9uIGNhbid0IHJ1biBjb25jdXJyZW50bHkgYWdhaW5zdCBtbXVfbm90aWZpZXJfcmVnaXN0ZXIK
ICAqIGJlY2F1c2UgbW0tPm1tX3VzZXJzID4gMCBkdXJpbmcgbW11X25vdGlmaWVyX3JlZ2lzdGVy
IGFuZCBleGl0X21tYXAKQEAgLTQ1MywyNSArNDQxLDYgQEAgdm9pZCBtbXVfbm90aWZpZXJfdW5y
ZWdpc3RlcihzdHJ1Y3QgbW11X25vdGlmaWVyICptbiwgc3RydWN0IG1tX3N0cnVjdCAqbW0pCiB9
CiBFWFBPUlRfU1lNQk9MX0dQTChtbXVfbm90aWZpZXJfdW5yZWdpc3Rlcik7CiAKLS8qCi0gKiBT
YW1lIGFzIG1tdV9ub3RpZmllcl91bnJlZ2lzdGVyIGJ1dCBubyBjYWxsYmFjayBhbmQgbm8gc3Jj
dSBzeW5jaHJvbml6YXRpb24uCi0gKi8KLXZvaWQgbW11X25vdGlmaWVyX3VucmVnaXN0ZXJfbm9f
cmVsZWFzZShzdHJ1Y3QgbW11X25vdGlmaWVyICptbiwKLQkJCQkJc3RydWN0IG1tX3N0cnVjdCAq
bW0pCi17Ci0Jc3Bpbl9sb2NrKCZtbS0+bW11X25vdGlmaWVyX21tLT5sb2NrKTsKLQkvKgotCSAq
IENhbiBub3QgdXNlIGxpc3RfZGVsX3JjdSgpIHNpbmNlIF9fbW11X25vdGlmaWVyX3JlbGVhc2UK
LQkgKiBjYW4gZGVsZXRlIGl0IGJlZm9yZSB3ZSBob2xkIHRoZSBsb2NrLgotCSAqLwotCWhsaXN0
X2RlbF9pbml0X3JjdSgmbW4tPmhsaXN0KTsKLQlzcGluX3VubG9jaygmbW0tPm1tdV9ub3RpZmll
cl9tbS0+bG9jayk7Ci0KLQlCVUdfT04oYXRvbWljX3JlYWQoJm1tLT5tbV9jb3VudCkgPD0gMCk7
Ci0JbW1kcm9wKG1tKTsKLX0KLUVYUE9SVF9TWU1CT0xfR1BMKG1tdV9ub3RpZmllcl91bnJlZ2lz
dGVyX25vX3JlbGVhc2UpOwotCiBzdGF0aWMgdm9pZCBtbXVfbm90aWZpZXJfZnJlZV9yY3Uoc3Ry
dWN0IHJjdV9oZWFkICpyY3UpCiB7CiAJc3RydWN0IG1tdV9ub3RpZmllciAqbW4gPSBjb250YWlu
ZXJfb2YocmN1LCBzdHJ1Y3QgbW11X25vdGlmaWVyLCByY3UpOwotLSAKMi4yMi4wCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
