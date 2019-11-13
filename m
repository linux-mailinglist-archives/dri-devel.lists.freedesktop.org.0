Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 974FDFA7FD
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 05:27:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C192E6EC66;
	Wed, 13 Nov 2019 04:27:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1656A6EC6E
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 04:27:23 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dcb85ea0004>; Tue, 12 Nov 2019 20:26:18 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Tue, 12 Nov 2019 20:27:14 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Tue, 12 Nov 2019 20:27:14 -0800
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 13 Nov
 2019 04:27:14 +0000
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 13 Nov
 2019 04:27:13 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 13 Nov 2019 04:27:13 +0000
Received: from blueforge.nvidia.com (Not Verified[10.110.48.28]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5dcb86210004>; Tue, 12 Nov 2019 20:27:13 -0800
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v4 18/23] vfio,
 mm: pin_longterm_pages (FOLL_PIN) and put_user_page() conversion
Date: Tue, 12 Nov 2019 20:27:05 -0800
Message-ID: <20191113042710.3997854-19-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191113042710.3997854-1-jhubbard@nvidia.com>
References: <20191113042710.3997854-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1573619178; bh=RnRJrtQN+5UdnoCHLTDDIM4Uj622/kU3w0i+XdRmMBA=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=qjhMc7DfDfE2CnJipE9Xpl78yOetq8IYJMcdij2E87o2gYbsY3HvkrNGoCBE1zhjB
 iEXY0QBl3z0SU6UNwKxhykkW/44Bl/Q8vMQSXrYw74NoxNaevVAm1iweV5QjbRkgep
 JOjsCcQaxpo5Rt6AJEY78o2ZvoCRHib9Z/KCUYQ0Ra4LJKR1P24Fbb7G36ATvoGY/Y
 X+gfAvG2oB+COHXkO2SpSW8oWfxTDU8v5JiW7EZg9xPqChqszkip4WXUSWTAF4gN+f
 qLyabne88cZ0zx9eQXpcq6StPfiaEhYdSIr91A5rCi5IG4s6TubWJlmTOposhtAaZl
 uT3Mrf/92U1Qg==
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
bW11X3R5cGUxLmMgfCA5ICsrKystLS0tLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygr
KSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3ZmaW8vdmZpb19pb21tdV90
eXBlMS5jIGIvZHJpdmVycy92ZmlvL3ZmaW9faW9tbXVfdHlwZTEuYwppbmRleCA3MzAxYjcxMGM5
YTQuLjE2MDM0NTk4MDVmMSAxMDA2NDQKLS0tIGEvZHJpdmVycy92ZmlvL3ZmaW9faW9tbXVfdHlw
ZTEuYworKysgYi9kcml2ZXJzL3ZmaW8vdmZpb19pb21tdV90eXBlMS5jCkBAIC0zMjcsOSArMzI3
LDggQEAgc3RhdGljIGludCBwdXRfcGZuKHVuc2lnbmVkIGxvbmcgcGZuLCBpbnQgcHJvdCkKIHsK
IAlpZiAoIWlzX2ludmFsaWRfcmVzZXJ2ZWRfcGZuKHBmbikpIHsKIAkJc3RydWN0IHBhZ2UgKnBh
Z2UgPSBwZm5fdG9fcGFnZShwZm4pOwotCQlpZiAocHJvdCAmIElPTU1VX1dSSVRFKQotCQkJU2V0
UGFnZURpcnR5KHBhZ2UpOwotCQlwdXRfcGFnZShwYWdlKTsKKworCQlwdXRfdXNlcl9wYWdlc19k
aXJ0eV9sb2NrKCZwYWdlLCAxLCBwcm90ICYgSU9NTVVfV1JJVEUpOwogCQlyZXR1cm4gMTsKIAl9
CiAJcmV0dXJuIDA7CkBAIC0zNDcsOCArMzQ2LDggQEAgc3RhdGljIGludCB2YWRkcl9nZXRfcGZu
KHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLCB1bnNpZ25lZCBsb25nIHZhZGRyLAogCQlmbGFncyB8PSBG
T0xMX1dSSVRFOwogCiAJZG93bl9yZWFkKCZtbS0+bW1hcF9zZW0pOwotCXJldCA9IGdldF91c2Vy
X3BhZ2VzX3JlbW90ZShOVUxMLCBtbSwgdmFkZHIsIDEsIGZsYWdzIHwgRk9MTF9MT05HVEVSTSwK
LQkJCQkgICAgcGFnZSwgTlVMTCwgTlVMTCk7CisJcmV0ID0gcGluX2xvbmd0ZXJtX3BhZ2VzX3Jl
bW90ZShOVUxMLCBtbSwgdmFkZHIsIDEsIGZsYWdzLCBwYWdlLCBOVUxMLAorCQkJCQlOVUxMKTsK
IAlpZiAocmV0ID09IDEpIHsKIAkJKnBmbiA9IHBhZ2VfdG9fcGZuKHBhZ2VbMF0pOwogCQlyZXR1
cm4gMDsKLS0gCjIuMjQuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
