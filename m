Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F48F8414
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 01:08:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94A4F89919;
	Tue, 12 Nov 2019 00:07:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D391891B3
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 00:07:25 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dc9f77f0000>; Mon, 11 Nov 2019 16:06:23 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 11 Nov 2019 16:07:25 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 11 Nov 2019 16:07:25 -0800
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 12 Nov
 2019 00:07:24 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Tue, 12 Nov 2019 00:07:23 +0000
Received: from blueforge.nvidia.com (Not Verified[10.110.48.28]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5dc9f7ba0005>; Mon, 11 Nov 2019 16:07:23 -0800
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 18/23] vfio,
 mm: pin_longterm_pages (FOLL_PIN) and put_user_page() conversion
Date: Mon, 11 Nov 2019 16:06:55 -0800
Message-ID: <20191112000700.3455038-19-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191112000700.3455038-1-jhubbard@nvidia.com>
References: <20191112000700.3455038-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1573517183; bh=sSwCrqRKuW3/2RqWIzTidmab8smfkfN0es5ZTEERORQ=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=OOy4osFxRkHKhA4WgKXA5YhAniGLgnKkjxLIGE/ThvfX2DPQ68rl1TsLA9SZKnLVn
 dYYRm0QhBsaxq6ZHWmxSUwrNxOdd5Uyvb9KY+cvPN+kIh4WUWvxM/2f8kdLFhfLOzd
 sWevWhJFRkTu6vo+N0WxrYIOePZqIWcSyYJLSG9lwE5m0RgdK+/gdZXtsKPQQYnMWf
 xuhkwC8xNeb8u+BqAdzbH6Ylg8hYBWh5afDxUQfn7DyEWsylkTKvwQHs+WSfP4IPH1
 58EeEb3okxK1KQAuYGIG7WJdZ33PHrGTE5RJvv/ycocsc+rQoqaJsyFcHJdnqX/pZX
 cyNKl7RGcRWQg==
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

