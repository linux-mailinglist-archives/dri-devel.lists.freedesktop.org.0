Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D85D7FF16
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 19:02:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B6EF6EEF5;
	Fri,  2 Aug 2019 17:01:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BE626EEF2
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2019 17:01:58 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id n4so77976562wrs.3
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Aug 2019 10:01:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HMOp/sUEkCBx7pv/B4UxPv0plz7e7QgzlffeZ0R+R1k=;
 b=bCNEluPStFhYgQo29sQoQXqX87ugcnvggDJWvl9BvIg/l9VcAtPad/viAzPDVhpDob
 36yJhc1Wzfy9WZVHoi4pSDTvU/a4CUPkV95Tn9quyj0HF2JlNfwRU3k6QzoJWMUAdQCP
 LyTMC7D0uTK3EOBLW4bQX/03ijyblcaoYgWKERpFHRnR4IAVQ7a8P0o7vVb+Wbh4m4Qm
 Dp8ZqWa5RR0G8+mmQy/bddHdwMd+omAoArYCJ6LsX3LORw2wFnW+hI2Iqo1S7OsAfsT3
 CSDa+T6eH3flK5J2hBISidBRvMDV0vnnPRXxt8LfhSohPoW+NoCATfC8/VHeV0aKIaH0
 dktw==
X-Gm-Message-State: APjAAAWop0eI80pOywHUZ+f+rurdA1a1uAaa90znn1D+1MKdmyMhy2yV
 7W4ilLyy8GsqGpZIcLo3vp0s8prW
X-Google-Smtp-Source: APXvYqytG4ZdVQDn1mEMdRgNR1MAT6q4S2cjZCz/FTkj4SZiNQ5YE5mCz9advs+lWvMWQQo7lZ6HwA==
X-Received: by 2002:a5d:4085:: with SMTP id o5mr145890720wrp.101.1564765316851; 
 Fri, 02 Aug 2019 10:01:56 -0700 (PDT)
Received: from arch-x1c3.cbg.collabora.co.uk
 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id f12sm82823008wrg.5.2019.08.02.10.01.55
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 02 Aug 2019 10:01:56 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/2] drm/vmwgfx: add local DRM_AUTH check for PRIME TO/FROM
 HANDLE
