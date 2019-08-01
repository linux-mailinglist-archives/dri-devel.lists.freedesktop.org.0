Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C5F7D3D2
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2019 05:45:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8A416E33D;
	Thu,  1 Aug 2019 03:44:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 005976E33D
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2019 03:44:53 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id b7so31544494pls.6
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2019 20:44:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=uEC63dbARYEuBlfRwpeBf8DWjhjcKGFjgUkUYEDal2c=;
 b=W2QsAB5NR3Y5BWuKCv5b7e2vyU9ANFY0RtFyFUz0Rx3j2pvVrFmuB8fPSFQcikI4NF
 sY1ApA53kTnAGtS1MQxSFlj7xD3kkI/nV3HphrsfL1PYkBaaPvoNfp+N8B8vuXc0olDH
 iaxgXA+CWKSVmCshWjONYp6b5FW14++Liim8G03+DNx+5fogzKGPbohMeBtPfg/jfroz
 6ZfUfCnDpuO6jggt1xheodKyweTR8A5cGElUkjPBpgytAkVAKSqvlf1Li771EM2GeqzI
 Suu7MXnSftYKRKniEz47q9m7KwgT/ySfhOFB2s03JPHYOnyInixTikK9lV4ofPtxlxg2
 3ufA==
X-Gm-Message-State: APjAAAXMYlH6+ofD+fLmJWSKbSAhtKGWA7LJcJk94Er+6dOkCRUB6o+f
 Lj8eJ/BbwWyLZGdeTurlYCweoQ==
