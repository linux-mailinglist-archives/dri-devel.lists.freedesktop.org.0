Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D4EDCB02
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2019 18:30:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 416C76E139;
	Fri, 18 Oct 2019 16:30:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF90C6E139
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2019 16:30:07 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id r3so6941347wrj.6
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2019 09:30:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=lJc0hj7tQVxDAaGjfCOv7vwr1QfJ/5Ay/O35J4hdg0E=;
 b=DRwSBllfBwh5DMpAAgfBlgt4K5khOyPuGXLLLd0rLDIJyWZc1UMI896GkVeVTBcYFU
 bq0Vht99rRwmuv7UjftemW91Wnvl5bM+hNbRjG7H+nPsbHnq7jYdb6CGIc8sQIKrrZa7
 IvtL6FmTxm2eyqvSXM96JRhVQ8bOjvc28FtSHwCQdq1mNEHaPZZuZY2G61T7zh0VXSEE
 uEdosLaWc5KCKFmgXR8zA0EoKhvNSuj5hBKIxwrRB89WoIfhagkhy3zT8o8BVpTMs5d1
 v3fyPdcaXWb1A8pod9FHOw4ggRXJAIZdNpqP6pqveMWG2GXLdJqrTbe9wB7CrTqpOUpL
 T+Fg==
X-Gm-Message-State: APjAAAXZ71Q5L8BAZ5nqTpxhN5+SSj+l/u7KyuUGpeK3acCkVM816ExK
 GF+3HDH77IVTQEEm8HDJKO3kc4B1
X-Google-Smtp-Source: APXvYqyYIv1KczmfhzvFNVLt5B5gajKUiA+enUgcWK2XtyuUq3g+DU3XrKJg4cwXJvIMYHUnnEdVSA==
X-Received: by 2002:a5d:484e:: with SMTP id n14mr8206328wrs.110.1571416206126; 
 Fri, 18 Oct 2019 09:30:06 -0700 (PDT)
