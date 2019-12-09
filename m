Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE761179EA
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 23:54:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 550B16E593;
	Mon,  9 Dec 2019 22:53:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 640C46E598
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2019 22:53:54 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5deed06d0000>; Mon, 09 Dec 2019 14:53:33 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Mon, 09 Dec 2019 14:53:53 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Mon, 09 Dec 2019 14:53:53 -0800
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 9 Dec
 2019 22:53:52 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Mon, 9 Dec 2019 22:53:52 +0000
Received: from blueforge.nvidia.com (Not Verified[10.110.48.28]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5deed07f0000>; Mon, 09 Dec 2019 14:53:51 -0800
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v8 02/26] mm/gup: move try_get_compound_head() to top,
 fix minor issues
Date: Mon, 9 Dec 2019 14:53:20 -0800
Message-ID: <20191209225344.99740-3-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191209225344.99740-1-jhubbard@nvidia.com>
References: <20191209225344.99740-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1575932013; bh=JKnh6awNMnXx+WkfJCjCpP/dD2pEJJn8AxQ3IWMhLGw=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=H8F+py7OJnpL8A06NkjbNZin8sp956HwukSz8pHwfu5YYApnsY/SoK/b78h/wM/+6
 cDGcfhkIBOMkZoxY4d1oTCJZgpaVHl4HlVCtx2N6YVn6sivI3J4zVtkb9PRDY66fJ4
 nHIvfMeGpepw6ge1So0iIfjHY0XdgC/J9zQCZVb/6xSLGPTaaHfPYTRhvz9zsj5Xpl
 UwHcJx6dSjFQlaamtEWXp9ZPDApCwhESJkve70LStuJAnOAx+fMIP6TKnKKYSUBp93
 kLoWnyp1IXKruC/5blL1HkXlMDFMldbqn4hgTTFrRKaXaUlwd+NOTmSlxWyI7vLa4m
 WQzbdoDYrKYJQ==
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
 Christoph Hellwig <hch@lst.de>, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Vlastimil Babka <vbabka@suse.cz>,
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
aW5nIGVycm9yIGFuZCBhIGNoZWNrcGF0Y2gucGwgd2FybmluZy4KClJldmlld2VkLWJ5OiBDaHJp
c3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KUmV2aWV3ZWQtYnk6IEphbiBLYXJhIDxqYWNrQHN1
c2UuY3o+ClJldmlld2VkLWJ5OiBJcmEgV2VpbnkgPGlyYS53ZWlueUBpbnRlbC5jb20+ClNpZ25l
ZC1vZmYtYnk6IEpvaG4gSHViYmFyZCA8amh1YmJhcmRAbnZpZGlhLmNvbT4KLS0tCiBtbS9ndXAu
YyB8IDI5ICsrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTUg
aW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvbW0vZ3VwLmMgYi9t
bS9ndXAuYwppbmRleCBmNzY0NDMyOTE0YzQuLjNlY2NlMjk3YTQ3ZiAxMDA2NDQKLS0tIGEvbW0v
Z3VwLmMKKysrIGIvbW0vZ3VwLmMKQEAgLTI5LDYgKzI5LDIxIEBAIHN0cnVjdCBmb2xsb3dfcGFn
ZV9jb250ZXh0IHsKIAl1bnNpZ25lZCBpbnQgcGFnZV9tYXNrOwogfTsKIAorLyoKKyAqIFJldHVy
biB0aGUgY29tcG91bmQgaGVhZCBwYWdlIHdpdGggcmVmIGFwcHJvcHJpYXRlbHkgaW5jcmVtZW50
ZWQsCisgKiBvciBOVUxMIGlmIHRoYXQgZmFpbGVkLgorICovCitzdGF0aWMgaW5saW5lIHN0cnVj
dCBwYWdlICp0cnlfZ2V0X2NvbXBvdW5kX2hlYWQoc3RydWN0IHBhZ2UgKnBhZ2UsIGludCByZWZz
KQoreworCXN0cnVjdCBwYWdlICpoZWFkID0gY29tcG91bmRfaGVhZChwYWdlKTsKKworCWlmIChX
QVJOX09OX09OQ0UocGFnZV9yZWZfY291bnQoaGVhZCkgPCAwKSkKKwkJcmV0dXJuIE5VTEw7CisJ
aWYgKHVubGlrZWx5KCFwYWdlX2NhY2hlX2FkZF9zcGVjdWxhdGl2ZShoZWFkLCByZWZzKSkpCisJ
CXJldHVybiBOVUxMOworCXJldHVybiBoZWFkOworfQorCiAvKioKICAqIHB1dF91c2VyX3BhZ2Vz
X2RpcnR5X2xvY2soKSAtIHJlbGVhc2UgYW5kIG9wdGlvbmFsbHkgZGlydHkgZ3VwLXBpbm5lZCBw
YWdlcwogICogQHBhZ2VzOiAgYXJyYXkgb2YgcGFnZXMgdG8gYmUgbWF5YmUgbWFya2VkIGRpcnR5
LCBhbmQgZGVmaW5pdGVseSByZWxlYXNlZC4KQEAgLTE4MDcsMjAgKzE4MjIsNiBAQCBzdGF0aWMg
dm9pZCBfX21heWJlX3VudXNlZCB1bmRvX2Rldl9wYWdlbWFwKGludCAqbnIsIGludCBucl9zdGFy
dCwKIAl9CiB9CiAKLS8qCi0gKiBSZXR1cm4gdGhlIGNvbXB1bmQgaGVhZCBwYWdlIHdpdGggcmVm
IGFwcHJvcHJpYXRlbHkgaW5jcmVtZW50ZWQsCi0gKiBvciBOVUxMIGlmIHRoYXQgZmFpbGVkLgot
ICovCi1zdGF0aWMgaW5saW5lIHN0cnVjdCBwYWdlICp0cnlfZ2V0X2NvbXBvdW5kX2hlYWQoc3Ry
dWN0IHBhZ2UgKnBhZ2UsIGludCByZWZzKQotewotCXN0cnVjdCBwYWdlICpoZWFkID0gY29tcG91
bmRfaGVhZChwYWdlKTsKLQlpZiAoV0FSTl9PTl9PTkNFKHBhZ2VfcmVmX2NvdW50KGhlYWQpIDwg
MCkpCi0JCXJldHVybiBOVUxMOwotCWlmICh1bmxpa2VseSghcGFnZV9jYWNoZV9hZGRfc3BlY3Vs
YXRpdmUoaGVhZCwgcmVmcykpKQotCQlyZXR1cm4gTlVMTDsKLQlyZXR1cm4gaGVhZDsKLX0KLQog
I2lmZGVmIENPTkZJR19BUkNIX0hBU19QVEVfU1BFQ0lBTAogc3RhdGljIGludCBndXBfcHRlX3Jh
bmdlKHBtZF90IHBtZCwgdW5zaWduZWQgbG9uZyBhZGRyLCB1bnNpZ25lZCBsb25nIGVuZCwKIAkJ
CSB1bnNpZ25lZCBpbnQgZmxhZ3MsIHN0cnVjdCBwYWdlICoqcGFnZXMsIGludCAqbnIpCi0tIAoy
LjI0LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
