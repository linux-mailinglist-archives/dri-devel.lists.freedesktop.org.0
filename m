Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 689FBB17F2
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2019 07:51:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 206A06EE7E;
	Fri, 13 Sep 2019 05:51:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21D716E96F;
 Fri, 13 Sep 2019 05:51:21 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id g207so1281851wmg.5;
 Thu, 12 Sep 2019 22:51:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jXC2JSeYDwfRzTDWTmvulHeraPlQ3lge32wRaYjTBZI=;
 b=VR7WnU3FT3B9Imkdj/cYpCiEbQ/Qh4anjpuxhDtA7NwZK+tUb8czvLWNzr92LBwR9p
 P6J/cJVElg61QYTROrITvz22Q8YwR9PtOU2x+useZv9LPJa003xfhNFBhc8RhnURDEQ/
 K8ocSwWRQnM6zU70WDsEbeB9+YigswPKgqeSLfYktJcw4TZVTfsYAnouDoLmX47uLCAL
 jr44hCYIZQok0szs/rVxEGqCZZ+rHJmikfp/W6TTlZgGrB76KVwjEshS35oIREsTwGWN
 pPQhAN6xrwmWZ1O1dtb5zwiLl1hNkiXZgUaQ8t1kh60JLXNuPHVCwx1pUMgfHZwfLf0/
 1aYw==
X-Gm-Message-State: APjAAAUtihKRUNnNUI3qanryMjmzumIpTaCItpU9yw6UhbkUpKWX9f51
 VCS7Xz3RM7us/usYP9hVRLU=
X-Google-Smtp-Source: APXvYqyPuytCs7qgPT8aDxXS0ADHQ+Ao/igSxMfV2CjGE2qnx7wAaeoyMX0W1A8Z/HLqtS4yG8snFA==
X-Received: by 2002:a1c:f913:: with SMTP id x19mr1751035wmh.2.1568353879564;
 Thu, 12 Sep 2019 22:51:19 -0700 (PDT)
Received: from localhost.localdomain ([62.178.82.229])
 by smtp.gmail.com with ESMTPSA id h125sm2429279wmf.31.2019.09.12.22.51.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Sep 2019 22:51:18 -0700 (PDT)
From: Christian Gmeiner <christian.gmeiner@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] drm/etnaviv: print MMU exception cause
Date: Fri, 13 Sep 2019 07:50:37 +0200
Message-Id: <20190913055052.25599-2-christian.gmeiner@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190913055052.25599-1-christian.gmeiner@gmail.com>
References: <20190913055052.25599-1-christian.gmeiner@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jXC2JSeYDwfRzTDWTmvulHeraPlQ3lge32wRaYjTBZI=;
 b=pAMsPgBcYtBzJAqYVIgj1LP8nysURYvTGbxAXtyPU4cqugH9uJT1fgMdCaKcf6wrcv
 JkT2w42BprXACBM/JShBo/c0CgiThyWdqM35FSKY5pUoEpxFqsTjEqqxLsggPrx4fkgV
 0cx+8EMqqUL40BkxCgOKSDPAu0ErLvO/CR5IzsqotQVUSYMyVN27g+o/gHIhWvEvOozz
 YOfc3g8exQWaOLRnCrRgy8fVnQs/CesWfvBN+whWJzIzwlYvhrhyZn+hm2/DpMpo4A6/
 axvvWeXlF8at7OsBUlDh11dX3igTLwuWDv64I5FlNg6Zdr4QdlymDHmuS5gVnueKq6zy
 gxFA==
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
Cc: David Airlie <airlied@linux.ie>, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Russell King <linux+etnaviv@armlinux.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TWlnaHQgYmUgdXNlZnVsIHdoZW4gZGVidWdnaW5nIE1NVSBleGNlcHRpb25zLgoKQ2hhbmdlcyBp
biBWMjoKIC0gVXNlIGEgc3RhdGljIGFycmF5IG9mIHN0cmluZyBmb3IgZXJyb3IgbWVzc2FnZSBh
cyBzdWdnZXN0ZWQKICAgYnkgTHVjYXMgU3RhY2guCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4g
R21laW5lciA8Y2hyaXN0aWFuLmdtZWluZXJAZ21haWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9ldG5hdml2L2V0bmF2aXZfZ3B1LmMgfCAxNSArKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFu
Z2VkLCAxNSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2V0bmF2
aXYvZXRuYXZpdl9ncHUuYyBiL2RyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfZ3B1LmMK
aW5kZXggZDQ3ZDFhOGUwMjE5Li5iOGNkODUxNTNmZTAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9ldG5hdml2L2V0bmF2aXZfZ3B1LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYv
ZXRuYXZpdl9ncHUuYwpAQCAtMTM1MSw2ICsxMzUxLDE1IEBAIHN0YXRpYyB2b2lkIHN5bmNfcG9p
bnRfd29ya2VyKHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yaykKIAogc3RhdGljIHZvaWQgZHVtcF9t
bXVfZmF1bHQoc3RydWN0IGV0bmF2aXZfZ3B1ICpncHUpCiB7CisJc3RhdGljIGNvbnN0IGNoYXIg
KmVycm9yc1tdID0geworCQkic2xhdmUgbm90IHByZXNlbnQiLAorCQkicGFnZSBub3QgcHJlc2Vu
dCIsCisJCSJ3cml0ZSB2aW9sYXRpb24iLAorCQkib3V0IG9mIGJvdW5kIiwKKwkJInJlYWQgc2Vj
dXJpdHkgdmlvbGF0aW9uIiwKKwkJIndyaXRlIHNlY3VyaXR5IHZpb2xhdGlvbiIsCisJfTsKKwog
CXUzMiBzdGF0dXNfcmVnLCBzdGF0dXM7CiAJaW50IGk7CiAKQEAgLTEzNjQsMTAgKzEzNzMsMTYg
QEAgc3RhdGljIHZvaWQgZHVtcF9tbXVfZmF1bHQoc3RydWN0IGV0bmF2aXZfZ3B1ICpncHUpCiAK
IAlmb3IgKGkgPSAwOyBpIDwgNDsgaSsrKSB7CiAJCXUzMiBhZGRyZXNzX3JlZzsKKwkJY29uc3Qg
Y2hhciAqZXJyb3IgPSAidW5rbm93biBzdGF0ZSI7CiAKIAkJaWYgKCEoc3RhdHVzICYgKFZJVlNf
TU1VdjJfU1RBVFVTX0VYQ0VQVElPTjBfX01BU0sgPDwgKGkgKiA0KSkpKQogCQkJY29udGludWU7
CiAKKwkJaWYgKHN0YXR1cyA8IEFSUkFZX1NJWkUoZXJyb3JzKSkKKwkJCWVycm9yID0gZXJyb3Jz
W3N0YXR1c107CisKKwkJZGV2X2Vycl9yYXRlbGltaXRlZChncHUtPmRldiwgIk1NVSAlZCAlc1xu
IiwgaSwgZXJyb3IpOworCiAJCWlmIChncHUtPnNlY19tb2RlID09IEVUTkFfU0VDX05PTkUpCiAJ
CQlhZGRyZXNzX3JlZyA9IFZJVlNfTU1VdjJfRVhDRVBUSU9OX0FERFIoaSk7CiAJCWVsc2UKLS0g
CjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
