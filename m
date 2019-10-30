Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C36BFEAC39
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2019 10:05:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DBBB6EDDA;
	Thu, 31 Oct 2019 09:04:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F69E6EBB5
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2019 22:49:45 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dba138e0000>; Wed, 30 Oct 2019 15:49:50 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Wed, 30 Oct 2019 15:49:44 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Wed, 30 Oct 2019 15:49:44 -0700
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 30 Oct
 2019 22:49:44 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 30 Oct
 2019 22:49:44 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Wed, 30 Oct 2019 22:49:43 +0000
Received: from blueforge.nvidia.com (Not Verified[10.110.48.28]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5dba13860000>; Wed, 30 Oct 2019 15:49:43 -0700
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 08/19] mm/process_vm_access: set FOLL_PIN via
 pin_user_pages_remote()
Date: Wed, 30 Oct 2019 15:49:19 -0700
Message-ID: <20191030224930.3990755-9-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191030224930.3990755-1-jhubbard@nvidia.com>
References: <20191030224930.3990755-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Approved-At: Thu, 31 Oct 2019 09:04:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1572475790; bh=mlrZ/rix4TWnvu0gWBO75CbhcMvz3QaPMdjHmepPots=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=T1okUU6xEFiVtVeoQJE96GgMlaT5QHQCTSORP2lhkD8eLigr7DeidXJDkKlLMKjgp
 suyl0vSyxruTx+5wktlA+v73ygMrBWwhZ3suojNDWt8GwtWUHRbfxxcqePdMFOnqWH
 8pF9BGDuXtc+s13A8v+IiYxTtUcRGn3/Fda9cflCAEhL21x9avtCRB0/4GlQ7qoVNT
 IViDVH9dh3Vl7mArrvAZ3LKr0E9JZPsdHm0+SZQNP+nGbAmrzMotnN6uW5fgYzKzEn
 VsXqvyhgyE3u3T7p+IDCeRBQTg7e+DvgXTT/NjnEP9pYQZ1j2C/gu/xXXFcdv1lmJj
 cKzWDdboK7PPQ==
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
 linux-mm@kvack.org, Paul
 Mackerras <paulus@samba.org>, linux-kselftest@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, Jonathan Corbet <corbet@lwn.net>,
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

