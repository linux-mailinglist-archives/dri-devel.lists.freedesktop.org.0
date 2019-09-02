Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99703A54E3
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 13:31:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7C5289A56;
	Mon,  2 Sep 2019 11:31:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD9D789A61
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2019 11:31:38 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id l11so4834072wrx.5
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2019 04:31:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Pade97gqRD3FO0Cn8/jU5vMKVUfbLZBxbADpt0tfjfI=;
 b=FEoSUmp75Kq9q3pMHwRYZ2/bP3HTLTRu5BOEnsUytOd/c3ks/nRwGtjLz4Go9Rr8kb
 COvomnDiWQKH7AwXNLEk8mZL+v8utTaS9sYz3H5xNBI3SHn+ba1CnsqBUuqBaX0ZikyY
 bCIohv9RMKNIuWUVf3kyk+AD8PvIPjWeW1TZrNVcUcJEGH8U4tr4vSxC7ueZC83oUPvd
 zcuHVHE0v+w6KiJKNemOYePJyzcRaMgxy5p1/1nX6HFpOBpNfM/F9VM1e0lS9TDYbZfz
 D82YXTwqfSPtfemwV/XhELAGK69NCkODTQAhJyVlpMNJBmqfxixZr8ShzpbsKRtbtxKv
 ZbeQ==
X-Gm-Message-State: APjAAAUTad8sLZW27xT82ImpAfarK9FbuwXMPGtViPVub1ZyAzGXjsuR
 Ox0ECobUntzaA35emzx7uzS5Xaa0
X-Google-Smtp-Source: APXvYqwGfSGVeCscI5y2LJXI7k4tX/GQLDb95sFSej1HKPmlaq2wmsyjP1QUbginGL87HMSspl/5kA==
X-Received: by 2002:adf:de8a:: with SMTP id w10mr24070352wrl.276.1567423896581; 
 Mon, 02 Sep 2019 04:31:36 -0700 (PDT)
Received: from localhost (pD9E51890.dip0.t-ipconnect.de. [217.229.24.144])
 by smtp.gmail.com with ESMTPSA id k9sm22279805wrd.7.2019.09.02.04.31.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2019 04:31:35 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 06/21] drm/dp: Probe link using existing parsing helpers
