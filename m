Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EFCD15E0B
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2019 09:20:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26A1089DB0;
	Tue,  7 May 2019 07:20:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc49.google.com (mail-yw1-xc49.google.com
 [IPv6:2607:f8b0:4864:20::c49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A88589A0F
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2019 16:31:57 +0000 (UTC)
Received: by mail-yw1-xc49.google.com with SMTP id 201so26172008ywr.13
 for <dri-devel@lists.freedesktop.org>; Mon, 06 May 2019 09:31:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=40kxRsKyA2BTdfRG/8ycbW9cjWXHDWQTNAmN4QMp2Tc=;
 b=E+V+wgZYDyDIdVPzCVjuM9Zr3srgzsyB5r/6SXczS/GgUSox40UESE6UetYBwJtya9
 b23Lx7+ka70xsGUtfHjpG87qnvCSRlBS1Gx9yPaz++QLRSYBfZz4HHmFFdG8RV9bQu3w
 x+p1jpHVM0EZlzfwxAW10AuBMvtjD6sqMu8LFj1p7JQ5AavPX2jRJ8odUsecsOySH34Y
 VGrgNgYZumQBb3H3GlI5NQFjLFOn+mewsH1SE1e/DvRPog3sk5DvdgV0mlzTfF/P4wRD
 Mpvvq2dvfvtcjzbC2Ti7JH+SLhEDuCFWpVXm6QNhpasuPeNEnLbAb233NxmmA5yzGedw
 ul7Q==
X-Gm-Message-State: APjAAAVuBUVoPYQUyySCugO1I1JsK4KLePW8C+KQOFZ1K9OFGiuKEs3J
 K52Rw4VDcRYZeLi9loGvsaDe7pQ7cUsa5G3h
X-Google-Smtp-Source: APXvYqy7sMh67zqP2gW9MSWmQP0vNhHkuufaU8XQ9cxxJZb1a1Qrmr7t2Ui4wSymuQ40ovJdWXqcMvlrm4Ub8jqq
X-Received: by 2002:a25:c5c8:: with SMTP id v191mr18795942ybe.52.1557160316771; 
 Mon, 06 May 2019 09:31:56 -0700 (PDT)
Date: Mon,  6 May 2019 18:31:02 +0200
In-Reply-To: <cover.1557160186.git.andreyknvl@google.com>
Message-Id: <69a675a5c48fa2572162338c51a1bfa2a3ced27d.1557160186.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1557160186.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
Subject: [PATCH v15 16/17] vfio/type1,
 arm64: untag user pointers in vaddr_get_pfn
From: Andrey Konovalov <andreyknvl@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org, 
 linux-media@vger.kernel.org, kvm@vger.kernel.org, 
 linux-kselftest@vger.kernel.org
X-Mailman-Approved-At: Tue, 07 May 2019 07:20:13 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc;
 bh=40kxRsKyA2BTdfRG/8ycbW9cjWXHDWQTNAmN4QMp2Tc=;
 b=CbTDaybxwiO68FYaqEU987JbmTIWC/O/zmn5u4LAT2NjIg4zrx3ZZpTdEat2IZI7Zr
 UMjh3JrD6tSSJSHiA2J1SvwKqxkOFH9jD5t4pSSsFkT8XO0YzO5s2D93y2Fvv558QDT8
 PC2RKfy08bb/yMf67M9jkhQd5jNijh0tU+IEPR6RStdwOkRtKLjro1177XiqKVVA8CKn
 7nvBlr71nBnQ+GeGRfOaL9uXIjXsWpEFZPxFZ6iufv0v5siPwgW5vA64wYvStilJ/+ml
 T4dkOygYLm3ryZPhfxVQJsF9+4XGOGyyv3U3USZs8bMzVBnZRwvcMGmsqol00hqY8fWp
 TxbQ==
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
Cc: Mark Rutland <mark.rutland@arm.com>, Szabolcs Nagy <Szabolcs.Nagy@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>,
 Kostya Serebryany <kcc@google.com>, Felix Kuehling <Felix.Kuehling@amd.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 Dave Martin <Dave.Martin@arm.com>, Evgeniy Stepanov <eugenis@google.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>, Kees Cook <keescook@chromium.org>,
 Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Andrey Konovalov <andreyknvl@google.com>, Lee Smith <Lee.Smith@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yishai Hadas <yishaih@mellanox.com>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Alexander Deucher <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, Robin Murphy <robin.murphy@arm.com>,
 Christian Koenig <Christian.Koenig@amd.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaCBpcyBhIHBhcnQgb2YgYSBzZXJpZXMgdGhhdCBleHRlbmRzIGFybTY0IGtlcm5l
bCBBQkkgdG8gYWxsb3cgdG8KcGFzcyB0YWdnZWQgdXNlciBwb2ludGVycyAod2l0aCB0aGUgdG9w
IGJ5dGUgc2V0IHRvIHNvbWV0aGluZyBlbHNlIG90aGVyCnRoYW4gMHgwMCkgYXMgc3lzY2FsbCBh
cmd1bWVudHMuCgp2YWRkcl9nZXRfcGZuKCkgdXNlcyBwcm92aWRlZCB1c2VyIHBvaW50ZXJzIGZv
ciB2bWEgbG9va3Vwcywgd2hpY2ggY2FuCm9ubHkgYnkgZG9uZSB3aXRoIHVudGFnZ2VkIHBvaW50
ZXJzLgoKVW50YWcgdXNlciBwb2ludGVycyBpbiB0aGlzIGZ1bmN0aW9uLgoKU2lnbmVkLW9mZi1i
eTogQW5kcmV5IEtvbm92YWxvdiA8YW5kcmV5a252bEBnb29nbGUuY29tPgotLS0KIGRyaXZlcnMv
dmZpby92ZmlvX2lvbW11X3R5cGUxLmMgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy92ZmlvL3ZmaW9faW9tbXVfdHlwZTEuYyBiL2Ry
aXZlcnMvdmZpby92ZmlvX2lvbW11X3R5cGUxLmMKaW5kZXggZDBmNzMxYzk5MjBhLi41ZGFhOTY2
ZDc5OWUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdmZpby92ZmlvX2lvbW11X3R5cGUxLmMKKysrIGIv
ZHJpdmVycy92ZmlvL3ZmaW9faW9tbXVfdHlwZTEuYwpAQCAtMzgyLDYgKzM4Miw4IEBAIHN0YXRp
YyBpbnQgdmFkZHJfZ2V0X3BmbihzdHJ1Y3QgbW1fc3RydWN0ICptbSwgdW5zaWduZWQgbG9uZyB2
YWRkciwKIAogCWRvd25fcmVhZCgmbW0tPm1tYXBfc2VtKTsKIAorCXZhZGRyID0gdW50YWdnZWRf
YWRkcih2YWRkcik7CisKIAl2bWEgPSBmaW5kX3ZtYV9pbnRlcnNlY3Rpb24obW0sIHZhZGRyLCB2
YWRkciArIDEpOwogCiAJaWYgKHZtYSAmJiB2bWEtPnZtX2ZsYWdzICYgVk1fUEZOTUFQKSB7Ci0t
IAoyLjIxLjAuMTAyMC5nZjI4MjBjZjAxYS1nb29nCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
