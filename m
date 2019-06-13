Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BEDE455C0
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 09:23:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 286C489533;
	Fri, 14 Jun 2019 07:21:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x849.google.com (mail-qt1-x849.google.com
 [IPv6:2607:f8b0:4864:20::849])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ED1589356
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 22:34:20 +0000 (UTC)
Received: by mail-qt1-x849.google.com with SMTP id 97so444024qtb.16
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 15:34:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=LEbx6Py1LlxNnYNfMUQLEHmXYGAjBktMwzf11o00qiQ=;
 b=pzw5VNwFwL+neUO/0GybSILme1+wuJh93TdNI0No7GCFegjBTmhjMK2pfr3CUm4GBC
 Xa3oSXz3Xx/28pH7hOQD9uGmTDFl0Lc+GJNLh/ona72WTmOH3Gp94agj9jnsuC3eNRSj
 m6/rKywEaNFD3ohMiiftcp/jW5dcVYSGIyMMqIjlfQLkmpo0OCAkWhAFvMakL80Zy/Sf
 kx+DJ8699RtbSBJ3TID2XkQ1Kq7gU2c4N9n2aTdRmHEAZ1EGteRrytLxAhPLHIwwVeaQ
 bA7soskQ1ruPqZQd77FHEor3l/ppWgEgmlPcsX7svV4d1QUJe++qWQ0U+Nw8Sb6HH1EX
 a4VA==
X-Gm-Message-State: APjAAAUtH3ewNQt1pYATPekCypd3bVSTv2OpMrPtwOUaHduXiJz8HIMf
 UQfFQMU4I96HpQoGYEJicjn3RlS3Mw==
X-Google-Smtp-Source: APXvYqzPVM+hxKCGgOVop12/mUhf51zpio33hHg87tz8aaGPy+G5h7ILBQFuMHAA1crz0uCPLsKvZ9lqaw==
X-Received: by 2002:a0c:d196:: with SMTP id e22mr5472255qvh.75.1560465259477; 
 Thu, 13 Jun 2019 15:34:19 -0700 (PDT)
Date: Thu, 13 Jun 2019 15:34:08 -0700
In-Reply-To: <20190613223408.139221-1-fengc@google.com>
Message-Id: <20190613223408.139221-4-fengc@google.com>
Mime-Version: 1.0
References: <20190613223408.139221-1-fengc@google.com>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
Subject: [PATCH v5 3/3] dma-buf: add show_fdinfo handler
From: Chenbo Feng <fengc@google.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
X-Mailman-Approved-At: Fri, 14 Jun 2019 07:21:24 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc;
 bh=LEbx6Py1LlxNnYNfMUQLEHmXYGAjBktMwzf11o00qiQ=;
 b=Smy3Jh0xPWHxt5WDJ+8KkM+LzEnH7FyKOFRSiuheeGSq98m3pPRdHAqXEezsiMyAbX
 1h4Uqu90fX9XGFJZwaDpIJGGL+QNNxoCI0Jdr6XBxHiS9fCvNMKc+RtJGZbq9JNibFdQ
 Buruwhxy9ly9ARec8g9nh9YNono+ejunCF26DFpBY3UFknHuMr16eMHyiYH/7sHg18xO
 3AcP7YZU7rRfP5sniNezbdqmdA7tNJgEh/s8YmsiPBXOjyzcWAGFHCUmdn1v+yk2Ff+O
 B4pPLKgZuC/08CFWCguu+2yNzdZ8oxCTdJxtBsekaTar8Ydc5dl0iMrnBm9xABuYz7Ei
 Jzlw==
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
aW5kZXggMmM4NjJlMzZjOTQ3Li40OWE1Y2I3YzcwNWQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZG1h
LWJ1Zi9kbWEtYnVmLmMKKysrIGIvZHJpdmVycy9kbWEtYnVmL2RtYS1idWYuYwpAQCAtMzk3LDYg
KzM5NywyMCBAQCBzdGF0aWMgbG9uZyBkbWFfYnVmX2lvY3RsKHN0cnVjdCBmaWxlICpmaWxlLAog
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
bWFfYnVmX3JlbGVhc2UsCiAJLm1tYXAJCT0gZG1hX2J1Zl9tbWFwX2ludGVybmFsLApAQCAtNDA2
LDYgKzQyMCw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZmlsZV9vcGVyYXRpb25zIGRtYV9idWZf
Zm9wcyA9IHsKICNpZmRlZiBDT05GSUdfQ09NUEFUCiAJLmNvbXBhdF9pb2N0bAk9IGRtYV9idWZf
aW9jdGwsCiAjZW5kaWYKKwkuc2hvd19mZGluZm8JPSBkbWFfYnVmX3Nob3dfZmRpbmZvLAogfTsK
IAogLyoKLS0gCjIuMjIuMC40MTAuZ2Q4ZmRiZTIxYjUtZ29vZwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
