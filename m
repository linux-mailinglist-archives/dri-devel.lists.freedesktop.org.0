Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8DAF8412
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 01:07:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 368BC89826;
	Tue, 12 Nov 2019 00:07:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC8FC891F8
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 00:07:25 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dc9f7c00000>; Mon, 11 Nov 2019 16:07:28 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 11 Nov 2019 16:07:25 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 11 Nov 2019 16:07:25 -0800
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 12 Nov
 2019 00:07:25 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Tue, 12 Nov 2019 00:07:24 +0000
Received: from blueforge.nvidia.com (Not Verified[10.110.48.28]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5dc9f7bb0005>; Mon, 11 Nov 2019 16:07:24 -0800
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 19/23] powerpc: book3s64: convert to pin_longterm_pages()
 and put_user_page()
Date: Mon, 11 Nov 2019 16:06:56 -0800
Message-ID: <20191112000700.3455038-20-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191112000700.3455038-1-jhubbard@nvidia.com>
References: <20191112000700.3455038-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1573517248; bh=jP0+G7EUrJzRbss/H6wqbMhvj/DAmG+WrBPGAFIWqJ8=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=kyMiML3+GMLGq0Jv8bzwxVi25OB/SoujLSswefLksQp3ZYNqPbwpIUlskN/5gXMJo
 26zMPqilhOk76CMwC3yRdMDpAzKIXkR0MEZJVdSMBwH38lXkHGYuQNlpuu/zKcaG9V
 ZZ5dx5Uf/LSacxxcsBDJQcJh5HzLRrF5DoR8v3ofQxvmJtGshRKxXs2+NLPnf1hh1C
 nSOTCA5dYrBdyoZTK2x/8i2jFIC6tjMGwEeGYeRaD0BpdcEpWAE/3p1ssCsEJFlDxU
 GgshMWpoo5oW+vfQNOaVL4vvpLAP6wqv2Utz57IJTsBvBpV+JgLGtYR13mWIjoDhUP
 n604LsOZc9T0A==
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
