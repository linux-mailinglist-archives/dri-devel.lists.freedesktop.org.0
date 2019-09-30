Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC38C1BD2
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2019 08:57:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64FE76E370;
	Mon, 30 Sep 2019 06:57:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 093FA899B5
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2019 03:10:00 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id c25so34233359iot.12
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Sep 2019 20:10:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=JdWTb1V4IhUUMb47mN6yAdg27zy2bK0W+qF3wp30fYo=;
 b=tyFfglm+Ss3juj38mMJHUbOVPRD8VIPNT4BuKQur11joSfrKuPi/iexBB80xN45xyd
 70wrnYnGdaqxM88Xxrb5Gq0C/FDx8RPKqPMCm8wal9jW2MujrRF7S6Q61gKgSRyjN64o
 PHuaM/+gg3mGAJZFPUy81jXYPyKPPmMn4bcUEUv/VrsN+eqeoNYOsGgLoJrJK5YuXsui
 UAIHn1KbWUZzjsxm5X5cVAOu7woKdcEbR9XmnrSKSfrDKiEe+yZi92J9+JMAb4YRfybJ
 oh9N5Y+mJR/8DbZYa2VwVV5b88I5f4a/dp7y9krOwkENn4ZucrgDTCJ8xjGO2wn3atoC
 19Rg==
X-Gm-Message-State: APjAAAW5FjovUSN1IOQdbqHbpjZ67Fx6mKwNqytHKONZLUyZLQKCFq3b
 9TVMqF+F0SmGZ4mAgfPCKXg=
X-Google-Smtp-Source: APXvYqw9S4icJAA3Iim6bEKEOhPYCZHJFDUjRkHAKLayY1qZ/8t7tcsSVHOGYMUZdwQB5yUeCahPEQ==
X-Received: by 2002:a5d:9349:: with SMTP id i9mr3190833ioo.101.1569812999347; 
 Sun, 29 Sep 2019 20:09:59 -0700 (PDT)
Received: from cs-dulles.cs.umn.edu (cs-dulles.cs.umn.edu. [128.101.35.54])
 by smtp.googlemail.com with ESMTPSA id r22sm5444086ilb.85.2019.09.29.20.09.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Sep 2019 20:09:58 -0700 (PDT)
From: Navid Emamdoost <navid.emamdoost@gmail.com>
To: 
Subject: [PATCH] Staging: fbtft: fix memory leak in fbtft_framebuffer_alloc
Date: Sun, 29 Sep 2019 22:09:45 -0500
Message-Id: <20190930030949.28615-1-navid.emamdoost@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Mon, 30 Sep 2019 06:57:28 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=JdWTb1V4IhUUMb47mN6yAdg27zy2bK0W+qF3wp30fYo=;
 b=hetnKUgsD2zSGDpE7xOLnzeBpXHQYJEYYEqnzJSwcvWeNhdWPsdlC6/Pbtswtb+2tg
 ReMBVDCg9wXGCrev7wYoFfActSDTXjhCrs0vGHKXQNlzmnTvodwpgC8GReVyUTL0cUH6
 jPTCtsx6gOP9iFcUzUyy2V77UQAkJPNLpN/9ZFmSxBsi6rCppsNdoC3ciTBBpVHYGV8Z
 Myyx7ePbg+RWklM9om4+N+eOelSbT4G5BFWA9tPOKtxcimECtmLWNhuAU4sZY3PA7GSi
 2E2BiHEuooVd+tzXxgBWNKKeiMaqgI0bZFAkItESu2W1K44vsybFpfUDwksMtW2XWFcq
 p/mg==
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
Cc: =?UTF-8?q?Jan=20Sebastian=20G=C3=B6tte?= <linux@jaseg.net>,
 devel@driverdev.osuosl.org, linux-fbdev@vger.kernel.org,
 Nishad Kamdar <nishadkamdar@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kjlu@umn.edu,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>, emamd001@umn.edu,
 Bhanusree Pola <bhanusreemahesh@gmail.com>, smccaman@umn.edu,
 Phil Reid <preid@electromag.com.au>, Sam Ravnborg <sam@ravnborg.org>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Navid Emamdoost <navid.emamdoost@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW4gZmJ0ZnRfZnJhbWVidWZmZXJfYWxsb2MgdGhlIGVycm9yIGhhbmRsaW5nIHBhdGggc2hvdWxk
