Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F20B56316E
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2019 09:02:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBD94898EE;
	Tue,  9 Jul 2019 07:02:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3064C89DF9;
 Mon,  8 Jul 2019 15:12:31 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id t14so5347241plr.11;
 Mon, 08 Jul 2019 08:12:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=0ZlZQON9aXZI6W+/rm8yZm1Su8lHYcjbQIV3vB7p7ls=;
 b=i6Oo3eJMDtXpsuA0MiMKFYCAQV1hfQktcOndZJmITCVX9SODJZQAYHKz7js5/uIFcS
 C8Sp4f9LeLYB0ZjRvW9nXn3j6cBTkG8+DkBAs19F+8tYbQB4VkDx1SDzgbLl3LGG/EDy
 1Cz4Z0fxij6GLLaa91DniyH1jgbQbw8h4tuNljp0rtOFPzQmxO2BTIA/eqHxQFoJOaGP
 n6maE6ao05Vz7Xgmr+k4NRm+ic+/BKMCMvqwt6Wir2rQvYkdF4tgREcBwcU1tZc84zrZ
 zGMaTiADiwBmRT/jds0XG75vMJV3trRoUlxrQuhc7Z116BdQyUIo3+ImOJgk8/9GZFOq
 QFlA==
X-Gm-Message-State: APjAAAWHWd7WonDeBHOTqIYnQLX6wmSkJVGOyirwr1hmaZ79j6hS+VXV
 cTNm0negUF7T4utRK12iO+A=
X-Google-Smtp-Source: APXvYqzGcOLSRTDXNOYk/ZPO4pPqDF4I8CW3Kxig9leWs34URU+rJA8ZvqMFQ9pnLLDKwfcSi1JXAg==
X-Received: by 2002:a17:902:b20d:: with SMTP id
 t13mr24385288plr.229.1562598750859; 
 Mon, 08 Jul 2019 08:12:30 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id q198sm23082354pfq.155.2019.07.08.08.12.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 08 Jul 2019 08:12:30 -0700 (PDT)
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To: robdclark@gmail.com, sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
 bjorn.andersson@linaro.org
Subject: [PATCH v2] drm/msm/mdp5: Find correct node for creating gem address
 space
