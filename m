Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AEE7108725
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2019 05:20:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C130689DFA;
	Mon, 25 Nov 2019 04:20:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74A2189DEC
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2019 04:20:18 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5ddb567c0001>; Sun, 24 Nov 2019 20:20:12 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Sun, 24 Nov 2019 20:20:18 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Sun, 24 Nov 2019 20:20:18 -0800
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 25 Nov
 2019 04:20:17 +0000
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 25 Nov
 2019 04:20:13 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 25 Nov 2019 04:20:13 +0000
Received: from blueforge.nvidia.com (Not Verified[10.110.48.28]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5ddb567d0006>; Sun, 24 Nov 2019 20:20:13 -0800
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 05/19] mm: fix get_user_pages_remote()'s handling of
 FOLL_LONGTERM
Date: Sun, 24 Nov 2019 20:19:57 -0800
Message-ID: <20191125042011.3002372-6-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191125042011.3002372-1-jhubbard@nvidia.com>
References: <20191125042011.3002372-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1574655612; bh=l4ZzqtVW71Fwvoz1qyCbd1xWWEz8EY4C2cUJdAbaFHs=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=PuFsLnuGu1KfB/ZC9izxEq0bMZSKw8FTNCw9beyt6bkUSDvoRbbiuS99SR7As24lu
 RGbHmieWvPTXU5e+mq74L8miXctdPbS0ioC326V6mLcvZoRfydtyo4rIwM2R6Jm6Y6
 23VRYgCcNYQIW4DAuRBJaAfOxnfr8ibm/Si4ea/2FO0GHPZEt26wKzvbdKSJFb3SoI
 OQDgSp3ubf0/3+PrrJl2Ax3wUIMAX6Tzpjfxed19Rt0JuaQHyvhUbCzkCSmjSgb7lq
 2blCTd3N7xpKdUogXl+J6b4iDitiVq0ZaMwEly1saing+z2ZeMaF4JaRAtrZQeE9F4
 nJz2PdoULdpQA==
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
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>, Jason
 Gunthorpe <jgg@mellanox.com>, Vlastimil Babka <vbabka@suse.cz>,
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