IHRha2UgY2FyZSBvZgpyZWxlYXNpbmcgZnJhbWUgYnVmZmVyIGFmdGVyIGl0IGlzIGFsbG9jYXRl
ZCB2aWEgZnJhbWVidWZmZXJfYWxsb2MsIHRvby4KVGhlcmVmb3JlLCBpbiB0d28gZmFpbHVyZSBj
YXNlcyB0aGUgZ290byBkZXN0aW5hdGlvbiBpcyBjaGFuZ2VkIHRvCmFkZHJlc3MgdGhpcyBpc3N1
ZS4KCkZpeGVzOiBjMjk2ZDVmOTk1N2MgKCJzdGFnaW5nOiBmYnRmdDogY29yZSBzdXBwb3J0IikK
U2lnbmVkLW9mZi1ieTogTmF2aWQgRW1hbWRvb3N0IDxuYXZpZC5lbWFtZG9vc3RAZ21haWwuY29t
PgotLS0KIGRyaXZlcnMvc3RhZ2luZy9mYnRmdC9mYnRmdC1jb3JlLmMgfCA3ICsrKysrLS0KIDEg
ZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9zdGFnaW5nL2ZidGZ0L2ZidGZ0LWNvcmUuYyBiL2RyaXZlcnMvc3RhZ2luZy9m
YnRmdC9mYnRmdC1jb3JlLmMKaW5kZXggY2Y1NzAwYTJlYTY2Li5hMGE2N2FhNTE3ZjAgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvc3RhZ2luZy9mYnRmdC9mYnRmdC1jb3JlLmMKKysrIGIvZHJpdmVycy9z
dGFnaW5nL2ZidGZ0L2ZidGZ0LWNvcmUuYwpAQCAtNzE0LDcgKzcxNCw3IEBAIHN0cnVjdCBmYl9p
bmZvICpmYnRmdF9mcmFtZWJ1ZmZlcl9hbGxvYyhzdHJ1Y3QgZmJ0ZnRfZGlzcGxheSAqZGlzcGxh
eSwKIAlpZiAocGFyLT5nYW1tYS5jdXJ2ZXMgJiYgZ2FtbWEpIHsKIAkJaWYgKGZidGZ0X2dhbW1h
X3BhcnNlX3N0cihwYXIsIHBhci0+Z2FtbWEuY3VydmVzLCBnYW1tYSwKIAkJCQkJICBzdHJsZW4o
Z2FtbWEpKSkKLQkJCWdvdG8gYWxsb2NfZmFpbDsKKwkJCWdvdG8gcmVsZWFzZV9mcmFtZWJ1ZjsK
IAl9CiAKIAkvKiBUcmFuc21pdCBidWZmZXIgKi8KQEAgLTczMSw3ICs3MzEsNyBAQCBzdHJ1Y3Qg
ZmJfaW5mbyAqZmJ0ZnRfZnJhbWVidWZmZXJfYWxsb2Moc3RydWN0IGZidGZ0X2Rpc3BsYXkgKmRp
c3BsYXksCiAJaWYgKHR4YnVmbGVuID4gMCkgewogCQl0eGJ1ZiA9IGRldm1fa3phbGxvYyhwYXIt
PmluZm8tPmRldmljZSwgdHhidWZsZW4sIEdGUF9LRVJORUwpOwogCQlpZiAoIXR4YnVmKQotCQkJ
Z290byBhbGxvY19mYWlsOworCQkJZ290byByZWxlYXNlX2ZyYW1lYnVmOwogCQlwYXItPnR4YnVm
LmJ1ZiA9IHR4YnVmOwogCQlwYXItPnR4YnVmLmxlbiA9IHR4YnVmbGVuOwogCX0KQEAgLTc1Myw2
ICs3NTMsOSBAQCBzdHJ1Y3QgZmJfaW5mbyAqZmJ0ZnRfZnJhbWVidWZmZXJfYWxsb2Moc3RydWN0
IGZidGZ0X2Rpc3BsYXkgKmRpc3BsYXksCiAKIAlyZXR1cm4gaW5mbzsKIAorcmVsZWFzZV9mcmFt
ZWJ1ZjoKKwlmcmFtZWJ1ZmZlcl9yZWxlYXNlKGluZm8pOworCiBhbGxvY19mYWlsOgogCXZmcmVl
KHZtZW0pOwogCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
