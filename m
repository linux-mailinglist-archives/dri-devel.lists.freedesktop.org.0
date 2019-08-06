Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C691B845CA
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 09:27:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3E836E663;
	Wed,  7 Aug 2019 07:26:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6B026E589
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2019 23:16:18 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id d23so86477248qto.2
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Aug 2019 16:16:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6NUFqlMBKMBn5vDhbmYDSPrCJfAHH+vuZmJm73vmPZ4=;
 b=XsxeMgzsAkAhJsLSwjnQd6c7xUujmfmoR5BOYbzagk7JVIUkWChV14iO6GBLG0ZAoU
 xZL4EXRuj+OEGL7H5Q5Sq1ERxgSMLg2+0om05XYZCGH3anmlv50tEpvJCrUTqyTlbSz8
 nV2vmGPRQhzwOrbFLTMFWGoP574iOviAhFaUOq1t+WssbUYsyTuRsOviDAh7vGDoVox4
 vocg6P1gtmDX6/Mm+RwGXQvh8cN4efxjHLDAYEaMAbZRJ0f2PbKEA8TmQLMTJG4qs4X8
 ihW0K2NEdbDNGzmIGbLBN+QEaacgtc/HFcX6a1BcsbPnU5p9xowhG79JjcgH4rEGirt+
 A22g==
X-Gm-Message-State: APjAAAW0r8yWklNvOWLtfWinIQkCcdsEV4V7ql9Vg35f3wYJ/j1GD2Kw
 aupH8CxluYw+/OkX/sL904R+Aw==
X-Google-Smtp-Source: APXvYqzyRI5TBbiUa5tyo3mkBzAmzYq9JR3/ocS4Z9Tm5ZTYPwm7qYeGZqLl/Ddc4+CKmoOUg5XVtQ==
X-Received: by 2002:ac8:270e:: with SMTP id g14mr5557862qtg.65.1565133377937; 
 Tue, 06 Aug 2019 16:16:17 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id y9sm37771754qki.116.2019.08.06.16.16.14
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 06 Aug 2019 16:16:17 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hv8gg-0006fA-Hu; Tue, 06 Aug 2019 20:16:14 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: linux-mm@kvack.org
Subject: [PATCH v3 hmm 10/11] drm/amdkfd: use mmu_notifier_put
Date: Tue,  6 Aug 2019 20:15:47 -0300
Message-Id: <20190806231548.25242-11-jgg@ziepe.ca>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190806231548.25242-1-jgg@ziepe.ca>
References: <20190806231548.25242-1-jgg@ziepe.ca>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 07 Aug 2019 07:26:18 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6NUFqlMBKMBn5vDhbmYDSPrCJfAHH+vuZmJm73vmPZ4=;
 b=LfRTCxlqNIR4uH7LAgvFKd3/HUW6EIX8oEHk8vRJZDXfu+MODxUjSc0mwQLjdlj1r5
 TdBQZiQ/h32bzsTmZvXIlzRhFHn0mmy0idj25YbeDts1A24fsEifBIe3NP5hqVvkvhrR
 nWWVKtWYfgjQk2Um2/MKR8gMUgvqui+DvGzyTcwS1oxYmThfLcGfOjUwJchzx5IQFtkm
 39y5spX//3k4QzhKIKnxJHNlnrtBxmpACeuwQvwhJuooM9+kRZCHN9wt4AYFAx6mZGXI
 dWzRId28bdIuuoDxYm8FkG1fzostiVkDLyxOWPmcJ25bAgDrnqB6r/Lbc3/r/c8WbtlX
 CAIw==
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

RnJvbTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgoKVGhlIHNlcXVlbmNlIG9m
IG1tdV9ub3RpZmllcl91bnJlZ2lzdGVyX25vX3JlbGVhc2UoKSwKbW11X25vdGlmaWVyX2NhbGxf
c3JjdSgpIGlzIGlkZW50aWNhbCB0byBtbXVfbm90aWZpZXJfcHV0KCkgd2l0aCB0aGUKZnJlZV9u
b3RpZmllciBjYWxsYmFjay4KCkFzIHRoaXMgaXMgdGhlIGxhc3QgdXNlciBvZiB0aG9zZSBBUElz
LCBjb252ZXJ0aW5nIGl0IG1lYW5zIHdlIGNhbiBkcm9wCnRoZW0uCgpTaWduZWQtb2ZmLWJ5OiBK
YXNvbiBHdW50aG9ycGUgPGpnZ0BtZWxsYW5veC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRrZmQva2ZkX3ByaXYuaCAgICB8ICAzIC0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRr
ZmQva2ZkX3Byb2Nlc3MuYyB8IDEwICsrKystLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNl
cnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQoKSSdtIHJlYWxseSBub3Qgc3VyZSB3aGF0IHRoaXMg
aXMgZG9pbmcsIGJ1dCBpdCBpcyB2ZXJ5IHN0cmFuZ2UgdG8gaGF2ZSBhCnJlbGVhc2Ugd2l0aCBu
byBvdGhlciBjYWxsYmFjay4gSXQgd291bGQgYmUgZ29vZCBpZiB0aGlzIHdvdWxkIGNoYW5nZSB0
byB1c2UKZ2V0IGFzIHdlbGwuCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRr
ZmQva2ZkX3ByaXYuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wcml2LmgKaW5k
ZXggMzkzM2ZiNmEzNzFlZmIuLjk0NTBlMjBkMTcwOTNiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJpdi5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
a2ZkL2tmZF9wcml2LmgKQEAgLTY4Niw5ICs2ODYsNiBAQCBzdHJ1Y3Qga2ZkX3Byb2Nlc3Mgewog
CS8qIFdlIHdhbnQgdG8gcmVjZWl2ZSBhIG5vdGlmaWNhdGlvbiB3aGVuIHRoZSBtbV9zdHJ1Y3Qg
aXMgZGVzdHJveWVkICovCiAJc3RydWN0IG1tdV9ub3RpZmllciBtbXVfbm90aWZpZXI7CiAKLQkv
KiBVc2UgZm9yIGRlbGF5ZWQgZnJlZWluZyBvZiBrZmRfcHJvY2VzcyBzdHJ1Y3R1cmUgKi8KLQlz
dHJ1Y3QgcmN1X2hlYWQJcmN1OwotCiAJdW5zaWduZWQgaW50IHBhc2lkOwogCXVuc2lnbmVkIGlu
dCBkb29yYmVsbF9pbmRleDsKIApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRr
ZmQva2ZkX3Byb2Nlc3MuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wcm9jZXNz
LmMKaW5kZXggYzA2ZTYxOTBmMjFmZmEuLmU1ZTMyNmYyZjI2NzVlIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJvY2Vzcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1ka2ZkL2tmZF9wcm9jZXNzLmMKQEAgLTQ4NiwxMSArNDg2LDkgQEAgc3RhdGljIHZv
aWQga2ZkX3Byb2Nlc3NfcmVmX3JlbGVhc2Uoc3RydWN0IGtyZWYgKnJlZikKIAlxdWV1ZV93b3Jr
KGtmZF9wcm9jZXNzX3dxLCAmcC0+cmVsZWFzZV93b3JrKTsKIH0KIAotc3RhdGljIHZvaWQga2Zk
X3Byb2Nlc3NfZGVzdHJveV9kZWxheWVkKHN0cnVjdCByY3VfaGVhZCAqcmN1KQorc3RhdGljIHZv
aWQga2ZkX3Byb2Nlc3NfZnJlZV9ub3RpZmllcihzdHJ1Y3QgbW11X25vdGlmaWVyICptbikKIHsK
LQlzdHJ1Y3Qga2ZkX3Byb2Nlc3MgKnAgPSBjb250YWluZXJfb2YocmN1LCBzdHJ1Y3Qga2ZkX3By
b2Nlc3MsIHJjdSk7Ci0KLQlrZmRfdW5yZWZfcHJvY2VzcyhwKTsKKwlrZmRfdW5yZWZfcHJvY2Vz
cyhjb250YWluZXJfb2YobW4sIHN0cnVjdCBrZmRfcHJvY2VzcywgbW11X25vdGlmaWVyKSk7CiB9
CiAKIHN0YXRpYyB2b2lkIGtmZF9wcm9jZXNzX25vdGlmaWVyX3JlbGVhc2Uoc3RydWN0IG1tdV9u
b3RpZmllciAqbW4sCkBAIC01NDIsMTIgKzU0MCwxMiBAQCBzdGF0aWMgdm9pZCBrZmRfcHJvY2Vz
c19ub3RpZmllcl9yZWxlYXNlKHN0cnVjdCBtbXVfbm90aWZpZXIgKm1uLAogCiAJbXV0ZXhfdW5s
b2NrKCZwLT5tdXRleCk7CiAKLQltbXVfbm90aWZpZXJfdW5yZWdpc3Rlcl9ub19yZWxlYXNlKCZw
LT5tbXVfbm90aWZpZXIsIG1tKTsKLQltbXVfbm90aWZpZXJfY2FsbF9zcmN1KCZwLT5yY3UsICZr
ZmRfcHJvY2Vzc19kZXN0cm95X2RlbGF5ZWQpOworCW1tdV9ub3RpZmllcl9wdXQoJnAtPm1tdV9u
b3RpZmllcik7CiB9CiAKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbW11X25vdGlmaWVyX29wcyBrZmRf
cHJvY2Vzc19tbXVfbm90aWZpZXJfb3BzID0gewogCS5yZWxlYXNlID0ga2ZkX3Byb2Nlc3Nfbm90
aWZpZXJfcmVsZWFzZSwKKwkuZnJlZV9ub3RpZmllciA9IGtmZF9wcm9jZXNzX2ZyZWVfbm90aWZp
ZXIsCiB9OwogCiBzdGF0aWMgaW50IGtmZF9wcm9jZXNzX2luaXRfY3dzcl9hcHUoc3RydWN0IGtm
ZF9wcm9jZXNzICpwLCBzdHJ1Y3QgZmlsZSAqZmlsZXApCi0tIAoyLjIyLjAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
