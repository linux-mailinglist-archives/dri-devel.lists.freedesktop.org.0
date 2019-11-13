Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87774FA811
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 05:27:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C8636EC6D;
	Wed, 13 Nov 2019 04:27:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51FC36EC6B
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 04:27:13 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dcb86200002>; Tue, 12 Nov 2019 20:27:12 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Tue, 12 Nov 2019 20:27:13 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Tue, 12 Nov 2019 20:27:13 -0800
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 13 Nov
 2019 04:27:12 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 13 Nov 2019 04:27:12 +0000
Received: from blueforge.nvidia.com (Not Verified[10.110.48.28]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5dcb86200004>; Tue, 12 Nov 2019 20:27:12 -0800
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v4 08/23] vfio,
 mm: fix get_user_pages_remote() and FOLL_LONGTERM
Date: Tue, 12 Nov 2019 20:26:55 -0800
Message-ID: <20191113042710.3997854-9-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191113042710.3997854-1-jhubbard@nvidia.com>
References: <20191113042710.3997854-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1573619232; bh=0cowaOO6KitGFGMnJNwN3YLhZSQBgszQDobj6JSTgxM=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=EogAWVN9paP8N3pkbHvMzZjJ5gehKpeKWuou63lRw8FeGutg9NEVWBv94w4jqNJRm
 sP7yh5Bwkvnr/0TV5Z3e4j2dVGNmkogCcZln9kBLTSn9K0Oatp17+fcUcgsQGWsoWS
 IQl4a29AdwCbuc6xwcuhEu0vLJBbAArYTj6Wgw/ctGtRunEkjQ1pp7yxU7RrPP8lAR
 ABIaJ442Nhe8X7aHS9oHrcdxj6Z+rnSYflHxLJlLvgfFfztOMoj3tAMYX87B6jHFAT
 enxruNoT6/HUARpGfH/xCQlRketyioirDSfuiT/+GuSVFs4zl6mmoqJ5FcNaEb+aYL
 nMBW9JOSK/Ebg==
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

