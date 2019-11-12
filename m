Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B74CDF83E5
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 01:07:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EABA6EA02;
	Tue, 12 Nov 2019 00:07:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 069266EA04
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 00:07:08 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dc9f7730001>; Mon, 11 Nov 2019 16:06:11 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 11 Nov 2019 16:07:07 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 11 Nov 2019 16:07:07 -0800
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 12 Nov
 2019 00:07:07 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Tue, 12 Nov 2019 00:07:06 +0000
Received: from blueforge.nvidia.com (Not Verified[10.110.48.28]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5dc9f7a90000>; Mon, 11 Nov 2019 16:07:06 -0800
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 03/23] mm/gup: move try_get_compound_head() to top,
 fix minor issues
Date: Mon, 11 Nov 2019 16:06:40 -0800
Message-ID: <20191112000700.3455038-4-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191112000700.3455038-1-jhubbard@nvidia.com>
References: <20191112000700.3455038-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1573517171; bh=5vGfYGjp3s6bW36xq9/Bb46iugaNKE7HlOm7HXQ5wWg=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=GkDH7li9lP7A/uMpxLR/P9FNhMq8JTTMAN0SWpbrJSFjXGyR/2s9DlCPum2PGa7jS
 5drAJ2N47vT5h8NKUbzJDgy+l4lgeEnj4eGWzvzqlIlYp5/bn++aheJOdFNX7wAfGI
 JFW0BhIXxLq2jL3t1c2FtH1mVrBDrEARcO31SdbgzvbdMembdb9e6J0rVv0+jswL2Q
 m9MWfxq3HHmN1Dge0LLpO6W3G+XeMFrpoGnRwBReM/8tedKtKrqPaeNLNp5pGfn99+
 Rf4dT9miWLuHEHaykyiWZaS9DgnEPoNCck1Vo5IUhU1r8GP2qmo/PaOTok7Cj6p+9F
 d9k7VvHI1voLg==
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
Cc: Michal Hocko <mhocko@suse.com>, Jan Kara <jack@suse.cz>,
 kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 linux-kselftest@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@suse.cz>,
 =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 John Hubbard <jhubbard@nvidia.com>, linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW4gdXBjb21pbmcgcGF0Y2ggdXNlcyB0cnlfZ2V0X2NvbXBvdW5kX2hlYWQoKSBtb3JlIHdpZGVs
eSwKc28gbW92ZSBpdCB0byB0aGUgdG9wIG9mIGd1cC5jLgoKQWxzbyBmaXggYSB0aW55IHNwZWxs
aW5nIGVycm9yIGFuZCBhIGNoZWNrcGF0Y2gucGwgd2FybmluZy4KClNpZ25lZC1vZmYtYnk6IEpv
aG4gSHViYmFyZCA8amh1YmJhcmRAbnZpZGlhLmNvbT4KLS0tCiBtbS9ndXAuYyB8IDI5ICsrKysr
KysrKysrKysrKy0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygr
KSwgMTQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvbW0vZ3VwLmMgYi9tbS9ndXAuYwppbmRl
eCAxOTlkYTk5ZThmZmMuLjkzMzUyNGRlNjI0OSAxMDA2NDQKLS0tIGEvbW0vZ3VwLmMKKysrIGIv
bW0vZ3VwLmMKQEAgLTI5LDYgKzI5LDIxIEBAIHN0cnVjdCBmb2xsb3dfcGFnZV9jb250ZXh0IHsK
IAl1bnNpZ25lZCBpbnQgcGFnZV9tYXNrOwogfTsKIAorLyoKKyAqIFJldHVybiB0aGUgY29tcG91
bmQgaGVhZCBwYWdlIHdpdGggcmVmIGFwcHJvcHJpYXRlbHkgaW5jcmVtZW50ZWQsCisgKiBvciBO
VUxMIGlmIHRoYXQgZmFpbGVkLgorICovCitzdGF0aWMgaW5saW5lIHN0cnVjdCBwYWdlICp0cnlf
Z2V0X2NvbXBvdW5kX2hlYWQoc3RydWN0IHBhZ2UgKnBhZ2UsIGludCByZWZzKQoreworCXN0cnVj
dCBwYWdlICpoZWFkID0gY29tcG91bmRfaGVhZChwYWdlKTsKKworCWlmIChXQVJOX09OX09OQ0Uo
cGFnZV9yZWZfY291bnQoaGVhZCkgPCAwKSkKKwkJcmV0dXJuIE5VTEw7CisJaWYgKHVubGlrZWx5
KCFwYWdlX2NhY2hlX2FkZF9zcGVjdWxhdGl2ZShoZWFkLCByZWZzKSkpCisJCXJldHVybiBOVUxM
OworCXJldHVybiBoZWFkOworfQorCiAvKioKICAqIHB1dF91c2VyX3BhZ2VzX2RpcnR5X2xvY2so
KSAtIHJlbGVhc2UgYW5kIG9wdGlvbmFsbHkgZGlydHkgZ3VwLXBpbm5lZCBwYWdlcwogICogQHBh
Z2VzOiAgYXJyYXkgb2YgcGFnZXMgdG8gYmUgbWF5YmUgbWFya2VkIGRpcnR5LCBhbmQgZGVmaW5p
dGVseSByZWxlYXNlZC4KQEAgLTE3OTMsMjAgKzE4MDgsNiBAQCBzdGF0aWMgdm9pZCBfX21heWJl
X3VudXNlZCB1bmRvX2Rldl9wYWdlbWFwKGludCAqbnIsIGludCBucl9zdGFydCwKIAl9CiB9CiAK
LS8qCi0gKiBSZXR1cm4gdGhlIGNvbXB1bmQgaGVhZCBwYWdlIHdpdGggcmVmIGFwcHJvcHJpYXRl
bHkgaW5jcmVtZW50ZWQsCi0gKiBvciBOVUxMIGlmIHRoYXQgZmFpbGVkLgotICovCi1zdGF0aWMg
aW5saW5lIHN0cnVjdCBwYWdlICp0cnlfZ2V0X2NvbXBvdW5kX2hlYWQoc3RydWN0IHBhZ2UgKnBh
Z2UsIGludCByZWZzKQotewotCXN0cnVjdCBwYWdlICpoZWFkID0gY29tcG91bmRfaGVhZChwYWdl
KTsKLQlpZiAoV0FSTl9PTl9PTkNFKHBhZ2VfcmVmX2NvdW50KGhlYWQpIDwgMCkpCi0JCXJldHVy
biBOVUxMOwotCWlmICh1bmxpa2VseSghcGFnZV9jYWNoZV9hZGRfc3BlY3VsYXRpdmUoaGVhZCwg
cmVmcykpKQotCQlyZXR1cm4gTlVMTDsKLQlyZXR1cm4gaGVhZDsKLX0KLQogI2lmZGVmIENPTkZJ
R19BUkNIX0hBU19QVEVfU1BFQ0lBTAogc3RhdGljIGludCBndXBfcHRlX3JhbmdlKHBtZF90IHBt
ZCwgdW5zaWduZWQgbG9uZyBhZGRyLCB1bnNpZ25lZCBsb25nIGVuZCwKIAkJCSB1bnNpZ25lZCBp
bnQgZmxhZ3MsIHN0cnVjdCBwYWdlICoqcGFnZXMsIGludCAqbnIpCi0tIAoyLjI0LjAKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