Date: Mon,  2 Sep 2019 13:31:06 +0200
Message-Id: <20190902113121.31323-7-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190902113121.31323-1-thierry.reding@gmail.com>
References: <20190902113121.31323-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Pade97gqRD3FO0Cn8/jU5vMKVUfbLZBxbADpt0tfjfI=;
 b=I2TOZ2344suLg93q+Cd2eUj3QKUEk2wk7qno9wyQGoQ0pcQciE9TWvsv/R1enXwuaj
 Z/P2IGQfo6b/BsoaImzCkjIPR9u+vDIJTNgIPND73dRfzOi169aGGbDj0tmJsLi2urjU
 9Dn6T+B3s3Zf+UvHen6lI0y7euzufhZSodJhwfXnwkUY7q2zL/EKnusWeISijknit2GI
 Y9jevzsuHHN0B3iOGhKeIaKQU1qkGiu3azV5S1KGw7N6Q8a8rkML619yTXeDVKl3wzPp
 uVQJGL+nB8a8ivVNH2pncp6Dg+WSmEDhMZCcsM0lMd19QDyCAAu+4+2DhQPTc1qav31g
 jkig==
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

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KClVzZSBleGlzdGluZyBw
YXJzaW5nIGhlbHBlcnMgdG8gcHJvYmUgYSBEaXNwbGF5UG9ydCBsaW5rLgoKUmV2aWV3ZWQtYnk6
IFBoaWxpcHAgWmFiZWwgPHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+ClNpZ25lZC1vZmYtYnk6IFRo
aWVycnkgUmVkaW5nIDx0cmVkaW5nQG52aWRpYS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2Ry
bV9kcF9oZWxwZXIuYyB8IDI5ICsrKysrKysrKysrKysrKysrKysrKystLS0tLS0tCiBpbmNsdWRl
L2RybS9kcm1fZHBfaGVscGVyLmggICAgIHwgIDIgKysKIDIgZmlsZXMgY2hhbmdlZCwgMjQgaW5z
ZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2RwX2hlbHBlci5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9oZWxwZXIuYwppbmRleCBi
ZGY5OTliYjZjZmEuLmNkZjQ5ZThkNWUzYSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ry
bV9kcF9oZWxwZXIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2hlbHBlci5jCkBAIC0z
MjAsNiArMzIwLDIyIEBAIHNzaXplX3QgZHJtX2RwX2RwY2Rfd3JpdGUoc3RydWN0IGRybV9kcF9h
dXggKmF1eCwgdW5zaWduZWQgaW50IG9mZnNldCwKIH0KIEVYUE9SVF9TWU1CT0woZHJtX2RwX2Rw
Y2Rfd3JpdGUpOwogCisvKioKKyAqIGRybV9kcF9kcGNkX3JlYWRfbGlua19jYXBzKCkgLSByZWFk
IERQQ0QgbGluayBjYXBhYmlsaXRpZXMKKyAqIEBhdXg6IERpc3BsYXlQb3J0IEFVWCBjaGFubmVs
CisgKiBAY2FwczogYnVmZmVyIHRvIHN0b3JlIHRoZSBsaW5rIGNhcGFiaWxpdGllcyBpbgorICoK
KyAqIFJldHVybnM6CisgKiBUaGUgbnVtYmVyIG9mIGJ5dGVzIHRyYW5zZmVycmVkIG9uIHN1Y2Nl
c3Mgb3IgYSBuZWdhdGl2ZSBlcnJvciBjb2RlIG9uCisgKiBmYWlsdXJlLgorICovCitpbnQgZHJt
X2RwX2RwY2RfcmVhZF9saW5rX2NhcHMoc3RydWN0IGRybV9kcF9hdXggKmF1eCwKKwkJCSAgICAg
ICB1OCBjYXBzW0RQX1JFQ0VJVkVSX0NBUF9TSVpFXSkKK3sKKwlyZXR1cm4gZHJtX2RwX2RwY2Rf
cmVhZChhdXgsIERQX0RQQ0RfUkVWLCBjYXBzLCBEUF9SRUNFSVZFUl9DQVBfU0laRSk7Cit9CitF
WFBPUlRfU1lNQk9MKGRybV9kcF9kcGNkX3JlYWRfbGlua19jYXBzKTsKKwogLyoqCiAgKiBkcm1f
ZHBfZHBjZF9yZWFkX2xpbmtfc3RhdHVzKCkgLSByZWFkIERQQ0QgbGluayBzdGF0dXMgKGJ5dGVz
IDB4MjAyLTB4MjA3KQogICogQGF1eDogRGlzcGxheVBvcnQgQVVYIGNoYW5uZWwKQEAgLTM3Niwy
MSArMzkyLDIwIEBAIHN0YXRpYyB2b2lkIGRybV9kcF9saW5rX3Jlc2V0KHN0cnVjdCBkcm1fZHBf
bGluayAqbGluaykKICAqLwogaW50IGRybV9kcF9saW5rX3Byb2JlKHN0cnVjdCBkcm1fZHBfYXV4
ICphdXgsIHN0cnVjdCBkcm1fZHBfbGluayAqbGluaykKIHsKLQl1OCB2YWx1ZXNbM107CisJdTgg
dmFsdWVzW0RQX1JFQ0VJVkVSX0NBUF9TSVpFXTsKIAlpbnQgZXJyOwogCiAJZHJtX2RwX2xpbmtf
cmVzZXQobGluayk7CiAKLQllcnIgPSBkcm1fZHBfZHBjZF9yZWFkKGF1eCwgRFBfRFBDRF9SRVYs
IHZhbHVlcywgc2l6ZW9mKHZhbHVlcykpOworCWVyciA9IGRybV9kcF9kcGNkX3JlYWRfbGlua19j
YXBzKGF1eCwgdmFsdWVzKTsKIAlpZiAoZXJyIDwgMCkKIAkJcmV0dXJuIGVycjsKIAotCWxpbmst
PnJldmlzaW9uID0gdmFsdWVzWzBdOwotCWxpbmstPm1heF9yYXRlID0gZHJtX2RwX2J3X2NvZGVf
dG9fbGlua19yYXRlKHZhbHVlc1sxXSk7Ci0JbGluay0+bWF4X2xhbmVzID0gdmFsdWVzWzJdICYg
RFBfTUFYX0xBTkVfQ09VTlRfTUFTSzsKKwlsaW5rLT5yZXZpc2lvbiA9IHZhbHVlc1tEUF9EUENE
X1JFVl07CisJbGluay0+bWF4X3JhdGUgPSBkcm1fZHBfbWF4X2xpbmtfcmF0ZSh2YWx1ZXMpOwor
CWxpbmstPm1heF9sYW5lcyA9IGRybV9kcF9tYXhfbGFuZV9jb3VudCh2YWx1ZXMpOwogCi0JaWYg
KHZhbHVlc1syXSAmIERQX0VOSEFOQ0VEX0ZSQU1FX0NBUCkKLQkJbGluay0+Y2Fwcy5lbmhhbmNl
ZF9mcmFtaW5nID0gdHJ1ZTsKKwlsaW5rLT5jYXBzLmVuaGFuY2VkX2ZyYW1pbmcgPSBkcm1fZHBf
ZW5oYW5jZWRfZnJhbWVfY2FwKHZhbHVlcyk7CiAKIAlsaW5rLT5yYXRlID0gbGluay0+bWF4X3Jh
dGU7CiAJbGluay0+bGFuZXMgPSBsaW5rLT5tYXhfbGFuZXM7CmRpZmYgLS1naXQgYS9pbmNsdWRl
L2RybS9kcm1fZHBfaGVscGVyLmggYi9pbmNsdWRlL2RybS9kcm1fZHBfaGVscGVyLmgKaW5kZXgg
Mjc1OWY4ZDdlOTBkLi42MGJiMDMwYzg1OGQgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZHJtL2RybV9k
cF9oZWxwZXIuaAorKysgYi9pbmNsdWRlL2RybS9kcm1fZHBfaGVscGVyLmgKQEAgLTEzNTAsNiAr
MTM1MCw4IEBAIHN0YXRpYyBpbmxpbmUgc3NpemVfdCBkcm1fZHBfZHBjZF93cml0ZWIoc3RydWN0
IGRybV9kcF9hdXggKmF1eCwKIAlyZXR1cm4gZHJtX2RwX2RwY2Rfd3JpdGUoYXV4LCBvZmZzZXQs
ICZ2YWx1ZSwgMSk7CiB9CiAKK2ludCBkcm1fZHBfZHBjZF9yZWFkX2xpbmtfY2FwcyhzdHJ1Y3Qg
ZHJtX2RwX2F1eCAqYXV4LAorCQkJICAgICAgIHU4IGNhcHNbRFBfUkVDRUlWRVJfQ0FQX1NJWkVd
KTsKIGludCBkcm1fZHBfZHBjZF9yZWFkX2xpbmtfc3RhdHVzKHN0cnVjdCBkcm1fZHBfYXV4ICph
dXgsCiAJCQkJIHU4IHN0YXR1c1tEUF9MSU5LX1NUQVRVU19TSVpFXSk7CiAKLS0gCjIuMjIuMAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
