Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C26DD19BC73
	for <lists+dri-devel@lfdr.de>; Thu,  2 Apr 2020 09:18:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E8FE6E9ED;
	Thu,  2 Apr 2020 07:18:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 423C86E983
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Apr 2020 18:39:04 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id m17so1237258wrw.11
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Apr 2020 11:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E6FdkeT6psAvLz0dLRleM1SQvL2LWVWL2O13Tg5RW/Y=;
 b=Xzod1j4AELLAoEMpn5spG5cuTc/MeWiUtUmkFA81mBjIROd1KoGaa2EoRC8DCNGcdF
 Ic+xKaJsKqnJRdR6Ml7Xxlix8KybwhewXZhpDPZvllZad4WlWrhN3O/slyYY2o3cKPvT
 S7wLAH7v8CHlEoCfWB/XorWZ+pMXCa1Nhi1+axbSKGOZ5Wu0pgfYHSz6XL1jkXnzoWNq
 34cilCWMAgKXZU5AIUlq6QC8thW/1iBMAK5kVdccZqLDG1tS0XFP85HzAfo1hc9KLLTP
 yn4MFOrGt+/AaucOH+wd8Ss0ElF5Yfq1MVzhx5fyEJ+Tsf7KhPWe8P2ERHbWJZHEDGxL
 Teuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E6FdkeT6psAvLz0dLRleM1SQvL2LWVWL2O13Tg5RW/Y=;
 b=OSkRRKPh3tMazq05wYwILEfsPpZk3g+Pmn674CzJt/t/YnEvsaibwjjU9lh3CiEqG/
 0tDIZvyLaNwIJ9iy9OjbueT5f6yRreNTNArwJ/T7hZPw+sSGnxkAw6m0FidvrJBWV8H4
 2rNeN++WXjs53mam6cUQUS1TkplGfY+9vEeKno1YIHs7gszDVwYLqrL6n56eHyI72V2Y
 kQKBb5azmZt2dHlVRrB5Y1jN3z0OhhT3GaTZB01Cw8HrFm8phcSc74pEzpS1riWY5gGz
 D935VR4zk79D2uMsi3/pfHIV4oJTCH3o79sQXRux5ENsUaRo1zjDb6ztNNUOFtwuLGOJ
 w/GQ==
X-Gm-Message-State: ANhLgQ2Fz1+2QINoxgF/xWQC7dW2g7YP1IRqMvFdXcvOekHfQwQ7g+xS
 bQqpjBzpPDnG3A7ged9LFAiur5W4QSI=
X-Google-Smtp-Source: ADFU+vvjjsPh0WppxjmVfJ6secyRte6nRoF1oCaZrLW00RAVVixactCNodpy3JMkbNIQoGq6T5vwNA==
X-Received: by 2002:a5d:5106:: with SMTP id s6mr26846554wrt.24.1585766342530; 
 Wed, 01 Apr 2020 11:39:02 -0700 (PDT)
Received: from brihaspati.fritz.box (p5DE52E4E.dip0.t-ipconnect.de.
 [93.229.46.78])
 by smtp.gmail.com with ESMTPSA id b11sm3976973wrq.26.2020.04.01.11.39.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Apr 2020 11:39:02 -0700 (PDT)
From: Nirmoy Das <nirmoy.aiemd@gmail.com>
X-Google-Original-From: Nirmoy Das <nirmoy.das@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 8/8] drm/ttm: do not keep GPU dependent addresses
Date: Wed,  1 Apr 2020 20:42:47 +0200
Message-Id: <20200401184247.16643-9-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200401184247.16643-1-nirmoy.das@amd.com>
References: <20200401184247.16643-1-nirmoy.das@amd.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 02 Apr 2020 07:17:56 +0000
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
Cc: thellstrom@vmware.com, airlied@linux.ie, kenny.ho@amd.com,
 brian.welty@intel.com, nirmoy.das@amd.com,
 linux-graphics-maintainer@vmware.com, bskeggs@redhat.com,
 alexander.deucher@amd.com, sean@poorly.run, christian.koenig@amd.com,
 kraxel@redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

