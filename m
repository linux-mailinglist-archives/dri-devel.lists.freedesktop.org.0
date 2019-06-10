Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD9B3C082
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 02:29:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29D8089132;
	Tue, 11 Jun 2019 00:29:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x84a.google.com (mail-qt1-x84a.google.com
 [IPv6:2607:f8b0:4864:20::84a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AD4489109
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2019 23:52:12 +0000 (UTC)
Received: by mail-qt1-x84a.google.com with SMTP id r58so10390635qtb.5
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2019 16:52:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=ud/bw4V77SyFt8nVuKDtI0QWt52VBA0pzrjbI+vip8M=;
 b=pj2OMazKda5drJsGepOYayXtDPDYw90l/12Zo4hrsHShQw7V2jB8TtfXjYtd2gyy6J
 j3yu/j6Vp608dQITT1hG9t8FNkST5j3An1EeD0GZvv+ubZ4sZowEkiDkpThibWir1Yun
 14cjOKUNxQ7mGcqFQTnpAY2m/CupJlsAQ7sk8LvM9Luz8sO/olCbvOhbSwdpeHyI6cqE
 P0RXVEPFD+9JL2r+U/o5qMhW/gMWrSEQdB90nYFrk5YcQ7T+Ko+poZoWG+2V1jpzbY0Z
 9uTk+J1AQFj6ud7JwWl387JruHuxnA2nZrg3Q8hCZieFVUU8dZ7t3cJClaeLjrSEE4p5
 fl8A==
X-Gm-Message-State: APjAAAUA6rJX2m1dcRmunlRCy2NPOKMovWB329rHbuMOArrOsOL5lyJC
 W7Gpas3BL7K1sXbXIx/nM+guxlztTA==
X-Google-Smtp-Source: APXvYqzmXbzsD3tHKHiIsN5XXzhsSJvjTCuBQqiKTV7myw/rxhDuWjYx7IJNlPfLcNFc2OLFeWBMMGJi/Q==
X-Received: by 2002:a0c:81e7:: with SMTP id 36mr26133271qve.5.1560210731131;
 Mon, 10 Jun 2019 16:52:11 -0700 (PDT)
Date: Mon, 10 Jun 2019 16:52:01 -0700
In-Reply-To: <20190610235201.145457-1-fengc@google.com>
Message-Id: <20190610235201.145457-4-fengc@google.com>
Mime-Version: 1.0
References: <20190610235201.145457-1-fengc@google.com>
X-Mailer: git-send-email 2.22.0.rc2.383.gf4fbbf30c2-goog
Subject: [RESEND PATCH v3 3/3] dma-buf: add show_fdinfo handler
From: Chenbo Feng <fengc@google.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 --validate@google.com
X-Mailman-Approved-At: Tue, 11 Jun 2019 00:29:12 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc;
 bh=ud/bw4V77SyFt8nVuKDtI0QWt52VBA0pzrjbI+vip8M=;
 b=KAN6/KWKmZUHGkzA9fGRB0gmQg1st991k9TnAZHO0PVnyG/tFwNFeClhlR8QIhgMmc
 ySp4Mjm1oKbocU4TYzPvBXKryJNQRzJs4yKNjRX3Xj626CmIKFKPE1k4/auhPTABTjDm
 bAObuyqNR78lPx6zonAIzf8sku2qHPqRzC7PYxP8BRy7uvvxcKvHFlOMz/Nvi8CbMuyR
 d69Hr+YKWiC/nBr5l7sBAi5IvsgKQH4zr65RTFj8q75fQic4bswDtYm7DjNq741gTMdA
 aWZooTU7blyJslshfe86WWadiZ3w9pNuRcRgtdeQdcsEVrMkJa2d3/KUI9VsQivIV+4W
 +wFw==
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
