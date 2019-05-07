Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDCED15EE7
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2019 10:13:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB15E89F06;
	Tue,  7 May 2019 08:13:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CFBA89EB7
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2019 08:13:41 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id f2so13757567wmj.3
 for <dri-devel@lists.freedesktop.org>; Tue, 07 May 2019 01:13:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SlO6zFuMFcd2jWkRBp06e9S3DEk7u9sAltlIY37QlZ4=;
 b=aeHw7DCGQRn3oT9tliCQv914xlNdQbliGc0fK9n1m9DZETy7jI68dP99cDQnGODD+W
 rigHx2cLxVDHOlimHZJSZMDExnxYvRKmwMpwCickEgPneJcHCP5wDGKO4o8pnrK7I4En
 UK0jkL0JaIZASUdU941GJA/KuIPnpS86r1pEUpp0kG4IfR2GazUCcj6rsR1KfX4gE338
 WuQ/LAl2mIwhbrAsL9JgWnEeUCdhBNGCUPifGeci5Xbljhh+byDvthe/54Aw68HSpl62
 c0AD1d4p57hkhNpMyU5nL2t4Nj39dYybqblbRqY/mGLTtcce7oMLNkrqUbX2eAnsQ8Xl
 70Iw==
X-Gm-Message-State: APjAAAVmxXOakkJL2G4FRSfJUaieldFgZY5bW5e20uHlW00uvLO0hnwN
 Tt1Nibn+VYAn9pIr08/dAzPp0z3b
X-Google-Smtp-Source: APXvYqxMHSgYfXbO+SG5a26GdjtVv+rcrdPbdXwqp+xWRjig27INa/wij6ms1JIWHOXbMDNNWlLgNg==
X-Received: by 2002:a1c:2d91:: with SMTP id
 t139mr20913297wmt.102.1557216819758; 
 Tue, 07 May 2019 01:13:39 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:c572:e952:8ef0:ace])
 by smtp.gmail.com with ESMTPSA id 67sm13588683wmz.41.2019.05.07.01.13.38
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 07 May 2019 01:13:38 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/9] dma-buf: start caching of sg_table objects
Date: Tue,  7 May 2019 10:13:30 +0200
Message-Id: <20190507081338.2571-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SlO6zFuMFcd2jWkRBp06e9S3DEk7u9sAltlIY37QlZ4=;
 b=TfeuZDKr+dX/NmDnTDPCMgIS6zjUr5Y2CQ/P/4C2rWrFOqwugDZlzXyLc4wIQ7PMCK
 5MCjv5F51I5VcGajpeLrIK84b+L+OloNrhEWgsbyWBhfU11qynGc5bW+O4KQ7kXBC2AI
 aUOoqElw4vjRiKKGOaP3+RscGS0l4BglAWiF0T20nv7nAL34YA15ZEZRL7shyzbmFWIc
 lTmMVfkXAZ5doqGUXS55nvPfrHZcEV8RrQyutGJF1IgT/FomjvXdmk8mkJxibkOmyx+O
 3yzfltfBJ4uZq9gylIZkwkSUKGtDXD/hjOWYS1q5/6IR7XqX5r5zcxdWIjoQTQnRwzqD
 t9Hw==
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

