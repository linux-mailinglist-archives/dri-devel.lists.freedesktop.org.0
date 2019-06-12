Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B06AB43383
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 09:29:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14AA6893B9;
	Thu, 13 Jun 2019 07:28:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x24a.google.com (mail-oi1-x24a.google.com
 [IPv6:2607:f8b0:4864:20::24a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD3E689255
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 21:48:34 +0000 (UTC)
Received: by mail-oi1-x24a.google.com with SMTP id t198so6028811oih.20
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 14:48:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=xFZI9Cn8XQ9WD/uM2zeIjsdArEKjTB6MEJpCpF8H2cY=;
 b=Yb0kfnphvJpARkZEYpoV8WdHFu8YkW8lZ1aomaua75sQP3jfWB9lIkhXtSK7MQ01vz
 +XkhgDJxrF9HuI2r7NNzAPHcb/VSu4xE62poHQUw8esWXT1/wcMdhKTP5P4n6sCHhwz/
 kY406ExKg0NTZjvDGPbUdq6Nh2Qg8qs8Fdy0i9Jq6/4XU1xop8/NOG6fgD3dogykYLXJ
 rKphL1D2RZdZOqgtPc8XeNNYq7Ha57VgYz8KOyCl3qphYnGQhLUZ9XV2Vwelx1FdbjDV
 xcw7Z2EDN3dWOkyVTlftsm3Dcs62GWGZkBG2FIvXO6Nl4zqF19er/5d8OvwV2OoTZFnX
 2yRQ==
X-Gm-Message-State: APjAAAUfH6OsPamUBbETKBpbeaC6H0LI1hgfPcCOafevyrOVdWbI2Enf
 OmUrdbp1Wxr695ljOu0nupDgIMM0mA==
X-Google-Smtp-Source: APXvYqxn5WIL38quMvWm0NFNVoCMoq509G4lVulP6aIh3DMM/7wKweu86NGynkKEkLolsMXyoApH36EYpQ==
X-Received: by 2002:a9d:7650:: with SMTP id o16mr19689292otl.0.1560376114065; 
 Wed, 12 Jun 2019 14:48:34 -0700 (PDT)
Date: Wed, 12 Jun 2019 14:48:23 -0700
In-Reply-To: <20190612214823.251491-1-fengc@google.com>
Message-Id: <20190612214823.251491-4-fengc@google.com>
Mime-Version: 1.0
References: <20190612214823.251491-1-fengc@google.com>
X-Mailer: git-send-email 2.22.0.rc2.383.gf4fbbf30c2-goog
Subject: [PATCH v4 3/3] dma-buf: add show_fdinfo handler
From: Chenbo Feng <fengc@google.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
X-Mailman-Approved-At: Thu, 13 Jun 2019 07:27:23 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc;
 bh=xFZI9Cn8XQ9WD/uM2zeIjsdArEKjTB6MEJpCpF8H2cY=;
 b=svuswpTBA4Vx+DLei1h+oVomOQmLsZNHTti0CIQZQVpzQDIyHeME0lAHPve5gT8exd
 E79eA8Ev5/qmWH+q1GOZI/aoxL+R3S0AW9XY83rHhXMkYf3xYQNqMgX+ONGiiVasflGI
 eI4w2zUXmOl99uOnNm49b46Ho4C7q5YMdGb57vi+f+sAvCHkeXb/szZbGc1dYp0RHLUX
 Bb7SqaKZDqXDMG/xtvv6j+JphFCnnBeglrzOcsw04pOqmrnqEZOKJYQBPtYglaBDlDdo
 k8HUtS4ismdMPZzP+d61mUgOI2udfdS0JqERvV7uLB3RxgaFRt3+YQiwnIdWGJ5Hgvtl
 5Usw==
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
aW5kZXggODdhOTI4YzkzYzFhLi5mZjg0MjE2NjgzMzEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZG1h
LWJ1Zi9kbWEtYnVmLmMKKysrIGIvZHJpdmVycy9kbWEtYnVmL2RtYS1idWYuYwpAQCAtMzk2LDYg
KzM5NiwyMCBAQCBzdGF0aWMgbG9uZyBkbWFfYnVmX2lvY3RsKHN0cnVjdCBmaWxlICpmaWxlLAog
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
bWFfYnVmX3JlbGVhc2UsCiAJLm1tYXAJCT0gZG1hX2J1Zl9tbWFwX2ludGVybmFsLApAQCAtNDA1
LDYgKzQxOSw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZmlsZV9vcGVyYXRpb25zIGRtYV9idWZf
Zm9wcyA9IHsKICNpZmRlZiBDT05GSUdfQ09NUEFUCiAJLmNvbXBhdF9pb2N0bAk9IGRtYV9idWZf
aW9jdGwsCiAjZW5kaWYKKwkuc2hvd19mZGluZm8JPSBkbWFfYnVmX3Nob3dfZmRpbmZvLAogfTsK
IAogLyoKLS0gCjIuMjIuMC5yYzIuMzgzLmdmNGZiYmYzMGMyLWdvb2cKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
