Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D898511A1C2
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2019 03:53:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3915D6EA5A;
	Wed, 11 Dec 2019 02:53:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B35BD6EA4B
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2019 02:53:24 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5df05a0e0001>; Tue, 10 Dec 2019 18:53:02 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Tue, 10 Dec 2019 18:53:24 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Tue, 10 Dec 2019 18:53:24 -0800
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 11 Dec
 2019 02:53:23 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Wed, 11 Dec 2019 02:53:23 +0000
Received: from blueforge.nvidia.com (Not Verified[10.110.48.28]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5df05a220001>; Tue, 10 Dec 2019 18:53:23 -0800
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v9 04/25] mm: devmap: refactor 1-based refcounting for
 ZONE_DEVICE pages
Date: Tue, 10 Dec 2019 18:52:57 -0800
Message-ID: <20191211025318.457113-5-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191211025318.457113-1-jhubbard@nvidia.com>
References: <20191211025318.457113-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1576032782; bh=r3XA8lSkA5Bnz921S0tMCXc9LaTJg03zUmdbkjLWRbI=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Type:Content-Transfer-Encoding;
 b=EcVGYlysfzlu9HdNLvcx52jQ4+uWhUWgll3IAOf/A7FqS7QAg9NjpzR1IWtEPwnOF
 3lmSeFe3jQRNECtPVAqMVNJOC6kJZXe4rL7XCZMN92rY+h9x7vdn7pdQs5BUZuHjIV
 gEswcohMLwkvAhYNxRNgF0oFZel1oPxNEohWduao2pVrI53gj1Z/BdRqAYZnGW0BIO
 MRW905EZZyIBDlJDCNN4rnNZYfT1Wa7vtJ6Z159N6GWfzRuidsmpriQS4EQGqR8tWR
 2NTc+4AafhlBvlSH+rLZcg00UtOi/dBjt7mzyNzyswp4X1DXZTQBk5ngmq9MZHFO+K
 QR/nm9ecd/yOQ==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
