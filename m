Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11FBADEFB5
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2019 16:35:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88BE06E126;
	Mon, 21 Oct 2019 14:35:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80C6B6E126
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 14:35:03 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id p4so14274091wrm.8
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 07:35:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IMYgg0BskdWGAR55+ZNhsclFgQuE/wNcVY9wbsuF1iY=;
 b=f+/aVJT/PblERx1l/tZOLxIdDbeBfIR37kcH6LC9lVN8bH5ylOBe+QQViKt2wb8TYQ
 Tl+Wm5BVyHhvsHVVaP46hH+RlEAjWDRkn/xFI7WeGia8T1sj4dnf24NGof4SqlnoBSWa
 FfionE0VByDpg8ZhvPZH3BtlA521JjsO6KMTezJ9qmlRW8nP4o9gIgK63XRPJSyibQ6r
 4bzfg4Ssosx0eswOFwNZh5g/8JADW+fzC/2q3B0okd4HemG3hlHYq6ECS2LLIA4bMRMX
 3iRXudziFHmyEd3dff62atYphqYX6J/CygEu8gpLEeGVGbKUcOTs5X2ITq6gIp1mkjru
 pVVQ==
X-Gm-Message-State: APjAAAVHDX29WobAbCIW62XjtZWvJ04ohwuaorE0bkgkHAA4YnzirkV8
 WPGvW4sFy2h0UHMfhQORNt5wlgtH
X-Google-Smtp-Source: APXvYqwDGO07CGtoK0ipIRv8qNH9KLBfbRbzKR+JrdanB35nGbcZ7hGbl057gtXiBZLhsCRV+euOQQ==
X-Received: by 2002:a5d:6a91:: with SMTP id s17mr13226599wru.224.1571668500801; 
 Mon, 21 Oct 2019 07:35:00 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id o25sm5865199wro.21.2019.10.21.07.34.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2019 07:34:58 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 07/13] drm/dp: Add helper to get post-cursor adjustments
