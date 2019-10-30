Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4997EAC29
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2019 10:04:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4800E6EDDB;
	Thu, 31 Oct 2019 09:04:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DAAF6EBB5
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2019 22:49:54 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dba13970000>; Wed, 30 Oct 2019 15:49:59 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Wed, 30 Oct 2019 15:49:53 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Wed, 30 Oct 2019 15:49:53 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 30 Oct
 2019 22:49:53 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Wed, 30 Oct 2019 22:49:52 +0000
Received: from blueforge.nvidia.com (Not Verified[10.110.48.28]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5dba138e0000>; Wed, 30 Oct 2019 15:49:51 -0700
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 15/19] powerpc: book3s64: convert to pin_longterm_pages() and
 put_user_page()
Date: Wed, 30 Oct 2019 15:49:26 -0700
Message-ID: <20191030224930.3990755-16-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191030224930.3990755-1-jhubbard@nvidia.com>
References: <20191030224930.3990755-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Approved-At: Thu, 31 Oct 2019 09:04:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1572475799; bh=s7fqcPpOnu8FKfGfhgVfAy1waz0rDtbaZTRbQ6blVPc=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=qG/d8CXmRQ3gipI0xCfB+AF3znMbqRBtbSrisMFG1hBwHCaDuQihEdYQXf92GADhH
 B41r++nRUhS/uyHiDctaxr/nWwnnjUfVqpQfQ4CBEyBBBtDteiqxkjaEBUZJqY60Lj
 SS1qgoVbIY5nTAejmtzMmICWY3ghFXEyJU00G62teGtMWxf8NFehGpVcye+uQlZJ4X
 JnKM7x/JtU5w0ztu1osW2m2Oqhx5b0oExjXmdcbqkc51A7xA5/TLwBY3o0eEeCmors
 FD4vqZjDiCUjsW29+iE0+XfDhX7lYIKV/FGY1ocD0YKU7Gdajz+/xjx0JUrhy+/QrV
 NtT8saGwtAXhw==
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

