Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DBC8104B5C
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2019 08:15:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 531666EB1B;
	Thu, 21 Nov 2019 07:15:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F6126EB13
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2019 07:13:58 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dd639320000>; Wed, 20 Nov 2019 23:13:54 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Wed, 20 Nov 2019 23:13:57 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Wed, 20 Nov 2019 23:13:57 -0800
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 21 Nov
 2019 07:13:57 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Thu, 21 Nov 2019 07:13:57 +0000
Received: from blueforge.nvidia.com (Not Verified[10.110.48.28]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5dd639350001>; Wed, 20 Nov 2019 23:13:57 -0800
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v7 20/24] powerpc: book3s64: convert to pin_user_pages() and
 put_user_page()
Date: Wed, 20 Nov 2019 23:13:50 -0800
Message-ID: <20191121071354.456618-21-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191121071354.456618-1-jhubbard@nvidia.com>
References: <20191121071354.456618-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1574320434; bh=IJJb9r+CEPs17zzIv7S9Yy1snV6WhIVmX2ftMMVKd1c=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=gyZm1ORNdWqyUXBSr+Yna0k2k//4YXWJXgDEB9EQLBFJPniHjnRPKBVeLivTcgvI3
 D4NJYgOxxQBp6NFji5YRlWbAP2Mtmpt3rIRZVk1fEMTXNR3L0kLhiLXe4ijoMGh3ar
 DDt0rPeAKO880QHdhs+xMQ+vEDcZl7y7VvOnCtlAoR2B/ojcVM/dFl+MaSyttwTQQr
 j7b0SlxR+CLDHs/gqvO6cMaKN3CL6ntfQ3KtJgLjbz5kU6z6P/TcQA01fl8yRFvfjI
 Ay+gp/fYni8vweBh8jJDlb2J5fRs2a4VIKQEW5I13nv1PNtMzdg6Kh7c4CVP9XKTJw
 9jyvn6+gl1xWA==
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

