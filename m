Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C67A7D01A
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2019 23:30:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11D6F6E2FF;
	Wed, 31 Jul 2019 21:30:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F95F898A8;
 Wed, 31 Jul 2019 21:30:40 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id p13so71218888wru.10;
 Wed, 31 Jul 2019 14:30:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lIC8WXBn9gYMYudhBdaehgGJpFnqVd5arerypTueokk=;
 b=PwaIdNv3mUE4MT6CcNecIF7EXhswAHngGFJuWmo+V8sLb5OdmSlvTVfE8ox40+a0Ni
 nV3llfpmZAohHOrIYNSw53G6IiWQYzeiLP0OLKch9efyYbc3yw0m25/YdzHsnsnkybDp
 oW+CyXqSKRP9k7XhdQfX07Pi3zOio0GnYg1hZXwZ0UanH4zxqFL+rCMMh1Vfb7qci07Z
 Iq4mlUlbNMsAQk4GvjsL+XFKWtVKWO2IHXXD6VVuiP6clqZClOkm/S68fb/9ywaDglTu
 meJKHdxRfU6M0Pjnz/h0Q/7fG8P1vV2RmGDUlApe/4oWsvGjgRC0ZVrHZWFiAeiVpffT
 PG/A==
X-Gm-Message-State: APjAAAWSLlEz+QgZnz//E8AokVkDGYH1a8Gah6AyeQ5IWJZG1vrNa5iK
 gxaHzT2+wgeABp5iVmYQV8l4Fvw8pDc=
X-Google-Smtp-Source: APXvYqyveAa2FVb2m0XFaHYyXhL4lxOlO8wJvqrQ6ORbvGCY6+oT//MFWPVRerGiuJNbuKAm8+goxg==
X-Received: by 2002:adf:80e1:: with SMTP id 88mr48928974wrl.127.1564608638369; 
 Wed, 31 Jul 2019 14:30:38 -0700 (PDT)
