Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C48BB108718
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2019 05:20:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8652689E0E;
	Mon, 25 Nov 2019 04:20:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA41889DE3
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2019 04:20:14 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5ddb56810002>; Sun, 24 Nov 2019 20:20:18 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Sun, 24 Nov 2019 20:20:14 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Sun, 24 Nov 2019 20:20:14 -0800
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 25 Nov
 2019 04:20:14 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 25 Nov 2019 04:20:14 +0000
Received: from blueforge.nvidia.com (Not Verified[10.110.48.28]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5ddb567d000c>; Sun, 24 Nov 2019 20:20:13 -0800
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 10/19] mm/process_vm_access: set FOLL_PIN via
 pin_user_pages_remote()
Date: Sun, 24 Nov 2019 20:20:02 -0800
Message-ID: <20191125042011.3002372-11-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191125042011.3002372-1-jhubbard@nvidia.com>
References: <20191125042011.3002372-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1574655618; bh=P8nVR+kV72iD6sM0eEn6ntwngrRbmURGxrL6qNBlbv8=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Type:Content-Transfer-Encoding;
 b=lKesB6ym+xsmH3pzlYoMztJ+yYpmeBfaDdlKbcm+Ov0Oe9me0lSNHUFJ4QprbikOC
 lfrZrl11HiUBrtbdZMs+LKoi+Rx6l3Ck7oeV8/as0OZFC3m99bu9b6dNykGoGNGYdH
 g4CW1lvSCC9uYS7u3PjTzS/yu2y3kxiLjI50XfLbt9DiCyC2CPswdMokUj2ZxY1UXS
 QCkk5wE9DgyI5qHC4UXN52r62eB0umS0CHTNvfAHst68PfMoHzvOWB85QVb6eq5vuU
 X5qPZJWlwz9ha0xRtwngy4U/T/xLVCOs0dYU5iaDPW30LK6aqCDr2YcR23ic6SgZgg
 COChY61dWiJQQ==
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

