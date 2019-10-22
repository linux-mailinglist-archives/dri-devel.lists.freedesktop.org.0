Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF0AE0804
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2019 17:55:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C3826E85D;
	Tue, 22 Oct 2019 15:55:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 672606E85D
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 15:55:43 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id 3so16687326wmi.3
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 08:55:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YS0GekJ72h4QWTJCzBYGtGOwzBVrDEe0pE3cwjzRtLM=;
 b=F6MTsSCEyNhUPnw6XWzX3j7Ezrxws2zL/aNIaiVmIDl1wag+9sf7BbkbTFtkYLtZxl
 p+8+ZajhpkQzT5bgTduWk7XWyweyRDk0/g+xEJZksANcvr6gwVSEGHhzdU9XwVaEoyiG
 mA/nAAbz+rO/NXFaHCrawhAjlpeMEf0TKRukB87gXhgMB2WIBjWgwO6faudSYW4cVFbC
 7+9bcnqhpt6cQzFd89NtEiqSaWy0OAYBIWfgJEla/0eRDuMkBFLjRYjObq9WcqnK7/gR
 8qp9VhupVt3CgTzuAKE404EyfM3Rt8Vtvd8zhO2l/MMygD0Lrar56x5wtzc0Fn3v533S
 fEsA==
X-Gm-Message-State: APjAAAXAI1Iic79e40oEmzcxnZwbYiCt/HMxfNFibgsmoTzUOKHB0AHf
 HB8ofPN4b9AX9lGZV+/xvLOD0PYIiUs=
X-Google-Smtp-Source: APXvYqyTDiEsG9b+uQLErcNY8uGBbnTs51bzge5ZAUJaOCN+Pqc8+e3xas6iNUQPR5aCgqkildOnRQ==
X-Received: by 2002:a1c:9ecf:: with SMTP id h198mr3587410wme.45.1571759741585; 
 Tue, 22 Oct 2019 08:55:41 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id c21sm16465839wmb.46.2019.10.22.08.55.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Oct 2019 08:55:40 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/simple-kms: Standardize arguments for callbacks
Date: Tue, 22 Oct 2019 17:55:36 +0200
Message-Id: <20191022155536.27939-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YS0GekJ72h4QWTJCzBYGtGOwzBVrDEe0pE3cwjzRtLM=;
 b=hHiUBuT9zDldmDUt90WJdRY6jxBsQqR47iezq2iMyWbumsA9zz25UPuarmQn834ngZ
 W33J+1Lp8hGIICPz7h/ii8Zw1+3ZrsGL1kRmIy8Oj5ZkbAaMEIqSDXkgRPCwygWLEhnd
 cUp9epeM63QOlBS06tiFyKFVJkISUd+qtW/Ug=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 virtualization@lists.linux-foundation.org, Gerd Hoffmann <kraxel@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UGFzc2luZyB0aGUgd3JvbmcgdHlwZSBmZWVscyBpY2t5LCBldmVyeXdoZXJlIGVsc2Ugd2UgdXNl