R1BVIGFkZHJlc3MgaGFuZGxpbmcgaXMgZGV2aWNlIHNwZWNpZmljIGFuZCBzaG91bGQgYmUgaGFu
ZGxlIGJ5IGl0cyBkZXZpY2UKZHJpdmVyLgoKU2lnbmVkLW9mZi1ieTogTmlybW95IERhcyA8bmly
bW95LmRhc0BhbWQuY29tPgpSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFu
LmtvZW5pZ0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMgICAgfCA3
IC0tLS0tLS0KIGluY2x1ZGUvZHJtL3R0bS90dG1fYm9fYXBpLmggICAgfCAyIC0tCiBpbmNsdWRl
L2RybS90dG0vdHRtX2JvX2RyaXZlci5oIHwgMSAtCiAzIGZpbGVzIGNoYW5nZWQsIDEwIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMgYi9kcml2
ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCmluZGV4IGY3M2I4MWMyNTc2ZS4uZjc4Y2ZjNzZhZDc4
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS90dG0vdHRtX2JvLmMKQEAgLTg1LDcgKzg1LDYgQEAgc3RhdGljIHZvaWQgdHRtX21l
bV90eXBlX2RlYnVnKHN0cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2LCBzdHJ1Y3QgZHJtX3ByaW50
ZXIgKnAKIAlkcm1fcHJpbnRmKHAsICIgICAgaGFzX3R5cGU6ICVkXG4iLCBtYW4tPmhhc190eXBl
KTsKIAlkcm1fcHJpbnRmKHAsICIgICAgdXNlX3R5cGU6ICVkXG4iLCBtYW4tPnVzZV90eXBlKTsK
IAlkcm1fcHJpbnRmKHAsICIgICAgZmxhZ3M6IDB4JTA4WFxuIiwgbWFuLT5mbGFncyk7Ci0JZHJt
X3ByaW50ZihwLCAiICAgIGdwdV9vZmZzZXQ6IDB4JTA4bGxYXG4iLCBtYW4tPmdwdV9vZmZzZXQp
OwogCWRybV9wcmludGYocCwgIiAgICBzaXplOiAlbGx1XG4iLCBtYW4tPnNpemUpOwogCWRybV9w
cmludGYocCwgIiAgICBhdmFpbGFibGVfY2FjaGluZzogMHglMDhYXG4iLCBtYW4tPmF2YWlsYWJs
ZV9jYWNoaW5nKTsKIAlkcm1fcHJpbnRmKHAsICIgICAgZGVmYXVsdF9jYWNoaW5nOiAweCUwOFhc
biIsIG1hbi0+ZGVmYXVsdF9jYWNoaW5nKTsKQEAgLTM0MywxMiArMzQyLDYgQEAgc3RhdGljIGlu
dCB0dG1fYm9faGFuZGxlX21vdmVfbWVtKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sCiBt
b3ZlZDoKIAliby0+ZXZpY3RlZCA9IGZhbHNlOwogCi0JaWYgKGJvLT5tZW0ubW1fbm9kZSkKLQkJ
Ym8tPm9mZnNldCA9IChiby0+bWVtLnN0YXJ0IDw8IFBBR0VfU0hJRlQpICsKLQkJICAgIGJkZXYt
Pm1hbltiby0+bWVtLm1lbV90eXBlXS5ncHVfb2Zmc2V0OwotCWVsc2UKLQkJYm8tPm9mZnNldCA9
IDA7Ci0KIAljdHgtPmJ5dGVzX21vdmVkICs9IGJvLT5udW1fcGFnZXMgPDwgUEFHRV9TSElGVDsK
IAlyZXR1cm4gMDsKIApkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19hcGkuaCBi
L2luY2x1ZGUvZHJtL3R0bS90dG1fYm9fYXBpLmgKaW5kZXggYjliYzFiMDAxNDJlLi5kNmYzOWVl
NWJmNWQgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZHJtL3R0bS90dG1fYm9fYXBpLmgKKysrIGIvaW5j
bHVkZS9kcm0vdHRtL3R0bV9ib19hcGkuaApAQCAtMjEzLDggKzIxMyw2IEBAIHN0cnVjdCB0dG1f
YnVmZmVyX29iamVjdCB7CiAJICogZWl0aGVyIG9mIHRoZXNlIGxvY2tzIGhlbGQuCiAJICovCiAK
LQl1aW50NjRfdCBvZmZzZXQ7IC8qIEdQVSBhZGRyZXNzIHNwYWNlIGlzIGluZGVwZW5kZW50IG9m
IENQVSB3b3JkIHNpemUgKi8KLQogCXN0cnVjdCBzZ190YWJsZSAqc2c7CiB9OwogCmRpZmYgLS1n
aXQgYS9pbmNsdWRlL2RybS90dG0vdHRtX2JvX2RyaXZlci5oIGIvaW5jbHVkZS9kcm0vdHRtL3R0
bV9ib19kcml2ZXIuaAppbmRleCBjOWUwZmQwOWY0YjIuLmM4Y2U2YzE4MWFiZSAxMDA2NDQKLS0t
IGEvaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19kcml2ZXIuaAorKysgYi9pbmNsdWRlL2RybS90dG0v
dHRtX2JvX2RyaXZlci5oCkBAIC0xNzcsNyArMTc3LDYgQEAgc3RydWN0IHR0bV9tZW1fdHlwZV9t
YW5hZ2VyIHsKIAlib29sIGhhc190eXBlOwogCWJvb2wgdXNlX3R5cGU7CiAJdWludDMyX3QgZmxh
Z3M7Ci0JdWludDY0X3QgZ3B1X29mZnNldDsgLyogR1BVIGFkZHJlc3Mgc3BhY2UgaXMgaW5kZXBl
bmRlbnQgb2YgQ1BVIHdvcmQgc2l6ZSAqLwogCXVpbnQ2NF90IHNpemU7CiAJdWludDMyX3QgYXZh
aWxhYmxlX2NhY2hpbmc7CiAJdWludDMyX3QgZGVmYXVsdF9jYWNoaW5nOwotLSAKMi4yNS4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
