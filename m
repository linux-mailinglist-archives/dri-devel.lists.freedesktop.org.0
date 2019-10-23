Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D310E2654
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 00:22:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4DA66E0B6;
	Wed, 23 Oct 2019 22:22:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 828AC6E0B6
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 22:22:29 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id b25so7214817oib.7
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 15:22:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Q+mpw/DJpg8X7g76hDP88VPzzqWD7qhoYfGoXof7Ryw=;
 b=Ij32MXd3kheteOVtaFdB45wsghpFAeokzpy5VISIqpid0kOazzOVOUB1m1STOVyIM5
 KyUWKIkouKbu7ikjxYK6QD8NxutronjjIC/eCRIl2dePLFrU62xPYMEuaCgfZzInfR94
 8YJbzYft/vB6y3sqx7Fi/Q0ig+F92QUh0GHrkvcQRyO39SWrarpszhPX+THNuzpBwgA3
 GmKdUAOT1/RtwcYYPGca9AZ141mTjAPO7AT9X8Vs9SI/SKYJckc0ILyT0dZ8ksTvIV+x
 wL9mSMBR6P6hoPqvugddMCl2tmB7wBRCJtOxaItjzrF7SgQFye69v34EkT9rnyKK2PqV
 y0Gg==
X-Gm-Message-State: APjAAAXOB8j5GlddbdMoAkRpqRrcJrEtLhhIvM3TTXy+zrbCmaRgGqnW
 osqXk+RZ2LyVcVOiPBv4VhEih+U=
X-Google-Smtp-Source: APXvYqzy6OcsgEB0d/jyrpLfaA0F9ucLsLiY8GJKju/SW0GIQ6PaT/ZdWHhcfjZlxKs0yIYTDIic+Q==
X-Received: by 2002:aca:56d6:: with SMTP id k205mr1856542oib.51.1571869348400; 
 Wed, 23 Oct 2019 15:22:28 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id 21sm5936971oin.26.2019.10.23.15.22.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2019 15:22:27 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: dri-devel@lists.freedesktop.org,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH] drm/prime: Fix mmap fake offset for drm_gem_object_funcs.mmap
Date: Wed, 23 Oct 2019 17:22:26 -0500
Message-Id: <20191023222226.9064-1-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q29tbWl0IGM0MDA2OWNiN2JkNiAoImRybTogYWRkIG1tYXAoKSB0byBkcm1fZ2VtX29iamVjdF9m
dW5jcyIpCmludHJvZHVjZWQgYSBHRU0gb2JqZWN0IG1tYXAoKSBob29rIHdoaWNoIGlzIGV4cGVj
dGVkIHRvIHN1YnRyYWN0IHRoZQpmYWtlIG9mZnNldCBmcm9tIHZtX3Bnb2ZmLiBIb3dldmVyLCBm
b3IgbW1hcCgpIG9uIGRtYWJ1ZnMsIHRoZXJlIGlzIG5vdAphIGZha2Ugb2Zmc2V0LiBUbyBmaXgg
dGhpcywgd2UgbmVlZCB0byBhZGQgdGhlIGZha2Ugb2Zmc2V0IGp1c3QgbGlrZSB0aGUKZHJpdmVy
LT5mb3BzLT5tbWFwKCkgY29kZSBwYXRoLgoKRml4ZXM6IGM0MDA2OWNiN2JkNiAoImRybTogYWRk
IG1tYXAoKSB0byBkcm1fZ2VtX29iamVjdF9mdW5jcyIpCkNjOiBHZXJkIEhvZmZtYW5uIDxrcmF4
ZWxAcmVkaGF0LmNvbT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+
ClNpZ25lZC1vZmYtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Ci0tLQpJIHJhbiBp
bnRvIHRoaXMgd2hpbGUgd29ya2luZyBvbiBjb252ZXJ0aW5nIHZnZW0gdG8gc2htZW0gaGVscGVy
cyBhbmQKdGhlIElHVCB2Z2VtX2Jhc2ljIGRtYWJ1Zi1tbWFwIHRlc3QgZmFpbGVkLiBUaGlzIGZp
eGVzIHNobWVtLCBidXQgSQpoYXZlIGNoZWNrZWQgYW55IG90aGVyIHVzZXJzIG9mIHRoZSBuZXcg
bW1hcCBob29rLgoKUm9iCgogZHJpdmVycy9ncHUvZHJtL2RybV9wcmltZS5jIHwgNCArKy0tCiAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fcHJpbWUuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fcHJp
bWUuYwppbmRleCAwODE0MjExYjBmM2YuLjVkMDY2OTBhMmU5ZCAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2RybV9wcmltZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fcHJpbWUuYwpA
QCAtNzEzLDYgKzcxMyw4IEBAIGludCBkcm1fZ2VtX3ByaW1lX21tYXAoc3RydWN0IGRybV9nZW1f
b2JqZWN0ICpvYmosIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKQogCXN0cnVjdCBmaWxlICpm
aWw7CiAJaW50IHJldDsKIAorCXZtYS0+dm1fcGdvZmYgKz0gZHJtX3ZtYV9ub2RlX3N0YXJ0KCZv
YmotPnZtYV9ub2RlKTsKKwogCWlmIChvYmotPmZ1bmNzICYmIG9iai0+ZnVuY3MtPm1tYXApIHsK
IAkJcmV0ID0gb2JqLT5mdW5jcy0+bW1hcChvYmosIHZtYSk7CiAJCWlmIChyZXQpCkBAIC03Mzcs
OCArNzM5LDYgQEAgaW50IGRybV9nZW1fcHJpbWVfbW1hcChzdHJ1Y3QgZHJtX2dlbV9vYmplY3Qg
Km9iaiwgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpCiAJaWYgKHJldCkKIAkJZ290byBvdXQ7
CiAKLQl2bWEtPnZtX3Bnb2ZmICs9IGRybV92bWFfbm9kZV9zdGFydCgmb2JqLT52bWFfbm9kZSk7
Ci0KIAlyZXQgPSBvYmotPmRldi0+ZHJpdmVyLT5mb3BzLT5tbWFwKGZpbCwgdm1hKTsKIAogCWRy
bV92bWFfbm9kZV9yZXZva2UoJm9iai0+dm1hX25vZGUsIHByaXYpOwotLSAKMi4yMC4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
