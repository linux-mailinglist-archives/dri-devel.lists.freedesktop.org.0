Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22EC7F8403
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 01:07:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B8CC6EA10;
	Tue, 12 Nov 2019 00:07:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE0F36EA0B
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 00:07:18 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dc9f7780000>; Mon, 11 Nov 2019 16:06:16 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Mon, 11 Nov 2019 16:07:18 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Mon, 11 Nov 2019 16:07:18 -0800
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 12 Nov
 2019 00:07:18 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Tue, 12 Nov 2019 00:07:16 +0000
Received: from blueforge.nvidia.com (Not Verified[10.110.48.28]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5dc9f7b30003>; Mon, 11 Nov 2019 16:07:16 -0800
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 12/23] mm/process_vm_access: set FOLL_PIN via
 pin_user_pages_remote()
Date: Mon, 11 Nov 2019 16:06:49 -0800
Message-ID: <20191112000700.3455038-13-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191112000700.3455038-1-jhubbard@nvidia.com>
References: <20191112000700.3455038-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1573517176; bh=3Py2O4K3WxT2/yPBKlFkEQrJEl3zr7dYM5uV5CiR5XQ=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Type:Content-Transfer-Encoding;
 b=PqOu2gGrt4yPc1T9tX6zhkH7invPzsZgO/C6ZqE5zQz2DIFQw9DLsdHGiEQsACOmr
 REvLimBqdAK3G9Lka7QSCUjGMiiCJ9Umq1kHatYlMcRQGoZ9t2mcKgFgxyTIgxFkFe
 KyvKAvPkOkGw1ZAWdb7VYga194WAjTUMv5r/TECnVFi0ryPvMt0BO6GMSf4RaS4B2+
 HfkAZ3USwjZCq4qwGgr5t17jk5mnULpsYxHQBC/D4gBwrquycyRjvppfg2l8HjCZvp
 rezKt17AgS7ee8655DgxOQkn6ddMRB2xTS87e8KOEiBpRL0NLea8Fi7NHa9l5Gzz38
 AMpQAKqOX5wUA==
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
ciByZWFkaW5nIG9mIHByb2Nlc3Nfdm1fcndfc2luZ2xlX3ZlYygpLgoKUmV2aWV3ZWQtYnk6IErD
qXLDtG1lIEdsaXNzZSA8amdsaXNzZUByZWRoYXQuY29tPgpSZXZpZXdlZC1ieTogSXJhIFdlaW55
IDxpcmEud2VpbnlAaW50ZWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBKb2huIEh1YmJhcmQgPGpodWJi
YXJkQG52aWRpYS5jb20+Ci0tLQogbW0vcHJvY2Vzc192bV9hY2Nlc3MuYyB8IDI4ICsrKysrKysr
KysrKysrKy0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCAx
MyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9tbS9wcm9jZXNzX3ZtX2FjY2Vzcy5jIGIvbW0v
cHJvY2Vzc192bV9hY2Nlc3MuYwppbmRleCAzNTdhYTdiZWY2YzAuLmZkMjBhYjY3NWI4NSAxMDA2
NDQKLS0tIGEvbW0vcHJvY2Vzc192bV9hY2Nlc3MuYworKysgYi9tbS9wcm9jZXNzX3ZtX2FjY2Vz
cy5jCkBAIC00MiwxMiArNDIsMTEgQEAgc3RhdGljIGludCBwcm9jZXNzX3ZtX3J3X3BhZ2VzKHN0
cnVjdCBwYWdlICoqcGFnZXMsCiAJCWlmIChjb3B5ID4gbGVuKQogCQkJY29weSA9IGxlbjsKIAot
CQlpZiAodm1fd3JpdGUpIHsKKwkJaWYgKHZtX3dyaXRlKQogCQkJY29waWVkID0gY29weV9wYWdl
X2Zyb21faXRlcihwYWdlLCBvZmZzZXQsIGNvcHksIGl0ZXIpOwotCQkJc2V0X3BhZ2VfZGlydHlf
bG9jayhwYWdlKTsKLQkJfSBlbHNlIHsKKwkJZWxzZQogCQkJY29waWVkID0gY29weV9wYWdlX3Rv
X2l0ZXIocGFnZSwgb2Zmc2V0LCBjb3B5LCBpdGVyKTsKLQkJfQorCiAJCWxlbiAtPSBjb3BpZWQ7
CiAJCWlmIChjb3BpZWQgPCBjb3B5ICYmIGlvdl9pdGVyX2NvdW50KGl0ZXIpKQogCQkJcmV0dXJu
IC1FRkFVTFQ7CkBAIC05Niw3ICs5NSw3IEBAIHN0YXRpYyBpbnQgcHJvY2Vzc192bV9yd19zaW5n
bGVfdmVjKHVuc2lnbmVkIGxvbmcgYWRkciwKIAkJZmxhZ3MgfD0gRk9MTF9XUklURTsKIAogCXdo
aWxlICghcmMgJiYgbnJfcGFnZXMgJiYgaW92X2l0ZXJfY291bnQoaXRlcikpIHsKLQkJaW50IHBh
Z2VzID0gbWluKG5yX3BhZ2VzLCBtYXhfcGFnZXNfcGVyX2xvb3ApOworCQlpbnQgcGlubmVkX3Bh
Z2VzID0gbWluKG5yX3BhZ2VzLCBtYXhfcGFnZXNfcGVyX2xvb3ApOwogCQlpbnQgbG9ja2VkID0g
MTsKIAkJc2l6ZV90IGJ5dGVzOwogCkBAIC0xMDYsMTQgKzEwNSwxNSBAQCBzdGF0aWMgaW50IHBy
b2Nlc3Nfdm1fcndfc2luZ2xlX3ZlYyh1bnNpZ25lZCBsb25nIGFkZHIsCiAJCSAqIGN1cnJlbnQv
Y3VycmVudC0+bW0KIAkJICovCiAJCWRvd25fcmVhZCgmbW0tPm1tYXBfc2VtKTsKLQkJcGFnZXMg
PSBnZXRfdXNlcl9wYWdlc19yZW1vdGUodGFzaywgbW0sIHBhLCBwYWdlcywgZmxhZ3MsCi0JCQkJ
CSAgICAgIHByb2Nlc3NfcGFnZXMsIE5VTEwsICZsb2NrZWQpOworCQlwaW5uZWRfcGFnZXMgPSBw
aW5fdXNlcl9wYWdlc19yZW1vdGUodGFzaywgbW0sIHBhLCBwaW5uZWRfcGFnZXMsCisJCQkJCQkg
ICAgIGZsYWdzLCBwcm9jZXNzX3BhZ2VzLAorCQkJCQkJICAgICBOVUxMLCAmbG9ja2VkKTsKIAkJ
aWYgKGxvY2tlZCkKIAkJCXVwX3JlYWQoJm1tLT5tbWFwX3NlbSk7Ci0JCWlmIChwYWdlcyA8PSAw
KQorCQlpZiAocGlubmVkX3BhZ2VzIDw9IDApCiAJCQlyZXR1cm4gLUVGQVVMVDsKIAotCQlieXRl
cyA9IHBhZ2VzICogUEFHRV9TSVpFIC0gc3RhcnRfb2Zmc2V0OworCQlieXRlcyA9IHBpbm5lZF9w
YWdlcyAqIFBBR0VfU0laRSAtIHN0YXJ0X29mZnNldDsKIAkJaWYgKGJ5dGVzID4gbGVuKQogCQkJ
Ynl0ZXMgPSBsZW47CiAKQEAgLTEyMiwxMCArMTIyLDEyIEBAIHN0YXRpYyBpbnQgcHJvY2Vzc192
bV9yd19zaW5nbGVfdmVjKHVuc2lnbmVkIGxvbmcgYWRkciwKIAkJCQkJIHZtX3dyaXRlKTsKIAkJ
bGVuIC09IGJ5dGVzOwogCQlzdGFydF9vZmZzZXQgPSAwOwotCQlucl9wYWdlcyAtPSBwYWdlczsK
LQkJcGEgKz0gcGFnZXMgKiBQQUdFX1NJWkU7Ci0JCXdoaWxlIChwYWdlcykKLQkJCXB1dF9wYWdl
KHByb2Nlc3NfcGFnZXNbLS1wYWdlc10pOworCQlucl9wYWdlcyAtPSBwaW5uZWRfcGFnZXM7CisJ
CXBhICs9IHBpbm5lZF9wYWdlcyAqIFBBR0VfU0laRTsKKworCQkvKiBJZiB2bV93cml0ZSBpcyBz
ZXQsIHRoZSBwYWdlcyBuZWVkIHRvIGJlIG1hZGUgZGlydHk6ICovCisJCXB1dF91c2VyX3BhZ2Vz
X2RpcnR5X2xvY2socHJvY2Vzc19wYWdlcywgcGlubmVkX3BhZ2VzLAorCQkJCQkgIHZtX3dyaXRl
KTsKIAl9CiAKIAlyZXR1cm4gcmM7Ci0tIAoyLjI0LjAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
