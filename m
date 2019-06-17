Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95FBC4911A
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 22:13:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C2916E0A0;
	Mon, 17 Jun 2019 20:13:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BB6F6E0A0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 20:13:43 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id x47so12364184qtk.11
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 13:13:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q0IYZw+KH0ep1U9uj+KlMGqWaqwAhViNoXO4Kfh8beQ=;
 b=gkD4/Zs/7DEC8pQdEE373jzdGFcxEtTUVOzkysr9tlMidRC6BAQBiF+Es/OjLkuirV
 s1LYgRa8hs/LOUcfuvAU18RtHE+qZVtRKViXwNx8xtupiYBxV13gDlggF3/fxLZ+wGxD
 de9U/eA9sRDROrnboBA5MxwpKzFSwrawp/qh23/RlYU9DjqRUjW7BQulqDV2Z+zbfpl4
 RfwZZK2tHuW5EWxUuJzYdIHmSHFRVucSjVd76DbNsjDlQgLkgH8qSV9fh/haOGUwspqU
 e2azU8pGN60AMHocC6+MjlZcAIvdiXH3gvtXJpRn3QFec3P7CpgNVytUn46MaJZVCCJZ
 z9IQ==
X-Gm-Message-State: APjAAAUmo9Yahaj1MlGqpGYGKd/LrSWHJ6qxydqnf2ILUjwMMakgzxbA
 znTsWketw3Sbkd5mpJlcBzX6zPw/TFI=
X-Google-Smtp-Source: APXvYqy+jk+BfnzTYGY88EaSeelKmL4/FugRI08hWufUcxI6WAllfyoDpbco0gKpGs4EEpE6pKrO7w==
X-Received: by 2002:ac8:38cc:: with SMTP id g12mr95183704qtc.68.1560802421456; 
 Mon, 17 Jun 2019 13:13:41 -0700 (PDT)
Received: from rosewood.cam.corp.google.com ([100.100.175.19])
 by smtp.gmail.com with ESMTPSA id r36sm7071563qte.71.2019.06.17.13.13.40
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 13:13:41 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH 11/13] drm/msm/dsi: Use the new setup_encoder function in
 attach_dsi_device
