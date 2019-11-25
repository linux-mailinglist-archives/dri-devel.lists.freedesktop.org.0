Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27FA3108721
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2019 05:20:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E68689DFE;
	Mon, 25 Nov 2019 04:20:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6647889DEA
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2019 04:20:14 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5ddb56810000>; Sun, 24 Nov 2019 20:20:17 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Sun, 24 Nov 2019 20:20:13 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Sun, 24 Nov 2019 20:20:13 -0800
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 25 Nov
 2019 04:20:13 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 25 Nov 2019 04:20:13 +0000
Received: from blueforge.nvidia.com (Not Verified[10.110.48.28]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5ddb567d0001>; Sun, 24 Nov 2019 20:20:13 -0800
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 02/19] mm/gup: move try_get_compound_head() to top,
 fix minor issues
Date: Sun, 24 Nov 2019 20:19:54 -0800
Message-ID: <20191125042011.3002372-3-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191125042011.3002372-1-jhubbard@nvidia.com>
References: <20191125042011.3002372-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1574655617; bh=JKnh6awNMnXx+WkfJCjCpP/dD2pEJJn8AxQ3IWMhLGw=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=Ag+u7Srir8nvbObwGswAhksM3lf7yhFcBnF9prXEqkjmBbbMlv6MAuwygC5CTdfJ5
 yE4lfgVi/yE60GFGtA5YNkQ6Ixmb8HKLSLW4UmelKpt3+hIwMQ2v0Xv2lkIRBq/Vz9
 UyTjt6wkmv/nZ8z4gOSYJ8ODHkT4eW9VcCswEjTPRRKwV/MPtR/2JYgXJPBUa1TpC3
 X61Mq+s8iu1E8+ey0/n2CT8DHSxzUkKRvGF7G2xUsQVyE52JcynPyIkq/Zd1uyYuWt
 OjAf4OH2PMbY5AWLJfB/7CI7Kw9bUgcUGPSDczmntAYIcz7EXi+UxoWrCfAF0welk3
 sIZFe64yADXzg==
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