Received: from localhost.localdomain ([62.178.82.229])
 by smtp.gmail.com with ESMTPSA id y16sm151126124wrg.85.2019.07.31.14.30.37
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 31 Jul 2019 14:30:37 -0700 (PDT)
From: Christian Gmeiner <christian.gmeiner@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] etnaviv: perfmon: fix total and idle HI cyleces readout
Date: Wed, 31 Jul 2019 23:30:34 +0200
Message-Id: <20190731213034.3984-1-christian.gmeiner@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lIC8WXBn9gYMYudhBdaehgGJpFnqVd5arerypTueokk=;
 b=J2DAMVUbvFRqroHoWt09aG25bjB7/2tMf7dsbCKZvatXolwXBIEEtPl1jD6dwaIF89
 f58a7ddlnS2JWcSzPj6sWbB6PWio0T2OczcxuY5AD/S1cqyCqA5XH31aTNzSn7ogWKFb
 vHp/0ZJTqWyeWxGjGnpOGm+q7dQvVPIUfPkdl9ZpuKfZsf/qeb2YRbB+Y2Y1himuAwaK
 R/6yZRaY+Wp3OALnrPPy3Q20wPHYzL3qrs7q4L+DkjULMhLyM9h4w1AE7IO9NEhLWYXC
 JDBQHANGiE7SDTqINDWh+jOrfXkV0W9STzgy7Duv+UiMis/RHCl9mcV8sTh6DOIWwfcj
 cTAg==
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
Cc: etnaviv@lists.freedesktop.org, cphealy@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXMgc2VlbiBhdCBDb2RlQXVyb3JhJ3MgbGludXgtaW14IGdpdCByZXBvIGluIGlteF80LjE5LjM1
XzEuMC4wIGJyYW5jaC4KClNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBHbWVpbmVyIDxjaHJpc3Rp
YW4uZ21laW5lckBnbWFpbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZp
dl9wZXJmbW9uLmMgfCA0NCArKysrKysrKysrKysrKysrKy0tLS0tLQogMSBmaWxlIGNoYW5nZWQs
IDMzIGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9ldG5hdml2L2V0bmF2aXZfcGVyZm1vbi5jIGIvZHJpdmVycy9ncHUvZHJtL2V0bmF2
aXYvZXRuYXZpdl9wZXJmbW9uLmMKaW5kZXggMDZlNmQzZWUxYzM0Li4zYzc0YjEyNzNlYTkgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfcGVyZm1vbi5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfcGVyZm1vbi5jCkBAIC00LDYgKzQsNyBA
QAogICogQ29weXJpZ2h0IChDKSAyMDE3IFpvZGlhYyBJbmZsaWdodCBJbm5vdmF0aW9ucwogICov
CiAKKyNpbmNsdWRlICJjb21tb24ueG1sLmgiCiAjaW5jbHVkZSAiZXRuYXZpdl9ncHUuaCIKICNp
bmNsdWRlICJldG5hdml2X3BlcmZtb24uaCIKICNpbmNsdWRlICJzdGF0ZV9oaS54bWwuaCIKQEAg
LTM1LDEzICszNiw2IEBAIHN0cnVjdCBldG5hdml2X3BtX2RvbWFpbl9tZXRhIHsKIAl1MzIgbnJf
ZG9tYWluczsKIH07CiAKLXN0YXRpYyB1MzIgc2ltcGxlX3JlZ19yZWFkKHN0cnVjdCBldG5hdml2
X2dwdSAqZ3B1LAotCWNvbnN0IHN0cnVjdCBldG5hdml2X3BtX2RvbWFpbiAqZG9tYWluLAotCWNv
bnN0IHN0cnVjdCBldG5hdml2X3BtX3NpZ25hbCAqc2lnbmFsKQotewotCXJldHVybiBncHVfcmVh
ZChncHUsIHNpZ25hbC0+ZGF0YSk7Ci19Ci0KIHN0YXRpYyB1MzIgcGVyZl9yZWdfcmVhZChzdHJ1
Y3QgZXRuYXZpdl9ncHUgKmdwdSwKIAljb25zdCBzdHJ1Y3QgZXRuYXZpdl9wbV9kb21haW4gKmRv
bWFpbiwKIAljb25zdCBzdHJ1Y3QgZXRuYXZpdl9wbV9zaWduYWwgKnNpZ25hbCkKQEAgLTc1LDYg
KzY5LDM0IEBAIHN0YXRpYyB1MzIgcGlwZV9yZWdfcmVhZChzdHJ1Y3QgZXRuYXZpdl9ncHUgKmdw
dSwKIAlyZXR1cm4gdmFsdWU7CiB9CiAKK3N0YXRpYyB1MzIgaGlfdG90YWxfY3ljbGVfcmVhZChz
dHJ1Y3QgZXRuYXZpdl9ncHUgKmdwdSwKKwljb25zdCBzdHJ1Y3QgZXRuYXZpdl9wbV9kb21haW4g
KmRvbWFpbiwKKwljb25zdCBzdHJ1Y3QgZXRuYXZpdl9wbV9zaWduYWwgKnNpZ25hbCkKK3sKKwl1
MzIgcmVnID0gVklWU19ISV9QUk9GSUxFX1RPVEFMX0NZQ0xFUzsKKworCWlmIChncHUtPmlkZW50
aXR5Lm1vZGVsID09IGNoaXBNb2RlbF9HQzg4MCB8fAorCQlncHUtPmlkZW50aXR5Lm1vZGVsID09
IGNoaXBNb2RlbF9HQzIwMDAgfHwKKwkJZ3B1LT5pZGVudGl0eS5tb2RlbCA9PSBjaGlwTW9kZWxf
R0MyMTAwKQorCQlyZWcgPSBWSVZTX01DX1BST0ZJTEVfQ1lDTEVfQ09VTlRFUjsKKworCXJldHVy
biBncHVfcmVhZChncHUsIHJlZyk7Cit9CisKK3N0YXRpYyB1MzIgaGlfdG90YWxfaWRsZV9jeWNs
ZV9yZWFkKHN0cnVjdCBldG5hdml2X2dwdSAqZ3B1LAorCWNvbnN0IHN0cnVjdCBldG5hdml2X3Bt
X2RvbWFpbiAqZG9tYWluLAorCWNvbnN0IHN0cnVjdCBldG5hdml2X3BtX3NpZ25hbCAqc2lnbmFs
KQoreworCXUzMiByZWcgPSBWSVZTX0hJX1BST0ZJTEVfSURMRV9DWUNMRVM7CisKKwlpZiAoZ3B1
LT5pZGVudGl0eS5tb2RlbCA9PSBjaGlwTW9kZWxfR0M4ODAgfHwKKwkJZ3B1LT5pZGVudGl0eS5t
b2RlbCA9PSBjaGlwTW9kZWxfR0MyMDAwIHx8CisJCWdwdS0+aWRlbnRpdHkubW9kZWwgPT0gY2hp
cE1vZGVsX0dDMjEwMCkKKwkJcmVnID0gVklWU19ISV9QUk9GSUxFX1RPVEFMX0NZQ0xFUzsKKwor
CXJldHVybiBncHVfcmVhZChncHUsIHJlZyk7Cit9CisKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZXRu
YXZpdl9wbV9kb21haW4gZG9tc18zZFtdID0gewogCXsKIAkJLm5hbWUgPSAiSEkiLApAQCAtODQs
MTMgKzEwNiwxMyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGV0bmF2aXZfcG1fZG9tYWluIGRvbXNf
M2RbXSA9IHsKIAkJLnNpZ25hbCA9IChjb25zdCBzdHJ1Y3QgZXRuYXZpdl9wbV9zaWduYWxbXSkg
ewogCQkJewogCQkJCSJUT1RBTF9DWUNMRVMiLAotCQkJCVZJVlNfSElfUFJPRklMRV9UT1RBTF9D
WUNMRVMsCi0JCQkJJnNpbXBsZV9yZWdfcmVhZAorCQkJCTAsCisJCQkJJmhpX3RvdGFsX2N5Y2xl
X3JlYWQKIAkJCX0sCiAJCQl7CiAJCQkJIklETEVfQ1lDTEVTIiwKLQkJCQlWSVZTX0hJX1BST0ZJ
TEVfSURMRV9DWUNMRVMsCi0JCQkJJnNpbXBsZV9yZWdfcmVhZAorCQkJCTAsCisJCQkJJmhpX3Rv
dGFsX2lkbGVfY3ljbGVfcmVhZAogCQkJfSwKIAkJCXsKIAkJCQkiQVhJX0NZQ0xFU19SRUFEX1JF
UVVFU1RfU1RBTExFRCIsCi0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
