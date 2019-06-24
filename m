Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 880E95245F
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 09:27:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFEA889F71;
	Tue, 25 Jun 2019 07:27:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4CA389B42
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 21:33:06 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id s3so734350wms.2
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 14:33:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LXLRo2PPKRMD0FsdNO4kvH6cJWSg4ysuh5L5UkxtS4c=;
 b=pIqzbuMoF9NYAyC1kqvLPsMAZ/rzPvaf6wrT3wEzwhE4Ipoze9Y4OeMkLXSxZ+56e4
 AG3iTbU6cgZhaVgmkFqEGtWB80d1qpUCFtGh8TUXQCSGtF5NbCC1S2pi2ThYIFHAsBO3
 MjtOIThsfu0K6CdH1L9mU6lVUdjs3vFmcmEZObV3WUWpbbgE5KKgG1PZ2wA11NxzbiJA
 pdtEYm9NFxd9nXh1UPLX3EDnYCOSkUh2eI+xPuzr5ccCSdQ9rqQucIWBfbJRjqMNnho6
 ATpXc+XXJVUS7kF3UGgLVXUxpUm9OOksv315rS7e5taJGxURqXxvm5gPQ0f2vk7WR6Dv
 EyhA==
X-Gm-Message-State: APjAAAUyT1zsodNFi5qC2e2sYFiB/z7cgNmQxLWzDyKTQQHVyGN3yjEd
 uTyTlsnSKgaKe4yFCmFYMs3dUA==
X-Google-Smtp-Source: APXvYqxpgSLdOjxG4AEMzxa4goOMrAbz+ND9ASIrtQwBg7DrjmWk1TBdaulquFyqhwOqbOtHtgBWrg==
X-Received: by 2002:a1c:407:: with SMTP id 7mr18250094wme.113.1561411985569;
 Mon, 24 Jun 2019 14:33:05 -0700 (PDT)
Received: from ziepe.ca ([66.187.232.66])
 by smtp.gmail.com with ESMTPSA id r4sm18908060wra.96.2019.06.24.14.33.04
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 24 Jun 2019 14:33:04 -0700 (PDT)
Received: from jgg by jggl.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hfW6C-0001MR-U4; Mon, 24 Jun 2019 18:02:00 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jerome Glisse <jglisse@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Felix.Kuehling@amd.com
Subject: [PATCH v4 hmm 06/12] mm/hmm: Do not use list*_rcu() for hmm->ranges
Date: Mon, 24 Jun 2019 18:01:04 -0300
Message-Id: <20190624210110.5098-7-jgg@ziepe.ca>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190624210110.5098-1-jgg@ziepe.ca>
References: <20190624210110.5098-1-jgg@ziepe.ca>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 25 Jun 2019 07:27:07 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LXLRo2PPKRMD0FsdNO4kvH6cJWSg4ysuh5L5UkxtS4c=;
 b=gMJNqHRIngzsRcDJSRqNGhhAFj5qszbwfHp7sWjkREH0cC5Wg+51IUv6Ztnp6y1sQJ
 4s8sZl4zFkpY3KIjUkN7OCuNT+5pVhM4Z9P2VYMGh6zz+dgJPGQTFMmyTF8pYefOKxHb
 RQC3U3vsTjMnbDULYbk6PEP2Dr94o6uyCpK8jOxwldZdOsr7VxS3+nUpYxsCXash5XQk
 7PaTVmaPpwPfDGC4tTkJn+amRntW1ha7ej9YjFLte5PbAElDu2HZyg7aDGR1mtYjhEC4
 a5es/TsjfPiC+icZkrWdCKcFqlYMm30vlAIazLUZsF/W2Ct6q9aWO4iYeVJJJbe9l0jw
 3AYQ==
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, Philip Yang <Philip.Yang@amd.com>,
 linux-rdma@vger.kernel.org, Ira Weiny <iweiny@intel.com>,
 amd-gfx@lists.freedesktop.org, Souptick Joarder <jrdr.linux@gmail.com>,
 linux-mm@kvack.org, Jason Gunthorpe <jgg@mellanox.com>,
 dri-devel@lists.freedesktop.org, Ira Weiny <ira.weiny@intel.com>,
 Christoph Hellwig <hch@lst.de>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgoKVGhpcyBsaXN0IGlzIGFs
