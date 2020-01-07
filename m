Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C711335E2
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2020 23:46:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46BD96E149;
	Tue,  7 Jan 2020 22:46:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8831B6E14A
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2020 22:46:01 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e150a170000>; Tue, 07 Jan 2020 14:45:43 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Tue, 07 Jan 2020 14:46:00 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Tue, 07 Jan 2020 14:46:00 -0800
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 7 Jan
 2020 22:46:00 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Tue, 7 Jan 2020 22:46:00 +0000
Received: from blueforge.nvidia.com (Not Verified[10.110.48.28]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5e150a280000>; Tue, 07 Jan 2020 14:46:00 -0800
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v12 04/22] mm: devmap: refactor 1-based refcounting for
 ZONE_DEVICE pages
Date: Tue, 7 Jan 2020 14:45:40 -0800
Message-ID: <20200107224558.2362728-5-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200107224558.2362728-1-jhubbard@nvidia.com>
References: <20200107224558.2362728-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1578437143; bh=sFl7O5qkL6cYvLdmqdIk73RGtBB6FCZqokigbZBUrMY=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Type:Content-Transfer-Encoding;
 b=O7SXpxnPfqnoi4GkfX4so/K6LKfxjZp9CFDJ3hVzTFsaw4FNiM/p6hZBbACyEBoCo
 yf7XHOIf+eLp2Cc8iSvvFq+7VVBTNhxlJK2H4m3tNJA9T04i/IpArDY83drJCVtieP
 WvKrcmGDV1h+J/pam3tWGzn3AFe7r9EB4BEn96s+m3X1dOJgFjsCgMRfVjcRE7GcQO
 OXzcGGaF+DQycOPNUdlM6VVLec/PB+SmLFJxkPb5PBwM0273Q5m9hD9uGZYFiMIOJq
 1HbJa5Z72byvvVP5aOGCdgLBJmfeDOJJBJm1c/wRoCBSs5TideUVdkvht8rIV74H2G
 FyCDx/8nPt7KA==
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
 Al Viro <viro@zeniv.linux.org.uk>,
 "Kirill A . Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>,
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
dyByb3V0aW5lLCBwdXRfZGV2bWFwX21hbmFnZWRfcGFnZSgpLCB0byBoYW5kbGUKICBkZWNyZW1l
bnRpbmcgdGhlIHJlZmNvdW50IGZvciBaT05FX0RFVklDRSBwYWdlcy4KCiogQ2hhbmdlIGNhbGxl
cnMgKGp1c3QgcmVsZWFzZV9wYWdlcygpIGFuZCBwdXRfcGFnZSgpKSB0byBjaGVjawogIHBhZ2Vf
aXNfZGV2bWFwX21hbmFnZWQoKSBiZWZvcmUgY2FsbGluZyB0aGUgbmV3CiAgcHV0X2Rldm1hcF9t
YW5hZ2VkX3BhZ2UoKSByb3V0aW5lLiBUaGlzIGlzIGEgcGVyZm9ybWFuY2UKICBwb2ludDogcHV0
X3BhZ2UoKSBpcyBhIGhvdCBwYXRoLCBzbyB3ZSBuZWVkIHRvIGF2b2lkIG5vbi0KICBpbmxpbmUg
ZnVuY3Rpb24gY2FsbHMgd2hlcmUgcG9zc2libGUuCgoqIFJlbmFtZSBfX3B1dF9kZXZtYXBfbWFu
YWdlZF9wYWdlKCkgdG8gZnJlZV9kZXZtYXBfbWFuYWdlZF9wYWdlKCksCiAgYW5kIGxpbWl0IHRo
ZSBmdW5jdGlvbmFsaXR5IHRvIHVuY29uZGl0aW9uYWxseSBmcmVlaW5nIGEgZGV2bWFwCiAgcGFn
ZS4KClRoaXMgaXMgb3JpZ2luYWxseSBiYXNlZCBvbiBhIHNlcGFyYXRlIHBhdGNoIGJ5IElyYSBX
ZWlueSwgd2hpY2gKYXBwbGllZCB0byBhbiBlYXJseSB2ZXJzaW9uIG9mIHRoZSBwdXRfdXNlcl9w
YWdlKCkgZXhwZXJpbWVudHMuClNpbmNlIHRoZW4sIErDqXLDtG1lIEdsaXNzZSBzdWdnZXN0ZWQg
dGhlIHJlZmFjdG9yaW5nIGRlc2NyaWJlZCBhYm92ZS4KCkNjOiBDaHJpc3RvcGggSGVsbHdpZyA8
aGNoQGxzdC5kZT4KQ2M6IEtpcmlsbCBBLiBTaHV0ZW1vdiA8a2lyaWxsQHNodXRlbW92Lm5hbWU+
ClN1Z2dlc3RlZC1ieTogSsOpcsO0bWUgR2xpc3NlIDxqZ2xpc3NlQHJlZGhhdC5jb20+ClJldmll
d2VkLWJ5OiBEYW4gV2lsbGlhbXMgPGRhbi5qLndpbGxpYW1zQGludGVsLmNvbT4KUmV2aWV3ZWQt
Ynk6IEphbiBLYXJhIDxqYWNrQHN1c2UuY3o+ClNpZ25lZC1vZmYtYnk6IElyYSBXZWlueSA8aXJh
LndlaW55QGludGVsLmNvbT4KU2lnbmVkLW9mZi1ieTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBu
dmlkaWEuY29tPgotLS0KIGluY2x1ZGUvbGludXgvbW0uaCB8IDE4ICsrKysrKysrKysrKystLS0t
LQogbW0vbWVtcmVtYXAuYyAgICAgIHwgMTUgKy0tLS0tLS0tLS0tLS0tCiBtbS9zd2FwLmMgICAg
ICAgICAgfCAyNyArKysrKysrKysrKysrKysrKysrKysrKysrKy0KIDMgZmlsZXMgY2hhbmdlZCwg
NDAgaW5zZXJ0aW9ucygrKSwgMjAgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9s
aW51eC9tbS5oIGIvaW5jbHVkZS9saW51eC9tbS5oCmluZGV4IDgwYTkxNjJiNDA2Yy4uZTIwMzJm
ZjY0MGViIDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L21tLmgKKysrIGIvaW5jbHVkZS9saW51
eC9tbS5oCkBAIC05NTIsOSArOTUyLDEwIEBAIHN0YXRpYyBpbmxpbmUgYm9vbCBpc196b25lX2Rl
dmljZV9wYWdlKGNvbnN0IHN0cnVjdCBwYWdlICpwYWdlKQogI2VuZGlmCiAKICNpZmRlZiBDT05G
SUdfREVWX1BBR0VNQVBfT1BTCi12b2lkIF9fcHV0X2Rldm1hcF9tYW5hZ2VkX3BhZ2Uoc3RydWN0
IHBhZ2UgKnBhZ2UpOwordm9pZCBmcmVlX2Rldm1hcF9tYW5hZ2VkX3BhZ2Uoc3RydWN0IHBhZ2Ug
KnBhZ2UpOwogREVDTEFSRV9TVEFUSUNfS0VZX0ZBTFNFKGRldm1hcF9tYW5hZ2VkX2tleSk7Ci1z
dGF0aWMgaW5saW5lIGJvb2wgcHV0X2Rldm1hcF9tYW5hZ2VkX3BhZ2Uoc3RydWN0IHBhZ2UgKnBh
Z2UpCisKK3N0YXRpYyBpbmxpbmUgYm9vbCBwYWdlX2lzX2Rldm1hcF9tYW5hZ2VkKHN0cnVjdCBw
YWdlICpwYWdlKQogewogCWlmICghc3RhdGljX2JyYW5jaF91bmxpa2VseSgmZGV2bWFwX21hbmFn
ZWRfa2V5KSkKIAkJcmV0dXJuIGZhbHNlOwpAQCAtOTYzLDcgKzk2NCw2IEBAIHN0YXRpYyBpbmxp
bmUgYm9vbCBwdXRfZGV2bWFwX21hbmFnZWRfcGFnZShzdHJ1Y3QgcGFnZSAqcGFnZSkKIAlzd2l0
Y2ggKHBhZ2UtPnBnbWFwLT50eXBlKSB7CiAJY2FzZSBNRU1PUllfREVWSUNFX1BSSVZBVEU6CiAJ
Y2FzZSBNRU1PUllfREVWSUNFX0ZTX0RBWDoKLQkJX19wdXRfZGV2bWFwX21hbmFnZWRfcGFnZShw
YWdlKTsKIAkJcmV0dXJuIHRydWU7CiAJZGVmYXVsdDoKIAkJYnJlYWs7CkBAIC05NzEsMTEgKzk3
MSwxNyBAQCBzdGF0aWMgaW5saW5lIGJvb2wgcHV0X2Rldm1hcF9tYW5hZ2VkX3BhZ2Uoc3RydWN0
IHBhZ2UgKnBhZ2UpCiAJcmV0dXJuIGZhbHNlOwogfQogCit2b2lkIHB1dF9kZXZtYXBfbWFuYWdl
ZF9wYWdlKHN0cnVjdCBwYWdlICpwYWdlKTsKKwogI2Vsc2UgLyogQ09ORklHX0RFVl9QQUdFTUFQ
X09QUyAqLwotc3RhdGljIGlubGluZSBib29sIHB1dF9kZXZtYXBfbWFuYWdlZF9wYWdlKHN0cnVj
dCBwYWdlICpwYWdlKQorc3RhdGljIGlubGluZSBib29sIHBhZ2VfaXNfZGV2bWFwX21hbmFnZWQo
c3RydWN0IHBhZ2UgKnBhZ2UpCiB7CiAJcmV0dXJuIGZhbHNlOwogfQorCitzdGF0aWMgaW5saW5l
IHZvaWQgcHV0X2Rldm1hcF9tYW5hZ2VkX3BhZ2Uoc3RydWN0IHBhZ2UgKnBhZ2UpCit7Cit9CiAj
ZW5kaWYgLyogQ09ORklHX0RFVl9QQUdFTUFQX09QUyAqLwogCiBzdGF0aWMgaW5saW5lIGJvb2wg
aXNfZGV2aWNlX3ByaXZhdGVfcGFnZShjb25zdCBzdHJ1Y3QgcGFnZSAqcGFnZSkKQEAgLTEwMjgs
OCArMTAzNCwxMCBAQCBzdGF0aWMgaW5saW5lIHZvaWQgcHV0X3BhZ2Uoc3RydWN0IHBhZ2UgKnBh
Z2UpCiAJICogbmVlZCB0byBpbmZvcm0gdGhlIGRldmljZSBkcml2ZXIgdGhyb3VnaCBjYWxsYmFj
ay4gU2VlCiAJICogaW5jbHVkZS9saW51eC9tZW1yZW1hcC5oIGFuZCBITU0gZm9yIGRldGFpbHMu
CiAJICovCi0JaWYgKHB1dF9kZXZtYXBfbWFuYWdlZF9wYWdlKHBhZ2UpKQorCWlmIChwYWdlX2lz
X2Rldm1hcF9tYW5hZ2VkKHBhZ2UpKSB7CisJCXB1dF9kZXZtYXBfbWFuYWdlZF9wYWdlKHBhZ2Up
OwogCQlyZXR1cm47CisJfQogCiAJaWYgKHB1dF9wYWdlX3Rlc3R6ZXJvKHBhZ2UpKQogCQlfX3B1
dF9wYWdlKHBhZ2UpOwpkaWZmIC0tZ2l0IGEvbW0vbWVtcmVtYXAuYyBiL21tL21lbXJlbWFwLmMK
aW5kZXggZjkxNWQwNzRhYzIwLi40YzcyM2QyMDQ5ZDUgMTAwNjQ0Ci0tLSBhL21tL21lbXJlbWFw
LmMKKysrIGIvbW0vbWVtcmVtYXAuYwpAQCAtNDExLDIwICs0MTEsOCBAQCBzdHJ1Y3QgZGV2X3Bh
Z2VtYXAgKmdldF9kZXZfcGFnZW1hcCh1bnNpZ25lZCBsb25nIHBmbiwKIEVYUE9SVF9TWU1CT0xf
R1BMKGdldF9kZXZfcGFnZW1hcCk7CiAKICNpZmRlZiBDT05GSUdfREVWX1BBR0VNQVBfT1BTCi12
b2lkIF9fcHV0X2Rldm1hcF9tYW5hZ2VkX3BhZ2Uoc3RydWN0IHBhZ2UgKnBhZ2UpCit2b2lkIGZy
ZWVfZGV2bWFwX21hbmFnZWRfcGFnZShzdHJ1Y3QgcGFnZSAqcGFnZSkKIHsKLQlpbnQgY291bnQg
PSBwYWdlX3JlZl9kZWNfcmV0dXJuKHBhZ2UpOwotCi0JLyogc3RpbGwgYnVzeSAqLwotCWlmIChj
b3VudCA+IDEpCi0JCXJldHVybjsKLQotCS8qIG9ubHkgdHJpZ2dlcmVkIGJ5IHRoZSBkZXZfcGFn
ZW1hcCBzaHV0ZG93biBwYXRoICovCi0JaWYgKGNvdW50ID09IDApIHsKLQkJX19wdXRfcGFnZShw
YWdlKTsKLQkJcmV0dXJuOwotCX0KLQogCS8qIG5vdGlmeSBwYWdlIGlkbGUgZm9yIGRheCAqLwog
CWlmICghaXNfZGV2aWNlX3ByaXZhdGVfcGFnZShwYWdlKSkgewogCQl3YWtlX3VwX3ZhcigmcGFn
ZS0+X3JlZmNvdW50KTsKQEAgLTQ2MSw1ICs0NDksNCBAQCB2b2lkIF9fcHV0X2Rldm1hcF9tYW5h
Z2VkX3BhZ2Uoc3RydWN0IHBhZ2UgKnBhZ2UpCiAJcGFnZS0+bWFwcGluZyA9IE5VTEw7CiAJcGFn
ZS0+cGdtYXAtPm9wcy0+cGFnZV9mcmVlKHBhZ2UpOwogfQotRVhQT1JUX1NZTUJPTChfX3B1dF9k
ZXZtYXBfbWFuYWdlZF9wYWdlKTsKICNlbmRpZiAvKiBDT05GSUdfREVWX1BBR0VNQVBfT1BTICov
CmRpZmYgLS1naXQgYS9tbS9zd2FwLmMgYi9tbS9zd2FwLmMKaW5kZXggNTM0MWFlOTM4NjFmLi5j
ZjM5ZDI0YWRhMmEgMTAwNjQ0Ci0tLSBhL21tL3N3YXAuYworKysgYi9tbS9zd2FwLmMKQEAgLTgx
Myw4ICs4MTMsMTAgQEAgdm9pZCByZWxlYXNlX3BhZ2VzKHN0cnVjdCBwYWdlICoqcGFnZXMsIGlu
dCBucikKIAkJCSAqIHByb2Nlc3NpbmcsIGFuZCBpbnN0ZWFkLCBleHBlY3QgYSBjYWxsIHRvCiAJ
CQkgKiBwdXRfcGFnZV90ZXN0emVybygpLgogCQkJICovCi0JCQlpZiAocHV0X2Rldm1hcF9tYW5h
Z2VkX3BhZ2UocGFnZSkpCisJCQlpZiAocGFnZV9pc19kZXZtYXBfbWFuYWdlZChwYWdlKSkgewor
CQkJCXB1dF9kZXZtYXBfbWFuYWdlZF9wYWdlKHBhZ2UpOwogCQkJCWNvbnRpbnVlOworCQkJfQog
CQl9CiAKIAkJcGFnZSA9IGNvbXBvdW5kX2hlYWQocGFnZSk7CkBAIC0xMTAyLDMgKzExMDQsMjYg
QEAgdm9pZCBfX2luaXQgc3dhcF9zZXR1cCh2b2lkKQogCSAqIF9yZWFsbHlfIGRvbid0IHdhbnQg
dG8gY2x1c3RlciBtdWNoIG1vcmUKIAkgKi8KIH0KKworI2lmZGVmIENPTkZJR19ERVZfUEFHRU1B
UF9PUFMKK3ZvaWQgcHV0X2Rldm1hcF9tYW5hZ2VkX3BhZ2Uoc3RydWN0IHBhZ2UgKnBhZ2UpCit7
CisJaW50IGNvdW50OworCisJaWYgKFdBUk5fT05fT05DRSghcGFnZV9pc19kZXZtYXBfbWFuYWdl
ZChwYWdlKSkpCisJCXJldHVybjsKKworCWNvdW50ID0gcGFnZV9yZWZfZGVjX3JldHVybihwYWdl
KTsKKworCS8qCisJICogZGV2bWFwIHBhZ2UgcmVmY291bnRzIGFyZSAxLWJhc2VkLCByYXRoZXIg
dGhhbiAwLWJhc2VkOiBpZgorCSAqIHJlZmNvdW50IGlzIDEsIHRoZW4gdGhlIHBhZ2UgaXMgZnJl
ZSBhbmQgdGhlIHJlZmNvdW50IGlzCisJICogc3RhYmxlIGJlY2F1c2Ugbm9ib2R5IGhvbGRzIGEg
cmVmZXJlbmNlIG9uIHRoZSBwYWdlLgorCSAqLworCWlmIChjb3VudCA9PSAxKQorCQlmcmVlX2Rl
dm1hcF9tYW5hZ2VkX3BhZ2UocGFnZSk7CisJZWxzZSBpZiAoIWNvdW50KQorCQlfX3B1dF9wYWdl
KHBhZ2UpOworfQorRVhQT1JUX1NZTUJPTChwdXRfZGV2bWFwX21hbmFnZWRfcGFnZSk7CisjZW5k
aWYKLS0gCjIuMjQuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
