Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4AC642B8
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2019 09:26:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3705289C3B;
	Wed, 10 Jul 2019 07:25:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EB0E6E06D
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2019 14:53:24 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id n11so21883148qtl.5
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jul 2019 07:53:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YbsGaS1BVbJ+f3VVB6My2e8DPp6j8hXOIEffynol0Ok=;
 b=rpazJMj3AXNAhToGhOA/5ELbplW1Rj4dxhQ5Z01NScUnHsAirdzjsxIHSCLeTjufxC
 HkBWOQj4aR+Y7UYTq+hl2QhBh9pPlK6sJPNHd7UnhCaP7ceN64j2UmRINWyeDekaQQPk
 lAiBnXAKbFuu3UYj/mvfzyvmzcqvEOVo1/FdWtYIXu1eodubk09l3MkLMf8jd1jH7fNL
 Urs1Lmg/W/NrseYsm5vIx/A9WT8RtLgsA8ChzAaM/uMvkOq3RqM8FMJRtkvoEj2JOHDW
 mE+YVXSKK7Fl3bhR8K8qBY+GfnBkS2sYo6Q9awPsEjmSW+mIdLCiPFHy19qjiQSYdlmx
 j5tg==
X-Gm-Message-State: APjAAAXJDFU8ulK6yEZfIc/noy5cmEaRhKNN23Sfgu15X3FJmGcXkavD
 bUZERl7V9WjL+uvMSS2wrQA=
X-Google-Smtp-Source: APXvYqwbU2+yK2jTnkJvrpeIWH19D9iyd+/+yn4kHi335O5rSYQCwV6LlRPM6TTPp5MXcPkWBRFuqQ==
X-Received: by 2002:a05:6214:3f0:: with SMTP id
 cf16mr19329542qvb.211.1562684002950; 
 Tue, 09 Jul 2019 07:53:22 -0700 (PDT)
