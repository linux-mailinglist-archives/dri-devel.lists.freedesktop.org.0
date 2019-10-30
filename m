Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6FDDEAC1E
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2019 10:04:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08AE36EDC7;
	Thu, 31 Oct 2019 09:04:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2613C6EBB5
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2019 22:49:58 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dba139c0000>; Wed, 30 Oct 2019 15:50:04 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Wed, 30 Oct 2019 15:49:57 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Wed, 30 Oct 2019 15:49:57 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 30 Oct
 2019 22:49:57 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Wed, 30 Oct 2019 22:49:56 +0000
Received: from blueforge.nvidia.com (Not Verified[10.110.48.28]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5dba13920000>; Wed, 30 Oct 2019 15:49:55 -0700
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 18/19] mm/gup: remove support for gup(FOLL_LONGTERM)
Date: Wed, 30 Oct 2019 15:49:29 -0700
Message-ID: <20191030224930.3990755-19-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191030224930.3990755-1-jhubbard@nvidia.com>
References: <20191030224930.3990755-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Approved-At: Thu, 31 Oct 2019 09:04:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1572475804; bh=6eCoZ62YVqPRMh6hmCwd736iryX7QnOeiQKLTn0GI5E=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=IkuRtYB4d3kOJrZ+EENymTxZvsMF+ZD6tsSf6fZglZMnwtzOZ73h77ci85UZpFmUW
 fQmmlzdC8n8mJLqJjmlbdC3DO4uaZw0YHORB/HafxMGpmFoCkTJ32qpfQg459tX+YK
 +Gf494GooD+nQM+FC8NLkVHrkhEl1KDPfLs3huMk5X62opwbgjDWtnHAEEMzBGnI99
 TD+I6HBpEKDObno8f3eOMuEVqd6qK/ifgd+derpKD20XS8ykxtZtU6JDOQRPdAIVXL
 nhlxBDkBgZJpnJUcnjsjfG8G3sDLivqNtRrrO3BSwLQ5qluS/cq192ATGynOsvcFqk
 qSCcSKzrPnw1A==
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

