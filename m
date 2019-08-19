Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F5495150
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 01:04:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BE7F6E483;
	Mon, 19 Aug 2019 23:03:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F6646E45B
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 23:03:41 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id m3so2021947pgv.13
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 16:03:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=+HPcPs0/zlCUibj+7sx/QSMq53DKHKeHt3X4baMNzZs=;
 b=q5BICbx9bmP6Oyb1vnBlsIS5ulY+RSLTGvz9JGnIL8epo+/fXEBxhm4C/ZF+SP2QoQ
 gi8N7Z8oj2kWf0QLn3Esu/Jx+kKopGmwYTPHtJBlGOPfFxnBxhIYYNbu8MFxqNhn8orV
 ioVWNmV/gGES8+ZhEHozTELVGPRgKnWRCr24uVXAX0Blvvy2MoQNMzjz53xZv09ixb6v
 A1F1fsbMEy5uxTxip++0GZynxDn0ERQcehj1q5rygypaQWA0qCj2ee9NdvE/wXYY+XbE
 a5tEABhWpbi9K2ZU8Y/bY0f9aKSw/8yTgyRWMqzSF2ThuwFHgfyz8OYB2jS5o/8eKDtN
 Cz4w==
X-Gm-Message-State: APjAAAViCM7Am2W9vZlu1BQoTacGAsjdE1U19Ga2UZbs/Bvo588oroOJ
 wsC/3qkoQP6Iaqy3Wc0P0XLJyA==
X-Google-Smtp-Source: APXvYqyw7LbadLphD6JSmUioN4e4iV4Ibw8oT+is92wCfKEWMmhG+Ndg2xlLGksLs39nRlBJXygTng==
X-Received: by 2002:a17:90b:8c5:: with SMTP id
 ds5mr23549322pjb.142.1566255820961; 
 Mon, 19 Aug 2019 16:03:40 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 j15sm17256509pfr.146.2019.08.19.16.03.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 16:03:40 -0700 (PDT)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 10/25] drm: kirin: Move workqueue to ade_hw_ctx structure
Date: Mon, 19 Aug 2019 23:03:06 +0000
Message-Id: <20190819230321.56480-11-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819230321.56480-1-john.stultz@linaro.org>
References: <20190819230321.56480-1-john.stultz@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=+HPcPs0/zlCUibj+7sx/QSMq53DKHKeHt3X4baMNzZs=;
 b=l2V9cPKgC+xQf+M9Eq7V3R8A3hyhWD12bHUmsJxWIyt0fstaXxqCmLfeGxRgmVOXqy
 7B1Apsgv8PJHo4NM/w9wVyo2A83K3EejfwDWpzf/9jW7IpeJTjDRkJKdwAvN4ABQVs/T
 fVyIrAOR44GEq3ZqXg6hS5HgyrNA1aO74nqpvIdI2IG9dSUUkVeBZtCx9SCoI3eEe25L
 AYrm9KmrTi6I0zf05rvkRW/Qcdwl8mYmmX0sGPiRfgn10oRr9LFfYeWsQjU6v3kbpzvT
 xAWummgxsvsYfQWrtNRvuIYBsP92PNtkufKW7vNvuhVChCUj0Bmg+T+zSHkPFrlvsBEz
 yTLQ==
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Xinliang Liu <z.liuxinliang@hisilicon.com>,
 Rongrong Zou <zourongrong@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIHdvcmtxdWV1ZSB1c2VkIHRvIHJlc2V0IHRoZSBkaXNwbGF5IHdoZW4gd2UgaGl0IGFuIExE
