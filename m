Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B793547E
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2019 01:44:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE12D896E5;
	Tue,  4 Jun 2019 23:44:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD347896E5
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2019 23:44:40 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id c5so8960581pll.11
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jun 2019 16:44:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jJHAlXokWG7OivcI2de277Zp2JRG9LH61tC1WXdyAbs=;
 b=qVYkK7rRGUl6Yg1M+tTwNlwgoEJccmLenjElI8RBrOHr6XXHaXjMvJlco7CXrzpgY9
 XLFdQN2URMyNv0GgSd9EiaEkK8Fb/SWWx9Ng0JP4ppAKskXw2hVdcIJHySxsbSJ9XkqO
 NFatrbj43YD9NBEhjiEJfdbbJNyBNSzfcAzRtqxpY1FIMFKL8R/l1yYZGWLuO8MxNDLr
 nhgUubJOmkXFgtHzaGyk8wHb5KSiQK2m6L8pjHqCJDini46Fn8s0+q5aB9lHAo+RFcNM
 +C6Dn8YfFkJlC7Q2bpwVrDbB2m/2U78BDgjsHaYWlZ2nlMqRdjxJb1CiAi9D0TaYNWC7
 FwrQ==
X-Gm-Message-State: APjAAAVdtFzEFmdbyhxE7vmwefgbE0WxyHo4syRlb3WNT3uzNPWs04Lq
 zcnJ88F0zraEeW5cQvA08WspRkUxPKU=
X-Google-Smtp-Source: APXvYqw4lh1qQDuIMz9SIPSO1+ci0hqyzHfWYWcKVQX2xl8C5tKruhvlOfq2N9o5tfyhRj2Glx1OZw==
X-Received: by 2002:a17:902:3fa5:: with SMTP id
 a34mr38318191pld.317.1559691879963; 
 Tue, 04 Jun 2019 16:44:39 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:bc97:5740:52a7:6875])
 by smtp.gmail.com with ESMTPSA id 4sm20773860pfj.111.2019.06.04.16.44.38
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 04 Jun 2019 16:44:38 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/virtio: use u64_to_user_ptr macro
Date: Tue,  4 Jun 2019 16:44:28 -0700
Message-Id: <20190604234428.23252-1-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jJHAlXokWG7OivcI2de277Zp2JRG9LH61tC1WXdyAbs=;
 b=WBFGbelBLWHpEM4ttf19A1+ifEdZYR/LUGypvOt8XXhiVomo6fJ9AvmM26zor1xHeM
 o3+K2UAXhyacU6smKmg6LQ0RXB/1PMwFbC6n+KK+CBgw4NhJOtA6jWznPE3iFbixCnLW
 /enXyi9YtQYUpO2LVc8BUQ/VWGN4LXSLXyiLk=
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
Cc: kraxel@redhat.com, Gurchetan Singh <gurchetansingh@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T3RoZXIgRFJNIGRyaXZlcnMgdXNlIGl0IHRvby4KClNpZ25lZC1vZmYtYnk6IEd1cmNoZXRhbiBT
aW5naCA8Z3VyY2hldGFuc2luZ2hAY2hyb21pdW0ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS92
aXJ0aW8vdmlydGdwdV9pb2N0bC5jIHwgMTIgKysrKystLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwg
NSBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS92aXJ0aW8vdmlydGdwdV9pb2N0bC5jIGIvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0
Z3B1X2lvY3RsLmMKaW5kZXggYjdmOWRmZTYxZDFjLi44YTE3ZWY5N2FhZGEgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9pb2N0bC5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS92aXJ0aW8vdmlydGdwdV9pb2N0bC5jCkBAIC0xNjgsNyArMTY4LDcgQEAgc3RhdGljIGlu
dCB2aXJ0aW9fZ3B1X2V4ZWNidWZmZXJfaW9jdGwoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9p
ZCAqZGF0YSwKIAkJCWdvdG8gb3V0X3VudXNlZF9mZDsKIAkJfQogCi0JCXVzZXJfYm9faGFuZGxl
cyA9ICh2b2lkIF9fdXNlciAqKSh1aW50cHRyX3QpZXhidWYtPmJvX2hhbmRsZXM7CisJCXVzZXJf
Ym9faGFuZGxlcyA9IHU2NF90b191c2VyX3B0cihleGJ1Zi0+Ym9faGFuZGxlcyk7CiAJCWlmIChj
b3B5X2Zyb21fdXNlcihib19oYW5kbGVzLCB1c2VyX2JvX2hhbmRsZXMsCiAJCQkJICAgZXhidWYt
Pm51bV9ib19oYW5kbGVzICogc2l6ZW9mKHVpbnQzMl90KSkpIHsKIAkJCXJldCA9IC1FRkFVTFQ7
CkBAIC0xOTUsOCArMTk1LDcgQEAgc3RhdGljIGludCB2aXJ0aW9fZ3B1X2V4ZWNidWZmZXJfaW9j
dGwoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwKIAlpZiAocmV0KQogCQlnb3Rv
IG91dF9mcmVlOwogCi0JYnVmID0gbWVtZHVwX3VzZXIoKHZvaWQgX191c2VyICopKHVpbnRwdHJf
dClleGJ1Zi0+Y29tbWFuZCwKLQkJCSAgZXhidWYtPnNpemUpOworCWJ1ZiA9IG1lbWR1cF91c2Vy
KHU2NF90b191c2VyX3B0cihleGJ1Zi0+Y29tbWFuZCksIGV4YnVmLT5zaXplKTsKIAlpZiAoSVNf
RVJSKGJ1ZikpIHsKIAkJcmV0ID0gUFRSX0VSUihidWYpOwogCQlnb3RvIG91dF91bnJlc3Y7CkBA
IC0yNjMsMTAgKzI2Miw5IEBAIHN0YXRpYyBpbnQgdmlydGlvX2dwdV9nZXRwYXJhbV9pb2N0bChz
dHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkICpkYXRhLAogCWRlZmF1bHQ6CiAJCXJldHVybiAt
RUlOVkFMOwogCX0KLQlpZiAoY29weV90b191c2VyKCh2b2lkIF9fdXNlciAqKSh1bnNpZ25lZCBs
b25nKXBhcmFtLT52YWx1ZSwKLQkJCSAmdmFsdWUsIHNpemVvZihpbnQpKSkgeworCWlmIChjb3B5
X3RvX3VzZXIodTY0X3RvX3VzZXJfcHRyKHBhcmFtLT52YWx1ZSksICZ2YWx1ZSwgc2l6ZW9mKGlu
dCkpKQogCQlyZXR1cm4gLUVGQVVMVDsKLQl9CisKIAlyZXR1cm4gMDsKIH0KIApAQCAtNTQ1LDcg
KzU0Myw3IEBAIHN0YXRpYyBpbnQgdmlydGlvX2dwdV9nZXRfY2Fwc19pb2N0bChzdHJ1Y3QgZHJt
X2RldmljZSAqZGV2LAogCXB0ciA9IGNhY2hlX2VudC0+Y2Fwc19jYWNoZTsKIAogY29weV9leGl0
OgotCWlmIChjb3B5X3RvX3VzZXIoKHZvaWQgX191c2VyICopKHVuc2lnbmVkIGxvbmcpYXJncy0+
YWRkciwgcHRyLCBzaXplKSkKKwlpZiAoY29weV90b191c2VyKHU2NF90b191c2VyX3B0cihhcmdz
LT5hZGRyKSwgcHRyLCBzaXplKSkKIAkJcmV0dXJuIC1FRkFVTFQ7CiAKIAlyZXR1cm4gMDsKLS0g
CjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
