Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E96B465026
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2019 04:29:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E743689C13;
	Thu, 11 Jul 2019 02:29:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 582FE89C13
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2019 02:29:51 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id t14so2170939plr.11
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 19:29:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qPWrGW+mHyz/zxrmAaiQeG6b1c+y5yhmMgQ1hyiaZR0=;
 b=PfsO/sEpa+EOHa4NMzhxUPaO90Qgu2cFP2WzQhOKwpb02MPDAM6/wrE94bGiMK4sov
 FizkNHx/ruYJr0kdKzFaBrMUHTA721oRO9wHyjqUTYXGFfsfjQfhM4pbts51oZJT9l9l
 1ykye2pxPCwQ6h9Dn9c2rW2peAzLMO3quBoYGnuYQdQhlBgwcwm6KDuQHYzQUa26cLYz
 zjfI+CnBIO/dmkqOP7v88/jcpJsEWXBU0mm8oA+sDaK2bO/bRZeQI3A8JxczyG8VvDde
 1ikdnlcx10kFwgWbdGsjk+42M+568NOri9RppXb29QKiUKmCjLV5EMHHkcT7BACj3B/4
 y55Q==
X-Gm-Message-State: APjAAAXiIIhTGTzt7YeGwucKdncJwsCShr5li5oOSt//wB7KaWpVNlo5
 4T8nXVpyoFtAzvMkyevFD2VawVjd
X-Google-Smtp-Source: APXvYqxN90cLc00cYdWJNjcMcmyHeBOPnCRonXFxzLH+4vQTsAuClh9uNnBz+kEzScj2/zJk48u0Mw==
X-Received: by 2002:a17:902:2ec5:: with SMTP id
 r63mr1710517plb.21.1562812190534; 
 Wed, 10 Jul 2019 19:29:50 -0700 (PDT)