IHRoZSBwaXBlIGFzCnRoZSBmaXJzdCBwYXJhbWV0ZXIuIFNwb3R0ZWQgd2hpbGUgZGlzY3Vzc2lu
ZyBwYXRjaGVzIHdpdGggVGhvbWFzClppbW1lcm1hbm4uCgpDYzogVGhvbWFzIFppbW1lcm1hbm4g
PHR6aW1tZXJtYW5uQHN1c2UuZGU+CkNjOiBOb3JhbGYgVHLDuG5uZXMgPG5vcmFsZkB0cm9ubmVz
Lm9yZz4KQ2M6IEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPgpDYzogRXJpYyBBbmhv
bHQgPGVyaWNAYW5ob2x0Lm5ldD4KQ2M6IEVtaWwgVmVsaWtvdiA8ZW1pbC52ZWxpa292QGNvbGxh
Ym9yYS5jb20+CkNjOiB2aXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpD
YzogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgpTaWduZWQtb2ZmLWJ5
OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vY2lycnVzL2NpcnJ1cy5jICAgICAgICAgfCAyICstCiBkcml2ZXJzL2dwdS9kcm0vZHJt
X3NpbXBsZV9rbXNfaGVscGVyLmMgfCAyICstCiBkcml2ZXJzL2dwdS9kcm0vcGwxMTEvcGwxMTFf
ZGlzcGxheS5jICAgfCA0ICsrLS0KIGluY2x1ZGUvZHJtL2RybV9zaW1wbGVfa21zX2hlbHBlci5o
ICAgICB8IDIgKy0KIDQgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9jaXJydXMvY2lycnVzLmMgYi9kcml2
ZXJzL2dwdS9kcm0vY2lycnVzL2NpcnJ1cy5jCmluZGV4IDdkMDhkMDY3ZTFhNC4uMjQ4YzlmNzY1
YzQ1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vY2lycnVzL2NpcnJ1cy5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9jaXJydXMvY2lycnVzLmMKQEAgLTM5MCw3ICszOTAsNyBAQCBzdGF0aWMg
aW50IGNpcnJ1c19jb25uX2luaXQoc3RydWN0IGNpcnJ1c19kZXZpY2UgKmNpcnJ1cykKIC8qIC0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLSAqLwogLyogY2lycnVzIChzaW1wbGUpIGRpc3BsYXkgcGlwZQkJCQkJICAgICAgKi8K
IAotc3RhdGljIGVudW0gZHJtX21vZGVfc3RhdHVzIGNpcnJ1c19waXBlX21vZGVfdmFsaWQoc3Ry
dWN0IGRybV9jcnRjICpjcnRjLAorc3RhdGljIGVudW0gZHJtX21vZGVfc3RhdHVzIGNpcnJ1c19w
aXBlX21vZGVfdmFsaWQoc3RydWN0IGRybV9zaW1wbGVfZGlzcGxheV9waXBlICpwaXBlLAogCQkJ
CQkJICAgY29uc3Qgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKm1vZGUpCiB7CiAJaWYgKGNpcnJ1
c19jaGVja19zaXplKG1vZGUtPmhkaXNwbGF5LCBtb2RlLT52ZGlzcGxheSwgTlVMTCkgPCAwKQpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9zaW1wbGVfa21zX2hlbHBlci5jIGIvZHJp
dmVycy9ncHUvZHJtL2RybV9zaW1wbGVfa21zX2hlbHBlci5jCmluZGV4IDA0NjA1NTcxOTI0NS4u
MTVmYjUxNmFlMmQ4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3NpbXBsZV9rbXNf
aGVscGVyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9zaW1wbGVfa21zX2hlbHBlci5jCkBA
IC00Myw3ICs0Myw3IEBAIGRybV9zaW1wbGVfa21zX2NydGNfbW9kZV92YWxpZChzdHJ1Y3QgZHJt
X2NydGMgKmNydGMsCiAJCS8qIEFueXRoaW5nIGdvZXMgKi8KIAkJcmV0dXJuIE1PREVfT0s7CiAK
LQlyZXR1cm4gcGlwZS0+ZnVuY3MtPm1vZGVfdmFsaWQoY3J0YywgbW9kZSk7CisJcmV0dXJuIHBp
cGUtPmZ1bmNzLT5tb2RlX3ZhbGlkKHBpcGUsIG1vZGUpOwogfQogCiBzdGF0aWMgaW50IGRybV9z
aW1wbGVfa21zX2NydGNfY2hlY2soc3RydWN0IGRybV9jcnRjICpjcnRjLApkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3BsMTExL3BsMTExX2Rpc3BsYXkuYyBiL2RyaXZlcnMvZ3B1L2RybS9w
bDExMS9wbDExMV9kaXNwbGF5LmMKaW5kZXggMDI0NzcxYTQwODNlLi43MDNkZGM4MDNjNTUgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wbDExMS9wbDExMV9kaXNwbGF5LmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL3BsMTExL3BsMTExX2Rpc3BsYXkuYwpAQCAtNDgsMTAgKzQ4LDEwIEBAIGly
cXJldHVybl90IHBsMTExX2lycShpbnQgaXJxLCB2b2lkICpkYXRhKQogfQogCiBzdGF0aWMgZW51
bSBkcm1fbW9kZV9zdGF0dXMKLXBsMTExX21vZGVfdmFsaWQoc3RydWN0IGRybV9jcnRjICpjcnRj
LAorcGwxMTFfbW9kZV92YWxpZChzdHJ1Y3QgZHJtX3NpbXBsZV9kaXNwbGF5X3BpcGUgKnBpcGUs
CiAJCSBjb25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqbW9kZSkKIHsKLQlzdHJ1Y3QgZHJt
X2RldmljZSAqZHJtID0gY3J0Yy0+ZGV2OworCXN0cnVjdCBkcm1fZGV2aWNlICpkcm0gPSBwaXBl
LT5jcnRjLmRldjsKIAlzdHJ1Y3QgcGwxMTFfZHJtX2Rldl9wcml2YXRlICpwcml2ID0gZHJtLT5k
ZXZfcHJpdmF0ZTsKIAl1MzIgY3BwID0gcHJpdi0+dmFyaWFudC0+ZmJfYnBwIC8gODsKIAl1NjQg
Ync7CmRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fc2ltcGxlX2ttc19oZWxwZXIuaCBiL2lu
Y2x1ZGUvZHJtL2RybV9zaW1wbGVfa21zX2hlbHBlci5oCmluZGV4IDRkODljZDBhNjBkYi4uMTVh
ZmVlOWNmMDQ5IDEwMDY0NAotLS0gYS9pbmNsdWRlL2RybS9kcm1fc2ltcGxlX2ttc19oZWxwZXIu
aAorKysgYi9pbmNsdWRlL2RybS9kcm1fc2ltcGxlX2ttc19oZWxwZXIuaApAQCAtNDksNyArNDks
NyBAQCBzdHJ1Y3QgZHJtX3NpbXBsZV9kaXNwbGF5X3BpcGVfZnVuY3MgewogCSAqCiAJICogZHJt
X21vZGVfc3RhdHVzIEVudW0KIAkgKi8KLQllbnVtIGRybV9tb2RlX3N0YXR1cyAoKm1vZGVfdmFs
aWQpKHN0cnVjdCBkcm1fY3J0YyAqY3J0YywKKwllbnVtIGRybV9tb2RlX3N0YXR1cyAoKm1vZGVf
dmFsaWQpKHN0cnVjdCBkcm1fc2ltcGxlX2Rpc3BsYXlfcGlwZSAqcGlwZSwKIAkJCQkJICAgY29u
c3Qgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKm1vZGUpOwogCiAJLyoqCi0tIAoyLjIzLjAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