Date: Mon,  8 Jul 2019 08:12:24 -0700
Message-Id: <20190708151224.22555-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Tue, 09 Jul 2019 07:01:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=0ZlZQON9aXZI6W+/rm8yZm1Su8lHYcjbQIV3vB7p7ls=;
 b=WLG9PY/b56egrw6ro2o0M9u014Bd6pXU/gKDM9DWFKxH39OIF3810maRQKFlW5uRIq
 pN+4h9otmfgFm2UMQ05iVf/Mz/oGsvnbZgMWTSNQujR8HC+qUf73scnCmGiRJH+v0k08
 smv9KF8upZ4PAvBORJTFLeotH0hcXF9rwCuDgCTGs1M8R9cApI/vNYc7JLSeqATcqdfI
 h9abqenJJqCvOVVx0LKtp2nIG/lIyiqsEPUtvRfgGJ5jymTuV3QTGxV7KiDXtnfmeQCk
 IVOu6WplVBtQMIhTvR1thGTS8x4ieB5i5f/al64O31QA5Ml7yJ3AQVYX0yGYLoBoqLwD
 PgJw==
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q3JlYXRpbmcgdGhlIG1zbSBnZW0gYWRkcmVzcyBzcGFjZSByZXF1aXJlcyBhIHJlZmVyZW5jZSB0
byB0aGUgZGV2IHdoZXJlCnRoZSBpb21tdSBpcyBsb2NhdGVkLiAgVGhlIGRyaXZlciBjdXJyZW50
bHkgYXNzdW1lcyB0aGlzIGlzIHRoZSBzYW1lIGFzCnRoZSBwbGF0Zm9ybSBkZXZpY2UsIHdoaWNo
IGJyZWFrcyB3aGVuIHRoZSBpb21tdSBpcyBvdXRzaWRlIG9mIHRoZQpwbGF0Zm9ybSBkZXZpY2Ug
KGllIGluIHRoZSBwYXJlbnQpLiAgRGVmYXVsdCB0byB1c2luZyB0aGUgcGxhdGZvcm0gZGV2aWNl
LApidXQgY2hlY2sgdG8gc2VlIGlmIHRoYXQgaGFzIGFuIGlvbW11IHJlZmVyZW5jZSwgYW5kIGlm
IG5vdCwgdXNlIHRoZSBwYXJlbnQKZGV2aWNlIGluc3RlYWQuICBUaGlzIHNob3VsZCBoYW5kbGUg
YWxsIHRoZSB2YXJpb3VzIGlvbW11IGRlc2lnbnMgZm9yCm1kcDUgc3VwcG9ydGVkIHN5c3RlbXMu
CgpTaWduZWQtb2ZmLWJ5OiBKZWZmcmV5IEh1Z28gPGplZmZyZXkubC5odWdvQGdtYWlsLmNvbT4K
LS0tCgp2MjogSXQgdHVybnMgb3V0IHRoZXJlIGlzbid0IGEgdW5pdmVyc2FsIHdheSB0byBnZXQg
dGhlIGlvbW11IGRldmljZSwgc28gCmNoZWNrIHRvIHNlZSBpZiBpdHMgaW4gdGhlIGN1cnJlbnQg
bm9kZSBvciBwYXJlbnQKCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRwNS9tZHA1X2ttcy5j
IHwgNyArKysrKystCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL21kcDUvbWRwNV9rbXMu
YyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9tZHA1L21kcDVfa21zLmMKaW5kZXggNGE2MGY1
ZmNhNmIwLi4wMmRjN2Q0MjZjYjAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlz
cC9tZHA1L21kcDVfa21zLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL21kcDUvbWRw
NV9rbXMuYwpAQCAtNjYzLDYgKzY2Myw3IEBAIHN0cnVjdCBtc21fa21zICptZHA1X2ttc19pbml0
KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpCiAJc3RydWN0IG1zbV9rbXMgKmttczsKIAlzdHJ1Y3Qg
bXNtX2dlbV9hZGRyZXNzX3NwYWNlICphc3BhY2U7CiAJaW50IGlycSwgaSwgcmV0OworCXN0cnVj
dCBkZXZpY2UgKmlvbW11X2RldjsKIAogCS8qIHByaXYtPmttcyB3b3VsZCBoYXZlIGJlZW4gcG9w
dWxhdGVkIGJ5IHRoZSBNRFA1IGRyaXZlciAqLwogCWttcyA9IHByaXYtPmttczsKQEAgLTcwMiw3
ICs3MDMsMTEgQEAgc3RydWN0IG1zbV9rbXMgKm1kcDVfa21zX2luaXQoc3RydWN0IGRybV9kZXZp
Y2UgKmRldikKIAltZGVsYXkoMTYpOwogCiAJaWYgKGNvbmZpZy0+cGxhdGZvcm0uaW9tbXUpIHsK
LQkJYXNwYWNlID0gbXNtX2dlbV9hZGRyZXNzX3NwYWNlX2NyZWF0ZSgmcGRldi0+ZGV2LAorCQlp
b21tdV9kZXYgPSAmcGRldi0+ZGV2OworCQlpZiAoIWlvbW11X2Rldi0+aW9tbXVfZndzcGVjKQor
CQkJaW9tbXVfZGV2ID0gaW9tbXVfZGV2LT5wYXJlbnQ7CisKKwkJYXNwYWNlID0gbXNtX2dlbV9h
ZGRyZXNzX3NwYWNlX2NyZWF0ZShpb21tdV9kZXYsCiAJCQkJY29uZmlnLT5wbGF0Zm9ybS5pb21t
dSwgIm1kcDUiKTsKIAkJaWYgKElTX0VSUihhc3BhY2UpKSB7CiAJCQlyZXQgPSBQVFJfRVJSKGFz
cGFjZSk7Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
