Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B836104B32
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2019 08:14:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 634556EB15;
	Thu, 21 Nov 2019 07:13:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 828116EAFF
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2019 07:13:56 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dd639300001>; Wed, 20 Nov 2019 23:13:52 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Wed, 20 Nov 2019 23:13:56 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Wed, 20 Nov 2019 23:13:56 -0800
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 21 Nov
 2019 07:13:55 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Thu, 21 Nov 2019 07:13:55 +0000
Received: from blueforge.nvidia.com (Not Verified[10.110.48.28]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5dd639330007>; Wed, 20 Nov 2019 23:13:55 -0800
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v7 05/24] mm: devmap: refactor 1-based refcounting for
 ZONE_DEVICE pages
Date: Wed, 20 Nov 2019 23:13:35 -0800
Message-ID: <20191121071354.456618-6-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191121071354.456618-1-jhubbard@nvidia.com>
References: <20191121071354.456618-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1574320432; bh=byIqgGf1EJth9UpGxCEb3oipovUAmrOXJL84EZuQwTc=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Type:Content-Transfer-Encoding;
 b=Llzls4pfdbcqqm4qnT5GuHajFXGLCPIcrUE0DkRt8l4I25CrZikNfd4Slc5Fxj9ks
 6gzzgHe7RbL9/EIRW/PXjDaekiNRUKMW+Ckc0cGN0pMQkVo703PFzL3arm6aJWWH/A
 VtfRcgYsvHYe66fnd5NwuyVH58A0bQd0SiXHJZMJ9wQ09DZrqXiYvUdh2Bhvvx34MK
 nDFGiosmgFzwqEurkc0Kx/3oAHEL18Jy2n5nSX/K8CVNSvCo78qh5h9uGIrr5WHNlZ
 m4EtlE0rzAiGMu2Edws3eUzOJ5hGMUJHtAXstiTcCu2yNe24rcOF+tKHiGLrPDj2sp
 +98qaNRV16i8w==
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
cmluZyBkZXNjcmliZWQgYWJvdmUuCgpDYzogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+
ClN1Z2dlc3RlZC1ieTogSsOpcsO0bWUgR2xpc3NlIDxqZ2xpc3NlQHJlZGhhdC5jb20+ClJldmll
d2VkLWJ5OiBEYW4gV2lsbGlhbXMgPGRhbi5qLndpbGxpYW1zQGludGVsLmNvbT4KUmV2aWV3ZWQt
Ynk6IEphbiBLYXJhIDxqYWNrQHN1c2UuY3o+ClNpZ25lZC1vZmYtYnk6IElyYSBXZWlueSA8aXJh
LndlaW55QGludGVsLmNvbT4KU2lnbmVkLW9mZi1ieTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBu
dmlkaWEuY29tPgotLS0KIGluY2x1ZGUvbGludXgvbW0uaCB8IDI3ICsrKysrKysrKysrKysrKysr
KysrKysrKy0tLQogbW0vbWVtcmVtYXAuYyAgICAgIHwgMTYgKystLS0tLS0tLS0tLS0tLQogMiBm
aWxlcyBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspLCAxNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9pbmNsdWRlL2xpbnV4L21tLmggYi9pbmNsdWRlL2xpbnV4L21tLmgKaW5kZXggYTJhZGY5
NWIzZjljLi45NjIyODM3NjEzOWMgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgvbW0uaAorKysg
Yi9pbmNsdWRlL2xpbnV4L21tLmgKQEAgLTk2Nyw5ICs5NjcsMTAgQEAgc3RhdGljIGlubGluZSBi
b29sIGlzX3pvbmVfZGV2aWNlX3BhZ2UoY29uc3Qgc3RydWN0IHBhZ2UgKnBhZ2UpCiAjZW5kaWYK
IAogI2lmZGVmIENPTkZJR19ERVZfUEFHRU1BUF9PUFMKLXZvaWQgX19wdXRfZGV2bWFwX21hbmFn
ZWRfcGFnZShzdHJ1Y3QgcGFnZSAqcGFnZSk7Cit2b2lkIGZyZWVfZGV2bWFwX21hbmFnZWRfcGFn
ZShzdHJ1Y3QgcGFnZSAqcGFnZSk7CiBERUNMQVJFX1NUQVRJQ19LRVlfRkFMU0UoZGV2bWFwX21h
bmFnZWRfa2V5KTsKLXN0YXRpYyBpbmxpbmUgYm9vbCBwdXRfZGV2bWFwX21hbmFnZWRfcGFnZShz
dHJ1Y3QgcGFnZSAqcGFnZSkKKworc3RhdGljIGlubGluZSBib29sIHBhZ2VfaXNfZGV2bWFwX21h
bmFnZWQoc3RydWN0IHBhZ2UgKnBhZ2UpCiB7CiAJaWYgKCFzdGF0aWNfYnJhbmNoX3VubGlrZWx5
KCZkZXZtYXBfbWFuYWdlZF9rZXkpKQogCQlyZXR1cm4gZmFsc2U7CkBAIC05NzgsNyArOTc5LDYg
QEAgc3RhdGljIGlubGluZSBib29sIHB1dF9kZXZtYXBfbWFuYWdlZF9wYWdlKHN0cnVjdCBwYWdl
ICpwYWdlKQogCXN3aXRjaCAocGFnZS0+cGdtYXAtPnR5cGUpIHsKIAljYXNlIE1FTU9SWV9ERVZJ
Q0VfUFJJVkFURToKIAljYXNlIE1FTU9SWV9ERVZJQ0VfRlNfREFYOgotCQlfX3B1dF9kZXZtYXBf
bWFuYWdlZF9wYWdlKHBhZ2UpOwogCQlyZXR1cm4gdHJ1ZTsKIAlkZWZhdWx0OgogCQlicmVhazsK
QEAgLTk4Niw2ICs5ODYsMjcgQEAgc3RhdGljIGlubGluZSBib29sIHB1dF9kZXZtYXBfbWFuYWdl
ZF9wYWdlKHN0cnVjdCBwYWdlICpwYWdlKQogCXJldHVybiBmYWxzZTsKIH0KIAorc3RhdGljIGlu
bGluZSBib29sIHB1dF9kZXZtYXBfbWFuYWdlZF9wYWdlKHN0cnVjdCBwYWdlICpwYWdlKQorewor
CWJvb2wgaXNfZGV2bWFwID0gcGFnZV9pc19kZXZtYXBfbWFuYWdlZChwYWdlKTsKKworCWlmIChp
c19kZXZtYXApIHsKKwkJaW50IGNvdW50ID0gcGFnZV9yZWZfZGVjX3JldHVybihwYWdlKTsKKwor
CQkvKgorCQkgKiBkZXZtYXAgcGFnZSByZWZjb3VudHMgYXJlIDEtYmFzZWQsIHJhdGhlciB0aGFu
IDAtYmFzZWQ6IGlmCisJCSAqIHJlZmNvdW50IGlzIDEsIHRoZW4gdGhlIHBhZ2UgaXMgZnJlZSBh
bmQgdGhlIHJlZmNvdW50IGlzCisJCSAqIHN0YWJsZSBiZWNhdXNlIG5vYm9keSBob2xkcyBhIHJl
ZmVyZW5jZSBvbiB0aGUgcGFnZS4KKwkJICovCisJCWlmIChjb3VudCA9PSAxKQorCQkJZnJlZV9k
ZXZtYXBfbWFuYWdlZF9wYWdlKHBhZ2UpOworCQllbHNlIGlmICghY291bnQpCisJCQlfX3B1dF9w
YWdlKHBhZ2UpOworCX0KKworCXJldHVybiBpc19kZXZtYXA7Cit9CisKICNlbHNlIC8qIENPTkZJ
R19ERVZfUEFHRU1BUF9PUFMgKi8KIHN0YXRpYyBpbmxpbmUgYm9vbCBwdXRfZGV2bWFwX21hbmFn
ZWRfcGFnZShzdHJ1Y3QgcGFnZSAqcGFnZSkKIHsKZGlmZiAtLWdpdCBhL21tL21lbXJlbWFwLmMg
Yi9tbS9tZW1yZW1hcC5jCmluZGV4IGU4OTlmYTg3NmE2Mi4uMmJhNzczODU5MDMxIDEwMDY0NAot
LS0gYS9tbS9tZW1yZW1hcC5jCisrKyBiL21tL21lbXJlbWFwLmMKQEAgLTQxMSwyMCArNDExLDgg
QEAgc3RydWN0IGRldl9wYWdlbWFwICpnZXRfZGV2X3BhZ2VtYXAodW5zaWduZWQgbG9uZyBwZm4s
CiBFWFBPUlRfU1lNQk9MX0dQTChnZXRfZGV2X3BhZ2VtYXApOwogCiAjaWZkZWYgQ09ORklHX0RF
Vl9QQUdFTUFQX09QUwotdm9pZCBfX3B1dF9kZXZtYXBfbWFuYWdlZF9wYWdlKHN0cnVjdCBwYWdl
ICpwYWdlKQordm9pZCBmcmVlX2Rldm1hcF9tYW5hZ2VkX3BhZ2Uoc3RydWN0IHBhZ2UgKnBhZ2Up
CiB7Ci0JaW50IGNvdW50ID0gcGFnZV9yZWZfZGVjX3JldHVybihwYWdlKTsKLQotCS8qIHN0aWxs
IGJ1c3kgKi8KLQlpZiAoY291bnQgPiAxKQotCQlyZXR1cm47Ci0KLQkvKiBvbmx5IHRyaWdnZXJl
ZCBieSB0aGUgZGV2X3BhZ2VtYXAgc2h1dGRvd24gcGF0aCAqLwotCWlmIChjb3VudCA9PSAwKSB7
Ci0JCV9fcHV0X3BhZ2UocGFnZSk7Ci0JCXJldHVybjsKLQl9Ci0KIAkvKiBub3RpZnkgcGFnZSBp
ZGxlIGZvciBkYXggKi8KIAlpZiAoIWlzX2RldmljZV9wcml2YXRlX3BhZ2UocGFnZSkpIHsKIAkJ
d2FrZV91cF92YXIoJnBhZ2UtPl9yZWZjb3VudCk7CkBAIC00NjEsNSArNDQ5LDUgQEAgdm9pZCBf
X3B1dF9kZXZtYXBfbWFuYWdlZF9wYWdlKHN0cnVjdCBwYWdlICpwYWdlKQogCXBhZ2UtPm1hcHBp
bmcgPSBOVUxMOwogCXBhZ2UtPnBnbWFwLT5vcHMtPnBhZ2VfZnJlZShwYWdlKTsKIH0KLUVYUE9S
VF9TWU1CT0woX19wdXRfZGV2bWFwX21hbmFnZWRfcGFnZSk7CitFWFBPUlRfU1lNQk9MKGZyZWVf
ZGV2bWFwX21hbmFnZWRfcGFnZSk7CiAjZW5kaWYgLyogQ09ORklHX0RFVl9QQUdFTUFQX09QUyAq
LwotLSAKMi4yNC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