Q29udmVydCBwcm9jZXNzX3ZtX2FjY2VzcyB0byB1c2UgdGhlIG5ldyBwaW5fdXNlcl9wYWdlc19y
ZW1vdGUoKQpjYWxsLCB3aGljaCBzZXRzIEZPTExfUElOLiBTZXR0aW5nIEZPTExfUElOIGlzIG5v
dyByZXF1aXJlZCBmb3IKY29kZSB0aGF0IHJlcXVpcmVzIHRyYWNraW5nIG9mIHBpbm5lZCBwYWdl
cy4KCkFsc28sIHJlbGVhc2UgdGhlIHBhZ2VzIHZpYSBwdXRfdXNlcl9wYWdlKigpLgoKQWxzbywg
cmVuYW1lICJwYWdlcyIgdG8gInBpbm5lZF9wYWdlcyIsIGFzIHRoaXMgbWFrZXMgZm9yCmVhc2ll
ciByZWFkaW5nIG9mIHByb2Nlc3Nfdm1fcndfc2luZ2xlX3ZlYygpLgoKU2lnbmVkLW9mZi1ieTog
Sm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgotLS0KIG1tL3Byb2Nlc3Nfdm1fYWNj
ZXNzLmMgfCAyOCArKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwg
MTUgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvbW0vcHJvY2Vz
c192bV9hY2Nlc3MuYyBiL21tL3Byb2Nlc3Nfdm1fYWNjZXNzLmMKaW5kZXggMzU3YWE3YmVmNmMw
Li5mZDIwYWI2NzViODUgMTAwNjQ0Ci0tLSBhL21tL3Byb2Nlc3Nfdm1fYWNjZXNzLmMKKysrIGIv
bW0vcHJvY2Vzc192bV9hY2Nlc3MuYwpAQCAtNDIsMTIgKzQyLDExIEBAIHN0YXRpYyBpbnQgcHJv
Y2Vzc192bV9yd19wYWdlcyhzdHJ1Y3QgcGFnZSAqKnBhZ2VzLAogCQlpZiAoY29weSA+IGxlbikK
IAkJCWNvcHkgPSBsZW47CiAKLQkJaWYgKHZtX3dyaXRlKSB7CisJCWlmICh2bV93cml0ZSkKIAkJ
CWNvcGllZCA9IGNvcHlfcGFnZV9mcm9tX2l0ZXIocGFnZSwgb2Zmc2V0LCBjb3B5LCBpdGVyKTsK
LQkJCXNldF9wYWdlX2RpcnR5X2xvY2socGFnZSk7Ci0JCX0gZWxzZSB7CisJCWVsc2UKIAkJCWNv
cGllZCA9IGNvcHlfcGFnZV90b19pdGVyKHBhZ2UsIG9mZnNldCwgY29weSwgaXRlcik7Ci0JCX0K
KwogCQlsZW4gLT0gY29waWVkOwogCQlpZiAoY29waWVkIDwgY29weSAmJiBpb3ZfaXRlcl9jb3Vu
dChpdGVyKSkKIAkJCXJldHVybiAtRUZBVUxUOwpAQCAtOTYsNyArOTUsNyBAQCBzdGF0aWMgaW50
IHByb2Nlc3Nfdm1fcndfc2luZ2xlX3ZlYyh1bnNpZ25lZCBsb25nIGFkZHIsCiAJCWZsYWdzIHw9
IEZPTExfV1JJVEU7CiAKIAl3aGlsZSAoIXJjICYmIG5yX3BhZ2VzICYmIGlvdl9pdGVyX2NvdW50
KGl0ZXIpKSB7Ci0JCWludCBwYWdlcyA9IG1pbihucl9wYWdlcywgbWF4X3BhZ2VzX3Blcl9sb29w
KTsKKwkJaW50IHBpbm5lZF9wYWdlcyA9IG1pbihucl9wYWdlcywgbWF4X3BhZ2VzX3Blcl9sb29w
KTsKIAkJaW50IGxvY2tlZCA9IDE7CiAJCXNpemVfdCBieXRlczsKIApAQCAtMTA2LDE0ICsxMDUs
MTUgQEAgc3RhdGljIGludCBwcm9jZXNzX3ZtX3J3X3NpbmdsZV92ZWModW5zaWduZWQgbG9uZyBh
ZGRyLAogCQkgKiBjdXJyZW50L2N1cnJlbnQtPm1tCiAJCSAqLwogCQlkb3duX3JlYWQoJm1tLT5t
bWFwX3NlbSk7Ci0JCXBhZ2VzID0gZ2V0X3VzZXJfcGFnZXNfcmVtb3RlKHRhc2ssIG1tLCBwYSwg
cGFnZXMsIGZsYWdzLAotCQkJCQkgICAgICBwcm9jZXNzX3BhZ2VzLCBOVUxMLCAmbG9ja2VkKTsK
KwkJcGlubmVkX3BhZ2VzID0gcGluX3VzZXJfcGFnZXNfcmVtb3RlKHRhc2ssIG1tLCBwYSwgcGlu
bmVkX3BhZ2VzLAorCQkJCQkJICAgICBmbGFncywgcHJvY2Vzc19wYWdlcywKKwkJCQkJCSAgICAg
TlVMTCwgJmxvY2tlZCk7CiAJCWlmIChsb2NrZWQpCiAJCQl1cF9yZWFkKCZtbS0+bW1hcF9zZW0p
OwotCQlpZiAocGFnZXMgPD0gMCkKKwkJaWYgKHBpbm5lZF9wYWdlcyA8PSAwKQogCQkJcmV0dXJu
IC1FRkFVTFQ7CiAKLQkJYnl0ZXMgPSBwYWdlcyAqIFBBR0VfU0laRSAtIHN0YXJ0X29mZnNldDsK
KwkJYnl0ZXMgPSBwaW5uZWRfcGFnZXMgKiBQQUdFX1NJWkUgLSBzdGFydF9vZmZzZXQ7CiAJCWlm
IChieXRlcyA+IGxlbikKIAkJCWJ5dGVzID0gbGVuOwogCkBAIC0xMjIsMTAgKzEyMiwxMiBAQCBz
dGF0aWMgaW50IHByb2Nlc3Nfdm1fcndfc2luZ2xlX3ZlYyh1bnNpZ25lZCBsb25nIGFkZHIsCiAJ
CQkJCSB2bV93cml0ZSk7CiAJCWxlbiAtPSBieXRlczsKIAkJc3RhcnRfb2Zmc2V0ID0gMDsKLQkJ
bnJfcGFnZXMgLT0gcGFnZXM7Ci0JCXBhICs9IHBhZ2VzICogUEFHRV9TSVpFOwotCQl3aGlsZSAo
cGFnZXMpCi0JCQlwdXRfcGFnZShwcm9jZXNzX3BhZ2VzWy0tcGFnZXNdKTsKKwkJbnJfcGFnZXMg
LT0gcGlubmVkX3BhZ2VzOworCQlwYSArPSBwaW5uZWRfcGFnZXMgKiBQQUdFX1NJWkU7CisKKwkJ
LyogSWYgdm1fd3JpdGUgaXMgc2V0LCB0aGUgcGFnZXMgbmVlZCB0byBiZSBtYWRlIGRpcnR5OiAq
LworCQlwdXRfdXNlcl9wYWdlc19kaXJ0eV9sb2NrKHByb2Nlc3NfcGFnZXMsIHBpbm5lZF9wYWdl
cywKKwkJCQkJICB2bV93cml0ZSk7CiAJfQogCiAJcmV0dXJuIHJjOwotLSAKMi4yMy4wCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
