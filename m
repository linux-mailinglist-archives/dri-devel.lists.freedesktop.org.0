Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5C3C069B
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2019 15:47:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76BE66E200;
	Fri, 27 Sep 2019 13:47:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67F216E1B1;
 Fri, 27 Sep 2019 13:47:12 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id i14so3512370pgt.11;
 Fri, 27 Sep 2019 06:47:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=uMw4hvbEA4bmRhiVJHopgK1rbXtd+d6CVZ87jV5clvw=;
 b=hkeHBy3EV+LBHnUqt7HuXD5CItHSl2gCozX8PEk4zCQR7pGQnTOyawnqDn3Wrco0rK
 +tWAnKusc7/46/im3jX0rZwqn0TkgTqagc2Q3HkazbcY7tfNvK9BFOC9HrIhz/ALR4T5
 L8u9UKJBcsHG6NxmjThfVHC5Q95mIjfCacIQMgOa1UB0jt+4O1OTfLC2BM0ale9XLhQA
 TR8rBxyA9+xnp0AziHsWAbjSe1j5VR5Hti63AxjSzF8NhrVTPxuRkSMmDYLS2bNfChTo
 mFaaY+hhvk8WevPXTR/gMLgPK1M6xMmXUwcG/wP7zoDWTkwxWgJa98RhocnGTWudnbiR
 DL3Q==
X-Gm-Message-State: APjAAAXu9amOVInCZpQW1noYT0utjtWTYBruCsGD+1c6mw9ivfMWYC10
 CNiZjRTb0e3t0A8eTb+3H/mF4I/k0ms=
X-Google-Smtp-Source: APXvYqwxX1NHIlpydsiLWEnppsEhB8Tiv67+vug6Fk00CHSVNOIjdWVFLrsE5BiNl4Cganh7qMxSZg==
X-Received: by 2002:a63:1521:: with SMTP id v33mr9451481pgl.9.1569592031802;
 Fri, 27 Sep 2019 06:47:11 -0700 (PDT)
Received: from localhost.localdomain (ah.ptr230.ptrcloud.net. [153.122.161.8])
 by smtp.gmail.com with ESMTPSA id
 q71sm5608860pjb.26.2019.09.27.06.47.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Sep 2019 06:47:11 -0700 (PDT)
From: Qiang Yu <yuq825@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/6] drm/v3d: use drm_gem_objects_lookup_user
Date: Fri, 27 Sep 2019 21:46:12 +0800
Message-Id: <20190927134616.21899-3-yuq825@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190927134616.21899-1-yuq825@gmail.com>
References: <20190927134616.21899-1-yuq825@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=uMw4hvbEA4bmRhiVJHopgK1rbXtd+d6CVZ87jV5clvw=;
 b=eVgtNTepYmpBl5CqJv8CXpxkhwJP02Zkps/q0Tnjely0JtPGfnDhDB1T97DwcT4aFK
 A24m0bUOQw76WhpUSh8XFMUJEMianJnS2lXhptQBi90DerJ4yaOy5CtyLGYJfLYffX3h
 TmA760wbmLHuCtMZN16AuWrhF5tGSyMMGhKI1hWop3tY6+quufvIrAuVB4ghn3bgFr3o
 ywA2Fc5a5tNFSXrT8BBXwHAe25bqNzu912Th6/ZEbHwBpaUBa1/GulpV7fABedDij9YC
 6Ox8ZTF3hcEp8RP6jgSqga9Zgi0B1dQVlz1n7bxWmk80B1MdH4RczOKlMHpsDmPsxBQJ
 tTbA==
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
Cc: lima@lists.freedesktop.org, Maxime Ripard <maxime.ripard@bootlin.com>,
 David Airlie <airlied@linux.ie>, Qiang Yu <yuq825@gmail.com>,
 Sean Paul <sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

