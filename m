Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D395101C05
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 09:18:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A429B6E937;
	Tue, 19 Nov 2019 08:18:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A795D6ECA4
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2019 08:17:09 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dd3a5020000>; Tue, 19 Nov 2019 00:17:06 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Tue, 19 Nov 2019 00:17:09 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Tue, 19 Nov 2019 00:17:09 -0800
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 19 Nov
 2019 08:17:08 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Tue, 19 Nov 2019 08:17:08 +0000
Received: from blueforge.nvidia.com (Not Verified[10.110.48.28]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5dd3a5030001>; Tue, 19 Nov 2019 00:17:08 -0800
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v6 19/24] vfio,
 mm: pin_user_pages (FOLL_PIN) and put_user_page() conversion
Date: Tue, 19 Nov 2019 00:16:38 -0800
Message-ID: <20191119081643.1866232-20-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191119081643.1866232-1-jhubbard@nvidia.com>
References: <20191119081643.1866232-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1574151426; bh=nI3kBsm1YYmEZh4r0pGrnWMl68q+Rq4M7HG7pTJrYP4=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=T5IJG+HTVygH2u0m0Mv6OczTGUqKtvbpp70aNAgr46Lv/5FUxQCDymEjKoZYchwCS
 dDGRB6oIAdIGrHPQYgtQKlg/zy/8Hs1T2lBONU/esrJoPaVUeuPcbPKOdv2BkXZfpQ
 dyDAJHWF9nmptamzAfrPv0+O0sFHqx26NldRXXDr4BwgfNikwHUHxYc1pDkVwWdzBM
 kt985oOnOiLDoJwYxS7AMFXhNxnAjGQexhRkahAFqPTulf7r3bnkZyfOvTvSGtExEV
 SclTkXD1WYWEH77uBjlSH8EZ6TY54Ii4shUQ31uCXJyLXAsO47jKu3F2ot93jfU5kd
 +vpAxtZSl26Zw==
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
MjBAbHN0LmRlCgpDYzogQWxleCBXaWxsaWFtc29uIDxhbGV4LndpbGxpYW1zb25AcmVkaGF0LmNv
bT4KU2lnbmVkLW9mZi1ieTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgotLS0K
IGRyaXZlcnMvdmZpby92ZmlvX2lvbW11X3R5cGUxLmMgfCA3ICsrKy0tLS0KIDEgZmlsZSBjaGFu
Z2VkLCAzIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy92ZmlvL3ZmaW9faW9tbXVfdHlwZTEuYyBiL2RyaXZlcnMvdmZpby92ZmlvX2lvbW11X3R5cGUx
LmMKaW5kZXggYzdhMTExYWQ5OTc1Li4xOGFhMzZiNTY4OTYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
dmZpby92ZmlvX2lvbW11X3R5cGUxLmMKKysrIGIvZHJpdmVycy92ZmlvL3ZmaW9faW9tbXVfdHlw
ZTEuYwpAQCAtMzI3LDkgKzMyNyw4IEBAIHN0YXRpYyBpbnQgcHV0X3Bmbih1bnNpZ25lZCBsb25n
IHBmbiwgaW50IHByb3QpCiB7CiAJaWYgKCFpc19pbnZhbGlkX3Jlc2VydmVkX3BmbihwZm4pKSB7
CiAJCXN0cnVjdCBwYWdlICpwYWdlID0gcGZuX3RvX3BhZ2UocGZuKTsKLQkJaWYgKHByb3QgJiBJ
T01NVV9XUklURSkKLQkJCVNldFBhZ2VEaXJ0eShwYWdlKTsKLQkJcHV0X3BhZ2UocGFnZSk7CisK
KwkJcHV0X3VzZXJfcGFnZXNfZGlydHlfbG9jaygmcGFnZSwgMSwgcHJvdCAmIElPTU1VX1dSSVRF
KTsKIAkJcmV0dXJuIDE7CiAJfQogCXJldHVybiAwOwpAQCAtMzQ3LDcgKzM0Niw3IEBAIHN0YXRp
YyBpbnQgdmFkZHJfZ2V0X3BmbihzdHJ1Y3QgbW1fc3RydWN0ICptbSwgdW5zaWduZWQgbG9uZyB2
YWRkciwKIAkJZmxhZ3MgfD0gRk9MTF9XUklURTsKIAogCWRvd25fcmVhZCgmbW0tPm1tYXBfc2Vt
KTsKLQlyZXQgPSBnZXRfdXNlcl9wYWdlc19yZW1vdGUoTlVMTCwgbW0sIHZhZGRyLCAxLCBmbGFn
cyB8IEZPTExfTE9OR1RFUk0sCisJcmV0ID0gcGluX3VzZXJfcGFnZXNfcmVtb3RlKE5VTEwsIG1t
LCB2YWRkciwgMSwgZmxhZ3MgfCBGT0xMX0xPTkdURVJNLAogCQkJCSAgICBwYWdlLCBOVUxMLCBO
VUxMKTsKIAlpZiAocmV0ID09IDEpIHsKIAkJKnBmbiA9IHBhZ2VfdG9fcGZuKHBhZ2VbMF0pOwot
LSAKMi4yNC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