SQp1bmRlcmZsb3cgZXJyb3IgaXMgQURFIHNwZWNpZmljLCBzbyBzaW5jZSB0aGlzIHBhdGNoIHNl
cmllcwp3b3JrcyB0byBtYWtlIHRoZSBraXJpbl9jcnRjIHN0cnVjdHVyZSBtb3JlIGdlbmVyaWMs
IG1vdmUgdGhlCndvcmtxdWV1ZSB0byB0aGUgYWRlX2h3X2N0eCBzdHJ1Y3R1cmUgaW5zdGVhZC4K
CkNjOiBSb25ncm9uZyBab3UgPHpvdXJvbmdyb25nQGdtYWlsLmNvbT4KQ2M6IFhpbmxpYW5nIExp
dSA8ei5saXV4aW5saWFuZ0BoaXNpbGljb24uY29tPgpDYzogRGF2aWQgQWlybGllIDxhaXJsaWVk
QGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpDYzogZHJpLWRl
dmVsIDxkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPgpDYzogU2FtIFJhdm5ib3JnIDxz
YW1AcmF2bmJvcmcub3JnPgpBY2tlZC1ieTogWGlubGlhbmcgTGl1IDx6LmxpdXhpbmxpYW5nQGhp
c2lsaWNvbi5jb20+ClJldmlld2VkLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+
ClNpZ25lZC1vZmYtYnk6IEpvaG4gU3R1bHR6IDxqb2huLnN0dWx0ekBsaW5hcm8ub3JnPgotLS0K
IGRyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24va2lyaW4va2lyaW5fZHJtX2FkZS5jIHwgMTIgKysr
KystLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24va2lyaW4va2lyaW5fZHJt
X2FkZS5jIGIvZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9raXJpbi9raXJpbl9kcm1fYWRlLmMK
aW5kZXggOGY1MDExNWEyMmQ4Li4xOTFlZTU5ZjY4YjYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9oaXNpbGljb24va2lyaW4va2lyaW5fZHJtX2FkZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9oaXNpbGljb24va2lyaW4va2lyaW5fZHJtX2FkZS5jCkBAIC01Miw2ICs1Miw3IEBAIHN0cnVj
dCBhZGVfaHdfY3R4IHsKIAlzdHJ1Y3QgY2xrICptZWRpYV9ub2NfY2xrOwogCXN0cnVjdCBjbGsg
KmFkZV9waXhfY2xrOwogCXN0cnVjdCByZXNldF9jb250cm9sICpyZXNldDsKKwlzdHJ1Y3Qgd29y
a19zdHJ1Y3QgZGlzcGxheV9yZXNldF93cTsKIAlib29sIHBvd2VyX29uOwogCWludCBpcnE7CiAK
QEAgLTYxLDcgKzYyLDYgQEAgc3RydWN0IGFkZV9od19jdHggewogc3RydWN0IGtpcmluX2NydGMg
ewogCXN0cnVjdCBkcm1fY3J0YyBiYXNlOwogCXZvaWQgKmh3X2N0eDsKLQlzdHJ1Y3Qgd29ya19z
dHJ1Y3QgZGlzcGxheV9yZXNldF93cTsKIAlib29sIGVuYWJsZTsKIH07CiAKQEAgLTM0OSw5ICsz
NDksOSBAQCBzdGF0aWMgdm9pZCBhZGVfY3J0Y19kaXNhYmxlX3ZibGFuayhzdHJ1Y3QgZHJtX2Ny
dGMgKmNydGMpCiAKIHN0YXRpYyB2b2lkIGRybV91bmRlcmZsb3dfd3Eoc3RydWN0IHdvcmtfc3Ry
dWN0ICp3b3JrKQogewotCXN0cnVjdCBraXJpbl9jcnRjICphY3J0YyA9IGNvbnRhaW5lcl9vZih3
b3JrLCBzdHJ1Y3Qga2lyaW5fY3J0YywKKwlzdHJ1Y3QgYWRlX2h3X2N0eCAqY3R4ID0gY29udGFp
bmVyX29mKHdvcmssIHN0cnVjdCBhZGVfaHdfY3R4LAogCQkJCQkgICAgICBkaXNwbGF5X3Jlc2V0
X3dxKTsKLQlzdHJ1Y3QgZHJtX2RldmljZSAqZHJtX2RldiA9ICgmYWNydGMtPmJhc2UpLT5kZXY7
CisJc3RydWN0IGRybV9kZXZpY2UgKmRybV9kZXYgPSBjdHgtPmNydGMtPmRldjsKIAlzdHJ1Y3Qg
ZHJtX2F0b21pY19zdGF0ZSAqc3RhdGU7CiAKIAlzdGF0ZSA9IGRybV9hdG9taWNfaGVscGVyX3N1
c3BlbmQoZHJtX2Rldik7CkBAIC0zNjIsNyArMzYyLDYgQEAgc3RhdGljIGlycXJldHVybl90IGFk
ZV9pcnFfaGFuZGxlcihpbnQgaXJxLCB2b2lkICpkYXRhKQogewogCXN0cnVjdCBhZGVfaHdfY3R4
ICpjdHggPSBkYXRhOwogCXN0cnVjdCBkcm1fY3J0YyAqY3J0YyA9IGN0eC0+Y3J0YzsKLQlzdHJ1
Y3Qga2lyaW5fY3J0YyAqa2NydGMgPSB0b19raXJpbl9jcnRjKGNydGMpOwogCXZvaWQgX19pb21l
bSAqYmFzZSA9IGN0eC0+YmFzZTsKIAl1MzIgc3RhdHVzOwogCkBAIC0zNzksNyArMzc4LDcgQEAg
c3RhdGljIGlycXJldHVybl90IGFkZV9pcnFfaGFuZGxlcihpbnQgaXJxLCB2b2lkICpkYXRhKQog
CQlhZGVfdXBkYXRlX2JpdHMoYmFzZSArIExESV9JTlRfQ0xSLCBVTkRFUkZMT1dfSU5UX0VOX09G
U1QsCiAJCQkJTUFTSygxKSwgMSk7CiAJCURSTV9FUlJPUigiTERJIHVuZGVyZmxvdyEiKTsKLQkJ
c2NoZWR1bGVfd29yaygma2NydGMtPmRpc3BsYXlfcmVzZXRfd3EpOworCQlzY2hlZHVsZV93b3Jr
KCZjdHgtPmRpc3BsYXlfcmVzZXRfd3EpOwogCX0KIAogCXJldHVybiBJUlFfSEFORExFRDsKQEAg
LTEwMTYsNiArMTAxNSw3IEBAIHN0YXRpYyB2b2lkICphZGVfaHdfY3R4X2FsbG9jKHN0cnVjdCBw
bGF0Zm9ybV9kZXZpY2UgKnBkZXYsCiAJaWYgKHJldCkKIAkJcmV0dXJuIEVSUl9QVFIoLUVJTyk7
CiAKKwlJTklUX1dPUksoJmN0eC0+ZGlzcGxheV9yZXNldF93cSwgZHJtX3VuZGVyZmxvd193cSk7
CiAJY3R4LT5jcnRjID0gY3J0YzsKIAogCXJldHVybiBjdHg7CkBAIC0xMDcxLDggKzEwNzEsNiBA
QCBzdGF0aWMgaW50IGFkZV9kcm1faW5pdChzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQog
CWlmIChyZXQpCiAJCXJldHVybiByZXQ7CiAKLQlJTklUX1dPUksoJmtjcnRjLT5kaXNwbGF5X3Jl
c2V0X3dxLCBkcm1fdW5kZXJmbG93X3dxKTsKLQogCXJldHVybiAwOwogfQogCi0tIAoyLjE3LjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
