Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B29AFA84C
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 05:28:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D8F96EC7D;
	Wed, 13 Nov 2019 04:28:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA5656EC63
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 04:27:22 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dcb85ea0003>; Tue, 12 Nov 2019 20:26:18 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Tue, 12 Nov 2019 20:27:14 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Tue, 12 Nov 2019 20:27:14 -0800
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 13 Nov
 2019 04:27:13 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 13 Nov 2019 04:27:13 +0000
Received: from blueforge.nvidia.com (Not Verified[10.110.48.28]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5dcb86210005>; Tue, 12 Nov 2019 20:27:13 -0800
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v4 19/23] powerpc: book3s64: convert to pin_longterm_pages()
 and put_user_page()
Date: Tue, 12 Nov 2019 20:27:06 -0800
Message-ID: <20191113042710.3997854-20-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191113042710.3997854-1-jhubbard@nvidia.com>
References: <20191113042710.3997854-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1573619178; bh=jP0+G7EUrJzRbss/H6wqbMhvj/DAmG+WrBPGAFIWqJ8=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=XdT+9xtNgQ1XHKD+Ac7dyAYaM8yJJoUfb+7ysHR4ZchEmOg8iGZ3OAYhhHQBi/Kbx
 UltPHZY9SFVfUJjeMZwf4R1aOCsKKLD1du/k7QznDkCr42xziGVH6hiHpJ7tRz9qzC
 Yz6AwUWWS3DBM3hsBO5bNhYB1KGOiSZm7sFvl0rLjrb1Av2GbfUxoIFgNnjnBxozni
 AYAi0jjIgUv8xQkbkzVbW/kpGs42hmNEzXbHglfB8yYeMV2SHe/v3hW3K+sX+DUiqj
 i6mDziB1Vy5Pr1o65Egq6j/c0CeZMBouTG4wBzUOxwvIkyqPxzpZrrACOnkABDSMNW
 PG72/FqvOdGmg==
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
ZShwYWdlKTsKIAkJbWVtLT5ocGFzW2ldID0gMDsKIAl9CiB9Ci0tIAoyLjI0LjAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
