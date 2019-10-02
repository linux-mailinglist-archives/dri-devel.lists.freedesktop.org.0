Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 376EFC483C
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 09:19:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E403B6E8D1;
	Wed,  2 Oct 2019 07:18:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C35B6E252;
 Wed,  2 Oct 2019 03:46:20 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id z19so53802780ior.0;
 Tue, 01 Oct 2019 20:46:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=sMiLu1nFfK7FMPb2g7QpUm4/s0CIGTuYLHYbn9DfaIs=;
 b=p8xbBm14XWtTTB5CMUmKCk5HdfK4J+7dnX0aa4QgzvjorPWHbMJOGor+sQ8tH1XBBf
 OdOoQpJoHGJhtZE31IWkRYJduODy87Ls7xGS5X0ZGzDjYmchS1ia30r+AtxfmLvLRzo5
 Tki1Za//l1AnZw+xbTw9HO6+eRjgsxkaglcQSUoL3JFTRil7ptPgMcKVXXTnuKtAs0bv
 jsYZEReD4QvLMQ8LzCnVpT4U/IGnC1Z0nYEybQLfh3/U6+KrlKlChCcJaHM6XqUDRXnJ
 ca7PaNwKZw9K5KqtzCWS2NY5OmhJtLc26ppMsqTsH5gXR1SFtHUdYia9XDit7yDE9sQ2
 suoA==
X-Gm-Message-State: APjAAAWF+EiYHE0RPIRH6BNjq5INluV0N5EYwqBAesLfAmUQKGSZi1Lg
 8B9u9xSnkK7DVOJf7HwPBo4=
X-Google-Smtp-Source: APXvYqxBSaRVO13ufXz4U6Ax3TS8H6IV1DY0yKgl9bb9DwQJ273pBwhSqWynoCXut9XmvjP3YaTsiQ==
X-Received: by 2002:a92:3951:: with SMTP id g78mr1716427ila.47.1569987980208; 
 Tue, 01 Oct 2019 20:46:20 -0700 (PDT)
Received: from cs-dulles.cs.umn.edu (cs-dulles.cs.umn.edu. [128.101.35.54])
 by smtp.googlemail.com with ESMTPSA id d20sm8878418ilk.83.2019.10.01.20.46.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Oct 2019 20:46:19 -0700 (PDT)
From: Navid Emamdoost <navid.emamdoost@gmail.com>
To: Christian.Koenig@amd.com
Subject: [PATCH v4] drm/amdgpu: fix multiple memory leaks in acp_hw_init
Date: Tue,  1 Oct 2019 22:46:07 -0500
Message-Id: <20191002034612.26607-1-navid.emamdoost@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <3a00a4c9-af4c-3505-1bef-b119435da5d7@amd.com>
References: <3a00a4c9-af4c-3505-1bef-b119435da5d7@amd.com>
X-Mailman-Approved-At: Wed, 02 Oct 2019 07:18:31 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=sMiLu1nFfK7FMPb2g7QpUm4/s0CIGTuYLHYbn9DfaIs=;
 b=KWDfpkNW+DV7MjaClVF7N49DLsXJyF3RAT4b7pah37LslRcUv0Rcr2rXdfsgE/Ycm/
 xF3IskpJLJOkAcmNwVcD+p5yCLEgITeuIWiJye+83OJ0O67cSlDLUfYQOlgw2pppc4Gp
 DFmnAQLlxL5oJW3HwQxarNO5uyOfBS47AJ6LKj9CPtN5X8Vp+nhJRDb2zBfUzrP4vhNM
 81qsfDlhnEPKdG6QjkkHDl4D0/iE7FI/P3GD+H+6dOKgo1SG2je6TeOzGM1PB1AN/ifR
 4lAXRHKiGK53gg5hp82rMympyIWVjM61PUSoflF+t0WAWQdBnbbJyUuptHxFrUxzTZkF
 ntUg==
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
Cc: David Airlie <airlied@linux.ie>, Rex Zhu <Rex.Zhu@amd.com>, kjlu@umn.edu,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, emamd001@umn.edu,
 dri-devel@lists.freedesktop.org, smccaman@umn.edu,
 Alex Deucher <alexander.deucher@amd.com>, Sam Ravnborg <sam@ravnborg.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Navid Emamdoost <navid.emamdoost@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW4gYWNwX2h3X2luaXQgdGhlcmUgYXJlIHNvbWUgYWxsb2NhdGlvbnMgdGhhdCBuZWVkcyB0byBi