Received: from olv0.mtv.corp.google.com
 ([2620:15c:202:201:9649:82d6:f889:b307])
 by smtp.gmail.com with ESMTPSA id x25sm1929986pfa.90.2019.07.10.19.29.49
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 10 Jul 2019 19:29:49 -0700 (PDT)
From: Chia-I Wu <olvaffe@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/virtio: kick vq outside of the vq lock
Date: Wed, 10 Jul 2019 19:29:37 -0700
Message-Id: <20190711022937.166015-1-olvaffe@gmail.com>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qPWrGW+mHyz/zxrmAaiQeG6b1c+y5yhmMgQ1hyiaZR0=;
 b=qBE3eLC4RA4F+HzzOw79/Ge4/+ES1SdQUKnZaGPTDpEUF8lt0KVkrqVWOAH8gpMusV
 SG2+KBYLVfOn5pgk4W6rG1t7np0qKA+oz0CdjwjzL6gSCe9eQoYjvZZIVdVUNXG+OVVr
 D5wKYCee+xGjkEvfLuvpHpwo0W0H6JMlD2Xu1zRBuyaZOZV+gR0FFXFoSMXagudf/RdK
 uuZK4pJg5lx4taqE1//t+jWtdifCnAgF6B/cKysKRztKwrbLOjmXuxE5eZ4Ls7fV6ZIr
 GJ+N2Xakvkqq0zyfzswiAJvrKiGDfMQBsRjsuQmPA+Wk9uROukpiddb2+mkaWJHCkFKL
 6PGA==
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Gerd Hoffmann <kraxel@redhat.com>, virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmVwbGFjZSB2aXJ0cXVldWVfa2ljayBieSB2aXJ0cXVldWVfa2lja19wcmVwYXJlLCB3aGljaCBy
ZXF1aXJlcwpzZXJpYWxpemF0aW9uLCBhbmQgdmlydHF1ZXVlX25vdGlmeSwgd2hpY2ggZG9lcyBu
b3QuICBSZXB1cnBvc2UgdGhlCnJldHVybiB2YWx1ZXMgdG8gaW5kaWNhdGUgd2hldGhlciB0aGUg
dnEgc2hvdWxkIGJlIG5vdGlmaWVkLgoKVGhpcyBmaXhlcyBhIGxvY2sgY29udGVudGlvbiB3aXRo
IHFlbXUgaG9zdC4gIFdoZW4gdGhlIGd1ZXN0IGNhbGxzCnZpYmFkIHJ0cXVldWVfbm90aWZ5LCB0
aGUgcWVtdSB2Y3B1IHRocmVhZCBleGl0cyB0aGUgZ3Vlc3QgYW5kIHdhaXRzCmZvciB0aGUgcWVt
dSBpb3RocmVhZCB0byBwZXJmb3JtIHRoZSBNTUlPLiAgSWYgdGhlIHFlbXUgaW90aHJlYWQgaXMK
c3RpbGwgcHJvY2Vzc2luZyB0aGUgcHJpb3IgYnVmZmVyLCBhbmQgaWYgdGhlIHByaW9yIGJ1ZmZl
ciBpcyBjaGVhcAp0byBHUFUsIHRoZSBpb3RocmVhZCB3aWxsIGdvIGFoZWFkIGFuZCBnZW5lcmF0
ZSBhbiBJUlEgZm9yIHRoZQpndWVzdC4gIEEgd29ya2VyIHRocmVhZCBpbiB0aGUgZ3Vlc3Qgd2ls
bCBjYWxsCnZpcnRpb19ncHVfZGVxdWV1ZV9jdHJsX2Z1bmMuICBJZiB2aXJ0cXVldWVfbm90aWZ5
IHdhcyBjYWxsZWQgd2l0aAp0aGUgdnEgbG9jayBoZWxkLCB0aGUgd29ya2VyIHRocmVhZCB3b3Vs
ZCBidXN5IHdhaXQgaW5zaWRlCnZpcnRpb19ncHVfZGVxdWV1ZV9jdHJsX2Z1bmMuCgpTaWduZWQt
b2ZmLWJ5OiBDaGlhLUkgV3UgPG9sdmFmZmVAZ21haWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS92aXJ0aW8vdmlydGdwdV92cS5jIHwgMTkgKysrKysrKysrKysrKy0tLS0tLQogMSBmaWxlIGNo
YW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X3ZxLmMgYi9kcml2ZXJzL2dwdS9kcm0vdmlydGlv
L3ZpcnRncHVfdnEuYwppbmRleCA2YzFhOTA3MTc1MzUuLmU5NmY4OGZlNWM4MyAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X3ZxLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3ZpcnRpby92aXJ0Z3B1X3ZxLmMKQEAgLTI5MSwxMSArMjkxLDkgQEAgc3RhdGljIGludCB2
aXJ0aW9fZ3B1X3F1ZXVlX2N0cmxfYnVmZmVyX2xvY2tlZChzdHJ1Y3QgdmlydGlvX2dwdV9kZXZp
Y2UgKnZnZGV2LAogCQl0cmFjZV92aXJ0aW9fZ3B1X2NtZF9xdWV1ZSh2cSwKIAkJCShzdHJ1Y3Qg
dmlydGlvX2dwdV9jdHJsX2hkciAqKXZidWYtPmJ1Zik7CiAKLQkJdmlydHF1ZXVlX2tpY2sodnEp
OworCQlyZXQgPSB2aXJ0cXVldWVfa2lja19wcmVwYXJlKHZxKTsKIAl9CiAKLQlpZiAoIXJldCkK
LQkJcmV0ID0gdnEtPm51bV9mcmVlOwogCXJldHVybiByZXQ7CiB9CiAKQEAgLTMwNyw2ICszMDUs
MTAgQEAgc3RhdGljIGludCB2aXJ0aW9fZ3B1X3F1ZXVlX2N0cmxfYnVmZmVyKHN0cnVjdCB2aXJ0
aW9fZ3B1X2RldmljZSAqdmdkZXYsCiAJc3Bpbl9sb2NrKCZ2Z2Rldi0+Y3RybHEucWxvY2spOwog
CXJjID0gdmlydGlvX2dwdV9xdWV1ZV9jdHJsX2J1ZmZlcl9sb2NrZWQodmdkZXYsIHZidWYpOwog
CXNwaW5fdW5sb2NrKCZ2Z2Rldi0+Y3RybHEucWxvY2spOworCisJaWYgKHJjID4gMCkKKwkJdmly
dHF1ZXVlX25vdGlmeSh2Z2Rldi0+Y3RybHEudnEpOworCiAJcmV0dXJuIHJjOwogfQogCkBAIC0z
MzksNiArMzQxLDEwIEBAIHN0YXRpYyBpbnQgdmlydGlvX2dwdV9xdWV1ZV9mZW5jZWRfY3RybF9i
dWZmZXIoc3RydWN0IHZpcnRpb19ncHVfZGV2aWNlICp2Z2RldiwKIAkJdmlydGlvX2dwdV9mZW5j
ZV9lbWl0KHZnZGV2LCBoZHIsIGZlbmNlKTsKIAlyYyA9IHZpcnRpb19ncHVfcXVldWVfY3RybF9i
dWZmZXJfbG9ja2VkKHZnZGV2LCB2YnVmKTsKIAlzcGluX3VubG9jaygmdmdkZXYtPmN0cmxxLnFs
b2NrKTsKKworCWlmIChyYyA+IDApCisJCXZpcnRxdWV1ZV9ub3RpZnkodmdkZXYtPmN0cmxxLnZx
KTsKKwogCXJldHVybiByYzsKIH0KIApAQCAtMzY5LDEzICszNzUsMTQgQEAgc3RhdGljIGludCB2
aXJ0aW9fZ3B1X3F1ZXVlX2N1cnNvcihzdHJ1Y3QgdmlydGlvX2dwdV9kZXZpY2UgKnZnZGV2LAog
CQl0cmFjZV92aXJ0aW9fZ3B1X2NtZF9xdWV1ZSh2cSwKIAkJCShzdHJ1Y3QgdmlydGlvX2dwdV9j
dHJsX2hkciAqKXZidWYtPmJ1Zik7CiAKLQkJdmlydHF1ZXVlX2tpY2sodnEpOworCQlyZXQgPSB2
aXJ0cXVldWVfa2lja19wcmVwYXJlKHZxKTsKIAl9CiAKIAlzcGluX3VubG9jaygmdmdkZXYtPmN1
cnNvcnEucWxvY2spOwogCi0JaWYgKCFyZXQpCi0JCXJldCA9IHZxLT5udW1fZnJlZTsKKwlpZiAo
cmV0ID4gMCkKKwkJdmlydHF1ZXVlX25vdGlmeSh2cSk7CisKIAlyZXR1cm4gcmV0OwogfQogCi0t
IAoyLjIyLjAuNDEwLmdkOGZkYmUyMWI1LWdvb2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