MS4gQ2hhbmdlIHZmaW8gZnJvbSBnZXRfdXNlcl9wYWdlcyhGT0xMX0xPTkdURVJNKSwgdG8KcGlu
X2xvbmd0ZXJtX3BhZ2VzKCksIHdoaWNoIHNldHMgYm90aCBGT0xMX0xPTkdURVJNIGFuZCBGT0xM
X1BJTi4KCjIuIEJlY2F1c2UgYWxsIEZPTExfUElOLWFjcXVpcmVkIHBhZ2VzIG11c3QgYmUgcmVs
ZWFzZWQgdmlhCnB1dF91c2VyX3BhZ2UoKSwgYWxzbyBjb252ZXJ0IHRoZSBwdXRfcGFnZSgpIGNh
bGwgb3ZlciB0bwpwdXRfdXNlcl9wYWdlcygpLgoKTm90ZSB0aGF0IHRoaXMgZWZmZWN0aXZlbHkg
Y2hhbmdlcyB0aGUgY29kZSdzIGJlaGF2aW9yIGluCnZmaW9faW9tbXVfdHlwZTEuYzogcHV0X3Bm
bigpOiBpdCBub3cgdWx0aW1hdGVseSBjYWxscwpzZXRfcGFnZV9kaXJ0eV9sb2NrKCksIGluc3Rl
YWQgb2Ygc2V0X3BhZ2VfZGlydHkoKS4gVGhpcyBpcwpwcm9iYWJseSBtb3JlIGFjY3VyYXRlLgoK
QXMgQ2hyaXN0b3BoIEhlbGx3aWcgcHV0IGl0LCAic2V0X3BhZ2VfZGlydHkoKSBpcyBvbmx5IHNh
ZmUgaWYgd2UgYXJlCmRlYWxpbmcgd2l0aCBhIGZpbGUgYmFja2VkIHBhZ2Ugd2hlcmUgd2UgaGF2
ZSByZWZlcmVuY2Ugb24gdGhlIGlub2RlIGl0CmhhbmdzIG9mZi4iIFsxXQoKWzFdIGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL3IvMjAxOTA3MjMxNTM2NDAuR0I3MjBAbHN0LmRlCgpDYzogQWxleCBX
aWxsaWFtc29uIDxhbGV4LndpbGxpYW1zb25AcmVkaGF0LmNvbT4KU2lnbmVkLW9mZi1ieTogSm9o
biBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgotLS0KIGRyaXZlcnMvdmZpby92ZmlvX2lv
bW11X3R5cGUxLmMgfCAxMSArKysrKy0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9u
cygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3ZmaW8vdmZpb19pb21t
dV90eXBlMS5jIGIvZHJpdmVycy92ZmlvL3ZmaW9faW9tbXVfdHlwZTEuYwppbmRleCAwMTc2ODli
N2MzMmIuLjA3YmVjMGJkZDMxNiAxMDA2NDQKLS0tIGEvZHJpdmVycy92ZmlvL3ZmaW9faW9tbXVf
dHlwZTEuYworKysgYi9kcml2ZXJzL3ZmaW8vdmZpb19pb21tdV90eXBlMS5jCkBAIC0zMjcsOSAr
MzI3LDggQEAgc3RhdGljIGludCBwdXRfcGZuKHVuc2lnbmVkIGxvbmcgcGZuLCBpbnQgcHJvdCkK
IHsKIAlpZiAoIWlzX2ludmFsaWRfcmVzZXJ2ZWRfcGZuKHBmbikpIHsKIAkJc3RydWN0IHBhZ2Ug
KnBhZ2UgPSBwZm5fdG9fcGFnZShwZm4pOwotCQlpZiAocHJvdCAmIElPTU1VX1dSSVRFKQotCQkJ
U2V0UGFnZURpcnR5KHBhZ2UpOwotCQlwdXRfcGFnZShwYWdlKTsKKworCQlwdXRfdXNlcl9wYWdl
c19kaXJ0eV9sb2NrKCZwYWdlLCAxLCBwcm90ICYgSU9NTVVfV1JJVEUpOwogCQlyZXR1cm4gMTsK
IAl9CiAJcmV0dXJuIDA7CkBAIC0zNDgsOCArMzQ3LDggQEAgc3RhdGljIGludCB2YWRkcl9nZXRf
cGZuKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLCB1bnNpZ25lZCBsb25nIHZhZGRyLAogCQlmbGFncyB8
PSBGT0xMX1dSSVRFOwogCiAJZG93bl9yZWFkKCZtbS0+bW1hcF9zZW0pOwotCXJldCA9IGdldF91
c2VyX3BhZ2VzX3JlbW90ZShOVUxMLCBtbSwgdmFkZHIsIDEsIGZsYWdzIHwgRk9MTF9MT05HVEVS
TSwKLQkJCQkgICAgcGFnZSwgdm1hcywgTlVMTCk7CisJcmV0ID0gcGluX2xvbmd0ZXJtX3BhZ2Vz
X3JlbW90ZShOVUxMLCBtbSwgdmFkZHIsIDEsIGZsYWdzLCBwYWdlLCB2bWFzLAorCQkJCQlOVUxM
KTsKIAkvKgogCSAqIFRoZSBsaWZldGltZSBvZiBhIHZhZGRyX2dldF9wZm4oKSBwYWdlIHBpbiBp
cwogCSAqIHVzZXJzcGFjZS1jb250cm9sbGVkLiBJbiB0aGUgZnMtZGF4IGNhc2UgdGhpcyBjb3Vs
ZApAQCAtMzU5LDcgKzM1OCw3IEBAIHN0YXRpYyBpbnQgdmFkZHJfZ2V0X3BmbihzdHJ1Y3QgbW1f
c3RydWN0ICptbSwgdW5zaWduZWQgbG9uZyB2YWRkciwKIAkgKi8KIAlpZiAocmV0ID4gMCAmJiB2
bWFfaXNfZnNkYXgodm1hc1swXSkpIHsKIAkJcmV0ID0gLUVPUE5PVFNVUFA7Ci0JCXB1dF9wYWdl
KHBhZ2VbMF0pOworCQlwdXRfdXNlcl9wYWdlKHBhZ2VbMF0pOwogCX0KIAogCXVwX3JlYWQoJm1t
LT5tbWFwX3NlbSk7Ci0tIAoyLjI0LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
