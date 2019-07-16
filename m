Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D36996ADD7
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2019 19:45:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09C186E15D;
	Tue, 16 Jul 2019 17:45:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E6636E11C;
 Tue, 16 Jul 2019 17:45:50 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id ay6so10477738plb.9;
 Tue, 16 Jul 2019 10:45:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Xhvxxodyt4FVnA+Q4PptUiZxNmKTKZXnvXrsa2hJq/o=;
 b=RgZPr2vOgz0bzB7QvnTeSrBToqw/XDWpsx1O7tNGtEkW51en7iaOMXkgsuLg7+z+My
 o67DPI2+yRpIqSUBAWqowcHElo7DMqMYPP655rtkMcX7IZbtJL93lk9vWU22l72j2ore
 9BiwzUFWyMI2YG9bAwzggSM1mQy67BuRg9fiTqORBRjfwHgeI715sZxt+8hnT0+OvXD9
 bBCIht46LCLPLErFnstmmeABDWSn1ktaQmynzFnX2n2lnrP7CTfYCjSGYxBOvuPmrqYl
 3W04bbrQ2GH7xoN1ZXa9GfmYnD6eWT8Fk8wslukLUDIL1i76g9SJmtGDjvG+OcGUbb+F
 DtPA==
X-Gm-Message-State: APjAAAV8+7IYNxlHbu0ryviUlNExylKbmLyCDpVnWJffI1JNlqYVTQXR
 3I0VGKhxHIAeIiERRXHMcDYIMojOMHk=
X-Google-Smtp-Source: APXvYqyvLxSlL5GDt6wdl98KfA3lI5LIyr/lONf5ccilGqUx3VHCMUUVQyBqHX3SfEBLwglwuoop9A==
X-Received: by 2002:a17:902:3081:: with SMTP id
 v1mr38149628plb.169.1563299149369; 
 Tue, 16 Jul 2019 10:45:49 -0700 (PDT)
Received: from localhost ([100.118.89.203])
 by smtp.gmail.com with ESMTPSA id g62sm21681297pje.11.2019.07.16.10.45.48
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 16 Jul 2019 10:45:48 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/3] drm/gem: don't force writecombine mmap'ing
Date: Tue, 16 Jul 2019 10:43:21 -0700
Message-Id: <20190716174331.7371-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Xhvxxodyt4FVnA+Q4PptUiZxNmKTKZXnvXrsa2hJq/o=;
 b=mlimn4TLRvW/lqjE5coN8thyz8i9X1tiCMaNdAFPB/0qvOyooTYEfXXXG4+yFGsgDW
 +YfqxLFliWAsIcSE14CkOb6NQYkgIreCHQOSuiTEVluUu6oZgsfO4ZxXxNpA0Nob9avD
 Ts1pCcQaQMALo0p6x0WOMlXoEKAIlo/vxHCbaOs5UjJQYEx/S402jWpC5JAjchqkbIMn
 1+gGiHhCvzyfPrVegyPK/FEhwzEUfWClX2kBC/vQZOkWuXUbqI/s2WUZcvJRwBfbfANO
 xiOeWvdsPLkBhRbiKEVwmjyWo5D1Xb5+McYTgNjFX0aMeZyJp0XPn0UQNqRpGtg8UwLM
 V3zQ==
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
Cc: Rob Clark <robdclark@chromium.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgoKVGhlIGRyaXZlciBzaG91
bGQgYmUgaW4gY29udHJvbCBvZiB0aGlzLgoKU2lnbmVkLW9mZi1ieTogUm9iIENsYXJrIDxyb2Jk
Y2xhcmtAY2hyb21pdW0ub3JnPgotLS0KSXQgaXMgcG9zc2libGUgdGhhdCB0aGlzIHdhcyBtYXNr
aW5nIGJ1Z3MgKGllLiBub3Qgc2V0dGluZyBhcHByb3ByaWF0ZQpwZ3Byb3QpIGluIGRyaXZlcnMu
ICBJIGRvbid0IGhhdmUgYSBwYXJ0aWN1bGFybHkgZ29vZCBpZGVhIGZvciB0cmFja2luZwp0aG9z
ZSBkb3duIChzaW5jZSBJIGRvbid0IGhhdmUgdGhlIGh3IGZvciBtb3N0IGRyaXZlcnMpLiAgVW5s
ZXNzIHNvbWVvbmUKaGFzIGEgYmV0dGVyIGlkZWEsIG1heWJlIGxhbmQgdGhpcyBhbmQgbGV0IGRy
aXZlciBtYWludGFpbmVycyBmaXggYW55CnBvdGVudGlhbCBmYWxsb3V0IGluIHRoZWlyIGRyaXZl
cnM/CgpUaGlzIGlzIG5lY2Vzc2FyeSBmb3IgdGhlIGxhc3QgcGF0Y2ggdG8gZml4IFZHRU0gYnJv
a2VubmVzcyBvbiBhcm0uCgogZHJpdmVycy9ncHUvZHJtL2RybV9nZW0uYyB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fZ2VtLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbS5jCmluZGV4
IDhhNTVmNzEzMjViMS4uN2Q2MjQyY2M2OWYyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2dlbS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtLmMKQEAgLTExMTAsNyArMTEx
MCw3IEBAIGludCBkcm1fZ2VtX21tYXBfb2JqKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqLCB1
bnNpZ25lZCBsb25nIG9ial9zaXplLAogCiAJdm1hLT52bV9mbGFncyB8PSBWTV9JTyB8IFZNX1BG
Tk1BUCB8IFZNX0RPTlRFWFBBTkQgfCBWTV9ET05URFVNUDsKIAl2bWEtPnZtX3ByaXZhdGVfZGF0
YSA9IG9iajsKLQl2bWEtPnZtX3BhZ2VfcHJvdCA9IHBncHJvdF93cml0ZWNvbWJpbmUodm1fZ2V0
X3BhZ2VfcHJvdCh2bWEtPnZtX2ZsYWdzKSk7CisJdm1hLT52bV9wYWdlX3Byb3QgPSB2bV9nZXRf
cGFnZV9wcm90KHZtYS0+dm1fZmxhZ3MpOwogCXZtYS0+dm1fcGFnZV9wcm90ID0gcGdwcm90X2Rl
Y3J5cHRlZCh2bWEtPnZtX3BhZ2VfcHJvdCk7CiAKIAkvKiBUYWtlIGEgcmVmIGZvciB0aGlzIG1h
cHBpbmcgb2YgdGhlIG9iamVjdCwgc28gdGhhdCB0aGUgZmF1bHQKLS0gCjIuMjEuMAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