djI6CnVzZSBkcm1fZ2VtX29iamVjdHNfbG9va3VwX3VzZXIgaW5zdGVhZCBvZgpkcm1fZ2VtX29i
amVjdHNfbG9va3VwLgoKQ2M6IEVyaWMgQW5ob2x0IDxlcmljQGFuaG9sdC5uZXQ+ClNpZ25lZC1v
ZmYtYnk6IFFpYW5nIFl1IDx5dXE4MjVAZ21haWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS92
M2QvdjNkX2dlbS5jIHwgNDkgKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIDEg
ZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDQ2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS92M2QvdjNkX2dlbS5jIGIvZHJpdmVycy9ncHUvZHJtL3YzZC92
M2RfZ2VtLmMKaW5kZXggNGM0YjU5YWUyYzgxLi43NWEzYjQ0OGYzZmEgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS92M2QvdjNkX2dlbS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS92M2QvdjNk
X2dlbS5jCkBAIC0yOTAsMTAgKzI5MCw2IEBAIHYzZF9sb29rdXBfYm9zKHN0cnVjdCBkcm1fZGV2
aWNlICpkZXYsCiAJICAgICAgIHU2NCBib19oYW5kbGVzLAogCSAgICAgICB1MzIgYm9fY291bnQp
CiB7Ci0JdTMyICpoYW5kbGVzOwotCWludCByZXQgPSAwOwotCWludCBpOwotCiAJam9iLT5ib19j
b3VudCA9IGJvX2NvdW50OwogCiAJaWYgKCFqb2ItPmJvX2NvdW50KSB7CkBAIC0zMDQsNDggKzMw
MCw5IEBAIHYzZF9sb29rdXBfYm9zKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCiAJCXJldHVybiAt
RUlOVkFMOwogCX0KIAotCWpvYi0+Ym8gPSBrdm1hbGxvY19hcnJheShqb2ItPmJvX2NvdW50LAot
CQkJCSBzaXplb2Yoc3RydWN0IGRybV9nZW1fY21hX29iamVjdCAqKSwKLQkJCQkgR0ZQX0tFUk5F
TCB8IF9fR0ZQX1pFUk8pOwotCWlmICgham9iLT5ibykgewotCQlEUk1fREVCVUcoIkZhaWxlZCB0
byBhbGxvY2F0ZSB2YWxpZGF0ZWQgQk8gcG9pbnRlcnNcbiIpOwotCQlyZXR1cm4gLUVOT01FTTsK
LQl9Ci0KLQloYW5kbGVzID0ga3ZtYWxsb2NfYXJyYXkoam9iLT5ib19jb3VudCwgc2l6ZW9mKHUz
MiksIEdGUF9LRVJORUwpOwotCWlmICghaGFuZGxlcykgewotCQlyZXQgPSAtRU5PTUVNOwotCQlE
Uk1fREVCVUcoIkZhaWxlZCB0byBhbGxvY2F0ZSBpbmNvbWluZyBHRU0gaGFuZGxlc1xuIik7Ci0J
CWdvdG8gZmFpbDsKLQl9Ci0KLQlpZiAoY29weV9mcm9tX3VzZXIoaGFuZGxlcywKLQkJCSAgICh2
b2lkIF9fdXNlciAqKSh1aW50cHRyX3QpYm9faGFuZGxlcywKLQkJCSAgIGpvYi0+Ym9fY291bnQg
KiBzaXplb2YodTMyKSkpIHsKLQkJcmV0ID0gLUVGQVVMVDsKLQkJRFJNX0RFQlVHKCJGYWlsZWQg
dG8gY29weSBpbiBHRU0gaGFuZGxlc1xuIik7Ci0JCWdvdG8gZmFpbDsKLQl9Ci0KLQlzcGluX2xv
Y2soJmZpbGVfcHJpdi0+dGFibGVfbG9jayk7Ci0JZm9yIChpID0gMDsgaSA8IGpvYi0+Ym9fY291
bnQ7IGkrKykgewotCQlzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKmJvID0gaWRyX2ZpbmQoJmZpbGVf
cHJpdi0+b2JqZWN0X2lkciwKLQkJCQkJCSAgICAgaGFuZGxlc1tpXSk7Ci0JCWlmICghYm8pIHsK
LQkJCURSTV9ERUJVRygiRmFpbGVkIHRvIGxvb2sgdXAgR0VNIEJPICVkOiAlZFxuIiwKLQkJCQkg
IGksIGhhbmRsZXNbaV0pOwotCQkJcmV0ID0gLUVOT0VOVDsKLQkJCXNwaW5fdW5sb2NrKCZmaWxl
X3ByaXYtPnRhYmxlX2xvY2spOwotCQkJZ290byBmYWlsOwotCQl9Ci0JCWRybV9nZW1fb2JqZWN0
X2dldChibyk7Ci0JCWpvYi0+Ym9baV0gPSBibzsKLQl9Ci0Jc3Bpbl91bmxvY2soJmZpbGVfcHJp
di0+dGFibGVfbG9jayk7Ci0KLWZhaWw6Ci0Ja3ZmcmVlKGhhbmRsZXMpOwotCXJldHVybiByZXQ7
CisJcmV0dXJuIGRybV9nZW1fb2JqZWN0c19sb29rdXBfdXNlcihmaWxlX3ByaXYsCisJCQkJCSAg
ICh2b2lkIF9fdXNlciAqKSh1aW50cHRyX3QpYm9faGFuZGxlcywKKwkJCQkJICAgam9iLT5ib19j
b3VudCwgJmpvYi0+Ym8pOwogfQogCiBzdGF0aWMgdm9pZAotLSAKMi4xNy4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
