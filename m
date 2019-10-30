Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98962EAC3B
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2019 10:05:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E4C56EDE2;
	Thu, 31 Oct 2019 09:04:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 580566EBB5
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2019 22:49:52 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dba13950000>; Wed, 30 Oct 2019 15:49:57 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Wed, 30 Oct 2019 15:49:51 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Wed, 30 Oct 2019 15:49:51 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 30 Oct
 2019 22:49:50 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Wed, 30 Oct 2019 22:49:49 +0000
Received: from blueforge.nvidia.com (Not Verified[10.110.48.28]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5dba138c0001>; Wed, 30 Oct 2019 15:49:49 -0700
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 13/19] media/v4l2-core: pin_longterm_pages (FOLL_PIN) and
 put_user_page() conversion
Date: Wed, 30 Oct 2019 15:49:24 -0700
Message-ID: <20191030224930.3990755-14-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191030224930.3990755-1-jhubbard@nvidia.com>
References: <20191030224930.3990755-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Approved-At: Thu, 31 Oct 2019 09:04:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1572475798; bh=liO76MrwJT5y5IUfrUHPe1ML08BZFmwb/vxBRrGctqM=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=egCaFtYuo8+CT+HGUuhn4CTP4FIrxiMrJr2kWgc9xfTJ5cEAMwWGRKwLs2VOgUq/F
 NJ3shg6jl0qZBeC7ekWw9gTGFrEvjXleJORBgmE0+ZdMOoK/cir9C/w9xBiSIYzatT
 hUu0cV5G8FZEjpwcLq1br7D5vruu5jL8CTLvFcT52aSl1rx9F3VQuJfCX3B5yVYKNU
 Vi0wtWFrefmyVyZn7egaMruJYGdJuzg5tvP/eQPBX1SB4AKaFRrzkSG32lG8jP90bI
 MziM+fZHHn1Aehu9qPQUgGQ60q8CjJyM0+PI7V+hPwAyAeOr3xVGZt9xJSfiBEny8j
 2y38bgavyYeww==
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

MS4gQ2hhbmdlIHY0bDIgZnJvbSBnZXRfdXNlcl9wYWdlcyhGT0xMX0xPTkdURVJNKSwgdG8KcGlu
X2xvbmd0ZXJtX3BhZ2VzKCksIHdoaWNoIHNldHMgYm90aCBGT0xMX0xPTkdURVJNIGFuZCBGT0xM
X1BJTi4KCjIuIEJlY2F1c2UgYWxsIEZPTExfUElOLWFjcXVpcmVkIHBhZ2VzIG11c3QgYmUgcmVs
ZWFzZWQgdmlhCnB1dF91c2VyX3BhZ2UoKSwgYWxzbyBjb252ZXJ0IHRoZSBwdXRfcGFnZSgpIGNh
bGwgb3ZlciB0bwpwdXRfdXNlcl9wYWdlc19kaXJ0eV9sb2NrKCkuCgpDYzogTWF1cm8gQ2FydmFs
aG8gQ2hlaGFiIDxtY2hlaGFiQGtlcm5lbC5vcmc+ClNpZ25lZC1vZmYtYnk6IEpvaG4gSHViYmFy
ZCA8amh1YmJhcmRAbnZpZGlhLmNvbT4KLS0tCiBkcml2ZXJzL21lZGlhL3Y0bDItY29yZS92aWRl
b2J1Zi1kbWEtc2cuYyB8IDEzICsrKysrLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2Vy
dGlvbnMoKyksIDggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS92NGwy
LWNvcmUvdmlkZW9idWYtZG1hLXNnLmMgYi9kcml2ZXJzL21lZGlhL3Y0bDItY29yZS92aWRlb2J1
Zi1kbWEtc2cuYwppbmRleCAyODI2MjE5MGMzYWIuLjliOWM1YjM3YmY1OSAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9tZWRpYS92NGwyLWNvcmUvdmlkZW9idWYtZG1hLXNnLmMKKysrIGIvZHJpdmVycy9t
ZWRpYS92NGwyLWNvcmUvdmlkZW9idWYtZG1hLXNnLmMKQEAgLTE4MywxMiArMTgzLDEyIEBAIHN0
YXRpYyBpbnQgdmlkZW9idWZfZG1hX2luaXRfdXNlcl9sb2NrZWQoc3RydWN0IHZpZGVvYnVmX2Rt
YWJ1ZiAqZG1hLAogCWRwcmludGsoMSwgImluaXQgdXNlciBbMHglbHgrMHglbHggPT4gJWQgcGFn
ZXNdXG4iLAogCQlkYXRhLCBzaXplLCBkbWEtPm5yX3BhZ2VzKTsKIAotCWVyciA9IGdldF91c2Vy
X3BhZ2VzKGRhdGEgJiBQQUdFX01BU0ssIGRtYS0+bnJfcGFnZXMsCi0JCQkgICAgIGZsYWdzIHwg
Rk9MTF9MT05HVEVSTSwgZG1hLT5wYWdlcywgTlVMTCk7CisJZXJyID0gcGluX2xvbmd0ZXJtX3Bh
Z2VzKGRhdGEgJiBQQUdFX01BU0ssIGRtYS0+bnJfcGFnZXMsCisJCQkJIGZsYWdzLCBkbWEtPnBh
Z2VzLCBOVUxMKTsKIAogCWlmIChlcnIgIT0gZG1hLT5ucl9wYWdlcykgewogCQlkbWEtPm5yX3Bh
Z2VzID0gKGVyciA+PSAwKSA/IGVyciA6IDA7Ci0JCWRwcmludGsoMSwgImdldF91c2VyX3BhZ2Vz
OiBlcnI9JWQgWyVkXVxuIiwgZXJyLAorCQlkcHJpbnRrKDEsICJwaW5fbG9uZ3Rlcm1fcGFnZXM6
IGVycj0lZCBbJWRdXG4iLCBlcnIsCiAJCQlkbWEtPm5yX3BhZ2VzKTsKIAkJcmV0dXJuIGVyciA8
IDAgPyBlcnIgOiAtRUlOVkFMOwogCX0KQEAgLTM0OSwxMSArMzQ5LDggQEAgaW50IHZpZGVvYnVm
X2RtYV9mcmVlKHN0cnVjdCB2aWRlb2J1Zl9kbWFidWYgKmRtYSkKIAlCVUdfT04oZG1hLT5zZ2xl
bik7CiAKIAlpZiAoZG1hLT5wYWdlcykgewotCQlmb3IgKGkgPSAwOyBpIDwgZG1hLT5ucl9wYWdl
czsgaSsrKSB7Ci0JCQlpZiAoZG1hLT5kaXJlY3Rpb24gPT0gRE1BX0ZST01fREVWSUNFKQotCQkJ
CXNldF9wYWdlX2RpcnR5X2xvY2soZG1hLT5wYWdlc1tpXSk7Ci0JCQlwdXRfcGFnZShkbWEtPnBh
Z2VzW2ldKTsKLQkJfQorCQlwdXRfdXNlcl9wYWdlc19kaXJ0eV9sb2NrKGRtYS0+cGFnZXMsIGRt
YS0+bnJfcGFnZXMsCisJCQkJCSAgZG1hLT5kaXJlY3Rpb24gPT0gRE1BX0ZST01fREVWSUNFKTsK
IAkJa2ZyZWUoZG1hLT5wYWdlcyk7CiAJCWRtYS0+cGFnZXMgPSBOVUxMOwogCX0KLS0gCjIuMjMu
MAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