QXMgaXQgc2F5cyBpbiB0aGUgdXBkYXRlZCBjb21tZW50IGluIGd1cC5jOiBjdXJyZW50IEZPTExf
TE9OR1RFUk0KYmVoYXZpb3IgaXMgaW5jb21wYXRpYmxlIHdpdGggRkFVTFRfRkxBR19BTExPV19S
RVRSWSBiZWNhdXNlIG9mIHRoZQpGUyBEQVggY2hlY2sgcmVxdWlyZW1lbnQgb24gdm1hcy4KCkhv
d2V2ZXIsIHRoZSBjb3JyZXNwb25kaW5nIHJlc3RyaWN0aW9uIGluIGdldF91c2VyX3BhZ2VzX3Jl
bW90ZSgpIHdhcwpzbGlnaHRseSBzdHJpY3RlciB0aGFuIGlzIGFjdHVhbGx5IHJlcXVpcmVkOiBp
dCBmb3JiYWRlIGFsbApGT0xMX0xPTkdURVJNIGNhbGxlcnMsIGJ1dCB3ZSBjYW4gYWN0dWFsbHkg
YWxsb3cgRk9MTF9MT05HVEVSTSBjYWxsZXJzCnRoYXQgZG8gbm90IHNldCB0aGUgImxvY2tlZCIg
YXJnLgoKVXBkYXRlIHRoZSBjb2RlIGFuZCBjb21tZW50cyB0byBsb29zZW4gdGhlIHJlc3RyaWN0
aW9uLCBhbGxvd2luZwpGT0xMX0xPTkdURVJNIGluIHNvbWUgY2FzZXMuCgpBbHNvLCBjb3B5IHRo
ZSBEQVggY2hlY2sgKCJpZiBhIFZNQSBpcyBEQVgsIGRvbid0IGFsbG93IGxvbmcgdGVybQpwaW5u
aW5nIikgZnJvbSB0aGUgVkZJTyBjYWxsIHNpdGUsIGFsbCB0aGUgd2F5IGludG8gdGhlIGludGVy
bmFscwpvZiBnZXRfdXNlcl9wYWdlc19yZW1vdGUoKSBhbmQgX19ndXBfbG9uZ3Rlcm1fbG9ja2Vk
KCkuIFRoYXQgaXM6CmdldF91c2VyX3BhZ2VzX3JlbW90ZSgpIGNhbGxzIF9fZ3VwX2xvbmd0ZXJt
X2xvY2tlZCgpLCB3aGljaCBpbiB0dXJuCmNhbGxzIGNoZWNrX2RheF92bWFzKCkuIFRoaXMgY2hl
Y2sgd2lsbCB0aGVuIGJlIHJlbW92ZWQgZnJvbSB0aGUgVkZJTwpjYWxsIHNpdGUgaW4gYSBzdWJz
ZXF1ZW50IHBhdGNoLgoKVGhhbmtzIHRvIEphc29uIEd1bnRob3JwZSBmb3IgcG9pbnRpbmcgb3V0
IGEgY2xlYW4gd2F5IHRvIGZpeCB0aGlzLAphbmQgdG8gRGFuIFdpbGxpYW1zIGZvciBoZWxwaW5n
IGNsYXJpZnkgdGhlIERBWCByZWZhY3RvcmluZy4KClRlc3RlZC1ieTogQWxleCBXaWxsaWFtc29u
IDxhbGV4LndpbGxpYW1zb25AcmVkaGF0LmNvbT4KQWNrZWQtYnk6IEFsZXggV2lsbGlhbXNvbiA8
YWxleC53aWxsaWFtc29uQHJlZGhhdC5jb20+ClJldmlld2VkLWJ5OiBKYXNvbiBHdW50aG9ycGUg
PGpnZ0BtZWxsYW5veC5jb20+ClJldmlld2VkLWJ5OiBJcmEgV2VpbnkgPGlyYS53ZWlueUBpbnRl
bC5jb20+ClN1Z2dlc3RlZC1ieTogSmFzb24gR3VudGhvcnBlIDxqZ2dAemllcGUuY2E+CkNjOiBE
YW4gV2lsbGlhbXMgPGRhbi5qLndpbGxpYW1zQGludGVsLmNvbT4KQ2M6IEplcm9tZSBHbGlzc2Ug
PGpnbGlzc2VAcmVkaGF0LmNvbT4KU2lnbmVkLW9mZi1ieTogSm9obiBIdWJiYXJkIDxqaHViYmFy
ZEBudmlkaWEuY29tPgotLS0KIG1tL2d1cC5jIHwgMjcgKysrKysrKysrKysrKysrKysrKysrKy0t
LS0tCiAxIGZpbGUgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9tbS9ndXAuYyBiL21tL2d1cC5jCmluZGV4IDNlY2NlMjk3YTQ3Zi4uYzBjNTY4
ODhlN2NjIDEwMDY0NAotLS0gYS9tbS9ndXAuYworKysgYi9tbS9ndXAuYwpAQCAtMjksNiArMjks
MTMgQEAgc3RydWN0IGZvbGxvd19wYWdlX2NvbnRleHQgewogCXVuc2lnbmVkIGludCBwYWdlX21h
c2s7CiB9OwogCitzdGF0aWMgX19hbHdheXNfaW5saW5lIGxvbmcgX19ndXBfbG9uZ3Rlcm1fbG9j
a2VkKHN0cnVjdCB0YXNrX3N0cnVjdCAqdHNrLAorCQkJCQkJICBzdHJ1Y3QgbW1fc3RydWN0ICpt
bSwKKwkJCQkJCSAgdW5zaWduZWQgbG9uZyBzdGFydCwKKwkJCQkJCSAgdW5zaWduZWQgbG9uZyBu
cl9wYWdlcywKKwkJCQkJCSAgc3RydWN0IHBhZ2UgKipwYWdlcywKKwkJCQkJCSAgc3RydWN0IHZt
X2FyZWFfc3RydWN0ICoqdm1hcywKKwkJCQkJCSAgdW5zaWduZWQgaW50IGZsYWdzKTsKIC8qCiAg
KiBSZXR1cm4gdGhlIGNvbXBvdW5kIGhlYWQgcGFnZSB3aXRoIHJlZiBhcHByb3ByaWF0ZWx5IGlu
Y3JlbWVudGVkLAogICogb3IgTlVMTCBpZiB0aGF0IGZhaWxlZC4KQEAgLTExNzksMTMgKzExODYs
MjMgQEAgbG9uZyBnZXRfdXNlcl9wYWdlc19yZW1vdGUoc3RydWN0IHRhc2tfc3RydWN0ICp0c2ss
IHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLAogCQlzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKip2bWFzLCBp
bnQgKmxvY2tlZCkKIHsKIAkvKgotCSAqIEZJWE1FOiBDdXJyZW50IEZPTExfTE9OR1RFUk0gYmVo
YXZpb3IgaXMgaW5jb21wYXRpYmxlIHdpdGgKKwkgKiBQYXJ0cyBvZiBGT0xMX0xPTkdURVJNIGJl
aGF2aW9yIGFyZSBpbmNvbXBhdGlibGUgd2l0aAogCSAqIEZBVUxUX0ZMQUdfQUxMT1dfUkVUUlkg
YmVjYXVzZSBvZiB0aGUgRlMgREFYIGNoZWNrIHJlcXVpcmVtZW50IG9uCi0JICogdm1hcy4gIEFz
IHRoZXJlIGFyZSBubyB1c2VycyBvZiB0aGlzIGZsYWcgaW4gdGhpcyBjYWxsIHdlIHNpbXBseQot
CSAqIGRpc2FsbG93IHRoaXMgb3B0aW9uIGZvciBub3cuCisJICogdm1hcy4gSG93ZXZlciwgdGhp
cyBvbmx5IGNvbWVzIHVwIGlmIGxvY2tlZCBpcyBzZXQsIGFuZCB0aGVyZSBhcmUKKwkgKiBjYWxs
ZXJzIHRoYXQgZG8gcmVxdWVzdCBGT0xMX0xPTkdURVJNLCBidXQgZG8gbm90IHNldCBsb2NrZWQu
IFNvLAorCSAqIGFsbG93IHdoYXQgd2UgY2FuLgogCSAqLwotCWlmIChXQVJOX09OX09OQ0UoZ3Vw
X2ZsYWdzICYgRk9MTF9MT05HVEVSTSkpCi0JCXJldHVybiAtRUlOVkFMOworCWlmIChndXBfZmxh
Z3MgJiBGT0xMX0xPTkdURVJNKSB7CisJCWlmIChXQVJOX09OX09OQ0UobG9ja2VkKSkKKwkJCXJl
dHVybiAtRUlOVkFMOworCQkvKgorCQkgKiBUaGlzIHdpbGwgY2hlY2sgdGhlIHZtYXMgKGV2ZW4g
aWYgb3VyIHZtYXMgYXJnIGlzIE5VTEwpCisJCSAqIGFuZCByZXR1cm4gLUVOT1RTVVBQIGlmIERB
WCBpc24ndCBhbGxvd2VkIGluIHRoaXMgY2FzZToKKwkJICovCisJCXJldHVybiBfX2d1cF9sb25n
dGVybV9sb2NrZWQodHNrLCBtbSwgc3RhcnQsIG5yX3BhZ2VzLCBwYWdlcywKKwkJCQkJICAgICB2
bWFzLCBndXBfZmxhZ3MgfCBGT0xMX1RPVUNIIHwKKwkJCQkJICAgICBGT0xMX1JFTU9URSk7CisJ
fQogCiAJcmV0dXJuIF9fZ2V0X3VzZXJfcGFnZXNfbG9ja2VkKHRzaywgbW0sIHN0YXJ0LCBucl9w
YWdlcywgcGFnZXMsIHZtYXMsCiAJCQkJICAgICAgIGxvY2tlZCwKLS0gCjIuMjQuMAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