Q29udmVydCBwcm9jZXNzX3ZtX2FjY2VzcyB0byB1c2UgdGhlIG5ldyBwaW5fdXNlcl9wYWdlc19y
ZW1vdGUoKQpjYWxsLCB3aGljaCBzZXRzIEZPTExfUElOLiBTZXR0aW5nIEZPTExfUElOIGlzIG5v
dyByZXF1aXJlZCBmb3IKY29kZSB0aGF0IHJlcXVpcmVzIHRyYWNraW5nIG9mIHBpbm5lZCBwYWdl
cy4KCkFsc28sIHJlbGVhc2UgdGhlIHBhZ2VzIHZpYSBwdXRfdXNlcl9wYWdlKigpLgoKQWxzbywg
cmVuYW1lICJwYWdlcyIgdG8gInBpbm5lZF9wYWdlcyIsIGFzIHRoaXMgbWFrZXMgZm9yCmVhc2ll
ciByZWFkaW5nIG9mIHByb2Nlc3Nfdm1fcndfc2luZ2xlX3ZlYygpLgoKUmV2aWV3ZWQtYnk6IEph
biBLYXJhIDxqYWNrQHN1c2UuY3o+ClJldmlld2VkLWJ5OiBKw6lyw7RtZSBHbGlzc2UgPGpnbGlz
c2VAcmVkaGF0LmNvbT4KUmV2aWV3ZWQtYnk6IElyYSBXZWlueSA8aXJhLndlaW55QGludGVsLmNv
bT4KU2lnbmVkLW9mZi1ieTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgotLS0K
IG1tL3Byb2Nlc3Nfdm1fYWNjZXNzLmMgfCAyOCArKysrKysrKysrKysrKystLS0tLS0tLS0tLS0t
CiAxIGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvbW0vcHJvY2Vzc192bV9hY2Nlc3MuYyBiL21tL3Byb2Nlc3Nfdm1fYWNjZXNzLmMK
aW5kZXggMzU3YWE3YmVmNmMwLi5mZDIwYWI2NzViODUgMTAwNjQ0Ci0tLSBhL21tL3Byb2Nlc3Nf
dm1fYWNjZXNzLmMKKysrIGIvbW0vcHJvY2Vzc192bV9hY2Nlc3MuYwpAQCAtNDIsMTIgKzQyLDEx
IEBAIHN0YXRpYyBpbnQgcHJvY2Vzc192bV9yd19wYWdlcyhzdHJ1Y3QgcGFnZSAqKnBhZ2VzLAog
CQlpZiAoY29weSA+IGxlbikKIAkJCWNvcHkgPSBsZW47CiAKLQkJaWYgKHZtX3dyaXRlKSB7CisJ
CWlmICh2bV93cml0ZSkKIAkJCWNvcGllZCA9IGNvcHlfcGFnZV9mcm9tX2l0ZXIocGFnZSwgb2Zm
c2V0LCBjb3B5LCBpdGVyKTsKLQkJCXNldF9wYWdlX2RpcnR5X2xvY2socGFnZSk7Ci0JCX0gZWxz
ZSB7CisJCWVsc2UKIAkJCWNvcGllZCA9IGNvcHlfcGFnZV90b19pdGVyKHBhZ2UsIG9mZnNldCwg
Y29weSwgaXRlcik7Ci0JCX0KKwogCQlsZW4gLT0gY29waWVkOwogCQlpZiAoY29waWVkIDwgY29w
eSAmJiBpb3ZfaXRlcl9jb3VudChpdGVyKSkKIAkJCXJldHVybiAtRUZBVUxUOwpAQCAtOTYsNyAr
OTUsNyBAQCBzdGF0aWMgaW50IHByb2Nlc3Nfdm1fcndfc2luZ2xlX3ZlYyh1bnNpZ25lZCBsb25n
IGFkZHIsCiAJCWZsYWdzIHw9IEZPTExfV1JJVEU7CiAKIAl3aGlsZSAoIXJjICYmIG5yX3BhZ2Vz
ICYmIGlvdl9pdGVyX2NvdW50KGl0ZXIpKSB7Ci0JCWludCBwYWdlcyA9IG1pbihucl9wYWdlcywg
bWF4X3BhZ2VzX3Blcl9sb29wKTsKKwkJaW50IHBpbm5lZF9wYWdlcyA9IG1pbihucl9wYWdlcywg
bWF4X3BhZ2VzX3Blcl9sb29wKTsKIAkJaW50IGxvY2tlZCA9IDE7CiAJCXNpemVfdCBieXRlczsK
IApAQCAtMTA2LDE0ICsxMDUsMTUgQEAgc3RhdGljIGludCBwcm9jZXNzX3ZtX3J3X3NpbmdsZV92
ZWModW5zaWduZWQgbG9uZyBhZGRyLAogCQkgKiBjdXJyZW50L2N1cnJlbnQtPm1tCiAJCSAqLwog
CQlkb3duX3JlYWQoJm1tLT5tbWFwX3NlbSk7Ci0JCXBhZ2VzID0gZ2V0X3VzZXJfcGFnZXNfcmVt
b3RlKHRhc2ssIG1tLCBwYSwgcGFnZXMsIGZsYWdzLAotCQkJCQkgICAgICBwcm9jZXNzX3BhZ2Vz
LCBOVUxMLCAmbG9ja2VkKTsKKwkJcGlubmVkX3BhZ2VzID0gcGluX3VzZXJfcGFnZXNfcmVtb3Rl
KHRhc2ssIG1tLCBwYSwgcGlubmVkX3BhZ2VzLAorCQkJCQkJICAgICBmbGFncywgcHJvY2Vzc19w
YWdlcywKKwkJCQkJCSAgICAgTlVMTCwgJmxvY2tlZCk7CiAJCWlmIChsb2NrZWQpCiAJCQl1cF9y
ZWFkKCZtbS0+bW1hcF9zZW0pOwotCQlpZiAocGFnZXMgPD0gMCkKKwkJaWYgKHBpbm5lZF9wYWdl
cyA8PSAwKQogCQkJcmV0dXJuIC1FRkFVTFQ7CiAKLQkJYnl0ZXMgPSBwYWdlcyAqIFBBR0VfU0la
RSAtIHN0YXJ0X29mZnNldDsKKwkJYnl0ZXMgPSBwaW5uZWRfcGFnZXMgKiBQQUdFX1NJWkUgLSBz
dGFydF9vZmZzZXQ7CiAJCWlmIChieXRlcyA+IGxlbikKIAkJCWJ5dGVzID0gbGVuOwogCkBAIC0x
MjIsMTAgKzEyMiwxMiBAQCBzdGF0aWMgaW50IHByb2Nlc3Nfdm1fcndfc2luZ2xlX3ZlYyh1bnNp
Z25lZCBsb25nIGFkZHIsCiAJCQkJCSB2bV93cml0ZSk7CiAJCWxlbiAtPSBieXRlczsKIAkJc3Rh
cnRfb2Zmc2V0ID0gMDsKLQkJbnJfcGFnZXMgLT0gcGFnZXM7Ci0JCXBhICs9IHBhZ2VzICogUEFH
RV9TSVpFOwotCQl3aGlsZSAocGFnZXMpCi0JCQlwdXRfcGFnZShwcm9jZXNzX3BhZ2VzWy0tcGFn
ZXNdKTsKKwkJbnJfcGFnZXMgLT0gcGlubmVkX3BhZ2VzOworCQlwYSArPSBwaW5uZWRfcGFnZXMg
KiBQQUdFX1NJWkU7CisKKwkJLyogSWYgdm1fd3JpdGUgaXMgc2V0LCB0aGUgcGFnZXMgbmVlZCB0
byBiZSBtYWRlIGRpcnR5OiAqLworCQlwdXRfdXNlcl9wYWdlc19kaXJ0eV9sb2NrKHByb2Nlc3Nf
cGFnZXMsIHBpbm5lZF9wYWdlcywKKwkJCQkJICB2bV93cml0ZSk7CiAJfQogCiAJcmV0dXJuIHJj
OwotLSAKMi4yNC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