d2F5cyByZWFkIGFuZCB3cml0dGVuIHdoaWxlIGhvbGRpbmcgaG1tLT5sb2NrIHNvIHRoZXJlIGlz
Cm5vIG5lZWQgZm9yIHRoZSBjb25mdXNpbmcgX3JjdSBhbm5vdGF0aW9ucy4KClNpZ25lZC1vZmYt
Ynk6IEphc29uIEd1bnRob3JwZSA8amdnQG1lbGxhbm94LmNvbT4KUmV2aWV3ZWQtYnk6IErDqXLD
tG1lIEdsaXNzZSA8amdsaXNzZUByZWRoYXQuY29tPgpSZXZpZXdlZC1ieTogSm9obiBIdWJiYXJk
IDxqaHViYmFyZEBudmlkaWEuY29tPgpBY2tlZC1ieTogU291cHRpY2sgSm9hcmRlciA8anJkci5s
aW51eEBnbWFpbC5jb20+ClJldmlld2VkLWJ5OiBSYWxwaCBDYW1wYmVsbCA8cmNhbXBiZWxsQG52
aWRpYS5jb20+ClJldmlld2VkLWJ5OiBJcmEgV2VpbnkgPGl3ZWlueUBpbnRlbC5jb20+ClJldmll
d2VkLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KVGVzdGVkLWJ5OiBQaGlsaXAg
WWFuZyA8UGhpbGlwLllhbmdAYW1kLmNvbT4KLS0tCiBtbS9obW0uYyB8IDQgKystLQogMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9t
bS9obW0uYyBiL21tL2htbS5jCmluZGV4IDA0MjNmNGNhM2E3ZTA5Li43M2M4YWY0ODI3ZmU4NyAx
MDA2NDQKLS0tIGEvbW0vaG1tLmMKKysrIGIvbW0vaG1tLmMKQEAgLTkxMiw3ICs5MTIsNyBAQCBp
bnQgaG1tX3JhbmdlX3JlZ2lzdGVyKHN0cnVjdCBobW1fcmFuZ2UgKnJhbmdlLAogCiAJcmFuZ2Ut
PmhtbSA9IGhtbTsKIAlrcmVmX2dldCgmaG1tLT5rcmVmKTsKLQlsaXN0X2FkZF9yY3UoJnJhbmdl
LT5saXN0LCAmaG1tLT5yYW5nZXMpOworCWxpc3RfYWRkKCZyYW5nZS0+bGlzdCwgJmhtbS0+cmFu
Z2VzKTsKIAogCS8qCiAJICogSWYgdGhlcmUgYXJlIGFueSBjb25jdXJyZW50IG5vdGlmaWVycyB3
ZSBoYXZlIHRvIHdhaXQgZm9yIHRoZW0gZm9yCkBAIC05NDIsNyArOTQyLDcgQEAgdm9pZCBobW1f
cmFuZ2VfdW5yZWdpc3RlcihzdHJ1Y3QgaG1tX3JhbmdlICpyYW5nZSkKIAkJcmV0dXJuOwogCiAJ
bXV0ZXhfbG9jaygmaG1tLT5sb2NrKTsKLQlsaXN0X2RlbF9yY3UoJnJhbmdlLT5saXN0KTsKKwls
aXN0X2RlbCgmcmFuZ2UtPmxpc3QpOwogCW11dGV4X3VubG9jaygmaG1tLT5sb2NrKTsKIAogCS8q
IERyb3AgcmVmZXJlbmNlIHRha2VuIGJ5IGhtbV9yYW5nZV9yZWdpc3RlcigpICovCi0tIAoyLjIy
LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
