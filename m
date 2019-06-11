Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC003C08A
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 02:29:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9AA489150;
	Tue, 11 Jun 2019 00:29:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x74a.google.com (mail-qk1-x74a.google.com
 [IPv6:2607:f8b0:4864:20::74a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5B3089131
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 00:02:40 +0000 (UTC)
Received: by mail-qk1-x74a.google.com with SMTP id u129so9489887qkd.12
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2019 17:02:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=ud/bw4V77SyFt8nVuKDtI0QWt52VBA0pzrjbI+vip8M=;
 b=Z6USQjSZce8DB92i0SzdOZYqGr3Jo+bEkI29rYRJ2IGwuvjgKrYucvIFJsQ2QB06mL
 3TOOUxt9PW7PtvGWGSr0NwtCjo3Vqn2T7Cj48PeRmIUHs7t9ag10FuHDOCF99seKcZYL
 9SixnEQBdMxRTTyQGgTGj76jZauiTq/7Rc05UhE/UO6n4OigEMh2L6VSLaeHthace9z7
 67E9Fz8ITmbCUzMH7Gy7n7UhxBl/2ZxXK9Y3jrrOSkBsrb88zZjqaeSFCPCItRT8gBYY
 QO68iTfCO3LoATUJdqQmBFaQ0Yuyu5AdGdFgpxJizy9O8lIS/+IC3S+gSWCULPuMUATb
 GidA==
X-Gm-Message-State: APjAAAV+DQLz9g7iMe+aODE43FIGJiepDRFx3drS0Hh9RL9rXM0RoRpj
 493tHv4g83Op+MoqDLuBRn/0MLDTVQ==
X-Google-Smtp-Source: APXvYqzn3zeeYknmiyQc0md/9thoqlQOR8cqsPllJeod0MANm1hDOtxcav0Y3UAZFrNPROu0Cl6Xt8VrEA==
X-Received: by 2002:a0c:d196:: with SMTP id e22mr59145391qvh.75.1560211359922; 
 Mon, 10 Jun 2019 17:02:39 -0700 (PDT)
Date: Mon, 10 Jun 2019 17:02:30 -0700
In-Reply-To: <20190611000230.152670-1-fengc@google.com>
Message-Id: <20190611000230.152670-4-fengc@google.com>
Mime-Version: 1.0
References: <20190611000230.152670-1-fengc@google.com>
X-Mailer: git-send-email 2.22.0.rc2.383.gf4fbbf30c2-goog
Subject: [RESEND PATCH v3 3/3] dma-buf: add show_fdinfo handler
From: Chenbo Feng <fengc@google.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
X-Mailman-Approved-At: Tue, 11 Jun 2019 00:29:12 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc;
 bh=ud/bw4V77SyFt8nVuKDtI0QWt52VBA0pzrjbI+vip8M=;
 b=kk0H6vSStPZDlSvOiBcvHmiKt0uyf7U/emu5hBkoxJZNRECCT/9XgONiPtPGsjwXas
 bS00kWKrVTsLWp8R3+OgwCWXL/e1eXwmWtKGR9xWFABhLMH/GP7VbBBbMtAADH8RlJZE
 635ItUZ+EyNMqDFj4wDHYP+iWwYJnUkJq/VLA/sSzagMcv8yNHyzTV/MScQsxg6PMin6
 wcF2o328hOVjuYAJ+ThS0qr+DGDcEFwXIIUjep4YqH6z5nMEUhqoyOvhgORv2+yuKFOk
 w8dNZLUUaOGluYrFhZzDNyKdhIurP5CZhWNJPQQEFUXm0cr1Xn1khoAbcDaw7F2HAEHK
 1uBA==
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
Cc: kernel-team@android.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogR3JlZyBIYWNrbWFubiA8Z2hhY2ttYW5uQGdvb2dsZS5jb20+CgpUaGUgc2hvd19mZGlu
Zm8gaGFuZGxlciBleHBvcnRzIHRoZSBzYW1lIGluZm9ybWF0aW9uIGF2YWlsYWJsZSB0aHJvdWdo
CmRlYnVnZnMgb24gYSBwZXItYnVmZmVyIGJhc2lzLgoKU2lnbmVkLW9mZi1ieTogR3JlZyBIYWNr
bWFubiA8Z2hhY2ttYW5uQGdvb2dsZS5jb20+ClNpZ25lZC1vZmYtYnk6IENoZW5ibyBGZW5nIDxm
ZW5nY0Bnb29nbGUuY29tPgotLS0KIGRyaXZlcnMvZG1hLWJ1Zi9kbWEtYnVmLmMgfCAxNSArKysr
KysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9kbWEtYnVmL2RtYS1idWYuYyBiL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtYnVmLmMK
aW5kZXggYzFkYTVmOWNlNDRkLi5jNGVmYzI3MmZjMzQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZG1h
LWJ1Zi9kbWEtYnVmLmMKKysrIGIvZHJpdmVycy9kbWEtYnVmL2RtYS1idWYuYwpAQCAtMzgxLDYg
KzM4MSwyMCBAQCBzdGF0aWMgbG9uZyBkbWFfYnVmX2lvY3RsKHN0cnVjdCBmaWxlICpmaWxlLAog
CX0KIH0KIAorc3RhdGljIHZvaWQgZG1hX2J1Zl9zaG93X2ZkaW5mbyhzdHJ1Y3Qgc2VxX2ZpbGUg
Km0sIHN0cnVjdCBmaWxlICpmaWxlKQoreworCXN0cnVjdCBkbWFfYnVmICpkbWFidWYgPSBmaWxl
LT5wcml2YXRlX2RhdGE7CisKKwlzZXFfcHJpbnRmKG0sICJzaXplOlx0JXp1XG4iLCBkbWFidWYt
PnNpemUpOworCS8qIERvbid0IGNvdW50IHRoZSB0ZW1wb3JhcnkgcmVmZXJlbmNlIHRha2VuIGlu
c2lkZSBwcm9jZnMgc2VxX3Nob3cgKi8KKwlzZXFfcHJpbnRmKG0sICJjb3VudDpcdCVsZFxuIiwg
ZmlsZV9jb3VudChkbWFidWYtPmZpbGUpIC0gMSk7CisJc2VxX3ByaW50ZihtLCAiZXhwX25hbWU6
XHQlc1xuIiwgZG1hYnVmLT5leHBfbmFtZSk7CisJbXV0ZXhfbG9jaygmZG1hYnVmLT5sb2NrKTsK
KwlpZiAoZG1hYnVmLT5uYW1lKQorCQlzZXFfcHJpbnRmKG0sICJuYW1lOlx0JXNcbiIsIGRtYWJ1
Zi0+bmFtZSk7CisJbXV0ZXhfdW5sb2NrKCZkbWFidWYtPmxvY2spOworfQorCiBzdGF0aWMgY29u
c3Qgc3RydWN0IGZpbGVfb3BlcmF0aW9ucyBkbWFfYnVmX2ZvcHMgPSB7CiAJLnJlbGVhc2UJPSBk
bWFfYnVmX3JlbGVhc2UsCiAJLm1tYXAJCT0gZG1hX2J1Zl9tbWFwX2ludGVybmFsLApAQCAtMzkw
LDYgKzQwNCw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZmlsZV9vcGVyYXRpb25zIGRtYV9idWZf
Zm9wcyA9IHsKICNpZmRlZiBDT05GSUdfQ09NUEFUCiAJLmNvbXBhdF9pb2N0bAk9IGRtYV9idWZf
aW9jdGwsCiAjZW5kaWYKKwkuc2hvd19mZGluZm8JPSBkbWFfYnVmX3Nob3dfZmRpbmZvLAogfTsK
IAogLyoKLS0gCjIuMjIuMC5yYzIuMzgzLmdmNGZiYmYzMGMyLWdvb2cKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