Date: Mon, 17 Jun 2019 16:12:56 -0400
Message-Id: <20190617201301.133275-8-sean@poorly.run>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
In-Reply-To: <20190617201301.133275-1-sean@poorly.run>
References: <20190617200405.131843-1-sean@poorly.run>
 <20190617201301.133275-1-sean@poorly.run>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q0IYZw+KH0ep1U9uj+KlMGqWaqwAhViNoXO4Kfh8beQ=;
 b=G4uJYUFMtcTefXKAlRErNW0ANUVg7YuNxp3waBaDItU+/XvEaV64v4+HFc2q+inCPu
 xE+BYJqIBaR8N6IPnstD/HwIDz3kEz+PGZOZUTK7NVsYpnv01Sdt8dxT/nFA/0w+tm80
 M3BB/yHh3FDEgkY9tBCoAsv0OGnJQ2F/vOLi/o3QNLIeVOHQmr0IULbOeswl7BYilBKP
 FeGeAdr2AJCJsFqIFX30M9KVLqIjBrlv7EGO+Yt6C0ACEdqKzaUlujqjqasfrJoFH5HD
 2w7yHGRDMNBK0Mhc6jQiSjwyZZ6+Qo10xAuHU0tj3V27OaLX5klFzpt5DYVFC8NVp+La
 Yqog==
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Sean Paul <seanpaul@chromium.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+CgpOb3cgdGhhdCB3ZSBoYXZl
IGEgZnVuY3Rpb24gdG8gY2FsbCBzZXRfZW5jb2Rlcl9tb2RlKCkgZm9yIHVzLCB1c2UgaXQuCgpT
aWduZWQtb2ZmLWJ5OiBTZWFuIFBhdWwgPHNlYW5wYXVsQGNocm9taXVtLm9yZz4KLS0tCiBkcml2
ZXJzL2dwdS9kcm0vbXNtL2RzaS9kc2kuaCAgICAgICAgIHwgIDIgKy0KIGRyaXZlcnMvZ3B1L2Ry
bS9tc20vZHNpL2RzaV9ob3N0LmMgICAgfCAgMiArLQogZHJpdmVycy9ncHUvZHJtL21zbS9kc2kv
ZHNpX21hbmFnZXIuYyB8IDE1ICsrLS0tLS0tLS0tLS0tLQogMyBmaWxlcyBjaGFuZ2VkLCA0IGlu
c2VydGlvbnMoKyksIDE1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9tc20vZHNpL2RzaS5oIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvZHNpLmgKaW5kZXggZTBi
YmU4MTI4YWVmLi5mOGE2MTE3MjVmMmUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20v
ZHNpL2RzaS5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZHNpL2RzaS5oCkBAIC05Niw3ICs5
Niw3IEBAIHN0cnVjdCBkcm1fY29ubmVjdG9yICptc21fZHNpX21hbmFnZXJfY29ubmVjdG9yX2lu
aXQodTggaWQpOwogc3RydWN0IGRybV9jb25uZWN0b3IgKm1zbV9kc2lfbWFuYWdlcl9leHRfYnJp
ZGdlX2luaXQodTggaWQpOwogaW50IG1zbV9kc2lfbWFuYWdlcl9jbWRfeGZlcihpbnQgaWQsIGNv
bnN0IHN0cnVjdCBtaXBpX2RzaV9tc2cgKm1zZyk7CiBib29sIG1zbV9kc2lfbWFuYWdlcl9jbWRf
eGZlcl90cmlnZ2VyKGludCBpZCwgdTMyIGRtYV9iYXNlLCB1MzIgbGVuKTsKLXZvaWQgbXNtX2Rz
aV9tYW5hZ2VyX2F0dGFjaF9kc2lfZGV2aWNlKGludCBpZCwgdTMyIGRldmljZV9mbGFncyk7Cit2
b2lkIG1zbV9kc2lfbWFuYWdlcl9hdHRhY2hfZHNpX2RldmljZShpbnQgaWQpOwogaW50IG1zbV9k
c2lfbWFuYWdlcl9yZWdpc3RlcihzdHJ1Y3QgbXNtX2RzaSAqbXNtX2RzaSk7CiB2b2lkIG1zbV9k
c2lfbWFuYWdlcl91bnJlZ2lzdGVyKHN0cnVjdCBtc21fZHNpICptc21fZHNpKTsKIGJvb2wgbXNt
X2RzaV9tYW5hZ2VyX3ZhbGlkYXRlX2N1cnJlbnRfY29uZmlnKHU4IGlkKTsKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9tc20vZHNpL2RzaV9ob3N0LmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNt
L2RzaS9kc2lfaG9zdC5jCmluZGV4IGRhYTA4YTAzM2I1OS4uZWZmZWEwZGI1NjI2IDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9kc2lfaG9zdC5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9tc20vZHNpL2RzaV9ob3N0LmMKQEAgLTE1OTgsNyArMTU5OCw3IEBAIHN0YXRpYyBpbnQg
ZHNpX2hvc3RfYXR0YWNoKHN0cnVjdCBtaXBpX2RzaV9ob3N0ICpob3N0LAogCW1zbV9ob3N0LT5m
b3JtYXQgPSBkc2ktPmZvcm1hdDsKIAltc21faG9zdC0+bW9kZV9mbGFncyA9IGRzaS0+bW9kZV9m
bGFnczsKIAotCW1zbV9kc2lfbWFuYWdlcl9hdHRhY2hfZHNpX2RldmljZShtc21faG9zdC0+aWQs
IGRzaS0+bW9kZV9mbGFncyk7CisJbXNtX2RzaV9tYW5hZ2VyX2F0dGFjaF9kc2lfZGV2aWNlKG1z
bV9ob3N0LT5pZCk7CiAKIAkvKiBTb21lIGdwaW9zIGRlZmluZWQgaW4gcGFuZWwgRFQgbmVlZCB0
byBiZSBjb250cm9sbGVkIGJ5IGhvc3QgKi8KIAlyZXQgPSBkc2lfaG9zdF9pbml0X3BhbmVsX2dw
aW9zKG1zbV9ob3N0LCAmZHNpLT5kZXYpOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21z
bS9kc2kvZHNpX21hbmFnZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZHNpL2RzaV9tYW5hZ2Vy
LmMKaW5kZXggMWVlMzE5N2E5YmRkLi42MDI5NTNiOTBjYWIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9tc20vZHNpL2RzaV9tYW5hZ2VyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9k
c2kvZHNpX21hbmFnZXIuYwpAQCAtNzg3LDE0ICs3ODcsMTAgQEAgYm9vbCBtc21fZHNpX21hbmFn
ZXJfY21kX3hmZXJfdHJpZ2dlcihpbnQgaWQsIHUzMiBkbWFfYmFzZSwgdTMyIGxlbikKIAlyZXR1
cm4gdHJ1ZTsKIH0KIAotdm9pZCBtc21fZHNpX21hbmFnZXJfYXR0YWNoX2RzaV9kZXZpY2UoaW50
IGlkLCB1MzIgZGV2aWNlX2ZsYWdzKQordm9pZCBtc21fZHNpX21hbmFnZXJfYXR0YWNoX2RzaV9k
ZXZpY2UoaW50IGlkKQogewogCXN0cnVjdCBtc21fZHNpICptc21fZHNpID0gZHNpX21ncl9nZXRf
ZHNpKGlkKTsKIAlzdHJ1Y3QgZHJtX2RldmljZSAqZGV2ID0gbXNtX2RzaS0+ZGV2OwotCXN0cnVj
dCBtc21fZHJtX3ByaXZhdGUgKnByaXY7Ci0Jc3RydWN0IG1zbV9rbXMgKmttczsKLQlzdHJ1Y3Qg
ZHJtX2VuY29kZXIgKmVuY29kZXI7Ci0JYm9vbCBjbWRfbW9kZTsKIAogCS8qCiAJICogZHJtX2Rl
dmljZSBwb2ludGVyIGlzIGFzc2lnbmVkIHRvIG1zbV9kc2kgb25seSBpbiB0aGUgbW9kZXNldF9p
bml0CkBAIC04MDYsMTQgKzgwMiw3IEBAIHZvaWQgbXNtX2RzaV9tYW5hZ2VyX2F0dGFjaF9kc2lf
ZGV2aWNlKGludCBpZCwgdTMyIGRldmljZV9mbGFncykKIAlpZiAoIWRldikKIAkJcmV0dXJuOwog
Ci0JcHJpdiA9IGRldi0+ZGV2X3ByaXZhdGU7Ci0Ja21zID0gcHJpdi0+a21zOwotCWVuY29kZXIg
PSBtc21fZHNpX2dldF9lbmNvZGVyKG1zbV9kc2kpOwotCWNtZF9tb2RlID0gIShkZXZpY2VfZmxh
Z3MgJgotCQkJCSBNSVBJX0RTSV9NT0RFX1ZJREVPKTsKLQotCWlmIChlbmNvZGVyICYmIGttcy0+
ZnVuY3MtPnNldF9lbmNvZGVyX21vZGUpCi0JCWttcy0+ZnVuY3MtPnNldF9lbmNvZGVyX21vZGUo
a21zLCBlbmNvZGVyLCBjbWRfbW9kZSk7CisJbXNtX2RzaV9tYW5hZ2VyX3NldHVwX2VuY29kZXIo
aWQpOwogfQogCiBpbnQgbXNtX2RzaV9tYW5hZ2VyX3JlZ2lzdGVyKHN0cnVjdCBtc21fZHNpICpt
c21fZHNpKQotLSAKU2VhbiBQYXVsLCBTb2Z0d2FyZSBFbmdpbmVlciwgR29vZ2xlIC8gQ2hyb21p
dW0gT1MKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