Date: Fri,  2 Aug 2019 18:01:16 +0100
Message-Id: <20190802170117.10942-1-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HMOp/sUEkCBx7pv/B4UxPv0plz7e7QgzlffeZ0R+R1k=;
 b=p5o59K82Ulnu491CNJoIwAh+QOBR9XFEh9JA38qLRzG7CgkTwlq7W1ABoFd3qYvZ+o
 PAeNUzC91lBR61dVoivY58oMP6cPDFyhnRI0aECR06lJ1tGdjVZiQ5Qm2hRxku0Pkamn
 0yTnPi2r/mXqB5r3xiKi5f92lxJhEP0oVJIU1SeDqtK0X/WCFOElW9xxLF+5eJpa62p2
 WTrrz1gsqJotfFkg6UzAZAk1VjkOxjoSJzM6ucfcF24nfXFGk2JYhzUtw5z0hYXhw1Q9
 sHQ9eYzS4YMGr2LUzi25R3ac5HD4Obvz4y+x9EdDyS5EPKVCKfM6qpakcKy08+UD+dyI
 rt/w==
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
Cc: VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 Deepak Singh Rawat <drawat@vmware.com>, emil.l.velikov@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3JhLmNvbT4KClJlYWxpc3Rp
Y2FsbHkgbm8gZHJpdmVycywgYnV0IHZtd2dmeCBjYXJlIGFib3V0IHRoZSBEUk1fQVVUSCBmbGFn
IGhlcmUuCgpGb2xsb3ctdXAgd29yayBpbiB0aGlzIGRyaXZlciB3aWxsIHByb3Blcmx5IGlzb2xh
dGUgcHJpbWFyeSBjbGllbnRzIGZyb20KZGlmZmVyZW50IG1hc3RlciByZWFsbXMsIHRodXMgd2Un
bGwgbm8gbG9uZ2VyIG5lZWQgdG8gcGFyc2UgX2FueV8gaW9jdGwKZmxhZ3MuCgpVbnRpbCB0aGF0
IHdvcmsgbGFuZHMsIGFkZCBhIGxvY2FsIHdvcmthcm91bmQuCgp2MjogVXNlIGJpdHdpc2Ugb3Ig
KERlZXBhaykKCkNjOiBWTXdhcmUgR3JhcGhpY3MgPGxpbnV4LWdyYXBoaWNzLW1haW50YWluZXJA
dm13YXJlLmNvbT4KQ2M6IFRob21hcyBIZWxsc3Ryb20gPHRoZWxsc3Ryb21Adm13YXJlLmNvbT4K
Q2M6IERlZXBhayBTaW5naCBSYXdhdCA8ZHJhd2F0QHZtd2FyZS5jb20+ClNpZ25lZC1vZmYtYnk6
IEVtaWwgVmVsaWtvdiA8ZW1pbC52ZWxpa292QGNvbGxhYm9yYS5jb20+Ci0tLQpJJ2QgbGlrZSB0
byBtZXJnZSB0aGlzIGFuZCB0aGUgbmV4dCBwYXRjaCBocm91Z2ggdGhlIGRybS1taXNjIHRyZWUu
IEFjawphbmQgcmIgYXJlIGFwcHJlY2lhdGVkLgoKVGhhbmtzCkVtaWwKLS0tCiBkcml2ZXJzL2dw
dS9kcm0vdm13Z2Z4L3Ztd2dmeF9kcnYuYyB8IDkgKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwg
OSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdn
ZnhfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9kcnYuYwppbmRleCBjZDBk
NDlkOGE4ZGEuLjUzYWZiMWQ1OTdlOCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Ztd2dm
eC92bXdnZnhfZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmMK
QEAgLTExMzQsNiArMTEzNCwxNSBAQCBzdGF0aWMgbG9uZyB2bXdfZ2VuZXJpY19pb2N0bChzdHJ1
Y3QgZmlsZSAqZmlscCwgdW5zaWduZWQgaW50IGNtZCwKIAl9IGVsc2UgaWYgKCFkcm1faW9jdGxf
ZmxhZ3MobnIsICZmbGFncykpCiAJCXJldHVybiAtRUlOVkFMOwogCisJLyoKKwkgKiBMaXR0bGUg
d29ya2Fyb3VuZCB1bnRpbCB0aGUgdm13Z2Z4IHBhdGNoZXMgcHJvdmlkaW5nIGlzb2xhdGlvbiBv
ZgorCSAqIHByaW1hcnkgY2xpZW50cyBmcm9tIGRpZmZlcmVudCBtYXN0ZXIgcmVhbG1zIGxhbmQu
CisJICogV2l0aCB0aGF0IHdvcmssIHdlJ2xsIG5vIGxvbmdlciBuZWVkIHRvIHBhcnNlIF9hbnlf
IGlvY3RsIGZsYWdzLgorCSAqLworCWlmIChuciA9PSAweDJkIC8qIERSTV9JT0NUTF9QUklNRV9I
QU5ETEVfVE9fRkQgKi8gfHwKKwkgICAgbnIgPT0gMHgyZSAvKiBEUk1fSU9DVExfUFJJTUVfRkRf
VE9fSEFORExFICovKQorCQlmbGFncyB8PSBEUk1fQVVUSDsKKwogCXZtYXN0ZXIgPSB2bXdfbWFz
dGVyX2NoZWNrKGRldiwgZmlsZV9wcml2LCBmbGFncyk7CiAJaWYgKElTX0VSUih2bWFzdGVyKSkg
ewogCQlyZXQgPSBQVFJfRVJSKHZtYXN0ZXIpOwotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
