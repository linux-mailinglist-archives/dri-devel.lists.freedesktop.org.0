Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A24BCFD4B3
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2019 06:54:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F8A06E237;
	Fri, 15 Nov 2019 05:54:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D5CE6E0D0
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2019 05:53:45 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dce3d6b0000>; Thu, 14 Nov 2019 21:53:47 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Thu, 14 Nov 2019 21:53:44 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Thu, 14 Nov 2019 21:53:44 -0800
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 15 Nov
 2019 05:53:43 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Fri, 15 Nov 2019 05:53:43 +0000
Received: from blueforge.nvidia.com (Not Verified[10.110.48.28]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5dce3d670007>; Thu, 14 Nov 2019 21:53:43 -0800
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v5 05/24] mm: devmap: refactor 1-based refcounting for
 ZONE_DEVICE pages
Date: Thu, 14 Nov 2019 21:53:21 -0800
Message-ID: <20191115055340.1825745-6-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191115055340.1825745-1-jhubbard@nvidia.com>
References: <20191115055340.1825745-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1573797227; bh=OEnwZ2pSOFUNQcV1LOpiequ14+DMiNnpojwFAjOdr0c=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Type:Content-Transfer-Encoding;
 b=f4m4F0UeTyD1xLfyGGyfS3zzRWdKH+/EzvF5d+zG/CP+cvhvW4GRPRaVloB5QDVc/
 gxeBDD6tx88ks3gvuy47/zU2znjtLacUe9tkxB1KOTNECQj+pzT0Q2/C/PYbLbscUn
 L8y7WI7S1oYPF0mSVwAs+iGLOCiep7a6EIK3ElGS7rnES/yrBad6ZSg+PpnnXnuMFH
 v+ZsY1SsyJZhHmHl3jxpcPzMQhLcLPW66Uo6RwMX4XBF+sUBn9+lI9jpybcAuYDGoZ
 wNWwzyZCjvuG2TH+WglYq7Cbq6dYXrRIdsCkTQTMJpchndb9LKNOv4nnV/g+GXHE6t
 Qbm7KeaL7n6sg==
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
 Christoph Hellwig <hch@lst.de>, Jonathan Corbet <corbet@lwn.net>,
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

