Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 446B4DEFB4
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2019 16:35:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92EAA6E120;
	Mon, 21 Oct 2019 14:35:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DE696E11E
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 14:34:59 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id w18so13734860wrt.3
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 07:34:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UNDgx7cjyxqkkLW8q+71KCs/V3rFLUKy8VZglzOSx8Y=;
 b=fMHWGN8YW4PuwafecKMiqKWZ1TukEjSxZc1vraG7x1yBeJyhRZWMIHUB+M9Yq1gl/I
 xFTueyrcHSMgpKXblgHOOY4FUkIvdkJCCsbXObFZvcX2kD8at3Jn6UEizFB40rhkXCY5
 G+R8O2/X5vP/w6EJZ1ymPMkot+2nqxHx3doLPQyIpYEAVOsVwSwof8hYIFQFp/YbhuKR
 Y0MfjjODljY/FNJj5GU5jRqmKYwBk9jkZSfUvqBiKoPPridtB40DTT4E5ZKNJX1XTEMY
 tEZk1cm9ymD2a5NHAe/PY2Z/S1Td0ASkzGHEK+7re3gzpAPuYq7Pky6+OFMU2cJWpFwa
 i5VQ==
X-Gm-Message-State: APjAAAXfX1wvqwI02QCVPUKaZgqVEI66qzY7AfbE2X2avkzH7DEeY1QY
 35DE3MCupyHpCR6a6UJADBd7I9tR
X-Google-Smtp-Source: APXvYqz8Px1L4kuQPUBzY6G45JfwjcNvlHQyufdHgHbP4S/kWFsgaGRB6dZsX5sdz3w7p8dpBsI1Ew==
X-Received: by 2002:adf:db0e:: with SMTP id s14mr16375639wri.341.1571668496649; 
 Mon, 21 Oct 2019 07:34:56 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id z9sm15796191wrl.35.2019.10.21.07.34.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2019 07:34:55 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 06/13] drm/dp: Do not busy-loop during link training
Date: Mon, 21 Oct 2019 16:34:30 +0200
Message-Id: <20191021143437.1477719-7-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191021143437.1477719-1-thierry.reding@gmail.com>
References: <20191021143437.1477719-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UNDgx7cjyxqkkLW8q+71KCs/V3rFLUKy8VZglzOSx8Y=;
 b=RrJdon9e1E7+XC5kGwZols0LkctAbCa7+dS+6kmz5GZenNfX879IZ9reBx0Zy/PjOq
 rxb1Q6fkdFNMy2fE9fZKR+hCRRP2/xAOqBOgHVUyXG5T7yT9T308wZwPFgZab4HhZJOF
 mHQS4YJTpRkEDW9Beac0fPxc/ogRBA4ICbboADVgaXL+H7HbHizqPsQS7gCe033Nxz1U
 oO+R2fdvJqGyrIWyPKQN1qDpq2JEv9DpJ6g/WMsHKTuX/uAoBS/V0MShTcV9Sxtt0tGs
 xz0C3y1eByhDKnSRLo9TQhjMOVOjrwCE1mUMtlIirjrDaPiDFyWYzg0UQTprjSpkSWCs
 LZCA==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KClVzZSBtaWNyb3NlY29u
