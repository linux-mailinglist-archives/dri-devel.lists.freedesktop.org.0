Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8359B87D
	for <lists+dri-devel@lfdr.de>; Sat, 24 Aug 2019 00:18:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49E8A6ED62;
	Fri, 23 Aug 2019 22:18:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDE956ED58;
 Fri, 23 Aug 2019 22:18:11 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d6066230000>; Fri, 23 Aug 2019 15:18:11 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Fri, 23 Aug 2019 15:18:11 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Fri, 23 Aug 2019 15:18:11 -0700
Received: from HQMAIL110.nvidia.com (172.18.146.15) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 23 Aug
 2019 22:18:10 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by hqmail110.nvidia.com
 (172.18.146.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 23 Aug
 2019 22:18:08 +0000
Received: from hqnvemgw01.nvidia.com (172.20.150.20) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Fri, 23 Aug 2019 22:18:08 +0000
Received: from rcampbell-dev.nvidia.com (Not Verified[10.110.48.66]) by
 hqnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5d6066200001>; Fri, 23 Aug 2019 15:18:08 -0700
From: Ralph Campbell <rcampbell@nvidia.com>
To: <linux-mm@kvack.org>
Subject: [PATCH 1/2] mm/hmm: hmm_range_fault() NULL pointer bug
Date: Fri, 23 Aug 2019 15:17:52 -0700
Message-ID: <20190823221753.2514-2-rcampbell@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190823221753.2514-1-rcampbell@nvidia.com>
References: <20190823221753.2514-1-rcampbell@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1566598691; bh=KyPc8c5coEeaWyED4oOxl50+aKdesFPM9yZHDro83x0=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=Hen0jCZnlwep5U1y8LSyUogocyncUlU8ncNOkdizYSGrpz0PWiTpWbpyXqvih6gF+
 3qM1vKPirI+eZhD9UBcD2rfGfX74o53wuqQ2rhVZQESI2bl/mdp0CgojyL1mtxb5Ob
 ir8YSrHdcr998BKtxBB/eEKh7i1GORjBa8cuXwOmDZ/V0k9Iyw4bAWSCMlLHs4ccfk
 Wt5oaufB+AfvTNVTT0Pq9TclkBcHR/CNerxUzXKz8H04CUc/qNXXq93VqSEU5uK80W
 pCzPYHqan8YLxW66Ob9wjgncemYyfZJiszrN4yrr0WCyhls1D6yjDovJ7pYDNxAIfA
 +LLT4nPogr8Bg==
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
Cc: Ralph Campbell <rcampbell@nvidia.com>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, amd-gfx@lists.freedesktop.org,
 Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWx0aG91Z2ggaG1tX3JhbmdlX2ZhdWx0KCkgY2FsbHMgZmluZF92bWEoKSB0byBtYWtlIHN1cmUg
dGhhdCBhIHZtYSBleGlzdHMKYmVmb3JlIGNhbGxpbmcgd2Fsa19wYWdlX3JhbmdlKCksIGhtbV92
bWFfd2Fsa19ob2xlKCkgY2FuIHN0aWxsIGJlIGNhbGxlZAp3aXRoIHdhbGstPnZtYSA9PSBOVUxM
IGlmIHRoZSBzdGFydCBhbmQgZW5kIGFkZHJlc3MgYXJlIG5vdCBjb250YWluZWQKd2l0aGluIHRo
ZSB2bWEgcmFuZ2UuCgogaG1tX3JhbmdlX2ZhdWx0KCkgLyogY2FsbHMgZmluZF92bWEoKSBidXQg
bm8gcmFuZ2UgY2hlY2sgKi8KICB3YWxrX3BhZ2VfcmFuZ2UoKSAvKiBjYWxscyBmaW5kX3ZtYSgp
LCBzZXRzIHdhbGstPnZtYSA9IE5VTEwgKi8KICAgX193YWxrX3BhZ2VfcmFuZ2UoKQogICAgd2Fs
a19wZ2RfcmFuZ2UoKQogICAgIHdhbGtfcDRkX3JhbmdlKCkKICAgICAgd2Fsa19wdWRfcmFuZ2Uo
KQogICAgICAgaG1tX3ZtYV93YWxrX2hvbGUoKQogICAgICAgIGhtbV92bWFfd2Fsa19ob2xlXygp
CiAgICAgICAgIGhtbV92bWFfZG9fZmF1bHQoKQogICAgICAgICAgaGFuZGxlX21tX2ZhdWx0KHZt
YT0wKQoKU2lnbmVkLW9mZi1ieTogUmFscGggQ2FtcGJlbGwgPHJjYW1wYmVsbEBudmlkaWEuY29t
PgotLS0KIG1tL2htbS5jIHwgMTMgKysrKysrKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDkgaW5z
ZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9tbS9obW0uYyBiL21tL2ht
bS5jCmluZGV4IGZjMDVjOGZlNzhiNC4uMjkzNzE0ODVmZTk0IDEwMDY0NAotLS0gYS9tbS9obW0u
YworKysgYi9tbS9obW0uYwpAQCAtMjI5LDYgKzIyOSw5IEBAIHN0YXRpYyBpbnQgaG1tX3ZtYV9k
b19mYXVsdChzdHJ1Y3QgbW1fd2FsayAqd2FsaywgdW5zaWduZWQgbG9uZyBhZGRyLAogCXN0cnVj
dCB2bV9hcmVhX3N0cnVjdCAqdm1hID0gd2Fsay0+dm1hOwogCXZtX2ZhdWx0X3QgcmV0OwogCisJ
aWYgKCF2bWEpCisJCWdvdG8gZXJyOworCiAJaWYgKGhtbV92bWFfd2Fsay0+ZmxhZ3MgJiBITU1f
RkFVTFRfQUxMT1dfUkVUUlkpCiAJCWZsYWdzIHw9IEZBVUxUX0ZMQUdfQUxMT1dfUkVUUlk7CiAJ
aWYgKHdyaXRlX2ZhdWx0KQpAQCAtMjM5LDEyICsyNDIsMTQgQEAgc3RhdGljIGludCBobW1fdm1h
X2RvX2ZhdWx0KHN0cnVjdCBtbV93YWxrICp3YWxrLCB1bnNpZ25lZCBsb25nIGFkZHIsCiAJCS8q
IE5vdGUsIGhhbmRsZV9tbV9mYXVsdCBkaWQgdXBfcmVhZCgmbW0tPm1tYXBfc2VtKSkgKi8KIAkJ
cmV0dXJuIC1FQUdBSU47CiAJfQotCWlmIChyZXQgJiBWTV9GQVVMVF9FUlJPUikgewotCQkqcGZu
ID0gcmFuZ2UtPnZhbHVlc1tITU1fUEZOX0VSUk9SXTsKLQkJcmV0dXJuIC1FRkFVTFQ7Ci0JfQor
CWlmIChyZXQgJiBWTV9GQVVMVF9FUlJPUikKKwkJZ290byBlcnI7CiAKIAlyZXR1cm4gLUVCVVNZ
OworCitlcnI6CisJKnBmbiA9IHJhbmdlLT52YWx1ZXNbSE1NX1BGTl9FUlJPUl07CisJcmV0dXJu
IC1FRkFVTFQ7CiB9CiAKIHN0YXRpYyBpbnQgaG1tX3BmbnNfYmFkKHVuc2lnbmVkIGxvbmcgYWRk
ciwKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