QXMgaXQgc2F5cyBpbiB0aGUgdXBkYXRlZCBjb21tZW50IGluIGd1cC5jOiBjdXJyZW50IEZPTExf
TE9OR1RFUk0KYmVoYXZpb3IgaXMgaW5jb21wYXRpYmxlIHdpdGggRkFVTFRfRkxBR19BTExPV19S
RVRSWSBiZWNhdXNlIG9mIHRoZQpGUyBEQVggY2hlY2sgcmVxdWlyZW1lbnQgb24gdm1hcy4KCkhv
d2V2ZXIsIHRoZSBjb3JyZXNwb25kaW5nIHJlc3RyaWN0aW9uIGluIGdldF91c2VyX3BhZ2VzX3Jl
bW90ZSgpIHdhcwpzbGlnaHRseSBzdHJpY3RlciB0aGFuIGlzIGFjdHVhbGx5IHJlcXVpcmVkOiBp
dCBmb3JiYWRlIGFsbApGT0xMX0xPTkdURVJNIGNhbGxlcnMsIGJ1dCB3ZSBjYW4gYWN0dWFsbHkg
YWxsb3cgRk9MTF9MT05HVEVSTSBjYWxsZXJzCnRoYXQgZG8gbm90IHNldCB0aGUgImxvY2tlZCIg
YXJnLgoKVXBkYXRlIHRoZSBjb2RlIGFuZCBjb21tZW50cyBhY2NvcmRpbmdseSwgYW5kIHVwZGF0
ZSB0aGUgVkZJTyBjYWxsZXIKdG8gdGFrZSBhZHZhbnRhZ2Ugb2YgdGhpcywgZml4aW5nIGEgYnVn
IGFzIGEgcmVzdWx0OiB0aGUgVkZJTyBjYWxsZXIKaXMgbG9naWNhbGx5IGEgRk9MTF9MT05HVEVS
TSB1c2VyLgoKQWxzbywgcmVtb3ZlIGFuIHVubmVzc2FyeSBwYWlyIG9mIGNhbGxzIHRoYXQgd2Vy
ZSByZWxlYXNpbmcgYW5kCnJlYWNxdWlyaW5nIHRoZSBtbWFwX3NlbS4gVGhlcmUgaXMgbm8gbmVl
ZCB0byBhdm9pZCBob2xkaW5nIG1tYXBfc2VtCmp1c3QgaW4gb3JkZXIgdG8gY2FsbCBwYWdlX3Rv
X3BmbigpLgoKQWxzbywgbW92ZSB0aGUgREFYIGNoZWNrICgiaWYgYSBWTUEgaXMgREFYLCBkb24n
dCBhbGxvdyBsb25nIHRlcm0KcGlubmluZyIpIGZyb20gdGhlIFZGSU8gY2FsbCBzaXRlLCBhbGwg
dGhlIHdheSBpbnRvIHRoZSBpbnRlcm5hbHMKb2YgZ2V0X3VzZXJfcGFnZXNfcmVtb3RlKCkgYW5k
IF9fZ3VwX2xvbmd0ZXJtX2xvY2tlZCgpLiBUaGF0IGlzOgpnZXRfdXNlcl9wYWdlc19yZW1vdGUo
KSBjYWxscyBfX2d1cF9sb25ndGVybV9sb2NrZWQoKSwgd2hpY2ggaW4gdHVybgpjYWxscyBjaGVj
a19kYXhfdm1hcygpLiBJdCdzIGxpZ2h0bHkgZXhwbGFpbmVkIGluIHRoZSBjb21tZW50cyBhcyB3
ZWxsLgoKVGhhbmtzIHRvIEphc29uIEd1bnRob3JwZSBmb3IgcG9pbnRpbmcgb3V0IGEgY2xlYW4g
d2F5IHRvIGZpeCB0aGlzLAphbmQgdG8gRGFuIFdpbGxpYW1zIGZvciBoZWxwaW5nIGNsYXJpZnkg
dGhlIERBWCByZWZhY3RvcmluZy4KClN1Z2dlc3RlZC1ieTogSmFzb24gR3VudGhvcnBlIDxqZ2dA
emllcGUuY2E+CkNjOiBEYW4gV2lsbGlhbXMgPGRhbi5qLndpbGxpYW1zQGludGVsLmNvbT4KQ2M6
IEplcm9tZSBHbGlzc2UgPGpnbGlzc2VAcmVkaGF0LmNvbT4KQ2M6IElyYSBXZWlueSA8aXJhLndl
aW55QGludGVsLmNvbT4KU2lnbmVkLW9mZi1ieTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlk
aWEuY29tPgotLS0KIGRyaXZlcnMvdmZpby92ZmlvX2lvbW11X3R5cGUxLmMgfCAyNSArKy0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tCiBtbS9ndXAuYyAgICAgICAgICAgICAgICAgICAgICAgIHwgMjcg
KysrKysrKysrKysrKysrKysrKysrKy0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDI0IGluc2VydGlv
bnMoKyksIDI4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmZpby92ZmlvX2lv
bW11X3R5cGUxLmMgYi9kcml2ZXJzL3ZmaW8vdmZpb19pb21tdV90eXBlMS5jCmluZGV4IGQ4NjQy
NzdlYTE2Zi4uNzMwMWI3MTBjOWE0IDEwMDY0NAotLS0gYS9kcml2ZXJzL3ZmaW8vdmZpb19pb21t
dV90eXBlMS5jCisrKyBiL2RyaXZlcnMvdmZpby92ZmlvX2lvbW11X3R5cGUxLmMKQEAgLTM0MCw3
ICszNDAsNiBAQCBzdGF0aWMgaW50IHZhZGRyX2dldF9wZm4oc3RydWN0IG1tX3N0cnVjdCAqbW0s
IHVuc2lnbmVkIGxvbmcgdmFkZHIsCiB7CiAJc3RydWN0IHBhZ2UgKnBhZ2VbMV07CiAJc3RydWN0
IHZtX2FyZWFfc3RydWN0ICp2bWE7Ci0Jc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWFzWzFdOwog
CXVuc2lnbmVkIGludCBmbGFncyA9IDA7CiAJaW50IHJldDsKIApAQCAtMzQ4LDMzICszNDcsMTMg
QEAgc3RhdGljIGludCB2YWRkcl9nZXRfcGZuKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLCB1bnNpZ25l
ZCBsb25nIHZhZGRyLAogCQlmbGFncyB8PSBGT0xMX1dSSVRFOwogCiAJZG93bl9yZWFkKCZtbS0+
bW1hcF9zZW0pOwotCWlmIChtbSA9PSBjdXJyZW50LT5tbSkgewotCQlyZXQgPSBnZXRfdXNlcl9w
YWdlcyh2YWRkciwgMSwgZmxhZ3MgfCBGT0xMX0xPTkdURVJNLCBwYWdlLAotCQkJCSAgICAgdm1h
cyk7Ci0JfSBlbHNlIHsKLQkJcmV0ID0gZ2V0X3VzZXJfcGFnZXNfcmVtb3RlKE5VTEwsIG1tLCB2
YWRkciwgMSwgZmxhZ3MsIHBhZ2UsCi0JCQkJCSAgICB2bWFzLCBOVUxMKTsKLQkJLyoKLQkJICog
VGhlIGxpZmV0aW1lIG9mIGEgdmFkZHJfZ2V0X3BmbigpIHBhZ2UgcGluIGlzCi0JCSAqIHVzZXJz
cGFjZS1jb250cm9sbGVkLiBJbiB0aGUgZnMtZGF4IGNhc2UgdGhpcyBjb3VsZAotCQkgKiBsZWFk
IHRvIGluZGVmaW5pdGUgc3RhbGxzIGluIGZpbGVzeXN0ZW0gb3BlcmF0aW9ucy4KLQkJICogRGlz
YWxsb3cgYXR0ZW1wdHMgdG8gcGluIGZzLWRheCBwYWdlcyB2aWEgdGhpcwotCQkgKiBpbnRlcmZh
Y2UuCi0JCSAqLwotCQlpZiAocmV0ID4gMCAmJiB2bWFfaXNfZnNkYXgodm1hc1swXSkpIHsKLQkJ
CXJldCA9IC1FT1BOT1RTVVBQOwotCQkJcHV0X3BhZ2UocGFnZVswXSk7Ci0JCX0KLQl9Ci0JdXBf
cmVhZCgmbW0tPm1tYXBfc2VtKTsKLQorCXJldCA9IGdldF91c2VyX3BhZ2VzX3JlbW90ZShOVUxM
LCBtbSwgdmFkZHIsIDEsIGZsYWdzIHwgRk9MTF9MT05HVEVSTSwKKwkJCQkgICAgcGFnZSwgTlVM
TCwgTlVMTCk7CiAJaWYgKHJldCA9PSAxKSB7CiAJCSpwZm4gPSBwYWdlX3RvX3BmbihwYWdlWzBd
KTsKIAkJcmV0dXJuIDA7CiAJfQogCi0JZG93bl9yZWFkKCZtbS0+bW1hcF9zZW0pOwotCiAJdmFk
ZHIgPSB1bnRhZ2dlZF9hZGRyKHZhZGRyKTsKIAogCXZtYSA9IGZpbmRfdm1hX2ludGVyc2VjdGlv
bihtbSwgdmFkZHIsIHZhZGRyICsgMSk7CmRpZmYgLS1naXQgYS9tbS9ndXAuYyBiL21tL2d1cC5j
CmluZGV4IDkzMzUyNGRlNjI0OS4uODM3MDJiMmU4NmM4IDEwMDY0NAotLS0gYS9tbS9ndXAuYwor
KysgYi9tbS9ndXAuYwpAQCAtMjksNiArMjksMTMgQEAgc3RydWN0IGZvbGxvd19wYWdlX2NvbnRl
eHQgewogCXVuc2lnbmVkIGludCBwYWdlX21hc2s7CiB9OwogCitzdGF0aWMgX19hbHdheXNfaW5s
aW5lIGxvbmcgX19ndXBfbG9uZ3Rlcm1fbG9ja2VkKHN0cnVjdCB0YXNrX3N0cnVjdCAqdHNrLAor
CQkJCQkJICBzdHJ1Y3QgbW1fc3RydWN0ICptbSwKKwkJCQkJCSAgdW5zaWduZWQgbG9uZyBzdGFy
dCwKKwkJCQkJCSAgdW5zaWduZWQgbG9uZyBucl9wYWdlcywKKwkJCQkJCSAgc3RydWN0IHBhZ2Ug
KipwYWdlcywKKwkJCQkJCSAgc3RydWN0IHZtX2FyZWFfc3RydWN0ICoqdm1hcywKKwkJCQkJCSAg
dW5zaWduZWQgaW50IGZsYWdzKTsKIC8qCiAgKiBSZXR1cm4gdGhlIGNvbXBvdW5kIGhlYWQgcGFn
ZSB3aXRoIHJlZiBhcHByb3ByaWF0ZWx5IGluY3JlbWVudGVkLAogICogb3IgTlVMTCBpZiB0aGF0
IGZhaWxlZC4KQEAgLTExNjcsMTMgKzExNzQsMjMgQEAgbG9uZyBnZXRfdXNlcl9wYWdlc19yZW1v
dGUoc3RydWN0IHRhc2tfc3RydWN0ICp0c2ssIHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLAogCQlzdHJ1
Y3Qgdm1fYXJlYV9zdHJ1Y3QgKip2bWFzLCBpbnQgKmxvY2tlZCkKIHsKIAkvKgotCSAqIEZJWE1F
OiBDdXJyZW50IEZPTExfTE9OR1RFUk0gYmVoYXZpb3IgaXMgaW5jb21wYXRpYmxlIHdpdGgKKwkg
KiBQYXJ0cyBvZiBGT0xMX0xPTkdURVJNIGJlaGF2aW9yIGFyZSBpbmNvbXBhdGlibGUgd2l0aAog
CSAqIEZBVUxUX0ZMQUdfQUxMT1dfUkVUUlkgYmVjYXVzZSBvZiB0aGUgRlMgREFYIGNoZWNrIHJl
cXVpcmVtZW50IG9uCi0JICogdm1hcy4gIEFzIHRoZXJlIGFyZSBubyB1c2VycyBvZiB0aGlzIGZs
YWcgaW4gdGhpcyBjYWxsIHdlIHNpbXBseQotCSAqIGRpc2FsbG93IHRoaXMgb3B0aW9uIGZvciBu
b3cuCisJICogdm1hcy4gSG93ZXZlciwgdGhpcyBvbmx5IGNvbWVzIHVwIGlmIGxvY2tlZCBpcyBz
ZXQsIGFuZCB0aGVyZSBhcmUKKwkgKiBjYWxsZXJzIHRoYXQgZG8gcmVxdWVzdCBGT0xMX0xPTkdU
RVJNLCBidXQgZG8gbm90IHNldCBsb2NrZWQuIFNvLAorCSAqIGFsbG93IHdoYXQgd2UgY2FuLgog
CSAqLwotCWlmIChXQVJOX09OX09OQ0UoZ3VwX2ZsYWdzICYgRk9MTF9MT05HVEVSTSkpCi0JCXJl
dHVybiAtRUlOVkFMOworCWlmIChndXBfZmxhZ3MgJiBGT0xMX0xPTkdURVJNKSB7CisJCWlmIChX
QVJOX09OX09OQ0UobG9ja2VkKSkKKwkJCXJldHVybiAtRUlOVkFMOworCQkvKgorCQkgKiBUaGlz
IHdpbGwgY2hlY2sgdGhlIHZtYXMgKGV2ZW4gaWYgb3VyIHZtYXMgYXJnIGlzIE5VTEwpCisJCSAq
IGFuZCByZXR1cm4gLUVOT1RTVVBQIGlmIERBWCBpc24ndCBhbGxvd2VkIGluIHRoaXMgY2FzZToK
KwkJICovCisJCXJldHVybiBfX2d1cF9sb25ndGVybV9sb2NrZWQodHNrLCBtbSwgc3RhcnQsIG5y
X3BhZ2VzLCBwYWdlcywKKwkJCQkJICAgICB2bWFzLCBndXBfZmxhZ3MgfCBGT0xMX1RPVUNIIHwK
KwkJCQkJICAgICBGT0xMX1JFTU9URSk7CisJfQogCiAJcmV0dXJuIF9fZ2V0X3VzZXJfcGFnZXNf
bG9ja2VkKHRzaywgbW0sIHN0YXJ0LCBucl9wYWdlcywgcGFnZXMsIHZtYXMsCiAJCQkJICAgICAg
IGxvY2tlZCwKLS0gCjIuMjQuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
