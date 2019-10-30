Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B6CEAC3A
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2019 10:05:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D1956EDE0;
	Thu, 31 Oct 2019 09:04:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 425726EBB5
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2019 22:49:39 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dba13880000>; Wed, 30 Oct 2019 15:49:44 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Wed, 30 Oct 2019 15:49:38 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Wed, 30 Oct 2019 15:49:38 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 30 Oct
 2019 22:49:38 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Wed, 30 Oct 2019 22:49:37 +0000
Received: from blueforge.nvidia.com (Not Verified[10.110.48.28]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5dba137f0001>; Wed, 30 Oct 2019 15:49:36 -0700
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 03/19] goldish_pipe: rename local pin_user_pages() routine
Date: Wed, 30 Oct 2019 15:49:14 -0700
Message-ID: <20191030224930.3990755-4-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191030224930.3990755-1-jhubbard@nvidia.com>
References: <20191030224930.3990755-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Approved-At: Thu, 31 Oct 2019 09:04:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1572475785; bh=BivA9QyOArPxchgp7rWZ/PJ/DTYMWoFVd+MwMn0rTgI=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=Tl7eHIlE5ZU8DD0uEH1TLEUFkFRl1cjkKmKxPXWpblxJ/Ud5rDwqes4mP4VDMq8s9
 kpEVcFWvIXv/yXiJwWrADg8yWLvvLTtF/M8kQ7/knl8GqxSyLgJoV48CHz/n2ugjck
 bABu+z/PhqAlbUAeYqWskjtJnr6vO2Ku1GgcU80vGzwas4kHoKkwiuJs8kU9tpWlgI
 wt+hXtSB+P3JlxmhapXTNGf1/HOc/twwp49+AVjwkVPVv6cwhEodi/ZhFKCnBfOcJm
 RQlpWbUMHIi19nIGvAw6CbiC8ljjHXzLQQy+oBtHhUKb+vT5alAjGBxkMKYRsEuPaM
 TSyTPoTpXkfyw==
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

MS4gQXZvaWQgbmFtaW5nIGNvbmZsaWN0czogcmVuYW1lIGxvY2FsIHN0YXRpYyBmdW5jdGlvbiBm
cm9tCiJwaW5fdXNlcl9wYWdlcygpIiB0byAicGluX2dvbGRmaXNoX3BhZ2VzKCkiLgoKQW4gdXBj
b21pbmcgcGF0Y2ggd2lsbCBpbnRyb2R1Y2UgYSBnbG9iYWwgcGluX3VzZXJfcGFnZXMoKQpmdW5j
dGlvbi4KClNpZ25lZC1vZmYtYnk6IEpvaG4gSHViYmFyZCA8amh1YmJhcmRAbnZpZGlhLmNvbT4K
LS0tCiBkcml2ZXJzL3BsYXRmb3JtL2dvbGRmaXNoL2dvbGRmaXNoX3BpcGUuYyB8IDE4ICsrKysr
KysrKy0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3BsYXRmb3JtL2dvbGRmaXNoL2dvbGRmaXNoX3Bp
cGUuYyBiL2RyaXZlcnMvcGxhdGZvcm0vZ29sZGZpc2gvZ29sZGZpc2hfcGlwZS5jCmluZGV4IGNl
ZjAxMzNhYTQ3YS4uN2VkMmEyMWEwYmFjIDEwMDY0NAotLS0gYS9kcml2ZXJzL3BsYXRmb3JtL2dv
bGRmaXNoL2dvbGRmaXNoX3BpcGUuYworKysgYi9kcml2ZXJzL3BsYXRmb3JtL2dvbGRmaXNoL2dv
bGRmaXNoX3BpcGUuYwpAQCAtMjU3LDEyICsyNTcsMTIgQEAgc3RhdGljIGludCBnb2xkZmlzaF9w
aXBlX2Vycm9yX2NvbnZlcnQoaW50IHN0YXR1cykKIAl9CiB9CiAKLXN0YXRpYyBpbnQgcGluX3Vz
ZXJfcGFnZXModW5zaWduZWQgbG9uZyBmaXJzdF9wYWdlLAotCQkJICB1bnNpZ25lZCBsb25nIGxh
c3RfcGFnZSwKLQkJCSAgdW5zaWduZWQgaW50IGxhc3RfcGFnZV9zaXplLAotCQkJICBpbnQgaXNf
d3JpdGUsCi0JCQkgIHN0cnVjdCBwYWdlICpwYWdlc1tNQVhfQlVGRkVSU19QRVJfQ09NTUFORF0s
Ci0JCQkgIHVuc2lnbmVkIGludCAqaXRlcl9sYXN0X3BhZ2Vfc2l6ZSkKK3N0YXRpYyBpbnQgcGlu
X2dvbGRmaXNoX3BhZ2VzKHVuc2lnbmVkIGxvbmcgZmlyc3RfcGFnZSwKKwkJCSAgICAgIHVuc2ln
bmVkIGxvbmcgbGFzdF9wYWdlLAorCQkJICAgICAgdW5zaWduZWQgaW50IGxhc3RfcGFnZV9zaXpl
LAorCQkJICAgICAgaW50IGlzX3dyaXRlLAorCQkJICAgICAgc3RydWN0IHBhZ2UgKnBhZ2VzW01B
WF9CVUZGRVJTX1BFUl9DT01NQU5EXSwKKwkJCSAgICAgIHVuc2lnbmVkIGludCAqaXRlcl9sYXN0
X3BhZ2Vfc2l6ZSkKIHsKIAlpbnQgcmV0OwogCWludCByZXF1ZXN0ZWRfcGFnZXMgPSAoKGxhc3Rf
cGFnZSAtIGZpcnN0X3BhZ2UpID4+IFBBR0VfU0hJRlQpICsgMTsKQEAgLTM1NCw5ICszNTQsOSBA
QCBzdGF0aWMgaW50IHRyYW5zZmVyX21heF9idWZmZXJzKHN0cnVjdCBnb2xkZmlzaF9waXBlICpw
aXBlLAogCWlmIChtdXRleF9sb2NrX2ludGVycnVwdGlibGUoJnBpcGUtPmxvY2spKQogCQlyZXR1
cm4gLUVSRVNUQVJUU1lTOwogCi0JcGFnZXNfY291bnQgPSBwaW5fdXNlcl9wYWdlcyhmaXJzdF9w
YWdlLCBsYXN0X3BhZ2UsCi0JCQkJICAgICBsYXN0X3BhZ2Vfc2l6ZSwgaXNfd3JpdGUsCi0JCQkJ
ICAgICBwaXBlLT5wYWdlcywgJml0ZXJfbGFzdF9wYWdlX3NpemUpOworCXBhZ2VzX2NvdW50ID0g
cGluX2dvbGRmaXNoX3BhZ2VzKGZpcnN0X3BhZ2UsIGxhc3RfcGFnZSwKKwkJCQkJIGxhc3RfcGFn
ZV9zaXplLCBpc193cml0ZSwKKwkJCQkJIHBpcGUtPnBhZ2VzLCAmaXRlcl9sYXN0X3BhZ2Vfc2l6
ZSk7CiAJaWYgKHBhZ2VzX2NvdW50IDwgMCkgewogCQltdXRleF91bmxvY2soJnBpcGUtPmxvY2sp
OwogCQlyZXR1cm4gcGFnZXNfY291bnQ7Ci0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
