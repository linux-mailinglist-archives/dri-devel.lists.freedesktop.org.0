Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9697C1EE
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2019 14:44:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1C858912B;
	Wed, 31 Jul 2019 12:44:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6512C89113
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2019 12:44:23 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BCEA32171F;
 Wed, 31 Jul 2019 12:44:22 +0000 (UTC)
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org, Richard Gong <richard.gong@linux.intel.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v2 08/10] video: fbdev: wm8505fb: convert platform driver to
 use dev_groups
Date: Wed, 31 Jul 2019 14:43:47 +0200
Message-Id: <20190731124349.4474-9-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190731124349.4474-1-gregkh@linuxfoundation.org>
References: <20190731124349.4474-1-gregkh@linuxfoundation.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1564577063;
 bh=Fje3AeopR107kcdoqaZJYzJTIvkoN1dobGnTqwrXqOk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CT0cwL2e/r+3RDaMoTK/tZK11LleUq09ZrKXH8NIp2+SsEkEBYsyzlWLf5H5DNx5r
 /r89HPJxOH8CfFqC/YUAjSDax2bl9UUKeEzY6rxSximoTLNC6+8muabt9MApGxY/2T
 lv4zTDtA7H5/27ELhezJ1UcxQQhuV0jZjk0zmZ1U=
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
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, Tony Prisk <linux@prisktech.co.nz>,
 linux-arm-kernel@lists.infradead.org
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
cy5mcmVlZGVza3RvcC5vcmcKQ2M6IGxpbnV4LWZiZGV2QHZnZXIua2VybmVsLm9yZwpBY2tlZC1i
eTogQmFydGxvbWllaiBab2xuaWVya2lld2ljeiA8Yi56b2xuaWVya2llQHNhbXN1bmcuY29tPgpT
aWduZWQtb2ZmLWJ5OiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24u
b3JnPgotLS0KIGRyaXZlcnMvdmlkZW8vZmJkZXYvd204NTA1ZmIuYyB8IDEzICsrKysrKystLS0t
LS0KIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy92aWRlby9mYmRldi93bTg1MDVmYi5jIGIvZHJpdmVycy92aWRlby9m
YmRldi93bTg1MDVmYi5jCmluZGV4IGZmNzUyNjM1YTMxYy4uMTdjNzgwMzE1Y2E1IDEwMDY0NAot
LS0gYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3dtODUwNWZiLmMKKysrIGIvZHJpdmVycy92aWRlby9m
YmRldi93bTg1MDVmYi5jCkBAIC0xNzYsNiArMTc2LDEyIEBAIHN0YXRpYyBzc2l6ZV90IGNvbnRy
YXN0X3N0b3JlKHN0cnVjdCBkZXZpY2UgKmRldiwKIAogc3RhdGljIERFVklDRV9BVFRSX1JXKGNv
bnRyYXN0KTsKIAorc3RhdGljIHN0cnVjdCBhdHRyaWJ1dGUgKndtODUwNWZiX2F0dHJzW10gPSB7
CisJJmRldl9hdHRyX2NvbnRyYXN0LmF0dHIsCisJTlVMTCwKK307CitBVFRSSUJVVEVfR1JPVVBT
KHdtODUwNWZiKTsKKwogc3RhdGljIGlubGluZSB1X2ludCBjaGFuX3RvX2ZpZWxkKHVfaW50IGNo
YW4sIHN0cnVjdCBmYl9iaXRmaWVsZCAqYmYpCiB7CiAJY2hhbiAmPSAweGZmZmY7CkBAIC0zNjEs
MTAgKzM2Nyw2IEBAIHN0YXRpYyBpbnQgd204NTA1ZmJfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2Rl
dmljZSAqcGRldikKIAkJcmV0dXJuIHJldDsKIAl9CiAKLQlyZXQgPSBkZXZpY2VfY3JlYXRlX2Zp
bGUoJnBkZXYtPmRldiwgJmRldl9hdHRyX2NvbnRyYXN0KTsKLQlpZiAocmV0IDwgMCkKLQkJZmJf
d2FybigmZmJpLT5mYiwgImZhaWxlZCB0byByZWdpc3RlciBhdHRyaWJ1dGVzICglZClcbiIsIHJl
dCk7Ci0KIAlmYl9pbmZvKCZmYmktPmZiLCAiJXMgZnJhbWUgYnVmZmVyIGF0IDB4JWx4LTB4JWx4
XG4iLAogCQlmYmktPmZiLmZpeC5pZCwgZmJpLT5mYi5maXguc21lbV9zdGFydCwKIAkJZmJpLT5m
Yi5maXguc21lbV9zdGFydCArIGZiaS0+ZmIuZml4LnNtZW1fbGVuIC0gMSk7CkBAIC0zNzYsOCAr
Mzc4LDYgQEAgc3RhdGljIGludCB3bTg1MDVmYl9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2Rldmlj
ZSAqcGRldikKIHsKIAlzdHJ1Y3Qgd204NTA1ZmJfaW5mbyAqZmJpID0gcGxhdGZvcm1fZ2V0X2Ry
dmRhdGEocGRldik7CiAKLQlkZXZpY2VfcmVtb3ZlX2ZpbGUoJnBkZXYtPmRldiwgJmRldl9hdHRy
X2NvbnRyYXN0KTsKLQogCXVucmVnaXN0ZXJfZnJhbWVidWZmZXIoJmZiaS0+ZmIpOwogCiAJd3Jp
dGVsKDAsIGZiaS0+cmVnYmFzZSk7CkBAIC0zOTksNiArMzk5LDcgQEAgc3RhdGljIHN0cnVjdCBw
bGF0Zm9ybV9kcml2ZXIgd204NTA1ZmJfZHJpdmVyID0gewogCS5kcml2ZXIJCT0gewogCQkubmFt
ZQk9IERSSVZFUl9OQU1FLAogCQkub2ZfbWF0Y2hfdGFibGUgPSB3bXRfZHRfaWRzLAorCQkuZGV2
X2dyb3Vwcwk9IHdtODUwNWZiX2dyb3VwcywKIAl9LAogfTsKIAotLSAKMi4yMi4wCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