MS4gQ29udmVydCBmcm9tIGdldF91c2VyX3BhZ2VzKEZPTExfTE9OR1RFUk0pIHRvIHBpbl9sb25n
dGVybV9wYWdlcygpLgoKMi4gQXMgcmVxdWlyZWQgYnkgcGluX3VzZXJfcGFnZXMoKSwgcmVsZWFz
ZSB0aGVzZSBwYWdlcyB2aWEKcHV0X3VzZXJfcGFnZSgpLiBJbiB0aGlzIGNhc2UsIGRvIHNvIHZp
YSBwdXRfdXNlcl9wYWdlc19kaXJ0eV9sb2NrKCkuCgpUaGF0IGhhcyB0aGUgc2lkZSBlZmZlY3Qg
b2YgY2FsbGluZyBzZXRfcGFnZV9kaXJ0eV9sb2NrKCksIGluc3RlYWQKb2Ygc2V0X3BhZ2VfZGly
dHkoKS4gVGhpcyBpcyBwcm9iYWJseSBtb3JlIGFjY3VyYXRlLgoKQXMgQ2hyaXN0b3BoIEhlbGx3
aWcgcHV0IGl0LCAic2V0X3BhZ2VfZGlydHkoKSBpcyBvbmx5IHNhZmUgaWYgd2UgYXJlCmRlYWxp
bmcgd2l0aCBhIGZpbGUgYmFja2VkIHBhZ2Ugd2hlcmUgd2UgaGF2ZSByZWZlcmVuY2Ugb24gdGhl
IGlub2RlIGl0CmhhbmdzIG9mZi4iIFsxXQoKMy4gUmVsZWFzZSBlYWNoIHBhZ2UgaW4gbWVtLT5o
cGFnZXNbXSAoaW5zdGVhZCBvZiBtZW0tPmhwYXNbXSksIGJlY2F1c2UKdGhhdCBpcyB0aGUgYXJy
YXkgdGhhdCBwaW5fbG9uZ3Rlcm1fcGFnZXMoKSBmaWxsZWQgaW4uIFRoaXMgaXMgbW9yZQphY2N1
cmF0ZSBhbmQgc2hvdWxkIGJlIGEgbGl0dGxlIHNhZmVyIGZyb20gYSBtYWludGVuYW5jZSBwb2lu
dCBvZgp2aWV3LgoKWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAxOTA3MjMxNTM2NDAu
R0I3MjBAbHN0LmRlCgpTaWduZWQtb2ZmLWJ5OiBKb2huIEh1YmJhcmQgPGpodWJiYXJkQG52aWRp
YS5jb20+Ci0tLQogYXJjaC9wb3dlcnBjL21tL2Jvb2szczY0L2lvbW11X2FwaS5jIHwgMTUgKysr
KysrLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9tbS9ib29rM3M2NC9pb21tdV9hcGkuYyBi
L2FyY2gvcG93ZXJwYy9tbS9ib29rM3M2NC9pb21tdV9hcGkuYwppbmRleCA1NmNjODQ1MjA1Nzcu
LjY5ZDc5Y2I1MGQ0NyAxMDA2NDQKLS0tIGEvYXJjaC9wb3dlcnBjL21tL2Jvb2szczY0L2lvbW11
X2FwaS5jCisrKyBiL2FyY2gvcG93ZXJwYy9tbS9ib29rM3M2NC9pb21tdV9hcGkuYwpAQCAtMTAz
LDkgKzEwMyw4IEBAIHN0YXRpYyBsb25nIG1tX2lvbW11X2RvX2FsbG9jKHN0cnVjdCBtbV9zdHJ1
Y3QgKm1tLCB1bnNpZ25lZCBsb25nIHVhLAogCWZvciAoZW50cnkgPSAwOyBlbnRyeSA8IGVudHJp
ZXM7IGVudHJ5ICs9IGNodW5rKSB7CiAJCXVuc2lnbmVkIGxvbmcgbiA9IG1pbihlbnRyaWVzIC0g
ZW50cnksIGNodW5rKTsKIAotCQlyZXQgPSBnZXRfdXNlcl9wYWdlcyh1YSArIChlbnRyeSA8PCBQ
QUdFX1NISUZUKSwgbiwKLQkJCQlGT0xMX1dSSVRFIHwgRk9MTF9MT05HVEVSTSwKLQkJCQltZW0t
PmhwYWdlcyArIGVudHJ5LCBOVUxMKTsKKwkJcmV0ID0gcGluX2xvbmd0ZXJtX3BhZ2VzKHVhICsg
KGVudHJ5IDw8IFBBR0VfU0hJRlQpLCBuLAorCQkJCQkgRk9MTF9XUklURSwgbWVtLT5ocGFnZXMg
KyBlbnRyeSwgTlVMTCk7CiAJCWlmIChyZXQgPT0gbikgewogCQkJcGlubmVkICs9IG47CiAJCQlj
b250aW51ZTsKQEAgLTE2Nyw5ICsxNjYsOCBAQCBzdGF0aWMgbG9uZyBtbV9pb21tdV9kb19hbGxv
YyhzdHJ1Y3QgbW1fc3RydWN0ICptbSwgdW5zaWduZWQgbG9uZyB1YSwKIAlyZXR1cm4gMDsKIAog
ZnJlZV9leGl0OgotCS8qIGZyZWUgdGhlIHJlZmVyZW5jZSB0YWtlbiAqLwotCWZvciAoaSA9IDA7
IGkgPCBwaW5uZWQ7IGkrKykKLQkJcHV0X3BhZ2UobWVtLT5ocGFnZXNbaV0pOworCS8qIGZyZWUg
dGhlIHJlZmVyZW5jZXMgdGFrZW4gKi8KKwlwdXRfdXNlcl9wYWdlcyhtZW0tPmhwYWdlcywgcGlu
bmVkKTsKIAogCXZmcmVlKG1lbS0+aHBhcyk7CiAJa2ZyZWUobWVtKTsKQEAgLTIxMiwxMCArMjEw
LDkgQEAgc3RhdGljIHZvaWQgbW1faW9tbXVfdW5waW4oc3RydWN0IG1tX2lvbW11X3RhYmxlX2dy
b3VwX21lbV90ICptZW0pCiAJCWlmICghcGFnZSkKIAkJCWNvbnRpbnVlOwogCi0JCWlmIChtZW0t
PmhwYXNbaV0gJiBNTV9JT01NVV9UQUJMRV9HUk9VUF9QQUdFX0RJUlRZKQotCQkJU2V0UGFnZURp
cnR5KHBhZ2UpOworCQlwdXRfdXNlcl9wYWdlc19kaXJ0eV9sb2NrKCZtZW0tPmhwYWdlc1tpXSwg
MSwKKwkJCQkJICBNTV9JT01NVV9UQUJMRV9HUk9VUF9QQUdFX0RJUlRZKTsKIAotCQlwdXRfcGFn
ZShwYWdlKTsKIAkJbWVtLT5ocGFzW2ldID0gMDsKIAl9CiB9Ci0tIAoyLjIzLjAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