MS4gQ29udmVydCBmcm9tIGdldF91c2VyX3BhZ2VzKCkgdG8gcGluX3VzZXJfcGFnZXMoKS4KCjIu
IEFzIHJlcXVpcmVkIGJ5IHBpbl91c2VyX3BhZ2VzKCksIHJlbGVhc2UgdGhlc2UgcGFnZXMgdmlh
CnB1dF91c2VyX3BhZ2UoKS4gSW4gdGhpcyBjYXNlLCBkbyBzbyB2aWEgcHV0X3VzZXJfcGFnZXNf
ZGlydHlfbG9jaygpLgoKVGhhdCBoYXMgdGhlIHNpZGUgZWZmZWN0IG9mIGNhbGxpbmcgc2V0X3Bh
Z2VfZGlydHlfbG9jaygpLCBpbnN0ZWFkCm9mIHNldF9wYWdlX2RpcnR5KCkuIFRoaXMgaXMgcHJv
YmFibHkgbW9yZSBhY2N1cmF0ZS4KCkFzIENocmlzdG9waCBIZWxsd2lnIHB1dCBpdCwgInNldF9w
YWdlX2RpcnR5KCkgaXMgb25seSBzYWZlIGlmIHdlIGFyZQpkZWFsaW5nIHdpdGggYSBmaWxlIGJh
Y2tlZCBwYWdlIHdoZXJlIHdlIGhhdmUgcmVmZXJlbmNlIG9uIHRoZSBpbm9kZSBpdApoYW5ncyBv
ZmYuIiBbMV0KCjMuIFJlbGVhc2UgZWFjaCBwYWdlIGluIG1lbS0+aHBhZ2VzW10gKGluc3RlYWQg
b2YgbWVtLT5ocGFzW10pLCBiZWNhdXNlCnRoYXQgaXMgdGhlIGFycmF5IHRoYXQgcGluX2xvbmd0
ZXJtX3BhZ2VzKCkgZmlsbGVkIGluLiBUaGlzIGlzIG1vcmUKYWNjdXJhdGUgYW5kIHNob3VsZCBi
ZSBhIGxpdHRsZSBzYWZlciBmcm9tIGEgbWFpbnRlbmFuY2UgcG9pbnQgb2YKdmlldy4KClsxXSBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMTkwNzIzMTUzNjQwLkdCNzIwQGxzdC5kZQoKU2ln
bmVkLW9mZi1ieTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgotLS0KIGFyY2gv
cG93ZXJwYy9tbS9ib29rM3M2NC9pb21tdV9hcGkuYyB8IDEyICsrKysrLS0tLS0tLQogMSBmaWxl
IGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9h
cmNoL3Bvd2VycGMvbW0vYm9vazNzNjQvaW9tbXVfYXBpLmMgYi9hcmNoL3Bvd2VycGMvbW0vYm9v
azNzNjQvaW9tbXVfYXBpLmMKaW5kZXggNTZjYzg0NTIwNTc3Li4xOTYzODNlOGU1YTkgMTAwNjQ0
Ci0tLSBhL2FyY2gvcG93ZXJwYy9tbS9ib29rM3M2NC9pb21tdV9hcGkuYworKysgYi9hcmNoL3Bv
d2VycGMvbW0vYm9vazNzNjQvaW9tbXVfYXBpLmMKQEAgLTEwMyw3ICsxMDMsNyBAQCBzdGF0aWMg
bG9uZyBtbV9pb21tdV9kb19hbGxvYyhzdHJ1Y3QgbW1fc3RydWN0ICptbSwgdW5zaWduZWQgbG9u
ZyB1YSwKIAlmb3IgKGVudHJ5ID0gMDsgZW50cnkgPCBlbnRyaWVzOyBlbnRyeSArPSBjaHVuaykg
ewogCQl1bnNpZ25lZCBsb25nIG4gPSBtaW4oZW50cmllcyAtIGVudHJ5LCBjaHVuayk7CiAKLQkJ
cmV0ID0gZ2V0X3VzZXJfcGFnZXModWEgKyAoZW50cnkgPDwgUEFHRV9TSElGVCksIG4sCisJCXJl
dCA9IHBpbl91c2VyX3BhZ2VzKHVhICsgKGVudHJ5IDw8IFBBR0VfU0hJRlQpLCBuLAogCQkJCUZP
TExfV1JJVEUgfCBGT0xMX0xPTkdURVJNLAogCQkJCW1lbS0+aHBhZ2VzICsgZW50cnksIE5VTEwp
OwogCQlpZiAocmV0ID09IG4pIHsKQEAgLTE2Nyw5ICsxNjcsOCBAQCBzdGF0aWMgbG9uZyBtbV9p
b21tdV9kb19hbGxvYyhzdHJ1Y3QgbW1fc3RydWN0ICptbSwgdW5zaWduZWQgbG9uZyB1YSwKIAly
ZXR1cm4gMDsKIAogZnJlZV9leGl0OgotCS8qIGZyZWUgdGhlIHJlZmVyZW5jZSB0YWtlbiAqLwot
CWZvciAoaSA9IDA7IGkgPCBwaW5uZWQ7IGkrKykKLQkJcHV0X3BhZ2UobWVtLT5ocGFnZXNbaV0p
OworCS8qIGZyZWUgdGhlIHJlZmVyZW5jZXMgdGFrZW4gKi8KKwlwdXRfdXNlcl9wYWdlcyhtZW0t
PmhwYWdlcywgcGlubmVkKTsKIAogCXZmcmVlKG1lbS0+aHBhcyk7CiAJa2ZyZWUobWVtKTsKQEAg
LTIxMiwxMCArMjExLDkgQEAgc3RhdGljIHZvaWQgbW1faW9tbXVfdW5waW4oc3RydWN0IG1tX2lv
bW11X3RhYmxlX2dyb3VwX21lbV90ICptZW0pCiAJCWlmICghcGFnZSkKIAkJCWNvbnRpbnVlOwog
Ci0JCWlmIChtZW0tPmhwYXNbaV0gJiBNTV9JT01NVV9UQUJMRV9HUk9VUF9QQUdFX0RJUlRZKQot
CQkJU2V0UGFnZURpcnR5KHBhZ2UpOworCQlwdXRfdXNlcl9wYWdlc19kaXJ0eV9sb2NrKCZtZW0t
PmhwYWdlc1tpXSwgMSwKKwkJCQkJICBNTV9JT01NVV9UQUJMRV9HUk9VUF9QQUdFX0RJUlRZKTsK
IAotCQlwdXRfcGFnZShwYWdlKTsKIAkJbWVtLT5ocGFzW2ldID0gMDsKIAl9CiB9Ci0tIAoyLjI0
LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