X-Google-Smtp-Source: APXvYqyFPrpF1ZkyRxvqbslTyH9glBjcshx+BTBA0o+bExSUREc6tM4oDj8esscrMOpDE+uS5xwn+A==
X-Received: by 2002:a17:902:be03:: with SMTP id
 r3mr125030318pls.156.1564631093229; 
 Wed, 31 Jul 2019 20:44:53 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 h70sm64775674pgc.36.2019.07.31.20.44.51
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 31 Jul 2019 20:44:52 -0700 (PDT)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 05/26] drm: kirin: Remove uncessary parameter indirection
Date: Thu,  1 Aug 2019 03:44:18 +0000
Message-Id: <20190801034439.98227-6-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190801034439.98227-1-john.stultz@linaro.org>
References: <20190801034439.98227-1-john.stultz@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=uEC63dbARYEuBlfRwpeBf8DWjhjcKGFjgUkUYEDal2c=;
 b=vRnBOW0k+1Eg+RO86kU/byWqXZO9hXCUEe93OtnP7i+y4PXdVg5McCbFb1f5MRy2RS
 RohLpJZEfhAUCcVrDUb4vJTMC3q6GO8q2UR1COosrAVvIlhSW7420qSKLOgAD4WBBBw6
 KuDaSl70QaywqUqFDR7ZWXlBwZRZtWIYue/PlUeHjPRHs5SgYp22jsIE4M4HeQocfLi6
 1ozKxtqdd6b7RIv+ldjSbyUdFo7DrXj3juTCByOncD0xGM2b/a1fU27HmmShG6Lme4kN
 fkaXleAJopS0b084QGZsCIxoo+gSizQEvdoo7ELcJsG2EyyfGtisIYjfZ26JGy0R6rYM
 ZekQ==
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
Cc: Xu YiPing <xuyiping@hisilicon.com>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Rongrong Zou <zourongrong@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogWHUgWWlQaW5nIDx4dXlpcGluZ0BoaXNpbGljb24uY29tPgoKSW4gYSBmZXcgZnVuY3Rp
b25zLCB3ZSBwYXNzIGluIGEgc3RydWN0IGFkZV9jcnRjLCB3aGljaCB3ZSBvbmx5CnVzZSB0byBn
ZXQgdG8gdGhlIHVuZGVybHlpbmcgc3RydWN0IGFkZV9od19jdHguCgpUaHVzIHRoaXMgcGF0Y2gg
cmVmYWN0b3JzIHRoZSBmdW5jdGlvbnMgdG8ganVzdCB0YWtlIHRoZQpzdHJ1Y3QgYWRlX2h3X2N0
eCBkaXJlY3RseS4KCkNjOiBSb25ncm9uZyBab3UgPHpvdXJvbmdyb25nQGdtYWlsLmNvbT4KQ2M6
IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmll
bEBmZndsbC5jaD4KQ2M6IGRyaS1kZXZlbCA8ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
Zz4KQ2M6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KUmV2aWV3ZWQtYnk6IFNhbSBS
YXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KU2lnbmVkLW9mZi1ieTogWHUgWWlQaW5nIDx4dXlp
cGluZ0BoaXNpbGljb24uY29tPgpbanN0dWx0ejogcmV3b3JkZWQgY29tbWl0IG1lc3NhZ2VdClNp
Z25lZC1vZmYtYnk6IEpvaG4gU3R1bHR6IDxqb2huLnN0dWx0ekBsaW5hcm8ub3JnPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9oaXNpbGljb24va2lyaW4va2lyaW5fZHJtX2FkZS5jIHwgMTIgKysrKyst
LS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24va2lyaW4va2lyaW5fZHJtX2Fk
ZS5jIGIvZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9raXJpbi9raXJpbl9kcm1fYWRlLmMKaW5k
ZXggOWE5ZTNiNjg4YmEzLi43NTZhZWZkNWJjZmYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9oaXNpbGljb24va2lyaW4va2lyaW5fZHJtX2FkZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9o
aXNpbGljb24va2lyaW4va2lyaW5fZHJtX2FkZS5jCkBAIC0yMTAsMTEgKzIxMCwxMCBAQCBzdGF0
aWMgdm9pZCBhZGVfc2V0X3BpeF9jbGsoc3RydWN0IGFkZV9od19jdHggKmN0eCwKIAlhZGpfbW9k
ZS0+Y2xvY2sgPSBjbGtfZ2V0X3JhdGUoY3R4LT5hZGVfcGl4X2NsaykgLyAxMDAwOwogfQogCi1z
dGF0aWMgdm9pZCBhZGVfbGRpX3NldF9tb2RlKHN0cnVjdCBhZGVfY3J0YyAqYWNydGMsCitzdGF0
aWMgdm9pZCBhZGVfbGRpX3NldF9tb2RlKHN0cnVjdCBhZGVfaHdfY3R4ICpjdHgsCiAJCQkgICAg
IHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICptb2RlLAogCQkJICAgICBzdHJ1Y3QgZHJtX2Rpc3Bs
YXlfbW9kZSAqYWRqX21vZGUpCiB7Ci0Jc3RydWN0IGFkZV9od19jdHggKmN0eCA9IGFjcnRjLT5j
dHg7CiAJdm9pZCBfX2lvbWVtICpiYXNlID0gY3R4LT5iYXNlOwogCXUzMiB3aWR0aCA9IG1vZGUt
PmhkaXNwbGF5OwogCXUzMiBoZWlnaHQgPSBtb2RlLT52ZGlzcGxheTsKQEAgLTMwMSw5ICszMDAs
OCBAQCBzdGF0aWMgdm9pZCBhZGVfcG93ZXJfZG93bihzdHJ1Y3QgYWRlX2h3X2N0eCAqY3R4KQog
CWN0eC0+cG93ZXJfb24gPSBmYWxzZTsKIH0KIAotc3RhdGljIHZvaWQgYWRlX3NldF9tZWRpYW5v
Y19xb3Moc3RydWN0IGFkZV9jcnRjICphY3J0YykKK3N0YXRpYyB2b2lkIGFkZV9zZXRfbWVkaWFu
b2NfcW9zKHN0cnVjdCBhZGVfaHdfY3R4ICpjdHgpCiB7Ci0Jc3RydWN0IGFkZV9od19jdHggKmN0
eCA9IGFjcnRjLT5jdHg7CiAJc3RydWN0IHJlZ21hcCAqbWFwID0gY3R4LT5ub2NfcmVnbWFwOwog
CiAJcmVnbWFwX3VwZGF0ZV9iaXRzKG1hcCwgQURFMF9RT1NHRU5FUkFUT1JfTU9ERSwKQEAgLTUx
NSw3ICs1MTMsNyBAQCBzdGF0aWMgdm9pZCBhZGVfY3J0Y19hdG9taWNfZW5hYmxlKHN0cnVjdCBk
cm1fY3J0YyAqY3J0YywKIAkJCXJldHVybjsKIAl9CiAKLQlhZGVfc2V0X21lZGlhbm9jX3Fvcyhh
Y3J0Yyk7CisJYWRlX3NldF9tZWRpYW5vY19xb3MoY3R4KTsKIAlhZGVfZGlzcGxheV9lbmFibGUo
YWNydGMpOwogCWFkZV9kdW1wX3JlZ3MoY3R4LT5iYXNlKTsKIAlkcm1fY3J0Y192Ymxhbmtfb24o
Y3J0Yyk7CkBAIC01NDUsNyArNTQzLDcgQEAgc3RhdGljIHZvaWQgYWRlX2NydGNfbW9kZV9zZXRf
bm9mYihzdHJ1Y3QgZHJtX2NydGMgKmNydGMpCiAKIAlpZiAoIWN0eC0+cG93ZXJfb24pCiAJCSh2
b2lkKWFkZV9wb3dlcl91cChjdHgpOwotCWFkZV9sZGlfc2V0X21vZGUoYWNydGMsIG1vZGUsIGFk
al9tb2RlKTsKKwlhZGVfbGRpX3NldF9tb2RlKGN0eCwgbW9kZSwgYWRqX21vZGUpOwogfQogCiBz
dGF0aWMgdm9pZCBhZGVfY3J0Y19hdG9taWNfYmVnaW4oc3RydWN0IGRybV9jcnRjICpjcnRjLApA
QCAtNTU4LDcgKzU1Niw3IEBAIHN0YXRpYyB2b2lkIGFkZV9jcnRjX2F0b21pY19iZWdpbihzdHJ1
Y3QgZHJtX2NydGMgKmNydGMsCiAKIAlpZiAoIWN0eC0+cG93ZXJfb24pCiAJCSh2b2lkKWFkZV9w
b3dlcl91cChjdHgpOwotCWFkZV9sZGlfc2V0X21vZGUoYWNydGMsIG1vZGUsIGFkal9tb2RlKTsK
KwlhZGVfbGRpX3NldF9tb2RlKGN0eCwgbW9kZSwgYWRqX21vZGUpOwogfQogCiBzdGF0aWMgdm9p
ZCBhZGVfY3J0Y19hdG9taWNfZmx1c2goc3RydWN0IGRybV9jcnRjICpjcnRjLAotLSAKMi4xNy4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
