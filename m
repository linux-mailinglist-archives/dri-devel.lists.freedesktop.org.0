Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7AF117A0A
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 23:54:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2D9B6E5CF;
	Mon,  9 Dec 2019 22:54:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89B6A6E5B4
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2019 22:54:07 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5deed0890000>; Mon, 09 Dec 2019 14:54:01 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 09 Dec 2019 14:54:06 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 09 Dec 2019 14:54:06 -0800
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 9 Dec
 2019 22:54:06 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Mon, 9 Dec 2019 22:54:06 +0000
Received: from blueforge.nvidia.com (Not Verified[10.110.48.28]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5deed08d0001>; Mon, 09 Dec 2019 14:54:05 -0800
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v8 19/26] vfio,
 mm: pin_user_pages (FOLL_PIN) and put_user_page() conversion
Date: Mon, 9 Dec 2019 14:53:37 -0800
Message-ID: <20191209225344.99740-20-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191209225344.99740-1-jhubbard@nvidia.com>
References: <20191209225344.99740-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1575932041; bh=wk2NwG+UPRzhGeGA4o6oMgrCb1pvQrHxv3rBUNt8i3I=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=C/fTUzxTzc3p4YYS/Nv5gvqXhsAxxoWv8tZ974VATw38uiWGEbLNaDGmwbNqYtLK1
 K59KCCk/dyawtHZe5FCoi/kvtcW4tuPSy7Y/1aWeU93Ir6XhWJweBeyDa6HOSUR7Mt
 9ZlEDQlQeMhgvVQC7Ax4Htw9EfR2wJmO49/8vDlTMQQsyJc+VQSQNddYpablP3ZCSe
 UCSPMjSZHDwfu46LDOlrFiKiyN3j+N9FuQDUdnf7LKiQ9XM83hMEstSKoHfrGDbtKw
 M7fn1Bq5IxACM89YgHuTaBgLNc2aX9ruMDTWtsGw6NIfxaiiHBwfAv8XXXEt9BBtqm
 im/CQZKpFUklQ==
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

MS4gQ2hhbmdlIHZmaW8gZnJvbSBnZXRfdXNlcl9wYWdlc19yZW1vdGUoKSwgdG8KcGluX3VzZXJf
cGFnZXNfcmVtb3RlKCkuCgoyLiBCZWNhdXNlIGFsbCBGT0xMX1BJTi1hY3F1aXJlZCBwYWdlcyBt
dXN0IGJlIHJlbGVhc2VkIHZpYQpwdXRfdXNlcl9wYWdlKCksIGFsc28gY29udmVydCB0aGUgcHV0
X3BhZ2UoKSBjYWxsIG92ZXIgdG8KcHV0X3VzZXJfcGFnZXNfZGlydHlfbG9jaygpLgoKTm90ZSB0
aGF0IHRoaXMgZWZmZWN0aXZlbHkgY2hhbmdlcyB0aGUgY29kZSdzIGJlaGF2aW9yIGluCnZmaW9f
aW9tbXVfdHlwZTEuYzogcHV0X3BmbigpOiBpdCBub3cgdWx0aW1hdGVseSBjYWxscwpzZXRfcGFn
ZV9kaXJ0eV9sb2NrKCksIGluc3RlYWQgb2Ygc2V0X3BhZ2VfZGlydHkoKS4gVGhpcyBpcwpwcm9i
YWJseSBtb3JlIGFjY3VyYXRlLgoKQXMgQ2hyaXN0b3BoIEhlbGx3aWcgcHV0IGl0LCAic2V0X3Bh
Z2VfZGlydHkoKSBpcyBvbmx5IHNhZmUgaWYgd2UgYXJlCmRlYWxpbmcgd2l0aCBhIGZpbGUgYmFj
a2VkIHBhZ2Ugd2hlcmUgd2UgaGF2ZSByZWZlcmVuY2Ugb24gdGhlIGlub2RlIGl0CmhhbmdzIG9m
Zi4iIFsxXQoKWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAxOTA3MjMxNTM2NDAuR0I3
MjBAbHN0LmRlCgpUZXN0ZWQtYnk6IEFsZXggV2lsbGlhbXNvbiA8YWxleC53aWxsaWFtc29uQHJl
ZGhhdC5jb20+CkFja2VkLWJ5OiBBbGV4IFdpbGxpYW1zb24gPGFsZXgud2lsbGlhbXNvbkByZWRo
YXQuY29tPgpTaWduZWQtb2ZmLWJ5OiBKb2huIEh1YmJhcmQgPGpodWJiYXJkQG52aWRpYS5jb20+
Ci0tLQogZHJpdmVycy92ZmlvL3ZmaW9faW9tbXVfdHlwZTEuYyB8IDcgKysrLS0tLQogMSBmaWxl
IGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL3ZmaW8vdmZpb19pb21tdV90eXBlMS5jIGIvZHJpdmVycy92ZmlvL3ZmaW9faW9tbXVf
dHlwZTEuYwppbmRleCBiODAwZmM5YTAyNTEuLjE4YmZjMmZjOGU2ZCAxMDA2NDQKLS0tIGEvZHJp
dmVycy92ZmlvL3ZmaW9faW9tbXVfdHlwZTEuYworKysgYi9kcml2ZXJzL3ZmaW8vdmZpb19pb21t
dV90eXBlMS5jCkBAIC0zMDksOSArMzA5LDggQEAgc3RhdGljIGludCBwdXRfcGZuKHVuc2lnbmVk
IGxvbmcgcGZuLCBpbnQgcHJvdCkKIHsKIAlpZiAoIWlzX2ludmFsaWRfcmVzZXJ2ZWRfcGZuKHBm
bikpIHsKIAkJc3RydWN0IHBhZ2UgKnBhZ2UgPSBwZm5fdG9fcGFnZShwZm4pOwotCQlpZiAocHJv
dCAmIElPTU1VX1dSSVRFKQotCQkJU2V0UGFnZURpcnR5KHBhZ2UpOwotCQlwdXRfcGFnZShwYWdl
KTsKKworCQlwdXRfdXNlcl9wYWdlc19kaXJ0eV9sb2NrKCZwYWdlLCAxLCBwcm90ICYgSU9NTVVf
V1JJVEUpOwogCQlyZXR1cm4gMTsKIAl9CiAJcmV0dXJuIDA7CkBAIC0zMjksNyArMzI4LDcgQEAg
c3RhdGljIGludCB2YWRkcl9nZXRfcGZuKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLCB1bnNpZ25lZCBs
b25nIHZhZGRyLAogCQlmbGFncyB8PSBGT0xMX1dSSVRFOwogCiAJZG93bl9yZWFkKCZtbS0+bW1h
cF9zZW0pOwotCXJldCA9IGdldF91c2VyX3BhZ2VzX3JlbW90ZShOVUxMLCBtbSwgdmFkZHIsIDEs
IGZsYWdzIHwgRk9MTF9MT05HVEVSTSwKKwlyZXQgPSBwaW5fdXNlcl9wYWdlc19yZW1vdGUoTlVM
TCwgbW0sIHZhZGRyLCAxLCBmbGFncyB8IEZPTExfTE9OR1RFUk0sCiAJCQkJICAgIHBhZ2UsIE5V
TEwsIE5VTEwpOwogCWlmIChyZXQgPT0gMSkgewogCQkqcGZuID0gcGFnZV90b19wZm4ocGFnZVsw
XSk7Ci0tIAoyLjI0LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
