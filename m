Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B501117A01
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 23:54:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D67D76E5C5;
	Mon,  9 Dec 2019 22:54:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FF676E5A0
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2019 22:54:00 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5deed0730000>; Mon, 09 Dec 2019 14:53:39 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 09 Dec 2019 14:53:59 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 09 Dec 2019 14:53:59 -0800
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 9 Dec
 2019 22:53:55 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Mon, 9 Dec 2019 22:53:55 +0000
Received: from blueforge.nvidia.com (Not Verified[10.110.48.28]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5deed0820000>; Mon, 09 Dec 2019 14:53:55 -0800
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v8 06/26] mm: fix get_user_pages_remote()'s handling of
 FOLL_LONGTERM
Date: Mon, 9 Dec 2019 14:53:24 -0800
Message-ID: <20191209225344.99740-7-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191209225344.99740-1-jhubbard@nvidia.com>
References: <20191209225344.99740-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1575932020; bh=l4ZzqtVW71Fwvoz1qyCbd1xWWEz8EY4C2cUJdAbaFHs=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=Tc6ngqtdaDUUYOEZpgVNwCPnzvZKNYykbtQ3tPQgJ7XL23fY0QNCULxxFBi+lsPXX
 XDwVnw0tTtpKy6Q50IbDLdmOKpfug+eTUgstYjxxdNqJGPfcK1R+lI+5xfXnCrKk0h
 vR7xtB6lCCRfunBcDYw1DbHdsr0FBJMLzidLxFUIkiQFwApLbu29Qe7bVy66Vi9Ym/
 PqOy+2DjkhicWrqQZHOf88SY1f6fnW6jHiELsn5krAapqoIQggFqkgj7gX9eBl+1jj
 iD6MPf75Y/JAw17r9Na4KGxBjHvJhbxC3DCszYkpTwv5V2JBI/+6JQhenmBAUJjLZW
 7qHI+gx7vSotQ==
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
