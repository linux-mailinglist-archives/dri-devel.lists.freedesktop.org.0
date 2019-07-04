Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0385FA06
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 16:26:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BADA06E357;
	Thu,  4 Jul 2019 14:26:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 594346E357
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2019 14:26:06 +0000 (UTC)
Received: from localhost (unknown [89.205.128.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 63147218A3;
 Thu,  4 Jul 2019 14:26:05 +0000 (UTC)
Date: Thu, 4 Jul 2019 16:26:02 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org, Tony Prisk <linux@prisktech.co.nz>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH 07/11] video: fbdev: wm8505fb: convert platform driver to use
 dev_groups
Message-ID: <20190704142602.GB6281@kroah.com>
References: <20190704084617.3602-1-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190704084617.3602-1-gregkh@linuxfoundation.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1562250366;
 bh=aSahAsJiapc2XUdQK1vHyWtY3qG19qgnLRWrZ9lBkRQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=T6D0qe9q4yb+hfC0BKGldTcTyrH2DMbA4FPBD/B2aoAs6g4W0eAzsdzxaPj10gzwY
 86Ejtlg0M/JZFA9dsB2z3trD5PXKR/FPA1dlAlgp4CEl3XYSrRjdytB1wbPcov4lx0
 3E4u9ouWSmsdg4aGWD8A5VV+7KVChd/A89CeAncI=
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
Cc: linux-fbdev@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Darren Hart <dvhart@infradead.org>,
 Andy Shevchenko <andy@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UGxhdGZvcm0gZHJpdmVycyBub3cgaGF2ZSB0aGUgb3B0aW9uIHRvIGhhdmUgdGhlIHBsYXRmb3Jt
IGNvcmUgY3JlYXRlCmFuZCByZW1vdmUgYW55IG5lZWRlZCBzeXNmcyBhdHRyaWJ1dGUgZmlsZXMu
ICBTbyB0YWtlIGFkdmFudGFnZSBvZiB0aGF0CmFuZCBkbyBub3QgcmVnaXN0ZXIgImJ5IGhhbmQi
IGEgc3lzZnMgZmlsZS4KCkNjOiBUb255IFByaXNrIDxsaW51eEBwcmlza3RlY2guY28ubno+CkNj
OiBCYXJ0bG9taWVqIFpvbG5pZXJraWV3aWN6IDxiLnpvbG5pZXJraWVAc2Ftc3VuZy5jb20+CkNj
OiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKQ2M6IGRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKQ2M6IGxpbnV4LWZiZGV2QHZnZXIua2VybmVsLm9yZwpTaWduZWQt
b2ZmLWJ5OiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPgot
LS0KIGRyaXZlcnMvdmlkZW8vZmJkZXYvd204NTA1ZmIuYyB8IDEzICsrKysrKystLS0tLS0KIDEg
ZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy92aWRlby9mYmRldi93bTg1MDVmYi5jIGIvZHJpdmVycy92aWRlby9mYmRldi93
bTg1MDVmYi5jCmluZGV4IDhmMGQ1Mzc5ODYxZC4uM2I4MjZkYTk3MDM1IDEwMDY0NAotLS0gYS9k
cml2ZXJzL3ZpZGVvL2ZiZGV2L3dtODUwNWZiLmMKKysrIGIvZHJpdmVycy92aWRlby9mYmRldi93
bTg1MDVmYi5jCkBAIC0xODQsNiArMTg0LDEyIEBAIHN0YXRpYyBzc2l6ZV90IGNvbnRyYXN0X3N0
b3JlKHN0cnVjdCBkZXZpY2UgKmRldiwKIAogc3RhdGljIERFVklDRV9BVFRSX1JXKGNvbnRyYXN0
KTsKIAorc3RhdGljIHN0cnVjdCBhdHRyaWJ1dGUgKndtODUwNWZiX2F0dHJzW10gPSB7CisJJmRl
dl9hdHRyX2NvbnRyYXN0LmF0dHIsCisJTlVMTCwKK307CitBVFRSSUJVVEVfR1JPVVBTKHdtODUw
NWZiKTsKKwogc3RhdGljIGlubGluZSB1X2ludCBjaGFuX3RvX2ZpZWxkKHVfaW50IGNoYW4sIHN0
cnVjdCBmYl9iaXRmaWVsZCAqYmYpCiB7CiAJY2hhbiAmPSAweGZmZmY7CkBAIC0zNjksMTAgKzM3
NSw2IEBAIHN0YXRpYyBpbnQgd204NTA1ZmJfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldikKIAkJcmV0dXJuIHJldDsKIAl9CiAKLQlyZXQgPSBkZXZpY2VfY3JlYXRlX2ZpbGUoJnBk
ZXYtPmRldiwgJmRldl9hdHRyX2NvbnRyYXN0KTsKLQlpZiAocmV0IDwgMCkKLQkJZmJfd2Fybigm
ZmJpLT5mYiwgImZhaWxlZCB0byByZWdpc3RlciBhdHRyaWJ1dGVzICglZClcbiIsIHJldCk7Ci0K
IAlmYl9pbmZvKCZmYmktPmZiLCAiJXMgZnJhbWUgYnVmZmVyIGF0IDB4JWx4LTB4JWx4XG4iLAog
CQlmYmktPmZiLmZpeC5pZCwgZmJpLT5mYi5maXguc21lbV9zdGFydCwKIAkJZmJpLT5mYi5maXgu
c21lbV9zdGFydCArIGZiaS0+ZmIuZml4LnNtZW1fbGVuIC0gMSk7CkBAIC0zODQsOCArMzg2LDYg
QEAgc3RhdGljIGludCB3bTg1MDVmYl9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRl
dikKIHsKIAlzdHJ1Y3Qgd204NTA1ZmJfaW5mbyAqZmJpID0gcGxhdGZvcm1fZ2V0X2RydmRhdGEo
cGRldik7CiAKLQlkZXZpY2VfcmVtb3ZlX2ZpbGUoJnBkZXYtPmRldiwgJmRldl9hdHRyX2NvbnRy
YXN0KTsKLQogCXVucmVnaXN0ZXJfZnJhbWVidWZmZXIoJmZiaS0+ZmIpOwogCiAJd3JpdGVsKDAs
IGZiaS0+cmVnYmFzZSk7CkBAIC00MDIsNiArNDAyLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBv
Zl9kZXZpY2VfaWQgd210X2R0X2lkc1tdID0gewogfTsKIAogc3RhdGljIHN0cnVjdCBwbGF0Zm9y
bV9kcml2ZXIgd204NTA1ZmJfZHJpdmVyID0geworCS5kZXZfZ3JvdXBzCT0gd204NTA1ZmJfZ3Jv
dXBzLAogCS5wcm9iZQkJPSB3bTg1MDVmYl9wcm9iZSwKIAkucmVtb3ZlCQk9IHdtODUwNWZiX3Jl
bW92ZSwKIAkuZHJpdmVyCQk9IHsKLS0gCjIuMjIuMAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
