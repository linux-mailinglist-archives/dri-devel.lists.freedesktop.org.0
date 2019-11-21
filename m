Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0DF4104B41
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2019 08:14:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 414506EB23;
	Thu, 21 Nov 2019 07:14:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2FA36EB09
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2019 07:14:02 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dd639350005>; Wed, 20 Nov 2019 23:13:58 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Wed, 20 Nov 2019 23:13:56 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Wed, 20 Nov 2019 23:13:56 -0800
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 21 Nov
 2019 07:13:56 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Thu, 21 Nov 2019 07:13:56 +0000
Received: from blueforge.nvidia.com (Not Verified[10.110.48.28]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5dd639340000>; Wed, 20 Nov 2019 23:13:56 -0800
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v7 11/24] goldish_pipe: convert to pin_user_pages() and
 put_user_page()
Date: Wed, 20 Nov 2019 23:13:41 -0800
Message-ID: <20191121071354.456618-12-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191121071354.456618-1-jhubbard@nvidia.com>
References: <20191121071354.456618-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1574320438; bh=D0FnBuVDsqs8jHEGK9oTRdYqi2i3EI/a7a1G1r/Hsb0=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=FJsKoBqEkW3ESs59qC1IqSfgrVSTVrnh/YYpI98s+c+kigxMHkG12iEPhX01yxVhj
 XB03IvPOrjL6i3g1JS44UUIpbGXc4ODUk5+brIT53WVBA9zzGusY5JaNLf/0Y7+7H4
 2a12uuEvBQtWLdf4Q9mvxXizm8ftNGoC60wm8rm8DirjpavGNso1/fBZgHniOnIGWw
 ZwOWppDQpqsu0W7HJbASnpF2K+OZJfo7YwNd+m04B3+tLJj30el8YGxW+fCKQHfwt1
 p08s0SJVsxjzaBZ2am/2SDMafBOxZkawwDFVsMShHYVMp1/fvnDO7znpIlDg+e4Zsz
 SMqeyfH6NtrjQ==
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