ZSByZWxlYXNlZCBpbgpjYXNlIG9mIGZhaWx1cmU6CgoxLSBhZGV2LT5hY3AuYWNwX2dlbnBkIHNo
b3VsZCBiZSByZWxlYXNlZCBpZiBhbnkgYWxsb2NhdGlvbiBhdHRlbXAgZm9yCmFkZXYtPmFjcC5h
Y3BfY2VsbCwgYWRldi0+YWNwLmFjcF9yZXMgb3IgaTJzX3BkYXRhIGZhaWxzLgoyLSBhbGwgb2Yg
dGhvc2UgYWxsb2NhdGlvbnMgc2hvdWxkIGJlIHJlbGVhc2VkIGlmCm1mZF9hZGRfaG90cGx1Z19k
ZXZpY2VzIG9yIHBtX2dlbnBkX2FkZF9kZXZpY2UgZmFpbC4KMy0gUmVsZWFzZSBpcyBuZWVkZWQg
aW4gY2FzZSBvZiB0aW1lIG91dCB2YWx1ZXMgZXhwaXJlLgoKU2lnbmVkLW9mZi1ieTogTmF2aWQg
RW1hbWRvb3N0IDxuYXZpZC5lbWFtZG9vc3RAZ21haWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9hY3AuYyB8IDM0ICsrKysrKysrKysrKysrKystLS0tLS0tLS0K
IDEgZmlsZSBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYWNwLmMgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYWNwLmMKaW5kZXggZWJhNDJjNzUyYmNhLi44MjE1
NWFjMzI4OGEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9h
Y3AuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYWNwLmMKQEAgLTE4
OSw3ICsxODksNyBAQCBzdGF0aWMgaW50IGFjcF9od19pbml0KHZvaWQgKmhhbmRsZSkKIAl1MzIg
dmFsID0gMDsKIAl1MzIgY291bnQgPSAwOwogCXN0cnVjdCBkZXZpY2UgKmRldjsKLQlzdHJ1Y3Qg
aTJzX3BsYXRmb3JtX2RhdGEgKmkyc19wZGF0YTsKKwlzdHJ1Y3QgaTJzX3BsYXRmb3JtX2RhdGEg
Kmkyc19wZGF0YSA9IE5VTEw7CiAKIAlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IChzdHJ1
Y3QgYW1kZ3B1X2RldmljZSAqKWhhbmRsZTsKIApAQCAtMjMxLDIwICsyMzEsMjEgQEAgc3RhdGlj
IGludCBhY3BfaHdfaW5pdCh2b2lkICpoYW5kbGUpCiAJYWRldi0+YWNwLmFjcF9jZWxsID0ga2Nh
bGxvYyhBQ1BfREVWUywgc2l6ZW9mKHN0cnVjdCBtZmRfY2VsbCksCiAJCQkJCQkJR0ZQX0tFUk5F
TCk7CiAKLQlpZiAoYWRldi0+YWNwLmFjcF9jZWxsID09IE5VTEwpCi0JCXJldHVybiAtRU5PTUVN
OworCWlmIChhZGV2LT5hY3AuYWNwX2NlbGwgPT0gTlVMTCkgeworCQlyID0gLUVOT01FTTsKKwkJ
Z290byBmYWlsdXJlOworCX0KIAogCWFkZXYtPmFjcC5hY3BfcmVzID0ga2NhbGxvYyg1LCBzaXpl
b2Yoc3RydWN0IHJlc291cmNlKSwgR0ZQX0tFUk5FTCk7CiAJaWYgKGFkZXYtPmFjcC5hY3BfcmVz
ID09IE5VTEwpIHsKLQkJa2ZyZWUoYWRldi0+YWNwLmFjcF9jZWxsKTsKLQkJcmV0dXJuIC1FTk9N
RU07CisJCXIgPSAtRU5PTUVNOworCQlnb3RvIGZhaWx1cmU7CiAJfQogCiAJaTJzX3BkYXRhID0g
a2NhbGxvYygzLCBzaXplb2Yoc3RydWN0IGkyc19wbGF0Zm9ybV9kYXRhKSwgR0ZQX0tFUk5FTCk7
CiAJaWYgKGkyc19wZGF0YSA9PSBOVUxMKSB7Ci0JCWtmcmVlKGFkZXYtPmFjcC5hY3BfcmVzKTsK
LQkJa2ZyZWUoYWRldi0+YWNwLmFjcF9jZWxsKTsKLQkJcmV0dXJuIC1FTk9NRU07CisJCXIgPSAt
RU5PTUVNOworCQlnb3RvIGZhaWx1cmU7CiAJfQogCiAJc3dpdGNoIChhZGV2LT5hc2ljX3R5cGUp
IHsKQEAgLTM0MSwxNCArMzQyLDE0IEBAIHN0YXRpYyBpbnQgYWNwX2h3X2luaXQodm9pZCAqaGFu
ZGxlKQogCXIgPSBtZmRfYWRkX2hvdHBsdWdfZGV2aWNlcyhhZGV2LT5hY3AucGFyZW50LCBhZGV2
LT5hY3AuYWNwX2NlbGwsCiAJCQkJCQkJCUFDUF9ERVZTKTsKIAlpZiAocikKLQkJcmV0dXJuIHI7
CisJCWdvdG8gZmFpbHVyZTsKIAogCWZvciAoaSA9IDA7IGkgPCBBQ1BfREVWUyA7IGkrKykgewog
CQlkZXYgPSBnZXRfbWZkX2NlbGxfZGV2KGFkZXYtPmFjcC5hY3BfY2VsbFtpXS5uYW1lLCBpKTsK
IAkJciA9IHBtX2dlbnBkX2FkZF9kZXZpY2UoJmFkZXYtPmFjcC5hY3BfZ2VucGQtPmdwZCwgZGV2
KTsKIAkJaWYgKHIpIHsKIAkJCWRldl9lcnIoZGV2LCAiRmFpbGVkIHRvIGFkZCBkZXYgdG8gZ2Vu
cGRcbiIpOwotCQkJcmV0dXJuIHI7CisJCQlnb3RvIGZhaWx1cmU7CiAJCX0KIAl9CiAKQEAgLTM2
Nyw3ICszNjgsOCBAQCBzdGF0aWMgaW50IGFjcF9od19pbml0KHZvaWQgKmhhbmRsZSkKIAkJCWJy
ZWFrOwogCQlpZiAoLS1jb3VudCA9PSAwKSB7CiAJCQlkZXZfZXJyKCZhZGV2LT5wZGV2LT5kZXYs
ICJGYWlsZWQgdG8gcmVzZXQgQUNQXG4iKTsKLQkJCXJldHVybiAtRVRJTUVET1VUOworCQkJciA9
IC1FVElNRURPVVQ7CisJCQlnb3RvIGZhaWx1cmU7CiAJCX0KIAkJdWRlbGF5KDEwMCk7CiAJfQpA
QCAtMzg0LDcgKzM4Niw4IEBAIHN0YXRpYyBpbnQgYWNwX2h3X2luaXQodm9pZCAqaGFuZGxlKQog
CQkJYnJlYWs7CiAJCWlmICgtLWNvdW50ID09IDApIHsKIAkJCWRldl9lcnIoJmFkZXYtPnBkZXYt
PmRldiwgIkZhaWxlZCB0byByZXNldCBBQ1BcbiIpOwotCQkJcmV0dXJuIC1FVElNRURPVVQ7CisJ
CQlyID0gLUVUSU1FRE9VVDsKKwkJCWdvdG8gZmFpbHVyZTsKIAkJfQogCQl1ZGVsYXkoMTAwKTsK
IAl9CkBAIC0zOTMsNiArMzk2LDEzIEBAIHN0YXRpYyBpbnQgYWNwX2h3X2luaXQodm9pZCAqaGFu
ZGxlKQogCXZhbCAmPSB+QUNQX1NPRlRfUkVTRVRfX1NvZnRSZXNldEF1ZF9NQVNLOwogCWNnc193
cml0ZV9yZWdpc3RlcihhZGV2LT5hY3AuY2dzX2RldmljZSwgbW1BQ1BfU09GVF9SRVNFVCwgdmFs
KTsKIAlyZXR1cm4gMDsKKworZmFpbHVyZToKKwlrZnJlZShpMnNfcGRhdGEpOworCWtmcmVlKGFk
ZXYtPmFjcC5hY3BfcmVzKTsKKwlrZnJlZShhZGV2LT5hY3AuYWNwX2NlbGwpOworCWtmcmVlKGFk
ZXYtPmFjcC5hY3BfZ2VucGQpOworCXJldHVybiByOwogfQogCiAvKioKLS0gCjIuMTcuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
