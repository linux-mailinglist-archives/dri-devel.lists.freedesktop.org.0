Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EED192EAA22
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jan 2021 12:45:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2579089A86;
	Tue,  5 Jan 2021 11:45:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EF7789A86
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jan 2021 11:45:08 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id q18so35924294wrn.1
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Jan 2021 03:45:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ei3kKHSHrclUuHiGe/7ozN5gM9Mrx5AyjWPyi3rXUWM=;
 b=QPLY7bzxQJvNIsGHchRrij8ZIkaiY9u/kZEP0/KKX06+pqNbiw8T2lI93YPOWmH6Sz
 oESotjojxRg+TQgCpPW+XxFsHydlZrGno5YOKjfEdxqMVhiYcSMrl3KnG/pPqc23y5ZY
 JIj8p3BYvuCt/wzmjCI++YJyEkM/TKdDQV/s/QdP6LapbqbyzG/nbrcbSZEU+Ah4rCEH
 c7EPmm0dM8PMzrxHU4zXfMAmf0iPgEtEuSN/VVZBBcxuzZyCQtng+iMEkzI0X4lg+a0X
 uZtQlfoOo8g1Bjucg1KYHbPZtRoy+HAXRdocvGbJePjqgY25y6KczO0BN6i2TF+dLw4l
 Qtjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ei3kKHSHrclUuHiGe/7ozN5gM9Mrx5AyjWPyi3rXUWM=;
 b=N582HUDvuPn7cA5s4ZldXwL7r76FaSmV2XGqYar9mXMnMVVoGCQiUFcpK4sLjENN5j
 fqGJXVL229o+MLJoidpeKux+Oqk+ylTAK5wjnQKhdBvcM1s95O/9AnKMdkojOaQYUzqu
 FwFKXMA9sWlyuF9mMoEmi+jpF2DTqDLtUaS41YbsLFHoKEEz7jD/X4+rvdl17mYugA5X
 jNeoPpGycSKdc09Sgc5HLyVRzfgmZTUN0iJKeBNqIZlqzuxv76f/p/wy1gAfKO778OWw
 87rBuKHeCO1D29Tp9etjf3ykHY/2JIccUvQkJCvdUTFmI2DVfajGMCu94wAqHvV8NxGO
 IV4g==
X-Gm-Message-State: AOAM533kiIAZE4nlPIt9s9AZNhiaCUotebrVGFZjtckMInF94JQ94JOe
 bVxisqlPXlmFPS67wd302qpWUx1+9og=
X-Google-Smtp-Source: ABdhPJycyT52vgafqyBrDYj8oxkfXOy3kX8TMlxbLGfSuF5jkH7KEt7onmnUltgmcdtHnuszwYXbVg==
X-Received: by 2002:adf:fb85:: with SMTP id a5mr2395089wrr.331.1609847106650; 
 Tue, 05 Jan 2021 03:45:06 -0800 (PST)
Received: from laptop.fritz.box ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id c4sm105372388wrw.72.2021.01.05.03.45.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 03:45:06 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/ttm: Remove pinned bos from LRU in
 ttm_bo_move_to_lru_tail() v2
Date: Tue,  5 Jan 2021 12:45:05 +0100
Message-Id: <20210105114505.38210-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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

RnJvbTogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KClJlY2VudGx5IGEgcmVncmVzc2lv
biB3YXMgaW50cm9kdWNlZCB3aGljaCBjYXVzZWQgVFRNJ3MgYnVmZmVyIGV2aWN0aW9uIHRvCmF0
dGVtcHQgdG8gZXZpY3QgYWxyZWFkeS1waW5uZWQgQk9zLCBjYXVzaW5nIGlzc3VlcyB3aXRoIGJ1
ZmZlciBldmljdGlvbgp1bmRlciBtZW1vcnkgcHJlc3N1cmUgYWxvbmcgd2l0aCBzdXNwZW5kL3Jl
c3VtZToKCiAgbm91dmVhdSAwMDAwOjFmOjAwLjA6IERSTTogZXZpY3RpbmcgYnVmZmVycy4uLgog
IG5vdXZlYXUgMDAwMDoxZjowMC4wOiBEUk06IE1vdmluZyBwaW5uZWQgb2JqZWN0IDAwMDAwMDAw
YzQyOGMzZmYhCiAgbm91dmVhdSAwMDAwOjFmOjAwLjA6IGZpZm86IGZhdWx0IDAwIFtSRUFEXSBh
dCAwMDAwMDAwMDAwMjAwMDAwIGVuZ2luZSAwNAogIFtCQVIxXSBjbGllbnQgMDcgW0hVQi9IT1NU
X0NQVV0gcmVhc29uIDAyIFtQVEVdIG9uIGNoYW5uZWwgLTEgWzAwZmZlYWEwMDAKICB1bmtub3du
XQogIG5vdXZlYXUgMDAwMDoxZjowMC4wOiBmaWZvOiBEUk9QUEVEX01NVV9GQVVMVCAwMDAwMTAw
MAogIG5vdXZlYXUgMDAwMDoxZjowMC4wOiBmaWZvOiBmYXVsdCAwMSBbV1JJVEVdIGF0IDAwMDAw
MDAwMDAwMjAwMDAgZW5naW5lCiAgMGMgW0hPU1Q2XSBjbGllbnQgMDcgW0hVQi9IT1NUX0NQVV0g
cmVhc29uIDAyIFtQVEVdIG9uIGNoYW5uZWwgMQogIFswMGZmYjI4MDAwIERSTV0KICBub3V2ZWF1
IDAwMDA6MWY6MDAuMDogZmlmbzogY2hhbm5lbCAxOiBraWxsZWQKICBub3V2ZWF1IDAwMDA6MWY6
MDAuMDogZmlmbzogcnVubGlzdCAwOiBzY2hlZHVsZWQgZm9yIHJlY292ZXJ5CiAgW1RUTV0gQnVm
ZmVyIGV2aWN0aW9uIGZhaWxlZAogIG5vdXZlYXUgMDAwMDoxZjowMC4wOiBEUk06IHdhaXRpbmcg
Zm9yIGtlcm5lbCBjaGFubmVscyB0byBnbyBpZGxlLi4uCiAgbm91dmVhdSAwMDAwOjFmOjAwLjA6
IERSTTogZmFpbGVkIHRvIGlkbGUgY2hhbm5lbCAxIFtEUk1dCiAgbm91dmVhdSAwMDAwOjFmOjAw
LjA6IERSTTogcmVzdW1pbmcgZGlzcGxheS4uLgoKQWZ0ZXIgc29tZSBiaXNlY3Rpb24gYW5kIGlu
dmVzdGlnYXRpb24sIGl0IGFwcGVhcnMgdGhpcyByZXN1bHRlZCBmcm9tIHRoZQpyZWNlbnQgY2hh
bmdlcyB0byB0dG1fYm9fbW92ZV90b19scnVfdGFpbCgpLiBQcmV2aW91c2x5IHdoZW4gYSBidWZm
ZXIgd2FzCnBpbm5lZCwgdGhlIGJ1ZmZlciB3b3VsZCBiZSByZW1vdmVkIGZyb20gdGhlIExSVSBv
bmNlIHR0bV9ib191bnJlc2VydmUKdG8gbWFpbnRhaW4gdGhlIExSVSBsaXN0IHdoZW4gcGlubmlu
ZyBvciB1bnBpbm5pbmcgQk9zLiBIb3dldmVyLCBzaW5jZToKCmNvbW1pdCAzZDFhODhlMTA1MWYg
KCJkcm0vdHRtOiBjbGVhbnVwIExSVSBoYW5kbGluZyBmdXJ0aGVyIikKCldlJ3ZlIGJlZW4gZXhp
dGluZyBmcm9tIHR0bV9ib19tb3ZlX3RvX2xydV90YWlsKCkgYXQgdGhlIHZlcnkgYmVnaW5uaW5n
IG9mCnRoZSBmdW5jdGlvbiBpZiB0aGUgYm8gd2UncmUgbG9va2luZyBhdCBpcyBwaW5uZWQsIHJl
c3VsdGluZyBpbiB0aGUgcGlubmVkCkJPIG5ldmVyIGdldHRpbmcgcmVtb3ZlZCBmcm9tIHRoZSBs
cnUgYW5kIGFzIGEgcmVzdWx0IC0gY2F1c2luZyBpc3N1ZXMgd2hlbgppdCBldmVudHVhbGx5IGJl
Y29tZXMgdGltZSBmb3IgZXZpY3Rpb24uCgpTbywgbGV0J3MgZml4IHRoaXMgYnkgY2FsbGluZyB0
dG1fYm9fZGVsX2Zyb21fbHJ1KCkgZnJvbQp0dG1fYm9fbW92ZV90b19scnVfdGFpbCgpIGluIHRo
ZSBldmVudCB0aGF0IHdlJ3JlIGRlYWxpbmcgd2l0aCBhIHBpbm5lZApidWZmZXIuCgp2MiAoY2hr
KTogcmVkdWNlIHRvIG9ubHkgdGhlIGZpeGluZyBvbmUgbGluZXIgc2luY2Ugd2UgYWx3YXlzIHdh
bnQgdG8KY2FsbCB0aGUgY2FsbGJhY2sgd2hlbmV2ZXIgd2Ugd291bGQgbW92ZSBvbiB0aGUgTFJV
LgoKU2lnbmVkLW9mZi1ieTogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KRml4ZXM6IDNk
MWE4OGUxMDUxZiAoImRybS90dG06IGNsZWFudXAgTFJVIGhhbmRsaW5nIGZ1cnRoZXIiKQpDYzog
Q2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpDYzogRGF2ZSBBaXJs
aWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5j
IHwgNCArKystCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYyBiL2RyaXZlcnMvZ3B1
L2RybS90dG0vdHRtX2JvLmMKaW5kZXggMzFlOGIzZGE1NTYzLi5iNjVmNGIxMmY5ODYgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L3R0bS90dG1fYm8uYwpAQCAtMTM4LDggKzEzOCwxMCBAQCB2b2lkIHR0bV9ib19tb3ZlX3RvX2xy
dV90YWlsKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sCiAKIAlkbWFfcmVzdl9hc3NlcnRf
aGVsZChiby0+YmFzZS5yZXN2KTsKIAotCWlmIChiby0+cGluX2NvdW50KQorCWlmIChiby0+cGlu
X2NvdW50KSB7CisJCXR0bV9ib19kZWxfZnJvbV9scnUoYm8pOwogCQlyZXR1cm47CisJfQogCiAJ
bWFuID0gdHRtX21hbmFnZXJfdHlwZShiZGV2LCBtZW0tPm1lbV90eXBlKTsKIAlsaXN0X21vdmVf
dGFpbCgmYm8tPmxydSwgJm1hbi0+bHJ1W2JvLT5wcmlvcml0eV0pOwotLSAKMi4yNS4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