Received: from localhost.localdomain (ppp79-139-233-208.pppoe.spdop.ru.
 [79.139.233.208])
 by smtp.gmail.com with ESMTPSA id x46sm9667276qtx.96.2019.07.09.07.53.20
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Jul 2019 07:53:22 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>
Subject: [PATCH v1] drm/modes: Skip invalid cmdline mode
Date: Tue,  9 Jul 2019 17:51:51 +0300
Message-Id: <20190709145151.23086-1-digetx@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 10 Jul 2019 07:25:20 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YbsGaS1BVbJ+f3VVB6My2e8DPp6j8hXOIEffynol0Ok=;
 b=pXmFco6SOoagS7jQFlMht0LwTgnpY+87Ybjy0HLOGFQ+LsPExFi8j1H3T5RXHqDp2l
 UByeml2I0IuXGS6j8C1peLZYmsXYcbgF2233PzQK4HIvDX+muI9ED9zPcxazOC6PuB7q
 Dia4ZhKXjxJ0VE+nprtXPo7l4ZxpLvSy11veYqg/nMFp9VtydK5mmuCPmIlwTVc7/E3M
 mAd71PJ3xUJMW5RjVh+KL2zwfLB8bA79mnw8vUv/cVJCsnKOFnNCqPESPUll/og01Vs8
 OT6CJvNdtxgWVzhNWeA1wqmaJgpCFJqeNmQrHEF6AbqM+jbhTvbCTP4UHdTst1sPDSra
 7dwQ==
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIG5hbWVkIG1vZGUgY291bGQgYmUgaW52YWxpZCBhbmQgdGhlbiBjbWRsaW5lIHBhcnNlciBt
aXNzZXMgdG8gdmFsaWRhdGUKbW9kZSdzIGRpbWVuc2lvbnMsIGhhcHBpbHkgYWRkaW5nIDB4MCBt
b2RlIGFzIGEgdmFsaWQgbW9kZS4gT25lIGNhc2Ugd2hlcmUKdGhpcyBoYXBwZW5zIGlzIE5WSURJ
QSBUZWdyYSBkZXZpY2VzIHRoYXQgYXJlIHVzaW5nIGRvd25zdHJlYW0gYm9vdGxvYWRlcgp3aGlj
aCBhZGRzICJ2aWRlbz10ZWdyYWZiIiB0byB0aGUga2VybmVsJ3MgY21kbGluZSBhbmQgdGh1cyB1
cHN0cmVhbSBUZWdyYQpEUk0gZHJpdmVyIGZhaWxzIHRvIHByb2JlIGJlY2F1c2Ugb2YgdGhlIGlu
dmFsaWQgbW9kZS4KCkZpeGVzOiAzYWVlYjEzZDg5OTYgKCJkcm0vbW9kZXM6IFN1cHBvcnQgbW9k
ZXMgbmFtZXMgb24gdGhlIGNvbW1hbmQgbGluZSIpClNpZ25lZC1vZmYtYnk6IERtaXRyeSBPc2lw
ZW5rbyA8ZGlnZXR4QGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2NsaWVudF9t
b2Rlc2V0LmMgfCAzICsrLQogZHJpdmVycy9ncHUvZHJtL2RybV9tb2Rlcy5jICAgICAgICAgIHwg
NiArKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9jbGllbnRfbW9kZXNldC5jIGIvZHJp
dmVycy9ncHUvZHJtL2RybV9jbGllbnRfbW9kZXNldC5jCmluZGV4IGU5NWZjZWFjOGY4Yi4uNTZk
MzY3NzlkMjEzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2NsaWVudF9tb2Rlc2V0
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9jbGllbnRfbW9kZXNldC5jCkBAIC0xODAsNyAr
MTgwLDggQEAgZHJtX2Nvbm5lY3Rvcl9waWNrX2NtZGxpbmVfbW9kZShzdHJ1Y3QgZHJtX2Nvbm5l
Y3RvciAqY29ubmVjdG9yKQogCiBjcmVhdGVfbW9kZToKIAltb2RlID0gZHJtX21vZGVfY3JlYXRl
X2Zyb21fY21kbGluZV9tb2RlKGNvbm5lY3Rvci0+ZGV2LCBjbWRsaW5lX21vZGUpOwotCWxpc3Rf
YWRkKCZtb2RlLT5oZWFkLCAmY29ubmVjdG9yLT5tb2Rlcyk7CisJaWYgKG1vZGUpCisJCWxpc3Rf
YWRkKCZtb2RlLT5oZWFkLCAmY29ubmVjdG9yLT5tb2Rlcyk7CiAKIAlyZXR1cm4gbW9kZTsKIH0K
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fbW9kZXMuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fbW9kZXMuYwppbmRleCA5MTA1NjFkNGYwNzEuLjc0YTU3MzlkZjUwNiAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2RybV9tb2Rlcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1f
bW9kZXMuYwpAQCAtMTU4LDYgKzE1OCw5IEBAIHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICpkcm1f
Y3Z0X21vZGUoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgaW50IGhkaXNwbGF5LAogCWludCBpbnRl
cmxhY2U7CiAJdTY0IHRtcDsKIAorCWlmICghaGRpc3BsYXkgfHwgIXZkaXNwbGF5KQorCQlyZXR1
cm4gTlVMTDsKKwogCS8qIGFsbG9jYXRlIHRoZSBkcm1fZGlzcGxheV9tb2RlIHN0cnVjdHVyZS4g
SWYgZmFpbHVyZSwgd2Ugd2lsbAogCSAqIHJldHVybiBkaXJlY3RseQogCSAqLwpAQCAtMzkyLDYg
KzM5NSw5IEBAIGRybV9ndGZfbW9kZV9jb21wbGV4KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIGlu
dCBoZGlzcGxheSwgaW50IHZkaXNwbGF5LAogCWludCBoc3luYywgaGZyb250X3BvcmNoLCB2b2Rk
X2Zyb250X3BvcmNoX2xpbmVzOwogCXVuc2lnbmVkIGludCB0bXAxLCB0bXAyOwogCisJaWYgKCFo
ZGlzcGxheSB8fCAhdmRpc3BsYXkpCisJCXJldHVybiBOVUxMOworCiAJZHJtX21vZGUgPSBkcm1f
bW9kZV9jcmVhdGUoZGV2KTsKIAlpZiAoIWRybV9tb2RlKQogCQlyZXR1cm4gTlVMTDsKLS0gCjIu
MjIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