Date: Mon, 21 Oct 2019 16:34:31 +0200
Message-Id: <20191021143437.1477719-8-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191021143437.1477719-1-thierry.reding@gmail.com>
References: <20191021143437.1477719-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IMYgg0BskdWGAR55+ZNhsclFgQuE/wNcVY9wbsuF1iY=;
 b=eQcjQaLuEyrp0CBPn1+l9XkTvV+T/E19fkaprwsIUlCuSAF7lZVOGi4U+HiuF/prUd
 cWPznvdpfxkMqO/Qhh6AZ/Tf57XfBhlL4asyB6tAxWxPd9JUQ0zNKs4HXFPevAycZpqs
 lvS6keeOqsItRzUSgudthaHRbCmpmrT/H4gAy3x/Xnfqa1gYEafWZsg8hPP8iDHujRKE
 53cDnQTY3Pz6+ZH+hPelXqcI921TLk7iZ9Yp4OKrfSlFVa0dCL0KBvpyepooelN/ZItT
 F+8pfG4pAJtXFPDaTQZ+G/u3ZwrB1XDXzpW2Io3Jhy0GeVbsEB92fBTY98TvoWwpSO85
 d06Q==
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

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KCklmIHRoZSB0cmFuc21p
dHRlciBzdXBwb3J0cyBwcmUtZW1waGFzaXMgcG9zdCBjdXJzb3IyIHRoZSBzaW5rIHdpbGwKcmVx
dWVzdCBhZGp1c3RtZW50cyBpbiBhIHNpbWlsYXIgd2F5IHRvIGhvdyBpdCByZXF1ZXN0cyBhZGp1
c3RtZW50cyB0bwp0aGUgdm9sdGFnZSBzd2luZyBhbmQgcHJlLWVtcGhhc2lzIHNldHRpbmdzLgoK
QWRkIGEgaGVscGVyIHRvIGV4dHJhY3QgdGhlc2UgYWRqdXN0bWVudHMgb24gYSBwZXItbGFuZSBi
YXNpcyBmcm9tIHRoZQpEUENEIGxpbmsgc3RhdHVzLgoKUmV2aWV3ZWQtYnk6IFBoaWxpcHAgWmFi
ZWwgPHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+ClJldmlld2VkLWJ5OiBMeXVkZSBQYXVsIDxseXVk
ZUByZWRoYXQuY29tPgpTaWduZWQtb2ZmLWJ5OiBUaGllcnJ5IFJlZGluZyA8dHJlZGluZ0Budmlk
aWEuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fZHBfaGVscGVyLmMgfCAxMCArKysrKysr
KysrCiBpbmNsdWRlL2RybS9kcm1fZHBfaGVscGVyLmggICAgIHwgMTAgKysrKysrKysrKwogMiBm
aWxlcyBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2RybV9kcF9oZWxwZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfaGVscGVyLmMKaW5k
ZXggYWM4MDJiMDRmMTIwLi5mNTY3MTQxYWZmNTQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fZHBfaGVscGVyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9oZWxwZXIuYwpA
QCAtMTIwLDYgKzEyMCwxNiBAQCB1OCBkcm1fZHBfZ2V0X2FkanVzdF9yZXF1ZXN0X3ByZV9lbXBo
YXNpcyhjb25zdCB1OCBsaW5rX3N0YXR1c1tEUF9MSU5LX1NUQVRVU19TSQogfQogRVhQT1JUX1NZ
TUJPTChkcm1fZHBfZ2V0X2FkanVzdF9yZXF1ZXN0X3ByZV9lbXBoYXNpcyk7CiAKK3U4IGRybV9k
cF9nZXRfYWRqdXN0X3JlcXVlc3RfcG9zdF9jdXJzb3IoY29uc3QgdTggbGlua19zdGF0dXNbRFBf
TElOS19TVEFUVVNfU0laRV0sCisJCQkJCSB1bnNpZ25lZCBpbnQgbGFuZSkKK3sKKwl1bnNpZ25l
ZCBpbnQgb2Zmc2V0ID0gRFBfQURKVVNUX1JFUVVFU1RfUE9TVF9DVVJTT1IyOworCXU4IHZhbHVl
ID0gZHBfbGlua19zdGF0dXMobGlua19zdGF0dXMsIG9mZnNldCk7CisKKwlyZXR1cm4gKHZhbHVl
ID4+IChsYW5lIDw8IDEpKSAmIDB4MzsKK30KK0VYUE9SVF9TWU1CT0woZHJtX2RwX2dldF9hZGp1
c3RfcmVxdWVzdF9wb3N0X2N1cnNvcik7CisKIHZvaWQgZHJtX2RwX2xpbmtfdHJhaW5fY2xvY2tf
cmVjb3ZlcnlfZGVsYXkoY29uc3QgdTggZHBjZFtEUF9SRUNFSVZFUl9DQVBfU0laRV0pCiB7CiAJ
dW5zaWduZWQgbG9uZyByZF9pbnRlcnZhbCA9IGRwY2RbRFBfVFJBSU5JTkdfQVVYX1JEX0lOVEVS
VkFMXSAmCmRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fZHBfaGVscGVyLmggYi9pbmNsdWRl
L2RybS9kcm1fZHBfaGVscGVyLmgKaW5kZXggYjM0MDJjYjE4NmE0Li4wNGY2YzBiYjAyNzQgMTAw
NjQ0Ci0tLSBhL2luY2x1ZGUvZHJtL2RybV9kcF9oZWxwZXIuaAorKysgYi9pbmNsdWRlL2RybS9k
cm1fZHBfaGVscGVyLmgKQEAgLTYwNSw2ICs2MDUsMTQgQEAKICMgZGVmaW5lIERQX0FESlVTVF9Q
UkVfRU1QSEFTSVNfTEFORTFfU0hJRlQgIDYKIAogI2RlZmluZSBEUF9BREpVU1RfUkVRVUVTVF9Q
T1NUX0NVUlNPUjIgICAgICAweDIwYworIyBkZWZpbmUgRFBfQURKVVNUX1BPU1RfQ1VSU09SMl9M
QU5FMF9NQVNLICAweDAzCisjIGRlZmluZSBEUF9BREpVU1RfUE9TVF9DVVJTT1IyX0xBTkUwX1NI
SUZUIDAKKyMgZGVmaW5lIERQX0FESlVTVF9QT1NUX0NVUlNPUjJfTEFORTFfTUFTSyAgMHgwYwor
IyBkZWZpbmUgRFBfQURKVVNUX1BPU1RfQ1VSU09SMl9MQU5FMV9TSElGVCAyCisjIGRlZmluZSBE
UF9BREpVU1RfUE9TVF9DVVJTT1IyX0xBTkUyX01BU0sgIDB4MzAKKyMgZGVmaW5lIERQX0FESlVT
VF9QT1NUX0NVUlNPUjJfTEFORTJfU0hJRlQgNAorIyBkZWZpbmUgRFBfQURKVVNUX1BPU1RfQ1VS
U09SMl9MQU5FM19NQVNLICAweGMwCisjIGRlZmluZSBEUF9BREpVU1RfUE9TVF9DVVJTT1IyX0xB
TkUzX1NISUZUIDYKIAogI2RlZmluZSBEUF9URVNUX1JFUVVFU1QJCQkgICAgMHgyMTgKICMgZGVm
aW5lIERQX1RFU1RfTElOS19UUkFJTklORwkJICAgICgxIDw8IDApCkBAIC0xMTIyLDYgKzExMzAs
OCBAQCB1OCBkcm1fZHBfZ2V0X2FkanVzdF9yZXF1ZXN0X3ZvbHRhZ2UoY29uc3QgdTggbGlua19z
dGF0dXNbRFBfTElOS19TVEFUVVNfU0laRV0sCiAJCQkJICAgICBpbnQgbGFuZSk7CiB1OCBkcm1f
ZHBfZ2V0X2FkanVzdF9yZXF1ZXN0X3ByZV9lbXBoYXNpcyhjb25zdCB1OCBsaW5rX3N0YXR1c1tE
UF9MSU5LX1NUQVRVU19TSVpFXSwKIAkJCQkJICBpbnQgbGFuZSk7Cit1OCBkcm1fZHBfZ2V0X2Fk
anVzdF9yZXF1ZXN0X3Bvc3RfY3Vyc29yKGNvbnN0IHU4IGxpbmtfc3RhdHVzW0RQX0xJTktfU1RB
VFVTX1NJWkVdLAorCQkJCQkgdW5zaWduZWQgaW50IGxhbmUpOwogCiAjZGVmaW5lIERQX0JSQU5D
SF9PVUlfSEVBREVSX1NJWkUJMHhjCiAjZGVmaW5lIERQX1JFQ0VJVkVSX0NBUF9TSVpFCQkweGYK
LS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