Received: from debian.office.codethink.co.uk. ([78.40.148.180])
 by smtp.gmail.com with ESMTPSA id m16sm5010123wml.11.2019.10.18.09.30.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 18 Oct 2019 09:30:05 -0700 (PDT)
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH] omapfb: reduce stack usage
Date: Fri, 18 Oct 2019 17:30:04 +0100
Message-Id: <20191018163004.23498-1-sudipm.mukherjee@gmail.com>
X-Mailer: git-send-email 2.11.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=lJc0hj7tQVxDAaGjfCOv7vwr1QfJ/5Ay/O35J4hdg0E=;
 b=W34HiTmzG0Wkh8A4mK+ZBdO7Aae+UoxMX9i9O7wdsm3reQ/ZEtdu3N4gw0ACWa8nbe
 bpAzAeXA+eqX577RWAm+tQVEQNxRs/1GBLc1TlbBsfMvvme0U/x7Eb1DuRhjJLNIPkhe
 ooAQtfe2s6JHbVqwyj6nDJiDFV57IXFscjR0vUXmroN10dCjWUV2pMbbyeds/UYgy5sY
 zNVyoJbEmrWGwDSPlUh4BpS9OyhC0mgDHuWjGZ+CUu0rKVG7nxzrEKjihpX8SvUvsnlV
 URGpEeu27I3kqsfnJUqoSHj+bzMoZHrhTcGOsbC/rwnDWn6TUGXE6Y4ZY9P0ltJZgFjJ
 UdZg==
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
Cc: linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGJ1aWxkIG9mIHh0ZW5zYSBhbGxtb2Rjb25maWcgaXMgZ2l2aW5nIGEgd2FybmluZyBvZjoK
SW4gZnVuY3Rpb24gJ2RzaV9kdW1wX2RzaWRldl9pcnFzJzoKd2FybmluZzogdGhlIGZyYW1lIHNp
emUgb2YgMTEyMCBieXRlcyBpcyBsYXJnZXIgdGhhbiAxMDI0IGJ5dGVzCgpBbGxvY2F0ZSB0aGUg
bWVtb3J5IGZvciAnc3RydWN0IGRzaV9pcnFfc3RhdHMnIGR5bmFtaWNhbGx5IGluc3RlYWQKb2Yg
YXNzaWduaW5nIGl0IGluIHN0YWNrLgoKU2lnbmVkLW9mZi1ieTogU3VkaXAgTXVraGVyamVlIDxz
dWRpcG0ubXVraGVyamVlQGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L29tYXAy
L29tYXBmYi9kc3MvZHNpLmMgfCAyNCArKysrKysrKysrKysrKy0tLS0tLS0tLS0KIDEgZmlsZSBj
aGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL3ZpZGVvL2ZiZGV2L29tYXAyL29tYXBmYi9kc3MvZHNpLmMgYi9kcml2ZXJzL3ZpZGVv
L2ZiZGV2L29tYXAyL29tYXBmYi9kc3MvZHNpLmMKaW5kZXggZDYyMDM3NjIxNmUxLi40MzQwMjQ2
N2JmNDAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvb21hcDIvb21hcGZiL2Rzcy9k
c2kuYworKysgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L29tYXAyL29tYXBmYi9kc3MvZHNpLmMKQEAg
LTE1MzYsMjIgKzE1MzYsMjUgQEAgc3RhdGljIHZvaWQgZHNpX2R1bXBfZHNpZGV2X2lycXMoc3Ry
dWN0IHBsYXRmb3JtX2RldmljZSAqZHNpZGV2LAogewogCXN0cnVjdCBkc2lfZGF0YSAqZHNpID0g
ZHNpX2dldF9kc2lkcnZfZGF0YShkc2lkZXYpOwogCXVuc2lnbmVkIGxvbmcgZmxhZ3M7Ci0Jc3Ry
dWN0IGRzaV9pcnFfc3RhdHMgc3RhdHM7CisJc3RydWN0IGRzaV9pcnFfc3RhdHMgKnN0YXRzOwog
CisJc3RhdHMgPSBrbWFsbG9jKHNpemVvZigqc3RhdHMpLCBHRlBfS0VSTkVMKTsKKwlpZiAoIXN0
YXRzKQorCQlyZXR1cm47CiAJc3Bpbl9sb2NrX2lycXNhdmUoJmRzaS0+aXJxX3N0YXRzX2xvY2ss
IGZsYWdzKTsKIAotCXN0YXRzID0gZHNpLT5pcnFfc3RhdHM7CisJbWVtY3B5KHN0YXRzLCAmZHNp
LT5pcnFfc3RhdHMsIHNpemVvZigqc3RhdHMpKTsKIAltZW1zZXQoJmRzaS0+aXJxX3N0YXRzLCAw
LCBzaXplb2YoZHNpLT5pcnFfc3RhdHMpKTsKIAlkc2ktPmlycV9zdGF0cy5sYXN0X3Jlc2V0ID0g
amlmZmllczsKIAogCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmRzaS0+aXJxX3N0YXRzX2xvY2ss
IGZsYWdzKTsKIAogCXNlcV9wcmludGYocywgInBlcmlvZCAldSBtc1xuIiwKLQkJCWppZmZpZXNf
dG9fbXNlY3MoamlmZmllcyAtIHN0YXRzLmxhc3RfcmVzZXQpKTsKKwkJCWppZmZpZXNfdG9fbXNl
Y3MoamlmZmllcyAtIHN0YXRzLT5sYXN0X3Jlc2V0KSk7CiAKLQlzZXFfcHJpbnRmKHMsICJpcnFz
ICVkXG4iLCBzdGF0cy5pcnFfY291bnQpOworCXNlcV9wcmludGYocywgImlycXMgJWRcbiIsIHN0
YXRzLT5pcnFfY291bnQpOwogI2RlZmluZSBQSVMoeCkgXAotCXNlcV9wcmludGYocywgIiUtMjBz
ICUxMGRcbiIsICN4LCBzdGF0cy5kc2lfaXJxc1tmZnMoRFNJX0lSUV8jI3gpLTFdKTsKKwlzZXFf
cHJpbnRmKHMsICIlLTIwcyAlMTBkXG4iLCAjeCwgc3RhdHMtPmRzaV9pcnFzW2ZmcyhEU0lfSVJR
XyMjeCktMV0pOwogCiAJc2VxX3ByaW50ZihzLCAiLS0gRFNJJWQgaW50ZXJydXB0cyAtLVxuIiwg
ZHNpLT5tb2R1bGVfaWQgKyAxKTsKIAlQSVMoVkMwKTsKQEAgLTE1NzUsMTAgKzE1NzgsMTAgQEAg
c3RhdGljIHZvaWQgZHNpX2R1bXBfZHNpZGV2X2lycXMoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
ZHNpZGV2LAogCiAjZGVmaW5lIFBJUyh4KSBcCiAJc2VxX3ByaW50ZihzLCAiJS0yMHMgJTEwZCAl
MTBkICUxMGQgJTEwZFxuIiwgI3gsIFwKLQkJCXN0YXRzLnZjX2lycXNbMF1bZmZzKERTSV9WQ19J
UlFfIyN4KS0xXSwgXAotCQkJc3RhdHMudmNfaXJxc1sxXVtmZnMoRFNJX1ZDX0lSUV8jI3gpLTFd
LCBcCi0JCQlzdGF0cy52Y19pcnFzWzJdW2ZmcyhEU0lfVkNfSVJRXyMjeCktMV0sIFwKLQkJCXN0
YXRzLnZjX2lycXNbM11bZmZzKERTSV9WQ19JUlFfIyN4KS0xXSk7CisJCQlzdGF0cy0+dmNfaXJx
c1swXVtmZnMoRFNJX1ZDX0lSUV8jI3gpLTFdLCBcCisJCQlzdGF0cy0+dmNfaXJxc1sxXVtmZnMo
RFNJX1ZDX0lSUV8jI3gpLTFdLCBcCisJCQlzdGF0cy0+dmNfaXJxc1syXVtmZnMoRFNJX1ZDX0lS
UV8jI3gpLTFdLCBcCisJCQlzdGF0cy0+dmNfaXJxc1szXVtmZnMoRFNJX1ZDX0lSUV8jI3gpLTFd
KTsKIAogCXNlcV9wcmludGYocywgIi0tIFZDIGludGVycnVwdHMgLS1cbiIpOwogCVBJUyhDUyk7
CkBAIC0xNTk0LDcgKzE1OTcsNyBAQCBzdGF0aWMgdm9pZCBkc2lfZHVtcF9kc2lkZXZfaXJxcyhz
dHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpkc2lkZXYsCiAKICNkZWZpbmUgUElTKHgpIFwKIAlzZXFf
cHJpbnRmKHMsICIlLTIwcyAlMTBkXG4iLCAjeCwgXAotCQkJc3RhdHMuY2lvX2lycXNbZmZzKERT
SV9DSU9fSVJRXyMjeCktMV0pOworCQkJc3RhdHMtPmNpb19pcnFzW2ZmcyhEU0lfQ0lPX0lSUV8j
I3gpLTFdKTsKIAogCXNlcV9wcmludGYocywgIi0tIENJTyBpbnRlcnJ1cHRzIC0tXG4iKTsKIAlQ
SVMoRVJSU1lOQ0VTQzEpOwpAQCAtMTYxOCw2ICsxNjIxLDcgQEAgc3RhdGljIHZvaWQgZHNpX2R1
bXBfZHNpZGV2X2lycXMoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqZHNpZGV2LAogCVBJUyhVTFBT
QUNUSVZFTk9UX0FMTDApOwogCVBJUyhVTFBTQUNUSVZFTk9UX0FMTDEpOwogI3VuZGVmIFBJUwor
CWtmcmVlKHN0YXRzKTsKIH0KIAogc3RhdGljIHZvaWQgZHNpMV9kdW1wX2lycXMoc3RydWN0IHNl
cV9maWxlICpzKQotLSAKMi4xMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