cmluZyBkZXNjcmliZWQgYWJvdmUuCgpDYzogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+
ClN1Z2dlc3RlZC1ieTogSsOpcsO0bWUgR2xpc3NlIDxqZ2xpc3NlQHJlZGhhdC5jb20+ClJldmll
d2VkLWJ5OiBEYW4gV2lsbGlhbXMgPGRhbi5qLndpbGxpYW1zQGludGVsLmNvbT4KUmV2aWV3ZWQt
Ynk6IEphbiBLYXJhIDxqYWNrQHN1c2UuY3o+ClNpZ25lZC1vZmYtYnk6IElyYSBXZWlueSA8aXJh
LndlaW55QGludGVsLmNvbT4KU2lnbmVkLW9mZi1ieTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBu
dmlkaWEuY29tPgotLS0KIGluY2x1ZGUvbGludXgvbW0uaCB8IDE3ICsrKysrKysrKysrKystLS0t
CiBtbS9tZW1yZW1hcC5jICAgICAgfCAxNiArKy0tLS0tLS0tLS0tLS0tCiBtbS9zd2FwLmMgICAg
ICAgICAgfCAyNCArKysrKysrKysrKysrKysrKysrKysrKysKIDMgZmlsZXMgY2hhbmdlZCwgMzkg
aW5zZXJ0aW9ucygrKSwgMTggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51
eC9tbS5oIGIvaW5jbHVkZS9saW51eC9tbS5oCmluZGV4IGM5N2VhM2I2OTRlNi4uNzdhNGRmMDZj
OGE3IDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L21tLmgKKysrIGIvaW5jbHVkZS9saW51eC9t
bS5oCkBAIC05NTIsOSArOTUyLDEwIEBAIHN0YXRpYyBpbmxpbmUgYm9vbCBpc196b25lX2Rldmlj
ZV9wYWdlKGNvbnN0IHN0cnVjdCBwYWdlICpwYWdlKQogI2VuZGlmCiAKICNpZmRlZiBDT05GSUdf
REVWX1BBR0VNQVBfT1BTCi12b2lkIF9fcHV0X2Rldm1hcF9tYW5hZ2VkX3BhZ2Uoc3RydWN0IHBh
Z2UgKnBhZ2UpOwordm9pZCBmcmVlX2Rldm1hcF9tYW5hZ2VkX3BhZ2Uoc3RydWN0IHBhZ2UgKnBh
Z2UpOwogREVDTEFSRV9TVEFUSUNfS0VZX0ZBTFNFKGRldm1hcF9tYW5hZ2VkX2tleSk7Ci1zdGF0
aWMgaW5saW5lIGJvb2wgcHV0X2Rldm1hcF9tYW5hZ2VkX3BhZ2Uoc3RydWN0IHBhZ2UgKnBhZ2Up
CisKK3N0YXRpYyBpbmxpbmUgYm9vbCBwYWdlX2lzX2Rldm1hcF9tYW5hZ2VkKHN0cnVjdCBwYWdl
ICpwYWdlKQogewogCWlmICghc3RhdGljX2JyYW5jaF91bmxpa2VseSgmZGV2bWFwX21hbmFnZWRf
a2V5KSkKIAkJcmV0dXJuIGZhbHNlOwpAQCAtOTYzLDcgKzk2NCw2IEBAIHN0YXRpYyBpbmxpbmUg
Ym9vbCBwdXRfZGV2bWFwX21hbmFnZWRfcGFnZShzdHJ1Y3QgcGFnZSAqcGFnZSkKIAlzd2l0Y2gg
KHBhZ2UtPnBnbWFwLT50eXBlKSB7CiAJY2FzZSBNRU1PUllfREVWSUNFX1BSSVZBVEU6CiAJY2Fz
ZSBNRU1PUllfREVWSUNFX0ZTX0RBWDoKLQkJX19wdXRfZGV2bWFwX21hbmFnZWRfcGFnZShwYWdl
KTsKIAkJcmV0dXJuIHRydWU7CiAJZGVmYXVsdDoKIAkJYnJlYWs7CkBAIC05NzEsNyArOTcxLDE0
IEBAIHN0YXRpYyBpbmxpbmUgYm9vbCBwdXRfZGV2bWFwX21hbmFnZWRfcGFnZShzdHJ1Y3QgcGFn
ZSAqcGFnZSkKIAlyZXR1cm4gZmFsc2U7CiB9CiAKK2Jvb2wgcHV0X2Rldm1hcF9tYW5hZ2VkX3Bh
Z2Uoc3RydWN0IHBhZ2UgKnBhZ2UpOworCiAjZWxzZSAvKiBDT05GSUdfREVWX1BBR0VNQVBfT1BT
ICovCitzdGF0aWMgaW5saW5lIGJvb2wgcGFnZV9pc19kZXZtYXBfbWFuYWdlZChzdHJ1Y3QgcGFn
ZSAqcGFnZSkKK3sKKwlyZXR1cm4gZmFsc2U7Cit9CisKIHN0YXRpYyBpbmxpbmUgYm9vbCBwdXRf
ZGV2bWFwX21hbmFnZWRfcGFnZShzdHJ1Y3QgcGFnZSAqcGFnZSkKIHsKIAlyZXR1cm4gZmFsc2U7
CkBAIC0xMDI4LDggKzEwMzUsMTAgQEAgc3RhdGljIGlubGluZSB2b2lkIHB1dF9wYWdlKHN0cnVj
dCBwYWdlICpwYWdlKQogCSAqIG5lZWQgdG8gaW5mb3JtIHRoZSBkZXZpY2UgZHJpdmVyIHRocm91
Z2ggY2FsbGJhY2suIFNlZQogCSAqIGluY2x1ZGUvbGludXgvbWVtcmVtYXAuaCBhbmQgSE1NIGZv
ciBkZXRhaWxzLgogCSAqLwotCWlmIChwdXRfZGV2bWFwX21hbmFnZWRfcGFnZShwYWdlKSkKKwlp
ZiAocGFnZV9pc19kZXZtYXBfbWFuYWdlZChwYWdlKSkgeworCQlwdXRfZGV2bWFwX21hbmFnZWRf
cGFnZShwYWdlKTsKIAkJcmV0dXJuOworCX0KIAogCWlmIChwdXRfcGFnZV90ZXN0emVybyhwYWdl
KSkKIAkJX19wdXRfcGFnZShwYWdlKTsKZGlmZiAtLWdpdCBhL21tL21lbXJlbWFwLmMgYi9tbS9t
ZW1yZW1hcC5jCmluZGV4IGU4OTlmYTg3NmE2Mi4uMmJhNzczODU5MDMxIDEwMDY0NAotLS0gYS9t
bS9tZW1yZW1hcC5jCisrKyBiL21tL21lbXJlbWFwLmMKQEAgLTQxMSwyMCArNDExLDggQEAgc3Ry
dWN0IGRldl9wYWdlbWFwICpnZXRfZGV2X3BhZ2VtYXAodW5zaWduZWQgbG9uZyBwZm4sCiBFWFBP
UlRfU1lNQk9MX0dQTChnZXRfZGV2X3BhZ2VtYXApOwogCiAjaWZkZWYgQ09ORklHX0RFVl9QQUdF
TUFQX09QUwotdm9pZCBfX3B1dF9kZXZtYXBfbWFuYWdlZF9wYWdlKHN0cnVjdCBwYWdlICpwYWdl
KQordm9pZCBmcmVlX2Rldm1hcF9tYW5hZ2VkX3BhZ2Uoc3RydWN0IHBhZ2UgKnBhZ2UpCiB7Ci0J
aW50IGNvdW50ID0gcGFnZV9yZWZfZGVjX3JldHVybihwYWdlKTsKLQotCS8qIHN0aWxsIGJ1c3kg
Ki8KLQlpZiAoY291bnQgPiAxKQotCQlyZXR1cm47Ci0KLQkvKiBvbmx5IHRyaWdnZXJlZCBieSB0
aGUgZGV2X3BhZ2VtYXAgc2h1dGRvd24gcGF0aCAqLwotCWlmIChjb3VudCA9PSAwKSB7Ci0JCV9f
cHV0X3BhZ2UocGFnZSk7Ci0JCXJldHVybjsKLQl9Ci0KIAkvKiBub3RpZnkgcGFnZSBpZGxlIGZv
ciBkYXggKi8KIAlpZiAoIWlzX2RldmljZV9wcml2YXRlX3BhZ2UocGFnZSkpIHsKIAkJd2FrZV91
cF92YXIoJnBhZ2UtPl9yZWZjb3VudCk7CkBAIC00NjEsNSArNDQ5LDUgQEAgdm9pZCBfX3B1dF9k
ZXZtYXBfbWFuYWdlZF9wYWdlKHN0cnVjdCBwYWdlICpwYWdlKQogCXBhZ2UtPm1hcHBpbmcgPSBO
VUxMOwogCXBhZ2UtPnBnbWFwLT5vcHMtPnBhZ2VfZnJlZShwYWdlKTsKIH0KLUVYUE9SVF9TWU1C
T0woX19wdXRfZGV2bWFwX21hbmFnZWRfcGFnZSk7CitFWFBPUlRfU1lNQk9MKGZyZWVfZGV2bWFw
X21hbmFnZWRfcGFnZSk7CiAjZW5kaWYgLyogQ09ORklHX0RFVl9QQUdFTUFQX09QUyAqLwpkaWZm
IC0tZ2l0IGEvbW0vc3dhcC5jIGIvbW0vc3dhcC5jCmluZGV4IDUzNDFhZTkzODYxZi4uNDlmN2My
ZWVhMGJhIDEwMDY0NAotLS0gYS9tbS9zd2FwLmMKKysrIGIvbW0vc3dhcC5jCkBAIC0xMTAyLDMg
KzExMDIsMjcgQEAgdm9pZCBfX2luaXQgc3dhcF9zZXR1cCh2b2lkKQogCSAqIF9yZWFsbHlfIGRv
bid0IHdhbnQgdG8gY2x1c3RlciBtdWNoIG1vcmUKIAkgKi8KIH0KKworI2lmZGVmIENPTkZJR19E
RVZfUEFHRU1BUF9PUFMKK2Jvb2wgcHV0X2Rldm1hcF9tYW5hZ2VkX3BhZ2Uoc3RydWN0IHBhZ2Ug
KnBhZ2UpCit7CisJYm9vbCBpc19kZXZtYXAgPSBwYWdlX2lzX2Rldm1hcF9tYW5hZ2VkKHBhZ2Up
OworCisJaWYgKGlzX2Rldm1hcCkgeworCQlpbnQgY291bnQgPSBwYWdlX3JlZl9kZWNfcmV0dXJu
KHBhZ2UpOworCisJCS8qCisJCSAqIGRldm1hcCBwYWdlIHJlZmNvdW50cyBhcmUgMS1iYXNlZCwg
cmF0aGVyIHRoYW4gMC1iYXNlZDogaWYKKwkJICogcmVmY291bnQgaXMgMSwgdGhlbiB0aGUgcGFn
ZSBpcyBmcmVlIGFuZCB0aGUgcmVmY291bnQgaXMKKwkJICogc3RhYmxlIGJlY2F1c2Ugbm9ib2R5
IGhvbGRzIGEgcmVmZXJlbmNlIG9uIHRoZSBwYWdlLgorCQkgKi8KKwkJaWYgKGNvdW50ID09IDEp
CisJCQlmcmVlX2Rldm1hcF9tYW5hZ2VkX3BhZ2UocGFnZSk7CisJCWVsc2UgaWYgKCFjb3VudCkK
KwkJCV9fcHV0X3BhZ2UocGFnZSk7CisJfQorCisJcmV0dXJuIGlzX2Rldm1hcDsKK30KK0VYUE9S
VF9TWU1CT0wocHV0X2Rldm1hcF9tYW5hZ2VkX3BhZ2UpOworI2VuZGlmCi0tIAoyLjI0LjAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