Tm93IHRoYXQgYWxsIG90aGVyIGtlcm5lbCBjYWxsZXJzIG9mIGdldF91c2VyX3BhZ2VzKEZPTExf
TE9OR1RFUk0pCmhhdmUgYmVlbiBjb252ZXJ0ZWQgdG8gcGluX2xvbmd0ZXJtX3BhZ2VzKCksIGxv
Y2sgaXQgZG93bjoKCjEpIEFkZCBhbiBhc3NlcnRpb24gdG8gZ2V0X3VzZXJfcGFnZXMoKSwgcHJl
dmVudGluZyBjYWxsZXJzIGZyb20KICAgcGFzc2luZyBGT0xMX0xPTkdURVJNIChpbiBhZGRpdGlv
biB0byB0aGUgZXhpc3RpbmcgYXNzZXJ0aW9uIHRoYXQKICAgcHJldmVudHMgRk9MTF9QSU4pLgoK
MikgUmVtb3ZlIHRoZSBhc3NvY2lhdGVkIEdVUF9MT05HVEVSTV9CRU5DSE1BUksgdGVzdC4KClNp
Z25lZC1vZmYtYnk6IEpvaG4gSHViYmFyZCA8amh1YmJhcmRAbnZpZGlhLmNvbT4KLS0tCiBtbS9n
dXAuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCA4ICsrKystLS0tCiBtbS9n
dXBfYmVuY2htYXJrLmMgICAgICAgICAgICAgICAgICAgICAgICAgfCA5ICstLS0tLS0tLQogdG9v
bHMvdGVzdGluZy9zZWxmdGVzdHMvdm0vZ3VwX2JlbmNobWFyay5jIHwgNyArKy0tLS0tCiAzIGZp
bGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMTcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvbW0vZ3VwLmMgYi9tbS9ndXAuYwppbmRleCBlNTFiMzgyMGE5OTUuLjlhMjg5MzVhMmNiMSAx
MDA2NDQKLS0tIGEvbW0vZ3VwLmMKKysrIGIvbW0vZ3VwLmMKQEAgLTE3NDQsMTEgKzE3NDQsMTEg
QEAgbG9uZyBnZXRfdXNlcl9wYWdlcyh1bnNpZ25lZCBsb25nIHN0YXJ0LCB1bnNpZ25lZCBsb25n
IG5yX3BhZ2VzLAogCQlzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKip2bWFzKQogewogCS8qCi0JICog
QXMgZGV0YWlsZWQgYWJvdmUsIEZPTExfUElOIG11c3Qgb25seSBiZSBzZXQgaW50ZXJuYWxseSBi
eSB0aGUKLQkgKiBwaW5fdXNlcl9wYWdlKigpIGFuZCBwaW5fbG9uZ3Rlcm1fKigpIEFQSXMsIG5l
dmVyIGRpcmVjdGx5IGJ5IHRoZQotCSAqIGNhbGxlciwgc28gZW5mb3JjZSB0aGF0IHdpdGggYW4g
YXNzZXJ0aW9uOgorCSAqIEFzIGRldGFpbGVkIGFib3ZlLCBGT0xMX1BJTiBhbmQgRk9MTF9MT05H
VEVSTSBtdXN0IG9ubHkgYmUgc2V0CisJICogaW50ZXJuYWxseSBieSB0aGUgcGluX3VzZXJfcGFn
ZSooKSBhbmQgcGluX2xvbmd0ZXJtXyooKSBBUElzLCBuZXZlcgorCSAqIGRpcmVjdGx5IGJ5IHRo
ZSBjYWxsZXIsIHNvIGVuZm9yY2UgdGhhdCB3aXRoIGFuIGFzc2VydGlvbjoKIAkgKi8KLQlpZiAo
V0FSTl9PTl9PTkNFKGd1cF9mbGFncyAmIEZPTExfUElOKSkKKwlpZiAoV0FSTl9PTl9PTkNFKGd1
cF9mbGFncyAmIChGT0xMX1BJTiB8IEZPTExfTE9OR1RFUk0pKSkKIAkJcmV0dXJuIC1FSU5WQUw7
CiAKIAlyZXR1cm4gX19ndXBfbG9uZ3Rlcm1fbG9ja2VkKGN1cnJlbnQsIGN1cnJlbnQtPm1tLCBz
dGFydCwgbnJfcGFnZXMsCmRpZmYgLS1naXQgYS9tbS9ndXBfYmVuY2htYXJrLmMgYi9tbS9ndXBf
YmVuY2htYXJrLmMKaW5kZXggMmJiMGY1ZGY0ODAzLi5kZTY5NDE4NTViN2UgMTAwNjQ0Ci0tLSBh
L21tL2d1cF9iZW5jaG1hcmsuYworKysgYi9tbS9ndXBfYmVuY2htYXJrLmMKQEAgLTYsNyArNiw3
IEBACiAjaW5jbHVkZSA8bGludXgvZGVidWdmcy5oPgogCiAjZGVmaW5lIEdVUF9GQVNUX0JFTkNI
TUFSSwlfSU9XUignZycsIDEsIHN0cnVjdCBndXBfYmVuY2htYXJrKQotI2RlZmluZSBHVVBfTE9O
R1RFUk1fQkVOQ0hNQVJLCV9JT1dSKCdnJywgMiwgc3RydWN0IGd1cF9iZW5jaG1hcmspCisvKiBD
b21tYW5kIDIgaGFzIGJlZW4gZGVsZXRlZC4gKi8KICNkZWZpbmUgR1VQX0JFTkNITUFSSwkJX0lP
V1IoJ2cnLCAzLCBzdHJ1Y3QgZ3VwX2JlbmNobWFyaykKICNkZWZpbmUgUElOX0ZBU1RfQkVOQ0hN
QVJLCV9JT1dSKCdnJywgNCwgc3RydWN0IGd1cF9iZW5jaG1hcmspCiAjZGVmaW5lIFBJTl9MT05H
VEVSTV9CRU5DSE1BUksJX0lPV1IoJ2cnLCA1LCBzdHJ1Y3QgZ3VwX2JlbmNobWFyaykKQEAgLTI4
LDcgKzI4LDYgQEAgc3RhdGljIHZvaWQgcHV0X2JhY2tfcGFnZXMoaW50IGNtZCwgc3RydWN0IHBh
Z2UgKipwYWdlcywgdW5zaWduZWQgbG9uZyBucl9wYWdlcykKIAogCXN3aXRjaCAoY21kKSB7CiAJ
Y2FzZSBHVVBfRkFTVF9CRU5DSE1BUks6Ci0JY2FzZSBHVVBfTE9OR1RFUk1fQkVOQ0hNQVJLOgog
CWNhc2UgR1VQX0JFTkNITUFSSzoKIAkJZm9yIChpID0gMDsgaSA8IG5yX3BhZ2VzOyBpKyspCiAJ
CQlwdXRfcGFnZShwYWdlc1tpXSk7CkBAIC05NCwxMSArOTMsNiBAQCBzdGF0aWMgaW50IF9fZ3Vw
X2JlbmNobWFya19pb2N0bCh1bnNpZ25lZCBpbnQgY21kLAogCQkJbnIgPSBnZXRfdXNlcl9wYWdl
c19mYXN0KGFkZHIsIG5yLCBndXAtPmZsYWdzICYgMSwKIAkJCQkJCSBwYWdlcyArIGkpOwogCQkJ
YnJlYWs7Ci0JCWNhc2UgR1VQX0xPTkdURVJNX0JFTkNITUFSSzoKLQkJCW5yID0gZ2V0X3VzZXJf
cGFnZXMoYWRkciwgbnIsCi0JCQkJCSAgICAoZ3VwLT5mbGFncyAmIDEpIHwgRk9MTF9MT05HVEVS
TSwKLQkJCQkJICAgIHBhZ2VzICsgaSwgTlVMTCk7Ci0JCQlicmVhazsKIAkJY2FzZSBHVVBfQkVO
Q0hNQVJLOgogCQkJbnIgPSBnZXRfdXNlcl9wYWdlcyhhZGRyLCBuciwgZ3VwLT5mbGFncyAmIDEs
IHBhZ2VzICsgaSwKIAkJCQkJICAgIE5VTEwpOwpAQCAtMTU3LDcgKzE1MSw2IEBAIHN0YXRpYyBs
b25nIGd1cF9iZW5jaG1hcmtfaW9jdGwoc3RydWN0IGZpbGUgKmZpbGVwLCB1bnNpZ25lZCBpbnQg
Y21kLAogCiAJc3dpdGNoIChjbWQpIHsKIAljYXNlIEdVUF9GQVNUX0JFTkNITUFSSzoKLQljYXNl
IEdVUF9MT05HVEVSTV9CRU5DSE1BUks6CiAJY2FzZSBHVVBfQkVOQ0hNQVJLOgogCWNhc2UgUElO
X0ZBU1RfQkVOQ0hNQVJLOgogCWNhc2UgUElOX0xPTkdURVJNX0JFTkNITUFSSzoKZGlmZiAtLWdp
dCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3ZtL2d1cF9iZW5jaG1hcmsuYyBiL3Rvb2xzL3Rl
c3Rpbmcvc2VsZnRlc3RzL3ZtL2d1cF9iZW5jaG1hcmsuYwppbmRleCBjNWM5MzRjMGY0MDIuLjVl
ZjNjZjhmM2RhNSAxMDA2NDQKLS0tIGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvdm0vZ3VwX2Jl
bmNobWFyay5jCisrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3ZtL2d1cF9iZW5jaG1hcmsu
YwpAQCAtMTUsNyArMTUsNyBAQAogI2RlZmluZSBQQUdFX1NJWkUgc3lzY29uZihfU0NfUEFHRVNJ
WkUpCiAKICNkZWZpbmUgR1VQX0ZBU1RfQkVOQ0hNQVJLCV9JT1dSKCdnJywgMSwgc3RydWN0IGd1
cF9iZW5jaG1hcmspCi0jZGVmaW5lIEdVUF9MT05HVEVSTV9CRU5DSE1BUksJX0lPV1IoJ2cnLCAy
LCBzdHJ1Y3QgZ3VwX2JlbmNobWFyaykKKy8qIENvbW1hbmQgMiBoYXMgYmVlbiBkZWxldGVkLiAq
LwogI2RlZmluZSBHVVBfQkVOQ0hNQVJLCQlfSU9XUignZycsIDMsIHN0cnVjdCBndXBfYmVuY2ht
YXJrKQogCiAvKgpAQCAtNDYsNyArNDYsNyBAQCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqKmFy
Z3YpCiAJY2hhciAqZmlsZSA9ICIvZGV2L3plcm8iOwogCWNoYXIgKnA7CiAKLQl3aGlsZSAoKG9w
dCA9IGdldG9wdChhcmdjLCBhcmd2LCAibTpyOm46ZjphYmN0VExVdXdTSCIpKSAhPSAtMSkgewor
CXdoaWxlICgob3B0ID0gZ2V0b3B0KGFyZ2MsIGFyZ3YsICJtOnI6bjpmOmFiY3RUVXV3U0giKSkg
IT0gLTEpIHsKIAkJc3dpdGNoIChvcHQpIHsKIAkJY2FzZSAnYSc6CiAJCQljbWQgPSBQSU5fRkFT
VF9CRU5DSE1BUks7CkBAIC03Miw5ICs3Miw2IEBAIGludCBtYWluKGludCBhcmdjLCBjaGFyICoq
YXJndikKIAkJY2FzZSAnVCc6CiAJCQl0aHAgPSAwOwogCQkJYnJlYWs7Ci0JCWNhc2UgJ0wnOgot
CQkJY21kID0gR1VQX0xPTkdURVJNX0JFTkNITUFSSzsKLQkJCWJyZWFrOwogCQljYXNlICdVJzoK
IAkJCWNtZCA9IEdVUF9CRU5DSE1BUks7CiAJCQlicmVhazsKLS0gCjIuMjMuMAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