QW4gdXBjb21pbmcgcGF0Y2ggY2hhbmdlcyBhbmQgY29tcGxpY2F0ZXMgdGhlIHJlZmNvdW50aW5n
IGFuZAplc3BlY2lhbGx5IHRoZSAicHV0IHBhZ2UiIGFzcGVjdHMgb2YgaXQuIEluIG9yZGVyIHRv
IGtlZXAKZXZlcnl0aGluZyBjbGVhbiwgcmVmYWN0b3IgdGhlIGRldm1hcCBwYWdlIHJlbGVhc2Ug
cm91dGluZXM6CgoqIFJlbmFtZSBwdXRfZGV2bWFwX21hbmFnZWRfcGFnZSgpIHRvIHBhZ2VfaXNf
ZGV2bWFwX21hbmFnZWQoKSwKICBhbmQgbGltaXQgdGhlIGZ1bmN0aW9uYWxpdHkgdG8gInJlYWQg
b25seSI6IHJldHVybiBhIGJvb2wsCiAgd2l0aCBubyBzaWRlIGVmZmVjdHMuCgoqIEFkZCBhIG5l
dyByb3V0aW5lLCBwdXRfZGV2bWFwX21hbmFnZWRfcGFnZSgpLCB0byBoYW5kbGUgY2hlY2tpbmcK
ICB3aGF0IGtpbmQgb2YgcGFnZSBpdCBpcywgYW5kIHdoYXQga2luZCBvZiByZWZjb3VudCBoYW5k
bGluZyBpdAogIHJlcXVpcmVzLgoKKiBSZW5hbWUgX19wdXRfZGV2bWFwX21hbmFnZWRfcGFnZSgp
IHRvIGZyZWVfZGV2bWFwX21hbmFnZWRfcGFnZSgpLAogIGFuZCBsaW1pdCB0aGUgZnVuY3Rpb25h
bGl0eSB0byB1bmNvbmRpdGlvbmFsbHkgZnJlZWluZyBhIGRldm1hcAogIHBhZ2UuCgpUaGlzIGlz
IG9yaWdpbmFsbHkgYmFzZWQgb24gYSBzZXBhcmF0ZSBwYXRjaCBieSBJcmEgV2VpbnksIHdoaWNo
CmFwcGxpZWQgdG8gYW4gZWFybHkgdmVyc2lvbiBvZiB0aGUgcHV0X3VzZXJfcGFnZSgpIGV4cGVy
aW1lbnRzLgpTaW5jZSB0aGVuLCBKw6lyw7RtZSBHbGlzc2Ugc3VnZ2VzdGVkIHRoZSByZWZhY3Rv
cmluZyBkZXNjcmliZWQgYWJvdmUuCgpDYzogSmFuIEthcmEgPGphY2tAc3VzZS5jej4KQ2M6IErD
qXLDtG1lIEdsaXNzZSA8amdsaXNzZUByZWRoYXQuY29tPgpDYzogQ2hyaXN0b3BoIEhlbGx3aWcg
PGhjaEBsc3QuZGU+CkNjOiBEYW4gV2lsbGlhbXMgPGRhbi5qLndpbGxpYW1zQGludGVsLmNvbT4K
U3VnZ2VzdGVkLWJ5OiBKw6lyw7RtZSBHbGlzc2UgPGpnbGlzc2VAcmVkaGF0LmNvbT4KU2lnbmVk
LW9mZi1ieTogSXJhIFdlaW55IDxpcmEud2VpbnlAaW50ZWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBK
b2huIEh1YmJhcmQgPGpodWJiYXJkQG52aWRpYS5jb20+Ci0tLQogaW5jbHVkZS9saW51eC9tbS5o
IHwgMjcgKysrKysrKysrKysrKysrKysrKysrKysrLS0tCiBtbS9tZW1yZW1hcC5jICAgICAgfCAx
NiArKy0tLS0tLS0tLS0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDI2IGluc2VydGlvbnMoKyksIDE3
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvbW0uaCBiL2luY2x1ZGUv
bGludXgvbW0uaAppbmRleCBhMmFkZjk1YjNmOWMuLjk2MjI4Mzc2MTM5YyAxMDA2NDQKLS0tIGEv
aW5jbHVkZS9saW51eC9tbS5oCisrKyBiL2luY2x1ZGUvbGludXgvbW0uaApAQCAtOTY3LDkgKzk2
NywxMCBAQCBzdGF0aWMgaW5saW5lIGJvb2wgaXNfem9uZV9kZXZpY2VfcGFnZShjb25zdCBzdHJ1
Y3QgcGFnZSAqcGFnZSkKICNlbmRpZgogCiAjaWZkZWYgQ09ORklHX0RFVl9QQUdFTUFQX09QUwot
dm9pZCBfX3B1dF9kZXZtYXBfbWFuYWdlZF9wYWdlKHN0cnVjdCBwYWdlICpwYWdlKTsKK3ZvaWQg
ZnJlZV9kZXZtYXBfbWFuYWdlZF9wYWdlKHN0cnVjdCBwYWdlICpwYWdlKTsKIERFQ0xBUkVfU1RB
VElDX0tFWV9GQUxTRShkZXZtYXBfbWFuYWdlZF9rZXkpOwotc3RhdGljIGlubGluZSBib29sIHB1
dF9kZXZtYXBfbWFuYWdlZF9wYWdlKHN0cnVjdCBwYWdlICpwYWdlKQorCitzdGF0aWMgaW5saW5l
IGJvb2wgcGFnZV9pc19kZXZtYXBfbWFuYWdlZChzdHJ1Y3QgcGFnZSAqcGFnZSkKIHsKIAlpZiAo
IXN0YXRpY19icmFuY2hfdW5saWtlbHkoJmRldm1hcF9tYW5hZ2VkX2tleSkpCiAJCXJldHVybiBm
YWxzZTsKQEAgLTk3OCw3ICs5NzksNiBAQCBzdGF0aWMgaW5saW5lIGJvb2wgcHV0X2Rldm1hcF9t
YW5hZ2VkX3BhZ2Uoc3RydWN0IHBhZ2UgKnBhZ2UpCiAJc3dpdGNoIChwYWdlLT5wZ21hcC0+dHlw
ZSkgewogCWNhc2UgTUVNT1JZX0RFVklDRV9QUklWQVRFOgogCWNhc2UgTUVNT1JZX0RFVklDRV9G
U19EQVg6Ci0JCV9fcHV0X2Rldm1hcF9tYW5hZ2VkX3BhZ2UocGFnZSk7CiAJCXJldHVybiB0cnVl
OwogCWRlZmF1bHQ6CiAJCWJyZWFrOwpAQCAtOTg2LDYgKzk4NiwyNyBAQCBzdGF0aWMgaW5saW5l
IGJvb2wgcHV0X2Rldm1hcF9tYW5hZ2VkX3BhZ2Uoc3RydWN0IHBhZ2UgKnBhZ2UpCiAJcmV0dXJu
IGZhbHNlOwogfQogCitzdGF0aWMgaW5saW5lIGJvb2wgcHV0X2Rldm1hcF9tYW5hZ2VkX3BhZ2Uo
c3RydWN0IHBhZ2UgKnBhZ2UpCit7CisJYm9vbCBpc19kZXZtYXAgPSBwYWdlX2lzX2Rldm1hcF9t
YW5hZ2VkKHBhZ2UpOworCisJaWYgKGlzX2Rldm1hcCkgeworCQlpbnQgY291bnQgPSBwYWdlX3Jl
Zl9kZWNfcmV0dXJuKHBhZ2UpOworCisJCS8qCisJCSAqIGRldm1hcCBwYWdlIHJlZmNvdW50cyBh
cmUgMS1iYXNlZCwgcmF0aGVyIHRoYW4gMC1iYXNlZDogaWYKKwkJICogcmVmY291bnQgaXMgMSwg
dGhlbiB0aGUgcGFnZSBpcyBmcmVlIGFuZCB0aGUgcmVmY291bnQgaXMKKwkJICogc3RhYmxlIGJl
Y2F1c2Ugbm9ib2R5IGhvbGRzIGEgcmVmZXJlbmNlIG9uIHRoZSBwYWdlLgorCQkgKi8KKwkJaWYg
KGNvdW50ID09IDEpCisJCQlmcmVlX2Rldm1hcF9tYW5hZ2VkX3BhZ2UocGFnZSk7CisJCWVsc2Ug
aWYgKCFjb3VudCkKKwkJCV9fcHV0X3BhZ2UocGFnZSk7CisJfQorCisJcmV0dXJuIGlzX2Rldm1h
cDsKK30KKwogI2Vsc2UgLyogQ09ORklHX0RFVl9QQUdFTUFQX09QUyAqLwogc3RhdGljIGlubGlu
ZSBib29sIHB1dF9kZXZtYXBfbWFuYWdlZF9wYWdlKHN0cnVjdCBwYWdlICpwYWdlKQogewpkaWZm
IC0tZ2l0IGEvbW0vbWVtcmVtYXAuYyBiL21tL21lbXJlbWFwLmMKaW5kZXggZTg5OWZhODc2YTYy
Li4yYmE3NzM4NTkwMzEgMTAwNjQ0Ci0tLSBhL21tL21lbXJlbWFwLmMKKysrIGIvbW0vbWVtcmVt
YXAuYwpAQCAtNDExLDIwICs0MTEsOCBAQCBzdHJ1Y3QgZGV2X3BhZ2VtYXAgKmdldF9kZXZfcGFn
ZW1hcCh1bnNpZ25lZCBsb25nIHBmbiwKIEVYUE9SVF9TWU1CT0xfR1BMKGdldF9kZXZfcGFnZW1h
cCk7CiAKICNpZmRlZiBDT05GSUdfREVWX1BBR0VNQVBfT1BTCi12b2lkIF9fcHV0X2Rldm1hcF9t
YW5hZ2VkX3BhZ2Uoc3RydWN0IHBhZ2UgKnBhZ2UpCit2b2lkIGZyZWVfZGV2bWFwX21hbmFnZWRf
cGFnZShzdHJ1Y3QgcGFnZSAqcGFnZSkKIHsKLQlpbnQgY291bnQgPSBwYWdlX3JlZl9kZWNfcmV0
dXJuKHBhZ2UpOwotCi0JLyogc3RpbGwgYnVzeSAqLwotCWlmIChjb3VudCA+IDEpCi0JCXJldHVy
bjsKLQotCS8qIG9ubHkgdHJpZ2dlcmVkIGJ5IHRoZSBkZXZfcGFnZW1hcCBzaHV0ZG93biBwYXRo
ICovCi0JaWYgKGNvdW50ID09IDApIHsKLQkJX19wdXRfcGFnZShwYWdlKTsKLQkJcmV0dXJuOwot
CX0KLQogCS8qIG5vdGlmeSBwYWdlIGlkbGUgZm9yIGRheCAqLwogCWlmICghaXNfZGV2aWNlX3By
aXZhdGVfcGFnZShwYWdlKSkgewogCQl3YWtlX3VwX3ZhcigmcGFnZS0+X3JlZmNvdW50KTsKQEAg
LTQ2MSw1ICs0NDksNSBAQCB2b2lkIF9fcHV0X2Rldm1hcF9tYW5hZ2VkX3BhZ2Uoc3RydWN0IHBh
Z2UgKnBhZ2UpCiAJcGFnZS0+bWFwcGluZyA9IE5VTEw7CiAJcGFnZS0+cGdtYXAtPm9wcy0+cGFn
ZV9mcmVlKHBhZ2UpOwogfQotRVhQT1JUX1NZTUJPTChfX3B1dF9kZXZtYXBfbWFuYWdlZF9wYWdl
KTsKK0VYUE9SVF9TWU1CT0woZnJlZV9kZXZtYXBfbWFuYWdlZF9wYWdlKTsKICNlbmRpZiAvKiBD
T05GSUdfREVWX1BBR0VNQVBfT1BTICovCi0tIAoyLjI0LjAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
