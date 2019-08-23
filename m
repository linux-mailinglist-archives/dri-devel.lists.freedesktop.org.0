Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6439B87B
	for <lists+dri-devel@lfdr.de>; Sat, 24 Aug 2019 00:18:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8DFE6ED5C;
	Fri, 23 Aug 2019 22:18:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF2606ED5C;
 Fri, 23 Aug 2019 22:18:11 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d6066230001>; Fri, 23 Aug 2019 15:18:11 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Fri, 23 Aug 2019 15:18:11 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Fri, 23 Aug 2019 15:18:11 -0700
Received: from HQMAIL110.nvidia.com (172.18.146.15) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 23 Aug
 2019 22:18:11 +0000
Received: from HQMAIL101.nvidia.com (172.20.187.10) by hqmail110.nvidia.com
 (172.18.146.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 23 Aug
 2019 22:18:09 +0000
Received: from hqnvemgw01.nvidia.com (172.20.150.20) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Fri, 23 Aug 2019 22:18:09 +0000
Received: from rcampbell-dev.nvidia.com (Not Verified[10.110.48.66]) by
 hqnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5d6066210001>; Fri, 23 Aug 2019 15:18:09 -0700
From: Ralph Campbell <rcampbell@nvidia.com>
To: <linux-mm@kvack.org>
Subject: [PATCH 2/2] mm/hmm: hmm_range_fault() infinite loop
Date: Fri, 23 Aug 2019 15:17:53 -0700
Message-ID: <20190823221753.2514-3-rcampbell@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190823221753.2514-1-rcampbell@nvidia.com>
References: <20190823221753.2514-1-rcampbell@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1566598691; bh=H0xCNFTKe9KT+REMj7c8+VZLGl6bVqw61h/FiyncJWs=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=Py/+nEgUIjhIZbSu7cNxlYuXfEoZik6c6x3VzsIs38x5i57ELvn5JRlErcGl1DLSm
 OPm61FMKufS0D/REIhl99DbtgwiyufGaCiuLtD8EtwBjFC2UWBQZpe9L/R3XF+LaCc
 pQYGZc/IOqyS2G+1GlYqg8wySXYGft4IwgvkW/lneMjxIKzhvyBTvhGlLWRH96F7be
 Fjkol1850wsIJiuiZ2VkFIBG8mjuuMqEH9je3XnpBUdEIlN96xf1lgzs2F34kKu7gW
 AU8/C52wqkZa4aBqUpmIEWGA90tAL+iwPA08Ennyfoh6kGscOu2VY2sukBo6VVT5Uz
 8g47hs3zUIkNw==
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
Cc: Ralph Campbell <rcampbell@nvidia.com>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, amd-gfx@lists.freedesktop.org,
 Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm9ybWFsbHksIGNhbGxlcnMgdG8gaGFuZGxlX21tX2ZhdWx0KCkgYXJlIHN1cHBvc2VkIHRvIGNo
ZWNrIHRoZQp2bWEtPnZtX2ZsYWdzIGZpcnN0LiBobW1fcmFuZ2VfZmF1bHQoKSBjaGVja3MgZm9y
IFZNX1JFQUQgYnV0IGRvZXNuJ3QKY2hlY2sgZm9yIFZNX1dSSVRFIGlmIHRoZSBjYWxsZXIgcmVx
dWVzdHMgYSBwYWdlIHRvIGJlIGZhdWx0ZWQgaW4Kd2l0aCB3cml0ZSBwZXJtaXNzaW9uICh2aWEg
dGhlIGhtbV9yYW5nZS5wZm5zW10gdmFsdWUpLgpJZiB0aGUgdm1hIGlzIHdyaXRlIHByb3RlY3Rl
ZCwgdGhpcyBjYW4gcmVzdWx0IGluIGFuIGluZmluaXRlIGxvb3A6CiAgaG1tX3JhbmdlX2ZhdWx0
KCkKICAgIHdhbGtfcGFnZV9yYW5nZSgpCiAgICAgIC4uLgogICAgICBobW1fdm1hX3dhbGtfaG9s
ZSgpCiAgICAgICAgaG1tX3ZtYV93YWxrX2hvbGVfKCkKICAgICAgICAgIGhtbV92bWFfZG9fZmF1
bHQoKQogICAgICAgICAgICBoYW5kbGVfbW1fZmF1bHQoRkFVTFRfRkxBR19XUklURSkKICAgICAg
ICAgICAgLyogcmV0dXJucyBWTV9GQVVMVF9XUklURSAqLwogICAgICAgICAgLyogcmV0dXJucyAt
RUJVU1kgKi8KICAgICAgICAvKiByZXR1cm5zIC1FQlVTWSAqLwogICAgICAvKiByZXR1cm5zIC1F
QlVTWSAqLwogICAgLyogbG9vcHMgb24gLUVCVVNZIGFuZCByYW5nZS0+dmFsaWQgKi8KUHJldmVu
dCB0aGlzIGJ5IGNoZWNraW5nIGZvciB2bWEtPnZtX2ZsYWdzICYgVk1fV1JJVEUgYmVmb3JlIGNh
bGxpbmcKaGFuZGxlX21tX2ZhdWx0KCkuCgpTaWduZWQtb2ZmLWJ5OiBSYWxwaCBDYW1wYmVsbCA8
cmNhbXBiZWxsQG52aWRpYS5jb20+Ci0tLQogbW0vaG1tLmMgfCAzICsrKwogMSBmaWxlIGNoYW5n
ZWQsIDMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL21tL2htbS5jIGIvbW0vaG1tLmMKaW5k
ZXggMjkzNzE0ODVmZTk0Li40ODgyYjgzYWVjY2IgMTAwNjQ0Ci0tLSBhL21tL2htbS5jCisrKyBi
L21tL2htbS5jCkBAIC0yOTIsNiArMjkyLDkgQEAgc3RhdGljIGludCBobW1fdm1hX3dhbGtfaG9s
ZV8odW5zaWduZWQgbG9uZyBhZGRyLCB1bnNpZ25lZCBsb25nIGVuZCwKIAlobW1fdm1hX3dhbGst
Pmxhc3QgPSBhZGRyOwogCWkgPSAoYWRkciAtIHJhbmdlLT5zdGFydCkgPj4gUEFHRV9TSElGVDsK
IAorCWlmICh3cml0ZV9mYXVsdCAmJiB3YWxrLT52bWEgJiYgISh3YWxrLT52bWEtPnZtX2ZsYWdz
ICYgVk1fV1JJVEUpKQorCQlyZXR1cm4gLUVQRVJNOworCiAJZm9yICg7IGFkZHIgPCBlbmQ7IGFk
ZHIgKz0gUEFHRV9TSVpFLCBpKyspIHsKIAkJcGZuc1tpXSA9IHJhbmdlLT52YWx1ZXNbSE1NX1BG
Tl9OT05FXTsKIAkJaWYgKGZhdWx0IHx8IHdyaXRlX2ZhdWx0KSB7Ci0tIAoyLjIwLjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