VG8gYWxsb3cgYSBzbW9vdGggdHJhbnNpdGlvbiBmcm9tIHBpbm5pbmcgYnVmZmVyIG9iamVjdHMg
dG8gZHluYW1pYwppbnZhbGlkYXRpb24gd2UgZmlyc3Qgc3RhcnQgdG8gY2FjaGUgdGhlIHNnX3Rh
YmxlIGZvciBhbiBhdHRhY2htZW50LgoKU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8
Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZG1hLWJ1Zi9kbWEtYnVmLmMg
fCAyNCArKysrKysrKysrKysrKysrKysrKysrKysKIGluY2x1ZGUvbGludXgvZG1hLWJ1Zi5oICAg
fCAxNCArKysrKysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAzOCBpbnNlcnRpb25zKCspCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9kbWEtYnVmL2RtYS1idWYuYyBiL2RyaXZlcnMvZG1hLWJ1Zi9k
bWEtYnVmLmMKaW5kZXggN2M4NTgwMjBkMTRiLi43NzVlMTNmNTQwODMgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZG1hLWJ1Zi9kbWEtYnVmLmMKKysrIGIvZHJpdmVycy9kbWEtYnVmL2RtYS1idWYuYwpA
QCAtNTczLDYgKzU3MywyMCBAQCBzdHJ1Y3QgZG1hX2J1Zl9hdHRhY2htZW50ICpkbWFfYnVmX2F0
dGFjaChzdHJ1Y3QgZG1hX2J1ZiAqZG1hYnVmLAogCWxpc3RfYWRkKCZhdHRhY2gtPm5vZGUsICZk
bWFidWYtPmF0dGFjaG1lbnRzKTsKIAogCW11dGV4X3VubG9jaygmZG1hYnVmLT5sb2NrKTsKKwor
CWlmICghZG1hX2J1Zl9pc19keW5hbWljKGRtYWJ1ZikpIHsKKwkJc3RydWN0IHNnX3RhYmxlICpz
Z3Q7CisKKwkJc2d0ID0gZG1hYnVmLT5vcHMtPm1hcF9kbWFfYnVmKGF0dGFjaCwgRE1BX0JJRElS
RUNUSU9OQUwpOworCQlpZiAoIXNndCkKKwkJCXNndCA9IEVSUl9QVFIoLUVOT01FTSk7CisJCWlm
IChJU19FUlIoc2d0KSkgeworCQkJZG1hX2J1Zl9kZXRhY2goZG1hYnVmLCBhdHRhY2gpOworCQkJ
cmV0dXJuIEVSUl9DQVNUKHNndCk7CisJCX0KKwkJYXR0YWNoLT5zZ3QgPSBzZ3Q7CisJfQorCiAJ
cmV0dXJuIGF0dGFjaDsKIAogZXJyX2F0dGFjaDoKQEAgLTU5NSw2ICs2MDksMTAgQEAgdm9pZCBk
bWFfYnVmX2RldGFjaChzdHJ1Y3QgZG1hX2J1ZiAqZG1hYnVmLCBzdHJ1Y3QgZG1hX2J1Zl9hdHRh
Y2htZW50ICphdHRhY2gpCiAJaWYgKFdBUk5fT04oIWRtYWJ1ZiB8fCAhYXR0YWNoKSkKIAkJcmV0
dXJuOwogCisJaWYgKGF0dGFjaC0+c2d0KQorCQlkbWFidWYtPm9wcy0+dW5tYXBfZG1hX2J1Zihh
dHRhY2gsIGF0dGFjaC0+c2d0LAorCQkJCQkgICBETUFfQklESVJFQ1RJT05BTCk7CisKIAltdXRl
eF9sb2NrKCZkbWFidWYtPmxvY2spOwogCWxpc3RfZGVsKCZhdHRhY2gtPm5vZGUpOwogCWlmIChk
bWFidWYtPm9wcy0+ZGV0YWNoKQpAQCAtNjMwLDYgKzY0OCw5IEBAIHN0cnVjdCBzZ190YWJsZSAq
ZG1hX2J1Zl9tYXBfYXR0YWNobWVudChzdHJ1Y3QgZG1hX2J1Zl9hdHRhY2htZW50ICphdHRhY2gs
CiAJaWYgKFdBUk5fT04oIWF0dGFjaCB8fCAhYXR0YWNoLT5kbWFidWYpKQogCQlyZXR1cm4gRVJS
X1BUUigtRUlOVkFMKTsKIAorCWlmIChhdHRhY2gtPnNndCkKKwkJcmV0dXJuIGF0dGFjaC0+c2d0
OworCiAJc2dfdGFibGUgPSBhdHRhY2gtPmRtYWJ1Zi0+b3BzLT5tYXBfZG1hX2J1ZihhdHRhY2gs
IGRpcmVjdGlvbik7CiAJaWYgKCFzZ190YWJsZSkKIAkJc2dfdGFibGUgPSBFUlJfUFRSKC1FTk9N
RU0pOwpAQCAtNjU3LDYgKzY3OCw5IEBAIHZvaWQgZG1hX2J1Zl91bm1hcF9hdHRhY2htZW50KHN0
cnVjdCBkbWFfYnVmX2F0dGFjaG1lbnQgKmF0dGFjaCwKIAlpZiAoV0FSTl9PTighYXR0YWNoIHx8
ICFhdHRhY2gtPmRtYWJ1ZiB8fCAhc2dfdGFibGUpKQogCQlyZXR1cm47CiAKKwlpZiAoYXR0YWNo
LT5zZ3QgPT0gc2dfdGFibGUpCisJCXJldHVybjsKKwogCWF0dGFjaC0+ZG1hYnVmLT5vcHMtPnVu
bWFwX2RtYV9idWYoYXR0YWNoLCBzZ190YWJsZSwKIAkJCQkJCWRpcmVjdGlvbik7CiB9CmRpZmYg
LS1naXQgYS9pbmNsdWRlL2xpbnV4L2RtYS1idWYuaCBiL2luY2x1ZGUvbGludXgvZG1hLWJ1Zi5o
CmluZGV4IDU4NzI1Zjg5MGI1Yi4uNTIwMzFmZGM3NWJiIDEwMDY0NAotLS0gYS9pbmNsdWRlL2xp
bnV4L2RtYS1idWYuaAorKysgYi9pbmNsdWRlL2xpbnV4L2RtYS1idWYuaApAQCAtMzIyLDYgKzMy
Miw3IEBAIHN0cnVjdCBkbWFfYnVmX2F0dGFjaG1lbnQgewogCXN0cnVjdCBkbWFfYnVmICpkbWFi
dWY7CiAJc3RydWN0IGRldmljZSAqZGV2OwogCXN0cnVjdCBsaXN0X2hlYWQgbm9kZTsKKwlzdHJ1
Y3Qgc2dfdGFibGUgKnNndDsKIAl2b2lkICpwcml2OwogfTsKIApAQCAtMzczLDYgKzM3NCwxOSBA
QCBzdGF0aWMgaW5saW5lIHZvaWQgZ2V0X2RtYV9idWYoc3RydWN0IGRtYV9idWYgKmRtYWJ1ZikK
IAlnZXRfZmlsZShkbWFidWYtPmZpbGUpOwogfQogCisvKioKKyAqIGRtYV9idWZfaXNfZHluYW1p
YyAtIGNoZWNrIGlmIGEgRE1BLWJ1ZiB1c2VzIGR5bmFtaWMgbWFwcGluZ3MuCisgKiBAZG1hYnVm
OiB0aGUgRE1BLWJ1ZiB0byBjaGVjaworICoKKyAqIFJldHVybnMgdHJ1ZSBpZiBhIERNQS1idWYg
ZXhwb3J0ZXIgd2FudHMgdG8gY3JlYXRlIGR5bmFtaWMgc2cgdGFibGUgbWFwcGluZ3MKKyAqIGZv
ciBlYWNoIGF0dGFjaG1lbnQuIEZhbHNlIGlmIG9ubHkgYSBzaW5nbGUgc3RhdGljIHNnIHRhYmxl
IHNob3VsZCBiZSB1c2VkLgorICovCitzdGF0aWMgaW5saW5lIGJvb2wgZG1hX2J1Zl9pc19keW5h
bWljKHN0cnVjdCBkbWFfYnVmICpkbWFidWYpCit7CisJLyogQWx3YXlzIHVzZSBhIHN0YXRpYyBt
YXBwaW5nIGZvciBub3cgKi8KKwlyZXR1cm4gZmFsc2U7Cit9CisKIHN0cnVjdCBkbWFfYnVmX2F0
dGFjaG1lbnQgKmRtYV9idWZfYXR0YWNoKHN0cnVjdCBkbWFfYnVmICpkbWFidWYsCiAJCQkJCQkJ
c3RydWN0IGRldmljZSAqZGV2KTsKIHZvaWQgZG1hX2J1Zl9kZXRhY2goc3RydWN0IGRtYV9idWYg
KmRtYWJ1ZiwKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