ZCBzbGVlcHMgZm9yIHRoZSBjbG9jayByZWNvdmVyeSBhbmQgY2hhbm5lbCBlcXVhbGl6YXRpb24K
ZGVsYXlzIGR1cmluZyBsaW5rIHRyYWluaW5nLiBUaGUgZHVyYXRpb24gb2YgdGhlc2UgZGVsYXlz
IGNhbiBiZSBmcm9tCjEwMCB1cyB1cCB0byAxNiBtcy4gSXQgaXMgcnVkZSB0byBidXN5LWxvb3Ag
Zm9yIHRoYXQgYW1vdW50IG9mIHRpbWUuCgpXaGlsZSBhdCBpdCwgYWxzbyBjb252ZXJ0IHRvIHN0
YW5kYXJkIGNvZGluZyBzdHlsZSBieSBwdXR0aW5nIHRoZQpvcGVuaW5nIGJyYWNlcyBpbiBhIGZ1
bmN0aW9uIGRlZmluaXRpb24gb24gYSBuZXcgbGluZS4gQWxzbyBzd2l0Y2ggdG8KdXNpbmcgYW4g
dW5zaWduZWQgaW50IGZvciB0aGUgQVVYIHJlYWQgaW50ZXJ2YWwgdG8gbWF0Y2ggdGhlIGRhdGEg
dHlwZQpvZiB0aGUgcGFyYW1ldGVycyB0byB1c2xlZXBfcmFuZ2UoKS4KCnYyOiB1c2UgY29ycmVj
dCBtdWx0aXBsaWVyIGZvciB0cmFpbmluZyBkZWxheXMgKFBoaWxpcHAgWmFiZWwpCnYzOiBjbGFy
aWZ5IGRhdGEgdHlwZSBjaGFuZ2UgaW4gY29tbWl0IG1lc3NhZ2UKClNpZ25lZC1vZmYtYnk6IFRo
aWVycnkgUmVkaW5nIDx0cmVkaW5nQG52aWRpYS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2Ry
bV9kcF9oZWxwZXIuYyB8IDMwICsrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLQogMSBmaWxl
IGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfaGVscGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2Rw
X2hlbHBlci5jCmluZGV4IDhmMmQ3YzQ4NTBjYS4uYWM4MDJiMDRmMTIwIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vZHJtX2RwX2hlbHBlci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1f
ZHBfaGVscGVyLmMKQEAgLTEyMCwzMyArMTIwLDM5IEBAIHU4IGRybV9kcF9nZXRfYWRqdXN0X3Jl
cXVlc3RfcHJlX2VtcGhhc2lzKGNvbnN0IHU4IGxpbmtfc3RhdHVzW0RQX0xJTktfU1RBVFVTX1NJ
CiB9CiBFWFBPUlRfU1lNQk9MKGRybV9kcF9nZXRfYWRqdXN0X3JlcXVlc3RfcHJlX2VtcGhhc2lz
KTsKIAotdm9pZCBkcm1fZHBfbGlua190cmFpbl9jbG9ja19yZWNvdmVyeV9kZWxheShjb25zdCB1
OCBkcGNkW0RQX1JFQ0VJVkVSX0NBUF9TSVpFXSkgewotCWludCByZF9pbnRlcnZhbCA9IGRwY2Rb
RFBfVFJBSU5JTkdfQVVYX1JEX0lOVEVSVkFMXSAmCi0JCQkgIERQX1RSQUlOSU5HX0FVWF9SRF9N
QVNLOwordm9pZCBkcm1fZHBfbGlua190cmFpbl9jbG9ja19yZWNvdmVyeV9kZWxheShjb25zdCB1
OCBkcGNkW0RQX1JFQ0VJVkVSX0NBUF9TSVpFXSkKK3sKKwl1bnNpZ25lZCBsb25nIHJkX2ludGVy
dmFsID0gZHBjZFtEUF9UUkFJTklOR19BVVhfUkRfSU5URVJWQUxdICYKKwkJCQkJIERQX1RSQUlO
SU5HX0FVWF9SRF9NQVNLOwogCiAJaWYgKHJkX2ludGVydmFsID4gNCkKLQkJRFJNX0RFQlVHX0tN
UygiQVVYIGludGVydmFsICVkLCBvdXQgb2YgcmFuZ2UgKG1heCA0KVxuIiwKKwkJRFJNX0RFQlVH
X0tNUygiQVVYIGludGVydmFsICVsdSwgb3V0IG9mIHJhbmdlIChtYXggNClcbiIsCiAJCQkgICAg
ICByZF9pbnRlcnZhbCk7CiAKIAlpZiAocmRfaW50ZXJ2YWwgPT0gMCB8fCBkcGNkW0RQX0RQQ0Rf
UkVWXSA+PSBEUF9EUENEX1JFVl8xNCkKLQkJdWRlbGF5KDEwMCk7CisJCXJkX2ludGVydmFsID0g
MTAwOwogCWVsc2UKLQkJbWRlbGF5KHJkX2ludGVydmFsICogNCk7CisJCXJkX2ludGVydmFsICo9
IDQgKiBVU0VDX1BFUl9NU0VDOworCisJdXNsZWVwX3JhbmdlKHJkX2ludGVydmFsLCByZF9pbnRl
cnZhbCAqIDIpOwogfQogRVhQT1JUX1NZTUJPTChkcm1fZHBfbGlua190cmFpbl9jbG9ja19yZWNv
dmVyeV9kZWxheSk7CiAKLXZvaWQgZHJtX2RwX2xpbmtfdHJhaW5fY2hhbm5lbF9lcV9kZWxheShj
b25zdCB1OCBkcGNkW0RQX1JFQ0VJVkVSX0NBUF9TSVpFXSkgewotCWludCByZF9pbnRlcnZhbCA9
IGRwY2RbRFBfVFJBSU5JTkdfQVVYX1JEX0lOVEVSVkFMXSAmCi0JCQkgIERQX1RSQUlOSU5HX0FV
WF9SRF9NQVNLOwordm9pZCBkcm1fZHBfbGlua190cmFpbl9jaGFubmVsX2VxX2RlbGF5KGNvbnN0
IHU4IGRwY2RbRFBfUkVDRUlWRVJfQ0FQX1NJWkVdKQoreworCXVuc2lnbmVkIGxvbmcgcmRfaW50
ZXJ2YWwgPSBkcGNkW0RQX1RSQUlOSU5HX0FVWF9SRF9JTlRFUlZBTF0gJgorCQkJCQkgRFBfVFJB
SU5JTkdfQVVYX1JEX01BU0s7CiAKIAlpZiAocmRfaW50ZXJ2YWwgPiA0KQotCQlEUk1fREVCVUdf
S01TKCJBVVggaW50ZXJ2YWwgJWQsIG91dCBvZiByYW5nZSAobWF4IDQpXG4iLAorCQlEUk1fREVC
VUdfS01TKCJBVVggaW50ZXJ2YWwgJWx1LCBvdXQgb2YgcmFuZ2UgKG1heCA0KVxuIiwKIAkJCSAg
ICAgIHJkX2ludGVydmFsKTsKIAogCWlmIChyZF9pbnRlcnZhbCA9PSAwKQotCQl1ZGVsYXkoNDAw
KTsKKwkJcmRfaW50ZXJ2YWwgPSA0MDA7CiAJZWxzZQotCQltZGVsYXkocmRfaW50ZXJ2YWwgKiA0
KTsKKwkJcmRfaW50ZXJ2YWwgKj0gNCAqIFVTRUNfUEVSX01TRUM7CisKKwl1c2xlZXBfcmFuZ2Uo
cmRfaW50ZXJ2YWwsIHJkX2ludGVydmFsICogMik7CiB9CiBFWFBPUlRfU1lNQk9MKGRybV9kcF9s
aW5rX3RyYWluX2NoYW5uZWxfZXFfZGVsYXkpOwogCi0tIAoyLjIzLjAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