MS4gQ2FsbCB0aGUgbmV3IGdsb2JhbCBwaW5fdXNlcl9wYWdlc19mYXN0KCksIGZyb20gcGluX2dv
bGRmaXNoX3BhZ2VzKCkuCgoyLiBBcyByZXF1aXJlZCBieSBwaW5fdXNlcl9wYWdlcygpLCByZWxl
YXNlIHRoZXNlIHBhZ2VzIHZpYQpwdXRfdXNlcl9wYWdlKCkuIEluIHRoaXMgY2FzZSwgZG8gc28g
dmlhIHB1dF91c2VyX3BhZ2VzX2RpcnR5X2xvY2soKS4KClRoYXQgaGFzIHRoZSBzaWRlIGVmZmVj
dCBvZiBjYWxsaW5nIHNldF9wYWdlX2RpcnR5X2xvY2soKSwgaW5zdGVhZApvZiBzZXRfcGFnZV9k
aXJ0eSgpLiBUaGlzIGlzIHByb2JhYmx5IG1vcmUgYWNjdXJhdGUuCgpBcyBDaHJpc3RvcGggSGVs
bHdpZyBwdXQgaXQsICJzZXRfcGFnZV9kaXJ0eSgpIGlzIG9ubHkgc2FmZSBpZiB3ZSBhcmUKZGVh
bGluZyB3aXRoIGEgZmlsZSBiYWNrZWQgcGFnZSB3aGVyZSB3ZSBoYXZlIHJlZmVyZW5jZSBvbiB0
aGUgaW5vZGUgaXQKaGFuZ3Mgb2ZmLiIgWzFdCgpBbm90aGVyIHNpZGUgZWZmZWN0IGlzIHRoYXQg
dGhlIHJlbGVhc2UgY29kZSBpcyBzaW1wbGlmaWVkIGJlY2F1c2UKdGhlIHBhZ2VbXSBsb29wIGlz
IG5vdyBpbiBndXAuYyBpbnN0ZWFkIG9mIGhlcmUsIHNvIGp1c3QgZGVsZXRlIHRoZQpsb2NhbCBy
ZWxlYXNlX3VzZXJfcGFnZXMoKSBlbnRpcmVseSwgYW5kIGNhbGwKcHV0X3VzZXJfcGFnZXNfZGly
dHlfbG9jaygpIGRpcmVjdGx5LCBpbnN0ZWFkLgoKWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L3IvMjAxOTA3MjMxNTM2NDAuR0I3MjBAbHN0LmRlCgpSZXZpZXdlZC1ieTogSmFuIEthcmEgPGph
Y2tAc3VzZS5jej4KUmV2aWV3ZWQtYnk6IElyYSBXZWlueSA8aXJhLndlaW55QGludGVsLmNvbT4K
U2lnbmVkLW9mZi1ieTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgotLS0KIGRy
aXZlcnMvcGxhdGZvcm0vZ29sZGZpc2gvZ29sZGZpc2hfcGlwZS5jIHwgMTcgKysrLS0tLS0tLS0t
LS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGxhdGZvcm0vZ29sZGZpc2gvZ29sZGZpc2hfcGlwZS5jIGIv
ZHJpdmVycy9wbGF0Zm9ybS9nb2xkZmlzaC9nb2xkZmlzaF9waXBlLmMKaW5kZXggN2VkMmEyMWEw
YmFjLi42MzVhOGJjMWI0ODAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcGxhdGZvcm0vZ29sZGZpc2gv
Z29sZGZpc2hfcGlwZS5jCisrKyBiL2RyaXZlcnMvcGxhdGZvcm0vZ29sZGZpc2gvZ29sZGZpc2hf
cGlwZS5jCkBAIC0yNzQsNyArMjc0LDcgQEAgc3RhdGljIGludCBwaW5fZ29sZGZpc2hfcGFnZXMo
dW5zaWduZWQgbG9uZyBmaXJzdF9wYWdlLAogCQkqaXRlcl9sYXN0X3BhZ2Vfc2l6ZSA9IGxhc3Rf
cGFnZV9zaXplOwogCX0KIAotCXJldCA9IGdldF91c2VyX3BhZ2VzX2Zhc3QoZmlyc3RfcGFnZSwg
cmVxdWVzdGVkX3BhZ2VzLAorCXJldCA9IHBpbl91c2VyX3BhZ2VzX2Zhc3QoZmlyc3RfcGFnZSwg
cmVxdWVzdGVkX3BhZ2VzLAogCQkJCSAgIWlzX3dyaXRlID8gRk9MTF9XUklURSA6IDAsCiAJCQkJ
ICBwYWdlcyk7CiAJaWYgKHJldCA8PSAwKQpAQCAtMjg1LDE4ICsyODUsNiBAQCBzdGF0aWMgaW50
IHBpbl9nb2xkZmlzaF9wYWdlcyh1bnNpZ25lZCBsb25nIGZpcnN0X3BhZ2UsCiAJcmV0dXJuIHJl
dDsKIH0KIAotc3RhdGljIHZvaWQgcmVsZWFzZV91c2VyX3BhZ2VzKHN0cnVjdCBwYWdlICoqcGFn
ZXMsIGludCBwYWdlc19jb3VudCwKLQkJCSAgICAgICBpbnQgaXNfd3JpdGUsIHMzMiBjb25zdW1l
ZF9zaXplKQotewotCWludCBpOwotCi0JZm9yIChpID0gMDsgaSA8IHBhZ2VzX2NvdW50OyBpKysp
IHsKLQkJaWYgKCFpc193cml0ZSAmJiBjb25zdW1lZF9zaXplID4gMCkKLQkJCXNldF9wYWdlX2Rp
cnR5KHBhZ2VzW2ldKTsKLQkJcHV0X3BhZ2UocGFnZXNbaV0pOwotCX0KLX0KLQogLyogUG9wdWxh
dGUgdGhlIGNhbGwgcGFyYW1ldGVycywgbWVyZ2luZyBhZGphY2VudCBwYWdlcyB0b2dldGhlciAq
Lwogc3RhdGljIHZvaWQgcG9wdWxhdGVfcndfcGFyYW1zKHN0cnVjdCBwYWdlICoqcGFnZXMsCiAJ
CQkgICAgICAgaW50IHBhZ2VzX2NvdW50LApAQCAtMzcyLDcgKzM2MCw4IEBAIHN0YXRpYyBpbnQg
dHJhbnNmZXJfbWF4X2J1ZmZlcnMoc3RydWN0IGdvbGRmaXNoX3BpcGUgKnBpcGUsCiAKIAkqY29u
c3VtZWRfc2l6ZSA9IHBpcGUtPmNvbW1hbmRfYnVmZmVyLT5yd19wYXJhbXMuY29uc3VtZWRfc2l6
ZTsKIAotCXJlbGVhc2VfdXNlcl9wYWdlcyhwaXBlLT5wYWdlcywgcGFnZXNfY291bnQsIGlzX3dy
aXRlLCAqY29uc3VtZWRfc2l6ZSk7CisJcHV0X3VzZXJfcGFnZXNfZGlydHlfbG9jayhwaXBlLT5w
YWdlcywgcGFnZXNfY291bnQsCisJCQkJICAhaXNfd3JpdGUgJiYgKmNvbnN1bWVkX3NpemUgPiAw
KTsKIAogCW11dGV4X3VubG9jaygmcGlwZS0+bG9jayk7CiAJcmV0dXJuIDA7Ci0tIAoyLjI0LjAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
